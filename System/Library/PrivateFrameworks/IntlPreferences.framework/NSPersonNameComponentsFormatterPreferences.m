@implementation NSPersonNameComponentsFormatterPreferences

+ (void)_setPreference:(id)a3 toValue:(int64_t)a4 usingExistingGetter:(SEL)a5
{
  uint64_t v8;
  const void *v9;
  __CFString *key;

  key = (__CFString *)a3;
  v8 = objc_msgSend(MEMORY[0x1E0CB3858], "performSelector:", a5);
  v9 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  CFPreferencesSetValue(key, v9, (CFStringRef)*MEMORY[0x1E0C9B228], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  if (v8 != a4)
  {
    objc_msgSend(a1, "_syncronizeGizmoDefaultWithKey:value:", key, a4);
    objc_msgSend(a1, "_postPreferencesChangedNotification");
  }

}

+ (void)_postPreferencesChangedNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("NSPersonNamePreferencesDidChangeNotification"), 0, 0, 1u);
}

+ (void)setDefaultDisplayNameOrder:(int64_t)a3
{
  objc_msgSend(a1, "_setPreference:toValue:usingExistingGetter:", CFSTR("NSPersonNameDefaultDisplayNameOrder"), a3, sel__defaultDisplayNameOrder);
}

+ (void)setShortNameFormat:(int64_t)a3
{
  objc_msgSend(a1, "_setPreference:toValue:usingExistingGetter:", CFSTR("NSPersonNameDefaultShortNameFormat"), a3, sel__defaultShortNameFormat);
}

+ (void)setPreferNicknamesDefault:(BOOL)a3
{
  objc_msgSend(a1, "_setPreference:toValue:usingExistingGetter:", CFSTR("NSPersonNameDefaultShouldPreferNicknamesPreference"), a3, sel__shouldPreferNicknames);
}

+ (void)setShortNameIsEnabled:(BOOL)a3
{
  objc_msgSend(a1, "_setPreference:toValue:usingExistingGetter:", CFSTR("NSPersonNameDefaultShortNameEnabled"), a3, sel__shortNameIsEnabled);
}

+ (void)_syncronizeGizmoDefaultWithKey:(id)a3 value:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  _BOOL4 v12;
  id v13;
  void *v14;
  id v15;
  uint64_t (*v16)(id);
  int v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  void *v33;
  id v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (getNRPairedDeviceRegistryClass() && getNPSManagerClass())
  {
    objc_msgSend(getNRPairedDeviceRegistryClass(), "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getActivePairedDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v7;
    v25 = 0;
    v26 = (uint64_t)&v25;
    v27 = 0x2020000000;
    v9 = getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr;
    v28 = getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr;
    if (!getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr)
    {
      v10 = (void *)NanoRegistryLibrary();
      v9 = dlsym(v10, "NRWatchOSVersionForRemoteDevice");
      *(_QWORD *)(v26 + 24) = v9;
      getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr = v9;
    }
    _Block_object_dispose(&v25, 8);
    if (v9)
    {
      v11 = ((uint64_t (*)(id))v9)(v8);

      v12 = (v11 & 0xFFFE0000) != 0;
      v13 = objc_alloc_init((Class)getNPSManagerClass());
      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "synchronizeUserDefaultsDomain:keys:", CFSTR(".GlobalPreferences"), v14);
        goto LABEL_13;
      }
      +[IPiOSABNamePreferenceInfoProvider domain](IPiOSABNamePreferenceInfoProvider, "domain");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v30 = 0;
      v31 = &v30;
      v32 = 0x2020000000;
      v16 = (uint64_t (*)(id))getPSIsNanoMirroringDomainSymbolLoc_ptr;
      v33 = getPSIsNanoMirroringDomainSymbolLoc_ptr;
      if (!getPSIsNanoMirroringDomainSymbolLoc_ptr)
      {
        v25 = MEMORY[0x1E0C809B0];
        v26 = 3221225472;
        v27 = (uint64_t)__getPSIsNanoMirroringDomainSymbolLoc_block_invoke;
        v28 = &unk_1E7068E68;
        v29 = &v30;
        __getPSIsNanoMirroringDomainSymbolLoc_block_invoke((uint64_t)&v25);
        v16 = (uint64_t (*)(id))v31[3];
      }
      _Block_object_dispose(&v30, 8);
      if (v16)
      {
        v17 = v16(v15);

        if (!v17)
        {
LABEL_14:

          goto LABEL_15;
        }
        v34 = v5;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v35[0] = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[NSPersonNameComponentsFormatterPreferences mappedPreferencesForPreferences:from:to:](NSPersonNameComponentsFormatterPreferences, "mappedPreferencesForPreferences:from:to:", v19, 0, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        +[IPiOSABNamePreferenceInfoProvider domain](IPiOSABNamePreferenceInfoProvider, "domain");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __83__NSPersonNameComponentsFormatterPreferences__syncronizeGizmoDefaultWithKey_value___block_invoke;
        v22[3] = &unk_1E7069088;
        v23 = v20;
        v24 = v13;
        v21 = v20;
        objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v22);

LABEL_13:
        goto LABEL_14;
      }
    }
    +[NSPersonNameComponentsFormatterPreferences _syncronizeGizmoDefaultWithKey:value:].cold.1();
    __break(1u);
  }
LABEL_15:

}

void __83__NSPersonNameComponentsFormatterPreferences__syncronizeGizmoDefaultWithKey_value___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v7 = (void *)getNPSDomainAccessorClass_softClass;
  v19 = getNPSDomainAccessorClass_softClass;
  if (!getNPSDomainAccessorClass_softClass)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __getNPSDomainAccessorClass_block_invoke;
    v15[3] = &unk_1E7068E68;
    v15[4] = &v16;
    __getNPSDomainAccessorClass_block_invoke((uint64_t)v15);
    v7 = (void *)v17[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v16, 8);
  v9 = (void *)objc_msgSend([v8 alloc], "initWithDomain:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v9, "setInteger:forKey:", objc_msgSend(v6, "integerValue"), v5);
  v10 = (id)objc_msgSend(v9, "synchronize");
  v13 = a1 + 32;
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v13 + 8);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "synchronizeNanoDomain:keys:", v11, v14);

}

+ (id)mappedPreferencesForPreferences:(id)a3 from:(unint64_t)a4 to:(unint64_t)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v8 = (void *)MEMORY[0x1E0C99E08];
  v9 = a3;
  objc_msgSend(v8, "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "infoClassFromPreferencesSource:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "infoClassFromPreferencesSource:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __86__NSPersonNameComponentsFormatterPreferences_mappedPreferencesForPreferences_from_to___block_invoke;
  v19[3] = &unk_1E70690B0;
  v20 = v11;
  v21 = v12;
  v13 = v10;
  v22 = v13;
  v14 = v12;
  v15 = v11;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v19);

  v16 = v22;
  v17 = v13;

  return v17;
}

void __86__NSPersonNameComponentsFormatterPreferences_mappedPreferencesForPreferences_from_to___block_invoke(id *a1, void *a2, void *a3)
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
  void *v14;
  id v15;

  v5 = a1[4];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "nativeKeyNameToCanonicalKeyName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[5], "canonicalNameToNativeKeyName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[4], "valueToValueIdentifierMapFromCanonicalKey:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[5], "valueIdentifierToValueMapFromCanonicalKey:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && v14)
    objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v14, v10);

}

+ (id)infoClassFromPreferencesSource:(unint64_t)a3
{
  if (a3 > 2)
    return 0;
  objc_opt_class();
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)_syncronizeGizmoDefaultWithKey:value:.cold.1()
{
  dlerror();
  abort_report_np();
  return __getNRPairedDeviceRegistryClass_block_invoke_cold_1();
}

@end
