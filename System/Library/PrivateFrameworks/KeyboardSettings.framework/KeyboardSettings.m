void *LocStringKeyBasedOnLanguageCount(void *result, unint64_t a2, uint64_t a3)
{
  if (a2 >= 2)
    result = (void *)objc_msgSend(result, "stringByAppendingString:", CFSTR("S"));
  if (a3)
    return (void *)objc_msgSend(result, "stringByAppendingString:", a3);
  return result;
}

void sub_2401A92E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose_(uint64_t a1)
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

void sub_2401AA228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t HardwareKeyboardAvailabilityChanged(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_hardwareKeyboardAvailabilityChanged, 0, 0);
}

void sub_2401AAFB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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
  v6 = __Block_byref_object_copy_;
  v7 = __Block_byref_object_dispose_;
  v0 = getMCProfileConnectionClass_softClass;
  v8 = getMCProfileConnectionClass_softClass;
  if (!getMCProfileConnectionClass_softClass)
  {
    v2[0] = MEMORY[0x24BDAC760];
    v2[1] = 3221225472;
    v2[2] = __getMCProfileConnectionClass_block_invoke;
    v2[3] = &unk_251079800;
    v2[4] = &v3;
    __getMCProfileConnectionClass_block_invoke((uint64_t)v2);
    v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_2401AC284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ManagedConfigurationLibrary()
{
  uint64_t v0;
  void *v2;

  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
    ManagedConfigurationLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = ManagedConfigurationLibraryCore_frameworkLibrary;
  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
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

void sub_2401B178C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,id location)
{
  id *v54;

  objc_destroyWeak(v54);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
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

uint64_t HardwareKeyboardAvailabilityChanged_0(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_hardwareKeyboardAvailabilityChanged, 0, 0);
}

const __CFString *TUIKeyboardDisplayNameFromIdentifierForContext(void *a1, uint64_t a2)
{
  void *v4;
  void *v6;
  uint64_t LanguageWithRegion;
  void *v8;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEBD6E8], "keyboardInputModeWithIdentifier:", a1);
  if (objc_msgSend(v4, "isExtensionInputMode"))
    return (const __CFString *)objc_msgSend(v4, "safe__extendedDisplayName");
  if ((objc_msgSend(a1, "hasPrefix:", *MEMORY[0x24BEBE4F8]) & 1) != 0)
    return CFSTR("QWERTY");
  TIInputModeGetNormalizedIdentifier();
  LanguageWithRegion = TIInputModeGetLanguageWithRegion();
  v6 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", LanguageWithRegion, &stru_25107A038, CFSTR("KeyboardTitles"));
  if ((objc_msgSend(v6, "isEqualToString:", LanguageWithRegion) & 1) == 0 && v6)
    return (const __CFString *)v6;
  v8 = (void *)objc_msgSend(MEMORY[0x24BDBCEA0], "localeForBundleLanguage:", objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"));
  if (_ReducedLanguageIdentifierForKeyboardLanguage___onceToken != -1)
    dispatch_once(&_ReducedLanguageIdentifierForKeyboardLanguage___onceToken, &__block_literal_global_182);
  if ((unint64_t)objc_msgSend((id)_ReducedLanguageIdentifierForKeyboardLanguage___languageCounts, "countForObject:", objc_msgSend(MEMORY[0x24BDBCEA0], "baseLanguageFromLanguage:", LanguageWithRegion)) <= 1)LanguageWithRegion = objc_msgSend(MEMORY[0x24BDBCEA0], "baseLanguageFromLanguage:", LanguageWithRegion);
  return (const __CFString *)objc_msgSend(v8, "localizedStringForLanguage:context:", LanguageWithRegion, a2);
}

void sub_2401B7C9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 152), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__0(uint64_t a1)
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
  v6 = __Block_byref_object_copy__0;
  v7 = __Block_byref_object_dispose__0;
  v0 = getSFSpeechAssetManagerClass_softClass;
  v8 = getSFSpeechAssetManagerClass_softClass;
  if (!getSFSpeechAssetManagerClass_softClass)
  {
    v2[0] = MEMORY[0x24BDAC760];
    v2[1] = 3221225472;
    v2[2] = __getSFSpeechAssetManagerClass_block_invoke;
    v2[3] = &unk_251079800;
    v2[4] = &v3;
    __getSFSpeechAssetManagerClass_block_invoke((uint64_t)v2);
    v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_2401B9DD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSFSpeechAssetManagerClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!SpeechLibraryCore_frameworkLibrary)
  {
    SpeechLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SpeechLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getSFSpeechAssetManagerClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("SFSpeechAssetManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    goto LABEL_6;
  getSFSpeechAssetManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
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
      +[KSHardwareKeyboardController IOHIDKeyboardLanguageToCapsLockKeyLabel](KSHardwareKeyboardController, "IOHIDKeyboardLanguageToCapsLockKeyLabel");
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
  objc_msgSend(v17, "localizedStringForKey:value:table:", v9, &stru_25107A038, CFSTR("Keyboard"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  +[KSKeyboardListController attributedTitleForSymbolName:cellTitle:](KSKeyboardListController, "attributedTitleForSymbolName:cellTitle:", v14, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

void sub_2401BE40C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,id location)
{
  id *v45;

  objc_destroyWeak(v45);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
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
  v34[0] = &unk_2510837E0;
  v34[1] = &unk_2510837F8;
  v33[2] = CFSTR("Option");
  v33[3] = CFSTR("Command");
  v34[2] = &unk_251083810;
  v34[3] = &unk_251083828;
  v33[4] = CFSTR("Escape");
  v33[5] = CFSTR("Function");
  v34[4] = &unk_251083840;
  v34[5] = &unk_251083858;
  v33[6] = CFSTR("Globe");
  v33[7] = CFSTR("NoAction");
  v34[6] = &unk_251083870;
  v34[7] = &unk_251083888;
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

uint64_t KSInputModeIsChineseWubi()
{
  uint64_t result;

  result = objc_msgSend((id)TIInputModeGetBaseLanguage(), "isEqualToString:", CFSTR("zh"));
  if ((_DWORD)result)
    return objc_msgSend((id)TIInputModeGetVariant(), "isEqualToString:", CFSTR("Wubixing"));
  return result;
}

uint64_t KSGetCurrentWubiStandard()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  return objc_msgSend((id)objc_msgSend(v0, "valueForPreferenceKey:", *MEMORY[0x24BEB5238]), "integerValue");
}

void *KSGetWubiStandards()
{
  return &unk_2510838A0;
}

uint64_t KSGetCurrentWubiStandardName()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  return KSGetWubiStandardName(objc_msgSend((id)objc_msgSend(v0, "valueForPreferenceKey:", *MEMORY[0x24BEB5238]), "integerValue"));
}

uint64_t KSGetWubiStandardName(unsigned int a1)
{
  if (a1 > 2)
    return 0;
  else
    return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", off_251079BF8[a1], &stru_25107A038, CFSTR("Preferences_wubi"));
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

void sub_2401C3644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
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
      objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController");
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

uint64_t TIUIInputModeIsMultilingualOnly()
{
  void *v0;
  uint64_t v1;

  TIInputModeGetNormalizedIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(&unk_2510838B8, "containsObject:", v0);

  return v1;
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
          && (!v3 || objc_msgSend(v5, "containsObject:", v3))
          && (unint64_t)objc_msgSend(v6, "count") < 5)
        {

          v12 = 1;
          goto LABEL_14;
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
LABEL_14:

  return v12;
}

id GetDependentMultilingualInputModes()
{
  if (GetDependentMultilingualInputModes___onceToken != -1)
    dispatch_once(&GetDependentMultilingualInputModes___onceToken, &__block_literal_global_6);
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
  char v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  uint64_t v31;
  id v33;
  id obj;
  id v35;
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
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
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
    v33 = v1;

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v49 != v11)
            objc_enumerationMutation(v7);
          v13 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
          GetDependentMultilingualInputModes();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v13) = objc_msgSend(v14, "containsObject:", v13);

          v10 |= v13;
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
      }
      while (v9);
    }
    else
    {
      v10 = 0;
    }

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v35 = (id)objc_claimAutoreleasedReturnValue();
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    GetDependentMultilingualInputModes();
    obj = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v45;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v45 != v17)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
          if ((objc_msgSend(v7, "containsObject:", v19) & 1) == 0)
          {
            GetRequiredInputModesForDependentInputMode(v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = 0u;
            v41 = 0u;
            v42 = 0u;
            v43 = 0u;
            v21 = v20;
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
            if (v22)
            {
              v23 = v22;
              v24 = *(_QWORD *)v41;
              while (2)
              {
                for (k = 0; k != v23; ++k)
                {
                  if (*(_QWORD *)v41 != v24)
                    objc_enumerationMutation(v21);
                  if ((objc_msgSend(v7, "containsObject:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * k)) & 1) != 0)
                  {

                    objc_msgSend(v35, "addObject:", v19);
                    goto LABEL_31;
                  }
                }
                v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
                if (v23)
                  continue;
                break;
              }
            }

LABEL_31:
          }
        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
      }
      while (v16);
    }

    if ((v10 & 1) == 0)
    {
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      GetBilingualInputModes();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v37;
        do
        {
          for (m = 0; m != v28; ++m)
          {
            if (*(_QWORD *)v37 != v29)
              objc_enumerationMutation(v26);
            v31 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * m);
            if ((objc_msgSend(v7, "containsObject:", v31) & 1) == 0)
              objc_msgSend(v35, "addObject:", v31);
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
        }
        while (v28);
      }

    }
    v1 = v33;
  }
  else
  {
    v35 = (id)MEMORY[0x24BDBD1A8];
  }

  return v35;
}

id GetRequiredInputModesForDependentInputMode(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if (GetRequiredInputModesForDependentInputMode_onceToken != -1)
    dispatch_once(&GetRequiredInputModesForDependentInputMode_onceToken, &__block_literal_global_65);
  if (objc_msgSend((id)GetRequiredInputModesForDependentInputMode___transliterationInputModes, "containsObject:", v1))v2 = (id)GetRequiredInputModesForDependentInputMode___englishInputModes;
  else
    v2 = 0;

  return v2;
}

id GetBilingualInputModes()
{
  if (GetBilingualInputModes___onceToken != -1)
    dispatch_once(&GetBilingualInputModes___onceToken, &__block_literal_global_88);
  return (id)GetBilingualInputModes___bilingualInputModes;
}

id TIUIGetProposedMultilingualSetsForAddingInputMode(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  int v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  char v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  id v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  char v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t k;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t m;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  id v86;
  id v87;
  id v88;
  id v89;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  void *v96;
  id obj;
  void *v98;
  uint64_t v99;
  void *v100;
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
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  uint64_t v117;
  void *v118;
  id v119;
  _QWORD v120[3];
  _QWORD v121[3];
  void *v122;
  id v123;
  _QWORD v124[3];
  _QWORD v125[3];
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  uint64_t v130;

  v130 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  GetBilingualInputModes();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  GetDependentMultilingualInputModes();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v96 = v7;
  if (objc_msgSend(v7, "containsObject:", v3))
  {
    v89 = v3;
    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = 0u;
    v110 = 0u;
    v111 = 0u;
    v112 = 0u;
    v86 = v4;
    obj = v4;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v128, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v110;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v110 != v11)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * i);
          TIInputModeGetNormalizedIdentifier();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v96, "containsObject:", v14))
          {
            TIUIGetMultilingualIDFromInputMode();
            v15 = objc_claimAutoreleasedReturnValue();
            v16 = (void *)v15;
            if (v15)
              v17 = (__CFString *)v15;
            else
              v17 = &stru_25107A038;
            v18 = v17;

            objc_msgSend(v98, "objectForKeyedSubscript:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v19)
            {
              objc_msgSend(MEMORY[0x24BDBCEB8], "array");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v98, "setObject:forKeyedSubscript:", v19, v18);
            }
            objc_msgSend(v19, "addObject:", v13, v86);
            objc_msgSend(v8, "addObject:", v18);

          }
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v128, 16);
      }
      while (v10);
    }

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v87 = (id)objc_claimAutoreleasedReturnValue();
    v105 = 0u;
    v106 = 0u;
    v107 = 0u;
    v108 = 0u;
    v88 = v8;
    v3 = v89;
    v93 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v105, v127, 16);
    if (v93)
    {
      v20 = 0x24BDD1000uLL;
      v92 = *(_QWORD *)v106;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v106 != v92)
            objc_enumerationMutation(v88);
          v22 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * v21);
          objc_msgSend(v98, "objectForKeyedSubscript:", v22, v86);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v22, "isEqualToString:", &stru_25107A038))
          {
            v24 = v3;
            v25 = v23;
            GetDependentMultilingualInputModes();
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "containsObject:", v24);

            v94 = v23;
            v95 = v21;
            v90 = v25;
            if (v27)
            {
              GetRequiredInputModesForDependentInputMode(v24);
              v28 = (id)objc_claimAutoreleasedReturnValue();
              v113 = 0u;
              v114 = 0u;
              v115 = 0u;
              v116 = 0u;
              v29 = v25;
              v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v113, v129, 16);
              if (v30)
              {
                v31 = v30;
                v32 = v24;
                v33 = *(_QWORD *)v114;
                while (2)
                {
                  for (j = 0; j != v31; ++j)
                  {
                    if (*(_QWORD *)v114 != v33)
                      objc_enumerationMutation(v29);
                    v35 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * j);
                    TIInputModeGetNormalizedIdentifier();
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    v37 = objc_msgSend(v28, "containsObject:", v36);

                    if ((v37 & 1) != 0)
                    {
                      v24 = v32;
                      goto LABEL_53;
                    }
                  }
                  v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v113, v129, 16);
                  if (v31)
                    continue;
                  break;
                }
                v38 = 0;
                v23 = v94;
                v21 = v95;
                v24 = v32;
                v3 = v89;
              }
              else
              {
                v38 = 0;
              }
LABEL_57:

              goto LABEL_58;
            }
            GetBilingualInputModes();
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v41, "containsObject:", v24);

            if (!v42)
            {
              v38 = 0;
              goto LABEL_59;
            }
            v115 = 0u;
            v116 = 0u;
            v113 = 0u;
            v114 = 0u;
            v28 = v25;
            v99 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v113, v129, 16);
            if (!v99)
            {
              v38 = 0;
              goto LABEL_86;
            }
            v43 = *(_QWORD *)v114;
LABEL_38:
            v44 = 0;
            while (1)
            {
              if (*(_QWORD *)v114 != v43)
                objc_enumerationMutation(v28);
              v35 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * v44);
              TIInputModeGetNormalizedIdentifier();
              v29 = (id)objc_claimAutoreleasedReturnValue();
              GetBilingualInputModes();
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v45, "containsObject:", v29) & 1) != 0)
              {
                objc_msgSend(MEMORY[0x24BDBCEA0], "baseLanguageFromLanguage:", v24);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDBCEA0], "baseLanguageFromLanguage:", v29);
                v47 = v28;
                v48 = v43;
                v49 = v24;
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                v51 = objc_msgSend(v46, "isEqualToString:", v50);

                v24 = v49;
                v43 = v48;
                v28 = v47;

                if (!v51)
                {
                  v3 = v89;
                  v20 = 0x24BDD1000;
LABEL_54:
                  v38 = v35;
                  v23 = v94;
                  v21 = v95;
                  goto LABEL_57;
                }
              }
              else
              {

              }
              GetDependentMultilingualInputModes();
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v52, "containsObject:", v29) & 1) != 0)
              {
                GetRequiredInputModesForDependentInputMode(v29);
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                v54 = objc_msgSend(v53, "containsObject:", v24);

                v20 = 0x24BDD1000;
                if ((v54 & 1) != 0)
                {
LABEL_53:
                  v3 = v89;
                  goto LABEL_54;
                }
              }
              else
              {

                v20 = 0x24BDD1000;
              }

              if (v99 == ++v44)
              {
                v99 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v113, v129, 16);
                if (v99)
                  goto LABEL_38;
                v38 = 0;
                v3 = v89;
LABEL_86:
                v23 = v94;
                v21 = v95;
LABEL_58:

LABEL_59:
                if (v38)
                {
                  v55 = v24;
                  v56 = obj;
                  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  v113 = 0u;
                  v114 = 0u;
                  v115 = 0u;
                  v116 = 0u;
                  v58 = v56;
                  v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v113, v129, 16);
                  if (v59)
                  {
                    v60 = v59;
                    v61 = *(_QWORD *)v114;
                    do
                    {
                      for (k = 0; k != v60; ++k)
                      {
                        if (*(_QWORD *)v114 != v61)
                          objc_enumerationMutation(v58);
                        TIUIGetMultilingualIDFromInputMode();
                        v63 = (void *)objc_claimAutoreleasedReturnValue();
                        if (objc_msgSend(v63, "length"))
                        {
                          objc_msgSend(*(id *)(v20 + 1760), "numberWithInteger:", objc_msgSend(v63, "integerValue"));
                          v64 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v57, "addObject:", v64);

                        }
                      }
                      v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v113, v129, 16);
                    }
                    while (v60);
                  }

                  objc_msgSend(v57, "sortUsingSelector:", sel_compare_);
                  objc_msgSend(v57, "lastObject");
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  v66 = objc_msgSend(v65, "integerValue");

                  v67 = v66 + 1;
                  objc_msgSend(*(id *)(v20 + 1760), "numberWithUnsignedInteger:", v66 + 1);
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v57, "containsObject:", v68))
                    TIUIGetProposedMultilingualSetsForAddingInputMode_cold_1();

                  objc_msgSend(*(id *)(v20 + 1760), "numberWithUnsignedInteger:", v67);
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v69, "stringValue");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();

                  GetInputModeIdentifierByMatchingLayoutsAndAddingMultilingualID(v38, 0, v40);
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  GetInputModeIdentifierByMatchingLayoutsAndAddingMultilingualID(v55, v70, v40);
                  v71 = objc_claimAutoreleasedReturnValue();
                  GetPairedInputModesForInputMode(v55);
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  v100 = v72;
                  if (objc_msgSend(v72, "count"))
                  {
                    v91 = (void *)v71;
                    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v71);
                    v73 = (void *)objc_claimAutoreleasedReturnValue();
                    v101 = 0u;
                    v102 = 0u;
                    v103 = 0u;
                    v104 = 0u;
                    v74 = v72;
                    v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v101, v126, 16);
                    if (v75)
                    {
                      v76 = v75;
                      v77 = *(_QWORD *)v102;
                      do
                      {
                        for (m = 0; m != v76; ++m)
                        {
                          if (*(_QWORD *)v102 != v77)
                            objc_enumerationMutation(v74);
                          GetInputModeIdentifierByMatchingLayoutsAndAddingMultilingualID(*(void **)(*((_QWORD *)&v101 + 1) + 8 * m), v70, v40);
                          v79 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v73, "addObject:", v79);

                        }
                        v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v101, v126, 16);
                      }
                      while (v76);
                    }

                    v123 = v38;
                    v124[0] = CFSTR("current");
                    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v123, 1);
                    v80 = (void *)objc_claimAutoreleasedReturnValue();
                    v125[0] = v80;
                    v124[1] = CFSTR("updated");
                    v122 = v70;
                    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v122, 1);
                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                    v124[2] = CFSTR("added");
                    v125[1] = v81;
                    v125[2] = v73;
                    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v125, v124, 3);
                    v82 = (void *)objc_claimAutoreleasedReturnValue();
                    v3 = v89;
                    v83 = v91;
                  }
                  else
                  {
                    v119 = v38;
                    v120[0] = CFSTR("current");
                    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v119, 1);
                    v73 = (void *)objc_claimAutoreleasedReturnValue();
                    v121[0] = v73;
                    v120[1] = CFSTR("updated");
                    v118 = v70;
                    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v118, 1);
                    v80 = (void *)objc_claimAutoreleasedReturnValue();
                    v121[1] = v80;
                    v120[2] = CFSTR("added");
                    v117 = v71;
                    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v117, 1);
                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                    v121[2] = v81;
                    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v121, v120, 3);
                    v83 = (void *)v71;
                    v82 = (void *)objc_claimAutoreleasedReturnValue();
                    v3 = v89;
                  }
                  objc_msgSend(v87, "addObject:", v82);

                  v23 = v94;
                  v21 = v95;
LABEL_81:

                }
                goto LABEL_82;
              }
            }
          }
          if (TIUICanAddInputModeToMultilingualSet(v3, v23))
          {
            objc_msgSend(v23, "firstObject");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            GetInputModeIdentifierByMatchingLayoutsAndAddingMultilingualID(v3, v39, v22);
            v38 = (id)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(obj, "containsObject:", v38) & 1) == 0)
            {
              TIUIGetProposedMultilingualSetByAddingInputMode(v3, v23);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v87, "addObject:", v40);
              goto LABEL_81;
            }
LABEL_82:

          }
          ++v21;
        }
        while (v21 != v93);
        v84 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v105, v127, 16);
        v93 = v84;
      }
      while (v84);
    }

    v4 = v86;
  }
  else
  {
    v87 = (id)MEMORY[0x24BDBD1A8];
  }

  return v87;
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
    +[KSKeyboardListController softwareLayoutsForBaseInputMode:](KSKeyboardListController, "softwareLayoutsForBaseInputMode:", v5);
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

id GetPairedInputModesForInputMode(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = GetPairedInputModesForInputMode___onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&GetPairedInputModesForInputMode___onceToken, &__block_literal_global_93_0);
  objc_msgSend((id)GetPairedInputModesForInputMode___pairedInputModes, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
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

  GetPairedInputModesForInputMode(v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    v21 = v8;
    v22 = v3;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v24;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v15);
          objc_msgSend(v4, "firstObject");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          GetInputModeIdentifierByMatchingLayoutsAndAddingMultilingualID(v16, v17, v6);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "addObject:", v18);
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
      }
      while (v13);
    }

    v30[0] = CFSTR("current");
    v30[1] = CFSTR("added");
    v31[0] = v4;
    v31[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v21;
    v3 = v22;
  }
  else
  {
    v28[1] = CFSTR("added");
    v29[0] = v4;
    v27 = v8;
    v28[0] = CFSTR("current");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v27, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

uint64_t TIUIProposedInputModeGetCurrent(void *a1, const char *a2)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("current"));
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
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("current"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("updated"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("added"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v6, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "indexOfObject:", v9);

    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      TIUIGetInputModesByAddingProposedInputMode_cold_3();
    v24 = v4;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v13; objc_msgSend(v5, "insertObject:atIndex:", v16, i + v10))
        {
          if (*(_QWORD *)v26 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i++);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        v10 += i;
      }
      while (v13);
    }

    v4 = v24;
  }
  if (objc_msgSend(v7, "count"))
  {
    v17 = objc_msgSend(v6, "count");
    if (v17 != objc_msgSend(v7, "count"))
      TIUIGetInputModesByAddingProposedInputMode_cold_2();
    if (objc_msgSend(v5, "count"))
    {
      v18 = 0;
      do
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v6, "indexOfObject:", v19);
        if (v20 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v21 = v20;
          if (v20 >= objc_msgSend(v7, "count"))
            TIUIGetInputModesByAddingProposedInputMode_cold_1();
          if (v21 < objc_msgSend(v7, "count"))
          {
            objc_msgSend(v7, "objectAtIndexedSubscript:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "replaceObjectAtIndex:withObject:", v18, v22);

          }
        }

        ++v18;
      }
      while (v18 < objc_msgSend(v5, "count"));
    }
  }

  return v5;
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
  objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController");
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
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v1, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        if ((TIUIInputModeIsMultilingualOnly() & 1) == 0)
        {
          TIInputModeGetLanguageWithRegion();
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          +[KSKeyboardListController keyboardDisplayNameForIdentifier:](KSKeyboardListController, "keyboardDisplayNameForIdentifier:", v8, v12);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v2, "addObject:", v9);
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x24BDD1640], "localizedStringByJoiningStrings:", v2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void *TIDownloadButton()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BEBD660];
  v4[0] = objc_msgSend(MEMORY[0x24BEBD4B8], "tintColor");
  v1 = objc_msgSend(v0, "configurationWithPaletteColors:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1));
  v2 = (void *)objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 0);
  objc_msgSend(v2, "setPreferredSymbolConfiguration:forImageInState:", v1, 0);
  objc_msgSend(v2, "setImage:forState:", objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("icloud.and.arrow.down")), 0);
  objc_msgSend(v2, "sizeToFit");
  return v2;
}

uint64_t KSInputModeIsChineseShuangpin()
{
  uint64_t result;

  result = objc_msgSend((id)TIInputModeGetBaseLanguage(), "isEqualToString:", CFSTR("zh"));
  if ((_DWORD)result)
    return objc_msgSend((id)TIInputModeGetVariant(), "isEqualToString:", CFSTR("Shuangpin"));
  return result;
}

BOOL KSCurrentShuangpinTypeUsesSemicolon()
{
  void *v0;
  int v1;

  v0 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v1 = objc_msgSend((id)objc_msgSend(v0, "valueForPreferenceKey:", *MEMORY[0x24BEB5100]), "integerValue");
  return v1 == 7 || v1 == 2;
}

uint64_t KSGetCurrentShuangpinType()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  return objc_msgSend((id)objc_msgSend(v0, "valueForPreferenceKey:", *MEMORY[0x24BEB5100]), "integerValue");
}

void *KSGetShuangpinTypes()
{
  return &unk_2510839C0;
}

uint64_t KSGetCurrentShuangpinName()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  return KSGetShuangpinNameFromType(objc_msgSend((id)objc_msgSend(v0, "valueForPreferenceKey:", *MEMORY[0x24BEB5100]), "integerValue"));
}

uint64_t KSGetShuangpinNameFromType(int a1)
{
  int v1;

  v1 = a1 - 2;
  if ((a1 - 2) <= 5 && ((0x3Du >> v1) & 1) != 0)
    return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", off_251079EE0[v1], &stru_25107A038, CFSTR("Preferences_pinyin"));
  else
    return 0;
}

void *KSFilteredLayoutsByCurrentShuangpinType(void *a1)
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

id KSUpdateShuangpinSWLayout()
{
  id result;
  id v1;
  void *v2;
  void *v3;
  int v4;
  BOOL v6;
  _QWORD v7[5];
  BOOL v8;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController"), "enabledInputModeIdentifiers"), "mutableCopy");
  if (result)
  {
    v1 = result;
    v2 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController"), "normalizedEnabledInputModeIdentifiers"), "indexesOfObjectsPassingTest:", &__block_literal_global_8);
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
    v4 = objc_msgSend((id)objc_msgSend(v3, "valueForPreferenceKey:", *MEMORY[0x24BEB5100]), "integerValue");
    v6 = v4 == 7 || v4 == 2;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __KSUpdateShuangpinSWLayout_block_invoke_2;
    v7[3] = &unk_251079EC0;
    v7[4] = v1;
    v8 = v6;
    objc_msgSend(v2, "enumerateIndexesUsingBlock:", v7);
    return (id)+[KSKeyboardListController setInputModes:](KSKeyboardListController, "setInputModes:", v1);
  }
  return result;
}

void sub_2401CA004(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2401CA41C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2401CAE90(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void __getMCProfileConnectionClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  -[KSHardwareKeyboardController readRomanCapsLockPreferenceValue:].cold.1(v0);
}

void __getSFSpeechAssetManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  -[KSSoftwareLayoutDetailControllerViewController setSoftwareLayout:].cold.1(v0);
}

void TIUIGetProposedMultilingualSetsForAddingInputMode_cold_1()
{
  __assert_rtn("GetNextAvailableMultilingualIDFromInputModes", "TIUIMultilingualFunctions.m", 145, "![extantIDs containsObject:@(newID)]");
}

void TIUIGetInputModesByAddingProposedInputMode_cold_1()
{
  __assert_rtn("TIUIGetInputModesByAddingProposedInputMode", "TIUIMultilingualFunctions.m", 493, "index == NSNotFound || index < updatedInputModes.count");
}

void TIUIGetInputModesByAddingProposedInputMode_cold_2()
{
  __assert_rtn("TIUIGetInputModesByAddingProposedInputMode", "TIUIMultilingualFunctions.m", 488, "currentInputModes.count == updatedInputModes.count");
}

void TIUIGetInputModesByAddingProposedInputMode_cold_3()
{
  __assert_rtn("TIUIGetInputModesByAddingProposedInputMode", "TIUIMultilingualFunctions.m", 478, "insertionIndex != NSNotFound");
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

uint64_t IXADefaultLogFacility()
{
  return MEMORY[0x24BEB4CD8]();
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

uint64_t TIInputModeGetLanguageWithRegion()
{
  return MEMORY[0x24BEB4FA0]();
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
  return MEMORY[0x24BEBE418]();
}

uint64_t UIKeyboardDeviceSupportsSplit()
{
  return MEMORY[0x24BEBE420]();
}

uint64_t UIKeyboardGetActiveInputModes()
{
  return MEMORY[0x24BEBE470]();
}

uint64_t UIKeyboardGetCurrentInputMode()
{
  return MEMORY[0x24BEBE478]();
}

uint64_t UIKeyboardGetDefaultHardwareKeyboardForInputMode()
{
  return MEMORY[0x24BEBE480]();
}

uint64_t UIKeyboardGetSupportedHardwareKeyboardsForInputMode()
{
  return MEMORY[0x24BEBE488]();
}

uint64_t UIKeyboardGetSupportedInputModes()
{
  return MEMORY[0x24BEBE490]();
}

uint64_t UIKeyboardGetSupportedLanguages()
{
  return MEMORY[0x24BEBE498]();
}

uint64_t UIKeyboardGetSupportedSoftwareKeyboardsForInputMode()
{
  return MEMORY[0x24BEBE4A0]();
}

uint64_t UIKeyboardInputModeGetBaseLanguage()
{
  return MEMORY[0x24BEBE4A8]();
}

uint64_t UIKeyboardInputModeGetComponentsFromIdentifier()
{
  return MEMORY[0x24BEBE4B0]();
}

uint64_t UIKeyboardInputModeGetIdentifierFromComponents()
{
  return MEMORY[0x24BEBE4B8]();
}

uint64_t UIKeyboardInputModeGetLanguageWithRegion()
{
  return MEMORY[0x24BEBE4C0]();
}

uint64_t UIKeyboardInputModeGetNormalizedIdentifier()
{
  return MEMORY[0x24BEBE4C8]();
}

uint64_t UIKeyboardInputModeGetRegion()
{
  return MEMORY[0x24BEBE4D0]();
}

uint64_t UIKeyboardInputModeGetVariant()
{
  return MEMORY[0x24BEBE4D8]();
}

uint64_t UIKeyboardInputModeWithNewHWLayout()
{
  return MEMORY[0x24BEBE4E8]();
}

uint64_t UIKeyboardInputModeWithNewSWLayout()
{
  return MEMORY[0x24BEBE4F0]();
}

uint64_t UIKeyboardInputModesMatchingMode()
{
  return MEMORY[0x24BEBE500]();
}

uint64_t UIKeyboardLayoutDefaultTypeForInputModeIsASCIICapable()
{
  return MEMORY[0x24BEBE510]();
}

uint64_t UIKeyboardLayoutSupportsASCIIToggleKey()
{
  return MEMORY[0x24BEBE520]();
}

uint64_t UIKeyboardPredictionEnabledForInputModes()
{
  return MEMORY[0x24BEBE548]();
}

uint64_t UISystemFontBoldForSize()
{
  return MEMORY[0x24BEBB638]();
}

uint64_t UISystemRootDirectory()
{
  return MEMORY[0x24BEBE768]();
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
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

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

