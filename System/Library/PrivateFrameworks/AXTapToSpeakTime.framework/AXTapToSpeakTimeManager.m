@implementation AXTapToSpeakTimeManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_1);
  return (id)sharedInstance__Shared_0;
}

void __41__AXTapToSpeakTimeManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[AXTapToSpeakTimeManager _init]([AXTapToSpeakTimeManager alloc], "_init");
  v1 = (void *)sharedInstance__Shared_0;
  sharedInstance__Shared_0 = (uint64_t)v0;

}

- (id)_init
{
  AXTapToSpeakTimeManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  AVSpeechSynthesizer *avSpeechSynthesizer;
  uint64_t v8;
  AXTapticTimeManager *tapticTimeManager;
  void *v10;
  void *v11;
  void *v12;
  NSDateFormatter *v13;
  NSDateFormatter *dateFormatter;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AXTapToSpeakTimeManager;
  v2 = -[AXTapToSpeakTimeManager init](&v16, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.accessibility.AXTapToSpeakTimeManager", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = objc_opt_new();
    avSpeechSynthesizer = v2->_avSpeechSynthesizer;
    v2->_avSpeechSynthesizer = (AVSpeechSynthesizer *)v6;

    -[AVSpeechSynthesizer setIsInternalSynth:](v2->_avSpeechSynthesizer, "setIsInternalSynth:", 1);
    -[AVSpeechSynthesizer setDelegate:](v2->_avSpeechSynthesizer, "setDelegate:", v2);
    objc_msgSend(MEMORY[0x24BE00730], "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    tapticTimeManager = v2->_tapticTimeManager;
    v2->_tapticTimeManager = (AXTapticTimeManager *)v8;

    v2->_lastMediaVolume = -1.0;
    v10 = (void *)MEMORY[0x24BDD1500];
    objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dateFormatFromTemplate:options:locale:", CFSTR("jjmm"), 0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x24BDD1500]);
    dateFormatter = v2->_dateFormatter;
    v2->_dateFormatter = v13;

    -[NSDateFormatter setDateFormat:](v2->_dateFormatter, "setDateFormat:", v12);
    v2->_ringerStateNotifyToken = -1;
    -[AXTapToSpeakTimeManager _registerForNotifications](v2, "_registerForNotifications");
    -[AXTapToSpeakTimeManager _ringerStateChanged](v2, "_ringerStateChanged");

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[AXTapToSpeakTimeManager _unregisterForNotifications](self, "_unregisterForNotifications");
  v3.receiver = self;
  v3.super_class = (Class)AXTapToSpeakTimeManager;
  -[AXTapToSpeakTimeManager dealloc](&v3, sel_dealloc);
}

- (void)_registerForNotifications
{
  int *p_ringerStateNotifyToken;
  NSObject *queue;
  _QWORD v5[4];
  id v6;
  id location;

  p_ringerStateNotifyToken = &self->_ringerStateNotifyToken;
  if (self->_ringerStateNotifyToken == -1)
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __52__AXTapToSpeakTimeManager__registerForNotifications__block_invoke;
    v5[3] = &unk_24EF4E8D0;
    objc_copyWeak(&v6, &location);
    notify_register_dispatch("com.apple.springboard.ringerstate", p_ringerStateNotifyToken, queue, v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __52__AXTapToSpeakTimeManager__registerForNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_ringerStateChanged");

}

- (void)_unregisterForNotifications
{
  int ringerStateNotifyToken;

  ringerStateNotifyToken = self->_ringerStateNotifyToken;
  if (ringerStateNotifyToken != -1)
  {
    notify_cancel(ringerStateNotifyToken);
    self->_ringerStateNotifyToken = -1;
  }
}

- (void)_ringerStateChanged
{
  int ringerStateNotifyToken;
  BOOL v4;
  uint64_t state64;

  state64 = 1;
  ringerStateNotifyToken = self->_ringerStateNotifyToken;
  if (ringerStateNotifyToken == -1)
  {
    v4 = 0;
  }
  else
  {
    notify_get_state(ringerStateNotifyToken, &state64);
    v4 = state64 == 0;
  }
  self->_cachedRingerIsMuted = v4;
}

- (BOOL)_canSpeakTimeForVoice:(unint64_t)a3 andGesture:(unint64_t)a4
{
  void *v7;
  char v8;
  NSObject *v9;
  const char *v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  NSObject *v15;
  const __CFString *v16;
  int v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "tapToSpeakTimeEnabled");

  if ((v8 & 1) != 0)
  {
    if (a4)
    {
      if (a4 == 1 && a3 - 3 <= 1)
      {
        if (self->_cachedRingerIsMuted)
        {
          AXLogTapticTime();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            LOWORD(v17) = 0;
            v10 = "ringer is muted, will NOT speak time";
LABEL_10:
            _os_log_impl(&dword_22701A000, v9, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v17, 2u);
            goto LABEL_11;
          }
          goto LABEL_11;
        }
        return 1;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "tapToSpeakTimeAvailability");

      if (v13 == 1)
      {
        AXLogTapticTime();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          if (self->_cachedRingerIsMuted)
            v16 = CFSTR("YES");
          else
            v16 = CFSTR("NO");
          v17 = 138412290;
          v18 = v16;
          _os_log_impl(&dword_22701A000, v15, OS_LOG_TYPE_INFO, "availability = respect mute, ringerIsMuted = %@", (uint8_t *)&v17, 0xCu);
        }

        if (self->_cachedRingerIsMuted)
        {
          AXLogTapticTime();
          v9 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
            goto LABEL_11;
          LOWORD(v17) = 0;
          v10 = "ringer is muted, will NOT speak time";
          goto LABEL_10;
        }
        return 1;
      }
      if (v13 == 2)
      {
        AXLogTapticTime();
        v9 = objc_claimAutoreleasedReturnValue();
        v11 = 1;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          LOWORD(v17) = 0;
          _os_log_impl(&dword_22701A000, v9, OS_LOG_TYPE_INFO, "availability = always. ignoring ringer state", (uint8_t *)&v17, 2u);
        }
        goto LABEL_12;
      }
    }
    return 0;
  }
  AXLogTapticTime();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    LOWORD(v17) = 0;
    v10 = "tap to speak time is disabled";
    goto LABEL_10;
  }
LABEL_11:
  v11 = 0;
LABEL_12:

  return v11;
}

- (BOOL)canOutputTime
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "tapToSpeakTimeEnabled");

  if (!v4)
    return 0;
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "tapToSpeakTimeAvailability");

  if (v6 != 2)
  {
    if (v6 == 1)
      return !self->_cachedRingerIsMuted;
    return 0;
  }
  return 1;
}

- (BOOL)isCurrentlyOutputting
{
  NSObject *queue;
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
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__AXTapToSpeakTimeManager_isCurrentlyOutputting__block_invoke;
  v5[3] = &unk_24EF4E8F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __48__AXTapToSpeakTimeManager_isCurrentlyOutputting__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "isSpeaking") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "tapticTimeManager"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "isCurrentlyOutputting"),
        v2,
        v3))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (BOOL)_canTapticTime
{
  void *v2;
  int v3;
  NSObject *v4;
  const __CFString *v5;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "voiceOverTapticTimeMode");

  AXLogTapticTime();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = CFSTR("NO");
    if (v3)
      v5 = CFSTR("YES");
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_22701A000, v4, OS_LOG_TYPE_INFO, "tapticTimeEnabled = %@", (uint8_t *)&v7, 0xCu);
  }

  return v3;
}

- (void)outputTime:(id)a3
{
  -[AXTapToSpeakTimeManager outputTime:preferredVoice:](self, "outputTime:preferredVoice:", a3, 0);
}

- (void)outputTime:(id)a3 preferredVoice:(unint64_t)a4
{
  -[AXTapToSpeakTimeManager outputTime:preferredVoice:withGesture:](self, "outputTime:preferredVoice:withGesture:", a3, a4, 0);
}

- (void)outputTime:(id)a3 preferredVoice:(unint64_t)a4 withGesture:(unint64_t)a5
{
  id v8;
  NSObject *v9;
  const __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  NSObject *queue;
  id v14;
  _QWORD v15[5];
  id v16;
  unint64_t v17;
  unint64_t v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  AXLogTapticTime();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    if (a4 - 1 > 3)
      v10 = CFSTR("Default");
    else
      v10 = *(&off_24EF4E988 + a4 - 1);
    v11 = CFSTR("One Finger Tap");
    if (!a5)
      v11 = CFSTR("Two Finger Hold");
    v12 = v11;
    *(_DWORD *)buf = 138412802;
    v20 = v8;
    v21 = 2112;
    v22 = v10;
    v23 = 2112;
    v24 = v12;
    _os_log_impl(&dword_22701A000, v9, OS_LOG_TYPE_INFO, "Attempting to start time output: %@, for preferredVoice: %@, with gesture: %@", buf, 0x20u);

  }
  queue = self->_queue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __65__AXTapToSpeakTimeManager_outputTime_preferredVoice_withGesture___block_invoke;
  v15[3] = &unk_24EF4E920;
  v17 = a4;
  v18 = a5;
  v15[4] = self;
  v16 = v8;
  v14 = v8;
  dispatch_async(queue, v15);

}

uint64_t __65__AXTapToSpeakTimeManager_outputTime_preferredVoice_withGesture___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_canSpeakTimeForVoice:andGesture:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v3 = *(void **)(a1 + 32);
  if (v2)
    return objc_msgSend(v3, "_speakTime:preferredVoice:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  result = objc_msgSend(v3, "_canTapticTime");
  if ((_DWORD)result)
  {
    if (!*(_QWORD *)(a1 + 56))
      return objc_msgSend(*(id *)(a1 + 32), "_outputTapticTime:", *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)stopOutput
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  AXLogTapticTime();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22701A000, v3, OS_LOG_TYPE_INFO, "Stopping (any) existing output", buf, 2u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__AXTapToSpeakTimeManager_stopOutput__block_invoke;
  block[3] = &unk_24EF4E840;
  block[4] = self;
  dispatch_async(queue, block);
}

void __37__AXTapToSpeakTimeManager_stopOutput__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  int v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "avSpeechSynthesizer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSpeaking");

  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "avSpeechSynthesizer");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stopSpeakingAtBoundary:", 0);
  }
  else
  {
    objc_msgSend(v4, "tapticTimeManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isCurrentlyOutputting");

    if (!v6)
      return;
    objc_msgSend(*(id *)(a1 + 32), "tapticTimeManager");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stopCurrentOutput");
  }

}

- (void)_speakTime:(id)a3 preferredVoice:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD activity_block[5];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[AXTapToSpeakTimeManager _setupAudioSessionForVoice:](self, "_setupAudioSessionForVoice:", a4);
  -[AXTapToSpeakTimeManager _normalizeVolumeIfNecessary](self, "_normalizeVolumeIfNecessary");
  if ((a4 | 2) == 2)
  {
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "outputVoice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    AXLogTapticTime();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v8;
      _os_log_impl(&dword_22701A000, v9, OS_LOG_TYPE_DEFAULT, "AFPreferences outputVoice: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BE00658], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "systemLanguageID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    AXLogTapticTime();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v11;
      _os_log_impl(&dword_22701A000, v12, OS_LOG_TYPE_DEFAULT, "System general language: %@", buf, 0xCu);
    }

    objc_msgSend(v8, "languageCode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "hasPrefix:", v11) & 1) != 0)
    {
      AXCLanguageConvertToCanonicalForm();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXTapToSpeakTimeManager _ttsSiriVoiceAssetForAFVoice:language:](self, "_ttsSiriVoiceAssetForAFVoice:language:", v8, v14);
      v15 = objc_claimAutoreleasedReturnValue();

      -[NSObject identifier](v15, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      AXLogTapticTime();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v16;
        _os_log_impl(&dword_22701A000, v17, OS_LOG_TYPE_DEFAULT, "Siri TTS voice identifier: %@", buf, 0xCu);
      }

      if (v16)
      {
        objc_msgSend(MEMORY[0x24BDB18E0], "_voiceFromInternalVoiceListWithIdentifier:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      AXLogTapticTime();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v25 = v13;
        v26 = 2112;
        v27 = v11;
        _os_log_impl(&dword_22701A000, v15, OS_LOG_TYPE_DEFAULT, "Siri voice language: %@ does not match system general language: %@. Will default to current locale system voice.", buf, 0x16u);
      }
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __53__AXTapToSpeakTimeManager__speakTime_preferredVoice___block_invoke;
  activity_block[3] = &unk_24EF4E948;
  activity_block[4] = self;
  v22 = v6;
  v23 = v18;
  v19 = v18;
  v20 = v6;
  _os_activity_initiate(&dword_22701A000, "Tap to speak time - voice services", OS_ACTIVITY_FLAG_DETACHED, activity_block);

}

void __53__AXTapToSpeakTimeManager__speakTime_preferredVoice___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDB18F0];
  objc_msgSend(*(id *)(a1 + 32), "dateFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "speechUtteranceWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = *(_DWORD *)"333?";
  objc_msgSend(v5, "setVolume:", v6);
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(v5, "setVoice:");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDB18E0], "voiceWithLanguage:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setVoice:", v7);

  }
  objc_msgSend(*(id *)(a1 + 32), "avSpeechSynthesizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "speakUtterance:", v5);

  AXLogTapticTime();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = 138412290;
    v11 = v5;
    _os_log_impl(&dword_22701A000, v9, OS_LOG_TYPE_INFO, "Speaking time: %@", (uint8_t *)&v10, 0xCu);
  }

}

- (id)_ttsSiriVoiceAssetForAFVoice:(id)a3 language:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  int v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "footprint");

  if (v8 == 1)
    v9 = 3;
  else
    v9 = 4;
  v10 = TTSSupportsNeuralVoices();
  AXLogTapticTime();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 67109120;
    LODWORD(v20) = v10;
    _os_log_impl(&dword_22701A000, v11, OS_LOG_TYPE_DEFAULT, "TTSSupportsNeuralVoices: %d", (uint8_t *)&v19, 8u);
  }

  if (!v10)
    goto LABEL_15;
  AXLogTapticTime();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[AXTapToSpeakTimeManager _ttsSiriVoiceAssetForAFVoice:language:].cold.2((uint64_t)v5);

  AXLogTapticTime();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138413314;
    v20 = v5;
    v21 = 2048;
    v22 = 0;
    v23 = 2048;
    v24 = v9;
    v25 = 2112;
    v26 = v7;
    v27 = 2048;
    v28 = 5;
    _os_log_impl(&dword_22701A000, v13, OS_LOG_TYPE_DEFAULT, "TTSSiriAssetManager installedAssetForLanguage:%@ gender:%ld footprint:%ld voiceName:%@ voiceType:%ld", (uint8_t *)&v19, 0x34u);
  }

  objc_msgSend(MEMORY[0x24BEB6258], "installedAssetForLanguage:gender:footprint:voiceName:voiceType:", v5, 0, v9, v7, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    AXLogTapticTime();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412290;
      v20 = v7;
      _os_log_impl(&dword_22701A000, v15, OS_LOG_TYPE_DEFAULT, "Neural voice not found for name: %@. Will try looking for Gryphon voice.", (uint8_t *)&v19, 0xCu);
    }

LABEL_15:
    AXLogTapticTime();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[AXTapToSpeakTimeManager _ttsSiriVoiceAssetForAFVoice:language:].cold.1((uint64_t)v5);

    AXLogTapticTime();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138413314;
      v20 = v5;
      v21 = 2048;
      v22 = 0;
      v23 = 2048;
      v24 = v9;
      v25 = 2112;
      v26 = v7;
      v27 = 2048;
      v28 = 4;
      _os_log_impl(&dword_22701A000, v17, OS_LOG_TYPE_DEFAULT, "TTSSiriAssetManager installedAssetForLanguage:%@ gender:%ld footprint:%ld voiceName:%@ voiceType:%ld", (uint8_t *)&v19, 0x34u);
    }

    objc_msgSend(MEMORY[0x24BEB6258], "installedAssetForLanguage:gender:footprint:voiceName:voiceType:", v5, 0, v9, v7, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (void)_outputTapticTime:(id)a3
{
  void *v3;
  id v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x24BE00730], "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputHoursAndMinutes:", objc_msgSend(v3, "voiceOverTapticTimeEncoding"));

}

- (id)_currentLanguageCode
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_canOutputPremiumVoice
{
  NSObject *v2;
  const __CFString *v3;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (_canOutputPremiumVoice_onceToken != -1)
    dispatch_once(&_canOutputPremiumVoice_onceToken, &__block_literal_global_204);
  AXLogTapticTime();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    if (_canOutputPremiumVoice_canOutputPremiumVoice)
      v3 = CFSTR("YES");
    else
      v3 = CFSTR("NO");
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_22701A000, v2, OS_LOG_TYPE_INFO, "canOutputPremiumVoice: %@", (uint8_t *)&v5, 0xCu);
  }

  return _canOutputPremiumVoice_canOutputPremiumVoice;
}

uint64_t __49__AXTapToSpeakTimeManager__canOutputPremiumVoice__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  _canOutputPremiumVoice_canOutputPremiumVoice = result;
  return result;
}

- (void)_setupAudioSessionForVoice:(unint64_t)a3
{
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  AXLogTapticTime();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    if (a3 - 1 > 3)
      v5 = CFSTR("Default");
    else
      v5 = *(&off_24EF4E988 + a3 - 1);
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_22701A000, v4, OS_LOG_TYPE_INFO, "Setting up audio session for %@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCategory:withOptions:error:", *MEMORY[0x24BDB15D0], 19, 0);
  objc_msgSend(v6, "setActive:error:", 1, 0);

}

- (void)speechOutputDidComplete
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  AXLogTapticTime();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22701A000, v3, OS_LOG_TYPE_INFO, "Speech output did complete", buf, 2u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__AXTapToSpeakTimeManager_speechOutputDidComplete__block_invoke;
  block[3] = &unk_24EF4E840;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __50__AXTapToSpeakTimeManager_speechOutputDidComplete__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setActive:withOptions:error:", 0, 1, 0);

  return objc_msgSend(*(id *)(a1 + 32), "_denormalizeVolumeIfNecessary");
}

- (void)speechSynthesizer:(id)a3 didStartSpeechUtterance:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  AXLogTapticTime();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_22701A000, v5, OS_LOG_TYPE_INFO, "did start AVSpeechUtterance: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)speechSynthesizer:(id)a3 didFinishSpeechUtterance:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  AXLogTapticTime();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_22701A000, v6, OS_LOG_TYPE_INFO, "did finish AVSpeechUtterance: %@", (uint8_t *)&v7, 0xCu);
  }

  -[AXTapToSpeakTimeManager speechOutputDidComplete](self, "speechOutputDidComplete");
}

- (void)speechSynthesizer:(id)a3 didCancelSpeechUtterance:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  AXLogTapticTime();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_22701A000, v6, OS_LOG_TYPE_INFO, "did cancel AVSpeechUtterance: %@", (uint8_t *)&v7, 0xCu);
  }

  -[AXTapToSpeakTimeManager speechOutputDidComplete](self, "speechOutputDidComplete");
}

- (AVSpeechSynthesizer)avSpeechSynthesizer
{
  return self->_avSpeechSynthesizer;
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (AXTapticTimeManager)tapticTimeManager
{
  return self->_tapticTimeManager;
}

- (float)lastMediaVolume
{
  return self->_lastMediaVolume;
}

- (void)setLastMediaVolume:(float)a3
{
  self->_lastMediaVolume = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapticTimeManager, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_avSpeechSynthesizer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_ttsSiriVoiceAssetForAFVoice:(uint64_t)a1 language:.cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x24BEB6258], "installedAssetsForLanguage:voiceType:", a1, 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22701A000, v2, v3, "TTSSiriAssetManager installedAssetsForLanguage: %@ voiceType: %ld\n%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)_ttsSiriVoiceAssetForAFVoice:(uint64_t)a1 language:.cold.2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x24BEB6258], "installedAssetsForLanguage:voiceType:", a1, 5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22701A000, v2, v3, "TTSSiriAssetManager installedAssetsForLanguage: %@ voiceType: %ld\n%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

@end
