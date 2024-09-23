@implementation NSObject(LockingAdditions)

- (uint64_t)mf_tryLock
{
  _QWORD *v2;

  pthread_mutex_lock(&sMutex);
  v2 = _MFFindObjectLock(a1, 1);
  return _MFTryObjectLock((uint64_t)v2);
}

+ (uint64_t)mf_clearLocks
{
  pthread_t v0;
  uint64_t v1;
  pthread_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  int v9;
  __int16 v10;
  __int16 v11;
  const __CFArray *v12;
  id v13;
  __objc2_class **p_superclass;
  const __CFDictionary *v15;
  pthread_t v16;
  void *Value;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  __CFDictionary *v28;
  pthread_t v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[4];
  void *v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  int v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock(&sMutex);
  if (sFirstLock)
  {
    v0 = pthread_self();
    v1 = sFirstLock;
    if (sFirstLock)
    {
      v2 = v0;
      do
      {
        if (*(pthread_t *)(v1 + 16) == v2)
        {
          v3 = MFLogGeneral();
          if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
          {
            v4 = *(_WORD *)(v1 + 72) & 0x7FFF;
            v5 = *(_QWORD *)(v1 + 8);
            v6 = *(_QWORD *)(v1 + 16);
            *(_DWORD *)buf = 134218496;
            v38 = v5;
            v39 = 1024;
            v40 = v4;
            v41 = 2048;
            v42 = v6;
            _os_log_impl(&dword_1ABB13000, v3, OS_LOG_TYPE_INFO, "object %p still holds lock (count=%u) in thread %p", buf, 0x1Cu);
          }
          v7 = *(void **)(v1 + 8);
          if (_mfCallStackLoggingEnabled())
          {
            v8 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
            objc_setAssociatedObject(v7, CFSTR("MFLock Call Stack Symbols"), 0, (void *)0x301);
            objc_msgSend(v8, "drain");
          }
          v9 = *(__int16 *)(v1 + 72);
          if (v9 < 0)
          {
            *(_WORD *)(v1 + 72) = v9 & 0x8000;
            *(_QWORD *)(v1 + 16) = 0;
            v12 = *(const __CFArray **)(v1 + 80);
            if (!v12 || !CFArrayGetCount(v12))
              goto LABEL_18;
            pthread_cond_broadcast((pthread_cond_t *)(v1 + 24));
          }
          else
          {
            v10 = *(_WORD *)(v1 + 80);
            if (*(_WORD *)(v1 + 72))
            {
              do
              {
                v11 = v9 - 1;
                LOWORD(v9) = v9 & 0x8000 | (v9 - 1) & 0x7FFF;
                --v10;
              }
              while ((v11 & 0x7FFF) != 0);
              *(_WORD *)(v1 + 72) = v9;
              *(_WORD *)(v1 + 80) = v10;
            }
            *(_QWORD *)(v1 + 16) = 0;
            if (!v10)
            {
LABEL_18:
              _MFRecycleObjectLock(v1);
              goto LABEL_19;
            }
            pthread_cond_signal((pthread_cond_t *)(v1 + 24));
          }
        }
LABEL_19:
        v1 = *(_QWORD *)v1;
      }
      while (v1);
    }
  }
  pthread_mutex_unlock(&sMutex);
  v13 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  pthread_mutex_lock(&__threadLockRelationsLock);
  p_superclass = _MFCoreTelephonySubscriptionChangeListener.superclass;
  v15 = (const __CFDictionary *)__threadLockRelations;
  v16 = pthread_self();
  Value = (void *)CFDictionaryGetValue(v15, v16);
  v18 = (id)objc_msgSend(Value, "copy");
  pthread_mutex_unlock(&__threadLockRelationsLock);
  if (Value)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, buf, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v32 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          v24 = objc_msgSend(v18, "countForObject:", v23);
          if (v24)
          {
            v25 = v24;
            do
            {
              v26 = MFLogGeneral();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v35 = 138412290;
                v36 = v23;
                _os_log_impl(&dword_1ABB13000, v26, OS_LOG_TYPE_DEFAULT, "#Warning Unlocking blown lock %@", v35, 0xCu);
              }
              --v25;
              objc_msgSend(v23, "unlock");
            }
            while (v25);
          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, buf, 16);
      }
      while (v20);
    }
    if (objc_msgSend(Value, "count"))
    {
      v27 = MFLogGeneral();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v35 = 138412290;
        v36 = Value;
        _os_log_impl(&dword_1ABB13000, v27, OS_LOG_TYPE_DEFAULT, "#Warning ERROR: We released all locks tracked, but we still have %@", v35, 0xCu);
      }
    }
    objc_msgSend(Value, "removeAllObjects");
    pthread_mutex_lock(&__threadLockRelationsLock);
    p_superclass = (__objc2_class **)(_MFCoreTelephonySubscriptionChangeListener + 8);
    if (CFArrayGetCount((CFArrayRef)__threadLockEmptySets) <= 19)
      CFArrayAppendValue((CFMutableArrayRef)__threadLockEmptySets, Value);
  }
  else
  {
    pthread_mutex_lock(&__threadLockRelationsLock);
  }
  v28 = (__CFDictionary *)p_superclass[239];
  v29 = pthread_self();
  CFDictionaryRemoveValue(v28, v29);
  pthread_mutex_unlock(&__threadLockRelationsLock);
  return objc_msgSend(v13, "drain");
}

- (uint64_t)_mf_checkToAllowLock:()LockingAdditions
{
  pthread_mutex_lock(&sMutex);
  objc_msgSend(a1, "_mf_ntsCheckToAllowLock:", a3);
  return pthread_mutex_unlock(&sMutex);
}

- (uint64_t)mf_lock
{
  _QWORD *v2;

  pthread_mutex_lock(&sMutex);
  objc_msgSend(a1, "_mf_ntsCheckToAllowLock:", a1);
  v2 = _MFFindObjectLock((uint64_t)a1, 1);
  return _MFAcquireObjectLock((uint64_t)v2);
}

- (uint64_t)_mf_ntsCheckToAllowLock:()LockingAdditions
{
  objc_msgSend(a1, "_mf_checkToAllowOrderingWithLock:");
  objc_msgSend(a1, "_mf_checkToAllowStrictProgressionWithLock:", a3);
  return objc_msgSend(a1, "_mf_checkToAllowExclusiveLocksWithLock:", a3);
}

- (uint64_t)_mf_checkToAllowStrictProgressionWithLock:()LockingAdditions
{
  const __CFString *v4;
  void *v5;
  uint64_t result;
  const char *v7;
  const char *v9;
  __CFString *v10;
  __CFString *v11;

  if (a3 == a1)
    v4 = CFSTR("com.apple.Message.MFLockOrderingSelfReference");
  else
    v4 = a3;
  v5 = (void *)-[__CFString _mf_lockOrderingForType:](a1, "_mf_lockOrderingForType:", 2);
  result = objc_msgSend(v5, "indexOfObject:", v4);
  if (v5)
  {
    v7 = (const char *)result;
    if (result != 0x7FFFFFFFFFFFFFFFLL && result != 0)
    {
      v9 = 0;
      do
      {
        v10 = (__CFString *)objc_msgSend(v5, "objectAtIndex:", v9);
        if (v10 == CFSTR("com.apple.Message.MFLockOrderingSelfReference"))
          v11 = a1;
        else
          v11 = v10;
        if (-[__CFString conformsToProtocol:](v11, "conformsToProtocol:", &unk_1EEC465D8))
        {
          result = -[__CFString isLockedByMe](v11, "isLockedByMe");
          if ((_DWORD)result)
            -[NSObject(LockingAdditions) _mf_checkToAllowStrictProgressionWithLock:].cold.1(a1, v7, (uint64_t)v5);
        }
        else
        {
          result = -[__CFString _mf_ntsIsLocked](v11, "_mf_ntsIsLocked");
          if ((_DWORD)result)
            -[NSObject(LockingAdditions) _mf_checkToAllowStrictProgressionWithLock:].cold.2(a1, v7, (uint64_t)v5);
        }
        ++v9;
      }
      while (v7 != v9);
    }
  }
  return result;
}

- (unint64_t)_mf_checkToAllowOrderingWithLock:()LockingAdditions
{
  const __CFString *v4;
  void *v5;
  unint64_t result;
  const char *v7;
  const char *v8;
  unint64_t v9;
  __CFString *v10;
  __CFString *v11;

  if (a3 == a1)
    v4 = CFSTR("com.apple.Message.MFLockOrderingSelfReference");
  else
    v4 = a3;
  v5 = (void *)-[__CFString _mf_lockOrderingForType:](a1, "_mf_lockOrderingForType:", 1);
  result = objc_msgSend(v5, "indexOfObject:", v4);
  if (v5)
  {
    v7 = (const char *)result;
    if (result != 0x7FFFFFFFFFFFFFFFLL)
    {
      result = objc_msgSend(v5, "count");
      v8 = v7 + 1;
      if ((unint64_t)(v7 + 1) < result)
      {
        v9 = result;
        do
        {
          v10 = (__CFString *)objc_msgSend(v5, "objectAtIndex:", v8);
          if (v10 == CFSTR("com.apple.Message.MFLockOrderingSelfReference"))
            v11 = a1;
          else
            v11 = v10;
          if (-[__CFString conformsToProtocol:](v11, "conformsToProtocol:", &unk_1EEC465D8))
          {
            result = -[__CFString isLockedByMe](v11, "isLockedByMe");
            if ((_DWORD)result)
              -[NSObject(LockingAdditions) _mf_checkToAllowOrderingWithLock:].cold.1(a1, v7, (uint64_t)v5);
          }
          else
          {
            result = -[__CFString _mf_ntsIsLocked](v11, "_mf_ntsIsLocked");
            if ((_DWORD)result)
              -[NSObject(LockingAdditions) _mf_checkToAllowOrderingWithLock:].cold.2(a1, v7, (uint64_t)v5);
          }
          ++v8;
        }
        while ((const char *)v9 != v8);
      }
    }
  }
  return result;
}

- (uint64_t)_mf_checkToAllowExclusiveLocksWithLock:()LockingAdditions
{
  const __CFString *v4;
  void *v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a3 == a1)
    v4 = CFSTR("com.apple.Message.MFLockOrderingSelfReference");
  else
    v4 = a3;
  v5 = (void *)-[__CFString _mf_lockOrderingForType:](a1, "_mf_lockOrderingForType:", 3);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (result)
  {
    v7 = result;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(__CFString **)(*((_QWORD *)&v12 + 1) + 8 * v9);
        if (v10 != v4)
        {
          if (v10 == CFSTR("com.apple.Message.MFLockOrderingSelfReference"))
            v11 = a1;
          else
            v11 = *(__CFString **)(*((_QWORD *)&v12 + 1) + 8 * v9);
          if (-[__CFString conformsToProtocol:](v11, "conformsToProtocol:", &unk_1EEC465D8))
          {
            if (-[__CFString isLockedByMe](v11, "isLockedByMe"))
              -[NSObject(LockingAdditions) _mf_checkToAllowExclusiveLocksWithLock:].cold.1(v5);
          }
          else if (-[__CFString _mf_ntsIsLocked](v11, "_mf_ntsIsLocked"))
          {
            -[NSObject(LockingAdditions) _mf_checkToAllowExclusiveLocksWithLock:].cold.2(v5);
          }
        }
        ++v9;
      }
      while (v7 != v9);
      result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v7 = result;
    }
    while (result);
  }
  return result;
}

- (void)_mf_lockOrderingForType:()LockingAdditions
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 3:
      v4 = objc_msgSend(a1, "mf_exclusiveLocks");
      goto LABEL_7;
    case 2:
      v4 = objc_msgSend(a1, "mf_strictLockOrdering");
      goto LABEL_7;
    case 1:
      v4 = objc_msgSend(a1, "mf_lockOrdering");
LABEL_7:
      v5 = (void *)v4;
      goto LABEL_9;
  }
  v5 = 0;
LABEL_9:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        if (*(void **)(*((_QWORD *)&v11 + 1) + 8 * v9) == a1)
          -[NSObject(LockingAdditions) _mf_lockOrderingForType:].cold.1();
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  return v5;
}

- (uint64_t)mf_strictLockOrdering
{
  return 0;
}

- (uint64_t)mf_exclusiveLocks
{
  return 0;
}

- (uint64_t)mf_unlock
{
  _QWORD *v2;
  uint64_t v3;
  BOOL v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  const __CFArray *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock(&sMutex);
  v2 = (_QWORD *)sFirstLock;
  if (!sFirstLock)
    goto LABEL_14;
  do
  {
    if (v2[1] == a1)
      v3 = (uint64_t)v2;
    else
      v3 = 0;
    v2 = (_QWORD *)*v2;
    if (v2)
      v4 = v3 == 0;
    else
      v4 = 0;
  }
  while (v4);
  if (v3)
  {
    if (pthread_self() == *(pthread_t *)(v3 + 16))
    {
      v12 = *(__int16 *)(v3 + 72);
      if ((v12 & 0x7FFF) != 0)
      {
        *(_WORD *)(v3 + 72) = v12 & 0x8000 | (v12 - 1) & 0x7FFF;
        if (v12 < 0)
        {
          if ((((_WORD)v12 - 1) & 0x7FFF) != 0)
            return pthread_mutex_unlock(&sMutex);
          v17 = *(void **)(v3 + 8);
          if (_mfCallStackLoggingEnabled())
          {
            v18 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
            objc_setAssociatedObject(v17, CFSTR("MFLock Call Stack Symbols"), 0, (void *)0x301);
            objc_msgSend(v18, "drain");
          }
          v19 = *(const __CFArray **)(v3 + 80);
          if (v19 && CFArrayGetCount(v19))
          {
            *(_QWORD *)(v3 + 16) = 0;
            pthread_cond_broadcast((pthread_cond_t *)(v3 + 24));
            return pthread_mutex_unlock(&sMutex);
          }
        }
        else
        {
          --*(_WORD *)(v3 + 80);
          if ((((_WORD)v12 - 1) & 0x7FFF) != 0)
            return pthread_mutex_unlock(&sMutex);
          v13 = *(void **)(v3 + 8);
          if (_mfCallStackLoggingEnabled())
          {
            v14 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
            objc_setAssociatedObject(v13, CFSTR("MFLock Call Stack Symbols"), 0, (void *)0x301);
            objc_msgSend(v14, "drain");
          }
          if (*(_WORD *)(v3 + 80))
          {
            *(_QWORD *)(v3 + 16) = 0;
            pthread_cond_signal((pthread_cond_t *)(v3 + 24));
            return pthread_mutex_unlock(&sMutex);
          }
        }
        _MFRecycleObjectLock(v3);
        return pthread_mutex_unlock(&sMutex);
      }
      v5 = MFLogGeneral();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        return pthread_mutex_unlock(&sMutex);
      v15 = objc_opt_class();
      v16 = *(_QWORD *)(v3 + 8);
      v20 = 138412546;
      v21 = v15;
      v22 = 2048;
      v23 = v16;
      v8 = "*** Can't unlock <%@:%p>: it's already been unlocked.";
      goto LABEL_13;
    }
    v5 = MFLogGeneral();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = objc_opt_class();
      v7 = *(_QWORD *)(v3 + 8);
      v20 = 138412546;
      v21 = v6;
      v22 = 2048;
      v23 = v7;
      v8 = "*** Can't unlock <%@:%p>: it was locked by another thread.";
LABEL_13:
      v9 = v5;
LABEL_16:
      _os_log_impl(&dword_1ABB13000, v9, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v20, 0x16u);
    }
  }
  else
  {
LABEL_14:
    v10 = MFLogGeneral();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v20 = 138412546;
      v21 = objc_opt_class();
      v22 = 2048;
      v23 = a1;
      v8 = "*** Can't unlock <%@:%p>: it's not locked.";
      v9 = v10;
      goto LABEL_16;
    }
  }
  return pthread_mutex_unlock(&sMutex);
}

- (uint64_t)mf_lockOrdering
{
  return 0;
}

- (BOOL)_mf_ntsIsLocked
{
  _QWORD *v1;
  _QWORD *v2;
  BOOL v3;

  v1 = (_QWORD *)sFirstLock;
  if (!sFirstLock)
    return 0;
  do
  {
    if (v1[1] == a1)
      v2 = v1;
    else
      v2 = 0;
    v1 = (_QWORD *)*v1;
    if (v1)
      v3 = v2 == 0;
    else
      v3 = 0;
  }
  while (v3);
  return v2 && pthread_self() == (pthread_t)v2[2];
}

- (void)_mf_dumpLockCallStacks:()LockingAdditions ordering:
{
  unint64_t v5;
  const __CFString *v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  id v15;
  __CFString *v16;
  const __CFString *v17;
  unint64_t v18;
  const char *v19;
  NSObject *v20;
  NSObject *v21;
  const __CFString *v22;
  uint8_t buf[4];
  const __CFString *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v5 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    v7 = CFSTR("<exclusive locks>");
  else
    v7 = (const __CFString *)objc_msgSend(a4, "objectAtIndex:", a3);
  if (_mfCallStackLoggingEnabled())
  {
    v22 = v7;
    v8 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v9 = objc_msgSend(a4, "count");
    if (v9 > v5)
    {
      v10 = v9;
      v11 = v9 - 1;
      do
      {
        v12 = (__CFString *)objc_msgSend(a4, "objectAtIndex:", v5);
        if (v12 == CFSTR("com.apple.Message.MFLockOrderingSelfReference"))
        {
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<MFLockOrderingSelfReference: %@: %p>"), objc_opt_class(), a1);
          v13 = a1;
        }
        else
        {
          v13 = v12;
          v14 = (void *)objc_msgSend((id)-[__CFString description](v12, "description"), "copy");
        }
        if (_mfCallStackLoggingEnabled())
        {
          v15 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
          v16 = (__CFString *)objc_getAssociatedObject(v13, CFSTR("MFLock Call Stack Symbols"));
          objc_msgSend(v15, "drain");
        }
        else
        {
          v16 = 0;
        }
        v17 = CFSTR("<no call stack recorded>");
        if (v16)
          v17 = v16;
        v18 = v5 + 1;
        v19 = "\n";
        if (v11 == v5)
          v19 = "";
        objc_msgSend(v8, "appendFormat:", CFSTR("\t%@ callstack=%@%s"), v14, v17, v19);

        ++v5;
      }
      while (v10 != v18);
    }
    v20 = MFLogGeneral();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v22;
      v25 = 2112;
      v26 = v8;
      _os_log_impl(&dword_1ABB13000, v20, OS_LOG_TYPE_DEFAULT, "#Warning MFLock Ordering Violation while taking lock! --> %@\nDumping lock call stack symbols.\n%@", buf, 0x16u);
    }

  }
  else if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice"), "isInternal"))
  {
    v21 = MFLogGeneral();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v7;
      _os_log_impl(&dword_1ABB13000, v21, OS_LOG_TYPE_DEFAULT, "#Warning MFLock Ordering Violation while taking lock! --> %@\nTurn on MFLockCallStackLoggingEnabled to dump call stack information.", buf, 0xCu);
    }
  }
}

- (uint64_t)mf_lockWithPriority
{
  _QWORD *v2;

  pthread_mutex_lock(&sMutex);
  v2 = _MFFindObjectLock(a1, 2);
  return _MFAcquireObjectLock((uint64_t)v2);
}

- (uint64_t)mf_tryLockWithPriority
{
  _QWORD *v2;

  pthread_mutex_lock(&sMutex);
  v2 = _MFFindObjectLock(a1, 1);
  return _MFTryObjectLock((uint64_t)v2);
}

- (void)_mf_lockOrderingForType:()LockingAdditions .cold.1()
{
  __assert_rtn("-[NSObject(LockingAdditions) _mf_lockOrderingForType:]", "NSLockAdditions.m", 661, "item != self && \"Don't use self in a lock ordering array - use MFLockOrderingSelfReference.\");
}

- (void)_mf_checkToAllowOrderingWithLock:()LockingAdditions .cold.1(void *a1, const char *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_3(a1, a2, a3);
  __assert_rtn("-[NSObject(LockingAdditions) _mf_checkToAllowOrderingWithLock:]", "NSLockAdditions.m", 716, "isLockedByMe == NO");
}

- (void)_mf_checkToAllowOrderingWithLock:()LockingAdditions .cold.2(void *a1, const char *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_3(a1, a2, a3);
  __assert_rtn("-[NSObject(LockingAdditions) _mf_checkToAllowOrderingWithLock:]", "NSLockAdditions.m", 722, "isLocked == NO");
}

- (void)_mf_checkToAllowStrictProgressionWithLock:()LockingAdditions .cold.1(void *a1, const char *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_3(a1, a2, a3);
  __assert_rtn("-[NSObject(LockingAdditions) _mf_checkToAllowStrictProgressionWithLock:]", "NSLockAdditions.m", 747, "isLockedByMe == NO");
}

- (void)_mf_checkToAllowStrictProgressionWithLock:()LockingAdditions .cold.2(void *a1, const char *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_3(a1, a2, a3);
  __assert_rtn("-[NSObject(LockingAdditions) _mf_checkToAllowStrictProgressionWithLock:]", "NSLockAdditions.m", 753, "isLocked == NO");
}

- (void)_mf_checkToAllowExclusiveLocksWithLock:()LockingAdditions .cold.1(void *a1)
{
  OUTLINED_FUNCTION_2_0(objc_msgSend(a1, "allObjects"));
  __assert_rtn("-[NSObject(LockingAdditions) _mf_checkToAllowExclusiveLocksWithLock:]", "NSLockAdditions.m", 774, "isLockedByMe == NO");
}

- (void)_mf_checkToAllowExclusiveLocksWithLock:()LockingAdditions .cold.2(void *a1)
{
  OUTLINED_FUNCTION_2_0(objc_msgSend(a1, "allObjects"));
  __assert_rtn("-[NSObject(LockingAdditions) _mf_checkToAllowExclusiveLocksWithLock:]", "NSLockAdditions.m", 780, "isLocked == NO");
}

@end
