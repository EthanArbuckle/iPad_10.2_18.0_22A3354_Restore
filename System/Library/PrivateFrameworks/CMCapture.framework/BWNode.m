@implementation BWNode

- (int)deferredPreparePriority
{
  return self->_deferredPreparePriority;
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  NSMutableArray *outputs;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  BWNodeOutputMediaProperties *v17;
  uint64_t v18;
  BWNode *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a5, "isEqualToString:", CFSTR("PrimaryFormat")))
  {
    -[BWNode didSelectFormat:forInput:](self, "didSelectFormat:forInput:", a3, a4);
  }
  else
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v19 = self;
    outputs = self->_outputs;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](outputs, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(outputs);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          v15 = objc_msgSend(v14, "attachedMediaKeyDrivenByInputAttachedMediaKey:inputIndex:", a5, objc_msgSend(a4, "index"));
          if (v15)
          {
            v16 = v15;
            if (objc_msgSend(v14, "mediaPropertiesForAttachedMediaKey:", v15))
            {
              v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ output %@ unexpectedly has mediaPropertiesForAttachedMediaKey %@ (provided media key was %@)"), v19, v14, v16, a5);
              objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v18, 0));
            }
            v17 = objc_alloc_init(BWNodeOutputMediaProperties);
            objc_msgSend(v14, "_setMediaProperties:forAttachedMediaKey:", v17, v16);
            -[BWNodeOutputMediaProperties setResolvedFormat:](v17, "setResolvedFormat:", a3);
          }
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](outputs, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }
  }
}

- (void)didSelectFormat:(id)a3 forOutput:(id)a4 forAttachedMediaKey:(id)a5
{
  if (objc_msgSend(a5, "isEqualToString:", CFSTR("PrimaryFormat")))
    -[BWNode didSelectFormat:forOutput:](self, "didSelectFormat:forOutput:", a3, a4);
}

- (NSArray)outputs
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_outputs);
}

- (NSArray)inputs
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_inputs);
}

- (BOOL)allInputsHaveReachedState:(int)a3
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[BWNode supportsConcurrentLiveInputCallbacks](self, "supportsConcurrentLiveInputCallbacks"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("allInputsHaveReachedState: isn't supported for for concurrent live input callbacks"), 0));
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = -[BWNode inputs](self, "inputs", 0);
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        if ((a3 == 1) == (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "liveFormat") == 0))
          return 0;
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
  return 1;
}

- (BOOL)supportsConcurrentLiveInputCallbacks
{
  return self->_supportsConcurrentLiveInputCallbacks;
}

- (void)setGraph:(id)a3
{
  self->_graph = (BWGraph *)a3;
}

- (void)_handleMessage:(id)a3 fromInput:(id)a4
{
  int v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v7 = *((_DWORD *)a3 + 2);
  v8 = *((_DWORD *)a3 + 3);
  v9 = (void *)MEMORY[0x1A858DD40](self, a2);
  if (v7 == 1)
  {
    switch(v8)
    {
      case 3:
LABEL_6:
        v11 = objc_msgSend(a4, "liveFormat");
        v12 = objc_msgSend(a3, "configurationID");
        -[BWNodeRenderDelegate node:format:didBecomeLiveForInput:configurationID:](self->_renderDelegate, "node:format:didBecomeLiveForInput:configurationID:", self, v11, a4, v12);
        -[BWNode configurationWithID:updatedFormat:didBecomeLiveForInput:](self, "configurationWithID:updatedFormat:didBecomeLiveForInput:", v12, objc_msgSend(a3, "updatedFormat"), a4);
        break;
      case 4:
LABEL_7:
        -[BWNodeRenderDelegate node:format:didBecomeLiveForInput:configurationID:](self->_renderDelegate, "node:format:didBecomeLiveForInput:configurationID:", self, 0, a4, self->_configurationID);
        -[BWNode didReachEndOfDataForInput:](self, "didReachEndOfDataForInput:", a4);
        break;
      case 5:
LABEL_8:
        -[BWNode handleNodeError:forInput:](self, "handleNodeError:forInput:", objc_msgSend(a3, "nodeError"), a4);
        break;
      case 6:
LABEL_9:
        -[BWNode handleStillImageReferenceFrameBracketedCaptureSequenceNumber:forInput:](self, "handleStillImageReferenceFrameBracketedCaptureSequenceNumber:forInput:", objc_msgSend(a3, "referenceFrameBracketedCaptureSequenceNumber"), a4);
        break;
      case 7:
LABEL_10:
        -[BWNode handleStillImagePrewarmWithSettings:forInput:](self, "handleStillImagePrewarmWithSettings:forInput:", objc_msgSend(a3, "stillImageSettings"), a4);
        break;
      case 8:
LABEL_11:
        -[BWNode suspendResources](self, "suspendResources");
        break;
      default:
        break;
    }
  }
  else if (v7 == 2)
  {
    switch(v8)
    {
      case 1:
        v10 = objc_msgSend(a3, "sampleBuffer");
        -[BWNodeRenderDelegate node:willRenderSampleBuffer:forInput:](self->_renderDelegate, "node:willRenderSampleBuffer:forInput:", self, v10, a4);
        -[BWNode renderSampleBuffer:forInput:](self, "renderSampleBuffer:forInput:", v10, a4);
        break;
      case 2:
        -[BWNode handleDroppedSample:forInput:](self, "handleDroppedSample:forInput:", objc_msgSend(a3, "droppedSample"), a4);
        break;
      case 3:
        goto LABEL_6;
      case 4:
        goto LABEL_7;
      case 5:
        goto LABEL_8;
      case 6:
        goto LABEL_9;
      case 7:
        goto LABEL_10;
      case 8:
        goto LABEL_11;
      default:
        break;
    }
  }
  objc_autoreleasePoolPop(v9);
}

- (BWNodeRenderDelegate)renderDelegate
{
  return self->_renderDelegate;
}

- (NSString)nodeType
{
  return 0;
}

- (BOOL)supportsLiveReconfiguration
{
  return self->_supportsLiveReconfiguration;
}

- (BWNodeOutput)output
{
  return self->_output;
}

- (void)setSupportsConcurrentLiveInputCallbacks:(BOOL)a3
{
  self->_supportsConcurrentLiveInputCallbacks = a3;
}

- (void)addInput:(id)a3
{
  NSMutableArray *inputs;

  if (a3)
  {
    inputs = self->_inputs;
    if (!inputs)
    {
      inputs = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
      self->_inputs = inputs;
    }
    -[NSMutableArray addObject:](inputs, "addObject:", a3);
    self->_singleInput = -[NSMutableArray count](self->_inputs, "count") == 1;
    if (!self->_input)
      self->_input = (BWNodeInput *)a3;
  }
}

- (void)setSupportsLiveReconfiguration:(BOOL)a3
{
  self->_supportsLiveReconfiguration = a3;
}

- (void)addOutput:(id)a3
{
  NSMutableArray *outputs;

  if (a3)
  {
    outputs = self->_outputs;
    if (!outputs)
    {
      outputs = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
      self->_outputs = outputs;
    }
    -[NSMutableArray addObject:](outputs, "addObject:", a3);
    self->_singleOutput = -[NSMutableArray count](self->_outputs, "count") == 1;
    if (!self->_output)
      self->_output = (BWNodeOutput *)a3;
  }
}

- (BWNode)init
{
  BWNode *v2;
  BWNode *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWNode;
  v2 = -[BWNode init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_deferredPreparePriority = 2;
    if (!-[BWNode name](v2, "name"))
      -[BWNode setName:](v3, "setName:", objc_msgSend((id)objc_opt_class(), "description"));
  }
  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setRenderDelegate:(id)a3
{
  self->_renderDelegate = (BWNodeRenderDelegate *)a3;
}

- (void)setConfigurationID:(int64_t)a3
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  self->_configurationID = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = -[BWNode inputs](self, "inputs");
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v9++), "setConfigurationID:", a3);
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = -[BWNode outputs](self, "outputs", 0);
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "setConfigurationID:", a3);
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }
}

- (BWGraph)graph
{
  return self->_graph;
}

- (void)setSubgraphName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setDeferredPreparePriority:(int)a3
{
  self->_deferredPreparePriority = a3;
}

- (id)description
{
  NSString *name;
  const __CFString *v4;

  name = self->_name;
  if (name)
    v4 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" '%@'"), name);
  else
    v4 = &stru_1E4928818;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p>%@"), objc_opt_class(), self, v4);
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  if (self->_input && self->_singleInput && (!self->_output || self->_singleOutput))
    -[BWNodeOutput emitDroppedSample:](self->_output, "emitDroppedSample:", a3, a4);
}

- (int64_t)configurationID
{
  return self->_configurationID;
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  void *v5;
  NSString *v7;
  void *v8;

  if (self->_input)
  {
    if (!self->_singleInput || self->_output && !self->_singleOutput)
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      v7 = NSStringFromSelector(a2);
      v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ BWNode base class implementation only works for single input single output nodes, please implement %@ in %@"), self, v7, objc_opt_class()), 0);
      objc_exception_throw(v8);
    }
    -[BWNodeOutput makeConfiguredFormatLive](self->_output, "makeConfiguredFormatLive", a3, a4, a5);
  }
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = -[BWNode outputs](self, "outputs", 0);
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "prepareForConfiguredFormatToBecomeLive");
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (BWNodeInput)input
{
  return self->_input;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  -[NSMutableArray makeObjectsPerformSelector:](self->_inputs, "makeObjectsPerformSelector:", sel_invalidate);

  -[NSMutableArray makeObjectsPerformSelector:](self->_outputs, "makeObjectsPerformSelector:", sel_invalidate);
  v3.receiver = self;
  v3.super_class = (Class)BWNode;
  -[BWNode dealloc](&v3, sel_dealloc);
}

- (NSString)nodeSubType
{
  return 0;
}

- (BOOL)hasNonLiveConfigurationChanges
{
  return 0;
}

- (void)suspendResources
{
  NSMutableArray *outputs;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  outputs = self->_outputs;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](outputs, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(outputs);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "suspendResources");
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](outputs, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  void *v3;
  NSString *v5;
  void *v6;

  if (self->_input)
  {
    if (!self->_singleInput || self->_output && !self->_singleOutput)
    {
      v3 = (void *)MEMORY[0x1E0CB3940];
      v5 = NSStringFromSelector(a2);
      v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ BWNode base class implementation only works for single input single output nodes, please implement %@ in %@"), self, v5, objc_opt_class()), 0);
      objc_exception_throw(v6);
    }
    -[BWNodeOutput markEndOfLiveOutput](self->_output, "markEndOfLiveOutput", a3);
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  void *v4;
  NSString *v6;
  void *v7;

  if (self->_input)
  {
    if (!self->_singleInput || self->_output && !self->_singleOutput)
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      v6 = NSStringFromSelector(a2);
      v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ BWNode base class implementation only works for single input single output nodes, please implement %@ in %@"), self, v6, objc_opt_class()), 0);
      objc_exception_throw(v7);
    }
    -[BWNodeOutput emitNodeError:](self->_output, "emitNodeError:", a3, a4);
  }
}

- (void)handleStillImageReferenceFrameBracketedCaptureSequenceNumber:(int)a3 forInput:(id)a4
{
  if (self->_input && self->_singleInput && (!self->_output || self->_singleOutput))
    -[BWNodeOutput emitStillImageReferenceFrameBracketedCaptureSequenceNumberMessageWithSequenceNumber:](self->_output, "emitStillImageReferenceFrameBracketedCaptureSequenceNumberMessageWithSequenceNumber:", *(_QWORD *)&a3, a4);
}

- (void)handleStillImagePrewarmWithSettings:(id)a3 forInput:(id)a4
{
  NSMutableArray *outputs;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray containsObject:](self->_inputs, "containsObject:", a4))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    outputs = self->_outputs;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](outputs, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(outputs);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "emitStillImagePrewarmMessageWithSettings:", a3);
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](outputs, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }
  }
}

- (void)removeOutput:(id)a3
{
  if (a3)
  {
    -[NSMutableArray removeObject:](self->_outputs, "removeObject:");
    if (self->_output == a3)
      self->_output = (BWNodeOutput *)-[NSMutableArray firstObject](self->_outputs, "firstObject");
  }
}

- (BOOL)input:(id)a3 hasReachedState:(int)a4
{
  uint64_t v5;
  BOOL v6;

  v5 = objc_msgSend(a3, "liveFormat");
  v6 = v5 == 0;
  if (a4)
    v6 = 0;
  if (a4 == 1)
    return v5 != 0;
  else
    return v6;
}

- (NSString)subgraphName
{
  return self->_subgraphName;
}

@end
