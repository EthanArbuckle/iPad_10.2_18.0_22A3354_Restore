@implementation AXSettingsPrimaryResourceDownloadController

- (AXSettingsPrimaryResourceDownloadController)init
{
  AXSettingsPrimaryResourceDownloadController *v2;
  void *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *loadVoiceFootprintsQueue;
  NSLock *v6;
  NSLock *voiceFootprintLock;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AXSettingsPrimaryResourceDownloadController;
  v2 = -[AXSettingsResourceDownloadController init](&v16, sel_init);
  objc_initWeak(&location, v2);
  objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __51__AXSettingsPrimaryResourceDownloadController_init__block_invoke;
  v13 = &unk_1E76AB200;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v3, "registerUpdateBlock:forRetrieveSelector:withListener:", &v10, sel_voiceOverSpeakingRateForLanguage_, v2);

  objc_destroyWeak(&v14);
  v4 = dispatch_queue_create("load_voice_footprints_queue", 0);
  loadVoiceFootprintsQueue = v2->_loadVoiceFootprintsQueue;
  v2->_loadVoiceFootprintsQueue = (OS_dispatch_queue *)v4;

  v6 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
  voiceFootprintLock = v2->_voiceFootprintLock;
  v2->_voiceFootprintLock = v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array", v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSettingsPrimaryResourceDownloadController setVoiceFootprints:](v2, "setVoiceFootprints:", v8);

  objc_destroyWeak(&location);
  return v2;
}

void __51__AXSettingsPrimaryResourceDownloadController_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateSpeakingRate");

}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AXSettingsPrimaryResourceDownloadController;
  -[AXUISettingsSetupCapableListController viewDidLoad](&v11, sel_viewDidLoad);
  objc_initWeak(&location, self);
  -[AXSettingsResourceDownloadController speechModelController](self, "speechModelController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__AXSettingsPrimaryResourceDownloadController_viewDidLoad__block_invoke;
  v8[3] = &unk_1E76AB200;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "setResourceCacheDidReceiveUpdateCallback:", v8);

  -[AXSettingsResourceDownloadController speechModelController](self, "speechModelController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __58__AXSettingsPrimaryResourceDownloadController_viewDidLoad__block_invoke_3;
  v6[3] = &unk_1E76AB200;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "setSelectedVoiceDidUpdateCallback:", v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __58__AXSettingsPrimaryResourceDownloadController_viewDidLoad__block_invoke(uint64_t a1)
{
  id *v1;
  _QWORD *WeakRetained;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (void *)WeakRetained[191];
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__AXSettingsPrimaryResourceDownloadController_viewDidLoad__block_invoke_2;
    block[3] = &unk_1E76AB200;
    v4 = v3;
    objc_copyWeak(&v6, v1);
    dispatch_async(v4, block);

    objc_destroyWeak(&v6);
  }

}

void __58__AXSettingsPrimaryResourceDownloadController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "createVoiceFootprints");

}

void __58__AXSettingsPrimaryResourceDownloadController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reloadSpecifiers");

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AXSettingsPrimaryResourceDownloadController;
  -[AXSettingsPrimaryResourceDownloadController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  if (-[AXSettingsPrimaryResourceDownloadController showDialectInTitle](self, "showDialectInTitle"))
  {
    objc_msgSend(MEMORY[0x1E0CF4E80], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSettingsPrimaryResourceDownloadController language](self, "language");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dialectForLanguageID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "languageNameAndLocaleInCurrentLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSettingsPrimaryResourceDownloadController setTitle:](self, "setTitle:", v7);

  }
  else
  {
    -[AXSettingsPrimaryResourceDownloadController languageMap](self, "languageMap");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultDialect");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "languageNameInCurrentLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSettingsPrimaryResourceDownloadController setTitle:](self, "setTitle:", v6);
  }

  -[AXSettingsPrimaryResourceDownloadController reloadSpecifiers](self, "reloadSpecifiers");
  -[AXSettingsResourceDownloadController speechModelController](self, "speechModelController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "refreshAssetCatalog:downloadSamplesIfNeeded:restartMigrationIfNeeded:", 1, 1, 1);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[AXSettingsResourceDownloadController speechModelController](self, "speechModelController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setResourceCacheDidReceiveUpdateCallback:", 0);

  v4.receiver = self;
  v4.super_class = (Class)AXSettingsPrimaryResourceDownloadController;
  -[AXUISettingsListController dealloc](&v4, sel_dealloc);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80598]), "setEditing:animated:", a3, a4);
}

- (void)_updateSpeakingRate
{
  id v3;

  -[AXUISettingsListController specifierForKey:](self, "specifierForKey:", CFSTR("SpeakingRate"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AXSettingsPrimaryResourceDownloadController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v3, 1);

}

- (NSString)language
{
  NSString *language;
  NSString *v3;
  void *v4;
  void *v5;

  language = self->_language;
  if (language)
  {
    v3 = language;
  }
  else
  {
    -[AXSettingsPrimaryResourceDownloadController specifier](self, "specifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "propertyForKey:", &stru_1E76AC698);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    AXCLanguageConvertToCanonicalForm();
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)setLanguage:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_storeStrong((id *)&self->_language, a3);
  if (self->_language)
  {
    AXCLanguageConvertToCanonicalForm();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CF4E80], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dialectForLanguageID:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "langMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXSettingsPrimaryResourceDownloadController setLanguageMap:](self, "setLanguageMap:", v8);
  }

}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v7 = (void *)MEMORY[0x1E0CB36B0];
  v8 = a4;
  objc_msgSend(v7, "indexPathForRow:inSection:", 0, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSettingsPrimaryResourceDownloadController specifierAtIndexPath:](self, "specifierAtIndexPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSettingsPrimaryResourceDownloadController getGroupSpecifierForSpecifier:](self, "getGroupSpecifierForSpecifier:", v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityLabel:", v11);

  objc_msgSend(v8, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("SkipConvertToLowercase"));
}

- (id)_getSelectedVariation:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(void);
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AXSettingsResourceDownloadController getDialectPreferencesCallback](self, "getDialectPreferencesCallback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AXSettingsResourceDownloadController getDialectPreferencesCallback](self, "getDialectPreferencesCallback");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v4, "propertyForKey:", CFSTR("Resources"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v8, "count") < 2)
  {
    v18 = 0;
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v24;
      v22 = v4;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v14, "voiceId");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", v7);

          if (v16)
          {
            if (objc_msgSend(MEMORY[0x1E0DBEF18], "isSiriVoiceIdentifier:", v7))
            {
              objc_msgSend(v14, "voiceId");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              AXSiriDisplayNameForIdentifier();
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              if (v18)
                goto LABEL_26;
            }
            if (objc_msgSend(v14, "type") == 9)
            {
              objc_msgSend(v14, "localizedName");
              v19 = objc_claimAutoreleasedReturnValue();
LABEL_25:
              v18 = (void *)v19;
LABEL_26:
              v4 = v22;
              goto LABEL_27;
            }
            if (objc_msgSend(v14, "footprint") == 4)
            {
              v20 = CFSTR("VOICE_QUICK_SUMMARY_ENHANCED");
LABEL_24:
              AXUILocalizedStringForKey(v20);
              v19 = objc_claimAutoreleasedReturnValue();
              goto LABEL_25;
            }
            if (objc_msgSend(v14, "footprint") == 5)
            {
              v20 = CFSTR("VOICE_QUICK_SUMMARY_PREMIUM");
              goto LABEL_24;
            }
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        v18 = 0;
        v4 = v22;
        if (v11)
          continue;
        break;
      }
    }
    else
    {
      v18 = 0;
    }
LABEL_27:

  }
  return v18;
}

- (void)createVoiceFootprints
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD block[5];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_voiceFootprintLock, "lock");
  self->_loadingVoiceFootprints = 1;
  -[NSLock unlock](self->_voiceFootprintLock, "unlock");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AXSettingsPrimaryResourceDownloadController showDialectPicker](self, "showDialectPicker");
  objc_msgSend(MEMORY[0x1E0CF4E80], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "systemLanguageID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("yue"));

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CF4E80], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "systemLanguageID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      AXCRemapLanguageCodeToFallbackIfNeccessary();
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", v13);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "localeIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXSettingsPrimaryResourceDownloadController languageMap](self, "languageMap");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    AXSortedDialectsForDisplay(v18, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v20 = v19;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v27;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v27 != v23)
            objc_enumerationMutation(v20);
          -[AXSettingsPrimaryResourceDownloadController addVoiceFootprintsToArray:forDialect:](self, "addVoiceFootprintsToArray:forDialect:", v3, *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v24++));
        }
        while (v22 != v24);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v22);
    }

  }
  else
  {
    -[AXSettingsPrimaryResourceDownloadController language](self, "language");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dialectForLanguageID:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXSettingsPrimaryResourceDownloadController addVoiceFootprintsToArray:forDialect:](self, "addVoiceFootprintsToArray:forDialect:", v3, v16);
  }
  -[NSLock lock](self->_voiceFootprintLock, "lock");
  -[AXSettingsPrimaryResourceDownloadController setVoiceFootprints:](self, "setVoiceFootprints:", v3);
  -[NSLock unlock](self->_voiceFootprintLock, "unlock");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__AXSettingsPrimaryResourceDownloadController_createVoiceFootprints__block_invoke;
  block[3] = &unk_1E76AB330;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __68__AXSettingsPrimaryResourceDownloadController_createVoiceFootprints__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
  return objc_msgSend(*(id *)(a1 + 32), "restoreDownloadProgress");
}

- (void)addVoiceFootprintsToArray:(id)a3 forDialect:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void (**v9)(void);
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[AXSettingsResourceDownloadController getDialectPreferencesCallback](self, "getDialectPreferencesCallback");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AXSettingsResourceDownloadController getDialectPreferencesCallback](self, "getDialectPreferencesCallback");
    v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v9[2]();
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  -[AXSettingsResourceDownloadController speechModelController](self, "speechModelController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addVoiceFootprintsToArray:dialect:selectedVoiceId:showSiriNeuralVoices:showNeuralAXVoices:", v7, v6, v11, -[AXSettingsPrimaryResourceDownloadController showNeural](self, "showNeural"), -[AXSettingsPrimaryResourceDownloadController showNeuralAX](self, "showNeuralAX"));

}

- (void)_setSpeakingRate:(id)a3 specifier:(id)a4
{
  float *p_speakingRate;
  float v6;
  NSObject *v7;
  double v8;
  void (**setSpeakingRateCallback)(float);

  objc_msgSend(a3, "floatValue");
  p_speakingRate = &self->_speakingRate;
  self->_speakingRate = v6;
  AXLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[AXSettingsPrimaryResourceDownloadController _setSpeakingRate:specifier:].cold.1(&self->_speakingRate, v7);

  if (fabsf(*p_speakingRate + -0.5) < 0.03 && (-[UISlider isTracking](self->_speechRateSlider, "isTracking") & 1) == 0)
  {
    LODWORD(v8) = 0.5;
    -[UISlider setValue:animated:](self->_speechRateSlider, "setValue:animated:", 1, v8);
    *p_speakingRate = 0.5;
  }
  setSpeakingRateCallback = (void (**)(float))self->_setSpeakingRateCallback;
  if (setSpeakingRateCallback)
    setSpeakingRateCallback[2](*p_speakingRate);
}

- (id)_speakingRate:(id)a3
{
  double v3;
  void *v4;
  void (**v5)(void);
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  if (self->_getSpeakingRateCallback)
  {
    -[AXSettingsPrimaryResourceDownloadController getSpeakingRateCallback](self, "getSpeakingRateCallback", a3);
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();
    objc_msgSend(v4, "numberWithFloat:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    *(float *)&v3 = self->_speakingRate;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a3, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (BOOL)showSpeakingRate
{
  return self->_showSpeakingRate;
}

- (void)setShowSpeakingRate:(BOOL)a3
{
  self->_showSpeakingRate = a3;
}

- (void)setSpeakingRate:(float)a3
{
  self->_speakingRate = a3;
}

- (void)setSpeakingRateCallbackBlock:(id)a3
{
  void *v4;
  id setSpeakingRateCallback;

  v4 = (void *)objc_msgSend(a3, "copy");
  setSpeakingRateCallback = self->_setSpeakingRateCallback;
  self->_setSpeakingRateCallback = v4;

}

- (void)_prepareVoiceFootprints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  _BOOL4 loadingVoiceFootprints;
  NSObject *loadVoiceFootprintsQueue;
  _QWORD block[5];

  -[AXSettingsPrimaryResourceDownloadController language](self, "language");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXCLanguageConvertToCanonicalForm();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CF4E80], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dialectForLanguageID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "langMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSettingsPrimaryResourceDownloadController setLanguageMap:](self, "setLanguageMap:", v7);
  -[AXSettingsPrimaryResourceDownloadController language](self, "language");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "isEqualToString:", v8);

  if ((v9 & 1) == 0)
    -[AXSettingsPrimaryResourceDownloadController setLanguage:](self, "setLanguage:", v4);
  -[NSLock lock](self->_voiceFootprintLock, "lock");
  -[AXSettingsPrimaryResourceDownloadController voiceFootprints](self, "voiceFootprints");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {

  }
  else
  {
    loadingVoiceFootprints = self->_loadingVoiceFootprints;

    if (!loadingVoiceFootprints)
    {
      -[NSLock unlock](self->_voiceFootprintLock, "unlock");
      loadVoiceFootprintsQueue = self->_loadVoiceFootprintsQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __70__AXSettingsPrimaryResourceDownloadController__prepareVoiceFootprints__block_invoke;
      block[3] = &unk_1E76AB330;
      block[4] = self;
      dispatch_async(loadVoiceFootprintsQueue, block);
    }
  }
  -[NSLock unlock](self->_voiceFootprintLock, "unlock");

}

uint64_t __70__AXSettingsPrimaryResourceDownloadController__prepareVoiceFootprints__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "createVoiceFootprints");
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_class *v37;
  void *v38;
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
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _QWORD v62[8];

  v62[6] = *MEMORY[0x1E0C80C00];
  v3 = (int)*MEMORY[0x1E0D80590];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[AXSettingsPrimaryResourceDownloadController _prepareVoiceFootprints](self, "_prepareVoiceFootprints");
    -[NSLock lock](self->_voiceFootprintLock, "lock");
    -[AXSettingsPrimaryResourceDownloadController voiceFootprints](self, "voiceFootprints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "postNotificationName:object:", CFSTR("AXSettingsVoicesAvailableForSelection"), 0);

      -[AXSettingsPrimaryResourceDownloadController progressIndicator](self, "progressIndicator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stopAnimating");

      -[AXSettingsPrimaryResourceDownloadController loadingView](self, "loadingView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeFromSuperview");

      -[AXSettingsPrimaryResourceDownloadController setLoadingView:](self, "setLoadingView:", 0);
    }
    else
    {
      -[AXSettingsPrimaryResourceDownloadController loadingView](self, "loadingView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        v11 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
        -[AXSettingsPrimaryResourceDownloadController setLoadingView:](self, "setLoadingView:", v11);

        -[AXSettingsPrimaryResourceDownloadController loadingView](self, "loadingView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

        v13 = objc_alloc_init(MEMORY[0x1E0DC3990]);
        AXUILocalizedStringForKey(CFSTR("voices.loading"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setText:", v14);

        objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setFont:", v15);

        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setBackgroundColor:", v16);

        objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setTextColor:", v17);

        objc_msgSend(v13, "setNumberOfLines:", 0);
        objc_msgSend(v13, "setAdjustsFontForContentSizeCategory:", 1);
        objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[AXSettingsPrimaryResourceDownloadController loadingView](self, "loadingView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v13;
        objc_msgSend(v18, "addSubview:", v13);

        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
        -[AXSettingsPrimaryResourceDownloadController setProgressIndicator:](self, "setProgressIndicator:", v20);

        -[AXSettingsPrimaryResourceDownloadController progressIndicator](self, "progressIndicator");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

        -[AXSettingsPrimaryResourceDownloadController loadingView](self, "loadingView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXSettingsPrimaryResourceDownloadController progressIndicator](self, "progressIndicator");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addSubview:", v23);

        -[AXSettingsPrimaryResourceDownloadController view](self, "view");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXSettingsPrimaryResourceDownloadController loadingView](self, "loadingView");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addSubview:", v25);

        -[AXSettingsPrimaryResourceDownloadController view](self, "view");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXSettingsPrimaryResourceDownloadController loadingView](self, "loadingView");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "bringSubviewToFront:", v27);

        v50 = (void *)MEMORY[0x1E0CB3718];
        -[AXSettingsPrimaryResourceDownloadController loadingView](self, "loadingView");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "centerXAnchor");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXSettingsPrimaryResourceDownloadController view](self, "view");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "centerXAnchor");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "constraintEqualToAnchor:", v58);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v62[0] = v57;
        -[AXSettingsPrimaryResourceDownloadController loadingView](self, "loadingView");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "centerYAnchor");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXSettingsPrimaryResourceDownloadController view](self, "view");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "centerYAnchor");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "constraintEqualToAnchor:", v53);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v62[1] = v52;
        objc_msgSend(v19, "leadingAnchor");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXSettingsPrimaryResourceDownloadController loadingView](self, "loadingView");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "leadingAnchor");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v48, 1.0);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v62[2] = v46;
        -[AXSettingsPrimaryResourceDownloadController progressIndicator](self, "progressIndicator");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "leadingAnchor");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v19;
        objc_msgSend(v19, "trailingAnchor");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v43, 1.0);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v62[3] = v42;
        -[AXSettingsPrimaryResourceDownloadController loadingView](self, "loadingView");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "trailingAnchor");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXSettingsPrimaryResourceDownloadController progressIndicator](self, "progressIndicator");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "trailingAnchor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v29, 1.0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v62[4] = v30;
        -[AXSettingsPrimaryResourceDownloadController progressIndicator](self, "progressIndicator");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "centerYAnchor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "centerYAnchor");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "constraintEqualToAnchor:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v62[5] = v34;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 6);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "activateConstraints:", v35);

        -[AXSettingsPrimaryResourceDownloadController progressIndicator](self, "progressIndicator");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "startAnimating");

      }
    }
    -[AXSettingsPrimaryResourceDownloadController _internalSpecifiers](self, "_internalSpecifiers");
    v37 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v38 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.super.super.isa + v3) = v37;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)_internalSpecifiers
{
  void (**v3)(void *, _QWORD);
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t j;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v51;
  AXSettingsPrimaryResourceDownloadController *v52;
  void *v53;
  id obj;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD aBlock[5];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__AXSettingsPrimaryResourceDownloadController__internalSpecifiers__block_invoke;
  aBlock[3] = &unk_1E76AB638;
  aBlock[4] = self;
  v3 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSettingsPrimaryResourceDownloadController voiceFootprints](self, "voiceFootprints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXSpeechSettingsModelController partitionVoiceFootprints:intoStandardVoices:noveltyVoices:personalVoices:](AXSpeechSettingsModelController, "partitionVoiceFootprints:intoStandardVoices:noveltyVoices:personalVoices:", v7, v4, v5, v6);

  v52 = self;
  if (-[AXSettingsPrimaryResourceDownloadController showPersonalVoices](self, "showPersonalVoices")
    && objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("PersonalVoicesGroup"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "addObject:", v8);
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v65 != v12)
            objc_enumerationMutation(v9);
          v3[2](v3, *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "addObject:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
      }
      while (v11);
    }

  }
  v51 = v6;
  v53 = (void *)v5;
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = v4;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = *(_QWORD *)v61;
    v19 = v55;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v61 != v18)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * j);
        objc_msgSend(v21, "dialect");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqual:", v17);

        if ((v23 & 1) == 0)
        {
          objc_msgSend(v21, "dialect");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "languageNameAndLocaleInCurrentLocale");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v25, 0, 0, 0, 0, 0, 0, v51);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "dialect");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "specificLanguageID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setProperty:forKey:", v28, CFSTR("languageId"));

          v19 = v55;
          objc_msgSend(v55, "addObject:", v26);
          objc_msgSend(v21, "dialect");
          v29 = objc_claimAutoreleasedReturnValue();

          v17 = (void *)v29;
        }
        ((void (**)(void *, void *))v3)[2](v3, v21);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v30);

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
    }
    while (v16);
  }
  else
  {
    v17 = 0;
    v19 = v55;
  }

  if (objc_msgSend(v53, "count"))
  {
    v31 = (void *)MEMORY[0x1E0D804E8];
    AXUILocalizedStringForKey(CFSTR("NOVELTY_VOICES"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v32, 0, 0, 0, 0, 0, 0, v51);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v53, "firstObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dialect");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "specificLanguageID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setProperty:forKey:", v36, CFSTR("languageId"));

    objc_msgSend(v19, "addObject:", v33);
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v37 = v53;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v57;
      do
      {
        for (k = 0; k != v39; ++k)
        {
          if (*(_QWORD *)v57 != v40)
            objc_enumerationMutation(v37);
          v3[2](v3, *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * k));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v42);

        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
      }
      while (v39);
    }

  }
  -[NSLock unlock](v52->_voiceFootprintLock, "unlock");
  if (v52->_showSpeakingRate)
  {
    v43 = (void *)MEMORY[0x1E0D804E8];
    AXUILocalizedStringForKey(CFSTR("SPEAKING_RATE"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v44, 0, 0, 0, 0, 0, 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "addObject:", v45);
    objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, v52, sel__setSpeakingRate_specifier_, sel__speakingRate_, 0, 5, 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    AXUISettingsSpeakingRateSlowImage();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setProperty:forKey:", v47, *MEMORY[0x1E0D80908]);

    AXUISettingsSpeakingRateFastImage();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setProperty:forKey:", v48, *MEMORY[0x1E0D80910]);

    objc_msgSend(v46, "setProperty:forKey:", &unk_1E76C2330, *MEMORY[0x1E0D807E0]);
    objc_msgSend(v46, "setProperty:forKey:", &unk_1E76C2340, *MEMORY[0x1E0D807D8]);
    v49 = -[AXSettingsPrimaryResourceDownloadController speakingRateSliderCell](v52, "speakingRateSliderCell");
    objc_msgSend(v46, "setProperty:forKey:", v49, *MEMORY[0x1E0D80780]);
    objc_msgSend(v46, "setProperty:forKey:", &unk_1E76C2350, *MEMORY[0x1E0D807F0]);
    objc_msgSend(v46, "setProperty:forKey:", CFSTR("SpeakingRate"), *MEMORY[0x1E0D808B0]);
    objc_msgSend(v19, "addObject:", v46);

  }
  return v19;
}

id __66__AXSettingsPrimaryResourceDownloadController__internalSpecifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  os_log_type_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void (**v24)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  int v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD aBlock[4];
  id v48;
  uint8_t v49[128];
  uint8_t buf[4];
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_opt_class();
  v5 = (void *)MEMORY[0x1E0D804E8];
  v42 = v3;
  objc_msgSend(v3, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, *(_QWORD *)(a1 + 32), 0, sel__getSelectedVariation_, v4, 2, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "resources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v8, CFSTR("Resources"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "showPerVoiceSettings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v9, CFSTR("PVSettings"));

  objc_msgSend(MEMORY[0x1E0CF39E8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v10, "ignoreLogging");

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CF39E8], "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v12, v13))
    {
      AXColorizeFormatLog();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "resources");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "name");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v7;
      v38 = v15;
      _AXStringForArgs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v12, v13))
      {
        *(_DWORD *)buf = 138543362;
        v51 = v16;
        _os_log_impl(&dword_1BD892000, v12, v13, "%{public}@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(v7, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x1E0D80780]);
  objc_msgSend(v3, "dialect");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v17, CFSTR("kAXPSDialectMapKey"));

  objc_msgSend(v7, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("IsDialect"));
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__AXSettingsPrimaryResourceDownloadController__internalSpecifiers__block_invoke_229;
  aBlock[3] = &unk_1E76AB610;
  objc_copyWeak(&v48, (id *)buf);
  v41 = _Block_copy(aBlock);
  v18 = _Block_copy(v41);
  objc_msgSend(v7, "setProperty:forKey:", v18, CFSTR("setDialectPreferencesCallback"));

  objc_msgSend(*(id *)(a1 + 32), "getDialectPreferencesCallback");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = _Block_copy(v19);
  objc_msgSend(v7, "setProperty:forKey:", v20, CFSTR("getDialectPreferencesCallback"));

  objc_msgSend(*(id *)(a1 + 32), "speechModelController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v21, CFSTR("speechModelController"));

  objc_msgSend(*(id *)(a1 + 32), "getDialectPreferencesCallback");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22 == 0;

  if (v23)
  {
    v29 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "getDialectPreferencesCallback");
    v24 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v24[2](v24, v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(v42, "resources", v38, v39, v40);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v31)
  {
    v32 = *(_QWORD *)v44;
    v33 = MEMORY[0x1E0C9AAB0];
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v44 != v32)
          objc_enumerationMutation(v30);
        objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "voiceId");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v29, "isEqualToString:", v35);

        if (v36)
        {
          objc_msgSend(v42, "setIsSelected:", 1);
          objc_msgSend(v7, "setProperty:forKey:", v33, CFSTR("IsSelected"));
        }
      }
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v31);
  }

  objc_destroyWeak(&v48);
  objc_destroyWeak((id *)buf);

  return v7;
}

void __66__AXSettingsPrimaryResourceDownloadController__internalSpecifiers__block_invoke_229(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setDialectPreferencesCallback");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

    objc_msgSend(v4, "reloadSpecifiers");
  }

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v5;
  UISlider *v6;
  UISlider *speechRateSlider;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AXSettingsPrimaryResourceDownloadController;
  -[AXSettingsPrimaryResourceDownloadController tableView:cellForRowAtIndexPath:](&v9, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSettingsPrimaryResourceDownloadController speakingRateSliderCell](self, "speakingRateSliderCell");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "control");
    v6 = (UISlider *)objc_claimAutoreleasedReturnValue();
    speechRateSlider = self->_speechRateSlider;
    self->_speechRateSlider = v6;

  }
  return v5;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6;

  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setInfoDelegate:", self);

}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  double result;

  objc_msgSend(a3, "rowHeight");
  return result;
}

- (float)speakingRate
{
  return self->_speakingRate;
}

- (id)setSpeakingRateCallback
{
  return self->_setSpeakingRateCallback;
}

- (void)setSetSpeakingRateCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1480);
}

- (id)getSpeakingRateCallback
{
  return self->_getSpeakingRateCallback;
}

- (void)setGetSpeakingRateCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1488);
}

- (Class)speakingRateSliderCell
{
  return self->_speakingRateSliderCell;
}

- (void)setSpeakingRateSliderCell:(Class)a3
{
  objc_storeStrong((id *)&self->_speakingRateSliderCell, a3);
}

- (BOOL)showDialectPicker
{
  return self->_showDialectPicker;
}

- (void)setShowDialectPicker:(BOOL)a3
{
  self->_showDialectPicker = a3;
}

- (BOOL)showDialectInTitle
{
  return self->_showDialectInTitle;
}

- (void)setShowDialectInTitle:(BOOL)a3
{
  self->_showDialectInTitle = a3;
}

- (BOOL)showNeural
{
  return self->_showNeural;
}

- (void)setShowNeural:(BOOL)a3
{
  self->_showNeural = a3;
}

- (BOOL)showNeuralAX
{
  return self->_showNeuralAX;
}

- (void)setShowNeuralAX:(BOOL)a3
{
  self->_showNeuralAX = a3;
}

- (BOOL)showPersonalVoices
{
  return self->_showPersonalVoices;
}

- (void)setShowPersonalVoices:(BOOL)a3
{
  self->_showPersonalVoices = a3;
}

- (BOOL)hideLanguageInDialect
{
  return self->_hideLanguageInDialect;
}

- (void)setHideLanguageInDialect:(BOOL)a3
{
  self->_hideLanguageInDialect = a3;
}

- (AXLangMap)languageMap
{
  return self->_languageMap;
}

- (void)setLanguageMap:(id)a3
{
  objc_storeStrong((id *)&self->_languageMap, a3);
}

- (NSMutableArray)voiceFootprints
{
  return self->_voiceFootprints;
}

- (void)setVoiceFootprints:(id)a3
{
  objc_storeStrong((id *)&self->_voiceFootprints, a3);
}

- (UIActivityIndicatorView)progressIndicator
{
  return self->_progressIndicator;
}

- (void)setProgressIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_progressIndicator, a3);
}

- (UIView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
  objc_storeStrong((id *)&self->_loadingView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_progressIndicator, 0);
  objc_storeStrong((id *)&self->_voiceFootprints, 0);
  objc_storeStrong((id *)&self->_languageMap, 0);
  objc_storeStrong((id *)&self->_speakingRateSliderCell, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_speechRateSlider, 0);
  objc_storeStrong((id *)&self->_voiceFootprintLock, 0);
  objc_storeStrong((id *)&self->_loadVoiceFootprintsQueue, 0);
  objc_storeStrong((id *)&self->_languageBeingDownloaded, 0);
  objc_storeStrong(&self->_getSpeakingRateCallback, 0);
  objc_storeStrong(&self->_setSpeakingRateCallback, 0);
}

- (double)_setSpeakingRate:(float *)a1 specifier:(NSObject *)a2 .cold.1(float *a1, NSObject *a2)
{
  double v2;
  double v3;
  double result;
  int v5;
  double v6;
  __int16 v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = fabsf(*a1 + -0.5);
  v5 = 134218240;
  v6 = v2;
  v7 = 2048;
  v8 = v3;
  _os_log_error_impl(&dword_1BD892000, a2, OS_LOG_TYPE_ERROR, " new rate: %f -- diff %f", (uint8_t *)&v5, 0x16u);
  return result;
}

@end
