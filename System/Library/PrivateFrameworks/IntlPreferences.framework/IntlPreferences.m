id Logger()
{
  if (Logger___onceToken != -1)
    dispatch_once(&Logger___onceToken, &__block_literal_global);
  return (id)Logger___migrationLogger;
}

id MigrationLogger()
{
  if (MigrationLogger___onceToken != -1)
    dispatch_once(&MigrationLogger___onceToken, &__block_literal_global_0);
  return (id)MigrationLogger___migrationLogger;
}

id getUMUserManagerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getUMUserManagerClass_softClass;
  v7 = getUMUserManagerClass_softClass;
  if (!getUMUserManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getUMUserManagerClass_block_invoke;
    v3[3] = &unk_1E7068E68;
    v3[4] = &v4;
    __getUMUserManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B96C7B44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B96C7D74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUMUserManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!UserManagementLibraryCore_frameworkLibrary)
  {
    UserManagementLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!UserManagementLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("UMUserManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getUMUserManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getUMUserManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAKAppleIDAuthenticationControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AuthKitLibraryCore_frameworkLibrary)
  {
    AuthKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AuthKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("AKAppleIDAuthenticationController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getAKAppleIDAuthenticationControllerClass_block_invoke_cold_1();
    free(v3);
  }
  getAKAppleIDAuthenticationControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1B96C8C78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void IPLoadUIKitFramework()
{
  if (IPLoadUIKitFramework_onceToken != -1)
    dispatch_once(&IPLoadUIKitFramework_onceToken, &__block_literal_global_1);
}

Class IPUIKeyboardInputModeController()
{
  if (IPLoadUIKitFramework_onceToken != -1)
    dispatch_once(&IPLoadUIKitFramework_onceToken, &__block_literal_global_1);
  return NSClassFromString(CFSTR("UIKeyboardInputModeController"));
}

Class IPUIKeyboardPreferencesController()
{
  if (IPLoadUIKitFramework_onceToken != -1)
    dispatch_once(&IPLoadUIKitFramework_onceToken, &__block_literal_global_1);
  return NSClassFromString(CFSTR("UIKeyboardPreferencesController"));
}

id IPUIKeyboardInputModeGetIdentifierWithKeyboardLayouts(void *a1)
{
  uint64_t v1;
  id v2;
  void (*v3)(id);
  void *v4;

  v1 = IPLoadUIKitFramework_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&IPLoadUIKitFramework_onceToken, &__block_literal_global_1);
  v3 = (void (*)(id))dlsym((void *)uiKitFramework, "UIKeyboardInputModeGetIdentifierWithKeyboardLayouts");
  v3(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id IPUIKeyboardInputModeGetBaseLanguage(void *a1)
{
  uint64_t v1;
  id v2;
  void (*v3)(id);
  void *v4;

  v1 = IPLoadUIKitFramework_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&IPLoadUIKitFramework_onceToken, &__block_literal_global_1);
  v3 = (void (*)(id))dlsym((void *)uiKitFramework, "UIKeyboardInputModeGetBaseLanguage");
  v3(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id IPUIKeyboardCanonicalInputModeName(void *a1)
{
  uint64_t v1;
  id v2;
  void (*v3)(id);
  void *v4;

  v1 = IPLoadUIKitFramework_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&IPLoadUIKitFramework_onceToken, &__block_literal_global_1);
  v3 = (void (*)(id))dlsym((void *)uiKitFramework, "UIKeyboardCanonicalInputModeName");
  v3(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id IPUIKeyboardInputModeGetLanguageWithRegion(void *a1)
{
  uint64_t v1;
  id v2;
  void (*v3)(id);
  void *v4;

  v1 = IPLoadUIKitFramework_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&IPLoadUIKitFramework_onceToken, &__block_literal_global_1);
  v3 = (void (*)(id))dlsym((void *)uiKitFramework, "UIKeyboardInputModeGetLanguageWithRegion");
  v3(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id IPUIKeyboardInputModeGetNormalizedIdentifier(void *a1)
{
  uint64_t v1;
  id v2;
  void (*v3)(id);
  void *v4;

  v1 = IPLoadUIKitFramework_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&IPLoadUIKitFramework_onceToken, &__block_literal_global_1);
  v3 = (void (*)(id))dlsym((void *)uiKitFramework, "UIKeyboardInputModeGetNormalizedIdentifier");
  v3(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void *IPUIKeyboardInputMode_Intl()
{
  if (IPLoadUIKitFramework_onceToken != -1)
    dispatch_once(&IPLoadUIKitFramework_onceToken, &__block_literal_global_1);
  return dlsym((void *)uiKitFramework, "UIKeyboardInputMode_intl");
}

void sub_1B96CA328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B96CC298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getNRPairedDeviceRegistryClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getNRPairedDeviceRegistryClass_softClass;
  v7 = getNRPairedDeviceRegistryClass_softClass;
  if (!getNRPairedDeviceRegistryClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getNRPairedDeviceRegistryClass_block_invoke;
    v3[3] = &unk_1E7068E68;
    v3[4] = &v4;
    __getNRPairedDeviceRegistryClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B96CC364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getNPSManagerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getNPSManagerClass_softClass;
  v7 = getNPSManagerClass_softClass;
  if (!getNPSManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getNPSManagerClass_block_invoke;
    v3[3] = &unk_1E7068E68;
    v3[4] = &v4;
    __getNPSManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B96CC41C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B96CC570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getNRPairedDeviceRegistryClass_block_invoke(uint64_t a1)
{
  Class result;

  NanoRegistryLibrary();
  result = objc_getClass("NRPairedDeviceRegistry");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getNRPairedDeviceRegistryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getNRPairedDeviceRegistryClass_block_invoke_cold_1();
    return (Class)NanoRegistryLibrary();
  }
  return result;
}

uint64_t NanoRegistryLibrary()
{
  uint64_t v0;
  void *v2;

  if (!NanoRegistryLibraryCore_frameworkLibrary)
    NanoRegistryLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = NanoRegistryLibraryCore_frameworkLibrary;
  if (!NanoRegistryLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void __getNPSManagerClass_block_invoke(uint64_t a1)
{
  NanoPreferencesSyncLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("NPSManager");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getNPSManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getNPSManagerClass_block_invoke_cold_1();
    NanoPreferencesSyncLibrary();
  }
}

void NanoPreferencesSyncLibrary()
{
  void *v0;

  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
    NanoPreferencesSyncLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

void *__getPSIsNanoMirroringDomainSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (PreferencesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)PreferencesLibraryCore_frameworkLibrary;
  }
  else
  {
    PreferencesLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)PreferencesLibraryCore_frameworkLibrary;
    if (!PreferencesLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "PSIsNanoMirroringDomain");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getPSIsNanoMirroringDomainSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getNPSDomainAccessorClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  NanoPreferencesSyncLibrary();
  result = objc_getClass("NPSDomainAccessor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getNPSDomainAccessorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getNPSDomainAccessorClass_block_invoke_cold_1();
    return (Class)__32__IntlUtility_sharedIntlUtility__block_invoke(v3);
  }
  return result;
}

void sub_1B96CD5D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_1B96CD8D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _isChineseLanguageCode(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("zh")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("yue")) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("wuu"));
  }

  return v2;
}

void sub_1B96D0150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B96D0904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getNRPairedDeviceRegistryClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!NanoRegistryLibraryCore_frameworkLibrary_0)
  {
    NanoRegistryLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!NanoRegistryLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("NRPairedDeviceRegistry");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getNRPairedDeviceRegistryClass_block_invoke_cold_1();
    free(v3);
  }
  getNRPairedDeviceRegistryClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1B96D153C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void IP_hashKeyValue(CC_SHA1_CTX *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  const void *v20;
  CC_LONG v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  IP_hashString(a1, a2);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    objc_msgSend(v6, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          IP_hashString(a1, v14);
          v15 = (void *)MEMORY[0x1E0CB36F8];
          objc_msgSend(v6, "objectForKeyedSubscript:", v14, (_QWORD)v22);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "archivedDataWithRootObject:requiringSecureCoding:error:", v16, 0, 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v18 = objc_retainAutorelease(v17);
          CC_SHA1_Update(a1, (const void *)objc_msgSend(v18, "bytes"), objc_msgSend(v18, "length"));

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v11);
    }

    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 0, 0);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CC_SHA1_Update(a1, (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));
LABEL_13:

    goto LABEL_14;
  }
  v19 = objc_retainAutorelease(v5);
  v20 = (const void *)objc_msgSend(v19, "bytes");
  v21 = objc_msgSend(v19, "length");

  CC_SHA1_Update(a1, v20, v21);
LABEL_14:

}

uint64_t IP_hashString(CC_SHA1_CTX *a1, id a2)
{
  const char *v3;
  CC_LONG v4;

  v3 = (const char *)objc_msgSend(objc_retainAutorelease(a2), "UTF8String");
  v4 = strlen(v3);
  return CC_SHA1_Update(a1, v3, v4);
}

uint64_t sub_1B96D72D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  v0 = sub_1B96D9BB8();
  v2 = v1;
  v3 = sub_1B96D9BB8();
  _sSo8NSLocaleC15IntlPreferencesE17_sameLocalizationySbSS_SStFZ_0(v0, v2, v3, v4);
  LOBYTE(v0) = v5;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0 & 1;
}

uint64_t sub_1B96D7344(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  void (*v63)(char *, uint64_t);
  char *v64;
  void (*v65)(_QWORD, _QWORD);
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t, uint64_t);
  int v70;
  char *v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  char v76;
  void (*v77)(char *, uint64_t);
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void (*v81)(char *, char *, uint64_t);
  char *v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  void *ObjCClassFromMetadata;
  void *v87;
  void *v88;
  void (*v89)(char *, _QWORD);
  uint64_t v90;
  uint64_t v91;
  void (*v92)(char *, _QWORD);
  void (*v93)(char *, _QWORD);
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t (*v97)(uint64_t, uint64_t, uint64_t);
  void (*v98)(char *, _QWORD);
  uint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  int v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  char v109;
  void (*v110)(char *, uint64_t);
  char *v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  void *v116;
  id v117;
  uint64_t v118;
  void (*v119)(char *, uint64_t);
  char *v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  char *v129;
  uint64_t v130;
  char *v131;
  char *v132;
  uint64_t v133;
  char *v134;
  char *v135;
  char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  char *v141;
  uint64_t v142;
  char *v143;
  char *v144;
  char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  char **v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  char *v156;
  char *v157;
  uint64_t v158;
  char *v159;
  uint64_t v160;
  uint64_t v161;
  void (*v162)(char *, uint64_t);
  char v163[8];

  v156 = a4;
  v150 = sub_1B96D9AC8();
  v155 = *(_QWORD *)(v150 - 8);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v122 = (char *)&v121 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v148 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF22BE08);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v149 = (uint64_t)&v121 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF22BE28);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v144 = (char *)&v121 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v138 = sub_1B96D9B70();
  v137 = *(_QWORD *)(v138 - 8);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v136 = (char *)&v121 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v160 = sub_1B96D9B7C();
  v133 = *(_QWORD *)(v160 - 8);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v159 = (char *)&v121 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF22BE10);
  v12 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v124 = (uint64_t)&v121 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x1E0C80A78](v12);
  v153 = (uint64_t)&v121 - v15;
  v16 = MEMORY[0x1E0C80A78](v14);
  v154 = (uint64_t)&v121 - v17;
  v18 = MEMORY[0x1E0C80A78](v16);
  v143 = (char *)&v121 - v19;
  v20 = MEMORY[0x1E0C80A78](v18);
  v152 = (uint64_t)&v121 - v21;
  MEMORY[0x1E0C80A78](v20);
  v158 = (uint64_t)&v121 - v22;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF22BE00);
  MEMORY[0x1E0C80A78](v23);
  v132 = (char *)&v121 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF22BE30);
  MEMORY[0x1E0C80A78](v25);
  v125 = (char *)&v121 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v126 = sub_1B96D9A8C();
  v128 = *(_QWORD *)(v126 - 8);
  MEMORY[0x1E0C80A78](v126);
  v121 = (char *)&v121 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF22BE38);
  MEMORY[0x1E0C80A78](v127);
  v151 = (char **)((char *)&v121 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0));
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF22BE40);
  v30 = MEMORY[0x1E0C80A78](v29);
  v135 = (char *)&v121 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = MEMORY[0x1E0C80A78](v30);
  v123 = (uint64_t)&v121 - v33;
  v34 = MEMORY[0x1E0C80A78](v32);
  v36 = (char *)&v121 - v35;
  MEMORY[0x1E0C80A78](v34);
  v38 = (char *)&v121 - v37;
  v39 = sub_1B96D9B4C();
  v40 = *(_QWORD *)(v39 - 8);
  v41 = MEMORY[0x1E0C80A78](v39);
  v141 = (char *)&v121 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = MEMORY[0x1E0C80A78](v41);
  v134 = (char *)&v121 - v44;
  v45 = MEMORY[0x1E0C80A78](v43);
  v131 = (char *)&v121 - v46;
  v47 = MEMORY[0x1E0C80A78](v45);
  v157 = (char *)&v121 - v48;
  v49 = MEMORY[0x1E0C80A78](v47);
  v51 = (char *)&v121 - v50;
  MEMORY[0x1E0C80A78](v49);
  v53 = (char *)&v121 - v52;
  v54 = sub_1B96D9A5C();
  v146 = *(_QWORD *)(v54 - 8);
  v147 = v54;
  v55 = MEMORY[0x1E0C80A78](v54);
  v145 = (char *)&v121 - ((v56 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v55);
  v58 = (char *)&v121 - v57;
  swift_bridgeObjectRetain();
  v139 = a1;
  v140 = a2;
  sub_1B96D9A20();
  v59 = (void *)objc_opt_self();
  v142 = a3;
  v60 = (void *)sub_1B96D9BAC();
  v61 = objc_msgSend(v59, sel_normalizedLanguageIDFromString_, v60);

  sub_1B96D9BB8();
  sub_1B96D9AF8();
  v129 = v58;
  v62 = v126;
  sub_1B96D9A14();
  sub_1B96D9B04();
  v130 = v40;
  v63 = *(void (**)(char *, uint64_t))(v40 + 8);
  v64 = v51;
  v65 = (void (*)(_QWORD, _QWORD))v151;
  v161 = v39;
  v66 = v39;
  v67 = v128;
  v162 = v63;
  v63(v64, v66);
  sub_1B96D9B04();
  v68 = (uint64_t)v65 + *(int *)(v127 + 48);
  sub_1B96D9580((uint64_t)v38, (uint64_t)v65, &qword_1EF22BE40);
  sub_1B96D9580((uint64_t)v36, v68, &qword_1EF22BE40);
  v69 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v67 + 48);
  if (v69((uint64_t)v65, 1, v62) == 1)
  {
    sub_1B96D95C4((uint64_t)v36, &qword_1EF22BE40);
    sub_1B96D95C4((uint64_t)v38, &qword_1EF22BE40);
    v70 = v69(v68, 1, v62);
    v71 = v159;
    v72 = v129;
    if (v70 == 1)
    {
      sub_1B96D95C4((uint64_t)v65, &qword_1EF22BE40);
      v73 = v160;
      goto LABEL_9;
    }
  }
  else
  {
    v74 = v123;
    sub_1B96D9580((uint64_t)v65, v123, &qword_1EF22BE40);
    if (v69(v68, 1, v62) != 1)
    {
      v75 = v121;
      (*(void (**)(char *, uint64_t, uint64_t))(v67 + 32))(v121, v68, v62);
      sub_1B96D9600(&qword_1EF22BE48, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0AE8], MEMORY[0x1E0CB0B08]);
      v76 = sub_1B96D9BA0();
      v77 = *(void (**)(char *, uint64_t))(v67 + 8);
      v77(v75, v62);
      sub_1B96D95C4((uint64_t)v36, &qword_1EF22BE40);
      sub_1B96D95C4((uint64_t)v38, &qword_1EF22BE40);
      v77((char *)v74, v62);
      sub_1B96D95C4((uint64_t)v151, &qword_1EF22BE40);
      v71 = v159;
      v73 = v160;
      v72 = v129;
      if ((v76 & 1) != 0)
        goto LABEL_9;
      goto LABEL_8;
    }
    sub_1B96D95C4((uint64_t)v36, &qword_1EF22BE40);
    sub_1B96D95C4((uint64_t)v38, &qword_1EF22BE40);
    (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v74, v62);
    v71 = v159;
    v72 = v129;
  }
  sub_1B96D95C4((uint64_t)v65, &qword_1EF22BE38);
  v73 = v160;
LABEL_8:
  v78 = sub_1B96D9A98();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v78 - 8) + 56))(v125, 1, 1, v78);
  sub_1B96D9A2C();
LABEL_9:
  v79 = sub_1B96D9AEC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v79 - 8) + 56))(v132, 1, 1, v79);
  sub_1B96D9A50();
  swift_bridgeObjectRetain();
  sub_1B96D9A74();
  v80 = v158;
  sub_1B96D9AE0();
  v151 = *(char ***)(v133 + 8);
  ((void (*)(char *, uint64_t))v151)(v71, v73);
  v81 = *(void (**)(char *, char *, uint64_t))(v130 + 16);
  v82 = v157;
  v83 = v161;
  v81(v157, v53, v161);
  v84 = v152;
  sub_1B96D9580(v80, v152, &qword_1EF22BE10);
  sub_1B96D9B28();
  v81(v131, v82, v83);
  v85 = v136;
  sub_1B96D9B58();
  sub_1B96D9B64();
  (*(void (**)(char *, uint64_t))(v137 + 8))(v85, v138);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v87 = (void *)sub_1B96D9BAC();
  v88 = (void *)sub_1B96D9BAC();
  swift_bridgeObjectRelease();
  LOBYTE(v81) = objc_msgSend(ObjCClassFromMetadata, sel__language_usesSameLocalizationAs_, v87, v88);

  sub_1B96D9580(v80, v84, &qword_1EF22BE10);
  if ((v81 & 1) == 0)
  {
    sub_1B96D9A44();
    sub_1B96D9B1C();
  }
  v89 = (void (*)(char *, _QWORD))sub_1B96D9A08();
  sub_1B96D9B28();
  v89(v163, 0);
  v90 = v150;
  v91 = v155;
  sub_1B96D9B04();
  v92 = (void (*)(char *, _QWORD))sub_1B96D9A08();
  sub_1B96D9B10();
  v92(v163, 0);
  v156 = v53;
  sub_1B96D9B34();
  v93 = (void (*)(char *, _QWORD))sub_1B96D9A08();
  sub_1B96D9B40();
  v93(v163, 0);
  v94 = v134;
  sub_1B96D9A14();
  v95 = (uint64_t)v143;
  sub_1B96D9B1C();
  v96 = v161;
  v162(v94, v161);
  v97 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v91 + 48);
  LODWORD(v94) = v97(v95, 1, v90);
  sub_1B96D95C4(v95, &qword_1EF22BE10);
  if ((_DWORD)v94 == 1)
  {
    sub_1B96D9ABC();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v91 + 56))(v84, 0, 1, v90);
    v98 = (void (*)(char *, _QWORD))sub_1B96D9A08();
    sub_1B96D9B28();
    v98(v163, 0);
  }
  v99 = v154;
  sub_1B96D9A38();
  v100 = v141;
  sub_1B96D9A14();
  v101 = v153;
  sub_1B96D9B1C();
  v162(v100, v96);
  v102 = v149;
  v103 = v149 + *(int *)(v148 + 48);
  sub_1B96D9580(v99, v149, &qword_1EF22BE10);
  sub_1B96D9580(v101, v103, &qword_1EF22BE10);
  if (v97(v102, 1, v90) == 1)
  {
    sub_1B96D95C4(v101, &qword_1EF22BE10);
    sub_1B96D95C4(v99, &qword_1EF22BE10);
    v104 = v97(v103, 1, v90);
    v105 = v156;
    if (v104 == 1)
    {
      sub_1B96D95C4(v102, &qword_1EF22BE10);
      v106 = v155;
LABEL_20:
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v106 + 56))(v84, 1, 1, v90);
      sub_1B96D9A44();
      goto LABEL_21;
    }
    goto LABEL_18;
  }
  v107 = v124;
  sub_1B96D9580(v102, v124, &qword_1EF22BE10);
  if (v97(v103, 1, v90) == 1)
  {
    sub_1B96D95C4(v153, &qword_1EF22BE10);
    sub_1B96D95C4(v154, &qword_1EF22BE10);
    (*(void (**)(uint64_t, uint64_t))(v155 + 8))(v107, v90);
    v105 = v156;
LABEL_18:
    sub_1B96D95C4(v102, &qword_1EF22BE08);
    goto LABEL_21;
  }
  v106 = v155;
  v108 = v122;
  (*(void (**)(char *, uint64_t, uint64_t))(v155 + 32))(v122, v103, v90);
  sub_1B96D9600(&qword_1EF22BE18, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0C48], MEMORY[0x1E0CB0C68]);
  v109 = sub_1B96D9BA0();
  v110 = *(void (**)(char *, uint64_t))(v106 + 8);
  v111 = v108;
  v84 = v152;
  v110(v111, v90);
  sub_1B96D95C4(v153, &qword_1EF22BE10);
  sub_1B96D95C4(v154, &qword_1EF22BE10);
  v96 = v161;
  v110((char *)v107, v90);
  sub_1B96D95C4(v102, &qword_1EF22BE10);
  v105 = v156;
  if ((v109 & 1) != 0)
    goto LABEL_20;
LABEL_21:
  v112 = (void *)objc_opt_self();
  v114 = v146;
  v113 = v147;
  (*(void (**)(char *, char *, uint64_t))(v146 + 16))(v145, v72, v147);
  v115 = v159;
  sub_1B96D9A68();
  sub_1B96D9A80();
  ((void (*)(char *, uint64_t))v151)(v115, v160);
  v116 = (void *)sub_1B96D9BAC();
  swift_bridgeObjectRelease();
  v117 = objc_msgSend(v112, sel_canonicalLocaleIdentifierFromString_, v116);

  v118 = sub_1B96D9BB8();
  v119 = v162;
  v162(v157, v96);
  sub_1B96D95C4(v158, &qword_1EF22BE10);
  v119(v105, v96);
  (*(void (**)(char *, uint64_t))(v114 + 8))(v72, v113);
  return v118;
}

id sub_1B96D8200()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  char *v5;
  void *v6;

  v0 = sub_1B96D9BB8();
  v2 = v1;
  v3 = sub_1B96D9BB8();
  v5 = v4;
  swift_getObjCClassMetadata();
  sub_1B96D7344(v0, v2, v3, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v6 = (void *)sub_1B96D9BAC();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t static NSLocale._localeIdentifierForRegionChange(from:to:)(uint64_t a1, _QWORD *a2, char *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  void (*v38)(char *, char *, uint64_t);
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t, uint64_t);
  int v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  _QWORD *v46;
  char *v47;
  char v48;
  void (*v49)(char *, uint64_t);
  uint64_t v50;
  char *v51;
  char *v52;
  void (*v53)(char *, char *, uint64_t);
  char *v54;
  void (*v55)(char *, uint64_t, uint64_t, uint64_t);
  void (*v56)(_BYTE *, _QWORD);
  char *v57;
  void *ObjCClassFromMetadata;
  void *v59;
  void *v60;
  char *v61;
  void (*v62)(char *, uint64_t, uint64_t, uint64_t);
  void (*v63)(_BYTE *, _QWORD);
  uint64_t v64;
  char *v65;
  void *v66;
  id v67;
  id v68;
  uint64_t v69;
  void *v70;
  id v71;
  uint64_t v72;
  void (*v74)(char *, char *, uint64_t);
  char *v75;
  uint64_t v76;
  void (*v77)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v78;
  char *v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  char *v84;
  char *v85;
  char *v86;
  _QWORD *v87;
  char *v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  _BYTE v94[40];

  v85 = a3;
  v87 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF22BE00);
  MEMORY[0x1E0C80A78](v3);
  v79 = (char *)&v74 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1B96D9B7C();
  v90 = *(_QWORD *)(v5 - 8);
  v91 = v5;
  MEMORY[0x1E0C80A78](v5);
  v89 = (char *)&v74 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF22BE08);
  MEMORY[0x1E0C80A78](v81);
  v8 = (char *)&v74 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF22BE10);
  v10 = MEMORY[0x1E0C80A78](v9);
  v80 = (char *)&v74 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x1E0C80A78](v10);
  v76 = (uint64_t)&v74 - v13;
  v14 = MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v74 - v15;
  MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v74 - v17;
  v19 = sub_1B96D9AC8();
  v20 = *(_QWORD **)(v19 - 8);
  v21 = MEMORY[0x1E0C80A78](v19);
  v75 = (char *)&v74 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v21);
  v24 = (char *)&v74 - v23;
  v25 = sub_1B96D9A5C();
  v92 = *(_QWORD *)(v25 - 8);
  v93 = v25;
  v26 = MEMORY[0x1E0C80A78](v25);
  v88 = (char *)&v74 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = MEMORY[0x1E0C80A78](v26);
  v86 = (char *)&v74 - v29;
  MEMORY[0x1E0C80A78](v28);
  v31 = (char *)&v74 - v30;
  v32 = sub_1B96D9A80();
  v34 = v33;
  v35 = (void *)objc_opt_self();
  v78 = v32;
  v82 = v34;
  v36 = (void *)sub_1B96D9BAC();
  v83 = v35;
  v37 = objc_msgSend(v35, sel_addLikelySubtagsForLocaleIdentifier_, v36);

  sub_1B96D9BB8();
  sub_1B96D9A20();
  swift_bridgeObjectRetain();
  sub_1B96D9AD4();
  v38 = (void (*)(char *, char *, uint64_t))v20[2];
  v85 = v24;
  v38(v18, v24, v19);
  v77 = (void (*)(char *, _QWORD, uint64_t, uint64_t))v20[7];
  v77(v18, 0, 1, v19);
  v84 = v31;
  sub_1B96D9A38();
  v39 = (uint64_t)&v8[*(int *)(v81 + 48)];
  sub_1B96D9580((uint64_t)v18, (uint64_t)v8, &qword_1EF22BE10);
  sub_1B96D9580((uint64_t)v16, v39, &qword_1EF22BE10);
  v87 = v20;
  v40 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v20[6];
  if (v40((uint64_t)v8, 1, v19) == 1)
  {
    sub_1B96D95C4((uint64_t)v16, &qword_1EF22BE10);
    sub_1B96D95C4((uint64_t)v18, &qword_1EF22BE10);
    v41 = v40(v39, 1, v19);
    v42 = v92;
    if (v41 == 1)
    {
      sub_1B96D95C4((uint64_t)v8, &qword_1EF22BE10);
      swift_bridgeObjectRelease();
      v43 = v85;
LABEL_9:
      v50 = v93;
      v51 = v84;
      goto LABEL_13;
    }
    goto LABEL_6;
  }
  v44 = v76;
  sub_1B96D9580((uint64_t)v8, v76, &qword_1EF22BE10);
  if (v40(v39, 1, v19) == 1)
  {
    sub_1B96D95C4((uint64_t)v16, &qword_1EF22BE10);
    sub_1B96D95C4((uint64_t)v18, &qword_1EF22BE10);
    ((void (*)(uint64_t, uint64_t))v87[1])(v44, v19);
    v42 = v92;
LABEL_6:
    sub_1B96D95C4((uint64_t)v8, &qword_1EF22BE08);
    v43 = v85;
    v45 = v80;
    goto LABEL_10;
  }
  v46 = v87;
  v47 = v75;
  ((void (*)(char *, uint64_t, uint64_t))v87[4])(v75, v39, v19);
  sub_1B96D9600(&qword_1EF22BE18, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0C48], MEMORY[0x1E0CB0C68]);
  v48 = sub_1B96D9BA0();
  v49 = (void (*)(char *, uint64_t))v46[1];
  v49(v47, v19);
  sub_1B96D95C4((uint64_t)v16, &qword_1EF22BE10);
  sub_1B96D95C4((uint64_t)v18, &qword_1EF22BE10);
  v49((char *)v44, v19);
  sub_1B96D95C4((uint64_t)v8, &qword_1EF22BE10);
  v43 = v85;
  v42 = v92;
  v45 = v80;
  if ((v48 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
LABEL_10:
  swift_bridgeObjectRetain();
  v52 = v86;
  v53 = v38;
  v74 = v38;
  sub_1B96D9A20();
  v54 = v43;
  v53(v45, v43, v19);
  v55 = v77;
  v77(v45, 0, 1, v19);
  v56 = (void (*)(_BYTE *, _QWORD))sub_1B96D9A08();
  sub_1B96D9B28();
  v56(v94, 0);
  (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v88, v52, v93);
  v57 = v89;
  sub_1B96D9A68();
  sub_1B96D9A80();
  (*(void (**)(char *, uint64_t))(v90 + 8))(v57, v91);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v59 = (void *)sub_1B96D9BAC();
  swift_bridgeObjectRelease();
  v60 = (void *)sub_1B96D9BAC();
  swift_bridgeObjectRelease();
  LODWORD(v56) = objc_msgSend(ObjCClassFromMetadata, sel__language_usesSameLocalizationAs_, v59, v60);

  v61 = v54;
  v62 = v55;

  v43 = v61;
  v74(v45, v61, v19);
  v62(v45, 0, 1, v19);
  v51 = v84;
  if ((_DWORD)v56)
  {
    v63 = (void (*)(_BYTE *, _QWORD))sub_1B96D9A08();
    sub_1B96D9B28();
    v63(v94, 0);
    v62(v45, 1, 1, v19);
  }
  sub_1B96D9A44();
  v64 = sub_1B96D9AEC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v64 - 8) + 56))(v79, 1, 1, v64);
  sub_1B96D9A50();
  v42 = v92;
  v50 = v93;
  (*(void (**)(char *, uint64_t))(v92 + 8))(v86, v93);
LABEL_13:
  (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v88, v51, v50);
  v65 = v89;
  sub_1B96D9A68();
  sub_1B96D9A80();
  (*(void (**)(char *, uint64_t))(v90 + 8))(v65, v91);
  v66 = (void *)sub_1B96D9BAC();
  swift_bridgeObjectRelease();
  v67 = v83;
  v68 = objc_msgSend(v83, sel_componentsFromLocaleIdentifier_, v66);

  v69 = sub_1B96D9B94();
  sub_1B96D8B48(v69);
  swift_bridgeObjectRelease();
  v70 = (void *)sub_1B96D9B88();
  swift_bridgeObjectRelease();
  v71 = objc_msgSend(v67, sel_canonicalLocaleIdentifierWithValidCalendarForComponents_, v70);

  v72 = sub_1B96D9BB8();
  ((void (*)(char *, uint64_t))v87[1])(v43, v19);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v51, v50);
  return v72;
}

uint64_t sub_1B96D8B48(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  _OWORD v35[2];
  _OWORD v36[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF22BE50);
    v2 = sub_1B96D9BE8();
  }
  else
  {
    v2 = MEMORY[0x1E0DEE9E0];
  }
  v27 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v26 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v26)
      goto LABEL_37;
    v14 = *(_QWORD *)(v27 + 8 * v13);
    v15 = v8 + 1;
    if (!v14)
    {
      v15 = v8 + 2;
      if (v8 + 2 >= v26)
        goto LABEL_37;
      v14 = *(_QWORD *)(v27 + 8 * v15);
      if (!v14)
      {
        v15 = v8 + 3;
        if (v8 + 3 >= v26)
          goto LABEL_37;
        v14 = *(_QWORD *)(v27 + 8 * v15);
        if (!v14)
        {
          v15 = v8 + 4;
          if (v8 + 4 >= v26)
            goto LABEL_37;
          v14 = *(_QWORD *)(v27 + 8 * v15);
          if (!v14)
            break;
        }
      }
    }
LABEL_27:
    v5 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v15 << 6);
    v8 = v15;
LABEL_28:
    v17 = (_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v18 = v17[1];
    *(_QWORD *)&v36[0] = *v17;
    *((_QWORD *)&v36[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    swift_dynamicCast();
    v32 = v28;
    v33 = v29;
    v34 = v30;
    sub_1B96D9640(&v31, v35);
    v28 = v32;
    v29 = v33;
    v30 = v34;
    sub_1B96D9640(v35, v36);
    sub_1B96D9640(v36, &v32);
    result = sub_1B96D9BDC();
    v19 = -1 << *(_BYTE *)(v2 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      v9 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v24 = v21 == v23;
        if (v21 == v23)
          v21 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    v10 = *(_QWORD *)(v2 + 48) + 40 * v9;
    *(_OWORD *)v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(_QWORD *)(v10 + 32) = v30;
    result = (uint64_t)sub_1B96D9640(&v32, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_1B96D9650();
    return v2;
  }
  v14 = *(_QWORD *)(v27 + 8 * v16);
  if (v14)
  {
    v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v26)
      goto LABEL_37;
    v14 = *(_QWORD *)(v27 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

id sub_1B96D8F04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  _QWORD *v4;
  char *v5;
  char *v6;
  void *v7;
  uint64_t v9;

  v0 = sub_1B96D9B7C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B96D9AB0();
  v4 = (_QWORD *)sub_1B96D9BB8();
  v6 = v5;
  swift_getObjCClassMetadata();
  static NSLocale._localeIdentifierForRegionChange(from:to:)((uint64_t)v3, v4, v6);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v7 = (void *)sub_1B96D9BAC();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_1B96D8FF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  void *v8;
  uint64_t result;
  void *ObjCClassFromMetadata;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;

  v0 = sub_1B96D9B7C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF22BE20);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend((id)objc_opt_self(), sel_preferredLocale);
  if (v7)
  {
    v8 = v7;
    sub_1B96D9AB0();

    (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v6, v3, v0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v1 + 56))(v6, 0, 1, v0);
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v1 + 48))(v6, 1, v0);
    if ((_DWORD)result != 1)
    {
      ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
      v11 = (void *)sub_1B96D9AA4();
      (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
      v12 = (void *)sub_1B96D9BAC();
      v13 = objc_msgSend(ObjCClassFromMetadata, sel__localeIdentifierForRegionChangeFrom_to_, v11, v12);

      v14 = sub_1B96D9BB8();
      return v14;
    }
  }
  else
  {
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v6, 1, 1, v0);
  }
  __break(1u);
  return result;
}

id sub_1B96D91B4()
{
  void *v0;

  sub_1B96D9BB8();
  swift_getObjCClassMetadata();
  sub_1B96D8FF0();
  swift_bridgeObjectRelease();
  v0 = (void *)sub_1B96D9BAC();
  swift_bridgeObjectRelease();
  return v0;
}

void _sSo8NSLocaleC15IntlPreferencesE17_sameLocalizationySbSS_SStFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;

  v8 = (void *)sub_1B96D9BAC();
  v9 = (void *)objc_opt_self();
  v10 = objc_msgSend(v9, sel_bundleWithIdentifier_, v8);

  if (!v10)
  {
    __break(1u);
    return;
  }
  v11 = objc_msgSend(v10, sel_localizations);

  v12 = v11;
  v13 = v11;
  if (!v11)
  {
    sub_1B96D9BD0();
    v13 = (void *)sub_1B96D9BC4();
    swift_bridgeObjectRelease();
    sub_1B96D9BD0();
    v12 = (void *)sub_1B96D9BC4();
    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF22BE58);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1B96DB2C0;
  *(_QWORD *)(v14 + 32) = a1;
  *(_QWORD *)(v14 + 40) = a2;
  v15 = v11;
  swift_bridgeObjectRetain();
  v16 = (void *)sub_1B96D9BC4();
  swift_bridgeObjectRelease();
  v17 = objc_msgSend(v9, sel_preferredLocalizationsFromArray_forPreferences_, v13, v16);

  v18 = (_QWORD *)sub_1B96D9BD0();
  if (v18[2])
  {
    v20 = v18[4];
    v19 = v18[5];
    swift_bridgeObjectRetain();
  }
  else
  {
    v20 = 0;
    v19 = 0;
  }
  swift_bridgeObjectRelease();
  v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_1B96DB2C0;
  *(_QWORD *)(v21 + 32) = a3;
  *(_QWORD *)(v21 + 40) = a4;
  swift_bridgeObjectRetain();
  v22 = (void *)sub_1B96D9BC4();
  swift_bridgeObjectRelease();
  v23 = objc_msgSend(v9, sel_preferredLocalizationsFromArray_forPreferences_, v12, v22);

  v24 = (_QWORD *)sub_1B96D9BD0();
  if (!v24[2])
  {
    swift_bridgeObjectRelease();
    if (!v19)
      return;
LABEL_18:
    swift_bridgeObjectRelease();
    return;
  }
  v26 = v24[4];
  v25 = v24[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (v19)
  {
    if (v25)
    {
      if (v20 == v26 && v19 == v25)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_1B96D9BF4();
        swift_bridgeObjectRelease();
      }
    }
    goto LABEL_18;
  }
  if (v25)
    goto LABEL_18;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1BCCC3318]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1B96D9580(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1B96D95C4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1B96D9600(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1BCCC3324](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

_OWORD *sub_1B96D9640(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1B96D9650()
{
  return swift_release();
}

uint64_t __getUMUserManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAKAppleIDAuthenticationControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getAKAppleIDAuthenticationControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return +[NSPersonNameComponentsFormatterPreferences _syncronizeGizmoDefaultWithKey:value:].cold.1(v0);
}

uint64_t __getNRPairedDeviceRegistryClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getNPSManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getNPSManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getNPSDomainAccessorClass_block_invoke_cold_1(v0);
}

uint64_t __getNPSDomainAccessorClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[IPLanguageListManager systemDisplayLanguage].cold.1(v0);
}

uint64_t sub_1B96D9A08()
{
  return MEMORY[0x1E0CB0A08]();
}

uint64_t sub_1B96D9A14()
{
  return MEMORY[0x1E0CB0A10]();
}

uint64_t sub_1B96D9A20()
{
  return MEMORY[0x1E0CB0A20]();
}

uint64_t sub_1B96D9A2C()
{
  return MEMORY[0x1E0CB0A30]();
}

uint64_t sub_1B96D9A38()
{
  return MEMORY[0x1E0CB0A40]();
}

uint64_t sub_1B96D9A44()
{
  return MEMORY[0x1E0CB0A48]();
}

uint64_t sub_1B96D9A50()
{
  return MEMORY[0x1E0CB0A50]();
}

uint64_t sub_1B96D9A5C()
{
  return MEMORY[0x1E0CB0A60]();
}

uint64_t sub_1B96D9A68()
{
  return MEMORY[0x1E0CB0A70]();
}

uint64_t sub_1B96D9A74()
{
  return MEMORY[0x1E0CB0A80]();
}

uint64_t sub_1B96D9A80()
{
  return MEMORY[0x1E0CB0A90]();
}

uint64_t sub_1B96D9A8C()
{
  return MEMORY[0x1E0CB0AE8]();
}

uint64_t sub_1B96D9A98()
{
  return MEMORY[0x1E0CB0B48]();
}

uint64_t sub_1B96D9AA4()
{
  return MEMORY[0x1E0CB0BE0]();
}

uint64_t sub_1B96D9AB0()
{
  return MEMORY[0x1E0CB0C30]();
}

uint64_t sub_1B96D9ABC()
{
  return MEMORY[0x1E0CB0C40]();
}

uint64_t sub_1B96D9AC8()
{
  return MEMORY[0x1E0CB0C48]();
}

uint64_t sub_1B96D9AD4()
{
  return MEMORY[0x1E0CB0C70]();
}

uint64_t sub_1B96D9AE0()
{
  return MEMORY[0x1E0CB0CB0]();
}

uint64_t sub_1B96D9AEC()
{
  return MEMORY[0x1E0CB0CB8]();
}

uint64_t sub_1B96D9AF8()
{
  return MEMORY[0x1E0CB0D10]();
}

uint64_t sub_1B96D9B04()
{
  return MEMORY[0x1E0CB0D28]();
}

uint64_t sub_1B96D9B10()
{
  return MEMORY[0x1E0CB0D30]();
}

uint64_t sub_1B96D9B1C()
{
  return MEMORY[0x1E0CB0D38]();
}

uint64_t sub_1B96D9B28()
{
  return MEMORY[0x1E0CB0D40]();
}

uint64_t sub_1B96D9B34()
{
  return MEMORY[0x1E0CB0D48]();
}

uint64_t sub_1B96D9B40()
{
  return MEMORY[0x1E0CB0D50]();
}

uint64_t sub_1B96D9B4C()
{
  return MEMORY[0x1E0CB0D58]();
}

uint64_t sub_1B96D9B58()
{
  return MEMORY[0x1E0CB0D60]();
}

uint64_t sub_1B96D9B64()
{
  return MEMORY[0x1E0CB0D90]();
}

uint64_t sub_1B96D9B70()
{
  return MEMORY[0x1E0CB0DB8]();
}

uint64_t sub_1B96D9B7C()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1B96D9B88()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1B96D9B94()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1B96D9BA0()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1B96D9BAC()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1B96D9BB8()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1B96D9BC4()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1B96D9BD0()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1B96D9BDC()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1B96D9BE8()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1B96D9BF4()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80330](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80338](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80340](c, data, *(_QWORD *)&len);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A90](key, value, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFStringRef CTFontCopyName(CTFontRef font, CFStringRef nameKey)
{
  return (CFStringRef)MEMORY[0x1E0CA79D8](font, nameKey);
}

CTFontRef CTFontCreateForString(CTFontRef currentFont, CFStringRef string, CFRange range)
{
  return (CTFontRef)MEMORY[0x1E0CA7A58](currentFont, string, range.location, range.length);
}

CTFontRef CTFontCreateUIFontForLanguage(CTFontUIFontType uiType, CGFloat size, CFStringRef language)
{
  return (CTFontRef)MEMORY[0x1E0CA7A68](*(_QWORD *)&uiType, language, size);
}

CTFontDescriptorRef CTFontDescriptorCreateMatchingFontDescriptor(CTFontDescriptorRef descriptor, CFSetRef mandatoryAttributes)
{
  return (CTFontDescriptorRef)MEMORY[0x1E0CA7AE8](descriptor, mandatoryAttributes);
}

CTFontDescriptorRef CTFontDescriptorCreateWithNameAndSize(CFStringRef name, CGFloat size)
{
  return (CTFontDescriptorRef)MEMORY[0x1E0CA7B10](name, size);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFPreferencesCopyValueWithContainer()
{
  return MEMORY[0x1E0C9A320]();
}

uint64_t _CFPreferencesSetValueWithContainer()
{
  return MEMORY[0x1E0C9A398]();
}

uint64_t _NSIsNSArray()
{
  return MEMORY[0x1E0C9A860]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

uint64_t os_eligibility_set_input()
{
  return MEMORY[0x1E0C84688]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

UBool u_isalpha(UChar32 c)
{
  return MEMORY[0x1E0DE5A20](*(_QWORD *)&c);
}

UBool u_ispunct(UChar32 c)
{
  return MEMORY[0x1E0DE5A48](*(_QWORD *)&c);
}

UBool u_isspace(UChar32 c)
{
  return MEMORY[0x1E0DE5A50](*(_QWORD *)&c);
}

uint64_t ualoc_getAppleParent()
{
  return MEMORY[0x1E0DE5B60]();
}

uint64_t ubrk_close()
{
  return MEMORY[0x1E0DE5C98]();
}

uint64_t ubrk_first()
{
  return MEMORY[0x1E0DE5CB0]();
}

uint64_t ubrk_next()
{
  return MEMORY[0x1E0DE5CE0]();
}

uint64_t ubrk_open()
{
  return MEMORY[0x1E0DE5CE8]();
}

uint64_t ucal_close()
{
  return MEMORY[0x1E0DE5D30]();
}

uint64_t ucal_getKeywordValuesForLocale()
{
  return MEMORY[0x1E0DE5D78]();
}

uint64_t ucal_getType()
{
  return MEMORY[0x1E0DE5DB8]();
}

uint64_t ucal_open()
{
  return MEMORY[0x1E0DE5DD8]();
}

uint64_t uenum_close()
{
  return MEMORY[0x1E0DE6240]();
}

uint64_t uenum_next()
{
  return MEMORY[0x1E0DE6250]();
}

uint64_t uldn_close()
{
  return MEMORY[0x1E0DE6300]();
}

uint64_t uldn_localeDisplayName()
{
  return MEMORY[0x1E0DE6318]();
}

uint64_t uldn_openForContext()
{
  return MEMORY[0x1E0DE6328]();
}

uint64_t uloc_addLikelySubtags()
{
  return MEMORY[0x1E0DE6388]();
}

uint64_t uloc_getBaseName()
{
  return MEMORY[0x1E0DE63B0]();
}

uint64_t uloc_getISO3Language()
{
  return MEMORY[0x1E0DE6408]();
}

uint64_t unumsys_close()
{
  return MEMORY[0x1E0DE6678]();
}

uint64_t unumsys_getName()
{
  return MEMORY[0x1E0DE6688]();
}

uint64_t unumsys_getRadix()
{
  return MEMORY[0x1E0DE6690]();
}

uint64_t unumsys_isAlgorithmic()
{
  return MEMORY[0x1E0DE6698]();
}

uint64_t unumsys_open()
{
  return MEMORY[0x1E0DE66A0]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return MEMORY[0x1E0C862F8]();
}

uint64_t xpc_set_event()
{
  return MEMORY[0x1E0C866E0]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x1E0C866E8](stream, targetq, handler);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

