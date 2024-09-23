@implementation BWStillImageTimeMachineFrameCoordinatorNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWStillImageTimeMachineFrameCoordinatorNode)initWithPortTypes:(id)a3
{
  BWStillImageTimeMachineFrameCoordinatorNode *v4;
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  BWNodeInput *v9;
  BWVideoFormatRequirements *v10;
  BWNodeOutput *v11;
  BWVideoFormatRequirements *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BWStillImageTimeMachineFrameCoordinatorNode;
  v4 = -[BWNode init](&v14, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (objc_msgSend(a3, "count"))
    {
      v7 = 0;
      do
      {
        v8 = objc_msgSend(a3, "objectAtIndexedSubscript:", v7);
        v9 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1986618469, v4, v7);
        v10 = objc_alloc_init(BWVideoFormatRequirements);
        -[BWNodeInput setFormatRequirements:](v9, "setFormatRequirements:", v10);

        -[BWNodeInput setPassthroughMode:](v9, "setPassthroughMode:", 1);
        -[BWNode addInput:](v4, "addInput:", v9);
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, v8);

        v11 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v4);
        v12 = objc_alloc_init(BWVideoFormatRequirements);
        -[BWNodeOutput setFormatRequirements:](v11, "setFormatRequirements:", v12);
        -[BWNodeOutput setPassthroughMode:](v11, "setPassthroughMode:", 1);
        -[BWNodeOutput setIndexOfInputWhichDrivesThisOutput:](v11, "setIndexOfInputWhichDrivesThisOutput:", v7);

        -[BWNode addOutput:](v4, "addOutput:", v11);
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, v8);

        ++v7;
      }
      while (objc_msgSend(a3, "count") > v7);
    }
    v4->_portTypeToInput = (NSDictionary *)objc_msgSend(v5, "copy");

    v4->_portTypeToOutput = (NSDictionary *)objc_msgSend(v6, "copy");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[BWStillImageTimeMachineFrameCoordinatorNode _resetStillImageCaptureState]((uint64_t)self);

  v3.receiver = self;
  v3.super_class = (Class)BWStillImageTimeMachineFrameCoordinatorNode;
  -[BWNode dealloc](&v3, sel_dealloc);
}

- (void)_resetStillImageCaptureState
{
  if (a1)
  {

    *(_QWORD *)(a1 + 112) = 0;
    *(_QWORD *)(a1 + 120) = 0;
  }
}

- (id)inputForPortType:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_portTypeToInput, "objectForKeyedSubscript:", a3);
}

- (id)outputForPortType:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_portTypeToOutput, "objectForKeyedSubscript:", a3);
}

- (id)nodeType
{
  return CFSTR("Coordinator");
}

- (id)nodeSubType
{
  return CFSTR("StillImageFrameCoordinator");
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(a4, "index")), "setFormat:", a3);
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
  void *v6;
  void *v7;
  uint64_t v8;
  BWStillImageCaptureSettings *currentResolvedStillImageCaptureSettings;
  uint64_t v10;
  uint64_t v11;
  CFTypeRef v12;
  id v13;

  if (a3)
  {
    v6 = (void *)CMGetAttachment(a3, CFSTR("BWStillImageCaptureSettings"), 0);
    if (v6)
    {
      v7 = v6;
      if (self->_currentResolvedStillImageCaptureSettings)
      {
        v8 = objc_msgSend(v6, "settingsID");
        if (v8 != -[BWStillImageCaptureSettings settingsID](self->_currentResolvedStillImageCaptureSettings, "settingsID"))-[BWStillImageTimeMachineFrameCoordinatorNode _resetStillImageCaptureState]((uint64_t)self);
        currentResolvedStillImageCaptureSettings = self->_currentResolvedStillImageCaptureSettings;
        if (currentResolvedStillImageCaptureSettings)
          goto LABEL_9;
      }
      v10 = -[BWStillImageTimeMachineFrameCoordinatorNode _setupStillImageCaptureStateWithResolvedStillImageCaptureSettings:]((uint64_t)self, v7);
      if (!(_DWORD)v10)
      {
        currentResolvedStillImageCaptureSettings = self->_currentResolvedStillImageCaptureSettings;
LABEL_9:
        if ((-[BWStillImageCaptureSettings captureFlags](currentResolvedStillImageCaptureSettings, "captureFlags") & 0x2000) != 0)
          -[BWStillImageTimeMachineFrameCoordinatorNode _handleSampleBuffer:]((id *)&self->super.super.isa, a3);
        else
          -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3);
        goto LABEL_12;
      }
      v11 = v10;
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      v11 = 4294954516;
    }
    v12 = CMGetAttachment(a3, CFSTR("StillSettings"), 0);
    v13 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", v11, self, v12, CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0));
    -[BWNodeOutput emitNodeError:](self->super._output, "emitNodeError:", v13);

  }
LABEL_12:
  if (self->_currentResolvedStillImageCaptureSettings)
  {
    if (-[BWStillImageTimeMachineFrameCoordinatorNode _isCaptureComplete]((uint64_t)self))
      -[BWStillImageTimeMachineFrameCoordinatorNode _resetStillImageCaptureState]((uint64_t)self);
  }
}

- (uint64_t)_setupStillImageCaptureStateWithResolvedStillImageCaptureSettings:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BWStillImageCaptureStreamFrameCounts *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    if ((objc_msgSend(a2, "captureFlags") & 0x2000) != 0)
    {
      if (objc_msgSend(a2, "captureType") == 5
        || objc_msgSend(a2, "captureType") == 4
        || objc_msgSend(a2, "captureType") == 1)
      {
        *(_QWORD *)(v3 + 120) = a2;

        *(_QWORD *)(v3 + 112) = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v10 = 0u;
        v11 = 0u;
        v12 = 0u;
        v13 = 0u;
        v4 = (void *)objc_msgSend(*(id *)(v3 + 120), "captureStreamSettings", 0);
        result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (result)
        {
          v5 = result;
          v6 = *(_QWORD *)v11;
          do
          {
            v7 = 0;
            do
            {
              if (*(_QWORD *)v11 != v6)
                objc_enumerationMutation(v4);
              v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
              v9 = objc_alloc_init(BWStillImageCaptureStreamFrameCounts);
              v9->expectedTimeMachineFrames = objc_msgSend(v8, "expectedTimeMachineFrameCaptureCount");
              v9->expectedFrames = objc_msgSend(v8, "expectedFrameCaptureCount");
              objc_msgSend(*(id *)(v3 + 112), "setObject:forKeyedSubscript:", v9, objc_msgSend(v8, "portType"));
              ++v7;
            }
            while (v5 != v7);
            result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
            v5 = result;
          }
          while (result);
        }
      }
      else
      {
        return 4294954516;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)_handleSampleBuffer:(id *)result
{
  id *v3;
  void *v4;
  uint64_t v5;
  _DWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;

  if (result)
  {
    v3 = result;
    v4 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v5 = objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
    v6 = (_DWORD *)objc_msgSend(v3[14], "objectForKeyedSubscript:", v5);
    v7 = objc_msgSend(v3[15], "captureStreamSettingsForPortType:", v5);
    if (!v6)
      return (id *)objc_msgSend((id)objc_msgSend(v3[13], "objectForKeyedSubscript:", v5), "emitSampleBuffer:", target);
    if ((int)v6[4] < 1)
      return (id *)objc_msgSend((id)objc_msgSend(v3[13], "objectForKeyedSubscript:", v5), "emitSampleBuffer:", target);
    v8 = (void *)v7;
    ++v6[3];
    if ((objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D10]), "BOOLValue") & 1) != 0
      || (int)v6[4] < 1)
    {
      return (id *)objc_msgSend((id)objc_msgSend(v3[13], "objectForKeyedSubscript:", v5), "emitSampleBuffer:", target);
    }
    v9 = *MEMORY[0x1E0D06910];
    v10 = objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06910]);
    if (v10)
    {
      v11 = (void *)v10;
      v12 = objc_msgSend(v8, "timeMachineFrameCount");
      v13 = objc_msgSend(v11, "intValue") + v12;
    }
    else
    {
      v13 = (v6[5] + 1);
      v6[5] = v13;
      if (objc_msgSend(v3[15], "captureType") == 1)
        return (id *)objc_msgSend((id)objc_msgSend(v3[13], "objectForKeyedSubscript:", v5), "emitSampleBuffer:", target);
    }
    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13), v9);
    return (id *)objc_msgSend((id)objc_msgSend(v3[13], "objectForKeyedSubscript:", v5), "emitSampleBuffer:", target);
  }
  return result;
}

- (uint64_t)_isCaptureComplete
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v8 = 0u;
    v9 = 0u;
    v6 = 0u;
    v7 = 0u;
    v1 = (void *)objc_msgSend(*(id *)(result + 112), "allValues", 0);
    v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    if (v2)
    {
      v3 = v2;
      v4 = *(_QWORD *)v7;
      while (2)
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v7 != v4)
            objc_enumerationMutation(v1);
          if (*(_DWORD *)(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 12) != *(_DWORD *)(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5)
                                                                                           + 8))
            return 0;
          ++v5;
        }
        while (v3 != v5);
        v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
        if (v3)
          continue;
        break;
      }
    }
    return 1;
  }
  return result;
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(a4, "index")), "emitNodeError:", a3);
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(a4, "index")), "emitDroppedSample:", a3);
}

@end
