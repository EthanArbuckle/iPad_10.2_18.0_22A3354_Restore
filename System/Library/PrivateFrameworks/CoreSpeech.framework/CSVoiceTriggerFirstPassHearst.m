@implementation CSVoiceTriggerFirstPassHearst

- (CSVoiceTriggerFirstPassHearst)initWithSpeechManager:(id)a3 voiceTriggerEnabledMonitor:(id)a4 siriClientBehaviorMonitor:(id)a5 phoneCallStateMonitor:(id)a6 otherAppRecordingStateMonitor:(id)a7
{
  id v13;
  id v14;
  id v15;
  CSVoiceTriggerFirstPassHearst *v16;
  CSVoiceTriggerFirstPassHearst *v17;
  void **p_speechManager;
  uint64_t v19;
  void *v20;
  void **p_voiceTriggerEnabledMonitor;
  uint64_t v22;
  void *v23;
  void **p_siriClientBehaviorMonitor;
  uint64_t v25;
  void *v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *queue;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  NSMutableDictionary *hearstSecondPassRequests;
  void **p_phoneCallStateMonitor;
  void *phoneCallStateMonitor;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  CSVoiceTriggerFirstPassHearst *v38;
  void **p_otherAppRecordingStateMonitor;
  uint64_t v40;
  void *v41;
  CSVoiceTriggerUserSelectedPhrase *v42;
  CSVoiceTriggerUserSelectedPhrase *multiPhraseEnabledStatus;
  id v45;
  id v46;
  _QWORD block[4];
  CSVoiceTriggerFirstPassHearst *v48;
  objc_super v49;

  v46 = a3;
  v45 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v49.receiver = self;
  v49.super_class = (Class)CSVoiceTriggerFirstPassHearst;
  v16 = -[CSVoiceTriggerFirstPassHearst init](&v49, sel_init);
  v17 = v16;
  if (v16)
  {
    p_speechManager = (void **)&v16->_speechManager;
    objc_storeStrong((id *)&v16->_speechManager, a3);
    if (!v17->_speechManager)
    {
      +[CSSpeechManager sharedManagerForCoreSpeechDaemon](CSSpeechManager, "sharedManagerForCoreSpeechDaemon");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = *p_speechManager;
      *p_speechManager = (void *)v19;

    }
    p_voiceTriggerEnabledMonitor = (void **)&v17->_voiceTriggerEnabledMonitor;
    objc_storeStrong((id *)&v17->_voiceTriggerEnabledMonitor, a4);
    if (!v17->_voiceTriggerEnabledMonitor)
    {
      objc_msgSend(MEMORY[0x1E0D19280], "sharedInstance");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = *p_voiceTriggerEnabledMonitor;
      *p_voiceTriggerEnabledMonitor = (void *)v22;

    }
    p_siriClientBehaviorMonitor = (void **)&v17->_siriClientBehaviorMonitor;
    objc_storeStrong((id *)&v17->_siriClientBehaviorMonitor, a5);
    if (!v17->_siriClientBehaviorMonitor)
    {
      objc_msgSend(MEMORY[0x1E0D191F0], "sharedInstance");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = *p_siriClientBehaviorMonitor;
      *p_siriClientBehaviorMonitor = (void *)v25;

    }
    v27 = dispatch_queue_create("VoiceTriggerFirstPassHearst Queue", 0);
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v27;

    v29 = v17->_queue;
    dispatch_get_global_queue(33, 0);
    v30 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v29, v30);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v31 = objc_claimAutoreleasedReturnValue();
    hearstSecondPassRequests = v17->_hearstSecondPassRequests;
    v17->_hearstSecondPassRequests = (NSMutableDictionary *)v31;

    p_phoneCallStateMonitor = (void **)&v17->_phoneCallStateMonitor;
    objc_storeStrong((id *)&v17->_phoneCallStateMonitor, a6);
    phoneCallStateMonitor = v17->_phoneCallStateMonitor;
    if (!phoneCallStateMonitor)
    {
      objc_msgSend(MEMORY[0x1E0D191A0], "phoneCallStateMonitor");
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = *p_phoneCallStateMonitor;
      *p_phoneCallStateMonitor = (void *)v35;

      phoneCallStateMonitor = *p_phoneCallStateMonitor;
    }
    objc_msgSend(phoneCallStateMonitor, "addObserver:", v17);
    v37 = v17->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __160__CSVoiceTriggerFirstPassHearst_initWithSpeechManager_voiceTriggerEnabledMonitor_siriClientBehaviorMonitor_phoneCallStateMonitor_otherAppRecordingStateMonitor___block_invoke;
    block[3] = &unk_1E7C292C8;
    v38 = v17;
    v48 = v38;
    dispatch_async(v37, block);
    p_otherAppRecordingStateMonitor = (void **)&v38->_otherAppRecordingStateMonitor;
    objc_storeStrong((id *)&v38->_otherAppRecordingStateMonitor, a7);
    if (!v38->_otherAppRecordingStateMonitor)
    {
      objc_msgSend(MEMORY[0x1E0D19198], "sharedInstance");
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = *p_otherAppRecordingStateMonitor;
      *p_otherAppRecordingStateMonitor = (void *)v40;

    }
    v42 = -[CSVoiceTriggerUserSelectedPhrase initWithEndpointId:]([CSVoiceTriggerUserSelectedPhrase alloc], "initWithEndpointId:", 0);
    multiPhraseEnabledStatus = v38->_multiPhraseEnabledStatus;
    v38->_multiPhraseEnabledStatus = v42;

  }
  return v17;
}

- (CSVoiceTriggerFirstPassHearst)init
{
  return -[CSVoiceTriggerFirstPassHearst initWithSpeechManager:voiceTriggerEnabledMonitor:siriClientBehaviorMonitor:phoneCallStateMonitor:otherAppRecordingStateMonitor:](self, "initWithSpeechManager:voiceTriggerEnabledMonitor:siriClientBehaviorMonitor:phoneCallStateMonitor:otherAppRecordingStateMonitor:", 0, 0, 0, 0, 0);
}

- (void)start
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__CSVoiceTriggerFirstPassHearst_start__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)reset
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__CSVoiceTriggerFirstPassHearst_reset__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_reset
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
  -[NSMutableDictionary objectEnumerator](self->_hearstSecondPassRequests, "objectEnumerator", 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "reset");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)setAsset:(id)a3
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
  v7[2] = __42__CSVoiceTriggerFirstPassHearst_setAsset___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_setAsset:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  void *v10;
  float v11;
  void *v12;
  float v13;
  void *v14;
  NSArray *v15;
  NSArray *phrasesToSkipBoronDecisionMaking;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  NSObject *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "logAssetVersionForInsight");
    objc_storeStrong((id *)&self->_currentAsset, a3);
    objc_msgSend(MEMORY[0x1E0D192A0], "decodeConfigFrom:forFirstPassSource:", self->_currentAsset, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "wearerDetectionConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "threshold");
    self->_remoteMicVADThreshold = v9;

    objc_msgSend(v7, "wearerDetectionConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "myriadThreshold");
    self->_remoteMicVADMyriadThreshold = v11;

    objc_msgSend(v7, "wearerDetectionConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "minimumPhraseLength");
    self->_minimumPhraseLengthForVADGating = v13;

    objc_msgSend(v7, "wearerDetectionConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "phrasesToSkipBoronDecisionMaking");
    v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
    phrasesToSkipBoronDecisionMaking = self->_phrasesToSkipBoronDecisionMaking;
    self->_phrasesToSkipBoronDecisionMaking = v15;

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[NSMutableDictionary objectEnumerator](self->_hearstSecondPassRequests, "objectEnumerator", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v24 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "setAsset:", v6);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v19);
    }

    -[CSVoiceTriggerFirstPassHearst _reset](self, "_reset");
  }
  else
  {
    v22 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[CSVoiceTriggerFirstPassHearst _setAsset:]";
      _os_log_error_impl(&dword_1C2614000, v22, OS_LOG_TYPE_ERROR, "%s asset is nil, stop initialization", buf, 0xCu);
    }
  }

}

- (void)activationEventNotificationHandler:(id)a3 event:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  CSVoiceTriggerFirstPassHearst *v14;
  id v15;

  v7 = a4;
  v8 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__CSVoiceTriggerFirstPassHearst_activationEventNotificationHandler_event_completion___block_invoke;
  block[3] = &unk_1E7C28EC8;
  v14 = self;
  v15 = v8;
  v13 = v7;
  v10 = v8;
  v11 = v7;
  dispatch_async(queue, block);

}

- (void)CSPhoneCallStateMonitor:(id)a3 didRecievePhoneCallStateChange:(unint64_t)a4
{
  NSObject *queue;
  _QWORD v5[6];

  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __88__CSVoiceTriggerFirstPassHearst_CSPhoneCallStateMonitor_didRecievePhoneCallStateChange___block_invoke;
  v5[3] = &unk_1E7C29178;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __119__CSVoiceTriggerFirstPassHearst_siriClientBehaviorMonitor_didStartStreamWithContext_successfully_option_withEventUUID___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_handleRemoteMicVADEventWithSecondPassRequest:(id)a3
{
  id v4;
  os_log_t *v5;
  void *v6;
  NSObject *v7;
  double remoteMicVADThreshold;
  double remoteMicVADMyriadThreshold;
  float v10;
  float v11;
  void *v12;
  int v13;
  void *v14;
  os_log_t v15;
  NSObject *v16;
  float v17;
  int v18;
  const char *v19;
  __int16 v20;
  double v21;
  __int16 v22;
  double v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x1E0D18F58];
  v6 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    objc_msgSend(v4, "remoteMicVADScore");
    remoteMicVADThreshold = self->_remoteMicVADThreshold;
    remoteMicVADMyriadThreshold = self->_remoteMicVADMyriadThreshold;
    v18 = 136315906;
    v19 = "-[CSVoiceTriggerFirstPassHearst _handleRemoteMicVADEventWithSecondPassRequest:]";
    v20 = 2050;
    v21 = v10;
    v22 = 2050;
    v23 = remoteMicVADThreshold;
    v24 = 2050;
    v25 = remoteMicVADMyriadThreshold;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Handle Remote Mic VAD Event : remoteMicVADScore is %{public}f, remoteMicVADThreshold is %{public}f, remoteMicVADMyriadThreshold is %{public}f", (uint8_t *)&v18, 0x2Au);

  }
  objc_msgSend(v4, "remoteMicVADScore");
  if (v11 >= self->_remoteMicVADMyriadThreshold)
    +[CSMyriadNotifier notifyInEarMyriadTrigger](CSMyriadNotifier, "notifyInEarMyriadTrigger");
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "shouldOverwriteRemoteVADScore");

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "overwritingRemoteVADScore");
    objc_msgSend(v4, "setRemoteMicVADScore:");

    v15 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      objc_msgSend(v4, "remoteMicVADScore");
      v18 = 136315394;
      v19 = "-[CSVoiceTriggerFirstPassHearst _handleRemoteMicVADEventWithSecondPassRequest:]";
      v20 = 2050;
      v21 = v17;
      _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_DEFAULT, "%s Remote VAD Score overwritten to %{public}f", (uint8_t *)&v18, 0x16u);

    }
  }

}

- (void)_handleRemoteMicVoiceTriggerEvent:(id)a3 secondPassRequest:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  CSVoiceTriggerRTModelRequestOptions *v15;
  id v16;
  CSVoiceTriggerRTModelRequestOptions *v17;
  void *v18;
  uint64_t v19;
  CSVoiceTriggerSecondPassRequestOption *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  CSVoiceTriggerSecondPassRequestOption *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  CSVoiceTriggerSecondPassRequestOption *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  _QWORD v39[4];
  id v40;
  id v41;
  CSVoiceTriggerSecondPassRequestOption *v42;
  CSVoiceTriggerFirstPassHearst *v43;
  id v44;
  id v45;
  _QWORD v46[5];
  id v47;
  _QWORD v48[5];
  id v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v35 = a5;
  +[CSVoiceTriggerFirstPassMetrics CSVoiceTriggerFirstPassMetricsWithFirstPassInfoGeneratedTime:firstPassInfoProcessedTime:](CSVoiceTriggerFirstPassMetrics, "CSVoiceTriggerFirstPassMetricsWithFirstPassInfoGeneratedTime:firstPassInfoProcessedTime:", objc_msgSend(v7, "hosttime"), mach_absolute_time());
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0D19008];
  objc_msgSend(v7, "deviceId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contextForHearstVoiceTriggerWithDeviceId:", v10);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __96__CSVoiceTriggerFirstPassHearst__handleRemoteMicVoiceTriggerEvent_secondPassRequest_completion___block_invoke;
  v48[3] = &unk_1E7C251F0;
  v48[4] = self;
  v11 = v8;
  v49 = v11;
  -[CSVoiceTriggerFirstPassHearst _requestStartAudioStreamWitContext:secondPassRequest:startStreamOption:completion:](self, "_requestStartAudioStreamWitContext:secondPassRequest:startStreamOption:completion:", v37, v11, 0, v48);
  v12 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    objc_msgSend(v7, "deviceId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v51 = "-[CSVoiceTriggerFirstPassHearst _handleRemoteMicVoiceTriggerEvent:secondPassRequest:completion:]";
    v52 = 2112;
    v53 = v14;
    _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);

  }
  objc_msgSend(v11, "setIsSecondPassRunning:", 1);
  objc_initWeak((id *)buf, self);
  v15 = [CSVoiceTriggerRTModelRequestOptions alloc];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __96__CSVoiceTriggerFirstPassHearst__handleRemoteMicVoiceTriggerEvent_secondPassRequest_completion___block_invoke_91;
  v46[3] = &unk_1E7C24320;
  v46[4] = self;
  v16 = v7;
  v47 = v16;
  v17 = -[CSVoiceTriggerRTModelRequestOptions initWithMutableBuilder:](v15, "initWithMutableBuilder:", v46);
  objc_msgSend(v11, "secondChanceContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "shouldRunAsSecondChance");

  v20 = [CSVoiceTriggerSecondPassRequestOption alloc];
  objc_msgSend(v16, "deviceId");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "audioProvider");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "UUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activationInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[CSVoiceTriggerSecondPassRequestOption initWithFirstPassSource:deviceId:audioProviderUUID:firstPassInfo:rejectionMHUUID:isSecondChanceRun:firstpassMetrics:rtModelRequestOptions:](v20, "initWithFirstPassSource:deviceId:audioProviderUUID:firstPassInfo:rejectionMHUUID:isSecondChanceRun:firstpassMetrics:rtModelRequestOptions:", 3, v21, v23, v24, v25, v19, v36, v17);

  if (-[CSVoiceTriggerRTModelRequestOptions allowMph](v17, "allowMph"))
  {
    -[CSVoiceTriggerRTModelRequestOptions accessoryInfo](v17, "accessoryInfo");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "supportsJustSiri");

  }
  else
  {
    v28 = 0;
  }
  objc_msgSend(v11, "voiceTriggerSecondPass");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setSupportsMultiPhraseDetection:", v28);

  objc_msgSend(v11, "voiceTriggerSecondPass");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __96__CSVoiceTriggerFirstPassHearst__handleRemoteMicVoiceTriggerEvent_secondPassRequest_completion___block_invoke_99;
  v39[3] = &unk_1E7C24348;
  objc_copyWeak(&v45, (id *)buf);
  v31 = v11;
  v40 = v31;
  v32 = v16;
  v41 = v32;
  v33 = v26;
  v42 = v33;
  v34 = v35;
  v43 = self;
  v44 = v34;
  objc_msgSend(v30, "handleVoiceTriggerSecondPassFrom:completion:", v33, v39);

  objc_destroyWeak(&v45);
  objc_destroyWeak((id *)buf);

}

- (void)_handleSecondPassResult:(id)a3 secondPassRequest:(id)a4 deviceId:(id)a5 requestOption:(id)a6 error:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(id, _QWORD, id);
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  float v36;
  float v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  double remoteMicVADThreshold;
  double minimumPhraseLengthForVADGating;
  float v48;
  unsigned int (**v49)(_QWORD);
  void *v50;
  void *v51;
  int v52;
  float v53;
  void *v54;
  NSObject *v55;
  double v56;
  double v57;
  float v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  void *v66;
  double v67;
  void *v68;
  id WeakRetained;
  char v70;
  NSObject *v71;
  id v72;
  char v73;
  id v74;
  char v75;
  void *v76;
  void *v77;
  id v78;
  char v79;
  CSVoiceTriggerSecondChanceContext *v80;
  NSObject *queue;
  id v82;
  id v83;
  id v84;
  void (**v85)(id, _QWORD, id);
  void *v86;
  uint64_t v87;
  _QWORD block[4];
  id v89;
  CSVoiceTriggerFirstPassHearst *v90;
  uint64_t v91;
  _QWORD v92[4];
  NSArray *v93;
  uint64_t v94;
  uint64_t v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint8_t buf[4];
  const char *v101;
  __int16 v102;
  _BYTE v103[38];
  __int16 v104;
  uint64_t v105;
  __int16 v106;
  uint64_t v107;
  _BYTE v108[128];
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = (void (**)(id, _QWORD, id))a8;
  v20 = objc_msgSend(v14, "result");
  objc_msgSend(v14, "voiceTriggerEventInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v20;
  if (v20 == 4)
  {
    if (v19)
      v19[2](v19, 0, v18);
    goto LABEL_49;
  }
  v85 = v19;
  v22 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v23 = v22;
    objc_msgSend(v18, "localizedDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v101 = "-[CSVoiceTriggerFirstPassHearst _handleSecondPassResult:secondPassRequest:deviceId:requestOption:error:completion:]";
    v102 = 1026;
    *(_DWORD *)v103 = v87;
    *(_WORD *)&v103[4] = 2114;
    *(_QWORD *)&v103[6] = v21;
    *(_WORD *)&v103[14] = 2114;
    *(_QWORD *)&v103[16] = v16;
    *(_WORD *)&v103[24] = 2114;
    *(_QWORD *)&v103[26] = v24;
    _os_log_impl(&dword_1C2614000, v23, OS_LOG_TYPE_DEFAULT, "%s Second Pass Result, %{public}d, %{public}@, %{public}@, %{public}@", buf, 0x30u);

  }
  v25 = MEMORY[0x1E0C809B0];
  v86 = v18;
  if (v21)
  {
    v26 = *MEMORY[0x1E0D19588];
    objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0D19588]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      v83 = v17;
      v84 = v16;
      v98 = 0u;
      v99 = 0u;
      v96 = 0u;
      v97 = 0u;
      v28 = self->_phrasesToSkipBoronDecisionMaking;
      v29 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v96, v108, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v97;
        v82 = v15;
        while (2)
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v97 != v31)
              objc_enumerationMutation(v28);
            v33 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * i);
            objc_msgSend(v21, "objectForKeyedSubscript:", v26, v82);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v33) = objc_msgSend(v33, "isEqualToString:", v34);

            if ((_DWORD)v33)
            {
              v59 = (void *)*MEMORY[0x1E0D18F58];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
              {
                v60 = v59;
                objc_msgSend(v21, "objectForKeyedSubscript:", v26);
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315394;
                v101 = "-[CSVoiceTriggerFirstPassHearst _handleSecondPassResult:secondPassRequest:deviceId:requestOption:"
                       "error:completion:]";
                v102 = 2112;
                *(_QWORD *)v103 = v61;
                _os_log_impl(&dword_1C2614000, v60, OS_LOG_TYPE_DEFAULT, "%s Ignoring boron based decision making as triggered phrase %@", buf, 0x16u);

              }
              v15 = v82;
              v17 = v83;
              v16 = v84;
              goto LABEL_31;
            }
          }
          v30 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v96, v108, 16);
          v15 = v82;
          if (v30)
            continue;
          break;
        }
      }

      v17 = v83;
      v16 = v84;
      v25 = MEMORY[0x1E0C809B0];
    }
  }
  objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0D19738]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "floatValue");
  v37 = v36;

  objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0D19570]);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "doubleValue");
  v40 = v39;

  objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0D19568]);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "doubleValue");
  v43 = v42;

  v44 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v45 = v44;
    objc_msgSend(v15, "remoteMicVADScore");
    remoteMicVADThreshold = self->_remoteMicVADThreshold;
    minimumPhraseLengthForVADGating = self->_minimumPhraseLengthForVADGating;
    *(_DWORD *)buf = 136316674;
    v101 = "-[CSVoiceTriggerFirstPassHearst _handleSecondPassResult:secondPassRequest:deviceId:requestOption:error:completion:]";
    v102 = 2050;
    *(double *)v103 = v48;
    *(_WORD *)&v103[8] = 2050;
    *(double *)&v103[10] = remoteMicVADThreshold;
    *(_WORD *)&v103[18] = 2050;
    *(double *)&v103[20] = v37;
    *(_WORD *)&v103[28] = 2050;
    *(double *)&v103[30] = minimumPhraseLengthForVADGating;
    v104 = 2050;
    v105 = v43;
    v106 = 2050;
    v107 = v40;
    _os_log_impl(&dword_1C2614000, v45, OS_LOG_TYPE_DEFAULT, "%s remoteMicVADScore : %{public}f, remoteMicVADThreshold : %{public}f, triggerEndSeconds : %{public}f, minPhraseLength : %{public}f shadowMicScore: %{public}f shadowMicScoreThreshold: %{public}f", buf, 0x48u);

  }
  v92[0] = v25;
  v92[1] = 3221225472;
  v92[2] = __115__CSVoiceTriggerFirstPassHearst__handleSecondPassResult_secondPassRequest_deviceId_requestOption_error_completion___block_invoke_104;
  v92[3] = &unk_1E7C243B0;
  v94 = v40;
  v95 = v43;
  v93 = (NSArray *)&__block_literal_global_3262;
  v49 = (unsigned int (**)(_QWORD))MEMORY[0x1C3BC4734](v92);
  objc_msgSend(v17, "rtModelRequestOptions");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "accessoryInfo");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "supportsAlwaysOnAccelerometer");

  objc_msgSend(v15, "remoteMicVADScore");
  if (v52)
  {
    if (!__115__CSVoiceTriggerFirstPassHearst__handleSecondPassResult_secondPassRequest_deviceId_requestOption_error_completion___block_invoke(v53, self->_remoteMicVADThreshold))goto LABEL_27;
  }
  else if (!v49[2](v49))
  {
    goto LABEL_27;
  }
  if (v87 == 1)
  {
    v54 = (void *)*MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      v55 = v54;
      objc_msgSend(v15, "remoteMicVADScore");
      v56 = self->_remoteMicVADThreshold;
      v57 = self->_minimumPhraseLengthForVADGating;
      *(_DWORD *)buf = 136316162;
      v101 = "-[CSVoiceTriggerFirstPassHearst _handleSecondPassResult:secondPassRequest:deviceId:requestOption:error:completion:]";
      v102 = 2050;
      *(double *)v103 = v58;
      *(_WORD *)&v103[8] = 2050;
      *(double *)&v103[10] = v56;
      *(_WORD *)&v103[18] = 2050;
      *(double *)&v103[20] = v37;
      *(_WORD *)&v103[28] = 2050;
      *(double *)&v103[30] = v57;
      _os_log_impl(&dword_1C2614000, v55, OS_LOG_TYPE_DEFAULT, "%s Trigger is rejected since remoteMicVADScore is %{public}f, remoteMicVADThreshold is %{public}f, triggerEndSeconds is %{public}f, minPhraseLength is %{public}f", buf, 0x34u);

    }
    v87 = 9;
  }
LABEL_27:

  v28 = v93;
LABEL_31:

  v62 = (void *)objc_msgSend(v21, "mutableCopy");
  v63 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v15, "remoteMicVADScore");
  objc_msgSend(v63, "numberWithFloat:");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKey:", v64, *MEMORY[0x1E0D194F0]);

  *(float *)&v65 = self->_remoteMicVADThreshold;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKey:", v66, *MEMORY[0x1E0D194F8]);

  *(float *)&v67 = self->_remoteMicVADMyriadThreshold;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKey:", v68, *MEMORY[0x1E0D194E8]);

  switch(v87)
  {
    case 1:
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v70 = objc_opt_respondsToSelector();

      if ((v70 & 1) != 0)
      {
        v71 = objc_loadWeakRetained((id *)&self->_delegate);
        -[NSObject voiceTriggerDidDetectKeyword:deviceId:](v71, "voiceTriggerDidDetectKeyword:deviceId:", v62, v16);
        goto LABEL_42;
      }
      break;
    case 2:
      v72 = objc_loadWeakRetained((id *)&self->_delegate);
      v73 = objc_opt_respondsToSelector();

      if ((v73 & 1) != 0)
      {
        v71 = objc_loadWeakRetained((id *)&self->_delegate);
        -[NSObject voiceTriggerDidRejected:deviceId:](v71, "voiceTriggerDidRejected:deviceId:", v62, v16);
        goto LABEL_42;
      }
      break;
    case 3:
      v74 = objc_loadWeakRetained((id *)&self->_delegate);
      v75 = objc_opt_respondsToSelector();

      if ((v75 & 1) != 0)
      {
        v71 = objc_loadWeakRetained((id *)&self->_delegate);
        -[NSObject voiceTriggerDidDetectNearMiss:deviceId:](v71, "voiceTriggerDidDetectNearMiss:deviceId:", v62, v16);
        goto LABEL_42;
      }
      break;
    case 9:
      v78 = objc_loadWeakRetained((id *)&self->_delegate);
      v79 = objc_opt_respondsToSelector();

      if ((v79 & 1) != 0)
      {
        v71 = objc_loadWeakRetained((id *)&self->_delegate);
        -[NSObject voiceTriggerDidDetectSpeakerReject:](v71, "voiceTriggerDidDetectSpeakerReject:", v21);
        goto LABEL_42;
      }
      break;
    default:
      v76 = (void *)*MEMORY[0x1E0D18F58];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
      {
        v71 = v76;
        objc_msgSend(v86, "localizedDescription");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v101 = "-[CSVoiceTriggerFirstPassHearst _handleSecondPassResult:secondPassRequest:deviceId:requestOption:error:completion:]";
        v102 = 2114;
        *(_QWORD *)v103 = v77;
        _os_log_error_impl(&dword_1C2614000, v71, OS_LOG_TYPE_ERROR, "%s VoiceTrigger Second Pass has failed : %{public}@", buf, 0x16u);

LABEL_42:
      }
      break;
  }
  if (objc_msgSend(v14, "isSecondChanceCandidate"))
    v80 = -[CSVoiceTriggerSecondChanceContext initWithWindowStartTime:]([CSVoiceTriggerSecondChanceContext alloc], "initWithWindowStartTime:", mach_absolute_time());
  else
    v80 = 0;
  v19 = v85;
  objc_msgSend(v15, "setSecondChanceContext:", v80);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __115__CSVoiceTriggerFirstPassHearst__handleSecondPassResult_secondPassRequest_deviceId_requestOption_error_completion___block_invoke_115;
  block[3] = &unk_1E7C28B58;
  v90 = self;
  v91 = v87;
  v89 = v15;
  dispatch_async(queue, block);
  if (v85)
    v85[2](v85, 1, 0);

  v18 = v86;
LABEL_49:

}

- (void)_requestStartAudioStreamWitContext:(id)a3 secondPassRequest:(id)a4 startStreamOption:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  CSSpeechManager *speechManager;
  void *v15;
  id v16;
  id v17;
  objc_class *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a6;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __115__CSVoiceTriggerFirstPassHearst__requestStartAudioStreamWitContext_secondPassRequest_startStreamOption_completion___block_invoke;
  v30[3] = &unk_1E7C290D8;
  v11 = v10;
  v31 = v11;
  v12 = a3;
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3BC4734](v30);
  speechManager = self->_speechManager;
  v29 = 0;
  -[CSSpeechManager audioProviderWithContext:error:](speechManager, "audioProviderWithContext:error:", v12, &v29);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v29;
  if (v15)
  {
    objc_msgSend(v9, "setAudioProvider:", v15);
    v17 = objc_alloc_init(MEMORY[0x1E0D19058]);
    objc_msgSend(v17, "setRequiresHistoricalBuffer:", 1);
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v15, "audioStreamWithRequest:streamName:error:", v17, v19, &v28);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v28;

    if (!v20)
    {
      v22 = (void *)*MEMORY[0x1E0D18F58];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
      {
        v26 = v22;
        objc_msgSend(v21, "localizedDescription");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v33 = "-[CSVoiceTriggerFirstPassHearst _requestStartAudioStreamWitContext:secondPassRequest:startStreamOption:completion:]";
        v34 = 2114;
        v35 = v27;
        _os_log_error_impl(&dword_1C2614000, v26, OS_LOG_TYPE_ERROR, "%s Failed to get audio stream : %{public}@", buf, 0x16u);

      }
    }
    ((void (**)(_QWORD, BOOL, id))v13)[2](v13, v20 != 0, v21);

  }
  else
  {
    v23 = (void *)*MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
    {
      v24 = v23;
      objc_msgSend(v16, "localizedDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v33 = "-[CSVoiceTriggerFirstPassHearst _requestStartAudioStreamWitContext:secondPassRequest:startStreamOption:completion:]";
      v34 = 2114;
      v35 = v25;
      _os_log_error_impl(&dword_1C2614000, v24, OS_LOG_TYPE_ERROR, "%s Getting audio stream provider has failed : %{public}@", buf, 0x16u);

    }
    ((void (**)(_QWORD, _QWORD, id))v13)[2](v13, 0, v16);
  }

}

- (void)_cancelAllAudioStreamHoldings
{
  void *v3;
  CSAudioStreamHolding *triggeredAudioStreamHolding;
  CSAudioProvider *triggeredAudioProvider;
  void *v6;
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
  if (self->_triggeredAudioStreamHolding)
  {
    -[CSVoiceTriggerFirstPassHearst triggeredAudioProvider](self, "triggeredAudioProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelAudioStreamHold:", self->_triggeredAudioStreamHolding);

    triggeredAudioStreamHolding = self->_triggeredAudioStreamHolding;
    self->_triggeredAudioStreamHolding = 0;

    triggeredAudioProvider = self->_triggeredAudioProvider;
    self->_triggeredAudioProvider = 0;

  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_hearstSecondPassRequests, "objectEnumerator", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "cancelAudioStreamHold");
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (CSVoiceTriggerDelegate)delegate
{
  return (CSVoiceTriggerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableDictionary)hearstSecondPassRequests
{
  return self->_hearstSecondPassRequests;
}

- (void)setHearstSecondPassRequests:(id)a3
{
  objc_storeStrong((id *)&self->_hearstSecondPassRequests, a3);
}

- (CSAsset)currentAsset
{
  return self->_currentAsset;
}

- (void)setCurrentAsset:(id)a3
{
  objc_storeStrong((id *)&self->_currentAsset, a3);
}

- (CSVoiceTriggerAirPodWearerDetectionConfig)airpodWearerConfig
{
  return self->_airpodWearerConfig;
}

- (void)setAirpodWearerConfig:(id)a3
{
  objc_storeStrong((id *)&self->_airpodWearerConfig, a3);
}

- (float)remoteMicVADThreshold
{
  return self->_remoteMicVADThreshold;
}

- (void)setRemoteMicVADThreshold:(float)a3
{
  self->_remoteMicVADThreshold = a3;
}

- (float)remoteMicVADMyriadThreshold
{
  return self->_remoteMicVADMyriadThreshold;
}

- (void)setRemoteMicVADMyriadThreshold:(float)a3
{
  self->_remoteMicVADMyriadThreshold = a3;
}

- (float)minimumPhraseLengthForVADGating
{
  return self->_minimumPhraseLengthForVADGating;
}

- (void)setMinimumPhraseLengthForVADGating:(float)a3
{
  self->_minimumPhraseLengthForVADGating = a3;
}

- (NSArray)phrasesToSkipBoronDecisionMaking
{
  return self->_phrasesToSkipBoronDecisionMaking;
}

- (void)setPhrasesToSkipBoronDecisionMaking:(id)a3
{
  objc_storeStrong((id *)&self->_phrasesToSkipBoronDecisionMaking, a3);
}

- (CSAudioStreamHolding)triggeredAudioStreamHolding
{
  return self->_triggeredAudioStreamHolding;
}

- (void)setTriggeredAudioStreamHolding:(id)a3
{
  objc_storeStrong((id *)&self->_triggeredAudioStreamHolding, a3);
}

- (CSAudioProvider)triggeredAudioProvider
{
  return self->_triggeredAudioProvider;
}

- (void)setTriggeredAudioProvider:(id)a3
{
  objc_storeStrong((id *)&self->_triggeredAudioProvider, a3);
}

- (CSSpeechManager)speechManager
{
  return self->_speechManager;
}

- (void)setSpeechManager:(id)a3
{
  objc_storeStrong((id *)&self->_speechManager, a3);
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

- (CSOtherAppRecordingStateMonitor)otherAppRecordingStateMonitor
{
  return self->_otherAppRecordingStateMonitor;
}

- (void)setOtherAppRecordingStateMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_otherAppRecordingStateMonitor, a3);
}

- (CSSiriClientBehaviorMonitor)siriClientBehaviorMonitor
{
  return self->_siriClientBehaviorMonitor;
}

- (void)setSiriClientBehaviorMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_siriClientBehaviorMonitor, a3);
}

- (CSVoiceTriggerEnabledMonitor)voiceTriggerEnabledMonitor
{
  return self->_voiceTriggerEnabledMonitor;
}

- (void)setVoiceTriggerEnabledMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_voiceTriggerEnabledMonitor, a3);
}

- (CSVoiceTriggerUserSelectedPhrase)multiPhraseEnabledStatus
{
  return self->_multiPhraseEnabledStatus;
}

- (void)setMultiPhraseEnabledStatus:(id)a3
{
  objc_storeStrong((id *)&self->_multiPhraseEnabledStatus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiPhraseEnabledStatus, 0);
  objc_storeStrong((id *)&self->_voiceTriggerEnabledMonitor, 0);
  objc_storeStrong((id *)&self->_siriClientBehaviorMonitor, 0);
  objc_storeStrong((id *)&self->_otherAppRecordingStateMonitor, 0);
  objc_storeStrong((id *)&self->_phoneCallStateMonitor, 0);
  objc_storeStrong((id *)&self->_speechManager, 0);
  objc_storeStrong((id *)&self->_triggeredAudioProvider, 0);
  objc_storeStrong((id *)&self->_triggeredAudioStreamHolding, 0);
  objc_storeStrong((id *)&self->_phrasesToSkipBoronDecisionMaking, 0);
  objc_storeStrong((id *)&self->_airpodWearerConfig, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_hearstSecondPassRequests, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __115__CSVoiceTriggerFirstPassHearst__requestStartAudioStreamWitContext_secondPassRequest_startStreamOption_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __115__CSVoiceTriggerFirstPassHearst__handleSecondPassResult_secondPassRequest_deviceId_requestOption_error_completion___block_invoke_104(uint64_t a1, float a2, float a3, float a4, float a5)
{
  NSObject *v10;
  double v11;
  uint64_t result;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315138;
    v14 = "-[CSVoiceTriggerFirstPassHearst _handleSecondPassResult:secondPassRequest:deviceId:requestOption:error:complet"
          "ion:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s gateWithRemoteMicVadAndShadowMicBlk", (uint8_t *)&v13, 0xCu);
  }
  v11 = *(double *)(a1 + 40);
  if (v11 >= 0.0)
  {
    if (*(double *)(a1 + 48) >= v11)
      return (*(uint64_t (**)(float, float))(*(_QWORD *)(a1 + 32) + 16))(a2, a3);
    else
      return 0;
  }
  else
  {
    LODWORD(result) = (*(uint64_t (**)(float, float))(*(_QWORD *)(a1 + 32) + 16))(a2, a3);
    if (a4 >= a5)
      return result;
    else
      return 0;
  }
}

BOOL __115__CSVoiceTriggerFirstPassHearst__handleSecondPassResult_secondPassRequest_deviceId_requestOption_error_completion___block_invoke(float a1, float a2)
{
  NSObject *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[CSVoiceTriggerFirstPassHearst _handleSecondPassResult:secondPassRequest:deviceId:requestOption:error:completi"
         "on:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s gateWithRemoteMicVadOnlyBlk", (uint8_t *)&v6, 0xCu);
  }
  return a1 < a2 && a1 >= 0.0;
}

void __115__CSVoiceTriggerFirstPassHearst__handleSecondPassResult_secondPassRequest_deviceId_requestOption_error_completion___block_invoke_115(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "setIsSecondPassRunning:", 0);
  objc_msgSend(*(id *)(a1 + 32), "reset");
  v2 = *(void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 48) == 1)
  {
    objc_msgSend(v2, "audioStreamHolding");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(v4 + 72);
    *(_QWORD *)(v4 + 72) = v3;

    objc_msgSend(*(id *)(a1 + 32), "audioProvider");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(void **)(v7 + 80);
    *(_QWORD *)(v7 + 80) = v6;

  }
  else
  {
    objc_msgSend(v2, "cancelAudioStreamHold");
  }
}

void __96__CSVoiceTriggerFirstPassHearst__handleRemoteMicVoiceTriggerEvent_secondPassRequest_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD block[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = *(void **)(a1 + 40);
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __96__CSVoiceTriggerFirstPassHearst__handleRemoteMicVoiceTriggerEvent_secondPassRequest_completion___block_invoke_2;
    block[3] = &unk_1E7C292C8;
    v12 = v6;
    dispatch_async(v7, block);

  }
  else
  {
    v8 = (void *)*MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
    {
      v9 = v8;
      objc_msgSend(v5, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v14 = "-[CSVoiceTriggerFirstPassHearst _handleRemoteMicVoiceTriggerEvent:secondPassRequest:completion:]_block_invoke";
      v15 = 2114;
      v16 = v10;
      _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s Failed to start audio stream error : %{public}@", buf, 0x16u);

    }
  }

}

void __96__CSVoiceTriggerFirstPassHearst__handleRemoteMicVoiceTriggerEvent_secondPassRequest_completion___block_invoke_91(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  CSCoreSpeechServicesAccessoryInfo *v16;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "multiPhraseEnabledStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowMph:", objc_msgSend(v5, "multiPhraseSelected"));

  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "multiPhraseEnabledStatus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "userSelectedPhraseType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserSelectedPhraseType:", v8);

  v9 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(*(id *)(a1 + 40), "deviceId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithUUIDString:", v10);
  objc_msgSend(v4, "setEndpointId:", v11);

  objc_msgSend(v4, "setAccessoryModelType:", &unk_1E7C63740);
  objc_msgSend(MEMORY[0x1E0D19078], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "deviceId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "getBluetoothDeviceInfoForDeviceWithId:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "supportMph");

  v16 = objc_alloc_init(CSCoreSpeechServicesAccessoryInfo);
  -[CSCoreSpeechServicesAccessoryInfo setSupportsJustSiri:](v16, "setSupportsJustSiri:", v15);
  -[CSCoreSpeechServicesAccessoryInfo setSupportsAlwaysOnAccelerometer:](v16, "setSupportsAlwaysOnAccelerometer:", v15);
  objc_msgSend(v4, "setCSCoreSpeechServicesAccessoryInfo:", v16);

}

void __96__CSVoiceTriggerFirstPassHearst__handleRemoteMicVoiceTriggerEvent_secondPassRequest_completion___block_invoke_99(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;

  v5 = (id *)(a1 + 72);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  v9 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "deviceId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_handleSecondPassResult:secondPassRequest:deviceId:requestOption:error:completion:", v7, v9, v10, *(_QWORD *)(a1 + 48), v6, *(_QWORD *)(a1 + 64));

  objc_msgSend(MEMORY[0x1E0D192A8], "sharedAggregator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "result");
  objc_msgSend(v7, "voiceTriggerEventInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "logSecondPassResult:eventInfo:triggerAPWakeUp:", v12, v13, 0);
  v14 = *(NSObject **)(*(_QWORD *)(a1 + 56) + 32);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __96__CSVoiceTriggerFirstPassHearst__handleRemoteMicVoiceTriggerEvent_secondPassRequest_completion___block_invoke_2_101;
  v17[3] = &unk_1E7C292A0;
  v15 = *(id *)(a1 + 40);
  v16 = *(_QWORD *)(a1 + 56);
  v18 = v15;
  v19 = v16;
  dispatch_async(v14, v17);

}

void __96__CSVoiceTriggerFirstPassHearst__handleRemoteMicVoiceTriggerEvent_secondPassRequest_completion___block_invoke_2_101(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "deviceId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "-[CSVoiceTriggerFirstPassHearst _handleRemoteMicVoiceTriggerEvent:secondPassRequest:completion:]_block_invoke_2";
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Teardown hearst second pass request for device id : %{public}@", (uint8_t *)&v9, 0x16u);

  }
  v6 = *(void **)(a1 + 32);
  v7 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
  objc_msgSend(v6, "deviceId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v8);

}

uint64_t __96__CSVoiceTriggerFirstPassHearst__handleRemoteMicVoiceTriggerEvent_secondPassRequest_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSVoiceTriggerFirstPassHearst _handleRemoteMicVoiceTriggerEvent:secondPassRequest:completion:]_block_invoke_2";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Audio stream started", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "holdAudioStreamWithTimeout:", 5.0);
}

uint64_t __119__CSVoiceTriggerFirstPassHearst_siriClientBehaviorMonitor_didStartStreamWithContext_successfully_option_withEventUUID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSVoiceTriggerFirstPassHearst siriClientBehaviorMonitor:didStartStreamWithContext:successfully:option:withEve"
         "ntUUID:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Siri Client start listening now, CSVoiceTriggerFirstPassHearst can stop listening now", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_cancelAllAudioStreamHoldings");
}

uint64_t __88__CSVoiceTriggerFirstPassHearst_CSPhoneCallStateMonitor_didRecievePhoneCallStateChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPhoneCallState:", *(_QWORD *)(a1 + 40));
}

void __85__CSVoiceTriggerFirstPassHearst_activationEventNotificationHandler_event_completion___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  os_log_t *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  double v16;
  float v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _BOOL4 v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  CSHearstSecondPassRequest *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  CSHearstSecondPassRequest *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  uint8_t buf[4];
  const char *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  double v71;
  __int16 v72;
  double v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "type") == 2)
  {
    objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "voiceTriggerEnabled");

    if (v3)
    {
      if (!CSIsWatch()
        || (objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            v5 = objc_msgSend(v4, "phraseSpotterEnabled"),
            v4,
            (v5 & 1) != 0))
      {
        v6 = *(_QWORD *)(a1 + 40);
        v7 = *(_QWORD *)(v6 + 104);
        if (v7 == 2)
        {
          if (!objc_msgSend(MEMORY[0x1E0D19260], "supportRingtoneA2DP"))
          {
            v32 = *MEMORY[0x1E0D18F60];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
            {
              v33 = *(void **)(a1 + 32);
              *(_DWORD *)buf = 136315394;
              v67 = "-[CSVoiceTriggerFirstPassHearst activationEventNotificationHandler:event:completion:]_block_invoke";
              v68 = 2114;
              v69 = v33;
              _os_log_impl(&dword_1C2614000, v32, OS_LOG_TYPE_DEFAULT, "%s Ignore %{public}@ since Siri client is currently in a ringtone and does not support A2DP", buf, 0x16u);
            }
            v10 = 606;
            goto LABEL_43;
          }
          v6 = *(_QWORD *)(a1 + 40);
          v7 = *(_QWORD *)(v6 + 104);
        }
        if (v7 == 4)
        {
          v30 = *MEMORY[0x1E0D18F60];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
          {
            v31 = *(void **)(a1 + 32);
            *(_DWORD *)buf = 136315394;
            v67 = "-[CSVoiceTriggerFirstPassHearst activationEventNotificationHandler:event:completion:]_block_invoke";
            v68 = 2114;
            v69 = v31;
            _os_log_impl(&dword_1C2614000, v30, OS_LOG_TYPE_DEFAULT, "%s Ignore %{public}@ since Siri client is currently in an outgoing call", buf, 0x16u);
          }
          v10 = 608;
          goto LABEL_43;
        }
        if (v7 == 3)
        {
          v8 = *MEMORY[0x1E0D18F60];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
          {
            v9 = *(void **)(a1 + 32);
            *(_DWORD *)buf = 136315394;
            v67 = "-[CSVoiceTriggerFirstPassHearst activationEventNotificationHandler:event:completion:]_block_invoke";
            v68 = 2114;
            v69 = v9;
            _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Ignore %{public}@ since Siri client is currently in a connected call", buf, 0x16u);
          }
          v10 = 607;
        }
        else if (objc_msgSend(*(id *)(v6 + 112), "isOtherNonEligibleAppRecording"))
        {
          v34 = *MEMORY[0x1E0D18F60];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
          {
            v35 = *(void **)(a1 + 32);
            *(_DWORD *)buf = 136315394;
            v67 = "-[CSVoiceTriggerFirstPassHearst activationEventNotificationHandler:event:completion:]_block_invoke";
            v68 = 2114;
            v69 = v35;
            _os_log_impl(&dword_1C2614000, v34, OS_LOG_TYPE_DEFAULT, "%s Ignore %{public}@ since there is an other non eligible app recording", buf, 0x16u);
          }
          v10 = 609;
        }
        else
        {
          if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 120), "isStreaming"))
          {
            objc_msgSend(MEMORY[0x1E0D19208], "sharedInstance");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v40, "isRestricted") & 1) != 0)
            {
              objc_msgSend(MEMORY[0x1E0D191E8], "sharedInstance");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = objc_msgSend(v41, "isScreenLocked");

              if (v42)
              {
                v43 = (void *)*MEMORY[0x1E0D18F60];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
                {
                  v44 = *(void **)(a1 + 32);
                  v45 = v43;
                  objc_msgSend(v44, "localizedDescription");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 136315394;
                  v67 = "-[CSVoiceTriggerFirstPassHearst activationEventNotificationHandler:event:completion:]_block_invoke";
                  v68 = 2114;
                  v69 = v46;
                  _os_log_impl(&dword_1C2614000, v45, OS_LOG_TYPE_DEFAULT, "%s Ignore %{public}@ since screen is locked and Siri is restricted on lock screen", buf, 0x16u);

                }
                v10 = 612;
                goto LABEL_43;
              }
            }
            else
            {

            }
            v47 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
            objc_msgSend(*(id *)(a1 + 32), "deviceId");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "objectForKey:", v48);
            v49 = (void *)objc_claimAutoreleasedReturnValue();

            v50 = (void *)*MEMORY[0x1E0D18F58];
            v51 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT);
            if (v49)
            {
              if (v51)
              {
                v52 = *(void **)(a1 + 32);
                v53 = v50;
                objc_msgSend(v52, "deviceId");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315394;
                v67 = "-[CSVoiceTriggerFirstPassHearst activationEventNotificationHandler:event:completion:]_block_invoke";
                v68 = 2114;
                v69 = v54;
                _os_log_impl(&dword_1C2614000, v53, OS_LOG_TYPE_DEFAULT, "%s We already have matched hearst second pass request : %{public}@", buf, 0x16u);

              }
              v55 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
              objc_msgSend(*(id *)(a1 + 32), "deviceId");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "objectForKey:", v56);
              v57 = (CSHearstSecondPassRequest *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              if (v51)
              {
                v58 = *(void **)(a1 + 32);
                v59 = v50;
                objc_msgSend(v58, "deviceId");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315394;
                v67 = "-[CSVoiceTriggerFirstPassHearst activationEventNotificationHandler:event:completion:]_block_invoke";
                v68 = 2114;
                v69 = v60;
                _os_log_impl(&dword_1C2614000, v59, OS_LOG_TYPE_DEFAULT, "%s There is no matched hearst second pass request, creating new one : %{public}@", buf, 0x16u);

              }
              v61 = [CSHearstSecondPassRequest alloc];
              objc_msgSend(*(id *)(a1 + 32), "deviceId");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              v57 = -[CSHearstSecondPassRequest initWithDeviceID:speechManager:](v61, "initWithDeviceID:speechManager:", v62, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88));

              v63 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
              objc_msgSend(*(id *)(a1 + 32), "deviceId");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "setObject:forKey:", v57, v64);

              -[CSHearstSecondPassRequest setAsset:](v57, "setAsset:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48));
              -[CSHearstSecondPassRequest start](v57, "start");
            }
            objc_msgSend(*(id *)(a1 + 40), "_handleRemoteMicVoiceTriggerEvent:secondPassRequest:completion:", *(_QWORD *)(a1 + 32), v57, *(_QWORD *)(a1 + 48));

            v26 = 0;
            goto LABEL_45;
          }
          v36 = *MEMORY[0x1E0D18F60];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
          {
            v37 = *(void **)(a1 + 32);
            *(_DWORD *)buf = 136315394;
            v67 = "-[CSVoiceTriggerFirstPassHearst activationEventNotificationHandler:event:completion:]_block_invoke";
            v68 = 2114;
            v69 = v37;
            _os_log_impl(&dword_1C2614000, v36, OS_LOG_TYPE_DEFAULT, "%s Ignore %{public}@ since Siri client is current listening", buf, 0x16u);
          }
          v10 = 603;
        }
LABEL_43:
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], v10, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = *(_QWORD *)(a1 + 48);
        if (v38)
          (*(void (**)(uint64_t, _QWORD, void *))(v38 + 16))(v38, 0, v26);
        goto LABEL_45;
      }
    }
    v24 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v39 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v67 = "-[CSVoiceTriggerFirstPassHearst activationEventNotificationHandler:event:completion:]_block_invoke";
      v68 = 2114;
      v69 = v39;
      _os_log_error_impl(&dword_1C2614000, v24, OS_LOG_TYPE_ERROR, "%s Ignore %{public}@ since VoiceTrigger was turned off", buf, 0x16u);
    }
    v25 = *(_QWORD *)(a1 + 48);
    if (v25)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 604, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v25 + 16))(v25, 0, v26);
LABEL_45:

    }
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "type") == 3)
  {
    v11 = (os_log_t *)MEMORY[0x1E0D18F58];
    v12 = (void *)*MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(void **)(a1 + 32);
      v14 = v12;
      objc_msgSend(v13, "deviceId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "vadScore");
      v16 = *(float *)(*(_QWORD *)(a1 + 40) + 8);
      *(_DWORD *)buf = 136315906;
      v67 = "-[CSVoiceTriggerFirstPassHearst activationEventNotificationHandler:event:completion:]_block_invoke";
      v68 = 2114;
      v69 = v15;
      v70 = 2050;
      v71 = v17;
      v72 = 2050;
      v73 = v16;
      _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_DEFAULT, "%s deviceID = %{public}@, RemoteMicVADScore = %{public}f, Threshold = %{public}f", buf, 0x2Au);

    }
    v18 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
    objc_msgSend(*(id *)(a1 + 32), "deviceId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20
      && (v21 = *(void **)(*(_QWORD *)(a1 + 40) + 40),
          objc_msgSend(*(id *)(a1 + 32), "deviceId"),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v21, "objectForKey:", v22),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          v22,
          v23))
    {
      objc_msgSend(*(id *)(a1 + 32), "vadScore");
      objc_msgSend(v23, "setRemoteMicVADScore:");
      objc_msgSend(*(id *)(a1 + 40), "_handleRemoteMicVADEventWithSecondPassRequest:", v23);

    }
    else
    {
      v28 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v67 = "-[CSVoiceTriggerFirstPassHearst activationEventNotificationHandler:event:completion:]_block_invoke";
        _os_log_impl(&dword_1C2614000, v28, OS_LOG_TYPE_DEFAULT, "%s RemoteMicVAD event will be ignored since firstPassSource:Hearst, device id does not match", buf, 0xCu);
      }
    }
    v29 = *(_QWORD *)(a1 + 48);
    if (v29)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v29 + 16))(v29, 1, 0);
  }
  else
  {
    v27 = *(_QWORD *)(a1 + 48);
    if (v27)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 114, 0);
      v65 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD))(v27 + 16))(v27, 0);

    }
  }
}

uint64_t __42__CSVoiceTriggerFirstPassHearst_setAsset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setAsset:", *(_QWORD *)(a1 + 40));
}

uint64_t __38__CSVoiceTriggerFirstPassHearst_reset__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reset");
}

uint64_t __38__CSVoiceTriggerFirstPassHearst_start__block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSVoiceTriggerFirstPassHearst start]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "registerObserver:");
}

uint64_t __160__CSVoiceTriggerFirstPassHearst_initWithSpeechManager_voiceTriggerEnabledMonitor_siriClientBehaviorMonitor_phoneCallStateMonitor_otherAppRecordingStateMonitor___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "phoneCallState");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) = result;
  return result;
}

@end
