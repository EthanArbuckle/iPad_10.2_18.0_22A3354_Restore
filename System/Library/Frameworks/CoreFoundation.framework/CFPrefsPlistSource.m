@implementation CFPrefsPlistSource

- (void)copyValueForKey:(__CFString *)a3
{
  CFTypeRef v5;

  os_unfair_lock_lock(&self->super._lock);
  v5 = _copyValueForKey((uint64_t)self, a3);
  os_unfair_lock_unlock(&self->super._lock);
  return (void *)v5;
}

- (void)alreadylocked_copyValueForKey:(__CFString *)a3
{
  return (void *)_copyValueForKey((uint64_t)self, a3);
}

- (void)setBackupDisabled:(BOOL)a3
{
  atomic_store(a3, (unsigned __int8 *)&self->_disableBackup);
}

- (int)alreadylocked_updateObservingRemoteChanges
{
  unsigned __int8 v3;
  unsigned __int8 v4;
  unsigned __int8 v6;

  os_unfair_lock_assert_owner(&self->super._lock);
  if (!-[__CFPrefsWeakObservers approximateCount](self->super._observers, "approximateCount")
    || (v3 = atomic_load((unsigned __int8 *)&self->_observing), (v3 & 1) != 0))
  {
    if (-[__CFPrefsWeakObservers approximateCount](self->super._observers, "approximateCount"))
      return 0;
    v4 = atomic_load((unsigned __int8 *)&self->_observing);
    if ((v4 & 1) == 0)
      return 0;
    atomic_store(0, (unsigned __int8 *)&self->_observing);
  }
  else
  {
    atomic_store(1u, (unsigned __int8 *)&self->_observing);
  }
  if (-[CFPrefsPlistSource isVolatile](self, "isVolatile"))
    return 0;
  v6 = atomic_load((unsigned __int8 *)&self->_observing);
  if ((v6 & 1) != 0)
    return 7;
  else
    return 8;
}

- (id)alreadylocked_createObserverUpdateMessageWithOperation:(int)a3 forRole:(int *)a4
{
  id v7;
  unsigned __int8 v8;
  int v9;

  if (!a3)
    return 0;
  v7 = -[CFPrefsPlistSource createSynchronizeMessage](self, "createSynchronizeMessage");
  xpc_dictionary_set_int64(v7, "CFPreferencesOperation", a3);
  v8 = atomic_load((unsigned __int8 *)&self->_directMode);
  if ((v8 & 1) != 0 || _CFPrefsDirectMode())
  {
    v9 = 3;
  }
  else if (xpc_user_sessions_enabled()
         && (CFEqual(self->userIdentifier, CFSTR("kCFPreferencesAnyUser"))
          || !xpc_user_sessions_get_session_uid()
          && CFEqual(self->userIdentifier, CFSTR("kCFPreferencesCurrentUser"))))
  {
    v9 = 2;
  }
  else
  {
    v9 = 1;
  }
  *a4 = v9;
  return v7;
}

- (BOOL)isVolatile
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_volatile);
  return v2 & 1;
}

- (__CFDictionary)alreadylocked_copyDictionary
{
  unsigned __int8 v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  CFAbsoluteTime Current;
  double stalenessCheckWindowStart;
  __CFString *v10;
  NSObject *v11;
  __CFDictionary *dict;
  CFMutableDictionaryRef MutableCopy;
  CFMutableDictionaryRef v15;
  const __CFDictionary *v16;
  double v18;
  _BOOL4 v19;
  unsigned int stalenessCheckWindowStaleCount;
  __CFString *v22;
  NSObject *v23;
  int v24;
  objc_super v25;
  _QWORD v26[2];
  uint64_t (*v27)(uint64_t);
  void *v28;
  CFPrefsPlistSource *v29;
  uint8_t buf[4];
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  unsigned int v35;
  __int16 v36;
  unsigned int v37;
  __int16 v38;
  __CFString *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (byte_1EDCCE379)
    -[CFPrefsPlistSource alreadylocked_clearCache](self, "alreadylocked_clearCache");
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v27 = __alreadylocked_requestNewDataIfStale_block_invoke;
  v28 = &unk_1E12E5C68;
  v29 = self;
  v3 = atomic_load((unsigned __int8 *)&self->_volatile);
  if ((v3 & 1) == 0)
  {
    v4 = (unsigned int *)atomic_load((unint64_t *)&self->super.shmemEntry);
    if (!v4)
    {
      if (self->super._dict)
      {
        v10 = -[CFPrefsSource copyOSLogDescription](self, "copyOSLogDescription");
        _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
        v11 = _CFPrefsClientLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[CFPrefsPlistSource alreadylocked_copyDictionary].cold.1();
        _CFSetTSD(0xFu, 0, 0);
        CFRelease(v10);
      }
      goto LABEL_13;
    }
    v5 = atomic_load(v4);
    v6 = atomic_load((unsigned int *)&sentinelGeneration);
    if (v5 != v6)
    {
      v7 = atomic_load(&self->super.lastKnownShmemState);
      if (v5 != v7)
      {
        Current = CFAbsoluteTimeGetCurrent();
        stalenessCheckWindowStart = self->super.stalenessCheckWindowStart;
        if (stalenessCheckWindowStart == 0.0)
        {
          self->super.stalenessCheckWindowStart = Current;
          self->super.stalenessCheckWindowStaleCount = 1;
        }
        else
        {
          v18 = Current - stalenessCheckWindowStart;
          if (Current - stalenessCheckWindowStart >= 0.5)
          {
            self->super.stalenessCheckWindowStart = 0.0;
            stalenessCheckWindowStaleCount = self->super.stalenessCheckWindowStaleCount;
            v19 = stalenessCheckWindowStaleCount > 0xFA;
            if (stalenessCheckWindowStaleCount > 0xFA)
              v18 = 0.5;
          }
          else
          {
            v19 = 0;
            stalenessCheckWindowStaleCount = ++self->super.stalenessCheckWindowStaleCount;
          }
          if (stalenessCheckWindowStaleCount - 251 < 9 || v19)
          {
            v22 = -[CFPrefsSource copyOSLogDescription](self, "copyOSLogDescription");
            _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
            v23 = _CFPrefsClientLog();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              v24 = self->super.stalenessCheckWindowStaleCount;
              *(_DWORD *)buf = 67110146;
              v31 = v24;
              v32 = 1024;
              v33 = (int)(v18 * 1000.0);
              v34 = 1024;
              v35 = v5;
              v36 = 1024;
              v37 = v7;
              v38 = 2114;
              v39 = v22;
              _os_log_error_impl(&dword_182A8C000, v23, OS_LOG_TYPE_ERROR, "Source was stale %i times within the last %i ms (%i (latestGeneration) != %i (lastKnownShmemState)): %{public}@", buf, 0x24u);
            }
            _CFSetTSD(0xFu, 0, 0);
            CFRelease(v22);
          }
        }
LABEL_13:
        os_unfair_lock_assert_owner(&self->super._lock);
        v27((uint64_t)v26);
      }
    }
  }
  if (atomic_load((unint64_t *)&self->_locallySetDict))
  {
    dict = self->super._dict;
    if (dict)
      MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, dict);
    else
      MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v15 = MutableCopy;
    os_unfair_lock_lock(&locallySetDictLock);
    v16 = (const __CFDictionary *)atomic_load((unint64_t *)&self->_locallySetDict);
    CFDictionaryApplyFunction(v16, (CFDictionaryApplierFunction)locallySetValueOverlayMergeFunc, v15);
    os_unfair_lock_unlock(&locallySetDictLock);
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)CFPrefsPlistSource;
    return -[CFPrefsSource alreadylocked_copyDictionary](&v25, sel_alreadylocked_copyDictionary);
  }
  return v15;
}

- (BOOL)synchronize
{
  BOOL *p_lastWriteFailed;
  unsigned __int8 v3;
  unsigned __int8 v4;
  unsigned __int8 v5;
  BOOL result;

  p_lastWriteFailed = &self->_lastWriteFailed;
  v3 = atomic_load((unsigned __int8 *)&self->_lastWriteFailed);
  if ((v3 & 1) != 0)
  {
    result = 0;
    atomic_store(0, (unsigned __int8 *)p_lastWriteFailed);
  }
  else
  {
    v4 = atomic_load((unsigned __int8 *)&self->_volatile);
    if ((v4 & 1) != 0)
    {
      return 0;
    }
    else
    {
      v5 = atomic_load((unsigned __int8 *)&self->_readonly);
      return (v5 & 1) == 0;
    }
  }
  return result;
}

- (void)handleReply:(id)a3 toRequestNewDataMessage:(id)a4 onConnection:(id)a5 retryCount:(int)a6 error:(BOOL *)a7
{
  int v14;
  unint64_t value;
  unint64_t v16;
  int v17;
  const char *string;
  const char *v19;
  unsigned __int8 v20;
  int v21;
  uint64_t v22;
  NSObject *v23;
  int *v24;
  __CFString *Mutable;
  int v26;
  _BOOL4 v27;
  __CFString *v28;
  NSObject *v29;
  off_t st_size;
  UInt8 *v31;
  __CFString *v32;
  NSObject *v33;
  size_t count;
  __CFDictionary *v35;
  __CFString *v36;
  BOOL v37;
  size_t length;
  const UInt8 *bytes_ptr;
  const __CFData *v40;
  __CFString *v41;
  __CFString *v42;
  NSObject *v43;
  NSObject *v44;
  int v45;
  __CFString *v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  __CFString *v50;
  NSObject *v51;
  size_t v52;
  const UInt8 *v53;
  const __CFData *v54;
  const __CFDictionary *v55;
  const __CFDictionary *v56;
  __CFString *v57;
  NSObject *v58;
  NSObject *v59;
  __CFString *v60;
  BOOL v61;
  const char *v62;
  __CFString *v63;
  NSObject *v64;
  NSObject *v65;
  __CFDictionary *dict;
  int v67;
  CFMutableDictionaryRef MutableCopy;
  int64_t *p_generationCount;
  unint64_t v70;
  const char *v71;
  NSObject *v72;
  __CFString *cf;
  __CFString *cfa;
  const __CFData *data;
  id xdata;
  _QWORD context[7];
  _QWORD v78[8];
  CFErrorRef error[2];
  stat v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->super._lock);
  if (!atomic_load((unint64_t *)&self->super.shmemEntry))
  {
    string = xpc_dictionary_get_string(a3, "CFPreferencesShmemName");
    if (string)
    {
      v19 = string;
      v20 = atomic_load((unsigned __int8 *)&self->_directMode);
      if ((v20 & 1) != 0 || _CFPrefsDirectMode())
      {
        v21 = 3;
      }
      else if (xpc_user_sessions_enabled()
             && (CFEqual(self->userIdentifier, CFSTR("kCFPreferencesAnyUser"))
              || !xpc_user_sessions_get_session_uid()
              && CFEqual(self->userIdentifier, CFSTR("kCFPreferencesCurrentUser"))))
      {
        v21 = 2;
      }
      else
      {
        v21 = 1;
      }
      v22 = -[_CFXPreferences shmemForRole:name:]((uint64_t)self->super._containingPreferences, v21, v19);
      if (!v22)
      {
        Mutable = -[CFPrefsSource copyOSLogDescription](self, "copyOSLogDescription");
        _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
        v33 = _CFPrefsClientLog();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v80.st_dev = 67109634;
          *(_DWORD *)&v80.st_mode = v21;
          LOWORD(v80.st_ino) = 2082;
          *(__darwin_ino64_t *)((char *)&v80.st_ino + 2) = (__darwin_ino64_t)v19;
          HIWORD(v80.st_uid) = 2114;
          *(_QWORD *)&v80.st_gid = Mutable;
          _os_log_error_impl(&dword_182A8C000, v33, OS_LOG_TYPE_ERROR, "going volatile, because unable to obtain shmem entry for role: %d name: %{public}s. %{public}@", (uint8_t *)&v80, 0x1Cu);
        }
        _CFSetTSD(0xFu, 0, 0);
        atomic_store(1u, (unsigned __int8 *)&self->_volatile);
        *a7 = 1;
        if (Mutable)
          goto LABEL_127;
        return;
      }
      atomic_store(v22 + 4 * xpc_dictionary_get_int64(a3, "CFPreferencesShmemIndex"), (unint64_t *)&self->super.shmemEntry);
    }
  }
  v78[0] = MEMORY[0x1E0C809B0];
  v78[1] = 3221225472;
  v78[2] = __88__CFPrefsPlistSource_handleReply_toRequestNewDataMessage_onConnection_retryCount_error___block_invoke;
  v78[3] = &unk_1E1337958;
  v78[4] = a4;
  v78[5] = self;
  v78[6] = a5;
  v78[7] = a7;
  if ((-[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:]((uint64_t)self, a3, a4, 0, 0, 0, a6, (uint64_t)v78) & 1) != 0)return;
  atomic_store(xpc_dictionary_get_uint64(a3, "CFPreferencesShmemState"), &self->super.lastKnownShmemState);
  xdata = xpc_dictionary_get_value(a3, "CFPreferencesPropertyList");
  v14 = xpc_dictionary_dup_fd(a3, "PlistFD");
  value = (unint64_t)xpc_dictionary_get_value(a3, "PlistDiff");
  v16 = (unint64_t)xpc_dictionary_get_value(a3, "CFPreferencesValidationPropertyList");
  if (value | v16)
    v17 = 0;
  else
    v17 = dyld_program_sdk_at_least();
  if (v14 != -1)
  {
    memset(&v80, 0, sizeof(v80));
    if (fstat(v14, &v80))
    {
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
      v23 = _CFPrefsClientLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = __error();
        -[CFPrefsPlistSource handleReply:toRequestNewDataMessage:onConnection:retryCount:error:].cold.8(v24, (uint8_t *)error, v23);
      }
      _CFSetTSD(0xFu, 0, 0);
      goto LABEL_17;
    }
    st_size = v80.st_size;
    if (!_plistSizeIsAppropriateToRead(v80.st_size))
    {
LABEL_17:
      Mutable = 0;
      v26 = 0;
LABEL_18:
      close(v14);
      goto LABEL_23;
    }
    v31 = (UInt8 *)mmap(0, st_size, 1, 2, v14, 0);
    if (v31 == (UInt8 *)-1)
    {
      v45 = *__error();
      v46 = -[CFPrefsSource copyOSLogDescription](self, "copyOSLogDescription");
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
      v47 = _CFPrefsClientLog();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        -[CFPrefsPlistSource handleReply:toRequestNewDataMessage:onConnection:retryCount:error:].cold.4((uint64_t)v46, v45, v47);
      _CFSetTSD(0xFu, 0, 0);
      CFRelease(v46);
      goto LABEL_17;
    }
    error[0] = 0;
    data = CFDataCreateWithBytesNoCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, v31, st_size, (CFAllocatorRef)&__kCFAllocatorNull);
    v32 = (__CFString *)CFPropertyListCreateWithData((CFAllocatorRef)&__kCFAllocatorSystemDefault, data, v17 ^ 1u, 0, error);
    Mutable = v32;
    if (v32)
    {
      if (CFGetTypeID(v32) == 18)
      {
        v26 = 1;
LABEL_82:
        if (data)
          CFRelease(data);
        munmap(v31, st_size);
        goto LABEL_18;
      }
      cfa = -[CFPrefsSource copyOSLogDescription](self, "copyOSLogDescription");
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
      v49 = _CFPrefsClientLog();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        -[CFPrefsPlistSource handleReply:toRequestNewDataMessage:onConnection:retryCount:error:].cold.7();
      _CFSetTSD(0xFu, 0, 0);
      CFRelease(cfa);
    }
    else
    {
      cf = -[CFPrefsSource copyOSLogDescription](self, "copyOSLogDescription");
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
      v48 = _CFPrefsClientLog();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        -[CFPrefsPlistSource handleReply:toRequestNewDataMessage:onConnection:retryCount:error:].cold.6();
      _CFSetTSD(0xFu, 0, 0);
      if (os_variant_has_internal_diagnostics())
      {
        v72 = os_log_create("com.apple.defaults", "diagnostics");
        _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          -[CFPrefsPlistSource handleReply:toRequestNewDataMessage:onConnection:retryCount:error:].cold.5();
        _CFSetTSD(0xFu, 0, 0);

      }
      CFRelease(cf);
      if (error[0])
        CFRelease(error[0]);
    }
    v26 = 0;
    goto LABEL_82;
  }
  if (!xdata)
  {
    Mutable = 0;
    v27 = 1;
    goto LABEL_24;
  }
  if (object_getClass(xdata) != (Class)MEMORY[0x1E0C812E8]
    || (length = xpc_data_get_length(xdata), !_plistSizeIsAppropriateToRead(length)))
  {
    Mutable = 0;
LABEL_22:
    v26 = 0;
    goto LABEL_23;
  }
  *(_QWORD *)&v80.st_dev = 0;
  bytes_ptr = (const UInt8 *)xpc_data_get_bytes_ptr(xdata);
  v40 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, bytes_ptr, length, (CFAllocatorRef)&__kCFAllocatorNull);
  v41 = (__CFString *)CFPropertyListCreateWithData((CFAllocatorRef)&__kCFAllocatorSystemDefault, v40, v17 ^ 1u, 0, (CFErrorRef *)&v80);
  Mutable = v41;
  if (!v40 || v41)
  {
    v26 = 1;
    if (!v40)
      goto LABEL_87;
  }
  else
  {
    v42 = -[CFPrefsSource copyOSLogDescription](self, "copyOSLogDescription");
    _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
    v43 = _CFPrefsClientLog();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      -[CFPrefsPlistSource handleReply:toRequestNewDataMessage:onConnection:retryCount:error:].cold.11();
    _CFSetTSD(0xFu, 0, 0);
    CFRelease(v42);
    -[CFPrefsPlistSource requestPlistValidation]((uint64_t)self);
    if (os_variant_has_internal_diagnostics())
    {
      v44 = os_log_create("com.apple.defaults", "diagnostics");
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        -[CFPrefsPlistSource handleReply:toRequestNewDataMessage:onConnection:retryCount:error:].cold.10();
      _CFSetTSD(0xFu, 0, 0);

    }
    v26 = 0;
  }
  CFRelease(v40);
LABEL_87:
  if (*(_QWORD *)&v80.st_dev)
    CFRelease(*(CFTypeRef *)&v80.st_dev);
  if (Mutable && CFGetTypeID(Mutable) != 18)
  {
    v50 = -[CFPrefsSource copyOSLogDescription](self, "copyOSLogDescription");
    _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
    v51 = _CFPrefsClientLog();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      -[CFPrefsPlistSource handleReply:toRequestNewDataMessage:onConnection:retryCount:error:].cold.9();
    _CFSetTSD(0xFu, 0, 0);
    CFRelease(v50);
    -[CFPrefsPlistSource requestPlistValidation]((uint64_t)self);
    goto LABEL_22;
  }
LABEL_23:
  v27 = v26 != 0;
  if (!v26)
    goto LABEL_44;
LABEL_24:
  if (!value)
  {
LABEL_44:
    if (v16)
      v37 = v27;
    else
      v37 = 0;
    if (!v37)
    {
      if (!v27)
        goto LABEL_122;
      goto LABEL_115;
    }
LABEL_99:
    if (object_getClass((id)v16) != (Class)MEMORY[0x1E0C812E8])
      goto LABEL_122;
    v52 = xpc_data_get_length((xpc_object_t)v16);
    if (v52 > 0x7FFFFFFFFFFFFFFELL)
      goto LABEL_122;
    *(_QWORD *)&v80.st_dev = 0;
    v53 = (const UInt8 *)xpc_data_get_bytes_ptr((xpc_object_t)v16);
    v54 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, v53, v52, (CFAllocatorRef)&__kCFAllocatorNull);
    v55 = (const __CFDictionary *)CFPropertyListCreateWithData((CFAllocatorRef)&__kCFAllocatorSystemDefault, v54, 0, 0, (CFErrorRef *)&v80);
    v56 = v55;
    if (!v55 || CFGetTypeID(v55) != 18)
    {
      v57 = -[CFPrefsSource copyOSLogDescription](self, "copyOSLogDescription");
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
      v58 = _CFPrefsClientLog();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        -[CFPrefsPlistSource handleReply:toRequestNewDataMessage:onConnection:retryCount:error:].cold.1();
      _CFSetTSD(0xFu, 0, 0);
      CFRelease(v57);
      if (*(_QWORD *)&v80.st_dev)
        CFRelease(*(CFTypeRef *)&v80.st_dev);
    }
    if (v54)
      CFRelease(v54);
    if (v56)
    {
      if (CFDictionaryGetCount(v56) >= 1)
      {
        if (!Mutable)
          Mutable = (__CFString *)CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        context[0] = MEMORY[0x1E0C809B0];
        context[1] = 3221225472;
        context[2] = __88__CFPrefsPlistSource_handleReply_toRequestNewDataMessage_onConnection_retryCount_error___block_invoke_57;
        context[3] = &unk_1E1337980;
        context[5] = Mutable;
        context[6] = v56;
        context[4] = self;
        CFDictionaryApplyFunction(v56, (CFDictionaryApplierFunction)applyDictBlock, context);
      }
      CFRelease(v56);
    }
LABEL_115:
    v59 = _CFPrefsClientLog();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
    {
      v60 = -[CFPrefsSource copyOSLogDescription](self, "copyOSLogDescription");
      v61 = v14 == -1;
      if (!xdata)
        v61 = 0;
      if (v61)
      {
        v62 = "a new base plist";
      }
      else if (self->super._dict)
      {
        v62 = "the same base plist";
      }
      else
      {
        v62 = "an empty base plist";
      }
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
      v65 = _CFPrefsClientLog();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
      {
        v71 = "no additional changes from the base plist";
        v80.st_dev = 138543874;
        *(_QWORD *)&v80.st_mode = v60;
        WORD2(v80.st_ino) = 2080;
        if (value)
          v71 = "a diff relative to the base plist";
        *(__darwin_ino64_t *)((char *)&v80.st_ino + 6) = (__darwin_ino64_t)v62;
        HIWORD(v80.st_gid) = 2080;
        *(_QWORD *)&v80.st_rdev = v71;
        _os_log_debug_impl(&dword_182A8C000, v65, OS_LOG_TYPE_DEBUG, "%{public}@ loaded: %s and %s", (uint8_t *)&v80, 0x20u);
      }
      _CFSetTSD(0xFu, 0, 0);
      CFRelease(v60);
    }
    dict = self->super._dict;
    if (dict)
      CFRelease(dict);
    if (Mutable)
      v67 = v17;
    else
      v67 = 0;
    if (v67 == 1)
    {
      MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, (CFDictionaryRef)Mutable);
      CFRelease(Mutable);
      Mutable = (__CFString *)MutableCopy;
    }
    self->super._dict = (__CFDictionary *)Mutable;
    p_generationCount = &self->super._generationCount;
    do
      v70 = __ldaxr((unint64_t *)p_generationCount);
    while (__stlxr(v70 + 1, (unint64_t *)p_generationCount));
    return;
  }
  if (object_getClass((id)value) == (Class)MEMORY[0x1E0C812C8])
  {
    count = xpc_array_get_count((xpc_object_t)value);
    if ((count & 1) != 0 || Mutable)
    {
      if ((count & 1) != 0)
        goto LABEL_26;
    }
    else
    {
      v35 = self->super._dict;
      if (count)
      {
        if (v35)
          v36 = (__CFString *)CFDictionaryCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, v35);
        else
          v36 = (__CFString *)CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        goto LABEL_97;
      }
      if (v35)
      {
        v36 = (__CFString *)CFRetain(self->super._dict);
LABEL_97:
        Mutable = v36;
        goto LABEL_98;
      }
      Mutable = 0;
    }
LABEL_98:
    _CFPrefsApplyChangesQueueToDictionary((void *)value, (__CFDictionary *)Mutable);
    if (!v16)
      goto LABEL_115;
    goto LABEL_99;
  }
LABEL_26:
  v28 = -[CFPrefsSource copyOSLogDescription](self, "copyOSLogDescription");
  _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
  v29 = _CFPrefsClientLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    -[CFPrefsPlistSource handleReply:toRequestNewDataMessage:onConnection:retryCount:error:].cold.3();
  _CFSetTSD(0xFu, 0, 0);
  CFRelease(v28);
LABEL_122:
  v63 = -[CFPrefsSource copyOSLogDescription](self, "copyOSLogDescription");
  _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
  v64 = _CFPrefsClientLog();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    -[CFPrefsPlistSource handleReply:toRequestNewDataMessage:onConnection:retryCount:error:].cold.2();
  _CFSetTSD(0xFu, 0, 0);
  if (v63)
    CFRelease(v63);
  *a7 = 1;
  if (Mutable)
LABEL_127:
    CFRelease(Mutable);
}

- (id)createRequestNewContentMessageForDaemon:(int)a3
{
  unsigned __int8 v5;
  int v6;
  unsigned __int8 v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  CFAbsoluteTime Current;
  double stalenessCheckWindowStart;
  __CFString *v14;
  NSObject *v15;
  void *v16;
  double v18;
  _BOOL4 v19;
  unsigned int stalenessCheckWindowStaleCount;
  NSObject *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  CFPrefsPlistSource *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  uint64_t v34;
  uint8_t buf[4];
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  unsigned int v40;
  __int16 v41;
  unsigned int v42;
  __int16 v43;
  __CFString *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->super._lock);
  v29 = 0;
  v30 = &v29;
  v31 = 0x3052000000;
  v32 = __Block_byref_object_copy__7;
  v33 = __Block_byref_object_dispose__7;
  v34 = 0;
  v5 = atomic_load((unsigned __int8 *)&self->_directMode);
  if ((v5 & 1) != 0 || _CFPrefsDirectMode())
  {
    v6 = 3;
  }
  else if (xpc_user_sessions_enabled()
         && (CFEqual(self->userIdentifier, CFSTR("kCFPreferencesAnyUser"))
          || !xpc_user_sessions_get_session_uid()
          && CFEqual(self->userIdentifier, CFSTR("kCFPreferencesCurrentUser"))))
  {
    v6 = 2;
  }
  else
  {
    v6 = 1;
  }
  if (v6 == a3)
  {
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __62__CFPrefsPlistSource_createRequestNewContentMessageForDaemon___block_invoke;
    v26 = &unk_1E13378F0;
    v27 = self;
    v28 = &v29;
    v7 = atomic_load((unsigned __int8 *)&self->_volatile);
    if ((v7 & 1) == 0)
    {
      v8 = (unsigned int *)atomic_load((unint64_t *)&self->super.shmemEntry);
      if (!v8)
      {
        if (!self->super._dict)
          goto LABEL_18;
        v14 = -[CFPrefsSource copyOSLogDescription](self, "copyOSLogDescription", v23, v24);
        _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
        v15 = _CFPrefsClientLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[CFPrefsPlistSource createRequestNewContentMessageForDaemon:].cold.1();
        goto LABEL_17;
      }
      v9 = atomic_load(v8);
      v10 = atomic_load((unsigned int *)&sentinelGeneration);
      if (v9 != v10)
      {
        v11 = atomic_load(&self->super.lastKnownShmemState);
        if (v9 != v11)
        {
          Current = CFAbsoluteTimeGetCurrent();
          stalenessCheckWindowStart = self->super.stalenessCheckWindowStart;
          if (stalenessCheckWindowStart == 0.0)
          {
            self->super.stalenessCheckWindowStart = Current;
            self->super.stalenessCheckWindowStaleCount = 1;
LABEL_18:
            os_unfair_lock_assert_owner(&self->super._lock);
            v25((uint64_t)&v23);
            goto LABEL_19;
          }
          v18 = Current - stalenessCheckWindowStart;
          if (Current - stalenessCheckWindowStart >= 0.5)
          {
            self->super.stalenessCheckWindowStart = 0.0;
            stalenessCheckWindowStaleCount = self->super.stalenessCheckWindowStaleCount;
            v19 = stalenessCheckWindowStaleCount > 0xFA;
            if (stalenessCheckWindowStaleCount > 0xFA)
              v18 = 0.5;
          }
          else
          {
            v19 = 0;
            stalenessCheckWindowStaleCount = ++self->super.stalenessCheckWindowStaleCount;
          }
          if (stalenessCheckWindowStaleCount - 251 >= 9 && !v19)
            goto LABEL_18;
          v14 = -[CFPrefsSource copyOSLogDescription](self, "copyOSLogDescription", v23, v24);
          _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
          v21 = _CFPrefsClientLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            v22 = self->super.stalenessCheckWindowStaleCount;
            *(_DWORD *)buf = 67110146;
            v36 = v22;
            v37 = 1024;
            v38 = (int)(v18 * 1000.0);
            v39 = 1024;
            v40 = v9;
            v41 = 1024;
            v42 = v11;
            v43 = 2114;
            v44 = v14;
            _os_log_error_impl(&dword_182A8C000, v21, OS_LOG_TYPE_ERROR, "Source was stale %i times within the last %i ms (%i (latestGeneration) != %i (lastKnownShmemState)): %{public}@", buf, 0x24u);
          }
LABEL_17:
          _CFSetTSD(0xFu, 0, 0);
          CFRelease(v14);
          goto LABEL_18;
        }
      }
    }
  }
LABEL_19:
  v16 = (void *)v30[5];
  _Block_object_dispose(&v29, 8);
  return v16;
}

- (void)addPIDImpersonationIfNecessary:(void *)a1
{
  BOOL v2;
  const void *v6;
  const void *CacheStringForBundleID;

  if (a1)
  {
    if ((_QWORD)_CFPrefsAuditTokenToImpersonate)
      v2 = 0;
    else
      v2 = *((_QWORD *)&_CFPrefsAuditTokenToImpersonate + 1) == 0;
    if (!v2 || qword_1EDCD15CC != 0 || unk_1EDCD15D4 != 0)
    {
      v6 = (const void *)objc_msgSend(a1, "domainIdentifier", 0, 0, 0, 0);
      CacheStringForBundleID = (const void *)_CFPrefsGetCacheStringForBundleID(CFSTR("kCFPreferencesCurrentApplication"));
      if (CFEqual(v6, CacheStringForBundleID))
        xpc_dictionary_set_data(a2, "CFPreferencesAuditTokenToImpersonate", &_CFPrefsAuditTokenToImpersonate, 0x20uLL);
    }
  }
}

- (uint64_t)handleErrorReply:(void *)a3 toMessage:(const void *)a4 settingKeys:(const void *)a5 toValues:(CFIndex)a6 count:(int)a7 retryCount:(uint64_t)a8 retryContinuation:
{
  uint64_t v14;
  Class Class;
  objc_class *v16;
  int v17;
  int v18;
  const char *v19;
  const __CFString *v20;
  os_log_type_t v21;
  __CFArray *Mutable;
  CFIndex v23;
  const void **v24;
  CFStringRef v25;
  NSObject *v26;
  NSObject *v27;
  int64_t int64;
  const char *v29;
  const char *v30;
  NSObject *v31;
  __CFArray *v32;
  CFIndex v33;
  const void **v34;
  CFStringRef v35;
  NSObject *v36;
  const char *string;
  const char *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  char *v42;
  unint64_t *v43;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  int *v49;
  NSObject *v50;
  char v52[32];
  uint8_t buf[4];
  CFStringRef v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  const char *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  if (!a2)
    -[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:].cold.1();
  if (a2 == (id)MEMORY[0x1E0C81258])
  {
    if (!__CFProcessIsRestricted() && getenv("__CFPreferencesTestDaemon"))
    {
      v50 = _CFPrefsClientLog();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
        -[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:].cold.2();
      abort();
    }
    v27 = _CFPrefsClientLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_182A8C000, v27, OS_LOG_TYPE_INFO, "cfprefsd crashed, retrying message", buf, 2u);
    }
    if (a7 <= 9)
    {
      (*(void (**)(uint64_t, _QWORD))(a8 + 16))(a8, (a7 + 1));
      return 1;
    }
    return 0;
  }
  v14 = result;
  Class = object_getClass(a2);
  v16 = (objc_class *)MEMORY[0x1E0C812F8];
  if (Class != (Class)MEMORY[0x1E0C812F8])
    goto LABEL_5;
  int64 = xpc_dictionary_get_int64(a2, "CFPreferencesErrorType");
  if (int64 == 4)
  {
    string = xpc_dictionary_get_string(a2, "CFPreferencesUncanonicalizedPath");
    v38 = string;
    if (a7 >= 4)
    {
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
      v39 = _CFPrefsClientLog();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
        -[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:].cold.5();
      goto LABEL_35;
    }
    if (string)
    {
      bzero(buf, 0x402uLL);
      if (dirname_r(v38, (char *)buf))
      {
        geteuid();
        getegid();
        if (_CFPrefsCreatePreferencesDirectory((const char *)buf))
        {
          _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
          v45 = _CFPrefsClientLog();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
            -[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:].cold.9();
          _CFSetTSD(0xFu, 0, 0);
          (*(void (**)(uint64_t, _QWORD))(a8 + 16))(a8, (a7 + 1));
          return 1;
        }
        _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
        v48 = _CFPrefsClientLog();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          v49 = __error();
          -[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:].cold.8((uint64_t)buf, v49, (uint64_t)v52, v48);
        }
        _CFSetTSD(0xFu, 0, 0);
      }
      else
      {
        _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
        v47 = _CFPrefsClientLog();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          -[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:].cold.7();
        _CFSetTSD(0xFu, 0, 0);
      }
    }
    else
    {
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
      v46 = _CFPrefsClientLog();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        -[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:].cold.6();
      _CFSetTSD(0xFu, 0, 0);
    }
  }
  else
  {
    if (int64 != 3)
      goto LABEL_5;
    v29 = xpc_dictionary_get_string(a2, "CFPreferencesAccessToken");
    v30 = v29;
    if (a7 >= 10)
    {
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
      v31 = _CFPrefsClientLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
        -[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:].cold.4();
LABEL_35:
      _CFSetTSD(0xFu, 0, 0);
      return 0;
    }
    if (v29)
    {
      xpc_dictionary_set_value(a3, "CFPreferencesAccessToken", 0);
      v42 = strdup(v30);
      v43 = (unint64_t *)(v14 + 112);
      while (!__ldaxr(v43))
      {
        if (!__stlxr((unint64_t)v42, v43))
          goto LABEL_82;
      }
      __clrex();
      free(v42);
LABEL_82:
      (*(void (**)(uint64_t, _QWORD))(a8 + 16))(a8, (a7 + 1));
      return 1;
    }
  }
LABEL_5:
  v17 = xpc_dictionary_get_int64(a2, "CFPreferencesByteCountThreshold");
  -[CFPrefsPlistSource handlePossibleOversizedMessage:forWritingKeys:values:count:]((unsigned __int8 *)v14, v17, a4, a5, a6);
  if (object_getClass(a2) == (Class)MEMORY[0x1E0C81310]
    || (result = (uint64_t)xpc_dictionary_get_value(a2, "CFPreferencesErrorDescription")) != 0)
  {
    if (a2 == (id)MEMORY[0x1E0C81260])
    {
      -[CFPrefsPlistSource writeFailedForKeys:values:count:](v14, a4, (const __CFString **)a5, a6);
      atomic_store(1u, (unsigned __int8 *)(v14 + 121));
      if (handleErrorReply_toMessage_settingKeys_toValues_count_retryCount_retryContinuation__onceToken != -1)
        dispatch_once(&handleErrorReply_toMessage_settingKeys_toValues_count_retryCount_retryContinuation__onceToken, &__block_literal_global_38);
    }
    else
    {
      if (object_getClass(a2) != v16)
        -[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:].cold.3();
      v18 = xpc_dictionary_get_int64(a2, "CFPreferencesErrorType");
      v19 = xpc_dictionary_get_string(a2, "CFPreferencesErrorDescription");
      v20 = (const __CFString *)objc_msgSend((id)v14, "copyOSLogDescription");
      if (xpc_dictionary_get_BOOL(a2, "CFPreferencesErrorClientFault"))
        v21 = OS_LOG_TYPE_FAULT;
      else
        v21 = OS_LOG_TYPE_ERROR;
      if (v18 == 1)
      {
        if (a6 < 1)
        {
          _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
          v40 = _CFPrefsClientLog();
          if (os_log_type_enabled(v40, v21))
          {
            *(_DWORD *)buf = 138543618;
            v54 = v20;
            v55 = 2082;
            v56 = v19;
            _os_log_impl(&dword_182A8C000, v40, v21, "Couldn't read values in %{public}@: %{public}s, detaching from cfprefsd", buf, 0x16u);
          }
          _CFSetTSD(0xFu, 0, 0);
        }
        else
        {
          Mutable = CFArrayCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeArrayCallBacks);
          v23 = a6;
          v24 = a4;
          do
          {
            if (*v24)
              CFArrayAppendValue(Mutable, *v24);
            ++v24;
            --v23;
          }
          while (v23);
          v25 = CFCopyDescription(Mutable);
          if (Mutable)
            CFRelease(Mutable);
          _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
          v26 = _CFPrefsClientLog();
          if (os_log_type_enabled(v26, v21))
          {
            *(_DWORD *)buf = 138543874;
            v54 = v25;
            v55 = 2114;
            v56 = (const char *)v20;
            v57 = 2082;
            v58 = v19;
            _os_log_impl(&dword_182A8C000, v26, v21, "Couldn't write values for keys %{public}@ in %{public}@: %{public}s, detaching from cfprefsd", buf, 0x20u);
          }
          _CFSetTSD(0xFu, 0, 0);
          if (v25)
            CFRelease(v25);
        }
        -[CFPrefsPlistSource writeFailedForKeys:values:count:](v14, a4, (const __CFString **)a5, a6);
        atomic_store(1u, (unsigned __int8 *)(v14 + 121));
      }
      else
      {
        if (a6 < 1)
        {
          _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
          v41 = _CFPrefsClientLog();
          if (os_log_type_enabled(v41, v21))
          {
            *(_DWORD *)buf = 138543618;
            v54 = v20;
            v55 = 2082;
            v56 = v19;
            _os_log_impl(&dword_182A8C000, v41, v21, "Couldn't read values in %{public}@: %{public}s", buf, 0x16u);
          }
          _CFSetTSD(0xFu, 0, 0);
        }
        else
        {
          v32 = CFArrayCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeArrayCallBacks);
          v33 = a6;
          v34 = a4;
          do
          {
            if (*v34)
              CFArrayAppendValue(v32, *v34);
            ++v34;
            --v33;
          }
          while (v33);
          v35 = CFCopyDescription(v32);
          if (v32)
            CFRelease(v32);
          _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
          v36 = _CFPrefsClientLog();
          if (os_log_type_enabled(v36, v21))
          {
            *(_DWORD *)buf = 138543874;
            v54 = v35;
            v55 = 2114;
            v56 = (const char *)v20;
            v57 = 2082;
            v58 = v19;
            _os_log_impl(&dword_182A8C000, v36, v21, "Couldn't write values for keys %{public}@ in %{public}@: %{public}s", buf, 0x20u);
          }
          _CFSetTSD(0xFu, 0, 0);
          if (v35)
            CFRelease(v35);
        }
        -[CFPrefsPlistSource writeFailedForKeys:values:count:](v14, a4, (const __CFString **)a5, a6);
      }
      CFRelease(v20);
    }
    if (a6 >= 1)
      atomic_store(xpc_dictionary_get_uint64(a2, "CFPreferencesShmemState"), (unsigned int *)(v14 + 48));
    return 1;
  }
  return result;
}

- (void)handlePossibleOversizedMessage:(const void *)a3 forWritingKeys:(const void *)a4 values:(CFIndex)a5 count:
{
  unsigned __int8 v9;
  const void *v10;
  NSObject *v11;
  NSObject *v12;
  const void *v13;
  const void *v14;
  _QWORD *v15;
  NSObject *v16;
  int v17;
  const void *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  _QWORD *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (a2 == 1)
    {
      v12 = _CFPrefsClientLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = (const void *)objc_msgSend(a1, "copyOSLogDescription");
        v14 = (const void *)objc_msgSend(a1, "alreadylocked_copyDictionary");
        v15 = -[_CFPrefsOversizedPlistDescription initWithDict:setKeys:andValues:count:]([_CFPrefsOversizedPlistDescription alloc], v14, a3, a4, a5);
        v16 = _CFPrefsClientLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = 138544642;
          v18 = v13;
          v19 = 1024;
          v20 = 3145728;
          v21 = 1026;
          v22 = 0x400000;
          v23 = 2082;
          v24 = "cause performance problems or lose data";
          v25 = 2114;
          v26 = _CFProcessNameString();
          v27 = 2112;
          v28 = v15;
          _os_log_impl(&dword_182A8C000, v16, OS_LOG_TYPE_INFO, "%{public}@: Storing >= %d bytes of data in CFPreferences/NSUserDefaults. If this exceeds %{public}d, it may %{public}s. This is a bug in %{public}@ or a library it uses.\n%@", (uint8_t *)&v17, 0x36u);
        }

        CFRelease(v13);
        if (v14)
          CFRelease(v14);
      }
      dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_47);
    }
    else if (a2 == 2)
    {
      v9 = atomic_load(a1 + 129);
      if ((v9 & 1) != 0 || _CFPrefsDirectMode())
      {
        v10 = (const void *)objc_msgSend(a1, "copyOSLogDescription");
        v11 = _CFPrefsClientLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          -[CFPrefsPlistSource handlePossibleOversizedMessage:forWritingKeys:values:count:].cold.1((uint64_t)v10);
        CFRelease(v10);
      }
      else
      {
        -[CFPrefsPlistSource handlePossibleOversizedMessage:forWritingKeys:values:count:].cold.2((uint64_t)a1, a3, a4, a5);
      }
    }
  }
}

void __62__CFPrefsPlistSource_createRequestNewContentMessageForDaemon___block_invoke(uint64_t a1)
{
  void *v2;

  if ((-[CFPrefsPlistSource volatilizeIfInvalidHomeDir](*(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "createSynchronizeMessage");
    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v2)
    {
      if (-[CFPrefsPlistSource attachAccessTokenToMessage:accessType:](*(_QWORD *)(a1 + 32), v2, 0))
        -[CFPrefsPlistSource addPIDImpersonationIfNecessary:](*(void **)(a1 + 32), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    }
  }
}

- (BOOL)attachAccessTokenToMessage:(int)a3 accessType:
{
  _BOOL8 v3;
  unint64_t v4;
  const char *v7;
  int v8;
  int v9;

  if (result)
  {
    v3 = result;
    v4 = atomic_load((unint64_t *)(result + 112));
    result = 1;
    if (v4 && !xpc_dictionary_get_value(xdict, "CFPreferencesAccessToken"))
    {
      v7 = (const char *)atomic_load((unint64_t *)(v3 + 112));
      v8 = a3 ? open(v7, 514, 384) : open(v7, 0);
      v9 = v8;
      if (v8 < 0)
        return 0;
      xpc_dictionary_set_fd(xdict, "CFPreferencesAccessToken", v8);
      close(v9);
      if (byte_1EDCCE380)
        return 0;
    }
  }
  return result;
}

- (uint64_t)volatilizeIfInvalidHomeDir
{
  unsigned __int8 v2;
  NSObject *v3;
  uint64_t v4;
  const void *v5;
  NSObject *v6;
  int v8;
  const void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = atomic_load((unsigned __int8 *)(a1 + 125));
  if ((v2 & 1) != 0)
    return 0;
  atomic_store(1u, (unsigned __int8 *)(a1 + 125));
  if (!-[_CFXPreferences euid](*(_QWORD *)(a1 + 8))
    || CFEqual(CFSTR("kCFPreferencesAnyUser"), (CFTypeRef)objc_msgSend((id)a1, "userIdentifier"))
    || !-[_CFXPreferences currentUserHasInvalidHomeDirectory](*(_QWORD *)(a1 + 8)))
  {
    return 0;
  }
  v3 = _CFPrefsClientLog();
  v4 = 1;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v5 = (const void *)objc_msgSend((id)a1, "copyOSLogDescription");
    _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
    v6 = _CFPrefsClientLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = 138543362;
      v9 = v5;
      _os_log_impl(&dword_182A8C000, v6, OS_LOG_TYPE_INFO, "Volatilizing domain, because home directory is invalid. %{public}@", (uint8_t *)&v8, 0xCu);
    }
    _CFSetTSD(0xFu, 0, 0);
    if (v5)
      CFRelease(v5);
  }
  atomic_store(1u, (unsigned __int8 *)(a1 + 121));
  return v4;
}

- (id)createSynchronizeMessage
{
  unsigned __int8 v3;
  xpc_object_t v4;
  __CFString *v5;
  __CFSet *groupContainersForCurrentUser;
  void *v7;
  NSObject *v9;
  __objc2_class **CacheStringForBundleID;
  unsigned __int8 v11;
  __CFString *v12;
  CFStringRef Copy;
  CFStringRef v14;
  int v15;
  __CFString *v16;
  __objc2_class **v17;
  unsigned __int8 v18;
  signed int v20;
  unsigned __int8 v21;
  signed int v23;
  unsigned __int8 v24;
  uint64_t v25;
  char buffer[1024];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->super._lock);
  v3 = atomic_load((unsigned __int8 *)&self->_volatile);
  if ((v3 & 1) != 0)
    return 0;
  v4 = xpc_dictionary_create(0, 0, 0);
  v5 = -[CFPrefsPlistSource domainIdentifier](self, "domainIdentifier");
  if ((_CFPrefsEncodeValueIntoMessage(v4, "CFPreferencesDomain", (__objc2_class **)v5, 0) & 1) == 0)
  {
    xpc_release(v4);
    return 0;
  }
  os_unfair_lock_lock_with_options();
  groupContainersForCurrentUser = self->super._containingPreferences->_groupContainersForCurrentUser;
  if (groupContainersForCurrentUser && CFSetContainsValue(groupContainersForCurrentUser, v5))
  {
    bzero(buffer, 0x400uLL);
    if (CFStringGetCString(v5, buffer, 1024, 0x8000100u))
    {
      v25 = 1;
      v7 = (void *)container_create_or_lookup_app_group_path_by_app_group_identifier();
      if (v7)
      {
        free(v7);
      }
      else
      {
        v9 = _CFPrefsDaemonLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[CFPrefsPlistSource createSynchronizeMessage].cold.1((uint64_t)buffer, (uint64_t)&v25, v9);
      }
    }
    CFSetRemoveValue(self->super._containingPreferences->_groupContainersForCurrentUser, v5);
    if (!CFSetGetCount(self->super._containingPreferences->_groupContainersForCurrentUser))
    {
      CFRelease(self->super._containingPreferences->_groupContainersForCurrentUser);
      self->super._containingPreferences->_groupContainersForCurrentUser = 0;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&groupContainersLock);
  CacheStringForBundleID = (__objc2_class **)_CFPrefsGetCacheStringForBundleID(CFSTR("kCFPreferencesCurrentApplication"));
  _CFPrefsEncodeValueIntoMessage(v4, "CFPreferencesHostBundleIdentifier", CacheStringForBundleID, 0);
  if (CFEqual(v5, CacheStringForBundleID))
    xpc_dictionary_set_BOOL(v4, "CFPreferencesCurrentApplicationDomain", 1);
  v11 = atomic_load((unsigned __int8 *)&self->_isByHost);
  if ((v11 & 1) != 0)
    xpc_dictionary_set_BOOL(v4, "CFPreferencesIsByHost", 1);
  xpc_dictionary_set_int64(v4, "CFPreferencesOperation", 1);
  if (-[CFPrefsSource managed](self, "managed"))
    xpc_dictionary_set_BOOL(v4, "CFPreferencesIsManaged", 1);
  v12 = -[CFPrefsPlistSource userIdentifier](self, "userIdentifier", v25);
  Copy = CFSTR("kCFPreferencesAnyUser");
  if (CFEqual(CFSTR("kCFPreferencesAnyUser"), v12))
    goto LABEL_32;
  _CFPrefsEncodeValueIntoMessage(v4, "CFPreferencesUser", (__objc2_class **)v12, 0);
  if (!CFEqual(CFSTR("kCFPreferencesCurrentUser"), CFSTR("kCFPreferencesCurrentUser")))
  {
    if (CFEqual(CFSTR("kCFPreferencesCurrentUser"), CFSTR("kCFPreferencesAnyUser")))
      goto LABEL_28;
    v14 = CFCopyUserName();
    v15 = CFEqual(CFSTR("kCFPreferencesCurrentUser"), v14);
    CFRelease(v14);
    if (!CFSTR("kCFPreferencesCurrentUser") || !v15)
    {
      Copy = CFStringCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, CFSTR("kCFPreferencesCurrentUser"));
      goto LABEL_28;
    }
  }
  Copy = CFSTR("kCFPreferencesCurrentUser");
LABEL_28:
  if (!CFEqual(Copy, v12))
    xpc_dictionary_set_BOOL(v4, "CFPreferencesUseCorrectOwner", 1);
  if (Copy)
    CFRelease(Copy);
LABEL_32:
  v16 = -[CFPrefsPlistSource container](self, "container");
  if (v16)
  {
    v17 = (__objc2_class **)v16;
    if (CFStringGetLength(v16) >= 1)
      _CFPrefsEncodeValueIntoMessage(v4, "CFPreferencesContainer", v17, 0);
  }
  if (_CFPrefsSynchronizeIsSynchronous
    || (v24 = atomic_load((unsigned __int8 *)&self->_avoidsDaemonCache), (v24 & 1) != 0)
    || _CFPrefsTestingFlags
    || byte_1EDCCE37A && (arc4random() & 1) == 0)
  {
    xpc_dictionary_set_BOOL(v4, "CFPreferencesShouldWriteSynchronously", 1);
    xpc_dictionary_set_BOOL(v4, "CFPreferencesAvoidCache", 1);
  }
  v18 = atomic_load((unsigned __int8 *)&self->_disableBackup);
  if ((v18 & 1) != 0)
    xpc_dictionary_set_BOOL(v4, "CFPreferencesDisableBackups", 1);
  if (atomic_load((unsigned int *)&self->_fileProtectionClass))
  {
    v20 = atomic_load((unsigned int *)&self->_fileProtectionClass);
    xpc_dictionary_set_int64(v4, "CFPreferencesFileProtectionClass", v20);
  }
  v21 = atomic_load((unsigned __int8 *)&self->_restrictedAccess);
  if ((v21 & 1) != 0)
    xpc_dictionary_set_BOOL(v4, "CFPreferencesRestrictedReadability", 1);
  if (byte_1EDCCE37B)
    xpc_dictionary_set_BOOL(v4, "kCFPreferencesTestingSimulateSlowFilesystem", 1);
  if (atomic_load(&dword_1EDCCE384))
  {
    v23 = atomic_load(&dword_1EDCCE384);
    xpc_dictionary_set_int64(v4, "kCFPreferencesTestingSimulateOutOfDiskSpace", v23);
  }
  return v4;
}

- (__CFString)userIdentifier
{
  return self->userIdentifier;
}

- (__CFString)container
{
  return self->container;
}

- (__CFString)domainIdentifier
{
  return self->domainIdentifier;
}

- (void)writeFailedForKeys:(const __CFString *)a3 values:(uint64_t)a4 count:
{
  uint64_t v4;
  const void *v8;
  __CFDictionary *v10;
  const __CFString *v11;

  if (a1)
  {
    v4 = a4;
    if (a4 >= 1)
    {
      do
      {
        v8 = *a2;
        if (*a2)
        {
          atomic_store(1u, (unsigned __int8 *)(a1 + 126));
          os_unfair_lock_lock(&locallySetDictLock);
          if (!atomic_load((unint64_t *)(a1 + 104)))
            atomic_store((unint64_t)CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks), (unint64_t *)(a1 + 104));
          v10 = (__CFDictionary *)atomic_load((unint64_t *)(a1 + 104));
          if (*a3)
            v11 = *a3;
          else
            v11 = CFSTR("MagicRemovedValue");
          CFDictionarySetValue(v10, v8, v11);
          os_unfair_lock_unlock(&locallySetDictLock);
        }
        ++a3;
        ++a2;
        --v4;
      }
      while (v4);
    }
  }
}

- (CFPrefsPlistSource)initWithDomain:(__CFString *)a3 user:(__CFString *)a4 byHost:(BOOL)a5 containerPath:(__CFString *)a6 containingPreferences:(id)a7
{
  CFPrefsPlistSource *v11;
  uint64_t v12;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)CFPrefsPlistSource;
  v11 = -[CFPrefsSource initWithContainingPreferences:](&v14, sel_initWithContainingPreferences_, a7);
  v12 = (uint64_t)v11;
  if (v11)
  {
    -[CFPrefsPlistSource setDomainIdentifier:]((uint64_t)v11, a3);
    -[CFPrefsPlistSource setUserIdentifier:](v12, a4);
    -[CFPrefsPlistSource setContainer:](v12, a6);
    atomic_store(a5, (unsigned __int8 *)(v12 + 120));
    atomic_store(0, (unint64_t *)(v12 + 40));
    atomic_store(0, (unsigned int *)(v12 + 48));
  }
  return (CFPrefsPlistSource *)v12;
}

- (void)setDomainIdentifier:(uint64_t)a1
{
  const __CFString *v4;
  CFTypeRef v5;

  if (a1)
  {
    if (cf1)
    {
      if (CFEqual(cf1, CFSTR("kCFPreferencesCurrentApplication")))
        -[CFPrefsPlistSource setDomainIdentifier:].cold.1();
      v4 = *(const __CFString **)(a1 + 88);
      if (v4 != cf1)
      {
        v5 = CFSTR("kCFPreferencesAnyApplication") == cf1
          || (const __CFString *)_CFPrefsGetCacheStringForBundleID(CFSTR("kCFPreferencesCurrentApplication")) == cf1
           ? CFRetain(cf1)
           : _CFStringCopyBundleUnloadingProtectedString((uint64_t)cf1);
        *(_QWORD *)(a1 + 88) = v5;
        if (v4)
          goto LABEL_12;
      }
    }
    else
    {
      v4 = *(const __CFString **)(a1 + 88);
      if (v4)
      {
        *(_QWORD *)(a1 + 88) = 0;
LABEL_12:
        CFRelease(v4);
      }
    }
  }
}

- (void)setContainer:(uint64_t)a1
{
  CFTypeRef v3;
  CFTypeRef v4;

  if (a1)
  {
    v3 = *(CFTypeRef *)(a1 + 96);
    if (v3 != cf)
    {
      if (cf)
        v4 = CFRetain(cf);
      else
        v4 = 0;
      *(_QWORD *)(a1 + 96) = v4;
      if (v3)
        CFRelease(v3);
    }
  }
}

- (void)setUserIdentifier:(uint64_t)a1
{
  const __CFString *v4;
  const __CFString *v5;

  if (a1)
  {
    v4 = *(const __CFString **)(a1 + 80);
    if (v4 != cf1)
    {
      if (cf1)
      {
        v5 = CFSTR("kCFPreferencesAnyUser");
        if (CFEqual(cf1, CFSTR("kCFPreferencesAnyUser"))
          || (v5 = CFSTR("kCFPreferencesCurrentUser"), CFEqual(cf1, CFSTR("kCFPreferencesCurrentUser"))))
        {
          *(_QWORD *)(a1 + 80) = v5;
          if (!v4)
            return;
        }
        else
        {
          *(_QWORD *)(a1 + 80) = CFStringCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, cf1);
          if (!v4)
            return;
        }
      }
      else
      {
        *(_QWORD *)(a1 + 80) = 0;
        if (!v4)
          return;
      }
      CFRelease(v4);
    }
  }
}

- (void)transitionIntoDirectModeIfNeededWithRetryBlock:(id)a3
{
  __CFString *v5;
  NSObject *v6;

  if (-[CFPrefsPlistSource _shouldEnableDirectMode]((_BOOL8)self))
  {
    v5 = -[CFPrefsSource copyOSLogDescription](self, "copyOSLogDescription");
    v6 = _CFPrefsClientLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CFPrefsPlistSource transitionIntoDirectModeIfNeededWithRetryBlock:].cold.1();
    CFRelease(v5);
    os_unfair_lock_lock(&self->super._lock);
    -[CFPrefsPlistSource alreadylocked_clearCache](self, "alreadylocked_clearCache");
    atomic_store(0, (unsigned __int8 *)&self->_byteCountLimitExceeded);
    atomic_store(1u, (unsigned __int8 *)&self->_directMode);
    os_unfair_lock_unlock(&self->super._lock);
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (BOOL)_shouldEnableDirectMode
{
  _BOOL8 v1;
  unsigned __int8 v2;
  unsigned __int8 v3;

  if (result)
  {
    v1 = result;
    v2 = atomic_load((unsigned __int8 *)(result + 128));
    if ((v2 & 1) != 0 && !_CFPrefsDirectMode())
    {
      v3 = atomic_load((unsigned __int8 *)(v1 + 129));
      return (v3 & 1) == 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)alreadylocked_setPrecopiedValues:(const void *)a3 forKeys:(const __CFString *)a4 count:(int64_t)a5 from:(id)a6
{
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  __CFString *v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  char v18;
  const __CFString *v19;
  const void *v20;
  unint64_t v21;
  char v22;
  __CFDictionary *dict;
  const void *Value;
  BOOL v25;
  BOOL v26;
  BOOL v27;
  NSObject *v28;
  __CFString *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  __CFDictionary *Mutable;
  __CFDictionary *v34;
  CFAbsoluteTime Current;
  double stalenessCheckWindowStart;
  int64_t v37;
  const void **v38;
  const void **v39;
  const __CFString *v40;
  const __CFString *v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  NSObject *v45;
  unint64_t v46;
  const __CFString *v47;
  const __CFString *v48;
  __CFDictionary *v49;
  unint64_t v51;
  __CFDictionary *v52;
  int64_t *p_generationCount;
  unint64_t v54;
  double v55;
  _BOOL4 v56;
  unsigned int stalenessCheckWindowStaleCount;
  __CFString *v59;
  NSObject *v60;
  int v61;
  char cf;
  __CFString *cfa;
  BOOL cfb;
  uint8_t buf[4];
  _BYTE v66[10];
  const __CFString *v67;
  unsigned int v68;
  __int16 v69;
  __CFString *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->super._lock);
  if (_CFPrefsTestingFlags)
    -[CFPrefsPlistSource alreadylocked_clearCache](self, "alreadylocked_clearCache");
  v10 = (unsigned int *)atomic_load((unint64_t *)&self->super.shmemEntry);
  if (!v10)
  {
    if (self->super._dict)
    {
      v14 = -[CFPrefsSource copyOSLogDescription](self, "copyOSLogDescription");
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
      v15 = _CFPrefsClientLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[CFPrefsPlistSource alreadylocked_setPrecopiedValues:forKeys:count:from:].cold.2();
      _CFSetTSD(0xFu, 0, 0);
      CFRelease(v14);
    }
LABEL_11:
    cf = 1;
    goto LABEL_12;
  }
  v11 = atomic_load(v10);
  v12 = atomic_load((unsigned int *)&sentinelGeneration);
  if (v11 != v12)
  {
    v13 = atomic_load(&self->super.lastKnownShmemState);
    if (v11 != v13)
    {
      Current = CFAbsoluteTimeGetCurrent();
      stalenessCheckWindowStart = self->super.stalenessCheckWindowStart;
      if (stalenessCheckWindowStart == 0.0)
      {
        self->super.stalenessCheckWindowStart = Current;
        cf = 1;
        self->super.stalenessCheckWindowStaleCount = 1;
        goto LABEL_12;
      }
      v55 = Current - stalenessCheckWindowStart;
      if (Current - stalenessCheckWindowStart >= 0.5)
      {
        self->super.stalenessCheckWindowStart = 0.0;
        stalenessCheckWindowStaleCount = self->super.stalenessCheckWindowStaleCount;
        v56 = stalenessCheckWindowStaleCount > 0xFA;
        if (stalenessCheckWindowStaleCount > 0xFA)
          v55 = 0.5;
      }
      else
      {
        v56 = 0;
        stalenessCheckWindowStaleCount = ++self->super.stalenessCheckWindowStaleCount;
      }
      if (stalenessCheckWindowStaleCount - 251 < 9 || v56)
      {
        v59 = -[CFPrefsSource copyOSLogDescription](self, "copyOSLogDescription");
        _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
        v60 = _CFPrefsClientLog();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        {
          v61 = self->super.stalenessCheckWindowStaleCount;
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)v66 = v61;
          *(_WORD *)&v66[4] = 1024;
          *(_DWORD *)&v66[6] = (int)(v55 * 1000.0);
          LOWORD(v67) = 1024;
          *(_DWORD *)((char *)&v67 + 2) = v11;
          HIWORD(v67) = 1024;
          v68 = v13;
          v69 = 2114;
          v70 = v59;
          _os_log_error_impl(&dword_182A8C000, v60, OS_LOG_TYPE_ERROR, "Source was stale %i times within the last %i ms (%i (latestGeneration) != %i (lastKnownShmemState)): %{public}@", buf, 0x24u);
        }
        _CFSetTSD(0xFu, 0, 0);
        CFRelease(v59);
      }
      goto LABEL_11;
    }
  }
  cf = 0;
LABEL_12:
  if (a5 < 1)
  {
LABEL_45:
    cfb = 0;
    goto LABEL_76;
  }
  v16 = 0;
  v17 = 0;
  v18 = 0;
  do
  {
    v19 = a4[v16];
    if (!_CFPrefsTestingFlags)
    {
      v20 = a3[v16];
      v21 = atomic_load((unint64_t *)&self->_locallySetDict);
      v27 = v21 == 0;
      v22 = cf;
      if (!v27)
        v22 = 1;
      if ((v22 & 1) != 0)
      {
LABEL_20:
        if (!a4[v16])
          goto LABEL_22;
LABEL_21:
        v17 |= -[CFPrefsPlistSource _logLoudlyAboutSettingKey:]((_BOOL8)self, v19);
        v18 = 1;
        goto LABEL_22;
      }
      dict = self->super._dict;
      if (dict)
      {
        Value = CFDictionaryGetValue(dict, a4[v16]);
        v25 = Value != 0;
        v26 = v20 != 0;
        if (Value)
          v27 = v20 == 0;
        else
          v27 = 1;
        if (!v27)
        {
          if (!CFEqual(Value, v20))
            goto LABEL_20;
LABEL_35:
          v28 = _CFPrefsClientLog();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            v29 = -[CFPrefsSource copyOSLogDescription](self, "copyOSLogDescription");
            _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
            v30 = _CFPrefsClientLog();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)v66 = v29;
              *(_WORD *)&v66[8] = 2114;
              v67 = v19;
              _os_log_debug_impl(&dword_182A8C000, v30, OS_LOG_TYPE_DEBUG, "%{public}@ skipping setting already-present value for key %{public}@", buf, 0x16u);
            }
            _CFSetTSD(0xFu, 0, 0);
            CFRelease(v29);
          }
          a4[v16] = 0;
          goto LABEL_22;
        }
      }
      else
      {
        v25 = 0;
        v26 = v20 != 0;
      }
      if (v25 || !self->super._dict || v26)
        goto LABEL_20;
      goto LABEL_35;
    }
    if (a4[v16])
      goto LABEL_21;
LABEL_22:
    ++v16;
  }
  while (a5 != v16);
  if ((v18 & 1) == 0)
    goto LABEL_45;
  v31 = _CFPrefsClientLog();
  if (((os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG) | v17) & 1) != 0)
  {
    cfa = -[CFPrefsSource copyOSLogDescription](self, "copyOSLogDescription");
    v32 = _CFPrefsClientLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if ((v17 & 1) == 0)
        goto LABEL_44;
LABEL_49:
      v34 = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    }
    else
    {
      Mutable = 0;
      if ((v17 & 1) != 0)
        goto LABEL_49;
LABEL_44:
      v34 = 0;
    }
    v37 = a5;
    v38 = (const void **)a4;
    v39 = a3;
    do
    {
      if (*v38)
      {
        if (v34 && -[CFPrefsPlistSource _logLoudlyAboutSettingKey:]((_BOOL8)self, *v38))
        {
          if (*v39)
            v40 = (const __CFString *)*v39;
          else
            v40 = CFSTR("nil");
          CFDictionarySetValue(v34, *v38, v40);
        }
        else if (Mutable)
        {
          if (*v39)
            v41 = (const __CFString *)*v39;
          else
            v41 = CFSTR("nil");
          CFDictionarySetValue(Mutable, *v38, v41);
        }
      }
      ++v39;
      ++v38;
      --v37;
    }
    while (v37);
    v42 = (void *)MEMORY[0x186DB02F4]();
    _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
    if (Mutable)
    {
      if (CFDictionaryGetCount(Mutable) >= 1)
      {
        -[__CFDictionary description](Mutable, "description");
        v43 = _CFPrefsClientLog();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          -[CFPrefsPlistSource alreadylocked_setPrecopiedValues:forKeys:count:from:].cold.1();
      }
      CFRelease(Mutable);
    }
    if (v34)
    {
      if (CFDictionaryGetCount(v34) >= 1)
      {
        v44 = -[__CFDictionary description](v34, "description");
        v45 = _CFPrefsClientLog();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)v66 = v44;
          *(_WORD *)&v66[8] = 2114;
          v67 = cfa;
          _os_log_impl(&dword_182A8C000, v45, OS_LOG_TYPE_DEFAULT, "setting %{public}@ in %{public}@", buf, 0x16u);
        }
      }
      CFRelease(v34);
    }
    CFRelease(cfa);
    _CFSetTSD(0xFu, 0, 0);
    objc_autoreleasePoolPop(v42);
  }
  cfb = -[CFPrefsPlistSource sendMessageSettingValues:forKeys:count:]((uint64_t)self, (__objc2_class ***)a3, (__objc2_class ***)a4, a5) != 1;
LABEL_76:
  v46 = atomic_load((unint64_t *)&self->_locallySetDict);
  if (!v46 && _CFPrefsReadOnly())
  {
    os_unfair_lock_lock(&locallySetDictLock);
    atomic_store((unint64_t)CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks), (unint64_t *)&self->_locallySetDict);
    os_unfair_lock_unlock(&locallySetDictLock);
  }
  if (a5 >= 1)
  {
    while (2)
    {
      v47 = *a4;
      if (!*a4)
        goto LABEL_90;
      v48 = (const __CFString *)*a3;
      v49 = self->super._dict;
      if (*a3)
      {
        if (!v49)
        {
          v49 = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          self->super._dict = v49;
        }
        CFDictionarySetValue(v49, v47, v48);
        if (!atomic_load((unint64_t *)&self->_locallySetDict))
          goto LABEL_90;
      }
      else
      {
        if (v49)
          CFDictionaryRemoveValue(v49, *a4);
        v51 = atomic_load((unint64_t *)&self->_locallySetDict);
        v48 = CFSTR("MagicRemovedValue");
        if (!v51)
        {
LABEL_90:
          ++a3;
          ++a4;
          if (!--a5)
            goto LABEL_91;
          continue;
        }
      }
      break;
    }
    os_unfair_lock_lock(&locallySetDictLock);
    v52 = (__CFDictionary *)atomic_load((unint64_t *)&self->_locallySetDict);
    CFDictionarySetValue(v52, v47, v48);
    os_unfair_lock_unlock(&locallySetDictLock);
    goto LABEL_90;
  }
LABEL_91:
  if (cfb)
  {
    p_generationCount = &self->super._generationCount;
    do
      v54 = __ldaxr((unint64_t *)p_generationCount);
    while (__stlxr(v54 + 1, (unint64_t *)p_generationCount));
  }
}

- (BOOL)_logLoudlyAboutSettingKey:(_BOOL8)result
{
  unsigned __int8 v2;
  unsigned __int8 v3;

  if (result)
  {
    v2 = atomic_load((unsigned __int8 *)(result + 121));
    if ((v2 & 1) != 0)
      return 0;
    v3 = atomic_load((unsigned __int8 *)(result + 122));
    if ((v3 & 1) != 0)
      return 0;
    else
      return CFEqual(cf1, CFSTR("AppleLanguages")) || CFEqual(cf1, CFSTR("AppleLocale")) != 0;
  }
  return result;
}

- (uint64_t)alreadylocked_requestNewData
{
  uint64_t v1;
  unsigned __int8 v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  const void *v7;
  NSObject *v8;
  double Current;
  double v10;
  double v11;
  _BOOL4 v12;
  unsigned int v13;
  const void *v15;
  NSObject *v16;
  _xpc_connection_s **v17;
  unsigned __int8 v18;
  int v19;
  const void *v20;
  int v22;
  _QWORD v23[6];
  uint8_t buf[8];
  uint8_t *v25;
  _BYTE v26[10];
  __int16 v27;
  const void *v28;
  uint64_t v29;

  v1 = a1;
  v29 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = atomic_load((unsigned __int8 *)(a1 + 121));
    if ((v2 & 1) != 0)
      return 0;
    v3 = (unsigned int *)atomic_load((unint64_t *)(a1 + 40));
    if (v3)
    {
      v4 = atomic_load(v3);
      v5 = atomic_load((unsigned int *)&sentinelGeneration);
      if (v4 == v5)
        return 1;
      v6 = atomic_load((unsigned int *)(a1 + 48));
      if (v4 == v6)
        return 1;
      Current = CFAbsoluteTimeGetCurrent();
      v10 = *(double *)(v1 + 64);
      if (v10 == 0.0)
      {
        *(double *)(v1 + 64) = Current;
        *(_WORD *)(v1 + 72) = 1;
      }
      else
      {
        v11 = Current - v10;
        if (Current - v10 >= 0.5)
        {
          *(_QWORD *)(v1 + 64) = 0;
          v13 = *(unsigned __int16 *)(v1 + 72);
          v12 = v13 > 0xFA;
          if (v13 > 0xFA)
            v11 = 0.5;
        }
        else
        {
          v12 = 0;
          v13 = (unsigned __int16)++*(_WORD *)(v1 + 72);
        }
        if (v13 - 251 < 9 || v12)
        {
          v15 = (const void *)objc_msgSend((id)v1, "copyOSLogDescription");
          _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
          v16 = _CFPrefsClientLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v22 = *(unsigned __int16 *)(v1 + 72);
            *(_DWORD *)buf = 67110146;
            *(_DWORD *)&buf[4] = v22;
            LOWORD(v25) = 1024;
            *(_DWORD *)((char *)&v25 + 2) = (int)(v11 * 1000.0);
            HIWORD(v25) = 1024;
            *(_DWORD *)v26 = v4;
            *(_WORD *)&v26[4] = 1024;
            *(_DWORD *)&v26[6] = v6;
            v27 = 2114;
            v28 = v15;
            _os_log_error_impl(&dword_182A8C000, v16, OS_LOG_TYPE_ERROR, "Source was stale %i times within the last %i ms (%i (latestGeneration) != %i (lastKnownShmemState)): %{public}@", buf, 0x24u);
          }
          _CFSetTSD(0xFu, 0, 0);
          CFRelease(v15);
        }
      }
    }
    else if (*(_QWORD *)(a1 + 16))
    {
      v7 = (const void *)objc_msgSend((id)a1, "copyOSLogDescription");
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
      v8 = _CFPrefsClientLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[CFPrefsPlistSource alreadylocked_requestNewData].cold.1();
      _CFSetTSD(0xFu, 0, 0);
      CFRelease(v7);
    }
    *(_QWORD *)buf = 0;
    v25 = buf;
    *(_QWORD *)v26 = 0x2020000000;
    v26[8] = 0;
    v17 = *(_xpc_connection_s ***)(v1 + 8);
    v18 = atomic_load((unsigned __int8 *)(v1 + 129));
    if ((v18 & 1) != 0 || _CFPrefsDirectMode())
    {
      v19 = 3;
    }
    else if (xpc_user_sessions_enabled()
           && (CFEqual(*(CFTypeRef *)(v1 + 80), CFSTR("kCFPreferencesAnyUser"))
            || !xpc_user_sessions_get_session_uid()
            && CFEqual(*(CFTypeRef *)(v1 + 80), CFSTR("kCFPreferencesCurrentUser"))))
    {
      v19 = 2;
    }
    else
    {
      v19 = 1;
    }
    v20 = (const void *)objc_msgSend((id)v1, "userIdentifier");
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __50__CFPrefsPlistSource_alreadylocked_requestNewData__block_invoke;
    v23[3] = &unk_1E13378C8;
    v23[4] = v1;
    v23[5] = buf;
    -[_CFXPreferences withConnectionForRole:andUserIdentifier:performBlock:](v17, v19, v20, (uint64_t)v23);
    v1 = v25[24] == 0;
    _Block_object_dispose(buf, 8);
  }
  return v1;
}

- (uint64_t)sendMessageSettingValues:(__objc2_class *)a3 forKeys:(uint64_t)a4 count:
{
  unsigned __int8 *v7;
  unsigned __int8 v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  unsigned __int8 v14;
  const void *v15;
  unsigned __int8 v16;
  NSObject *v17;
  NSObject *v18;
  __objc2_class **v19;
  __objc2_class **v20;
  __objc2_class **v21;
  __objc2_class **v22;
  unsigned __int8 v23;
  _BYTE buf[12];
  __int16 v25;
  __objc2_class **v26;
  __int16 v27;
  const void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v7 = (unsigned __int8 *)result;
    if ((_CFPrefsReadOnly() & 1) != 0)
      return 0;
    v8 = atomic_load(v7 + 121);
    if ((v8 & 1) != 0 || (v9 = atomic_load(v7 + 122), (v9 & 1) != 0))
    {
      v15 = (const void *)objc_msgSend(v7, "copyOSLogDescription");
      if (a4 >= 1)
      {
        do
        {
          if (*a3)
          {
            v16 = atomic_load(v7 + 122);
            if ((v16 & 1) != 0)
            {
              _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
              v18 = _CFPrefsClientLog();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                v21 = *a2;
                v22 = *a3;
                *(_DWORD *)buf = 138478339;
                *(_QWORD *)&buf[4] = v21;
                v25 = 2113;
                v26 = v22;
                v27 = 2114;
                v28 = v15;
                _os_log_error_impl(&dword_182A8C000, v18, OS_LOG_TYPE_ERROR, "attempt to set %{private}@ for key in %{private}@ in read-only (due to a previously logged write error) preferences domain %{public}@", buf, 0x20u);
              }
            }
            else
            {
              _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
              v17 = _CFPrefsClientLog();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                v19 = *a2;
                v20 = *a3;
                *(_DWORD *)buf = 138478339;
                *(_QWORD *)&buf[4] = v19;
                v25 = 2113;
                v26 = v20;
                v27 = 2114;
                v28 = v15;
                _os_log_error_impl(&dword_182A8C000, v17, OS_LOG_TYPE_ERROR, "attempt to set %{private}@ for key in %{private}@ in non-persistent preferences domain %{public}@", buf, 0x20u);
              }
            }
            _CFSetTSD(0xFu, 0, 0);
          }
          ++a2;
          ++a3;
          --a4;
        }
        while (a4);
      }
      CFRelease(v15);
      return 2;
    }
    else
    {
      v10 = (void *)objc_msgSend(v7, "createSynchronizeMessage");
      if (v10)
      {
        v11 = v10;
        *(_QWORD *)buf = 0;
        v12 = _CFPrefsEncodeKeyValuePairsIntoMessage(v10, a3, a2, a4, buf);
        v13 = _CFPrefsDomainSizeAcceptabilityForByteCount(*(unint64_t *)buf);
        -[CFPrefsPlistSource handlePossibleOversizedMessage:forWritingKeys:values:count:](v7, v13, (const void **)a3, (const void **)a2, a4);
        v14 = atomic_load(v7 + 128);
        if ((v14 & 1) == 0 || _CFPrefsDirectMode() || (v23 = atomic_load(v7 + 129), (v23 & 1) != 0))
        {
          if (((v12 ^ 1) & 1) == 0 && -[CFPrefsPlistSource attachAccessTokenToMessage:accessType:]((_BOOL8)v7, v11, 1))
          {
            -[CFPrefsPlistSource addPIDImpersonationIfNecessary:](v7, v11);
            -[CFPrefsPlistSource sendFullyPreparedMessage:toConnection:settingValues:forKeys:count:retryCount:]((uint64_t)v7, (uint64_t)v11, 0, (uint64_t)a2, (uint64_t)a3, a4, 0);
          }
        }
        xpc_release(v11);
        return 0;
      }
      return 3;
    }
  }
  return result;
}

- (void)sendFullyPreparedMessage:(xpc_connection_t)connection toConnection:(uint64_t)a4 settingValues:(uint64_t)a5 forKeys:(uint64_t)a6 count:(int)a7 retryCount:
{
  _xpc_connection_s **v8;
  unsigned __int8 v9;
  int v10;
  _QWORD v11[9];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __99__CFPrefsPlistSource_sendFullyPreparedMessage_toConnection_settingValues_forKeys_count_retryCount___block_invoke;
    v11[3] = &unk_1E13378A0;
    v11[4] = a2;
    v11[5] = a1;
    v11[6] = a5;
    v11[7] = a4;
    v11[8] = a6;
    v12 = a7;
    if (connection)
    {
      __99__CFPrefsPlistSource_sendFullyPreparedMessage_toConnection_settingValues_forKeys_count_retryCount___block_invoke((uint64_t)v11, connection);
    }
    else
    {
      v8 = *(_xpc_connection_s ***)(a1 + 8);
      v9 = atomic_load((unsigned __int8 *)(a1 + 129));
      if ((v9 & 1) != 0 || _CFPrefsDirectMode())
      {
        v10 = 3;
      }
      else if (xpc_user_sessions_enabled()
             && (CFEqual(*(CFTypeRef *)(a1 + 80), CFSTR("kCFPreferencesAnyUser"))
              || !xpc_user_sessions_get_session_uid()
              && CFEqual(*(CFTypeRef *)(a1 + 80), CFSTR("kCFPreferencesCurrentUser"))))
      {
        v10 = 2;
      }
      else
      {
        v10 = 1;
      }
      -[_CFXPreferences withConnectionForRole:andUserIdentifier:performBlock:](v8, v10, (const void *)objc_msgSend((id)a1, "userIdentifier"), (uint64_t)v11);
    }
  }
}

void __99__CFPrefsPlistSource_sendFullyPreparedMessage_toConnection_settingValues_forKeys_count_retryCount___block_invoke(uint64_t a1, xpc_connection_t connection)
{
  xpc_object_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const void **v8;
  const void **v9;
  CFIndex v10;
  int v11;
  uint64_t uint64;
  uint64_t v13;
  unsigned int v14;
  const void *v15;
  NSObject *v16;
  unsigned int v17;
  _QWORD v18[10];
  uint8_t buf[4];
  const void *v20;
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (connection)
    v4 = xpc_connection_send_message_with_reply_sync(connection, *(xpc_object_t *)(a1 + 32));
  else
    v4 = xpc_retain(MEMORY[0x1E0C81260]);
  v5 = v4;
  v7 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8 = *(const void ***)(a1 + 48);
  v9 = *(const void ***)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 64);
  v11 = *(_DWORD *)(a1 + 72);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __99__CFPrefsPlistSource_sendFullyPreparedMessage_toConnection_settingValues_forKeys_count_retryCount___block_invoke_2;
  v18[3] = &unk_1E1337878;
  v18[4] = v7;
  v18[5] = v6;
  v18[6] = connection;
  v18[7] = v9;
  v18[8] = v8;
  v18[9] = v10;
  -[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:](v6, v5, v7, v8, v9, v10, v11, (uint64_t)v18);
  if (object_getClass(v5) == (Class)MEMORY[0x1E0C812F8])
  {
    uint64 = xpc_dictionary_get_uint64(v5, "CFPreferencesShmemState");
    v13 = uint64;
    if (uint64)
    {
      v14 = atomic_load((unsigned int *)(*(_QWORD *)(a1 + 40) + 48));
      if (uint64 == v14 + 1)
      {
        atomic_store(uint64, (unsigned int *)(*(_QWORD *)(a1 + 40) + 48));
      }
      else
      {
        v15 = (const void *)objc_msgSend(*(id *)(a1 + 40), "copyOSLogDescription");
        _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
        v16 = _CFPrefsClientLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = atomic_load((unsigned int *)(*(_QWORD *)(a1 + 40) + 48));
          *(_DWORD *)buf = 138543874;
          v20 = v15;
          v21 = 1024;
          v22 = v17;
          v23 = 2048;
          v24 = v13;
          _os_log_error_impl(&dword_182A8C000, v16, OS_LOG_TYPE_ERROR, "Not updating lastKnownShmemState in %{public}@: %u -> %llu", buf, 0x1Cu);
        }
        _CFSetTSD(0xFu, 0, 0);
        CFRelease(v15);
      }
    }
  }

}

void __50__CFPrefsPlistSource_alreadylocked_requestNewData__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (a2
    && ((v4 = *(_QWORD *)(a1 + 32), v5 = atomic_load((unsigned __int8 *)(v4 + 129)), (v5 & 1) == 0)
     && !_CFPrefsDirectMode()
      ? (xpc_user_sessions_enabled()
      && (CFEqual(*(CFTypeRef *)(v4 + 80), CFSTR("kCFPreferencesAnyUser"))
       || !xpc_user_sessions_get_session_uid()
       && CFEqual(*(CFTypeRef *)(v4 + 80), CFSTR("kCFPreferencesCurrentUser")))
       ? (v6 = 2)
       : (v6 = 1))
      : (v6 = 3),
        (v7 = (void *)objc_msgSend((id)v4, "createRequestNewContentMessageForDaemon:", v6)) != 0))
  {
    v8 = v7;
    -[CFPrefsPlistSource sendRequestNewDataMessage:toConnection:retryCount:error:](*(_QWORD *)(a1 + 32), v7, a2, 0, (BOOL *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    xpc_release(v8);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (void)sendRequestNewDataMessage:(uint64_t)a3 toConnection:(uint64_t)a4 retryCount:(BOOL *)a5 error:
{
  _BOOL4 v10;
  unsigned __int8 v11;
  const char *v12;
  NSObject *v13;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t v16;
  xpc_object_t (*v17)(uint64_t);
  void *v18;
  uint64_t v19;
  xpc_object_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  uint64_t v27;
  os_activity_scope_state_s state;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (xdict)
    {
      v10 = -[CFPrefsPlistSource attachAccessTokenToMessage:accessType:](a1, xdict, 0);
      *a5 = !v10;
      if (v10)
      {
        v11 = atomic_load((unsigned __int8 *)(a1 + 129));
        if ((v11 & 1) != 0 || _CFPrefsDirectMode())
        {
          v12 = "Loading Preferences From Direct CFPrefsD";
        }
        else if (xpc_user_sessions_enabled()
               && (CFEqual(*(CFTypeRef *)(a1 + 80), CFSTR("kCFPreferencesAnyUser"))
                || !xpc_user_sessions_get_session_uid()
                && CFEqual(*(CFTypeRef *)(a1 + 80), CFSTR("kCFPreferencesCurrentUser"))))
        {
          v12 = "Loading Preferences From System Session CFPrefsD";
        }
        else
        {
          v12 = "Loading Preferences From User Session CFPrefsD";
        }
        v13 = _os_activity_create(&dword_182A8C000, v12, MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
        state.opaque[0] = 0;
        state.opaque[1] = 0;
        os_activity_scope_enter(v13, &state);
        -[CFPrefsPlistSource addPIDImpersonationIfNecessary:]((void *)a1, xdict);
        v22 = 0;
        v23 = &v22;
        v24 = 0x3052000000;
        v25 = __Block_byref_object_copy__7;
        v26 = __Block_byref_object_dispose__7;
        v27 = 0;
        v15 = MEMORY[0x1E0C809B0];
        v16 = 3221225472;
        v17 = __78__CFPrefsPlistSource_sendRequestNewDataMessage_toConnection_retryCount_error___block_invoke;
        v18 = &unk_1E1336DE0;
        v20 = xdict;
        v21 = &v22;
        v19 = a3;
        v14 = atomic_load((unsigned __int8 *)(a1 + 129));
        if ((v14 & 1) != 0 || _CFPrefsDirectMode())
        {
          CFPREFERENCES_IS_WAITING_FOR_DIRECT_CFPREFSD(*(const os_unfair_lock **)(a1 + 8), (uint64_t)&v15);
        }
        else if (xpc_user_sessions_enabled()
               && (CFEqual(*(CFTypeRef *)(a1 + 80), CFSTR("kCFPreferencesAnyUser"))
                || !xpc_user_sessions_get_session_uid()
                && CFEqual(*(CFTypeRef *)(a1 + 80), CFSTR("kCFPreferencesCurrentUser"))))
        {
          CFPREFERENCES_IS_WAITING_FOR_SYSTEM_CFPREFSD(*(const os_unfair_lock **)(a1 + 8), (uint64_t)&v15);
        }
        else
        {
          CFPREFERENCES_IS_WAITING_FOR_USER_CFPREFSD(*(const os_unfair_lock **)(a1 + 8), (uint64_t)&v15);
        }
        objc_msgSend((id)a1, "handleReply:toRequestNewDataMessage:onConnection:retryCount:error:", v23[5], xdict, a3, a4, a5, v15, v16, v17, v18, v19, v20, v21, v22);
        xpc_release((xpc_object_t)v23[5]);

        _Block_object_dispose(&v22, 8);
        os_activity_scope_leave(&state);
      }
    }
    else
    {
      *a5 = 1;
    }
  }
}

xpc_object_t __78__CFPrefsPlistSource_sendRequestNewDataMessage_toConnection_retryCount_error___block_invoke(uint64_t a1)
{
  xpc_object_t result;

  result = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(a1 + 32), *(xpc_object_t *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  return result;
}

- (BOOL)isByHost
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_isByHost);
  return v2 & 1;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[CFPrefsPlistSource _sharedCleanup](self);
  v3.receiver = self;
  v3.super_class = (Class)CFPrefsPlistSource;
  -[CFPrefsSource dealloc](&v3, sel_dealloc);
}

- (void)_sharedCleanup
{
  void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v8;

  if (a1)
  {
    if (atomic_load(a1 + 14))
    {
      v3 = (void *)atomic_load(a1 + 14);
      free(v3);
    }
    v4 = (const void *)a1[11];
    if (v4)
    {
      a1[11] = 0;
      CFRelease(v4);
    }
    v5 = (const void *)a1[10];
    if (v5)
    {
      a1[10] = 0;
      CFRelease(v5);
    }
    v6 = (const void *)a1[12];
    if (v6)
    {
      a1[12] = 0;
      CFRelease(v6);
    }
    if (atomic_load(a1 + 13))
    {
      v8 = (const void *)atomic_load(a1 + 13);
      CFRelease(v8);
    }
  }
}

- (__CFArray)alreadylocked_copyKeyList
{
  unsigned __int8 v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  CFAbsoluteTime Current;
  double stalenessCheckWindowStart;
  __CFString *v10;
  NSObject *v11;
  double v13;
  _BOOL4 v14;
  unsigned int stalenessCheckWindowStaleCount;
  __CFString *v17;
  NSObject *v18;
  int v19;
  objc_super v20;
  _QWORD v21[2];
  uint64_t (*v22)(uint64_t);
  void *v23;
  CFPrefsPlistSource *v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  unsigned int v30;
  __int16 v31;
  unsigned int v32;
  __int16 v33;
  __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (byte_1EDCCE379)
    -[CFPrefsPlistSource alreadylocked_clearCache](self, "alreadylocked_clearCache");
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v22 = __alreadylocked_requestNewDataIfStale_block_invoke;
  v23 = &unk_1E12E5C68;
  v24 = self;
  v3 = atomic_load((unsigned __int8 *)&self->_volatile);
  if ((v3 & 1) == 0)
  {
    v4 = (unsigned int *)atomic_load((unint64_t *)&self->super.shmemEntry);
    if (!v4)
    {
      if (self->super._dict)
      {
        v10 = -[CFPrefsSource copyOSLogDescription](self, "copyOSLogDescription");
        _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
        v11 = _CFPrefsClientLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[CFPrefsPlistSource alreadylocked_copyKeyList].cold.1();
        _CFSetTSD(0xFu, 0, 0);
        CFRelease(v10);
      }
      goto LABEL_13;
    }
    v5 = atomic_load(v4);
    v6 = atomic_load((unsigned int *)&sentinelGeneration);
    if (v5 != v6)
    {
      v7 = atomic_load(&self->super.lastKnownShmemState);
      if (v5 != v7)
      {
        Current = CFAbsoluteTimeGetCurrent();
        stalenessCheckWindowStart = self->super.stalenessCheckWindowStart;
        if (stalenessCheckWindowStart == 0.0)
        {
          self->super.stalenessCheckWindowStart = Current;
          self->super.stalenessCheckWindowStaleCount = 1;
        }
        else
        {
          v13 = Current - stalenessCheckWindowStart;
          if (Current - stalenessCheckWindowStart >= 0.5)
          {
            self->super.stalenessCheckWindowStart = 0.0;
            stalenessCheckWindowStaleCount = self->super.stalenessCheckWindowStaleCount;
            v14 = stalenessCheckWindowStaleCount > 0xFA;
            if (stalenessCheckWindowStaleCount > 0xFA)
              v13 = 0.5;
          }
          else
          {
            v14 = 0;
            stalenessCheckWindowStaleCount = ++self->super.stalenessCheckWindowStaleCount;
          }
          if (stalenessCheckWindowStaleCount - 251 < 9 || v14)
          {
            v17 = -[CFPrefsSource copyOSLogDescription](self, "copyOSLogDescription");
            _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
            v18 = _CFPrefsClientLog();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              v19 = self->super.stalenessCheckWindowStaleCount;
              *(_DWORD *)buf = 67110146;
              v26 = v19;
              v27 = 1024;
              v28 = (int)(v13 * 1000.0);
              v29 = 1024;
              v30 = v5;
              v31 = 1024;
              v32 = v7;
              v33 = 2114;
              v34 = v17;
              _os_log_error_impl(&dword_182A8C000, v18, OS_LOG_TYPE_ERROR, "Source was stale %i times within the last %i ms (%i (latestGeneration) != %i (lastKnownShmemState)): %{public}@", buf, 0x24u);
            }
            _CFSetTSD(0xFu, 0, 0);
            CFRelease(v17);
          }
        }
LABEL_13:
        os_unfair_lock_assert_owner(&self->super._lock);
        v22((uint64_t)v21);
      }
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)CFPrefsPlistSource;
  return -[CFPrefsSource alreadylocked_copyKeyList](&v20, sel_alreadylocked_copyKeyList);
}

- (void)setFileProtectionClass:(int)a3
{
  atomic_store(a3, (unsigned int *)&self->_fileProtectionClass);
}

- (void)setAccessRestricted:(BOOL)a3
{
  atomic_store(a3, (unsigned __int8 *)&self->_restrictedAccess);
}

- (void)setDaemonCacheEnabled:(BOOL)a3
{
  atomic_store(!a3, (unsigned __int8 *)&self->_avoidsDaemonCache);
}

- (void)goVolatileAfterTryingToWriteKeys:(const __CFString *)a3 values:(uint64_t)a4 count:
{
  if (a1)
  {
    -[CFPrefsPlistSource writeFailedForKeys:values:count:](a1, a2, a3, a4);
    atomic_store(1u, (unsigned __int8 *)(a1 + 121));
  }
}

- (BOOL)isDirectModeEnabled
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_directMode);
  return v2 & 1;
}

- (void)goReadOnlyAfterTryingToWriteKeys:(const __CFString *)a3 values:(uint64_t)a4 count:
{
  if (a1)
  {
    -[CFPrefsPlistSource writeFailedForKeys:values:count:](a1, a2, a3, a4);
    atomic_store(1u, (unsigned __int8 *)(a1 + 122));
  }
}

- (uint64_t)handleErrorReply:(void *)a3 toMessage:(int)a4 retryCount:(uint64_t)a5 retryContinuation:
{
  if (result)
    return -[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:](result, a2, a3, 0, 0, 0, a4, a5);
  return result;
}

void __81__CFPrefsPlistSource_handlePossibleOversizedMessage_forWritingKeys_values_count___block_invoke()
{
  __CFNotificationCenter *LocalCenter;

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, CFSTR("com.apple.CFPreferences.byteCountLimitReached"), 0, 0, 1u);
}

void __105__CFPrefsPlistSource_handleErrorReply_toMessage_settingKeys_toValues_count_retryCount_retryContinuation___block_invoke()
{
  NSObject *v0;

  v0 = _CFPrefsClientLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __105__CFPrefsPlistSource_handleErrorReply_toMessage_settingKeys_toValues_count_retryCount_retryContinuation___block_invoke_cold_1();
}

- (BOOL)servedByUserSessionDaemon
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_directMode);
  return (v2 & 1) == 0
      && !_CFPrefsDirectMode()
      && (!xpc_user_sessions_enabled()
       || !CFEqual(self->userIdentifier, CFSTR("kCFPreferencesAnyUser"))
       && (xpc_user_sessions_get_session_uid()
        || !CFEqual(self->userIdentifier, CFSTR("kCFPreferencesCurrentUser"))));
}

void __99__CFPrefsPlistSource_sendFullyPreparedMessage_toConnection_settingValues_forKeys_count_retryCount___block_invoke_2(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  _BOOL4 v4;
  uint64_t v5;

  v2 = xpc_copy(*(xpc_object_t *)(a1 + 32));
  v3 = v2;
  if (byte_1EDCCE37C)
    xpc_dictionary_set_BOOL(v2, "PreviousMessageInjectedFailure", 1);
  v4 = -[CFPrefsPlistSource attachAccessTokenToMessage:accessType:](*(_QWORD *)(a1 + 40), v3, 1);
  v5 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    -[CFPrefsPlistSource sendFullyPreparedMessage:toConnection:settingValues:forKeys:count:retryCount:](*(_QWORD *)(a1 + 40), (int)v3, *(xpc_connection_t *)(a1 + 48));
  }
  else if (v5)
  {
    -[CFPrefsPlistSource writeFailedForKeys:values:count:](*(_QWORD *)(a1 + 40), *(const void ***)(a1 + 64), *(const __CFString ***)(a1 + 56), *(_QWORD *)(a1 + 72));
    atomic_store(1u, (unsigned __int8 *)(v5 + 122));
  }
  xpc_release(v3);
}

- (void)requestPlistValidation
{
  unsigned __int8 v1;
  _xpc_connection_s **v3;
  unsigned __int8 v4;
  int v5;
  const void *v6;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = atomic_load(requestInvalidPropertyListDeletion);
    if ((v1 & 1) != 0)
    {
      v3 = *(_xpc_connection_s ***)(a1 + 8);
      v4 = atomic_load((unsigned __int8 *)(a1 + 129));
      if ((v4 & 1) != 0 || _CFPrefsDirectMode())
      {
        v5 = 3;
      }
      else if (xpc_user_sessions_enabled()
             && (CFEqual(*(CFTypeRef *)(a1 + 80), CFSTR("kCFPreferencesAnyUser"))
              || !xpc_user_sessions_get_session_uid()
              && CFEqual(*(CFTypeRef *)(a1 + 80), CFSTR("kCFPreferencesCurrentUser"))))
      {
        v5 = 2;
      }
      else
      {
        v5 = 1;
      }
      v6 = (const void *)objc_msgSend((id)a1, "userIdentifier");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __44__CFPrefsPlistSource_requestPlistValidation__block_invoke;
      v7[3] = &unk_1E1336668;
      v7[4] = a1;
      -[_CFXPreferences withConnectionForRole:andUserIdentifier:performBlock:](v3, v5, v6, (uint64_t)v7);
    }
  }
}

void __44__CFPrefsPlistSource_requestPlistValidation__block_invoke(uint64_t a1, _xpc_connection_s *a2)
{
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *global_queue;
  uint8_t v8[8];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "createSynchronizeMessage");
  if (v4)
  {
    v5 = v4;
    if (-[CFPrefsPlistSource attachAccessTokenToMessage:accessType:](*(_QWORD *)(a1 + 32), v4, 0))
    {
      -[CFPrefsPlistSource addPIDImpersonationIfNecessary:](*(void **)(a1 + 32), v5);
      xpc_dictionary_set_BOOL(v5, "ValidatePlist", 1);
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
      v6 = _CFPrefsClientLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_182A8C000, v6, OS_LOG_TYPE_INFO, "Requesting validation of plist after invalid data detected", v8, 2u);
      }
      _CFSetTSD(0xFu, 0, 0);
      global_queue = dispatch_get_global_queue(17, 0);
      xpc_connection_send_message_with_reply(a2, v5, global_queue, &__block_literal_global_48);
    }
    xpc_release(v5);
  }
}

void __88__CFPrefsPlistSource_handleReply_toRequestNewDataMessage_onConnection_retryCount_error___block_invoke(uint64_t a1, uint64_t a2)
{
  if (byte_1EDCCE37C)
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "PreviousMessageInjectedFailure", 1);
  -[CFPrefsPlistSource sendRequestNewDataMessage:toConnection:retryCount:error:](*(_QWORD *)(a1 + 40), *(xpc_object_t *)(a1 + 32), *(_QWORD *)(a1 + 48), a2, *(BOOL **)(a1 + 56));
}

void __88__CFPrefsPlistSource_handleReply_toRequestNewDataMessage_onConnection_retryCount_error___block_invoke_57(uint64_t a1, CFStringRef theString, const void *a3)
{
  const void *Value;
  const void *v7;
  CFStringRef v8;
  const void *v9;
  const void *v10;
  NSObject *v11;
  uint8_t buf[4];
  const void *v13;
  __int16 v14;
  CFStringRef v15;
  __int16 v16;
  const void *v17;
  __int16 v18;
  const void *v19;
  __int16 v20;
  const void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!CFStringHasPrefix(theString, CFSTR("Sig_")))
  {
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), theString);
    v7 = Value;
    if (!Value || !CFEqual(Value, a3))
    {
      v8 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%s%@"), "Sig_", theString);
      v9 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 48), v8);
      CFRelease(v8);
      v10 = (const void *)objc_msgSend(*(id *)(a1 + 32), "copyOSLogDescription");
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
      v11 = _CFPrefsClientLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138544387;
        v13 = v10;
        v14 = 2114;
        v15 = theString;
        v16 = 2113;
        v17 = v7;
        v18 = 2113;
        v19 = a3;
        v20 = 2114;
        v21 = v9;
        _os_log_error_impl(&dword_182A8C000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Value for key %{public}@ was %{private}@. Expected %{private}@ (%{public}@)", buf, 0x34u);
      }
      _CFSetTSD(0xFu, 0, 0);
      CFRelease(v10);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), theString, a3);
    }
  }
}

- (void)alreadylocked_clearCache
{
  __CFDictionary *dict;

  os_unfair_lock_assert_owner(&self->super._lock);
  dict = self->super._dict;
  if (dict && CFDictionaryGetCount(dict) && !atomic_load((unint64_t *)&self->_locallySetDict))
  {
    CFRelease(self->super._dict);
    self->super._dict = 0;
    atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)&self->super._generationCount);
    atomic_store(0, &self->super.lastKnownShmemState);
    atomic_store(0, (unint64_t *)&self->super.shmemEntry);
  }
}

- (int64_t)alreadylocked_generationCount
{
  unsigned __int8 v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  CFAbsoluteTime Current;
  double stalenessCheckWindowStart;
  __CFString *v10;
  NSObject *v11;
  double v13;
  _BOOL4 v14;
  unsigned int stalenessCheckWindowStaleCount;
  __CFString *v17;
  NSObject *v18;
  int v19;
  _QWORD v20[2];
  uint64_t (*v21)(uint64_t);
  void *v22;
  CFPrefsPlistSource *v23;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
  unsigned int v31;
  __int16 v32;
  __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (byte_1EDCCE379)
    -[CFPrefsPlistSource alreadylocked_clearCache](self, "alreadylocked_clearCache");
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v21 = __alreadylocked_requestNewDataIfStale_block_invoke;
  v22 = &unk_1E12E5C68;
  v23 = self;
  v3 = atomic_load((unsigned __int8 *)&self->_volatile);
  if ((v3 & 1) == 0)
  {
    v4 = (unsigned int *)atomic_load((unint64_t *)&self->super.shmemEntry);
    if (!v4)
    {
      if (self->super._dict)
      {
        v10 = -[CFPrefsSource copyOSLogDescription](self, "copyOSLogDescription");
        _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
        v11 = _CFPrefsClientLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[CFPrefsPlistSource alreadylocked_generationCount].cold.1();
        _CFSetTSD(0xFu, 0, 0);
        CFRelease(v10);
      }
      goto LABEL_13;
    }
    v5 = atomic_load(v4);
    v6 = atomic_load((unsigned int *)&sentinelGeneration);
    if (v5 != v6)
    {
      v7 = atomic_load(&self->super.lastKnownShmemState);
      if (v5 != v7)
      {
        Current = CFAbsoluteTimeGetCurrent();
        stalenessCheckWindowStart = self->super.stalenessCheckWindowStart;
        if (stalenessCheckWindowStart == 0.0)
        {
          self->super.stalenessCheckWindowStart = Current;
          self->super.stalenessCheckWindowStaleCount = 1;
        }
        else
        {
          v13 = Current - stalenessCheckWindowStart;
          if (Current - stalenessCheckWindowStart >= 0.5)
          {
            self->super.stalenessCheckWindowStart = 0.0;
            stalenessCheckWindowStaleCount = self->super.stalenessCheckWindowStaleCount;
            v14 = stalenessCheckWindowStaleCount > 0xFA;
            if (stalenessCheckWindowStaleCount > 0xFA)
              v13 = 0.5;
          }
          else
          {
            v14 = 0;
            stalenessCheckWindowStaleCount = ++self->super.stalenessCheckWindowStaleCount;
          }
          if (stalenessCheckWindowStaleCount - 251 < 9 || v14)
          {
            v17 = -[CFPrefsSource copyOSLogDescription](self, "copyOSLogDescription");
            _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
            v18 = _CFPrefsClientLog();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              v19 = self->super.stalenessCheckWindowStaleCount;
              *(_DWORD *)buf = 67110146;
              v25 = v19;
              v26 = 1024;
              v27 = (int)(v13 * 1000.0);
              v28 = 1024;
              v29 = v5;
              v30 = 1024;
              v31 = v7;
              v32 = 2114;
              v33 = v17;
              _os_log_error_impl(&dword_182A8C000, v18, OS_LOG_TYPE_ERROR, "Source was stale %i times within the last %i ms (%i (latestGeneration) != %i (lastKnownShmemState)): %{public}@", buf, 0x24u);
            }
            _CFSetTSD(0xFu, 0, 0);
            CFRelease(v17);
          }
        }
LABEL_13:
        os_unfair_lock_assert_owner(&self->super._lock);
        v21((uint64_t)v20);
      }
    }
  }
  return atomic_load((unint64_t *)&self->super._generationCount);
}

- (int64_t)generationCount
{
  unsigned __int8 v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  CFAbsoluteTime Current;
  double stalenessCheckWindowStart;
  __CFString *v10;
  NSObject *v11;
  double v13;
  _BOOL4 v14;
  unsigned int stalenessCheckWindowStaleCount;
  __CFString *v17;
  NSObject *v18;
  int v19;
  _QWORD v20[2];
  uint64_t (*v21)(uint64_t);
  void *v22;
  CFPrefsPlistSource *v23;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
  unsigned int v31;
  __int16 v32;
  __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock(&self->super._lock);
  if (byte_1EDCCE379)
    -[CFPrefsPlistSource alreadylocked_clearCache](self, "alreadylocked_clearCache");
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v21 = __alreadylocked_requestNewDataIfStale_block_invoke;
  v22 = &unk_1E12E5C68;
  v23 = self;
  v3 = atomic_load((unsigned __int8 *)&self->_volatile);
  if ((v3 & 1) == 0)
  {
    v4 = (unsigned int *)atomic_load((unint64_t *)&self->super.shmemEntry);
    if (!v4)
    {
      if (self->super._dict)
      {
        v10 = -[CFPrefsSource copyOSLogDescription](self, "copyOSLogDescription");
        _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
        v11 = _CFPrefsClientLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[CFPrefsPlistSource generationCount].cold.1();
        _CFSetTSD(0xFu, 0, 0);
        CFRelease(v10);
      }
      goto LABEL_13;
    }
    v5 = atomic_load(v4);
    v6 = atomic_load((unsigned int *)&sentinelGeneration);
    if (v5 != v6)
    {
      v7 = atomic_load(&self->super.lastKnownShmemState);
      if (v5 != v7)
      {
        Current = CFAbsoluteTimeGetCurrent();
        stalenessCheckWindowStart = self->super.stalenessCheckWindowStart;
        if (stalenessCheckWindowStart == 0.0)
        {
          self->super.stalenessCheckWindowStart = Current;
          self->super.stalenessCheckWindowStaleCount = 1;
        }
        else
        {
          v13 = Current - stalenessCheckWindowStart;
          if (Current - stalenessCheckWindowStart >= 0.5)
          {
            self->super.stalenessCheckWindowStart = 0.0;
            stalenessCheckWindowStaleCount = self->super.stalenessCheckWindowStaleCount;
            v14 = stalenessCheckWindowStaleCount > 0xFA;
            if (stalenessCheckWindowStaleCount > 0xFA)
              v13 = 0.5;
          }
          else
          {
            v14 = 0;
            stalenessCheckWindowStaleCount = ++self->super.stalenessCheckWindowStaleCount;
          }
          if (stalenessCheckWindowStaleCount - 251 < 9 || v14)
          {
            v17 = -[CFPrefsSource copyOSLogDescription](self, "copyOSLogDescription");
            _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
            v18 = _CFPrefsClientLog();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              v19 = self->super.stalenessCheckWindowStaleCount;
              *(_DWORD *)buf = 67110146;
              v25 = v19;
              v26 = 1024;
              v27 = (int)(v13 * 1000.0);
              v28 = 1024;
              v29 = v5;
              v30 = 1024;
              v31 = v7;
              v32 = 2114;
              v33 = v17;
              _os_log_error_impl(&dword_182A8C000, v18, OS_LOG_TYPE_ERROR, "Source was stale %i times within the last %i ms (%i (latestGeneration) != %i (lastKnownShmemState)): %{public}@", buf, 0x24u);
            }
            _CFSetTSD(0xFu, 0, 0);
            CFRelease(v17);
          }
        }
LABEL_13:
        os_unfair_lock_assert_owner(&self->super._lock);
        v21((uint64_t)v20);
      }
    }
  }
  os_unfair_lock_unlock(&self->super._lock);
  return atomic_load((unint64_t *)&self->super._generationCount);
}

- (void)setDomainIdentifier:.cold.1()
{
  __assert_rtn("-[CFPrefsPlistSource setDomainIdentifier:]", "CFPrefsPlistSource.m", 124, "!CFEqual(domainIdent, kCFPreferencesCurrentApplication)");
}

- (void)alreadylocked_copyKeyList
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_19();
  OUTLINED_FUNCTION_0_37(&dword_182A8C000, v0, v1, "Source was stale because shmem was null: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_25();
}

- (void)alreadylocked_copyDictionary
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_19();
  OUTLINED_FUNCTION_0_37(&dword_182A8C000, v0, v1, "Source was stale because shmem was null: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_25();
}

- (void)alreadylocked_setPrecopiedValues:forKeys:count:from:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_5_5(&dword_182A8C000, v0, v1, "setting %{private}@ in %{public}@");
  OUTLINED_FUNCTION_1_25();
}

- (void)alreadylocked_setPrecopiedValues:forKeys:count:from:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_19();
  OUTLINED_FUNCTION_0_37(&dword_182A8C000, v0, v1, "Source was stale because shmem was null: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_25();
}

- (void)createSynchronizeMessage
{
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t error_description;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 136446466;
  v5 = a1;
  v6 = 2082;
  error_description = container_get_error_description();
  _os_log_error_impl(&dword_182A8C000, a3, OS_LOG_TYPE_ERROR, "Could not lookup group container %{public}s: %{public}s", (uint8_t *)&v4, 0x16u);
}

- (void)transitionIntoDirectModeIfNeededWithRetryBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_19();
  OUTLINED_FUNCTION_0_37(&dword_182A8C000, v0, v1, "%{public}@: Transitioning into direct mode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_25();
}

- (void)handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:.cold.1()
{
  __assert_rtn("-[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:]", "CFPrefsPlistSource.m", 979, "reply");
}

- (void)handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9_1(&dword_182A8C000, v0, v1, "cfprefsd crashed, retrying message", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7_3();
}

- (void)handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:.cold.3()
{
  __assert_rtn("-[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:]", "CFPrefsPlistSource.m", 1071, "xpc_get_type(reply) == XPC_TYPE_DICTIONARY");
}

- (void)handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_19();
  OUTLINED_FUNCTION_10_0(&dword_182A8C000, v0, v1, "cfprefsd has asked to provide an access token for %{private}s too many times. Bailing out.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_25();
}

- (void)handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_19();
  OUTLINED_FUNCTION_10_0(&dword_182A8C000, v0, v1, "cfprefsd has asked to create directory for %{private}s too many times. Bailing out.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_25();
}

- (void)handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_8_3(&dword_182A8C000, v0, v1, "cfprefsd required creation of a directory, but failed to provide the path.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7_3();
}

- (void)handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_19();
  OUTLINED_FUNCTION_0_37(&dword_182A8C000, v0, v1, "Failed to compute parent directory path for %{private}s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_25();
}

- (void)handleErrorReply:(uint64_t)a3 toMessage:(NSObject *)a4 settingKeys:toValues:count:retryCount:retryContinuation:.cold.8(uint64_t a1, int *a2, uint64_t a3, NSObject *a4)
{
  int v4;

  v4 = *a2;
  *(_DWORD *)a3 = 136380931;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 1024;
  *(_DWORD *)(a3 + 14) = v4;
  OUTLINED_FUNCTION_13_0(&dword_182A8C000, a4, a3, "Failed to create directory %{private}s because of %{darwin.errno}d.", (uint8_t *)a3);
}

- (void)handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:.cold.9()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_19();
  _os_log_debug_impl(&dword_182A8C000, v0, OS_LOG_TYPE_DEBUG, "Successfully created directory %{private}s. Retrying write.", v1, 0xCu);
  OUTLINED_FUNCTION_1_25();
}

- (void)handlePossibleOversizedMessage:(uint64_t)a1 forWritingKeys:values:count:.cold.1(uint64_t a1)
{
  os_log_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543618;
  v3 = a1;
  OUTLINED_FUNCTION_11_0();
  _os_log_debug_impl(&dword_182A8C000, v1, OS_LOG_TYPE_DEBUG, "%{public}@: Attempt to store >= %d bytes of data in CFPreferences/NSUserDefaults was allowed by virtue of direct mode", (uint8_t *)&v2, 0x12u);
  OUTLINED_FUNCTION_1_25();
}

- (void)handlePossibleOversizedMessage:(uint64_t)a1 forWritingKeys:(const void *)a2 values:(const void *)a3 count:(CFIndex)a4 .cold.2(uint64_t a1, const void **a2, const void **a3, CFIndex a4)
{
  if ((xpc_user_sessions_enabled() & 1) != 0
    && !CFEqual(*(CFTypeRef *)(a1 + 80), CFSTR("kCFPreferencesAnyUser"))
    && !xpc_user_sessions_get_session_uid())
  {
    CFEqual(*(CFTypeRef *)(a1 + 80), CFSTR("kCFPreferencesCurrentUser"));
  }
  __CFPREFERENCES_HAS_DETECTED_THIS_APP_TRYING_TO_STORE_TOO_MUCH_DATA__((void *)a1, a2, a3, a4);
  atomic_store(1u, (unsigned __int8 *)(a1 + 128));
}

void __105__CFPrefsPlistSource_handleErrorReply_toMessage_settingKeys_toValues_count_retryCount_retryContinuation___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_8_3(&dword_182A8C000, v0, v1, "Could not connect to cfprefsd. No CFPreferences/NSUserDefaults changes will be saved", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7_3();
}

- (void)alreadylocked_requestNewData
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_19();
  OUTLINED_FUNCTION_0_37(&dword_182A8C000, v0, v1, "Source was stale because shmem was null: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_25();
}

- (void)createRequestNewContentMessageForDaemon:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_19();
  OUTLINED_FUNCTION_0_37(&dword_182A8C000, v0, v1, "Source was stale because shmem was null: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_25();
}

- (void)handleReply:toRequestNewDataMessage:onConnection:retryCount:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_3_9(&dword_182A8C000, v0, v1, "serialized validation data for %{public}@ was not a dictionary plist. Error: %{public}@");
  OUTLINED_FUNCTION_1_25();
}

- (void)handleReply:toRequestNewDataMessage:onConnection:retryCount:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_19();
  OUTLINED_FUNCTION_0_37(&dword_182A8C000, v0, v1, "A RequestNewData response gave an invalid plist. We'll return wrong data this time, but NOT going volatile. Sent a request to validate the plist in the daemon and remove it if invalid. %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_25();
}

- (void)handleReply:toRequestNewDataMessage:onConnection:retryCount:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_19();
  OUTLINED_FUNCTION_0_37(&dword_182A8C000, v0, v1, "plist diff for %{public}@ was invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_25();
}

- (void)handleReply:(NSObject *)a3 toRequestNewDataMessage:onConnection:retryCount:error:.cold.4(uint64_t a1, int a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  OUTLINED_FUNCTION_13_0(&dword_182A8C000, a3, (uint64_t)a3, "failed to map file from disk for %{public}@. error: %{darwin.errno}d", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_25();
}

- (void)handleReply:toRequestNewDataMessage:onConnection:retryCount:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_19();
  OUTLINED_FUNCTION_0_37(&dword_182A8C000, v0, v1, "bad plist data: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_25();
}

- (void)handleReply:toRequestNewDataMessage:onConnection:retryCount:error:.cold.6()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_3_9(&dword_182A8C000, v0, v1, "file read from disk for %{public}@ was not a plist. Error: %{public}@");
  OUTLINED_FUNCTION_1_25();
}

- (void)handleReply:toRequestNewDataMessage:onConnection:retryCount:error:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_19();
  OUTLINED_FUNCTION_0_37(&dword_182A8C000, v0, v1, "plist read from disk for %{public}@ was not a dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_25();
}

- (void)handleReply:(os_log_t)log toRequestNewDataMessage:onConnection:retryCount:error:.cold.8(int *a1, uint8_t *buf, os_log_t log)
{
  int v3;

  v3 = *a1;
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = v3;
  _os_log_error_impl(&dword_182A8C000, log, OS_LOG_TYPE_ERROR, "failed to lstat plist fd: %{darwin.errno}d.", buf, 8u);
}

- (void)handleReply:toRequestNewDataMessage:onConnection:retryCount:error:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_19();
  OUTLINED_FUNCTION_0_37(&dword_182A8C000, v0, v1, "serialized plist for %{public}@ was not a dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_25();
}

- (void)handleReply:toRequestNewDataMessage:onConnection:retryCount:error:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_19();
  OUTLINED_FUNCTION_0_37(&dword_182A8C000, v0, v1, "bad plist data: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_25();
}

- (void)handleReply:toRequestNewDataMessage:onConnection:retryCount:error:.cold.11()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_3_9(&dword_182A8C000, v0, v1, "serialized data for %{public}@ was not a plist. Error: %{public}@");
  OUTLINED_FUNCTION_1_25();
}

- (void)alreadylocked_generationCount
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_19();
  OUTLINED_FUNCTION_0_37(&dword_182A8C000, v0, v1, "Source was stale because shmem was null: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_25();
}

- (void)generationCount
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_19();
  OUTLINED_FUNCTION_0_37(&dword_182A8C000, v0, v1, "Source was stale because shmem was null: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_25();
}

@end
