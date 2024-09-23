@implementation BWCrossoverNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  BWNodeOutput *v7;
  BWNodeOutputMediaProperties *v8;

  v7 = -[BWNode output](self, "output", a3, a4);
  v8 = -[BWNodeOutput mediaPropertiesForAttachedMediaKey:](v7, "mediaPropertiesForAttachedMediaKey:", a5);
  if (!v8)
  {
    v8 = objc_alloc_init(BWNodeOutputMediaProperties);
    -[BWNodeOutput _setMediaProperties:forAttachedMediaKey:](v7, "_setMediaProperties:forAttachedMediaKey:", v8, a5);
  }
  -[BWNodeOutputMediaProperties setResolvedFormat:](v8, "setResolvedFormat:", a3);
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  if (objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06EB8]), "BOOLValue"))
  {
    if (a3)
      CFRetain(a3);
    os_unfair_lock_lock(&self->_bufferServicingLock);
    -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3);
    if (a3)
      CFRelease(a3);
    os_unfair_lock_unlock(&self->_bufferServicingLock);
  }
}

- (BWCrossoverNode)initWithMediaType:(unsigned int)a3 numberOfInputs:(unsigned int)a4
{
  uint64_t v5;
  BWCrossoverNode *v6;
  BWCrossoverNode *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  BWNodeInput *v11;
  BWVideoFormatRequirements *v12;
  BWNodeOutput *v13;
  BWVideoFormatRequirements *v14;
  objc_super v16;

  v5 = *(_QWORD *)&a3;
  v16.receiver = self;
  v16.super_class = (Class)BWCrossoverNode;
  v6 = -[BWNode init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    -[BWNode setSupportsConcurrentLiveInputCallbacks:](v6, "setSupportsConcurrentLiveInputCallbacks:", 1);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    if (a4)
    {
      v9 = 0;
      v10 = a4;
      do
      {
        v11 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", v5, v7, v9);
        v12 = objc_alloc_init(BWVideoFormatRequirements);
        -[BWNodeInputMediaConfiguration setFormatRequirements:](-[BWNodeInput primaryMediaConfiguration](v11, "primaryMediaConfiguration"), "setFormatRequirements:", v12);

        -[BWNodeInputMediaConfiguration setPassthroughMode:](-[BWNodeInput primaryMediaConfiguration](v11, "primaryMediaConfiguration"), "setPassthroughMode:", 1);
        -[BWNode addInput:](v7, "addInput:", v11);

        objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9++));
      }
      while (v10 != v9);
    }
    v13 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", v5, v7);
    v14 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWNodeOutputMediaConfiguration setFormatRequirements:](-[BWNodeOutput primaryMediaConfiguration](v13, "primaryMediaConfiguration"), "setFormatRequirements:", v14);

    -[BWNodeOutputMediaConfiguration setPassthroughMode:](-[BWNodeOutput primaryMediaConfiguration](v13, "primaryMediaConfiguration"), "setPassthroughMode:", 1);
    -[BWNodeOutputMediaConfiguration setIndexesOfInputsWhichDrivesThisOutput:](-[BWNodeOutput primaryMediaConfiguration](v13, "primaryMediaConfiguration"), "setIndexesOfInputsWhichDrivesThisOutput:", v8);
    -[BWNode addOutput:](v7, "addOutput:", v13);

    v7->_bufferServicingLock._os_unfair_lock_opaque = 0;
  }
  return v7;
}

- (id)nodeType
{
  return CFSTR("Muxer");
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

- (void)prepareForCurrentConfigurationToBecomeLive
{
  uint64_t v3;
  BWNodeInput *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *obj;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  BWUtilitiesWarnIfInputFormatsMismatch(-[BWNode inputs](self, "inputs"), self->super._input);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = -[BWNode inputs](self, "inputs");
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v12)
  {
    v11 = *(_QWORD *)v19;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(obj);
        v4 = *(BWNodeInput **)(*((_QWORD *)&v18 + 1) + 8 * v3);
        if (v4 != self->super._input)
        {
          v16 = 0u;
          v17 = 0u;
          v14 = 0u;
          v15 = 0u;
          v5 = -[BWNodeInput resolvedAttachedMediaKeys](v4, "resolvedAttachedMediaKeys");
          v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
          if (v6)
          {
            v7 = v6;
            v8 = *(_QWORD *)v15;
            do
            {
              v9 = 0;
              do
              {
                if (*(_QWORD *)v15 != v8)
                  objc_enumerationMutation(v5);
                objc_msgSend((id)objc_msgSend(-[BWNodeInput mediaPropertiesForAttachedMediaKey:](v4, "mediaPropertiesForAttachedMediaKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9)), "resolvedFormat"), "isEqual:", objc_msgSend(-[BWNodeInput mediaPropertiesForAttachedMediaKey:](self->super._input, "mediaPropertiesForAttachedMediaKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9)), "resolvedFormat"));
                ++v9;
              }
              while (v7 != v9);
              v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
            }
            while (v7);
          }
        }
        ++v3;
      }
      while (v3 != v12);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v12);
  }
  v13.receiver = self;
  v13.super_class = (Class)BWCrossoverNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v13, sel_prepareForCurrentConfigurationToBecomeLive);
}

+ (void)initialize
{
  objc_opt_class();
}

- (id)nodeSubType
{
  return CFSTR("Crossover");
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
    -[BWNodeOutput markEndOfLiveOutput](self->super._output, "markEndOfLiveOutput");
    os_unfair_lock_unlock(&self->_bufferServicingLock);
    *p_numEODMessagesReceived = 0;
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
  os_unfair_lock_s *p_bufferServicingLock;

  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  -[BWNodeOutput emitDroppedSample:](self->super._output, "emitDroppedSample:", a3);
  os_unfair_lock_unlock(p_bufferServicingLock);
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

@end
