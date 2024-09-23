@implementation KSKeyboardController

- (void)offlineDictationStatusUpdated:(id)a3
{
  -[KSKeyboardController setOfflineStatusForLanguage:](self, "setOfflineStatusForLanguage:", a3);
  -[KSKeyboardController reloadSpecifiers](self, "reloadSpecifiers");
}

+ (BOOL)_isLowStorageForOnDeviceDictationAsset
{
  void *v2;
  uint64_t v4;

  v4 = 0;
  v2 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "attributesOfFileSystemForPath:error:", CFSTR("/private/var/MobileAsset/AssetsV2"), &v4);
  if (v2)
  {
    v2 = (void *)objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDD0D18]);
    if (v2)
      LOBYTE(v2) = (unint64_t)objc_msgSend(v2, "unsignedLongLongValue") >> 22 < 0x7D;
  }
  return (char)v2;
}

- (id)lowStorageOnDeviceAssetStringWithLinkString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  int IsInstalled;
  uint64_t v15;
  void *v16;
  id result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(MEMORY[0x24BDD14E0], "set");
  v27 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v28 = objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v29 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v30 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_msgSend(MEMORY[0x24BEB5B00], "sharedPreferencesController");
  v6 = (void *)objc_msgSend(v5, "suggestedDictationModesForKeyboardLanguages:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController"), "activeDictationSupportedInputModeIdentifiers"));
  v7 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F8], "sharedPreferencesController"), "preferencesActions"), "valueForPreferenceKey:", CFSTR("DictationLanguagesEnabled")), "mutableCopy");
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v8)
  {
    v9 = v8;
    v31 = 0;
    v10 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v37 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", objc_msgSend(v12, "identifier")), "BOOLValue"))
        {
          objc_msgSend(v12, "identifier");
          TIInputModeGetBaseLanguage();
          objc_msgSend(v4, "addObject:", TIInputModeGetBaseLanguage());
          if (!-[NSDictionary objectForKeyedSubscript:](-[KSKeyboardController offlineStatusForLanguage](self, "offlineStatusForLanguage"), "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(v12, "identifier"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"))))
          {
            v13 = _AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode();
            if (v13)
              -[NSDictionary objectForKeyedSubscript:](-[KSKeyboardController offlineStatusForLanguage](self, "offlineStatusForLanguage"), "objectForKeyedSubscript:", v13);
          }
          if (AFOfflineDictationStatusStringIsHighQualityModelSupported())
          {
            ++v31;
            IsInstalled = AFOfflineDictationStatusStringIsInstalled();
            v15 = objc_msgSend(v12, "identifier");
            if (IsInstalled)
              v16 = (void *)v28;
            else
              v16 = v29;
          }
          else
          {
            v15 = objc_msgSend(v12, "identifier");
            v16 = v30;
          }
          objc_msgSend(v16, "addObject:", v15);
        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v9);
  }
  else
  {
    v31 = 0;
  }
  result = (id)objc_msgSend(v29, "count");
  if (result)
  {
    if (!objc_msgSend((id)objc_opt_class(), "_isLowStorageForOnDeviceDictationAsset"))
      return 0;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v18 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v33 != v20)
            objc_enumerationMutation(v4);
          v22 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
          if ((unint64_t)objc_msgSend(v4, "countForObject:", v22) >= 2)
            objc_msgSend(v27, "addObject:", v22);
        }
        v19 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v19);
    }
    result = (id)objc_msgSend(v29, "count");
    if (result)
    {
      if (objc_msgSend(v30, "count") || v31 >= 2)
      {
        v23 = (void *)MEMORY[0x24BDD17C8];
        v24 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        if ((unint64_t)objc_msgSend(v29, "count") < 2)
          v25 = CFSTR("DICTATION_ON_DEVICE_LOW_STORAGE_WITH_LANGUAGE");
        else
          v25 = (const __CFString *)objc_msgSend(CFSTR("DICTATION_ON_DEVICE_LOW_STORAGE_WITH_LANGUAGE"), "stringByAppendingString:", CFSTR("S"));
        result = (id)objc_msgSend(v23, "stringWithFormat:", objc_msgSend(v24, "localizedStringForKey:value:table:", v25, &stru_25107A038, CFSTR("Keyboard")), +[KSKeyboardController localizedListForInputModes:forDictation:duplicatedBaseLanguages:](KSKeyboardController, "localizedListForInputModes:forDictation:duplicatedBaseLanguages:", v29, 1, v27));
        goto LABEL_42;
      }
      if (v31 == 1)
      {
        result = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("DICTATION_ON_DEVICE_LOW_STORAGE"), &stru_25107A038, CFSTR("Keyboard"));
LABEL_42:
        if (a3)
        {
          if (result)
            return (id)objc_msgSend(result, "stringByAppendingFormat:", CFSTR(" %@"), a3);
        }
        return result;
      }
      return 0;
    }
  }
  return result;
}

- (KSKeyboardController)init
{
  KSKeyboardController *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  objc_super v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v10.receiver = self;
  v10.super_class = (Class)KSKeyboardController;
  v2 = -[KSKeyboardController init](&v10, sel_init);
  if (v2)
  {
    v2->_dictionaryController = objc_alloc_init(KSUserWordsManager);
    objc_msgSend(MEMORY[0x24BEBD6E0], "sharedInstance");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)HardwareKeyboardAvailabilityChanged, (CFStringRef)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *MEMORY[0x24BE3D640]), 0, (CFNotificationSuspensionBehavior)0);
    v4 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_preferencesDidChange_, *MEMORY[0x24BEB50F8], 0);
    v5 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__dismissConfirmationSheet, *MEMORY[0x24BEBDF98], 0);
    v6 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v7 = (_QWORD *)getMCKeyboardSettingsChangedNotificationSymbolLoc_ptr;
    v14 = getMCKeyboardSettingsChangedNotificationSymbolLoc_ptr;
    if (!getMCKeyboardSettingsChangedNotificationSymbolLoc_ptr)
    {
      v8 = (void *)ManagedConfigurationLibrary();
      v7 = dlsym(v8, "MCKeyboardSettingsChangedNotification");
      v12[3] = (uint64_t)v7;
      getMCKeyboardSettingsChangedNotificationSymbolLoc_ptr = (uint64_t)v7;
    }
    _Block_object_dispose(&v11, 8);
    if (!v7)
      -[KSKeyboardController init].cold.1();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel_managedKeyboardSettingsDidChange, *v7, 0);
    if (init_onceToken != -1)
      dispatch_once(&init_onceToken, &__block_literal_global);
    if (AFOfflineDictationCapable())
      v2->_dictationOfflineStatusObserver = -[KSDictationOfflineStatusObserver initWithDelegate:]([KSDictationOfflineStatusObserver alloc], "initWithDelegate:", v2);
  }
  return v2;
}

void __28__KSKeyboardController_init__block_invoke()
{
  NSObject *global_queue;

  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_async(global_queue, &__block_literal_global_93);
}

uint64_t __28__KSKeyboardController_init__block_invoke_2()
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "URLForUbiquityContainerIdentifier:", 0);
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *MEMORY[0x24BE3D640]), 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)KSKeyboardController;
  -[KSKeyboardController dealloc](&v4, sel_dealloc);
}

- (id)bundle
{
  return (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
}

- (id)readPreferenceValue:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  objc_super v11;

  v5 = *MEMORY[0x24BE75B50];
  if (objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75B50]), "isEqualToString:", CFSTR("KanaFlick")))
  {
    v6 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController"), "enabledInputModeIdentifiers");
    v7 = (void *)MEMORY[0x24BDD16E0];
    v8 = objc_msgSend(v6, "indexOfObjectPassingTest:", &__block_literal_global_101) != 0x7FFFFFFFFFFFFFFFLL;
    return (id)objc_msgSend(v7, "numberWithInt:", v8);
  }
  if (objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", v5), "isEqualToString:", CFSTR("KanaLeftToRight")))
  {
    v9 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController"), "enabledInputModeIdentifiers");
    v7 = (void *)MEMORY[0x24BDD16E0];
    v8 = objc_msgSend(v9, "indexOfObjectPassingTest:", &__block_literal_global_108) == 0x7FFFFFFFFFFFFFFFLL;
    return (id)objc_msgSend(v7, "numberWithInt:", v8);
  }
  v11.receiver = self;
  v11.super_class = (Class)KSKeyboardController;
  return -[KSKeyboardController readPreferenceValue:](&v11, sel_readPreferenceValue_, a3);
}

uint64_t __44__KSKeyboardController_readPreferenceValue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend((id)TIInputModeGetComponentsFromIdentifier(), "objectForKeyedSubscript:", CFSTR("sw")), "_containsSubstring:", CFSTR("Flick"));
  if ((_DWORD)result)
    *a4 = 1;
  return result;
}

uint64_t __44__KSKeyboardController_readPreferenceValue___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend((id)TIInputModeGetComponentsFromIdentifier(), "objectForKeyedSubscript:", CFSTR("sw")), "_containsSubstring:", CFSTR("RTL"));
  if ((_DWORD)result)
    *a4 = 1;
  return result;
}

- (void)setKeyboardPreferenceValue:(id)a3 forSpecifier:(id)a4
{
  void *v7;
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  int v15;
  unint64_t v16;
  unint64_t v17;
  PSSpecifier *v18;
  int v19;
  unint64_t v20;
  unint64_t v21;
  PSSpecifier *v22;
  uint64_t v23;
  const __CFString *v24;
  __CFNotificationCenter *DarwinNotifyCenter;

  v7 = (void *)objc_msgSend(a4, "propertyForKey:", *MEMORY[0x24BE75B50]);
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("KanaLeftToRight")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("KanaFlick")))
  {
    v8 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController"), "enabledInputModeIdentifiers"), "mutableCopy");
    if (v8)
    {
      v9 = v8;
      v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController"), "normalizedEnabledInputModeIdentifiers"), "indexOfObject:", CFSTR("ja_JP-Kana"));
      if (v10 < objc_msgSend(v9, "count"))
      {
        v11 = (void *)objc_msgSend(v9, "objectAtIndex:", v10);
        v12 = objc_msgSend(v7, "isEqualToString:", CFSTR("KanaLeftToRight"));
        objc_msgSend(a3, "BOOLValue");
        if (v12)
          objc_msgSend(v11, "_containsSubstring:", CFSTR("Flick"));
        else
          objc_msgSend(v11, "_containsSubstring:", CFSTR("RTL"));
        objc_msgSend(v9, "replaceObjectAtIndex:withObject:", v10, UIKeyboardInputModeWithNewSWLayout());
        +[KSKeyboardListController setInputModes:](KSKeyboardListController, "setInputModes:", v9);
      }
    }
  }
  else
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("KeyboardPrediction")))
    {
      v13 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
      objc_msgSend(v13, "setValue:forPreferenceKey:", a3, *MEMORY[0x24BEB50D0]);
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("KeyboardAssistant"))
           && (objc_msgSend(a3, "BOOLValue") & 1) == 0)
    {
      UIKeyboardGetCurrentInputMode();
      TIInputModeGetNormalizedIdentifier();
      TIStatisticGetKeyForInputMode();
      TIStatisticScalarIncrement();
    }
    else if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BEBE3B0]))
    {
      TIStatisticGetKey();
      objc_msgSend(a3, "BOOLValue");
      TIStatisticScalarSetBoolean();
    }
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("KeyboardAutocapitalization")) & 1) != 0
      || (objc_msgSend(v7, "isEqualToString:", CFSTR("KeyboardAutocorrection")) & 1) != 0
      || (objc_msgSend(v7, "isEqualToString:", CFSTR("KeyboardPeriodShortcut")) & 1) != 0
      || (objc_msgSend(v7, "isEqualToString:", CFSTR("KeyboardContinuousPathEnabled")) & 1) != 0
      || (objc_msgSend(v7, "isEqualToString:", CFSTR("KeyboardContinuousPathDeleteWholeWord")) & 1) != 0
      || (objc_msgSend(v7, "isEqualToString:", CFSTR("KeyboardPrediction")) & 1) != 0
      || (objc_msgSend(v7, "isEqualToString:", CFSTR("KeyboardInlineCompletion")) & 1) != 0
      || (objc_msgSend(v7, "isEqualToString:", CFSTR("SpaceConfirmation")) & 1) != 0
      || objc_msgSend(v7, "isEqualToString:", CFSTR("KeyboardCapsLock")))
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController"), "setValue:forPreferenceKey:", a3, v7);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE75578], "setPreferenceValue:specifier:", a3, a4);
    }
  }
  v14 = *MEMORY[0x24BE75AC0];
  if (objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", *MEMORY[0x24BE75AC0]), "isEqualToString:", CFSTR("KeyboardContinuousPathEnabled")))
  {
    v15 = -[KSKeyboardController containsSpecifier:](self, "containsSpecifier:", -[KSKeyboardController deleteWordSpecifier](self, "deleteWordSpecifier"));
    if (!objc_msgSend(a3, "BOOLValue") || (v15 & 1) != 0)
    {
      if ((objc_msgSend(a3, "BOOLValue") & 1) == 0 && ((v15 ^ 1) & 1) == 0)
      {
        -[KSKeyboardController setDeleteWordSpecifierIndex:](self, "setDeleteWordSpecifierIndex:", objc_msgSend(-[KSKeyboardController specifiers](self, "specifiers"), "indexOfObject:", -[KSKeyboardController deleteWordSpecifier](self, "deleteWordSpecifier")));
        -[KSKeyboardController removeSpecifier:animated:](self, "removeSpecifier:animated:", -[KSKeyboardController deleteWordSpecifier](self, "deleteWordSpecifier"), 1);
      }
    }
    else
    {
      -[KSKeyboardController deleteWordSpecifierIndex](self, "deleteWordSpecifierIndex");
      v16 = -[KSKeyboardController deleteWordSpecifierIndex](self, "deleteWordSpecifierIndex");
      v17 = objc_msgSend(-[KSKeyboardController specifiers](self, "specifiers"), "count");
      v18 = -[KSKeyboardController deleteWordSpecifier](self, "deleteWordSpecifier");
      if (v16 >= v17)
        -[KSKeyboardController addSpecifier:animated:](self, "addSpecifier:animated:", v18, 1);
      else
        -[KSKeyboardController insertSpecifier:atIndex:animated:](self, "insertSpecifier:atIndex:animated:", v18, -[KSKeyboardController deleteWordSpecifierIndex](self, "deleteWordSpecifierIndex"), 1);
    }
  }
  if (objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", v14), "isEqualToString:", CFSTR("KeyboardPrediction")))
  {
    v19 = -[KSKeyboardController containsSpecifier:](self, "containsSpecifier:", -[KSKeyboardController inlineCompletionSpecifier](self, "inlineCompletionSpecifier"));
    if (!objc_msgSend(a3, "BOOLValue") || (v19 & 1) != 0)
    {
      if ((objc_msgSend(a3, "BOOLValue") & 1) == 0 && ((v19 ^ 1) & 1) == 0)
      {
        -[KSKeyboardController setInlineCompletionSpecifierIndex:](self, "setInlineCompletionSpecifierIndex:", objc_msgSend(-[KSKeyboardController specifiers](self, "specifiers"), "indexOfObject:", -[KSKeyboardController inlineCompletionSpecifier](self, "inlineCompletionSpecifier")));
        -[KSKeyboardController removeSpecifier:animated:](self, "removeSpecifier:animated:", -[KSKeyboardController inlineCompletionSpecifier](self, "inlineCompletionSpecifier"), 1);
      }
    }
    else
    {
      -[KSKeyboardController inlineCompletionSpecifierIndex](self, "inlineCompletionSpecifierIndex");
      v20 = -[KSKeyboardController inlineCompletionSpecifierIndex](self, "inlineCompletionSpecifierIndex");
      v21 = objc_msgSend(-[KSKeyboardController specifiers](self, "specifiers"), "count");
      v22 = -[KSKeyboardController inlineCompletionSpecifier](self, "inlineCompletionSpecifier");
      if (v20 >= v21)
        -[KSKeyboardController addSpecifier:animated:](self, "addSpecifier:animated:", v22, 1);
      else
        -[KSKeyboardController insertSpecifier:atIndex:animated:](self, "insertSpecifier:atIndex:animated:", v22, -[KSKeyboardController inlineCompletionSpecifierIndex](self, "inlineCompletionSpecifierIndex"), 1);
    }
  }
  v23 = *MEMORY[0x24BE759E8];
  if ((objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", *MEMORY[0x24BE759E8]), "isEqualToString:", CFSTR("com.apple.InputModePreferences")) & 1) != 0)
  {
    v24 = CFSTR("AppleKeyboardsInputModeChangedNotification");
  }
  else if ((objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", v23), "isEqualToString:", CFSTR("com.apple.keyboard.ContinuousPath")) & 1) != 0)
  {
    v24 = CFSTR("AppleKeyboardsContinuousPathSettingsChangedNotification");
  }
  else if (objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", v23), "isEqualToString:", CFSTR("com.apple.keyboard.predictive")))
  {
    v24 = CFSTR("AppleKeyboardsPredictiveChangedNotification");
  }
  else
  {
    v24 = CFSTR("AppleKeyboardsSettingsChangedNotification");
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v24, 0, 0, 1u);
}

- (id)readAutocorrectionPreferenceValue:(id)a3
{
  void *v3;

  if ((objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75B50]), "isEqualToString:", CFSTR("KeyboardAutocorrection")) & 1) == 0)-[KSKeyboardController readAutocorrectionPreferenceValue:].cold.1();
  v3 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  return (id)objc_msgSend(v3, "valueForPreferenceKey:", *MEMORY[0x24BEB5060]);
}

- (id)readPredictionPreferenceValue:(id)a3
{
  void *v3;

  if ((objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75B50]), "isEqualToString:", CFSTR("KeyboardPrediction")) & 1) == 0)-[KSKeyboardController readPredictionPreferenceValue:].cold.1();
  v3 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  return (id)objc_msgSend(v3, "valueForPreferenceKey:", *MEMORY[0x24BEB50C8]);
}

- (id)readKeyboardInlineCompletionPreferenceValue:(id)a3
{
  void *v3;

  if ((objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75B50]), "isEqualToString:", CFSTR("KeyboardInlineCompletion")) & 1) == 0)-[KSKeyboardController readKeyboardInlineCompletionPreferenceValue:].cold.1();
  v3 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  return (id)objc_msgSend(v3, "valueForPreferenceKey:", *MEMORY[0x24BEB5090]);
}

- (id)readKeyboardAllowPaddlePreferenceValue:(id)a3
{
  void *v3;

  if ((objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75B50]), "isEqualToString:", CFSTR("KeyboardAllowPaddle")) & 1) == 0)-[KSKeyboardController readKeyboardAllowPaddlePreferenceValue:].cold.1();
  v3 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  return (id)objc_msgSend(v3, "valueForPreferenceKey:", *MEMORY[0x24BEB5050]);
}

- (id)readCheckSpellingPreferenceValue:(id)a3
{
  void *v3;

  if ((objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75B50]), "isEqualToString:", CFSTR("KeyboardCheckSpelling")) & 1) == 0)-[KSKeyboardController readCheckSpellingPreferenceValue:].cold.1();
  v3 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  return (id)objc_msgSend(v3, "valueForPreferenceKey:", *MEMORY[0x24BEB5078]);
}

- (id)readCPPreferenceValue:(id)a3
{
  void *v3;

  if ((objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75B50]), "isEqualToString:", CFSTR("KeyboardContinuousPathEnabled")) & 1) == 0)-[KSKeyboardController readCPPreferenceValue:].cold.1();
  v3 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  return (id)objc_msgSend(v3, "valueForPreferenceKey:", *MEMORY[0x24BEB5088]);
}

- (id)readCPDeleteWordPreferenceValue:(id)a3
{
  void *v3;

  if ((objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75B50]), "isEqualToString:", CFSTR("KeyboardContinuousPathDeleteWholeWord")) & 1) == 0)-[KSKeyboardController readCPDeleteWordPreferenceValue:].cold.1();
  v3 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  return (id)objc_msgSend(v3, "valueForPreferenceKey:", *MEMORY[0x24BEB5080]);
}

- (void)setAutocorrectionPreferenceValue:(id)a3 forSpecifier:(id)a4
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  __int128 v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", *MEMORY[0x24BE75B50]), "isEqualToString:", CFSTR("KeyboardAutocorrection")) & 1) == 0)-[KSKeyboardController setAutocorrectionPreferenceValue:forSpecifier:].cold.1();
  if (!-[KSKeyboardController feedbackFeatureEnabled](self, "feedbackFeatureEnabled"))
    goto LABEL_11;
  if (!KeyboardSettingsFeedbackLibraryCore_frameworkLibrary)
  {
    v12 = xmmword_251079838;
    v13 = 0;
    KeyboardSettingsFeedbackLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!KeyboardSettingsFeedbackLibraryCore_frameworkLibrary)
    goto LABEL_11;
  *(_QWORD *)&v12 = 0;
  *((_QWORD *)&v12 + 1) = &v12;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v6 = (void *)getTUIFeedbackControllerClass_softClass;
  v16 = getTUIFeedbackControllerClass_softClass;
  if (!getTUIFeedbackControllerClass_softClass)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __getTUIFeedbackControllerClass_block_invoke;
    v11[3] = &unk_251079800;
    v11[4] = &v12;
    __getTUIFeedbackControllerClass_block_invoke((uint64_t)v11);
    v6 = *(void **)(*((_QWORD *)&v12 + 1) + 40);
  }
  _Block_object_dispose(&v12, 8);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = (void *)objc_msgSend(v6, "controllerWithPreferenceKey:supportedLanguages:", CFSTR("KeyboardAutocorrection"), objc_msgSend(MEMORY[0x24BEB4D30], "getSupportedFeedbackLanguages"));
    v8 = objc_msgSend(v7, "shouldCompleteStudyWithPreferenceValue:", objc_msgSend(a3, "BOOLValue"));
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
    objc_msgSend(v9, "setValue:forPreferenceKey:", a3, *MEMORY[0x24BEB5060]);
    if (v8)
      objc_msgSend(v7, "completeStudyWithFinalPreferenceValue:parentController:", objc_msgSend(a3, "BOOLValue"), self);
  }
  else
  {
LABEL_11:
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
    objc_msgSend(v10, "setValue:forPreferenceKey:", a3, *MEMORY[0x24BEB5060]);
  }
}

- (BOOL)feedbackFeatureEnabled
{
  char v2;
  NSObject *v3;

  if (feedbackFeatureEnabled_once_token != -1)
    dispatch_once(&feedbackFeatureEnabled_once_token, &__block_literal_global_175);
  if (feedbackFeatureEnabled_is_internal_install)
    v2 = objc_msgSend((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.keyboard")), "BOOLForKey:", CFSTR("feedbackFeatureEnabled"));
  else
    v2 = 0;
  if (IXACanLogMessageAtLevel())
  {
    v3 = IXADefaultLogFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[KSKeyboardController feedbackFeatureEnabled].cold.1(v2, v3);
  }
  return v2;
}

uint64_t __46__KSKeyboardController_feedbackFeatureEnabled__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  feedbackFeatureEnabled_is_internal_install = result;
  return result;
}

- (void)setPredictionPreferenceValue:(id)a3 forSpecifier:(id)a4
{
  void *v5;
  void *v6;

  if ((objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", *MEMORY[0x24BE75B50]), "isEqualToString:", CFSTR("KeyboardPrediction")) & 1) == 0)-[KSKeyboardController setPredictionPreferenceValue:forSpecifier:].cold.1();
  v5 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  objc_msgSend(v5, "setValue:forPreferenceKey:", a3, *MEMORY[0x24BEB50C8]);
  v6 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  objc_msgSend(v6, "setValue:forPreferenceKey:", a3, *MEMORY[0x24BEB50D0]);
}

- (void)setKeyboardAllowPaddlePreferenceValue:(id)a3 forSpecifier:(id)a4
{
  void *v5;

  if ((objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", *MEMORY[0x24BE75B50]), "isEqualToString:", CFSTR("KeyboardAllowPaddle")) & 1) == 0)-[KSKeyboardController setKeyboardAllowPaddlePreferenceValue:forSpecifier:].cold.1();
  v5 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  objc_msgSend(v5, "setValue:forPreferenceKey:", a3, *MEMORY[0x24BEB5050]);
}

- (void)setCheckSpellingPreferenceValue:(id)a3 forSpecifier:(id)a4
{
  void *v5;

  if ((objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", *MEMORY[0x24BE75B50]), "isEqualToString:", CFSTR("KeyboardCheckSpelling")) & 1) == 0)-[KSKeyboardController setCheckSpellingPreferenceValue:forSpecifier:].cold.1();
  v5 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  objc_msgSend(v5, "setValue:forPreferenceKey:", a3, *MEMORY[0x24BEB5078]);
}

- (id)readSmartTypingPreferenceValue:(id)a3
{
  void *v3;

  if ((objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75B50]), "isEqualToString:", CFSTR("SmartTyping")) & 1) == 0)-[KSKeyboardController readSmartTypingPreferenceValue:].cold.1();
  v3 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  return (id)objc_msgSend(v3, "valueForPreferenceKey:", *MEMORY[0x24BEB5118]);
}

- (void)setSmartTypingPreferenceValue:(id)a3 forSpecifier:(id)a4
{
  void *v5;
  void *v6;

  if ((objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", *MEMORY[0x24BE75B50]), "isEqualToString:", CFSTR("SmartTyping")) & 1) == 0)-[KSKeyboardController setSmartTypingPreferenceValue:forSpecifier:].cold.1();
  v5 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  objc_msgSend(v5, "setValue:forPreferenceKey:", a3, *MEMORY[0x24BEB5118]);
  v6 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  objc_msgSend(v6, "setValue:forPreferenceKey:", a3, *MEMORY[0x24BEB5108]);
}

+ (id)singleActiveDisabledDictationLanguage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id result;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController"), "activeDictationSupportedInputModeIdentifiers");
  if (objc_msgSend(v2, "count") == 1
    && (v3 = (void *)objc_msgSend(MEMORY[0x24BEB4D50], "sharedInputModeController"),
        (objc_opt_respondsToSelector() & 1) != 0))
  {
    v4 = (void *)objc_msgSend(v3, "defaultDictationLanguagesForKeyboardLanguage:", objc_msgSend(v2, "firstObject"));
    if (!v4)
    {
      v7[0] = objc_msgSend(v2, "firstObject");
      v4 = (void *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    }
  }
  else
  {
    v4 = v2;
  }
  if (objc_msgSend(v4, "count") == 1)
  {
    v5 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F8], "sharedPreferencesController"), "preferencesActions");
    result = (id)objc_msgSend((id)objc_msgSend(v5, "valueForPreferenceKey:", *MEMORY[0x24BEBE110]), "objectForKeyedSubscript:", objc_msgSend(v4, "firstObject"));
    if (!result)
      return result;
    if ((objc_msgSend(result, "BOOLValue") & 1) == 0)
      return (id)objc_msgSend(v4, "firstObject");
  }
  return 0;
}

- (id)dictationEnabled:(id)a3
{
  _BOOL8 v3;

  if (DictationIsEnabled())
    v3 = objc_msgSend((id)objc_opt_class(), "singleActiveDisabledDictationLanguage") == 0;
  else
    v3 = 0;
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
}

- (void)showDictationEnableDialogForSpecifier:(id)a3
{
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  objc_msgSend(a3, "setConfirmationAction:", sel_dictationEnabledConfirmed_);
  objc_msgSend(a3, "setConfirmationCancelAction:", sel_dictationEnabledCancelled_);
  v4 = AFDeviceHighestLanguageModelCapabilityIdentifier();
  v5 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  if (v4 == 10)
    v6 = CFSTR("DICTATION_ENABLE_PROMPT_ON_DEVICE_DICTATION_CAPABLE");
  else
    v6 = CFSTR("DICTATION_ENABLE_PROMPT");
  v7 = objc_msgSend(v5, "localizedStringForKey:value:table:", v6, &stru_25107A038, CFSTR("Keyboard"));
  v13 = (void *)MEMORY[0x24BDBCE70];
  v14 = v7;
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice"), "sf_isiPad"))
    v8 = CFSTR("DICTATION_ENABLE_TITLE_IPAD");
  else
    v8 = CFSTR("DICTATION_ENABLE_TITLE_IPHONE");
  v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", v8, &stru_25107A038, CFSTR("Keyboard"));
  v10 = *MEMORY[0x24BE75990];
  v11 = *MEMORY[0x24BE75988];
  v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("DICTATION_ENABLE_OK"), &stru_25107A038, CFSTR("Keyboard"));
  objc_msgSend(a3, "setupWithDictionary:", objc_msgSend(v13, "dictionaryWithObjectsAndKeys:", v9, v10, v14, v11, v12, *MEMORY[0x24BE75980], objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("DICTATION_ENABLE_CANCEL"), &stru_25107A038, CFSTR("Keyboard")), *MEMORY[0x24BE75970], 0));
  -[KSKeyboardController showConfirmationViewForSpecifier:useAlert:swapAlertButtons:](self, "showConfirmationViewForSpecifier:useAlert:swapAlertButtons:", a3, objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice"), "sf_isiPad"), 0);
}

- (void)showDictationDisabledDialogForSpecifier:(id)a3
{
  int v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences"), "assistantIsEnabled");
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance"), "isPaired");
  v5 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  if (v4)
    v6 = CFSTR("DICTATION_DISABLE_PROMPT_SIRI_ENABLED");
  else
    v6 = CFSTR("DICTATION_DISABLE_PROMPT_SIRI_DISABLED");
  v13 = objc_msgSend(v5, "localizedStringForKey:value:table:", v6, &stru_25107A038, CFSTR("Keyboard"));
  objc_msgSend(a3, "setConfirmationAction:", sel_dictationDisabledConfirmed_);
  objc_msgSend(a3, "setConfirmationCancelAction:", sel_dictationDisabledCancelled_);
  v12 = (void *)MEMORY[0x24BDBCE70];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice"), "sf_isiPad"))
    v7 = CFSTR("DICTATION_DISABLE_TITLE_IPAD");
  else
    v7 = CFSTR("DICTATION_DISABLE_TITLE_IPHONE");
  v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", v7, &stru_25107A038, CFSTR("Keyboard"));
  v9 = *MEMORY[0x24BE75990];
  v10 = *MEMORY[0x24BE75988];
  v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("DICTATION_DISABLE_OK"), &stru_25107A038, CFSTR("Keyboard"));
  objc_msgSend(a3, "setupWithDictionary:", objc_msgSend(v12, "dictionaryWithObjectsAndKeys:", v8, v9, v13, v10, v11, *MEMORY[0x24BE75980], objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("DICTATION_DISABLE_CANCEL"), &stru_25107A038, CFSTR("Keyboard")), *MEMORY[0x24BE75970], 0));
  -[KSKeyboardController showConfirmationViewForSpecifier:useAlert:swapAlertButtons:](self, "showConfirmationViewForSpecifier:useAlert:swapAlertButtons:", a3, objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice"), "sf_isiPad"), 0);
}

- (void)setDictationEnabled:(id)a3 forSpecifier:(id)a4
{
  if (objc_msgSend(a3, "BOOLValue"))
  {
    -[KSKeyboardController showDictationEnableDialogForSpecifier:](self, "showDictationEnableDialogForSpecifier:", a4);
  }
  else if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences"), "dictationIsEnabled") & 1) != 0)
  {
    -[KSKeyboardController showDictationDisabledDialogForSpecifier:](self, "showDictationDisabledDialogForSpecifier:", a4);
  }
  else
  {
    -[KSKeyboardController dictationDisabledConfirmed:](self, "dictationDisabledConfirmed:", a4);
  }
}

- (void)dictationEnabledConfirmed:(id)a3
{
  PSSpecifier *v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  PSSpecifier *v8;
  uint64_t v9;
  _QWORD v10[2];

  v3 = (PSSpecifier *)a3;
  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "setConfirmationAction:", 0);
  -[PSSpecifier setConfirmationCancelAction:](v3, "setConfirmationCancelAction:", 0);
  v5 = objc_msgSend((id)objc_opt_class(), "singleActiveDisabledDictationLanguage");
  if (v5)
  {
    v6 = v5;
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F8], "sharedPreferencesController"), "preferencesActions");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v7 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F8], "sharedPreferencesController"), "preferencesActions");
      v9 = v6;
      v10[0] = MEMORY[0x24BDBD1C8];
      objc_msgSend(v7, "setEnabledDictationLanguages:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1));
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F8], "sharedPreferencesController"), "preferencesActions"), "synchronizePreferences");
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences"), "setDictationIsEnabled:", 1);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences"), "synchronize");
  v8 = -[KSKeyboardController dictationAutoPunctuationSpecifier](self, "dictationAutoPunctuationSpecifier");
  if (v8)
    v3 = v8;
  if (-[KSKeyboardController dictationLanguageSpecifier](self, "dictationLanguageSpecifier"))
  {
    -[KSKeyboardController insertSpecifier:afterSpecifier:animated:](self, "insertSpecifier:afterSpecifier:animated:", -[KSKeyboardController dictationLanguageSpecifier](self, "dictationLanguageSpecifier"), v3, 1);
    v3 = -[KSKeyboardController dictationLanguageSpecifier](self, "dictationLanguageSpecifier");
  }
  if (-[KSKeyboardController dictationHardwareShortcutSpecifier](self, "dictationHardwareShortcutSpecifier"))
  {
    -[KSKeyboardController insertSpecifier:afterSpecifier:animated:](self, "insertSpecifier:afterSpecifier:animated:", -[KSKeyboardController dictationHardwareShortcutSpecifier](self, "dictationHardwareShortcutSpecifier"), v3, 1);
    -[KSKeyboardController dictationHardwareShortcutSpecifier](self, "dictationHardwareShortcutSpecifier");
  }
  -[KSKeyboardController reloadSpecifiers](self, "reloadSpecifiers");
}

- (void)dictationEnabledCancelled:(id)a3
{
  objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE759A0]), "setOn:animated:", 0, 1);
  objc_msgSend(a3, "setConfirmationAction:", 0);
  objc_msgSend(a3, "setConfirmationCancelAction:", 0);
}

- (void)dictationDisabledConfirmed:(id)a3
{
  objc_msgSend(a3, "setConfirmationAction:", 0);
  objc_msgSend(a3, "setConfirmationCancelAction:", 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences"), "setSuppressDictationOptIn:", 1);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences"), "setDictationIsEnabled:", 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences"), "synchronize");
  if (-[KSKeyboardController dictationLanguageSpecifier](self, "dictationLanguageSpecifier"))
    -[KSKeyboardController removeSpecifier:animated:](self, "removeSpecifier:animated:", -[KSKeyboardController dictationLanguageSpecifier](self, "dictationLanguageSpecifier"), 1);
  if (-[KSKeyboardController dictationHardwareShortcutSpecifier](self, "dictationHardwareShortcutSpecifier"))
    -[KSKeyboardController removeSpecifier:animated:](self, "removeSpecifier:animated:", -[KSKeyboardController dictationHardwareShortcutSpecifier](self, "dictationHardwareShortcutSpecifier"), 1);
  -[KSKeyboardController reloadSpecifiers](self, "reloadSpecifiers");
}

- (void)dictationDisabledCancelled:(id)a3
{
  objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE759A0]), "setOn:animated:", 1, 1);
  objc_msgSend(a3, "setConfirmationAction:", 0);
  objc_msgSend(a3, "setConfirmationCancelAction:", 0);
}

- (void)_dismissConfirmationSheet
{
  -[KSKeyboardController presentedViewController](self, "presentedViewController");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[KSKeyboardController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
  -[KSKeyboardController reloadSpecifierID:animated:](self, "reloadSpecifierID:animated:", CFSTR("Dictation"), 0);
}

- (void)presentPrivacySheet:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(MEMORY[0x24BE6E438], "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.siri"));
  objc_msgSend(v4, "setPresentingViewController:", self);
  objc_msgSend(v4, "present");
}

- (void)launchManageStorage:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace", a3);
  objc_msgSend(v3, "openSensitiveURL:withOptions:error:", objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=General&path=STORAGE_MGMT")), 0, 0);
}

- (id)shuangpinType:(id)a3
{
  void *v3;

  if ((objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75B50]), "isEqualToString:", CFSTR("ShuangpinType")) & 1) == 0)-[KSKeyboardController shuangpinType:].cold.1();
  v3 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  return (id)objc_msgSend(v3, "valueForPreferenceKey:", *MEMORY[0x24BEB5100]);
}

- (void)setShuangpinType:(id)a3 specifier:(id)a4
{
  void *v5;

  if ((objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", *MEMORY[0x24BE75B50]), "isEqualToString:", CFSTR("ShuangpinType")) & 1) == 0)-[KSKeyboardController setShuangpinType:specifier:].cold.1();
  v5 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  objc_msgSend(v5, "setValue:forPreferenceKey:", a3, *MEMORY[0x24BEB5100]);
  KSUpdateShuangpinSWLayout();
}

- (id)pinyinDialect:(id)a3
{
  void *v3;

  if ((objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75B50]), "isEqualToString:", CFSTR("PinyinDialect")) & 1) == 0)-[KSKeyboardController pinyinDialect:].cold.1();
  v3 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  return (id)objc_msgSend(v3, "valueForPreferenceKey:", *MEMORY[0x24BEB50E8]);
}

- (void)setPinyinDialect:(id)a3 specifier:(id)a4
{
  void *v5;
  __CFNotificationCenter *DarwinNotifyCenter;

  if ((objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", *MEMORY[0x24BE75B50]), "isEqualToString:", CFSTR("PinyinDialect")) & 1) == 0)-[KSKeyboardController setPinyinDialect:specifier:].cold.1();
  v5 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  objc_msgSend(v5, "setValue:forPreferenceKey:", a3, *MEMORY[0x24BEB50E8]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("AppleKeyboardsPreferencesChangedNotification"), 0, 0, 1u);
}

- (id)wubiStandard:(id)a3
{
  void *v3;

  if ((objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75B50]), "isEqualToString:", CFSTR("WubiStandard")) & 1) == 0)-[KSKeyboardController wubiStandard:].cold.1();
  v3 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  return (id)objc_msgSend(v3, "valueForPreferenceKey:", *MEMORY[0x24BEB5238]);
}

- (void)setWubiStandard:(id)a3 specifier:(id)a4
{
  void *v5;

  if ((objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", *MEMORY[0x24BE75B50]), "isEqualToString:", CFSTR("WubiStandard")) & 1) == 0)-[KSKeyboardController setWubiStandard:specifier:].cold.1();
  v5 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  objc_msgSend(v5, "setValue:forPreferenceKey:", a3, *MEMORY[0x24BEB5238]);
}

- (id)smartFullwidthSpace:(id)a3
{
  void *v3;

  if ((objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75B50]), "isEqualToString:", CFSTR("SmartFullwidthSpace")) & 1) == 0)-[KSKeyboardController smartFullwidthSpace:].cold.1();
  v3 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  return (id)objc_msgSend(v3, "valueForPreferenceKey:", *MEMORY[0x24BEB5110]);
}

- (void)setSmartFullwidthSpace:(id)a3 specifier:(id)a4
{
  void *v5;

  if ((objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", *MEMORY[0x24BE75B50]), "isEqualToString:", CFSTR("SmartFullwidthSpace")) & 1) == 0)-[KSKeyboardController setSmartFullwidthSpace:specifier:].cold.1();
  v5 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  objc_msgSend(v5, "setValue:forPreferenceKey:", a3, *MEMORY[0x24BEB5110]);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)KSKeyboardController;
  -[PSAppListController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if (self->_needsReloadSpecifiers)
    -[KSKeyboardController reloadSpecifiers](self, "reloadSpecifiers");
}

- (void)preferencesDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__KSKeyboardController_preferencesDidChange___block_invoke;
  block[3] = &unk_2510796F8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __45__KSKeyboardController_preferencesDidChange___block_invoke(uint64_t a1)
{
  uint64_t v1;
  dispatch_time_t v3;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 1401))
  {
    *(_BYTE *)(v1 + 1401) = 1;
    v3 = dispatch_time(0, 600000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __45__KSKeyboardController_preferencesDidChange___block_invoke_2;
    block[3] = &unk_2510796F8;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_after(v3, MEMORY[0x24BDAC9B8], block);
  }
}

uint64_t __45__KSKeyboardController_preferencesDidChange___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1401) = 0;
  return result;
}

- (void)managedKeyboardSettingsDidChange
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__KSKeyboardController_managedKeyboardSettingsDidChange__block_invoke;
  block[3] = &unk_2510796F8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __56__KSKeyboardController_managedKeyboardSettingsDidChange__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend((id)objc_msgSend(v2, "navigationController"), "topViewController");
  v4 = *(void **)(a1 + 32);
  if (v2 == (void *)v3)
    return objc_msgSend(v4, "reloadSpecifiers");
  objc_msgSend(v4, "setNeedsReloadSpecifiers:", 1);
  result = objc_msgSend((id)objc_msgSend((id)getMCProfileConnectionClass(), "sharedConnection"), "isKeyboardShortcutsAllowed");
  if ((result & 1) == 0)
  {
    result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "navigationController"), "viewControllers"), "containsObject:", *(_QWORD *)(a1 + 32));
    if ((_DWORD)result)
      return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "navigationController"), "popToViewController:animated:", *(_QWORD *)(a1 + 32), 1);
  }
  return result;
}

- (void)disableLockedDownPreferencesForGroup:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v4 = objc_msgSend(a3, "specifierForID:", CFSTR("KeyboardAutocorrection"));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
    if (objc_msgSend(v6, "isPreferenceKeyLockedDown:", *MEMORY[0x24BEB5060]))
      objc_msgSend(v5, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
  }
  v7 = objc_msgSend(a3, "specifierForID:", CFSTR("KeyboardPrediction"));
  if (v7)
  {
    v8 = (void *)v7;
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
    if (objc_msgSend(v9, "isPreferenceKeyLockedDown:", *MEMORY[0x24BEB50C8]))
      objc_msgSend(v8, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
    objc_msgSend(a3, "specifierForID:", CFSTR("KeyboardInlineCompletion"));
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
    if (objc_msgSend(v10, "isPreferenceKeyLockedDown:", *MEMORY[0x24BEB5090]))
      objc_msgSend(v8, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
  }
  else
  {
    objc_msgSend(a3, "specifierForID:", CFSTR("KeyboardInlineCompletion"));
  }
  v11 = objc_msgSend(a3, "specifierForID:", CFSTR("KeyboardCheckSpelling"));
  if (v11)
  {
    v12 = (void *)v11;
    v13 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
    if (objc_msgSend(v13, "isPreferenceKeyLockedDown:", *MEMORY[0x24BEB5078]))
      objc_msgSend(v12, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
  }
  v14 = objc_msgSend(a3, "specifierForID:", CFSTR("SmartTyping"));
  if (v14)
  {
    v15 = (void *)v14;
    v16 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
    if (objc_msgSend(v16, "isPreferenceKeyLockedDown:", *MEMORY[0x24BEB5118]))
      objc_msgSend(v15, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
  }
  v17 = objc_msgSend(a3, "specifierForID:", CFSTR("KeyboardContinuousPathEnabled"));
  if (v17)
  {
    v18 = (void *)v17;
    v19 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
    if (objc_msgSend(v19, "isPreferenceKeyLockedDown:", *MEMORY[0x24BEB5088]))
      objc_msgSend(v18, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
  }
}

- (void)moveCharacterPreviewPreferenceToEndForGroup:(id)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend(a3, "specifierForID:", CFSTR("KeyboardAllowPaddle"));
  if (v4)
  {
    v5 = v4;
    if (objc_msgSend(a3, "specifierForID:", CFSTR("KEYBOARD_TITLE")))
    {
      objc_msgSend(a3, "removeObject:", v5);
      objc_msgSend(a3, "addObject:", v5);
    }
  }
}

- (void)movePeriodShortcutPreferenceToEndAndAddFooterTextForGroup:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  -[KSKeyboardController moveCharacterPreviewPreferenceToEndForGroup:](self, "moveCharacterPreviewPreferenceToEndForGroup:");
  v4 = objc_msgSend(a3, "specifierForID:", CFSTR("KeyboardPeriodShortcut"));
  if (v4)
  {
    v5 = v4;
    v6 = (void *)objc_msgSend(a3, "specifierForID:", CFSTR("KEYBOARD_TITLE"));
    if (v6)
    {
      objc_msgSend(v6, "setProperty:forKey:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("PERIOD_SHORTCUT_DESCRIPTION"), &stru_25107A038, CFSTR("Keyboard")), *MEMORY[0x24BE75A68]);
      objc_msgSend(a3, "removeObject:", v5);
      objc_msgSend(a3, "addObject:", v5);
    }
  }
}

- (void)removeShuangpinPreferenceIfNotApplicableForGroup:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController", 0, 0), "enabledInputModeIdentifiers");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v7)
        objc_enumerationMutation(v4);
      if ((objc_msgSend((id)TIInputModeGetVariant(), "isEqualToString:", CFSTR("Shuangpin")) & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v9 = objc_msgSend(a3, "specifierForID:", CFSTR("ShuangpinType"));
    if (v9)
      objc_msgSend(a3, "removeObject:", v9);
  }
}

- (void)removeDialectPreferenceIfNotApplicableForGroup:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
  v4 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController", 0), "enabledInputModeIdentifiers");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(v4);
      v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
      if (objc_msgSend((id)TIInputModeGetVariant(), "isEqualToString:", CFSTR("Pinyin")))
      {
        if ((objc_msgSend((id)MEMORY[0x24267F1D8](v9), "isEqualToString:", CFSTR("Hans")) & 1) != 0)
          break;
      }
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v10 = objc_msgSend(a3, "specifierForID:", CFSTR("PinyinDialect"));
    if (v10)
      objc_msgSend(a3, "removeObject:", v10);
  }
}

- (void)addFooterTextForDialectSpecifierForGroup:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_msgSend(a3, "specifierForID:", CFSTR("PinyinDialect"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    objc_msgSend(v4, "setProperty:forKey:", objc_msgSend(v5, "localizedStringForKey:value:table:", SFLocalizableWAPIStringKeyForKey(), &stru_25107A038, CFSTR("Preferences_pinyin")), *MEMORY[0x24BE75CD0]);
  }
}

- (void)moveSpaceConfirmationPreferenceToEndAndAddFooterTextForGroup:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = (void *)objc_msgSend(a3, "specifierForID:", CFSTR("KEYBOARD_TITLE"));
  if (v4)
  {
    v5 = v4;
    v6 = *MEMORY[0x24BE75A68];
    if (!objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75A68]))
    {
      v7 = objc_msgSend(a3, "specifierForID:", CFSTR("SpaceConfirmation"));
      if (v7)
      {
        v8 = v7;
        objc_msgSend(v5, "setProperty:forKey:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("SPACE_CONFIRMATION_EXPLANATION"), &stru_25107A038, CFSTR("Keyboard")), v6);
        objc_msgSend(a3, "removeObject:", v8);
        objc_msgSend(a3, "addObject:", v8);
      }
    }
  }
}

- (void)moveEnableDictationPreferenceToEndAndAddFooterTextForGroup:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v5 = objc_msgSend(a3, "specifierForID:", CFSTR("Dictation"));
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(a3, "specifierForID:", CFSTR("KEYBOARD_TITLE"));
    if (v7)
    {
      v8 = (void *)v7;
      v9 = objc_msgSend(a3, "specifierForID:", CFSTR("KeyboardPeriodShortcut"));
      if (v9 | objc_msgSend(a3, "specifierForID:", CFSTR("SpaceConfirmation")))
      {
        if (objc_msgSend(v8, "name"))
          v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("DICTATION_GROUP_TITLE"), &stru_25107A038, CFSTR("Keyboard"));
        else
          v10 = 0;
        v8 = (void *)objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:name:", CFSTR("DICTATION_GROUP_TITLE"), v10);
        objc_msgSend(a3, "addObject:", v8);
      }
      objc_msgSend(a3, "removeObject:", v6);
      objc_msgSend(a3, "addObject:", v6);
      objc_msgSend(v8, "setTarget:", self);
      objc_msgSend(v8, "setProperty:forKey:", CFSTR("DictationFooterView"), *MEMORY[0x24BE75A30]);
    }
  }
}

+ (void)localizeAndSortPreferencesArray:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(a3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7), "setName:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7), "name"), &stru_25107A038, CFSTR("Keyboard")));
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_270);
}

uint64_t __56__KSKeyboardController_localizeAndSortPreferencesArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  return objc_msgSend((id)objc_msgSend(a2, "name"), "localizedStandardCompare:", objc_msgSend(a3, "name"));
}

+ (id)localizedDisplayNameForInputMode:(id)a3 forDictation:(BOOL)a4
{
  void *v5;
  void *NormalizedIdentifier;
  void *v7;

  if (a4)
  {
    v5 = (void *)TUIDictationTitle();
    if (objc_msgSend(v5, "length") && !objc_msgSend(v5, "isEqualToString:", a3))
      return v5;
  }
  else
  {
    v5 = 0;
  }
  if (objc_msgSend((id)TIInputModeGetVariant(), "length"))
    v5 = (void *)TUIKeyboardTitle();
  NormalizedIdentifier = (void *)TIInputModeGetNormalizedIdentifier();
  if (!objc_msgSend(v5, "length"))
    v5 = (void *)TUIKeyboardTitle();
  if (!objc_msgSend(v5, "length") || objc_msgSend(NormalizedIdentifier, "isEqualToString:", v5))
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v5 = (void *)objc_msgSend(v7, "displayNameForKey:value:", *MEMORY[0x24BDBCB20], TIInputModeGetLanguageWithRegion());
  }
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController"), "identifierIsValidSystemInputMode:", NormalizedIdentifier)&& !objc_msgSend(v5, "length"))
  {
    +[KSKeyboardController localizedDisplayNameForInputMode:forDictation:].cold.1();
  }
  return v5;
}

+ (int64_t)compareUsingOrderInArray:(id)a3 withFirst:(id)a4 second:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    v11 = 1;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(a3);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v13, "isEqualToString:", a4)
          && !objc_msgSend(v13, "isEqualToString:", a5))
        {
          return -1;
        }
        if (objc_msgSend(v13, "isEqualToString:", a5)
          && !objc_msgSend(v13, "isEqualToString:", a4))
        {
          return v11;
        }
        if (objc_msgSend(v13, "isEqualToString:", a4)
          && (objc_msgSend(v13, "isEqualToString:", a5) & 1) != 0)
        {
          return 0;
        }
      }
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
  return objc_msgSend(a4, "localizedStandardCompare:", a5);
}

- (void)loadPreferenceForInputModeIdentifier:(id)a3 keyboardInputMode:(id)a4 addNewPreferencesToArray:(id)a5 defaultPreferenceIdentifiers:(id)a6 additionalPreferenceIdentifiers:(id)a7 mapPreferenceToInputMode:(id)a8
{
  void *v13;
  void *v14;
  int v15;
  int v16;
  int v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t j;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  char obj;
  id obja;
  int v38;
  uint64_t v39;
  int v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  _QWORD v59[3];

  v59[1] = *MEMORY[0x24BDAC8D0];
  v13 = (void *)TIGetInputModeProperties();
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice"), "sf_isiPad")
    || (v14 = (void *)objc_msgSend(v13, "objectForKey:", CFSTR("Preferences-iPad"))) == 0)
  {
    v14 = (void *)objc_msgSend(v13, "objectForKey:", CFSTR("Preferences"));
  }
  v55 = 0;
  if ((AFDictationRestricted() & 1) != 0)
    v15 = 0;
  else
    v15 = objc_msgSend(MEMORY[0x24BE091B8], "dictationIsSupportedForLanguageCode:error:", objc_msgSend(a4, "languageWithRegion"), &v55);
  v59[0] = a3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 1);
  v16 = UIKeyboardPredictionEnabledForInputModes();
  if (v13)
  {
    v38 = objc_msgSend((id)objc_msgSend(v13, "objectForKey:", CFSTR("UIKeyboardInlineCompletion")), "BOOLValue") ^ 1;
    obj = UIKeyboardDeviceSupportsSplit();
    v17 = objc_msgSend((id)objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BEB5000]), "BOOLValue") ^ 1;
    v41 = objc_msgSend((id)objc_msgSend(v13, "objectForKey:", CFSTR("KeyboardCPAllowsDeleteWord")), "BOOLValue");
  }
  else
  {
    v17 = 1;
    obj = UIKeyboardDeviceSupportsSplit();
    v41 = 0;
    v38 = 1;
  }
  v33 = a3;
  if (v14)
  {
    v18 = (id)objc_msgSend(v14, "mutableCopy");
    if (UIKeyboardCheckSpellingPossibleForInputMode())
    {
      objc_msgSend(v18, "addObject:", CFSTR("KeyboardCheckSpelling"));
      if (!v15)
      {
LABEL_13:
        if (!v16)
        {
LABEL_21:
          if ((v17 & 1) == 0)
          {
            objc_msgSend(v18, "addObject:", CFSTR("KeyboardContinuousPathEnabled"));
            if (v41)
              objc_msgSend(v18, "addObject:", CFSTR("KeyboardContinuousPathDeleteWholeWord"));
          }
          if (UIKeyboardDeviceSupportsSplit())
            objc_msgSend(v18, "addObject:", CFSTR("RivenKeyboard"));
          objc_msgSend(v18, "addObject:", CFSTR("KeyboardAssistant"), v33);
          objc_msgSend(v18, "addObject:", CFSTR("KeyboardAllowPaddle"));
          objc_msgSend(v18, "addObject:", CFSTR("GesturesEnabled"));
          goto LABEL_27;
        }
LABEL_19:
        objc_msgSend(v18, "addObject:", CFSTR("KeyboardPrediction"), v33);
        if ((v38 & 1) == 0)
          objc_msgSend(v18, "addObject:", CFSTR("KeyboardInlineCompletion"));
        goto LABEL_21;
      }
    }
    else if (!v15)
    {
      goto LABEL_13;
    }
    objc_msgSend(v18, "addObject:", CFSTR("Dictation"), a3);
    if (!v16)
      goto LABEL_21;
    goto LABEL_19;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("emoji")))
  {
    v18 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    goto LABEL_27;
  }
  v18 = (id)objc_msgSend(a6, "mutableCopy");
  if ((UIKeyboardCheckSpellingPossibleForInputMode() & 1) != 0)
  {
    if ((v15 & 1) != 0)
      goto LABEL_55;
  }
  else
  {
    objc_msgSend(v18, "removeObject:", CFSTR("KeyboardCheckSpelling"));
    if ((v15 & 1) != 0)
    {
LABEL_55:
      if ((v16 & 1) != 0)
        goto LABEL_56;
      goto LABEL_60;
    }
  }
  objc_msgSend(v18, "removeObject:", CFSTR("Dictation"), a3);
  if ((v16 & 1) != 0)
  {
LABEL_56:
    if (!v38)
      goto LABEL_62;
    goto LABEL_61;
  }
LABEL_60:
  objc_msgSend(v18, "removeObject:", CFSTR("KeyboardPrediction"), v33);
LABEL_61:
  objc_msgSend(v18, "removeObject:", CFSTR("KeyboardInlineCompletion"), v33);
LABEL_62:
  if ((obj & 1) == 0)
    objc_msgSend(v18, "removeObject:", CFSTR("RivenKeyboard"));
  if (v17)
  {
    objc_msgSend(v18, "removeObject:", CFSTR("KeyboardContinuousPathEnabled"));
  }
  else if (v41)
  {
    goto LABEL_27;
  }
  objc_msgSend(v18, "removeObject:", CFSTR("KeyboardContinuousPathDeleteWholeWord"), v33);
LABEL_27:
  v19 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array", v33);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v52 != v22)
          objc_enumerationMutation(v18);
        v24 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        if (objc_msgSend(v24, "hasPrefix:", CFSTR("!")))
        {
          objc_msgSend(v19, "addObject:", v24);
          objc_msgSend(v19, "addObject:", objc_msgSend(v24, "substringFromIndex:", 1));
        }
      }
      v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
    }
    while (v21);
  }
  objc_msgSend(v18, "removeObjectsInArray:", v19);
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  obja = (id)objc_msgSend(v13, "objectForKey:", CFSTR("AdditionalPreferencesPlist"));
  v42 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
  if (v42)
  {
    v39 = *(_QWORD *)v48;
    do
    {
      for (j = 0; j != v42; ++j)
      {
        if (*(_QWORD *)v48 != v39)
          objc_enumerationMutation(obja);
        v26 = (void *)-[KSKeyboardController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j), self);
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v44;
          do
          {
            for (k = 0; k != v28; ++k)
            {
              if (*(_QWORD *)v44 != v29)
                objc_enumerationMutation(v26);
              v31 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * k);
              v32 = objc_msgSend(v31, "identifier");
              objc_msgSend(v18, "addObject:", v32);
              if ((objc_msgSend(a7, "containsObject:", v32) & 1) == 0)
              {
                objc_msgSend(a5, "addObject:", v31);
                objc_msgSend(a7, "addObject:", v32);
              }
            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
          }
          while (v28);
        }
      }
      v42 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
    }
    while (v42);
  }
  objc_msgSend(a8, "setObject:forKey:", v18, v34);
}

- (id)mergePreferences:(id)a3 inputModesToPreferences:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __65__KSKeyboardController_mergePreferences_inputModesToPreferences___block_invoke;
  v22[3] = &unk_251079760;
  v22[4] = a3;
  v6 = (void *)objc_msgSend(a3, "indexesOfObjectsPassingTest:", v22);
  if (!objc_msgSend(v6, "count"))
    return a3;
  v7 = (id)objc_msgSend(a3, "mutableCopy");
  v8 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_msgSend(a3, "objectsAtIndexes:", v6);
  v10 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "addObjectsFromArray:", v15);
        objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(a4, "objectForKey:", v15));
      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v12);
  }
  objc_msgSend(a4, "removeObjectsForKeys:", v9);
  objc_msgSend(v7, "removeObjectsAtIndexes:", v6);
  v16 = objc_msgSend(v10, "allObjects");
  objc_msgSend(v7, "insertObject:atIndex:", v16, 0);
  objc_msgSend(a4, "setObject:forKey:", v8, v16);
  return v7;
}

uint64_t __65__KSKeyboardController_mergePreferences_inputModesToPreferences___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v7;
  int v8;
  unint64_t i;

  if ((unint64_t)objc_msgSend(a2, "count") > 3)
    return 1;
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", a2);
  v8 = objc_msgSend(v7, "isEqualToSet:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251083768));
  if ((v8 & 1) != 0)
    return v8 ^ 1u;
  for (i = a3 + 1; i < objc_msgSend(*(id *)(a1 + 32), "count"); ++i)
  {
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", i)), "intersectsSet:", v7))return v8 ^ 1u;
  }
  return 0;
}

- (id)addAllPreferencesToArray:(id)a3 mapPreferenceToInputMode:(id)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t Variant;
  uint64_t v16;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v16 = objc_msgSend(a3, "valueForKey:", CFSTR("identifier"));
  v4 = objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v6 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController"), "activeInputModes");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "normalizedIdentifier");
        Variant = TIInputModeGetVariant();
        if (!Variant)
          Variant = TIInputModeGetBaseLanguage();
        if (!objc_msgSend(v5, "member:", Variant))
        {
          objc_msgSend(v5, "addObject:", Variant);
          objc_msgSend(v6, "addObject:", v13);
          -[KSKeyboardController loadPreferenceForInputModeIdentifier:keyboardInputMode:addNewPreferencesToArray:defaultPreferenceIdentifiers:additionalPreferenceIdentifiers:mapPreferenceToInputMode:](self, "loadPreferenceForInputModeIdentifier:keyboardInputMode:addNewPreferencesToArray:defaultPreferenceIdentifiers:additionalPreferenceIdentifiers:mapPreferenceToInputMode:", v13, v12, a3, v16, v4, a4);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }
  return v6;
}

- (id)groupPreferences:(id)a3 forMapping:(id)a4 inputModes:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  _QWORD v27[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(a3);
        v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "identifier");
        v32[0] = MEMORY[0x24BDAC760];
        v32[1] = 3221225472;
        v32[2] = __63__KSKeyboardController_groupPreferences_forMapping_inputModes___block_invoke;
        v32[3] = &unk_251079788;
        v32[4] = v13;
        v14 = (void *)objc_msgSend(a4, "keysOfEntriesPassingTest:", v32);
        if (objc_msgSend(v14, "count"))
        {
          v15 = (void *)objc_msgSend(v7, "objectForKeyedSubscript:", v14);
          if (!v15)
          {
            v15 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            objc_msgSend(v7, "setObject:forKey:", v15, v14);
          }
          objc_msgSend(v15, "addObject:", v12);
        }
      }
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v9);
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v16 = (void *)objc_msgSend(v7, "allKeys");
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
        v22 = (void *)objc_msgSend(v21, "allObjects");
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __63__KSKeyboardController_groupPreferences_forMapping_inputModes___block_invoke_2;
        v27[3] = &unk_2510797B0;
        v27[4] = a5;
        v23 = objc_msgSend(v22, "sortedArrayUsingComparator:", v27);
        v24 = (id)objc_msgSend(v7, "objectForKey:", v21);
        objc_msgSend(v7, "removeObjectForKey:", v21);
        objc_msgSend(v7, "setObject:forKey:", v24, v23);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v18);
  }
  return v7;
}

uint64_t __63__KSKeyboardController_groupPreferences_forMapping_inputModes___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "containsObject:", *(_QWORD *)(a1 + 32));
}

int64_t __63__KSKeyboardController_groupPreferences_forMapping_inputModes___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[KSKeyboardController compareUsingOrderInArray:withFirst:second:](KSKeyboardController, "compareUsingOrderInArray:withFirst:second:", *(_QWORD *)(a1 + 32), a2, a3);
}

- (id)sortPreferencesKeysByInputModeOrderAndCount:(id)a3 inputModes:(id)a4
{
  void *v5;
  _QWORD v7[5];

  v5 = (void *)objc_msgSend(a3, "allKeys");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __79__KSKeyboardController_sortPreferencesKeysByInputModeOrderAndCount_inputModes___block_invoke;
  v7[3] = &unk_2510797D8;
  v7[4] = a4;
  return (id)objc_msgSend(v5, "sortedArrayUsingComparator:", v7);
}

int64_t __79__KSKeyboardController_sortPreferencesKeysByInputModeOrderAndCount_inputModes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v6;
  unint64_t v7;
  int64_t result;
  unint64_t v9;

  v6 = objc_msgSend(a2, "count");
  v7 = objc_msgSend(a3, "count");
  if (v6 > v7)
    return -1;
  if (v6 < v7)
    return 1;
  v9 = v7;
  result = 0;
  if (v6)
  {
    if (v6 == v9)
      return +[KSKeyboardController compareUsingOrderInArray:withFirst:second:](KSKeyboardController, "compareUsingOrderInArray:withFirst:second:", *(_QWORD *)(a1 + 32), objc_msgSend(a2, "objectAtIndex:", 0), objc_msgSend(a3, "objectAtIndex:", 0));
  }
  return result;
}

+ (id)localizedListForInputModes:(id)a3 forDictation:(BOOL)a4 duplicatedBaseLanguages:(id)a5
{
  _BOOL8 v6;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v6 = a4;
  v21 = *MEMORY[0x24BDAC8D0];
  v8 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(a3);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12);
        if ((objc_msgSend(a5, "containsObject:", TIInputModeGetBaseLanguage())
           && (v14 = (id)TUIKeyboardDisplayNameFromIdentifier()) != 0
           || (v14 = +[KSKeyboardController localizedDisplayNameForInputMode:forDictation:](KSKeyboardController, "localizedDisplayNameForInputMode:forDictation:", v13, v6)) != 0)&& (objc_msgSend(v8, "containsObject:", v14) & 1) == 0)
        {
          objc_msgSend(v8, "addObject:", v14);
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }
  return (id)objc_msgSend(MEMORY[0x24BDD1640], "localizedStringByJoiningStrings:", v8);
}

- (id)loadAllKeyboardPreferences
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  id obj;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = -[KSKeyboardController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", CFSTR("Preferences_base"), self);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = -[KSKeyboardController addAllPreferencesToArray:mapPreferenceToInputMode:](self, "addAllPreferencesToArray:mapPreferenceToInputMode:", v4, v5);
  v7 = -[KSKeyboardController groupPreferences:forMapping:inputModes:](self, "groupPreferences:forMapping:inputModes:", v4, v5, v6);
  if (!objc_msgSend((id)objc_msgSend(v7, "allKeys"), "count"))
    return 0;
  v8 = -[KSKeyboardController sortPreferencesKeysByInputModeOrderAndCount:inputModes:](self, "sortPreferencesKeysByInputModeOrderAndCount:inputModes:", v7, v6);
  if (!objc_msgSend(v8, "count"))
    -[KSKeyboardController loadAllKeyboardPreferences].cold.1();
  v9 = -[KSKeyboardController mergePreferences:inputModesToPreferences:](self, "mergePreferences:inputModesToPreferences:", v8, v7);
  if (!objc_msgSend(v9, "count"))
    -[KSKeyboardController loadAllKeyboardPreferences].cold.2();
  v24 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v22 = objc_msgSend(v8, "count");
  v21 = objc_msgSend(v9, "count");
  v10 = objc_msgSend(v6, "count");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v26;
    obj = v9;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v17 = (void *)objc_msgSend(v7, "objectForKey:", v16);
        if (!objc_msgSend(v17, "count"))
          -[KSKeyboardController loadAllKeyboardPreferences].cold.3();
        if (v10 >= 2)
        {
          if ((v13 & 1) != 0)
          {
            v18 = +[KSKeyboardController localizedListForInputModes:forDictation:duplicatedBaseLanguages:](KSKeyboardController, "localizedListForInputModes:forDictation:duplicatedBaseLanguages:", v16, 0, 0);
            goto LABEL_17;
          }
          if (v22 == v21)
          {
            v18 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("All Keyboards"), &stru_25107A038, CFSTR("Keyboard"));
LABEL_17:
            v19 = v18;
          }
          else
          {
            v19 = 0;
          }
          v13 = 1;
          goto LABEL_20;
        }
        v19 = 0;
LABEL_20:
        +[KSKeyboardController localizeAndSortPreferencesArray:](KSKeyboardController, "localizeAndSortPreferencesArray:", v17);
        objc_msgSend(v17, "insertObject:atIndex:", objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:name:", CFSTR("KEYBOARD_TITLE"), v19), 0);
        if (objc_msgSend(v16, "count") == 1)
        {
          objc_msgSend(v16, "firstObject");
          if (objc_msgSend((id)TIInputModeGetVariant(), "isEqualToString:", CFSTR("Pinyin")))
          {
            -[KSKeyboardController removeShuangpinPreferenceIfNotApplicableForGroup:](self, "removeShuangpinPreferenceIfNotApplicableForGroup:", v17);
            -[KSKeyboardController removeDialectPreferenceIfNotApplicableForGroup:](self, "removeDialectPreferenceIfNotApplicableForGroup:", v17);
            -[KSKeyboardController moveSpaceConfirmationPreferenceToEndAndAddFooterTextForGroup:](self, "moveSpaceConfirmationPreferenceToEndAndAddFooterTextForGroup:", v17);
          }
        }
        -[KSKeyboardController addFooterTextForDialectSpecifierForGroup:](self, "addFooterTextForDialectSpecifierForGroup:", v17);
        -[KSKeyboardController disableLockedDownPreferencesForGroup:](self, "disableLockedDownPreferencesForGroup:", v17);
        -[KSKeyboardController movePeriodShortcutPreferenceToEndAndAddFooterTextForGroup:](self, "movePeriodShortcutPreferenceToEndAndAddFooterTextForGroup:", v17);
        -[KSKeyboardController moveEnableDictationPreferenceToEndAndAddFooterTextForGroup:](self, "moveEnableDictationPreferenceToEndAndAddFooterTextForGroup:", v17);
        objc_msgSend(v24, "addObjectsFromArray:", v17);
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v12);
  }
  return v24;
}

- (void)addHardwareKeyboardAndShortcuts:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v5 = objc_msgSend(a3, "specifierForID:", CFSTR("KEYBOARDS"));
  if (v5 && GSEventIsHardwareKeyboardAttached())
    objc_msgSend(a3, "ps_insertObject:afterObject:", -[KSKeyboardController hardwareKeyboardSpecifier](self, "hardwareKeyboardSpecifier"), v5);
  v6 = objc_msgSend(a3, "specifierForID:", CFSTR("Hardware Keyboard"));
  v7 = -[KSKeyboardController openShortcutsSpecifiers](self, "openShortcutsSpecifiers");
  if (v6)
    v8 = v6;
  else
    v8 = v5;
  objc_msgSend(a3, "ps_insertObjectsFromArray:afterObject:", v7, v8);
  v9 = -[NSArray lastObject](v7, "lastObject");
  if (v9)
    v5 = v9;
  if (-[KSKeyboardController _supportsReachableKeyboard](self, "_supportsReachableKeyboard"))
  {
    v10 = -[KSKeyboardController reachableKeyboardSpecifier](self, "reachableKeyboardSpecifier");
    objc_msgSend(a3, "ps_insertObject:afterObject:", v10, v5);
    v5 = (uint64_t)v10;
  }
  if (-[KSKeyboardController _supportsProKeyboard](self, "_supportsProKeyboard"))
    objc_msgSend(a3, "ps_insertObject:afterObject:", -[KSKeyboardController proKeyboardSpecifier](self, "proKeyboardSpecifier"), v5);
}

- (void)addDictationItems:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  PSSpecifier *v10;
  PSSpecifier *v11;
  PSSpecifier *v12;
  PSSpecifier *v13;
  id v14;
  PSSpecifier *v15;
  PSSpecifier *v16;
  PSSpecifier *v17;

  v5 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController"), "activeDictationSupportedInputModeIdentifiers");
  v6 = objc_msgSend(a3, "specifierForID:", CFSTR("Dictation"));
  if (objc_msgSend(v5, "count") == 1)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB4D50], "sharedInputModeController");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (void *)objc_msgSend(v7, "defaultDictationLanguagesForKeyboardLanguage:", objc_msgSend(v5, "firstObject"));
  }
  if ((unint64_t)objc_msgSend(v5, "count") < 2)
  {
    -[KSKeyboardController setDictationLanguageSpecifier:](self, "setDictationLanguageSpecifier:", 0);
  }
  else
  {
    v8 = (void *)MEMORY[0x24BE75590];
    v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("Dictation Languages"), &stru_25107A038, CFSTR("Dictation"));
    -[KSKeyboardController setDictationLanguageSpecifier:](self, "setDictationLanguageSpecifier:", objc_msgSend(v8, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, 0, 0, 0, objc_opt_class(), 1, 0));
    v10 = -[KSKeyboardController dictationLanguageSpecifier](self, "dictationLanguageSpecifier");
    -[PSSpecifier setProperty:forKey:](v10, "setProperty:forKey:", CFSTR("DictationSettings"), *MEMORY[0x24BE75AC0]);
    if (v6 && DictationIsEnabled())
      objc_msgSend(a3, "ps_insertObject:afterObject:", -[KSKeyboardController dictationLanguageSpecifier](self, "dictationLanguageSpecifier"), v6);
  }
  if (_os_feature_enabled_impl())
  {
    -[KSKeyboardController setDictationAutoPunctuationSpecifier:](self, "setDictationAutoPunctuationSpecifier:", objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("Auto-Punctuation"), &stru_25107A038, CFSTR("Dictation")), self, sel_setAutoPunctuation_specifier_, sel_autoPunctuation_, 0, 6, 0));
    v11 = -[KSKeyboardController dictationAutoPunctuationSpecifier](self, "dictationAutoPunctuationSpecifier");
    -[PSSpecifier setProperty:forKey:](v11, "setProperty:forKey:", CFSTR("AutoPunctuationSetting"), *MEMORY[0x24BE75AC0]);
    if (+[DictationFooterView dictationAutoPunctuationText](DictationFooterView, "dictationAutoPunctuationText"))
    {
      objc_msgSend(a3, "ps_insertObject:afterObject:", -[KSKeyboardController dictationAutoPunctuationSpecifier](self, "dictationAutoPunctuationSpecifier"), v6);
    }
  }
  if (v6 && DictationIsEnabled() && GSEventIsHardwareKeyboardAttached())
  {
    -[KSKeyboardController setDictationHardwareShortcutSpecifier:](self, "setDictationHardwareShortcutSpecifier:", -[KSKeyboardController dictationHWShortcutSpecifier](self, "dictationHWShortcutSpecifier"));
    if (-[KSKeyboardController dictationLanguageSpecifier](self, "dictationLanguageSpecifier"))
    {
      v12 = -[KSKeyboardController dictationHardwareShortcutSpecifier](self, "dictationHardwareShortcutSpecifier");
      v13 = -[KSKeyboardController dictationLanguageSpecifier](self, "dictationLanguageSpecifier");
      v14 = a3;
      v15 = v12;
    }
    else
    {
      v16 = -[KSKeyboardController dictationAutoPunctuationSpecifier](self, "dictationAutoPunctuationSpecifier");
      v17 = -[KSKeyboardController dictationHardwareShortcutSpecifier](self, "dictationHardwareShortcutSpecifier");
      if (v16)
      {
        v13 = -[KSKeyboardController dictationAutoPunctuationSpecifier](self, "dictationAutoPunctuationSpecifier");
        v14 = a3;
        v15 = v17;
      }
      else
      {
        v14 = a3;
        v15 = v17;
        v13 = (PSSpecifier *)v6;
      }
    }
    objc_msgSend(v14, "ps_insertObject:afterObject:", v15, v13);
  }
}

- (id)specifiers
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (int)*MEMORY[0x24BE756E0];
  if (!*(Class *)((char *)&self->super.super.super.super.super.super.isa + v3))
  {
    v4 = -[KSKeyboardController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", CFSTR("Preferences"), self);
    if (v4)
    {
      v5 = (void *)v4;
      v6 = -[KSKeyboardController loadAllKeyboardPreferences](self, "loadAllKeyboardPreferences");
      if (v6)
        objc_msgSend(v5, "addObjectsFromArray:", v6);
      if ((MGGetBoolAnswer() & 1) == 0
        && !CFPreferencesGetAppBooleanValue(CFSTR("force-international"), CFSTR("com.apple.keyboard.preferences"), 0))
      {
        objc_msgSend(v5, "removeObject:", objc_msgSend(v5, "specifierForID:", CFSTR("KEYBOARDS")));
      }
      -[KSKeyboardController addHardwareKeyboardAndShortcuts:](self, "addHardwareKeyboardAndShortcuts:", v5);
      -[KSKeyboardController addEnabledExtensionSpecifiersToArray:](self, "addEnabledExtensionSpecifiersToArray:", v5);
      -[KSKeyboardController addFooterTextForStickers:](self, "addFooterTextForStickers:", v5);
      -[KSKeyboardController addDictationItems:](self, "addDictationItems:", v5);
      -[KSKeyboardController setDeleteWordSpecifier:](self, "setDeleteWordSpecifier:", objc_msgSend(v5, "specifierForID:", CFSTR("KeyboardContinuousPathDeleteWholeWord")));
      v7 = objc_msgSend(v5, "specifierForID:", CFSTR("KeyboardContinuousPathEnabled"));
      if (!v7
        || (objc_msgSend(-[KSKeyboardController readCPPreferenceValue:](self, "readCPPreferenceValue:", v7), "BOOLValue") & 1) == 0)
      {
        -[KSKeyboardController setDeleteWordSpecifierIndex:](self, "setDeleteWordSpecifierIndex:", objc_msgSend(v5, "indexOfObject:", -[KSKeyboardController deleteWordSpecifier](self, "deleteWordSpecifier")));
        objc_msgSend(v5, "removeObject:", -[KSKeyboardController deleteWordSpecifier](self, "deleteWordSpecifier"));
      }
      -[KSKeyboardController setInlineCompletionSpecifier:](self, "setInlineCompletionSpecifier:", objc_msgSend(v5, "specifierForID:", CFSTR("KeyboardInlineCompletion")));
      v8 = objc_msgSend(v5, "specifierForID:", CFSTR("KeyboardPrediction"));
      if (!v8
        || (objc_msgSend(-[KSKeyboardController readPredictionPreferenceValue:](self, "readPredictionPreferenceValue:", v8), "BOOLValue") & 1) == 0)
      {
        -[KSKeyboardController setInlineCompletionSpecifierIndex:](self, "setInlineCompletionSpecifierIndex:", objc_msgSend(v5, "indexOfObject:", -[KSKeyboardController inlineCompletionSpecifier](self, "inlineCompletionSpecifier")));
        objc_msgSend(v5, "removeObject:", -[KSKeyboardController inlineCompletionSpecifier](self, "inlineCompletionSpecifier"));
      }
      *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;
      -[KSKeyboardController setTitle:](self, "setTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("KEYBOARDS"), &stru_25107A038, CFSTR("Keyboard")));
      -[KSKeyboardController setSpecifierID:](self, "setSpecifierID:", CFSTR("Keyboard"));
      self->_needsReloadSpecifiers = 0;
    }
  }
  return *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
}

- (void)addFooterTextForStickers:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = objc_msgSend(a3, "specifierForID:", CFSTR("ShowStickers"));
  v5 = objc_msgSend(a3, "indexOfSpecifierWithID:", CFSTR("ShowStickers"));
  if (v4 && v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v5)
    {
      v6 = objc_msgSend(a3, "objectAtIndex:", v5 - 1);
      v7 = (void *)objc_msgSend(MEMORY[0x24BE75590], "specifierWithSpecifier:", v6);
      objc_msgSend(v7, "setProperty:forKey:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("SHOW_STICKERS_DESCRIPTION"), &stru_25107A038, CFSTR("Keyboard")), *MEMORY[0x24BE75A68]);
      objc_msgSend(a3, "ps_insertObject:afterObject:", v7, v6);
      objc_msgSend(a3, "removeObject:", v6);
    }
  }
}

- (void)addEnabledExtensionSpecifiersToArray:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController", 0), "activeInputModes");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(a3, "addObjectsFromArray:", +[KSAddExtensionKeyboardController specifiersForExtensionInputMode:parentSpecifier:](KSAddExtensionKeyboardController, "specifiersForExtensionInputMode:parentSpecifier:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), -[KSKeyboardController specifier](self, "specifier")));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (id)autoPunctuation:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences", a3), "dictationAutoPunctuationEnabled"));
}

- (void)setAutoPunctuation:(id)a3 specifier:(id)a4
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences", a3, a4), "setDictationAutoPunctuationEnabled:", objc_msgSend(a3, "BOOLValue"));
}

- (id)hardwareKeyboardSpecifier
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BE75590];
  v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("Hardware Keyboard"), &stru_25107A038, CFSTR("Keyboard"));
  v5 = (void *)objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, 0, 0, objc_opt_class(), 2, 0);
  objc_msgSend(v5, "setProperty:forKey:", CFSTR("Hardware Keyboard"), *MEMORY[0x24BE75AC0]);
  return v5;
}

- (id)dictationHWShortcutSpecifier
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BE75590];
  v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("DICTATION_SHORTCUT"), &stru_25107A038, CFSTR("Dictation"));
  v5 = (void *)objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, 0, sel_dictationShortcutSubtitle_, objc_opt_class(), 2, 0);
  objc_msgSend(v5, "setProperty:forKey:", CFSTR("DictationHWShortcut"), *MEMORY[0x24BE75AC0]);
  return v5;
}

- (void)dictationShortcutSubtitle:(id)a3
{
  objc_msgSend((id)objc_msgSend((id)-[KSKeyboardController cachedCellForSpecifier:](self, "cachedCellForSpecifier:", a3), "valueLabel"), "setAttributedText:", +[TIDictationShortcutController attributedTitleForDictationShortcutValue:](TIDictationShortcutController, "attributedTitleForDictationShortcutValue:", (int)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController"), "valueForPreferenceKey:", CFSTR("HWKeyboardDictationShortcut")), "intValue")));
}

- (void)hardwareKeyboardAvailabilityChanged
{
  uint64_t v3;
  PSSpecifier *v4;

  if (GSEventIsHardwareKeyboardAttached())
  {
    if (!-[KSKeyboardController specifierForID:](self, "specifierForID:", CFSTR("Hardware Keyboard")))
      -[KSKeyboardController insertSpecifier:afterSpecifierID:animated:](self, "insertSpecifier:afterSpecifierID:animated:", -[KSKeyboardController hardwareKeyboardSpecifier](self, "hardwareKeyboardSpecifier"), CFSTR("KEYBOARDS"), 1);
    if (!-[KSKeyboardController dictationHardwareShortcutSpecifier](self, "dictationHardwareShortcutSpecifier"))
      -[KSKeyboardController setDictationHardwareShortcutSpecifier:](self, "setDictationHardwareShortcutSpecifier:", -[KSKeyboardController dictationHWShortcutSpecifier](self, "dictationHWShortcutSpecifier"));
    v3 = -[KSKeyboardController specifierForID:](self, "specifierForID:", CFSTR("Dictation"));
    if (-[KSKeyboardController dictationLanguageSpecifier](self, "dictationLanguageSpecifier"))
    {
      v4 = -[KSKeyboardController dictationLanguageSpecifier](self, "dictationLanguageSpecifier");
    }
    else
    {
      if (!-[KSKeyboardController dictationAutoPunctuationSpecifier](self, "dictationAutoPunctuationSpecifier"))
      {
LABEL_13:
        -[KSKeyboardController insertSpecifier:afterSpecifier:animated:](self, "insertSpecifier:afterSpecifier:animated:", -[KSKeyboardController dictationHardwareShortcutSpecifier](self, "dictationHardwareShortcutSpecifier"), v3, 1);
        return;
      }
      v4 = -[KSKeyboardController dictationAutoPunctuationSpecifier](self, "dictationAutoPunctuationSpecifier");
    }
    v3 = (uint64_t)v4;
    goto LABEL_13;
  }
  -[KSKeyboardController removeSpecifierID:animated:](self, "removeSpecifierID:animated:", CFSTR("Hardware Keyboard"), 1);
  if (-[KSKeyboardController dictationHardwareShortcutSpecifier](self, "dictationHardwareShortcutSpecifier"))
    -[KSKeyboardController removeSpecifier:animated:](self, "removeSpecifier:animated:", -[KSKeyboardController dictationHardwareShortcutSpecifier](self, "dictationHardwareShortcutSpecifier"), 1);
}

- (BOOL)_supportsReachableKeyboard
{
  double v2;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen"), "_referenceBounds");
  return (v2 > 320.0) & ~objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice"), "sf_isiPad");
}

- (id)getReachableKeybordSetting:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F8], "sharedPreferencesController", a3), "handBias"));
}

- (void)setReachableKeyboardSetting:(id)a3 specifier:(id)a4
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F8], "sharedPreferencesController", a3, a4), "setHandBias:", objc_msgSend(a3, "integerValue"));
}

- (id)reachableKeyboardSpecifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BE75590];
  v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("REACHABLE_KEYBOARD"), &stru_25107A038, CFSTR("Keyboard"));
  v5 = (void *)objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, sel_setReachableKeyboardSetting_specifier_, sel_getReachableKeybordSetting_, objc_opt_class(), 2, 0);
  objc_msgSend(v5, "setProperty:forKey:", CFSTR("ReachableKeyboard"), *MEMORY[0x24BE75AC0]);
  objc_msgSend(v5, "setProperty:forKey:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("REACHABLE_EXPLANATION"), &stru_25107A038, CFSTR("Keyboard")), *MEMORY[0x24BE75CD0]);
  v7[0] = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("REACHABLE_OPTION_NONE"), &stru_25107A038, CFSTR("Keyboard"));
  v7[1] = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("REACHABLE_OPTION_LEFT"), &stru_25107A038, CFSTR("Keyboard"));
  v7[2] = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("REACHABLE_OPTION_RIGHT"), &stru_25107A038, CFSTR("Keyboard"));
  objc_msgSend(v5, "setValues:titles:", &unk_251083780, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 3));
  return v5;
}

- (BOOL)_supportsProKeyboard
{
  int v2;

  if (TIGetToggleFourOrFiveRowKeyboardValue_onceToken != -1)
    dispatch_once(&TIGetToggleFourOrFiveRowKeyboardValue_onceToken, &__block_literal_global_576);
  v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController"), "valueForPreferenceKey:", CFSTR("ToggleFourOrFiveRowKeyboard")), "BOOLValue");
  if (v2)
    LOBYTE(v2) = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice"), "sf_isiPad");
  return v2;
}

- (id)getProKeyboardSetting:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEBD6F8], "sharedPreferencesController", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "enableProKeyboard"));
  else
    return (id)MEMORY[0x24BDBD1C0];
}

- (void)setProKeyboardSetting:(id)a3 specifier:(id)a4
{
  void *v5;

  v5 = (void *)objc_msgSend(MEMORY[0x24BEBD6F8], "sharedPreferencesController", a3, a4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setEnableProKeyboard:", objc_msgSend(a3, "BOOLValue"));
}

- (id)proKeyboardSpecifier
{
  return (id)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("PRO_KEYBOARD"), &stru_25107A038, CFSTR("Keyboard")), self, sel_setProKeyboardSetting_specifier_, sel_getProKeyboardSetting_, 0, 6, 0);
}

- (NSArray)openShortcutsSpecifiers
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSArray *result;
  uint64_t v8;
  id v9;
  uint64_t v10;

  if (self->_openShortcutsSpecifiers
    || (v3 = (void *)MEMORY[0x24BE75590],
        v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("USER_DICTIONARY"), &stru_25107A038, CFSTR("Keyboard")), v5 = (void *)objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, 0, 0, 0, objc_opt_class(), 2, 0), objc_msgSend(v5, "setProperty:forKey:", CFSTR("USER_DICTIONARY"), *MEMORY[0x24BE75AC0]), v6 = objc_alloc(MEMORY[0x24BDBCE30]), result = (NSArray *)objc_msgSend(v6,
                              "initWithObjects:",
                              objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithName:", &stru_25107A038),
                              v5,
                              0),
        (self->_openShortcutsSpecifiers = result) != 0))
  {
    v8 = objc_msgSend((id)objc_msgSend((id)getMCProfileConnectionClass(), "sharedConnection"), "isKeyboardShortcutsAllowed");
    v9 = -[NSArray lastObject](self->_openShortcutsSpecifiers, "lastObject");
    v10 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
    objc_msgSend(v9, "setProperty:forKey:", v10, *MEMORY[0x24BE75A18]);
    return self->_openShortcutsSpecifiers;
  }
  return result;
}

- (NSDictionary)offlineStatusForLanguage
{
  return self->_offlineStatusForLanguage;
}

- (void)setOfflineStatusForLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1416);
}

- (KSUserWordsManager)dictionaryController
{
  return self->_dictionaryController;
}

- (BOOL)needsReloadSpecifiers
{
  return self->_needsReloadSpecifiers;
}

- (void)setNeedsReloadSpecifiers:(BOOL)a3
{
  self->_needsReloadSpecifiers = a3;
}

- (PSSpecifier)dictationLanguageSpecifier
{
  return self->_dictationLanguageSpecifier;
}

- (void)setDictationLanguageSpecifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1432);
}

- (PSSpecifier)dictationAutoPunctuationSpecifier
{
  return self->_dictationAutoPunctuationSpecifier;
}

- (void)setDictationAutoPunctuationSpecifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1440);
}

- (PSSpecifier)dictationHardwareShortcutSpecifier
{
  return self->_dictationHardwareShortcutSpecifier;
}

- (void)setDictationHardwareShortcutSpecifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1448);
}

- (PSSpecifier)deleteWordSpecifier
{
  return self->_deleteWordSpecifier;
}

- (void)setDeleteWordSpecifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1456);
}

- (PSSpecifier)inlineCompletionSpecifier
{
  return self->_inlineCompletionSpecifier;
}

- (void)setInlineCompletionSpecifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1464);
}

- (unint64_t)deleteWordSpecifierIndex
{
  return self->_deleteWordSpecifierIndex;
}

- (void)setDeleteWordSpecifierIndex:(unint64_t)a3
{
  self->_deleteWordSpecifierIndex = a3;
}

- (unint64_t)inlineCompletionSpecifierIndex
{
  return self->_inlineCompletionSpecifierIndex;
}

- (void)setInlineCompletionSpecifierIndex:(unint64_t)a3
{
  self->_inlineCompletionSpecifierIndex = a3;
}

- (KSDictationOfflineStatusObserver)dictationOfflineStatusObserver
{
  return self->_dictationOfflineStatusObserver;
}

- (void)setDictationOfflineStatusObserver:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1488);
}

- (void)init
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  -[KSKeyboardController readAutocorrectionPreferenceValue:].cold.1(v0);
}

- (void)readAutocorrectionPreferenceValue:.cold.1()
{
  __assert_rtn("-[KSKeyboardController readAutocorrectionPreferenceValue:]", "KSKeyboardController.m", 704, "[[specifier propertyForKey:PSKeyNameKey] isEqualToString:kAutocorrectionPreference]");
}

- (void)readPredictionPreferenceValue:.cold.1()
{
  __assert_rtn("-[KSKeyboardController readPredictionPreferenceValue:]", "KSKeyboardController.m", 710, "[[specifier propertyForKey:PSKeyNameKey] isEqualToString:kKeyboardPrediction]");
}

- (void)readKeyboardInlineCompletionPreferenceValue:.cold.1()
{
  __assert_rtn("-[KSKeyboardController readKeyboardInlineCompletionPreferenceValue:]", "KSKeyboardController.m", 716, "[[specifier propertyForKey:PSKeyNameKey] isEqualToString:kKeyboardInlineCompletion]");
}

- (void)readKeyboardAllowPaddlePreferenceValue:.cold.1()
{
  __assert_rtn("-[KSKeyboardController readKeyboardAllowPaddlePreferenceValue:]", "KSKeyboardController.m", 723, "[str isEqualToString:kKeyboardAllowPaddle]");
}

- (void)readCheckSpellingPreferenceValue:.cold.1()
{
  __assert_rtn("-[KSKeyboardController readCheckSpellingPreferenceValue:]", "KSKeyboardController.m", 729, "[[specifier propertyForKey:PSKeyNameKey] isEqualToString:kCheckSpellingPreference]");
}

- (void)readCPPreferenceValue:.cold.1()
{
  __assert_rtn("-[KSKeyboardController readCPPreferenceValue:]", "KSKeyboardController.m", 735, "[[specifier propertyForKey:PSKeyNameKey] isEqualToString:kKeyboardCPPreference]");
}

- (void)readCPDeleteWordPreferenceValue:.cold.1()
{
  __assert_rtn("-[KSKeyboardController readCPDeleteWordPreferenceValue:]", "KSKeyboardController.m", 741, "[[specifier propertyForKey:PSKeyNameKey] isEqualToString:kKeyboardCPDeleteWordPreference]");
}

- (void)setAutocorrectionPreferenceValue:forSpecifier:.cold.1()
{
  __assert_rtn("-[KSKeyboardController setAutocorrectionPreferenceValue:forSpecifier:]", "KSKeyboardController.m", 747, "[[specifier propertyForKey:PSKeyNameKey] isEqualToString:kAutocorrectionPreference]");
}

- (void)feedbackFeatureEnabled
{
  uint8_t buf[4];
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)buf = 138412290;
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s Feedback %@: RC_SEED_BUILD: 0 enabled: %d"), "-[KSKeyboardController feedbackFeatureEnabled]", CFSTR("KeyboardAutocorrection"), a1 & 1);
  _os_log_debug_impl(&dword_2401A7000, a2, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
}

- (void)setPredictionPreferenceValue:forSpecifier:.cold.1()
{
  __assert_rtn("-[KSKeyboardController setPredictionPreferenceValue:forSpecifier:]", "KSKeyboardController.m", 816, "[[specifier propertyForKey:PSKeyNameKey] isEqualToString:kKeyboardPrediction]");
}

- (void)setKeyboardAllowPaddlePreferenceValue:forSpecifier:.cold.1()
{
  __assert_rtn("-[KSKeyboardController setKeyboardAllowPaddlePreferenceValue:forSpecifier:]", "KSKeyboardController.m", 825, "[[specifier propertyForKey:PSKeyNameKey] isEqualToString:kKeyboardAllowPaddle]");
}

- (void)setCheckSpellingPreferenceValue:forSpecifier:.cold.1()
{
  __assert_rtn("-[KSKeyboardController setCheckSpellingPreferenceValue:forSpecifier:]", "KSKeyboardController.m", 831, "[[specifier propertyForKey:PSKeyNameKey] isEqualToString:kCheckSpellingPreference]");
}

- (void)readSmartTypingPreferenceValue:.cold.1()
{
  __assert_rtn("-[KSKeyboardController readSmartTypingPreferenceValue:]", "KSKeyboardController.m", 837, "[[specifier propertyForKey:PSKeyNameKey] isEqualToString:kSmartTypingSpecifierName]");
}

- (void)setSmartTypingPreferenceValue:forSpecifier:.cold.1()
{
  __assert_rtn("-[KSKeyboardController setSmartTypingPreferenceValue:forSpecifier:]", "KSKeyboardController.m", 843, "[[specifier propertyForKey:PSKeyNameKey] isEqualToString:kSmartTypingSpecifierName]");
}

- (void)shuangpinType:.cold.1()
{
  __assert_rtn("-[KSKeyboardController shuangpinType:]", "KSKeyboardController.m", 1114, "[[specifier propertyForKey:PSKeyNameKey] isEqualToString:kShuangpinTypePreference]");
}

- (void)setShuangpinType:specifier:.cold.1()
{
  __assert_rtn("-[KSKeyboardController setShuangpinType:specifier:]", "KSKeyboardController.m", 1120, "[[specifier propertyForKey:PSKeyNameKey] isEqualToString:kShuangpinTypePreference]");
}

- (void)pinyinDialect:.cold.1()
{
  __assert_rtn("-[KSKeyboardController pinyinDialect:]", "KSKeyboardController.m", 1128, "[[specifier propertyForKey:PSKeyNameKey] isEqualToString:kPinyinDialectPreference]");
}

- (void)setPinyinDialect:specifier:.cold.1()
{
  __assert_rtn("-[KSKeyboardController setPinyinDialect:specifier:]", "KSKeyboardController.m", 1134, "[[specifier propertyForKey:PSKeyNameKey] isEqualToString:kPinyinDialectPreference]");
}

- (void)wubiStandard:.cold.1()
{
  __assert_rtn("-[KSKeyboardController wubiStandard:]", "KSKeyboardController.m", 1143, "[[specifier propertyForKey:PSKeyNameKey] isEqualToString:kWubiStandardPreference]");
}

- (void)setWubiStandard:specifier:.cold.1()
{
  __assert_rtn("-[KSKeyboardController setWubiStandard:specifier:]", "KSKeyboardController.m", 1149, "[[specifier propertyForKey:PSKeyNameKey] isEqualToString:kWubiStandardPreference]");
}

- (void)smartFullwidthSpace:.cold.1()
{
  __assert_rtn("-[KSKeyboardController smartFullwidthSpace:]", "KSKeyboardController.m", 1155, "[[specifier propertyForKey:PSKeyNameKey] isEqualToString:kSmartFullwidthSpacePreference]");
}

- (void)setSmartFullwidthSpace:specifier:.cold.1()
{
  __assert_rtn("-[KSKeyboardController setSmartFullwidthSpace:specifier:]", "KSKeyboardController.m", 1161, "[[specifier propertyForKey:PSKeyNameKey] isEqualToString:kSmartFullwidthSpacePreference]");
}

+ (void)localizedDisplayNameForInputMode:forDictation:.cold.1()
{
  __assert_rtn("+[KSKeyboardController localizedDisplayNameForInputMode:forDictation:]", "KSKeyboardController.m", 1426, "localizedName.length > 0");
}

- (void)loadAllKeyboardPreferences
{
  __assert_rtn("-[KSKeyboardController loadAllKeyboardPreferences]", "KSKeyboardController.m", 1885, "[preferences count] > 0");
}

@end
