@implementation AFUISiriSession

- (AFUISiriSession)initWithConnection:(id)a3 delegateQueue:(id)a4
{
  id v7;
  id v8;
  AFUISiriSession *v9;
  AFConnection *v10;
  AFConnection *connection;
  void *v12;
  uint64_t v13;
  SRUIFStateFeedbackManager *stateFeedbackManager;
  AFSettingsConnection *v15;
  AFSettingsConnection *settingsConnection;
  SRUIFSiriSessionInfo *v17;
  SRUIFSiriSessionInfo *siriSessionInfo;
  void *v19;
  uint64_t v20;
  AFSiriClientStateManager *clientStateManager;
  uint64_t v22;
  SRUIFSiriSessionStateHandler *stateHandler;
  uint64_t v24;
  SRUIFSpeechRequestHandler *speechRequestHandler;
  id v26;
  uint64_t v27;
  SRUIFUIBridgeClient *uiBridgeClient;
  NSMutableArray *v29;
  NSMutableArray *ongoingOrchestrationTasks;
  uint64_t v31;
  SRUIFAudioPowerLevelUpdater *audioPowerLevelUpdater;
  void *v34;
  objc_super v35;

  v7 = a3;
  v8 = a4;
  v35.receiver = self;
  v35.super_class = (Class)AFUISiriSession;
  v9 = -[AFUISiriSession init](&v35, sel_init);
  if (v9)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("AFUISiriSession.m"), 228, CFSTR("Session must have a delegate queue"));

    }
    objc_storeStrong((id *)&v9->_delegateQueue, a4);
    v9->_currentRequestDidPresent = 1;
    if (v7)
      v10 = (AFConnection *)v7;
    else
      v10 = (AFConnection *)objc_alloc_init(MEMORY[0x24BE09170]);
    connection = v9->_connection;
    v9->_connection = v10;

    -[AFConnection setDelegate:](v9->_connection, "setDelegate:", v9);
    -[AFConnection setSpeechDelegate:](v9->_connection, "setSpeechDelegate:", v9);
    if (objc_msgSend(MEMORY[0x24BE091E0], "isStateFeedbackEnabled"))
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEA8670]), "initWithConnection:", v9->_connection);
      v13 = objc_msgSend(objc_alloc(MEMORY[0x24BEA8678]), "initWithStateFeedbackProvider:delegate:", v12, v9);
      stateFeedbackManager = v9->_stateFeedbackManager;
      v9->_stateFeedbackManager = (SRUIFStateFeedbackManager *)v13;

    }
    v15 = (AFSettingsConnection *)objc_alloc_init(MEMORY[0x24BE092B8]);
    settingsConnection = v9->_settingsConnection;
    v9->_settingsConnection = v15;

    v17 = (SRUIFSiriSessionInfo *)objc_alloc_init(MEMORY[0x24BEA8658]);
    siriSessionInfo = v9->_siriSessionInfo;
    v9->_siriSessionInfo = v17;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v9, sel__siriNetworkAvailabilityDidChange_, *MEMORY[0x24BE08E38], 0);

    objc_msgSend(MEMORY[0x24BE092D8], "sharedManager");
    v20 = objc_claimAutoreleasedReturnValue();
    clientStateManager = v9->_clientStateManager;
    v9->_clientStateManager = (AFSiriClientStateManager *)v20;

    v22 = objc_msgSend(objc_alloc(MEMORY[0x24BEA8660]), "initWithDelegate:", v9);
    stateHandler = v9->_stateHandler;
    v9->_stateHandler = (SRUIFSiriSessionStateHandler *)v22;

    v24 = objc_msgSend(objc_alloc(MEMORY[0x24BEA8668]), "initWithDelegate:", v9);
    speechRequestHandler = v9->_speechRequestHandler;
    v9->_speechRequestHandler = (SRUIFSpeechRequestHandler *)v24;

    v26 = objc_alloc(MEMORY[0x24BEA8688]);
    v27 = objc_msgSend(v26, "initWithStateHandler:delegateQueue:", v9->_stateHandler, MEMORY[0x24BDAC9B8]);
    uiBridgeClient = v9->_uiBridgeClient;
    v9->_uiBridgeClient = (SRUIFUIBridgeClient *)v27;

    -[SRUIFUIBridgeClient setDelegate:](v9->_uiBridgeClient, "setDelegate:", v9);
    v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    ongoingOrchestrationTasks = v9->_ongoingOrchestrationTasks;
    v9->_ongoingOrchestrationTasks = v29;

    if (objc_msgSend(MEMORY[0x24BE091E0], "isContinuousConversationEnabled"))
    {
      v31 = objc_msgSend(objc_alloc(MEMORY[0x24BEA8618]), "initWithDelegate:", v9);
      audioPowerLevelUpdater = v9->_audioPowerLevelUpdater;
      v9->_audioPowerLevelUpdater = (SRUIFAudioPowerLevelUpdater *)v31;

    }
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  void *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v7;
  __CFString *v8;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[AFUISiriSession _connection](self, "_connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[AFUISiriSession dealloc]";
      _os_log_impl(&dword_217514000, v4, OS_LOG_TYPE_DEFAULT, "%s #session AFConnection was still alive when AFUISiriSession was being deallocated. Cleaning up the connection…", buf, 0xCu);
    }
    -[AFUISiriSession _discardConnectionForReason:](self, "_discardConnectionForReason:", 0);
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.LocalAuthentication.ui.presented"), 0);
  v7 = CFNotificationCenterGetDarwinNotifyCenter();
  getOptionalPKDarwinNotificationEventInAppPresented();
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterRemoveObserver(v7, self, v8, 0);

  v9.receiver = self;
  v9.super_class = (Class)AFUISiriSession;
  -[AFUISiriSession dealloc](&v9, sel_dealloc);
}

- (void)_siriNetworkAvailabilityDidChange:(id)a3
{
  -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", &__block_literal_global_3);
}

uint64_t __53__AFUISiriSession__siriNetworkAvailabilityDidChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionDidChangeNetworkAvailability");
}

- (AFConnection)_connection
{
  AFConnection *connection;

  connection = self->_connection;
  if (!connection)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[AFUISiriSession _connection].cold.1();
    connection = self->_connection;
  }
  return connection;
}

- (void)sessionStateHandler:(id)a3 didTransitionFromState:(int64_t)a4 toState:(int64_t)a5 forEvent:(int64_t)a6 machAbsoluteTime:(double)a7
{
  id WeakRetained;
  _QWORD v13[8];

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __96__AFUISiriSession_sessionStateHandler_didTransitionFromState_toState_forEvent_machAbsoluteTime___block_invoke;
  v13[3] = &__block_descriptor_64_e35_v16__0___AFUISiriSessionDelegate__8l;
  v13[4] = a4;
  v13[5] = a5;
  v13[6] = a6;
  *(double *)&v13[7] = a7;
  -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", v13);
  WeakRetained = objc_loadWeakRetained((id *)&self->_localDelegate);
  objc_msgSend(WeakRetained, "siriSession:didChangeToState:event:machAbsoluteTransitionTime:", self, a5, a6, a7);

  -[SRUIFStateFeedbackManager didTransitionFromState:toState:](self->_stateFeedbackManager, "didTransitionFromState:toState:", a4, a5);
  -[SRUIFAudioPowerLevelUpdater sessionStateDidChangeTo:isAttending:](self->_audioPowerLevelUpdater, "sessionStateDidChangeTo:isAttending:", a5, -[AFUISiriSession attendingState](self, "attendingState"));
}

uint64_t __96__AFUISiriSession_sessionStateHandler_didTransitionFromState_toState_forEvent_machAbsoluteTime___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionDidTransitionFromState:toState:event:machAbsoluteTransitionTime:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
}

- (void)speechRequestHandlerWillCancelSpeechRequest:(id)a3
{
  -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", &__block_literal_global_35);
}

uint64_t __63__AFUISiriSession_speechRequestHandlerWillCancelSpeechRequest___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionWillCancelRequest");
}

- (void)speechRequestHandlerDidCancelSpeechRequest:(id)a3
{
  -[SRUIFSiriSessionStateHandler performTransitionForEvent:](self->_stateHandler, "performTransitionForEvent:", 5);
  -[AFUISiriSession _requestDidFinishWithError:](self, "_requestDidFinishWithError:", 0);
}

- (BOOL)speechRequestHandlerShouldRollBackRequestForSpeechCancellation:(id)a3
{
  _BOOL4 v4;

  v4 = -[AFUISiriSession _hasActiveRequest](self, "_hasActiveRequest", a3);
  if (v4)
    LOBYTE(v4) = !self->_currentRequestDidPresent;
  return v4;
}

- (void)duckTTSToVolume:(float)a3 rampTime:(double)a4 completion:(id)a5
{
  -[AFUISiriSessionDelegate siriSessionRequestsTTSDuckToVolume:rampTime:completion:](self->_delegate, "siriSessionRequestsTTSDuckToVolume:rampTime:completion:", a5);
}

- (void)showAssetsDownloadNotificationPrompt
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (-[AFUISiriSession _isContinuousConversationAvailable](self, "_isContinuousConversationAvailable"))
  {
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[AFUISiriSession showAssetsDownloadNotificationPrompt]";
      _os_log_impl(&dword_217514000, v3, OS_LOG_TYPE_DEFAULT, "%s client recieved request to show Adavnced Features assets download notification.", (uint8_t *)&v4, 0xCu);
    }
    -[AFUISiriSessionDelegate siriSessionRequestsToShowAssetsDownloadNotificationPrompt](self->_delegate, "siriSessionRequestsToShowAssetsDownloadNotificationPrompt");
  }
}

- (void)cancelPhotoSelectionWithAnimation:(BOOL)a3
{
  -[AFUISiriSessionDelegate siriSessionRequestedCancelPhotoSelectionWithAnimation:](self->_delegate, "siriSessionRequestedCancelPhotoSelectionWithAnimation:", a3);
}

- (void)requestPhotoSelectionWithSearchString:(id)a3 completion:(id)a4
{
  -[AFUISiriSessionDelegate siriSessionRequestedPhotoSelectionWithSearchString:completion:](self->_delegate, "siriSessionRequestedPhotoSelectionWithSearchString:completion:", a3, a4);
}

- (void)recievedOrchestrationTaskswithIDs:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[AFUISiriSession recievedOrchestrationTaskswithIDs:]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_217514000, v5, OS_LOG_TYPE_DEFAULT, "%s recievedOrchestrationTaskswithIDs : %@", (uint8_t *)&v6, 0x16u);
  }
  -[NSMutableArray addObjectsFromArray:](self->_ongoingOrchestrationTasks, "addObjectsFromArray:", v4);

}

- (void)orchestrationTaskEnded:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[AFUISiriSession orchestrationTaskEnded:]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_217514000, v5, OS_LOG_TYPE_DEFAULT, "%s orchestrationTaskEnded : %@", (uint8_t *)&v6, 0x16u);
  }
  -[AFUISiriSession _orchestrationTaskCompleted:](self, "_orchestrationTaskCompleted:", v4);

}

- (void)orchestrationTaskWasCancelled:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[AFUISiriSession orchestrationTaskWasCancelled:]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_217514000, v5, OS_LOG_TYPE_DEFAULT, "%s orchestrationTaskWasCancelled : %@", (uint8_t *)&v6, 0x16u);
  }
  -[AFUISiriSession _orchestrationTaskCompleted:](self, "_orchestrationTaskCompleted:", v4);

}

- (void)_orchestrationTaskCompleted:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSMutableArray containsObject:](self->_ongoingOrchestrationTasks, "containsObject:"))
    -[NSMutableArray removeObject:](self->_ongoingOrchestrationTasks, "removeObject:", v4);

}

- (void)receivedRequestProgressUpdate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__AFUISiriSession_receivedRequestProgressUpdate___block_invoke;
  v6[3] = &unk_24D7A2350;
  v7 = v4;
  v5 = v4;
  -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", v6);

}

uint64_t __49__AFUISiriSession_receivedRequestProgressUpdate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionDidReceiveLatencyProgressUpdate:", *(_QWORD *)(a1 + 32));
}

- (void)orchestrationDidPresentResponseFullyInApp
{
  -[AFUISiriSessionDelegate orchestrationDidPresentResponseFullyInApp](self->_delegate, "orchestrationDidPresentResponseFullyInApp");
}

- (void)setDelegate:(id)a3
{
  id v5;
  _QWORD v6[5];

  v5 = a3;
  objc_storeStrong((id *)&self->_delegate, a3);
  if (self->_siriSessionInfo && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __31__AFUISiriSession_setDelegate___block_invoke;
    v6[3] = &unk_24D7A2350;
    v6[4] = self;
    -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", v6);
  }

}

uint64_t __31__AFUISiriSession_setDelegate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionDidInitializeSessionInfo:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));
}

- (void)_performBlockWithDelegate:(id)a3
{
  id v4;
  NSObject *delegateQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__AFUISiriSession__performBlockWithDelegate___block_invoke;
  block[3] = &unk_24D7A2378;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(delegateQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __45__AFUISiriSession__performBlockWithDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

- (void)idleAndQuietStatusDidChange:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[AFUISiriSession _isContinuousConversationAvailable](self, "_isContinuousConversationAvailable"))
    -[SRUIFUIBridgeClient idleAndQuietDidChange:](self->_uiBridgeClient, "idleAndQuietDidChange:", v3);
}

- (void)stateFeedbackManagerDidStartPlaybackForStateFeedbackType:(int64_t)a3
{
  if (!a3)
  {
    -[SRUIFSiriSessionStateHandler performTransitionForEvent:](self->_stateHandler, "performTransitionForEvent:", 15);
    -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", &__block_literal_global_39);
  }
}

uint64_t __76__AFUISiriSession_stateFeedbackManagerDidStartPlaybackForStateFeedbackType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionDidEnterLatencyState");
}

- (void)setLocalDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_localDataSource, a3);
}

- (void)preheat
{
  id v2;

  -[AFUISiriSession _connection](self, "_connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preheatWithStyle:", 1);

}

- (void)forceAudioSessionActive
{
  -[AFUISiriSession forceAudioSessionActiveWithCompletion:](self, "forceAudioSessionActiveWithCompletion:", 0);
}

- (void)launchedIntoListeningAtTime:(double)a3
{
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[AFUISiriSession launchedIntoListeningAtTime:]";
    _os_log_impl(&dword_217514000, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
  }
  -[SRUIFSiriSessionStateHandler performTransitionForEvent:eventTimeStamp:](self->_stateHandler, "performTransitionForEvent:eventTimeStamp:", 14, a3);
}

- (void)forceAudioSessionActiveWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _BOOL4 isDeviceInStarkMode;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __57__AFUISiriSession_forceAudioSessionActiveWithCompletion___block_invoke;
  v12[3] = &unk_24D7A23C0;
  v5 = v4;
  v13 = v5;
  v6 = (void *)MEMORY[0x219A0D984](v12);
  isDeviceInStarkMode = self->_isDeviceInStarkMode;
  v8 = *MEMORY[0x24BE08FB0];
  v9 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT);
  if (isDeviceInStarkMode)
  {
    if (v9)
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[AFUISiriSession forceAudioSessionActiveWithCompletion:]";
      _os_log_impl(&dword_217514000, v8, OS_LOG_TYPE_DEFAULT, "%s #tts #carPlay AudioSession CarPlay", buf, 0xCu);
    }
    -[AFUISiriSession _connection](self, "_connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE09360]), "initWithActivationEvent:", 9);
    objc_msgSend(v10, "forceAudioSessionActiveWithOptions:reason:speechRequestOptions:completion:", 1, 3, v11, v6);

  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[AFUISiriSession forceAudioSessionActiveWithCompletion:]";
      _os_log_impl(&dword_217514000, v8, OS_LOG_TYPE_DEFAULT, "%s #tts AudioSession", buf, 0xCu);
    }
    -[AFUISiriSession _connection](self, "_connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "forceAudioSessionActiveWithOptions:reason:completion:", 1, 3, v6);
  }

}

void __57__AFUISiriSession_forceAudioSessionActiveWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  __CFString *v5;
  NSObject *v6;
  const __CFString *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("Success");
    v9 = 136315650;
    v10 = "-[AFUISiriSession forceAudioSessionActiveWithCompletion:]_block_invoke";
    if (v5)
      v7 = v5;
    v11 = 2112;
    v12 = v7;
    v13 = 1024;
    v14 = a2;
    _os_log_impl(&dword_217514000, v6, OS_LOG_TYPE_DEFAULT, "%s #tts AudioSession Handler:%@ audioSessionID:%u", (uint8_t *)&v9, 0x1Cu);
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v8 + 16))(v8, a2, v5);

}

- (void)forceAudioSessionInactive
{
  id v2;

  -[AFUISiriSession _connection](self, "_connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forceAudioSessionInactive");

}

- (void)resumeInterruptedAudioPlaybackIfNeeded
{
  id v2;

  -[AFUISiriSession _connection](self, "_connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resumeInterruptedAudioPlaybackIfNeeded");

}

+ (unint64_t)availabilityState
{
  void *v2;
  int v3;

  if (!AFHasUnlockedSinceBoot())
    return 2;
  objc_msgSend(MEMORY[0x24BEA8620], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "understandingOnDeviceAssetsAvailable");

  if ((v3 & 1) == 0 && (AFDeviceSupportsDisablingServerFallbackWhenMissingAsset() & 1) != 0)
    return 3;
  if (objc_msgSend(MEMORY[0x24BE09170], "isAvailable"))
    return (objc_msgSend(MEMORY[0x24BE09170], "isNetworkAvailable") | v3) ^ 1;
  return 1;
}

+ (void)beginMonitoringSiriAvailability
{
  objc_msgSend(MEMORY[0x24BE09170], "beginMonitoringAvailability");
}

- (void)emitSiriWasUnavailableEventWithRequestOptions:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  os_log_t *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  os_log_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = mach_absolute_time();
  -[AFUISiriSession _processInstrumentationForFinalOptionsAndGenerateNewTurn:](self, "_processInstrumentationForFinalOptionsAndGenerateNewTurn:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUISiriSession localDataSource](self, "localDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUISiriSession _invocationEventForRequestOptions:localDataSource:](self, "_invocationEventForRequestOptions:localDataSource:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (os_log_t *)MEMORY[0x24BE08FB0];
  v10 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    objc_msgSend(v6, "turnIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "formattedText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 136315906;
    v23 = "-[AFUISiriSession emitSiriWasUnavailableEventWithRequestOptions:]";
    v24 = 2112;
    v25 = v8;
    v26 = 2112;
    v27 = v12;
    v28 = 2112;
    v29 = v13;
    _os_log_impl(&dword_217514000, v11, OS_LOG_TYPE_DEFAULT, "%s #instrumentation %@ in turn %@: \n%@", (uint8_t *)&v22, 0x2Au);

  }
  objc_msgSend(v6, "emitInstrumentation:machAbsoluteTime:", v8, v5);
  v14 = objc_alloc_init(MEMORY[0x24BE95C00]);
  objc_msgSend(v14, "setReason:", 2);
  objc_msgSend(v14, "setProduct:", 1);
  objc_msgSend(MEMORY[0x24BEA8620], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "assistantUODStatus");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 && objc_msgSend(v16, "count"))
  {
    -[AFUISiriSession _getMissingAssetTypes:](self, "_getMissingAssetTypes:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAssetTypes:", v17);

  }
  v18 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    v19 = v18;
    objc_msgSend(v6, "turnIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "formattedText");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 136315906;
    v23 = "-[AFUISiriSession emitSiriWasUnavailableEventWithRequestOptions:]";
    v24 = 2112;
    v25 = v14;
    v26 = 2112;
    v27 = v20;
    v28 = 2112;
    v29 = v21;
    _os_log_impl(&dword_217514000, v19, OS_LOG_TYPE_DEFAULT, "%s #instrumentation %@ in turn %@: \n%@", (uint8_t *)&v22, 0x2Au);

  }
  objc_msgSend(v6, "emitInstrumentation:machAbsoluteTime:", v14, v5);

}

- (id)_getMissingAssetTypes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "objectForKey:", CFSTR("SPEECH"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

  }
  objc_msgSend(v3, "objectForKey:", CFSTR("NL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

  }
  objc_msgSend(v3, "objectForKey:", CFSTR("MORPHUN"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v10);

  }
  objc_msgSend(v3, "objectForKey:", CFSTR("ATTENTION"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v12);

  }
  if (!objc_msgSend(v4, "count") && os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    -[AFUISiriSession _getMissingAssetTypes:].cold.1();

  return v4;
}

- (BOOL)_isContinuousConversationAvailable
{
  int v3;

  v3 = _os_feature_enabled_impl();
  if (v3)
  {
    if (self->_isDeviceInStarkMode)
      LOBYTE(v3) = _os_feature_enabled_impl();
    else
      LOBYTE(v3) = 1;
  }
  return v3;
}

- (id)_processInstrumentationForFinalOptionsAndGenerateNewTurn:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  SASActivationInstrumentationSender *activationInstrumentationSender;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  SASActivationInstrumentationSender *v47;
  void *v48;
  SASActivationInstrumentationSender *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v64;
  void *v65;
  char v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  AFUISiriSession *val;
  _QWORD v72[4];
  id v73;
  id v74[2];
  char v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _QWORD block[4];
  id v81;
  id v82;
  uint8_t v83[128];
  uint8_t buf[4];
  const char *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  void *v91;
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v70 = a3;
  val = self;
  -[AFUISiriSession localDataSource](self, "localDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUISiriSession _invocationEventForRequestOptions:localDataSource:](val, "_invocationEventForRequestOptions:localDataSource:", v70, v4);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v69, "invocationSource") != 52)
  {
    if (objc_msgSend(v69, "invocationSource") == 48)
    {
      objc_msgSend(MEMORY[0x24BEA8640], "sharedManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "latestStoredTurn");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v68 = (id)objc_msgSend(MEMORY[0x24BE090D0], "newTurnBasedContextWithPreviousTurnID:", v14);
      v15 = (void *)*MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v16 = v15;
        objc_msgSend(v68, "turnIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v85 = "-[AFUISiriSession _processInstrumentationForFinalOptionsAndGenerateNewTurn:]";
        v86 = 2112;
        v87 = v17;
        v88 = 2112;
        v89 = v14;
        _os_log_impl(&dword_217514000, v16, OS_LOG_TYPE_DEFAULT, "%s #instrumentation New Turn %@ <-> Old Turn %@ ", buf, 0x20u);

      }
    }
    else if (objc_msgSend(v69, "invocationSource") == 92)
    {
      objc_msgSend(MEMORY[0x24BEA8640], "sharedManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "latestResponseProducingTurn");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v68 = (id)objc_msgSend(MEMORY[0x24BE090D0], "newTurnBasedContextWithPreviousTurnID:", v14);
      v19 = (void *)*MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v20 = v19;
        objc_msgSend(v68, "turnIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v85 = "-[AFUISiriSession _processInstrumentationForFinalOptionsAndGenerateNewTurn:]";
        v86 = 2112;
        v87 = v21;
        v88 = 2112;
        v89 = v14;
        _os_log_impl(&dword_217514000, v20, OS_LOG_TYPE_DEFAULT, "%s #instrumentation New Turn %@ <-> Old Turn %@ ", buf, 0x20u);

      }
    }
    else
    {
      if (objc_msgSend(v69, "invocationSource") != 29)
      {
        objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)objc_msgSend(v31, "newTurnBasedInstrumentationContext");

        v33 = (void *)*MEMORY[0x24BE08FB0];
        v66 = 0;
        v68 = v32;
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
          goto LABEL_24;
        v34 = v33;
        objc_msgSend(v32, "turnIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v85 = "-[AFUISiriSession _processInstrumentationForFinalOptionsAndGenerateNewTurn:]";
        v86 = 2112;
        v87 = v35;
        _os_log_impl(&dword_217514000, v34, OS_LOG_TYPE_DEFAULT, "%s #instrumentation New Turn %@ ", buf, 0x16u);

        goto LABEL_23;
      }
      objc_msgSend(MEMORY[0x24BEA8640], "sharedManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "latestStoredTurn");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v68 = (id)objc_msgSend(MEMORY[0x24BE090D0], "newTurnBasedContextWithPreviousTurnID:", v14);
      v28 = (void *)*MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v29 = v28;
        objc_msgSend(v68, "turnIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v85 = "-[AFUISiriSession _processInstrumentationForFinalOptionsAndGenerateNewTurn:]";
        v86 = 2112;
        v87 = v30;
        v88 = 2112;
        v89 = v14;
        _os_log_impl(&dword_217514000, v29, OS_LOG_TYPE_DEFAULT, "%s #instrumentation New Turn %@ <-> Old Turn %@ ", buf, 0x20u);

      }
    }

LABEL_23:
    v66 = 0;
    goto LABEL_24;
  }
  objc_msgSend(v70, "previousTurnIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BE090D0];
    objc_msgSend(v70, "previousTurnIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "newTurnBasedContextWithPreviousTurnID:", v7);

    v9 = (void *)*MEMORY[0x24BE08FB0];
    v68 = v8;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      objc_msgSend(v8, "turnIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "previousTurnIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v85 = "-[AFUISiriSession _processInstrumentationForFinalOptionsAndGenerateNewTurn:]";
      v86 = 2112;
      v87 = v11;
      v88 = 2112;
      v89 = v12;
      _os_log_impl(&dword_217514000, v10, OS_LOG_TYPE_DEFAULT, "%s #instrumentation New Turn %@ <-> Old Turn %@ ", buf, 0x20u);

    }
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "newTurnBasedInstrumentationContext");

  v24 = (void *)*MEMORY[0x24BE08FB0];
  v68 = v23;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v25 = v24;
    objc_msgSend(v23, "turnIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v85 = "-[AFUISiriSession _processInstrumentationForFinalOptionsAndGenerateNewTurn:]";
    v86 = 2112;
    v87 = v26;
    _os_log_impl(&dword_217514000, v25, OS_LOG_TYPE_DEFAULT, "%s #instrumentation New Turn %@ ", buf, 0x16u);

  }
  v66 = 1;
LABEL_24:
  if (objc_msgSend(v70, "isInitialBringUp"))
  {
    objc_initWeak((id *)buf, val);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76__AFUISiriSession__processInstrumentationForFinalOptionsAndGenerateNewTurn___block_invoke;
    block[3] = &unk_24D7A1D90;
    objc_copyWeak(&v82, (id *)buf);
    v81 = v68;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    objc_destroyWeak(&v82);
    objc_destroyWeak((id *)buf);
  }
  -[AFUISiriSession _setInstrumentationTurnContext:](val, "_setInstrumentationTurnContext:", v68);
  v36 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v37 = v36;
    -[AFUISiriSession _instrumentationTurnContext](val, "_instrumentationTurnContext");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "turnIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "formattedText");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v85 = "-[AFUISiriSession _processInstrumentationForFinalOptionsAndGenerateNewTurn:]";
    v86 = 2112;
    v87 = v69;
    v88 = 2112;
    v89 = v39;
    v90 = 2112;
    v91 = v40;
    _os_log_impl(&dword_217514000, v37, OS_LOG_TYPE_DEFAULT, "%s #instrumentation %@ in turn %@: \n%@", buf, 0x2Au);

  }
  -[AFUISiriSession _instrumentationTurnContext](val, "_instrumentationTurnContext");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "emitInstrumentation:machAbsoluteTime:", v69, mach_absolute_time());

  objc_msgSend(v70, "activationEventInstrumentationIdenifier");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (v67)
  {
    activationInstrumentationSender = val->_activationInstrumentationSender;
    if (!activationInstrumentationSender)
    {
      v43 = objc_alloc(MEMORY[0x24BE907C0]);
      objc_msgSend(MEMORY[0x24BE909B0], "sharedAnalytics");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "defaultMessageStream");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v43, "initWithAnalyticsStream:", v45);
      v47 = val->_activationInstrumentationSender;
      val->_activationInstrumentationSender = (SASActivationInstrumentationSender *)v46;

      activationInstrumentationSender = val->_activationInstrumentationSender;
    }
    objc_msgSend(v68, "turnIdentifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASActivationInstrumentationSender instrumentTurnActivatedWithTurnId:activationEventIdentifier:](activationInstrumentationSender, "instrumentTurnActivatedWithTurnId:activationEventIdentifier:", v48, v67);

    v49 = val->_activationInstrumentationSender;
    objc_msgSend(v68, "turnIdentifier");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASActivationInstrumentationSender instrumentRequestLinkToUEIWithTurnId:activationEventIdentifier:](v49, "instrumentRequestLinkToUEIWithTurnId:activationEventIdentifier:", v50, v67);

  }
  SRUIFConstructLaunchContextForLaunchStarted();
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v70, "requestSource") == 22)
  {
    objc_msgSend(v70, "buttonDownTimestamp");
  }
  else if (objc_msgSend(v70, "requestSource") == 43)
  {
    objc_msgSend(v70, "computedActivationTime");
  }
  else
  {
    objc_msgSend(v70, "timestamp");
  }
  v64 = (void *)AFGetMachAbsoluteTimeFromTimeInterval();
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  objc_msgSend(v70, "instrumentationEvents");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v76, v83, 16);
  if (v52)
  {
    v53 = *(_QWORD *)v77;
    do
    {
      for (i = 0; i != v52; ++i)
      {
        if (*(_QWORD *)v77 != v53)
          objc_enumerationMutation(v51);
        v55 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
        v56 = (void *)*MEMORY[0x24BE08FB0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
        {
          v57 = v56;
          -[AFUISiriSession _instrumentationTurnContext](val, "_instrumentationTurnContext");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "turnIdentifier");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "formattedText");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v85 = "-[AFUISiriSession _processInstrumentationForFinalOptionsAndGenerateNewTurn:]";
          v86 = 2112;
          v87 = v55;
          v88 = 2112;
          v89 = v59;
          v90 = 2112;
          v91 = v60;
          _os_log_impl(&dword_217514000, v57, OS_LOG_TYPE_DEFAULT, "%s #instrumentation %@ in turn %@: \n%@", buf, 0x2Au);

        }
        -[AFUISiriSession _instrumentationTurnContext](val, "_instrumentationTurnContext");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "emitInstrumentation:machAbsoluteTime:", v55, mach_absolute_time());

      }
      v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v76, v83, 16);
    }
    while (v52);
  }

  objc_initWeak((id *)buf, val);
  v72[0] = MEMORY[0x24BDAC760];
  v72[1] = 3221225472;
  v72[2] = __76__AFUISiriSession__processInstrumentationForFinalOptionsAndGenerateNewTurn___block_invoke_56;
  v72[3] = &unk_24D7A23E8;
  objc_copyWeak(v74, (id *)buf);
  v62 = v65;
  v73 = v62;
  v74[1] = v64;
  v75 = v66;
  -[AFUISiriSession _performBlockWithDelegate:](val, "_performBlockWithDelegate:", v72);

  objc_destroyWeak(v74);
  objc_destroyWeak((id *)buf);

  return v68;
}

void __76__AFUISiriSession__processInstrumentationForFinalOptionsAndGenerateNewTurn___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 15);
    objc_msgSend(v3, "siriSession:initialBringupProcessedWithTurnIdentifier:", v4, *(_QWORD *)(a1 + 32));

    WeakRetained = v4;
  }

}

void __76__AFUISiriSession__processInstrumentationForFinalOptionsAndGenerateNewTurn___block_invoke_56(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_instrumentationTurnContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriSessionDidStartNewTurn:associatedLaunchStartContext:machAbsoluteTime:linkPreviousTurn:", v5, *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), (double)*(unint64_t *)(a1 + 48));

}

- (void)_startRequestWithFinalOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  AFSettingsConnection *settingsConnection;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  id WeakRetained;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
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
  void *v55;
  id v56;
  id v57;
  id v58;
  _QWORD v59[4];
  id v60;
  id location;
  uint8_t buf[4];
  const char *v63;
  __int16 v64;
  id v65;
  __int16 v66;
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[AFUISiriSession _processInstrumentationForFinalOptionsAndGenerateNewTurn:](self, "_processInstrumentationForFinalOptionsAndGenerateNewTurn:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
    -[AFUISiriSession _updateModesHeuristicsForRequestOptions:](self, "_updateModesHeuristicsForRequestOptions:", v6);
  objc_initWeak(&location, self);
  if (-[AFUISiriSession _shouldFetchActiveAccount](self, "_shouldFetchActiveAccount"))
  {
    -[SRUIFSiriSessionInfo activeAccount](self->_siriSessionInfo, "activeAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == 0;

    if (v10)
    {
      settingsConnection = self->_settingsConnection;
      v59[0] = MEMORY[0x24BDAC760];
      v59[1] = 3221225472;
      v59[2] = __60__AFUISiriSession__startRequestWithFinalOptions_completion___block_invoke;
      v59[3] = &unk_24D7A2438;
      objc_copyWeak(&v60, &location);
      -[AFSettingsConnection fetchAccountsWithCompletion:](settingsConnection, "fetchAccountsWithCompletion:", v59);
      objc_destroyWeak(&v60);
    }
  }
  objc_msgSend(v6, "requestInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "turnIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v14)
  {
    -[AFUISiriSession _instrumentationTurnContext](self, "_instrumentationTurnContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "requestInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "turnIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTurnIdentifier:", v17);

    v18 = (id)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v15, "turnIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v63 = "-[AFUISiriSession _startRequestWithFinalOptions:completion:]";
      v64 = 2112;
      v65 = v19;
      v66 = 2112;
      v67 = v6;
      _os_log_impl(&dword_217514000, v18, OS_LOG_TYPE_DEFAULT, "%s #instrumentation Specified turn %@ to final options %@", buf, 0x20u);

    }
  }
  if (objc_msgSend(v6, "requestSource") == 14 || objc_msgSend(v6, "requestSource") == 13)
  {
    objc_msgSend(v6, "requestInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "startLocalRequest");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = (id)*MEMORY[0x24BE08FB0];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v20, "startLocalRequest");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v63 = "-[AFUISiriSession _startRequestWithFinalOptions:completion:]";
        v64 = 2112;
        v65 = v6;
        v66 = 2112;
        v67 = v23;
        _os_log_impl(&dword_217514000, v22, OS_LOG_TYPE_DEFAULT, "%s #activation #carPlay activating requested direct action via Native Siri Kit. SASRequestOptions: %@, SAStartLocalRequest: %@", buf, 0x20u);

      }
      objc_copyWeak(&v58, &location);
      v56 = v20;
      v57 = v7;
      SRUIFInvokeOnMainQueue();

      objc_destroyWeak(&v58);
    }
    else
    {
      objc_msgSend(v20, "legacyDirectActionIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        v25 = *MEMORY[0x24BE08FB0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v63 = "-[AFUISiriSession _startRequestWithFinalOptions:completion:]";
          v64 = 2112;
          v65 = v6;
          _os_log_impl(&dword_217514000, v25, OS_LOG_TYPE_DEFAULT, "%s #activation #carPlay activating requested direct action via Legacy. SASRequestOptions: %@", buf, 0x16u);
        }
        objc_msgSend(v6, "directActionApplicationContext");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[AFUISiriSession _startLegacyDirectActionRequestWithInfo:context:completion:](self, "_startLegacyDirectActionRequestWithInfo:context:completion:", v20, v26, v7);

      }
      else
      {
        objc_msgSend(v6, "bulletin");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v34 = *MEMORY[0x24BE08FB0];
        v35 = *MEMORY[0x24BE08FB0];
        if (v33)
        {
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v63 = "-[AFUISiriSession _startRequestWithFinalOptions:completion:]";
            v64 = 2112;
            v65 = v6;
            _os_log_impl(&dword_217514000, v34, OS_LOG_TYPE_DEFAULT, "%s #activation #carPlay activating requested direct action with no direct action specified. SASRequestOptions: %@", buf, 0x16u);
          }
          objc_msgSend(v6, "bulletin");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[AFUISiriSession _startRequestForReadoutOfBulletin:](self, "_startRequestForReadoutOfBulletin:", v36);

        }
        else
        {
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            -[AFUISiriSession _startRequestWithFinalOptions:completion:].cold.1();
          if (v7)
          {
            objc_msgSend(MEMORY[0x24BE091D8], "errorWithCode:description:underlyingError:", 2510, CFSTR("Unable to handle direct action request options"), 0);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(id, void *))v7 + 2))(v7, v38);

          }
        }
      }
    }

    goto LABEL_37;
  }
  if (objc_msgSend(v6, "requestSource") == 21)
  {
    objc_msgSend(v6, "requestInfo");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "directActionApplicationContext");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFUISiriSession _startLegacyDirectActionRequestWithInfo:context:completion:](self, "_startLegacyDirectActionRequestWithInfo:context:completion:", v27, v28, v7);

    goto LABEL_37;
  }
  if (objc_msgSend(v6, "requestSource") == 12)
  {
    objc_msgSend(v6, "requestInfo");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "speechRequestOptions");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
LABEL_24:
      objc_msgSend(v6, "requestInfo");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "speechRequestOptions");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFUISiriSession _startSpeechRequestWithSpeechRequestOptions:isInitialBringUp:completion:](self, "_startSpeechRequestWithSpeechRequestOptions:isInitialBringUp:completion:", v32, objc_msgSend(v6, "isInitialBringUp"), v7);

      goto LABEL_37;
    }
    objc_msgSend(v6, "requestInfo");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
LABEL_52:
      objc_msgSend(v6, "requestInfo");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFUISiriSession _startRequestWithInfo:completion:](self, "_startRequestWithInfo:completion:", v47, v7);

      goto LABEL_37;
    }
LABEL_58:
    -[AFUISiriSession _startSpeechRequestWithOptions:completion:](self, "_startSpeechRequestWithOptions:completion:", v6, v7);
    goto LABEL_37;
  }
  if (objc_msgSend(v6, "requestSource") == 15)
  {
    objc_msgSend(v6, "requestInfo");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
      goto LABEL_52;
    objc_msgSend(v6, "text");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
LABEL_50:
      objc_msgSend(v6, "text");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "turnIdentifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFUISiriSession _startRequestWithText:turnIdentifier:completion:](self, "_startRequestWithText:turnIdentifier:completion:", v44, v45, v7);

      goto LABEL_37;
    }
    objc_msgSend(v6, "speechFileURL");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
LABEL_54:
      objc_msgSend(v6, "speechFileURL");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFUISiriSession _startSpeechRequestWithSpeechFileAtURL:completion:](self, "_startSpeechRequestWithSpeechFileAtURL:completion:", v49, v7);

      goto LABEL_37;
    }
    if (objc_msgSend(v6, "inputType") == 2)
      goto LABEL_58;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[AFUISiriSession _startRequestWithFinalOptions:completion:].cold.2();
  }
  else
  {
    if (objc_msgSend(v6, "requestSource") == 18
      || objc_msgSend(v6, "requestSource") == 37
      || objc_msgSend(v6, "requestSource") == 40
      || objc_msgSend(v6, "requestSource") == 42
      || objc_msgSend(v6, "requestSource") == 41)
    {
      objc_msgSend(v6, "requestInfo");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "speechRequestOptions");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
        goto LABEL_24;
      objc_msgSend(v6, "requestInfo");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (v46)
        goto LABEL_52;
      objc_msgSend(v6, "speechRequestOptions");
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v50)
      {
        objc_msgSend(v6, "continuityInfo");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[AFUISiriSession _startContinuityRequestWithInfo:completion:](self, "_startContinuityRequestWithInfo:completion:", v51, v7);

        goto LABEL_37;
      }
      goto LABEL_58;
    }
    if (objc_msgSend(v6, "requestSource") == 20
      || objc_msgSend(v6, "requestSource") == 34
      || objc_msgSend(v6, "requestSource") == 39)
    {
      if (v7)
        (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    }
    else
    {
      if (objc_msgSend(v6, "isPronunciationRequest"))
      {
        objc_msgSend(v6, "pronunciationContext");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[AFUISiriSession _startSpeechPronunciationRequestWithContext:options:completion:](self, "_startSpeechPronunciationRequestWithContext:options:completion:", v52, v6, v7);

        goto LABEL_37;
      }
      objc_msgSend(v6, "text");
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      if (v53)
        goto LABEL_50;
      objc_msgSend(v6, "speechFileURL");
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      if (v54)
        goto LABEL_54;
      if (objc_msgSend(v6, "inputType") == 2)
        goto LABEL_58;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
        -[AFUISiriSession _startRequestWithFinalOptions:completion:].cold.3();
      if (v7)
      {
        objc_msgSend(MEMORY[0x24BE091D8], "errorWithCode:description:underlyingError:", 2510, CFSTR("Unexpected UI request options."), 0);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *))v7 + 2))(v7, v55);

      }
    }
  }
LABEL_37:
  if (objc_msgSend(v6, "isFlexibleFollowupRequest"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_localDelegate);
    objc_msgSend(WeakRetained, "siriSessionDidReactivateFromFlexibleFollowups");

  }
  objc_destroyWeak(&location);

}

void __60__AFUISiriSession__startRequestWithFinalOptions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t i;
  void *v15;
  _QWORD block[6];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      __60__AFUISiriSession__startRequestWithFinalOptions_completion___block_invoke_cold_1();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v8 = v5;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v19;
        v12 = MEMORY[0x24BDAC760];
        v13 = MEMORY[0x24BDAC9B8];
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v19 != v11)
              objc_enumerationMutation(v8);
            v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
            if (objc_msgSend(v15, "isActive"))
            {
              block[0] = v12;
              block[1] = 3221225472;
              block[2] = __60__AFUISiriSession__startRequestWithFinalOptions_completion___block_invoke_59;
              block[3] = &unk_24D7A2410;
              block[4] = WeakRetained;
              block[5] = v15;
              v17 = v8;
              dispatch_async(v13, block);

            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v10);
      }

      v6 = 0;
    }

  }
}

uint64_t __60__AFUISiriSession__startRequestWithFinalOptions_completion___block_invoke_59(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateActiveAccount:withNumberOfActiveAccounts:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "count"));
}

void __60__AFUISiriSession__startRequestWithFinalOptions_completion___block_invoke_61(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_startRequestWithInfo:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_startRequestForReadoutOfBulletin:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[AFUISiriSession _startRequestForReadoutOfBulletin:]";
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_217514000, v6, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  if (v4)
  {
    -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", &__block_literal_global_67);
    -[SRUIFSiriSessionStateHandler performTransitionForEvent:](self->_stateHandler, "performTransitionForEvent:", 6);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __53__AFUISiriSession__startRequestForReadoutOfBulletin___block_invoke_2;
    v15[3] = &unk_24D7A2350;
    v16 = v4;
    -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", v15);

  }
  else
  {
    v7 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      -[AFUISiriSession _startRequestForReadoutOfBulletin:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
  }

}

uint64_t __53__AFUISiriSession__startRequestForReadoutOfBulletin___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionWillStartRequest");
}

void __53__AFUISiriSession__startRequestForReadoutOfBulletin___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__AFUISiriSession__startRequestForReadoutOfBulletin___block_invoke_3;
  v6[3] = &unk_24D7A24A8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v5, "siriSessionRequestsReadoutOfBulletin:completion:", v4, v6);

}

void __53__AFUISiriSession__startRequestForReadoutOfBulletin___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  switch(a2)
  {
    case 0:
      v2 = *(void **)(a1 + 32);
      v3 = 21;
      goto LABEL_9;
    case 1:
      v2 = *(void **)(a1 + 32);
      v3 = 11;
      goto LABEL_9;
    case 2:
      v2 = *(void **)(a1 + 32);
      v3 = 33;
      goto LABEL_9;
    case 3:
      v4 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v5 = 136315138;
        v6 = "-[AFUISiriSession _startRequestForReadoutOfBulletin:]_block_invoke_3";
        _os_log_impl(&dword_217514000, v4, OS_LOG_TYPE_DEFAULT, "%s TTS was cancelled, ignoring as it is most likely due to Siri invocation during readout.", (uint8_t *)&v5, 0xCu);
      }
      return;
    case 4:
      v2 = *(void **)(a1 + 32);
      v3 = 34;
LABEL_9:
      objc_msgSend(v2, "siriSessionRequestsDismissalForReason:", v3);
      break;
    default:
      return;
  }
}

- (void)startRequestWithOptions:(id)a3
{
  -[AFUISiriSession startRequestWithOptions:completion:](self, "startRequestWithOptions:completion:", a3, 0);
}

- (void)startRequestWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  BOOL v16;
  AFUISiriSessionDelegate *delegate;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  NSObject *v28;
  id v29;
  AFUISiriSession *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id location[4];

  location[3] = *(id *)MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x24BE09258]);
  v9 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __54__AFUISiriSession_startRequestWithOptions_completion___block_invoke;
  v32[3] = &unk_24D7A1D18;
  v10 = v7;
  v33 = v10;
  objc_msgSend(MEMORY[0x24BE091D8], "errorWithCode:description:underlyingError:", 2510, CFSTR("Completion block of start request was dropped."), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithBlock:defaultValue:", v32, v11);

  -[SRUIFSpeechRequestHandler discardCurrentSpeechGroup](self->_speechRequestHandler, "discardCurrentSpeechGroup");
  v13 = objc_msgSend((id)objc_opt_class(), "availabilityState");
  if (v13 == 3)
  {
    v18 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 136315138;
      *(id *)((char *)location + 4) = "-[AFUISiriSession startRequestWithOptions:completion:]";
      _os_log_impl(&dword_217514000, v18, OS_LOG_TYPE_DEFAULT, "%s Device doesn't have assets. Not starting the request", (uint8_t *)location, 0xCu);
    }
    objc_msgSend(MEMORY[0x24BE091D8], "errorWithCode:description:underlyingError:", 2510, CFSTR("No assets."), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invokeWithValue:", v19);

    objc_msgSend(MEMORY[0x24BEA8610], "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "downloadAssets");

    -[AFUISiriSession emitSiriWasUnavailableEventWithRequestOptions:](self, "emitSiriWasUnavailableEventWithRequestOptions:", v6);
  }
  else if (v13 == 2)
  {
    v21 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 136315138;
      *(id *)((char *)location + 4) = "-[AFUISiriSession startRequestWithOptions:completion:]";
      _os_log_impl(&dword_217514000, v21, OS_LOG_TYPE_DEFAULT, "%s Device not unlocked since boot. Not starting the request", (uint8_t *)location, 0xCu);
    }
    objc_msgSend(MEMORY[0x24BE091D8], "errorWithCode:description:underlyingError:", 2510, CFSTR("Device not unlocked since boot."), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invokeWithValue:", v22);

  }
  else if (v13 == 1 && objc_msgSend(v6, "requestSource") != 26)
  {
    v23 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 136315138;
      *(id *)((char *)location + 4) = "-[AFUISiriSession startRequestWithOptions:completion:]";
      _os_log_impl(&dword_217514000, v23, OS_LOG_TYPE_DEFAULT, "%s No network. Not starting the request", (uint8_t *)location, 0xCu);
    }
    objc_msgSend(MEMORY[0x24BE091D8], "errorWithCode:description:underlyingError:", 2510, CFSTR("No network."), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invokeWithValue:", v24);

  }
  else
  {
    -[SRUIFSpeechRequestHandler prepareForNewSpeechRequest](self->_speechRequestHandler, "prepareForNewSpeechRequest");
    v14 = objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isInitialBringUp") & 1) != 0
      || objc_msgSend(v6, "inputType") == 1
      || (-[AFUISiriSession delegate](self, "delegate"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = v15 == 0,
          v15,
          v16))
    {
      v25[0] = v9;
      v25[1] = 3221225472;
      v25[2] = __54__AFUISiriSession_startRequestWithOptions_completion___block_invoke_84;
      v25[3] = &unk_24D7A1E00;
      v26 = v12;
      -[AFUISiriSession _startRequestWithFinalOptions:completion:](self, "_startRequestWithFinalOptions:completion:", v6, v25);

    }
    else
    {
      dispatch_group_enter(v14);
      objc_initWeak(location, self);
      delegate = self->_delegate;
      v27[0] = v9;
      v27[1] = 3221225472;
      v27[2] = __54__AFUISiriSession_startRequestWithOptions_completion___block_invoke_80;
      v27[3] = &unk_24D7A24D0;
      v28 = v14;
      objc_copyWeak(&v31, location);
      v29 = v12;
      v30 = self;
      -[AFUISiriSessionDelegate siriSessionWillStartRequestWithOptions:completion:](delegate, "siriSessionWillStartRequestWithOptions:completion:", v6, v27);

      objc_destroyWeak(&v31);
      objc_destroyWeak(location);
    }

  }
}

uint64_t __54__AFUISiriSession_startRequestWithOptions_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __54__AFUISiriSession_startRequestWithOptions_completion___block_invoke_80(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "speechRequestHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentSpeechRequestDispatchGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v7)
  {
    if (v3)
    {
      v8 = objc_loadWeakRetained((id *)(a1 + 56));
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __54__AFUISiriSession_startRequestWithOptions_completion___block_invoke_2;
      v13[3] = &unk_24D7A1E00;
      v14 = *(id *)(a1 + 40);
      objc_msgSend(v8, "_startRequestWithFinalOptions:completion:", v3, v13);

      v9 = v14;
    }
    else
    {
      v10 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 136315394;
        v16 = "-[AFUISiriSession startRequestWithOptions:completion:]_block_invoke";
        v17 = 2112;
        v18 = v11;
        _os_log_impl(&dword_217514000, v10, OS_LOG_TYPE_DEFAULT, "%s %@ not starting a new request because its delegate vetoed with nil request options", buf, 0x16u);
      }
      v12 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x24BE091D8], "errorWithCode:description:underlyingError:", 2510, CFSTR("Session delegate vetoed."), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "invokeWithValue:", v9);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __54__AFUISiriSession_startRequestWithOptions_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "invokeWithValue:", a2);
}

uint64_t __54__AFUISiriSession_startRequestWithOptions_completion___block_invoke_84(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "invokeWithValue:", a2);
}

- (void)stopRequestWithOptions:(id)a3
{
  SRUIFSpeechRequestHandler *speechRequestHandler;
  id v4;

  speechRequestHandler = self->_speechRequestHandler;
  -[AFUISiriSession _preparedSpeechRequestWithRequestOptions:](self, "_preparedSpeechRequestWithRequestOptions:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SRUIFSpeechRequestHandler stopSpeechRequestWithOptions:](speechRequestHandler, "stopSpeechRequestWithOptions:", v4);

}

- (void)updateRequestOptions:(id)a3
{
  SRUIFSpeechRequestHandler *speechRequestHandler;
  id v4;

  speechRequestHandler = self->_speechRequestHandler;
  -[AFUISiriSession _preparedSpeechRequestWithRequestOptions:](self, "_preparedSpeechRequestWithRequestOptions:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SRUIFSpeechRequestHandler updateSpeechRequestOptions:](speechRequestHandler, "updateSpeechRequestOptions:", v4);

}

- (BOOL)_shouldFetchActiveAccount
{
  void *v3;
  id WeakRetained;
  int v5;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "showServerOnUI"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_localDataSource);
    v5 = objc_msgSend(WeakRetained, "isPPTAvailable") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)assistantConnectionRequestWillStart:(id)a3
{
  AFModesConfiguration *modesConfiguration;
  AFModesConfiguration *v5;
  AFModesConfiguration *v6;
  NSObject *v7;
  AFModesConfiguration *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  AFModesConfiguration *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  self->_currentRequestDidPresent = 0;
  if (_os_feature_enabled_impl())
  {
    modesConfiguration = self->_modesConfiguration;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __55__AFUISiriSession_assistantConnectionRequestWillStart___block_invoke;
    v10[3] = &unk_24D7A24F8;
    v10[4] = self;
    -[AFModesConfiguration mutatedCopyWithMutator:](modesConfiguration, "mutatedCopyWithMutator:", v10);
    v5 = (AFModesConfiguration *)objc_claimAutoreleasedReturnValue();
    v6 = self->_modesConfiguration;
    self->_modesConfiguration = v5;

    v7 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v8 = self->_modesConfiguration;
      *(_DWORD *)buf = 136315394;
      v12 = "-[AFUISiriSession assistantConnectionRequestWillStart:]";
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_217514000, v7, OS_LOG_TYPE_DEFAULT, "%s #modes Sending modes configuration : %@", buf, 0x16u);
    }
    -[AFUISiriSession _connection](self, "_connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setModesConfiguration:", self->_modesConfiguration);

  }
  -[SRUIFUIBridgeClient newRequestWillStart](self->_uiBridgeClient, "newRequestWillStart");
  -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", &__block_literal_global_88);
}

void __55__AFUISiriSession_assistantConnectionRequestWillStart___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_modeOverrideValue");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setModeOverrideValue:", v4);

}

uint64_t __55__AFUISiriSession_assistantConnectionRequestWillStart___block_invoke_87(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionWillStartRequest");
}

- (id)safeWrapResponseCompletion:(id)a3
{
  id v3;

  if (a3)
    v3 = a3;
  else
    v3 = &__block_literal_global_90;
  return (id)MEMORY[0x219A0D984](v3, a2);
}

- (id)_setRefIdForAllViewsInAddViews:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "refId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(v3, "views");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v3, "views", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dictionary");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKey:", v4, CFSTR("refId"));
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v7, *MEMORY[0x24BE82660]);
    v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE81858]), "initWithDictionary:", v14);

  }
  else
  {
    v15 = v3;
  }

  return v15;
}

- (void)assistantConnection:(id)a3 receivedCommand:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject **v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  id WeakRetained;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  AFUISiriSession *v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "encodedClassName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUISiriSession safeWrapResponseCompletion:](self, "safeWrapResponseCompletion:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (NSObject **)MEMORY[0x24BE08FB0];
  v14 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    objc_msgSend(v9, "aceId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v46 = "-[AFUISiriSession assistantConnection:receivedCommand:completion:]";
    v47 = 2112;
    v48 = v11;
    v49 = 2112;
    v50 = v16;
    _os_log_impl(&dword_217514000, v15, OS_LOG_TYPE_DEFAULT, "%s Received Command: %@ aceId: %@", buf, 0x20u);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v9;
  else
    v17 = 0;
  v18 = v17;
  if (!v18)
  {
    v20 = 0;
    goto LABEL_22;
  }
  v19 = v18;
  -[AFUISiriSession _setRefIdForAllViewsInAddViews:](self, "_setRefIdForAllViewsInAddViews:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "af_dialogPhase");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "isPossiblyPartOfMultiTurnRequest"))
  {
    v22 = *v13;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v46 = "-[AFUISiriSession assistantConnection:receivedCommand:completion:]";
      v47 = 2112;
      v48 = v21;
      _os_log_impl(&dword_217514000, v22, OS_LOG_TYPE_DEFAULT, "%s %@ may be a part of a multi turn request.", buf, 0x16u);
    }
    -[AFUISiriSession _connection](self, "_connection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "adviseSessionArbiterToContinueWithPreviousWinner:", 1);
  }
  else
  {
    if ((objc_msgSend(v21, "isCompletionDialogPhase") & 1) == 0
      && (objc_msgSend(v21, "isErrorDialogPhase") & 1) == 0
      && !objc_msgSend(v21, "isConfirmedDialogPhase"))
    {
      goto LABEL_19;
    }
    v24 = *v13;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v46 = "-[AFUISiriSession assistantConnection:receivedCommand:completion:]";
      v47 = 2112;
      v48 = v21;
      _os_log_impl(&dword_217514000, v24, OS_LOG_TYPE_DEFAULT, "%s %@ indicates end of a multi turn request.", buf, 0x16u);
    }
    -[AFUISiriSession _connection](self, "_connection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "adviseSessionArbiterToContinueWithPreviousWinner:", 0);
  }

LABEL_19:
  if (objc_msgSend(v20, "immersiveExperience"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_localDelegate);
    objc_msgSend(WeakRetained, "siriSessionImmersiveExperienceRequested");

  }
LABEL_22:
  v26 = objc_msgSend(v9, "sruif_usefulUserResultType");
  if (v26)
  {
    -[AFUISiriSession _connection](self, "_connection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "willPresentUsefulUserResultWithType:forCommand:", v26, v9);

  }
  v28 = MEMORY[0x24BDAC760];
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = __66__AFUISiriSession_assistantConnection_receivedCommand_completion___block_invoke;
  v43[3] = &unk_24D7A2350;
  v29 = v9;
  v44 = v29;
  -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", v43);
  if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BE826F8]))
  {
    v30 = objc_loadWeakRetained((id *)&self->_localDelegate);
    objc_msgSend(v30, "siriSessionDidReceiveDelayedActionCancelCommand:completion:", v29, v12);

  }
  else if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BE82700]))
  {
    v31 = objc_loadWeakRetained((id *)&self->_localDelegate);
    objc_msgSend(v31, "siriSessionDidReceiveDelayedActionCommand:completion:", v29, v12);

  }
  else if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BE82858]))
  {
    v32 = objc_loadWeakRetained((id *)&self->_localDelegate);
    objc_msgSend(v32, "siriSessionDidReceiveTakeScreenshotCommand:completion:", v29, v12);

  }
  else if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BE81B20]))
  {
    v33 = objc_loadWeakRetained((id *)&self->_localDelegate);
    objc_msgSend(v33, "siriSessionDidReceiveStartScreenRecordingCommand:completion:", v29, v12);

  }
  else if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BE81B28]))
  {
    v34 = objc_loadWeakRetained((id *)&self->_localDelegate);
    objc_msgSend(v34, "siriSessionDidReceiveStopScreenRecordingCommand:completion:", v29, v12);

  }
  else if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BE827F8]))
  {
    v35 = objc_loadWeakRetained((id *)&self->_localDelegate);
    objc_msgSend(v35, "siriSessionDidReceiveSetUpdateMaskCommand:completion:", v29, v12);

  }
  else
  {
    objc_initWeak((id *)buf, self);
    v36[0] = v28;
    v36[1] = 3221225472;
    v36[2] = __66__AFUISiriSession_assistantConnection_receivedCommand_completion___block_invoke_2;
    v36[3] = &unk_24D7A2580;
    v37 = v11;
    v38 = v20;
    v41 = v12;
    v39 = v29;
    v40 = self;
    objc_copyWeak(&v42, (id *)buf);
    -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", v36);
    objc_destroyWeak(&v42);

    objc_destroyWeak((id *)buf);
  }

}

uint64_t __66__AFUISiriSession_assistantConnection_receivedCommand_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionWillProcessAceCommand:", *(_QWORD *)(a1 + 32));
}

void __66__AFUISiriSession_assistantConnection_receivedCommand_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id *v5;
  void *v6;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE82650]))
  {
    objc_msgSend(v3, "siriSessionDidReceiveAddViewsCommand:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE82648]))
  {
    objc_msgSend(v3, "siriSessionDidReceiveAddDialogsCommand:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE826B0]))
  {
    objc_msgSend(v3, "siriSessionDidReceiveClearScreenCommand:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE823F8]))
  {
    objc_msgSend(v3, "siriSessionDidReceivePlayVoicemailCommand:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE82790]))
  {
    objc_msgSend(v3, "siriSessionDidReceiveOpenLinkCommand:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE82500])
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v3, "siriSessionDidReceiveSmsPlayAudioCommand:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE827A8]))
  {
    objc_msgSend(v3, "siriSessionDidReceivePlayNotificationSound:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE827E8]))
  {
    objc_msgSend(v3, "siriSessionDidReceiveSayItCommand:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE827B0]))
  {
    objc_msgSend(v3, "siriSessionDidReceiveRepeatItCommand:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE82860]))
  {
    objc_msgSend(*(id *)(a1 + 56), "_handleUnlockAppCommand:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE82868]))
  {
    objc_msgSend(*(id *)(a1 + 56), "_handleUnlockDeviceCommand:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE82870]))
  {
    objc_msgSend(*(id *)(a1 + 56), "_handleUnlockDeviceWithWatchCommand:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE82808]))
  {
    objc_msgSend(v3, "siriSessionDidReceiveShowHelpCommand:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE827B8]))
  {
    objc_msgSend(*(id *)(a1 + 56), "_handleRequestUpdateViewsCommand:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE82878]))
  {
    objc_msgSend(v3, "siriSessionDidReceiveUpdateViewsCommand:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE82668]))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(WeakRetained, "_performPunchoutCommand:delegate:completion:", *(_QWORD *)(a1 + 48), v3, *(_QWORD *)(a1 + 64));

  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE826B8]))
  {
    objc_msgSend(v3, "siriSessionDidReceiveCloseAssistantCommand:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE82788]))
  {
    objc_msgSend(v3, "siriSessionDidReceiveListenForPronunciationCommand:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE82770]))
  {
    objc_msgSend(v3, "siriSessionDidReceiveGetResponseAlternativesPlaybackCommand:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  }
  else
  {
    v5 = (id *)(a1 + 48);
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE827F0]))
    {
      objc_msgSend(v3, "siriSessionDidReceiveSetSuggestedUtterancesCommand:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v3, "siriSessionDidReceiveAddContentToViewCommand:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
      }
      else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE824E8]))
      {
        objc_msgSend(v3, "siriSessionDidReceiveSetUIGuidedAccessCommand:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
      }
      else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE826A8]))
      {
        objc_msgSend(v3, "siriSessionDidReceiveSAUIChangePrimaryUtteranceCommand:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
      }
      else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE82800]))
      {
        objc_msgSend(v3, "siriSessionDidReceiveSAUIShowFullScreenEffectCommand:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
      }
      else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE82830]))
      {
        objc_msgSend(v3, "siriSessionDidReceiveSAUIShowSpeechAlternativesCommand:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
      }
      else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE82810]))
      {
        objc_msgSend(v3, "siriSessionDidReceiveSAUIShowRequestHandlingStatusCommand:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
      }
      else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE82778]))
      {
        objc_msgSend(v3, "siriSessionDidReceiveHideSiriOverlayCommand:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
      }
      else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE81B88]))
      {
        objc_msgSend(v3, "siriSessionDidReceiveGuideUpdateCommand:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
      }
      else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE81AC0]))
      {
        objc_msgSend(v3, "siriSessionDidReceiveShowNextCardCommand:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
      }
      else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE82400]))
      {
        objc_msgSend(v3, "siriSessionDidReceivePreSynthesizeTTSCommand:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
      }
      else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE82758]))
      {
        objc_msgSend(v3, "siriSessionDidReceiveDisambiguationItemSelected:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
      }
      else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE82898]))
      {
        objc_msgSend(v3, "siriSessionDidReceivePlayContentCommand:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
      }
      else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE82780]))
      {
        objc_msgSend(v3, "siriSessionDidReceiveLaunchTVRemoteCommand:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
      }
      else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE82760]))
      {
        objc_msgSend(v3, "siriSessionDidReceiveExtendCurrentTTSCommand:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
      }
      else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE827E0]))
      {
        objc_msgSend(v3, "siriSessionDidReceiveRevealRecognizedSpeechCommand:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
      }
      else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE82798]))
      {
        objc_msgSend(v3, "siriSessionDidReceivePaginateListCommand:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
      }
      else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE82888]))
      {
        objc_msgSend(v3, "siriSessionDidReceiveShowNextSnippetCommand:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
      }
      else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE82880]))
      {
        objc_msgSend(v3, "siriSessionDidReceiveUpdateVisualResponseSnippetCommand:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
      }
      else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE82840]))
      {
        objc_msgSend(v3, "siriSessionDidReceiveSnippetConfigurationRequestCommand:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
      }
      else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE827A0]))
      {
        objc_msgSend(*(id *)(a1 + 56), "_handlePlayAudioCommand:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
      }
      else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE82850]))
      {
        objc_msgSend(*(id *)(a1 + 56), "_handleSuppressDelayFeedbackCommand:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
      }
      else
      {
        v6 = (void *)*MEMORY[0x24BE08FB0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
          __66__AFUISiriSession_assistantConnection_receivedCommand_completion___block_invoke_2_cold_1(v5, v6);
      }
    }
  }

}

- (void)_handleSuppressDelayFeedbackCommand:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  SRUIFStateFeedbackManager *stateFeedbackManager;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  stateFeedbackManager = self->_stateFeedbackManager;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __66__AFUISiriSession__handleSuppressDelayFeedbackCommand_completion___block_invoke;
  v11[3] = &unk_24D7A25A8;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  -[SRUIFStateFeedbackManager cancelFeedbackWithCompletion:](stateFeedbackManager, "cancelFeedbackWithCompletion:", v11);

}

void __66__AFUISiriSession__handleSuppressDelayFeedbackCommand_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 40))
  {
    v2 = objc_alloc_init(MEMORY[0x24BE811B8]);
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setRefId:", v3);

    v4 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[AFUISiriSession _handleSuppressDelayFeedbackCommand:completion:]_block_invoke";
      _os_log_impl(&dword_217514000, v4, OS_LOG_TYPE_DEFAULT, "%s successfully suppressed delay feedback", (uint8_t *)&v5, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (void)_handlePlayAudioCommand:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  os_log_t *v8;
  NSObject *v9;
  SRUIFStateFeedbackManager *stateFeedbackManager;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (os_log_t *)MEMORY[0x24BE08FB0];
  v9 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[AFUISiriSession _handlePlayAudioCommand:completion:]";
    _os_log_impl(&dword_217514000, v9, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  if (_os_feature_enabled_impl())
  {
    stateFeedbackManager = self->_stateFeedbackManager;
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __54__AFUISiriSession__handlePlayAudioCommand_completion___block_invoke;
    v21[3] = &unk_24D7A25D0;
    v22 = v6;
    v23 = v7;
    -[SRUIFStateFeedbackManager playAudioPlaybackRequest:completion:](stateFeedbackManager, "playAudioPlaybackRequest:completion:", v22, v21);

    v11 = v22;
  }
  else
  {
    v12 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      -[AFUISiriSession _handlePlayAudioCommand:completion:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
    v11 = objc_alloc_init(MEMORY[0x24BE811A8]);
    objc_msgSend(v6, "aceId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRefId:", v20);

    (*((void (**)(id, id))v7 + 2))(v7, v11);
  }

}

void __54__AFUISiriSession__handlePlayAudioCommand_completion___block_invoke(uint64_t a1, int a2)
{
  objc_class *v3;
  void *v4;
  id v5;

  if (a2)
    v3 = (objc_class *)MEMORY[0x24BE811B8];
  else
    v3 = (objc_class *)MEMORY[0x24BE811A8];
  v5 = objc_alloc_init(v3);
  objc_msgSend(*(id *)(a1 + 32), "aceId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRefId:", v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_performPunchoutCommand:(id)a3 delegate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  os_log_t *v11;
  NSObject *v12;
  AFUISiriSessionLocalDelegate **p_localDelegate;
  id WeakRetained;
  char v15;
  id v16;
  int v17;
  os_log_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (os_log_t *)MEMORY[0x24BE08FB0];
  v12 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v28 = "-[AFUISiriSession _performPunchoutCommand:delegate:completion:]";
    _os_log_impl(&dword_217514000, v12, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  p_localDelegate = &self->_localDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_localDelegate);
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0
    && (v16 = objc_loadWeakRetained((id *)p_localDelegate),
        v17 = objc_msgSend(v16, "shouldNonLocalDelegateHandlePunchouts"),
        v16,
        !v17))
  {
    v22 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[AFUISiriSession _performPunchoutCommand:delegate:completion:]";
      _os_log_impl(&dword_217514000, v22, OS_LOG_TYPE_DEFAULT, "%s Local delegate is handling it.", buf, 0xCu);
    }
    v23 = objc_loadWeakRetained((id *)p_localDelegate);
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __63__AFUISiriSession__performPunchoutCommand_delegate_completion___block_invoke;
    v24[3] = &unk_24D7A25F8;
    v26 = v10;
    v25 = v8;
    objc_msgSend(v23, "handlePunchoutCommand:completion:", v25, v24);

  }
  else
  {
    v18 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)MEMORY[0x24BDD16E0];
      v20 = v18;
      objc_msgSend(v19, "numberWithBool:", v15 & 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v28 = "-[AFUISiriSession _performPunchoutCommand:delegate:completion:]";
      v29 = 2112;
      v30 = v21;
      _os_log_impl(&dword_217514000, v20, OS_LOG_TYPE_DEFAULT, "%s Delegate is handling it - responds to shouldNonLocalDelegateHandlePunchouts: %@", buf, 0x16u);

    }
    objc_msgSend(v9, "siriSessionDidReceiveAppPunchOutCommand:completion:", v8, v10);
  }

}

void __63__AFUISiriSession__performPunchoutCommand_delegate_completion___block_invoke(uint64_t a1, int a2)
{
  Class *v3;
  void *v4;
  id v5;

  if (*(_QWORD *)(a1 + 40))
  {
    v3 = (Class *)0x24BE811B8;
    if (!a2)
      v3 = (Class *)0x24BE811A8;
    v5 = objc_alloc_init(*v3);
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRefId:", v4);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (void)assistantConnection:(id)a3 startUIRequestWithText:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __73__AFUISiriSession_assistantConnection_startUIRequestWithText_completion___block_invoke;
  v11[3] = &unk_24D7A2620;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", v11);

}

uint64_t __73__AFUISiriSession_assistantConnection_startUIRequestWithText_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionWillStartUIRequestWithText:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_requestDidFinishWithError:(id)a3
{
  id v4;
  id v5;
  AFUISiriSessionLocalDelegate **p_localDelegate;
  id WeakRetained;
  char v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __46__AFUISiriSession__requestDidFinishWithError___block_invoke;
  v10[3] = &unk_24D7A2350;
  v5 = v4;
  v11 = v5;
  -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", v10);
  p_localDelegate = &self->_localDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_localDelegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)p_localDelegate);
    objc_msgSend(v9, "siriSessionDidFinishRequestWithError:", v5);

  }
}

uint64_t __46__AFUISiriSession__requestDidFinishWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionDidFinishRequestWithError:", *(_QWORD *)(a1 + 32));
}

- (void)assistantConnectionWillStartAcousticIDRequest:(id)a3
{
  self->_isProcessingAcousticIdRequest = 1;
  -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", &__block_literal_global_104);
}

uint64_t __65__AFUISiriSession_assistantConnectionWillStartAcousticIDRequest___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionDidStartAcousticIDRequest");
}

- (void)assistantConnection:(id)a3 didFinishAcousticIDRequestWithSuccess:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  _QWORD v9[4];
  BOOL v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v4 = a4;
  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("NO");
    if (v4)
      v8 = CFSTR("YES");
    *(_DWORD *)buf = 136315394;
    v12 = "-[AFUISiriSession assistantConnection:didFinishAcousticIDRequestWithSuccess:]";
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_217514000, v7, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  self->_isProcessingAcousticIdRequest = 0;
  if (!v4)
    -[SRUIFSiriSessionStateHandler performTransitionForEvent:](self->_stateHandler, "performTransitionForEvent:", 7);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __77__AFUISiriSession_assistantConnection_didFinishAcousticIDRequestWithSuccess___block_invoke;
  v9[3] = &__block_descriptor_33_e35_v16__0___AFUISiriSessionDelegate__8l;
  v10 = v4;
  -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", v9);

}

uint64_t __77__AFUISiriSession_assistantConnection_didFinishAcousticIDRequestWithSuccess___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionDidFinishAcousticIDRequestWithSuccess:", *(unsigned __int8 *)(a1 + 32));
}

- (void)assistantConnection:(id)a3 requestFailedWithError:(id)a4 requestClass:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v9 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315650;
    v11 = "-[AFUISiriSession assistantConnection:requestFailedWithError:requestClass:]";
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_217514000, v9, OS_LOG_TYPE_DEFAULT, "%s error:%@ requestClass:%@", (uint8_t *)&v10, 0x20u);
  }
  -[SRUIFSiriSessionStateHandler performTransitionForEvent:](self->_stateHandler, "performTransitionForEvent:", 7);
  -[AFUISiriSession _requestDidFinishWithError:](self, "_requestDidFinishWithError:", v7);

}

- (void)assistantConnectionRequestFinished:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[AFUISiriSession assistantConnectionRequestFinished:]";
    _os_log_impl(&dword_217514000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
  -[SRUIFSiriSessionStateHandler performTransitionForEvent:](self->_stateHandler, "performTransitionForEvent:", 6);
  -[AFUISiriSession _requestDidFinishWithError:](self, "_requestDidFinishWithError:", 0);
}

- (void)assistantConnection:(id)a3 openURL:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __58__AFUISiriSession_assistantConnection_openURL_completion___block_invoke;
  v11[3] = &unk_24D7A2620;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", v11);

}

uint64_t __58__AFUISiriSession_assistantConnection_openURL_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionOpenURL:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)assistantConnection:(id)a3 willProcessStartPlayback:(int64_t)a4 intent:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD, uint64_t);
  void *v12;
  id v13;
  unsigned __int8 isKindOfClass;
  char v15;
  os_log_t *v16;
  NSObject *v17;
  id WeakRetained;
  os_log_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE buf[24];
  void *v29;
  uint64_t *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  v11 = (void (**)(id, _QWORD, uint64_t))a6;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v12 = (void *)getINStartCallIntentClass_softClass;
  v27 = getINStartCallIntentClass_softClass;
  if (!getINStartCallIntentClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getINStartCallIntentClass_block_invoke;
    v29 = &unk_24D7A1A28;
    v30 = &v24;
    __getINStartCallIntentClass_block_invoke((uint64_t)buf);
    v12 = (void *)v25[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v24, 8);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v15 = isKindOfClass ^ 1;
  v16 = (os_log_t *)MEMORY[0x24BE08FB0];
  if (((isKindOfClass ^ 1) & 1) == 0)
  {
    v17 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[AFUISiriSession assistantConnection:willProcessStartPlayback:intent:completion:]";
      _os_log_impl(&dword_217514000, v17, OS_LOG_TYPE_DEFAULT, "%s #PhoneCallAudioSessionHandler Extending the audio session for imminent phone call", buf, 0xCu);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_localDelegate);
    objc_msgSend(WeakRetained, "siriSessionShouldExtendAudioSessionForImminentPhoneCall", v24);

  }
  v19 = *v16;
  if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
  {
    v20 = (void *)MEMORY[0x24BDD16E0];
    v21 = v19;
    objc_msgSend(v20, "numberWithBool:", isKindOfClass & 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v15 & 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[AFUISiriSession assistantConnection:willProcessStartPlayback:intent:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v22;
    *(_WORD *)&buf[22] = 2112;
    v29 = v23;
    _os_log_impl(&dword_217514000, v21, OS_LOG_TYPE_DEFAULT, "%s #PhoneCallAudioSessionHandler: shouldExtendAudioSessionForImminentPhoneCall: %@, suppressAudioInterruptedNotificationFlag: %@", buf, 0x20u);

  }
  v11[2](v11, v15 & 1, 1);

}

- (void)assistantConnection:(id)a3 startPlaybackDidFail:(int64_t)a4
{
  NSObject *v5;
  id WeakRetained;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[AFUISiriSession assistantConnection:startPlaybackDidFail:]";
    _os_log_impl(&dword_217514000, v5, OS_LOG_TYPE_DEFAULT, "%s #PhoneCallAudioSessionHandler startPlaybackDidFail: Telling SiriPresentationViewController to stop extending the audio session", (uint8_t *)&v7, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_localDelegate);
  objc_msgSend(WeakRetained, "siriSessionShouldEndExtendAudioSessionForImminentPhoneCall");

}

- (void)assistantConnection:(id)a3 didChangeAudioSessionID:(unsigned int)a4
{
  _QWORD v4[4];
  unsigned int v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __63__AFUISiriSession_assistantConnection_didChangeAudioSessionID___block_invoke;
  v4[3] = &__block_descriptor_36_e35_v16__0___AFUISiriSessionDelegate__8l;
  v5 = a4;
  -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", v4);
}

void __63__AFUISiriSession_assistantConnection_didChangeAudioSessionID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[AFUISiriSession assistantConnection:didChangeAudioSessionID:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    v10 = 1024;
    v11 = v5;
    _os_log_impl(&dword_217514000, v4, OS_LOG_TYPE_DEFAULT, "%s #tts 1 _delegate:%@ audioSessionID:%u", (uint8_t *)&v6, 0x1Cu);
  }
  objc_msgSend(v3, "siriSessionDidUpdateAudioSessionID:", *(unsigned int *)(a1 + 32));

}

- (void)assistantConnectionDismissAssistant:(id)a3
{
  -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", &__block_literal_global_111);
}

uint64_t __55__AFUISiriSession_assistantConnectionDismissAssistant___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionRequestsDismissalForReason:", 32);
}

- (void)assistantConnection:(id)a3 dismissAssistantWithReason:(int64_t)a4
{
  uint64_t v4;
  _QWORD v5[5];

  v4 = 32;
  if ((unint64_t)(a4 - 1) < 2)
    v4 = 9;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __66__AFUISiriSession_assistantConnection_dismissAssistantWithReason___block_invoke;
  v5[3] = &__block_descriptor_40_e35_v16__0___AFUISiriSessionDelegate__8l;
  v5[4] = v4;
  -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", v5);
}

uint64_t __66__AFUISiriSession_assistantConnection_dismissAssistantWithReason___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionRequestsDismissalForReason:", *(_QWORD *)(a1 + 32));
}

- (void)assistantConnectionDidDetectMusic:(id)a3
{
  -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", &__block_literal_global_113);
}

uint64_t __53__AFUISiriSession_assistantConnectionDidDetectMusic___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionDidDetectMusic");
}

- (void)assistantConnection:(id)a3 wantsToCacheImage:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__AFUISiriSession_assistantConnection_wantsToCacheImage___block_invoke;
  v7[3] = &unk_24D7A2350;
  v8 = v5;
  v6 = v5;
  -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", v7);

}

uint64_t __57__AFUISiriSession_assistantConnection_wantsToCacheImage___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionWantsToCacheImage:", *(_QWORD *)(a1 + 32));
}

- (void)assistantConnection:(id)a3 extensionRequestWillStartForApplication:(id)a4
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v6;
  __CFString *v7;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_authenticationUIPresentedCallBack, CFSTR("com.apple.LocalAuthentication.ui.presented"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v6 = CFNotificationCenterGetDarwinNotifyCenter();
  getOptionalPKDarwinNotificationEventInAppPresented();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterAddObserver(v6, self, (CFNotificationCallback)_authenticationUIPresentedCallBack, v7, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

}

- (void)assistantConnection:(id)a3 extensionRequestFinishedForApplication:(id)a4 error:(id)a5
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v7;
  __CFString *v8;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.LocalAuthentication.ui.presented"), 0);
  v7 = CFNotificationCenterGetDarwinNotifyCenter();
  getOptionalPKDarwinNotificationEventInAppPresented();
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterRemoveObserver(v7, self, v8, 0);

}

- (void)assistantConnection:(id)a3 didLoadAssistant:(id)a4
{
  id v5;

  objc_msgSend(a4, "version", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AFUISiriSession _updateAssistantVersion:](self, "_updateAssistantVersion:", v5);

}

- (void)assistantConnection:(id)a3 willProcessAppLaunchWithBundleIdentifier:(id)a4
{
  id v5;
  id WeakRetained;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_localDelegate);
  objc_msgSend(WeakRetained, "siriSession:willProcessAppLaunchWithBundleIdentifier:", self, v5);

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __80__AFUISiriSession_assistantConnection_willProcessAppLaunchWithBundleIdentifier___block_invoke;
  v8[3] = &unk_24D7A2350;
  v9 = v5;
  v7 = v5;
  -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", v8);

}

uint64_t __80__AFUISiriSession_assistantConnection_willProcessAppLaunchWithBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionWillProcessAppLaunchWithBundleIdentifier:", *(_QWORD *)(a1 + 32));
}

- (void)assistantConnection:(id)a3 appLaunchFailedWithBundleIdentifier:(id)a4
{
  AFUISiriSessionLocalDelegate **p_localDelegate;
  id v6;
  id WeakRetained;

  p_localDelegate = &self->_localDelegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_localDelegate);
  objc_msgSend(WeakRetained, "siriSession:failedToLaunchAppWithBundleIdentifier:", self, v6);

}

- (void)_updateAssistantVersion:(id)a3
{
  void *v4;
  id WeakRetained;
  char v6;
  id v7;
  _QWORD v8[4];
  id v9;

  -[SRUIFSiriSessionInfo setAssistantVersionAndGenerateLightweightInfo:](self->_siriSessionInfo, "setAssistantVersionAndGenerateLightweightInfo:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_localDelegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_localDelegate);
    objc_msgSend(v7, "siriSessionDidUpdateSessionInfo:", v4);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __43__AFUISiriSession__updateAssistantVersion___block_invoke;
    v8[3] = &unk_24D7A2350;
    v9 = v4;
    -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", v8);

  }
}

uint64_t __43__AFUISiriSession__updateAssistantVersion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionDidUpdateSessionInfo:", *(_QWORD *)(a1 + 32));
}

- (void)assistantConnection:(id)a3 didUpdateResponseMode:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (objc_msgSend(MEMORY[0x24BE091E0], "isStateFeedbackEnabled"))
  {
    v6 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315394;
      v8 = "-[AFUISiriSession assistantConnection:didUpdateResponseMode:]";
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_217514000, v6, OS_LOG_TYPE_DEFAULT, "%s client recieved mode update: %@", (uint8_t *)&v7, 0x16u);
    }
    -[SRUIFStateFeedbackManager updateResponseMode:](self->_stateFeedbackManager, "updateResponseMode:", v5);
  }

}

- (void)assistantConnection:(id)a3 speechRecordingPerformTwoShotPromptWithType:(int64_t)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v8 = objc_alloc(MEMORY[0x24BE09258]);
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __94__AFUISiriSession_assistantConnection_speechRecordingPerformTwoShotPromptWithType_completion___block_invoke;
  v20 = &unk_24D7A1D18;
  v9 = v7;
  v21 = v9;
  v10 = (void *)objc_msgSend(v8, "initWithBlock:", &v17);
  -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", &__block_literal_global_117);
  v11 = *MEMORY[0x24BE08FB0];
  v12 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT);
  if (a4 == 2)
  {
    if (v12)
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[AFUISiriSession assistantConnection:speechRecordingPerformTwoShotPromptWithType:completion:]";
      _os_log_impl(&dword_217514000, v11, OS_LOG_TYPE_DEFAULT, "%s #phatic 1", buf, 0xCu);
    }
    -[AFUISiriSession _playPhaticWithCompletion:](self, "_playPhaticWithCompletion:", v10);
  }
  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[AFUISiriSession assistantConnection:speechRecordingPerformTwoShotPromptWithType:completion:]";
      v24 = 2048;
      v25 = a4;
      _os_log_impl(&dword_217514000, v11, OS_LOG_TYPE_DEFAULT, "%s #phatic 1 Fail: type = %tu", buf, 0x16u);
    }
    v13 = (void *)MEMORY[0x24BE091D8];
    v14 = objc_alloc(MEMORY[0x24BDD17C8]);
    v15 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("Unsupported Two-Shot prompt type %ld."), a4, v17, v18, v19, v20);
    objc_msgSend(v13, "errorWithCode:description:underlyingError:", 15, v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invokeWithValue:", v16);

  }
}

void __94__AFUISiriSession_assistantConnection_speechRecordingPerformTwoShotPromptWithType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    v4 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[AFUISiriSession assistantConnection:speechRecordingPerformTwoShotPromptWithType:completion:]_block_invoke";
      _os_log_impl(&dword_217514000, v4, OS_LOG_TYPE_DEFAULT, "%s #phatic 8", (uint8_t *)&v5, 0xCu);
    }
    (*(void (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(0.0, 0.0);
  }

}

uint64_t __94__AFUISiriSession_assistantConnection_speechRecordingPerformTwoShotPromptWithType_completion___block_invoke_116(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionRequestTwoShotWasRecognized");
}

- (void)_playPhaticWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, void *);
  void *v12;
  AFUISiriSession *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[AFUISiriSession _playPhaticWithCompletion:]";
    _os_log_impl(&dword_217514000, v5, OS_LOG_TYPE_DEFAULT, "%s #phatic 2", buf, 0xCu);
  }
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __45__AFUISiriSession__playPhaticWithCompletion___block_invoke;
  v12 = &unk_24D7A2750;
  v13 = self;
  v14 = v4;
  v6 = v4;
  v7 = (void *)MEMORY[0x219A0D984](&v9);
  -[AFUISiriSession _connection](self, "_connection", v9, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "forceAudioSessionActiveWithOptions:reason:completion:", 0, 3, v7);

}

void __45__AFUISiriSession__playPhaticWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  __CFString *v4;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("success");
    if (v4)
      v6 = v4;
    *(_DWORD *)buf = 136315394;
    v11 = "-[AFUISiriSession _playPhaticWithCompletion:]_block_invoke";
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_217514000, v5, OS_LOG_TYPE_DEFAULT, "%s #phatic 3 audioSessionCompletion:%@", buf, 0x16u);
  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__AFUISiriSession__playPhaticWithCompletion___block_invoke_123;
  v8[3] = &unk_24D7A2350;
  v7 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v7, "_performBlockWithDelegate:", v8);

}

void __45__AFUISiriSession__playPhaticWithCompletion___block_invoke_123(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[AFUISiriSession _playPhaticWithCompletion:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_217514000, v4, OS_LOG_TYPE_DEFAULT, "%s #phatic 4 %@", buf, 0x16u);
  }
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __45__AFUISiriSession__playPhaticWithCompletion___block_invoke_124;
  v5[3] = &unk_24D7A2728;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v3, "siriSessionRequestsPlayPhaticWithCompletion:", v5);

}

void __45__AFUISiriSession__playPhaticWithCompletion___block_invoke_124(uint64_t a1, int a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[AFUISiriSession _playPhaticWithCompletion:]_block_invoke";
    v9 = 1024;
    v10 = a2;
    _os_log_impl(&dword_217514000, v4, OS_LOG_TYPE_DEFAULT, "%s #phatic 9 success:%i", (uint8_t *)&v7, 0x12u);
  }
  v5 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v5, "invokeWithValue:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE091D8], "errorWithCode:description:underlyingError:", 15, CFSTR("Failed to play phatic prompt."), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invokeWithValue:", v6);

  }
}

- (void)assistantConnectionSpeechRecordingWillBegin:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_localDelegate);
  objc_msgSend(WeakRetained, "siriSessionRecordingPreparationHasFinished:", self);

  -[SRUIFSpeechRequestHandler speechRecordingWillBegin](self->_speechRequestHandler, "speechRecordingWillBegin");
}

- (void)assistantConnection:(id)a3 speechRecordingDidBeginOnAVRecordRoute:(id)a4 audioSessionID:(unsigned int)a5
{
  id v7;
  uint64_t v8;
  id v9;
  id WeakRetained;
  _QWORD v11[4];
  unsigned int v12;
  _QWORD v13[4];
  id v14;

  v7 = a4;
  -[SRUIFSiriSessionStateHandler performTransitionForEvent:](self->_stateHandler, "performTransitionForEvent:", 1);
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __93__AFUISiriSession_assistantConnection_speechRecordingDidBeginOnAVRecordRoute_audioSessionID___block_invoke;
  v13[3] = &unk_24D7A2350;
  v14 = v7;
  v9 = v7;
  -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", v13);
  WeakRetained = objc_loadWeakRetained((id *)&self->_localDelegate);
  objc_msgSend(WeakRetained, "siriSession:speechRecordingDidBeginOnAVRecordRoute:", self, v9);

  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __93__AFUISiriSession_assistantConnection_speechRecordingDidBeginOnAVRecordRoute_audioSessionID___block_invoke_2;
  v11[3] = &__block_descriptor_36_e35_v16__0___AFUISiriSessionDelegate__8l;
  v12 = a5;
  -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", v11);

}

uint64_t __93__AFUISiriSession_assistantConnection_speechRecordingDidBeginOnAVRecordRoute_audioSessionID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionSpeechRecordingDidChangeAVRecordRoute:", *(_QWORD *)(a1 + 32));
}

void __93__AFUISiriSession_assistantConnection_speechRecordingDidBeginOnAVRecordRoute_audioSessionID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[AFUISiriSession assistantConnection:speechRecordingDidBeginOnAVRecordRoute:audioSessionID:]_block_invoke_2";
    v8 = 2112;
    v9 = v3;
    v10 = 1024;
    v11 = v5;
    _os_log_impl(&dword_217514000, v4, OS_LOG_TYPE_DEFAULT, "%s #tts 1 _delegate:%@ audioSessionID:%u", (uint8_t *)&v6, 0x1Cu);
  }
  objc_msgSend(v3, "siriSessionDidUpdateAudioSessionID:", *(unsigned int *)(a1 + 32));

}

- (void)assistantConnection:(id)a3 speechRecordingDidChangeAVRecordRoute:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __77__AFUISiriSession_assistantConnection_speechRecordingDidChangeAVRecordRoute___block_invoke;
  v7[3] = &unk_24D7A2350;
  v8 = v5;
  v6 = v5;
  -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", v7);

}

uint64_t __77__AFUISiriSession_assistantConnection_speechRecordingDidChangeAVRecordRoute___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionSpeechRecordingDidChangeAVRecordRoute:", *(_QWORD *)(a1 + 32));
}

- (void)assistantConnectionDidChangeAudioRecordingPower:(id)a3
{
  if (!-[AFUISiriSession _isContinuousConversationAvailable](self, "_isContinuousConversationAvailable", a3))
    -[AFUISiriSession _handleDidChangeAudioRecordingPower](self, "_handleDidChangeAudioRecordingPower");
}

- (void)_handleDidChangeAudioRecordingPower
{
  void *v3;
  int v4;
  int v5;
  int v6;
  double v7;
  double v8;
  id *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  id location;

  objc_initWeak(&location, self);
  if (AFDeviceSupportsSystemAssistantExperience())
  {
    -[AFUISiriSession localDelegate](self, "localDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFUISiriSession recordingPowerLevel](self, "recordingPowerLevel");
    v5 = v4;
    -[AFUISiriSession recordingPowerLevel](self, "recordingPowerLevel");
    LODWORD(v7) = v6;
    LODWORD(v8) = v5;
    objc_msgSend(v3, "siriSessionAudioRecordingDidChangePowerLevel:peakLevel:", v8, v7);

    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __54__AFUISiriSession__handleDidChangeAudioRecordingPower__block_invoke;
    v13[3] = &unk_24D7A2778;
    v9 = &v14;
    objc_copyWeak(&v14, &location);
    v13[4] = self;
    -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", v13);
  }
  else
  {
    -[AFUISiriSession localDelegate](self, "localDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFUISiriSession recordingPowerLevel](self, "recordingPowerLevel");
    objc_msgSend(v10, "siriSessionAudioRecordingDidChangePowerLevel:");

    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __54__AFUISiriSession__handleDidChangeAudioRecordingPower__block_invoke_2;
    v11[3] = &unk_24D7A27A0;
    v9 = &v12;
    objc_copyWeak(&v12, &location);
    -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", v11);
  }
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __54__AFUISiriSession__handleDidChangeAudioRecordingPower__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  int v5;
  int v6;
  int v7;
  double v8;
  double v9;
  id v10;

  v10 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "recordingPowerLevel");
    v6 = v5;
    objc_msgSend(*(id *)(a1 + 32), "recordingPowerLevel");
    LODWORD(v8) = v7;
    LODWORD(v9) = v6;
    objc_msgSend(v10, "siriSessionAudioRecordingDidChangePowerLevel:peakLevel:", v9, v8);
  }

}

void __54__AFUISiriSession__handleDidChangeAudioRecordingPower__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "recordingPowerLevel");
    objc_msgSend(v5, "siriSessionAudioRecordingDidChangePowerLevel:");
  }

}

- (void)assistantConnectionSpeechRecordingDidDetectStartpoint:(id)a3
{
  -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", &__block_literal_global_127);
}

uint64_t __73__AFUISiriSession_assistantConnectionSpeechRecordingDidDetectStartpoint___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionDidDetectSpeechStartpoint");
}

- (void)assistantConnectionSpeechRecordingDidEnd:(id)a3
{
  -[SRUIFSiriSessionStateHandler performTransitionForEvent:](self->_stateHandler, "performTransitionForEvent:", 2);
  -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", &__block_literal_global_128);
}

uint64_t __60__AFUISiriSession_assistantConnectionSpeechRecordingDidEnd___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionSpeechRecordingDidEnd");
}

- (void)assistantConnectionUpdatedSpeechEndEstimate:(id)a3 speechEndEstimate:(unint64_t)a4
{
  void *v6;
  char v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[AFUISiriSession localDataSource](self, "localDataSource", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "getUIViewModeIsUIFreeForCurrentRequest");

  if ((v7 & 1) != 0)
  {
    v8 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315138;
      v10 = "-[AFUISiriSession assistantConnectionUpdatedSpeechEndEstimate:speechEndEstimate:]";
      _os_log_impl(&dword_217514000, v8, OS_LOG_TYPE_DEFAULT, "%s #statefeedback not passing along speech end estimate due to ui free view mode", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    -[SRUIFStateFeedbackManager didUpdateSpeechEndEstimate:](self->_stateFeedbackManager, "didUpdateSpeechEndEstimate:", a4);
  }
}

- (void)assistantConnection:(id)a3 didStartAudioPlaybackRequest:(id)a4
{
  -[SRUIFStateFeedbackManager audioPlaybackRequestDidStartForRequest:](self->_stateFeedbackManager, "audioPlaybackRequestDidStartForRequest:", a4);
}

- (void)assistantConnectionSpeechRecordingDidCancel:(id)a3
{
  -[SRUIFSiriSessionStateHandler performTransitionForEvent:](self->_stateHandler, "performTransitionForEvent:", 3);
  -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", &__block_literal_global_129);
}

uint64_t __63__AFUISiriSession_assistantConnectionSpeechRecordingDidCancel___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionSpeechRecordingDidCancel");
}

- (void)assistantConnection:(id)a3 speechRecordingDidFail:(id)a4
{
  id v5;
  id WeakRetained;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_localDelegate);
  objc_msgSend(WeakRetained, "siriSessionRecordingPreparationHasFinished:", self);

  -[SRUIFSiriSessionStateHandler performTransitionForEvent:](self->_stateHandler, "performTransitionForEvent:", 4);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__AFUISiriSession_assistantConnection_speechRecordingDidFail___block_invoke;
  v8[3] = &unk_24D7A2350;
  v9 = v5;
  v7 = v5;
  -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", v8);
  -[SRUIFSpeechRequestHandler speechRecordingDidFail](self->_speechRequestHandler, "speechRecordingDidFail");

}

uint64_t __62__AFUISiriSession_assistantConnection_speechRecordingDidFail___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionSpeechRecordingDidFailWithError:", *(_QWORD *)(a1 + 32));
}

- (void)assistantConnection:(id)a3 speechRecognized:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  kdebug_trace();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__AFUISiriSession_assistantConnection_speechRecognized___block_invoke;
  v7[3] = &unk_24D7A2350;
  v8 = v5;
  v6 = v5;
  -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", v7);

}

uint64_t __56__AFUISiriSession_assistantConnection_speechRecognized___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionDidReceiveSpeechRecognizedCommand:", *(_QWORD *)(a1 + 32));
}

- (void)assistantConnection:(id)a3 recognizedAdditionalSpeechInterpretation:(id)a4 refId:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __86__AFUISiriSession_assistantConnection_recognizedAdditionalSpeechInterpretation_refId___block_invoke;
  v11[3] = &unk_24D7A2828;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", v11);

}

uint64_t __86__AFUISiriSession_assistantConnection_recognizedAdditionalSpeechInterpretation_refId___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionDidRecognizedAdditionalSpeechInterpretation:refId:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)assistantConnection:(id)a3 recognitionUpdateWithPhrases:(id)a4 utterances:(id)a5 refId:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __85__AFUISiriSession_assistantConnection_recognitionUpdateWithPhrases_utterances_refId___block_invoke;
  v15[3] = &unk_24D7A2850;
  v16 = v9;
  v17 = v10;
  v18 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", v15);

}

uint64_t __85__AFUISiriSession_assistantConnection_recognitionUpdateWithPhrases_utterances_refId___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionDidUpdateRecognitionWithPhrases:utterances:refId:", a1[4], a1[5], a1[6]);
}

- (void)assistantConnection:(id)a3 speechRecognizedPartialResult:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  kdebug_trace();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69__AFUISiriSession_assistantConnection_speechRecognizedPartialResult___block_invoke;
  v7[3] = &unk_24D7A2350;
  v8 = v5;
  v6 = v5;
  -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", v7);

}

uint64_t __69__AFUISiriSession_assistantConnection_speechRecognizedPartialResult___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionDidReceiveSpeechPartialResultCommand:", *(_QWORD *)(a1 + 32));
}

- (void)assistantConnectionAudioSessionDidBeginInterruption:(id)a3 userInfo:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[AFUISiriSession assistantConnectionAudioSessionDidBeginInterruption:userInfo:]";
    v14 = 2114;
    v15 = v5;
    _os_log_impl(&dword_217514000, v6, OS_LOG_TYPE_DEFAULT, "%s #audioInterruption audio session interruption began userInfo: %{public}@", buf, 0x16u);
  }
  v7 = mach_absolute_time();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __80__AFUISiriSession_assistantConnectionAudioSessionDidBeginInterruption_userInfo___block_invoke;
  v9[3] = &unk_24D7A2878;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", v9);

}

uint64_t __80__AFUISiriSession_assistantConnectionAudioSessionDidBeginInterruption_userInfo___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionDidReceiveAudioSessionInterruptionBeganWithUserInfo:machAbsoluteTime:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)assistantConnectionAudioSessionDidEndInterruption:(id)a3 shouldResume:(BOOL)a4 userInfo:(id)a5
{
  _BOOL4 v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  _BOOL4 v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v5 = a4;
  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a5;
  v7 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315650;
    v9 = "-[AFUISiriSession assistantConnectionAudioSessionDidEndInterruption:shouldResume:userInfo:]";
    v10 = 1026;
    v11 = v5;
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_217514000, v7, OS_LOG_TYPE_DEFAULT, "%s #audioInterruption audio session interruption ended shouldResume: %{public, BOOL}d userInfo: %{public}@", (uint8_t *)&v8, 0x1Cu);
  }

}

- (void)_startRequestWithBlock:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SRUIFSpeechRequestHandler nonSpeechRequestWillBegin](self->_speechRequestHandler, "nonSpeechRequestWillBegin");
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    v4 = v5;
  }

}

- (BOOL)_hasActiveRequest
{
  return -[SRUIFSiriSessionStateHandler state](self->_stateHandler, "state") != 0;
}

- (id)_preparedSpeechRequestWithRequestOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id WeakRetained;
  void *v19;
  NSObject *v20;
  int v21;
  const char *v22;
  void *v23;
  void *v24;
  void *v25;
  int v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "speechRequestOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "speechRequestOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "copy");

  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x24BE09360]);
  }

  v8 = objc_msgSend(v4, "requestSource");
  v9 = 0;
  switch(v8)
  {
    case 1:
    case 6:
    case 7:
      v9 = v8;
      break;
    case 2:
    case 28:
      v9 = 1;
      break;
    case 3:
      v9 = 4;
      break;
    case 4:
      v9 = 2;
      break;
    case 5:
      v9 = 3;
      break;
    case 8:
      v10 = objc_msgSend(v7, "activationEvent", 0);
      if (v10)
        v9 = v10;
      else
        v9 = 8;
      break;
    case 9:
      v9 = 5;
      break;
    case 10:
    case 11:
    case 13:
    case 14:
    case 16:
    case 37:
    case 43:
      v9 = 9;
      break;
    case 12:
      v9 = 11;
      break;
    case 22:
      v9 = 10;
      break;
    case 26:
      objc_msgSend(v7, "setSuppressStartAlert:", 0);
      v9 = 17;
      break;
    case 29:
      v9 = 23;
      break;
    case 30:
      v9 = 22;
      break;
    case 31:
      v9 = 24;
      break;
    case 36:
      v9 = 27;
      break;
    case 38:
      v9 = 30;
      break;
    case 44:
      v9 = 16;
      break;
    case 45:
      v9 = 34;
      break;
    case 46:
      v9 = 35;
      break;
    default:
      break;
  }
  objc_msgSend(v7, "setActivationEvent:", v9);
  objc_msgSend(v7, "setIsEyesFree:", self->_eyesFree);
  objc_msgSend(v4, "serverCommandId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setServerCommandId:", v11);

  objc_msgSend(v4, "timestamp");
  objc_msgSend(v7, "setActivationEventTime:");
  objc_msgSend(v4, "buttonDownTimestamp");
  objc_msgSend(v7, "setHomeButtonDownEventTime:");
  objc_msgSend(v4, "expectedTimestamp");
  objc_msgSend(v7, "setExpectedActivationEventTime:");
  objc_msgSend(v7, "setIsInitialBringUp:", objc_msgSend(v4, "isInitialBringUp"));
  objc_msgSend(v4, "activationDeviceIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActivationDeviceIdentifier:", v12);

  if (objc_msgSend(v4, "useAutomaticEndpointing"))
    v13 = 3;
  else
    v13 = 2;
  objc_msgSend(v7, "setEndpointerOperationMode:", v13);
  objc_msgSend(v7, "setUseStreamingDictation:", objc_msgSend(v4, "useStreamingDictation"));
  objc_msgSend(v4, "homeButtonUpFromBeep");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHomeButtonUpFromBeep:", v14);

  objc_msgSend(v7, "setAcousticIdEnabled:", objc_msgSend(v4, "acousticIdEnabled"));
  objc_msgSend(v7, "setReleaseAudioSessionOnRecordingCompletion:", objc_msgSend(v4, "releaseAudioSessionOnRecordingCompletion"));
  objc_msgSend(v7, "setIsSystemApertureEnabled:", AFUIIsDeviceSystemApertureEnabled(objc_msgSend(v7, "setSpeechSynthesisRecord:", self->_lastSpeechSynthesisRecord)));
  v15 = objc_msgSend(v4, "presentationMode");
  if (!v15)
  {
    objc_msgSend(v4, "requestInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "speechRequestOptions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v17, "presentationMode");

  }
  objc_msgSend(v7, "setPresentationMode:", v15);
  WeakRetained = objc_loadWeakRetained((id *)&self->_localDataSource);
  objc_msgSend(v7, "setIsInAmbient:", objc_msgSend(WeakRetained, "isAmbientPresented:", self));

  v19 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v20 = v19;
    v21 = objc_msgSend(v7, "isInAmbient");
    v22 = "NO";
    if (v21)
      v22 = "YES";
    v27 = 136315394;
    v28 = "-[AFUISiriSession _preparedSpeechRequestWithRequestOptions:]";
    v29 = 2080;
    v30 = v22;
    _os_log_impl(&dword_217514000, v20, OS_LOG_TYPE_DEFAULT, "%s #ambientRF setIsInAmbient: %s", (uint8_t *)&v27, 0x16u);

  }
  objc_msgSend(v4, "startRecordingSoundId");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v4, "startRecordingSoundId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFUISiriSession _startingRecordingAlertPolicyForSoundID:](self, "_startingRecordingAlertPolicyForSoundID:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setRecordingAlertPolicy:", v25);
  }

  return v7;
}

- (id)_startingRecordingAlertPolicyForSoundID:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];

  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x24BE82848]))
  {
    v3 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __59__AFUISiriSession__startingRecordingAlertPolicyForSoundID___block_invoke;
    v11[3] = &__block_descriptor_40_e50_v16__0___AFSpeechRecordingAlertBehaviorMutating__8l;
    v11[4] = 5;
    v4 = (void *)objc_msgSend(MEMORY[0x24BE09350], "newWithBuilder:", v11);
    v5 = (void *)MEMORY[0x24BE09358];
    v9[0] = v3;
    v9[1] = 3221225472;
    v9[2] = __59__AFUISiriSession__startingRecordingAlertPolicyForSoundID___block_invoke_2;
    v9[3] = &unk_24D7A28C0;
    v10 = v4;
    v6 = v4;
    v7 = (void *)objc_msgSend(v5, "newWithBuilder:", v9);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

uint64_t __59__AFUISiriSession__startingRecordingAlertPolicyForSoundID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setBeepSoundID:", *(_QWORD *)(a1 + 32));
}

uint64_t __59__AFUISiriSession__startingRecordingAlertPolicyForSoundID___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStartingAlertBehavior:", *(_QWORD *)(a1 + 32));
}

- (void)_sendContextWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__AFUISiriSession__sendContextWithCompletion___block_invoke;
  v6[3] = &unk_24D7A2910;
  v5 = v4;
  v7 = v5;
  objc_copyWeak(&v8, &location);
  -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", v6);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

void __46__AFUISiriSession__sendContextWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v3 = a2;
  if (!v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__AFUISiriSession__sendContextWithCompletion___block_invoke_2;
  v4[3] = &unk_24D7A28E8;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "siriSessionGetRequestContextWithCompletionHandler:", v4);

  objc_destroyWeak(&v6);
}

void __46__AFUISiriSession__sendContextWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "valueForKey:", CFSTR("dictionary"));
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc_init(MEMORY[0x24BE81630]);
    v8[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setOrderedContext:", v7);

    objc_msgSend(WeakRetained, "performAceCommand:turnIdentifier:machAbsoluteTime:", v6, 0, (double)mach_absolute_time());
    v3 = (id)v5;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_startSpeechRequestWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[AFUISiriSession _preparedSpeechRequestWithRequestOptions:](self, "_preparedSpeechRequestWithRequestOptions:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isInitialBringUp");

  -[AFUISiriSession _startSpeechRequestWithSpeechRequestOptions:isInitialBringUp:completion:](self, "_startSpeechRequestWithSpeechRequestOptions:isInitialBringUp:completion:", v9, v8, v6);
}

- (void)_startSpeechRequestWithSpeechRequestOptions:(id)a3 isInitialBringUp:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  AFUISiriSessionLocalDelegate **p_localDelegate;
  id v9;
  id v10;
  id WeakRetained;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  SRUIFSpeechRequestHandler *speechRequestHandler;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v5 = a4;
  v24 = *MEMORY[0x24BDAC8D0];
  p_localDelegate = &self->_localDelegate;
  v9 = a5;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_localDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = objc_loadWeakRetained((id *)p_localDelegate);
    v13 = objc_msgSend(v12, "headphonesAuthenticated");

  }
  else
  {
    v13 = 0;
  }

  v14 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)MEMORY[0x24BDD16E0];
    v16 = v14;
    objc_msgSend(v15, "numberWithBool:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 136315394;
    v21 = "-[AFUISiriSession _startSpeechRequestWithSpeechRequestOptions:isInitialBringUp:completion:]";
    v22 = 2112;
    v23 = v17;
    _os_log_impl(&dword_217514000, v16, OS_LOG_TYPE_DEFAULT, "%s 🎧 setIsHeadphonesAuthenticated: %@", (uint8_t *)&v20, 0x16u);

  }
  objc_msgSend(v10, "setIsHeadphonesAuthenticated:", v13);
  speechRequestHandler = self->_speechRequestHandler;
  -[AFUISiriSession _instrumentationTurnContext](self, "_instrumentationTurnContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFSpeechRequestHandler startSpeechRequestWithSpeechRequestOptions:instrumentationTurn:isInitialBringUp:completion:](speechRequestHandler, "startSpeechRequestWithSpeechRequestOptions:instrumentationTurn:isInitialBringUp:completion:", v10, v19, v5, v9);

}

- (void)_startSpeechRequestWithSpeechFileAtURL:(id)a3 completion:(id)a4
{
  -[SRUIFSpeechRequestHandler startSpeechRequestWithSpeechFileAtURL:completion:](self->_speechRequestHandler, "startSpeechRequestWithSpeechFileAtURL:completion:", a3, a4);
}

- (void)_startSpeechPronunciationRequestWithContext:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void (**v11)(id, _QWORD);

  v11 = (void (**)(id, _QWORD))a5;
  v8 = a3;
  -[AFUISiriSession _preparedSpeechRequestWithRequestOptions:](self, "_preparedSpeechRequestWithRequestOptions:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUISiriSession _connection](self, "_connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startSpeechPronunciationRequestWithOptions:pronunciationContext:", v9, v8);

  if (v11)
    v11[2](v11, 0);

}

- (void)stopRecordingSpeech
{
  -[SRUIFSpeechRequestHandler stopSpeechRequest](self->_speechRequestHandler, "stopSpeechRequest");
}

- (void)cancelSpeechRequest
{
  -[SRUIFSpeechRequestHandler cancelSpeechRequest](self->_speechRequestHandler, "cancelSpeechRequest");
}

- (void)requestDidPresentViewForUICommand:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (objc_msgSend(v5, "temporary"))
    {
      v6 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315394;
        v12 = "-[AFUISiriSession requestDidPresentViewForUICommand:]";
        v13 = 2112;
        v14 = v5;
        _os_log_impl(&dword_217514000, v6, OS_LOG_TYPE_DEFAULT, "%s Not transitioning to SRUIFSiriSessionEventRequestFinished for temporary command : %@", (uint8_t *)&v11, 0x16u);
      }
LABEL_10:

      goto LABEL_11;
    }

  }
  self->_currentRequestDidPresent = 1;
  -[SRUIFSiriSessionStateHandler performTransitionForEvent:](self->_stateHandler, "performTransitionForEvent:", 6);
  if (AFIsInternalInstall() && objc_msgSend(v4, "sruif_usefulUserResultType"))
  {
    kdebug_trace();
    objc_msgSend(v4, "deserializationDuration");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v7 = objc_alloc(MEMORY[0x24BE09220]);
      objc_msgSend(v4, "aceId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initWithOriginalCommandId:category:duration:", v8, 6, v5);

      -[AFUISiriSession _connection](self, "_connection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "recordUIMetrics:", v9);

    }
    goto LABEL_10;
  }
LABEL_11:

}

- (void)requestDidPresentViewForErrorCommand:(id)a3
{
  self->_currentRequestDidPresent = 1;
  -[SRUIFSiriSessionStateHandler performTransitionForEvent:](self->_stateHandler, "performTransitionForEvent:", 7);
}

- (void)recordUIMetrics:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFUISiriSession underlyingConnection](self, "underlyingConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordUIMetrics:", v4);

}

- (void)recordRequestMetricEvent:(id)a3 withTimestamp:(double)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[AFUISiriSession underlyingConnection](self, "underlyingConnection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordRequestMetric:withTimestamp:", v6, a4);

}

- (void)recordMetricsContext:(id)a3 forDisambiguatedAppWIthBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AFUISiriSession underlyingConnection](self, "underlyingConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendFeedbackToAppPreferencesPredictorForMetricsContext:selectedBundleId:", v7, v6);

}

- (void)audioRoutePickerWillShow
{
  -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", &__block_literal_global_145);
}

uint64_t __43__AFUISiriSession_audioRoutePickerWillShow__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionWillShowAudioRoutePicker");
}

- (void)audioRoutePickerWillDismiss
{
  -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", &__block_literal_global_146);
}

uint64_t __46__AFUISiriSession_audioRoutePickerWillDismiss__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionWillDismissAudioRoutePicker");
}

- (void)speechSynthesisDidFinish:(id)a3
{
  objc_storeStrong((id *)&self->_lastSpeechSynthesisRecord, a3);
}

- (void)speechSynthesisDidUpdatePowerLevelTo:(float)a3
{
  double v4;
  id v5;

  -[AFUISiriSession localDelegate](self, "localDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "siriSessionAudioOutputDidChangePowerLevel:", v4);

}

- (void)didLoseAttentionWithEvent:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    SRUIFStringForUserAttentionLossEvent();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[AFUISiriSession didLoseAttentionWithEvent:]";
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_217514000, v6, OS_LOG_TYPE_DEFAULT, "%s #userAttention Attention was lost for event: %@", (uint8_t *)&v8, 0x16u);

  }
  if (a3 == 1)
    -[AFUISiriSession _updateModesConfigurationForAttentionType:value:](self, "_updateModesConfigurationForAttentionType:value:", 1, 0);
}

- (void)didGainAttentionWithEvent:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    SRUIFStringForUserAttentionGainEvent();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[AFUISiriSession didGainAttentionWithEvent:]";
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_217514000, v6, OS_LOG_TYPE_DEFAULT, "%s #userAttention Attention was gained for event: %@", (uint8_t *)&v8, 0x16u);

  }
  if (a3 != 1)
  {
    if (a3 == 5)
    {
      a3 = 8;
    }
    else
    {
      if (a3 != 3)
        return;
      a3 = 2;
    }
  }
  -[AFUISiriSession _updateModesConfigurationForAttentionType:value:](self, "_updateModesConfigurationForAttentionType:value:", a3, 1);
}

- (void)_updateModesConfigurationForAttentionType:(unint64_t)a3 value:(BOOL)a4
{
  AFModesConfiguration *modesConfiguration;
  id *v8;
  AFModesConfiguration *v9;
  void *v10;
  AFModesConfiguration *v11;
  _QWORD v12[4];
  id v13[2];
  BOOL v14;
  _QWORD v15[4];
  id v16[2];
  BOOL v17;
  id location;

  objc_initWeak(&location, self);
  modesConfiguration = self->_modesConfiguration;
  if (modesConfiguration)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __67__AFUISiriSession__updateModesConfigurationForAttentionType_value___block_invoke_2;
    v12[3] = &unk_24D7A2978;
    v8 = v13;
    objc_copyWeak(v13, &location);
    v13[1] = (id)a3;
    v14 = a4;
    -[AFModesConfiguration mutatedCopyWithMutator:](modesConfiguration, "mutatedCopyWithMutator:", v12);
    v9 = (AFModesConfiguration *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x24BE09228];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __67__AFUISiriSession__updateModesConfigurationForAttentionType_value___block_invoke;
    v15[3] = &unk_24D7A2978;
    v8 = v16;
    objc_copyWeak(v16, &location);
    v16[1] = (id)a3;
    v17 = a4;
    v9 = (AFModesConfiguration *)objc_msgSend(v10, "newWithBuilder:", v15);
  }
  v11 = self->_modesConfiguration;
  self->_modesConfiguration = v9;

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __67__AFUISiriSession__updateModesConfigurationForAttentionType_value___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_populateModesConfiguration:attentionType:value:", v4, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

}

void __67__AFUISiriSession__updateModesConfigurationForAttentionType_value___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_populateModesConfiguration:attentionType:value:", v4, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

}

- (void)_populateModesConfiguration:(id)a3 attentionType:(unint64_t)a4 value:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v5 = a5;
  v7 = a3;
  switch(a4)
  {
    case 8uLL:
      if (v5)
        v9 = 2;
      else
        v9 = 1;
      v11 = v7;
      objc_msgSend(v7, "setButtonPressDetected:", v9);
      goto LABEL_16;
    case 2uLL:
      if (v5)
        v10 = 2;
      else
        v10 = 1;
      v11 = v7;
      objc_msgSend(v7, "setTouchScreenDetected:", v10);
      goto LABEL_16;
    case 1uLL:
      if (v5)
        v8 = 2;
      else
        v8 = 1;
      v11 = v7;
      objc_msgSend(v7, "setFaceDetected:", v8);
LABEL_16:
      v7 = v11;
      break;
  }

}

- (void)notifyStateManagerPresentationTransitionBegan
{
  -[AFSiriClientStateManager beginPresentationTransition](self->_clientStateManager, "beginPresentationTransition");
}

- (void)notifyStateManagerPresentationTransitionEnded
{
  -[AFSiriClientStateManager endPresentationTransition](self->_clientStateManager, "endPresentationTransition");
}

- (void)notifyStateManagerSpeakingBegan
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[AFUISiriSession notifyStateManagerSpeakingBegan]";
    _os_log_impl(&dword_217514000, v3, OS_LOG_TYPE_DEFAULT, "%s #tts", (uint8_t *)&v4, 0xCu);
  }
  -[AFSiriClientStateManager beginSpeakingForClient:](self->_clientStateManager, "beginSpeakingForClient:", self);
}

- (void)notifyStateManagerSpeakingEnded
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[AFUISiriSession notifyStateManagerSpeakingEnded]";
    _os_log_impl(&dword_217514000, v3, OS_LOG_TYPE_DEFAULT, "%s #tts", (uint8_t *)&v4, 0xCu);
  }
  -[AFSiriClientStateManager endSpeakingForClient:](self->_clientStateManager, "endSpeakingForClient:", self);
}

- (void)notifyStateManagerTransactionBegan
{
  -[AFSiriClientStateManager beginTransaction](self->_clientStateManager, "beginTransaction");
}

- (void)notifyStateManagerTransactionEnded
{
  -[AFSiriClientStateManager endTransaction](self->_clientStateManager, "endTransaction");
}

- (void)promptedUserForInput
{
  if (-[AFUISiriSession _isContinuousConversationAvailable](self, "_isContinuousConversationAvailable"))
    -[SRUIFUIBridgeClient promptedUserForInput](self->_uiBridgeClient, "promptedUserForInput");
}

- (void)fetchAttendingState:(id)a3
{
  uint64_t v4;
  void (**v5)(id, uint64_t);

  v5 = (void (**)(id, uint64_t))a3;
  if (-[AFUISiriSession _isContinuousConversationAvailable](self, "_isContinuousConversationAvailable"))
    v4 = -[SRUIFUIBridgeClient isAttending](self->_uiBridgeClient, "isAttending");
  else
    v4 = 0;
  v5[2](v5, v4);

}

- (BOOL)attendingState
{
  int v3;

  v3 = -[AFUISiriSession _isContinuousConversationAvailable](self, "_isContinuousConversationAvailable");
  if (v3)
    LOBYTE(v3) = -[SRUIFUIBridgeClient isAttending](self->_uiBridgeClient, "isAttending");
  return v3;
}

- (void)_startLegacyDirectActionRequestWithInfo:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v21 = "-[AFUISiriSession _startLegacyDirectActionRequestWithInfo:context:completion:]";
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_217514000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation requestInfo: %@, context: %@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __78__AFUISiriSession__startLegacyDirectActionRequestWithInfo_context_completion___block_invoke;
  v15[3] = &unk_24D7A29A0;
  objc_copyWeak(&v19, (id *)buf);
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], v15);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

void __78__AFUISiriSession__startLegacyDirectActionRequestWithInfo_context_completion___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  id *v4;
  id *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v2 = a1 + 7;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __78__AFUISiriSession__startLegacyDirectActionRequestWithInfo_context_completion___block_invoke_2;
  v9 = &unk_24D7A29A0;
  objc_copyWeak(&v13, v2);
  v10 = a1[4];
  v11 = a1[5];
  v12 = a1[6];
  objc_msgSend(WeakRetained, "_startRequestWithBlock:", &v6);

  v4 = (id *)objc_loadWeakRetained(v2);
  v5 = v4;
  if (v4)
    objc_msgSend(v4[22], "performTransitionForEvent:", 0, v6, v7, v8, v9, v10, v11);

  objc_destroyWeak(&v13);
}

uint64_t __78__AFUISiriSession__startLegacyDirectActionRequestWithInfo_context_completion___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t result;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v9[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setDirectActionApplicationContexts:", v4);

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "setApplicationContextForDirectAction:", 1);

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "_connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startRequestWithInfo:", *(_QWORD *)(a1 + 40));

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)_startContinuityRequestWithInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[AFUISiriSession _startContinuityRequestWithInfo:completion:]";
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_217514000, v8, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __62__AFUISiriSession__startContinuityRequestWithInfo_completion___block_invoke;
  v11[3] = &unk_24D7A2460;
  objc_copyWeak(&v14, (id *)buf);
  v9 = v6;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  -[AFUISiriSession _startRequestWithBlock:](self, "_startRequestWithBlock:", v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);

}

uint64_t __62__AFUISiriSession__startContinuityRequestWithInfo_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startContinuationRequestWithUserInfo:", *(_QWORD *)(a1 + 32));

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)_startRequestWithInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[AFUISiriSession _startRequestWithInfo:completion:]";
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_217514000, v8, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__AFUISiriSession__startRequestWithInfo_completion___block_invoke;
  v11[3] = &unk_24D7A2460;
  objc_copyWeak(&v14, (id *)buf);
  v9 = v6;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  -[AFUISiriSession _startRequestWithBlock:](self, "_startRequestWithBlock:", v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);

}

uint64_t __52__AFUISiriSession__startRequestWithInfo_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startRequestWithInfo:", *(_QWORD *)(a1 + 32));

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)_startRequestWithText:(id)a3 turnIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __67__AFUISiriSession__startRequestWithText_turnIdentifier_completion___block_invoke;
  v14[3] = &unk_24D7A29C8;
  v11 = v9;
  v15 = v11;
  v12 = v8;
  v16 = v12;
  objc_copyWeak(&v18, &location);
  v13 = v10;
  v17 = v13;
  -[AFUISiriSession _startRequestWithBlock:](self, "_startRequestWithBlock:", v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __67__AFUISiriSession__startRequestWithText_turnIdentifier_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x24BE09288]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "setActivationEvent:", 5);
    objc_msgSend(v5, "setTurnIdentifier:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v5, "setText:", *(_QWORD *)(a1 + 40));
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "_connection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startRequestWithInfo:", v5);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "_connection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startRequestWithText:", *(_QWORD *)(a1 + 40));
  }

  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);

}

- (void)startCorrectedRequestWithText:(id)a3 correctionIdentifier:(id)a4 userSelectionResults:(id)a5 turnIdentifier:(id)a6 machAbsoluteTime:(double)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id *v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36[2];
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id location;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v33 = a6;
  objc_initWeak(&location, self);
  v15 = (void *)objc_msgSend(MEMORY[0x24BE090D0], "newTurnBasedContextWithPreviousTurnID:", v33);
  v16 = (id *)MEMORY[0x24BE08FB0];
  v17 = (id)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v15, "turnIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v45 = "-[AFUISiriSession startCorrectedRequestWithText:correctionIdentifier:userSelectionResults:turnIdentifier:machAbsoluteTime:]";
    v46 = 2112;
    v47 = v18;
    v48 = 2112;
    v49 = v33;
    _os_log_impl(&dword_217514000, v17, OS_LOG_TYPE_DEFAULT, "%s #instrumentation New Turn %@ <-> Old Turn %@ ", buf, 0x20u);

  }
  -[AFUISiriSession _setInstrumentationTurnContext:](self, "_setInstrumentationTurnContext:", v15);
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __123__AFUISiriSession_startCorrectedRequestWithText_correctionIdentifier_userSelectionResults_turnIdentifier_machAbsoluteTime___block_invoke;
  v37[3] = &unk_24D7A29F0;
  objc_copyWeak(&v42, &location);
  v19 = v12;
  v38 = v19;
  v20 = v13;
  v39 = v20;
  v21 = v14;
  v40 = v21;
  v22 = v15;
  v41 = v22;
  -[AFUISiriSession _startRequestWithBlock:](self, "_startRequestWithBlock:", v37);
  v23 = objc_alloc_init(MEMORY[0x24BE95B28]);
  objc_msgSend(v23, "setInvocationSource:", 12);
  -[AFUISiriSession localDataSource](self, "localDataSource");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "lockStateForSiriSession:", self);

  objc_msgSend(v23, "setIsDeviceLocked:", v25 != 0);
  v26 = *v16;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    -[AFUISiriSession _instrumentationTurnContext](self, "_instrumentationTurnContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "turnIdentifier");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "formattedText");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v45 = "-[AFUISiriSession startCorrectedRequestWithText:correctionIdentifier:userSelectionResults:turnIdentifier:machAbsoluteTime:]";
    v46 = 2112;
    v47 = v23;
    v48 = 2112;
    v49 = v28;
    v50 = 2112;
    v51 = v29;
    _os_log_impl(&dword_217514000, v26, OS_LOG_TYPE_DEFAULT, "%s #instrumentation %@ in turn %@: \n%@", buf, 0x2Au);

  }
  -[AFUISiriSession _instrumentationTurnContext](self, "_instrumentationTurnContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "emitInstrumentation:machAbsoluteTime:", v23, mach_absolute_time());

  SRUIFConstructLaunchContextForLaunchStarted();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __123__AFUISiriSession_startCorrectedRequestWithText_correctionIdentifier_userSelectionResults_turnIdentifier_machAbsoluteTime___block_invoke_152;
  v34[3] = &unk_24D7A2A18;
  objc_copyWeak(v36, &location);
  v32 = v31;
  v35 = v32;
  v36[1] = *(id *)&a7;
  -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", v34);

  objc_destroyWeak(v36);
  objc_destroyWeak(&v42);

  objc_destroyWeak(&location);
}

void __123__AFUISiriSession_startCorrectedRequestWithText_correctionIdentifier_userSelectionResults_turnIdentifier_machAbsoluteTime___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "turnIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startRequestWithCorrectedText:forSpeechIdentifier:userSelectionResults:turnIdentifier:", v3, v4, v5, v6);

}

void __123__AFUISiriSession_startCorrectedRequestWithText_correctionIdentifier_userSelectionResults_turnIdentifier_machAbsoluteTime___block_invoke_152(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_instrumentationTurnContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "siriSessionDidStartNewTurn:associatedLaunchStartContext:machAbsoluteTime:linkPreviousTurn:", v5, *(_QWORD *)(a1 + 32), 0, *(double *)(a1 + 48));

  }
}

- (void)resultDidChangeForAceCommand:(id)a3
{
  -[AFUISiriSession resultDidChangeForAceCommand:completion:](self, "resultDidChangeForAceCommand:completion:", a3, 0);
}

- (void)resultDidChangeForAceCommand:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__AFUISiriSession_resultDidChangeForAceCommand_completion___block_invoke;
  v10[3] = &unk_24D7A2620;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", v10);

}

void __59__AFUISiriSession_resultDidChangeForAceCommand_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __59__AFUISiriSession_resultDidChangeForAceCommand_completion___block_invoke_2;
  v5[3] = &unk_24D7A2A40;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 32);
  objc_msgSend(a2, "siriSessionResultForAceCommand:completion:", v4, v5);

}

void __59__AFUISiriSession_resultDidChangeForAceCommand_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  Class *v3;
  void *v4;
  id v5;

  if (!*(_QWORD *)(a1 + 40))
    return;
  if (a2 == 2)
  {
    v3 = (Class *)0x24BE811A8;
  }
  else
  {
    if (a2 != 1)
    {
      v5 = 0;
      goto LABEL_9;
    }
    v3 = (Class *)0x24BE811B8;
  }
  v5 = objc_alloc_init(*v3);
LABEL_9:
  objc_msgSend(*(id *)(a1 + 32), "aceId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRefId:", v4);

  if (v5)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)telephonyRequestCompleted
{
  id v2;

  -[AFUISiriSession _connection](self, "_connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "telephonyRequestCompleted");

}

- (void)setAlertContext
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  -[AFUISiriSession localDataSource](self, "localDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bulletinsForSiriSession:", self);
  v4 = objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = (void *)v4;
  else
    v5 = (void *)MEMORY[0x24BDBD1A8];
  v7 = v5;
  -[AFUISiriSession _connection](self, "_connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlertContextWithBulletins:", v7);

}

- (void)setApplicationContext
{
  -[AFUISiriSession setApplicationContextForDirectAction:](self, "setApplicationContextForDirectAction:", 0);
}

- (void)setApplicationContextForDirectAction:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a3;
  if (a3)
  {
    v13 = 0;
  }
  else
  {
    -[AFUISiriSession localDataSource](self, "localDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contextAppInfosForSiriSession:", self);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[AFUISiriSession localDataSource](self, "localDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "starkAppBundleIdentifierContextForSiriSession:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v8);

  if (v3)
  {
    -[AFUISiriSession directActionApplicationContexts](self, "directActionApplicationContexts");
  }
  else
  {
    -[AFUISiriSession localDataSource](self, "localDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentCarPlaySupportedOEMAppIDListForSiriSession:", self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v10);

    -[AFUISiriSession sessionDelegateContext](self, "sessionDelegateContext");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v11);

  -[AFUISiriSession _connection](self, "_connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchAppicationContextForApplicationInfo:supplementalContext:refID:", v13, v6, 0);

}

- (void)clearContext
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[AFUISiriSession clearContext]";
    _os_log_impl(&dword_217514000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
  -[AFUISiriSession _connection](self, "_connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearContext");

}

- (void)resetContextTypes:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[AFUISiriSession resetContextTypes:]";
    v11 = 2048;
    v12 = a3;
    _os_log_impl(&dword_217514000, v5, OS_LOG_TYPE_DEFAULT, "%s %zd", (uint8_t *)&v9, 0x16u);
    if ((a3 & 4) == 0)
    {
LABEL_3:
      if ((a3 & 2) == 0)
        goto LABEL_4;
LABEL_9:
      -[AFUISiriSession setAlertContext](self, "setAlertContext");
      if ((a3 & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((a3 & 4) == 0)
  {
    goto LABEL_3;
  }
  -[AFUISiriSession clearContext](self, "clearContext");
  if ((a3 & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((a3 & 1) != 0)
LABEL_5:
    -[AFUISiriSession setApplicationContext](self, "setApplicationContext");
LABEL_6:
  -[AFUISiriSession localDataSource](self, "localDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "lockStateForSiriSession:", self);

  -[AFUISiriSession setLockState:](self, "setLockState:", v7);
  -[AFUISiriSession setWatchAuthenticated:](self, "setWatchAuthenticated:", 0);
  -[AFUISiriSession localDelegate](self, "localDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "siriSessionDidResetContext:", self);

}

- (void)rollbackClearContext
{
  id v2;

  -[AFUISiriSession _connection](self, "_connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rollbackClearContext");

}

- (void)setDeviceInStarkMode:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_isDeviceInStarkMode = a3;
  -[AFUISiriSession _connection](self, "_connection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsDeviceInStarkMode:", v3);

}

- (void)setCarDNDActive:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AFUISiriSession _connection](self, "_connection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCarDNDActive:", v3);

}

- (void)setSupportsCarPlayVehicleData:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AFUISiriSession _connection](self, "_connection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSupportsCarPlayVehicleData:", v3);

}

- (void)setLockState:(unint64_t)a3
{
  unsigned int v4;
  char v5;
  _QWORD v6[4];
  id v7[2];
  char v8;
  char v9;
  id location;

  v4 = (a3 >> 1) & 1;
  v5 = a3 & 1;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __32__AFUISiriSession_setLockState___block_invoke;
  v6[3] = &unk_24D7A2A68;
  objc_copyWeak(v7, &location);
  v8 = v4;
  v9 = v5;
  v7[1] = (id)a3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __32__AFUISiriSession_setLockState___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  _QWORD v6[5];

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLockState:screenLocked:", *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));

  v5 = objc_loadWeakRetained(v2);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __32__AFUISiriSession_setLockState___block_invoke_2;
  v6[3] = &__block_descriptor_40_e35_v16__0___AFUISiriSessionDelegate__8l;
  v6[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v5, "_performBlockWithDelegate:", v6);

}

uint64_t __32__AFUISiriSession_setLockState___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionDidChangeLockState:", *(_QWORD *)(a1 + 32));
}

- (void)setAnnouncementRequestsPermittedByPresentationWhileActive:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[AFUISiriSession setAnnouncementRequestsPermittedByPresentationWhileActive:]";
    v9 = 1024;
    v10 = v3;
    _os_log_impl(&dword_217514000, v5, OS_LOG_TYPE_DEFAULT, "%s Updating announcement requests permitted by presentation: %{BOOL}d", (uint8_t *)&v7, 0x12u);
  }
  -[AFUISiriSession _connection](self, "_connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAnnouncementRequestsPermittedByPresentationWhileActive:", v3);

}

- (void)_handleUnlockAppCommand:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  id WeakRetained;
  id v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  void (**v22)(_QWORD, _QWORD);
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __54__AFUISiriSession__handleUnlockAppCommand_completion___block_invoke;
  v24[3] = &unk_24D7A25F8;
  v9 = v7;
  v26 = v9;
  v10 = v6;
  v25 = v10;
  v11 = (void (**)(_QWORD, _QWORD))MEMORY[0x219A0D984](v24);
  objc_msgSend(v10, "appBundleId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x24BE08FB0];
  v14 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[AFUISiriSession _handleUnlockAppCommand:completion:]";
      v29 = 2112;
      v30 = v12;
      _os_log_impl(&dword_217514000, v13, OS_LOG_TYPE_DEFAULT, "%s UnlockApp command received for appBundleId=%@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_localDelegate);
    v20[0] = v8;
    v20[1] = 3221225472;
    v20[2] = __54__AFUISiriSession__handleUnlockAppCommand_completion___block_invoke_154;
    v20[3] = &unk_24D7A2A90;
    v22 = v11;
    v16 = v10;
    v21 = v16;
    objc_copyWeak(&v23, (id *)buf);
    objc_msgSend(WeakRetained, "siriSession:didReceiveAppUnlockRequestForAppId:withCompletion:", self, v12, v20);

    v17 = objc_alloc(MEMORY[0x24BE09220]);
    objc_msgSend(v16, "refId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithOriginalCommandId:category:duration:", v18, 5, 0);

    -[AFUISiriSession recordUIMetrics:](self, "recordUIMetrics:", v19);
    objc_destroyWeak(&v23);

    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v14)
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[AFUISiriSession _handleUnlockAppCommand:completion:]";
      _os_log_impl(&dword_217514000, v13, OS_LOG_TYPE_DEFAULT, "%s UnlockApp command received without appBundleId, returning failure", buf, 0xCu);
    }
    v11[2](v11, 0);
  }

}

void __54__AFUISiriSession__handleUnlockAppCommand_completion___block_invoke(uint64_t a1, int a2)
{
  Class *v3;
  void *v4;
  id v5;

  if (*(_QWORD *)(a1 + 40))
  {
    v3 = (Class *)0x24BE811B8;
    if (!a2)
      v3 = (Class *)0x24BE811A8;
    v5 = objc_alloc_init(*v3);
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRefId:", v4);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __54__AFUISiriSession__handleUnlockAppCommand_completion___block_invoke_154(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  id WeakRetained;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[AFUISiriSession _handleUnlockAppCommand:completion:]_block_invoke";
    v9 = 2050;
    v10 = a2;
    _os_log_impl(&dword_217514000, v4, OS_LOG_TYPE_DEFAULT, "%s APGuard complete for App Unlock, result=%{public}ld", (uint8_t *)&v7, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "failureCommands");
  else
    objc_msgSend(*(id *)(a1 + 32), "successCommands");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_performAceCommands:", v5);

}

- (void)_handleUnlockDeviceCommand:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id WeakRetained;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[AFUISiriSession localDataSource](self, "localDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "lockStateForSiriSession:", self);

  v10 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "-[AFUISiriSession _handleUnlockDeviceCommand:completion:]";
    v30 = 2048;
    v31 = v9;
    _os_log_impl(&dword_217514000, v10, OS_LOG_TYPE_DEFAULT, "%s Lock state while handling unlockDevice command = %zd", buf, 0x16u);
  }
  v11 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __57__AFUISiriSession__handleUnlockDeviceCommand_completion___block_invoke;
  v25[3] = &unk_24D7A25F8;
  v12 = v7;
  v27 = v12;
  v13 = v6;
  v26 = v13;
  v14 = MEMORY[0x219A0D984](v25);
  v15 = (void *)v14;
  if ((v9 & 2) != 0)
  {
    objc_initWeak((id *)buf, self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_localDelegate);
    v21[0] = v11;
    v21[1] = 3221225472;
    v21[2] = __57__AFUISiriSession__handleUnlockDeviceCommand_completion___block_invoke_2;
    v21[3] = &unk_24D7A2AB8;
    objc_copyWeak(&v24, (id *)buf);
    v22 = v13;
    v23 = v15;
    objc_msgSend(WeakRetained, "siriSession:didReceiveDeviceUnlockRequestAndCancelRequest:withCompletion:", self, 0, v21);

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v14, 1);
    objc_msgSend(v13, "successCommands");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFUISiriSession _performAceCommands:](self, "_performAceCommands:", v16);

  }
  v18 = objc_alloc(MEMORY[0x24BE09220]);
  objc_msgSend(v13, "refId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithOriginalCommandId:category:duration:", v19, 5, 0);

  -[AFUISiriSession recordUIMetrics:](self, "recordUIMetrics:", v20);
}

void __57__AFUISiriSession__handleUnlockDeviceCommand_completion___block_invoke(uint64_t a1, int a2)
{
  Class *v3;
  void *v4;
  id v5;

  if (*(_QWORD *)(a1 + 40))
  {
    v3 = (Class *)0x24BE811B8;
    if (!a2)
      v3 = (Class *)0x24BE811A8;
    v5 = objc_alloc_init(*v3);
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRefId:", v4);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __57__AFUISiriSession__handleUnlockDeviceCommand_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t v4;
  void (*v5)(void);
  id v6;
  id v7;

  if (a2 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "cancellationCommands");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a2 == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "failureCommands");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v5 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
      goto LABEL_8;
    }
    if (a2)
    {
      v7 = 0;
      goto LABEL_10;
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "setLockState:", 0);

    objc_msgSend(*(id *)(a1 + 32), "successCommands");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (id)v4;
  v5 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_8:
  v5();
LABEL_10:
  v6 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v6, "_performAceCommands:", v7);

}

- (void)_handleUnlockDeviceWithWatchCommand:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id location;
  _QWORD v20[4];
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __66__AFUISiriSession__handleUnlockDeviceWithWatchCommand_completion___block_invoke;
  v20[3] = &unk_24D7A25F8;
  v9 = v7;
  v22 = v9;
  v10 = v6;
  v21 = v10;
  v11 = (void *)MEMORY[0x219A0D984](v20);
  objc_initWeak(&location, self);
  -[AFUISiriSession _watchAuthenticationManager](self, "_watchAuthenticationManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __66__AFUISiriSession__handleUnlockDeviceWithWatchCommand_completion___block_invoke_2;
  v15[3] = &unk_24D7A2AE0;
  objc_copyWeak(&v18, &location);
  v13 = v11;
  v17 = v13;
  v14 = v10;
  v16 = v14;
  objc_msgSend(v12, "requestWatchAuthentication:", v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __66__AFUISiriSession__handleUnlockDeviceWithWatchCommand_completion___block_invoke(uint64_t a1, int a2)
{
  Class *v3;
  void *v4;
  id v5;

  if (*(_QWORD *)(a1 + 40))
  {
    v3 = (Class *)0x24BE811B8;
    if (!a2)
      v3 = (Class *)0x24BE811A8;
    v5 = objc_alloc_init(*v3);
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRefId:", v4);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __66__AFUISiriSession__handleUnlockDeviceWithWatchCommand_completion___block_invoke_2(uint64_t a1, int a2)
{
  id *v4;
  id WeakRetained;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (a2)
    {
      v6 = objc_loadWeakRetained(v4);
      objc_msgSend(v6, "setWatchAuthenticated:", 1);

      objc_msgSend(*(id *)(a1 + 32), "successCommands");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "failureCommands");
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __66__AFUISiriSession__handleUnlockDeviceWithWatchCommand_completion___block_invoke_3;
    v9[3] = &unk_24D7A1D90;
    objc_copyWeak(&v11, v4);
    v10 = v7;
    v8 = v7;
    dispatch_async(MEMORY[0x24BDAC9B8], v9);

    objc_destroyWeak(&v11);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __66__AFUISiriSession__handleUnlockDeviceWithWatchCommand_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_performAceCommands:", *(_QWORD *)(a1 + 32));

}

- (void)setWatchAuthenticated:(BOOL)a3
{
  _QWORD block[4];
  id v5;
  BOOL v6;
  id location;

  objc_initWeak(&location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__AFUISiriSession_setWatchAuthenticated___block_invoke;
  block[3] = &unk_24D7A1C20;
  objc_copyWeak(&v5, &location);
  v6 = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __41__AFUISiriSession_setWatchAuthenticated___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWatchAuthenticated:", *(unsigned __int8 *)(a1 + 40));

}

- (SRUIFWatchAuthenticationManager)_watchAuthenticationManager
{
  SRUIFWatchAuthenticationManager *watchAuthenticationManager;
  SRUIFWatchAuthenticationManager *v4;
  SRUIFWatchAuthenticationManager *v5;

  watchAuthenticationManager = self->_watchAuthenticationManager;
  if (!watchAuthenticationManager)
  {
    v4 = (SRUIFWatchAuthenticationManager *)objc_alloc_init(MEMORY[0x24BEA8698]);
    v5 = self->_watchAuthenticationManager;
    self->_watchAuthenticationManager = v4;

    watchAuthenticationManager = self->_watchAuthenticationManager;
  }
  return watchAuthenticationManager;
}

- (void)_performAceCommand:(id)a3 forRequestUpdateViewsCommand:(id)a4 afterDelay:(double)a5
{
  id v8;
  id v9;
  dispatch_time_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v8 = a3;
  v9 = a4;
  objc_initWeak(&location, self);
  v10 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __78__AFUISiriSession__performAceCommand_forRequestUpdateViewsCommand_afterDelay___block_invoke;
  v13[3] = &unk_24D7A2B08;
  objc_copyWeak(&v16, &location);
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_after(v10, MEMORY[0x24BDAC9B8], v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __78__AFUISiriSession__performAceCommand_forRequestUpdateViewsCommand_afterDelay___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  double v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v4 = a1[4];
  v5 = (double)mach_absolute_time();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __78__AFUISiriSession__performAceCommand_forRequestUpdateViewsCommand_afterDelay___block_invoke_2;
  v6[3] = &unk_24D7A2B08;
  objc_copyWeak(&v9, v2);
  v7 = a1[4];
  v8 = a1[5];
  objc_msgSend(WeakRetained, "_performAceCommand:turnIdentifier:machAbsoluteTime:conflictHandler:", v4, 0, v6, v5);

  objc_destroyWeak(&v9);
}

void __78__AFUISiriSession__performAceCommand_forRequestUpdateViewsCommand_afterDelay___block_invoke_2(id *a1)
{
  _QWORD block[4];
  id v3;
  id v4;
  id v5;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__AFUISiriSession__performAceCommand_forRequestUpdateViewsCommand_afterDelay___block_invoke_3;
  block[3] = &unk_24D7A2B08;
  objc_copyWeak(&v5, a1 + 6);
  v3 = a1[4];
  v4 = a1[5];
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v5);
}

void __78__AFUISiriSession__performAceCommand_forRequestUpdateViewsCommand_afterDelay___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_performAceCommand:forRequestUpdateViewsCommand:afterDelay:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 10.0);

}

- (void)_handleRequestUpdateViewsCommand:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  objc_msgSend(v6, "timeInSeconds");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v6, "commands", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        -[AFUISiriSession _performAceCommand:forRequestUpdateViewsCommand:afterDelay:](self, "_performAceCommand:forRequestUpdateViewsCommand:afterDelay:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15++), v6, v10);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  if (v7)
  {
    v16 = objc_alloc_init(MEMORY[0x24BE811B8]);
    objc_msgSend(v6, "aceId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setRefId:", v17);

    v7[2](v7, v16);
  }

}

- (void)performAceCommand:(id)a3 turnIdentifier:(id)a4 machAbsoluteTime:(double)a5
{
  -[AFUISiriSession _performAceCommand:turnIdentifier:machAbsoluteTime:conflictHandler:](self, "_performAceCommand:turnIdentifier:machAbsoluteTime:conflictHandler:", a3, a4, 0, a5);
}

- (void)_performAceCommands:(id)a3
{
  id v4;
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

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
        -[AFUISiriSession performAceCommand:turnIdentifier:machAbsoluteTime:](self, "performAceCommand:turnIdentifier:machAbsoluteTime:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), 0, (double)mach_absolute_time());
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_performAceCommand:(id)a3 turnIdentifier:(id)a4 machAbsoluteTime:(double)a5 conflictHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[4];
  id v31;
  double v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (SRUIFShouldInstrumentLaunchContextForAceCommand())
  {
    SRUIFConstructLaunchContextForLaunchStarted();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __86__AFUISiriSession__performAceCommand_turnIdentifier_machAbsoluteTime_conflictHandler___block_invoke;
    v30[3] = &unk_24D7A2878;
    v31 = v13;
    v32 = a5;
    v14 = v13;
    -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", v30);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = 0u;
    v29 = 0u;
    v27 = 0u;
    objc_msgSend(v10, "commands", 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v27 != v18)
            objc_enumerationMutation(v15);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[SRUIFSiriSessionStateHandler performTransitionForEvent:](self->_stateHandler, "performTransitionForEvent:", 8);
            goto LABEL_16;
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
        if (v17)
          continue;
        break;
      }
    }
LABEL_16:

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SRUIFSiriSessionStateHandler performTransitionForEvent:](self->_stateHandler, "performTransitionForEvent:", 8);
  }
  if (-[AFUISiriSession _aceObjectExpectsTurnIdentifierWhenSendingCommand:](self, "_aceObjectExpectsTurnIdentifierWhenSendingCommand:", v10))
  {
    if (!v11)
    {
      v20 = (void *)*MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
        -[AFUISiriSession _performAceCommand:turnIdentifier:machAbsoluteTime:conflictHandler:].cold.1(v20);
LABEL_25:
      v11 = 0;
    }
  }
  else if (v11)
  {
    v21 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v22 = v21;
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v34 = "-[AFUISiriSession _performAceCommand:turnIdentifier:machAbsoluteTime:conflictHandler:]";
      v35 = 2112;
      v36 = v24;
      _os_log_impl(&dword_217514000, v22, OS_LOG_TYPE_DEFAULT, "%s Sending ace command of class %@ with a turn identifier is unsupported. Dropping turn identifier.", buf, 0x16u);

    }
    goto LABEL_25;
  }
  -[AFUISiriSession _connection](self, "_connection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sendGenericAceCommand:turnIdentifier:conflictHandler:", v10, v11, v12);

}

uint64_t __86__AFUISiriSession__performAceCommand_turnIdentifier_machAbsoluteTime_conflictHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionRequestsInstrumentingMessage:machAbsoluteTime:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));
}

- (BOOL)_aceObjectExpectsTurnIdentifierWhenSendingCommand:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)siriUIDidPresentDynamicSnippetWithInfo:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  Class (*v15)(uint64_t);
  void *v16;
  uint64_t *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (siriUIDidPresentDynamicSnippetWithInfo__onceToken != -1)
    dispatch_once(&siriUIDidPresentDynamicSnippetWithInfo__onceToken, &__block_literal_global_159);
  if (!CoreDuetLibraryCore_frameworkLibrary)
  {
    v14 = xmmword_24D7A2C08;
    v15 = 0;
    CoreDuetLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (CoreDuetLibraryCore_frameworkLibrary)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)get_DKSystemEventStreamsClass_softClass;
    v13 = get_DKSystemEventStreamsClass_softClass;
    if (!get_DKSystemEventStreamsClass_softClass)
    {
      *(_QWORD *)&v14 = MEMORY[0x24BDAC760];
      *((_QWORD *)&v14 + 1) = 3221225472;
      v15 = __get_DKSystemEventStreamsClass_block_invoke;
      v16 = &unk_24D7A1A28;
      v17 = &v10;
      __get_DKSystemEventStreamsClass_block_invoke((uint64_t)&v14);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    objc_msgSend(v5, "siriServiceStream", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  AFRecordCoreDuetEventWithStream();

}

void __58__AFUISiriSession_siriUIDidPresentDynamicSnippetWithInfo___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("Core duet logging queue", 0);
  v1 = (void *)siriUIDidPresentDynamicSnippetWithInfo__sDuetQueue;
  siriUIDidPresentDynamicSnippetWithInfo__sDuetQueue = (uint64_t)v0;

}

+ (id)effectiveCoreLocationBundle
{
  return (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
}

- (void)end
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[AFUISiriSession end]";
    _os_log_impl(&dword_217514000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  -[AFUISiriSession endForReason:](self, "endForReason:", 0);
}

- (void)endForReason:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[AFUISiriSession endForReason:]";
    v10 = 2048;
    v11 = a3;
    _os_log_impl(&dword_217514000, v5, OS_LOG_TYPE_DEFAULT, "%s reason %zd", (uint8_t *)&v8, 0x16u);
  }
  -[AFUISiriSession localDelegate](self, "localDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "siriSessionWillEnd:", self);

  -[SRUIFStateFeedbackManager siriSessionDidEnd](self->_stateFeedbackManager, "siriSessionDidEnd");
  -[SRUIFSpeechRequestHandler discardCurrentSpeechGroup](self->_speechRequestHandler, "discardCurrentSpeechGroup");
  if (-[AFUISiriSession _isContinuousConversationAvailable](self, "_isContinuousConversationAvailable"))
    -[SRUIFUIBridgeClient endForReason:](self->_uiBridgeClient, "endForReason:", a3);
  -[SRUIFAudioPowerLevelUpdater invalidate](self->_audioPowerLevelUpdater, "invalidate");
  -[AFUISiriSession _discardConnectionForReason:](self, "_discardConnectionForReason:", a3);
  -[AFSiriClientStateManager invalidateClient:](self->_clientStateManager, "invalidateClient:", self);
  -[AFUISiriSession localDelegate](self, "localDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "siriSessionDidEnd:", self);

}

- (void)stopAttending
{
  if (-[AFUISiriSession _isContinuousConversationAvailable](self, "_isContinuousConversationAvailable"))
    -[SRUIFUIBridgeClient stopAttending](self->_uiBridgeClient, "stopAttending");
}

- (void)_discardConnectionForReason:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  AFConnection *connection;
  SRUIFUIBridgeClient *uiBridgeClient;
  SRUIFAudioPowerLevelUpdater *audioPowerLevelUpdater;

  -[AFUISiriSession _connection](self, "_connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelRequestForReason:", a3);

  -[AFUISiriSession _connection](self, "_connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endSession");

  -[AFUISiriSession _connection](self, "_connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");

  -[AFUISiriSession _connection](self, "_connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSpeechDelegate:", 0);

  -[AFUISiriSession _connection](self, "_connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", 0);

  connection = self->_connection;
  self->_connection = 0;

  uiBridgeClient = self->_uiBridgeClient;
  self->_uiBridgeClient = 0;

  audioPowerLevelUpdater = self->_audioPowerLevelUpdater;
  self->_audioPowerLevelUpdater = 0;

}

- (BOOL)isListening
{
  return -[SRUIFSiriSessionStateHandler state](self->_stateHandler, "state") == 1;
}

- (float)recordingPowerLevel
{
  SRUIFAudioPowerLevelUpdater *audioPowerLevelUpdater;
  int v4;
  uint64_t v5;
  float result;

  audioPowerLevelUpdater = self->_audioPowerLevelUpdater;
  if (!audioPowerLevelUpdater)
  {
    v4 = objc_msgSend(MEMORY[0x24BE091E0], "isContinuousConversationEnabled");
    v5 = 32;
    if (v4)
      v5 = 192;
    audioPowerLevelUpdater = *(Class *)((char *)&self->super.isa + v5);
  }
  -[SRUIFAudioPowerLevelUpdater averagePower](audioPowerLevelUpdater, "averagePower");
  return result;
}

- (id)underlyingConnection
{
  return self->_connection;
}

- (void)_localAuthenticationUIPresented
{
  -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", &__block_literal_global_163_0);
}

uint64_t __50__AFUISiriSession__localAuthenticationUIPresented__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionIsPresentingLocalAuthenticationUI");
}

- (void)_applePaySheetPresented
{
  -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", &__block_literal_global_164_0);
}

uint64_t __42__AFUISiriSession__applePaySheetPresented__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionIsPresentingApplePaySheet");
}

- (void)_updateActiveAccount:(id)a3
{
  id v4;
  AFSettingsConnection *settingsConnection;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  settingsConnection = self->_settingsConnection;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__AFUISiriSession__updateActiveAccount___block_invoke;
  v7[3] = &unk_24D7A2B90;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  -[AFSettingsConnection fetchAccountsWithCompletion:](settingsConnection, "fetchAccountsWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __40__AFUISiriSession__updateActiveAccount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      __40__AFUISiriSession__updateActiveAccount___block_invoke_cold_1();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
      objc_msgSend(WeakRetained, "_updateActiveAccount:withNumberOfActiveAccounts:", *(_QWORD *)(a1 + 32), objc_msgSend(v5, "count"));

  }
}

- (void)_updateActiveAccount:(id)a3 withNumberOfActiveAccounts:(unint64_t)a4
{
  void *v6;
  id v7;
  id WeakRetained;
  char v9;
  id v10;
  _QWORD v11[4];
  id v12;

  -[SRUIFSiriSessionInfo setActiveAccountAndGenerateLightweightInfo:](self->_siriSessionInfo, "setActiveAccountAndGenerateLightweightInfo:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (id)-[SRUIFSiriSessionInfo setUserAccountCountGenerateLightweightInfo:](self->_siriSessionInfo, "setUserAccountCountGenerateLightweightInfo:", a4);
    WeakRetained = objc_loadWeakRetained((id *)&self->_localDelegate);
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      v10 = objc_loadWeakRetained((id *)&self->_localDelegate);
      objc_msgSend(v10, "siriSessionDidUpdateSessionInfo:", v6);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __67__AFUISiriSession__updateActiveAccount_withNumberOfActiveAccounts___block_invoke;
      v11[3] = &unk_24D7A2350;
      v12 = v6;
      -[AFUISiriSession _performBlockWithDelegate:](self, "_performBlockWithDelegate:", v11);

    }
  }

}

uint64_t __67__AFUISiriSession__updateActiveAccount_withNumberOfActiveAccounts___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "siriSessionDidUpdateSessionInfo:", *(_QWORD *)(a1 + 32));
}

- (void)_updateModesHeuristicsForRequestOptions:(id)a3
{
  id v4;
  char v5;
  AFModesConfiguration *modesConfiguration;
  id *v7;
  id v8;
  AFModesConfiguration *v9;
  AFModesConfiguration *v10;
  NSObject *v11;
  AFModesConfiguration *v12;
  const char *v13;
  void *v14;
  id v15;
  AFModesConfiguration *v16;
  AFModesConfiguration *v17;
  AFModesConfiguration *v18;
  _QWORD v19[4];
  _QWORD v20[2];
  char v21;
  _QWORD v22[4];
  _QWORD v23[2];
  char v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  AFModesConfiguration *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0)
    v5 = 0;
  else
    v5 = objc_msgSend(v4, "isForBluetoothCar");
  modesConfiguration = self->_modesConfiguration;
  if (modesConfiguration)
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __59__AFUISiriSession__updateModesHeuristicsForRequestOptions___block_invoke_168;
    v19[3] = &unk_24D7A2BB8;
    v7 = (id *)v20;
    v8 = v4;
    v21 = v5;
    v20[0] = v8;
    v20[1] = self;
    -[AFModesConfiguration mutatedCopyWithMutator:](modesConfiguration, "mutatedCopyWithMutator:", v19);
    v9 = (AFModesConfiguration *)objc_claimAutoreleasedReturnValue();
    v10 = self->_modesConfiguration;
    self->_modesConfiguration = v9;

    v11 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v12 = self->_modesConfiguration;
      *(_DWORD *)buf = 136315394;
      v26 = "-[AFUISiriSession _updateModesHeuristicsForRequestOptions:]";
      v27 = 2112;
      v28 = v12;
      v13 = "%s #modes Updating modes configuration with heuristics related to RequestOptions: %@";
LABEL_9:
      _os_log_impl(&dword_217514000, v11, OS_LOG_TYPE_DEFAULT, v13, buf, 0x16u);
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x24BE09228];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __59__AFUISiriSession__updateModesHeuristicsForRequestOptions___block_invoke;
    v22[3] = &unk_24D7A2BB8;
    v7 = (id *)v23;
    v15 = v4;
    v24 = v5;
    v23[0] = v15;
    v23[1] = self;
    v16 = (AFModesConfiguration *)objc_msgSend(v14, "newWithBuilder:", v22);
    v17 = self->_modesConfiguration;
    self->_modesConfiguration = v16;

    v11 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v18 = self->_modesConfiguration;
      *(_DWORD *)buf = 136315394;
      v26 = "-[AFUISiriSession _updateModesHeuristicsForRequestOptions:]";
      v27 = 2112;
      v28 = v18;
      v13 = "%s #modes Creating modes configuration with heuristics related to RequestOptions: %@";
      goto LABEL_9;
    }
  }

}

void __59__AFUISiriSession__updateModesHeuristicsForRequestOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _BOOL8 v5;
  id WeakRetained;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (objc_msgSend(v3, "isForEyesFree") & 1) != 0 || *(_BYTE *)(a1 + 48) != 0;
  objc_msgSend(v4, "setIsEyesFree:", v5);
  objc_msgSend(v4, "setIsUIFree:", objc_msgSend(*(id *)(a1 + 32), "isForUIFree"));
  objc_msgSend(v4, "setIsForCarDND:", objc_msgSend(*(id *)(a1 + 32), "isForCarDND"));
  objc_msgSend(v4, "setIsVoiceTriggerRequest:", objc_msgSend(*(id *)(a1 + 32), "isVoiceTriggerRequest"));
  objc_msgSend(v4, "setIsConnectedToCarPlay:", objc_msgSend(*(id *)(a1 + 32), "isConnectedToCarPlay"));
  objc_msgSend(v4, "setIsSiriAutoPrompt:", objc_msgSend(*(id *)(a1 + 32), "isInAutoPrompt"));
  objc_msgSend(v4, "setIsFlexibleFollowup:", objc_msgSend(*(id *)(a1 + 32), "isFlexibleFollowupRequest"));
  objc_msgSend(v4, "setIsRequestMadeWithPhysicalDeviceInteraction:", objc_msgSend(*(id *)(a1 + 32), "isRequestMadeWithPhysicalDeviceInteraction"));
  objc_msgSend(v4, "setUserTypedInSiri:", objc_msgSend(*(id *)(a1 + 32), "userTypedInSiri"));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 112));
  objc_msgSend(v4, "setDeviceOrientation:", objc_msgSend(WeakRetained, "getDeviceOrientation:", *(_QWORD *)(a1 + 40)));

  v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 112));
  if (objc_msgSend(v7, "recentButtonPressActivityDetected:", *(_QWORD *)(a1 + 40)))
    v8 = 2;
  else
    v8 = 1;
  objc_msgSend(v4, "setButtonPressDetected:", v8);

  v9 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 112));
  if (objc_msgSend(v9, "recentTouchScreenActivityDetected:", *(_QWORD *)(a1 + 40)))
    v10 = 2;
  else
    v10 = 1;
  objc_msgSend(v4, "setTouchScreenDetected:", v10);

  objc_msgSend(MEMORY[0x24BE90800], "sharedSystemState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsDeviceScreenON:", objc_msgSend(v11, "deviceScreenIsOn"));

  objc_msgSend(MEMORY[0x24BE90800], "sharedSystemState");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLiftToWakeDetected:", objc_msgSend(v12, "deviceLiftToWake"));

}

void __59__AFUISiriSession__updateModesHeuristicsForRequestOptions___block_invoke_168(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _BOOL8 v5;
  id WeakRetained;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (objc_msgSend(v3, "isForEyesFree") & 1) != 0 || *(_BYTE *)(a1 + 48) != 0;
  objc_msgSend(v4, "setIsEyesFree:", v5);
  objc_msgSend(v4, "setIsForCarDND:", objc_msgSend(*(id *)(a1 + 32), "isForCarDND"));
  objc_msgSend(v4, "setIsVoiceTriggerRequest:", objc_msgSend(*(id *)(a1 + 32), "isVoiceTriggerRequest"));
  objc_msgSend(v4, "setIsConnectedToCarPlay:", objc_msgSend(*(id *)(a1 + 32), "isConnectedToCarPlay"));
  objc_msgSend(v4, "setIsSiriAutoPrompt:", objc_msgSend(*(id *)(a1 + 32), "isInAutoPrompt"));
  objc_msgSend(v4, "setIsFlexibleFollowup:", objc_msgSend(*(id *)(a1 + 32), "isFlexibleFollowupRequest"));
  objc_msgSend(v4, "setIsRequestMadeWithPhysicalDeviceInteraction:", objc_msgSend(*(id *)(a1 + 32), "isRequestMadeWithPhysicalDeviceInteraction"));
  objc_msgSend(v4, "setUserTypedInSiri:", objc_msgSend(*(id *)(a1 + 32), "userTypedInSiri"));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 112));
  objc_msgSend(v4, "setDeviceOrientation:", objc_msgSend(WeakRetained, "getDeviceOrientation:", *(_QWORD *)(a1 + 40)));

  v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 112));
  if (objc_msgSend(v7, "recentButtonPressActivityDetected:", *(_QWORD *)(a1 + 40)))
    v8 = 2;
  else
    v8 = 1;
  objc_msgSend(v4, "setButtonPressDetected:", v8);

  v9 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 112));
  if (objc_msgSend(v9, "recentTouchScreenActivityDetected:", *(_QWORD *)(a1 + 40)))
    v10 = 2;
  else
    v10 = 1;
  objc_msgSend(v4, "setTouchScreenDetected:", v10);

  objc_msgSend(MEMORY[0x24BE90800], "sharedSystemState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsDeviceScreenON:", objc_msgSend(v11, "deviceScreenIsOn"));

  objc_msgSend(MEMORY[0x24BE90800], "sharedSystemState");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLiftToWakeDetected:", objc_msgSend(v12, "deviceLiftToWake"));

}

- (id)_modeOverrideValue
{
  void *v2;
  void *v3;
  void *v4;

  if (AFIsInternalInstall())
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.siri.internal"));
    objc_msgSend(v2, "stringForKey:", CFSTR("ModeOverride"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lowercaseString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_invocationEventForRequestOptions:(id)a3 localDataSource:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BE95B28]);
  objc_msgSend(v6, "speechRequestOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "activationEvent") == 15)
  {
    v10 = 21;
  }
  else
  {
    objc_msgSend(v9, "voiceTriggerEventInfo");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
      goto LABEL_6;
    v12 = (void *)v11;
    objc_msgSend(v9, "voiceTriggerEventInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("triggeredPhraseId"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unsignedLongValue");

    if (v15 == 1)
      v10 = 80;
    else
LABEL_6:
      v10 = -[AFUISiriSession _mapInvocationSource:](self, "_mapInvocationSource:", objc_msgSend(v6, "requestSource"));
  }
  objc_msgSend(v8, "setInvocationSource:", v10);
  objc_msgSend(v8, "setIsDeviceLocked:", objc_msgSend(v7, "lockStateForSiriSession:", self) != 0);
  if (objc_msgSend(v6, "isForStark"))
  {
    v16 = objc_alloc_init(MEMORY[0x24BE95AC0]);
    objc_msgSend(v6, "requestInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "activationEvent");

    if (v18 == 2)
    {
      v19 = objc_msgSend(v6, "directActionEvent");
      objc_msgSend(v6, "appBundleIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFUISiriSession _updateCarPlayInvocationContext:fromDirectActionEvent:appBundleIdentifier:](self, "_updateCarPlayInvocationContext:fromDirectActionEvent:appBundleIdentifier:", v16, v19, v20);

    }
    objc_msgSend(v7, "carPlayEnhancedVoiceTriggerModeForSiriSession:", self);
    objc_msgSend(v16, "setEnhancedVoiceTriggerMode:", SASCarPlayEnhancedVoiceTriggerModeToSISchemaEnhancedVoiceTriggerMode());
    objc_msgSend(MEMORY[0x24BE90800], "sharedSystemState");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "carPlayTransportType");

    objc_msgSend(v16, "setCarPlayConnection:", SASCarPlayTransportTypeToSISchemaCarPlayConnection());
    objc_msgSend(v8, "setCarPlayInvocationContext:", v16);
  }
  else if (objc_msgSend(v6, "tvRemoteType"))
  {
    -[AFUISiriSession _invocationContextFromTVRemoteType:](self, "_invocationContextFromTVRemoteType:", objc_msgSend(v6, "tvRemoteType"));
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTvRemoteInvocationContext:", v16);
  }
  else
  {
    v16 = objc_alloc_init(MEMORY[0x24BE95B08]);
    v22 = objc_msgSend(v6, "longPressBehavior") + 1;
    if (v22 < 3)
      v23 = (v22 + 1);
    else
      v23 = 0;
    objc_msgSend(v16, "setHardwareButtonLongPressBehavior:", v23);
    objc_msgSend(v8, "setHardwareButtonInvocationContext:", v16);
  }

  return v8;
}

- (int)_mapInvocationSource:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x30)
    return 0;
  else
    return dword_2175630A4[a3 - 1];
}

- (void)_updateCarPlayInvocationContext:(id)a3 fromDirectActionEvent:(int64_t)a4 appBundleIdentifier:(id)a5
{
  id v7;
  id v8;
  int64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  int64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  v9 = a4 - 2;
  if ((unint64_t)(a4 - 2) < 0x11 && ((0x1E83Du >> v9) & 1) != 0)
  {
    v12 = dword_217563168[v9];
  }
  else
  {
    v10 = *MEMORY[0x24BE08FB0];
    v11 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT);
    v12 = 0;
    if (v11)
    {
      v13 = 136315394;
      v14 = "-[AFUISiriSession _updateCarPlayInvocationContext:fromDirectActionEvent:appBundleIdentifier:]";
      v15 = 2048;
      v16 = a4;
      _os_log_impl(&dword_217514000, v10, OS_LOG_TYPE_DEFAULT, "%s Unhandled direct action event: %li", (uint8_t *)&v13, 0x16u);
      v12 = 0;
    }
  }
  objc_msgSend(v7, "setDirectAction:", v12);
  objc_msgSend(v7, "setBundleID:", v8);

}

- (id)_invocationContextFromTVRemoteType:(unint64_t)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = objc_alloc_init(MEMORY[0x24BE95B88]);
  v5 = v4;
  if (a3 - 1 > 5)
    v6 = 0;
  else
    v6 = dword_2175631AC[a3 - 1];
  objc_msgSend(v4, "setRemoteType:", v6);
  return v5;
}

- (AFUISiriSessionDelegate)delegate
{
  return self->_delegate;
}

- (AFUISiriSessionLocalDataSource)localDataSource
{
  return (AFUISiriSessionLocalDataSource *)objc_loadWeakRetained((id *)&self->_localDataSource);
}

- (AFUISiriSessionLocalDelegate)localDelegate
{
  return (AFUISiriSessionLocalDelegate *)objc_loadWeakRetained((id *)&self->_localDelegate);
}

- (void)setLocalDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_localDelegate, a3);
}

- (BOOL)isEyesFree
{
  return self->_eyesFree;
}

- (void)setEyesFree:(BOOL)a3
{
  self->_eyesFree = a3;
}

- (BOOL)isProcessingAcousticIdRequest
{
  return self->_isProcessingAcousticIdRequest;
}

- (SRUIFSiriSessionInfo)siriSessionInfo
{
  return self->_siriSessionInfo;
}

- (void)setSiriSessionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_siriSessionInfo, a3);
}

- (NSArray)sessionDelegateContext
{
  return self->_sessionDelegateContext;
}

- (void)setSessionDelegateContext:(id)a3
{
  objc_storeStrong((id *)&self->_sessionDelegateContext, a3);
}

- (NSArray)directActionApplicationContexts
{
  return self->_directActionApplicationContexts;
}

- (void)setDirectActionApplicationContexts:(id)a3
{
  objc_storeStrong((id *)&self->_directActionApplicationContexts, a3);
}

- (SRUIFSpeechRequestHandler)speechRequestHandler
{
  return self->_speechRequestHandler;
}

- (void)setSpeechRequestHandler:(id)a3
{
  objc_storeStrong((id *)&self->_speechRequestHandler, a3);
}

- (AFAnalyticsTurnBasedInstrumentationContext)_instrumentationTurnContext
{
  return self->_instrumentationTurnContext;
}

- (void)_setInstrumentationTurnContext:(id)a3
{
  objc_storeStrong((id *)&self->_instrumentationTurnContext, a3);
}

- (void)_setWatchAuthenticationManager:(id)a3
{
  objc_storeStrong((id *)&self->_watchAuthenticationManager, a3);
}

- (SRUIFSiriSessionStateHandler)_stateHandler
{
  return self->_stateHandler;
}

- (SRUIFUIBridgeClient)_uiBridgeClient
{
  return self->_uiBridgeClient;
}

- (SRUIFAudioPowerLevelUpdater)_audioPowerLevelUpdater
{
  return self->_audioPowerLevelUpdater;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioPowerLevelUpdater, 0);
  objc_storeStrong((id *)&self->_uiBridgeClient, 0);
  objc_storeStrong((id *)&self->_stateHandler, 0);
  objc_storeStrong((id *)&self->_watchAuthenticationManager, 0);
  objc_storeStrong((id *)&self->_instrumentationTurnContext, 0);
  objc_storeStrong((id *)&self->_speechRequestHandler, 0);
  objc_storeStrong((id *)&self->_directActionApplicationContexts, 0);
  objc_storeStrong((id *)&self->_sessionDelegateContext, 0);
  objc_storeStrong((id *)&self->_siriSessionInfo, 0);
  objc_destroyWeak((id *)&self->_localDelegate);
  objc_destroyWeak((id *)&self->_localDataSource);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_ongoingOrchestrationTasks, 0);
  objc_storeStrong((id *)&self->_activationInstrumentationSender, 0);
  objc_storeStrong((id *)&self->_stateFeedbackManager, 0);
  objc_storeStrong((id *)&self->_modesConfiguration, 0);
  objc_storeStrong((id *)&self->_clientStateManager, 0);
  objc_storeStrong((id *)&self->_settingsConnection, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_lastSpeechSynthesisRecord, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
}

- (void)_connection
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s The AFConnection for this session (%@) has been invalidated.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_getMissingAssetTypes:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Unknown missing asset type found during Siri UNAV event %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_startRequestWithFinalOptions:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s #activation #carPlay unable to handle direct action request options: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_startRequestWithFinalOptions:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Skipping activation. Invalid request options provided for SASRequestSourceTesting: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_startRequestWithFinalOptions:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Unexpected request source %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __60__AFUISiriSession__startRequestWithFinalOptions_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Error fetching accounts: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_startRequestForReadoutOfBulletin:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_217514000, a1, a3, "%s no bulletin in request options. Exiting.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __66__AFUISiriSession_assistantConnection_receivedCommand_completion___block_invoke_2_cold_1(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = a2;
  objc_msgSend(v3, "groupIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "encodedClassName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 136315650;
  v8 = "-[AFUISiriSession assistantConnection:receivedCommand:completion:]_block_invoke_2";
  v9 = 2114;
  v10 = v5;
  v11 = 2114;
  v12 = v6;
  _os_log_error_impl(&dword_217514000, v4, OS_LOG_TYPE_ERROR, "%s AFUISiriSession received unexpected command: %{public}@.%{public}@", (uint8_t *)&v7, 0x20u);

}

- (void)_handlePlayAudioCommand:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_217514000, a1, a3, "%s state feedback not enabled, failing command", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_performAceCommand:(void *)a1 turnIdentifier:machAbsoluteTime:conflictHandler:.cold.1(void *a1)
{
  NSObject *v1;
  objc_class *v2;
  void *v3;
  int v4[6];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 136315394;
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_217514000, v1, OS_LOG_TYPE_ERROR, "%s Sending ace command of class %@ expects a turn identifier, but one isn't provided.", (uint8_t *)v4, 0x16u);

}

void __40__AFUISiriSession__updateActiveAccount___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Error fetching accounts: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

@end
