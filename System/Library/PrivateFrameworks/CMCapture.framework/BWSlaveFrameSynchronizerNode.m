@implementation BWSlaveFrameSynchronizerNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  BWNodeOutput *v9;
  void *v10;
  const __CFString **v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  BWNodeOutputMediaProperties *v19;
  uint64_t v20;
  BWSlaveFrameSynchronizerNode *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;
  _QWORD v28[2];
  const __CFString *v29;
  _QWORD v30[3];

  v30[1] = *MEMORY[0x1E0C80C00];
  v9 = -[BWNode output](self, "output");
  v21 = self;
  if (objc_msgSend(a5, "isEqualToString:", CFSTR("PrimaryFormat")))
  {
    if (!self->_differentInputFormatsSupported)
    {
      v28[0] = CFSTR("PrimaryFormat");
      v28[1] = CFSTR("SynchronizedSlaveFrame");
      v10 = (void *)MEMORY[0x1E0C99D20];
      v11 = (const __CFString **)v28;
      v12 = 2;
      goto LABEL_9;
    }
    if (objc_msgSend(a4, "index") == 1)
    {
      v30[0] = CFSTR("PrimaryFormat");
      v10 = (void *)MEMORY[0x1E0C99D20];
      v11 = (const __CFString **)v30;
    }
    else
    {
      v29 = CFSTR("SynchronizedSlaveFrame");
      v10 = (void *)MEMORY[0x1E0C99D20];
      v11 = &v29;
    }
  }
  else
  {
    v27 = -[BWNodeOutput attachedMediaKeyDrivenByInputAttachedMediaKey:inputIndex:](v9, "attachedMediaKeyDrivenByInputAttachedMediaKey:inputIndex:", a5, objc_msgSend(a4, "index"));
    v10 = (void *)MEMORY[0x1E0C99D20];
    v11 = (const __CFString **)&v27;
  }
  v12 = 1;
LABEL_9:
  v13 = (void *)objc_msgSend(v10, "arrayWithObjects:count:", v11, v12);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v19 = -[BWNodeOutput mediaPropertiesForAttachedMediaKey:](v9, "mediaPropertiesForAttachedMediaKey:", v18);
        if (!v19)
        {
          if (objc_msgSend(v18, "isEqualToString:", CFSTR("PrimaryFormat")))
          {
            v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ output %@ has no media properties for the primary format (provided media key is %@)"), v21, v9, a5);
            objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v20, 0));
          }
          v19 = objc_alloc_init(BWNodeOutputMediaProperties);
          -[BWNodeOutput _setMediaProperties:forAttachedMediaKey:](v9, "_setMediaProperties:forAttachedMediaKey:", v19, v18);
        }
        -[BWNodeOutputMediaProperties setResolvedFormat:](v19, "setResolvedFormat:", a3);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v15);
  }
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  os_unfair_lock_s *p_bufferServicingLock;

  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  if (!-[BWNodeOutput liveFormat](self->super._output, "liveFormat"))
    -[BWNodeOutput makeConfiguredFormatLive](self->super._output, "makeConfiguredFormatLive");
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (id)nodeType
{
  return CFSTR("Muxer");
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  os_unfair_lock_s *p_bufferServicingLock;
  opaqueCMSimpleQueue **inputSampleBufferQueues;
  opaqueCMSimpleQueue *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  CFTypeRef v17;
  CMTime v18;
  CMTime v19;
  CMTime v20;

  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  if (BWSampleBufferIsMarkerBuffer(a3))
  {
    -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3);
  }
  else
  {
    inputSampleBufferQueues = self->_inputSampleBufferQueues;
    v9 = inputSampleBufferQueues[objc_msgSend(a4, "index")];
    v10 = (const __CFString *)*MEMORY[0x1E0D05CB0];
    v11 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v12 = *MEMORY[0x1E0D06EB0];
    objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D06EB0]), "intValue");
    v13 = *MEMORY[0x1E0D06EB8];
    if (objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D06EB8]), "BOOLValue"))
    {
      self->_mostRecentMasterInputIndex = objc_msgSend(a4, "index");
    }
    else if (!self->_slaveStreamHasStarted)
    {
      self->_slaveStreamHasStarted = 1;
    }
    if (CMSimpleQueueGetCount(v9) == self->_numBufferedFrames)
    {
      v14 = (void *)CMSimpleQueueDequeue(v9);
      v15 = (void *)CMGetAttachment(v14, v10, 0);
      v16 = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", v12), "intValue");
      objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", v13), "BOOLValue");
      memset(&v20, 0, sizeof(v20));
      CMSampleBufferGetPresentationTimeStamp(&v20, (CMSampleBufferRef)v14);
      memset(&v19, 0, sizeof(v19));
      CMSampleBufferGetPresentationTimeStamp(&v19, a3);
      -[BWSlaveFrameSynchronizerNode _printState]((unint64_t)self);
      objc_msgSend(a4, "index");
      v18 = v20;
      -[BWSlaveFrameSynchronizerNode _emitDroppedFrames:captureID:inputIndex:]((uint64_t)self, &v18, v16);
      if (v14)
        CFRelease(v14);
    }
    if (a3)
      v17 = CFRetain(a3);
    else
      v17 = 0;
    if (CMSimpleQueueEnqueue(v9, v17))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      if (a3)
        CFRelease(a3);
    }
    else
    {
      -[BWSlaveFrameSynchronizerNode _purgeAllPurgeableBuffers](self);
      -[BWSlaveFrameSynchronizerNode _tryToEmitBuffersWithSynchronizationEnabled:]((uint64_t)self, 1);
    }
  }
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (_QWORD)_purgeAllPurgeableBuffers
{
  _QWORD *v1;
  unint64_t v2;
  const __CFString *v3;
  uint64_t v4;
  int v5;
  uint64_t *v6;
  uint64_t v7;
  opaqueCMSampleBuffer *Head;
  opaqueCMSampleBuffer *v9;
  void *v10;
  int v11;
  int v12;
  unint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  opaqueCMSimpleQueue *v17;
  opaqueCMSampleBuffer *v18;
  opaqueCMSampleBuffer *v19;
  void *v20;
  int v21;
  int v22;
  const void *v23;
  opaqueCMSampleBuffer *v24;
  char v25;
  CMTime v26;
  CMTime v27;

  if (result)
  {
    v1 = result;
    if (objc_msgSend((id)objc_msgSend(result, "inputs"), "count"))
    {
      v2 = 0;
      v3 = (const __CFString *)*MEMORY[0x1E0D05CB0];
      v4 = *MEMORY[0x1E0D06EB0];
      v5 = -1;
      v6 = (uint64_t *)MEMORY[0x1E0D06EB8];
      v7 = *MEMORY[0x1E0D06EB8];
      do
      {
        Head = (opaqueCMSampleBuffer *)CMSimpleQueueGetHead(*(CMSimpleQueueRef *)(v1[13] + 8 * v2));
        if (Head)
        {
          v9 = Head;
          v10 = (void *)CMGetAttachment(Head, v3, 0);
          v11 = objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", v4), "intValue");
          if (v11 > v5)
          {
            v12 = v11;
            objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", v7), "BOOLValue");
            CMSampleBufferGetPresentationTimeStamp(&v27, v9);
            v5 = v12;
          }
        }
        ++v2;
      }
      while (objc_msgSend((id)objc_msgSend(v1, "inputs"), "count") > v2);
    }
    else
    {
      v6 = (uint64_t *)MEMORY[0x1E0D06EB8];
      v5 = -1;
    }
    result = (_QWORD *)objc_msgSend((id)objc_msgSend(v1, "inputs"), "count");
    if (result)
    {
      v13 = 0;
      v25 = 0;
      v14 = (const __CFString *)*MEMORY[0x1E0D05CB0];
      v15 = *MEMORY[0x1E0D06EB0];
      v16 = *v6;
      do
      {
        v17 = *(opaqueCMSimpleQueue **)(v1[13] + 8 * v13);
        v18 = (opaqueCMSampleBuffer *)CMSimpleQueueGetHead(v17);
        if (v18)
        {
          v19 = v18;
          v20 = (void *)CMGetAttachment(v18, v14, 0);
          v21 = objc_msgSend((id)objc_msgSend(v20, "objectForKeyedSubscript:", v15), "intValue");
          if (v21 < v5)
          {
            v22 = v21;
            do
            {
              objc_msgSend((id)objc_msgSend(v20, "objectForKeyedSubscript:", v16), "BOOLValue");
              memset(&v27, 0, sizeof(v27));
              CMSampleBufferGetPresentationTimeStamp(&v27, v19);
              v23 = CMSimpleQueueDequeue(v17);
              v26 = v27;
              -[BWSlaveFrameSynchronizerNode _emitDroppedFrames:captureID:inputIndex:]((uint64_t)v1, &v26, v22);
              if (v23)
                CFRelease(v23);
              v24 = (opaqueCMSampleBuffer *)CMSimpleQueueGetHead(v17);
              if (!v24)
                break;
              v19 = v24;
              v20 = (void *)CMGetAttachment(v24, v14, 0);
              v22 = objc_msgSend((id)objc_msgSend(v20, "objectForKeyedSubscript:", v15), "intValue");
            }
            while (v22 < v5);
            v25 = 1;
          }
        }
        ++v13;
        result = (_QWORD *)objc_msgSend((id)objc_msgSend(v1, "inputs"), "count");
      }
      while ((unint64_t)result > v13);
      if ((v25 & 1) != 0)
        return (_QWORD *)-[BWSlaveFrameSynchronizerNode _printState]((unint64_t)v1);
    }
  }
  return result;
}

- (void)_emitDroppedFrames:(uint64_t)a1 captureID:(CMTime *)a2 inputIndex:(int)a3
{
  const __CFDictionary *v6;
  CMTime v7;
  CMTime time1;
  CMTime v9;

  if (a1)
  {
    while (objc_msgSend(*(id *)(a1 + 136), "count"))
    {
      v6 = (const __CFDictionary *)objc_msgSend(*(id *)(a1 + 136), "objectAtIndexedSubscript:", 0);
      memset(&v9, 0, sizeof(v9));
      CMTimeMakeFromDictionary(&v9, v6);
      time1 = v9;
      v7 = *a2;
      if (CMTimeCompare(&time1, &v7) >= 1)
        break;
      time1 = v9;
      -[BWSlaveFrameSynchronizerNode _emitDroppedFrame:captureID:inputIndex:](a1, &time1);
      objc_msgSend(*(id *)(a1 + 136), "removeObject:", v6);
    }
    if (a3 != -1)
    {
      v9 = *a2;
      -[BWSlaveFrameSynchronizerNode _emitDroppedFrame:captureID:inputIndex:](a1, &v9);
    }
  }
}

- (unint64_t)_printState
{
  unint64_t v1;
  void *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const void *Head;
  uint64_t Count;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  const char *v12;
  const __CFString *key;

  if (result)
  {
    v1 = result;
    v2 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    result = objc_msgSend((id)objc_msgSend((id)v1, "inputs"), "count");
    if (result)
    {
      v3 = 0;
      key = (const __CFString *)*MEMORY[0x1E0D05CB0];
      v4 = *MEMORY[0x1E0D06EB8];
      v5 = *MEMORY[0x1E0D06EB0];
      do
      {
        Head = CMSimpleQueueGetHead(*(CMSimpleQueueRef *)(*(_QWORD *)(v1 + 104) + 8 * v3));
        Count = CMSimpleQueueGetCount(*(CMSimpleQueueRef *)(*(_QWORD *)(v1 + 104) + 8 * v3));
        v8 = *(unsigned int *)(v1 + 112);
        objc_msgSend(v2, "appendFormat:", CFSTR(" [%d] = {"), v3);
        if (Head)
        {
          v9 = (void *)CMGetAttachment(Head, key, 0);
          v10 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", v4), "BOOLValue");
          v11 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", v5), "intValue");
          v12 = "s";
          if (v10)
            v12 = "m";
          objc_msgSend(v2, "appendFormat:", CFSTR(" %d/%d head:%d(%s) "), Count, v8, v11, v12);
        }
        objc_msgSend(v2, "appendFormat:", CFSTR("}"));
        ++v3;
        result = objc_msgSend((id)objc_msgSend((id)v1, "inputs"), "count");
      }
      while (result > v3);
    }
  }
  return result;
}

- (void)_emitDroppedFrame:(uint64_t)a1 captureID:(CMTime *)a2 inputIndex:
{
  id v4;
  CMTime v5;

  if (a1)
  {
    if (*MEMORY[0x1E0CA1FC0] == 1)
    {
      v5 = *a2;
      CMTimeGetSeconds(&v5);
      kdebug_trace();
    }
    v5 = *a2;
    v4 = +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", 0x1E494EF78, &v5);
    objc_msgSend(*(id *)(a1 + 16), "emitDroppedSample:", v4);

  }
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BWNodeInput *v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = -[BWNode inputs](self, "inputs");
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(BWNodeInput **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (v8 != self->super._input)
          -[BWFormat isEqual:](-[BWNodeInput format](v8, "format"), "isEqual:", -[BWNodeInput format](self->super._input, "format"));
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  self->_slaveStreamHasStarted = 0;
  self->_numSlaveFramesReceived = 0;
  v9.receiver = self;
  v9.super_class = (Class)BWSlaveFrameSynchronizerNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v9, sel_prepareForCurrentConfigurationToBecomeLive);
}

+ (void)initialize
{
  objc_opt_class();
}

- (BWSlaveFrameSynchronizerNode)initWithDepthEnabled:(BOOL)a3 numberOfInputs:(int)a4 syncSlaveForMasterPortTypes:(id)a5 separateDepthComponentsEnabled:(BOOL)a6 preLTMThumbnailEnabled:(BOOL)a7 postColorProcessingThumbnailEnabled:(BOOL)a8 numberOfSecondaryFramesToSkip:(int)a9
{
  _BOOL4 v9;
  _BOOL8 v10;
  uint64_t v12;
  _BOOL8 v13;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;

  v9 = a8;
  v10 = a6;
  v12 = *(_QWORD *)&a4;
  v13 = a3;
  if (a7)
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    if ((int)v12 >= 1)
    {
      v16 = 0;
      do
      {
        objc_msgSend(v15, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v16));
        v16 = (v16 + 1);
      }
      while ((_DWORD)v12 != (_DWORD)v16);
    }
  }
  else
  {
    v15 = 0;
  }
  if (v9)
  {
    v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    if ((int)v12 >= 1)
    {
      v18 = 0;
      do
      {
        objc_msgSend(v17, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v18));
        v18 = (v18 + 1);
      }
      while ((_DWORD)v12 != (_DWORD)v18);
    }
  }
  else
  {
    v17 = 0;
  }
  BYTE4(v21) = 1;
  HIDWORD(v20) = 1;
  LODWORD(v21) = a9;
  LOBYTE(v20) = 0;
  return -[BWSlaveFrameSynchronizerNode initWithDepthEnabled:numberOfInputs:syncSlaveForMasterPortTypes:separateDepthComponentsEnabled:preLTMThumbnailEnabledInputs:postColorProcessingThumbnailEnabledInputs:differentInputFormatsSupported:bufferSize:numberOfSlaveFramesToSkip:startEmittingMasterFramesBeforeSlaveStreamStarts:](self, "initWithDepthEnabled:numberOfInputs:syncSlaveForMasterPortTypes:separateDepthComponentsEnabled:preLTMThumbnailEnabledInputs:postColorProcessingThumbnailEnabledInputs:differentInputFormatsSupported:bufferSize:numberOfSlaveFramesToSkip:startEmittingMasterFramesBeforeSlaveStreamStarts:", v13, v12, a5, v10, v15, v17, v20, v21);
}

- (BWSlaveFrameSynchronizerNode)initWithDepthEnabled:(BOOL)a3 numberOfInputs:(int)a4 syncSlaveForMasterPortTypes:(id)a5 separateDepthComponentsEnabled:(BOOL)a6 preLTMThumbnailEnabledInputs:(id)a7 postColorProcessingThumbnailEnabledInputs:(id)a8 differentInputFormatsSupported:(BOOL)a9 bufferSize:(int)a10 numberOfSlaveFramesToSkip:(int)a11 startEmittingMasterFramesBeforeSlaveStreamStarts:(BOOL)a12
{
  BWSlaveFrameSynchronizerNode *v16;
  BWSlaveFrameSynchronizerNode *v17;
  uint64_t v18;
  BWNodeInput *v19;
  BWNodeInputMediaConfiguration *v20;
  const __CFString *v21;
  BWNodeOutput *v22;
  BWNodeOutputMediaConfiguration *v23;
  uint64_t v24;
  __CFString **v25;
  uint64_t v26;
  const __CFAllocator *v27;
  id v29;
  int v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  _BOOL4 v34;
  objc_super v35;

  v32 = a6;
  v34 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BWSlaveFrameSynchronizerNode;
  v16 = -[BWNode init](&v35, sel_init);
  v17 = v16;
  if (v16)
  {
    v29 = a5;
    -[BWNode setSupportsConcurrentLiveInputCallbacks:](v16, "setSupportsConcurrentLiveInputCallbacks:", 1);
    v17->_numBufferedFrames = a10;
    v17->_differentInputFormatsSupported = a9;
    v33 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v31 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v30 = a4;
    if (a4 >= 1)
    {
      v18 = 0;
      do
      {
        v19 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1986618469, v17, v18);
        -[BWNodeInputMediaConfiguration setFormatRequirements:](-[BWNodeInput primaryMediaConfiguration](v19, "primaryMediaConfiguration"), "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
        -[BWNodeInputMediaConfiguration setPassthroughMode:](-[BWNodeInput primaryMediaConfiguration](v19, "primaryMediaConfiguration"), "setPassthroughMode:", 1);
        -[BWNodeInputMediaConfiguration setDelayedBufferCount:](-[BWNodeInput primaryMediaConfiguration](v19, "primaryMediaConfiguration"), "setDelayedBufferCount:", v17->_numBufferedFrames);
        if (v18)
        {
          v20 = objc_alloc_init(BWNodeInputMediaConfiguration);
          -[BWNodeInputMediaConfiguration setPassthroughMode:](v20, "setPassthroughMode:", 0);
          -[BWNodeInput setUnspecifiedAttachedMediaConfiguration:](v19, "setUnspecifiedAttachedMediaConfiguration:", v20);
          if (v34)
          {
            v21 = CFSTR("Depth");
            if (v32)
            {
              -[BWSlaveFrameSynchronizerNode _setupAttachedMediaConfigurationForInput:attachedMediaKey:]((uint64_t)v17, v19, (uint64_t)CFSTR("DepthData_DX"));
              v21 = CFSTR("DepthData_DY");
            }
            -[BWSlaveFrameSynchronizerNode _setupAttachedMediaConfigurationForInput:attachedMediaKey:]((uint64_t)v17, v19, (uint64_t)v21);
            objc_msgSend(v31, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v18));
          }
        }
        if (objc_msgSend(a7, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v18)))
          -[BWSlaveFrameSynchronizerNode _setupAttachedMediaConfigurationForInput:attachedMediaKey:]((uint64_t)v17, v19, 0x1E494FBD8);
        if (objc_msgSend(a8, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v18)))
          -[BWSlaveFrameSynchronizerNode _setupAttachedMediaConfigurationForInput:attachedMediaKey:]((uint64_t)v17, v19, 0x1E495B478);
        -[BWNode addInput:](v17, "addInput:", v19);

        if (v18 || !v17->_differentInputFormatsSupported)
          objc_msgSend(v33, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v18));
        ++v18;
      }
      while (v30 != v18);
    }
    v22 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v17);
    -[BWNodeOutputMediaConfiguration setFormatRequirements:](-[BWNodeOutput primaryMediaConfiguration](v22, "primaryMediaConfiguration"), "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeOutputMediaConfiguration setPassthroughMode:](-[BWNodeOutput primaryMediaConfiguration](v22, "primaryMediaConfiguration"), "setPassthroughMode:", 1);
    -[BWNodeOutputMediaConfiguration setIndexesOfInputsWhichDrivesThisOutput:](-[BWNodeOutput primaryMediaConfiguration](v22, "primaryMediaConfiguration"), "setIndexesOfInputsWhichDrivesThisOutput:", v33);
    v23 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    -[BWNodeOutputMediaConfiguration setFormatRequirements:](v23, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeOutputMediaConfiguration setPassthroughMode:](v23, "setPassthroughMode:", 1);
    -[BWNodeOutputMediaConfiguration setIndexesOfInputsWhichDrivesThisOutput:](v23, "setIndexesOfInputsWhichDrivesThisOutput:", v33);
    -[BWNodeOutputMediaConfiguration setAttachedMediaKeyOfInputWhichDrivesThisOutput:](v23, "setAttachedMediaKeyOfInputWhichDrivesThisOutput:", CFSTR("PrimaryFormat"));
    -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](v22, "setMediaConfiguration:forAttachedMediaKey:", v23, CFSTR("SynchronizedSlaveFrame"));
    if (v34)
    {
      if (v32)
      {
        v24 = (uint64_t)v31;
        -[BWSlaveFrameSynchronizerNode _setupAttachedMediaConfigurationForOutput:attachedMediaKey:inputIndexesDrivingAttachedMediaOutput:]((uint64_t)v17, v22, (uint64_t)CFSTR("DepthData_DX"), (uint64_t)v31);
        v25 = BWAttachedMediaKey_DepthData_DY;
      }
      else
      {
        v25 = BWAttachedMediaKey_Depth;
        v24 = (uint64_t)v31;
      }
      -[BWSlaveFrameSynchronizerNode _setupAttachedMediaConfigurationForOutput:attachedMediaKey:inputIndexesDrivingAttachedMediaOutput:]((uint64_t)v17, v22, (uint64_t)*v25, v24);
    }
    if (objc_msgSend(a7, "count"))
      -[BWSlaveFrameSynchronizerNode _setupAttachedMediaConfigurationForOutput:attachedMediaKey:inputIndexesDrivingAttachedMediaOutput:]((uint64_t)v17, v22, 0x1E494FBD8, (uint64_t)a7);
    if (objc_msgSend(a8, "count"))
      -[BWSlaveFrameSynchronizerNode _setupAttachedMediaConfigurationForOutput:attachedMediaKey:inputIndexesDrivingAttachedMediaOutput:]((uint64_t)v17, v22, 0x1E495B478, (uint64_t)a8);
    -[BWNode addOutput:](v17, "addOutput:", v22);

    v17->_bufferServicingLock._os_unfair_lock_opaque = 0;
    v17->_inputSampleBufferQueues = (opaqueCMSimpleQueue **)malloc_type_calloc(v30, 8uLL, 0x2004093837F09uLL);
    if (v30 >= 1)
    {
      v26 = 0;
      v27 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      do
      {
        if (CMSimpleQueueCreate(v27, v17->_numBufferedFrames, &v17->_inputSampleBufferQueues[v26]))
          FigSignalErrorAt();
        ++v26;
      }
      while (v30 != v26);
    }
    v17->_startEmittingMasterFramesBeforeSlaveStreamStarts = a12;
    v17->_numSlaveFramesToSkip = a11;
    v17->_droppedFramePTSs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17->_mostRecentMasterInputIndex = -1;
    v17->_syncSlaveForMasterPortTypes = (NSArray *)objc_msgSend(v29, "copy");
  }
  return v17;
}

- (uint64_t)_setupAttachedMediaConfigurationForInput:(uint64_t)a3 attachedMediaKey:
{
  BWNodeInputMediaConfiguration *v5;

  if (result)
  {
    v5 = objc_alloc_init(BWNodeInputMediaConfiguration);
    -[BWNodeInputMediaConfiguration setPassthroughMode:](v5, "setPassthroughMode:", 1);
    return objc_msgSend(a2, "setMediaConfiguration:forAttachedMediaKey:", v5, a3);
  }
  return result;
}

- (uint64_t)_setupAttachedMediaConfigurationForOutput:(uint64_t)a3 attachedMediaKey:(uint64_t)a4 inputIndexesDrivingAttachedMediaOutput:
{
  BWNodeOutputMediaConfiguration *v7;

  if (result)
  {
    v7 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    -[BWNodeOutputMediaConfiguration setFormatRequirements:](v7, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeOutputMediaConfiguration setPassthroughMode:](v7, "setPassthroughMode:", 1);
    -[BWNodeOutputMediaConfiguration setIndexesOfInputsWhichDrivesThisOutput:](v7, "setIndexesOfInputsWhichDrivesThisOutput:", a4);
    -[BWNodeOutputMediaConfiguration setAttachedMediaKeyOfInputWhichDrivesThisOutput:](v7, "setAttachedMediaKeyOfInputWhichDrivesThisOutput:", a3);
    return objc_msgSend(a2, "setMediaConfiguration:forAttachedMediaKey:", v7, a3);
  }
  return result;
}

- (void)dealloc
{
  unint64_t v3;
  objc_super v4;

  -[BWSlaveFrameSynchronizerNode _purgeAllBuffers](self);
  if (-[NSArray count](-[BWNode inputs](self, "inputs"), "count"))
  {
    v3 = 0;
    do
    {
      FigSimpleQueueRelease();
      ++v3;
    }
    while (-[NSArray count](-[BWNode inputs](self, "inputs"), "count") > v3);
  }
  free(self->_inputSampleBufferQueues);

  v4.receiver = self;
  v4.super_class = (Class)BWSlaveFrameSynchronizerNode;
  -[BWNode dealloc](&v4, sel_dealloc);
}

- (_QWORD)_purgeAllBuffers
{
  _QWORD *v1;
  unint64_t i;
  const void *v3;

  if (result)
  {
    v1 = result;
    result = (_QWORD *)objc_msgSend((id)objc_msgSend(result, "inputs"), "count");
    if (result)
    {
      for (i = 0; i < (unint64_t)result; ++i)
      {
        while (1)
        {
          v3 = CMSimpleQueueDequeue(*(CMSimpleQueueRef *)(v1[13] + 8 * i));
          if (!v3)
            break;
          CFRelease(v3);
        }
        result = (_QWORD *)objc_msgSend((id)objc_msgSend(v1, "inputs"), "count");
      }
    }
  }
  return result;
}

- (id)nodeSubType
{
  return CFSTR("SlaveFrameSynchronizer");
}

- (void)didReachEndOfDataForInput:(id)a3
{
  int *p_numEODMessagesReceived;
  unsigned int v5;

  p_numEODMessagesReceived = &self->_numEODMessagesReceived;
  do
    v5 = __ldxr((unsigned int *)p_numEODMessagesReceived);
  while (__stxr(v5 + 1, (unsigned int *)p_numEODMessagesReceived));
  if (-[NSArray count](-[BWNode inputs](self, "inputs", a3), "count") == v5 + 1)
  {
    os_unfair_lock_lock(&self->_bufferServicingLock);
    if (self->_emitsUnsynchronizedFramesWhileStopping)
      -[BWSlaveFrameSynchronizerNode _tryToEmitBuffersWithSynchronizationEnabled:]((uint64_t)self, 0);
    -[BWSlaveFrameSynchronizerNode _purgeAllBuffers](self);
    -[BWNodeOutput markEndOfLiveOutput](self->super._output, "markEndOfLiveOutput");
    os_unfair_lock_unlock(&self->_bufferServicingLock);
    *p_numEODMessagesReceived = 0;
  }
}

- (void)_tryToEmitBuffersWithSynchronizationEnabled:(uint64_t)a1
{
  unint64_t v3;
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  int v7;
  const void *Head;
  const void *v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  opaqueCMSimpleQueue *v14;
  const void *v15;
  const void *v16;
  const void *v17;
  unsigned int v18;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  const void *v30;
  opaqueCMSimpleQueue *v31;
  opaqueCMSampleBuffer *v32;
  int v33;
  opaqueCMSimpleQueue *v34;
  const void *v35;
  const void *v36;
  uint64_t v37;
  int v38;
  int v39;
  opaqueCMSampleBuffer *v40;
  opaqueCMSampleBuffer *v41;
  CFTypeRef v43;
  uint64_t v44;
  void *v45;
  BOOL v46;
  int v47;
  uint64_t v48;
  CMTime v49;
  CMTime v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (!a1 || !objc_msgSend((id)objc_msgSend((id)a1, "inputs"), "count"))
    return;
  v3 = 0;
  v46 = 0;
  v4 = 0;
  v45 = 0;
  v5 = (const __CFString *)*MEMORY[0x1E0D05CB0];
  v6 = *MEMORY[0x1E0D06EB8];
  v48 = *MEMORY[0x1E0D06EB0];
  v43 = (CFTypeRef)*MEMORY[0x1E0C9AE50];
  v44 = *MEMORY[0x1E0D06D00];
  v47 = -1;
  v7 = -1;
  do
  {
    Head = CMSimpleQueueGetHead(*(CMSimpleQueueRef *)(*(_QWORD *)(a1 + 104) + 8 * v3));
    if (Head)
    {
      v9 = Head;
      v10 = (void *)CMGetAttachment(Head, v5, 0);
      if (objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", v6), "BOOLValue"))
      {
        v11 = objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", v48), "intValue");
        if (v11 > v7)
        {
          v12 = v11;
          v46 = CMGetAttachment(v9, CFSTR("IsHarvestedStillFrame"), 0) == v43;
          v4 = objc_msgSend(v10, "objectForKeyedSubscript:", v44);
          v45 = v10;
          v7 = v12;
          v47 = v3;
        }
      }
    }
    ++v3;
  }
  while (objc_msgSend((id)objc_msgSend((id)a1, "inputs"), "count") > v3);
  v13 = v47;
  if (v47 == -1 || !v4)
    return;
  v14 = *(opaqueCMSimpleQueue **)(*(_QWORD *)(a1 + 104) + 8 * v47);
  v15 = CMSimpleQueueGetHead(v14);
  v16 = v15;
  if (!*(_BYTE *)(a1 + 116) && *(_BYTE *)(a1 + 128))
    sfsn_setOverCaptureSlaveStreamStatusOnSampleBuffer(v15, 1);
  if (v46)
    sfsn_setOverCaptureSlaveStreamStatusOnSampleBuffer(v16, 4);
  v17 = CMSimpleQueueGetHead(v14);
  v18 = objc_msgSend((id)CMGetAttachment(v17, CFSTR("OverCaptureSlaveStreamStatus"), 0), "intValue");
  if (v18 > 4 || ((1 << v18) & 0x1A) == 0)
  {
    v20 = *(void **)(a1 + 152);
    if (!v20)
    {
      if (!a2)
      {
LABEL_41:
        v31 = *(opaqueCMSimpleQueue **)(*(_QWORD *)(a1 + 104) + 8 * v13);
        v32 = (opaqueCMSampleBuffer *)CMSimpleQueueGetHead(v31);
        v33 = 0;
        v34 = 0;
LABEL_42:
        memset(&v50, 0, sizeof(v50));
        CMSampleBufferGetPresentationTimeStamp(&v50, v32);
        v49 = v50;
        -[BWSlaveFrameSynchronizerNode _emitDroppedFrames:captureID:inputIndex:](a1, &v49, -1);
        objc_msgSend(*(id *)(a1 + 16), "emitSampleBuffer:", v32);
        v35 = CMSimpleQueueDequeue(v31);
        if (v35)
          CFRelease(v35);
        if (v33)
        {
          v36 = CMSimpleQueueDequeue(v34);
          if (v36)
            CFRelease(v36);
        }
        return;
      }
      goto LABEL_33;
    }
  }
  else
  {
    v20 = *(void **)(a1 + 152);
    if (!v20)
      goto LABEL_41;
  }
  if (!objc_msgSend(v20, "containsObject:", v4))
    goto LABEL_41;
  v21 = (void *)objc_msgSend(v45, "objectForKeyedSubscript:", *MEMORY[0x1E0D06ED8]);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v22 = (void *)objc_msgSend(v21, "allValues");
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (!v23)
    goto LABEL_41;
  v24 = v23;
  v25 = 0;
  v26 = *(_QWORD *)v52;
  v27 = *MEMORY[0x1E0D06E38];
  do
  {
    for (i = 0; i != v24; ++i)
    {
      if (*(_QWORD *)v52 != v26)
        objc_enumerationMutation(v22);
      v25 += objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "objectForKeyedSubscript:", v27), "BOOLValue");
    }
    v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  }
  while (v24);
  v13 = v47;
  if (v25 < 1 || (a2 & 1) == 0)
    goto LABEL_41;
LABEL_33:
  if (objc_msgSend((id)objc_msgSend((id)a1, "inputs"), "count"))
  {
    v29 = 0;
    while (1)
    {
      if (v13 != v29)
      {
        v30 = CMSimpleQueueGetHead(*(CMSimpleQueueRef *)(*(_QWORD *)(a1 + 104) + 8 * v29));
        if (v30)
        {
          if (objc_msgSend((id)objc_msgSend((id)CMGetAttachment(v30, v5, 0), "objectForKeyedSubscript:", v48), "intValue") == v7)break;
        }
      }
      if (objc_msgSend((id)objc_msgSend((id)a1, "inputs"), "count") <= (unint64_t)++v29)
        return;
    }
    if ((_DWORD)v29 != -1)
    {
      v37 = *(_QWORD *)(a1 + 104);
      if (v13 <= (int)v29)
        v38 = v29;
      else
        v38 = v13;
      v31 = *(opaqueCMSimpleQueue **)(v37 + 8 * v38);
      if (v13 >= (int)v29)
        v39 = v29;
      else
        v39 = v13;
      v34 = *(opaqueCMSimpleQueue **)(v37 + 8 * v39);
      v32 = (opaqueCMSampleBuffer *)CMSimpleQueueGetHead(v31);
      v40 = (opaqueCMSampleBuffer *)CMSimpleQueueGetHead(v34);
      v41 = v40;
      if (v40 && (++*(_DWORD *)(a1 + 120), *(_DWORD *)(a1 + 120) <= *(_DWORD *)(a1 + 124)) && !*(_QWORD *)(a1 + 152))
      {
        if (!*(_BYTE *)(a1 + 128))
          return;
        if (objc_msgSend((id)objc_msgSend((id)CMGetAttachment(v40, v5, 0), "objectForKeyedSubscript:", v44), "isEqualToString:", *MEMORY[0x1E0D05A18]))v32 = v41;
        v33 = 1;
        sfsn_setOverCaptureSlaveStreamStatusOnSampleBuffer(v32, 1);
      }
      else
      {
        BWSampleBufferSetAttachedMedia(v32, (uint64_t)CFSTR("SynchronizedSlaveFrame"), (uint64_t)v40);
        v33 = 1;
      }
      goto LABEL_42;
    }
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  os_unfair_lock_s *p_bufferServicingLock;

  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  -[BWNodeOutput emitNodeError:](self->super._output, "emitNodeError:", a3);
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  uint64_t mostRecentMasterInputIndex;
  const __CFAllocator *v8;
  CFDictionaryRef v9;
  CFDictionaryRef v10;
  CMTime v11[2];

  objc_msgSend(a4, "index");
  memset(&v11[1], 0, sizeof(CMTime));
  if (a3)
    objc_msgSend(a3, "pts");
  os_unfair_lock_lock(&self->_bufferServicingLock);
  mostRecentMasterInputIndex = self->_mostRecentMasterInputIndex;
  if (objc_msgSend(a4, "index") == mostRecentMasterInputIndex)
  {
    v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v11[0] = v11[1];
    v9 = CMTimeCopyAsDictionary(v11, v8);
    if (v9)
    {
      v10 = v9;
      -[NSMutableArray addObject:](self->_droppedFramePTSs, "addObject:", v9);
      CFRelease(v10);
    }
  }
  os_unfair_lock_unlock(&self->_bufferServicingLock);
}

- (void)handleStillImageReferenceFrameBracketedCaptureSequenceNumber:(int)a3 forInput:(id)a4
{
  uint64_t v4;
  os_unfair_lock_s *p_bufferServicingLock;

  v4 = *(_QWORD *)&a3;
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  -[BWNodeOutput emitStillImageReferenceFrameBracketedCaptureSequenceNumberMessageWithSequenceNumber:](self->super._output, "emitStillImageReferenceFrameBracketedCaptureSequenceNumberMessageWithSequenceNumber:", v4);
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (BOOL)emitsUnsynchronizedFramesWhileStopping
{
  return self->_emitsUnsynchronizedFramesWhileStopping;
}

- (void)setEmitsUnsynchronizedFramesWhileStopping:(BOOL)a3
{
  self->_emitsUnsynchronizedFramesWhileStopping = a3;
}

@end
