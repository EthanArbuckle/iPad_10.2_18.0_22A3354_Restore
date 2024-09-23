@implementation BWFileCoordinatorNode

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  unint64_t v7;
  const opaqueCMFormatDescription *v8;
  const opaqueCMFormatDescription *v9;
  unint64_t numVideoInputs;
  BOOL v11;
  unint64_t numAudioInputs;
  const opaqueCMFormatDescription **v14;
  const opaqueCMFormatDescription *v15;
  int v16;
  const opaqueCMFormatDescription **formatDescriptionsForInputs;
  NSArray *v18;
  unint64_t i;

  v7 = objc_msgSend(a5, "index", a3);
  if (a4)
  {
    v8 = (const opaqueCMFormatDescription *)objc_msgSend(a4, "formatDescription");
    if (v8)
    {
      v9 = v8;
      numVideoInputs = self->_numVideoInputs;
      if (numVideoInputs)
        v11 = v7 >= numVideoInputs;
      else
        v11 = 1;
      if (v11)
      {
        numAudioInputs = self->_numAudioInputs;
        if (v7 >= numAudioInputs + numVideoInputs || numAudioInputs == 0)
          v16 = 1835365473;
        else
          v16 = 1936684398;
      }
      else
      {
        v16 = 1986618469;
      }
      if (CMFormatDescriptionGetMediaType(v8) != v16)
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Description has invalid media type for input"), 0));
      formatDescriptionsForInputs = self->_formatDescriptionsForInputs;
      v15 = formatDescriptionsForInputs[v7];
      formatDescriptionsForInputs[v7] = v9;
      CFRetain(v9);
      if (v15)
        goto LABEL_18;
    }
    else
    {
      v14 = self->_formatDescriptionsForInputs;
      v15 = v14[v7];
      v14[v7] = 0;
      if (v15)
LABEL_18:
        CFRelease(v15);
    }
  }
  v18 = -[BWNode outputs](self, "outputs");
  objc_msgSend(-[NSArray objectAtIndex:](v18, "objectAtIndex:", v7), "makeConfiguredFormatLive");
  if (self->_masterInputIndex == v7)
  {
    for (i = self->_numAudioInputs + self->_numVideoInputs + self->_numMetadataInputs; i < self->_numOutputs; ++i)
      objc_msgSend(-[NSArray objectAtIndexedSubscript:](v18, "objectAtIndexedSubscript:", i), "makeConfiguredFormatLive");
  }
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (void)setFlagsLastFrameForVideoCompressor:(BOOL)a3
{
  self->_flagsLastFrameForVideoCompressor = a3;
}

- (void)setFileCoordiatorStatusDelegate:(id)a3
{
  self->_fileCoordiatorStatusDelegate = (BWNodeFileCoordinatorStatusDelegate *)a3;
}

- (void)setAudioSourceDelegate:(id)a3
{
  self->_audioSourceDelegate = (BWAudioSourceRecordingReadinessDelegate *)a3;
}

- (void)setCinematicLookAheadFrameCount:(int)a3
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;

  if (self->_motionDataTimeMachine)
  {
    if (a3 <= 0)
    {
      v3 = (void *)MEMORY[0x1E0C99DA0];
      v4 = *MEMORY[0x1E0C99778];
      v5 = CFSTR("Motion data time machine use must have a positive non-zero lookahead requirement");
      goto LABEL_7;
    }
  }
  else if (a3)
  {
    v3 = (void *)MEMORY[0x1E0C99DA0];
    v4 = *MEMORY[0x1E0C99778];
    v5 = CFSTR("Motion data lookahead requirement must be zero when not using a motion data time machine");
LABEL_7:
    objc_exception_throw((id)objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0));
  }
  self->_cinematicLookAheadFrameCount = a3;
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  uint64_t v6;
  NSArray *v7;
  unint64_t i;

  v6 = objc_msgSend(a4, "index");
  v7 = -[BWNode outputs](self, "outputs");
  objc_msgSend(-[NSArray objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", v6), "setFormat:", a3);
  if (self->_masterInputIndex == v6)
  {
    for (i = self->_numAudioInputs + self->_numVideoInputs + self->_numMetadataInputs; i < self->_numOutputs; ++i)
      objc_msgSend(-[NSArray objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", i), "setFormat:", a3);
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

- (BWFileCoordinatorNode)init
{
  uint64_t v3;

  LOBYTE(v3) = 0;
  return -[BWFileCoordinatorNode initWithNumberOfVideoInputs:numberOfAudioInputs:numberOfMetadataInputs:numberOfActionOnlyOutputs:overCaptureEnabled:allowLowLatencyWhenPossible:useTrueVideoFileRecordingStaging:motionDataTimeMachine:](self, "initWithNumberOfVideoInputs:numberOfAudioInputs:numberOfMetadataInputs:numberOfActionOnlyOutputs:overCaptureEnabled:allowLowLatencyWhenPossible:useTrueVideoFileRecordingStaging:motionDataTimeMachine:", 1, 0, 0, 0, 0, 1, v3, 0);
}

- (BWFileCoordinatorNode)initWithNumberOfVideoInputs:(unint64_t)a3 numberOfAudioInputs:(unint64_t)a4 numberOfMetadataInputs:(unint64_t)a5 numberOfActionOnlyOutputs:(unint64_t)a6 overCaptureEnabled:(BOOL)a7 allowLowLatencyWhenPossible:(BOOL)a8 useTrueVideoFileRecordingStaging:(BOOL)a9 motionDataTimeMachine:(id)a10
{
  unint64_t v10;
  _BOOL4 v11;
  unint64_t v14;
  unint64_t v15;
  BWFileCoordinatorNode *v16;
  void *v17;
  int v18;
  _UNKNOWN **v19;
  void *v20;
  uint64_t v21;
  BWNodeInput *v22;
  BWVideoFormatRequirements *v23;
  BWNodeOutput *v24;
  BWVideoFormatRequirements *v25;
  unint64_t v26;
  unint64_t v27;
  BWNodeInput *v28;
  void *v29;
  unint64_t v30;
  BWNodeInput *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  const opaqueCMFormatDescription **v35;
  uint64_t v36;
  BOOL v37;
  BOOL v38;
  size_t numVideoInputs;
  void *v41;
  uint64_t v42;
  const __CFString *v43;
  BOOL v44;
  unint64_t v45;
  _BOOL4 v46;
  unsigned int v47;
  size_t count;
  unint64_t v49;
  unint64_t v51;
  objc_super v52;

  v10 = a4 + a3 + a5;
  if (!v10)
  {
    v41 = (void *)MEMORY[0x1E0C99DA0];
    v42 = *MEMORY[0x1E0C99778];
    v43 = CFSTR("Need at least 1 input");
    goto LABEL_46;
  }
  v11 = a8;
  v14 = a4;
  v15 = a3;
  if (a3 != 1 && a10)
  {
    v41 = (void *)MEMORY[0x1E0C99DA0];
    v42 = *MEMORY[0x1E0C99778];
    v43 = CFSTR("Motion data time machine use must have one and only one video input");
LABEL_46:
    objc_exception_throw((id)objc_msgSend(v41, "exceptionWithName:reason:userInfo:", v42, v43, 0, a6, a7, a8));
  }
  v52.receiver = self;
  v52.super_class = (Class)BWFileCoordinatorNode;
  v16 = -[BWNode init](&v52, sel_init);
  if (!v16)
    return v16;
  v44 = a7;
  count = v10;
  v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v10);
  if (a9)
    v18 = 3;
  else
    v18 = 0;
  v46 = v11;
  v47 = v18;
  v19 = &off_1E4914000;
  v51 = v15;
  v45 = a6;
  v49 = v14;
  if (v14 && v15 && a9)
  {
    v20 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", count);
    goto LABEL_13;
  }
  v20 = 0;
  if (v15)
  {
LABEL_13:
    v21 = 0;
    do
    {
      v22 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1986618469, v16, v21);
      v23 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWNodeInput setFormatRequirements:](v22, "setFormatRequirements:", v23);

      -[BWNodeInput setPassthroughMode:](v22, "setPassthroughMode:", 1);
      -[BWNodeInput setDelayedBufferCount:](v22, "setDelayedBufferCount:", v47);
      -[BWNode addInput:](v16, "addInput:", v22);
      v24 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v16);
      v25 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWNodeOutput setFormatRequirements:](v24, "setFormatRequirements:", v25);
      -[BWNodeOutput setPassthroughMode:](v24, "setPassthroughMode:", 1);
      -[BWNodeOutput setIndexOfInputWhichDrivesThisOutput:](v24, "setIndexOfInputWhichDrivesThisOutput:", v21);

      -[BWNode addOutput:](v16, "addOutput:", v24);
      objc_msgSend(v17, "addObject:", objc_msgSend(MEMORY[0x1E0C99DE8], "array"));
      objc_msgSend(v20, "addObject:", objc_msgSend(MEMORY[0x1E0C99DE8], "array"));
      ++v21;

      v15 = v51;
    }
    while (v51 != v21);
    v14 = v49;
    v19 = &off_1E4914000;
  }
  v26 = v15;
  if (v14)
  {
    v27 = v49;
    v26 = v51;
    do
    {
      v28 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1936684398, v16, v26);
      -[BWNode addInput:](v16, "addInput:", v28);
      v29 = (void *)objc_msgSend(objc_alloc((Class)v19[445]), "initWithMediaType:node:", 1936684398, v16);
      -[BWNode addOutput:](v16, "addOutput:", v29);
      objc_msgSend(v17, "addObject:", objc_msgSend(MEMORY[0x1E0C99DE8], "array"));
      objc_msgSend(v20, "addObject:", objc_msgSend(MEMORY[0x1E0C99DE8], "array"));
      ++v26;

      --v27;
    }
    while (v27);
  }
  if (a5)
  {
    v30 = a5;
    do
    {
      v31 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1835365473, v16, v26);
      -[BWNode addInput:](v16, "addInput:", v31);
      v32 = (void *)objc_msgSend(objc_alloc((Class)v19[445]), "initWithMediaType:node:", 1835365473, v16);
      -[BWNode addOutput:](v16, "addOutput:", v32);
      objc_msgSend(v17, "addObject:", objc_msgSend(MEMORY[0x1E0C99DE8], "array"));
      objc_msgSend(v20, "addObject:", objc_msgSend(MEMORY[0x1E0C99DE8], "array"));
      ++v26;

      --v30;
    }
    while (v30);
  }
  -[BWNode setSupportsConcurrentLiveInputCallbacks:](v16, "setSupportsConcurrentLiveInputCallbacks:", 1);
  if (v45)
  {
    v33 = v45;
    do
    {
      v34 = (void *)objc_msgSend(objc_alloc((Class)v19[445]), "initWithMediaType:node:", 1835365473, v16);
      -[BWNode addOutput:](v16, "addOutput:", v34);

      --v33;
    }
    while (v33);
  }
  v35 = (const opaqueCMFormatDescription **)malloc_type_calloc(count, 8uLL, 0x6004044C4A2DFuLL);
  v16->_formatDescriptionsForInputs = v35;
  if (v35)
  {
    v16->_masterInputIndex = 0;
    v16->_masterInput = (BWNodeInput *)-[NSArray objectAtIndex:](-[BWNode inputs](v16, "inputs"), "objectAtIndex:", v16->_masterInputIndex);
    v36 = 0x7FFFFFFFFFFFFFFFLL;
    if (v49)
      v36 = v51;
    v16->_firstAudioInputIndex = v36;
    v16->_stagingQueues = (NSArray *)v17;
    v16->_recordingStagingQueues = (NSArray *)v20;
    v16->_recordingStagingQueueLimitForVideo = v47;
    v16->_pendingIrisRequestMarkerBuffers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16->_numInputs = count;
    v16->_numOutputs = count + v45;
    v16->_numVideoInputs = v51;
    v16->_numAudioInputs = v49;
    v16->_numMetadataInputs = a5;
    v16->_numActionOnlyOutputs = v45;
    v16->_stateMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    v37 = v44;
    if (!v51)
      v37 = 0;
    v16->_overCaptureEnabled = v37;
    v38 = v46 && v16->_numVideoInputs == 1 && v16->_numAudioInputs == 1 && v16->_masterInputIndex == 0;
    v16->_lowLatencyModeEnabled = v38;
    if (a10)
    {
      v16->_motionDataTimeMachine = (BWMotionDataTimeMachine *)a10;
      v16->_videoSampleBuffersWaitingForMetadata = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    }
    numVideoInputs = v16->_numVideoInputs;
    if (numVideoInputs)
    {
      v16->_lastSeenLuxMetadata = (id *)malloc_type_calloc(numVideoInputs, 8uLL, 0x80040B8603338uLL);
      v16->_currNumberOfConsecutiveVideoFramesMissingLux = (int *)malloc_type_calloc(v16->_numVideoInputs, 4uLL, 0x100004052888210uLL);
      v16->_maxNumberOfConsecutiveVideoFramesAllowedToBeMissingLux = 4;
    }
    if (initWithNumberOfVideoInputs_numberOfAudioInputs_numberOfMetadataInputs_numberOfActionOnlyOutputs_overCaptureEnabled_allowLowLatencyWhenPossible_useTrueVideoFileRecordingStaging_motionDataTimeMachine__onceToken != -1)
      dispatch_once(&initWithNumberOfVideoInputs_numberOfAudioInputs_numberOfMetadataInputs_numberOfActionOnlyOutputs_overCaptureEnabled_allowLowLatencyWhenPossible_useTrueVideoFileRecordingStaging_motionDataTimeMachine__onceToken, &__block_literal_global_20);
    v16->_droppedFramesCountDueToISP = 0;
  }
  else
  {

    return 0;
  }
  return v16;
}

uint64_t __224__BWFileCoordinatorNode_initWithNumberOfVideoInputs_numberOfAudioInputs_numberOfMetadataInputs_numberOfActionOnlyOutputs_overCaptureEnabled_allowLowLatencyWhenPossible_useTrueVideoFileRecordingStaging_motionDataTimeMachine___block_invoke()
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = notify_register_check("com.apple.avcapture.prefersnointerruptionsbyringtonesandalerts", &gPrefersNoInterruptionsByRingtonesAndAlertsToken);
  gValidPrefersNoInterruptionsByRingtonesAndAlertsToken = (_DWORD)result == 0;
  if ((_DWORD)result)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

- (void)dealloc
{
  OpaqueCMBlockBuffer *emptyMetadataSampleData;
  const opaqueCMFormatDescription **formatDescriptionsForInputs;
  unint64_t numInputs;
  unint64_t i;
  const opaqueCMFormatDescription *v7;
  id *lastSeenLuxMetadata;
  unint64_t v9;
  NSObject *recordingStoppedSemaphore;
  objc_super v11;

  -[BWFileCoordinatorNode _releaseSettings]((uint64_t)self);
  emptyMetadataSampleData = self->_emptyMetadataSampleData;
  if (emptyMetadataSampleData)
    CFRelease(emptyMetadataSampleData);
  formatDescriptionsForInputs = self->_formatDescriptionsForInputs;
  if (formatDescriptionsForInputs)
  {
    numInputs = self->_numInputs;
    if (numInputs)
    {
      for (i = 0; i < numInputs; ++i)
      {
        v7 = self->_formatDescriptionsForInputs[i];
        if (v7)
        {
          CFRelease(v7);
          numInputs = self->_numInputs;
        }
      }
      formatDescriptionsForInputs = self->_formatDescriptionsForInputs;
    }
    free(formatDescriptionsForInputs);
  }

  FigSimpleMutexDestroy();
  lastSeenLuxMetadata = self->_lastSeenLuxMetadata;
  if (lastSeenLuxMetadata)
  {
    if (self->_numVideoInputs)
    {
      v9 = 0;
      do

      while (self->_numVideoInputs > v9);
      lastSeenLuxMetadata = self->_lastSeenLuxMetadata;
    }
    free(lastSeenLuxMetadata);
  }
  free(self->_currNumberOfConsecutiveVideoFramesMissingLux);
  recordingStoppedSemaphore = self->_recordingStoppedSemaphore;
  if (recordingStoppedSemaphore)
  {
    dispatch_semaphore_signal(recordingStoppedSemaphore);

  }
  v11.receiver = self;
  v11.super_class = (Class)BWFileCoordinatorNode;
  -[BWNode dealloc](&v11, sel_dealloc);
}

- (void)_releaseSettings
{
  if (a1)
  {

    *(_QWORD *)(a1 + 112) = 0;
    *(_QWORD *)(a1 + 144) = 0;
  }
}

- (id)nodeSubType
{
  return CFSTR("FileCoordinator");
}

- (BOOL)flagsLastFrameForVideoCompressor
{
  return self->_flagsLastFrameForVideoCompressor;
}

- (id)audioSourceDelegate
{
  return self->_audioSourceDelegate;
}

- (id)fileCoordiatorStatusDelegate
{
  return self->_fileCoordiatorStatusDelegate;
}

- (int)cinematicLookAheadFrameCount
{
  return self->_cinematicLookAheadFrameCount;
}

- (void)didReachEndOfDataForInput:(id)a3
{
  unint64_t v4;
  NSArray *v5;
  int recordingState;
  NSMutableArray *idleInputIndicesWaitingForFlush;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  unint64_t i;
  NSMutableArray *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "index");
  pthread_mutex_lock((pthread_mutex_t *)self->_stateMutex);
  v5 = -[BWNode outputs](self, "outputs");
  recordingState = self->_recordingState;
  if (!self->_currSettingsIsIris)
  {
    if (recordingState != 3)
      goto LABEL_17;
LABEL_16:
    -[BWFileCoordinatorNode _finishStoppingOrPausing:withErrorCode:]((uint64_t)self, 1, 0);
    goto LABEL_17;
  }
  if (recordingState == 4)
    goto LABEL_5;
  if (recordingState == 3)
    goto LABEL_16;
  if (recordingState != 1)
  {
LABEL_17:
    objc_msgSend(-[NSArray objectAtIndex:](v5, "objectAtIndex:", v4), "markEndOfLiveOutput");
    if (self->_masterInputIndex == v4)
    {
      for (i = self->_numAudioInputs + self->_numVideoInputs + self->_numMetadataInputs; i < self->_numOutputs; ++i)
        objc_msgSend(-[NSArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", i), "markEndOfLiveOutput");
    }
    if (v4 < self->_numVideoInputs)
    {

      self->_lastSeenLuxMetadata[v4] = 0;
      self->_currNumberOfConsecutiveVideoFramesMissingLux[v4] = 0;
    }
    goto LABEL_26;
  }
LABEL_5:
  if (self->_masterInputIndex == v4)
  {
    -[BWFileCoordinatorNode _flushAllBuffersFromRecordingStagingQueues]((unint64_t)self);
    -[BWFileCoordinatorNode _performFlushAction]((uint64_t)self);
    idleInputIndicesWaitingForFlush = self->_idleInputIndicesWaitingForFlush;
    if (idleInputIndicesWaitingForFlush)
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](idleInputIndicesWaitingForFlush, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v15;
        do
        {
          for (j = 0; j != v9; ++j)
          {
            if (*(_QWORD *)v15 != v10)
              objc_enumerationMutation(idleInputIndicesWaitingForFlush);
            objc_msgSend(-[NSArray objectAtIndex:](v5, "objectAtIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * j), "unsignedIntegerValue")), "markEndOfLiveOutput");
          }
          v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](idleInputIndicesWaitingForFlush, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v9);
      }

      self->_idleInputIndicesWaitingForFlush = 0;
    }
    goto LABEL_17;
  }
  v13 = self->_idleInputIndicesWaitingForFlush;
  if (!v13)
  {
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_idleInputIndicesWaitingForFlush = v13;
  }
  -[NSMutableArray addObject:](v13, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4));
LABEL_26:
  pthread_mutex_unlock((pthread_mutex_t *)self->_stateMutex);
}

- (unint64_t)_flushAllBuffersFromRecordingStagingQueues
{
  unint64_t v1;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CMTime *v3;

  if (result)
  {
    v1 = result;
    if (dword_1ECFE94B0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v3 = (CMTime *)MEMORY[0x1E0CA2E30];
    -[BWFileCoordinatorNode _flushBuffersFromRecordingStagingQueuesWithPTSCutoff:factorInAudioDuration:](v1, MEMORY[0x1E0CA2E30], 1);
    return -[BWFileCoordinatorNode _flushBuffersFromRecordingStagingQueuesWithPTSCutoff:factorInAudioDuration:](v1, v3, 0);
  }
  return result;
}

- (void)_performFlushAction
{
  uint64_t v2;

  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 120);
    -[BWFileCoordinatorNode _flushSampleBuffersWaitingForMotionData](a1);
    -[BWFileCoordinatorNode _completeTransitionToNotRecording](a1);
    -[BWFileCoordinatorNode _emitMarkerBufferForFileWriterAction:withPTS:settings:settingsID:errorCode:](a1, CFSTR("Flush"), MEMORY[0x1E0CA2E28], 0, v2, 0);
    -[BWFileCoordinatorNode _releaseSettings](a1);
    *(_BYTE *)(a1 + 569) = 0;
  }
}

- (void)_finishStoppingOrPausing:(uint64_t)a3 withErrorCode:
{
  int v5;
  uint64_t v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  BOOL v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  os_log_type_t type;
  int v24;
  _BYTE v25[128];
  CMTime v26[5];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v5 = *(_DWORD *)(a1 + 156);
    v6 = *(_QWORD *)(a1 + 120);
    if (a2)
    {
      if (v5 == 3)
      {
        if (dword_1ECFE94B0)
        {
          v24 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(*(id *)(a1 + 112), "isIrisRecording"))
        {
          v9 = -[BWFileCoordinatorNode _irisMovieInfosFromPendingIrisRequestMarkerBuffers](a1);
          v10 = 0;
        }
        else
        {
          v10 = *(id *)(a1 + 112);
          v9 = 0;
        }
        -[BWFileCoordinatorNode _clearPendingIrisRequestMarkerBuffers](a1);
        a3 = 4294950878;
        objc_msgSend(*(id *)(a1 + 720), "fileCoordinator:stoppedBeforeStartedRecordingForSettings:pendingIrisMovieInfos:errorCode:", a1, v10, v9, 4294950878);
      }
      -[BWFileCoordinatorNode _completeTransitionToNotRecording](a1);
    }
    else
    {
      if (*(_BYTE *)(a1 + 140))
        v8 = gValidPrefersNoInterruptionsByRingtonesAndAlertsToken == 0;
      else
        v8 = 1;
      if (!v8)
        -[BWFileCoordinatorNode _sendPrefersNoInterruptionsByRingtonesAndAlertsNotificationWithState:](a1, 0);
      *(_DWORD *)(a1 + 156) = 2;
    }
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = *(void **)(a1 + 96);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v25, 16, v17, v18);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "removeAllObjects");
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      }
      while (v13);
    }
    objc_msgSend(*(id *)(a1 + 736), "removeAllObjects");
    *(_QWORD *)(a1 + 752) = 0;
    *(_QWORD *)(a1 + 760) = 0;
    if (v5 == 4 || v5 == 2)
    {
      v26[0] = *(CMTime *)(a1 + 360);
      -[BWFileCoordinatorNode _emitMarkerBufferForFileWriterAction:withPTS:settings:settingsID:errorCode:](a1, CFSTR("Stop"), v26, 0, v6, a3);
      if (*(_BYTE *)(a1 + 824))
      {
        v16 = *(NSObject **)(a1 + 816);
        if (v16)
          dispatch_semaphore_signal(v16);
        *(_BYTE *)(a1 + 824) = 0;
      }
    }
    else if (v5 != 3)
    {
      v26[0] = *(CMTime *)(a1 + 360);
      -[BWFileCoordinatorNode _emitMarkerBufferForFileWriterAction:withPTS:settings:settingsID:errorCode:](a1, CFSTR("Pause"), v26, 0, v6, a3);
    }
    -[BWFileCoordinatorNode _releaseSettings](a1);
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  unint64_t v7;
  void *v8;
  void *v9;
  CMTime v10;
  CMTime v11;
  CMTime v12;

  v7 = objc_msgSend(a4, "index");
  pthread_mutex_lock((pthread_mutex_t *)self->_stateMutex);
  if (BWSampleBufferIsMarkerBuffer(a3) && (v8 = (void *)CMGetAttachment(a3, CFSTR("IrisMovieRequest"), 0)) != 0)
  {
    if (self->_recordingState == 3)
    {
      -[BWFileCoordinatorNode _updateRecordingStateWithIrisMovieRequest:]((unint64_t)self, v8);
      -[NSMutableArray addObject:](self->_pendingIrisRequestMarkerBuffers, "addObject:", a3);
    }
    else
    {
      -[BWFileCoordinatorNode _handleIrisMovieRequest:input:sbuf:]((unint64_t)self, v8, (uint64_t)a4, (uint64_t)a3);
    }
  }
  else
  {
    if (v7 < self->_numVideoInputs)
    {
      FigCaptureMetadataUtilitiesAdjustValidBufferRectForDarkShadeCropping(a3);
      if (!BWSampleBufferIsMarkerBuffer(a3))
        -[BWFileCoordinatorNode _ensureLuxMetadata:forNodeInputIndex:]((uint64_t)self, a3, v7);
    }
    if (self->_recordingState == 1 && self->_recordingStagingQueues && self->_firstAudioHasBeenProcessed)
    {
      memset(&v12, 0, sizeof(v12));
      CMSampleBufferGetPresentationTimeStamp(&v12, a3);
      if ((v12.flags & 1) != 0)
      {
        objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_recordingStagingQueues, "objectAtIndexedSubscript:", v7), "addObject:", a3);
        -[BWFileCoordinatorNode _flushEligibleBuffersFromRecordingStagingQueues]((unint64_t)self);
        if (v7 < self->_numVideoInputs
          && objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_recordingStagingQueues, "objectAtIndexedSubscript:", v7), "count") > (unint64_t)self->_recordingStagingQueueLimitForVideo)
        {
          v9 = (void *)CFRetain((CFTypeRef)objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_recordingStagingQueues, "objectAtIndexedSubscript:", v7), "firstObject"));
          objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_recordingStagingQueues, "objectAtIndexedSubscript:", v7), "removeObjectAtIndex:", 0);
          -[BWFileCoordinatorNode _renderSampleBuffer:forInput:]((uint64_t)self, v9, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](self, "inputs"), "objectAtIndexedSubscript:", v7));
          memset(&v11, 0, sizeof(v11));
          CMSampleBufferGetPresentationTimeStamp(&v11, (CMSampleBufferRef)v9);
          CFRelease(v9);
          v10 = v11;
          -[BWFileCoordinatorNode _flushBuffersFromRecordingStagingQueuesWithPTSCutoff:factorInAudioDuration:]((unint64_t)self, &v10, 1);
        }
      }
      else
      {
        -[BWFileCoordinatorNode _flushAllBuffersFromRecordingStagingQueues]((unint64_t)self);
      }
    }
    else
    {
      -[BWFileCoordinatorNode _renderSampleBuffer:forInput:]((uint64_t)self, a3, a4);
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_stateMutex);
}

- (unint64_t)_updateRecordingStateWithIrisMovieRequest:(unint64_t)result
{
  unint64_t v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  CMTime rhs;
  char v8;
  os_log_type_t type;
  int v10;
  CMTime lhs;
  CMTime time;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    if (a2)
    {
      v3 = result;
      -[BWFileCoordinatorNode _flushAllBuffersFromRecordingStagingQueues](result);
      result = objc_msgSend(a2, "isFinalEnqueuedIrisRequest");
      if ((_DWORD)result)
      {
        if (dword_1ECFE94B0)
        {
          v10 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        objc_msgSend(a2, "movieEndingVideoPTS", v5, v6);
        if ((v8 & 1) != 0)
          objc_msgSend(a2, "movieEndingVideoPTS");
        else
          objc_msgSend(a2, "movieEndTime");
        *(CMTime *)(v3 + 384) = time;
        CMTimeMake(&rhs, 5, 1000);
        lhs = *(CMTime *)(v3 + 384);
        CMTimeSubtract(&time, &lhs, &rhs);
        *(CMTime *)(v3 + 384) = time;
        result = objc_msgSend(a2, "audioOffset");
        *(CMTime *)(v3 + 408) = time;
        if ((*(_BYTE *)(v3 + 420) & 1) != 0)
        {
          time = *(CMTime *)(v3 + 408);
          lhs = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
          result = CMTimeCompare(&time, &lhs);
          if ((int)result >= 1)
            *(_BYTE *)(v3 + 569) = 1;
        }
        *(_BYTE *)(v3 + 769) = 1;
      }
    }
    else
    {
      return FigDebugAssert3();
    }
  }
  return result;
}

- (unint64_t)_handleIrisMovieRequest:(uint64_t)a3 input:(uint64_t)a4 sbuf:
{
  unint64_t v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v4 = result;
    if (*(_QWORD *)(result + 8) == a3)
    {
      -[BWFileCoordinatorNode _updateRecordingStateWithIrisMovieRequest:](result, a2);
      if (dword_1ECFE94B0)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      return objc_msgSend(*(id *)(v4 + 16), "emitSampleBuffer:", a4, v7, v8);
    }
  }
  return result;
}

- (void)_ensureLuxMetadata:(uint64_t)a3 forNodeInputIndex:
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  if (a1)
  {
    v5 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    if (v5)
    {
      v6 = v5;
      v7 = objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06C40]);
      v8 = *(void **)(*(_QWORD *)(a1 + 808) + 8 * a3);
      if (v7)
      {
        v9 = (void *)v7;

        *(_QWORD *)(*(_QWORD *)(a1 + 808) + 8 * a3) = v9;
        *(_DWORD *)(*(_QWORD *)(a1 + 800) + 4 * a3) = 0;
      }
      else if (v8)
      {
        if (++*(_DWORD *)(*(_QWORD *)(a1 + 800) + 4 * a3) >= *(_DWORD *)(a1 + 792))
        {

          *(_QWORD *)(*(_QWORD *)(a1 + 808) + 8 * a3) = 0;
        }
        else
        {
          objc_msgSend(v6, "setObject:forKeyedSubscript:");
        }
      }
    }
  }
}

- (unint64_t)_flushEligibleBuffersFromRecordingStagingQueues
{
  unint64_t v1;
  opaqueCMSampleBuffer *v2;
  unint64_t v3;
  unint64_t i;
  opaqueCMSampleBuffer *v5;
  int v6;
  opaqueCMSampleBuffer *v7;
  CMTime v8;
  CMTime time1;
  CMTime v10;
  CMTime v11;

  if (result)
  {
    v1 = result;
    result = objc_msgSend((id)objc_msgSend(*(id *)(result + 128), "objectAtIndexedSubscript:", *(_QWORD *)(result + 656)), "count");
    if (result >= 3)
    {
      do
      {
        v2 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 128), "objectAtIndexedSubscript:", *(_QWORD *)(v1 + 656)), "objectAtIndexedSubscript:", 2);
        memset(&v11, 0, sizeof(v11));
        CMSampleBufferGetPresentationTimeStamp(&v11, v2);
        v3 = *(_QWORD *)(v1 + 624);
        for (i = *(_QWORD *)(v1 + 632) + v3; ; i = *(_QWORD *)(v1 + 632) + *(_QWORD *)(v1 + 624))
        {
          if (v3 >= i)
          {
            v6 = 1;
            v7 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 128), "objectAtIndexedSubscript:", *(_QWORD *)(v1 + 656)), "objectAtIndexedSubscript:", 1);
            memset(&v10, 0, sizeof(v10));
            CMSampleBufferGetPresentationTimeStamp(&v10, v7);
            time1 = v10;
            -[BWFileCoordinatorNode _flushBuffersFromRecordingStagingQueuesWithPTSCutoff:factorInAudioDuration:](v1, &time1, 1);
            goto LABEL_10;
          }
          v5 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 128), "objectAtIndexedSubscript:", v3), "lastObject");
          if (!v5)
            break;
          memset(&v10, 0, sizeof(v10));
          CMSampleBufferGetPresentationTimeStamp(&v10, v5);
          time1 = v10;
          v8 = v11;
          if (CMTimeCompare(&time1, &v8) < 0)
            break;
          ++v3;
        }
        v6 = 0;
LABEL_10:
        result = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 128), "objectAtIndexedSubscript:", *(_QWORD *)(v1 + 656)), "count");
      }
      while (v6 && result > 2);
    }
  }
  return result;
}

- (void)_renderSampleBuffer:(void *)a3 forInput:
{
  unint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int value;
  unsigned int v11;
  uint64_t v12;
  const __CFString *v13;
  Float64 Seconds;
  Float64 v15;
  Float64 v16;
  Float64 v17;
  int v18;
  opaqueCMSampleBuffer *v19;
  opaqueCMSampleBuffer *v20;
  CMBlockBufferRef DataBuffer;
  uint64_t v22;
  CMTime v23;
  CMTime v24;
  CMTime v25;
  CMTime v26;
  CMTime type;
  CMTime rhs;
  CMTime v29;
  CMTime time2;
  uint64_t v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  Float64 v35;
  __int16 v36;
  Float64 v37;
  __int16 v38;
  Float64 v39;
  __int16 v40;
  Float64 v41;
  CMTime time1;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v6 = objc_msgSend(a3, "index");
  v7 = (void *)objc_msgSend((id)objc_msgSend((id)a1, "outputs"), "objectAtIndex:", v6);
  if (*(_BYTE *)(a1 + 141)
    && !*(_BYTE *)(a1 + 142)
    && !*(_BYTE *)(a1 + 569)
    && v6 == *(_QWORD *)(a1 + 656)
    && (int)objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", 0x1E4928E58), "intValue") >= 1)
  {
    *(_BYTE *)(a1 + 569) = 1;
  }
  memset(&v29, 0, sizeof(v29));
  CMSampleBufferGetPresentationTimeStamp(&v29, (CMSampleBufferRef)a2);
  if ((v6 == *(_QWORD *)(a1 + 656) || v6 == *(_QWORD *)(a1 + 664))
    && *(_DWORD *)(a1 + 156) == 1
    && (*(_BYTE *)(a1 + 396) & 1) != 0)
  {
    time1 = *(CMTime *)(a1 + 384);
    time2 = v29;
    if (CMTimeCompare(&time1, &time2) <= 0)
    {
      if (v6 == *(_QWORD *)(a1 + 656) && (*(_BYTE *)(a1 + 444) & 1) == 0)
        *(CMTime *)(a1 + 432) = v29;
      if (!*(_BYTE *)(a1 + 141) || *(_BYTE *)(a1 + 142))
        goto LABEL_18;
      if ((*(_BYTE *)(a1 + 444) & 1) == 0)
        goto LABEL_35;
      if (CMSampleBufferGetImageBuffer((CMSampleBufferRef)a2))
      {
        time1 = *(CMTime *)(a1 + 432);
      }
      else
      {
        DataBuffer = CMSampleBufferGetDataBuffer((CMSampleBufferRef)a2);
        time1 = *(CMTime *)(a1 + 432);
        if (!DataBuffer)
        {
          if (v6 != *(_QWORD *)(a1 + 656))
            goto LABEL_35;
          goto LABEL_18;
        }
      }
      if ((*(_BYTE *)(a1 + 420) & 1) != 0)
      {
        if (*(_BYTE *)(a1 + 569))
        {
          time2 = time1;
          rhs = *(CMTime *)(a1 + 408);
          CMTimeAdd(&time1, &time2, &rhs);
          if ((*(_BYTE *)(a1 + 228) & 1) != 0)
          {
            rhs = time1;
            type = *(CMTime *)(a1 + 216);
            CMTimeAdd(&time2, &rhs, &type);
          }
        }
      }
      time2 = *(CMTime *)(a1 + 312);
      if (v6 == *(_QWORD *)(a1 + 664))
      {
        CMTimeMake(&v25, 1, 10000);
        rhs = v29;
        CMTimeAdd(&v26, &rhs, &v25);
        rhs = time2;
        if (CMTimeCompare(&rhs, &v26) <= 0)
        {
          time2 = v29;
          memset(&rhs, 0, sizeof(rhs));
          CMSampleBufferGetDuration(&rhs, (CMSampleBufferRef)a2);
          if ((rhs.flags & 1) != 0)
          {
            type = time2;
            v24 = rhs;
            CMTimeAdd(&time2, &type, &v24);
          }
        }
      }
      if (!*(_BYTE *)(a1 + 569)
        || (rhs = time2, type = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E28], CMTimeCompare(&rhs, &type) <= 0)
        || (rhs = time2, type = time1, (CMTimeCompare(&rhs, &type) & 0x80000000) == 0))
      {
LABEL_18:
        if (*(_BYTE *)(a1 + 569))
          -[BWFileCoordinatorNode _emitOrQueueSampleBuffer:forInput:toOutput:stoppingOrPausing:](a1, (CMSampleBufferRef)a2, a3, v7);
        if (dword_1ECFE94B0)
        {
          LODWORD(rhs.value) = 0;
          LOBYTE(type.value) = 0;
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          value = rhs.value;
          if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type.value))
            v11 = value;
          else
            v11 = value & 0xFFFFFFFE;
          if (v11)
          {
            v22 = *(_QWORD *)(a1 + 120);
            v12 = *(int *)(a1 + 156);
            if (v12 > 5)
              v13 = CFSTR("Unknown");
            else
              v13 = off_1E491F5F0[v12];
            time1 = v29;
            Seconds = CMTimeGetSeconds(&time1);
            time1 = *(CMTime *)(a1 + 432);
            v15 = CMTimeGetSeconds(&time1);
            time1 = *(CMTime *)(a1 + 384);
            v16 = CMTimeGetSeconds(&time1);
            time1 = *(CMTime *)(a1 + 408);
            v17 = CMTimeGetSeconds(&time1);
            LODWORD(time2.value) = 136316930;
            *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)"-[BWFileCoordinatorNode _renderSampleBuffer:forInput:]";
            LOWORD(time2.flags) = 2048;
            *(_QWORD *)((char *)&time2.flags + 2) = a1;
            HIWORD(time2.epoch) = 2048;
            v31 = v22;
            v32 = 2112;
            v33 = v13;
            v34 = 2048;
            v35 = Seconds;
            v36 = 2048;
            v37 = v15;
            v38 = 2048;
            v39 = v16;
            v40 = 2048;
            v41 = v17;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        -[BWFileCoordinatorNode _stopRecordingWithErrorCode:](a1, 0);
      }
    }
  }
LABEL_35:
  v18 = *(_DWORD *)(a1 + 156);
  if ((v18 - 4) >= 2)
  {
    if (v18 != 1)
    {
      if (v18 == 3)
      {
        time1 = v29;
        -[BWFileCoordinatorNode _doStartingToRecordWithSBuf:inputIndex:sbufPTS:](a1, a2, v6, (uint64_t)&time1);
      }
      return;
    }
    if (v6 >= *(_QWORD *)(a1 + 632) + *(_QWORD *)(a1 + 624))
    {
      time1 = v29;
      time2 = *(CMTime *)(a1 + 264);
      if (CMTimeCompare(&time1, &time2) < 1)
        return;
    }
    else if (*(_BYTE *)(a1 + 680) && v6 == 1 && !*(_BYTE *)(a1 + 573))
    {
      v23 = v29;
      v19 = -[BWFileCoordinatorNode _copyFirstValidLowLatencyAudioBuffer:inputIndex:sbufPTS:](a1, (CMSampleBufferRef)a2, v8, &v23);
      if (v19)
      {
        v20 = v19;
        -[BWFileCoordinatorNode _emitOrQueueSampleBuffer:forInput:toOutput:stoppingOrPausing:](a1, v19, a3, v7);
        CFRelease(v20);
      }
      return;
    }
    -[BWFileCoordinatorNode _emitOrQueueSampleBuffer:forInput:toOutput:stoppingOrPausing:](a1, (CMSampleBufferRef)a2, a3, v7);
    return;
  }
  if (v6 < *(_QWORD *)(a1 + 632) + *(_QWORD *)(a1 + 624)
    || (time1 = v29, time2 = *(CMTime *)(a1 + 264), CMTimeCompare(&time1, &time2) >= 1))
  {
    time1 = v29;
    -[BWFileCoordinatorNode _doStoppingOrPausingWithSBuf:inputIndex:sbufPTS:](a1, (uint64_t)a2, v6, (uint64_t)&time1);
  }
}

- (unint64_t)_flushBuffersFromRecordingStagingQueuesWithPTSCutoff:(int)a3 factorInAudioDuration:
{
  id *v5;
  uint64_t v6;
  void *v7;
  CMTime v8;
  CMTime time1;
  CMTime v10;
  uint64_t v11;

  if (result)
  {
    v5 = (id *)result;
    v11 = 0;
    memset(&v10, 0, sizeof(v10));
    for (result = -[BWFileCoordinatorNode _earliestPTSStagedForRecording:factorInAudioDuration:](result, &v11, a3, (uint64_t)&v10);
          (v10.flags & 1) != 0;
          result = -[BWFileCoordinatorNode _earliestPTSStagedForRecording:factorInAudioDuration:]((unint64_t)v5, &v11, a3, (uint64_t)&v10))
    {
      time1 = v10;
      v8 = *a2;
      result = CMTimeCompare(&time1, &v8);
      if ((result & 0x80000000) == 0)
        break;
      v6 = v11;
      v7 = (void *)CFRetain((CFTypeRef)objc_msgSend((id)objc_msgSend(v5[16], "objectAtIndexedSubscript:", v11), "firstObject"));
      objc_msgSend((id)objc_msgSend(v5[16], "objectAtIndexedSubscript:", v6), "removeObjectAtIndex:", 0);
      -[BWFileCoordinatorNode _renderSampleBuffer:forInput:]((uint64_t)v5, v7, (void *)objc_msgSend((id)objc_msgSend(v5, "inputs"), "objectAtIndexedSubscript:", v6));
      CFRelease(v7);
      v11 = 0;
      memset(&v10, 0, sizeof(v10));
    }
  }
  return result;
}

- (unint64_t)_earliestPTSStagedForRecording:(int)a3@<W2> factorInAudioDuration:(uint64_t)a4@<X8>
{
  unint64_t v6;
  uint64_t v7;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  CMTime v12;
  CMTime time1;
  CMTime v14;

  if (result)
  {
    v6 = result;
    v7 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)a4 = *MEMORY[0x1E0CA2E18];
    *(_QWORD *)(a4 + 16) = *(_QWORD *)(v7 + 16);
    if (*(_QWORD *)(result + 608))
    {
      v9 = 0;
      v10 = 0x7FFFFFFFFFFFFFFFLL;
      while (1)
      {
        if (a3 && (v11 = *(_QWORD *)(v6 + 624), v9 >= v11) && v9 < *(_QWORD *)(v6 + 632) + v11)
        {
          result = objc_msgSend((id)objc_msgSend(*(id *)(v6 + 128), "objectAtIndexedSubscript:", v9), "count");
          if (result >= 2)
          {
            result = objc_msgSend((id)objc_msgSend(*(id *)(v6 + 128), "objectAtIndexedSubscript:", v9), "objectAtIndexedSubscript:", 1);
            if (result)
            {
LABEL_11:
              memset(&v14, 0, sizeof(v14));
              result = (unint64_t)CMSampleBufferGetPresentationTimeStamp(&v14, (CMSampleBufferRef)result);
              if ((*(_BYTE *)(a4 + 12) & 1) == 0
                || (time1 = *(CMTime *)a4, v12 = v14, result = CMTimeCompare(&time1, &v12), (int)result >= 1))
              {
                *(CMTime *)a4 = v14;
                v10 = v9;
              }
            }
          }
        }
        else
        {
          result = objc_msgSend((id)objc_msgSend(*(id *)(v6 + 128), "objectAtIndexedSubscript:", v9), "firstObject");
          if (result)
            goto LABEL_11;
        }
        if (++v9 >= *(_QWORD *)(v6 + 608))
          goto LABEL_17;
      }
    }
    v10 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_17:
    *a2 = v10;
  }
  else
  {
    *(_QWORD *)a4 = 0;
    *(_QWORD *)(a4 + 8) = 0;
    *(_QWORD *)(a4 + 16) = 0;
  }
  return result;
}

- (void)_emitOrQueueSampleBuffer:(uint64_t)a1 forInput:(CMSampleBufferRef)sbuf toOutput:(void *)a3 stoppingOrPausing:(void *)a4
{
  int *v8;
  opaqueCMSampleBuffer *v9;
  uint64_t SampleTimingInfoArray;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CMSampleTimingInfo *v15;
  CMTimeValue v16;
  CMTimeScale *p_timescale;
  CMTimeScale *v18;
  int32_t v19;
  _OWORD *v20;
  int32_t v21;
  const __CFAllocator *v22;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  uint64_t v25;
  CMTimeScale v26;
  CMTimeFlags v27;
  CMTimeEpoch v28;
  uint64_t v29;
  __int128 v30;
  CMTimeEpoch v31;
  CMTimeEpoch v32;
  CMSampleBufferRef v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  CMTime timingArrayEntriesNeededOut;
  CMTime rhs;
  CMTime lhs;
  CMTime time1;
  CMSampleBufferRef sampleBufferOut;
  CMTimeValue v46;
  CMTimeScale v47;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v8 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
    if (*(_QWORD *)(a1 + 752))
      -[BWFileCoordinatorNode _emitSampleBuffersWaitingForMotionData](a1);
    sampleBufferOut = 0;
    if ((*(_BYTE *)(a1 + 180) & 1) != 0)
    {
      timingArrayEntriesNeededOut.value = 0;
      SampleTimingInfoArray = CMSampleBufferGetSampleTimingInfoArray(sbuf, 0, 0, &timingArrayEntriesNeededOut.value);
      if (timingArrayEntriesNeededOut.value >= 1)
      {
        MEMORY[0x1E0C80A78](SampleTimingInfoArray, v11, v12, v13);
        v15 = (CMSampleTimingInfo *)((char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
        if (!CMSampleBufferGetSampleTimingInfoArray(sbuf, timingArrayEntriesNeededOut.value, v15, 0))
        {
          v40 = a4;
          if (timingArrayEntriesNeededOut.value >= 1)
          {
            v16 = 0;
            p_timescale = &v15->presentationTimeStamp.timescale;
            do
            {
              if ((p_timescale[1] & 1) != 0)
              {
                v18 = p_timescale - 2;
                v19 = *p_timescale;
                lhs = *(CMTime *)(p_timescale - 2);
                rhs = *(CMTime *)(a1 + 168);
                CMTimeSubtract(&time1, &lhs, &rhs);
                *(CMTime *)(p_timescale - 2) = time1;
                if (*p_timescale != v19)
                {
                  *(_OWORD *)&lhs.value = *(_OWORD *)v18;
                  lhs.epoch = *((_QWORD *)p_timescale + 1);
                  CMTimeConvertScale(&time1, &lhs, v19, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
                  *(_OWORD *)v18 = *(_OWORD *)&time1.value;
                  *((_QWORD *)p_timescale + 1) = time1.epoch;
                }
              }
              if ((p_timescale[7] & 1) != 0)
              {
                v20 = p_timescale + 4;
                v21 = p_timescale[6];
                lhs = *(CMTime *)(p_timescale + 4);
                rhs = *(CMTime *)(a1 + 168);
                CMTimeSubtract(&time1, &lhs, &rhs);
                *(CMTime *)(p_timescale + 4) = time1;
                if (p_timescale[6] != v21)
                {
                  *(_OWORD *)&lhs.value = *v20;
                  lhs.epoch = *((_QWORD *)p_timescale + 4);
                  CMTimeConvertScale(&time1, &lhs, v21, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
                  *v20 = *(_OWORD *)&time1.value;
                  *((_QWORD *)p_timescale + 4) = time1.epoch;
                }
              }
              ++v16;
              p_timescale += 18;
            }
            while (v16 < timingArrayEntriesNeededOut.value);
          }
          v22 = CFGetAllocator(sbuf);
          CMSampleBufferCreateCopyWithNewTiming(v22, sbuf, timingArrayEntriesNeededOut.value, v15, &sampleBufferOut);
          a4 = v40;
        }
        v8 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
      }
    }
    else
    {
      if (sbuf)
        v9 = (opaqueCMSampleBuffer *)CFRetain(sbuf);
      else
        v9 = 0;
      sampleBufferOut = v9;
    }
    if (*(void **)(a1 + 160) != a3)
    {
      if ((unint64_t)objc_msgSend(a3, "index") < *(_QWORD *)(a1 + 624))
        goto LABEL_41;
      CMSampleBufferGetPresentationTimeStamp(&time1, sbuf);
      value = time1.value;
      flags = time1.flags;
      timescale = time1.timescale;
      epoch = time1.epoch;
      if ((unint64_t)objc_msgSend(a3, "index") >= *(_QWORD *)(a1 + 632) + *(_QWORD *)(a1 + 624))
      {
        time1 = *(CMTime *)(a1 + 336);
        lhs.value = value;
        lhs.timescale = timescale;
        lhs.flags = flags;
        lhs.epoch = epoch;
        if ((CMTimeCompare(&time1, &lhs) & 0x80000000) == 0)
          goto LABEL_41;
        v25 = a1 + 336;
        *(_QWORD *)(a1 + 336) = value;
        v26 = timescale;
        goto LABEL_36;
      }
      v46 = value;
      v47 = timescale;
      memset(&time1, 0, sizeof(time1));
      CMSampleBufferGetDuration(&time1, sbuf);
      if ((time1.flags & 1) != 0)
      {
        rhs.value = value;
        rhs.timescale = timescale;
        rhs.flags = flags;
        rhs.epoch = epoch;
        timingArrayEntriesNeededOut = time1;
        CMTimeAdd(&lhs, &rhs, &timingArrayEntriesNeededOut);
        v46 = lhs.value;
        flags = lhs.flags;
        v47 = lhs.timescale;
        epoch = lhs.epoch;
      }
      lhs = *(CMTime *)(a1 + 312);
      rhs.value = v46;
      rhs.timescale = v47;
      rhs.flags = flags;
      rhs.epoch = epoch;
      if (CMTimeCompare(&lhs, &rhs) < 0)
      {
        v25 = a1 + 312;
        *(_QWORD *)(a1 + 312) = v46;
        v26 = v47;
LABEL_36:
        *(_DWORD *)(v25 + 8) = v26;
        *(_DWORD *)(v25 + 12) = flags;
        *(_QWORD *)(v25 + 16) = epoch;
      }
LABEL_41:
      if (!sampleBufferOut)
        return;
      if (*(void **)(a1 + 160) == a3 && *(_QWORD *)(a1 + 728))
      {
        if (*(_QWORD *)(a1 + v8[381]))
        {
          objc_msgSend(*(id *)(a1 + 736), "addObject:");
          v33 = sampleBufferOut;
          if (!sampleBufferOut)
            return;
LABEL_45:
          CFRelease(v33);
          return;
        }
        v34 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(sampleBufferOut, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D082E8]), "unsignedLongLongValue");
        if (v34)
        {
          v35 = v34;
          v36 = (void *)objc_msgSend(*(id *)(a1 + 728), "copyMotionDataForSerialNumber:", *(_QWORD *)(a1 + 744) + v34);
          if (v36)
          {
            v37 = v36;
            -[BWFileCoordinatorNode _addLookAheadMotionDataToMetadataForSampleBuffer:lookAheadMotionData:](a1, sampleBufferOut, v36);

          }
          else
          {
            objc_msgSend(*(id *)(a1 + 736), "addObject:", sampleBufferOut);
            if (sampleBufferOut)
            {
              CFRelease(sampleBufferOut);
              sampleBufferOut = 0;
            }
            *(_QWORD *)(a1 + v8[381]) = v35;
          }
        }
      }
      if (!sampleBufferOut)
        return;
      -[BWFileCoordinatorNode _emitSampleBuffer:forInput:toOutput:](a1, sampleBufferOut, a3, a4);
      v33 = sampleBufferOut;
      goto LABEL_45;
    }
    CMSampleBufferGetPresentationTimeStamp(&time1, sbuf);
    value = time1.value;
    v27 = time1.flags;
    timescale = time1.timescale;
    if ((time1.flags & 1) == 0)
      goto LABEL_41;
    v28 = time1.epoch;
    memset(&time1, 0, sizeof(time1));
    CMSampleBufferGetDuration(&time1, sbuf);
    if ((time1.flags & 1) != 0)
    {
      v30 = *(_OWORD *)&time1.value;
      *(_OWORD *)(a1 + 216) = *(_OWORD *)&time1.value;
      v31 = time1.epoch;
      *(_QWORD *)(a1 + 232) = time1.epoch;
      v29 = a1 + 240;
      rhs.value = value;
      rhs.timescale = timescale;
      rhs.flags = v27;
      rhs.epoch = v28;
      *(_OWORD *)&timingArrayEntriesNeededOut.value = v30;
      timingArrayEntriesNeededOut.epoch = v31;
      CMTimeAdd(&lhs, &rhs, &timingArrayEntriesNeededOut);
    }
    else
    {
      *(_QWORD *)(a1 + 240) = value;
      *(_DWORD *)(a1 + 248) = timescale;
      *(_DWORD *)(a1 + 252) = v27;
      *(_QWORD *)(a1 + 256) = v28;
      if ((*(_BYTE *)(a1 + 204) & 1) == 0)
      {
LABEL_40:
        *(_QWORD *)(a1 + 192) = value;
        *(_DWORD *)(a1 + 200) = timescale;
        *(_DWORD *)(a1 + 204) = v27;
        *(_QWORD *)(a1 + 208) = v28;
        goto LABEL_41;
      }
      lhs.value = value;
      lhs.timescale = timescale;
      lhs.flags = v27;
      lhs.epoch = v28;
      rhs = *(CMTime *)(a1 + 192);
      v29 = a1 + 216;
      if (CMTimeCompare(&lhs, &rhs) < 1)
      {
        v38 = MEMORY[0x1E0CA2E18];
        *(_OWORD *)v29 = *MEMORY[0x1E0CA2E18];
        v32 = *(_QWORD *)(v38 + 16);
        goto LABEL_39;
      }
      rhs.value = value;
      rhs.timescale = timescale;
      rhs.flags = v27;
      rhs.epoch = v28;
      timingArrayEntriesNeededOut = *(CMTime *)(a1 + 192);
      CMTimeSubtract(&lhs, &rhs, &timingArrayEntriesNeededOut);
    }
    *(_OWORD *)v29 = *(_OWORD *)&lhs.value;
    v32 = lhs.epoch;
LABEL_39:
    *(_QWORD *)(v29 + 16) = v32;
    goto LABEL_40;
  }
}

- (void)_stopRecordingWithErrorCode:(uint64_t)a1
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CMTime v9;

  if (a1)
  {
    v4 = *(_DWORD *)(a1 + 156);
    if (v4 == 3)
    {
      -[BWFileCoordinatorNode _finishStoppingOrPausing:withErrorCode:](a1, 1, a2);
      v4 = *(_DWORD *)(a1 + 156);
    }
    switch(v4)
    {
      case 1:
        *(_DWORD *)(a1 + 576) = a2;
        v7 = MEMORY[0x1E0CA2E18];
        *(_OWORD *)(a1 + 360) = *MEMORY[0x1E0CA2E18];
        *(_QWORD *)(a1 + 376) = *(_QWORD *)(v7 + 16);
        v8 = *(_QWORD *)(a1 + 352);
        *(_OWORD *)(a1 + 288) = *(_OWORD *)(a1 + 336);
        *(_QWORD *)(a1 + 304) = v8;
        *(_BYTE *)(a1 + 572) = 0;
        *(_DWORD *)(a1 + 156) = 4;
        -[BWFileCoordinatorNode _flushAllBuffersFromRecordingStagingQueues](a1);
        if (*(_BYTE *)(a1 + 569))
          -[BWFileCoordinatorNode _performFlushAction](a1);
        break;
      case 5:
        *(_DWORD *)(a1 + 576) = a2;
        *(_DWORD *)(a1 + 156) = 4;
        break;
      case 2:
        if ((_DWORD)a2)
          v5 = a2;
        else
          v5 = 0xFFFFFFFFLL;
        v6 = *(_QWORD *)(a1 + 120);
        v9 = *(CMTime *)(a1 + 360);
        -[BWFileCoordinatorNode _emitMarkerBufferForFileWriterAction:withPTS:settings:settingsID:errorCode:](a1, CFSTR("Resume"), &v9, 0, v6, v5);
        -[BWFileCoordinatorNode _finishStoppingOrPausing:withErrorCode:](a1, 1, a2);
        break;
    }
  }
}

- (void)_doStartingToRecordWithSBuf:(unint64_t)a3 inputIndex:(uint64_t)a4 sbufPTS:
{
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  unsigned int v18;
  Float64 Seconds;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _OWORD *v26;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  void *v30;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  void *v33;
  void *i;
  unint64_t v35;
  CMTime *p_decodeTimeStamp;
  CMTime *v37;
  void *v38;
  opaqueCMSampleBuffer *v39;
  int32_t v40;
  opaqueCMSampleBuffer *v41;
  CMItemCount NumSamples;
  unint64_t v43;
  __int128 v44;
  __int128 v45;
  CMTimeEpoch v46;
  CMSampleBufferRef v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  void *v51;
  opaqueCMSampleBuffer *v52;
  opaqueCMSampleBuffer *v53;
  CMSampleBufferRef AudioBufferTrimmedToStartTime;
  CMSampleBufferRef v55;
  void *v56;
  CMSampleBufferRef v57;
  CMSampleBufferRef v58;
  __int128 v59;
  __int128 v60;
  void *v61;
  CMTimeEpoch v62;
  const __CFAllocator *v63;
  uint64_t v64;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int value;
  unsigned int v67;
  const void *v68;
  void *v69;
  NSObject *v70;
  unsigned int v71;
  unsigned int v72;
  uint64_t v73;
  Float64 v74;
  int v75;
  int v76;
  uint64_t v77;
  int v78;
  uint64_t v79;
  int v80;
  CFTypeRef *v81;
  NSObject *v82;
  unsigned int v83;
  unsigned int v84;
  uint64_t v85;
  Float64 v86;
  const void *v87;
  const __CFString *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *MovieLevelMetadataWithVariableFrameRate;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char v99;
  BOOL v100;
  const __CFDictionary *v101;
  int64_t UpTimeNanoseconds;
  const opaqueCMFormatDescription *FormatDescription;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t j;
  void *v109;
  uint64_t Copy;
  void *v111;
  uint64_t v112;
  unint64_t v113;
  CMTimeEpoch v114;
  unint64_t v115;
  void *v116;
  opaqueCMSampleBuffer *v117;
  unint64_t v118;
  BOOL v119;
  uint64_t v120;
  uint64_t v121;
  CMSampleTimingInfo *sampleTimingArray;
  uint64_t v123;
  const __CFAllocator *allocator;
  int v125;
  const __CFString *key;
  CFStringRef keya;
  void *sbuf;
  CMSampleBufferRef sbufa[2];
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  CMTime v134;
  CMTime v135;
  CMTime v136;
  CMTime target;
  CMTime v138;
  CMTime v139;
  _BYTE v140[24];
  CMTime v141;
  CMTime v142;
  CMTime v143;
  CMTime v144;
  CMTime v145;
  CMTime lhs;
  CMTime time;
  CMTime duration;
  CMTime presentationTimeStamp;
  CMItemCount timingArrayEntriesNeededOut;
  CMSampleBufferRef sampleBufferOut;
  _BYTE v152[128];
  _BYTE time2[64];
  _BYTE v154[10];
  __int16 v155;
  int v156;
  __int16 v157;
  uint64_t v158;
  __int16 v159;
  int v160;
  CMSampleTimingInfo time1;
  CMSampleTimingInfo rhs;
  uint64_t v163;

  v163 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v8 = objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:");
  if (!v8)
  {
    pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 600));
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Could not find staging queue for given input"), 0));
  }
  v9 = (void *)v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(*(id *)(a1 + 112), "isIrisRecording"))
  {
    if (*(_QWORD *)(a1 + 624)
      && *(_QWORD *)(a1 + 656) == a3
      && !objc_msgSend(v9, "count")
      && CMGetAttachment(a2, CFSTR("SampleDataToBeDropped"), 0) == (CFTypeRef)*MEMORY[0x1E0C9AE50])
    {
      return;
    }
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }
  if ((*(_BYTE *)(a1 + 516) & 1) != 0)
  {
    *(_OWORD *)&time1.duration.value = *(_OWORD *)a4;
    time1.duration.epoch = *(_QWORD *)(a4 + 16);
    *(_OWORD *)time2 = *(_OWORD *)(a1 + 504);
    *(_QWORD *)&time2[16] = *(_QWORD *)(a1 + 520);
    if (CMTimeCompare(&time1.duration, (CMTime *)time2) < 1)
      return;
  }
  key = (const __CFString *)*MEMORY[0x1E0D05CB0];
  v11 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  sbuf = a2;
  if (*(_QWORD *)(a1 + 624))
  {
    v12 = *(_QWORD *)(a1 + 656) == a3 ? v10 : 1;
    if ((v12 & 1) == 0)
    {
      v15 = v11;
      if ((objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D06BC8]), "BOOLValue") & 1) != 0
        || (int)objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D06AC8]), "intValue") > 1)
      {
        return;
      }
      if (*(_DWORD *)(a1 + 552) == -1)
      {
        *(_DWORD *)(a1 + 556) = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D067D0]), "intValue");
        *(_DWORD *)(a1 + 552) = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D06AB8]), "intValue");
        v16 = *(_DWORD *)(a1 + 552) - 1;
        v17 = 0;
        if (v16 <= 9)
          v17 = qword_1A32A2838[v16];
        *(_QWORD *)(a1 + 544) = v17;
      }
      if (!objc_msgSend(v9, "count") && !*(_BYTE *)(a1 + 568) && *(double *)(a1 + 544) > 0.0)
      {
        v18 = *(_DWORD *)(a1 + 552);
        if (v18 <= 0xA)
        {
          if (((1 << v18) & 0x64C) != 0)
          {
            if (objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D067D0]), "intValue") == 2)goto LABEL_44;
          }
          else if (v18 == 1
                 && objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D06AB8]), "intValue") == 1)
          {
LABEL_44:
            if ((*(_BYTE *)(a1 + 468) & 1) == 0)
            {
              CMSampleBufferGetPresentationTimeStamp(&time1.duration, (CMSampleBufferRef)a2);
              *(_OWORD *)(a1 + 456) = *(_OWORD *)&time1.duration.value;
              *(_QWORD *)(a1 + 472) = time1.duration.epoch;
            }
            CMSampleBufferGetPresentationTimeStamp(&lhs, (CMSampleBufferRef)a2);
            *(_OWORD *)&time1.duration.value = *(_OWORD *)(a1 + 456);
            time1.duration.epoch = *(_QWORD *)(a1 + 472);
            CMTimeSubtract(&time, &lhs, &time1.duration);
            Seconds = CMTimeGetSeconds(&time);
            *(Float64 *)(a1 + 528) = Seconds;
            *(_BYTE *)(a1 + 568) = Seconds >= *(double *)(a1 + 544);
            if (!*(_BYTE *)(a1 + 568))
            {
              v20 = 560;
              goto LABEL_247;
            }
            goto LABEL_241;
          }
        }
      }
      if ((*(_BYTE *)(a1 + 468) & 1) == 0)
      {
LABEL_242:
        if (!objc_msgSend((id)CMGetAttachment(a2, CFSTR("DropFrameWaitingForTorchToRampUp"), 0), "BOOLValue"))
        {
          if ((*(_BYTE *)(a1 + 492) & 1) != 0)
          {
            CMSampleBufferGetPresentationTimeStamp(&v142, (CMSampleBufferRef)a2);
            *(_OWORD *)&time1.duration.value = *(_OWORD *)(a1 + 480);
            time1.duration.epoch = *(_QWORD *)(a1 + 496);
            CMTimeSubtract(&v143, &v142, &time1.duration);
            *(Float64 *)(a1 + 536) = CMTimeGetSeconds(&v143);
            v121 = MEMORY[0x1E0CA2E18];
            *(_OWORD *)(a1 + 480) = *MEMORY[0x1E0CA2E18];
            *(_QWORD *)(a1 + 496) = *(_QWORD *)(v121 + 16);
          }
          goto LABEL_18;
        }
        if (objc_msgSend(v9, "count"))
          goto LABEL_18;
        if ((*(_BYTE *)(a1 + 492) & 1) == 0)
        {
          CMSampleBufferGetPresentationTimeStamp(&time1.duration, (CMSampleBufferRef)a2);
          *(_OWORD *)(a1 + 480) = *(_OWORD *)&time1.duration.value;
          *(_QWORD *)(a1 + 496) = time1.duration.epoch;
        }
        v20 = 564;
LABEL_247:
        ++*(_DWORD *)(a1 + v20);
        return;
      }
      CMSampleBufferGetPresentationTimeStamp(&v144, (CMSampleBufferRef)a2);
      *(_OWORD *)&time1.duration.value = *(_OWORD *)(a1 + 456);
      time1.duration.epoch = *(_QWORD *)(a1 + 472);
      CMTimeSubtract(&v145, &v144, &time1.duration);
      *(Float64 *)(a1 + 528) = CMTimeGetSeconds(&v145);
LABEL_241:
      v120 = MEMORY[0x1E0CA2E18];
      *(_OWORD *)(a1 + 456) = *MEMORY[0x1E0CA2E18];
      *(_QWORD *)(a1 + 472) = *(_QWORD *)(v120 + 16);
      goto LABEL_242;
    }
  }
LABEL_18:
  v13 = *(_QWORD *)(a1 + 624);
  if (v13 <= a3 && *(_QWORD *)(a1 + 632) + v13 > a3)
  {
    if (*(_QWORD *)(a1 + 712))
    {
      if ((*(_BYTE *)(a1 + 700) & 1) == 0)
        return;
      *(_OWORD *)&time1.duration.value = *(_OWORD *)a4;
      time1.duration.epoch = *(_QWORD *)(a4 + 16);
      *(_OWORD *)time2 = *(_OWORD *)(a1 + 688);
      *(_QWORD *)&time2[16] = *(_QWORD *)(a1 + 704);
      if (CMTimeCompare(&time1.duration, (CMTime *)time2) < 0)
        return;
    }
  }
  v125 = v10;
  objc_msgSend(v9, "addObject:", a2);
  if (a3 == 1 && *(_BYTE *)(a1 + 680))
    *(_BYTE *)(a1 + 570) = 1;
  if (objc_msgSend(v9, "count") == 1)
  {
    if (*(_QWORD *)(a1 + 656) == a3)
    {
      if (*(_BYTE *)(a1 + 680) && !*(_BYTE *)(a1 + 570))
      {
        objc_msgSend(v9, "removeObjectAtIndex:", 0);
        goto LABEL_60;
      }
      v14 = *(_QWORD *)(a4 + 16);
      *(_OWORD *)(a1 + 264) = *(_OWORD *)a4;
      *(_QWORD *)(a1 + 280) = v14;
      if (*(_QWORD *)(a1 + 728))
      {
        *(_QWORD *)(a1 + 752) = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a2, key, 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D082E8]), "unsignedLongLongValue");
        *(_BYTE *)(a1 + 768) = 0;
      }
    }
    else
    {
      if (*(_QWORD *)(a1 + 632) + *(_QWORD *)(a1 + 624) <= a3)
        goto LABEL_60;
      *(_OWORD *)&time1.duration.value = *(_OWORD *)(a1 + 288);
      time1.duration.epoch = *(_QWORD *)(a1 + 304);
      *(_OWORD *)time2 = *(_OWORD *)a4;
      *(_QWORD *)&time2[16] = *(_QWORD *)(a4 + 16);
      if ((CMTimeCompare(&time1.duration, (CMTime *)time2) & 0x80000000) == 0)
        goto LABEL_60;
      v21 = *(_QWORD *)(a4 + 16);
      *(_OWORD *)(a1 + 288) = *(_OWORD *)a4;
      *(_QWORD *)(a1 + 304) = v21;
    }
    v22 = objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:", *(_QWORD *)(a1 + 656));
    v23 = a1 + 264;
    if ((*(_BYTE *)(a1 + 276) & 1) != 0)
    {
      v24 = (void *)v22;
      v25 = MEMORY[0x1E0CA2E18];
      do
      {
        *(_OWORD *)&time1.duration.value = *(_OWORD *)(a1 + 288);
        time1.duration.epoch = *(_QWORD *)(a1 + 304);
        *(_OWORD *)time2 = *(_OWORD *)v23;
        *(_QWORD *)&time2[16] = *(_QWORD *)(v23 + 16);
        if (CMTimeCompare(&time1.duration, (CMTime *)time2) < 1)
          break;
        objc_msgSend(v24, "removeObjectAtIndex:", 0);
        v26 = (_OWORD *)(a1 + 264);
        if (objc_msgSend(v24, "count"))
        {
          CMSampleBufferGetPresentationTimeStamp(&time1.duration, (CMSampleBufferRef)objc_msgSend(v24, "firstObject"));
          *v26 = *(_OWORD *)&time1.duration.value;
          *(_QWORD *)(a1 + 280) = time1.duration.epoch;
        }
        else
        {
          *v26 = *(_OWORD *)v25;
          *(_QWORD *)(a1 + 280) = *(_QWORD *)(v25 + 16);
          *(_BYTE *)(a1 + 571) = 0;
        }
        v23 = a1 + 264;
      }
      while ((*(_BYTE *)(a1 + 276) & 1) != 0);
    }
  }
LABEL_60:
  if ((*(_BYTE *)(a1 + 276) & 1) == 0)
    return;
  if (*(_QWORD *)(a1 + 632) + *(_QWORD *)(a1 + 624))
  {
    v28 = 0;
    do
    {
      if (v28 != *(_QWORD *)(a1 + 656))
      {
        v29 = (void *)objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:", v28);
        v30 = v29;
        if (*(_BYTE *)(a1 + 680))
        {
          if (v28 == 1 && !*(_BYTE *)(a1 + 571))
          {
            if (objc_msgSend(v29, "count"))
            {
              memset(&time1, 0, 24);
              CMSampleBufferGetPresentationTimeStamp(&time1.duration, (CMSampleBufferRef)objc_msgSend(v30, "objectAtIndexedSubscript:", 0));
              *(_OWORD *)time2 = *(_OWORD *)&time1.duration.value;
              *(_QWORD *)&time2[16] = time1.duration.epoch;
              *(_OWORD *)&rhs.duration.value = *(_OWORD *)(a1 + 264);
              rhs.duration.epoch = *(_QWORD *)(a1 + 280);
              if (CMTimeCompare((CMTime *)time2, &rhs.duration) <= 0)
                *(_BYTE *)(a1 + 571) = 1;
            }
          }
        }
        fcn_getEndingPTSOfFirstBufferInStagingQueue(v30, (uint64_t)&time1);
        rhs.duration.value = time1.duration.value;
        flags = time1.duration.flags;
        rhs.duration.timescale = time1.duration.timescale;
        if ((time1.duration.flags & 1) != 0)
        {
          epoch = time1.duration.epoch;
          do
          {
            time1.duration.value = rhs.duration.value;
            time1.duration.timescale = rhs.duration.timescale;
            time1.duration.flags = flags;
            time1.duration.epoch = epoch;
            *(_OWORD *)time2 = *(_OWORD *)(a1 + 264);
            *(_QWORD *)&time2[16] = *(_QWORD *)(a1 + 280);
            if (CMTimeCompare(&time1.duration, (CMTime *)time2) > 0)
              break;
            objc_msgSend(v30, "removeObjectAtIndex:", 0);
            fcn_getEndingPTSOfFirstBufferInStagingQueue(v30, (uint64_t)&time1);
            rhs.duration.value = time1.duration.value;
            flags = time1.duration.flags;
            rhs.duration.timescale = time1.duration.timescale;
            epoch = time1.duration.epoch;
          }
          while ((time1.duration.flags & 1) != 0);
        }
      }
      ++v28;
      v27 = *(_QWORD *)(a1 + 632) + *(_QWORD *)(a1 + 624);
    }
    while (v28 < v27);
  }
  else
  {
    v27 = 0;
  }
  for (; v27 < *(_QWORD *)(a1 + 608); ++v27)
  {
    if (v27 != *(_QWORD *)(a1 + 656))
    {
      v33 = (void *)objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:", v27);
      for (i = v33; objc_msgSend(v33, "count"); v33 = i)
      {
        CMSampleBufferGetPresentationTimeStamp(&v141, (CMSampleBufferRef)objc_msgSend(i, "objectAtIndexedSubscript:", 0));
        *(_OWORD *)&time1.duration.value = *(_OWORD *)(a1 + 264);
        time1.duration.epoch = *(_QWORD *)(a1 + 280);
        if ((CMTimeCompare(&v141, &time1.duration) & 0x80000000) == 0)
          break;
        objc_msgSend(i, "removeObjectAtIndex:", 0);
      }
    }
  }
  if (*(_BYTE *)(a1 + 571))
    goto LABEL_85;
  if (!(*(_QWORD *)(a1 + 632) + *(_QWORD *)(a1 + 624)))
  {
    v48 = 0;
    goto LABEL_150;
  }
  v48 = 0;
  do
  {
    if (v48 != *(_QWORD *)(a1 + 656))
    {
      fcn_getEndingPTSOfFirstBufferInStagingQueue((void *)objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:", v48), (uint64_t)v140);
      if ((v140[12] & 1) == 0)
        break;
    }
    ++v48;
  }
  while (v48 < *(_QWORD *)(a1 + 632) + *(_QWORD *)(a1 + 624));
  if (!*(_BYTE *)(a1 + 571))
  {
LABEL_150:
    if (*(_QWORD *)(a1 + 632) + *(_QWORD *)(a1 + 624) != v48)
      return;
  }
LABEL_85:
  *(_DWORD *)(a1 + 156) = 1;
  *(_QWORD *)(a1 + 752) = 0;
  if (*(_QWORD *)(a1 + 624))
  {
    v35 = 0;
    p_decodeTimeStamp = &time1.decodeTimeStamp;
    allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    while (1)
    {
      if (v35 == *(_QWORD *)(a1 + 656))
        goto LABEL_98;
      v37 = p_decodeTimeStamp;
      v38 = (void *)objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:", v35);
      v39 = (opaqueCMSampleBuffer *)objc_msgSend(v38, "firstObject");
      CMSampleBufferGetPresentationTimeStamp(&v139, v39);
      *(_OWORD *)&time1.duration.value = *(_OWORD *)(a1 + 264);
      time1.duration.epoch = *(_QWORD *)(a1 + 280);
      v40 = CMTimeCompare(&v139, &time1.duration);
      p_decodeTimeStamp = v37;
      if ((v40 & 0x80000000) == 0)
        goto LABEL_98;
      if ((unint64_t)objc_msgSend(v38, "count") >= 2)
      {
        v41 = (opaqueCMSampleBuffer *)objc_msgSend(v38, "objectAtIndexedSubscript:", 1);
        memset(&time1, 0, 24);
        CMSampleBufferGetPresentationTimeStamp(&time1.duration, v41);
        if ((time1.duration.flags & 1) != 0)
        {
          *(_OWORD *)time2 = *(_OWORD *)&time1.duration.value;
          *(_QWORD *)&time2[16] = time1.duration.epoch;
          *(_OWORD *)&rhs.duration.value = *(_OWORD *)(a1 + 264);
          rhs.duration.epoch = *(_QWORD *)(a1 + 280);
          CMTimeSubtract(&v138, (CMTime *)time2, &rhs.duration);
          if (CMTimeGetSeconds(&v138) < 0.002)
          {
            objc_msgSend(v38, "removeObjectAtIndex:", 0);
            v39 = v41;
          }
        }
      }
      target = *(CMTime *)(a1 + 264);
      sampleBufferOut = 0;
      timingArrayEntriesNeededOut = 0;
      NumSamples = CMSampleBufferGetNumSamples(v39);
      CMSampleBufferGetSampleTimingInfoArray(v39, 0, 0, &timingArrayEntriesNeededOut);
      if (timingArrayEntriesNeededOut != 1
        || NumSamples != 1
        || (memset(&time1, 0, sizeof(time1)), CMSampleBufferGetSampleTimingInfo(v39, 0, &time1)))
      {
        a2 = sbuf;
        goto LABEL_97;
      }
      v44 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 48);
      *(_OWORD *)&time2[32] = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 32);
      *(_OWORD *)&time2[48] = v44;
      *(_QWORD *)v154 = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 64);
      v45 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 16);
      *(_OWORD *)time2 = *MEMORY[0x1E0CA2E90];
      *(_OWORD *)&time2[16] = v45;
      a2 = sbuf;
      if ((time1.presentationTimeStamp.flags & 1) != 0)
      {
        *(CMTime *)&time2[24] = target;
        if (target.timescale != time1.presentationTimeStamp.timescale)
        {
          rhs.duration = target;
          CMTimeConvertScale((CMTime *)&time2[24], &rhs.duration, time1.presentationTimeStamp.timescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
        }
      }
      if ((time1.decodeTimeStamp.flags & 1) != 0)
      {
        *(_OWORD *)&rhs.duration.value = *(_OWORD *)&v37->value;
        rhs.duration.epoch = v37->epoch;
        presentationTimeStamp = target;
        if (CMTimeCompare(&rhs.duration, &presentationTimeStamp) <= 0)
        {
          *(_OWORD *)&time2[48] = *(_OWORD *)&v37->value;
          *(_QWORD *)v154 = v37->epoch;
          a2 = sbuf;
        }
        else
        {
          *(_OWORD *)&time2[48] = *(_OWORD *)&target.value;
          *(_QWORD *)v154 = target.epoch;
          a2 = sbuf;
          if (target.timescale != time1.decodeTimeStamp.timescale)
          {
            presentationTimeStamp = target;
            CMTimeConvertScale(&rhs.duration, &presentationTimeStamp, time1.decodeTimeStamp.timescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
            *(_OWORD *)&time2[48] = *(_OWORD *)&rhs.duration.value;
            *(_QWORD *)v154 = rhs.duration.epoch;
          }
        }
      }
      if ((time1.duration.flags & 1) != 0)
      {
        rhs.duration = target;
        presentationTimeStamp = time1.presentationTimeStamp;
        CMTimeSubtract(&duration, &rhs.duration, &presentationTimeStamp);
        presentationTimeStamp = time1.duration;
        CMTimeSubtract(&rhs.duration, &presentationTimeStamp, &duration);
        *(_OWORD *)time2 = *(_OWORD *)&rhs.duration.value;
        *(_QWORD *)&time2[16] = rhs.duration.epoch;
        presentationTimeStamp = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
        if (CMTimeCompare(&rhs.duration, &presentationTimeStamp) <= 0)
        {
          *(_OWORD *)time2 = *MEMORY[0x1E0CA2E18];
          v46 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
          goto LABEL_113;
        }
        if (*(_DWORD *)&time2[8] != time1.duration.timescale)
        {
          presentationTimeStamp = *(CMTime *)time2;
          CMTimeConvertScale(&rhs.duration, &presentationTimeStamp, time1.duration.timescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
          *(_OWORD *)time2 = *(_OWORD *)&rhs.duration.value;
          v46 = rhs.duration.epoch;
LABEL_113:
          *(_QWORD *)&time2[16] = v46;
        }
      }
      CMSampleBufferCreateCopyWithNewTiming(allocator, v39, 1, (const CMSampleTimingInfo *)time2, &sampleBufferOut);
      v47 = sampleBufferOut;
      p_decodeTimeStamp = v37;
      if (!sampleBufferOut)
        goto LABEL_98;
      objc_msgSend(v38, "replaceObjectAtIndex:withObject:", 0, sampleBufferOut);
      CFRelease(v47);
LABEL_97:
      p_decodeTimeStamp = v37;
LABEL_98:
      ++v35;
      v43 = *(_QWORD *)(a1 + 624);
      if (v35 >= v43)
        goto LABEL_119;
    }
  }
  v43 = 0;
LABEL_119:
  v49 = *(_QWORD *)(a1 + 632);
  v50 = v49 + v43;
  if (v43 < v49 + v43)
  {
    do
    {
      if (v43 != *(_QWORD *)(a1 + 656))
      {
        v51 = (void *)objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:", v43);
        v52 = (opaqueCMSampleBuffer *)objc_msgSend(v51, "firstObject");
        if (v52)
        {
          v53 = v52;
          *(_BYTE *)(a1 + 573) = 1;
          CMSampleBufferGetPresentationTimeStamp(&v136, v52);
          *(_OWORD *)&time1.duration.value = *(_OWORD *)(a1 + 264);
          time1.duration.epoch = *(_QWORD *)(a1 + 280);
          if (CMTimeCompare(&v136, &time1.duration) < 0)
          {
            *(_OWORD *)&time1.duration.value = *(_OWORD *)(a1 + 264);
            time1.duration.epoch = *(_QWORD *)(a1 + 280);
            AudioBufferTrimmedToStartTime = fcn_createAudioBufferTrimmedToStartTime(v53, &time1.duration);
            if (AudioBufferTrimmedToStartTime)
            {
              v55 = AudioBufferTrimmedToStartTime;
              objc_msgSend(v51, "replaceObjectAtIndex:withObject:", 0, AudioBufferTrimmedToStartTime);
              CFRelease(v55);
            }
            else
            {
              objc_msgSend(v51, "removeObjectAtIndex:", 0);
            }
          }
        }
      }
      ++v43;
      v50 = *(_QWORD *)(a1 + 632) + *(_QWORD *)(a1 + 624);
    }
    while (v43 < v50);
    a2 = sbuf;
  }
  for (; v50 < *(_QWORD *)(a1 + 608); ++v50)
  {
    if (v50 != *(_QWORD *)(a1 + 656))
    {
      v56 = (void *)objc_msgSend(*(id *)(a1 + 96), "objectAtIndexedSubscript:", v50);
      if (!objc_msgSend(v56, "count")
        || (CMSampleBufferGetPresentationTimeStamp(&v135, (CMSampleBufferRef)objc_msgSend(v56, "objectAtIndexedSubscript:", 0)), *(_OWORD *)&time1.duration.value = *(_OWORD *)(a1 + 264), time1.duration.epoch = *(_QWORD *)(a1 + 280), CMTimeCompare(&v135, &time1.duration) >= 1))
      {
        *(_OWORD *)&time1.duration.value = *(_OWORD *)(a1 + 264);
        time1.duration.epoch = *(_QWORD *)(a1 + 280);
        v57 = -[BWFileCoordinatorNode _createEmptyMetadataSBufWithPTS:forInputIndex:]((CMSampleBufferRef)a1, (uint64_t)&time1, v50);
        if (v57)
        {
          v58 = v57;
          objc_msgSend(v56, "insertObject:atIndex:", v57, 0);
          CFRelease(v58);
        }
      }
    }
  }
  if ((*(_BYTE *)(a1 + 204) & 1) != 0 && (*(_BYTE *)(a1 + 228) & 1) != 0)
  {
    memset(&time1, 0, 24);
    *(_OWORD *)time2 = *(_OWORD *)(a1 + 192);
    *(_QWORD *)&time2[16] = *(_QWORD *)(a1 + 208);
    *(_OWORD *)&rhs.duration.value = *(_OWORD *)(a1 + 216);
    rhs.duration.epoch = *(_QWORD *)(a1 + 232);
    CMTimeAdd(&time1.duration, (CMTime *)time2, &rhs.duration);
    if ((*(_BYTE *)(a1 + 180) & 1) != 0)
    {
      *(_OWORD *)&rhs.duration.value = *(_OWORD *)&time1.duration.value;
      rhs.duration.epoch = time1.duration.epoch;
      presentationTimeStamp = *(CMTime *)(a1 + 168);
      CMTimeSubtract((CMTime *)time2, &rhs.duration, &presentationTimeStamp);
      *(_OWORD *)&time1.duration.value = *(_OWORD *)time2;
      time1.duration.epoch = *(_QWORD *)&time2[16];
    }
    *(_OWORD *)&rhs.duration.value = *(_OWORD *)(a1 + 264);
    rhs.duration.epoch = *(_QWORD *)(a1 + 280);
    presentationTimeStamp = time1.duration;
    CMTimeSubtract((CMTime *)time2, &rhs.duration, &presentationTimeStamp);
    *(_OWORD *)(a1 + 168) = *(_OWORD *)time2;
    *(_QWORD *)(a1 + 184) = *(_QWORD *)&time2[16];
  }
  v59 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 48);
  *(_OWORD *)&rhs.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 32);
  *(_OWORD *)&rhs.decodeTimeStamp.value = v59;
  rhs.decodeTimeStamp.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 64);
  v60 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 16);
  *(_OWORD *)&rhs.duration.value = *MEMORY[0x1E0CA2E90];
  *(_OWORD *)&rhs.duration.epoch = v60;
  if (*(_QWORD *)(a1 + 112)
    || (v61 = (void *)objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:", *(_QWORD *)(a1 + 656)),
        !objc_msgSend(v61, "count")))
  {
    rhs.presentationTimeStamp = *(CMTime *)(a1 + 264);
  }
  else
  {
    if ((*(_BYTE *)(a1 + 180) & 1) != 0)
    {
      CMSampleBufferGetPresentationTimeStamp(&v134, (CMSampleBufferRef)objc_msgSend(v61, "objectAtIndexedSubscript:", 0));
      *(_OWORD *)time2 = *(_OWORD *)(a1 + 168);
      *(_QWORD *)&time2[16] = *(_QWORD *)(a1 + 184);
      CMTimeSubtract(&time1.duration, &v134, (CMTime *)time2);
      *(_OWORD *)&rhs.presentationTimeStamp.value = *(_OWORD *)&time1.duration.value;
      v62 = time1.duration.epoch;
    }
    else
    {
      *(_OWORD *)&rhs.presentationTimeStamp.value = *(_OWORD *)(a1 + 264);
      v62 = *(_QWORD *)(a1 + 280);
    }
    rhs.presentationTimeStamp.epoch = v62;
  }
  target.value = 0;
  v63 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (!CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 1u, 0, 0, 0, 0, 1, &rhs, 0, 0, (CMSampleBufferRef *)&target))
  {
    v64 = objc_msgSend((id)CMGetAttachment(a2, CFSTR("VariableFrameRateInfo"), 0), "count");
    if (v64 && dword_1ECFE94B0)
    {
      LODWORD(presentationTimeStamp.value) = 0;
      LOBYTE(duration.value) = 0;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      value = presentationTimeStamp.value;
      if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, duration.value))
        v67 = value;
      else
        v67 = value & 0xFFFFFFFE;
      if (v67)
      {
        *(_DWORD *)time2 = 136315394;
        *(_QWORD *)&time2[4] = "-[BWFileCoordinatorNode _doStartingToRecordWithSBuf:inputIndex:sbufPTS:]";
        *(_WORD *)&time2[12] = 2048;
        *(_QWORD *)&time2[14] = a1;
        LODWORD(v123) = 22;
        sampleTimingArray = (CMSampleTimingInfo *)time2;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      a2 = sbuf;
    }
    v68 = *(const void **)(a1 + 112);
    v69 = &__block_descriptor_57_e8_32o40r_e5_v8__0lr40l8s32l8;
    if (v68)
    {
      if (dword_1ECFE94B0)
      {
        LODWORD(presentationTimeStamp.value) = 0;
        LOBYTE(duration.value) = 0;
        v70 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v71 = presentationTimeStamp.value;
        if (os_log_type_enabled(v70, duration.value))
          v72 = v71;
        else
          v72 = v71 & 0xFFFFFFFE;
        if (v72)
        {
          v73 = objc_msgSend(*(id *)(a1 + 112), "settingsID");
          *(_OWORD *)&time1.duration.value = *(_OWORD *)(a1 + 264);
          time1.duration.epoch = *(_QWORD *)(a1 + 280);
          v74 = CMTimeGetSeconds(&time1.duration);
          v75 = *(_DWORD *)(a1 + 552);
          v76 = *(_DWORD *)(a1 + 556);
          v77 = *(_QWORD *)(a1 + 528);
          v78 = *(_DWORD *)(a1 + 560);
          v79 = *(_QWORD *)(a1 + 536);
          v80 = *(_DWORD *)(a1 + 564);
          *(_DWORD *)time2 = 136317698;
          *(_QWORD *)&time2[4] = "-[BWFileCoordinatorNode _doStartingToRecordWithSBuf:inputIndex:sbufPTS:]";
          *(_WORD *)&time2[12] = 2048;
          *(_QWORD *)&time2[14] = a1;
          *(_WORD *)&time2[22] = 2112;
          *(_QWORD *)&time2[24] = 0x1E495A078;
          *(_WORD *)&time2[32] = 2048;
          *(_QWORD *)&time2[34] = v73;
          *(_WORD *)&time2[42] = 2048;
          *(Float64 *)&time2[44] = v74;
          *(_WORD *)&time2[52] = 1024;
          *(_DWORD *)&time2[54] = v75;
          *(_WORD *)&time2[58] = 1024;
          *(_DWORD *)&time2[60] = v76;
          *(_WORD *)v154 = 2048;
          *(_QWORD *)&v154[2] = v77;
          v155 = 1024;
          v156 = v78;
          v157 = 2048;
          v158 = v79;
          v159 = 1024;
          v160 = v80;
          LODWORD(v123) = 96;
          sampleTimingArray = (CMSampleTimingInfo *)time2;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v68 = *(const void **)(a1 + 112);
        a2 = sbuf;
      }
      CMSetAttachment((CMAttachmentBearerRef)target.value, CFSTR("RecordingSettings"), v68, 1u);
      v87 = *(const void **)(a1 + 144);
      if (v87)
        CMSetAttachment((CMAttachmentBearerRef)target.value, CFSTR("RecordingVideoSettings"), v87, 1u);
      if (*(float *)(a1 + 152) > 0.0)
        CMSetAttachment((CMAttachmentBearerRef)target.value, CFSTR("RecordingMaxVideoFrameRate"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), 1u);
      v88 = CFSTR("FileWriterAction");
      CMSetAttachment((CMAttachmentBearerRef)target.value, CFSTR("FileWriterAction"), CFSTR("Start"), 1u);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (FigDebugIsInternalBuild())
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v89 = *(void **)(a1 + 112);
            v90 = (void *)objc_msgSend(v89, "movieLevelMetadata");
            if (v64)
              v91 = 60;
            else
              v91 = (int)*(float *)(a1 + 152);
            MovieLevelMetadataWithVariableFrameRate = (void *)FigCaptureMetadataUtilitiesCreateMovieLevelMetadataWithVariableFrameRate(v90, v64 != 0, v91);
            objc_msgSend(v89, "setMovieLevelMetadata:", MovieLevelMetadataWithVariableFrameRate);

          }
        }
        if (*(_QWORD *)(a1 + 656) < *(_QWORD *)(a1 + 624))
        {
          v93 = (void *)CMGetAttachment((CMAttachmentBearerRef)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:"), "firstObject"), key, 0);
          v94 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v95 = *MEMORY[0x1E0D069B8];
          v96 = objc_msgSend(v93, "objectForKeyedSubscript:", *MEMORY[0x1E0D069B8]);
          if (v96)
            objc_msgSend(v94, "setObject:forKeyedSubscript:", v96, v95);
          v97 = *MEMORY[0x1E0D06D00];
          v98 = objc_msgSend(v93, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00], sampleTimingArray, v123);
          if (v98)
            objc_msgSend(v94, "setObject:forKeyedSubscript:", v98, v97);
          a2 = sbuf;
          if (objc_msgSend(v94, "count"))
            CMSetAttachment((CMAttachmentBearerRef)target.value, key, v94, 1u);
        }
      }
      *(_QWORD *)(a1 + 120) = objc_msgSend(*(id *)(a1 + 112), "settingsID", sampleTimingArray, v123);
      *(_BYTE *)(a1 + 141) = v125;
      if (v125 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        v99 = objc_msgSend(*(id *)(a1 + 112), "isIrisMovieRecording");
      else
        v99 = 0;
      *(_BYTE *)(a1 + 142) = v99;
      if (*(_BYTE *)(a1 + 682))
      {
        objc_opt_class();
        v100 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(*(id *)(a1 + 112), "spatialOverCaptureMovieURL") != 0;
        *(_BYTE *)(a1 + 683) = v100;
      }
      -[BWFileCoordinatorNode _releaseSettings](a1);
    }
    else
    {
      v81 = (CFTypeRef *)&__block_descriptor_57_e8_32o40r_e5_v8__0lr40l8s32l8;
      if (dword_1ECFE94B0)
      {
        LODWORD(presentationTimeStamp.value) = 0;
        LOBYTE(duration.value) = 0;
        v82 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v83 = presentationTimeStamp.value;
        if (os_log_type_enabled(v82, duration.value))
          v84 = v83;
        else
          v84 = v83 & 0xFFFFFFFE;
        if (v84)
        {
          v85 = *(_QWORD *)(a1 + 120);
          time1.duration = rhs.presentationTimeStamp;
          v86 = CMTimeGetSeconds(&time1.duration);
          *(_DWORD *)time2 = 136316162;
          *(_QWORD *)&time2[4] = "-[BWFileCoordinatorNode _doStartingToRecordWithSBuf:inputIndex:sbufPTS:]";
          *(_WORD *)&time2[12] = 2048;
          *(_QWORD *)&time2[14] = a1;
          *(_WORD *)&time2[22] = 2112;
          *(_QWORD *)&time2[24] = 0x1E495A0D8;
          *(_WORD *)&time2[32] = 2048;
          *(_QWORD *)&time2[34] = v85;
          *(_WORD *)&time2[42] = 2048;
          *(Float64 *)&time2[44] = v86;
          v69 = &__block_descriptor_57_e8_32o40r_e5_v8__0lr40l8s32l8;
          LODWORD(v123) = 52;
          sampleTimingArray = (CMSampleTimingInfo *)time2;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        a2 = sbuf;
        v81 = (CFTypeRef *)&__block_descriptor_57_e8_32o40r_e5_v8__0lr40l8s32l8;
      }
      v88 = (const __CFString *)*((_QWORD *)v69 + 448);
      CMSetAttachment((CMAttachmentBearerRef)target.value, v88, v81[452], 1u);
    }
    keya = (CFStringRef)CMGetAttachment((CMAttachmentBearerRef)target.value, v88, 0);
    memset(time2, 0, 24);
    v101 = (const __CFDictionary *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05D00], 0);
    CMTimeMakeFromDictionary((CMTime *)time2, v101);
    memset(&presentationTimeStamp, 0, sizeof(presentationTimeStamp));
    UpTimeNanoseconds = FigGetUpTimeNanoseconds();
    CMTimeMake(&presentationTimeStamp, UpTimeNanoseconds, 1000000000);
    if (*MEMORY[0x1E0CA1FC0] == 1)
    {
      *(_OWORD *)&time1.duration.value = *(_OWORD *)time2;
      time1.duration.epoch = *(_QWORD *)&time2[16];
      CMTimeGetSeconds(&time1.duration);
      time1.duration = presentationTimeStamp;
      CMTimeGetSeconds(&time1.duration);
      FormatDescription = CMSampleBufferGetFormatDescription((CMSampleBufferRef)a2);
      CMFormatDescriptionGetMediaType(FormatDescription);
      kdebug_trace();
    }
    v132 = 0u;
    v133 = 0u;
    v130 = 0u;
    v131 = 0u;
    v104 = (void *)objc_msgSend((id)a1, "outputs", sampleTimingArray, v123);
    v105 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v130, v152, 16);
    if (v105)
    {
      v106 = v105;
      v107 = *(_QWORD *)v131;
      do
      {
        for (j = 0; j != v106; ++j)
        {
          if (*(_QWORD *)v131 != v107)
            objc_enumerationMutation(v104);
          v109 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * j);
          time1.duration.value = 0;
          Copy = CMSampleBufferCreateCopy(v63, (CMSampleBufferRef)target.value, (CMSampleBufferRef *)&time1);
          if (!(_DWORD)Copy)
            objc_msgSend(v109, "emitSampleBuffer:", time1.duration.value);
          if (time1.duration.value)
            CFRelease((CFTypeRef)time1.duration.value);
        }
        v106 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v130, v152, 16);
      }
      while (v106);
    }
    else
    {
      Copy = 0;
    }
    CFRelease((CFTypeRef)target.value);
    v111 = *(void **)(a1 + 720);
    if (v111)
    {
      v112 = *(_QWORD *)(a1 + 120);
      *(_OWORD *)&time1.duration.value = *(_OWORD *)(a1 + 264);
      time1.duration.epoch = *(_QWORD *)(a1 + 280);
      objc_msgSend(v111, "fileCoordinator:sentMarkerBufferForFileWriterAction:withPTS:settingsID:errorCode:", a1, keya, &time1, v112, Copy);
    }
  }
  v113 = *(_QWORD *)(a1 + 608);
  *(_OWORD *)sbufa = *MEMORY[0x1E0CA2E30];
  v114 = *(_QWORD *)(MEMORY[0x1E0CA2E30] + 16);
  do
  {
    *(_OWORD *)&time1.duration.value = *(_OWORD *)sbufa;
    time1.duration.epoch = v114;
    if (v113)
    {
      v115 = 0;
      do
      {
        v116 = (void *)objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:", v115);
        if (objc_msgSend(v116, "count"))
        {
          v117 = (opaqueCMSampleBuffer *)objc_msgSend(v116, "firstObject");
          memset(time2, 0, 24);
          CMSampleBufferGetPresentationTimeStamp((CMTime *)time2, v117);
          presentationTimeStamp = *(CMTime *)time2;
          duration = time1.duration;
          if (CMTimeCompare(&presentationTimeStamp, &duration) < 0)
          {
            *(_OWORD *)&time1.duration.value = *(_OWORD *)time2;
            time1.duration.epoch = *(_QWORD *)&time2[16];
            v113 = v115;
          }
        }
        ++v115;
        v118 = *(_QWORD *)(a1 + 608);
      }
      while (v115 < v118);
      if (v113 < v118)
        -[BWFileCoordinatorNode _emitStagedBufferForIndex:stoppingOrPausing:]((id *)a1, v113);
    }
    v119 = v113 >= *(_QWORD *)(a1 + 608);
    v113 = *(_QWORD *)(a1 + 608);
  }
  while (!v119);
  -[BWFileCoordinatorNode _flushPendingIrisRequestMarkerBuffers](a1);
}

- (opaqueCMSampleBuffer)_copyFirstValidLowLatencyAudioBuffer:(uint64_t)a3 inputIndex:(CMTime *)a4 sbufPTS:
{
  uint64_t v7;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  opaqueCMSampleBuffer *v10;
  opaqueCMSampleBuffer *started;
  CMTime v13;
  CMTime lhs;
  CMTime time1;
  CMTime v16;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v7 = MEMORY[0x1E0CA2E18];
  value = *MEMORY[0x1E0CA2E18];
  timescale = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
  memset(&v16, 0, sizeof(v16));
  CMSampleBufferGetDuration(&v16, sbuf);
  if ((v16.flags & 1) != 0)
  {
    CMSampleBufferGetPresentationTimeStamp(&lhs, sbuf);
    v13 = v16;
    CMTimeAdd(&time1, &lhs, &v13);
    value = time1.value;
    flags = time1.flags;
    timescale = time1.timescale;
    epoch = time1.epoch;
    if ((time1.flags & 1) == 0)
      return 0;
  }
  else
  {
    flags = *(_DWORD *)(v7 + 12);
    epoch = *(_QWORD *)(v7 + 16);
    if ((flags & 1) == 0)
      return 0;
  }
  time1.value = value;
  time1.timescale = timescale;
  time1.flags = flags;
  time1.epoch = epoch;
  v13 = *(CMTime *)(a1 + 264);
  if (CMTimeCompare(&time1, &v13) < 1)
    return 0;
  *(_BYTE *)(a1 + 573) = 1;
  time1 = *a4;
  v13 = *(CMTime *)(a1 + 264);
  if ((CMTimeCompare(&time1, &v13) & 0x80000000) == 0)
    return (opaqueCMSampleBuffer *)CFRetain(sbuf);
  time1 = *(CMTime *)(a1 + 264);
  started = fcn_createAudioBufferTrimmedToStartTime(sbuf, &time1);
  v10 = started;
  if (started)
  {
    memset(&time1, 0, sizeof(time1));
    CMSampleBufferGetPresentationTimeStamp(&time1, started);
  }
  return v10;
}

- (void)_doStoppingOrPausingWithSBuf:(unint64_t)a3 inputIndex:(uint64_t)a4 sbufPTS:
{
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _OWORD *v15;
  void *v16;
  int *v17;
  unint64_t v18;
  void *v19;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  const __CFAllocator **v25;
  unint64_t v26;
  void *v27;
  opaqueCMSampleBuffer *v28;
  opaqueCMSampleBuffer *v29;
  const void *v30;
  CMItemCount NumSamples;
  BOOL v32;
  unint64_t v33;
  unint64_t v34;
  const __CFAllocator *v35;
  void *v36;
  opaqueCMSampleBuffer *v37;
  CMItemCount v38;
  const opaqueCMFormatDescription *FormatDescription;
  const AudioStreamBasicDescription *StreamBasicDescription;
  int32_t mSampleRate;
  int32_t v42;
  CFRange v43;
  const void *v44;
  unint64_t i;
  void *v46;
  opaqueCMSampleBuffer *v47;
  CFTypeRef v48;
  unint64_t v49;
  const void *v50;
  void *v51;
  const void *v52;
  const __CFAllocator *allocator;
  CMTime v54;
  CMTime v55;
  CMTime v56;
  CMTime rhs;
  CMTime time;
  CMTime v59;
  _BYTE v60[24];
  CMSampleTimingInfo time2;
  CMTime sampleRange;
  CMTime lhs;
  CMSampleTimingInfo time1;
  CMItemCount timingArrayEntriesNeededOut;
  CMSampleBufferRef sampleBufferOut;
  CMTime duration;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v8 = (void *)objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:");
  if (!v8)
  {
    pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 600));
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Could not find staging queue for given input"), 0));
  }
  v9 = v8;
  objc_msgSend(v8, "addObject:", a2);
  if (*(_QWORD *)(a1 + 656) != a3)
  {
    if (*(_QWORD *)(a1 + 632) + *(_QWORD *)(a1 + 624) <= a3)
      goto LABEL_18;
    if (objc_msgSend(v9, "count") != 1)
      goto LABEL_18;
    *(_OWORD *)&time1.duration.value = *(_OWORD *)(a1 + 288);
    time1.duration.epoch = *(_QWORD *)(a1 + 304);
    *(_OWORD *)&time2.duration.value = *(_OWORD *)a4;
    time2.duration.epoch = *(_QWORD *)(a4 + 16);
    if ((CMTimeCompare(&time1.duration, &time2.duration) & 0x80000000) == 0)
      goto LABEL_18;
    v10 = *(_QWORD *)(a4 + 16);
    *(_OWORD *)(a1 + 288) = *(_OWORD *)a4;
    *(_QWORD *)(a1 + 304) = v10;
LABEL_11:
    v11 = objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:", *(_QWORD *)(a1 + 656));
    v12 = a1 + 360;
    if ((*(_BYTE *)(a1 + 372) & 1) != 0)
    {
      v13 = (void *)v11;
      v14 = MEMORY[0x1E0CA2E18];
      do
      {
        *(_OWORD *)&time1.duration.value = *(_OWORD *)(a1 + 288);
        time1.duration.epoch = *(_QWORD *)(a1 + 304);
        *(_OWORD *)&time2.duration.value = *(_OWORD *)v12;
        time2.duration.epoch = *(_QWORD *)(v12 + 16);
        if (CMTimeCompare(&time1.duration, &time2.duration) < 1)
          break;
        -[BWFileCoordinatorNode _emitStagedBufferForIndex:stoppingOrPausing:]((id *)a1, *(_QWORD *)(a1 + 656));
        v15 = (_OWORD *)(a1 + 360);
        if (objc_msgSend(v13, "count"))
        {
          fcn_getEndingPTSOfFirstBufferInStagingQueue(v13, (uint64_t)&time1);
          *v15 = *(_OWORD *)&time1.duration.value;
          *(_QWORD *)(a1 + 376) = time1.duration.epoch;
        }
        else
        {
          *v15 = *(_OWORD *)v14;
          *(_QWORD *)(a1 + 376) = *(_QWORD *)(v14 + 16);
        }
        v12 = a1 + 360;
      }
      while ((*(_BYTE *)(a1 + 372) & 1) != 0);
    }
    goto LABEL_18;
  }
  if ((*(_BYTE *)(a1 + 372) & 1) == 0)
  {
    fcn_getEndingPTSOfFirstBufferInStagingQueue(v9, (uint64_t)&time1);
    *(_OWORD *)(a1 + 360) = *(_OWORD *)&time1.duration.value;
    *(_QWORD *)(a1 + 376) = time1.duration.epoch;
    if ((*(_BYTE *)(a1 + 372) & 1) != 0)
      goto LABEL_11;
  }
LABEL_18:
  if ((*(_BYTE *)(a1 + 372) & 1) != 0)
  {
    if (*(_BYTE *)(a1 + 680)
      && objc_msgSend((id)objc_msgSend(*(id *)(a1 + 96), "objectAtIndexedSubscript:", 1), "count"))
    {
      *(_BYTE *)(a1 + 572) = 1;
    }
    if (*(_BYTE *)(a1 + 572))
    {
      v16 = (void *)objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:", *(_QWORD *)(a1 + 656));
      if ((unint64_t)objc_msgSend(v16, "count") >= 2)
      {
        do
          objc_msgSend(v16, "removeObjectAtIndex:", 1);
        while ((unint64_t)objc_msgSend(v16, "count") > 1);
      }
    }
    v17 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
    if (*(_QWORD *)(a1 + 608))
    {
      v18 = 0;
      do
      {
        if (v18 != *(_QWORD *)(a1 + 656))
        {
          v19 = (void *)objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:", v18);
          fcn_getEndingPTSOfFirstBufferInStagingQueue(v19, (uint64_t)&time1);
          duration.value = time1.duration.value;
          flags = time1.duration.flags;
          duration.timescale = time1.duration.timescale;
          if ((time1.duration.flags & 1) != 0)
          {
            epoch = time1.duration.epoch;
            do
            {
              time1.duration.value = duration.value;
              time1.duration.timescale = duration.timescale;
              time1.duration.flags = flags;
              time1.duration.epoch = epoch;
              *(_OWORD *)&time2.duration.value = *(_OWORD *)(a1 + 360);
              time2.duration.epoch = *(_QWORD *)(a1 + 376);
              if ((CMTimeCompare(&time1.duration, &time2.duration) & 0x80000000) == 0)
                break;
              -[BWFileCoordinatorNode _emitStagedBufferForIndex:stoppingOrPausing:]((id *)a1, v18);
              fcn_getEndingPTSOfFirstBufferInStagingQueue(v19, (uint64_t)&time1);
              duration.value = time1.duration.value;
              flags = time1.duration.flags;
              duration.timescale = time1.duration.timescale;
              epoch = time1.duration.epoch;
            }
            while ((time1.duration.flags & 1) != 0);
          }
        }
        ++v18;
      }
      while (v18 < *(_QWORD *)(a1 + 608));
    }
    v22 = *(_QWORD *)(a1 + 624);
    v23 = *(_QWORD *)(a1 + 632);
    if (v23 + v22)
    {
      v24 = 0;
      while (1)
      {
        if (v24 != *(_QWORD *)(a1 + 656))
        {
          fcn_getEndingPTSOfFirstBufferInStagingQueue((void *)objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:", v24), (uint64_t)v60);
          if ((v60[12] & 1) == 0)
            break;
        }
        ++v24;
        v22 = *(_QWORD *)(a1 + 624);
        v23 = *(_QWORD *)(a1 + 632);
        if (v24 >= v23 + v22)
          goto LABEL_41;
      }
      v22 = *(_QWORD *)(a1 + 624);
      v23 = *(_QWORD *)(a1 + 632);
    }
    else
    {
      v24 = 0;
    }
LABEL_41:
    if (v23 + v22 == v24)
    {
      v25 = (const __CFAllocator **)MEMORY[0x1E0C9AE00];
      if (v22)
      {
        v26 = 0;
        allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        do
        {
          v27 = (void *)objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:", v26, allocator);
          v28 = (opaqueCMSampleBuffer *)objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
          v29 = v28;
          if (v26 == *(_QWORD *)(a1 + 656))
          {
            memset(&time1, 0, 24);
            CMSampleBufferGetPresentationTimeStamp(&time1.duration, v28);
            *(_OWORD *)&time2.duration.value = *(_OWORD *)(a1 + 432);
            time2.duration.epoch = *(_QWORD *)(a1 + 448);
            duration = time1.duration;
            if (CMTimeCompare(&time2.duration, &duration))
            {
              *(_OWORD *)(a1 + 432) = *(_OWORD *)&time1.duration.value;
              *(_QWORD *)(a1 + 448) = time1.duration.epoch;
            }
          }
          else
          {
            CMSampleBufferGetDuration(&v59, v28);
            if ((v59.flags & 1) != 0
              || (CMSampleBufferGetPresentationTimeStamp(&rhs, v29),
                  *(_OWORD *)&time1.duration.value = *(_OWORD *)(a1 + 360),
                  time1.duration.epoch = *(_QWORD *)(a1 + 376),
                  CMTimeSubtract(&time, &time1.duration, &rhs),
                  CMTimeGetSeconds(&time) >= 0.002))
            {
              v56 = *(CMTime *)(a1 + 360);
              sampleBufferOut = 0;
              memset(&duration, 0, sizeof(duration));
              CMSampleBufferGetDuration(&duration, v29);
              if ((duration.flags & 1) != 0)
              {
                timingArrayEntriesNeededOut = 0;
                NumSamples = CMSampleBufferGetNumSamples(v29);
                CMSampleBufferGetSampleTimingInfoArray(v29, 0, 0, &timingArrayEntriesNeededOut);
                v30 = 0;
                if (timingArrayEntriesNeededOut == 1)
                {
                  v32 = NumSamples == 1;
                  v17 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
                  if (v32)
                  {
                    memset(&time1, 0, sizeof(time1));
                    v30 = 0;
                    if (!CMSampleBufferGetSampleTimingInfo(v29, 0, &time1))
                    {
                      time2 = time1;
                      lhs = v56;
                      sampleRange = time1.presentationTimeStamp;
                      CMTimeSubtract(&time2.duration, &lhs, &sampleRange);
                      CMSampleBufferCreateCopyWithNewTiming(allocator, v29, 1, &time2, &sampleBufferOut);
                      v30 = sampleBufferOut;
                    }
                  }
                }
                else
                {
                  v17 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
                }
              }
              else
              {
                v30 = CFRetain(v29);
              }
              objc_msgSend(v27, "removeAllObjects");
              if (v30)
              {
                objc_msgSend(v27, "addObject:", v30);
                CFRelease(v30);
              }
            }
            else
            {
              objc_msgSend(v27, "removeAllObjects");
            }
          }
          ++v26;
          v33 = *(_QWORD *)(a1 + 624);
        }
        while (v26 < v33);
        v23 = *(_QWORD *)(a1 + 632);
        v25 = (const __CFAllocator **)MEMORY[0x1E0C9AE00];
      }
      else
      {
        v33 = 0;
      }
      v34 = v23 + v33;
      if (v33 < v23 + v33)
      {
        v35 = *v25;
        do
        {
          if (v33 != *(_QWORD *)(a1 + 656))
          {
            v36 = (void *)objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:", v33);
            v37 = (opaqueCMSampleBuffer *)objc_msgSend(v36, "firstObject");
            v56 = *(CMTime *)(a1 + 360);
            timingArrayEntriesNeededOut = 0;
            sampleBufferOut = 0;
            v38 = CMSampleBufferGetNumSamples(v37);
            CMSampleBufferGetSampleTimingInfoArray(v37, 0, 0, &timingArrayEntriesNeededOut);
            if (timingArrayEntriesNeededOut == 1 && v38 > 1)
            {
              memset(&time1, 0, sizeof(time1));
              if (!CMSampleBufferGetSampleTimingInfo(v37, 0, &time1))
              {
                memset(&time2, 0, 24);
                CMSampleBufferGetPresentationTimeStamp(&time2.duration, v37);
                FormatDescription = CMSampleBufferGetFormatDescription(v37);
                StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(FormatDescription);
                mSampleRate = (int)StreamBasicDescription->mSampleRate;
                lhs = time2.duration;
                CMTimeConvertScale(&duration, &lhs, mSampleRate, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
                time2.duration = duration;
                v42 = (int)StreamBasicDescription->mSampleRate;
                duration = v56;
                CMTimeConvertScale(&v56, &duration, v42, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
                duration = v56;
                lhs = time2.duration;
                CMTimeSubtract(&sampleRange, &duration, &lhs);
                v43.length = sampleRange.value;
                if (sampleRange.value >= v38)
                {
                  v44 = CFRetain(v37);
                  v17 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
LABEL_76:
                  objc_msgSend(v36, "removeAllObjects");
                  if (v44)
                  {
                    objc_msgSend(v36, "addObject:", v44);
                    CFRelease(v44);
                  }
                  goto LABEL_70;
                }
                v17 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
                if (sampleRange.value > 0)
                {
                  v43.location = 0;
                  CMSampleBufferCopySampleBufferForRange(v35, v37, v43, &sampleBufferOut);
                  v44 = sampleBufferOut;
                  goto LABEL_76;
                }
              }
            }
            objc_msgSend(v36, "removeAllObjects");
          }
LABEL_70:
          ++v33;
          v34 = *(_QWORD *)(a1 + 632) + *(_QWORD *)(a1 + 624);
        }
        while (v33 < v34);
      }
      for (i = *(_QWORD *)(a1 + v17[343]); v34 < i; i = *(_QWORD *)(a1 + v17[343]))
      {
        if (v34 != *(_QWORD *)(a1 + 656))
        {
          v46 = (void *)objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:", v34);
          if (objc_msgSend(v46, "count"))
          {
            v47 = (opaqueCMSampleBuffer *)objc_msgSend(v46, "firstObject");
            CMSampleBufferGetPresentationTimeStamp(&v54, v47);
            *(_OWORD *)&time1.duration.value = *(_OWORD *)(a1 + 360);
            time1.duration.epoch = *(_QWORD *)(a1 + 376);
            CMTimeSubtract(&v55, &time1.duration, &v54);
            if (CMTimeGetSeconds(&v55) < 0.002
              || (memset(&time1, 0, 24), CMSampleBufferGetDuration(&time1.duration, v47),
                                         (time1.duration.flags & 1) != 0))
            {
              objc_msgSend(v46, "removeAllObjects");
            }
            else
            {
              v48 = CFRetain(v47);
              objc_msgSend(v46, "removeAllObjects");
              if (v48)
              {
                objc_msgSend(v46, "addObject:", v48);
                CFRelease(v48);
              }
            }
          }
        }
        ++v34;
      }
      if (i)
      {
        v49 = 0;
        v50 = (const void *)*MEMORY[0x1E0C9AE50];
        do
        {
          v51 = (void *)objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:", v49);
          if (objc_msgSend(v51, "count"))
          {
            if (v49 == *(_QWORD *)(a1 + 656) && *(_BYTE *)(a1 + 681) && *(_QWORD *)(a1 + 624))
            {
              v52 = (const void *)objc_msgSend(v51, "firstObject");
              if (v52)
                CMSetAttachment(v52, CFSTR("FinalFrameInSequence"), v50, 1u);
            }
            -[BWFileCoordinatorNode _emitStagedBufferForIndex:stoppingOrPausing:]((id *)a1, v49);
            objc_msgSend(v51, "count");
          }
          ++v49;
        }
        while (v49 < *(_QWORD *)(a1 + v17[343]));
      }
      -[BWFileCoordinatorNode _flushSampleBuffersWaitingForMotionData](a1);
      -[BWFileCoordinatorNode _finishStoppingOrPausing:withErrorCode:](a1, *(_DWORD *)(a1 + 156) != 5, *(unsigned int *)(a1 + 576));
      *(_DWORD *)(a1 + 576) = 0;
    }
  }
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  uint64_t v7;
  CMTime v8;
  CMTime time;

  if ((self->_recordingState & 0xFFFFFFFD) != 0)
  {
    if (*MEMORY[0x1E0CA1FC0] == 1)
    {
      if (a3)
        objc_msgSend(a3, "pts");
      else
        memset(&v8, 0, sizeof(v8));
      time = v8;
      CMTimeGetSeconds(&time);
      objc_msgSend(a4, "index");
      kdebug_trace();
    }
    v7 = objc_msgSend(a4, "index");
    if (v7 == -[BWNodeInput index](self->_masterInput, "index")
      && (objc_msgSend(a3, "reason") == 0x1E494EF78
       || (__CFString *)objc_msgSend(a3, "reason") == CFSTR("VideoDeviceDiscontinuity")
       || (__CFString *)objc_msgSend(a3, "reason") == CFSTR("HighFrameRateAutoFocusDiscontinuity")))
    {
      ++self->_droppedFramesCountDueToISP;
    }
  }
}

- (int)startRecordingWithSettings:(id)a3 videoSettings:(id)a4 maxFrameRate:(float)a5 stopAtPTS:(id *)a6 startAfterPTS:(id *)a7
{
  int v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;

  pthread_mutex_lock((pthread_mutex_t *)self->_stateMutex);
  if (self->_recordingState)
  {
    v13 = -16805;
  }
  else
  {
    self->_recordingState = 3;
    -[BWFileCoordinatorNode _prepareToStartRecordingWithSettings:videoSettings:maxFrameRate:]((uint64_t)self, a3, a4, a5);
    v13 = 0;
    v14 = *(_OWORD *)&a6->var0;
    self->_stopRecordingPTS.epoch = a6->var3;
    *(_OWORD *)&self->_stopRecordingPTS.value = v14;
    v15 = MEMORY[0x1E0CA2E68];
    *(_OWORD *)&self->_stopRecordingAudioOffset.value = *MEMORY[0x1E0CA2E68];
    self->_stopRecordingAudioOffset.epoch = *(_QWORD *)(v15 + 16);
    v16 = *MEMORY[0x1E0CA2E18];
    self->_stopRecordingObservedLastVideoPTS.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    *(_OWORD *)&self->_stopRecordingObservedLastVideoPTS.value = v16;
    v17 = *(_OWORD *)&a7->var0;
    self->_startAfterPTS.epoch = a7->var3;
    *(_OWORD *)&self->_startAfterPTS.value = v17;
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_stateMutex);
  return v13;
}

- (uint64_t)_prepareToStartRecordingWithSettings:(void *)a3 videoSettings:(float)a4 maxFrameRate:
{
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  _QWORD v21[5];

  if (!result)
    return result;
  v7 = result;
  v8 = MEMORY[0x1E0CA2E18];
  v9 = *MEMORY[0x1E0CA2E18];
  *(_OWORD *)(result + 240) = *MEMORY[0x1E0CA2E18];
  v10 = *(_QWORD *)(v8 + 16);
  *(_QWORD *)(result + 256) = v10;
  *(_OWORD *)(result + 384) = v9;
  *(_QWORD *)(result + 400) = v10;
  *(_OWORD *)(result + 216) = v9;
  *(_QWORD *)(result + 232) = v10;
  *(_OWORD *)(result + 192) = v9;
  *(_QWORD *)(result + 208) = v10;
  *(_OWORD *)(result + 168) = v9;
  *(_QWORD *)(result + 184) = v10;
  v11 = MEMORY[0x1E0CA2E28];
  v12 = *MEMORY[0x1E0CA2E28];
  *(_OWORD *)(result + 312) = *MEMORY[0x1E0CA2E28];
  v13 = *(_QWORD *)(v11 + 16);
  *(_QWORD *)(result + 328) = v13;
  *(_OWORD *)(result + 336) = v12;
  *(_QWORD *)(result + 352) = v13;
  *(_BYTE *)(result + 569) = 0;
  *(_QWORD *)(result + 472) = v10;
  *(_OWORD *)(result + 456) = v9;
  *(_QWORD *)(result + 496) = v10;
  *(_OWORD *)(result + 480) = v9;
  *(_QWORD *)(result + 520) = v10;
  v20 = v9;
  *(_OWORD *)(result + 504) = v9;
  *(_QWORD *)(result + 528) = 0;
  *(_BYTE *)(result + 568) = 0;
  *(_QWORD *)(result + 536) = 0;
  *(_DWORD *)(result + 552) = -1;
  *(_DWORD *)(result + 556) = -1;
  *(_DWORD *)(result + 560) = 0;
  *(_DWORD *)(result + 564) = 0;
  *(_BYTE *)(result + 769) = 0;
  *(_BYTE *)(result + 683) = 0;
  *(_BYTE *)(result + 684) = 0;
  *(_BYTE *)(result + 685) = 0;

  *(_QWORD *)(v7 + 112) = a2;
  *(_QWORD *)(v7 + 144) = a3;

  *(_QWORD *)(v7 + 784) = 0;
  *(float *)(v7 + 152) = a4;
  *(_QWORD *)(v7 + 776) = 0;
  -[BWFileCoordinatorNode _prepareToResumeRecording](v7);
  *(_BYTE *)(v7 + 140) = 0;
  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    if (*(_QWORD *)(v7 + 624))
    {
      v14 = *(void **)(v7 + 112);
      result = objc_msgSend(v14, "isIrisRecording");
      if ((_DWORD)result)
      {
        result = objc_msgSend(v14, "isIrisRecording");
        if (!(_DWORD)result)
          goto LABEL_10;
        result = objc_msgSend(v14, "isIrisMovieRecording");
        if (!(_DWORD)result)
          goto LABEL_10;
      }
    }
    else if (!*(_QWORD *)(v7 + 632))
    {
      goto LABEL_10;
    }
    *(_BYTE *)(v7 + 140) = 1;
  }
LABEL_10:
  if (*(_BYTE *)(v7 + 140) && gValidPrefersNoInterruptionsByRingtonesAndAlertsToken)
    result = -[BWFileCoordinatorNode _sendPrefersNoInterruptionsByRingtonesAndAlertsNotificationWithState:](v7, 1uLL);
  *(_OWORD *)(v7 + 688) = v20;
  *(_QWORD *)(v7 + 704) = v10;
  if (*(_QWORD *)(v7 + 712))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = objc_msgSend(a2, "videoOrientation");
    else
      v15 = 0;
    v17 = *(void **)(v7 + 712);
    v18 = objc_msgSend(*(id *)(v7 + 112), "settingsID", v20);
    v19 = *(unsigned __int8 *)(v7 + 140);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __89__BWFileCoordinatorNode__prepareToStartRecordingWithSettings_videoSettings_maxFrameRate___block_invoke;
    v21[3] = &unk_1E491F5D0;
    v21[4] = v7;
    return objc_msgSend(v17, "prepareToStartRecordingWithOrientation:recordingSettingsID:prefersNoInterruptionsByRingtonesAndAlerts:completionHandler:", v15, v18, v19, v21);
  }
  else
  {
    v16 = MEMORY[0x1E0CA2E68];
    *(_OWORD *)(v7 + 688) = *MEMORY[0x1E0CA2E68];
    *(_QWORD *)(v7 + 704) = *(_QWORD *)(v16 + 16);
  }
  return result;
}

- (void)cancelStartRecordingWithSettings:(id)a3
{
  int64_t v5;
  NSArray *stagingQueues;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock((pthread_mutex_t *)self->_stateMutex);
  if (self->_recordingState == 3)
  {
    v5 = -[FigCaptureRecordingSettings settingsID](self->_settings, "settingsID");
    if (v5 == objc_msgSend(a3, "settingsID"))
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      stagingQueues = self->_stagingQueues;
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](stagingQueues, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v12;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v12 != v9)
              objc_enumerationMutation(stagingQueues);
            objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "removeAllObjects");
          }
          v8 = -[NSArray countByEnumeratingWithState:objects:count:](stagingQueues, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v8);
      }
      -[NSMutableArray removeAllObjects](self->_videoSampleBuffersWaitingForMetadata, "removeAllObjects");
      self->_pendingMotionDataSerialNumber = 0;
      self->_largestEmittedLookAheadMotionDataSerialNumber = 0;
      -[BWFileCoordinatorNode _releaseSettings]((uint64_t)self);
      -[BWFileCoordinatorNode _completeTransitionToNotRecording]((uint64_t)self);
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_stateMutex);
}

- (uint64_t)_completeTransitionToNotRecording
{
  uint64_t v1;
  BOOL v2;

  if (result)
  {
    v1 = result;
    *(_DWORD *)(result + 156) = 0;
    *(_QWORD *)(result + 120) = 0;
    *(_BYTE *)(result + 141) = 0;
    objc_msgSend(*(id *)(result + 712), "unprepareForRecording");
    if (*(_BYTE *)(v1 + 140))
      v2 = gValidPrefersNoInterruptionsByRingtonesAndAlertsToken == 0;
    else
      v2 = 1;
    if (!v2)
      -[BWFileCoordinatorNode _sendPrefersNoInterruptionsByRingtonesAndAlertsNotificationWithState:](v1, 0);
    *(_BYTE *)(v1 + 140) = 0;
    return -[BWFileCoordinatorNode _flushPendingIrisRequestMarkerBuffers](v1);
  }
  return result;
}

- (void)stopRecordingWithErrorCode:(int)a3 setupToAllowWaitingForRecordingToStop:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  pthread_mutex_lock((pthread_mutex_t *)self->_stateMutex);
  if (v4)
    -[BWFileCoordinatorNode _setupStateForWaitingForRecordingStop](&self->super.super);
  -[BWFileCoordinatorNode _stopRecordingWithErrorCode:]((uint64_t)self, v5);
  pthread_mutex_unlock((pthread_mutex_t *)self->_stateMutex);
}

- (dispatch_semaphore_t)_setupStateForWaitingForRecordingStop
{
  dispatch_semaphore_t v1;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (result)
  {
    v1 = result;
    if (HIDWORD(result[19].isa) == 1)
    {
      if (!LOBYTE(result[103].isa) && !result[102].isa)
      {
        LOBYTE(result[103].isa) = 1;
        result = dispatch_semaphore_create(0);
        v1[102].isa = (Class)result;
      }
    }
    else if (dword_1ECFE94B0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      return (dispatch_semaphore_t)fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return result;
}

- (BOOL)updateStopPTS:(id *)a3 audioOffset:(id *)a4 previousStopPTS:(id *)a5 previousAudioOffset:(id *)a6
{
  BOOL v11;
  int64_t epoch;
  __int128 v13;
  int64_t var3;
  int64_t v15;

  pthread_mutex_lock((pthread_mutex_t *)self->_stateMutex);
  if (self->_receivedFinalEnqueuedIrisReferenceRequest || (self->_recordingState | 2) != 3)
  {
    v11 = 0;
  }
  else
  {
    if (a5)
    {
      epoch = self->_stopRecordingPTS.epoch;
      *(_OWORD *)&a5->var0 = *(_OWORD *)&self->_stopRecordingPTS.value;
      a5->var3 = epoch;
    }
    if (a6)
    {
      v13 = *(_OWORD *)&self->_stopRecordingAudioOffset.value;
      a6->var3 = self->_stopRecordingAudioOffset.epoch;
      *(_OWORD *)&a6->var0 = v13;
    }
    var3 = a3->var3;
    *(_OWORD *)&self->_stopRecordingPTS.value = *(_OWORD *)&a3->var0;
    self->_stopRecordingPTS.epoch = var3;
    v15 = a4->var3;
    *(_OWORD *)&self->_stopRecordingAudioOffset.value = *(_OWORD *)&a4->var0;
    self->_stopRecordingAudioOffset.epoch = v15;
    v11 = 1;
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_stateMutex);
  return v11;
}

- (void)pauseRecording
{
  int recordingState;
  uint64_t v4;
  int64_t epoch;

  pthread_mutex_lock((pthread_mutex_t *)self->_stateMutex);
  recordingState = self->_recordingState;
  if (recordingState == 1)
  {
    v4 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&self->_masterStoppingPTS.value = *MEMORY[0x1E0CA2E18];
    self->_masterStoppingPTS.epoch = *(_QWORD *)(v4 + 16);
    epoch = self->_largestMetadataPTS.epoch;
    *(_OWORD *)&self->_largestStagedSupportingAudioVideoStagedPTS.value = *(_OWORD *)&self->_largestMetadataPTS.value;
    self->_largestStagedSupportingAudioVideoStagedPTS.epoch = epoch;
    self->_lowLatencyCanTossExtraVideoWhenStopping = 0;
    self->_recordingState = 5;
    -[BWFileCoordinatorNode _flushAllBuffersFromRecordingStagingQueues]((unint64_t)self);
  }
  else if (recordingState == 3)
  {
    -[BWFileCoordinatorNode _finishStoppingOrPausing:withErrorCode:]((uint64_t)self, 0, 0);
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_stateMutex);
}

- (void)resumeRecording
{
  pthread_mutex_lock((pthread_mutex_t *)self->_stateMutex);
  if (self->_recordingState == 2)
  {
    self->_recordingState = 3;
    -[BWFileCoordinatorNode _prepareToResumeRecording]((uint64_t)self);
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_stateMutex);
}

- (uint64_t)_prepareToResumeRecording
{
  uint64_t v1;
  uint64_t v2;

  if (result)
  {
    v1 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)(result + 264) = *MEMORY[0x1E0CA2E18];
    *(_QWORD *)(result + 280) = *(_QWORD *)(v1 + 16);
    v2 = *(_QWORD *)(result + 352);
    *(_OWORD *)(result + 288) = *(_OWORD *)(result + 336);
    *(_QWORD *)(result + 304) = v2;
    *(_BYTE *)(result + 570) = 0;
    *(_BYTE *)(result + 571) = 0;
    *(_BYTE *)(result + 573) = 0;
    if (*(_BYTE *)(result + 140))
    {
      if (gValidPrefersNoInterruptionsByRingtonesAndAlertsToken)
        return -[BWFileCoordinatorNode _sendPrefersNoInterruptionsByRingtonesAndAlertsNotificationWithState:](result, 1uLL);
    }
  }
  return result;
}

- (void)recordingTerminated:(int64_t)a3
{
  NSArray *stagingQueues;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  $95D729B680665BEAEFA1D6FCA8238556 masterStoppingPTS;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock((pthread_mutex_t *)self->_stateMutex);
  -[BWFileCoordinatorNode _flushAllBuffersFromRecordingStagingQueues]((unint64_t)self);
  if (self->_currSettingsID == a3)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    stagingQueues = self->_stagingQueues;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](stagingQueues, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(stagingQueues);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "removeAllObjects");
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](stagingQueues, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }
    -[NSMutableArray removeAllObjects](self->_videoSampleBuffersWaitingForMetadata, "removeAllObjects");
    self->_pendingMotionDataSerialNumber = 0;
    self->_largestEmittedLookAheadMotionDataSerialNumber = 0;
    -[BWFileCoordinatorNode _completeTransitionToNotRecording]((uint64_t)self);
    masterStoppingPTS = self->_masterStoppingPTS;
    -[BWFileCoordinatorNode _emitMarkerBufferForFileWriterAction:withPTS:settings:settingsID:errorCode:]((uint64_t)self, CFSTR("Terminate"), (CMTime *)&masterStoppingPTS, 0, a3, 0);
    -[BWFileCoordinatorNode _releaseSettings]((uint64_t)self);
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_stateMutex);
}

- (uint64_t)_emitMarkerBufferForFileWriterAction:(CMTime *)a3 withPTS:(const void *)a4 settings:(uint64_t)a5 settingsID:(uint64_t)a6 errorCode:
{
  _QWORD *v11;
  __int128 v12;
  CMTimeEpoch v13;
  __int128 v14;
  CMTimeEpoch epoch;
  const __CFAllocator *v16;
  unsigned int Copy;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  CMSampleTimingInfo *sampleTimingArray;
  uint64_t v27;
  uint64_t v28;
  int v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  os_log_type_t type;
  int v35;
  CMSampleTimingInfo v36;
  CMAttachmentBearerRef target;
  _BYTE v38[128];
  CMTime rhs;
  CMTime lhs;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v11 = (_QWORD *)result;
    target = 0;
    v12 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 48);
    *(_OWORD *)&v36.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 32);
    *(_OWORD *)&v36.decodeTimeStamp.value = v12;
    v13 = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 64);
    v14 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 16);
    *(_OWORD *)&v36.duration.value = *MEMORY[0x1E0CA2E90];
    *(_OWORD *)&v36.duration.epoch = v14;
    *(_OWORD *)&v36.presentationTimeStamp.value = *(_OWORD *)&a3->value;
    epoch = a3->epoch;
    v36.decodeTimeStamp.epoch = v13;
    v36.presentationTimeStamp.epoch = epoch;
    if ((*(_BYTE *)(result + 180) & 1) != 0)
    {
      lhs = *a3;
      rhs = *(CMTime *)(result + 168);
      CMTimeSubtract(&v36.presentationTimeStamp, &lhs, &rhs);
    }
    v16 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    Copy = CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 1u, 0, 0, 0, 0, 1, &v36, 0, 0, (CMSampleBufferRef *)&target);
    if (!Copy)
    {
      v29 = a6;
      v28 = a5;
      if (dword_1ECFE94B0)
      {
        v35 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        a6 = a6;
      }
      CMSetAttachment(target, CFSTR("FileWriterAction"), a2, 1u);
      if ((_DWORD)a6)
        CMSetAttachment(target, CFSTR("FileWriterStopErrorCode"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a6), 1u);
      if (a4)
        CMSetAttachment(target, CFSTR("RecordingSettings"), a4, 1u);
      if (v11[97] && (FigCFEqual() || FigCFEqual() || FigCFEqual()))
        CMSetAttachment(target, CFSTR("RecordingFrameDropsCountDueToISP"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v11[97], sampleTimingArray, v27), 1u);
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v19 = (void *)objc_msgSend(v11, "outputs", sampleTimingArray, v27);
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v31 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            lhs.value = 0;
            Copy = CMSampleBufferCreateCopy(v16, (CMSampleBufferRef)target, (CMSampleBufferRef *)&lhs);
            if (!Copy)
              objc_msgSend(v24, "emitSampleBuffer:", lhs.value);
            if (lhs.value)
              CFRelease((CFTypeRef)lhs.value);
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        }
        while (v21);
        a5 = v28;
      }
      else
      {
        Copy = 0;
      }
      LODWORD(a6) = v29;
      if (target)
        CFRelease(target);
    }
    result = v11[90];
    if (result)
    {
      if (Copy)
        v25 = Copy;
      else
        v25 = a6;
      lhs = *a3;
      return objc_msgSend((id)result, "fileCoordinator:sentMarkerBufferForFileWriterAction:withPTS:settingsID:errorCode:", v11, a2, &lhs, a5, v25);
    }
  }
  return result;
}

- (void)tryToEmitFramesWaitingForMotion
{
  pthread_mutex_lock((pthread_mutex_t *)self->_stateMutex);
  if (self->_pendingMotionDataSerialNumber)
    -[BWFileCoordinatorNode _emitSampleBuffersWaitingForMotionData]((uint64_t)self);
  pthread_mutex_unlock((pthread_mutex_t *)self->_stateMutex);
}

- (void)_emitSampleBuffersWaitingForMotionData
{
  uint64_t v2;
  const __CFString *v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (a1)
  {
    if (objc_msgSend(*(id *)(a1 + 736), "count"))
    {
      v2 = objc_msgSend(*(id *)(a1 + 728), "copyMotionDataForSerialNumber:", *(_QWORD *)(a1 + 744) + *(_QWORD *)(a1 + 752));
      if (v2)
      {
        v3 = (const __CFString *)*MEMORY[0x1E0D05CB0];
        v4 = *MEMORY[0x1E0D082E8];
        while (1)
        {
          v6 = (id)v2;
          v5 = (void *)objc_msgSend(*(id *)(a1 + 736), "firstObject");
          -[BWFileCoordinatorNode _addLookAheadMotionDataToMetadataForSampleBuffer:lookAheadMotionData:](a1, v5, v6);
          -[BWFileCoordinatorNode _emitSampleBuffer:forInput:toOutput:](a1, v5, *(void **)(a1 + 8), *(void **)(a1 + 16));
          objc_msgSend(*(id *)(a1 + 736), "removeObjectAtIndex:", 0);
          if (!objc_msgSend(*(id *)(a1 + 736), "count"))
            break;
          *(_QWORD *)(a1 + 752) = objc_msgSend((id)objc_msgSend((id)CMGetAttachment((CMAttachmentBearerRef)objc_msgSend(*(id *)(a1 + 736), "firstObject"), v3, 0), "objectForKeyedSubscript:", v4), "unsignedLongLongValue");

          v2 = objc_msgSend(*(id *)(a1 + 728), "copyMotionDataForSerialNumber:", *(_QWORD *)(a1 + 744) + *(_QWORD *)(a1 + 752));
          if (!v2)
            return;
        }
        *(_QWORD *)(a1 + 752) = 0;

      }
    }
  }
}

- (void)waitForRecordingToStopWithTimeout:(float)a3
{
  OS_dispatch_semaphore *v5;
  dispatch_time_t v6;
  intptr_t v7;
  BOOL v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  pthread_mutex_lock((pthread_mutex_t *)self->_stateMutex);
  v5 = self->_recordingStoppedSemaphore;
  pthread_mutex_unlock((pthread_mutex_t *)self->_stateMutex);
  if (v5)
  {
    v6 = dispatch_time(0, (uint64_t)(float)(a3 * 1000000000.0));
    v7 = dispatch_semaphore_wait((dispatch_semaphore_t)v5, v6);
    pthread_mutex_lock((pthread_mutex_t *)self->_stateMutex);

    self->_recordingStoppedSemaphore = 0;
    self->_haveSetupWaitingForRecordingStopState = 0;
    pthread_mutex_unlock((pthread_mutex_t *)self->_stateMutex);
    if (v7)
      v8 = dword_1ECFE94B0 == 0;
    else
      v8 = 1;
    if (!v8)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }

}

- (uint64_t)_sendPrefersNoInterruptionsByRingtonesAndAlertsNotificationWithState:(uint64_t)result
{
  if (result)
  {
    if (notify_set_state(gPrefersNoInterruptionsByRingtonesAndAlertsToken, state64))
      return FigDebugAssert3();
    result = notify_post("com.apple.avcapture.prefersnointerruptionsbyringtonesandalerts");
    if ((_DWORD)result)
      return FigDebugAssert3();
  }
  return result;
}

uint64_t __89__BWFileCoordinatorNode__prepareToStartRecordingWithSettings_videoSettings_maxFrameRate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  pthread_mutex_lock(*(pthread_mutex_t **)(*(_QWORD *)(a1 + 32) + 600));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "settingsID") == a3)
  {
    v6 = *(_QWORD *)(a1 + 32) + 688;
    v7 = *(_QWORD *)(a2 + 16);
    *(_OWORD *)v6 = *(_OWORD *)a2;
    *(_QWORD *)(v6 + 16) = v7;
  }
  return pthread_mutex_unlock(*(pthread_mutex_t **)(*(_QWORD *)(a1 + 32) + 600));
}

- (void)_irisMovieInfosFromPendingIrisRequestMarkerBuffers
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  const void *v7;
  CFTypeRef v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = *(void **)(a1 + 104);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = 0;
  v5 = *(_QWORD *)v11;
  do
  {
    for (i = 0; i != v3; ++i)
    {
      if (*(_QWORD *)v11 != v5)
        objc_enumerationMutation(v1);
      v7 = *(const void **)(*((_QWORD *)&v10 + 1) + 8 * i);
      if (!v4)
        v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = CMGetAttachment(v7, CFSTR("IrisMovieRequest"), 0);
      if (v8)
        objc_msgSend(v4, "addObject:", v8);
    }
    v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  }
  while (v3);
  return v4;
}

- (uint64_t)_clearPendingIrisRequestMarkerBuffers
{
  uint64_t v1;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    if (dword_1ECFE94B0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return objc_msgSend(*(id *)(v1 + 104), "removeAllObjects", v3, v4);
  }
  return result;
}

- (void)_addLookAheadMotionDataToMetadataForSampleBuffer:(void *)a3 lookAheadMotionData:
{
  _QWORD *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const void *v14;
  id v15;

  if (!a1)
    return;
  v6 = (_QWORD *)MEMORY[0x1E0D082E8];
  if (*(_BYTE *)(a1 + 768))
  {
    v7 = 0;
    v15 = 0;
  }
  else
  {
    v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", BWMotionDataTimeMachineKeyPrimaryMotionData), "objectForKeyedSubscript:", *MEMORY[0x1E0D082E8]), "unsignedLongLongValue");
    v9 = objc_msgSend(*(id *)(a1 + 728), "copyMotionDataForStartingSerialNumber:endingSerialNumber:", v8 - *(_QWORD *)(a1 + 744), v8 - 1);
    v7 = v9 != 0;
    if (*(_BYTE *)(a1 + 768))
      v10 = 0;
    else
      v10 = v9 == 0;
    if (v10)
      return;
    v15 = (id)v9;
  }
  v11 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", BWMotionDataTimeMachineKeyPrimaryMotionData);
  fcn_addAllLookAheadMotionDataToMetadata(a2, v11, (void *)objc_msgSend(v15, "objectForKeyedSubscript:", BWMotionDataTimeMachineKeyPrimaryMotionData));
  *(_QWORD *)(a1 + 760) = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *v6), "unsignedLongLongValue");
  v12 = objc_msgSend(a3, "objectForKeyedSubscript:", BWMotionDataTimeMachineKeySynchronizedSlaveFrameMotionData);
  if (v12)
  {
    v13 = (void *)v12;
    v14 = (const void *)fcn_synchronizedSlaveFrameForSampleBuffer(a2);
    if (v14)
      fcn_addAllLookAheadMotionDataToMetadata(v14, v13, (void *)objc_msgSend(v15, "objectForKeyedSubscript:", BWMotionDataTimeMachineKeySynchronizedSlaveFrameMotionData));
  }
  if (v7)
  {
    *(_BYTE *)(a1 + 768) = 1;

  }
}

- (uint64_t)_emitSampleBuffer:(void *)a3 forInput:(void *)a4 toOutput:
{
  uint64_t v7;
  void *v8;
  OpaqueCMClock *HostTimeClock;
  const void *v10;
  uint64_t v11;
  void *v12;
  const void *v13;
  CMTime v14;
  CMTime time;

  if (result)
  {
    v7 = result;
    v8 = (void *)MEMORY[0x1E0CB37E8];
    HostTimeClock = CMClockGetHostTimeClock();
    CMClockGetTime(&time, HostTimeClock);
    CMTimeConvertScale(&v14, &time, 1000000000, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    v10 = (const void *)objc_msgSend(v8, "numberWithLongLong:", v14.value);
    CMSetAttachment(a2, CFSTR("FileCoordinatorEmissionTimeStamp"), v10, 1u);
    v11 = objc_msgSend((id)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
    if (v11)
    {
      v12 = (void *)v11;
      v13 = *(_QWORD *)(v7 + 784) ? *(const void **)(v7 + 784) : (const void *)v11;
      CMSetAttachment(a2, CFSTR("LastPortType"), v13, 1u);
      if ((objc_msgSend(*(id *)(v7 + 784), "isEqualToString:", v12) & 1) == 0)
      {

        *(_QWORD *)(v7 + 784) = v12;
      }
    }
    if (*(_BYTE *)(v7 + 682) && !objc_msgSend(a3, "index"))
    {
      if (*(_QWORD *)(v7 + 624))
        -[BWFileCoordinatorNode _prepareOverCaptureVideoBufferForEmission:emissionTimeStamp:]((_BYTE *)v7, a2, v10);
    }
    return objc_msgSend(a4, "emitSampleBuffer:", a2);
  }
  return result;
}

- (uint64_t)_flushPendingIrisRequestMarkerBuffers
{
  uint64_t v1;
  uint64_t v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    for (result = objc_msgSend(*(id *)(result + 104), "count"); result; result = objc_msgSend(*(id *)(v1 + 104), "count"))
    {
      v2 = objc_msgSend(*(id *)(v1 + 104), "firstObject");
      if (dword_1ECFE94B0)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      objc_msgSend(*(id *)(v1 + 16), "emitSampleBuffer:", v2, v4, v5);
      objc_msgSend(*(id *)(v1 + 104), "removeObjectAtIndex:", 0);
    }
  }
  return result;
}

- (uint64_t)_flushSampleBuffersWaitingForMotionData
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  BOOL v4;
  CFStringRef *v5;
  uint64_t *v6;
  unint64_t v7;
  const void *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const void *v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v1 = result;
  if (!*(_QWORD *)(result + 752))
    return result;
  v2 = objc_msgSend(*(id *)(result + 736), "count");
  v3 = v2;
  if (*(_BYTE *)(v1 + 768))
    v4 = 1;
  else
    v4 = v2 == 0;
  v5 = (CFStringRef *)MEMORY[0x1E0D05CB0];
  v6 = (uint64_t *)MEMORY[0x1E0D082E8];
  if (!v4)
  {
    v8 = (const void *)objc_msgSend(*(id *)(v1 + 736), "firstObject");
    v9 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(v8, *v5, 0), "objectForKeyedSubscript:", *v6), "unsignedLongLongValue");
    v10 = objc_msgSend(*(id *)(v1 + 728), "earliestAvailableMotionDataSerialNumber");
    v11 = objc_msgSend(*(id *)(v1 + 728), "latestAvailableMotionDataSerialNumber");
    if (v10 <= v9)
      v12 = v9;
    else
      v12 = v10;
    if (v11 >= v9 + *(_QWORD *)(v1 + 744) - 1)
      v13 = v9 + *(_QWORD *)(v1 + 744) - 1;
    else
      v13 = v11;
    v14 = (void *)objc_msgSend(*(id *)(v1 + 728), "copyMotionDataForStartingSerialNumber:endingSerialNumber:", v12, v13);
    if (v14)
    {
      v15 = v14;
      fcn_addAllLookAheadMotionDataToMetadata(v8, 0, (void *)objc_msgSend(v14, "objectForKeyedSubscript:", BWMotionDataTimeMachineKeyPrimaryMotionData));
      *(_QWORD *)(v1 + 760) = v13;
      if (objc_msgSend(*(id *)(v1 + 728), "synchronizedSlaveMotionDataCachingEnabled"))
      {
        v16 = (const void *)fcn_synchronizedSlaveFrameForSampleBuffer(v8);
        if (v16)
          fcn_addAllLookAheadMotionDataToMetadata(v16, 0, (void *)objc_msgSend(v15, "objectForKeyedSubscript:", BWMotionDataTimeMachineKeySynchronizedSlaveFrameMotionData));
      }

    }
    *(_BYTE *)(v1 + 768) = 1;
    v6 = (uint64_t *)MEMORY[0x1E0D082E8];
LABEL_22:
    v7 = 0;
    v17 = *v5;
    v18 = *v6;
    while (1)
    {
      v19 = (void *)objc_msgSend(*(id *)(v1 + 736), "objectAtIndexedSubscript:", v7);
      if ((unint64_t)objc_msgSend((id)objc_msgSend((id)CMGetAttachment(v19, v17, 0), "objectForKeyedSubscript:", v18), "unsignedLongLongValue") > *(_QWORD *)(v1 + 760))goto LABEL_26;
      -[BWFileCoordinatorNode _addFlushingFutureCinematicMetadataToSampleBuffer:]((const void *)v1, v19);
      -[BWFileCoordinatorNode _emitSampleBuffer:forInput:toOutput:](v1, v19, *(void **)(v1 + 8), *(void **)(v1 + 16));
      if (v3 == ++v7)
      {
        v7 = v3;
        goto LABEL_26;
      }
    }
  }
  if (v2)
    goto LABEL_22;
  v7 = 0;
LABEL_26:
  if (objc_msgSend(*(id *)(v1 + 736), "count") > v7 && dword_1ECFE94B0 != 0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  result = objc_msgSend(*(id *)(v1 + 736), "removeAllObjects", v22, v23);
  *(_QWORD *)(v1 + 752) = 0;
  *(_QWORD *)(v1 + 760) = 0;
  return result;
}

- (const)_addFlushingFutureCinematicMetadataToSampleBuffer:(const void *)result
{
  uint64_t v3;
  const __CFString *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  const void *v8;
  void *v9;

  if (result)
  {
    v3 = (uint64_t)result;
    v4 = (const __CFString *)*MEMORY[0x1E0D05CB0];
    v5 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v6 = -[BWFileCoordinatorNode _cinematicFutureMetadataForFlushingSampleBuffer:](v3, target);
    v7 = *MEMORY[0x1E0D082D0];
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D082D0]);
    result = (const void *)objc_msgSend(*(id *)(v3 + 728), "synchronizedSlaveMotionDataCachingEnabled");
    if ((_DWORD)result)
    {
      result = (const void *)fcn_synchronizedSlaveFrameForSampleBuffer(target);
      if (result)
      {
        v8 = result;
        v9 = (void *)CMGetAttachment(result, v4, 0);
        return (const void *)objc_msgSend(v9, "setObject:forKeyedSubscript:", -[BWFileCoordinatorNode _cinematicFutureMetadataForFlushingSampleBuffer:](v3, v8), v7);
      }
    }
  }
  return result;
}

- (uint64_t)_cinematicFutureMetadataForFlushingSampleBuffer:(uint64_t)result
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  if (result)
  {
    v2 = result;
    v3 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v4 = *MEMORY[0x1E0D082E8];
    v5 = *(_QWORD *)(v2 + 744)
       + objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D082E8]), "unsignedLongLongValue");
    v6 = (void *)MEMORY[0x1E0C99E08];
    v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v5);
    return objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v7, v4, MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D082E0], 0);
  }
  return result;
}

- (void)_prepareOverCaptureVideoBufferForEmission:(const void *)a3 emissionTimeStamp:
{
  __int128 v6;
  __int128 v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  const void *AttachedMedia;
  CMSampleTimingInfo sampleTimingArray;
  CMAttachmentBearerRef targeta;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!a1[683])
    {
LABEL_16:
      CMRemoveAttachment(target, CFSTR("OverCaptureSlaveStreamStatus"));
      return;
    }
    if (!a1[684])
    {
      if ((objc_msgSend((id)CMGetAttachment(target, CFSTR("OverCaptureSlaveStreamStatus"), 0), "intValue") & 0xFFFFFFFB) == 0)
      {
        AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(target, 0x1E495AE38);
        if (AttachedMedia
          || (AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(target, (uint64_t)CFSTR("SynchronizedSlaveFrame"))) != 0)
        {
          CMSetAttachment(AttachedMedia, CFSTR("FileCoordinatorEmissionTimeStamp"), a3, 1u);
        }
        goto LABEL_7;
      }
      a1[684] = 1;
      a1[685] = 1;
    }
    BWSampleBufferRemoveAttachedMedia(target, 0x1E495AE38);
    BWSampleBufferRemoveAttachedMedia(target, (uint64_t)CFSTR("SynchronizedSlaveFrame"));
LABEL_7:
    if (a1[685])
    {
      targeta = 0;
      v6 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 48);
      *(_OWORD *)&sampleTimingArray.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 32);
      *(_OWORD *)&sampleTimingArray.decodeTimeStamp.value = v6;
      sampleTimingArray.decodeTimeStamp.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 64);
      v7 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 16);
      *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E0CA2E90];
      *(_OWORD *)&sampleTimingArray.duration.epoch = v7;
      CMSampleBufferGetPresentationTimeStamp(&sampleTimingArray.presentationTimeStamp, (CMSampleBufferRef)target);
      if (!CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 1u, 0, 0, 0, 0, 1, &sampleTimingArray, 0, 0, (CMSampleBufferRef *)&targeta))
      {
        if (dword_1ECFE94B0)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        CMSetAttachment(targeta, CFSTR("FileWriterAction"), CFSTR("StreamForcedOff"), 1u);
        BWSampleBufferSetAttachedMedia(target, (uint64_t)CFSTR("SynchronizedSlaveFrame"), (uint64_t)targeta);
        CFRelease(targeta);
        if ((objc_msgSend((id)CMGetAttachment(target, CFSTR("SampleDataToBeDropped"), 0), "BOOLValue") & 1) == 0)
          a1[685] = 0;
      }
    }
    goto LABEL_16;
  }
}

- (id)_emitStagedBufferForIndex:(id *)result stoppingOrPausing:(uint64_t)a2
{
  id *v3;
  void *v4;
  void *v5;
  id *v6;

  if (result)
  {
    v3 = result;
    v4 = (void *)objc_msgSend((id)objc_msgSend(result, "inputs"), "objectAtIndex:", a2);
    v5 = (void *)objc_msgSend((id)objc_msgSend(v3, "outputs"), "objectAtIndex:", a2);
    result = (id *)objc_msgSend(v3[12], "objectAtIndex:", a2);
    if (v4)
    {
      if (v5)
      {
        v6 = result;
        if (result)
        {
          result = (id *)objc_msgSend(result, "count");
          if (result)
          {
            -[BWFileCoordinatorNode _emitOrQueueSampleBuffer:forInput:toOutput:stoppingOrPausing:]((uint64_t)v3, (CMSampleBufferRef)objc_msgSend(v6, "firstObject"), v4, v5);
            return (id *)objc_msgSend(v6, "removeObjectAtIndex:", 0);
          }
        }
      }
    }
  }
  return result;
}

- (CMSampleBufferRef)_createEmptyMetadataSBufWithPTS:(uint64_t)a3 forInputIndex:
{
  CMSampleBufferRef v4;
  OpaqueCMBlockBuffer *v6;
  const __CFAllocator *v7;
  __int128 v8;
  CMTimeEpoch v9;
  __int128 v10;
  CMTimeEpoch v11;
  size_t DataLength;
  OpaqueCMBlockBuffer *v13;
  size_t sampleSizeArray;
  CMSampleTimingInfo sampleTimingArray;
  char *dataPointerOut;
  CMSampleBufferRef v17;

  if (result)
  {
    v4 = result;
    v17 = 0;
    if (*(_QWORD *)(*((_QWORD *)result + 74) + 8 * a3))
    {
      v6 = (OpaqueCMBlockBuffer *)*((_QWORD *)result + 73);
      v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      if (!v6)
      {
        if (CMBlockBufferCreateWithMemoryBlock(v7, 0, 8uLL, v7, 0, 0, 8uLL, 1u, (CMBlockBufferRef *)v4 + 73))
          goto LABEL_10;
        dataPointerOut = 0;
        if (CMBlockBufferGetDataPointer(*((CMBlockBufferRef *)v4 + 73), 0, 0, 0, &dataPointerOut))
          goto LABEL_10;
        *(_QWORD *)dataPointerOut = 0x8000000;
        v6 = (OpaqueCMBlockBuffer *)*((_QWORD *)v4 + 73);
      }
      v8 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 48);
      *(_OWORD *)&sampleTimingArray.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 32);
      *(_OWORD *)&sampleTimingArray.decodeTimeStamp.value = v8;
      v9 = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 64);
      v10 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 16);
      *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E0CA2E90];
      *(_OWORD *)&sampleTimingArray.duration.epoch = v10;
      *(_OWORD *)&sampleTimingArray.presentationTimeStamp.value = *(_OWORD *)a2;
      v11 = *(_QWORD *)(a2 + 16);
      sampleTimingArray.decodeTimeStamp.epoch = v9;
      sampleTimingArray.presentationTimeStamp.epoch = v11;
      DataLength = CMBlockBufferGetDataLength(v6);
      v13 = (OpaqueCMBlockBuffer *)*((_QWORD *)v4 + 73);
      sampleSizeArray = DataLength;
      if (!CMSampleBufferCreate(v7, v13, 1u, 0, 0, *(CMFormatDescriptionRef *)(*((_QWORD *)v4 + 74) + 8 * a3), 1, 1, &sampleTimingArray, 1, &sampleSizeArray, &v17))return v17;
    }
LABEL_10:
    FigDebugAssert3();
    return v17;
  }
  return result;
}

@end
