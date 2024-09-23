@implementation BWStillImageTimeMachine

+ (void)initialize
{
  objc_opt_class();
}

- (BWStillImageTimeMachine)initWithCapacity:(int)a3
{
  BWStillImageTimeMachine *v4;
  BWStillImageTimeMachine *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BWStillImageTimeMachine;
  v4 = -[BWStillImageTimeMachine init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_capacity = a3;
    if (a3 >= 1)
      v4->_frames = (opaqueCMSampleBuffer **)malloc_type_calloc(a3, 8uLL, 0x2004093837F09uLL);
    v5->_timeMachineMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[BWStillImageTimeMachine _drain]((uint64_t)self);
  free(self->_frames);
  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)BWStillImageTimeMachine;
  -[BWStillImageTimeMachine dealloc](&v3, sel_dealloc);
}

- (void)_drain
{
  unint64_t v2;
  unint64_t i;
  const void *v4;

  if (a1)
  {
    v2 = *(unsigned int *)(a1 + 28);
    if ((_DWORD)v2)
    {
      for (i = 0; i < v2; ++i)
      {
        v4 = *(const void **)(*(_QWORD *)(a1 + 16) + 8 * i);
        if (v4)
        {
          CFRelease(v4);
          *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8 * i) = 0;
          v2 = *(unsigned int *)(a1 + 28);
        }
      }
    }
  }
}

- (void)resume
{
  pthread_mutex_lock((pthread_mutex_t *)self->_timeMachineMutex);
  self->_suspended = 0;
  pthread_mutex_unlock((pthread_mutex_t *)self->_timeMachineMutex);
}

- (void)suspendAndDrain
{
  pthread_mutex_lock((pthread_mutex_t *)self->_timeMachineMutex);
  if (!self->_suspended)
  {
    self->_suspended = 1;
    -[BWStillImageTimeMachine _drain]((uint64_t)self);
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_timeMachineMutex);
}

- (int)insertFrame:(opaqueCMSampleBuffer *)a3
{
  int capacity;
  int CopyIncludingMetadata;
  opaqueCMSampleBuffer *v7;
  uint64_t v8;
  uint64_t v9;

  pthread_mutex_lock((pthread_mutex_t *)self->_timeMachineMutex);
  capacity = self->_capacity;
  if (capacity && !self->_suspended)
  {
    v7 = *self->_frames;
    if (v7)
    {
      CFRelease(v7);
      capacity = self->_capacity;
    }
    v8 = (capacity - 1);
    if ((_DWORD)v8)
    {
      v9 = 0;
      do
      {
        self->_frames[v9] = self->_frames[v9 + 1];
        ++v9;
      }
      while (v8 != v9);
    }
    else
    {
      v8 = 0;
    }
    CopyIncludingMetadata = BWCMSampleBufferCreateCopyIncludingMetadata(a3, &self->_frames[v8]);
    if (CopyIncludingMetadata)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
  else
  {
    CopyIncludingMetadata = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_timeMachineMutex);
  return CopyIncludingMetadata;
}

- (opaqueCMSampleBuffer)copyBestFrame
{
  uint64_t v2;
  int capacity;
  unint64_t v5;
  int v6;
  unint64_t v7;
  opaqueCMSampleBuffer *v8;
  const __CFString **v9;
  const __CFDictionary *v10;
  const __CFNumber *v11;
  int v12;
  int v13;
  int v14;
  unint64_t v15;
  const __CFString *v16;
  const void *v17;
  const void *v18;
  float v19;
  opaqueCMSampleBuffer *v20;
  const __CFDictionary *v21;
  const __CFDictionary *v22;
  const __CFArray *Value;
  const __CFArray *v24;
  CFIndex v25;
  uint64_t v26;
  CFIndex v27;
  const __CFNumber *ValueAtIndex;
  const __CFBoolean *v30;
  const __CFNumber *v31;
  uint64_t v32;
  int v33;
  opaqueCMSampleBuffer *v34;
  opaqueCMSampleBuffer *v35;
  uint64_t v37;
  uint64_t v38;
  void *key;
  int v40;
  double valuePtr;
  uint64_t v42;

  valuePtr = 0.0;
  pthread_mutex_lock((pthread_mutex_t *)self->_timeMachineMutex);
  capacity = self->_capacity;
  if (capacity >= 4)
  {
    fig_log_get_emitter();
    v38 = v2;
    LODWORD(v37) = 0;
    FigDebugAssert3();
    capacity = self->_capacity;
  }
  v42 = 0;
  if (capacity < 1)
    goto LABEL_48;
  if (!self->_frames)
    goto LABEL_48;
  v5 = 0;
  v6 = 0;
  do
  {
    v6 |= +[BWStillImageTimeMachine afComplete:](BWStillImageTimeMachine, "afComplete:", self->_frames[v5++], v37, v38);
    v7 = self->_capacity;
  }
  while (v5 < v7);
  if ((v6 & 1) == 0)
    goto LABEL_48;
  v8 = self->_frames[(int)v7 - 1];
  v9 = (const __CFString **)MEMORY[0x1E0D05CB0];
  if (v8
    && (v10 = (const __CFDictionary *)CMGetAttachment(v8, (CFStringRef)*MEMORY[0x1E0D05CB0], 0)) != 0
    && (v11 = (const __CFNumber *)CFDictionaryGetValue(v10, (const void *)*MEMORY[0x1E0D06A20])) != 0
    && (CFNumberGetValue(v11, kCFNumberFloat64Type, &valuePtr), valuePtr < 0.01)
    && valuePtr > 0.0)
  {
    v12 = self->_capacity;
    v13 = -1;
    if (v12)
    {
      v14 = v12 - 1;
      goto LABEL_41;
    }
  }
  else
  {
    if (self->_capacity)
    {
      v15 = 0;
      v16 = *v9;
      key = (void *)*MEMORY[0x1E0D06A98];
      v17 = (const void *)*MEMORY[0x1E0D067C8];
      v18 = (const void *)*MEMORY[0x1E0D067D0];
      v13 = -1;
      v19 = 0.0;
      v14 = -1;
      do
      {
        v20 = self->_frames[v15];
        if (v20)
        {
          v21 = (const __CFDictionary *)CMGetAttachment(v20, v16, 0);
          if (v21)
          {
            v22 = v21;
            Value = (const __CFArray *)CFDictionaryGetValue(v21, key);
            if (Value)
            {
              v24 = Value;
              v25 = (CFArrayGetCount(Value) << 32) - 0x100000000;
              if (v25 < (uint64_t)0xFFFFFFFF00000001)
              {
                v26 = 0;
              }
              else
              {
                v26 = 0;
                v27 = v25 >> 32;
                do
                {
                  ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v24, v27);
                  CFNumberGetValue(ValueAtIndex, kCFNumberSInt64Type, &v42);
                  v26 += v42;
                }
                while (v27-- > 0);
              }
            }
            else
            {
              v26 = -1;
            }
            v30 = (const __CFBoolean *)CFDictionaryGetValue(v22, v17);
            if (v30 && !CFBooleanGetValue(v30))
              v26 >>= 2;
            v31 = (const __CFNumber *)CFDictionaryGetValue(v22, v18);
            v40 = 4;
            if (v31)
            {
              CFNumberGetValue(v31, kCFNumberIntType, &v40);
              v32 = v26 >> 2;
              if (v40 != 2)
                v32 = v26;
              if (v40 == 3)
                v26 >>= 1;
              else
                v26 = v32;
            }
            if ((v26 & 0x8000000000000000) == 0)
            {
              v33 = self->_capacity + ~(_DWORD)v15;
              if ((float)(copyBestFrame_weights[v33] * (float)v26) > v19)
              {
                v14 = v15;
                v19 = copyBestFrame_weights[v33] * (float)v26;
              }
            }
          }
          v13 = v15;
        }
        ++v15;
      }
      while (v15 < self->_capacity);
LABEL_41:
      if ((v14 & 0x80000000) == 0)
        goto LABEL_45;
      goto LABEL_44;
    }
    v13 = -1;
  }
LABEL_44:
  v14 = v13;
  if (v13 < 0)
  {
LABEL_48:
    v35 = 0;
    goto LABEL_49;
  }
LABEL_45:
  if (v14 >= self->_capacity)
    goto LABEL_48;
  v34 = self->_frames[v14];
  if (!v34)
    goto LABEL_48;
  v35 = (opaqueCMSampleBuffer *)CFRetain(v34);
LABEL_49:
  pthread_mutex_unlock((pthread_mutex_t *)self->_timeMachineMutex);
  return v35;
}

- (void)drain
{
  pthread_mutex_lock((pthread_mutex_t *)self->_timeMachineMutex);
  -[BWStillImageTimeMachine _drain]((uint64_t)self);
  pthread_mutex_unlock((pthread_mutex_t *)self->_timeMachineMutex);
}

+ (BOOL)afComplete:(opaqueCMSampleBuffer *)a3
{
  const __CFDictionary *v3;
  const __CFNumber *Value;
  BOOL result;
  int valuePtr;

  if (!a3)
    return 0;
  v3 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  result = 1;
  if (v3)
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(v3, (const void *)*MEMORY[0x1E0D067D0]);
    valuePtr = 0;
    if (Value)
    {
      CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
      if (valuePtr == 2)
        return 0;
    }
  }
  return result;
}

- (int)capacity
{
  return self->_capacity;
}

@end
