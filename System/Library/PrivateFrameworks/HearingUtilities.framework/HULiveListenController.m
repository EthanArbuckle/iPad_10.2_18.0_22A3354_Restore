@implementation HULiveListenController

- (HULiveListenController)init
{
  HULiveListenController *v2;
  void *v3;
  uint64_t *v4;
  void *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *audioUnitsQueue;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v16;
  uint64_t v17;
  void *v18;
  HULiveListenController *v19;
  void *v20;
  _QWORD v22[4];
  HULiveListenController *v23;
  _QWORD v24[4];
  id v25;
  id location;
  objc_super v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)HULiveListenController;
  v2 = -[HULiveListenController init](&v27, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (uint64_t *)MEMORY[0x1E0D47E48];
    v28[0] = *MEMORY[0x1E0D47E48];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAttribute:forKey:error:", v5, *MEMORY[0x1E0D48280], 0);

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("ha_livelisten_audiounits_queue", v6);
    audioUnitsQueue = v2->_audioUnitsQueue;
    v2->_audioUnitsQueue = (OS_dispatch_queue *)v7;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel_audioSessionWasInterrupted_, *MEMORY[0x1E0C896F0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, sel_mediaServicesWereReset_, *MEMORY[0x1E0C89738], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, sel_audioRouteDidChange_, *MEMORY[0x1E0C89870], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *v4;
    objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v2, sel_audioRouteDidChange_, v13, v14);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)userChangedAudioRoute, CFSTR("AXSpringBoardUserChangedAudioRouteNotification"), 0, (CFNotificationSuspensionBehavior)0);
    objc_initWeak(&location, v2);
    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __30__HULiveListenController_init__block_invoke;
    v24[3] = &unk_1EA8E81D0;
    objc_copyWeak(&v25, &location);
    objc_msgSend(v16, "registerUpdateBlock:forRetrieveSelector:withListener:", v24, sel_exportsLiveListenToFile, v2);

    +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v17;
    v22[1] = 3221225472;
    v22[2] = __30__HULiveListenController_init__block_invoke_2;
    v22[3] = &unk_1EA8E8220;
    v19 = v2;
    v23 = v19;
    objc_msgSend(v18, "registerUpdateBlock:forRetrieveSelector:withListener:", v22, sel_comfortSoundsEnabled, v19);

    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULiveListenController setExportsLiveListenToFile:](v19, "setExportsLiveListenToFile:", objc_msgSend(v20, "exportsLiveListenToFile"));

    v19->_noise = -100.0;
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __30__HULiveListenController_init__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  id v4;

  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v4, "exportsLiveListenToFile");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setExportsLiveListenToFile:", v2);

}

void __30__HULiveListenController_init__block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "comfortSoundsEnabled");

  if (v3)
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Background Sounds enabled. Stopping."));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HULiveListenController init]_block_invoke_2", 129, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_retainAutorelease(v5);
      v8 = v6;
      *(_DWORD *)buf = 136446210;
      v10 = objc_msgSend(v7, "UTF8String");
      _os_log_impl(&dword_1DE311000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "stopListeningWithCompletion:", 0);
  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HULiveListenController;
  -[HULiveListenController dealloc](&v4, sel_dealloc);
}

- (void)mediaServicesWereReset:(id)a3
{
  AXPerformBlockOnMainThread();
}

uint64_t __49__HULiveListenController_mediaServicesWereReset___block_invoke(uint64_t a1)
{
  unsigned int v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t result;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "isListening");
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Media reset, wasListening = %d"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HULiveListenController mediaServicesWereReset:]_block_invoke", 170, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v4);
    v7 = v5;
    *(_DWORD *)buf = 136446210;
    v10 = objc_msgSend(v6, "UTF8String");
    _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  result = objc_msgSend(*(id *)(a1 + 32), "stopListeningWithCompletion:", 0);
  if (v2)
    return objc_msgSend(*(id *)(a1 + 32), "startListeningWithCompletion:", 0);
  return result;
}

- (void)audioSessionWasInterrupted:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AXPerformBlockOnMainThread();

}

void __53__HULiveListenController_audioSessionWasInterrupted___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", *MEMORY[0x1E0C89718]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  if (v4 == 1)
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Session reset. Stopping"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HULiveListenController audioSessionWasInterrupted:]_block_invoke", 185, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_retainAutorelease(v6);
      v9 = v7;
      *(_DWORD *)buf = 136446210;
      v11 = objc_msgSend(v8, "UTF8String");
      _os_log_impl(&dword_1DE311000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 40), "stopListeningWithCompletion:", 0);
  }
}

- (void)audioRouteDidChange:(id)a3
{
  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __46__HULiveListenController_audioRouteDidChange___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  result = hearingAidStreamSelected();
  if ((result & 1) == 0)
  {
    result = liveListenStreamSelected();
    if ((result & 1) == 0)
    {
      HAInitializeLogging();
      v3 = (void *)MEMORY[0x1E0CB3940];
      v4 = hearingAidStreamSelected();
      objc_msgSend(v3, "stringWithFormat:", CFSTR("Route changed. Stopping %d, %d"), v4, liveListenStreamSelected());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HULiveListenController audioRouteDidChange:]_block_invoke", 196, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)*MEMORY[0x1E0D2F928];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
      {
        v8 = objc_retainAutorelease(v6);
        v9 = v7;
        *(_DWORD *)buf = 136446210;
        v11 = objc_msgSend(v8, "UTF8String");
        _os_log_impl(&dword_1DE311000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      return objc_msgSend(*(id *)(a1 + 32), "stopListeningWithCompletion:", 0);
    }
  }
  return result;
}

- (float)audioLevel
{
  _BOOL4 v3;
  float result;
  double v5;
  float *p_signal;
  float *p_noise;
  float noise;
  AudioUnitParameterValue v9;
  AudioUnitParameterValue outValue;

  v3 = -[HULiveListenController isListening](self, "isListening");
  result = 0.0;
  if (v3)
  {
    outValue = 0.0;
    AudioUnitGetParameter(self->_mixerUnit, 0x3E8u, 1u, 0, &outValue);
    v5 = __exp10(outValue * 0.05) * 50.0;
    v9 = 0.0;
    AudioUnitGetParameter(self->_mixerUnit, 0xFA0u, 1u, 0, &v9);
    p_signal = &self->_signal;
    if (v9 >= self->_signal)
    {
      noise = self->_noise;
      p_noise = &self->_noise;
      if (v9 <= noise)
        return v5;
      p_signal = p_noise;
    }
    *p_signal = v9;
    return v5;
  }
  return result;
}

- (OpaqueExtAudioFile)debugAudioFile
{
  return self->_debugAudioFile;
}

- (void)startListeningWithCompletion:(id)a3
{
  id v4;
  NSObject *audioUnitsQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  audioUnitsQueue = self->_audioUnitsQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__HULiveListenController_startListeningWithCompletion___block_invoke;
  v7[3] = &unk_1EA8E86E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(audioUnitsQueue, v7);

}

void __55__HULiveListenController_startListeningWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  unsigned __int8 v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  unsigned int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  OSStatus v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  AudioStreamBasicDescription inStreamDesc;
  AudioStreamBasicDescription buf;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearAudioRoutes");

  v3 = hearingAidStreamAvailable();
  if ((liveListenStreamSelected() & 1) == 0 && (v3 & 1) == 0)
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LiveListen not streamable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HULiveListenController startListeningWithCompletion:]_block_invoke", 242, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_retainAutorelease(v5);
      v8 = v6;
      LODWORD(buf.mSampleRate) = 136446210;
      *(_QWORD *)((char *)&buf.mSampleRate + 4) = objc_msgSend(v7, "UTF8String");
      _os_log_impl(&dword_1DE311000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);

    }
    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v9 + 16))(v9, 0, 0);
    return;
  }
  +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "comfortSoundsEnabled");

  if (v11)
  {
    CSInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Disabling to start Live Listen"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HULiveListenController startListeningWithCompletion:]_block_invoke", 251, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)*MEMORY[0x1E0D2F918];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_retainAutorelease(v13);
      v16 = v14;
      LODWORD(buf.mSampleRate) = 136446210;
      *(_QWORD *)((char *)&buf.mSampleRate + 4) = objc_msgSend(v15, "UTF8String");
      _os_log_impl(&dword_1DE311000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);

    }
    +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setComfortSoundsEnabled:", 0);

    +[HUComfortSoundsController sharedController](HUComfortSoundsController, "sharedController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stop");

  }
  objc_msgSend(*(id *)(a1 + 32), "_setupSession");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    goto LABEL_12;
  objc_msgSend(*(id *)(a1 + 32), "session");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "sampleRate");
  v31 = v30;

  if ((v3 & (v31 > 0.0)) == 0)
    v31 = 16000.0;
  objc_msgSend(*(id *)(a1 + 32), "session");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "inputNumberOfChannels");

  if (v33 - 3 >= 0xFFFFFFFE)
    v34 = v33;
  else
    v34 = 2;
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LiveListen: starting - sampleRate = %.f, numberOfChannels = %d, isInitialized = %d"), *(_QWORD *)&v31, v34, objc_msgSend(*(id *)(a1 + 32), "didInitializeAudioUnit"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HULiveListenController startListeningWithCompletion:]_block_invoke", 291, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v38 = objc_retainAutorelease(v36);
    v39 = v37;
    v40 = objc_msgSend(v38, "UTF8String");
    LODWORD(buf.mSampleRate) = 136446210;
    *(_QWORD *)((char *)&buf.mSampleRate + 4) = v40;
    _os_log_impl(&dword_1DE311000, v39, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "didInitializeAudioUnit") & 1) != 0)
  {
LABEL_33:
    v54 = AudioOutputUnitStart(*(AudioUnit *)(*(_QWORD *)(a1 + 32) + 48));
    if (v54)
    {
      v55 = (void *)MEMORY[0x1E0CB35C8];
      v56 = v54;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Couldn't start remote i/o unit"), *MEMORY[0x1E0CB2D50]);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "errorWithDomain:code:userInfo:", CFSTR("com.apple.axlivelisten.audio"), v56, v57);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "setIsListening:", v19 == 0);
      if (v19)
        goto LABEL_13;
    }
    else
    {
      +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "currentPickableAudioRoutes");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "valueForKey:", CFSTR("AXSHARouteHearingAid"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      if (v60)
      {
        objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "setAttribute:forKey:error:", v60, *MEMORY[0x1E0D48050], 0);

      }
      objc_msgSend(*(id *)(a1 + 32), "setIsListening:", 1);
    }
    +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "addHearingFeatureUsage:", 8);

    v19 = 0;
    v20 = 1;
    goto LABEL_14;
  }
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89AA8]), "initStandardFormatWithSampleRate:channels:", v34, v31);
  v42 = objc_msgSend(v41, "streamDescription");
  v43 = *(_QWORD *)(v42 + 32);
  v44 = *(_OWORD *)(v42 + 16);
  *(_OWORD *)&buf.mSampleRate = *(_OWORD *)v42;
  *(_OWORD *)&buf.mBytesPerPacket = v44;
  *(_QWORD *)&buf.mBitsPerChannel = v43;
  if (objc_msgSend(*(id *)(a1 + 32), "exportsLiveListenToFile"))
  {
    v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89AA8]), "initWithCommonFormat:sampleRate:channels:interleaved:", 3, v34, 1, v31);
    v46 = objc_msgSend(v45, "streamDescription");
    v47 = *(_QWORD *)(v46 + 32);
    v48 = *(_OWORD *)(v46 + 16);
    *(_OWORD *)&inStreamDesc.mSampleRate = *(_OWORD *)v46;
    *(_OWORD *)&inStreamDesc.mBytesPerPacket = v48;
    *(_QWORD *)&inStreamDesc.mBitsPerChannel = v47;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Accessibility/"), 1, 0, 0);

    v50 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), CFSTR("/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Accessibility/"), CFSTR("LiveListenCapture.wav"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    ExtAudioFileCreateWithURL((CFURLRef)objc_msgSend(v50, "fileURLWithPath:", v51), 0x57415645u, &inStreamDesc, 0, 1u, (ExtAudioFileRef *)(*(_QWORD *)(a1 + 32) + 24));

    ExtAudioFileSetProperty(*(ExtAudioFileRef *)(*(_QWORD *)(a1 + 32) + 24), 0x63666D74u, 0x28u, &buf);
  }
  v52 = *(void **)(a1 + 32);
  inStreamDesc = buf;
  objc_msgSend(v52, "_setupAudioUnitsWithAudioFormat:", &inStreamDesc);
  v53 = objc_claimAutoreleasedReturnValue();
  if (!v53)
  {
    objc_msgSend(*(id *)(a1 + 32), "setDidInitializeAudioUnit:", 1);

    goto LABEL_33;
  }
  v19 = (void *)v53;

LABEL_12:
  objc_msgSend(*(id *)(a1 + 32), "setIsListening:", 0);
LABEL_13:
  objc_msgSend(*(id *)(a1 + 32), "stopListeningWithCompletion:", 0);
  v20 = 0;
LABEL_14:
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Is Listening (%d) with error %@"), objc_msgSend(*(id *)(a1 + 32), "isListening"), v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HULiveListenController startListeningWithCompletion:]_block_invoke", 346, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v24 = objc_retainAutorelease(v22);
    v25 = v23;
    v26 = objc_msgSend(v24, "UTF8String");
    LODWORD(buf.mSampleRate) = 136446210;
    *(_QWORD *)((char *)&buf.mSampleRate + 4) = v26;
    _os_log_impl(&dword_1DE311000, v25, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "liveListenControllerStateDidChange");

  v28 = *(_QWORD *)(a1 + 40);
  if (v28)
    (*(void (**)(uint64_t, uint64_t, void *))(v28 + 16))(v28, v20, v19);

}

- (void)stopListeningWithCompletion:(id)a3
{
  id v4;
  int32x2_t v5;
  BOOL v6;
  NSObject *audioUnitsQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  int32x2_t v11;
  BOOL v12;

  v4 = a3;
  self->_waitingForAccessoryUpdate = 0;
  v5 = *(int32x2_t *)&self->_noise;
  *(_QWORD *)&self->_noise = 3267887104;
  v6 = -[HULiveListenController isListening](self, "isListening");
  -[HULiveListenController setIsListening:](self, "setIsListening:", 0);
  audioUnitsQueue = self->_audioUnitsQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__HULiveListenController_stopListeningWithCompletion___block_invoke;
  v9[3] = &unk_1EA8EAFE0;
  v12 = v6;
  v9[4] = self;
  v10 = v4;
  v11 = vrev64_s32(v5);
  v8 = v4;
  dispatch_async(audioUnitsQueue, v9);

}

void __54__HULiveListenController_stopListeningWithCompletion___block_invoke(uint64_t a1)
{
  os_log_t *v2;
  void *v3;
  id v4;
  OpaqueAudioComponentInstance *v5;
  OSStatus v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  os_log_t v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  ExtAudioFileRef *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  os_log_t v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  os_log_t v37;
  id v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  uint8_t buf[4];
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v2 = (os_log_t *)MEMORY[0x1E0D2F928];
  if (*(_BYTE *)(a1 + 56))
    goto LABEL_2;
  if ((objc_msgSend(*(id *)(a1 + 32), "didInitializeAudioUnit") & 1) != 0)
  {
    if (!*(_BYTE *)(a1 + 56))
    {
      v4 = 0;
LABEL_7:
      v17 = *(ExtAudioFileRef **)(a1 + 32);
      if (v17[3])
      {
        ExtAudioFileDispose(v17[3]);
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 0;
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), CFSTR("/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Accessibility/"), CFSTR("LiveListenCapture.wav"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)MEMORY[0x1E0CB3940];
        v21 = vabds_f32(*(float *)(a1 + 48), *(float *)(a1 + 52));
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", CFSTR("LiveListenComplete(%1.2lf_dB)_%@.wav"), *(_QWORD *)&v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", CFSTR("%@/%@"), CFSTR("/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Accessibility/"), v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v4;
        objc_msgSend(v18, "moveItemAtPath:toPath:error:", v19, v24, &v44);
        v25 = v44;

        v2 = (os_log_t *)MEMORY[0x1E0D2F928];
        v17 = *(ExtAudioFileRef **)(a1 + 32);
        v4 = v25;
      }
      if (v17[5])
      {
        AudioComponentInstanceDispose(v17[5]);
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
        v17 = *(ExtAudioFileRef **)(a1 + 32);
      }
      if (-[ExtAudioFileRef rioUnit](v17, "rioUnit"))
      {
        AudioComponentInstanceDispose(*(AudioComponentInstance *)(*(_QWORD *)(a1 + 32) + 48));
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;
      }
      objc_msgSend(*(id *)(a1 + 32), "setIsListening:", 0);
      objc_msgSend(*(id *)(a1 + 32), "setDidInitializeAudioUnit:", 0);
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "liveListenControllerStateDidChange");

      HAInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Is Listening (%d) %@ - %lf, %lf"), objc_msgSend(*(id *)(a1 + 32), "isListening"), v4, *(float *)(a1 + 48), *(float *)(a1 + 52));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HULiveListenController stopListeningWithCompletion:]_block_invoke", 422, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
      {
        v30 = objc_retainAutorelease(v28);
        v31 = v29;
        v32 = objc_msgSend(v30, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v47 = v32;
        _os_log_impl(&dword_1DE311000, v31, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      HAInitializeLogging();
      v33 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "session");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "stringWithFormat:", CFSTR("LiveListen will release auxiliarySession: %@"), v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HULiveListenController stopListeningWithCompletion:]_block_invoke", 424, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
      {
        v38 = objc_retainAutorelease(v36);
        v39 = v37;
        v40 = objc_msgSend(v38, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v47 = v40;
        _os_log_impl(&dword_1DE311000, v39, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "setSession:", 0);
      v41 = *(_QWORD *)(a1 + 40);
      if (v41)
        (*(void (**)(uint64_t, uint64_t, id))(v41 + 16))(v41, 1, v4);

      return;
    }
LABEL_2:
    objc_msgSend(*(id *)(a1 + 32), "session");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    objc_msgSend(v3, "setActive:forFeature:error:", 0, 8, &v45);
    v4 = v45;

    v5 = *(OpaqueAudioComponentInstance **)(*(_QWORD *)(a1 + 32) + 48);
    if (v5)
    {
      v6 = AudioOutputUnitStop(v5);
      if (v6)
      {
        v7 = (void *)MEMORY[0x1E0CB35C8];
        v8 = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Couldn't stop remote I/O unit"), *MEMORY[0x1E0CB2D50]);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.axlivelisten.audio"), v8, v9);
        v10 = objc_claimAutoreleasedReturnValue();

        HAInitializeLogging();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Stop LiveListen unit error: %@"), v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HULiveListenController stopListeningWithCompletion:]_block_invoke", 391, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *v2;
        if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
        {
          v14 = objc_retainAutorelease(v12);
          v15 = v13;
          v16 = objc_msgSend(v14, "UTF8String");
          *(_DWORD *)buf = 136446210;
          v47 = v16;
          _os_log_impl(&dword_1DE311000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

        }
        v4 = (id)v10;
      }
    }
    goto LABEL_7;
  }
  v42 = *(_QWORD *)(a1 + 40);
  if (v42)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ax_errorWithDomain:description:", CFSTR("Hearing"), CFSTR("Won't stop live listen controller, not listening"));
    v43 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v42 + 16))(v42, 0);

  }
}

- (id)_setupSession
{
  AVAudioSession *session;
  AVAudioSession *v4;
  AVAudioSession *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  AVAudioSession *v12;
  uint64_t v13;
  AVAudioSession *v14;
  uint64_t v15;
  AVAudioSession *v16;
  AVAudioSession *v17;
  AVAudioSession *v18;
  uint64_t v19;
  AVAudioSession *v20;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  session = self->_session;
  if (!session)
  {
    objc_msgSend(MEMORY[0x1E0C89AE8], "auxiliarySession");
    v4 = (AVAudioSession *)objc_claimAutoreleasedReturnValue();
    v5 = self->_session;
    self->_session = v4;

    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LiveListen created auxiliarySession: %@"), self->_session);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HULiveListenController _setupSession]", 443, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_retainAutorelease(v7);
      v10 = v8;
      *(_DWORD *)buf = 136446210;
      v30 = objc_msgSend(v9, "UTF8String");
      _os_log_impl(&dword_1DE311000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    session = self->_session;
  }
  v28 = 0;
  -[AVAudioSession setAudioHardwareControlFlags:error:](session, "setAudioHardwareControlFlags:error:", 18, &v28);
  v11 = v28;
  if (!v11)
  {
    v12 = self->_session;
    v13 = *MEMORY[0x1E0C89688];
    v27 = 0;
    -[AVAudioSession setCategory:withOptions:error:](v12, "setCategory:withOptions:error:", v13, 5, &v27);
    v11 = v27;
    if (!v11)
    {
      v14 = self->_session;
      v15 = *MEMORY[0x1E0C89758];
      v26 = 0;
      -[AVAudioSession setMode:error:](v14, "setMode:error:", v15, &v26);
      v11 = v26;
      if (!v11)
      {
        v16 = self->_session;
        v25 = 0;
        -[AVAudioSession setPreferredIOBufferFrameSize:error:](v16, "setPreferredIOBufferFrameSize:error:", 128, &v25);
        v11 = v25;
        if (!v11)
        {
          v17 = self->_session;
          v24 = 0;
          -[AVAudioSession setPrefersNoDucking:error:](v17, "setPrefersNoDucking:error:", 0, &v24);
          v11 = v24;
          if (!v11)
          {
            v18 = self->_session;
            v19 = *MEMORY[0x1E0D49B60];
            v23 = 0;
            -[AVAudioSession setMXSessionProperty:value:error:](v18, "setMXSessionProperty:value:error:", v19, MEMORY[0x1E0C9AAB0], &v23);
            v11 = v23;
            if (!v11)
            {
              v20 = self->_session;
              v22 = 0;
              -[AVAudioSession setActive:forFeature:error:](v20, "setActive:forFeature:error:", 1, 8, &v22);
              v11 = v22;
            }
          }
        }
      }
    }
  }
  return v11;
}

- (id)_setupAudioUnitsWithAudioFormat:(AudioStreamBasicDescription *)a3
{
  __int128 v5;
  void *v6;
  __int128 v7;
  id v8;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v5 = *(_OWORD *)&a3->mBytesPerPacket;
  v10 = *(_OWORD *)&a3->mSampleRate;
  v11 = v5;
  v12 = *(_QWORD *)&a3->mBitsPerChannel;
  -[HULiveListenController _setupMixerUnitWithAudioFormat:](self, "_setupMixerUnitWithAudioFormat:", &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = *(_OWORD *)&a3->mBytesPerPacket;
    v10 = *(_OWORD *)&a3->mSampleRate;
    v11 = v7;
    v12 = *(_QWORD *)&a3->mBitsPerChannel;
    -[HULiveListenController _setupRioUnitWithAudioFormat:](self, "_setupRioUnitWithAudioFormat:", &v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      -[HULiveListenController _connectUnits](self, "_connectUnits");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  v8 = v6;

  return v8;
}

- (id)_setupMixerUnitWithAudioFormat:(AudioStreamBasicDescription *)a3
{
  OpaqueAudioComponent *Next;
  OpaqueAudioComponentInstance **p_mixerUnit;
  OSStatus v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  OSStatus v13;
  OSStatus v14;
  OSStatus v15;
  OSStatus v16;
  OSStatus v17;
  OSStatus v18;
  OSStatus v19;
  void *v20;
  void *v21;
  AudioComponentDescription v23;
  _QWORD inData[2];
  int v25;

  v25 = 1;
  inData[0] = RenderAudio;
  inData[1] = self;
  *(_OWORD *)&v23.componentType = xmmword_1DE38FFD0;
  v23.componentFlagsMask = 0;
  Next = AudioComponentFindNext(0, &v23);
  p_mixerUnit = &self->_mixerUnit;
  v7 = AudioComponentInstanceNew(Next, p_mixerUnit);
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = v7;
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = *MEMORY[0x1E0CB2D50];
    v12 = CFSTR("Couldn't open the mixer unit");
  }
  else
  {
    v13 = AudioUnitSetProperty(*p_mixerUnit, 0x17u, 1u, 0, inData, 0x10u);
    if (v13)
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = v13;
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = *MEMORY[0x1E0CB2D50];
      v12 = CFSTR("Couldn't set mixer render callback");
    }
    else
    {
      v14 = AudioUnitSetProperty(*p_mixerUnit, 8u, 1u, 0, a3, 0x28u);
      if (v14)
      {
        v8 = (void *)MEMORY[0x1E0CB35C8];
        v9 = v14;
        v10 = (void *)MEMORY[0x1E0C99D80];
        v11 = *MEMORY[0x1E0CB2D50];
        v12 = CFSTR("Couldn't set the mixer unit's input bus format");
      }
      else
      {
        v15 = AudioUnitSetProperty(*p_mixerUnit, 8u, 2u, 0, a3, 0x28u);
        if (v15)
        {
          v8 = (void *)MEMORY[0x1E0CB35C8];
          v9 = v15;
          v10 = (void *)MEMORY[0x1E0C99D80];
          v11 = *MEMORY[0x1E0CB2D50];
          v12 = CFSTR("Couldn't set the mixer unit's output bus format");
        }
        else
        {
          v16 = AudioUnitSetProperty(*p_mixerUnit, 0xBBFu, 1u, 0, &v25, 4u);
          if (v16)
          {
            v8 = (void *)MEMORY[0x1E0CB35C8];
            v9 = v16;
            v10 = (void *)MEMORY[0x1E0C99D80];
            v11 = *MEMORY[0x1E0CB2D50];
            v12 = CFSTR("Couldn't enable metering mode");
          }
          else
          {
            v17 = AudioUnitInitialize(*p_mixerUnit);
            if (v17)
            {
              v8 = (void *)MEMORY[0x1E0CB35C8];
              v9 = v17;
              v10 = (void *)MEMORY[0x1E0C99D80];
              v11 = *MEMORY[0x1E0CB2D50];
              v12 = CFSTR("Couldn't initialize the mixer unit");
            }
            else
            {
              v18 = AudioUnitSetParameter(*p_mixerUnit, 0, 2u, 0, 1.0, 0);
              if (v18)
              {
                v8 = (void *)MEMORY[0x1E0CB35C8];
                v9 = v18;
                v10 = (void *)MEMORY[0x1E0C99D80];
                v11 = *MEMORY[0x1E0CB2D50];
                v12 = CFSTR("Couldn't set mixer output volume");
              }
              else
              {
                v19 = AudioUnitSetParameter(*p_mixerUnit, 0, 1u, 0, 1.0, 0);
                if (!v19)
                  return 0;
                v8 = (void *)MEMORY[0x1E0CB35C8];
                v9 = v19;
                v10 = (void *)MEMORY[0x1E0C99D80];
                v11 = *MEMORY[0x1E0CB2D50];
                v12 = CFSTR("Couldn't set mixer input volume");
              }
            }
          }
        }
      }
    }
  }
  objc_msgSend(v10, "dictionaryWithObject:forKey:", v12, v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.axlivelisten.audio"), v9, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)_setupRioUnitWithAudioFormat:(AudioStreamBasicDescription *)a3
{
  OpaqueAudioComponent *Next;
  OpaqueAudioComponentInstance **p_rioUnit;
  OSStatus v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  AVAudioSession *session;
  AVAudioSession *v14;
  OSStatus v15;
  OSStatus v16;
  OSStatus v17;
  OSStatus v18;
  OSStatus v19;
  void *v20;
  void *v21;
  int inData;
  AudioComponentDescription inDesc;
  int v25;

  v25 = 1;
  *(_OWORD *)&inDesc.componentType = xmmword_1DE38FFE0;
  inDesc.componentFlagsMask = 0;
  Next = AudioComponentFindNext(0, &inDesc);
  p_rioUnit = &self->_rioUnit;
  v7 = AudioComponentInstanceNew(Next, &self->_rioUnit);
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = v7;
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = *MEMORY[0x1E0CB2D50];
    v12 = CFSTR("Couldn't open the remote I/O unit");
  }
  else
  {
    session = self->_session;
    if (session
      && (objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance"),
          v14 = (AVAudioSession *)objc_claimAutoreleasedReturnValue(),
          v14,
          session != v14)
      && (inData = -[AVAudioSession opaqueSessionID](self->_session, "opaqueSessionID"),
          (v15 = AudioUnitSetProperty(self->_rioUnit, 0x7E7u, 0, 0, &inData, 4u)) != 0))
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = v15;
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = *MEMORY[0x1E0CB2D50];
      v12 = CFSTR("Couldn't set rio unit's sessionID");
    }
    else
    {
      v16 = AudioUnitSetProperty(*p_rioUnit, 0x7D3u, 2u, 0, &v25, 4u);
      if (v16)
      {
        v8 = (void *)MEMORY[0x1E0CB35C8];
        v9 = v16;
        v10 = (void *)MEMORY[0x1E0C99D80];
        v11 = *MEMORY[0x1E0CB2D50];
        v12 = CFSTR("Couldn't enable output on the remote I/O unit");
      }
      else
      {
        v17 = AudioUnitSetProperty(*p_rioUnit, 0x7D3u, 1u, 1u, &v25, 4u);
        if (v17)
        {
          v8 = (void *)MEMORY[0x1E0CB35C8];
          v9 = v17;
          v10 = (void *)MEMORY[0x1E0C99D80];
          v11 = *MEMORY[0x1E0CB2D50];
          v12 = CFSTR("Couldn't enable input on the remote I/O unit");
        }
        else
        {
          v18 = AudioUnitSetProperty(*p_rioUnit, 8u, 1u, 0, a3, 0x28u);
          if (v18)
          {
            v8 = (void *)MEMORY[0x1E0CB35C8];
            v9 = v18;
            v10 = (void *)MEMORY[0x1E0C99D80];
            v11 = *MEMORY[0x1E0CB2D50];
            v12 = CFSTR("Couldn't set the remote I/O unit's output client format");
          }
          else
          {
            v19 = AudioUnitSetProperty(*p_rioUnit, 8u, 2u, 1u, a3, 0x28u);
            if (!v19)
              return 0;
            v8 = (void *)MEMORY[0x1E0CB35C8];
            v9 = v19;
            v10 = (void *)MEMORY[0x1E0C99D80];
            v11 = *MEMORY[0x1E0CB2D50];
            v12 = CFSTR("Couldn't set the remote I/O unit's input client format");
          }
        }
      }
    }
  }
  objc_msgSend(v10, "dictionaryWithObject:forKey:", v12, v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.axlivelisten.audio"), v9, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)_connectUnits
{
  _QWORD *v3;
  OSStatus v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  OSStatus v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v3 = malloc_type_malloc(0x10uLL, 0x44D5A3EFuLL);
  *v3 = self->_mixerUnit;
  v3[1] = 0;
  v4 = AudioUnitSetProperty(self->_rioUnit, 1u, 1u, 0, v3, 0x10u);
  free(v3);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Couldn't connect mixer to rio"), *MEMORY[0x1E0CB2D50]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    v8 = v4;
  }
  else
  {
    v9 = AudioUnitInitialize(self->_rioUnit);
    if (!v9)
    {
      v12 = 0;
      return v12;
    }
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Couldn't initialize the remote I/O unit"), *MEMORY[0x1E0CB2D50]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
    v8 = v11;
  }
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.axlivelisten.audio"), v8, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isListening
{
  return self->isListening;
}

- (void)setIsListening:(BOOL)a3
{
  self->isListening = a3;
}

- (OpaqueAudioComponentInstance)rioUnit
{
  return self->_rioUnit;
}

- (OpaqueAudioComponentInstance)mixerUnit
{
  return self->_mixerUnit;
}

- (AXHALiveListenDelegate)delegate
{
  return (AXHALiveListenDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)didInitializeAudioUnit
{
  return self->_didInitializeAudioUnit;
}

- (void)setDidInitializeAudioUnit:(BOOL)a3
{
  self->_didInitializeAudioUnit = a3;
}

- (BOOL)exportsLiveListenToFile
{
  return self->_exportsLiveListenToFile;
}

- (void)setExportsLiveListenToFile:(BOOL)a3
{
  self->_exportsLiveListenToFile = a3;
}

- (BOOL)waitingForAccessoryUpdate
{
  return self->_waitingForAccessoryUpdate;
}

- (void)setWaitingForAccessoryUpdate:(BOOL)a3
{
  self->_waitingForAccessoryUpdate = a3;
}

- (AXDispatchTimer)accessoryUpdateTimer
{
  return self->_accessoryUpdateTimer;
}

- (void)setAccessoryUpdateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryUpdateTimer, a3);
}

- (AVAudioSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_accessoryUpdateTimer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_audioUnitsQueue, 0);
}

@end
