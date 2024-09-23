@implementation BWStillImageFrameCoordinatorNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(a4, "index")), "setFormat:", a3);
}

- (id)nodeType
{
  return CFSTR("Coordinator");
}

- (id)outputForPortType:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_portTypeToOutput, "objectForKeyedSubscript:", a3);
}

- (id)sensorRawOutputForPortType:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_portTypeToSensorRawOutput, "objectForKeyedSubscript:", a3);
}

- (id)sensorRawInputForPortType:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_portTypeToSensorRawInput, "objectForKeyedSubscript:", a3);
}

- (id)inputForPortType:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_portTypeToInput, "objectForKeyedSubscript:", a3);
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

- (BWStillImageFrameCoordinatorNode)initWithNodeConfiguration:(id)a3 inputPortTypes:(id)a4 sensorRawInputPortTypes:(id)a5
{
  BWStillImageFrameCoordinatorNode *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  BWNodeInput *v17;
  BWVideoFormatRequirements *v18;
  const char *v19;
  BWNodeOutput *v20;
  BWVideoFormatRequirements *v21;
  const char *v22;
  int v23;
  uint64_t i;
  void *v25;
  BWNodeInput *v26;
  BWVideoFormatRequirements *v27;
  const char *v28;
  BWNodeOutput *v29;
  BWVideoFormatRequirements *v30;
  const char *v31;
  uint64_t v34;
  int v35;
  void *v36;
  id obj;
  id obja;
  void *v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  objc_super v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v49.receiver = self;
  v49.super_class = (Class)BWStillImageFrameCoordinatorNode;
  v7 = -[BWNode init](&v49, sel_init);
  if (v7)
  {
    v7->_nodeConfiguration = (BWStillImageNodeConfiguration *)a3;
    v7->_holdMessagesUntilAllInputsAreLive = 1;
    v7->_queuedMessages = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7->_inputsForQueuedMessages = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = 0x1E0C99000uLL;
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v39 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v10 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    if (v10)
    {
      v11 = v10;
      obj = a4;
      v12 = 0;
      v13 = *(_QWORD *)v46;
      do
      {
        v14 = 0;
        v35 = v12;
        v15 = v12;
        do
        {
          if (*(_QWORD *)v46 != v13)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v14);
          v17 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1986618469, v7, v15 + v14);
          v18 = objc_alloc_init(BWVideoFormatRequirements);
          -[BWNodeInput setFormatRequirements:](v17, "setFormatRequirements:", v18);

          -[BWNodeInput setPassthroughMode:](v17, "setPassthroughMode:", 1);
          -[BWNodeInput setName:](v17, "setName:", BWPortTypeToDisplayString(v16, v19));
          -[BWNode addInput:](v7, "addInput:", v17);
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, v16);
          v20 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v7);
          v21 = objc_alloc_init(BWVideoFormatRequirements);
          -[BWNodeOutput setFormatRequirements:](v20, "setFormatRequirements:", v21);

          -[BWNodeOutput setPassthroughMode:](v20, "setPassthroughMode:", 1);
          -[BWNodeOutput setIndexOfInputWhichDrivesThisOutput:](v20, "setIndexOfInputWhichDrivesThisOutput:", -[BWNodeInput index](v17, "index"));
          -[BWNodeOutput setName:](v20, "setName:", BWPortTypeToDisplayString(v16, v22));
          -[BWNode addOutput:](v7, "addOutput:", v20);
          objc_msgSend(v39, "setObject:forKeyedSubscript:", v20, v16);

          ++v14;
        }
        while (v11 != v14);
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
        v12 = v15 + v14;
      }
      while (v11);
      v23 = v14 + v35;
      v8 = 0x1E0C99000;
    }
    else
    {
      v23 = 0;
    }
    v7->_portTypeToInput = (NSDictionary *)objc_msgSend(v9, "copy");
    v7->_portTypeToOutput = (NSDictionary *)objc_msgSend(v39, "copy");
    v36 = (void *)objc_msgSend(*(id *)(v8 + 3592), "dictionary");
    obja = (id)objc_msgSend(*(id *)(v8 + 3592), "dictionary");
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v40 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    if (v40)
    {
      v34 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v42 != v34)
            objc_enumerationMutation(a5);
          v25 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          v26 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1986618469, v7, v23 + i);
          v27 = objc_alloc_init(BWVideoFormatRequirements);
          -[BWNodeInput setFormatRequirements:](v26, "setFormatRequirements:", v27);

          -[BWNodeInput setPassthroughMode:](v26, "setPassthroughMode:", 1);
          -[BWNodeInput setName:](v26, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), BWPortTypeToDisplayString(v25, v28), CFSTR("SensorRaw")));
          -[BWNode addInput:](v7, "addInput:", v26);
          objc_msgSend(v36, "setObject:forKeyedSubscript:", v26, v25);
          v29 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v7);
          v30 = objc_alloc_init(BWVideoFormatRequirements);
          -[BWNodeOutput setFormatRequirements:](v29, "setFormatRequirements:", v30);

          -[BWNodeOutput setPassthroughMode:](v29, "setPassthroughMode:", 1);
          -[BWNodeOutput setIndexOfInputWhichDrivesThisOutput:](v29, "setIndexOfInputWhichDrivesThisOutput:", -[BWNodeInput index](v26, "index"));
          -[BWNodeInput setName:](v26, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), BWPortTypeToDisplayString(v25, v31), CFSTR("SensorRaw")));
          -[BWNode addOutput:](v7, "addOutput:", v29);
          objc_msgSend(obja, "setObject:forKeyedSubscript:", v29, v25);

        }
        v23 += i;
        v40 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
      }
      while (v40);
    }
    v7->_portTypeToSensorRawInput = (NSDictionary *)objc_msgSend(v36, "copy");
    v7->_portTypeToSensorRawOutput = (NSDictionary *)objc_msgSend(obja, "copy");
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[BWStillImageFrameCoordinatorNode _resetStillImageCaptureState]((uint64_t)self);

  v3.receiver = self;
  v3.super_class = (Class)BWStillImageFrameCoordinatorNode;
  -[BWNode dealloc](&v3, sel_dealloc);
}

- (void)_resetStillImageCaptureState
{
  if (a1)
  {

    *(_QWORD *)(a1 + 136) = 0;
    *(_QWORD *)(a1 + 144) = 0;
  }
}

- (id)nodeSubType
{
  return CFSTR("StillImageFrameCoordinator");
}

- (void)_handleMessage:(id)a3 fromInput:(id)a4
{
  objc_super v7;

  if (!self->_holdMessagesUntilAllInputsAreLive)
    goto LABEL_4;
  if (-[BWNode allInputsHaveReachedState:](self, "allInputsHaveReachedState:", 1))
  {
    -[BWStillImageFrameCoordinatorNode _deliverQueuedMessages]((uint64_t)self);
LABEL_4:
    v7.receiver = self;
    v7.super_class = (Class)BWStillImageFrameCoordinatorNode;
    -[BWNode _handleMessage:fromInput:](&v7, sel__handleMessage_fromInput_, a3, a4);
    return;
  }
  -[NSMutableArray addObject:](self->_queuedMessages, "addObject:", a3);
  -[NSMutableArray addObject:](self->_inputsForQueuedMessages, "addObject:", a4);
}

- (void)_deliverQueuedMessages
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v5;

  if (a1)
  {
    if (objc_msgSend(*(id *)(a1 + 160), "count"))
    {
      v2 = 0;
      do
      {
        v3 = objc_msgSend(*(id *)(a1 + 160), "objectAtIndexedSubscript:", v2);
        v4 = objc_msgSend(*(id *)(a1 + 168), "objectAtIndexedSubscript:", v2);
        v5.receiver = (id)a1;
        v5.super_class = (Class)BWStillImageFrameCoordinatorNode;
        objc_msgSendSuper2(&v5, sel__handleMessage_fromInput_, v3, v4);
        ++v2;
      }
      while (v2 < objc_msgSend(*(id *)(a1 + 160), "count"));
    }
    objc_msgSend(*(id *)(a1 + 160), "removeAllObjects");

    *(_QWORD *)(a1 + 160) = 0;
    objc_msgSend(*(id *)(a1 + 168), "removeAllObjects");

    *(_QWORD *)(a1 + 168) = 0;
    *(_BYTE *)(a1 + 152) = 0;
  }
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[BWNode allInputsHaveReachedState:](self, "allInputsHaveReachedState:", 1, a4, a5))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = -[BWNode outputs](self, "outputs", 0);
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (!objc_msgSend(v11, "liveFormat"))
            objc_msgSend(v11, "makeConfiguredFormatLive");
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  os_log_type_t type;
  int v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (dword_1EE6BE7D8)
  {
    v20 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (-[BWNode allInputsHaveReachedState:](self, "allInputsHaveReachedState:", 0, v11, v13))
  {
    if (dword_1EE6BE7D8)
    {
      v20 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = -[BWNode outputs](self, "outputs", v12, v14, 0);
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "markEndOfLiveOutput");
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      }
      while (v8);
    }
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  BWStillImageSettings *currentStillImageSettings;
  id v11;

  if (a3)
  {
    v7 = (void *)CMGetAttachment(a3, CFSTR("StillSettings"), 0);
    if (v7)
    {
      v8 = v7;
      if (!self->_currentStillImageSettings)
        goto LABEL_7;
      v9 = objc_msgSend(v7, "settingsID");
      if (v9 != -[BWStillImageSettings settingsID](self->_currentStillImageSettings, "settingsID"))
        -[BWStillImageFrameCoordinatorNode _resetStillImageCaptureState]((uint64_t)self);
      currentStillImageSettings = self->_currentStillImageSettings;
      if (!currentStillImageSettings)
      {
LABEL_7:
        -[BWStillImageFrameCoordinatorNode _setupStillImageCaptureStateWithStillImageSettings:]((uint64_t)self, v8);
        currentStillImageSettings = self->_currentStillImageSettings;
      }
      if ((-[BWStillImageCaptureSettings captureFlags](-[BWStillImageSettings captureSettings](currentStillImageSettings, "captureSettings"), "captureFlags") & 0x2000) != 0)-[BWStillImageFrameCoordinatorNode _handleZeroShutterLagSampleBuffer:forInput:]((id *)&self->super.super.isa, a3, a4);
      else
        -[BWStillImageFrameCoordinatorNode _handleSampleBuffer:forInput:]((id *)&self->super.super.isa, a3, a4);
      if ((objc_msgSend((id)objc_msgSend(v8, "captureSettings"), "captureFlags") & 4) == 0)
      {
        CMRemoveAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05D20]);
        CMRemoveAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05D40]);
      }
    }
    else
    {
      v11 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", 4294954516, self, 0, CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0));
      objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(a4, "index")), "emitNodeError:", v11);

    }
  }
  if (self->_currentStillImageSettings)
  {
    if (-[BWStillImageFrameCoordinatorNode _isCaptureComplete]((uint64_t)self))
      -[BWStillImageFrameCoordinatorNode _resetStillImageCaptureState]((uint64_t)self);
  }
}

- (uint64_t)_setupStillImageCaptureStateWithStillImageSettings:(uint64_t)a1
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BWStillImageCaptureStreamFrameCounters *v9;
  int v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    *(_QWORD *)(a1 + 144) = a2;

    *(_QWORD *)(a1 + 136) = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v3 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 144), "captureSettings", 0), "captureStreamSettings");
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v13;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
          v9 = objc_alloc_init(BWStillImageCaptureStreamFrameCounters);
          v9->expectedTimeMachineFrames = objc_msgSend(v8, "expectedTimeMachineFrameCaptureCount");
          if (objc_msgSend(v8, "adaptiveBracketingParameters"))
            v10 = 0x7FFFFFFF;
          else
            v10 = objc_msgSend(v8, "expectedFrameCaptureCount");
          v9->expectedFrames = v10;
          objc_msgSend(*(id *)(a1 + 136), "setObject:forKeyedSubscript:", v9, objc_msgSend(v8, "portType"));
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
    }
  }
  return 0;
}

- (id)_handleZeroShutterLagSampleBuffer:(void *)a3 forInput:
{
  id *v5;
  void *v6;
  uint64_t v7;
  _DWORD *v8;
  uint64_t v9;
  void *v10;
  char v11;
  uint64_t v12;
  int v13;

  if (result)
  {
    v5 = result;
    v6 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v7 = objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
    v8 = (_DWORD *)objc_msgSend(v5[17], "objectForKeyedSubscript:", v7);
    v9 = objc_msgSend((id)objc_msgSend(v5[18], "captureSettings"), "captureStreamSettingsForPortType:", v7);
    if (!v8)
      return (id *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(a3, "index")), "emitSampleBuffer:", target);
    if ((int)v8[4] < 1)
      return (id *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(a3, "index")), "emitSampleBuffer:", target);
    v10 = (void *)v9;
    ++v8[3];
    -[BWStillImageFrameCoordinatorNode _addMetadataVersionToMutableMetadata:]((uint64_t)v5, v6);
    if ((int)v8[4] < 1)
      return (id *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(a3, "index")), "emitSampleBuffer:", target);
    v11 = objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D10]), "BOOLValue");
    v12 = objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D06910]);
    result = (id *)objc_msgSend(v10, "isFrameCapturedForProcessing:", target);
    v13 = (int)result;
    if ((v11 & 1) == 0 && !v12)
    {
      objc_msgSend(v5[15], "objectForKeyedSubscript:", v7);
      result = (id *)objc_msgSend(v10, "captureFlags");
      ++v8[5];
    }
    if (v13)
      return (id *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(a3, "index")), "emitSampleBuffer:", target);
  }
  return result;
}

- (id)_handleSampleBuffer:(void *)a3 forInput:
{
  id *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;

  if (result)
  {
    v5 = result;
    v6 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v7 = objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
    v8 = objc_msgSend(v5[17], "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_msgSend((id)objc_msgSend(v5[18], "captureSettings"), "captureStreamSettingsForPortType:", v7);
    -[BWStillImageFrameCoordinatorNode _addMetadataVersionToMutableMetadata:]((uint64_t)v5, v6);
    if (!v8)
      return (id *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(a3, "index")), "emitSampleBuffer:", target);
    v10 = objc_msgSend(v9, "isFrameCapturedForProcessing:", target);
    ++*(_DWORD *)(v8 + 12);
    result = (id *)BWIsLastAdaptiveBracketingFrame(target);
    if ((_DWORD)result)
      *(_DWORD *)(v8 + 8) = *(_DWORD *)(v8 + 12);
    if (v10)
      return (id *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(a3, "index")), "emitSampleBuffer:", target);
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
    v1 = (void *)objc_msgSend(*(id *)(result + 136), "allValues", 0);
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

- (void)handleStillImagePrewarmWithSettings:(id)a3 forInput:(id)a4
{
  objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(a4, "index")), "emitStillImagePrewarmMessageWithSettings:", a3);
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(a4, "index")), "emitNodeError:", a3);
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(a4, "index")), "emitDroppedSample:", a3);
}

- (uint64_t)_addMetadataVersionToMutableMetadata:(uint64_t)result
{
  unsigned int v3;
  const __CFString *v4;

  if (result)
  {
    v3 = objc_msgSend(*(id *)(result + 96), "stillImageProcessingMode");
    if (v3 >= 2)
    {
      if (v3 == 2)
        v4 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Reprocessing%@"), CFSTR("CameraCaptureStillImageMetadataVersion"));
      else
        v4 = 0;
    }
    else
    {
      v4 = CFSTR("CameraCaptureStillImageMetadataVersion");
    }
    return objc_msgSend(a2, "setObject:forKeyedSubscript:", &unk_1E49F97E0, v4);
  }
  return result;
}

@end
