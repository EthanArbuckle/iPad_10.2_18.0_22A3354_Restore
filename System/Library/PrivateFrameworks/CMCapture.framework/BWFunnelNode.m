@implementation BWFunnelNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  BWNodeOutputMediaProperties *v8;

  v8 = -[BWNodeOutput mediaPropertiesForAttachedMediaKey:](self->super._output, "mediaPropertiesForAttachedMediaKey:", a5, a4);
  if (!v8)
  {
    v8 = objc_alloc_init(BWNodeOutputMediaProperties);
    -[BWNodeOutput _setMediaProperties:forAttachedMediaKey:](self->super._output, "_setMediaProperties:forAttachedMediaKey:", v8, a5);
  }
  -[BWNodeOutputMediaProperties setResolvedFormat:](v8, "setResolvedFormat:", a3);
}

- (void)_handleMessage:(id)a3 fromInput:(id)a4
{
  objc_super v7;

  if (!self->_holdMessagesUntilAllInputsAreLive)
    goto LABEL_4;
  if (-[BWNode allInputsHaveReachedState:](self, "allInputsHaveReachedState:", 1))
  {
    -[BWFunnelNode _deliverQueuedMessages]((uint64_t)self);
LABEL_4:
    v7.receiver = self;
    v7.super_class = (Class)BWFunnelNode;
    -[BWNode _handleMessage:fromInput:](&v7, sel__handleMessage_fromInput_, a3, a4);
    return;
  }
  -[NSMutableArray addObject:](self->_queuedMessages, "addObject:", a3);
  -[NSMutableArray addObject:](self->_inputsForQueuedMessages, "addObject:", a4);
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3, a4);
}

- (BWFunnelNode)initWithNumberOfInputs:(int)a3 mediaType:(unsigned int)a4 holdMessages:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v6;
  int v7;
  BWFunnelNode *v8;
  BWFunnelNode *v9;
  BWNodeInput *v10;
  BWVideoFormatRequirements *v11;
  BWNodeOutput *v12;
  BWVideoFormatRequirements *v13;
  objc_super v15;

  if (a3 <= 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Non-positive fan in count"), 0));
  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BWFunnelNode;
  v8 = -[BWNode init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    -[BWNode setSupportsConcurrentLiveInputCallbacks:](v8, "setSupportsConcurrentLiveInputCallbacks:", 0);
    v9->_holdMessagesUntilAllInputsAreLive = v5;
    if (v5)
    {
      v9->_queuedMessages = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v9->_inputsForQueuedMessages = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    }
    do
    {
      v10 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", v6, v9);
      if ((_DWORD)v6 == 1986618469)
      {
        v11 = objc_alloc_init(BWVideoFormatRequirements);
        -[BWNodeInput setFormatRequirements:](v10, "setFormatRequirements:", v11);

      }
      -[BWNodeInput setPassthroughMode:](v10, "setPassthroughMode:", 1);
      -[BWNode addInput:](v9, "addInput:", v10);

      --v7;
    }
    while (v7);
    v12 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", v6, v9);
    if ((_DWORD)v6 == 1986618469)
    {
      v13 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWNodeOutput setFormatRequirements:](v12, "setFormatRequirements:", v13);

    }
    v9->_stateLock._os_unfair_lock_opaque = 0;
    -[BWNodeOutput setPassthroughMode:](v12, "setPassthroughMode:", 1);
    -[BWNode addOutput:](v9, "addOutput:", v12);

  }
  return v9;
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  if (-[BWNode allInputsHaveReachedState:](self, "allInputsHaveReachedState:", 1, a4, a5))
  {
    if (!-[BWNodeOutput liveFormat](self->super._output, "liveFormat"))
    {
      -[BWNodeOutput makeConfiguredFormatLive](self->super._output, "makeConfiguredFormatLive");
      self->_running = 1;
    }
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
  v9.receiver = self;
  v9.super_class = (Class)BWFunnelNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v9, sel_prepareForCurrentConfigurationToBecomeLive);
}

- (BWFunnelNode)initWithNumberOfInputs:(int)a3 mediaType:(unsigned int)a4
{
  return -[BWFunnelNode initWithNumberOfInputs:mediaType:holdMessages:](self, "initWithNumberOfInputs:mediaType:holdMessages:", *(_QWORD *)&a3, *(_QWORD *)&a4, 0);
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWFunnelNode;
  -[BWNode dealloc](&v3, sel_dealloc);
}

- (void)_deliverQueuedMessages
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v5;

  if (a1)
  {
    if (objc_msgSend(*(id *)(a1 + 104), "count"))
    {
      v2 = 0;
      do
      {
        v3 = objc_msgSend(*(id *)(a1 + 104), "objectAtIndexedSubscript:", v2);
        v4 = objc_msgSend(*(id *)(a1 + 112), "objectAtIndexedSubscript:", v2);
        v5.receiver = (id)a1;
        v5.super_class = (Class)BWFunnelNode;
        objc_msgSendSuper2(&v5, sel__handleMessage_fromInput_, v3, v4);
        ++v2;
      }
      while (v2 < objc_msgSend(*(id *)(a1 + 104), "count"));
    }
    objc_msgSend(*(id *)(a1 + 104), "removeAllObjects");

    *(_QWORD *)(a1 + 104) = 0;
    objc_msgSend(*(id *)(a1 + 112), "removeAllObjects");

    *(_QWORD *)(a1 + 112) = 0;
    *(_BYTE *)(a1 + 96) = 0;
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  os_unfair_lock_s *p_stateLock;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (-[BWNode allInputsHaveReachedState:](self, "allInputsHaveReachedState:", 0) && self->_running)
  {
    self->_running = 0;
    os_unfair_lock_unlock(p_stateLock);
    -[BWNodeOutput markEndOfLiveOutput](self->super._output, "markEndOfLiveOutput");
  }
  else
  {
    os_unfair_lock_unlock(p_stateLock);
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  -[BWNodeOutput emitNodeError:](self->super._output, "emitNodeError:", a3, a4);
}

- (void)handleStillImageReferenceFrameBracketedCaptureSequenceNumber:(int)a3 forInput:(id)a4
{
  -[BWNodeOutput emitStillImageReferenceFrameBracketedCaptureSequenceNumberMessageWithSequenceNumber:](self->super._output, "emitStillImageReferenceFrameBracketedCaptureSequenceNumberMessageWithSequenceNumber:", *(_QWORD *)&a3, a4);
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  -[BWNodeOutput emitDroppedSample:](self->super._output, "emitDroppedSample:", a3, a4);
}

@end
