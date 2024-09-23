@implementation AVKitGlobalSettings

- (BOOL)overVideoScrubbingGestureEnabled
{
  return self->_overVideoScrubbingGestureEnabled;
}

- (AVKitGlobalSettings)init
{
  AVKitGlobalSettings *v2;
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  NSObject *v9;
  int v10;
  int v11;
  char v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  int v23;
  void *v24;
  void *v25;
  BOOL v26;
  char v27;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  char v35;
  void *v36;
  char v37;
  void *v38;
  char v39;
  int isQuick;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  NSString *mostRecentAudioLanguageCode;
  uint64_t v46;
  NSObservation *mostRecentAudioLanguageCodeObservation;
  uint64_t v48;
  NSString *mostRecentLegibleLanguageCode;
  uint64_t v50;
  NSObservation *mostRecentLegibleLanguageCodeObservation;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  NSObservation *displayingCaptionsOnSkipBackObservation;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  NSObservation *subtitleEnabledFromAutoStateCodeObservation;
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  id v67;
  objc_super v68;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v68.receiver = self;
  v68.super_class = (Class)AVKitGlobalSettings;
  v2 = -[AVKitGlobalSettings init](&v68, sel_init);
  if (v2)
  {
    objc_opt_self();
    AVApplicationIdentifier();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Home"));
    AVKitUserDefaults();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerForKey:", CFSTR("playerGeneration"));
    v7 = (void *)v6;
    v8 = v4 ^ 1;
    if (v6)
    {
      if (v6 == 1)
      {
        v8 = 0;
      }
      else if (v6 == 2)
      {
        v8 = 1;
      }
      else
      {
        _AVLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          LODWORD(location[0]) = 134217984;
          *(id *)((char *)location + 4) = v7;
          _os_log_error_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_ERROR, "Error: Invalid player generation %ld", (uint8_t *)location, 0xCu);
        }

      }
    }

    v2->_secondGenerationPlayerEnabled = v8;
    objc_opt_self();
    objc_opt_self();
    _CFMZEnabled();
    v10 = dyld_program_sdk_at_least();
    v11 = dyld_program_sdk_at_least();
    v12 = v11;
    if (((v11 | v10 ^ 1) & 1) == 0)
    {
      AVApplicationIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lowercaseString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_msgSend(v14, "hasPrefix:", CFSTR("com.apple."));
    }
    v2->_playbackSpeedControlEnabled = v12;
    objc_opt_self();
    v15 = +[AVKitGlobalSettings _deviceSupportsVisualAnalysis]();
    if (v15)
      LOBYTE(v15) = dyld_program_sdk_at_least();
    v2->_visualAnalysisSupported = v15;
    v2->_visualAnalysisEnabled = v15;
    v2->_isQuickLook = +[AVKitGlobalSettings _isQuickLook]();
    objc_opt_self();
    AVApplicationIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.tv"));

    v2->_isTVApp = v17;
    objc_opt_self();
    AVApplicationIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.applemediaroom"));

    v2->_isArtemisApp = v19;
    objc_opt_self();
    AVKitUserDefaults();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "valueForKey:", CFSTR("fluidSliderEnabled"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
      v22 = objc_msgSend(v20, "BOOLForKey:", CFSTR("fluidSliderEnabled"));
    else
      v22 = 1;

    v2->_fluidSliderEnabled = v22;
    objc_opt_self();
    v2->_frameCountingForAllVideosEnabled = 0;
    objc_opt_self();
    v2->_multiViewEnabled = _os_feature_enabled_impl();
    objc_opt_self();
    v2->_experienceControllerEnabled = _os_feature_enabled_impl();
    v2->_overVideoScrubbingGestureEnabled = +[AVKitGlobalSettings _overVideoScrubbingGestureEnabled](AVKitGlobalSettings, "_overVideoScrubbingGestureEnabled");
    objc_opt_self();
    v23 = +[AVKitGlobalSettings _deviceSupportsVisualAnalysis]();
    if (v23)
      LOBYTE(v23) = dyld_program_sdk_at_least();
    v2->_extendedVisualAnalysisEnabled = v23;
    objc_opt_self();
    AVKitUserDefaults();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "valueForKey:", CFSTR("subjectLiftGestureEnabled"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25 == 0;

    if (v26)
      v27 = 1;
    else
      v27 = objc_msgSend(v24, "BOOLForKey:", CFSTR("subjectLiftGestureEnabled"));

    v2->_subjectLiftGestureEnabled = v27;
    objc_opt_self();
    AVApplicationIdentifier();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (objc_msgSend(v28, "isEqualToString:", CFSTR("com.apple.Fitness")) & 1) != 0
       || objc_msgSend(v28, "isEqualToString:", CFSTR("com.apple.AVKitTester"));

    v2->_attributedContentTitlesSupported = v29;
    objc_opt_self();
    AVKitUserDefaults();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "valueForKey:", CFSTR("searchBannerEnabled"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
      LOBYTE(v31) = objc_msgSend(v30, "BOOLForKey:", CFSTR("searchBannerEnabled"));

    v2->_searchBannerEnabled = (char)v31;
    objc_opt_self();
    v2->_isAVKitMacPlayer = 0;
    objc_opt_self();
    AVApplicationIdentifier();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("com.apple.AVKitTester"));

    v2->_isAVKitTester = v33;
    objc_opt_self();
    AVApplicationIdentifier();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v34, "isEqualToString:", CFSTR("com.apple.Photos")) & 1) != 0)
      v35 = 1;
    else
      v35 = objc_msgSend(v34, "isEqualToString:", CFSTR("com.appleinternal.PhotosPlayground-macOS"));

    v2->_isPhotosApp = v35;
    objc_opt_self();
    AVApplicationIdentifier();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("com.apple.QuickTimePlayerX"));

    v2->_isQuickTimePlayerX = v37;
    objc_opt_self();
    AVApplicationIdentifier();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("com.apple.Spotlight"));

    v2->_isSpotlight = v39;
    objc_opt_self();
    isQuick = _os_feature_enabled_impl();
    if (isQuick)
    {
      isQuick = +[AVKitGlobalSettings _isQuickLook]();
      if (isQuick)
        LOBYTE(isQuick) = dyld_program_sdk_at_least();
    }
    v2->_quickLookModernPlayerControlsEnabled = isQuick;
    objc_opt_self();
    AVKitUserDefaults();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectForKey:", CFSTR("visualAnalysisEnabled"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v43 = v42;
    else
      v43 = 0;

    if (v43)
      v2->_visualAnalysisEnabled = objc_msgSend(v43, "BOOLValue");
    +[AVKitGlobalSettings _mostRecentAudioLanguageCode](AVKitGlobalSettings, "_mostRecentAudioLanguageCode");
    v44 = objc_claimAutoreleasedReturnValue();
    mostRecentAudioLanguageCode = v2->_mostRecentAudioLanguageCode;
    v2->_mostRecentAudioLanguageCode = (NSString *)v44;

    _ObservationForSharedAVKitSetting(v2, CFSTR("RecentAudioLanguageCode"), CFSTR("mostRecentAudioLanguageCode"));
    v46 = objc_claimAutoreleasedReturnValue();
    mostRecentAudioLanguageCodeObservation = v2->_mostRecentAudioLanguageCodeObservation;
    v2->_mostRecentAudioLanguageCodeObservation = (NSObservation *)v46;

    +[AVKitGlobalSettings _mostRecentLegibleLanguageCode](AVKitGlobalSettings, "_mostRecentLegibleLanguageCode");
    v48 = objc_claimAutoreleasedReturnValue();
    mostRecentLegibleLanguageCode = v2->_mostRecentLegibleLanguageCode;
    v2->_mostRecentLegibleLanguageCode = (NSString *)v48;

    _ObservationForSharedAVKitSetting(v2, CFSTR("RecentLegibleLanguageCode"), CFSTR("mostRecentLegibleLanguageCode"));
    v50 = objc_claimAutoreleasedReturnValue();
    mostRecentLegibleLanguageCodeObservation = v2->_mostRecentLegibleLanguageCodeObservation;
    v2->_mostRecentLegibleLanguageCodeObservation = (NSObservation *)v50;

    v2->_displayingCaptionsOnSkipBack = +[AVKitGlobalSettings _isDisplayingCaptionsOnSkipBack](AVKitGlobalSettings, "_isDisplayingCaptionsOnSkipBack");
    objc_initWeak(location, v2);
    v52 = (void *)MEMORY[0x1E0CB3800];
    AVKitUserDefaults();
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "keyPathWithRootObject:path:", v53, objc_msgSend(CFSTR("isDisplayingCaptionsOnSkipBack"), "UTF8String"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = MEMORY[0x1E0C809B0];
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __27__AVKitGlobalSettings_init__block_invoke;
    v66[3] = &unk_1E5BB0790;
    objc_copyWeak(&v67, location);
    objc_msgSend(v54, "addObserverBlock:", v66);
    v56 = objc_claimAutoreleasedReturnValue();
    displayingCaptionsOnSkipBackObservation = v2->_displayingCaptionsOnSkipBackObservation;
    v2->_displayingCaptionsOnSkipBackObservation = (NSObservation *)v56;

    v2->_enhanceDialogueEnabled = +[AVKitGlobalSettings _enhanceDialogueEnabled](AVKitGlobalSettings, "_enhanceDialogueEnabled");
    v2->_subtitleAutomaticallyEnabledState = +[AVKitGlobalSettings _subtitleAutomaticallyEnabledState](AVKitGlobalSettings, "_subtitleAutomaticallyEnabledState");
    v58 = (void *)MEMORY[0x1E0CB3800];
    AVKitUserDefaults();
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "keyPathWithRootObject:path:", v59, objc_msgSend(CFSTR("subtitleAutomaticallyEnabledState"), "UTF8String"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v55;
    v64[1] = 3221225472;
    v64[2] = __27__AVKitGlobalSettings_init__block_invoke_3;
    v64[3] = &unk_1E5BB0790;
    objc_copyWeak(&v65, location);
    objc_msgSend(v60, "addObserverBlock:", v64);
    v61 = objc_claimAutoreleasedReturnValue();
    subtitleEnabledFromAutoStateCodeObservation = v2->_subtitleEnabledFromAutoStateCodeObservation;
    v2->_subtitleEnabledFromAutoStateCodeObservation = (NSObservation *)v61;

    objc_destroyWeak(&v65);
    objc_destroyWeak(&v67);
    objc_destroyWeak(location);

  }
  return v2;
}

+ (uint64_t)_deviceSupportsVisualAnalysis
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  objc_opt_self();
  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getVKCImageAnalyzerClass_softClass;
  v7 = getVKCImageAnalyzerClass_softClass;
  if (!getVKCImageAnalyzerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVKCImageAnalyzerClass_block_invoke;
    v3[3] = &unk_1E5BB4748;
    v3[4] = &v4;
    __getVKCImageAnalyzerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v4, 8);
  return objc_msgSend(v1, "deviceSupportsImageAnalysis");
}

+ (BOOL)_overVideoScrubbingGestureEnabled
{
  void *v2;
  void *v3;

  AVKitUserDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("overVideoScrubbingGestureEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    LOBYTE(v3) = objc_msgSend(v2, "BOOLForKey:", CFSTR("overVideoScrubbingGestureEnabled"));

  return (char)v3;
}

- (BOOL)visualAnalysisSupported
{
  return self->_visualAnalysisSupported;
}

+ (id)shared
{
  if (shared_createAVKitGlobalSettingsOnce != -1)
    dispatch_once(&shared_createAVKitGlobalSettingsOnce, &__block_literal_global);
  return (id)AVKitSharedGlobalSettings;
}

- (BOOL)isTVApp
{
  return self->_isTVApp;
}

- (BOOL)playbackSpeedControlEnabled
{
  return self->_playbackSpeedControlEnabled;
}

- (BOOL)visualAnalysisEnabled
{
  return self->_visualAnalysisEnabled;
}

- (BOOL)extendedVisualAnalysisEnabled
{
  return self->_extendedVisualAnalysisEnabled;
}

- (BOOL)secondGenerationPlayerEnabled
{
  return self->_secondGenerationPlayerEnabled;
}

void __29__AVKitGlobalSettings_shared__block_invoke()
{
  AVKitGlobalSettings *v0;
  void *v1;

  v0 = objc_alloc_init(AVKitGlobalSettings);
  v1 = (void *)AVKitSharedGlobalSettings;
  AVKitSharedGlobalSettings = (uint64_t)v0;

}

- (void)setSecondGenerationPlayerEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_secondGenerationPlayerEnabled != a3)
  {
    v3 = a3;
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      v7 = 136315650;
      v8 = "-[AVKitGlobalSettings setSecondGenerationPlayerEnabled:]";
      v10 = "secondGenerationPlayerEnabled";
      v9 = 2080;
      if (v3)
        v6 = "YES";
      v11 = 2080;
      v12 = v6;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    self->_secondGenerationPlayerEnabled = v3;
  }
}

- (void)setMostRecentLegibleLanguageCode:(id)a3
{
  NSString *v4;
  NSString *mostRecentLegibleLanguageCode;
  NSObject *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  NSString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)a3;
  mostRecentLegibleLanguageCode = self->_mostRecentLegibleLanguageCode;
  if (mostRecentLegibleLanguageCode != v4
    && (!v4 || !-[NSString isEqualToString:](mostRecentLegibleLanguageCode, "isEqualToString:", v4)))
  {
    _AVLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315394;
      v13 = "-[AVKitGlobalSettings setMostRecentLegibleLanguageCode:]";
      v14 = 2114;
      v15 = v4;
      _os_log_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_DEFAULT, "%s '%{public}@", (uint8_t *)&v12, 0x16u);
    }

    v7 = (NSString *)-[NSString copy](v4, "copy");
    v8 = self->_mostRecentLegibleLanguageCode;
    self->_mostRecentLegibleLanguageCode = v7;

    +[AVKitGlobalSettings _mostRecentLegibleLanguageCode](AVKitGlobalSettings, "_mostRecentLegibleLanguageCode");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 != v4 && (!v4 || !v9 || !-[NSString isEqualToString:](v9, "isEqualToString:", v4)))
    {
      _AVLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315138;
        v13 = "-[AVKitGlobalSettings setMostRecentLegibleLanguageCode:]";
        _os_log_impl(&dword_1AC4B1000, v11, OS_LOG_TYPE_DEFAULT, "%s updating the shared setting", (uint8_t *)&v12, 0xCu);
      }

      -[AVKitGlobalSettings setSharedSetting:toString:](self, "setSharedSetting:toString:", CFSTR("RecentLegibleLanguageCode"), v4);
    }

  }
}

- (void)setMostRecentAudioLanguageCode:(id)a3
{
  NSString *v4;
  NSString *mostRecentAudioLanguageCode;
  NSObject *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  NSString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)a3;
  mostRecentAudioLanguageCode = self->_mostRecentAudioLanguageCode;
  if (mostRecentAudioLanguageCode != v4
    && (!v4 || !-[NSString isEqualToString:](mostRecentAudioLanguageCode, "isEqualToString:", v4)))
  {
    _AVLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315394;
      v13 = "-[AVKitGlobalSettings setMostRecentAudioLanguageCode:]";
      v14 = 2114;
      v15 = v4;
      _os_log_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_DEFAULT, "%s '%{public}@", (uint8_t *)&v12, 0x16u);
    }

    v7 = (NSString *)-[NSString copy](v4, "copy");
    v8 = self->_mostRecentAudioLanguageCode;
    self->_mostRecentAudioLanguageCode = v7;

    +[AVKitGlobalSettings _mostRecentAudioLanguageCode](AVKitGlobalSettings, "_mostRecentAudioLanguageCode");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 != v4 && (!v4 || !v9 || !-[NSString isEqualToString:](v9, "isEqualToString:", v4)))
    {
      _AVLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315138;
        v13 = "-[AVKitGlobalSettings setMostRecentAudioLanguageCode:]";
        _os_log_impl(&dword_1AC4B1000, v11, OS_LOG_TYPE_DEFAULT, "%s updating the shared setting", (uint8_t *)&v12, 0xCu);
      }

      -[AVKitGlobalSettings setSharedSetting:toString:](self, "setSharedSetting:toString:", CFSTR("RecentAudioLanguageCode"), v4);
    }

  }
}

- (void)setSubtitleAutomaticallyEnabledState:(unint64_t)a3
{
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_subtitleAutomaticallyEnabledState != a3)
  {
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "YES";
      *(_DWORD *)buf = 136315650;
      v10 = "-[AVKitGlobalSettings setSubtitleAutomaticallyEnabledState:]";
      v12 = "subtitleAutomaticallyEnabledState";
      v11 = 2080;
      if (!a3)
        v6 = "NO";
      v13 = 2080;
      v14 = v6;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", buf, 0x20u);
    }

    self->_subtitleAutomaticallyEnabledState = a3;
    if (+[AVKitGlobalSettings _subtitleAutomaticallyEnabledState](AVKitGlobalSettings, "_subtitleAutomaticallyEnabledState") != a3)
    {
      _AVLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v10 = "-[AVKitGlobalSettings setSubtitleAutomaticallyEnabledState:]";
        v11 = 2048;
        v12 = (const char *)a3;
        _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "%s updating the shared setting: %ld ", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVKitGlobalSettings setSharedSetting:toString:](self, "setSharedSetting:toString:", CFSTR("subtitleAutomaticallyEnabledState"), v8);

    }
  }
}

- (BOOL)skipBackCaptionsEnabled
{
  int v2;

  v2 = _os_feature_enabled_impl();
  if (v2)
    LOBYTE(v2) = _AXSAutomaticSubtitlesShowOnSkipBack() != 0;
  return v2;
}

- (void)setDisplayingCaptionsOnSkipBack:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  const __CFString *v8;
  _BYTE v9[24];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_displayingCaptionsOnSkipBack != a3)
  {
    v3 = a3;
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      *(_DWORD *)v9 = 136315650;
      *(_QWORD *)&v9[4] = "-[AVKitGlobalSettings setDisplayingCaptionsOnSkipBack:]";
      *(_QWORD *)&v9[14] = "displayingCaptionsOnSkipBack";
      *(_WORD *)&v9[12] = 2080;
      if (v3)
        v6 = "YES";
      *(_WORD *)&v9[22] = 2080;
      v10 = v6;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", v9, 0x20u);
    }

    self->_displayingCaptionsOnSkipBack = v3;
    if (+[AVKitGlobalSettings _isDisplayingCaptionsOnSkipBack](AVKitGlobalSettings, "_isDisplayingCaptionsOnSkipBack") != v3)
    {
      _AVLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v9 = 136315138;
        *(_QWORD *)&v9[4] = "-[AVKitGlobalSettings setDisplayingCaptionsOnSkipBack:]";
        _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "%s updating the shared setting", v9, 0xCu);
      }

      if (v3)
        v8 = CFSTR("YES");
      else
        v8 = CFSTR("NO");
      -[AVKitGlobalSettings setSharedSetting:toString:](self, "setSharedSetting:toString:", CFSTR("isDisplayingCaptionsOnSkipBack"), v8, *(_OWORD *)v9, *(_QWORD *)&v9[16]);
    }
  }
}

- (NSArray)preferredLanguages
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
}

- (BOOL)subtitlesOnMuteiOSEnabled
{
  int v2;

  v2 = _os_feature_enabled_impl();
  if (v2)
    LOBYTE(v2) = _AXSAutomaticSubtitlesShowWhenMuted() != 0;
  return v2;
}

- (void)setSharedSetting:(id)a3 toString:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.avkit.SharedPreferences"));
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EECF1C60);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRemoteObjectInterface:", v8);

  objc_msgSend(v7, "resume");
  objc_msgSend(v7, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__AVKitGlobalSettings_setSharedSetting_toString___block_invoke;
  v13[3] = &unk_1E5BB3B00;
  v14 = v5;
  v15 = v6;
  v16 = v7;
  v10 = v7;
  v11 = v6;
  v12 = v5;
  objc_msgSend(v9, "setString:forKey:completion:", v11, v12, v13);

}

- (BOOL)isQuickLook
{
  return self->_isQuickLook;
}

- (BOOL)isArtemisApp
{
  return self->_isArtemisApp;
}

- (BOOL)isAVKitMacPlayer
{
  return self->_isAVKitMacPlayer;
}

- (BOOL)isAVKitTester
{
  return self->_isAVKitTester;
}

- (BOOL)isPhotosApp
{
  return self->_isPhotosApp;
}

- (BOOL)isQuickTimePlayerX
{
  return self->_isQuickTimePlayerX;
}

- (BOOL)isSpotlight
{
  return self->_isSpotlight;
}

- (BOOL)subjectLiftGestureEnabled
{
  return self->_subjectLiftGestureEnabled;
}

- (BOOL)searchBannerEnabled
{
  return self->_searchBannerEnabled;
}

- (BOOL)fluidSliderEnabled
{
  return self->_fluidSliderEnabled;
}

- (BOOL)frameCountingForAllVideosEnabled
{
  return self->_frameCountingForAllVideosEnabled;
}

- (BOOL)multiViewEnabled
{
  return self->_multiViewEnabled;
}

- (BOOL)experienceControllerEnabled
{
  return self->_experienceControllerEnabled;
}

- (BOOL)quickLookModernPlayerControlsEnabled
{
  return self->_quickLookModernPlayerControlsEnabled;
}

- (BOOL)attributedContentTitlesSupported
{
  return self->_attributedContentTitlesSupported;
}

- (NSString)mostRecentLegibleLanguageCode
{
  return self->_mostRecentLegibleLanguageCode;
}

- (NSString)mostRecentAudioLanguageCode
{
  return self->_mostRecentAudioLanguageCode;
}

- (BOOL)isDisplayingCaptionsOnSkipBack
{
  return self->_displayingCaptionsOnSkipBack;
}

- (BOOL)enhanceDialogueEnabled
{
  return self->_enhanceDialogueEnabled;
}

- (unint64_t)subtitleAutomaticallyEnabledState
{
  return self->_subtitleAutomaticallyEnabledState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentAudioLanguageCode, 0);
  objc_storeStrong((id *)&self->_mostRecentLegibleLanguageCode, 0);
  objc_storeStrong((id *)&self->_subtitleEnabledFromAutoStateCodeObservation, 0);
  objc_storeStrong((id *)&self->_displayingCaptionsOnSkipBackObservation, 0);
  objc_storeStrong((id *)&self->_mostRecentAudioLanguageCodeObservation, 0);
  objc_storeStrong((id *)&self->_mostRecentLegibleLanguageCodeObservation, 0);
}

uint64_t __49__AVKitGlobalSettings_setSharedSetting_toString___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1AC4B1000, v2, OS_LOG_TYPE_DEFAULT, "setSharedSetting: set %{public}@ to %{public}@", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 48), "invalidate");
}

+ (uint64_t)_isQuickLook
{
  void *v0;
  uint64_t v1;

  objc_opt_self();
  AVApplicationIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.quicklook.UIExtension")) & 1) != 0)
    v1 = 1;
  else
    v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.quicklook.extension.previewUI"));

  return v1;
}

void __27__AVKitGlobalSettings_init__block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__AVKitGlobalSettings_init__block_invoke_2;
  block[3] = &unk_1E5BB4A40;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __27__AVKitGlobalSettings_init__block_invoke_3(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__AVKitGlobalSettings_init__block_invoke_4;
  block[3] = &unk_1E5BB4A40;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __27__AVKitGlobalSettings_init__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setSubtitleAutomaticallyEnabledState:", +[AVKitGlobalSettings _subtitleAutomaticallyEnabledState](AVKitGlobalSettings, "_subtitleAutomaticallyEnabledState"));

}

void __27__AVKitGlobalSettings_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setDisplayingCaptionsOnSkipBack:", +[AVKitGlobalSettings _isDisplayingCaptionsOnSkipBack](AVKitGlobalSettings, "_isDisplayingCaptionsOnSkipBack"));

}

+ (id)_mostRecentLegibleLanguageCode
{
  void *v2;
  void *v3;

  AVKitUserDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("RecentLegibleLanguageCode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_mostRecentAudioLanguageCode
{
  void *v2;
  void *v3;

  AVKitUserDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("RecentAudioLanguageCode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)_isDisplayingCaptionsOnSkipBack
{
  void *v2;
  char v3;

  AVKitUserDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("isDisplayingCaptionsOnSkipBack"));

  return v3;
}

+ (BOOL)_enhanceDialogueEnabled
{
  return _os_feature_enabled_impl();
}

+ (unint64_t)_subtitleAutomaticallyEnabledState
{
  void *v2;
  unint64_t v3;

  AVKitUserDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("subtitleAutomaticallyEnabledState"));

  return v3;
}

@end
