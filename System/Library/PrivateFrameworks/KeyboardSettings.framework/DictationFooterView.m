@implementation DictationFooterView

- (DictationFooterView)initWithSpecifier:(id)a3
{
  DictationFooterView *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSString *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char **v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)DictationFooterView;
  v4 = -[PSFooterMultiHyperlinkView initWithSpecifier:](&v23, sel_initWithSpecifier_);
  if (v4)
  {
    v5 = (void *)objc_msgSend(a3, "target");
    v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("DICTATION_ON_DEVICE_ABOUT_LINK"), &stru_25107A038, CFSTR("Keyboard"));
    v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("DICTATION_ON_DEVICE_MANAGE_STORAGE_LINK"), &stru_25107A038, CFSTR("Keyboard"));
    v8 = +[DictationFooterView dictationAutoPunctuationText](DictationFooterView, "dictationAutoPunctuationText");
    v9 = v6;
    if (objc_msgSend(v8, "length"))
      v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v8, v6);
    -[PSFooterMultiHyperlinkView setText:](v4, "setText:", v9);
    v10 = objc_msgSend(v5, "lowStorageOnDeviceAssetStringWithLinkString:", v7);
    v11 = AFDeviceHighestLanguageModelCapabilityIdentifier();
    v12 = objc_msgSend(v5, "offlineStatusForLanguage");
    if (v11 == 10)
      v13 = -[DictationFooterView explanationSuffixTextWithOfflineDictationStatus:privacyLinkText:lowStorage:](v4, "explanationSuffixTextWithOfflineDictationStatus:privacyLinkText:lowStorage:", v12, v9, v10 != 0);
    else
      v13 = -[DictationFooterView offlineExplanationSuffixTextWithOfflineDictationStatus:privacyLinkText:](v4, "offlineExplanationSuffixTextWithOfflineDictationStatus:privacyLinkText:", v12, v9);
    v14 = v13;
    if (v13)
      -[PSFooterMultiHyperlinkView setText:](v4, "setText:", v13);
    v15 = -[PSFooterMultiHyperlinkView text](v4, "text", v14);
    if (v10)
    {
      -[PSFooterMultiHyperlinkView setText:](v4, "setText:", -[NSString stringByAppendingFormat:](v15, "stringByAppendingFormat:", CFSTR("\n\n%@"), v10));
      v16 = -[PSFooterMultiHyperlinkView text](v4, "text");
      objc_msgSend(a3, "setProperty:forKey:", v16, *MEMORY[0x24BE75A68]);
      v17 = -[NSString rangeOfString:](-[PSFooterMultiHyperlinkView text](v4, "text"), "rangeOfString:", v6);
      objc_msgSend(a3, "addFooterHyperlinkWithRange:target:action:", v17, v18, v5, sel_presentPrivacySheet_);
      v19 = &selRef_launchManageStorage_;
    }
    else
    {
      objc_msgSend(a3, "setProperty:forKey:", v15, *MEMORY[0x24BE75A68]);
      v19 = &selRef_presentPrivacySheet_;
      v7 = v6;
    }
    v20 = -[NSString rangeOfString:](-[PSFooterMultiHyperlinkView text](v4, "text"), "rangeOfString:", v7);
    objc_msgSend(a3, "addFooterHyperlinkWithRange:target:action:", v20, v21, v5, *v19);
    -[PSFooterMultiHyperlinkView refreshContentsWithSpecifier:](v4, "refreshContentsWithSpecifier:", a3);
  }
  return v4;
}

- (id)offlineExplanationSuffixTextWithOfflineDictationStatus:(id)a3 privacyLinkText:(id)a4
{
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3052000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v24 = objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __94__DictationFooterView_offlineExplanationSuffixTextWithOfflineDictationStatus_privacyLinkText___block_invoke;
  v14[3] = &unk_2510795F0;
  v14[4] = &v19;
  v14[5] = &v15;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v14);
  if (objc_msgSend((id)v20[5], "count"))
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    v7 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    if ((unint64_t)objc_msgSend((id)v20[5], "count") < 2)
      v8 = CFSTR("DICTATION_OFFLINE_EXPLANATION_SUFFIX_INSTALLED_WITH_LANGUAGE");
    else
      v8 = (const __CFString *)objc_msgSend(CFSTR("DICTATION_OFFLINE_EXPLANATION_SUFFIX_INSTALLED_WITH_LANGUAGE"), "stringByAppendingString:", CFSTR("S"));
    v11 = objc_msgSend(v7, "localizedStringForKey:value:table:", v8, &stru_25107A038, CFSTR("Keyboard"));
    v10 = objc_msgSend(v6, "stringWithFormat:", v11, +[KSKeyboardController localizedListForInputModes:forDictation:duplicatedBaseLanguages:](KSKeyboardController, "localizedListForInputModes:forDictation:duplicatedBaseLanguages:", objc_msgSend((id)v20[5], "allObjects"), 1, 0));
  }
  else
  {
    if (!*((_BYTE *)v16 + 24))
    {
LABEL_10:
      v12 = 0;
      goto LABEL_11;
    }
    v9 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = objc_msgSend(v9, "localizedStringForKey:value:table:", SFLocalizableWAPIStringKeyForKey(), &stru_25107A038, CFSTR("Keyboard"));
  }
  if (!v10)
    goto LABEL_10;
  v12 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v10, a4);
LABEL_11:
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  return v12;
}

uint64_t __94__DictationFooterView_offlineExplanationSuffixTextWithOfflineDictationStatus_privacyLinkText___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  void *v5;
  uint64_t v6;

  result = AFOfflineDictationStatusStringIsInstalled();
  if ((_DWORD)result)
  {
    v5 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController"), "enabledDictationLanguages");
    v6 = objc_msgSend(a2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
    result = objc_msgSend(v5, "containsObject:", v6);
    if ((_DWORD)result)
      result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v6);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

- (id)explanationSuffixTextWithOfflineDictationStatus:(id)a3 privacyLinkText:(id)a4 lowStorage:(BOOL)a5
{
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int IsInstalled;
  int IsInstalling;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  const __CFString *v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v8 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController"), "activeDictationSupportedInputModeIdentifiers");
  if (objc_msgSend(v8, "count") == 1
    && (v9 = (void *)objc_msgSend(MEMORY[0x24BEB4D50], "sharedInputModeController"),
        (objc_opt_respondsToSelector() & 1) != 0))
  {
    v10 = (void *)objc_msgSend(v9, "defaultDictationLanguagesForKeyboardLanguage:", objc_msgSend(v8, "firstObject"));
    if (!v10)
    {
      v33[0] = objc_msgSend(v8, "firstObject");
      v10 = (void *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 1);
    }
  }
  else
  {
    v10 = v8;
  }
  if (objc_msgSend(v10, "count") == 1
    && DictationIsEnabled()
    && objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController"), "enabledDictationLanguages"), "containsObject:", objc_msgSend(v10, "firstObject")))
  {
    v11 = objc_msgSend((id)objc_msgSend(v10, "firstObject"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
    v12 = _AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode();
    if (v12)
      v13 = v12;
    else
      v13 = v11;
    objc_msgSend(a3, "objectForKeyedSubscript:", v13);
    if (AFOfflineDictationStatusStringIsHighQualityModelSupported())
    {
      IsInstalled = AFOfflineDictationStatusStringIsInstalled();
      IsInstalling = AFOfflineDictationStatusStringIsInstalling();
      v16 = AFOfflineDictationStatusStringIsOnDeviceSearchSupported();
      v17 = (void *)MEMORY[0x24BDD17C8];
      v18 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      if (IsInstalled)
      {
        v19 = objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("DICTATION_ON_DEVICE_PRIVATE_PROCESSING"), &stru_25107A038, CFSTR("Keyboard"));
        v20 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        if (v16)
          v21 = CFSTR("DICTATION_ON_DEVICE_SERVER_SOMETIMES_NO_SEARCH");
        else
          v21 = CFSTR("DICTATION_ON_DEVICE_SERVER_SOMETIMES");
        v31 = (id)objc_msgSend(v20, "localizedStringForKey:value:table:", v21, &stru_25107A038, CFSTR("Keyboard"));
        v32 = a4;
        v30 = v19;
        v22 = CFSTR("%@ %@ %@");
        goto LABEL_28;
      }
      v25 = objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("DICTATION_ON_DEVICE_SERVER_WHEN_NECESSARY"), &stru_25107A038, CFSTR("Keyboard"));
      v26 = v25;
      if (IsInstalling)
      {
        if (!a5)
        {
          v27 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v28 = CFSTR("DICTATION_ON_DEVICE_SUPPORT_DOWNLOADING");
LABEL_27:
          v31 = a4;
          v32 = (id)objc_msgSend(v27, "localizedStringForKey:value:table:", v28, &stru_25107A038, CFSTR("Keyboard"));
          v30 = v26;
          v22 = CFSTR("%@ %@\n\n%@");
          goto LABEL_28;
        }
      }
      else if (!a5)
      {
        v29 = objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v28 = (const __CFString *)SFLocalizableWAPIStringKeyForKey();
        v27 = (void *)v29;
        goto LABEL_27;
      }
      v30 = v25;
      v31 = a4;
      v22 = CFSTR("%@ %@");
LABEL_28:
      v23 = (void *)objc_msgSend(v17, "stringWithFormat:", v22, v30, v31, v32);
      return v23;
    }
    v23 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("DICTATION_ON_DEVICE_SERVER"), &stru_25107A038, CFSTR("Keyboard")), a4, v32);
  }
  else
  {
    v23 = 0;
  }
  return v23;
}

+ (id)dictationAutoPunctuationText
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  uint64_t v21;
  char v22;
  __CFString *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  char v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 0;
  v2 = objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_msgSend(MEMORY[0x24BDD14E0], "set");
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences"), "languageCode"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
  v6 = (void *)objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController"), "enabledDictationLanguages");
  if ((DictationIsEnabled() & (v7 != 0)) != 0)
    v6 = (void *)v7;
  if (v5
    && objc_msgSend((id)objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences"), "assistantIsEnabled")
    && (objc_msgSend(v6, "containsObject:", v5) & 1) == 0)
  {
    v6 = (void *)objc_msgSend(v6, "arrayByAddingObject:", v5);
  }
  v28 = (void *)v2;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v34;
    v27 = 1;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v3, "addObject:", TIInputModeGetBaseLanguage());
        v13 = objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
        v14 = _AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode();
        if (v14)
          v13 = v14;
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences"), "dictationAutoPunctuationSupportedLocales"), "containsObject:", v13))objc_msgSend(v28, "addObject:", v12);
        else
          v27 = 0;
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v9);
  }
  else
  {
    v27 = 1;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v16 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v3);
        v20 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
        if ((unint64_t)objc_msgSend(v3, "countForObject:", v20) >= 2)
          objc_msgSend(v4, "addObject:", v20);
      }
      v17 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v17);
  }
  v21 = objc_msgSend(v28, "count");
  v22 = (v21 == 0) | v27;
  if (v21)
    v23 = &stru_25107A038;
  else
    v23 = 0;
  if ((v22 & 1) == 0)
  {
    v24 = (void *)MEMORY[0x24BDD17C8];
    v25 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    if ((unint64_t)objc_msgSend(v28, "count") < 2)
      v26 = CFSTR("DICTATION_AUTO_PUNCTUATION_EXPLANATION_SUFFIX_WITH_LANGUAGE");
    else
      v26 = (const __CFString *)objc_msgSend(CFSTR("DICTATION_AUTO_PUNCTUATION_EXPLANATION_SUFFIX_WITH_LANGUAGE"), "stringByAppendingString:", CFSTR("S"));
    v23 = (__CFString *)objc_msgSend(v24, "stringWithFormat:", objc_msgSend(v25, "localizedStringForKey:value:table:", v26, &stru_25107A038, CFSTR("Keyboard")), +[KSKeyboardController localizedListForInputModes:forDictation:duplicatedBaseLanguages:](KSKeyboardController, "localizedListForInputModes:forDictation:duplicatedBaseLanguages:", v28, 1, v4));
  }
  return v23;
}

@end
