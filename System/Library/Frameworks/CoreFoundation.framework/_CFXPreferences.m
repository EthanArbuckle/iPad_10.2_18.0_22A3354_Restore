@implementation _CFXPreferences

- (void)copyAppValueForKey:(__CFString *)a3 identifier:(__CFString *)a4 container:(__CFString *)a5 configurationURL:(__CFURL *)a6
{
  void *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76___CFXPreferences_copyAppValueForKey_identifier_container_configurationURL___block_invoke;
  v8[3] = &unk_1E1336E40;
  v8[4] = &v9;
  v8[5] = a3;
  -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:]((uint64_t)self, a4, a5, (uint64_t)a6, (uint64_t)v8);
  v6 = (void *)v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (void)withSearchListForIdentifier:(const __CFString *)a3 container:(uint64_t)a4 cloudConfigurationURL:(uint64_t)a5 perform:
{
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __108___CFXPreferences_SearchListAdditions__withSearchListForIdentifier_container_cloudConfigurationURL_perform___block_invoke;
    v5[3] = &unk_1E1335170;
    v5[5] = a5;
    v5[6] = a4;
    v5[4] = a1;
    normalizeQuintuplet(a2, CFSTR("kCFPreferencesCurrentUser"), 0, a3, a4 != 0, (uint64_t)v5);
  }
}

- (void)withSourceForIdentifier:(const __CFString *)cf2 user:(int)a4 byHost:(const __CFString *)a5 container:(int)a6 cloud:(uint64_t)a7 perform:
{
  CFStringRef v13;
  char v14;
  const __CFString *v15;
  CFStringRef v16;
  const __CFString *v17;
  const __CFString *v18;
  CFStringRef v19;
  const __CFString *Copy;
  int v21;
  BOOL v22;
  int v23;
  uint64_t v24;
  __CFString *CacheStringForBundleID;
  char v26;
  CFStringRef v27;
  int v28;
  const __CFString *CacheKeyForQuintuplet;
  _BOOL4 v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[10];
  char v34;
  char v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  uint64_t v41;
  _QWORD v42[8];
  __int16 v43;
  const __CFString *v44;
  CFStringRef v45;
  __CFString *v46;
  unsigned __int8 v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v47 = a4;
  if (a1)
  {
    if (a4 && !CFEqual(CFSTR("kCFPreferencesAnyUser"), cf2))
      v47 = 0;
    v45 = 0;
    v46 = 0;
    v44 = 0;
    v43 = 0;
    _CFPrefsExtractQuadrupleFromPathIfPossible(a2, (CFStringRef *)&v46, &v45, (CFTypeRef *)&v44, &v47, (_BYTE *)&v43 + 1, &v43);
    v13 = v46;
    if (v46)
    {
      a2 = v46;
      if (a6)
        -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:].cold.1();
    }
    v31 = a7;
    v32 = a1;
    v14 = a6;
    v15 = v44;
    v16 = v45;
    if (v45)
      v17 = v45;
    else
      v17 = cf2;
    if (v44)
      v18 = v44;
    else
      v18 = a5;
    v19 = _CFPrefsCopyUserForContainer(v17, v18);
    Copy = CFSTR("kCFPreferencesAnyUser");
    v21 = CFEqual(CFSTR("kCFPreferencesAnyUser"), v19);
    if (v47)
      v22 = 1;
    else
      v22 = v21 == 0;
    if (v22)
      v23 = v47;
    else
      v23 = 1;
    v47 = v23;
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __96___CFXPreferences_SourceAdditions__withSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke;
    v42[3] = &__block_descriptor_64_e5_v8__0l;
    v42[4] = v15;
    v42[5] = v13;
    v42[6] = v16;
    v42[7] = v19;
    if (HIBYTE(v43))
    {
      -[_CFXPreferences withManagedSourceForIdentifier:user:perform:]((const os_unfair_lock *)v32, a2, (uint64_t)v19, v31);
      __96___CFXPreferences_SourceAdditions__withSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke(v42);
    }
    else
    {
      v24 = MEMORY[0x1E0C809B0];
      CacheStringForBundleID = (__CFString *)_CFPrefsGetCacheStringForBundleID(a2);
      if (CFEqual(v19, CFSTR("kCFPreferencesCurrentUser")))
      {
        Copy = CFSTR("kCFPreferencesCurrentUser");
        v26 = v14;
      }
      else
      {
        v26 = v14;
        if (!CFEqual(v19, CFSTR("kCFPreferencesAnyUser")))
        {
          v27 = CFCopyUserName();
          v28 = CFEqual(v19, v27);
          CFRelease(v27);
          if (!CFSTR("kCFPreferencesCurrentUser") || (Copy = CFSTR("kCFPreferencesCurrentUser"), !v28))
            Copy = CFStringCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, v19);
        }
      }
      if (withSourceForIdentifier_user_byHost_container_cloud_perform__registerOnce != -1)
        dispatch_once(&withSourceForIdentifier_user_byHost_container_cloud_perform__registerOnce, &__block_literal_global_174);
      CacheKeyForQuintuplet = _CFPrefsCreateCacheKeyForQuintuplet(CacheStringForBundleID, Copy, v23 != 0, v18, v26);
      v36 = 0;
      v37 = &v36;
      v38 = 0x3052000000;
      v39 = __Block_byref_object_copy__0;
      v40 = __Block_byref_object_dispose__0;
      v41 = 0;
      v33[0] = v24;
      v33[1] = 3221225472;
      v33[2] = __96___CFXPreferences_SourceAdditions__withSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke_178;
      v33[3] = &unk_1E1333108;
      v33[6] = CacheKeyForQuintuplet;
      v33[7] = Copy;
      v34 = v26;
      v35 = v23;
      v33[8] = CacheStringForBundleID;
      v33[9] = v18;
      v33[4] = v32;
      v33[5] = &v36;
      os_unfair_lock_lock((os_unfair_lock_t)(v32 + 68));
      __96___CFXPreferences_SourceAdditions__withSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke_178((uint64_t)v33, *(CFDictionaryRef *)(v32 + 8));
      os_unfair_lock_unlock((os_unfair_lock_t)(v32 + 68));
      if (CacheKeyForQuintuplet)
        CFRelease(CacheKeyForQuintuplet);
      CFRelease(Copy);
      __96___CFXPreferences_SourceAdditions__withSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke(v42);
      v30 = _CFPrefsArmPendingKVOSlot();
      (*(void (**)(uint64_t, uint64_t))(v31 + 16))(v31, v37[5]);

      if (v30)
        -[_CFXPreferences _deliverPendingKVONotifications]((const os_unfair_lock *)v32);
      _Block_object_dispose(&v36, 8);
    }
  }
}

- (void)_deliverPendingKVONotifications
{
  uint64_t v2;
  const __CFArray *v3;

  if (a1)
  {
    os_unfair_lock_assert_not_owner(a1 + 17);
    os_unfair_lock_assert_not_owner(a1 + 18);
    os_unfair_lock_assert_not_owner(a1 + 19);
    v2 = _CFGetTSD(0x10u);
    if (v2)
    {
      v3 = (const __CFArray *)v2;
      _CFSetTSD(0x10u, 0, 0);
      if (v3 != (const __CFArray *)16)
      {
        _CFPrefsDeliverPendingKVONotificationsGuts(v3);
        CFRelease(v3);
      }
    }
  }
}

- (void)withSearchLists:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    (*(void (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 24));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (void)registerUserDefaultsInstance:(id)a3 configurationURL:(__CFURL *)a4
{
  __CFString *v7;
  const __CFString *v8;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v7 = (__CFString *)objc_msgSend(a3, "_identifier");
  v8 = (const __CFString *)objc_msgSend(a3, "_container");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65___CFXPreferences_registerUserDefaultsInstance_configurationURL___block_invoke;
  v9[3] = &unk_1E1334F28;
  v9[4] = a3;
  -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:]((uint64_t)self, v7, v8, (uint64_t)a4, (uint64_t)v9);
}

- (void)dealloc
{
  __CFDictionary *sources;
  __CFDictionary *namedVolatileSources;
  __CFDictionary *searchLists;
  __CFSet *groupContainersForCurrentUser;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[_CFXPreferences destroyConnections](self);
  sources = self->_sources;
  if (sources)
    CFRelease(sources);
  namedVolatileSources = self->_namedVolatileSources;
  if (namedVolatileSources)
    CFRelease(namedVolatileSources);
  searchLists = self->_searchLists;
  if (searchLists)
    CFRelease(searchLists);
  groupContainersForCurrentUser = self->_groupContainersForCurrentUser;
  if (groupContainersForCurrentUser)
    CFRelease(groupContainersForCurrentUser);
  v7.receiver = self;
  v7.super_class = (Class)_CFXPreferences;
  -[_CFXPreferences dealloc](&v7, sel_dealloc);
}

- (void)destroyConnections
{
  void *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_shmemLock);
    v2 = (void *)a1[4];
    if (v2)
      xpc_release(v2);
    a1[4] = 0;
    v3 = (void *)a1[5];
    if (v3)
      xpc_release(v3);
    a1[5] = 0;
    _daemonShmem = 0;
    _agentShmem = 0;
    v4 = (void *)a1[6];
    if (v4)
      xpc_release(v4);
    a1[6] = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)&_shmemLock);
  }
}

- (uint64_t)euid
{
  if (result)
    return *(unsigned int *)(result + 60);
  return result;
}

- (uint64_t)shmemForRole:(const char *)a3 name:
{
  void *v6;
  uint64_t *v7;
  int v8;
  int v9;
  _QWORD block[6];

  block[5] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (a2 != 3 && !_CFPrefsDirectMode())
  {
    if (a2 == 2)
    {
      if ((shmemForRole_name__cannotAccessDaemonShmem & 1) == 0)
      {
LABEL_12:
        os_unfair_lock_lock((os_unfair_lock_t)&_shmemLock);
        v7 = &_daemonShmem;
        if (a2 != 2)
          v7 = &_agentShmem;
        v6 = (void *)*v7;
        if (*v7)
        {
          os_unfair_lock_unlock((os_unfair_lock_t)&_shmemLock);
          return (uint64_t)v6;
        }
        v8 = shm_open(a3, 0, 0);
        if (v8 == -1)
        {
          v6 = 0;
        }
        else
        {
          v9 = v8;
          v6 = mmap(0, 0x4000uLL, 1, 1, v8, 0);
          close(v9);
          if (v6 == (void *)-1)
          {
            if (a2 == 2)
            {
              v6 = 0;
              shmemForRole_name__cannotAccessDaemonShmem = 1;
LABEL_22:
              _daemonShmem = (uint64_t)v6;
LABEL_25:
              os_unfair_lock_unlock((os_unfair_lock_t)&_shmemLock);
              if (v6)
                return (uint64_t)v6;
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __37___CFXPreferences_shmemForRole_name___block_invoke;
              block[3] = &__block_descriptor_40_e5_v8__0l;
              block[4] = a3;
              if (shmemForRole_name__onceToken == -1)
                return 0;
              dispatch_once(&shmemForRole_name__onceToken, block);
              return 0;
            }
            v6 = 0;
            shmemForRole_name__cannotAccessAgentShmem = 1;
LABEL_24:
            _agentShmem = (uint64_t)v6;
            goto LABEL_25;
          }
        }
        if (a2 == 2)
          goto LABEL_22;
        goto LABEL_24;
      }
    }
    else if ((shmemForRole_name__cannotAccessAgentShmem & 1) == 0)
    {
      goto LABEL_12;
    }
    return 0;
  }
  if (directCFPrefsD_onceToken != -1)
    dispatch_once(&directCFPrefsD_onceToken, &__block_literal_global_193);
  return -[CFPrefsDaemon shmem](directCFPrefsD_daemon);
}

- (BOOL)currentUserHasInvalidHomeDirectory
{
  _BOOL8 v1;
  unsigned __int8 *v2;
  const char *v4;
  char *v5;
  const char *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;

  if (result)
  {
    v1 = result;
    v2 = (unsigned __int8 *)(result + 64);
    if (atomic_load((unsigned __int8 *)(result + 64)))
    {
LABEL_15:
      v14 = atomic_load(v2);
      return v14 == 2;
    }
    v4 = (const char *)_CFUnsandboxedHomeDirectoryForCurrentUser();
    v5 = (char *)v4;
    if (v4)
    {
      if (*v4 && strncmp(v4, "/var/empty", 0xAuLL))
      {
        atomic_store(1u, (unsigned __int8 *)(v1 + 64));
LABEL_14:
        free(v5);
        goto LABEL_15;
      }
      atomic_store(2u, (unsigned __int8 *)(v1 + 64));
      if (*v5)
        v6 = "starts with /var/empty";
      else
        v6 = "is empty";
    }
    else
    {
      atomic_store(2u, (unsigned __int8 *)(v1 + 64));
      v6 = "is null";
    }
    _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
    v7 = _CFPrefsClientLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_CFXPreferences currentUserHasInvalidHomeDirectory].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    _CFSetTSD(0xFu, 0, 0);
    goto LABEL_14;
  }
  return result;
}

- (void)currentUserHasInvalidHomeDirectory
{
  OUTLINED_FUNCTION_1_23(&dword_182A8C000, a2, a3, "All kCFPreferencesCurrentUser domains in this process will be volatile, because homeDirPath %{public}s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0_34();
}

- (void)copyValueForKey:(__CFString *)a3 identifier:(__CFString *)a4 user:(__CFString *)a5 host:(__CFString *)a6 container:(__CFString *)a7
{
  _BOOL4 v12;
  void *v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12 = CFEqual(a6, CFSTR("kCFPreferencesCurrentHost")) != 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66___CFXPreferences_copyValueForKey_identifier_user_host_container___block_invoke;
  v15[3] = &unk_1E1337058;
  v15[4] = &v16;
  v15[5] = a3;
  -[_CFXPreferences with23930198HackSourceForIdentifier:user:byHost:container:cloud:perform:]((const os_unfair_lock *)self, a4, a5, v12, a7, 0, (uint64_t)v15);
  v13 = (void *)v17[3];
  _Block_object_dispose(&v16, 8);
  return v13;
}

- (void)with23930198HackSourceForIdentifier:(const __CFString *)cf2 user:(int)a4 byHost:(const __CFString *)a5 container:(int)a6 cloud:(uint64_t)a7 perform:
{
  CFStringRef Copy;
  CFStringRef v15;
  _BOOL4 v16;
  int v17;
  _QWORD v18[7];

  v18[6] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if ((a6 & 1) != 0 || !eduModeEnabled())
      goto LABEL_18;
    if (appIsInternal_onceToken != -1)
      dispatch_once(&appIsInternal_onceToken, &__block_literal_global_148);
    if (!appIsInternal_isInternal || (__objc2_class **)_CFGetTSD(0xFu) == &__kCFBooleanTrue)
      goto LABEL_18;
    if (CFEqual(cf2, CFSTR("kCFPreferencesCurrentUser")))
    {
      Copy = CFSTR("kCFPreferencesCurrentUser");
    }
    else
    {
      Copy = CFSTR("kCFPreferencesAnyUser");
      if (!CFEqual(cf2, CFSTR("kCFPreferencesAnyUser")))
      {
        v15 = CFCopyUserName();
        v17 = CFEqual(cf2, v15);
        CFRelease(v15);
        if (CFSTR("kCFPreferencesCurrentUser") && v17)
        {
          CFRelease(CFSTR("kCFPreferencesCurrentUser"));
LABEL_19:
          _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
          v16 = _CFPrefsArmPendingKVOSlot();
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __112___CFXPreferences_SearchListAdditions__with23930198HackSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke;
          v18[3] = &unk_1E1335120;
          v18[4] = a1;
          v18[5] = a7;
          normalizeQuintuplet(a2, cf2, a4, a5, 0, (uint64_t)v18);
          _CFSetTSD(0xFu, 0, 0);
          if (v16)
            -[_CFXPreferences _deliverPendingKVONotifications](a1);
          return;
        }
        Copy = CFStringCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, cf2);
      }
    }
    if (Copy)
      CFRelease(Copy);
    if (Copy != CFSTR("kCFPreferencesCurrentUser"))
    {
LABEL_18:
      -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:]((uint64_t)a1, a2, cf2, a4, a5, a6, a7);
      return;
    }
    goto LABEL_19;
  }
}

- (uint64_t)appSynchronizeWithIdentifier:(const __CFString *)a3 container:
{
  uint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58___CFXPreferences_appSynchronizeWithIdentifier_container___block_invoke;
  v5[3] = &unk_1E13370E8;
  v5[4] = &v6;
  -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:](a1, a2, a3, 0, (uint64_t)v5);
  v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)synchronizeEverything
{
  const __CFDictionary *v1;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = 0;
    v4 = &v3;
    v5 = 0x2020000000;
    v6 = 0;
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __40___CFXPreferences_synchronizeEverything__block_invoke;
    v2[3] = &unk_1E1334F78;
    v2[4] = &v3;
    -[_CFXPreferences withSources:](a1, (uint64_t)v2);
    v1 = (const __CFDictionary *)v4[3];
    if (v1)
    {
      CFDictionaryApplyFunction(v1, (CFDictionaryApplierFunction)synchronizeApplier, 0);
      CFRelease((CFTypeRef)v4[3]);
    }
    _Block_object_dispose(&v3, 8);
  }
}

- (void)registerDefaultValues:(__CFDictionary *)a3
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41___CFXPreferences_registerDefaultValues___block_invoke;
  v3[3] = &unk_1E1337110;
  v3[4] = self;
  withKeysAndValues(a3, (uint64_t)v3);
}

- (void)withNamedVolatileSourceForIdentifier:(uint64_t)a3 perform:
{
  const __CFString *CacheStringForBundleID;
  CFStringRef Copy;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3052000000;
    v11 = __Block_byref_object_copy__0;
    v12 = __Block_byref_object_dispose__0;
    v13 = 0;
    CacheStringForBundleID = (const __CFString *)_CFPrefsGetCacheStringForBundleID(a2);
    Copy = CFStringCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, CacheStringForBundleID);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __81___CFXPreferences_SourceAdditions__withNamedVolatileSourceForIdentifier_perform___block_invoke;
    v7[3] = &unk_1E1333130;
    v7[4] = a1;
    v7[5] = &v8;
    v7[6] = Copy;
    v7[7] = CacheStringForBundleID;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 76));
    __81___CFXPreferences_SourceAdditions__withNamedVolatileSourceForIdentifier_perform___block_invoke((uint64_t)v7, *(CFDictionaryRef *)(a1 + 16));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 76));
    LODWORD(CacheStringForBundleID) = _CFPrefsArmPendingKVOSlot();
    (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, v9[5]);

    if ((_DWORD)CacheStringForBundleID)
      -[_CFXPreferences _deliverPendingKVONotifications]((const os_unfair_lock *)a1);
    _Block_object_dispose(&v8, 8);
  }
}

- (void)withSuiteSearchListForIdentifier:(const __CFString *)cf1 user:(int)a4 locked:(uint64_t)a5 perform:
{
  CFStringRef Copy;
  CFStringRef v11;
  int v12;
  _QWORD v13[2];
  void (*v14)(uint64_t, const __CFDictionary *);
  void *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  CFStringRef v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x2020000000;
    v27[3] = a2;
    v21 = 0;
    v22 = &v21;
    v23 = 0x3052000000;
    v24 = __Block_byref_object_copy__2;
    v25 = __Block_byref_object_dispose__2;
    v26 = 0;
    if (CFEqual(cf1, CFSTR("kCFPreferencesCurrentUser")))
    {
      Copy = CFSTR("kCFPreferencesCurrentUser");
    }
    else
    {
      Copy = CFSTR("kCFPreferencesAnyUser");
      if (!CFEqual(cf1, CFSTR("kCFPreferencesAnyUser")))
      {
        v11 = CFCopyUserName();
        v12 = CFEqual(cf1, v11);
        CFRelease(v11);
        if (!CFSTR("kCFPreferencesCurrentUser") || (Copy = CFSTR("kCFPreferencesCurrentUser"), !v12))
          Copy = CFStringCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, cf1);
      }
    }
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v14 = __93___CFXPreferences_SearchListAdditions__withSuiteSearchListForIdentifier_user_locked_perform___block_invoke;
    v15 = &unk_1E13351C0;
    v19 = a2;
    v20 = Copy;
    v17 = v27;
    v18 = &v21;
    v16 = a1;
    if (a4)
    {
      __93___CFXPreferences_SearchListAdditions__withSuiteSearchListForIdentifier_user_locked_perform___block_invoke((uint64_t)v13, *(const __CFDictionary **)(a1 + 24));
    }
    else
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
      v14((uint64_t)v13, *(const __CFDictionary **)(a1 + 24));
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    }
    (*(void (**)(uint64_t, uint64_t))(a5 + 16))(a5, v22[5]);

    CFRelease(Copy);
    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(v27, 8);
  }
}

- (BOOL)appValueIsForcedForKey:(__CFString *)a3 appIdentifier:
{
  uint64_t v6;
  int v7;
  _BOOL8 v8;
  _QWORD v10[6];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56___CFXPreferences_appValueIsForcedForKey_appIdentifier___block_invoke;
  v11[3] = &unk_1E1336E10;
  v11[4] = &v12;
  v11[5] = a2;
  -[_CFXPreferences withManagedSourceForIdentifier:user:perform:](a1, a3, (uint64_t)CFSTR("kCFPreferencesCurrentUser"), (uint64_t)v11);
  v7 = *((unsigned __int8 *)v13 + 24);
  if (!*((_BYTE *)v13 + 24))
  {
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __56___CFXPreferences_appValueIsForcedForKey_appIdentifier___block_invoke_2;
    v10[3] = &unk_1E1336E10;
    v10[4] = &v12;
    v10[5] = a2;
    -[_CFXPreferences withManagedSourceForIdentifier:user:perform:](a1, a3, (uint64_t)CFSTR("kCFPreferencesAnyUser"), (uint64_t)v10);
    v7 = *((unsigned __int8 *)v13 + 24);
  }
  v8 = v7 != 0;
  _Block_object_dispose(&v12, 8);
  return v8;
}

- (void)withManagedSourceForIdentifier:(uint64_t)a3 user:(uint64_t)a4 perform:
{
  __CFString *CacheStringForBundleID;
  uint64_t v8;
  CFStringRef v9;
  _QWORD v10[9];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    CacheStringForBundleID = (__CFString *)_CFPrefsGetCacheStringForBundleID(a2);
    v8 = _CFPrefsGetCacheStringForBundleID(CacheStringForBundleID);
    v9 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("managed/%@/%@"), v8, a3);
    v11 = 0;
    v12 = &v11;
    v13 = 0x3052000000;
    v14 = __Block_byref_object_copy__7;
    v15 = __Block_byref_object_dispose__7;
    v16 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __85___CFXPreferences_PlistSourceAdditions__withManagedSourceForIdentifier_user_perform___block_invoke;
    v10[3] = &unk_1E13379A8;
    v10[6] = v9;
    v10[7] = CacheStringForBundleID;
    v10[8] = a3;
    v10[4] = a1;
    v10[5] = &v11;
    -[_CFXPreferences withSources:]((uint64_t)a1, (uint64_t)v10);
    LODWORD(a3) = _CFPrefsArmPendingKVOSlot();
    (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a4, v12[5]);

    if ((_DWORD)a3)
      -[_CFXPreferences _deliverPendingKVONotifications](a1);
    _Block_object_dispose(&v11, 8);
  }
}

- (void)withSources:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 68));
    (*(void (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 8));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 68));
  }
}

- (void)setValue:(void *)a3 forKey:(__CFString *)a4 appIdentifier:(__CFString *)a5 container:(__CFString *)a6 configurationURL:(__CFURL *)a7
{
  _QWORD v7[7];

  v7[6] = *MEMORY[0x1E0C80C00];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76___CFXPreferences_setValue_forKey_appIdentifier_container_configurationURL___block_invoke;
  v7[3] = &__block_descriptor_48_e33_v16__0__CFPrefsSearchListSource_8l;
  v7[4] = a3;
  v7[5] = a4;
  -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:]((uint64_t)self, a5, a6, (uint64_t)a7, (uint64_t)v7);
}

- (void)flushCachesForAppIdentifier:(const void *)a3 user:
{
  uint64_t CacheStringForBundleID;
  int v6;
  _QWORD v7[6];
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    CacheStringForBundleID = _CFPrefsGetCacheStringForBundleID(a2);
    v6 = 1;
    if (xpc_user_sessions_enabled())
    {
      if (CFEqual(a3, CFSTR("kCFPreferencesAnyUser")))
        v6 = 2;
      else
        v6 = 1;
      if (!xpc_user_sessions_get_session_uid())
      {
        if (CFEqual(a3, CFSTR("kCFPreferencesCurrentUser")))
          v6 = 2;
      }
    }
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __52___CFXPreferences_flushCachesForAppIdentifier_user___block_invoke;
    v7[3] = &unk_1E1336EB8;
    v8 = v6;
    v7[4] = a1;
    v7[5] = CacheStringForBundleID;
    -[_CFXPreferences withConnectionForRole:andUserIdentifier:performBlock:](a1, v6, a3, (uint64_t)v7);
  }
}

- (void)withConnectionForRole:(const void *)a3 andUserIdentifier:(uint64_t)a4 performBlock:
{
  _xpc_connection_s *v5;

  if (a1)
  {
    v5 = -[_CFXPreferences _copyDaemonConnectionSettingUpIfNecessaryForRole:andUserIdentifier:](a1, a2, a3);
    (*(void (**)(uint64_t, _xpc_connection_s *))(a4 + 16))(a4, v5);
    if (v5)
      xpc_release(v5);
  }
}

- (_xpc_connection_s)_copyDaemonConnectionSettingUpIfNecessaryForRole:(const void *)a3 andUserIdentifier:
{
  BOOL v6;
  uint64_t v7;
  _xpc_connection_s **v8;
  _xpc_connection_s *v9;
  void *v10;
  int v11;
  const char *v12;
  const char *v13;
  _xpc_connection_s *v14;
  _xpc_endpoint_s *v15;
  const char *v16;
  int v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;

  if (!a1)
    return 0;
  os_unfair_lock_lock((os_unfair_lock_t)&_CFPrefsDaemonLock);
  v6 = _CFPrefsDirectMode();
  if (a2 != 3 && !v6)
  {
    v7 = 5;
    if (a2 == 2)
      v7 = 4;
    v8 = &a1[v7];
    v9 = a1[v7];
    if (v9)
      goto LABEL_25;
    if (a2 == 1 && xpc_user_sessions_enabled() && !xpc_user_sessions_get_session_uid())
    {
      if (!a3 || (v18 = _CFPreferencesUIDForUsername(a3), v18 == -101))
      {
        v19 = _CFPrefsClientLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[_CFXPreferences _copyDaemonConnectionSettingUpIfNecessaryForRole:andUserIdentifier:].cold.1((uint64_t)a3, v19, v20, v21, v22, v23, v24, v25);
        v9 = 0;
        goto LABEL_26;
      }
      v11 = v18;
      if (xpc_user_sessions_get_foreground_uid() != v18)
      {
        v26 = _CFPrefsClientLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          -[_CFXPreferences _copyDaemonConnectionSettingUpIfNecessaryForRole:andUserIdentifier:].cold.2((uint64_t)a3, v11, v26);
      }
      v10 = &__block_literal_global_90;
    }
    else
    {
      v10 = 0;
      v11 = -101;
    }
    if (__CFProcessIsRestricted() || !getenv("__CFPreferencesTestDaemon"))
    {
      v12 = "com.apple.cfprefsd.daemon";
      v13 = "com.apple.cfprefsd.daemon.system";
    }
    else
    {
      v12 = "com.apple.cfprefsd.daemon.test";
      v13 = "com.apple.cfprefsd.daemon.system.test";
    }
    if (a2 == 2)
      v16 = v13;
    else
      v16 = v12;
    *v8 = xpc_connection_create_mach_service(v16, 0, 0);
    if (v11 != -101)
      xpc_connection_set_target_user_session_uid();
    goto LABEL_24;
  }
  v8 = a1 + 6;
  v9 = a1[6];
  if (!v9)
  {
    if (directCFPrefsD_onceToken != -1)
      dispatch_once(&directCFPrefsD_onceToken, &__block_literal_global_193);
    v14 = (_xpc_connection_s *)-[CFPrefsDaemon listener](directCFPrefsD_daemon);
    v15 = xpc_endpoint_create(v14);
    *v8 = xpc_connection_create_from_endpoint(v15);
    xpc_release(v15);
    v10 = 0;
LABEL_24:
    -[_CFXPreferences _setupNewDaemonConnection:invalidationHandler:](a1, *v8, (uint64_t)v10);
    v9 = *v8;
  }
LABEL_25:
  xpc_retain(v9);
LABEL_26:
  os_unfair_lock_unlock((os_unfair_lock_t)&_CFPrefsDaemonLock);
  return v9;
}

- (void)_setupNewDaemonConnection:(uint64_t)a3 invalidationHandler:
{
  _QWORD v5[5];
  id v6;
  id location[2];

  location[1] = *(id *)MEMORY[0x1E0C80C00];
  if (val)
  {
    objc_initWeak(location, val);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __65___CFXPreferences__setupNewDaemonConnection_invalidationHandler___block_invoke;
    v5[3] = &unk_1E1337310;
    objc_copyWeak(&v6, location);
    v5[4] = a3;
    xpc_connection_set_event_handler(a2, v5);
    xpc_connection_activate(a2);
    objc_destroyWeak(&v6);
    objc_destroyWeak(location);
  }
}

- (void)updateSearchListsForIdentifier:(uint64_t)a1
{
  CFDictionaryRef Copy;
  const __CFDictionary *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x2020000000;
    v9 = 0;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    Copy = CFDictionaryCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, *(CFDictionaryRef *)(a1 + 24));
    v7[3] = (uint64_t)Copy;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    v5 = (const __CFDictionary *)v7[3];
    if (v5)
    {
      CFDictionaryApplyFunction(v5, (CFDictionaryApplierFunction)notifySearchListOfRemoteChangesCallback, a2);
      CFRelease((CFTypeRef)v7[3]);
    }
    _Block_object_dispose(&v6, 8);
  }
}

- (CFMutableDictionaryRef)copyDictionaryForApp:(const __CFString *)a3 withContainer:
{
  const __CFDictionary *v3;
  CFMutableDictionaryRef MutableCopy;
  CFMutableDictionaryRef v5;
  const void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54___CFXPreferences_copyDictionaryForApp_withContainer___block_invoke;
  v8[3] = &unk_1E13370E8;
  v8[4] = &v9;
  -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:](a1, a2, a3, 0, (uint64_t)v8);
  v3 = (const __CFDictionary *)v10[3];
  if (v3)
    MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, v3);
  else
    MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v5 = MutableCopy;
  v6 = (const void *)v10[3];
  if (v6)
    CFRelease(v6);
  _Block_object_dispose(&v9, 8);
  return v5;
}

- (void)replaceSearchList:(uint64_t)a3 withSearchList:
{
  CFMutableArrayRef Mutable;
  _QWORD v7[9];

  v7[8] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    Mutable = CFArrayCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeArrayCallBacks);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __73___CFXPreferences_SearchListAdditions__replaceSearchList_withSearchList___block_invoke;
    v7[3] = &unk_1E13351E8;
    v7[4] = a2;
    v7[5] = a3;
    v7[6] = a1;
    v7[7] = Mutable;
    __73___CFXPreferences_SearchListAdditions__replaceSearchList_withSearchList___block_invoke((uint64_t)v7, *(CFDictionaryRef *)(a1 + 24));
  }
}

- (CFMutableDictionaryRef)copyDictionaryForSourceWithIdentifier:(uint64_t)a1
{
  const __CFDictionary *v2;
  CFMutableDictionaryRef MutableCopy;
  const void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57___CFXPreferences_copyDictionaryForSourceWithIdentifier___block_invoke;
  v6[3] = &unk_1E1336E70;
  v6[4] = &v7;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](a1, a2, CFSTR("kCFPreferencesCurrentUser"), 0, 0, 0, (uint64_t)v6);
  v2 = (const __CFDictionary *)v8[3];
  if (v2)
  {
    MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, v2);
    v4 = (const void *)v8[3];
    if (v4)
      CFRelease(v4);
  }
  else
  {
    MutableCopy = 0;
  }
  _Block_object_dispose(&v7, 8);
  return MutableCopy;
}

- (void)setValue:(uint64_t)a3 forKey:(__CFString *)a4 identifier:(const __CFString *)a5 user:(CFTypeRef)cf1 host:(const __CFString *)a7 container:
{
  _BOOL4 v13;
  _QWORD v14[7];

  v14[6] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v13 = CFEqual(cf1, CFSTR("kCFPreferencesCurrentHost")) != 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __66___CFXPreferences_setValue_forKey_identifier_user_host_container___block_invoke;
    v14[3] = &__block_descriptor_48_e23_v16__0__CFPrefsSource_8l;
    v14[4] = a2;
    v14[5] = a3;
    -[_CFXPreferences with23930198HackSourceForIdentifier:user:byHost:container:cloud:perform:](a1, a4, a5, v13, a7, 0, (uint64_t)v14);
  }
}

- (_CFXPreferences)init
{
  _CFXPreferences *v2;
  void *v3;
  void *v4;
  size_t count;
  size_t v7;
  size_t v8;
  const char *string;
  CFStringRef v10;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)_CFXPreferences;
  v2 = -[_CFXPreferences init](&v11, sel_init);
  if (v2)
  {
    v2->_sources = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v2->_sourcesLock._os_unfair_lock_opaque = 0;
    v2->_namedVolatileSources = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v2->_namedVolatileSourcesLock._os_unfair_lock_opaque = 0;
    v2->_searchLists = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v2->_searchListsLock._os_unfair_lock_opaque = 0;
    v2->_launchdUID = -1;
    v2->_euid = _CFGetEUID();
    v3 = (void *)xpc_copy_entitlement_for_self();
    v4 = v3;
    if (v3 && object_getClass(v3) == (Class)MEMORY[0x1E0C812C8] && (count = xpc_array_get_count(v4)) != 0)
    {
      v7 = count;
      v8 = 0;
      v2->_groupContainersForCurrentUser = CFSetCreateMutable(0, 0, &kCFTypeSetCallBacks);
      do
      {
        string = xpc_array_get_string(v4, v8);
        v10 = CFStringCreateWithCString(0, string, 0x8000100u);
        CFSetAddValue(v2->_groupContainersForCurrentUser, v10);
        CFRelease(v10);
        ++v8;
      }
      while (v7 != v8);
    }
    else
    {
      v2->_groupContainersForCurrentUser = 0;
    }
    if (v4)
      xpc_release(v4);
  }
  return v2;
}

- (uint64_t)synchronizeIdentifier:(const __CFString *)a3 user:(CFTypeRef)cf1 host:(const __CFString *)a5 container:
{
  _BOOL4 v9;
  uint64_t v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 1;
  v9 = CFEqual(cf1, CFSTR("kCFPreferencesCurrentHost")) != 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61___CFXPreferences_synchronizeIdentifier_user_host_container___block_invoke;
  v12[3] = &unk_1E1336E70;
  v12[4] = &v13;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](a1, a2, a3, v9, a5, 0, (uint64_t)v12);
  v10 = *((unsigned __int8 *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return v10;
}

- (CFMutableDictionaryRef)copyValuesForKeys:(__CFString *)a3 identifier:(const __CFString *)a4 user:(CFTypeRef)cf1 host:(const __CFString *)a6 container:
{
  _BOOL4 v11;
  CFMutableDictionaryRef Mutable;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11 = CFEqual(cf1, CFSTR("kCFPreferencesCurrentHost")) != 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68___CFXPreferences_copyValuesForKeys_identifier_user_host_container___block_invoke;
  v14[3] = &unk_1E1337058;
  v14[4] = &v15;
  v14[5] = a2;
  -[_CFXPreferences with23930198HackSourceForIdentifier:user:byHost:container:cloud:perform:](a1, a3, a4, v11, a6, 0, (uint64_t)v14);
  Mutable = (CFMutableDictionaryRef)v16[3];
  if (!Mutable)
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  _Block_object_dispose(&v15, 8);
  return Mutable;
}

- (void)ingestVolatileStateFromPreferences:(uint64_t)a1
{
  _QWORD v2[7];

  v2[6] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (a2 == a1)
      -[_CFXPreferences ingestVolatileStateFromPreferences:].cold.1();
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __54___CFXPreferences_ingestVolatileStateFromPreferences___block_invoke;
    v2[3] = &unk_1E1337188;
    v2[4] = a2;
    v2[5] = a1;
    -[_CFXPreferences withNamedVolatileSources:](a1, (uint64_t)v2);
  }
}

- (void)withNamedVolatileSources:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 76));
    (*(void (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 16));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 76));
  }
}

- (uint64_t)copyKeyListForIdentifier:(const __CFString *)a3 user:(CFTypeRef)cf1 host:(const __CFString *)a5 container:
{
  _BOOL4 v9;
  const __CFArray *v10;
  CFIndex Count;
  uint64_t v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v9 = CFEqual(cf1, CFSTR("kCFPreferencesCurrentHost")) != 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64___CFXPreferences_copyKeyListForIdentifier_user_host_container___block_invoke;
  v14[3] = &unk_1E1336E70;
  v14[4] = &v15;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](a1, a2, a3, v9, a5, 0, (uint64_t)v14);
  v10 = (const __CFArray *)v16[3];
  if (v10)
  {
    Count = CFArrayGetCount(v10);
    v12 = v16[3];
    if (!Count)
    {
      CFRelease((CFTypeRef)v16[3]);
      v12 = 0;
      v16[3] = 0;
    }
  }
  else
  {
    v12 = 0;
  }
  _Block_object_dispose(&v15, 8);
  return v12;
}

- (void)resetPreferences:(BOOL)a3
{
  const void *v3;
  _QWORD v4[6];
  BOOL v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36___CFXPreferences_resetPreferences___block_invoke;
  v4[3] = &unk_1E1337228;
  v5 = a3;
  v4[4] = self;
  v4[5] = &v6;
  -[_CFXPreferences withSearchLists:]((uint64_t)self, (uint64_t)v4);
  v3 = (const void *)v7[3];
  if (v3)
    CFRelease(v3);
  _Block_object_dispose(&v6, 8);
}

- (void)setBackupDisabled:(__CFString *)cf1 identifier:(const __CFString *)a4 user:(const void *)a5 host:(const __CFString *)a6 container:
{
  _BOOL4 v12;
  _QWORD v13[4];
  char v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (CFEqual(cf1, CFSTR("kCFPreferencesAnyApplication")))
      -[_CFXPreferences setBackupDisabled:identifier:user:host:container:].cold.1();
    v12 = CFEqual(a5, CFSTR("kCFPreferencesCurrentHost")) != 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __68___CFXPreferences_setBackupDisabled_identifier_user_host_container___block_invoke;
    v13[3] = &__block_descriptor_33_e23_v16__0__CFPrefsSource_8l;
    v14 = a2;
    -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](a1, cf1, a4, v12, a6, 0, (uint64_t)v13);
  }
}

- (void)addSuitePreferences:(CFTypeRef)cf1 toAppIdentifier:(uint64_t)a4 container:
{
  _BOOL4 v8;
  _QWORD v9[8];
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  if (a1 && !CFEqual(cf1, a2))
  {
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v11[3] = a2;
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    v10[3] = a4;
    v8 = _CFPrefsArmPendingKVOSlot();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke;
    v9[3] = &unk_1E1336F58;
    v9[4] = a1;
    v9[5] = v11;
    v9[6] = v10;
    v9[7] = cf1;
    -[_CFXPreferences withSearchLists:]((uint64_t)a1, (uint64_t)v9);
    if (v8)
      -[_CFXPreferences _deliverPendingKVONotifications](a1);
    _Block_object_dispose(v10, 8);
    _Block_object_dispose(v11, 8);
  }
}

- (void)removeSuite:(uint64_t)a3 fromApp:(uint64_t)a4 withContainer:
{
  _BOOL4 v8;
  _QWORD v9[9];

  v9[8] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v8 = _CFPrefsArmPendingKVOSlot();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke;
    v9[3] = &unk_1E13373A8;
    v9[4] = a1;
    v9[5] = a3;
    v9[6] = a2;
    v9[7] = a4;
    -[_CFXPreferences withSearchLists:]((uint64_t)a1, (uint64_t)v9);
    if (v8)
      -[_CFXPreferences _deliverPendingKVONotifications](a1);
  }
}

- (uint64_t)alreadylocked_withSources:(uint64_t)result
{
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(result + 8));
  return result;
}

- (uint64_t)alreadylocked_withNamedVolatileSources:(uint64_t)result
{
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(result + 16));
  return result;
}

- (void)assertEquivalence:(BOOL)a3 ofIdentifiers:(__CFArray *)a4 users:(__CFArray *)a5 hosts:(__CFArray *)a6 containers:(__CFArray *)a7 managedFlags:(__CFArray *)a8 cloudFlags:(__CFArray *)a9
{
  CFIndex Count;
  CFIndex v11;
  CFIndex v12;
  CFIndex v13;
  CFIndex v14;
  CFIndex v15;
  CFIndex v16;
  uint64_t v17;
  __objc2_class **ValueAtIndex;
  const __CFString *v19;
  __objc2_class **v20;
  __objc2_class **v21;
  __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[5];
  BOOL v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v35 = 0;
  v36 = &v35;
  v37 = 0x3052000000;
  v38 = __Block_byref_object_copy__0;
  v39 = __Block_byref_object_dispose__0;
  v40 = 0;
  Count = CFArrayGetCount(a4);
  if (Count != CFArrayGetCount(a7)
    || (v11 = CFArrayGetCount(a4), v11 != CFArrayGetCount(a5))
    || (v12 = CFArrayGetCount(a4), v12 != CFArrayGetCount(a6))
    || (v13 = CFArrayGetCount(a4), v13 != CFArrayGetCount(a7))
    || (v14 = CFArrayGetCount(a4), v14 != CFArrayGetCount(a8))
    || (v15 = CFArrayGetCount(a4), v15 != CFArrayGetCount(a9)))
  {
    __assert_rtn("-[_CFXPreferences(SourceAdditions) assertEquivalence:ofIdentifiers:users:hosts:containers:managedFlags:cloudFlags:]", "CFPrefsSource.m", 1252, "CFArrayGetCount(identifiers) == CFArrayGetCount(containers) && CFArrayGetCount(identifiers) == CFArrayGetCount(users) && CFArrayGetCount(identifiers) == CFArrayGetCount(hosts) && CFArrayGetCount(identifiers) == CFArrayGetCount(containers) && CFArrayGetCount(identifiers) == CFArrayGetCount(managedFlags) && CFArrayGetCount(identifiers) == CFArrayGetCount(isCloudFlags)");
  }
  v16 = 0;
  v17 = MEMORY[0x1E0C809B0];
  while (v16 < CFArrayGetCount(a4))
  {
    ValueAtIndex = (__objc2_class **)CFArrayGetValueAtIndex(a7, v16);
    v19 = (const __CFString *)CFArrayGetValueAtIndex(a6, v16);
    v20 = (__objc2_class **)CFArrayGetValueAtIndex(a9, v16);
    v21 = (__objc2_class **)CFArrayGetValueAtIndex(a8, v16);
    v22 = (__CFString *)CFArrayGetValueAtIndex(a4, v16);
    v23 = (const __CFString *)CFArrayGetValueAtIndex(a5, v16);
    if (v21 == &__kCFBooleanTrue && v20 == &__kCFBooleanTrue)
      __assert_rtn("-[_CFXPreferences(SourceAdditions) assertEquivalence:ofIdentifiers:users:hosts:containers:managedFlags:cloudFlags:]", "CFPrefsSource.m", 1260, "!(managed && cloud)");
    v33[0] = v17;
    v33[1] = 3221225472;
    v33[2] = __115___CFXPreferences_SourceAdditions__assertEquivalence_ofIdentifiers_users_hosts_containers_managedFlags_cloudFlags___block_invoke;
    v33[3] = &unk_1E1333158;
    v33[4] = &v35;
    v34 = a3;
    if (v21 == &__kCFBooleanTrue)
    {
      v32[0] = v17;
      v32[1] = 3221225472;
      v32[2] = __115___CFXPreferences_SourceAdditions__assertEquivalence_ofIdentifiers_users_hosts_containers_managedFlags_cloudFlags___block_invoke_2;
      v32[3] = &unk_1E1333180;
      v32[4] = v33;
      -[_CFXPreferences withManagedSourceForIdentifier:user:perform:]((const os_unfair_lock *)self, v22, (uint64_t)v23, (uint64_t)v32);
    }
    else
    {
      v31[0] = v17;
      v31[1] = 3221225472;
      if (ValueAtIndex == &__kCFNull)
        v24 = 0;
      else
        v24 = (const __CFString *)ValueAtIndex;
      v31[2] = __115___CFXPreferences_SourceAdditions__assertEquivalence_ofIdentifiers_users_hosts_containers_managedFlags_cloudFlags___block_invoke_3;
      v31[3] = &unk_1E13331A8;
      v31[4] = v33;
      -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:]((uint64_t)self, v22, v23, v19 == CFSTR("kCFPreferencesCurrentHost"), v24, v20 == &__kCFBooleanTrue, (uint64_t)v31);
    }
    ++v16;
  }

  _Block_object_dispose(&v35, 8);
}

- (CFMutableStringRef)copyDescriptionOfSearchLists
{
  CFMutableStringRef Mutable;

  if (!a1)
    return 0;
  Mutable = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  CFDictionaryApplyFunction(*(CFDictionaryRef *)(a1 + 24), (CFDictionaryApplierFunction)copyDescriptionApplier, Mutable);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  return Mutable;
}

- (void)assertEquivalence:(BOOL)a3 ofIdentifiers:(__CFArray *)a4 containers:(__CFArray *)a5 cloudConfigurationURLs:(__CFArray *)a6
{
  CFIndex Count;
  CFIndex v12;
  CFIndex i;
  __objc2_class **ValueAtIndex;
  __objc2_class **v15;
  __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  _QWORD v19[5];
  BOOL v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v22 = &v21;
  v23 = 0x3052000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  v26 = 0;
  Count = CFArrayGetCount(a4);
  if (Count != CFArrayGetCount(a5) || (v12 = CFArrayGetCount(a4), v12 != CFArrayGetCount(a6)))
    __assert_rtn("-[_CFXPreferences(SearchListAdditions) assertEquivalence:ofIdentifiers:containers:cloudConfigurationURLs:]", "CFPrefsSearchListSource.m", 1770, "CFArrayGetCount(identifiers) == CFArrayGetCount(containers) && CFArrayGetCount(identifiers) == CFArrayGetCount(cloudURLs)");
  for (i = 0; i < CFArrayGetCount(a4); ++i)
  {
    ValueAtIndex = (__objc2_class **)CFArrayGetValueAtIndex(a5, i);
    v15 = (__objc2_class **)CFArrayGetValueAtIndex(a6, i);
    v16 = (__CFString *)CFArrayGetValueAtIndex(a4, i);
    v19[0] = MEMORY[0x1E0C809B0];
    if (ValueAtIndex == &__kCFNull)
      v17 = 0;
    else
      v17 = (const __CFString *)ValueAtIndex;
    v19[1] = 3221225472;
    if (v15 == &__kCFNull)
      v18 = 0;
    else
      v18 = (uint64_t)v15;
    v19[2] = __106___CFXPreferences_SearchListAdditions__assertEquivalence_ofIdentifiers_containers_cloudConfigurationURLs___block_invoke;
    v19[3] = &unk_1E1335198;
    v19[4] = &v21;
    v20 = a3;
    -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:]((uint64_t)self, v16, v17, v18, (uint64_t)v19);
  }

  _Block_object_dispose(&v21, 8);
}

- (uint64_t)alreadylocked_withSearchLists:(uint64_t)result
{
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(result + 24));
  return result;
}

+ (id)copyDefaultPreferences
{
  if ((_CFPrefsCurrentProcessIsCFPrefsD() & 1) != 0)
    return 0;
  if (_CFPrefsCopyDefaultPreferences_onceToken != -1)
    dispatch_once(&_CFPrefsCopyDefaultPreferences_onceToken, &__block_literal_global_188);
  return (id)objc_msgSend((id)_CFPrefsCopyDefaultPreferences_defaultPrefs, "copyPrefs");
}

- (void)unregisterUserDefaultsInstance:(id)a3
{
  __CFString *v5;
  const __CFString *v6;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)objc_msgSend(a3, "_identifier");
  v6 = (const __CFString *)objc_msgSend(a3, "_container");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50___CFXPreferences_unregisterUserDefaultsInstance___block_invoke;
  v7[3] = &unk_1E1334F28;
  v7[4] = a3;
  -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:]((uint64_t)self, v5, v6, 0, (uint64_t)v7);
}

- (void)flushManagedSources
{
  _QWORD v2[6];

  v2[5] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __38___CFXPreferences_flushManagedSources__block_invoke;
    v2[3] = &unk_1E1336668;
    v2[4] = a1;
    if (xpc_user_sessions_enabled())
      -[_CFXPreferences withConnectionForRole:andUserIdentifier:performBlock:](a1, 2, 0, (uint64_t)v2);
    -[_CFXPreferences withConnectionForRole:andUserIdentifier:performBlock:](a1, 1, 0, (uint64_t)v2);
    _CFPrefsResetManagedPreferencesStateCache();
  }
}

- (BOOL)hasCloudValueForKey:(__CFString *)a3 appIdentifier:(const __CFString *)a4 container:(uint64_t)a5 configurationURL:
{
  _BOOL8 v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80___CFXPreferences_hasCloudValueForKey_appIdentifier_container_configurationURL___block_invoke;
  v7[3] = &unk_1E1336E40;
  v7[4] = &v8;
  v7[5] = a2;
  -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:](a1, a3, a4, a5, (uint64_t)v7);
  v5 = *((_BYTE *)v9 + 24) != 0;
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (BOOL)hasNonRegisteredValueForKey:(__CFString *)a3 appIdentifier:(const __CFString *)a4 container:(uint64_t)a5 configurationURL:
{
  _BOOL8 v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __88___CFXPreferences_hasNonRegisteredValueForKey_appIdentifier_container_configurationURL___block_invoke;
  v7[3] = &unk_1E1336E40;
  v7[4] = &v8;
  v7[5] = a2;
  -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:](a1, a3, a4, a5, (uint64_t)v7);
  v5 = *((_BYTE *)v9 + 24) != 0;
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)setDaemonCacheEnabled:(BOOL)a3 identifier:(__CFString *)a4 user:(__CFString *)a5 host:(__CFString *)a6 container:(__CFString *)a7
{
  _BOOL4 v12;
  _QWORD v13[4];
  BOOL v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v12 = CFEqual(a6, CFSTR("kCFPreferencesCurrentHost")) != 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72___CFXPreferences_setDaemonCacheEnabled_identifier_user_host_container___block_invoke;
  v13[3] = &__block_descriptor_33_e23_v16__0__CFPrefsSource_8l;
  v14 = a3;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:]((uint64_t)self, a4, a5, v12, a7, 0, (uint64_t)v13);
}

- (void)simulateTimerSynchronizeForTestingForUser:(__CFString *)a3
{
  int v5;
  _QWORD v6[5];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = 1;
  if (xpc_user_sessions_enabled())
  {
    if (CFEqual(CFSTR("kCFPreferencesAnyUser"), a3))
      v5 = 2;
    else
      v5 = 1;
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61___CFXPreferences_simulateTimerSynchronizeForTestingForUser___block_invoke;
  v6[3] = &unk_1E1336EE0;
  v7 = v5;
  v6[4] = self;
  -[_CFXPreferences withConnectionForRole:andUserIdentifier:performBlock:](&self->super.isa, v5, a3, (uint64_t)v6);
}

- (void)setFileProtectionClass:(__CFString *)cf1 identifier:(const __CFString *)a4 user:(const void *)a5 host:(const __CFString *)a6 container:
{
  _BOOL4 v12;
  _QWORD v13[4];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (CFEqual(cf1, CFSTR("kCFPreferencesAnyApplication")))
      -[_CFXPreferences setFileProtectionClass:identifier:user:host:container:].cold.1();
    v12 = CFEqual(a5, CFSTR("kCFPreferencesCurrentHost")) != 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __73___CFXPreferences_setFileProtectionClass_identifier_user_host_container___block_invoke;
    v13[3] = &__block_descriptor_36_e23_v16__0__CFPrefsSource_8l;
    v14 = a2;
    -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](a1, cf1, a4, v12, a6, 0, (uint64_t)v13);
  }
}

- (uint64_t)fileProtectionClassForIdentifier:(const __CFString *)a3 user:(CFTypeRef)cf1 host:(const __CFString *)a5 container:
{
  _BOOL4 v9;
  uint64_t v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = -1;
  v9 = CFEqual(cf1, CFSTR("kCFPreferencesCurrentHost")) != 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72___CFXPreferences_fileProtectionClassForIdentifier_user_host_container___block_invoke;
  v12[3] = &unk_1E1336E70;
  v12[4] = &v13;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](a1, a2, a3, v9, a5, 0, (uint64_t)v12);
  v10 = *((unsigned int *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  return v10;
}

- (void)setAccessRestricted:(__CFString *)cf1 forAppIdentifier:
{
  _QWORD v6[4];
  char v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (CFEqual(cf1, CFSTR("kCFPreferencesAnyApplication")))
      -[_CFXPreferences setAccessRestricted:forAppIdentifier:].cold.1();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __56___CFXPreferences_setAccessRestricted_forAppIdentifier___block_invoke;
    v6[3] = &__block_descriptor_33_e23_v16__0__CFPrefsSource_8l;
    v7 = a2;
    -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](a1, cf1, CFSTR("kCFPreferencesAnyUser"), 1, 0, 0, (uint64_t)v6);
  }
}

- (void)fullCloudSynchronizeForAppIdentifier:(const __CFString *)a3 container:(uint64_t)a4 configurationURL:(uint64_t)a5 completionHandler:
{
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __101___CFXPreferences_fullCloudSynchronizeForAppIdentifier_container_configurationURL_completionHandler___block_invoke;
    v5[3] = &unk_1E1336F80;
    v5[4] = a5;
    -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:](a1, a2, a3, a4, (uint64_t)v5);
  }
}

- (void)setCloudSyncEnabled:(uint64_t)a3 forKey:(__CFString *)a4 appIdentifier:(const __CFString *)a5 container:
{
  _QWORD v5[5];
  char v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __70___CFXPreferences_setCloudSyncEnabled_forKey_appIdentifier_container___block_invoke;
    v5[3] = &__block_descriptor_41_e33_v16__0__CFPrefsSearchListSource_8l;
    v6 = a2;
    v5[4] = a3;
    -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:](a1, a4, a5, 0, (uint64_t)v5);
  }
}

- (void)setValuesForKeys:(uint64_t)a3 removingValuesForKeys:(__CFString *)a4 identifier:(const __CFString *)a5 user:(CFTypeRef)cf1 host:(const __CFString *)a7 container:
{
  _BOOL4 v13;
  _QWORD v14[7];

  v14[6] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v13 = CFEqual(cf1, CFSTR("kCFPreferencesCurrentHost")) != 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __89___CFXPreferences_setValuesForKeys_removingValuesForKeys_identifier_user_host_container___block_invoke;
    v14[3] = &__block_descriptor_48_e23_v16__0__CFPrefsSource_8l;
    v14[4] = a2;
    v14[5] = a3;
    -[_CFXPreferences with23930198HackSourceForIdentifier:user:byHost:container:cloud:perform:](a1, a4, a5, v13, a7, 0, (uint64_t)v14);
  }
}

- (CFMutableDictionaryRef)copyManagedValuesForKeys:(__CFString *)a3 identifier:(int)a4 useSystemContainer:
{
  const __CFString *v7;
  const __CFURL *v8;
  const __CFURL *v9;
  CFMutableDictionaryRef Mutable;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v7 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  if (a4)
  {
    v8 = _CFPreferencesCopyManagedPreferencesContainerURL();
    v9 = v8;
    if (v8)
    {
      v7 = CFURLCopyFileSystemPath(v8, kCFURLPOSIXPathStyle);
      CFRelease(v9);
    }
    else
    {
      v7 = 0;
    }
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74___CFXPreferences_copyManagedValuesForKeys_identifier_useSystemContainer___block_invoke;
  v12[3] = &unk_1E1336E40;
  v12[4] = &v13;
  v12[5] = a2;
  -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:](a1, a3, v7, 0, (uint64_t)v12);
  Mutable = (CFMutableDictionaryRef)v14[3];
  if (!Mutable)
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  _Block_object_dispose(&v13, 8);
  return Mutable;
}

- (uint64_t)preloadAppValuesForIdentifiers:(uint64_t)a3 containers:(uint64_t)a4 configurationURLs:(uint64_t)a5 count:
{
  if (result)
    return +[CFPrefsSearchListSource preloadDomainsForIdentifiers:containers:cloudConfigurationURLs:count:containingPreferences:](CFPrefsSearchListSource, a2, a3, a4, a5, result);
  return result;
}

- (void)replaceValuesInSourceForIdentifier:(uint64_t)a3 user:(uint64_t)a4 host:(uint64_t)a5 container:(const __CFDictionary *)a6 withValues:
{
  _QWORD v6[10];

  v6[9] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __85___CFXPreferences_replaceValuesInSourceForIdentifier_user_host_container_withValues___block_invoke;
    v6[3] = &unk_1E13370A0;
    v6[4] = a1;
    v6[5] = a2;
    v6[6] = a3;
    v6[7] = a4;
    v6[8] = a5;
    withKeysAndValues(a6, (uint64_t)v6);
  }
}

- (void)removeVolatileSourceForName:(uint64_t)a1
{
  uint64_t CacheStringForBundleID;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  if (a1 && !CFEqual(cf1, CFSTR("NSArgumentDomain")) && !CFEqual(cf1, CFSTR("NSRegistrationDomain")))
  {
    CacheStringForBundleID = _CFPrefsGetCacheStringForBundleID(cf1);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __47___CFXPreferences_removeVolatileSourceForName___block_invoke;
    v5[3] = &__block_descriptor_40_e25_v16__0____CFDictionary__8l;
    v5[4] = CacheStringForBundleID;
    -[_CFXPreferences withNamedVolatileSources:](a1, (uint64_t)v5);
  }
}

- (uint64_t)copyDictionaryForVolatileSourceWithName:(uint64_t)a1
{
  uint64_t v2;
  const __CFDictionary *v4;
  CFMutableDictionaryRef MutableCopy;
  const void *v6;
  uint64_t CacheStringForBundleID;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = a1;
  v15 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    if (CFEqual(cf1, CFSTR("NSArgumentDomain")) || CFEqual(cf1, CFSTR("NSRegistrationDomain")))
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __59___CFXPreferences_copyDictionaryForVolatileSourceWithName___block_invoke;
      v10[3] = &unk_1E1336E70;
      v10[4] = &v11;
      -[_CFXPreferences withNamedVolatileSourceForIdentifier:perform:](v2, cf1, (uint64_t)v10);
    }
    else
    {
      CacheStringForBundleID = _CFPrefsGetCacheStringForBundleID(cf1);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __59___CFXPreferences_copyDictionaryForVolatileSourceWithName___block_invoke_2;
      v9[3] = &unk_1E1334F50;
      v9[4] = &v11;
      v9[5] = CacheStringForBundleID;
      -[_CFXPreferences withNamedVolatileSources:](v2, (uint64_t)v9);
    }
    v4 = (const __CFDictionary *)v12[3];
    if (v4)
      MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, v4);
    else
      MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v2 = (uint64_t)MutableCopy;
    v6 = (const void *)v12[3];
    if (v6)
      CFRelease(v6);
    _Block_object_dispose(&v11, 8);
  }
  return v2;
}

- (uint64_t)volatileSourceNames
{
  uint64_t v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38___CFXPreferences_volatileSourceNames__block_invoke;
  v3[3] = &unk_1E1334F78;
  v3[4] = &v4;
  -[_CFXPreferences withNamedVolatileSources:](a1, (uint64_t)v3);
  v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (void)resetUserPreferences
{
  const void *v1;
  _QWORD v2[6];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = 0;
    v4 = &v3;
    v5 = 0x2020000000;
    v6 = 0;
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __39___CFXPreferences_resetUserPreferences__block_invoke;
    v2[3] = &unk_1E13372A0;
    v2[4] = a1;
    v2[5] = &v3;
    -[_CFXPreferences withSearchLists:](a1, (uint64_t)v2);
    v1 = (const void *)v4[3];
    if (v1)
      CFRelease(v1);
    _Block_object_dispose(&v3, 8);
  }
}

- (uint64_t)_replaceDirectConnection:(uint64_t)result
{
  xpc_object_t *v3;
  _xpc_connection_s *v4;

  if (result)
  {
    v3 = (xpc_object_t *)result;
    os_unfair_lock_lock((os_unfair_lock_t)&_CFPrefsDaemonLock);
    v4 = (_xpc_connection_s *)v3[6];
    if (v4)
    {
      xpc_connection_cancel(v4);
      xpc_release(v3[6]);
      v3[6] = 0;
    }
    v3[6] = xpc_retain(a2);
    -[_CFXPreferences _setupNewDaemonConnection:invalidationHandler:](v3, (_xpc_connection_s *)a2, 0);
    os_unfair_lock_unlock((os_unfair_lock_t)&_CFPrefsDaemonLock);
    return -[xpc_object_t resetPreferences:](v3, "resetPreferences:", 0);
  }
  return result;
}

- (void)replaceValuesInVolatileSourceNamed:(const __CFDictionary *)a3 withValues:
{
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __65___CFXPreferences_replaceValuesInVolatileSourceNamed_withValues___block_invoke;
    v3[3] = &unk_1E1336FF0;
    v3[4] = a1;
    v3[5] = a2;
    withKeysAndValues(a3, (uint64_t)v3);
  }
}

- (void)generateKVONotificationsForIdentifier:(__CFString *)a3 withOldValues:(id)a4 newValues:(id)a5
{
  uint64_t v9;
  _QWORD v10[8];

  v10[7] = *MEMORY[0x1E0C80C00];
  v9 = objc_msgSend(a4, "count");
  if (v9 != objc_msgSend(a5, "count"))
    -[_CFXPreferences generateKVONotificationsForIdentifier:withOldValues:newValues:].cold.1();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81___CFXPreferences_generateKVONotificationsForIdentifier_withOldValues_newValues___block_invoke;
  v10[3] = &unk_1E13373F8;
  v10[4] = a4;
  v10[5] = a5;
  v10[6] = self;
  -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:]((uint64_t)self, a3, 0, 0, (uint64_t)v10);
}

- (void)withSourceForIdentifier:user:byHost:container:cloud:perform:.cold.1()
{
  __assert_rtn("-[_CFXPreferences(SourceAdditions) withSourceForIdentifier:user:byHost:container:cloud:perform:]", "CFPrefsSource.m", 1104, "!cloud");
}

- (void)ingestVolatileStateFromPreferences:.cold.1()
{
  __assert_rtn("-[_CFXPreferences ingestVolatileStateFromPreferences:]", "CFXPreferences.m", 1218, "prefs != self");
}

- (void)setBackupDisabled:identifier:user:host:container:.cold.1()
{
  OUTLINED_FUNCTION_2_17(0x1EDCD1000);
}

- (void)setFileProtectionClass:identifier:user:host:container:.cold.1()
{
  OUTLINED_FUNCTION_2_17(0x1EDCD1000);
}

- (void)setAccessRestricted:forAppIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_2_17(0x1EDCD1000);
}

- (void)_copyDaemonConnectionSettingUpIfNecessaryForRole:(uint64_t)a3 andUserIdentifier:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_23(&dword_182A8C000, a2, a3, "Could not resolve UID for user identifier %@. Please use _CFPreferencesGetUserIdentifierForUid() to target a specific user", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0_34();
}

- (void)_copyDaemonConnectionSettingUpIfNecessaryForRole:(os_log_t)log andUserIdentifier:.cold.2(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl(&dword_182A8C000, log, OS_LOG_TYPE_ERROR, "Could not target user session daemon connection for user %@: user session with UID %i is not active", (uint8_t *)&v3, 0x12u);
  OUTLINED_FUNCTION_0_34();
}

- (void)generateKVONotificationsForIdentifier:withOldValues:newValues:.cold.1()
{
  __assert_rtn("-[_CFXPreferences generateKVONotificationsForIdentifier:withOldValues:newValues:]", "CFXPreferences.m", 1775, "oldValues.count == newValues.count");
}

@end
