@implementation CESRAudioSamplingConfigManager

- (CESRAudioSamplingConfigManager)init
{
  return -[CESRAudioSamplingConfigManager initWithAudioSamplingConfigDict:](self, "initWithAudioSamplingConfigDict:", 0);
}

- (CESRAudioSamplingConfigManager)initWithAudioSamplingConfigDict:(id)a3
{
  id v5;
  CESRAudioSamplingConfigManager *v6;
  CESRAudioSamplingConfigManager *v7;
  uint64_t v8;
  NSMutableDictionary *audioSamplingConfigDict;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CESRAudioSamplingConfigManager;
  v6 = -[CESRAudioSamplingConfigManager init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_audioSamplingConfigDict, a3);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v8 = objc_claimAutoreleasedReturnValue();
      audioSamplingConfigDict = v7->_audioSamplingConfigDict;
      v7->_audioSamplingConfigDict = (NSMutableDictionary *)v8;

      -[CESRAudioSamplingConfigManager loadConfigs](v7, "loadConfigs");
    }
  }

  return v7;
}

- (void)loadConfigs
{
  uint64_t v3;
  char v4;
  char v5;
  void *v6;
  NSMutableDictionary *audioSamplingConfigDict;
  void *v8;

  v3 = 0;
  v4 = 1;
  do
  {
    v5 = v4;
    -[CESRAudioSamplingConfigManager _createConfigFromProductType:](self, "_createConfigFromProductType:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      audioSamplingConfigDict = self->_audioSamplingConfigDict;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](audioSamplingConfigDict, "setObject:forKey:", v6, v8);

    }
    v4 = 0;
    v3 = 1;
  }
  while ((v5 & 1) != 0);
}

- (id)audioSamplingConfigDict
{
  return self->_audioSamplingConfigDict;
}

- (id)_createConfigFromProductType:(int64_t)a3
{
  const __CFString *v3;
  os_log_t *v4;
  NSObject *v5;
  id v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  CESRAudioSamplingConfig *v10;
  int v12;
  const char *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a3 != 1)
      return 0;
    v3 = CFSTR("com.apple.siri.asr.assistant.audio.sampling");
  }
  else
  {
    v3 = CFSTR("com.apple.siri.asr.dictation.audio.sampling");
  }
  v4 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  v5 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
  {
    v12 = 136315394;
    v13 = "-[CESRAudioSamplingConfigManager _createConfigFromProductType:]";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1B3E5F000, v5, OS_LOG_TYPE_DEBUG, "%s Loading Sampling Config for Factor Name: %@", (uint8_t *)&v12, 0x16u);
  }
  v6 = objc_alloc_init(MEMORY[0x1E0CD7F48]);
  objc_msgSend(v6, "installedAudioSamplingConfigWithAssetName:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *v4;
  v9 = os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v9)
    {
      v12 = 136315650;
      v13 = "-[CESRAudioSamplingConfigManager _createConfigFromProductType:]";
      v14 = 2112;
      v15 = v3;
      v16 = 2112;
      v17 = v7;
      _os_log_debug_impl(&dword_1B3E5F000, v8, OS_LOG_TYPE_DEBUG, "%s File Path for Factor Name: %@ is %@", (uint8_t *)&v12, 0x20u);
    }
    v10 = -[CESRAudioSamplingConfig initWithConfigPath:]([CESRAudioSamplingConfig alloc], "initWithConfigPath:", v7);
  }
  else
  {
    if (v9)
    {
      v12 = 136315394;
      v13 = "-[CESRAudioSamplingConfigManager _createConfigFromProductType:]";
      v14 = 2112;
      v15 = v3;
      _os_log_debug_impl(&dword_1B3E5F000, v8, OS_LOG_TYPE_DEBUG, "%s No File Path for Factor Name: %@", (uint8_t *)&v12, 0x16u);
    }
    v10 = 0;
  }

  return v10;
}

- (BOOL)shouldSampleFromConfigForProductType:(int64_t)a3 language:(id)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *audioSamplingConfigDict;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  CESRSamplingDimension *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  NSObject *v20;
  float v21;
  NSObject *v22;
  NSObject *v23;
  int v25;
  const char *v26;
  __int16 v27;
  double v28;
  __int16 v29;
  _BOOL4 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    v7 = v6;
    audioSamplingConfigDict = self->_audioSamplingConfigDict;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](audioSamplingConfigDict, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      _AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      if (v11)
        v13 = (void *)v11;
      else
        v13 = v7;
      v14 = v13;

      v15 = -[CESRSamplingDimension initWithAsrLocale:]([CESRSamplingDimension alloc], "initWithAsrLocale:", v14);
      objc_msgSend(v10, "getSamplingRateFromDimension:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        objc_msgSend(v16, "floatValue");
        v18 = +[CESRAudioSamplingUtilities isUniformlySampledWithSamplingRate:](CESRAudioSamplingUtilities, "isUniformlySampledWithSamplingRate:");
        v19 = (void *)*MEMORY[0x1E0CFE6C0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
        {
          v20 = v19;
          objc_msgSend(v17, "floatValue");
          v25 = 136315650;
          v26 = "-[CESRAudioSamplingConfigManager shouldSampleFromConfigForProductType:language:]";
          v27 = 2048;
          v28 = v21;
          v29 = 1024;
          v30 = v18;
          _os_log_debug_impl(&dword_1B3E5F000, v20, OS_LOG_TYPE_DEBUG, "%s Sampled with sampling rate = %lf, sampled result = %d", (uint8_t *)&v25, 0x1Cu);

        }
      }
      else
      {
        v23 = *MEMORY[0x1E0CFE6C0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
        {
          v25 = 136315138;
          v26 = "-[CESRAudioSamplingConfigManager shouldSampleFromConfigForProductType:language:]";
          _os_log_debug_impl(&dword_1B3E5F000, v23, OS_LOG_TYPE_DEBUG, "%s No Sampling Rate Returned", (uint8_t *)&v25, 0xCu);
        }
        LOBYTE(v18) = 1;
      }

      v7 = v14;
    }
    else
    {
      v22 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
      {
        v25 = 136315138;
        v26 = "-[CESRAudioSamplingConfigManager shouldSampleFromConfigForProductType:language:]";
        _os_log_debug_impl(&dword_1B3E5F000, v22, OS_LOG_TYPE_DEBUG, "%s No Sampling Config Available", (uint8_t *)&v25, 0xCu);
      }
      LOBYTE(v18) = 1;
    }

  }
  else
  {
    LOBYTE(v18) = 1;
  }
  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioSamplingConfigDict, 0);
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_2690 != -1)
    dispatch_once(&sharedManager_onceToken_2690, &__block_literal_global_2691);
  return (id)sharedManager_sharedMyManager_2692;
}

void __47__CESRAudioSamplingConfigManager_sharedManager__block_invoke()
{
  CESRAudioSamplingConfigManager *v0;
  void *v1;

  v0 = objc_alloc_init(CESRAudioSamplingConfigManager);
  v1 = (void *)sharedManager_sharedMyManager_2692;
  sharedManager_sharedMyManager_2692 = (uint64_t)v0;

}

@end
