@implementation BWStillImageMultiCameraDoserNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWStillImageMultiCameraDoserNode)initWithPortTypes:(id)a3
{
  BWStillImageMultiCameraDoserNode *v4;
  unint64_t v5;
  unint64_t v6;
  id v7;
  BWNodeInput *v8;
  BWVideoFormatRequirements *v9;
  BWNodeOutput *v10;
  BWVideoFormatRequirements *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)BWStillImageMultiCameraDoserNode;
  v4 = -[BWNode init](&v13, sel_init);
  if (v4)
  {
    v4->_portTypes = (NSArray *)objc_msgSend(a3, "copy");
    v4->_currentSettingsID = -1;
    v4->_inputIndicesForWhichDosingIsPerformed = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4->_stashedObjectsByInputIndex = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(a3, "count"))
    {
      v5 = 0;
      v6 = 0;
      do
      {
        v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        -[NSMutableArray addObject:](v4->_stashedObjectsByInputIndex, "addObject:", v7);

        v8 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1986618469, v4, v5);
        v9 = objc_alloc_init(BWVideoFormatRequirements);
        -[BWNodeInput setFormatRequirements:](v8, "setFormatRequirements:", v9);

        -[BWNodeInput setPassthroughMode:](v8, "setPassthroughMode:", 1);
        -[BWNodeInput setRetainedBufferCount:](v8, "setRetainedBufferCount:", 1);
        -[BWNode addInput:](v4, "addInput:", v8);

        v10 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v4);
        v11 = objc_alloc_init(BWVideoFormatRequirements);
        -[BWNodeOutput setFormatRequirements:](v10, "setFormatRequirements:", v11);
        -[BWNodeOutput setPassthroughMode:](v10, "setPassthroughMode:", 1);
        -[BWNodeOutput setIndexOfInputWhichDrivesThisOutput:](v10, "setIndexOfInputWhichDrivesThisOutput:", v6);

        -[BWNode addOutput:](v4, "addOutput:", v10);
        v5 = (v6 + 1);
        v6 = v5;
      }
      while (objc_msgSend(a3, "count") > v5);
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStillImageMultiCameraDoserNode;
  -[BWNode dealloc](&v3, sel_dealloc);
}

- (id)nodeType
{
  return CFSTR("Synchronizer");
}

- (id)nodeSubType
{
  return CFSTR("StillImageMultiCameraDoser");
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  objc_msgSend(-[BWStillImageMultiCameraDoserNode _outputForNodeInputIndex:]((id *)&self->super.super.isa, objc_msgSend(a4, "index")), "setFormat:", a3);
}

- (id)_outputForNodeInputIndex:(id *)result
{
  if (result)
    return (id *)objc_msgSend((id)objc_msgSend(result, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(result, "outputIndexForPortType:", objc_msgSend(result[12], "objectAtIndexedSubscript:", a2)));
  return result;
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  NSArray *v6;
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
  if (-[BWNode allInputsHaveReachedState:](self, "allInputsHaveReachedState:", 1, a4, a5))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = -[BWNode outputs](self, "outputs", 0);
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "makeConfiguredFormatLive");
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[BWNode allInputsHaveReachedState:](self, "allInputsHaveReachedState:", 0))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = -[BWNode outputs](self, "outputs", 0);
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "markEndOfLiveOutput");
        }
        while (v6 != v8);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  void *v7;
  void *v8;

  v7 = (void *)CMGetAttachment(a3, CFSTR("StillImageSettings"), 0);
  if (objc_msgSend(v7, "settingsID") != self->_currentSettingsID)
  {
    v8 = (void *)CMGetAttachment(a3, CFSTR("BWStillImageCaptureSettings"), 0);
    -[BWStillImageMultiCameraDoserNode _configureCaptureRequestStateWithRequestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:]((unint64_t)self, v7, v8);
  }
  if ((-[NSMutableArray containsObject:](self->_inputIndicesForWhichDosingIsPerformed, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a4, "index"))) & 1) != 0)
  {
    objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_stashedObjectsByInputIndex, "objectAtIndexedSubscript:", objc_msgSend(a4, "index")), "addObject:", a3);
    -[BWStillImageMultiCameraDoserNode _emitStashedObjectsIfReady]((uint64_t)self);
  }
  else
  {
    objc_msgSend(-[BWStillImageMultiCameraDoserNode _outputForNodeInputIndex:]((id *)&self->super.super.isa, objc_msgSend(a4, "index")), "emitSampleBuffer:", a3);
  }
}

- (unint64_t)_configureCaptureRequestStateWithRequestedStillImageCaptureSettings:(void *)a3 resolvedStillImageCaptureSettings:
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5 = result;
    -[BWStillImageMultiCameraDoserNode _clearCaptureRequestState](result);
    *(_QWORD *)(v5 + 104) = objc_msgSend(a2, "settingsID");
    if ((unint64_t)objc_msgSend((id)objc_msgSend(a3, "captureStreamSettings"), "count") >= 2)
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v6 = (void *)objc_msgSend(a3, "captureStreamSettings", 0);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v15;
        while (2)
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v15 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
            if (objc_msgSend(v11, "hasValidFrames"))
            {
              v12 = objc_msgSend(v11, "portType");
              if (!v12)
                return -[BWStillImageMultiCameraDoserNode _clearCaptureRequestState](v5);
              v13 = objc_msgSend(*(id *)(v5 + 96), "indexOfObject:", v12);
              if (v13 == 0x7FFFFFFFFFFFFFFFLL)
                return -[BWStillImageMultiCameraDoserNode _clearCaptureRequestState](v5);
              objc_msgSend(*(id *)(v5 + 112), "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13));
            }
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (v8)
            continue;
          break;
        }
      }
    }
    result = objc_msgSend(*(id *)(v5 + 112), "count");
    if (result <= 1)
      return objc_msgSend(*(id *)(v5 + 112), "removeAllObjects");
  }
  return result;
}

- (uint64_t)_emitStashedObjectsIfReady
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  CFTypeID v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v2 = *(void **)(result + 112);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (!v3)
      goto LABEL_10;
    v4 = v3;
    v5 = *(_QWORD *)v22;
    LOBYTE(v6) = 1;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(v2);
        v6 = (objc_msgSend((id)objc_msgSend(*(id *)(v1 + 120), "objectAtIndexedSubscript:", (int)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v7++), "intValue")), "count") != 0) & v6;
      }
      while (v4 != v7);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      v4 = result;
    }
    while (result);
    if (v6)
    {
LABEL_10:
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v8 = *(void **)(v1 + 112);
      result = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      if (result)
      {
        v9 = result;
        v10 = *(_QWORD *)v18;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v18 != v10)
              objc_enumerationMutation(v8);
            v12 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v11), "intValue");
            v13 = (void *)objc_msgSend(*(id *)(v1 + 120), "objectAtIndexedSubscript:", v12);
            v14 = (id)objc_msgSend(v13, "firstObject");
            objc_msgSend(v13, "removeObjectAtIndex:", 0);
            v15 = (void *)objc_msgSend((id)objc_msgSend((id)v1, "outputs"), "objectAtIndexedSubscript:", objc_msgSend((id)v1, "outputIndexForPortType:", objc_msgSend(*(id *)(v1 + 96), "objectAtIndexedSubscript:", v12)));
            v16 = CFGetTypeID(v14);
            if (CMSampleBufferGetTypeID() == v16)
              objc_msgSend(v15, "emitSampleBuffer:", v14);
            else
              objc_msgSend(v15, "emitNodeError:", v14);

            ++v11;
          }
          while (v9 != v11);
          result = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          v9 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "stillImageSettings"), "requestedSettings"), "settingsID") != self->_currentSettingsID)
    -[BWStillImageMultiCameraDoserNode _configureCaptureRequestStateWithRequestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:]((unint64_t)self, (void *)objc_msgSend((id)objc_msgSend(a3, "stillImageSettings"), "requestedSettings"), (void *)objc_msgSend((id)objc_msgSend(a3, "stillImageSettings"), "captureSettings"));
  if ((-[NSMutableArray containsObject:](self->_inputIndicesForWhichDosingIsPerformed, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a4, "index"))) & 1) != 0)
  {
    objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_stashedObjectsByInputIndex, "objectAtIndexedSubscript:", objc_msgSend(a4, "index")), "addObject:", a3);
    -[BWStillImageMultiCameraDoserNode _emitStashedObjectsIfReady]((uint64_t)self);
  }
  else
  {
    objc_msgSend(-[BWStillImageMultiCameraDoserNode _outputForNodeInputIndex:]((id *)&self->super.super.isa, objc_msgSend(a4, "index")), "emitNodeError:", a3);
  }
}

- (unint64_t)outputIndexForPortType:(id)a3
{
  return -[NSArray indexOfObject:](self->_portTypes, "indexOfObject:", a3);
}

- (uint64_t)_clearCaptureRequestState
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 112), "removeAllObjects");
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v2 = *(void **)(v1 + 120);
    result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (result)
    {
      v3 = result;
      v4 = *(_QWORD *)v8;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v8 != v4)
            objc_enumerationMutation(v2);
          v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * v5);
          objc_msgSend(v6, "count");
          objc_msgSend(v6, "removeAllObjects");
          ++v5;
        }
        while (v3 != v5);
        result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
        v3 = result;
      }
      while (result);
    }
  }
  return result;
}

@end
