@implementation CFXPreferences

void __36___CFXPreferences_resetPreferences___block_invoke_4(uint64_t a1, int a2, void *value)
{
  CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), value);
}

void __108___CFXPreferences_SearchListAdditions__withSearchListForIdentifier_container_cloudConfigurationURL_perform___block_invoke(uint64_t *a1, __CFString *theString, uint64_t a3, char a4, const __CFString *a5)
{
  __CFString *MutableCopy;
  _BOOL4 v11;
  uint64_t v12;
  _QWORD v13[12];
  char v14;
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
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v20 = &v19;
  v21 = 0x3052000000;
  v22 = __Block_byref_object_copy__2;
  v23 = __Block_byref_object_dispose__2;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  MutableCopy = theString;
  v18 = 0;
  if (a5)
  {
    MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, theString);
    CFStringAppend(MutableCopy, a5);
  }
  v11 = _CFPrefsArmPendingKVOSlot();
  v12 = a1[4];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __108___CFXPreferences_SearchListAdditions__withSearchListForIdentifier_container_cloudConfigurationURL_perform___block_invoke_2;
  v13[3] = &unk_1E1335148;
  v13[4] = v12;
  v13[5] = &v19;
  v13[8] = theString;
  v13[9] = a3;
  v13[10] = a1[6];
  v13[11] = a5;
  v14 = a4;
  v13[6] = &v15;
  v13[7] = MutableCopy;
  -[_CFXPreferences withSearchLists:](v12, (uint64_t)v13);
  if (a5)
    CFRelease(MutableCopy);
  if (*((_BYTE *)v16 + 24))
    objc_msgSend(*(id *)(v20[5] + 128), "setEnabled:", 1);
  (*(void (**)(void))(a1[5] + 16))();

  if (v11)
    -[_CFXPreferences _deliverPendingKVONotifications]((const os_unfair_lock *)a1[4]);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
}

id __108___CFXPreferences_SearchListAdditions__withSearchListForIdentifier_container_cloudConfigurationURL_perform___block_invoke_2(uint64_t a1, CFDictionaryRef theDict)
{
  void *v4;
  CFStringRef v5;
  CFStringRef v6;
  const __CFArray *v7;
  CFIndex Count;
  const __CFArray *v9;
  CFIndex v10;
  const __CFSet *v11;
  BOOL v12;
  uint64_t v13;
  const void *v14;
  uint64_t v16;
  CFPrefsConfigurationFileSource *v17[2];

  v17[1] = *(CFPrefsConfigurationFileSource **)MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = CFDictionaryGetValue(theDict, *(const void **)(a1 + 56));
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!v4)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = -[CFPrefsSearchListSource initWithIdentifier:containingPreferences:]([CFPrefsSearchListSource alloc], "initWithIdentifier:containingPreferences:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32));
    -[CFPrefsSearchListSource addManagedSourceForIdentifier:user:](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(__CFString **)(a1 + 64), *(_QWORD *)(a1 + 72));
    -[CFPrefsSearchListSource addManagedSourceForIdentifier:user:](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(__CFString **)(a1 + 64), (uint64_t)CFSTR("kCFPreferencesAnyUser"));
    -[CFPrefsSearchListSource addNamedVolatileSourceForIdentifier:](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), CFSTR("NSArgumentDomain"));
    v16 = 0;
    v17[0] = 0;
    v5 = -[CFPrefsSearchListSource copyCloudConfigurationWithURL:outConfigFileSource:outStoreName:](*(const __CFString **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(const void **)(a1 + 80), v17, (CFStringRef *)&v16);
    if (v5)
    {
      v6 = v5;
      -[CFPrefsSearchListSource addCloudSourceForIdentifier:configurationPath:storeName:container:](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(__CFString **)(a1 + 64), (uint64_t)v5, v16, *(const __CFString **)(a1 + 88));
      v7 = *(const __CFArray **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 96);
      Count = CFArrayGetCount(v7);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 128) = CFArrayGetValueAtIndex(v7, Count - 1);
      CFRelease(v6);
    }
    -[CFPrefsSearchListSource addSourceForIdentifier:user:byHost:container:](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(__CFString **)(a1 + 64), *(const __CFString **)(a1 + 72), *(unsigned __int8 *)(a1 + 96), *(const __CFString **)(a1 + 88));
    v9 = *(const __CFArray **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 96);
    v10 = CFArrayGetCount(v9);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 120) = CFArrayGetValueAtIndex(v9, v10 - 1);
    -[CFPrefsSearchListSource addSuiteSourceForIdentifier:user:](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 64), *(const __CFString **)(a1 + 72));
    -[CFPrefsSearchListSource addManagedSourceForIdentifier:user:](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), CFSTR("kCFPreferencesAnyApplication"), *(_QWORD *)(a1 + 72));
    -[CFPrefsSearchListSource addSourceForIdentifier:user:byHost:container:](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), CFSTR("kCFPreferencesAnyApplication"), *(const __CFString **)(a1 + 72), *(unsigned __int8 *)(a1 + 96), *(const __CFString **)(a1 + 88));
    -[CFPrefsSearchListSource addSourceForIdentifier:user:byHost:container:](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(__CFString **)(a1 + 64), CFSTR("kCFPreferencesAnyUser"), 1, 0);
    -[CFPrefsSearchListSource addSuiteSourceForIdentifier:user:](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 64), CFSTR("kCFPreferencesAnyUser"));
    -[CFPrefsSearchListSource addSourceForIdentifier:user:byHost:container:](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), CFSTR("kCFPreferencesAnyApplication"), CFSTR("kCFPreferencesAnyUser"), 1, 0);
    -[CFPrefsSearchListSource addNamedVolatileSourceForIdentifier:](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), CFSTR("NSRegistrationDomain"));
    if (v17[0])
    {
      -[CFPrefsSearchListSource addSource:](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v17[0]);

    }
    v11 = *(const __CFSet **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 104);
    if (v11)
      v12 = CFSetGetCount(v11) > 0;
    else
      v12 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v12;
    v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v13)
    {
      *(_BYTE *)(v13 + 136) = 1;
      v14 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    else
    {
      v14 = 0;
    }
    CFDictionarySetValue(theDict, *(const void **)(a1 + 56), v14);

    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  return v4;
}

uint64_t __76___CFXPreferences_copyAppValueForKey_identifier_container_configurationURL___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "copyValueForKey:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __96___CFXPreferences_SourceAdditions__withSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke(_QWORD *a1)
{
  const void *v2;
  const void *v3;
  const void *v4;
  const void *v5;

  v2 = (const void *)a1[4];
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[5];
  if (v3)
    CFRelease(v3);
  v4 = (const void *)a1[6];
  if (v4)
    CFRelease(v4);
  v5 = (const void *)a1[7];
  if (v5)
    CFRelease(v5);
}

uint64_t __66___CFXPreferences_copyValueForKey_identifier_user_host_container___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "copyValueForKey:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __58___CFXPreferences_appSynchronizeWithIdentifier_container___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "synchronize");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

os_unfair_lock_s *__54___CFXPreferences_copyDictionaryForApp_withContainer___block_invoke(uint64_t a1, os_unfair_lock_s *a2)
{
  os_unfair_lock_s *result;

  result = -[CFPrefsSource copyDictionary](a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

os_unfair_lock_s *__57___CFXPreferences_copyDictionaryForSourceWithIdentifier___block_invoke(uint64_t a1, os_unfair_lock_s *a2)
{
  os_unfair_lock_s *result;

  result = -[CFPrefsSource copyDictionary](a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __61___CFXPreferences_synchronizeIdentifier_user_host_container___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "synchronize");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __66___CFXPreferences_setValue_forKey_identifier_user_host_container___block_invoke(uint64_t a1, os_unfair_lock_s *a2)
{
  _QWORD v5[5];
  __int128 v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[CFPrefsSource setValue:forKey:from:](a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66___CFXPreferences_setValue_forKey_identifier_user_host_container___block_invoke_2;
  v5[3] = &unk_1E1336DB0;
  v5[4] = a2;
  v6 = *(_OWORD *)(a1 + 32);
  return -[os_unfair_lock_s transitionIntoDirectModeIfNeededWithRetryBlock:](a2, "transitionIntoDirectModeIfNeededWithRetryBlock:", v5);
}

void __68___CFXPreferences_copyValuesForKeys_identifier_user_host_container___block_invoke(uint64_t a1, os_unfair_lock_s *a2)
{
  const __CFArray *v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex i;
  const void *ValueAtIndex;
  const void *v9;
  const void *v10;

  os_unfair_lock_lock(a2 + 13);
  v4 = *(const __CFArray **)(a1 + 40);
  if (v4)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    Count = CFArrayGetCount(v4);
    if (Count >= 1)
    {
      v6 = Count;
      for (i = 0; i != v6; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v4, i);
        v9 = (const void *)-[os_unfair_lock_s alreadylocked_copyValueForKey:](a2, "alreadylocked_copyValueForKey:", ValueAtIndex);
        if (v9)
        {
          v10 = v9;
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), ValueAtIndex, v9);
          CFRelease(v10);
        }
      }
    }
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -[os_unfair_lock_s alreadylocked_copyDictionary](a2, "alreadylocked_copyDictionary");
  }
  os_unfair_lock_unlock(a2 + 13);
}

os_unfair_lock_s *__64___CFXPreferences_copyKeyListForIdentifier_user_host_container___block_invoke(uint64_t a1, os_unfair_lock_s *a2)
{
  os_unfair_lock_s *result;

  result = -[CFPrefsSource copyKeyList](a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __68___CFXPreferences_setBackupDisabled_identifier_user_host_container___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setBackupDisabled:", *(unsigned __int8 *)(a1 + 32));
}

void __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_9(uint64_t a1, const void *a2)
{
  -[CFPrefsSearchListSource addSource:](*(_QWORD *)(a1 + 32), a2);
}

void __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_6(uint64_t a1, const void *a2)
{
  -[CFPrefsSearchListSource addSource:](*(_QWORD *)(a1 + 32), a2);
}

void __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_5(uint64_t a1, const void *a2)
{
  -[CFPrefsSearchListSource addSource:](*(_QWORD *)(a1 + 32), a2);
}

void __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_10(uint64_t a1, const void *a2)
{
  -[CFPrefsSearchListSource addSource:](*(_QWORD *)(a1 + 32), a2);
}

void __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_9(uint64_t a1, const void *a2)
{
  -[CFPrefsSearchListSource removeSource:](*(_QWORD *)(a1 + 32), a2);
}

void __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_8(uint64_t a1, const void *a2)
{
  -[CFPrefsSearchListSource removeSource:](*(_QWORD *)(a1 + 32), a2);
}

void __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_5(uint64_t a1, const void *a2)
{
  -[CFPrefsSearchListSource removeSource:](*(_QWORD *)(a1 + 32), a2);
}

void __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_4(uint64_t a1, const void *a2)
{
  -[CFPrefsSearchListSource removeSource:](*(_QWORD *)(a1 + 32), a2);
}

void __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];
  __int128 v8;
  _QWORD v9[5];
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_2;
  v9[3] = &unk_1E1337380;
  v9[4] = v2;
  v10 = *(_OWORD *)(a1 + 48);
  -[_CFXPreferences withSuiteSearchListForIdentifier:user:locked:perform:](v2, v3, CFSTR("kCFPreferencesCurrentUser"), 1, (uint64_t)v9);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_6;
  v7[3] = &unk_1E1337380;
  v7[4] = v5;
  v8 = *(_OWORD *)(a1 + 48);
  -[_CFXPreferences withSuiteSearchListForIdentifier:user:locked:perform:](v5, v6, CFSTR("kCFPreferencesAnyUser"), 1, (uint64_t)v7);
}

void __36___CFXPreferences_resetPreferences___block_invoke_3(uint64_t a1, __CFDictionary *a2)
{
  const __CFDictionary *v4;
  void *Value;
  void *v6;
  id v7;
  id v8;
  const __CFDictionary *v9;
  CFIndex Count;
  const __CFDictionary *v11;
  _QWORD v12[6];

  v12[5] = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)&_CFPrefsDaemonLock);
  if (*(_BYTE *)(a1 + 64))
    -[_CFXPreferences destroyConnections](*(_QWORD **)(a1 + 32));
  os_unfair_lock_unlock((os_unfair_lock_t)&_CFPrefsDaemonLock);
  v4 = *(const __CFDictionary **)(a1 + 48);
  if (v4)
  {
    Value = (void *)CFDictionaryGetValue(v4, CFSTR("NSRegistrationDomain"));
    v6 = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 48), CFSTR("NSArgumentDomain"));
    if (Value)
      v7 = Value;
    if (v6)
      v8 = v6;
    CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(a1 + 48));
    if (a2)
      goto LABEL_9;
  }
  else
  {
    Value = 0;
    v6 = 0;
    if (a2)
LABEL_9:
      CFDictionaryRemoveAllValues(a2);
  }
  v9 = *(const __CFDictionary **)(a1 + 56);
  if (v9)
  {
    Count = CFDictionaryGetCount(v9);
    if (Count)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CFArrayCreateMutable(0, Count, &kCFTypeArrayCallBacks);
      v11 = *(const __CFDictionary **)(a1 + 56);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __36___CFXPreferences_resetPreferences___block_invoke_4;
      v12[3] = &unk_1E13371B0;
      v12[4] = *(_QWORD *)(a1 + 40);
      CFDictionaryApplyFunction(v11, (CFDictionaryApplierFunction)applyBlockApplier, v12);
    }
    CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(a1 + 56));
  }
  if (Value)
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 48), CFSTR("NSRegistrationDomain"), Value);
  if (v6)
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 48), CFSTR("NSArgumentDomain"), v6);

}

void __54___CFXPreferences_ingestVolatileStateFromPreferences___block_invoke_3(uint64_t a1, const void *a2, void *a3)
{
  void *v5;
  id v6;

  v5 = (void *)objc_msgSend(a3, "copyVolatileSourceWithContainingPreferences:", *(_QWORD *)(a1 + 32));
  if (!v5)
    __54___CFXPreferences_ingestVolatileStateFromPreferences___block_invoke_3_cold_1();
  v6 = v5;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), a2, v5);

}

void __41___CFXPreferences_registerDefaultValues___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41___CFXPreferences_registerDefaultValues___block_invoke_2;
  v5[3] = &__block_descriptor_56_e23_v16__0__CFPrefsSource_8l;
  v5[4] = a3;
  v5[5] = a2;
  v5[6] = a4;
  -[_CFXPreferences withNamedVolatileSourceForIdentifier:perform:](v4, CFSTR("NSRegistrationDomain"), (uint64_t)v5);
}

void __81___CFXPreferences_SourceAdditions__withNamedVolatileSourceForIdentifier_perform___block_invoke(uint64_t a1, CFDictionaryRef theDict)
{
  void *v4;
  id v5;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = CFDictionaryGetValue(theDict, *(const void **)(a1 + 48));
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = -[CFPrefsSource initWithContainingPreferences:]([CFPrefsSource alloc], "initWithContainingPreferences:", *(_QWORD *)(a1 + 32));
    CFDictionarySetValue(theDict, *(const void **)(a1 + 48), *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    _addBackstopValuesForIdentifierAndSource(*(const void **)(a1 + 56), *(os_unfair_lock_s **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }
  CFRelease(*(CFTypeRef *)(a1 + 48));
}

void __85___CFXPreferences_PlistSourceAdditions__withManagedSourceForIdentifier_user_perform___block_invoke(uint64_t a1, CFDictionaryRef theDict)
{
  void *v4;
  id v5;
  CFPrefsManagedSource *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = CFDictionaryGetValue(theDict, *(const void **)(a1 + 48));
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    v6 = [CFPrefsManagedSource alloc];
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 56);
      v8 = *(_QWORD *)(a1 + 64);
      v9 = *(_QWORD *)(a1 + 32);
      v10.receiver = v6;
      v10.super_class = (Class)CFPrefsManagedSource;
      v6 = (CFPrefsManagedSource *)objc_msgSendSuper2(&v10, sel_initWithDomain_user_byHost_containerPath_containingPreferences_, v7, v8, 1, 0, v9);
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v6;
    CFDictionarySetValue(theDict, *(const void **)(a1 + 48), *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }
  CFRelease(*(CFTypeRef *)(a1 + 48));
}

void __56___CFXPreferences_appValueIsForcedForKey_appIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  const void *v3;

  if (a2)
  {
    v3 = (const void *)objc_msgSend(a2, "copyValueForKey:", *(_QWORD *)(a1 + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3 != 0;
    if (v3)
      CFRelease(v3);
  }
}

void __56___CFXPreferences_appValueIsForcedForKey_appIdentifier___block_invoke(uint64_t a1, void *a2)
{
  const void *v3;

  if (a2)
  {
    v3 = (const void *)objc_msgSend(a2, "copyValueForKey:", *(_QWORD *)(a1 + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3 != 0;
    if (v3)
      CFRelease(v3);
  }
}

void __93___CFXPreferences_SearchListAdditions__withSuiteSearchListForIdentifier_user_locked_perform___block_invoke(uint64_t a1, const __CFDictionary *a2)
{
  uint64_t v4;
  uint64_t CacheStringForBundleID;
  CFStringRef v6;
  void *v7;
  uint64_t v8;
  const void *v9;
  id v10;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = _CFPrefsGetCacheStringForBundleID(*(__CFString **)(a1 + 56));
  v4 = *(_QWORD *)(a1 + 64);
  CacheStringForBundleID = _CFPrefsGetCacheStringForBundleID(*(__CFString **)(a1 + 56));
  v6 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("suite/%@/%@"), CacheStringForBundleID, v4);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = CFDictionaryGetValue(a2, v6);
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (!v7)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = -[CFPrefsSearchListSource initWithIdentifier:containingPreferences:]([CFPrefsSuiteSearchListSource alloc], "initWithIdentifier:containingPreferences:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v8)
    {
      *(_BYTE *)(v8 + 136) = 1;
      v9 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    }
    else
    {
      v9 = 0;
    }
    CFDictionarySetValue(a2, v6, v9);

    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  }
  v10 = v7;
  CFRelease(v6);
}

uint64_t __76___CFXPreferences_setValue_forKey_appIdentifier_container_configurationURL___block_invoke(uint64_t a1, os_unfair_lock_s *a2)
{
  _QWORD v5[5];
  __int128 v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[CFPrefsSource setValue:forKey:from:](a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76___CFXPreferences_setValue_forKey_appIdentifier_container_configurationURL___block_invoke_2;
  v5[3] = &unk_1E1336DB0;
  v5[4] = a2;
  v6 = *(_OWORD *)(a1 + 32);
  return -[os_unfair_lock_s transitionIntoDirectModeIfNeededWithRetryBlock:](a2, "transitionIntoDirectModeIfNeededWithRetryBlock:", v5);
}

void __41___CFXPreferences_registerDefaultValues___block_invoke_2(uint64_t a1, os_unfair_lock_s *a2)
{
  -[CFPrefsSource setValues:forKeys:count:copyValues:from:](a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1, 0);
}

CFDictionaryRef __40___CFXPreferences_synchronizeEverything__block_invoke(uint64_t a1, const __CFDictionary *a2)
{
  CFDictionaryRef result;

  result = CFDictionaryCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_8(uint64_t a1, const void *a2)
{
  -[CFPrefsSearchListSource addSource:](*(_QWORD *)(a1 + 32), a2);
}

void __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_4(uint64_t a1, const void *a2)
{
  -[CFPrefsSearchListSource addSource:](*(_QWORD *)(a1 + 32), a2);
}

void __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_7(uint64_t a1, const void *a2)
{
  -[CFPrefsSearchListSource removeSource:](*(_QWORD *)(a1 + 32), a2);
}

void __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_3(uint64_t a1, const void *a2)
{
  -[CFPrefsSearchListSource removeSource:](*(_QWORD *)(a1 + 32), a2);
}

void __96___CFXPreferences_SourceAdditions__withSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke_2()
{
  int out_token;
  uint64_t v1;

  v1 = *MEMORY[0x1E0C80C00];
  if ((__CF_FORK_STATE & 2) == 0)
    __CF_USED();
  if ((__CF_FORK_STATE & 1) != 0)
    __THE_PROCESS_HAS_FORKED_AND_YOU_CANNOT_USE_THIS_COREFOUNDATION_FUNCTIONALITY___YOU_MUST_EXEC__();
  if ((__CF_FORK_STATE & 1) == 0)
  {
    out_token = 0;
    notify_register_dispatch("com.apple.CFPreferences._domainsChangedExternally", &out_token, MEMORY[0x1E0C80D38], &__block_literal_global_177);
  }
}

void __52___CFXPreferences_flushCachesForAppIdentifier_user___block_invoke(uint64_t a1, uint64_t a2)
{
  xpc_object_t v4;
  xpc_object_t v5;
  void *v6;
  NSObject *v7;
  const os_unfair_lock *v8;
  void *v9;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;
  os_activity_scope_state_s state;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v4 = xpc_dictionary_create(0, 0, 0);
    v5 = _CFXPCCreateXPCObjectFromCFObject(*(__CFString **)(a1 + 40));
    if (v5)
    {
      v6 = v5;
      v7 = _os_activity_create(&dword_182A8C000, "Flushing Cached Preferences Data", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v7, &state);
      xpc_dictionary_set_value(v4, "CFPreferencesDomain", v6);
      xpc_release(v6);
      xpc_dictionary_set_int64(v4, "CFPreferencesOperation", 4);
      v11 = 0;
      v12 = &v11;
      v13 = 0x3052000000;
      v14 = __Block_byref_object_copy__6;
      v15 = __Block_byref_object_dispose__6;
      v16 = 0;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __52___CFXPreferences_flushCachesForAppIdentifier_user___block_invoke_2;
      v10[3] = &unk_1E1336DE0;
      v10[5] = v4;
      v10[6] = &v11;
      v10[4] = a2;
      v8 = *(const os_unfair_lock **)(a1 + 32);
      if (*(_DWORD *)(a1 + 48) == 2)
        CFPREFERENCES_IS_WAITING_FOR_SYSTEM_CFPREFSD(v8, (uint64_t)v10);
      else
        CFPREFERENCES_IS_WAITING_FOR_USER_CFPREFSD(v8, (uint64_t)v10);
      xpc_release(v4);
      v9 = (void *)v12[5];
      if (v9)
        xpc_release(v9);

      _Block_object_dispose(&v11, 8);
      os_activity_scope_leave(&state);
    }
    else
    {
      xpc_release(v4);
    }
  }
}

xpc_object_t __52___CFXPreferences_flushCachesForAppIdentifier_user___block_invoke_2(uint64_t a1)
{
  xpc_object_t result;

  result = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(a1 + 32), *(xpc_object_t *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  return result;
}

void __65___CFXPreferences_registerUserDefaultsInstance_configurationURL___block_invoke(uint64_t a1, uint64_t a2)
{
  if (objc_msgSend(*(id *)(a1 + 32), "_observingCFPreferences"))
    -[CFPrefsSearchListSource addPreferencesObserver:](a2, *(_QWORD *)(a1 + 32));
}

void __65___CFXPreferences__setupNewDaemonConnection_invalidationHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int64_t int64;
  const char *string;
  const char *v5;
  _BOOL4 v6;
  const char *v7;
  const char *v8;
  NSObject *v9;
  const __CFArray *value;
  CFDataRef v11;
  CFDataRef v12;
  id *v13;
  id Weak;
  uint64_t v15;
  const void *v16;
  __CFRunLoop *Main;
  __CFRunLoop *v18;
  _QWORD block[5];
  uint8_t buf[4];
  int64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = _CFPrefsClientLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int64 = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "CFPreferencesPID");
    string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), "CFPreferencesDomain");
    v5 = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), "CFPreferencesUncanonicalizedPath");
    v6 = xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 32), "CFPreferencesIsByHost");
    v7 = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), "CFPreferencesCloudConfig");
    v8 = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), "CFPreferencesUser");
    v9 = _CFPrefsClientLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134219266;
      v21 = int64;
      v22 = 2080;
      v23 = string;
      v24 = 2080;
      v25 = v8;
      v26 = 1024;
      v27 = v6;
      v28 = 2080;
      v29 = v5;
      v30 = 2080;
      v31 = v7;
      _os_log_debug_impl(&dword_182A8C000, v9, OS_LOG_TYPE_DEBUG, "Received remote change notification from process %lld for { domain: %s, user: %s, byHost: %d, path: %s, cloud configuration path: %s }", buf, 0x3Au);
    }
  }
  _CFPrefsArmPendingKVOSlot();
  value = (const __CFArray *)xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "CFPreferencesDomain");
  v11 = _CFXPCCreateCFObjectFromXPCObject(value);
  if (v11)
  {
    v12 = v11;
    v13 = (id *)(a1 + 40);
    if (objc_loadWeak(v13))
    {
      Weak = objc_loadWeak(v13);
      -[_CFXPreferences updateSearchListsForIdentifier:]((uint64_t)Weak, v12);
    }
    CFRelease(v12);
  }
  v15 = _CFGetTSD(0x10u);
  if (v15)
  {
    v16 = (const void *)v15;
    _CFSetTSD(0x10u, 0, 0);
    if (v16 != (const void *)16)
    {
      Main = CFRunLoopGetMain();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __65___CFXPreferences__setupNewDaemonConnection_invalidationHandler___block_invoke_89;
      block[3] = &unk_1E12E5C68;
      block[4] = v16;
      CFRunLoopPerformBlock(Main, CFSTR("kCFRunLoopCommonModes"), block);
      v18 = CFRunLoopGetMain();
      CFRunLoopWakeUp(v18);
      CFRelease(v16);
    }
  }
}

void __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_2(uint64_t *a1, void *a2)
{
  void *v4;
  uint64_t v5;
  const os_unfair_lock *v6;
  __CFString *v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  __CFString *v12;
  const __CFString *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[6];

  v16[5] = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a2, "copy");
  v5 = MEMORY[0x1E0C809B0];
  v6 = (const os_unfair_lock *)a1[4];
  v7 = (__CFString *)a1[5];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_3;
  v16[3] = &unk_1E1337358;
  v16[4] = v4;
  -[_CFXPreferences withManagedSourceForIdentifier:user:perform:](v6, v7, (uint64_t)CFSTR("kCFPreferencesCurrentUser"), (uint64_t)v16);
  v8 = a1[4];
  v9 = (__CFString *)a1[5];
  v10 = (const __CFString *)a1[6];
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_4;
  v15[3] = &unk_1E1334ED8;
  v15[4] = v4;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](v8, v9, CFSTR("kCFPreferencesCurrentUser"), 1, v10, 0, (uint64_t)v15);
  v11 = a1[4];
  v12 = (__CFString *)a1[5];
  v13 = (const __CFString *)a1[6];
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_5;
  v14[3] = &unk_1E1334ED8;
  v14[4] = v4;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](v11, v12, CFSTR("kCFPreferencesCurrentUser"), 0, v13, 0, (uint64_t)v14);
  -[CFPrefsSearchListSource freeze]((uint64_t)v4);
  -[_CFXPreferences replaceSearchList:withSearchList:](a1[4], (uint64_t)a2, (uint64_t)v4);

}

void __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_6(uint64_t *a1, void *a2)
{
  void *v4;
  uint64_t v5;
  const os_unfair_lock *v6;
  __CFString *v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  __CFString *v12;
  const __CFString *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[6];

  v16[5] = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a2, "copy");
  v5 = MEMORY[0x1E0C809B0];
  v6 = (const os_unfair_lock *)a1[4];
  v7 = (__CFString *)a1[5];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_7;
  v16[3] = &unk_1E1337358;
  v16[4] = v4;
  -[_CFXPreferences withManagedSourceForIdentifier:user:perform:](v6, v7, (uint64_t)CFSTR("kCFPreferencesAnyUser"), (uint64_t)v16);
  v8 = a1[4];
  v9 = (__CFString *)a1[5];
  v10 = (const __CFString *)a1[6];
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_8;
  v15[3] = &unk_1E1334ED8;
  v15[4] = v4;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](v8, v9, CFSTR("kCFPreferencesAnyUser"), 1, v10, 0, (uint64_t)v15);
  v11 = a1[4];
  v12 = (__CFString *)a1[5];
  v13 = (const __CFString *)a1[6];
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_9;
  v14[3] = &unk_1E1334ED8;
  v14[4] = v4;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](v11, v12, CFSTR("kCFPreferencesAnyUser"), 0, v13, 0, (uint64_t)v14);
  -[CFPrefsSearchListSource freeze]((uint64_t)v4);
  -[_CFXPreferences replaceSearchList:withSearchList:](a1[4], (uint64_t)a2, (uint64_t)v4);

}

void __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_3(uint64_t *a1, void *a2)
{
  void *v4;
  const os_unfair_lock *v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  __CFString *v12;
  const __CFString *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[6];

  v16[5] = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a2, "copy");
  v5 = (const os_unfair_lock *)a1[4];
  v6 = MEMORY[0x1E0C809B0];
  v7 = *(__CFString **)(*(_QWORD *)(a1[5] + 8) + 24);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_4;
  v16[3] = &unk_1E1334EB0;
  v16[4] = v4;
  -[_CFXPreferences withManagedSourceForIdentifier:user:perform:](v5, v7, (uint64_t)CFSTR("kCFPreferencesCurrentUser"), (uint64_t)v16);
  v8 = a1[4];
  v9 = *(__CFString **)(*(_QWORD *)(a1[5] + 8) + 24);
  v10 = *(const __CFString **)(*(_QWORD *)(a1[6] + 8) + 24);
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_5;
  v15[3] = &unk_1E1334ED8;
  v15[4] = v4;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](v8, v9, CFSTR("kCFPreferencesCurrentUser"), 1, v10, 0, (uint64_t)v15);
  v11 = a1[4];
  v12 = *(__CFString **)(*(_QWORD *)(a1[5] + 8) + 24);
  v13 = *(const __CFString **)(*(_QWORD *)(a1[6] + 8) + 24);
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_6;
  v14[3] = &unk_1E1334ED8;
  v14[4] = v4;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](v11, v12, CFSTR("kCFPreferencesCurrentUser"), 0, v13, 0, (uint64_t)v14);
  -[CFPrefsSearchListSource freeze]((uint64_t)v4);
  -[_CFXPreferences replaceSearchList:withSearchList:](a1[4], (uint64_t)a2, (uint64_t)v4);

}

void __73___CFXPreferences_SearchListAdditions__replaceSearchList_withSearchList___block_invoke(uint64_t a1, CFDictionaryRef theDict)
{
  unint64_t Count;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  const void **v10;
  unint64_t v11;
  const void **v12;
  id v13;
  uint64_t v14;
  const void *v15;
  const __CFArray *v16;
  CFIndex v17;
  CFIndex i;
  const void *ValueAtIndex;
  void *Value;
  _BYTE *v21;
  CFStringRef v22;
  NSException *v23;
  size_t v24;
  uint64_t v25;
  CFRange v26;

  v25 = *MEMORY[0x1E0C80C00];
  Count = CFDictionaryGetCount(theDict);
  if (((Count >> 59) & 0xF) != 0)
  {
    v22 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), 2 * Count);
    v23 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v22, 0);
    CFRelease(v22);
    objc_exception_throw(v23);
  }
  v6 = Count;
  if (Count)
    v7 = 2 * Count;
  else
    v7 = 1;
  v8 = MEMORY[0x1E0C80A78](v7, v5);
  v10 = (const void **)((char *)&v24 - v9);
  v24 = 0;
  if (v11 >= 0x101)
  {
    v10 = (const void **)_CFCreateArrayStorage(v8, 0, &v24);
    v12 = v10;
  }
  else
  {
    v12 = 0;
  }
  v13 = *(id *)(a1 + 32);
  CFDictionaryGetKeysAndValues(theDict, v10, &v10[v6]);
  if (v6 >= 1)
  {
    v14 = v6;
    do
    {
      v15 = v10[v6];
      if (v15 == *(const void **)(a1 + 32))
      {
        CFDictionaryReplaceValue(theDict, *v10, *(const void **)(a1 + 40));
      }
      else
      {
        v16 = (const __CFArray *)*((_QWORD *)v15 + 12);
        if (v16)
        {
          v26.length = CFArrayGetCount(*((CFArrayRef *)v15 + 12));
          v26.location = 0;
          if (CFArrayContainsValue(v16, v26, *(const void **)(a1 + 32)))
            CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 56), *v10);
        }
      }
      ++v10;
      --v14;
    }
    while (v14);
  }
  free(v12);
  v17 = CFArrayGetCount(*(CFArrayRef *)(a1 + 56));
  if (v17 >= 1)
  {
    for (i = 0; i != v17; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 56), i);
      Value = (void *)CFDictionaryGetValue(theDict, ValueAtIndex);
      v21 = (_BYTE *)objc_msgSend(Value, "copy", v24, v25);
      -[CFPrefsSearchListSource replaceSource:withSource:]((uint64_t)v21, *(const void **)(a1 + 32), *(const void **)(a1 + 40));
      if (v21)
        v21[136] = 1;
      -[_CFXPreferences replaceSearchList:withSearchList:](*(_QWORD *)(a1 + 48), Value, v21);

    }
  }
  CFRelease(*(CFTypeRef *)(a1 + 56));

}

void __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_7(uint64_t *a1, void *a2)
{
  void *v4;
  const os_unfair_lock *v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  __CFString *v12;
  const __CFString *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[6];

  v16[5] = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a2, "copy");
  v5 = (const os_unfair_lock *)a1[4];
  v6 = MEMORY[0x1E0C809B0];
  v7 = *(__CFString **)(*(_QWORD *)(a1[5] + 8) + 24);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_8;
  v16[3] = &unk_1E1334EB0;
  v16[4] = v4;
  -[_CFXPreferences withManagedSourceForIdentifier:user:perform:](v5, v7, (uint64_t)CFSTR("kCFPreferencesAnyUser"), (uint64_t)v16);
  v8 = a1[4];
  v9 = *(__CFString **)(*(_QWORD *)(a1[5] + 8) + 24);
  v10 = *(const __CFString **)(*(_QWORD *)(a1[6] + 8) + 24);
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_9;
  v15[3] = &unk_1E1334ED8;
  v15[4] = v4;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](v8, v9, CFSTR("kCFPreferencesAnyUser"), 1, v10, 0, (uint64_t)v15);
  v11 = a1[4];
  v12 = *(__CFString **)(*(_QWORD *)(a1[5] + 8) + 24);
  v13 = *(const __CFString **)(*(_QWORD *)(a1[6] + 8) + 24);
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_10;
  v14[3] = &unk_1E1334ED8;
  v14[4] = v4;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](v11, v12, CFSTR("kCFPreferencesAnyUser"), 0, v13, 0, (uint64_t)v14);
  -[CFPrefsSearchListSource freeze]((uint64_t)v4);
  -[_CFXPreferences replaceSearchList:withSearchList:](a1[4], (uint64_t)a2, (uint64_t)v4);

}

void __36___CFXPreferences_resetPreferences___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD v2[7];
  char v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __36___CFXPreferences_resetPreferences___block_invoke_2;
  v2[3] = &unk_1E1337200;
  v3 = *(_BYTE *)(a1 + 48);
  v2[6] = a2;
  -[_CFXPreferences withNamedVolatileSources:](*(_QWORD *)(a1 + 32), (uint64_t)v2);
}

void __54___CFXPreferences_ingestVolatileStateFromPreferences___block_invoke_2(uint64_t a1, CFDictionaryRef theDict)
{
  _QWORD context[4];
  __int128 v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  context[0] = MEMORY[0x1E0C809B0];
  context[1] = 3221225472;
  context[2] = __54___CFXPreferences_ingestVolatileStateFromPreferences___block_invoke_3;
  context[3] = &unk_1E1337138;
  v3 = *(_OWORD *)(a1 + 32);
  CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)applyBlockApplier, context);
}

void __54___CFXPreferences_ingestVolatileStateFromPreferences___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54___CFXPreferences_ingestVolatileStateFromPreferences___block_invoke_2;
  v3[3] = &unk_1E1337160;
  v2 = *(_QWORD *)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  v3[5] = a2;
  -[_CFXPreferences withNamedVolatileSources:](v2, (uint64_t)v3);
}

void __36___CFXPreferences_resetPreferences___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD v3[8];
  char v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36___CFXPreferences_resetPreferences___block_invoke_3;
  v3[3] = &unk_1E13371D8;
  v4 = *(_BYTE *)(a1 + 56);
  v2 = *(_QWORD *)(a1 + 48);
  v3[6] = a2;
  v3[7] = v2;
  -[_CFXPreferences withSources:](*(_QWORD *)(a1 + 32), (uint64_t)v3);
}

void __65___CFXPreferences__setupNewDaemonConnection_invalidationHandler___block_invoke(uint64_t a1, id a2)
{
  uint64_t v4;
  _xpc_connection_s *remote_connection;
  xpc_object_t reply;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (object_getClass(a2) == (Class)MEMORY[0x1E0C812F8])
  {
    remote_connection = xpc_dictionary_get_remote_connection(a2);
    reply = xpc_dictionary_create_reply(a2);
    if (reply)
    {
      v7 = reply;
      xpc_connection_send_message(remote_connection, reply);
      xpc_release(v7);
    }
    else
    {
      v8 = (void *)MEMORY[0x186DB1518](a2);
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
      v9 = _CFPrefsClientLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v14 = v8;
        _os_log_impl(&dword_182A8C000, v9, OS_LOG_TYPE_INFO, "CFPrefs client received non-reply message: %s", buf, 0xCu);
      }
      _CFSetTSD(0xFu, 0, 0);
      free(v8);
    }
    if (_block_invoke_onceToken != -1)
      dispatch_once(&_block_invoke_onceToken, &__block_literal_global_44);
    v10 = _block_invoke_observationCallBackQueue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __65___CFXPreferences__setupNewDaemonConnection_invalidationHandler___block_invoke_2;
    v11[3] = &unk_1E13372E8;
    v11[4] = a2;
    objc_copyWeak(&v12, (id *)(a1 + 40));
    dispatch_async(v10, v11);
    objc_destroyWeak(&v12);
  }
  else if (a2 == (id)MEMORY[0x1E0C81260])
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
      (*(void (**)(void))(v4 + 16))();
  }
}

void __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke(uint64_t a1)
{
  CFTypeRef v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;
  _QWORD v9[4];
  __int128 v10;
  uint64_t v11;
  _QWORD v12[2];
  void (*v13)(uint64_t);
  void *v14;
  CFTypeRef v15;
  CFStringRef v16;
  char v17;
  __int16 v18;
  CFTypeRef v19;
  CFStringRef v20;
  CFStringRef v21[2];

  v21[1] = *(CFStringRef *)MEMORY[0x1E0C80C00];
  v20 = 0;
  v21[0] = 0;
  v19 = 0;
  v18 = 0;
  v17 = 0;
  _CFPrefsExtractQuadrupleFromPathIfPossible(*(const __CFString **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), v21, &v20, &v19, &v18, (_BYTE *)&v18 + 1, &v17);
  if (v21[0])
    *(CFStringRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v21[0];
  if (v20)
  {
    CFRelease(v20);
    v20 = 0;
  }
  v2 = v19;
  if (v19)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v19;
  v3 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v13 = __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_2;
  v14 = &__block_descriptor_48_e5_v8__0l;
  v15 = v2;
  v16 = v21[0];
  if (HIBYTE(v18))
  {
    __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_2((uint64_t)v12);
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_3;
    v9[3] = &unk_1E1336F30;
    v10 = *(_OWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 56);
    v11 = *(_QWORD *)(a1 + 48);
    -[_CFXPreferences withSuiteSearchListForIdentifier:user:locked:perform:](v10, v4, CFSTR("kCFPreferencesCurrentUser"), 1, (uint64_t)v9);
    v6[0] = v3;
    v6[1] = 3221225472;
    v6[2] = __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_7;
    v6[3] = &unk_1E1336F30;
    v7 = *(_OWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 48);
    -[_CFXPreferences withSuiteSearchListForIdentifier:user:locked:perform:](v7, v5, CFSTR("kCFPreferencesAnyUser"), 1, (uint64_t)v6);
    v13((uint64_t)v12);
  }
}

void __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_2(uint64_t a1)
{
  const void *v2;
  const void *v3;

  v2 = *(const void **)(a1 + 32);
  if (v2)
    CFRelease(v2);
  v3 = *(const void **)(a1 + 40);
  if (v3)
    CFRelease(v3);
}

void __96___CFXPreferences_SourceAdditions__withSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke_3()
{
  id v0;
  __CFNotificationCenter *LocalCenter;
  const __CFDictionary *v2;
  __CFNotificationCenter *v3;

  if ((__CF_FORK_STATE & 2) == 0)
    __CF_USED();
  if ((__CF_FORK_STATE & 1) != 0)
    __THE_PROCESS_HAS_FORKED_AND_YOU_CANNOT_USE_THIS_COREFOUNDATION_FUNCTIONALITY___YOU_MUST_EXEC__();
  if ((__CF_FORK_STATE & 1) == 0)
  {
    if (_CFPreferencesDoesNSUserDefaultsExist())
    {
      v0 = _CFPreferencesCopyStandardUserDefaults();
      LocalCenter = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(LocalCenter, CFSTR("NSUserDefaultsDidChangeNotification"), v0, 0, 1u);

    }
    v2 = CFDictionaryCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, 0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v3 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(v3, CFSTR("com.apple.CFPreferences._didChange"), CFSTR("com.apple.CFPreferences"), v2, 1u);
    CFRelease(v2);
  }
}

void __96___CFXPreferences_SourceAdditions__withSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke_178(uint64_t a1, CFDictionaryRef theDict)
{
  void *v4;
  id v5;
  const __CFString *v6;
  const __CFDictionary *Mutable;
  __objc2_class **Value;
  const __CFString *v9;
  const UInt8 *v10;
  NSObject *v11;
  CFPrefsCloudSource *v12;
  NSObject *v13;
  char v14[100];
  UInt8 buffer[1024];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = CFDictionaryGetValue(theDict, *(const void **)(a1 + 48));
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    v6 = *(const __CFString **)(a1 + 56);
    if (CFEqual(v6, CFSTR("kCFPreferencesAnyUser")))
      goto LABEL_29;
    os_unfair_lock_lock((os_unfair_lock_t)&__useVolatileDomainsForUser_volatileHomeDirsLock);
    Mutable = (const __CFDictionary *)__useVolatileDomainsForUser_volatileHomeDirs;
    if (!__useVolatileDomainsForUser_volatileHomeDirs)
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      __useVolatileDomainsForUser_volatileHomeDirs = (uint64_t)Mutable;
    }
    Value = (__objc2_class **)CFDictionaryGetValue(Mutable, v6);
    if (!Value)
    {
      if (CFEqual(CFSTR("kCFPreferencesCurrentUser"), v6))
        v9 = 0;
      else
        v9 = v6;
      v10 = CFCopyHomeDirectoryURLForUser(v9);
      if ((_CFURLExists((const __CFURL *)v10) & 1) != 0)
      {
        Value = &__kCFBooleanFalse;
      }
      else
      {
        bzero(buffer, 0x400uLL);
        CFURLGetFileSystemRepresentation((CFURLRef)v10, 1u, buffer, 1024);
        CFStringGetCString(v6, v14, 100, 0x8000100u);
        v11 = _CFPrefsClientLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          __96___CFXPreferences_SourceAdditions__withSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke_178_cold_2(v11);
        Value = &__kCFBooleanTrue;
      }
      if (v10)
        CFRelease(v10);
      CFDictionarySetValue((CFMutableDictionaryRef)__useVolatileDomainsForUser_volatileHomeDirs, v6, Value);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&__useVolatileDomainsForUser_volatileHomeDirsLock);
    if (Value == &__kCFBooleanTrue || (__overrideUseVolatileDomainsForUser & 1) != 0)
    {
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
      v13 = _CFPrefsClientLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __96___CFXPreferences_SourceAdditions__withSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke_178_cold_1(a1, (uint64_t *)(a1 + 56), v13);
      _CFSetTSD(0xFu, 0, 0);
      v12 = -[CFPrefsSource initWithContainingPreferences:]([CFPrefsSource alloc], "initWithContainingPreferences:", *(_QWORD *)(a1 + 32));
    }
    else
    {
LABEL_29:
      if (*(_BYTE *)(a1 + 80))
        v12 = -[CFPrefsCloudSource initWithDomain:user:byHost:containerPath:containingPreferences:]([CFPrefsCloudSource alloc], "initWithDomain:user:byHost:containerPath:containingPreferences:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 81), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32));
      else
        v12 = -[CFPrefsPlistSource initWithDomain:user:byHost:containerPath:containingPreferences:]([CFPrefsPlistSource alloc], "initWithDomain:user:byHost:containerPath:containingPreferences:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 81), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32));
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v12;
    CFDictionarySetValue(theDict, *(const void **)(a1 + 48), *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }
}

id __115___CFXPreferences_SourceAdditions__assertEquivalence_ofIdentifiers_users_hosts_containers_managedFlags_cloudFlags___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  id result;

  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v4)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      if (v4 != a2)
        _CFThrowFormattedException((uint64_t)CFSTR("NSInvalidArgumentException"), CFSTR("%@ doesn't match %@"), v4, a2);
    }
    else if (v4 == a2)
    {
      __115___CFXPreferences_SourceAdditions__assertEquivalence_ofIdentifiers_users_hosts_containers_managedFlags_cloudFlags___block_invoke_cold_1((uint64_t)a2);
    }
  }

  result = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

uint64_t __115___CFXPreferences_SourceAdditions__assertEquivalence_ofIdentifiers_users_hosts_containers_managedFlags_cloudFlags___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __115___CFXPreferences_SourceAdditions__assertEquivalence_ofIdentifiers_users_hosts_containers_managedFlags_cloudFlags___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __112___CFXPreferences_SearchListAdditions__with23930198HackSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke(uint64_t a1, __CFString *a2, const __CFString *a3, int a4, const __CFString *a5)
{
  char v6;
  const __CFString *CacheKeyForQuintuplet;
  uint64_t v11;
  _QWORD v12[11];
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;
  uint64_t v24;

  v6 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x3052000000;
  v21 = __Block_byref_object_copy__2;
  v22 = __Block_byref_object_dispose__2;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  CacheKeyForQuintuplet = _CFPrefsCreateCacheKeyForQuintuplet(a2, a3, a4, a5, 0);
  v11 = *(_QWORD *)(a1 + 32);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __112___CFXPreferences_SearchListAdditions__with23930198HackSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke_115;
  v12[3] = &unk_1E13350F8;
  v12[4] = v11;
  v12[5] = &v18;
  v12[8] = a2;
  v12[9] = a5;
  v12[10] = a3;
  v13 = v6;
  v12[6] = &v14;
  v12[7] = CacheKeyForQuintuplet;
  -[_CFXPreferences withSearchLists:](v11, (uint64_t)v12);
  if (*((_BYTE *)v15 + 24))
    objc_msgSend(*(id *)(v19[5] + 128), "setEnabled:", 1);
  CFRelease(CacheKeyForQuintuplet);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
}

id __112___CFXPreferences_SearchListAdditions__with23930198HackSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke_115(uint64_t a1, CFDictionaryRef theDict)
{
  void *v4;
  uint64_t v5;
  const void *v6;
  CFStringRef v7;
  CFStringRef v8;
  const __CFArray *v9;
  CFIndex Count;
  const __CFArray *v11;
  CFIndex v12;
  uint64_t v13;
  const __CFSet *v14;
  BOOL v15;
  const __CFArray *v16;
  uint64_t v17;
  const void *v18;
  CFTypeRef cf;
  CFPrefsConfigurationFileSource *v21[2];

  v21[1] = *(CFPrefsConfigurationFileSource **)MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = CFDictionaryGetValue(theDict, *(const void **)(a1 + 56));
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v4)
    return v4;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = -[CFPrefsSearchListSource initWithIdentifier:containingPreferences:]([CFPrefsSearchListSource alloc], "initWithIdentifier:containingPreferences:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32));
  v5 = _CFPrefsTestingCloudConfigurationOverrideURL;
  if (_CFPrefsTestingCloudConfigurationOverrideURL)
  {
    if (CFURLGetTypeID() == 29)
      v6 = (const void *)v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  cf = 0;
  v21[0] = 0;
  v7 = -[CFPrefsSearchListSource copyCloudConfigurationWithURL:outConfigFileSource:outStoreName:](*(const __CFString **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v6, v21, (CFStringRef *)&cf);
  if (v7)
  {
    v8 = v7;
    -[CFPrefsSearchListSource addCloudSourceForIdentifier:configurationPath:storeName:container:](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(__CFString **)(a1 + 64), (uint64_t)v7, (uint64_t)cf, *(const __CFString **)(a1 + 72));
    v9 = *(const __CFArray **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 96);
    Count = CFArrayGetCount(v9);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 128) = CFArrayGetValueAtIndex(v9, Count - 1);
    CFRelease(v8);
  }
  -[CFPrefsSearchListSource addSourceForIdentifier:user:byHost:container:](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(__CFString **)(a1 + 64), *(const __CFString **)(a1 + 80), *(unsigned __int8 *)(a1 + 88), *(const __CFString **)(a1 + 72));
  v11 = *(const __CFArray **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 96);
  v12 = CFArrayGetCount(v11);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 120) = CFArrayGetValueAtIndex(v11, v12 - 1);
  if (v21[0])
  {
    -[CFPrefsSearchListSource addSource:](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v21[0]);

  }
  v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v14 = *(const __CFSet **)(v13 + 104);
  if (v14)
  {
    if (CFSetGetCount(v14) > 0)
    {
      v15 = 1;
      goto LABEL_18;
    }
    v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  v16 = *(const __CFArray **)(v13 + 112);
  if (v16)
    v15 = CFArrayGetCount(v16) > 0;
  else
    v15 = 0;
LABEL_18:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v15;
  v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v17)
  {
    *(_BYTE *)(v17 + 136) = 1;
    v18 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  else
  {
    v18 = 0;
  }
  CFDictionarySetValue(theDict, *(const void **)(a1 + 56), v18);

  if (cf)
    CFRelease(cf);
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  return v4;
}

id __106___CFXPreferences_SearchListAdditions__assertEquivalence_ofIdentifiers_containers_cloudConfigurationURLs___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  id result;

  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v4)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      if (v4 != a2)
        __106___CFXPreferences_SearchListAdditions__assertEquivalence_ofIdentifiers_containers_cloudConfigurationURLs___block_invoke_cold_2();
    }
    else if (v4 == a2)
    {
      __106___CFXPreferences_SearchListAdditions__assertEquivalence_ofIdentifiers_containers_cloudConfigurationURLs___block_invoke_cold_1();
    }
  }

  result = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

void __50___CFXPreferences_unregisterUserDefaultsInstance___block_invoke(uint64_t a1, uint64_t a2)
{
  -[CFPrefsSearchListSource removePreferencesObserver:](a2, *(_QWORD *)(a1 + 32));
}

void __38___CFXPreferences_flushManagedSources__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  xpc_object_t v5;
  const os_unfair_lock *v6;
  void *v7;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;
  os_activity_scope_state_s state;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v4 = _os_activity_create(&dword_182A8C000, "Notifying CFPrefsD Of Updated Managed Preferences", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v5, "CFPreferencesOperation", 3);
    v9 = 0;
    v10 = &v9;
    v11 = 0x3052000000;
    v12 = __Block_byref_object_copy__6;
    v13 = __Block_byref_object_dispose__6;
    v14 = 0;
    v6 = *(const os_unfair_lock **)(a1 + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __38___CFXPreferences_flushManagedSources__block_invoke_50;
    v8[3] = &unk_1E1336DE0;
    v8[5] = v5;
    v8[6] = &v9;
    v8[4] = a2;
    CFPREFERENCES_IS_WAITING_FOR_SYSTEM_CFPREFSD(v6, (uint64_t)v8);
    xpc_release(v5);
    v7 = (void *)v10[5];
    if (v7)
      xpc_release(v7);

    _Block_object_dispose(&v9, 8);
    os_activity_scope_leave(&state);
  }
}

xpc_object_t __38___CFXPreferences_flushManagedSources__block_invoke_50(uint64_t a1)
{
  xpc_object_t result;

  result = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(a1 + 32), *(xpc_object_t *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  return result;
}

uint64_t __80___CFXPreferences_hasCloudValueForKey_appIdentifier_container_configurationURL___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = -[CFPrefsSearchListSource alreadylocked_hasCloudValueForKey:](a2, *(const __CFString **)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

BOOL __88___CFXPreferences_hasNonRegisteredValueForKey_appIdentifier_container_configurationURL___block_invoke(uint64_t a1, uint64_t a2)
{
  _BOOL8 result;

  result = -[CFPrefsSearchListSource alreadylocked_hasNonRegisteredValueForKey:](a2, *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __72___CFXPreferences_setDaemonCacheEnabled_identifier_user_host_container___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDaemonCacheEnabled:", *(unsigned __int8 *)(a1 + 32));
}

void __61___CFXPreferences_simulateTimerSynchronizeForTestingForUser___block_invoke(uint64_t a1, uint64_t a2)
{
  xpc_object_t v4;
  const os_unfair_lock *v5;
  void *v6;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v4, "CFPreferencesOperation", 999);
    v8 = 0;
    v9 = &v8;
    v10 = 0x3052000000;
    v11 = __Block_byref_object_copy__6;
    v12 = __Block_byref_object_dispose__6;
    v13 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __61___CFXPreferences_simulateTimerSynchronizeForTestingForUser___block_invoke_2;
    v7[3] = &unk_1E1336DE0;
    v7[5] = v4;
    v7[6] = &v8;
    v7[4] = a2;
    v5 = *(const os_unfair_lock **)(a1 + 32);
    if (*(_DWORD *)(a1 + 40) == 2)
      CFPREFERENCES_IS_WAITING_FOR_SYSTEM_CFPREFSD(v5, (uint64_t)v7);
    else
      CFPREFERENCES_IS_WAITING_FOR_USER_CFPREFSD(v5, (uint64_t)v7);
    xpc_release(v4);
    v6 = (void *)v9[5];
    if (v6)
      xpc_release(v6);
    _Block_object_dispose(&v8, 8);
  }
}

xpc_object_t __61___CFXPreferences_simulateTimerSynchronizeForTestingForUser___block_invoke_2(uint64_t a1)
{
  xpc_object_t result;

  result = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(a1 + 32), *(xpc_object_t *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  return result;
}

uint64_t __73___CFXPreferences_setFileProtectionClass_identifier_user_host_container___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFileProtectionClass:", *(unsigned int *)(a1 + 32));
}

uint64_t __72___CFXPreferences_fileProtectionClassForIdentifier_user_host_container___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  int v5;
  char v6[1024];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  bzero(v6, 0x400uLL);
  result = _CFPrefsGetPathForTriplet((__CFString *)objc_msgSend(a2, "domainIdentifier"), (const __CFString *)objc_msgSend(a2, "userIdentifier"), objc_msgSend(a2, "isByHost"), (CFStringRef)objc_msgSend(a2, "container"), (UInt8 *)v6);
  if ((_DWORD)result)
  {
    result = open_dprotected_np(v6, 0, 0, 1);
    if ((_DWORD)result != -1)
    {
      v5 = result;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = fcntl(result, 63);
      return close(v5);
    }
  }
  return result;
}

uint64_t __56___CFXPreferences_setAccessRestricted_forAppIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAccessRestricted:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __101___CFXPreferences_fullCloudSynchronizeForAppIdentifier_container_configurationURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fullCloudSynchronizeWithCompletionHandler:", *(_QWORD *)(a1 + 32));
}

void __70___CFXPreferences_setCloudSyncEnabled_forKey_appIdentifier_container___block_invoke(uint64_t a1, uint64_t a2)
{
  -[CFPrefsSearchListSource setCloudEnabled:forKey:](a2, *(unsigned __int8 *)(a1 + 40), *(const void **)(a1 + 32));
}

void __89___CFXPreferences_setValuesForKeys_removingValuesForKeys_identifier_user_host_container___block_invoke(uint64_t a1, uint64_t a2)
{
  const __CFDictionary *v2;
  uint64_t v3;
  _QWORD v4[7];

  v4[6] = *MEMORY[0x1E0C80C00];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __89___CFXPreferences_setValuesForKeys_removingValuesForKeys_identifier_user_host_container___block_invoke_2;
  v4[3] = &unk_1E1336FF0;
  v2 = *(const __CFDictionary **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[4] = a2;
  v4[5] = v3;
  withKeysAndValues(v2, (uint64_t)v4);
}

void __89___CFXPreferences_setValuesForKeys_removingValuesForKeys_identifier_user_host_container___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  const __CFArray *v8;
  unint64_t Count;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  const void **v14;
  const void **v15;
  void *v16;
  CFStringRef v17;
  NSException *v18;
  uint64_t v19;
  _QWORD v20[10];
  size_t v21[2];
  CFRange v22;

  v21[1] = *MEMORY[0x1E0C80C00];
  v8 = *(const __CFArray **)(a1 + 40);
  if (v8)
  {
    Count = CFArrayGetCount(v8);
    v11 = Count;
    if (Count >> 60)
    {
      v17 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), Count);
      v18 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v17, 0);
      CFRelease(v17);
      objc_exception_throw(v18);
    }
    if (Count <= 1)
      Count = 1;
    v12 = MEMORY[0x1E0C80A78](Count, v10);
    v14 = (const void **)((char *)v20 - v13);
    v21[0] = 0;
    if (v11 >= 0x101)
    {
      v15 = (const void **)_CFCreateArrayStorage(v12, 0, v21);
      v14 = v15;
    }
    else
    {
      v15 = 0;
      if (!v11)
        goto LABEL_11;
    }
    v22.location = 0;
    v22.length = v11;
    CFArrayGetValues(*(CFArrayRef *)(a1 + 40), v22, v14);
  }
  else
  {
    MEMORY[0x1E0C80A78](0, a2);
    v14 = (const void **)&v19;
    v15 = 0;
    v11 = 0;
    v21[0] = 0;
  }
LABEL_11:
  -[CFPrefsSource setValues:forKeys:count:copyValues:removeValuesForKeys:count:from:](*(os_unfair_lock_s **)(a1 + 32), a3, a2, a4, 1, (uint64_t)v14, v11, 0);
  v16 = *(void **)(a1 + 32);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __89___CFXPreferences_setValuesForKeys_removingValuesForKeys_identifier_user_host_container___block_invoke_3;
  v20[3] = &unk_1E1336FC8;
  v20[4] = v16;
  v20[5] = a3;
  v20[6] = a2;
  v20[7] = a4;
  v20[8] = v14;
  v20[9] = v11;
  objc_msgSend(v16, "transitionIntoDirectModeIfNeededWithRetryBlock:", v20);
  free(v15);
}

void __89___CFXPreferences_setValuesForKeys_removingValuesForKeys_identifier_user_host_container___block_invoke_3(uint64_t a1)
{
  -[CFPrefsSource setValues:forKeys:count:copyValues:removeValuesForKeys:count:from:](*(os_unfair_lock_s **)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 1, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), 0);
}

void __76___CFXPreferences_setValue_forKey_appIdentifier_container_configurationURL___block_invoke_2(uint64_t a1)
{
  -[CFPrefsSource setValue:forKey:from:](*(os_unfair_lock_s **)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

void __74___CFXPreferences_copyManagedValuesForKeys_identifier_useSystemContainer___block_invoke(uint64_t a1, os_unfair_lock_s *a2)
{
  const __CFArray *v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex i;
  const void *ValueAtIndex;
  const void *v9;
  const void *v10;

  os_unfair_lock_lock(a2 + 13);
  v4 = *(const __CFArray **)(a1 + 40);
  if (v4)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    Count = CFArrayGetCount(v4);
    if (Count >= 1)
    {
      v6 = Count;
      for (i = 0; i != v6; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v4, i);
        v9 = (const void *)-[CFPrefsSearchListSource alreadylocked_copyManagedValueForKey:]();
        if (v9)
        {
          v10 = v9;
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), ValueAtIndex, v9);
          CFRelease(v10);
        }
      }
    }
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -[CFPrefsSearchListSource alreadylocked_copyManagedDictionary](a2);
  }
  os_unfair_lock_unlock(a2 + 13);
}

void __66___CFXPreferences_setValue_forKey_identifier_user_host_container___block_invoke_2(uint64_t a1)
{
  -[CFPrefsSource setValue:forKey:from:](*(os_unfair_lock_s **)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

void __85___CFXPreferences_replaceValuesInSourceForIdentifier_user_host_container_withValues___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  const os_unfair_lock *v8;
  __CFString *v9;
  const __CFString *v10;
  _BOOL4 v11;
  const __CFString *v12;
  _QWORD v13[8];

  v13[7] = *MEMORY[0x1E0C80C00];
  v8 = *(const os_unfair_lock **)(a1 + 32);
  v9 = *(__CFString **)(a1 + 40);
  v10 = *(const __CFString **)(a1 + 48);
  v11 = CFEqual(*(CFTypeRef *)(a1 + 56), CFSTR("kCFPreferencesCurrentHost")) != 0;
  v12 = *(const __CFString **)(a1 + 64);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __85___CFXPreferences_replaceValuesInSourceForIdentifier_user_host_container_withValues___block_invoke_2;
  v13[3] = &__block_descriptor_56_e23_v16__0__CFPrefsSource_8l;
  v13[4] = a3;
  v13[5] = a2;
  v13[6] = a4;
  -[_CFXPreferences with23930198HackSourceForIdentifier:user:byHost:container:cloud:perform:](v8, v9, v10, v11, v12, 0, (uint64_t)v13);
}

void __85___CFXPreferences_replaceValuesInSourceForIdentifier_user_host_container_withValues___block_invoke_2(uint64_t a1, os_unfair_lock_s *a2)
{
  -[CFPrefsSource replaceAllValuesWithValues:forKeys:count:from:](a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

void __47___CFXPreferences_removeVolatileSourceForName___block_invoke(uint64_t a1, CFMutableDictionaryRef theDict)
{
  CFDictionaryRemoveValue(theDict, *(const void **)(a1 + 32));
}

os_unfair_lock_s *__59___CFXPreferences_copyDictionaryForVolatileSourceWithName___block_invoke(uint64_t a1, os_unfair_lock_s *a2)
{
  os_unfair_lock_s *result;

  result = -[CFPrefsSource copyDictionary](a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

os_unfair_lock_s *__59___CFXPreferences_copyDictionaryForVolatileSourceWithName___block_invoke_2(uint64_t a1, CFDictionaryRef theDict)
{
  os_unfair_lock_s *result;

  result = (os_unfair_lock_s *)CFDictionaryGetValue(theDict, *(const void **)(a1 + 40));
  if (result)
  {
    result = -[CFPrefsSource copyDictionary](result);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

void __38___CFXPreferences_volatileSourceNames__block_invoke(uint64_t a1, CFDictionaryRef theDict)
{
  CFIndex Count;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  const void **v8;
  const void **v9;
  CFStringRef v10;
  NSException *v11;
  size_t v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  Count = CFDictionaryGetCount(theDict);
  if (Count >= 1)
  {
    v6 = Count;
    if ((unint64_t)Count >> 60)
    {
      v10 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), Count);
      v11 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v10, 0);
      CFRelease(v10);
      objc_exception_throw(v11);
    }
    MEMORY[0x1E0C80A78](Count, v5);
    v8 = (const void **)((char *)v12 - v7);
    v12[0] = 0;
    if (v6 >= 0x101)
    {
      v8 = (const void **)_CFCreateArrayStorage(v6, 0, v12);
      v9 = v8;
    }
    else
    {
      v9 = 0;
    }
    CFDictionaryGetKeysAndValues(theDict, v8, 0);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFArrayCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, v8, v6, &kCFTypeArrayCallBacks);
    free(v9);
  }
}

void __39___CFXPreferences_resetUserPreferences__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD v2[8];

  v2[7] = *MEMORY[0x1E0C80C00];
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __39___CFXPreferences_resetUserPreferences__block_invoke_2;
  v2[3] = &unk_1E1337278;
  v2[6] = a2;
  -[_CFXPreferences withNamedVolatileSources:](*(_QWORD *)(a1 + 32), (uint64_t)v2);
}

void __39___CFXPreferences_resetUserPreferences__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD v3[9];

  v3[8] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39___CFXPreferences_resetUserPreferences__block_invoke_3;
  v3[3] = &unk_1E1337250;
  v2 = *(_QWORD *)(a1 + 48);
  v3[6] = a2;
  v3[7] = v2;
  -[_CFXPreferences withSources:](*(_QWORD *)(a1 + 32), (uint64_t)v3);
}

void __39___CFXPreferences_resetUserPreferences__block_invoke_3(uint64_t a1, const __CFDictionary *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  const void **v7;
  const void **v8;
  const void **v9;
  id *v10;
  const void **v11;
  const __CFDictionary *v12;
  int Count;
  const void **v14;
  const void **v15;
  const void **v16;
  uint64_t v17;
  id *v18;
  const void **v19;
  const void *v20;
  const __CFDictionary *v21;
  CFIndex v22;
  const __CFDictionary *v23;
  _QWORD v24[6];

  v24[5] = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)&_CFPrefsDaemonLock);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (v5)
  {
    xpc_release(v5);
    v4 = *(_QWORD *)(a1 + 32);
  }
  *(_QWORD *)(v4 + 40) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)&_CFPrefsDaemonLock);
  LODWORD(v6) = CFDictionaryGetCount(a2);
  v7 = (const void **)malloc_type_malloc(8 * (int)v6, 0x6004044C4A2DFuLL);
  v8 = (const void **)malloc_type_malloc(8 * (int)v6, 0x80040B8603338uLL);
  if (!v7 || (v9 = v8) == 0)
    __39___CFXPreferences_resetUserPreferences__block_invoke_3_cold_1();
  CFDictionaryGetKeysAndValues(a2, v7, v8);
  if ((int)v6 >= 1)
  {
    v6 = v6;
    v10 = (id *)v9;
    v11 = v7;
    do
    {
      if (objc_msgSend(*v10, "servedByUserSessionDaemon"))
        CFDictionaryRemoveValue(a2, *v11);
      ++v11;
      ++v10;
      --v6;
    }
    while (v6);
  }
  free(v7);
  free(v9);
  v12 = *(const __CFDictionary **)(a1 + 48);
  if (v12)
  {
    Count = CFDictionaryGetCount(v12);
    v14 = (const void **)malloc_type_malloc(8 * Count, 0x6004044C4A2DFuLL);
    v15 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
    if (!v14 || (v16 = v15) == 0)
      __39___CFXPreferences_resetUserPreferences__block_invoke_3_cold_2();
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 48), v14, v15);
    if (Count >= 1)
    {
      v17 = Count;
      v18 = (id *)v16;
      v19 = v14;
      do
      {
        v20 = *v19;
        if (objc_msgSend(*v18, "servedByUserSessionDaemon")
          && !CFEqual(v20, CFSTR("NSRegistrationDomain"))
          && !CFEqual(v20, CFSTR("NSArgumentDomain")))
        {
          CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 48), *v19);
        }
        ++v19;
        ++v18;
        --v17;
      }
      while (v17);
    }
    free(v14);
    free(v16);
  }
  v21 = *(const __CFDictionary **)(a1 + 56);
  if (v21)
  {
    v22 = CFDictionaryGetCount(v21);
    if (v22)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CFArrayCreateMutable(0, v22, &kCFTypeArrayCallBacks);
      v23 = *(const __CFDictionary **)(a1 + 56);
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __39___CFXPreferences_resetUserPreferences__block_invoke_4;
      v24[3] = &unk_1E13371B0;
      v24[4] = *(_QWORD *)(a1 + 40);
      CFDictionaryApplyFunction(v23, (CFDictionaryApplierFunction)applyBlockApplier, v24);
    }
    CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(a1 + 56));
  }
}

void __39___CFXPreferences_resetUserPreferences__block_invoke_4(uint64_t a1, int a2, void *value)
{
  CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), value);
}

void __37___CFXPreferences_shmemForRole_name___block_invoke(uint64_t a1)
{
  NSObject *v2;

  v2 = _CFPrefsClientLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    __37___CFXPreferences_shmemForRole_name___block_invoke_cold_1(a1, v2);
}

dispatch_queue_t __65___CFXPreferences__setupNewDaemonConnection_invalidationHandler___block_invoke_82()
{
  NSObject *v0;
  dispatch_queue_t result;

  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  result = dispatch_queue_create("CFPreferences Remote KVO Callback Queue", v0);
  _block_invoke_observationCallBackQueue = (uint64_t)result;
  return result;
}

void __65___CFXPreferences__setupNewDaemonConnection_invalidationHandler___block_invoke_89(uint64_t a1)
{
  _CFPrefsDeliverPendingKVONotificationsGuts(*(const __CFArray **)(a1 + 32));
}

void __65___CFXPreferences_replaceValuesInVolatileSourceNamed_withValues___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  __CFString *v5;
  _QWORD v6[8];

  v6[7] = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(__CFString **)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65___CFXPreferences_replaceValuesInVolatileSourceNamed_withValues___block_invoke_2;
  v6[3] = &__block_descriptor_56_e23_v16__0__CFPrefsSource_8l;
  v6[4] = a3;
  v6[5] = a2;
  v6[6] = a4;
  -[_CFXPreferences withNamedVolatileSourceForIdentifier:perform:](v4, v5, (uint64_t)v6);
}

void __65___CFXPreferences_replaceValuesInVolatileSourceNamed_withValues___block_invoke_2(uint64_t a1, os_unfair_lock_s *a2)
{
  -[CFPrefsSource replaceAllValuesWithValues:forKeys:count:from:](a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

void __81___CFXPreferences_generateKVONotificationsForIdentifier_withOldValues_newValues___block_invoke(uint64_t a1, os_unfair_lock_s *a2)
{
  void *v4;
  uint64_t v5;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock(a2 + 13);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __81___CFXPreferences_generateKVONotificationsForIdentifier_withOldValues_newValues___block_invoke_2;
  v6[3] = &unk_1E13373D0;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6[4] = a2;
  v6[5] = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);
  os_unfair_lock_unlock(a2 + 13);
  -[_CFXPreferences _deliverPendingKVONotifications](*(const os_unfair_lock **)(a1 + 48));
}

uint64_t __81___CFXPreferences_generateKVONotificationsForIdentifier_withOldValues_newValues___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deferredNotifyCausedByLoadingOfChangesFromDictionary:toDictionary:", a2, objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:"));
}

void __96___CFXPreferences_SourceAdditions__withSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke_178_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = "current host";
  if (!*(_BYTE *)(a1 + 81))
    v4 = "any host";
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 72);
  v7 = 138544131;
  v8 = v5;
  v9 = 2113;
  v10 = v3;
  v11 = 2082;
  v12 = v4;
  v13 = 2114;
  v14 = v6;
  _os_log_error_impl(&dword_182A8C000, log, OS_LOG_TYPE_ERROR, "Disabling saving preferences for { %{public}@, %{private}@, %{public}s, %{public}@ } because home directory is inaccessible", (uint8_t *)&v7, 0x2Au);
}

void __96___CFXPreferences_SourceAdditions__withSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke_178_cold_2(os_log_t log)
{
  uint8_t v1[8];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_182A8C000, log, OS_LOG_TYPE_DEBUG, "CFPreferences: user home directory is unavailable. User domains will be volatile.", v1, 2u);
}

void __115___CFXPreferences_SourceAdditions__assertEquivalence_ofIdentifiers_users_hosts_containers_managedFlags_cloudFlags___block_invoke_cold_1(uint64_t a1)
{
  _CFThrowFormattedException((uint64_t)CFSTR("NSInvalidArgumentException"), CFSTR("%@ unexpectedly matched"), a1);
}

void __106___CFXPreferences_SearchListAdditions__assertEquivalence_ofIdentifiers_containers_cloudConfigurationURLs___block_invoke_cold_1()
{
  __assert_rtn("-[_CFXPreferences(SearchListAdditions) assertEquivalence:ofIdentifiers:containers:cloudConfigurationURLs:]_block_invoke", "CFPrefsSearchListSource.m", 1782, "previous != src");
}

void __106___CFXPreferences_SearchListAdditions__assertEquivalence_ofIdentifiers_containers_cloudConfigurationURLs___block_invoke_cold_2()
{
  __assert_rtn("-[_CFXPreferences(SearchListAdditions) assertEquivalence:ofIdentifiers:containers:cloudConfigurationURLs:]_block_invoke", "CFPrefsSearchListSource.m", 1780, "previous == src");
}

void __54___CFXPreferences_ingestVolatileStateFromPreferences___block_invoke_3_cold_1()
{
  __assert_rtn("-[_CFXPreferences ingestVolatileStateFromPreferences:]_block_invoke_3", "CFXPreferences.m", 1223, "copy != NULL");
}

void __39___CFXPreferences_resetUserPreferences__block_invoke_3_cold_1()
{
  __assert_rtn("-[_CFXPreferences resetUserPreferences]_block_invoke_3", "CFXPreferences.m", 1300, "sourceKeys && sourceValues");
}

void __39___CFXPreferences_resetUserPreferences__block_invoke_3_cold_2()
{
  __assert_rtn("-[_CFXPreferences resetUserPreferences]_block_invoke_3", "CFXPreferences.m", 1317, "sourceKeys && sourceValues");
}

void __37___CFXPreferences_shmemForRole_name___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 136446210;
  v4 = v2;
  _os_log_fault_impl(&dword_182A8C000, a2, OS_LOG_TYPE_FAULT, "Couldn't map preferences shmem named %{public}s", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_0_34();
}

@end
