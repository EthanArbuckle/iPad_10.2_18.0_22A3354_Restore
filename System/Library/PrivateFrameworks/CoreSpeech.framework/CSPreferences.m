@implementation CSPreferences

- (void)setFileLoggingIsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFileLoggingIsEnabled:", v3);

}

- (BOOL)fileLoggingIsEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fileLoggingIsEnabled");

  return v3;
}

- (id)voiceTriggerAudioLogDirectory
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "voiceTriggerAudioLogDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)voiceTriggerEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "voiceTriggerEnabled");

  return v3;
}

- (BOOL)isPHSSupported
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPHSSupported");

  return v3;
}

- (BOOL)isAttentiveSiriEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAttentiveSiriEnabled");

  return v3;
}

- (BOOL)isAttentiveSiriAudioLoggingEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAttentiveSiriAudioLoggingEnabled");

  return v3;
}

- (BOOL)isGazeSimlModelEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isGazeSimlModelEnabled");

  return v3;
}

- (BOOL)isGazeMandatory
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isGazeMandatory");

  return v3;
}

- (BOOL)isGazeSignalEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isGazeSignalEnabled");

  return v3;
}

- (float)getAttendingTimeoutConfig
{
  void *v2;
  float v3;
  float v4;

  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getAttendingTimeoutConfig");
  v4 = v3;

  return v4;
}

- (BOOL)twoShotNotificationEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "twoShotNotificationEnabled");

  return v3;
}

- (id)getStartOfSpeechAudioLogFilePath
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getStartOfSpeechAudioLogFilePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setAudioInjectionFilePath:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0D19110];
  v4 = a3;
  objc_msgSend(v3, "sharedPreferences");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAudioInjectionFilePath:", v4);

}

- (BOOL)enableAudioInjection:(BOOL)a3
{
  uint64_t v3;
  void *v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "enableAudioInjection:", v3);

  return v3;
}

- (BOOL)useSiriActivationSPIForHomePod
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "useSiriActivationSPIForHomePod");

  return v3;
}

- (id)trialBaseAssetDirectory
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trialBaseAssetDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)smartSiriVolumeContextAwareEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "smartSiriVolumeContextAwareEnabled");

  return v3;
}

- (void)disableAdaptiveSiriVolume:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0D19110];
  v4 = a3;
  objc_msgSend(v3, "sharedPreferences");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "disableAdaptiveSiriVolume:", v4);

}

- (BOOL)isAdaptiveSiriVolumeTemporaryIntentValid
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAdaptiveSiriVolumeTemporaryIntentValid");

  return v3;
}

- (BOOL)isAdaptiveSiriVolumePermanentOffsetEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAdaptiveSiriVolumePermanentOffsetEnabled");

  return v3;
}

- (float)adaptiveSiriVolumePermanentOffset
{
  void *v2;
  float v3;
  float v4;

  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "adaptiveSiriVolumePermanentOffset");
  v4 = v3;

  return v4;
}

- (int)adaptiveSiriVolumeRecentIntent
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "adaptiveSiriVolumeRecentIntent");

  return v3;
}

- (BOOL)isFlexibleFollowupsUserDisabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFlexibleFollowupsUserDisabled");

  return v3;
}

- (BOOL)isFlexibleFollowupsSupported
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFlexibleFollowupsSupported");

  return v3;
}

- (id)dateWhenVoiceTriggerRePrompted
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateWhenVoiceTriggerRePrompted");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)sharedPreferences
{
  if (sharedPreferences_onceToken != -1)
    dispatch_once(&sharedPreferences_onceToken, &__block_literal_global_18892);
  return (id)sharedPreferences_sSharedPreferences;
}

void __34__CSPreferences_sharedPreferences__block_invoke()
{
  CSPreferences *v0;
  void *v1;

  v0 = objc_alloc_init(CSPreferences);
  v1 = (void *)sharedPreferences_sSharedPreferences;
  sharedPreferences_sSharedPreferences = (uint64_t)v0;

}

@end
