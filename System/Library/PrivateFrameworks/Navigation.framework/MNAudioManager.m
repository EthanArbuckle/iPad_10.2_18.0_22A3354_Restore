@implementation MNAudioManager

- (MNAudioManager)initWithTransportType:(int)a3 voiceLanguage:(id)a4 guidanceLevelOverride:(unint64_t)a5
{
  uint64_t v6;
  __CFString *v8;
  MNAudioManager *v9;
  MNAudioManager *v10;
  NSObject *v11;
  uint64_t transportType;
  __CFString *v13;
  NSObject *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  MNUserOptions *options;
  NSObject *v21;
  MNUserOptions *v22;
  MNAudioSystemOptions *v23;
  MNAudioSystemOptions *audioSystemOptions;
  MNAudioHardwareEngine *v25;
  MNAudioHardwareEngine *audioEngine;
  objc_super v28;
  uint8_t buf[4];
  __CFString *v30;
  __int16 v31;
  __CFString *v32;
  uint64_t v33;

  v6 = *(_QWORD *)&a3;
  v33 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a4;
  if (-[__CFString length](v8, "length"))
  {
    v28.receiver = self;
    v28.super_class = (Class)MNAudioManager;
    v9 = -[MNAudioManager init](&v28, sel_init);
    v10 = v9;
    if (v9)
    {
      v9->_transportType = -[MNAudioManager _supportedTransportTypeForTransportType:](v9, "_supportedTransportTypeForTransportType:", v6);
      GetAudioLogForMNAudioManagerCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        transportType = v10->_transportType;
        if (transportType >= 7)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10->_transportType);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v13 = off_1E61D84F0[transportType];
        }
        v15 = v13;
        if (v6 >= 7)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = off_1E61D84F0[(int)v6];
        }
        *(_DWORD *)buf = 138412546;
        v30 = v15;
        v31 = 2112;
        v32 = v16;
        _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_INFO, "ⓜ Initialization: setting transport type to %@ (from transport type of %@)", buf, 0x16u);

      }
      +[MNUserOptionsEngine sharedInstance](MNUserOptionsEngine, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "options");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "copy");
      options = v10->_options;
      v10->_options = (MNUserOptions *)v19;

      GetAudioLogForMNAudioManagerCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = v10->_options;
        *(_DWORD *)buf = 138412546;
        v30 = v8;
        v31 = 2112;
        v32 = (__CFString *)v22;
        _os_log_impl(&dword_1B0AD7000, v21, OS_LOG_TYPE_INFO, "ⓜ Initialization: using voice language '%@' and setting these user options : %@", buf, 0x16u);
      }

      v23 = -[MNAudioSystemOptions initWithTempUserOptions:]([MNAudioSystemOptions alloc], "initWithTempUserOptions:", v10->_options);
      audioSystemOptions = v10->_audioSystemOptions;
      v10->_audioSystemOptions = v23;

      -[MNAudioSystemOptions registerObserver:](v10->_audioSystemOptions, "registerObserver:", v10);
      -[MNAudioSystemOptions setGuidanceLevelOverride:transportType:](v10->_audioSystemOptions, "setGuidanceLevelOverride:transportType:", a5, v6);
      v25 = -[MNAudioHardwareEngine initWithAudioSystemOptions:voiceLanguage:transportType:]([MNAudioHardwareEngine alloc], "initWithAudioSystemOptions:voiceLanguage:transportType:", v10->_audioSystemOptions, v8, v10->_transportType);
      audioEngine = v10->_audioEngine;
      v10->_audioEngine = v25;

      -[MNAudioHardwareEngine registerObserver:](v10->_audioEngine, "registerObserver:", v10);
    }
  }
  else
  {
    GetAudioLogForMNAudioManagerCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0AD7000, v14, OS_LOG_TYPE_INFO, "⒨ Initialization: voice language is nil or empty", buf, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[MNAudioSystemOptions unregisterObserver:](self->_audioSystemOptions, "unregisterObserver:", self);
  -[MNAudioHardwareEngine unregisterObserver:](self->_audioEngine, "unregisterObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)MNAudioManager;
  -[MNAudioManager dealloc](&v3, sel_dealloc);
}

- (unint64_t)voiceGuidanceLevel
{
  return -[MNAudioSystemOptions guidanceLevelForTransportType:](self->_audioSystemOptions, "guidanceLevelForTransportType:", self->_transportType);
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
    if ((objc_msgSend(v4, "conformsToProtocol:", &unk_1EEEE7920) & 1) != 0)
    {
      if (!self->_observers)
      {
        GetAudioLogForMNAudioManagerCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v11) = 0;
          _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEBUG, "ⓜ Creating observer table", (uint8_t *)&v11, 2u);
        }

        v7 = -[MNObserverHashTable initWithProtocol:]([MNObserverHashTable alloc], "initWithProtocol:", &unk_1EEEE7920);
        observers = self->_observers;
        self->_observers = v7;

      }
      GetAudioLogForMNAudioManagerCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v11 = 138412290;
        v12 = v5;
        _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_DEBUG, "ⓜ Adding observer : %@", (uint8_t *)&v11, 0xCu);
      }

      -[MNObserverHashTable registerObserver:](self->_observers, "registerObserver:", v5);
    }
    else
    {
      GetAudioLogForMNAudioManagerCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = 138412290;
        v12 = v5;
        _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_ERROR, "⒨ Object isn't a MNAudioManagerObserver : %@", (uint8_t *)&v11, 0xCu);
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
    v6 = objc_msgSend(v4, "conformsToProtocol:", &unk_1EEEE7920);
    GetAudioLogForMNAudioManagerCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    observers = (MNObserverHashTable *)v7;
    if ((v6 & 1) == 0)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v10 = 138412290;
        v11 = v5;
        _os_log_impl(&dword_1B0AD7000, &observers->super, OS_LOG_TYPE_ERROR, "⒨ Object isn't a MNAudioManagerObserver : %@", (uint8_t *)&v10, 0xCu);
      }
      goto LABEL_11;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1B0AD7000, &observers->super, OS_LOG_TYPE_DEBUG, "ⓜ Removing observer : %@", (uint8_t *)&v10, 0xCu);
    }

    -[MNObserverHashTable unregisterObserver:](self->_observers, "unregisterObserver:", v5);
    if (!-[MNObserverHashTable hasObservers](self->_observers, "hasObservers"))
    {
      GetAudioLogForMNAudioManagerCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_DEBUG, "ⓜ Observer table empty; destroying",
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
  uint64_t transportType;
  NSObject *v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  uint8_t buf[4];
  __CFString *v14;
  __int16 v15;
  __CFString *v16;
  __int16 v17;
  __CFString *v18;
  uint64_t v19;

  v3 = *(_QWORD *)&a3;
  v19 = *MEMORY[0x1E0C80C00];
  -[MNAudioManager clearAllAnnouncements](self, "clearAllAnnouncements");
  transportType = self->_transportType;
  self->_transportType = -[MNAudioManager _supportedTransportTypeForTransportType:](self, "_supportedTransportTypeForTransportType:", v3);
  GetAudioLogForMNAudioManagerCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = self->_transportType;
    if (v7 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_transportType);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E61D84F0[v7];
    }
    v9 = v8;
    if (v3 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v3);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E61D84F0[(int)v3];
    }
    v11 = v10;
    if (transportType >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), transportType);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E61D84F0[transportType];
    }
    *(_DWORD *)buf = 138412802;
    v14 = v9;
    v15 = 2112;
    v16 = v11;
    v17 = 2112;
    v18 = v12;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_INFO, "ⓜ Changing transport type to %@ (from transport type of %@); previous type was %@",
      buf,
      0x20u);

  }
  -[MNAudioHardwareEngine changeTransportType:](self->_audioEngine, "changeTransportType:", self->_transportType);
}

- (int)_supportedTransportTypeForTransportType:(int)a3
{
  if ((a3 & 0xFFFFFFFE) == 2)
    return a3;
  else
    return 0;
}

- (BOOL)voiceGuidanceEnabled
{
  NSObject *v3;
  uint64_t transportType;
  __CFString *v5;
  _BOOL4 v6;
  const char *v7;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!-[MNAudioManager voiceGuidanceLevel](self, "voiceGuidanceLevel"))
  {
    GetAudioLogForMNAudioManagerCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      transportType = self->_transportType;
      if (transportType >= 7)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_transportType);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = off_1E61D84F0[transportType];
      }
      *(_DWORD *)buf = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_INFO, "ⓜ Voice guidance not enabled - voice guidance for this transport type (%@) is None", buf, 0xCu);

    }
    goto LABEL_14;
  }
  if (self->_transportType == 1)
  {
    GetAudioLogForMNAudioManagerCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_INFO, "ⓜ Voice guidance not enabled - for Transit", buf, 2u);
    }
LABEL_14:
    LOBYTE(v6) = 0;
    goto LABEL_15;
  }
  v6 = -[MNAudioManager _deviceSettingsAllowSpeech](self, "_deviceSettingsAllowSpeech");
  GetAudioLogForMNAudioManagerCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v7 = "not";
    if (v6)
      v7 = "is";
    *(_DWORD *)buf = 136315138;
    v10 = (void *)v7;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_INFO, "ⓜ Voice guidance %s enabled", buf, 0xCu);
  }
LABEL_15:

  return v6;
}

- (BOOL)_deviceSettingsAllowSpeech
{
  _BOOL4 v2;
  void *v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  const char *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  int v13;
  const char *v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((self->_transportType & 0xFFFFFFFE) == 2)
  {
    v2 = +[MNAudioHardwareEngine headphonesAreInUse](MNAudioHardwareEngine, "headphonesAreInUse");
    objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "attributeForKey:", *MEMORY[0x1E0D47FA8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    v6 = v2 | v5 ^ 1;
    GetAudioLogForMNAudioManagerCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = "DO NOT";
      v13 = 136315650;
      if (v6)
        v8 = "DO";
      v14 = v8;
      v15 = 1024;
      v16 = v2;
      v17 = 1024;
      v18 = v5;
      v9 = "ⓜ Device settings %s allow speech, headphonesInUse=%d, systemIsMuted=%d";
      v10 = v7;
      v11 = 24;
      goto LABEL_8;
    }
  }
  else
  {
    GetAudioLogForMNAudioManagerCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = 1;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      v9 = "ⓜ Device settings allow speech";
      v10 = v7;
      v11 = 2;
LABEL_8:
      _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v13, v11);
    }
  }

  return v6;
}

- (BOOL)_deviceIsMuted
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  int v6;
  NSObject *v7;
  const char *v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeForKey:", *MEMORY[0x1E0D47FA8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "getSilentMode");

  GetAudioLogForMNAudioManagerCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = "not";
    v10 = 136315650;
    if (v4 | v6)
      v8 = "is";
    v11 = v8;
    v12 = 1024;
    v13 = v4;
    v14 = 1024;
    v15 = v6 ^ 1;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_INFO, "ⓜ Device %s muted, systemMuted=%d, ringerSwitchEnabled=%d", (uint8_t *)&v10, 0x18u);
  }

  return v4 | v6;
}

- (void)requestSpeech:(id)a3 guidanceLevel:(unint64_t)a4 modifier:(unint64_t)a5 shortPromptType:(unint64_t)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  NSObject *v14;
  const char *v15;
  uint8_t *v16;
  void *v17;
  __int16 v18;
  uint8_t buf[2];

  v12 = a3;
  v13 = a7;
  if (!objc_msgSend(v12, "length"))
  {
    GetAudioLogForMNAudioManagerCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v15 = "⒨ String is empty";
      v16 = buf;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_12;
  }
  if (self->_transportType == 1)
  {
    GetAudioLogForMNAudioManagerCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v18 = 0;
      v15 = "ⓜ Voice guidance not enabled - for Transit";
      v16 = (uint8_t *)&v18;
LABEL_7:
      _os_log_impl(&dword_1B0AD7000, v14, OS_LOG_TYPE_INFO, v15, v16, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (a5 == 1)
    a6 |= 0x40uLL;
  objc_msgSend(v12, "_navigation_stringByMarkingAsNavigationText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNAudioHardwareEngine requestSpeech:guidanceLevel:shortPromptType:completionHandler:](self->_audioEngine, "requestSpeech:guidanceLevel:shortPromptType:completionHandler:", v17, a4, a6, v13);

LABEL_12:
}

- (void)forceDeactivate
{
  -[MNAudioHardwareEngine forceStop](self->_audioEngine, "forceStop");
}

- (void)stopSpeaking
{
  -[MNAudioHardwareEngine stop](self->_audioEngine, "stop");
}

- (BOOL)isSpeaking
{
  return -[MNAudioHardwareEngine speaking](self->_audioEngine, "speaking");
}

- (void)clearAllAnnouncements
{
  -[MNAudioHardwareEngine clearAlEvents](self->_audioEngine, "clearAlEvents");
}

- (BOOL)vibrateForShortPrompt:(unint64_t)a3
{
  NSObject *v4;
  uint64_t transportType;
  __CFString *v6;
  uint8_t buf[4];
  __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_transportType > 1u)
  {
    if (-[MNAudioManager voiceGuidanceEnabled](self, "voiceGuidanceEnabled"))
      return -[MNAudioHardwareEngine vibrateForShortPrompt:](self->_audioEngine, "vibrateForShortPrompt:", a3);
    GetAudioLogForMNAudioManagerCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_INFO, "ⓜ Vibration ignored - voice guidance is muted", buf, 2u);
    }
  }
  else
  {
    GetAudioLogForMNAudioManagerCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      transportType = self->_transportType;
      if (transportType >= 7)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_transportType);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E61D84F0[transportType];
      }
      *(_DWORD *)buf = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_INFO, "ⓜ Vibration ignored - transport type doesn't support vibration: %@", buf, 0xCu);

    }
  }

  return 0;
}

- (void)setVoiceGuidanceLevelOverride:(unint64_t)a3
{
  -[MNAudioSystemOptions setGuidanceLevelOverride:transportType:](self->_audioSystemOptions, "setGuidanceLevelOverride:transportType:", a3, self->_transportType);
}

- (double)durationOf:(id)a3
{
  double result;

  -[MNAudioHardwareEngine durationOf:](self->_audioEngine, "durationOf:", a3);
  return result;
}

- (void)audioHardwareEngine:(id)a3 didActivateAudioSession:(BOOL)a4
{
  -[MNObserverHashTable audioManager:didActivateAudioSession:](self->_observers, "audioManager:didActivateAudioSession:", self, a4);
}

- (void)audioHardwareEngine:(id)a3 didStartSpeakingPrompt:(id)a4
{
  -[MNObserverHashTable audioManager:didStartSpeakingPrompt:](self->_observers, "audioManager:didStartSpeakingPrompt:", self, a4);
}

- (void)audioSystemOptions:(id)a3 didChangeGuidanceLevel:(unint64_t)a4 transportType:(int)a5
{
  if (self->_transportType == a5)
    -[MNObserverHashTable audioManager:didChangeVoiceGuidanceLevel:](self->_observers, "audioManager:didChangeVoiceGuidanceLevel:", self, a4);
}

- (int)transportType
{
  return self->_transportType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioSystemOptions, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_audioEngine, 0);
}

@end
