@implementation MNAudioHardwareEngine

- (MNAudioHardwareEngine)initWithAudioSystemOptions:(id)a3 voiceLanguage:(id)a4 transportType:(int)a5
{
  id v9;
  id v10;
  void *v11;
  MNAudioHardwareEngine *v12;
  NSString *v13;
  NSString *voiceLanguage;
  NSObject *v15;
  MNAudioSystemOptions *options;
  _BOOL8 v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSString *v21;
  uint64_t transportType;
  __CFString *v23;
  MNAudioSystemEventQueue *v24;
  MNAudioSystemEventQueue *queue;
  id v26;
  void *v27;
  id chimeBeforeInstructionListenerHandle;
  void *v29;
  id v31;
  objc_super v32;
  uint8_t buf[4];
  MNAudioSystemOptions *v34;
  __int16 v35;
  __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9 || !objc_msgSend(v10, "length"))
    goto LABEL_11;
  v12 = 0;
  if (a5 > 3 || a5 == 1)
    goto LABEL_15;
  v32.receiver = self;
  v32.super_class = (Class)MNAudioHardwareEngine;
  self = -[MNAudioHardwareEngine init](&v32, sel_init);
  if (!self)
  {
LABEL_11:
    v12 = 0;
    goto LABEL_15;
  }
  v13 = (NSString *)objc_msgSend(v11, "copy");
  voiceLanguage = self->_voiceLanguage;
  self->_voiceLanguage = v13;

  self->_transportType = a5;
  objc_storeStrong((id *)&self->_options, a3);
  GetAudioLogForMNAudioHardwareEngineCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    options = self->_options;
    *(_DWORD *)buf = 138412290;
    v34 = options;
    _os_log_impl(&dword_1B0AD7000, v15, OS_LOG_TYPE_INFO, "ⓜ Setting audio system options : %@", buf, 0xCu);
  }

  v17 = -[MNAudioSystemOptions useHFP](self->_options, "useHFP");
  -[MNAudioHardwareEngine pathwayAccess](self, "pathwayAccess");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setEnableHFPUse:", v17);

  -[MNAudioHardwareEngine pathwayAccess](self, "pathwayAccess");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWantsVolumeControl:", 1);

  -[MNAudioHardwareEngine _updateForNewGuidanceLevel](self, "_updateForNewGuidanceLevel");
  GetAudioLogForMNAudioHardwareEngineCategory();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = self->_voiceLanguage;
    transportType = self->_transportType;
    if (transportType >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_transportType);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = off_1E61D2618[transportType];
    }
    *(_DWORD *)buf = 138412546;
    v34 = (MNAudioSystemOptions *)v21;
    v35 = 2112;
    v36 = v23;
    _os_log_impl(&dword_1B0AD7000, v20, OS_LOG_TYPE_INFO, "ⓦ Initialization: using voice language : %@, and transport type : %@", buf, 0x16u);

  }
  self->_currentUtteranceGuidanceLevel = 0;
  v24 = -[MNAudioSystemEventQueue initWithCapacity:]([MNAudioSystemEventQueue alloc], "initWithCapacity:", 32);
  queue = self->_queue;
  self->_queue = v24;

  -[MNAudioSystemEventQueue setDelegate:](self->_queue, "setDelegate:", self);
  self->_chimeBeforeInstruction = GEOConfigGetBOOL();
  objc_initWeak((id *)buf, self);
  v26 = MEMORY[0x1E0C80D38];
  objc_copyWeak(&v31, (id *)buf);
  _GEOConfigAddBlockListenerForKey();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  chimeBeforeInstructionListenerHandle = self->_chimeBeforeInstructionListenerHandle;
  self->_chimeBeforeInstructionListenerHandle = v27;

  -[MNAudioSystemOptions registerObserver:](self->_options, "registerObserver:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObserver:selector:name:object:", self, sel__mediaSessionServicesWereLost_, *MEMORY[0x1E0CFF058], 0);
  objc_msgSend(v29, "addObserver:selector:name:object:", self, sel__mediaSessionServicesWereReset_, *MEMORY[0x1E0CFF070], 0);
  self = self;

  objc_destroyWeak(&v31);
  objc_destroyWeak((id *)buf);
  v12 = self;
LABEL_15:

  return v12;
}

void __80__MNAudioHardwareEngine_initWithAudioSystemOptions_voiceLanguage_transportType___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    WeakRetained[64] = GEOConfigGetBOOL();
    WeakRetained = v2;
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  GEOConfigRemoveBlockListener();
  -[MNAudioSystemOptions unregisterObserver:](self->_options, "unregisterObserver:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MNAudioHardwareEngine;
  -[MNAudioHardwareEngine dealloc](&v4, sel_dealloc);
}

- (MNAudioSystemOptions)options
{
  return self->_options;
}

- (MNAudioPathwayResourceAccess)pathwayAccess
{
  MNAudioPathwayResourceAccess *pathwayAccess;
  MNAudioPathwayResourceAccess *v4;
  MNAudioPathwayResourceAccess *v5;

  pathwayAccess = self->_pathwayAccess;
  if (!pathwayAccess)
  {
    v4 = -[MNAudioPathwayResourceAccess initWithHFPEnabled:]([MNAudioPathwayResourceAccess alloc], "initWithHFPEnabled:", -[MNAudioSystemOptions useHFP](self->_options, "useHFP"));
    v5 = self->_pathwayAccess;
    self->_pathwayAccess = v4;

    pathwayAccess = self->_pathwayAccess;
  }
  return pathwayAccess;
}

- (MNAudioSessionResourceAccess)sessionAccess
{
  MNAudioSessionResourceAccess *sessionAccess;
  MNAudioSessionResourceAccess *v4;
  MNAudioSessionResourceAccess *v5;

  sessionAccess = self->_sessionAccess;
  if (!sessionAccess)
  {
    v4 = (MNAudioSessionResourceAccess *)objc_opt_new();
    v5 = self->_sessionAccess;
    self->_sessionAccess = v4;

    -[MNAudioSessionResourceAccess setDelegate:](self->_sessionAccess, "setDelegate:", self);
    sessionAccess = self->_sessionAccess;
  }
  return sessionAccess;
}

- (MNHapticResourceController)hapticController
{
  MNHapticResourceController *hapticController;
  MNHapticResourceController *v4;
  MNHapticResourceController *v5;

  hapticController = self->_hapticController;
  if (!hapticController)
  {
    v4 = (MNHapticResourceController *)objc_opt_new();
    v5 = self->_hapticController;
    self->_hapticController = v4;

    -[MNHapticResourceController setDelegate:](self->_hapticController, "setDelegate:", self);
    hapticController = self->_hapticController;
  }
  return hapticController;
}

- (MNSoundEffectResourceController)sfxController
{
  MNSoundEffectResourceController *sfxController;
  MNSoundEffectResourceController *v4;
  MNSoundEffectResourceController *v5;

  sfxController = self->_sfxController;
  if (!sfxController)
  {
    v4 = (MNSoundEffectResourceController *)objc_opt_new();
    v5 = self->_sfxController;
    self->_sfxController = v4;

    -[MNSoundEffectResourceController setDelegate:](self->_sfxController, "setDelegate:", self);
    sfxController = self->_sfxController;
  }
  return sfxController;
}

- (MNSpeechResourceController)speechController
{
  MNSpeechResourceController *speechController;
  MNSpeechResourceController *v4;
  MNSpeechResourceController *v5;

  speechController = self->_speechController;
  if (!speechController)
  {
    v4 = -[MNSpeechResourceController initWithLanguage:]([MNSpeechResourceController alloc], "initWithLanguage:", self->_voiceLanguage);
    v5 = self->_speechController;
    self->_speechController = v4;

    -[MNSpeechResourceController setDelegate:](self->_speechController, "setDelegate:", self);
    speechController = self->_speechController;
  }
  return speechController;
}

- (BOOL)speaking
{
  void *v2;
  char v3;

  -[MNAudioHardwareEngine speechController](self, "speechController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "speaking");

  return v3;
}

- (void)registerObserver:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  MNObserverHashTable *v7;
  MNObserverHashTable *observers;
  NSObject *v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ((objc_msgSend(v4, "conformsToProtocol:", &unk_1EEEEBC88) & 1) != 0)
    {
      if (!self->_observers)
      {
        GetAudioLogForMNAudioHardwareEngineCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v11) = 0;
          _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEBUG, "ⓦ Creating observer table", (uint8_t *)&v11, 2u);
        }

        v7 = -[MNObserverHashTable initWithProtocol:]([MNObserverHashTable alloc], "initWithProtocol:", &unk_1EEEEBC88);
        observers = self->_observers;
        self->_observers = v7;

      }
      GetAudioLogForMNAudioHardwareEngineCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v11 = 138412290;
        v12 = v5;
        _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_DEBUG, "ⓦ Adding observer : %@", (uint8_t *)&v11, 0xCu);
      }

      -[MNObserverHashTable registerObserver:](self->_observers, "registerObserver:", v5);
    }
    else
    {
      GetAudioLogForMNAudioHardwareEngineCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = 138412290;
        v12 = v5;
        _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_ERROR, "⒲ Object isn't a MNAudioHardwareEngineObserver : %@", (uint8_t *)&v11, 0xCu);
      }

    }
  }

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  MNObserverHashTable *observers;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "conformsToProtocol:", &unk_1EEEEBC88);
    GetAudioLogForMNAudioHardwareEngineCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    observers = (MNObserverHashTable *)v7;
    if ((v6 & 1) == 0)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v10 = 138412290;
        v11 = v5;
        _os_log_impl(&dword_1B0AD7000, &observers->super, OS_LOG_TYPE_ERROR, "⒲ Object isn't a MNAudioHardwareEngineObserver : %@", (uint8_t *)&v10, 0xCu);
      }
      goto LABEL_11;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1B0AD7000, &observers->super, OS_LOG_TYPE_DEBUG, "ⓦ Removing observer : %@", (uint8_t *)&v10, 0xCu);
    }

    -[MNObserverHashTable unregisterObserver:](self->_observers, "unregisterObserver:", v5);
    if (!-[MNObserverHashTable hasObservers](self->_observers, "hasObservers"))
    {
      GetAudioLogForMNAudioHardwareEngineCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_DEBUG, "ⓦ Observer table empty; destroying",
          (uint8_t *)&v10,
          2u);
      }

      observers = self->_observers;
      self->_observers = 0;
LABEL_11:

    }
  }

}

- (void)changeTransportType:(int)a3
{
  uint64_t v3;
  NSObject *v4;
  __CFString *v5;
  uint8_t buf[4];
  __CFString *v7;
  uint64_t v8;

  v3 = *(_QWORD *)&a3;
  v8 = *MEMORY[0x1E0C80C00];
  if (a3 > 3 || a3 == 1)
  {
    GetAudioLogForMNAudioHardwareEngineCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      if (v3 < 7 && ((0x73u >> v3) & 1) != 0)
      {
        v5 = off_1E61D2650[(int)v3];
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v3);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138412290;
      v7 = v5;
      _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_ERROR, "ⓜ Invalid transport type passed to changeTransportType: %@", buf, 0xCu);

    }
  }
  else
  {
    self->_transportType = a3;
  }
}

- (void)cache:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GetAudioLogForMNAudioHardwareEngineCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v8 = 136315395;
    v9 = "-[MNAudioHardwareEngine cache:]";
    v10 = 2113;
    v11 = v4;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEBUG, "%s : '%{private}@'", (uint8_t *)&v8, 0x16u);
  }

  if (objc_msgSend(v4, "length"))
  {
    v6 = objc_msgSend(v4, "_navigation_isPrivate") ^ 1;
    -[MNAudioHardwareEngine speechController](self, "speechController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cache:withDisclosure:andReport:", v4, v6, 0);

  }
}

- (void)requestSpeech:(id)a3 guidanceLevel:(unint64_t)a4 shortPromptType:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  MNAudioSystemEvent *v12;
  MNAudioSystemEventQueue *queue;
  BOOL v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  if (objc_msgSend(v10, "length"))
  {
    v12 = -[MNAudioSystemEvent initWithUtterance:andShortPrompt:andVoiceGuidanceLevel:andCompletion:]([MNAudioSystemEvent alloc], "initWithUtterance:andShortPrompt:andVoiceGuidanceLevel:andCompletion:", v10, a5, a4, v11);
    if (v12)
    {
      queue = self->_queue;
      v17 = 0;
      v14 = -[MNAudioSystemEventQueue enqueue:withOptions:andReport:](queue, "enqueue:withOptions:andReport:", v12, 8, &v17);
      v15 = v17;
      if (v14)
      {
        -[MNAudioHardwareEngine _processNextEventIfNecessary](self, "_processNextEventIfNecessary");
      }
      else
      {
        GetAudioLogForMNAudioHardwareEngineCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138477827;
          v19 = (const char *)v12;
          _os_log_impl(&dword_1B0AD7000, v16, OS_LOG_TYPE_INFO, "⒲ Could not enqueue event : %{private}@", buf, 0xCu);
        }

      }
    }
    else
    {
      GetAudioLogForMNAudioHardwareEngineCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B0AD7000, v15, OS_LOG_TYPE_INFO, "⒲ Could not create event", buf, 2u);
      }
    }

  }
  else
  {
    GetAudioLogForMNAudioHardwareEngineCategory();
    v12 = (MNAudioSystemEvent *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[MNAudioHardwareEngine requestSpeech:guidanceLevel:shortPromptType:completionHandler:]";
      _os_log_impl(&dword_1B0AD7000, &v12->super, OS_LOG_TYPE_INFO, "⒲ %s : string is empty", buf, 0xCu);
    }
  }

}

- (void)forceStop
{
  void *v3;
  void *v4;
  id v5;

  -[MNAudioHardwareEngine clearAlEvents](self, "clearAlEvents");
  -[MNAudioHardwareEngine sfxController](self, "sfxController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stop");

  -[MNAudioHardwareEngine hapticController](self, "hapticController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopVibrating");

  -[MNAudioHardwareEngine sessionAccess](self, "sessionAccess");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deactivateWithForce:", 1);

}

- (void)stop
{
  void *v3;
  void *v4;
  id v5;

  -[MNAudioHardwareEngine clearAlEvents](self, "clearAlEvents");
  -[MNAudioHardwareEngine sfxController](self, "sfxController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stop");

  -[MNAudioHardwareEngine hapticController](self, "hapticController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopVibrating");

  -[MNAudioHardwareEngine sessionAccess](self, "sessionAccess");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deactivate");

}

- (void)clearAlEvents
{
  -[MNAudioHardwareEngine _stopCurrentEvent](self, "_stopCurrentEvent");
  -[MNAudioSystemEventQueue clear](self->_queue, "clear");
}

- (BOOL)vibrateForShortPrompt:(unint64_t)a3
{
  unint64_t v3;
  unint64_t v4;
  NSObject *v5;
  __CFString *v6;
  uint8_t buf[4];
  __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3 & 0xF;
  v4 = v3 - 3;
  if (v3 - 3 > 2)
  {
    GetAudioLogForMNAudioHardwareEngineCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (v3 >= 6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UNKNOWN: %lu"), v3);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E61D2688[v3];
      }
      *(_DWORD *)buf = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "ⓦ Vibration ignored: short prompt type - %@", buf, 0xCu);

    }
  }
  else
  {
    -[MNAudioHardwareEngine hapticController](self, "hapticController");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject triggerVibration](v5, "triggerVibration");
  }

  return v4 < 3;
}

- (double)durationOf:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[MNAudioHardwareEngine speechController](self, "speechController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "durationOf:", v4);
    v7 = v6;

  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

+ (BOOL)headphonesAreInUse
{
  return +[MNAudioSessionResourceAccess headphonesAreInUse](MNAudioSessionResourceAccess, "headphonesAreInUse");
}

+ (BOOL)deviceSpeakerIsInUse
{
  return +[MNAudioSessionResourceAccess deviceSpeakerIsInUse](MNAudioSessionResourceAccess, "deviceSpeakerIsInUse");
}

- (void)_processNextEventIfNecessary
{
  if (!-[MNAudioHardwareEngine _hardwareIsBusy](self, "_hardwareIsBusy"))
    -[MNAudioHardwareEngine _processNextEvent](self, "_processNextEvent");
}

- (void)_processNextEvent
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[8];
  _QWORD block[7];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;

  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__3;
  v42 = __Block_byref_object_dispose__3;
  v43 = (id)objc_opt_new();
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__3;
  v36 = __Block_byref_object_dispose__3;
  v37 = (id)objc_opt_new();
  v3 = -[MNAudioSystemOptions guidanceLevelForTransportType:](self->_options, "guidanceLevelForTransportType:", self->_transportType);
  while (1)
  {
    v4 = -[MNAudioSystemEventQueue count](self->_queue, "count");
    if (!v4)
      break;
    -[MNAudioSystemEventQueue dequeue](self->_queue, "dequeue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "utterance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (!v7)
      goto LABEL_9;
    if (-[MNAudioHardwareEngine _speechMuted](self, "_speechMuted"))
    {
      v8 = v39;
LABEL_8:
      objc_msgSend((id)v8[5], "addObject:", v5);
LABEL_9:

      v5 = 0;
      goto LABEL_10;
    }
    if (v3 < objc_msgSend(v5, "guidanceLevel"))
    {
      v8 = v33;
      goto LABEL_8;
    }
LABEL_10:
    if (v5)
      goto LABEL_13;
  }
  v5 = 0;
LABEL_13:
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__MNAudioHardwareEngine__processNextEvent__block_invoke;
  block[3] = &unk_1E61D25F8;
  block[4] = &v38;
  block[5] = &v32;
  block[6] = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  if (!v4)
  {
    GetAudioLogForMNAudioHardwareEngineCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0AD7000, v14, OS_LOG_TYPE_INFO, "ⓦ No more events to process; deactivating the audio session",
        buf,
        2u);
    }

    -[MNAudioHardwareEngine sessionAccess](self, "sessionAccess");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "deactivate");
    goto LABEL_32;
  }
  if ((objc_msgSend(v5, "shortPrompt") & 0x40) != 0)
    goto LABEL_28;
  -[MNAudioHardwareEngine sessionAccess](self, "sessionAccess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "promptStyle");

  if (v11 != 1936224884)
  {
    if (v11 == 1852796517)
    {
      objc_msgSend(v5, "handler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v28[0] = v9;
        v28[1] = 3221225472;
        v28[2] = __42__MNAudioHardwareEngine__processNextEvent__block_invoke_67;
        v28[3] = &unk_1E61D23C8;
        v29 = v5;
        v13 = (void *)MEMORY[0x1E0C80D38];
        dispatch_async(MEMORY[0x1E0C80D38], v28);

      }
      -[MNAudioHardwareEngine _processNextEvent](self, "_processNextEvent");
      goto LABEL_33;
    }
LABEL_28:
    -[MNAudioHardwareEngine sessionAccess](self, "sessionAccess");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "state");

    if (v20)
    {
      -[MNAudioHardwareEngine sessionAccess](self, "sessionAccess");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "state");

      if (v22 == 2)
        -[MNAudioHardwareEngine _process:](self, "_process:", v5);
      goto LABEL_33;
    }
    objc_storeStrong((id *)&self->_pendingEvent, v5);
    -[MNAudioHardwareEngine sessionAccess](self, "sessionAccess");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "activate");
LABEL_32:

    goto LABEL_33;
  }
  v16 = objc_msgSend(v5, "shortPrompt") & 0xF;
  if (v16 > 3 || v16 == 2)
    goto LABEL_28;
  objc_msgSend(v5, "handler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v23 = v9;
    v24 = 3221225472;
    v25 = __42__MNAudioHardwareEngine__processNextEvent__block_invoke_2;
    v26 = &unk_1E61D23C8;
    v27 = v5;
    v18 = (void *)MEMORY[0x1E0C80D38];
    dispatch_async(MEMORY[0x1E0C80D38], &v23);

  }
  -[MNAudioHardwareEngine _processNextEvent](self, "_processNextEvent", v23, v24, v25, v26);
LABEL_33:

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

}

void __42__MNAudioHardwareEngine__processNextEvent__block_invoke(_QWORD *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __CFString *v6;
  NSObject *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  __CFString *v20;
  __CFString *v21;
  unint64_t v22;
  __CFString *v23;
  void *v24;
  void (**v25)(_QWORD, _QWORD);
  uint64_t v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  __CFString *v38;
  __int16 v39;
  __CFString *v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v1 = *(id *)(*(_QWORD *)(a1[4] + 8) + 40);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v34 != v4)
          objc_enumerationMutation(v1);
        v6 = *(__CFString **)(*((_QWORD *)&v33 + 1) + 8 * i);
        GetAudioLogForMNAudioHardwareEngineCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138477827;
          v38 = v6;
          _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_INFO, "ⓦ Speech is muted; dropping event - %{private}@",
            buf,
            0xCu);
        }

        -[__CFString handler](v6, "handler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          -[__CFString handler](v6, "handler");
          v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v9[2](v9, 0);

        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    }
    while (v3);
  }

  v10 = *(_QWORD *)(a1[4] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = *(id *)(*(_QWORD *)(a1[5] + 8) + 40);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
        GetAudioLogForMNAudioHardwareEngineCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v19 = objc_msgSend(v17, "guidanceLevel");
          if ((unint64_t)(v19 + 1) >= 4)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UNKNOWN: %lu"), v19);
            v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v20 = off_1E61D26B8[v19 + 1];
          }
          v21 = v20;
          v22 = a1[6] + 1;
          if (v22 >= 4)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UNKNOWN: %lu"), a1[6]);
            v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v23 = off_1E61D26B8[v22];
          }
          *(_DWORD *)buf = 138412546;
          v38 = v21;
          v39 = 2112;
          v40 = v23;
          _os_log_impl(&dword_1B0AD7000, v18, OS_LOG_TYPE_INFO, "ⓦ Voice guidance level not met - min required: %@, actual: %@", buf, 0x16u);

        }
        objc_msgSend(v17, "handler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          objc_msgSend(v17, "handler");
          v25 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v25[2](v25, 1);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    }
    while (v14);
  }

  v26 = *(_QWORD *)(a1[5] + 8);
  v27 = *(void **)(v26 + 40);
  *(_QWORD *)(v26 + 40) = 0;

}

void __42__MNAudioHardwareEngine__processNextEvent__block_invoke_67(uint64_t a1)
{
  void (**v1)(id, uint64_t);

  objc_msgSend(*(id *)(a1 + 32), "handler");
  v1 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue();
  v1[2](v1, 2);

}

void __42__MNAudioHardwareEngine__processNextEvent__block_invoke_2(uint64_t a1)
{
  void (**v1)(id, uint64_t);

  objc_msgSend(*(id *)(a1 + 32), "handler");
  v1 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue();
  v1[2](v1, 3);

}

- (void)_process:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  unsigned int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  unsigned __int8 v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  _BYTE v25[10];
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  unsigned int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GetAudioLogForMNAudioHardwareEngineCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    *(_QWORD *)v25 = v4;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_INFO, "ⓦ Processing event - %{private}@", buf, 0xCu);
  }

  v6 = 1852992876;
  if ((objc_msgSend(v4, "shortPrompt") & 0x40) == 0)
  {
    -[MNAudioHardwareEngine sessionAccess](self, "sessionAccess");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "promptStyle");

  }
  GetAudioLogForMNAudioHardwareEngineCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    -[MNAudioHardwareEngine sessionAccess](self, "sessionAccess");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v23, "promptStyle") >> 24;
    -[MNAudioHardwareEngine sessionAccess](self, "sessionAccess");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_msgSend(v10, "promptStyle") >> 16);
    -[MNAudioHardwareEngine sessionAccess](self, "sessionAccess");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = ((unsigned __int16)objc_msgSend(v12, "promptStyle") >> 8);
    -[MNAudioHardwareEngine sessionAccess](self, "sessionAccess");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "promptStyle");
    *(_DWORD *)buf = 67110912;
    *(_DWORD *)v25 = BYTE3(v6);
    *(_WORD *)&v25[4] = 1024;
    *(_DWORD *)&v25[6] = BYTE2(v6);
    v26 = 1024;
    v27 = BYTE1(v6);
    v28 = 1024;
    v29 = v6;
    v30 = 1024;
    v31 = v9;
    v32 = 1024;
    v33 = v11;
    v34 = 1024;
    v35 = v13;
    v36 = 1024;
    v37 = v15;
    _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_INFO, "ⓦ Processing: Using a prompt style of '%c%c%c%c' - audio session's prompt style: '%c%c%c%c'", buf, 0x32u);

  }
  self->_currentUtteranceGuidanceLevel = 0;
  if (self->_chimeBeforeInstruction)
  {
    if ((objc_msgSend(v4, "shortPrompt") & 0x10) != 0)
      v16 = 1;
    else
      v16 = 2;
    -[MNAudioHardwareEngine sfxController](self, "sfxController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "playSound:andReport:", v16, 0);

  }
  if (v6 == 1852992876)
  {
    v18 = objc_msgSend(v4, "isPrivate") ^ 1;
    -[MNAudioHardwareEngine speechController](self, "speechController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "utterance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "speak:withDisclosure:andReport:", v20, v18, 0);

    self->_currentUtteranceGuidanceLevel = objc_msgSend(v4, "guidanceLevel");
  }
  else
  {
    if (objc_msgSend(v4, "hasSoundEffect"))
    {
      if ((objc_msgSend(v4, "shortPrompt") & 0x10) != 0)
        v21 = 1;
      else
        v21 = 2;
    }
    else
    {
      v21 = 0;
    }
    -[MNAudioHardwareEngine sfxController](self, "sfxController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "playSound:andReport:", v21, 0);

  }
}

- (void)_finishedProcessingEventWithStatus:(unint64_t)a3
{
  NSObject *v5;
  __CFString *v6;
  MNAudioSystemEvent *v7;
  MNAudioSystemEvent *pendingEvent;
  void *v9;
  _QWORD block[4];
  MNAudioSystemEvent *v11;
  unint64_t v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  GetAudioLogForMNAudioHardwareEngineCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    if (a3 >= 0xB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UNKNOWN: %lu"), a3);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E61D26D8[a3];
    }
    *(_DWORD *)buf = 136315394;
    v14 = "-[MNAudioHardwareEngine _finishedProcessingEventWithStatus:]";
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_INFO, "ⓦ %s : %@", buf, 0x16u);

  }
  v7 = self->_pendingEvent;
  pendingEvent = self->_pendingEvent;
  self->_pendingEvent = 0;

  self->_currentUtteranceGuidanceLevel = 0;
  -[MNAudioSystemEvent handler](v7, "handler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__MNAudioHardwareEngine__finishedProcessingEventWithStatus___block_invoke;
    block[3] = &unk_1E61D23F0;
    v11 = v7;
    v12 = a3;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  -[MNAudioHardwareEngine _processNextEventIfNecessary](self, "_processNextEventIfNecessary");

}

void __60__MNAudioHardwareEngine__finishedProcessingEventWithStatus___block_invoke(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "handler");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40));

}

- (BOOL)_hardwareIsBusy
{
  MNAudioSystemEvent *pendingEvent;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  int v17;
  const __CFString *v18;
  void *v19;
  unint64_t v20;
  __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  int v27;
  uint8_t buf[4];
  const __CFString *v29;
  __int16 v30;
  __CFString *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  const __CFString *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  pendingEvent = self->_pendingEvent;
  -[MNAudioHardwareEngine speechController](self, "speechController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "speaking");

  -[MNAudioHardwareEngine sfxController](self, "sfxController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "playing");

  -[MNAudioHardwareEngine hapticController](self, "hapticController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "vibrating");

  -[MNAudioHardwareEngine sessionAccess](self, "sessionAccess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 1;
  if (objc_msgSend(v10, "state") != 1 && !pendingEvent)
  {
    -[MNAudioHardwareEngine speechController](self, "speechController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "speaking") & 1) == 0)
    {
      -[MNAudioHardwareEngine sfxController](self, "sfxController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "playing") & 1) == 0)
      {
        -[MNAudioHardwareEngine hapticController](self, "hapticController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v14, "vibrating");

      }
    }

  }
  GetAudioLogForMNAudioHardwareEngineCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v27 = v9;
    v16 = v7;
    v17 = v5;
    if (v11)
      v18 = CFSTR("YES");
    else
      v18 = CFSTR("NO");
    -[MNAudioHardwareEngine sessionAccess](self, "sessionAccess");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "state");
    if (v20 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UNKNOWN: %lu"), v20);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = off_1E61D2730[v20];
    }
    if (pendingEvent)
      v22 = CFSTR("YES");
    else
      v22 = CFSTR("NO");
    *(_DWORD *)buf = 138413570;
    if (v17)
      v23 = CFSTR("YES");
    else
      v23 = CFSTR("NO");
    v29 = v18;
    v30 = 2112;
    if (v16)
      v24 = CFSTR("YES");
    else
      v24 = CFSTR("NO");
    v31 = v21;
    if (v27)
      v25 = CFSTR("YES");
    else
      v25 = CFSTR("NO");
    v32 = 2112;
    v33 = v22;
    v34 = 2112;
    v35 = v23;
    v36 = 2112;
    v37 = v24;
    v38 = 2112;
    v39 = v25;
    _os_log_impl(&dword_1B0AD7000, v15, OS_LOG_TYPE_INFO, "ⓦ Is hardware busy? %@, because\n{\n\tSession state: %@\n\tHas pending event: %@\n\tSpeech active: %@\n\tSFX active: %@\n\tHaptics active: %@\n}", buf, 0x3Eu);

  }
  return v11;
}

- (BOOL)_speechMuted
{
  return -[MNAudioSystemOptions guidanceLevelForTransportType:](self->_options, "guidanceLevelForTransportType:", self->_transportType) == 0;
}

- (BOOL)_stopCurrentEvent
{
  void *v3;
  int v4;
  void *v5;

  -[MNAudioHardwareEngine speechController](self, "speechController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "speaking");

  if (v4)
  {
    -[MNAudioHardwareEngine speechController](self, "speechController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopSpeakingAndReport:", 0);

  }
  return v4;
}

- (void)_updateForNewGuidanceLevel
{
  unint64_t v3;
  void *v4;
  id v5;

  v3 = -[MNAudioSystemOptions guidanceLevelForTransportType:](self->_options, "guidanceLevelForTransportType:", self->_transportType);
  if (v3 == 1)
  {
    if (self->_currentUtteranceGuidanceLevel == 2)
      -[MNAudioHardwareEngine stop](self, "stop");
    if ((GEOConfigGetBOOL() & 1) == 0)
    {
      _MNStringFromSpokenLocalization(CFSTR("Navigation_FirstTimeSwitchToAlertsOnlyGuidanceLevel"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNAudioHardwareEngine requestSpeech:guidanceLevel:shortPromptType:completionHandler:](self, "requestSpeech:guidanceLevel:shortPromptType:completionHandler:", v4, 1, 64, 0);
      GEOConfigSetBOOL();

    }
  }
  else if (!v3)
  {
    -[MNAudioHardwareEngine stop](self, "stop");
  }
  -[MNAudioHardwareEngine sessionAccess](self, "sessionAccess");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updatePropertiesWithOptions:transportType:error:", self->_options, self->_transportType, 0);

}

- (void)audioSystemEventQueue:(id)a3 eventWillInterrupt:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  GetAudioLogForMNAudioHardwareEngineCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = 136315650;
    v10 = "-[MNAudioHardwareEngine audioSystemEventQueue:eventWillInterrupt:]";
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEBUG, "ⓦ %s : %@ : %@", (uint8_t *)&v9, 0x20u);
  }

  if (!-[MNAudioHardwareEngine _stopCurrentEvent](self, "_stopCurrentEvent"))
    -[MNAudioHardwareEngine _processNextEventIfNecessary](self, "_processNextEventIfNecessary");

}

- (void)audioSessionResourceAccess:(id)a3 didActivateSession:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  GetAudioLogForMNAudioHardwareEngineCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 136315650;
    v9 = "-[MNAudioHardwareEngine audioSessionResourceAccess:didActivateSession:]";
    v10 = 2112;
    v11 = v6;
    v12 = 1024;
    v13 = v4;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEBUG, "ⓦ %s : %@ : %d", (uint8_t *)&v8, 0x1Cu);
  }

  -[MNObserverHashTable audioHardwareEngine:didActivateAudioSession:](self->_observers, "audioHardwareEngine:didActivateAudioSession:", self, 1);
  -[MNAudioHardwareEngine _process:](self, "_process:", self->_pendingEvent);

}

- (void)audioSessionResourceAccess:(id)a3 didFailWhileActivatingSession:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  GetAudioLogForMNAudioHardwareEngineCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = 136315650;
    v10 = "-[MNAudioHardwareEngine audioSessionResourceAccess:didFailWhileActivatingSession:]";
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEBUG, "ⓦ %s : %@ : %@", (uint8_t *)&v9, 0x20u);
  }

  -[MNAudioHardwareEngine _process:](self, "_process:", self->_pendingEvent);
}

- (void)audioSessionResourceAccess:(id)a3 didDeactivateSession:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  GetAudioLogForMNAudioHardwareEngineCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 136315650;
    v9 = "-[MNAudioHardwareEngine audioSessionResourceAccess:didDeactivateSession:]";
    v10 = 2112;
    v11 = v6;
    v12 = 1024;
    v13 = v4;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEBUG, "ⓦ %s : %@ : %d", (uint8_t *)&v8, 0x1Cu);
  }

  -[MNObserverHashTable audioHardwareEngine:didActivateAudioSession:](self->_observers, "audioHardwareEngine:didActivateAudioSession:", self, 0);
  if (-[MNAudioSystemEventQueue count](self->_queue, "count"))
    -[MNAudioHardwareEngine _processNextEventIfNecessary](self, "_processNextEventIfNecessary");

}

- (void)audioSessionResourceAccess:(id)a3 didFailWhileDeactivatingSession:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  GetAudioLogForMNAudioHardwareEngineCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = 136315650;
    v10 = "-[MNAudioHardwareEngine audioSessionResourceAccess:didFailWhileDeactivatingSession:]";
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEBUG, "ⓦ %s : %@ : %@", (uint8_t *)&v9, 0x20u);
  }

  if (-[MNAudioSystemEventQueue count](self->_queue, "count"))
    -[MNAudioHardwareEngine _processNextEventIfNecessary](self, "_processNextEventIfNecessary");

}

- (void)audioSystemOptions:(id)a3 didChangeGuidanceLevel:(unint64_t)a4 transportType:(int)a5
{
  if (self->_transportType == a5)
    -[MNAudioHardwareEngine _updateForNewGuidanceLevel](self, "_updateForNewGuidanceLevel", a3, a4);
}

- (void)audioSystemOptions:(id)a3 didUpdateUseHFP:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  -[MNAudioHardwareEngine pathwayAccess](self, "pathwayAccess", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnableHFPUse:", v4);

}

- (void)audioSystemOptions:(id)a3 didUpdatePauseSpokenAudio:(BOOL)a4
{
  id v5;

  -[MNAudioHardwareEngine sessionAccess](self, "sessionAccess", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updatePropertiesWithOptions:transportType:error:", self->_options, self->_transportType, 0);

}

- (void)soundEffectResourceController:(id)a3 didFinishPlayingIndicator:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  GetAudioLogForMNAudioHardwareEngineCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 136315650;
    v9 = "-[MNAudioHardwareEngine soundEffectResourceController:didFinishPlayingIndicator:]";
    v10 = 2112;
    v11 = v6;
    v12 = 2048;
    v13 = a4;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEBUG, "ⓦ %s : %@ : %lu", (uint8_t *)&v8, 0x20u);
  }

  -[MNAudioHardwareEngine _finishedProcessingEventWithStatus:](self, "_finishedProcessingEventWithStatus:", 10);
}

- (void)soundEffectResourceController:(id)a3 didFailWhilePlayingIndicator:(unint64_t)a4 withError:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  GetAudioLogForMNAudioHardwareEngineCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = 136315906;
    v12 = "-[MNAudioHardwareEngine soundEffectResourceController:didFailWhilePlayingIndicator:withError:]";
    v13 = 2112;
    v14 = v8;
    v15 = 2048;
    v16 = a4;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_DEBUG, "ⓦ %s : %@ : %lu : %@", (uint8_t *)&v11, 0x2Au);
  }

  -[MNAudioHardwareEngine _finishedProcessingEventWithStatus:](self, "_finishedProcessingEventWithStatus:", 6);
}

- (void)soundEffectResourceController:(id)a3 wasInterruptedWhilePlayingIndicator:(unint64_t)a4 withError:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  GetAudioLogForMNAudioHardwareEngineCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = 136315906;
    v12 = "-[MNAudioHardwareEngine soundEffectResourceController:wasInterruptedWhilePlayingIndicator:withError:]";
    v13 = 2112;
    v14 = v8;
    v15 = 2048;
    v16 = a4;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_DEBUG, "ⓦ %s : %@ : %lu : %@", (uint8_t *)&v11, 0x2Au);
  }

  -[MNAudioHardwareEngine _finishedProcessingEventWithStatus:](self, "_finishedProcessingEventWithStatus:", 5);
}

- (void)speechResourceController:(id)a3 willStartSpeakingUtterance:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  GetAudioLogForMNAudioHardwareEngineCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = 136315651;
    v10 = "-[MNAudioHardwareEngine speechResourceController:willStartSpeakingUtterance:]";
    v11 = 2112;
    v12 = v6;
    v13 = 2113;
    v14 = v7;
    _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEBUG, "ⓦ %s : %@ : '%{private}@'", (uint8_t *)&v9, 0x20u);
  }

  -[MNObserverHashTable audioHardwareEngine:didStartSpeakingPrompt:](self->_observers, "audioHardwareEngine:didStartSpeakingPrompt:", self, v7);
}

- (void)speechResourceController:(id)a3 didFinishSpeakingUtterance:(id)a4 withDuration:(double)a5
{
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  GetAudioLogForMNAudioHardwareEngineCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = 136315907;
    v12 = "-[MNAudioHardwareEngine speechResourceController:didFinishSpeakingUtterance:withDuration:]";
    v13 = 2112;
    v14 = v8;
    v15 = 2113;
    v16 = v9;
    v17 = 2048;
    v18 = a5;
    _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_DEBUG, "ⓦ %s : %@ : '%{private}@' : %f", (uint8_t *)&v11, 0x2Au);
  }

  -[MNAudioHardwareEngine _finishedProcessingEventWithStatus:](self, "_finishedProcessingEventWithStatus:", 9);
}

- (void)speechResourceController:(id)a3 didFailWhileSpeakingUtterance:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  GetAudioLogForMNAudioHardwareEngineCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v13 = 136315907;
    v14 = "-[MNAudioHardwareEngine speechResourceController:didFailWhileSpeakingUtterance:withError:]";
    v15 = 2112;
    v16 = v8;
    v17 = 2113;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_DEBUG, "ⓦ %s : %@ : '%{private}@' : %@", (uint8_t *)&v13, 0x2Au);
  }

  if (objc_msgSend(v10, "code") == 3604 || objc_msgSend(v10, "code") == 3608)
    v12 = 8;
  else
    v12 = 6;
  -[MNAudioHardwareEngine _finishedProcessingEventWithStatus:](self, "_finishedProcessingEventWithStatus:", v12);

}

- (void)speechResourceController:(id)a3 didTimeoutWhileSpeakingUtterance:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  GetAudioLogForMNAudioHardwareEngineCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = 136315906;
    v13 = "-[MNAudioHardwareEngine speechResourceController:didTimeoutWhileSpeakingUtterance:withError:]";
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_DEBUG, "ⓦ %s : %@ : '%@{private}' : %@", (uint8_t *)&v12, 0x2Au);
  }

  -[MNAudioHardwareEngine _finishedProcessingEventWithStatus:](self, "_finishedProcessingEventWithStatus:", 7);
}

- (void)speechResourceController:(id)a3 wasInterruptedWhileSpeakingUtterance:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  GetAudioLogForMNAudioHardwareEngineCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = 136315907;
    v13 = "-[MNAudioHardwareEngine speechResourceController:wasInterruptedWhileSpeakingUtterance:withError:]";
    v14 = 2112;
    v15 = v8;
    v16 = 2113;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_DEBUG, "ⓦ %s : %@ : '%{private}@' : %@", (uint8_t *)&v12, 0x2Au);
  }

  -[MNAudioHardwareEngine _finishedProcessingEventWithStatus:](self, "_finishedProcessingEventWithStatus:", 4);
}

- (void)_mediaSessionServicesWereLost:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  GetAudioLogForMNAudioHardwareEngineCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_INFO, "ⓦ Media services were lost", v6, 2u);
  }

  -[MNAudioHardwareEngine stop](self, "stop");
  -[MNAudioHardwareEngine pathwayAccess](self, "pathwayAccess");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWantsVolumeControl:", 0);

}

- (void)_mediaSessionServicesWereReset:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  GetAudioLogForMNAudioHardwareEngineCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_INFO, "ⓦ Media services were reset", v7, 2u);
  }

  -[MNAudioHardwareEngine sessionAccess](self, "sessionAccess");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updatePropertiesWithOptions:transportType:error:", self->_options, self->_transportType, 0);

  -[MNAudioHardwareEngine pathwayAccess](self, "pathwayAccess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWantsVolumeControl:", 1);

}

- (void)setPathwayAccess:(id)a3
{
  objc_storeStrong((id *)&self->_pathwayAccess, a3);
}

- (void)setSessionAccess:(id)a3
{
  objc_storeStrong((id *)&self->_sessionAccess, a3);
}

- (void)setHapticController:(id)a3
{
  objc_storeStrong((id *)&self->_hapticController, a3);
}

- (void)setSfxController:(id)a3
{
  objc_storeStrong((id *)&self->_sfxController, a3);
}

- (void)setSpeechController:(id)a3
{
  objc_storeStrong((id *)&self->_speechController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechController, 0);
  objc_storeStrong((id *)&self->_sfxController, 0);
  objc_storeStrong((id *)&self->_hapticController, 0);
  objc_storeStrong((id *)&self->_sessionAccess, 0);
  objc_storeStrong((id *)&self->_pathwayAccess, 0);
  objc_storeStrong(&self->_chimeBeforeInstructionListenerHandle, 0);
  objc_storeStrong((id *)&self->_pendingEvent, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_voiceLanguage, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

uint64_t NavigationConfig_MNAudioHardwareEngine_ChangedToAlertsOnly_Metadata_block_invoke_162()
{
  return MEMORY[0x1E0C9AAA0];
}

@end
