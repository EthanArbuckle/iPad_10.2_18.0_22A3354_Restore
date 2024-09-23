@implementation CSAudioProvider

- (CSAudioProvider)initWithAudioStreamHandleId:(unint64_t)a3 audioStreamType:(int64_t)a4 audioRecordContext:(id)a5 audioRecorder:(id)a6 phoneCallStateMonitor:(id)a7
{
  id v12;
  id v13;
  id v14;
  CSAudioProvider *v15;
  CSAudioProvider *v16;
  uint64_t v17;
  OS_dispatch_queue *recordQueue;
  uint64_t v19;
  NSObject *streamHandleQueue;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *v25;
  NSObject *v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *loggingQueue;
  uint64_t v29;
  NSHashTable *startPendingStreams;
  uint64_t v31;
  NSHashTable *startPendingOnStoppingStreams;
  uint64_t v33;
  NSHashTable *alertPlaybackFinishWaitingStreams;
  uint64_t v35;
  NSHashTable *streams;
  uint64_t v37;
  NSHashTable *stopPendingStreams;
  uint64_t v39;
  NSHashTable *historicalBufferRequestStreams;
  uint64_t v41;
  NSMutableArray *pendingStartCompletions;
  uint64_t v43;
  NSMutableDictionary *startPendingOnStoppingStreamToCompletionDict;
  uint64_t v45;
  NSMutableArray *alertPlaybackFinishWaitingCompletions;
  uint64_t v47;
  NSMutableArray *pendingStopCompletions;
  uint64_t v49;
  NSMutableArray *streamHolders;
  uint64_t v51;
  NSMutableDictionary *recordModeLocks;
  uint64_t v53;
  NSMutableDictionary *listeningMicIndicatorLocks;
  void *v55;
  uint64_t v56;
  NSString *UUID;
  dispatch_group_t v58;
  OS_dispatch_group *recordingWillStartGroup;
  CSAudioRecordDeviceIndicator *v60;
  void *v61;
  uint64_t v62;
  CSAudioRecordDeviceIndicator *recordDeviceIndicator;
  void *v64;
  uint64_t v65;
  CSAudioTimeConverter *audioTimeConverter;
  void *v67;
  uint64_t v68;
  CSAudioTimeConverter *exclaveAudioTimeConverter;
  CSMicUsageReporter *v70;
  CSMicUsageReporter *micUsageReporter;
  signed int v72;
  CSPhoneCallStateMonitor *v73;
  CSPhoneCallStateMonitor *phoneCallStateMonitor;
  CSStateCapture *v75;
  CSStateCapture *stateCapture;
  objc_super v78;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  v78.receiver = self;
  v78.super_class = (Class)CSAudioProvider;
  v15 = -[CSAudioProvider init](&v78, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_audioStreamHandleId = a3;
    if (CSIsHorseman_onceToken != -1)
      dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
    if (a4 == 1 && CSIsHorseman_isHorseman)
    {
      +[CSUtils getSerialQueueWithQOS:name:fixedPriority:](CSUtils, "getSerialQueueWithQOS:name:fixedPriority:", 33, CFSTR("CSAudioProvider"), 60);
      v17 = objc_claimAutoreleasedReturnValue();
      recordQueue = v16->_recordQueue;
      v16->_recordQueue = (OS_dispatch_queue *)v17;

      +[CSUtils getSerialQueueWithQOS:name:fixedPriority:](CSUtils, "getSerialQueueWithQOS:name:fixedPriority:", 33, CFSTR("CSAudioProvider Stream Handle Queue"), 60);
      v19 = objc_claimAutoreleasedReturnValue();
      streamHandleQueue = v16->_streamHandleQueue;
      v16->_streamHandleQueue = (OS_dispatch_queue *)v19;
    }
    else
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = dispatch_queue_create("CSAudioProvider", v21);
      v23 = v16->_recordQueue;
      v16->_recordQueue = (OS_dispatch_queue *)v22;

      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      streamHandleQueue = objc_claimAutoreleasedReturnValue();
      v24 = dispatch_queue_create("CSAudioProvider Stream Handle Queue", streamHandleQueue);
      v25 = v16->_streamHandleQueue;
      v16->_streamHandleQueue = (OS_dispatch_queue *)v24;

    }
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, -2);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = dispatch_queue_create("CSAudioProvider logging", v26);
    loggingQueue = v16->_loggingQueue;
    v16->_loggingQueue = (OS_dispatch_queue *)v27;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v29 = objc_claimAutoreleasedReturnValue();
    startPendingStreams = v16->_startPendingStreams;
    v16->_startPendingStreams = (NSHashTable *)v29;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v31 = objc_claimAutoreleasedReturnValue();
    startPendingOnStoppingStreams = v16->_startPendingOnStoppingStreams;
    v16->_startPendingOnStoppingStreams = (NSHashTable *)v31;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v33 = objc_claimAutoreleasedReturnValue();
    alertPlaybackFinishWaitingStreams = v16->_alertPlaybackFinishWaitingStreams;
    v16->_alertPlaybackFinishWaitingStreams = (NSHashTable *)v33;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v35 = objc_claimAutoreleasedReturnValue();
    streams = v16->_streams;
    v16->_streams = (NSHashTable *)v35;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v37 = objc_claimAutoreleasedReturnValue();
    stopPendingStreams = v16->_stopPendingStreams;
    v16->_stopPendingStreams = (NSHashTable *)v37;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v39 = objc_claimAutoreleasedReturnValue();
    historicalBufferRequestStreams = v16->_historicalBufferRequestStreams;
    v16->_historicalBufferRequestStreams = (NSHashTable *)v39;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v41 = objc_claimAutoreleasedReturnValue();
    pendingStartCompletions = v16->_pendingStartCompletions;
    v16->_pendingStartCompletions = (NSMutableArray *)v41;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v43 = objc_claimAutoreleasedReturnValue();
    startPendingOnStoppingStreamToCompletionDict = v16->_startPendingOnStoppingStreamToCompletionDict;
    v16->_startPendingOnStoppingStreamToCompletionDict = (NSMutableDictionary *)v43;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v45 = objc_claimAutoreleasedReturnValue();
    alertPlaybackFinishWaitingCompletions = v16->_alertPlaybackFinishWaitingCompletions;
    v16->_alertPlaybackFinishWaitingCompletions = (NSMutableArray *)v45;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v47 = objc_claimAutoreleasedReturnValue();
    pendingStopCompletions = v16->_pendingStopCompletions;
    v16->_pendingStopCompletions = (NSMutableArray *)v47;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v49 = objc_claimAutoreleasedReturnValue();
    streamHolders = v16->_streamHolders;
    v16->_streamHolders = (NSMutableArray *)v49;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v51 = objc_claimAutoreleasedReturnValue();
    recordModeLocks = v16->_recordModeLocks;
    v16->_recordModeLocks = (NSMutableDictionary *)v51;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v53 = objc_claimAutoreleasedReturnValue();
    listeningMicIndicatorLocks = v16->_listeningMicIndicatorLocks;
    v16->_listeningMicIndicatorLocks = (NSMutableDictionary *)v53;

    -[CSAudioProvider setStreamState:](v16, "setStreamState:", 0);
    objc_storeStrong((id *)&v16->_audioRecorder, a6);
    -[CSAudioRecorder registerObserver:](v16->_audioRecorder, "registerObserver:", v16);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "UUIDString");
    v56 = objc_claimAutoreleasedReturnValue();
    UUID = v16->_UUID;
    v16->_UUID = (NSString *)v56;

    v16->_audioSystemRecovering = 0;
    v58 = dispatch_group_create();
    recordingWillStartGroup = v16->_recordingWillStartGroup;
    v16->_recordingWillStartGroup = (OS_dispatch_group *)v58;

    v16->_audioStreamType = a4;
    v60 = [CSAudioRecordDeviceIndicator alloc];
    objc_msgSend(v12, "deviceId");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = -[CSAudioRecordDeviceIndicator initWithRecordContext:deviceId:shouldUseRemoteRecorder:streamHandleId:](v60, "initWithRecordContext:deviceId:shouldUseRemoteRecorder:streamHandleId:", v12, v61, a4 == 3, a3);
    recordDeviceIndicator = v16->_recordDeviceIndicator;
    v16->_recordDeviceIndicator = (CSAudioRecordDeviceIndicator *)v62;

    +[CSAudioTimeConverterPool sharedInstance](CSAudioTimeConverterPool, "sharedInstance");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "converterForAudioStreamId:", a3);
    v65 = objc_claimAutoreleasedReturnValue();
    audioTimeConverter = v16->_audioTimeConverter;
    v16->_audioTimeConverter = (CSAudioTimeConverter *)v65;

    if (+[CSUtils isExclaveHardware](CSUtils, "isExclaveHardware"))
    {
      +[CSAudioTimeConverterPool sharedInstance](CSAudioTimeConverterPool, "sharedInstance");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "defaultExclaveConverter");
      v68 = objc_claimAutoreleasedReturnValue();
      exclaveAudioTimeConverter = v16->_exclaveAudioTimeConverter;
      v16->_exclaveAudioTimeConverter = (CSAudioTimeConverter *)v68;

    }
    v70 = objc_alloc_init(CSMicUsageReporter);
    micUsageReporter = v16->_micUsageReporter;
    v16->_micUsageReporter = v70;

    v16->_currentSessionShouldDuckOnBuiltInSpeaker = 0;
    v72 = +[CSConfig inputRecordingNumberOfChannels](CSConfig, "inputRecordingNumberOfChannels");
    if (a4 == 1)
    {
      if (CSIsHorseman_onceToken != -1)
        dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
      if (CSIsHorseman_isHorseman)
        v72 = 1;
    }
    if (+[CSUtils allowExtendedRingBufferSize](CSUtils, "allowExtendedRingBufferSize"))
    {
      if (v14)
      {
        v73 = (CSPhoneCallStateMonitor *)v14;
      }
      else
      {
        +[CSPhoneCallStateMonitorFactory phoneCallStateMonitor](CSPhoneCallStateMonitorFactory, "phoneCallStateMonitor");
        v73 = (CSPhoneCallStateMonitor *)objc_claimAutoreleasedReturnValue();
      }
      phoneCallStateMonitor = v16->_phoneCallStateMonitor;
      v16->_phoneCallStateMonitor = v73;

    }
    v16->_phoneCallState = 0;
    -[CSAudioProvider _createCircularBufferIfNeededWithNumChannel:playbackRoute:](v16, "_createCircularBufferIfNeededWithNumChannel:playbackRoute:", v72, 0);
    v75 = objc_alloc_init(CSStateCapture);
    stateCapture = v16->_stateCapture;
    v16->_stateCapture = v75;

  }
  return v16;
}

- (CSAudioProvider)initWithAudioStreamHandleId:(unint64_t)a3 audioStreamType:(int64_t)a4 audioRecordContext:(id)a5 audioRecorder:(id)a6
{
  return -[CSAudioProvider initWithAudioStreamHandleId:audioStreamType:audioRecordContext:audioRecorder:phoneCallStateMonitor:](self, "initWithAudioStreamHandleId:audioStreamType:audioRecordContext:audioRecorder:phoneCallStateMonitor:", a3, a4, a5, a6, 0);
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[CSAudioProvider _holdRecordingExceptionIfNeeded:](self, "_holdRecordingExceptionIfNeeded:", 0);
  v3 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CSAudioProvider dealloc]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider is deallocated", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)CSAudioProvider;
  -[CSAudioProvider dealloc](&v4, sel_dealloc);
}

- (void)start
{
  void *v3;
  uint64_t v4;
  NSObject *recordQueue;
  CSStateCapture *stateCapture;
  _QWORD v7[4];
  id v8;
  id location;
  _QWORD block[5];

  +[CSAudioServerCrashMonitor sharedInstance](CSAudioServerCrashMonitor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

  if (+[CSUtils allowExtendedRingBufferSize](CSUtils, "allowExtendedRingBufferSize"))
  {
    -[CSEventMonitor addObserver:](self->_phoneCallStateMonitor, "addObserver:", self);
    self->_phoneCallState = -[CSPhoneCallStateMonitor phoneCallState](self->_phoneCallStateMonitor, "phoneCallState");
  }
  v4 = MEMORY[0x1E0C809B0];
  recordQueue = self->_recordQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__CSAudioProvider_start__block_invoke;
  block[3] = &unk_1E6881138;
  block[4] = self;
  dispatch_async(recordQueue, block);
  objc_initWeak(&location, self);
  -[CSStateCapture start](self->_stateCapture, "start");
  stateCapture = self->_stateCapture;
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __24__CSAudioProvider_start__block_invoke_2;
  v7[3] = &unk_1E687F378;
  objc_copyWeak(&v8, &location);
  -[CSStateCapture setStateCaptureBlock:](stateCapture, "setStateCaptureBlock:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)setStreamState:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[CSAudioProvider UUID](self, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSAudioProvider _streamStateName:](self, "_streamStateName:", self->_streamState);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSAudioProvider _streamStateName:](self, "_streamStateName:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315906;
    v11 = "-[CSAudioProvider setStreamState:]";
    v12 = 2114;
    v13 = v7;
    v14 = 2114;
    v15 = v8;
    v16 = 2114;
    v17 = v9;
    _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:StreamState changed from : %{public}@ to : %{public}@", (uint8_t *)&v10, 0x2Au);

  }
  self->_streamState = a3;
}

- (void)setAudioRecorder:(id)a3
{
  id v4;
  NSObject *recordQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  recordQueue = self->_recordQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__CSAudioProvider_setAudioRecorder___block_invoke;
  v7[3] = &unk_1E6880E88;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(recordQueue, v7);

}

- (void)setAudioProviderDelegate:(id)a3
{
  id v4;
  NSObject *recordQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  recordQueue = self->_recordQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__CSAudioProvider_setAudioProviderDelegate___block_invoke;
  v7[3] = &unk_1E6880E88;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(recordQueue, v7);

}

- (void)setLatestRecordContext:(id)a3 streamType:(int64_t)a4
{
  id v6;
  NSObject *recordQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a3;
  recordQueue = self->_recordQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__CSAudioProvider_setLatestRecordContext_streamType___block_invoke;
  block[3] = &unk_1E687FCC0;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_async(recordQueue, block);

}

- (void)_setLatestRecordContext:(id)a3
{
  CSAudioRecordDeviceIndicator *recordDeviceIndicator;
  CSAudioRecordDeviceIndicator *v6;
  void *v7;
  CSAudioRecordDeviceIndicator *v8;
  CSAudioRecordDeviceIndicator *v9;
  id v10;

  v10 = a3;
  objc_storeStrong((id *)&self->_lastAudioRecorderContext, a3);
  recordDeviceIndicator = self->_recordDeviceIndicator;
  if (recordDeviceIndicator)
  {
    -[CSAudioRecordDeviceIndicator updateWithLatestRecordContext:](recordDeviceIndicator, "updateWithLatestRecordContext:", v10);
  }
  else
  {
    v6 = [CSAudioRecordDeviceIndicator alloc];
    objc_msgSend(v10, "deviceId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CSAudioRecordDeviceIndicator initWithRecordContext:deviceId:shouldUseRemoteRecorder:streamHandleId:](v6, "initWithRecordContext:deviceId:shouldUseRemoteRecorder:streamHandleId:", v10, v7, self->_audioStreamType == 3, self->_audioStreamHandleId);
    v9 = self->_recordDeviceIndicator;
    self->_recordDeviceIndicator = v8;

  }
  -[CSAudioProvider _updateRemoteDeviceIdFromAVVCIfNeeded](self, "_updateRemoteDeviceIdFromAVVCIfNeeded");

}

- (unint64_t)audioStreamId
{
  return self->_audioStreamHandleId;
}

- (BOOL)_canSetContext
{
  void *v3;
  void *v4;
  int v5;

  -[CSAudioProvider audioRecorder](self, "audioRecorder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAudioProvider recordDeviceIndicator](self, "recordDeviceIndicator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isRecordingWithRecordDeviceIndicator:", v4);

  if (!v5)
    return 1;
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  return CSIsHorseman_isHorseman == 0;
}

- (BOOL)supportsDuckingOnCurrentRouteWithError:(id *)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *recordQueue;
  char v9;
  _QWORD block[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  _BYTE buf[24];
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[CSAudioProvider UUID](self, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[CSAudioProvider supportsDuckingOnCurrentRouteWithError:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:", buf, 0x16u);

  }
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v17 = __Block_byref_object_copy__6454;
  v18 = __Block_byref_object_dispose__6455;
  v19 = 0;
  recordQueue = self->_recordQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__CSAudioProvider_supportsDuckingOnCurrentRouteWithError___block_invoke;
  block[3] = &unk_1E687F558;
  block[4] = self;
  block[5] = &v12;
  block[6] = buf;
  dispatch_async_and_wait(recordQueue, block);
  if (a3)
    *a3 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
  v9 = *((_BYTE *)v13 + 24);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v12, 8);
  return v9;
}

- (BOOL)setCurrentContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  NSObject *recordQueue;
  id v12;
  char v13;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  _BYTE buf[24];
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    -[CSAudioProvider UUID](self, "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "description");
    v10 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[CSAudioProvider setCurrentContext:error:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2114;
    v24 = v10;
    _os_log_impl(&dword_1B502E000, v8, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:setCurrentContext : %{public}@", buf, 0x20u);

  }
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v24 = __Block_byref_object_copy__6454;
  v25 = __Block_byref_object_dispose__6455;
  v26 = 0;
  recordQueue = self->_recordQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __43__CSAudioProvider_setCurrentContext_error___block_invoke;
  v15[3] = &unk_1E6880CA0;
  v15[4] = self;
  v17 = &v19;
  v12 = v6;
  v16 = v12;
  v18 = buf;
  dispatch_async_and_wait(recordQueue, v15);
  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
  v13 = *((_BYTE *)v20 + 24);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v19, 8);

  return v13;
}

- (id)_audioStreamWithRequest:(id)a3 streamName:(id)a4 error:(id *)a5
{
  id v8;
  NSObject *recordQueue;
  id v10;
  CSAudioStream *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  id v17;
  void *v18;
  void *v19;
  CSAudioStream *v20;
  void *v21;
  NSObject *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  recordQueue = self->_recordQueue;
  v10 = a4;
  dispatch_assert_queue_V2(recordQueue);
  v11 = -[CSAudioStream initWithAudioStreamProvider:streamName:streamRequest:]([CSAudioStream alloc], "initWithAudioStreamProvider:streamName:streamRequest:", self, v10, v8);

  v12 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    -[CSAudioProvider UUID](self, "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSAudioStream name](v11, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v27 = "-[CSAudioProvider _audioStreamWithRequest:streamName:error:]";
    v28 = 2114;
    v29 = v14;
    v30 = 2114;
    v31 = v15;
    _os_log_impl(&dword_1B502E000, v13, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:audioStreamWithRequest for stream <%{public}@>", buf, 0x20u);

  }
  v25 = 0;
  v16 = -[CSAudioProvider _prepareAudioStreamSync:request:error:](self, "_prepareAudioStreamSync:request:error:", v11, v8, &v25);
  v17 = v25;
  v18 = v17;
  if (a5)
    *a5 = objc_retainAutorelease(v17);
  if (v16)
  {
    if (objc_msgSend(v8, "requiresHistoricalBuffer"))
    {
      -[CSAudioProvider historicalBufferRequestStreams](self, "historicalBufferRequestStreams");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v11);

    }
    v20 = v11;
  }
  else
  {
    v21 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      v23 = v21;
      objc_msgSend(v18, "localizedDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v27 = "-[CSAudioProvider _audioStreamWithRequest:streamName:error:]";
      v28 = 2114;
      v29 = v24;
      _os_log_error_impl(&dword_1B502E000, v23, OS_LOG_TYPE_ERROR, "%s Failed to _prepareAudioStreamSync : %{public}@", buf, 0x16u);

    }
    v20 = 0;
  }

  return v20;
}

- (id)audioStreamWithRequest:(id)a3 streamName:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *recordQueue;
  id v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v8 = a3;
  v9 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__6454;
  v30 = __Block_byref_object_dispose__6455;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__6454;
  v24 = __Block_byref_object_dispose__6455;
  v25 = 0;
  recordQueue = self->_recordQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__CSAudioProvider_audioStreamWithRequest_streamName_error___block_invoke;
  block[3] = &unk_1E687F3A0;
  v18 = &v26;
  block[4] = self;
  v11 = v8;
  v16 = v11;
  v12 = v9;
  v17 = v12;
  v19 = &v20;
  dispatch_async_and_wait(recordQueue, block);
  if (a5)
    *a5 = objc_retainAutorelease((id)v21[5]);
  v13 = (id)v27[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (void)audioStreamWithRequest:(id)a3 streamName:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *recordQueue;
  id v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __64__CSAudioProvider_audioStreamWithRequest_streamName_completion___block_invoke;
  v22[3] = &unk_1E687F3C8;
  v23 = v10;
  v12 = v10;
  v13 = (void *)MEMORY[0x1B5E468D0](v22);
  recordQueue = self->_recordQueue;
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __64__CSAudioProvider_audioStreamWithRequest_streamName_completion___block_invoke_2;
  block[3] = &unk_1E687F4B8;
  block[4] = self;
  v19 = v8;
  v20 = v9;
  v21 = v13;
  v15 = v13;
  v16 = v9;
  v17 = v8;
  dispatch_async(recordQueue, block);

}

- (void)attachTandemStream:(id)a3 toPrimaryStream:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *streamHandleQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  streamHandleQueue = self->_streamHandleQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__CSAudioProvider_attachTandemStream_toPrimaryStream_completion___block_invoke;
  block[3] = &unk_1E687F5D0;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(streamHandleQueue, block);

}

- (BOOL)_prepareAudioStreamSync:(id)a3 request:(id)a4 error:(id *)a5
{
  id v8;
  NSObject *recordQueue;
  id v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  recordQueue = self->_recordQueue;
  v10 = a3;
  dispatch_assert_queue_V2(recordQueue);
  objc_msgSend(v10, "setStreamRequest:", v8);

  if (self->_streamState < 2)
  {
    if (self->_audioSystemRecovering)
    {
      v11 = (void *)CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        v31 = v11;
        -[CSAudioProvider UUID](self, "UUID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v39 = "-[CSAudioProvider _prepareAudioStreamSync:request:error:]";
        v40 = 2114;
        v41 = v32;
        _os_log_error_impl(&dword_1B502E000, v31, OS_LOG_TYPE_ERROR, "%s CSAudioProvider[%{public}@]:Cannot prepare, audio system is recovering", buf, 0x16u);

        if (!a5)
          goto LABEL_6;
      }
      else if (!a5)
      {
LABEL_6:
        -[CSAudioProvider _handleAudioSystemFailure](self, "_handleAudioSystemFailure");
LABEL_7:
        LOBYTE(v12) = 0;
        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 957, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    -[CSAudioProvider audioRecorder](self, "audioRecorder");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 958, 0);
        LOBYTE(v12) = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      goto LABEL_7;
    }
    v19 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      -[CSAudioProvider UUID](self, "UUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v39 = "-[CSAudioProvider _prepareAudioStreamSync:request:error:]";
      v40 = 2114;
      v41 = v21;
      _os_log_impl(&dword_1B502E000, v20, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Asking AudioRecorder prepareAudioStreamRecord", buf, 0x16u);

    }
    -[CSAudioProvider audioRecorder](self, "audioRecorder");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSAudioProvider recordDeviceIndicator](self, "recordDeviceIndicator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    v12 = objc_msgSend(v22, "prepareAudioStreamRecord:recordDeviceIndicator:error:", v8, v23, &v37);
    v24 = v37;

    if (v12)
    {
      -[CSAudioProvider setStreamState:](self, "setStreamState:", 1);
      if (-[CSAudioRecordContext type](self->_lastAudioRecorderContext, "type") == 6
        && !+[CSUtils isLocalVoiceTriggerAvailable](CSUtils, "isLocalVoiceTriggerAvailable"))
      {
        +[CSVoiceTriggerEventInfoProvider sharedInstance](CSVoiceTriggerEventInfoProvider, "sharedInstance");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSAudioProvider audioRecorder](self, "audioRecorder");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSAudioProvider recordDeviceIndicator](self, "recordDeviceIndicator");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "fetchGibraltarVoiceTriggerInfoWithRecordDeviceIndicator:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSAudioProvider recordDeviceIndicator](self, "recordDeviceIndicator");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "deviceId");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setVoiceTriggerInfo:deviceId:", v27, v29);

        if (!a5)
          goto LABEL_25;
        goto LABEL_24;
      }
    }
    else
    {
      v30 = (void *)CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        v33 = v30;
        -[CSAudioProvider UUID](self, "UUID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "localizedDescription");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v39 = "-[CSAudioProvider _prepareAudioStreamSync:request:error:]";
        v40 = 2114;
        v41 = v34;
        v42 = 2114;
        v43 = v35;
        _os_log_error_impl(&dword_1B502E000, v33, OS_LOG_TYPE_ERROR, "%s CSAudioProvider[%{public}@]:prepareAudioStreamRecord failed : %{public}@", buf, 0x20u);

        if (!a5)
          goto LABEL_25;
        goto LABEL_24;
      }
    }
    if (!a5)
    {
LABEL_25:
      if ((v12 & 1) == 0)
        -[CSAudioProvider _handleAudioSystemFailure](self, "_handleAudioSystemFailure");

      goto LABEL_11;
    }
LABEL_24:
    *a5 = objc_retainAutorelease(v24);
    goto LABEL_25;
  }
  v13 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    -[CSAudioProvider UUID](self, "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSAudioProvider _streamStateName:](self, "_streamStateName:", self->_streamState);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v39 = "-[CSAudioProvider _prepareAudioStreamSync:request:error:]";
    v40 = 2114;
    v41 = v15;
    v42 = 2114;
    v43 = v16;
    _os_log_impl(&dword_1B502E000, v14, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Prepare audio stream reuqested while state is %{public}@", buf, 0x20u);

  }
  LOBYTE(v12) = 1;
LABEL_11:

  return v12;
}

- (void)_prepareAudioStream:(id)a3 request:(id)a4 completion:(id)a5
{
  id v8;
  NSObject *recordQueue;
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  _BOOL8 v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = a5;
  recordQueue = self->_recordQueue;
  v10 = a4;
  v11 = a3;
  dispatch_assert_queue_V2(recordQueue);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __58__CSAudioProvider__prepareAudioStream_request_completion___block_invoke;
  v17[3] = &unk_1E6881048;
  v18 = v8;
  v12 = v8;
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1B5E468D0](v17);
  v16 = 0;
  v14 = -[CSAudioProvider _prepareAudioStreamSync:request:error:](self, "_prepareAudioStreamSync:request:error:", v11, v10, &v16);

  v15 = v16;
  ((void (**)(_QWORD, _BOOL8, id))v13)[2](v13, v14, v15);

}

- (void)_createCircularBufferIfNeededWithNumChannel:(unint64_t)a3 playbackRoute:(id)a4
{
  id v6;
  char v7;
  float v8;
  float v9;
  CSAudioCircularBuffer *circularBuffer;
  float v11;
  void *v12;
  NSObject *v13;
  void *v14;
  CSAudioCircularBuffer *v15;
  int v16;
  double v17;
  double v18;
  CSAudioCircularBuffer *v19;
  CSAudioCircularBuffer *v20;
  CSAudioCircularBuffer *v21;
  int v22;
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  double v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (+[CSUtils allowExtendedRingBufferSize](CSUtils, "allowExtendedRingBufferSize")
    && self->_audioStreamType == 2
    && v6
    && self->_phoneCallState != 3)
  {
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C89818]);
    +[CSConfig inputRecordingDurationInSecs](CSConfig, "inputRecordingDurationInSecs");
    if ((v7 & 1) == 0)
      +[CSConfig inputRecordingDurationInSecsExtended](CSConfig, "inputRecordingDurationInSecsExtended");
  }
  else
  {
    +[CSConfig inputRecordingDurationInSecs](CSConfig, "inputRecordingDurationInSecs");
  }
  v9 = v8;
  circularBuffer = self->_circularBuffer;
  if (!circularBuffer
    || (-[CSAudioCircularBuffer inputRecordingDuration](circularBuffer, "inputRecordingDuration"), v11 != v9)
    || (v21 = self->_circularBuffer) != 0 && -[CSAudioCircularBuffer numInputChannels](v21, "numInputChannels") != a3)
  {
    v12 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      -[CSAudioProvider UUID](self, "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 136315906;
      v23 = "-[CSAudioProvider _createCircularBufferIfNeededWithNumChannel:playbackRoute:]";
      v24 = 2114;
      v25 = v14;
      v26 = 1024;
      v27 = a3;
      v28 = 2048;
      v29 = v9;
      _os_log_impl(&dword_1B502E000, v13, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Create circular buffer : numChannels(%d), duration(%f)", (uint8_t *)&v22, 0x26u);

    }
    v15 = [CSAudioCircularBuffer alloc];
    +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
    LODWORD(v17) = v16;
    *(float *)&v18 = v9;
    v19 = -[CSAudioCircularBuffer initWithNumChannels:recordingDuration:samplingRate:audioTimeConverter:](v15, "initWithNumChannels:recordingDuration:samplingRate:audioTimeConverter:", a3, self->_audioTimeConverter, v18, v17);
    v20 = self->_circularBuffer;
    self->_circularBuffer = v19;

  }
}

- (void)startAudioStream:(id)a3 option:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t audioStreamHandleId;
  NSObject *recordQueue;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  unint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    -[CSAudioProvider UUID](self, "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSAudioProvider _streamStateName:](self, "_streamStateName:", self->_streamState);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    audioStreamHandleId = self->_audioStreamHandleId;
    *(_DWORD *)buf = 136316418;
    v27 = "-[CSAudioProvider startAudioStream:option:completion:]";
    v28 = 2114;
    v29 = v13;
    v30 = 2114;
    v31 = v14;
    v32 = 2114;
    v33 = v15;
    v34 = 2114;
    v35 = v16;
    v36 = 2050;
    v37 = audioStreamHandleId;
    _os_log_impl(&dword_1B502E000, v12, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:startAudioStream with stream : %{public}@ with stream state : %{public}@, option : %{public}@, streamId : %{public}llu", buf, 0x3Eu);

  }
  recordQueue = self->_recordQueue;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __54__CSAudioProvider_startAudioStream_option_completion___block_invoke;
  v22[3] = &unk_1E687F4B8;
  v22[4] = self;
  v23 = v8;
  v24 = v9;
  v25 = v10;
  v19 = v10;
  v20 = v9;
  v21 = v8;
  dispatch_async(recordQueue, v22);

}

- (BOOL)prepareAudioStreamSync:(id)a3 request:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void *v14;
  void *v15;
  NSObject *recordQueue;
  id v17;
  id v18;
  char v19;
  _QWORD block[5];
  id v22;
  id v23;
  uint64_t *v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  _BYTE buf[24];
  uint64_t (*v31)(uint64_t, uint64_t);
  _BYTE v32[20];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    -[CSAudioProvider UUID](self, "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v13 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    -[CSAudioProvider _streamStateName:](self, "_streamStateName:", self->_streamState);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "-[CSAudioProvider prepareAudioStreamSync:request:error:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2114;
    v31 = v13;
    *(_WORD *)v32 = 2114;
    *(_QWORD *)&v32[2] = v14;
    *(_WORD *)&v32[10] = 2114;
    *(_QWORD *)&v32[12] = v15;
    _os_log_impl(&dword_1B502E000, v11, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:prepareAudioStreamSync with stream : %{public}@ with stream state : %{public}@, request : %{public}@", buf, 0x34u);

  }
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v31 = __Block_byref_object_copy__6454;
  *(_QWORD *)v32 = __Block_byref_object_dispose__6455;
  *(_QWORD *)&v32[8] = 0;
  recordQueue = self->_recordQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__CSAudioProvider_prepareAudioStreamSync_request_error___block_invoke;
  block[3] = &unk_1E687F3A0;
  v24 = &v26;
  block[4] = self;
  v17 = v8;
  v22 = v17;
  v18 = v9;
  v23 = v18;
  v25 = buf;
  dispatch_async_and_wait(recordQueue, block);
  if (a5)
    *a5 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
  v19 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v26, 8);

  return v19;
}

- (void)prepareAudioStream:(id)a3 request:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *recordQueue;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    -[CSAudioProvider UUID](self, "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSAudioProvider _streamStateName:](self, "_streamStateName:", self->_streamState);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v25 = "-[CSAudioProvider prepareAudioStream:request:completion:]";
    v26 = 2114;
    v27 = v13;
    v28 = 2114;
    v29 = v14;
    v30 = 2114;
    v31 = v15;
    _os_log_impl(&dword_1B502E000, v12, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:prepareAudioStream with stream : %{public}@ with stream state : %{public}@", buf, 0x2Au);

  }
  recordQueue = self->_recordQueue;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __57__CSAudioProvider_prepareAudioStream_request_completion___block_invoke;
  v20[3] = &unk_1E687F4B8;
  v20[4] = self;
  v21 = v8;
  v22 = v9;
  v23 = v10;
  v17 = v10;
  v18 = v9;
  v19 = v8;
  dispatch_async(recordQueue, v20);

}

- (void)_startAudioStream:(id)a3 option:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *streamHandleQueue;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  NSObject *v29;
  id v30;
  unint64_t streamState;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  id v40;
  void *v41;
  int v42;
  void *v43;
  id v44;
  int64_t v45;
  _BOOL4 v46;
  void *v47;
  NSObject *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  id v61;
  void *v62;
  int v63;
  void *v64;
  id v65;
  unint64_t v66;
  void *v67;
  char v68;
  void *v69;
  int v70;
  void *v71;
  id v72;
  void *v73;
  int v74;
  void *v75;
  id v76;
  uint64_t v77;
  NSObject *v78;
  void *v79;
  CSAudioRecorder *audioRecorder;
  void *v81;
  unsigned int v82;
  void *v83;
  void *v84;
  NSObject *v85;
  unint64_t v86;
  void *v87;
  NSObject *v88;
  void *v89;
  void *v90;
  void *v91;
  int v92;
  id v93;
  void *v94;
  unint64_t v95;
  NSObject *v96;
  void *v97;
  NSObject *v98;
  void *v99;
  NSObject *v100;
  NSObject *v101;
  void *v102;
  NSObject *v103;
  NSObject *v104;
  NSObject *v105;
  uint64_t v106;
  void *v107;
  NSObject *v108;
  void *v109;
  void *v110;
  unint64_t v111;
  unint64_t v112;
  unint64_t v113;
  void *v114;
  void *v115;
  NSObject *v116;
  int v117;
  NSObject *v118;
  void *v119;
  id v120;
  void *v121;
  int v122;
  BOOL v123;
  id v124;
  os_log_t log;
  NSObject *loga;
  _QWORD v127[5];
  _QWORD v128[4];
  id v129;
  id v130;
  CSAudioProvider *v131;
  _QWORD v132[4];
  id v133;
  CSAudioProvider *v134;
  _QWORD v135[5];
  id v136;
  _QWORD v137[5];
  id v138;
  id v139;
  _QWORD v140[5];
  id v141;
  void (**v142)(_QWORD, _QWORD, _QWORD);
  _QWORD v143[5];
  id v144;
  id v145;
  _QWORD v146[5];
  id v147;
  id v148;
  _QWORD v149[5];
  os_log_t v150;
  id v151;
  id v152;
  unsigned int v153;
  BOOL v154;
  _QWORD v155[5];
  id v156;
  id v157;
  _QWORD v158[5];
  id v159;
  id v160;
  _QWORD v161[5];
  id v162;
  _QWORD v163[5];
  id v164;
  id v165;
  _QWORD block[4];
  id v167;
  char v168;
  _QWORD v169[4];
  id v170;
  uint8_t buf[4];
  const char *v172;
  __int16 v173;
  void *v174;
  __int16 v175;
  uint64_t v176;
  __int16 v177;
  unint64_t v178;
  uint64_t v179;

  v179 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordQueue);
  v11 = MEMORY[0x1E0C809B0];
  v169[0] = MEMORY[0x1E0C809B0];
  v169[1] = 3221225472;
  v169[2] = __55__CSAudioProvider__startAudioStream_option_completion___block_invoke;
  v169[3] = &unk_1E6881048;
  v12 = v10;
  v170 = v12;
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1B5E468D0](v169);
  if (self->_streamState)
  {
    if ((objc_msgSend(v9, "disableBoostForDoAP") & 1) != 0
      || -[CSAudioProvider audioStreamType](self, "audioStreamType") != 1)
    {
      v17 = 0;
    }
    else
    {
      -[CSAudioProvider audioRecorder](self, "audioRecorder");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSAudioProvider recordDeviceIndicator](self, "recordDeviceIndicator");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "recordRouteWithRecordDeviceIndicator:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0C89A08]);
    }
    objc_msgSend(v8, "setNeedsBoost12dB:", v17);
    streamHandleQueue = self->_streamHandleQueue;
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_66;
    block[3] = &unk_1E687F440;
    v19 = v8;
    v167 = v19;
    v168 = v17;
    dispatch_async(streamHandleQueue, block);
    if (self->_streamState == 4)
    {
      -[CSAudioProvider setStreamState:](self, "setStreamState:", 5);
      v20 = self->_streamHandleQueue;
      v163[0] = v11;
      v163[1] = 3221225472;
      v163[2] = __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_2;
      v163[3] = &unk_1E687F5D0;
      v163[4] = self;
      v164 = v19;
      v165 = v12;
      dispatch_async_and_wait(v20, v163);

      v21 = v164;
LABEL_96:

LABEL_97:
      v23 = v167;
      goto LABEL_98;
    }
    if (self->_audioSystemRecovering)
    {
      v24 = (void *)CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        v78 = v24;
        -[CSAudioProvider UUID](self, "UUID");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v172 = "-[CSAudioProvider _startAudioStream:option:completion:]";
        v173 = 2114;
        v174 = v79;
        _os_log_error_impl(&dword_1B502E000, v78, OS_LOG_TYPE_ERROR, "%s CSAudioProvider[%{public}@]:Cannot startAudioStream, audio system is recovering", buf, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 957, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v13)[2](v13, 0, v25);

      goto LABEL_97;
    }
    if ((objc_msgSend(v9, "requestHistoricalAudioDataWithHostTime") & 1) != 0
      || objc_msgSend(v9, "requestHistoricalAudioDataSampleCount"))
    {
      -[CSAudioProvider historicalBufferRequestStreams](self, "historicalBufferRequestStreams");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "containsObject:", v19);

      if ((v27 & 1) == 0)
      {
        -[CSAudioProvider historicalBufferRequestStreams](self, "historicalBufferRequestStreams");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addObject:", v19);

      }
    }
    v29 = self->_streamHandleQueue;
    v161[0] = v11;
    v161[1] = 3221225472;
    v161[2] = __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_67;
    v161[3] = &unk_1E6880E88;
    v161[4] = self;
    v30 = v19;
    v162 = v30;
    dispatch_async_and_wait(v29, v161);
    streamState = self->_streamState;
    if (streamState == 1)
    {
      objc_msgSend(v30, "streamRequest");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "requestListeningMicIndicatorLock");

      if (v38)
      {
        objc_msgSend(v30, "streamRequest");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = -[CSAudioProvider _acquireListeningMicIndicatorLockFrom:](self, "_acquireListeningMicIndicatorLockFrom:", objc_msgSend(v39, "clientIdentity"));

      }
      objc_msgSend(v30, "streamRequest");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "requestRecordModeLock");

      if (v42)
      {
        objc_msgSend(v30, "streamRequest");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = -[CSAudioProvider _acquireRecordModeLockFrom:](self, "_acquireRecordModeLockFrom:", objc_msgSend(v43, "clientIdentity"));

      }
      -[CSAudioProvider _setListeningMicIndicatorPropertyIfNeeded](self, "_setListeningMicIndicatorPropertyIfNeeded");
      v45 = -[CSAudioRecordContext type](self->_lastAudioRecorderContext, "type");
      v123 = v45 == 6;
      if (v45 == 6 && !+[CSUtils isLocalVoiceTriggerAvailable](CSUtils, "isLocalVoiceTriggerAvailable"))
      {
        audioRecorder = self->_audioRecorder;
        -[CSAudioProvider recordDeviceIndicator](self, "recordDeviceIndicator");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSAudioRecorder fetchGibraltarVoiceTriggerInfoWithRecordDeviceIndicator:](audioRecorder, "fetchGibraltarVoiceTriggerInfoWithRecordDeviceIndicator:", v81);
        v121 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v121 = 0;
      }
      -[CSAudioProvider _holdRecordingTransactionIfNeeded](self, "_holdRecordingTransactionIfNeeded");
      v82 = +[CSConfig inputRecordingNumberOfChannels](CSConfig, "inputRecordingNumberOfChannels");
      if (self->_audioStreamType == 1)
      {
        if (CSIsHorseman_onceToken != -1)
          dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
        if (CSIsHorseman_isHorseman)
          v82 = 1;
      }
      -[CSAudioProvider audioRecorder](self, "audioRecorder");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "getPlaybackRouteForStreamID:", -[CSAudioProvider audioStreamHandleId](self, "audioStreamHandleId"));
      v84 = (void *)objc_claimAutoreleasedReturnValue();

      v85 = self->_streamHandleQueue;
      v149[0] = v11;
      v149[1] = 3221225472;
      v149[2] = __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_2_71;
      v149[3] = &unk_1E687F468;
      v149[4] = self;
      v153 = v82;
      log = v84;
      v150 = log;
      v120 = v30;
      v151 = v120;
      v154 = v123;
      v124 = v121;
      v152 = v124;
      dispatch_async_and_wait(v85, v149);
      v86 = objc_msgSend(v9, "estimatedStartHostTime");
      if (v86)
        v86 = objc_msgSend(v9, "estimatedStartHostTime");
      self->_estimatedStartHostTime = v86;
      if (objc_msgSend(v9, "allowRecordWhileBeep") && objc_msgSend(v9, "startAlertBehavior") == 2)
      {
        v87 = (void *)CSLogCategoryAudio;
        if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
        {
          v88 = v87;
          -[CSAudioProvider UUID](self, "UUID");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v172 = "-[CSAudioProvider _startAudioStream:option:completion:]";
          v173 = 2114;
          v174 = v89;
          _os_log_impl(&dword_1B502E000, v88, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Skipping start alert to start recording", buf, 0x16u);

        }
        objc_msgSend(v9, "setStartAlertBehavior:", 0);
        v122 = 1;
      }
      else
      {
        v122 = 0;
      }
      -[CSAudioProvider audioRecorder](self, "audioRecorder");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSAudioProvider recordDeviceIndicator](self, "recordDeviceIndicator");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v148 = 0;
      v92 = objc_msgSend(v90, "startAudioStreamWithOption:recordDeviceIndicator:error:", v9, v91, &v148);
      v93 = v148;

      if (v92)
      {
        if (v122)
        {
          -[CSAudioProvider audioRecorder](self, "audioRecorder");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "playAlertSoundForType:overrideMode:", 1, 2);

        }
        if (!+[CSUtils isExclaveHardware](CSUtils, "isExclaveHardware", v93)
          || (v95 = -[CSAudioProvider audioStreamId](self, "audioStreamId"), v95 != *MEMORY[0x1E0C899D0]))
        {
          -[CSAudioProvider _scheduleAudioPacketWatchDog](self, "_scheduleAudioPacketWatchDog");
        }
        -[CSAudioProvider _scheduleDidStartRecordingDelegateWatchDog](self, "_scheduleDidStartRecordingDelegateWatchDog");
        -[CSAudioProvider setStreamState:](self, "setStreamState:", 2);
        -[CSAudioProvider _resetCircularBufferStartTime](self, "_resetCircularBufferStartTime");
        v96 = self->_streamHandleQueue;
        v146[0] = v11;
        v146[1] = 3221225472;
        v146[2] = __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_73;
        v146[3] = &unk_1E6880E88;
        v146[4] = self;
        v147 = v9;
        dispatch_async_and_wait(v96, v146);
        v97 = (void *)CSLogCategoryAudio;
        if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
        {
          v98 = v97;
          -[CSAudioProvider UUID](self, "UUID");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v172 = "-[CSAudioProvider _startAudioStream:option:completion:]";
          v173 = 2114;
          v174 = v99;
          _os_log_impl(&dword_1B502E000, v98, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Entering dispatch group for recordingWillStartGroup", buf, 0x16u);

        }
        dispatch_group_enter((dispatch_group_t)self->_recordingWillStartGroup);
        v100 = self->_streamHandleQueue;
        v143[0] = v11;
        v143[1] = 3221225472;
        v143[2] = __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_74;
        v143[3] = &unk_1E687F5D0;
        v143[4] = self;
        v144 = v120;
        v145 = v12;
        dispatch_async_and_wait(v100, v143);

        v93 = v119;
      }
      else
      {
        ((void (**)(_QWORD, _QWORD, id))v13)[2](v13, 0, v93);
      }

      v36 = v124;
      goto LABEL_94;
    }
    if (streamState != 3)
    {
      if (streamState != 2)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 955, 0);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, void *))v13)[2](v13, 0, v54);

LABEL_95:
        v21 = v162;
        goto LABEL_96;
      }
      if (-[CSAudioProvider _didPlayStartAlertSoundForSiri:audioStream:](self, "_didPlayStartAlertSoundForSiri:audioStream:", v9, v30))
      {
        v32 = self->_streamHandleQueue;
        v158[0] = v11;
        v158[1] = 3221225472;
        v158[2] = __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_2_68;
        v158[3] = &unk_1E687F5D0;
        v158[4] = self;
        v159 = v30;
        v160 = v12;
        dispatch_async_and_wait(v32, v158);
        self->_waitingForAlertFinish = 1;
        v33 = (void *)CSLogCategoryAudio;
        if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
        {
          v34 = v33;
          -[CSAudioProvider UUID](self, "UUID");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v172 = "-[CSAudioProvider _startAudioStream:option:completion:]";
          v173 = 2114;
          v174 = v35;
          _os_log_impl(&dword_1B502E000, v34, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Entering dispatch group for recordingWillStartGroup", buf, 0x16u);

        }
        dispatch_group_enter((dispatch_group_t)self->_recordingWillStartGroup);
        -[CSAudioProvider _scheduleAlertFinishTimeout:](self, "_scheduleAlertFinishTimeout:", 0.400000006);

        v36 = v159;
        goto LABEL_94;
      }
      objc_msgSend(v30, "streamRequest");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v69, "requestListeningMicIndicatorLock");

      if (v70)
      {
        objc_msgSend(v30, "streamRequest");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = -[CSAudioProvider _acquireListeningMicIndicatorLockFrom:](self, "_acquireListeningMicIndicatorLockFrom:", objc_msgSend(v71, "clientIdentity"));

      }
      objc_msgSend(v30, "streamRequest");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend(v73, "requestRecordModeLock");

      if (v74)
      {
        objc_msgSend(v30, "streamRequest");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = -[CSAudioProvider _acquireRecordModeLockFrom:](self, "_acquireRecordModeLockFrom:", objc_msgSend(v75, "clientIdentity"));

      }
      -[CSAudioProvider _setListeningMicIndicatorPropertyIfNeeded](self, "_setListeningMicIndicatorPropertyIfNeeded");
      if (-[CSAudioProvider circularBufferStartHostTime](self, "circularBufferStartHostTime"))
      {
        if (objc_msgSend(v9, "requestHistoricalAudioDataWithHostTime"))
          v77 = objc_msgSend(v9, "startRecordingHostTime");
        else
          v77 = mach_absolute_time();
        v106 = v77;
        if (v77 >= -[CSAudioProvider circularBufferStartHostTime](self, "circularBufferStartHostTime"))
        {
          v111 = -[CSAudioProvider circularBufferStartHostTime](self, "circularBufferStartHostTime");
          v112 = -[CSAudioProvider circularBufferStartSampleCount](self, "circularBufferStartSampleCount");
          +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
          v113 = +[CSFTimeUtils sampleCountFromHostTime:anchorHostTime:anchorSampleCount:sampleRate:](CSFTimeUtils, "sampleCountFromHostTime:anchorHostTime:anchorSampleCount:sampleRate:", v106, v111, v112);
          objc_msgSend(v30, "updateAudioStreamStartTimeInSampleCount:", v113);
          objc_msgSend(v30, "setScheduledFutureSample:", 1);
          v114 = (void *)CSLogCategoryAudio;
          if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
          {
            loga = v114;
            -[CSAudioProvider UUID](self, "UUID");
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315906;
            v172 = "-[CSAudioProvider _startAudioStream:option:completion:]";
            v173 = 2114;
            v174 = v115;
            v175 = 2050;
            v176 = v106;
            v177 = 2050;
            v178 = v113;
            v108 = loga;
            _os_log_impl(&dword_1B502E000, loga, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Requested startHostTime = %{public}llu, _clientStartSampleCount = %{public}tu", buf, 0x2Au);

            goto LABEL_92;
          }
        }
        else
        {
          v107 = (void *)CSLogCategoryAudio;
          if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
          {
            v108 = v107;
            -[CSAudioProvider UUID](self, "UUID");
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "name");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v172 = "-[CSAudioProvider _startAudioStream:option:completion:]";
            v173 = 2114;
            v174 = v109;
            v175 = 2114;
            v176 = (uint64_t)v110;
            _os_log_impl(&dword_1B502E000, v108, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:%{public}@ is requesting earlier audio than asked, we can't deliver earlier audio", buf, 0x20u);

LABEL_92:
          }
        }
      }
      v116 = self->_streamHandleQueue;
      v155[0] = v11;
      v155[1] = 3221225472;
      v155[2] = __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_70;
      v155[3] = &unk_1E687F5D0;
      v155[4] = self;
      v156 = v30;
      v157 = v12;
      dispatch_async_and_wait(v116, v155);

      v36 = v156;
LABEL_94:

      goto LABEL_95;
    }
    v46 = -[CSAudioProvider _didPlayStartAlertSoundForSiri:audioStream:](self, "_didPlayStartAlertSoundForSiri:audioStream:", v9, v30);
    v47 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v48 = v47;
      -[CSAudioProvider UUID](self, "UUID");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v172 = "-[CSAudioProvider _startAudioStream:option:completion:]";
      v173 = 2114;
      v174 = v49;
      v175 = 1024;
      LODWORD(v176) = v46;
      _os_log_impl(&dword_1B502E000, v48, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:shouldWaitForAlertFinish:%u", buf, 0x1Cu);

    }
    if (v46)
    {
      v50 = self->_streamHandleQueue;
      v140[0] = v11;
      v140[1] = 3221225472;
      v140[2] = __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_75;
      v140[3] = &unk_1E687F5D0;
      v140[4] = self;
      v141 = v30;
      v142 = v13;
      dispatch_async_and_wait(v50, v140);
      self->_waitingForAlertFinish = 1;
      v51 = (void *)CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
      {
        v52 = v51;
        -[CSAudioProvider UUID](self, "UUID");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v172 = "-[CSAudioProvider _startAudioStream:option:completion:]";
        v173 = 2114;
        v174 = v53;
        _os_log_impl(&dword_1B502E000, v52, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Entering dispatch group for recordingWillStartGroup", buf, 0x16u);

      }
      dispatch_group_enter((dispatch_group_t)self->_recordingWillStartGroup);
      -[CSAudioProvider _scheduleAlertFinishTimeout:](self, "_scheduleAlertFinishTimeout:", 0.400000006);

      v36 = v141;
      goto LABEL_94;
    }
    objc_msgSend(v30, "streamRequest");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "requestListeningMicIndicatorLock");

    if (v59)
    {
      objc_msgSend(v30, "streamRequest");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = -[CSAudioProvider _acquireListeningMicIndicatorLockFrom:](self, "_acquireListeningMicIndicatorLockFrom:", objc_msgSend(v60, "clientIdentity"));

    }
    objc_msgSend(v30, "streamRequest");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "requestRecordModeLock");

    if (v63)
    {
      objc_msgSend(v30, "streamRequest");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = -[CSAudioProvider _acquireRecordModeLockFrom:](self, "_acquireRecordModeLockFrom:", objc_msgSend(v64, "clientIdentity"));

    }
    -[CSAudioProvider _setListeningMicIndicatorPropertyIfNeeded](self, "_setListeningMicIndicatorPropertyIfNeeded");
    if (+[CSUtils isExclaveHardware](CSUtils, "isExclaveHardware")
      && (v66 = -[CSAudioProvider audioStreamId](self, "audioStreamId"), v66 == *MEMORY[0x1E0C899D0])
      && (objc_msgSend(v30, "streamRequest"),
          v67 = (void *)objc_claimAutoreleasedReturnValue(),
          v68 = objc_msgSend(v67, "requestExclaveAudio"),
          v67,
          (v68 & 1) == 0))
    {
      v117 = objc_msgSend(v9, "requestHistoricalAudioDataSampleCount");
      v118 = self->_streamHandleQueue;
      if (v117)
      {
        v137[0] = v11;
        v137[1] = 3221225472;
        v137[2] = __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_76;
        v137[3] = &unk_1E6880BF0;
        v137[4] = self;
        v138 = v9;
        v139 = v30;
        dispatch_async_and_wait(v118, v137);

        v102 = v138;
      }
      else
      {
        v135[0] = v11;
        v135[1] = 3221225472;
        v135[2] = __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_77;
        v135[3] = &unk_1E6880E88;
        v135[4] = self;
        v136 = v30;
        dispatch_async_and_wait(v118, v135);
        v102 = v136;
      }
    }
    else
    {
      if (objc_msgSend(v9, "requestHistoricalAudioDataSampleCount"))
      {
        objc_msgSend(v30, "updateAudioStreamStartTimeInSampleCount:", objc_msgSend(v9, "startRecordingSampleCount"));
LABEL_83:
        v103 = self->_streamHandleQueue;
        v128[0] = v11;
        v128[1] = 3221225472;
        v128[2] = __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_2_79;
        v128[3] = &unk_1E6880BF0;
        v129 = v9;
        v130 = v30;
        v131 = self;
        dispatch_async_and_wait(v103, v128);
        v13[2](v13, 1, 0);
        v104 = CSLogCategoryAudio;
        if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v172 = "-[CSAudioProvider _startAudioStream:option:completion:]";
          _os_log_impl(&dword_1B502E000, v104, OS_LOG_TYPE_DEFAULT, "%s Start deliver historical audio buffer immediately", buf, 0xCu);
        }
        v105 = self->_streamHandleQueue;
        v127[0] = v11;
        v127[1] = 3221225472;
        v127[2] = __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_81;
        v127[3] = &unk_1E6881138;
        v127[4] = self;
        dispatch_async_and_wait(v105, v127);

        v36 = v129;
        goto LABEL_94;
      }
      v101 = self->_streamHandleQueue;
      v132[0] = v11;
      v132[1] = 3221225472;
      v132[2] = __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_78;
      v132[3] = &unk_1E6880E88;
      v133 = v30;
      v134 = self;
      dispatch_async_and_wait(v101, v132);
      v102 = v133;
    }

    goto LABEL_83;
  }
  v22 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
  {
    v55 = v22;
    -[CSAudioProvider UUID](self, "UUID");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSAudioProvider _streamStateName:](self, "_streamStateName:", self->_streamState);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v172 = "-[CSAudioProvider _startAudioStream:option:completion:]";
    v173 = 2114;
    v174 = v56;
    v175 = 2114;
    v176 = (uint64_t)v57;
    _os_log_error_impl(&dword_1B502E000, v55, OS_LOG_TYPE_ERROR, "%s CSAudioProvider[%{public}@]:Cannot handle start audio stream on : %{public}@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 952, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, void *))v13)[2](v13, 0, v23);
LABEL_98:

}

- (id)_acquireListeningMicIndicatorLockFrom:(unint64_t)a3
{
  int v3;
  CSAudioProviderListeningMicIndicatorLock *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v5 = -[CSAudioProviderRequestLock initWithClientIdentity:]([CSAudioProviderListeningMicIndicatorLock alloc], "initWithClientIdentity:", a3);
  -[CSAudioProvider listeningMicIndicatorLocks](self, "listeningMicIndicatorLocks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAudioProviderRequestLock UUIDString](v5, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v5, v7);

  v8 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    -[CSAudioProviderRequestLock UUIDString](v5, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315650;
    v13 = "-[CSAudioProvider _acquireListeningMicIndicatorLockFrom:]";
    v14 = 1024;
    v15 = v3;
    v16 = 2112;
    v17 = v10;
    _os_log_impl(&dword_1B502E000, v9, OS_LOG_TYPE_DEFAULT, "%s Acquiring listening mic indicator lock from : %d %@", (uint8_t *)&v12, 0x1Cu);

  }
  return v5;
}

- (void)_releaseListeningMicIndicatorLock:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[CSAudioProvider _releaseListeningMicIndicatorLock:]";
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s Releasing listening mic indicator lock UUID = %@", (uint8_t *)&v9, 0x16u);
  }
  if (v4)
  {
    -[CSAudioProvider listeningMicIndicatorLocks](self, "listeningMicIndicatorLocks");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CSAudioProvider listeningMicIndicatorLocks](self, "listeningMicIndicatorLocks");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObjectForKey:", v4);

    }
  }
  -[CSAudioProvider _clearListeningMicIndicatorPropertyIfNeeded](self, "_clearListeningMicIndicatorPropertyIfNeeded");

}

- (void)_forceReleaseListeningMicIndicatorLockFrom:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[CSAudioProvider _forceReleaseListeningMicIndicatorLockFrom:]";
    v26 = 1024;
    LODWORD(v27) = a3;
    _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s Releasing listening mic indicator lock from : %d", buf, 0x12u);
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[CSAudioProvider listeningMicIndicatorLocks](self, "listeningMicIndicatorLocks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v21;
    *(_QWORD *)&v9 = 136315394;
    v19 = v9;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12);
        -[CSAudioProvider listeningMicIndicatorLocks](self, "listeningMicIndicatorLocks", v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "clientIdentity");

        if (v16 == a3)
        {
          v17 = CSLogCategoryAudio;
          if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v19;
            v25 = "-[CSAudioProvider _forceReleaseListeningMicIndicatorLockFrom:]";
            v26 = 2112;
            v27 = v13;
            _os_log_impl(&dword_1B502E000, v17, OS_LOG_TYPE_DEFAULT, "%s Releasing listening mic indicator lock %@", buf, 0x16u);
          }
          -[CSAudioProvider listeningMicIndicatorLocks](self, "listeningMicIndicatorLocks");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "removeObjectForKey:", v13);

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v10);
  }

  -[CSAudioProvider _clearListeningMicIndicatorPropertyIfNeeded](self, "_clearListeningMicIndicatorPropertyIfNeeded");
}

- (void)_forceReleaseAllListeningMicIndicatorLocks
{
  void *v3;

  -[CSAudioProvider listeningMicIndicatorLocks](self, "listeningMicIndicatorLocks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[CSAudioProvider _clearListeningMicIndicatorPropertyIfNeeded](self, "_clearListeningMicIndicatorPropertyIfNeeded");
}

- (void)_setListeningMicIndicatorPropertyIfNeeded
{
  void *v3;
  uint64_t v4;

  -[CSAudioProvider listeningMicIndicatorLocks](self, "listeningMicIndicatorLocks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
    -[CSAudioProvider _setListeningMicIndicatorProperty](self, "_setListeningMicIndicatorProperty");
}

- (void)_clearListeningMicIndicatorPropertyIfNeeded
{
  void *v3;
  uint64_t v4;

  -[CSAudioProvider listeningMicIndicatorLocks](self, "listeningMicIndicatorLocks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    -[CSAudioProvider _clearListeningMicIndicatorProperty](self, "_clearListeningMicIndicatorProperty");
}

- (BOOL)_setListeningMicIndicatorProperty
{
  NSObject *v3;
  void *v4;
  char v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[CSAudioProvider _setListeningMicIndicatorProperty]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s Setting listening mic indicator lock property", (uint8_t *)&v7, 0xCu);
  }
  -[CSAudioProvider audioRecorder](self, "audioRecorder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "setListeningMicIndicatorProperty");

  return v5;
}

- (BOOL)_clearListeningMicIndicatorProperty
{
  NSObject *v3;
  void *v4;
  char v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[CSAudioProvider _clearListeningMicIndicatorProperty]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s Clearing listening mic indicator lock property", (uint8_t *)&v7, 0xCu);
  }
  -[CSAudioProvider audioRecorder](self, "audioRecorder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "clearListeningMicIndicatorProperty");

  return v5;
}

- (id)_acquireRecordModeLockFrom:(unint64_t)a3
{
  NSObject *v5;
  CSAudioProviderRecordModeLock *v6;
  void *v7;
  void *v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[CSAudioProvider _acquireRecordModeLockFrom:]";
    v12 = 1024;
    v13 = a3;
    _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s Acquiring recordModeLock from : %d", (uint8_t *)&v10, 0x12u);
  }
  v6 = -[CSAudioProviderRequestLock initWithClientIdentity:]([CSAudioProviderRecordModeLock alloc], "initWithClientIdentity:", a3);
  -[CSAudioProvider recordModeLocks](self, "recordModeLocks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAudioProviderRequestLock UUIDString](v6, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v6, v8);

  -[CSAudioProvider _switchToRecordingMode](self, "_switchToRecordingMode");
  return v6;
}

- (void)_releaseRecordModeLock:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315394;
    v12 = "-[CSAudioProvider _releaseRecordModeLock:]";
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s Releasing recordModeLock lock UUID = %@", (uint8_t *)&v11, 0x16u);
  }
  if (v4)
  {
    -[CSAudioProvider recordModeLocks](self, "recordModeLocks");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CSAudioProvider recordModeLocks](self, "recordModeLocks");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObjectForKey:", v4);

    }
  }
  -[CSAudioProvider recordModeLocks](self, "recordModeLocks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (!v10)
    -[CSAudioProvider _switchToListeningMode](self, "_switchToListeningMode");

}

- (void)_forceReleaseRecordModeLockFrom:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "-[CSAudioProvider _forceReleaseRecordModeLockFrom:]";
    v28 = 1024;
    LODWORD(v29) = a3;
    _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s Releasing recordModeLock from : %d", buf, 0x12u);
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[CSAudioProvider recordModeLocks](self, "recordModeLocks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v23;
    *(_QWORD *)&v9 = 136315394;
    v21 = v9;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v12);
        -[CSAudioProvider recordModeLocks](self, "recordModeLocks", v21);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "clientIdentity");

        if (v16 == a3)
        {
          v17 = CSLogCategoryAudio;
          if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v21;
            v27 = "-[CSAudioProvider _forceReleaseRecordModeLockFrom:]";
            v28 = 2112;
            v29 = v13;
            _os_log_impl(&dword_1B502E000, v17, OS_LOG_TYPE_DEFAULT, "%s Releasing recordModeLock lock %@", buf, 0x16u);
          }
          -[CSAudioProvider recordModeLocks](self, "recordModeLocks");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "removeObjectForKey:", v13);

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v10);
  }

  -[CSAudioProvider recordModeLocks](self, "recordModeLocks");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (!v20)
    -[CSAudioProvider _switchToListeningMode](self, "_switchToListeningMode");
}

- (void)_forceReleaseAllRecordModeLocks
{
  void *v3;

  -[CSAudioProvider recordModeLocks](self, "recordModeLocks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[CSAudioProvider _switchToListeningMode](self, "_switchToListeningMode");
}

- (void)_switchToRecordingMode
{
  void *v3;
  uint64_t v4;

  -[CSAudioProvider audioRecorder](self, "audioRecorder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  objc_msgSend(v3, "setRecordMode:streamHandleId:error:", 1, -[CSAudioProvider audioStreamHandleId](self, "audioStreamHandleId"), &v4);

}

- (void)_switchToListeningMode
{
  void *v3;
  uint64_t v4;

  -[CSAudioProvider audioRecorder](self, "audioRecorder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  objc_msgSend(v3, "setRecordMode:streamHandleId:error:", 2, -[CSAudioProvider audioStreamHandleId](self, "audioStreamHandleId"), &v4);

  -[CSAudioProvider _setListeningMicIndicatorPropertyIfNeeded](self, "_setListeningMicIndicatorPropertyIfNeeded");
}

- (void)_resetCircularBufferStartTime
{
  -[CSAudioProvider setCircularBufferStartSampleCount:](self, "setCircularBufferStartSampleCount:", 0);
  -[CSAudioProvider setCircularBufferStartHostTime:](self, "setCircularBufferStartHostTime:", 0);
}

- (void)_handleDidStartAudioStreamWithResult:(BOOL)a3 error:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *streamHandleQueue;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD block[5];
  id v19;
  BOOL v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v4 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!v4)
  {
    -[CSAudioProvider _cancelAudioPacketWatchDog](self, "_cancelAudioPacketWatchDog");
    -[CSAudioProvider _forceReleaseAllListeningMicIndicatorLocks](self, "_forceReleaseAllListeningMicIndicatorLocks");
    -[CSAudioProvider _forceReleaseAllRecordModeLocks](self, "_forceReleaseAllRecordModeLocks");
  }
  -[CSAudioProvider _clearDidStartRecordingDelegateWatchDog](self, "_clearDidStartRecordingDelegateWatchDog");
  if (self->_streamState == 2)
  {
    streamHandleQueue = self->_streamHandleQueue;
    v8 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__CSAudioProvider__handleDidStartAudioStreamWithResult_error___block_invoke;
    block[3] = &unk_1E6880350;
    v20 = v4;
    block[4] = self;
    v19 = v6;
    dispatch_async_and_wait(streamHandleQueue, block);
    if (v4)
    {
      -[CSAudioProvider setStreamState:](self, "setStreamState:", 3);
    }
    else
    {
      -[CSAudioProvider setStreamState:](self, "setStreamState:", 1);
      v13 = self->_streamHandleQueue;
      v17[0] = v8;
      v17[1] = 3221225472;
      v17[2] = __62__CSAudioProvider__handleDidStartAudioStreamWithResult_error___block_invoke_2;
      v17[3] = &unk_1E6881138;
      v17[4] = self;
      dispatch_async(v13, v17);
      -[CSAudioProvider _releaseRecordingTransactionIfNeeded](self, "_releaseRecordingTransactionIfNeeded");
    }
    v14 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      -[CSAudioProvider UUID](self, "UUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v22 = "-[CSAudioProvider _handleDidStartAudioStreamWithResult:error:]";
      v23 = 2114;
      v24 = v16;
      _os_log_impl(&dword_1B502E000, v15, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Leaving dispatch group for recordingWillStartGroup", buf, 0x16u);

    }
    dispatch_group_leave((dispatch_group_t)self->_recordingWillStartGroup);

  }
  else
  {
    v9 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_FAULT))
    {
      v10 = v9;
      -[CSAudioProvider UUID](self, "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSAudioProvider _streamStateName:](self, "_streamStateName:", self->_streamState);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v22 = "-[CSAudioProvider _handleDidStartAudioStreamWithResult:error:]";
      v23 = 2114;
      v24 = v11;
      v25 = 2114;
      v26 = v12;
      _os_log_fault_impl(&dword_1B502E000, v10, OS_LOG_TYPE_FAULT, "%s CSAudioProvider[%{public}@]:Received didStartRecording while %{public}@", buf, 0x20u);

    }
  }

}

- (void)_preEpilogueAudioStream
{
  NSObject *streamHandleQueue;
  _QWORD block[5];

  streamHandleQueue = self->_streamHandleQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CSAudioProvider__preEpilogueAudioStream__block_invoke;
  block[3] = &unk_1E6881138;
  block[4] = self;
  dispatch_async(streamHandleQueue, block);
}

- (void)_postEpilogueAudioStream
{
  NSObject *streamHandleQueue;
  _QWORD block[5];

  streamHandleQueue = self->_streamHandleQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CSAudioProvider__postEpilogueAudioStream__block_invoke;
  block[3] = &unk_1E6881138;
  block[4] = self;
  dispatch_async_and_wait(streamHandleQueue, block);
  -[CSAudioProvider _releaseRecordingTransactionIfNeeded](self, "_releaseRecordingTransactionIfNeeded");
}

- (void)_handleDidStopAudioStreamWithReason:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  unint64_t streamState;
  uint64_t v10;
  NSObject *streamHandleQueue;
  _QWORD *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _QWORD v23[7];
  _QWORD v24[6];
  _QWORD v25[5];
  _QWORD block[5];
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  _QWORD v32[5];

  v32[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[CSAudioProvider UUID](self, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSAudioProvider _streamStateName:](self, "_streamStateName:", self->_streamState);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v28 = "-[CSAudioProvider _handleDidStopAudioStreamWithReason:]";
    v29 = 2114;
    v30 = v7;
    v31 = 1026;
    LODWORD(v32[0]) = a3;
    WORD2(v32[0]) = 2114;
    *(_QWORD *)((char *)v32 + 6) = v8;
    _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Received didStopRecording reason : %{public}d, streamState : %{public}@", buf, 0x26u);

  }
  -[CSAudioProvider _forceReleaseAllListeningMicIndicatorLocks](self, "_forceReleaseAllListeningMicIndicatorLocks");
  -[CSAudioProvider _forceReleaseAllRecordModeLocks](self, "_forceReleaseAllRecordModeLocks");
  -[CSAudioProvider _cancelAudioPacketWatchDog](self, "_cancelAudioPacketWatchDog");
  -[CSAudioProvider _clearDidStopRecordingDelegateWatchDog](self, "_clearDidStopRecordingDelegateWatchDog");
  -[CSAudioProvider _preEpilogueAudioStream](self, "_preEpilogueAudioStream");
  streamState = self->_streamState;
  v10 = MEMORY[0x1E0C809B0];
  if (streamState - 4 < 2)
  {
    v13 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[CSAudioProvider _handleDidStopAudioStreamWithReason:]";
      _os_log_impl(&dword_1B502E000, v13, OS_LOG_TYPE_DEFAULT, "%s Calling unexpected didStop for all weak streams", buf, 0xCu);
    }
    streamHandleQueue = self->_streamHandleQueue;
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __55__CSAudioProvider__handleDidStopAudioStreamWithReason___block_invoke;
    block[3] = &unk_1E6881138;
    block[4] = self;
    v12 = block;
    goto LABEL_10;
  }
  if (streamState == 2)
  {
    -[CSAudioProvider _clearDidStartRecordingDelegateWatchDog](self, "_clearDidStartRecordingDelegateWatchDog");
    v14 = self->_streamHandleQueue;
    v25[0] = v10;
    v25[1] = 3221225472;
    v25[2] = __55__CSAudioProvider__handleDidStopAudioStreamWithReason___block_invoke_84;
    v25[3] = &unk_1E6881138;
    v25[4] = self;
    dispatch_async_and_wait(v14, v25);
    v15 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      -[CSAudioProvider UUID](self, "UUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v28 = "-[CSAudioProvider _handleDidStopAudioStreamWithReason:]";
      v29 = 2114;
      v30 = v17;
      _os_log_impl(&dword_1B502E000, v16, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Leaving dispatch group for recordingWillStartGroup", buf, 0x16u);

    }
    dispatch_group_leave((dispatch_group_t)self->_recordingWillStartGroup);
    v18 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_FAULT))
    {
      v20 = v18;
      -[CSAudioProvider UUID](self, "UUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSAudioProvider _streamStateName:](self, "_streamStateName:", self->_streamState);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v28 = "-[CSAudioProvider _handleDidStopAudioStreamWithReason:]";
      v29 = 2114;
      v30 = v21;
      v31 = 2114;
      v32[0] = v22;
      _os_log_fault_impl(&dword_1B502E000, v20, OS_LOG_TYPE_FAULT, "%s CSAudioProvider[%{public}@]:Received didStopRecording while %{public}@", buf, 0x20u);

    }
  }
  else if (streamState == 3)
  {
    streamHandleQueue = self->_streamHandleQueue;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __55__CSAudioProvider__handleDidStopAudioStreamWithReason___block_invoke_85;
    v24[3] = &unk_1E6881228;
    v24[4] = self;
    v24[5] = a3;
    v12 = v24;
LABEL_10:
    dispatch_async_and_wait(streamHandleQueue, v12);
  }
  -[CSAudioProvider setStreamState:](self, "setStreamState:", 1);
  -[CSAudioProvider _postEpilogueAudioStream](self, "_postEpilogueAudioStream");
  v19 = self->_streamHandleQueue;
  v23[0] = v10;
  v23[1] = 3221225472;
  v23[2] = __55__CSAudioProvider__handleDidStopAudioStreamWithReason___block_invoke_2;
  v23[3] = &unk_1E687F490;
  v23[4] = self;
  v23[5] = streamState;
  v23[6] = a3;
  dispatch_async_and_wait(v19, v23);
}

- (void)stopAudioStream:(id)a3 option:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *recordQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  recordQueue = self->_recordQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __53__CSAudioProvider_stopAudioStream_option_completion___block_invoke;
  v15[3] = &unk_1E687F4B8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(recordQueue, v15);

}

- (void)_stopAudioStream:(id)a3 option:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *recordingWillStartGroup;
  NSObject *recordQueue;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordQueue);
  v11 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    -[CSAudioProvider UUID](self, "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v24 = "-[CSAudioProvider _stopAudioStream:option:completion:]";
    v25 = 2114;
    v26 = v13;
    _os_log_impl(&dword_1B502E000, v12, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Waiting for recordingWillStartGroup before scheduling stopAudioStream", buf, 0x16u);

  }
  recordingWillStartGroup = self->_recordingWillStartGroup;
  recordQueue = self->_recordQueue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke;
  v19[3] = &unk_1E687F4B8;
  v19[4] = self;
  v20 = v8;
  v21 = v9;
  v22 = v10;
  v16 = v9;
  v17 = v10;
  v18 = v8;
  dispatch_group_notify(recordingWillStartGroup, recordQueue, v19);

}

- (id)audioChunkFrom:(unint64_t)a3 to:(unint64_t)a4
{
  NSObject *recordQueue;
  id v5;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__6454;
  v12 = __Block_byref_object_dispose__6455;
  v13 = 0;
  recordQueue = self->_recordQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__CSAudioProvider_audioChunkFrom_to___block_invoke;
  v7[3] = &unk_1E687F508;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  v7[7] = a4;
  dispatch_async_and_wait(recordQueue, v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)audioChunkFrom:(unint64_t)a3 to:(unint64_t)a4 channelIdx:(unint64_t)a5
{
  NSObject *streamHandleQueue;
  id v6;
  _QWORD block[9];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__6454;
  v13 = __Block_byref_object_dispose__6455;
  v14 = 0;
  streamHandleQueue = self->_streamHandleQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CSAudioProvider_audioChunkFrom_to_channelIdx___block_invoke;
  block[3] = &unk_1E687F4E0;
  block[4] = self;
  block[5] = &v9;
  block[6] = a3;
  block[7] = a4;
  block[8] = a5;
  dispatch_async_and_wait(streamHandleQueue, block);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)audioChunkToEndFrom:(unint64_t)a3
{
  NSObject *streamHandleQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__6454;
  v11 = __Block_byref_object_dispose__6455;
  v12 = 0;
  streamHandleQueue = self->_streamHandleQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__CSAudioProvider_audioChunkToEndFrom___block_invoke;
  block[3] = &unk_1E6880E38;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_async_and_wait(streamHandleQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)audioChunkToEndFrom:(unint64_t)a3 channelIdx:(unint64_t)a4
{
  NSObject *streamHandleQueue;
  id v5;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__6454;
  v12 = __Block_byref_object_dispose__6455;
  v13 = 0;
  streamHandleQueue = self->_streamHandleQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__CSAudioProvider_audioChunkToEndFrom_channelIdx___block_invoke;
  v7[3] = &unk_1E687F508;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  v7[7] = a4;
  dispatch_async_and_wait(streamHandleQueue, v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)_audioChunkFrom:(unint64_t)a3 to:(unint64_t)a4
{
  id v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_streamHandleQueue);
  if (a3 >= a4)
    v7 = 0;
  else
    v7 = -[CSAudioCircularBuffer copySamplesFrom:to:](self->_circularBuffer, "copySamplesFrom:to:", a3, a4);
  return v7;
}

- (id)_audioChunkFrom:(unint64_t)a3 to:(unint64_t)a4 channelIdx:(unint64_t)a5
{
  id v9;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_streamHandleQueue);
  if (a3 >= a4)
    v9 = 0;
  else
    v9 = -[CSAudioCircularBuffer copySamplesFrom:to:channelIdx:](self->_circularBuffer, "copySamplesFrom:to:channelIdx:", a3, a4, a5);
  return v9;
}

- (void)saveRecordingBufferToEndFrom:(unint64_t)a3 toURL:(id)a4
{
  id v6;
  NSObject *streamHandleQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  streamHandleQueue = self->_streamHandleQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CSAudioProvider_saveRecordingBufferToEndFrom_toURL___block_invoke;
  block[3] = &unk_1E687FCC0;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(streamHandleQueue, block);

}

- (void)saveRecordingBufferFrom:(unint64_t)a3 to:(unint64_t)a4 toURL:(id)a5
{
  id v8;
  NSObject *streamHandleQueue;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  unint64_t v14;

  v8 = a5;
  streamHandleQueue = self->_streamHandleQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__CSAudioProvider_saveRecordingBufferFrom_to_toURL___block_invoke;
  v11[3] = &unk_1E687FF38;
  v13 = a3;
  v14 = a4;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_async(streamHandleQueue, v11);

}

- (void)_saveRecordingBufferFrom:(unint64_t)a3 to:(unint64_t)a4 toURL:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *loggingQueue;
  _QWORD v12[4];
  id v13;
  id v14;
  unint64_t v15;
  unint64_t v16;

  v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_streamHandleQueue);
  v9 = -[CSAudioCircularBuffer copySamplesFrom:to:](self->_circularBuffer, "copySamplesFrom:to:", a3, a4);
  v10 = v9;
  if (v9)
  {
    loggingQueue = self->_loggingQueue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53__CSAudioProvider__saveRecordingBufferFrom_to_toURL___block_invoke;
    v12[3] = &unk_1E687FF38;
    v15 = a3;
    v16 = a4;
    v13 = v9;
    v14 = v8;
    dispatch_async(loggingQueue, v12);

  }
}

- (id)holdAudioStreamWithDescription:(id)a3 option:(id)a4
{
  id v6;
  id v7;
  CSAudioStreamHolding *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *recordQueue;
  CSAudioStreamHolding *v14;
  id v15;
  void *v16;
  CSAudioStreamHolding *v17;
  _QWORD block[5];
  CSAudioStreamHolding *v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  double v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = -[CSAudioStreamHolding initWithName:clientIdentity:]([CSAudioStreamHolding alloc], "initWithName:clientIdentity:", v7, objc_msgSend(v6, "clientIdentity"));

  v9 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    -[CSAudioProvider UUID](self, "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSAudioStreamHolding name](v8, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v23 = "-[CSAudioProvider holdAudioStreamWithDescription:option:]";
    v24 = 2114;
    v25 = v11;
    v26 = 2114;
    v27 = v12;
    v28 = 2050;
    v29 = (float)(unint64_t)objc_msgSend(v6, "clientIdentity");
    _os_log_impl(&dword_1B502E000, v10, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:%{public}@ ask for audio hold stream for %{public}f", buf, 0x2Au);

  }
  recordQueue = self->_recordQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__CSAudioProvider_holdAudioStreamWithDescription_option___block_invoke;
  block[3] = &unk_1E6880BF0;
  block[4] = self;
  v14 = v8;
  v20 = v14;
  v21 = v6;
  v15 = v6;
  dispatch_async(recordQueue, block);
  v16 = v21;
  v17 = v14;

  return v17;
}

- (void)_holdAudioStreamWithHolder:(id)a3 option:(id)a4
{
  id v6;
  id v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  dispatch_time_t v18;
  NSObject *recordQueue;
  _QWORD block[4];
  id v21;
  id v22;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "timeout");
  if (v8 > 0.0)
  {
    if (objc_msgSend(v7, "requireListeningMicIndicatorLock"))
    {
      -[CSAudioProvider _acquireListeningMicIndicatorLockFrom:](self, "_acquireListeningMicIndicatorLockFrom:", objc_msgSend(v7, "clientIdentity"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setListeningMicIndicatorLockUUIDString:", v10);

    }
    if (objc_msgSend(v7, "requireRecordModeLock"))
    {
      -[CSAudioProvider _acquireRecordModeLockFrom:](self, "_acquireRecordModeLockFrom:", objc_msgSend(v7, "clientIdentity"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UUIDString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setRecordModeLockUUIDString:", v12);

    }
    -[CSAudioProvider streamHolders](self, "streamHolders");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v6);

    +[CSAudioStreamActivityMonitor sharedInstance](CSAudioStreamActivityMonitor, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSAudioProvider streams](self, "streams");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSAudioProvider streamHolders](self, "streamHolders");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "notifyActiveStreamsChanged:streamHolders:streamId:", v15, v16, self->_audioStreamHandleId);

    objc_initWeak(&location, self);
    objc_msgSend(v7, "timeout");
    v18 = dispatch_time(0, (uint64_t)(v17 * 1000000000.0));
    recordQueue = self->_recordQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__CSAudioProvider__holdAudioStreamWithHolder_option___block_invoke;
    block[3] = &unk_1E687F530;
    objc_copyWeak(&v22, &location);
    v21 = v6;
    dispatch_after(v18, recordQueue, block);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

}

- (void)_didFireStreamHolderTimeout:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[CSAudioProvider UUID](self, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315650;
    v10 = "-[CSAudioProvider _didFireStreamHolderTimeout:]";
    v11 = 2114;
    v12 = v7;
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Timeout for %{public}@ has fired", (uint8_t *)&v9, 0x20u);

  }
  -[CSAudioProvider _cancelAudioStreamHold:](self, "_cancelAudioStreamHold:", v4);

}

- (void)_cancelAudioStreamHold:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CSAudioProvider streamHolders](self, "streamHolders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  v7 = (void *)CSLogCategoryAudio;
  v8 = os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v9 = v7;
      -[CSAudioProvider UUID](self, "UUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 136315650;
      v23 = "-[CSAudioProvider _cancelAudioStreamHold:]";
      v24 = 2114;
      v25 = v10;
      v26 = 2114;
      v27 = v11;
      _os_log_impl(&dword_1B502E000, v9, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Removing %{public}@ from stream holders", (uint8_t *)&v22, 0x20u);

    }
    -[CSAudioProvider streamHolders](self, "streamHolders");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObject:", v4);

    objc_msgSend(v4, "listeningMicIndicatorLockUUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v4, "listeningMicIndicatorLockUUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSAudioProvider _releaseListeningMicIndicatorLock:](self, "_releaseListeningMicIndicatorLock:", v14);

    }
    objc_msgSend(v4, "recordModeLockUUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v4, "recordModeLockUUIDString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSAudioProvider _releaseRecordModeLock:](self, "_releaseRecordModeLock:", v16);

    }
    -[CSAudioProvider _stopAudioStream:option:completion:](self, "_stopAudioStream:option:completion:", 0, 0, 0);
    +[CSAudioStreamActivityMonitor sharedInstance](CSAudioStreamActivityMonitor, "sharedInstance");
    v17 = objc_claimAutoreleasedReturnValue();
    -[CSAudioProvider streams](self, "streams");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSAudioProvider streamHolders](self, "streamHolders");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject notifyActiveStreamsChanged:streamHolders:streamId:](v17, "notifyActiveStreamsChanged:streamHolders:streamId:", v18, v19, self->_audioStreamHandleId);

    goto LABEL_11;
  }
  if (v8)
  {
    v17 = v7;
    -[CSAudioProvider UUID](self, "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 136315650;
    v23 = "-[CSAudioProvider _cancelAudioStreamHold:]";
    v24 = 2114;
    v25 = v20;
    v26 = 2114;
    v27 = v21;
    _os_log_impl(&dword_1B502E000, v17, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:%{public}@ stream holder was already removed from stream holders", (uint8_t *)&v22, 0x20u);

LABEL_11:
  }

}

- (void)cancelAudioStreamHold:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *recordQueue;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      -[CSAudioProvider UUID](self, "UUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v13 = "-[CSAudioProvider cancelAudioStreamHold:]";
      v14 = 2114;
      v15 = v7;
      v16 = 2114;
      v17 = v8;
      _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:%{public}@ ask for cancel hold stream", buf, 0x20u);

    }
    recordQueue = self->_recordQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __41__CSAudioProvider_cancelAudioStreamHold___block_invoke;
    v10[3] = &unk_1E6880E88;
    v10[4] = self;
    v11 = v4;
    dispatch_async(recordQueue, v10);

  }
}

- (id)recordRoute
{
  NSObject *recordQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6454;
  v10 = __Block_byref_object_dispose__6455;
  v11 = 0;
  recordQueue = self->_recordQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__CSAudioProvider_recordRoute__block_invoke;
  v5[3] = &unk_1E6880D18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(recordQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)recordDeviceInfo
{
  NSObject *recordQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6454;
  v10 = __Block_byref_object_dispose__6455;
  v11 = 0;
  recordQueue = self->_recordQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__CSAudioProvider_recordDeviceInfo__block_invoke;
  v5[3] = &unk_1E6880D18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(recordQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)audioDeviceInfo
{
  NSObject *recordQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6454;
  v10 = __Block_byref_object_dispose__6455;
  v11 = 0;
  recordQueue = self->_recordQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__CSAudioProvider_audioDeviceInfo__block_invoke;
  v5[3] = &unk_1E6880D18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(recordQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)recordSettings
{
  NSObject *recordQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6454;
  v10 = __Block_byref_object_dispose__6455;
  v11 = 0;
  recordQueue = self->_recordQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__CSAudioProvider_recordSettings__block_invoke;
  v5[3] = &unk_1E6880D18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(recordQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)playbackRoute
{
  NSObject *recordQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6454;
  v10 = __Block_byref_object_dispose__6455;
  v11 = 0;
  recordQueue = self->_recordQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__CSAudioProvider_playbackRoute__block_invoke;
  v5[3] = &unk_1E6880D18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(recordQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setAudioSessionDelegate:(id)a3
{
  id v4;
  NSObject *recordQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  recordQueue = self->_recordQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__CSAudioProvider_setAudioSessionDelegate___block_invoke;
  v7[3] = &unk_1E6880E88;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(recordQueue, v7);

}

- (BOOL)prewarmAudioSessionWithError:(id *)a3
{
  NSObject *recordQueue;
  NSObject *v5;
  BOOL v6;
  void *v8;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 1;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__6454;
  v14 = __Block_byref_object_dispose__6455;
  v15 = 0;
  recordQueue = self->_recordQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CSAudioProvider_prewarmAudioSessionWithError___block_invoke;
  block[3] = &unk_1E687F558;
  block[4] = self;
  block[5] = &v16;
  block[6] = &v10;
  dispatch_async_and_wait(recordQueue, block);
  if (!*((_BYTE *)v17 + 24))
  {
    v5 = (id)CSLogCategoryAudio;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)v11[5], "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v21 = "-[CSAudioProvider prewarmAudioSessionWithError:]";
      v22 = 2114;
      v23 = v8;
      _os_log_error_impl(&dword_1B502E000, v5, OS_LOG_TYPE_ERROR, "%s Failed to prewarmAudioSessionWithError : %{public}@", buf, 0x16u);

    }
  }
  if (a3)
    *a3 = objc_retainAutorelease((id)v11[5]);
  v6 = *((_BYTE *)v17 + 24) != 0;
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v6;
}

- (BOOL)activateAudioSessionWithReason:(unint64_t)a3 dynamicAttribute:(unint64_t)a4 bundleID:(id)a5 error:(id *)a6
{
  id v9;
  NSObject *recordQueue;
  NSObject *v11;
  BOOL v12;
  void *v14;
  _QWORD v15[8];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__6454;
  v20 = __Block_byref_object_dispose__6455;
  v21 = 0;
  recordQueue = self->_recordQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __82__CSAudioProvider_activateAudioSessionWithReason_dynamicAttribute_bundleID_error___block_invoke;
  v15[3] = &unk_1E687F580;
  v15[4] = self;
  v15[5] = &v22;
  v15[6] = &v16;
  v15[7] = a3;
  dispatch_async_and_wait(recordQueue, v15);
  if (!*((_BYTE *)v23 + 24))
  {
    v11 = (id)CSLogCategoryAudio;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)v17[5], "localizedDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v27 = "-[CSAudioProvider activateAudioSessionWithReason:dynamicAttribute:bundleID:error:]";
      v28 = 2114;
      v29 = v14;
      _os_log_error_impl(&dword_1B502E000, v11, OS_LOG_TYPE_ERROR, "%s Failed to activateAudioSessionWithReason: %{public}@", buf, 0x16u);

    }
  }
  if (a6)
    *a6 = objc_retainAutorelease((id)v17[5]);
  v12 = *((_BYTE *)v23 + 24) != 0;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v12;
}

- (BOOL)_activateAudioSessionWithReason:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  id v17;
  int v18;
  void *v19;
  void *v20;
  NSObject *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordQueue);
  v7 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    -[CSAudioProvider UUID](self, "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSAudioProvider _streamStateName:](self, "_streamStateName:", self->_streamState);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v26 = "-[CSAudioProvider _activateAudioSessionWithReason:error:]";
    v27 = 2114;
    v28 = v9;
    v29 = 2114;
    v30 = v10;
    _os_log_impl(&dword_1B502E000, v8, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Activating Audio Session under : %{public}@", buf, 0x20u);

  }
  self->_currentSessionShouldDuckOnBuiltInSpeaker = 0;
  v11 = AFDeviceSupportsSystemAssistantExperience();
  -[CSAudioProvider audioRecorder](self, "audioRecorder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEnableInterruptionByRecordingClientsForStream:enable:", -[CSAudioProvider audioStreamId](self, "audioStreamId"), v11);

  -[CSAudioProvider audioRecorder](self, "audioRecorder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = -[CSAudioProvider _shouldDuckOnBuiltInSpeaker](self, "_shouldDuckOnBuiltInSpeaker");
    self->_currentSessionShouldDuckOnBuiltInSpeaker = v14;
    if (v14)
    {
      -[CSAudioProvider audioRecorder](self, "audioRecorder");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setDuckMixWithOthersForStream:duckOthers:duckToLevelInDB:mixWithOthers:", -[CSAudioProvider audioStreamHandleId](self, "audioStreamHandleId"), 1, &unk_1E68A1B08, 1);

    }
    -[CSAudioProvider audioRecorder](self, "audioRecorder");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    LODWORD(v13) = objc_msgSend(v16, "activateAudioSessionWithReason:streamHandleId:error:", a3, -[CSAudioProvider audioStreamHandleId](self, "audioStreamHandleId"), &v24);
    v17 = v24;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 958, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (+[CSUtils supportNonInterruptibleSiri](CSUtils, "supportNonInterruptibleSiri")
    && self->_audioStreamType == 2)
  {
    if (self->_currentSessionShouldDuckOnBuiltInSpeaker)
      v18 = 0;
    else
      v18 = (int)v13;
    if (a3 - 2 <= 2 && v18)
    {
      -[CSAudioProvider audioRecorder](self, "audioRecorder");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setDuckMixWithOthersForStream:duckOthers:duckToLevelInDB:mixWithOthers:", -[CSAudioProvider audioStreamHandleId](self, "audioStreamHandleId"), 1, 0, 1);

    }
  }
  if ((_DWORD)v13)
  {
    -[CSAudioProvider _holdRecordingTransactionIfNeeded](self, "_holdRecordingTransactionIfNeeded");
    if (!a4)
      goto LABEL_22;
    goto LABEL_21;
  }
  v20 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
  {
    v22 = v20;
    objc_msgSend(v17, "localizedDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v26 = "-[CSAudioProvider _activateAudioSessionWithReason:error:]";
    v27 = 2114;
    v28 = v23;
    _os_log_error_impl(&dword_1B502E000, v22, OS_LOG_TYPE_ERROR, "%s Failed to activateAudioSession : %{public}@", buf, 0x16u);

    if (!a4)
      goto LABEL_22;
    goto LABEL_21;
  }
  if (a4)
LABEL_21:
    *a4 = objc_retainAutorelease(v17);
LABEL_22:

  return (char)v13;
}

- (BOOL)_shouldDuckOnBuiltInSpeaker
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  int64_t audioStreamType;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  int v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  int64_t v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[CSAudioProvider audioRecorder](self, "audioRecorder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[CSAudioProvider _isDuckingOnSpeakerOutputSupportedWithCurrentRoute](self, "_isDuckingOnSpeakerOutputSupportedWithCurrentRoute");
    -[CSAudioProvider audioRecorder](self, "audioRecorder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getPlaybackRouteForStreamID:", -[CSAudioProvider audioStreamHandleId](self, "audioStreamHandleId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C89818]);
    v8 = v7;
    if (self->_audioStreamType == 2)
      v9 = v7;
    else
      v9 = 0;
    v10 = v9 & v4;
    v11 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEBUG))
    {
      v13 = v11;
      -[CSAudioProvider UUID](self, "UUID");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      audioStreamType = self->_audioStreamType;
      v17 = CFSTR("NO");
      v20 = 136316418;
      v21 = "-[CSAudioProvider _shouldDuckOnBuiltInSpeaker]";
      if (v10)
        v18 = CFSTR("YES");
      else
        v18 = CFSTR("NO");
      if (v8)
        v19 = CFSTR("YES");
      else
        v19 = CFSTR("NO");
      v22 = 2114;
      v23 = v14;
      v24 = 2114;
      if (v4)
        v17 = CFSTR("YES");
      v25 = v18;
      v26 = 2050;
      v27 = audioStreamType;
      v28 = 2114;
      v29 = v19;
      v30 = 2114;
      v31 = v17;
      _os_log_debug_impl(&dword_1B502E000, v13, OS_LOG_TYPE_DEBUG, "%s CSAudioProvider[%{public}@]:shouldDuckOnBuiltInSpeaker: %{public}@ (audioStreamType: %{public}lu, isPlaybackRouteBuiltInSpeaker: %{public}@, isDuckingOnSpeakerOutputSupported: %{public}@)", (uint8_t *)&v20, 0x3Eu);

    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  return v10;
}

- (BOOL)_isDuckingOnSpeakerOutputSupportedWithCurrentRoute
{
  void *v3;
  char v4;
  id v5;
  void *v6;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0C89C20], "supportsDuckingOnSpeakerOutput"))
    return 0;
  -[CSAudioProvider audioRecorder](self, "audioRecorder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v4 = objc_msgSend(v3, "isDuckingSupportedOnCurrentRouteWithStreamHandleID:error:", -[CSAudioProvider audioStreamHandleId](self, "audioStreamHandleId"), &v10);
  v5 = v10;

  if (v5)
  {
    v6 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      v8 = v6;
      objc_msgSend(v5, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v12 = "-[CSAudioProvider _isDuckingOnSpeakerOutputSupportedWithCurrentRoute]";
      v13 = 2114;
      v14 = v9;
      _os_log_error_impl(&dword_1B502E000, v8, OS_LOG_TYPE_ERROR, "%s Failed to fetch duckingSupported result : %{public}@", buf, 0x16u);

    }
  }

  return v4;
}

- (BOOL)deactivateAudioSession:(unint64_t)a3 error:(id *)a4
{
  NSObject *recordQueue;
  NSObject *v6;
  BOOL v7;
  void *v9;
  _QWORD v10[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__6454;
  v15 = __Block_byref_object_dispose__6455;
  v16 = 0;
  recordQueue = self->_recordQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__CSAudioProvider_deactivateAudioSession_error___block_invoke;
  v10[3] = &unk_1E687F580;
  v10[4] = self;
  v10[5] = &v17;
  v10[6] = &v11;
  v10[7] = a3;
  dispatch_async_and_wait(recordQueue, v10);
  if (!*((_BYTE *)v18 + 24))
  {
    v6 = (id)CSLogCategoryAudio;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)v12[5], "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v22 = "-[CSAudioProvider deactivateAudioSession:error:]";
      v23 = 2114;
      v24 = v9;
      _os_log_error_impl(&dword_1B502E000, v6, OS_LOG_TYPE_ERROR, "%s Failed to deactivate audio session : %{public}@", buf, 0x16u);

    }
  }
  if (a4)
    *a4 = objc_retainAutorelease((id)v12[5]);
  v7 = *((_BYTE *)v18 + 24) != 0;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

- (BOOL)_deactivateAudioSession:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordQueue);
  v7 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    -[CSAudioProvider UUID](self, "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSAudioProvider _streamStateName:](self, "_streamStateName:", self->_streamState);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v25 = "-[CSAudioProvider _deactivateAudioSession:error:]";
    v26 = 2114;
    v27 = v9;
    v28 = 2114;
    v29 = v10;
    _os_log_impl(&dword_1B502E000, v8, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Deactivating Audio Session under : %{public}@", buf, 0x20u);

  }
  -[CSAudioProvider _switchToListeningMode](self, "_switchToListeningMode");
  -[CSAudioProvider audioRecorder](self, "audioRecorder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (CSIsHorseman_onceToken != -1)
      dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
    v12 = CSIsHorseman_isHorseman;
    -[CSAudioProvider audioRecorder](self, "audioRecorder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
    {
      v23 = 0;
      v15 = objc_msgSend(v13, "deactivateAudioSession:streamHandleId:error:", a3, -[CSAudioProvider audioStreamHandleId](self, "audioStreamHandleId"), &v23);
      v16 = v23;
    }
    else
    {
      v22 = 0;
      v15 = objc_msgSend(v13, "deactivateAudioSession:error:", a3, &v22);
      v16 = v22;
    }
    v17 = v16;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 951, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v15 = 0;
  }
  if (self->_currentSessionShouldDuckOnBuiltInSpeaker)
  {
    +[CSAudioRecorder resetDuckSettings](CSAudioRecorder, "resetDuckSettings");
    self->_currentSessionShouldDuckOnBuiltInSpeaker = 0;
  }
  if (v15)
  {
    -[CSAudioProvider _releaseRecordingTransactionIfNeeded](self, "_releaseRecordingTransactionIfNeeded");
    if (!a4)
      goto LABEL_19;
    goto LABEL_18;
  }
  v18 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
  {
    v20 = v18;
    objc_msgSend(v17, "localizedDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v25 = "-[CSAudioProvider _deactivateAudioSession:error:]";
    v26 = 2114;
    v27 = v21;
    _os_log_error_impl(&dword_1B502E000, v20, OS_LOG_TYPE_ERROR, "%s Failed to deactivateAudioSession : %{public}@", buf, 0x16u);

    if (!a4)
      goto LABEL_19;
    goto LABEL_18;
  }
  if (a4)
LABEL_18:
    *a4 = objc_retainAutorelease(v17);
LABEL_19:

  return v15;
}

- (void)enableSmartRoutingConsideration:(BOOL)a3
{
  NSObject *recordQueue;
  _QWORD v4[5];
  BOOL v5;

  recordQueue = self->_recordQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__CSAudioProvider_enableSmartRoutingConsideration___block_invoke;
  v4[3] = &unk_1E687F440;
  v4[4] = self;
  v5 = a3;
  dispatch_async(recordQueue, v4);
}

- (void)setDuckOthersOption:(BOOL)a3
{
  NSObject *v5;
  NSObject *recordQueue;
  _QWORD v7[5];
  BOOL v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a3)
    goto LABEL_7;
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  if (!CSIsHorseman_isHorseman)
  {
LABEL_7:
    recordQueue = self->_recordQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __39__CSAudioProvider_setDuckOthersOption___block_invoke;
    v7[3] = &unk_1E687F440;
    v7[4] = self;
    v8 = a3;
    dispatch_async(recordQueue, v7);
  }
  else
  {
    v5 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[CSAudioProvider setDuckOthersOption:]";
      _os_log_error_impl(&dword_1B502E000, v5, OS_LOG_TYPE_ERROR, "%s Unable to disable duckOthers in HomePod", buf, 0xCu);
    }
  }
}

- (void)enableMiniDucking:(BOOL)a3
{
  NSObject *recordQueue;
  _QWORD v4[5];
  BOOL v5;

  recordQueue = self->_recordQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__CSAudioProvider_enableMiniDucking___block_invoke;
  v4[3] = &unk_1E687F440;
  v4[4] = self;
  v5 = a3;
  dispatch_async(recordQueue, v4);
}

- (void)setAnnounceCallsEnabled:(BOOL)a3 withStreamHandleID:(unint64_t)a4
{
  NSObject *recordQueue;
  _QWORD block[6];
  BOOL v6;

  recordQueue = self->_recordQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__CSAudioProvider_setAnnounceCallsEnabled_withStreamHandleID___block_invoke;
  block[3] = &unk_1E687F5A8;
  v6 = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_async(recordQueue, block);
}

- (void)setAudioAlertDelegate:(id)a3
{
  id v4;
  NSObject *recordQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  recordQueue = self->_recordQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__CSAudioProvider_setAudioAlertDelegate___block_invoke;
  v7[3] = &unk_1E6880E88;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(recordQueue, v7);

}

- (BOOL)setAlertSoundFromURL:(id)a3 forType:(int64_t)a4 force:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  NSObject *recordQueue;
  NSObject *v10;
  char v11;
  void *v13;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v5 = a5;
  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  recordQueue = self->_recordQueue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54__CSAudioProvider_setAlertSoundFromURL_forType_force___block_invoke;
  v14[3] = &unk_1E6880D18;
  v14[4] = self;
  v14[5] = &v15;
  dispatch_async_and_wait(recordQueue, v14);
  if (*((_BYTE *)v16 + 24))
  {
    v10 = (id)CSLogCategoryAudio;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[CSAudioProvider UUID](self, "UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v20 = "-[CSAudioProvider setAlertSoundFromURL:forType:force:]";
      v21 = 2114;
      v22 = v13;
      _os_log_error_impl(&dword_1B502E000, v10, OS_LOG_TYPE_ERROR, "%s CSAudioProvider[%{public}@]:AVVC is recovering, ignore command...", buf, 0x16u);

    }
    v11 = 0;
  }
  else
  {
    -[CSAudioProvider audioRecorder](self, "audioRecorder");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = -[NSObject setAlertSoundFromURL:forType:force:](v10, "setAlertSoundFromURL:forType:force:", v8, a4, v5);
  }

  _Block_object_dispose(&v15, 8);
  return v11;
}

- (BOOL)playAlertSoundForType:(int64_t)a3
{
  NSObject *recordQueue;
  NSObject *v6;
  char v7;
  void *v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  recordQueue = self->_recordQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41__CSAudioProvider_playAlertSoundForType___block_invoke;
  v10[3] = &unk_1E6880D18;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_async_and_wait(recordQueue, v10);
  if (*((_BYTE *)v12 + 24))
  {
    v6 = (id)CSLogCategoryAudio;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[CSAudioProvider UUID](self, "UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v16 = "-[CSAudioProvider playAlertSoundForType:]";
      v17 = 2114;
      v18 = v9;
      _os_log_error_impl(&dword_1B502E000, v6, OS_LOG_TYPE_ERROR, "%s CSAudioProvider[%{public}@]:AVVC is recovering, ignore command...", buf, 0x16u);

    }
    v7 = 0;
  }
  else
  {
    -[CSAudioProvider audioRecorder](self, "audioRecorder");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = -[NSObject playAlertSoundForType:recordDevideIndicator:](v6, "playAlertSoundForType:recordDevideIndicator:", a3, self->_recordDeviceIndicator);
  }

  _Block_object_dispose(&v11, 8);
  return v7;
}

- (BOOL)_didPlayStartAlertSoundForSiri:(id)a3 audioStream:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  int v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordQueue);
  if (!self->_waitingForAlertFinish)
  {
    objc_msgSend(v7, "streamRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "clientIdentity");

    if (v9 == 1)
    {
      if (self->_audioSystemRecovering)
      {
        v10 = (void *)CSLogCategoryAudio;
        if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
        {
          v23 = v10;
          -[CSAudioProvider UUID](self, "UUID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v51 = "-[CSAudioProvider _didPlayStartAlertSoundForSiri:audioStream:]";
          v52 = 2114;
          v53 = v24;
          _os_log_error_impl(&dword_1B502E000, v23, OS_LOG_TYPE_ERROR, "%s CSAudioProvider[%{public}@]:AVVC is recovering, ignore command...", buf, 0x16u);

        }
        goto LABEL_6;
      }
      objc_msgSend(v6, "avvcAlertBehavior");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        -[CSAudioProvider audioRecorder](self, "audioRecorder");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "configureAlertBehavior:audioStreamHandleId:", v13, self->_audioStreamHandleId);

      }
      objc_msgSend(v7, "streamRequest");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "recordContext");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "type") == 11)
        goto LABEL_20;
      objc_msgSend(v7, "streamRequest");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "recordContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "type") == 6)
      {
LABEL_19:

LABEL_20:
        goto LABEL_21;
      }
      objc_msgSend(v7, "streamRequest");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "recordContext");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "type") == 20)
      {

        goto LABEL_19;
      }
      v48 = v20;
      v49 = v19;
      objc_msgSend(v7, "streamRequest");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "recordContext");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "type") == 22)
      {

LABEL_18:
        goto LABEL_19;
      }
      v46 = v22;
      v47 = v21;
      objc_msgSend(v7, "streamRequest");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "recordContext");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v25, "type") == 23)
      {

        goto LABEL_18;
      }
      objc_msgSend(v7, "streamRequest");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "recordContext");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v26, "type");

      if (v44 == 27)
        goto LABEL_21;
      v27 = objc_msgSend(v6, "startAlertBehavior");
      objc_msgSend(v7, "streamRequest");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "recordContext");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "isServerInvoked");

      if (v30)
      {
        v31 = CSLogCategoryAudio;
        if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v51 = "-[CSAudioProvider _didPlayStartAlertSoundForSiri:audioStream:]";
          _os_log_impl(&dword_1B502E000, v31, OS_LOG_TYPE_DEFAULT, "%s Skip predictStartAlertBehavior for serverInvoke here", buf, 0xCu);
        }
      }
      else
      {
        if ((unint64_t)(v27 - 5) > 0xFFFFFFFFFFFFFFFBLL)
        {
LABEL_30:
          -[CSAudioProvider audioRecorder](self, "audioRecorder");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "playAlertSoundForType:recordDevideIndicator:", 1, self->_recordDeviceIndicator);

          v11 = 0;
          if ((v27 & 0xFFFFFFFFFFFFFFFDLL) == 1)
            goto LABEL_22;
          if (!v40)
            goto LABEL_22;
          v41 = objc_msgSend(v6, "allowRecordWhileBeep");
          v11 = 1;
          if (v27 != 2)
            goto LABEL_22;
          if (!v41)
            goto LABEL_22;
          v42 = CSLogCategoryAudio;
          v11 = 0;
          if (!os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
            goto LABEL_22;
          *(_DWORD *)buf = 136315138;
          v51 = "-[CSAudioProvider _didPlayStartAlertSoundForSiri:audioStream:]";
          _os_log_impl(&dword_1B502E000, v42, OS_LOG_TYPE_DEFAULT, "%s Skip waiting for alert playing as we are allowing record during beep playing", buf, 0xCu);
LABEL_21:
          v11 = 0;
LABEL_22:

          goto LABEL_7;
        }
        -[CSAudioProvider audioRecorder](self, "audioRecorder");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSAudioProvider recordDeviceIndicator](self, "recordDeviceIndicator");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "recordRouteWithRecordDeviceIndicator:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        -[CSAudioProvider audioRecorder](self, "audioRecorder");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "getPlaybackRouteForStreamID:", -[CSAudioProvider audioStreamHandleId](self, "audioStreamHandleId"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "streamRequest");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "recordContext");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = +[CSAlertBehaviorPredictor predictStartAlertBehaviorFor:recordRoute:playbackRoute:](CSAlertBehaviorPredictor, "predictStartAlertBehaviorFor:recordRoute:playbackRoute:", objc_msgSend(v38, "type"), v34, v36);

      }
      if (!v27)
        goto LABEL_21;
      goto LABEL_30;
    }
  }
LABEL_6:
  v11 = 0;
LABEL_7:

  return v11;
}

- (BOOL)playRecordStartingAlertAndResetEndpointerWithAlertOverride:(int64_t)a3
{
  NSObject *recordQueue;
  uint64_t v6;
  NSObject *v7;
  char v8;
  void *v9;
  NSObject *v10;
  void *v12;
  _QWORD v13[5];
  _QWORD block[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  recordQueue = self->_recordQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__CSAudioProvider_playRecordStartingAlertAndResetEndpointerWithAlertOverride___block_invoke;
  block[3] = &unk_1E6880D18;
  block[4] = self;
  block[5] = &v15;
  dispatch_async_and_wait(recordQueue, block);
  if (*((_BYTE *)v16 + 24))
  {
    v7 = (id)CSLogCategoryAudio;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[CSAudioProvider UUID](self, "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v20 = "-[CSAudioProvider playRecordStartingAlertAndResetEndpointerWithAlertOverride:]";
      v21 = 2114;
      v22 = v12;
      _os_log_error_impl(&dword_1B502E000, v7, OS_LOG_TYPE_ERROR, "%s CSAudioProvider[%{public}@]:AVVC is recovering, ignore command...", buf, 0x16u);

    }
    v8 = 0;
  }
  else
  {
    -[CSAudioProvider audioRecorder](self, "audioRecorder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "playRecordStartingAlertAndResetEndpointerFromStream:withAlertOverride:", self->_audioStreamHandleId, a3);

    v10 = self->_recordQueue;
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __78__CSAudioProvider_playRecordStartingAlertAndResetEndpointerWithAlertOverride___block_invoke_109;
    v13[3] = &unk_1E6881138;
    v13[4] = self;
    dispatch_async(v10, v13);
  }
  _Block_object_dispose(&v15, 8);
  return v8;
}

- (unint64_t)alertStartTime
{
  NSObject *recordQueue;
  NSObject *v4;
  unint64_t v5;
  void *v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  recordQueue = self->_recordQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __33__CSAudioProvider_alertStartTime__block_invoke;
  v8[3] = &unk_1E6880D18;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_async_and_wait(recordQueue, v8);
  if (*((_BYTE *)v10 + 24))
  {
    v4 = (id)CSLogCategoryAudio;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[CSAudioProvider UUID](self, "UUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v14 = "-[CSAudioProvider alertStartTime]";
      v15 = 2114;
      v16 = v7;
      _os_log_error_impl(&dword_1B502E000, v4, OS_LOG_TYPE_ERROR, "%s CSAudioProvider[%{public}@]:AVVC is recovering, ignore command...", buf, 0x16u);

    }
    v5 = 0;
  }
  else
  {
    -[CSAudioProvider audioRecorder](self, "audioRecorder");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = -[NSObject alertStartTime](v4, "alertStartTime");
  }

  _Block_object_dispose(&v9, 8);
  return v5;
}

- (void)configureAlertBehavior:(id)a3
{
  id v4;
  NSObject *recordQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  recordQueue = self->_recordQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__CSAudioProvider_configureAlertBehavior___block_invoke;
  v7[3] = &unk_1E6880E88;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(recordQueue, v7);

}

- (id)audioMetric
{
  void *v2;
  void *v3;

  -[CSAudioProvider audioRecorder](self, "audioRecorder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setMeteringEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CSAudioProvider audioRecorder](self, "audioRecorder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMeteringEnabled:", v3);

}

- (void)updateMeters
{
  id v2;

  -[CSAudioProvider audioRecorder](self, "audioRecorder");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateMeters");

}

- (float)peakPowerForChannel:(unint64_t)a3
{
  void *v4;
  float v5;
  float v6;

  -[CSAudioProvider audioRecorder](self, "audioRecorder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "peakPowerForChannel:", a3);
  v6 = v5;

  return v6;
}

- (float)averagePowerForChannel:(unint64_t)a3
{
  void *v4;
  float v5;
  float v6;

  -[CSAudioProvider audioRecorder](self, "audioRecorder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "averagePowerForChannel:", a3);
  v6 = v5;

  return v6;
}

- (void)triggerInfoForContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *recordQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  CSAudioProvider *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  recordQueue = self->_recordQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__CSAudioProvider_triggerInfoForContext_completion___block_invoke;
  block[3] = &unk_1E687F5D0;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(recordQueue, block);

}

- (BOOL)_shouldStopRecording
{
  NSObject *streamHandleQueue;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  streamHandleQueue = self->_streamHandleQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __39__CSAudioProvider__shouldStopRecording__block_invoke;
  v12[3] = &unk_1E6880D18;
  v12[4] = self;
  v12[5] = &v13;
  dispatch_async_and_wait(streamHandleQueue, v12);
  if (v14[3])
  {
    v4 = (id)CSLogCategoryAudio;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[CSAudioProvider UUID](self, "UUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v14[3];
      *(_DWORD *)buf = 136315650;
      v18 = "-[CSAudioProvider _shouldStopRecording]";
      v19 = 2114;
      v20 = v5;
      v21 = 2050;
      v22 = v6;
      _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Shouldn't stop AVVC recording as there are %{public}tu streams", buf, 0x20u);

    }
  }
  else
  {
    -[CSAudioProvider streamHolders](self, "streamHolders");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (!v8)
    {
      v10 = 1;
      goto LABEL_8;
    }
    v4 = (id)CSLogCategoryAudio;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[CSAudioProvider UUID](self, "UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v18 = "-[CSAudioProvider _shouldStopRecording]";
      v19 = 2114;
      v20 = v9;
      v21 = 2050;
      v22 = v8;
      _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Cannot stopRecording as there are %{public}tu streamHolders", buf, 0x20u);

    }
  }

  v10 = 0;
LABEL_8:
  _Block_object_dispose(&v13, 8);
  return v10;
}

- (void)audioPreprocessor:(id)a3 hasAvailableBuffer:(id)a4 atTime:(unint64_t)a5 arrivalTimestampToAudioRecorder:(unint64_t)a6 numberOfChannels:(int)a7
{
  id v11;
  NSObject *streamHandleQueue;
  id v13;
  _QWORD block[5];
  id v15;
  unint64_t v16;
  unint64_t v17;
  int v18;

  v11 = a4;
  streamHandleQueue = self->_streamHandleQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__CSAudioProvider_audioPreprocessor_hasAvailableBuffer_atTime_arrivalTimestampToAudioRecorder_numberOfChannels___block_invoke;
  block[3] = &unk_1E687F5F8;
  block[4] = self;
  v15 = v11;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v13 = v11;
  dispatch_async(streamHandleQueue, block);

}

- (void)audioRecorderDidStartRecord:(id)a3 audioStreamHandleId:(unint64_t)a4 successfully:(BOOL)a5 error:(id)a6
{
  id v9;
  NSObject *recordQueue;
  id v11;
  _QWORD v12[4];
  id v13;
  CSAudioProvider *v14;
  unint64_t v15;
  BOOL v16;

  v9 = a6;
  recordQueue = self->_recordQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __86__CSAudioProvider_audioRecorderDidStartRecord_audioStreamHandleId_successfully_error___block_invoke;
  v12[3] = &unk_1E687F620;
  v16 = a5;
  v13 = v9;
  v14 = self;
  v15 = a4;
  v11 = v9;
  dispatch_async(recordQueue, v12);

}

- (void)audioRecorderDidStopRecord:(id)a3 audioStreamHandleId:(unint64_t)a4 reason:(int64_t)a5
{
  NSObject *recordQueue;
  _QWORD block[7];

  recordQueue = self->_recordQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__CSAudioProvider_audioRecorderDidStopRecord_audioStreamHandleId_reason___block_invoke;
  block[3] = &unk_1E687F490;
  block[4] = self;
  block[5] = a4;
  block[6] = a5;
  dispatch_async(recordQueue, block);
}

- (void)audioRecorderStreamHandleIdInvalidated:(unint64_t)a3
{
  NSObject *recordQueue;
  _QWORD v4[6];

  recordQueue = self->_recordQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__CSAudioProvider_audioRecorderStreamHandleIdInvalidated___block_invoke;
  v4[3] = &unk_1E6881228;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(recordQueue, v4);
}

- (void)_handleAudioRecorderStreamHandleIdInvalidated:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[CSAudioProvider _handleAudioRecorderStreamHandleIdInvalidated:]";
    _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v12, 0xCu);
  }
  if (self->_audioStreamHandleId == a3)
  {
    -[CSAudioProvider _handleDidStopAudioStreamWithReason:](self, "_handleDidStopAudioStreamWithReason:", -11787);
    -[CSAudioProvider sessionDelegate](self, "sessionDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[CSAudioProvider sessionDelegate](self, "sessionDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "audioSessionProvider:providerInvalidated:", self, 1);

    }
    -[CSAudioProvider providerDelegate](self, "providerDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[CSAudioProvider providerDelegate](self, "providerDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "audioProviderInvalidated:streamHandleId:", self, a3);

    }
  }
}

- (void)audioRecorderWillBeDestroyed:(id)a3
{
  NSObject *recordQueue;
  _QWORD block[5];

  recordQueue = self->_recordQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CSAudioProvider_audioRecorderWillBeDestroyed___block_invoke;
  block[3] = &unk_1E6881138;
  block[4] = self;
  dispatch_async(recordQueue, block);
}

- (void)_fetchHistoricalAudioAndForwardToStream:(id)a3 remoteVAD:(id)a4
{
  id v6;
  id v7;
  CSAudioCircularBuffer *circularBuffer;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  CSAudioCircularBuffer *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  CSAudioCircularBuffer *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  int v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint8_t v58[128];
  uint8_t buf[4];
  const char *v60;
  __int16 v61;
  _BYTE v62[18];
  __int16 v63;
  unint64_t v64;
  __int16 v65;
  unint64_t v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_streamHandleQueue);
  circularBuffer = self->_circularBuffer;
  if (!circularBuffer)
  {
LABEL_25:
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    objc_msgSend(v6, "tandemStreams", 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v50 != v39)
            objc_enumerationMutation(v36);
          -[CSAudioProvider _fetchHistoricalAudioAndForwardToStream:remoteVAD:](self, "_fetchHistoricalAudioAndForwardToStream:remoteVAD:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i), v7);
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      }
      while (v38);
    }
    goto LABEL_43;
  }
  v9 = -[CSAudioCircularBuffer sampleCount](circularBuffer, "sampleCount");
  v10 = -[CSAudioCircularBuffer sampleCount](self->_circularBuffer, "sampleCount");
  v11 = -[CSAudioCircularBuffer bufferLength](self->_circularBuffer, "bufferLength");
  v12 = self->_circularBuffer;
  if (v10 >= v11)
    v13 = -[CSAudioCircularBuffer bufferLength](v12, "bufferLength");
  else
    v13 = -[CSAudioCircularBuffer sampleCount](v12, "sampleCount");
  v14 = -[CSAudioCircularBuffer sampleCount](self->_circularBuffer, "sampleCount") - v13;
  v15 = objc_msgSend(v6, "lastForwardedSampleCount");
  v16 = v15;
  if (v15 >= v14)
  {
    v14 = v15;
  }
  else
  {
    v17 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v18 = v17;
      -[CSAudioProvider UUID](self, "UUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v60 = "-[CSAudioProvider _fetchHistoricalAudioAndForwardToStream:remoteVAD:]";
      v61 = 2114;
      *(_QWORD *)v62 = v19;
      *(_WORD *)&v62[8] = 2050;
      *(_QWORD *)&v62[10] = v16;
      v63 = 2050;
      v64 = v14;
      v65 = 2114;
      v66 = (unint64_t)v20;
      _os_log_impl(&dword_1B502E000, v18, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Buffer underrun!!!!, lastForwardedSampleTime:%{public}lu, oldestSampleTimeInBuffer:%{public}lu, stream:%{public}@", buf, 0x34u);

    }
  }
  if (v14 < v9)
  {
    objc_msgSend(v6, "startStreamOption");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "requireSingleChannelLookup");

    v23 = self->_circularBuffer;
    if (v22)
    {
      objc_msgSend(v6, "startStreamOption");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[CSAudioCircularBuffer copySamplesFrom:to:channelIdx:](v23, "copySamplesFrom:to:channelIdx:", v14, v9, objc_msgSend(v24, "selectedChannel"));

    }
    else
    {
      v25 = -[CSAudioCircularBuffer copySamplesFrom:to:](self->_circularBuffer, "copySamplesFrom:to:", v14, v9);
    }
    objc_msgSend(v25, "setRemoteVAD:", v7);
    v32 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v33 = v32;
      v34 = objc_msgSend(v25, "numSamples");
      objc_msgSend(v6, "name");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v60 = "-[CSAudioProvider _fetchHistoricalAudioAndForwardToStream:remoteVAD:]";
      v61 = 1024;
      *(_DWORD *)v62 = v34;
      *(_WORD *)&v62[4] = 2112;
      *(_QWORD *)&v62[6] = v35;
      _os_log_impl(&dword_1B502E000, v33, OS_LOG_TYPE_DEFAULT, "%s Forward %d samples from historical audio buffer from streamName:%@", buf, 0x1Cu);

    }
    -[CSAudioProvider _deliverPostprocessAudioChunk:toStream:lastForwardedSampleCount:](self, "_deliverPostprocessAudioChunk:toStream:lastForwardedSampleCount:", v25, v6, v9);

    goto LABEL_25;
  }
  if (objc_msgSend(v6, "scheduledFutureSample"))
  {
    v26 = _fetchHistoricalAudioAndForwardToStream_remoteVAD__overrunHeartBeat;
    if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * _fetchHistoricalAudioAndForwardToStream_remoteVAD__overrunHeartBeat, 1) <= 0x1999999999999999uLL
      && v14 > v9)
    {
      v28 = (void *)CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
      {
        v29 = v28;
        -[CSAudioProvider UUID](self, "UUID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "name");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136316162;
        v60 = "-[CSAudioProvider _fetchHistoricalAudioAndForwardToStream:remoteVAD:]";
        v61 = 2114;
        *(_QWORD *)v62 = v30;
        *(_WORD *)&v62[8] = 2114;
        *(_QWORD *)&v62[10] = v31;
        v63 = 2050;
        v64 = v14;
        v65 = 2050;
        v66 = v9;
        _os_log_impl(&dword_1B502E000, v29, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Ignore forwarding stream %{public}@                                        the audio packets until sampleCount == %{public}lu (theMostRecentSampleCount:%{public}lu)", buf, 0x34u);

        v26 = _fetchHistoricalAudioAndForwardToStream_remoteVAD__overrunHeartBeat;
      }
    }
    _fetchHistoricalAudioAndForwardToStream_remoteVAD__overrunHeartBeat = v26 + 1;
  }
  else if (v14 > v9)
  {
    v41 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v42 = v41;
      -[CSAudioProvider UUID](self, "UUID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v60 = "-[CSAudioProvider _fetchHistoricalAudioAndForwardToStream:remoteVAD:]";
      v61 = 2114;
      *(_QWORD *)v62 = v43;
      *(_WORD *)&v62[8] = 2050;
      *(_QWORD *)&v62[10] = v14;
      v63 = 2050;
      v64 = v9;
      v65 = 2114;
      v66 = (unint64_t)v44;
      _os_log_impl(&dword_1B502E000, v42, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Buffer overrun!!! lastForwardedSampleTime:%{public}lu,                                    theMostRecentSampleCount:%{public}lu, stream:%{public}@", buf, 0x34u);

    }
  }
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend(v6, "tandemStreams");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v54;
    do
    {
      for (j = 0; j != v46; ++j)
      {
        if (*(_QWORD *)v54 != v47)
          objc_enumerationMutation(v36);
        -[CSAudioProvider _fetchHistoricalAudioAndForwardToStream:remoteVAD:](self, "_fetchHistoricalAudioAndForwardToStream:remoteVAD:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * j), v7);
      }
      v46 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    }
    while (v46);
  }
LABEL_43:

}

- (void)_deliverHistoricalAudioToStreamsWithRemoteVAD:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  char v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_streamHandleQueue);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[CSAudioProvider startPendingStreams](self, "startPendingStreams");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v38 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v10, "streamRequest");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "requestExclaveAudio");

        if ((v12 & 1) == 0)
          -[CSAudioProvider _fetchHistoricalAudioAndForwardToStream:remoteVAD:](self, "_fetchHistoricalAudioAndForwardToStream:remoteVAD:", v10, v4);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v7);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[CSAudioProvider streams](self, "streams");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v34 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
        objc_msgSend(v18, "streamRequest");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "requestExclaveAudio");

        if ((v20 & 1) == 0)
          -[CSAudioProvider _fetchHistoricalAudioAndForwardToStream:remoteVAD:](self, "_fetchHistoricalAudioAndForwardToStream:remoteVAD:", v18, v4);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    }
    while (v15);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[CSAudioProvider stopPendingStreams](self, "stopPendingStreams", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v30;
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v30 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * k);
        objc_msgSend(v26, "streamRequest");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "requestExclaveAudio");

        if ((v28 & 1) == 0)
          -[CSAudioProvider _fetchHistoricalAudioAndForwardToStream:remoteVAD:](self, "_fetchHistoricalAudioAndForwardToStream:remoteVAD:", v26, v4);
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    }
    while (v23);
  }

}

- (void)_processAudioBuffer:(id)a3 remoteVAD:(id)a4 atTime:(unint64_t)a5 arrivalTimestampToAudioRecorder:(unint64_t)a6 numberOfChannels:(int)a7
{
  id v12;
  id v13;
  unint64_t v14;
  CSAudioCircularBuffer *circularBuffer;
  unint64_t v16;
  uint64_t v17;
  CSAudioChunk *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_streamHandleQueue);
  -[CSAudioProvider _deliverHistoricalAudioToStreamsWithRemoteVAD:](self, "_deliverHistoricalAudioToStreamsWithRemoteVAD:", v13);
  if (v12)
  {
    v14 = (unint64_t)objc_msgSend(v12, "length") >> 1;
    circularBuffer = self->_circularBuffer;
    v16 = v14 / a7;
    if (circularBuffer)
    {
      v17 = -[CSAudioCircularBuffer sampleCount](circularBuffer, "sampleCount");
      -[CSAudioCircularBuffer addSamples:numSamples:atHostTime:](self->_circularBuffer, "addSamples:numSamples:atHostTime:", objc_msgSend(objc_retainAutorelease(v12), "bytes"), v16, a5);
      -[CSAudioTimeConverter processSampleCount:hostTime:](self->_audioTimeConverter, "processSampleCount:hostTime:", v17, a5);
    }
    else
    {
      v17 = 0;
    }
    LOBYTE(v34) = 0;
    v18 = -[CSAudioChunk initWithData:numChannels:numSamples:sampleByteDepth:startSampleCount:hostTime:arrivalHostTimeToAudioRecorder:wasBuffered:remoteVAD:]([CSAudioChunk alloc], "initWithData:numChannels:numSamples:sampleByteDepth:startSampleCount:hostTime:arrivalHostTimeToAudioRecorder:wasBuffered:remoteVAD:", v12, a7, v16, +[CSConfig inputRecordingSampleByteDepth](CSConfig, "inputRecordingSampleByteDepth"), v17, a5, a6, v34, v13);
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    -[CSAudioProvider startPendingStreams](self, "startPendingStreams");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v44;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v44 != v22)
            objc_enumerationMutation(v19);
          -[CSAudioProvider _forwardAudioChunk:toStream:](self, "_forwardAudioChunk:toStream:", v18, *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v23++));
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v21);
    }

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[CSAudioProvider streams](self, "streams");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v40;
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v40 != v27)
            objc_enumerationMutation(v24);
          -[CSAudioProvider _forwardAudioChunk:toStream:](self, "_forwardAudioChunk:toStream:", v18, *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v28++));
        }
        while (v26 != v28);
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      }
      while (v26);
    }

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[CSAudioProvider stopPendingStreams](self, "stopPendingStreams");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v36;
      do
      {
        v33 = 0;
        do
        {
          if (*(_QWORD *)v36 != v32)
            objc_enumerationMutation(v29);
          -[CSAudioProvider _forwardAudioChunk:toStream:](self, "_forwardAudioChunk:toStream:", v18, *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v33++));
        }
        while (v31 != v33);
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
      }
      while (v31);
    }

  }
}

- (void)_forwardAudioChunk:(id)a3 toStream:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_streamHandleQueue);
  objc_msgSend(v7, "startStreamOption");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "requireSingleChannelLookup");

  if (v9)
  {
    objc_msgSend(v7, "startStreamOption");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "chunkForChannel:", objc_msgSend(v10, "selectedChannel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSAudioProvider _deliverPostprocessAudioChunk:toStream:lastForwardedSampleCount:](self, "_deliverPostprocessAudioChunk:toStream:lastForwardedSampleCount:", v11, v7, -[CSAudioCircularBuffer sampleCount](self->_circularBuffer, "sampleCount"));

  }
  else
  {
    -[CSAudioProvider _deliverPostprocessAudioChunk:toStream:lastForwardedSampleCount:](self, "_deliverPostprocessAudioChunk:toStream:lastForwardedSampleCount:", v6, v7, -[CSAudioCircularBuffer sampleCount](self->_circularBuffer, "sampleCount"));
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v7, "tandemStreams", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        -[CSAudioProvider _forwardAudioChunk:toStream:](self, "_forwardAudioChunk:toStream:", v6, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++));
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

}

- (void)_deliverPostprocessAudioChunk:(id)a3 toStream:(id)a4 lastForwardedSampleCount:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  id v13;

  v8 = a3;
  v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_streamHandleQueue);
  v13 = v8;
  v10 = v13;
  if (objc_msgSend(v9, "needsBoost12dB"))
  {
    objc_msgSend(v13, "gainCompensatedChunk");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v9, "streamRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "requestExclaveAudio");

  if ((v12 & 1) == 0)
    objc_msgSend(v9, "audioStreamProvider:audioBufferAvailable:lastForwardedSampleCount:", self, v10, a5);

}

- (void)audioRecorderBufferAvailable:(id)a3 audioStreamHandleId:(unint64_t)a4 buffer:(id)a5 remoteVAD:(id)a6 atTime:(unint64_t)a7 arrivalTimestampToAudioRecorder:(unint64_t)a8 numberOfChannels:(int)a9
{
  id v15;
  id v16;
  id v17;
  unint64_t estimatedStartHostTime;
  unint64_t v19;
  float v20;
  float v21;
  double v22;
  NSObject *recordQueue;
  uint64_t v24;
  NSObject *streamHandleQueue;
  id *v26;
  void *v27;
  int v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  _QWORD *v32;
  uint64_t v33;
  _QWORD v34[5];
  _QWORD v35[3];
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[3];
  _QWORD v39[5];
  _QWORD v40[5];
  id v41;
  id v42;
  unint64_t v43;
  unint64_t v44;
  int v45;
  _QWORD block[5];

  v15 = a3;
  v16 = a5;
  v17 = a6;
  if (self->_audioStreamHandleId == a4)
  {
    estimatedStartHostTime = self->_estimatedStartHostTime;
    if (estimatedStartHostTime)
    {
      v19 = objc_msgSend(v16, "length") / (unint64_t)a9;
      v20 = (float)(v19
                  / +[CSConfig inputRecordingSampleByteDepth](CSConfig, "inputRecordingSampleByteDepth"));
      +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
      *(float *)&v22 = v20 / v21;
      self->_estimatedStartHostTime += +[CSFTimeUtils secondsToHostTime:](CSFTimeUtils, "secondsToHostTime:", v22);
      a7 = estimatedStartHostTime;
    }
    recordQueue = self->_recordQueue;
    if (v17)
    {
      v24 = MEMORY[0x1E0C809B0];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __141__CSAudioProvider_audioRecorderBufferAvailable_audioStreamHandleId_buffer_remoteVAD_atTime_arrivalTimestampToAudioRecorder_numberOfChannels___block_invoke;
      block[3] = &unk_1E6881138;
      block[4] = self;
      dispatch_async(recordQueue, block);
      streamHandleQueue = self->_streamHandleQueue;
      v40[0] = v24;
      v40[1] = 3221225472;
      v40[2] = __141__CSAudioProvider_audioRecorderBufferAvailable_audioStreamHandleId_buffer_remoteVAD_atTime_arrivalTimestampToAudioRecorder_numberOfChannels___block_invoke_2;
      v40[3] = &unk_1E687F648;
      v40[4] = self;
      v26 = &v41;
      v41 = v16;
      v42 = v17;
      v43 = a7;
      v44 = a8;
      v45 = a9;
      dispatch_async(streamHandleQueue, v40);

LABEL_11:
      goto LABEL_12;
    }
    v33 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __141__CSAudioProvider_audioRecorderBufferAvailable_audioStreamHandleId_buffer_remoteVAD_atTime_arrivalTimestampToAudioRecorder_numberOfChannels___block_invoke_3;
    v39[3] = &unk_1E6881138;
    v39[4] = self;
    dispatch_async(recordQueue, v39);
    v31 = self->_streamHandleQueue;
    v37[0] = v33;
    v37[1] = 3221225472;
    v37[2] = __141__CSAudioProvider_audioRecorderBufferAvailable_audioStreamHandleId_buffer_remoteVAD_atTime_arrivalTimestampToAudioRecorder_numberOfChannels___block_invoke_4;
    v37[3] = &unk_1E687FF38;
    v37[4] = self;
    v26 = (id *)v38;
    v38[0] = v16;
    v38[1] = a7;
    v38[2] = a8;
    v32 = v37;
LABEL_10:
    dispatch_async(v31, v32);
    goto LABEL_11;
  }
  if (!a4)
  {
    +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "audioInjectionEnabled");

    if (v28)
    {
      v29 = MEMORY[0x1E0C809B0];
      v30 = self->_recordQueue;
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __141__CSAudioProvider_audioRecorderBufferAvailable_audioStreamHandleId_buffer_remoteVAD_atTime_arrivalTimestampToAudioRecorder_numberOfChannels___block_invoke_5;
      v36[3] = &unk_1E6881138;
      v36[4] = self;
      dispatch_async(v30, v36);
      v31 = self->_streamHandleQueue;
      v34[0] = v29;
      v34[1] = 3221225472;
      v34[2] = __141__CSAudioProvider_audioRecorderBufferAvailable_audioStreamHandleId_buffer_remoteVAD_atTime_arrivalTimestampToAudioRecorder_numberOfChannels___block_invoke_6;
      v34[3] = &unk_1E687FF38;
      v34[4] = self;
      v26 = (id *)v35;
      v35[0] = v16;
      v35[1] = a7;
      v35[2] = a8;
      v32 = v34;
      goto LABEL_10;
    }
  }
LABEL_12:

}

- (void)_forwardAudioChunkForTV:(id)a3 toStream:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_streamHandleQueue);
  objc_msgSend(v7, "audioStreamProvider:audioChunkForTVAvailable:", self, v6);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v7, "tandemStreams", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[CSAudioProvider _forwardAudioChunkForTV:toStream:](self, "_forwardAudioChunkForTV:toStream:", v6, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)audioRecorderExclaveBufferAvailable:(id)a3 audioStreamHandleId:(unint64_t)a4 hostTime:(unint64_t)a5 arrivalTimestampToAudioRecorder:(unint64_t)a6
{
  NSObject *streamHandleQueue;
  _QWORD block[7];

  if (self->_audioStreamHandleId == a4)
  {
    streamHandleQueue = self->_streamHandleQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __116__CSAudioProvider_audioRecorderExclaveBufferAvailable_audioStreamHandleId_hostTime_arrivalTimestampToAudioRecorder___block_invoke;
    block[3] = &unk_1E687F490;
    block[4] = self;
    block[5] = a5;
    block[6] = a6;
    dispatch_async_and_wait(streamHandleQueue, block);
  }
}

- (void)audioRecorderBufferAvailable:(id)a3 audioStreamHandleId:(unint64_t)a4 buffer:(id)a5
{
  id v7;
  void *v8;
  NSObject *recordQueue;
  _QWORD v10[5];
  id v11;

  v7 = a5;
  v8 = v7;
  if (self->_audioStreamHandleId == a4)
  {
    recordQueue = self->_recordQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __75__CSAudioProvider_audioRecorderBufferAvailable_audioStreamHandleId_buffer___block_invoke;
    v10[3] = &unk_1E6880E88;
    v10[4] = self;
    v11 = v7;
    dispatch_async(recordQueue, v10);

  }
}

- (BOOL)isRecording
{
  NSObject *recordQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  recordQueue = self->_recordQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__CSAudioProvider_isRecording__block_invoke;
  v5[3] = &unk_1E6880D18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(recordQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isNarrowBand
{
  NSObject *recordQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  recordQueue = self->_recordQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__CSAudioProvider_isNarrowBand__block_invoke;
  v5[3] = &unk_1E6880D18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(recordQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)audioRecorderRecordHardwareConfigurationDidChange:(id)a3 toConfiguration:(int64_t)a4
{
  NSObject *recordQueue;
  _QWORD v5[6];

  recordQueue = self->_recordQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __85__CSAudioProvider_audioRecorderRecordHardwareConfigurationDidChange_toConfiguration___block_invoke;
  v5[3] = &unk_1E6881228;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(recordQueue, v5);
}

- (void)_scheduleAlertFinishTimeout:(double)a3
{
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *recordQueue;
  id v9;
  _QWORD v10[4];
  id v11;
  CSAudioProvider *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_alertPlaybackFinishTimeoutToken, v5);
  v6 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[CSAudioProvider _scheduleAlertFinishTimeout:]";
    v15 = 2114;
    v16 = v5;
    _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s ScheduleAlertFinishTimeout : %{public}@", buf, 0x16u);
  }
  v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  recordQueue = self->_recordQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__CSAudioProvider__scheduleAlertFinishTimeout___block_invoke;
  v10[3] = &unk_1E6880E88;
  v11 = v5;
  v12 = self;
  v9 = v5;
  dispatch_after(v7, recordQueue, v10);

}

- (void)_didReceiveFinishStartAlertPlaybackAt:(unint64_t)a3
{
  void *v5;
  unint64_t streamState;
  NSObject *v7;
  void *v8;
  NSUUID *alertPlaybackFinishTimeoutToken;
  void *v10;
  NSObject *v11;
  void *v12;
  unint64_t v13;
  NSObject *streamHandleQueue;
  _QWORD *v15;
  NSObject *v16;
  _QWORD v17[5];
  _QWORD v18[6];
  _QWORD v19[5];
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    streamState = self->_streamState;
    v7 = v5;
    -[CSAudioProvider _streamStateName:](self, "_streamStateName:", streamState);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v21 = "-[CSAudioProvider _didReceiveFinishStartAlertPlaybackAt:]";
    v22 = 2050;
    v23 = a3;
    v24 = 2114;
    v25 = v8;
    _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEFAULT, "%s Received finishStartAlertPlaybackAt:%{public}llu streamState : %{public}@", buf, 0x20u);

  }
  alertPlaybackFinishTimeoutToken = self->_alertPlaybackFinishTimeoutToken;
  self->_alertPlaybackFinishTimeoutToken = 0;

  if (self->_waitingForAlertFinish)
  {
    self->_waitingForAlertFinish = 0;
    v10 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      -[CSAudioProvider UUID](self, "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v21 = "-[CSAudioProvider _didReceiveFinishStartAlertPlaybackAt:]";
      v22 = 2114;
      v23 = (unint64_t)v12;
      _os_log_impl(&dword_1B502E000, v11, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Leaving dispatch group for recordingWillStartGroup", buf, 0x16u);

    }
    dispatch_group_leave((dispatch_group_t)self->_recordingWillStartGroup);
  }
  v13 = self->_streamState;
  if (v13 == 3)
  {
    streamHandleQueue = self->_streamHandleQueue;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __57__CSAudioProvider__didReceiveFinishStartAlertPlaybackAt___block_invoke_2;
    v18[3] = &unk_1E6881228;
    v18[4] = self;
    v18[5] = a3;
    v15 = v18;
  }
  else if (v13 == 2)
  {
    streamHandleQueue = self->_streamHandleQueue;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __57__CSAudioProvider__didReceiveFinishStartAlertPlaybackAt___block_invoke;
    v19[3] = &unk_1E6881138;
    v19[4] = self;
    v15 = v19;
  }
  else
  {
    v16 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[CSAudioProvider _didReceiveFinishStartAlertPlaybackAt:]";
      _os_log_error_impl(&dword_1B502E000, v16, OS_LOG_TYPE_ERROR, "%s Audio Streaming already stopped", buf, 0xCu);
    }
    streamHandleQueue = self->_streamHandleQueue;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __57__CSAudioProvider__didReceiveFinishStartAlertPlaybackAt___block_invoke_119;
    v17[3] = &unk_1E6881138;
    v17[4] = self;
    v15 = v17;
  }
  dispatch_async_and_wait(streamHandleQueue, v15);
}

- (void)audioRecorderDidFinishAlertPlayback:(id)a3 ofType:(int64_t)a4 error:(id)a5
{
  id v7;
  uint64_t v8;
  NSObject *recordQueue;
  id v10;
  _QWORD v11[5];
  id v12;
  int64_t v13;
  uint64_t v14;

  v7 = a5;
  v8 = mach_absolute_time();
  recordQueue = self->_recordQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__CSAudioProvider_audioRecorderDidFinishAlertPlayback_ofType_error___block_invoke;
  v11[3] = &unk_1E687FF38;
  v13 = a4;
  v14 = v8;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  dispatch_async(recordQueue, v11);

}

- (void)notifyProviderContextChanged
{
  NSObject *recordQueue;
  _QWORD block[5];

  recordQueue = self->_recordQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CSAudioProvider_notifyProviderContextChanged__block_invoke;
  block[3] = &unk_1E6881138;
  block[4] = self;
  dispatch_async(recordQueue, block);
}

- (void)audioRecorderBuiltInAudioStreamInvalidated:(id)a3 error:(id)a4
{
  id v5;
  NSObject *recordQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  recordQueue = self->_recordQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__CSAudioProvider_audioRecorderBuiltInAudioStreamInvalidated_error___block_invoke;
  v8[3] = &unk_1E6880E88;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(recordQueue, v8);

}

- (void)audioRecorderBeginRecordInterruption:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CSAudioProvider sessionDelegate](self, "sessionDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CSAudioProvider sessionDelegate](self, "sessionDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "audioSessionProviderBeginInterruption:", self);

  }
}

- (void)audioRecorderBeginRecordInterruption:(id)a3 withContext:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[CSAudioProvider sessionDelegate](self, "sessionDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CSAudioProvider sessionDelegate](self, "sessionDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "audioSessionProviderBeginInterruption:withContext:", self, v8);

  }
}

- (void)audioRecorderEndRecordInterruption:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CSAudioProvider sessionDelegate](self, "sessionDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CSAudioProvider sessionDelegate](self, "sessionDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "audioSessionProviderEndInterruption:", self);

  }
}

- (void)audioRecorder:(id)a3 willSetAudioSessionActive:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  id v8;

  v4 = a4;
  -[CSAudioProvider sessionDelegate](self, "sessionDelegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CSAudioProvider sessionDelegate](self, "sessionDelegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "audioSessionProvider:willSetAudioSessionActive:", self, v4);

  }
}

- (void)audioRecorder:(id)a3 didSetAudioSessionActive:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  id v8;

  v4 = a4;
  -[CSAudioProvider sessionDelegate](self, "sessionDelegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CSAudioProvider sessionDelegate](self, "sessionDelegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "audioSessionProvider:didSetAudioSessionActive:", self, v4);

  }
}

- (void)audioRecorderDisconnected:(id)a3
{
  void *v4;
  NSObject *recordQueue;
  NSObject *v6;
  void *v7;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
  {
    v6 = v4;
    -[CSAudioProvider UUID](self, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v10 = "-[CSAudioProvider audioRecorderDisconnected:]";
    v11 = 2114;
    v12 = v7;
    _os_log_error_impl(&dword_1B502E000, v6, OS_LOG_TYPE_ERROR, "%s CSAudioProvider[%{public}@]:Audio Recorder Disconnected", buf, 0x16u);

  }
  recordQueue = self->_recordQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CSAudioProvider_audioRecorderDisconnected___block_invoke;
  block[3] = &unk_1E6881138;
  block[4] = self;
  dispatch_async(recordQueue, block);
}

- (void)CSAudioServerCrashMonitorDidReceiveServerCrash:(id)a3
{
  void *v4;
  NSObject *recordQueue;
  NSObject *v6;
  void *v7;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
  {
    v6 = v4;
    -[CSAudioProvider UUID](self, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v10 = "-[CSAudioProvider CSAudioServerCrashMonitorDidReceiveServerCrash:]";
    v11 = 2114;
    v12 = v7;
    _os_log_error_impl(&dword_1B502E000, v6, OS_LOG_TYPE_ERROR, "%s CSAudioProvider[%{public}@]:audiomxd/bridgeaudiod crashed", buf, 0x16u);

  }
  recordQueue = self->_recordQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__CSAudioProvider_CSAudioServerCrashMonitorDidReceiveServerCrash___block_invoke;
  block[3] = &unk_1E6881138;
  block[4] = self;
  dispatch_async(recordQueue, block);
}

- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *recordQueue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    -[CSAudioProvider UUID](self, "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v10 = "-[CSAudioProvider CSAudioServerCrashMonitorDidReceiveServerRestart:]";
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:audiomxd/bridgeaudiod recovered from crash", buf, 0x16u);

  }
  recordQueue = self->_recordQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__CSAudioProvider_CSAudioServerCrashMonitorDidReceiveServerRestart___block_invoke;
  block[3] = &unk_1E6881138;
  block[4] = self;
  dispatch_async(recordQueue, block);
}

- (void)_handleAudioSystemFailure
{
  NSObject *streamHandleQueue;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  CSAudioRecorder *audioRecorder;
  CSAudioCircularBuffer *circularBuffer;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[CSAudioProvider setStreamState:](self, "setStreamState:", 0);
  streamHandleQueue = self->_streamHandleQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CSAudioProvider__handleAudioSystemFailure__block_invoke;
  block[3] = &unk_1E6881138;
  block[4] = self;
  dispatch_async_and_wait(streamHandleQueue, block);
  -[CSAudioProvider _releaseRecordingTransactionIfNeeded](self, "_releaseRecordingTransactionIfNeeded");
  v4 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    -[CSAudioProvider UUID](self, "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v12 = "-[CSAudioProvider _handleAudioSystemFailure]";
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:AudioRecorder will be destroyed", buf, 0x16u);

  }
  -[CSAudioRecorder unregisterObserver:](self->_audioRecorder, "unregisterObserver:", self);
  v7 = (void *)MEMORY[0x1B5E46720](-[CSAudioRecorder willDestroy](self->_audioRecorder, "willDestroy"));
  audioRecorder = self->_audioRecorder;
  self->_audioRecorder = 0;

  objc_autoreleasePoolPop(v7);
  circularBuffer = self->_circularBuffer;
  if (circularBuffer)
    -[CSAudioCircularBuffer reset](circularBuffer, "reset");
}

- (id)_streamStateName:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  v10[0] = &unk_1E68A18D0;
  v10[1] = &unk_1E68A18E8;
  v11[0] = CFSTR("StreamInit");
  v11[1] = CFSTR("StreamPrepared");
  v10[2] = &unk_1E68A1900;
  v10[3] = &unk_1E68A1918;
  v11[2] = CFSTR("StreamStarting");
  v11[3] = CFSTR("StreamStreaming");
  v10[4] = &unk_1E68A1930;
  v10[5] = &unk_1E68A1948;
  v11[4] = CFSTR("StreamStopping");
  v11[5] = CFSTR("StreamStoppingWithScheduledStart");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown(%tu)"), a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)_holdRecordingTransactionIfNeeded
{
  CSADPPreventStandbyAssertion *v3;
  CSADPPreventStandbyAssertion *adpAssertion;
  CSOSTransaction *v5;
  CSOSTransaction *recordingTransaction;

  v3 = -[CSADPPreventStandbyAssertion initWithName:clientQueue:]([CSADPPreventStandbyAssertion alloc], "initWithName:clientQueue:", CFSTR("com.apple.corespeech.recording"), self->_recordQueue);
  adpAssertion = self->_adpAssertion;
  self->_adpAssertion = v3;

  if (!self->_recordingTransaction)
  {
    v5 = -[CSOSTransaction initWithDescription:]([CSOSTransaction alloc], "initWithDescription:", CFSTR("Recording transaction"));
    recordingTransaction = self->_recordingTransaction;
    self->_recordingTransaction = v5;

    -[CSAudioProvider _holdRecordingExceptionIfNeeded:](self, "_holdRecordingExceptionIfNeeded:", 1);
  }
}

- (void)_releaseRecordingTransactionIfNeeded
{
  CSADPPreventStandbyAssertion *adpAssertion;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  CSOSTransaction *recordingTransaction;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  adpAssertion = self->_adpAssertion;
  if (adpAssertion)
  {
    self->_adpAssertion = 0;

  }
  if (self->_recordingTransaction)
  {
    if (self->_streamState != 3
      && !-[CSAudioRecorder isSessionCurrentlyActivated](self->_audioRecorder, "isSessionCurrentlyActivated"))
    {
      v4 = (void *)CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
      {
        v5 = v4;
        -[CSAudioProvider UUID](self, "UUID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSAudioProvider _streamStateName:](self, "_streamStateName:", self->_streamState);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 136315650;
        v13 = "-[CSAudioProvider _releaseRecordingTransactionIfNeeded]";
        v14 = 2114;
        v15 = v6;
        v16 = 2114;
        v17 = v7;
        _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Release recording transaction at streamState : %{public}@", (uint8_t *)&v12, 0x20u);

      }
      recordingTransaction = self->_recordingTransaction;
      self->_recordingTransaction = 0;

      -[CSAudioProvider _holdRecordingExceptionIfNeeded:](self, "_holdRecordingExceptionIfNeeded:", 0);
    }
  }
  else
  {
    v9 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      -[CSAudioProvider UUID](self, "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136315394;
      v13 = "-[CSAudioProvider _releaseRecordingTransactionIfNeeded]";
      v14 = 2114;
      v15 = v11;
      _os_log_impl(&dword_1B502E000, v10, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:recordingTransaction already released", (uint8_t *)&v12, 0x16u);

    }
  }
}

- (void)_holdRecordingExceptionIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  if (-[CSAudioProvider audioStreamHandleId](self, "audioStreamHandleId") >= 2)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSAudioProvider UUID](self, "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@-%@"), v7, v8);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    +[CSMSNExceptionManager sharedInstance](CSMSNExceptionManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v3)
      objc_msgSend(v9, "beginAnnounceMessageException:reason:", CFSTR("announcemessage"), v11);
    else
      objc_msgSend(v9, "endAnnounceMessageException:reason:", CFSTR("announcemessage"), v11);

  }
}

- (void)_scheduleAudioPacketWatchDog
{
  OS_dispatch_source *v3;
  OS_dispatch_source *audioPacketWatchdog;
  dispatch_time_t v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id location;

  -[CSAudioProvider _cancelAudioPacketWatchDog](self, "_cancelAudioPacketWatchDog");
  self->_audioPacketDeliveryCount = 0;
  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_recordQueue);
  audioPacketWatchdog = self->_audioPacketWatchdog;
  self->_audioPacketWatchdog = v3;

  v5 = dispatch_time(0, 0x6FC23B000);
  dispatch_source_set_timer((dispatch_source_t)self->_audioPacketWatchdog, v5, 0x6FC23B000uLL, 0x3B9ACA00uLL);
  objc_initWeak(&location, self);
  v6 = self->_audioPacketWatchdog;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__CSAudioProvider__scheduleAudioPacketWatchDog__block_invoke;
  v7[3] = &unk_1E6880FD0;
  objc_copyWeak(&v8, &location);
  dispatch_source_set_event_handler(v6, v7);
  dispatch_resume((dispatch_object_t)self->_audioPacketWatchdog);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_cancelAudioPacketWatchDog
{
  NSObject *audioPacketWatchdog;
  OS_dispatch_source *v4;

  audioPacketWatchdog = self->_audioPacketWatchdog;
  if (audioPacketWatchdog)
  {
    dispatch_source_cancel(audioPacketWatchdog);
    v4 = self->_audioPacketWatchdog;
    self->_audioPacketWatchdog = 0;

  }
}

- (void)_onAudioPacketWatchdogFire
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_audioPacketDeliveryCount)
  {
    self->_audioPacketDeliveryCount = 0;
  }
  else
  {
    v3 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_FAULT))
    {
      v5 = 136315138;
      v6 = "-[CSAudioProvider _onAudioPacketWatchdogFire]";
      _os_log_fault_impl(&dword_1B502E000, v3, OS_LOG_TYPE_FAULT, "%s Audio Packet Delivery WatchDog fired, trying to recover", (uint8_t *)&v5, 0xCu);
    }
    -[CSAudioProvider _cancelAudioPacketWatchDog](self, "_cancelAudioPacketWatchDog");
    -[CSAudioProvider _handleDidStopAudioStreamWithReason:](self, "_handleDidStopAudioStreamWithReason:", 6);
    -[CSAudioProvider _handleAudioSystemFailure](self, "_handleAudioSystemFailure");
    +[CSDiagnosticReporter sharedInstance](CSDiagnosticReporter, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "submitAudioIssueReport:", CFSTR("audioDeliveryWatchDogFire"));

  }
}

- (void)_scheduleDidStartRecordingDelegateWatchDog
{
  id v3;
  NSObject *v4;
  NSUUID *startRecordingWatchDogToken;
  dispatch_time_t v6;
  NSObject *recordQueue;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id location;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  NSUUID *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v3 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  objc_storeStrong((id *)&self->_startRecordingWatchDogToken, v3);
  v4 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    startRecordingWatchDogToken = self->_startRecordingWatchDogToken;
    *(_DWORD *)buf = 136315650;
    v14 = "-[CSAudioProvider _scheduleDidStartRecordingDelegateWatchDog]";
    v15 = 2114;
    v16 = startRecordingWatchDogToken;
    v17 = 2050;
    v18 = 0x4020000000000000;
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Schedule didStart WDT %{public}@ for %{public}lf seconds", buf, 0x20u);
  }
  v6 = dispatch_time(0, 8000000000);
  recordQueue = self->_recordQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__CSAudioProvider__scheduleDidStartRecordingDelegateWatchDog__block_invoke;
  block[3] = &unk_1E687F530;
  objc_copyWeak(&v11, &location);
  v10 = v3;
  v8 = v3;
  dispatch_after(v6, recordQueue, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_schduleDidStartRecordingDelegateWatchDogWithToken:(id)a3
{
  id v4;
  NSObject *v5;
  NSUUID *startRecordingWatchDogToken;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  NSUUID *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    startRecordingWatchDogToken = self->_startRecordingWatchDogToken;
    v10 = 136315650;
    v11 = "-[CSAudioProvider _schduleDidStartRecordingDelegateWatchDogWithToken:]";
    v12 = 2114;
    v13 = v4;
    v14 = 2114;
    v15 = startRecordingWatchDogToken;
    _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s startRecordingWatchDogDidFire : %{public}@, currentToken : %{public}@", (uint8_t *)&v10, 0x20u);
  }
  if (objc_msgSend(v4, "isEqual:", self->_startRecordingWatchDogToken))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 962, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSAudioProvider _handleDidStartAudioStreamWithResult:error:](self, "_handleDidStartAudioStreamWithResult:error:", 0, v7);

    -[CSAudioProvider _handleAudioSystemFailure](self, "_handleAudioSystemFailure");
    +[CSDiagnosticReporter sharedInstance](CSDiagnosticReporter, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "submitAudioIssueReport:", CFSTR("didStartWatchDogFire"));

  }
  else
  {
    v9 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "-[CSAudioProvider _schduleDidStartRecordingDelegateWatchDogWithToken:]";
      _os_log_impl(&dword_1B502E000, v9, OS_LOG_TYPE_DEFAULT, "%s startRecordingWatchDogToken doesn't match. Ignore this WDT fire", (uint8_t *)&v10, 0xCu);
    }
  }

}

- (void)_clearDidStartRecordingDelegateWatchDog
{
  NSObject *v3;
  NSUUID *startRecordingWatchDogToken;
  NSUUID *v5;
  int v6;
  const char *v7;
  __int16 v8;
  NSUUID *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    startRecordingWatchDogToken = self->_startRecordingWatchDogToken;
    v6 = 136315394;
    v7 = "-[CSAudioProvider _clearDidStartRecordingDelegateWatchDog]";
    v8 = 2114;
    v9 = startRecordingWatchDogToken;
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s Clearing didStartRecordingDelegate WatchDogTimer : %{public}@", (uint8_t *)&v6, 0x16u);
  }
  v5 = self->_startRecordingWatchDogToken;
  self->_startRecordingWatchDogToken = 0;

}

- (void)_scheduleDidStopRecordingDelegateWatchDog
{
  id v3;
  NSObject *v4;
  NSUUID *stopRecordingWatchDogToken;
  dispatch_time_t v6;
  NSObject *recordQueue;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id location;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  NSUUID *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v3 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  objc_storeStrong((id *)&self->_stopRecordingWatchDogToken, v3);
  v4 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    stopRecordingWatchDogToken = self->_stopRecordingWatchDogToken;
    *(_DWORD *)buf = 136315650;
    v14 = "-[CSAudioProvider _scheduleDidStopRecordingDelegateWatchDog]";
    v15 = 2114;
    v16 = stopRecordingWatchDogToken;
    v17 = 2050;
    v18 = 0x4020000000000000;
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Schedule didStop WDT %{public}@ for %{public}lf seconds", buf, 0x20u);
  }
  v6 = dispatch_time(0, 8000000000);
  recordQueue = self->_recordQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__CSAudioProvider__scheduleDidStopRecordingDelegateWatchDog__block_invoke;
  block[3] = &unk_1E687F530;
  objc_copyWeak(&v11, &location);
  v10 = v3;
  v8 = v3;
  dispatch_after(v6, recordQueue, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_scheduleDidStopRecordingDelegateWatchDog:(id)a3
{
  id v4;
  NSObject *v5;
  NSUUID *stopRecordingWatchDogToken;
  void *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  NSUUID *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    stopRecordingWatchDogToken = self->_stopRecordingWatchDogToken;
    v9 = 136315650;
    v10 = "-[CSAudioProvider _scheduleDidStopRecordingDelegateWatchDog:]";
    v11 = 2114;
    v12 = v4;
    v13 = 2114;
    v14 = stopRecordingWatchDogToken;
    _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s stopRecordingWatchDogDidFire : %{public}@, currentToken : %{public}@", (uint8_t *)&v9, 0x20u);
  }
  if (objc_msgSend(v4, "isEqual:", self->_stopRecordingWatchDogToken))
  {
    -[CSAudioProvider _handleDidStopAudioStreamWithReason:](self, "_handleDidStopAudioStreamWithReason:", 5);
    -[CSAudioProvider _handleAudioSystemFailure](self, "_handleAudioSystemFailure");
    +[CSDiagnosticReporter sharedInstance](CSDiagnosticReporter, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "submitAudioIssueReport:", CFSTR("didStopWatchDogFire"));

  }
  else
  {
    v8 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315138;
      v10 = "-[CSAudioProvider _scheduleDidStopRecordingDelegateWatchDog:]";
      _os_log_impl(&dword_1B502E000, v8, OS_LOG_TYPE_DEFAULT, "%s stopRecordingWatchDogToken doesn't match. Ignore this WDT fire", (uint8_t *)&v9, 0xCu);
    }
  }

}

- (void)_clearDidStopRecordingDelegateWatchDog
{
  NSObject *v3;
  NSUUID *stopRecordingWatchDogToken;
  NSUUID *v5;
  int v6;
  const char *v7;
  __int16 v8;
  NSUUID *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    stopRecordingWatchDogToken = self->_stopRecordingWatchDogToken;
    v6 = 136315394;
    v7 = "-[CSAudioProvider _clearDidStopRecordingDelegateWatchDog]";
    v8 = 2114;
    v9 = stopRecordingWatchDogToken;
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s Clearing didStopRecordingDelegate WatchDogTimer : %{public}@", (uint8_t *)&v6, 0x16u);
  }
  v5 = self->_stopRecordingWatchDogToken;
  self->_stopRecordingWatchDogToken = 0;

}

- (BOOL)_shouldHandleStartPendingOnStopping:(unint64_t)a3 withStopReason:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_streamHandleQueue);
  if (a4)
  {
    -[CSAudioProvider startPendingOnStoppingStreams](self, "startPendingOnStoppingStreams");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeAllObjects");

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[CSAudioProvider startPendingOnStoppingStreamToCompletionDict](self, "startPendingOnStoppingStreamToCompletionDict", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 958, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }

    -[CSAudioProvider startPendingOnStoppingStreamToCompletionDict](self, "startPendingOnStoppingStreamToCompletionDict");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeAllObjects");

    goto LABEL_12;
  }
  if (a3 != 5)
  {
LABEL_12:
    LOBYTE(v18) = 0;
    return v18;
  }
  -[CSAudioProvider startPendingOnStoppingStreams](self, "startPendingOnStoppingStreams");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "_cs_isHashTableEmpty") ^ 1;

  return v18;
}

- (void)_updateRemoteDeviceIdFromAVVCIfNeeded
{
  void *v3;
  void *v4;
  unint64_t audioStreamHandleId;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (+[CSUtils supportRemoteDarwinVoiceTrigger](CSUtils, "supportRemoteDarwinVoiceTrigger"))
  {
    +[CSRemoteDarwinDeviceInfo sharedInstance](CSRemoteDarwinDeviceInfo, "sharedInstance");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "hasDarwinDeviceConnected")
      && -[CSAudioRecordDeviceIndicator shouldUseRemoteRecorder](self->_recordDeviceIndicator, "shouldUseRemoteRecorder"))
    {
      -[CSAudioRecordDeviceIndicator deviceId](self->_recordDeviceIndicator, "deviceId");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v3)
      {
        -[CSAudioProvider audioRecorder](self, "audioRecorder");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        audioStreamHandleId = self->_audioStreamHandleId;
        -[CSAudioProvider recordDeviceIndicator](self, "recordDeviceIndicator");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "recordDeviceInfoWithStreamHandleId:recordDeviceIndicator:", audioStreamHandleId, v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "remoteDeviceUIDString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = CSLogCategoryAudio;
        if (v8)
        {
          if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v12 = "-[CSAudioProvider _updateRemoteDeviceIdFromAVVCIfNeeded]";
            v13 = 2114;
            v14 = v8;
            _os_log_impl(&dword_1B502E000, v9, OS_LOG_TYPE_DEFAULT, "%s Update remote deviceUId fetched from AVVC : %{public}@ (this must be deviceUID of Darwin device only)", buf, 0x16u);
          }
          -[CSAudioRecordDeviceIndicator updateDeviceId:](self->_recordDeviceIndicator, "updateDeviceId:", v8);
        }
        else if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v12 = "-[CSAudioProvider _updateRemoteDeviceIdFromAVVCIfNeeded]";
          _os_log_error_impl(&dword_1B502E000, v9, OS_LOG_TYPE_ERROR, "%s Failed to fetch remote deviceUId from AVVC", buf, 0xCu);
        }

      }
    }
    else
    {

    }
  }
}

- (void)CSPhoneCallStateMonitor:(id)a3 didRecievePhoneCallStateChange:(unint64_t)a4
{
  NSObject *streamHandleQueue;
  _QWORD v5[6];

  streamHandleQueue = self->_streamHandleQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__CSAudioProvider_CSPhoneCallStateMonitor_didRecievePhoneCallStateChange___block_invoke;
  v5[3] = &unk_1E6881228;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(streamHandleQueue, v5);
}

- (int)circularBufferNumInputChannel
{
  NSObject *streamHandleQueue;
  int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  streamHandleQueue = self->_streamHandleQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__CSAudioProvider_circularBufferNumInputChannel__block_invoke;
  v5[3] = &unk_1E6880D18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(streamHandleQueue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (float)circularBufferInputRecordingDuration
{
  NSObject *streamHandleQueue;
  float v3;
  _QWORD v5[6];
  uint64_t v6;
  float *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = (float *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  streamHandleQueue = self->_streamHandleQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__CSAudioProvider_circularBufferInputRecordingDuration__block_invoke;
  v5[3] = &unk_1E6880D18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(streamHandleQueue, v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (OS_dispatch_queue)recordQueue
{
  return self->_recordQueue;
}

- (void)setRecordQueue:(id)a3
{
  objc_storeStrong((id *)&self->_recordQueue, a3);
}

- (OS_dispatch_queue)loggingQueue
{
  return self->_loggingQueue;
}

- (void)setLoggingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_loggingQueue, a3);
}

- (OS_dispatch_queue)streamHandleQueue
{
  return self->_streamHandleQueue;
}

- (void)setStreamHandleQueue:(id)a3
{
  objc_storeStrong((id *)&self->_streamHandleQueue, a3);
}

- (CSAudioRecorder)audioRecorder
{
  return self->_audioRecorder;
}

- (unint64_t)streamState
{
  return self->_streamState;
}

- (NSHashTable)startPendingStreams
{
  return self->_startPendingStreams;
}

- (void)setStartPendingStreams:(id)a3
{
  objc_storeStrong((id *)&self->_startPendingStreams, a3);
}

- (NSHashTable)startPendingOnStoppingStreams
{
  return self->_startPendingOnStoppingStreams;
}

- (void)setStartPendingOnStoppingStreams:(id)a3
{
  objc_storeStrong((id *)&self->_startPendingOnStoppingStreams, a3);
}

- (NSHashTable)alertPlaybackFinishWaitingStreams
{
  return self->_alertPlaybackFinishWaitingStreams;
}

- (void)setAlertPlaybackFinishWaitingStreams:(id)a3
{
  objc_storeStrong((id *)&self->_alertPlaybackFinishWaitingStreams, a3);
}

- (NSHashTable)streams
{
  return self->_streams;
}

- (void)setStreams:(id)a3
{
  objc_storeStrong((id *)&self->_streams, a3);
}

- (NSHashTable)stopPendingStreams
{
  return self->_stopPendingStreams;
}

- (void)setStopPendingStreams:(id)a3
{
  objc_storeStrong((id *)&self->_stopPendingStreams, a3);
}

- (NSMutableArray)pendingStartCompletions
{
  return self->_pendingStartCompletions;
}

- (void)setPendingStartCompletions:(id)a3
{
  objc_storeStrong((id *)&self->_pendingStartCompletions, a3);
}

- (NSMutableArray)alertPlaybackFinishWaitingCompletions
{
  return self->_alertPlaybackFinishWaitingCompletions;
}

- (void)setAlertPlaybackFinishWaitingCompletions:(id)a3
{
  objc_storeStrong((id *)&self->_alertPlaybackFinishWaitingCompletions, a3);
}

- (NSMutableArray)pendingStopCompletions
{
  return self->_pendingStopCompletions;
}

- (void)setPendingStopCompletions:(id)a3
{
  objc_storeStrong((id *)&self->_pendingStopCompletions, a3);
}

- (NSMutableDictionary)startPendingOnStoppingStreamToCompletionDict
{
  return self->_startPendingOnStoppingStreamToCompletionDict;
}

- (void)setStartPendingOnStoppingStreamToCompletionDict:(id)a3
{
  objc_storeStrong((id *)&self->_startPendingOnStoppingStreamToCompletionDict, a3);
}

- (CSAudioProviderDelegate)providerDelegate
{
  return (CSAudioProviderDelegate *)objc_loadWeakRetained((id *)&self->_providerDelegate);
}

- (void)setProviderDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_providerDelegate, a3);
}

- (CSAudioSessionProvidingDelegate)sessionDelegate
{
  return (CSAudioSessionProvidingDelegate *)objc_loadWeakRetained((id *)&self->_sessionDelegate);
}

- (void)setSessionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sessionDelegate, a3);
}

- (NSMutableArray)streamHolders
{
  return self->_streamHolders;
}

- (void)setStreamHolders:(id)a3
{
  objc_storeStrong((id *)&self->_streamHolders, a3);
}

- (NSHashTable)historicalBufferRequestStreams
{
  return self->_historicalBufferRequestStreams;
}

- (void)setHistoricalBufferRequestStreams:(id)a3
{
  objc_storeStrong((id *)&self->_historicalBufferRequestStreams, a3);
}

- (CSAudioCircularBuffer)circularBuffer
{
  return self->_circularBuffer;
}

- (void)setCircularBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_circularBuffer, a3);
}

- (CSAudioAlertProvidingDelegate)alertDelegate
{
  return (CSAudioAlertProvidingDelegate *)objc_loadWeakRetained((id *)&self->_alertDelegate);
}

- (void)setAlertDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_alertDelegate, a3);
}

- (CSAudioRecordContext)lastAudioRecorderContext
{
  return self->_lastAudioRecorderContext;
}

- (void)setLastAudioRecorderContext:(id)a3
{
  objc_storeStrong((id *)&self->_lastAudioRecorderContext, a3);
}

- (BOOL)audioSystemRecovering
{
  return self->_audioSystemRecovering;
}

- (void)setAudioSystemRecovering:(BOOL)a3
{
  self->_audioSystemRecovering = a3;
}

- (CSAudioPreprocessor)audioPreprocessor
{
  return self->_audioPreprocessor;
}

- (void)setAudioPreprocessor:(id)a3
{
  objc_storeStrong((id *)&self->_audioPreprocessor, a3);
}

- (CSOSTransaction)recordingTransaction
{
  return self->_recordingTransaction;
}

- (void)setRecordingTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_recordingTransaction, a3);
}

- (OS_dispatch_group)recordingWillStartGroup
{
  return self->_recordingWillStartGroup;
}

- (void)setRecordingWillStartGroup:(id)a3
{
  objc_storeStrong((id *)&self->_recordingWillStartGroup, a3);
}

- (BOOL)waitingForAlertFinish
{
  return self->_waitingForAlertFinish;
}

- (void)setWaitingForAlertFinish:(BOOL)a3
{
  self->_waitingForAlertFinish = a3;
}

- (unint64_t)audioStreamHandleId
{
  return self->_audioStreamHandleId;
}

- (void)setAudioStreamHandleId:(unint64_t)a3
{
  self->_audioStreamHandleId = a3;
}

- (NSUUID)alertPlaybackFinishTimeoutToken
{
  return self->_alertPlaybackFinishTimeoutToken;
}

- (void)setAlertPlaybackFinishTimeoutToken:(id)a3
{
  objc_storeStrong((id *)&self->_alertPlaybackFinishTimeoutToken, a3);
}

- (NSUUID)startRecordingWatchDogToken
{
  return self->_startRecordingWatchDogToken;
}

- (void)setStartRecordingWatchDogToken:(id)a3
{
  objc_storeStrong((id *)&self->_startRecordingWatchDogToken, a3);
}

- (NSUUID)stopRecordingWatchDogToken
{
  return self->_stopRecordingWatchDogToken;
}

- (void)setStopRecordingWatchDogToken:(id)a3
{
  objc_storeStrong((id *)&self->_stopRecordingWatchDogToken, a3);
}

- (OS_dispatch_source)audioPacketWatchdog
{
  return self->_audioPacketWatchdog;
}

- (void)setAudioPacketWatchdog:(id)a3
{
  objc_storeStrong((id *)&self->_audioPacketWatchdog, a3);
}

- (unint64_t)circularBufferStartHostTime
{
  return self->_circularBufferStartHostTime;
}

- (void)setCircularBufferStartHostTime:(unint64_t)a3
{
  self->_circularBufferStartHostTime = a3;
}

- (unint64_t)circularBufferStartSampleCount
{
  return self->_circularBufferStartSampleCount;
}

- (void)setCircularBufferStartSampleCount:(unint64_t)a3
{
  self->_circularBufferStartSampleCount = a3;
}

- (unint64_t)currentExclaveAudioSampleCount
{
  return self->_currentExclaveAudioSampleCount;
}

- (void)setCurrentExclaveAudioSampleCount:(unint64_t)a3
{
  self->_currentExclaveAudioSampleCount = a3;
}

- (unint64_t)lastFetchedExclaveAudioSampleCount
{
  return self->_lastFetchedExclaveAudioSampleCount;
}

- (void)setLastFetchedExclaveAudioSampleCount:(unint64_t)a3
{
  self->_lastFetchedExclaveAudioSampleCount = a3;
}

- (BOOL)isTransferringExclaveAudioSample
{
  return self->_isTransferringExclaveAudioSample;
}

- (void)setIsTransferringExclaveAudioSample:(BOOL)a3
{
  self->_isTransferringExclaveAudioSample = a3;
}

- (CSAudioTimeConverter)exclaveAudioTimeConverter
{
  return self->_exclaveAudioTimeConverter;
}

- (void)setExclaveAudioTimeConverter:(id)a3
{
  objc_storeStrong((id *)&self->_exclaveAudioTimeConverter, a3);
}

- (CSAudioTimeConverter)audioTimeConverter
{
  return self->_audioTimeConverter;
}

- (void)setAudioTimeConverter:(id)a3
{
  objc_storeStrong((id *)&self->_audioTimeConverter, a3);
}

- (unint64_t)estimatedStartHostTime
{
  return self->_estimatedStartHostTime;
}

- (void)setEstimatedStartHostTime:(unint64_t)a3
{
  self->_estimatedStartHostTime = a3;
}

- (int64_t)audioStreamType
{
  return self->_audioStreamType;
}

- (void)setAudioStreamType:(int64_t)a3
{
  self->_audioStreamType = a3;
}

- (CSAudioRecordDeviceIndicator)recordDeviceIndicator
{
  return self->_recordDeviceIndicator;
}

- (void)setRecordDeviceIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_recordDeviceIndicator, a3);
}

- (CSMicUsageReporter)micUsageReporter
{
  return self->_micUsageReporter;
}

- (void)setMicUsageReporter:(id)a3
{
  objc_storeStrong((id *)&self->_micUsageReporter, a3);
}

- (unint64_t)audioPacketDeliveryCount
{
  return self->_audioPacketDeliveryCount;
}

- (void)setAudioPacketDeliveryCount:(unint64_t)a3
{
  self->_audioPacketDeliveryCount = a3;
}

- (CSADPPreventStandbyAssertion)adpAssertion
{
  return self->_adpAssertion;
}

- (void)setAdpAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_adpAssertion, a3);
}

- (CSPhoneCallStateMonitor)phoneCallStateMonitor
{
  return self->_phoneCallStateMonitor;
}

- (void)setPhoneCallStateMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_phoneCallStateMonitor, a3);
}

- (unint64_t)phoneCallState
{
  return self->_phoneCallState;
}

- (void)setPhoneCallState:(unint64_t)a3
{
  self->_phoneCallState = a3;
}

- (BOOL)currentSessionShouldDuckOnBuiltInSpeaker
{
  return self->_currentSessionShouldDuckOnBuiltInSpeaker;
}

- (void)setCurrentSessionShouldDuckOnBuiltInSpeaker:(BOOL)a3
{
  self->_currentSessionShouldDuckOnBuiltInSpeaker = a3;
}

- (NSMutableDictionary)recordModeLocks
{
  return self->_recordModeLocks;
}

- (void)setRecordModeLocks:(id)a3
{
  objc_storeStrong((id *)&self->_recordModeLocks, a3);
}

- (NSMutableDictionary)listeningMicIndicatorLocks
{
  return self->_listeningMicIndicatorLocks;
}

- (void)setListeningMicIndicatorLocks:(id)a3
{
  objc_storeStrong((id *)&self->_listeningMicIndicatorLocks, a3);
}

- (CSStateCapture)stateCapture
{
  return self->_stateCapture;
}

- (void)setStateCapture:(id)a3
{
  objc_storeStrong((id *)&self->_stateCapture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCapture, 0);
  objc_storeStrong((id *)&self->_listeningMicIndicatorLocks, 0);
  objc_storeStrong((id *)&self->_recordModeLocks, 0);
  objc_storeStrong((id *)&self->_phoneCallStateMonitor, 0);
  objc_storeStrong((id *)&self->_adpAssertion, 0);
  objc_storeStrong((id *)&self->_micUsageReporter, 0);
  objc_storeStrong((id *)&self->_recordDeviceIndicator, 0);
  objc_storeStrong((id *)&self->_audioTimeConverter, 0);
  objc_storeStrong((id *)&self->_exclaveAudioTimeConverter, 0);
  objc_storeStrong((id *)&self->_audioPacketWatchdog, 0);
  objc_storeStrong((id *)&self->_stopRecordingWatchDogToken, 0);
  objc_storeStrong((id *)&self->_startRecordingWatchDogToken, 0);
  objc_storeStrong((id *)&self->_alertPlaybackFinishTimeoutToken, 0);
  objc_storeStrong((id *)&self->_recordingWillStartGroup, 0);
  objc_storeStrong((id *)&self->_recordingTransaction, 0);
  objc_storeStrong((id *)&self->_audioPreprocessor, 0);
  objc_storeStrong((id *)&self->_lastAudioRecorderContext, 0);
  objc_destroyWeak((id *)&self->_alertDelegate);
  objc_storeStrong((id *)&self->_circularBuffer, 0);
  objc_storeStrong((id *)&self->_historicalBufferRequestStreams, 0);
  objc_storeStrong((id *)&self->_streamHolders, 0);
  objc_destroyWeak((id *)&self->_sessionDelegate);
  objc_destroyWeak((id *)&self->_providerDelegate);
  objc_storeStrong((id *)&self->_startPendingOnStoppingStreamToCompletionDict, 0);
  objc_storeStrong((id *)&self->_pendingStopCompletions, 0);
  objc_storeStrong((id *)&self->_alertPlaybackFinishWaitingCompletions, 0);
  objc_storeStrong((id *)&self->_pendingStartCompletions, 0);
  objc_storeStrong((id *)&self->_stopPendingStreams, 0);
  objc_storeStrong((id *)&self->_streams, 0);
  objc_storeStrong((id *)&self->_alertPlaybackFinishWaitingStreams, 0);
  objc_storeStrong((id *)&self->_startPendingOnStoppingStreams, 0);
  objc_storeStrong((id *)&self->_startPendingStreams, 0);
  objc_storeStrong((id *)&self->_audioRecorder, 0);
  objc_storeStrong((id *)&self->_streamHandleQueue, 0);
  objc_storeStrong((id *)&self->_loggingQueue, 0);
  objc_storeStrong((id *)&self->_recordQueue, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

uint64_t __55__CSAudioProvider_circularBufferInputRecordingDuration__block_invoke(uint64_t a1)
{
  uint64_t result;
  int v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "inputRecordingDuration");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

uint64_t __48__CSAudioProvider_circularBufferNumInputChannel__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "numInputChannels");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __74__CSAudioProvider_CSPhoneCallStateMonitor_didRecievePhoneCallStateChange___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 360) = *(_QWORD *)(result + 40);
  return result;
}

void __60__CSAudioProvider__scheduleDidStopRecordingDelegateWatchDog__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_scheduleDidStopRecordingDelegateWatchDog:", *(_QWORD *)(a1 + 32));

}

void __61__CSAudioProvider__scheduleDidStartRecordingDelegateWatchDog__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_schduleDidStartRecordingDelegateWatchDogWithToken:", *(_QWORD *)(a1 + 32));

}

void __47__CSAudioProvider__scheduleAudioPacketWatchDog__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_onAudioPacketWatchdogFire");

}

void __44__CSAudioProvider__handleAudioSystemFailure__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1B5E46720]();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 192);
  *(_QWORD *)(v3 + 192) = 0;

  objc_autoreleasePoolPop(v2);
}

uint64_t __68__CSAudioProvider_CSAudioServerCrashMonitorDidReceiveServerRestart___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = 0;
  return result;
}

uint64_t __66__CSAudioProvider_CSAudioServerCrashMonitorDidReceiveServerCrash___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_handleAudioRecorderStreamHandleIdInvalidated:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_handleDidStopAudioStreamWithReason:", -11785);
  return objc_msgSend(*(id *)(a1 + 32), "_handleAudioSystemFailure");
}

uint64_t __45__CSAudioProvider_audioRecorderDisconnected___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_handleDidStopAudioStreamWithReason:", -11792);
  return objc_msgSend(*(id *)(a1 + 32), "_handleAudioSystemFailure");
}

void __68__CSAudioProvider_audioRecorderBuiltInAudioStreamInvalidated_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "audioStreamHandleId") == 1)
  {
    v2 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(void **)(a1 + 40);
      v4 = v2;
      objc_msgSend(v3, "localizedDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v15 = "-[CSAudioProvider audioRecorderBuiltInAudioStreamInvalidated:error:]_block_invoke";
      v16 = 2114;
      v17 = v5;
      _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Will invalidate current builtIn audio stream : %{public}@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "audioRecorder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "recordDeviceIndicator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v8 = objc_msgSend(v6, "stopAudioStreamWithRecordDeviceIndicator:error:", v7, &v13);
    v9 = v13;

    if ((v8 & 1) == 0)
    {
      v10 = (void *)CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        v11 = v10;
        objc_msgSend(v9, "localizedDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v15 = "-[CSAudioProvider audioRecorderBuiltInAudioStreamInvalidated:error:]_block_invoke";
        v16 = 2114;
        v17 = v12;
        _os_log_error_impl(&dword_1B502E000, v11, OS_LOG_TYPE_ERROR, "%s failed to stopAudioStream : %{public}@", buf, 0x16u);

      }
    }

  }
}

void __47__CSAudioProvider_notifyProviderContextChanged__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "sessionDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioSessionProvider:didChangeContext:", *(_QWORD *)(a1 + 32), 1);

  }
}

void __68__CSAudioProvider_audioRecorderDidFinishAlertPlayback_ofType_error___block_invoke(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(a1 + 48) == 1)
    objc_msgSend(*(id *)(a1 + 32), "_didReceiveFinishStartAlertPlaybackAt:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "alertDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "audioAlertProvidingDidFinishAlertPlayback:ofType:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

void __57__CSAudioProvider__didReceiveFinishStartAlertPlaybackAt___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "alertPlaybackFinishWaitingStreams");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v34 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v7, "streamRequest");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "requestRecordModeLock");

        if (v9)
        {
          v10 = *(void **)(a1 + 32);
          objc_msgSend(v7, "streamRequest");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (id)objc_msgSend(v10, "_acquireRecordModeLockFrom:", objc_msgSend(v11, "clientIdentity"));

        }
        objc_msgSend(v7, "streamRequest");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "requestListeningMicIndicatorLock");

        if (v14)
        {
          v15 = *(void **)(a1 + 32);
          objc_msgSend(v7, "streamRequest");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (id)objc_msgSend(v15, "_acquireListeningMicIndicatorLockFrom:", objc_msgSend(v16, "clientIdentity"));

        }
        objc_msgSend(*(id *)(a1 + 32), "startPendingStreams");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "alertPlaybackFinishWaitingStreams");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "_setListeningMicIndicatorPropertyIfNeeded");
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "alertPlaybackFinishWaitingCompletions", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v30 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
        objc_msgSend(*(id *)(a1 + 32), "pendingStartCompletions");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)MEMORY[0x1B5E468D0](v25);
        objc_msgSend(v26, "addObject:", v27);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v22);
  }

  objc_msgSend(*(id *)(a1 + 32), "alertPlaybackFinishWaitingCompletions");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "removeAllObjects");

}

void __57__CSAudioProvider__didReceiveFinishStartAlertPlaybackAt___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  id v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  __int128 v46;
  uint64_t v47;
  id obj;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t v57[128];
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  unint64_t v63;
  __int16 v64;
  unint64_t v65;
  __int16 v66;
  unint64_t v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "alertPlaybackFinishWaitingStreams");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v68, 16);
  if (v2)
  {
    v4 = v2;
    v5 = *(_QWORD *)v54;
    v47 = *MEMORY[0x1E0C899D0];
    *(_QWORD *)&v3 = 136315394;
    v46 = v3;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v54 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        if (+[CSUtils isExclaveHardware](CSUtils, "isExclaveHardware", v46))
        {
          if (objc_msgSend(*(id *)(a1 + 32), "audioStreamId") == v47)
          {
            objc_msgSend(v7, "streamRequest");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = objc_msgSend(v8, "requestExclaveAudio");

            if ((v9 & 1) == 0)
            {
              *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272);
              v10 = CSLogCategoryAudio;
              if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
              {
                v11 = *(void **)(*(_QWORD *)(a1 + 32) + 280);
                *(_DWORD *)buf = v46;
                v59 = "-[CSAudioProvider _didReceiveFinishStartAlertPlaybackAt:]_block_invoke_2";
                v60 = 2048;
                v61 = v11;
                _os_log_impl(&dword_1B502E000, v10, OS_LOG_TYPE_DEFAULT, "%s Set LastFetchedExclaveAudioSampleCount = %llu", buf, 0x16u);
              }
            }
          }
        }
        objc_msgSend(v7, "streamRequest");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "requestListeningMicIndicatorLock");

        if (v13)
        {
          v14 = *(void **)(a1 + 32);
          objc_msgSend(v7, "streamRequest");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (id)objc_msgSend(v14, "_acquireListeningMicIndicatorLockFrom:", objc_msgSend(v15, "clientIdentity"));

        }
        objc_msgSend(v7, "streamRequest");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "requestRecordModeLock");

        if (v18)
        {
          v19 = *(void **)(a1 + 32);
          objc_msgSend(v7, "streamRequest");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (id)objc_msgSend(v19, "_acquireRecordModeLockFrom:", objc_msgSend(v20, "clientIdentity"));

        }
        v22 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "sampleCount");
        objc_msgSend(v7, "updateAudioStreamStartTimeInSampleCount:", v22);
        v23 = *(_QWORD *)(a1 + 40);
        v24 = mach_absolute_time();
        +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
        v25 = +[CSFTimeUtils sampleCountFromHostTime:anchorHostTime:anchorSampleCount:sampleRate:](CSFTimeUtils, "sampleCountFromHostTime:anchorHostTime:anchorSampleCount:sampleRate:", v23, v24, v22);
        v26 = (void *)CSLogCategoryAudio;
        if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
        {
          v27 = *(void **)(a1 + 32);
          v28 = v26;
          objc_msgSend(v27, "UUID");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 136316162;
          v59 = "-[CSAudioProvider _didReceiveFinishStartAlertPlaybackAt:]_block_invoke";
          v60 = 2114;
          v61 = v29;
          v62 = 2050;
          v63 = v30;
          v64 = 2050;
          v65 = v25;
          v66 = 2050;
          v67 = v22;
          _os_log_impl(&dword_1B502E000, v28, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Requested alertFinishHostTime = %{public}llu, _clientStartSampleCount = %{public}tu, circularBufferSampleCount = %{public}tu", buf, 0x34u);

        }
        if (v25 <= v22)
        {
          objc_msgSend(v7, "updateAudioStreamStartTimeInSampleCount:", v25);
        }
        else
        {
          v31 = (void *)CSLogCategoryAudio;
          if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
          {
            v32 = *(void **)(a1 + 32);
            v33 = v31;
            objc_msgSend(v32, "UUID");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v59 = "-[CSAudioProvider _didReceiveFinishStartAlertPlaybackAt:]_block_invoke";
            v60 = 2114;
            v61 = v34;
            v62 = 2050;
            v63 = v22;
            _os_log_impl(&dword_1B502E000, v33, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Failed to fetch historical audio since _clientStartSampleCount is newer than audioBuffer sample count(%{public}llu)", buf, 0x20u);

          }
        }
        objc_msgSend(*(id *)(a1 + 32), "streams");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "addObject:", v7);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v68, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "_setListeningMicIndicatorPropertyIfNeeded");
  +[CSAudioStreamActivityMonitor sharedInstance](CSAudioStreamActivityMonitor, "sharedInstance");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "streams");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "streamHolders");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "notifyActiveStreamsChanged:streamHolders:streamId:", v37, v38, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216));

  objc_msgSend(*(id *)(a1 + 32), "alertPlaybackFinishWaitingStreams");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "removeAllObjects");

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "alertPlaybackFinishWaitingCompletions");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v50;
    do
    {
      for (j = 0; j != v42; ++j)
      {
        if (*(_QWORD *)v50 != v43)
          objc_enumerationMutation(v40);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j) + 16))();
      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    }
    while (v42);
  }

  objc_msgSend(*(id *)(a1 + 32), "alertPlaybackFinishWaitingCompletions");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "removeAllObjects");

}

void __57__CSAudioProvider__didReceiveFinishStartAlertPlaybackAt___block_invoke_119(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "alertPlaybackFinishWaitingStreams");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "alertPlaybackFinishWaitingCompletions", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 959, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 32), "alertPlaybackFinishWaitingCompletions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

}

void __47__CSAudioProvider__scheduleAlertFinishTimeout___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 224)))
  {
    objc_msgSend(*(id *)(a1 + 40), "_didReceiveFinishStartAlertPlaybackAt:", mach_absolute_time());
  }
  else
  {
    v2 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 224);
      v5 = 136315650;
      v6 = "-[CSAudioProvider _scheduleAlertFinishTimeout:]_block_invoke";
      v7 = 2114;
      v8 = v3;
      v9 = 2114;
      v10 = v4;
      _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s ScheduleAlertFinishTimeout will be ignored : %{public}@, %{public}@", (uint8_t *)&v5, 0x20u);
    }
  }
}

void __85__CSAudioProvider_audioRecorderRecordHardwareConfigurationDidChange_toConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(NSObject **)(v1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __85__CSAudioProvider_audioRecorderRecordHardwareConfigurationDidChange_toConfiguration___block_invoke_2;
  v4[3] = &unk_1E6881228;
  v4[4] = v1;
  v4[5] = v2;
  dispatch_async_and_wait(v3, v4);
}

void __85__CSAudioProvider_audioRecorderRecordHardwareConfigurationDidChange_toConfiguration___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "startPendingStreams");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v29;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v29 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "audioStreamProvider:didHardwareConfigurationChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v4);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "stopPendingStreams");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "audioStreamProvider:didHardwareConfigurationChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v10);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "streams", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v18);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v19, "audioStreamProvider:didHardwareConfigurationChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v16);
  }

}

void __31__CSAudioProvider_isNarrowBand__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "audioRecorder");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isNarrowBandWithStreamHandleId:", objc_msgSend(*(id *)(a1 + 32), "audioStreamHandleId"));

}

void __30__CSAudioProvider_isRecording__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "audioRecorder");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "recordDeviceIndicator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "isRecordingWithRecordDeviceIndicator:", v2);

}

void __75__CSAudioProvider_audioRecorderBufferAvailable_audioStreamHandleId_buffer___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 336);
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__CSAudioProvider_audioRecorderBufferAvailable_audioStreamHandleId_buffer___block_invoke_2;
  v4[3] = &unk_1E6880E88;
  v4[4] = v1;
  v5 = v2;
  dispatch_async_and_wait(v3, v4);

}

void __75__CSAudioProvider_audioRecorderBufferAvailable_audioStreamHandleId_buffer___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "startPendingStreams");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v26;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v26 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 32), "_forwardAudioChunkForTV:toStream:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v4);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "streams");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
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
        objc_msgSend(*(id *)(a1 + 32), "_forwardAudioChunkForTV:toStream:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
    }
    while (v9);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "stopPendingStreams", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(a1 + 32), "_forwardAudioChunkForTV:toStream:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++));
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
    }
    while (v14);
  }

}

unint64_t __116__CSAudioProvider_audioRecorderExclaveBufferAvailable_audioStreamHandleId_hostTime_arrivalTimestampToAudioRecorder___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  void *v25;
  int v26;
  _QWORD *v27;
  void *v28;
  void *v29;
  unint64_t result;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "processSampleCount:hostTime:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272), *(_QWORD *)(a1 + 40));
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "startPendingStreams");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v40 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v8, "streamRequest");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "requestExclaveAudio");

        if (v10)
          objc_msgSend(v8, "audioStreamProvider:numSamplesAvailableInExclave:hostTime:arrivalHostTimeToAudioRecorder:exclaveSampleCount:", *(_QWORD *)(a1 + 32), +[CSConfig exclaveRecordingNumSamples](CSConfig, "exclaveRecordingNumSamples"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272));
        else
          v5 = 1;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "streams");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v36 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
        objc_msgSend(v16, "streamRequest");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "requestExclaveAudio");

        if (v18)
          objc_msgSend(v16, "audioStreamProvider:numSamplesAvailableInExclave:hostTime:arrivalHostTimeToAudioRecorder:exclaveSampleCount:", *(_QWORD *)(a1 + 32), +[CSConfig exclaveRecordingNumSamples](CSConfig, "exclaveRecordingNumSamples"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272));
        else
          v5 = 1;
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    }
    while (v13);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "stopPendingStreams", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v32;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v32 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * k);
        objc_msgSend(v24, "streamRequest");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "requestExclaveAudio");

        if (v26)
          objc_msgSend(v24, "audioStreamProvider:numSamplesAvailableInExclave:hostTime:arrivalHostTimeToAudioRecorder:exclaveSampleCount:", *(_QWORD *)(a1 + 32), +[CSConfig exclaveRecordingNumSamples](CSConfig, "exclaveRecordingNumSamples"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272));
        else
          v5 = 1;
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    }
    while (v21);
  }

  if ((v5 & 1) != 0)
  {
    while (1)
    {
      v27 = *(_QWORD **)(a1 + 32);
      if (v27[35] >= v27[34])
        break;
      objc_msgSend(v27, "audioRecorder");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "recordDeviceIndicator");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "fetchSecureAudioStreamWithRecordDeviceIndicator:from:numSamples:hostTime:error:", v29, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280), +[CSConfig exclaveRecordingNumSamples](CSConfig, "exclaveRecordingNumSamples"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "hostTimeFromSampleCount:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280)), 0);

      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280) += +[CSConfig exclaveRecordingNumSamples](CSConfig, "exclaveRecordingNumSamples");
    }
  }
  result = +[CSConfig exclaveRecordingNumSamples](CSConfig, "exclaveRecordingNumSamples");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272) += result;
  return result;
}

uint64_t __141__CSAudioProvider_audioRecorderBufferAvailable_audioStreamHandleId_buffer_remoteVAD_atTime_arrivalTimestampToAudioRecorder_numberOfChannels___block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 336);
  return result;
}

uint64_t __141__CSAudioProvider_audioRecorderBufferAvailable_audioStreamHandleId_buffer_remoteVAD_atTime_arrivalTimestampToAudioRecorder_numberOfChannels___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processAudioBuffer:remoteVAD:atTime:arrivalTimestampToAudioRecorder:numberOfChannels:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned int *)(a1 + 72));
}

uint64_t __141__CSAudioProvider_audioRecorderBufferAvailable_audioStreamHandleId_buffer_remoteVAD_atTime_arrivalTimestampToAudioRecorder_numberOfChannels___block_invoke_3(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 336);
  return result;
}

uint64_t __141__CSAudioProvider_audioRecorderBufferAvailable_audioStreamHandleId_buffer_remoteVAD_atTime_arrivalTimestampToAudioRecorder_numberOfChannels___block_invoke_4(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 192), "processBuffer:atTime:arrivalTimestampToAudioRecorder:", a1[5], a1[6], a1[7]);
}

uint64_t __141__CSAudioProvider_audioRecorderBufferAvailable_audioStreamHandleId_buffer_remoteVAD_atTime_arrivalTimestampToAudioRecorder_numberOfChannels___block_invoke_5(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 336);
  return result;
}

uint64_t __141__CSAudioProvider_audioRecorderBufferAvailable_audioStreamHandleId_buffer_remoteVAD_atTime_arrivalTimestampToAudioRecorder_numberOfChannels___block_invoke_6(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 192), "processBuffer:atTime:arrivalTimestampToAudioRecorder:", a1[5], a1[6], a1[7]);
}

void __48__CSAudioProvider_audioRecorderWillBeDestroyed___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "-[CSAudioProvider audioRecorderWillBeDestroyed:]_block_invoke";
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:", (uint8_t *)&v9, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_handleDidStopAudioStreamWithReason:", 3);
  objc_msgSend(*(id *)(a1 + 32), "setStreamState:", 0);
  v6 = (void *)MEMORY[0x1B5E46720](objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "unregisterObserver:"));
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 48);
  *(_QWORD *)(v7 + 48) = 0;

  objc_autoreleasePoolPop(v6);
}

uint64_t __58__CSAudioProvider_audioRecorderStreamHandleIdInvalidated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAudioRecorderStreamHandleIdInvalidated:", *(_QWORD *)(a1 + 40));
}

uint64_t __73__CSAudioProvider_audioRecorderDidStopRecord_audioStreamHandleId_reason___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 40) == *(_QWORD *)(*(_QWORD *)(result + 32) + 216))
    return objc_msgSend(*(id *)(result + 32), "_handleDidStopAudioStreamWithReason:", *(_QWORD *)(result + 48));
  return result;
}

_QWORD *__86__CSAudioProvider_audioRecorderDidStartRecord_audioStreamHandleId_successfully_error___block_invoke(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;
  uint64_t v4;

  if (*(_BYTE *)(a1 + 56) || objc_msgSend(*(id *)(a1 + 32), "code") != 205)
  {
    result = *(_QWORD **)(a1 + 40);
    if (*(_QWORD *)(a1 + 48) != result[27])
      return result;
    v4 = *(unsigned __int8 *)(a1 + 56);
    v3 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 32);
    result = *(_QWORD **)(a1 + 40);
    v4 = 0;
  }
  return (_QWORD *)objc_msgSend(result, "_handleDidStartAudioStreamWithResult:error:", v4, v3);
}

uint64_t __112__CSAudioProvider_audioPreprocessor_hasAvailableBuffer_atTime_arrivalTimestampToAudioRecorder_numberOfChannels___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processAudioBuffer:remoteVAD:atTime:arrivalTimestampToAudioRecorder:numberOfChannels:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 64));
}

void __39__CSAudioProvider__shouldStopRecording__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "streams", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if (v7 && (objc_msgSend(v7, "isWeakStream") & 1) == 0)
          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __52__CSAudioProvider_triggerInfoForContext_completion___block_invoke(_QWORD *a1)
{
  _BOOL4 v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = +[CSVoiceTriggerEventInfoProvider isVoiceTriggerInfoAvailableLocally:](CSVoiceTriggerEventInfoProvider, "isVoiceTriggerInfoAvailableLocally:", a1[4]);
  v3 = CSLogCategoryAudio;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315138;
      v11 = "-[CSAudioProvider triggerInfoForContext:completion:]_block_invoke";
      _os_log_error_impl(&dword_1B502E000, v3, OS_LOG_TYPE_ERROR, "%s Not handled by this function", (uint8_t *)&v10, 0xCu);
    }
    v4 = a1[6];
    if (v4)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, 0, 0);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "-[CSAudioProvider triggerInfoForContext:completion:]_block_invoke";
      _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s Fetching voiceTriggerInfo from audioRecorder", (uint8_t *)&v10, 0xCu);
    }
    v5 = a1[6];
    if (v5)
    {
      v6 = (_QWORD *)a1[5];
      v7 = (void *)v6[6];
      objc_msgSend(v6, "recordDeviceIndicator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fetchGibraltarVoiceTriggerInfoWithRecordDeviceIndicator:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v9, 0);

    }
  }
}

void __42__CSAudioProvider_configureAlertBehavior___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "audioRecorder");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configureAlertBehavior:audioStreamHandleId:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216));

}

uint64_t __33__CSAudioProvider_alertStartTime__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

uint64_t __78__CSAudioProvider_playRecordStartingAlertAndResetEndpointerWithAlertOverride___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

void __78__CSAudioProvider_playRecordStartingAlertAndResetEndpointerWithAlertOverride___block_invoke_109(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "audioRecorder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getPlaybackRouteForStreamID:", objc_msgSend(*(id *)(a1 + 32), "audioStreamHandleId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "audioRecorder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "recordDeviceIndicator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordRouteWithRecordDeviceIndicator:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__CSAudioProvider_playRecordStartingAlertAndResetEndpointerWithAlertOverride___block_invoke_2;
  block[3] = &unk_1E6880BF0;
  block[4] = v7;
  v12 = v6;
  v13 = v3;
  v9 = v3;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __78__CSAudioProvider_playRecordStartingAlertAndResetEndpointerWithAlertOverride___block_invoke_2(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 192), "willBeepWithRecordRoute:playbackRoute:", a1[5], a1[6]);
}

uint64_t __41__CSAudioProvider_playAlertSoundForType___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

uint64_t __54__CSAudioProvider_setAlertSoundFromURL_forType_force___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

uint64_t __41__CSAudioProvider_setAudioAlertDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlertDelegate:", *(_QWORD *)(a1 + 40));
}

void __62__CSAudioProvider_setAnnounceCallsEnabled_withStreamHandleID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "audioRecorder");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAnnounceCallsEnabled:withStreamHandleID:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

void __37__CSAudioProvider_enableMiniDucking___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "audioRecorder");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enableMiniDucking:", *(unsigned __int8 *)(a1 + 40));

}

void __39__CSAudioProvider_setDuckOthersOption___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "audioRecorder");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDuckMixWithOthersForStream:duckOthers:duckToLevelInDB:mixWithOthers:", objc_msgSend(*(id *)(a1 + 32), "audioStreamHandleId"), *(unsigned __int8 *)(a1 + 40), 0, *(unsigned __int8 *)(a1 + 40));

}

void __51__CSAudioProvider_enableSmartRoutingConsideration___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "audioRecorder");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enableSmartRoutingConsiderationForStream:enable:", objc_msgSend(*(id *)(a1 + 32), "audioStreamHandleId"), *(unsigned __int8 *)(a1 + 40));

}

void __48__CSAudioProvider_deactivateAudioSession_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[7];
  v4 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "_deactivateAudioSession:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v5;
}

void __82__CSAudioProvider_activateAudioSessionWithReason_dynamicAttribute_bundleID_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[7];
  v4 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "_activateAudioSessionWithReason:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v5;
}

void __48__CSAudioProvider_prewarmAudioSessionWithError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "audioRecorder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 32), "audioStreamHandleId");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "prewarmAudioSessionWithStreamHandleId:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;

}

uint64_t __43__CSAudioProvider_setAudioSessionDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSessionDelegate:", *(_QWORD *)(a1 + 40));
}

void __32__CSAudioProvider_playbackRoute__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "audioRecorder");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getPlaybackRouteForStreamID:", objc_msgSend(*(id *)(a1 + 32), "audioStreamHandleId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __33__CSAudioProvider_recordSettings__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "audioRecorder");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordSettingsWithStreamHandleId:", objc_msgSend(*(id *)(a1 + 32), "audioStreamHandleId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __34__CSAudioProvider_audioDeviceInfo__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "audioRecorder");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(*(id *)(a1 + 32), "audioStreamHandleId");
  objc_msgSend(*(id *)(a1 + 32), "recordDeviceIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "audioDeviceInfoWithStreamHandleId:recordDeviceIndicator:", v2, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __35__CSAudioProvider_recordDeviceInfo__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "audioRecorder");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(*(id *)(a1 + 32), "audioStreamHandleId");
  objc_msgSend(*(id *)(a1 + 32), "recordDeviceIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordDeviceInfoWithStreamHandleId:recordDeviceIndicator:", v2, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __30__CSAudioProvider_recordRoute__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "audioRecorder");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "recordDeviceIndicator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordRouteWithRecordDeviceIndicator:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __41__CSAudioProvider_cancelAudioStreamHold___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelAudioStreamHold:", *(_QWORD *)(a1 + 40));
}

void __53__CSAudioProvider__holdAudioStreamWithHolder_option___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_didFireStreamHolderTimeout:", *(_QWORD *)(a1 + 32));

}

uint64_t __57__CSAudioProvider_holdAudioStreamWithDescription_option___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_holdAudioStreamWithHolder:option:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __53__CSAudioProvider__saveRecordingBufferFrom_to_toURL___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[6];
    v4 = a1[7];
    v6 = 136315650;
    v7 = "-[CSAudioProvider _saveRecordingBufferFrom:to:toURL:]_block_invoke";
    v8 = 2050;
    v9 = v3;
    v10 = 2050;
    v11 = v4;
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s Saving circular buffer from %{public}lu to %{public}lu", (uint8_t *)&v6, 0x20u);
  }
  return +[CSPlainAudioFileWriter saveAudioChunck:toURL:](CSPlainAudioFileWriter, "saveAudioChunck:toURL:", a1[4], a1[5]);
}

uint64_t __52__CSAudioProvider_saveRecordingBufferFrom_to_toURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_saveRecordingBufferFrom:to:toURL:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

void *__54__CSAudioProvider_saveRecordingBufferToEndFrom_toURL___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  void *result;

  v2 = (_QWORD *)a1[4];
  result = (void *)v2[21];
  if (result)
    return (void *)objc_msgSend(v2, "_saveRecordingBufferFrom:to:toURL:", a1[6], objc_msgSend(result, "sampleCount"), a1[5]);
  return result;
}

void __50__CSAudioProvider_audioChunkToEndFrom_channelIdx___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = (_QWORD *)a1[4];
  v3 = (void *)v2[21];
  if (v3)
  {
    objc_msgSend(v2, "_audioChunkFrom:to:channelIdx:", a1[6], objc_msgSend(v3, "sampleCount"), a1[7]);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1[5] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

void __39__CSAudioProvider_audioChunkToEndFrom___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = (_QWORD *)a1[4];
  v3 = (void *)v2[21];
  if (v3)
  {
    objc_msgSend(v2, "_audioChunkFrom:to:", a1[6], objc_msgSend(v3, "sampleCount"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1[5] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

void __48__CSAudioProvider_audioChunkFrom_to_channelIdx___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (_QWORD *)a1[4];
  if (v2[21])
  {
    objc_msgSend(v2, "_audioChunkFrom:to:channelIdx:", a1[6], a1[7], a1[8]);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1[5] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

void __37__CSAudioProvider_audioChunkFrom_to___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_audioChunkFrom:to:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke(id *a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  CSAudioStreamHolding *v11;
  void *v12;
  CSAudioStreamHolding *v13;
  id v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  void *v26;
  id v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  id v31;
  id v32;
  NSObject *v33;
  void *v34;
  id v35;
  id v36;
  NSObject *v37;
  NSObject *v38;
  id v39;
  id v40;
  NSObject *v41;
  void *v42;
  void *v43;
  int v44;
  id v45;
  NSObject *v46;
  id v47;
  void *v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  id v58;
  void *v59;
  void *v60;
  int v61;
  id v62;
  void *v63;
  NSObject *v64;
  id v65;
  id v66;
  NSObject *v67;
  NSObject *v68;
  id v69;
  void *v70;
  void *v71;
  int v72;
  const char *v73;
  id v74;
  void *v75;
  id v76;
  void *v77;
  _QWORD v78[5];
  id v79;
  id v80;
  id v81;
  _QWORD v82[5];
  id v83;
  id v84;
  _QWORD v85[5];
  id v86;
  _QWORD v87[5];
  id v88;
  id v89;
  _QWORD v90[5];
  id v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  char v96;
  _QWORD v97[5];
  id v98;
  _QWORD v99[5];
  id v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  char v105;
  _QWORD block[5];
  id v107;
  _QWORD v108[4];
  id v109;
  uint8_t buf[4];
  const char *v111;
  __int16 v112;
  id v113;
  __int16 v114;
  id v115;
  __int16 v116;
  void *v117;
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v2 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = v2;
    objc_msgSend(v3, "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "_streamStateName:", *((_QWORD *)a1[4] + 7));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v111 = "-[CSAudioProvider _stopAudioStream:option:completion:]_block_invoke";
    v112 = 2114;
    v113 = v5;
    v114 = 2114;
    v115 = v6;
    v116 = 2114;
    v117 = v7;
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Scheduled stopAudioStream after waiting for recordingWillStartGroup - stopAudioStream %{public}@ with streamState : %{public}@", buf, 0x2Au);

  }
  v8 = MEMORY[0x1E0C809B0];
  v108[0] = MEMORY[0x1E0C809B0];
  v108[1] = 3221225472;
  v108[2] = __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke_86;
  v108[3] = &unk_1E6881048;
  v109 = a1[7];
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1B5E468D0](v108);
  objc_msgSend(a1[6], "holdRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = [CSAudioStreamHolding alloc];
    objc_msgSend(a1[6], "holdRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[CSAudioStreamHolding initWithName:clientIdentity:](v11, "initWithName:clientIdentity:", CFSTR("Requested at stop"), objc_msgSend(v12, "clientIdentity"));

    v14 = a1[4];
    objc_msgSend(a1[6], "holdRequest");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_holdAudioStreamWithHolder:option:", v13, v15);

  }
  objc_msgSend(a1[5], "streamRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "clientIdentity") == 1;

  if (v17)
  {
    v18 = a1[4];
    v19 = a1[5];
    v20 = *((_QWORD *)v18 + 5);
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke_2;
    block[3] = &unk_1E6880E88;
    block[4] = v18;
    v107 = v19;
    dispatch_async(v20, block);

  }
  v102 = 0;
  v103 = &v102;
  v104 = 0x2020000000;
  v105 = 0;
  v21 = a1[4];
  v22 = a1[5];
  v23 = *((_QWORD *)v21 + 5);
  v99[0] = v8;
  v99[1] = 3221225472;
  v99[2] = __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke_3;
  v99[3] = &unk_1E68811D8;
  v101 = &v102;
  v99[4] = v21;
  v100 = v22;
  dispatch_async_and_wait(v23, v99);
  v24 = a1[4];
  if (*((_QWORD *)v24 + 7) == 5 && *((_BYTE *)v103 + 24))
  {
    v25 = (id)CSLogCategoryAudio;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1[4], "UUID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v111 = "-[CSAudioProvider _stopAudioStream:option:completion:]_block_invoke_4";
      v112 = 2114;
      v113 = v26;
      _os_log_impl(&dword_1B502E000, v25, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:requested stop audio stream while stoppingWithScheduledStart, take out audio stream from schedule", buf, 0x16u);

    }
    v27 = a1[4];
    v28 = a1[5];
    v29 = *((_QWORD *)v27 + 5);
    v97[0] = v8;
    v97[1] = 3221225472;
    v97[2] = __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke_91;
    v97[3] = &unk_1E6880E88;
    v97[4] = v27;
    v98 = v28;
    dispatch_async_and_wait(v29, v97);
    v9[2](v9, 1, 0);

  }
  else
  {
    v93 = 0;
    v94 = &v93;
    v95 = 0x2020000000;
    v96 = 0;
    v30 = *((_QWORD *)v24 + 5);
    v90[0] = v8;
    v90[1] = 3221225472;
    v90[2] = __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke_2_92;
    v90[3] = &unk_1E68811D8;
    v92 = &v93;
    v90[4] = v24;
    v91 = a1[5];
    dispatch_async_and_wait(v30, v90);
    v31 = a1[5];
    if (!v31 || *((_BYTE *)v94 + 24) || (objc_msgSend(v31, "isStreaming") & 1) != 0)
    {
      v32 = a1[4];
      switch(*((_QWORD *)v32 + 7))
      {
        case 0:
          v49 = (id)CSLogCategoryAudio;
          if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend(a1[4], "UUID");
            v74 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1[4], "_streamStateName:", *((_QWORD *)a1[4] + 7));
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v111 = "-[CSAudioProvider _stopAudioStream:option:completion:]_block_invoke";
            v112 = 2114;
            v113 = v74;
            v114 = 2114;
            v115 = v75;
            _os_log_fault_impl(&dword_1B502E000, v49, OS_LOG_TYPE_FAULT, "%s CSAudioProvider[%{public}@]:Cannot handle stop audio stream on : %{public}@", buf, 0x20u);

          }
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 952, 0);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v50);

          break;
        case 1:
          goto LABEL_20;
        case 2:
          if (a1[5])
          {
            v68 = (id)CSLogCategoryAudio;
            if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT))
            {
              objc_msgSend(a1[4], "UUID");
              v69 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1[4], "_streamStateName:", *((_QWORD *)a1[4] + 7));
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315650;
              v111 = "-[CSAudioProvider _stopAudioStream:option:completion:]_block_invoke";
              v112 = 2114;
              v113 = v69;
              v114 = 2114;
              v115 = v70;
              _os_log_fault_impl(&dword_1B502E000, v68, OS_LOG_TYPE_FAULT, "%s CSAudioProvider[%{public}@]:Cannot handle stop audio stream on : %{public}@", buf, 0x20u);

            }
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 953, 0);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v71);
            v72 = 1410;
            v73 = "-[CSAudioProvider _stopAudioStream:option:completion:]_block_invoke";
LABEL_47:

            __assert_rtn(v73, "CSAudioProvider.m", v72, "NO");
          }
LABEL_20:
          v9[2](v9, 1, 0);
          break;
        case 3:
          v38 = *((_QWORD *)v32 + 5);
          v85[0] = v8;
          v85[1] = 3221225472;
          v85[2] = __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke_2_97;
          v85[3] = &unk_1E6880E88;
          v85[4] = v32;
          v86 = a1[5];
          dispatch_async_and_wait(v38, v85);
          if (objc_msgSend(a1[4], "_shouldStopRecording"))
          {
            v39 = a1[4];
            v40 = a1[5];
            v41 = *((_QWORD *)v39 + 5);
            v82[0] = v8;
            v82[1] = 3221225472;
            v82[2] = __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke_3_98;
            v82[3] = &unk_1E687F5D0;
            v82[4] = v39;
            v83 = v40;
            v84 = a1[7];
            dispatch_async_and_wait(v41, v82);
            objc_msgSend(a1[4], "_scheduleDidStopRecordingDelegateWatchDog");
            objc_msgSend(a1[4], "audioRecorder");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1[4], "recordDeviceIndicator");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v81 = 0;
            v44 = objc_msgSend(v42, "stopAudioStreamWithRecordDeviceIndicator:error:", v43, &v81);
            v45 = v81;

            if (v44)
            {
              objc_msgSend(a1[4], "setStreamState:", 4);
              v46 = (id)CSLogCategoryAudio;
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(a1[4], "UUID");
                v47 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(a1[4], "_streamStateName:", *((_QWORD *)a1[4] + 7));
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315650;
                v111 = "-[CSAudioProvider _stopAudioStream:option:completion:]_block_invoke_4";
                v112 = 2114;
                v113 = v47;
                v114 = 2114;
                v115 = v48;
                _os_log_impl(&dword_1B502E000, v46, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Stop all recordings, moving stream state to %{public}@", buf, 0x20u);

              }
            }
            else
            {
              v64 = (id)CSLogCategoryAudio;
              if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
              {
                objc_msgSend(a1[4], "UUID");
                v76 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "localizedDescription");
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315650;
                v111 = "-[CSAudioProvider _stopAudioStream:option:completion:]_block_invoke";
                v112 = 2114;
                v113 = v76;
                v114 = 2114;
                v115 = v77;
                _os_log_fault_impl(&dword_1B502E000, v64, OS_LOG_TYPE_FAULT, "%s CSAudioProvider[%{public}@]:Failed to stop audioStream : %{public}@", buf, 0x20u);

              }
              objc_msgSend(a1[4], "_preEpilogueAudioStream");
              objc_msgSend(a1[4], "setStreamState:", 1);
              v65 = a1[4];
              v66 = a1[5];
              v67 = *((_QWORD *)v65 + 5);
              v78[0] = v8;
              v78[1] = 3221225472;
              v78[2] = __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke_99;
              v78[3] = &unk_1E6880BF0;
              v78[4] = v65;
              v79 = v66;
              v80 = v45;
              dispatch_async_and_wait(v67, v78);
              objc_msgSend(a1[4], "_postEpilogueAudioStream");

            }
          }
          else
          {
            objc_msgSend(a1[5], "streamRequest");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = objc_msgSend(v56, "requestListeningMicIndicatorLock");

            if (v57)
            {
              v58 = a1[4];
              objc_msgSend(a1[5], "streamRequest");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "_forceReleaseListeningMicIndicatorLockFrom:", objc_msgSend(v59, "clientIdentity"));

            }
            objc_msgSend(a1[5], "streamRequest");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = objc_msgSend(v60, "requestRecordModeLock");

            if (v61)
            {
              v62 = a1[4];
              objc_msgSend(a1[5], "streamRequest");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "_forceReleaseRecordModeLockFrom:", objc_msgSend(v63, "clientIdentity"));

            }
            v9[2](v9, 1, 0);
          }

          break;
        case 4:
        case 5:
          v33 = (id)CSLogCategoryAudio;
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(a1[4], "UUID");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v111 = "-[CSAudioProvider _stopAudioStream:option:completion:]_block_invoke";
            v112 = 2114;
            v113 = v34;
            _os_log_impl(&dword_1B502E000, v33, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:requested stop audio stream while stopping, adding audio stream into stop pending", buf, 0x16u);

          }
          v35 = a1[4];
          v36 = a1[5];
          v37 = *((_QWORD *)v35 + 5);
          v87[0] = v8;
          v87[1] = 3221225472;
          v87[2] = __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke_96;
          v87[3] = &unk_1E687F5D0;
          v87[4] = v35;
          v88 = v36;
          v89 = a1[7];
          dispatch_async_and_wait(v37, v87);

          break;
        default:
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 951, 0);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v71);
          v72 = 1516;
          v73 = "-[CSAudioProvider _stopAudioStream:option:completion:]_block_invoke_2";
          goto LABEL_47;
      }
    }
    else
    {
      v51 = (id)CSLogCategoryAudio;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(a1[4], "UUID");
        v52 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "name");
        v53 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "_streamStateName:", *((_QWORD *)a1[4] + 7));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        v111 = "-[CSAudioProvider _stopAudioStream:option:completion:]_block_invoke_3";
        v112 = 2114;
        v113 = v52;
        v114 = 2114;
        v115 = v53;
        v116 = 2114;
        v117 = v54;
        _os_log_impl(&dword_1B502E000, v51, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Stream %{public}@ is not streaming on stream state : %{public}@, ignore the stopAudioStream request", buf, 0x2Au);

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 961, 0);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, uint64_t, void *))v9)[2](v9, 1, v55);

    }
    _Block_object_dispose(&v93, 8);
  }

  _Block_object_dispose(&v102, 8);
}

uint64_t __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke_86(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "audioPreprocessor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "startStreamOption");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestMHUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reportMetricsForSiriRequestWithUUID:", v3);

}

void __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "startPendingOnStoppingStreams");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

}

void __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke_91(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void (**v10)(id, _QWORD, void *);

  objc_msgSend(*(id *)(a1 + 32), "startPendingOnStoppingStreamToCompletionDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v10 = (void (**)(id, _QWORD, void *))objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 961, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v4);

    objc_msgSend(*(id *)(a1 + 32), "startPendingOnStoppingStreamToCompletionDict");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "startPendingOnStoppingStreams");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "startPendingOnStoppingStreams");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_cs_isHashTableEmpty");

  if (v9)
    objc_msgSend(*(id *)(a1 + 32), "setStreamState:", 4);

}

void __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke_2_92(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "streams");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

}

void __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke_96(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "streams");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

  +[CSAudioStreamActivityMonitor sharedInstance](CSAudioStreamActivityMonitor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "streams");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "streamHolders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notifyActiveStreamsChanged:streamHolders:streamId:", v4, v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216));

  objc_msgSend(*(id *)(a1 + 32), "stopPendingStreams");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", *(_QWORD *)(a1 + 40));

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "pendingStopCompletions");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1B5E468D0](*(_QWORD *)(a1 + 48));
    objc_msgSend(v8, "addObject:", v7);

  }
}

void __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke_2_97(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "streams");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

  +[CSAudioStreamActivityMonitor sharedInstance](CSAudioStreamActivityMonitor, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "streams");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "streamHolders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notifyActiveStreamsChanged:streamHolders:streamId:", v3, v4, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216));

}

void __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke_3_98(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "streams", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v6);
        if (v7 && objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v6), "isWeakStream"))
        {
          objc_msgSend(*(id *)(a1 + 32), "stopPendingStreams");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v7);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "streams");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

  +[CSAudioStreamActivityMonitor sharedInstance](CSAudioStreamActivityMonitor, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "streams");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "streamHolders");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "notifyActiveStreamsChanged:streamHolders:streamId:", v11, v12, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216));

  objc_msgSend(*(id *)(a1 + 32), "stopPendingStreams");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", *(_QWORD *)(a1 + 40));

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "pendingStopCompletions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1B5E468D0](*(_QWORD *)(a1 + 48));
    objc_msgSend(v14, "addObject:", v15);

  }
}

void __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke_99(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
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
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "stopPendingStreams");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v6);
        if (v7 && objc_msgSend(v7, "isWeakStream"))
          objc_msgSend(*(id *)(a1 + 40), "audioStreamProvider:didStopStreamUnexpectedly:", *(_QWORD *)(a1 + 32), 4);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "stopPendingStreams");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "pendingStopCompletions", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13++) + 16))();
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v11);
  }

  objc_msgSend(*(id *)(a1 + 32), "pendingStopCompletions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeAllObjects");

}

uint64_t __53__CSAudioProvider_stopAudioStream_option_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopAudioStream:option:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __55__CSAudioProvider__handleDidStopAudioStreamWithReason___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
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
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "stopPendingStreams");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v6);
        if (v7 && objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v6), "isWeakStream"))
          objc_msgSend(v7, "audioStreamProvider:didStopStreamUnexpectedly:", *(_QWORD *)(a1 + 32), 4);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "stopPendingStreams");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "pendingStopCompletions", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13++) + 16))();
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v11);
  }

  objc_msgSend(*(id *)(a1 + 32), "pendingStopCompletions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeAllObjects");

}

void __55__CSAudioProvider__handleDidStopAudioStreamWithReason___block_invoke_84(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "startPendingStreams");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "pendingStartCompletions", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 956, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 32), "pendingStartCompletions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

}

void __55__CSAudioProvider__handleDidStopAudioStreamWithReason___block_invoke_85(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "streams", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v6++), "audioStreamProvider:didStopStreamUnexpectedly:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "streams");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  +[CSAudioStreamActivityMonitor sharedInstance](CSAudioStreamActivityMonitor, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "streams");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "streamHolders");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "notifyActiveStreamsChanged:streamHolders:streamId:", v9, v10, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216));

}

void __55__CSAudioProvider__handleDidStopAudioStreamWithReason___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD block[6];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldHandleStartPendingOnStopping:withStopReason:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)))
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "startPendingOnStoppingStreams");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v28;
      v6 = MEMORY[0x1E0C809B0];
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v28 != v5)
            objc_enumerationMutation(v2);
          v8 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v7);
          if (v8)
          {
            v9 = *(_QWORD *)(a1 + 32);
            v10 = *(NSObject **)(v9 + 24);
            block[0] = v6;
            block[1] = 3221225472;
            block[2] = __55__CSAudioProvider__handleDidStopAudioStreamWithReason___block_invoke_3;
            block[3] = &unk_1E6880E88;
            block[4] = v9;
            block[5] = v8;
            dispatch_async(v10, block);
          }
          ++v7;
        }
        while (v4 != v7);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v4);
    }

    objc_msgSend(*(id *)(a1 + 32), "startPendingOnStoppingStreams");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeAllObjects");

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "startPendingOnStoppingStreamToCompletionDict", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectEnumerator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v17);
          objc_msgSend(*(id *)(a1 + 32), "pendingStartCompletions");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)MEMORY[0x1B5E468D0](v18);
          objc_msgSend(v19, "addObject:", v20);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
      }
      while (v15);
    }

    objc_msgSend(*(id *)(a1 + 32), "startPendingOnStoppingStreamToCompletionDict");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeAllObjects");

  }
}

void __55__CSAudioProvider__handleDidStopAudioStreamWithReason___block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  objc_msgSend(v2, "startStreamOption");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_startAudioStream:option:completion:", v2, v3, 0);

}

void __43__CSAudioProvider__postEpilogueAudioStream__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 168);
  if (v2)
    v2 = (void *)objc_msgSend(v2, "reset");
  v3 = (void *)MEMORY[0x1B5E46720](v2);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 192);
  *(_QWORD *)(v4 + 192) = 0;

  objc_autoreleasePoolPop(v3);
}

void __42__CSAudioProvider__preEpilogueAudioStream__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "audioPreprocessor");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "flush");

}

void __62__CSAudioProvider__handleDidStartAudioStreamWithResult_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "startPendingStreams");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v24 != v5)
            objc_enumerationMutation(v2);
          v7 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "streams");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v7);

        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v4);
    }

    +[CSAudioStreamActivityMonitor sharedInstance](CSAudioStreamActivityMonitor, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "streams");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "streamHolders");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "notifyActiveStreamsChanged:streamHolders:streamId:", v10, v11, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216));

  }
  objc_msgSend(*(id *)(a1 + 32), "startPendingStreams");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "pendingStartCompletions", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j) + 16))();
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v15);
  }

  objc_msgSend(*(id *)(a1 + 32), "pendingStartCompletions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeAllObjects");

}

void __62__CSAudioProvider__handleDidStartAudioStreamWithResult_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1B5E46720]();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 192);
  *(_QWORD *)(v3 + 192) = 0;

  objc_autoreleasePoolPop(v2);
}

uint64_t __55__CSAudioProvider__startAudioStream_option_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_66(uint64_t a1)
{
  void *v2;
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
  objc_msgSend(*(id *)(a1 + 32), "tandemStreams", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setNeedsBoost12dB:", *(unsigned __int8 *)(a1 + 40));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "startPendingOnStoppingStreams");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "startPendingOnStoppingStreamToCompletionDict");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x1B5E468D0](*(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v3, v4);

  }
}

void *__55__CSAudioProvider__startAudioStream_option_completion___block_invoke_67(uint64_t a1)
{
  void *result;

  result = *(void **)(*(_QWORD *)(a1 + 32) + 168);
  if (result)
    return (void *)objc_msgSend(*(id *)(a1 + 40), "updateAudioStreamStartTimeInSampleCount:", objc_msgSend(result, "sampleCount"));
  return result;
}

void __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_2_68(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "alertPlaybackFinishWaitingStreams");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "alertPlaybackFinishWaitingCompletions");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x1B5E468D0](*(_QWORD *)(a1 + 48));
    objc_msgSend(v4, "addObject:", v3);

  }
}

void __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_70(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "startPendingStreams");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "pendingStartCompletions");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x1B5E468D0](*(_QWORD *)(a1 + 48));
    objc_msgSend(v4, "addObject:", v3);

  }
}

void __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_2_71(uint64_t a1)
{
  CSAudioPreprocessor *v2;
  int v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;

  objc_msgSend(*(id *)(a1 + 32), "_createCircularBufferIfNeededWithNumChannel:playbackRoute:", *(int *)(a1 + 64), *(_QWORD *)(a1 + 40));
  v2 = [CSAudioPreprocessor alloc];
  +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
  v4 = v3;
  v5 = *(unsigned int *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 48), "streamRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "type");
  LODWORD(v9) = v4;
  v10 = -[CSAudioPreprocessor initWithSampleRate:withNumberOfChannels:recordType:](v2, "initWithSampleRate:withNumberOfChannels:recordType:", v5, v8, v9);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 192);
  *(_QWORD *)(v11 + 192) = v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "setDelegate:");
  v13 = *(_QWORD **)(a1 + 32);
  v14 = (void *)v13[24];
  objc_msgSend(v13, "audioRecorder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "recordingSampleRateWithStreamHandleId:", objc_msgSend(*(id *)(a1 + 32), "audioStreamHandleId"));
  objc_msgSend(v14, "resetWithSampleRate:containsVoiceTrigger:voiceTriggerInfo:", *(unsigned __int8 *)(a1 + 68), *(_QWORD *)(a1 + 56));

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280) = 0;
}

void __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_73(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 168)
    && objc_msgSend(*(id *)(a1 + 40), "requestHistoricalAudioDataWithHostTime"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setCircularBufferStartHostTime:", objc_msgSend(*(id *)(a1 + 40), "startRecordingHostTime"));
    objc_msgSend(*(id *)(a1 + 32), "setCircularBufferStartSampleCount:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "sampleCount"));
    v2 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(void **)(a1 + 32);
      v4 = v2;
      objc_msgSend(v3, "UUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(v6 + 256);
      v7 = *(_QWORD *)(v6 + 264);
      v9 = 136315906;
      v10 = "-[CSAudioProvider _startAudioStream:option:completion:]_block_invoke";
      v11 = 2114;
      v12 = v5;
      v13 = 2050;
      v14 = v8;
      v15 = 2050;
      v16 = v7;
      _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Set circularBufferStartHostTime = %{public}llu, circularBufferStartSampleCount = %{public}lu", (uint8_t *)&v9, 0x2Au);

    }
  }
}

void __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_74(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "startPendingStreams");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "pendingStartCompletions");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x1B5E468D0](*(_QWORD *)(a1 + 48));
    objc_msgSend(v4, "addObject:", v3);

  }
}

void __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_75(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "alertPlaybackFinishWaitingStreams");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "alertPlaybackFinishWaitingCompletions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1B5E468D0](*(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "addObject:", v3);

}

uint64_t __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_76(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280) = objc_msgSend(*(id *)(a1 + 40), "startRecordingSampleCount");
  v2 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280);
    v5 = 136315394;
    v6 = "-[CSAudioProvider _startAudioStream:option:completion:]_block_invoke";
    v7 = 2048;
    v8 = v3;
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s Set LastFetchedExclaveAudioSampleCount = %llu", (uint8_t *)&v5, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 48), "updateAudioStreamStartTimeInSampleCount:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "sampleCount"));
}

uint64_t __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_77(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272);
  v2 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280);
    v5 = 136315394;
    v6 = "-[CSAudioProvider _startAudioStream:option:completion:]_block_invoke";
    v7 = 2048;
    v8 = v3;
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s Set LastFetchedExclaveAudioSampleCount = %llu", (uint8_t *)&v5, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 40), "updateAudioStreamStartTimeInSampleCount:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "sampleCount"));
}

uint64_t __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_78(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateAudioStreamStartTimeInSampleCount:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "sampleCount"));
}

void __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_2_79(id *a1)
{
  uint64_t v2;
  unint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  unint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1[4], "requestHistoricalAudioDataWithHostTime") & 1) == 0)
  {
    objc_msgSend(a1[5], "streamRequest");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject recordContext](v10, "recordContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "type") == 11 && !objc_msgSend(a1[4], "startRecordingSampleCount"))
    {

    }
    else
    {
      if ((objc_msgSend(a1[4], "useOpportunisticZLL") & 1) == 0)
        goto LABEL_12;
      v13 = +[CSUtils supportOpportunisticZLL](CSUtils, "supportOpportunisticZLL");

      if (!v13)
        goto LABEL_14;
    }
  }
  v2 = objc_msgSend(a1[4], "startRecordingHostTime");
  v3 = objc_msgSend(*((id *)a1[6] + 37), "sampleCountFromHostTime:", v2);
  v4 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[6];
    v6 = v4;
    objc_msgSend(v5, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 136315906;
    v19 = "-[CSAudioProvider _startAudioStream:option:completion:]_block_invoke_2";
    v20 = 2114;
    v21 = v7;
    v22 = 2050;
    v23 = v2;
    v24 = 2050;
    v25 = v3;
    _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Requested startHostTime = %{public}llu, _clientStartSampleCount = %{public}tu", (uint8_t *)&v18, 0x2Au);

  }
  if (v3 <= objc_msgSend(*((id *)a1[6] + 21), "sampleCount"))
  {
    objc_msgSend(a1[5], "updateAudioStreamStartTimeInSampleCount:", v3);
    goto LABEL_14;
  }
  v8 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v9 = a1[6];
    v10 = v8;
    objc_msgSend(v9, "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(*((id *)a1[6] + 21), "sampleCount");
    v18 = 136315650;
    v19 = "-[CSAudioProvider _startAudioStream:option:completion:]_block_invoke";
    v20 = 2114;
    v21 = v11;
    v22 = 2050;
    v23 = v12;
    _os_log_impl(&dword_1B502E000, v10, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Failed to fetch historical audio since _clientStartSampleCount is newer than audioBuffer sample count(%{public}llu)", (uint8_t *)&v18, 0x20u);
LABEL_12:

  }
LABEL_14:
  objc_msgSend(a1[6], "streams");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", a1[5]);

  +[CSAudioStreamActivityMonitor sharedInstance](CSAudioStreamActivityMonitor, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "streams");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "streamHolders");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "notifyActiveStreamsChanged:streamHolders:streamId:", v16, v17, *((_QWORD *)a1[6] + 27));

}

uint64_t __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_81(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deliverHistoricalAudioToStreamsWithRemoteVAD:", 0);
}

void __57__CSAudioProvider_prepareAudioStream_request_completion___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__CSAudioProvider_prepareAudioStream_request_completion___block_invoke_2;
  v4[3] = &unk_1E6881048;
  v3 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v1, "_prepareAudioStream:request:completion:", v2, v3, v4);

}

uint64_t __57__CSAudioProvider_prepareAudioStream_request_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __56__CSAudioProvider_prepareAudioStreamSync_request_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v5 + 40);
  v6 = objc_msgSend(v2, "_prepareAudioStreamSync:request:error:", v3, v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v6;
}

void __54__CSAudioProvider_startAudioStream_option_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  block[2] = __54__CSAudioProvider_startAudioStream_option_completion___block_invoke_2;
  block[3] = &unk_1E6880E88;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v20 = v2;
  v21 = *(id *)(a1 + 48);
  dispatch_async(v3, block);
  v5 = *(_QWORD **)(a1 + 32);
  if (v5[7])
  {
    objc_msgSend(*(id *)(a1 + 32), "_startAudioStream:option:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v6 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      objc_msgSend(v5, "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_streamStateName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v23 = "-[CSAudioProvider startAudioStream:option:completion:]_block_invoke";
      v24 = 2114;
      v25 = v8;
      v26 = 2114;
      v27 = v9;
      _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:state was %{public}@, prepareAudioStream first", buf, 0x20u);

      v5 = *(_QWORD **)(a1 + 32);
    }
    v10 = *(void **)(a1 + 40);
    objc_msgSend(v10, "streamRequest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v4;
    v15[1] = 3221225472;
    v15[2] = __54__CSAudioProvider_startAudioStream_option_completion___block_invoke_65;
    v15[3] = &unk_1E687F418;
    v12 = *(id *)(a1 + 56);
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(a1 + 40);
    v18 = v12;
    v15[4] = v13;
    v16 = v14;
    v17 = *(id *)(a1 + 48);
    objc_msgSend(v5, "_prepareAudioStream:request:completion:", v10, v11, v15);

  }
}

uint64_t __54__CSAudioProvider_startAudioStream_option_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setStartStreamOption:", *(_QWORD *)(a1 + 40));
}

void __54__CSAudioProvider_startAudioStream_option_completion___block_invoke_65(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  v6 = v5;
  if ((a2 & 1) != 0)
  {
    v8 = v5;
    objc_msgSend(*(id *)(a1 + 32), "_startAudioStream:option:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
LABEL_5:
    v6 = v8;
    goto LABEL_6;
  }
  v7 = *(_QWORD *)(a1 + 56);
  if (v7)
  {
    v8 = v6;
    (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __58__CSAudioProvider__prepareAudioStream_request_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __65__CSAudioProvider_attachTandemStream_toPrimaryStream_completion___block_invoke(id *a1)
{
  void (**v2)(_QWORD, _QWORD, _QWORD);
  id v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  CSAudioStartStreamOption *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __65__CSAudioProvider_attachTandemStream_toPrimaryStream_completion___block_invoke_2;
  v17[3] = &unk_1E687F3F0;
  v18 = a1[4];
  v19 = a1[5];
  v20 = a1[6];
  v2 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1B5E468D0](v17);
  v3 = a1[4];
  if (v3 && a1[5])
  {
    objc_msgSend(v3, "tandemStreams");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", a1[5]);

    if (!v5)
    {
      objc_msgSend(a1[4], "setNeedsBoost12dB:", objc_msgSend(a1[5], "needsBoost12dB"));
      objc_msgSend(a1[4], "updateAudioStreamStartTimeInSampleCount:", objc_msgSend(a1[5], "startSampleCount"));
      objc_msgSend(a1[4], "setScheduledFutureSample:", objc_msgSend(a1[5], "scheduledFutureSample"));
      v12 = a1[4];
      v13 = [CSAudioStartStreamOption alloc];
      objc_msgSend(a1[5], "startStreamOption");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[CSAudioStartStreamOption initTandemWithOption:](v13, "initTandemWithOption:", v14);
      objc_msgSend(v12, "setStartStreamOption:", v15);

      objc_msgSend(a1[5], "tandemStreams");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", a1[4]);

      v2[2](v2, 1, 0);
      goto LABEL_9;
    }
    v6 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      v7 = a1[4];
      v8 = v6;
      objc_msgSend(v7, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v22 = "-[CSAudioProvider attachTandemStream:toPrimaryStream:completion:]_block_invoke";
      v23 = 2114;
      v24 = v9;
      _os_log_error_impl(&dword_1B502E000, v8, OS_LOG_TYPE_ERROR, "%s PrimaryStream is already tandem of stream %{public}@, can't add mutual tandem relation here!", buf, 0x16u);

    }
  }
  else
  {
    v10 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[CSAudioProvider attachTandemStream:toPrimaryStream:completion:]_block_invoke";
      _os_log_error_impl(&dword_1B502E000, v10, OS_LOG_TYPE_ERROR, "%s Invalid input streams", buf, 0xCu);
    }
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 114, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, void *))v2)[2](v2, 0, v11);

LABEL_9:
}

void __65__CSAudioProvider_attachTandemStream_toPrimaryStream_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(void **)(a1 + 32);
    v8 = v6;
    objc_msgSend(v7, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v11 = CFSTR("failed");
    else
      v11 = CFSTR("successfully");
    objc_msgSend(v5, "localizedDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136316162;
    v15 = "-[CSAudioProvider attachTandemStream:toPrimaryStream:completion:]_block_invoke_2";
    v16 = 2114;
    v17 = v9;
    v18 = 2114;
    v19 = v10;
    v20 = 2114;
    v21 = v11;
    v22 = 2114;
    v23 = v12;
    _os_log_impl(&dword_1B502E000, v8, OS_LOG_TYPE_DEFAULT, "%s Attached stream %{public}@ as tandem to master stream %{public}@ %{public}@, error : %{public}@", (uint8_t *)&v14, 0x34u);

  }
  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
    (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, a2, v5);

}

uint64_t __64__CSAudioProvider_audioStreamWithRequest_streamName_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __64__CSAudioProvider_audioStreamWithRequest_streamName_completion___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v7 = 0;
  objc_msgSend(v2, "_audioStreamWithRequest:streamName:error:", v3, v4, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  (*(void (**)(void))(a1[7] + 16))();

}

void __59__CSAudioProvider_audioStreamWithRequest_streamName_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v2, "_audioStreamWithRequest:streamName:error:", v3, v4, &obj);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  v7 = *(_QWORD *)(a1[7] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __43__CSAudioProvider_setCurrentContext_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id obj;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "_canSetContext") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setLatestRecordContext:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "audioRecorder");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 32), "audioRecorder");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(a1 + 40);
      v5 = objc_msgSend(*(id *)(a1 + 32), "audioStreamHandleId");
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      obj = *(id *)(v6 + 40);
      LOBYTE(v4) = objc_msgSend(v3, "setCurrentContext:streamHandleId:error:", v4, v5, &obj);
      objc_storeStrong((id *)(v6 + 40), obj);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4;

    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 958, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

    }
  }
  else
  {
    v7 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(void **)(a1 + 32);
      v9 = v7;
      objc_msgSend(v8, "UUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v16 = "-[CSAudioProvider setCurrentContext:error:]_block_invoke";
      v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_1B502E000, v9, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Cannot change context since audio recorder is currently recording", buf, 0x16u);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
}

void __58__CSAudioProvider_supportsDuckingOnCurrentRouteWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "audioRecorder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "audioRecorder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(*(id *)(a1 + 32), "audioStreamHandleId");
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v5 + 40);
    v6 = objc_msgSend(v3, "isDuckingSupportedOnCurrentRouteWithStreamHandleID:error:", v4, &obj);
    objc_storeStrong((id *)(v5 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 958, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

uint64_t __53__CSAudioProvider_setLatestRecordContext_streamType___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 312) = *(_QWORD *)(a1 + 48);
  return objc_msgSend(*(id *)(a1 + 32), "_setLatestRecordContext:", *(_QWORD *)(a1 + 40));
}

uint64_t __44__CSAudioProvider_setAudioProviderDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setProviderDelegate:", *(_QWORD *)(a1 + 40));
}

void __36__CSAudioProvider_setAudioRecorder___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v10 = 136315650;
    v11 = "-[CSAudioProvider setAudioRecorder:]_block_invoke";
    v12 = 2114;
    v13 = v5;
    v14 = 2050;
    v15 = v6;
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Setting audioRecorder : %{public}p", (uint8_t *)&v10, 0x20u);

  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "registerObserver:");
  v7 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[CSAudioProvider setAudioRecorder:]_block_invoke";
    _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEFAULT, "%s Reset recordDeviceIndicator as we have new audioRecorder", (uint8_t *)&v10, 0xCu);
  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 320);
  *(_QWORD *)(v8 + 320) = 0;

}

uint64_t __24__CSAudioProvider_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateRemoteDeviceIdFromAVVCIfNeeded");
}

CSStateCaptureOptions *__24__CSAudioProvider_start__block_invoke_2(uint64_t a1)
{
  CSStateCaptureOptions *v2;
  CSStateCaptureOptions *v3;
  _QWORD v5[4];
  id v6;

  v2 = [CSStateCaptureOptions alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __24__CSAudioProvider_start__block_invoke_3;
  v5[3] = &unk_1E687F350;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  v3 = -[CSStateCaptureOptions initWithMutableBuilder:](v2, "initWithMutableBuilder:", v5);
  objc_destroyWeak(&v6);
  return v3;
}

void __24__CSAudioProvider_start__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _QWORD block[4];
  id v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  objc_msgSend(WeakRetained, "recordQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__CSAudioProvider_start__block_invoke_4;
  block[3] = &unk_1E6880D18;
  v42 = &v43;
  v7 = WeakRetained;
  v41 = v7;
  dispatch_sync(v5, block);

  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__6454;
  v38 = __Block_byref_object_dispose__6455;
  v39 = 0;
  objc_msgSend(v7, "streamHandleQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v31[0] = v6;
  v31[1] = 3221225472;
  v31[2] = __24__CSAudioProvider_start__block_invoke_43;
  v31[3] = &unk_1E6880D18;
  v33 = &v34;
  v9 = v7;
  v32 = v9;
  dispatch_sync(v8, v31);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v44[3]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v9, "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("StreamState[CSAudioProvider-%@]"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v11, v14);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v16 = (id)v35[5];
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v47, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v28;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v19), "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v47, 16);
    }
    while (v17);
  }

  if (objc_msgSend(v15, "count"))
  {
    v21 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "UUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("activeStreams[CSAudioProvider-%@]"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forKey:", v15, v23);

  }
  objc_msgSend(v3, "setStateData:", v10);
  v24 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v9, "UUID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("CoreSpeech-AudioStates[CSAudioProvider-%@]"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStateDataTitle:", v26);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v43, 8);

}

uint64_t __24__CSAudioProvider_start__block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "streamState");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __24__CSAudioProvider_start__block_invoke_43(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "streams");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
