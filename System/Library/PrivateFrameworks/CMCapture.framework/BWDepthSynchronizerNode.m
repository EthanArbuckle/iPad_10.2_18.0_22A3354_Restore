@implementation BWDepthSynchronizerNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BWNodeOutputMediaProperties *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = -[BWNode outputs](self, "outputs");
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v11);
        v13 = objc_msgSend(v12, "attachedMediaKeyDrivenByInputAttachedMediaKey:inputIndex:", a5, objc_msgSend(a4, "index"));
        if (v13)
        {
          v14 = (void *)v13;
          if (objc_msgSend(v12, "passthroughMode"))
          {
            v15 = (BWNodeOutputMediaProperties *)objc_msgSend(v12, "mediaPropertiesForAttachedMediaKey:", v14);
            v16 = objc_msgSend(v14, "isEqualToString:", CFSTR("PrimaryFormat"));
            if (v15)
            {
              if ((v16 & 1) == 0)
              {
                v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ output %@ unexpectedly has mediaPropertiesForAttachedMediaKey %@ (provided media key was %@)"), self, v12, v14, a5);
                goto LABEL_18;
              }
            }
            else
            {
              if (v16)
              {
                v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ output %@ has no media properties for the primary format (provided media key is %@)"), self, v12, a5, v18);
LABEL_18:
                objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v17, 0));
              }
              v15 = objc_alloc_init(BWNodeOutputMediaProperties);
              objc_msgSend(v12, "_setMediaProperties:forAttachedMediaKey:", v15, v14);
            }
            -[BWNodeOutputMediaProperties setResolvedFormat:](v15, "setResolvedFormat:", a3);
          }
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  os_unfair_lock_s *p_bufferServicingLock;
  int v8;
  int *v9;
  int v10;
  int v11;
  __int16 v12;
  int *p_lastReceivedImageID;
  int v15;
  int imageIDWrapAroundCounter;
  int *v17;
  int *v18;
  int v19;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  os_log_type_t type;
  int v22;
  CMTime v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  v8 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06EB0]), "intValue");
  if (self->_imageInput == a4)
    v9 = &OBJC_IVAR___BWDepthSynchronizerNode__lastReceivedImageID;
  else
    v9 = &OBJC_IVAR___BWDepthSynchronizerNode__lastReceivedDepthID;
  v10 = *(_DWORD *)((char *)&self->super.super.isa + *v9);
  memset(&v23, 0, sizeof(v23));
  CMSampleBufferGetPresentationTimeStamp(&v23, a3);
  if (self->_streaming)
  {
    v11 = 0;
  }
  else
  {
    v12 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a3, CFSTR("StillSettings"), 0), "captureSettings"), "captureFlags");
    if ((v12 & 0x2000) != 0)
      v11 = 10;
    else
      v11 = 0;
    if ((v12 & 0x2000) != 0)
      goto LABEL_14;
  }
  if (v8 < v10 && (v10 - 16777205) >= 0xFF000016)
  {
    v22 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_22;
  }
LABEL_14:
  if (self->_imageInput == a4)
  {
    p_lastReceivedImageID = &self->_lastReceivedImageID;
    v19 = self->_lastReceivedImageID - v11;
    imageIDWrapAroundCounter = self->_imageIDWrapAroundCounter;
    if (v8 < v19)
      self->_imageIDWrapAroundCounter = ++imageIDWrapAroundCounter;
    v17 = &OBJC_IVAR___BWDepthSynchronizerNode__lastReceivedImagePTS;
    v18 = &OBJC_IVAR___BWDepthSynchronizerNode__imageBufferQueue;
  }
  else
  {
    p_lastReceivedImageID = &self->_lastReceivedDepthID;
    v15 = self->_lastReceivedDepthID - v11;
    imageIDWrapAroundCounter = self->_depthIDWrapAroundCounter;
    if (v8 < v15)
      self->_depthIDWrapAroundCounter = ++imageIDWrapAroundCounter;
    v17 = &OBJC_IVAR___BWDepthSynchronizerNode__lastReceivedDepthPTS;
    v18 = &OBJC_IVAR___BWDepthSynchronizerNode__depthBufferQueue;
  }
  CMSetAttachment(a3, CFSTR("ExtendedCaptureID"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8 | (imageIDWrapAroundCounter << 24)), 0);
  objc_msgSend(*(id *)((char *)&self->super.super.isa + *v18), "addObject:", a3);
  *p_lastReceivedImageID = v8;
  *(CMTime *)((char *)&self->super.super.isa + *v17) = v23;
  -[BWDepthSynchronizerNode _tryToEmitBuffers]((uint64_t)self);
LABEL_22:
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)_tryToEmitBuffers
{
  char v2;
  void *v3;
  int v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  _BOOL4 v8;
  int v9;
  int v10;
  char v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  char v22;
  int v23;
  _QWORD v24[5];
  os_log_type_t type;
  int v26;
  char v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = 0;
    if (objc_msgSend(*(id *)(a1 + 104), "count"))
    {
      while (1)
      {
        v3 = (void *)objc_msgSend(*(id *)(a1 + 104), "objectAtIndexedSubscript:", 0, v19, v20);
        v4 = -[BWDepthSynchronizerNode _isDepthExpectedForSampleBuffer:](a1, v3);
        v5 = objc_msgSend(*(id *)(a1 + 104), "count");
        v6 = *(int *)(a1 + 120);
        v23 = objc_msgSend((id)CMGetAttachment(v3, CFSTR("ExtendedCaptureID"), 0), "intValue");
        v7 = 0;
        v27 = 0;
        if (v4)
          v7 = -[BWDepthSynchronizerNode _attachDepthDataToSampleBufferOrReportDepthMissing:isDepthMissing:](a1, v3, &v27);
        v22 = v2;
        v8 = !*(_BYTE *)(a1 + 176)
          && *(_QWORD *)(a1 + 136)
          && (v13 = (void *)CMGetAttachment(v3, CFSTR("StillSettings"), 0),
              (objc_msgSend((id)objc_msgSend(v13, "captureSettings"), "captureFlags") & 0x2000) != 0)
          && (unint64_t)objc_msgSend(v13, "settingsID") <= *(_QWORD *)(a1 + 136);
        v9 = v4 ^ 1;
        if (v5 > v6)
          v9 = 1;
        v10 = v9 | v7;
        if (v27)
          v10 = 1;
        v11 = v10 | v8;
        if (!*(_BYTE *)(a1 + 176))
        {
          v12 = dword_1EE6BE718 ? v10 | v8 : 0;
          if (v12 == 1)
          {
            v26 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
        }
        if ((v11 & 1) == 0)
          break;
        CMRemoveAttachment(v3, CFSTR("ExtendedCaptureID"));
        objc_msgSend(*(id *)(a1 + 16), "emitSampleBuffer:", v3);
        *(_DWORD *)(a1 + 124) = v23;
        objc_msgSend(*(id *)(a1 + 104), "removeObject:", v3);
        v2 = 1;
        if (!objc_msgSend(*(id *)(a1 + 104), "count"))
          goto LABEL_24;
      }
      v2 = v22;
    }
LABEL_24:
    v14 = *(void **)(a1 + 184);
    if (v14
      && ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "stillImageSettings"), "captureSettings"), "captureFlags") & 0x800) == 0|| objc_msgSend(*(id *)(a1 + 112), "count")|| *(_QWORD *)(a1 + 192)))
    {
      objc_msgSend(*(id *)(a1 + 16), "emitNodeError:", *(_QWORD *)(a1 + 184), v19, v20);
      v15 = *(void **)(a1 + 112);
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __44__BWDepthSynchronizerNode__tryToEmitBuffers__block_invoke;
      v24[3] = &unk_1E49238F0;
      v24[4] = a1;
      v16 = (void *)objc_msgSend(v15, "indexesOfObjectsPassingTest:", v24);
      if (objc_msgSend(v16, "count"))
        objc_msgSend(*(id *)(a1 + 112), "removeObjectsAtIndexes:", v16);
      -[BWDepthSynchronizerNode _cleanupDepthBufferQueue](a1);
    }
    else
    {
      -[BWDepthSynchronizerNode _cleanupDepthBufferQueue](a1);
      if ((v2 & 1) == 0)
        return;
    }
    v17 = *(void **)(a1 + 184);
    if (v17)
    {

      *(_QWORD *)(a1 + 184) = 0;
    }
    v18 = *(void **)(a1 + 192);
    if (v18)
    {

      *(_QWORD *)(a1 + 192) = 0;
    }
  }
}

- (unint64_t)_isDepthExpectedForSampleBuffer:(uint64_t)a1
{
  void *v2;
  _BOOL8 v3;
  void *v4;

  if (!a1)
    return 0;
  if (!*(_BYTE *)(a1 + 176))
    return ((unint64_t)objc_msgSend((id)CMGetAttachment(target, CFSTR("BWStillImageCaptureSettings"), 0), "captureFlags") >> 11) & 1;
  v2 = (void *)objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06ED8]);
  v3 = objc_msgSend(v2, "count") != 0;
  v4 = (void *)objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A40]);
  if (v4)
    return objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06B90]), "intValue") == 2;
  return v3;
}

- (uint64_t)_cleanupDepthBufferQueue
{
  uint64_t v1;
  const void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];

  if (result)
  {
    v1 = result;
    for (result = objc_msgSend(*(id *)(result + 112), "count"); result; result = objc_msgSend(*(id *)(v1 + 112), "count"))
    {
      v2 = (const void *)objc_msgSend(*(id *)(v1 + 112), "objectAtIndexedSubscript:", 0);
      result = objc_msgSend((id)CMGetAttachment(v2, CFSTR("ExtendedCaptureID"), 0), "intValue");
      if ((int)result > *(_DWORD *)(v1 + 124))
        break;
      objc_msgSend(*(id *)(v1 + 112), "removeObject:", v2);
    }
    if (!*(_BYTE *)(v1 + 176) && *(_QWORD *)(v1 + 136))
    {
      v3 = *(void **)(v1 + 112);
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __51__BWDepthSynchronizerNode__cleanupDepthBufferQueue__block_invoke;
      v5[3] = &unk_1E49238F0;
      v5[4] = v1;
      v4 = (void *)objc_msgSend(v3, "indexesOfObjectsPassingTest:", v5);
      result = objc_msgSend(v4, "count");
      if (result)
        return objc_msgSend(*(id *)(v1 + 112), "removeObjectsAtIndexes:", v4);
    }
  }
  return result;
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

- (id)initForStreaming:(BOOL)a3 maxQueueDepth:(int)a4 separateDepthComponentsEnabled:(BOOL)a5
{
  _BOOL4 v5;
  BWDepthSynchronizerNode *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  int v12;
  char v13;
  char v14;
  BWNodeInput *v15;
  BWNodeInputMediaConfiguration *v16;
  BWNodeInputMediaConfiguration *v17;
  BWNodeOutput *v18;
  const __CFString *v19;
  uint64_t v20;
  BWNodeOutput *v21;
  const __CFString *v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  objc_super v27;

  v5 = a5;
  v27.receiver = self;
  v27.super_class = (Class)BWDepthSynchronizerNode;
  v8 = -[BWNode init](&v27, sel_init);
  v9 = (uint64_t)v8;
  if (v8)
  {
    v8->_streaming = a3;
    v8->_separateDepthComponentsEnabled = v5;
    -[BWNode setSupportsConcurrentLiveInputCallbacks:](v8, "setSupportsConcurrentLiveInputCallbacks:", v8->_streaming);
    v10 = 0;
    v11 = 0;
    if (a4 <= 2)
      v12 = 2;
    else
      v12 = a4;
    *(_DWORD *)(v9 + 120) = v12;
    v13 = 1;
    do
    {
      v14 = v13;
      v15 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1986618469, v9, v11);
      -[BWNodeInput setFormatRequirements:](v15, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
      -[BWNodeInput setPassthroughMode:](v15, "setPassthroughMode:", 1);
      -[BWNodeInput setRetainedBufferCount:](v15, "setRetainedBufferCount:", *(_DWORD *)(v9 + 120) + *(unsigned __int8 *)(v9 + 176));
      if ((v10 & 1) != 0)
      {
        v16 = objc_alloc_init(BWNodeInputMediaConfiguration);
        v17 = v16;
        if (v5)
        {
          -[BWNodeInputMediaConfiguration setFormatRequirements:](v16, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
          -[BWNodeInputMediaConfiguration setPassthroughMode:](v17, "setPassthroughMode:", 1);
          -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v15, "setMediaConfiguration:forAttachedMediaKey:", v17, CFSTR("DepthData_DY"));
        }
        else
        {
          -[BWNodeInputMediaConfiguration setPassthroughMode:](v16, "setPassthroughMode:", 0);
          -[BWNodeInput setUnspecifiedAttachedMediaConfiguration:](v15, "setUnspecifiedAttachedMediaConfiguration:", v17);
          -[BWNodeInput setRetainedBufferCount:](v15, "setRetainedBufferCount:", 1);
        }
      }
      objc_msgSend((id)v9, "addInput:", v15);

      v13 = 0;
      v10 = 1;
      v11 = 1;
    }
    while ((v14 & 1) != 0);
    *(_QWORD *)(v9 + 160) = objc_msgSend((id)objc_msgSend((id)v9, "inputs"), "objectAtIndexedSubscript:", 0);
    *(_QWORD *)(v9 + 168) = objc_msgSend((id)objc_msgSend((id)v9, "inputs"), "objectAtIndexedSubscript:", 1);
    v18 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v9);
    -[BWNodeOutputMediaConfiguration setFormatRequirements:](-[BWNodeOutput primaryMediaConfiguration](v18, "primaryMediaConfiguration"), "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeOutput setPassthroughMode:](v18, "setPassthroughMode:", 1);
    v19 = CFSTR("PrimaryFormat");
    if (*(_BYTE *)(v9 + 153))
    {
      -[BWDepthSynchronizerNode _setupDepthMediaConfigurationForOutput:inputAttachedMediaKey:outputAttachedMediaKey:](v9, v18, (uint64_t)CFSTR("PrimaryFormat"), (uint64_t)CFSTR("DepthData_DX"));
      v20 = v9;
      v21 = v18;
      v19 = CFSTR("DepthData_DY");
      v22 = CFSTR("DepthData_DY");
    }
    else
    {
      v22 = CFSTR("Depth");
      v20 = v9;
      v21 = v18;
    }
    -[BWDepthSynchronizerNode _setupDepthMediaConfigurationForOutput:inputAttachedMediaKey:outputAttachedMediaKey:](v20, v21, (uint64_t)v19, (uint64_t)v22);
    objc_msgSend((id)v9, "addOutput:", v18);

    *(_DWORD *)(v9 + 200) = 0;
    *(_QWORD *)(v9 + 104) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *(_QWORD *)(v9 + 112) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v23 = MEMORY[0x1E0CA2E18];
    v24 = *MEMORY[0x1E0CA2E18];
    *(_OWORD *)(v9 + 228) = *MEMORY[0x1E0CA2E18];
    v25 = *(_QWORD *)(v23 + 16);
    *(_QWORD *)(v9 + 244) = v25;
    *(_OWORD *)(v9 + 204) = v24;
    *(_QWORD *)(v9 + 220) = v25;
    atomic_store(0, (unsigned __int8 *)(v9 + 100));
  }
  return (id)v9;
}

- (uint64_t)_setupDepthMediaConfigurationForOutput:(uint64_t)a3 inputAttachedMediaKey:(uint64_t)a4 outputAttachedMediaKey:
{
  BWNodeOutputMediaConfiguration *v7;

  if (result)
  {
    v7 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    -[BWNodeOutputMediaConfiguration setFormatRequirements:](v7, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeOutputMediaConfiguration setPassthroughMode:](v7, "setPassthroughMode:", 1);
    -[BWNodeOutputMediaConfiguration setIndexOfInputWhichDrivesThisOutput:](v7, "setIndexOfInputWhichDrivesThisOutput:", 1);
    -[BWNodeOutputMediaConfiguration setAttachedMediaKeyOfInputWhichDrivesThisOutput:](v7, "setAttachedMediaKeyOfInputWhichDrivesThisOutput:", a3);
    return objc_msgSend(a2, "setMediaConfiguration:forAttachedMediaKey:", v7, a4);
  }
  return result;
}

- (id)nodeType
{
  return CFSTR("Muxer");
}

- (void)setDiscardsDegradedDepthBuffers:(BOOL)a3
{
  self->_discardsDegradedDepthBuffers = a3;
}

- (id)initForStreaming:(BOOL)a3 separateDepthComponentsEnabled:(BOOL)a4
{
  return -[BWDepthSynchronizerNode initForStreaming:maxQueueDepth:separateDepthComponentsEnabled:](self, "initForStreaming:maxQueueDepth:separateDepthComponentsEnabled:", a3, 2, a4);
}

- (BWNodeInput)imageInput
{
  return self->_imageInput;
}

- (BWNodeInput)depthInput
{
  return self->_depthInput;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWDepthSynchronizerNode;
  -[BWNode dealloc](&v3, sel_dealloc);
}

- (id)nodeSubType
{
  return CFSTR("DepthSynchronizer");
}

- (BOOL)discardsDegradedDepthBuffers
{
  return self->_discardsDegradedDepthBuffers;
}

- (void)didReachEndOfDataForInput:(id)a3
{
  int *p_numEODMessagesReceived;
  unsigned int v6;

  p_numEODMessagesReceived = &self->_numEODMessagesReceived;
  do
    v6 = __ldxr((unsigned int *)p_numEODMessagesReceived);
  while (__stxr(v6 + 1, (unsigned int *)p_numEODMessagesReceived));
  if (-[NSArray count](-[BWNode inputs](self, "inputs"), "count") == v6 + 1)
  {
    os_unfair_lock_lock(&self->_bufferServicingLock);
    -[BWNodeOutput markEndOfLiveOutput](self->super._output, "markEndOfLiveOutput");
    os_unfair_lock_unlock(&self->_bufferServicingLock);
    *p_numEODMessagesReceived = 0;
  }
  else if (self->_flushOnDepthEOD && self->_depthInput == a3)
  {
    atomic_store(1u, (unsigned __int8 *)&self->_depthInputHasReceivedEOD);
    os_unfair_lock_lock(&self->_bufferServicingLock);
    -[BWDepthSynchronizerNode _tryToEmitBuffers]((uint64_t)self);
    os_unfair_lock_unlock(&self->_bufferServicingLock);
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  os_unfair_lock_s *p_bufferServicingLock;
  id *p_errorForImageInput;

  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  if (self->_streaming)
    goto LABEL_6;
  if (objc_msgSend(a3, "errorCode") != -16800
    && objc_msgSend(a3, "errorCode") != -16802
    && objc_msgSend(a3, "errorCode") != -16806)
  {
    if (self->_imageInput == a4)
    {
      p_errorForImageInput = (id *)&self->_errorForImageInput;
      if (!self->_errorForImageInput)
      {
LABEL_13:
        *p_errorForImageInput = a3;
        -[BWDepthSynchronizerNode _tryToEmitBuffers]((uint64_t)self);
        goto LABEL_7;
      }
      -[BWNodeOutput emitNodeError:](self->super._output, "emitNodeError:");
    }
    else
    {
      self->_lastReceivedDepthErrorSettingsID = objc_msgSend((id)objc_msgSend(a3, "stillImageSettings"), "settingsID");
      p_errorForImageInput = (id *)&self->_errorForDepthInput;
    }

    goto LABEL_13;
  }
  -[NSMutableArray removeAllObjects](self->_imageBufferQueue, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_depthBufferQueue, "removeAllObjects");

  self->_errorForImageInput = 0;
  self->_errorForDepthInput = 0;
LABEL_6:
  -[BWNodeOutput emitNodeError:](self->super._output, "emitNodeError:", a3);
LABEL_7:
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  os_unfair_lock_s *p_bufferServicingLock;

  if (self->_imageInput == a4)
  {
    p_bufferServicingLock = &self->_bufferServicingLock;
    os_unfair_lock_lock(&self->_bufferServicingLock);
    -[BWNodeOutput emitDroppedSample:](self->super._output, "emitDroppedSample:", a3);
    os_unfair_lock_unlock(p_bufferServicingLock);
  }
}

- (void)handleStillImageReferenceFrameBracketedCaptureSequenceNumber:(int)a3 forInput:(id)a4
{
  -[BWNodeOutput emitStillImageReferenceFrameBracketedCaptureSequenceNumberMessageWithSequenceNumber:](self->super._output, "emitStillImageReferenceFrameBracketedCaptureSequenceNumberMessageWithSequenceNumber:", *(_QWORD *)&a3, a4);
}

- (uint64_t)_attachDepthDataToSampleBufferOrReportDepthMissing:(_BYTE *)a3 isDepthMissing:
{
  int v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  unsigned __int8 v12;
  CFTypeRef v14;
  const __CFString *v15;
  uint64_t AttachedMedia;
  __int128 v17;
  uint64_t v18;
  CMTime v19;
  CFTypeRef cf;
  CMTime v21;

  if (!a1)
    return 0;
  if (!*(_BYTE *)(a1 + 176) && *(_QWORD *)(a1 + 192))
    goto LABEL_20;
  v6 = objc_msgSend((id)CMGetAttachment(target, CFSTR("ExtendedCaptureID"), 0), "intValue");
  if (!objc_msgSend(*(id *)(a1 + 112), "count"))
  {
LABEL_16:
    if (!objc_msgSend(*(id *)(a1 + 112), "count"))
    {
      if (*(_BYTE *)(a1 + 177))
      {
        v12 = atomic_load((unsigned __int8 *)(a1 + 100));
        if ((v12 & 1) != 0)
        {
LABEL_20:
          v11 = 0;
          *a3 = 1;
          return v11;
        }
      }
    }
    return 0;
  }
  v7 = 0;
  while (1)
  {
    v8 = (void *)objc_msgSend(*(id *)(a1 + 112), "objectAtIndexedSubscript:", v7);
    v9 = objc_msgSend((id)CMGetAttachment(v8, CFSTR("ExtendedCaptureID"), 0), "intValue");
    if (v6 < v9)
    {
      *a3 = 1;
      goto LABEL_16;
    }
    if (v6 == v9)
      break;
    if (objc_msgSend(*(id *)(a1 + 112), "count") <= (unint64_t)++v7)
      goto LABEL_16;
  }
  v10 = (void *)CMGetAttachment(v8, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if ((objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D06EA0]), "BOOLValue") & 1) != 0
    || *(_BYTE *)(a1 + 152)
    && objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D06E98]), "BOOLValue"))
  {
    *a3 = 1;
    objc_msgSend(*(id *)(a1 + 112), "removeObject:", v8);
    CMSetAttachment(target, (CFStringRef)*MEMORY[0x1E0D086E0], &unk_1E49FA518, 1u);
    goto LABEL_16;
  }
  memset(&v21, 0, sizeof(v21));
  CMSampleBufferGetPresentationTimeStamp(&v21, (CMSampleBufferRef)target);
  cf = 0;
  v19 = v21;
  v17 = *MEMORY[0x1E0CA2E18];
  v18 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  if (BWCMSampleBufferCreateCopyWithNewTimingIncludingMetadata((opaqueCMSampleBuffer *)v8, &v19, &v17, (CMSampleBufferRef *)&cf))
  {
    if (v8)
      v14 = CFRetain(v8);
    else
      v14 = 0;
    cf = v14;
  }
  else
  {
    v14 = cf;
  }
  CMRemoveAttachment(v14, CFSTR("ExtendedCaptureID"));
  v15 = CFSTR("Depth");
  if (*(_BYTE *)(a1 + 153))
  {
    BWSampleBufferRemoveAttachedMedia(target, (uint64_t)CFSTR("Depth"));
    AttachedMedia = BWSampleBufferGetAttachedMedia(cf, (uint64_t)CFSTR("DepthData_DY"));
    BWSampleBufferSetAttachedMedia(target, (uint64_t)CFSTR("DepthData_DY"), AttachedMedia);
    BWSampleBufferRemoveAttachedMedia(cf, (uint64_t)CFSTR("DepthData_DY"));
    v15 = CFSTR("DepthData_DX");
  }
  BWSampleBufferSetAttachedMedia(target, (uint64_t)v15, (uint64_t)cf);
  if (cf)
    CFRelease(cf);
  v11 = 1;
  CMSetAttachment(target, (CFStringRef)*MEMORY[0x1E0D086F8], MEMORY[0x1E0C9AAB0], 1u);
  objc_msgSend(*(id *)(a1 + 112), "removeObject:", v8);
  return v11;
}

BOOL __44__BWDepthSynchronizerNode__tryToEmitBuffers__block_invoke(uint64_t a1, CMAttachmentBearerRef target)
{
  void *v3;
  uint64_t v4;
  uint64_t v6;

  v3 = (void *)CMGetAttachment(target, CFSTR("BWStillImageCaptureSettings"), 0);
  v4 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "stillImageSettings"), "settingsID");
  if (v4 == objc_msgSend(v3, "settingsID"))
    return 1;
  v6 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "stillImageSettings"), "settingsID");
  return v6 == objc_msgSend(v3, "settingsID");
}

BOOL __51__BWDepthSynchronizerNode__cleanupDepthBufferQueue__block_invoke(uint64_t a1, CMAttachmentBearerRef target)
{
  void *v3;

  v3 = (void *)CMGetAttachment(target, CFSTR("StillSettings"), 0);
  return (objc_msgSend((id)objc_msgSend(v3, "captureSettings"), "captureFlags") & 0x2000) != 0
      && (unint64_t)objc_msgSend(v3, "settingsID") <= *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
}

- (BOOL)flushOnDepthEOD
{
  return self->_flushOnDepthEOD;
}

- (void)setFlushOnDepthEOD:(BOOL)a3
{
  self->_flushOnDepthEOD = a3;
}

@end
