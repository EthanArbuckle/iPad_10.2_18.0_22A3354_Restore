@implementation CFPDSource

- (BOOL)isEqual:(id)a3
{
  return _CFPrefsEqualKeyOrSource(self, a3);
}

- (void)observingConnectionWasInvalidated:(id)a3
{
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__CFPDSource_observingConnectionWasInvalidated___block_invoke;
  v3[3] = &unk_1E1334548;
  v3[4] = self;
  v3[5] = a3;
  -[CFPDSource observingConnectionsLockedSync:]((os_unfair_lock_s *)self, (uint64_t)v3);
}

- (CFStringRef)_copyUncanonicalizedPath
{
  _BOOL8 v1;
  CFStringEncoding v2;
  char cStr[1026];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = (_BOOL8)result;
    bzero(cStr, 0x402uLL);
    if (-[CFPDSource _getUncanonicalizedPath:](v1, (UInt8 *)cStr))
    {
      v2 = CFStringFileSystemEncoding();
      return CFStringCreateWithCString((CFAllocatorRef)&__kCFAllocatorSystemDefault, cStr, v2);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)_getUncanonicalizedPath:(_BOOL8)result
{
  if (result)
    return +[CFPrefsDaemon _getUncanonicalizedSourcePath:withDomain:user:byHost:containerPath:managed:managedUsesContainer:]((uint64_t)CFPrefsDaemon, a2, *(__CFString **)(result + 48), *(const __CFString **)(result + 40), *(unsigned __int8 *)(result + 138), (const __CFString *)objc_msgSend((id)result, "container"), *(unsigned __int8 *)(result + 139), *(unsigned __int8 *)(result + 140));
  return result;
}

- (__CFString)container
{
  return 0;
}

- (signed)shmemIndex
{
  return self->_generationShmemIndex;
}

- (BOOL)managed
{
  return self->_managed;
}

- (__CFString)domain
{
  return self->_domain;
}

- (__CFString)user
{
  return self->_userName;
}

- (CFPDSource)initWithDomain:(__CFString *)a3 userName:(__CFString *)a4 byHost:(BOOL)a5 managed:(BOOL)a6 shmemIndex:(signed __int16)a7 daemon:(id)a8
{
  CFPDSource *v14;
  CFPDSource *v15;
  objc_super v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)CFPDSource;
  v14 = -[CFPDSource init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_cfprefsd = (CFPrefsDaemon *)a8;
    *(_QWORD *)&v14->_uncanonicalizedPathCacheLock._os_unfair_lock_opaque = 0;
    *(_QWORD *)&v14->_writeLock._os_unfair_lock_opaque = 0;
    *((_BYTE *)v14 + 142) &= ~2u;
    v14->_byHost = a5;
    v14->_domain = (__CFString *)_internString(a3);
    v15->_userName = (__CFString *)_internString(a4);
    v15->_managed = a6;
    v15->_generationShmemIndex = a7;
    *(_QWORD *)&v15->_parentFD = -1;
  }
  return v15;
}

- (__CFString)copyUncanonicalizedPath
{
  os_unfair_lock_s *p_uncanonicalizedPathCacheLock;
  __CFString *uncanonicalizedPathCache;
  __CFString *v5;

  p_uncanonicalizedPathCacheLock = &self->_uncanonicalizedPathCacheLock;
  os_unfair_lock_lock(&self->_uncanonicalizedPathCacheLock);
  uncanonicalizedPathCache = self->_uncanonicalizedPathCache;
  if (uncanonicalizedPathCache)
  {
    v5 = (__CFString *)CFRetain(uncanonicalizedPathCache);
    os_unfair_lock_unlock(p_uncanonicalizedPathCacheLock);
    if (v5)
      return v5;
  }
  else
  {
    os_unfair_lock_unlock(p_uncanonicalizedPathCacheLock);
  }
  return (__CFString *)-[CFPDSource _copyUncanonicalizedPath]((CFStringRef)self);
}

- (BOOL)byHost
{
  return self->_byHost;
}

- (void)unlock
{
  os_unfair_lock_unlock(&self->_lock);
}

- (void)lockedSync:(id)a3
{
  -[CFPDSource lock](self, "lock");
  -[CFPDSource beginHandlingRequest]((uint64_t)self);
  (*((void (**)(id))a3 + 2))(a3);
  -[CFPDSource endHandlingRequest]((const os_unfair_lock *)self);
  -[CFPDSource unlock](self, "unlock");
}

- (void)lock
{
  os_unfair_lock_lock(&self->_lock);
}

- (void)beginHandlingRequest
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_4();
  _os_log_debug_impl(&dword_182A8C000, v0, OS_LOG_TYPE_DEBUG, "Data for { %@, %@ } was purged due to memory pressure", v1, 0x16u);
  OUTLINED_FUNCTION_1_21();
}

- (uint64_t)tryEndAccessingPlist
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    result = *(_QWORD *)(result + 16);
    if (result)
    {
      result = objc_msgSend((id)result, "purgable");
      if ((result & 1) == 0)
      {
        result = -[CFPDSource shouldBePurgable](v1);
        if ((_DWORD)result)
          return objc_msgSend(*(id *)(v1 + 16), "endAccessing");
      }
    }
  }
  return result;
}

- (const)endHandlingRequest
{
  uint64_t v1;

  if (result)
  {
    v1 = (uint64_t)result;
    os_unfair_lock_assert_owner(result + 27);
    if ((*(_BYTE *)(v1 + 142) & 1) == 0)
      -[CFPDSource endHandlingRequest].cold.1();
    *(_BYTE *)(v1 + 142) &= ~1u;
    return (const os_unfair_lock *)-[CFPDSource tryEndAccessingPlist](v1);
  }
  return result;
}

- (void)setUncanonicalizedPathCached:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_uncanonicalizedPathCacheLock;
  __CFString *uncanonicalizedPathCache;
  __CFString *v7;

  v3 = a3;
  p_uncanonicalizedPathCacheLock = &self->_uncanonicalizedPathCacheLock;
  os_unfair_lock_lock(&self->_uncanonicalizedPathCacheLock);
  uncanonicalizedPathCache = self->_uncanonicalizedPathCache;
  if (v3)
  {
    if (!uncanonicalizedPathCache)
    {
      v7 = (__CFString *)-[CFPDSource _copyUncanonicalizedPath]((CFStringRef)self);
LABEL_6:
      self->_uncanonicalizedPathCache = v7;
    }
  }
  else if (uncanonicalizedPathCache)
  {
    CFRelease(uncanonicalizedPathCache);
    v7 = 0;
    goto LABEL_6;
  }
  os_unfair_lock_unlock(p_uncanonicalizedPathCacheLock);
}

- (void)processEndOfMessageIntendingToRemoveSource:(BOOL *)a3 replacingWithTombstone:(id *)a4
{
  os_unfair_lock_s *p_lock;
  size_t v8;
  const __CFURL *v9;
  const __CFURL *v10;
  const __CFURL *PathComponent;
  CFStringRef v12;
  _BOOL4 v13;
  const __CFArray *Value;
  const __CFArray *v15;
  CFIndex FirstIndexOfValue;
  const __CFArray *v17;
  CFIndex v18;
  const __CFString *v19;
  void *Mutable;
  const __CFArray *v21;
  _QWORD v22[7];
  CFRange v23;
  CFRange v24;
  CFRange v25;
  CFRange v26;

  v22[6] = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_assert_owner(&self->_lock);
  if (*a3)
  {
    if ((*((_BYTE *)self + 142) & 0x20) != 0 || !-[CFPDSource isEmpty]((uint64_t)self))
    {
      *a3 = 0;
    }
    else
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __80__CFPDSource_processEndOfMessageIntendingToRemoveSource_replacingWithTombstone___block_invoke;
      v22[3] = &unk_1E1336458;
      v22[4] = self;
      v22[5] = a4;
      -[CFPDSource observingConnectionsLockedSync:]((os_unfair_lock_s *)self, (uint64_t)v22);
    }
  }
  if (self->_actualPath)
  {
    if (_CFPrefsCurrentProcessIsCFPrefsD())
    {
      v8 = strlen(self->_actualPath);
      v9 = CFURLCreateFromFileSystemRepresentation((CFAllocatorRef)&__kCFAllocatorSystemDefault, (const UInt8 *)self->_actualPath, v8, 0);
      if (v9)
      {
        v10 = v9;
        PathComponent = CFURLCreateCopyDeletingLastPathComponent((CFAllocatorRef)&__kCFAllocatorSystemDefault, v9);
        CFRelease(v10);
        if (PathComponent)
        {
          v12 = CFURLCopyFileSystemPath(PathComponent, kCFURLPOSIXPathStyle);
          CFRelease(PathComponent);
          if (v12)
          {
            v13 = *a3;
            os_unfair_lock_assert_owner(p_lock);
            if (v13)
            {
              os_unfair_lock_lock((os_unfair_lock_t)&dirWatcherLock);
              if (self->_watchingParentDirectory)
              {
                self->_watchingParentDirectory = 0;
                Value = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)dirWatcherTargets, v12);
                if (Value)
                {
                  v15 = Value;
                  v23.length = CFArrayGetCount(Value);
                  v23.location = 0;
                  FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v15, v23, self);
                  if (FirstIndexOfValue != -1)
                    CFArrayRemoveValueAtIndex(v15, FirstIndexOfValue);
                  if (!CFArrayGetCount(v15))
                  {
                    CFDictionaryRemoveValue((CFMutableDictionaryRef)dirWatcherTargets, v12);
                    v17 = (const __CFArray *)watchedDirs;
                    v24.length = CFArrayGetCount((CFArrayRef)watchedDirs);
                    v24.location = 0;
                    v18 = CFArrayGetFirstIndexOfValue(v17, v24, v12);
                    if (v18 != -1)
                    {
                      CFArrayRemoveValueAtIndex((CFMutableArrayRef)watchedDirs, v18);
LABEL_35:
                      os_unfair_lock_unlock((os_unfair_lock_t)&dirWatcherLock);
                      os_unfair_lock_assert_not_owner((const os_unfair_lock *)&dirWatcherLock);
                      dispatch_async((dispatch_queue_t)fseventsQueue, &__block_literal_global_375);
                      goto LABEL_32;
                    }
                  }
                }
              }
            }
            else
            {
              if (-[CFPrefsDaemon role]((uint64_t)self->_cfprefsd) == 2)
              {
LABEL_32:
                CFRelease(v12);
                return;
              }
              if (initializeFSEvents_predicate != -1)
                dispatch_once(&initializeFSEvents_predicate, &__block_literal_global_366);
              if (_CFPrefsWatchForDeletionOfDirectory_onceToken != -1)
                dispatch_once(&_CFPrefsWatchForDeletionOfDirectory_onceToken, &__block_literal_global_364);
              v19 = _internString(v12);
              os_unfair_lock_lock((os_unfair_lock_t)&dirWatcherLock);
              if (!self->_watchingParentDirectory)
              {
                self->_watchingParentDirectory = 1;
                Mutable = (void *)CFDictionaryGetValue((CFDictionaryRef)dirWatcherTargets, v19);
                if (!Mutable)
                {
                  Mutable = CFArrayCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeArrayCallBacks);
                  if (Mutable)
                  {
                    CFDictionarySetValue((CFMutableDictionaryRef)dirWatcherTargets, v19, Mutable);
                    CFRelease(Mutable);
                  }
                }
                v25.length = CFArrayGetCount((CFArrayRef)Mutable);
                v25.location = 0;
                if (!CFArrayContainsValue((CFArrayRef)Mutable, v25, self))
                  CFArrayAppendValue((CFMutableArrayRef)Mutable, self);
                v21 = (const __CFArray *)watchedDirs;
                v26.length = CFArrayGetCount((CFArrayRef)watchedDirs);
                v26.location = 0;
                if (!CFArrayContainsValue(v21, v26, v19))
                {
                  CFArrayAppendValue((CFMutableArrayRef)watchedDirs, v19);
                  goto LABEL_35;
                }
              }
            }
            os_unfair_lock_unlock((os_unfair_lock_t)&dirWatcherLock);
            goto LABEL_32;
          }
        }
      }
    }
  }
}

- (uint64_t)isEmpty
{
  uint64_t v1;
  void *v2;
  int v3;
  stat v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = *(void **)(result + 24);
    if (v2 && xpc_array_get_count(v2) || objc_msgSend(*(id *)(v1 + 16), "length"))
    {
      return 0;
    }
    else
    {
      v3 = *(_DWORD *)(v1 + 128);
      if (v3 == -1)
      {
        return 1;
      }
      else
      {
        memset(&v5, 0, sizeof(v5));
        return fstatat(v3, *(const char **)(v1 + 64), &v5, 0) || v5.st_size < 1;
      }
    }
  }
  return result;
}

- (id)acceptMessage:(id)a3
{
  xpc_object_t reply;
  NSObject *v6;
  int64_t int64;
  int v8;
  _xpc_connection_s *remote_connection;
  _xpc_connection_s *value;
  uint64_t v11;
  uint64_t v12;
  __int128 *data;
  __int128 v14;
  void *Class;
  uint64_t v16;
  uint64_t v17;
  int v18;
  CFIndex Length;
  CFIndex MaximumSizeForEncoding;
  size_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  passwd *v25;
  uint64_t pw_uid;
  uint64_t pw_gid;
  NSObject *v28;
  _BOOL8 v29;
  id v30;
  _BOOL8 v31;
  int v32;
  const char *v33;
  _BOOL8 v34;
  unint64_t v36;
  unint64_t v37;
  char *v38;
  const char *v39;
  const char *v40;
  void *v41;
  unsigned int v42;
  int v43;
  char *actualPath;
  OS_xpc_object *v45;
  uint64_t v46;
  void *v47;
  OS_xpc_object *pendingChangesQueue;
  xpc_object_t v49;
  uint64_t v50;
  void *v51;
  OS_xpc_object *v52;
  char *v53;
  xpc_object_t v54;
  NSObject *v55;
  void *v56;
  uint64_t v57;
  NSObject *v58;
  const char *string;
  void **v60;
  void *v61;
  id v62;
  uint64_t v64;
  xpc_object_t v65;
  unsigned int v66;
  _QWORD v67[5];
  _QWORD v68[5];
  uid_t v69;
  mode_t v70;
  const char *v71;
  char v72;
  unsigned int v73;
  xpc_object_t v74;
  xpc_object_t v75;
  uint64_t v76;
  uint64_t v77;
  void (*v78)(uint64_t, int, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unsigned __int8);
  void *v79;
  const char *v80;
  __int128 v81;
  __int128 v82;
  CFPDSource *v83;
  _BYTE v84[1024];
  __int128 v85;
  __int128 v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  if (-[CFPDDataBuffer purgable](self->_plist, "purgable"))
    -[CFPDSource acceptMessage:].cold.1();
  reply = xpc_dictionary_create_reply(a3);
  if (!reply)
    reply = xpc_dictionary_create(0, 0, 0);
  v6 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_QWORD *)&v81 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v81 + 1) = 3221225472;
    *(_QWORD *)&v82 = __DEBUG_REQUEST_block_invoke;
    *((_QWORD *)&v82 + 1) = &unk_1E13368B8;
    v83 = self;
    _extractCFPDBits(a3, 0, self, (uint64_t)&v81);
  }
  v74 = 0;
  v75 = 0;
  v73 = 0;
  int64 = xpc_dictionary_get_int64(a3, "CFPreferencesOperation");
  v8 = _CFPrefsDecodeKeyValuePairFromXPCMessage(a3, &v75, &v74, (int *)&v73);
  v72 = 0;
  if (xpc_dictionary_get_BOOL(a3, "CFPreferencesAvoidCache"))
    -[CFPDSource syncWriteToDiskAndFlushCacheForReason:](self, "syncWriteToDiskAndFlushCacheForReason:", CFSTR("we're avoiding the cache"));
  if (xpc_dictionary_get_BOOL(a3, "CFPreferencesRestrictedReadability"))
    *((_BYTE *)self + 142) |= 0x10u;
  if (xpc_dictionary_get_BOOL(a3, "CFPreferencesDisableBackups"))
    *((_BYTE *)self + 142) |= 0x40u;
  self->_fileProtectionClass = xpc_dictionary_get_int64(a3, "CFPreferencesFileProtectionClass");
  if (xpc_dictionary_get_BOOL(a3, "kCFPreferencesTestingSimulateSlowFilesystem"))
    byte_1EDCCE37B = 1;
  atomic_store(xpc_dictionary_get_int64(a3, "kCFPreferencesTestingSimulateOutOfDiskSpace"), &dword_1EDCCE384);
  remote_connection = xpc_dictionary_get_remote_connection(a3);
  if (!remote_connection)
  {
    value = (_xpc_connection_s *)xpc_dictionary_get_value(a3, "connection");
    if (!value
      || (remote_connection = value, value = object_getClass(value), value != (_xpc_connection_s *)MEMORY[0x1E0C812E0]))
    {
      -[CFPDSource acceptMessage:].cold.2((uint64_t)value, v11, v12);
    }
  }
  *(_QWORD *)&v81 = 0;
  v85 = 0u;
  v86 = 0u;
  data = (__int128 *)xpc_dictionary_get_data(a3, "CFPreferencesAuditToken", (size_t *)&v81);
  if (data && (_QWORD)v81 == 32)
  {
    v14 = data[1];
    v85 = *data;
    v86 = v14;
  }
  else
  {
    if (!xpc_dictionary_get_remote_connection(a3))
    {
      Class = xpc_dictionary_get_value(a3, "connection");
      if (!Class || (Class = object_getClass(Class), Class != (void *)MEMORY[0x1E0C812E0]))
        -[CFPDSource acceptMessage:].cold.5((uint64_t)Class, v16, v17);
    }
    xpc_connection_get_audit_token();
  }
  bzero(v84, 0x400uLL);
  v81 = v85;
  v82 = v86;
  sandbox_container_path_for_audit_token();
  if (!v8)
  {
LABEL_38:
    v18 = 0;
    goto LABEL_39;
  }
  if ((_CFPrefsReadOnly() & 1) == 0)
  {
    if (xpc_dictionary_get_BOOL(a3, "CFPreferencesUseCorrectOwner"))
    {
      Length = CFStringGetLength(self->_userName);
      MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
      v21 = MaximumSizeForEncoding + 1;
      MEMORY[0x1E0C80A78](MaximumSizeForEncoding, v22);
      v24 = (char *)&v65 - v23;
      bzero((char *)&v65 - v23, v21);
      CFStringGetCString(self->_userName, v24, v21, 0x8000100u);
      v25 = getpwnam(v24);
      if (v25)
      {
        pw_uid = v25->pw_uid;
        pw_gid = v25->pw_gid;
LABEL_34:
        if ((_DWORD)pw_uid != self->_lastEuid || (_DWORD)pw_gid != self->_lastEgid)
          -[CFPDSource syncWriteToDisk](self, "syncWriteToDisk");
        self->_lastEuid = pw_uid;
        self->_lastEgid = pw_gid;
        if (self->_parentFD == -1)
        {
          v18 = -[CFPDSource cacheFileInfoForWriting:euid:egid:didCreate:](self, "cacheFileInfoForWriting:euid:egid:didCreate:", 1, pw_uid, pw_gid, &v72);
          goto LABEL_39;
        }
        goto LABEL_38;
      }
      v28 = _CFPrefsDaemonLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        -[CFPDSource acceptMessage:].cold.4();
    }
    pw_uid = xpc_connection_get_euid(remote_connection);
    pw_gid = xpc_connection_get_egid(remote_connection);
    goto LABEL_34;
  }
  v18 = 8;
LABEL_39:
  v71 = 0;
  v70 = 0;
  v69 = 0;
  v29 = xpc_dictionary_get_BOOL(a3, "ValidatePlist");
  if ((v8 & 1) == 0)
  {
    v34 = v29;
    if (self->_plist
      || self->_parentFD != -1
      || (-[CFPDSource cacheFileInfo](self, "cacheFileInfo"), self->_parentFD != -1))
    {
      if (!_os_feature_enabled_impl()
        || CFStringFind(self->_domain, CFSTR("com.apple."), 0).location == -1)
      {
        goto LABEL_56;
      }
      if (acceptMessage__onceToken != -1)
        dispatch_once(&acceptMessage__onceToken, &__block_literal_global_116);
      if (acceptMessage___CFMKBDeviceUnlockedSinceBoot && !acceptMessage___CFMKBDeviceUnlockedSinceBoot())
      {
        actualPath = self->_actualPath;
        *(_QWORD *)&v81 = MEMORY[0x1E0C809B0];
        *((_QWORD *)&v81 + 1) = 3221225472;
        *(_QWORD *)&v82 = __ERROR_LOG_PREUNLOCK_ACCESS_block_invoke;
        *((_QWORD *)&v82 + 1) = &__block_descriptor_40_e29_v64__0i8_12_20_28_36_44_52B60l;
        v83 = (CFPDSource *)actualPath;
        _extractCFPDBits(a3, 0, self, (uint64_t)&v81);
        if (v34)
          goto LABEL_58;
      }
      else
      {
LABEL_56:
        if (v34)
          goto LABEL_58;
      }
      if (!self->_plist)
      {
        v43 = -[CFPDSource openPropertyListWithoutDrainingPendingChangesOrValidatingPlistAndReturnFileUID:andMode:]((os_unfair_lock_s *)self, &v69, &v70);
        if (v43 != -1)
        {
          v32 = v43;
          v30 = 0;
LABEL_59:
          v31 = v32 != -1 || v30 != 0;
          if (v18)
            goto LABEL_42;
          goto LABEL_41;
        }
      }
LABEL_58:
      v30 = -[CFPDSource copyPropertyListWithoutDrainingPendingChangesValidatingPlist:andReturnFileUID:andMode:](self, "copyPropertyListWithoutDrainingPendingChangesValidatingPlist:andReturnFileUID:andMode:", v34, &v69, &v70);
      v32 = -1;
      goto LABEL_59;
    }
  }
  v30 = 0;
  v31 = 0;
  v32 = -1;
  if (!v18)
  {
LABEL_41:
    LOWORD(v64) = v70;
    v18 = -[CFPDSource validateMessage:withNewKey:newValue:plistIsAvailableToRead:containerPath:fileUID:mode:diagnosticMessage:](self, "validateMessage:withNewKey:newValue:plistIsAvailableToRead:containerPath:fileUID:mode:diagnosticMessage:", a3, v75, v74, v31, v84, v69, v64, &v71);
  }
LABEL_42:
  switch(v18)
  {
    case 0:
      -[CFPDSource acceptMessage:].cold.3();
    case 1:
      if (v8)
      {
        v36 = -[CFPDSource approximatePlistSizeIncludingPendingChanges]((uint64_t)self);
        if (-[CFPDSource enqueueNewKey:value:encoding:inBatch:fromMessage:](self, "enqueueNewKey:value:encoding:inBatch:fromMessage:", v75, v74, v73, 0, a3))
        {
          v37 = -[CFPDSource approximatePlistSizeIncludingPendingChanges]((uint64_t)self);
          if (v37 > v36)
            -[CFPDSource attachSizeWarningsToReply:forByteCount:]((uint64_t)self, reply, v37);
          if (xpc_dictionary_get_BOOL(a3, "CFPreferencesShouldWriteSynchronously") || v72)
            -[CFPDSource syncWriteToDisk](self, "syncWriteToDisk");
          v66 = v73;
          v54 = v74;
          v65 = v75;
          v55 = _CFPrefsDaemonLog();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
          {
            if (v66)
              v56 = v54;
            else
              v56 = v65;
            _extractCFPDBits(a3, v56, self, (uint64_t)&__block_literal_global_359);
          }
          -[CFPDSource asyncNotifyObserversOfWriteFromConnection:message:](self, "asyncNotifyObserversOfWriteFromConnection:message:", remote_connection, a3);
        }
        else
        {
          v40 = "Couldn't enqueue updated values";
          v41 = reply;
          v42 = 2;
LABEL_83:
          populateErrorReply(v40, v41, v42);
        }
      }
      else if ((unint64_t)(int64 - 7) > 1)
      {
        if (v30 || v32 != -1 || (v45 = self->_pendingChangesQueue) != 0 && xpc_array_get_count(v45))
        {
          v46 = MEMORY[0x1E0C809B0];
          v68[0] = MEMORY[0x1E0C809B0];
          v68[1] = 3221225472;
          v68[2] = __28__CFPDSource_acceptMessage___block_invoke_2;
          v68[3] = &unk_1E12E5C68;
          v68[4] = self;
          objc_msgSend(v30, "quicklyValidatePlistAndOnFailureInvokeBlock:", v68);
          v47 = (void *)objc_msgSend(v30, "copyXPCData");
          if (v47)
          {
            xpc_dictionary_set_value(reply, "CFPreferencesPropertyList", v47);
            xpc_release(v47);
          }
          if (v32 != -1)
            xpc_dictionary_set_fd(reply, "PlistFD", v32);
          pendingChangesQueue = self->_pendingChangesQueue;
          if (pendingChangesQueue && xpc_array_get_count(pendingChangesQueue))
          {
            v49 = xpc_array_create(0, 0);
            v50 = v46;
            v51 = v49;
            v52 = self->_pendingChangesQueue;
            v67[0] = v50;
            v67[1] = 3221225472;
            v67[2] = __28__CFPDSource_acceptMessage___block_invoke_124;
            v67[3] = &unk_1E1336430;
            v67[4] = v51;
            xpc_array_apply(v52, v67);
            xpc_dictionary_set_value(reply, "PlistDiff", v51);
            xpc_release(v51);
          }
          v53 = self->_actualPath;
          if (v47)
            DEBUG_READ(a3, self, (uint64_t)v53);
          else
            DEBUG_READ_EMPTY(a3, self, (uint64_t)v53);
        }
        xpc_dictionary_set_int64(reply, "CFPreferencesShmemIndex", self->_generationShmemIndex);
        bzero(&v81, 0x400uLL);
        -[CFPrefsDaemon getShmemName:bufLen:]((uint64_t)self->_cfprefsd, (char *)&v81);
        v39 = "CFPreferencesShmemName";
LABEL_115:
        v38 = (char *)&v81;
LABEL_116:
        xpc_dictionary_set_string(reply, v39, v38);
      }
      else
      {
        -[CFPDSource setObserved:bySenderOfMessage:]((const os_unfair_lock *)self, int64 == 7, a3);
      }
LABEL_117:
      xpc_dictionary_set_int64(reply, "CFPreferencesShmemIndex", self->_generationShmemIndex);
      bzero(&v81, 0x400uLL);
      -[CFPrefsDaemon getShmemName:bufLen:]((uint64_t)self->_cfprefsd, (char *)&v81);
      xpc_dictionary_set_string(reply, "CFPreferencesShmemName", (const char *)&v81);
      v57 = atomic_load((unsigned int *)(-[CFPrefsDaemon shmem]((uint64_t)self->_cfprefsd)
                                       + 4 * self->_generationShmemIndex));
      xpc_dictionary_set_uint64(reply, "CFPreferencesShmemState", v57);
      if (v18 == 1)
        goto LABEL_128;
      if (v18 == 4)
      {
        v58 = _CFPrefsDaemonLog();
        if (!os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
          goto LABEL_128;
        v76 = MEMORY[0x1E0C809B0];
        v77 = 3221225472;
        v78 = __DEBUG_NEEDS_TOKEN_block_invoke;
        v79 = &__block_descriptor_33_e29_v64__0i8_12_20_28_36_44_52B60l;
        LOBYTE(v80) = v8;
        goto LABEL_126;
      }
      string = xpc_dictionary_get_string(reply, "CFPreferencesErrorDescription");
      if (!v8)
      {
        v76 = MEMORY[0x1E0C809B0];
        v77 = 3221225472;
        v78 = __ERROR_READ_REJECTED_block_invoke;
        v79 = &__block_descriptor_40_e29_v64__0i8_12_20_28_36_44_52B60l;
        v80 = string;
LABEL_126:
        v62 = a3;
        v61 = 0;
        goto LABEL_127;
      }
      v60 = &v74;
      if (!v73)
        v60 = &v75;
      v61 = *v60;
      v76 = MEMORY[0x1E0C809B0];
      v77 = 3221225472;
      v78 = __ERROR_WRITE_REJECTED_block_invoke;
      v79 = &__block_descriptor_40_e29_v64__0i8_12_20_28_36_44_52B60l;
      v80 = string;
      v62 = a3;
LABEL_127:
      _extractCFPDBits(v62, v61, self, (uint64_t)&v76);
LABEL_128:
      if (v72)
        -[CFPDSource cleanUpIfNecessaryAfterCreatingPlist]((uint64_t)self);
      if ((*((_BYTE *)self + 142) & 4) != 0)
        -[CFPDSource syncWriteToDiskAndFlushCacheForReason:](self, "syncWriteToDiskAndFlushCacheForReason:", CFSTR("we're never caching"));
      -[CFPDSource closeFileDescriptors]((uint64_t)self);
      if (v75)
        xpc_release(v75);
      if (v74)
        xpc_release(v74);

      if (v32 != -1)
        close(v32);
      return reply;
    case 2:
    case 3:
      if (v71)
        v33 = v71;
      else
        v33 = "Operation not allowed";
      populateErrorReply(v33, reply, 0);
      xpc_dictionary_set_BOOL(reply, "CFPreferencesErrorClientFault", 1);
      goto LABEL_117;
    case 4:
      if (!self->_actualPath)
      {
        -[CFPDSource cacheFileInfo](self, "cacheFileInfo");
        if (!self->_actualPath)
          goto LABEL_76;
      }
      populateErrorReply("Access token needed", reply, 3u);
      v38 = self->_actualPath;
      v39 = "CFPreferencesAccessToken";
      goto LABEL_116;
    case 5:
      populateErrorReply("Directory needed", reply, 4u);
      bzero(&v81, 0x402uLL);
      if (!-[CFPDSource getUncanonicalizedPath:]((uint64_t)self, (char *)&v81))
        goto LABEL_117;
      v39 = "CFPreferencesUncanonicalizedPath";
      goto LABEL_115;
    case 6:
      v40 = "Invalid plist data";
      v41 = reply;
      v42 = 1;
      goto LABEL_83;
    case 7:
LABEL_76:
      v40 = "Path not accessible";
      goto LABEL_82;
    case 8:
      v40 = "Writing has been disabled";
      goto LABEL_82;
    case 9:
      v40 = "Unable to determine access";
LABEL_82:
      v41 = reply;
      v42 = 0;
      goto LABEL_83;
    default:
      goto LABEL_117;
  }
}

- (uint64_t)closeFileDescriptors
{
  uint64_t v1;
  int v2;

  if (result)
  {
    v1 = result;
    if ((*(_BYTE *)(result + 142) & 2) == 0)
    {
      v2 = *(_DWORD *)(result + 128);
      if ((v2 & 0x80000000) == 0)
        close(v2);
      *(_DWORD *)(v1 + 128) = -1;
      free(*(void **)(v1 + 64));
      *(_QWORD *)(v1 + 64) = 0;
    }
    result = *(unsigned int *)(v1 + 132);
    if ((result & 0x80000000) == 0)
      result = close(result);
    *(_DWORD *)(v1 + 132) = -1;
  }
  return result;
}

- (int)validateMessage:(id)a3 withNewKey:(id)a4 newValue:(id)a5 plistIsAvailableToRead:(BOOL)a6 containerPath:(const char *)a7 fileUID:(unsigned int)a8 mode:(unsigned __int16)a9 diagnosticMessage:(const char *)a10
{
  _BOOL4 v12;
  _BOOL4 v17;
  int v18;
  int result;
  char *string_ptr;
  const char *v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;

  v12 = a6;
  v27 = *MEMORY[0x1E0C80C00];
  v17 = a4 != 0;
  if (!eduModeEnabled() || !xpc_dictionary_get_BOOL(a3, "AllowWritingSpecialKeysToGlobalPreferences"))
  {
    if (a4 || v12)
      goto LABEL_11;
    return 1;
  }
  if (!a4)
    return 1;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  if (xpc_dictionary_get_BOOL(a3, "MultiKeySet"))
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __118__CFPDSource_validateMessage_withNewKey_newValue_plistIsAvailableToRead_containerPath_fileUID_mode_diagnosticMessage___block_invoke;
    v22[3] = &unk_1E12E1650;
    v22[4] = &v23;
    xpc_dictionary_apply(a5, v22);
    v18 = *((unsigned __int8 *)v24 + 24);
  }
  else
  {
    string_ptr = (char *)xpc_string_get_string_ptr(a4);
    v18 = isSpecialKey(string_ptr);
    *((_BYTE *)v24 + 24) = v18;
  }
  _Block_object_dispose(&v23, 8);
  if (v18)
    return 1;
LABEL_11:
  LOBYTE(v23) = 0;
  result = -[CFPDSource validatePOSIXPermissionsForMessage:accessType:fileUID:mode:fullyValidated:]((uint64_t)self, a3, v17, a8, a9, &v23);
  if ((_BYTE)v23)
  {
    if (result == 3)
    {
      v21 = "writing to another user's preferences requires sufficient permissions to write to the file";
    }
    else
    {
      if (result != 2)
        return result;
      v21 = "accessing another user's preferences requires sufficient permissions to be able to read the file";
    }
  }
  else
  {
    result = -[CFPDSource validateSandboxPermissionsForMessage:containerPath:accessType:]((uint64_t)self, a3, a7, v17);
    if (a7 && *a7)
    {
      if (result == 3)
      {
        v21 = "setting preferences outside an application's container requires user-preference-write or file-write-data sandbox access";
      }
      else
      {
        if (result != 2)
          return result;
        v21 = "accessing preferences outside an application's container requires user-preference-read or file-read-data sandbox access";
      }
    }
    else if (result == 3)
    {
      v21 = "setting these preferences requires user-preference-write or file-write-data sandbox access";
    }
    else
    {
      if (result != 2)
        return result;
      v21 = "accessing these preferences requires user-preference-read or file-read-data sandbox access";
    }
  }
  *a10 = v21;
  return result;
}

- (void)observingConnectionsLockedSync:(os_unfair_lock_s *)a1
{
  os_unfair_lock_s *v3;

  if (a1)
  {
    v3 = a1 + 25;
    os_unfair_lock_lock(a1 + 25);
    (*(void (**)(uint64_t))(a2 + 16))(a2);
    os_unfair_lock_unlock(v3);
  }
}

- (void)cacheFileInfo
{
  -[CFPDSource cacheFileInfoForWriting:euid:egid:didCreate:](self, "cacheFileInfoForWriting:euid:egid:didCreate:", 0, 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0);
}

- (void)setManagedPreferencesUseContainer:(BOOL)a3
{
  self->_managedUsesContainer = a3;
}

- (uint64_t)validateSandboxPermissionsForMessage:(const char *)a3 containerPath:(int)a4 accessType:
{
  if (result)
  {
    if (a4 == 1)
    {
      if (-[CFPDSource validateSandboxForWrite:containerPath:](result, a2, a3))
        return 1;
      else
        return 3;
    }
    else
    {
      return -[CFPDSource validateSandboxForRead:containerPath:](result, a2, a3);
    }
  }
  return result;
}

- (BOOL)shouldBePurgable
{
  uint64_t v1;
  os_unfair_lock_s *v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_assert_owner((const os_unfair_lock *)(result + 108));
    if ((*(_BYTE *)(v1 + 142) & 3) != 0)
    {
      return 0;
    }
    else
    {
      v2 = (os_unfair_lock_s *)(v1 + 104);
      result = os_unfair_lock_trylock(v2);
      if (result)
      {
        os_unfair_lock_unlock(v2);
        return 1;
      }
    }
  }
  return result;
}

- (uint64_t)validateSandboxForRead:(const char *)a3 containerPath:
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  char *string;
  __int128 *data;
  __int128 v12;
  void *value;
  uint64_t v14;
  uint64_t v15;
  void *Class;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  char *v20;
  int v21;
  size_t v22;
  _BOOL4 v23;
  char *v24;
  _BOOL4 v25;
  size_t length[2];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    if (!a2)
      -[CFPDSource validateSandboxForRead:containerPath:].cold.1();
    v5 = result;
    if (*(_QWORD *)(result + 56))
    {
LABEL_8:
      if (_CFPrefsMessageSenderIsSandboxed(a2))
      {
        string = (char *)xpc_dictionary_get_string(a2, "CFPreferencesDomain");
        length[0] = 0;
        v28 = 0u;
        v29 = 0u;
        data = (__int128 *)xpc_dictionary_get_data(a2, "CFPreferencesAuditToken", length);
        if (data && length[0] == 32)
        {
          v12 = data[1];
          v28 = *data;
          v29 = v12;
        }
        else
        {
          if (!xpc_dictionary_get_remote_connection(a2))
          {
            value = xpc_dictionary_get_value(a2, "connection");
            if (!value || (value = object_getClass(value), value != (void *)MEMORY[0x1E0C812E0]))
              -[CFPDSource validateSandboxForRead:containerPath:].cold.4((uint64_t)value, v14, v15);
          }
          xpc_connection_get_audit_token();
        }
        if (*(_BYTE *)(v5 + 139))
        {
          if (!xpc_dictionary_get_remote_connection(a2))
          {
            Class = xpc_dictionary_get_value(a2, "connection");
            if (!Class || (Class = object_getClass(Class), Class != (void *)MEMORY[0x1E0C812E0]))
              -[CFPDSource validateSandboxForRead:containerPath:].cold.3((uint64_t)Class, v17, v18);
          }
          v19 = (const char *)xpc_connection_copy_bundle_id();
          v20 = (char *)v19;
          if (v19 && !strcmp(v19, string))
          {
            v21 = 0;
          }
          else
          {
            *(_OWORD *)length = v28;
            v27 = v29;
            v21 = sandbox_check_by_audit_token();
          }
          free(v20);
          if (!v21)
            return 1;
          return 2;
        }
        v22 = strlen(a3);
        if (v22)
          v23 = strncmp(*(const char **)(v5 + 56), a3, v22) != 0;
        else
          v23 = 1;
        v24 = strchr(string, 47);
        v25 = xpc_dictionary_get_BOOL(a2, "CFPreferencesHasFixedUpContainer");
        if (!v23 || v25 || v24)
        {
          *(_OWORD *)length = v28;
          v27 = v29;
          if (sandbox_check_by_audit_token())
            return 2;
        }
        else
        {
          *(_OWORD *)length = v28;
          v27 = v29;
          if (sandbox_check_by_audit_token())
          {
            *(_OWORD *)length = v28;
            v27 = v29;
            if (sandbox_check_by_audit_token())
            {
              *(_OWORD *)length = v28;
              v27 = v29;
              sandbox_check_by_audit_token();
              return 2;
            }
          }
        }
      }
      return 1;
    }
    objc_msgSend((id)result, "cacheFileInfo");
    v6 = *(_QWORD *)(v5 + 56);
    v7 = (void *)MEMORY[0x186DB1518](a2);
    v8 = _CFPrefsDaemonLog();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (v9)
        -[CFPDSource validateSandboxForRead:containerPath:].cold.5();
      free(v7);
      goto LABEL_8;
    }
    if (v9)
      -[CFPDSource validateSandboxForRead:containerPath:].cold.2();
    free(v7);
    return 9;
  }
  return result;
}

- (uint64_t)approximatePlistSizeIncludingPendingChanges
{
  uint64_t v1;
  int v2;
  int v3;
  off_t st_size;
  stat v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(a1 + 16))
  {
    v1 += objc_msgSend(*(id *)(a1 + 16), "length");
  }
  else
  {
    v2 = *(_DWORD *)(a1 + 128);
    if (v2 != -1)
    {
      memset(&v6, 0, sizeof(v6));
      v3 = fstatat(v2, *(const char **)(a1 + 64), &v6, 0);
      st_size = v6.st_size;
      if (v3)
        st_size = 0;
      v1 += st_size;
    }
  }
  return v1;
}

void __44__CFPDSource_setObserved_bySenderOfMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  int v4;
  __CFSet *v5;
  CFSetCallBacks v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = *(unsigned __int8 *)(a1 + 40);
  v5 = *(__CFSet **)(a2 + 24);
  if (v4)
  {
    if (!v5)
    {
      v6 = *(CFSetCallBacks *)byte_1E1336388;
      *(_QWORD *)(a2 + 24) = CFSetCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &v6);
      v5 = *(__CFSet **)(a2 + 24);
    }
    CFSetAddValue(v5, *(const void **)(a1 + 32));
  }
  else if (v5)
  {
    CFSetRemoveValue(v5, *(const void **)(a1 + 32));
    if (!CFSetGetCount(*(CFSetRef *)(a2 + 24)))
    {
      CFRelease(*(CFTypeRef *)(a2 + 24));
      *(_QWORD *)(a2 + 24) = 0;
    }
  }
}

- (void)asyncNotifyObserversOfWriteFromConnection:(id)a3 message:(id)a4
{
  _QWORD v4[8];

  v4[7] = *MEMORY[0x1E0C80C00];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__CFPDSource_asyncNotifyObserversOfWriteFromConnection_message___block_invoke;
  v4[3] = &unk_1E1336318;
  v4[4] = self;
  v4[5] = a3;
  v4[6] = a4;
  -[CFPDSource observingConnectionsLockedSync:]((os_unfair_lock_s *)self, (uint64_t)v4);
}

- (BOOL)validateSandboxForWrite:(const char *)a3 containerPath:
{
  uint64_t v5;
  char *string;
  size_t v7;
  _BOOL4 v8;
  char *v9;
  _BOOL4 v10;
  __int128 *v11;
  __int128 v12;
  __int128 *data;
  __int128 v14;
  void *Class;
  uint64_t v16;
  uint64_t v17;
  int v18;
  const char *v19;
  uint64_t v20;
  unsigned int v21;
  int v22;
  void *value;
  uint64_t v24;
  uint64_t v25;
  int v26;
  const char *v27;
  uint64_t v28;
  unsigned int v29;
  size_t length[2];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5 = result;
    os_unfair_lock_assert_owner((const os_unfair_lock *)(result + 108));
    if (*(_DWORD *)(v5 + 128) == -1)
    {
      return 0;
    }
    else if (_CFPrefsMessageSenderIsSandboxed(a2))
    {
      string = (char *)xpc_dictionary_get_string(a2, "CFPreferencesDomain");
      v7 = strlen(a3);
      if (v7)
        v8 = strncmp(*(const char **)(v5 + 56), a3, v7) != 0;
      else
        v8 = 1;
      v9 = strchr(string, 47);
      v10 = xpc_dictionary_get_BOOL(a2, "CFPreferencesHasFixedUpContainer");
      if (!v8 || v10 || v9)
      {
        length[0] = 0;
        v32 = 0u;
        v33 = 0u;
        data = (__int128 *)xpc_dictionary_get_data(a2, "CFPreferencesAuditToken", length);
        if (data && length[0] == 32)
        {
          v14 = data[1];
          v32 = *data;
          v33 = v14;
        }
        else
        {
          if (!xpc_dictionary_get_remote_connection(a2))
          {
            value = xpc_dictionary_get_value(a2, "connection");
            if (!value || (value = object_getClass(value), value != (void *)MEMORY[0x1E0C812E0]))
              -[CFPDSource validateSandboxForWrite:containerPath:].cold.2((uint64_t)value, v24, v25);
          }
          xpc_connection_get_audit_token();
        }
        v26 = *(_DWORD *)(v5 + 128);
        v28 = *(_QWORD *)(v5 + 56);
        v27 = *(const char **)(v5 + 64);
        v29 = 384;
        if ((*(_BYTE *)(v5 + 142) & 0x10) == 0)
        {
          if (CFEqual(*(CFTypeRef *)(v5 + 40), CFSTR("kCFPreferencesAnyUser")))
            v29 = 420;
          else
            v29 = 384;
        }
        *(_OWORD *)length = v32;
        v31 = v33;
        v22 = checkFileWriteData(length, v28, v26, v27, v29);
      }
      else
      {
        length[0] = 0;
        v32 = 0u;
        v33 = 0u;
        v11 = (__int128 *)xpc_dictionary_get_data(a2, "CFPreferencesAuditToken", length);
        if (v11 && length[0] == 32)
        {
          v12 = v11[1];
          v32 = *v11;
          v33 = v12;
        }
        else
        {
          if (!xpc_dictionary_get_remote_connection(a2))
          {
            Class = xpc_dictionary_get_value(a2, "connection");
            if (!Class || (Class = object_getClass(Class), Class != (void *)MEMORY[0x1E0C812E0]))
              -[CFPDSource validateSandboxForWrite:containerPath:].cold.1((uint64_t)Class, v16, v17);
          }
          xpc_connection_get_audit_token();
        }
        *(_OWORD *)length = v32;
        v31 = v33;
        if (sandbox_check_by_audit_token())
        {
          v18 = *(_DWORD *)(v5 + 128);
          v20 = *(_QWORD *)(v5 + 56);
          v19 = *(const char **)(v5 + 64);
          v21 = 384;
          if ((*(_BYTE *)(v5 + 142) & 0x10) == 0)
          {
            if (CFEqual(*(CFTypeRef *)(v5 + 40), CFSTR("kCFPreferencesAnyUser")))
              v21 = 420;
            else
              v21 = 384;
          }
          *(_OWORD *)length = v32;
          v31 = v33;
          v22 = checkFileWriteData(length, v20, v18, v19, v21);
          if (v22)
            _CFPrefsSandboxCheckForMessage(a2);
        }
        else
        {
          v22 = 0;
        }
      }
      return v22 == 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (uint64_t)openPropertyListWithoutDrainingPendingChangesOrValidatingPlistAndReturnFileUID:(mode_t *)a3 andMode:
{
  uint64_t v3;
  os_unfair_lock_s *v6;
  int v7;
  uint64_t v8;
  stat v10;
  uint64_t v11;

  v3 = (uint64_t)a1;
  v11 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v6 = a1 + 26;
    os_unfair_lock_lock(a1 + 26);
    v7 = *(_DWORD *)(v3 + 128);
    if (v7 == -1 && (objc_msgSend((id)v3, "cacheFileInfo"), v7 = *(_DWORD *)(v3 + 128), v7 == -1))
    {
      v3 = 0xFFFFFFFFLL;
    }
    else
    {
      v8 = openat(v7, *(const char **)(v3 + 64), 256);
      v3 = v8;
      if ((_DWORD)v8 != -1)
      {
        memset(&v10, 0, sizeof(v10));
        if (fstat(v8, &v10) || v10.st_size < 0x100000)
        {
          close(v3);
          v3 = 0xFFFFFFFFLL;
        }
        if (a2)
          *a2 = v10.st_uid;
        if (a3)
          *a3 = v10.st_mode;
      }
    }
    os_unfair_lock_unlock(v6);
  }
  return v3;
}

void __48__CFPDSource_observingConnectionWasInvalidated___block_invoke(uint64_t a1)
{
  -[CFPDSource stopNotifyingObserver:](*(_QWORD *)(a1 + 32), *(const void **)(a1 + 40));
}

- (void)stopNotifyingObserver:(uint64_t)a1
{
  __CFSet *v4;

  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 100));
    v4 = *(__CFSet **)(a1 + 72);
    if (v4)
    {
      CFSetRemoveValue(v4, a2);
      if (!CFSetGetCount(*(CFSetRef *)(a1 + 72)))
      {
        CFRelease(*(CFTypeRef *)(a1 + 72));
        *(_QWORD *)(a1 + 72) = 0;
      }
    }
  }
}

- (void)endHandlingRequest
{
  __assert_rtn("-[CFPDSource endHandlingRequest]", "CFPDSource.m", 559, "_handlingRequest");
}

- (void)respondToFileWrittenToBehindOurBack
{
  _QWORD v2[6];

  v2[5] = *MEMORY[0x1E0C80C00];
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __49__CFPDSource_respondToFileWrittenToBehindOurBack__block_invoke;
  v2[3] = &unk_1E12E5C68;
  v2[4] = self;
  -[CFPDSource lockedSync:](self, "lockedSync:", v2);
}

- (void)dealloc
{
  __CFSet *observingConnections;
  OS_xpc_object *pendingChangesQueue;
  int parentFD;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  observingConnections = self->_observingConnections;
  if (observingConnections)
    CFRelease(observingConnections);
  pendingChangesQueue = self->_pendingChangesQueue;
  if (pendingChangesQueue)
    xpc_release(pendingChangesQueue);

  free(self->_actualPath);
  free(self->_fileName);
  parentFD = self->_parentFD;
  if ((parentFD & 0x80000000) == 0)
    close(parentFD);
  v6.receiver = self;
  v6.super_class = (Class)CFPDSource;
  -[CFPDSource dealloc](&v6, sel_dealloc);
}

void __64__CFPDSource_asyncNotifyObserversOfWriteFromConnection_message___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 *data;
  __int128 v4;
  pid_t v5;
  void *value;
  uint64_t v7;
  uint64_t v8;
  xpc_object_t v9;
  uint64_t v10;
  xpc_object_t v11;
  uint64_t v12;
  uint64_t v13;
  xpc_object_t v14;
  void *v15;
  NSObject *v16;
  size_t length;
  xpc_object_t values[6];
  __int128 context;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (-[CFPDSource hasObservers](*(const os_unfair_lock **)(a1 + 32)))
  {
    values[0] = _CFXPCCreateXPCObjectFromCFObject(*(__CFString **)(*(_QWORD *)(a1 + 32) + 48));
    values[1] = _CFXPCCreateXPCObjectFromCFObject(*(__CFString **)(*(_QWORD *)(a1 + 32) + 40));
    values[2] = xpc_BOOL_create(*(_BYTE *)(*(_QWORD *)(a1 + 32) + 138));
    values[3] = _CFXPCCreateXPCObjectFromCFObject((__CFString *)objc_msgSend(*(id *)(a1 + 32), "container"));
    values[4] = _CFXPCCreateXPCObjectFromCFObject((__CFString *)objc_msgSend(*(id *)(a1 + 32), "cloudConfigurationPath"));
    if (*(_QWORD *)(a1 + 40) && (v2 = *(void **)(a1 + 48)) != 0)
    {
      length = 0;
      context = 0u;
      v20 = 0u;
      data = (__int128 *)xpc_dictionary_get_data(v2, "CFPreferencesAuditToken", &length);
      if (data && length == 32)
      {
        v4 = data[1];
        context = *data;
        v20 = v4;
      }
      else
      {
        if (!xpc_dictionary_get_remote_connection(v2))
        {
          value = xpc_dictionary_get_value(v2, "connection");
          if (!value || (value = object_getClass(value), value != (void *)MEMORY[0x1E0C812E0]))
            __64__CFPDSource_asyncNotifyObserversOfWriteFromConnection_message___block_invoke_cold_1((uint64_t)value, v7, v8);
        }
        xpc_connection_get_audit_token();
      }
      v5 = DWORD1(v20);
    }
    else
    {
      v5 = getpid();
    }
    v9 = xpc_int64_create(v5);
    v10 = *(_QWORD *)(a1 + 32);
    values[5] = v9;
    *(_QWORD *)&context = v10;
    v11 = xpc_dictionary_create((const char *const *)_CFPrefsNotifyFuncKeys, values, 6uLL);
    v12 = 0;
    v13 = *(_QWORD *)(a1 + 40);
    *((_QWORD *)&context + 1) = v11;
    *(_QWORD *)&v20 = v13;
    do
    {
      v14 = values[v12];
      if (v14)
        xpc_release(v14);
      ++v12;
    }
    while (v12 != 6);
    v15 = *(void **)(a1 + 32);
    v16 = _CFPrefsDaemonLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      _extractCFPDBits(0, 0, v15, (uint64_t)&__block_literal_global_343);
    CFSetApplyFunction(*(CFSetRef *)(*(_QWORD *)(a1 + 32) + 72), (CFSetApplierFunction)notifyFunc, &context);
    xpc_release(*((xpc_object_t *)&context + 1));
  }
}

const os_unfair_lock *__80__CFPDSource_processEndOfMessageIntendingToRemoveSource_replacingWithTombstone___block_invoke(uint64_t a1)
{
  const os_unfair_lock *result;

  result = -[CFPDSource hasObservers](*(const os_unfair_lock **)(a1 + 32));
  if ((_DWORD)result)
  {
    **(_QWORD **)(a1 + 40) = -[CFPDObserverOnlyTombstone initMatchingSource:]([CFPDObserverOnlyTombstone alloc], "initMatchingSource:", *(_QWORD *)(a1 + 32));
    return (const os_unfair_lock *)objc_msgSend(**(id **)(a1 + 40), "alreadyLocked_transferObservingConnectionsFromSource:", *(_QWORD *)(a1 + 32));
  }
  return result;
}

- (const)hasObservers
{
  const os_unfair_lock *v1;

  if (result)
  {
    v1 = result;
    os_unfair_lock_assert_owner(result + 25);
    result = *(const os_unfair_lock **)&v1[18]._os_unfair_lock_opaque;
    if (result)
      return (const os_unfair_lock *)(CFSetGetCount((CFSetRef)result) > 0);
  }
  return result;
}

- (__CFString)cloudConfigurationPath
{
  return 0;
}

- (id)copyPropertyListValidatingPlist:(BOOL)a3
{

  -[CFPDSource drainPendingChanges](self, "drainPendingChanges");
  return self->_plist;
}

- (id)copyPropertyListWithoutDrainingPendingChangesValidatingPlist:(BOOL)a3 andReturnFileUID:(unsigned int *)a4 andMode:(unsigned __int16 *)a5
{
  _BOOL4 v7;
  CFPDDataBuffer *plist;
  BOOL v10;
  BOOL v11;
  NSObject *v12;
  NSObject *v13;
  __CFString *domain;
  __CFString *userName;
  CFPDDataBuffer *v16;
  unsigned __int16 v17;
  char *actualPath;
  NSObject *v20;
  char v21;
  __CFString *v22;
  const __CFString *v23;
  int v24;
  uint64_t v25;
  int v26;
  _BOOL8 v27;
  int v28;
  uid_t st_uid;
  mode_t st_mode;
  BOOL v31;
  NSObject *v32;
  NSObject *v33;
  __CFString *v34;
  __CFString *v35;
  CFPDDataBuffer *v36;
  _QWORD v37[5];
  _QWORD v38[5];
  uint8_t v39[4];
  __CFString *v40;
  __int16 v41;
  __CFString *v42;
  stat buf;
  uint64_t v44;
  CFRange v45;

  v7 = a3;
  v44 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  if (-[CFPDDataBuffer purgable](self->_plist, "purgable"))
    -[CFPDSource copyPropertyListWithoutDrainingPendingChangesValidatingPlist:andReturnFileUID:andMode:].cold.1();
  plist = self->_plist;
  if (plist)
    v10 = !v7;
  else
    v10 = 1;
  if (v10)
  {
    if (!plist)
      goto LABEL_22;
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __100__CFPDSource_copyPropertyListWithoutDrainingPendingChangesValidatingPlist_andReturnFileUID_andMode___block_invoke;
    v38[3] = &unk_1E12E5C68;
    v38[4] = self;
    -[CFPDDataBuffer quicklyValidatePlistAndOnFailureInvokeBlock:](plist, "quicklyValidatePlistAndOnFailureInvokeBlock:", v38);
  }
  else
  {
    v11 = -[CFPDDataBuffer validatePlist](plist, "validatePlist");
    v12 = _CFPrefsDaemonLog();
    v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        userName = self->_userName;
        domain = self->_domain;
        buf.st_dev = 138412546;
        *(_QWORD *)&buf.st_mode = domain;
        WORD2(buf.st_ino) = 2112;
        *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)userName;
        _os_log_impl(&dword_182A8C000, v13, OS_LOG_TYPE_INFO, "Validation of pre-existing plist succeeded. {%@ %@}", (uint8_t *)&buf, 0x16u);
      }
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[CFPDSource copyPropertyListWithoutDrainingPendingChangesValidatingPlist:andReturnFileUID:andMode:].cold.3();
      -[CFPDSource clearCacheForReason:](self, "clearCacheForReason:", CFSTR("cached plist is invalid"));
    }
  }
  v16 = self->_plist;
  if (v16)
  {
LABEL_16:
    if (a4)
      *a4 = self->_plistFileOwner;
    if (!a5)
      return v16;
    v17 = (2 * (*((_BYTE *)self + 142) & 0x80)) & 0xFFFB | (4 * (*((_BYTE *)self + 143) & 1));
    goto LABEL_20;
  }
LABEL_22:
  if (!self->_managed || CFPreferencesIsManaged(-[CFPDSource user](self, "user"), self->_managedUsesContainer))
  {
    os_unfair_lock_lock(&self->_writeLock);
    if (self->_parentFD == -1)
    {
      -[CFPDSource cacheFileInfo](self, "cacheFileInfo");
      if (self->_parentFD == -1)
        goto LABEL_39;
    }
    actualPath = self->_actualPath;
    v20 = _CFPrefsDaemonLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_QWORD *)&buf.st_dev = MEMORY[0x1E0C809B0];
      buf.st_ino = 3221225472;
      *(_QWORD *)&buf.st_uid = __DEBUG_CACHE_MISS_block_invoke;
      *(_QWORD *)&buf.st_rdev = &__block_descriptor_40_e29_v64__0i8_12_20_28_36_44_52B60l;
      buf.st_atimespec.tv_sec = (__darwin_time_t)actualPath;
      _extractCFPDBits(0, 0, self, (uint64_t)&buf);
    }
    v21 = *((_BYTE *)self + 142);
    if ((v21 & 8) == 0)
    {
      if (!strstr(self->_actualPath, "Preferences/"))
      {
        v22 = -[CFPDSource copyUncanonicalizedPath](self, "copyUncanonicalizedPath");
        if (v22
          && (v23 = v22,
              v45.length = CFStringGetLength(v22),
              v45.location = 0,
              v24 = CFStringFindWithOptions(v23, CFSTR("Preferences/"), v45, 0, 0),
              CFRelease(v23),
              v24))
        {
          v21 = *((_BYTE *)self + 142);
        }
        else
        {
          v21 = *((_BYTE *)self + 142) | 4;
        }
      }
      *((_BYTE *)self + 142) = v21 | 8;
    }
    v25 = -[CFPDSource openActualPath]((uint64_t)self);
    if ((v25 & 0x80000000) != 0)
    {
LABEL_39:
      os_unfair_lock_unlock(&self->_writeLock);
    }
    else
    {
      v26 = v25;
      v27 = !self->_managed && (*((_BYTE *)self + 142) & 4) == 0;
      v16 = +[CFPDDataBuffer newBufferFromFile:allowMappingIfSafe:](CFPDDataBuffer, "newBufferFromFile:allowMappingIfSafe:", v25, v27);
      memset(&buf, 0, sizeof(buf));
      if (v16)
      {
        v28 = fstat(v26, &buf);
        if (v28)
          st_uid = 0;
        else
          st_uid = buf.st_uid;
        if (v28)
          st_mode = 0;
        else
          st_mode = buf.st_mode;
        -[CFPDSource setPlist:owner:mode:]((uint64_t)self, v16, st_uid, st_mode);

        if (v7)
        {
          v31 = -[CFPDDataBuffer validatePlist](v16, "validatePlist");
          v32 = _CFPrefsDaemonLog();
          v33 = v32;
          if (v31)
          {
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              v35 = self->_userName;
              v34 = self->_domain;
              *(_DWORD *)v39 = 138412546;
              v40 = v34;
              v41 = 2112;
              v42 = v35;
              _os_log_impl(&dword_182A8C000, v33, OS_LOG_TYPE_INFO, "Validation of plist read from disk succeeded. {%@ %@}", v39, 0x16u);
            }
          }
          else
          {
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              -[CFPDSource copyPropertyListWithoutDrainingPendingChangesValidatingPlist:andReturnFileUID:andMode:].cold.2();
            unlinkat(self->_parentFD, self->_fileName, 0);
            -[CFPDSource clearCacheForReason:](self, "clearCacheForReason:", CFSTR("plist on disk is invalid"));
            v16 = 0;
          }
        }
        else
        {
          v36 = self->_plist;
          v37[0] = MEMORY[0x1E0C809B0];
          v37[1] = 3221225472;
          v37[2] = __100__CFPDSource_copyPropertyListWithoutDrainingPendingChangesValidatingPlist_andReturnFileUID_andMode___block_invoke_59;
          v37[3] = &unk_1E12E5C68;
          v37[4] = self;
          -[CFPDDataBuffer quicklyValidatePlistAndOnFailureInvokeBlock:](v36, "quicklyValidatePlistAndOnFailureInvokeBlock:", v37);
        }
      }
      else
      {
        -[CFPDSource setPlist:owner:mode:]((uint64_t)self, 0, 0, 0);
      }
      close(v26);
      os_unfair_lock_unlock(&self->_writeLock);
      if (v16)
        goto LABEL_16;
    }
    if (a4)
      *a4 = self->_lastEuid;
    if (!a5)
    {
      v16 = 0;
      return v16;
    }
    v17 = 384;
    if ((*((_BYTE *)self + 142) & 0x10) != 0)
    {
      v16 = 0;
    }
    else
    {
      v16 = 0;
      if (CFEqual(self->_userName, CFSTR("kCFPreferencesAnyUser")))
        v17 = 420;
      else
        v17 = 384;
    }
LABEL_20:
    *a5 = v17;
    return v16;
  }
  return 0;
}

- (int)cacheFileInfoForWriting:(BOOL)a3 euid:(unsigned int)a4 egid:(unsigned int)a5 didCreate:(BOOL *)a6
{
  const os_unfair_lock *v6;
  _BYTE *v7;
  _BYTE *v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  unsigned int v14;
  NSObject *v15;
  int v16;
  int v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int IsCFPrefsD;
  int v26;
  int v27;
  int v28;
  NSObject *v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  int v35;
  NSObject *v38;
  const char *v39;
  int v40;
  int v41;
  uint64_t v42;
  int v43;
  NSObject *v44;
  qos_class_t v45;
  NSObject *global_queue;
  NSObject *v48;
  int v49;
  char v51;
  char v52;
  NSObject *v53;
  const char *v54;
  char *v55;
  _QWORD handler[4];
  id v57;
  int v58;
  stat out_token;
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  char *v63;
  __int16 v64;
  char *v65;
  uint64_t v66;
  _QWORD v67[127];
  char __s1[1026];
  char __s2[1026];
  uint64_t v70;

  v6 = (const os_unfair_lock *)MEMORY[0x1E0C80A78](self, a2);
  v8 = v7;
  v10 = v9;
  v11 = (uint64_t)v6;
  v70 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(v6 + 27);
  free(*(void **)(v11 + 56));
  *(_QWORD *)(v11 + 56) = 0;
  *(_BYTE *)(v11 + 143) &= ~2u;
  free(*(void **)(v11 + 64));
  *(_QWORD *)(v11 + 64) = 0;
  v12 = *(_DWORD *)(v11 + 132);
  if ((v12 & 0x80000000) == 0)
    close(v12);
  *(_DWORD *)(v11 + 132) = -1;
  v13 = *(_DWORD *)(v11 + 128);
  if ((v13 & 0x80000000) == 0)
    close(v13);
  *(_DWORD *)(v11 + 128) = -1;
  bzero(__s2, 0x402uLL);
  if (!-[CFPDSource getUncanonicalizedPath:](v11, __s2))
  {
    v18 = _CFPrefsDaemonLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[CFPDSource cacheFileInfoForWriting:euid:egid:didCreate:].cold.7(v11, v18, v19, v20, v21, v22, v23, v24);
    return 7;
  }
  v58 = -1;
  bzero(__s1, 0x402uLL);
  bzero(&v66, 0x402uLL);
  if (v10)
  {
    v14 = atomic_load(&dword_1EDCCE384);
    if (v14 == 3)
    {
      v15 = _CFPrefsDaemonLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[CFPDSource cacheFileInfoForWriting:euid:egid:didCreate:].cold.1(v15);
      v16 = 0;
      v17 = 0;
      *__error() = 28;
      goto LABEL_70;
    }
  }
  IsCFPrefsD = _CFPrefsCurrentProcessIsCFPrefsD();
  if (byte_1EDCCE37E)
    v26 = 1;
  else
    v26 = IsCFPrefsD;
  if (v26 == 1)
  {
    if (dirname_r(__s2, (char *)&v66))
    {
      if (basename_r(__s2, __s1))
      {
        v27 = open((const char *)&v66, 1074790400);
        v58 = v27;
        if (v27 != -1)
          goto LABEL_25;
        v28 = *__error();
        v29 = _CFPrefsDaemonLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          -[CFPDSource cacheFileInfoForWriting:euid:egid:didCreate:].cold.6(v28, v29, v30);
        *__error() = v28;
      }
      else
      {
        v34 = _CFPrefsDaemonLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          -[CFPDSource cacheFileInfoForWriting:euid:egid:didCreate:].cold.5(v34);
      }
    }
    else
    {
      v33 = _CFPrefsDaemonLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        -[CFPDSource cacheFileInfoForWriting:euid:egid:didCreate:].cold.4(v33);
    }
  }
  else
  {
    v58 = -2;
    __strlcpy_chk();
  }
  v27 = v58;
  if (v58 == -1)
  {
LABEL_32:
    v17 = 0;
    v31 = -1;
    goto LABEL_39;
  }
LABEL_25:
  v31 = openat(v27, __s1, 0);
  v17 = 0;
  if (v31 != -1 || !v10)
    goto LABEL_39;
  if (*__error() != 2)
    goto LABEL_32;
  if ((*(_BYTE *)(v11 + 142) & 0x10) != 0)
  {
    v32 = 384;
  }
  else if (CFEqual(*(CFTypeRef *)(v11 + 40), CFSTR("kCFPreferencesAnyUser")))
  {
    v32 = 420;
  }
  else
  {
    v32 = 384;
  }
  v31 = openat(v58, __s1, 512, v32);
  v17 = 1;
LABEL_39:
  if (v31 < 0)
    v35 = v10;
  else
    v35 = 0;
  if (v35 != 1)
    goto LABEL_65;
  if (*__error() != 2 && *__error() != 20)
    goto LABEL_69;
  if (v66 == 0x7972617262694C2FLL
    && v67[0] == 0x657265666572502FLL
    && *(_QWORD *)((char *)v67 + 5) == 0x7365636E657265)
  {
    if (!_CFPrefsCreatePreferencesDirectory((const char *)&v66))
      goto LABEL_69;
    if ((*(_BYTE *)(v11 + 142) & 0x10) != 0)
    {
      v42 = 384;
    }
    else if (CFEqual(*(CFTypeRef *)(v11 + 40), CFSTR("kCFPreferencesAnyUser")))
    {
      v42 = 420;
    }
    else
    {
      v42 = 384;
    }
    v31 = openat(v58, __s1, 512, v42);
    v17 = 1;
LABEL_65:
    if ((v31 & 0x80000000) == 0)
    {
      bzero(buf, 0x402uLL);
      if (fcntl(v31, 50, buf) == -1)
      {
        if ((v58 & 0x80000000) == 0)
          close(v58);
        close(v31);
        v48 = _CFPrefsDaemonLog();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          -[CFPDSource cacheFileInfoForWriting:euid:egid:didCreate:].cold.2((uint64_t)__s2, v48);
      }
      else
      {
        *(_DWORD *)(v11 + 128) = v58;
        *(_QWORD *)(v11 + 64) = strdup(__s1);
        *(_QWORD *)(v11 + 56) = strdup((const char *)buf);
        if (_canDup())
          *(_DWORD *)(v11 + 132) = v31;
        else
          close(v31);
        if (!strcmp((const char *)buf, __s2))
        {
          v52 = *(_BYTE *)(v11 + 143) & 0xFD;
        }
        else
        {
          memset(&out_token, 0, sizeof(out_token));
          v49 = lstat(__s2, &out_token);
          if ((out_token.st_mode & 0xF000) == 0xA000 && v49 == 0)
            v51 = 2;
          else
            v51 = 0;
          v52 = v51 | *(_BYTE *)(v11 + 143) & 0xFD;
        }
        *(_BYTE *)(v11 + 143) = v52;
        if (((v35 | v10 ^ 1) & 1) != 0 || !sandbox_passthrough_access())
        {
          v16 = 0;
          if (!v17)
            return v16;
          goto LABEL_102;
        }
        v53 = _CFPrefsDaemonLog();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          -[CFPDSource cacheFileInfoForWriting:euid:egid:didCreate:].cold.3();
      }
      v16 = 7;
      if (!v17)
        return v16;
LABEL_102:
      *v8 = 1;
      return v16;
    }
LABEL_69:
    v16 = 0;
LABEL_70:
    v41 = 1;
    goto LABEL_71;
  }
  v38 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    if (v17)
      v39 = "create";
    else
      v39 = "open";
    v40 = *__error();
    *(_DWORD *)buf = 136446723;
    v61 = v39;
    v62 = 2081;
    v63 = __s2;
    v64 = 1024;
    LODWORD(v65) = v40;
    _os_log_impl(&dword_182A8C000, v38, OS_LOG_TYPE_INFO, "Couldn't %{public}s %{private}s due to %{darwin.errno}d. Asking client to create directory.", buf, 0x1Cu);
  }
  v41 = 0;
  v16 = 5;
LABEL_71:
  if ((v58 & 0x80000000) == 0)
    close(v58);
  if (v41)
  {
    v43 = *__error();
    v44 = _CFPrefsDaemonLog();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    {
      if (v17)
        v54 = "create";
      else
        v54 = "open";
      v55 = strerror(v43);
      *(_DWORD *)buf = 136446723;
      v61 = v54;
      v62 = 2081;
      v63 = __s2;
      v64 = 2082;
      v65 = v55;
      _os_log_debug_impl(&dword_182A8C000, v44, OS_LOG_TYPE_DEBUG, "Couldn't %{public}s %{private}s due to %{public}s", buf, 0x20u);
    }
    if (v43 == 1
      && (cacheFileInfoForWriting_euid_egid_didCreate__deviceEverUnlocked & 1) == 0
      && (*(_BYTE *)(v11 + 142) & 0x20) == 0)
    {
      *(_BYTE *)(v11 + 142) |= 0x20u;
      out_token.st_dev = 0;
      objc_initWeak((id *)buf, (id)v11);
      v45 = qos_class_main();
      global_queue = dispatch_get_global_queue(v45, 2uLL);
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __58__CFPDSource_cacheFileInfoForWriting_euid_egid_didCreate___block_invoke;
      handler[3] = &unk_1E1336278;
      objc_copyWeak(&v57, (id *)buf);
      notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &out_token.st_dev, global_queue, handler);
      objc_destroyWeak(&v57);
      objc_destroyWeak((id *)buf);
    }
    return 7;
  }
  return v16;
}

- (BOOL)getUncanonicalizedPath:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  const __CFString *v5;
  CFStringEncoding v6;
  _BOOL8 v7;

  if (!a1)
    return 0;
  v4 = (os_unfair_lock_s *)(a1 + 96);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  v5 = *(const __CFString **)(a1 + 88);
  if (v5)
  {
    v6 = CFStringFileSystemEncoding();
    v7 = CFStringGetCString(v5, a2, 1024, v6) != 0;
    os_unfair_lock_unlock(v4);
    return v7;
  }
  os_unfair_lock_unlock(v4);
  return -[CFPDSource _getUncanonicalizedPath:](a1, (UInt8 *)a2);
}

- (void)setPlist:(int)a3 owner:(unsigned int)a4 mode:
{
  void *v8;

  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 108));
    if (objc_msgSend(*(id *)(a1 + 16), "purgable"))
      -[CFPDSource setPlist:owner:mode:].cold.1();
    v8 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = a2;
    if (v8)

    *(_DWORD *)(a1 + 112) = a3;
    *(_BYTE *)(a1 + 142) = (a4 >> 1) & 0x80 | *(_BYTE *)(a1 + 142) & 0x7F;
    *(_BYTE *)(a1 + 143) = *(_BYTE *)(a1 + 143) & 0xFE | ((a4 & 4) != 0);
  }
}

- (uint64_t)openActualPath
{
  int v2;
  uint64_t v3;
  int v4;
  const char *v5;

  if (!a1)
    return 0;
  v2 = *(_DWORD *)(a1 + 132);
  if (v2 == -1)
  {
    v4 = *(_DWORD *)(a1 + 128);
    if (v4 == -1 || (v5 = *(const char **)(a1 + 64)) == 0)
    {
      *__error() = 22;
      return 0xFFFFFFFFLL;
    }
    else
    {
      v3 = openat(v4, v5, 0);
      if ((_DWORD)v3 != -1 && _canDup())
        *(_DWORD *)(a1 + 132) = dup(v3);
    }
  }
  else
  {
    v3 = dup(v2);
    lseek(*(_DWORD *)(a1 + 132), 0, 0);
  }
  return v3;
}

- (void)drainPendingChanges
{
  __assert_rtn("-[CFPDSource drainPendingChanges]", "CFPDSource.m", 1744, "count % CHANGE_QUEUE_TUPLE_COUNT == 0");
}

- (void)cacheFileInfoForWriting:(uint64_t)a3 euid:egid:didCreate:.cold.6(int a1, NSObject *a2, uint64_t a3)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109120;
  v3[1] = a1;
  OUTLINED_FUNCTION_9_0(&dword_182A8C000, a2, a3, "Couldn't open parent path due to %{darwin.errno}d", (uint8_t *)v3);
  OUTLINED_FUNCTION_14();
}

- (void)clearPlist
{
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 108));

    *(_QWORD *)(a1 + 16) = 0;
    *(_DWORD *)(a1 + 112) = 0;
    *(_BYTE *)(a1 + 142) &= ~0x80u;
    *(_BYTE *)(a1 + 143) &= ~1u;
  }
}

- (void)attachSizeWarningsToReply:(unint64_t)a3 forByteCount:
{
  int64_t v4;

  if (a1)
  {
    v4 = _CFPrefsDomainSizeAcceptabilityForByteCount(a3);
    xpc_dictionary_set_int64(a2, "CFPreferencesByteCountThreshold", v4);
  }
}

- (void)finishedNonRequestWriteWithResult:(__CFDictionary *)a3
{
  -[CFPDSource lock](self, "lock");
  -[CFPDSource handleWritingResult:](self, "handleWritingResult:", a3);
  -[CFPDSource tryEndAccessingPlist]((uint64_t)self);
  -[CFPDSource unlock](self, "unlock");
}

- (void)handleWritingResult:(__CFDictionary *)a3
{
  const void *Value;
  int cachedPlistFD;
  int parentFD;
  NSObject *v8;
  __CFString *domain;
  __CFString *userName;
  int v11;
  __CFString *v12;
  __int16 v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  if (!a3)
  {
LABEL_4:
    if ((*((_BYTE *)self + 142) & 2) == 0)
    {
      cachedPlistFD = self->_cachedPlistFD;
      if ((cachedPlistFD & 0x80000000) == 0)
        close(cachedPlistFD);
      self->_cachedPlistFD = -1;
      parentFD = self->_parentFD;
      if ((parentFD & 0x80000000) == 0)
        close(parentFD);
      self->_parentFD = -1;
      free(self->_fileName);
      self->_fileName = 0;
    }
    return;
  }
  Value = CFDictionaryGetValue(a3, self);
  if (Value != (const void *)28)
  {
    if (Value)
      return;
    goto LABEL_4;
  }
  v8 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    userName = self->_userName;
    domain = self->_domain;
    v11 = 138412546;
    v12 = domain;
    v13 = 2112;
    v14 = userName;
    _os_log_impl(&dword_182A8C000, v8, OS_LOG_TYPE_INFO, "Re-marking { %@, %@ } as dirty because previous write failed with ENOSPC", (uint8_t *)&v11, 0x16u);
  }
  -[CFPDSource setDirty:](self, "setDirty:", 1);
}

- (uint64_t)validatePOSIXPermissionsForMessage:(int)a3 accessType:(int)a4 fileUID:(int)a5 mode:(_BYTE *)a6 fullyValidated:
{
  _xpc_connection_s *remote_connection;
  _xpc_connection_s *value;
  uint64_t v14;
  uint64_t v15;
  uid_t euid;
  int v17;
  int v18;
  const __CFString *v19;
  const __CFString *v20;
  uint64_t v21;
  int v22;

  if (!a1)
    return 0;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 108));
  remote_connection = xpc_dictionary_get_remote_connection(a2);
  if (!remote_connection)
  {
    value = (_xpc_connection_s *)xpc_dictionary_get_value(a2, "connection");
    if (!value
      || (remote_connection = value, value = object_getClass(value), value != (_xpc_connection_s *)MEMORY[0x1E0C812E0]))
    {
      -[CFPDSource validatePOSIXPermissionsForMessage:accessType:fileUID:mode:fullyValidated:].cold.1((uint64_t)value, v14, v15);
    }
  }
  euid = xpc_connection_get_euid(remote_connection);
  v17 = cfprefsdEuid();
  if (euid && v17 != euid && (a3 == 1 || (euid != a4 ? (v18 = 4) : (v18 = 256), (v18 & a5) == 0)))
  {
    if (-[CFPDSource _canTrustUserPropertyForPOSIXPermissionCheckForAccessType:]((const __CFString *)a1, a3))
    {
      v19 = _CFPrefsCopyUserNameForUID(euid);
      if (v19)
      {
        v20 = v19;
        if (CFEqual(*(CFTypeRef *)(a1 + 40), v19))
        {
          *a6 = 0;
          CFRelease(v20);
          return 1;
        }
        CFRelease(v20);
      }
    }
  }
  else if (!byte_1EDCCE37F)
  {
    *a6 = 0;
    return 1;
  }
  v22 = xpc_dictionary_dup_fd(a2, "CFPreferencesAccessToken");
  v21 = -[CFPDSource validateAccessToken:accessType:](a1, v22, a3);
  if ((v22 & 0x80000000) == 0)
    close(v22);
  *a6 = 1;
  return v21;
}

- (uint64_t)validateAccessToken:(int)a3 accessType:
{
  uint64_t v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint8_t *v10;
  NSObject *v11;
  uint32_t v12;
  const char *v13;
  char *v14;
  int v15;
  NSObject *v16;
  uint64_t v17;
  int v19;
  int v20;
  NSObject *v21;
  int v22;
  uint8_t *v23;
  int v24;
  NSObject *v25;
  NSObject *v26;
  int v27;
  const char *v28;
  NSObject *v29;
  uint8_t *v30;
  NSObject *v31;
  const char *v32;
  NSObject *v33;
  uint8_t v34[4];
  char *v35;
  __int16 v36;
  uint8_t *v37;
  uint8_t buf[4];
  char *v39;
  __int16 v40;
  uint64_t v41;
  stat v42;
  stat v43;
  char __s2[1024];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (a2 == -1)
    return 4;
  if (a3)
    v6 = 3;
  else
    v6 = 2;
  bzero(__s2, 0x400uLL);
  if ((a2 & 0x80000000) == 0)
  {
    memset(&v43, 0, sizeof(v43));
    if (fstat(a2, &v43))
    {
      v7 = _CFPrefsDaemonLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = *__error();
        *(_DWORD *)buf = 67109120;
        LODWORD(v39) = v8;
        v9 = "Failed access token check because fstat failed: %{darwin.errno}d";
LABEL_12:
        v10 = buf;
        v11 = v7;
        v12 = 8;
LABEL_13:
        _os_log_impl(&dword_182A8C000, v11, OS_LOG_TYPE_INFO, v9, v10, v12);
        return v6;
      }
      return v6;
    }
    if (fcntl(a2, 50, __s2) == -1)
    {
      v7 = _CFPrefsDaemonLog();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        return v6;
      v15 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v39) = v15;
      v9 = "Failed access token check because F_GETPATH failed: %{darwin.errno}d";
      goto LABEL_12;
    }
    v13 = *(const char **)(a1 + 56);
    if (v13)
      v14 = strdup(v13);
    else
      v14 = 0;
    if (*(_DWORD *)(a1 + 128) == -1)
    {
      objc_msgSend((id)a1, "cacheFileInfo");
      if (*(_DWORD *)(a1 + 128) == -1)
      {
        v25 = _CFPrefsDaemonLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_182A8C000, v25, OS_LOG_TYPE_INFO, "Failed access token check because cacheFileInfo failed", buf, 2u);
        }
        free(v14);
        return v6;
      }
    }
    if (v14 && strcmp(*(const char **)(a1 + 56), v14))
    {
      v16 = _CFPrefsDaemonLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 136315394;
        v39 = v14;
        v40 = 2080;
        v41 = v17;
        _os_log_impl(&dword_182A8C000, v16, OS_LOG_TYPE_INFO, "Failed access token check because _actualPath has changed since the last-known path (%s vs %s)", buf, 0x16u);
      }
      objc_msgSend((id)a1, "clearCacheForReason:", CFSTR("observed actual path changed"));
      free(v14);
      return 4;
    }
    free(v14);
    if (byte_1EDCCE381)
    {
      objc_msgSend((id)a1, "setDirty:", 1);
      objc_msgSend((id)a1, "syncWriteToDisk");
      objc_msgSend((id)a1, "cacheFileInfo");
      byte_1EDCCE381 = 0;
    }
    v19 = -[CFPDSource openActualPath](a1);
    if (v19 == -1)
    {
      v7 = _CFPrefsDaemonLog();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        return v6;
      v24 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v39) = v24;
      v9 = "Failed access token check because the file could not be opened: %{darwin.errno}d";
      goto LABEL_12;
    }
    v20 = v19;
    memset(&v42, 0, sizeof(v42));
    if (fstat(v19, &v42))
    {
      v21 = _CFPrefsDaemonLog();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
LABEL_36:
        close(v20);
        return v6;
      }
      v22 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v39) = v22;
      v23 = buf;
LABEL_35:
      _os_log_impl(&dword_182A8C000, v21, OS_LOG_TYPE_INFO, "Failed access token check because F_GETPATH failed: %{darwin.errno}d", v23, 8u);
      goto LABEL_36;
    }
    bzero(buf, 0x400uLL);
    if (fcntl(v20, 50, buf) == -1)
    {
      v21 = _CFPrefsDaemonLog();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        goto LABEL_36;
      v27 = *__error();
      *(_DWORD *)v34 = 67109120;
      LODWORD(v35) = v27;
      v23 = v34;
      goto LABEL_35;
    }
    close(v20);
    if (strcmp((const char *)buf, __s2))
    {
      v26 = _CFPrefsDaemonLog();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        return v6;
      *(_DWORD *)v34 = 136315394;
      v35 = __s2;
      v36 = 2080;
      v37 = buf;
      v9 = "Failed access token check because path of token doesn't match verification path (%s vs %s)";
      v10 = v34;
      v11 = v26;
      v12 = 22;
      goto LABEL_13;
    }
    v28 = *(const char **)(a1 + 56);
    if (!v28 || strcmp((const char *)buf, v28))
    {
      v29 = _CFPrefsDaemonLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v30 = *(uint8_t **)(a1 + 56);
        *(_DWORD *)v34 = 136315394;
        v35 = __s2;
        v36 = 2080;
        v37 = v30;
        _os_log_impl(&dword_182A8C000, v29, OS_LOG_TYPE_INFO, "Failed access token check because verification path doesn't match known actual path (%s vs %s)", v34, 0x16u);
      }
      objc_msgSend((id)a1, "clearCacheForReason:", CFSTR("observed actual path changed"));
      return v6;
    }
    if (v42.st_dev == v43.st_dev && v42.st_ino == v43.st_ino)
    {
      if (v42.st_nlink)
      {
        if (a3 != 1 || (fcntl(a2, 3, 0) & 3) == 2)
          return 1;
        v33 = _CFPrefsDaemonLog();
        if (!os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          return v6;
        *(_WORD *)v34 = 0;
        v9 = "Failed access token check because the it was not opened for writing";
        v10 = v34;
        v11 = v33;
        v12 = 2;
        goto LABEL_13;
      }
      v31 = _CFPrefsDaemonLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v34 = 0;
        v32 = "Failed access token check because the file it references has been unlinked";
        goto LABEL_61;
      }
    }
    else
    {
      v31 = _CFPrefsDaemonLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v34 = 0;
        v32 = "Failed access token check because inode of token doesn't match verification inode";
LABEL_61:
        _os_log_impl(&dword_182A8C000, v31, OS_LOG_TYPE_INFO, v32, v34, 2u);
      }
    }
    return 4;
  }
  v7 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v39) = a2;
    v9 = "Failed access token check because %d is invalid";
    goto LABEL_12;
  }
  return v6;
}

- (const)_canTrustUserPropertyForPOSIXPermissionCheckForAccessType:(const __CFString *)result
{
  __CFString *v2;
  const __CFString *data;
  const __CFString *v5;
  char buffer[1026];
  uint64_t v8;
  CFRange v9;

  v8 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = (__CFString *)result;
    result = (const __CFString *)result[1].data;
    if (result)
    {
      if (CFStringHasPrefix(result, CFSTR("/")))
        return 0;
      data = (const __CFString *)v2[1].data;
      v9.length = CFStringGetLength(data);
      v9.location = 0;
      if (CFStringFindWithOptions(data, CFSTR(".."), v9, 0, 0))
        return 0;
      v5 = (const __CFString *)-[__CFString container](v2, "container");
      if (v5 && (!CFStringGetFileSystemRepresentation(v5, buffer, 1024) || (getpid(), sandbox_check())))
        return 0;
      else
        return (const __CFString *)((v2[4].info & 0x200000000000000) == 0 || a2 != 0);
    }
  }
  return result;
}

- (void)setObserved:(void *)a3 bySenderOfMessage:
{
  _xpc_connection_s *remote_connection;
  _xpc_connection_s *value;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  os_unfair_lock_s *v11;
  _QWORD v12[7];
  char v13;
  _QWORD v14[5];
  char v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_assert_owner(a1 + 27);
    remote_connection = xpc_dictionary_get_remote_connection(a3);
    if (!remote_connection)
    {
      value = (_xpc_connection_s *)xpc_dictionary_get_value(a3, "connection");
      if (!value
        || (remote_connection = value, value = object_getClass(value), value != (_xpc_connection_s *)MEMORY[0x1E0C812E0]))
      {
        -[CFPDSource setObserved:bySenderOfMessage:].cold.1((uint64_t)value, v8, v9);
      }
    }
    v10 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __44__CFPDSource_setObserved_bySenderOfMessage___block_invoke;
    v14[3] = &unk_1E13363C0;
    v15 = a2;
    v14[4] = a1;
    if (withClientContext(remote_connection, (uint64_t)v14))
    {
      v12[0] = v10;
      v12[1] = 3221225472;
      v12[2] = __44__CFPDSource_setObserved_bySenderOfMessage___block_invoke_2;
      v12[3] = &unk_1E13363E8;
      v13 = a2;
      v12[4] = a1;
      v12[5] = a3;
      v11 = (os_unfair_lock_s *)&a1[25];
      v12[6] = remote_connection;
      os_unfair_lock_lock(v11);
      __44__CFPDSource_setObserved_bySenderOfMessage___block_invoke_2((uint64_t)v12);
      os_unfair_lock_unlock(v11);
    }
  }
}

void __44__CFPDSource_setObserved_bySenderOfMessage___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  __int128 *data;
  __int128 v8;
  void *value;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;
  NSObject *v14;
  size_t length;
  __int128 v16;
  __int128 v17;
  void *v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[9];
  if (*(_BYTE *)(a1 + 56))
  {
    if (!v3)
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = CFSetCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeSetCallBacks);
      v2 = *(_QWORD **)(a1 + 32);
    }
    v4 = *(void **)(a1 + 40);
    v5 = _CFPrefsDaemonLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      _extractCFPDBits(v4, 0, v2, (uint64_t)&__block_literal_global_358);
    CFSetAddValue(*(CFMutableSetRef *)(*(_QWORD *)(a1 + 32) + 72), *(const void **)(a1 + 48));
  }
  else if (v3)
  {
    v6 = *(void **)(a1 + 40);
    length = 0;
    v16 = 0u;
    v17 = 0u;
    data = (__int128 *)xpc_dictionary_get_data(v6, "CFPreferencesAuditToken", &length);
    if (data && length == 32)
    {
      v8 = data[1];
      v16 = *data;
      v17 = v8;
    }
    else
    {
      if (!xpc_dictionary_get_remote_connection(v6))
      {
        value = xpc_dictionary_get_value(v6, "connection");
        if (!value || (value = object_getClass(value), value != (void *)MEMORY[0x1E0C812E0]))
          __44__CFPDSource_setObserved_bySenderOfMessage___block_invoke_2_cold_1((uint64_t)value, v10, v11);
      }
      xpc_connection_get_audit_token();
    }
    v12 = DWORD1(v17);
    v13 = *(void **)(a1 + 32);
    v14 = _CFPrefsDaemonLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_QWORD *)&v16 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v16 + 1) = 3221225472;
      *(_QWORD *)&v17 = __DEBUG_STOPPED_OBSERVING_block_invoke;
      *((_QWORD *)&v17 + 1) = &unk_1E1336890;
      v18 = v6;
      v19 = v12;
      _extractCFPDBits(v6, 0, v13, (uint64_t)&v16);
    }
    -[CFPDSource stopNotifyingObserver:](*(_QWORD *)(a1 + 32), *(const void **)(a1 + 48));
  }
}

- (void)clearCacheForReason:(__CFString *)a3
{
  NSObject *v5;
  OS_xpc_object *pendingChangesQueue;
  int parentFD;
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v5 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __DEBUG_CACHE_EVICT_block_invoke;
    v8[3] = &__block_descriptor_40_e29_v64__0i8_12_20_28_36_44_52B60l;
    v8[4] = a3;
    _extractCFPDBits(0, 0, self, (uint64_t)v8);
  }
  -[CFPDSource setDirty:](self, "setDirty:", 0);
  pendingChangesQueue = self->_pendingChangesQueue;
  if (pendingChangesQueue)
    xpc_release(pendingChangesQueue);
  -[CFPDSource clearPlist]((uint64_t)self);
  self->_pendingChangesQueue = 0;
  self->_pendingChangesSize = 0;
  free(self->_actualPath);
  self->_actualPath = 0;
  *((_BYTE *)self + 143) &= ~2u;
  free(self->_fileName);
  self->_fileName = 0;
  parentFD = self->_parentFD;
  if ((parentFD & 0x80000000) == 0)
    close(parentFD);
  self->_parentFD = -1;
}

uint64_t __49__CFPDSource_respondToFileWrittenToBehindOurBack__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "syncWriteToDiskAndFlushCacheForReason:", CFSTR("client invalidated domain"));
  objc_msgSend(*(id *)(a1 + 32), "updateShmemEntry");
  return objc_msgSend(*(id *)(a1 + 32), "asyncNotifyObserversOfWriteFromConnection:message:", 0, 0);
}

- (void)syncWriteToDisk
{
  uint64_t (**v3)(void);
  const void *v4;
  uint64_t (**v5)(void);

  v3 = -[CFPDSource createDiskWrite](self, "createDiskWrite");
  if (v3)
  {
    v5 = v3;
    v4 = (const void *)v3[2]();
    -[CFPDSource handleWritingResult:](self, "handleWritingResult:", v4);
    v3 = v5;
    if (v4)
    {
      CFRelease(v4);
      v3 = v5;
    }
  }

}

- (id)createDiskWrite
{
  char *actualPath;
  size_t v4;
  CFURLRef v5;
  unsigned int lastEgid;
  uint64_t lastEuid;
  __int16 v8;
  int v9;
  uint64_t v10;
  CFPDDataBuffer *v11;
  int v12;
  int parentFD;
  int v14;
  int *v15;
  char *v17;
  _QWORD v18[8];
  int v19;
  int v20;
  unsigned int v21;
  int v22;
  __int16 v23;
  char v24;
  char __dst[512];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  if (-[CFPDDataBuffer purgable](self->_plist, "purgable"))
    -[CFPDSource createDiskWrite].cold.1();
  -[CFPDSource drainPendingChanges](self, "drainPendingChanges");
  os_unfair_lock_lock(&self->_writeLock);
  if ((*((_BYTE *)self + 142) & 2) == 0)
    goto LABEL_16;
  if (!self->_plist)
    goto LABEL_16;
  if (self->_parentFD == -1)
    goto LABEL_16;
  actualPath = self->_actualPath;
  if (!actualPath)
    goto LABEL_16;
  v4 = strlen(self->_actualPath);
  v5 = CFURLCreateFromFileSystemRepresentation((CFAllocatorRef)&__kCFAllocatorSystemDefault, (const UInt8 *)actualPath, v4, 0);
  lastEuid = self->_lastEuid;
  lastEgid = self->_lastEgid;
  v8 = 384;
  if ((*((_BYTE *)self + 142) & 0x10) == 0)
  {
    if (CFEqual(self->_userName, CFSTR("kCFPreferencesAnyUser")))
      v8 = 420;
    else
      v8 = 384;
  }
  v9 = _CFPrefsTemporaryFDToWriteTo((uint64_t)v5, lastEuid);
  CFRelease(v5);
  if (v9 < 0)
  {
    v15 = __error();
    -[CFPDSource setDirty:](self, "setDirty:", -[CFPDSource shouldStayDirtyAfterOpenForWritingFailureWithErrno:]((uint64_t)self, *v15));
LABEL_16:
    os_unfair_lock_unlock(&self->_writeLock);
    return 0;
  }
  memcpy(__dst, "CFPrefs domain writing: ", sizeof(__dst));
  if (!CFStringGetCString(self->_domain, &__dst[24], 488, 0x8000100u))
    __strncat_chk();
  v10 = os_transaction_create();
  v11 = self->_plist;
  v12 = (*((unsigned __int8 *)self + 142) >> 6) & 1;
  parentFD = self->_parentFD;
  if (parentFD == -2)
    v14 = -2;
  else
    v14 = dup(parentFD);
  v17 = strdup(self->_fileName);
  -[CFPDSource setDirty:](self, "setDirty:", 0);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __29__CFPDSource_createDiskWrite__block_invoke;
  v18[3] = &unk_1E13362C0;
  v19 = v9;
  v20 = lastEuid;
  v23 = v8;
  v24 = v12;
  v21 = lastEgid;
  v22 = v14;
  v18[4] = v11;
  v18[5] = self;
  v18[6] = v10;
  v18[7] = v17;
  return (id)objc_msgSend(v18, "copy");
}

- (BOOL)enqueueNewKey:(id)a3 value:(id)a4 encoding:(int)a5 inBatch:(BOOL)a6 fromMessage:(id)a7
{
  OS_xpc_object *pendingChangesQueue;
  size_t count;
  size_t v15;
  size_t v16;
  xpc_object_t value;
  size_t v18;
  uint64_t v19;
  xpc_object_t v20;
  uint64_t v21;
  uint64_t v22;
  OS_xpc_object *v23;
  _QWORD applier[7];

  applier[6] = *MEMORY[0x1E0C80C00];
  if (object_getClass(a3) != (Class)MEMORY[0x1E0C81390])
    -[CFPDSource enqueueNewKey:value:encoding:inBatch:fromMessage:].cold.2();
  if (a5 == 1)
  {
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 3221225472;
    applier[2] = __63__CFPDSource_enqueueNewKey_value_encoding_inBatch_fromMessage___block_invoke;
    applier[3] = &unk_1E1336340;
    applier[4] = self;
    applier[5] = a7;
    xpc_dictionary_apply(a4, applier);
  }
  else
  {
    pendingChangesQueue = self->_pendingChangesQueue;
    if (!pendingChangesQueue)
    {
      pendingChangesQueue = (OS_xpc_object *)xpc_array_create(0, 0);
      self->_pendingChangesQueue = pendingChangesQueue;
    }
    count = xpc_array_get_count(pendingChangesQueue);
    v15 = count;
    if ((count & 1) != 0)
      -[CFPDSource enqueueNewKey:value:encoding:inBatch:fromMessage:].cold.1();
    if (count)
    {
      v16 = 1;
      while (1)
      {
        value = xpc_array_get_value(self->_pendingChangesQueue, v16 - 1);
        if (xpc_equal(a3, value))
          break;
        v18 = v16 + 1;
        v16 += 2;
        if (v18 >= v15)
          goto LABEL_11;
      }
      v20 = xpc_array_get_value(self->_pendingChangesQueue, v16);
      v21 = _CFPrefsSizeOfValue(a4, 0);
      v22 = v21 - _CFPrefsSizeOfValue(v20, 0);
      v23 = self->_pendingChangesQueue;
      self->_pendingChangesSize += v22;
      xpc_array_set_value(v23, v16, a4);
    }
    else
    {
LABEL_11:
      xpc_array_append_value(self->_pendingChangesQueue, a3);
      xpc_array_append_value(self->_pendingChangesQueue, a4);
      if (object_getClass(a4) != (Class)MEMORY[0x1E0C81350])
      {
        v19 = _CFPrefsSizeOfValue(a4, 0);
        self->_pendingChangesSize += _CFPrefsSizeOfValue(a3, 0) + v19;
      }
    }
  }
  -[CFPDSource setDirty:](self, "setDirty:", 1);
  if (!a6 && self->_pendingChangesSize > 0x20000)
  {

    self->_pendingChangesSize = 0;
  }
  return 1;
}

- (void)setDirty:(BOOL)a3
{
  _BOOL4 v3;
  char v5;
  char v6;
  uint64_t v7;
  char __dst[512];
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  if (v3)
    -[CFPDSource updateShmemEntry](self, "updateShmemEntry");
  v5 = *((_BYTE *)self + 142);
  if (((((v5 & 2) == 0) ^ v3) & 1) == 0)
  {
    if (v3)
      v6 = 2;
    else
      v6 = 0;
    *((_BYTE *)self + 142) = v5 & 0xFD | v6;
    if (v3)
    {
      v7 = +[_CFPrefsSynchronizer sharedInstance]();
      -[_CFPrefsSynchronizer noteDirtySource:](v7, self);
      memcpy(__dst, "CFPrefs domain dirty: ", sizeof(__dst));
      if (!CFStringGetCString(self->_domain, &__dst[22], 490, 0x8000100u))
        __strncat_chk();
      self->_dirtyTransaction = (OS_os_transaction *)os_transaction_create();
    }
    else
    {

      self->_dirtyTransaction = 0;
    }
  }
}

- (void)updateShmemEntry
{
  -[CFPrefsDaemon updateShmemIndex:]((uint64_t)self->_cfprefsd, self->_generationShmemIndex);
}

- (void)syncWriteToDiskAndFlushCacheForReason:(__CFString *)a3
{
  -[CFPDSource syncWriteToDisk](self, "syncWriteToDisk");
  -[CFPDSource clearCacheForReason:](self, "clearCacheForReason:", a3);
}

CFDictionaryRef __29__CFPDSource_createDiskWrite__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  int v4;
  const void *v6[6];

  v6[5] = *(const void **)MEMORY[0x1E0C80C00];
  v2 = _CFPrefsWritePlistToFDThenClose(*(void **)(a1 + 32), *(_DWORD *)(a1 + 64), *(_DWORD *)(a1 + 68), *(_DWORD *)(a1 + 72), *(_WORD *)(a1 + 80), *(unsigned __int8 *)(a1 + 82), *(_DWORD *)(a1 + 76), *(const char **)(a1 + 56));
  if (v2 == 47837)
  {
    v3 = *(void **)(a1 + 40);
    if (v3)
    {
      v6[0] = (const void *)MEMORY[0x1E0C809B0];
      v6[1] = (const void *)3221225472;
      v6[2] = __55__CFPDSource_markNeedsToReloadFromDiskDueToFailedWrite__block_invoke;
      v6[3] = &unk_1E12E5C68;
      v6[4] = v3;
      objc_msgSend(v3, "lockedAsync:", v6);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 104));

  v4 = *(_DWORD *)(a1 + 76);
  if ((v4 & 0x80000000) == 0)
    close(v4);
  free(*(void **)(a1 + 56));

  if (!v2)
    return 0;
  v6[0] = (const void *)v2;
  return CFDictionaryCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (const void **)(a1 + 40), v6, 1, 0, 0);
}

- (void)cleanUpIfNecessaryAfterCreatingPlist
{
  int *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = OUTLINED_FUNCTION_12();
  strerror(*v3);
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_0_32(&dword_182A8C000, a2, v4, "couldn't stat file at %{private}s due to \"%{public}s\", v5);
  OUTLINED_FUNCTION_6_3();
}

id __58__CFPDSource_cacheFileInfoForWriting_euid_egid_didCreate___block_invoke(uint64_t a1, int token)
{
  id result;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  notify_cancel(token);
  cacheFileInfoForWriting_euid_egid_didCreate__deviceEverUnlocked = 1;
  result = objc_loadWeak((id *)(a1 + 32));
  if (result)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __32__CFPDSource_handleDeviceUnlock__block_invoke;
    v4[3] = &unk_1E12E5C68;
    v4[4] = result;
    return (id)objc_msgSend(result, "lockedSync:", v4);
  }
  return result;
}

- (void)handleDeviceUnlock
{
  _QWORD v1[6];

  v1[5] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1[0] = MEMORY[0x1E0C809B0];
    v1[1] = 3221225472;
    v1[2] = __32__CFPDSource_handleDeviceUnlock__block_invoke;
    v1[3] = &unk_1E12E5C68;
    v1[4] = result;
    return (void *)objc_msgSend(result, "lockedSync:", v1);
  }
  return result;
}

- (id)description
{
  return -[CFPDSource debugDump](self, "debugDump");
}

- (uint64_t)shouldStayDirtyAfterOpenForWritingFailureWithErrno:(uint64_t)a1
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = _CFPrefsDaemonLog();
  v5 = v4;
  if (a2 != 28)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[CFPDSource shouldStayDirtyAfterOpenForWritingFailureWithErrno:].cold.1(a1, a2, v5);
    return 0;
  }
  v6 = 1;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v8 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_182A8C000, v5, OS_LOG_TYPE_INFO, "Re-marking { %@, %@ } as dirty because attempt to open temporary path failed with ENOSPC", (uint8_t *)&v10, 0x16u);
  }
  return v6;
}

- (void)markNeedsToReloadFromDiskDueToFailedWrite
{
  _QWORD v1[6];

  v1[5] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1[0] = MEMORY[0x1E0C809B0];
    v1[1] = 3221225472;
    v1[2] = __55__CFPDSource_markNeedsToReloadFromDiskDueToFailedWrite__block_invoke;
    v1[3] = &unk_1E12E5C68;
    v1[4] = result;
    return (void *)objc_msgSend(result, "lockedAsync:", v1);
  }
  return result;
}

uint64_t __55__CFPDSource_markNeedsToReloadFromDiskDueToFailedWrite__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "clearCacheForReason:", CFSTR("previous error"));
  return objc_msgSend(*(id *)(a1 + 32), "updateShmemEntry");
}

uint64_t __32__CFPDSource_handleDeviceUnlock__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD **)(a1 + 32);
    v5 = v3[5];
    v4 = v3[6];
    v7 = 138412802;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    v11 = 2112;
    v12 = objc_msgSend(v3, "container");
    _os_log_impl(&dword_182A8C000, v2, OS_LOG_TYPE_INFO, "Responding to device unlock to refresh preferences reads previously denied by data protection { %@, %@, %@ }", (uint8_t *)&v7, 0x20u);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 142) &= ~0x20u;
  objc_msgSend(*(id *)(a1 + 32), "syncWriteToDiskAndFlushCacheForReason:", CFSTR("device was unlocked"));
  objc_msgSend(*(id *)(a1 + 32), "updateShmemEntry");
  return objc_msgSend(*(id *)(a1 + 32), "asyncNotifyObserversOfWriteFromConnection:message:", 0, 0);
}

void __100__CFPDSource_copyPropertyListWithoutDrainingPendingChangesValidatingPlist_andReturnFileUID_andMode___block_invoke()
{
  NSObject *v0;

  v0 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __100__CFPDSource_copyPropertyListWithoutDrainingPendingChangesValidatingPlist_andReturnFileUID_andMode___block_invoke_cold_1();
}

void __100__CFPDSource_copyPropertyListWithoutDrainingPendingChangesValidatingPlist_andReturnFileUID_andMode___block_invoke_59()
{
  NSObject *v0;

  v0 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __100__CFPDSource_copyPropertyListWithoutDrainingPendingChangesValidatingPlist_andReturnFileUID_andMode___block_invoke_59_cold_1();
}

void __33__CFPDSource_drainPendingChanges__block_invoke()
{
  NSObject *v0;

  v0 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __33__CFPDSource_drainPendingChanges__block_invoke_cold_1();
}

uint64_t __63__CFPDSource_enqueueNewKey_value_encoding_inBatch_fromMessage___block_invoke(uint64_t a1, char *string, uint64_t a3)
{
  xpc_object_t v5;

  v5 = xpc_string_create(string);
  objc_msgSend(*(id *)(a1 + 32), "enqueueNewKey:value:encoding:inBatch:fromMessage:", v5, a3, 0, 1, *(_QWORD *)(a1 + 40));
  xpc_release(v5);
  return 1;
}

- (__CFString)debugDump
{
  __CFString *v3;
  __CFString *userName;
  __CFString *domain;
  CFPDDataBuffer *plist;
  uint64_t generationShmemIndex;
  unsigned int v8;
  uint64_t v9;
  _BOOL8 byHost;
  uint64_t v11;
  __CFString *v12;

  v3 = -[CFPDSource copyUncanonicalizedPath](self, "copyUncanonicalizedPath");
  userName = self->_userName;
  domain = self->_domain;
  plist = self->_plist;
  generationShmemIndex = self->_generationShmemIndex;
  v8 = *((unsigned __int8 *)self + 142);
  v9 = (v8 >> 1) & 1;
  byHost = self->_byHost;
  v11 = 384;
  if ((v8 & 0x10) == 0)
  {
    if (CFEqual(userName, CFSTR("kCFPreferencesAnyUser")))
      v11 = 420;
    else
      v11 = 384;
  }
  v12 = (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("\n*****************************************************\nDomain: %@\nUser: %@\nPath: %@\nplist data:%@\nshmem index:%d\ndirty:%d\nbyHost:%d\nmode:%o\n"), domain, userName, v3, plist, generationShmemIndex, v9, byHost, v11);
  if (v3)
    CFRelease(v3);
  return v12;
}

- (void)lockedAsync:(id)a3
{
  dispatch_block_t v3;
  qos_class_t v4;
  NSObject *global_queue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__CFPDSource_lockedAsync___block_invoke;
  block[3] = &unk_1E1336368;
  block[4] = self;
  block[5] = a3;
  v3 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, block);
  v4 = qos_class_self();
  global_queue = dispatch_get_global_queue(v4, 0);
  dispatch_async(global_queue, v3);

}

uint64_t __26__CFPDSource_lockedAsync___block_invoke(uint64_t a1)
{
  os_unfair_lock *v1;
  uint64_t v2;

  v1 = *(os_unfair_lock **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  -[os_unfair_lock lock](v1, "lock");
  -[CFPDSource beginHandlingRequest]((uint64_t)v1);
  (*(void (**)(uint64_t))(v2 + 16))(v2);
  -[CFPDSource endHandlingRequest](v1);
  return -[os_unfair_lock unlock](v1, "unlock");
}

uint64_t __118__CFPDSource_validateMessage_withNewKey_newValue_plistIsAvailableToRead_containerPath_fileUID_mode_diagnosticMessage___block_invoke(uint64_t a1, char *__s2)
{
  uint64_t v3;
  BOOL v4;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v3 + 24))
    v4 = isSpecialKey(__s2);
  else
    v4 = 0;
  *(_BYTE *)(v3 + 24) = v4;
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

- (void)handleAvoidCache
{
  if (result)
    return (void *)objc_msgSend(result, "syncWriteToDiskAndFlushCacheForReason:", CFSTR("we're avoiding the cache"));
  return result;
}

- (void)handleNeverCache
{
  if (result)
    return (void *)objc_msgSend(result, "syncWriteToDiskAndFlushCacheForReason:", CFSTR("we're never caching"));
  return result;
}

- (void)handleEUIDorEGIDMismatch
{
  if (result)
    return (void *)objc_msgSend(result, "syncWriteToDisk");
  return result;
}

- (void)handleSynchronous
{
  if (result)
    return (void *)objc_msgSend(result, "syncWriteToDisk");
  return result;
}

- (void)handleNoPlistFound
{
  if (result)
    return (void *)objc_msgSend(result, "syncWriteToDisk");
  return result;
}

uint64_t (*__28__CFPDSource_acceptMessage___block_invoke())(void)
{
  void *v0;
  uint64_t (*result)(void);

  v0 = dlopen("/System/Library/PrivateFrameworks/MobileKeyBag.framework/MobileKeyBag", 256);
  result = (uint64_t (*)(void))dlsym(v0, "MKBDeviceUnlockedSinceBoot");
  acceptMessage___CFMKBDeviceUnlockedSinceBoot = result;
  return result;
}

void __28__CFPDSource_acceptMessage___block_invoke_2()
{
  NSObject *v0;

  v0 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __28__CFPDSource_acceptMessage___block_invoke_2_cold_1();
}

uint64_t __28__CFPDSource_acceptMessage___block_invoke_124(uint64_t a1, int a2, xpc_object_t value)
{
  xpc_array_append_value(*(xpc_object_t *)(a1 + 32), value);
  return 1;
}

- (void)cacheFileInfoForWriting:(os_log_t)log euid:egid:didCreate:.cold.1(os_log_t log)
{
  uint8_t v1[8];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_182A8C000, log, OS_LOG_TYPE_DEBUG, "Simulating ENOSPC in cacheFileInfo for testing", v1, 2u);
  OUTLINED_FUNCTION_14();
}

- (void)cacheFileInfoForWriting:(uint64_t)a1 euid:(NSObject *)a2 egid:didCreate:.cold.2(uint64_t a1, NSObject *a2)
{
  int *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = __error();
  strerror(*v3);
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_0_32(&dword_182A8C000, a2, v4, "Couldn't get real path for %{private}s due to %{public}s", v5);
  OUTLINED_FUNCTION_6_3();
}

- (void)cacheFileInfoForWriting:euid:egid:didCreate:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_7_2(&dword_182A8C000, v0, v1, "No write access to parent directory of %{private}s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_21();
}

- (void)cacheFileInfoForWriting:(NSObject *)a1 euid:egid:didCreate:.cold.4(NSObject *a1)
{
  int v2;
  uint64_t v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *__error();
  v4[0] = 67109120;
  v4[1] = v2;
  OUTLINED_FUNCTION_9_0(&dword_182A8C000, a1, v3, "Couldn't get parent path due to %{darwin.errno}d", (uint8_t *)v4);
  OUTLINED_FUNCTION_1_21();
}

- (void)cacheFileInfoForWriting:(NSObject *)a1 euid:egid:didCreate:.cold.5(NSObject *a1)
{
  int v2;
  uint64_t v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *__error();
  v4[0] = 67109120;
  v4[1] = v2;
  OUTLINED_FUNCTION_9_0(&dword_182A8C000, a1, v3, "Couldn't get file name due to %{darwin.errno}d", (uint8_t *)v4);
  OUTLINED_FUNCTION_1_21();
}

- (void)cacheFileInfoForWriting:(uint64_t)a3 euid:(uint64_t)a4 egid:(uint64_t)a5 didCreate:(uint64_t)a6 .cold.7(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_2(&dword_182A8C000, a2, a3, "Couldn't get uncanonicalized path for domain %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_21();
}

- (void)shouldStayDirtyAfterOpenForWritingFailureWithErrno:(NSObject *)a3 .cold.1(int a1, int __errnum, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  strerror(__errnum);
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_0_32(&dword_182A8C000, a3, v4, "cfprefsd couldn't open temporary path appropriate for %{private}s for writing due to \"%{public}s\". Cancelling attempt to save preferences", v5);
  OUTLINED_FUNCTION_6_3();
}

- (void)createDiskWrite
{
  __assert_rtn("-[CFPDSource createDiskWrite]", "CFPDSource.m", 1303, "![_plist purgable]");
}

- (void)setPlist:owner:mode:.cold.1()
{
  __assert_rtn("-[CFPDSource setPlist:owner:mode:]", "CFPDSource.m", 1397, "![_plist purgable]");
}

- (void)copyPropertyListWithoutDrainingPendingChangesValidatingPlist:andReturnFileUID:andMode:.cold.1()
{
  __assert_rtn("-[CFPDSource copyPropertyListWithoutDrainingPendingChangesValidatingPlist:andReturnFileUID:andMode:]", "CFPDSource.m", 1494, "![_plist purgable]");
}

- (void)copyPropertyListWithoutDrainingPendingChangesValidatingPlist:andReturnFileUID:andMode:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_0_32(&dword_182A8C000, v0, v1, "Validation of plist read from disk failed. DELETING file. {%@ %@}", v2);
  OUTLINED_FUNCTION_1_21();
}

- (void)copyPropertyListWithoutDrainingPendingChangesValidatingPlist:andReturnFileUID:andMode:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_0_32(&dword_182A8C000, v0, v1, "Validation of pre-existing plist failed. Clearing cache and re-reading from disk. {%@ %@}", v2);
  OUTLINED_FUNCTION_1_21();
}

void __100__CFPDSource_copyPropertyListWithoutDrainingPendingChangesValidatingPlist_andReturnFileUID_andMode___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_8_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_0_32(&dword_182A8C000, v0, v1, "Found potentially bad pre-existing plist, but not clearing yet, as we weren't asked to validate {%@ %@}", v2);
  OUTLINED_FUNCTION_1_21();
}

void __100__CFPDSource_copyPropertyListWithoutDrainingPendingChangesValidatingPlist_andReturnFileUID_andMode___block_invoke_59_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_8_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_0_32(&dword_182A8C000, v0, v1, "Found potentially bad plist when reading from disk, but not deleting, because we weren't asked to validate {%@ %@}", v2);
  OUTLINED_FUNCTION_1_21();
}

void __64__CFPDSource_asyncNotifyObserversOfWriteFromConnection_message___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_2_15("_CFPrefsConnectionForMessage", "CFXPreferences_Internal.h", a3, "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

void __33__CFPDSource_drainPendingChanges__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_8_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_0_32(&dword_182A8C000, v0, v1, "Found potentially bad plist after draining pending changes {%@ %@}", v2);
  OUTLINED_FUNCTION_1_21();
}

- (void)enqueueNewKey:value:encoding:inBatch:fromMessage:.cold.1()
{
  __assert_rtn("-[CFPDSource enqueueNewKey:value:encoding:inBatch:fromMessage:]", "CFPDSource.m", 1819, "count % CHANGE_QUEUE_TUPLE_COUNT == 0");
}

- (void)enqueueNewKey:value:encoding:inBatch:fromMessage:.cold.2()
{
  __assert_rtn("-[CFPDSource enqueueNewKey:value:encoding:inBatch:fromMessage:]", "CFPDSource.m", 1801, "xpc_get_type(key) == XPC_TYPE_STRING");
}

- (void)validateSandboxForWrite:(uint64_t)a3 containerPath:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_2_15("_CFPrefsConnectionForMessage", "CFXPreferences_Internal.h", a3, "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

- (void)validateSandboxForWrite:(uint64_t)a3 containerPath:.cold.2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_2_15("_CFPrefsConnectionForMessage", "CFXPreferences_Internal.h", a3, "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

- (void)validateSandboxForRead:containerPath:.cold.1()
{
  __assert_rtn("-[CFPDSource validateSandboxForRead:containerPath:]", "CFPDSource.m", 2103, "message");
}

- (void)validateSandboxForRead:containerPath:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_32(&dword_182A8C000, v0, (uint64_t)v0, "unable to validate sandbox access of message %{private}s in container %{private}s due to no plist path, conservatively assuming not allowed.", v1);
  OUTLINED_FUNCTION_1_21();
}

- (void)validateSandboxForRead:(uint64_t)a3 containerPath:.cold.3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_2_15("_CFPrefsConnectionForMessage", "CFXPreferences_Internal.h", a3, "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

- (void)validateSandboxForRead:(uint64_t)a3 containerPath:.cold.4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_2_15("_CFPrefsConnectionForMessage", "CFXPreferences_Internal.h", a3, "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

- (void)validateSandboxForRead:containerPath:.cold.5()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_32(&dword_182A8C000, v0, (uint64_t)v0, "Initial attempt to validate sandbox access of message %{private}s in container %{private}s due to no plist path, but we recovered successfully by recalculating the path.", v1);
  OUTLINED_FUNCTION_1_21();
}

- (void)validatePOSIXPermissionsForMessage:(uint64_t)a3 accessType:fileUID:mode:fullyValidated:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_2_15("_CFPrefsConnectionForMessage", "CFXPreferences_Internal.h", a3, "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

- (void)setObserved:(uint64_t)a3 bySenderOfMessage:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_2_15("_CFPrefsConnectionForMessage", "CFXPreferences_Internal.h", a3, "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

void __44__CFPDSource_setObserved_bySenderOfMessage___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_2_15("_CFPrefsConnectionForMessage", "CFXPreferences_Internal.h", a3, "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

- (void)acceptMessage:.cold.1()
{
  __assert_rtn("-[CFPDSource acceptMessage:]", "CFPDSource.m", 2573, "![_plist purgable]");
}

- (void)acceptMessage:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_2_15("_CFPrefsConnectionForMessage", "CFXPreferences_Internal.h", a3, "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

- (void)acceptMessage:.cold.3()
{
  __assert_rtn("-[CFPDSource acceptMessage:]", "CFPDSource.m", 2755, "validity != _CFPrefsInvalidValidity");
}

- (void)acceptMessage:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_10(&dword_182A8C000, v0, v1, "unable to find user information for requested user %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_21();
}

- (void)acceptMessage:(uint64_t)a3 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_2_15("_CFPrefsConnectionForMessage", "CFXPreferences_Internal.h", a3, "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

void __28__CFPDSource_acceptMessage___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_8_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_0_32(&dword_182A8C000, v0, v1, "About to serve up potentially bad plist {%@ %@}", v2);
  OUTLINED_FUNCTION_1_21();
}

@end
