@implementation CSFPreferences

+ (id)sharedPreferences
{
  if (sharedPreferences_onceToken != -1)
    dispatch_once(&sharedPreferences_onceToken, &__block_literal_global_7019);
  return (id)sharedPreferences_sSharedPreferences;
}

- (BOOL)programmableAudioInjectionEnabled
{
  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal && programmableAudioInjectionEnabled_onceToken != -1)
    dispatch_once(&programmableAudioInjectionEnabled_onceToken, &__block_literal_global_170);
  return programmableAudioInjectionEnabled_enabled;
}

- (BOOL)voiceTriggerEnabled
{
  char v3;
  void *v4;
  void *v5;

  if (CSIsTorpedo_onceToken != -1)
    dispatch_once(&CSIsTorpedo_onceToken, &__block_literal_global_2532);
  if (CSIsTorpedo_isTorpedo)
    return 1;
  CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
  v4 = (void *)CFPreferencesCopyAppValue(CFSTR("VoiceTrigger Enabled"), CFSTR("com.apple.voicetrigger"));
  v5 = v4;
  if (v4)
  {
    v3 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    -[CSFPreferences _storeModeEnabled](self, "_storeModeEnabled");
    v3 = 0;
  }

  return v3;
}

- (BOOL)phraseSpotterEnabled
{
  void *v3;
  void *v4;
  int v5;

  CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("Phrase Detector Enabled"), CFSTR("com.apple.voicetrigger"));
  v4 = v3;
  if (v3)
    LOBYTE(v5) = objc_msgSend(v3, "BOOLValue");
  else
    v5 = !-[CSFPreferences _storeModeEnabled](self, "_storeModeEnabled");

  return v5;
}

- (void)setVoiceTriggerEverUsed
{
  if (setVoiceTriggerEverUsed_onceToken != -1)
    dispatch_once(&setVoiceTriggerEverUsed_onceToken, &__block_literal_global_16);
}

- (BOOL)isAttentiveSiriEnabled
{
  return +[CSUtils isAttentiveSiriEnabled](CSUtils, "isAttentiveSiriEnabled");
}

- (BOOL)isAttentiveSiriAudioLoggingEnabled
{
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (isAttentiveSiriAudioLoggingEnabled_onceToken != -1)
    dispatch_once(&isAttentiveSiriAudioLoggingEnabled_onceToken, &__block_literal_global_20);
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[CSFPreferences isAttentiveSiriAudioLoggingEnabled]";
    v6 = 1024;
    v7 = isAttentiveSiriAudioLoggingEnabled_enabled;
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s enabled:%u", (uint8_t *)&v4, 0x12u);
  }
  return isAttentiveSiriAudioLoggingEnabled_enabled;
}

- (BOOL)isGazeSimlModelEnabled
{
  void *v2;
  int v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("Gaze SIML Model Enabled"), CFSTR("com.apple.voicetrigger"));
  if (!v2)
    goto LABEL_6;
  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
LABEL_6:
    v3 = 1;
  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[CSFPreferences isGazeSimlModelEnabled]";
    v8 = 1024;
    v9 = v3;
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s enabled:%u", (uint8_t *)&v6, 0x12u);
  }

  return v3;
}

- (BOOL)isGazeMandatory
{
  if (isGazeMandatory_onceToken != -1)
    dispatch_once(&isGazeMandatory_onceToken, &__block_literal_global_25);
  return isGazeMandatory_gazeNeeded;
}

- (BOOL)isGazeSignalEnabled
{
  if (isGazeSignalEnabled_onceToken != -1)
    dispatch_once(&isGazeSignalEnabled_onceToken, &__block_literal_global_28);
  return isGazeSignalEnabled_enableGaze;
}

- (BOOL)isDeferredActivationEnabled
{
  return 0;
}

- (BOOL)isDeferredAsrResultsEnabled
{
  if (isDeferredAsrResultsEnabled_onceToken != -1)
    dispatch_once(&isDeferredAsrResultsEnabled_onceToken, &__block_literal_global_31);
  return isDeferredAsrResultsEnabled_deferredASRResultsEnabled;
}

- (BOOL)twoShotNotificationEnabled
{
  void *v2;
  void *v3;
  char v4;

  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (!CSIsInternalBuild_isInternal)
    return 1;
  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("Enable Two Shot Notification"), CFSTR("com.apple.voicetrigger"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (float)getAttendingTimeoutConfig
{
  float v2;
  void *v3;
  float v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  if (CSIsHorseman_isHorseman)
    v2 = 10.0;
  else
    v2 = 0.0;
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("Attending Timeout"), CFSTR("com.apple.voicetrigger"));
  if (v3)
  {
    if (CSIsInternalBuild_onceToken != -1)
      dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
    if (CSIsInternalBuild_isInternal)
    {
      objc_msgSend(v3, "floatValue");
      v2 = v4;
    }
  }
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[CSFPreferences getAttendingTimeoutConfig]";
    v9 = 2048;
    v10 = v2;
    _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s attendingTimeout: %f", (uint8_t *)&v7, 0x16u);
  }

  return v2;
}

- (BOOL)_storeModeEnabled
{
  void *v2;
  void *v3;
  char v4;

  CFPreferencesAppSynchronize(CFSTR("com.apple.demo-settings"));
  CFPreferencesCopyAppValue(CFSTR("StoreDemoMode"), CFSTR("com.apple.demo-settings"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "BOOLValue");
    CFRelease(v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setFileLoggingIsEnabled:(BOOL)a3
{
  void *v3;

  if (a3)
    v3 = &unk_1E68A1960;
  else
    v3 = 0;
  -[CSFPreferences setFileLoggingLevel:](self, "setFileLoggingLevel:", v3);
}

- (BOOL)fileLoggingIsEnabled
{
  void *v3;
  BOOL v4;

  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  if (CSIsHorseman_isHorseman)
    goto LABEL_7;
  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (!CSIsInternalBuild_isInternal)
    return 0;
LABEL_7:
  -[CSFPreferences fileLoggingLevel](self, "fileLoggingLevel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (int)objc_msgSend(v3, "intValue") > 0;

  return v4;
}

- (BOOL)_isAdaptiveSiriVolumeDisabled
{
  void *v2;
  void *v3;
  char v4;

  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  if (!CSIsHorseman_isHorseman)
  {
    if (CSIsHorsemanJunior_onceToken != -1)
      dispatch_once(&CSIsHorsemanJunior_onceToken, &__block_literal_global_13);
    if (!CSIsHorsemanJunior_isHorsemanJunior)
      return 1;
  }
  if (!_os_feature_enabled_impl())
    return 1;
  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("Adaptive Siri Volume Disabled"), CFSTR("com.apple.voicetrigger"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)disableAdaptiveSiriVolume:(id)a3
{
  _CSPreferencesSetValueForKey(a3, CFSTR("Adaptive Siri Volume Disabled"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
}

- (id)fileLoggingLevel
{
  void *v2;

  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
    v2 = (void *)CFPreferencesCopyAppValue(CFSTR("File Logging Level"), CFSTR("com.apple.voicetrigger"));
  else
    v2 = 0;
  return v2;
}

- (void)setFileLoggingLevel:(id)a3
{
  _CSPreferencesSetValueForKey(a3, CFSTR("File Logging Level"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
}

- (id)baseDir
{
  void *v2;
  void *v3;

  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
  {
    objc_msgSend(CFSTR("/var/mobile"), "stringByAppendingPathComponent:", CFSTR("Library"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CPSharedResourcesDirectory();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Library"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)voiceTriggerAudioLogDirectory
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CSFPreferences_voiceTriggerAudioLogDirectory__block_invoke;
  block[3] = &unk_1E6881138;
  block[4] = self;
  if (voiceTriggerAudioLogDirectory_onceToken != -1)
    dispatch_once(&voiceTriggerAudioLogDirectory_onceToken, block);
  return (id)voiceTriggerAudioLogDirectory_path;
}

- (id)geckoAudioLogDirectory
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__CSFPreferences_geckoAudioLogDirectory__block_invoke;
  block[3] = &unk_1E6881138;
  block[4] = self;
  if (geckoAudioLogDirectory_onceToken != -1)
    dispatch_once(&geckoAudioLogDirectory_onceToken, block);
  return (id)geckoAudioLogDirectory_path;
}

- (id)getLegacyOnDeviceCompilationCacheDirectory
{
  void *v2;
  void *v3;

  -[CSFPreferences baseDir](self, "baseDir");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Caches/CoreSpeech/"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)getOnDeviceCompilationCacheDirectory
{
  void *v2;
  void *v3;

  -[CSFPreferences _getCoreSpeechGroupContainerPath](self, "_getCoreSpeechGroupContainerPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Caches/onDeviceCompilationCaches/"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)getOnDeviceCompilationCacheDirectoryForBenchmark
{
  void *v2;
  void *v3;

  -[CSFPreferences _getCoreSpeechGroupContainerPath](self, "_getCoreSpeechGroupContainerPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Caches/benchmarkTempOnDeviceCompilationCaches/Siri/"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)mhLogDirectory
{
  void *v2;
  void *v3;

  -[CSFPreferences baseDir](self, "baseDir");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("/Logs/CrashReporter/Assistant/MHLog/"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)remoteP2pLogDirectory
{
  void *v2;
  void *v3;

  -[CSFPreferences baseDir](self, "baseDir");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("VoiceTrigger/RemoteP2PLogs/"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)remoteGradingDataDirectory
{
  void *v2;
  void *v3;

  -[CSFPreferences remoteP2pLogDirectory](self, "remoteP2pLogDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("RemoteGradingData/"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)ssvLogDirectory
{
  void *v2;
  void *v3;

  -[CSFPreferences baseDir](self, "baseDir");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("/Logs/CrashReporter/Assistant/smartSiriVolumeContextAwareLogs/"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)getSSVLogFilePathWithSessionIdentifier:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  NSObject *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  __CFString *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CSFPreferences baseDir](self, "baseDir");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Logs/CrashReporter/Assistant/smartSiriVolumeContextAwareLogs/"));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v6, 0);

  if ((v8 & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v11 = objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v17);
    v9 = v17;

    if ((v11 & 1) == 0)
    {
      v12 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        v15 = v12;
        objc_msgSend(v9, "localizedDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v19 = "-[CSFPreferences getSSVLogFilePathWithSessionIdentifier:]";
        v20 = 2114;
        v21 = v6;
        v22 = 2114;
        v23 = v16;
        _os_log_error_impl(&dword_1B502E000, v15, OS_LOG_TYPE_ERROR, "%s Couldn't create SSV log directory at path %{public}@ %{public}@", buf, 0x20u);

      }
      v6 = CFSTR("/tmp");
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/SSV_%@.json"), v6, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)trialBaseAssetDirectory
{
  void *v2;
  void *v3;

  -[CSFPreferences baseDir](self, "baseDir");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("VoiceTrigger/TrialAssetData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)assistantLogDirectory
{
  void *v2;
  void *v3;

  -[CSFPreferences baseDir](self, "baseDir");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("/Logs/CrashReporter/Assistant/"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)assistantAudioFileLogDirectory
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[CSFPreferences assistantLogDirectory](self, "assistantLogDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("SpeechLogs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v5 = objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v9);
  v6 = v9;

  if ((v5 & 1) == 0)
  {
    v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v11 = "-[CSFPreferences assistantAudioFileLogDirectory]";
      v12 = 2114;
      v13 = v3;
      v14 = 2114;
      v15 = v6;
      _os_log_error_impl(&dword_1B502E000, v7, OS_LOG_TYPE_ERROR, "%s Couldn't create speech log directory at path %{public}@ %{public}@", buf, 0x20u);
    }
  }

  return v3;
}

- (id)myriadHashDirectory
{
  void *v2;
  void *v3;

  -[CSFPreferences baseDir](self, "baseDir");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("VoiceTrigger"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)myriadHashFilePath
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[CSFPreferences myriadHashDirectory](self, "myriadHashDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", v2);

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v2, 1, 0, 0);

  }
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("siriBC"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)secondPassAudioLoggingEnabled
{
  void *v2;
  void *v3;
  char v4;

  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (!CSIsInternalBuild_isInternal)
    return 0;
  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("Second Pass Audio Logging Enabled"), CFSTR("com.apple.voicetrigger"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)speakerRecognitionAudioLoggingEnabled
{
  if (speakerRecognitionAudioLoggingEnabled_onceToken != -1)
    dispatch_once(&speakerRecognitionAudioLoggingEnabled_onceToken, &__block_literal_global_91);
  return speakerRecognitionAudioLoggingEnabled_speakerRecognitionAudioLogging;
}

- (BOOL)personalizedSiriEnrollmentAudioLoggingEnabled
{
  if (personalizedSiriEnrollmentAudioLoggingEnabled_onceToken != -1)
    dispatch_once(&personalizedSiriEnrollmentAudioLoggingEnabled_onceToken, &__block_literal_global_94);
  return personalizedSiriEnrollmentAudioLoggingEnabled_audioLoggingEnabled;
}

- (BOOL)jarvisAudioLoggingEnabled
{
  void *v2;
  void *v3;
  char v4;

  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (!CSIsInternalBuild_isInternal)
    return 0;
  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("Jarvis Audio Logging Enabled"), CFSTR("com.apple.voicetrigger"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)setJarvisTriggerMode:(int64_t)a3
{
  int v4;
  void *v5;
  void *v6;
  void *v7;
  __CFNotificationCenter *DarwinNotifyCenter;

  v4 = 5;
  while (1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _CSPreferencesSetValueForKey(v5, CFSTR("Jarvis Trigger Mode"));

    CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
    v6 = (void *)CFPreferencesCopyAppValue(CFSTR("Jarvis Trigger Mode"), CFSTR("com.apple.voicetrigger"));
    v7 = v6;
    if (v6)
    {
      if (objc_msgSend(v6, "integerValue") == a3)
        break;
    }

    if (!--v4)
      goto LABEL_7;
  }

LABEL_7:
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("kCSPreferencesJarvisTriggerModeDidChangeDarwinNotification"), 0, 0, 1u);
}

- (int64_t)getJarvisTriggerMode
{
  void *v2;
  void *v3;
  int64_t v4;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("Jarvis Trigger Mode"), CFSTR("com.apple.voicetrigger"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 2;

  return v4;
}

- (BOOL)startOfSpeechAudioLoggingEnabled
{
  void *v2;
  void *v3;
  char v4;

  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (!CSIsInternalBuild_isInternal)
    return 0;
  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("Enable SoS Audio Logging"), CFSTR("com.apple.voicetrigger"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)forceVoiceTriggerAPMode
{
  if (forceVoiceTriggerAPMode_onceToken != -1)
    dispatch_once(&forceVoiceTriggerAPMode_onceToken, &__block_literal_global_104_6929);
  return forceVoiceTriggerAPMode_result;
}

- (BOOL)forceVoiceTriggerAOPMode
{
  if (forceVoiceTriggerAOPMode_onceToken != -1)
    dispatch_once(&forceVoiceTriggerAOPMode_onceToken, &__block_literal_global_111);
  return forceVoiceTriggerAOPMode_result;
}

- (void)_updatePreferenceSettingsForAccessory:(id)a3 settingsUpdateBlock:(id)a4
{
  void (**v5)(id, id);
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v5 = (void (**)(id, id))a4;
  v6 = (void *)CFPreferencesCopyAppValue(CFSTR("RemoraDevices"), CFSTR("com.apple.voicetrigger"));
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v7 = (id)objc_msgSend(v6, "mutableCopy");
  else
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = v7;

  if (v13)
  {
    objc_msgSend(v8, "objectForKey:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v10 = (id)objc_msgSend(v9, "mutableCopy");
    else
      v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11 = v10;
    v5[2](v5, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v8, "setObject:forKey:", v12, v13);
      _CSPreferencesSetValueForKey(v8, CFSTR("RemoraDevices"));
    }

  }
}

- (void)setBooleanAccessorySettingValue:(BOOL)a3 forKey:(id)a4 forAccessory:(id)a5
{
  _BOOL8 v6;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  _QWORD v11[4];
  __CFString *v12;
  BOOL v13;

  v6 = a3;
  v8 = (__CFString *)a4;
  v9 = v8;
  if (a5)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __70__CSFPreferences_setBooleanAccessorySettingValue_forKey_forAccessory___block_invoke;
    v11[3] = &unk_1E687F7A0;
    v13 = v6;
    v12 = v8;
    -[CSFPreferences _updatePreferenceSettingsForAccessory:settingsUpdateBlock:](self, "_updatePreferenceSettingsForAccessory:settingsUpdateBlock:", a5, v11);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _CSPreferencesSetValueForKey(v10, v9);

  }
}

- (void)setMediaPlayingSettingForAccessory:(id)a3 isMediaPlaying:(BOOL)a4 isInterrupted:(BOOL)a5 interruptedTime:(double)a6
{
  _BOOL4 v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  BOOL v11;
  BOOL v12;

  v7 = a5;
  if (a3)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __98__CSFPreferences_setMediaPlayingSettingForAccessory_isMediaPlaying_isInterrupted_interruptedTime___block_invoke;
    v10[3] = &__block_descriptor_42_e50___NSMutableDictionary_16__0__NSMutableDictionary_8l;
    v11 = a4;
    v12 = a5;
    *(double *)&v10[4] = a6;
    -[CSFPreferences _updatePreferenceSettingsForAccessory:settingsUpdateBlock:](self, "_updatePreferenceSettingsForAccessory:settingsUpdateBlock:", a3, v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _CSPreferencesSetValueForKey(v8, CFSTR("Accessory Media Playback Status"));

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      _CSPreferencesSetValueForKey(v9, CFSTR("Accessory Media Playback Interrupted Time"));

    }
  }
}

- (BOOL)getBooleanAccessorySettingValueForKey:(id)a3 forAccessory:(id)a4
{
  __CFString *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  char v11;
  void *v12;

  v5 = (__CFString *)a3;
  v6 = a4;
  v7 = (void *)CFPreferencesCopyAppValue(CFSTR("RemoraDevices"), CFSTR("com.apple.voicetrigger"));
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (v6)
    {
      objc_msgSend(v7, "objectForKey:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(v8, "objectForKey:", v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = objc_msgSend(v9, "BOOLValue");
        else
          v10 = 0;

      }
      else
      {
        v10 = 0;
      }

      v11 = v10 != 0;
    }
    else
    {
      v12 = (void *)CFPreferencesCopyAppValue(v5, CFSTR("com.apple.voicetrigger"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = objc_msgSend(v12, "BOOLValue");
      else
        v11 = 0;

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_clearAccessorySettingForKeys:(id)a3 forAccessory:(id)a4
{
  id v5;
  id v6;
  CFPropertyListRef v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
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
  v5 = a3;
  v6 = a4;
  v7 = CFPreferencesCopyAppValue(CFSTR("RemoraDevices"), CFSTR("com.apple.voicetrigger"));
  if (v7)
  {
    v8 = (void *)v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "mutableCopy");

      if (v6)
      {
        objc_msgSend(v9, "objectForKey:", v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v11 = (void *)objc_msgSend(v10, "mutableCopy");
            v17 = 0u;
            v18 = 0u;
            v19 = 0u;
            v20 = 0u;
            v12 = v5;
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
                  objc_msgSend(v11, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++), (_QWORD)v17);
                }
                while (v14 != v16);
                v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
              }
              while (v14);
            }

            objc_msgSend(v9, "setObject:forKey:", v11, v6);
            _CSPreferencesSetValueForKey(v9, CFSTR("RemoraDevices"));

          }
        }

      }
    }
    else
    {
      v9 = v8;
    }
  }
  else
  {
    v9 = 0;
  }

}

- (double)getMediaPlaybackInterruptedTime:(id)a3
{
  id v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v3 = a3;
  v4 = (void *)CFPreferencesCopyAppValue(CFSTR("RemoraDevices"), CFSTR("com.apple.voicetrigger"));
  v5 = 0.0;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v3)
      {
        objc_msgSend(v4, "objectForKey:", v3);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v6, "objectForKey:", CFSTR("Accessory Media Playback Interrupted Time"));
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v7, "doubleValue");
              v5 = v8;
            }

          }
        }
      }
      else
      {
        v6 = (void *)CFPreferencesCopyAppValue(CFSTR("Accessory Media Playback Interrupted Time"), CFSTR("com.apple.voicetrigger"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v6, "doubleValue");
          v5 = v9;
        }
      }

    }
  }

  return v5;
}

- (void)clearMediaPlaybackInterruptedTimeOnAccessory:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("Accessory Media Playback Interrupted Time");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSFPreferences _clearAccessorySettingForKeys:forAccessory:](self, "_clearAccessorySettingForKeys:forAccessory:", v6, v5, v7, v8);

}

- (BOOL)isMediaPlayingOnAccessory:(id)a3
{
  return -[CSFPreferences getBooleanAccessorySettingValueForKey:forAccessory:](self, "getBooleanAccessorySettingValueForKey:forAccessory:", CFSTR("Accessory Media Playback Status"), a3);
}

- (void)clearMediaPlayingStatusOnAccessory:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("Accessory Media Playback Status");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSFPreferences _clearAccessorySettingForKeys:forAccessory:](self, "_clearAccessorySettingForKeys:forAccessory:", v6, v5, v7, v8);

}

- (BOOL)isAlarmPlayingOnAccessory:(id)a3
{
  return -[CSFPreferences getBooleanAccessorySettingValueForKey:forAccessory:](self, "getBooleanAccessorySettingValueForKey:forAccessory:", CFSTR("Accessory Alarm Playback Status"), a3);
}

- (void)setIsAlarmPlayingOnAccessory:(id)a3 isAlarmPlaying:(BOOL)a4
{
  -[CSFPreferences setBooleanAccessorySettingValue:forKey:forAccessory:](self, "setBooleanAccessorySettingValue:forKey:forAccessory:", a4, CFSTR("Accessory Alarm Playback Status"), a3);
}

- (void)clearAlarmPlayingStatusOnAccessory:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("Accessory Alarm Playback Status");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSFPreferences _clearAccessorySettingForKeys:forAccessory:](self, "_clearAccessorySettingForKeys:forAccessory:", v6, v5, v7, v8);

}

- (BOOL)isTimerPlayingOnAccessory:(id)a3
{
  return -[CSFPreferences getBooleanAccessorySettingValueForKey:forAccessory:](self, "getBooleanAccessorySettingValueForKey:forAccessory:", CFSTR("Accessory Timer Playback Status"), a3);
}

- (void)setIsTimerPlayingOnAccessory:(id)a3 isTimerPlaying:(BOOL)a4
{
  -[CSFPreferences setBooleanAccessorySettingValue:forKey:forAccessory:](self, "setBooleanAccessorySettingValue:forKey:forAccessory:", a4, CFSTR("Accessory Timer Playback Status"), a3);
}

- (void)clearTimerPlayingStatusOnAccessory:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("Accessory Timer Playback Status");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSFPreferences _clearAccessorySettingForKeys:forAccessory:](self, "_clearAccessorySettingForKeys:forAccessory:", v6, v5, v7, v8);

}

- (void)clearMyriadSettingsOnAccessory:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("Accessory Media Playback Interrupted Time");
  v7[1] = CFSTR("Accessory Media Playback Status");
  v7[2] = CFSTR("Accessory Alarm Playback Status");
  v7[3] = CFSTR("Accessory Timer Playback Status");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", v7, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSFPreferences _clearAccessorySettingForKeys:forAccessory:](self, "_clearAccessorySettingForKeys:forAccessory:", v6, v5);

}

- (id)getStartOfSpeechAudioLogFilePath
{
  void *v2;
  __CFString *v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;
  void *v11;
  __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  NSObject *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  __CFString *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[CSFPreferences baseDir](self, "baseDir");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Logs/CrashReporter/CoreSpeech/sos/"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v3, 0);

  if ((v5 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v8 = objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v19);
    v6 = v19;

    if ((v8 & 1) == 0)
    {
      v9 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        v17 = v9;
        objc_msgSend(v6, "localizedDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v21 = "-[CSFPreferences getStartOfSpeechAudioLogFilePath]";
        v22 = 2114;
        v23 = v3;
        v24 = 2114;
        v25 = v18;
        _os_log_error_impl(&dword_1B502E000, v17, OS_LOG_TYPE_ERROR, "%s Couldn't create SoS log directory at path %{public}@ %{public}@", buf, 0x20u);

      }
      v3 = CFSTR("/tmp");
    }
  }
  v10 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v10, "setDateFormat:", CFSTR("yyyyMMdd_HHmmss.SSS"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFromDate:", v11);
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v13 = &stru_1E6885088;
  if (v12)
    v13 = v12;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v3, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)_isDirectory:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  BOOL v7;

  v7 = 0;
  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v4, &v7);

  return v7;
}

- (double)remoteVoiceTriggerDelayTime
{
  void *v2;
  void *v3;
  float v4;
  double v5;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("Remote VoiceTrigger Delay"), CFSTR("com.apple.voicetrigger"));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "floatValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (double)remoteVoiceTriggerEndpointTimeoutWithDefault:(double)a3
{
  void *v4;
  void *v5;
  float v6;

  v4 = (void *)CFPreferencesCopyAppValue(CFSTR("Remote VoiceTrigger Endpoint Timeout"), CFSTR("com.apple.voicetrigger"));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "floatValue");
    a3 = v6;
  }

  return a3;
}

- (id)interstitialRelativeDirForLevel:(int64_t)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("VoiceTrigger/interstitial"), "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)interstitialAbsoluteDirForLevel:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[CSFPreferences baseDir](self, "baseDir");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSFPreferences interstitialRelativeDirForLevel:](self, "interstitialRelativeDirForLevel:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)myriadFileLoggingEnabled
{
  if (myriadFileLoggingEnabled_onceToken != -1)
    dispatch_once(&myriadFileLoggingEnabled_onceToken, &__block_literal_global_157);
  return myriadFileLoggingEnabled_enabled;
}

- (BOOL)enableAudioInjection:(BOOL)a3
{
  return -[CSFPreferences enableAudioInjection:withKey:](self, "enableAudioInjection:withKey:", a3, CFSTR("Audio Injection Enabled"));
}

- (BOOL)enableBenchmarkService:(BOOL)a3
{
  BOOL v4;
  NSObject *v5;
  _QWORD v7[5];
  BOOL v8;
  __int128 buf;
  uint64_t v10;
  char v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v10 = 0x2020000000;
    v11 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41__CSFPreferences_enableBenchmarkService___block_invoke;
    v7[3] = &unk_1E687F808;
    v7[4] = &buf;
    v8 = a3;
    if (enableBenchmarkService__onceToken != -1)
      dispatch_once(&enableBenchmarkService__onceToken, v7);
    v4 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v5 = CSLogContextFacilityCoreSpeech;
    v4 = 0;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[CSFPreferences enableBenchmarkService:]";
      _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s benchmarkService: is only avaiable on internal builds", (uint8_t *)&buf, 0xCu);
      return 0;
    }
  }
  return v4;
}

- (BOOL)audioInjectionEnabled
{
  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal && audioInjectionEnabled_onceToken != -1)
    dispatch_once(&audioInjectionEnabled_onceToken, &__block_literal_global_164);
  return audioInjectionEnabled_enabled;
}

- (BOOL)enableProgrammableAudioInjection:(BOOL)a3
{
  return -[CSFPreferences enableAudioInjection:withKey:](self, "enableAudioInjection:withKey:", a3, CFSTR("Programmable Audio Injection Enabled"));
}

- (BOOL)useSpeexForAudioInjection
{
  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal && useSpeexForAudioInjection_onceToken != -1)
    dispatch_once(&useSpeexForAudioInjection_onceToken, &__block_literal_global_167);
  return useSpeexForAudioInjection_enabled;
}

- (BOOL)enableExclaveAudioInjection:(BOOL)a3
{
  _BOOL8 v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    v4 = (const __CFString *)*MEMORY[0x1E0C9B230];
    v5 = (void *)CFPreferencesCopyValue(CFSTR("Exclave Audio Injection Enabled"), CFSTR("com.apple.voicetrigger.notbackedup"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
    v6 = v5;
    if (v5)
    {
      LODWORD(v7) = objc_msgSend(v5, "BOOLValue");
      if ((_DWORD)v7 == v3)
        goto LABEL_13;
    }
    else if (!v3)
    {
      LOBYTE(v7) = 0;
      goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CFPreferencesSetValue(CFSTR("Exclave Audio Injection Enabled"), v7, CFSTR("com.apple.voicetrigger.notbackedup"), CFSTR("mobile"), v4);

    CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger.notbackedup"));
    LOBYTE(v7) = v3;
LABEL_13:

    return (char)v7;
  }
  v8 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    v10 = 136315138;
    v11 = "-[CSFPreferences enableExclaveAudioInjection:]";
    _os_log_error_impl(&dword_1B502E000, v8, OS_LOG_TYPE_ERROR, "%s Exclave Audio Injection is only available on internal builds", (uint8_t *)&v10, 0xCu);
  }
  LOBYTE(v7) = 0;
  return (char)v7;
}

- (BOOL)exclaveAudioInjectionEnabled
{
  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal && exclaveAudioInjectionEnabled_onceToken != -1)
    dispatch_once(&exclaveAudioInjectionEnabled_onceToken, &__block_literal_global_173);
  return exclaveAudioInjectionEnabled_enabled;
}

- (BOOL)enableAudioInjection:(BOOL)a3 withKey:(__CFString *)a4
{
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v5 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    v6 = (void *)CFPreferencesCopyValue(a4, CFSTR("com.apple.voicetrigger"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
    v7 = v6;
    if (v6)
    {
      LODWORD(v8) = objc_msgSend(v6, "BOOLValue");
      if ((_DWORD)v8 == v5)
        goto LABEL_12;
    }
    else if (!v5)
    {
      LOBYTE(v8) = 0;
      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _CSPreferencesSetValueForKeyFromRoot(v8, a4);

    CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
    LOBYTE(v8) = v5;
LABEL_12:

    return (char)v8;
  }
  v9 = CSLogContextFacilityCoreSpeech;
  LOBYTE(v8) = 0;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[CSFPreferences enableAudioInjection:withKey:]";
    _os_log_impl(&dword_1B502E000, v9, OS_LOG_TYPE_DEFAULT, "%s enableAudioInection: is only available on internal builds", (uint8_t *)&v11, 0xCu);
    LOBYTE(v8) = 0;
  }
  return (char)v8;
}

- (void)setAudioInjectionFilePath:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    _CSPreferencesSetValueForKey(v3, CFSTR("Audio Injection File Path"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
  }
  else
  {
    v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[CSFPreferences setAudioInjectionFilePath:]";
      _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s setAudioInjectionFilePath: is only available on internal builds", (uint8_t *)&v5, 0xCu);
    }
  }

}

- (id)audioInjectionFilePath
{
  id v2;
  void *v3;
  NSObject *v4;
  BOOL v5;
  char v6;
  NSObject *v7;
  _QWORD v9[5];
  _BYTE buf[24];
  char v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (!CSIsInternalBuild_isInternal)
    goto LABEL_18;
  v2 = (id)CFPreferencesCopyAppValue(CFSTR("Audio Injection File Path"), CFSTR("com.apple.voicetrigger"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[CSFPreferences audioInjectionFilePath]";
      _os_log_error_impl(&dword_1B502E000, v7, OS_LOG_TYPE_ERROR, "%s kCSAudioInjectionFilePathKey is not array type", buf, 0xCu);
    }
    goto LABEL_17;
  }
  v2 = v2;
  v3 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[CSFPreferences audioInjectionFilePath]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = objc_msgSend(v2, "count");
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s kCSAudioInjectionFilePathKey array size = %d", buf, 0x12u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v11 = 1;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__CSFPreferences_audioInjectionFilePath__block_invoke;
  v9[3] = &unk_1E687F890;
  v9[4] = buf;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v9);
  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    v5 = v2 == 0;
  else
    v5 = 1;
  v6 = v5;
  _Block_object_dispose(buf, 8);

  if ((v6 & 1) != 0)
  {
LABEL_17:

LABEL_18:
    v2 = 0;
  }
  return v2;
}

- (BOOL)isPHSSupported
{
  return 1;
}

- (BOOL)_isRemoteVoiceTriggerAvailable
{
  return 0;
}

- (BOOL)isSpeakerRecognitionAvailable
{
  void *v2;
  void *v3;
  char v4;

  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (!CSIsInternalBuild_isInternal)
    return 1;
  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("SpeakerId Enabled"), CFSTR("com.apple.voicetrigger"));
  if (!v2)
    return 1;
  v3 = v2;
  v4 = objc_msgSend(v2, "BOOLValue");

  return v4;
}

- (unint64_t)speakerIdScoreReportingType
{
  unint64_t v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CSFPreferences_speakerIdScoreReportingType__block_invoke;
  block[3] = &unk_1E6880290;
  block[4] = &v5;
  if (speakerIdScoreReportingType_onceToken != -1)
    dispatch_once(&speakerIdScoreReportingType_onceToken, block);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)smartSiriVolumeSoftVolumeEnabled
{
  void *v2;
  void *v3;
  char v4;

  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  if (!CSIsHorseman_isHorseman)
    return 0;
  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (!CSIsInternalBuild_isInternal)
    return 0;
  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("SmartSiriVolume SoftVolume Enabled"), CFSTR("com.apple.voicetrigger"));
  if (!v2)
    return 0;
  v3 = v2;
  v4 = objc_msgSend(v2, "BOOLValue");

  return v4;
}

- (BOOL)smartSiriVolumeContextAwareLoggingEnabled
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__CSFPreferences_smartSiriVolumeContextAwareLoggingEnabled__block_invoke;
  block[3] = &unk_1E6881138;
  block[4] = self;
  if (smartSiriVolumeContextAwareLoggingEnabled_onceToken != -1)
    dispatch_once(&smartSiriVolumeContextAwareLoggingEnabled_onceToken, block);
  return smartSiriVolumeContextAwareLoggingEnabled_enabled;
}

- (BOOL)smartSiriVolumeContextAwareEnabled
{
  return !-[CSFPreferences _isAdaptiveSiriVolumeDisabled](self, "_isAdaptiveSiriVolumeDisabled");
}

- (BOOL)isAdaptiveSiriVolumeTemporaryIntentValid
{
  void *v2;
  CFPropertyListRef v3;
  void *v4;
  BOOL v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  double v9;
  unint64_t v10;
  BOOL v11;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("Adaptive Siri Volume State Intent Time"), CFSTR("com.apple.voicetrigger"));
  v3 = CFPreferencesCopyAppValue(CFSTR("Adaptive Siri Volume State Intent Valid For Seconds"), CFSTR("com.apple.voicetrigger"));
  v4 = (void *)v3;
  if (v2)
    v5 = v3 == 0;
  else
    v5 = 1;
  v11 = 0;
  if (!v5)
  {
    v6 = objc_msgSend(v2, "longLongValue");
    v7 = objc_msgSend(v4, "unsignedLongLongValue");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSince1970");
    v10 = (unint64_t)(v9 - (double)v6);

    if (v7 > v10)
      v11 = 1;
  }

  return v11;
}

- (BOOL)isAdaptiveSiriVolumePermanentOffsetEnabled
{
  void *v2;
  void *v3;
  char v4;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("Adaptive Siri Volume State Permanent Offset Enabled"), CFSTR("com.apple.voicetrigger"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (float)adaptiveSiriVolumePermanentOffset
{
  void *v2;
  void *v3;
  float v4;
  float v5;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("Adaptive Siri Volume State Permanent Offset Factor"), CFSTR("com.apple.voicetrigger"));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "floatValue");
    v5 = v4;
  }
  else
  {
    v5 = 1.0;
  }

  return v5;
}

- (int)adaptiveSiriVolumeRecentIntent
{
  void *v2;
  void *v3;
  int v4;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("Adaptive Siri Volume State Intent Type"), CFSTR("com.apple.voicetrigger"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 0;

  return v4;
}

- (unint64_t)maxNumLoggingFiles
{
  void *v2;
  void *v3;
  unint64_t v4;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("Max Number Logging Files"), CFSTR("com.apple.voicetrigger"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 5;

  return v4;
}

- (unint64_t)maxNumGradingFiles
{
  void *v2;
  void *v3;
  unint64_t v4;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("Max Number Grading Files"), CFSTR("com.apple.voicetrigger"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 50;

  return v4;
}

- (BOOL)useSiriActivationSPIForHomePod
{
  if (useSiriActivationSPIForHomePod_onceToken != -1)
    dispatch_once(&useSiriActivationSPIForHomePod_onceToken, &__block_literal_global_197);
  return useSiriActivationSPIForHomePod_ret;
}

- (BOOL)useSiriActivationSPIForwatchOS
{
  if (useSiriActivationSPIForwatchOS_onceToken != -1)
    dispatch_once(&useSiriActivationSPIForwatchOS_onceToken, &__block_literal_global_200);
  return useSiriActivationSPIForwatchOS_ret;
}

- (BOOL)shouldOverwriteRemoteVADScore
{
  if (shouldOverwriteRemoteVADScore_onceToken != -1)
    dispatch_once(&shouldOverwriteRemoteVADScore_onceToken, &__block_literal_global_203);
  return shouldOverwriteRemoteVADScore_ret;
}

- (float)overwritingRemoteVADScore
{
  if (overwritingRemoteVADScore_onceToken != -1)
    dispatch_once(&overwritingRemoteVADScore_onceToken, &__block_literal_global_206);
  return *(float *)&overwritingRemoteVADScore_overrideScore;
}

- (void)setHearstFirstPassModelVersion:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  if (CSIsInternalBuild_onceToken != -1)
  {
    v5 = v3;
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
    v3 = v5;
  }
  if (CSIsInternalBuild_isInternal)
  {
    v4 = v3;
    CFPreferencesSetValue(CFSTR("Hearst First Pass Model Version"), v3, CFSTR("com.apple.voicetrigger.notbackedup"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
    CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger.notbackedup"));
    v3 = v4;
  }

}

- (void)setHearstSecondPassModelVersion:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  if (CSIsInternalBuild_onceToken != -1)
  {
    v5 = v3;
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
    v3 = v5;
  }
  if (CSIsInternalBuild_isInternal)
  {
    v4 = v3;
    CFPreferencesSetValue(CFSTR("Hearst Second Pass Model Version"), v3, CFSTR("com.apple.voicetrigger.notbackedup"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
    CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger.notbackedup"));
    v3 = v4;
  }

}

- (id)fakeHearstModelPath
{
  void *v2;
  id v3;

  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    v2 = (void *)CFPreferencesCopyValue(CFSTR("Hearst Fake Model Path"), CFSTR("com.apple.voicetrigger"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
    if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v3 = v2;
    else
      v3 = 0;

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)setFakeHearstModelPath:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  if (CSIsInternalBuild_onceToken == -1)
  {
    if (!v3)
      goto LABEL_5;
  }
  else
  {
    v5 = v3;
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
    v3 = v5;
    if (!v5)
      goto LABEL_5;
  }
  if (CSIsInternalBuild_isInternal)
  {
    v4 = v3;
    _CSPreferencesSetValueForKeyFromRoot(v3, CFSTR("Hearst Fake Model Path"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
    v3 = v4;
  }
LABEL_5:

}

- (BOOL)companionSyncVoiceTriggerUtterancesEnabled
{
  void *v2;
  void *v3;
  char v4;

  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  if (!CSIsHorseman_isHorseman)
    return 0;
  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (!CSIsInternalBuild_isInternal)
    return 0;
  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("VoiceTrigger Companion Sync Enabled"), CFSTR("com.apple.voicetrigger"));
  if (!v2)
    return 0;
  v3 = v2;
  v4 = objc_msgSend(v2, "BOOLValue");

  return v4;
}

- (BOOL)opportuneSpeakListenerBypassEnabled
{
  void *v2;
  void *v3;
  char v4;

  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (!CSIsInternalBuild_isInternal)
    return 0;
  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("Enable OpportuneSpeakListener Bypass"), CFSTR("com.apple.voicetrigger"));
  if (!v2)
    return 0;
  v3 = v2;
  v4 = objc_msgSend(v2, "BOOLValue");

  return v4;
}

- (BOOL)bypassPersonalizedHeySiri
{
  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger.notbackedup"));
    if (bypassPersonalizedHeySiri_onceToken != -1)
      dispatch_once(&bypassPersonalizedHeySiri_onceToken, &__block_literal_global_217);
  }
  return bypassPersonalizedHeySiri_bypassPersonalizedHeySiri;
}

- (BOOL)isMphVTEnabled
{
  if (isMphVTEnabled_onceToken != -1)
    dispatch_once(&isMphVTEnabled_onceToken, &__block_literal_global_220);
  return isMphVTEnabled_mphVTEnabled;
}

- (BOOL)isMultiChannelAudioLoggingEnabled
{
  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal && isMultiChannelAudioLoggingEnabled_onceToken != -1)
    dispatch_once(&isMultiChannelAudioLoggingEnabled_onceToken, &__block_literal_global_223);
  return isMultiChannelAudioLoggingEnabled_multiChannelAudioLogging;
}

- (BOOL)isAdBlockerAudioLoggingEnabled
{
  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal && isAdBlockerAudioLoggingEnabled_onceToken != -1)
    dispatch_once(&isAdBlockerAudioLoggingEnabled_onceToken, &__block_literal_global_227);
  return isAdBlockerAudioLoggingEnabled_enabled;
}

- (BOOL)isSelfTriggerFileLoggingEnabled
{
  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal && isSelfTriggerFileLoggingEnabled_onceToken != -1)
    dispatch_once(&isSelfTriggerFileLoggingEnabled_onceToken, &__block_literal_global_230);
  return isSelfTriggerFileLoggingEnabled_enabled;
}

- (void)setASVUserIntent:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a3;
  objc_msgSend(v3, "numberWithUnsignedLongLong:", objc_msgSend(v4, "userIntentType"));
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v4, "userIntentTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "userIntentVolume");
  objc_msgSend(v6, "numberWithFloat:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v4, "latestVolumeTime"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "latestVolume");
  objc_msgSend(v9, "numberWithFloat:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "permanentOffsetIsEnabled"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "permanentOffsetFactor");
  objc_msgSend(v12, "numberWithFloat:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB37E8];
  v15 = objc_msgSend(v4, "userIntentValidForSeconds");

  objc_msgSend(v14, "numberWithUnsignedLongLong:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _CSPreferencesSetValueForKey(v17, CFSTR("Adaptive Siri Volume State Intent Type"));
  _CSPreferencesSetValueForKey(v5, CFSTR("Adaptive Siri Volume State Intent Time"));
  _CSPreferencesSetValueForKey(v7, CFSTR("Adaptive Siri Volume State Intent Volume"));
  _CSPreferencesSetValueForKey(v8, CFSTR("Adaptive Siri Volume State Latest Volume Time"));
  _CSPreferencesSetValueForKey(v10, CFSTR("Adaptive Siri Volume State Latest Volume"));
  _CSPreferencesSetValueForKey(v11, CFSTR("Adaptive Siri Volume State Permanent Offset Enabled"));
  _CSPreferencesSetValueForKey(v13, CFSTR("Adaptive Siri Volume State Permanent Offset Factor"));
  _CSPreferencesSetValueForKey(v16, CFSTR("Adaptive Siri Volume State Intent Valid For Seconds"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));

}

- (void)getASVUserIntent:(id)a3
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
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  double v26;
  float v27;
  NSObject *v28;
  void *v29;
  float v30;
  double v31;
  uint64_t v32;
  float v33;
  double v34;
  void *v35;
  int v36;
  float v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *log;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  double v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  double v52;
  __int16 v53;
  int v54;
  __int16 v55;
  double v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)CFPreferencesCopyAppValue(CFSTR("Adaptive Siri Volume State Intent Type"), CFSTR("com.apple.voicetrigger"));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v3, "setUserIntentType:", objc_msgSend(v4, "unsignedLongLongValue"));
    v6 = (void *)CFPreferencesCopyAppValue(CFSTR("Adaptive Siri Volume State Intent Time"), CFSTR("com.apple.voicetrigger"));
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v3, "setUserIntentTime:", objc_msgSend(v6, "longLongValue"));
      v8 = (void *)CFPreferencesCopyAppValue(CFSTR("Adaptive Siri Volume State Intent Volume"), CFSTR("com.apple.voicetrigger"));
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "floatValue");
        objc_msgSend(v3, "setUserIntentVolume:");
        v10 = (void *)CFPreferencesCopyAppValue(CFSTR("Adaptive Siri Volume State Latest Volume Time"), CFSTR("com.apple.voicetrigger"));
        v11 = v10;
        if (v10)
        {
          objc_msgSend(v3, "setLatestVolumeTime:", objc_msgSend(v10, "longLongValue"));
          v12 = (void *)CFPreferencesCopyAppValue(CFSTR("Adaptive Siri Volume State Latest Volume"), CFSTR("com.apple.voicetrigger"));
          v13 = v12;
          if (v12)
          {
            objc_msgSend(v12, "floatValue");
            objc_msgSend(v3, "setLatestVolume:");
            v14 = (void *)CFPreferencesCopyAppValue(CFSTR("Adaptive Siri Volume State Permanent Offset Enabled"), CFSTR("com.apple.voicetrigger"));
            v15 = v14;
            if (v14)
            {
              v16 = objc_msgSend(v14, "BOOLValue");
              v17 = v3;
            }
            else
            {
              v23 = CSLogContextFacilityCoreSpeech;
              if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v42 = "-[CSFPreferences getASVUserIntent:]";
                _os_log_impl(&dword_1B502E000, v23, OS_LOG_TYPE_DEFAULT, "%s Adaptive Siri Volume failed to load permanent offset status. Defaulting to no permanent volume offset", buf, 0xCu);
              }
              v17 = v3;
              v16 = 0;
            }
            objc_msgSend(v17, "setPermanentOffsetIsEnabled:", v16);
            v24 = (void *)CFPreferencesCopyAppValue(CFSTR("Adaptive Siri Volume State Permanent Offset Factor"), CFSTR("com.apple.voicetrigger"));
            v25 = v24;
            if (v24)
            {
              objc_msgSend(v24, "floatValue");
              v27 = *(float *)&v26;
            }
            else
            {
              v28 = CSLogContextFacilityCoreSpeech;
              v27 = 1.0;
              if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v42 = "-[CSFPreferences getASVUserIntent:]";
                _os_log_impl(&dword_1B502E000, v28, OS_LOG_TYPE_DEFAULT, "%s Adaptive Siri Volume failed to load permanent offset factor. Defaulting to unity permanent volume offset factor", buf, 0xCu);
              }
            }
            *(float *)&v26 = v27;
            objc_msgSend(v3, "setPermanentOffsetFactor:", v26);
            v29 = (void *)CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
            {
              log = v29;
              v39 = objc_msgSend(v3, "userIntentType");
              v38 = objc_msgSend(v3, "userIntentTime");
              objc_msgSend(v3, "userIntentVolume");
              v31 = v30;
              v32 = objc_msgSend(v3, "latestVolumeTime");
              objc_msgSend(v3, "latestVolume");
              v34 = v33;
              v35 = v15;
              v36 = objc_msgSend(v3, "permanentOffsetIsEnabled");
              objc_msgSend(v3, "permanentOffsetFactor");
              *(_DWORD *)buf = 136316930;
              v42 = "-[CSFPreferences getASVUserIntent:]";
              v43 = 2050;
              v44 = v39;
              v45 = 2050;
              v46 = v38;
              v47 = 2050;
              v48 = v31;
              v49 = 2050;
              v50 = v32;
              v51 = 2050;
              v52 = v34;
              v53 = 1026;
              v54 = v36;
              v15 = v35;
              v55 = 2050;
              v56 = v37;
              _os_log_impl(&dword_1B502E000, log, OS_LOG_TYPE_DEFAULT, "%s Loaded Adaptive Siri Volume intentType: %{public}llu, intentTime: %{public}llu, intentVolume: %{public}f, latestVolumeTime: %{public}lld, latestVolume:%{public}f, permanentOffsetIsEnabled: %{public}d, permanentOffsetFactor: %{public}f", buf, 0x4Eu);

            }
          }
          else
          {
            v22 = CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v42 = "-[CSFPreferences getASVUserIntent:]";
              _os_log_impl(&dword_1B502E000, v22, OS_LOG_TYPE_DEFAULT, "%s Adaptive Siri Volume failed to latest volume. Ignoring intent", buf, 0xCu);
            }
            objc_msgSend(v3, "setUserIntentTime:", 0x8000000000000000);
          }

        }
        else
        {
          v21 = CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v42 = "-[CSFPreferences getASVUserIntent:]";
            _os_log_impl(&dword_1B502E000, v21, OS_LOG_TYPE_DEFAULT, "%s Adaptive Siri Volume failed to load latest volume time. Ignoring intent", buf, 0xCu);
          }
          objc_msgSend(v3, "setUserIntentTime:", 0x8000000000000000);
        }

      }
      else
      {
        v20 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v42 = "-[CSFPreferences getASVUserIntent:]";
          _os_log_impl(&dword_1B502E000, v20, OS_LOG_TYPE_DEFAULT, "%s Adaptive Siri Volume failed to load user intent volume. Ignoring intent", buf, 0xCu);
        }
        objc_msgSend(v3, "setUserIntentTime:", 0x8000000000000000);
      }

    }
    else
    {
      v19 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v42 = "-[CSFPreferences getASVUserIntent:]";
        _os_log_impl(&dword_1B502E000, v19, OS_LOG_TYPE_DEFAULT, "%s Adaptive Siri Volume failed to load user intent time. Ignoring intent", buf, 0xCu);
      }
      objc_msgSend(v3, "setUserIntentTime:", 0x8000000000000000);
    }

  }
  else
  {
    v18 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v42 = "-[CSFPreferences getASVUserIntent:]";
      _os_log_impl(&dword_1B502E000, v18, OS_LOG_TYPE_DEFAULT, "%s Adaptive Siri Volume failed to load user intent type. Ignoring intent", buf, 0xCu);
    }
    objc_msgSend(v3, "setUserIntentTime:", 0x8000000000000000);
  }

}

- (void)setSiriLanguageCodeDarwin:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
  {
    _CSPreferencesSetValueForKey(v3, CFSTR("Siri Language Code Darwin"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
  }
  else
  {
    v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[CSFPreferences setSiriLanguageCodeDarwin:]";
      _os_log_error_impl(&dword_1B502E000, v4, OS_LOG_TYPE_ERROR, "%s Not supported on this platform", (uint8_t *)&v5, 0xCu);
    }
  }

}

- (id)languageCodeDarwin
{
  NSObject *v2;
  void *v3;
  id v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
  {
    v2 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      v7 = "-[CSFPreferences languageCodeDarwin]";
      _os_log_error_impl(&dword_1B502E000, v2, OS_LOG_TYPE_ERROR, "%s Not supported on this platform", (uint8_t *)&v6, 0xCu);
    }
  }
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("Siri Language Code Darwin"), CFSTR("com.apple.voicetrigger"));
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (void)setRemoteDarwinEverConnectedWithNotifyKey:(const char *)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__CSFPreferences_setRemoteDarwinEverConnectedWithNotifyKey___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  if (setRemoteDarwinEverConnectedWithNotifyKey__onceToken != -1)
    dispatch_once(&setRemoteDarwinEverConnectedWithNotifyKey__onceToken, block);
}

- (void)setIdleUserPreventSleepAssertionAcquitionDate:(id)a3
{
  _CSNotBackedupPreferencesSetValueForKey(a3, CFSTR("Idle User Prevent Sleep Assertion Acquition Time"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger.notbackedup"));
}

- (id)getIdleUserPreventSleepAssertionAcquitionDate
{
  void *v2;
  id v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("Idle User Prevent Sleep Assertion Acquition Time"), CFSTR("com.apple.voicetrigger.notbackedup"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (BOOL)isP2PTransferEnabled
{
  if (isP2PTransferEnabled_onceToken != -1)
    dispatch_once(&isP2PTransferEnabled_onceToken, &__block_literal_global_246);
  return isP2PTransferEnabled_enabled;
}

- (BOOL)isReducedPHSThresholdEnabled
{
  if (isReducedPHSThresholdEnabled_onceToken != -1)
    dispatch_once(&isReducedPHSThresholdEnabled_onceToken, &__block_literal_global_249);
  return isReducedPHSThresholdEnabled_enabled;
}

- (BOOL)isModelBenchmarkingEnabled
{
  if (isModelBenchmarkingEnabled_onceToken != -1)
    dispatch_once(&isModelBenchmarkingEnabled_onceToken, &__block_literal_global_252);
  return isModelBenchmarkingEnabled_enabled;
}

- (int64_t)geckoLoggingLevel
{
  if (geckoLoggingLevel_onceToken != -1)
    dispatch_once(&geckoLoggingLevel_onceToken, &__block_literal_global_253);
  return geckoLoggingLevel_geckoLoggingLevel;
}

- (void)enableAttentiveSiriAPI:(id)a3
{
  _CSPreferencesSetValueForKeyFromRoot(a3, CFSTR("Attentive Siri API"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
}

- (BOOL)isAttentiveSiriAPIEnabled
{
  if (isAttentiveSiriAPIEnabled_onceToken != -1)
    dispatch_once(&isAttentiveSiriAPIEnabled_onceToken, &__block_literal_global_258);
  return isAttentiveSiriAPIEnabled_enabled;
}

- (void)enableEndpointEnhancedLogging:(id)a3
{
  _CSPreferencesSetValueForKeyFromRoot(a3, CFSTR("Endpoint Enhanced Logging"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
}

- (BOOL)isEndpointEnhancedLoggingEnabled
{
  if (isEndpointEnhancedLoggingEnabled_onceToken != -1)
    dispatch_once(&isEndpointEnhancedLoggingEnabled_onceToken, &__block_literal_global_261);
  return isEndpointEnhancedLoggingEnabled_enabled;
}

- (BOOL)isEndpointAssetOverridingEnabled
{
  if (isEndpointAssetOverridingEnabled_onceToken != -1)
    dispatch_once(&isEndpointAssetOverridingEnabled_onceToken, &__block_literal_global_262);
  return isEndpointAssetOverridingEnabled_enabled;
}

- (id)fakeEndpointAssetPath
{
  void *v2;
  id v3;

  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    v2 = (void *)CFPreferencesCopyValue(CFSTR("Endpoint Asset Overriding File Path"), CFSTR("com.apple.voicetrigger"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
    if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v3 = v2;
    else
      v3 = 0;

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)isEndpointAssetBypassTrialEnabled
{
  if (isEndpointAssetBypassTrialEnabled_onceToken != -1)
    dispatch_once(&isEndpointAssetBypassTrialEnabled_onceToken, &__block_literal_global_267);
  return isEndpointAssetBypassTrialEnabled_enabled;
}

- (BOOL)isVoiceTriggerAssetOverridingEnabled
{
  if (isVoiceTriggerAssetOverridingEnabled_onceToken != -1)
    dispatch_once(&isVoiceTriggerAssetOverridingEnabled_onceToken, &__block_literal_global_270);
  return isVoiceTriggerAssetOverridingEnabled_enabled;
}

- (id)fakeVoiceTriggerAssetPath
{
  void *v2;
  id v3;

  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    v2 = (void *)CFPreferencesCopyValue(CFSTR("VoiceTrigger Asset Overriding File Path"), CFSTR("com.apple.voicetrigger"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
    if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v3 = v2;
    else
      v3 = 0;

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)fakeVoiceTriggerAudioAccessoryFirstPassAssetPath
{
  void *v2;
  id v3;

  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    v2 = (void *)CFPreferencesCopyValue(CFSTR("VoiceTrigger Asset Overriding File Path"), CFSTR("com.apple.voicetrigger"), (CFStringRef)*MEMORY[0x1E0C9B240], (CFStringRef)*MEMORY[0x1E0C9B250]);
    if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v3 = v2;
    else
      v3 = 0;

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)isMitigationAssetOverridingEnabled
{
  if (isMitigationAssetOverridingEnabled_onceToken != -1)
    dispatch_once(&isMitigationAssetOverridingEnabled_onceToken, &__block_literal_global_273);
  return isMitigationAssetOverridingEnabled_enabled;
}

- (id)fakeMitigationAssetPath
{
  void *v2;
  id v3;

  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    v2 = (void *)CFPreferencesCopyValue(CFSTR("Mitigation Asset Overriding File Path"), CFSTR("com.apple.voicetrigger"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
    if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v3 = v2;
    else
      v3 = 0;

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)bypassTrialAssets
{
  if (bypassTrialAssets_onceToken != -1)
    dispatch_once(&bypassTrialAssets_onceToken, &__block_literal_global_276);
  return bypassTrialAssets_bypassTrial;
}

- (void)setSelfTriggerEnabledAccessory:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x1E0C80C00];
  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _CSPreferencesSetValueForKey(v4, CFSTR("SelfTrigger Enabled in Accessory"));

    CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
  }
  else
  {
    v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      v7 = "-[CSFPreferences setSelfTriggerEnabledAccessory:]";
      _os_log_error_impl(&dword_1B502E000, v5, OS_LOG_TYPE_ERROR, "%s Called in unexpected platform!", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (BOOL)isSelfTriggerEnabledAccessory
{
  void *v2;
  void *v3;
  char v4;
  NSObject *v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
  {
    CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
    v2 = (void *)CFPreferencesCopyAppValue(CFSTR("SelfTrigger Enabled in Accessory"), CFSTR("com.apple.voicetrigger"));
    v3 = v2;
    if (v2)
      v4 = objc_msgSend(v2, "BOOLValue");
    else
      v4 = 0;

  }
  else
  {
    v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315138;
      v8 = "-[CSFPreferences isSelfTriggerEnabledAccessory]";
      _os_log_error_impl(&dword_1B502E000, v5, OS_LOG_TYPE_ERROR, "%s Called in unexpected platform!", (uint8_t *)&v7, 0xCu);
    }
    return 0;
  }
  return v4;
}

- (BOOL)shouldOverwriteVoiceTriggerMLock
{
  if (shouldOverwriteVoiceTriggerMLock_onceToken != -1)
    dispatch_once(&shouldOverwriteVoiceTriggerMLock_onceToken, &__block_literal_global_281);
  return shouldOverwriteVoiceTriggerMLock_shouldOverwrite;
}

- (BOOL)overwritingVoiceTriggerMLock
{
  if (overwritingVoiceTriggerMLock_onceToken != -1)
    dispatch_once(&overwritingVoiceTriggerMLock_onceToken, &__block_literal_global_284);
  return overwritingVoiceTriggerMLock_voiceTriggerMLockEnabled;
}

- (BOOL)bypassSpeakerIdForMitigation
{
  if (bypassSpeakerIdForMitigation_onceToken != -1)
    dispatch_once(&bypassSpeakerIdForMitigation_onceToken, &__block_literal_global_285);
  return bypassSpeakerIdForMitigation_enabled;
}

- (id)readSpeakerIdScoreOverrrideConfig
{
  if (readSpeakerIdScoreOverrrideConfig_onceToken != -1)
    dispatch_once(&readSpeakerIdScoreOverrrideConfig_onceToken, &__block_literal_global_288);
  return (id)readSpeakerIdScoreOverrrideConfig_scoreMap;
}

- (BOOL)firstPassDebuggingEnabled
{
  if (firstPassDebuggingEnabled_onceToken != -1)
    dispatch_once(&firstPassDebuggingEnabled_onceToken, &__block_literal_global_291);
  return firstPassDebuggingEnabled_firstPassDebug;
}

- (void)setEnrollmentIdForVoiceProfileiCloudMetrics:(id)a3 on:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315650;
    v9 = "-[CSFPreferences setEnrollmentIdForVoiceProfileiCloudMetrics:on:]";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEFAULT, "%s Setting enrollmentId %@ on %@... ", (uint8_t *)&v8, 0x20u);
  }
  CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger.notbackedup"));
  _CSNotBackedupPreferencesSetValueForKey(v5, CFSTR("EnrollmentId Voice Profile iCloud Enrollment"));
  _CSNotBackedupPreferencesSetValueForKey(v6, CFSTR("Creation Date of EnrollmentId used in Voice Profile iCloud Enrollment"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger.notbackedup"));

}

- (id)dateWhenEnrollmentIdForVoiceProfileiCloudMetricsWasCreated
{
  void *v2;
  char isKindOfClass;
  NSObject *v4;
  _BOOL4 v5;
  id v6;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("Creation Date of EnrollmentId used in Voice Profile iCloud Enrollment"), CFSTR("com.apple.voicetrigger.notbackedup"));
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = CSLogContextFacilityCoreSpeech;
  v5 = os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
  if ((isKindOfClass & 1) != 0)
  {
    if (v5)
    {
      v8 = 136315394;
      v9 = "-[CSFPreferences dateWhenEnrollmentIdForVoiceProfileiCloudMetricsWasCreated]";
      v10 = 2112;
      v11 = v2;
      _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s date found %@", (uint8_t *)&v8, 0x16u);
    }
    v6 = v2;
  }
  else
  {
    if (v5)
    {
      v8 = 136315138;
      v9 = "-[CSFPreferences dateWhenEnrollmentIdForVoiceProfileiCloudMetricsWasCreated]";
      _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s date not found. Return nil... ", (uint8_t *)&v8, 0xCu);
    }
    v6 = 0;
  }

  return v6;
}

- (id)enrollmentIdForVoiceProfileiCloudMetrics
{
  void *v2;
  id v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("EnrollmentId Voice Profile iCloud Enrollment"), CFSTR("com.apple.voicetrigger.notbackedup"));
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = v2;
  else
    v3 = 0;
  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[CSFPreferences enrollmentIdForVoiceProfileiCloudMetrics]";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Fetched enrollmentId %@", (uint8_t *)&v6, 0x16u);
  }

  return v3;
}

- (BOOL)forceRePromptVoiceTrigger
{
  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger.notbackedup"));
    if (forceRePromptVoiceTrigger_onceToken != -1)
      dispatch_once(&forceRePromptVoiceTrigger_onceToken, &__block_literal_global_298);
  }
  return forceRePromptVoiceTrigger_forceReEnrollVoiceTrigger;
}

- (BOOL)forceSetRePromptRequired
{
  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger.notbackedup"));
    if (forceSetRePromptRequired_onceToken != -1)
      dispatch_once(&forceSetRePromptRequired_onceToken, &__block_literal_global_301);
  }
  return forceSetRePromptRequired_forceSetRePromptRequired;
}

- (BOOL)forceMitigateForHybridSDSD
{
  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger.notbackedup"));
    if (forceMitigateForHybridSDSD_onceToken != -1)
      dispatch_once(&forceMitigateForHybridSDSD_onceToken, &__block_literal_global_304_6801);
  }
  return forceMitigateForHybridSDSD_forceMitigateForHybridSDSD;
}

- (void)setPowerLoggingCurrentAssetConfigVersion:(id)a3
{
  _CSNotBackedupPreferencesSetValueForKey(a3, CFSTR("Power Logging Current Asset Config Version"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
}

- (id)powerLoggingCurrentAssetConfigVersion
{
  void *v2;
  id v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("Power Logging Current Asset Config Version"), CFSTR("com.apple.voicetrigger.notbackedup"));
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)whiteListedMultiPhraseLocales
{
  void *v2;
  id v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("Whitelisted Multiphrase Locales"), CFSTR("com.apple.voicetrigger.notbackedup"));
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (void)whiteListMultiPhraseLocale:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    -[CSFPreferences whiteListedMultiPhraseLocales](self, "whiteListedMultiPhraseLocales");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v5 && objc_msgSend(v5, "count"))
      objc_msgSend(v6, "addObjectsFromArray:", v5);
    objc_msgSend(v6, "addObject:", v7);
    _CSNotBackedupPreferencesSetValueForKey(v6, CFSTR("Whitelisted Multiphrase Locales"));

    v4 = v7;
  }

}

- (void)setPowerLoggingCurrentLanguage:(id)a3
{
  _CSNotBackedupPreferencesSetValueForKey(a3, CFSTR("Power Logging Current Language"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
}

- (id)powerLoggingCurrentLanguage
{
  void *v2;
  id v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("Power Logging Current Language"), CFSTR("com.apple.voicetrigger.notbackedup"));
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (unint64_t)overridingFrameSkipRate
{
  if (overridingFrameSkipRate_onceToken != -1)
    dispatch_once(&overridingFrameSkipRate_onceToken, &__block_literal_global_314);
  return overridingFrameSkipRate_overridingFrameSkipRateValue;
}

- (BOOL)shouldDisableImplicitTraining
{
  if (shouldDisableImplicitTraining_onceToken != -1)
    dispatch_once(&shouldDisableImplicitTraining_onceToken, &__block_literal_global_317);
  return shouldDisableImplicitTraining_disabled;
}

- (BOOL)isFlexibleFollowupsUserDisabled
{
  void *v2;
  void *v3;
  char v4;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("Flexible Followups User Disabled"), CFSTR("com.apple.voicetrigger"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)isFlexibleFollowupsSupported
{
  void *v2;
  BOOL v3;
  BOOL v4;

  +[CSUtils getSiriLanguageWithFallback:](CSUtils, "getSiriLanguageWithFallback:", CFSTR("en-US"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[CSUtils supportsMagusForLanguageCode:](CSUtils, "supportsMagusForLanguageCode:", v2);
  v4 = +[CSUtils isContinuousConversationSupported](CSUtils, "isContinuousConversationSupported") && v3;

  return v4;
}

- (BOOL)isVoiceTriggerRepromptAssetOverridingEnabled
{
  if (isVoiceTriggerRepromptAssetOverridingEnabled_onceToken != -1)
    dispatch_once(&isVoiceTriggerRepromptAssetOverridingEnabled_onceToken, &__block_literal_global_324);
  return isVoiceTriggerRepromptAssetOverridingEnabled_enabled;
}

- (float)nearlyMutedPlaybackVolumeLevel
{
  if (nearlyMutedPlaybackVolumeLevel_onceToken != -1)
    dispatch_once(&nearlyMutedPlaybackVolumeLevel_onceToken, &__block_literal_global_327);
  return *(float *)&nearlyMutedPlaybackVolumeLevel_volumeThreshold;
}

- (void)voiceTriggerRePromptFinishedWithDate:(id)a3
{
  _CSNotBackedupPreferencesSetValueForKey(a3, CFSTR("Log when user was RePrompted "));
  CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger.notbackedup"));
}

- (id)dateWhenVoiceTriggerRePrompted
{
  void *v2;
  id v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("Log when user was RePrompted "), CFSTR("com.apple.voicetrigger.notbackedup"));
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)fakeVoiceTriggerRepromptAssetPath
{
  void *v2;
  id v3;

  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    v2 = (void *)CFPreferencesCopyValue(CFSTR("VoiceTriggerReprompt Asset Overriding File Path"), CFSTR("com.apple.voicetrigger"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
    if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v3 = v2;
    else
      v3 = 0;

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)isBargeInSupportEnabled
{
  void *v2;
  int v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CFE980], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSiriAccessibilityBargeInEnabled");

  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[CSFPreferences isBargeInSupportEnabled]";
    v8 = 1024;
    v9 = v3;
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s isBargeInEnabled:%u", (uint8_t *)&v6, 0x12u);
  }
  return v3;
}

- (id)_getCoreSpeechGroupContainerPath
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.CoreSpeech"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isSpeechStudyLoggingEnabled
{
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (isSpeechStudyLoggingEnabled_onceToken != -1)
    dispatch_once(&isSpeechStudyLoggingEnabled_onceToken, &__block_literal_global_334);
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[CSFPreferences isSpeechStudyLoggingEnabled]";
    v6 = 1024;
    v7 = isSpeechStudyLoggingEnabled_enabled;
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s returnValue is :%u", (uint8_t *)&v4, 0x12u);
  }
  return isSpeechStudyLoggingEnabled_enabled;
}

- (void)setAOPConfigurationWatchDog
{
  _CSPreferencesSetValueForKey(MEMORY[0x1E0C9AAB0], CFSTR("AOPConfigurationWatchDog"));
}

- (void)clearAOPConfigurationWatchDog
{
  _CSPreferencesSetValueForKey(0, CFSTR("AOPConfigurationWatchDog"));
}

- (BOOL)checkAOPConfigurationWatchDog
{
  void *v2;
  char v3;

  CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("AOPConfigurationWatchDog"), CFSTR("com.apple.voicetrigger"));
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

void __45__CSFPreferences_isSpeechStudyLoggingEnabled__block_invoke()
{
  id v0;

  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    v0 = (id)CFPreferencesCopyAppValue(CFSTR("SpeechStudy Logging Enabled"), CFSTR("com.apple.voicetrigger"));
    if (v0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        isSpeechStudyLoggingEnabled_enabled = objc_msgSend(v0, "BOOLValue");
    }

  }
}

void __48__CSFPreferences_nearlyMutedPlaybackVolumeLevel__block_invoke()
{
  void *v0;
  void *v1;
  int v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    v0 = (void *)CFPreferencesCopyAppValue(CFSTR("Nearly Muted Playback Volume"), CFSTR("com.apple.voicetrigger.notbackedup"));
    v1 = v0;
    if (v0)
    {
      objc_msgSend(v0, "floatValue");
      nearlyMutedPlaybackVolumeLevel_volumeThreshold = v2;
    }

  }
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[CSFPreferences nearlyMutedPlaybackVolumeLevel]_block_invoke";
    v6 = 2048;
    v7 = *(float *)&nearlyMutedPlaybackVolumeLevel_volumeThreshold;
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s NearlyMutedPlaybackVolumeLevel = %f", (uint8_t *)&v4, 0x16u);
  }
}

void __62__CSFPreferences_isVoiceTriggerRepromptAssetOverridingEnabled__block_invoke()
{
  void *v0;

  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    v0 = (void *)CFPreferencesCopyAppValue(CFSTR("VoiceTriggerReprompt Asset Overriding File Path"), CFSTR("com.apple.voicetrigger"));
    if (v0)
      isVoiceTriggerRepromptAssetOverridingEnabled_enabled = 1;

  }
}

void __47__CSFPreferences_shouldDisableImplicitTraining__block_invoke()
{
  void *v0;
  id v1;
  id v2;

  v0 = (void *)CFPreferencesCopyAppValue(CFSTR("Disable Implicit Enrollment"), CFSTR("com.apple.voicetrigger.notbackedup"));
  if (v0)
  {
    if (CSIsInternalBuild_onceToken != -1)
    {
      v2 = v0;
      dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
      v0 = v2;
    }
    if (CSIsInternalBuild_isInternal)
    {
      v1 = v0;
      shouldDisableImplicitTraining_disabled = objc_msgSend(v0, "BOOLValue");
      v0 = v1;
    }
  }

}

void __41__CSFPreferences_overridingFrameSkipRate__block_invoke()
{
  id v0;

  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    v0 = (id)CFPreferencesCopyAppValue(CFSTR("Overriding Fingerproint Frame Skip Rate"), CFSTR("com.apple.voicetrigger.notbackedup"));
    if (v0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        overridingFrameSkipRate_overridingFrameSkipRateValue = objc_msgSend(v0, "unsignedIntValue");
    }

  }
}

void __44__CSFPreferences_forceMitigateForHybridSDSD__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)CFPreferencesCopyAppValue(CFSTR("Force Mitigate For HybridSDSD"), CFSTR("com.apple.voicetrigger.notbackedup"));
  v1 = v0;
  if (v0)
  {
    v2 = v0;
    LOBYTE(v0) = objc_msgSend(v0, "BOOLValue");
    v1 = v2;
  }
  forceMitigateForHybridSDSD_forceMitigateForHybridSDSD = (char)v0;

}

void __42__CSFPreferences_forceSetRePromptRequired__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)CFPreferencesCopyAppValue(CFSTR("Force Set Re-Prompt Required"), CFSTR("com.apple.voicetrigger"));
  v1 = v0;
  if (v0)
  {
    v2 = v0;
    LOBYTE(v0) = objc_msgSend(v0, "BOOLValue");
    v1 = v2;
  }
  forceSetRePromptRequired_forceSetRePromptRequired = (char)v0;

}

void __43__CSFPreferences_forceRePromptVoiceTrigger__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)CFPreferencesCopyAppValue(CFSTR("Force Re-Prompt VoiceTrigger Buddy"), CFSTR("com.apple.voicetrigger"));
  v1 = v0;
  if (v0)
  {
    v2 = v0;
    LOBYTE(v0) = objc_msgSend(v0, "BOOLValue");
    v1 = v2;
  }
  forceRePromptVoiceTrigger_forceReEnrollVoiceTrigger = (char)v0;

}

void __43__CSFPreferences_firstPassDebuggingEnabled__block_invoke()
{
  void *v0;

  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    v0 = (void *)CFPreferencesCopyAppValue(CFSTR("First Pass Debug"), CFSTR("com.apple.voicetrigger.notbackedup"));
    firstPassDebuggingEnabled_firstPassDebug = v0 != 0;

  }
}

void __51__CSFPreferences_readSpeakerIdScoreOverrrideConfig__block_invoke()
{
  CFPropertyListRef v0;
  void *v1;
  uint64_t v2;
  void *v3;

  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    v0 = CFPreferencesCopyAppValue(CFSTR("SpeakerID Score Override Map"), CFSTR("com.apple.voicetrigger"));
    v1 = (void *)readSpeakerIdScoreOverrrideConfig_scoreMap;
    readSpeakerIdScoreOverrrideConfig_scoreMap = (uint64_t)v0;

    if (readSpeakerIdScoreOverrrideConfig_scoreMap && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v2 = objc_msgSend((id)readSpeakerIdScoreOverrrideConfig_scoreMap, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
      v2 = objc_claimAutoreleasedReturnValue();
    }
    v3 = (void *)readSpeakerIdScoreOverrrideConfig_scoreMap;
    readSpeakerIdScoreOverrrideConfig_scoreMap = v2;

  }
}

void __46__CSFPreferences_bypassSpeakerIdForMitigation__block_invoke()
{
  void *v0;
  char v1;
  void *v2;
  char v3;
  void *v4;

  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    v0 = (void *)CFPreferencesCopyAppValue(CFSTR("Bypass SpeakerId based Mitigation"), CFSTR("com.apple.voicetrigger"));
    if (v0 && (objc_opt_respondsToSelector() & 1) != 0)
      v1 = objc_msgSend(v0, "BOOLValue");
    else
      v1 = 0;
    v4 = (void *)CFPreferencesCopyAppValue(CFSTR("Bypass SpeakerId based Mitigation"), CFSTR("com.apple.voicetrigger.notbackedup"));

    v2 = v4;
    if (v4)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = objc_msgSend(v4, "BOOLValue");
      else
        v3 = 0;
      v2 = v4;
    }
    else
    {
      v3 = 0;
    }
    bypassSpeakerIdForMitigation_enabled = v1 | v3;

  }
}

void __46__CSFPreferences_overwritingVoiceTriggerMLock__block_invoke()
{
  CFPropertyListRef v0;
  void *v1;
  char v2;
  char v3;
  void *v4;

  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    v0 = CFPreferencesCopyAppValue(CFSTR("Enable VoiceTrigger Mlock"), CFSTR("com.apple.voicetrigger.notbackedup"));
    v1 = (void *)v0;
    if (v0)
    {
      v4 = (void *)v0;
      v2 = objc_opt_respondsToSelector();
      v1 = v4;
      if ((v2 & 1) != 0)
      {
        v3 = objc_msgSend(v4, "BOOLValue");
        v1 = v4;
        overwritingVoiceTriggerMLock_voiceTriggerMLockEnabled = v3;
      }
    }

  }
}

void __50__CSFPreferences_shouldOverwriteVoiceTriggerMLock__block_invoke()
{
  void *v0;

  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    v0 = (void *)CFPreferencesCopyAppValue(CFSTR("Enable VoiceTrigger Mlock"), CFSTR("com.apple.voicetrigger.notbackedup"));
    if (v0)
      shouldOverwriteVoiceTriggerMLock_shouldOverwrite = 1;

  }
}

void __35__CSFPreferences_bypassTrialAssets__block_invoke()
{
  CFPropertyListRef v0;
  void *v1;
  char v2;
  char v3;
  void *v4;

  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    v0 = CFPreferencesCopyAppValue(CFSTR("Bypass Trial Assets"), CFSTR("com.apple.voicetrigger"));
    v1 = (void *)v0;
    if (v0)
    {
      v4 = (void *)v0;
      v2 = objc_opt_respondsToSelector();
      v1 = v4;
      if ((v2 & 1) != 0)
      {
        v3 = objc_msgSend(v4, "BOOLValue");
        v1 = v4;
        bypassTrialAssets_bypassTrial = v3;
      }
    }

  }
}

void __52__CSFPreferences_isMitigationAssetOverridingEnabled__block_invoke()
{
  void *v0;

  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    v0 = (void *)CFPreferencesCopyAppValue(CFSTR("Mitigation Asset Overriding File Path"), CFSTR("com.apple.voicetrigger"));
    if (v0)
      isMitigationAssetOverridingEnabled_enabled = 1;

  }
}

void __54__CSFPreferences_isVoiceTriggerAssetOverridingEnabled__block_invoke()
{
  void *v0;

  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    v0 = (void *)CFPreferencesCopyAppValue(CFSTR("VoiceTrigger Asset Overriding File Path"), CFSTR("com.apple.voicetrigger"));
    if (v0)
      isVoiceTriggerAssetOverridingEnabled_enabled = 1;

  }
}

void __51__CSFPreferences_isEndpointAssetBypassTrialEnabled__block_invoke()
{
  void *v0;
  id v1;

  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    v0 = (void *)CFPreferencesCopyAppValue(CFSTR("Endpoint Asset Bypass Trial Enabled"), CFSTR("com.apple.voicetrigger"));
    if (v0)
    {
      v1 = v0;
      isEndpointAssetBypassTrialEnabled_enabled = objc_msgSend(v0, "BOOLValue");
      v0 = v1;
    }

  }
}

void __50__CSFPreferences_isEndpointAssetOverridingEnabled__block_invoke()
{
  void *v0;
  id v1;

  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    v0 = (void *)CFPreferencesCopyAppValue(CFSTR("Endpoint Asset Overriding Enabled"), CFSTR("com.apple.voicetrigger"));
    if (v0)
    {
      v1 = v0;
      isEndpointAssetOverridingEnabled_enabled = objc_msgSend(v0, "BOOLValue");
      v0 = v1;
    }

  }
}

void __50__CSFPreferences_isEndpointEnhancedLoggingEnabled__block_invoke()
{
  void *v0;
  id v1;

  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    v0 = (void *)CFPreferencesCopyAppValue(CFSTR("Endpoint Enhanced Logging"), CFSTR("com.apple.voicetrigger"));
    if (v0)
    {
      v1 = v0;
      isEndpointEnhancedLoggingEnabled_enabled = objc_msgSend(v0, "BOOLValue");
      v0 = v1;
    }

  }
}

void __43__CSFPreferences_isAttentiveSiriAPIEnabled__block_invoke()
{
  void *v0;
  id v1;

  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    v0 = (void *)CFPreferencesCopyAppValue(CFSTR("Attentive Siri API"), CFSTR("com.apple.voicetrigger"));
    if (v0)
    {
      v1 = v0;
      isAttentiveSiriAPIEnabled_enabled = objc_msgSend(v0, "BOOLValue");
      v0 = v1;
    }

  }
}

void __35__CSFPreferences_geckoLoggingLevel__block_invoke()
{
  void *v0;
  id v1;

  v0 = (void *)CFPreferencesCopyAppValue(CFSTR("NearMissAudioLoggingLevel"), CFSTR("com.apple.voicetrigger.notbackedup"));
  if (v0)
  {
    v1 = v0;
    geckoLoggingLevel_geckoLoggingLevel = objc_msgSend(v0, "integerValue");
    v0 = v1;
  }

}

void __44__CSFPreferences_isModelBenchmarkingEnabled__block_invoke()
{
  void *v0;
  id v1;

  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    v0 = (void *)CFPreferencesCopyAppValue(CFSTR("Enable Model Benchmarking"), CFSTR("com.apple.voicetrigger"));
    if (v0)
    {
      v1 = v0;
      isModelBenchmarkingEnabled_enabled = objc_msgSend(v0, "BOOLValue");
      v0 = v1;
    }

  }
}

void __46__CSFPreferences_isReducedPHSThresholdEnabled__block_invoke()
{
  void *v0;
  id v1;

  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    v0 = (void *)CFPreferencesCopyAppValue(CFSTR("Enable Reduced PHS Threshold"), CFSTR("com.apple.voicetrigger"));
    if (v0)
    {
      v1 = v0;
      isReducedPHSThresholdEnabled_enabled = objc_msgSend(v0, "BOOLValue");
      v0 = v1;
    }

  }
}

void __38__CSFPreferences_isP2PTransferEnabled__block_invoke()
{
  void *v0;
  id v1;

  v0 = (void *)CFPreferencesCopyAppValue(CFSTR("Enable P2P Transfer"), CFSTR("com.apple.voicetrigger"));
  if (v0)
  {
    v1 = v0;
    isP2PTransferEnabled_enabled = objc_msgSend(v0, "BOOLValue");
    v0 = v1;
  }

}

uint64_t __60__CSFPreferences_setRemoteDarwinEverConnectedWithNotifyKey___block_invoke(uint64_t a1)
{
  _CSNotBackedupPreferencesSetValueForKey(MEMORY[0x1E0C9AAB0], CFSTR("Remote Darwin Ever Connected"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger.notbackedup"));
  return notify_post(*(const char **)(a1 + 32));
}

void __49__CSFPreferences_isSelfTriggerFileLoggingEnabled__block_invoke()
{
  void *v0;
  id v1;

  v0 = (void *)CFPreferencesCopyAppValue(CFSTR("Enable Self Trigger Audio Logging"), CFSTR("com.apple.voicetrigger"));
  if (v0)
  {
    v1 = v0;
    isSelfTriggerFileLoggingEnabled_enabled = objc_msgSend(v0, "BOOLValue");
    v0 = v1;
  }

}

void __48__CSFPreferences_isAdBlockerAudioLoggingEnabled__block_invoke()
{
  void *v0;
  id v1;

  v0 = (void *)CFPreferencesCopyAppValue(CFSTR("Enable AdBlocker Audio Logging"), CFSTR("com.apple.voicetrigger"));
  if (v0)
  {
    v1 = v0;
    isAdBlockerAudioLoggingEnabled_enabled = objc_msgSend(v0, "BOOLValue");
    v0 = v1;
  }

}

void __51__CSFPreferences_isMultiChannelAudioLoggingEnabled__block_invoke()
{
  void *v0;
  int v1;
  void *v2;
  id v3;

  v0 = (void *)CFPreferencesCopyAppValue(CFSTR("MultiChannelAudioLoggingEnabled"), CFSTR("com.apple.voicetrigger"));
  v3 = v0;
  if (!v0)
  {
    if (isMultiChannelAudioLoggingEnabled_multiChannelAudioLogging)
      goto LABEL_4;
    goto LABEL_3;
  }
  v1 = objc_msgSend(v0, "BOOLValue");
  isMultiChannelAudioLoggingEnabled_multiChannelAudioLogging = v1;
  if (!v1)
  {
LABEL_3:
    objc_msgSend(MEMORY[0x1E0CFE980], "sharedPreferences");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    isMultiChannelAudioLoggingEnabled_multiChannelAudioLogging = objc_msgSend(v2, "fileLoggingIsEnabled");

  }
LABEL_4:

}

void __32__CSFPreferences_isMphVTEnabled__block_invoke()
{
  void *v0;
  id v1;

  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    v0 = (void *)CFPreferencesCopyAppValue(CFSTR("MultiPhraseVTEnabled"), CFSTR("com.apple.voicetrigger"));
    if (v0)
    {
      v1 = v0;
      isMphVTEnabled_mphVTEnabled = objc_msgSend(v0, "BOOLValue");
      v0 = v1;
    }

  }
}

void __43__CSFPreferences_bypassPersonalizedHeySiri__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)CFPreferencesCopyAppValue(CFSTR("Bypass Personalized HeySiri"), CFSTR("com.apple.voicetrigger.notbackedup"));
  v1 = v0;
  if (v0)
  {
    v2 = v0;
    LOBYTE(v0) = objc_msgSend(v0, "BOOLValue");
    v1 = v2;
  }
  bypassPersonalizedHeySiri_bypassPersonalizedHeySiri = (char)v0;

}

void __43__CSFPreferences_overwritingRemoteVADScore__block_invoke()
{
  void *v0;
  int v1;
  id v2;

  v0 = (void *)CFPreferencesCopyAppValue(CFSTR("Overwrite Remote VAD Score"), CFSTR("com.apple.voicetrigger"));
  if (v0)
  {
    v2 = v0;
    objc_msgSend(v0, "floatValue");
    v0 = v2;
    overwritingRemoteVADScore_overrideScore = v1;
  }

}

void __47__CSFPreferences_shouldOverwriteRemoteVADScore__block_invoke()
{
  void *v0;

  v0 = (void *)CFPreferencesCopyAppValue(CFSTR("Overwrite Remote VAD Score"), CFSTR("com.apple.voicetrigger"));
  if (v0)
    shouldOverwriteRemoteVADScore_ret = 1;

}

void __48__CSFPreferences_useSiriActivationSPIForwatchOS__block_invoke()
{
  void *v0;
  id v1;

  v0 = (void *)CFPreferencesCopyAppValue(CFSTR("Enable SiriActivation watchOS"), CFSTR("com.apple.voicetrigger"));
  if (v0)
  {
    v1 = v0;
    useSiriActivationSPIForwatchOS_ret = objc_msgSend(v0, "BOOLValue");
    v0 = v1;
  }

}

void __48__CSFPreferences_useSiriActivationSPIForHomePod__block_invoke()
{
  void *v0;
  id v1;

  v0 = (void *)CFPreferencesCopyAppValue(CFSTR("Enable SiriActivation HomePod"), CFSTR("com.apple.voicetrigger"));
  if (v0)
  {
    v1 = v0;
    useSiriActivationSPIForHomePod_ret = objc_msgSend(v0, "BOOLValue");
    v0 = v1;
  }

}

void __59__CSFPreferences_smartSiriVolumeContextAwareLoggingEnabled__block_invoke(uint64_t a1)
{
  void *v1;
  int v2;

  if (objc_msgSend(*(id *)(a1 + 32), "smartSiriVolumeContextAwareEnabled"))
  {
    +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "fileLoggingIsEnabled");

    if (v2)
      smartSiriVolumeContextAwareLoggingEnabled_enabled = 1;
  }
}

void __45__CSFPreferences_speakerIdScoreReportingType__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    v2 = (void *)CFPreferencesCopyAppValue(CFSTR("SpeakerId Score Type"), CFSTR("com.apple.voicetrigger"));
    if (v2)
    {
      v4 = v2;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "unsignedIntegerValue");
      v2 = v4;
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      if ((unint64_t)(*(_QWORD *)(v3 + 24) - 4) <= 0xFFFFFFFFFFFFFFFCLL)
        *(_QWORD *)(v3 + 24) = 3;
    }

  }
}

void __40__CSFPreferences_audioInjectionFilePath__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  char isKindOfClass;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315138;
      v10 = "-[CSFPreferences audioInjectionFilePath]_block_invoke";
      _os_log_error_impl(&dword_1B502E000, v8, OS_LOG_TYPE_ERROR, "%s kCSAudioInjectionFilePathKey doesn't have NSString as an array entry", (uint8_t *)&v9, 0xCu);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

void __46__CSFPreferences_exclaveAudioInjectionEnabled__block_invoke()
{
  void *v0;
  void *v1;
  NSObject *v2;
  const __CFString *v3;
  int v4;
  const char *v5;
  __int16 v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v0 = (void *)CFPreferencesCopyValue(CFSTR("Exclave Audio Injection Enabled"), CFSTR("com.apple.voicetrigger.notbackedup"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  v1 = v0;
  if (v0)
    exclaveAudioInjectionEnabled_enabled = objc_msgSend(v0, "BOOLValue");
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v3 = CFSTR("YES");
    if (!exclaveAudioInjectionEnabled_enabled)
      v3 = CFSTR("NO");
    v4 = 136315394;
    v5 = "-[CSFPreferences exclaveAudioInjectionEnabled]_block_invoke";
    v6 = 2112;
    v7 = v3;
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s enabled: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __51__CSFPreferences_programmableAudioInjectionEnabled__block_invoke()
{
  void *v0;
  void *v1;
  NSObject *v2;
  const __CFString *v3;
  int v4;
  const char *v5;
  __int16 v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v0 = (void *)CFPreferencesCopyValue(CFSTR("Programmable Audio Injection Enabled"), CFSTR("com.apple.voicetrigger"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  v1 = v0;
  if (v0)
    programmableAudioInjectionEnabled_enabled = objc_msgSend(v0, "BOOLValue");
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v3 = CFSTR("YES");
    if (!programmableAudioInjectionEnabled_enabled)
      v3 = CFSTR("NO");
    v4 = 136315394;
    v5 = "-[CSFPreferences programmableAudioInjectionEnabled]_block_invoke";
    v6 = 2112;
    v7 = v3;
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s enabled: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __43__CSFPreferences_useSpeexForAudioInjection__block_invoke()
{
  void *v0;
  id v1;

  v0 = (void *)CFPreferencesCopyAppValue(CFSTR("Speex Audio Injection Enabled"), CFSTR("com.apple.voicetrigger"));
  if (v0)
  {
    v1 = v0;
    useSpeexForAudioInjection_enabled = objc_msgSend(v0, "BOOLValue");
    v0 = v1;
  }

}

void __39__CSFPreferences_audioInjectionEnabled__block_invoke()
{
  void *v0;
  void *v1;
  NSObject *v2;
  const __CFString *v3;
  int v4;
  const char *v5;
  __int16 v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v0 = (void *)CFPreferencesCopyValue(CFSTR("Audio Injection Enabled"), CFSTR("com.apple.voicetrigger"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  v1 = v0;
  if (v0)
    audioInjectionEnabled_enabled = objc_msgSend(v0, "BOOLValue");
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v3 = CFSTR("YES");
    if (!audioInjectionEnabled_enabled)
      v3 = CFSTR("NO");
    v4 = 136315394;
    v5 = "-[CSFPreferences audioInjectionEnabled]_block_invoke";
    v6 = 2112;
    v7 = v3;
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s enabled: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __41__CSFPreferences_enableBenchmarkService___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  id v5;

  v2 = (void *)CFPreferencesCopyValue(CFSTR("Enable Model Benchmarking"), CFSTR("com.apple.voicetrigger"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  v5 = v2;
  if (v2)
    LODWORD(v2) = objc_msgSend(v2, "BOOLValue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (_BYTE)v2;
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != (_DWORD)v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3 != 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _CSPreferencesSetValueForKeyFromRoot(v4, CFSTR("Enable Model Benchmarking"));

    CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(_BYTE *)(a1 + 40);
  }

}

void __42__CSFPreferences_myriadFileLoggingEnabled__block_invoke()
{
  void *v0;
  id v1;

  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    v0 = (void *)CFPreferencesCopyAppValue(CFSTR("Myriad File Logging Enabled"), CFSTR("com.apple.voicetrigger"));
    if (v0)
    {
      v1 = v0;
      myriadFileLoggingEnabled_enabled = objc_msgSend(v0, "BOOLValue");
      v0 = v1;
    }

  }
}

id __98__CSFPreferences_setMediaPlayingSettingForAccessory_isMediaPlaying_isInterrupted_interruptedTime___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("Accessory Media Playback Status"));

    if (*(_BYTE *)(a1 + 41))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("Accessory Media Playback Interrupted Time"));

    }
    v6 = v3;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id __70__CSFPreferences_setBooleanAccessorySettingValue_forKey_forAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, *(_QWORD *)(a1 + 32));

    v5 = v3;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __42__CSFPreferences_forceVoiceTriggerAOPMode__block_invoke()
{
  void *v0;
  void *v1;
  NSObject *v2;
  const __CFString *v3;
  int v4;
  const char *v5;
  __int16 v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    v0 = (void *)CFPreferencesCopyAppValue(CFSTR("Force VoiceTrigger AOP Mode"), CFSTR("com.apple.voicetrigger"));
    v1 = v0;
    if (v0)
      forceVoiceTriggerAOPMode_result = objc_msgSend(v0, "BOOLValue");
    v2 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v3 = CFSTR("YES");
      if (!forceVoiceTriggerAOPMode_result)
        v3 = CFSTR("NO");
      v4 = 136315394;
      v5 = "-[CSFPreferences forceVoiceTriggerAOPMode]_block_invoke";
      v6 = 2114;
      v7 = v3;
      _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s Force enabling VoiceTrigger AOP mode ? %{public}@", (uint8_t *)&v4, 0x16u);
    }

  }
}

void __41__CSFPreferences_forceVoiceTriggerAPMode__block_invoke()
{
  void *v0;
  void *v1;
  NSObject *v2;
  const __CFString *v3;
  int v4;
  const char *v5;
  __int16 v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    v0 = (void *)CFPreferencesCopyAppValue(CFSTR("Force VoiceTrigger AP Mode"), CFSTR("com.apple.voicetrigger"));
    v1 = v0;
    if (v0)
      forceVoiceTriggerAPMode_result = objc_msgSend(v0, "BOOLValue");
    v2 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v3 = CFSTR("YES");
      if (!forceVoiceTriggerAPMode_result)
        v3 = CFSTR("NO");
      v4 = 136315394;
      v5 = "-[CSFPreferences forceVoiceTriggerAPMode]_block_invoke";
      v6 = 2114;
      v7 = v3;
      _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s Force enabling VoiceTrigger AP mode ? %{public}@", (uint8_t *)&v4, 0x16u);
    }

  }
}

void __63__CSFPreferences_personalizedSiriEnrollmentAudioLoggingEnabled__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)CFPreferencesCopyAppValue(CFSTR("Personalized Siri Enrollment Audio Logging Enabled"), CFSTR("com.apple.voicetrigger.notbackedup"));
  v1 = v0;
  if (v0)
  {
    v2 = v0;
    LOBYTE(v0) = objc_msgSend(v0, "BOOLValue");
    v1 = v2;
  }
  personalizedSiriEnrollmentAudioLoggingEnabled_audioLoggingEnabled = (char)v0;

}

void __55__CSFPreferences_speakerRecognitionAudioLoggingEnabled__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    v0 = (void *)CFPreferencesCopyAppValue(CFSTR("Speaker Recognition Audio Logging Enabled"), CFSTR("com.apple.voicetrigger"));
    v1 = v0;
    if (v0)
    {
      v2 = v0;
      LOBYTE(v0) = objc_msgSend(v0, "BOOLValue");
      v1 = v2;
    }
    speakerRecognitionAudioLoggingEnabled_speakerRecognitionAudioLogging = (char)v0;

  }
  else
  {
    speakerRecognitionAudioLoggingEnabled_speakerRecognitionAudioLogging = 0;
  }
}

void __40__CSFPreferences_geckoAudioLogDirectory__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "baseDir");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("VoiceTrigger/nearmiss/audio/"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)geckoAudioLogDirectory_path;
  geckoAudioLogDirectory_path = v1;

}

void __47__CSFPreferences_voiceTriggerAudioLogDirectory__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "baseDir");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Logs/CrashReporter/VoiceTrigger/audio/"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)voiceTriggerAudioLogDirectory_path;
  voiceTriggerAudioLogDirectory_path = v1;

}

void __45__CSFPreferences_isDeferredAsrResultsEnabled__block_invoke()
{
  void *v0;
  id v1;
  id v2;

  v0 = (void *)CFPreferencesCopyAppValue(CFSTR("Deferred ASR Delivery"), CFSTR("com.apple.voicetrigger"));
  if (v0)
  {
    if (CSIsInternalBuild_onceToken != -1)
    {
      v2 = v0;
      dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
      v0 = v2;
    }
    if (CSIsInternalBuild_isInternal)
    {
      v1 = v0;
      isDeferredAsrResultsEnabled_deferredASRResultsEnabled = objc_msgSend(v0, "BOOLValue");
      v0 = v1;
    }
  }

}

void __37__CSFPreferences_isGazeSignalEnabled__block_invoke()
{
  void *v0;
  id v1;
  id v2;

  v0 = (void *)CFPreferencesCopyAppValue(CFSTR("Gaze Signal Needed"), CFSTR("com.apple.voicetrigger"));
  if (v0)
  {
    if (CSIsInternalBuild_onceToken != -1)
    {
      v2 = v0;
      dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
      v0 = v2;
    }
    if (CSIsInternalBuild_isInternal)
    {
      v1 = v0;
      isGazeSignalEnabled_enableGaze = objc_msgSend(v0, "BOOLValue");
      v0 = v1;
    }
  }

}

void __33__CSFPreferences_isGazeMandatory__block_invoke()
{
  void *v0;
  id v1;
  id v2;

  v0 = (void *)CFPreferencesCopyAppValue(CFSTR("Gaze Mandatory"), CFSTR("com.apple.voicetrigger"));
  if (v0)
  {
    if (CSIsInternalBuild_onceToken != -1)
    {
      v2 = v0;
      dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
      v0 = v2;
    }
    if (CSIsInternalBuild_isInternal)
    {
      v1 = v0;
      isGazeMandatory_gazeNeeded = objc_msgSend(v0, "BOOLValue");
      v0 = v1;
    }
  }

}

void __52__CSFPreferences_isAttentiveSiriAudioLoggingEnabled__block_invoke()
{
  void *v0;
  id v1;
  id v2;

  v0 = (void *)CFPreferencesCopyAppValue(CFSTR("AttentiveSiri AudioLogging Enabled"), CFSTR("com.apple.voicetrigger"));
  if (v0)
  {
    if (CSIsInternalBuild_onceToken != -1)
    {
      v2 = v0;
      dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
      v0 = v2;
    }
    if (CSIsInternalBuild_isInternal)
    {
      v1 = v0;
      isAttentiveSiriAudioLoggingEnabled_enabled = objc_msgSend(v0, "BOOLValue");
      v0 = v1;
    }
  }

}

uint64_t __41__CSFPreferences_setVoiceTriggerEverUsed__block_invoke()
{
  _CSPreferencesSetValueForKey(MEMORY[0x1E0C9AAB0], CFSTR("VoiceTriggerEverUsed"));
  return CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
}

void __35__CSFPreferences_sharedPreferences__block_invoke()
{
  CSFPreferences *v0;
  void *v1;

  v0 = objc_alloc_init(CSFPreferences);
  v1 = (void *)sharedPreferences_sSharedPreferences;
  sharedPreferences_sSharedPreferences = (uint64_t)v0;

  CSLogInitIfNeededWithSubsystemType(0);
}

@end
