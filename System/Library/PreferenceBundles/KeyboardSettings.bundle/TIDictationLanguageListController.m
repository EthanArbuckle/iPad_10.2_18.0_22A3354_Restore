@implementation TIDictationLanguageListController

- (void)offlineDictationStatusUpdated:(id)a3
{
  -[TIDictationLanguageListController setOfflineStatusForLanguage:](self, "setOfflineStatusForLanguage:", a3);
  -[TIDictationLanguageListController reloadSpecifiers](self, "reloadSpecifiers");
}

- (TIDictationLanguageListController)init
{
  TIDictationLanguageListController *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TIDictationLanguageListController;
  v2 = -[TIDictationLanguageListController init](&v4, sel_init);
  if (v2 && AFOfflineDictationCapable())
  {
    -[TIDictationLanguageListController setDictaionOfflineStatusObserver:](v2, "setDictaionOfflineStatusObserver:", -[DictationOfflineStatusObserver initWithDelegate:]([DictationOfflineStatusObserver alloc], "initWithDelegate:", v2));
    -[TIDictationLanguageListController setAssetIdToLanguages:](v2, "setAssetIdToLanguages:", objc_msgSend(MEMORY[0x24BDBCED8], "dictionary"));
    -[TIDictationLanguageListController setTrackingDownloadStatusForAssetsIDs:](v2, "setTrackingDownloadStatusForAssetsIDs:", objc_msgSend(MEMORY[0x24BDBCEF0], "set"));
    -[TIDictationLanguageListController setOnDeviceLocalesDownloading:](v2, "setOnDeviceLocalesDownloading:", objc_msgSend(MEMORY[0x24BDBCEF0], "set"));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[TIDictationLanguageListController setOfflineStatusForLanguage:](self, "setOfflineStatusForLanguage:", 0);
  -[TIDictationLanguageListController setDictaionOfflineStatusObserver:](self, "setDictaionOfflineStatusObserver:", 0);
  -[TIDictationLanguageListController setAssetIdToLanguages:](self, "setAssetIdToLanguages:", 0);
  -[TIDictationLanguageListController setTrackingDownloadStatusForAssetsIDs:](self, "setTrackingDownloadStatusForAssetsIDs:", 0);
  -[TIDictationLanguageListController setOnDeviceLocalesDownloading:](self, "setOnDeviceLocalesDownloading:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TIDictationLanguageListController;
  -[TIDictationLanguageListController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TIDictationLanguageListController;
  -[TIDictationLanguageListController viewDidLoad](&v4, sel_viewDidLoad);
  v3 = (int)*MEMORY[0x24BE75700];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "setEstimatedSectionHeaderHeight:", 0.0);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "setEstimatedSectionFooterHeight:", 0.0);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TIDictationLanguageListController;
  -[TIDictationLanguageListController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[TIDictationLanguageListController emitNavigationEventForDictationLanguageListController](self, "emitNavigationEventForDictationLanguageListController");
}

- (void)emitNavigationEventForDictationLanguageListController
{
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.General/Keyboard/DictationSettings"));
  v4 = +[KeyboardController localizedStringForGeneralKeyboardSpecifier](KeyboardController, "localizedStringForGeneralKeyboardSpecifier");
  v5 = objc_alloc(MEMORY[0x24BDD19B8]);
  v6 = objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v7[0] = v4;
  -[TIDictationLanguageListController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.keyboard"), objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", CFSTR("KEYBOARDS_SHORT"), CFSTR("Keyboard"), v6, objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "bundleURL")), objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2), v3);
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  -[TIDictationLanguageListController setDictaionOfflineStatusObserver:](self, "setDictaionOfflineStatusObserver:", -[DictationOfflineStatusObserver initWithDelegate:]([DictationOfflineStatusObserver alloc], "initWithDelegate:", self));
  return 1;
}

+ (int64_t)numberOfEnabledEntries:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_msgSend(a3, "allKeys", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v12;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v12 != v8)
        objc_enumerationMutation(v4);
      v7 += objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i)), "BOOLValue");
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  }
  while (v6);
  return v7;
}

+ (id)isSmartLanguageSelectionEnabled
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences"), "isSmartLanguageSelectionEnabled"));
}

- (id)dictationFooterText
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSDictionary *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  _QWORD v19[8];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  uint64_t v37;

  v3 = (void *)MEMORY[0x24BDBCEF0];
  v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController"), "enabledDictationLanguages");
  if (v4)
    v5 = v4;
  else
    v5 = MEMORY[0x24BDBD1A8];
  v6 = (void *)objc_msgSend(v3, "setWithArray:", v5);
  v32 = 0;
  v33 = &v32;
  v34 = 0x3052000000;
  v35 = __Block_byref_object_copy__1;
  v36 = __Block_byref_object_dispose__1;
  v37 = 0;
  v37 = objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v26 = 0;
  v27 = &v26;
  v28 = 0x3052000000;
  v29 = __Block_byref_object_copy__1;
  v30 = __Block_byref_object_dispose__1;
  v31 = 0;
  v31 = objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v20 = 0;
  v21 = &v20;
  v22 = 0x3052000000;
  v23 = __Block_byref_object_copy__1;
  v24 = __Block_byref_object_dispose__1;
  v25 = 0;
  v25 = objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v7 = -[TIDictationLanguageListController offlineStatusForLanguage](self, "offlineStatusForLanguage");
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __56__TIDictationLanguageListController_dictationFooterText__block_invoke;
  v19[3] = &unk_24E732578;
  v19[4] = v6;
  v19[5] = &v26;
  v19[6] = &v32;
  v19[7] = &v20;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v7, "enumerateKeysAndObjectsUsingBlock:", v19);
  if (objc_msgSend((id)v27[5], "count"))
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("DICTATION_ON_DEVICE_HIGH_QUALITY_EXPLANATION_SUFFIX_INSTALLED_WITH_LANGUAGES"), &stru_24E732B90, CFSTR("Keyboard"));
    v10 = (__CFString *)objc_msgSend(v8, "stringWithFormat:", v9, +[KeyboardController localizedListForInputModes:forDictation:duplicatedBaseLanguages:](KeyboardController, "localizedListForInputModes:forDictation:duplicatedBaseLanguages:", objc_msgSend((id)v27[5], "allObjects"), 1, 0));
  }
  else
  {
    v10 = &stru_24E732B90;
  }
  if (objc_msgSend((id)v33[5], "count"))
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("DICTATION_OFFLINE_EXPLANATION_SUFFIX_INSTALLED_WITH_LANGUAGES"), &stru_24E732B90, CFSTR("Keyboard"));
    v13 = objc_msgSend(v11, "stringWithFormat:", v12, +[KeyboardController localizedListForInputModes:forDictation:duplicatedBaseLanguages:](KeyboardController, "localizedListForInputModes:forDictation:duplicatedBaseLanguages:", objc_msgSend((id)v33[5], "allObjects"), 1, 0));
    if (-[__CFString length](v10, "length"))
      v14 = CFSTR("\n\n");
    else
      v14 = &stru_24E732B90;
    v10 = (__CFString *)-[__CFString stringByAppendingFormat:](v10, "stringByAppendingFormat:", CFSTR("%@%@"), v14, v13);
  }
  if (objc_msgSend((id)v27[5], "count"))
    objc_msgSend(v6, "minusSet:", v27[5]);
  if (objc_msgSend((id)v33[5], "count"))
    objc_msgSend(v6, "minusSet:", v33[5]);
  if (objc_msgSend(v6, "count")
    && (!objc_msgSend(v6, "isEqual:", v21[5]) || -[__CFString length](v10, "length")))
  {
    v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("DICTATION_ONLINE_EXPLANATION_SUFFIX_NOT_INSTALLED_WITH_LANGUAGES"), &stru_24E732B90, CFSTR("Dictation")), +[KeyboardController localizedListForInputModes:forDictation:duplicatedBaseLanguages:](KeyboardController, "localizedListForInputModes:forDictation:duplicatedBaseLanguages:", objc_msgSend(v6, "allObjects"), 1, 0));
    if (-[__CFString length](v10, "length"))
      v16 = CFSTR("\n\n");
    else
      v16 = &stru_24E732B90;
    v10 = (__CFString *)-[__CFString stringByAppendingFormat:](v10, "stringByAppendingFormat:", CFSTR("%@%@"), v16, v15);
  }
  if (!-[__CFString length](v10, "length") && objc_msgSend((id)v21[5], "count"))
  {
    v17 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (__CFString *)objc_msgSend(v17, "localizedStringForKey:value:table:", SFLocalizableWAPIStringKeyForKey(), &stru_24E732B90, CFSTR("Keyboard"));
  }
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
  return v10;
}

uint64_t __56__TIDictationLanguageListController_dictationFooterText__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = objc_msgSend(a2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
  result = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3);
  if ((_DWORD)result)
  {
    if (AFOfflineDictationStatusStringIsHighQualityModelInstalled())
    {
      v5 = *(_QWORD *)(a1 + 40);
    }
    else if (AFOfflineDictationStatusStringIsInstalled())
    {
      v5 = *(_QWORD *)(a1 + 48);
    }
    else
    {
      v5 = *(_QWORD *)(a1 + 56);
    }
    return objc_msgSend(*(id *)(*(_QWORD *)(v5 + 8) + 40), "addObject:", v3);
  }
  return result;
}

- (void)setSLSEnabled:(id)a3 specifier:(id)a4
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences", a3, a4), "setSmartLanguageSelection:", objc_msgSend(a3, "BOOLValue"));
  -[TIDictationLanguageListController reloadSpecifiers](self, "reloadSpecifiers");
}

- (id)isSLSEnabled:(id)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "isSmartLanguageSelectionEnabled");
}

- (id)dictationLanguagesSpecifiers
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v16;
  id obj;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v18 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  if (!v18)
  {
    v16 = (int)*MEMORY[0x24BE756E0];
    -[TIDictationLanguageListController setTitle:](self, "setTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("Dictation Languages"), &stru_24E732B90, CFSTR("Dictation")));
    v18 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB5B00], "sharedPreferencesController");
    v4 = (void *)objc_msgSend(v3, "suggestedDictationModesForKeyboardLanguages:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController"), "activeDictationSupportedInputModeIdentifiers"));
    v5 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6B58], "sharedPreferencesController"), "preferencesActions"), "valueForPreferenceKey:", CFSTR("DictationLanguagesEnabled")), "mutableCopy");
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    obj = v4;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      v9 = *MEMORY[0x24BE75AC0];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          v12 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend(v11, "displayName"), self, 0, 0, 0, 3, 0);
          objc_msgSend(v12, "setButtonAction:", sel_toggleDictationLanguage_);
          objc_msgSend(v12, "setProperty:forKey:", objc_msgSend(v11, "identifier"), v9);
          objc_msgSend(v12, "setProperty:forKey:", v5, CFSTR("enabledDictationLanguages"));
          objc_msgSend(v18, "addObject:", v12);
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v7);
    }
    v13 = (void *)objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:name:", CFSTR("DICTATION_LANGUAGES"), 0);
    v14 = -[TIDictationLanguageListController dictationFooterText](self, "dictationFooterText");
    objc_msgSend(v13, "setProperty:forKey:", v14, *MEMORY[0x24BE75A68]);
    objc_msgSend(v18, "insertObject:atIndex:", v13, 0);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v16) = (Class)v18;
  }
  return v18;
}

- (id)slsDictationLanguagesSpecifiers
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  id obj;
  uint64_t v30;
  void *v31;
  TIDictationLanguageListController *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v33 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  if (!v33)
  {
    v28 = (int)*MEMORY[0x24BE756E0];
    -[TIDictationLanguageListController setTitle:](self, "setTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("Dictation Languages"), &stru_24E732B90, CFSTR("Dictation")));
    v33 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v31 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB5B00], "sharedPreferencesController");
    v4 = (void *)objc_msgSend(v3, "suggestedDictationModesForKeyboardLanguages:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController"), "activeDictationSupportedInputModeIdentifiers"));
    v5 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6B58], "sharedPreferencesController"), "preferencesActions"), "valueForPreferenceKey:", CFSTR("DictationLanguagesEnabled")), "mutableCopy");
    v6 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences"), "dictationSLSLanguagesEnabled"), "mutableCopy");
    v32 = self;
    v27 = objc_msgSend((id)objc_opt_class(), "numberOfEnabledEntries:", v5);
    if (!objc_msgSend(v6, "count"))
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController"), "updateEnabledDictationLanguages:", 1);
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v7)
    {
      v8 = v7;
      v30 = *(_QWORD *)v35;
      v9 = *MEMORY[0x24BE75AC0];
      v10 = *MEMORY[0x24BE75D50];
      obj = v4;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v35 != v30)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          v13 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend(v12, "displayName"), v32, 0, 0, 0, 3, 0);
          objc_msgSend(v13, "setButtonAction:", sel_toggleDictationLanguage_);
          objc_msgSend(v13, "setProperty:forKey:", objc_msgSend(v12, "identifier"), v9);
          objc_msgSend(v13, "setProperty:forKey:", v5, CFSTR("enabledDictationLanguages"));
          objc_msgSend(v33, "addObject:", v13);
          v14 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend(v12, "displayName"), v32, 0, 0, 0, 3, 0);
          objc_msgSend(v14, "setButtonAction:", sel_toggleSLSEnabled_);
          objc_msgSend(v14, "setProperty:forKey:", objc_msgSend(v12, "identifier"), v10);
          objc_msgSend(v31, "addObject:", v14);
        }
        v4 = obj;
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v8);
    }
    if ((unint64_t)objc_msgSend(v4, "count") >= 2)
    {
      if (v27 >= 2)
      {
        v15 = (void *)objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:name:", CFSTR("SLS_TOGGLE"), 0);
        objc_msgSend(v33, "addObject:", v15);
        v16 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("Automatic-Language-Detection"), &stru_24E732B90, CFSTR("Dictation")), v32, sel_setSLSEnabled_specifier_, sel_isSLSEnabled_, 0, 6, 0);
        objc_msgSend(v16, "setProperty:forKey:", CFSTR("SLS Toggle Switch"), *MEMORY[0x24BE75AC0]);
        v17 = (void *)MEMORY[0x24BDD17C8];
        v18 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "isSmartLanguageSelectionEnabled"), "BOOLValue");
        v19 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        if (v18)
          v20 = CFSTR("SLS_TOGGLE_ON_EXPLANATION");
        else
          v20 = CFSTR("SLS_TOGGLE_OFF_EXPLANATION");
        v21 = objc_msgSend(v19, "localizedStringForKey:value:table:", v20, &stru_24E732B90, CFSTR("Dictation"));
        objc_msgSend(v15, "setProperty:forKey:", objc_msgSend(v17, "stringWithFormat:", CFSTR("%@\n\n%@"), v21, objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("SLS_EXPLANATION_SUFFIX"), &stru_24E732B90, CFSTR("Dictation"))), *MEMORY[0x24BE75A68]);
        objc_msgSend(v33, "addObject:", v16);
      }
      if ((unint64_t)objc_msgSend(v4, "count") < 5)
        v22 = 0;
      else
        v22 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("Dictation"), &stru_24E732B90, CFSTR("Dictation"));
      v23 = (void *)objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:name:", CFSTR("DICTATION_LANGUAGES"), v22);
      v24 = -[TIDictationLanguageListController dictationFooterText](v32, "dictationFooterText");
      objc_msgSend(v23, "setProperty:forKey:", v24, *MEMORY[0x24BE75A68]);
      objc_msgSend(v33, "insertObject:atIndex:", v23, 0);
    }
    if (objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "isSmartLanguageSelectionEnabled"), "BOOLValue")&& (unint64_t)objc_msgSend(v4, "count") >= 5&& v27 >= 2)
    {
      v25 = (void *)objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:name:", CFSTR("SLS_LANGUAGES"), objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("Auto-Detection"), &stru_24E732B90, CFSTR("Dictation")));
      objc_msgSend(v25, "setProperty:forKey:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("SLS_FOOTER_TEXT"), &stru_24E732B90, CFSTR("Dictation")), *MEMORY[0x24BE75A68]);
      objc_msgSend(v33, "addObject:", v25);
      objc_msgSend(v33, "addObjectsFromArray:", v31);
    }
    *(Class *)((char *)&v32->super.super.super.super.super.isa + v28) = (Class)v33;
  }
  return v33;
}

- (void)updateDownloadingProgressForAsset:(id)a3 stalled:(BOOL)a4
{
  _QWORD block[6];
  BOOL v5;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__TIDictationLanguageListController_updateDownloadingProgressForAsset_stalled___block_invoke;
  block[3] = &unk_24E7325A0;
  block[4] = self;
  block[5] = a3;
  v5 = a4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __79__TIDictationLanguageListController_updateDownloadingProgressForAsset_stalled___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  int v9;
  void *v10;
  uint64_t result;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "onDeviceLocalesDownloading"), "copy");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "assetIdToLanguages", 0), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        v9 = *(unsigned __int8 *)(a1 + 48);
        v10 = (void *)objc_msgSend(*(id *)(a1 + 32), "onDeviceLocalesDownloading");
        if (v9)
          objc_msgSend(v10, "removeObject:", v8);
        else
          objc_msgSend(v10, "addObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  result = objc_msgSend(v2, "isEqualToSet:", objc_msgSend(*(id *)(a1 + 32), "onDeviceLocalesDownloading"));
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
  return result;
}

- (void)updateDownloadingStateForAsset:(id)a3 success:(BOOL)a4
{
  _QWORD block[6];
  BOOL v5;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__TIDictationLanguageListController_updateDownloadingStateForAsset_success___block_invoke;
  block[3] = &unk_24E7325A0;
  block[4] = self;
  block[5] = a3;
  v5 = a4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __76__TIDictationLanguageListController_updateDownloadingStateForAsset_success___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t result;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "trackingDownloadStatusForAssetsIDs"), "removeObject:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "assetIdToLanguages"), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "onDeviceLocalesDownloading"), "removeObject:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }
  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "assetIdToLanguages"), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  if (!*(_BYTE *)(a1 + 48))
    return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
  return result;
}

- (id)onDeviceDictationLanguagesSpecifiers
{
  TIDictationLanguageListController *v2;
  id result;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  TIWeakRefHolder *v37;
  void *SFSpeechAssetManagerClass;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t k;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  const __CFString *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  const __CFString *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  objc_class *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const __CFString *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  int v101;
  void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  id obj;
  id obja;
  TIDictationLanguageListController *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _QWORD v117[6];
  _QWORD v118[6];
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  uint64_t v131;
  NSRange v132;

  v2 = self;
  v131 = *MEMORY[0x24BDAC8D0];
  result = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  if (result)
    return result;
  v95 = (int)*MEMORY[0x24BE756E0];
  -[TIDictationLanguageListController setTitle:](v2, "setTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("Dictation Languages"), &stru_24E732B90, CFSTR("Dictation")));
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v105 = (void *)objc_msgSend(MEMORY[0x24BDD14E0], "set");
  v96 = objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v100 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v98 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v99 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v102 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_msgSend(MEMORY[0x24BEB5B00], "sharedPreferencesController");
  v6 = (void *)objc_msgSend(v5, "suggestedDictationModesForKeyboardLanguages:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController"), "activeDictationSupportedInputModeIdentifiers"));
  v7 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6B58], "sharedPreferencesController"), "preferencesActions"), "valueForPreferenceKey:", CFSTR("DictationLanguagesEnabled")), "mutableCopy");
  v94 = (void *)objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:name:", CFSTR("DICTATION_LANGUAGES"), 0);
  objc_msgSend(v4, "addObject:");
  v103 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  v126 = 0u;
  obj = v6;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v123, v130, 16);
  v108 = v2;
  v97 = v4;
  if (!v8)
  {
    v104 = 0;
    LOBYTE(v101) = 1;
    goto LABEL_33;
  }
  v9 = v8;
  v104 = 0;
  v10 = *(_QWORD *)v124;
  v11 = *MEMORY[0x24BE75AC0];
  v101 = 1;
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v124 != v10)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * v12);
      v14 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend(v13, "displayName"), v2, 0, 0, 0, 3, 0);
      objc_msgSend(v14, "setButtonAction:", sel_toggleDictationLanguage_);
      objc_msgSend(v14, "setProperty:forKey:", objc_msgSend(v13, "identifier"), v11);
      objc_msgSend(v14, "setProperty:forKey:", v7, CFSTR("enabledDictationLanguages"));
      objc_msgSend(v4, "addObject:", v14);
      if (objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", objc_msgSend(v13, "identifier")), "BOOLValue"))
      {
        objc_msgSend(v13, "identifier");
        TIInputModeGetBaseLanguage();
        objc_msgSend(v105, "addObject:", TIInputModeGetBaseLanguage());
        if (!-[NSDictionary objectForKeyedSubscript:](-[TIDictationLanguageListController offlineStatusForLanguage](v2, "offlineStatusForLanguage"), "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(v13, "identifier"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"))))
        {
          v15 = _AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode();
          if (v15)
            -[NSDictionary objectForKeyedSubscript:](-[TIDictationLanguageListController offlineStatusForLanguage](v108, "offlineStatusForLanguage"), "objectForKeyedSubscript:", v15);
        }
        if (!AFOfflineDictationStatusStringIsHighQualityModelSupported())
        {
          v16 = objc_msgSend(v13, "identifier");
          v17 = v102;
          goto LABEL_24;
        }
        ++v104;
        if (AFOfflineDictationStatusStringIsInstalled())
        {
          objc_msgSend(v100, "addObject:", objc_msgSend(v13, "identifier"));
          v101 &= AFOfflineDictationStatusStringIsOnDeviceSearchSupported();
          goto LABEL_25;
        }
        if (!AFOfflineDictationStatusStringIsInstalling())
        {
          v16 = objc_msgSend(v13, "identifier");
          v17 = v99;
LABEL_24:
          objc_msgSend(v17, "addObject:", v16);
LABEL_25:
          v2 = v108;
          goto LABEL_26;
        }
        v18 = -[NSMutableSet containsObject:](-[TIDictationLanguageListController onDeviceLocalesDownloading](v108, "onDeviceLocalesDownloading"), "containsObject:", objc_msgSend(v13, "identifier"));
        v19 = objc_msgSend(v13, "identifier");
        if (v18)
          v20 = v98;
        else
          v20 = v99;
        objc_msgSend(v20, "addObject:", v19);
        v21 = AFOfflineDictationStatusStringAssetId();
        if (v21)
        {
          v22 = v21;
          objc_msgSend(v103, "addObject:", v21);
          v23 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](-[TIDictationLanguageListController assetIdToLanguages](v108, "assetIdToLanguages"), "objectForKeyedSubscript:", v22);
          if (!v23)
          {
            v23 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
            -[NSMutableDictionary setObject:forKeyedSubscript:](-[TIDictationLanguageListController assetIdToLanguages](v108, "assetIdToLanguages"), "setObject:forKeyedSubscript:", v23, v22);
          }
          objc_msgSend(v23, "addObject:", objc_msgSend(v13, "identifier"));
          v2 = v108;
        }
        else
        {
          v2 = v108;
        }
        v4 = v97;
      }
LABEL_26:
      ++v12;
    }
    while (v9 != v12);
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v130, 16);
    v9 = v24;
  }
  while (v24);
LABEL_33:
  v25 = v103;
  v26 = (void *)v96;
  v27 = v105;
  if (objc_msgSend(v103, "count"))
  {
    objc_msgSend(v103, "minusSet:", -[TIDictationLanguageListController trackingDownloadStatusForAssetsIDs](v2, "trackingDownloadStatusForAssetsIDs"));
    if (objc_msgSend(v103, "count"))
    {
      v121 = 0u;
      v122 = 0u;
      v119 = 0u;
      v120 = 0u;
      v28 = (void *)objc_msgSend(v103, "allObjects");
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v119, v129, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v120;
        v32 = MEMORY[0x24BDAC760];
        do
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v120 != v31)
              objc_enumerationMutation(v28);
            v34 = *(_QWORD *)(*((_QWORD *)&v119 + 1) + 8 * i);
            -[NSMutableSet addObject:](-[TIDictationLanguageListController trackingDownloadStatusForAssetsIDs](v108, "trackingDownloadStatusForAssetsIDs"), "addObject:", v34);
            objc_msgSend(v25, "removeObject:", v34);
            v35 = objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](-[TIDictationLanguageListController assetIdToLanguages](v108, "assetIdToLanguages"), "objectForKeyedSubscript:", v34), "allObjects"), "firstObject");
            if (v35)
            {
              v36 = v35;
              v37 = +[TIWeakRefHolder weakRefHolderWithObject:](TIWeakRefHolder, "weakRefHolderWithObject:", v108);
              SFSpeechAssetManagerClass = (void *)getSFSpeechAssetManagerClass();
              v39 = objc_msgSend((id)getSFSpeechAssetManagerClass(), "systemClientId");
              v117[5] = v34;
              v118[0] = v32;
              v118[1] = 3221225472;
              v118[2] = __73__TIDictationLanguageListController_onDeviceDictationLanguagesSpecifiers__block_invoke;
              v118[3] = &unk_24E7325C8;
              v118[4] = v37;
              v118[5] = v34;
              v117[0] = v32;
              v117[1] = 3221225472;
              v117[2] = __73__TIDictationLanguageListController_onDeviceDictationLanguagesSpecifiers__block_invoke_2;
              v117[3] = &unk_24E7325F0;
              v117[4] = v37;
              v25 = v103;
              objc_msgSend(SFSpeechAssetManagerClass, "fetchAssetsForLanguage:clientIdentifier:urgent:forceUpgrade:detailedProgress:completion:", v36, v39, 0, 0, v118, v117);
            }
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v119, v129, 16);
        }
        while (v30);
      }
      v115 = 0u;
      v116 = 0u;
      v113 = 0u;
      v114 = 0u;
      v40 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v113, v128, 16);
      v2 = v108;
      v26 = (void *)v96;
      v27 = v105;
      if (v40)
      {
        v41 = v40;
        v42 = *(_QWORD *)v114;
        do
        {
          for (j = 0; j != v41; ++j)
          {
            if (*(_QWORD *)v114 != v42)
              objc_enumerationMutation(v25);
            -[NSMutableDictionary removeObjectForKey:](-[TIDictationLanguageListController assetIdToLanguages](v108, "assetIdToLanguages"), "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * j));
          }
          v41 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v113, v128, 16);
        }
        while (v41);
      }
    }
  }
  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  v44 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v109, v127, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v110;
    do
    {
      for (k = 0; k != v45; ++k)
      {
        if (*(_QWORD *)v110 != v46)
          objc_enumerationMutation(v27);
        v48 = *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * k);
        if ((unint64_t)objc_msgSend(v27, "countForObject:", v48) >= 2)
          objc_msgSend(v26, "addObject:", v48);
      }
      v45 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v109, v127, 16);
    }
    while (v45);
  }
  v49 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("DICTATION_ON_DEVICE_ABOUT_LINK"), &stru_24E732B90, CFSTR("Keyboard"));
  if (!v104)
  {
    v53 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("DICTATION_ON_DEVICE_SERVER"), &stru_24E732B90, CFSTR("Keyboard"));
    goto LABEL_68;
  }
  if (!objc_msgSend(v102, "count"))
  {
    if (v104 != 1)
    {
      if (!objc_msgSend(v100, "count") && !objc_msgSend(v98, "count"))
        goto LABEL_82;
      if (objc_msgSend(v98, "count"))
      {
        if (!objc_msgSend(v100, "count"))
          goto LABEL_91;
        v67 = (void *)MEMORY[0x24BDD17C8];
        v68 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v69 = (void *)objc_msgSend(v67, "stringWithFormat:", objc_msgSend(v68, "localizedStringForKey:value:table:", LocStringKeyBasedOnLanguageCount(CFSTR("DICTATION_ON_DEVICE_PRIVATE_PROCESSING_WITH_LANGUAGE"), objc_msgSend(v100, "count"), 0), &stru_24E732B90, CFSTR("Keyboard")), +[KeyboardController localizedListForInputModes:forDictation:duplicatedBaseLanguages:](KeyboardController, "localizedListForInputModes:forDictation:duplicatedBaseLanguages:", v100, 1, v26));
        v52 = objc_msgSend(v69, "stringByAppendingFormat:", CFSTR(" %@"), objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("DICTATION_ON_DEVICE_SERVER_SOMETIMES"), &stru_24E732B90, CFSTR("Keyboard")));
LABEL_92:
        v54 = (void *)v52;
        v81 = (void *)MEMORY[0x24BDD17C8];
        v85 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v83 = objc_msgSend(v85, "localizedStringForKey:value:table:", LocStringKeyBasedOnLanguageCount(CFSTR("DICTATION_ON_DEVICE_SUPPORT_DOWNLOADING_WITH_LANGUAGE"), objc_msgSend(v98, "count"), 0), &stru_24E732B90, CFSTR("Keyboard"));
        v84 = objc_msgSend(v98, "allObjects");
      }
      else
      {
        v77 = objc_msgSend(v99, "count");
        v78 = (void *)MEMORY[0x24BDD17C8];
        v79 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        if (!v77)
        {
          v91 = objc_msgSend(v79, "localizedStringForKey:value:table:", CFSTR("DICTATION_ON_DEVICE_PRIVATE_PROCESSING"), &stru_24E732B90, CFSTR("Keyboard"));
          v92 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          if ((v101 & 1) != 0)
            v93 = CFSTR("DICTATION_ON_DEVICE_SERVER_SOMETIMES_NO_SEARCH");
          else
            v93 = CFSTR("DICTATION_ON_DEVICE_SERVER_SOMETIMES");
          v53 = objc_msgSend(v78, "stringWithFormat:", CFSTR("%@ %@"), v91, objc_msgSend(v92, "localizedStringForKey:value:table:", v93, &stru_24E732B90, CFSTR("Keyboard")));
          goto LABEL_68;
        }
        v80 = (void *)objc_msgSend(v78, "stringWithFormat:", objc_msgSend(v79, "localizedStringForKey:value:table:", LocStringKeyBasedOnLanguageCount(CFSTR("DICTATION_ON_DEVICE_PRIVATE_PROCESSING_WITH_LANGUAGE"), objc_msgSend(v100, "count"), 0), &stru_24E732B90, CFSTR("Keyboard")), +[KeyboardController localizedListForInputModes:forDictation:duplicatedBaseLanguages:](KeyboardController, "localizedListForInputModes:forDictation:duplicatedBaseLanguages:", v100, 1, v26));
        v54 = (void *)objc_msgSend(v80, "stringByAppendingFormat:", CFSTR(" %@"), objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("DICTATION_ON_DEVICE_SERVER_SOMETIMES"), &stru_24E732B90, CFSTR("Keyboard")));
        v81 = (void *)MEMORY[0x24BDD17C8];
        v82 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        LocStringKeyBasedOnLanguageCount(CFSTR("DICTATION_ON_DEVICE_SUPPORT_DOWNLOAD_WITH_LANGUAGE"), objc_msgSend(v99, "count"), (uint64_t)CFSTR("_WIFI"));
        v83 = objc_msgSend(v82, "localizedStringForKey:value:table:", SFLocalizableWAPIStringKeyForKey(), &stru_24E732B90, CFSTR("Keyboard"));
        v84 = (uint64_t)v99;
      }
      v58 = objc_msgSend(v81, "stringWithFormat:", v83, +[KeyboardController localizedListForInputModes:forDictation:duplicatedBaseLanguages:](KeyboardController, "localizedListForInputModes:forDictation:duplicatedBaseLanguages:", v84, 1, v26));
      goto LABEL_94;
    }
    if (objc_msgSend(v98, "count"))
    {
      v54 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("DICTATION_ON_DEVICE_SERVER_WHEN_NECESSARY"), &stru_24E732B90, CFSTR("Keyboard"));
      v56 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v57 = CFSTR("DICTATION_ON_DEVICE_SUPPORT_DOWNLOADING");
LABEL_73:
      v58 = objc_msgSend(v56, "localizedStringForKey:value:table:", v57, &stru_24E732B90, CFSTR("Keyboard"));
      goto LABEL_94;
    }
    v72 = objc_msgSend(v100, "count");
    v73 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    if (!v72)
    {
      v54 = (void *)objc_msgSend(v73, "localizedStringForKey:value:table:", CFSTR("DICTATION_ON_DEVICE_SERVER_WHEN_NECESSARY"), &stru_24E732B90, CFSTR("Keyboard"));
      v90 = objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v57 = (const __CFString *)SFLocalizableWAPIStringKeyForKey();
      v56 = (void *)v90;
      goto LABEL_73;
    }
    v74 = (void *)objc_msgSend(v73, "localizedStringForKey:value:table:", CFSTR("DICTATION_ON_DEVICE_PRIVATE_PROCESSING"), &stru_24E732B90, CFSTR("Keyboard"));
    v75 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    if ((v101 & 1) != 0)
      v76 = CFSTR("DICTATION_ON_DEVICE_SERVER_SOMETIMES_NO_SEARCH");
    else
      v76 = CFSTR("DICTATION_ON_DEVICE_SERVER_SOMETIMES");
    v53 = objc_msgSend(v74, "stringByAppendingFormat:", CFSTR(" %@"), objc_msgSend(v75, "localizedStringForKey:value:table:", v76, &stru_24E732B90, CFSTR("Keyboard")));
LABEL_68:
    v54 = (void *)v53;
    goto LABEL_69;
  }
  if (objc_msgSend(v100, "count") || objc_msgSend(v98, "count"))
  {
    if (objc_msgSend(v98, "count"))
    {
      if (objc_msgSend(v100, "count"))
      {
        v50 = (void *)MEMORY[0x24BDD17C8];
        v51 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v52 = objc_msgSend(v50, "stringWithFormat:", objc_msgSend(v51, "localizedStringForKey:value:table:", LocStringKeyBasedOnLanguageCount(CFSTR("DICTATION_ON_DEVICE_PRIVATE_PROCESSING_WITH_LANGUAGE"), objc_msgSend(v100, "count"), 0), &stru_24E732B90, CFSTR("Keyboard")), +[KeyboardController localizedListForInputModes:forDictation:duplicatedBaseLanguages:](KeyboardController, "localizedListForInputModes:forDictation:duplicatedBaseLanguages:", v100, 1, v26));
        goto LABEL_92;
      }
LABEL_91:
      v52 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("DICTATION_ON_DEVICE_SERVER_WHEN_NECESSARY"), &stru_24E732B90, CFSTR("Keyboard"));
      goto LABEL_92;
    }
    obja = (id)objc_msgSend(v99, "count");
    v59 = (void *)MEMORY[0x24BDD17C8];
    v60 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v61 = (void *)objc_msgSend(v59, "stringWithFormat:", objc_msgSend(v60, "localizedStringForKey:value:table:", LocStringKeyBasedOnLanguageCount(CFSTR("DICTATION_ON_DEVICE_PRIVATE_PROCESSING_WITH_LANGUAGE"), objc_msgSend(v100, "count"), 0), &stru_24E732B90, CFSTR("Keyboard")), +[KeyboardController localizedListForInputModes:forDictation:duplicatedBaseLanguages:](KeyboardController, "localizedListForInputModes:forDictation:duplicatedBaseLanguages:", v100, 1, v26));
    v62 = (void *)MEMORY[0x24BDD17C8];
    v63 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v54 = (void *)objc_msgSend(v61, "stringByAppendingFormat:", CFSTR(" %@"), objc_msgSend(v62, "stringWithFormat:", objc_msgSend(v63, "localizedStringForKey:value:table:", LocStringKeyBasedOnLanguageCount(CFSTR("DICTATION_ON_DEVICE_SERVER_SOMETIMES_WITH_LANGUAGE"), objc_msgSend(v102, "count"), 0), &stru_24E732B90, CFSTR("Keyboard")), +[KeyboardController localizedListForInputModes:forDictation:duplicatedBaseLanguages:](KeyboardController, "localizedListForInputModes:forDictation:duplicatedBaseLanguages:", v102,
                        1,
                        v26)));
    if (obja)
    {
      v64 = (void *)MEMORY[0x24BDD17C8];
      v65 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      LocStringKeyBasedOnLanguageCount(CFSTR("DICTATION_ON_DEVICE_SUPPORT_DOWNLOAD_WITH_LANGUAGE"), objc_msgSend(v99, "count"), (uint64_t)CFSTR("_WIFI"));
      v66 = objc_msgSend(v64, "stringWithFormat:", objc_msgSend(v65, "localizedStringForKey:value:table:", SFLocalizableWAPIStringKeyForKey(), &stru_24E732B90, CFSTR("Keyboard")), +[KeyboardController localizedListForInputModes:forDictation:duplicatedBaseLanguages:](KeyboardController, "localizedListForInputModes:forDictation:duplicatedBaseLanguages:", v99, 1, v26));
      goto LABEL_95;
    }
LABEL_69:
    v55 = objc_msgSend(v54, "stringByAppendingFormat:", CFSTR(" %@"), v49);
LABEL_97:
    v87 = (void *)v55;
    goto LABEL_98;
  }
LABEL_82:
  v54 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("DICTATION_ON_DEVICE_SERVER_WHEN_NECESSARY"), &stru_24E732B90, CFSTR("Keyboard"));
  v70 = (void *)MEMORY[0x24BDD17C8];
  v71 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  LocStringKeyBasedOnLanguageCount(CFSTR("DICTATION_ON_DEVICE_SUPPORT_DOWNLOAD_WITH_LANGUAGE"), objc_msgSend(v99, "count"), (uint64_t)CFSTR("_WIFI"));
  v58 = objc_msgSend(v70, "stringWithFormat:", objc_msgSend(v71, "localizedStringForKey:value:table:", SFLocalizableWAPIStringKeyForKey(), &stru_24E732B90, CFSTR("Keyboard")), +[KeyboardController localizedListForInputModes:forDictation:duplicatedBaseLanguages:](KeyboardController, "localizedListForInputModes:forDictation:duplicatedBaseLanguages:", v99, 1, v26));
LABEL_94:
  v66 = v58;
LABEL_95:
  v86 = (void *)objc_msgSend(v54, "stringByAppendingFormat:", CFSTR(" %@"), v49);
  v87 = v86;
  if (v66)
  {
    v55 = objc_msgSend(v86, "stringByAppendingFormat:", CFSTR("\n\n%@"), v66);
    goto LABEL_97;
  }
LABEL_98:
  v88 = (objc_class *)objc_opt_class();
  objc_msgSend(v94, "setProperty:forKey:", NSStringFromClass(v88), *MEMORY[0x24BE75A30]);
  objc_msgSend(v94, "setProperty:forKey:", v87, *MEMORY[0x24BE75A58]);
  v132.location = objc_msgSend(v87, "rangeOfString:", v49);
  objc_msgSend(v94, "setProperty:forKey:", NSStringFromRange(v132), *MEMORY[0x24BE75A40]);
  v89 = objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", v2);
  objc_msgSend(v94, "setProperty:forKey:", v89, *MEMORY[0x24BE75A50]);
  objc_msgSend(v94, "setProperty:forKey:", NSStringFromSelector(sel_presentPrivacySheet_), *MEMORY[0x24BE75A38]);
  result = v97;
  *(Class *)((char *)&v2->super.super.super.super.super.isa + v95) = (Class)v97;
  return result;
}

uint64_t __73__TIDictationLanguageListController_onDeviceDictationLanguagesSpecifiers__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strongRef"), "updateDownloadingProgressForAsset:stalled:", *(_QWORD *)(a1 + 40), a3);
}

uint64_t __73__TIDictationLanguageListController_onDeviceDictationLanguagesSpecifiers__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strongRef"), "updateDownloadingStateForAsset:success:", *(_QWORD *)(a1 + 40), a3 == 0);
}

- (void)presentPrivacySheet:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(MEMORY[0x24BE6E438], "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.siri"));
  objc_msgSend(v4, "setPresentingViewController:", self);
  objc_msgSend(v4, "present");
}

- (id)onDeviceNotCapableDictationLanguagesSpecifiers
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  objc_class *v19;
  uint64_t v20;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;
  NSRange v35;

  v34 = *MEMORY[0x24BDAC8D0];
  v28 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  if (!v28)
  {
    v24 = (int)*MEMORY[0x24BE756E0];
    -[TIDictationLanguageListController setTitle:](self, "setTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("Dictation Languages"), &stru_24E732B90, CFSTR("Dictation")));
    v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB5B00], "sharedPreferencesController");
    v5 = (void *)objc_msgSend(v4, "suggestedDictationModesForKeyboardLanguages:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController"), "activeDictationSupportedInputModeIdentifiers"));
    v6 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6B58], "sharedPreferencesController"), "preferencesActions"), "valueForPreferenceKey:", CFSTR("DictationLanguagesEnabled")), "mutableCopy");
    v26 = (void *)objc_msgSend(MEMORY[0x24BDD14E0], "set");
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v25 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v28 = v3;
    v23 = (void *)objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:name:", CFSTR("DICTATION_LANGUAGES"), 0);
    objc_msgSend(v3, "addObject:");
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v7)
    {
      v8 = v7;
      v27 = 0;
      v9 = *(_QWORD *)v30;
      v10 = *MEMORY[0x24BE75AC0];
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v30 != v9)
            objc_enumerationMutation(v5);
          v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          v13 = (void *)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend(v12, "displayName"), self, 0, 0, 0, 3, 0);
          objc_msgSend(v13, "setButtonAction:", sel_toggleDictationLanguage_);
          objc_msgSend(v13, "setProperty:forKey:", objc_msgSend(v12, "identifier"), v10);
          objc_msgSend(v13, "setProperty:forKey:", v6, CFSTR("enabledDictationLanguages"));
          objc_msgSend(v28, "addObject:", v13);
          if (objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", objc_msgSend(v12, "identifier")), "BOOLValue"))
          {
            objc_msgSend(v12, "identifier");
            TIInputModeGetBaseLanguage();
            objc_msgSend(v26, "addObject:", TIInputModeGetBaseLanguage());
            if (-[NSDictionary objectForKeyedSubscript:](-[TIDictationLanguageListController offlineStatusForLanguage](self, "offlineStatusForLanguage"), "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(v12, "identifier"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"))))
            {
              ++v27;
              if (AFOfflineDictationStatusStringIsInstalled())
                objc_msgSend(v25, "addObject:", objc_msgSend(v12, "identifier"));
            }
          }
        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v8);
    }
    else
    {
      v27 = 0;
    }
    v14 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("DICTATION_ON_DEVICE_ABOUT_LINK"), &stru_24E732B90, CFSTR("Keyboard"));
    v15 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("DICTATION_ON_DEVICE_SERVER"), &stru_24E732B90, CFSTR("Keyboard")), v14);
    if (!v27)
      goto LABEL_19;
    if (objc_msgSend(v25, "count"))
    {
      v16 = (void *)MEMORY[0x24BDD17C8];
      v17 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v18 = objc_msgSend(v16, "stringWithFormat:", objc_msgSend(v17, "localizedStringForKey:value:table:", LocStringKeyBasedOnLanguageCount(CFSTR("DICTATION_OFFLINE_EXPLANATION_SUFFIX_INSTALLED_WITH_LANGUAGE"), objc_msgSend(v25, "count"), 0), &stru_24E732B90, CFSTR("Keyboard")), +[KeyboardController localizedListForInputModes:forDictation:duplicatedBaseLanguages:](KeyboardController, "localizedListForInputModes:forDictation:duplicatedBaseLanguages:", v25, 1, 0));
      if (!v18)
      {
LABEL_19:
        v19 = (objc_class *)objc_opt_class();
        objc_msgSend(v23, "setProperty:forKey:", NSStringFromClass(v19), *MEMORY[0x24BE75A30]);
        objc_msgSend(v23, "setProperty:forKey:", v15, *MEMORY[0x24BE75A58]);
        v35.location = objc_msgSend(v15, "rangeOfString:", v14);
        objc_msgSend(v23, "setProperty:forKey:", NSStringFromRange(v35), *MEMORY[0x24BE75A40]);
        v20 = objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
        objc_msgSend(v23, "setProperty:forKey:", v20, *MEMORY[0x24BE75A50]);
        objc_msgSend(v23, "setProperty:forKey:", NSStringFromSelector(sel_presentPrivacySheet_), *MEMORY[0x24BE75A38]);
        *(Class *)((char *)&self->super.super.super.super.super.isa + v24) = (Class)v28;
        return v28;
      }
    }
    else
    {
      v22 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v18 = objc_msgSend(v22, "localizedStringForKey:value:table:", SFLocalizableWAPIStringKeyForKey(), &stru_24E732B90, CFSTR("Keyboard"));
      if (!v18)
        goto LABEL_19;
    }
    v15 = (void *)objc_msgSend(v15, "stringByAppendingFormat:", CFSTR("\n\n%@"), v18);
    goto LABEL_19;
  }
  return v28;
}

- (id)specifiers
{
  if (_os_feature_enabled_impl())
    return -[TIDictationLanguageListController slsDictationLanguagesSpecifiers](self, "slsDictationLanguagesSpecifiers");
  if (AFDeviceHighestLanguageModelCapabilityIdentifier() == 10)
    return -[TIDictationLanguageListController onDeviceDictationLanguagesSpecifiers](self, "onDeviceDictationLanguagesSpecifiers");
  return -[TIDictationLanguageListController onDeviceNotCapableDictationLanguagesSpecifiers](self, "onDeviceNotCapableDictationLanguagesSpecifiers");
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  if (_os_feature_enabled_impl())
    return -[TIDictationLanguageListController tableView:classicDictationCellForRowAtIndexPath:](self, "tableView:classicDictationCellForRowAtIndexPath:", a3, a4);
  else
    return -[TIDictationLanguageListController tableView:enhancedDictationCellForRowAtIndexPath:](self, "tableView:enhancedDictationCellForRowAtIndexPath:", a3, a4);
}

- (id)tableView:(id)a3 enhancedDictationCellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TIDictationLanguageListController;
  v6 = -[TIDictationLanguageListController tableView:cellForRowAtIndexPath:](&v15, sel_tableView_cellForRowAtIndexPath_, a3);
  v7 = (void *)-[TIDictationLanguageListController specifierAtIndex:](self, "specifierAtIndex:", -[TIDictationLanguageListController indexForIndexPath:](self, "indexForIndexPath:", a4));
  v8 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6B58], "sharedPreferencesController"), "preferencesActions");
  v9 = objc_msgSend((id)objc_opt_class(), "numberOfEnabledEntries:", objc_msgSend(v8, "valueForPreferenceKey:", *MEMORY[0x24BDF76E0]));
  objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
    v11 = objc_msgSend(v10, "isDictationLanguageEnabled:", objc_msgSend(v7, "propertyForKey:", *MEMORY[0x24BE75AC0]));
    objc_msgSend(v6, "setChecked:", v11);
  }
  else
  {
    LODWORD(v11) = 0;
  }
  if (v9 == 1)
    v12 = v11 ^ 1;
  else
    v12 = 1;
  objc_msgSend(v6, "setUserInteractionEnabled:", v12);
  if ((v12 & 1) != 0)
  {
    objc_msgSend((id)objc_msgSend(v6, "titleLabel"), "setTextColor:", objc_msgSend(MEMORY[0x24BDF6950], "labelColor"));
    objc_msgSend(v6, "setSelectionStyle:", 3);
    v13 = 0;
  }
  else
  {
    objc_msgSend((id)objc_msgSend(v6, "titleLabel"), "setTextColor:", objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor"));
    objc_msgSend(v6, "setSelectionStyle:", 0);
    v13 = objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
  }
  objc_msgSend(v6, "setTintColor:", v13);
  return v6;
}

- (id)tableView:(id)a3 classicDictationCellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  int v33;
  _BOOL4 v34;
  _BOOL4 v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v45.receiver = self;
  v45.super_class = (Class)TIDictationLanguageListController;
  v6 = -[TIDictationLanguageListController tableView:cellForRowAtIndexPath:](&v45, sel_tableView_cellForRowAtIndexPath_, a3);
  v7 = (void *)-[TIDictationLanguageListController specifierAtIndex:](self, "specifierAtIndex:", -[TIDictationLanguageListController indexForIndexPath:](self, "indexForIndexPath:", a4));
  v8 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6B58], "sharedPreferencesController"), "preferencesActions");
  v9 = (void *)objc_msgSend(v8, "valueForPreferenceKey:", *MEMORY[0x24BDF76E0]);
  if (!objc_msgSend(a4, "section"))
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v12 = (void *)objc_msgSend(v9, "allKeys");
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v13)
    {
      v14 = v13;
      v15 = 0;
      v16 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v42 != v16)
            objc_enumerationMutation(v12);
          v15 += objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i)), "BOOLValue");
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      }
      while (v14);
    }
    else
    {
      v15 = 0;
    }
    objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v25 = (void *)objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
      v26 = objc_msgSend(v25, "isDictationLanguageEnabled:", objc_msgSend(v7, "propertyForKey:", *MEMORY[0x24BE75AC0]));
      objc_msgSend(v6, "setChecked:", v26);
    }
    else
    {
      LODWORD(v26) = 0;
    }
    if (v15 == 1)
      v27 = v26 ^ 1;
    else
      v27 = 1;
    objc_msgSend(v6, "setUserInteractionEnabled:", v27);
    v28 = (void *)MEMORY[0x24BDF6950];
    if ((v27 & 1) != 0)
      goto LABEL_39;
    goto LABEL_29;
  }
  if (objc_msgSend(a4, "section") == 1)
  {
    objc_msgSend((id)objc_msgSend(v6, "titleLabel"), "setTextColor:", objc_msgSend(MEMORY[0x24BDF6950], "labelColor"));
    v10 = v6;
    v11 = 0;
LABEL_40:
    objc_msgSend(v10, "setSelectionStyle:", v11);
    v29 = 0;
    goto LABEL_41;
  }
  if (objc_msgSend(a4, "section") == 2)
  {
    objc_msgSend(v6, "setSelectionStyle:", 3);
    v18 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences"), "dictationSLSLanguagesEnabled");
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v19 = (void *)objc_msgSend(v18, "allKeys", 0);
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    if (v20)
    {
      v21 = v20;
      v22 = 0;
      v23 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v38 != v23)
            objc_enumerationMutation(v19);
          v22 += objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j)), "BOOLValue");
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
      }
      while (v21);
    }
    else
    {
      v22 = 0;
    }
    v30 = objc_msgSend(v7, "propertyForKey:", *MEMORY[0x24BE75D50]);
    if (v18)
    {
      v31 = v30;
      objc_msgSend(v6, "setChecked:", objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", v30), "BOOLValue"));
      v32 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", v31), "BOOLValue");
      v33 = objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", v31), "BOOLValue");
      if ((v22 & 0xFFFFFFFE) == 2)
        v34 = v32;
      else
        v34 = 0;
      if (v33)
        v35 = v22 != 2;
      else
        v35 = v34;
      v28 = (void *)MEMORY[0x24BDF6950];
      if (v35)
      {
LABEL_39:
        objc_msgSend((id)objc_msgSend(v6, "titleLabel"), "setTextColor:", objc_msgSend(v28, "labelColor"));
        v10 = v6;
        v11 = 3;
        goto LABEL_40;
      }
LABEL_29:
      objc_msgSend((id)objc_msgSend(v6, "titleLabel"), "setTextColor:", objc_msgSend(v28, "secondaryLabelColor"));
      objc_msgSend(v6, "setSelectionStyle:", 0);
      v29 = objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
LABEL_41:
      objc_msgSend(v6, "setTintColor:", v29);
    }
  }
  return v6;
}

- (void)toggleSLSEnabled:(id)a3
{
  void *v5;
  int v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t i;
  BOOL v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v6 = objc_msgSend(v5, "isChecked");
  v7 = objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75D50]);
  v8 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences"), "dictationSLSLanguagesEnabled"), "mutableCopy");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = (void *)objc_msgSend(v8, "allKeys", 0);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v9);
        v12 += objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i)), "BOOLValue");
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }
  v15 = (v12 - 4) < 0xFFFFFFFD;
  if (v6)
    v15 = v12 == 2;
  if (!v15)
  {
    v16 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6B58], "sharedPreferencesController"), "preferencesActions"), "valueForPreferenceKey:", CFSTR("DictationLanguagesEnabled"));
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v5, "setChecked:", v6 ^ 1u);
      v17 = objc_msgSend(MEMORY[0x24BDF6950], "grayColor");
    }
    else
    {
      if (!objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", v7), "BOOLValue"))
        return;
      objc_msgSend(v5, "setChecked:", v6 ^ 1u);
      v17 = objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    }
    objc_msgSend((id)objc_msgSend(v5, "titleLabel"), "setTextColor:", v17);
    objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6 ^ 1u), v7);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences"), "setDictationSLSLanguagesEnabled:", v8);
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75700]), "reloadData");
  }
}

- (void)handleSmartLanguageSelectionOnDictationLanguageToggle:(BOOL)a3 enabledDictationLanguages:(id)a4 specifier:(id)a5
{
  _BOOL4 v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v7 = a3;
  v49 = *MEMORY[0x24BDAC8D0];
  v8 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences"), "dictationSLSLanguagesEnabled"), "mutableCopy");
  v9 = objc_msgSend(a5, "propertyForKey:", *MEMORY[0x24BE75AC0]);
  v10 = objc_msgSend((id)objc_opt_class(), "numberOfEnabledEntries:", a4);
  if (v7)
  {
    if (!objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", v9), "BOOLValue"))
      return;
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0), v9);
    if (v10 == 2)
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v11 = (void *)objc_msgSend(v8, "allKeys");
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v43;
        v15 = MEMORY[0x24BDBD1C0];
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v43 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i));
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
        }
        while (v13);
      }
    }
    else if (v10 >= 3 && objc_msgSend((id)objc_opt_class(), "numberOfEnabledEntries:", v8) <= 1)
    {
      v26 = (id)objc_msgSend((id)objc_msgSend(a4, "keysOfEntriesPassingTest:", &__block_literal_global_4), "mutableCopy");
      objc_msgSend(v26, "intersectSet:", objc_msgSend(v8, "keysOfEntriesPassingTest:", &__block_literal_global_337));
      objc_msgSend(v26, "removeObject:", v9);
      v27 = (void *)objc_msgSend(MEMORY[0x24BEB5B00], "sharedPreferencesController");
      v28 = (void *)objc_msgSend(v27, "suggestedDictationModesForKeyboardLanguages:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController"), "activeDictationSupportedInputModeIdentifiers"));
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v39;
        while (2)
        {
          for (j = 0; j != v30; ++j)
          {
            if (*(_QWORD *)v39 != v31)
              objc_enumerationMutation(v28);
            v33 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
            if (objc_msgSend(v26, "containsObject:", objc_msgSend(v33, "identifier")))
            {
              v25 = objc_msgSend(v33, "identifier");
              v23 = MEMORY[0x24BDBD1C8];
              v24 = v8;
              goto LABEL_23;
            }
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
          if (v30)
            continue;
          break;
        }
      }
    }
    goto LABEL_24;
  }
  v17 = objc_msgSend((id)objc_opt_class(), "numberOfEnabledEntries:", v8);
  if (v10 == 1)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v18 = (void *)objc_msgSend(a4, "allKeys", 0);
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v35;
      do
      {
        for (k = 0; k != v20; ++k)
        {
          if (*(_QWORD *)v35 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(a4, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * k)), *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * k));
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
      }
      while (v20);
    }
  }
  if (v17 <= 3 && v10 >= 1)
  {
    v23 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v24 = v8;
    v25 = v9;
LABEL_23:
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, v25);
LABEL_24:
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences"), "setDictationSLSLanguagesEnabled:", v8);
  }
}

uint64_t __127__TIDictationLanguageListController_handleSmartLanguageSelectionOnDictationLanguageToggle_enabledDictationLanguages_specifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "BOOLValue");
}

uint64_t __127__TIDictationLanguageListController_handleSmartLanguageSelectionOnDictationLanguageToggle_enabledDictationLanguages_specifier___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "BOOLValue") ^ 1;
}

- (void)toggleDictationLanguage:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v5 = (void *)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v6 = objc_msgSend(v5, "isChecked");
  v7 = (void *)objc_msgSend(a3, "propertyForKey:", CFSTR("enabledDictationLanguages"));
  if (_os_feature_enabled_impl())
    -[TIDictationLanguageListController handleSmartLanguageSelectionOnDictationLanguageToggle:enabledDictationLanguages:specifier:](self, "handleSmartLanguageSelectionOnDictationLanguageToggle:enabledDictationLanguages:specifier:", v6, v7, a3);
  v8 = v6 ^ 1;
  objc_msgSend(v5, "setChecked:", v8);
  v9 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v8);
  objc_msgSend(v7, "setObject:forKey:", v9, objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75AC0]));
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6B58], "sharedPreferencesController"), "preferencesActions");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6B58], "sharedPreferencesController"), "preferencesActions"), "setEnabledDictationLanguages:", v7);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BE17D00], "sharedCloudSettingsManager"), "writeToCloudSettings:forStore:", &unk_24E73E030, CFSTR("com.apple.cloudsettings.keyboard"));
  -[TIDictationLanguageListController reloadSpecifiers](self, "reloadSpecifiers");
}

- (NSDictionary)offlineStatusForLanguage
{
  return self->_offlineStatusForLanguage;
}

- (void)setOfflineStatusForLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1376);
}

- (DictationOfflineStatusObserver)dictaionOfflineStatusObserver
{
  return self->_dictaionOfflineStatusObserver;
}

- (void)setDictaionOfflineStatusObserver:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1384);
}

- (NSMutableDictionary)assetIdToLanguages
{
  return self->_assetIdToLanguages;
}

- (void)setAssetIdToLanguages:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1392);
}

- (NSMutableSet)trackingDownloadStatusForAssetsIDs
{
  return self->_trackingDownloadStatusForAssetsIDs;
}

- (void)setTrackingDownloadStatusForAssetsIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1400);
}

- (NSMutableSet)onDeviceLocalesDownloading
{
  return self->_onDeviceLocalesDownloading;
}

- (void)setOnDeviceLocalesDownloading:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1408);
}

@end
