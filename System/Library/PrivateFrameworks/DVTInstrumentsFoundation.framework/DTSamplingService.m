@implementation DTSamplingService

+ (void)registerCapabilities:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.sampling"), 11, a1);
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.sampling.immediate"), 1, a1);
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.sampling.deferred"), 1, a1);
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.coresampling"), 10, a1);

}

- (DTSamplingService)initWithChannel:(id)a3
{
  DTSamplingService *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DTSamplingService;
  result = -[DTXService initWithChannel:](&v4, sel_initWithChannel_, a3);
  if (result)
  {
    result->_samplingRate = 100000;
    result->_outputRate = 200000;
  }
  return result;
}

- (void)dealloc
{
  unint64_t *backtraceBuffer;
  mach_port_name_t task;
  objc_super v5;

  backtraceBuffer = self->_backtraceBuffer;
  if (backtraceBuffer)
  {
    free(backtraceBuffer);
    self->_backtraceBuffer = 0;
  }
  if (self->_context)
  {
    destroy_sampling_context();
    self->_context = 0;
  }
  task = self->_task;
  if (task + 1 >= 2)
    mach_port_deallocate(*MEMORY[0x24BDAEC58], task);
  v5.receiver = self;
  v5.super_class = (Class)DTSamplingService;
  -[DTSamplingService dealloc](&v5, sel_dealloc);
}

- (void)setSamplingRate:(id)a3
{
  self->_samplingRate = objc_msgSend(a3, "unsignedLongLongValue");
}

- (void)setOutputRate:(id)a3
{
  unint64_t v4;
  unint64_t samplingRate;

  v4 = objc_msgSend(a3, "unsignedLongLongValue");
  self->_outputRate = v4;
  samplingRate = self->_samplingRate;
  if (v4 > samplingRate)
    samplingRate = v4;
  self->_outputRate = samplingRate;
}

- (void)setTargetPid:(id)a3
{
  uint64_t v4;
  unsigned int v5;

  v4 = objc_msgSend(a3, "intValue");
  v5 = +[DTInstrumentServer taskForPid:](DTInstrumentServer, "taskForPid:", v4);
  self->_task = v5;
  if (v5 + 1 <= 1)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("DTSamplingServiceException"), CFSTR("Failed to get task for pid %d"), v4);
}

- (void)startSampling
{
  self->_doCollectData = 1;
  self->_context = (sampling_context_t *)create_sampling_context_for_task();
  MEMORY[0x24BEDD108](MEMORY[0x24BDD17F0], sel_detachNewThreadSelector_toTarget_withObject_);
}

- (void)stopSampling
{
  self->_doCollectData = 0;
}

- (void)_outputData
{
  void *v3;
  id v4;

  -[DTXService channel](self, "channel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE2A960], "messageWithBuffer:length:", self->_backtraceBuffer, 8 * self->_backtraceBufferUsedSize);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendMessage:replyHandler:", v3, 0);

}

- (void)_allocateBuffer
{
  unint64_t *v3;

  self->_backtraceBufferSize = 1368576;
  v3 = (unint64_t *)malloc_type_malloc(0x14E200uLL, 0x96D52FEDuLL);
  self->_backtraceBuffer = v3;
  *v3 = 0;
  self->_backtraceBufferUsedSize = 1;
}

- (void)collectData
{
  CFMutableDictionaryRef Mutable;
  const __CFDictionary *v4;
  unint64_t *backtraceBuffer;
  uint64_t v6;
  char v7;
  void *v8;
  unint64_t outputRateDelta;
  unint64_t *v10;

  Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
  if (Mutable)
  {
    v4 = Mutable;
    backtraceBuffer = self->_backtraceBuffer;
    if (backtraceBuffer)
    {
      free(backtraceBuffer);
      self->_backtraceBuffer = 0;
    }
    v6 = -[DTSamplingService _allocateBuffer](self, "_allocateBuffer");
    if (self->_doCollectData)
    {
      v7 = 1;
      do
      {
        v8 = (void *)MEMORY[0x227679C5C](v6);
        -[DTSamplingService addSampleWithTimeInfo:useZeroDelta:](self, "addSampleWithTimeInfo:useZeroDelta:", v4, v7 & 1);
        outputRateDelta = self->_outputRateDelta;
        if (outputRateDelta >= self->_outputRate)
        {
          -[DTSamplingService _outputData](self, "_outputData");
          self->_outputRateDelta = 0;
          -[DTSamplingService _allocateBuffer](self, "_allocateBuffer");
        }
        else
        {
          self->_outputRateDelta = self->_samplingRate + outputRateDelta;
        }
        usleep(self->_samplingRate);
        objc_autoreleasePoolPop(v8);
        v7 = 0;
      }
      while (self->_doCollectData);
    }
    v10 = self->_backtraceBuffer;
    if (v10)
    {
      free(v10);
      self->_backtraceBuffer = 0;
    }
    if (self->_context)
    {
      destroy_sampling_context();
      self->_context = 0;
    }
    CFDictionaryApplyFunction(v4, (CFDictionaryApplierFunction)sub_222B28C80, 0);
    CFRelease(v4);
  }
}

- (void)addSampleWithTimeInfo:(__CFDictionary *)a3 useZeroDelta:(BOOL)a4
{
  unint64_t backtraceBufferSize;
  unint64_t *v7;
  unint64_t *v8;
  unint64_t *backtraceBuffer;
  unint64_t v10;
  unint64_t backtraceBufferUsedSize;
  double v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t i;
  const void *v16;
  _QWORD *v17;
  unint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t *v21;
  void *value;
  integer_t thread_info_out[4];
  __int128 v24;
  uint64_t v25;
  mach_msg_type_number_t thread_info_outCnt;
  mach_msg_type_number_t act_listCnt;
  thread_act_array_t act_list[515];

  act_list[513] = *(thread_act_array_t *)MEMORY[0x24BDAC8D0];
  act_list[0] = 0;
  act_listCnt = 0;
  if (!task_threads(self->_task, act_list, &act_listCnt))
  {
    backtraceBufferSize = self->_backtraceBufferSize;
    if (self->_backtraceBufferUsedSize + 1568 >= backtraceBufferSize)
    {
      v7 = (unint64_t *)malloc_type_realloc(self->_backtraceBuffer, 2 * backtraceBufferSize, 0x2ED17982uLL);
      if (v7)
      {
        v8 = v7;
        self->_backtraceBufferSize = malloc_size(v7);
        self->_backtraceBuffer = v8;
      }
      else
      {
        -[DTSamplingService _outputData](self, "_outputData");
        self->_outputRateDelta = 0;
        -[DTSamplingService _allocateBuffer](self, "_allocateBuffer");
      }
    }
    backtraceBuffer = self->_backtraceBuffer;
    ++*backtraceBuffer;
    v10 = act_listCnt;
    backtraceBufferUsedSize = self->_backtraceBufferUsedSize;
    self->_backtraceBufferUsedSize = backtraceBufferUsedSize + 1;
    backtraceBuffer[backtraceBufferUsedSize] = v10;
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v13 = self->_backtraceBuffer;
    v14 = self->_backtraceBufferUsedSize;
    self->_backtraceBufferUsedSize = v14 + 1;
    v13[v14] = (unint64_t)(v12 * 1000000.0);
    thread_info_outCnt = 10;
    v25 = 0;
    *(_OWORD *)thread_info_out = 0u;
    v24 = 0u;
    value = 0;
    if (act_listCnt)
    {
      for (i = 0; i < act_listCnt; ++i)
      {
        v16 = (const void *)act_list[0][i];
        thread_info(act_list[0][i], 3u, thread_info_out, &thread_info_outCnt);
        if (CFDictionaryGetValueIfPresent(a3, v16, (const void **)&value))
        {
          mach_port_deallocate(*MEMORY[0x24BDAEC58], (mach_port_name_t)v16);
        }
        else
        {
          v17 = malloc_type_malloc(8uLL, 0x100004000313F17uLL);
          value = v17;
          *v17 = 0;
          CFDictionarySetValue(a3, v16, v17);
        }
        *(_QWORD *)value = *(_QWORD *)thread_info_out;
        thread_suspend((thread_read_t)v16);
        sample_remote_thread();
        thread_resume((thread_read_t)v16);
        v18 = self->_backtraceBufferUsedSize;
        v19 = &self->_backtraceBuffer[v18];
        *v19 = 0;
        self->_backtraceBufferUsedSize = v18 + 2;
        v19[1] = 0;
        v20 = self->_backtraceBufferUsedSize;
        v21 = self->_backtraceBuffer;
        self->_backtraceBufferUsedSize = v20 + 1;
        v21[v20] = (unint64_t)v16;
      }
    }
    sampling_context_clear_cache();
    if (act_listCnt)
      mach_vm_deallocate(*MEMORY[0x24BDAEC58], (mach_vm_address_t)act_list[0], 4 * act_listCnt);
  }
}

@end
