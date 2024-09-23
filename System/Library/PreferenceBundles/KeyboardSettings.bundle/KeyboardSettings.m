void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

uint64_t IsTrialAssetDeliveryEnabled()
{
  void *v0;
  void *v1;
  char v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.internal.ck"));
  objc_msgSend(v0, "objectForKey:", CFSTR("disableTrialAssetDelivery"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  if ((v2 & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v0, "objectForKey:", CFSTR("enableTrialAssetDelivery"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "BOOLValue") & 1) != 0)
      v3 = 1;
    else
      v3 = _os_feature_enabled_impl();

  }
  return v3;
}

uint64_t EmbeddedSpeechNewAssetInstalled(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateOfflineDictationStatus");
}

void *LocStringKeyBasedOnLanguageCount(void *result, unint64_t a2, uint64_t a3)
{
  if (a2 >= 2)
    result = (void *)objc_msgSend(result, "stringByAppendingString:", CFSTR("S"));
  if (a3)
    return (void *)objc_msgSend(result, "stringByAppendingString:", a3);
  return result;
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

uint64_t DictationIsEnabled()
{
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences"), "dictationIsEnabled") & 1) != 0)
    return 1;
  else
    return objc_msgSend((id)objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences"), "suppressDictationOptIn") ^ 1;
}

uint64_t HardwareKeyboardAvailabilityChanged(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_hardwareKeyboardAvailabilityChanged, 0, 0);
}

uint64_t getMCProfileConnectionClass()
{
  uint64_t v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  uint64_t v8;

  v3 = 0;
  v4 = &v3;
  v5 = 0x3052000000;
  v6 = __Block_byref_object_copy__0;
  v7 = __Block_byref_object_dispose__0;
  v0 = getMCProfileConnectionClass_softClass;
  v8 = getMCProfileConnectionClass_softClass;
  if (!getMCProfileConnectionClass_softClass)
  {
    v2[0] = MEMORY[0x24BDAC760];
    v2[1] = 3221225472;
    v2[2] = __getMCProfileConnectionClass_block_invoke;
    v2[3] = &unk_24E732100;
    v2[4] = &v3;
    __getMCProfileConnectionClass_block_invoke((uint64_t)v2);
    v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

uint64_t ManagedConfigurationLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_24E732438;
    v3 = 0;
    ManagedConfigurationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
    ManagedConfigurationLibrary_cold_1(&v1);
  return ManagedConfigurationLibraryCore_frameworkLibrary;
}

Class __getTUIFeedbackControllerClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!KeyboardSettingsFeedbackLibraryCore_frameworkLibrary)
    KeyboardSettingsFeedbackLibraryCore_frameworkLibrary = _sl_dlopen();
  result = objc_getClass("TUIFeedbackController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  getTUIFeedbackControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

Class __getMCProfileConnectionClass_block_invoke(uint64_t a1)
{
  Class result;

  ManagedConfigurationLibrary();
  result = objc_getClass("MCProfileConnection");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    __getMCProfileConnectionClass_block_invoke_cold_1();
  getMCProfileConnectionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

id attributedTitleForKey(void *a1, __IOHIDServiceClient *a2, void *a3, int a4)
{
  __CFString *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;

  v7 = a1;
  v8 = a3;
  if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("Function"))
    && showGlobeKeyInsteadOfFunctionKey(a2))
  {

    v7 = CFSTR("Globe");
  }
  objc_msgSend((id)_keyToTitle, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("CapsLock")) && a2)
  {
    v10 = (void *)IOHIDServiceClientCopyProperty(a2, CFSTR("CapsLockLanguageSwitch"));
    v11 = (void *)IOHIDServiceClientCopyProperty(a2, CFSTR("KeyboardLanguage"));
    if (objc_msgSend(v11, "length")
      && ((objc_msgSend(v10, "BOOLValue") & 1) != 0
       || objc_msgSend(v11, "isEqualToString:", CFSTR("Simplified Chinese Keyboard"))))
    {
      +[TIHardwareKeyboardController IOHIDKeyboardLanguageToCapsLockKeyLabel](TIHardwareKeyboardController, "IOHIDKeyboardLanguageToCapsLockKeyLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }

    if (v13)
    {
      v15 = v13;

      v14 = 0;
      v9 = v15;
      if (!v8)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  if (a4)
  {
    objc_msgSend((id)_keyToSymbol, "objectForKeyedSubscript:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  v15 = 0;
  if (v8)
  {
LABEL_14:
    objc_msgSend(v9, "stringByAppendingString:", v8);
    v16 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v16;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", v9, &stru_24E732B90, CFSTR("Keyboard"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  +[TIKeyboardListController attributedTitleForSymbolName:cellTitle:](TIKeyboardListController, "attributedTitleForSymbolName:cellTitle:", v14, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

uint64_t showGlobeKeyInsteadOfFunctionKey(__IOHIDServiceClient *a1)
{
  void *v1;
  uint64_t v2;

  if (!a1)
    return 0;
  v1 = (void *)IOHIDServiceClientCopyProperty(a1, CFSTR("SupportsGlobeKey"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = objc_msgSend(v1, "BOOLValue");
  else
    v2 = 0;

  return v2;
}

void __initializeDictionaries_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[8];
  _QWORD v28[6];
  _QWORD v29[7];
  _QWORD v30[7];
  _QWORD v31[8];
  _QWORD v32[8];
  _QWORD v33[8];
  _QWORD v34[8];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v33[0] = CFSTR("CapsLock");
  v33[1] = CFSTR("Control");
  v34[0] = &unk_24E73DF70;
  v34[1] = &unk_24E73DF88;
  v33[2] = CFSTR("Option");
  v33[3] = CFSTR("Command");
  v34[2] = &unk_24E73DFA0;
  v34[3] = &unk_24E73DFB8;
  v33[4] = CFSTR("Escape");
  v33[5] = CFSTR("Function");
  v34[4] = &unk_24E73DFD0;
  v34[5] = &unk_24E73DFE8;
  v33[6] = CFSTR("Globe");
  v33[7] = CFSTR("NoAction");
  v34[6] = &unk_24E73E000;
  v34[7] = &unk_24E73E018;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_keyToKeyCode;
  _keyToKeyCode = v0;

  v31[0] = CFSTR("CapsLock");
  v31[1] = CFSTR("Control");
  v32[0] = CFSTR("Caps Lock");
  v32[1] = CFSTR("Control");
  v31[2] = CFSTR("Option");
  v31[3] = CFSTR("Command");
  v32[2] = CFSTR("Option");
  v32[3] = CFSTR("Command");
  v31[4] = CFSTR("Escape");
  v31[5] = CFSTR("Function");
  v32[4] = CFSTR("Escape");
  v32[5] = CFSTR("Function");
  v31[6] = CFSTR("Globe");
  v31[7] = CFSTR("NoAction");
  v32[6] = CFSTR("Globe");
  v32[7] = CFSTR("No Action");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 8);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_keyToTitle;
  _keyToTitle = v2;

  v29[0] = CFSTR("CapsLock");
  v29[1] = CFSTR("Control");
  v30[0] = CFSTR("capslock");
  v30[1] = CFSTR("control");
  v29[2] = CFSTR("Option");
  v29[3] = CFSTR("Command");
  v30[2] = CFSTR("option");
  v30[3] = CFSTR("command");
  v29[4] = CFSTR("Escape");
  v29[5] = CFSTR("Function");
  v30[4] = CFSTR("escape");
  v30[5] = CFSTR("fn");
  v29[6] = CFSTR("Globe");
  v30[6] = CFSTR("globe");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_keyToSymbol;
  _keyToSymbol = v4;

  v28[0] = CFSTR("CapsLock");
  v28[1] = CFSTR("Control");
  v28[2] = CFSTR("Option");
  v28[3] = CFSTR("Command");
  v28[4] = CFSTR("Globe");
  v28[5] = CFSTR("Function");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 6);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)_srcKeys;
  _srcKeys = v6;

  v27[0] = CFSTR("CapsLock");
  v27[1] = CFSTR("Control");
  v27[2] = CFSTR("Option");
  v27[3] = CFSTR("Command");
  v27[4] = CFSTR("Escape");
  v27[5] = CFSTR("Globe");
  v27[6] = CFSTR("Function");
  v27[7] = CFSTR("NoAction");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 8);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)_dstKeys;
  _dstKeys = v8;

  v10 = (id)_keyToKeyCode;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v12, "objectForKeyedSubscript:", v17, (_QWORD)v23);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "count"))
        {
          v19 = 0;
          do
          {
            objc_msgSend(v18, "objectAtIndexedSubscript:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, v20);

            ++v19;
          }
          while (v19 < objc_msgSend(v18, "count"));
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    }
    while (v14);
  }

  v21 = objc_msgSend(v11, "copy");
  v22 = (void *)_keyCodeToKey;
  _keyCodeToKey = v21;

}

void *TIDownloadButton()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDF6AE0];
  v4[0] = objc_msgSend(MEMORY[0x24BDF6950], "tintColor");
  v1 = objc_msgSend(v0, "configurationWithPaletteColors:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1));
  v2 = (void *)objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 0);
  objc_msgSend(v2, "setPreferredSymbolConfiguration:forImageInState:", v1, 0);
  objc_msgSend(v2, "setImage:forState:", objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("icloud.and.arrow.down")), 0);
  objc_msgSend(v2, "sizeToFit");
  return v2;
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

uint64_t getSFSpeechAssetManagerClass()
{
  uint64_t v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  uint64_t v8;

  v3 = 0;
  v4 = &v3;
  v5 = 0x3052000000;
  v6 = __Block_byref_object_copy__1;
  v7 = __Block_byref_object_dispose__1;
  v0 = getSFSpeechAssetManagerClass_softClass;
  v8 = getSFSpeechAssetManagerClass_softClass;
  if (!getSFSpeechAssetManagerClass_softClass)
  {
    v2[0] = MEMORY[0x24BDAC760];
    v2[1] = 3221225472;
    v2[2] = __getSFSpeechAssetManagerClass_block_invoke;
    v2[3] = &unk_24E732100;
    v2[4] = &v3;
    __getSFSpeechAssetManagerClass_block_invoke((uint64_t)v2);
    v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

Class __getSFSpeechAssetManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!SpeechLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24E7326C0;
    v5 = 0;
    SpeechLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SpeechLibraryCore_frameworkLibrary)
    __getSFSpeechAssetManagerClass_block_invoke_cold_1(&v3);
  result = objc_getClass("SFSpeechAssetManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    __getSFSpeechAssetManagerClass_block_invoke_cold_2();
  getSFSpeechAssetManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

uint64_t TIInputModeIsChineseShuangpin()
{
  uint64_t result;

  result = objc_msgSend((id)TIInputModeGetBaseLanguage(), "isEqualToString:", CFSTR("zh"));
  if ((_DWORD)result)
    return objc_msgSend((id)TIInputModeGetVariant(), "isEqualToString:", CFSTR("Shuangpin"));
  return result;
}

BOOL TICurrentShuangpinTypeUsesSemicolon()
{
  void *v0;
  int v1;

  v0 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v1 = objc_msgSend((id)objc_msgSend(v0, "valueForPreferenceKey:", *MEMORY[0x24BEB5100]), "integerValue");
  return v1 == 7 || v1 == 2;
}

uint64_t TIGetCurrentShuangpinType()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  return objc_msgSend((id)objc_msgSend(v0, "valueForPreferenceKey:", *MEMORY[0x24BEB5100]), "integerValue");
}

void *TIGetShuangpinTypes()
{
  return &unk_24E73E048;
}

uint64_t TIGetCurrentShuangpinName()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  return TIGetShuangpinNameFromType(objc_msgSend((id)objc_msgSend(v0, "valueForPreferenceKey:", *MEMORY[0x24BEB5100]), "integerValue"));
}

uint64_t TIGetShuangpinNameFromType(int a1)
{
  int v1;

  v1 = a1 - 2;
  if ((a1 - 2) <= 5 && ((0x3Du >> v1) & 1) != 0)
    return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", off_24E732740[v1], &stru_24E732B90, CFSTR("Preferences_pinyin"));
  else
    return 0;
}

void *TIFilteredLayoutsByCurrentShuangpinType(void *a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v3 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v4 = objc_msgSend((id)objc_msgSend(v3, "valueForPreferenceKey:", *MEMORY[0x24BEB5100]), "integerValue");
  if (v4 == 7 || v4 == 2)
  {
    v23 = 0uLL;
    v24 = 0uLL;
    v21 = 0uLL;
    v22 = 0uLL;
    v6 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(a1);
          v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if ((objc_msgSend(v10, "hasPrefix:", CFSTR("Pinyin-")) & 1) == 0)
            objc_msgSend(v2, "addObject:", v10);
        }
        v7 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v7);
    }
  }
  else
  {
    v19 = 0uLL;
    v20 = 0uLL;
    v17 = 0uLL;
    v18 = 0uLL;
    v11 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(a1);
          v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * j);
          if ((objc_msgSend(v15, "hasPrefix:", CFSTR("Shuangpin-with-Semicolon-")) & 1) == 0)
            objc_msgSend(v2, "addObject:", v15);
        }
        v12 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v12);
    }
  }
  return v2;
}

id TIUpdateShuangpinSWLayout()
{
  id result;
  id v1;
  void *v2;
  void *v3;
  int v4;
  BOOL v6;
  _QWORD v7[5];
  BOOL v8;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController"), "enabledInputModeIdentifiers"), "mutableCopy");
  if (result)
  {
    v1 = result;
    v2 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController"), "normalizedEnabledInputModeIdentifiers"), "indexesOfObjectsPassingTest:", &__block_literal_global_5);
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
    v4 = objc_msgSend((id)objc_msgSend(v3, "valueForPreferenceKey:", *MEMORY[0x24BEB5100]), "integerValue");
    v6 = v4 == 7 || v4 == 2;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __TIUpdateShuangpinSWLayout_block_invoke_2;
    v7[3] = &unk_24E732720;
    v7[4] = v1;
    v8 = v6;
    objc_msgSend(v2, "enumerateIndexesUsingBlock:", v7);
    return (id)+[TIKeyboardListController setInputModes:](TIKeyboardListController, "setInputModes:", v1);
  }
  return result;
}

uint64_t HardwareKeyboardAvailabilityChanged_0(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_hardwareKeyboardAvailabilityChanged, 0, 0);
}

uint64_t TIInputModeIsChineseWubi()
{
  uint64_t result;

  result = objc_msgSend((id)TIInputModeGetBaseLanguage(), "isEqualToString:", CFSTR("zh"));
  if ((_DWORD)result)
    return objc_msgSend((id)TIInputModeGetVariant(), "isEqualToString:", CFSTR("Wubixing"));
  return result;
}

uint64_t TIGetCurrentWubiStandard()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  return objc_msgSend((id)objc_msgSend(v0, "valueForPreferenceKey:", *MEMORY[0x24BEB5238]), "integerValue");
}

void *TIGetWubiStandards()
{
  return &unk_24E73E090;
}

uint64_t TIGetCurrentWubiStandardName()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  return TIGetWubiStandardName(objc_msgSend((id)objc_msgSend(v0, "valueForPreferenceKey:", *MEMORY[0x24BEB5238]), "integerValue"));
}

uint64_t TIGetWubiStandardName(unsigned int a1)
{
  if (a1 > 2)
    return 0;
  else
    return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", off_24E732888[a1], &stru_24E732B90, CFSTR("Preferences_wubi"));
}

id TIUIGetMultilingualIDFromInputMode()
{
  void *v0;
  void *v1;

  TIInputModeGetComponentsFromIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("ml"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id TIUIInputModeGetMultilingualSet(uint64_t a1)
{
  return TIUIInputModeGetMultilingualSetFromInputModes(a1, 0);
}

id TIUIInputModeGetMultilingualSetFromInputModes(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  TIUIGetMultilingualIDFromInputMode();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v5 = v2;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "enabledInputModeIdentifiers");
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11);
          TIUIGetMultilingualIDFromInputMode();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v3, "isEqualToString:", v13, (_QWORD)v15))
            objc_msgSend(v4, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
  else
  {
    v4 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v4;
}

uint64_t TIUIGetMultlingualSetsAreEqual(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  TIUIGetLanguagesForMultilingualSet(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  TIUIGetLanguagesForMultilingualSet(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToSet:", v6))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v11), "isEqualToString:", CFSTR("vi_VN"), (_QWORD)v21) & 1) != 0)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v9)
            goto LABEL_4;
          goto LABEL_10;
        }
      }

      TIUIGetOrderedLanguagesForMultilingualSet(v3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      TIUIGetOrderedLanguagesForMultilingualSet(v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqualToArray:", v13);

      if (!v14)
        goto LABEL_14;
    }
    else
    {
LABEL_10:

    }
    objc_msgSend(v3, "firstObject", (_QWORD)v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    TIInputModeGetSWLayout();
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    TIInputModeGetSWLayout();
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 == v18)
      v19 = 1;
    else
      v19 = objc_msgSend(v16, "isEqualToString:", v18);

  }
  else
  {
LABEL_14:
    v19 = 0;
  }

  return v19;
}

id TIUIGetLanguagesForMultilingualSet(void *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x24BDBCF20];
  TIUIGetOrderedLanguagesForMultilingualSet(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id TIUIGetOrderedLanguagesForMultilingualSet(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v1, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        TIInputModeGetLanguageWithRegion();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8, v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

id TIUIKeyboardInputModeGetIdentifierFromComponents(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v1 = a1;
  TIInputModeGetNormalizedIdentifierFromComponents();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("sw"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(CFSTR("sw="), "stringByAppendingString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  objc_msgSend(v1, "objectForKey:", CFSTR("hw"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(CFSTR("hw="), "stringByAppendingString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  objc_msgSend(v1, "objectForKey:", CFSTR("ml"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(CFSTR("ml="), "stringByAppendingString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(";"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringByAppendingFormat:", CFSTR("@%@"), v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v11;
  }

  return v2;
}

id TIUIGetPairedInputModesForInputMode(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = TIUIGetPairedInputModesForInputMode___onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&TIUIGetPairedInputModesForInputMode___onceToken, &__block_literal_global_7);
  objc_msgSend((id)TIUIGetPairedInputModesForInputMode___pairedInputModes, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

BOOL TIUICanAddToMultilingualSet(void *a1)
{
  return TIUICanAddInputModeToMultilingualSet(0, a1);
}

BOOL TIUICanAddInputModeToMultilingualSet(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BOOL8 v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  GetDependentMultilingualInputModes();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        TIInputModeGetNormalizedIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v5, "containsObject:", v11, v14)
          && (!v3
           || objc_msgSend(v5, "containsObject:", v3)
           && ((objc_msgSend(&unk_24E73E168, "containsObject:", v3) & 1) != 0 || isH13ANEPresentOnIOS()))
          && (unint64_t)objc_msgSend(v6, "count") < 5)
        {

          v12 = 1;
          goto LABEL_16;
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }

  v12 = (unint64_t)objc_msgSend(v6, "count") < 2;
LABEL_16:

  return v12;
}

id GetDependentMultilingualInputModes()
{
  if (GetDependentMultilingualInputModes___onceToken != -1)
    dispatch_once(&GetDependentMultilingualInputModes___onceToken, &__block_literal_global_95);
  return (id)GetDependentMultilingualInputModes___dependentInputModes;
}

id TIUIGetAddableInputModesForMultilingualSet(void *a1)
{
  id v1;
  id v2;
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t i;
  uint64_t v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t m;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  char v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
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
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if (TIUICanAddInputModeToMultilingualSet(0, v1))
  {
    v2 = v1;
    v3 = (void *)objc_msgSend(v2, "mutableCopy");
    if (objc_msgSend(v3, "count"))
    {
      v4 = 0;
      do
      {
        objc_msgSend(v2, "objectAtIndexedSubscript:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        TIInputModeGetNormalizedIdentifier();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "replaceObjectAtIndex:withObject:", v4, v6);

        ++v4;
      }
      while (v4 < objc_msgSend(v3, "count"));
    }

    GetMultilingualInputModes();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v64;
      v12 = (void *)MEMORY[0x24BDBD1A8];
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v64 != v11)
            objc_enumerationMutation(v7);
          v14 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i);
          if (!objc_msgSend(v46, "containsObject:", v14))
          {
            v19 = v7;
            v18 = v12;
            goto LABEL_50;
          }
          GetDependentMultilingualInputModes();
          v15 = v10;
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "containsObject:", v14);

          v10 = v17 | v15;
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
        if (v9)
          continue;
        break;
      }
    }
    else
    {
      LOBYTE(v10) = 0;
    }
    v43 = v10;
    v44 = v2;
    v45 = v1;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    GetDependentMultilingualInputModes();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v60;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v60 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
          if ((objc_msgSend(v7, "containsObject:", v25) & 1) == 0)
          {
            GetRequiredInputModesForDependentInputMode(v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = 0u;
            v56 = 0u;
            v57 = 0u;
            v58 = 0u;
            v27 = v26;
            v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
            if (v28)
            {
              v29 = v28;
              v30 = *(_QWORD *)v56;
              while (2)
              {
                for (k = 0; k != v29; ++k)
                {
                  if (*(_QWORD *)v56 != v30)
                    objc_enumerationMutation(v27);
                  if ((objc_msgSend(v7, "containsObject:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * k)) & 1) != 0)
                  {

                    if ((objc_msgSend(&unk_24E73E168, "containsObject:", v25) & 1) != 0
                      || isH13ANEPresentOnIOS())
                    {
                      objc_msgSend(v47, "addObject:", v25);
                    }
                    goto LABEL_35;
                  }
                }
                v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
                if (v29)
                  continue;
                break;
              }
            }

LABEL_35:
          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
      }
      while (v22);
    }

    v1 = v45;
    v18 = v47;
    if ((v43 & 1) == 0)
    {
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      GetBilingualInputModes();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v52;
        do
        {
          for (m = 0; m != v34; ++m)
          {
            if (*(_QWORD *)v52 != v35)
              objc_enumerationMutation(v32);
            v37 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * m);
            if ((objc_msgSend(v7, "containsObject:", v37) & 1) == 0)
              objc_msgSend(v47, "addObject:", v37);
          }
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
        }
        while (v34);
      }

    }
    objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "enabledInputModeIdentifiers");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = (void *)MEMORY[0x24BDD1758];
    v48[0] = MEMORY[0x24BDAC760];
    v48[1] = 3221225472;
    v48[2] = __TIUIGetAddableInputModesForMultilingualSet_block_invoke;
    v48[3] = &unk_24E7328C8;
    v49 = v39;
    v50 = v44;
    v19 = v39;
    objc_msgSend(v40, "predicateWithBlock:", v48);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "filterUsingPredicate:", v41);

LABEL_50:
  }
  else
  {
    v18 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v18;
}

id GetMultilingualInputModes()
{
  void *v0;
  void *v1;
  void *v2;

  GetBilingualInputModes();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  GetDependentMultilingualInputModes();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "arrayByAddingObjectsFromArray:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id GetRequiredInputModesForDependentInputMode(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if (GetRequiredInputModesForDependentInputMode_onceToken != -1)
    dispatch_once(&GetRequiredInputModesForDependentInputMode_onceToken, &__block_literal_global_100);
  if (objc_msgSend((id)GetRequiredInputModesForDependentInputMode___transliterationInputModes, "containsObject:", v1))v2 = (id)GetRequiredInputModesForDependentInputMode___englishInputModes;
  else
    v2 = 0;

  return v2;
}

id GetBilingualInputModes()
{
  if (GetBilingualInputModes___onceToken != -1)
    dispatch_once(&GetBilingualInputModes___onceToken, &__block_literal_global_123);
  return (id)GetBilingualInputModes___bilingualInputModes;
}

id TIUIGetProposedMultilingualSetsForAddingInputMode(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  int v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  id v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  int v49;
  id v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t k;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t m;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v81;
  void *v82;
  id v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  id obj;
  id v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  uint64_t v112;
  void *v113;
  void *v114;
  _QWORD v115[3];
  _QWORD v116[3];
  void *v117;
  void *v118;
  _QWORD v119[3];
  _QWORD v120[3];
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  uint64_t v125;

  v125 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  GetMultilingualInputModes();
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v87, "containsObject:", v3))
  {
    v83 = v3;
    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = 0u;
    v105 = 0u;
    v106 = 0u;
    v107 = 0u;
    v81 = v4;
    obj = v4;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v123, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v105;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v105 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * i);
          TIInputModeGetNormalizedIdentifier();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v87, "containsObject:", v11))
          {
            TIUIGetMultilingualIDFromInputMode();
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v12;
            if (v12)
            {
              v14 = v12;
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("_"), v10);
              v14 = (id)objc_claimAutoreleasedReturnValue();
            }
            v15 = v14;

            objc_msgSend(v93, "objectForKeyedSubscript:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v16)
            {
              objc_msgSend(MEMORY[0x24BDBCEB8], "array");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v93, "setObject:forKeyedSubscript:", v16, v15);
            }
            objc_msgSend(v16, "addObject:", v10);
            objc_msgSend(v5, "addObject:", v15);

          }
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v123, 16);
      }
      while (v7);
    }

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    v84 = v5;
    v17 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v100, v122, 16);
    v3 = v83;
    if (v17)
    {
      v18 = v17;
      v86 = *(_QWORD *)v101;
      v19 = 0x24BDD1000;
      do
      {
        v20 = 0;
        v85 = v18;
        do
        {
          if (*(_QWORD *)v101 != v86)
            objc_enumerationMutation(v84);
          v21 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * v20);
          objc_msgSend(v93, "objectForKeyedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v21, "hasPrefix:", CFSTR("_")))
          {
            v23 = v3;
            v91 = v22;
            GetDependentMultilingualInputModes();
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "containsObject:", v23);

            v88 = v20;
            v89 = v22;
            if (v25)
            {
              if ((objc_msgSend(&unk_24E73E168, "containsObject:", v23) & 1) != 0
                || isH13ANEPresentOnIOS())
              {
                GetRequiredInputModesForDependentInputMode(v23);
                v26 = (id)objc_claimAutoreleasedReturnValue();
                v108 = 0u;
                v109 = 0u;
                v110 = 0u;
                v111 = 0u;
                v27 = v91;
                v28 = (id)objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v108, v124, 16);
                if (v28)
                {
                  v29 = *(_QWORD *)v109;
LABEL_27:
                  v30 = 0;
                  while (1)
                  {
                    if (*(_QWORD *)v109 != v29)
                      objc_enumerationMutation(v27);
                    v31 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * v30);
                    TIInputModeGetNormalizedIdentifier();
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    v33 = objc_msgSend(v26, "containsObject:", v32);

                    if ((v33 & 1) != 0)
                      break;
                    if (v28 == (id)++v30)
                    {
                      v28 = (id)objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v108, v124, 16);
                      if (v28)
                        goto LABEL_27;
                      goto LABEL_61;
                    }
                  }
LABEL_60:
                  v28 = v31;
LABEL_61:
                  v3 = v83;
                  v18 = v85;
                  v20 = v88;
                  v22 = v89;
                }

                goto LABEL_63;
              }
LABEL_57:
              v28 = 0;
            }
            else
            {
              GetBilingualInputModes();
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_msgSend(v36, "containsObject:", v23);

              if (!v37)
                goto LABEL_57;
              v110 = 0u;
              v111 = 0u;
              v108 = 0u;
              v109 = 0u;
              v26 = v91;
              v94 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v108, v124, 16);
              if (v94)
              {
                v38 = *(_QWORD *)v109;
                do
                {
                  for (j = 0; j != v94; ++j)
                  {
                    if (*(_QWORD *)v109 != v38)
                      objc_enumerationMutation(v26);
                    v31 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * j);
                    TIInputModeGetNormalizedIdentifier();
                    v27 = (id)objc_claimAutoreleasedReturnValue();
                    GetBilingualInputModes();
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v40, "containsObject:", v27) & 1) != 0)
                    {
                      objc_msgSend(MEMORY[0x24BDBCEA0], "baseLanguageFromLanguage:", v23);
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x24BDBCEA0], "baseLanguageFromLanguage:", v27);
                      v42 = v38;
                      v43 = v26;
                      v44 = v23;
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      v46 = objc_msgSend(v41, "isEqualToString:", v45);

                      v23 = v44;
                      v26 = v43;
                      v38 = v42;

                      if (!v46)
                      {
                        v19 = 0x24BDD1000uLL;
                        goto LABEL_60;
                      }
                    }
                    else
                    {

                    }
                    GetDependentMultilingualInputModes();
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v47, "containsObject:", v27) & 1) != 0)
                    {
                      GetRequiredInputModesForDependentInputMode(v27);
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      v49 = objc_msgSend(v48, "containsObject:", v23);

                      v19 = 0x24BDD1000;
                      if (v49
                        && ((objc_msgSend(&unk_24E73E168, "containsObject:", v27) & 1) != 0
                         || (isH13ANEPresentOnIOS() & 1) != 0))
                      {
                        goto LABEL_60;
                      }
                    }
                    else
                    {

                      v19 = 0x24BDD1000;
                    }

                  }
                  v94 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v108, v124, 16);
                }
                while (v94);
                v28 = 0;
                v3 = v83;
                v18 = v85;
                v20 = v88;
              }
              else
              {
                v28 = 0;
              }
              v22 = v89;
LABEL_63:

            }
            if (v28)
            {
              v95 = v28;
              v50 = obj;
              objc_msgSend(MEMORY[0x24BDBCEB8], "array");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v108 = 0u;
              v109 = 0u;
              v110 = 0u;
              v111 = 0u;
              v52 = v50;
              v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v108, v124, 16);
              if (v53)
              {
                v54 = v53;
                v55 = *(_QWORD *)v109;
                do
                {
                  for (k = 0; k != v54; ++k)
                  {
                    if (*(_QWORD *)v109 != v55)
                      objc_enumerationMutation(v52);
                    TIUIGetMultilingualIDFromInputMode();
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v57, "length"))
                    {
                      objc_msgSend(*(id *)(v19 + 1760), "numberWithInteger:", objc_msgSend(v57, "integerValue"));
                      v58 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v51, "addObject:", v58);

                    }
                  }
                  v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v108, v124, 16);
                }
                while (v54);
              }

              objc_msgSend(v51, "sortUsingSelector:", sel_compare_);
              objc_msgSend(v51, "lastObject");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = objc_msgSend(v59, "integerValue");

              objc_msgSend(*(id *)(v19 + 1760), "numberWithUnsignedInteger:", v60 + 1);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "stringValue");
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              GetInputModeIdentifierByMatchingLayoutsAndAddingMultilingualID(v95, 0, v35);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              GetInputModeIdentifierByMatchingLayoutsAndAddingMultilingualID(v23, v62, v35);
              v63 = objc_claimAutoreleasedReturnValue();
              TIUIGetPairedInputModesForInputMode(v23);
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v64, "count"))
              {
                TIInputModeGetNormalizedIdentifier();
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                TIUIGetPairedInputModesForInputMode(v65);
                v66 = objc_claimAutoreleasedReturnValue();

                v64 = (void *)v66;
              }
              if (objc_msgSend(v64, "count"))
              {
                v92 = (void *)v63;
                objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v63);
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                v96 = 0u;
                v97 = 0u;
                v98 = 0u;
                v99 = 0u;
                v68 = v64;
                v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v96, v121, 16);
                if (v69)
                {
                  v70 = v69;
                  v71 = *(_QWORD *)v97;
                  do
                  {
                    for (m = 0; m != v70; ++m)
                    {
                      if (*(_QWORD *)v97 != v71)
                        objc_enumerationMutation(v68);
                      GetInputModeIdentifierByMatchingLayoutsAndAddingMultilingualID(*(void **)(*((_QWORD *)&v96 + 1) + 8 * m), v62, v35);
                      v73 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v67, "addObject:", v73);

                    }
                    v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v96, v121, 16);
                  }
                  while (v70);
                }

                v118 = v95;
                v119[0] = CFSTR("current");
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v118, 1);
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                v120[0] = v74;
                v119[1] = CFSTR("updated");
                v117 = v62;
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v117, 1);
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                v119[2] = CFSTR("added");
                v120[1] = v75;
                v120[2] = v67;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v120, v119, 3);
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                v77 = v92;
              }
              else
              {
                v114 = v95;
                v115[0] = CFSTR("current");
                v77 = (void *)v63;
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v114, 1);
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                v116[0] = v67;
                v115[1] = CFSTR("updated");
                v113 = v62;
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v113, 1);
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                v116[1] = v74;
                v115[2] = CFSTR("added");
                v112 = v63;
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v112, 1);
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                v116[2] = v75;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v116, v115, 3);
                v76 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v82, "addObject:", v76);

              v3 = v83;
              v18 = v85;
              v20 = v88;
              v22 = v89;
              v28 = v95;
LABEL_87:

              goto LABEL_88;
            }
            goto LABEL_88;
          }
          if (!TIUICanAddInputModeToMultilingualSet(v3, v22))
            goto LABEL_89;
          objc_msgSend(v22, "firstObject");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          GetInputModeIdentifierByMatchingLayoutsAndAddingMultilingualID(v3, v34, v21);
          v28 = (id)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(obj, "containsObject:", v28) & 1) == 0)
          {
            TIUIGetProposedMultilingualSetByAddingInputMode(v3, v22);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (v35)
              objc_msgSend(v82, "addObject:", v35);
            goto LABEL_87;
          }
LABEL_88:

LABEL_89:
          ++v20;
        }
        while (v20 != v18);
        v18 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v100, v122, 16);
      }
      while (v18);
    }

    v78 = v82;
    objc_msgSend(v82, "indexesOfObjectsPassingTest:", &__block_literal_global_79);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v79, "count"))
      objc_msgSend(v82, "removeObjectsAtIndexes:", v79);

    v4 = v81;
  }
  else
  {
    v78 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v78;
}

uint64_t TIUIProposedInputModeGetCurrent(void *a1, const char *a2)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("current"));
}

id GetInputModeIdentifierByMatchingLayoutsAndAddingMultilingualID(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  TIInputModeGetComponentsFromIdentifier();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  if (v6)
  {
    TIInputModeGetComponentsFromIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v9, "objectForKey:", CFSTR("sw"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "length"))
  {
    +[TIKeyboardListController softwareLayoutsForBaseInputMode:](TIKeyboardListController, "softwareLayoutsForBaseInputMode:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("sw"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "length") && objc_msgSend(v12, "containsObject:", v13))
    {
      v14 = v13;
    }
    else
    {
      objc_msgSend(v12, "firstObject");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;

    objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("sw"));
    v11 = v15;
  }
  objc_msgSend(v9, "objectForKey:", CFSTR("hw"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "length"))
  {
    UIKeyboardGetSupportedHardwareKeyboardsForInputMode();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("hw"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "length") && objc_msgSend(v17, "containsObject:", v18))
    {
      v19 = v18;
    }
    else
    {
      UIKeyboardGetDefaultHardwareKeyboardForInputMode();
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    v20 = v19;

    objc_msgSend(v9, "setObject:forKeyedSubscript:", v20, CFSTR("hw"));
    v16 = v20;
  }
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("ml"));
  TIUIKeyboardInputModeGetIdentifierFromComponents(v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

id TIUIGetProposedMultilingualSetByAddingInputMode(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *v28;
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  TIUIGetMultilingualIDFromInputMode();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  GetInputModeIdentifierByMatchingLayoutsAndAddingMultilingualID(v3, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  TIUIGetPairedInputModesForInputMode(v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    v22 = v8;
    v23 = v3;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v15);
          objc_msgSend(v4, "firstObject");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          GetInputModeIdentifierByMatchingLayoutsAndAddingMultilingualID(v16, v17, v6);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "addObject:", v18);
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      }
      while (v13);
    }

    v31[0] = CFSTR("current");
    v31[1] = CFSTR("added");
    v32[0] = v4;
    v32[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v22;
    v3 = v23;
  }
  else
  {
    v29[1] = CFSTR("added");
    v30[0] = v4;
    v28 = v8;
    v29[0] = CFSTR("current");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v28, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (TIUIGetProposedInputModeIsValid(v19))
    v20 = v19;
  else
    v20 = 0;

  return v20;
}

uint64_t TIUIGetProposedInputModeIsValid(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  TIUIProposedInputModeGetMultilingualSet(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIInputModeGetMultilingualSetFromInputModesWithPreferredLanguages();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x24BDF6B40];
  +[TIKeyboardListController inputModes](TIKeyboardListController, "inputModes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "multilingualSetsFromInputModeIdentifiers:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "identifier", (_QWORD)v16);
        v12 = objc_claimAutoreleasedReturnValue();
        TIInputModeGetMultilingualSet();
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(v12) = TIUIGetMultlingualSetsAreEqual(v13, v3);
        if ((v12 & 1) != 0)
        {
          v14 = 0;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_11:

  return v14;
}

uint64_t TIUIProposedInputModeGetUpdated(void *a1, const char *a2)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("updated"));
}

uint64_t TIUIProposedInputModeGetAdded(void *a1, const char *a2)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("added"));
}

id TIUIProposedInputModeGetMultilingualSet(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = a1;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("current"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIUIGetInputModesByAddingProposedInputMode(v1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  TIUIInputModeGetMultilingualSetFromInputModes((uint64_t)v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id TIUIGetInputModesByAddingProposedInputMode(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("current"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("updated"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("added"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v5, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "indexOfObject:", v8);

    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v10 = v7;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v12; objc_msgSend(v4, "insertObject:atIndex:", v15, i + v9, (_QWORD)v22))
          {
            if (*(_QWORD *)v23 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i++);
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          v9 += i;
        }
        while (v12);
      }

    }
  }
  if (objc_msgSend(v6, "count", (_QWORD)v22) && objc_msgSend(v4, "count"))
  {
    v16 = 0;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v5, "indexOfObject:", v17);
      if (v18 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v19 = v18;
        if (v18 < objc_msgSend(v6, "count"))
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "replaceObjectAtIndex:withObject:", v16, v20);

        }
      }

      ++v16;
    }
    while (v16 < objc_msgSend(v4, "count"));
  }

  return v4;
}

uint64_t TIUIGetCountOfUserVisibleInputModes()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "enabledInputModeIdentifiers");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    while (1)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        TIUIGetMultilingualIDFromInputMode();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "length", v11))
        {
          if ((objc_msgSend(v2, "containsObject:", v9) & 1) != 0)
            goto LABEL_10;
          objc_msgSend(v2, "addObject:", v9);
        }
        ++v6;
LABEL_10:

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (!v5)
        goto LABEL_14;
    }
  }
  v6 = 0;
LABEL_14:

  return v6;
}

id TIUIGetLocalizedConcatenatedLanguageNamesForInputModes(void *a1)
{
  return TIUIGetLocalizedConcatenatedLanguageNamesForInputModesWithStyle(a1, 1);
}

id TIUIGetLocalizedConcatenatedLanguageNamesForInputModesWithStyle(void *a1, int a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
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
  uint64_t j;
  void *v25;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  int v36;
  void *v37;
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
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[TIKeyboardListController keyboardDisplayNameForIdentifier:](TIKeyboardListController, "keyboardDisplayNameForIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v36 = a2;
    v37 = v3;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enabledInputModeIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v43 != v11)
            objc_enumerationMutation(v8);
          TIInputModeGetLanguage();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          TIInputModeGetNormalizedIdentifier();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v15)
          {
            objc_msgSend(MEMORY[0x24BDBCEF0], "set");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, v13);
          }
          objc_msgSend(v15, "addObject:", v14);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v10);
    }

    objc_msgSend(v37, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    TIInputModeGetMultilingualSetFromInputModesWithPreferredLanguages();
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v18, "count"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v20 = v18;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v39;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v39 != v23)
            objc_enumerationMutation(v20);
          if ((TIInputModeIsMultilingualOnly() & 1) == 0)
          {
            TIInputModeGetLanguage();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "objectForKeyedSubscript:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "count");

            if (v27 >= 2)
            {
              TIInputModeGetNormalizedIdentifier();
              v28 = objc_claimAutoreleasedReturnValue();

              v25 = (void *)v28;
            }
            +[TIKeyboardListController keyboardDisplayNameForIdentifier:](TIKeyboardListController, "keyboardDisplayNameForIdentifier:", v25);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v29);

          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      }
      while (v22);
    }

    if (v36)
    {
      v30 = objc_msgSend(v19, "count");
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v30 == 2)
        v33 = CFSTR("LIST_SEPARATOR_2");
      else
        v33 = CFSTR("LIST_SEPARATOR");
      objc_msgSend(v31, "localizedStringForKey:value:table:", v33, &stru_24E732B90, CFSTR("Keyboard"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "componentsJoinedByString:", v34);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1640], "localizedStringByJoiningStrings:", v19);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v3 = v37;
  }

  return v5;
}

uint64_t TIUIMultilingualSetGetLanguageCount(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v1);
        v4 += TIInputModeIsMultilingualOnly() ^ 1;
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t TIUIMultilingualSetContainsTransliterationInputModes(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  char IsTransliteration;
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
  v1 = a1;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v9 != v3)
          objc_enumerationMutation(v1);
        TIInputModeGetNormalizedIdentifier();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        IsTransliteration = TIInputModeIsTransliteration();

        if ((IsTransliteration & 1) != 0)
        {
          v2 = 1;
          goto LABEL_11;
        }
      }
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_11:

  return v2;
}

void ShortcutsDidChange(uint64_t a1, uint64_t a2)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __ShortcutsDidChange_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void ManagedConfigurationLibrary_cold_1(_QWORD *a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *ManagedConfigurationLibrary(void)"), CFSTR("KeyboardController.m"), 62, CFSTR("%s"), *a1);
  __break(1u);
}

void __getMCProfileConnectionClass_block_invoke_cold_1()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMCProfileConnectionClass(void)_block_invoke"), CFSTR("KeyboardController.m"), 63, CFSTR("Unable to find class %s"), "MCProfileConnection");
  __break(1u);
}

void __getSFSpeechAssetManagerClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SpeechLibrary(void)"), CFSTR("TIKeyboardListController.m"), 57, CFSTR("%s"), *a1);
  __break(1u);
}

void __getSFSpeechAssetManagerClass_block_invoke_cold_2()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getSFSpeechAssetManagerClass(void)_block_invoke"), CFSTR("TIKeyboardListController.m"), 58, CFSTR("Unable to find class %s"), "SFSpeechAssetManager");
  __break(1u);
  AFDeviceHighestLanguageModelCapabilityIdentifier();
}

uint64_t AFDeviceHighestLanguageModelCapabilityIdentifier()
{
  return MEMORY[0x24BE08C50]();
}

uint64_t AFDictationRestricted()
{
  return MEMORY[0x24BE08CE8]();
}

uint64_t AFOfflineDictationCapable()
{
  return MEMORY[0x24BE08E48]();
}

uint64_t AFOfflineDictationStatusStringAssetId()
{
  return MEMORY[0x24BE08E58]();
}

uint64_t AFOfflineDictationStatusStringIsHighQualityModelInstalled()
{
  return MEMORY[0x24BE08E60]();
}

uint64_t AFOfflineDictationStatusStringIsHighQualityModelSupported()
{
  return MEMORY[0x24BE08E68]();
}

uint64_t AFOfflineDictationStatusStringIsInstalled()
{
  return MEMORY[0x24BE08E70]();
}

uint64_t AFOfflineDictationStatusStringIsInstalling()
{
  return MEMORY[0x24BE08E78]();
}

uint64_t AFOfflineDictationStatusStringIsOnDeviceSearchSupported()
{
  return MEMORY[0x24BE08E80]();
}

uint64_t BKSHIDKeyboardGetDeviceProperties()
{
  return MEMORY[0x24BE0B590]();
}

uint64_t BKSHIDKeyboardWantsStandardTypeOverride()
{
  return MEMORY[0x24BE0B598]();
}

uint64_t BKSHIDServicesCapsLockKeyHasLanguageSwitchLabel()
{
  return MEMORY[0x24BE0B5A8]();
}

uint64_t BKSHIDServicesGetHardwareKeyboardLanguage()
{
  return MEMORY[0x24BE0B5C0]();
}

uint64_t BKSHIDServicesProductIdentifierFromServiceProperties()
{
  return MEMORY[0x24BE0B5F8]();
}

uint64_t BKSHIDServicesSetStandardType()
{
  return MEMORY[0x24BE0B630]();
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x24BDBBA98](allocator, bundleURL);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t GSEventIsHardwareKeyboardAttached()
{
  return MEMORY[0x24BE3D5A8]();
}

CFArrayRef IOHIDEventSystemClientCopyServices(IOHIDEventSystemClientRef client)
{
  return (CFArrayRef)MEMORY[0x24BDD8360](client);
}

uint64_t IOHIDEventSystemClientCreateWithType()
{
  return MEMORY[0x24BDD8370]();
}

uint64_t IOHIDEventSystemClientRegisterDeviceMatchingBlock()
{
  return MEMORY[0x24BDD8380]();
}

uint64_t IOHIDEventSystemClientScheduleWithRunLoop()
{
  return MEMORY[0x24BDD83C0]();
}

uint64_t IOHIDEventSystemClientSetMatching()
{
  return MEMORY[0x24BDD83D8]();
}

CFTypeRef IOHIDServiceClientCopyProperty(IOHIDServiceClientRef service, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x24BDD8530](service, key);
}

CFTypeRef IOHIDServiceClientGetRegistryID(IOHIDServiceClientRef service)
{
  return (CFTypeRef)MEMORY[0x24BDD8538](service);
}

uint64_t IOHIDServiceClientRegisterRemovalBlock()
{
  return MEMORY[0x24BDD8540]();
}

Boolean IOHIDServiceClientSetProperty(IOHIDServiceClientRef service, CFStringRef key, CFTypeRef property)
{
  return MEMORY[0x24BDD8558](service, key, property);
}

uint64_t IXACanLogMessageAtLevel()
{
  return MEMORY[0x24BEB4CD0]();
}

uint64_t IXAFeedbackLogFacility()
{
  return MEMORY[0x24BEB4CE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t SFLocalizableWAPIStringKeyForKey()
{
  return MEMORY[0x24BE85770]();
}

uint64_t TCCAccessCopyInformationForBundle()
{
  return MEMORY[0x24BEB3778]();
}

uint64_t TCCAccessSetForBundle()
{
  return MEMORY[0x24BEB37E8]();
}

uint64_t TIGetAddKeyboardUsesPickerForInputMode()
{
  return MEMORY[0x24BEB4F60]();
}

uint64_t TIGetInputModeProperties()
{
  return MEMORY[0x24BEB4F68]();
}

uint64_t TIInputModeGetBaseLanguage()
{
  return MEMORY[0x24BEB4F88]();
}

uint64_t TIInputModeGetComponentsFromIdentifier()
{
  return MEMORY[0x24BEB4F90]();
}

uint64_t TIInputModeGetLanguage()
{
  return MEMORY[0x24BEB4F98]();
}

uint64_t TIInputModeGetLanguageWithRegion()
{
  return MEMORY[0x24BEB4FA0]();
}

uint64_t TIInputModeGetMultilingualID()
{
  return MEMORY[0x24BEB4FA8]();
}

uint64_t TIInputModeGetMultilingualSet()
{
  return MEMORY[0x24BEB4FB0]();
}

uint64_t TIInputModeGetMultilingualSetFromInputModes()
{
  return MEMORY[0x24BEB4FB8]();
}

uint64_t TIInputModeGetMultilingualSetFromInputModesWithPreferredLanguages()
{
  return MEMORY[0x24BEB4FC0]();
}

uint64_t TIInputModeGetNormalizedIdentifier()
{
  return MEMORY[0x24BEB4FC8]();
}

uint64_t TIInputModeGetNormalizedIdentifierFromComponents()
{
  return MEMORY[0x24BEB4FD0]();
}

uint64_t TIInputModeGetSWLayout()
{
  return MEMORY[0x24BEB4FD8]();
}

uint64_t TIInputModeGetVariant()
{
  return MEMORY[0x24BEB4FE0]();
}

uint64_t TIInputModeIsMultilingualOnly()
{
  return MEMORY[0x24BEB4FE8]();
}

uint64_t TIInputModeIsTransliteration()
{
  return MEMORY[0x24BEB4FF0]();
}

uint64_t TIStatisticDistributionPushValue()
{
  return MEMORY[0x24BEB5170]();
}

uint64_t TIStatisticGetKey()
{
  return MEMORY[0x24BEB5180]();
}

uint64_t TIStatisticGetKeyForInputMode()
{
  return MEMORY[0x24BEB5190]();
}

uint64_t TIStatisticScalarIncrement()
{
  return MEMORY[0x24BEB51C8]();
}

uint64_t TIStatisticScalarSetBoolean()
{
  return MEMORY[0x24BEB51D0]();
}

uint64_t TIStatisticScalarSetValue()
{
  return MEMORY[0x24BEB51D8]();
}

uint64_t TIStatisticShouldSample()
{
  return MEMORY[0x24BEB51E8]();
}

uint64_t TUIDictationTitle()
{
  return MEMORY[0x24BEB5B08]();
}

uint64_t TUIKeyboardDisplayNameFromIdentifier()
{
  return MEMORY[0x24BEB5B20]();
}

uint64_t TUIKeyboardDisplayNameFromIdentifierForContext()
{
  return MEMORY[0x24BEB5B28]();
}

uint64_t TUIKeyboardTitle()
{
  return MEMORY[0x24BEB5B30]();
}

uint64_t TUIKeyboardTitleInLanguage()
{
  return MEMORY[0x24BEB5B38]();
}

uint64_t UIKeyboardCheckSpellingPossibleForInputMode()
{
  return MEMORY[0x24BDF79D8]();
}

uint64_t UIKeyboardDeviceSupportsSplit()
{
  return MEMORY[0x24BDF79E8]();
}

uint64_t UIKeyboardGetActiveInputModes()
{
  return MEMORY[0x24BDF7A28]();
}

uint64_t UIKeyboardGetCurrentInputMode()
{
  return MEMORY[0x24BDF7A38]();
}

uint64_t UIKeyboardGetDefaultHardwareKeyboardForInputMode()
{
  return MEMORY[0x24BDF7A48]();
}

uint64_t UIKeyboardGetSupportedHardwareKeyboardsForInputMode()
{
  return MEMORY[0x24BDF7A58]();
}

uint64_t UIKeyboardGetSupportedInputModes()
{
  return MEMORY[0x24BDF7A60]();
}

uint64_t UIKeyboardGetSupportedSoftwareKeyboardsForInputMode()
{
  return MEMORY[0x24BDF7A68]();
}

uint64_t UIKeyboardInputModeGetBaseLanguage()
{
  return MEMORY[0x24BDF7A78]();
}

uint64_t UIKeyboardInputModeGetComponentsFromIdentifier()
{
  return MEMORY[0x24BDF7A80]();
}

uint64_t UIKeyboardInputModeGetIdentifierFromComponents()
{
  return MEMORY[0x24BDF7A88]();
}

uint64_t UIKeyboardInputModeGetLanguageWithRegion()
{
  return MEMORY[0x24BDF7A98]();
}

uint64_t UIKeyboardInputModeGetNormalizedIdentifier()
{
  return MEMORY[0x24BDF7AA0]();
}

uint64_t UIKeyboardInputModeGetRegion()
{
  return MEMORY[0x24BDF7AB0]();
}

uint64_t UIKeyboardInputModeGetVariant()
{
  return MEMORY[0x24BDF7AB8]();
}

uint64_t UIKeyboardInputModeWithNewHWLayout()
{
  return MEMORY[0x24BDF7AC0]();
}

uint64_t UIKeyboardInputModeWithNewSWLayout()
{
  return MEMORY[0x24BDF7AC8]();
}

uint64_t UIKeyboardInputModesMatchingMode()
{
  return MEMORY[0x24BDF7AD8]();
}

uint64_t UIKeyboardLayoutDefaultTypeForInputModeIsASCIICapable()
{
  return MEMORY[0x24BDF7B00]();
}

uint64_t UIKeyboardLayoutSupportsASCIIToggleKey()
{
  return MEMORY[0x24BDF7B08]();
}

uint64_t UIKeyboardPredictionEnabledForInputModes()
{
  return MEMORY[0x24BDF7B28]();
}

uint64_t UISystemFontBoldForSize()
{
  return MEMORY[0x24BDF7DC8]();
}

uint64_t UISystemRootDirectory()
{
  return MEMORY[0x24BDF7DD0]();
}

uint64_t _AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode()
{
  return MEMORY[0x24BE09438]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t isH13ANEPresentOnIOS()
{
  return MEMORY[0x24BEB5248]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x24BEDD0D8](location);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

