@implementation AXGeneralLanguageVoicePickerController

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXGeneralLanguageVoicePickerController;
  -[AXGeneralLanguageVoicePickerController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80598]), "reloadData");
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;

  v3 = (int)*MEMORY[0x1E0D80590];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[AXLanguageSpeechBaseController specifiersForLanguagesAndAccents](self, "specifiersForLanguagesAndAccents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    if (UIAccessibilityIsVoiceOverRunning())
    {
      objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      AXUILocalizedStringForKey(CFSTR("VoiceOverVoiceSelectionHint"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setProperty:forKey:", v8, *MEMORY[0x1E0D80848]);

      objc_msgSend(v6, "insertObject:atIndex:", v7, 0);
    }
    v9 = (objc_class *)objc_msgSend(v6, "copy");
    v10 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3) = v9;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  id v6;

  objc_msgSend(a3, "cellForRowAtIndexPath:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "specifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXGeneralLanguageVoicePickerController _handleUnifiedSelectedVoice:](self, "_handleUnifiedSelectedVoice:", v5);

}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)_handleUnifiedSelectedVoice:(id)a3
{
  id v4;
  void *v5;
  AXSettingsPrimaryResourceDownloadController *v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  double v12;
  void *v13;
  float v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id location;
  _QWORD v34[4];
  id v35;

  v4 = a3;
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x1E0D80868]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(AXSettingsPrimaryResourceDownloadController);
  -[AXSettingsPrimaryResourceDownloadController setShowNeural:](v6, "setShowNeural:", 1);
  -[AXGeneralLanguageVoicePickerController rootController](self, "rootController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSettingsPrimaryResourceDownloadController setRootController:](v6, "setRootController:", v7);

  -[AXSettingsPrimaryResourceDownloadController setSpecifier:](v6, "setSpecifier:", 0);
  -[AXSettingsPrimaryResourceDownloadController setParentController:](v6, "setParentController:", self);
  -[AXSettingsPrimaryResourceDownloadController setLanguage:](v6, "setLanguage:", v5);
  -[AXLanguageSpeechBaseController speechModelController](self, "speechModelController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSettingsResourceDownloadController setSpeechModelController:](v6, "setSpeechModelController:", v8);

  objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "quickSpeakSpeakingRateForLanguage:", v5);
  v11 = v10;

  v12 = fabs(v11 + -3.40282347e38);
  if (v12 < 0.001)
  {
    objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "quickSpeakSpeakingRate");
    v11 = v14;

  }
  *(float *)&v12 = v11;
  -[AXSettingsPrimaryResourceDownloadController setSpeakingRate:](v6, "setSpeakingRate:", v12);
  objc_msgSend(MEMORY[0x1E0CF4E80], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "systemLanguageID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  AXCLanguageCanonicalFormToGeneralLanguage();
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXSettingsPrimaryResourceDownloadController setShowSpeakingRate:](v6, "setShowSpeakingRate:", objc_msgSend(v17, "isEqualToString:", v5) ^ 1);
  v18 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __70__AXGeneralLanguageVoicePickerController__handleUnifiedSelectedVoice___block_invoke;
  v34[3] = &unk_1E76AC198;
  v19 = v5;
  v35 = v19;
  -[AXSettingsPrimaryResourceDownloadController setSetSpeakingRateCallback:](v6, "setSetSpeakingRateCallback:", v34);
  -[AXSettingsPrimaryResourceDownloadController setShowDialectPicker:](v6, "setShowDialectPicker:", 1);
  objc_initWeak(&location, self);
  v29[0] = v18;
  v29[1] = 3221225472;
  v29[2] = __70__AXGeneralLanguageVoicePickerController__handleUnifiedSelectedVoice___block_invoke_2;
  v29[3] = &unk_1E76AC1C0;
  objc_copyWeak(&v32, &location);
  v29[4] = self;
  v20 = v19;
  v30 = v20;
  v21 = v4;
  v31 = v21;
  -[AXSettingsResourceDownloadController setSetDialectPreferencesCallback:](v6, "setSetDialectPreferencesCallback:", v29);
  v26[0] = v18;
  v26[1] = 3221225472;
  v26[2] = __70__AXGeneralLanguageVoicePickerController__handleUnifiedSelectedVoice___block_invoke_3;
  v26[3] = &unk_1E76AC1E8;
  objc_copyWeak(&v28, &location);
  v26[4] = self;
  v22 = v20;
  v27 = v22;
  -[AXSettingsResourceDownloadController setGetDialectPreferencesCallback:](v6, "setGetDialectPreferencesCallback:", v26);
  -[AXLanguageSpeechBaseController speechSourceKey](self, "speechSourceKey");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSettingsResourceDownloadController setSpeechSourceKey:](v6, "setSpeechSourceKey:", v23);

  v25[0] = v18;
  v25[1] = 3221225472;
  v25[2] = __70__AXGeneralLanguageVoicePickerController__handleUnifiedSelectedVoice___block_invoke_4;
  v25[3] = &unk_1E76AC210;
  v25[4] = self;
  -[AXSettingsResourceDownloadController setGetPerVoiceSettingsCallack:](v6, "setGetPerVoiceSettingsCallack:", v25);
  v24[0] = v18;
  v24[1] = 3221225472;
  v24[2] = __70__AXGeneralLanguageVoicePickerController__handleUnifiedSelectedVoice___block_invoke_5;
  v24[3] = &unk_1E76AC238;
  v24[4] = self;
  -[AXSettingsResourceDownloadController setSetPerVoiceSettingsCallack:](v6, "setSetPerVoiceSettingsCallack:", v24);
  -[AXUISettingsSetupCapableListController showController:animate:](self, "showController:animate:", v6, 1);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

}

void __70__AXGeneralLanguageVoicePickerController__handleUnifiedSelectedVoice___block_invoke(uint64_t a1, float a2)
{
  void *v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;

  v20 = (id)_AXSQuickSpeakCopyPreferredLocalesForLanguages();
  objc_msgSend(v20, "objectForKey:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    AXCLanguageConvertToCanonicalForm();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = a2;
  objc_msgSend(v5, "setQuickSpeakSpeakingRate:forLanguage:", *(_QWORD *)(a1 + 32), v6);

  objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a2;
  objc_msgSend(v7, "setQuickSpeakSpeakingRate:forLanguage:", v4, v8);

  if (!MACancelDownloadErrorDomain_block_invoke_qsInstance)
  {
    v9 = (void *)MEMORY[0x1E0CB34D0];
    AXAccessibilityBundlesDirectory();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("QuickSpeak.bundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleWithPath:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v12, "isLoaded") & 1) == 0)
      objc_msgSend(v12, "load");
    v13 = (void *)objc_msgSend(v12, "principalClass");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v13, "sharedInstance");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)MACancelDownloadErrorDomain_block_invoke_qsInstance;
      MACancelDownloadErrorDomain_block_invoke_qsInstance = v14;

    }
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
    _AXAssert();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v17 = (void *)MACancelDownloadErrorDomain_block_invoke_qsInstance;
    v18 = *(_QWORD *)(a1 + 32);
    *(float *)&v16 = a2;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "speakStatusWithLanguage:rate:", v18, v19);

  }
}

void __70__AXGeneralLanguageVoicePickerController__handleUnifiedSelectedVoice___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  float v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0CF4E98];
  v4 = a2;
  objc_msgSend(v3, "sharedInstance");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "speechModelController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "speechSourceKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateSelectedVoiceIdentifier:forSpeechSourceKey:languageCode:", v4, v7, *(_QWORD *)(a1 + 40));

  objc_msgSend(v9, "quickSpeakSpeakingRateForLanguage:", *(_QWORD *)(a1 + 40));
  if (fabs(v8 + -3.40282347e38) < 0.001)
    objc_msgSend(v9, "quickSpeakSpeakingRate");
  objc_msgSend(v9, "setQuickSpeakSpeakingRate:forLanguage:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:", *(_QWORD *)(a1 + 48));

}

id __70__AXGeneralLanguageVoicePickerController__handleUnifiedSelectedVoice___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "speechModelController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "speechSourceKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedVoiceIdentifierForSpeechSourceKey:languageCode:", v4, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __70__AXGeneralLanguageVoicePickerController__handleUnifiedSelectedVoice___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CF4E98];
  v4 = a2;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "speechSourceKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "customSettingsForVoice:sourceKey:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __70__AXGeneralLanguageVoicePickerController__handleUnifiedSelectedVoice___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0CF4E98];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "sharedInstance");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "speechSourceKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCustomSettingsForVoice:sourceKey:settings:", v7, v8, v6);

}

@end
