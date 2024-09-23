@implementation BWDetectedFacesRingBuffer

- (BWDetectedFacesRingBuffer)initWithDepth:(int)a3
{
  BWDetectedFacesRingBuffer *v4;
  objc_super v6;

  if (a3 <= 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("depth must be at least 1"), 0));
  v6.receiver = self;
  v6.super_class = (Class)BWDetectedFacesRingBuffer;
  v4 = -[BWDetectedFacesRingBuffer init](&v6, sel_init);
  if (v4)
  {
    v4->_mutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    v4->_ringBuffer = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
    v4->_depth = a3;
  }
  return v4;
}

- (void)addFacesFromSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  NSMutableArray *ringBuffer;
  unint64_t depth;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  int numConsecutiveFramesWithFaces;
  CMTime v16;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock((pthread_mutex_t *)self->_mutex);
  ringBuffer = self->_ringBuffer;
  depth = self->_depth;
  value = *MEMORY[0x1E0CA2E18];
  flags = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 12);
  timescale = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
  epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v9 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (v9)
  {
    v10 = (void *)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06998]);
    if (v10)
    {
      v11 = v10;
      if (ringBuffer)
      {
        v12 = (void *)objc_msgSend(v10, "copy");
        -[NSMutableArray insertObject:atIndex:](ringBuffer, "insertObject:atIndex:", v12, 0);
        if (-[NSMutableArray count](ringBuffer, "count") > depth)
          -[NSMutableArray removeLastObject](ringBuffer, "removeLastObject");

      }
      if (objc_msgSend(v11, "count"))
      {
        v13 = (void *)objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
        objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D06F20]), "longLongValue");
        v14 = FigHostTimeToNanoseconds();
        CMTimeMake(&v16, v14, 1000000000);
        value = v16.value;
        flags = v16.flags;
        timescale = v16.timescale;
        epoch = v16.epoch;
      }
    }
    else
    {
      value = *MEMORY[0x1E0CA2E10];
      flags = *(_DWORD *)(MEMORY[0x1E0CA2E10] + 12);
      timescale = *(_DWORD *)(MEMORY[0x1E0CA2E10] + 8);
      epoch = *(_QWORD *)(MEMORY[0x1E0CA2E10] + 16);
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  if ((~flags & 0x11) != 0)
  {
    if ((flags & 1) != 0)
    {
      numConsecutiveFramesWithFaces = self->_numConsecutiveFramesWithFaces;
      self->_numConsecutiveFramesWithFaces = numConsecutiveFramesWithFaces + 1;
      if (numConsecutiveFramesWithFaces >= 3)
      {
        self->_lastStableFacePTS.value = value;
        self->_lastStableFacePTS.timescale = timescale;
        self->_lastStableFacePTS.flags = flags;
        self->_lastStableFacePTS.epoch = epoch;
      }
    }
    else
    {
      self->_numConsecutiveFramesWithFaces = 0;
    }
  }
  CMSampleBufferGetPresentationTimeStamp(&v16, a3);
  self->_lastUpdatePTS = ($95D729B680665BEAEFA1D6FCA8238556)v16;
  pthread_mutex_unlock((pthread_mutex_t *)self->_mutex);
}

- (void)transferFacesToSampleBuffer:(opaqueCMSampleBuffer *)a3 totalSensorCropRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NSMutableArray *ringBuffer;
  CMTimeValue value;
  CMTimeScale timescale;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  void *v18;
  int64_t v19;
  float Seconds;
  int32_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  int v25;
  int v26;
  void *FacesArrayForCropRect;
  opaqueCMSampleBuffer *v28;
  uint64_t v29;
  CMTime v30;
  CMTimeRange lhs;
  CMTime time2;
  CMTime v33;
  CMTime time;
  CMTime duration;
  CMTime rhs;
  CMTime start;
  CMTimeRange v38;
  CMTime v39;
  uint64_t v40;
  int epoch_high;
  uint64_t v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v42 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock((pthread_mutex_t *)self->_mutex);
  ringBuffer = self->_ringBuffer;
  memset(&v30, 0, sizeof(v30));
  CMSampleBufferGetPresentationTimeStamp(&v30, a3);
  value = v30.value;
  timescale = v30.timescale;
  v40 = *(_QWORD *)&v30.flags;
  epoch_high = HIDWORD(v30.epoch);
  v13 = -[NSMutableArray count](ringBuffer, "count");
  memset(&v39, 0, sizeof(v39));
  CMTimeMake(&v39, 1, 1000);
  memset(&v38, 0, sizeof(v38));
  lhs.start.value = value;
  lhs.start.timescale = timescale;
  *(_QWORD *)&lhs.start.flags = v40;
  HIDWORD(lhs.start.epoch) = epoch_high;
  rhs = v39;
  CMTimeSubtract(&start, &lhs.start, &rhs);
  lhs.start = v39;
  CMTimeMultiply(&duration, &lhs.start, 2);
  CMTimeRangeMake(&v38, &start, &duration);
  if (v13 < 1)
  {
    v16 = -1;
    LODWORD(v14) = -1;
    goto LABEL_12;
  }
  v28 = a3;
  v14 = 0;
  v29 = *MEMORY[0x1E0D06F20];
  v15 = v13;
  v16 = -1;
  while (1)
  {
    v17 = (void *)-[NSMutableArray objectAtIndexedSubscript:](ringBuffer, "objectAtIndexedSubscript:", v14);
    if (objc_msgSend(v17, "count"))
      break;
LABEL_9:
    if (v15 == ++v14)
      goto LABEL_16;
  }
  v18 = (void *)objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  memset(&rhs, 0, sizeof(rhs));
  objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", v29), "longLongValue");
  v19 = FigHostTimeToNanoseconds();
  CMTimeMake(&time, v19, 1000000000);
  CMTimeConvertScale(&rhs, &time, timescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
  lhs.start.value = value;
  lhs.start.timescale = timescale;
  *(_QWORD *)&lhs.start.flags = v40;
  HIDWORD(lhs.start.epoch) = epoch_high;
  time2 = rhs;
  CMTimeSubtract(&v33, &lhs.start, &time2);
  Seconds = CMTimeGetSeconds(&v33);
  if (fabsf(Seconds) > 0.5)
    goto LABEL_16;
  lhs = v38;
  time2 = rhs;
  if (!CMTimeRangeContainsTime(&lhs, &time2))
  {
    lhs.start = rhs;
    time2.value = value;
    time2.timescale = timescale;
    *(_QWORD *)&time2.flags = v40;
    HIDWORD(time2.epoch) = epoch_high;
    v21 = CMTimeCompare(&lhs.start, &time2);
    if (v21)
    {
      if (v21 < 1)
        goto LABEL_17;
      v16 = v14;
      goto LABEL_9;
    }
  }
  if (v17)
  {
    a3 = v28;
    goto LABEL_24;
  }
LABEL_16:
  LODWORD(v14) = -1;
LABEL_17:
  a3 = v28;
  if ((_DWORD)v14 == -1 && (v16 & 0x80000000) == 0)
  {
    v22 = -[NSMutableArray lastObject](ringBuffer, "lastObject");
    goto LABEL_23;
  }
  if (v16 == -1 && (v14 & 0x80000000) == 0)
  {
    v22 = -[NSMutableArray firstObject](ringBuffer, "firstObject");
    goto LABEL_23;
  }
LABEL_12:
  if (((v14 | v16) & 0x80000000) == 0)
  {
    v22 = -[NSMutableArray objectAtIndexedSubscript:](ringBuffer, "objectAtIndexedSubscript:", (v14 + v16) >> 1);
LABEL_23:
    v17 = (void *)v22;
    if (v22)
    {
LABEL_24:
      v23 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
      if (objc_msgSend(v17, "count"))
      {
        v24 = objc_msgSend((id)objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D40]), "intValue");
        v25 = objc_msgSend((id)objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D38]), "intValue");
        if (v25 && v24)
        {
          v26 = v25;
          v43.origin.x = x;
          v43.origin.y = y;
          v43.size.width = width;
          v43.size.height = height;
          if (CGRectIsEmpty(v43))
            goto LABEL_29;
          v47.origin.x = 0.0;
          v47.origin.y = 0.0;
          v44.origin.x = x;
          v44.origin.y = y;
          v44.size.width = width;
          v44.size.height = height;
          v47.size.width = (double)v24;
          v47.size.height = (double)v26;
          if (CGRectEqualToRect(v44, v47))
          {
LABEL_29:
            objc_msgSend(v23, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D06998]);
          }
          else
          {
            CGAffineTransformMakeScale((CGAffineTransform *)&v38, 1.0 / (double)v24, 1.0 / (double)v26);
            v45.origin.x = x;
            v45.origin.y = y;
            v45.size.width = width;
            v45.size.height = height;
            v46 = CGRectApplyAffineTransform(v45, (CGAffineTransform *)&v38);
            FacesArrayForCropRect = FigCaptureMetadataUtilitiesCreateFacesArrayForCropRect(v17, v46.origin.x, v46.origin.y, v46.size.width);
            objc_msgSend(v23, "setObject:forKeyedSubscript:", FacesArrayForCropRect, *MEMORY[0x1E0D06998]);

          }
        }
        else
        {
          fig_log_get_emitter();
          FigDebugAssert3();
        }
      }
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_mutex);
}

- (void)dealloc
{
  objc_super v3;

  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)BWDetectedFacesRingBuffer;
  -[BWDetectedFacesRingBuffer dealloc](&v3, sel_dealloc);
}

- (void)flush
{
  pthread_mutex_lock((pthread_mutex_t *)self->_mutex);
  -[NSMutableArray removeAllObjects](self->_ringBuffer, "removeAllObjects");
  pthread_mutex_unlock((pthread_mutex_t *)self->_mutex);
}

- (float)secondsSinceLastFaceDetected
{
  CMTimeFlags flags;
  float Seconds;
  CMTimeFlags v5;
  CMTimeValue value;
  CMTimeValue v7;
  CMTime rhs;
  CMTime lhs;
  CMTime time;

  pthread_mutex_lock((pthread_mutex_t *)self->_mutex);
  flags = self->_lastStableFacePTS.flags;
  Seconds = -1.0;
  if ((flags & 1) != 0)
  {
    v5 = self->_lastUpdatePTS.flags;
    if ((v5 & 1) != 0)
    {
      value = self->_lastUpdatePTS.value;
      rhs.epoch = self->_lastStableFacePTS.epoch;
      lhs.value = value;
      lhs.timescale = self->_lastUpdatePTS.timescale;
      lhs.flags = v5;
      v7 = self->_lastStableFacePTS.value;
      lhs.epoch = self->_lastUpdatePTS.epoch;
      rhs.value = v7;
      rhs.timescale = self->_lastStableFacePTS.timescale;
      rhs.flags = flags;
      CMTimeSubtract(&time, &lhs, &rhs);
      Seconds = CMTimeGetSeconds(&time);
      if (Seconds < 0.0)
        Seconds = 0.0;
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_mutex);
  return Seconds;
}

@end
