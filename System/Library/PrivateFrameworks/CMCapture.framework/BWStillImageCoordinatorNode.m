@implementation BWStillImageCoordinatorNode

+ ($07919FF52A1CF34B835B8E07CC3CE49A)worstCaseMaxBracketedCaptureBufferCountForPreparedSettings:(SEL)a3 stillImageCaptureSettings:(id)a4 captureDevice:(id)a5
{
  _BOOL8 v10;
  _BOOL8 v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t i;
  $07919FF52A1CF34B835B8E07CC3CE49A *v21;
  void *v22;
  unint64_t v23;
  int v24;
  int v25;
  unint64_t v26;
  id v27;
  int v28;
  int v29;
  id v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  $07919FF52A1CF34B835B8E07CC3CE49A *result;
  int v37;
  int v38;
  id v39;
  id obj;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v10 = objc_msgSend(a4, "HDRMode") != 0;
    v11 = objc_msgSend(a4, "digitalFlashMode") != 0;
    v12 = objc_msgSend(a4, "qualityPrioritization");
  }
  else
  {
    v12 = 2;
    v11 = 1;
    v10 = 1;
  }
  v13 = objc_msgSend(a6, "maxStillImageCaptureBufferCountForHDRMode:digitalFlashMode:qualityPrioritization:clientBracketCount:bravoConstituentImageDeliveryDeviceTypes:", v10, v11, v12, objc_msgSend(a4, "bracketedImageCount"), objc_msgSend(a4, "bravoConstituentImageDeliveryDeviceTypes"));
  *(_QWORD *)&retstr->var0 = 0;
  *(_QWORD *)&retstr->var2 = 0;
  retstr->var4 = 0;
  v39 = a5;
  if (!a5)
  {
    if ((objc_msgSend(a6, "softISPEnabled") & 1) != 0)
    {
      HIDWORD(v42) = 0;
      retstr->var0 = v13;
      retstr->var1 = v13;
      v18 = v13;
      v17 = v13;
      v28 = v13;
      retstr->var3 = v13;
LABEL_25:
      v27 = a2;
      goto LABEL_31;
    }
LABEL_26:
    v18 = 0;
    v27 = a2;
    goto LABEL_28;
  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = (id)objc_msgSend(a5, "captureStreamSettings");
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (!v14)
  {
    if ((objc_msgSend(a6, "softISPEnabled") & 1) != 0)
    {
      objc_msgSend(a6, "sensorRawStillImageOutputsEnabled");
      v18 = 0;
      v17 = 0;
      HIDWORD(v42) = 0;
      v28 = 0;
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  v15 = v14;
  v38 = v13;
  v16 = a6;
  v17 = 0;
  v42 = 0;
  v18 = 0;
  v19 = *(_QWORD *)v44;
  do
  {
    for (i = 0; i != v15; ++i)
    {
      v21 = retstr;
      if (*(_QWORD *)v44 != v19)
        objc_enumerationMutation(obj);
      v22 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
      v23 = objc_msgSend(v22, "expectedFrameCaptureCounts");
      v25 = v24;
      v26 = HIDWORD(v23);
      v18 += v23;
      v21->var0 = v18;
      if (objc_msgSend(v16, "isPortTypeUsingZoomBasedSourceSensorRaws:", objc_msgSend(v22, "portType")))
      {
        HIDWORD(v42) += v26;
        v21->var2 = HIDWORD(v42);
      }
      else
      {
        LODWORD(v42) = v42 + v26;
        v21->var1 = v42;
      }
      retstr = v21;
      v17 += v25;
      v21->var3 = v17;
    }
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  }
  while (v15);
  a6 = v16;
  v27 = a2;
  if ((objc_msgSend(v16, "softISPEnabled") & 1) != 0)
  {
    if ((objc_msgSend(v16, "sensorRawStillImageOutputsEnabled") & 1) != 0)
    {
      v28 = v42;
      if (v18)
      {
        if (v18 <= 2)
          v18 = 2;
        retstr->var0 = v18;
      }
    }
    else
    {
      v28 = v42;
    }
    goto LABEL_31;
  }
  v13 = v38;
LABEL_28:
  v17 = 0;
  HIDWORD(v42) = 0;
  v28 = 0;
  if (v13 > v18)
    v18 = v13;
  retstr->var0 = v18;
  retstr->var1 = 0;
  *(_QWORD *)&retstr->var2 = 0;
LABEL_31:
  if ((int)objc_msgSend(v27, "maxShotBufferCapacity") >= 1)
  {
    v29 = objc_msgSend(v27, "currentAllocatedShotBufferCapacity");
    v30 = a6;
    if (v29 >= (int)objc_msgSend(v27, "maxShotBufferCapacity"))
      v31 = objc_msgSend(v27, "maxShotBufferCapacity");
    else
      v31 = objc_msgSend(v27, "currentAllocatedShotBufferCapacity");
    v32 = v31;
    v33 = objc_msgSend(v27, "numberOfZoomBasedBufferIncludedInShotBuffer");
    v34 = objc_msgSend(v27, "numberOfUltraHighResBufferIncludedInShotBuffer");
    objc_opt_self();
    v35 = sUltraHighResFrameCountExpansionFactor * v34;
    if (objc_msgSend(v30, "softISPEnabled"))
    {
      if (v39)
      {
        if (objc_msgSend(v30, "sensorRawStillImageOutputsEnabled"))
        {
          if (v28 > 0 || SHIDWORD(v42) > 0 || v17 >= 1)
          {
            v28 = v32 - v33 - v35;
            retstr->var1 = v28;
            retstr->var2 = v33;
            retstr->var3 = v34;
          }
          if (v18 >= 1)
          {
            if (v32 - v35 <= 2)
              v18 = 2;
            else
              v18 = v32 - v35;
            retstr->var0 = v18;
          }
        }
      }
      else
      {
        v28 = v32 - v35;
        retstr->var0 = v32 - v35;
        retstr->var1 = v32 - v35;
        *(_QWORD *)&retstr->var2 = 0;
        v18 = v32 - v35;
      }
    }
    else
    {
      v28 = 0;
      if (v32 - v35 <= 2)
        v18 = 2;
      else
        v18 = v32 - v35;
      retstr->var0 = v18;
      retstr->var1 = 0;
      *(_QWORD *)&retstr->var2 = 0;
    }
    a6 = v30;
  }
  result = ($07919FF52A1CF34B835B8E07CC3CE49A *)objc_msgSend(a6, "pearlInfraredCaptureStream");
  if (result)
  {
    if (v18 <= v28)
      v37 = v28;
    else
      v37 = v18;
    retstr->var4 = v37;
  }
  return result;
}

+ (int)maxShotBufferCapacity
{
  return sMaxShotBufferCapacity;
}

+ (int)currentAllocatedShotBufferCapacity
{
  return sCurrentAllocatedShotBufferCapacity;
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs", a3), "objectAtIndexedSubscript:", objc_msgSend(a4, "index")), "setFormat:", objc_msgSend(a4, "format"));
}

- (id)_initWithCaptureDevice:(id)a3 inputPortTypes:(id)a4 sensorRawInputPortTypes:(id)a5 highResStillImageDimensions:(id)a6 allStateTransitionsHandler:(id)a7
{
  BWStillImageCoordinatorNode *v11;
  BWFigVideoCaptureDevice *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  BWNodeInput *v25;
  BWVideoFormatRequirements *v26;
  const char *v27;
  BWNodeOutput *v28;
  BWVideoFormatRequirements *v29;
  const char *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  BWNodeInput *v35;
  BWVideoFormatRequirements *v36;
  const char *v37;
  BWNodeOutput *v38;
  BWVideoFormatRequirements *v39;
  const char *v40;
  id v42;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  objc_super v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v63.receiver = self;
  v63.super_class = (Class)BWStillImageCoordinatorNode;
  v11 = -[BWNode init](&v63, sel_init);
  if (v11)
  {
    v42 = a7;
    v12 = (BWFigVideoCaptureDevice *)a3;
    v11->_captureDevice = v12;
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v13 = -[BWFigVideoCaptureDevice captureStreams](v12, "captureStreams");
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v60 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * i), "setStillImageCaptureDelegate:", v11);
        }
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
      }
      while (v15);
    }
    -[BWNode setSupportsConcurrentLiveInputCallbacks:](v11, "setSupportsConcurrentLiveInputCallbacks:", 0);
    v11->_highResStillImageDimensions = (NSArray *)a6;
    v47 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v48 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v18 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
    if (v18)
    {
      v19 = v18;
      v20 = 0;
      v21 = *(_QWORD *)v56;
      do
      {
        v22 = 0;
        v49 = v20;
        v23 = v20;
        do
        {
          if (*(_QWORD *)v56 != v21)
            objc_enumerationMutation(a4);
          v24 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v22);
          v25 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1986618469, v11, v23 + v22);
          v26 = objc_alloc_init(BWVideoFormatRequirements);
          -[BWNodeInput setFormatRequirements:](v25, "setFormatRequirements:", v26);

          -[BWNodeInput setPassthroughMode:](v25, "setPassthroughMode:", 1);
          -[BWNodeInput setRetainedBufferCount:](v25, "setRetainedBufferCount:", 0);
          -[BWNode addInput:](v11, "addInput:", v25);
          objc_msgSend(v47, "setObject:forKeyedSubscript:", v25, v24);
          -[BWNodeInput setName:](v25, "setName:", BWPortTypeToDisplayString(v24, v27));
          v28 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v11);
          v29 = objc_alloc_init(BWVideoFormatRequirements);
          -[BWNodeOutput setFormatRequirements:](v28, "setFormatRequirements:", v29);

          -[BWNodeOutput setPassthroughMode:](v28, "setPassthroughMode:", 1);
          -[BWNodeOutput setIndexOfInputWhichDrivesThisOutput:](v28, "setIndexOfInputWhichDrivesThisOutput:", -[BWNodeInput index](v25, "index"));
          objc_msgSend(v48, "setObject:forKeyedSubscript:", v28, v24);
          -[BWNodeOutput setName:](v28, "setName:", BWPortTypeToDisplayString(v24, v30));
          -[BWNode addOutput:](v11, "addOutput:", v28);

          ++v22;
        }
        while (v19 != v22);
        v19 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
        v20 = v23 + v22;
      }
      while (v19);
      v31 = v22 + v49;
    }
    else
    {
      v31 = 0;
    }
    v45 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v46 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v50 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
    if (v50)
    {
      v44 = *(_QWORD *)v52;
      do
      {
        v32 = 0;
        v33 = v31;
        do
        {
          if (*(_QWORD *)v52 != v44)
            objc_enumerationMutation(a5);
          v34 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v32);
          v35 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1986618469, v11, v33 + v32);
          v36 = objc_alloc_init(BWVideoFormatRequirements);
          -[BWNodeInput setFormatRequirements:](v35, "setFormatRequirements:", v36);

          -[BWNodeInput setPassthroughMode:](v35, "setPassthroughMode:", 1);
          -[BWNodeInput setRetainedBufferCount:](v35, "setRetainedBufferCount:", 0);
          -[BWNode addInput:](v11, "addInput:", v35);
          objc_msgSend(v45, "setObject:forKeyedSubscript:", v35, v34);
          -[BWNodeInput setName:](v35, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), BWPortTypeToDisplayString(v34, v37), CFSTR("SensorRaw"), v42));
          v38 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v11);
          v39 = objc_alloc_init(BWVideoFormatRequirements);
          -[BWNodeOutput setFormatRequirements:](v38, "setFormatRequirements:", v39);

          -[BWNodeOutput setPassthroughMode:](v38, "setPassthroughMode:", 1);
          -[BWNodeOutput setIndexOfInputWhichDrivesThisOutput:](v38, "setIndexOfInputWhichDrivesThisOutput:", -[BWNodeInput index](v35, "index"));
          objc_msgSend(v46, "setObject:forKeyedSubscript:", v38, v34);
          -[BWNodeInput setName:](v35, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), BWPortTypeToDisplayString(v34, v40), CFSTR("SensorRaw")));
          -[BWNode addOutput:](v11, "addOutput:", v38);

          ++v32;
        }
        while (v50 != v32);
        v31 = v33 + v32;
        v50 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
      }
      while (v50);
    }
    v11->_requestQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11->_requestQueueLock._os_unfair_lock_opaque = 0;
    v11->_portTypeToInput = (NSDictionary *)objc_msgSend(v47, "copy");
    v11->_portTypeToOutput = (NSDictionary *)objc_msgSend(v48, "copy");
    v11->_portTypeToSensorRawInput = (NSDictionary *)objc_msgSend(v45, "copy");
    v11->_portTypeToSensorRawOutput = (NSDictionary *)objc_msgSend(v46, "copy");
    v11->_stillImageDispatchQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
    v11->_stillImageDispatchGroup = (OS_dispatch_group *)dispatch_group_create();
    v11->_stillImageGraphStopDispatchGroup = (OS_dispatch_group *)dispatch_group_create();
    v11->_receivedImagesOrErrorsForRequestByPortType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11->_receivedUltraHighResImagesOrErrorsForRequestByPortType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[BWStillImageCoordinatorNode _setupStateMachineWithAllStateTransitionsHandler:]((uint64_t)v11, (uint64_t)v42);
    v11->_maxNumberOfBurstCapturesAllowedInFlight = 2;
    v11->_bufferTrackingLock._os_unfair_lock_opaque = 0;
  }
  return v11;
}

- (id)nodeType
{
  return CFSTR("Coordinator");
}

- (uint64_t)_setupStateMachineWithAllStateTransitionsHandler:(uint64_t)result
{
  uint64_t v3;
  FigStateMachine *v4;

  if (result)
  {
    v3 = result;
    v4 = -[FigStateMachine initWithLabel:stateCount:initialState:owner:]([FigStateMachine alloc], "initWithLabel:stateCount:initialState:owner:", CFSTR("BWStillImageCoordinator state machine"), 17, 1, result);
    -[FigStateMachine setPerformsAtomicStateTransitions:](v4, "setPerformsAtomicStateTransitions:", 0);
    -[FigStateMachine setLabel:forState:](v4, "setLabel:forState:", CFSTR("Idle"), 1);
    -[FigStateMachine setLabel:forState:](v4, "setLabel:forState:", CFSTR("InitiatedIdle"), 2);
    -[FigStateMachine setLabel:forState:](v4, "setLabel:forState:", CFSTR("Ready"), 4);
    -[FigStateMachine setLabel:forState:](v4, "setLabel:forState:", CFSTR("InitiatedReady"), 8);
    -[FigStateMachine setLabel:forState:](v4, "setLabel:forState:", CFSTR("Preparing"), 16);
    -[FigStateMachine setLabel:forState:](v4, "setLabel:forState:", CFSTR("InitiatedPreparing"), 32);
    -[FigStateMachine setLabel:forState:](v4, "setLabel:forState:", CFSTR("Initiating"), 64);
    -[FigStateMachine setLabel:forState:](v4, "setLabel:forState:", CFSTR("Resolving"), 128);
    -[FigStateMachine setLabel:forState:](v4, "setLabel:forState:", CFSTR("InitiatedResolving"), 256);
    -[FigStateMachine setLabel:forState:](v4, "setLabel:forState:", CFSTR("Capturing"), 512);
    -[FigStateMachine setLabel:forState:](v4, "setLabel:forState:", CFSTR("Flushing"), 1024);
    -[FigStateMachine setLabel:forState:](v4, "setLabel:forState:", CFSTR("BeginningMoment"), 2048);
    -[FigStateMachine setLabel:forState:](v4, "setLabel:forState:", CFSTR("PostponingMoment"), 4096);
    -[FigStateMachine setLabel:forState:](v4, "setLabel:forState:", CFSTR("CapturingUncommitedMoment"), 0x2000);
    -[FigStateMachine setLabel:forState:](v4, "setLabel:forState:", CFSTR("CapturingCommittedMoment"), 0x4000);
    -[FigStateMachine setLabel:forState:](v4, "setLabel:forState:", CFSTR("CancellingMomentWaitingForBuffers"), 0x8000);
    -[FigStateMachine setLabel:forState:](v4, "setLabel:forState:", CFSTR("CancellingMoment"), 0x10000);
    if (a2)
      -[FigStateMachine whenTransitioningToStates:callHandler:](v4, "whenTransitioningToStates:callHandler:", 0xFFFFFFFFLL, a2);
    -[FigStateMachine whenTransitioningToStates:callHandler:](v4, "whenTransitioningToStates:callHandler:", 3, &__block_literal_global_48);
    -[FigStateMachine whenTransitioningToStates:callHandler:](v4, "whenTransitioningToStates:callHandler:", 12, &__block_literal_global_114);
    -[FigStateMachine whenTransitioningToStates:callHandler:](v4, "whenTransitioningToStates:callHandler:", 48, &__block_literal_global_115_0);
    -[FigStateMachine whenTransitioningToState:callHandler:](v4, "whenTransitioningToState:callHandler:", 64, &__block_literal_global_116);
    -[FigStateMachine whenTransitioningToStates:callHandler:](v4, "whenTransitioningToStates:callHandler:", 384, &__block_literal_global_117_0);
    -[FigStateMachine whenTransitioningToState:callHandler:](v4, "whenTransitioningToState:callHandler:", 512, &__block_literal_global_118);
    -[FigStateMachine whenTransitioningToState:callHandler:](v4, "whenTransitioningToState:callHandler:", 1024, &__block_literal_global_119);
    -[FigStateMachine whenTransitioningToState:callHandler:](v4, "whenTransitioningToState:callHandler:", 2048, &__block_literal_global_120);
    -[FigStateMachine whenTransitioningToState:callHandler:](v4, "whenTransitioningToState:callHandler:", 4096, &__block_literal_global_121);
    -[FigStateMachine whenTransitioningToState:callHandler:](v4, "whenTransitioningToState:callHandler:", 0x2000, &__block_literal_global_122);
    -[FigStateMachine whenTransitioningToState:callHandler:](v4, "whenTransitioningToState:callHandler:", 0x4000, &__block_literal_global_123);
    -[FigStateMachine whenTransitioningToState:callHandler:](v4, "whenTransitioningToState:callHandler:", 0x8000, &__block_literal_global_124);
    result = -[FigStateMachine whenTransitioningToState:callHandler:](v4, "whenTransitioningToState:callHandler:", 0x10000, &__block_literal_global_125);
    *(_QWORD *)(v3 + 232) = v4;
  }
  return result;
}

- (uint64_t)_updateResponsiveShutterEnabled
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;

  if (result)
  {
    v1 = result;
    if (!*(_BYTE *)(result + 392) || *(_DWORD *)(result + 168) != 2)
    {
      *(_BYTE *)(result + 420) = 0;
      *(_BYTE *)(result + 452) = 0;
      result = objc_msgSend((id)objc_opt_class(), "setMaxShotBufferCapacity:", 0);
      *(_BYTE *)(v1 + 480) = 0;
      v4 = 388;
      v5 = 1;
LABEL_14:
      *(_DWORD *)(v1 + v4) = v5;
      return result;
    }
    if ((int)llroundf((float)((float)((unint64_t)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "physicalMemory") >> 20)+ 537.0)* 0.00097656) <= 5)v2 = 11;
    else
      v2 = 18;
    if (objc_msgSend(*(id *)(v1 + 104), "softISPEnabled"))
    {
      if (objc_msgSend(*(id *)(v1 + 104), "sensorRawStillImageOutputsEnabled"))
      {
        if (objc_msgSend(*(id *)(v1 + 104), "depthDataDeliveryEnabled"))
          v2 = 27;
        else
          v2 = 20;
        v3 = 4;
      }
      else
      {
        v2 = 11;
        v3 = 1;
      }
      *(_DWORD *)(v1 + 388) = v3;
    }
    *(_BYTE *)(v1 + 420) = 1;
    if (*(_BYTE *)(v1 + 420))
    {
      *(_DWORD *)(v1 + 424) = 0;
      *(_DWORD *)(v1 + 432) = 0;
      *(_DWORD *)(v1 + 436) = 0;
      v6 = *(_DWORD *)(v1 + 388);
      objc_opt_class();
      objc_opt_self();
      sUltraHighResFrameCountExpansionFactor = v6;
      objc_msgSend((id)objc_opt_class(), "setCurrentAllocatedShotBufferCapacity:", 0);
      objc_msgSend((id)objc_opt_class(), "setMaxShotBufferCapacity:", v2);
      *(_DWORD *)(v1 + 428) = v2;
      objc_msgSend((id)objc_opt_class(), "setNumberOfZoomBasedBufferIncludedInShotBuffer:", 0);
      result = objc_msgSend((id)objc_opt_class(), "setNumberOfUltraHighResBufferIncludedInShotBuffer:", 0);
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "setMaxShotBufferCapacity:", 0);
      *(_DWORD *)(v1 + 388) = 1;
      v7 = *(_DWORD *)(v1 + 388);
      objc_opt_class();
      result = objc_opt_self();
      sUltraHighResFrameCountExpansionFactor = v7;
    }
    *(_BYTE *)(v1 + 452) = 1;
    if (*(_BYTE *)(v1 + 452))
      *(_DWORD *)(v1 + 456) = 1082130432;
    *(_BYTE *)(v1 + 480) = *(_BYTE *)(v1 + 394);
    if (*(_BYTE *)(v1 + 480))
    {
      *(_DWORD *)(v1 + 484) = 2;
      if (*(_BYTE *)(v1 + 480))
      {
        *(_DWORD *)(v1 + 488) = 1040187392;
        v4 = 492;
        v5 = 1051931443;
        goto LABEL_14;
      }
    }
  }
  return result;
}

+ (void)setMaxShotBufferCapacity:(int)a3
{
  sMaxShotBufferCapacity = a3;
}

+ (void)setCurrentAllocatedShotBufferCapacity:(int)a3
{
  sCurrentAllocatedShotBufferCapacity = a3;
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  NSObject *stillImageDispatchQueue;
  uint64_t v14;
  uint64_t v15;
  _QWORD block[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  os_log_type_t type;
  int v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (-[BWNode allInputsHaveReachedState:](self, "allInputsHaveReachedState:", 1, a4))
  {
    if (dword_1ECFE9910)
    {
      v22 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = -[BWNode outputs](self, "outputs", v14, v15);
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "makeConfiguredFormatLive");
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      }
      while (v10);
    }
    stillImageDispatchQueue = self->_stillImageDispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__BWStillImageCoordinatorNode_configurationWithID_updatedFormat_didBecomeLiveForInput___block_invoke;
    block[3] = &unk_1E491E720;
    block[4] = self;
    dispatch_sync(stillImageDispatchQueue, block);
  }
  else if (dword_1ECFE9910)
  {
    v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_stillImageCapturePipeliningMode == 2 && !self->_responsiveShutterEnabledViaAPI)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = -[BWNode inputs](self, "inputs");
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v8, "resolvedAttachedMediaKeys"), "count"))
          {
            v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attached media isn't supported when the pipeline mode is %@, resolvedAttachedMediaKeys %@ for input %@"), BWPhotoEncoderStringFromEncodingScheme(self->_stillImageCapturePipeliningMode), objc_msgSend(v8, "resolvedAttachedMediaKeys"), v8), 0);
            objc_exception_throw(v9);
          }
        }
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v5);
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)BWStillImageCoordinatorNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v10, sel_prepareForCurrentConfigurationToBecomeLive);
}

- (int)stillImageCapturePipeliningMode
{
  return self->_stillImageCapturePipeliningMode;
}

- (BOOL)fastCapturePrioritizationEnabled
{
  return self->_fastCapturePrioritizationEnabled;
}

- (id)sensorRawOutputForPortType:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_portTypeToSensorRawOutput, "objectForKeyedSubscript:", a3);
}

- (id)sensorRawInputForPortType:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_portTypeToSensorRawInput, "objectForKeyedSubscript:", a3);
}

- (id)outputForPortType:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_portTypeToOutput, "objectForKeyedSubscript:", a3);
}

- (id)inputForPortType:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_portTypeToInput, "objectForKeyedSubscript:", a3);
}

- (void)setStillImageProcessingSupportProvider:(id)a3
{
  self->_stillImageProcessingSupportProvider = (BWStillImageProcessingSupportProvider *)a3;
}

- (void)setStillImageCaptureStatusDelegate:(id)a3
{
  self->_stillImageCaptureStatusDelegate = (BWStillImageCaptureStatusDelegate *)a3;
}

- (void)setStillImageCapturePipeliningMode:(int)a3
{
  self->_stillImageCapturePipeliningMode = a3;
  -[BWStillImageCoordinatorNode _updateResponsiveShutterEnabled]((uint64_t)self);
}

- (void)setResponsiveShutterEnabledViaAPI:(BOOL)a3
{
  self->_responsiveShutterEnabledViaAPI = a3;
}

- (void)setResponsiveShutterEnabled:(BOOL)a3
{
  self->_responsiveShutterEnabled = a3;
  -[BWStillImageCoordinatorNode _updateResponsiveShutterEnabled]((uint64_t)self);
}

- (void)setFastCapturePrioritizationEnabled:(BOOL)a3
{
  self->_fastCapturePrioritizationEnabled = a3;
  -[BWStillImageCoordinatorNode _updateResponsiveShutterEnabled]((uint64_t)self);
}

- (void)setCompressedShotBuffer:(id)a3
{
  BWCompressedShotBuffer *compressedShotBuffer;

  compressedShotBuffer = self->_compressedShotBuffer;
  if (compressedShotBuffer != a3)
  {

    self->_compressedShotBuffer = (BWCompressedShotBuffer *)a3;
    if (a3)
    {
      self->_extraUncompressedShotBufferCapacityForThermalSystemPressureLevelSerious = 1;
      self->_extraUncompressedShotBufferCapacityForThermalSystemPressureLevelCritical = 4;
    }
  }
}

- (void)setCinematicFramingWarpingRequired:(BOOL)a3
{
  self->_cinematicFramingWarpingRequired = a3;
}

- (BWStillImageCoordinatorNode)initWithCaptureDevice:(id)a3 inputPortTypes:(id)a4 sensorRawInputPortTypes:(id)a5 highResStillImageDimensions:(id)a6
{
  return (BWStillImageCoordinatorNode *)-[BWStillImageCoordinatorNode _initWithCaptureDevice:inputPortTypes:sensorRawInputPortTypes:highResStillImageDimensions:allStateTransitionsHandler:](self, "_initWithCaptureDevice:inputPortTypes:sensorRawInputPortTypes:highResStillImageDimensions:allStateTransitionsHandler:", a3, a4, a5, a6, 0);
}

void __87__BWStillImageCoordinatorNode_configurationWithID_updatedFormat_didBecomeLiveForInput___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[5];
  os_log_type_t type;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 96) = 1;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 192));
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "count");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 192));
  if (v2 >= 1)
  {
    if (dword_1ECFE9910)
    {
      v8 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(NSObject **)(v4 + 208);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__BWStillImageCoordinatorNode_configurationWithID_updatedFormat_didBecomeLiveForInput___block_invoke_46;
    block[3] = &unk_1E491E720;
    block[4] = v4;
    dispatch_async(v5, block);
  }
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
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *shotBufferWaitGroup;
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
  v3 = -[BWFigVideoCaptureDevice captureStreams](self->_captureDevice, "captureStreams");
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7++), "setStillImageCaptureDelegate:", 0);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  -[NSMutableArray count](self->_requestQueue, "count");
  shotBufferWaitGroup = self->_shotBufferWaitGroup;
  if (shotBufferWaitGroup)
  {
    dispatch_group_leave(shotBufferWaitGroup);

  }
  v9.receiver = self;
  v9.super_class = (Class)BWStillImageCoordinatorNode;
  -[BWNode dealloc](&v9, sel_dealloc);
}

- (id)nodeSubType
{
  return CFSTR("StillImageCoordinator");
}

uint64_t __87__BWStillImageCoordinatorNode_configurationWithID_updatedFormat_didBecomeLiveForInput___block_invoke_46(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "currentState");
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 232);
  if (v2 == 1)
  {
    v4 = 4;
  }
  else
  {
    result = objc_msgSend(v3, "currentState");
    if ((_DWORD)result != 2)
      return result;
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 232);
    v4 = 8;
  }
  return objc_msgSend(v3, "transitionToState:", v4);
}

- (void)didReachEndOfDataForInput:(id)a3
{
  _BOOL4 v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *stillImageDispatchQueue;
  uint64_t v7;
  NSObject *v8;
  unsigned int v9;
  unsigned int v10;
  NSObject *stillImageDispatchGroup;
  NSObject *v12;
  _QWORD v13[5];
  _QWORD block[5];
  os_log_type_t type;
  unsigned int v16;
  int v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = -[BWNode allInputsHaveReachedState:](self, "allInputsHaveReachedState:", 0);
  if (dword_1ECFE9910)
  {
    v16 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v4)
  {
    stillImageDispatchQueue = self->_stillImageDispatchQueue;
    v7 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__BWStillImageCoordinatorNode_didReachEndOfDataForInput___block_invoke;
    block[3] = &unk_1E491E720;
    block[4] = self;
    dispatch_async(stillImageDispatchQueue, block);
    if (dword_1ECFE9910)
    {
      v16 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v9 = v16;
      if (os_log_type_enabled(v8, type))
        v10 = v9;
      else
        v10 = v9 & 0xFFFFFFFE;
      if (v10)
      {
        v17 = 136315138;
        v18 = "-[BWStillImageCoordinatorNode didReachEndOfDataForInput:]";
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    stillImageDispatchGroup = self->_stillImageDispatchGroup;
    v12 = self->_stillImageDispatchQueue;
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __57__BWStillImageCoordinatorNode_didReachEndOfDataForInput___block_invoke_52;
    v13[3] = &unk_1E491E720;
    v13[4] = self;
    dispatch_group_notify(stillImageDispatchGroup, v12, v13);
  }
}

uint64_t __57__BWStillImageCoordinatorNode_didReachEndOfDataForInput___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v1 + 264))
  {
    v2 = result;
    result = objc_msgSend(*(id *)(v1 + 232), "currentState");
    if ((_DWORD)result != 1024)
      return objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 232), "transitionToState:", 1024);
  }
  return result;
}

uint64_t __57__BWStillImageCoordinatorNode_didReachEndOfDataForInput___block_invoke_52(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v8;
  uint64_t result;
  uint64_t v10;
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
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "captureStreams");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "setStillImageCaptureDelegate:", 0);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v4);
  }

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "stop");

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 504) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 400) = 0;
  if (dword_1ECFE9910)
  {
    v20 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "outputs", v13, v14, 0);
  result = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
  if (result)
  {
    v10 = result;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12++), "markEndOfLiveOutput");
      }
      while (v10 != v12);
      result = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
      v10 = result;
    }
    while (result);
  }
  return result;
}

- (int)initiateStillImageCaptureNowWithSettings:(id)a3
{
  char v6;

  if (a3)
  {
    objc_msgSend(a3, "stillImageUserInitiatedRequestPTS");
    if ((v6 & 1) != 0)
    {
      if (objc_msgSend(a3, "stillImageUserInitiatedRequestTime"))
        return -[BWStillImageCoordinatorNode _enqueueRequestWithSettings:serviceRequestsIfNecessary:](self, "_enqueueRequestWithSettings:serviceRequestsIfNecessary:", a3, 1);
    }
  }
  FigDebugAssert3();
  return -12780;
}

- (int)captureStillImageNowWithSettings:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE9910)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return -[BWStillImageCoordinatorNode _enqueueRequestWithSettings:serviceRequestsIfNecessary:](self, "_enqueueRequestWithSettings:serviceRequestsIfNecessary:", a3, 1, v7, v8);
}

- (int)prepareStillImageCaptureNowWithSettings:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE9910)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return -[BWStillImageCoordinatorNode _enqueueRequestWithSettings:serviceRequestsIfNecessary:](self, "_enqueueRequestWithSettings:serviceRequestsIfNecessary:", a3, 1, v7, v8);
}

- (int)beginStillImageMomentCaptureWithSettings:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE9910)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if ((objc_msgSend(a3, "isBeginMomentCaptureSettings", v7, v8) & 1) != 0)
    return -[BWStillImageCoordinatorNode _enqueueRequestWithSettings:serviceRequestsIfNecessary:](self, "_enqueueRequestWithSettings:serviceRequestsIfNecessary:", a3, 1);
  FigDebugAssert3();
  return -12780;
}

- (int)cancelStillImageMomentCaptureWithSettingsID:(int64_t)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *stillImageDispatchQueue;
  int v7;
  uint64_t v9;
  uint64_t v10;
  _QWORD block[7];
  os_log_type_t type;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  if (dword_1ECFE9910)
  {
    v13 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[BWFigVideoCaptureDevice zeroShutterLagCancelWaitingForTimeMachinesForSettingsID:](self->_captureDevice, "zeroShutterLagCancelWaitingForTimeMachinesForSettingsID:", a3, v9, v10);
  os_unfair_lock_lock(&self->_requestQueueLock);
  self->_momentCaptureLastCancelledSettingsID = a3;
  os_unfair_lock_unlock(&self->_requestQueueLock);
  dispatch_group_enter((dispatch_group_t)self->_stillImageDispatchGroup);
  stillImageDispatchQueue = self->_stillImageDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__BWStillImageCoordinatorNode_cancelStillImageMomentCaptureWithSettingsID___block_invoke;
  block[3] = &unk_1E4921410;
  block[4] = self;
  block[5] = &v14;
  block[6] = a3;
  dispatch_sync(stillImageDispatchQueue, block);
  v7 = *((_DWORD *)v15 + 6);
  _Block_object_dispose(&v14, 8);
  return v7;
}

void __75__BWStillImageCoordinatorNode_cancelStillImageMomentCaptureWithSettingsID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  char v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD block[5];
  __int128 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1[4] + 264), "isBeginMomentCaptureSettings")
    && objc_msgSend(*(id *)(a1[4] + 264), "settingsID") == a1[6])
  {
    v2 = a1[4];
    v3 = *(NSObject **)(v2 + 216);
    v4 = *(NSObject **)(v2 + 208);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__BWStillImageCoordinatorNode_cancelStillImageMomentCaptureWithSettingsID___block_invoke_2;
    block[3] = &unk_1E491E720;
    block[4] = v2;
    dispatch_group_async(v3, v4, block);
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 192));
    if (objc_msgSend(*(id *)(a1[4] + 184), "count"))
    {
      v5 = 0;
      while (objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 184), "objectAtIndexedSubscript:", v5), "settingsID") != a1[6])
      {
        if (objc_msgSend(*(id *)(a1[4] + 184), "count") <= (unint64_t)++v5)
          goto LABEL_8;
      }
      objc_msgSend(*(id *)(a1[4] + 184), "removeObjectAtIndex:", v5);
      --*(_DWORD *)(a1[4] + 196);
      *(_DWORD *)(a1[4] + 196) &= ~(*(int *)(a1[4] + 196) >> 31);
      if (dword_1ECFE9910)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 192));
      v6 = 1;
    }
    else
    {
LABEL_8:
      os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 192));
      v6 = 0;
      *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = -12780;
    }
    v8 = a1[4];
    v9 = *(void **)(v8 + 152);
    v10 = a1[6];
    v14 = *MEMORY[0x1E0CA2E18];
    v15 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    objc_msgSend(v9, "stillImageCoordinator:didCancelMomentCaptureForSettingsID:streamingDisruptionEndPTS:", v8, v10, &v14, v11, v12);
    if ((v6 & 1) != 0)
      dispatch_group_leave(*(dispatch_group_t *)(a1[4] + 216));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1[4] + 216));
}

uint64_t __75__BWStillImageCoordinatorNode_cancelStillImageMomentCaptureWithSettingsID___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "currentState") == 0x2000)
    v2 = 0x8000;
  else
    v2 = 0x10000;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "transitionToState:", v2);
}

- (int)commitStillImageMomentCaptureWithSettings:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int64_t v6;
  NSObject *stillImageDispatchQueue;
  int v8;
  _QWORD block[7];
  os_log_type_t type;
  int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  if (dword_1ECFE9910)
  {
    v12 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  os_unfair_lock_lock(&self->_requestQueueLock);
  v6 = objc_msgSend(a3, "settingsID");
  self->_momentCaptureLastComittedSettingsID = v6;
  if (self->_momentCaptureUnfiredWillBeginCaptureBeforeResolvingSettingsCallbackSettingsID == v6)
  {
    self->_momentCaptureUnfiredWillBeginCaptureBeforeResolvingSettingsCallbackSettingsID = 0;
    os_unfair_lock_unlock(&self->_requestQueueLock);
    if (v6 >= 1)
      -[BWStillImageCaptureStatusDelegate stillImageCoordinator:willBeginCaptureBeforeResolvingSettingsForID:](self->_stillImageCaptureStatusDelegate, "stillImageCoordinator:willBeginCaptureBeforeResolvingSettingsForID:", self, v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_requestQueueLock);
  }
  dispatch_group_enter((dispatch_group_t)self->_stillImageDispatchGroup);
  stillImageDispatchQueue = self->_stillImageDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__BWStillImageCoordinatorNode_commitStillImageMomentCaptureWithSettings___block_invoke;
  block[3] = &unk_1E491F368;
  block[4] = self;
  block[5] = a3;
  block[6] = &v13;
  dispatch_sync(stillImageDispatchQueue, block);
  v8 = *((_DWORD *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  return v8;
}

void __73__BWStillImageCoordinatorNode_commitStillImageMomentCaptureWithSettings___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  unsigned int v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  _QWORD *v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  _QWORD v30[5];
  _QWORD block[5];
  _QWORD v32[5];
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "isBeginMomentCaptureSettings")
    && (v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "settingsID"),
        v2 == objc_msgSend(*(id *)(a1 + 40), "settingsID")))
  {
    objc_msgSend(*(id *)(a1 + 40), "setStillImageUserInitiatedRequestTime:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "stillImageUserInitiatedRequestTime"));
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 264);
    if (v3)
    {
      objc_msgSend(v3, "stillImageUserInitiatedRequestPTS");
    }
    else
    {
      v35 = 0uLL;
      v36 = 0;
    }
    v7 = *(void **)(a1 + 40);
    v33 = v35;
    v34 = v36;
    objc_msgSend(v7, "setStillImageUserInitiatedRequestPTS:", &v33);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "stillImageCaptureAbsoluteStartTime");
    objc_msgSend(*(id *)(a1 + 40), "setStillImageCaptureAbsoluteStartTime:");
    objc_msgSend(*(id *)(a1 + 40), "setStillImageCaptureStartTime:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "stillImageCaptureStartTime"));
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "stillImageRequestTime") >= 1)
      objc_msgSend(*(id *)(a1 + 40), "setStillImageRequestTime:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "stillImageRequestTime"));
    objc_msgSend(*(id *)(a1 + 40), "setResolutionFlavor:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "resolutionFlavor"));
    objc_msgSend(*(id *)(a1 + 40), "setBypassUpscaling:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "bypassUpscaling"));
    v8 = objc_msgSend(*(id *)(a1 + 40), "outputWidth");
    v9 = objc_msgSend(*(id *)(a1 + 40), "outputHeight") * v8;
    v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "outputWidth");
    v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "outputHeight");
    v12 = *(_QWORD *)(a1 + 32);
    if (v9 >= v11 * v10)
    {
      objc_msgSend(*(id *)(a1 + 40), "setOutputWidth:", objc_msgSend(*(id *)(v12 + 264), "outputWidth"));
      objc_msgSend(*(id *)(a1 + 40), "setOutputHeight:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "outputHeight"));
      objc_msgSend(*(id *)(a1 + 40), "setDeferredPhotoProxyWidth:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "deferredPhotoProxyWidth"));
      objc_msgSend(*(id *)(a1 + 40), "setDeferredPhotoProxyHeight:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "deferredPhotoProxyHeight"));
      objc_msgSend(*(id *)(a1 + 40), "setDeferredPhotoFinalWidth:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "deferredPhotoFinalWidth"));
      objc_msgSend(*(id *)(a1 + 40), "setDeferredPhotoFinalHeight:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "deferredPhotoFinalHeight"));
      v14 = objc_msgSend(*(id *)(a1 + 40), "rawThumbnailWidth");
      if (v14 > objc_msgSend(*(id *)(a1 + 40), "outputWidth")
        || (v15 = objc_msgSend(*(id *)(a1 + 40), "rawThumbnailHeight"),
            v15 > objc_msgSend(*(id *)(a1 + 40), "outputHeight")))
      {
        objc_msgSend(*(id *)(a1 + 40), "setRawThumbnailWidth:", objc_msgSend(*(id *)(a1 + 40), "outputWidth"));
        objc_msgSend(*(id *)(a1 + 40), "setRawThumbnailHeight:", objc_msgSend(*(id *)(a1 + 40), "outputHeight"));
      }
    }
    else
    {
      v13 = *(void **)(v12 + 272);
      if (v13 && objc_msgSend(v13, "deliverDeferredPhotoProxyImage"))
      {
        objc_msgSend(*(id *)(a1 + 40), "setDeferredPhotoProxyWidth:", objc_msgSend(*(id *)(a1 + 40), "outputWidth"));
        objc_msgSend(*(id *)(a1 + 40), "setDeferredPhotoProxyHeight:", objc_msgSend(*(id *)(a1 + 40), "outputHeight"));
        objc_msgSend(*(id *)(a1 + 40), "setDeferredPhotoFinalWidth:", objc_msgSend(*(id *)(a1 + 40), "outputWidth"));
        objc_msgSend(*(id *)(a1 + 40), "setDeferredPhotoFinalHeight:", objc_msgSend(*(id *)(a1 + 40), "outputHeight"));
      }
    }
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 272)
      && objc_msgSend(*(id *)(a1 + 40), "depthDataDeliveryEnabled")
      && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "captureFlags") & 0x800) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "setDepthDataDeliveryEnabled:", 0);
    }

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264) = *(id *)(a1 + 40);
    v16 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v16 + 272))
    {

      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280) = 0;
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280) = -[BWStillImageCoordinatorNode _resolveProcessingSettings](*(BWStillImageProcessingSettings **)(a1 + 32));
      if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "photoManifest"), "photoDescriptors"), "count"))
      {
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -12780;
        v25 = *(_QWORD *)(a1 + 32);
        v21 = *(NSObject **)(v25 + 216);
        v22 = *(NSObject **)(v25 + 208);
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __73__BWStillImageCoordinatorNode_commitStillImageMomentCaptureWithSettings___block_invoke_2;
        v32[3] = &unk_1E491E720;
        v32[4] = v25;
        v23 = v32;
        goto LABEL_36;
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 256) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "expectedClientImageCount");
      v16 = *(_QWORD *)(a1 + 32);
    }
    if (objc_msgSend(*(id *)(v16 + 232), "currentState") != 128)
    {
      v17 = *(_QWORD *)(a1 + 32);
      v18 = *(NSObject **)(v17 + 216);
      v19 = *(NSObject **)(v17 + 208);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __73__BWStillImageCoordinatorNode_commitStillImageMomentCaptureWithSettings___block_invoke_3;
      block[3] = &unk_1E491E720;
      block[4] = v17;
      dispatch_group_async(v18, v19, block);
    }
    v20 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v20 + 420))
    {
      v21 = *(NSObject **)(v20 + 216);
      v22 = *(NSObject **)(v20 + 208);
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __73__BWStillImageCoordinatorNode_commitStillImageMomentCaptureWithSettings___block_invoke_4;
      v30[3] = &unk_1E491E720;
      v30[4] = v20;
      v23 = v30;
LABEL_36:
      dispatch_group_async(v21, v22, v23);
    }
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 192));
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "count"))
    {
      v4 = 0;
      while (1)
      {
        v5 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "objectAtIndexedSubscript:", v4);
        v6 = objc_msgSend(v5, "settingsID");
        if (v6 == objc_msgSend(*(id *)(a1 + 40), "settingsID"))
          break;
        if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "count") <= (unint64_t)++v4)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 40), "setStillImageUserInitiatedRequestTime:", objc_msgSend(v5, "stillImageUserInitiatedRequestTime"));
      if (v5)
      {
        objc_msgSend(v5, "stillImageUserInitiatedRequestPTS");
      }
      else
      {
        v28 = 0uLL;
        v29 = 0;
      }
      v24 = *(void **)(a1 + 40);
      v26 = v28;
      v27 = v29;
      objc_msgSend(v24, "setStillImageUserInitiatedRequestPTS:", &v26);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "replaceObjectAtIndex:withObject:", v4, *(_QWORD *)(a1 + 40));
      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 192));
    }
    else
    {
LABEL_9:
      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 192));
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -12780;
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 216));
}

- (BWStillImageProcessingSettings)_resolveProcessingSettings
{
  id *p_isa;
  BWPhotoManifest *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  BWPhotoManifest *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    p_isa = (id *)&result->super.isa;
    v2 = -[BWStillImageCoordinatorNode _resolvePhotoManifest]((BWPhotoManifest *)result);
    if (objc_msgSend(p_isa[33], "autoIntelligentDistortionCorrectionEnabled")
      && p_isa[20]
      && (v12 = 0u,
          v13 = 0u,
          v10 = 0u,
          v11 = 0u,
          v3 = (void *)objc_msgSend(p_isa[34], "captureStreamSettings"),
          (v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16)) != 0))
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      v9 = v2;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          if ((objc_msgSend(p_isa[20], "idcSupportedForCaptureType:captureFlags:portType:", objc_msgSend(p_isa[34], "captureType"), objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "captureFlags"), objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "portType")) & 1) != 0)
          {
            v8 = 1;
            v2 = v9;
            return -[BWStillImageProcessingSettings initWithPhotoManifest:processIntelligentDistortionCorrection:]([BWStillImageProcessingSettings alloc], "initWithPhotoManifest:processIntelligentDistortionCorrection:", v2, v8);
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        v8 = 0;
        v2 = v9;
        if (v5)
          continue;
        break;
      }
    }
    else
    {
      v8 = 0;
    }
    return -[BWStillImageProcessingSettings initWithPhotoManifest:processIntelligentDistortionCorrection:]([BWStillImageProcessingSettings alloc], "initWithPhotoManifest:processIntelligentDistortionCorrection:", v2, v8);
  }
  return result;
}

uint64_t __73__BWStillImageCoordinatorNode_commitStillImageMomentCaptureWithSettings___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "currentState") == 0x2000)
    v2 = 0x8000;
  else
    v2 = 0x10000;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "transitionToState:", v2);
}

uint64_t __73__BWStillImageCoordinatorNode_commitStillImageMomentCaptureWithSettings___block_invoke_3(uint64_t a1)
{
  uint64_t v2;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "currentState") == 4096)
    v2 = 512;
  else
    v2 = 0x4000;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "transitionToState:", v2);
}

void __73__BWStillImageCoordinatorNode_commitStillImageMomentCaptureWithSettings___block_invoke_4(uint64_t a1)
{
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "currentState") == 0x4000)
    -[BWStillImageCoordinatorNode _attemptToCompleteRequest](*(_QWORD *)(a1 + 32));
}

- (void)_attemptToCompleteRequest
{
  uint64_t v1;
  void *v3;
  int v4;
  int v5;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  NSObject *v15;
  int v16;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _DWORD *v18;
  int v19;
  _BOOL4 v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[5];
  os_log_type_t v31;
  int v32;
  os_log_type_t type[8];
  uint64_t v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      v28 = v1;
      LODWORD(v26) = 0;
      FigDebugAssert3();
    }
    if (*(_QWORD *)(a1 + 272)
      && (objc_msgSend(*(id *)(a1 + 264), "isBeginMomentCaptureSettings") & 1) == 0
      && !*(_BYTE *)(a1 + 292))
    {
      v3 = *(void **)(a1 + 272);
      v4 = objc_msgSend(*(id *)(a1 + 264), "isOutputFormatCompressed");
      v5 = objc_msgSend(v3, "captureType");
      if (v4 && v5 != 11)
      {
        v7 = -[BWStillImageCoordinatorNode _expectedFrameCountForCurrentRequest](a1);
        if (v7 <= (int)-[BWStillImageCoordinatorNode _receivedFrameOrErrorCountForCurrentRequest](a1))
        {
          if (*(_BYTE *)(a1 + 420))
          {
            v8 = -[BWStillImageCoordinatorNode _expectedFrameCountForNextRequest](a1);
            v9 = v8;
            if (v8 >= (int)objc_msgSend((id)objc_opt_class(), "maxShotBufferCapacity"))
              v9 = objc_msgSend((id)objc_opt_class(), "maxShotBufferCapacity");
            os_unfair_lock_lock((os_unfair_lock_t)(a1 + 372));
            v10 = objc_msgSend((id)objc_opt_class(), "maxShotBufferCapacity");
            v11 = *(_DWORD *)(a1 + 376);
            if (v10 <= v11)
            {
              v13 = 0;
            }
            else
            {
              v12 = objc_msgSend((id)objc_opt_class(), "maxShotBufferCapacity");
              v11 = *(_DWORD *)(a1 + 376);
              v13 = v12 - v11;
            }
            v16 = *(_DWORD *)(a1 + 424);
            os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 372));
            if (v13 < v9)
            {
              if (dword_1ECFE9910)
              {
                LODWORD(v34) = 0;
                type[0] = OS_LOG_TYPE_DEFAULT;
                os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              if (*MEMORY[0x1E0CA1FC0] == 1)
                kdebug_trace();
              return;
            }
            v18 = (_DWORD *)MEMORY[0x1E0CA1FC0];
            if (*MEMORY[0x1E0CA1FC0] == 1)
              kdebug_trace();
            if (*(_QWORD *)(a1 + 400))
            {
              v20 = (objc_msgSend(*(id *)(a1 + 272), "captureFlags") & 2) == 0;
              if ((objc_msgSend(*(id *)(a1 + 400), "passthroughEnabled", v26, v28) & v20) != 0)
              {
                v19 = (v16 - v11) & ~((v16 - v11) >> 31);
                v21 = (v8 - v19) & ~((v8 - v19) >> 31);
              }
              else
              {
                v21 = 0;
              }
              v22 = objc_msgSend(*(id *)(a1 + 400), "hasUncompressedEquivalentFreeBufferCount:", v21);
              v23 = objc_msgSend(*(id *)(a1 + 400), "freeBufferCountIncreasedHandler");
              if (!v22)
              {
                if (!v23)
                {
                  v35 = 0;
                  *(_QWORD *)type = 0;
                  v34 = 0;
                  objc_msgSend(*(id *)(a1 + 400), "getInUseCompressedBufferCount:inUseCompressedBytes:maxInUseCompressedBytes:forUncompressedEquivalentFreeBufferCount:", &v35, &v34, type, v21);
                  if (dword_1ECFE9910)
                  {
                    v32 = 0;
                    v31 = OS_LOG_TYPE_DEFAULT;
                    v25 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                    os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
                    fig_log_call_emit_and_clean_up_after_send_and_compose();
                  }
                  if (*v18 == 1)
                    kdebug_trace();
                  v30[0] = MEMORY[0x1E0C809B0];
                  v30[1] = 3221225472;
                  v30[2] = __56__BWStillImageCoordinatorNode__attemptToCompleteRequest__block_invoke;
                  v30[3] = &unk_1E491E720;
                  v30[4] = a1;
                  objc_msgSend(*(id *)(a1 + 400), "setFreeBufferCountIncreasedHandler:", v30, v27, v29);
                }
                return;
              }
              if (v23)
              {
                objc_msgSend(*(id *)(a1 + 400), "setFreeBufferCountIncreasedHandler:", 0);
                v35 = 0;
                *(_QWORD *)type = 0;
                v34 = 0;
                objc_msgSend(*(id *)(a1 + 400), "getInUseCompressedBufferCount:inUseCompressedBytes:maxInUseCompressedBytes:forUncompressedEquivalentFreeBufferCount:", &v35, &v34, type, v21);
                if (*v18 == 1)
                  kdebug_trace();
                if (dword_1ECFE9910)
                {
                  v24 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
                  fig_log_call_emit_and_clean_up_after_send_and_compose();
                }
              }
            }
            -[BWStillImageCoordinatorNode _waitToMakePaceWithReferenceTime:](a1);
            -[BWStillImageCoordinatorNode _completeRequestWithStatus:](a1, 0);
            return;
          }
          os_unfair_lock_lock((os_unfair_lock_t)(a1 + 372));
          v14 = *(_DWORD *)(a1 + 376);
          os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 372));
          if (v14 <= 0)
          {
            -[BWStillImageCoordinatorNode _waitToMakePaceWithReferenceTime:](a1);
            -[BWStillImageCoordinatorNode _completeRequestWithStatus:](a1, 0);
          }
          else if (dword_1ECFE9910)
          {
            v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
        }
      }
    }
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  int v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v9;
  CVImageBufferRef ImageBuffer;
  int *v11;
  NSObject *stillImageDispatchQueue;
  _QWORD block[9];
  int v14;
  _QWORD v15[5];
  int v16;
  os_log_type_t type;
  int v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!CMGetAttachment(a3, CFSTR("BWStillImageCaptureSettings"), 0))
    return;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 1;
  v7 = -[BWFigVideoCaptureDevice sensorRawHighResolutionFlavorForDimensions:](self->_captureDevice, "sensorRawHighResolutionFlavorForDimensions:", BWPixelBufferDimensionsFromSampleBuffer(a3));
  if (dword_1ECFE9910)
  {
    v18 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v9 = MEMORY[0x1E0C809B0];
  if (self->_stillImageCapturePipeliningMode == 2)
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(a3);
    if (ImageBuffer)
    {
      os_unfair_lock_lock(&self->_bufferTrackingLock);
      if (v7 == 2)
      {
        self->_inUseBufferCount += self->_ultraHighResFrameCountExpansionFactor;
        v11 = &OBJC_IVAR___BWStillImageCoordinatorNode__inUseUltraHighResBufferCount;
      }
      else
      {
        ++self->_inUseBufferCount;
        if (v7 != 1)
        {
LABEL_11:
          if (*MEMORY[0x1E0CA1FC0] == 1)
          {
            objc_msgSend((id)objc_opt_class(), "maxShotBufferCapacity");
            kdebug_trace();
          }
          os_unfair_lock_unlock(&self->_bufferTrackingLock);
          v15[0] = v9;
          v15[1] = 3221225472;
          v15[2] = __59__BWStillImageCoordinatorNode_renderSampleBuffer_forInput___block_invoke;
          v15[3] = &unk_1E4920568;
          v15[4] = +[FigWeakReference weakReferenceToObject:](FigWeakReference, "weakReferenceToObject:", self);
          v16 = v7;
          +[BWIOSurfaceTracking trackPixelBuffer:surfaceUseCountIsZeroHandler:](BWIOSurfaceTracking, "trackPixelBuffer:surfaceUseCountIsZeroHandler:", ImageBuffer, v15);
          goto LABEL_14;
        }
        v11 = &OBJC_IVAR___BWStillImageCoordinatorNode__inUseZoomBasedBufferCount;
      }
      ++*(_DWORD *)((char *)&self->super.super.isa + *v11);
      goto LABEL_11;
    }
  }
LABEL_14:
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  dispatch_group_enter((dispatch_group_t)self->_stillImageDispatchGroup);
  stillImageDispatchQueue = self->_stillImageDispatchQueue;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __59__BWStillImageCoordinatorNode_renderSampleBuffer_forInput___block_invoke_2;
  block[3] = &unk_1E4921460;
  v14 = v7;
  block[5] = a4;
  block[6] = &v23;
  block[7] = &v19;
  block[8] = a3;
  block[4] = self;
  dispatch_sync(stillImageDispatchQueue, block);
  if (*((_BYTE *)v20 + 24))
    -[BWStillImageCoordinatorNode _renderSampleBuffer:forInput:attemptToCompleteRequest:]((uint64_t)self, a3, a4, *((unsigned __int8 *)v24 + 24));
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v19, 8);
}

void __59__BWStillImageCoordinatorNode_renderSampleBuffer_forInput___block_invoke(uint64_t a1)
{
  -[BWStillImageCoordinatorNode _stoppedUsingBufferWithSensorRawHighResolutionFlavor:](objc_msgSend(*(id *)(a1 + 32), "referencedObject"), *(_DWORD *)(a1 + 40));
}

- (void)_stoppedUsingBufferWithSensorRawHighResolutionFlavor:(uint64_t)a1
{
  _DWORD *v4;
  int v5;
  int v6;
  NSObject *v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v9;
  _QWORD block[5];
  os_log_type_t type;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 372));
    if (a2 == 2)
    {
      --*(_DWORD *)(a1 + 384);
      *(_DWORD *)(a1 + 376) -= *(_DWORD *)(a1 + 388);
    }
    else
    {
      --*(_DWORD *)(a1 + 376);
      if (a2 == 1)
        --*(_DWORD *)(a1 + 380);
    }
    v4 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    if (*MEMORY[0x1E0CA1FC0] == 1)
    {
      kdebug_trace();
      if (*v4 == 1)
      {
        objc_msgSend((id)objc_opt_class(), "maxShotBufferCapacity");
        kdebug_trace();
      }
    }
    if (*(_BYTE *)(a1 + 420))
    {
      if (*(_QWORD *)(a1 + 440))
      {
        if ((int)objc_msgSend((id)objc_opt_class(), "maxShotBufferCapacity") <= *(_DWORD *)(a1 + 376))
          v5 = 0;
        else
          v5 = objc_msgSend((id)objc_opt_class(), "maxShotBufferCapacity") - *(_DWORD *)(a1 + 376);
        if (v5 >= *(_DWORD *)(a1 + 448))
        {
          if (dword_1ECFE9910)
          {
            v12 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          dispatch_group_leave(*(dispatch_group_t *)(a1 + 440));

          *(_QWORD *)(a1 + 440) = 0;
        }
        else if (dword_1ECFE9910)
        {
          v12 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 372));
    }
    else
    {
      v6 = *(_DWORD *)(a1 + 376);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 372));
      if (v6)
        return;
    }
    v9 = *(NSObject **)(a1 + 208);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__BWStillImageCoordinatorNode__stoppedUsingBufferWithSensorRawHighResolutionFlavor___block_invoke;
    block[3] = &unk_1E491E720;
    block[4] = a1;
    dispatch_async(v9, block);
  }
}

void __59__BWStillImageCoordinatorNode_renderSampleBuffer_forInput___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  int v9;
  BOOL v10;
  BOOL v11;
  uint64_t v12;
  char v13;
  void *v14;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  const void *v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD block[4];
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  os_log_type_t type;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend((id)CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 64), (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
  v3 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "objectForKeyedSubscript:", v2), "intValue");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v3 + 1)), v2);
  if (*(_DWORD *)(a1 + 72) == 2)
  {
    v4 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "objectForKeyedSubscript:", v2), "intValue");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v4 + 1)), v2);
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(v5 + 304);
  v7 = -[BWStillImageCoordinatorNode _capturedAllFrames](v5);
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    v9 = *(_DWORD *)(v8 + 256);
    v10 = v9 < 1 || *(_DWORD *)(v8 + 260) >= v9;
  }
  else
  {
    v10 = 0;
  }
  if (*(_BYTE *)(v8 + 420))
  {
    if (v6)
      v11 = 0;
    else
      v11 = v7;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v11;
  }
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = v7 && v10;
  if (*(_BYTE *)(v12 + 24))
    v13 = 1;
  *(_BYTE *)(v12 + 24) = v13;
  if (!v6)
  {
    v16 = *(_QWORD *)(a1 + 32);
    v17 = 292;
    goto LABEL_20;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  v14 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 40), "index"));
  if (dword_1ECFE9910)
  {
    v33 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(v14, "addObject:", *(_QWORD *)(a1 + 64), v26, v27);
  -[BWStillImageCoordinatorNode _cancelMomentCaptureIfNeeded](*(_QWORD *)(a1 + 32));
  v16 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v16 + 292))
  {
    v17 = 293;
LABEL_20:
    if (*(_BYTE *)(v16 + v17))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      if (dword_1ECFE9910)
      {
        v33 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v19 = *(const void **)(a1 + 64);
      if (v19)
      {
        CFRetain(v19);
        v20 = *(_QWORD *)(a1 + 64);
      }
      else
      {
        v20 = 0;
      }
      v21 = *(_OWORD *)(a1 + 32);
      v22 = *(_QWORD *)(a1 + 32);
      v23 = *(NSObject **)(v22 + 216);
      v24 = *(_QWORD *)(a1 + 48);
      v25 = *(NSObject **)(v22 + 208);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __59__BWStillImageCoordinatorNode_renderSampleBuffer_forInput___block_invoke_67;
      block[3] = &unk_1E4921438;
      v30 = v24;
      v31 = v20;
      v29 = v21;
      dispatch_group_async(v23, v25, block);
      v16 = *(_QWORD *)(a1 + 32);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(v16 + 216));
}

- (BOOL)_capturedAllFrames
{
  uint64_t v1;
  int v2;

  if (result)
  {
    v1 = result;
    v2 = -[BWStillImageCoordinatorNode _expectedFrameCountForCurrentRequest](result);
    return v2 <= (int)-[BWStillImageCoordinatorNode _receivedFrameOrErrorCountForCurrentRequest](v1);
  }
  return result;
}

- (uint64_t)_cancelMomentCaptureIfNeeded
{
  uint64_t v1;
  uint64_t v2;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  opaqueCMSampleBuffer *v13;
  uint64_t v14;
  uint64_t v15;
  id obj;
  CMTime time2;
  CMTime time1;
  CMTime v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      v15 = v1;
      LODWORD(v14) = 0;
      FigDebugAssert3();
    }
    result = objc_msgSend(*(id *)(v2 + 232), "currentState", v14, v15);
    if ((_DWORD)result == 0x8000)
    {
      value = *MEMORY[0x1E0CA2E18];
      flags = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 12);
      timescale = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
      epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      obj = (id)objc_msgSend(*(id *)(v2 + 272), "captureStreamSettings");
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v21;
LABEL_7:
        v8 = 0;
        while (1)
        {
          if (*(_QWORD *)v21 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v8);
          v10 = (void *)objc_msgSend(*(id *)(v2 + 112), "objectForKeyedSubscript:", objc_msgSend(v9, "portType"));
          v11 = objc_msgSend(*(id *)(v2 + 128), "objectForKeyedSubscript:", objc_msgSend(v9, "portType"));
          if (((v11 != 0) & (objc_msgSend(v9, "captureFlags") >> 2)) != 0)
            v10 = (void *)v11;
          v12 = objc_msgSend((id)objc_msgSend(*(id *)(v2 + 304), "objectAtIndexedSubscript:", objc_msgSend(v10, "index")), "count");
          result = objc_msgSend(v9, "expectedFrameCaptureCount");
          if (v12 < (int)result)
            break;
          v13 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(v2 + 304), "objectAtIndexedSubscript:", objc_msgSend(v10, "index")), "lastObject");
          if (v13)
          {
            memset(&v19, 0, sizeof(v19));
            CMSampleBufferGetPresentationTimeStamp(&v19, v13);
            if ((flags & 1) == 0
              || (time1.value = value,
                  time1.timescale = timescale,
                  time1.flags = flags,
                  time1.epoch = epoch,
                  time2 = v19,
                  CMTimeCompare(&time1, &time2) < 0))
            {
              value = v19.value;
              flags = v19.flags;
              timescale = v19.timescale;
              epoch = v19.epoch;
            }
          }
          if (v6 == ++v8)
          {
            v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
            if (v6)
              goto LABEL_7;
            goto LABEL_19;
          }
        }
      }
      else
      {
LABEL_19:
        *(_QWORD *)(v2 + 344) = value;
        *(_DWORD *)(v2 + 352) = timescale;
        *(_DWORD *)(v2 + 356) = flags;
        *(_QWORD *)(v2 + 360) = epoch;
        return objc_msgSend(*(id *)(v2 + 232), "transitionToState:", 0x10000);
      }
    }
  }
  return result;
}

void __59__BWStillImageCoordinatorNode_renderSampleBuffer_forInput___block_invoke_67(uint64_t a1)
{
  _BOOL4 v2;
  const void *v3;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 292) = 0;
    v2 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) != 0;
  }
  else
  {
    v2 = 0;
  }
  -[BWStillImageCoordinatorNode _renderSampleBuffer:forInput:attemptToCompleteRequest:](*(_QWORD *)(a1 + 32), *(CMAttachmentBearerRef *)(a1 + 56), *(void **)(a1 + 40), v2);
  v3 = *(const void **)(a1 + 56);
  if (v3)
    CFRelease(v3);
}

- (void)_renderSampleBuffer:(void *)a3 forInput:(int)a4 attemptToCompleteRequest:
{
  uint64_t v6;
  void *v7;
  NSObject *v8;
  BWStillImageSettings *v11;
  NSObject *v12;
  NSObject *v13;
  float v14;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];
  _QWORD block[7];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (*(_BYTE *)(a1 + 368))
    {
      v6 = objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
      v7 = (void *)objc_msgSend(*(id *)(a1 + 272), "captureStreamSettingsForPortType:", v6);
      v20 = 0;
      v21 = &v20;
      v22 = 0x2020000000;
      v23 = 0;
      v8 = *(NSObject **)(a1 + 208);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __85__BWStillImageCoordinatorNode__renderSampleBuffer_forInput_attemptToCompleteRequest___block_invoke;
      block[3] = &unk_1E4921488;
      block[5] = v6;
      block[6] = &v20;
      block[4] = a1;
      dispatch_sync(v8, block);
      LODWORD(v6) = *((_DWORD *)v21 + 6);
      if ((_DWORD)v6 == objc_msgSend(v7, "expectedFrameCaptureCount"))
        -[BWStillImageCoordinatorNode _flushStillImageRequestWithError:](a1, 0xFFFFBE5C);
      _Block_object_dispose(&v20, 8);
    }
    else
    {
      v11 = -[BWStillImageCoordinatorNode _currentStillImageSettings]((BWStillImageSettings *)a1);
      objc_msgSend((id)objc_msgSend((id)a1, "graph"), "clientExpectsCameraMountedInLandscapeOrientation");
      BWStillImageCoordinatorAddAttachmentsToSampleBuffer(target, v11);
      if (a4)
      {
        v12 = *(NSObject **)(a1 + 216);
        v13 = *(NSObject **)(a1 + 208);
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __85__BWStillImageCoordinatorNode__renderSampleBuffer_forInput_attemptToCompleteRequest___block_invoke_2;
        v18[3] = &unk_1E491E720;
        v18[4] = a1;
        dispatch_group_async(v12, v13, v18);
      }
      CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
      objc_msgSend(*(id *)(a1 + 264), "videoStabilizationOverscanCropMultiplier");
      FigCaptureMetadataUtilitiesRefineFinalCropRects(v14);
      if (dword_1ECFE9910)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1, "outputs", v16, v17), "objectAtIndexedSubscript:", objc_msgSend(a3, "index")), "emitSampleBuffer:", target);
    }
  }
}

uint64_t __85__BWStillImageCoordinatorNode__renderSampleBuffer_forInput_attemptToCompleteRequest___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 240), "objectForKeyedSubscript:", a1[5]), "intValue");
  *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)_flushStillImageRequestWithError:(uint64_t)a1
{
  uint64_t v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t i;
  void *v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id obj;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  os_log_type_t type;
  int v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (dword_1ECFE9910)
    {
      v23 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (!_FigIsCurrentDispatchQueue())
    {
      v13 = v2;
      LODWORD(v12) = 0;
      FigDebugAssert3();
    }
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    obj = (id)objc_msgSend(*(id *)(a1 + 272), "captureStreamSettings", v12, v13);
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v17)
    {
      v16 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(obj);
          v6 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          v7 = objc_msgSend(v6, "portType");
          v8 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 240), "objectForKeyedSubscript:", v7), "intValue");
          v9 = objc_msgSend(v6, "expectedFrameCaptureCount");
          if (objc_msgSend(v6, "adaptiveBracketingParameters"))
            v9 = objc_msgSend(v6, "currentExpectedAdaptiveBracketedFrameCaptureCount");
          v10 = v9 - v8;
          if (!v10)
          {
            if (*(_DWORD *)(a1 + 260) == *(_DWORD *)(a1 + 256))
              continue;
            v10 = objc_msgSend(v6, "expectedFrameCaptureCount");
          }
          if (v10 >= 1)
          {
            v11 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", a2, a1, -[BWStillImageCoordinatorNode _currentStillImageSettings]((BWStillImageSettings *)a1), 0);
            do
            {
              if (objc_msgSend(v6, "isYUVCapture"))
                objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1, "outputs"), "objectAtIndexedSubscript:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 112), "objectForKeyedSubscript:", v7), "index")), "emitNodeError:", v11);
              if (objc_msgSend(v6, "isSensorRawCapture"))
                objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1, "outputs"), "objectAtIndexedSubscript:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 128), "objectForKeyedSubscript:", v7), "index")), "emitNodeError:", v11);
              --v10;
            }
            while (v10);

          }
        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      }
      while (v17);
    }
    -[BWStillImageCoordinatorNode _didCaptureStillImage](a1);
    -[BWStillImageCoordinatorNode _readyToRespondToRequest](a1);
    if (!*(_QWORD *)(a1 + 272))
      -[BWStillImageCoordinatorNode _completeRequestWithStatus:](a1, a2);
  }
}

- (BWStillImageSettings)_currentStillImageSettings
{
  if (result)
    return -[BWStillImageSettings initWithRequestedSettings:captureSettings:processingSettings:]([BWStillImageSettings alloc], "initWithRequestedSettings:captureSettings:processingSettings:", result[8]._requestedSettings, result[8]._captureSettings, result[8]._processingSettings);
  return result;
}

void __85__BWStillImageCoordinatorNode__renderSampleBuffer_forInput_attemptToCompleteRequest___block_invoke_2(uint64_t a1)
{
  -[BWStillImageCoordinatorNode _attemptToCompleteRequest](*(_QWORD *)(a1 + 32));
}

- (uint64_t)_ensureDeviceOrientationMonitor
{
  uint64_t v1;
  BWDeviceOrientationMonitor *v2;

  if (result)
  {
    v1 = result;
    if (!*(_QWORD *)(result + 504))
    {
      v2 = objc_alloc_init(BWDeviceOrientationMonitor);
      *(_QWORD *)(v1 + 504) = v2;
      return -[BWDeviceOrientationMonitor start](v2, "start");
    }
  }
  return result;
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  NSDictionary *portTypeToInput;
  uint64_t v8;
  id v9;
  int v10;
  NSObject *stillImageDispatchQueue;
  id v12;
  id v13;
  _QWORD block[8];
  int v15;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = __Block_byref_object_copy__18;
  v21 = __Block_byref_object_dispose__18;
  v22 = 0;
  if (self->_currentRequestedStillImageCaptureSettings)
  {
    portTypeToInput = self->_portTypeToInput;
    v8 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __56__BWStillImageCoordinatorNode_handleNodeError_forInput___block_invoke;
    v16[3] = &unk_1E49214B0;
    v16[4] = a4;
    v16[5] = &v17;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](portTypeToInput, "enumerateKeysAndObjectsUsingBlock:", v16);
    v9 = -[BWStillImageCaptureSettings captureStreamSettingsForPortType:](self->_currentResolvedStillImageCaptureSettings, "captureStreamSettingsForPortType:", v18[5]);
    v10 = objc_msgSend(v9, "expectedFrameCaptureCount");
    stillImageDispatchQueue = self->_stillImageDispatchQueue;
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __56__BWStillImageCoordinatorNode_handleNodeError_forInput___block_invoke_2;
    block[3] = &unk_1E49214D8;
    block[6] = &v17;
    block[7] = &v23;
    v15 = v10;
    block[4] = self;
    block[5] = v9;
    dispatch_sync(stillImageDispatchQueue, block);
    if (-[BWFigVideoCaptureDevice quadraHighResStillImageCaptureEnabled](self->_captureDevice, "quadraHighResStillImageCaptureEnabled"))
    {
      if (-[BWStillImageCaptureSettings captureType](self->_currentResolvedStillImageCaptureSettings, "captureType") != 8)
      {
        self->_receivedQuadraHighResError = 1;
        if (*((_DWORD *)v24 + 6) == v10)
          -[BWStillImageCoordinatorNode _flushStillImageRequestWithError:]((uint64_t)self, 0xFFFFBE5C);
      }
    }
    if (objc_msgSend((id)v18[5], "isEqualToString:", *MEMORY[0x1E0D05A40]))
    {
      v12 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(a4, "index"));
      v13 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", objc_msgSend(a3, "errorCode"), self, -[BWStillImageCoordinatorNode _currentStillImageSettings]((BWStillImageSettings *)self), objc_msgSend(a3, "metadata"));
      objc_msgSend(v12, "emitNodeError:", v13);

    }
  }
  else
  {
    FigDebugAssert3();
  }
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
}

uint64_t __56__BWStillImageCoordinatorNode_handleNodeError_forInput___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v8;
  uint64_t result;

  v8 = objc_msgSend(*(id *)(a1 + 32), "index");
  result = objc_msgSend(a3, "index");
  if (v8 == result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
    *a4 = 1;
  }
  return result;
}

uint64_t __56__BWStillImageCoordinatorNode_handleNodeError_forInput___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48)+ 8)+ 40)), "intValue")+ 1;
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == *(_DWORD *)(a1 + 64))
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 40), "expectedUltraHighResFrameCaptureCount")), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  return result;
}

- (void)clientReceivedPayloadForSettings:(id)a3 status:(int)a4 clientIsMidStillImageGraph:(BOOL)a5
{
  NSObject *stillImageDispatchQueue;
  _QWORD block[6];
  int v7;
  BOOL v8;

  stillImageDispatchQueue = self->_stillImageDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__BWStillImageCoordinatorNode_clientReceivedPayloadForSettings_status_clientIsMidStillImageGraph___block_invoke;
  block[3] = &unk_1E4921500;
  v8 = a5;
  block[4] = self;
  block[5] = a3;
  v7 = a4;
  dispatch_async(stillImageDispatchQueue, block);
}

void __98__BWStillImageCoordinatorNode_clientReceivedPayloadForSettings_status_clientIsMidStillImageGraph___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  BOOL v5;
  _BOOL4 v6;
  os_unfair_lock_s *v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  void *v15;
  int v16;
  int v17;

  if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 168) == 1)
  {
    if (!*(_BYTE *)(a1 + 52))
    {
      if (objc_msgSend(*(id *)(a1 + 40), "burstQualityCaptureEnabled"))
      {
        v2 = *(_QWORD *)(a1 + 32);
        v3 = *(_DWORD *)(v2 + 172);
        if (v3)
          *(_DWORD *)(v2 + 172) = v3 - 1;
      }
    }
  }
  else if (*(_BYTE *)(a1 + 52))
  {
    return;
  }
  v4 = objc_msgSend(*(id *)(a1 + 40), "settingsID");
  if (v4 == objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "settingsID"))
  {
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "captureType") && *(_BYTE *)(a1 + 52) == 0;
    v6 = v5;
    if (*(_BYTE *)(a1 + 52)
      && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "burstQualityCaptureEnabled")
      && (v7 = *(os_unfair_lock_s **)(a1 + 32), v7[43]._os_unfair_lock_opaque < v7[44]._os_unfair_lock_opaque)
      && (os_unfair_lock_lock(v7 + 48),
          v8 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "firstObject"),
          os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 192)),
          v8))
    {
      if ((objc_msgSend(v8, "burstQualityCaptureEnabled") & 1) == 0)
        return;
    }
    else if (!v6)
    {
      return;
    }
    v9 = objc_msgSend(*(id *)(a1 + 40), "outputFormat");
    v10 = objc_msgSend(*(id *)(a1 + 40), "isBeginMomentCaptureSettings");
    if (v9)
      v11 = 0;
    else
      v11 = v10;
    if (v9 || v11)
      ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 260);
    if (objc_msgSend(*(id *)(a1 + 40), "rawOutputFormat"))
      ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 260);
    if (-[BWStillImageCoordinatorNode _capturedAllFrames](*(_QWORD *)(a1 + 32)) || *(_DWORD *)(a1 + 48))
    {
      v12 = *(_QWORD *)(a1 + 32);
      if (v12)
      {
        v13 = *(_DWORD *)(v12 + 256);
        if (v13 < 1 || *(_DWORD *)(v12 + 260) >= v13)
        {
          v14 = *(_DWORD *)(a1 + 48);
          if (!v14)
          {
            if (*(_DWORD *)(v12 + 168) == 2)
            {
              v15 = *(void **)(v12 + 272);
              v16 = objc_msgSend(*(id *)(v12 + 264), "isOutputFormatCompressed");
              v17 = objc_msgSend(v15, "captureType");
              if (!v16 || v17 == 11)
                -[BWStillImageCoordinatorNode _completeRequestWithStatus:](*(_QWORD *)(a1 + 32), *(_DWORD *)(a1 + 48));
              return;
            }
            v14 = 0;
          }
          -[BWStillImageCoordinatorNode _completeRequestWithStatus:](v12, v14);
        }
      }
    }
  }
}

- (void)_completeRequestWithStatus:(uint64_t)a1
{
  uint64_t v4;
  BOOL v5;
  char v6;
  NSObject *v7;
  int *v8;
  int v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _QWORD block[5];
  char v16;
  os_log_type_t type;
  int v18;
  uint8_t buf[4];
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  if (!_FigIsCurrentDispatchQueue())
    FigDebugAssert3();
  v4 = *(_QWORD *)(a1 + 264);
  if (v4)
  {
    if (objc_msgSend(*(id *)(a1 + 264), "isUserInitiatedRequestSettings"))
    {
      v5 = a2 == 0;
    }
    else
    {
      if (!objc_msgSend(*(id *)(a1 + 264), "isClientInitiatedPrepareSettings"))
      {
        v6 = 0;
LABEL_14:
        if (!a2 && objc_msgSend(*(id *)(a1 + 272), "captureType") && *(int *)(a1 + 256) >= 1)
        {
          *(_QWORD *)(a1 + 472) = mach_absolute_time();
          FigHostTimeToNanoseconds();
          if (dword_1ECFE9910)
          {
            v18 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          *(_QWORD *)(a1 + 464) = 0;
        }
        if (dword_1ECFE9910)
        {
          v18 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        -[BWStillImageCoordinatorNode _readyToRespondToRequest](a1);
        goto LABEL_22;
      }
      v5 = objc_msgSend(*(id *)(a1 + 232), "currentState") == 32;
    }
    v6 = v5;
    goto LABEL_14;
  }
  v6 = 0;
LABEL_22:
  v8 = (int *)MEMORY[0x1E0CA1FC0];
  v9 = *MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
  {
    kdebug_trace();
    v9 = *v8;
  }
  if (v9)
  {
    v10 = fig_log_handle();
    if (os_signpost_enabled(v10))
    {
      v11 = objc_msgSend(*(id *)(a1 + 264), "settingsID");
      *(_DWORD *)buf = 67240192;
      v20 = v11;
      _os_signpost_emit_with_name_impl(&dword_1A2C80000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "StillCaptureRequest", " enableTelemetry=YES N1=%{public,signpost.telemetry:number1}d", buf, 8u);
    }
  }

  *(_QWORD *)(a1 + 264) = 0;
  *(_QWORD *)(a1 + 272) = 0;

  *(_QWORD *)(a1 + 280) = 0;
  objc_msgSend(*(id *)(a1 + 240), "removeAllObjects");
  objc_msgSend(*(id *)(a1 + 248), "removeAllObjects");
  *(_DWORD *)(a1 + 260) = 0;
  *(_DWORD *)(a1 + 256) = 0;
  *(_DWORD *)(a1 + 288) = 0;
  *(_BYTE *)(a1 + 368) = 0;
  *(_BYTE *)(a1 + 292) = 0;
  *(_BYTE *)(a1 + 293) = 0;

  *(_QWORD *)(a1 + 296) = 0;
  *(_QWORD *)(a1 + 304) = 0;
  *(_DWORD *)(a1 + 312) = 0;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
  *(_QWORD *)(a1 + 320) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  v12 = MEMORY[0x1E0CA2E18];
  *(_OWORD *)(a1 + 344) = *MEMORY[0x1E0CA2E18];
  *(_QWORD *)(a1 + 360) = *(_QWORD *)(v12 + 16);
  if (v4)
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 216));
  v13 = *(NSObject **)(a1 + 208);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__BWStillImageCoordinatorNode__completeRequestWithStatus___block_invoke;
  block[3] = &unk_1E491EE18;
  block[4] = a1;
  v16 = v6;
  dispatch_async(v13, block);
}

- (void)willStopGraph:(BOOL)a3
{
  NSObject *stillImageDispatchQueue;
  float v5;
  NSObject *stillImageGraphStopDispatchGroup;
  dispatch_time_t v7;
  _QWORD block[8];
  BOOL v9;
  _QWORD v10[4];
  _QWORD v11[3];
  int v12;
  uint64_t v13;
  float *v14;
  uint64_t v15;
  int v16;

  v13 = 0;
  v14 = (float *)&v13;
  v15 = 0x2020000000;
  v16 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v12 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  stillImageDispatchQueue = self->_stillImageDispatchQueue;
  v10[3] = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__BWStillImageCoordinatorNode_willStopGraph___block_invoke;
  block[3] = &unk_1E4921528;
  block[4] = self;
  block[5] = v11;
  v9 = a3;
  block[6] = v10;
  block[7] = &v13;
  dispatch_sync(stillImageDispatchQueue, block);
  v5 = v14[6];
  if (v5 > 0.0)
  {
    stillImageGraphStopDispatchGroup = self->_stillImageGraphStopDispatchGroup;
    v7 = dispatch_time(0, (uint64_t)(float)(v5 * 1000000000.0));
    dispatch_group_wait(stillImageGraphStopDispatchGroup, v7);
  }
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v13, 8);
}

uint64_t __45__BWStillImageCoordinatorNode_willStopGraph___block_invoke(uint64_t a1)
{
  uint64_t result;
  int v3;
  int v4;
  NSObject *v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 96) = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "captureType");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "settingsID");
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "currentState");
  if ((_DWORD)result == 1)
    return result;
  if (*(_BYTE *)(a1 + 64))
  {
LABEL_14:
    v3 = 0;
    goto LABEL_15;
  }
  v3 = 0;
  if ((int)result < 0x4000)
  {
    if ((_DWORD)result != 512 && (_DWORD)result != 0x2000)
      goto LABEL_15;
    goto LABEL_9;
  }
  if ((_DWORD)result == 0x8000 || (_DWORD)result == 0x4000)
  {
LABEL_9:
    v4 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    if (v4 != 2 && v4 != 11)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v8 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "captureStreamSettings");
      result = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (result)
      {
        v9 = result;
        v3 = 0;
        v10 = *(_QWORD *)v18;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v18 != v10)
              objc_enumerationMutation(v8);
            v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
            v13 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "objectForKeyedSubscript:", objc_msgSend(v12, "portType")), "intValue");
            v14 = objc_msgSend(v12, "expectedFrameCaptureCount") - v13;
            if (v14 > v3)
              v3 = v14;
            ++v11;
          }
          while (v9 != v11);
          result = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          v9 = result;
        }
        while (result);
        goto LABEL_15;
      }
    }
    goto LABEL_14;
  }
LABEL_15:
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (float)v3;
  if (*(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) <= 0.0)
  {
    if (dword_1ECFE9910)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "transitionToState:", 1024, v15, v16);
  }
  else if (dword_1ECFE9910)
  {
    v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

- (BOOL)responsiveShutterEnabled
{
  return self->_responsiveShutterEnabled;
}

- (id)compressedShotBuffer
{
  return self->_compressedShotBuffer;
}

- (void)setMaxNumberOfBurstCapturesAllowedInFlight:(unsigned int)a3
{
  self->_maxNumberOfBurstCapturesAllowedInFlight = a3;
}

- (unsigned)maxNumberOfBurstCapturesAllowedInFlight
{
  return self->_maxNumberOfBurstCapturesAllowedInFlight;
}

- (void)captureStreamWillWaitForTimeMachineToFill:(id)a3
{
  int64_t momentCaptureLastComittedSettingsID;

  if (!_FigIsCurrentDispatchQueue())
    FigDebugAssert3();
  if (self->_currentResolvedStillImageCaptureSettings)
  {
    os_unfair_lock_lock(&self->_requestQueueLock);
    if (-[FigCaptureStillImageSettings isBeginMomentCaptureSettings](self->_currentRequestedStillImageCaptureSettings, "isBeginMomentCaptureSettings")&& (momentCaptureLastComittedSettingsID = self->_momentCaptureLastComittedSettingsID, momentCaptureLastComittedSettingsID < -[FigCaptureStillImageSettings settingsID](self->_currentRequestedStillImageCaptureSettings, "settingsID")))
    {
      self->_momentCaptureUnfiredWillBeginCaptureBeforeResolvingSettingsCallbackSettingsID = -[FigCaptureStillImageSettings settingsID](self->_currentRequestedStillImageCaptureSettings, "settingsID");
      os_unfair_lock_unlock(&self->_requestQueueLock);
    }
    else
    {
      os_unfair_lock_unlock(&self->_requestQueueLock);
      -[BWStillImageCaptureStatusDelegate stillImageCoordinator:willBeginCaptureBeforeResolvingSettingsForID:](self->_stillImageCaptureStatusDelegate, "stillImageCoordinator:willBeginCaptureBeforeResolvingSettingsForID:", self, -[FigCaptureStillImageSettings settingsID](self->_currentRequestedStillImageCaptureSettings, "settingsID"));
    }
  }
}

- (void)captureStreamWillBeginStillImageCapture:(id)a3
{
  NSObject *stillImageDispatchGroup;
  NSObject *stillImageDispatchQueue;
  _QWORD block[5];

  stillImageDispatchGroup = self->_stillImageDispatchGroup;
  stillImageDispatchQueue = self->_stillImageDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__BWStillImageCoordinatorNode_captureStreamWillBeginStillImageCapture___block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_group_async(stillImageDispatchGroup, stillImageDispatchQueue, block);
}

void __71__BWStillImageCoordinatorNode_captureStreamWillBeginStillImageCapture___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 272))
    -[BWStillImageCoordinatorNode _fireDelegateCallbackWithFlag:](v1, 4);
}

- (void)_fireDelegateCallbackWithFlag:(uint64_t)a1
{
  BWStillImageCaptureDelegateCallbackInfo *v3;

  if (a1)
  {
    v3 = -[BWStillImageCaptureDelegateCallbackInfo initWithFlag:]([BWStillImageCaptureDelegateCallbackInfo alloc], "initWithFlag:", a2);
    -[BWStillImageCoordinatorNode _fireDelegateCallbackWithInfo:](a1, v3);

  }
}

- (void)captureStream:(id)a3 didCaptureReferenceFrameWithPTS:(id *)a4 referenceFrameBracketedCaptureSequenceNumber:(id)a5
{
  NSObject *stillImageDispatchGroup;
  NSObject *stillImageDispatchQueue;
  _QWORD block[6];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;

  stillImageDispatchGroup = self->_stillImageDispatchGroup;
  stillImageDispatchQueue = self->_stillImageDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __122__BWStillImageCoordinatorNode_captureStream_didCaptureReferenceFrameWithPTS_referenceFrameBracketedCaptureSequenceNumber___block_invoke;
  block[3] = &unk_1E4921110;
  v8 = *a4;
  block[4] = self;
  block[5] = a5;
  dispatch_group_async(stillImageDispatchGroup, stillImageDispatchQueue, block);
}

uint64_t __122__BWStillImageCoordinatorNode_captureStream_didCaptureReferenceFrameWithPTS_referenceFrameBracketedCaptureSequenceNumber___block_invoke(uint64_t a1)
{
  uint64_t result;
  __int128 v3;
  uint64_t v4;

  result = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(result + 272))
  {
    v3 = *(_OWORD *)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 64);
    -[BWStillImageCoordinatorNode _didResolveStillImagePTS:isPreBracketedEV0:](result, &v3, 0);
    return -[BWStillImageCoordinatorNode _didResolveReferenceFrameBracketedCaptureSequenceNumber:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  }
  return result;
}

- (void)_didResolveStillImagePTS:(uint64_t)a3 isPreBracketedEV0:
{
  uint64_t v6;
  BWStillImageCaptureDelegateCallbackInfo *v7;
  BWStillImageCaptureDelegateCallbackInfo *v8;
  __int128 v9;
  uint64_t v10;

  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
      FigDebugAssert3();
    if ((_DWORD)a3)
      v6 = 8;
    else
      v6 = 16;
    v7 = [BWStillImageCaptureDelegateCallbackInfo alloc];
    v9 = *a2;
    v10 = *((_QWORD *)a2 + 2);
    v8 = -[BWStillImageCaptureDelegateCallbackInfo initWithFlag:pts:isPreBracketFrame:](v7, "initWithFlag:pts:isPreBracketFrame:", v6, &v9, a3);
    -[BWStillImageCoordinatorNode _fireDelegateCallbackWithInfo:](a1, v8);

  }
}

- (uint64_t)_didResolveReferenceFrameBracketedCaptureSequenceNumber:(uint64_t)result
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    if (a2)
    {
      v3 = (void *)result;
      result = objc_msgSend(*(id *)(result + 272), "expectReferenceFrameBracketedCaptureSequenceNumber");
      if ((_DWORD)result)
      {
        v10 = 0u;
        v11 = 0u;
        v8 = 0u;
        v9 = 0u;
        v4 = (void *)objc_msgSend(v3, "outputs", 0);
        result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (result)
        {
          v5 = result;
          v6 = *(_QWORD *)v9;
          do
          {
            v7 = 0;
            do
            {
              if (*(_QWORD *)v9 != v6)
                objc_enumerationMutation(v4);
              objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "emitStillImageReferenceFrameBracketedCaptureSequenceNumberMessageWithSequenceNumber:", objc_msgSend(a2, "intValue"));
            }
            while (v5 != v7);
            result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
            v5 = result;
          }
          while (result);
        }
      }
    }
  }
  return result;
}

- (void)captureStream:(id)a3 didCapturePreBracketedEV0ImageWithPTS:(id *)a4
{
  NSObject *stillImageDispatchGroup;
  NSObject *stillImageDispatchQueue;
  _QWORD v6[5];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  stillImageDispatchGroup = self->_stillImageDispatchGroup;
  stillImageDispatchQueue = self->_stillImageDispatchQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__BWStillImageCoordinatorNode_captureStream_didCapturePreBracketedEV0ImageWithPTS___block_invoke;
  v6[3] = &unk_1E491EED0;
  v6[4] = self;
  v7 = *a4;
  dispatch_group_async(stillImageDispatchGroup, stillImageDispatchQueue, v6);
}

void __83__BWStillImageCoordinatorNode_captureStream_didCapturePreBracketedEV0ImageWithPTS___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 272))
  {
    v3 = *(_OWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 56);
    -[BWStillImageCoordinatorNode _didResolveStillImagePTS:isPreBracketedEV0:](v2, &v3, 1);
  }
}

- (void)captureStreamDidCompleteStillImageCapture:(id)a3
{
  NSObject *stillImageDispatchGroup;
  NSObject *stillImageDispatchQueue;
  _QWORD v5[6];

  stillImageDispatchGroup = self->_stillImageDispatchGroup;
  stillImageDispatchQueue = self->_stillImageDispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__BWStillImageCoordinatorNode_captureStreamDidCompleteStillImageCapture___block_invoke;
  v5[3] = &unk_1E491E748;
  v5[4] = self;
  v5[5] = a3;
  dispatch_group_async(stillImageDispatchGroup, stillImageDispatchQueue, v5);
}

void __73__BWStillImageCoordinatorNode_captureStreamDidCompleteStillImageCapture___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 272))
  {
    dispatch_group_leave(*(dispatch_group_t *)(v1 + 224));
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "portType"), "isEqualToString:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "masterPortType")))-[BWStillImageCoordinatorNode _didCaptureStillImage](*(_QWORD *)(a1 + 32));
  }
}

- (void)_didCaptureStillImage
{
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
      FigDebugAssert3();
    -[BWStillImageCoordinatorNode _fireDelegateCallbackWithFlag:](a1, 32);
  }
}

- (void)captureStream:(id)a3 stillImageCaptureError:(int)a4
{
  NSObject *stillImageDispatchGroup;
  NSObject *stillImageDispatchQueue;
  _QWORD v6[5];
  int v7;

  stillImageDispatchGroup = self->_stillImageDispatchGroup;
  stillImageDispatchQueue = self->_stillImageDispatchQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__BWStillImageCoordinatorNode_captureStream_stillImageCaptureError___block_invoke;
  v6[3] = &unk_1E4920568;
  v6[4] = self;
  v7 = a4;
  dispatch_group_async(stillImageDispatchGroup, stillImageDispatchQueue, v6);
}

void __68__BWStillImageCoordinatorNode_captureStream_stillImageCaptureError___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 272))
  {
    dispatch_group_leave(*(dispatch_group_t *)(v1 + 224));
    -[BWStillImageCoordinatorNode _fireDelegateCallbackWithFlag:](*(_QWORD *)(a1 + 32), 4);
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "currentState") == 0x2000)
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 312) = *(_DWORD *)(a1 + 40);
    else
      -[BWStillImageCoordinatorNode _flushStillImageRequestWithError:](*(_QWORD *)(a1 + 32), *(_DWORD *)(a1 + 40));
  }
}

- (void)node:(id)a3 didSelectNewReferenceFrameWithPTS:(id *)a4 transform:(id)a5 forSettings:(id)a6
{
  NSObject *stillImageDispatchGroup;
  NSObject *stillImageDispatchQueue;
  _QWORD v8[7];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;

  stillImageDispatchGroup = self->_stillImageDispatchGroup;
  stillImageDispatchQueue = self->_stillImageDispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __92__BWStillImageCoordinatorNode_node_didSelectNewReferenceFrameWithPTS_transform_forSettings___block_invoke;
  v8[3] = &unk_1E4921550;
  v9 = *a4;
  v8[4] = self;
  v8[5] = a5;
  v8[6] = a6;
  dispatch_group_async(stillImageDispatchGroup, stillImageDispatchQueue, v8);
}

uint64_t __92__BWStillImageCoordinatorNode_node_didSelectNewReferenceFrameWithPTS_transform_forSettings___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v5;
  uint64_t v6;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v5 = *(_OWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 72);
  return -[BWStillImageCoordinatorNode _didSelectNewReferenceFrameWithPTS:transform:forSettings:](v2, &v5, v1, v3);
}

- (uint64_t)_didSelectNewReferenceFrameWithPTS:(uint64_t)a3 transform:(uint64_t)a4 forSettings:
{
  uint64_t v4;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;

  if (result)
  {
    v8 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      v11 = v4;
      LODWORD(v10) = 0;
      FigDebugAssert3();
    }
    v9 = *(void **)(v8 + 152);
    v12 = *a2;
    v13 = *((_QWORD *)a2 + 2);
    return objc_msgSend(v9, "stillImageCoordinator:didSelectNewReferenceFrameWithPTS:transform:forSettings:", v8, &v12, a3, a4, v10, v11);
  }
  return result;
}

void __80__BWStillImageCoordinatorNode__setupStateMachineWithAllStateTransitionsHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  -[BWStillImageCoordinatorNode _serviceNextRequest](a2);
}

- (void)_serviceNextRequest
{
  uint64_t v1;
  int v3;
  void *v4;
  BOOL v5;
  unsigned int v6;
  int v7;
  int v8;
  int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (!a1)
    return;
  if (!_FigIsCurrentDispatchQueue())
  {
    v13 = v1;
    LODWORD(v12) = 0;
    FigDebugAssert3();
  }
  objc_msgSend((id)a1, "_unpackNextRequest", v12, v13);
  v3 = objc_msgSend(*(id *)(a1 + 232), "currentState");
  v4 = *(void **)(a1 + 264);
  if (v4)
  {
    if (objc_msgSend(v4, "isClientInitiatedPrepareSettings"))
    {
      v5 = v3 == 4;
      v6 = 32;
      v7 = 16;
      goto LABEL_15;
    }
    v8 = *(unsigned __int8 *)(a1 + 96);
    v9 = objc_msgSend(*(id *)(a1 + 264), "isUserInitiatedRequestSettings");
    if (!v8)
    {
      if (v9)
      {
        -[BWStillImageCoordinatorNode _completeRequestWithStatus:](a1, -16800);
        return;
      }
      objc_msgSend((id)a1, "_configureCurrentCaptureRequestStateForFigCaptureStillImageSettings");
      v6 = 1024;
      goto LABEL_17;
    }
    if (!v9)
    {
      v5 = v3 == 4;
      v6 = 256;
      v7 = 128;
LABEL_15:
      if (v5)
        v6 = v7;
      goto LABEL_17;
    }
    if (v3 != 8)
    {
      v6 = 64;
      goto LABEL_17;
    }
    objc_msgSend(*(id *)(a1 + 104), "cancelPrepareToCaptureStillImageNow");
    -[BWStillImageCoordinatorNode _completeRequestWithStatus:](a1, -12780);
  }
  else
  {
    FigDebugAssert3();
  }
  v6 = 0;
LABEL_17:
  if (v3 == 4)
    v10 = 1;
  else
    v10 = 2;
  if (*(_QWORD *)(a1 + 264))
    v11 = v6;
  else
    v11 = v10;
  objc_msgSend(*(id *)(a1 + 232), "transitionToState:", v11);
}

void __80__BWStillImageCoordinatorNode__setupStateMachineWithAllStateTransitionsHandler___block_invoke_3(uint64_t a1, BWStillImageSettings *a2)
{
  -[BWStillImageCoordinatorNode _beginPreparingCapture](a2);
}

- (void)_beginPreparingCapture
{
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
      FigDebugAssert3();
    -[BWStillImageProcessingSettings stillImageCoordinator:willPrepareStillImageCaptureWithSettings:clientInitiated:](a1[4]._processingSettings, "stillImageCoordinator:willPrepareStillImageCaptureWithSettings:clientInitiated:", a1, -[BWStillImageCoordinatorNode _currentStillImageSettings](a1), 1);
    -[BWStillImageCoordinatorNode _completeRequestWithStatus:]((uint64_t)a1, 0);
  }
}

uint64_t __80__BWStillImageCoordinatorNode__setupStateMachineWithAllStateTransitionsHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return -[BWStillImageCoordinatorNode _beginInitiatingCapture](a2);
}

- (uint64_t)_beginInitiatingCapture
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  if (result)
  {
    v2 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      v6 = v1;
      LODWORD(v5) = 0;
      FigDebugAssert3();
    }
    v10 = 0uLL;
    v11 = 0;
    v3 = *(void **)(v2 + 264);
    if (v3)
      objc_msgSend(v3, "stillImageUserInitiatedRequestPTS");
    v4 = *(void **)(v2 + 104);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __54__BWStillImageCoordinatorNode__beginInitiatingCapture__block_invoke;
    v7[3] = &unk_1E491EED0;
    v7[4] = v2;
    v8 = v10;
    v9 = v11;
    return objc_msgSend(v4, "prepareToCaptureStillImageNow:", v7, v5, v6);
  }
  return result;
}

uint64_t __80__BWStillImageCoordinatorNode__setupStateMachineWithAllStateTransitionsHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return -[BWStillImageCoordinatorNode _beginResolvingCapture](a2);
}

- (uint64_t)_beginResolvingCapture
{
  uint64_t v1;
  uint64_t v2;
  int *v3;
  int v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];
  uint8_t buf[16];

  if (result)
  {
    v2 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      v8 = v1;
      LODWORD(v7) = 0;
      FigDebugAssert3();
    }
    objc_msgSend(*(id *)(v2 + 264), "setStillImageCaptureStartTime:", mach_absolute_time());
    *(_QWORD *)(v2 + 464) = objc_msgSend(*(id *)(v2 + 264), "stillImageCaptureStartTime");
    v3 = (int *)MEMORY[0x1E0CA1FC0];
    v4 = *MEMORY[0x1E0CA1FC0];
    if (*MEMORY[0x1E0CA1FC0] == 1)
    {
      objc_msgSend(*(id *)(v2 + 264), "settingsID");
      kdebug_trace();
      v4 = *v3;
    }
    if (v4)
    {
      v5 = fig_log_handle();
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A2C80000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "StillCaptureRequest", (const char *)&unk_1A332D80B, buf, 2u);
      }
    }
    if (objc_msgSend(*(id *)(v2 + 232), "currentState", v7, v8) == 256)
    {
      objc_msgSend((id)v2, "_configureCurrentCaptureRequestStateForFigCaptureStillImageSettings");
      return objc_msgSend(*(id *)(v2 + 232), "transitionToState:", 512);
    }
    else
    {
      v6 = *(void **)(v2 + 104);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __53__BWStillImageCoordinatorNode__beginResolvingCapture__block_invoke;
      v9[3] = &unk_1E491E720;
      v9[4] = v2;
      return objc_msgSend(v6, "prepareToCaptureStillImageNow:", v9);
    }
  }
  return result;
}

void __80__BWStillImageCoordinatorNode__setupStateMachineWithAllStateTransitionsHandler___block_invoke_6(uint64_t a1, uint64_t a2)
{
  -[BWStillImageCoordinatorNode _beginCapture](a2);
}

- (void)_beginCapture
{
  uint64_t v1;
  int v3;
  int v4;
  unsigned int v5;
  _BOOL4 v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;

  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      v14 = v1;
      LODWORD(v13) = 0;
      FigDebugAssert3();
    }
    -[BWStillImageCoordinatorNode _fireDelegateCallbackWithFlag:](a1, 2);
    if ((*(_BYTE *)(a1 + 288) & 0x40) == 0)
    {
      objc_msgSend(*(id *)(a1 + 152), "stillImageCoordinator:willPrepareStillImageCaptureWithSettings:clientInitiated:", a1, -[BWStillImageCoordinatorNode _currentStillImageSettings]((BWStillImageSettings *)a1), 0);
      *(_DWORD *)(a1 + 288) |= 0x40u;
    }
    if (*(_BYTE *)(a1 + 420))
    {
      v3 = -[BWStillImageCoordinatorNode _expectedFrameCountForCurrentRequest](a1);
      -[BWStillImageCoordinatorNode _waitUntilShotBufferHasFreeBufferCount:timeout:](a1, v3, 3.0);
      if (*(_QWORD *)(a1 + 400))
      {
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 372));
        if ((int)objc_msgSend((id)objc_opt_class(), "maxShotBufferCapacity") <= *(_DWORD *)(a1 + 376))
          v4 = 0;
        else
          v4 = *(_DWORD *)(a1 + 376) - objc_msgSend((id)objc_opt_class(), "maxShotBufferCapacity");
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 372));
        v5 = -[BWStillImageCoordinatorNode _expectedFrameCountForCurrentRequest](a1) + v4;
        v6 = (objc_msgSend(*(id *)(a1 + 272), "captureFlags") & 2) == 0;
        if ((objc_msgSend(*(id *)(a1 + 400), "passthroughEnabled", v13, v14) & v6) != 0)
          v7 = 0;
        else
          v7 = v5;
        objc_msgSend(*(id *)(a1 + 400), "flushAndWaitForUncompressedEquivalentFreeBufferCount:", v7);
      }
    }
    v8 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 272), "portTypes", v13), "count");
    v9 = v8;
    if (v8 >= 1)
    {
      v10 = v8;
      do
      {
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 224));
        --v10;
      }
      while (v10);
    }
    v11 = objc_msgSend(*(id *)(a1 + 104), "captureStillImageNowWithSettings:captureSettings:", *(_QWORD *)(a1 + 264), *(_QWORD *)(a1 + 272));
    if (v11)
    {
      v12 = v11;
      FigDebugAssert3();
      if (v9 >= 1)
      {
        do
        {
          dispatch_group_leave(*(dispatch_group_t *)(a1 + 224));
          --v9;
        }
        while (v9);
      }
      -[BWStillImageCoordinatorNode _flushStillImageRequestWithError:](a1, v12);
    }
    else if (objc_msgSend(*(id *)(a1 + 232), "currentState") == 512
           || objc_msgSend(*(id *)(a1 + 232), "currentState") == 0x2000 && *(_BYTE *)(a1 + 293))
    {
      -[BWStillImageCoordinatorNode _setupProcessing](a1);
    }
  }
}

void __80__BWStillImageCoordinatorNode__setupStateMachineWithAllStateTransitionsHandler___block_invoke_7(uint64_t a1, uint64_t a2)
{
  -[BWStillImageCoordinatorNode _flushStillImageRequestWithError:](a2, 0xFFFFBE60);
}

uint64_t __80__BWStillImageCoordinatorNode__setupStateMachineWithAllStateTransitionsHandler___block_invoke_8(uint64_t a1, uint64_t a2)
{
  return -[BWStillImageCoordinatorNode _beginMomentCapture](a2);
}

- (uint64_t)_beginMomentCapture
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      v14 = v1;
      LODWORD(v12) = 0;
      FigDebugAssert3();
    }
    v3 = objc_msgSend(*(id *)(v2 + 272), "captureType", v12, v14);
    v4 = objc_msgSend(*(id *)(v2 + 272), "captureFlags");
    if (v3 == 1)
      v5 = (v4 & 0x100000000) == 0
        || objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v2 + 272), "captureStreamSettingsForPortType:", objc_msgSend(*(id *)(v2 + 272), "masterPortType")), "unifiedBracketedCaptureParams"), "count") != 0;
    else
      v5 = (v4 & 0x2000) == 0;
    os_unfair_lock_lock((os_unfair_lock_t)(v2 + 192));
    v6 = objc_msgSend(*(id *)(v2 + 264), "settingsID");
    v7 = *(_QWORD *)(v2 + 328);
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 192));
    if (v6 == v7 && dword_1ECFE9910 != 0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (v6 == v7 || v5)
      v11 = 4096;
    else
      v11 = 0x2000;
    return objc_msgSend(*(id *)(v2 + 232), "transitionToState:", v11, v13, v15);
  }
  return result;
}

void __80__BWStillImageCoordinatorNode__setupStateMachineWithAllStateTransitionsHandler___block_invoke_10(uint64_t a1, uint64_t a2)
{
  -[BWStillImageCoordinatorNode _beginUncommittedMomentCapture](a2);
}

- (void)_beginUncommittedMomentCapture
{
  uint64_t v1;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      v5 = v1;
      LODWORD(v4) = 0;
      FigDebugAssert3();
    }
    *(_BYTE *)(a1 + 292) = 1;
    *(_BYTE *)(a1 + 293) = objc_msgSend(*(id *)(a1 + 160), "processingOnBeginMomentSupportedForCaptureSettings:", *(_QWORD *)(a1 + 272), v4, v5);

    *(_QWORD *)(a1 + 296) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *(_QWORD *)(a1 + 304) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend((id)objc_msgSend((id)a1, "inputs"), "count"))
    {
      v3 = 0;
      do
        objc_msgSend(*(id *)(a1 + 304), "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E0C99DE8], "array"), v3++);
      while (objc_msgSend((id)objc_msgSend((id)a1, "inputs"), "count") > v3);
    }
    -[BWStillImageCoordinatorNode _beginCapture](a1);
  }
}

void __80__BWStillImageCoordinatorNode__setupStateMachineWithAllStateTransitionsHandler___block_invoke_11(uint64_t a1, uint64_t a2)
{
  -[BWStillImageCoordinatorNode _commitMomentCapture](a2);
}

- (void)_commitMomentCapture
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  unsigned int v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  const void *v13;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      v18 = v1;
      LODWORD(v16) = 0;
      FigDebugAssert3();
    }
    v3 = *(void **)(a1 + 296);
    *(_QWORD *)(a1 + 296) = 0;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16, v16, v18);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v22 != v6)
            objc_enumerationMutation(v3);
          -[BWStillImageCoordinatorNode _fireDelegateCallbackWithInfo:](a1, *(void **)(*((_QWORD *)&v21 + 1) + 8 * i));
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v5);
    }

    v8 = *(_DWORD *)(a1 + 312);
    if (v8)
    {
      -[BWStillImageCoordinatorNode _flushStillImageRequestWithError:](a1, v8);
    }
    else
    {
      -[BWStillImageCoordinatorNode _setupProcessing](a1);
      v9 = *(void **)(a1 + 304);
      *(_QWORD *)(a1 + 304) = 0;
      if (!*(_BYTE *)(a1 + 293) && objc_msgSend(v9, "count"))
      {
        v10 = 0;
        v20 = v9;
        do
        {
          v11 = (void *)objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
          if (objc_msgSend(v11, "count"))
          {
            v12 = 0;
            do
            {
              v13 = (const void *)objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
              if (dword_1ECFE9910)
              {
                os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              -[BWStillImageCoordinatorNode _renderSampleBuffer:forInput:attemptToCompleteRequest:](a1, v13, (void *)objc_msgSend((id)objc_msgSend((id)a1, "inputs", v17, v19), "objectAtIndexedSubscript:", v10), 0);
              ++v12;
            }
            while (objc_msgSend(v11, "count") > v12);
          }
          ++v10;
          v9 = v20;
        }
        while (objc_msgSend(v20, "count") > v10);
      }

      if (*(_BYTE *)(a1 + 420))
      {
        v15 = -[BWStillImageCoordinatorNode _expectedFrameCountForCurrentRequest](a1);
        if (v15 <= (int)-[BWStillImageCoordinatorNode _receivedFrameOrErrorCountForCurrentRequest](a1))
        {
          *(_BYTE *)(a1 + 292) = 0;
          -[BWStillImageCoordinatorNode _attemptToCompleteRequest](a1);
        }
      }
    }
  }
}

uint64_t __80__BWStillImageCoordinatorNode__setupStateMachineWithAllStateTransitionsHandler___block_invoke_12(uint64_t a1, uint64_t a2)
{
  return -[BWStillImageCoordinatorNode _cancelMomentCaptureIfNeeded](a2);
}

void __80__BWStillImageCoordinatorNode__setupStateMachineWithAllStateTransitionsHandler___block_invoke_13(uint64_t a1, uint64_t a2)
{
  -[BWStillImageCoordinatorNode _cancelMomentCapture](a2);
}

- (void)_cancelMomentCapture
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      v6 = v1;
      LODWORD(v5) = 0;
      FigDebugAssert3();
    }
    if (*(_BYTE *)(a1 + 293))
    {
      -[BWStillImageCoordinatorNode _flushStillImageRequestWithError:](a1, 0xFFFFBE5A);
      *(_BYTE *)(a1 + 293) = 0;
    }
    objc_msgSend(*(id *)(a1 + 104), "cancelPrepareToCaptureStillImageNow", v5, v6);
    v3 = *(void **)(a1 + 152);
    v4 = objc_msgSend(*(id *)(a1 + 264), "settingsID");
    v7 = *(_OWORD *)(a1 + 344);
    v8 = *(_QWORD *)(a1 + 360);
    objc_msgSend(v3, "stillImageCoordinator:didCancelMomentCaptureForSettingsID:streamingDisruptionEndPTS:", a1, v4, &v7);
    -[BWStillImageCoordinatorNode _completeRequestWithStatus:](a1, 0);
  }
}

- (int)_enqueueRequestWithSettings:(id)a3 serviceRequestsIfNecessary:(BOOL)a4
{
  int v7;
  int v8;
  NSObject *stillImageDispatchQueue;
  int v10;
  _QWORD block[5];
  BOOL v13;

  if (!a3)
  {
    FigDebugAssert3();
    return -12780;
  }
  v7 = objc_msgSend(a3, "isUserInitiatedRequestSettings");
  v8 = objc_msgSend(a3, "isClientInitiatedPrepareSettings");
  os_unfair_lock_lock(&self->_requestQueueLock);
  if (!v8)
  {
    if (v7)
    {
LABEL_9:
      -[NSMutableArray addObject:](self->_requestQueue, "addObject:", a3);
      goto LABEL_10;
    }
    if (self->_captureRequestCount <= 9)
    {
      -[NSMutableArray addObject:](self->_requestQueue, "addObject:", a3);
      ++self->_captureRequestCount;
      goto LABEL_10;
    }
LABEL_12:
    os_unfair_lock_unlock(&self->_requestQueueLock);
    v10 = -12773;
    FigDebugAssert3();
    return v10;
  }
  if (self->_prepareRequestCount > 9)
  {
    if ((v7 & 1) != 0)
      goto LABEL_9;
    goto LABEL_12;
  }
  -[NSMutableArray addObject:](self->_requestQueue, "addObject:", a3);
  ++self->_prepareRequestCount;
LABEL_10:
  os_unfair_lock_unlock(&self->_requestQueueLock);
  dispatch_group_enter((dispatch_group_t)self->_stillImageDispatchGroup);
  stillImageDispatchQueue = self->_stillImageDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__BWStillImageCoordinatorNode__enqueueRequestWithSettings_serviceRequestsIfNecessary___block_invoke;
  block[3] = &unk_1E491EE18;
  v13 = a4;
  block[4] = self;
  dispatch_async(stillImageDispatchQueue, block);
  return 0;
}

uint64_t __86__BWStillImageCoordinatorNode__enqueueRequestWithSettings_serviceRequestsIfNecessary___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  void *v4;
  uint64_t v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (*(_BYTE *)(result + 40))
  {
    v1 = result;
    v2 = *(_QWORD *)(result + 32);
    if (*(_BYTE *)(v2 + 96))
    {
      v3 = objc_msgSend(*(id *)(v2 + 232), "currentState");
      v4 = *(void **)(*(_QWORD *)(v1 + 32) + 232);
      if (v3 == 1)
      {
        v5 = 4;
      }
      else
      {
        result = objc_msgSend(v4, "currentState");
        if ((_DWORD)result != 2)
          return result;
        v4 = *(void **)(*(_QWORD *)(v1 + 32) + 232);
        v5 = 8;
      }
      return objc_msgSend(v4, "transitionToState:", v5);
    }
    else if (dword_1ECFE9910)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      return fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return result;
}

- (void)_unpackNextRequest
{
  uint64_t v2;
  FigCaptureStillImageSettings *v4;
  _BOOL4 v5;
  _BOOL4 v6;
  int v7;
  int v8;
  BOOL v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  if (!_FigIsCurrentDispatchQueue())
  {
    v12 = v2;
    LODWORD(v11) = 0;
    FigDebugAssert3();
  }
  os_unfair_lock_lock(&self->_requestQueueLock);
  -[NSMutableArray count](self->_requestQueue, "count");
  v4 = (FigCaptureStillImageSettings *)(id)-[NSMutableArray firstObject](self->_requestQueue, "firstObject");
  if (v4)
    -[NSMutableArray removeObjectAtIndex:](self->_requestQueue, "removeObjectAtIndex:", 0);
  v5 = -[FigCaptureStillImageSettings isUserInitiatedRequestSettings](v4, "isUserInitiatedRequestSettings", v11, v12);
  v6 = -[FigCaptureStillImageSettings isClientInitiatedPrepareSettings](v4, "isClientInitiatedPrepareSettings");
  if (v6 || !v5)
  {
    if (v6)
      v7 = 200;
    else
      v7 = 196;
    v8 = *(_DWORD *)((char *)&self->super.super.isa + v7);
    v9 = __OFSUB__(v8, 1);
    v10 = v8 - 1;
    if ((v10 < 0) ^ v9 | (v10 == 0))
      v10 = 0;
    *(_DWORD *)((char *)&self->super.super.isa + v7) = v10;
  }
  os_unfair_lock_unlock(&self->_requestQueueLock);
  self->_currentRequestedStillImageCaptureSettings = v4;
}

uint64_t __54__BWStillImageCoordinatorNode__beginInitiatingCapture__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  __int128 v4;
  uint64_t v5;
  _QWORD v6[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 104);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__BWStillImageCoordinatorNode__beginInitiatingCapture__block_invoke_2;
  v6[3] = &unk_1E491FB78;
  v6[4] = v1;
  v4 = *(_OWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 56);
  return objc_msgSend(v2, "initiateCaptureStillImageNowWithPTS:completionHandler:", &v4, v6);
}

void __54__BWStillImageCoordinatorNode__beginInitiatingCapture__block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[5];
  int v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 208);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__BWStillImageCoordinatorNode__beginInitiatingCapture__block_invoke_3;
  v4[3] = &unk_1E4920568;
  v5 = a2;
  v4[4] = v2;
  dispatch_async(v3, v4);
}

void __54__BWStillImageCoordinatorNode__beginInitiatingCapture__block_invoke_3(uint64_t a1)
{
  int v2;

  if (*(_DWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "cancelPrepareToCaptureStillImageNow");
    v2 = *(_DWORD *)(a1 + 40);
  }
  else
  {
    v2 = 0;
  }
  -[BWStillImageCoordinatorNode _completeRequestWithStatus:](*(_QWORD *)(a1 + 32), v2);
}

void __53__BWStillImageCoordinatorNode__beginResolvingCapture__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 208);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__BWStillImageCoordinatorNode__beginResolvingCapture__block_invoke_2;
  block[3] = &unk_1E491E720;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __53__BWStillImageCoordinatorNode__beginResolvingCapture__block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "currentState");
  if ((_DWORD)result == 128)
  {
    objc_msgSend(*(id *)(a1 + 32), "_configureCurrentCaptureRequestStateForFigCaptureStillImageSettings");
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "isBeginMomentCaptureSettings"))
      v3 = 2048;
    else
      v3 = 512;
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "transitionToState:", v3);
  }
  return result;
}

- (BOOL)_speedOverQualityCaptureEnabled
{
  uint64_t v1;
  uint64_t v3;
  float v4;
  float v5;
  float v6;
  int v7;
  NSObject *v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v10;
  char v11;
  char v12;
  NSObject *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (!_FigIsCurrentDispatchQueue())
  {
    v17 = v1;
    LODWORD(v15) = 0;
    FigDebugAssert3();
  }
  if (objc_msgSend(*(id *)(a1 + 104), "unifiedBracketingMode", v15, v17) == 2)
    return objc_msgSend(*(id *)(a1 + 264), "qualityPrioritization") == 2;
  if (!*(_BYTE *)(a1 + 480))
    return 0;
  mach_absolute_time();
  v4 = (float)(FigHostTimeToNanoseconds() / 1000) / 1000000.0;
  v5 = *(float *)(a1 + 488);
  if (v5 <= *(float *)(a1 + 492))
    v6 = *(float *)(a1 + 492);
  else
    v6 = *(float *)(a1 + 488);
  v7 = *(_DWORD *)(a1 + 496);
  if (v7 || v4 > v5)
  {
    if (v7 < 1 || v4 > v6)
    {
      if (v7 >= 1)
      {
        if (dword_1ECFE9910)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        *(_DWORD *)(a1 + 496) = 0;
      }
      goto LABEL_23;
    }
    *(_DWORD *)(a1 + 496) = v7 + 1;
    if (dword_1ECFE9910)
      goto LABEL_13;
  }
  else
  {
    *(_DWORD *)(a1 + 496) = 2;
    if (dword_1ECFE9910)
    {
LABEL_13:
      v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
LABEL_23:
  v10 = *(void **)(a1 + 264);
  v11 = objc_msgSend(v10, "burstQualityCaptureEnabled", v16, v18);
  v12 = BWCIFilterArrayContainsPortraitFilters((void *)objc_msgSend(v10, "processedImageFilters"));
  v3 = 0;
  if (*(_DWORD *)(a1 + 496) > *(_DWORD *)(a1 + 484) && (v11 & 1) == 0 && (v12 & 1) == 0)
  {
    if (dword_1ECFE9910)
    {
      v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      v3 = 1;
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    else
    {
      return 1;
    }
  }
  return v3;
}

- (void)_configureCurrentCaptureRequestStateForFigCaptureStillImageSettings
{
  uint64_t v2;
  int *v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  _BOOL4 v24;
  _BOOL4 v26;
  _BOOL4 v27;
  id v28;
  _BOOL4 v29;
  int64_t v30;
  unint64_t v31;
  uint64_t v32;
  int64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  int64_t v37;
  NSObject *v38;
  unsigned int v39;
  _BOOL4 v40;
  unsigned int v41;
  int v42;
  int v43;
  void *v44;
  int v45;
  int v46;
  int v47;
  NSObject *v48;
  unsigned int v49;
  unsigned int v50;
  int64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unsigned int v59;
  int v60;
  unsigned int v61;
  _BOOL4 v62;
  unint64_t v63;
  unint64_t v64;
  unsigned int v65;
  unint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  os_log_type_t type;
  unsigned int v72;
  _BYTE v73[128];
  int v74;
  const char *v75;
  __int16 v76;
  int64_t v77;
  __int16 v78;
  int v79;
  __int16 v80;
  unsigned int v81;
  __int16 v82;
  int v83;
  __int16 v84;
  int v85;
  __int16 v86;
  unsigned int v87;
  __int16 v88;
  int v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  if (!_FigIsCurrentDispatchQueue())
  {
    v56 = v2;
    LODWORD(v53) = 0;
    FigDebugAssert3();
  }
  if (-[FigCaptureStillImageSettings isClientInitiatedPrepareSettings](self->_currentRequestedStillImageCaptureSettings, "isClientInitiatedPrepareSettings", v53, v56)|| -[FigCaptureStillImageSettings isUserInitiatedRequestSettings](self->_currentRequestedStillImageCaptureSettings, "isUserInitiatedRequestSettings"))
  {
    v4 = &OBJC_IVAR___BWStillImageCoordinatorNode__clientExpectedImagesOrErrorsForRequest;
    goto LABEL_63;
  }
  self->_currentResolvedStillImageCaptureSettings = (BWStillImageCaptureSettings *)-[BWFigVideoCaptureDevice stillImageCaptureSettingsWithSettings:speedOverQualityCaptureEnabled:processingSupportProvider:](self->_captureDevice, "stillImageCaptureSettingsWithSettings:speedOverQualityCaptureEnabled:processingSupportProvider:", self->_currentRequestedStillImageCaptureSettings, -[BWStillImageCoordinatorNode _speedOverQualityCaptureEnabled]((uint64_t)self), self->_stillImageProcessingSupportProvider);
  self->_currentResolvedStillImageProcessingSettings = -[BWStillImageCoordinatorNode _resolveProcessingSettings]((BWStillImageProcessingSettings *)self);
  -[BWStillImageCaptureSettings setStillImageRequestTime:](self->_currentResolvedStillImageCaptureSettings, "setStillImageRequestTime:", -[FigCaptureStillImageSettings stillImageRequestTime](self->_currentRequestedStillImageCaptureSettings, "stillImageRequestTime"));
  objc_msgSend(-[BWStillImageCaptureSettings metadata](self->_currentResolvedStillImageCaptureSettings, "metadata"), "setFastCapturePrioritizationEnabled:", self->_fastCapturePrioritizationEnabled);
  if (dword_1ECFE9910)
  {
    v72 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v6 = -[BWStillImageCaptureSettings captureStreamSettings](self->_currentResolvedStillImageCaptureSettings, "captureStreamSettings", v54, v57);
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v68 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_receivedImagesOrErrorsForRequestByPortType, "setObject:forKeyedSubscript:", &unk_1E49F9768, objc_msgSend(v11, "portType"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_receivedUltraHighResImagesOrErrorsForRequestByPortType, "setObject:forKeyedSubscript:", &unk_1E49F9768, objc_msgSend(v11, "portType"));
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
    }
    while (v8);
  }
  self->_clientExpectedImagesOrErrorsForRequest = -[NSArray count](-[BWPhotoManifest photoDescriptors](-[BWStillImageProcessingSettings photoManifest](self->_currentResolvedStillImageProcessingSettings, "photoManifest"), "photoDescriptors"), "count");
  -[BWStillImageCoordinatorNode _updateAllocatedShotBufferCapacityIfNeeded]((uint64_t)self);
  if (self->_stillImageCapturePipeliningMode == 1
    && -[FigCaptureStillImageSettings burstQualityCaptureEnabled](self->_currentRequestedStillImageCaptureSettings, "burstQualityCaptureEnabled"))
  {
    ++self->_numberOfBurstCapturesInFlight;
  }
  v12 = -[BWStillImageCaptureSettings deliverDeferredPhotoProxyImage](self->_currentResolvedStillImageCaptureSettings, "deliverDeferredPhotoProxyImage");
  v13 = -[FigCaptureStillImageSettings outputWidth](self->_currentRequestedStillImageCaptureSettings, "outputWidth");
  v14 = -[FigCaptureStillImageSettings outputHeight](self->_currentRequestedStillImageCaptureSettings, "outputHeight");
  v63 = v14;
  if ((_DWORD)v12)
    v15 = v14;
  else
    v15 = 0;
  if ((_DWORD)v12)
    v16 = v13;
  else
    v16 = 0;
  v17 = -[FigCaptureStillImageSettings resolutionFlavor](self->_currentRequestedStillImageCaptureSettings, "resolutionFlavor");
  if (!(_DWORD)v17)
  {
    v65 = 0;
    goto LABEL_87;
  }
  v18 = v17;
  v65 = v17;
  if (!-[NSArray count](self->_highResStillImageDimensions, "count"))
  {
LABEL_87:
    v62 = 0;
    v29 = 0;
    v30 = v15;
LABEL_89:
    v12 = v16;
    goto LABEL_50;
  }
  v19 = +[FigCaptureSourceFormatDimensions identifyDimensionsFromFlavor:availableHighResStillImageDimensions:](FigCaptureSourceFormatDimensions, "identifyDimensionsFromFlavor:availableHighResStillImageDimensions:", v18, self->_highResStillImageDimensions);
  if (!v19)
  {
    v62 = 0;
    v29 = 0;
    v30 = v15;
    v16 = v16;
    goto LABEL_89;
  }
  v20 = v19;
  v21 = -[BWStillImageCaptureSettings captureFlags](self->_currentResolvedStillImageCaptureSettings, "captureFlags");
  v22 = v21;
  v24 = (v21 & 0x100000000) == 0 && (_DWORD)v18 == 2;
  v26 = (v21 & 0x200000000) == 0 && (_DWORD)v18 == 1;
  v27 = v24;
  v62 = v26;
  if (v24 || v26)
  {
    v28 = +[FigCaptureSourceFormatDimensions identifyDimensionsFromFlavor:availableHighResStillImageDimensions:](FigCaptureSourceFormatDimensions, "identifyDimensionsFromFlavor:availableHighResStillImageDimensions:", 0, self->_highResStillImageDimensions);
    if (!v28)
    {
      v65 = 0;
      v30 = v15;
      v16 = v16;
      v12 = v16;
      goto LABEL_49;
    }
    v20 = v28;
    v13 = objc_msgSend(v28, "dimensions");
    v65 = 0;
    v63 = HIDWORD(v13);
  }
  if ((v22 & 0x200000000) != 0)
    objc_msgSend(+[FigCaptureSourceFormatDimensions identifyDimensionsFromFlavor:availableHighResStillImageDimensions:](FigCaptureSourceFormatDimensions, "identifyDimensionsFromFlavor:availableHighResStillImageDimensions:", 0, self->_highResStillImageDimensions), "dimensions");
  if (!(_DWORD)v12)
  {
    v15 = 0;
    v16 = 0;
    v30 = 0;
LABEL_49:
    v29 = v27;
LABEL_50:
    v31 = v63;
    goto LABEL_52;
  }
  v29 = v27;
  if (FigCaptureVideoDimensionsAreValid(objc_msgSend(v20, "deferredPhotoProxyDimensions")))
  {
    v12 = objc_msgSend(v20, "deferredPhotoProxyDimensions");
    v15 = HIDWORD(v12);
    v16 = v13;
    v30 = v63;
    v31 = HIDWORD(v12);
    v13 = v12;
  }
  else
  {
    v31 = v63;
    v15 = v63;
    v16 = v13;
    v30 = v63;
    v12 = v13;
  }
LABEL_52:
  if (-[FigCaptureStillImageSettings deviceOrientationCorrectionEnabled](self->_currentRequestedStillImageCaptureSettings, "deviceOrientationCorrectionEnabled"))
  {
    v64 = v13;
    v32 = v65;
    if (self->_cinematicFramingWarpingRequired
      || (-[BWStillImageCoordinatorNode _ensureDeviceOrientationMonitor]((uint64_t)self),
          (v61 = -[BWDeviceOrientationMonitor mostRecentPortraitLandscapeOrientation](self->_deviceOrientationMonitor, "mostRecentPortraitLandscapeOrientation")) == 0))
    {
      v33 = v30;
      v34 = v15;
      v35 = v16;
      v16 = v33;
    }
    else
    {
      if (dword_1ECFE9910)
      {
        v72 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v38 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v39 = v72;
        v40 = os_log_type_enabled(v38, type);
        v41 = v39 & 0xFFFFFFFE;
        if (v40)
          v41 = v39;
        if (v41)
        {
          v42 = v30;
          v30 = -[FigCaptureStillImageSettings settingsID](self->_currentRequestedStillImageCaptureSettings, "settingsID");
          v43 = -[FigCaptureStillImageSettings outputOrientation](self->_currentRequestedStillImageCaptureSettings, "outputOrientation");
          v74 = 136315906;
          v75 = "-[BWStillImageCoordinatorNode _configureCurrentCaptureRequestStateForFigCaptureStillImageSettings]";
          v76 = 2048;
          v77 = v30;
          LODWORD(v30) = v42;
          v78 = 1024;
          v79 = v43;
          v80 = 1024;
          v81 = v61;
          LODWORD(v58) = 34;
          v55 = &v74;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v59 = v30;
      -[FigCaptureStillImageSettings setOutputOrientation:](self->_currentRequestedStillImageCaptureSettings, "setOutputOrientation:", v61, v55, v58);
      v60 = -[FigCaptureStillImageSettings outputMirroring](self->_currentRequestedStillImageCaptureSettings, "outputMirroring");
      v44 = (void *)objc_msgSend(-[NSArray firstObject](-[BWStillImageCaptureSettings captureStreamSettings](self->_currentResolvedStillImageCaptureSettings, "captureStreamSettings"), "firstObject"), "portType");
      if ((objc_msgSend(v44, "isEqual:", *MEMORY[0x1E0D05A38]) & 1) != 0)
        v45 = 1;
      else
        v45 = objc_msgSend(v44, "isEqual:", *MEMORY[0x1E0D05A50]);
      v46 = -[BWFigVideoCaptureDevice isExternalVariant](self->_captureDevice, "isExternalVariant");
      -[BWGraph clientExpectsCameraMountedInLandscapeOrientation](-[BWNode graph](self, "graph"), "clientExpectsCameraMountedInLandscapeOrientation");
      v47 = FigCaptureRotationDegreesFromOrientation(v61, v45, v46, v60);
      if (v47 == 270 || v47 == 90)
      {
        if (dword_1ECFE9910)
        {
          v66 = v15;
          v72 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v48 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v49 = v72;
          if (os_log_type_enabled(v48, type))
            v50 = v49;
          else
            v50 = v49 & 0xFFFFFFFE;
          if (v50)
          {
            v51 = -[FigCaptureStillImageSettings settingsID](self->_currentRequestedStillImageCaptureSettings, "settingsID");
            v74 = 136316930;
            v75 = "-[BWStillImageCoordinatorNode _configureCurrentCaptureRequestStateForFigCaptureStillImageSettings]";
            v76 = 2048;
            v77 = v51;
            v78 = 1024;
            v79 = v31;
            v80 = 1024;
            v81 = v64;
            v82 = 1024;
            v83 = v15;
            v84 = 1024;
            v85 = v12;
            v86 = 1024;
            v52 = v59;
            v87 = v59;
            v88 = 1024;
            v89 = v16;
            LODWORD(v58) = 58;
            v55 = &v74;
            _os_log_send_and_compose_impl();
          }
          else
          {
            v52 = v59;
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          v34 = v12;
          v35 = v52;
          v36 = v64;
          v15 = v66;
        }
        else
        {
          v34 = v12;
          v35 = v59;
          v36 = v64;
        }
        goto LABEL_57;
      }
      v34 = v15;
      v35 = v16;
      v16 = v59;
    }
    v15 = v12;
    v36 = v31;
    v31 = v64;
  }
  else
  {
    v37 = v30;
    v34 = v15;
    v35 = v16;
    v16 = v37;
    v15 = v12;
    v36 = v31;
    v31 = v13;
    v32 = v65;
  }
LABEL_57:
  -[FigCaptureStillImageSettings setOutputWidth:](self->_currentRequestedStillImageCaptureSettings, "setOutputWidth:", v31, v55, v58);
  -[FigCaptureStillImageSettings setOutputHeight:](self->_currentRequestedStillImageCaptureSettings, "setOutputHeight:", v36);
  if (-[FigCaptureStillImageSettings rawThumbnailWidth](self->_currentRequestedStillImageCaptureSettings, "rawThumbnailWidth") > v31|| -[FigCaptureStillImageSettings rawThumbnailHeight](self->_currentRequestedStillImageCaptureSettings, "rawThumbnailHeight") > v36)
  {
    -[FigCaptureStillImageSettings setRawThumbnailWidth:](self->_currentRequestedStillImageCaptureSettings, "setRawThumbnailWidth:", v31);
    -[FigCaptureStillImageSettings setRawThumbnailHeight:](self->_currentRequestedStillImageCaptureSettings, "setRawThumbnailHeight:", v36);
  }
  -[FigCaptureStillImageSettings setResolutionFlavor:](self->_currentRequestedStillImageCaptureSettings, "setResolutionFlavor:", v32);
  -[FigCaptureStillImageSettings setDeferredPhotoProxyWidth:](self->_currentRequestedStillImageCaptureSettings, "setDeferredPhotoProxyWidth:", v15);
  -[FigCaptureStillImageSettings setDeferredPhotoProxyHeight:](self->_currentRequestedStillImageCaptureSettings, "setDeferredPhotoProxyHeight:", v34);
  -[FigCaptureStillImageSettings setDeferredPhotoFinalWidth:](self->_currentRequestedStillImageCaptureSettings, "setDeferredPhotoFinalWidth:", v35);
  -[FigCaptureStillImageSettings setDeferredPhotoFinalHeight:](self->_currentRequestedStillImageCaptureSettings, "setDeferredPhotoFinalHeight:", v16);
  if (v29 || v62)
  {
    BWUpdateThumbnailAndPreviewDimensionsForRequestedSettings(self->_currentRequestedStillImageCaptureSettings, 0.0);
    -[FigCaptureStillImageSettings setBypassUpscaling:](self->_currentRequestedStillImageCaptureSettings, "setBypassUpscaling:", 0);
  }
  v4 = &OBJC_IVAR___BWStillImageCoordinatorNode__firedDelegateCallbackFlags;
LABEL_63:
  *(_DWORD *)((char *)&self->super.super.isa + *v4) = 0;
}

- (void)_updateAllocatedShotBufferCapacityIfNeeded
{
  int v2;
  int v3;
  int v4;
  uint64_t v5;
  char v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  BOOL v14;
  int v15;
  char v16;
  _BOOL4 v17;
  int v18;
  int v19;
  int v20;
  unsigned int v21;
  int v22;
  int *v23;
  int v24;
  unsigned int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  int v32;
  int *v33;
  _BOOL4 v35;
  char v36;

  if (!a1 || !*(_BYTE *)(a1 + 420))
    return;
  v2 = -[BWStillImageCoordinatorNode _expectedFrameCountForCurrentRequest](a1);
  v3 = -[BWStillImageCoordinatorNode _zoomBasedBufferCountForCurrentSettings](a1);
  v4 = -[BWStillImageCoordinatorNode _ultraHighResBufferCountForCurrentSettings](a1);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 372));
  if (*(_QWORD *)(a1 + 400))
  {
    LODWORD(v5) = -[BWStillImageCoordinatorNode _expectedFrameCountForCurrentRequest](a1);
    v6 = objc_msgSend(*(id *)(a1 + 272), "captureFlags");
    v7 = objc_msgSend(*(id *)(a1 + 272), "captureType");
    v8 = objc_msgSend(*(id *)(a1 + 400), "minimumUncompressedEquivalentCapacity");
    if (objc_msgSend(*(id *)(a1 + 400), "passthroughEnabled"))
    {
      if ((v6 & 2) != 0)
      {
        v9 = *(_DWORD *)(a1 + 384);
        v10 = *(_DWORD *)(a1 + 388) * v9;
        if (v9 >= 1)
          v11 = v10 + 1;
        else
          v11 = 1;
        v12 = (*(_DWORD *)(a1 + 376) - v10) & ~((*(_DWORD *)(a1 + 376) - v10) >> 31);
        v13 = *(_DWORD *)(a1 + 416);
        if (v13 == -1)
        {
          *(_DWORD *)(a1 + 416) = v12;
          v13 = *(_DWORD *)(a1 + 416);
        }
        v14 = v12 < v13;
        if (v12 < v13)
          v13 = v12;
        v15 = v13 + v11;
        if (v14)
          *(_DWORD *)(a1 + 416) = v12;
      }
      else
      {
        if (!objc_msgSend(*(id *)(a1 + 400), "compressionResourcesAllocated"))
          v8 = 0;
        if (v7 == 11)
          v18 = 0;
        else
          v18 = v2;
        v15 = *(_DWORD *)(a1 + 376) + v18;
        if ((*(_DWORD *)(a1 + 416) & 0x80000000) == 0)
          *(_DWORD *)(a1 + 416) = -1;
      }
    }
    else
    {
      v15 = 0;
      if ((v6 & 2) == 0 && v7 != 11)
      {
        if (v4 < 1)
          v15 = 1;
        else
          v15 = *(_DWORD *)(a1 + 388) * v4;
      }
      v19 = *(_DWORD *)(a1 + 384);
      if (v19 >= 1)
        v15 += *(_DWORD *)(a1 + 388) * v19;
    }
    if (*(_DWORD *)(a1 + 428) - v8 <= 1)
      v20 = 1;
    else
      v20 = *(_DWORD *)(a1 + 428) - v8;
    v21 = v15 + v5;
    if (v15 + (int)v5 >= v20)
      v21 = v20;
    if (v15)
      v5 = v21;
    else
      v5 = v5;
    if ((objc_msgSend(*(id *)(a1 + 400), "passthroughEnabled") & 1) != 0
      || objc_msgSend(*(id *)(a1 + 272), "captureType") == 11)
    {
      goto LABEL_50;
    }
    v22 = objc_msgSend(*(id *)(a1 + 104), "thermalSystemPressureLevel");
    if (v22 == 2)
    {
      v23 = &OBJC_IVAR___BWStillImageCoordinatorNode__extraUncompressedShotBufferCapacityForThermalSystemPressureLevelSerious;
    }
    else
    {
      if (v22 < 3)
      {
LABEL_50:
        if ((_DWORD)v5 == objc_msgSend((id)objc_opt_class(), "maxShotBufferCapacity"))
        {
          v16 = 0;
          v17 = 0;
        }
        else
        {
          v17 = (int)v5 < (int)objc_msgSend((id)objc_opt_class(), "maxShotBufferCapacity");
          objc_msgSend((id)objc_opt_class(), "setMaxShotBufferCapacity:", v5);
          v16 = 1;
        }
        goto LABEL_53;
      }
      v23 = &OBJC_IVAR___BWStillImageCoordinatorNode__extraUncompressedShotBufferCapacityForThermalSystemPressureLevelCritical;
    }
    v24 = *(_DWORD *)(a1 + *v23);
    v25 = v24 + v5;
    if (v24 + (int)v5 >= v20)
      v25 = v20;
    if (v24 <= 0)
      v5 = v5;
    else
      v5 = v25;
    goto LABEL_50;
  }
  v16 = 0;
  v17 = 0;
LABEL_53:
  v26 = *(_DWORD *)(a1 + 376) + v2;
  if (v26 >= (int)objc_msgSend((id)objc_opt_class(), "maxShotBufferCapacity"))
    v27 = objc_msgSend((id)objc_opt_class(), "maxShotBufferCapacity");
  else
    v27 = (*(_DWORD *)(a1 + 376) + v2);
  v28 = (*(_DWORD *)(a1 + 380) + v3);
  v29 = (*(_DWORD *)(a1 + 384) + v4);
  mach_absolute_time();
  v30 = FigHostTimeToNanoseconds();
  v31 = objc_msgSend(*(id *)(a1 + 272), "captureFlags");
  if (((!objc_msgSend(*(id *)(a1 + 400), "passthroughEnabled") || (v31 & 2) != 0)
     && (*(_DWORD *)(a1 + 496) || *(_DWORD *)(a1 + 376) || (float)((float)(v30 / 1000) / 1000000.0) <= 2.0)
     || (v32 = *(_DWORD *)(a1 + 424), (_DWORD)v27 == v32))
    && (v32 = *(_DWORD *)(a1 + 424), (int)v27 <= v32))
  {
    v33 = &OBJC_IVAR___BWSinkNode__handlersToCallWhenActive;
    if ((_DWORD)v28 == *(_DWORD *)(a1 + 432) && (_DWORD)v29 == *(_DWORD *)(a1 + 436) && !v17)
    {
      v35 = 0;
      goto LABEL_69;
    }
  }
  else
  {
    v33 = &OBJC_IVAR___BWSinkNode__handlersToCallWhenActive;
  }
  v35 = v27 != v32;
  *(_DWORD *)(a1 + 424) = v27;
  *(_DWORD *)(a1 + 432) = v28;
  *(_DWORD *)(a1 + 436) = v29;
  objc_msgSend((id)objc_opt_class(), "setCurrentAllocatedShotBufferCapacity:", v27);
  objc_msgSend((id)objc_opt_class(), "setNumberOfZoomBasedBufferIncludedInShotBuffer:", v28);
  objc_msgSend((id)objc_opt_class(), "setNumberOfUltraHighResBufferIncludedInShotBuffer:", v29);
LABEL_69:
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 372));
  if (*(_QWORD *)(a1 + 400))
  {
    if ((v16 & 1) != 0
      || v35
      && (v36 = objc_msgSend(*(id *)(a1 + v33[758]), "captureFlags"),
          objc_msgSend(*(id *)(a1 + 400), "passthroughEnabled"))
      && (v36 & 2) == 0)
    {
      -[BWStillImageCoordinatorNode _updateCompressedShotBufferCapacity](a1);
    }
  }
}

- (uint64_t)_setupProcessing
{
  uint64_t v1;
  BWStillImageSettings *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unint64_t v4;
  NSObject *v5;
  BWStillImageSettings *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  os_log_type_t type;
  int v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = (BWStillImageSettings *)result;
    if (!_FigIsCurrentDispatchQueue())
    {
      v14 = v1;
      LODWORD(v12) = 0;
      FigDebugAssert3();
    }
    if (dword_1ECFE9910)
    {
      v21 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (-[NSArray count](-[BWPhotoManifest photoDescriptors](-[BWStillImageProcessingSettings photoManifest](v2[8]._processingSettings, "photoManifest", v12, v14), "photoDescriptors"), "count"))
    {
      v4 = 0;
      do
      {
        if (dword_1ECFE9910)
        {
          v21 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        ++v4;
      }
      while (-[NSArray count](-[BWPhotoManifest photoDescriptors](-[BWStillImageProcessingSettings photoManifest](v2[8]._processingSettings, "photoManifest", v13, v15), "photoDescriptors"), "count") > v4);
    }
    v6 = -[BWStillImageCoordinatorNode _currentStillImageSettings](v2);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = -[BWStillImageCaptureSettings captureStreamSettings](-[BWStillImageSettings captureSettings](v6, "captureSettings"), "captureStreamSettings");
    result = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    if (result)
    {
      v8 = result;
      v9 = *(_QWORD *)v17;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
          if (objc_msgSend(v11, "isYUVCapture"))
            objc_msgSend((id)objc_msgSend((id)-[BWStillImageSettings outputs](v2, "outputs"), "objectAtIndexedSubscript:", objc_msgSend((id)-[BWStillImageCaptureSettings objectForKeyedSubscript:](v2[3]._captureSettings, "objectForKeyedSubscript:", objc_msgSend(v11, "portType")), "index")), "emitStillImagePrewarmMessageWithSettings:", v6);
          if (objc_msgSend(v11, "isSensorRawCapture"))
            objc_msgSend((id)objc_msgSend((id)-[BWStillImageSettings outputs](v2, "outputs"), "objectAtIndexedSubscript:", objc_msgSend((id)-[objc_class objectForKeyedSubscript:](v2[4].super.isa, "objectForKeyedSubscript:", objc_msgSend(v11, "portType")), "index")), "emitStillImagePrewarmMessageWithSettings:", v6);
          ++v10;
        }
        while (v8 != v10);
        result = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
        v8 = result;
      }
      while (result);
    }
  }
  return result;
}

- (BWPhotoManifest)_resolvePhotoManifest
{
  uint64_t v1;
  BWStillImageSettings *v2;
  void *v3;
  int *v4;
  int v5;
  unsigned int v6;
  int *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  unsigned int v13;
  int v14;
  unsigned int v15;
  unsigned int v16;
  int v17;
  int v18;
  unsigned int v19;
  __int16 v20;
  uint64_t v21;
  int v22;
  int v23;
  BOOL v24;
  uint64_t v25;
  int v26;
  unint64_t v27;
  unsigned int v28;
  void *v29;
  BWStillImageSettings *v30;
  int v31;
  int v32;
  _BOOL4 v33;
  int v34;
  BWStillImageSettings *v35;
  int v36;
  unint64_t v37;
  int v38;
  unint64_t v39;
  int v40;
  int v41;
  int v42;
  unsigned int v43;
  unint64_t v44;
  int v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  void *v51;
  BWPhotoDescriptor *v52;
  BWPhotoDescriptor *v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  BWStillImageSettings *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v2 = (BWStillImageSettings *)result;
  if (!_FigIsCurrentDispatchQueue())
  {
    v55 = v1;
    LODWORD(v54) = 0;
    FigDebugAssert3();
  }
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array", v54, v55);
  v4 = &OBJC_IVAR___BWSinkNode__handlersToCallWhenActive;
  v5 = -[BWStillImageCaptureSettings captureType](v2[8]._captureSettings, "captureType");
  v6 = -[BWStillImageCaptureSettings captureFlags](v2[8]._captureSettings, "captureFlags");
  v7 = &OBJC_IVAR___BWSinkNode__handlersToCallWhenActive;
  if (-[FigCaptureStillImageSettings outputFormat](v2[8]._requestedSettings, "outputFormat"))
  {
    v8 = 1;
    if ((v6 & 0x800) == 0)
      goto LABEL_12;
  }
  else
  {
    v8 = -[FigCaptureStillImageSettings isBeginMomentCaptureSettings](v2[8]._requestedSettings, "isBeginMomentCaptureSettings");
    if ((v6 & 0x800) == 0)
    {
LABEL_12:
      v9 = 0;
      goto LABEL_13;
    }
  }
  if (!-[FigCaptureStillImageSettings depthDataDeliveryEnabled](v2[8]._requestedSettings, "depthDataDeliveryEnabled"))
    goto LABEL_12;
  if (-[FigCaptureStillImageSettings depthDataFiltered](v2[8]._requestedSettings, "depthDataFiltered"))
    v9 = 32;
  else
    v9 = 16;
LABEL_13:
  v10 = 0;
  v11 = v5 - 1;
  v57 = v2;
  v12 = v9 | (v6 >> 5) & 0x200;
  switch(v11)
  {
    case 0:
    case 1:
      if (-[FigCaptureStillImageSettings constantColorEnabled](v2[8]._requestedSettings, "constantColorEnabled"))
        v12 = v12 | 0x80000;
      else
        v12 = v12;
      v15 = -[NSArray count](-[FigCaptureStillImageSettings bravoConstituentImageDeliveryDeviceTypes](v2[8]._requestedSettings, "bravoConstituentImageDeliveryDeviceTypes"), "count");
      if (v15 <= 1)
        v10 = 1;
      else
        v10 = v15;
      if (-[FigCaptureStillImageSettings constantColorEnabled](v2[8]._requestedSettings, "constantColorEnabled")
        && -[FigCaptureStillImageSettings constantColorFallbackPhotoDeliveryEnabled](v2[8]._requestedSettings, "constantColorFallbackPhotoDeliveryEnabled"))
      {
        v10 = 2;
        goto LABEL_54;
      }
      if (v10 >= 1)
      {
LABEL_54:
        v22 = v10;
        v56 = v10;
        do
        {
          if ((v6 & 0x100) != 0)
            objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12 | 0x10000));
          if (FigCapturePixelFormatIsBayerRaw(-[FigCaptureStillImageSettings rawOutputFormat](v2[8]._requestedSettings, "rawOutputFormat")))objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12 | 0x80));
          if (v8)
            objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12));
          --v22;
        }
        while (v22);
        goto LABEL_81;
      }
LABEL_82:
      if (objc_msgSend((id)objc_msgSend(*(id *)((char *)&v2->super.isa + v7[757]), "originalImageFilters"), "count"))
        v24 = v10 < 1;
      else
        v24 = 1;
      if (!v24)
      {
        v25 = 0;
        do
        {
          v26 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", v25), "unsignedIntValue");
          objc_msgSend(v3, "replaceObjectAtIndex:withObject:", v25++, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v26 | 4u));
        }
        while (v10 != v25);
      }
      if (objc_msgSend(v3, "count"))
      {
        v27 = 0;
        do
        {
          v28 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", v27), "unsignedIntValue");
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v29 = *(Class *)((char *)&v2->super.isa + v7[757]);
          else
            v29 = 0;
          v30 = -[BWStillImageCoordinatorNode _currentStillImageSettings](v2);
          if (BWIsSmartStyleCapture(v30))
            v31 = (objc_msgSend(v29, "smartStyle") != 0) << 21;
          else
            v31 = 0;
          objc_msgSend(v3, "replaceObjectAtIndex:withObject:", v27++, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v31 | v28));
        }
        while (objc_msgSend(v3, "count") > v27);
      }
      if (objc_msgSend((id)objc_msgSend(*(id *)((char *)&v2->super.isa + v7[757]), "processedImageFilters"), "count"))
      {
        v32 = BWCIFilterArrayContainsPortraitFilters((void *)objc_msgSend(*(id *)((char *)&v2->super.isa + v7[757]), "processedImageFilters"));
        v33 = BWCIFilterArrayOnlyContainsPortraitFilters((void *)objc_msgSend(*(id *)((char *)&v2->super.isa + v7[757]), "processedImageFilters"));
        v34 = v32 & (v6 >> 11);
        v35 = -[BWStillImageCoordinatorNode _currentStillImageSettings](v57);
        v36 = BWIsSmartStyleAllowedForAdjustedImage(v35);
        if ((v34 & 1) != 0 || !v33)
        {
          if (objc_msgSend(v3, "count"))
          {
            v39 = 0;
            if (v36)
              v40 = 0x200000;
            else
              v40 = 0;
            if (v34)
              v41 = 72;
            else
              v41 = 8;
            v42 = v41 | v40;
            do
            {
              v43 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", v39), "unsignedIntValue");
              objc_msgSend(v3, "insertObject:atIndex:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v42 | v43), v39 + 1);
              v39 += 2;
            }
            while (objc_msgSend(v3, "count") > v39);
          }
        }
        else if ((v6 & 0x800) != 0 && objc_msgSend(v3, "count"))
        {
          v37 = 0;
          do
          {
            v38 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", v37), "unsignedIntValue");
            objc_msgSend(v3, "replaceObjectAtIndex:withObject:", v37++, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v38 | 0x1000000u));
          }
          while (objc_msgSend(v3, "count") > v37);
        }
      }
      if (-[BWStillImageCaptureSettings deliverDeferredPhotoProxyImage](v57[8]._captureSettings, "deliverDeferredPhotoProxyImage")&& objc_msgSend(v3, "count"))
      {
        v44 = 0;
        do
        {
          v45 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", v44), "unsignedIntValue");
          objc_msgSend(v3, "replaceObjectAtIndex:withObject:", v44++, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v45 | 0x1000u));
        }
        while (objc_msgSend(v3, "count") > v44);
      }
      v46 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v47 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
      if (v47)
      {
        v48 = v47;
        v49 = *(_QWORD *)v59;
        do
        {
          for (i = 0; i != v48; ++i)
          {
            if (*(_QWORD *)v59 != v49)
              objc_enumerationMutation(v3);
            v51 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
            v52 = [BWPhotoDescriptor alloc];
            v53 = -[BWPhotoDescriptor initWithPhotoIdentifier:processingFlags:](v52, "initWithPhotoIdentifier:processingFlags:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString"), objc_msgSend(v51, "unsignedLongValue"));
            objc_msgSend(v46, "addObject:", v53);

          }
          v48 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
        }
        while (v48);
      }
      result = -[BWPhotoManifest initWithDescriptors:captureRequestIdentifier:]([BWPhotoManifest alloc], "initWithDescriptors:captureRequestIdentifier:", v46, -[FigCaptureStillImageSettings captureRequestIdentifier](v57[8]._requestedSettings, "captureRequestIdentifier"));
      break;
    case 2:
      if (-[BWStillImageCaptureSettings deliverOriginalImage](v2[8]._captureSettings, "deliverOriginalImage"))
        v10 = 2;
      else
        v10 = 1;
      if (-[BWStillImageCaptureSettings deliverOriginalImage](v2[8]._captureSettings, "deliverOriginalImage"))
        objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12 | 1));
      v12 = v12 | 2;
      goto LABEL_69;
    case 3:
    case 4:
    case 7:
      v13 = -[NSArray count](-[FigCaptureStillImageSettings bravoConstituentImageDeliveryDeviceTypes](v2[8]._requestedSettings, "bravoConstituentImageDeliveryDeviceTypes"), "count");
      if (v13 <= 1)
        v10 = 1;
      else
        v10 = v13;
      if (v10 >= 1)
      {
        v14 = v10;
        do
        {
          objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12));
          --v14;
        }
        while (v14);
      }
      goto LABEL_82;
    case 5:
    case 10:
      if ((v6 & 0x100) != 0)
        objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12 | 0x10000));
      v10 = 1;
      if ((v8 & 1) == 0)
        goto LABEL_82;
LABEL_69:
      objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12));
      goto LABEL_82;
    case 6:
      v10 = -[FigCaptureStillImageSettings bracketImageCount](v2[8]._requestedSettings, "bracketImageCount");
      if (-[NSArray count](-[FigCaptureStillImageSettings bravoConstituentImageDeliveryDeviceTypes](v2[8]._requestedSettings, "bravoConstituentImageDeliveryDeviceTypes"), "count"))
      {
        v10 *= -[NSArray count](-[FigCaptureStillImageSettings bravoConstituentImageDeliveryDeviceTypes](v2[8]._requestedSettings, "bravoConstituentImageDeliveryDeviceTypes"), "count");
      }
      if (v10 < 1)
        goto LABEL_82;
      v23 = v10;
      v56 = v10;
      do
      {
        if ((v6 & 0x100) != 0)
          objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12 | 0x10000));
        if (FigCapturePixelFormatIsBayerRaw(-[FigCaptureStillImageSettings rawOutputFormat](v2[8]._requestedSettings, "rawOutputFormat")))objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12 | 0x80));
        if (v8)
          objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12));
        --v23;
      }
      while (v23);
      goto LABEL_81;
    case 9:
    case 11:
      v16 = -[NSArray count](-[FigCaptureStillImageSettings bravoConstituentImageDeliveryDeviceTypes](v2[8]._requestedSettings, "bravoConstituentImageDeliveryDeviceTypes"), "count");
      if (v16 <= 1)
        v10 = 1;
      else
        v10 = v16;
      if (v10 < 1)
        goto LABEL_82;
      v17 = v10;
      v56 = v10;
      do
      {
        if ((v6 & 0x100) != 0)
        {
          if ((objc_msgSend(*(id *)((char *)&v2->super.isa + v4[758]), "captureFlags") & 0x100000) != 0)
            v18 = 65538;
          else
            v18 = 0x10000;
          objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v18 | v12));
        }
        if (v8)
        {
          v19 = objc_msgSend(*(id *)((char *)&v2->super.isa + v4[758]), "captureFlags");
          objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", (v19 >> 19) & 2 | v12));
        }
        if (objc_msgSend(*(id *)((char *)&v2->super.isa + v4[758]), "deliverOriginalImage"))
        {
          v20 = objc_msgSend(*(id *)((char *)&v2->super.isa + v4[758]), "captureFlags");
          v21 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12 | 1);
          if ((v20 & 0x2000) != 0)
            objc_msgSend(v3, "addObject:", v21);
          else
            objc_msgSend(v3, "insertObject:atIndex:", v21, 0);
          v4 = &OBJC_IVAR___BWSinkNode__handlersToCallWhenActive;
        }
        --v17;
      }
      while (v17);
      v7 = &OBJC_IVAR___BWSinkNode__handlersToCallWhenActive;
LABEL_81:
      v10 = v56;
      goto LABEL_82;
    default:
      goto LABEL_82;
  }
  return result;
}

- (uint64_t)_fireDelegateCallbackWithInfo:(uint64_t)result
{
  uint64_t v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  _BYTE v8[24];

  if (result)
  {
    if (a2)
    {
      v3 = result;
      v4 = *(_DWORD *)(result + 288);
      result = objc_msgSend(a2, "flag");
      if ((result & v4) == 0)
      {
        v5 = *(void **)(v3 + 296);
        if (v5)
        {
          return objc_msgSend(v5, "addObject:", a2);
        }
        else
        {
          v6 = objc_msgSend(a2, "flag");
          if (v6 > 15)
          {
            if (v6 > 63)
            {
              if (v6 == 64)
              {
                objc_msgSend(*(id *)(v3 + 152), "stillImageCoordinator:willPrepareStillImageCaptureWithSettings:clientInitiated:", v3, -[BWStillImageCoordinatorNode _currentStillImageSettings]((BWStillImageSettings *)v3), 0);
              }
              else if (v6 == 128)
              {
                objc_msgSend(*(id *)(v3 + 152), "stillImageCoordinator:readyToRespondToRequestAfterRequestWithSettings:", v3, -[BWStillImageCoordinatorNode _currentStillImageSettings]((BWStillImageSettings *)v3));
              }
            }
            else if (v6 == 16)
            {
LABEL_16:
              v7 = *(void **)(v3 + 152);
              objc_msgSend(a2, "pts");
              objc_msgSend(v7, "stillImageCoordinator:didResolveStillImagePTS:forSettings:isPreBracketedEV0:", v3, v8, -[BWStillImageCoordinatorNode _currentStillImageSettings]((BWStillImageSettings *)v3), objc_msgSend(a2, "isPreBracketFrame"));
            }
            else if (v6 == 32)
            {
              objc_msgSend(*(id *)(v3 + 152), "stillImageCoordinator:didCapturePhotoForSettings:", v3, -[BWStillImageCoordinatorNode _currentStillImageSettings]((BWStillImageSettings *)v3));
            }
          }
          else
          {
            switch(v6)
            {
              case 1:
                objc_msgSend(*(id *)(v3 + 152), "stillImageCoordinator:willBeginCaptureBeforeResolvingSettingsForID:", v3, objc_msgSend(*(id *)(v3 + 264), "settingsID"));
                break;
              case 2:
                objc_msgSend(*(id *)(v3 + 152), "stillImageCoordinator:willBeginCaptureForSettings:", v3, -[BWStillImageCoordinatorNode _currentStillImageSettings]((BWStillImageSettings *)v3));
                break;
              case 4:
                objc_msgSend(*(id *)(v3 + 152), "stillImageCoordinator:willCapturePhotoForSettings:error:", v3, -[BWStillImageCoordinatorNode _currentStillImageSettings]((BWStillImageSettings *)v3), 0);
                break;
              case 8:
                goto LABEL_16;
              default:
                break;
            }
          }
          result = objc_msgSend(a2, "flag");
          *(_DWORD *)(v3 + 288) |= result;
        }
      }
    }
  }
  return result;
}

- (uint64_t)_expectedFrameCountForCurrentRequest
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  int v9;
  int v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(a1 + 272), "captureStreamSettings", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v3)
    return 0;
  v4 = v3;
  LODWORD(v5) = 0;
  v6 = *(_QWORD *)v13;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v13 != v6)
        objc_enumerationMutation(v2);
      v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
      v9 = objc_msgSend(v8, "expectedFrameCaptureCount") + v5;
      v10 = objc_msgSend(v8, "expectedUltraHighResFrameCaptureCount");
      v5 = (v9 - v10 + *(_DWORD *)(a1 + 388) * v10);
    }
    v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  }
  while (v4);
  return v5;
}

- (BOOL)_waitUntilShotBufferHasFreeBufferCount:(float)a3 timeout:
{
  int v6;
  _BOOL8 v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v9;
  NSObject *v10;
  _DWORD *v11;
  dispatch_time_t v12;
  intptr_t v13;
  NSObject *v14;

  if (!a1 || !*(_BYTE *)(a1 + 420))
    return 0;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 372));
  if ((int)objc_msgSend((id)objc_opt_class(), "maxShotBufferCapacity") <= *(_DWORD *)(a1 + 376))
    v6 = 0;
  else
    v6 = objc_msgSend((id)objc_opt_class(), "maxShotBufferCapacity") - *(_DWORD *)(a1 + 376);
  v7 = v6 >= a2;
  if (v6 >= a2)
  {
    if (!dword_1ECFE9910)
    {
LABEL_12:
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 372));
      return v7;
    }
LABEL_8:
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_12;
  }
  if (*(_QWORD *)(a1 + 440))
    goto LABEL_8;
  if (dword_1ECFE9910)
  {
    v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  *(_QWORD *)(a1 + 440) = dispatch_group_create();
  *(_DWORD *)(a1 + 448) = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 440));
  v10 = *(id *)(a1 + 440);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 372));
  if (!v10)
    return 0;
  v11 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v12 = dispatch_time(0, (uint64_t)(float)(a3 * 1000000000.0));
  v13 = dispatch_group_wait(v10, v12);
  v7 = v13 == 0;
  if (*v11 == 1)
    kdebug_trace();
  if (v13)
  {
    v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 372));
    if (*(NSObject **)(a1 + 440) == v10)
    {
      dispatch_group_leave(v10);

      *(_QWORD *)(a1 + 440) = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 372));
  }

  return v7;
}

- (void)_readyToRespondToRequest
{
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
      FigDebugAssert3();
    -[BWStillImageCoordinatorNode _fireDelegateCallbackWithFlag:](a1, 128);
  }
}

- (uint64_t)_receivedFrameOrErrorCountForCurrentRequest
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t j;
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
  if (result)
  {
    v1 = result;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v2 = (void *)objc_msgSend(*(id *)(result + 272), "captureStreamSettings");
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v3)
    {
      v4 = v3;
      v5 = 0;
      v6 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v19 != v6)
            objc_enumerationMutation(v2);
          v5 += objc_msgSend((id)objc_msgSend(*(id *)(v1 + 240), "objectForKeyedSubscript:", objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "portType")), "intValue");
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v4);
    }
    else
    {
      v5 = 0;
    }
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = (void *)objc_msgSend(*(id *)(v1 + 272), "captureStreamSettings", 0);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v15;
      do
      {
        for (j = 0; j != v10; ++j)
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v8);
          v11 += objc_msgSend((id)objc_msgSend(*(id *)(v1 + 248), "objectForKeyedSubscript:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * j), "portType")), "intValue");
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }
    return (v5 - v11 + *(_DWORD *)(v1 + 388) * v11);
  }
  return result;
}

- (uint64_t)_expectedFrameCountForNextRequest
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  char v11;
  char v12;
  char v13;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (!_FigIsCurrentDispatchQueue())
  {
    v16 = v1;
    LODWORD(v15) = 0;
    FigDebugAssert3();
  }
  v3 = -[BWStillImageCoordinatorNode _expectedFrameCountForCurrentRequest](a1);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
  if (*(_BYTE *)(a1 + 480))
  {
    if (*(_DWORD *)(a1 + 496) == *(_DWORD *)(a1 + 484) && *(int *)(a1 + 196) >= 1)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v4 = *(void **)(a1 + 184);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v18;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v18 != v7)
              objc_enumerationMutation(v4);
            v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
            v10 = objc_msgSend(v9, "isUserInitiatedRequestSettings", v15, v16);
            v11 = objc_msgSend(v9, "isClientInitiatedPrepareSettings");
            if ((v10 & 1) == 0 && (v11 & 1) == 0)
            {
              v12 = objc_msgSend(v9, "burstQualityCaptureEnabled");
              v13 = BWCIFilterArrayContainsPortraitFilters((void *)objc_msgSend(v9, "processedImageFilters"));
              if ((v12 & 1) == 0 && (v13 & 1) == 0)
              {
                if (objc_msgSend(v9, "depthDataDeliveryEnabled"))
                  v3 = 6;
                else
                  v3 = 3;
              }
              goto LABEL_22;
            }
          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v6)
            continue;
          break;
        }
      }
    }
  }
LABEL_22:
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  return v3;
}

void __56__BWStillImageCoordinatorNode__attemptToCompleteRequest__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 208);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__BWStillImageCoordinatorNode__attemptToCompleteRequest__block_invoke_2;
  block[3] = &unk_1E491E720;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __56__BWStillImageCoordinatorNode__attemptToCompleteRequest__block_invoke_2(uint64_t a1)
{
  return -[BWStillImageCoordinatorNode _attemptToCompleteRequest](*(_QWORD *)(a1 + 32));
}

- (uint64_t)_waitToMakePaceWithReferenceTime:(uint64_t)result
{
  uint64_t v1;
  _DWORD *v2;
  float v3;
  float v4;
  float v5;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 452))
    {
      result = objc_msgSend(*(id *)(result + 272), "captureType");
      if ((_DWORD)result != 1)
      {
        v2 = (_DWORD *)MEMORY[0x1E0CA1FC0];
        if (*MEMORY[0x1E0CA1FC0] == 1)
          kdebug_trace();
        mach_absolute_time();
        result = FigHostTimeToNanoseconds();
        v3 = (float)(result / 1000) / 1000000.0;
        v4 = 1.0 / *(float *)(v1 + 456);
        if (v3 < v4)
        {
          v5 = v4 - v3;
          if (v5 > 0.0)
            result = usleep((float)(v5 * 1000000.0));
        }
        if (*v2 == 1)
          return kdebug_trace();
      }
    }
  }
  return result;
}

uint64_t __58__BWStillImageCoordinatorNode__completeRequestWithStatus___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 192));
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "count");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 192));
  if (*(_BYTE *)(a1 + 40))
    v3 = 8;
  else
    v3 = 4;
  if (*(_BYTE *)(a1 + 40))
    v4 = 2;
  else
    v4 = 1;
  if (v2)
    v5 = v3;
  else
    v5 = v4;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "transitionToState:", v5);
}

void __84__BWStillImageCoordinatorNode__stoppedUsingBufferWithSensorRawHighResolutionFlavor___block_invoke(uint64_t a1)
{
  -[BWStillImageCoordinatorNode _attemptToCompleteRequest](*(_QWORD *)(a1 + 32));
}

- (uint64_t)_zoomBasedBufferCountForCurrentSettings
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  int v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(a1 + 272), "captureStreamSettings", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v12;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v12 != v6)
        objc_enumerationMutation(v2);
      v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
      if (objc_msgSend(*(id *)(a1 + 104), "isPortTypeUsingZoomBasedSourceSensorRaws:", objc_msgSend(v8, "portType")))
      {
        v9 = objc_msgSend(v8, "expectedFrameCaptureCount");
        v5 = v9 + (_DWORD)v5 - objc_msgSend(v8, "expectedUltraHighResFrameCaptureCount");
      }
    }
    v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  }
  while (v4);
  return v5;
}

- (uint64_t)_ultraHighResBufferCountForCurrentSettings
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = (void *)objc_msgSend(*(id *)(a1 + 272), "captureStreamSettings", 0);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (!v2)
    return 0;
  v3 = v2;
  LODWORD(v4) = 0;
  v5 = *(_QWORD *)v9;
  do
  {
    for (i = 0; i != v3; ++i)
    {
      if (*(_QWORD *)v9 != v5)
        objc_enumerationMutation(v1);
      v4 = objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "expectedUltraHighResFrameCaptureCount")
         + v4;
    }
    v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  }
  while (v3);
  return v4;
}

- (uint64_t)_updateCompressedShotBufferCapacity
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  int v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = result;
    result = _FigIsCurrentDispatchQueue();
    if (!(_DWORD)result)
    {
      v12 = v1;
      LODWORD(v10) = 0;
      result = FigDebugAssert3();
    }
    if (*(_QWORD *)(v2 + 400))
    {
      v3 = *(_DWORD *)(v2 + 428);
      if ((int)(v3 - objc_msgSend((id)objc_opt_class(), "maxShotBufferCapacity")) < 2)
      {
        v5 = 1;
      }
      else
      {
        v4 = *(_DWORD *)(v2 + 428);
        v5 = v4 - objc_msgSend((id)objc_opt_class(), "maxShotBufferCapacity");
      }
      v6 = objc_msgSend(*(id *)(v2 + 272), "captureFlags", v10, v12) & 2;
      if (objc_msgSend(*(id *)(v2 + 400), "passthroughEnabled"))
        v7 = v6 == 0;
      else
        v7 = 0;
      if (v7)
      {
        v8 = *(_DWORD *)(v2 + 428) - *(_DWORD *)(v2 + 424);
        if (v8 <= 1)
          v5 = 1;
        else
          v5 = v8;
      }
      result = objc_msgSend(*(id *)(v2 + 400), "uncompressedEquivalentCapacity");
      if ((_DWORD)result != (_DWORD)v5)
      {
        if (dword_1ECFE9910)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        return objc_msgSend(*(id *)(v2 + 400), "setUncompressedEquivalentCapacity:", v5, v11, v13);
      }
    }
  }
  return result;
}

+ (void)setNumberOfZoomBasedBufferIncludedInShotBuffer:(int)a3
{
  sNumberOfZoomBasedBufferIncludedInShotBuffer = a3;
}

+ (int)numberOfZoomBasedBufferIncludedInShotBuffer
{
  return sNumberOfZoomBasedBufferIncludedInShotBuffer;
}

+ (void)setNumberOfUltraHighResBufferIncludedInShotBuffer:(int)a3
{
  sNumberOfUltraHighResBufferIncludedInShotBuffer = a3;
}

+ (int)numberOfUltraHighResBufferIncludedInShotBuffer
{
  return sNumberOfUltraHighResBufferIncludedInShotBuffer;
}

- (id)_stillImageDispatchQueue
{
  return self->_stillImageDispatchQueue;
}

- (id)_stateMachine
{
  return self->_stateMachine;
}

- (BWStillImageCaptureStatusDelegate)stillImageCaptureStatusDelegate
{
  return self->_stillImageCaptureStatusDelegate;
}

- (BWStillImageProcessingSupportProvider)stillImageProcessingSupportProvider
{
  return self->_stillImageProcessingSupportProvider;
}

- (BOOL)cinematicFramingWarpingRequired
{
  return self->_cinematicFramingWarpingRequired;
}

@end
