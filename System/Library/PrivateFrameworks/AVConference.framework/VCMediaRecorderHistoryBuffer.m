@implementation VCMediaRecorderHistoryBuffer

- (VCMediaRecorderHistoryBuffer)initWithDelegate:(id)a3 bufferLength:(int)a4
{
  VCMediaRecorderHistoryBuffer *v6;
  VCMediaRecorderHistoryBuffer *v7;
  const __CFAllocator *v8;
  CFMutableArrayRef Mutable;
  CFMutableDictionaryRef v10;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)VCMediaRecorderHistoryBuffer;
  v6 = -[VCMediaRecorderHistoryBuffer init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    if (a3)
    {
      objc_storeWeak(&v6->_delegate, a3);
      v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
      v7->_timestampQueue = Mutable;
      if (Mutable)
      {
        v10 = CFDictionaryCreateMutable(v8, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        v7->_sampleMap = v10;
        if (v10)
        {
          VCAllocatorFirstCome_Create(v8, (uint64_t)"VCMediaRecorderHistoryBufferTimestampAllocator", &v7->_timestampAllocator);
          if (v7->_timestampAllocator)
          {
            v7->_bufferLength = a4;
            return v7;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCMediaRecorderHistoryBuffer initWithDelegate:bufferLength:].cold.4();
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCMediaRecorderHistoryBuffer initWithDelegate:bufferLength:].cold.3();
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaRecorderHistoryBuffer initWithDelegate:bufferLength:].cold.2();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaRecorderHistoryBuffer initWithDelegate:bufferLength:].cold.1();
    }

    return 0;
  }
  return v7;
}

- (void)dealloc
{
  __CFArray *timestampQueue;
  __CFDictionary *sampleMap;
  __CFAllocator *timestampAllocator;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[VCMediaRecorderHistoryBuffer flushBuffer](self, "flushBuffer");
  objc_storeWeak(&self->_delegate, 0);
  timestampQueue = self->_timestampQueue;
  if (timestampQueue)
    CFRelease(timestampQueue);
  sampleMap = self->_sampleMap;
  if (sampleMap)
    CFRelease(sampleMap);
  timestampAllocator = self->_timestampAllocator;
  if (timestampAllocator)
    CFRelease(timestampAllocator);
  v6.receiver = self;
  v6.super_class = (Class)VCMediaRecorderHistoryBuffer;
  -[VCMediaRecorderHistoryBuffer dealloc](&v6, sel_dealloc);
}

- (opaqueCMSampleBuffer)getClosestSampleForTimestamp:(unsigned int)a3
{
  unsigned int Count;
  const __CFAllocator *v6;
  int v7;
  CFNumberRef v8;
  CFNumberRef v9;
  opaqueCMSampleBuffer *Value;
  __CFArray *timestampQueue;
  CFIndex v12;
  const __CFNumber *ValueAtIndex;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  char *v18;
  uint64_t v20;
  unsigned int valuePtr;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
  unsigned int v31;
  __int16 v32;
  unsigned int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  Count = CFDictionaryGetCount(self->_sampleMap);
  if (!Count)
    return 0;
  valuePtr = 480 * (a3 / 0x1E0);
  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v7 = 31;
  while (1)
  {
    v8 = CFNumberCreate(v6, kCFNumberIntType, &valuePtr);
    if (v8)
    {
      v9 = v8;
      Value = (opaqueCMSampleBuffer *)CFDictionaryGetValue(self->_sampleMap, v8);
      CFRelease(v9);
      if (Value)
        break;
    }
    valuePtr -= 480;
    if (--v7 <= 1)
    {
      timestampQueue = self->_timestampQueue;
      v12 = CFArrayGetCount(timestampQueue);
      ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(timestampQueue, v12 - 1);
      valuePtr = CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &valuePtr);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          v23 = v14;
          v24 = 2080;
          v25 = "-[VCMediaRecorderHistoryBuffer getClosestSampleForTimestamp:]";
          v26 = 1024;
          v27 = 107;
          v28 = 1024;
          v29 = a3;
          v30 = 1024;
          v31 = valuePtr;
          v32 = 1024;
          v33 = Count;
          _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Image not found in the buffer for timestamp=%u, retrieving the latest one for currentTS=%u, _sampleMap contains=%u", buf, 0x2Eu);
        }
      }
      Value = (opaqueCMSampleBuffer *)CFDictionaryGetValue(self->_sampleMap, ValueAtIndex);
      if (!Value)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          v16 = VRTraceErrorLogLevelToCSTR();
          v17 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v23 = v16;
            v24 = 2080;
            v25 = "-[VCMediaRecorderHistoryBuffer getClosestSampleForTimestamp:]";
            v26 = 1024;
            v27 = 112;
            _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Can't find last object in timestamp queue, get last object in the image buffer", buf, 0x1Cu);
          }
        }
        v18 = (char *)&v20 - ((8 * Count + 15) & 0xFFFFFFFF0);
        memset(v18, 170, 8 * Count);
        memset(v18, 170, 8 * Count);
        CFDictionaryGetKeysAndValues(self->_sampleMap, (const void **)v18, (const void **)v18);
        return *(opaqueCMSampleBuffer **)&v18[8 * Count - 8];
      }
      return Value;
    }
  }
  return Value;
}

- (void)flushBuffer
{
  while (CFArrayGetCount(self->_timestampQueue))
    _VCMediaRecorderHistoryBuffer_DequeueOneFrame(&self->super.isa);
}

- (int)getCount
{
  return CFArrayGetCount(self->_timestampQueue);
}

- (id)delegate
{
  return objc_loadWeak(&self->_delegate);
}

- (void)initWithDelegate:bufferLength:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCMediaRecorderHistoryBuffer Delegate parameter is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithDelegate:bufferLength:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCMediaRecorderHistoryBuffer failed to create the timestamp queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithDelegate:bufferLength:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCMediaRecorderHistoryBuffer failed to create the sample dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithDelegate:bufferLength:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCMediaRecorderHistoryBuffer failed to create the allocator", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
