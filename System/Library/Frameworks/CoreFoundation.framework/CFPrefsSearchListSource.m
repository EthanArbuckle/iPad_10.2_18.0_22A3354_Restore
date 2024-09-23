@implementation CFPrefsSearchListSource

- (__CFDictionary)alreadylocked_copyDictionary
{
  __CFDictionary *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__CFPrefsSearchListSource_alreadylocked_copyDictionary__block_invoke;
  v4[3] = &unk_1E1334F78;
  v4[4] = &v5;
  -[CFPrefsSearchListSource alreadylocked_getDictionary:]((uint64_t)self, (uint64_t)v4);
  v2 = (__CFDictionary *)v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)alreadylocked_copyValueForKey:(__CFString *)a3
{
  void *Value;
  void *v6;
  __CFString *v7;
  const void *v8;
  NSObject *v9;
  uint64_t v11;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  __CFString *v20;
  __int16 v21;
  const void *v22;
  __int16 v23;
  __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!self->_sourceList)
    return 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__CFPrefsSearchListSource_alreadylocked_copyValueForKey___block_invoke;
  v12[3] = &unk_1E1334F50;
  v12[4] = &v13;
  v12[5] = a3;
  -[CFPrefsSearchListSource alreadylocked_getDictionary:]((uint64_t)self, (uint64_t)v12);
  if (makeLogHandles_logToken != -1)
    dispatch_once(&makeLogHandles_logToken, &__block_literal_global_143);
  if (os_log_type_enabled((os_log_t)clientHandle, OS_LOG_TYPE_DEBUG))
  {
    if (v14[3])
      Value = (void *)CFDictionaryGetValue(self->_keysToSources, a3);
    else
      Value = 0;
    v7 = -[CFPrefsSearchListSource copyOSLogDescription](self, "copyOSLogDescription");
    v8 = (const void *)objc_msgSend(Value, "copyOSLogDescription");
    if (v14[3])
    {
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
      if (makeLogHandles_logToken != -1)
        dispatch_once(&makeLogHandles_logToken, &__block_literal_global_143);
      v9 = clientHandle;
      if (os_log_type_enabled((os_log_t)clientHandle, OS_LOG_TYPE_DEBUG))
      {
        v11 = v14[3];
        *(_DWORD *)buf = 138478595;
        v18 = v11;
        v19 = 2114;
        v20 = a3;
        v21 = 2114;
        v22 = v8;
        v23 = 2114;
        v24 = v7;
        _os_log_debug_impl(&dword_182A8C000, v9, OS_LOG_TYPE_DEBUG, "looked up value %{private}@ for key %{public}@ in %{public}@ via %{public}@", buf, 0x2Au);
      }
    }
    else
    {
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
      if (makeLogHandles_logToken != -1)
        dispatch_once(&makeLogHandles_logToken, &__block_literal_global_143);
      if (os_log_type_enabled((os_log_t)clientHandle, OS_LOG_TYPE_DEBUG))
        -[CFPrefsSearchListSource alreadylocked_copyValueForKey:].cold.1((uint64_t)a3);
    }
    _CFSetTSD(0xFu, 0, 0);
    CFRelease(v7);
    if (v8)
      CFRelease(v8);
  }
  v6 = (void *)v14[3];
  _Block_object_dispose(&v13, 8);
  return v6;
}

- (void)alreadylocked_getDictionary:(uint64_t)a1
{
  uint64_t v4;
  const __CFArray *v5;
  const void *v6;
  uint64_t Count;
  uint64_t v8;
  uint64_t v9;
  __n128 v10;
  uint64_t v11;
  const void **v12;
  CFDictionaryRef v13;
  uint64_t v14;
  unint64_t v15;
  const void *v16;
  CFTypeRef v17;
  unint64_t v18;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v20;
  void *v21;
  unint64_t v22;
  const void *v23;
  uint64_t v24;
  _QWORD v25[6];
  CFRange v26;

  v25[5] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 52));
    v5 = *(const __CFArray **)(a1 + 96);
    if (!v5)
    {
      v13 = CFDictionaryCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, 0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      (*(void (**)(uint64_t, CFDictionaryRef))(a2 + 16))(a2, v13);
      CFRelease(v13);
      return;
    }
    if (!byte_1EDCCE379)
      goto LABEL_7;
    atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)(a1 + 32));
    v6 = *(const void **)(a1 + 16);
    if (v6)
      CFRelease(v6);
    *(_QWORD *)(a1 + 16) = 0;
    v5 = *(const __CFArray **)(a1 + 96);
    if (!v5)
    {
      MEMORY[0x1E0C80A78](0, v4);
      v12 = (const void **)&v24;
      Count = 0;
    }
    else
    {
LABEL_7:
      Count = CFArrayGetCount(v5);
      v9 = MEMORY[0x1E0C80A78](Count, v8);
      v12 = (const void **)((char *)v25 - v11);
      if (v9 >= 1)
      {
        v26.location = 0;
        v26.length = Count;
        CFArrayGetValues(*(CFArrayRef *)(a1 + 96), v26, v12);
      }
    }
    v14 = -[CFPrefsSearchListSource alreadylocked_generationCountFromListOfSources:count:](a1, (id *)v12, Count, v10);
    v15 = atomic_load((unint64_t *)(a1 + 32));
    if (v15 == v14)
    {
      v16 = *(const void **)(a1 + 16);
      if (!v16)
      {
        *(_QWORD *)(a1 + 16) = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        v16 = *(const void **)(a1 + 16);
      }
      v17 = CFRetain(v16);
LABEL_24:
      (*(void (**)(uint64_t, CFTypeRef))(a2 + 16))(a2, v17);
      CFRelease(v17);
      return;
    }
    v18 = v14;
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v20 = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __55__CFPrefsSearchListSource_alreadylocked_getDictionary___block_invoke;
    v25[3] = &unk_1E13350D0;
    v25[4] = a1;
    if (Count >= 1)
    {
      do
      {
        v21 = (void *)*v12++;
        objc_msgSend(v21, "mergeIntoDictionary:sourceDictionary:cloudKeyEvaluator:", Mutable, v20, v25);
        --Count;
      }
      while (Count);
    }
    v22 = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = Mutable;
    v23 = *(const void **)(a1 + 80);
    *(_QWORD *)(a1 + 80) = v20;
    atomic_store(v18, (unint64_t *)(a1 + 32));
    v17 = CFRetain(*(CFTypeRef *)(a1 + 16));
    if (objc_msgSend(*(id *)(a1 + 24), "approximateCount"))
    {
      if (!(v22 | *(_QWORD *)(a1 + 16)))
      {
LABEL_22:
        if (v23)
          CFRelease(v23);
        goto LABEL_24;
      }
      objc_msgSend((id)a1, "deferredNotifyCausedByLoadingOfChangesFromDictionary:toDictionary:", v22);
    }
    if (v22)
      CFRelease((CFTypeRef)v22);
    goto LABEL_22;
  }
}

- (uint64_t)alreadylocked_generationCountFromListOfSources:(uint64_t)a3 count:(__n128)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __n128 v10;
  _QWORD v11[5];
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v6 = (void *)result;
    v12 = 0;
    result = generationCountFromListOfSources(a2, a3, &v12, a4);
    if (v12)
    {
      v7 = (void *)objc_msgSend(v6, "createRequestNewContentMessageForDaemon:", 2);
      v8 = (void *)objc_msgSend(v6, "createRequestNewContentMessageForDaemon:", 1);
      v9 = (void *)objc_msgSend(v6, "createRequestNewContentMessageForDaemon:", 3);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __80__CFPrefsSearchListSource_alreadylocked_generationCountFromListOfSources_count___block_invoke;
      v11[3] = &unk_1E1335068;
      v11[4] = v6;
      -[CFPrefsSearchListSource synchronouslySendSystemMessage:andUserMessage:andDirectMessage:replyHandler:]((uint64_t)v6, (uint64_t)v7, (uint64_t)v8, (uint64_t)v9, (uint64_t)v11);
      if (v7)
        xpc_release(v7);
      if (v8)
        xpc_release(v8);
      if (v9)
        xpc_release(v9);
      return generationCountFromListOfSources(a2, a3, &v12, v10);
    }
  }
  return result;
}

const void **__57__CFPrefsSearchListSource_alreadylocked_copyValueForKey___block_invoke(const void **result, CFDictionaryRef theDict)
{
  const void **v2;

  if (theDict)
  {
    v2 = result;
    *(_QWORD *)(*((_QWORD *)result[4] + 1) + 24) = CFDictionaryGetValue(theDict, result[5]);
    result = *(const void ***)(*((_QWORD *)v2[4] + 1) + 24);
    if (result)
      return (const void **)CFRetain(result);
  }
  return result;
}

- (void)addSourceForIdentifier:(const __CFString *)a3 user:(int)a4 byHost:(const __CFString *)a5 container:
{
  uint64_t v5;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v5 = *(_QWORD *)(a1 + 8);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __72__CFPrefsSearchListSource_addSourceForIdentifier_user_byHost_container___block_invoke;
    v6[3] = &unk_1E1334ED8;
    v6[4] = a1;
    -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](v5, a2, a3, a4, a5, 0, (uint64_t)v6);
  }
}

void __72__CFPrefsSearchListSource_addSourceForIdentifier_user_byHost_container___block_invoke(uint64_t a1, const void *a2)
{
  -[CFPrefsSearchListSource addSource:](*(_QWORD *)(a1 + 32), a2);
}

- (void)addManagedSourceForIdentifier:(uint64_t)a3 user:
{
  const os_unfair_lock *v3;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = *(const os_unfair_lock **)(a1 + 8);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __62__CFPrefsSearchListSource_addManagedSourceForIdentifier_user___block_invoke;
    v4[3] = &unk_1E1334EB0;
    v4[4] = a1;
    -[_CFXPreferences withManagedSourceForIdentifier:user:perform:](v3, a2, a3, (uint64_t)v4);
  }
}

- (void)addSuiteSourceForIdentifier:(const __CFString *)a3 user:
{
  uint64_t v3;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = *(_QWORD *)(a1 + 8);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __60__CFPrefsSearchListSource_addSuiteSourceForIdentifier_user___block_invoke;
    v4[3] = &unk_1E1334F28;
    v4[4] = a1;
    -[_CFXPreferences withSuiteSearchListForIdentifier:user:locked:perform:](v3, a2, a3, 1, (uint64_t)v4);
  }
}

- (CFStringRef)copyCloudConfigurationWithURL:(CFPrefsConfigurationFileSource *)a3 outConfigFileSource:(CFStringRef *)a4 outStoreName:
{
  CFStringRef v4;
  const __CFURL *v8;
  const __CFData *v9;
  uint64_t CacheStringForBundleID;
  const __CFString *ConfigurationFileNameFromIdentifier;
  const __CFString *v12;
  __CFArray *v13;
  CFIndex Count;
  CFIndex v15;
  CFIndex v16;
  const __CFURL *ValueAtIndex;
  const __CFURL *v18;
  CFDataRef v19;
  CFStringRef *v20;
  const void *length;
  const void *v22;
  CFBundleRef MainBundle;
  __CFBundle *v24;
  CFURLRef v25;
  CFPropertyListRef v26;
  CFIndex v27;
  uint64_t v28;
  unint64_t v29;
  const void **v30;
  size_t v31;
  uint64_t v32;
  uint64_t v33;
  CFDictionaryRef *v34;
  char v35;
  int HasSuffix;
  const __CFString *v37;
  CFStringRef v38;
  CFPrefsConfigurationFileSource *v39;
  const __CFString *Value;
  CFStringRef Copy;
  const __CFURL *v43;
  const __CFURL *v44;
  _QWORD v45[2];
  CFStringRef *v46;
  CFPrefsConfigurationFileSource **v47;
  _BOOL4 v48;
  uint64_t v49;
  CFRange v50;

  v4 = a1;
  v49 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return v4;
  if (!eduModeEnabled())
    return 0;
  if (a2)
  {
    v8 = (const __CFURL *)CFRetain(a2);
    if (v8)
      goto LABEL_5;
    goto LABEL_31;
  }
  CacheStringForBundleID = _CFPrefsGetCacheStringForBundleID(CFSTR("kCFPreferencesAnyApplication"));
  if (CacheStringForBundleID == _CFPrefsGetCacheStringForBundleID((__CFString *)v4[2].length))
    return 0;
  ConfigurationFileNameFromIdentifier = _CFPrefsCreateConfigurationFileNameFromIdentifier((const __CFString *)v4[2].length);
  if (ConfigurationFileNameFromIdentifier)
  {
    v12 = ConfigurationFileNameFromIdentifier;
    v47 = a3;
    v13 = CFCopySearchPathForDirectoriesInDomains(5, 8, 0);
    Count = CFArrayGetCount(v13);
    if (Count < 1)
    {
      v9 = 0;
      v8 = 0;
    }
    else
    {
      v15 = Count;
      v46 = a4;
      v16 = 0;
      while (1)
      {
        ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(v13, v16);
        v18 = CFURLCreateCopyAppendingPathComponent((CFAllocatorRef)&__kCFAllocatorSystemDefault, ValueAtIndex, CFSTR("DefaultsConfigurations"), 1u);
        v8 = CFURLCreateCopyAppendingPathComponent((CFAllocatorRef)&__kCFAllocatorSystemDefault, v18, v12, 0);
        v19 = _CFDataCreateFromURL(v8, 0);
        if (v19)
          break;
        CFRelease(v8);
        CFRelease(v18);
        if (v15 == ++v16)
        {
          v9 = 0;
          v8 = 0;
          goto LABEL_18;
        }
      }
      v9 = v19;
LABEL_18:
      a4 = v46;
    }
    CFRelease(v13);
    CFRelease(v12);
    a3 = v47;
    if (v9)
      goto LABEL_36;
  }
  else
  {
    v8 = 0;
  }
  v20 = a4;
  length = (const void *)v4[2].length;
  v22 = (const void *)_CFPrefsGetCacheStringForBundleID(CFSTR("kCFPreferencesCurrentApplication"));
  if (!CFEqual(length, v22))
  {
    if (_CFPrefsWritingToExternalAppCloudPreferencesEnabled())
    {
      if (v8)
        CFRelease(v8);
      v25 = _CFPrefsCopyCloudConfigurationURLForIdentifier((const void *)v4[2].length);
      goto LABEL_29;
    }
    if (v8)
    {
      CFRelease(v8);
      v9 = 0;
      v8 = 0;
    }
    else
    {
      v9 = 0;
    }
    a4 = v20;
LABEL_36:
    v48 = v8 == 0;
    if (v9)
      goto LABEL_37;
LABEL_65:
    _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
    if (makeLogHandles_logToken != -1)
      dispatch_once(&makeLogHandles_logToken, &__block_literal_global_143);
    if (os_log_type_enabled((os_log_t)clientHandle, OS_LOG_TYPE_DEBUG))
      -[CFPrefsSearchListSource copyCloudConfigurationWithURL:outConfigFileSource:outStoreName:].cold.1((uint64_t)v4);
    _CFSetTSD(0xFu, 0, 0);
    goto LABEL_70;
  }
  MainBundle = CFBundleGetMainBundle();
  if (!MainBundle)
    goto LABEL_30;
  v24 = MainBundle;
  if (v8)
    CFRelease(v8);
  v25 = _CFPrefsCopyCloudConfigurationURLFromBundle(v24, (const __CFString *)v4[2].length);
LABEL_29:
  v8 = v25;
LABEL_30:
  a4 = v20;
  if (!v8)
  {
LABEL_31:
    v48 = 1;
    goto LABEL_65;
  }
LABEL_5:
  v9 = _CFDataCreateFromURL(v8, 0);
  v48 = 0;
  if (!v9)
    goto LABEL_65;
LABEL_37:
  v47 = a3;
  v26 = CFPropertyListCreateWithData((CFAllocatorRef)&__kCFAllocatorSystemDefault, v9, 0, 0, 0);
  CFRelease(v9);
  if (!v26)
    goto LABEL_65;
  if (CFGetTypeID(v26) != 18)
  {
    CFRelease(v26);
    goto LABEL_65;
  }
  v46 = a4;
  _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
  if (makeLogHandles_logToken != -1)
    dispatch_once(&makeLogHandles_logToken, &__block_literal_global_143);
  if (os_log_type_enabled((os_log_t)clientHandle, OS_LOG_TYPE_DEBUG))
    -[CFPrefsSearchListSource copyCloudConfigurationWithURL:outConfigFileSource:outStoreName:].cold.2((uint64_t)v4);
  _CFSetTSD(0xFu, 0, 0);
  v27 = CFDictionaryGetCount((CFDictionaryRef)v26);
  v45[1] = v45;
  MEMORY[0x1E0C80A78](v27, v28);
  v29 = (8 * v27 + 15) & 0xFFFFFFFFFFFFFFF0;
  v30 = (const void **)((char *)v45 - v29);
  if ((unint64_t)(8 * v27) >= 0x200)
    v31 = 512;
  else
    v31 = 8 * v27;
  bzero((char *)v45 - v29, v31);
  MEMORY[0x1E0C80A78](v32, v33);
  v34 = (CFDictionaryRef *)((char *)v45 - v29);
  bzero(v34, v31);
  CFDictionaryGetKeysAndValues((CFDictionaryRef)v26, v30, (const void **)v34);
  if (v27 < 1)
  {
    v35 = 0;
  }
  else
  {
    v35 = 0;
    do
    {
      if (CFGetTypeID(*v34) == 18)
      {
        if (CFDictionaryGetValue(*v34, CFSTR("NSUserDefaultsUbiquitous")) != &__kCFBooleanFalse)
        {
          HasSuffix = CFStringHasSuffix((CFStringRef)*v30, CFSTR("*"));
          v37 = (const __CFString *)*v30;
          if (HasSuffix)
          {
            v50.length = CFStringGetLength((CFStringRef)*v30) - 1;
            v50.location = 0;
            v38 = CFStringCreateWithSubstring((CFAllocatorRef)&__kCFAllocatorSystemDefault, v37, v50);
            -[CFPrefsSearchListSource setCloudEnabled:forKeyPrefix:]((uint64_t)v4, 1, v38);
            CFRelease(v38);
          }
          else
          {
            -[CFPrefsSearchListSource setCloudEnabled:forKey:]((uint64_t)v4, 1, *v30);
          }
        }
        v35 = 1;
      }
      ++v30;
      ++v34;
      --v27;
    }
    while (v27);
  }
  if (v47)
  {
    v39 = -[CFPrefsConfigurationFileSource initWithConfigurationPropertyList:containingPreferences:]([CFPrefsConfigurationFileSource alloc], "initWithConfigurationPropertyList:containingPreferences:", v26, v4->info);
    *v47 = v39;
  }
  if (v46)
  {
    Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v26, CFSTR("NSUserDefaultsCloudStoreIdentifier"));
    if (!Value)
      Value = (const __CFString *)v4[2].length;
    Copy = CFStringCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, Value);
    *v46 = Copy;
  }
  CFRelease(v26);
  if ((v35 & 1) == 0)
    goto LABEL_65;
  v43 = CFURLCopyAbsoluteURL(v8);
  v44 = v43;
  if (!v43)
  {
LABEL_70:
    v4 = 0;
    goto LABEL_71;
  }
  v4 = CFURLCopyFileSystemPath(v43, kCFURLPOSIXPathStyle);
  CFRelease(v44);
LABEL_71:
  if (!v48)
    CFRelease(v8);
  return v4;
}

- (void)addPreferencesObserver:(uint64_t)a1
{
  if (a1 && a2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 52));
    if (!objc_msgSend(*(id *)(a1 + 24), "approximateCount"))
      -[CFPrefsSearchListSource alreadylocked_getDictionary:](a1, (uint64_t)&__block_literal_global_32);
    if (-[CFPrefsSource alreadylocked_addPreferencesObserver:](a1, a2))
      -[CFPrefsSearchListSource addPreferencesObserver:].cold.1();
    if (objc_msgSend(*(id *)(a1 + 24), "approximateCount") == 1)
      -[CFPrefsSearchListSource alreadylocked_setObservingContents:](a1, 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 52));
  }
}

- (void)alreadylocked_setObservingContents:(uint64_t)a1
{
  const __CFArray *v4;
  CFIndex Count;
  CFIndex i;
  os_unfair_lock_s *ValueAtIndex;
  uint64_t v8;
  void *v9;
  void **v10;
  xpc_object_t *v11;
  void *v12;
  _BOOL4 v13;
  NSObject *v14;
  xpc_object_t v15;
  void *v16;
  xpc_object_t v17;
  void *v18;
  xpc_object_t v19;
  CFIndex v20;
  os_unfair_lock_s *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  os_activity_scope_state_s objects;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 52));
    v4 = *(const __CFArray **)(a1 + 96);
    if (v4)
    {
      Count = CFArrayGetCount(v4);
      v23 = 0;
      v24 = 0;
      v22 = 0;
      if (Count < 1)
      {
        v13 = 0;
        v12 = 0;
      }
      else
      {
        for (i = 0; i != Count; ++i)
        {
          ValueAtIndex = (os_unfair_lock_s *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 96), i);
          os_unfair_lock_lock(ValueAtIndex + 13);
          if (a2)
            v8 = -[CFPrefsSource alreadylocked_addPreferencesObserver:]((uint64_t)ValueAtIndex, a1);
          else
            v8 = -[CFPrefsSource alreadylocked_removePreferencesObserver:]((uint64_t)ValueAtIndex, a1);
          v25 = 0;
          objects.opaque[0] = 0;
          v9 = (void *)-[os_unfair_lock_s alreadylocked_createObserverUpdateMessageWithOperation:forRole:](ValueAtIndex, "alreadylocked_createObserverUpdateMessageWithOperation:forRole:", v8, &v25);
          objects.opaque[0] = (uint64_t)v9;
          if (v9)
          {
            if (v25 == 1)
              v10 = &v24;
            else
              v10 = &v22;
            if (v25 == 2)
              v11 = &v23;
            else
              v11 = v10;
            if (*v11)
              xpc_array_append_value(*v11, v9);
            else
              *v11 = xpc_array_create((xpc_object_t *)&objects, 1uLL);
            xpc_release((xpc_object_t)objects.opaque[0]);
          }
        }
        v12 = v24;
        v13 = Count > 0;
      }
    }
    else
    {
      v13 = 0;
      Count = 0;
      v12 = 0;
      v22 = 0;
      v23 = 0;
    }
    v14 = _os_activity_create(&dword_182A8C000, "Updating Key-Value Observers Of Preferences", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    objects.opaque[0] = 0;
    objects.opaque[1] = 0;
    os_activity_scope_enter(v14, &objects);
    if (v12)
    {
      v15 = -[CFPrefsSearchListSource createMultiMessageWithContainedMessages:](a1, v12);
      xpc_release(v12);
    }
    else
    {
      v15 = 0;
    }
    v16 = v23;
    if (v23)
    {
      v17 = -[CFPrefsSearchListSource createMultiMessageWithContainedMessages:](a1, v23);
      xpc_release(v16);
    }
    else
    {
      v17 = 0;
    }
    v18 = v22;
    if (v22)
    {
      v19 = -[CFPrefsSearchListSource createMultiMessageWithContainedMessages:](a1, v22);
      xpc_release(v18);
    }
    else
    {
      v19 = 0;
    }
    -[CFPrefsSearchListSource synchronouslySendSystemMessage:andUserMessage:andDirectMessage:replyHandler:](a1, (uint64_t)v17, (uint64_t)v15, (uint64_t)v19, 0);
    if (v17)
      xpc_release(v17);
    if (v15)
      xpc_release(v15);
    if (v19)
      xpc_release(v19);

    if (v13)
    {
      v20 = 0;
      do
      {
        v21 = (os_unfair_lock_s *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 96), v20);
        os_unfair_lock_unlock(v21 + 13);
        ++v20;
      }
      while (Count != v20);
    }
    os_activity_scope_leave(&objects);
  }
}

- (uint64_t)synchronouslySendSystemMessage:(uint64_t)a3 andUserMessage:(uint64_t)a4 andDirectMessage:(uint64_t)a5 replyHandler:
{
  uint64_t v6;
  uint64_t v7;
  const os_unfair_lock *v8;
  const os_unfair_lock *v9;
  const os_unfair_lock *v10;
  const os_unfair_lock *v11;
  _QWORD v12[6];
  _QWORD v13[6];
  _QWORD v14[6];
  _QWORD v15[7];
  _QWORD v16[7];

  v16[6] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v6 = result;
    v7 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke;
    v16[3] = &unk_1E1334FC8;
    v16[4] = result;
    v16[5] = a5;
    if (a2 && a3)
    {
      v8 = *(const os_unfair_lock **)(result + 8);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke_3;
      v15[3] = &unk_1E1335018;
      v15[5] = a3;
      v15[6] = v16;
      v15[4] = a2;
      result = CFPREFERENCES_IS_WAITING_FOR_SYSTEM_AND_USER_CFPREFSDS(v8, (uint64_t)v15);
    }
    else if (a2)
    {
      v9 = *(const os_unfair_lock **)(result + 8);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke_5;
      v14[3] = &unk_1E1335040;
      v14[4] = a2;
      v14[5] = v16;
      result = CFPREFERENCES_IS_WAITING_FOR_SYSTEM_CFPREFSD(v9, (uint64_t)v14);
    }
    else if (a3)
    {
      v10 = *(const os_unfair_lock **)(result + 8);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke_6;
      v13[3] = &unk_1E1335040;
      v13[4] = a3;
      v13[5] = v16;
      result = CFPREFERENCES_IS_WAITING_FOR_USER_CFPREFSD(v10, (uint64_t)v13);
    }
    if (a4)
    {
      v11 = *(const os_unfair_lock **)(v6 + 8);
      v12[0] = v7;
      v12[1] = 3221225472;
      v12[2] = __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke_7;
      v12[3] = &unk_1E1335040;
      v12[4] = a4;
      v12[5] = v16;
      return CFPREFERENCES_IS_WAITING_FOR_DIRECT_CFPREFSD(v11, (uint64_t)v12);
    }
  }
  return result;
}

void __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke_3(uint64_t a1)
{
  _QWORD v1[4];
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke_4;
  v1[3] = &unk_1E1334FF0;
  v3 = *(_QWORD *)(a1 + 48);
  v2 = *(_OWORD *)(a1 + 32);
  dispatch_apply(2uLL, 0, v1);
}

- (uint64_t)alreadylocked_requestNewData
{
  uint64_t v1;
  const __CFArray *v2;
  CFIndex Count;
  CFIndex v4;
  CFIndex v5;
  CFIndex v6;
  char v7;

  if (result)
  {
    v1 = result;
    v2 = *(const __CFArray **)(result + 96);
    if (v2 && (Count = CFArrayGetCount(v2), Count >= 1))
    {
      v4 = Count;
      result = objc_msgSend((id)CFArrayGetValueAtIndex(*(CFArrayRef *)(v1 + 96), 0), "synchronize");
      if ((_DWORD)result)
      {
        v5 = 1;
        do
        {
          v6 = v5;
          if (v4 == v5)
            break;
          v7 = objc_msgSend((id)CFArrayGetValueAtIndex(*(CFArrayRef *)(v1 + 96), v5), "synchronize");
          v5 = v6 + 1;
        }
        while ((v7 & 1) != 0);
        return v4 <= v6;
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (void)handleChangeNotificationForDomainIdentifier:(__CFString *)a3 isRemote:(BOOL)a4
{
  _BOOL4 v4;
  __n128 v7;
  __CFString *identifier;
  __CFArray *sourceList;
  CFIndex Count;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id *v15;
  uint64_t v16;
  unint64_t v17;
  _BYTE v18[15];
  char v19;
  char v20;
  uint64_t v21;
  CFRange v22;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_sourceList)
  {
    v4 = a4;
    if (CFEqual(a3, CFSTR("Volatile")))
    {
      -[CFPrefsSearchListSource generationCount](self, "generationCount");
    }
    else if (!v4 || (identifier = self->_identifier, identifier == a3) || CFEqual(identifier, a3))
    {
      sourceList = self->_sourceList;
      if (sourceList)
      {
        Count = CFArrayGetCount(sourceList);
        v12 = MEMORY[0x1E0C80A78](Count, v11);
        v14 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0;
        v15 = (id *)&v18[-v14];
        if (v12 >= 1)
        {
          v22.location = 0;
          v22.length = Count;
          CFArrayGetValues(self->_sourceList, v22, (const void **)&v18[-v14]);
        }
      }
      else
      {
        Count = 0;
        v15 = (id *)&v20;
      }
      v19 = 0;
      v16 = generationCountFromListOfSources(v15, Count, &v19, v7);
      if (v19 || !v4 && (v17 = atomic_load((unint64_t *)&self->super._generationCount), v16 != v17))
        -[CFPrefsSearchListSource generationCount](self, "generationCount");
    }
  }
}

- (__CFString)domainIdentifier
{
  return self->_identifier;
}

- (int64_t)generationCount
{
  if (!self->_sourceList)
    return 0;
  os_unfair_lock_lock(&self->super._lock);
  -[CFPrefsSearchListSource alreadylocked_getDictionary:]((uint64_t)self, (uint64_t)&__block_literal_global_32);
  os_unfair_lock_unlock(&self->super._lock);
  return atomic_load((unint64_t *)&self->super._generationCount);
}

CFMutableDictionaryRef __55__CFPrefsSearchListSource_alreadylocked_copyDictionary__block_invoke(CFMutableDictionaryRef result, CFDictionaryRef theDict)
{
  uint64_t v2;

  if (theDict)
  {
    v2 = (uint64_t)result;
    result = CFDictionaryCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, theDict);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 8) + 24) = result;
  }
  return result;
}

uint64_t __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 40;
  if (a2)
  {
    v3 = 1;
  }
  else
  {
    v2 = 32;
    v3 = 2;
  }
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + v2), v3);
}

uint64_t __93__CFPrefsSearchListSource_handleReply_toRequestNewDataMessage_onConnection_retryCount_error___block_invoke(uint64_t a1, size_t a2, id a3)
{
  os_unfair_lock_s *ValueAtIndex;
  char v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (object_getClass(a3) != (Class)MEMORY[0x1E0C81350])
  {
    v8 = 0;
    ValueAtIndex = (os_unfair_lock_s *)CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)(a1 + 32) + 96), a2);
    os_unfair_lock_lock(ValueAtIndex + 13);
    -[os_unfair_lock_s handleReply:toRequestNewDataMessage:onConnection:retryCount:error:](ValueAtIndex, "handleReply:toRequestNewDataMessage:onConnection:retryCount:error:", a3, xpc_array_get_value(*(xpc_object_t *)(a1 + 40), a2), *(_QWORD *)(a1 + 48), 0, &v8);
    os_unfair_lock_unlock(ValueAtIndex + 13);
  }
  return 1;
}

- (id)createRequestNewContentMessageForDaemon:(int)a3
{
  __CFArray *sourceList;
  uint64_t v5;
  uint64_t Count;
  uint64_t v7;
  const void **v8;
  xpc_object_t v9;
  uint64_t v10;
  xpc_object_t *v11;
  uint64_t v12;
  char v13;
  os_unfair_lock_s *v14;
  uint64_t v15;
  xpc_object_t v16;
  xpc_object_t v17;
  xpc_object_t v18;
  uint64_t v20;
  CFPrefsSearchListSource *v21;
  uint64_t *v22;
  uint64_t v23;
  CFRange v24;

  v23 = *MEMORY[0x1E0C80C00];
  sourceList = self->_sourceList;
  if (!sourceList)
    return 0;
  v5 = *(_QWORD *)&a3;
  Count = CFArrayGetCount(sourceList);
  MEMORY[0x1E0C80A78](Count, v7);
  v8 = (const void **)((char *)&v20 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0));
  v24.location = 0;
  v24.length = Count;
  CFArrayGetValues(self->_sourceList, v24, v8);
  v9 = xpc_null_create();
  MEMORY[0x1E0C80A78](v9, v10);
  v11 = (xpc_object_t *)v8;
  if (Count < 1)
  {
    v18 = 0;
  }
  else
  {
    v21 = self;
    v22 = &v20;
    v12 = 0;
    v13 = 0;
    do
    {
      v14 = (os_unfair_lock_s *)v8[v12];
      os_unfair_lock_lock(v14 + 13);
      v15 = -[os_unfair_lock_s createRequestNewContentMessageForDaemon:](v14, "createRequestNewContentMessageForDaemon:", v5);
      if (v15)
        v16 = (xpc_object_t)v15;
      else
        v16 = v9;
      v8[v12] = v16;
      os_unfair_lock_unlock(v14 + 13);
      v13 |= v16 != v9;
      ++v12;
    }
    while (Count != v12);
    if ((v13 & 1) != 0)
    {
      v17 = xpc_array_create((xpc_object_t *)v8, Count);
      v18 = -[CFPrefsSearchListSource createMultiMessageWithContainedMessages:]((uint64_t)v21, v17);
      xpc_release(v17);
      do
      {
        if (*v11 != v9)
          xpc_release(*v11);
        ++v11;
        --Count;
      }
      while (Count);
    }
    else
    {
      v18 = 0;
    }
  }
  xpc_release(v9);
  return v18;
}

- (xpc_object_t)createMultiMessageWithContainedMessages:(uint64_t)a1
{
  xpc_object_t v3;

  if (!a1)
    return 0;
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, "CFPreferencesOperation", 5);
  xpc_dictionary_set_value(v3, "CFPreferencesMessages", a2);
  return v3;
}

- (void)addNamedVolatileSourceForIdentifier:(uint64_t)a1
{
  uint64_t v2;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 8);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __63__CFPrefsSearchListSource_addNamedVolatileSourceForIdentifier___block_invoke;
    v3[3] = &unk_1E1334ED8;
    v3[4] = a1;
    -[_CFXPreferences withNamedVolatileSourceForIdentifier:perform:](v2, a2, (uint64_t)v3);
  }
}

- (void)addSource:(uint64_t)a1
{
  const __CFArray *Mutable;
  CFRange v5;

  if (a1 && a2)
  {
    if (*(_BYTE *)(a1 + 136))
      -[CFPrefsSearchListSource addSource:].cold.1();
    Mutable = *(const __CFArray **)(a1 + 96);
    if (!Mutable)
    {
      Mutable = CFArrayCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeArrayCallBacks);
      *(_QWORD *)(a1 + 96) = Mutable;
    }
    v5.length = CFArrayGetCount(Mutable);
    v5.location = 0;
    if (!CFArrayContainsValue(Mutable, v5, a2))
      CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 96), a2);
    atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)(a1 + 32));
  }
}

void __62__CFPrefsSearchListSource_addManagedSourceForIdentifier_user___block_invoke(uint64_t a1, const void *a2)
{
  -[CFPrefsSearchListSource addSource:](*(_QWORD *)(a1 + 32), a2);
}

- (CFPrefsSearchListSource)initWithIdentifier:(__CFString *)a3 containingPreferences:(id)a4
{
  CFPrefsSearchListSource *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)CFPrefsSearchListSource;
  v5 = -[CFPrefsSource initWithContainingPreferences:](&v7, sel_initWithContainingPreferences_, a4);
  if (v5)
  {
    v5->_identifier = (__CFString *)_CFStringCopyBundleUnloadingProtectedString((uint64_t)a3);
    v5->super._isSearchList = 1;
    atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)&v5->super._generationCount);
  }
  return v5;
}

void __60__CFPrefsSearchListSource_addSuiteSourceForIdentifier_user___block_invoke(uint64_t a1, const void *a2)
{
  -[CFPrefsSearchListSource addSource:](*(_QWORD *)(a1 + 32), a2);
}

void __63__CFPrefsSearchListSource_addNamedVolatileSourceForIdentifier___block_invoke(uint64_t a1, const void *a2)
{
  -[CFPrefsSearchListSource addSource:](*(_QWORD *)(a1 + 32), a2);
}

- (void)transitionIntoDirectModeIfNeededWithRetryBlock:(id)a3
{
  -[CFPrefsPlistSource transitionIntoDirectModeIfNeededWithRetryBlock:](self->_standardSetTarget, "transitionIntoDirectModeIfNeededWithRetryBlock:", a3);
}

- (void)alreadylocked_setPrecopiedValues:(const void *)a3 forKeys:(const __CFString *)a4 count:(int64_t)a5 from:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  char v11;
  const __CFString **v12;
  _BYTE *v13;
  int64_t v14;
  const __CFString *v15;
  __CFArray *sourceList;
  __CFArray *v17;
  int64_t v18;
  char v19;
  const void **v20;
  BOOL *v21;
  _BYTE *v22;
  const void *Value;
  BOOL v24;
  const void *v25;
  const __CFArray *v26;
  CFIndex v27;
  CFIndex v28;
  unint64_t v29;
  uint64_t v30;
  BOOL v31;
  int64_t v32;
  int v33;
  int64_t v34;
  const void **v35;
  _BYTE *v36;
  const void *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  char *v42;
  unint64_t v43;
  void *v44;
  int v45;
  char *v46;
  unint64_t v47;
  unsigned __int8 *v48;
  const void **v49;
  const __CFString **v50;
  int64_t v51;
  unint64_t v53;
  unsigned __int8 *v54;
  const void **v55;
  int64_t v56;
  const __CFString **v57;
  uint64_t i;
  const __CFString *v60;
  const void *v61;
  CFPrefsCloudSource **p_cloudSetTarget;
  const __CFArray *v63;
  CFIndex Count;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const void **v68;
  CFIndex v69;
  id *v70;
  CFIndex v71;
  const __CFString **v72;
  const void *v73;
  __CFDictionary *v74;
  const __CFString *v75;
  const void **v76;
  const void *v77;
  const void *v78;
  CFStringRef v79;
  NSException *v80;
  uint64_t v81;
  int64_t v82;
  int64_t *v83;
  unint64_t v84;
  CFPrefsPlistSource **p_standardSetTarget;
  const void **v86;
  char *v87;
  __CFDictionary *Mutable;
  CFIndex v89;
  CFIndex FirstIndexOfValue;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  size_t v94[2];
  CFRange v95;
  CFRange v96;
  CFRange v97;
  CFRange v98;

  v86 = a3;
  v94[1] = *MEMORY[0x1E0C80C00];
  p_standardSetTarget = &self->_standardSetTarget;
  if (*(_OWORD *)&self->_standardSetTarget == 0)
    -[CFPrefsSearchListSource alreadylocked_setPrecopiedValues:forKeys:count:from:].cold.1();
  v93 = 16;
  if (!self->super._dict)
    -[CFPrefsSearchListSource alreadylocked_getDictionary:]((uint64_t)self, (uint64_t)&__block_literal_global_32);
  if (!self->_keysToSources)
    -[CFPrefsSearchListSource alreadylocked_setPrecopiedValues:forKeys:count:from:].cold.2();
  MEMORY[0x1E0C80A78](self, a2);
  v87 = (char *)&v82 - ((a5 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v87, a5);
  if (*(_OWORD *)&self->_cloudKeys == 0)
  {
    v45 = 0;
  }
  else
  {
    if (a5 < 1)
    {
      v11 = 0;
    }
    else
    {
      v11 = 0;
      v12 = a4;
      v13 = v87;
      v14 = a5;
      do
      {
        v15 = *v12++;
        v9 = -[CFPrefsSearchListSource alreadylocked_useCloudForKey:]((uint64_t)self, v15);
        *v13++ = v9;
        if ((_DWORD)v9)
          v11 = 1;
        --v14;
      }
      while (v14);
    }
    v45 = v11 & 1;
  }
  MEMORY[0x1E0C80A78](v9, v10);
  v91 = (char *)&v82 - ((a5 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v91, a5);
  sourceList = self->_sourceList;
  v95.length = CFArrayGetCount(sourceList);
  v95.location = 0;
  FirstIndexOfValue = CFArrayGetFirstIndexOfValue(sourceList, v95, *p_standardSetTarget);
  v92 = 96;
  LODWORD(v83) = v45;
  if (v45)
  {
    v17 = self->_sourceList;
    v96.length = CFArrayGetCount(v17);
    v96.location = 0;
    v89 = CFArrayGetFirstIndexOfValue(v17, v96, self->_cloudSetTarget);
  }
  else
  {
    v89 = -1;
  }
  v82 = a5;
  if (a5 < 1)
  {
    v19 = 0;
  }
  else
  {
    v18 = a5;
    v19 = 0;
    v20 = (const void **)a4;
    v21 = (BOOL *)v91;
    v22 = v87;
    do
    {
      Value = CFDictionaryGetValue(self->_keysToSources, *v20);
      v24 = 1;
      *v21 = 1;
      if (Value)
      {
        v25 = Value;
        v26 = *(Class *)((char *)&self->super.super.isa + v92);
        v97.length = CFArrayGetCount(v26);
        v97.location = 0;
        v27 = CFArrayGetFirstIndexOfValue(v26, v97, v25);
        if (v27 == -1)
        {
          v24 = 1;
        }
        else
        {
          v28 = FirstIndexOfValue;
          if (*v22)
            v28 = v89;
          v24 = v27 >= v28;
        }
        *v21 = v24;
      }
      v19 |= v24;
      ++v22;
      ++v21;
      ++v20;
      --v18;
    }
    while (v18);
  }
  v29 = -[__CFPrefsWeakObservers approximateCount](self->super._observers, "approximateCount", v82);
  Mutable = 0;
  v30 = *(uint64_t *)((char *)&self->super.super.isa + v93);
  v84 = v29;
  if (v30)
    v31 = v29 == 0;
  else
    v31 = 1;
  if (v31)
  {
    v32 = v82;
    if (!(_DWORD)v83)
      goto LABEL_51;
  }
  else
  {
    v32 = v82;
    v33 = (int)v83;
    if ((v19 & 1) != 0)
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v32 >= 1)
      {
        v34 = v32;
        v35 = (const void **)a4;
        v36 = v91;
        do
        {
          v37 = CFDictionaryGetValue(*(CFDictionaryRef *)((char *)&self->super.super.isa + v93), *v35);
          if (v37 && *v36)
            CFDictionarySetValue(Mutable, *v35, v37);
          ++v36;
          ++v35;
          --v34;
        }
        while (v34);
      }
    }
    if (!v33)
      goto LABEL_51;
  }
  if (-[CFPrefsCloudSource enabled](self->_cloudSetTarget, "enabled"))
  {
    if ((((unint64_t)v32 >> 59) & 0xF) != 0)
    {
      v79 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), 2 * v32);
      v80 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v79, 0);
      CFRelease(v79);
      objc_exception_throw(v80);
    }
    if (v32)
      v39 = 2 * v32;
    else
      v39 = 1;
    v40 = MEMORY[0x1E0C80A78](v39, v38);
    v42 = (char *)&v82 - v41;
    v94[0] = 0;
    if (v43 >= 0x101)
    {
      v42 = (char *)_CFCreateArrayStorage(v40, 0, v94);
      v44 = v42;
    }
    else
    {
      v44 = 0;
    }
    v46 = &v42[8 * v32];
    if (v32 < 1)
    {
      v47 = 0;
    }
    else
    {
      v47 = 0;
      v49 = v86;
      v48 = (unsigned __int8 *)v87;
      v50 = a4;
      v51 = v32;
      do
      {
        if (*v48++)
        {
          *(_QWORD *)&v42[8 * v47] = *v50;
          *(_QWORD *)&v46[8 * v47++] = *v49;
        }
        ++v49;
        ++v50;
        --v51;
      }
      while (v51);
    }
    -[CFPrefsSource setValues:forKeys:count:copyValues:from:]((os_unfair_lock_s *)self->_cloudSetTarget, (uint64_t)&v42[8 * v32], (uint64_t)v42, v47, 0, (uint64_t)self);
    if (v32 < 1)
    {
      v53 = 0;
    }
    else
    {
      v53 = 0;
      v55 = v86;
      v54 = (unsigned __int8 *)v87;
      v56 = v32;
      v57 = a4;
      do
      {
        if (!*v54++)
        {
          *(_QWORD *)&v42[8 * v53] = *v57;
          *(_QWORD *)&v46[8 * v53++] = *v55;
        }
        ++v55;
        ++v57;
        --v56;
      }
      while (v56);
    }
    -[CFPrefsSource setValues:forKeys:count:copyValues:from:]((os_unfair_lock_s *)*p_standardSetTarget, (uint64_t)&v42[8 * v32], (uint64_t)v42, v53, 0, (uint64_t)self);
    free(v44);
    if ((v19 & 1) == 0)
      return;
    goto LABEL_69;
  }
LABEL_51:
  -[CFPrefsSource setValues:forKeys:count:copyValues:from:]((os_unfair_lock_s *)*p_standardSetTarget, (uint64_t)v86, (uint64_t)a4, v32, 0, (uint64_t)self);
  if ((v19 & 1) == 0)
    return;
LABEL_69:
  if (v32 >= 1)
  {
    for (i = 0; i != v32; ++i)
    {
      if (v91[i])
      {
        v60 = a4[i];
        if (v60)
        {
          v61 = v86[i];
          if (v61)
          {
            CFDictionarySetValue(*(CFMutableDictionaryRef *)((char *)&self->super.super.isa + v93), v60, v61);
            p_cloudSetTarget = (CFPrefsCloudSource **)p_standardSetTarget;
            if (v87[i])
              p_cloudSetTarget = &self->_cloudSetTarget;
            CFDictionarySetValue(self->_keysToSources, a4[i], *p_cloudSetTarget);
          }
          else
          {
            v63 = *(Class *)((char *)&self->super.super.isa + v92);
            if (v63)
            {
              Count = CFArrayGetCount(v63);
              v83 = &v82;
              v66 = MEMORY[0x1E0C80A78](Count, v65);
              v68 = (const void **)((char *)&v82 - v67);
              if (v66 >= 1)
              {
                v98.location = 0;
                v98.length = Count;
                CFArrayGetValues(*(CFArrayRef *)((char *)&self->super.super.isa + v92), v98, v68);
              }
            }
            else
            {
              v83 = &v82;
              MEMORY[0x1E0C80A78](0, v60);
              v68 = (const void **)&v81;
              Count = 0;
            }
            v69 = FirstIndexOfValue;
            if (v87[i])
              v69 = v89;
            if (v69 + 1 < Count)
            {
              v70 = (id *)&v68[v69 + 1];
              v71 = ~v69 + Count;
              while (1)
              {
                v72 = &a4[i];
                v73 = (const void *)objc_msgSend(*v70, "copyValueForKey:", *v72);
                v74 = *(Class *)((char *)&self->super.super.isa + v93);
                v75 = *v72;
                if (v73)
                  break;
                CFDictionaryRemoveValue(v74, v75);
                CFDictionaryRemoveValue(self->_keysToSources, a4[i]);
                ++v70;
                if (!--v71)
                  goto LABEL_89;
              }
              CFDictionarySetValue(v74, v75, v73);
              CFDictionarySetValue(self->_keysToSources, a4[i], *v70);
              CFRelease(v73);
            }
          }
LABEL_89:
          if (v84)
          {
            v76 = (const void **)&a4[i];
            v77 = *v76;
            v78 = CFDictionaryGetValue(Mutable, *v76);
            -[CFPrefsSearchListSource deferredNotifyCausedByLocalWriteOfChangesToKey:fromValue:toValue:](self, "deferredNotifyCausedByLocalWriteOfChangesToKey:fromValue:toValue:", v77, v78, CFDictionaryGetValue(*(CFDictionaryRef *)((char *)&self->super.super.isa + v93), *v76));
          }
        }
      }
    }
  }
  if (Mutable)
    CFRelease(Mutable);
}

- (void)deferredNotifyCausedByLocalWriteOfChangesToKey:(__CFString *)a3 fromValue:(void *)a4 toValue:(void *)a5
{
  char *v6;
  char *v8;
  _CFPrefsPendingKVONotification *v9;
  __CFArray *Pending;
  void *v11;
  void *values;
  void *keys[2];

  v6 = (char *)a4;
  keys[1] = *(void **)MEMORY[0x1E0C80C00];
  values = a4;
  keys[0] = a3;
  v11 = a5;
  os_unfair_lock_assert_owner(&self->super._lock);
  if (v6)
    v6 = (char *)CFDictionaryCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (const void **)keys, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (a5)
    v8 = (char *)CFDictionaryCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (const void **)keys, (const void **)&v11, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  else
    v8 = 0;
  v9 = objc_alloc_init(_CFPrefsPendingKVONotification);
  -[_CFPrefsPendingKVONotification setSource:](v9, (char *)self);
  -[_CFPrefsPendingKVONotification setValues:](v9, v8);
  -[_CFPrefsPendingKVONotification setOldValues:](v9, v6);
  if (v6)
    CFRelease(v6);
  if (v8)
    CFRelease(v8);
  Pending = -[CFPrefsSearchListSource _getPendingNotifications]((uint64_t)self);
  CFArrayAppendValue(Pending, v9);

}

- (void)deferredNotifyCausedByLoadingOfChangesFromDictionary:(__CFDictionary *)a3 toDictionary:(__CFDictionary *)Copy
{
  __CFArray *Pending;
  _CFPrefsPendingKVONotification *value;

  os_unfair_lock_assert_owner(&self->super._lock);
  if (a3)
    CFRetain(a3);
  if (Copy)
    Copy = CFDictionaryCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, Copy);
  value = objc_alloc_init(_CFPrefsPendingKVONotification);
  -[_CFPrefsPendingKVONotification setSource:](value, (char *)self);
  -[_CFPrefsPendingKVONotification setValues:](value, (char *)Copy);
  -[_CFPrefsPendingKVONotification setOldValues:](value, (char *)a3);
  if (a3)
    CFRelease(a3);
  if (Copy)
    CFRelease(Copy);
  Pending = -[CFPrefsSearchListSource _getPendingNotifications]((uint64_t)self);
  CFArrayAppendValue(Pending, value);

}

- (CFMutableArrayRef)_getPendingNotifications
{
  uint64_t v1;
  CFMutableArrayRef Mutable;

  if (!a1)
    return 0;
  v1 = _CFGetTSD(0x10u);
  if (v1 == 16)
  {
    Mutable = CFArrayCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeArrayCallBacks);
    _CFSetTSD(0x10u, (uint64_t)Mutable, (uint64_t)pendingKVODestructor);
  }
  else
  {
    Mutable = (CFMutableArrayRef)v1;
    if (!v1)
      -[CFPrefsSearchListSource _getPendingNotifications].cold.1();
  }
  return Mutable;
}

- (void)addSource:.cold.1()
{
  __assert_rtn("-[CFPrefsSearchListSource addSource:]", "CFPrefsSearchListSource.m", 1370, "!initialized");
}

- (void)removeSource:(uint64_t)a1
{
  const __CFArray *v4;
  CFIndex FirstIndexOfValue;
  CFRange v6;

  if (a1)
  {
    if (a2)
    {
      v4 = *(const __CFArray **)(a1 + 96);
      if (v4)
      {
        if (*(_BYTE *)(a1 + 136))
          -[CFPrefsSearchListSource removeSource:].cold.1();
        v6.length = CFArrayGetCount(*(CFArrayRef *)(a1 + 96));
        v6.location = 0;
        FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v4, v6, a2);
        if (FirstIndexOfValue != -1)
          CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 96), FirstIndexOfValue);
        if (*(const void **)(a1 + 120) == a2)
          *(_QWORD *)(a1 + 120) = 0;
        if (*(const void **)(a1 + 128) == a2)
          *(_QWORD *)(a1 + 128) = 0;
        atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)(a1 + 32));
      }
    }
  }
}

void __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  _xpc_connection_s **v4;
  _QWORD v5[7];

  v5[6] = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_xpc_connection_s ***)(*(_QWORD *)(a1 + 32) + 8);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke_2;
  v5[3] = &unk_1E13344F8;
  v5[4] = a2;
  v5[5] = v3;
  -[_CFXPreferences withConnectionForRole:andUserIdentifier:performBlock:](v4, a3, 0, (uint64_t)v5);
}

void __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke_2(uint64_t a1, xpc_connection_t connection)
{
  xpc_object_t v4;
  uint64_t v5;

  v4 = xpc_connection_send_message_with_reply_sync(connection, *(xpc_object_t *)(a1 + 32));
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, xpc_object_t, xpc_connection_t))(v5 + 16))(v5, *(_QWORD *)(a1 + 32), v4, connection);
  xpc_release(v4);
}

uint64_t __80__CFPrefsSearchListSource_alreadylocked_generationCountFromListOfSources_count___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5 = 0;
  return objc_msgSend(*(id *)(a1 + 32), "handleReply:toRequestNewDataMessage:onConnection:retryCount:error:", a3, a2, a4, 0, &v5);
}

- (void)handleReply:(id)a3 toRequestNewDataMessage:(id)a4 onConnection:(id)a5 retryCount:(int)a6 error:(BOOL *)a7
{
  __CFArray *sourceList;
  CFIndex v12;
  xpc_object_t value;
  xpc_object_t v14;
  void *v15;
  CFIndex Count;
  _QWORD v17[8];

  v17[7] = *MEMORY[0x1E0C80C00];
  sourceList = self->_sourceList;
  if (!sourceList)
    return;
  if (!a3)
    goto LABEL_5;
  if (object_getClass(a3) != (Class)MEMORY[0x1E0C812F8])
  {
    sourceList = self->_sourceList;
LABEL_5:
    if (CFArrayGetCount(sourceList) >= 1)
    {
      v12 = 0;
      do
        objc_msgSend((id)CFArrayGetValueAtIndex(self->_sourceList, v12++), "generationCount");
      while (CFArrayGetCount(self->_sourceList) > v12);
    }
    return;
  }
  value = xpc_dictionary_get_value(a4, "CFPreferencesMessages");
  v14 = xpc_dictionary_get_value(a3, "CFPreferencesMessages");
  if (v14)
  {
    v15 = v14;
    Count = CFArrayGetCount(self->_sourceList);
    if (Count != xpc_array_get_count(v15))
      -[CFPrefsSearchListSource handleReply:toRequestNewDataMessage:onConnection:retryCount:error:].cold.1();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __93__CFPrefsSearchListSource_handleReply_toRequestNewDataMessage_onConnection_retryCount_error___block_invoke;
    v17[3] = &unk_1E1334FA0;
    v17[4] = self;
    v17[5] = value;
    v17[6] = a5;
    xpc_array_apply(v15, v17);
  }
}

uint64_t __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 1);
}

uint64_t __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 3);
}

uint64_t __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 2);
}

- (void)dealloc
{
  __CFArray *sourceList;
  __CFString *identifier;
  __CFSet *cloudKeys;
  __CFArray *cloudPrefixKeys;
  __CFDictionary *keysToSources;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  sourceList = self->_sourceList;
  if (sourceList)
    CFRelease(sourceList);
  identifier = self->_identifier;
  if (identifier)
    CFRelease(identifier);
  cloudKeys = self->_cloudKeys;
  if (cloudKeys)
    CFRelease(cloudKeys);
  cloudPrefixKeys = self->_cloudPrefixKeys;
  if (cloudPrefixKeys)
    CFRelease(cloudPrefixKeys);
  keysToSources = self->_keysToSources;
  if (keysToSources)
    CFRelease(keysToSources);
  self->_identifier = 0;
  self->_sourceList = 0;
  v8.receiver = self;
  v8.super_class = (Class)CFPrefsSearchListSource;
  -[CFPrefsSource dealloc](&v8, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  _QWORD *v5;
  const void *v6;
  __CFArray *sourceList;
  CFMutableArrayRef MutableCopy;
  const void *v9;
  __CFPrefsWeakObservers *observers;
  const void *v11;
  __CFSet *cloudKeys;
  CFMutableSetRef v13;
  __CFArray *cloudPrefixKeys;
  __CFDictionary *dict;
  __CFDictionary *keysToSources;

  os_unfair_lock_lock(&self->super._lock);
  v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdentifier:containingPreferences:", self->_identifier, self->super._containingPreferences);
  v5 = (_QWORD *)v4;
  if (v4)
  {
    v6 = *(const void **)(v4 + 96);
    if (v6)
      CFRelease(v6);
    sourceList = self->_sourceList;
    if (sourceList)
      MutableCopy = CFArrayCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, sourceList);
    else
      MutableCopy = 0;
    v5[12] = MutableCopy;
    v9 = (const void *)v5[3];
    if (v9)
      CFRelease(v9);
    observers = self->super._observers;
    if (observers)
      observers = (__CFPrefsWeakObservers *)-[__CFPrefsWeakObservers mutableCopy](observers, "mutableCopy");
    v5[3] = observers;
    v11 = (const void *)v5[13];
    if (v11)
      CFRelease(v11);
    cloudKeys = self->_cloudKeys;
    if (cloudKeys)
      v13 = CFSetCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, cloudKeys);
    else
      v13 = 0;
    v5[13] = v13;
    cloudPrefixKeys = self->_cloudPrefixKeys;
    if (cloudPrefixKeys)
      v5[14] = CFArrayCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, cloudPrefixKeys);
    v5[15] = self->_standardSetTarget;
    v5[16] = self->_cloudSetTarget;
    dict = self->super._dict;
    if (dict)
      v5[2] = CFDictionaryCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, dict);
    keysToSources = self->_keysToSources;
    if (keysToSources)
      v5[10] = CFDictionaryCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, keysToSources);
  }
  os_unfair_lock_unlock(&self->super._lock);
  return v5;
}

- (void)replaceSource:(const void *)a3 withSource:
{
  const __CFArray *v4;
  CFIndex FirstIndexOfValue;
  CFRange v8;

  if (a1)
  {
    v4 = *(const __CFArray **)(a1 + 96);
    if (v4)
    {
      if (!a2 || !a3 || *(_BYTE *)(a1 + 136))
        -[CFPrefsSearchListSource replaceSource:withSource:].cold.1();
      v8.length = CFArrayGetCount(*(CFArrayRef *)(a1 + 96));
      v8.location = 0;
      FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v4, v8, a2);
      if (FirstIndexOfValue != -1)
        CFArraySetValueAtIndex(*(CFMutableArrayRef *)(a1 + 96), FirstIndexOfValue, a3);
    }
  }
}

- (uint64_t)freeze
{
  if (result)
    *(_BYTE *)(result + 136) = 1;
  return result;
}

- (void)setCloudEnabled:(const void *)a3 forKeyPrefix:
{
  __CFArray *Mutable;
  CFIndex FirstIndexOfValue;
  CFRange v8;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 52));
    Mutable = *(__CFArray **)(a1 + 112);
    if ((_DWORD)a2)
    {
      if (!Mutable)
      {
        Mutable = CFArrayCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeArrayCallBacks);
        *(_QWORD *)(a1 + 112) = Mutable;
      }
      CFArrayAppendValue(Mutable, a3);
    }
    else
    {
      if (!Mutable)
        goto LABEL_10;
      v8.length = CFArrayGetCount(*(CFArrayRef *)(a1 + 112));
      v8.location = 0;
      FirstIndexOfValue = CFArrayGetFirstIndexOfValue(Mutable, v8, a3);
      if (FirstIndexOfValue == -1)
        goto LABEL_10;
      CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 112), FirstIndexOfValue);
      if (CFArrayGetCount(*(CFArrayRef *)(a1 + 112)))
        goto LABEL_10;
    }
    objc_msgSend(*(id *)(a1 + 128), "setEnabled:", a2);
LABEL_10:
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 52));
  }
}

- (void)setCloudEnabled:(const void *)a3 forKey:
{
  __CFSet *Mutable;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 52));
    Mutable = *(__CFSet **)(a1 + 104);
    if ((_DWORD)a2)
    {
      if (!Mutable)
      {
        Mutable = CFSetCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFCopyStringSetCallBacks);
        *(_QWORD *)(a1 + 104) = Mutable;
      }
      CFSetAddValue(Mutable, a3);
    }
    else
    {
      if (!Mutable)
        goto LABEL_9;
      CFSetRemoveValue(Mutable, a3);
      if (CFSetGetCount(*(CFSetRef *)(a1 + 104)))
        goto LABEL_9;
    }
    objc_msgSend(*(id *)(a1 + 128), "setEnabled:", a2);
LABEL_9:
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 52));
  }
}

- (void)alreadylocked_reloadCacheIfStale
{
  if (a1)
    -[CFPrefsSearchListSource alreadylocked_getDictionary:](a1, (uint64_t)&__block_literal_global_32);
}

- (void)removePreferencesObserver:(uint64_t)a1
{
  if (a1 && a2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 52));
    if (-[CFPrefsSource alreadylocked_removePreferencesObserver:](a1, a2))
      -[CFPrefsSearchListSource removePreferencesObserver:].cold.1();
    if (!objc_msgSend(*(id *)(a1 + 24), "approximateCount"))
      -[CFPrefsSearchListSource alreadylocked_setObservingContents:](a1, 0);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 52));
  }
}

- (BOOL)isDirectModeEnabled
{
  return -[CFPrefsPlistSource isDirectModeEnabled](self->_standardSetTarget, "isDirectModeEnabled");
}

- (void)addCloudSourceForIdentifier:(uint64_t)a3 configurationPath:(uint64_t)a4 storeName:(const __CFString *)a5 container:
{
  uint64_t v5;
  _QWORD v6[8];

  v6[7] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v5 = *(_QWORD *)(a1 + 8);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __93__CFPrefsSearchListSource_addCloudSourceForIdentifier_configurationPath_storeName_container___block_invoke;
    v6[3] = &unk_1E1334F00;
    v6[5] = a3;
    v6[6] = a4;
    v6[4] = a1;
    -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](v5, a2, CFSTR("kCFPreferencesCurrentUser"), 0, a5, 1, (uint64_t)v6);
  }
}

void __93__CFPrefsSearchListSource_addCloudSourceForIdentifier_configurationPath_storeName_container___block_invoke(uint64_t *a1, void *a2)
{
  objc_msgSend(a2, "setConfigurationPath:", a1[5]);
  objc_msgSend(a2, "setStoreName:", a1[6]);
  -[CFPrefsSearchListSource addSource:](a1[4], a2);
}

- (uint64_t)alreadylocked_useCloudForKey:(uint64_t)result
{
  uint64_t v3;
  const __CFSet *v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex v7;
  const __CFString *ValueAtIndex;
  int HasPrefix;
  BOOL v10;

  if (result)
  {
    v3 = result;
    v4 = *(const __CFSet **)(result + 104);
    if (v4 && CFSetContainsValue(v4, value))
    {
      return 1;
    }
    else
    {
      result = *(_QWORD *)(v3 + 112);
      if (result)
      {
        Count = CFArrayGetCount((CFArrayRef)result);
        v6 = Count - 1;
        if (Count < 1)
        {
          return 0;
        }
        else
        {
          v7 = 0;
          do
          {
            ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v3 + 112), v7);
            HasPrefix = CFStringHasPrefix(value, ValueAtIndex);
            v10 = HasPrefix == 0;
            result = HasPrefix != 0;
            v10 = !v10 || v6 == v7++;
          }
          while (!v10);
        }
      }
    }
  }
  return result;
}

- (uint64_t)alreadylocked_hasCloudValueForKey:(uint64_t)result
{
  uint64_t v2;

  if (result)
  {
    v2 = result;
    if (*(_QWORD *)(result + 96))
    {
      result = -[CFPrefsSearchListSource alreadylocked_useCloudForKey:](result, a2);
      if ((_DWORD)result)
      {
        result = objc_msgSend(*(id *)(v2 + 128), "copyValueForKey:", a2);
        if (result)
        {
          CFRelease((CFTypeRef)result);
          return 1;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)alreadylocked_hasNonRegisteredValueForKey:(uint64_t)a1
{
  const __CFArray *v3;
  CFIndex Count;
  uint64_t v6;
  CFIndex v7;
  uint64_t v8;
  const void **v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  _BOOL8 v13;
  uint64_t v14;
  const void **v15;
  uint64_t v16;
  _QWORD v18[2];
  CFRange v19;

  v18[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v3 = *(const __CFArray **)(a1 + 96);
  if (!v3)
    return 0;
  Count = CFArrayGetCount(v3);
  if (Count < 1)
    return 0;
  v7 = Count;
  MEMORY[0x1E0C80A78](Count, v6);
  v9 = (const void **)((char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v19.location = 0;
  v19.length = v7;
  CFArrayGetValues(*(CFArrayRef *)(a1 + 96), v19, v9);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = -2;
  else
    v10 = -1;
  v11 = v10 + v7;
  if (v10 + v7 < 1)
    return 0;
  v12 = (const void *)objc_msgSend((id)*v9, "copyValueForKey:", a2);
  if (!v12)
  {
    v14 = 0;
    v15 = v9 + 1;
    v16 = v10 + v7 - 1;
    while (v16 != v14)
    {
      v12 = (const void *)objc_msgSend((id)v15[v14++], "copyValueForKey:", a2);
      if (v12)
      {
        v13 = v11 > v14;
        goto LABEL_15;
      }
    }
    return 0;
  }
  v13 = 1;
LABEL_15:
  CFRelease(v12);
  return v13;
}

- (void)fullCloudSynchronizeWithCompletionHandler:(id)a3
{
  CFPrefsCloudSource *cloudSetTarget;

  cloudSetTarget = self->_cloudSetTarget;
  if (cloudSetTarget)
    -[CFPrefsCloudSource fullCloudSynchronizeWithCompletionHandler:](cloudSetTarget, "fullCloudSynchronizeWithCompletionHandler:", a3);
  else
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (__CFArray)alreadylocked_copyKeyList
{
  __CFArray *Mutable;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!self->_sourceList)
    return CFArrayCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeArrayCallBacks);
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__CFPrefsSearchListSource_alreadylocked_copyKeyList__block_invoke;
  v4[3] = &unk_1E1334F78;
  v4[4] = &v5;
  -[CFPrefsSearchListSource alreadylocked_getDictionary:]((uint64_t)self, (uint64_t)v4);
  Mutable = (__CFArray *)v6[3];
  if (!Mutable)
    Mutable = CFArrayCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeArrayCallBacks);
  _Block_object_dispose(&v5, 8);
  return Mutable;
}

void __52__CFPrefsSearchListSource_alreadylocked_copyKeyList__block_invoke(uint64_t a1, CFDictionaryRef theDict)
{
  unint64_t Count;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  const void **v9;
  const void **v10;
  CFStringRef v11;
  NSException *v12;
  size_t v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (theDict)
  {
    Count = CFDictionaryGetCount(theDict);
    v6 = Count;
    if (Count >> 60)
    {
      v11 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), Count);
      v12 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v11, 0);
      CFRelease(v11);
      objc_exception_throw(v12);
    }
    if (Count <= 1)
      Count = 1;
    v7 = MEMORY[0x1E0C80A78](Count, v5);
    v9 = (const void **)((char *)v13 - v8);
    v13[0] = 0;
    if (v6 >= 0x101)
    {
      v9 = (const void **)_CFCreateArrayStorage(v7, 0, v13);
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    CFDictionaryGetKeysAndValues(theDict, v9, 0);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFArrayCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, v9, v6, &kCFTypeArrayCallBacks);
    free(v10);
  }
}

uint64_t __55__CFPrefsSearchListSource_alreadylocked_getDictionary___block_invoke(uint64_t a1, const __CFString *a2)
{
  return -[CFPrefsSearchListSource alreadylocked_useCloudForKey:](*(_QWORD *)(a1 + 32), a2);
}

- (uint64_t)alreadylocked_copyManagedValueForKey:
{
  return 0;
}

- (CFMutableDictionaryRef)alreadylocked_copyManagedDictionary
{
  const __CFArray *v1;
  CFMutableDictionaryRef Mutable;
  CFIndex Count;
  CFIndex v4;
  CFIndex i;

  if (!a1)
    return 0;
  v1 = (const __CFArray *)objc_msgSend(a1, "alreadylocked_copyKeyList");
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  Count = CFArrayGetCount(v1);
  if (Count >= 1)
  {
    v4 = Count;
    for (i = 0; i != v4; ++i)
      CFArrayGetValueAtIndex(v1, i);
  }
  CFRelease(v1);
  return Mutable;
}

- (id)description
{
  __CFString *Mutable;
  __CFArray *sourceList;
  CFIndex Count;
  uint64_t v6;
  CFIndex v7;
  uint64_t v8;
  const void **v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const __CFSet *cloudKeys;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  const void **v18;
  size_t v19;
  const __CFString *v20;
  uint64_t v22;
  objc_super v23;
  uint64_t v24;
  CFRange v25;

  v24 = *MEMORY[0x1E0C80C00];
  Mutable = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0);
  os_unfair_lock_lock(&self->super._lock);
  sourceList = self->_sourceList;
  if (sourceList && (Count = CFArrayGetCount(sourceList), Count >= 1))
  {
    v7 = Count;
    MEMORY[0x1E0C80A78](Count, v6);
    v9 = (const void **)((char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
    v25.location = 0;
    v25.length = v7;
    CFArrayGetValues(self->_sourceList, v25, v9);
    v23.receiver = self;
    v23.super_class = (Class)CFPrefsSearchListSource;
    v10 = -[CFPrefsSource description](&v23, sel_description);
    CFStringAppend(Mutable, v10);
    CFStringAppend(Mutable, CFSTR("Sources: [\n"));
    do
    {
      v11 = (void *)_CFAutoreleasePoolPush();
      CFStringAppend(Mutable, CFSTR("    "));
      v12 = (void *)*v9++;
      CFStringAppend(Mutable, (CFStringRef)objc_msgSend(v12, "description"));
      CFStringAppend(Mutable, CFSTR("\n"));
      _CFAutoreleasePoolPop(v11);
      --v7;
    }
    while (v7);
    CFStringAppend(Mutable, CFSTR("]\n"));
  }
  else
  {
    CFStringAppend(Mutable, CFSTR("Sources: []\n"));
  }
  CFStringAppend(Mutable, CFSTR("Cloud Keys: ["));
  cloudKeys = self->_cloudKeys;
  if (cloudKeys)
  {
    cloudKeys = (const __CFSet *)CFSetGetCount(cloudKeys);
    v15 = (uint64_t)cloudKeys;
  }
  else
  {
    v15 = 0;
  }
  MEMORY[0x1E0C80A78](cloudKeys, v13);
  v18 = (const void **)((char *)&v22 - v17);
  if (v16 >= 0x200)
    v19 = 512;
  else
    v19 = v16;
  bzero((char *)&v22 - v17, v19);
  if (v15 >= 1)
  {
    CFSetGetValues(self->_cloudKeys, v18);
    do
    {
      v20 = (const __CFString *)*v18++;
      CFStringAppend(Mutable, v20);
      CFStringAppend(Mutable, CFSTR(", "));
      --v15;
    }
    while (v15);
  }
  CFStringAppend(Mutable, CFSTR("]\n"));
  os_unfair_lock_unlock(&self->super._lock);
  return (id)CFAutorelease(Mutable);
}

- (__CFString)copyOSLogDescription
{
  const char *ClassName;

  ClassName = object_getClassName(self);
  return (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%s<%p> (Domain: %@, Container: %@)"), ClassName, self, -[CFPrefsSearchListSource domainIdentifier](self, "domainIdentifier"), -[CFPrefsPlistSource container](self->_standardSetTarget, "container"));
}

- (void)copyCloudConfigurationWithURL:(uint64_t)a1 outConfigFileSource:outStoreName:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 88);
  OUTLINED_FUNCTION_1_18();
  OUTLINED_FUNCTION_0_28(&dword_182A8C000, v1, v2, "No defaults configuration file found for %{public}@ (looked at %{public}@)", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2_13();
}

- (void)copyCloudConfigurationWithURL:(uint64_t)a1 outConfigFileSource:outStoreName:.cold.2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 88);
  OUTLINED_FUNCTION_1_18();
  OUTLINED_FUNCTION_0_28(&dword_182A8C000, v1, v2, "Found defaults configuration for %{public}@ at %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2_13();
}

- (void)addPreferencesObserver:.cold.1()
{
  __assert_rtn("-[CFPrefsSearchListSource addPreferencesObserver:]", "CFPrefsSearchListSource.m", 522, "CFPreferencesInvalidOperation == [self alreadylocked_addPreferencesObserver:obs]");
}

- (void)removePreferencesObserver:.cold.1()
{
  __assert_rtn("-[CFPrefsSearchListSource removePreferencesObserver:]", "CFPrefsSearchListSource.m", 534, "CFPreferencesInvalidOperation == [self alreadylocked_removePreferencesObserver:obs]");
}

- (void)alreadylocked_copyValueForKey:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_18();
  OUTLINED_FUNCTION_0_28(&dword_182A8C000, v1, v2, "found no value for key %{public}@ in %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2_13();
}

- (void)alreadylocked_setPrecopiedValues:forKeys:count:from:.cold.1()
{
  __assert_rtn("-[CFPrefsSearchListSource alreadylocked_setPrecopiedValues:forKeys:count:from:]", "CFPrefsSearchListSource.m", 725, "_standardSetTarget || _cloudSetTarget");
}

- (void)alreadylocked_setPrecopiedValues:forKeys:count:from:.cold.2()
{
  __assert_rtn("-[CFPrefsSearchListSource alreadylocked_setPrecopiedValues:forKeys:count:from:]", "CFPrefsSearchListSource.m", 731, "_keysToSources");
}

- (void)handleReply:toRequestNewDataMessage:onConnection:retryCount:error:.cold.1()
{
  __assert_rtn("-[CFPrefsSearchListSource handleReply:toRequestNewDataMessage:onConnection:retryCount:error:]", "CFPrefsSearchListSource.m", 897, "count == xpc_array_get_count(replyList)");
}

- (void)_getPendingNotifications
{
  __assert_rtn("-[CFPrefsSearchListSource _getPendingNotifications]", "CFPrefsSearchListSource.m", 1273, "pendingNotifications");
}

- (void)removeSource:.cold.1()
{
  __assert_rtn("-[CFPrefsSearchListSource removeSource:]", "CFPrefsSearchListSource.m", 1384, "!initialized");
}

- (void)replaceSource:withSource:.cold.1()
{
  __assert_rtn("-[CFPrefsSearchListSource replaceSource:withSource:]", "CFPrefsSearchListSource.m", 1397, "old && new && !initialized");
}

@end
