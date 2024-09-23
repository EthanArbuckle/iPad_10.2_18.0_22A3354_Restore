@implementation BWInferenceSchedulerInference

- (int)prepareForSubmissionWithWorkQueue:(id)a3
{
  BWInferenceSubmittable *v5;

  v5 = -[BWInferenceSchedulerInference submittable](self, "submittable");
  if (v5)
    LODWORD(v5) = objc_msgSend((id)-[BWInferenceProvider submittable](-[BWInferenceSchedulerInference provider](self, "provider"), "submittable"), "prepareForSubmissionWithWorkQueue:", a3);
  return (int)v5;
}

- (BWInferenceExecutable)executable
{
  if (-[BWInferenceProvider executable](-[BWInferenceSchedulerInference provider](self, "provider"), "executable"))
    return (BWInferenceExecutable *)self;
  else
    return 0;
}

- (id)newStorage
{
  return (id)-[BWInferenceProvider newStorage](-[BWInferenceSchedulerInference provider](self, "provider"), "newStorage");
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceSchedulerInference;
  return -[NSString stringByAppendingFormat:](-[BWInferenceSchedulerInference description](&v3, sel_description), "stringByAppendingFormat:", CFSTR(" provider: %@"), self->_provider);
}

- (int)type
{
  return -[BWInferenceProvider type](self->_provider, "type");
}

- (int)inferenceType
{
  return self->_inferenceType;
}

- (BWInferenceSubmittable)submittable
{
  if (-[BWInferenceProvider submittable](-[BWInferenceSchedulerInference provider](self, "provider"), "submittable"))
    return (BWInferenceSubmittable *)self;
  else
    return 0;
}

- (BWInferencePropagatable)propagatable
{
  return (BWInferencePropagatable *)-[BWInferenceProvider propagatable](-[BWInferenceSchedulerInference provider](self, "provider"), "propagatable");
}

- (BWInferenceProvider)provider
{
  return self->_provider;
}

- (BWInferenceSchedulerInference)initWithInferenceRequirement:(id)a3
{
  BWInferenceSchedulerInference *v4;
  BWInferenceSchedulerInference *v5;
  unint64_t v6;
  BWInferenceProvider *v7;
  BWInferenceProvider *v8;
  void *v9;
  float v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BWInferenceSchedulerInference;
  v4 = -[BWInferenceSchedulerInference init](&v12, sel_init);
  v5 = v4;
  if (v4)
  {
    do
      v6 = __ldaxr(&nextUniqueIdentifier);
    while (__stlxr(v6 + 1, &nextUniqueIdentifier));
    v4->_identifier = v6;
    v7 = (BWInferenceProvider *)(id)objc_msgSend(a3, "provider");
    v5->_provider = v7;
    if (-[BWInferenceProvider conformsToProtocol:](v7, "conformsToProtocol:", &unk_1EE6C9DE8))
      v8 = v5->_provider;
    else
      v8 = 0;
    v5->_preventable = v8;
    -[BWInferenceProvider mustExecuteWhenAllowed](v8, "mustExecuteWhenAllowed");
    v5->_mustExecuteWhenAllowed = 1;
    v9 = (void *)objc_msgSend(a3, "configuration");
    v5->_priority = objc_msgSend(v9, "priority");
    objc_msgSend(v9, "maximumFramesPerSecond");
    v5->_maximumFramesPerSecond = v10;
    v5->_propagatesFrameRatePrevention = objc_msgSend(v9, "propagatesFrameRatePrevention");
    atomic_store(0, (unint64_t *)&v5->_previousExecutionTimeInSeconds);
    v5->_inferenceType = objc_msgSend(v9, "inferenceType");
  }
  return v5;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceSchedulerInference;
  -[BWInferenceSchedulerInference dealloc](&v3, sel_dealloc);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)previousExecutionTime
{
  Float64 v3;

  v3 = COERCE_DOUBLE(atomic_load((unint64_t *)&self->_previousExecutionTimeInSeconds));
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeWithSeconds((CMTime *)retstr, v3, 1000000000);
}

- (BOOL)mustExecuteWhenAllowed
{
  return self->_mustExecuteWhenAllowed;
}

- (id)preventionReasonWithSampleBuffer:(opaqueCMSampleBuffer *)a3 executionTime:(id *)a4
{
  float v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  int v11;
  BOOL v12;
  BWInferencePreventable *preventable;
  id *v15;
  CMTime v16;
  CMTime lhs;
  CMTime time;
  CMTime v19;

  memset(&v19, 0, sizeof(v19));
  if (self)
    -[BWInferenceSchedulerInference previousExecutionTime](self, "previousExecutionTime");
  if (self->_maximumFramesPerSecond > 0.00000011921
    && (v19.flags & 1) != 0
    && (a4->var2 & 1) != 0
    && (lhs = (CMTime)*a4,
        v16 = v19,
        CMTimeSubtract(&time, &lhs, &v16),
        v7 = 0.949999999 / CMTimeGetSeconds(&time),
        self->_maximumFramesPerSecond < v7))
  {
    v15 = (id *)&BWInferencePreventionReasonFrameRate;
    if (!self->_propagatesFrameRatePrevention)
      v15 = (id *)BWInferencePreventionReasonScheduling;
    return *v15;
  }
  else
  {
    v8 = (void *)-[BWInferenceProvider preventionReasons](self->_provider, "preventionReasons");
    v9 = CFSTR("BlurryInputBuffer");
    if (!objc_msgSend(v8, "containsObject:", CFSTR("BlurryInputBuffer"))
      || ((v10 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0),
           v11 = objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D067D0]), "intValue"),
           objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D06AB8]), "intValue") == 1)? (v12 = v11 == 4): (v12 = 1), v12))
    {
      v9 = CFSTR("FilteredInputBuffer");
      if (!objc_msgSend(v8, "containsObject:", CFSTR("FilteredInputBuffer"))
        || (objc_msgSend((id)CMGetAttachment(a3, CFSTR("FiltersApplied"), 0), "BOOLValue") & 1) == 0)
      {
        preventable = self->_preventable;
        if (preventable)
        {
          lhs = (CMTime)*a4;
          return (id)-[BWInferencePreventable preventionReasonWithSampleBuffer:executionTime:](preventable, "preventionReasonWithSampleBuffer:executionTime:", a3, &lhs);
        }
        else
        {
          return 0;
        }
      }
    }
  }
  return (id)v9;
}

- (BWInferenceExtractable)extractable
{
  return 0;
}

- (int)prepareForExecution
{
  return objc_msgSend((id)-[BWInferenceProvider executable](-[BWInferenceSchedulerInference provider](self, "provider"), "executable"), "prepareForExecution");
}

- (int)executeOnSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withExecutionTime:(id *)a5 completionHandler:(id)a6
{
  void *v11;
  __int128 v13;
  int64_t v14;
  _QWORD v15[6];
  __int128 v16;
  int64_t var3;

  v11 = (void *)-[BWInferenceProvider executable](-[BWInferenceSchedulerInference provider](self, "provider"), "executable");
  if (!v11)
    return -31710;
  v15[1] = 3221225472;
  v15[2] = __104__BWInferenceSchedulerInference_executeOnSampleBuffer_usingStorage_withExecutionTime_completionHandler___block_invoke;
  v15[3] = &unk_1E49240A8;
  v16 = *(_OWORD *)&a5->var0;
  var3 = a5->var3;
  v15[4] = self;
  v15[5] = a6;
  v13 = *(_OWORD *)&a5->var0;
  v14 = a5->var3;
  v15[0] = MEMORY[0x1E0C809B0];
  return objc_msgSend(v11, "executeOnSampleBuffer:usingStorage:withExecutionTime:completionHandler:", a3, a4, &v13, v15);
}

uint64_t __104__BWInferenceSchedulerInference_executeOnSampleBuffer_usingStorage_withExecutionTime_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t *v4;
  double Seconds;
  uint64_t result;
  CMTime v7;

  v4 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 48);
  v7 = *(CMTime *)(a1 + 48);
  Seconds = CMTimeGetSeconds(&v7);
  do
    __ldaxr(v4);
  while (__stlxr(*(unint64_t *)&Seconds, v4));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, *(_QWORD *)(a1 + 32));
  return result;
}

- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7
{
  void *v13;
  __int128 v15;
  int64_t v16;
  _QWORD v17[6];
  __int128 v18;
  int64_t var3;

  v13 = (void *)-[BWInferenceProvider submittable](-[BWInferenceSchedulerInference provider](self, "provider"), "submittable");
  if (!objc_msgSend(v13, "submittable"))
    return -31710;
  v17[1] = 3221225472;
  v17[2] = __115__BWInferenceSchedulerInference_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke;
  v17[3] = &unk_1E49240A8;
  v18 = *(_OWORD *)&a5->var0;
  var3 = a5->var3;
  v17[4] = self;
  v17[5] = a7;
  v15 = *(_OWORD *)&a5->var0;
  v16 = a5->var3;
  v17[0] = MEMORY[0x1E0C809B0];
  return objc_msgSend(v13, "submitForSampleBuffer:usingStorage:withSubmissionTime:workQueue:completionHandler:", a3, a4, &v15, a6, v17);
}

uint64_t __115__BWInferenceSchedulerInference_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t *v4;
  double Seconds;
  uint64_t result;
  CMTime v7;

  v4 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 48);
  v7 = *(CMTime *)(a1 + 48);
  Seconds = CMTimeGetSeconds(&v7);
  do
    __ldaxr(v4);
  while (__stlxr(*(unint64_t *)&Seconds, v4));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, *(_QWORD *)(a1 + 32));
  return result;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (unsigned)priority
{
  return self->_priority;
}

- (float)maximumFramesPerSecond
{
  return self->_maximumFramesPerSecond;
}

@end
