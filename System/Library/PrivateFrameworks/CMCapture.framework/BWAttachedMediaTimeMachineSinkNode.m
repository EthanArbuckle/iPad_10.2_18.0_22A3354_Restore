@implementation BWAttachedMediaTimeMachineSinkNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWAttachedMediaTimeMachineSinkNode)initWithTimeMachineCapacity:(int)a3 attachedMediaKeys:(id)a4 metadataKeys:(id)a5 sinkID:(id)a6
{
  BWAttachedMediaTimeMachineSinkNode *v11;
  BWNodeInput *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  BWNodeInputMediaConfiguration *v19;
  BWNodeInputMediaConfiguration *v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a4, "count"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("The attachedMediaKeys array needs to have at least one element"), 0));
  v27.receiver = self;
  v27.super_class = (Class)BWAttachedMediaTimeMachineSinkNode;
  v11 = -[BWSinkNode initWithSinkID:](&v27, sel_initWithSinkID_, a6);
  if (v11)
  {
    v12 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v11);
    -[BWNodeInput setFormatRequirements:](v12, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    v11->_timeMachineCapacity = a3;
    -[BWNode addInput:](v11, "addInput:", v12);
    v11->_timeMachineFrames = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11->_timeMachineLock._os_unfair_lock_opaque = 0;
    if (a4)
    {
      v13 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", a4);
      v11->_attachedMediaKeys = v13;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v24 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            if ((objc_msgSend(v18, "isEqualToString:", CFSTR("PrimaryFormat")) & 1) == 0)
            {
              v19 = objc_alloc_init(BWNodeInputMediaConfiguration);
              -[BWNodeInput formatRequirements](v11->super.super._input, "formatRequirements");
              -[BWNodeInputMediaConfiguration setFormatRequirements:](v19, "setFormatRequirements:", objc_alloc_init((Class)objc_opt_class()));
              -[BWNodeInputMediaConfiguration setPassthroughMode:](v19, "setPassthroughMode:", 0);
              -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v11->super.super._input, "setMediaConfiguration:forAttachedMediaKey:", v19, v18);
              -[NSMutableDictionary setObject:forKeyedSubscript:](v11->_timeMachineFrames, "setObject:forKeyedSubscript:", objc_alloc_init(MEMORY[0x1E0C99DE8]), v18);
            }
          }
          v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        }
        while (v15);
      }
      -[BWNodeInputMediaConfiguration setPassthroughMode:](-[BWNodeInput primaryMediaConfiguration](v11->super.super._input, "primaryMediaConfiguration"), "setPassthroughMode:", 0);
      v20 = objc_alloc_init(BWNodeInputMediaConfiguration);
      -[BWNodeInputMediaConfiguration setFormatRequirements:](v20, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
      -[BWNodeInputMediaConfiguration setPassthroughMode:](v20, "setPassthroughMode:", 0);
      -[BWNodeInput setUnspecifiedAttachedMediaConfiguration:](v11->super.super._input, "setUnspecifiedAttachedMediaConfiguration:", v20);
      if (a5)
      {
        v11->_metadataKeys = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", a5);
        v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v11->_timeMachineFrames, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D05CB0]);
        return v11;
      }
      fig_log_get_emitter();
    }
    else
    {
      fig_log_get_emitter();
    }
    FigDebugAssert3();
  }
  return v11;
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  objc_super v5;

  if (a3 && a4)
  {
    v5.receiver = self;
    v5.super_class = (Class)BWAttachedMediaTimeMachineSinkNode;
    -[BWNode didSelectFormat:forInput:forAttachedMediaKey:](&v5, sel_didSelectFormat_forInput_forAttachedMediaKey_);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (void)dealloc
{
  opaqueCMFormatDescription *formatDescription;
  objc_super v4;

  formatDescription = self->_formatDescription;
  if (formatDescription)
    CFRelease(formatDescription);
  v4.receiver = self;
  v4.super_class = (Class)BWAttachedMediaTimeMachineSinkNode;
  -[BWSinkNode dealloc](&v4, sel_dealloc);
}

- (id)nodeSubType
{
  return CFSTR("AttachedMediaTimeMachine");
}

- (void)didReachEndOfDataForInput:(id)a3
{
  os_unfair_lock_s *p_timeMachineLock;
  objc_super v6;

  p_timeMachineLock = &self->_timeMachineLock;
  os_unfair_lock_lock(&self->_timeMachineLock);

  self->_timeMachineFrames = 0;
  os_unfair_lock_unlock(p_timeMachineLock);
  v6.receiver = self;
  v6.super_class = (Class)BWAttachedMediaTimeMachineSinkNode;
  -[BWSinkNode didReachEndOfDataForInput:](&v6, sel_didReachEndOfDataForInput_, a3);
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  opaqueCMSampleBuffer *v4;
  void *v6;
  uint64_t v7;
  opaqueCMSampleBuffer *AttachedMedia;
  opaqueCMSampleBuffer *v9;
  NSArray *attachedMediaKeys;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  opaqueCMSampleBuffer *v17;
  uint64_t v18;
  void *v19;
  CFTypeRef v20;
  const void *v21;
  CFTypeRef v22;
  void *v23;
  void *v24;
  NSArray *metadataKeys;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  const __CFString *key;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v4 = a3;
  v41 = *MEMORY[0x1E0C80C00];
  key = (const __CFString *)*MEMORY[0x1E0D05CB0];
  v6 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v7 = *MEMORY[0x1E0D06EB8];
  if ((objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D06EB8]), "BOOLValue") & 1) == 0)
  {
    AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(v4, (uint64_t)CFSTR("SynchronizedSlaveFrame"));
    if (AttachedMedia)
    {
      v9 = AttachedMedia;
      if (objc_msgSend((id)objc_msgSend((id)CMGetAttachment(AttachedMedia, key, 0), "objectForKeyedSubscript:", v7), "BOOLValue"))v4 = v9;
    }
  }
  os_unfair_lock_lock(&self->_timeMachineLock);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  attachedMediaKeys = self->_attachedMediaKeys;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](attachedMediaKeys, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v36 != v13)
          objc_enumerationMutation(attachedMediaKeys);
        v15 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        v16 = BWSampleBufferGetAttachedMedia(v4, v15);
        if (v16)
        {
          v17 = (opaqueCMSampleBuffer *)v16;
          v18 = -[NSMutableDictionary objectForKeyedSubscript:](self->_timeMachineFrames, "objectForKeyedSubscript:", v15);
          if (!v18)
            goto LABEL_29;
          v19 = (void *)v18;
          v20 = -[BWAttachedMediaTimeMachineSinkNode _newSampleBufferfromSbuf:]((uint64_t)self, v17);
          if (!v20)
            goto LABEL_29;
          v21 = v20;
          objc_msgSend(v19, "addObject:", v20);
          if (objc_msgSend(v19, "count") > (unint64_t)self->_timeMachineCapacity)
            objc_msgSend(v19, "removeObjectAtIndex:", 0);
          CFRelease(v21);
        }
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](attachedMediaKeys, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v12);
  }
  if (self->_metadataKeys)
  {
    v22 = CMGetAttachment(v4, key, 0);
    if (v22)
    {
      v23 = (void *)v22;
      v24 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      metadataKeys = self->_metadataKeys;
      v26 = -[NSArray countByEnumeratingWithState:objects:count:](metadataKeys, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v32;
        do
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v32 != v28)
              objc_enumerationMutation(metadataKeys);
            objc_msgSend(v24, "setObject:forKeyedSubscript:", objc_msgSend(v23, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j)), *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j));
          }
          v27 = -[NSArray countByEnumeratingWithState:objects:count:](metadataKeys, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        }
        while (v27);
      }
      objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_timeMachineFrames, "objectForKeyedSubscript:", key), "addObject:", v24);
      if (objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_timeMachineFrames, "objectForKeyedSubscript:", key), "count") > (unint64_t)self->_timeMachineCapacity)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_timeMachineFrames, "objectForKeyedSubscript:", key), "removeObjectAtIndex:", 0);
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
LABEL_29:
  os_unfair_lock_unlock(&self->_timeMachineLock);
}

- (CFTypeRef)_newSampleBufferfromSbuf:(uint64_t)a1
{
  __CVBuffer *ImageBuffer;
  uint64_t PixelFormatType;
  __CVBuffer *v6;
  size_t Width;
  __CVBuffer *v8;
  size_t Height;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFDictionary *v15;
  uint64_t v16;
  CFTypeRef v17;
  CFTypeRef cf;
  _QWORD v20[4];
  _QWORD v21[4];
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  cf = 0;
  ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
  PixelFormatType = CVPixelBufferGetPixelFormatType(ImageBuffer);
  v6 = CMSampleBufferGetImageBuffer(sbuf);
  Width = CVPixelBufferGetWidth(v6);
  v8 = CMSampleBufferGetImageBuffer(sbuf);
  Height = CVPixelBufferGetHeight(v8);
  v22[0] = *MEMORY[0x1E0CBBEE8];
  v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "memoryPool"), "poolIdentifier"));
  v11 = *MEMORY[0x1E0CBBF10];
  v23[0] = v10;
  v23[1] = &unk_1E49F9EB8;
  v12 = *MEMORY[0x1E0CBC050];
  v22[1] = v11;
  v22[2] = v12;
  v23[2] = MEMORY[0x1E0C9AAB0];
  v13 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v20[0] = *MEMORY[0x1E0CA9040];
  v21[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", PixelFormatType);
  v20[1] = *MEMORY[0x1E0CA90E0];
  v21[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", Width);
  v20[2] = *MEMORY[0x1E0CA8FD8];
  v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", Height);
  v20[3] = *MEMORY[0x1E0CA8FF0];
  v21[2] = v14;
  v21[3] = v13;
  v15 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], Width, Height, PixelFormatType, v15, (CVPixelBufferRef *)&cf);
  if (!cf)
    return 0;
  CMSampleBufferGetImageBuffer(sbuf);
  if (CopyPixelBuffer())
    v17 = 0;
  else
    v17 = -[BWAttachedMediaTimeMachineSinkNode _newOutputSampleBufferFromSampleBuffer:pixelBuffer:additionalMetadata:formatDescriptionInOut:](a1, sbuf, (__CVBuffer *)cf, v16, (CFTypeRef *)(a1 + 184));
  if (cf)
    CFRelease(cf);
  return v17;
}

- (id)getMetadataDictionaryForPts:(id *)a3
{
  os_unfair_lock_s *p_timeMachineLock;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11;

  p_timeMachineLock = &self->_timeMachineLock;
  os_unfair_lock_lock(&self->_timeMachineLock);
  if (self->_metadataKeys
    && (v6 = -[NSMutableDictionary objectForKeyedSubscript:](self->_timeMachineFrames, "objectForKeyedSubscript:", *MEMORY[0x1E0D05CB0])) != 0&& (v7 = (void *)v6, v11 = *a3, v8 = -[BWAttachedMediaTimeMachineSinkNode _indexOfMetadataClosestToPTS:]((uint64_t)self, (CMTime *)&v11), v8 < objc_msgSend(v7, "count")))
  {
    v9 = (void *)objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
  }
  else
  {
    v9 = 0;
  }
  os_unfair_lock_unlock(p_timeMachineLock);
  return v9;
}

- (uint64_t)_indexOfMetadataClosestToPTS:(uint64_t)a1
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  float v7;
  void *v8;
  void *v9;
  double Seconds;
  float v11;
  CMTimeRange v13;
  CMTime time2;
  CMTime time;
  CMTime duration;
  CMTime rhs;
  CMTime start;
  CMTimeRange v19;
  CMTime v20;

  v2 = a1;
  if (a1)
  {
    memset(&v20, 0, sizeof(v20));
    CMTimeMake(&v20, 1, 1000);
    memset(&v19, 0, sizeof(v19));
    *(_OWORD *)&v13.start.value = *(_OWORD *)&a2->value;
    v13.start.epoch = a2->epoch;
    rhs = v20;
    CMTimeSubtract(&start, &v13.start, &rhs);
    v13.start = v20;
    CMTimeMultiply(&duration, &v13.start, 2);
    CMTimeRangeMake(&v19, &start, &duration);
    os_unfair_lock_assert_owner((const os_unfair_lock *)(v2 + 176));
    v4 = (void *)objc_msgSend(*(id *)(v2 + 168), "objectForKeyedSubscript:", *MEMORY[0x1E0D05CB0]);
    if (objc_msgSend(v4, "count"))
    {
      v5 = 0;
      v2 = 0;
      v6 = *MEMORY[0x1E0D05D00];
      v7 = 3.4028e38;
      while (1)
      {
        v8 = (void *)objc_msgSend(v4, "objectAtIndexedSubscript:", v5);
        if (v8)
        {
          v9 = v8;
          if (objc_msgSend(v8, "objectForKeyedSubscript:", v6))
          {
            memset(&rhs, 0, sizeof(rhs));
            CMTimeMakeFromDictionary(&rhs, (CFDictionaryRef)objc_msgSend(v9, "objectForKeyedSubscript:", v6));
            *(_OWORD *)&v13.start.value = *(_OWORD *)&a2->value;
            v13.start.epoch = a2->epoch;
            time2 = rhs;
            CMTimeSubtract(&time, &v13.start, &time2);
            Seconds = CMTimeGetSeconds(&time);
            v13 = v19;
            time2 = rhs;
            if (CMTimeRangeContainsTime(&v13, &time2))
              return v5;
            v13.start = rhs;
            time2 = *a2;
            if (!CMTimeCompare(&v13.start, &time2))
              return v5;
            v11 = Seconds;
            if (fabsf(v11) < fabsf(v7))
            {
              v2 = v5;
              v7 = Seconds;
            }
          }
        }
        if (++v5 >= (unint64_t)objc_msgSend(v4, "count"))
          return v2;
      }
    }
    return 0;
  }
  return v2;
}

- (opaqueCMSampleBuffer)copyAttachedMediaSampleBufferForPts:(id *)a3 attachedMediaKey:(id)a4
{
  os_unfair_lock_s *p_timeMachineLock;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  opaqueCMSampleBuffer *v11;
  opaqueCMSampleBuffer *v12;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14;

  p_timeMachineLock = &self->_timeMachineLock;
  os_unfair_lock_lock(&self->_timeMachineLock);
  v8 = -[NSMutableDictionary objectForKeyedSubscript:](self->_timeMachineFrames, "objectForKeyedSubscript:", a4);
  if (v8
    && (v9 = (void *)v8,
        v14 = *a3,
        v10 = -[BWAttachedMediaTimeMachineSinkNode _indexOfSampleBufferClosestToPTS:attachedMediaKey:]((uint64_t)self, (CMTime *)&v14, (uint64_t)a4), v10 < objc_msgSend(v9, "count"))&& (v11 = (opaqueCMSampleBuffer *)objc_msgSend(v9, "objectAtIndexedSubscript:", v10)) != 0)
  {
    v12 = (opaqueCMSampleBuffer *)-[BWAttachedMediaTimeMachineSinkNode _newSampleBufferfromSbuf:]((uint64_t)self, v11);
  }
  else
  {
    v12 = 0;
  }
  os_unfair_lock_unlock(p_timeMachineLock);
  return v12;
}

- (uint64_t)_indexOfSampleBufferClosestToPTS:(uint64_t)a3 attachedMediaKey:
{
  uint64_t v6;
  uint64_t v7;
  float v8;
  double Seconds;
  float v10;
  CMTimeRange v12;
  CMTime time2;
  CMTime time;
  CMTime duration;
  CMTime rhs;
  CMTime start;
  CMTimeRange v18;
  CMTime v19;

  if (!a1)
    return 0;
  memset(&v19, 0, sizeof(v19));
  CMTimeMake(&v19, 1, 1000);
  memset(&v18, 0, sizeof(v18));
  *(_OWORD *)&v12.start.value = *(_OWORD *)&a2->value;
  v12.start.epoch = a2->epoch;
  rhs = v19;
  CMTimeSubtract(&start, &v12.start, &rhs);
  v12.start = v19;
  CMTimeMultiply(&duration, &v12.start, 2);
  CMTimeRangeMake(&v18, &start, &duration);
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 176));
  if (!objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "objectForKeyedSubscript:", a3), "count"))
    return 0;
  v6 = 0;
  v7 = 0;
  v8 = 3.4028e38;
  while (1)
  {
    memset(&rhs, 0, sizeof(rhs));
    CMSampleBufferGetPresentationTimeStamp(&rhs, (CMSampleBufferRef)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "objectForKeyedSubscript:", a3), "objectAtIndexedSubscript:", v6));
    *(_OWORD *)&v12.start.value = *(_OWORD *)&a2->value;
    v12.start.epoch = a2->epoch;
    time2 = rhs;
    CMTimeSubtract(&time, &v12.start, &time2);
    Seconds = CMTimeGetSeconds(&time);
    v12 = v18;
    time2 = rhs;
    if (CMTimeRangeContainsTime(&v12, &time2))
      break;
    v12.start = rhs;
    time2 = *a2;
    if (!CMTimeCompare(&v12.start, &time2))
      break;
    v10 = Seconds;
    if (fabsf(v10) < fabsf(v8))
    {
      v7 = v6;
      v8 = Seconds;
    }
    if (++v6 >= (unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "objectForKeyedSubscript:", a3), "count"))return v7;
  }
  return v6;
}

- (CFTypeRef)_newOutputSampleBufferFromSampleBuffer:(__CVBuffer *)a3 pixelBuffer:(uint64_t)a4 additionalMetadata:(CFTypeRef *)a5 formatDescriptionInOut:
{
  CFTypeRef v6;
  int CopyWithNewPixelBuffer;
  CFTypeRef cf;

  if (!a1)
    return 0;
  v6 = 0;
  cf = 0;
  if (a2 && a3)
  {
    CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer(a2, a3, a5, (CMSampleBufferRef *)&cf);
    v6 = cf;
    if (!CopyWithNewPixelBuffer)
    {
      CopyWithNewPixelBuffer = BWCMSampleBufferCopyMetadataToSampleBuffer(a2, cf);
      v6 = cf;
    }
    if (CopyWithNewPixelBuffer && v6)
    {
      CFRelease(v6);
      return 0;
    }
  }
  return v6;
}

@end
