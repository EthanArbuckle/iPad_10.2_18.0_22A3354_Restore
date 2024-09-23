@implementation CSSpeechController

- (CSSpeechController)init
{
  return -[CSSpeechController initWithEndpointId:](self, "initWithEndpointId:", 0);
}

- (CSSpeechController)initWithEndpointId:(id)a3
{
  void *v4;
  id v5;
  char v6;
  char v7;
  char v8;
  CSSpeechController *v9;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0D19260];
  v5 = a3;
  v6 = objc_msgSend(v4, "supportPhatic");
  v7 = objc_msgSend(MEMORY[0x1E0D19260], "supportHearstVoiceTrigger");
  if (CSIsIOS())
    v8 = CSIsHorseman() ^ 1;
  else
    v8 = 0;
  BYTE3(v11) = objc_msgSend(MEMORY[0x1E0D19260], "supportSessionActivateDelay");
  BYTE2(v11) = v8;
  BYTE1(v11) = v7;
  LOBYTE(v11) = v6;
  v9 = -[CSSpeechController initWithEndpointId:xpcClientFactory:endpointer:continuousVoiceTrigger:siriVolumeController:mediaPlayingMonitor:alarmMonitor:timerMonitor:audioSessionController:supportPhatic:supportHearstVoiceTrigger:supportTriagleModeSessionActivationRetry:supportSessionActivateDelay:supportsDuckingOnSpeakerEvaluator:](self, "initWithEndpointId:xpcClientFactory:endpointer:continuousVoiceTrigger:siriVolumeController:mediaPlayingMonitor:alarmMonitor:timerMonitor:audioSessionController:supportPhatic:supportHearstVoiceTrigger:supportTriagleModeSessionActivationRetry:supportSessionActivateDelay:supportsDuckingOnSpeakerEvaluator:", v5, 0, 0, 0, 0, 0, 0, 0, 0, v11, 0);

  return v9;
}

- (CSSpeechController)initWithEndpointId:(id)a3 xpcClientFactory:(id)a4 endpointer:(id)a5 continuousVoiceTrigger:(id)a6 siriVolumeController:(id)a7 mediaPlayingMonitor:(id)a8 alarmMonitor:(id)a9 timerMonitor:(id)a10 audioSessionController:(id)a11 supportPhatic:(BOOL)a12 supportHearstVoiceTrigger:(BOOL)a13 supportTriagleModeSessionActivationRetry:(BOOL)a14 supportSessionActivateDelay:(BOOL)a15 supportsDuckingOnSpeakerEvaluator:(id)a16
{
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  CSSpeechController *v30;
  void *v31;
  uint64_t v32;
  OS_dispatch_queue *queue;
  uint64_t v34;
  OS_dispatch_queue *contextResetQueue;
  NSString *bundleIdFromDictation;
  uint64_t v37;
  NSUUID *endpointId;
  CSEndpointerProxy *v39;
  CSEndpointerProxy *endpointerProxy;
  CSRCHandlingXPCClient *v41;
  CSRCHandlingXPCClient *rcHandlingClient;
  void *v43;
  id v44;
  objc_class *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  uint64_t v55;
  CSAudioZeroCounter *continuousZeroCounter;
  uint64_t v57;
  OS_dispatch_queue *audibleFeedbackQueue;
  dispatch_group_t v59;
  OS_dispatch_group *twoShotAudibleFeedbackDecisionGroup;
  SOMediaNowPlayingObserver *v61;
  SOMediaNowPlayingObserver *mediaPlayingMonitor;
  SOClockAlarmObserver *v63;
  SOClockAlarmObserver *alarmMonitor;
  SOClockTimerObserver *v65;
  SOClockTimerObserver *timerMonitor;
  uint64_t v67;
  CSVolumeMonitor *volumeMonitor;
  CSSpeechEndHostTimeEstimator *v69;
  CSSpeechEndHostTimeEstimator *speechEndHostTimeEstimator;
  CSSmartSiriVolumeController *v71;
  CSSmartSiriVolumeController *volumeController;
  CSContinuousVoiceTrigger *v73;
  CSContinuousVoiceTrigger *continuousVoiceTrigger;
  uint64_t v75;
  NSMutableDictionary *decodersForTV;
  void *v77;
  uint64_t v78;
  SSRVoiceProfileManager *voiceProfileManager;
  void *v80;
  CSXPCClientFactory *v81;
  CSXPCClientFactory *xpcClientFactory;
  CSAudioSessionController *v83;
  CSAudioSessionController *audioSessionController;
  uint64_t v85;
  id supportsDuckingOnSpeakerOutputEvaluator;
  NSObject *v87;
  id v89;
  id v90;
  id v91;
  id v92;
  _QWORD block[4];
  CSSpeechController *v94;
  objc_super v95;

  v92 = a3;
  v22 = a4;
  v91 = a5;
  v23 = a6;
  v24 = a7;
  v90 = a8;
  v25 = a9;
  v26 = a10;
  v27 = a11;
  v28 = v25;
  v29 = a16;
  v95.receiver = self;
  v95.super_class = (Class)CSSpeechController;
  v30 = -[CSSpeechController init](&v95, sel_init);
  if (!v30)
    goto LABEL_60;
  v89 = v29;
  CSLogInitIfNeeded();
  v30->_supportPhatic = a12;
  v30->_supportHearstVoiceTrigger = a13;
  v30->_supportTriagleModeSessionActivationRetry = a14;
  v30->_supportSessionActivateDelay = a15;
  if ((objc_msgSend(MEMORY[0x1E0D19260], "supportsDispatchWorkloop") & 1) != 0)
  {
    v31 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D19260], "rootQueueWithFixedPriority:", *MEMORY[0x1E0D192F0]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[CSSpeechController _getSerialQueueWithName:targetQueue:](v30, "_getSerialQueueWithName:targetQueue:", CFSTR("CSSpeechController"), v31);
  v32 = objc_claimAutoreleasedReturnValue();
  queue = v30->_queue;
  v30->_queue = (OS_dispatch_queue *)v32;

  -[CSSpeechController _getSerialQueueWithName:targetQueue:](v30, "_getSerialQueueWithName:targetQueue:", CFSTR("CSSpeechController ContextReset"), v31);
  v34 = objc_claimAutoreleasedReturnValue();
  contextResetQueue = v30->_contextResetQueue;
  v30->_contextResetQueue = (OS_dispatch_queue *)v34;

  v30->_isSiriClientListening = 0;
  v30->_isNarrowBand = 0;
  bundleIdFromDictation = v30->_bundleIdFromDictation;
  v30->_bundleIdFromDictation = 0;

  v37 = objc_msgSend(v92, "copy");
  endpointId = v30->_endpointId;
  v30->_endpointId = (NSUUID *)v37;

  if (v91)
  {
    objc_storeStrong((id *)&v30->_endpointerProxy, a5);
LABEL_13:
    -[CSEndpointerProxy setEndpointerImplDelegate:](v30->_endpointerProxy, "setEndpointerImplDelegate:", v30);
    goto LABEL_14;
  }
  if (!CSIsTV() || (objc_msgSend(MEMORY[0x1E0D19260], "supportsEndpointingOnATV") & 1) != 0)
  {
    if (!v30->_endpointId)
    {
      +[CSEndpointerFactory endpointerProxy](CSEndpointerFactory, "endpointerProxy");
      v39 = (CSEndpointerProxy *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_10:
    v39 = -[CSEndpointerProxy initForSidekick]([CSEndpointerProxy alloc], "initForSidekick");
LABEL_12:
    endpointerProxy = v30->_endpointerProxy;
    v30->_endpointerProxy = v39;

    goto LABEL_13;
  }
  if (objc_msgSend(MEMORY[0x1E0D19260], "supportHomeKitAccessory") && v30->_endpointId)
    goto LABEL_10;
LABEL_14:
  if (-[CSSpeechController _supportsHybridSDSD](v30, "_supportsHybridSDSD"))
  {
    v41 = objc_alloc_init(CSRCHandlingXPCClient);
    rcHandlingClient = v30->_rcHandlingClient;
    v30->_rcHandlingClient = v41;

  }
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v30->_twoShotNotificationEnabled = objc_msgSend(v43, "twoShotNotificationEnabled");

  if (CSIsInternalBuild())
  {
    v44 = objc_alloc(MEMORY[0x1E0D19070]);
    v45 = (objc_class *)objc_opt_class();
    NSStringFromClass(v45);
    v46 = v27;
    v47 = v24;
    v48 = v23;
    v49 = v26;
    v50 = v22;
    v51 = v31;
    v52 = v28;
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v54 = (float)-[CSSpeechController _currentAudioRecorderSampleRate](v30, "_currentAudioRecorderSampleRate");
    v55 = objc_msgSend(v44, "initWithToken:sampleRate:numChannels:", v53, 1, v54);
    continuousZeroCounter = v30->_continuousZeroCounter;
    v30->_continuousZeroCounter = (CSAudioZeroCounter *)v55;

    v28 = v52;
    v31 = v51;
    v22 = v50;
    v26 = v49;
    v23 = v48;
    v24 = v47;
    v27 = v46;
    v29 = v89;
  }
  if (v30->_supportPhatic)
  {
    -[CSSpeechController _getSerialQueueWithName:targetQueue:](v30, "_getSerialQueueWithName:targetQueue:", CFSTR("com.apple.corespeech.twoShotAudibleFeedback"), v31);
    v57 = objc_claimAutoreleasedReturnValue();
    audibleFeedbackQueue = v30->_audibleFeedbackQueue;
    v30->_audibleFeedbackQueue = (OS_dispatch_queue *)v57;

    v59 = dispatch_group_create();
    twoShotAudibleFeedbackDecisionGroup = v30->_twoShotAudibleFeedbackDecisionGroup;
    v30->_twoShotAudibleFeedbackDecisionGroup = (OS_dispatch_group *)v59;

  }
  if (-[CSSpeechController _shouldUseSoundPlaybackMonitors](v30, "_shouldUseSoundPlaybackMonitors"))
  {
    if (v90)
    {
      v61 = (SOMediaNowPlayingObserver *)v90;
    }
    else
    {
      -[CSSpeechController _createMediaPlayingMonitor](v30, "_createMediaPlayingMonitor");
      v61 = (SOMediaNowPlayingObserver *)objc_claimAutoreleasedReturnValue();
    }
    mediaPlayingMonitor = v30->_mediaPlayingMonitor;
    v30->_mediaPlayingMonitor = v61;

    -[CSSpeechController _initializeMediaPlayingState](v30, "_initializeMediaPlayingState");
    if (v28)
    {
      v63 = v28;
    }
    else
    {
      -[CSSpeechController _createAlarmMonitor](v30, "_createAlarmMonitor");
      v63 = (SOClockAlarmObserver *)objc_claimAutoreleasedReturnValue();
    }
    alarmMonitor = v30->_alarmMonitor;
    v30->_alarmMonitor = v63;

    -[CSSpeechController _initializeAlarmState](v30, "_initializeAlarmState");
    if (v26)
    {
      v65 = (SOClockTimerObserver *)v26;
    }
    else
    {
      -[CSSpeechController _createTimerMonitor](v30, "_createTimerMonitor");
      v65 = (SOClockTimerObserver *)objc_claimAutoreleasedReturnValue();
    }
    timerMonitor = v30->_timerMonitor;
    v30->_timerMonitor = v65;

    -[CSSpeechController _initializeTimerState](v30, "_initializeTimerState");
    objc_msgSend(MEMORY[0x1E0D192B0], "sharedInstance");
    v67 = objc_claimAutoreleasedReturnValue();
    volumeMonitor = v30->_volumeMonitor;
    v30->_volumeMonitor = (CSVolumeMonitor *)v67;

    -[CSVolumeMonitor addObserver:](v30->_volumeMonitor, "addObserver:", v30);
  }
  if (v30->_supportHearstVoiceTrigger || CSIsHorseman())
  {
    v69 = objc_alloc_init(CSSpeechEndHostTimeEstimator);
    speechEndHostTimeEstimator = v30->_speechEndHostTimeEstimator;
    v30->_speechEndHostTimeEstimator = v69;

  }
  if (v24)
  {
    v71 = (CSSmartSiriVolumeController *)v24;
LABEL_36:
    volumeController = v30->_volumeController;
    v30->_volumeController = v71;

    -[CSSmartSiriVolumeController setDelegate:](v30->_volumeController, "setDelegate:", v30);
    goto LABEL_39;
  }
  if (objc_msgSend(MEMORY[0x1E0D19260], "supportSmartVolume") && !v30->_endpointId)
  {
    v71 = objc_alloc_init(CSSmartSiriVolumeController);
    goto LABEL_36;
  }
LABEL_39:
  if (v23)
  {
    v73 = (CSContinuousVoiceTrigger *)v23;
LABEL_43:
    continuousVoiceTrigger = v30->_continuousVoiceTrigger;
    v30->_continuousVoiceTrigger = v73;

    -[CSContinuousVoiceTrigger setDelegate:](v30->_continuousVoiceTrigger, "setDelegate:", v30);
    goto LABEL_44;
  }
  if (objc_msgSend(MEMORY[0x1E0D19260], "supportContinuousVoiceTrigger"))
  {
    v73 = objc_alloc_init(CSContinuousVoiceTrigger);
    goto LABEL_43;
  }
LABEL_44:
  if (-[CSSpeechController _isHubRequestTV](v30, "_isHubRequestTV"))
  {
    v30->_decoderProcessedSampleCountForTV = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v75 = objc_claimAutoreleasedReturnValue();
    decodersForTV = v30->_decodersForTV;
    v30->_decodersForTV = (NSMutableDictionary *)v75;

  }
  v30->_isAudioSessionActivated = 0;
  if (CSIsCommunalDevice()
    && (!objc_msgSend(MEMORY[0x1E0D19260], "isAttentiveSiriEnabled") || v30->_endpointId))
  {
    +[CSSpeakerRecognitionAssetDownloadMonitor sharedInstance](CSSpeakerRecognitionAssetDownloadMonitor, "sharedInstance");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "addObserver:", v30);

  }
  objc_msgSend(MEMORY[0x1E0DA8C28], "sharedInstanceWithEndpointId:", v30->_endpointId);
  v78 = objc_claimAutoreleasedReturnValue();
  voiceProfileManager = v30->_voiceProfileManager;
  v30->_voiceProfileManager = (SSRVoiceProfileManager *)v78;

  objc_msgSend(MEMORY[0x1E0D19158], "sharedInstance");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "addObserver:", v30);

  v30->_setupStarted = 0;
  if (v22)
  {
    v81 = (CSXPCClientFactory *)v22;
  }
  else
  {
    +[CSXPCClientFactory defaultFactory](CSXPCClientFactory, "defaultFactory");
    v81 = (CSXPCClientFactory *)objc_claimAutoreleasedReturnValue();
  }
  xpcClientFactory = v30->_xpcClientFactory;
  v30->_xpcClientFactory = v81;

  if (v27)
  {
    v83 = (CSAudioSessionController *)v27;
  }
  else
  {
    +[CSAudioSessionController sharedInstance](CSAudioSessionController, "sharedInstance");
    v83 = (CSAudioSessionController *)objc_claimAutoreleasedReturnValue();
  }
  audioSessionController = v30->_audioSessionController;
  v30->_audioSessionController = v83;

  if (v29)
  {
    v85 = MEMORY[0x1C3BC4734](v29);
    supportsDuckingOnSpeakerOutputEvaluator = v30->_supportsDuckingOnSpeakerOutputEvaluator;
    v30->_supportsDuckingOnSpeakerOutputEvaluator = (id)v85;
  }
  else
  {
    supportsDuckingOnSpeakerOutputEvaluator = v30->_supportsDuckingOnSpeakerOutputEvaluator;
    v30->_supportsDuckingOnSpeakerOutputEvaluator = &__block_literal_global_145;
  }

  v87 = v30->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __325__CSSpeechController_initWithEndpointId_xpcClientFactory_endpointer_continuousVoiceTrigger_siriVolumeController_mediaPlayingMonitor_alarmMonitor_timerMonitor_audioSessionController_supportPhatic_supportHearstVoiceTrigger_supportTriagleModeSessionActivationRetry_supportSessionActivateDelay_supportsDuckingOnSpeakerEvaluator___block_invoke_2;
  block[3] = &unk_1E7C292C8;
  v94 = v30;
  dispatch_async(v87, block);

LABEL_60:
  return v30;
}

- (id)_getSerialQueueWithName:(id)a3 targetQueue:(id)a4
{
  NSObject *v5;
  uint64_t v6;
  void *v7;

  v5 = a4;
  if (v5)
  {
    v6 = (uint64_t)dispatch_queue_create_with_target_V2((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), 0, v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D19260], "getSerialQueueWithQOS:name:fixedPriority:", 33, a3, *MEMORY[0x1E0D192F0]);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (BOOL)_supportsHybridSDSD
{
  if ((AFDeviceSupportsSiriUOD() & 1) != 0)
    return 0;
  else
    return AFDeviceSupportsHybridUOD();
}

- (id)_createMediaPlayingMonitor
{
  NSObject *v3;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *mediaPlayingObserverQueue;
  NSUUID *endpointId;
  id v7;
  void *v8;
  OS_dispatch_queue *v9;
  void *v10;
  void *v11;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (OS_dispatch_queue *)dispatch_queue_create("MediaPlayingObserverQueue", v3);
  mediaPlayingObserverQueue = self->_mediaPlayingObserverQueue;
  self->_mediaPlayingObserverQueue = v4;

  endpointId = self->_endpointId;
  v7 = objc_alloc(MEMORY[0x1E0D9FFF8]);
  v8 = v7;
  v9 = self->_mediaPlayingObserverQueue;
  if (endpointId)
  {
    objc_msgSend(MEMORY[0x1E0CFE8E0], "currentContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithQueue:instanceContext:", v9, v10);

  }
  else
  {
    v11 = (void *)objc_msgSend(v7, "initWithQueue:", v9);
  }

  return v11;
}

- (id)_createAlarmMonitor
{
  id v2;
  void *v3;
  id v4;

  if (self->_endpointId)
  {
    v2 = objc_alloc(MEMORY[0x1E0D9FFE8]);
    objc_msgSend(MEMORY[0x1E0CFE8E0], "currentContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v2, "initWithInstanceContext:", v3);

  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D9FFE8]);
  }
  return v4;
}

- (id)_createTimerMonitor
{
  id v2;
  void *v3;
  id v4;

  if (self->_endpointId)
  {
    v2 = objc_alloc(MEMORY[0x1E0D9FFF0]);
    objc_msgSend(MEMORY[0x1E0CFE8E0], "currentContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v2, "initWithInstanceContext:", v3);

  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D9FFF0]);
  }
  return v4;
}

- (void)_initializeMediaPlayingState
{
  SOMediaNowPlayingObserver *mediaPlayingMonitor;
  _QWORD v4[4];
  id v5;
  id location;

  -[SOMediaNowPlayingObserver addListener:](self->_mediaPlayingMonitor, "addListener:", self);
  objc_initWeak(&location, self);
  mediaPlayingMonitor = self->_mediaPlayingMonitor;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__CSSpeechController__initializeMediaPlayingState__block_invoke;
  v4[3] = &unk_1E7C271E8;
  objc_copyWeak(&v5, &location);
  -[SOMediaNowPlayingObserver getPlaybackStateWithCompletion:](mediaPlayingMonitor, "getPlaybackStateWithCompletion:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_initializeAlarmState
{
  SOClockAlarmObserver *alarmMonitor;
  _QWORD v4[4];
  id v5;
  id location;

  -[SOClockAlarmObserver addListener:](self->_alarmMonitor, "addListener:", self);
  objc_initWeak(&location, self);
  alarmMonitor = self->_alarmMonitor;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__CSSpeechController__initializeAlarmState__block_invoke;
  v4[3] = &unk_1E7C24E70;
  objc_copyWeak(&v5, &location);
  -[SOClockAlarmObserver getFiringAlarmIDsWithCompletion:](alarmMonitor, "getFiringAlarmIDsWithCompletion:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_initializeTimerState
{
  SOClockTimerObserver *timerMonitor;
  _QWORD v4[4];
  id v5;
  id location;

  -[SOClockTimerObserver addListener:](self->_timerMonitor, "addListener:", self);
  objc_initWeak(&location, self);
  timerMonitor = self->_timerMonitor;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__CSSpeechController__initializeTimerState__block_invoke;
  v4[3] = &unk_1E7C24E70;
  objc_copyWeak(&v5, &location);
  -[SOClockTimerObserver getFiringTimerIDsWithCompletion:](timerMonitor, "getFiringTimerIDsWithCompletion:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (BOOL)initializeRecordSessionWithRecordContext:(id)a3
{
  id v4;
  NSObject *v5;
  BOOL v6;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[CSSpeechController initializeRecordSessionWithRecordContext:]";
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Record Context: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  kdebug_trace();
  v6 = -[CSSpeechController setCurrentRecordContext:error:](self, "setCurrentRecordContext:error:", v4, 0);
  kdebug_trace();

  return v6;
}

- (void)startController
{
  os_log_t *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (os_log_t *)MEMORY[0x1E0D18F48];
  v4 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[CSSpeechController startController]";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Calling startController", buf, 0xCu);
  }
  if (self->_setupStarted)
  {
    v5 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[CSSpeechController startController]";
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Ignore request since it is already started", buf, 0xCu);
    }
  }
  else
  {
    +[CSVoiceTriggerAssetHandler sharedHandlerDisabledOnDeviceCompilation](CSVoiceTriggerAssetHandler, "sharedHandlerDisabledOnDeviceCompilation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUUID UUIDString](self->_endpointId, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __37__CSSpeechController_startController__block_invoke;
    v9[3] = &unk_1E7C28D98;
    v9[4] = self;
    objc_msgSend(v6, "getVoiceTriggerAssetWithEndpointId:completion:", v7, v9);

    +[CSVoiceTriggerAssetHandler sharedHandlerDisabledOnDeviceCompilation](CSVoiceTriggerAssetHandler, "sharedHandlerDisabledOnDeviceCompilation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerObserver:", self);

    if (!self->_endpointId)
      -[CSSmartSiriVolumeController setDelegate:](self->_volumeController, "setDelegate:", self);
    -[CSAudioSessionController registerObserver:](self->_audioSessionController, "registerObserver:", self);
    if (!objc_msgSend(MEMORY[0x1E0D19260], "isAttentiveSiriEnabled") || self->_endpointId)
      -[CSSpeechController _refreshSpeakerRecognitionAssets](self, "_refreshSpeakerRecognitionAssets");
    self->_setupStarted = 1;
  }
}

- (BOOL)_isHubRequestTV
{
  int v3;

  v3 = CSIsTV();
  if (v3)
    LOBYTE(v3) = self->_endpointId == 0;
  return v3;
}

- (BOOL)_shouldResetContextAtPrepare
{
  CSXPCClient *xpcClient;

  xpcClient = self->_xpcClient;
  if (xpcClient)
    return !-[CSXPCClient isConnected](xpcClient, "isConnected");
  else
    return 1;
}

- (BOOL)prepareRecordWithSettings:(id)a3 error:(id *)a4
{
  __CFString *v6;
  os_log_t *v7;
  NSObject *v8;
  char *__ptr32 *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  NSString *v14;
  NSString *bundleIdFromDictation;
  uint64_t v16;
  double v17;
  void *v18;
  char v19;
  void *v20;
  float v21;
  NSObject *contextResetQueue;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  char v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  _BOOL4 v40;
  id v41;
  _BOOL4 v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  NSObject *v46;
  id v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  int v53;
  NSObject *v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  os_log_t v62;
  const __CFString *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  objc_class *v70;
  void *v71;
  os_log_t v72;
  const __CFString *v73;
  NSObject *v74;
  void *v75;
  NSObject *v76;
  uint64_t v77;
  NSObject *v78;
  id v79;
  void *v80;
  void *v81;
  char v82;
  uint64_t v83;
  NSObject *v84;
  NSObject *queue;
  NSObject *v86;
  const __CFString *v87;
  NSObject *v89;
  __CFString *v90;
  id *v91;
  _QWORD v92[5];
  id v93;
  id v94;
  id v95;
  _QWORD v96[5];
  id v97;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v100;
  __int16 v101;
  const __CFString *v102;
  __int16 v103;
  void *v104;
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v7 = (os_log_t *)MEMORY[0x1E0D18F48];
  v8 = *MEMORY[0x1E0D18F48];
  v9 = &off_1C276C000;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v100 = "-[CSSpeechController prepareRecordWithSettings:error:]";
    v101 = 2114;
    v102 = v6;
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s settings : %{public}@", buf, 0x16u);
  }
  kdebug_trace();
  if (!v6)
    goto LABEL_7;
  -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_DictationRequestAppBundleID"));
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_7;
  v11 = (void *)v10;
  -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_DictationRequestAppBundleID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_DictationRequestAppBundleID"));
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    bundleIdFromDictation = self->_bundleIdFromDictation;
    self->_bundleIdFromDictation = v14;
  }
  else
  {
LABEL_7:
    bundleIdFromDictation = self->_bundleIdFromDictation;
    self->_bundleIdFromDictation = 0;
  }

  if (-[CSSpeechController _isHubRequestTV](self, "_isHubRequestTV"))
    self->_decoderProcessedSampleCountForTV = 0;
  v16 = 0;
  v17 = 0.0;
  if (v6 && self->_supportSessionActivateDelay)
  {
    -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_AudioSessionActiveDelay"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v19 = objc_opt_isKindOfClass();

    if ((v19 & 1) != 0)
    {
      -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_AudioSessionActiveDelay"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "floatValue");
      v17 = v21;

      v16 = 1;
    }
    else
    {
      v16 = 0;
    }
  }
  contextResetQueue = self->_contextResetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CSSpeechController_prepareRecordWithSettings_error___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async_and_wait(contextResetQueue, block);
  -[CSSpeechController sessionProvider](self, "sessionProvider");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[CSSpeechController sessionProvider](self, "sessionProvider");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "enableSmartRoutingConsideration:", 0);

  }
  -[CSSpeechController sessionProvider](self, "sessionProvider");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
    v33 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v100 = "-[CSSpeechController prepareRecordWithSettings:error:]";
      _os_log_error_impl(&dword_1C2614000, v33, OS_LOG_TYPE_ERROR, "%s Session Provider does not exist", buf, 0xCu);
      if (!v6)
        goto LABEL_32;
      goto LABEL_26;
    }
LABEL_25:
    if (!v6)
      goto LABEL_32;
    goto LABEL_26;
  }
  if (!v6 || !self->_supportHearstVoiceTrigger)
    goto LABEL_25;
  -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_AudioSessionActiveReason"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v27 = objc_opt_isKindOfClass();

  if ((v27 & 1) == 0)
    goto LABEL_26;
  -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_AudioSessionActiveReason"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "integerValue");

  if (v29 == 2)
  {
    if (!-[CSAudioRecordContext isTriggeredFromHearst](self->_audioRecordContext, "isTriggeredFromHearst"))goto LABEL_26;
    -[CSSpeechController sessionProvider](self, "sessionProvider");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    v32 = 1;
  }
  else
  {
    -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_AudioSessionActiveReason"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "integerValue");

    if (v39 != 3)
      goto LABEL_26;
    -[CSSpeechController sessionProvider](self, "sessionProvider");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    v32 = 0;
  }
  objc_msgSend(v30, "enableMiniDucking:", v32);

LABEL_26:
  -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_AudioSessionActiveReason"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v35 = objc_opt_isKindOfClass();

  if ((v35 & 1) != 0)
  {
    -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_AudioSessionActiveReason"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "integerValue");

    goto LABEL_33;
  }
LABEL_32:
  v37 = 0;
LABEL_33:
  if ((-[CSSpeechController _shouldFetchVoiceTriggerInfo](self, "_shouldFetchVoiceTriggerInfo")
     || -[CSSpeechController _shouldFetchRaiseToSpeakInfo](self, "_shouldFetchRaiseToSpeakInfo"))
    && !-[CSSpeechController _fetchLastTriggerInfo](self, "_fetchLastTriggerInfo"))
  {
    v40 = 0;
    v41 = 0;
  }
  else
  {
    v97 = 0;
    v40 = -[CSSpeechController _activateAudioSessionWithReason:delay:delayRequested:error:](self, "_activateAudioSessionWithReason:delay:delayRequested:error:", v37, v16, &v97, v17);
    v41 = v97;
  }
  v42 = self->_supportTriagleModeSessionActivationRetry || v40;
  if (!self->_supportTriagleModeSessionActivationRetry || v40)
    goto LABEL_50;
  objc_msgSend(v41, "domain");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v43, "isEqualToString:", *MEMORY[0x1E0CB2F90]) & 1) == 0)
  {

    goto LABEL_49;
  }
  v44 = objc_msgSend(v41, "code");

  if (v44 != -11795)
  {
LABEL_49:
    v42 = 0;
    goto LABEL_50;
  }
  v45 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v100 = "-[CSSpeechController prepareRecordWithSettings:error:]";
    _os_log_impl(&dword_1C2614000, v45, OS_LOG_TYPE_DEFAULT, "%s Received special error code that corespeech needs to setContext and activate audio session again", buf, 0xCu);
  }
  v46 = self->_contextResetQueue;
  v96[0] = MEMORY[0x1E0C809B0];
  v96[1] = 3221225472;
  v96[2] = __54__CSSpeechController_prepareRecordWithSettings_error___block_invoke_158;
  v96[3] = &unk_1E7C292C8;
  v96[4] = self;
  dispatch_async_and_wait(v46, v96);
  v95 = v41;
  v42 = -[CSSpeechController _activateAudioSessionWithReason:error:](self, "_activateAudioSessionWithReason:error:", v37, &v95);
  v47 = v95;

  v41 = v47;
LABEL_50:
  v48 = -[CSAudioRecordContext isContinuousConversation](self->_audioRecordContext, "isContinuousConversation");
  if ((_DWORD)v48)
  {
    v49 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v100 = "-[CSSpeechController prepareRecordWithSettings:error:]";
      _os_log_impl(&dword_1C2614000, v49, OS_LOG_TYPE_DEFAULT, "%s We will skip Siri Client monitor update since it is FF", buf, 0xCu);
    }
  }
  if (!v42)
  {
    v55 = 0;
    goto LABEL_84;
  }
  v91 = a4;
  -[CSSpeechController audioStream](self, "audioStream");
  v50 = objc_claimAutoreleasedReturnValue();
  if (v50)
  {
    v51 = (void *)v50;
    -[CSSpeechController audioStream](self, "audioStream");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "isStreaming");

    if (v53)
    {
      v54 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v100 = "-[CSSpeechController prepareRecordWithSettings:error:]";
        _os_log_impl(&dword_1C2614000, v54, OS_LOG_TYPE_DEFAULT, "%s CSSpeechController is already streaming audio.., we don't need to create another audio stream here", buf, 0xCu);
      }
      v55 = 1;
      goto LABEL_83;
    }
  }
  -[CSSpeechController audioStream](self, "audioStream");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v56)
  {
    -[CSSpeechController streamProvider](self, "streamProvider");
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v66)
    {
      v76 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v100 = "-[CSSpeechController prepareRecordWithSettings:error:]";
        _os_log_error_impl(&dword_1C2614000, v76, OS_LOG_TYPE_ERROR, "%s AudioStreamProvider is not existing?", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1552, 0);
      v77 = objc_claimAutoreleasedReturnValue();

      v55 = 0;
      v41 = (id)v77;
      goto LABEL_83;
    }
    v67 = (void *)MEMORY[0x1E0D19058];
    -[CSSpeechController audioRecordContext](self, "audioRecordContext");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "defaultRequestWithContext:", v68);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v59, "setClientIdentity:", 1);
    objc_msgSend(v59, "setRequestSkipClientMonitorUpdate:", v48);
    objc_msgSend(v59, "setRequestRecordModeLock:", 1);
    objc_msgSend(v59, "setRequestListeningMicIndicatorLock:", 1);
    -[CSSpeechController streamProvider](self, "streamProvider");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = (objc_class *)objc_opt_class();
    NSStringFromClass(v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = 0;
    objc_msgSend(v69, "audioStreamWithRequest:streamName:error:", v59, v71, &v93);
    v64 = objc_claimAutoreleasedReturnValue();
    v61 = v93;

    v7 = (os_log_t *)MEMORY[0x1E0D18F48];
    v72 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      if (v64)
        v73 = CFSTR("YES");
      else
        v73 = CFSTR("NO");
      v74 = v72;
      objc_msgSend(v61, "localizedDescription");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v100 = "-[CSSpeechController prepareRecordWithSettings:error:]";
      v101 = 2114;
      v102 = v73;
      v9 = &off_1C276C000;
      v103 = 2114;
      v104 = v75;
      _os_log_impl(&dword_1C2614000, v74, OS_LOG_TYPE_DEFAULT, "%s audioStreamWithRequest succeeded ? %{public}@, error - %{public}@", buf, 0x20u);

      v7 = (os_log_t *)MEMORY[0x1E0D18F48];
    }
    v55 = v64 != 0;
    if (v64)
    {
      -[CSSpeechController setAudioStream:](self, "setAudioStream:", v64);
      -[NSObject setDelegate:](v64, "setDelegate:", self);
LABEL_81:

      goto LABEL_82;
    }
    v78 = *v7;
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
    {
      v89 = v78;
      objc_msgSend(v61, "localizedDescription");
      v90 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v100 = "-[CSSpeechController prepareRecordWithSettings:error:]";
      v101 = 2114;
      v102 = v90;
      _os_log_error_impl(&dword_1C2614000, v89, OS_LOG_TYPE_ERROR, "%s Failed to get audioStream : %{public}@", buf, 0x16u);

    }
    v79 = v61;

    v41 = v79;
LABEL_80:
    v7 = (os_log_t *)MEMORY[0x1E0D18F48];
    goto LABEL_81;
  }
  v57 = (void *)MEMORY[0x1E0D19058];
  -[CSSpeechController audioRecordContext](self, "audioRecordContext");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "defaultRequestWithContext:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v59, "setClientIdentity:", 1);
  objc_msgSend(v59, "setRequestSkipClientMonitorUpdate:", v48);
  objc_msgSend(v59, "setRequestRecordModeLock:", 1);
  objc_msgSend(v59, "setRequestListeningMicIndicatorLock:", 1);
  -[CSSpeechController audioStream](self, "audioStream");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = 0;
  v55 = objc_msgSend(v60, "prepareAudioStreamSyncWithRequest:error:", v59, &v94);
  v61 = v94;

  v62 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v55)
      v63 = CFSTR("YES");
    else
      v63 = CFSTR("NO");
    v64 = v62;
    objc_msgSend(v61, "localizedDescription");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v100 = "-[CSSpeechController prepareRecordWithSettings:error:]";
    v101 = 2114;
    v102 = v63;
    v9 = &off_1C276C000;
    v103 = 2114;
    v104 = v65;
    _os_log_impl(&dword_1C2614000, v64, OS_LOG_TYPE_DEFAULT, "%s Prepare audio stream succeeded ? %{public}@, error - %{public}@", buf, 0x20u);

    goto LABEL_80;
  }
LABEL_82:

LABEL_83:
  a4 = v91;
LABEL_84:
  -[CSSpeechController streamProvider](self, "streamProvider");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isNarrowBand = objc_msgSend(v80, "isNarrowBand");

  if (self->_isNarrowBand)
    -[CSSpeechController _setupDownsamplerIfNeeded](self, "_setupDownsamplerIfNeeded");
  if (v6)
  {
    -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_asrOnDevice"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v81, "BOOLValue");

    if (!v55)
    {
LABEL_93:
      v84 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v100 = "-[CSSpeechController prepareRecordWithSettings:error:]";
        _os_log_impl(&dword_1C2614000, v84, OS_LOG_TYPE_DEFAULT, "%s Skipping audio converter setup", buf, 0xCu);
      }
      goto LABEL_95;
    }
  }
  else
  {
    v82 = 0;
    if (!v55)
      goto LABEL_93;
  }
  if ((v82 & 1) != 0)
    goto LABEL_93;
  v55 = 1;
  if (!-[CSSpeechController _setupAudioConverter:isNarrowBand:](self, "_setupAudioConverter:isNarrowBand:", 1, self->_isNarrowBand))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1551, 0);
    v83 = objc_claimAutoreleasedReturnValue();

    v55 = 0;
    v41 = (id)v83;
  }
LABEL_95:
  kdebug_trace();
  if (a4)
    *a4 = objc_retainAutorelease(v41);
  if (v55)
  {
    queue = self->_queue;
    v92[0] = MEMORY[0x1E0C809B0];
    v92[1] = 3221225472;
    v92[2] = __54__CSSpeechController_prepareRecordWithSettings_error___block_invoke_165;
    v92[3] = &unk_1E7C292C8;
    v92[4] = self;
    dispatch_async(queue, v92);
  }
  v86 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    v87 = CFSTR("NO");
    if (v55)
      v87 = CFSTR("YES");
    *(_DWORD *)buf = *((_QWORD *)v9 + 246);
    v100 = "-[CSSpeechController prepareRecordWithSettings:error:]";
    v101 = 2114;
    v102 = v87;
    _os_log_impl(&dword_1C2614000, v86, OS_LOG_TYPE_DEFAULT, "%s Done prepareRecord with result: %{public}@.", buf, 0x16u);
  }

  return v55;
}

- (BOOL)_fetchLastTriggerInfo
{
  void *v3;
  NSObject *queue;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[CSSpeechController xpcClient](self, "xpcClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__CSSpeechController__fetchLastTriggerInfo__block_invoke;
    block[3] = &unk_1E7C292C8;
    block[4] = self;
    dispatch_async(queue, block);
  }
  else
  {
    v5 = *MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CSSpeechController _fetchLastTriggerInfo]";
      _os_log_error_impl(&dword_1C2614000, v5, OS_LOG_TYPE_ERROR, "%s xpcClient not existing", buf, 0xCu);
    }
  }
  return v3 != 0;
}

- (BOOL)_isDelayedDuckingSupportedContext
{
  if ((-[CSAudioRecordContext isVoiceTriggered](self->_audioRecordContext, "isVoiceTriggered") & 1) != 0
    || (-[CSAudioRecordContext isServerInvoked](self->_audioRecordContext, "isServerInvoked") & 1) != 0
    || (-[CSAudioRecordContext isHomePressed](self->_audioRecordContext, "isHomePressed") & 1) != 0)
  {
    return 1;
  }
  else
  {
    return -[CSAudioRecordContext isTVRemote](self->_audioRecordContext, "isTVRemote");
  }
}

- (BOOL)_currentConfigurationSupportsDucking
{
  void *v3;
  void *v4;
  int v5;
  id v6;
  os_log_t *v7;
  NSObject *v8;
  os_log_t v9;
  NSObject *v10;
  NSObject *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[CSSpeechController streamProvider](self, "streamProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CSSpeechController streamProvider](self, "streamProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v5 = objc_msgSend(v4, "supportsDuckingOnCurrentRouteWithError:", &v14);
    v6 = v14;

    v7 = (os_log_t *)MEMORY[0x1E0D18F48];
    v8 = *MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[CSSpeechController _currentConfigurationSupportsDucking]";
      v17 = 1026;
      LODWORD(v18) = v5;
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s ConfigSupportsDucking: %{public}d", buf, 0x12u);
    }
    if (v6)
    {
      v9 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
      {
        v12 = v9;
        objc_msgSend(v6, "localizedDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v16 = "-[CSSpeechController _currentConfigurationSupportsDucking]";
        v17 = 2112;
        v18 = v13;
        _os_log_error_impl(&dword_1C2614000, v12, OS_LOG_TYPE_ERROR, "%s Failed due to error %@.", buf, 0x16u);

      }
    }
  }
  else
  {
    v10 = *MEMORY[0x1E0D18F48];
    LOBYTE(v5) = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[CSSpeechController _currentConfigurationSupportsDucking]";
      _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s Stream provider does not exist", buf, 0xCu);
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)_activateAudioSessionWithReason:(unint64_t)a3 delay:(double)a4 delayRequested:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  uint64_t v12;
  void (**v13)(_QWORD);
  void (**v14)(_QWORD);
  unsigned int (**supportsDuckingOnSpeakerOutputEvaluator)(void);
  NSObject *v16;
  _BOOL4 v17;
  int v18;
  void (**v19)(_QWORD);
  NSObject *v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  NSObject *v25;
  CSEndpointerProxy *endpointerProxy;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  NSObject *v31;
  BOOL v32;
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[8];
  _QWORD v37[8];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  double v51;
  __int16 v52;
  double v53;
  uint64_t v54;

  v7 = a5;
  v54 = *MEMORY[0x1E0C80C00];
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__7979;
  v42 = __Block_byref_object_dispose__7980;
  v43 = 0;
  v12 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __81__CSSpeechController__activateAudioSessionWithReason_delay_delayRequested_error___block_invoke;
  v37[3] = &unk_1E7C27F30;
  v37[4] = self;
  v37[5] = &v44;
  v37[6] = &v38;
  v37[7] = a3;
  v13 = (void (**)(_QWORD))MEMORY[0x1C3BC4734](v37);
  v36[0] = v12;
  v36[1] = 3221225472;
  v36[2] = __81__CSSpeechController__activateAudioSessionWithReason_delay_delayRequested_error___block_invoke_167;
  v36[3] = &unk_1E7C27F30;
  v36[4] = self;
  v36[5] = &v44;
  v36[6] = &v38;
  v36[7] = a3;
  v14 = (void (**)(_QWORD))MEMORY[0x1C3BC4734](v36);
  if (!self->_supportSessionActivateDelay)
  {
    v13[2](v13);
    goto LABEL_24;
  }
  supportsDuckingOnSpeakerOutputEvaluator = (unsigned int (**)(void))self->_supportsDuckingOnSpeakerOutputEvaluator;
  if (supportsDuckingOnSpeakerOutputEvaluator && supportsDuckingOnSpeakerOutputEvaluator[2]())
  {
    v16 = *MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v49 = "-[CSSpeechController _activateAudioSessionWithReason:delay:delayRequested:error:]";
      _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_DEFAULT, "%s Device supports ducking on speaker output we should check config.", buf, 0xCu);
    }
    v17 = -[CSSpeechController _currentConfigurationSupportsDucking](self, "_currentConfigurationSupportsDucking");
  }
  else
  {
    v17 = 1;
  }
  v18 = -[CSSpeechController _isDelayedDuckingSupportedContext](self, "_isDelayedDuckingSupportedContext") && v17;
  v19 = v13;
  if (v18 != 1)
    goto LABEL_23;
  if (a4 <= -1.0)
  {
LABEL_18:
    *((_BYTE *)v45 + 24) = 1;
    goto LABEL_24;
  }
  if (a4 <= 0.0)
  {
    if (v7)
      v19 = v14;
    else
      v19 = v13;
LABEL_23:
    ((void (*)(void))v19[2])();
    goto LABEL_24;
  }
  dispatch_async_and_wait((dispatch_queue_t)self->_queue, &__block_literal_global_170);
  v20 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v49 = "-[CSSpeechController _activateAudioSessionWithReason:delay:delayRequested:error:]";
    _os_log_impl(&dword_1C2614000, v20, OS_LOG_TYPE_DEFAULT, "%s StreamProvider is already recording", buf, 0xCu);
  }
  -[NSDictionary objectForKeyedSubscript:](self->_lastVoiceTriggerInfo, "objectForKeyedSubscript:", *MEMORY[0x1E0D19728]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "unsignedLongLongValue");

  objc_msgSend(MEMORY[0x1E0D19118], "hostTimeToTimeInterval:", mach_absolute_time() - v22);
  v24 = v23;
  v25 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v49 = "-[CSSpeechController _activateAudioSessionWithReason:delay:delayRequested:error:]";
    v50 = 2050;
    v51 = a4;
    v52 = 2050;
    v53 = v24;
    _os_log_impl(&dword_1C2614000, v25, OS_LOG_TYPE_DEFAULT, "%s duckingDelayedTime = %{public}f, timeIntervalSinceLastTriggerEnd = %{public}lf", buf, 0x20u);
  }
  if (v24 < a4)
  {
    endpointerProxy = self->_endpointerProxy;
    +[CSAssetManager sharedManager](CSAssetManager, "sharedManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "currentLanguageCode");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSEndpointerProxy logHybridEndpointFeaturesWithEvent:locale:](endpointerProxy, "logHybridEndpointFeaturesWithEvent:locale:", CFSTR("com.apple.corespeech.ducking"), v28);

    NSStringFromSelector(a2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = a4 - v24;
    v35[0] = v12;
    v35[1] = 3221225472;
    v35[2] = __81__CSSpeechController__activateAudioSessionWithReason_delay_delayRequested_error___block_invoke_175;
    v35[3] = &unk_1E7C27608;
    v35[4] = self;
    v34[0] = v12;
    v34[1] = 3221225472;
    v34[2] = __81__CSSpeechController__activateAudioSessionWithReason_delay_delayRequested_error___block_invoke_2;
    v34[3] = &__block_descriptor_40_e20_v20__0B8__NSError_12l;
    *(double *)&v34[4] = v30;
    -[CSSpeechController _scheduleActivateAudioSessionWithDelay:sessionActivateReason:scheduleReason:validator:completion:](self, "_scheduleActivateAudioSessionWithDelay:sessionActivateReason:scheduleReason:validator:completion:", a3, v29, v35, v34, v30);

    v31 = *MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v49 = "-[CSSpeechController _activateAudioSessionWithReason:delay:delayRequested:error:]";
      v50 = 2050;
      v51 = v30;
      _os_log_impl(&dword_1C2614000, v31, OS_LOG_TYPE_DEFAULT, "%s Scheduled activateAudioSession with %{public}f seconds delay in prepareRecordWithSettings.", buf, 0x16u);
    }
    goto LABEL_18;
  }
  v14[2](v14);
LABEL_24:
  if (a6)
    *a6 = objc_retainAutorelease((id)v39[5]);
  v32 = *((_BYTE *)v45 + 24) != 0;

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);
  return v32;
}

- (void)_scheduleActivateAudioSessionWithDelay:(double)a3 sessionActivateReason:(unint64_t)a4 scheduleReason:(id)a5 validator:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id pendingAudioSessionActivationCompletion;
  dispatch_time_t v18;
  NSObject *queue;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  double v28;
  unint64_t v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  double v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a6;
  v14 = a7;
  -[CSSpeechController _cancelPendingAudioSessionActivateForReason:](self, "_cancelPendingAudioSessionActivateForReason:", v12);
  v15 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  objc_storeStrong((id *)&self->_pendingAudioSessionActivationToken, v15);
  self->_pendingAudioSessionActivationReason = a4;
  v16 = (void *)objc_msgSend(v14, "copy");

  pendingAudioSessionActivationCompletion = self->_pendingAudioSessionActivationCompletion;
  self->_pendingAudioSessionActivationCompletion = v16;

  v18 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  queue = self->_queue;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __119__CSSpeechController__scheduleActivateAudioSessionWithDelay_sessionActivateReason_scheduleReason_validator_completion___block_invoke;
  v24[3] = &unk_1E7C26B08;
  v24[4] = self;
  v20 = v15;
  v25 = v20;
  v28 = a3;
  v21 = v12;
  v26 = v21;
  v22 = v13;
  v27 = v22;
  v29 = a4;
  dispatch_after(v18, queue, v24);
  v23 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v31 = "-[CSSpeechController _scheduleActivateAudioSessionWithDelay:sessionActivateReason:scheduleReason:validator:completion:]";
    v32 = 2114;
    v33 = v20;
    v34 = 2050;
    v35 = a3;
    v36 = 2114;
    v37 = v21;
    _os_log_impl(&dword_1C2614000, v23, OS_LOG_TYPE_DEFAULT, "%s Delayed active audio session: Scheduled new token %{public}@ with %{public}f seconds delay for reason %{public}@.", buf, 0x2Au);
  }

}

- (void)_cancelPendingAudioSessionActivateForReason:(id)a3
{
  id v4;
  NSUUID *pendingAudioSessionActivationToken;
  NSObject *v6;
  id pendingAudioSessionActivationCompletion;
  id v8;
  int v9;
  const char *v10;
  __int16 v11;
  NSUUID *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  pendingAudioSessionActivationToken = self->_pendingAudioSessionActivationToken;
  if (pendingAudioSessionActivationToken)
  {
    v6 = *MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315650;
      v10 = "-[CSSpeechController _cancelPendingAudioSessionActivateForReason:]";
      v11 = 2114;
      v12 = pendingAudioSessionActivationToken;
      v13 = 2114;
      v14 = v4;
      _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Delayed audio session activate: Cancelled token %{public}@ for reason %{public}@.", (uint8_t *)&v9, 0x20u);
      pendingAudioSessionActivationToken = self->_pendingAudioSessionActivationToken;
    }
    self->_pendingAudioSessionActivationToken = 0;

    self->_pendingAudioSessionActivationReason = 0;
  }
  pendingAudioSessionActivationCompletion = self->_pendingAudioSessionActivationCompletion;
  if (pendingAudioSessionActivationCompletion)
  {
    (*((void (**)(id, _QWORD, _QWORD))pendingAudioSessionActivationCompletion + 2))(pendingAudioSessionActivationCompletion, 0, 0);
    v8 = self->_pendingAudioSessionActivationCompletion;
    self->_pendingAudioSessionActivationCompletion = 0;

  }
}

- (void)_performPendingAudioSessionActivateForReason:(id)a3
{
  NSUUID *v4;
  NSUUID *pendingAudioSessionActivationToken;
  os_log_t *v6;
  NSObject *v7;
  unint64_t pendingAudioSessionActivationReason;
  NSObject *v9;
  _BOOL8 v10;
  NSUUID *v11;
  NSUUID *v12;
  NSObject *v13;
  void (**pendingAudioSessionActivationCompletion)(id, _BOOL8, void *);
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  NSUUID *v20;
  __int16 v21;
  NSUUID *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (NSUUID *)a3;
  pendingAudioSessionActivationToken = self->_pendingAudioSessionActivationToken;
  if (pendingAudioSessionActivationToken)
  {
    v6 = (os_log_t *)MEMORY[0x1E0D18F48];
    v7 = *MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v18 = "-[CSSpeechController _performPendingAudioSessionActivateForReason:]";
      v19 = 2114;
      v20 = pendingAudioSessionActivationToken;
      v21 = 2114;
      v22 = v4;
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Delayed audio session activate: Consumed token %{public}@ in advance for reason %{public}@.", buf, 0x20u);
      pendingAudioSessionActivationToken = self->_pendingAudioSessionActivationToken;
    }
    self->_pendingAudioSessionActivationToken = 0;

    pendingAudioSessionActivationReason = self->_pendingAudioSessionActivationReason;
    self->_pendingAudioSessionActivationReason = 0;
    v9 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[CSSpeechController _performPendingAudioSessionActivateForReason:]";
      v19 = 2114;
      v20 = v4;
      _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Delayed audio session activate: Activating audio session for reason %{public}@.", buf, 0x16u);
    }
    v16 = 0;
    v10 = -[CSSpeechController _activateAudioSessionWithReason:error:](self, "_activateAudioSessionWithReason:error:", pendingAudioSessionActivationReason, &v16);
    v11 = (NSUUID *)v16;
    v12 = v11;
    v13 = *v6;
    if (!v10 || v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v18 = "-[CSSpeechController _performPendingAudioSessionActivateForReason:]";
        v19 = 2114;
        v20 = v4;
        v21 = 2112;
        v22 = v12;
        _os_log_error_impl(&dword_1C2614000, v13, OS_LOG_TYPE_ERROR, "%s Delayed audio session activate: Failed to activate audio session for reason %{public}@ due to error %@.", buf, 0x20u);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[CSSpeechController _performPendingAudioSessionActivateForReason:]";
      v19 = 2114;
      v20 = v4;
      _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, "%s Delayed audio session activate: Successfully activate audio session for reason %{public}@.", buf, 0x16u);
    }
    pendingAudioSessionActivationCompletion = (void (**)(id, _BOOL8, void *))self->_pendingAudioSessionActivationCompletion;
    if (pendingAudioSessionActivationCompletion)
    {
      pendingAudioSessionActivationCompletion[2](pendingAudioSessionActivationCompletion, v10, v12);
      v15 = self->_pendingAudioSessionActivationCompletion;
      self->_pendingAudioSessionActivationCompletion = 0;

    }
  }

}

- (BOOL)_activateAudioSessionWithReason:(unint64_t)a3 error:(id *)a4
{
  void *v7;

  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSpeechController _cancelPendingAudioSessionActivateForReason:](self, "_cancelPendingAudioSessionActivateForReason:", v7);

  return -[CSSpeechController _doActivateAudioSessionWithReason:error:](self, "_doActivateAudioSessionWithReason:error:", a3, a4);
}

- (BOOL)_doActivateAudioSessionWithReason:(unint64_t)a3 error:(id *)a4
{
  os_log_t *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSString *bundleIdFromDictation;
  int v13;
  id v14;
  NSObject *v15;
  const __CFString *v16;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = (os_log_t *)MEMORY[0x1E0D18F48];
  v8 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[CSSpeechController _doActivateAudioSessionWithReason:error:]";
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Activating audio session now", buf, 0xCu);
  }
  -[CSSpeechController sessionProvider](self, "sessionProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (-[CSAudioRecordContext isDictation](self->_audioRecordContext, "isDictation"))
      v10 = 2;
    else
      v10 = 1;
    if (a3 == 3)
    {
      if (self->_isSiriClientListening)
        a3 = 4;
      else
        a3 = 3;
    }
    -[CSSpeechController sessionProvider](self, "sessionProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    bundleIdFromDictation = self->_bundleIdFromDictation;
    v19 = 0;
    v13 = objc_msgSend(v11, "activateAudioSessionWithReason:dynamicAttribute:bundleID:error:", a3, v10, bundleIdFromDictation, &v19);
    v14 = v19;

    v15 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      v16 = CFSTR("NO");
      if (v13)
        v16 = CFSTR("YES");
      *(_DWORD *)buf = 136315394;
      v21 = "-[CSSpeechController _doActivateAudioSessionWithReason:error:]";
      v22 = 2114;
      v23 = v16;
      _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_DEFAULT, "%s AudioSession activated successfully ? %{public}@", buf, 0x16u);
    }
    if (a4)
LABEL_16:
      *a4 = objc_retainAutorelease(v14);
  }
  else
  {
    v18 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[CSSpeechController _doActivateAudioSessionWithReason:error:]";
      _os_log_error_impl(&dword_1C2614000, v18, OS_LOG_TYPE_ERROR, "%s AudioSession Provider not available", buf, 0xCu);
    }
    LOBYTE(v13) = 0;
    v14 = 0;
    if (a4)
      goto LABEL_16;
  }

  return v13;
}

- (void)_updateRecordContextIfNeeded:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSUUID *endpointId;
  int v9;
  const char *v10;
  __int16 v11;
  NSUUID *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_endpointId && (objc_msgSend(v4, "isAudioRecordTypeSupportedByRemora") & 1) == 0)
  {
    v6 = *MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_FAULT))
    {
      endpointId = self->_endpointId;
      v9 = 136315395;
      v10 = "-[CSSpeechController _updateRecordContextIfNeeded:]";
      v11 = 2113;
      v12 = endpointId;
      _os_log_fault_impl(&dword_1C2614000, v6, OS_LOG_TYPE_FAULT, "%s Falling back to button record type for context whose record type previously is set to unspecified for accessory %{private}@.", (uint8_t *)&v9, 0x16u);
    }
    objc_msgSend(v5, "setType:", 18);
    -[NSUUID UUIDString](self->_endpointId, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDeviceId:", v7);

  }
}

- (BOOL)setCurrentRecordContext:(id)a3 error:(id *)a4
{
  id v6;
  os_log_t *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *queue;
  id v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  BOOL v20;
  void *v21;
  void *v22;
  char v23;
  NSObject *contextResetQueue;
  NSObject *v25;
  _QWORD v27[5];
  id v28;
  _BYTE *v29;
  _QWORD v30[5];
  id v31;
  _BYTE *v32;
  id v33;
  _QWORD block[5];
  id v35;
  uint8_t v36[4];
  const char *v37;
  _BYTE buf[24];
  char v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (os_log_t *)MEMORY[0x1E0D18F48];
  v8 = (void *)*MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    objc_msgSend(v6, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[CSSpeechController setCurrentRecordContext:error:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v10;
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s recordContext : %{public}@", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v39 = 0;
  if (objc_msgSend(MEMORY[0x1E0D19260], "supportHomeKitAccessory"))
    -[CSSpeechController _updateRecordContextIfNeeded:](self, "_updateRecordContextIfNeeded:", v6);
  v11 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__CSSpeechController_setCurrentRecordContext_error___block_invoke;
  block[3] = &unk_1E7C292A0;
  block[4] = self;
  v13 = v6;
  v35 = v13;
  dispatch_async_and_wait(queue, block);
  if (objc_msgSend(v13, "isTriggeredFromHearst"))
  {
    objc_msgSend(v13, "deviceId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 == 0;

    if (v15)
    {
      +[CSOpportuneSpeakListenerDeviceManager sharedManager](CSOpportuneSpeakListenerDeviceManager, "sharedManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "deviceId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setDeviceId:", v17);

    }
  }
  if (objc_msgSend(v13, "type") != 14 || !objc_msgSend(v13, "isRequestDuringActiveCall"))
  {
    if (objc_msgSend(v13, "type") == 14 || objc_msgSend(v13, "type") == 5)
    {
      -[CSSpeechController streamProvider](self, "streamProvider");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        -[CSSpeechController streamProvider](self, "streamProvider");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0;
        v23 = objc_msgSend(v22, "setCurrentContext:error:", v13, &v33);
        v19 = v33;
        *(_BYTE *)(*(_QWORD *)&buf[8] + 24) = v23;

        if (!a4)
          goto LABEL_22;
        goto LABEL_21;
      }
      contextResetQueue = self->_contextResetQueue;
      v30[0] = v11;
      v30[1] = 3221225472;
      v30[2] = __52__CSSpeechController_setCurrentRecordContext_error___block_invoke_179;
      v30[3] = &unk_1E7C277D0;
      v32 = buf;
      v30[4] = self;
      v31 = v13;
      dispatch_async_and_wait(contextResetQueue, v30);

    }
    else
    {
      v25 = self->_contextResetQueue;
      v27[0] = v11;
      v27[1] = 3221225472;
      v27[2] = __52__CSSpeechController_setCurrentRecordContext_error___block_invoke_2;
      v27[3] = &unk_1E7C277D0;
      v29 = buf;
      v27[4] = self;
      v28 = v13;
      dispatch_async_and_wait(v25, v27);

    }
    v19 = 0;
    if (!a4)
    {
LABEL_22:
      v20 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
      goto LABEL_23;
    }
LABEL_21:
    *a4 = objc_retainAutorelease(v19);
    goto LABEL_22;
  }
  v18 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v36 = 136315138;
    v37 = "-[CSSpeechController setCurrentRecordContext:error:]";
    _os_log_impl(&dword_1C2614000, v18, OS_LOG_TYPE_DEFAULT, "%s Will skip setting current record context because we were in active call and context was post or auto", v36, 0xCu);
  }
  v19 = 0;
  v20 = 1;
LABEL_23:

  _Block_object_dispose(buf, 8);
  return v20;
}

- (void)preheat
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[CSSpeechController preheat]";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v3, 0xCu);
  }
}

- (BOOL)prewarmAudioSession
{
  NSObject *v3;
  void *v4;
  char v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[CSSpeechController prewarmAudioSession]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }
  -[CSSpeechController sessionProvider](self, "sessionProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "prewarmAudioSessionWithError:", 0);

  return v5;
}

- (void)resetAudioSession
{
  NSObject *v3;
  NSObject *contextResetQueue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CSSpeechController resetAudioSession]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  contextResetQueue = self->_contextResetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__CSSpeechController_resetAudioSession__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(contextResetQueue, block);
}

- (void)reset
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[CSSpeechController reset]";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Resetting CoreSpeech frameworks", (uint8_t *)&v3, 0xCu);
  }
}

- (void)releaseAudioSession
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[CSSpeechController releaseAudioSession]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  -[CSSpeechController sessionProvider](self, "sessionProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CSSpeechController sessionProvider](self, "sessionProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deactivateAudioSession:error:", 0, 0);
  }
  else
  {
    -[CSSpeechController _fetchFallbackAudioSessionReleaseProviding](self, "_fetchFallbackAudioSessionReleaseProviding");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fallbackDeactivateAudioSession:error:", 0, 0);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CSSpeechController_releaseAudioSession__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)releaseAudioSession:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[CSSpeechController releaseAudioSession:]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  -[CSSpeechController sessionProvider](self, "sessionProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CSSpeechController sessionProvider](self, "sessionProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deactivateAudioSession:error:", a3, 0);
  }
  else
  {
    -[CSSpeechController _fetchFallbackAudioSessionReleaseProviding](self, "_fetchFallbackAudioSessionReleaseProviding");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fallbackDeactivateAudioSession:error:", a3, 0);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CSSpeechController_releaseAudioSession___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)recordSettings
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  _BOOL8 v21;
  void *v22;
  _QWORD v24[6];
  _QWORD v25[6];
  _QWORD v26[6];
  _QWORD v27[7];

  v27[6] = *MEMORY[0x1E0C80C00];
  if (-[CSSpeechController _isHubRequestTV](self, "_isHubRequestTV") && (CSIsTorpedo() & 1) == 0)
  {
    -[CSSpeechController streamProvider](self, "streamProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recordSettings");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = *MEMORY[0x1E0C898E0];
    if (self->_isNarrowBand)
    {
      v27[0] = &unk_1E7C638D8;
      v4 = *MEMORY[0x1E0C89970];
      v26[0] = v3;
      v26[1] = v4;
      v5 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRateNarrowBand");
      objc_msgSend(v5, "numberWithFloat:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = v6;
      v26[2] = *MEMORY[0x1E0C898F0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleBitDepth"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *MEMORY[0x1E0C89910];
      v27[2] = v7;
      v27[3] = MEMORY[0x1E0C9AAA0];
      v9 = *MEMORY[0x1E0C89930];
      v26[3] = v8;
      v26[4] = v9;
      v26[5] = *MEMORY[0x1E0C89948];
      v10 = *MEMORY[0x1E0C89958];
      v27[4] = &unk_1E7C638F0;
      v27[5] = v10;
      v11 = (void *)MEMORY[0x1E0C99D80];
      v12 = v27;
      v13 = v26;
    }
    else
    {
      v25[0] = &unk_1E7C638D8;
      v14 = *MEMORY[0x1E0C89970];
      v24[0] = v3;
      v24[1] = v14;
      v15 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
      objc_msgSend(v15, "numberWithFloat:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v25[1] = v6;
      v24[2] = *MEMORY[0x1E0C898F0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleBitDepth"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *MEMORY[0x1E0C89910];
      v25[2] = v7;
      v25[3] = MEMORY[0x1E0C9AAA0];
      v17 = *MEMORY[0x1E0C89930];
      v24[3] = v16;
      v24[4] = v17;
      v24[5] = *MEMORY[0x1E0C89948];
      v18 = *MEMORY[0x1E0C89958];
      v25[4] = &unk_1E7C638F0;
      v25[5] = v18;
      v11 = (void *)MEMORY[0x1E0C99D80];
      v12 = v25;
      v13 = v24;
    }
    objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, 6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (self->_supportPhatic)
  {
    v20 = (id)objc_msgSend(v19, "mutableCopy");
    v21 = self->_isMediaPlaying || self->_isTimerPlaying || self->_isAlarmPlaying;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v22, CFSTR("CSSpeechRecordSettingsKey_isDucking"));

  }
  else
  {
    v20 = v19;
  }

  return v20;
}

- (AudioStreamBasicDescription)getLPCMAudioStreamBasicDescription
{
  if (CSIsOSX())
  {
    if (self->_isNarrowBand)
      return (AudioStreamBasicDescription *)objc_msgSend(MEMORY[0x1E0D190F8], "lpcmNarrowBandASBD");
    else
      return (AudioStreamBasicDescription *)objc_msgSend(MEMORY[0x1E0D190F8], "lpcmASBD");
  }
  else if (self->_isNarrowBand)
  {
    return (AudioStreamBasicDescription *)objc_msgSend(MEMORY[0x1E0D190F8], "lpcmInt16NarrowBandASBD");
  }
  else
  {
    return (AudioStreamBasicDescription *)objc_msgSend(MEMORY[0x1E0D190F8], "lpcmInt16ASBD");
  }
}

- (BOOL)setRecordBufferDuration:(double)a3
{
  return 1;
}

- (double)getRecordBufferDuration
{
  return 0.04;
}

- (void)setDuckOthersOption:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CSSpeechController sessionProvider](self, "sessionProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDuckOthersOption:", v3);

}

- (void)_refreshSpeakerRecognitionAssets
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[6];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  __int128 v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D19260], "supportsSpeakerRecognitionAssets"))
  {
    *(_QWORD *)&v16 = 0;
    *((_QWORD *)&v16 + 1) = &v16;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__7979;
    v19 = __Block_byref_object_dispose__7980;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x1E0D19260];
    -[NSUUID UUIDString](self->_endpointId, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "getSiriLanguageWithEndpointId:fallbackLanguage:", v4, CFSTR("en-US"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = *MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[CSSpeechController _refreshSpeakerRecognitionAssets]";
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s languageCode:%@", buf, 0x16u);
    }
    +[CSAssetManager sharedManager](CSAssetManager, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allInstalledAssetsOfType:language:", 3, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 40), "addObjectsFromArray:", v8);
    +[CSAssetManager sharedManager](CSAssetManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __54__CSSpeechController__refreshSpeakerRecognitionAssets__block_invoke;
    v11[3] = &unk_1E7C24F00;
    v11[4] = self;
    v11[5] = &v16;
    objc_msgSend(v9, "assetOfType:providerType:language:completion:", 3, 1, v5, v11);

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v10 = *MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v16) = 136315138;
      *(_QWORD *)((char *)&v16 + 4) = "-[CSSpeechController _refreshSpeakerRecognitionAssets]";
      _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s SpeakerRecognitionAssets not supported", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)_setupSpeakerRecognitionController
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  float v13;
  NSDictionary *lastVoiceTriggerInfo;
  void *v15;
  float v16;
  uint64_t v17;
  NSObject *v18;
  os_log_t *v19;
  NSObject *v20;
  NSObject *v21;
  const __CFString *v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  void *v26;
  NSDictionary *v27;
  double v28;
  void *v29;
  NSUUID *endpointId;
  void *v31;
  id v32;
  id v33;
  SSRSpeakerRecognitionController *v34;
  SSRSpeakerRecognitionController *speakerRecognitionController;
  os_log_t v36;
  NSObject *v37;
  __CFString *v38;
  const char *v39;
  os_log_t v40;
  id v41;
  id v42;
  _QWORD v43[5];
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  const __CFString *v47;
  __int16 v48;
  __CFString *v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  double v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if ((!objc_msgSend(MEMORY[0x1E0D19260], "isAttentiveSiriEnabled") || self->_endpointId)
    && CSIsCommunalDevice())
  {
    v3 = (void *)MEMORY[0x1E0D19260];
    -[NSUUID UUIDString](self->_endpointId, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "getSiriLanguageWithEndpointId:fallbackLanguage:", v4, CFSTR("en-US"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    +[CSVoiceTriggerAssetHandler sharedHandlerDisabledOnDeviceCompilation](CSVoiceTriggerAssetHandler, "sharedHandlerDisabledOnDeviceCompilation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUUID UUIDString](self->_endpointId, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __56__CSSpeechController__setupSpeakerRecognitionController__block_invoke;
    v43[3] = &unk_1E7C28D98;
    v43[4] = self;
    objc_msgSend(v6, "getVoiceTriggerAssetWithEndpointId:completion:", v7, v43);

    -[SSRVoiceProfileManager provisionedVoiceProfilesForAppDomain:withLocale:](self->_voiceProfileManager, "provisionedVoiceProfilesForAppDomain:withLocale:", *MEMORY[0x1E0DA8C70], v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8 || !objc_msgSend(v8, "count"))
    {
      v18 = *MEMORY[0x1E0D18F48];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v45 = "-[CSSpeechController _setupSpeakerRecognitionController]";
        v46 = 2114;
        v47 = v5;
        _os_log_impl(&dword_1C2614000, v18, OS_LOG_TYPE_DEFAULT, "%s Voice Profiles not present for %{public}@ - Bailing out", buf, 0x16u);
      }
      goto LABEL_39;
    }
    if (CSIsInternalBuild())
    {
      -[SSRVoiceProfileManager provisionedVoiceProfilesForAppDomain:withLocale:](self->_voiceProfileManager, "provisionedVoiceProfilesForAppDomain:withLocale:", *MEMORY[0x1E0DA8C78], v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v10);
        v11 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v11;
      }

    }
    v12 = -[CSAudioRecordContext isBuiltInVoiceTriggered](self->_audioRecordContext, "isBuiltInVoiceTriggered");
    v13 = 4.0;
    if (v12)
    {
      lastVoiceTriggerInfo = self->_lastVoiceTriggerInfo;
      if (lastVoiceTriggerInfo)
      {
        -[NSDictionary objectForKeyedSubscript:](lastVoiceTriggerInfo, "objectForKeyedSubscript:", *MEMORY[0x1E0D19738]);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "floatValue");
        v13 = v16 + 4.0;

      }
      v17 = 0;
    }
    else
    {
      v17 = 1;
    }
    v19 = (os_log_t *)MEMORY[0x1E0D18F48];
    v20 = *MEMORY[0x1E0D18F48];
    v21 = *MEMORY[0x1E0D18F48];
    if (!self->_ssrAssets)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v45 = "-[CSSpeechController _setupSpeakerRecognitionController]";
        _os_log_error_impl(&dword_1C2614000, v20, OS_LOG_TYPE_ERROR, "%s Unable to setup SSR due to missing ssr assets", buf, 0xCu);
      }
      goto LABEL_39;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      if (v12)
        v22 = CFSTR("VT");
      else
        v22 = CFSTR("BP");
      v23 = v20;
      v24 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 136316162;
      v45 = "-[CSSpeechController _setupSpeakerRecognitionController]";
      v46 = 2114;
      v47 = v22;
      v48 = 2114;
      v49 = v5;
      v50 = 2050;
      v51 = v24;
      v52 = 2050;
      v53 = v13;
      _os_log_impl(&dword_1C2614000, v23, OS_LOG_TYPE_DEFAULT, "%s Setting up SSR controller with {%{public}@, %{public}@, %{public}ldusers, %{public}fsecs}", buf, 0x34u);

    }
    v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKey:", v26, *MEMORY[0x1E0DA8C80]);

    objc_msgSend(v25, "setObject:forKey:", v5, *MEMORY[0x1E0DA8C50]);
    objc_msgSend(v25, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0DA8C88]);
    objc_msgSend(v25, "setObject:forKey:", v9, *MEMORY[0x1E0DA8C68]);
    if (self->_lastVoiceTriggerInfo)
      v27 = self->_lastVoiceTriggerInfo;
    else
      v27 = (NSDictionary *)MEMORY[0x1E0C9AA70];
    objc_msgSend(v25, "setObject:forKey:", v27, *MEMORY[0x1E0DA8C90]);
    *(float *)&v28 = v13;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKey:", v29, *MEMORY[0x1E0DA8C58]);

    objc_msgSend(v25, "setObject:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0DA8C60]);
    objc_msgSend(v25, "setObject:forKey:", self->_ssrAssets, *MEMORY[0x1E0DA8C38]);
    endpointId = self->_endpointId;
    if (endpointId)
      objc_msgSend(v25, "setObject:forKey:", endpointId, *MEMORY[0x1E0DA8C48]);
    v42 = 0;
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8C08]), "initWithVoiceRecognitionContext:error:", v25, &v42);
    v32 = v42;
    v33 = v32;
    if (!v31 || v32)
    {
      v40 = *v19;
      if (os_log_type_enabled(*v19, OS_LOG_TYPE_ERROR))
      {
        v37 = v40;
        objc_msgSend(v33, "localizedDescription");
        v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v45 = "-[CSSpeechController _setupSpeakerRecognitionController]";
        v46 = 2112;
        v47 = v38;
        v39 = "%s ERR: Failed to create SSR context with error %@";
        goto LABEL_42;
      }
    }
    else
    {
      v41 = 0;
      v34 = (SSRSpeakerRecognitionController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8C10]), "initWithContext:withDelegate:error:", v31, self, &v41);
      v33 = v41;
      speakerRecognitionController = self->_speakerRecognitionController;
      self->_speakerRecognitionController = v34;

      if (self->_speakerRecognitionController && !v33)
        goto LABEL_38;
      v36 = *v19;
      if (os_log_type_enabled(*v19, OS_LOG_TYPE_ERROR))
      {
        v37 = v36;
        objc_msgSend(v33, "localizedDescription");
        v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v45 = "-[CSSpeechController _setupSpeakerRecognitionController]";
        v46 = 2112;
        v47 = v38;
        v39 = "%s ERR: Failed to create SSR controller with error %@";
LABEL_42:
        _os_log_error_impl(&dword_1C2614000, v37, OS_LOG_TYPE_ERROR, v39, buf, 0x16u);

      }
    }

LABEL_38:
LABEL_39:

  }
}

- (id)_languageDetectorOptionFromSettings:(id)a3
{
  id v3;
  CSLanguageDetectorOption *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  CSLanguageDetectorOption *v8;
  void *v9;
  uint64_t v10;
  CSLanguageDetectorOption *v11;
  void *v12;
  uint64_t v13;
  CSLanguageDetectorOption *v14;
  void *v15;
  uint64_t v16;
  CSLanguageDetectorOption *v17;
  void *v18;
  uint64_t v19;
  CSLanguageDetectorOption *v20;
  void *v21;
  uint64_t v22;
  CSLanguageDetectorOption *v23;
  void *v24;
  uint64_t v25;
  CSLanguageDetectorOption *v26;
  void *v27;
  uint64_t v28;
  CSLanguageDetectorOption *v29;
  void *v30;
  uint64_t v31;
  CSLanguageDetectorOption *v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  _QWORD v40[4];
  id v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  _QWORD v46[4];
  CSLanguageDetectorOption *v47;
  id v48;
  _QWORD v49[4];
  CSLanguageDetectorOption *v50;
  id v51;
  _QWORD v52[4];
  CSLanguageDetectorOption *v53;
  id v54;
  _QWORD v55[4];
  CSLanguageDetectorOption *v56;
  id v57;
  _QWORD v58[4];
  CSLanguageDetectorOption *v59;
  id v60;
  _QWORD v61[4];
  CSLanguageDetectorOption *v62;
  id v63;
  _QWORD v64[4];
  CSLanguageDetectorOption *v65;
  id v66;
  _QWORD v67[4];
  CSLanguageDetectorOption *v68;
  id v69;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(CSLanguageDetectorOption);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_LanguageDetectorDictationLanguages"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_class();
    v7 = MEMORY[0x1E0C809B0];
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_2;
    v67[3] = &unk_1E7C292A0;
    v8 = v4;
    v68 = v8;
    v69 = v5;
    __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke(v5, v6, v67);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_LanguageDetectorCurrentKeyboard"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    v64[0] = v7;
    v64[1] = 3221225472;
    v64[2] = __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_3;
    v64[3] = &unk_1E7C292A0;
    v11 = v8;
    v65 = v11;
    v66 = v9;
    __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke(v9, v10, v64);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_LanguageDetectorWasLanguageToggled"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_class();
    v61[0] = v7;
    v61[1] = 3221225472;
    v61[2] = __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_4;
    v61[3] = &unk_1E7C292A0;
    v14 = v11;
    v62 = v14;
    v63 = v12;
    __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke(v12, v13, v61);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_LanguageDetectorMultilingualKeyboardLanguages"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_class();
    v58[0] = v7;
    v58[1] = 3221225472;
    v58[2] = __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_5;
    v58[3] = &unk_1E7C292A0;
    v17 = v14;
    v59 = v17;
    v60 = v15;
    __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke(v15, v16, v58);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_LanguageDetectorKeyboardConvoLanguagePriors"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_opt_class();
    v55[0] = v7;
    v55[1] = 3221225472;
    v55[2] = __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_6;
    v55[3] = &unk_1E7C292A0;
    v20 = v17;
    v56 = v20;
    v57 = v18;
    __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke(v18, v19, v55);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_LanguageDetectorKeyboardGlobalLanguagePriors"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_opt_class();
    v52[0] = v7;
    v52[1] = 3221225472;
    v52[2] = __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_7;
    v52[3] = &unk_1E7C292A0;
    v23 = v20;
    v53 = v23;
    v54 = v21;
    __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke(v21, v22, v52);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_LanguageDetectorPreviousMessageLanguage"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_opt_class();
    v49[0] = v7;
    v49[1] = 3221225472;
    v49[2] = __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_8;
    v49[3] = &unk_1E7C292A0;
    v26 = v23;
    v50 = v26;
    v51 = v24;
    __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke(v24, v25, v49);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_LanguageDetectorGlobalLastKeyboardUsed"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_opt_class();
    v46[0] = v7;
    v46[1] = 3221225472;
    v46[2] = __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_9;
    v46[3] = &unk_1E7C292A0;
    v29 = v26;
    v47 = v29;
    v48 = v27;
    __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke(v27, v28, v46);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_LanguageDetectorDictationLanguagePriors"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_opt_class();
    v43[0] = v7;
    v43[1] = 3221225472;
    v43[2] = __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_10;
    v43[3] = &unk_1E7C292A0;
    v32 = v29;
    v44 = v32;
    v45 = v30;
    __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke(v30, v31, v43);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_LanguageDetectorConversationalMessages"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = objc_opt_class();
    v40[0] = v7;
    v40[1] = 3221225472;
    v40[2] = __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_11;
    v40[3] = &unk_1E7C292A0;
    v35 = v32;
    v41 = v35;
    v42 = v33;
    v36 = v33;
    __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke(v36, v34, v40);
    v37 = v42;
    v38 = v35;

  }
  else
  {
    v38 = 0;
  }
  return v38;
}

- (BOOL)startRecordingWithSettings:(id)a3 error:(id *)a4
{
  id v6;
  os_log_t *v7;
  NSObject *v8;
  NSDictionary *speakerRecognitionScores;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  os_log_t v15;
  NSObject *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  NSObject *v20;
  float v21;
  void *v22;
  NSObject *v23;
  float v24;
  NSObject *queue;
  uint64_t v26;
  id v27;
  NSObject *v28;
  NSDictionary *lastVoiceTriggerInfo;
  NSObject *v30;
  id v31;
  uint64_t v32;
  double v33;
  void *v34;
  char isKindOfClass;
  void *v36;
  double v37;
  NSObject *v38;
  char v39;
  NSObject *v40;
  const char *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  NSString *v45;
  NSString *recordEventUUID;
  void *v47;
  void *v48;
  uint64_t v49;
  BOOL v50;
  _QWORD v52[7];
  char v53;
  char v54;
  _QWORD v55[5];
  id v56;
  _QWORD v57[6];
  _QWORD block[5];
  id v59;
  _BYTE *v60;
  uint8_t v61[4];
  const char *v62;
  __int16 v63;
  double v64;
  _BYTE buf[24];
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (os_log_t *)MEMORY[0x1E0D18F48];
  v8 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[CSSpeechController startRecordingWithSettings:error:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s settings : %{public}@", buf, 0x16u);
  }
  speakerRecognitionScores = self->_speakerRecognitionScores;
  self->_speakerRecognitionScores = 0;

  mach_absolute_time();
  kdebug_trace();
  v10 = *MEMORY[0x1E0C89A40];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C89A40]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = mach_absolute_time();
    objc_msgSend(v6, "objectForKey:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "unsignedLongLongValue");

    v15 = *v7;
    v16 = *v7;
    v17 = v12 - v14;
    if (v12 >= v14)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v22 = (void *)MEMORY[0x1E0D19118];
        v23 = v15;
        objc_msgSend(v22, "hostTimeToSeconds:", v17);
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[CSSpeechController startRecordingWithSettings:error:]";
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v24;
        _os_log_impl(&dword_1C2614000, v23, OS_LOG_TYPE_DEFAULT, "%s historical audio buffer Siri requested in seconds: %f", buf, 0x16u);

      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v18 = v14 - v12;
      v19 = (void *)MEMORY[0x1E0D19118];
      v20 = v15;
      objc_msgSend(v19, "hostTimeToSeconds:", v18);
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[CSSpeechController startRecordingWithSettings:error:]";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v21;
      _os_log_error_impl(&dword_1C2614000, v20, OS_LOG_TYPE_ERROR, "%s requestedAudioStartHostTime is greater than startRecordingRequestHostTime. TimeDiff in seconds :%f", buf, 0x16u);

    }
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v66 = __Block_byref_object_copy__7979;
  v67 = __Block_byref_object_dispose__7980;
  v68 = objc_alloc_init(MEMORY[0x1E0D19030]);
  queue = self->_queue;
  v26 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CSSpeechController_startRecordingWithSettings_error___block_invoke;
  block[3] = &unk_1E7C277D0;
  block[4] = self;
  v60 = buf;
  v27 = v6;
  v59 = v27;
  dispatch_async_and_wait(queue, block);
  v28 = self->_queue;
  v57[0] = v26;
  v57[1] = 3221225472;
  v57[2] = __55__CSSpeechController_startRecordingWithSettings_error___block_invoke_203;
  v57[3] = &unk_1E7C29228;
  v57[4] = self;
  v57[5] = buf;
  dispatch_async(v28, v57);
  -[CSContinuousVoiceTrigger resetWithAudioRecordContext:](self->_continuousVoiceTrigger, "resetWithAudioRecordContext:", self->_audioRecordContext);
  if (objc_msgSend(MEMORY[0x1E0D19260], "supportCSTwoShotDecision"))
  {
    if (-[CSAudioRecordContext isVoiceTriggered](self->_audioRecordContext, "isVoiceTriggered"))
    {
      lastVoiceTriggerInfo = self->_lastVoiceTriggerInfo;
LABEL_12:
      -[CSContinuousVoiceTrigger startDetectTwoShot:](self->_continuousVoiceTrigger, "startDetectTwoShot:", lastVoiceTriggerInfo);
      goto LABEL_16;
    }
    if (CSIsWatch()
      && -[CSAudioRecordContext isRTSTriggered](self->_audioRecordContext, "isRTSTriggered"))
    {
      lastVoiceTriggerInfo = 0;
      goto LABEL_12;
    }
  }
LABEL_16:
  v30 = self->_queue;
  v55[0] = v26;
  v55[1] = 3221225472;
  v55[2] = __55__CSSpeechController_startRecordingWithSettings_error___block_invoke_2;
  v55[3] = &unk_1E7C292A0;
  v55[4] = self;
  v31 = v27;
  v56 = v31;
  dispatch_async(v30, v55);
  v32 = 0;
  v33 = 0.0;
  if (v31 && self->_supportSessionActivateDelay)
  {
    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_AudioSessionActiveDelay"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_AudioSessionActiveDelay"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "doubleValue");
      v33 = v37;

      v38 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v61 = 136315394;
        v62 = "-[CSSpeechController startRecordingWithSettings:error:]";
        v63 = 2050;
        v64 = v33;
        _os_log_impl(&dword_1C2614000, v38, OS_LOG_TYPE_DEFAULT, "%s Ask delay audio session active by %{public}f seconds", v61, 0x16u);
      }
      v32 = 1;
    }
    else
    {
      v32 = 0;
    }
  }
  mach_absolute_time();
  kdebug_trace();
  if (-[CSAudioRecordContext isTVRemote](self->_audioRecordContext, "isTVRemote")
    && !objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "isAlertBehaviorOverridedBeep"))
  {
    v42 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v61 = 136315138;
      v62 = "-[CSSpeechController startRecordingWithSettings:error:]";
      _os_log_impl(&dword_1C2614000, v42, OS_LOG_TYPE_DEFAULT, "%s Postpone calling audio session activation til we receive didStart", v61, 0xCu);
    }
    v39 = 1;
  }
  else
  {
    if (!-[CSSpeechController _activateAudioSessionWithReason:delay:delayRequested:error:](self, "_activateAudioSessionWithReason:delay:delayRequested:error:", 2, v32, a4, v33))
    {
      v40 = *v7;
      if (!os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
      {
LABEL_35:
        v50 = 0;
        goto LABEL_36;
      }
      *(_DWORD *)v61 = 136315138;
      v62 = "-[CSSpeechController startRecordingWithSettings:error:]";
      v41 = "%s _activateAudoiSessionWithDelay has failed. startRecordWithSettings has failed";
LABEL_38:
      _os_log_error_impl(&dword_1C2614000, v40, OS_LOG_TYPE_ERROR, v41, v61, 0xCu);
      goto LABEL_35;
    }
    v39 = 0;
  }
  -[CSSpeechController audioStream](self, "audioStream");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v43)
  {
    v40 = *v7;
    if (!os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
      goto LABEL_35;
    *(_DWORD *)v61 = 136315138;
    v62 = "-[CSSpeechController startRecordingWithSettings:error:]";
    v41 = "%s audioStream not existing";
    goto LABEL_38;
  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "UUIDString");
  v45 = (NSString *)objc_claimAutoreleasedReturnValue();
  recordEventUUID = self->_recordEventUUID;
  self->_recordEventUUID = v45;

  objc_msgSend(MEMORY[0x1E0D191F0], "sharedInstance");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "notifyWillStartStreamWithContext:option:withEventUUID:", self->_audioRecordContext, *(_QWORD *)(*(_QWORD *)&buf[8] + 40), self->_recordEventUUID);

  -[CSSpeechController audioStream](self, "audioStream");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
  v52[0] = v26;
  v52[1] = 3221225472;
  v52[2] = __55__CSSpeechController_startRecordingWithSettings_error___block_invoke_210;
  v52[3] = &unk_1E7C24F50;
  v53 = v39;
  *(double *)&v52[6] = v33;
  v54 = v32;
  v52[4] = self;
  v52[5] = buf;
  objc_msgSend(v48, "startAudioStreamWithOption:completion:", v49, v52);

  v50 = 1;
LABEL_36:
  mach_absolute_time();
  kdebug_trace();
  mach_absolute_time();
  kdebug_trace();

  _Block_object_dispose(buf, 8);
  return v50;
}

- (void)_startFeedbackForTwoShotAtTime:(double)a3
{
  _BOOL4 isSiriClientListening;
  NSObject *v6;
  _BOOL4 v7;
  _BOOL4 twoShotNotificationEnabled;
  const __CFString *v9;
  id WeakRetained;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  double v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_isSoundPlaying
    && !-[CSSpeechController _canPlayTwoShotFeedbackDuringMediaPlayback](self, "_canPlayTwoShotFeedbackDuringMediaPlayback"))
  {
    v11 = *MEMORY[0x1E0D18F48];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
      return;
    v14 = 136315138;
    v15 = "-[CSSpeechController _startFeedbackForTwoShotAtTime:]";
    v12 = "%s Will not play two shot feedback for this request";
    v13 = v11;
LABEL_15:
    _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v14, 0xCu);
    return;
  }
  isSiriClientListening = self->_isSiriClientListening;
  v6 = *MEMORY[0x1E0D18F48];
  v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT);
  if (!isSiriClientListening)
  {
    if (!v7)
      return;
    v14 = 136315138;
    v15 = "-[CSSpeechController _startFeedbackForTwoShotAtTime:]";
    v12 = "%s Siri Client is no longer listening, don't play two shot feedback";
    v13 = v6;
    goto LABEL_15;
  }
  if (v7)
  {
    twoShotNotificationEnabled = self->_twoShotNotificationEnabled;
    v15 = "-[CSSpeechController _startFeedbackForTwoShotAtTime:]";
    v14 = 136315650;
    if (twoShotNotificationEnabled)
      v9 = CFSTR("Yes");
    else
      v9 = CFSTR("No");
    v16 = 2050;
    v17 = a3;
    v18 = 2114;
    v19 = v9;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Two shot is detected at time %{public}.3f, should notify? [%{public}@]", (uint8_t *)&v14, 0x20u);
  }
  if (self->_twoShotNotificationEnabled)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "speechControllerDidDetectVoiceTriggerTwoShot:atTime:wantsAudibleFeedback:", self, 1, a3);

  }
}

- (void)_scheduleAudibleFeedbackAtStartRecording
{
  float v3;
  dispatch_time_t v4;
  NSObject *audibleFeedbackQueue;
  _QWORD block[5];

  -[CSSpeechController _scheduledAudibleFeedbackDelay](self, "_scheduledAudibleFeedbackDelay");
  v4 = dispatch_time(0, (uint64_t)(float)(v3 * 1000000000.0));
  audibleFeedbackQueue = self->_audibleFeedbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__CSSpeechController__scheduleAudibleFeedbackAtStartRecording__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_after(v4, audibleFeedbackQueue, block);
}

- (void)_startPhaticDecision
{
  NSDictionary *lastVoiceTriggerInfo;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  os_log_t *v13;
  void *v14;
  unint64_t v15;
  NSObject *v16;
  double v17;
  double v18;
  double v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  dispatch_time_t v23;
  NSObject *audibleFeedbackQueue;
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[6];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  double v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (-[CSAudioRecordContext isVoiceTriggered](self->_audioRecordContext, "isVoiceTriggered"))
  {
    lastVoiceTriggerInfo = self->_lastVoiceTriggerInfo;
    if (lastVoiceTriggerInfo)
    {
      -[NSDictionary objectForKeyedSubscript:](lastVoiceTriggerInfo, "objectForKeyedSubscript:", *MEMORY[0x1E0D19728]);
      v4 = objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v5 = (void *)v4;
        v6 = *MEMORY[0x1E0D197A0];
        -[NSDictionary objectForKeyedSubscript:](self->_lastVoiceTriggerInfo, "objectForKeyedSubscript:", *MEMORY[0x1E0D197A0]);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          -[NSDictionary objectForKeyedSubscript:](self->_lastVoiceTriggerInfo, "objectForKeyedSubscript:", *MEMORY[0x1E0D19758]);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "unsignedLongLongValue");

          -[NSDictionary objectForKeyedSubscript:](self->_lastVoiceTriggerInfo, "objectForKeyedSubscript:", v6);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "doubleValue");
          v11 = CSMachAbsoluteTimeAddTimeInterval();

          v12 = mach_absolute_time();
          v13 = (os_log_t *)MEMORY[0x1E0D18F48];
          if (v12 <= v11)
          {
            v15 = v11;
          }
          else
          {
            v14 = (void *)*MEMORY[0x1E0D18F48];
            v15 = v12;
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
            {
              v16 = v14;
              CSMachAbsoluteTimeGetTimeInterval();
              *(_DWORD *)buf = 136315906;
              v30 = "-[CSSpeechController _startPhaticDecision]";
              v31 = 2050;
              v32 = v17;
              v33 = 2050;
              v34 = v11;
              v35 = 2050;
              v36 = v12;
              _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_DEFAULT, "%s Start recording invoked too late (%{public}.3f seconds), override scheduledCheckTime: %{public}llu to currentTime: %{public}llu", buf, 0x2Au);

              v15 = v12;
            }
          }
          CSMachAbsoluteTimeGetTimeInterval();
          v19 = v18;
          v20 = *v13;
          if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            v30 = "-[CSSpeechController _startPhaticDecision]";
            v31 = 2050;
            v32 = v19;
            v33 = 2050;
            v34 = v9;
            v35 = 2050;
            v36 = v12;
            _os_log_impl(&dword_1C2614000, v20, OS_LOG_TYPE_DEFAULT, "%s Scheduled audible feedback decision after %{public}.3fseconds (vtEndMachTime: %{public}llu currentMachTime: %{public}llu)", buf, 0x2Au);
          }
          v21 = MEMORY[0x1E0C809B0];
          v28[0] = MEMORY[0x1E0C809B0];
          v28[1] = 3221225472;
          v28[2] = __42__CSSpeechController__startPhaticDecision__block_invoke;
          v28[3] = &unk_1E7C29178;
          v28[4] = self;
          v28[5] = v15;
          v22 = (void *)MEMORY[0x1C3BC4734](v28);
          v23 = dispatch_time(0, (uint64_t)(v19 * 1000000000.0));
          audibleFeedbackQueue = self->_audibleFeedbackQueue;
          v26[0] = v21;
          v26[1] = 3221225472;
          v26[2] = __42__CSSpeechController__startPhaticDecision__block_invoke_235;
          v26[3] = &unk_1E7C29150;
          v26[4] = self;
          v27 = v22;
          v25 = v22;
          dispatch_after(v23, audibleFeedbackQueue, v26);

        }
      }
    }
  }
}

- (void)_createLanguageDetectorIfNeeded
{
  CSLanguageDetector *v3;
  CSLanguageDetector *languageDetector;

  if (!self->_languageDetector)
  {
    v3 = objc_alloc_init(CSLanguageDetector);
    languageDetector = self->_languageDetector;
    self->_languageDetector = v3;

  }
}

- (BOOL)_shouldUseLanguageDetector:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  uint64_t v10;
  BOOL v11;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_6;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_LanguageDetectorDictationLanguages"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_6;
  v6 = (void *)v5;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_LanguageDetectorDictationLanguages"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_6;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_LanguageDetectorDictationLanguages"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
    v11 = 1;
  else
LABEL_6:
    v11 = 0;

  return v11;
}

- (BOOL)_shouldSetStartSampleCount
{
  NSDictionary *lastVoiceTriggerInfo;
  void *v4;
  BOOL v5;
  NSDictionary *v6;
  void *v7;

  if ((-[CSAudioRecordContext isBuiltInVoiceTriggered](self->_audioRecordContext, "isBuiltInVoiceTriggered")&& (objc_msgSend(MEMORY[0x1E0D19260], "isLocalVoiceTriggerAvailable") & 1) != 0|| (-[CSAudioRecordContext isHearstVoiceTriggered](self->_audioRecordContext, "isHearstVoiceTriggered") & 1) != 0|| -[CSAudioRecordContext isJarvisVoiceTriggered](self->_audioRecordContext, "isJarvisVoiceTriggered"))&& (lastVoiceTriggerInfo = self->_lastVoiceTriggerInfo) != 0)
  {
    -[NSDictionary objectForKeyedSubscript:](lastVoiceTriggerInfo, "objectForKeyedSubscript:", *MEMORY[0x1E0D19788]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }
  if (-[CSAudioRecordContext isRemoraVoiceTriggered](self->_audioRecordContext, "isRemoraVoiceTriggered"))
  {
    v6 = self->_lastVoiceTriggerInfo;
    if (v6)
    {
      -[NSDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D19788]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        return 1;
    }
  }
  return v5;
}

- (BOOL)_shouldSetStartSampleCountForRTS
{
  NSDictionary *lastRTSTriggerInfo;
  void *v4;
  BOOL v5;

  if (!-[CSAudioRecordContext isRTSTriggered](self->_audioRecordContext, "isRTSTriggered"))
    return 0;
  lastRTSTriggerInfo = self->_lastRTSTriggerInfo;
  if (!lastRTSTriggerInfo)
    return 0;
  -[NSDictionary objectForKeyedSubscript:](lastRTSTriggerInfo, "objectForKeyedSubscript:", *MEMORY[0x1E0D193D8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)startRecording:(id *)a3
{
  return -[CSSpeechController startRecordingWithSettings:error:](self, "startRecordingWithSettings:error:", MEMORY[0x1E0C9AA70], a3);
}

- (void)stopRecording
{
  -[CSSpeechController handleStopRecordingRequestWithOptions:](self, "handleStopRecordingRequestWithOptions:", 0);
}

- (void)handleStopRecordingRequestWithOptions:(id)a3
{
  id v5;
  os_log_t *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *queue;
  _QWORD v14[5];
  _QWORD v15[5];
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (os_log_t *)MEMORY[0x1E0D18F48];
  v7 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[CSSpeechController handleStopRecordingRequestWithOptions:]";
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s options :%@", buf, 0x16u);
  }
  kdebug_trace();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSpeechController _cancelPendingAudioSessionActivateForReason:](self, "_cancelPendingAudioSessionActivateForReason:", v8);

  -[CSSpeechController audioStream](self, "audioStream");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D191F0], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "notifyWillStopStream:reason:withEventUUID:", 0, 0, self->_recordEventUUID);

    -[CSSpeechController audioStream](self, "audioStream");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __60__CSSpeechController_handleStopRecordingRequestWithOptions___block_invoke;
    v15[3] = &unk_1E7C29060;
    v15[4] = self;
    objc_msgSend(v11, "stopAudioStreamWithOption:completion:", v5, v15);

  }
  else
  {
    v12 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[CSSpeechController handleStopRecordingRequestWithOptions:]";
      _os_log_error_impl(&dword_1C2614000, v12, OS_LOG_TYPE_ERROR, "%s Asking stopRecording when audio stream is not existing", buf, 0xCu);
    }
    queue = self->_queue;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __60__CSSpeechController_handleStopRecordingRequestWithOptions___block_invoke_237;
    v14[3] = &unk_1E7C292C8;
    v14[4] = self;
    dispatch_async(queue, v14);
  }

}

- (void)stopRecordingWithOptions:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  CSSpeechController *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__CSSpeechController_stopRecordingWithOptions___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (BOOL)_shouldCalculateEstimatedSpeechEndHostTimeFromCachedEPMetrics
{
  int v3;

  v3 = objc_msgSend(MEMORY[0x1E0D19260], "isContinuousConversationSupported");
  if (v3)
    LOBYTE(v3) = -[CSAudioRecordContext isContinuousConversation](self->_audioRecordContext, "isContinuousConversation");
  return v3;
}

- (unint64_t)_calculateEstimatedSpeechEndHostTimeWithStopOptions:(id)a3
{
  id v4;
  void *v5;
  CSSpeechEndHostTimeEstimator *speechEndHostTimeEstimator;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  NSObject *v11;
  CSSpeechEndHostTimeEstimator *v12;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CSSpeechController _shouldCalculateEstimatedSpeechEndHostTimeFromCachedEPMetrics](self, "_shouldCalculateEstimatedSpeechEndHostTimeFromCachedEPMetrics"))
  {
    -[CSEndpointerProxy cachedEndpointerMetrics](self->_endpointerProxy, "cachedEndpointerMetrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    speechEndHostTimeEstimator = self->_speechEndHostTimeEstimator;
    objc_msgSend(v5, "trailingSilenceDurationAtEndpoint");
    -[CSSpeechEndHostTimeEstimator notifyTrailingSilenceDurationAtEndpoint:](speechEndHostTimeEstimator, "notifyTrailingSilenceDurationAtEndpoint:");
    objc_msgSend(v5, "additionalMetrics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("lastAudioChunkHostTime"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedLongLongValue");

    v10 = -[CSSpeechEndHostTimeEstimator estimatedSpeechEndHostTimeWithLastAudioChunkHostTime:](self->_speechEndHostTimeEstimator, "estimatedSpeechEndHostTimeWithLastAudioChunkHostTime:", v9);
    v11 = *MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315394;
      v15 = "-[CSSpeechController _calculateEstimatedSpeechEndHostTimeWithStopOptions:]";
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s Send estimatedSpeechEndHostTime using cached EP metrics : %@", (uint8_t *)&v14, 0x16u);
    }

  }
  else
  {
    v12 = self->_speechEndHostTimeEstimator;
    objc_msgSend(v4, "trailingSilenceDurationAtEndpoint");
    -[CSSpeechEndHostTimeEstimator notifyTrailingSilenceDurationAtEndpoint:](v12, "notifyTrailingSilenceDurationAtEndpoint:");
    v10 = -[CSSpeechEndHostTimeEstimator estimatedSpeechEndHostTime](self->_speechEndHostTimeEstimator, "estimatedSpeechEndHostTime");
  }

  return v10;
}

- (BOOL)isRecording
{
  void *v2;
  char v3;

  -[CSSpeechController audioStream](self, "audioStream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isStreaming");

  return v3;
}

- (BOOL)_isRecordRouteBuiltinMic
{
  void *v2;
  void *v3;
  char v4;

  -[CSSpeechController streamProvider](self, "streamProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C897F8]);

  return v4;
}

- (BOOL)_isRecordRouteStudioDisplay
{
  void *v2;
  void *v3;
  char v4;

  -[CSSpeechController streamProvider](self, "streamProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C89830]);

  return v4;
}

- (BOOL)_canDelayStopRecording
{
  void *v2;
  void *v3;
  char v4;

  -[CSSpeechController streamProvider](self, "streamProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C897F8]) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C89830]);

  return v4;
}

- (id)recordRoute
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[CSSpeechController streamProvider](self, "streamProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[CSSpeechController recordRoute]";
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return v3;
}

- (id)recordDeviceInfo
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[CSSpeechController streamProvider](self, "streamProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordDeviceInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[CSSpeechController recordDeviceInfo]";
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return v3;
}

- (id)audioDeviceInfo
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[CSSpeechController streamProvider](self, "streamProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "audioDeviceInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)*MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    objc_msgSend(v3, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[CSSpeechController audioDeviceInfo]";
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s %{public}@", (uint8_t *)&v8, 0x16u);

  }
  return v3;
}

- (id)playbackRoute
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[CSSpeechController streamProvider](self, "streamProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playbackRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[CSSpeechController playbackRoute]";
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return v3;
}

- (BOOL)_shouldFetchVoiceTriggerInfo
{
  return -[CSAudioRecordContext isVoiceTriggered](self->_audioRecordContext, "isVoiceTriggered");
}

- (BOOL)_shouldFetchRaiseToSpeakInfo
{
  return -[CSAudioRecordContext isRTSTriggered](self->_audioRecordContext, "isRTSTriggered");
}

- (void)_didStopForReason:(int64_t)a3
{
  int64_t v5;
  NSObject *v6;
  unint64_t v7;
  void *v8;
  CSSpeechEndHostTimeEstimator *speechEndHostTimeEstimator;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  CSSpeechEndHostTimeEstimator *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  id WeakRetained;
  char v20;
  id v21;
  id v22;
  char v23;
  void *v24;
  CSFAudioDeviceInfo *v25;
  CSFAudioDeviceInfo *audioDeviceInfoImpl;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  char v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  CSPlainAudioFileWriter *audioFileWriter;
  CSUncompressedAudioLogging *uncompressedAudioLogging;
  CSAudioZeroCounter *continuousZeroCounter;
  void *v40;
  void *v41;
  void *v42;
  BOOL v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  int v48;
  id v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  BOOL v60;
  CSSpeechController *v62;
  NSObject *v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t v70[128];
  uint8_t buf[4];
  const char *v72;
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  void *v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  if (a3 == 2)
    v5 = 0;
  else
    v5 = a3;
  v6 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v72 = "-[CSSpeechController _didStopForReason:]";
    v73 = 2050;
    v74 = v5;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Reason : %{public}ld", buf, 0x16u);
  }
  if (-[CSAudioStopStreamOption stopRecordingReason](self->_requestedStopRecordingOptions, "stopRecordingReason") == 3)
  {
    v7 = 0;
  }
  else if (-[CSSpeechController _shouldCalculateEstimatedSpeechEndHostTimeFromCachedEPMetrics](self, "_shouldCalculateEstimatedSpeechEndHostTimeFromCachedEPMetrics"))
  {
    -[CSEndpointerProxy cachedEndpointerMetrics](self->_endpointerProxy, "cachedEndpointerMetrics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    speechEndHostTimeEstimator = self->_speechEndHostTimeEstimator;
    objc_msgSend(v8, "trailingSilenceDurationAtEndpoint");
    -[CSSpeechEndHostTimeEstimator notifyTrailingSilenceDurationAtEndpoint:](speechEndHostTimeEstimator, "notifyTrailingSilenceDurationAtEndpoint:");
    objc_msgSend(v8, "additionalMetrics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("lastAudioChunkHostTime"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedLongLongValue");

    v7 = -[CSSpeechEndHostTimeEstimator estimatedSpeechEndHostTimeWithLastAudioChunkHostTime:](self->_speechEndHostTimeEstimator, "estimatedSpeechEndHostTimeWithLastAudioChunkHostTime:", v12);
    v13 = *MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v72 = "-[CSSpeechController _didStopForReason:]";
      v73 = 2112;
      v74 = (uint64_t)v8;
      _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, "%s SpeechEndEstimation using cached EP metrics : %@", buf, 0x16u);
    }

  }
  else
  {
    v14 = *MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v72 = "-[CSSpeechController _didStopForReason:]";
      _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_DEFAULT, "%s SpeechEndEstimation: Should Estimate SpeechEndHostTime", buf, 0xCu);
    }
    v15 = self->_speechEndHostTimeEstimator;
    -[CSAudioStopStreamOption trailingSilenceDurationAtEndpoint](self->_requestedStopRecordingOptions, "trailingSilenceDurationAtEndpoint");
    -[CSSpeechEndHostTimeEstimator notifyTrailingSilenceDurationAtEndpoint:](v15, "notifyTrailingSilenceDurationAtEndpoint:");
    v7 = -[CSSpeechEndHostTimeEstimator estimatedSpeechEndHostTime](self->_speechEndHostTimeEstimator, "estimatedSpeechEndHostTime");
  }
  -[CSEndpointerProxy recordingStoppedForReason:](self->_endpointerProxy, "recordingStoppedForReason:", v5);
  -[SSRSpeakerRecognitionController endAudio](self->_speakerRecognitionController, "endAudio");
  -[CSSpeakerRecognitionProxy invalidateXPCConnection](self->_speakerRecognitionProxy, "invalidateXPCConnection");
  if (!self->_isAsrOnDevice)
    -[CSAudioConverter flush](self->_audioConverter, "flush");
  if (self->_shouldUseLanguageDetectorForCurrentRequest)
    -[CSLanguageDetector endAudio](self->_languageDetector, "endAudio");
  *(_WORD *)&self->_isSiriClientListening = 0;
  if (!self->_didDeliverLastBuffer)
  {
    self->_didDeliverLastBuffer = 1;
    v16 = (void *)*MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      v18 = mach_absolute_time();
      *(_DWORD *)buf = 136315394;
      v72 = "-[CSSpeechController _didStopForReason:]";
      v73 = 2050;
      v74 = v18;
      _os_log_impl(&dword_1C2614000, v17, OS_LOG_TYPE_DEFAULT, "%s Reporting didDeliverLastPacket at: %{public}llu", buf, 0x16u);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) != 0)
    {
      v21 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v21, "speechControllerDidDeliverLastBuffer:forReason:estimatedSpeechEndHostTime:", self, v5, v7);

    }
  }
  v22 = objc_loadWeakRetained((id *)&self->_delegate);
  v23 = objc_opt_respondsToSelector();

  if ((v23 & 1) != 0)
  {
    if (v5 != 1)
    {
      -[CSSpeechController streamProvider](self, "streamProvider");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "audioDeviceInfo");
      v25 = (CSFAudioDeviceInfo *)objc_claimAutoreleasedReturnValue();
      audioDeviceInfoImpl = self->_audioDeviceInfoImpl;
      self->_audioDeviceInfoImpl = v25;

    }
    v27 = (void *)*MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      v28 = v27;
      v29 = mach_absolute_time();
      -[CSFAudioDeviceInfo description](self->_audioDeviceInfoImpl, "description");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v72 = "-[CSSpeechController _didStopForReason:]";
      v73 = 2050;
      v74 = v7;
      v75 = 2050;
      v76 = v29;
      v77 = 2114;
      v78 = v30;
      _os_log_impl(&dword_1C2614000, v28, OS_LOG_TYPE_DEFAULT, "%s SpeechEndEstimation: Reporting didStop with estimated speech end : %{public}llu, at: %{public}llu, audioDeviceInfo: %{public}@", buf, 0x2Au);

    }
    v31 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v31, "speechControllerDidStopRecording:audioDeviceInfo:forReason:estimatedSpeechEndHostTime:", self, self->_audioDeviceInfoImpl, v5, v7);
  }
  else
  {
    v32 = objc_loadWeakRetained((id *)&self->_delegate);
    v33 = objc_opt_respondsToSelector();

    if ((v33 & 1) == 0)
      goto LABEL_35;
    v34 = (void *)*MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      v35 = v34;
      v36 = mach_absolute_time();
      *(_DWORD *)buf = 136315650;
      v72 = "-[CSSpeechController _didStopForReason:]";
      v73 = 2050;
      v74 = v7;
      v75 = 2050;
      v76 = v36;
      _os_log_impl(&dword_1C2614000, v35, OS_LOG_TYPE_DEFAULT, "%s SpeechEndEstimation: Reporting didStop with estimated speech end : %{public}llu, at: %{public}llu", buf, 0x20u);

    }
    v31 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v31, "speechControllerDidStopRecording:forReason:estimatedSpeechEndHostTime:", self, v5, v7);
  }

LABEL_35:
  audioFileWriter = self->_audioFileWriter;
  if (audioFileWriter)
  {
    -[CSPlainAudioFileWriter endAudio](audioFileWriter, "endAudio");
    -[CSPlainAudioFileWriter addContextKey:withContext:](self->_audioFileWriter, "addContextKey:withContext:", CFSTR("vtei"), self->_lastVoiceTriggerInfo);
    -[CSPlainAudioFileWriter addContextKey:fromMetaFile:](self->_audioFileWriter, "addContextKey:fromMetaFile:", CFSTR("ssvmeta"), self->_ssvLogFilePath);
  }
  -[CSUncompressedAudioLogging endAudioWithCancellation:completion:](self->_uncompressedAudioLogging, "endAudioWithCancellation:completion:", a3 != 0, 0);
  uncompressedAudioLogging = self->_uncompressedAudioLogging;
  self->_uncompressedAudioLogging = 0;

  -[CSSelectiveChannelAudioFileWriter endAudio](self->_serverLoggingWriter, "endAudio");
  -[CSSpeechController _deviceAudioLoggingWithFileWriter:](self, "_deviceAudioLoggingWithFileWriter:", self->_serverLoggingWriter);
  continuousZeroCounter = self->_continuousZeroCounter;
  objc_msgSend(MEMORY[0x1E0D192A8], "sharedAggregator");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAudioZeroCounter stopCountingZeroStatisticsWithReporter:](continuousZeroCounter, "stopCountingZeroStatisticsWithReporter:", v40);

  -[CSAudioPowerMeter reset](self->_powerMeter, "reset");
  objc_msgSend(MEMORY[0x1E0D191F0], "sharedInstance");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "notifyDidStopStream:withEventUUID:", 0, self->_recordEventUUID);

  if (-[CSSpeechController _isHubRequestTV](self, "_isHubRequestTV"))
    -[NSMutableDictionary removeAllObjects](self->_decodersForTV, "removeAllObjects");
  -[CSSpeechController recordRoute](self, "recordRoute");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = -[CSSpeechController _isDuckingAvailableRoute:](self, "_isDuckingAvailableRoute:", v42);

  if (!v43)
  {
    objc_msgSend(MEMORY[0x1E0D18FF0], "sharedMonitor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "playingApps");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = (void *)*MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      v47 = v46;
      v48 = objc_msgSend(v45, "count");
      *(_DWORD *)buf = 136315394;
      v72 = "-[CSSpeechController _didStopForReason:]";
      v73 = 1024;
      LODWORD(v74) = v48;
      _os_log_impl(&dword_1C2614000, v47, OS_LOG_TYPE_DEFAULT, "%s Currently playing App : %d", buf, 0x12u);

    }
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v49 = v45;
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
    if (v50)
    {
      v52 = v50;
      v53 = *(_QWORD *)v67;
      *(_QWORD *)&v51 = 136315650;
      v65 = v51;
      do
      {
        for (i = 0; i != v52; ++i)
        {
          if (*(_QWORD *)v67 != v53)
            objc_enumerationMutation(v49);
          v55 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
          objc_msgSend(v55, "appName", v65, (_QWORD)v66);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "version");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", self->_requestMHUUID);
          v59 = (void *)v58;
          if (v56)
            v60 = v57 == 0;
          else
            v60 = 1;
          if (!v60 && v58 != 0)
          {
            v62 = self;
            v63 = *MEMORY[0x1E0D18F48];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v65;
              v72 = "-[CSSpeechController _didStopForReason:]";
              v73 = 2112;
              v74 = (uint64_t)v56;
              v75 = 2112;
              v76 = (uint64_t)v57;
              _os_log_impl(&dword_1C2614000, v63, OS_LOG_TYPE_DEFAULT, "%s name : %@, version : %@", buf, 0x20u);
            }
            objc_msgSend(MEMORY[0x1E0D190E8], "sharedLogger");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "logMHApplicationPlaybackAttemptedWithMHUUID:withAppBundleName:withAppBundleVersion:", v59, v56, v57);

            self = v62;
          }

        }
        v52 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
      }
      while (v52);
    }

  }
}

- (BOOL)_isDuckingAvailableRoute:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (!CSIsIOS())
  {
    if (CSIsWatch())
    {
      if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C89A00]) & 1) != 0)
        goto LABEL_6;
    }
    else if ((CSIsHorseman() & 1) != 0)
    {
      goto LABEL_6;
    }
    v4 = 0;
    goto LABEL_9;
  }
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C89A00]) & 1) != 0)
  {
LABEL_6:
    v4 = 1;
    goto LABEL_9;
  }
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C89A30]);
LABEL_9:

  return v4;
}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  NSObject *v6;
  NSObject *queue;
  _QWORD v8[6];
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[CSSpeechController audioStreamProvider:didStopStreamUnexpectedly:]";
    _os_log_error_impl(&dword_1C2614000, v6, OS_LOG_TYPE_ERROR, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__CSSpeechController_audioStreamProvider_didStopStreamUnexpectedly___block_invoke;
  v8[3] = &unk_1E7C29178;
  v8[4] = self;
  v8[5] = a4;
  dispatch_async(queue, v8);
}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  float v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  float v19;
  float v20;
  float v21;
  void *v22;
  uint64_t v23;
  NSObject *queue;
  id v25;
  _QWORD block[5];
  id v27;
  id v28;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "numSamples");
  if (v8 >= 1)
  {
    v9 = v8;
    v10 = 0;
    do
    {
      v11 = (void *)MEMORY[0x1C3BC4590]();
      objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingBufferDuration");
      v13 = v12;
      objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
      v15 = v13 * v14;
      if (v15 > (double)v9)
        v15 = (double)v9;
      v16 = (uint64_t)v15;
      objc_msgSend(v7, "subChunkFrom:numSamples:", v10, (uint64_t)v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "remoteVAD");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(MEMORY[0x1E0D19090], "remoteVADDuration");
        v20 = v19;
        objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
        objc_msgSend(v7, "remoteVADSubChunkFrom:numSamples:numAudioSamplesPerRemoteVAD:", v10, v16, (unint64_t)(float)(v20 * v21));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setRemoteVAD:", v22);

      }
      v9 -= objc_msgSend(v17, "numSamples");
      v23 = objc_msgSend(v17, "numSamples");
      queue = self->_queue;
      v10 += v23;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __63__CSSpeechController_audioStreamProvider_audioBufferAvailable___block_invoke;
      block[3] = &unk_1E7C291C0;
      block[4] = self;
      v27 = v6;
      v28 = v17;
      v25 = v17;
      dispatch_async(queue, block);

      objc_autoreleasePoolPop(v11);
    }
    while (v9 > 0);
  }

}

- (void)_audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  id v6;
  id v7;
  _BOOL4 didDeliverLastBuffer;
  void *v9;
  NSObject *v10;
  unint64_t v11;
  os_log_t *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  CSAudioStopStreamOption *requestedStopRecordingOptions;
  unint64_t numTrailingSamplesAfterSchedulingStop;
  unint64_t maxAllowedTrailingSamplesAfterSchedulingStop;
  NSObject *v20;
  unint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  int v26;
  CSAudioPowerMeter *powerMeter;
  NSObject *v28;
  CSAudioPowerMeter *v29;
  double v30;
  double v31;
  CSAudioSampleRateConverter *downsampler;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  unint64_t v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  id v51;
  id WeakRetained;
  char v53;
  id v54;
  char v55;
  float v56;
  float v57;
  float v58;
  unint64_t v59;
  double v60;
  void *v61;
  void *v62;
  CSSelectiveChannelAudioFileWriter *serverLoggingWriter;
  id v64;
  void *v65;
  float v66;
  float v67;
  double v68;
  uint64_t v69;
  unint64_t v70;
  void *v71;
  NSObject *v72;
  uint64_t v73;
  CSAudioStopStreamOption *v74;
  os_log_t v75;
  NSObject *v76;
  uint64_t v77;
  CSAudioStopStreamOption *v78;
  uint64_t v79;
  id v80;
  unint64_t v81;
  void *v82;
  void *v83;
  id v84;
  id v85;
  void *v86;
  uint8_t buf[4];
  const char *v88;
  __int16 v89;
  _BYTE v90[18];
  __int16 v91;
  CSAudioStopStreamOption *v92;
  __int16 v93;
  unint64_t v94;
  __int16 v95;
  unint64_t v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  didDeliverLastBuffer = self->_didDeliverLastBuffer;
  if (self->_didDeliverLastBuffer)
  {
    v9 = (void *)*MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      *(_DWORD *)buf = 136315650;
      v88 = "-[CSSpeechController _audioStreamProvider:audioBufferAvailable:]";
      v89 = 1024;
      *(_DWORD *)v90 = didDeliverLastBuffer;
      *(_WORD *)&v90[4] = 2048;
      *(_QWORD *)&v90[6] = objc_msgSend(v7, "numSamples");
      _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s _didDeliverLastPacket=%d. Dropping Audio packets of size=%lu", buf, 0x1Cu);

    }
    goto LABEL_60;
  }
  if (!-[CSSpeechController hasPerformedDelayedStop](self, "hasPerformedDelayedStop")
    && -[CSAudioStopStreamOption expectedStopHostTime](self->_requestedStopRecordingOptions, "expectedStopHostTime")
    && -[CSSpeechController canPerformDelayedStop](self, "canPerformDelayedStop"))
  {
    v11 = self->_numTrailingSamplesAfterSchedulingStop + objc_msgSend(v7, "numSamples");
    self->_numTrailingSamplesAfterSchedulingStop = v11;
    v12 = (os_log_t *)MEMORY[0x1E0D18F48];
    v13 = (void *)*MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      v15 = objc_msgSend(v7, "hostTime");
      v16 = objc_msgSend(v7, "numSamples");
      requestedStopRecordingOptions = self->_requestedStopRecordingOptions;
      numTrailingSamplesAfterSchedulingStop = self->_numTrailingSamplesAfterSchedulingStop;
      maxAllowedTrailingSamplesAfterSchedulingStop = self->_maxAllowedTrailingSamplesAfterSchedulingStop;
      *(_DWORD *)buf = 136316418;
      v88 = "-[CSSpeechController _audioStreamProvider:audioBufferAvailable:]";
      v89 = 2050;
      *(_QWORD *)v90 = v15;
      *(_WORD *)&v90[8] = 2050;
      *(_QWORD *)&v90[10] = v16;
      v91 = 2114;
      v92 = requestedStopRecordingOptions;
      v93 = 2050;
      v94 = numTrailingSamplesAfterSchedulingStop;
      v95 = 2050;
      v96 = maxAllowedTrailingSamplesAfterSchedulingStop;
      _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_DEFAULT, "%s chunk.hostTime=%{public}llu, chunkSz=%{public}lu, stopOptions=%{public}@, _numTrailingSamplesAfterSchedulingStop=%{public}lu, maxAllowedSamples=%{public}lu", buf, 0x3Eu);

      v11 = self->_numTrailingSamplesAfterSchedulingStop;
    }
    if (v11 > self->_maxAllowedTrailingSamplesAfterSchedulingStop)
    {
      v20 = *v12;
      if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v88 = "-[CSSpeechController _audioStreamProvider:audioBufferAvailable:]";
        _os_log_impl(&dword_1C2614000, v20, OS_LOG_TYPE_DEFAULT, "%s STOPRECORDING: Reached MAX allowed trailing samples AFTER stopRecording was scheduled!", buf, 0xCu);
      }
LABEL_63:
      -[CSSpeechController setHasPerformedDelayedStop:](self, "setHasPerformedDelayedStop:", 1);
      -[CSSpeechController _delayedStopRecordingWithOptions:](self, "_delayedStopRecordingWithOptions:", self->_requestedStopRecordingOptions);
      goto LABEL_60;
    }
    v21 = objc_msgSend(v7, "hostTime");
    if (v21 >= -[CSAudioStopStreamOption expectedStopHostTime](self->_requestedStopRecordingOptions, "expectedStopHostTime"))
    {
      v75 = *v12;
      if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
      {
        v76 = v75;
        v77 = objc_msgSend(v7, "hostTime");
        v78 = self->_requestedStopRecordingOptions;
        *(_DWORD *)buf = 136315650;
        v88 = "-[CSSpeechController _audioStreamProvider:audioBufferAvailable:]";
        v89 = 2050;
        *(_QWORD *)v90 = v77;
        *(_WORD *)&v90[8] = 2114;
        *(_QWORD *)&v90[10] = v78;
        _os_log_impl(&dword_1C2614000, v76, OS_LOG_TYPE_DEFAULT, "%s STOPRECORDING: chunk.hostTime=%{public}llu >= stopOptions=%{public}@", buf, 0x20u);

      }
      goto LABEL_63;
    }
  }
  v22 = _audioStreamProvider_audioBufferAvailable__heartbeat_CORESPEECH_SPEECH_MANAGER_LPCM_RECORD_BUFFER_AVAILABLE;
  if (__ROR8__(0xEEEEEEEEEEEEEEEFLL* _audioStreamProvider_audioBufferAvailable__heartbeat_CORESPEECH_SPEECH_MANAGER_LPCM_RECORD_BUFFER_AVAILABLE, 1) <= 0x888888888888888uLL)
  {
    kdebug_trace();
    v22 = _audioStreamProvider_audioBufferAvailable__heartbeat_CORESPEECH_SPEECH_MANAGER_LPCM_RECORD_BUFFER_AVAILABLE;
  }
  _audioStreamProvider_audioBufferAvailable__heartbeat_CORESPEECH_SPEECH_MANAGER_LPCM_RECORD_BUFFER_AVAILABLE = v22 + 1;
  if (self->_isSiriClientListening)
  {
    v84 = v7;
    v23 = v7;
    objc_msgSend(v23, "data");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingIsFloat"))
    {
      objc_msgSend(MEMORY[0x1E0D19100], "convertToShortLPCMBufFromFloatLPCMBuf:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[CSAudioZeroCounter getZeroStatisticsFromBuffer:entireSamples:](self->_continuousZeroCounter, "getZeroStatisticsFromBuffer:entireSamples:", v24, objc_msgSend(v24, "length") / (unint64_t)objc_msgSend(v23, "sampleByteDepth"));
    -[CSSpeechEndHostTimeEstimator addNumSamples:hostTime:](self->_speechEndHostTimeEstimator, "addNumSamples:hostTime:", objc_msgSend(v23, "numSamples"), objc_msgSend(v23, "hostTime"));
    v26 = objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingIsFloat");
    powerMeter = self->_powerMeter;
    if (v26)
      -[CSAudioPowerMeter processFloatBuffer:stride:inFrameToProcess:](powerMeter, "processFloatBuffer:stride:inFrameToProcess:", objc_msgSend(objc_retainAutorelease(v24), "bytes"), 1, objc_msgSend(v23, "numSamples"));
    else
      -[CSAudioPowerMeter processShortBuffer:stride:inFrameToProcess:](powerMeter, "processShortBuffer:stride:inFrameToProcess:", objc_msgSend(objc_retainAutorelease(v25), "bytes"), 1, objc_msgSend(v23, "numSamples"));
    v29 = self->_powerMeter;
    if (v29)
    {
      -[CSAudioPowerMeter getAveragePowerDB](v29, "getAveragePowerDB");
      *(float *)&v30 = v30;
      self->_cachedAvgPower = *(float *)&v30;
      -[CSAudioPowerMeter getPeakPowerDB](self->_powerMeter, "getPeakPowerDB");
      *(float *)&v31 = v31;
      self->_cachedPeakPower = *(float *)&v31;
    }
    if (self->_shouldUseLanguageDetectorForCurrentRequest)
      -[CSLanguageDetector addSamples:numSamples:](self->_languageDetector, "addSamples:numSamples:", v24, objc_msgSend(v23, "numSamples"));
    v83 = v24;
    v86 = v25;
    if (self->_isNarrowBand)
    {
      downsampler = self->_downsampler;
      objc_msgSend(v23, "data");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSAudioSampleRateConverter convertSampleRateOfBuffer:](downsampler, "convertSampleRateOfBuffer:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v80 = v6;
      if (objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingIsFloat"))
      {
        objc_msgSend(MEMORY[0x1E0D19100], "convertToShortLPCMBufFromFloatLPCMBuf:", v34);
        v35 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v35 = v34;
      }
      v85 = v35;
      v38 = objc_msgSend(v34, "length");
      v81 = v38 / objc_msgSend(v23, "sampleByteDepth");
      v39 = v34;
      v40 = objc_alloc(MEMORY[0x1E0D18FC8]);
      v41 = objc_msgSend(v23, "sampleByteDepth");
      v42 = objc_msgSend(v23, "startSampleCount");
      v43 = objc_msgSend(v23, "hostTime");
      v44 = objc_msgSend(v23, "arrivalHostTimeToAudioRecorder");
      v45 = objc_msgSend(v23, "wasBuffered");
      objc_msgSend(v23, "remoteVAD");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v79) = v45;
      v47 = v40;
      v36 = v39;
      v37 = (id)objc_msgSend(v47, "initWithData:numChannels:numSamples:sampleByteDepth:startSampleCount:hostTime:arrivalHostTimeToAudioRecorder:wasBuffered:remoteVAD:", v39, 1, v81, v41, v42, v43, v44, v79, v46);

      v6 = v80;
      v25 = v86;
    }
    else
    {
      objc_msgSend(v23, "data");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = v25;
      v37 = v23;
    }
    -[CSContinuousVoiceTrigger processAudioSamples:](self->_continuousVoiceTrigger, "processAudioSamples:", v23);
    -[SSRSpeakerRecognitionController processAudio:withNumberOfSamples:](self->_speakerRecognitionController, "processAudio:withNumberOfSamples:", v25, objc_msgSend(v23, "numSamples"));
    -[CSEndpointerProxy processAudioSamplesAsynchronously:](self->_endpointerProxy, "processAudioSamplesAsynchronously:", v37);
    v48 = _audioStreamProvider_audioBufferAvailable__heartbeat_CORESPEECH_OPUS_ENCODING_BEGIN;
    if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * _audioStreamProvider_audioBufferAvailable__heartbeat_CORESPEECH_OPUS_ENCODING_BEGIN, 1) <= 0x888888888888888uLL)
    {
      kdebug_trace();
      v48 = _audioStreamProvider_audioBufferAvailable__heartbeat_CORESPEECH_OPUS_ENCODING_BEGIN;
    }
    _audioStreamProvider_audioBufferAvailable__heartbeat_CORESPEECH_OPUS_ENCODING_BEGIN = v48 + 1;
    if (!self->_isAsrOnDevice)
      -[CSAudioConverter addSamples:timestamp:arrivalTimestampToAudioRecorder:](self->_audioConverter, "addSamples:timestamp:arrivalTimestampToAudioRecorder:", v36, objc_msgSend(v23, "hostTime"), objc_msgSend(v23, "arrivalHostTimeToAudioRecorder"));
    v49 = _audioStreamProvider_audioBufferAvailable__heartbeat_CORESPEECH_OPUS_ENCODING_END;
    if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * _audioStreamProvider_audioBufferAvailable__heartbeat_CORESPEECH_OPUS_ENCODING_END, 1) <= 0x888888888888888uLL)
    {
      kdebug_trace();
      v49 = _audioStreamProvider_audioBufferAvailable__heartbeat_CORESPEECH_OPUS_ENCODING_END;
    }
    v82 = v37;
    _audioStreamProvider_audioBufferAvailable__heartbeat_CORESPEECH_OPUS_ENCODING_END = v49 + 1;
    v50 = v36;
    v51 = v50;
    if (objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingIsFloat"))
    {
      v51 = v50;
      if ((CSIsOSX() & 1) == 0)
      {
        v51 = v85;

      }
    }
    -[CSUncompressedAudioLogging appendAudioData:](self->_uncompressedAudioLogging, "appendAudioData:", v51);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v53 = objc_opt_respondsToSelector();

    v54 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((v53 & 1) != 0)
    {
      objc_msgSend(v54, "speechControllerLPCMRecordBufferAvailable:buffer:recordedAt:", self, v51, objc_msgSend(v23, "hostTime"));
    }
    else
    {
      v55 = objc_opt_respondsToSelector();

      if ((v55 & 1) == 0)
      {
LABEL_47:
        if (self->_isRemoteVADAvailableStream)
        {
          objc_msgSend(MEMORY[0x1E0D19090], "remoteVADDuration");
          v57 = v56;
          objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
          v59 = (unint64_t)(float)(v57 * v58);
          LODWORD(v60) = 1176256512;
          objc_msgSend(v23, "dataWithRemoteVADWithScaleFactor:numAudioSamplesPerRemoteVAD:", v59, v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = v61;
          if (v61)
            -[CSPlainAudioFileWriter addSamples:numSamples:](self->_audioFileWriter, "addSamples:numSamples:", objc_msgSend(objc_retainAutorelease(v61), "bytes"), objc_msgSend(v23, "numSamples"));

        }
        else
        {
          -[CSPlainAudioFileWriter addSamples:numSamples:](self->_audioFileWriter, "addSamples:numSamples:", objc_msgSend(objc_retainAutorelease(v25), "bytes"), objc_msgSend(v23, "numSamples"));
        }
        serverLoggingWriter = self->_serverLoggingWriter;
        objc_msgSend(v23, "data");
        v64 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        -[CSSelectiveChannelAudioFileWriter addSamples:numSamples:](serverLoggingWriter, "addSamples:numSamples:", objc_msgSend(v64, "bytes"), objc_msgSend(v23, "numSamples"));

        if (!-[CSSpeechController hasPerformedDelayedStop](self, "hasPerformedDelayedStop"))
        {
          if (-[CSAudioStopStreamOption expectedStopHostTime](self->_requestedStopRecordingOptions, "expectedStopHostTime"))
          {
            if (-[CSSpeechController canPerformDelayedStop](self, "canPerformDelayedStop"))
            {
              v65 = (void *)MEMORY[0x1E0D19118];
              v66 = (float)(unint64_t)objc_msgSend(v23, "numSamples");
              objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
              *(float *)&v68 = v66 / v67;
              v69 = objc_msgSend(v65, "secondsToHostTime:", v68);
              v70 = objc_msgSend(v23, "hostTime") + v69;
              if (v70 >= -[CSAudioStopStreamOption expectedStopHostTime](self->_requestedStopRecordingOptions, "expectedStopHostTime"))
              {
                v71 = (void *)*MEMORY[0x1E0D18F48];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
                {
                  v72 = v71;
                  v73 = objc_msgSend(v23, "hostTime");
                  v74 = self->_requestedStopRecordingOptions;
                  *(_DWORD *)buf = 136315650;
                  v88 = "-[CSSpeechController _audioStreamProvider:audioBufferAvailable:]";
                  v89 = 2050;
                  *(_QWORD *)v90 = v73 + v69;
                  *(_WORD *)&v90[8] = 2114;
                  *(_QWORD *)&v90[10] = v74;
                  _os_log_impl(&dword_1C2614000, v72, OS_LOG_TYPE_DEFAULT, "%s STOPRECORDING: chunk.endHostTime=%{public}llu >= stopOptions=%{public}@", buf, 0x20u);

                }
                -[CSSpeechController setHasPerformedDelayedStop:](self, "setHasPerformedDelayedStop:", 1);
                -[CSSpeechController _delayedStopRecordingWithOptions:](self, "_delayedStopRecordingWithOptions:", self->_requestedStopRecordingOptions);
              }
            }
          }
        }

        v7 = v84;
        goto LABEL_60;
      }
      v54 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v54, "speechControllerLPCMRecordBufferAvailable:buffer:", self, v51);
    }

    goto LABEL_47;
  }
  v28 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v88 = "-[CSSpeechController _audioStreamProvider:audioBufferAvailable:]";
    _os_log_error_impl(&dword_1C2614000, v28, OS_LOG_TYPE_ERROR, "%s SpeechManager still forwarding audio after didStopForwarding, we shouldn't have this", buf, 0xCu);
  }
LABEL_60:

}

- (void)audioStreamProvider:(id)a3 audioChunkForTVAvailable:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__CSSpeechController_audioStreamProvider_audioChunkForTVAvailable___block_invoke;
  v8[3] = &unk_1E7C292A0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)audioDecoderDidDecodePackets:(id)a3 audioStreamHandleId:(unint64_t)a4 buffer:(id)a5 remoteVAD:(id)a6 timestamp:(unint64_t)a7 arrivalTimestampToAudioRecorder:(unint64_t)a8 wasBuffered:(BOOL)a9 receivedNumChannels:(unsigned int)a10
{
  void *v13;
  id v14;
  void *v15;
  void *v16;
  unint64_t v17;
  id v18;
  SSRSpeakerRecognitionController *speakerRecognitionController;
  void *v20;
  uint64_t v21;
  id v22;

  v13 = (void *)MEMORY[0x1E0D19068];
  v14 = a5;
  objc_msgSend(v13, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "defaultConverter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "processSampleCount:hostTime:", self->_decoderProcessedSampleCountForTV, a7);

  v17 = ((unint64_t)objc_msgSend(v14, "length") >> 1) / a10;
  v18 = objc_alloc(MEMORY[0x1E0D18FC8]);
  LOBYTE(v21) = a9;
  v22 = (id)objc_msgSend(v18, "initWithData:numChannels:numSamples:sampleByteDepth:startSampleCount:hostTime:arrivalHostTimeToAudioRecorder:wasBuffered:remoteVAD:", v14, a10, v17, objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleByteDepth"), self->_decoderProcessedSampleCountForTV, a7, a8, v21, 0);

  -[CSContinuousVoiceTrigger processAudioSamples:](self->_continuousVoiceTrigger, "processAudioSamples:", v22);
  if (objc_msgSend(MEMORY[0x1E0D19260], "supportsEndpointingOnATV"))
    -[CSEndpointerProxy processAudioSamplesAsynchronously:](self->_endpointerProxy, "processAudioSamplesAsynchronously:", v22);
  if (CSIsTV())
  {
    speakerRecognitionController = self->_speakerRecognitionController;
    objc_msgSend(v22, "data");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSRSpeakerRecognitionController processAudio:withNumberOfSamples:](speakerRecognitionController, "processAudio:withNumberOfSamples:", v20, objc_msgSend(v22, "numSamples"));

  }
  self->_decoderProcessedSampleCountForTV += v17;

}

- (void)audioStreamProvider:(id)a3 didHardwareConfigurationChange:(int64_t)a4
{
  NSObject *v6;
  NSObject *queue;
  _QWORD v8[6];
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[CSSpeechController audioStreamProvider:didHardwareConfigurationChange:]";
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__CSSpeechController_audioStreamProvider_didHardwareConfigurationChange___block_invoke;
  v8[3] = &unk_1E7C29178;
  v8[4] = self;
  v8[5] = a4;
  dispatch_async(queue, v8);
}

- (void)audioSessionProvider:(id)a3 providerInvalidated:(BOOL)a4
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__CSSpeechController_audioSessionProvider_providerInvalidated___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)audioSessionProvider:(id)a3 didChangeContext:(BOOL)a4
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[CSSpeechController audioSessionProvider:didChangeContext:]";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:(id)a4
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[CSSpeechController audioSessionController:didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:]";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
}

- (void)audioAlertProvidingDidFinishAlertPlayback:(id)a3 ofType:(int64_t)a4 error:(id)a5
{
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  _QWORD block[5];
  id v12;
  int64_t v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[CSSpeechController audioAlertProvidingDidFinishAlertPlayback:ofType:error:]";
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__CSSpeechController_audioAlertProvidingDidFinishAlertPlayback_ofType_error___block_invoke;
  block[3] = &unk_1E7C28B58;
  v12 = v7;
  v13 = a4;
  block[4] = self;
  v10 = v7;
  dispatch_async(queue, block);

}

- (void)audioSessionProviderBeginInterruption:(id)a3
{
  NSObject *v4;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[CSSpeechController audioSessionProviderBeginInterruption:]";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__CSSpeechController_audioSessionProviderBeginInterruption___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)audioSessionProviderBeginInterruption:(id)a3 withContext:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *queue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[CSSpeechController audioSessionProviderBeginInterruption:withContext:]";
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__CSSpeechController_audioSessionProviderBeginInterruption_withContext___block_invoke;
  v9[3] = &unk_1E7C292A0;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async(queue, v9);

}

- (void)audioSessionProviderEndInterruption:(id)a3
{
  NSObject *v4;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[CSSpeechController audioSessionProviderEndInterruption:]";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__CSSpeechController_audioSessionProviderEndInterruption___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)audioSessionProvider:(id)a3 willSetAudioSessionActive:(BOOL)a4
{
  NSObject *v6;
  NSObject *queue;
  _QWORD v8[5];
  BOOL v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[CSSpeechController audioSessionProvider:willSetAudioSessionActive:]";
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__CSSpeechController_audioSessionProvider_willSetAudioSessionActive___block_invoke;
  v8[3] = &unk_1E7C28480;
  v8[4] = self;
  v9 = a4;
  dispatch_async(queue, v8);
}

- (void)audioSessionProvider:(id)a3 didSetAudioSessionActive:(BOOL)a4
{
  NSObject *v6;
  NSObject *queue;
  _QWORD v8[5];
  BOOL v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[CSSpeechController audioSessionProvider:didSetAudioSessionActive:]";
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__CSSpeechController_audioSessionProvider_didSetAudioSessionActive___block_invoke;
  v8[3] = &unk_1E7C28480;
  v8[4] = self;
  v9 = a4;
  dispatch_async(queue, v8);
}

- (void)didTTSVolumeChange:(id)a3 forReason:(unint64_t)a4
{
  NSObject *v6;
  NSObject *queue;
  _QWORD v8[6];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[CSSpeechController didTTSVolumeChange:forReason:]";
    v11 = 2048;
    v12 = a4;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume update reason: %lu", buf, 0x16u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__CSSpeechController_didTTSVolumeChange_forReason___block_invoke;
  v8[3] = &unk_1E7C29178;
  v8[4] = self;
  v8[5] = a4;
  dispatch_async(queue, v8);
}

- (void)_setupDownsamplerIfNeeded
{
  CSAudioSampleRateConverter *v3;
  CSAudioSampleRateConverter *downsampler;

  if (!self->_downsampler)
  {
    objc_msgSend(MEMORY[0x1E0D19020], "downsampler");
    v3 = (CSAudioSampleRateConverter *)objc_claimAutoreleasedReturnValue();
    downsampler = self->_downsampler;
    self->_downsampler = v3;

  }
}

- (BOOL)_setupAudioConverter:(BOOL)a3 isNarrowBand:(BOOL)a4
{
  CSAudioConverter *narrowBandOpusConverter;
  id *p_narrowBandOpusConverter;
  uint64_t v7;
  id v8;
  CSAudioConverter *v9;
  CSAudioConverter *audioConverter;

  if (a4)
  {
    p_narrowBandOpusConverter = (id *)&self->_narrowBandOpusConverter;
    narrowBandOpusConverter = self->_narrowBandOpusConverter;
    if (!narrowBandOpusConverter)
    {
      +[CSAudioConverter narrowBandOpusConverter](CSAudioConverter, "narrowBandOpusConverter", a3);
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v8 = *p_narrowBandOpusConverter;
      *p_narrowBandOpusConverter = (id)v7;

      objc_msgSend(*p_narrowBandOpusConverter, "setDelegate:", self);
      narrowBandOpusConverter = (CSAudioConverter *)*p_narrowBandOpusConverter;
    }
  }
  else
  {
    p_narrowBandOpusConverter = (id *)&self->_opusAudioConverter;
    narrowBandOpusConverter = self->_opusAudioConverter;
    if (!narrowBandOpusConverter)
    {
      +[CSAudioConverter opusConverter](CSAudioConverter, "opusConverter", a3);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  v9 = narrowBandOpusConverter;
  audioConverter = self->_audioConverter;
  self->_audioConverter = v9;

  return self->_audioConverter != 0;
}

- (void)audioConverterDidConvertPackets:(id)a3 packets:(id)a4 durationInSec:(float)a5 timestamp:(unint64_t)a6 arrivalTimestampToAudioRecorder:(unint64_t)a7
{
  id v11;
  id v12;
  void *v13;
  CSFAudioDeviceInfo *v14;
  CSFAudioDeviceInfo *audioDeviceInfoImpl;
  id WeakRetained;
  char v17;
  id v18;
  double v19;
  void *v20;
  NSObject *v21;
  char v22;
  id v23;
  double v24;
  int v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  if (self->_isSiriClientListening)
  {
    if (!self->_didDeliverFirstSpeechPacket)
    {
      self->_didDeliverFirstSpeechPacket = 1;
      if (!self->_audioDeviceInfoImpl)
      {
        -[CSSpeechController streamProvider](self, "streamProvider");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "audioDeviceInfo");
        v14 = (CSFAudioDeviceInfo *)objc_claimAutoreleasedReturnValue();
        audioDeviceInfoImpl = self->_audioDeviceInfoImpl;
        self->_audioDeviceInfoImpl = v14;

      }
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v17 = objc_opt_respondsToSelector();

    v18 = objc_loadWeakRetained((id *)&self->_delegate);
    v20 = v18;
    if ((v17 & 1) != 0)
    {
      *(float *)&v19 = a5;
      objc_msgSend(v18, "speechControllerRecordBufferAvailable:buffers:durationInSec:recordedAt:audioDeviceInfo:", self, v12, a6, self->_audioDeviceInfoImpl, v19);

    }
    else
    {
      v22 = objc_opt_respondsToSelector();

      if ((v22 & 1) != 0)
      {
        v23 = objc_loadWeakRetained((id *)&self->_delegate);
        *(float *)&v24 = a5;
        objc_msgSend(v23, "speechControllerRecordBufferAvailable:buffers:durationInSec:recordedAt:", self, v12, a6, v24);

      }
    }
  }
  else
  {
    v21 = *MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_ERROR))
    {
      v25 = 136315138;
      v26 = "-[CSSpeechController audioConverterDidConvertPackets:packets:durationInSec:timestamp:arrivalTimestampToAudioRecorder:]";
      _os_log_error_impl(&dword_1C2614000, v21, OS_LOG_TYPE_ERROR, "%s SpeechController is trying to forward encoded audio after didStopForwarding, we shouldn't have this", (uint8_t *)&v25, 0xCu);
    }
  }

}

- (BOOL)setAlertSoundFromURL:(id)a3 forType:(int64_t)a4 force:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  char v12;
  _BYTE v14[24];
  int v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v5 = a5;
  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("NO");
    *(_DWORD *)v14 = 136315906;
    *(_QWORD *)&v14[4] = "-[CSSpeechController setAlertSoundFromURL:forType:force:]";
    *(_WORD *)&v14[12] = 2114;
    *(_QWORD *)&v14[14] = v8;
    if (v5)
      v10 = CFSTR("YES");
    *(_WORD *)&v14[22] = 1026;
    v15 = a4;
    v16 = 2114;
    v17 = v10;
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Setting Alert Sounds From : %{public}@ for AlertType : %{public}d, force : %{public}@", v14, 0x26u);
  }
  -[CSSpeechController alertProvider](self, "alertProvider", *(_OWORD *)v14, *(_QWORD *)&v14[16]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "setAlertSoundFromURL:forType:force:", v8, a4, v5);

  return v12;
}

- (BOOL)playAlertSoundForType:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  char v7;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[CSSpeechController playAlertSoundForType:]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v9, 0xCu);
  }
  -[CSSpeechController alertProvider](self, "alertProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "playAlertSoundForType:", a3);

  return v7;
}

- (unint64_t)alertStartTime
{
  void *v2;
  unint64_t v3;

  -[CSSpeechController alertProvider](self, "alertProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "alertStartTime");

  return v3;
}

- (BOOL)playRecordStartingAlertAndResetEndpointerWithAlertOverride:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  char v7;
  int v9;
  const char *v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[CSSpeechController playRecordStartingAlertAndResetEndpointerWithAlertOverride:]";
    v11 = 2048;
    v12 = a3;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s playing start recording alert with override: %lu", (uint8_t *)&v9, 0x16u);
  }
  -[CSSpeechController alertProvider](self, "alertProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "playRecordStartingAlertAndResetEndpointerWithAlertOverride:", a3);

  return v7;
}

- (void)stopEndpointer
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSSpeechController stopEndpointer]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  -[CSEndpointerProxy stopEndpointer](self->_endpointerProxy, "stopEndpointer");
}

- (void)setMeteringEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[CSSpeechController setMeteringEnabled:]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }
  -[CSSpeechController audioMeterProvider](self, "audioMeterProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMeteringEnabled:", v3);

}

- (void)_createAudioPowerMeterIfNeeded
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  CSAudioPowerMeter *v7;
  CSAudioPowerMeter *powerMeter;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (CSIsTV()
    && !-[CSAudioRecordContext isTriggeredFromHearst](self->_audioRecordContext, "isTriggeredFromHearst"))
  {
    v9 = (void *)*MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      -[CSSpeechController recordRoute](self, "recordRoute");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136315394;
      v13 = "-[CSSpeechController _createAudioPowerMeterIfNeeded]";
      v14 = 2114;
      v15 = v11;
      _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s We don't need Audio Power Meter with record route %{public}@", (uint8_t *)&v12, 0x16u);

    }
    powerMeter = self->_powerMeter;
    self->_powerMeter = 0;
  }
  else
  {
    v3 = (void *)*MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      -[CSSpeechController recordRoute](self, "recordRoute");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136315394;
      v13 = "-[CSSpeechController _createAudioPowerMeterIfNeeded]";
      v14 = 2114;
      v15 = v5;
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Creating Audio Power Meter with record route %{public}@", (uint8_t *)&v12, 0x16u);

    }
    v6 = objc_alloc(MEMORY[0x1E0D18FF8]);
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    v7 = (CSAudioPowerMeter *)objc_msgSend(v6, "initWithSampleRate:");
    powerMeter = self->_powerMeter;
    self->_powerMeter = v7;
  }

}

- (unint64_t)outputReferenceChannel
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (CSIsHorseman())
    return objc_msgSend(MEMORY[0x1E0D19090], "channelForOutputReference");
  v3 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSSpeechController outputReferenceChannel]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Not available", (uint8_t *)&v4, 0xCu);
  }
  return -1;
}

- (id)voiceTriggerInfo
{
  id *v3;
  NSObject *v4;
  void *v5;
  NSObject *queue;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[6];
  uint8_t v13[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int128 buf;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (id *)MEMORY[0x1E0D18F48];
  v4 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[CSSpeechController voiceTriggerInfo]";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__7979;
  v20 = __Block_byref_object_dispose__7980;
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __38__CSSpeechController_voiceTriggerInfo__block_invoke;
  v12[3] = &unk_1E7C29228;
  v12[4] = self;
  v12[5] = &buf;
  dispatch_async_and_wait(queue, v12);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *v3;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "timeIntervalSinceDate:", v5);
    *(_DWORD *)v13 = 136315394;
    v14 = "-[CSSpeechController voiceTriggerInfo]";
    v15 = 2050;
    v16 = v9;
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s fetch lastVoiceTriggerInfo elapsed time = %{public}lf", v13, 0x16u);
  }

  objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "removeObjectForKey:", *MEMORY[0x1E0D194A0]);
  objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "removeObjectForKey:", *MEMORY[0x1E0D19490]);
  objc_msgSend(MEMORY[0x1E0DC8668], "sanitizeEventInfoForLogging:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&buf, 8);
  return v10;
}

- (void)continuousVoiceTrigger:(id)a3 detectedVoiceTriggerResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7
    && (v9 = *MEMORY[0x1E0D19728],
        objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D19728]),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedLongLongValue");

    if (CSIsHorseman() && !self->_endpointId)
    {
      mach_absolute_time();
      AFSiriActivationContinuousVoiceTriggerDetected();
    }
    else
    {
      +[CSMyriadPHash notifyHashlessTrigger:](CSMyriadPHash, "notifyHashlessTrigger:", v12);
    }
  }
  else
  {
    v13 = *MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_ERROR))
    {
      v14 = 136315138;
      v15 = "-[CSSpeechController continuousVoiceTrigger:detectedVoiceTriggerResult:]";
      _os_log_error_impl(&dword_1C2614000, v13, OS_LOG_TYPE_ERROR, "%s Unable to notify to Myriad for continuous VoiceTrigger : Cannot find VTEITriggerEndMachTime from VTEI", (uint8_t *)&v14, 0xCu);
    }
  }

}

- (void)continuousVoiceTrigger:(id)a3 detectedSilenceAfterVoiceTriggerAt:(double)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__CSSpeechController_continuousVoiceTrigger_detectedSilenceAfterVoiceTriggerAt___block_invoke;
  block[3] = &unk_1E7C28520;
  block[4] = self;
  block[5] = a2;
  *(double *)&block[6] = a4;
  dispatch_async(queue, block);
}

- (void)_startTwoShotFeedbackDecisionForDetectionAtTime:(double)a3
{
  NSObject *v5;
  NSObject *audibleFeedbackQueue;
  NSObject *v7;
  _QWORD block[7];
  _BYTE buf[24];
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  self->_hasRequestedTwoShotFeedback = 1;
  if (objc_msgSend(MEMORY[0x1E0D19260], "shouldDelayTwoShotFeedbackForMyriadDecision"))
  {
    v5 = *MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[CSSpeechController _startTwoShotFeedbackDecisionForDetectionAtTime:]";
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Waiting for myriad decision to continue with two shot", buf, 0xCu);
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v10 = 0.0;
    v10 = (double)mach_absolute_time();
    audibleFeedbackQueue = self->_audibleFeedbackQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__CSSpeechController__startTwoShotFeedbackDecisionForDetectionAtTime___block_invoke;
    block[3] = &unk_1E7C26810;
    block[4] = self;
    block[5] = buf;
    *(double *)&block[6] = a3;
    dispatch_async(audibleFeedbackQueue, block);
    _Block_object_dispose(buf, 8);
  }
  else if (self->_isSiriClientListening)
  {
    v7 = *MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[CSSpeechController _startTwoShotFeedbackDecisionForDetectionAtTime:]";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = a3;
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Starting two shot feedback at: %lf", buf, 0x16u);
    }
    -[CSSpeechController _startFeedbackForTwoShotAtTime:](self, "_startFeedbackForTwoShotAtTime:", a3);
  }
}

- (void)endpointer:(id)a3 detectedTwoShotAtTime:(double)a4
{
  NSObject *queue;
  _QWORD v7[6];

  kdebug_trace();
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__CSSpeechController_endpointer_detectedTwoShotAtTime___block_invoke;
  v7[3] = &unk_1E7C29178;
  *(double *)&v7[5] = a4;
  v7[4] = self;
  dispatch_async(queue, v7);
}

- (void)keywordDetectorDidDetectKeyword
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__CSSpeechController_keywordDetectorDidDetectKeyword__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)fetchAudioMetricsWithCompletion:(id)a3
{
  id v4;
  NSObject *contextResetQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  contextResetQueue = self->_contextResetQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__CSSpeechController_fetchAudioMetricsWithCompletion___block_invoke;
  v7[3] = &unk_1E7C29150;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(contextResetQueue, v7);

}

- (CSEndpointAnalyzer)endpointAnalyzer
{
  return (CSEndpointAnalyzer *)self->_endpointerProxy;
}

- (void)setEndpointAnalyzerDelegate:(id)a3
{
  -[CSEndpointerProxy setEndpointerDelegate:](self->_endpointerProxy, "setEndpointerDelegate:", a3);
}

- (int64_t)_currentAudioRecorderSampleRate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  float v7;

  -[CSSpeechController streamProvider](self, "streamProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3
    && (objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C89970]),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "unsignedIntegerValue");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    v6 = (uint64_t)v7;
  }

  return v6;
}

- (void)resetEndpointer
{
  -[CSEndpointerProxy reset](self->_endpointerProxy, "reset");
}

- (void)processASRFeatures:(id)a3
{
  -[CSEndpointerProxy processASRFeatures:fromServer:](self->_endpointerProxy, "processASRFeatures:fromServer:", a3, 1);
}

- (void)setEndpointerOperationMode:(int64_t)a3
{
  -[CSEndpointerProxy setEndpointerOperationMode:](self->_endpointerProxy, "setEndpointerOperationMode:", a3);
}

- (BOOL)_shouldRunHybridSDSDMitigation
{
  void *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 isHybridUODEnabled;
  NSUUID *endpointId;
  CSRCHandlingXPCClient *rcHandlingClient;
  BOOL v9;
  int v11;
  const char *v12;
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  NSUUID *v16;
  __int16 v17;
  CSRCHandlingXPCClient *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "languageCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    isHybridUODEnabled = self->_isHybridUODEnabled;
    endpointId = self->_endpointId;
    rcHandlingClient = self->_rcHandlingClient;
    v11 = 136316162;
    v12 = "-[CSSpeechController _shouldRunHybridSDSDMitigation]";
    v13 = 1024;
    v14 = isHybridUODEnabled;
    v15 = 2112;
    v16 = endpointId;
    v17 = 2112;
    v18 = rcHandlingClient;
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s _isHybridUODEnabled: %d, _endpointId: %@, _rcHandlingClient: %@, languageCode: %@", (uint8_t *)&v11, 0x30u);
  }
  v9 = self->_isHybridUODEnabled && !self->_endpointId && self->_rcHandlingClient != 0;

  return v9;
}

- (void)processRCWithId:(unint64_t)a3 requestId:(id)a4 speechPackage:(id)a5 taskId:(id)a6 forceAccept:(BOOL)a7 completionHandler:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  CSEndpointerProxy *endpointerProxy;
  void *v19;
  double v20;
  double v21;
  _QWORD v22[4];
  id v23;

  v9 = a7;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  if (-[CSSpeechController _shouldRunHybridSDSDMitigation](self, "_shouldRunHybridSDSDMitigation"))
  {
    -[CSRCHandlingXPCClient processRCWithId:requestId:speechPackage:taskId:forceAccept:completionHandler:](self->_rcHandlingClient, "processRCWithId:requestId:speechPackage:taskId:forceAccept:completionHandler:", a3, v14, v15, v16, v9, v17);
  }
  else if (v9)
  {
    (*((void (**)(id, uint64_t, _QWORD, _QWORD))v17 + 2))(v17, 1, 0, 0);
  }
  else
  {
    endpointerProxy = self->_endpointerProxy;
    objc_msgSend(v15, "recognition");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "processedAudioDuration");
    v21 = v20;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __99__CSSpeechController_processRCWithId_requestId_speechPackage_taskId_forceAccept_completionHandler___block_invoke;
    v22[3] = &unk_1E7C24FC0;
    v23 = v17;
    -[CSEndpointerProxy shouldAcceptEagerResultForDuration:resultsCompletionHandler:](endpointerProxy, "shouldAcceptEagerResultForDuration:resultsCompletionHandler:", v22, v21);

  }
}

- (void)getMitigationDecisionForRCId:(unint64_t)a3 requestId:(id)a4 completion:(id)a5
{
  void (**v8)(id, _QWORD);
  id v9;

  v9 = a4;
  v8 = (void (**)(id, _QWORD))a5;
  if (-[CSSpeechController _shouldRunHybridSDSDMitigation](self, "_shouldRunHybridSDSDMitigation"))
    -[CSRCHandlingXPCClient getMitigationDecisionForRCIdWithCompletion:requestId:completion:](self->_rcHandlingClient, "getMitigationDecisionForRCIdWithCompletion:requestId:completion:", a3, v9, v8);
  else
    v8[2](v8, 0);

}

- (BOOL)_shouldUseSoundPlaybackMonitors
{
  if (self->_supportPhatic)
    return 1;
  else
    return CSIsTV();
}

- (BOOL)_shouldTrackLaunchLatency
{
  NSDictionary *lastVoiceTriggerInfo;
  void *v4;
  BOOL v5;

  if (!CSIsIOS())
    return 0;
  if (!-[CSAudioRecordContext isBuiltInVoiceTriggered](self->_audioRecordContext, "isBuiltInVoiceTriggered"))return 0;
  if (!-[CSSpeechController _isRecordRouteBuiltinMic](self, "_isRecordRouteBuiltinMic"))
    return 0;
  lastVoiceTriggerInfo = self->_lastVoiceTriggerInfo;
  if (!lastVoiceTriggerInfo)
    return 0;
  -[NSDictionary objectForKeyedSubscript:](lastVoiceTriggerInfo, "objectForKeyedSubscript:", *MEMORY[0x1E0D19758]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (void)_logRecordingStopErrorIfNeeded:(int64_t)a3
{
  int v3;
  void *v4;
  _QWORD *v5;
  id v6;

  if (a3 == -11786)
  {
    v3 = objc_msgSend(MEMORY[0x1E0D19260], "supportNonInterruptibleSiri");
    objc_msgSend(MEMORY[0x1E0D190B8], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    v5 = (_QWORD *)MEMORY[0x1E0D19360];
    if (!v3)
      v5 = (_QWORD *)MEMORY[0x1E0D19300];
    objc_msgSend(v4, "submitAudioIssueReport:", *v5);

  }
}

- (id)_fetchAudioDecoderForTV:(unsigned int)a3
{
  uint64_t v3;
  NSMutableDictionary *decodersForTV;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  id v11;
  char *v12;
  uint64_t *v13;
  NSObject *v14;
  NSMutableDictionary *v15;
  NSObject *v17;
  uint64_t v18;
  char v19;
  char v20;
  char v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v3 = *(_QWORD *)&a3;
  v26 = *MEMORY[0x1E0C80C00];
  decodersForTV = self->_decodersForTV;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](decodersForTV, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = self->_decodersForTV;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

    return v10;
  }
  if ((_DWORD)v3 == 1869641075)
  {
    v11 = objc_alloc(MEMORY[0x1E0D18FE0]);
    objc_msgSend(MEMORY[0x1E0D190F8], "opusASBD");
    objc_msgSend(MEMORY[0x1E0D190F8], "lpcmInt16ASBD");
    v12 = &v19;
    v13 = &v18;
    goto LABEL_7;
  }
  if ((_DWORD)v3 == 1936745848)
  {
    v11 = objc_alloc(MEMORY[0x1E0D18FE0]);
    objc_msgSend(MEMORY[0x1E0D190F8], "speexASBD");
    objc_msgSend(MEMORY[0x1E0D190F8], "lpcmInt16ASBD");
    v12 = &v21;
    v13 = (uint64_t *)&v20;
LABEL_7:
    v10 = (void *)objc_msgSend(v11, "initWithInASBD:outASBD:", v12, v13);
    v14 = *MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[CSSpeechController _fetchAudioDecoderForTV:]";
      v24 = 1026;
      v25 = v3;
      _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_DEFAULT, "%s Create audioDecoder for audioFormat %{public}u", buf, 0x12u);
    }
    objc_msgSend(v10, "setDelegate:", self);
    v15 = self->_decodersForTV;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v10, v9);
    goto LABEL_10;
  }
  v17 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[CSSpeechController _fetchAudioDecoderForTV:]";
    v24 = 1026;
    v25 = v3;
    _os_log_error_impl(&dword_1C2614000, v17, OS_LOG_TYPE_ERROR, "%s Unexpected audioFormat for ATV : %{public}u", buf, 0x12u);
  }
  return 0;
}

- (BOOL)_fetchAudioProviderWithContext:(id)a3
{
  id v4;
  CSXPCClient *xpcClient;
  BOOL v6;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_contextResetQueue);
  xpcClient = self->_xpcClient;
  if (xpcClient && -[CSXPCClient isConnected](xpcClient, "isConnected"))
  {
    v6 = 1;
    if (!-[CSXPCClient prepareAudioProviderWithContext:clientType:error:](self->_xpcClient, "prepareAudioProviderWithContext:clientType:error:", v4, 1, 0))
    {
      -[CSSpeechController _teardownAudioProviderIfNeeded](self, "_teardownAudioProviderIfNeeded");
      v6 = 0;
    }
  }
  else
  {
    v6 = -[CSSpeechController _createAudioProviderFromXPCWithContext:](self, "_createAudioProviderFromXPCWithContext:", v4);
  }

  return v6;
}

- (BOOL)_createAudioProviderFromXPCWithContext:(id)a3
{
  id v4;
  CSXPCClient *xpcClient;
  BOOL v6;
  os_log_t *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  os_log_t *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  xpcClient = self->_xpcClient;
  if (xpcClient)
  {
    if (-[CSXPCClient isConnected](xpcClient, "isConnected"))
    {
      v6 = 1;
      goto LABEL_17;
    }
  }
  else
  {
    v7 = (os_log_t *)MEMORY[0x1E0D18F48];
    v8 = *MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315138;
      v17 = "-[CSSpeechController _createAudioProviderFromXPCWithContext:]";
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Creating xpcClient", (uint8_t *)&v16, 0xCu);
    }
    -[CSXPCClientFactory clientForAudioProviding](self->_xpcClientFactory, "clientForAudioProviding");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v14 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
      {
        v16 = 136315138;
        v17 = "-[CSSpeechController _createAudioProviderFromXPCWithContext:]";
        _os_log_error_impl(&dword_1C2614000, v14, OS_LOG_TYPE_ERROR, "%s Unable to setup audioProvider", (uint8_t *)&v16, 0xCu);
      }
      goto LABEL_16;
    }
    v10 = (void *)v9;
    -[CSSpeechController setXpcClient:](self, "setXpcClient:", v9);
    objc_msgSend(v10, "setDelegate:", self);

  }
  v11 = (os_log_t *)MEMORY[0x1E0D18F48];
  v12 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315138;
    v17 = "-[CSSpeechController _createAudioProviderFromXPCWithContext:]";
    _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s Establishing xpcClient connection...", (uint8_t *)&v16, 0xCu);
  }
  -[CSSpeechController _setupAudioProviderFromXPC:](self, "_setupAudioProviderFromXPC:", self->_xpcClient);
  -[CSXPCClient connect](self->_xpcClient, "connect");
  v6 = 1;
  if (!-[CSXPCClient prepareAudioProviderWithContext:clientType:error:](self->_xpcClient, "prepareAudioProviderWithContext:clientType:error:", v4, 1, 0))
  {
    v13 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
    {
      v16 = 136315138;
      v17 = "-[CSSpeechController _createAudioProviderFromXPCWithContext:]";
      _os_log_error_impl(&dword_1C2614000, v13, OS_LOG_TYPE_ERROR, "%s Unable to prepareAudioProvider in _xpcClient, teardown XPC connection again", (uint8_t *)&v16, 0xCu);
    }
    -[CSSpeechController _teardownAudioProviderIfNeeded](self, "_teardownAudioProviderIfNeeded");
LABEL_16:
    v6 = 0;
  }
LABEL_17:

  return v6;
}

- (void)_setupAudioProviderFromXPC:(id)a3
{
  void *v4;
  void *v5;
  _BOOL4 v6;
  CSContinuousVoiceTrigger *continuousVoiceTrigger;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[CSSpeechController setStreamProvider:](self, "setStreamProvider:", v10);
  -[CSSpeechController setSessionProvider:](self, "setSessionProvider:", v10);
  -[CSSpeechController setAlertProvider:](self, "setAlertProvider:", v10);
  -[CSSpeechController setAudioMeterProvider:](self, "setAudioMeterProvider:", v10);
  -[CSSpeechController setAudioMetricProvider:](self, "setAudioMetricProvider:", v10);
  -[CSSpeechController sessionProvider](self, "sessionProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAudioSessionDelegate:", self);

  -[CSSpeechController alertProvider](self, "alertProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAudioAlertDelegate:", self);

  v6 = -[CSSpeechController _isHubRequestTV](self, "_isHubRequestTV");
  continuousVoiceTrigger = self->_continuousVoiceTrigger;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D19068], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "defaultConverter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSContinuousVoiceTrigger setAudioTimeConverter:](continuousVoiceTrigger, "setAudioTimeConverter:", v9);

  }
  else
  {
    -[CSContinuousVoiceTrigger setAudioTimeConverter:](continuousVoiceTrigger, "setAudioTimeConverter:", v10);
  }

}

- (id)_fetchFallbackAudioSessionReleaseProviding
{
  void *v2;

  -[CSXPCClientFactory clientForFallbackAudioSessionReleaseProviding](self->_xpcClientFactory, "clientForFallbackAudioSessionReleaseProviding");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connect");
  return v2;
}

- (id)_getSpeechIdentifier
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;

  _AFPreferencesValueForKey();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    objc_msgSend(v2, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CSKeychainValueForAccountAndKey(v6, CFSTR("Speech Identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v7, 4);
  }
  else
  {
    v8 = &stru_1E7C296E8;
  }

  return v8;
}

- (void)_deviceAudioLoggingWithFileWriter:(id)a3
{
  void *v4;
  id v5;
  id v6;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0D18FE8];
    v5 = a3;
    -[CSSpeechController _getSpeechIdentifier](self, "_getSpeechIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "generateDeviceAudioLogging:speechId:", v5, v6);

  }
}

- (id)_contextToString:(id)a3
{
  void *v3;
  int v4;

  if (!a3)
    return CFSTR("none");
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0C899F0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntValue");

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c%c%c%c"), (v4 >> 24), (v4 << 8 >> 24), ((__int16)v4 >> 8), (char)v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_canPlayTwoShotFeedbackDuringMediaPlayback
{
  if ((-[CSAudioRecordContext isJarvisVoiceTriggered](self->_audioRecordContext, "isJarvisVoiceTriggered") & 1) != 0)
    return 1;
  else
    return -[CSAudioRecordContext isHearstVoiceTriggered](self->_audioRecordContext, "isHearstVoiceTriggered");
}

- (float)_scheduledAudibleFeedbackDelay
{
  return 0.35;
}

- (unint64_t)_audibleFeedbackPlaybackReason
{
  return 3;
}

- (double)lastEndOfVoiceActivityTime
{
  double result;

  -[CSEndpointerProxy lastEndOfVoiceActivityTime](self->_endpointerProxy, "lastEndOfVoiceActivityTime");
  return result;
}

- (id)endpointerModelVersion
{
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  __CFString *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D19260], "supportHybridEndpointer") & 1) != 0)
  {
    if (self->_isAsrOnDevice)
    {
      v3 = *MEMORY[0x1E0D18F48];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136315138;
        v10 = "-[CSSpeechController endpointerModelVersion]";
        v4 = "%s return hybrid model version for sirix request";
LABEL_12:
        _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v9, 0xCu);
      }
    }
    else
    {
      if ((CSIsHorseman() & 1) == 0 && !AFShouldRunAsrOnServerForUOD())
      {
        -[CSEndpointerProxy endpointerModelVersion](self->_endpointerProxy, "endpointerModelVersion");
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v8 = *MEMORY[0x1E0D18F48];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
        {
          v9 = 136315394;
          v10 = "-[CSSpeechController endpointerModelVersion]";
          v11 = 2114;
          v12 = v7;
          _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Queried endpointerModelVersion: %{public}@", (uint8_t *)&v9, 0x16u);
        }
        return v7;
      }
      v3 = *MEMORY[0x1E0D18F48];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136315138;
        v10 = "-[CSSpeechController endpointerModelVersion]";
        v4 = "%s return hybrid model version for request on HomePod or supported device + locale";
        goto LABEL_12;
      }
    }
    v7 = CFSTR("3");
    return v7;
  }
  v5 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[CSSpeechController endpointerModelVersion]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s endpointerModelVersion called when HEP is not supported", (uint8_t *)&v9, 0xCu);
  }
  return CFSTR("NA");
}

- (void)updateEndpointerThreshold:(float)a3
{
  -[CSEndpointerProxy updateEndpointerThreshold:](self->_endpointerProxy, "updateEndpointerThreshold:");
}

- (void)updateEndpointerDelayedTrigger:(BOOL)a3
{
  -[CSEndpointerProxy updateEndpointerDelayedTrigger:](self->_endpointerProxy, "updateEndpointerDelayedTrigger:", a3);
}

- (void)shouldAcceptEagerResultForDuration:(double)a3 resultsCompletionHandler:(id)a4
{
  -[CSEndpointerProxy shouldAcceptEagerResultForDuration:resultsCompletionHandler:](self->_endpointerProxy, "shouldAcceptEagerResultForDuration:resultsCompletionHandler:", a4, a3);
}

- (BOOL)isSmartSiriVolumeAvailable
{
  if ((CSIsHorseman() & 1) != 0)
    return 1;
  else
    return CSIsHorsemanJunior();
}

- (float)getVolumeForTTSType:(unint64_t)a3
{
  float v3;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *ssvLogFilePath;
  float v9;

  if (self->_endpointId)
    return -1000.0;
  -[CSSmartSiriVolumeController getVolumeForTTSType:withContext:](self->_volumeController, "getVolumeForTTSType:withContext:", a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "debugLogPath");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    ssvLogFilePath = self->_ssvLogFilePath;
    self->_ssvLogFilePath = v7;

    objc_msgSend(v6, "volumeEstimate");
    v3 = v9;
  }
  else
  {
    v3 = -1000.0;
  }

  return v3;
}

- (float)getSmartSiriVolume
{
  float result;

  -[CSSpeechController getVolumeForTTSType:](self, "getVolumeForTTSType:", 2);
  return result;
}

- (void)setSmartSiriVolumePercentage:(float)a3
{
  id WeakRetained;

  if (!self->_endpointId)
  {
    -[CSSmartSiriVolumeController setSmartSiriVolumePercentage:](self->_volumeController, "setSmartSiriVolumePercentage:");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "speechControllerDidUpdateSmartSiriVolume:forReason:", self, 4);

  }
}

- (void)setSmartSiriVolumeDirection:(BOOL)a3
{
  id WeakRetained;

  if (!self->_endpointId)
  {
    -[CSSmartSiriVolumeController setSmartSiriVolumeDirection:](self->_volumeController, "setSmartSiriVolumeDirection:", a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "speechControllerDidUpdateSmartSiriVolume:forReason:", self, 4);

  }
}

- (void)setPermanentVolumeOffsetWithDirection:(BOOL)a3
{
  id WeakRetained;

  if (!self->_endpointId)
  {
    -[CSSmartSiriVolumeController setPermanentVolumeOffsetWithDirection:](self->_volumeController, "setPermanentVolumeOffsetWithDirection:", a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "speechControllerDidUpdateSmartSiriVolume:forReason:", self, 4);

  }
}

- (void)languageDetectorSetMostRecentRecognitionLanguage:(id)a3
{
  -[CSLanguageDetector setMostRecentRecognitionLanguage:](self->_languageDetector, "setMostRecentRecognitionLanguage:", a3);
}

- (void)cancelCurrentLanguageDetectorRequest
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__CSSpeechController_cancelCurrentLanguageDetectorRequest__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)setLanguageDetectorInteractionID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__CSSpeechController_setLanguageDetectorInteractionID___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)beginWaitingForMyriad
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSSpeechController beginWaitingForMyriad]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Received Myriad started", (uint8_t *)&v4, 0xCu);
  }
  if (objc_msgSend(MEMORY[0x1E0D19260], "shouldDelayTwoShotFeedbackForMyriadDecision"))
    dispatch_group_enter((dispatch_group_t)self->_twoShotAudibleFeedbackDecisionGroup);
}

- (void)endWaitingForMyriadWithDecision:(unint64_t)a3
{
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[CSSpeechController endWaitingForMyriadWithDecision:]";
    v8 = 2048;
    v9 = a3;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Received Myriad finished with decision: %tu", (uint8_t *)&v6, 0x16u);
  }
  if (objc_msgSend(MEMORY[0x1E0D19260], "shouldDelayTwoShotFeedbackForMyriadDecision"))
  {
    self->_myriadPreventingTwoShotFeedback = a3 > 1;
    dispatch_group_leave((dispatch_group_t)self->_twoShotAudibleFeedbackDecisionGroup);
  }
}

- (void)_setSoundPlayingState
{
  _BOOL4 isMediaPlaying;
  _BOOL4 isAlarmPlaying;
  _BOOL4 isTimerPlaying;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const __CFString *v10;
  __int16 v11;
  _BOOL4 v12;
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  isMediaPlaying = self->_isMediaPlaying;
  isAlarmPlaying = self->_isAlarmPlaying;
  isTimerPlaying = self->_isTimerPlaying;
  self->_isSoundPlaying = isAlarmPlaying || isMediaPlaying || isTimerPlaying;
  v5 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    v6 = &stru_1E7C296E8;
    v7 = 136316162;
    v8 = "-[CSSpeechController _setSoundPlayingState]";
    v9 = 2114;
    if (!isAlarmPlaying && !isMediaPlaying && !isTimerPlaying)
      v6 = CFSTR(" NOT");
    v10 = v6;
    v11 = 1024;
    v12 = isMediaPlaying;
    v13 = 1024;
    v14 = isAlarmPlaying;
    v15 = 1024;
    v16 = isTimerPlaying;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Detected sound is%{public}@ playing: media(%d) alarm(%d) timer(%d)", (uint8_t *)&v7, 0x28u);
  }
}

- (void)speakerRecognitionController:(id)a3 hasSpeakerInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__CSSpeechController_speakerRecognitionController_hasSpeakerInfo___block_invoke;
  block[3] = &unk_1E7C291C0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)speakerRecognitionFinishedProcessing:(id)a3 withFinalSpeakerInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__CSSpeechController_speakerRecognitionFinishedProcessing_withFinalSpeakerInfo___block_invoke;
  block[3] = &unk_1E7C291C0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)didReceiveSpeakerRecognitionScoreCard:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__CSSpeechController_didReceiveSpeakerRecognitionScoreCard___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)didFinishSpeakerRecognition:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__CSSpeechController_didFinishSpeakerRecognition___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (id)_processSpeakerRecognitionResult:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  CSVolumeMonitor *volumeMonitor;
  void *v19;
  void *v20;
  void *v21;
  int v23;
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = *MEMORY[0x1E0DA8CE0];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DA8CE0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSSpeechController _mapScoresToSharedSiriId:](self, "_mapScoresToSharedSiriId:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    +[CSUserIdentityClassifier pickTopScoringProfileIdFromScores:](CSUserIdentityClassifier, "pickTopScoringProfileIdFromScores:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("userClassified"));
    }
    else
    {
      v10 = *MEMORY[0x1E0D18F48];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_ERROR))
      {
        v23 = 136315394;
        v24 = "-[CSSpeechController _processSpeakerRecognitionResult:]";
        v25 = 2114;
        v26 = v8;
        _os_log_error_impl(&dword_1C2614000, v10, OS_LOG_TYPE_ERROR, "%s ERR: Failed to get classified user from %{public}@", (uint8_t *)&v23, 0x16u);
      }
    }
    v11 = *MEMORY[0x1E0D19590];
    -[NSDictionary objectForKey:](self->_lastVoiceTriggerInfo, "objectForKey:", *MEMORY[0x1E0D19590]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[NSDictionary objectForKeyedSubscript:](self->_lastVoiceTriggerInfo, "objectForKeyedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "integerValue");

    }
    else
    {
      v14 = 0;
    }

    v15 = +[CSUserIdentityClassifier classifyUserIdentityFor:withScores:withAsset:withPhId:](CSUserIdentityClassifier, "classifyUserIdentityFor:withScores:withAsset:withPhId:", v9, v8, self->_asset, v14);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("userIdentityClassification"));

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, v6);
  }
  if (self->_mediaPlayingMonitor)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isMediaPlaying);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("mediaPlayState"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E7C63908, CFSTR("mediaPlayState"));
  }
  volumeMonitor = self->_volumeMonitor;
  if (volumeMonitor)
  {
    v19 = (void *)MEMORY[0x1E0CB37E8];
    -[CSVolumeMonitor musicVolume](volumeMonitor, "musicVolume");
    objc_msgSend(v19, "numberWithFloat:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("musicVolume"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E7C63908, CFSTR("musicVolume"));
  }
  v21 = (void *)objc_msgSend(v5, "copy");

  return v21;
}

- (id)_mapScoresToSharedSiriId:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  float v16;
  float v17;
  float v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  uint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E08];
  if (objc_msgSend(v4, "count"))
    v6 = objc_msgSend(v4, "count");
  else
    v6 = 1;
  objc_msgSend(v5, "dictionaryWithCapacity:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v30;
    *(_QWORD *)&v10 = 136315394;
    v28 = v10;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", v14, v28, (_QWORD)v29);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "floatValue");
        v17 = v16;

        if (v17 <= 1.0)
          v18 = v17;
        else
          v18 = 1.0;
        if (v18 < 0.0)
          v18 = 0.0;
        v19 = (int)vcvtpd_s64_f64(v18 * 100.0);
        -[SSRVoiceProfileManager voiceProfileForId:](self->_voiceProfileManager, "voiceProfileForId:", v14);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v20)
        {
          objc_msgSend(v20, "siriProfileId");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v19);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            objc_msgSend(v21, "siriProfileId");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKey:", v23, v24);

            goto LABEL_21;
          }
        }
        else
        {
          v25 = *MEMORY[0x1E0D18F48];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v28;
            v34 = "-[CSSpeechController _mapScoresToSharedSiriId:]";
            v35 = 2112;
            v36 = v14;
            _os_log_impl(&dword_1C2614000, v25, OS_LOG_TYPE_DEFAULT, "%s Voice Profile for profileID %@ not found", buf, 0x16u);
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v19);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v7, "setObject:forKey:", v23, v14);
LABEL_21:

      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v11);
  }

  v26 = (void *)objc_msgSend(v7, "copy");
  return v26;
}

- (void)CSSpeakerRecognitionAssetDownloadMonitor:(id)a3 didInstallNewAsset:(BOOL)a4 assetProviderType:(unint64_t)a5
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__CSSpeechController_CSSpeakerRecognitionAssetDownloadMonitor_didInstallNewAsset_assetProviderType___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)voiceTriggerAssetHandler:(id)a3 endpointId:(id)a4 didChangeCachedAsset:(id)a5
{
  id v8;
  unint64_t v9;
  id v10;
  NSUUID *endpointId;
  void *v12;
  uint64_t v13;
  NSObject *queue;
  _QWORD v15[5];
  id v16;

  v8 = a3;
  v9 = (unint64_t)a4;
  v10 = a5;
  endpointId = self->_endpointId;
  if (endpointId)
  {
    -[NSUUID UUIDString](endpointId, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", v9))
    {

LABEL_7:
      -[CSContinuousVoiceTrigger setAsset:](self->_continuousVoiceTrigger, "setAsset:", v10);
      queue = self->_queue;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __79__CSSpeechController_voiceTriggerAssetHandler_endpointId_didChangeCachedAsset___block_invoke;
      v15[3] = &unk_1E7C292A0;
      v15[4] = self;
      v16 = v10;
      dispatch_async(queue, v15);

      goto LABEL_8;
    }
    v13 = v9 | (unint64_t)self->_endpointId;

    if (!v13)
      goto LABEL_7;
  }
  else if (!v9)
  {
    goto LABEL_7;
  }
LABEL_8:

}

- (void)CSXPCClient:(id)a3 didDisconnect:(BOOL)a4
{
  id v5;
  NSObject *contextResetQueue;
  uint64_t v7;
  id v8;
  NSObject *queue;
  _QWORD v10[5];
  _QWORD block[4];
  id v12;
  CSSpeechController *v13;

  v5 = a3;
  contextResetQueue = self->_contextResetQueue;
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CSSpeechController_CSXPCClient_didDisconnect___block_invoke;
  block[3] = &unk_1E7C292A0;
  v12 = v5;
  v13 = self;
  v8 = v5;
  dispatch_async(contextResetQueue, block);
  queue = self->_queue;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __48__CSSpeechController_CSXPCClient_didDisconnect___block_invoke_298;
  v10[3] = &unk_1E7C292C8;
  v10[4] = self;
  dispatch_async(queue, v10);

}

- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[CSSpeechController CSLanguageCodeUpdateMonitor:didReceiveLanguageCodeChanged:]";
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s _currentLanguageCode changed: %{public}@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__CSSpeechController_CSLanguageCodeUpdateMonitor_didReceiveLanguageCodeChanged___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);

}

- (void)_teardownAudioProviderIfNeeded
{
  CSXPCClient *xpcClient;
  NSObject *v4;
  NSObject *queue;
  CSXPCClient *duckAudioXPCClient;
  CSXPCClient *v7;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_contextResetQueue);
  xpcClient = self->_xpcClient;
  if (xpcClient)
  {
    -[CSXPCClient disconnect](xpcClient, "disconnect");
    v4 = *MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[CSSpeechController _teardownAudioProviderIfNeeded]";
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }
    -[CSSpeechController setStreamProvider:](self, "setStreamProvider:", 0);
    -[CSSpeechController setSessionProvider:](self, "setSessionProvider:", 0);
    -[CSSpeechController setAlertProvider:](self, "setAlertProvider:", 0);
    -[CSSpeechController setAudioMeterProvider:](self, "setAudioMeterProvider:", 0);
    -[CSSpeechController setAudioMetricProvider:](self, "setAudioMetricProvider:", 0);
    -[CSSpeechController setAudioStream:](self, "setAudioStream:", 0);
    -[CSContinuousVoiceTrigger setAudioTimeConverter:](self->_continuousVoiceTrigger, "setAudioTimeConverter:", 0);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__CSSpeechController__teardownAudioProviderIfNeeded__block_invoke;
    block[3] = &unk_1E7C292C8;
    block[4] = self;
    dispatch_async(queue, block);
  }
  duckAudioXPCClient = self->_duckAudioXPCClient;
  if (duckAudioXPCClient)
  {
    -[CSXPCClient setDelegate:](duckAudioXPCClient, "setDelegate:", 0);
    -[CSXPCClient disconnect](self->_duckAudioXPCClient, "disconnect");
    v7 = self->_duckAudioXPCClient;
    self->_duckAudioXPCClient = 0;

  }
}

- (void)_setMediaPlaybackState:(BOOL)a3 isInterrupted:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  NSObject *v7;
  NSUUID *endpointId;
  void *v9;
  void *v10;
  _BOOL8 isMediaPlaying;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  NSUUID *v18;
  uint64_t v19;

  v4 = a4;
  v5 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  self->_isMediaPlaying = a3;
  v7 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    endpointId = self->_endpointId;
    v13 = 136315651;
    v14 = "-[CSSpeechController _setMediaPlaybackState:isInterrupted:]";
    v15 = 1026;
    v16 = v5;
    v17 = 2113;
    v18 = endpointId;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Playback is active: %{public}d on accessory: %{private}@", (uint8_t *)&v13, 0x1Cu);
  }
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_endpointId, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  isMediaPlaying = self->_isMediaPlaying;
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "systemUptime");
  objc_msgSend(v9, "setIsMediaPlayingOnAccessory:isMediaPlaying:isInterrupted:interruptedTime:", v10, isMediaPlaying, v4);

}

- (void)_setAlarmIsPlaying:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSUUID *endpointId;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  _BOOL4 v12;
  __int16 v13;
  NSUUID *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  self->_isAlarmPlaying = a3;
  v5 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    endpointId = self->_endpointId;
    v9 = 136315651;
    v10 = "-[CSSpeechController _setAlarmIsPlaying:]";
    v11 = 1026;
    v12 = v3;
    v13 = 2113;
    v14 = endpointId;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Alarm is playing: %{public}d on accessory: %{private}@", (uint8_t *)&v9, 0x1Cu);
  }
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_endpointId, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIsAlarmPlayingOnAccessory:isAlarmPlaying:", v8, self->_isAlarmPlaying);

}

- (void)_setTimerIsPlaying:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSUUID *endpointId;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  _BOOL4 v12;
  __int16 v13;
  NSUUID *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  self->_isTimerPlaying = a3;
  v5 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    endpointId = self->_endpointId;
    v9 = 136315651;
    v10 = "-[CSSpeechController _setTimerIsPlaying:]";
    v11 = 1026;
    v12 = v3;
    v13 = 2113;
    v14 = endpointId;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Timer is playing: %{public}d on accessory: %{private}@", (uint8_t *)&v9, 0x1Cu);
  }
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_endpointId, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIsTimerPlayingOnAccessory:isTimerPlaying:", v8, self->_isTimerPlaying);

}

- (void)nowPlayingObserver:(id)a3 playbackStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5 lastPlayingDate:(id)a6
{
  NSObject *queue;
  _QWORD v7[6];

  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __87__CSSpeechController_nowPlayingObserver_playbackStateDidChangeFrom_to_lastPlayingDate___block_invoke;
  v7[3] = &unk_1E7C29178;
  v7[4] = self;
  v7[5] = a5;
  dispatch_async(queue, v7);
}

- (void)clockAlarmObserver:(id)a3 alarmDidFire:(id)a4
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CSSpeechController_clockAlarmObserver_alarmDidFire___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)clockAlarmObserver:(id)a3 alarmDidDismiss:(id)a4
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__CSSpeechController_clockAlarmObserver_alarmDidDismiss___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)clockTimerObserver:(id)a3 timerDidFire:(id)a4
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CSSpeechController_clockTimerObserver_timerDidFire___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)clockTimerObserver:(id)a3 timerDidDismiss:(id)a4
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__CSSpeechController_clockTimerObserver_timerDidDismiss___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_fetchMetricsAndLog
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  if (arc4random_uniform(0x64u) <= 9)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", self->_requestMHUUID);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __41__CSSpeechController__fetchMetricsAndLog__block_invoke;
    v5[3] = &unk_1E7C24FE8;
    v6 = v3;
    v4 = v3;
    -[CSSpeechController fetchAudioMetricsWithCompletion:](self, "fetchAudioMetricsWithCompletion:", v5);

  }
}

- (id)getAudioConverterForTest
{
  return self->_audioConverter;
}

- (CSSpeechControllerDelegate)delegate
{
  return (CSSpeechControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CSLanguageDetectorDelegate)languageDetectorDelegate
{
  return (CSLanguageDetectorDelegate *)objc_loadWeakRetained((id *)&self->_languageDetectorDelegate);
}

- (void)setLanguageDetectorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_languageDetectorDelegate, a3);
}

- (CSSpeakerIdentificationDelegate)speakerIdDelegate
{
  return (CSSpeakerIdentificationDelegate *)objc_loadWeakRetained((id *)&self->_speakerIdDelegate);
}

- (void)setSpeakerIdDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_speakerIdDelegate, a3);
}

- (BOOL)supportPhatic
{
  return self->_supportPhatic;
}

- (void)setSupportPhatic:(BOOL)a3
{
  self->_supportPhatic = a3;
}

- (BOOL)supportHearstVoiceTrigger
{
  return self->_supportHearstVoiceTrigger;
}

- (void)setSupportHearstVoiceTrigger:(BOOL)a3
{
  self->_supportHearstVoiceTrigger = a3;
}

- (BOOL)supportTriagleModeSessionActivationRetry
{
  return self->_supportTriagleModeSessionActivationRetry;
}

- (void)setSupportTriagleModeSessionActivationRetry:(BOOL)a3
{
  self->_supportTriagleModeSessionActivationRetry = a3;
}

- (BOOL)supportSessionActivateDelay
{
  return self->_supportSessionActivateDelay;
}

- (void)setSupportSessionActivateDelay:(BOOL)a3
{
  self->_supportSessionActivateDelay = a3;
}

- (CSEndpointerProxy)endpointerProxy
{
  return self->_endpointerProxy;
}

- (void)setEndpointerProxy:(id)a3
{
  objc_storeStrong((id *)&self->_endpointerProxy, a3);
}

- (CSAudioRecordContext)audioRecordContext
{
  return self->_audioRecordContext;
}

- (void)setAudioRecordContext:(id)a3
{
  objc_storeStrong((id *)&self->_audioRecordContext, a3);
}

- (CSAudioStream)audioStream
{
  return self->_audioStream;
}

- (void)setAudioStream:(id)a3
{
  objc_storeStrong((id *)&self->_audioStream, a3);
}

- (CSAudioStreamProviding)streamProvider
{
  return self->_streamProvider;
}

- (void)setStreamProvider:(id)a3
{
  objc_storeStrong((id *)&self->_streamProvider, a3);
}

- (CSAudioSessionProviding)sessionProvider
{
  return self->_sessionProvider;
}

- (void)setSessionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_sessionProvider, a3);
}

- (CSAudioAlertProviding)alertProvider
{
  return self->_alertProvider;
}

- (void)setAlertProvider:(id)a3
{
  objc_storeStrong((id *)&self->_alertProvider, a3);
}

- (CSAudioMeterProviding)audioMeterProvider
{
  return self->_audioMeterProvider;
}

- (void)setAudioMeterProvider:(id)a3
{
  objc_storeStrong((id *)&self->_audioMeterProvider, a3);
}

- (CSAudioMetricProviding)audioMetricProvider
{
  return self->_audioMetricProvider;
}

- (void)setAudioMetricProvider:(id)a3
{
  objc_storeStrong((id *)&self->_audioMetricProvider, a3);
}

- (BOOL)isAsrOnDevice
{
  return self->_isAsrOnDevice;
}

- (void)setIsAsrOnDevice:(BOOL)a3
{
  self->_isAsrOnDevice = a3;
}

- (BOOL)isOpus
{
  return self->_isOpus;
}

- (void)setIsOpus:(BOOL)a3
{
  self->_isOpus = a3;
}

- (BOOL)isSiriClientListening
{
  return self->_isSiriClientListening;
}

- (void)setIsSiriClientListening:(BOOL)a3
{
  self->_isSiriClientListening = a3;
}

- (BOOL)hasRequestedTwoShotFeedback
{
  return self->_hasRequestedTwoShotFeedback;
}

- (void)setHasRequestedTwoShotFeedback:(BOOL)a3
{
  self->_hasRequestedTwoShotFeedback = a3;
}

- (BOOL)isNarrowBand
{
  return self->_isNarrowBand;
}

- (void)setIsNarrowBand:(BOOL)a3
{
  self->_isNarrowBand = a3;
}

- (CSPlainAudioFileWriter)audioFileWriter
{
  return self->_audioFileWriter;
}

- (void)setAudioFileWriter:(id)a3
{
  objc_storeStrong((id *)&self->_audioFileWriter, a3);
}

- (CSSelectiveChannelAudioFileWriter)serverLoggingWriter
{
  return self->_serverLoggingWriter;
}

- (void)setServerLoggingWriter:(id)a3
{
  objc_storeStrong((id *)&self->_serverLoggingWriter, a3);
}

- (CSSmartSiriVolumeController)volumeController
{
  return self->_volumeController;
}

- (void)setVolumeController:(id)a3
{
  objc_storeStrong((id *)&self->_volumeController, a3);
}

- (NSString)recordEventUUID
{
  return self->_recordEventUUID;
}

- (void)setRecordEventUUID:(id)a3
{
  objc_storeStrong((id *)&self->_recordEventUUID, a3);
}

- (BOOL)isAudioSessionActivated
{
  return self->_isAudioSessionActivated;
}

- (void)setIsAudioSessionActivated:(BOOL)a3
{
  self->_isAudioSessionActivated = a3;
}

- (NSDictionary)speakerRecognitionScores
{
  return self->_speakerRecognitionScores;
}

- (void)setSpeakerRecognitionScores:(id)a3
{
  objc_storeStrong((id *)&self->_speakerRecognitionScores, a3);
}

- (unint64_t)activeChannel
{
  return self->_activeChannel;
}

- (void)setActiveChannel:(unint64_t)a3
{
  self->_activeChannel = a3;
}

- (BOOL)twoShotNotificationEnabled
{
  return self->_twoShotNotificationEnabled;
}

- (void)setTwoShotNotificationEnabled:(BOOL)a3
{
  self->_twoShotNotificationEnabled = a3;
}

- (BOOL)isMediaPlaying
{
  return self->_isMediaPlaying;
}

- (void)setIsMediaPlaying:(BOOL)a3
{
  self->_isMediaPlaying = a3;
}

- (BOOL)isAlarmPlaying
{
  return self->_isAlarmPlaying;
}

- (void)setIsAlarmPlaying:(BOOL)a3
{
  self->_isAlarmPlaying = a3;
}

- (BOOL)isTimerPlaying
{
  return self->_isTimerPlaying;
}

- (void)setIsTimerPlaying:(BOOL)a3
{
  self->_isTimerPlaying = a3;
}

- (BOOL)isSoundPlaying
{
  return self->_isSoundPlaying;
}

- (void)setIsSoundPlaying:(BOOL)a3
{
  self->_isSoundPlaying = a3;
}

- (BOOL)isRemoteVADAvailableStream
{
  return self->_isRemoteVADAvailableStream;
}

- (void)setIsRemoteVADAvailableStream:(BOOL)a3
{
  self->_isRemoteVADAvailableStream = a3;
}

- (BOOL)myriadPreventingTwoShotFeedback
{
  return self->_myriadPreventingTwoShotFeedback;
}

- (void)setMyriadPreventingTwoShotFeedback:(BOOL)a3
{
  self->_myriadPreventingTwoShotFeedback = a3;
}

- (CSSpeechEndHostTimeEstimator)speechEndHostTimeEstimator
{
  return self->_speechEndHostTimeEstimator;
}

- (void)setSpeechEndHostTimeEstimator:(id)a3
{
  objc_storeStrong((id *)&self->_speechEndHostTimeEstimator, a3);
}

- (NSString)bundleIdFromDictation
{
  return self->_bundleIdFromDictation;
}

- (void)setBundleIdFromDictation:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdFromDictation, a3);
}

- (BOOL)isHybridUODEnabled
{
  return self->_isHybridUODEnabled;
}

- (void)setIsHybridUODEnabled:(BOOL)a3
{
  self->_isHybridUODEnabled = a3;
}

- (CSContinuousVoiceTrigger)continuousVoiceTrigger
{
  return self->_continuousVoiceTrigger;
}

- (void)setContinuousVoiceTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_continuousVoiceTrigger, a3);
}

- (CSLanguageDetector)languageDetector
{
  return self->_languageDetector;
}

- (void)setLanguageDetector:(id)a3
{
  objc_storeStrong((id *)&self->_languageDetector, a3);
}

- (BOOL)shouldUseLanguageDetectorForCurrentRequest
{
  return self->_shouldUseLanguageDetectorForCurrentRequest;
}

- (void)setShouldUseLanguageDetectorForCurrentRequest:(BOOL)a3
{
  self->_shouldUseLanguageDetectorForCurrentRequest = a3;
}

- (NSUUID)pendingAudioSessionActivationToken
{
  return self->_pendingAudioSessionActivationToken;
}

- (void)setPendingAudioSessionActivationToken:(id)a3
{
  objc_storeStrong((id *)&self->_pendingAudioSessionActivationToken, a3);
}

- (id)pendingAudioSessionActivationCompletion
{
  return self->_pendingAudioSessionActivationCompletion;
}

- (void)setPendingAudioSessionActivationCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (unint64_t)pendingAudioSessionActivationReason
{
  return self->_pendingAudioSessionActivationReason;
}

- (void)setPendingAudioSessionActivationReason:(unint64_t)a3
{
  self->_pendingAudioSessionActivationReason = a3;
}

- (CSXPCClientFactory)xpcClientFactory
{
  return self->_xpcClientFactory;
}

- (void)setXpcClientFactory:(id)a3
{
  objc_storeStrong((id *)&self->_xpcClientFactory, a3);
}

- (CSXPCClient)xpcClient
{
  return self->_xpcClient;
}

- (void)setXpcClient:(id)a3
{
  objc_storeStrong((id *)&self->_xpcClient, a3);
}

- (CSXPCClient)duckAudioXPCClient
{
  return self->_duckAudioXPCClient;
}

- (void)setDuckAudioXPCClient:(id)a3
{
  objc_storeStrong((id *)&self->_duckAudioXPCClient, a3);
}

- (float)cachedAvgPower
{
  return self->_cachedAvgPower;
}

- (void)setCachedAvgPower:(float)a3
{
  self->_cachedAvgPower = a3;
}

- (float)cachedPeakPower
{
  return self->_cachedPeakPower;
}

- (void)setCachedPeakPower:(float)a3
{
  self->_cachedPeakPower = a3;
}

- (CSAudioPowerMeter)powerMeter
{
  return self->_powerMeter;
}

- (void)setPowerMeter:(id)a3
{
  objc_storeStrong((id *)&self->_powerMeter, a3);
}

- (BOOL)didDeliverLastBuffer
{
  return self->_didDeliverLastBuffer;
}

- (void)setDidDeliverLastBuffer:(BOOL)a3
{
  self->_didDeliverLastBuffer = a3;
}

- (BOOL)didDeliverFirstSpeechPacket
{
  return self->_didDeliverFirstSpeechPacket;
}

- (void)setDidDeliverFirstSpeechPacket:(BOOL)a3
{
  self->_didDeliverFirstSpeechPacket = a3;
}

- (NSString)requestMHUUID
{
  return self->_requestMHUUID;
}

- (void)setRequestMHUUID:(id)a3
{
  objc_storeStrong((id *)&self->_requestMHUUID, a3);
}

- (BOOL)canPerformDelayedStop
{
  return self->_canPerformDelayedStop;
}

- (void)setCanPerformDelayedStop:(BOOL)a3
{
  self->_canPerformDelayedStop = a3;
}

- (BOOL)hasPerformedDelayedStop
{
  return self->_hasPerformedDelayedStop;
}

- (void)setHasPerformedDelayedStop:(BOOL)a3
{
  self->_hasPerformedDelayedStop = a3;
}

- (CSAudioStopStreamOption)requestedStopRecordingOptions
{
  return self->_requestedStopRecordingOptions;
}

- (void)setRequestedStopRecordingOptions:(id)a3
{
  objc_storeStrong((id *)&self->_requestedStopRecordingOptions, a3);
}

- (unint64_t)numTrailingSamplesAfterSchedulingStop
{
  return self->_numTrailingSamplesAfterSchedulingStop;
}

- (void)setNumTrailingSamplesAfterSchedulingStop:(unint64_t)a3
{
  self->_numTrailingSamplesAfterSchedulingStop = a3;
}

- (unint64_t)maxAllowedTrailingSamplesAfterSchedulingStop
{
  return self->_maxAllowedTrailingSamplesAfterSchedulingStop;
}

- (void)setMaxAllowedTrailingSamplesAfterSchedulingStop:(unint64_t)a3
{
  self->_maxAllowedTrailingSamplesAfterSchedulingStop = a3;
}

- (NSMutableDictionary)decodersForTV
{
  return self->_decodersForTV;
}

- (void)setDecodersForTV:(id)a3
{
  objc_storeStrong((id *)&self->_decodersForTV, a3);
}

- (unint64_t)decoderProcessedSampleCountForTV
{
  return self->_decoderProcessedSampleCountForTV;
}

- (void)setDecoderProcessedSampleCountForTV:(unint64_t)a3
{
  self->_decoderProcessedSampleCountForTV = a3;
}

- (NSString)logEventUUID
{
  return self->_logEventUUID;
}

- (void)setLogEventUUID:(id)a3
{
  objc_storeStrong((id *)&self->_logEventUUID, a3);
}

- (CSSpeakerRecognitionProxy)speakerRecognitionProxy
{
  return self->_speakerRecognitionProxy;
}

- (void)setSpeakerRecognitionProxy:(id)a3
{
  objc_storeStrong((id *)&self->_speakerRecognitionProxy, a3);
}

- (SSRSpeakerRecognitionController)speakerRecognitionController
{
  return self->_speakerRecognitionController;
}

- (void)setSpeakerRecognitionController:(id)a3
{
  objc_storeStrong((id *)&self->_speakerRecognitionController, a3);
}

- (SSRVoiceProfileManager)voiceProfileManager
{
  return self->_voiceProfileManager;
}

- (void)setVoiceProfileManager:(id)a3
{
  objc_storeStrong((id *)&self->_voiceProfileManager, a3);
}

- (CSAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (NSArray)ssrAssets
{
  return self->_ssrAssets;
}

- (void)setSsrAssets:(id)a3
{
  objc_storeStrong((id *)&self->_ssrAssets, a3);
}

- (NSString)ssvLogFilePath
{
  return self->_ssvLogFilePath;
}

- (void)setSsvLogFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_ssvLogFilePath, a3);
}

- (OS_dispatch_queue)mediaPlayingObserverQueue
{
  return self->_mediaPlayingObserverQueue;
}

- (void)setMediaPlayingObserverQueue:(id)a3
{
  objc_storeStrong((id *)&self->_mediaPlayingObserverQueue, a3);
}

- (SOMediaNowPlayingObserver)mediaPlayingMonitor
{
  return self->_mediaPlayingMonitor;
}

- (void)setMediaPlayingMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_mediaPlayingMonitor, a3);
}

- (SOClockAlarmObserver)alarmMonitor
{
  return self->_alarmMonitor;
}

- (void)setAlarmMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_alarmMonitor, a3);
}

- (SOClockTimerObserver)timerMonitor
{
  return self->_timerMonitor;
}

- (void)setTimerMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_timerMonitor, a3);
}

- (CSVolumeMonitor)volumeMonitor
{
  return self->_volumeMonitor;
}

- (void)setVolumeMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_volumeMonitor, a3);
}

- (CSFAudioDeviceInfo)audioDeviceInfoImpl
{
  return self->_audioDeviceInfoImpl;
}

- (void)setAudioDeviceInfoImpl:(id)a3
{
  objc_storeStrong((id *)&self->_audioDeviceInfoImpl, a3);
}

- (NSUUID)endpointId
{
  return self->_endpointId;
}

- (BOOL)setupStarted
{
  return self->_setupStarted;
}

- (void)setSetupStarted:(BOOL)a3
{
  self->_setupStarted = a3;
}

- (CSAudioSessionController)audioSessionController
{
  return self->_audioSessionController;
}

- (void)setAudioSessionController:(id)a3
{
  objc_storeStrong((id *)&self->_audioSessionController, a3);
}

- (CSRCHandlingXPCClient)rcHandlingClient
{
  return self->_rcHandlingClient;
}

- (void)setRcHandlingClient:(id)a3
{
  objc_storeStrong((id *)&self->_rcHandlingClient, a3);
}

- (CSUncompressedAudioLogging)uncompressedAudioLogging
{
  return self->_uncompressedAudioLogging;
}

- (void)setUncompressedAudioLogging:(id)a3
{
  objc_storeStrong((id *)&self->_uncompressedAudioLogging, a3);
}

- (id)supportsDuckingOnSpeakerOutputEvaluator
{
  return self->_supportsDuckingOnSpeakerOutputEvaluator;
}

- (void)setSupportsDuckingOnSpeakerOutputEvaluator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_supportsDuckingOnSpeakerOutputEvaluator, 0);
  objc_storeStrong((id *)&self->_uncompressedAudioLogging, 0);
  objc_storeStrong((id *)&self->_rcHandlingClient, 0);
  objc_storeStrong((id *)&self->_audioSessionController, 0);
  objc_storeStrong((id *)&self->_endpointId, 0);
  objc_storeStrong((id *)&self->_audioDeviceInfoImpl, 0);
  objc_storeStrong((id *)&self->_volumeMonitor, 0);
  objc_storeStrong((id *)&self->_timerMonitor, 0);
  objc_storeStrong((id *)&self->_alarmMonitor, 0);
  objc_storeStrong((id *)&self->_mediaPlayingMonitor, 0);
  objc_storeStrong((id *)&self->_mediaPlayingObserverQueue, 0);
  objc_storeStrong((id *)&self->_ssvLogFilePath, 0);
  objc_storeStrong((id *)&self->_ssrAssets, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_voiceProfileManager, 0);
  objc_storeStrong((id *)&self->_speakerRecognitionController, 0);
  objc_storeStrong((id *)&self->_speakerRecognitionProxy, 0);
  objc_storeStrong((id *)&self->_logEventUUID, 0);
  objc_storeStrong((id *)&self->_decodersForTV, 0);
  objc_storeStrong((id *)&self->_requestedStopRecordingOptions, 0);
  objc_storeStrong((id *)&self->_requestMHUUID, 0);
  objc_storeStrong((id *)&self->_powerMeter, 0);
  objc_storeStrong((id *)&self->_duckAudioXPCClient, 0);
  objc_storeStrong((id *)&self->_xpcClient, 0);
  objc_storeStrong((id *)&self->_xpcClientFactory, 0);
  objc_storeStrong(&self->_pendingAudioSessionActivationCompletion, 0);
  objc_storeStrong((id *)&self->_pendingAudioSessionActivationToken, 0);
  objc_storeStrong((id *)&self->_languageDetector, 0);
  objc_storeStrong((id *)&self->_continuousVoiceTrigger, 0);
  objc_storeStrong((id *)&self->_bundleIdFromDictation, 0);
  objc_storeStrong((id *)&self->_speechEndHostTimeEstimator, 0);
  objc_storeStrong((id *)&self->_speakerRecognitionScores, 0);
  objc_storeStrong((id *)&self->_recordEventUUID, 0);
  objc_storeStrong((id *)&self->_volumeController, 0);
  objc_storeStrong((id *)&self->_serverLoggingWriter, 0);
  objc_storeStrong((id *)&self->_audioFileWriter, 0);
  objc_storeStrong((id *)&self->_audioMetricProvider, 0);
  objc_storeStrong((id *)&self->_audioMeterProvider, 0);
  objc_storeStrong((id *)&self->_alertProvider, 0);
  objc_storeStrong((id *)&self->_sessionProvider, 0);
  objc_storeStrong((id *)&self->_streamProvider, 0);
  objc_storeStrong((id *)&self->_audioStream, 0);
  objc_storeStrong((id *)&self->_audioRecordContext, 0);
  objc_storeStrong((id *)&self->_endpointerProxy, 0);
  objc_destroyWeak((id *)&self->_speakerIdDelegate);
  objc_destroyWeak((id *)&self->_languageDetectorDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_twoShotAudibleFeedbackDecisionGroup, 0);
  objc_storeStrong((id *)&self->_audibleFeedbackQueue, 0);
  objc_storeStrong((id *)&self->_continuousZeroCounter, 0);
  objc_storeStrong((id *)&self->_lastRTSTriggerInfo, 0);
  objc_storeStrong((id *)&self->_lastVoiceTriggerInfo, 0);
  objc_storeStrong((id *)&self->_requestedRecordSettings, 0);
  objc_storeStrong((id *)&self->_downsampler, 0);
  objc_storeStrong((id *)&self->_audioConverter, 0);
  objc_storeStrong((id *)&self->_narrowBandOpusConverter, 0);
  objc_storeStrong((id *)&self->_opusAudioConverter, 0);
  objc_storeStrong((id *)&self->_contextResetQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
}

void __41__CSSpeechController__fetchMetricsAndLog__block_invoke(uint64_t a1, void *a2)
{
  char isKindOfClass;
  void *v4;
  void *v5;
  char v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = v22;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v22, "objectForKey:", *MEMORY[0x1E0C89A10]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v6 = objc_opt_isKindOfClass();
    v7 = (_QWORD *)MEMORY[0x1E0C89A20];
    v8 = (_QWORD *)MEMORY[0x1E0C89A28];
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0C89A20]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", *v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = objc_msgSend(v9, "unsignedLongLongValue");
          v12 = objc_msgSend(v10, "unsignedLongLongValue");
          if (v11)
          {
            if (v12)
            {
              objc_msgSend(MEMORY[0x1E0D190E8], "sharedLogger");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "logMHAssistantDaemonAudioSessionSetActivateContextWithMHUUID:withSetActivateStarted:", *(_QWORD *)(a1 + 32), 1);

              objc_msgSend(MEMORY[0x1E0D190E8], "sharedLogger");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "logMHAssistantDaemonAudioSessionSetActivateContextWithMHUUID:withSetActivateStarted:", *(_QWORD *)(a1 + 32), 0);

            }
          }
        }
      }

    }
    objc_msgSend(v22, "objectForKey:", *MEMORY[0x1E0C89A18]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v15, "objectForKey:", *v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", *v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v18 = objc_msgSend(v16, "unsignedLongLongValue");
          v19 = objc_msgSend(v17, "unsignedLongLongValue");
          if (v18)
          {
            if (v19)
            {
              objc_msgSend(MEMORY[0x1E0D190E8], "sharedLogger");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "logMHAssistantDaemonAudioSessionSetInactiveWithMHUUID:withSetInactiveStarted:", *(_QWORD *)(a1 + 32), 1);

              objc_msgSend(MEMORY[0x1E0D190E8], "sharedLogger");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "logMHAssistantDaemonAudioSessionSetInactiveWithMHUUID:withSetInactiveStarted:", *(_QWORD *)(a1 + 32), 0);

            }
          }
        }
      }

    }
    v4 = v22;
  }

}

uint64_t __57__CSSpeechController_clockTimerObserver_timerDidDismiss___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSSpeechController clockTimerObserver:timerDidDismiss:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Timer dismissed", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_setTimerIsPlaying:", 0);
}

uint64_t __54__CSSpeechController_clockTimerObserver_timerDidFire___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSSpeechController clockTimerObserver:timerDidFire:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Timer firing", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_setTimerIsPlaying:", 1);
}

uint64_t __57__CSSpeechController_clockAlarmObserver_alarmDidDismiss___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSSpeechController clockAlarmObserver:alarmDidDismiss:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Alarm dismissed", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_setAlarmIsPlaying:", 0);
}

uint64_t __54__CSSpeechController_clockAlarmObserver_alarmDidFire___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSSpeechController clockAlarmObserver:alarmDidFire:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Alarm firing", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_setAlarmIsPlaying:", 1);
}

uint64_t __87__CSSpeechController_nowPlayingObserver_playbackStateDidChangeFrom_to_lastPlayingDate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  _BOOL8 v5;
  uint64_t v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v8 = 136315394;
    v9 = "-[CSSpeechController nowPlayingObserver:playbackStateDidChangeFrom:to:lastPlayingDate:]_block_invoke";
    v10 = 1024;
    v11 = v3;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Now Playing State has changed %d", (uint8_t *)&v8, 0x12u);
  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 == 4)
  {
    v5 = 0;
    v6 = 1;
  }
  else
  {
    v5 = v4 == 1;
    v6 = 0;
  }
  return objc_msgSend(*(id *)(a1 + 32), "_setMediaPlaybackState:isInterrupted:", v5, v6);
}

uint64_t __52__CSSpeechController__teardownAudioProviderIfNeeded__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 121) = 0;
  return result;
}

uint64_t __80__CSSpeechController_CSLanguageCodeUpdateMonitor_didReceiveLanguageCodeChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_refreshSpeakerRecognitionAssets");
}

void __48__CSSpeechController_CSXPCClient_didDisconnect___block_invoke(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  _QWORD *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = (os_log_t *)MEMORY[0x1E0D18F48];
  v3 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[CSSpeechController CSXPCClient:didDisconnect:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s XPCConnection disconnected", (uint8_t *)&v6, 0xCu);
  }
  v4 = *(_QWORD **)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == v4[43])
  {
    v5 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[CSSpeechController CSXPCClient:didDisconnect:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s reset audioProvider since xpcClient disconnected", (uint8_t *)&v6, 0xCu);
      v4 = *(_QWORD **)(a1 + 40);
    }
    objc_msgSend(v4, "_teardownAudioProviderIfNeeded");
  }
}

uint64_t __48__CSSpeechController_CSXPCClient_didDisconnect___block_invoke_298(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 121) = 0;
  return result;
}

void __79__CSSpeechController_voiceTriggerAssetHandler_endpointId_didChangeCachedAsset___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 448), *(id *)(a1 + 40));
}

void __100__CSSpeechController_CSSpeakerRecognitionAssetDownloadMonitor_didInstallNewAsset_assetProviderType___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_refreshSpeakerRecognitionAssets");
  v2 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 456);
    v4 = 136315394;
    v5 = "-[CSSpeechController CSSpeakerRecognitionAssetDownloadMonitor:didInstallNewAsset:assetProviderType:]_block_invoke";
    v6 = 2114;
    v7 = v3;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Received SSR asset download notification, updated asset cache to %{public}@", (uint8_t *)&v4, 0x16u);
  }
}

void __50__CSSpeechController_didFinishSpeakerRecognition___block_invoke(uint64_t a1)
{
  id WeakRetained;
  int v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id *v8;
  id v9;
  int v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 160));
  if (WeakRetained)
  {
    v3 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 118);

    if (v3)
    {
      v4 = *MEMORY[0x1E0D18F48];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(void **)(a1 + 40);
        v12 = 136315394;
        v13 = "-[CSSpeechController didFinishSpeakerRecognition:]_block_invoke";
        v14 = 2114;
        v15 = v5;
        _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s SSR Final ScoreCard - %{public}@", (uint8_t *)&v12, 0x16u);
      }
      v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 160));
      -[NSObject speakerIdentificationDidDetectSpeakerWithScores:](v6, "speakerIdentificationDidDetectSpeakerWithScores:", *(_QWORD *)(a1 + 40));
      goto LABEL_8;
    }
  }
  v7 = (void *)*MEMORY[0x1E0D18F50];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F50], OS_LOG_TYPE_DEFAULT))
  {
    v8 = (id *)(*(_QWORD *)(a1 + 32) + 160);
    v6 = v7;
    v9 = objc_loadWeakRetained(v8);
    v10 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 118);
    v12 = 136315650;
    v13 = "-[CSSpeechController didFinishSpeakerRecognition:]_block_invoke";
    v14 = 2112;
    v15 = v9;
    v16 = 1024;
    v17 = v10;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Discarded speakerId scores for {%@, %d} activation", (uint8_t *)&v12, 0x1Cu);

LABEL_8:
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "addContextKey:withContext:", CFSTR("multiuser"), *(_QWORD *)(a1 + 40));
  +[CSP2PService sharedInstance](CSP2PService, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendCoreSpeechGradingDataToNearbyPeer");

}

void __60__CSSpeechController_didReceiveSpeakerRecognitionScoreCard___block_invoke(uint64_t a1)
{
  id WeakRetained;
  int v3;
  void *v4;
  id *v5;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 160));
  if (WeakRetained && (v3 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 118), WeakRetained, v3))
  {
    v9 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 160));
    objc_msgSend(v9, "speakerIdentificationDidDetectSpeakerWithScores:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    v4 = (void *)*MEMORY[0x1E0D18F50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F50], OS_LOG_TYPE_DEFAULT))
    {
      v5 = (id *)(*(_QWORD *)(a1 + 32) + 160);
      v6 = v4;
      v7 = objc_loadWeakRetained(v5);
      v8 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 118);
      *(_DWORD *)buf = 136315650;
      v11 = "-[CSSpeechController didReceiveSpeakerRecognitionScoreCard:]_block_invoke";
      v12 = 2112;
      v13 = v7;
      v14 = 1024;
      v15 = v8;
      _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Discarded speakerId scores for {%@, %d} activation", buf, 0x1Cu);

    }
  }
}

void __80__CSSpeechController_speakerRecognitionFinishedProcessing_withFinalSpeakerInfo___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  int v10;
  void *v11;
  unsigned int v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  id *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  const char *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = (void *)v2[54];
  if (v4 != v3)
  {
    v5 = *MEMORY[0x1E0D18F50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F50], OS_LOG_TYPE_DEFAULT))
    {
      v29 = 136315650;
      v30 = "-[CSSpeechController speakerRecognitionFinishedProcessing:withFinalSpeakerInfo:]_block_invoke";
      v31 = 2114;
      v32 = v4;
      v33 = 2114;
      v34 = v3;
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s SpeakerIdInfo from incorrect SpeakerRecognizer: expected: %{public}@, spkrRecognizer: %{public}@", (uint8_t *)&v29, 0x20u);
    }
    return;
  }
  objc_msgSend(v2, "_processSpeakerRecognitionResult:", *(_QWORD *)(a1 + 48));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 264);
  *(_QWORD *)(v7 + 264) = v6;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 160));
  if (WeakRetained)
  {
    v10 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 118);

    if (v10)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "objectForKeyedSubscript:", CFSTR("userIdentityClassification"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "unsignedIntValue");

      v13 = (void *)*MEMORY[0x1E0D18F50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F50], OS_LOG_TYPE_DEFAULT))
      {
        v14 = v12;
        v15 = v13;
        +[CSUserIdentityClassifier stringFromClassificationCategory:](CSUserIdentityClassifier, "stringFromClassificationCategory:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "objectForKeyedSubscript:", CFSTR("userClassified"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "objectForKeyedSubscript:", *MEMORY[0x1E0DA8CE0]);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 136315906;
        v30 = "-[CSSpeechController speakerRecognitionFinishedProcessing:withFinalSpeakerInfo:]_block_invoke";
        v31 = 2114;
        v32 = v16;
        v33 = 2114;
        v34 = v17;
        v35 = 2114;
        v36 = v18;
        _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_DEFAULT, "%s UserClassification: %{public}@ UserIdentified: %{public}@ Scores: %{public}@", (uint8_t *)&v29, 0x2Au);

      }
      v19 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 160));
      v20 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "copy");
      -[NSObject speakerIdentificationDidDetectSpeakerWithScores:](v19, "speakerIdentificationDidDetectSpeakerWithScores:", v20);
      goto LABEL_11;
    }
  }
  v21 = (void *)*MEMORY[0x1E0D18F50];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F50], OS_LOG_TYPE_DEFAULT))
  {
    v22 = (id *)(*(_QWORD *)(a1 + 32) + 160);
    v19 = v21;
    v20 = objc_loadWeakRetained(v22);
    v23 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 118);
    v29 = 136315650;
    v30 = "-[CSSpeechController speakerRecognitionFinishedProcessing:withFinalSpeakerInfo:]_block_invoke";
    v31 = 2112;
    v32 = v20;
    v33 = 1024;
    LODWORD(v34) = v23;
    _os_log_impl(&dword_1C2614000, v19, OS_LOG_TYPE_DEFAULT, "%s Discarded speakerId scores for {%@, %d} activation", (uint8_t *)&v29, 0x1Cu);
LABEL_11:

  }
  v24 = *MEMORY[0x1E0DA8CE8];
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x1E0DA8CE8]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = *(void **)(*(_QWORD *)(a1 + 32) + 232);
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addContextKey:fromMetaFile:", CFSTR("ssrmeta"), v27);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "addContextKey:withContext:", CFSTR("multiuser"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264));
  +[CSP2PService sharedInstance](CSP2PService, "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "sendCoreSpeechGradingDataToNearbyPeer");

}

void __66__CSSpeechController_speakerRecognitionController_hasSpeakerInfo___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id WeakRetained;
  int v12;
  void *v13;
  unsigned int v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id *v24;
  id v25;
  int v26;
  int v27;
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)a1[4];
  v3 = (void *)a1[5];
  v4 = (void *)v2[54];
  if (v4 == v3)
  {
    objc_msgSend(v2, "_processSpeakerRecognitionResult:", a1[6]);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = a1[4];
    v8 = *(void **)(v7 + 264);
    *(_QWORD *)(v7 + 264) = v6;

    v9 = *MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(void **)(a1[4] + 264);
      v27 = 136315394;
      v28 = "-[CSSpeechController speakerRecognitionController:hasSpeakerInfo:]_block_invoke";
      v29 = 2112;
      v30 = v10;
      _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s _speakerRecognitionScores:%@", (uint8_t *)&v27, 0x16u);
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 160));
    if (WeakRetained && (v12 = *(unsigned __int8 *)(a1[4] + 118), WeakRetained, v12))
    {
      objc_msgSend(*(id *)(a1[4] + 264), "objectForKeyedSubscript:", CFSTR("userIdentityClassification"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "unsignedIntValue");

      v15 = (void *)*MEMORY[0x1E0D18F50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F50], OS_LOG_TYPE_DEFAULT))
      {
        v16 = v14;
        v17 = v15;
        +[CSUserIdentityClassifier stringFromClassificationCategory:](CSUserIdentityClassifier, "stringFromClassificationCategory:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1[4] + 264), "objectForKeyedSubscript:", CFSTR("userClassified"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1[4] + 264), "objectForKeyedSubscript:", *MEMORY[0x1E0DA8CE0]);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 136315906;
        v28 = "-[CSSpeechController speakerRecognitionController:hasSpeakerInfo:]_block_invoke";
        v29 = 2114;
        v30 = v18;
        v31 = 2114;
        v32 = v19;
        v33 = 2114;
        v34 = v20;
        _os_log_impl(&dword_1C2614000, v17, OS_LOG_TYPE_DEFAULT, "%s UserClassification: %{public}@ UserIdentified: %{public}@ Scores: %{public}@", (uint8_t *)&v27, 0x2Au);

      }
      v21 = objc_loadWeakRetained((id *)(a1[4] + 160));
      v22 = (void *)objc_msgSend(*(id *)(a1[4] + 264), "copy");
      -[NSObject speakerIdentificationDidDetectSpeakerWithScores:](v21, "speakerIdentificationDidDetectSpeakerWithScores:", v22);

    }
    else
    {
      v23 = (void *)*MEMORY[0x1E0D18F50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F50], OS_LOG_TYPE_DEFAULT))
        return;
      v24 = (id *)(a1[4] + 160);
      v21 = v23;
      v25 = objc_loadWeakRetained(v24);
      v26 = *(unsigned __int8 *)(a1[4] + 118);
      v27 = 136315650;
      v28 = "-[CSSpeechController speakerRecognitionController:hasSpeakerInfo:]_block_invoke";
      v29 = 2112;
      v30 = v25;
      v31 = 1024;
      LODWORD(v32) = v26;
      _os_log_impl(&dword_1C2614000, v21, OS_LOG_TYPE_DEFAULT, "%s Discarded speakerId scores for {%@, %d} activation", (uint8_t *)&v27, 0x1Cu);

    }
  }
  else
  {
    v5 = *MEMORY[0x1E0D18F50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F50], OS_LOG_TYPE_DEFAULT))
    {
      v27 = 136315650;
      v28 = "-[CSSpeechController speakerRecognitionController:hasSpeakerInfo:]_block_invoke";
      v29 = 2114;
      v30 = v4;
      v31 = 2114;
      v32 = v3;
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s SpeakerIdInfo from incorrect SpeakerRecognizer: expected: %{public}@, spkrRecognizer: %{public}@", (uint8_t *)&v27, 0x20u);
    }
  }
}

uint64_t __55__CSSpeechController_setLanguageDetectorInteractionID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "setInteractionIDforCurrentRequest:", *(_QWORD *)(a1 + 40));
}

uint64_t __58__CSSpeechController_cancelCurrentLanguageDetectorRequest__block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSSpeechController cancelCurrentLanguageDetectorRequest]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Cancelling current language detector request !", (uint8_t *)&v4, 0xCu);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 130) = 0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "cancelCurrentRequest");
}

uint64_t __99__CSSpeechController_processRCWithId_requestId_speechPackage_taskId_forceAccept_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __54__CSSpeechController_fetchAudioMetricsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "audioMetricProvider");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "audioMetric");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    v3 = *(_QWORD *)(a1 + 40);
    v4 = (void *)objc_msgSend(v5, "copy");
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  }
}

void __53__CSSpeechController_keywordDetectorDidDetectKeyword__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  char v4;
  id v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[CSSpeechController keywordDetectorDidDetectKeyword]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Requesting QuickStop operation upon detecting keyword", (uint8_t *)&v6, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
    objc_msgSend(v5, "speechControllerRequestsOperation:forReason:", 0, 0);

  }
}

_BYTE *__55__CSSpeechController_endpointer_detectedTwoShotAtTime___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  _BYTE *result;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 119);
    v6 = 136315650;
    v7 = "-[CSSpeechController endpointer:detectedTwoShotAtTime:]_block_invoke";
    v8 = 2050;
    v9 = v3;
    v10 = 1024;
    v11 = v4;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Reported 2-shot at: %{public}f secs, hasRequestedTwoShotFeedback: %d", (uint8_t *)&v6, 0x1Cu);
  }
  result = *(_BYTE **)(a1 + 32);
  if (!result[119])
    return (_BYTE *)objc_msgSend(result, "_startTwoShotFeedbackDecisionForDetectionAtTime:", *(double *)(a1 + 40));
  return result;
}

void __70__CSSpeechController__startTwoShotFeedbackDecisionForDetectionAtTime___block_invoke(uint64_t a1)
{
  NSObject *v2;
  dispatch_time_t v3;
  intptr_t v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  double v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 104);
  v3 = dispatch_time(0, 1700000000);
  v4 = dispatch_group_wait(v2, v3);
  v5 = *MEMORY[0x1E0D18F48];
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_ERROR))
    {
      v10 = 136315138;
      v11 = "-[CSSpeechController _startTwoShotFeedbackDecisionForDetectionAtTime:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v5, OS_LOG_TYPE_ERROR, "%s Two shot audible feedback decision timed out while waiting for Myriad decision", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(unsigned __int8 *)(v6 + 128);
      LODWORD(v6) = *(unsigned __int8 *)(v6 + 118);
      v10 = 136315650;
      v11 = "-[CSSpeechController _startTwoShotFeedbackDecisionForDetectionAtTime:]_block_invoke";
      v12 = 1024;
      v13 = v7;
      v14 = 1024;
      v15 = v6;
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Starting two shot feedback decision now: myriadPreventingFeedback %d, Siri Client Listening %d", (uint8_t *)&v10, 0x18u);
    }
    v8 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v8 + 128) && *(_BYTE *)(v8 + 118))
    {
      mach_absolute_time();
      AFMachAbsoluteTimeGetTimeInterval();
      objc_msgSend(*(id *)(a1 + 32), "_startFeedbackForTwoShotAtTime:", v9 + *(double *)(a1 + 48));
    }
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 128) = 0;
}

void __80__CSSpeechController_continuousVoiceTrigger_detectedSilenceAfterVoiceTriggerAt___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  const char *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  id WeakRetained;
  char v17;
  NSObject *v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  _BYTE v24[22];
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  NSStringFromSelector(*(SEL *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_performPendingAudioSessionActivateForReason:", v3);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "resetForVoiceTriggerTwoShotWithSampleRate:", objc_msgSend(*(id *)(a1 + 32), "_currentAudioRecorderSampleRate"));
  v4 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v4 + 112))
    goto LABEL_9;
  if (objc_msgSend(*(id *)(v4 + 168), "endPointAnalyzerType") != 1)
  {
    v8 = *MEMORY[0x1E0D18F48];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:
      v6 = 1;
      goto LABEL_10;
    }
    *(_DWORD *)v24 = 136315138;
    *(_QWORD *)&v24[4] = "-[CSSpeechController continuousVoiceTrigger:detectedSilenceAfterVoiceTriggerAt:]_block_invoke";
    v9 = "%s Endpointer is not hybrid endpoint, we should rely on CVT for two shot beep";
LABEL_8:
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, v9, v24, 0xCu);
    goto LABEL_9;
  }
  if (CSIsHorseman())
  {
    v5 = *MEMORY[0x1E0D18F48];
    v6 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v24 = 136315138;
      *(_QWORD *)&v24[4] = "-[CSSpeechController continuousVoiceTrigger:detectedSilenceAfterVoiceTriggerAt:]_block_invoke";
      v7 = "%s Not playing two shot feedback since this is horseman, Phatic will be played";
LABEL_45:
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, v7, v24, 0xCu);
      v6 = 0;
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "isDarwinVoiceTriggered"))
  {
    v8 = *MEMORY[0x1E0D18F48];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    *(_DWORD *)v24 = 136315138;
    *(_QWORD *)&v24[4] = "-[CSSpeechController continuousVoiceTrigger:detectedSilenceAfterVoiceTriggerAt:]_block_invoke";
    v9 = "%s VoiceTrigger from Darwin device, we will rely on CVT for two shot detection";
    goto LABEL_8;
  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "isHearstVoiceTriggered") & 1) == 0
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "isJarvisVoiceTriggered"))
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "isRemoraVoiceTriggered"))
    {
      v5 = *MEMORY[0x1E0D18F48];
      v6 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
        goto LABEL_10;
      *(_DWORD *)v24 = 136315138;
      *(_QWORD *)&v24[4] = "-[CSSpeechController continuousVoiceTrigger:detectedSilenceAfterVoiceTriggerAt:]_block_invoke";
      v7 = "%s Not playing two shot feedback since this is hearst, javis, or remora, Phatic will be played";
      goto LABEL_45;
    }
    if (objc_msgSend(MEMORY[0x1E0D19260], "isIOSDeviceSupportingBargeIn")
      && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "isBuiltInVoiceTriggered"))
    {
      v5 = *MEMORY[0x1E0D18F48];
      v6 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
        goto LABEL_10;
      *(_DWORD *)v24 = 136315138;
      *(_QWORD *)&v24[4] = "-[CSSpeechController continuousVoiceTrigger:detectedSilenceAfterVoiceTriggerAt:]_block_invoke";
      v7 = "%s Not playing two shot feedback since this is barge-in device, Phatic will be played";
      goto LABEL_45;
    }
    goto LABEL_9;
  }
  v5 = *MEMORY[0x1E0D18F48];
  v6 = 0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v24 = 136315138;
    *(_QWORD *)&v24[4] = "-[CSSpeechController continuousVoiceTrigger:detectedSilenceAfterVoiceTriggerAt:]_block_invoke";
    v7 = "%s Not playing two shot feedback since this is hearst or javis, Phatic will be played";
    goto LABEL_45;
  }
LABEL_10:
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "endPointAnalyzerType", *(_OWORD *)v24) == 1)
  {
    v10 = *MEMORY[0x1E0D18F48];
    v6 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v24 = 136315138;
      *(_QWORD *)&v24[4] = "-[CSSpeechController continuousVoiceTrigger:detectedSilenceAfterVoiceTriggerAt:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s State feedback is enabled and we are using hybrid endpointer, use hybrid endpointer for two shot", v24, 0xCu);
      v6 = 0;
    }
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "isRTSTriggered"))
  {
    v11 = *MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v24 = 136315138;
      *(_QWORD *)&v24[4] = "-[CSSpeechController continuousVoiceTrigger:detectedSilenceAfterVoiceTriggerAt:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s State feedback is enabled and this is an RTS trigger, using CVT for two shot", v24, 0xCu);
    }
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "isGibraltarVoiceTriggered"))
      goto LABEL_22;
  }
  else if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "isGibraltarVoiceTriggered") & 1) == 0)
  {
    if (!v6)
      return;
    goto LABEL_22;
  }
  v12 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v24 = 136315138;
    *(_QWORD *)&v24[4] = "-[CSSpeechController continuousVoiceTrigger:detectedSilenceAfterVoiceTriggerAt:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s State feedback is enabled and this is Gibraltar VoiceTrigger, using CVT for two shot", v24, 0xCu);
  }
LABEL_22:
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "isBuiltInVoiceTriggered") & 1) == 0
    && objc_msgSend(*(id *)(a1 + 32), "_shouldUseSoundPlaybackMonitors")
    && (v13 = *(_BYTE **)(a1 + 32), v13[126])
    && (objc_msgSend(v13, "_canPlayTwoShotFeedbackDuringMediaPlayback") & 1) == 0)
  {
    v23 = *MEMORY[0x1E0D18F48];
    v14 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v24 = 136315138;
      *(_QWORD *)&v24[4] = "-[CSSpeechController continuousVoiceTrigger:detectedSilenceAfterVoiceTriggerAt:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v23, OS_LOG_TYPE_DEFAULT, "%s Cannot play Phatic since music is being played now", v24, 0xCu);
      v14 = 0;
    }
  }
  else
  {
    v14 = 1;
  }
  v15 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v15 + 119))
  {
    WeakRetained = objc_loadWeakRetained((id *)(v15 + 144));
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      v18 = *MEMORY[0x1E0D18F48];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
      {
        v19 = *(_QWORD *)(a1 + 48);
        if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 122))
          v20 = CFSTR("Yes");
        else
          v20 = CFSTR("No");
        *(_DWORD *)v24 = 136315650;
        *(_QWORD *)&v24[4] = "-[CSSpeechController continuousVoiceTrigger:detectedSilenceAfterVoiceTriggerAt:]_block_invoke";
        *(_WORD *)&v24[12] = 2050;
        *(_QWORD *)&v24[14] = v19;
        v25 = 2114;
        v26 = v20;
        _os_log_impl(&dword_1C2614000, v18, OS_LOG_TYPE_DEFAULT, "%s Two shot is detected at time %{public}.3f, should notify? [%{public}@]", v24, 0x20u);
      }
      v21 = *(_QWORD *)(a1 + 32);
      if (*(_BYTE *)(v21 + 122))
      {
        v22 = objc_loadWeakRetained((id *)(v21 + 144));
        objc_msgSend(v22, "speechControllerDidDetectVoiceTriggerTwoShot:atTime:wantsAudibleFeedback:", *(_QWORD *)(a1 + 32), v14, *(double *)(a1 + 48));

      }
    }
  }
  else
  {
    objc_msgSend((id)v15, "_startTwoShotFeedbackDecisionForDetectionAtTime:", *(double *)(a1 + 48));
  }
}

void __38__CSSpeechController_voiceTriggerInfo__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "mutableCopy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __51__CSSpeechController_didTTSVolumeChange_forReason___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  NSObject *v4;
  id v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = *MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[CSSpeechController didTTSVolumeChange:forReason:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
    }
    v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
    objc_msgSend(v5, "speechControllerDidUpdateSmartSiriVolume:forReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

void __68__CSSpeechController_audioSessionProvider_didSetAudioSessionActive___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  NSObject *v4;
  id v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = *MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[CSSpeechController audioSessionProvider:didSetAudioSessionActive:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
    }
    v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
    objc_msgSend(v5, "speechController:didSetAudioSessionActive:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 121) = *(_BYTE *)(a1 + 40);
}

void __69__CSSpeechController_audioSessionProvider_willSetAudioSessionActive___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  NSObject *v4;
  id v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = *MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[CSSpeechController audioSessionProvider:willSetAudioSessionActive:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
    }
    v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
    objc_msgSend(v5, "speechController:willSetAudioSessionActive:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

  }
}

void __58__CSSpeechController_audioSessionProviderEndInterruption___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  NSObject *v4;
  id v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = *MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[CSSpeechController audioSessionProviderEndInterruption:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
    }
    v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
    objc_msgSend(v5, "speechControllerEndRecordInterruption:", *(_QWORD *)(a1 + 32));

  }
}

void __72__CSSpeechController_audioSessionProviderBeginInterruption_withContext___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  NSObject *v4;
  id v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = *MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[CSSpeechController audioSessionProviderBeginInterruption:withContext:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
    }
    v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
    objc_msgSend(v5, "speechControllerBeginRecordInterruption:withContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

void __60__CSSpeechController_audioSessionProviderBeginInterruption___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  NSObject *v4;
  id v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = *MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[CSSpeechController audioSessionProviderBeginInterruption:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
    }
    v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
    objc_msgSend(v5, "speechControllerBeginRecordInterruption:", *(_QWORD *)(a1 + 32));

  }
}

void __77__CSSpeechController_audioAlertProvidingDidFinishAlertPlayback_ofType_error___block_invoke(_QWORD *a1)
{
  id WeakRetained;
  char v3;
  NSObject *v4;
  id v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 144));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = *MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[CSSpeechController audioAlertProvidingDidFinishAlertPlayback:ofType:error:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
    }
    v5 = objc_loadWeakRetained((id *)(a1[4] + 144));
    objc_msgSend(v5, "speechControllerDidFinishAlertPlayback:ofType:error:", a1[4], a1[6], a1[5]);

  }
}

void __63__CSSpeechController_audioSessionProvider_providerInvalidated___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__CSSpeechController_audioSessionProvider_providerInvalidated___block_invoke_2;
  block[3] = &unk_1E7C292C8;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __63__CSSpeechController_audioSessionProvider_providerInvalidated___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSSpeechController audioSessionProvider:providerInvalidated:]_block_invoke_2";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s AudioProvider is invalidated, teardown connection to audioprovider", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_teardownAudioProviderIfNeeded");
}

void __73__CSSpeechController_audioStreamProvider_didHardwareConfigurationChange___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  NSObject *v4;
  id v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = *MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[CSSpeechController audioStreamProvider:didHardwareConfigurationChange:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
    }
    v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
    objc_msgSend(v5, "speechControllerRecordHardwareConfigurationDidChange:toConfiguration:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

void __67__CSSpeechController_audioStreamProvider_audioChunkForTVAvailable___block_invoke(uint64_t a1)
{
  _BYTE *v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id WeakRetained;
  char v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  double v20;
  NSObject *v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v1 = *(_BYTE **)(a1 + 32);
  if (v1[118])
  {
    objc_msgSend(v1, "_fetchAudioDecoderForTV:", objc_msgSend(*(id *)(a1 + 40), "audioFormat"));
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "packets");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(*(id *)(a1 + 40), "streamHandleID");
    v5 = objc_msgSend(*(id *)(a1 + 40), "timeStamp");
    v6 = objc_msgSend(*(id *)(a1 + 40), "timeStamp");
    LODWORD(v26) = objc_msgSend(*(id *)(a1 + 40), "numChannels");
    objc_msgSend(v27, "addPackets:audioStreamHandleId:remoteVAD:timestamp:arrivalTimestampToAudioRecorder:wasBuffered:receivedNumChannels:", v3, v4, 0, v5, v6, 0, v26);

    if (CSIsTV())
    {
      v7 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "avgPower");
      objc_msgSend(v7, "setCachedAvgPower:");
      v8 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "peakPower");
      objc_msgSend(v8, "setCachedPeakPower:");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "addNumSamples:hostTime:", 0, objc_msgSend(*(id *)(a1 + 40), "timeStamp"));
    }
    v9 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v9 + 132))
    {
      *(_BYTE *)(v9 + 132) = 1;
      v9 = *(_QWORD *)(a1 + 32);
      if (!*(_QWORD *)(v9 + 512))
      {
        objc_msgSend((id)v9, "streamProvider");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "audioDeviceInfo");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(void **)(v12 + 512);
        *(_QWORD *)(v12 + 512) = v11;

        v9 = *(_QWORD *)(a1 + 32);
      }
    }
    WeakRetained = objc_loadWeakRetained((id *)(v9 + 144));
    v15 = objc_opt_respondsToSelector();

    v16 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
    if ((v15 & 1) != 0)
    {
      v17 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "packets");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(*(id *)(a1 + 40), "timeStamp");
      LODWORD(v20) = 0;
      objc_msgSend(v16, "speechControllerRecordBufferAvailable:buffers:durationInSec:recordedAt:audioDeviceInfo:", v17, v18, v19, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 512), v20);
    }
    else
    {
      v22 = objc_opt_respondsToSelector();

      if ((v22 & 1) == 0)
      {
LABEL_15:

        return;
      }
      v16 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
      v23 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "packets");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(*(id *)(a1 + 40), "timeStamp");
      LODWORD(v25) = 0;
      objc_msgSend(v16, "speechControllerRecordBufferAvailable:buffers:durationInSec:recordedAt:", v23, v18, v24, v25);
    }

    goto LABEL_15;
  }
  v21 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[CSSpeechController audioStreamProvider:audioChunkForTVAvailable:]_block_invoke";
    _os_log_error_impl(&dword_1C2614000, v21, OS_LOG_TYPE_ERROR, "%s SpeechManager still forwarding audio after didStopForwarding, we shouldn't have this", buf, 0xCu);
  }
}

uint64_t __63__CSSpeechController_audioStreamProvider_audioBufferAvailable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_audioStreamProvider:audioBufferAvailable:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __68__CSSpeechController_audioStreamProvider_didStopStreamUnexpectedly___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_didStopForReason:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_logRecordingStopErrorIfNeeded:", *(_QWORD *)(a1 + 40));
}

void __47__CSSpeechController_stopRecordingWithOptions___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void (**v4)(_QWORD, _QWORD);
  os_log_t *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  double v14;
  os_log_t v15;
  NSObject *v16;
  uint64_t v17;
  id WeakRetained;
  char v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, unint64_t);
  void *v26;
  id v27;
  uint64_t v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __47__CSSpeechController_stopRecordingWithOptions___block_invoke_2;
  v26 = &unk_1E7C24F98;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v27 = v2;
  v28 = v3;
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x1C3BC4734](&v23);
  if (objc_msgSend(*(id *)(a1 + 32), "stopRecordingReason", v23, v24, v25, v26) == 3)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 544), "cancelAudioLogging");
  v5 = (os_log_t *)MEMORY[0x1E0D18F48];
  v6 = (void *)*MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = v6;
    v9 = mach_absolute_time();
    *(_DWORD *)buf = 136315650;
    v30 = "-[CSSpeechController stopRecordingWithOptions:]_block_invoke";
    v31 = 2114;
    v32 = v7;
    v33 = 2050;
    v34 = v9;
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Options: %{public}@ at: %{public}llu", buf, 0x20u);

  }
  v10 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(void **)(v11 + 376);
  *(_QWORD *)(v11 + 376) = v10;

  v13 = objc_msgSend(*(id *)(a1 + 32), "stopRecordingReason");
  if ((objc_msgSend(*(id *)(a1 + 40), "_shouldCalculateEstimatedSpeechEndHostTimeFromCachedEPMetrics") & 1) != 0
    || v13 == 1)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "_isRecordRouteStudioDisplay")
      && objc_msgSend(*(id *)(a1 + 40), "canPerformDelayedStop")
      && objc_msgSend(*(id *)(a1 + 32), "expectedStopHostTime"))
    {
      v4[2](v4, 1);
      goto LABEL_22;
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 131) = 1;
    v15 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      v17 = mach_absolute_time();
      *(_DWORD *)buf = 136315394;
      v30 = "-[CSSpeechController stopRecordingWithOptions:]_block_invoke";
      v31 = 2050;
      v32 = v17;
      _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_DEFAULT, "%s Reporting didDeliverLastPacket at: %{public}llu", buf, 0x16u);

    }
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 144));
    v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) != 0)
    {
      v20 = objc_msgSend(*(id *)(a1 + 40), "_calculateEstimatedSpeechEndHostTimeWithStopOptions:", *(_QWORD *)(a1 + 32));
      v21 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v30 = "-[CSSpeechController stopRecordingWithOptions:]_block_invoke";
        v31 = 2050;
        v32 = v20;
        _os_log_impl(&dword_1C2614000, v21, OS_LOG_TYPE_DEFAULT, "%s SpeechEndEstimation: %{public}llu", buf, 0x16u);
      }
      v22 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 144));
      objc_msgSend(v22, "speechControllerDidDeliverLastBuffer:forReason:estimatedSpeechEndHostTime:", *(_QWORD *)(a1 + 40), 0, v20);

    }
    goto LABEL_21;
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "expectedStopHostTime")
    || !objc_msgSend(*(id *)(a1 + 40), "canPerformDelayedStop"))
  {
LABEL_21:
    objc_msgSend(*(id *)(a1 + 40), "handleStopRecordingRequestWithOptions:", *(_QWORD *)(a1 + 32));
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingBufferDuration");
  v4[2](v4, (unint64_t)(v14 * 3.0));
LABEL_22:

}

uint64_t __47__CSSpeechController_stopRecordingWithOptions___block_invoke_2(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t result;
  float v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (void *)*MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    v9 = 136315394;
    v10 = "-[CSSpeechController stopRecordingWithOptions:]_block_invoke_2";
    v11 = 2050;
    v12 = objc_msgSend(v5, "expectedStopHostTime");
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Scheduling StopRecording After HostTime=%{public}llu", (uint8_t *)&v9, 0x16u);

  }
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 384) = 0;
  result = objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 392) = (unint64_t)(float)(v8 * (float)a2);
  return result;
}

void __60__CSSpeechController_handleStopRecordingRequestWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__CSSpeechController_handleStopRecordingRequestWithOptions___block_invoke_2;
  block[3] = &unk_1E7C292C8;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __60__CSSpeechController_handleStopRecordingRequestWithOptions___block_invoke_237(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didStopForReason:", 0);
}

uint64_t __60__CSSpeechController_handleStopRecordingRequestWithOptions___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didStopForReason:", 0);
}

void __42__CSSpeechController__startPhaticDecision__block_invoke(uint64_t a1)
{
  uint64_t v1;
  double v3;
  double v4;
  os_log_t *v5;
  void *v6;
  NSObject *v7;
  const __CFString *v8;
  unsigned __int8 *v9;
  NSObject *v10;
  const char *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  NSObject *v16;
  const __CFString *v17;
  id WeakRetained;
  uint64_t v19;
  NSObject *v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD v23[6];
  _QWORD block[6];
  char v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 118))
  {
    v10 = *MEMORY[0x1E0D18F48];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 136315138;
    v27 = "-[CSSpeechController _startPhaticDecision]_block_invoke";
    v11 = "%s Two shot audible feedback decision not needed since we already stopped recording";
    goto LABEL_10;
  }
  objc_msgSend(*(id *)(v1 + 168), "postVoiceTriggerSilence");
  v4 = v3;
  v5 = (os_log_t *)MEMORY[0x1E0D18F48];
  v6 = (void *)*MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    mach_absolute_time();
    CSMachAbsoluteTimeGetTimeInterval();
    *(_DWORD *)buf = 136315650;
    v27 = "-[CSSpeechController _startPhaticDecision]_block_invoke";
    v28 = 2050;
    v29 = v8;
    v30 = 2050;
    *(double *)v31 = v4;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Two shot audible feedback decision (%{public}.3fs later than the scheduled time), postVoiceTriggerSilence: %{public}.3f", buf, 0x20u);

  }
  if (v4 > 0.0)
  {
    v9 = *(unsigned __int8 **)(a1 + 32);
    if (v9[128])
    {
      v10 = *v5;
      if (!os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
        return;
      *(_DWORD *)buf = 136315138;
      v27 = "-[CSSpeechController _startPhaticDecision]_block_invoke";
      v11 = "%s Two shot audible feedback is prevented by Myriad decision.";
LABEL_10:
      _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);
      return;
    }
    v12 = v9[126];
    v13 = objc_msgSend(v9, "_canPlayTwoShotFeedbackDuringMediaPlayback");
    v14 = v13;
    if (v12)
      v15 = v13;
    else
      v15 = 1;
    v16 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v17 = CFSTR("not ");
      v27 = "-[CSSpeechController _startPhaticDecision]_block_invoke";
      v28 = 2114;
      *(_DWORD *)buf = 136315906;
      if (v15)
        v17 = &stru_1E7C296E8;
      v29 = v17;
      v30 = 1026;
      LODWORD(v31[0]) = v12;
      WORD2(v31[0]) = 1026;
      *(_DWORD *)((char *)v31 + 6) = v14;
      _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_DEFAULT, "%s Two shot audible feedback is %{public}@needed. (isMediaPlaying = %{public}d, canPlayPhaticDuringMediaPlayback = %{public}d)", buf, 0x22u);
    }
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v19 = *(_QWORD *)(a1 + 32);
      v20 = *(NSObject **)(v19 + 16);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __42__CSSpeechController__startPhaticDecision__block_invoke_231;
      block[3] = &unk_1E7C284A8;
      block[4] = v19;
      *(double *)&block[5] = v4;
      v25 = v15;
      v21 = block;
    }
    else
    {
      if (!v15 || (objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_24;
      v22 = *(_QWORD *)(a1 + 32);
      v20 = *(NSObject **)(v22 + 16);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __42__CSSpeechController__startPhaticDecision__block_invoke_234;
      v23[3] = &unk_1E7C29178;
      v23[4] = v22;
      *(double *)&v23[5] = v4;
      v21 = v23;
    }
    dispatch_async(v20, v21);
LABEL_24:

  }
}

void __42__CSSpeechController__startPhaticDecision__block_invoke_235(uint64_t a1)
{
  NSObject *v2;
  dispatch_time_t v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D19260], "shouldDelayTwoShotFeedbackForMyriadDecision")
    && (v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 104),
        v3 = dispatch_time(0, 1700000000),
        dispatch_group_wait(v2, v3)))
  {
    v4 = *MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[CSSpeechController _startPhaticDecision]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v4, OS_LOG_TYPE_ERROR, "%s Two shot audible feedback decision timed out while waiting for Myriad decision", (uint8_t *)&v5, 0xCu);
    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 128) = 0;
}

void __42__CSSpeechController__startPhaticDecision__block_invoke_231(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  uint64_t v4;
  id WeakRetained;
  int v6;
  const char *v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 122))
      v3 = CFSTR("Yes");
    else
      v3 = CFSTR("No");
    v6 = 136315394;
    v7 = "-[CSSpeechController _startPhaticDecision]_block_invoke";
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Two shot audible feedback should notify? [%{public}@]", (uint8_t *)&v6, 0x16u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v4 + 122))
  {
    WeakRetained = objc_loadWeakRetained((id *)(v4 + 144));
    objc_msgSend(WeakRetained, "speechControllerDidDetectVoiceTriggerTwoShot:atTime:wantsAudibleFeedback:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(double *)(a1 + 40));

  }
}

void __42__CSSpeechController__startPhaticDecision__block_invoke_234(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  uint64_t v4;
  id WeakRetained;
  int v6;
  const char *v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 122))
      v3 = CFSTR("Yes");
    else
      v3 = CFSTR("No");
    v6 = 136315394;
    v7 = "-[CSSpeechController _startPhaticDecision]_block_invoke";
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Two shot audible feedback should notify? [%{public}@]", (uint8_t *)&v6, 0x16u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v4 + 122))
  {
    WeakRetained = objc_loadWeakRetained((id *)(v4 + 144));
    objc_msgSend(WeakRetained, "speechControllerDidDetectVoiceTriggerTwoShot:atTime:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));

  }
}

void __62__CSSpeechController__scheduleAudibleFeedbackAtStartRecording__block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  double v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 118))
  {
    objc_msgSend(*(id *)(v2 + 168), "postVoiceTriggerSilence");
    v4 = v3;
    v5 = *MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[CSSpeechController _scheduleAudibleFeedbackAtStartRecording]_block_invoke";
      v12 = 2050;
      v13 = v4;
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Audible feedback decision postVoiceTriggerSilence: %{public}.3f", buf, 0x16u);
    }
    if (v4 > 0.0)
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(NSObject **)(v6 + 16);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __62__CSSpeechController__scheduleAudibleFeedbackAtStartRecording__block_invoke_221;
      block[3] = &unk_1E7C292C8;
      block[4] = v6;
      dispatch_async(v7, block);
    }
  }
  else
  {
    v8 = *MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[CSSpeechController _scheduleAudibleFeedbackAtStartRecording]_block_invoke";
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Audible feedback not needed since we already stopped recording", buf, 0xCu);
    }
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 128) = 0;
}

void __62__CSSpeechController__scheduleAudibleFeedbackAtStartRecording__block_invoke_221(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  char v4;
  id v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[CSSpeechController _scheduleAudibleFeedbackAtStartRecording]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Notifying scheduled audible feedback playback...", (uint8_t *)&v6, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
    objc_msgSend(v5, "speechControllerRequestsOperation:forReason:completion:", 3, objc_msgSend(*(id *)(a1 + 32), "_audibleFeedbackPlaybackReason"), &__block_literal_global_226);

  }
}

void __62__CSSpeechController__scheduleAudibleFeedbackAtStartRecording__block_invoke_224(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)*MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "description");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 136315394;
      v7 = "-[CSSpeechController _scheduleAudibleFeedbackAtStartRecording]_block_invoke";
      v8 = 2114;
      v9 = v5;
      _os_log_error_impl(&dword_1C2614000, v4, OS_LOG_TYPE_ERROR, "%s Failed to playback audible feedback, error: %{public}@", (uint8_t *)&v6, 0x16u);

    }
  }

}

void __55__CSSpeechController_startRecordingWithSettings_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  float v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  id *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  char isKindOfClass;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  int v58;
  NSObject *v59;
  NSObject *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  char v65;
  char v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  int v71;
  NSObject *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  NSObject *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  NSObject *v81;
  void *v82;
  uint64_t v83;
  NSObject *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  NSObject *v91;
  int v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  NSObject *v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  NSObject *v104;
  uint64_t v105;
  const char *v106;
  NSObject *v107;
  uint32_t v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  void *v112;
  CSSpeakerRecognitionProxy *v113;
  uint64_t v114;
  void *v115;
  NSObject *v116;
  uint64_t v117;
  uint64_t v118;
  _BYTE v119[24];
  uint64_t v120;
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 131) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 132) = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 368);
  *(_QWORD *)(v2 + 368) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 376);
  *(_QWORD *)(v4 + 376) = 0;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 384) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 133) = objc_msgSend(*(id *)(a1 + 32), "_canDelayStopRecording");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 134) = 0;
  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingBufferDuration");
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 392) = (unint64_t)(v7 * v8 * 3.0);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 512);
  *(_QWORD *)(v9 + 512) = 0;

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 136) = 0;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 140) = 0;
  v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0C899F8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAVVCAlertBehavior:", v12);

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_shouldSkipStartRecordingAlert"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_shouldSkipStartRecordingAlert"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSkipAlertBehavior:", objc_msgSend(v15, "BOOLValue"));

  }
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_allowRecordWhileBeep"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_allowRecordWhileBeep"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAllowRecordWhileBeep:", objc_msgSend(v18, "BOOLValue"));

  }
  if (!CSIsMac())
    goto LABEL_9;
  if (CSIsAppleSiliconMac())
  {
    objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v19, "isFlexibleFollowupsSupported"))
    {
LABEL_14:

      goto LABEL_15;
    }
    v20 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "isServerInvoked");

    if (v20)
    {
LABEL_9:
      v21 = *MEMORY[0x1E0C89A40];
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0C89A40]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        v23 = objc_msgSend(MEMORY[0x1E0D19260], "supportOpportunisticZLL");
        v24 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        if (v23)
          objc_msgSend(v24, "setUseOpportunisticZLL:", 1);
        else
          objc_msgSend(v24, "setRequestHistoricalAudioDataWithHostTime:", 1);
        v25 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v21);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setStartRecordingHostTime:", objc_msgSend(v19, "unsignedLongLongValue"));
        goto LABEL_14;
      }
    }
  }
LABEL_15:
  v26 = *(void **)(a1 + 40);
  v27 = (id *)MEMORY[0x1E0D18F48];
  if (!v26)
    goto LABEL_37;
  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_requestMHUUID"));
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_requestMHUUID"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_requestMHUUID"));
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = *(_QWORD *)(a1 + 32);
      v34 = *(void **)(v33 + 368);
      *(_QWORD *)(v33 + 368) = v32;

      v35 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_requestMHUUID"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setRequestMHUUID:", v36);

      v37 = *v27;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_requestMHUUID"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v119 = 136315394;
        *(_QWORD *)&v119[4] = "-[CSSpeechController startRecordingWithSettings:error:]_block_invoke";
        *(_WORD *)&v119[12] = 2112;
        *(_QWORD *)&v119[14] = v38;
        _os_log_impl(&dword_1C2614000, v37, OS_LOG_TYPE_DEFAULT, "%s Ask start recording with requestMHUUID: %@", v119, 0x16u);

      }
    }
  }
  v39 = *(void **)(a1 + 40);
  if (!v39)
    goto LABEL_37;
  objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_siriSessionUUID"));
  v40 = objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    v41 = (void *)v40;
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_siriSessionUUID"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v43 = objc_opt_isKindOfClass();

    if ((v43 & 1) != 0)
    {
      v44 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_siriSessionUUID"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setSiriSessionUUID:", v45);

    }
  }
  v46 = *(void **)(a1 + 40);
  if (!v46)
    goto LABEL_37;
  objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_disableEndpointer"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    v48 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_disableEndpointer"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setDisableEndpointer:", objc_msgSend(v49, "BOOLValue"));

  }
  v50 = *(void **)(a1 + 40);
  if (!v50)
    goto LABEL_37;
  objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_disableLocalSpeechRecognizer"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {
    v52 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_disableLocalSpeechRecognizer"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setDisableLocalSpeechRecognizer:", objc_msgSend(v53, "BOOLValue"));

  }
  v54 = *(void **)(a1 + 40);
  if (!v54)
    goto LABEL_37;
  objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_asrOnDevice"));
  v55 = objc_claimAutoreleasedReturnValue();
  if (!v55)
    goto LABEL_37;
  v56 = (void *)v55;
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_asrOnDevice"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v57, "BOOLValue");

  if (v58)
  {
    v59 = *v27;
    if (os_log_type_enabled((os_log_t)*v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v119 = 136315138;
      *(_QWORD *)&v119[4] = "-[CSSpeechController startRecordingWithSettings:error:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v59, OS_LOG_TYPE_DEFAULT, "%s Disable audio converter since local asr is going to be used", v119, 0xCu);
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 116) = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setDisableRCSelection:", 1);
  }
  else
  {
LABEL_37:
    v60 = *v27;
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v119 = 136315138;
      *(_QWORD *)&v119[4] = "-[CSSpeechController startRecordingWithSettings:error:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v60, OS_LOG_TYPE_DEFAULT, "%s Enable audio converter", v119, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 116) = 0;
  }
  v61 = *(void **)(a1 + 40);
  if (!v61)
    goto LABEL_44;
  objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_hybridUODEnabled"));
  v62 = objc_claimAutoreleasedReturnValue();
  if (!v62)
    goto LABEL_44;
  v63 = (void *)v62;
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_hybridUODEnabled"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v64, "BOOLValue");

  if ((v65 & 1) != 0)
    v66 = 1;
  else
LABEL_44:
    v66 = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 129) = v66;
  v67 = *(void **)(a1 + 40);
  if (v67)
  {
    objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_disablePrewarmLocalAsrAtStartRecording"));
    v68 = objc_claimAutoreleasedReturnValue();
    if (v68)
    {
      v69 = (void *)v68;
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_disablePrewarmLocalAsrAtStartRecording"));
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(v70, "BOOLValue");

      if (v71)
      {
        v72 = *v27;
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v119 = 136315138;
          *(_QWORD *)&v119[4] = "-[CSSpeechController startRecordingWithSettings:error:]_block_invoke";
          _os_log_impl(&dword_1C2614000, v72, OS_LOG_TYPE_DEFAULT, "%s Disable prewarming local asr at startRecording", v119, 0xCu);
        }

        v73 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_disablePrewarmLocalAsrAtStartRecording"));
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "setDisablePrewarmLocalAsrAtStartRecording:", objc_msgSend(v74, "BOOLValue"));

      }
    }
  }
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldSetStartSampleCount"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKeyedSubscript:", *MEMORY[0x1E0D195C8]);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v75, "unsignedIntegerValue");

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setRequestHistoricalAudioDataSampleCount:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setStartRecordingSampleCount:", v76);
    v77 = *v27;
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v119 = 136315394;
      *(_QWORD *)&v119[4] = "-[CSSpeechController startRecordingWithSettings:error:]_block_invoke";
      *(_WORD *)&v119[12] = 2050;
      *(_QWORD *)&v119[14] = v76;
      _os_log_impl(&dword_1C2614000, v77, OS_LOG_TYPE_DEFAULT, "%s Ask start recording from: %{public}tu", v119, 0x16u);
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_DictationStartSampleId"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  if (v78)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_DictationStartSampleId"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(v79, "unsignedIntegerValue");

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setRequestHistoricalAudioDataSampleCount:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setStartRecordingSampleCount:", v80);
    v81 = *v27;
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v119 = 136315394;
      *(_QWORD *)&v119[4] = "-[CSSpeechController startRecordingWithSettings:error:]_block_invoke";
      *(_WORD *)&v119[12] = 2050;
      *(_QWORD *)&v119[14] = v80;
      _os_log_impl(&dword_1C2614000, v81, OS_LOG_TYPE_DEFAULT, "%s TriggerlessDictation: Ask start recording from: %{public}tu", v119, 0x16u);
    }

  }
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldSetStartSampleCountForRTS"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectForKeyedSubscript:", *MEMORY[0x1E0D193D8]);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(v82, "unsignedIntegerValue");

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setRequestHistoricalAudioDataSampleCount:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setStartRecordingSampleCount:", v83);
    v84 = *v27;
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v119 = 136315394;
      *(_QWORD *)&v119[4] = "-[CSSpeechController startRecordingWithSettings:error:]_block_invoke";
      *(_WORD *)&v119[12] = 2050;
      *(_QWORD *)&v119[14] = v83;
      _os_log_impl(&dword_1C2614000, v84, OS_LOG_TYPE_DEFAULT, "%s Ask start recording from: %{public}tu", v119, 0x16u);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "activationMetadata");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "isContinuousConversation"))
  {
    if (v85)
    {
      v86 = *MEMORY[0x1E0D195C8];
      objc_msgSend(v85, "objectForKeyedSubscript:", *MEMORY[0x1E0D195C8]);
      v87 = (void *)objc_claimAutoreleasedReturnValue();

      if (v87)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "activationMetadata");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "objectForKeyedSubscript:", v86);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = objc_msgSend(v89, "unsignedIntegerValue");

        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setRequestHistoricalAudioDataSampleCount:", 1);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setStartRecordingSampleCount:", v90);
        v91 = *v27;
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v119 = 136315650;
          *(_QWORD *)&v119[4] = "-[CSSpeechController startRecordingWithSettings:error:]_block_invoke";
          *(_WORD *)&v119[12] = 2114;
          *(_QWORD *)&v119[14] = v85;
          *(_WORD *)&v119[22] = 2050;
          v120 = v90;
          _os_log_impl(&dword_1C2614000, v91, OS_LOG_TYPE_DEFAULT, "%s ContinuousConversation trigger Info: %{public}@ ask start recording from: %{public}tu", v119, 0x20u);
        }

      }
    }
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 118) = 1;
  v92 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "isVoiceTriggered");
  v93 = *(_QWORD *)(a1 + 32);
  if (!v92
    || (v94 = *(void **)(v93 + 72)) == 0
    || (v95 = *MEMORY[0x1E0D195A8],
        objc_msgSend(v94, "objectForKeyedSubscript:", *MEMORY[0x1E0D195A8]),
        v96 = (void *)objc_claimAutoreleasedReturnValue(),
        v96,
        v93 = *(_QWORD *)(a1 + 32),
        !v96))
  {
    if (objc_msgSend(*(id *)(v93 + 176), "isServerInvoked")
      && (v100 = *(void **)(*(_QWORD *)(a1 + 32) + 72)) != 0
      && (v101 = *MEMORY[0x1E0D195A8],
          objc_msgSend(v100, "objectForKeyedSubscript:", *MEMORY[0x1E0D195A8]),
          v102 = (void *)objc_claimAutoreleasedReturnValue(),
          v102,
          v102))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKeyedSubscript:", v101);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272) = objc_msgSend(v103, "unsignedIntegerValue");

      v104 = *v27;
      if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
      {
        v105 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272);
        *(_DWORD *)v119 = 136315394;
        *(_QWORD *)&v119[4] = "-[CSSpeechController startRecordingWithSettings:error:]_block_invoke";
        *(_WORD *)&v119[12] = 2050;
        *(_QWORD *)&v119[14] = v105;
        v106 = "%s Auto prompt to use the last voice triggered channel: %{public}tu";
        v107 = v104;
        v108 = 22;
LABEL_81:
        _os_log_impl(&dword_1C2614000, v107, OS_LOG_TYPE_DEFAULT, v106, v119, v108);
      }
    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272) = objc_msgSend(MEMORY[0x1E0D19090], "channelForProcessedInput");
      v109 = *(_QWORD *)(a1 + 32);
      v110 = *(void **)(v109 + 72);
      *(_QWORD *)(v109 + 72) = 0;

      v104 = *v27;
      if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v119 = 136315138;
        *(_QWORD *)&v119[4] = "-[CSSpeechController startRecordingWithSettings:error:]_block_invoke";
        v106 = "%s SpeechController to receive data from default channel";
        v107 = v104;
        v108 = 12;
        goto LABEL_81;
      }
    }

    goto LABEL_83;
  }
  objc_msgSend(*(id *)(v93 + 72), "objectForKeyedSubscript:", v95);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272) = objc_msgSend(v97, "unsignedIntegerValue");

  v98 = *v27;
  if (os_log_type_enabled((os_log_t)*v27, OS_LOG_TYPE_DEFAULT))
  {
    v99 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272);
    *(_DWORD *)v119 = 136315394;
    *(_QWORD *)&v119[4] = "-[CSSpeechController startRecordingWithSettings:error:]_block_invoke";
    *(_WORD *)&v119[12] = 2050;
    *(_QWORD *)&v119[14] = v99;
    _os_log_impl(&dword_1C2614000, v98, OS_LOG_TYPE_DEFAULT, "%s Voice trigger to use the current voice triggered channel: %{public}tu", v119, 0x16u);
  }
LABEL_83:
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setRequireSingleChannelLookup:", 1, *(_OWORD *)v119, *(_QWORD *)&v119[16]);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setSelectedChannel:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 272));
  objc_msgSend(*(id *)(a1 + 32), "_setupSpeakerRecognitionController");
  if (CSIsCommunalDevice())
  {
    if (objc_msgSend(MEMORY[0x1E0D19260], "isAttentiveSiriEnabled"))
    {
      v111 = *(_QWORD *)(a1 + 32);
      if (!*(_QWORD *)(v111 + 520))
      {
        v112 = *(void **)(v111 + 424);
        if (!v112)
        {
          v113 = -[CSSpeakerRecognitionProxy initWithDelegate:]([CSSpeakerRecognitionProxy alloc], "initWithDelegate:", *(_QWORD *)(a1 + 32));
          v114 = *(_QWORD *)(a1 + 32);
          v115 = *(void **)(v114 + 424);
          *(_QWORD *)(v114 + 424) = v113;

          v112 = *(void **)(*(_QWORD *)(a1 + 32) + 424);
        }
        objc_msgSend(v112, "startXPCConnection");
      }
    }
  }
  v116 = *v27;
  if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
  {
    v117 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272);
    *(_DWORD *)v119 = 136315394;
    *(_QWORD *)&v119[4] = "-[CSSpeechController startRecordingWithSettings:error:]_block_invoke";
    *(_WORD *)&v119[12] = 2050;
    *(_QWORD *)&v119[14] = v117;
    _os_log_impl(&dword_1C2614000, v116, OS_LOG_TYPE_DEFAULT, "%s SpeechController to receive data from channel %{public}tu", v119, 0x16u);
  }

  v118 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v118 + 116))
  {
    objc_msgSend(*(id *)(v118 + 48), "reset");
    v118 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v118 + 280), "reset");

}

uint64_t __55__CSSpeechController_startRecordingWithSettings_error___block_invoke_203(uint64_t a1)
{
  kdebug_trace();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "resetForNewRequestWithSampleRate:recordContext:recordOption:voiceTriggerInfo:", objc_msgSend(*(id *)(a1 + 32), "_currentAudioRecorderSampleRate"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "setActiveChannel:", objc_msgSend(MEMORY[0x1E0D19090], "channelForProcessedInput"));
  return kdebug_trace();
}

void __55__CSSpeechController_startRecordingWithSettings_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BYTE *v12;
  void *v13;
  double v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  _BYTE v30[40];
  _BYTE v31[40];
  _BYTE v32[40];
  uint8_t buf[4];
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 127) = 0;
  objc_msgSend(*(id *)(a1 + 32), "recordRoute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C89A00]);

  if (v3)
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 127) = 1;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 416);
  *(_QWORD *)(v6 + 416) = v5;

  v8 = (void *)MEMORY[0x1E0D18FE8];
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 127))
  {
    objc_msgSend(MEMORY[0x1E0D190F8], "lpcmMonoNonInterleavedWithRemoteVADASBD");
    objc_msgSend(MEMORY[0x1E0D190F8], "lpcmMonoInterleavedWithRemoteVADASBD");
    objc_msgSend(v8, "createAudioFileWriterForRemoteVADWithInputFormat:outputFormat:withLoggingUUID:", v32, v31, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416));
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D190F8], "lpcmInt16ASBD");
    objc_msgSend(MEMORY[0x1E0D190F8], "lpcmInt16ASBD");
    objc_msgSend(v8, "createAudioFileWriterWithInputFormat:outputFormat:withLoggingUUID:", v30, &v29, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416));
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 232);
  *(_QWORD *)(v10 + 232) = v9;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 130) = objc_msgSend(*(id *)(a1 + 32), "_shouldUseLanguageDetector:", *(_QWORD *)(a1 + 40));
  v12 = *(_BYTE **)(a1 + 32);
  if (v12[130])
  {
    objc_msgSend(v12, "_createLanguageDetectorIfNeeded");
    objc_msgSend(*(id *)(a1 + 32), "_languageDetectorOptionFromSettings:", *(_QWORD *)(a1 + 40));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v14 = (float)objc_msgSend(*(id *)(a1 + 32), "_currentAudioRecorderSampleRate");
    objc_msgSend(v13, "setSamplingRate:", v14);
    v15 = *(_QWORD **)(a1 + 32);
    v16 = (void *)v15[38];
    objc_msgSend(v15, "languageDetectorDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDelegate:", v17);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "resetForNewRequest:", v13);
  }
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("CSSpeechRecordSettingsKey_siriSessionUUID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18 && !*(_BYTE *)(*(_QWORD *)(a1 + 32) + 116) && CSIsHorseman())
  {
    v19 = *MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "-[CSSpeechController startRecordingWithSettings:error:]_block_invoke_2";
      _os_log_impl(&dword_1C2614000, v19, OS_LOG_TYPE_DEFAULT, "%s Trying to prepare uncompressed audio logging", buf, 0xCu);
    }
    v20 = objc_alloc(MEMORY[0x1E0D19250]);
    objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "languageCode");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v20, "initWithRequestId:languageCode:task:", v18, v22, &stru_1E7C296E8);
    v24 = *(_QWORD *)(a1 + 32);
    v25 = *(void **)(v24 + 544);
    *(_QWORD *)(v24 + 544) = v23;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "prepareLogging:", 0);
  }
  else
  {
    v26 = *MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "-[CSSpeechController startRecordingWithSettings:error:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v26, OS_LOG_TYPE_DEFAULT, "%s Local ASR is used, uncompressed audio logging is disabled", buf, 0xCu);
    }
    v27 = *(_QWORD *)(a1 + 32);
    v28 = *(void **)(v27 + 544);
    *(_QWORD *)(v27 + 544) = 0;

  }
}

void __55__CSSpeechController_startRecordingWithSettings_error___block_invoke_210(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  __int16 v15;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(NSObject **)(v6 + 16);
  block[2] = __55__CSSpeechController_startRecordingWithSettings_error___block_invoke_2_211;
  block[3] = &unk_1E7C24F28;
  block[1] = 3221225472;
  v14 = a2;
  block[4] = v6;
  v11 = v5;
  v15 = *(_WORD *)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 48);
  v12 = v7;
  v9 = v5;
  dispatch_async(v8, block);

}

void __55__CSSpeechController_startRecordingWithSettings_error___block_invoke_2_211(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;
  char v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  char v16;
  NSObject *v17;
  const __CFString *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  NSObject *v26;
  void *v27;
  void *v28;
  int v29;
  const char *v30;
  __int16 v31;
  double v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 512))
  {
    objc_msgSend((id)v2, "streamProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "audioDeviceInfo");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 512);
    *(_QWORD *)(v5 + 512) = v4;

    v2 = *(_QWORD *)(a1 + 32);
  }
  WeakRetained = objc_loadWeakRetained((id *)(v2 + 144));
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = (void *)*MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(a1 + 64))
        v10 = CFSTR("YES");
      else
        v10 = CFSTR("NO");
      v11 = *(void **)(*(_QWORD *)(a1 + 32) + 512);
      v12 = v9;
      objc_msgSend(v11, "description");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 136315650;
      v30 = "-[CSSpeechController startRecordingWithSettings:error:]_block_invoke_2";
      v31 = 2112;
      v32 = *(double *)&v10;
      v33 = 2114;
      v34 = v13;
      _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s Sending client speechControllerDidStartRecording successfully? %{pubic}@, audioDeviceInfo = %{public}@", (uint8_t *)&v29, 0x20u);

    }
    v14 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
    objc_msgSend(v14, "speechControllerDidStartRecording:audioDeviceInfo:successfully:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 512), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40));
LABEL_16:

    goto LABEL_17;
  }
  v15 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    v17 = *MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      v18 = CFSTR("YES");
      if (!*(_BYTE *)(a1 + 64))
        v18 = CFSTR("NO");
      v29 = 136315394;
      v30 = "-[CSSpeechController startRecordingWithSettings:error:]_block_invoke";
      v31 = 2112;
      v32 = *(double *)&v18;
      _os_log_impl(&dword_1C2614000, v17, OS_LOG_TYPE_DEFAULT, "%s Sending client speechControllerDidStartRecording successfully? %{pubic}@", (uint8_t *)&v29, 0x16u);
    }
    v14 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
    objc_msgSend(v14, "speechControllerDidStartRecording:successfully:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40));
    goto LABEL_16;
  }
LABEL_17:
  if (*(_BYTE *)(a1 + 64))
  {
    if (*(_BYTE *)(a1 + 65))
    {
      objc_msgSend(*(id *)(a1 + 32), "audioStream");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isStreaming");

      if (v20)
        objc_msgSend(*(id *)(a1 + 32), "_activateAudioSessionWithReason:delay:delayRequested:error:", 2, *(unsigned __int8 *)(a1 + 66), 0, *(double *)(a1 + 56));
    }
  }
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldTrackLaunchLatency"))
  {
    v21 = (void *)MEMORY[0x1E0D19118];
    v22 = mach_absolute_time();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKeyedSubscript:", *MEMORY[0x1E0D19758]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "hostTimeToTimeInterval:", v22 - objc_msgSend(v23, "unsignedLongLongValue"));
    v25 = v24;

    if (v25 >= 1.79999995)
    {
      v26 = *MEMORY[0x1E0D18F48];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_ERROR))
      {
        v29 = 136315394;
        v30 = "-[CSSpeechController startRecordingWithSettings:error:]_block_invoke";
        v31 = 2048;
        v32 = v25;
        _os_log_error_impl(&dword_1C2614000, v26, OS_LOG_TYPE_ERROR, "%s Report unexpectedly long launch latency %{publlic}.3f", (uint8_t *)&v29, 0x16u);
      }
      objc_msgSend(MEMORY[0x1E0D190B8], "sharedInstance");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "submitVoiceTriggerIssueReport:", *MEMORY[0x1E0D193C0]);

    }
  }
  objc_msgSend(MEMORY[0x1E0D191F0], "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "notifyDidStartStreamWithContext:successfully:option:withEventUUID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256));

}

uint64_t __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDictationLanguages:", *(_QWORD *)(a1 + 40));
}

void __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke(void *a1, uint64_t a2, void *a3)
{
  void (**v4)(_QWORD);
  char isKindOfClass;
  id v6;

  v6 = a1;
  v4 = a3;
  if (v6)
  {
    isKindOfClass = objc_opt_isKindOfClass();
    if (v4)
    {
      if ((isKindOfClass & 1) != 0)
        v4[2](v4);
    }
  }

}

uint64_t __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentKeyboard:", *(_QWORD *)(a1 + 40));
}

uint64_t __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setWasLanguageToggled:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));
}

uint64_t __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMultilingualKeyboardLanguages:", *(_QWORD *)(a1 + 40));
}

uint64_t __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setKeyboardConvoLanguagePriors:", *(_QWORD *)(a1 + 40));
}

uint64_t __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setKeyboardGlobalLanguagePriors:", *(_QWORD *)(a1 + 40));
}

uint64_t __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPreviousMessageLanguage:", *(_QWORD *)(a1 + 40));
}

uint64_t __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setGlobalLastKeyboardUsed:", *(_QWORD *)(a1 + 40));
}

uint64_t __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDictationLanguagePriors:", *(_QWORD *)(a1 + 40));
}

uint64_t __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setConversationalMessages:", *(_QWORD *)(a1 + 40));
}

void __56__CSSpeechController__setupSpeakerRecognitionController__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__CSSpeechController__setupSpeakerRecognitionController__block_invoke_2;
  block[3] = &unk_1E7C291C0;
  v12 = v6;
  v13 = v5;
  v14 = v7;
  v9 = v5;
  v10 = v6;
  dispatch_async(v8, block);

}

void __56__CSSpeechController__setupSpeakerRecognitionController__block_invoke_2(_QWORD *a1)
{
  void *v1;
  NSObject *v2;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = (void *)a1[4];
  if (v1 || (v4 = (void *)a1[5]) == 0)
  {
    v2 = *MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[CSSpeechController _setupSpeakerRecognitionController]_block_invoke_2";
      v11 = 2114;
      v12 = v1;
      _os_log_error_impl(&dword_1C2614000, v2, OS_LOG_TYPE_ERROR, "%s Failed to get asset with %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    objc_storeStrong((id *)(a1[6] + 448), v4);
    v5 = (void *)*MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(void **)(a1[6] + 448);
      v7 = v5;
      objc_msgSend(v6, "configVersion");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 136315394;
      v10 = "-[CSSpeechController _setupSpeakerRecognitionController]_block_invoke";
      v11 = 2114;
      v12 = v8;
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s MU using asset with version %{public}@", (uint8_t *)&v9, 0x16u);

    }
  }
}

void __54__CSSpeechController__refreshSpeakerRecognitionAssets__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  __int128 v13;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__CSSpeechController__refreshSpeakerRecognitionAssets__block_invoke_2;
  v10[3] = &unk_1E7C28408;
  v11 = v6;
  v12 = v5;
  v13 = *(_OWORD *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, v10);

}

void __54__CSSpeechController__refreshSpeakerRecognitionAssets__block_invoke_2(_QWORD *a1)
{
  if (!a1[4] && a1[5])
    objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "addObject:");
  objc_storeStrong((id *)(a1[6] + 456), *(id *)(*(_QWORD *)(a1[7] + 8) + 40));
}

_BYTE *__42__CSSpeechController_releaseAudioSession___block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[121])
    return (_BYTE *)objc_msgSend(result, "_fetchMetricsAndLog");
  return result;
}

_BYTE *__41__CSSpeechController_releaseAudioSession__block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[121])
    return (_BYTE *)objc_msgSend(result, "_fetchMetricsAndLog");
  return result;
}

uint64_t __39__CSSpeechController_resetAudioSession__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_teardownAudioProviderIfNeeded");
}

uint64_t __52__CSSpeechController_setCurrentRecordContext_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAudioRecordContext:", *(_QWORD *)(a1 + 40));
}

uint64_t __52__CSSpeechController_setCurrentRecordContext_error___block_invoke_179(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_fetchAudioProviderWithContext:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __52__CSSpeechController_setCurrentRecordContext_error___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_fetchAudioProviderWithContext:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __119__CSSpeechController__scheduleActivateAudioSessionWithDelay_sessionActivateReason_scheduleReason_validator_completion___block_invoke(_QWORD *a1)
{
  int v2;
  os_log_t *v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  uint64_t v27;
  os_log_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1[4] + 312), "isEqual:", a1[5]);
  v3 = (os_log_t *)MEMORY[0x1E0D18F48];
  v4 = *MEMORY[0x1E0D18F48];
  v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT);
  if (!v2)
  {
    if (v5)
    {
      v22 = (void *)a1[5];
      v21 = a1[6];
      v23 = *(_QWORD *)(a1[4] + 312);
      *(_DWORD *)buf = 136315906;
      v35 = "-[CSSpeechController _scheduleActivateAudioSessionWithDelay:sessionActivateReason:scheduleReason:validator:c"
            "ompletion:]_block_invoke";
      v36 = 2114;
      v37 = v21;
      v38 = 2114;
      v39 = v22;
      v40 = 2114;
      v41 = v23;
      v24 = "%s Delayed active audio session: Ignored activate audio session for reason %{public}@ because the scheduled "
            "token %{public}@ does not match the current token %{public}@.";
      v25 = v4;
      v26 = 42;
LABEL_19:
      _os_log_impl(&dword_1C2614000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
    }
LABEL_20:
    v18 = 0;
    v16 = 0;
    goto LABEL_21;
  }
  if (v5)
  {
    v6 = (void *)a1[8];
    v7 = a1[5];
    v8 = a1[6];
    *(_DWORD *)buf = 136315906;
    v35 = "-[CSSpeechController _scheduleActivateAudioSessionWithDelay:sessionActivateReason:scheduleReason:validator:com"
          "pletion:]_block_invoke";
    v36 = 2114;
    v37 = v7;
    v38 = 2050;
    v39 = v6;
    v40 = 2114;
    v41 = v8;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Delayed active audio session: Consumed token %{public}@ with %{public}f seconds delay for reason %{public}@.", buf, 0x2Au);
  }
  v9 = a1[4];
  v10 = *(void **)(v9 + 312);
  *(_QWORD *)(v9 + 312) = 0;

  *(_QWORD *)(a1[4] + 328) = 0;
  v11 = a1[7];
  if (v11 && !(*(unsigned int (**)(void))(v11 + 16))())
  {
    v28 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      v29 = a1[6];
      *(_DWORD *)buf = 136315394;
      v35 = "-[CSSpeechController _scheduleActivateAudioSessionWithDelay:sessionActivateReason:scheduleReason:validator:c"
            "ompletion:]_block_invoke";
      v36 = 2114;
      v37 = v29;
      v24 = "%s Delayed active audio session: Ignored activating audio session for reason %{public}@ because the validator rejected.";
      v25 = v28;
      v26 = 22;
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  v12 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v13 = a1[6];
    *(_DWORD *)buf = 136315394;
    v35 = "-[CSSpeechController _scheduleActivateAudioSessionWithDelay:sessionActivateReason:scheduleReason:validator:com"
          "pletion:]_block_invoke";
    v36 = 2114;
    v37 = v13;
    _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s Delayed active audio session: Activating audio session for reason %{public}@.", buf, 0x16u);
  }
  v14 = (void *)a1[4];
  v15 = a1[9];
  v33 = 0;
  v16 = objc_msgSend(v14, "_activateAudioSessionWithReason:error:", v15, &v33);
  v17 = v33;
  v18 = v17;
  v19 = *v3;
  if (!(_DWORD)v16 || v17)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v27 = a1[6];
      *(_DWORD *)buf = 136315650;
      v35 = "-[CSSpeechController _scheduleActivateAudioSessionWithDelay:sessionActivateReason:scheduleReason:validator:c"
            "ompletion:]_block_invoke";
      v36 = 2114;
      v37 = v27;
      v38 = 2112;
      v39 = v18;
      _os_log_error_impl(&dword_1C2614000, v19, OS_LOG_TYPE_ERROR, "%s Delayed active audio session: Failed to activate audio session for reason %{public}@ due to error %@.", buf, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = a1[6];
      *(_DWORD *)buf = 136315394;
      v35 = "-[CSSpeechController _scheduleActivateAudioSessionWithDelay:sessionActivateReason:scheduleReason:validator:c"
            "ompletion:]_block_invoke";
      v36 = 2114;
      v37 = v20;
      _os_log_impl(&dword_1C2614000, v19, OS_LOG_TYPE_DEFAULT, "%s Delayed active audio session: Successfully activate audio session for reason %{public}@.", buf, 0x16u);
    }
    v18 = 0;
    v16 = 1;
  }
LABEL_21:
  v30 = *(_QWORD *)(a1[4] + 320);
  if (v30)
  {
    (*(void (**)(uint64_t, uint64_t, void *))(v30 + 16))(v30, v16, v18);
    v31 = a1[4];
    v32 = *(void **)(v31 + 320);
    *(_QWORD *)(v31 + 320) = 0;

  }
}

void __81__CSSpeechController__activateAudioSessionWithReason_delay_delayRequested_error___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  id obj;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[CSSpeechController _activateAudioSessionWithReason:delay:delayRequested:error:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Activating Audio Session Now Sync.", buf, 0xCu);
  }
  v3 = (void *)a1[4];
  v4 = a1[7];
  v5 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v5 + 40);
  v6 = objc_msgSend(v3, "_activateAudioSessionWithReason:error:", v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v6;
}

void __81__CSSpeechController__activateAudioSessionWithReason_delay_delayRequested_error___block_invoke_167(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD block[7];
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[CSSpeechController _activateAudioSessionWithReason:delay:delayRequested:error:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Activating Audio Session Now Async.", buf, 0xCu);
  }
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  v3 = a1[4];
  v4 = *(NSObject **)(v3 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__CSSpeechController__activateAudioSessionWithReason_delay_delayRequested_error___block_invoke_168;
  block[3] = &unk_1E7C26810;
  v5 = a1[7];
  block[5] = a1[6];
  block[6] = v5;
  block[4] = v3;
  dispatch_async(v4, block);
}

uint64_t __81__CSSpeechController__activateAudioSessionWithReason_delay_delayRequested_error___block_invoke_175(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 118);
}

void __81__CSSpeechController__activateAudioSessionWithReason_delay_delayRequested_error___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  _BOOL4 v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *MEMORY[0x1E0D18F48];
  if (!v5)
  {
    v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (!v8)
        goto LABEL_10;
      v9 = *(_QWORD *)(a1 + 32);
      v12 = 136315394;
      v13 = "-[CSSpeechController _activateAudioSessionWithReason:delay:delayRequested:error:]_block_invoke";
      v14 = 2050;
      v15 = v9;
      v10 = "%s Finished activate audio session with %{public}f seconds delay from prepareRecordWithSettings.";
    }
    else
    {
      if (!v8)
        goto LABEL_10;
      v11 = *(_QWORD *)(a1 + 32);
      v12 = 136315394;
      v13 = "-[CSSpeechController _activateAudioSessionWithReason:delay:delayRequested:error:]_block_invoke";
      v14 = 2050;
      v15 = v11;
      v10 = "%s Cancelled activate audio session with %{public}f seconds delay from prepareRecordWithSettings.";
    }
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v12, 0x16u);
    goto LABEL_10;
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_ERROR))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v12 = 136315650;
    v13 = "-[CSSpeechController _activateAudioSessionWithReason:delay:delayRequested:error:]_block_invoke_2";
    v14 = 2050;
    v15 = v7;
    v16 = 2114;
    v17 = v5;
    _os_log_error_impl(&dword_1C2614000, v6, OS_LOG_TYPE_ERROR, "%s Failed activate audio session with %{public}f seconds delay from prepareRecordWithSettings due to error %{public}@.", (uint8_t *)&v12, 0x20u);
  }
LABEL_10:

}

void __81__CSSpeechController__activateAudioSessionWithReason_delay_delayRequested_error___block_invoke_168(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id obj;

  v1 = a1[6];
  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "_activateAudioSessionWithReason:error:", v1, &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
}

void __43__CSSpeechController__fetchLastTriggerInfo__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "xpcClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "audioRecordContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__CSSpeechController__fetchLastTriggerInfo__block_invoke_2;
  v4[3] = &unk_1E7C24E98;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "triggerInfoForContext:completion:", v3, v4);

}

uint64_t __43__CSSpeechController__fetchLastTriggerInfo__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(a2, "copy");
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 72);
  *(_QWORD *)(v7 + 72) = v6;

  v9 = objc_msgSend(v5, "copy");
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 80);
  *(_QWORD *)(v10 + 80) = v9;

  v12 = *MEMORY[0x1E0D18F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v15 = *(_QWORD *)(v13 + 72);
    v14 = *(_QWORD *)(v13 + 80);
    v17 = 136315650;
    v18 = "-[CSSpeechController _fetchLastTriggerInfo]_block_invoke_2";
    v19 = 2114;
    v20 = v15;
    v21 = 2114;
    v22 = v14;
    _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s received lastVoiceTriggerInfo %{public}@, lastRTSTriggerInfo %{public}@", (uint8_t *)&v17, 0x20u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_setSoundPlayingState");
}

void __54__CSSpeechController_prepareRecordWithSettings_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "_shouldResetContextAtPrepare"))
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(v2, "audioRecordContext");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_fetchAudioProviderWithContext:", v3);

  }
}

void __54__CSSpeechController_prepareRecordWithSettings_error___block_invoke_158(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "audioRecordContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_fetchAudioProviderWithContext:", v2);

}

uint64_t __54__CSSpeechController_prepareRecordWithSettings_error___block_invoke_165(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createAudioPowerMeterIfNeeded");
}

void __37__CSSpeechController_startController__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 296), "setAsset:", v5);
  }
  else
  {
    v7 = (void *)*MEMORY[0x1E0D18F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      objc_msgSend(v6, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315394;
      v11 = "-[CSSpeechController startController]_block_invoke";
      v12 = 2114;
      v13 = v9;
      _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s Cannot reinitialize ContinuousVoiceTrigger since we cannot look-up VoiceTrigger asset : %{public}@", (uint8_t *)&v10, 0x16u);

    }
  }

}

void __43__CSSpeechController__initializeTimerState__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD *v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained[2];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__CSSpeechController__initializeTimerState__block_invoke_2;
  v7[3] = &unk_1E7C292A0;
  v8 = v3;
  v9 = WeakRetained;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __43__CSSpeechController__initializeTimerState__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 40), "_setTimerIsPlaying:", objc_msgSend(*(id *)(a1 + 32), "count") != 0);
  return objc_msgSend(*(id *)(a1 + 40), "_setSoundPlayingState");
}

void __43__CSSpeechController__initializeAlarmState__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD *v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained[2];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__CSSpeechController__initializeAlarmState__block_invoke_2;
  v7[3] = &unk_1E7C292A0;
  v8 = v3;
  v9 = WeakRetained;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __43__CSSpeechController__initializeAlarmState__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 40), "_setAlarmIsPlaying:", objc_msgSend(*(id *)(a1 + 32), "count") != 0);
  return objc_msgSend(*(id *)(a1 + 40), "_setSoundPlayingState");
}

void __50__CSSpeechController__initializeMediaPlayingState__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *WeakRetained;
  NSObject *v4;
  _QWORD v5[6];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained[2];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__CSSpeechController__initializeMediaPlayingState__block_invoke_2;
  v5[3] = &unk_1E7C29178;
  v5[4] = WeakRetained;
  v5[5] = a2;
  dispatch_async(v4, v5);

}

uint64_t __50__CSSpeechController__initializeMediaPlayingState__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  _BOOL8 v3;
  void *v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(a1 + 32);
  if (v2 == 4)
  {
    v3 = 0;
    v5 = 1;
  }
  else
  {
    v3 = v2 == 1;
    v5 = 0;
  }
  objc_msgSend(v4, "_setMediaPlaybackState:isInterrupted:", v3, v5);
  return objc_msgSend(*(id *)(a1 + 32), "_setSoundPlayingState");
}

uint64_t __325__CSSpeechController_initWithEndpointId_xpcClientFactory_endpointer_continuousVoiceTrigger_siriVolumeController_mediaPlayingMonitor_alarmMonitor_timerMonitor_audioSessionController_supportPhatic_supportHearstVoiceTrigger_supportTriagleModeSessionActivationRetry_supportSessionActivateDelay_supportsDuckingOnSpeakerEvaluator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startController");
}

uint64_t __325__CSSpeechController_initWithEndpointId_xpcClientFactory_endpointer_continuousVoiceTrigger_siriVolumeController_mediaPlayingMonitor_alarmMonitor_timerMonitor_audioSessionController_supportPhatic_supportHearstVoiceTrigger_supportTriagleModeSessionActivationRetry_supportSessionActivateDelay_supportsDuckingOnSpeakerEvaluator___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0C89C18], "supportsDuckingOnSpeakerOutput");
}

+ (id)sharedController
{
  if (sharedController_onceToken != -1)
    dispatch_once(&sharedController_onceToken, &__block_literal_global_8151);
  return (id)sharedController_sharedController;
}

+ (BOOL)isSmartSiriVolumeAvailable
{
  if ((CSIsHorseman() & 1) != 0)
    return 1;
  else
    return CSIsHorsemanJunior();
}

uint64_t __38__CSSpeechController_sharedController__block_invoke()
{
  CSSpeechController *v0;
  void *v1;

  v0 = objc_alloc_init(CSSpeechController);
  v1 = (void *)sharedController_sharedController;
  sharedController_sharedController = (uint64_t)v0;

  return objc_msgSend((id)sharedController_sharedController, "startController");
}

@end
