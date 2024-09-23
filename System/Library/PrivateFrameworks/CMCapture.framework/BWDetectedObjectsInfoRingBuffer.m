@implementation BWDetectedObjectsInfoRingBuffer

- (BWDetectedObjectsInfoRingBuffer)initWithRingBufferDepth:(int)a3
{
  BWDetectedObjectsInfoRingBuffer *v4;
  objc_super v6;

  if (a3 <= 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("depth must be at least 1"), 0));
  v6.receiver = self;
  v6.super_class = (Class)BWDetectedObjectsInfoRingBuffer;
  v4 = -[BWDetectedObjectsInfoRingBuffer init](&v6, sel_init);
  if (v4)
  {
    v4->_mutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    v4->_ringBuffer = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
    v4->_depth = a3;
  }
  return v4;
}

- (void)addObjectsFromSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  NSMutableArray *ringBuffer;
  unint64_t depth;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  int64_t v19;
  int numConsecutiveFramesWithObjects;
  CMTime time2;
  CMTime time1;
  CMTime v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CMTimeValue value;
  CMTimeScale timescale;
  CMTime v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
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
    v10 = (void *)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D069A0]);
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
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, &v30, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v25;
        v16 = *MEMORY[0x1E0D06F20];
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v25 != v15)
              objc_enumerationMutation(v11);
            v18 = (void *)objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i)), "objectForKeyedSubscript:", v16);
            if (v18)
            {
              memset(&v23, 0, sizeof(v23));
              objc_msgSend(v18, "longLongValue");
              v19 = FigHostTimeToNanoseconds();
              CMTimeMake(&v23, v19, 1000000000);
              time1 = v23;
              time2.value = value;
              time2.timescale = timescale;
              time2.flags = flags;
              time2.epoch = epoch;
              if (CMTimeCompare(&time1, &time2) >= 1)
              {
                value = v23.value;
                flags = v23.flags;
                timescale = v23.timescale;
                epoch = v23.epoch;
              }
            }
          }
          v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, &v30, 16);
        }
        while (v14);
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
      numConsecutiveFramesWithObjects = self->_numConsecutiveFramesWithObjects;
      self->_numConsecutiveFramesWithObjects = numConsecutiveFramesWithObjects + 1;
      if (numConsecutiveFramesWithObjects >= 3)
      {
        self->_lastStableObjectPTS.value = value;
        self->_lastStableObjectPTS.timescale = timescale;
        self->_lastStableObjectPTS.flags = flags;
        self->_lastStableObjectPTS.epoch = epoch;
      }
    }
    else
    {
      self->_numConsecutiveFramesWithObjects = 0;
    }
  }
  CMSampleBufferGetPresentationTimeStamp(&v30, a3);
  self->_lastUpdatePTS = ($95D729B680665BEAEFA1D6FCA8238556)v30;
  pthread_mutex_unlock((pthread_mutex_t *)self->_mutex);
}

- (void)transferObjectsToSampleBuffer:(opaqueCMSampleBuffer *)a3 totalSensorCropRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NSMutableArray *ringBuffer;
  uint64_t DetectedObjectsInfoClosestToPTS;
  const void *v12;
  void *v13;
  int v14;
  int v15;
  BOOL v16;
  int v17;
  void *DetectedObjectsInfoForCropRect;
  CGAffineTransform v19;
  CMTime v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  pthread_mutex_lock((pthread_mutex_t *)self->_mutex);
  ringBuffer = self->_ringBuffer;
  memset(&v20, 0, sizeof(v20));
  CMSampleBufferGetPresentationTimeStamp(&v20, a3);
  *(_OWORD *)&v19.a = *(_OWORD *)&v20.value;
  *(_QWORD *)&v19.c = v20.epoch;
  DetectedObjectsInfoClosestToPTS = doirb_findDetectedObjectsInfoClosestToPTS(ringBuffer, (CMTime *)&v19);
  if (DetectedObjectsInfoClosestToPTS)
  {
    v12 = (const void *)DetectedObjectsInfoClosestToPTS;
    v13 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v14 = objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D40]), "intValue");
    v15 = objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D38]), "intValue");
    if (v15)
      v16 = v14 == 0;
    else
      v16 = 1;
    if (v16)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      v17 = v15;
      v21.origin.x = x;
      v21.origin.y = y;
      v21.size.width = width;
      v21.size.height = height;
      if (CGRectIsEmpty(v21))
        goto LABEL_8;
      v25.origin.x = 0.0;
      v25.origin.y = 0.0;
      v22.origin.x = x;
      v22.origin.y = y;
      v22.size.width = width;
      v22.size.height = height;
      v25.size.width = (double)v14;
      v25.size.height = (double)v17;
      if (CGRectEqualToRect(v22, v25))
      {
LABEL_8:
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D069A0]);
      }
      else
      {
        CGAffineTransformMakeScale(&v19, 1.0 / (double)v14, 1.0 / (double)v17);
        v23.origin.x = x;
        v23.origin.y = y;
        v23.size.width = width;
        v23.size.height = height;
        v24 = CGRectApplyAffineTransform(v23, &v19);
        DetectedObjectsInfoForCropRect = FigCaptureMetadataUtilitiesCreateDetectedObjectsInfoForCropRect(v12, v24.origin.x, v24.origin.y, v24.size.width);
        objc_msgSend(v13, "setObject:forKeyedSubscript:", DetectedObjectsInfoForCropRect, *MEMORY[0x1E0D069A0]);

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
  v3.super_class = (Class)BWDetectedObjectsInfoRingBuffer;
  -[BWDetectedObjectsInfoRingBuffer dealloc](&v3, sel_dealloc);
}

- (void)flush
{
  pthread_mutex_lock((pthread_mutex_t *)self->_mutex);
  -[NSMutableArray removeAllObjects](self->_ringBuffer, "removeAllObjects");
  pthread_mutex_unlock((pthread_mutex_t *)self->_mutex);
}

- (id)objectsForPTS:(id *)a3
{
  NSMutableArray *ringBuffer;
  void *DetectedObjectsInfoClosestToPTS;
  CMTime v8;

  pthread_mutex_lock((pthread_mutex_t *)self->_mutex);
  ringBuffer = self->_ringBuffer;
  v8 = *(CMTime *)a3;
  DetectedObjectsInfoClosestToPTS = (void *)doirb_findDetectedObjectsInfoClosestToPTS(ringBuffer, &v8);
  pthread_mutex_unlock((pthread_mutex_t *)self->_mutex);
  return DetectedObjectsInfoClosestToPTS;
}

- (float)secondsSinceLastObjectDetected
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
  flags = self->_lastStableObjectPTS.flags;
  Seconds = -1.0;
  if ((flags & 1) != 0)
  {
    v5 = self->_lastUpdatePTS.flags;
    if ((v5 & 1) != 0)
    {
      value = self->_lastUpdatePTS.value;
      rhs.epoch = self->_lastStableObjectPTS.epoch;
      lhs.value = value;
      lhs.timescale = self->_lastUpdatePTS.timescale;
      lhs.flags = v5;
      v7 = self->_lastStableObjectPTS.value;
      lhs.epoch = self->_lastUpdatePTS.epoch;
      rhs.value = v7;
      rhs.timescale = self->_lastStableObjectPTS.timescale;
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
