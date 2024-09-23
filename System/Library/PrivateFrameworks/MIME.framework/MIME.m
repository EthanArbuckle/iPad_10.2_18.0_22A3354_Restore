uint64_t _MFUnlockGlobalLock()
{
  return pthread_mutex_unlock(&sMFGlobalLock);
}

void sub_1ABB14988(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t MFInitializeMIME()
{

  return objc_opt_class();
}

uint64_t MFCreateDataWithString(void *a1, CFStringEncoding a2, int a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD block[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a1;
  v6 = (void *)MEMORY[0x1AF433BF4]();
  if (MFCanUseSoftBankCodePoints())
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__0;
    v17 = __Block_byref_object_dispose__0;
    v18 = 0;
    telephonyQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __softBankTransform_block_invoke;
    block[3] = &unk_1E5AA17E0;
    block[4] = &v13;
    dispatch_sync(v7, block);

    v8 = (id)v14[5];
    _Block_object_dispose(&v13, 8);

    objc_msgSend(v5, "mf_applyTransform:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v9;
  }
  objc_msgSend(v5, "dataUsingEncoding:allowLossyConversion:", CFStringConvertEncodingToNSStringEncoding(a2), a3 != 0);
  v10 = objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v6);

  return v10;
}

void sub_1ABB14E68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t MFCanUseSoftBankCodePoints()
{
  int v0;
  _BOOL8 v1;
  NSObject *v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v0 = atomic_load((unsigned __int8 *)&sCanUseCodePoints);
  if (v0 == 1)
    return 1;
  if (v0 == 2)
    return 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  telephonyQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __MFCanUseSoftBankCodePoints_block_invoke;
  block[3] = &unk_1E5AA17E0;
  block[4] = &v5;
  dispatch_sync(v2, block);

  v1 = *((_BYTE *)v6 + 24) != 0;
  _Block_object_dispose(&v5, 8);
  return v1;
}

id telephonyQueue()
{
  id *v0;
  id v1;

  getCoreTelephonySubscriptionChangeListener();
  v0 = (id *)objc_claimAutoreleasedReturnValue();
  v1 = v0[1];

  return v1;
}

void sub_1ABB15234(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id activeContexts()
{
  void *v0;
  void *v1;
  id v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v14;
  uint8_t buf[4];
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  sharedCoreTelephonyClient();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v0, "getActiveContexts:", &v14);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v14;

  if (v1)
  {
    objc_msgSend(v1, "subscriptions");
    v3 = objc_claimAutoreleasedReturnValue();
    -[NSObject ef_compactMap:](v3, "ef_compactMap:", &__block_literal_global_4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    MFLogGeneral();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = objc_msgSend(v4, "count");
      *(_DWORD *)buf = 67109120;
      v16 = v6;
      _os_log_impl(&dword_1ABB13000, v5, OS_LOG_TYPE_INFO, "MFStringTransform: Found %u active contexts.", buf, 8u);
    }

  }
  else
  {
    MFLogGeneral();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      activeContexts_cold_1((uint64_t)v2, v3, v7, v8, v9, v10, v11, v12);
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

void sub_1ABB153D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

id sharedCoreTelephonyClient()
{
  id *v0;
  id v1;

  getCoreTelephonySubscriptionChangeListener();
  v0 = (id *)objc_claimAutoreleasedReturnValue();
  v1 = v0[2];

  return v1;
}

id getCoreTelephonySubscriptionChangeListener()
{
  if (getCoreTelephonySubscriptionChangeListener_p != -1)
    dispatch_once(&getCoreTelephonySubscriptionChangeListener_p, &__block_literal_global_69);
  return (id)getCoreTelephonySubscriptionChangeListener_sharedInstance;
}

uint64_t _MFTryObjectLock(uint64_t a1)
{
  pthread_t v2;
  pthread_t v3;
  int v4;
  __int16 v5;
  _opaque_pthread_t *v6;
  BOOL v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  __int16 v13;
  const __CFArray *Mutable;
  CFIndex v15;
  int v16;
  const __CFArray *v17;
  CFIndex FirstIndexOfValue;
  void *v19;
  id v20;
  timespec v22;
  CFRange v23;
  CFRange v24;

  v2 = pthread_self();
  v3 = v2;
  v4 = *(__int16 *)(a1 + 72);
  if (v4 < 0)
  {
    if (v2 == *(pthread_t *)(a1 + 16))
    {
      v13 = v4 & 0x8000 | (v4 + 1) & 0x7FFF;
    }
    else
    {
      v10 = (void *)objc_msgSend(MEMORY[0x1E0D1EF40], "currentDesignator");
      if (v10)
        v11 = objc_msgSend(v10, "priority");
      else
        v11 = -1;
      Mutable = *(const __CFArray **)(a1 + 80);
      if (!Mutable)
      {
        Mutable = CFArrayCreateMutable(0, 0, 0);
        *(_QWORD *)(a1 + 80) = Mutable;
      }
      v23.length = CFArrayGetCount(Mutable);
      v23.location = 0;
      v15 = CFArrayBSearchValues(Mutable, v23, (const void *)v11, (CFComparatorFunction)_comparePriorities, 0);
      CFArrayInsertValueAtIndex(*(CFMutableArrayRef *)(a1 + 80), v15, (const void *)v11);
      while (*(_QWORD *)(a1 + 16) || CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 80), 0) != (const void *)v11)
      {
        v22.tv_sec = 0;
        v22.tv_nsec = 0;
        if (pthread_cond_timedwait((pthread_cond_t *)(a1 + 24), &sMutex, &v22) == 60)
        {
          v16 = 0;
          goto LABEL_25;
        }
      }
      v16 = 1;
LABEL_25:
      v17 = *(const __CFArray **)(a1 + 80);
      v24.length = CFArrayGetCount(v17);
      v24.location = 0;
      FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v17, v24, (const void *)v11);
      if (FirstIndexOfValue != -1)
        CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 80), FirstIndexOfValue);
      if (!v16)
      {
        v12 = 0;
        goto LABEL_35;
      }
      v19 = *(void **)(a1 + 8);
      if (_mfCallStackLoggingEnabled())
      {
        v20 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
        if (!objc_getAssociatedObject(v19, CFSTR("MFLock Call Stack Symbols")))
          objc_setAssociatedObject(v19, CFSTR("MFLock Call Stack Symbols"), (id)objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols"), (void *)0x301);
        objc_msgSend(v20, "drain");
      }
      *(_QWORD *)(a1 + 16) = v3;
      v13 = *(_WORD *)(a1 + 72) & 0x8000 | 1;
    }
    *(_WORD *)(a1 + 72) = v13;
    goto LABEL_34;
  }
  v5 = *(_WORD *)(a1 + 80);
  *(_WORD *)(a1 + 80) = v5 + 1;
  v6 = *(_opaque_pthread_t **)(a1 + 16);
  if (v6)
    v7 = v2 == v6;
  else
    v7 = 1;
  if (v7)
  {
    v8 = *(void **)(a1 + 8);
    if (_mfCallStackLoggingEnabled())
    {
      v9 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
      if (!objc_getAssociatedObject(v8, CFSTR("MFLock Call Stack Symbols")))
        objc_setAssociatedObject(v8, CFSTR("MFLock Call Stack Symbols"), (id)objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols"), (void *)0x301);
      objc_msgSend(v9, "drain");
    }
    *(_WORD *)(a1 + 72) = *(_WORD *)(a1 + 72) & 0x8000 | (*(_WORD *)(a1 + 72) + 1) & 0x7FFF;
    *(_QWORD *)(a1 + 16) = v3;
LABEL_34:
    v12 = 1;
    goto LABEL_35;
  }
  v12 = 0;
  *(_WORD *)(a1 + 80) = v5;
LABEL_35:
  pthread_mutex_unlock(&sMutex);
  return v12;
}

void sub_1ABB157F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

BOOL _UniquingIsEqual(uint64_t a1, __CFString *a2, __CFString *a3)
{
  CFStringEncoding SystemEncoding;
  const char *CStringPtr;
  const char *v7;
  const char *v8;
  void *v10;
  void *v11;

  SystemEncoding = CFStringGetSystemEncoding();
  CStringPtr = CFStringGetCStringPtr(a2, SystemEncoding);
  v7 = CFStringGetCStringPtr(a3, SystemEncoding);
  v8 = v7;
  if (CStringPtr)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    CStringPtr = (const char *)-[__CFString ef_lossyDefaultCStringBytes](a2, "ef_lossyDefaultCStringBytes");
    if (v8)
    {
LABEL_3:
      if (CStringPtr)
        goto LABEL_4;
LABEL_8:
      v10 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL _UniquingIsEqual(NSHashTable *, const void *, const void *)"), CFSTR("MimePart.m"), 327, CFSTR("Invalid string table entry %p(%@)"), a2, a2);
      if (v8)
        return strcasecmp(CStringPtr, v8) == 0;
LABEL_9:
      v11 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL _UniquingIsEqual(NSHashTable *, const void *, const void *)"), CFSTR("MimePart.m"), 328, CFSTR("Invalid string table entry %p(%@)"), a3, a3);
      return strcasecmp(CStringPtr, v8) == 0;
    }
  }
  v8 = (const char *)-[__CFString ef_lossyDefaultCStringBytes](a3, "ef_lossyDefaultCStringBytes");
  if (!CStringPtr)
    goto LABEL_8;
LABEL_4:
  if (!v8)
    goto LABEL_9;
  return strcasecmp(CStringPtr, v8) == 0;
}

uint64_t _UniquingHash(uint64_t a1, __CFString *a2)
{
  CFStringEncoding SystemEncoding;
  const char *CStringPtr;
  size_t v5;
  size_t v6;
  size_t v7;
  uint64_t v8;
  __darwin_ct_rune_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v14;

  SystemEncoding = CFStringGetSystemEncoding();
  CStringPtr = CFStringGetCStringPtr(a2, SystemEncoding);
  if (!CStringPtr)
  {
    CStringPtr = (const char *)-[__CFString ef_lossyDefaultCStringBytes](a2, "ef_lossyDefaultCStringBytes");
    if (!CStringPtr)
    {
      v14 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSUInteger _UniquingHash(NSHashTable *, const void *)"), CFSTR("MimePart.m"), 281, CFSTR("Invalid string table entry %p(%@)"), a2, a2);
      CStringPtr = 0;
    }
  }
  v5 = strlen(CStringPtr);
  v6 = v5;
  if (v5 >= 0x11)
  {
    v10 = 0;
    v8 = v5;
    do
      v8 = 257 * v8 + __tolower(CStringPtr[v10++]);
    while ((_DWORD)v10 != 8);
    v11 = 0;
    v12 = (uint64_t)&CStringPtr[v6 - 16];
    do
      v8 = 257 * v8 + __tolower(*(char *)(v12 + v11++ + v10));
    while ((_DWORD)v11 != 8);
  }
  else if (v5)
  {
    v7 = v5;
    v8 = v5;
    do
    {
      --v7;
      v9 = *CStringPtr++;
      v8 = 257 * v8 + __tolower(v9);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }
  return (v8 << (v6 & 0x1F)) + v8;
}

pthread_t _MFLockGlobalLock()
{
  pthread_t result;

  pthread_mutex_lock(&sMFGlobalLock);
  result = pthread_self();
  sThreadWithGlobalLock = (uint64_t)result;
  return result;
}

uint64_t _mfUnregisterLockOnThisThread(void *a1)
{
  const __CFDictionary *v2;
  pthread_t v3;
  void *Value;
  void *v5;
  __CFDictionary *v6;
  pthread_t v7;
  id v8;

  pthread_mutex_lock(&__threadLockRelationsLock);
  v2 = (const __CFDictionary *)__threadLockRelations;
  v3 = pthread_self();
  Value = (void *)CFDictionaryGetValue(v2, v3);
  v5 = Value;
  if (!Value)
  {
    if (sMFLockTesting != 1)
      _mfUnregisterLockOnThisThread_cold_2();
    sMFLockEncounteredError = 1;
  }
  if ((objc_msgSend(Value, "containsObject:", a1) & 1) == 0)
  {
    if (sMFLockTesting != 1)
      _mfUnregisterLockOnThisThread_cold_1();
    sMFLockEncounteredError = 1;
  }
  objc_msgSend(v5, "removeObject:", a1);
  if (!objc_msgSend(v5, "count"))
  {
    if (v5 && CFArrayGetCount((CFArrayRef)__threadLockEmptySets) <= 19)
      CFArrayAppendValue((CFMutableArrayRef)__threadLockEmptySets, v5);
    v6 = (__CFDictionary *)__threadLockRelations;
    v7 = pthread_self();
    CFDictionaryRemoveValue(v6, v7);
  }
  if (_mfCallStackLoggingEnabled())
  {
    v8 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    objc_setAssociatedObject(a1, CFSTR("MFLock Call Stack Symbols"), 0, (void *)0x301);
    objc_msgSend(v8, "drain");
  }
  return pthread_mutex_unlock(&__threadLockRelationsLock);
}

uint64_t _mfRegisterLockOnThisThread(void *a1)
{
  const __CFDictionary *v2;
  pthread_t v3;
  __CFDictionary *v4;
  pthread_t v5;
  id v6;
  void *value;

  pthread_mutex_lock(&__threadLockRelationsLock);
  value = 0;
  v2 = (const __CFDictionary *)__threadLockRelations;
  v3 = pthread_self();
  if (!CFDictionaryGetValueIfPresent(v2, v3, (const void **)&value))
  {
    if (CFArrayGetCount((CFArrayRef)__threadLockEmptySets) < 1)
    {
      value = objc_alloc_init(MEMORY[0x1E0CB3550]);
    }
    else
    {
      value = (id)CFArrayGetValueAtIndex((CFArrayRef)__threadLockEmptySets, 0);
      CFArrayRemoveValueAtIndex((CFMutableArrayRef)__threadLockEmptySets, 0);
    }
    v4 = (__CFDictionary *)__threadLockRelations;
    v5 = pthread_self();
    CFDictionarySetValue(v4, v5, value);

  }
  objc_msgSend(value, "addObject:", a1);
  if (_mfCallStackLoggingEnabled())
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    if (!objc_getAssociatedObject(a1, CFSTR("MFLock Call Stack Symbols")))
      objc_setAssociatedObject(a1, CFSTR("MFLock Call Stack Symbols"), (id)objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols"), (void *)0x301);
    objc_msgSend(v6, "drain");
  }
  return pthread_mutex_unlock(&__threadLockRelationsLock);
}

_QWORD *_MFFindObjectLock(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *result;
  BOOL v9;

  v4 = (_QWORD *)sFirstLock;
  if (sFirstLock)
  {
    v5 = 0;
    do
    {
      v6 = v4[1];
      if (v6 | v5)
        v7 = (_QWORD *)v5;
      else
        v7 = v4;
      if (v6 == a1)
        result = v4;
      else
        result = 0;
      if (v6 != a1)
        v5 = (uint64_t)v7;
      v4 = (_QWORD *)*v4;
      if (result)
        v9 = 1;
      else
        v9 = v4 == 0;
    }
    while (!v9);
    if (a2 && !result)
    {
      if (v5)
      {
LABEL_22:
        *(_QWORD *)(v5 + 8) = a1;
        *(_WORD *)(v5 + 72) = *(_WORD *)(v5 + 72) & 0x7FFF | ((a2 == 2) << 15);
        return (_QWORD *)v5;
      }
LABEL_21:
      v5 = (uint64_t)malloc_type_calloc(1uLL, 0x58uLL, 0x10A2040CAED1BC0uLL);
      pthread_cond_init((pthread_cond_t *)(v5 + 24), 0);
      *(_QWORD *)v5 = sFirstLock;
      sFirstLock = v5;
      goto LABEL_22;
    }
  }
  else
  {
    if (a2)
      goto LABEL_21;
    return 0;
  }
  return result;
}

uint64_t _MFAcquireObjectLock(uint64_t a1)
{
  pthread_t v2;
  pthread_t v3;
  int v4;
  _opaque_pthread_t *v5;
  BOOL v6;
  _opaque_pthread_t *v7;
  BOOL v8;
  void *v9;
  id v10;
  void *v12;
  uint64_t v13;
  const __CFArray *Mutable;
  CFIndex v15;
  const __CFArray *v16;
  CFIndex FirstIndexOfValue;
  CFIndex v18;
  __CFString *v19;
  NSObject *v20;
  __CFString *v21;
  NSObject *v22;
  int v23;
  int v24;
  __int16 v25;
  __CFString *v26;
  uint64_t v27;
  CFRange v28;
  CFRange v29;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = pthread_self();
  v3 = v2;
  v4 = *(__int16 *)(a1 + 72);
  if ((v4 & 0x80000000) == 0)
  {
    ++*(_WORD *)(a1 + 80);
    v5 = *(_opaque_pthread_t **)(a1 + 16);
    if (v5)
      v6 = v2 == v5;
    else
      v6 = 1;
    if (!v6)
    {
      do
      {
        pthread_cond_wait((pthread_cond_t *)(a1 + 24), &sMutex);
        v7 = *(_opaque_pthread_t **)(a1 + 16);
        if (v7)
          v8 = v3 == v7;
        else
          v8 = 1;
      }
      while (!v8);
      LOWORD(v4) = *(_WORD *)(a1 + 72);
    }
    *(_WORD *)(a1 + 72) = v4 & 0x8000 | (v4 + 1) & 0x7FFF;
    *(_QWORD *)(a1 + 16) = v3;
    goto LABEL_13;
  }
  if (v2 == *(pthread_t *)(a1 + 16))
  {
    *(_WORD *)(a1 + 72) = v4 & 0x8000 | (v4 + 1) & 0x7FFF;
    goto LABEL_13;
  }
  v12 = (void *)objc_msgSend(MEMORY[0x1E0D1EF40], "currentDesignator");
  if (v12)
    v13 = objc_msgSend(v12, "priority");
  else
    v13 = -1;
  Mutable = *(const __CFArray **)(a1 + 80);
  if (!Mutable)
  {
    Mutable = CFArrayCreateMutable(0, 0, 0);
    *(_QWORD *)(a1 + 80) = Mutable;
  }
  v28.length = CFArrayGetCount(Mutable);
  v28.location = 0;
  v15 = CFArrayBSearchValues(Mutable, v28, (const void *)v13, (CFComparatorFunction)_comparePriorities, 0);
  CFArrayInsertValueAtIndex(*(CFMutableArrayRef *)(a1 + 80), v15, (const void *)v13);
  while (*(_QWORD *)(a1 + 16) || CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 80), 0) != (const void *)v13)
    pthread_cond_wait((pthread_cond_t *)(a1 + 24), &sMutex);
  *(_QWORD *)(a1 + 16) = v3;
  *(_WORD *)(a1 + 72) = *(_WORD *)(a1 + 72) & 0x8000 | 1;
  v16 = *(const __CFArray **)(a1 + 80);
  v29.length = CFArrayGetCount(v16);
  v29.location = 0;
  FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v16, v29, (const void *)v13);
  v18 = FirstIndexOfValue;
  if (!FirstIndexOfValue)
  {
LABEL_37:
    CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 80), v18);
    goto LABEL_13;
  }
  if (FirstIndexOfValue != -1)
  {
    v21 = (__CFString *)CFCopyDescription(*(CFTypeRef *)(a1 + 80));
    v22 = MFLogGeneral();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = 67109378;
      v24 = v13;
      v25 = 2112;
      v26 = v21;
      _os_log_impl(&dword_1ABB13000, v22, OS_LOG_TYPE_INFO, "*** Expected priority %u at idx 0 in priorities %@", (uint8_t *)&v23, 0x12u);
    }

    goto LABEL_37;
  }
  v19 = (__CFString *)CFCopyDescription(*(CFTypeRef *)(a1 + 80));
  v20 = MFLogGeneral();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v23 = 67109378;
    v24 = v13;
    v25 = 2112;
    v26 = v19;
    _os_log_impl(&dword_1ABB13000, v20, OS_LOG_TYPE_INFO, "*** Couldn't find value %u in priorities %@", (uint8_t *)&v23, 0x12u);
  }

LABEL_13:
  v9 = *(void **)(a1 + 8);
  if (_mfCallStackLoggingEnabled())
  {
    v10 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    if (!objc_getAssociatedObject(v9, CFSTR("MFLock Call Stack Symbols")))
      objc_setAssociatedObject(v9, CFSTR("MFLock Call Stack Symbols"), (id)objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols"), (void *)0x301);
    objc_msgSend(v10, "drain");
  }
  return pthread_mutex_unlock(&sMutex);
}

BOOL _mfCallStackLoggingEnabled()
{
  BOOL v0;

  if (_mfCallStackLoggingEnabled_onceToken != -1)
    dispatch_once(&_mfCallStackLoggingEnabled_onceToken, &__block_literal_global_11);
  if (_mfCallStackLoggingEnabled___isInternal)
    v0 = _mfCallStackLoggingEnabled___loggingDefaultEnabled == 0;
  else
    v0 = 1;
  return !v0;
}

void _MFRecycleObjectLock(uint64_t a1)
{
  __int16 v2;
  const void *v3;
  __int16 v4;

  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  v2 = *(_WORD *)(a1 + 72);
  *(_WORD *)(a1 + 72) = v2 & 0x8000;
  if (v2 < 0)
  {
    v3 = *(const void **)(a1 + 80);
    if (v3)
    {
      CFRelease(v3);
      v4 = *(_WORD *)(a1 + 72) & 0x7FFF;
    }
    else
    {
      v4 = 0;
    }
    *(_QWORD *)(a1 + 80) = 0;
    *(_WORD *)(a1 + 72) = v4;
  }
  else
  {
    *(_WORD *)(a1 + 80) = 0;
  }
}

void sub_1ABB175C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1767C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t ___mfCallStackLoggingEnabled_block_invoke()
{
  uint64_t result;
  int AppBooleanValue;
  BOOL v2;
  char v3;
  void *v4;
  _QWORD v5[5];
  Boolean keyExistsAndHasValidFormat;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice"), "isInternal");
  _mfCallStackLoggingEnabled___isInternal = result;
  if ((_DWORD)result)
  {
    keyExistsAndHasValidFormat = 0;
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("MFLockCallStackLoggingEnabled"), (CFStringRef)*MEMORY[0x1E0C9B248], &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
      v2 = AppBooleanValue == 0;
    else
      v2 = 1;
    v3 = !v2;
    _mfCallStackLoggingEnabled___loggingDefaultEnabled = v3;
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = ___mfCallStackLoggingEnabled_block_invoke_3;
    v5[3] = &unk_1E5AA1F80;
    v5[4] = &__block_literal_global_93;
    return objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", CFSTR("MFLockCallStackLoggingEnabled"), 0, 0, v5);
  }
  return result;
}

void sub_1ABB177F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

CFMutableArrayRef _setupThreadLockRelationsDictionary()
{
  const __CFAllocator *v0;
  CFMutableArrayRef result;

  v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  __threadLockRelations = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, MEMORY[0x1E0C9B3A0]);
  result = CFArrayCreateMutable(v0, 0, MEMORY[0x1E0C9B378]);
  __threadLockEmptySets = (uint64_t)result;
  return result;
}

void __getCoreTelephonySubscriptionChangeListener_block_invoke()
{
  _MFCoreTelephonySubscriptionChangeListener *v0;
  void *v1;

  v0 = objc_alloc_init(_MFCoreTelephonySubscriptionChangeListener);
  v1 = (void *)getCoreTelephonySubscriptionChangeListener_sharedInstance;
  getCoreTelephonySubscriptionChangeListener_sharedInstance = (uint64_t)v0;

}

id __activeContexts_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = a2;
  objc_msgSend(v2, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    MFLogGeneral();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __activeContexts_block_invoke_cold_1((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);

  }
  return v3;
}

void sub_1ABB17984(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void MFSetUseLegacyMessageIDHashFormat(uint64_t a1)
{
  id v2;
  id v3;
  id v4;

  v2 = (id)EFAtomicObjectRelease();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)EFAtomicObjectSetIfNil();

}

void sub_1ABB17A04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABB17ED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1ABB18218(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB184C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB189D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABB18BFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB18D40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t MFGuessEncodingForBytes(uint64_t a1, uint64_t a2)
{
  return _MFGuessEncodingForBytes(a1, a2, 0xFFFFFFFFLL, 0);
}

uint64_t _MFGuessEncodingForBytes(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5;

  v5 = ucsdet_open();
  ucsdet_setText();
  ucsdet_enableInputFilter();
  ucsdet_detectAll();
  if (a4)
  {
    *a4 = v5;
  }
  else if (v5)
  {
    ucsdet_close();
  }
  return 0xFFFFFFFFLL;
}

CFIndex MFStringGetBytes(const __CFString *a1, CFRange a2, CFStringEncoding a3, UInt8 a4, Boolean a5, UInt8 *a6, CFIndex a7, CFIndex *a8)
{
  CFIndex result;
  CFIndex usedBufLen;

  usedBufLen = 0;
  result = CFStringGetBytes(a1, a2, a3, a4, a5, a6, a7, &usedBufLen);
  if (a8)
    *a8 = usedBufLen;
  return result;
}

__CFString *MFCreateStringWithBytes(const UInt8 *a1, CFIndex a2, uint64_t a3, CFStringEncoding *a4)
{
  uint64_t v8;
  CFStringEncoding v9;
  int v10;
  uint64_t v12;
  uint64_t v13;
  const __CFAllocator *v14;
  CFStringRef v15;
  CFStringRef v16;
  const __CFAllocator *v18;
  CFStringRef v19;
  int v20;
  uint64_t v21;
  unint64_t v22;
  int v23;
  CFStringEncoding *v24;
  const __CFAllocator *v25;
  CFStringRef v26;
  CFStringEncoding v27;
  NSObject *v28;
  CFStringRef v29;
  _BYTE buf[24];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v8 = 0;
    v9 = a3;
    do
    {
      v10 = _MFCreateStringWithBytesUsingFilters_FilterItems[v8];
      if (v10 == -1 || v10 == v9)
      {
        v12 = (*(uint64_t (**)(const UInt8 *, CFIndex, CFStringEncoding *))&_MFCreateStringWithBytesUsingFilters_FilterItems[v8 + 2])(a1, a2, a4);
        if (v12)
          return (__CFString *)v12;
        if (v10 == v9)
          v9 = -1;
      }
      v8 += 4;
    }
    while (v8 != 48);
    v13 = a3;
    if (v9 != -1)
    {
      v14 = (const __CFAllocator *)MFGetMappedAllocator();
      v15 = _MFCreateStringWithBytes(v14, a1, a2, v9, 0);
      v16 = v15;
      if (a4 && v15)
      {
        *a4 = v9;
        return (__CFString *)v16;
      }
      if (v15)
        return (__CFString *)v16;
      v13 = 0xFFFFFFFFLL;
    }
    *(_QWORD *)buf = 0;
    _MFGuessEncodingForBytes((uint64_t)a1, a2, v13, (uint64_t *)buf);
    if (*(_QWORD *)buf)
      ucsdet_close();
    if ((_DWORD)a3 != -1 && v9 == -1)
    {
      v18 = (const __CFAllocator *)MFGetMappedAllocator();
      v19 = _MFCreateStringWithBytes(v18, a1, a2, a3, 0);
      v16 = v19;
      if (a4 && v19)
      {
        *a4 = a3;
        return (__CFString *)v16;
      }
      if (v19)
        return (__CFString *)v16;
    }
    v20 = objc_msgSend(+[MFMimeCharset preferredMimeCharset](MFMimeCharset, "preferredMimeCharset"), "cfStringEncoding");
    *(_DWORD *)buf = v20;
    v21 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "stringArrayForKey:", CFSTR("AppleLanguages")), "objectAtIndex:", 0);
    v22 = 0;
    do
    {
      if (-[__CFString isEqualToString:](*(&__MFLanguageToEncodingMapping + v22), "isEqualToString:", v21))v23 = *((_DWORD *)&__MFLanguageToEncodingMapping + 2 * v22 + 2);
      else
        v23 = -1;
      if (v22 > 0xF)
        break;
      v22 += 2;
    }
    while (v23 == -1);
    *(_DWORD *)&buf[4] = v23;
    *(_OWORD *)&buf[8] = xmmword_1ABB4D4E0;
    if (v20 == -1)
    {
LABEL_42:
      v28 = MFLogGeneral();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = CFStringConvertEncodingToIANACharSetName(a3);
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v29;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a3;
        _os_log_impl(&dword_1ABB13000, v28, OS_LOG_TYPE_DEFAULT, "#Warning MFCreateStringWithData: failed to decode data with given encoding %@ (%lx)", buf, 0x16u);
      }
      return 0;
    }
    else
    {
      v24 = (CFStringEncoding *)buf;
      while (1)
      {
        v25 = (const __CFAllocator *)MFGetMappedAllocator();
        v26 = _MFCreateStringWithBytes(v25, a1, a2, *v24, 0);
        if (v26)
          break;
        v27 = v24[1];
        ++v24;
        if (v27 == -1)
          goto LABEL_42;
      }
      v16 = v26;
      if (a4)
        *a4 = *v24;
    }
    return (__CFString *)v16;
  }
  if (a4)
    *a4 = a3;
  return &stru_1E5AA1FC8;
}

CFStringRef _MFCreateStringWithBytes(const __CFAllocator *a1, const UInt8 *a2, CFIndex a3, CFStringEncoding a4, Boolean a5)
{
  const __CFAllocator *Default;
  CFStringRef v11;

  Default = CFAllocatorGetDefault();
  CFAllocatorSetDefault(a1);
  v11 = CFStringCreateWithBytes(a1, a2, a3, a4, a5);
  CFAllocatorSetDefault(Default);
  return v11;
}

__CFString *MFCreateStringWithData(__CFString *result, uint64_t a2, CFStringEncoding *a3)
{
  if (result)
    return MFCreateStringWithBytes((const UInt8 *)-[__CFString bytes](result, "bytes"), -[__CFString length](result, "length"), a2, a3);
  return result;
}

BOOL MFStringCanBeConvertedLosslessly(void *a1, CFStringEncoding a2)
{
  _BOOL8 v2;
  void *v3;

  v2 = 0;
  if (a1 && a2 != 2081 && a2 != 2096)
  {
    v3 = (void *)MFCreateDataWithString(a1, a2, 0);
    v2 = v3 != 0;

  }
  return v2;
}

const __CFString *MFCharsetForEncoding(CFStringEncoding encoding)
{
  const __CFString *result;

  if (encoding == 67109120)
    return CFSTR("UTF-7");
  if (encoding == 1056 && (MFCanUseSoftBankCodePoints() & 1) != 0)
    return CFSTR("Shift_JIS");
  result = CFStringConvertEncodingToIANACharSetName(encoding);
  if (!result)
    return CFStringConvertEncodingToIANACharSetName(0x201u);
  return result;
}

uint64_t MFEncodingForCharsetWithFallback(const __CFString *a1, uint64_t a2)
{
  if (a1)
  {
    if (objc_msgSend(CFSTR("UTF-7"), "caseInsensitiveCompare:", a1))
    {
      if (objc_msgSend(CFSTR("UNKNOWN"), "caseInsensitiveCompare:", a1))
      {
        if (objc_msgSend(CFSTR("softbank-sjis"), "caseInsensitiveCompare:", a1))
          return CFStringConvertIANACharSetNameToEncoding(a1);
        return 2561;
      }
    }
    else
    {
      return 67109120;
    }
  }
  return a2;
}

uint64_t MFEncodingForCharset(const __CFString *a1)
{
  return MFEncodingForCharsetWithFallback(a1, 0xFFFFFFFFLL);
}

uint64_t _MFStringEncodingForMatch(uint64_t a1)
{
  const char *Name;
  const __CFString *v2;
  const __CFString *v3;
  CFStringEncoding v4;

  if (!a1)
    return 0xFFFFFFFFLL;
  Name = (const char *)ucsdet_getName();
  if (!Name)
    return 0xFFFFFFFFLL;
  v2 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], Name, 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  if (!v2)
    return 0xFFFFFFFFLL;
  v3 = v2;
  v4 = CFStringConvertIANACharSetNameToEncoding(v2);
  CFRelease(v3);
  if (v4 == 2561)
    return 1056;
  else
    return v4;
}

CFStringRef _filter_utf8_trailingSplitCodePoints(const UInt8 *a1, CFIndex a2, _DWORD *a3)
{
  const UInt8 *v6;
  CFIndex v7;
  unsigned int v9;
  CFIndex v10;
  const __CFAllocator *v11;
  CFStringRef result;
  unint64_t v14;
  const UInt8 *v15;
  unsigned int v16;
  const __CFAllocator *v17;

  if (!a2)
    goto LABEL_30;
  v6 = &a1[a2 - 1];
  if (a2 - 1 < 1)
  {
    v7 = a2;
LABEL_11:
    v9 = *v6;
  }
  else
  {
    v7 = a2;
    while ((*(char *)v6 & 0x80000000) == 0)
    {
      --v6;
      --v7;
      if ((unint64_t)(a2 - v7) > 1 || v6 <= a1)
        goto LABEL_11;
    }
    v9 = *v6;
  }
  if (v9 < 0xC0)
  {
    if ((v9 & 0xC0) == 0x80 && v6 >= a1)
    {
      v14 = 0;
      v15 = v6;
      while (1)
      {
        v16 = *v15;
        if (v16 > 0xBF)
          break;
        --v15;
        ++v14;
        if (v15 < a1)
          goto LABEL_30;
      }
      if (v14 <= 5
        && _filter_utf8_trailingSplitCodePoints_checkValues[v14] != (_filter_utf8_trailingSplitCodePoints_masks[v14] & v16))
      {
        v10 = v6 - a1 - v14;
        goto LABEL_15;
      }
    }
LABEL_30:
    v10 = -1;
    goto LABEL_31;
  }
  v10 = v7 - 1;
LABEL_15:
  if (v10 != -1)
  {
    v11 = (const __CFAllocator *)MFGetMappedAllocator();
    result = _MFCreateStringWithBytes(v11, a1, v10, 0x8000100u, 0);
    if (result)
    {
      if (!a3)
        return result;
      goto LABEL_34;
    }
  }
LABEL_31:
  if (v10 == a2)
    return 0;
  v17 = (const __CFAllocator *)MFGetMappedAllocator();
  result = _MFCreateStringWithBytes(v17, a1, a2, 0x8000100u, 0);
  if (a3)
  {
LABEL_34:
    if (result)
      *a3 = 134217984;
  }
  return result;
}

uint64_t _filter_invalidEncoding(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (a3)
    *a3 = -1;
  return 0;
}

CFStringRef _filter_checkISO2022_JP(unint64_t a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v3;
  _BYTE *v7;
  int v8;
  CFStringRef result;

  v3 = a1 + a2 - 3;
  if (v3 <= a1)
    return 0;
  v7 = (_BYTE *)a1;
  while (1)
  {
    if (*v7 == 27)
    {
      if (v7[1] != 36)
      {
        ++v7;
        goto LABEL_8;
      }
      v8 = v7[2];
      v7 += 2;
      if ((v8 | 2) == 0x42)
        break;
    }
LABEL_8:
    if ((unint64_t)++v7 >= v3)
      return 0;
  }
  -[__CFString UTF8String]((id)CFStringConvertEncodingToIANACharSetName(0x821u), "UTF8String");
  result = _MFCreateStringWithBytesViaICU(a1, a2);
  if (a3)
  {
    if (result)
      *a3 = 2081;
  }
  return result;
}

CFStringRef _filter_checkASCII(const UInt8 *a1, CFIndex a2, _DWORD *a3)
{
  const UInt8 *v6;
  int v7;
  CFStringRef result;
  const __CFAllocator *v9;

  v6 = a1;
  while (v6 < &a1[a2])
  {
    v7 = *(char *)v6++;
    if (v7 < 0)
      return 0;
  }
  v9 = (const __CFAllocator *)MFGetMappedAllocator();
  result = _MFCreateStringWithBytes(v9, a1, a2, 0x600u, 0);
  if (a3)
  {
    if (result)
      *a3 = 1536;
  }
  return result;
}

CFStringRef _filter_promoteGB18030(const UInt8 *a1, CFIndex a2, _DWORD *a3)
{
  const __CFAllocator *v6;
  CFStringRef result;

  v6 = (const __CFAllocator *)MFGetMappedAllocator();
  result = _MFCreateStringWithBytes(v6, a1, a2, 0x632u, 0);
  if (a3)
  {
    if (result)
      *a3 = 1586;
  }
  return result;
}

CFStringRef _filter_promoteBig5_HKSCS(const UInt8 *a1, CFIndex a2, _DWORD *a3)
{
  const __CFAllocator *v6;
  CFStringRef result;

  v6 = (const __CFAllocator *)MFGetMappedAllocator();
  result = _MFCreateStringWithBytes(v6, a1, a2, 0xA06u, 0);
  if (a3)
  {
    if (result)
      *a3 = 2566;
  }
  return result;
}

CFStringRef _filter_softbank(const UInt8 *a1, unint64_t a2, _DWORD *a3)
{
  CFStringRef result;
  const __CFAllocator *v7;

  if (MFCanUseSoftBankCodePoints())
  {
    result = _MFCreateStringWithBytesViaICU((uint64_t)a1, a2);
    if (!a3)
      return result;
  }
  else
  {
    v7 = (const __CFAllocator *)MFGetMappedAllocator();
    result = _MFCreateStringWithBytes(v7, a1, a2, 0xA01u, 0);
    if (!a3)
      return result;
  }
  if (result)
    *a3 = 2561;
  return result;
}

CFStringRef _filter_checkUTF32(const UInt8 *a1, unint64_t a2, _DWORD *a3)
{
  CFStringRef result;
  const __CFAllocator *v7;

  if (a2 < 4)
    return 0;
  if (*a1 != 255)
  {
    if (!*a1 && !a1[1] && a1[2] == 254 && a1[3] == 255)
      goto LABEL_14;
    return 0;
  }
  if (a1[1] != 254 || a1[2] || a1[3])
    return 0;
LABEL_14:
  v7 = (const __CFAllocator *)MFGetMappedAllocator();
  result = _MFCreateStringWithBytes(v7, a1, a2, 0xC000100u, 1u);
  if (a3)
  {
    if (result)
      *a3 = 201326848;
  }
  return result;
}

CFStringRef _filter_checkUTF16(const UInt8 *a1, unint64_t a2, _DWORD *a3)
{
  int v6;
  CFStringRef result;
  const __CFAllocator *v8;

  if (a2 < 2)
    return 0;
  v6 = *a1;
  if (v6 == 255)
  {
    if (a1[1] != 254)
      return 0;
  }
  else if (v6 != 254 || a1[1] != 255)
  {
    return 0;
  }
  v8 = (const __CFAllocator *)MFGetMappedAllocator();
  result = _MFCreateStringWithBytes(v8, a1, a2, 0x100u, 1u);
  if (a3)
  {
    if (result)
      *a3 = 256;
  }
  return result;
}

CFStringRef _MFCreateStringWithBytesViaICU(uint64_t a1, unint64_t a2)
{
  NSObject *v3;
  CFStringRef v4;
  const __CFAllocator *v6;
  const UniChar *v7;
  const UniChar *v8;
  int v9;

  if (a2 < 0x2AAAAAAB)
  {
    ucnv_open();
    ucnv_setFallback();
    v6 = (const __CFAllocator *)MFGetMappedAllocator();
    v7 = (const UniChar *)CFAllocatorAllocate(v6, 2 * ((2 * (_DWORD)a2) | 1u), 0);
    if (v7)
    {
      v8 = v7;
      v9 = ucnv_toUChars();
      v4 = CFStringCreateWithCharactersNoCopy(v6, v8, v9, v6);
    }
    else
    {
      v4 = 0;
    }
    ucnv_close();
  }
  else
  {
    v3 = MFLogGeneral();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      _MFCreateStringWithBytesViaICU_cold_1(a2, v3);
    return 0;
  }
  return v4;
}

BOOL MFGetRandomBytes(char *a1, int a2)
{
  int v4;
  int v5;
  ssize_t v6;
  uint64_t v7;
  NSObject *v8;
  int *v9;
  char *v10;
  _BOOL8 v11;
  NSObject *v12;
  _BOOL4 v13;
  int *v14;
  char *v15;
  int *v16;
  char *v17;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v4 = open("/dev/urandom", 0);
  if (v4 < 0)
  {
    MFLogGeneral();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = __error();
      v10 = strerror(*v9);
      MFGetRandomBytes_cold_1((uint64_t)v10, (uint64_t)v19, v8);
    }

    return 0;
  }
  else
  {
    v5 = v4;
    if (a2 >= 1)
    {
      while (1)
      {
        v6 = read(v5, a1, a2);
        v7 = v6;
        if (v6 <= 0)
          break;
        a2 -= v6;
        a1 += v6;
        if (a2 <= 0)
          goto LABEL_15;
      }
      MFLogGeneral();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
      if (v7 < 0)
      {
        if (v13)
        {
          v16 = __error();
          v17 = strerror(*v16);
          MFGetRandomBytes_cold_2((uint64_t)v17, (uint64_t)v19, v12);
        }
      }
      else if (v13)
      {
        v14 = __error();
        v15 = strerror(*v14);
        MFGetRandomBytes_cold_3((uint64_t)v15, (uint64_t)v19, v12);
      }

    }
LABEL_15:
    v11 = a2 == 0;
    close(v5);
  }
  return v11;
}

void sub_1ABB19E04(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void MF_MD5HMAC_Init(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  int8x16_t v9;
  int8x16_t v10;
  uint64_t v11;
  unsigned __int8 md[16];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 204) = 0u;
  if ((unint64_t)objc_msgSend(v3, "length") >= 0x41)
  {
    memset(md, 170, sizeof(md));
    CC_MD5_Init((CC_MD5_CTX *)a1);
    v4 = objc_retainAutorelease(v3);
    CC_MD5_Update((CC_MD5_CTX *)a1, (const void *)objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"));
    CC_MD5_Final(md, (CC_MD5_CTX *)a1);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 16);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v5;
  }
  objc_msgSend(v3, "getBytes:length:", a1 + 92, 64);
  v6 = 0;
  v7 = *(_OWORD *)(a1 + 108);
  *(_OWORD *)(a1 + 156) = *(_OWORD *)(a1 + 92);
  *(_OWORD *)(a1 + 172) = v7;
  v8 = *(_OWORD *)(a1 + 140);
  *(_OWORD *)(a1 + 188) = *(_OWORD *)(a1 + 124);
  *(_OWORD *)(a1 + 204) = v8;
  v9.i64[0] = 0x3636363636363636;
  v9.i64[1] = 0x3636363636363636;
  v10.i64[0] = 0x5C5C5C5C5C5C5C5CLL;
  v10.i64[1] = 0x5C5C5C5C5C5C5C5CLL;
  do
  {
    v11 = a1 + v6;
    *(int8x16_t *)(v11 + 92) = veorq_s8(*(int8x16_t *)(a1 + v6 + 92), v9);
    *(int8x16_t *)(v11 + 156) = veorq_s8(*(int8x16_t *)(a1 + v6 + 156), v10);
    v6 += 16;
  }
  while (v6 != 64);
  CC_MD5_Init((CC_MD5_CTX *)a1);
  CC_MD5_Update((CC_MD5_CTX *)a1, (const void *)(a1 + 92), 0x40u);

}

void sub_1ABB19F9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t MF_MD5HMAC_Output(CC_MD5_CTX *c, unsigned __int8 *md)
{
  CC_MD5_Final(md, c);
  CC_MD5_Init(c);
  CC_MD5_Update(c, &c[1].data[10], 0x40u);
  CC_MD5_Update(c, md, 0x10u);
  return CC_MD5_Final(md, c);
}

void OUTLINED_FUNCTION_0(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t MFGetMappedAllocator()
{
  pthread_once(&_MappedAllocatorOnce, (void (*)(void))_MappedAllocatorInitialize);
  return _MappedAllocator;
}

CFAllocatorRef _MappedAllocatorInitialize()
{
  CFAllocatorRef result;
  CFAllocatorContext v1;

  *(_OWORD *)&v1.copyDescription = xmmword_1E5AA1290;
  *(_OWORD *)&v1.reallocate = *(_OWORD *)off_1E5AA12A0;
  v1.preferredSize = 0;
  memset(&v1, 0, 32);
  result = CFAllocatorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &v1);
  _MappedAllocator = (uint64_t)result;
  return result;
}

uint64_t _MappedAllocatorAllocate(uint64_t a1)
{
  MFMutableData *v1;

  if (a1 < 0)
    return 0;
  v1 = -[MFMutableData initWithLength:]([MFMutableData alloc], "initWithLength:", a1 + 8);
  *(_QWORD *)-[MFMutableData mutableBytes](v1, "mutableBytes") = v1;
  return (uint64_t)(-[MFMutableData mutableBytes](v1, "mutableBytes") + 8);
}

uint64_t _MappedAllocatorReallocate(uint64_t a1, uint64_t a2)
{
  void *v2;

  if (a2 < 0)
    return 0;
  v2 = *(void **)(a1 - 8);
  objc_msgSend(v2, "setLength:", a2 + 8);
  return objc_msgSend(v2, "mutableBytes") + 8;
}

void _MappedAllocatorDeallocate(uint64_t a1)
{

}

uint64_t MFStringHashForMessageID(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  int v4;
  const char *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    EFAtomicObjectLoad();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      v4 = objc_msgSend(v2, "BOOLValue");

      if (v4)
      {
LABEL_4:
        v5 = (const char *)objc_msgSend(objc_retainAutorelease(v1), "ef_lossyDefaultCStringBytes");
        v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v5, strlen(v5));
        objc_msgSend(v6, "ef_md5Digest");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F088]), "initWithMD5Digest:", v7);
LABEL_10:
        v9 = objc_msgSend(v8, "int64Value");

        goto LABEL_11;
      }
    }
    else
    {
      if (useLegacyMessageIDHashFormat_onceToken != -1)
        dispatch_once(&useLegacyMessageIDHashFormat_onceToken, &__block_literal_global);
      objc_msgSend((id)useLegacyMessageIDHashFormat_userDefaults, "valueForKey:", CFSTR("UseLegacyMessageIDHashFormat"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "BOOLValue");

      if ((v11 & 1) != 0)
        goto LABEL_4;
    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F088]), "initWithString:", v1);
    goto LABEL_10;
  }
  v9 = 0;
LABEL_11:

  return v9;
}

void sub_1ABB1A6E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

uint64_t MFStringHashForMessageIDHeader(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "ec_messageIDSubstring");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = MFStringHashForMessageID(v1);

  return v2;
}

void sub_1ABB1A75C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t MFUniqueMessageIDHash()
{
  id v0;
  void *v1;
  uint64_t v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v0, "UUIDString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = MFStringHashForMessageID(v1);

  return v2;
}

void sub_1ABB1A7BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t MFMessageIDHashFromHeaders(void *a1, int a2)
{
  void *v3;
  uint64_t v4;
  BOOL v5;

  objc_msgSend(a1, "firstHeaderForKey:", *MEMORY[0x1E0D1E5B0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MFStringHashForMessageIDHeader(v3);
  if (v4)
    v5 = 1;
  else
    v5 = a2 == 0;
  if (!v5)
    v4 = MFUniqueMessageIDHash();

  return v4;
}

void sub_1ABB1A838(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1A9A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v8 = v6;

  _Unwind_Resume(a1);
}

void sub_1ABB1ABC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1ABB1AC40()
{
  JUMPOUT(0x1ABB1AC30);
}

void sub_1ABB1AC8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABB1AD88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  int v10;

  if (v10)

  _Unwind_Resume(exception_object);
}

void sub_1ABB1AEA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABB1AF2C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1AF70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1AFE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABB1B048(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1B09C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1B0FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1B154(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1B1C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1B224(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1B394(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABB1B4BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB1B690(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABB1B85C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB1B920(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1BA10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB1BA84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABB1BB1C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1BCB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v4;

  _Unwind_Resume(a1);
}

void sub_1ABB1BD9C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB1BEA4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1C044(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB1C154(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB1C20C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABB1C2E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABB1C658(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABB1C770(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1C7C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1C81C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABB1C8A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1C91C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1C9AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1CA28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1CAF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB1CBB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

id _cachedIvarLoadFromHeaders(void *a1, int a2, void *a3)
{
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  BOOL v8;
  void *v9;

  v5 = a1;
  v6 = a3;
  _MFLockGlobalLock();
  v6[2](v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _MFUnlockGlobalLock();
  if (v7)
    v8 = 1;
  else
    v8 = a2 == 0;
  if (!v8)
  {
    objc_msgSend(v5, "headers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loadCachedHeaderValuesFromHeaders:", v9);

    _MFLockGlobalLock();
    v6[2](v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _MFUnlockGlobalLock();
  }

  return v7;
}

void sub_1ABB1CCF8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABB1CDE0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1CF8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABB1D118(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB1D3D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABB1D694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABB1D958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABB1DAD0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1DB34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABB1DB7C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1DBD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABB1DC1C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1DC74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABB1DCBC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1DE10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABB1DF3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1ABB1E1D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1ABB1E468(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_1ABB1E630(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1ABB1E718(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1E7B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1E838(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1E91C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABB1E9DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1EA9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1EBFC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABB1ECCC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1ED38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABB1EDB8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1EE24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB1EE98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB1EEF0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void __useLegacyMessageIDHashFormat_block_invoke()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.mail"));

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("group.com.apple.mail"));
  v3 = (void *)useLegacyMessageIDHashFormat_userDefaults;
  useLegacyMessageIDHashFormat_userDefaults = v2;

}

void sub_1ABB1F080(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1F114(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABB1F284(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void _changeFileAttributes(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD *v10;

  v10 = a1;
  v5 = a2;
  v6 = a3;
  v7 = (void *)v10[5];
  if (v6)
  {
    if (!v7)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v9 = (void *)v10[5];
      v10[5] = v8;

      v7 = (void *)v10[5];
    }
    objc_msgSend(v7, "setValue:forKey:", v6, v5);
  }
  else
  {
    objc_msgSend(v7, "removeObjectForKey:", v5);
  }

}

void sub_1ABB1F338(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1ABB1F388(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1F3F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABB1F440(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1F4AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABB1F514(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB1F57C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1F5C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id _mimeTypeFromFileName(void *a1)
{
  id v1;
  MFTypeInfo *v2;
  void *v3;
  void *v4;

  v1 = a1;
  v2 = objc_alloc_init(MFTypeInfo);
  objc_msgSend(v1, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFTypeInfo setPathExtension:](v2, "setPathExtension:", v3);

  -[MFTypeInfo setFilename:](v2, "setFilename:", v1);
  if (MFGetTypeInfo(v2, 1))
  {
    -[MFTypeInfo mimeType](v2, "mimeType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void sub_1ABB1F66C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1ABB1F6E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1F744(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1F7A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1F7FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1F858(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1F8BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB1FA88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1ABB1FBC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABB1FDF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void _fixSubwrappersAtPath(void *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  size_t v6;
  void *v7;
  void *v8;
  _BYTE *v9;
  uint64_t v10;
  size_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a1;
  if (objc_msgSend(v14, "isDirectory"))
  {
    objc_msgSend(v14, "fileWrappers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3 && objc_msgSend(v3, "count"))
    {
      v5 = (void *)MEMORY[0x1AF433BF4]();
      v6 = strlen((const char *)a2);
      objc_msgSend(v4, "keyEnumerator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 0;
      v9 = (_BYTE *)(a2 + v6);
      v10 = a2 + v6 + 1;
      v11 = 1022 - v6;
      while (1)
      {
        objc_msgSend(v7, "nextObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
          break;
        objc_msgSend(v4, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "getFileSystemRepresentation:maxLength:", v10, v11))
        {
          *v9 = 47;
          *(_BYTE *)(a2 + 1023) = 0;
          _fixSubwrappersAtPath(v13, a2);
        }

        v8 = v12;
      }
      *v9 = 0;

      objc_autoreleasePoolPop(v5);
    }
  }
  else
  {
    v4 = 0;
  }

}

void sub_1ABB1FF98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABB2003C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABB20128(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB2019C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB2022C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB20274(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB202D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABB20324(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB203B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABB20418(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MFMessageFileWrapper;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1ABB20514(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB20788(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB2083C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB208B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB209C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1ABB20A44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABB20B68(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB20C4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);

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

void sub_1ABB20D8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

id _MFCreateStringFromHeaderBytes(unsigned int a1, UInt8 *a2, size_t a3)
{
  unint64_t v5;
  uint64_t v6;
  size_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  size_t v14;
  size_t v15;
  uint64_t v16;
  uint64_t v17;
  size_t v18;
  size_t v19;
  size_t v20;
  unint64_t v21;
  unsigned int v22;
  int v23;
  void *v24;
  __CFString *v25;
  int v26;
  int v27;
  const UInt8 *v28;
  __darwin_ct_rune_t v29;
  __CFData *UnfoldedData;
  __CFData *Mutable;
  UInt8 *MutableBytePtr;
  CFIndex Length;
  unint64_t v34;
  _BYTE *v35;
  void *v36;
  void *v37;
  const void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  const __CFAllocator *bytesDeallocator;
  size_t __n;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  void *v51;
  unint64_t v52;
  int v53;

  if (_MFCreateStringFromHeaderBytes_onceToken != -1)
    dispatch_once(&_MFCreateStringFromHeaderBytes_onceToken, &__block_literal_global_0);
  v53 = -1;
  v48 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", a2, a3, 1, 0);
  __n = a3;
  if (!a3)
  {
    v39 = 0;
    v7 = 0;
    v6 = 0;
    goto LABEL_50;
  }
  v5 = 0;
  v51 = 0;
  bytesDeallocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE20];
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  v7 = a3;
  while (1)
  {
    v52 = v5;
    objc_msgSend((id)_MFCreateStringFromHeaderBytes_mimeRegex, "firstMatchInString:options:range:", v47, 0, bytesDeallocator);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
      break;
    v10 = objc_msgSend(v8, "range");
    v49 = v11;
    v12 = v10;
    v13 = objc_msgSend(v9, "rangeAtIndex:", 1);
    v15 = v14;
    v16 = objc_msgSend(v9, "rangeAtIndex:", 2);
    v17 = objc_msgSend(v9, "rangeAtIndex:", 3);
    v19 = v18;
    if (!v51)
      v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", __n);
    v50 = v9;
    v20 = v7;
    if (v12 > v52)
    {
      if (v6 != v52)
        goto LABEL_17;
      v21 = v52;
      do
      {
        v22 = (char)a2[v21];
        if ((v22 & 0x80000000) != 0)
          v23 = __maskrune(v22, 0x4000uLL);
        else
          v23 = *(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v22 + 60) & 0x4000;
        ++v21;
      }
      while (v21 < v12 && v23);
      if (!v23)
      {
LABEL_17:
        _consumeBuffer(v51, v48, &v53);
        _createStringFromRawHeaderBytes(a1, &a2[v52], v12 - v52);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
          objc_msgSend(v51, "appendString:", v24);

      }
    }
    if (!v15)
      goto LABEL_31;
    _createStringFromRawHeaderBytes(1536, &a2[v13], v15);
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v26 = MFEncodingForCharsetWithFallback(v25, a1);
    v27 = v26;
    if (v53 != v26)
      goto LABEL_29;
    if (v26 > 2351)
    {
      if ((v26 - 2352) <= 0x10 && ((1 << (v26 - 48)) & 0x10003) != 0 || v26 == 2565 || v26 == 134217984)
        goto LABEL_30;
LABEL_29:
      _consumeBuffer(v51, v48, &v53);
      v53 = v27;
      goto LABEL_30;
    }
    if ((v26 - 1584) >= 3)
      goto LABEL_29;
LABEL_30:

LABEL_31:
    v28 = &a2[v17];
    v29 = __tolower((char)a2[v16]);
    UnfoldedData = _createUnfoldedData(&a2[v17], v19);
    Mutable = UnfoldedData;
    if (v29 == 113)
    {
      if (!UnfoldedData)
      {
        Mutable = CFDataCreateMutable(0, v19);
        CFDataAppendBytes(Mutable, v28, v19);
      }
      MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
      Length = CFDataGetLength(Mutable);
      if (Length >= 1)
      {
        v34 = (unint64_t)&MutableBytePtr[Length];
        do
        {
          v35 = memchr(MutableBytePtr, 95, v34 - (_QWORD)MutableBytePtr);
          if (!v35)
            break;
          *v35 = 32;
          MutableBytePtr = v35 + 1;
        }
        while ((unint64_t)(v35 + 1) < v34);
      }
      -[__CFData mf_decodeQuotedPrintableForText:](Mutable, "mf_decodeQuotedPrintableForText:", 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (UnfoldedData)
        v37 = (void *)CFRetain(UnfoldedData);
      else
        v37 = CFDataCreateWithBytesNoCopy(0, v28, v19, bytesDeallocator);
      v38 = v37;
      objc_msgSend(v37, "mf_decodeBase64");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(v38);
    }
    if (Mutable)
      CFRelease(Mutable);
    objc_msgSend(v48, "appendData:", v36);
    v6 = v12 + v49;
    v7 = v52 + v20 - (v12 + v49);

    v5 = v12 + v49;
    if (!v7)
      goto LABEL_49;
  }
  v6 = v52;
LABEL_49:
  v39 = v51;
LABEL_50:
  _consumeBuffer(v39, v48, &v53);
  v40 = v39;
  if (v39)
  {
    if (v7)
    {
      _createStringFromRawHeaderBytes(a1, &a2[v6], v7);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (v41)
        objc_msgSend(v39, "appendString:", v41);

    }
    v42 = v39;
  }
  else
  {
    _createStringFromRawHeaderBytes(a1, a2, __n);
    v42 = (id)objc_claimAutoreleasedReturnValue();
    v40 = 0;
  }

  return v42;
}

void sub_1ABB21250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1ABB213B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1ABB21480(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB215CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1ABB2188C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB219AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB21A64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB21ADC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB21B34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB21D68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, void *a11)
{

  _Unwind_Resume(a1);
}

void sub_1ABB21E0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB228B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{

  _Unwind_Resume(a1);
}

void sub_1ABB22A28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB22AB0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB22D60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABB22EDC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB22F80(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB23018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1ABB23074(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void _consumeBuffer(void *a1, void *a2, _DWORD *a3)
{
  __CFString *v5;
  __CFString *v6;
  id v7;

  v7 = a1;
  v5 = a2;
  if (-[__CFString length](v5, "length"))
  {
    v6 = MFCreateStringWithData(v5, *a3, 0);
    if (v6)
      objc_msgSend(v7, "appendString:", v6);
    -[__CFString setLength:](v5, "setLength:", 0);
    *a3 = -1;

  }
}

void sub_1ABB23150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

__CFString *_createStringFromRawHeaderBytes(uint64_t a1, UInt8 *a2, size_t __n)
{
  __CFData *UnfoldedData;
  __CFString *v7;

  UnfoldedData = _createUnfoldedData(a2, __n);
  if (!UnfoldedData)
    UnfoldedData = CFDataCreateWithBytesNoCopy(0, a2, __n, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  if ((_DWORD)a1 != -1 || (v7 = MFCreateStringWithData((__CFString *)UnfoldedData, 1536, 0)) == 0)
  {
    v7 = MFCreateStringWithData((__CFString *)UnfoldedData, a1, 0);
    if (!v7)
      v7 = (__CFString *)CFStringCreateWithBytes(0, a2, __n, a1, 0);
  }
  if (UnfoldedData)
    CFRelease(UnfoldedData);
  return v7;
}

void sub_1ABB23254(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB23864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,void *a30)
{
  void *v30;

  _Unwind_Resume(a1);
}

void sub_1ABB23A28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

__CFData *_createUnfoldedData(UInt8 *a1, size_t __n)
{
  UInt8 *v3;
  char *v4;
  char *v5;
  unint64_t v6;
  __CFData *Mutable;
  unint64_t v8;
  int v9;

  v3 = a1;
  v4 = (char *)memchr(a1, 10, __n);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = (unint64_t)&v3[__n];
  Mutable = CFDataCreateMutable(0, __n);
  do
  {
    CFDataAppendBytes(Mutable, v3, v5 - (char *)v3);
    v3 = (UInt8 *)(v5 + 1);
    if ((unint64_t)(v5 + 1) < v6)
    {
      v8 = v6 - 1 - (_QWORD)v5;
      while (1)
      {
        v9 = (char)*v3;
        if (v9 != 32 && v9 != 9)
          break;
        ++v3;
        if (!--v8)
        {
          v3 = (UInt8 *)v6;
          break;
        }
      }
    }
    CFDataAppendBytes(Mutable, (const UInt8 *)" ", 1);
    v5 = (char *)memchr(v3, 10, v6 - (_QWORD)v3);
  }
  while (v5);
  if ((unint64_t)v3 < v6)
    CFDataAppendBytes(Mutable, v3, v6 - (_QWORD)v3);
  return Mutable;
}

void sub_1ABB23CB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABB23DDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABB23F50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABB24130(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABB2421C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB24294(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB24334(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB244A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABB2458C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB24658(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB2475C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1ABB247CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB248BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABB24938(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB24A04(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB24CA8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABB24DA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB24EAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t MFDataGetDataPath()
{
  pthread_once(&sMFDataOnce, (void (*)(void))_MFDataInit);
  return sMFDataPath;
}

uint64_t _MFDataInit()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  NSString *v3;
  NSString *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;

  v0 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v1 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier");
  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "processName");
  if (!v2)
    v2 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", getprogname(), 4);
  v3 = NSHomeDirectory();
  v4 = -[NSString stringByAppendingPathComponent:](-[NSString stringByAppendingPathComponent:](v3, "stringByAppendingPathComponent:", CFSTR("Library")), "stringByAppendingPathComponent:", CFSTR("Caches"));
  if (v1)
    v5 = v1;
  else
    v5 = v2;
  sMFDataPath = -[NSString stringByAppendingPathComponent:](-[NSString stringByAppendingPathComponent:](v4, "stringByAppendingPathComponent:", v5), "stringByAppendingPathComponent:", CFSTR("MFData"));
  if (sMFDataPath)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    if ((objc_msgSend(v6, "fileExistsAtPath:", sMFDataPath) & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "enumeratorAtPath:", sMFDataPath);
      v8 = objc_msgSend(v7, "nextObject");
      if (v8)
      {
        v9 = v8;
        do
        {
          MFRemoveItemAtPath((void *)objc_msgSend((id)sMFDataPath, "stringByAppendingPathComponent:", v9));
          v9 = objc_msgSend(v7, "nextObject");
        }
        while (v9);
      }
    }
    else if ((objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", sMFDataPath, 1, 0, 0) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unable to create %@.  Check the sandbox access."), sMFDataPath);
    }
    v10 = -[NSString stringByAppendingPathComponent:](v3, "stringByAppendingPathComponent:", CFSTR("Library"));
    if (objc_msgSend(CFSTR("MobileMail"), "isEqualToString:", v2))
      v11 = CFSTR("Mail");
    else
      v11 = (const __CFString *)v2;
    v12 = -[NSString stringByAppendingPathComponent:](-[NSString stringByAppendingPathComponent:](v10, "stringByAppendingPathComponent:", v11), "stringByAppendingPathComponent:", CFSTR("MFData"));
    if (v12)
    {
      v13 = (void *)v12;
      if (objc_msgSend(v6, "fileExistsAtPath:", v12))
        MFRemoveItemAtPath(v13);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unable to produce a cache path."));
  }
  return objc_msgSend(v0, "drain");
}

void sub_1ABB259F0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)&sWaterMarkLock);
  _Unwind_Resume(a1);
}

void sub_1ABB25C08(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void MFDataConsumerAppendDispatchData(void *a1, NSObject *a2)
{
  id v3;
  id v4;
  _QWORD applier[4];
  id v6;

  v3 = a1;
  if (v3 && a2)
  {
    applier[1] = 3221225472;
    applier[2] = __MFDataConsumerAppendDispatchData_block_invoke;
    applier[3] = &unk_1E5AA14E0;
    v4 = v3;
    applier[0] = MEMORY[0x1E0C809B0];
    v6 = v3;
    dispatch_data_apply(a2, applier);

    v3 = v4;
  }

}

uint64_t MFDataConsumerConsumeCompleteData(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  BOOL i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v13;

  v3 = a1;
  v13 = a2;
  v4 = objc_msgSend(v13, "length");
  v5 = objc_retainAutorelease(v13);
  v6 = objc_msgSend(v5, "bytes");
  v7 = 0;
  for (i = 0; ; i = v11 == 0)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v6 + v7, v4 - v7, 0);
    v10 = objc_msgSend(v3, "appendData:", v9);
    v11 = v10;
    if (v10 < 0)
      break;
    if (i && v10 == 0)
    {
      v11 = v7;
      break;
    }
    v7 += v10;
    if (v7 == v4)
    {
      v11 = v4;
      break;
    }

  }
  return v11;
}

void sub_1ABB27C3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABB27DB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABB27E20(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB27EE0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB27F30(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB27FA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB28024(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABB28200(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB2833C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB28444(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB284FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABB28594(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB28994(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB28A4C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB28AA8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB28B04(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB28C68(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB28D28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB28D8C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB28DF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB28E58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABB29110(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB292D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB2939C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1ABB294F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  void *v11;
  uint64_t v12;
  va_list va;

  va_start(va, a11);

  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v12 - 80), 8);
  _Block_object_dispose((const void *)(v12 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1ABB295E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{

  _Unwind_Resume(a1);
}

void sub_1ABB298CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB29938(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB29BE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB2A550(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABB2A5EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABB2A758(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t _block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;

  v4 = a2;
  v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "caseInsensitiveCompare:", v9);
  if (!v10)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = objc_msgSend(v4, "compare:", v5);
    }
    else if (v4 < v5)
    {
      v10 = -1;
    }
    else
    {
      v10 = v4 > v5;
    }
  }

  return v10;
}

void sub_1ABB2A864(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

__CFString *copyMutablePlainTextFromPoint(const __CFString *a1, uint64_t a2, unint64_t a3, int a4)
{
  __int128 v8;
  uint64_t v9;
  const char *CStringPtr;
  __CFString *v11;
  unint64_t v12;
  BOOL v13;
  unsigned int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  UniChar *v20;
  uint64_t v21;
  UniChar v22;
  _BOOL4 v23;
  uint64_t v24;
  UniChar *v25;
  uint64_t v26;
  UniChar v27;
  unint64_t v28;
  uint64_t v29;
  UniChar *v30;
  unint64_t v31;
  UniChar v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  UniChar *v37;
  uint64_t v38;
  UniChar v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  UniChar *v48;
  uint64_t v49;
  UniChar v50;
  uint64_t v51;
  uint64_t v52;
  UniChar *v53;
  uint64_t v54;
  UniChar v55;
  int v56;
  const __CFString *v57;
  const __CFString *v58;
  int v59;
  int v60;
  CFIndex Length;
  int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  UniChar *v70;
  uint64_t v71;
  UniChar v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _BOOL4 v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  UniChar v87;
  unsigned int v88;
  int v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  UniChar *v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  UniChar v103;
  uint64_t v104;
  unint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  UniChar *v113;
  uint64_t v114;
  int v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  int v123;
  uint64_t v124;
  unsigned int v125;
  uint64_t v126;
  __CFString *v127;
  unint64_t v128;
  uint64_t v129;
  __CFString *appendedString;
  unsigned int v131;
  int v132;
  char v133;
  UniChar v134[8];
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  CFStringRef v142[2];
  __int128 v143;
  __int128 v144;
  uint64_t v145;
  UniChar chars;
  char v147[8];
  UniChar buffer[8];
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  CFStringRef theString[2];
  __int128 v157;
  __int128 v158;
  uint64_t v159;
  _QWORD v160[4];
  CFRange v161;
  CFRange v162;
  CFRange v163;
  CFRange v164;
  CFRange v165;
  CFRange v166;
  CFRange v167;
  CFRange v168;
  CFRange v169;
  CFRange v170;

  v160[2] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v154 = v8;
  v155 = v8;
  v152 = v8;
  v153 = v8;
  v150 = v8;
  v151 = v8;
  *(_OWORD *)buffer = v8;
  v149 = v8;
  v9 = CFStringGetLength(a1) - a2;
  theString[0] = a1;
  *((_QWORD *)&v157 + 1) = a2;
  *(_QWORD *)&v158 = v9;
  theString[1] = (CFStringRef)CFStringGetCharactersPtr(a1);
  if (theString[1])
    CStringPtr = 0;
  else
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  *((_QWORD *)&v158 + 1) = 0;
  v159 = 0;
  *(_QWORD *)&v157 = CStringPtr;
  v11 = (__CFString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
  appendedString = (__CFString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
  memset(v147, 170, 5);
  if (!a3 || v9 < 1)
    goto LABEL_251;
  v12 = 0;
  v13 = 0;
  v133 = 0;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v123 = a4 ^ 1;
  v126 = v9 - 7;
  v129 = 0;
  v18 = MEMORY[0x1E0C80978];
  v127 = v11;
  v128 = a3;
  do
  {
    chars = -21846;
    if (v15 < 0)
    {
      chars = 0;
      if (!v13)
      {
LABEL_17:
        v22 = 0;
        v23 = v17 != 0;
        goto LABEL_18;
      }
      goto LABEL_101;
    }
    v19 = v158;
    if ((uint64_t)v158 <= v15)
    {
      chars = 0;
      if (!v13)
        goto LABEL_17;
LABEL_32:
      *(_OWORD *)v142 = *(_OWORD *)theString;
      v143 = v157;
      v144 = v158;
      v145 = v159;
      v138 = v152;
      v139 = v153;
      v140 = v154;
      v141 = v155;
      *(_OWORD *)v134 = *(_OWORD *)buffer;
      v135 = v149;
      v136 = v150;
      v137 = v151;
      v24 = v158;
      if ((uint64_t)v158 <= v15)
        goto LABEL_101;
      v25 = (UniChar *)v142[1];
      if (v142[1])
      {
        v26 = *((_QWORD *)&v143 + 1) + v15;
      }
      else
      {
        if ((_QWORD)v143)
        {
          v27 = *(char *)(v143 + *((_QWORD *)&v143 + 1) + v15);
          goto LABEL_50;
        }
        if (v145 <= v15 || (v43 = *((_QWORD *)&v144 + 1), *((uint64_t *)&v144 + 1) > v15))
        {
          v44 = v15 - 4;
          if ((unint64_t)v15 < 4)
            v44 = 0;
          if (v44 + 64 < (uint64_t)v158)
            v24 = v44 + 64;
          *((_QWORD *)&v144 + 1) = v44;
          v145 = v24;
          v45 = v17;
          v162.location = *((_QWORD *)&v143 + 1) + v44;
          v162.length = v24 - v44;
          CFStringGetCharacters(v142[0], v162, v134);
          v17 = v45;
          v18 = MEMORY[0x1E0C80978];
          v43 = *((_QWORD *)&v144 + 1);
        }
        v26 = v15 - v43;
        v25 = v134;
      }
      v27 = v25[v26];
LABEL_50:
      if (v27 != 45)
        goto LABEL_101;
      v35 = v15 + 1;
      v36 = v144;
      if ((uint64_t)v144 <= v15 + 1)
        goto LABEL_101;
      v37 = (UniChar *)v142[1];
      if (v142[1])
      {
        v38 = *((_QWORD *)&v143 + 1) + v35;
      }
      else
      {
        if ((_QWORD)v143)
        {
          v39 = *(char *)(v143 + *((_QWORD *)&v143 + 1) + v35);
          goto LABEL_96;
        }
        if (v145 <= v35 || (v65 = *((_QWORD *)&v144 + 1), *((uint64_t *)&v144 + 1) > v35))
        {
          v66 = v15 - 3;
          if ((unint64_t)v15 < 3)
            v66 = 0;
          if (v66 + 64 < (uint64_t)v144)
            v36 = v66 + 64;
          *((_QWORD *)&v144 + 1) = v66;
          v145 = v36;
          v67 = v17;
          v164.location = *((_QWORD *)&v143 + 1) + v66;
          v164.length = v36 - v66;
          CFStringGetCharacters(v142[0], v164, v134);
          v17 = v67;
          v18 = MEMORY[0x1E0C80978];
          v65 = *((_QWORD *)&v144 + 1);
        }
        v38 = v35 - v65;
        v37 = v134;
      }
      v39 = v37[v38];
LABEL_96:
      if (v39 == 45)
      {
        v51 = v15 + 2;
        v52 = v144;
        if ((uint64_t)v144 > v15 + 2)
        {
          v53 = (UniChar *)v142[1];
          if (v142[1])
          {
            v54 = *((_QWORD *)&v143 + 1) + v51;
          }
          else
          {
            if ((_QWORD)v143)
            {
              v55 = *(char *)(v143 + *((_QWORD *)&v143 + 1) + v51);
LABEL_143:
              v13 = v55 != 62;
              if (v55 == 62)
                v15 += 2;
              goto LABEL_102;
            }
            if (v145 <= v51 || (v75 = *((_QWORD *)&v144 + 1), *((uint64_t *)&v144 + 1) > v51))
            {
              v76 = v15 - 2;
              if ((unint64_t)v15 < 2)
                v76 = 0;
              if (v76 + 64 < (uint64_t)v144)
                v52 = v76 + 64;
              *((_QWORD *)&v144 + 1) = v76;
              v145 = v52;
              v77 = v17;
              v166.location = *((_QWORD *)&v143 + 1) + v76;
              v166.length = v52 - v76;
              CFStringGetCharacters(v142[0], v166, v134);
              v17 = v77;
              v18 = MEMORY[0x1E0C80978];
              v75 = *((_QWORD *)&v144 + 1);
            }
            v54 = v51 - v75;
            v53 = v134;
          }
          v55 = v53[v54];
          goto LABEL_143;
        }
      }
LABEL_101:
      v13 = 1;
      goto LABEL_102;
    }
    v20 = (UniChar *)theString[1];
    if (theString[1])
    {
      v21 = *((_QWORD *)&v157 + 1) + v15;
LABEL_13:
      v22 = v20[v21];
      goto LABEL_31;
    }
    if (!(_QWORD)v157)
    {
      if (v159 <= v15 || (v40 = *((_QWORD *)&v158 + 1), *((uint64_t *)&v158 + 1) > v15))
      {
        v41 = v15 - 4;
        if ((unint64_t)v15 < 4)
          v41 = 0;
        if (v41 + 64 < (uint64_t)v158)
          v19 = v41 + 64;
        *((_QWORD *)&v158 + 1) = v41;
        v159 = v19;
        v42 = v17;
        v161.location = *((_QWORD *)&v157 + 1) + v41;
        v161.length = v19 - v41;
        CFStringGetCharacters(theString[0], v161, buffer);
        v17 = v42;
        v18 = MEMORY[0x1E0C80978];
        v40 = *((_QWORD *)&v158 + 1);
      }
      v21 = v15 - v40;
      v20 = buffer;
      goto LABEL_13;
    }
    v22 = *(char *)(v157 + *((_QWORD *)&v157 + 1) + v15);
LABEL_31:
    chars = v22;
    if (v13)
      goto LABEL_32;
    if (v22 != 60)
    {
      v23 = v17 != 0;
      if (v22 == 62 && (_DWORD)v17 != 0)
      {
        if (!v16)
        {
          v17 = (v17 - 1);
          if (v14)
          {
            v131 = v17;
            if (!strncasecmp(v147, "br", 5uLL)
              || !strncasecmp(v147, "li", 5uLL)
              || !strncasecmp(v147, "/li", 5uLL)
              || !strncasecmp(v147, "div", 5uLL)
              || !strncasecmp(v147, "/div", 5uLL)
              || !strncasecmp(v147, "/p", 5uLL))
            {
              v56 = HIDWORD(v129);
              v57 = CFSTR("\n");
              if (((v123 | HIDWORD(v129)) & 1) == 0
                || (v57 = CFSTR(" "), ((v129 | HIDWORD(v129)) & 1) == 0))
              {
                CFStringAppend(v11, v57);
                v56 = (v123 | HIDWORD(v129)) ^ 1;
                LODWORD(v129) = v123 | HIDWORD(v129);
              }
              HIDWORD(v129) = v56;
              v16 = 0;
              v13 = 0;
              ++v14;
            }
            else
            {
              v16 = 0;
              v13 = 0;
            }
            v18 = MEMORY[0x1E0C80978];
            goto LABEL_110;
          }
LABEL_85:
          v16 = 0;
        }
        goto LABEL_86;
      }
      if (v22 == 62)
      {
        v34 = v17;
        CFStringAppendCharacters(v11, &chars, 1);
        v17 = v34;
        v18 = MEMORY[0x1E0C80978];
        v13 = 0;
        v129 = 0;
        ++v14;
        goto LABEL_102;
      }
LABEL_18:
      if (v23 && !v16)
      {
        if (v12 <= 3)
        {
          v16 = 0;
          v13 = 0;
          v147[v12++] = v22;
          goto LABEL_102;
        }
        goto LABEL_85;
      }
      if (!(v17 | v16))
      {
        if (v22 <= 0x26u)
        {
          if (((1 << v22) & 0x100002600) != 0)
          {
            if ((v133 & 1) != 0)
            {
              CFStringAppend(v11, CFSTR("&"));
              CFStringAppend(v11, appendedString);
              CFStringReplaceAll(appendedString, &stru_1E5AA1FC8);
              v18 = MEMORY[0x1E0C80978];
            }
            if (!((v129 | HIDWORD(v129)) & 1 | (v14 == 0)))
            {
              CFStringAppend(v11, CFSTR(" "));
              v18 = MEMORY[0x1E0C80978];
              v17 = 0;
              v16 = 0;
              v133 = 0;
              v13 = 0;
              v129 = 1;
              goto LABEL_102;
            }
            v17 = 0;
            v16 = 0;
            v133 = 0;
            goto LABEL_86;
          }
          if (v22 == 38)
          {
            v17 = 0;
            v16 = 0;
            v13 = 0;
            v133 = 1;
            goto LABEL_102;
          }
        }
        if ((v133 & (v22 != 59)) != 1)
        {
          if ((v133 & (v22 == 59)) == 1)
          {
            CFStringAppendCharacters(appendedString, &chars, 1);
            v58 = (const __CFString *)-[__CFString ec_parseHTMLEntity](appendedString, "ec_parseHTMLEntity");
            v59 = -[__CFString isEqualToString:](appendedString, "isEqualToString:", CFSTR("nbsp;"));
            if (v58
              && (v60 = v59, (Length = CFStringGetLength(v58)) != 0)
              && ((v62 = Length, !v60) || !((v129 | HIDWORD(v129)) & 1 | (v14 == 0))))
            {
              CFStringAppend(v11, v58);
              HIDWORD(v129) = 0;
              v14 += v62;
            }
            else
            {
              v60 = v129;
            }
            CFStringReplaceAll(appendedString, &stru_1E5AA1FC8);
            v17 = 0;
            v16 = 0;
            v133 = 0;
            v13 = 0;
            LODWORD(v129) = v60;
          }
          else
          {
            CFStringAppendCharacters(v11, &chars, 1);
            v17 = 0;
            v16 = 0;
            v13 = 0;
            v129 = 0;
            ++v14;
          }
          v18 = MEMORY[0x1E0C80978];
          goto LABEL_102;
        }
        v133 = 1;
        CFStringAppendCharacters(appendedString, &chars, 1);
        v18 = MEMORY[0x1E0C80978];
        v17 = 0;
        goto LABEL_85;
      }
LABEL_86:
      v13 = 0;
      goto LABEL_102;
    }
    v28 = v15 + 1;
    *(_OWORD *)v142 = *(_OWORD *)theString;
    v143 = v157;
    v144 = v158;
    v145 = v159;
    v138 = v152;
    v139 = v153;
    v140 = v154;
    v141 = v155;
    *(_OWORD *)v134 = *(_OWORD *)buffer;
    v135 = v149;
    v136 = v150;
    v137 = v151;
    v29 = v158;
    v131 = v17;
    if ((uint64_t)v158 <= v15 + 1)
      goto LABEL_168;
    v30 = (UniChar *)v142[1];
    if (v142[1])
    {
      v31 = *((_QWORD *)&v143 + 1) + v28;
    }
    else
    {
      if ((_QWORD)v143)
      {
        v32 = *(char *)(v143 + *((_QWORD *)&v143 + 1) + v28);
        goto LABEL_89;
      }
      if (v145 <= (uint64_t)v28 || (v63 = *((_QWORD *)&v144 + 1), *((uint64_t *)&v144 + 1) > (uint64_t)v28))
      {
        v64 = v15 - 3;
        if (v28 < 4)
          v64 = 0;
        if (v64 + 64 < (uint64_t)v158)
          v29 = v64 + 64;
        *((_QWORD *)&v144 + 1) = v64;
        v145 = v29;
        v163.location = *((_QWORD *)&v143 + 1) + v64;
        v163.length = v29 - v64;
        CFStringGetCharacters(v142[0], v163, v134);
        v18 = MEMORY[0x1E0C80978];
        v63 = *((_QWORD *)&v144 + 1);
      }
      v31 = v28 - v63;
      v30 = v134;
    }
    v32 = v30[v31];
LABEL_89:
    if (v32 != 33)
      goto LABEL_168;
    v46 = v15 + 2;
    v47 = v144;
    if ((uint64_t)v144 <= v15 + 2)
      goto LABEL_168;
    v48 = (UniChar *)v142[1];
    if (v142[1])
    {
      v49 = *((_QWORD *)&v143 + 1) + v46;
    }
    else
    {
      if ((_QWORD)v143)
      {
        v50 = *(char *)(v143 + *((_QWORD *)&v143 + 1) + v46);
        goto LABEL_136;
      }
      if (v145 <= v46 || (v73 = *((_QWORD *)&v144 + 1), *((uint64_t *)&v144 + 1) > v46))
      {
        v74 = v15 - 2;
        if (v28 < 3)
          v74 = 0;
        if (v74 + 64 < (uint64_t)v144)
          v47 = v74 + 64;
        *((_QWORD *)&v144 + 1) = v74;
        v145 = v47;
        v165.location = *((_QWORD *)&v143 + 1) + v74;
        v165.length = v47 - v74;
        CFStringGetCharacters(v142[0], v165, v134);
        v18 = MEMORY[0x1E0C80978];
        v73 = *((_QWORD *)&v144 + 1);
      }
      v49 = v46 - v73;
      v48 = v134;
    }
    v50 = v48[v49];
LABEL_136:
    if (v50 == 45)
    {
      v68 = v15 + 3;
      v69 = v144;
      if ((uint64_t)v144 > v15 + 3)
      {
        v70 = (UniChar *)v142[1];
        if (v142[1])
        {
          v71 = *((_QWORD *)&v143 + 1) + v68;
        }
        else
        {
          if ((_QWORD)v143)
          {
            v72 = *(char *)(v143 + *((_QWORD *)&v143 + 1) + v68);
LABEL_166:
            if (v72 == 45)
            {
              v13 = 1;
              v15 += 3;
LABEL_110:
              v17 = v131;
              goto LABEL_102;
            }
            goto LABEL_168;
          }
          if (v145 <= v68 || (v120 = *((_QWORD *)&v144 + 1), *((uint64_t *)&v144 + 1) > v68))
          {
            v121 = v15 - 1;
            if (v28 < 2)
              v121 = 0;
            if (v121 + 64 < (uint64_t)v144)
              v69 = v121 + 64;
            *((_QWORD *)&v144 + 1) = v121;
            v145 = v69;
            v170.location = *((_QWORD *)&v143 + 1) + v121;
            v170.length = v69 - v121;
            CFStringGetCharacters(v142[0], v170, v134);
            v18 = MEMORY[0x1E0C80978];
            v120 = *((_QWORD *)&v144 + 1);
          }
          v71 = v68 - v120;
          v70 = v134;
        }
        v72 = v70[v71];
        goto LABEL_166;
      }
    }
LABEL_168:
    v78 = v16 == 0;
    v147[4] = 0;
    *(_DWORD *)v147 = 0;
    v79 = v15 + 64;
    v80 = ~v15;
    v81 = v15 + 65;
    v82 = v15;
    do
    {
      v83 = v82;
      v84 = v80;
      v85 = v81;
      ++v82;
      if (v83 < -1 || (v86 = v158, (uint64_t)v158 <= v82))
      {
        v88 = 0;
LABEL_174:
        v89 = *(_DWORD *)(v18 + 4 * v88 + 60) & 0x4000;
        goto LABEL_175;
      }
      if (theString[1])
      {
        v87 = *((_WORD *)&theString[1]->isa + v83 + *((_QWORD *)&v157 + 1) + 1);
      }
      else if ((_QWORD)v157)
      {
        v87 = *(char *)(v157 + *((_QWORD *)&v157 + 1) + v83 + 1);
      }
      else
      {
        if (v159 <= v82 || (v90 = *((_QWORD *)&v158 + 1), *((uint64_t *)&v158 + 1) > v82))
        {
          v91 = v83 - 3;
          if ((unint64_t)v82 < 4)
            v91 = 0;
          if (v91 + 64 < (uint64_t)v158)
            v86 = v91 + 64;
          *((_QWORD *)&v158 + 1) = v91;
          v159 = v86;
          v167.location = *((_QWORD *)&v157 + 1) + v91;
          v167.length = v86 - v91;
          CFStringGetCharacters(theString[0], v167, buffer);
          v18 = MEMORY[0x1E0C80978];
          v90 = *((_QWORD *)&v158 + 1);
        }
        v87 = buffer[v83 + 1 - v90];
      }
      v88 = v87;
      if (v87 <= 0x7Fu)
        goto LABEL_174;
      v89 = __maskrune(v87, 0x4000uLL);
      v18 = MEMORY[0x1E0C80978];
LABEL_175:
      ++v79;
      v80 = v84 - 1;
      v81 = v85 + 1;
    }
    while (v89);
    v17 = v131 + v78;
    if (v82 >= v126)
    {
      v13 = 0;
      v12 = 0;
      v11 = v127;
      a3 = v128;
    }
    else
    {
      *(_OWORD *)v142 = *(_OWORD *)theString;
      v143 = v157;
      v144 = v158;
      v145 = v159;
      v138 = v152;
      v139 = v153;
      v140 = v154;
      v141 = v155;
      *(_OWORD *)v134 = *(_OWORD *)buffer;
      v135 = v149;
      v136 = v150;
      v137 = v151;
      if (v83 >= -1)
      {
        v93 = v144;
        if ((uint64_t)v144 <= v82)
        {
          v92 = 0;
        }
        else if (v142[1])
        {
          v92 = *((unsigned __int16 *)&v142[1]->isa + *((_QWORD *)&v143 + 1) + v82);
        }
        else if ((_QWORD)v143)
        {
          v92 = *(char *)(v143 + *((_QWORD *)&v143 + 1) + v82);
        }
        else
        {
          if (v145 <= v82 || (v116 = *((_QWORD *)&v144 + 1), *((uint64_t *)&v144 + 1) > v82))
          {
            if ((unint64_t)v82 >= 4)
              v117 = 4;
            else
              v117 = v82;
            v118 = v82 - v117 + 64;
            if (v118 >= (uint64_t)v144)
              v118 = v144;
            *((_QWORD *)&v144 + 1) = v82 - v117;
            v145 = v118;
            v119 = v131 + v78;
            if ((uint64_t)v144 >= v79 - v117)
              v93 = v79 - v117;
            v169.length = v93 + v117 - v82;
            v169.location = v82 - v117 + *((_QWORD *)&v143 + 1);
            CFStringGetCharacters(v142[0], v169, v134);
            v17 = v119;
            v116 = *((_QWORD *)&v144 + 1);
          }
          v92 = v134[v82 - v116];
        }
      }
      else
      {
        v92 = 0;
      }
      v94 = 0;
      v95 = v82 + 6;
      memset(v160, 170, 14);
      if ((unsigned __int16)v92 == 47)
        v96 = v82 + 1;
      else
        v96 = v82;
      v97 = &v134[v96];
      if ((unsigned __int16)v92 == 47)
        ++v85;
      v98 = v84 - ((unsigned __int16)v92 == 47);
      v99 = v96;
      do
      {
        if (v99 >= 4)
          v100 = 4;
        else
          v100 = v99;
        v101 = v96 + v94;
        if ((uint64_t)(v96 + v94) < 0 || (v102 = v144, (uint64_t)v144 <= v101))
        {
          v103 = 0;
        }
        else if (v142[1])
        {
          v103 = *((_WORD *)&v142[1]->isa + v96 + v94 + *((_QWORD *)&v143 + 1));
        }
        else if ((_QWORD)v143)
        {
          v103 = *(char *)(v143 + *((_QWORD *)&v143 + 1) + v96 + v94);
        }
        else
        {
          if (v145 <= v101 || (v104 = *((_QWORD *)&v144 + 1), *((uint64_t *)&v144 + 1) > v101))
          {
            v105 = v96 - v100;
            v106 = -v100;
            v107 = v100 + v98;
            v108 = v85 - v100;
            v109 = v94 + v105;
            v110 = v109 + 64;
            if (v109 + 64 >= (uint64_t)v144)
              v110 = v144;
            *((_QWORD *)&v144 + 1) = v109;
            v145 = v110;
            v125 = v14;
            v132 = v16;
            v124 = v9;
            v111 = v17;
            if ((uint64_t)v144 >= v108)
              v102 = v108;
            v168.length = v102 + v107;
            v112 = v92;
            v113 = v97;
            v168.location = v96 + v94 + v106 + *((_QWORD *)&v143 + 1);
            CFStringGetCharacters(v142[0], v168, v134);
            v97 = v113;
            v92 = v112;
            v17 = v111;
            v9 = v124;
            v16 = v132;
            v14 = v125;
            v104 = *((_QWORD *)&v144 + 1);
          }
          v103 = v97[v94 - v104];
        }
        *((_WORD *)v160 + v94++) = v103;
        ++v99;
        --v98;
        ++v85;
      }
      while ((uint64_t)(v96 + v94) <= v95);
      v114 = v17;
      if ((unsigned __int16)v92 == 47)
        v115 = -1;
      else
        v115 = 1;
      if (ustrncasecmp((char *)v160, "style", 5) && ustrncasecmp((char *)v160, "script", 6))
        v115 = 0;
      v11 = v127;
      a3 = v128;
      v18 = MEMORY[0x1E0C80978];
      v17 = v114;
      v13 = 0;
      v12 = 0;
      v16 += v115;
    }
LABEL_102:
    if (v14 >= a3)
      break;
    ++v15;
  }
  while (v15 < v9);
LABEL_251:
  if (appendedString)
    CFRelease(appendedString);
  return v11;
}

uint64_t ustrncasecmp(char *a1, char *a2, int a3)
{
  int v3;
  __darwin_ct_rune_t v6;
  char v7;
  char v8;

  if (!a3)
    return 0;
  v3 = a3;
  while (1)
  {
    v6 = *a2;
    v7 = __tolower(*a1);
    v8 = __tolower(v6);
    if (v7 < v8)
      return 0xFFFFFFFFLL;
    if (v8 < v7)
      break;
    a1 += 2;
    ++a2;
    if (!--v3)
      return 0;
  }
  return 1;
}

void sub_1ABB2BB9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB2BDE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1ABB2BF00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABB2BF94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABB2C048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1ABB2C1BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABB2C28C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABB2C358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABB2C420(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB2C608(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB2C698(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB2CB08(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1ABB2CC14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MFStringTransform;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1ABB2CD80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

__CFString *withMutableCharactersAndPadding(void *a1, void *a2)
{
  id v3;
  uint64_t (**v4)(id, char *, _QWORD, uint64_t);
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  unsigned int v13;
  __CFString *v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  id v20;
  int v22;
  _QWORD v23[6];

  v23[5] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = (void *)MEMORY[0x1AF433BF4]();
  v6 = objc_msgSend(v3, "length");
  v9 = v6;
  if (!v6)
  {
    v22 = 166;
    goto LABEL_20;
  }
  if (v6 <= 0x18F)
  {
    v10 = v6 + 1;
    MEMORY[0x1E0C80A78](v6, v7, v8);
    v12 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    memset(v12, 170, 2 * v9 + 2);
    objc_msgSend(v3, "getCharacters:range:", v12, 0, v9);
    v13 = v4[2](v4, v12, v9, v9 + 1);
    if ((v13 & 0x80000000) != 0)
    {
      v14 = 0;
    }
    else if (v13)
    {
      if (v10 < v13)
        __assert_rtn("withMutableCharactersAndPadding", "MFStringTransform.m", 178, "0");
      v14 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", v12, v13);
    }
    else
    {
      v14 = &stru_1E5AA1FC8;
    }
    goto LABEL_17;
  }
  if (v6 > 0x98967F)
  {
    v22 = 199;
LABEL_20:
    __assert_rtn("withMutableCharactersAndPadding", "MFStringTransform.m", v22, "0");
  }
  v15 = v6 + 1;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 2 * (v6 + 1));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "bytes");
  objc_msgSend(v3, "getCharacters:range:", v17, 0, v9);
  v18 = v4[2](v4, (char *)v17, v9, v9 + 1);
  v19 = v18;
  if ((v18 & 0x80000000) != 0)
  {
    v14 = 0;
  }
  else if (v18)
  {
    if (v15 < v18)
      __assert_rtn("withMutableCharactersAndPadding", "MFStringTransform.m", 196, "0");
    v20 = objc_alloc(MEMORY[0x1E0CB3940]);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __withMutableCharactersAndPadding_block_invoke;
    v23[3] = &unk_1E5AA1768;
    v23[4] = v16;
    v14 = (__CFString *)objc_msgSend(v20, "initWithCharactersNoCopy:length:deallocator:", v17, v19, v23);
  }
  else
  {
    v14 = &stru_1E5AA1FC8;
  }

LABEL_17:
  objc_autoreleasePoolPop(v5);

  return v14;
}

void sub_1ABB2D05C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void withMutableCharacters(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  size_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  int v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = (void *)MEMORY[0x1AF433BF4]();
  v6 = objc_msgSend(v3, "length");
  v8 = v6;
  if (!v6)
  {
    v13 = 143;
    goto LABEL_9;
  }
  if (v6 > 0x18F)
  {
    if (v6 <= 0x98967F)
    {
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 2 * v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "bytes");
      objc_msgSend(v3, "getCharacters:range:", v12, 0, v8);
      v4[2](v4, v12, v8);

      goto LABEL_6;
    }
    v13 = 154;
LABEL_9:
    __assert_rtn("withMutableCharacters", "MFStringTransform.m", v13, "0");
  }
  MEMORY[0x1E0C80A78](v6, v7, 2 * v6);
  v10 = (char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  memset(v10, 170, v9);
  objc_msgSend(v3, "getCharacters:range:", v10, 0, v8);
  v4[2](v4, (uint64_t)v10, v8);
LABEL_6:
  objc_autoreleasePoolPop(v5);

}

void sub_1ABB2D2AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void __createTransliterator_block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  _QWORD v3[6];
  int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __createTransliterator_block_invoke_2;
  v3[3] = &unk_1E5AA1790;
  v4 = a3;
  v3[4] = *(_QWORD *)(a1 + 32);
  v3[5] = a2;
  withMutableCharacters(CFSTR("SoftBankStrip"), v3);
}

void __createTransliterator_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;

  v4 = 0;
  v2 = utrans_openU();
  if (v2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;
  }
  else
  {
    MFLogGeneral();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __createTransliterator_block_invoke_2_cold_1();

  }
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void MFTestOverrideCanUseSoftBankCodePoints(int a1)
{
  unsigned __int8 v2;
  void *v3;
  void *v4;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void MFTestOverrideCanUseSoftBankCodePoints(BOOL)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("MFStringUtils+SoftBank.m"), 119, CFSTR("%s can only be called from unit tests"), "void MFTestOverrideCanUseSoftBankCodePoints(BOOL)");

  }
  if (a1)
    v2 = 1;
  else
    v2 = 2;
  atomic_store(v2, (unsigned __int8 *)&sCanUseCodePoints);
}

void sub_1ABB2D4CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __softBankTransform_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  MFStringTransform *v20;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  MFStringTransform *v24;
  id v26;
  id obj;
  MFStringTransform *obja;
  id v29;
  uint8_t v30;
  _BYTE v31[7];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  _QWORD v38[3];
  uint8_t v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v1 = a1 + 32;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), (id)sSoftBankTransform);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v1 + 8) + 40))
  {
    v24 = [MFStringTransform alloc];
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    activeContexts();
    obj = (id)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v2)
    {
      v3 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v2; ++i)
        {
          if (*(_QWORD *)v34 != v3)
            objc_enumerationMutation(obj);
          v5 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          sharedCoreTelephonyClient();
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 0;
          v7 = (void *)objc_msgSend(v6, "copyCarrierBundleLocation:error:", v5, &v32);
          v8 = v32;

          if (!v7)
          {

            continue;
          }
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9;
          if (!v9)
          {
            MFLogGeneral();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
              __softBankTransform_block_invoke_cold_1(&v30, v31, v11);
LABEL_19:
            v16 = 3;
            goto LABEL_24;
          }
          objc_msgSend(v9, "pathForResource:ofType:", CFSTR("hexvalues"), CFSTR("plist"));
          v11 = objc_claimAutoreleasedReturnValue();
          if (!v11)
            goto LABEL_19;
          v29 = v8;
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v11, 0, &v29);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v29;

          MFLogGeneral();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v18 = objc_msgSend(v12, "length");
            *(_DWORD *)buf = 67109379;
            LODWORD(v38[0]) = v18;
            WORD2(v38[0]) = 2117;
            *(_QWORD *)((char *)v38 + 6) = v5;
            _os_log_error_impl(&dword_1ABB13000, v14, OS_LOG_TYPE_ERROR, "MFStringTransform: Read hex values data (%{iec-bytes}u bytes) for %{sensitive}@", buf, 0x12u);
          }

          if (v12)
          {
            MFLogGeneral();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138739971;
              v38[0] = v5;
              _os_log_error_impl(&dword_1ABB13000, v15, OS_LOG_TYPE_ERROR, "MFStringTransform: Found hex values data for %{sensitive}@", buf, 0xCu);
            }

            v26 = v12;
            v16 = 1;
          }
          else
          {
            MFLogGeneral();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v38[0] = v13;
              _os_log_error_impl(&dword_1ABB13000, v17, OS_LOG_TYPE_ERROR, "MFStringTransform: Unable to read hex values in bundle: %{public}@", buf, 0xCu);
            }

            v16 = 3;
          }

          v8 = v13;
LABEL_24:

          if (v16 != 3)
            goto LABEL_28;
        }
        v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      }
      while (v2);
    }
    v26 = 0;
LABEL_28:

    obja = -[MFStringTransform initWithSoftBankHexData:](v24, "initWithSoftBankHexData:", v26);
    if (obja)
    {
      MFLogGeneral();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v39 = 0;
        _os_log_impl(&dword_1ABB13000, v19, OS_LOG_TYPE_INFO, "SoftBank: Using SoftBank string transform.", v39, 2u);
      }

      v20 = obja;
      v21 = obja;
    }
    else
    {
      MFLogGeneral();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v39 = 0;
        _os_log_impl(&dword_1ABB13000, v22, OS_LOG_TYPE_INFO, "SoftBank: Not using SoftBank string transform.", v39, 2u);
      }

      +[MFStringTransform identityTransform](MFStringTransform, "identityTransform");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
    }
    v23 = v20 == 0;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v21);
    if (v23)

    objc_storeStrong((id *)&sSoftBankTransform, *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  }
}

void sub_1ABB2DA6C(_Unwind_Exception *a1)
{

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1ABB2DFD4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB2E07C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB2E1C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB2E2DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB2E324(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB2E38C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB2E588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  void *v8;
  void *v9;
  void *v10;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_1ABB2E65C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB2E6AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB2E700(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB2E7AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB2E860(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB2E9A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB2EA7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB2EB30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABB2ECA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABB2ED98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB2EE7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void __computeHasEncryptedDescendant_block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  id v7;
  char v8;

  v5 = a2;
  v6 = v5;
  if (*(id *)(a1 + 32) != v5)
  {
    objc_msgSend(v5, "decodeIfNecessary");
    v8 = 0;
    v7 = (id)objc_msgSend(v6, "decryptedMessageBodyIsEncrypted:isSigned:", &v8, 0);
    if (v8)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      *a3 = 1;
    }
  }

}

void sub_1ABB2EFA4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB2F528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

id __keyboardsUpdated()
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "synchronize");

  return +[MFMimeCharset allMimeCharsets:](MFMimeCharset, "allMimeCharsets:", 1);
}

void sub_1ABB2F68C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB2F768(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB2F7CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB2FA68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB2FABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABB2FB48(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB2FC40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB2FE00(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB300C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

uint64_t _indexOfEncodingInCharsets(unsigned int a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  if (objc_msgSend(v3, "count") && (v4 = objc_msgSend(v3, "count")) != 0)
  {
    v5 = 0;
    v6 = a1;
    while (1)
    {
      objc_msgSend(v3, "objectAtIndex:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "encoding");

      if (v8 == v6)
        break;
      if (v4 == ++v5)
        goto LABEL_6;
    }
  }
  else
  {
LABEL_6:
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

void sub_1ABB301F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB3027C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id _convertKeyboardsArrayToLanguages(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  id v14;
  id obj;
  id v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v13 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v13;
  v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v1)
  {
    v17 = *(_QWORD *)v20;
    v2 = *MEMORY[0x1E0C997E8];
    v3 = *MEMORY[0x1E0C99820];
    do
    {
      v18 = v1;
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(obj);
        objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", v2);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", v3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v9 = v8;
        if (v6)
          objc_msgSend(v8, "setObject:forKey:", v6, v2);
        if (v7)
          objc_msgSend(v9, "setObject:forKey:", v7, v3);
        objc_msgSend(MEMORY[0x1E0C99DC8], "localeIdentifierFromComponents:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLocaleIdentifierFromString:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 && (objc_msgSend(v16, "containsObject:", v11) & 1) == 0)
        {
          objc_msgSend(v14, "addObject:", v11);
          objc_msgSend(v16, "addObject:", v11);
        }

      }
      v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v1);
  }

  return v14;
}

void sub_1ABB304CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{

  _Unwind_Resume(a1);
}

void ___copyEncodingsForLocaleIdentifier_block_invoke()
{
  void *v0;
  __CFArray *Mutable;
  __CFArray *v2;
  __CFArray *v3;
  __CFArray *v4;
  __CFArray *v5;
  __CFArray *v6;
  __CFArray *v7;
  __CFArray *v8;
  __CFArray *v9;
  __CFArray *v10;
  __CFArray *v11;
  __CFArray *v12;
  uint64_t v13;
  void *v14;

  v0 = (void *)objc_opt_new();
  Mutable = CFArrayCreateMutable(0, 0, 0);
  v2 = Mutable;
  if (Mutable)
  {
    CFArrayAppendValue(Mutable, (const void *)0x820);
    CFArrayAppendValue(v2, (const void *)0x420);
    objc_msgSend(v0, "setObject:forKey:", v2, CFSTR("ja"));
    CFRelease(v2);
  }
  v3 = CFArrayCreateMutable(0, 0, 0);
  v4 = v3;
  if (v3)
  {
    CFArrayAppendValue(v3, (const void *)0x930);
    CFArrayAppendValue(v4, (const void *)0x830);
    CFArrayAppendValue(v4, (const void *)0xA05);
    objc_msgSend(v0, "setObject:forKey:", v4, CFSTR("zh-Hans"));
    CFRelease(v4);
  }
  v5 = CFArrayCreateMutable(0, 0, 0);
  v6 = v5;
  if (v5)
  {
    CFArrayAppendValue(v5, (const void *)0xA03);
    CFArrayAppendValue(v6, (const void *)0xA06);
    CFArrayAppendValue(v6, (const void *)0x930);
    objc_msgSend(v0, "setObject:forKey:", v6, CFSTR("zh-Hant"));
    CFRelease(v6);
  }
  v7 = CFArrayCreateMutable(0, 0, 0);
  v8 = v7;
  if (v7)
  {
    CFArrayAppendValue(v7, (const void *)0x632);
    CFArrayAppendValue(v8, (const void *)0x421);
    objc_msgSend(v0, "setObject:forKey:", v8, CFSTR("zh"));
    CFRelease(v8);
  }
  v9 = CFArrayCreateMutable(0, 0, 0);
  v10 = v9;
  if (v9)
  {
    CFArrayAppendValue(v9, (const void *)0x940);
    objc_msgSend(v0, "setObject:forKey:", v10, CFSTR("ko"));
    CFRelease(v10);
  }
  v11 = CFArrayCreateMutable(0, 0, 0);
  v12 = v11;
  if (v11)
  {
    CFArrayAppendValue(v11, (const void *)0xA02);
    CFArrayAppendValue(v12, (const void *)0x205);
    CFArrayAppendValue(v12, (const void *)0x502);
    objc_msgSend(v0, "setObject:forKey:", v12, CFSTR("ru"));
    CFRelease(v12);
  }
  v13 = objc_msgSend(v0, "copy");

  v14 = (void *)_copyEncodingsForLocaleIdentifier_regionEncodingMapping;
  _copyEncodingsForLocaleIdentifier_regionEncodingMapping = v13;

}

void sub_1ABB30780(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB30820(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id _EnDecodeData(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  MFDataConsumerConsumeCompleteData(v6, v7);
  objc_msgSend(v6, "done");
  objc_msgSend(v5, "done");
  objc_msgSend(v5, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void sub_1ABB308B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id _decodeBase64Data(void *a1, uint64_t a2, _QWORD *a3)
{
  id v5;
  MFBufferedDataConsumer *v6;
  MFBase64Decoder *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = a1;
  v6 = objc_alloc_init(MFBufferedDataConsumer);
  v7 = -[MFBaseFilterDataConsumer initWithConsumer:]([MFBase64Decoder alloc], "initWithConsumer:", v6);
  -[MFBase64Decoder setConvertCommas:](v7, "setConvertCommas:", a2);
  if (a3)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(objc_retainAutorelease(v5), "bytes") + *a3, a3[1], 0);
    -[MFBase64Decoder setIsBound:](v7, "setIsBound:", 1);
  }
  else
  {
    v8 = 0;
  }
  if (v8)
    v9 = v8;
  else
    v9 = v5;
  MFDataConsumerConsumeCompleteData(v7, v9);
  -[MFBase64Decoder done](v7, "done");
  -[MFBufferedDataConsumer done](v6, "done");
  if (a3)
  {
    v10 = a3[1];
    a3[1] = v10 - -[MFBase64Decoder unconverted](v7, "unconverted");
  }
  -[MFBufferedDataConsumer data](v6, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void sub_1ABB309F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id _encodeBase64Data(void *a1, int a2, uint64_t a3, uint64_t a4)
{
  id v7;
  MFBufferedDataConsumer *v8;
  MFBase64Encoder *v9;
  MFBase64Encoder *v10;
  void *v11;

  v7 = a1;
  v8 = objc_alloc_init(MFBufferedDataConsumer);
  v9 = -[MFBaseFilterDataConsumer initWithConsumer:]([MFBase64Encoder alloc], "initWithConsumer:", v8);
  v10 = v9;
  if (a2)
    -[MFBase64Encoder setStandardLineBreak](v9, "setStandardLineBreak");
  -[MFBase64Encoder setAllowSlash:](v10, "setAllowSlash:", a3);
  if ((_DWORD)a4 != 61)
    -[MFBase64Encoder setPadChar:](v10, "setPadChar:", a4);
  _EnDecodeData(v8, v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void sub_1ABB30B08(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB31630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, void *a19, void *a20)
{
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_1ABB31D5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1ABB31E90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB326C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24)
{

  _Unwind_Resume(a1);
}

void sub_1ABB32D74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, void *a13)
{

  _Unwind_Resume(a1);
}

void *_UniqueString(__CFString *a1)
{
  void *v2;
  CFStringEncoding SystemEncoding;
  const char *CStringPtr;
  const char *v5;
  uint64_t v6;
  unsigned int v7;
  int v8;
  __int128 v9;
  CFIndex Length;
  CFIndex v11;
  CFIndex v12;
  CFIndex v13;
  CFStringRef v14;
  UInt8 *v15;
  CFIndex v16;
  CFIndex v17;
  __CFString *v18;
  void *inserted;
  CFIndex v21;
  char cStr[16];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  CFRange v31;
  CFRange v32;
  CFRange v33;

  v30 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)sFore, "lock");
  v2 = NSHashGet((NSHashTable *)sStringsCache, a1);
  objc_msgSend((id)sFore, "unlock");
  if (v2)
    return v2;
  SystemEncoding = CFStringGetSystemEncoding();
  CStringPtr = CFStringGetCStringPtr(a1, SystemEncoding);
  if (CStringPtr)
  {
    v5 = CStringPtr;
    v6 = MEMORY[0x1E0C80978];
    while (1)
    {
      v7 = *v5;
      if (!*v5)
        break;
      if ((v7 & 0x80000000) != 0)
        v8 = __maskrune(v7, 0x8000uLL);
      else
        v8 = *(_DWORD *)(v6 + 4 * v7 + 60) & 0x8000;
      ++v5;
      if (v8)
        goto LABEL_10;
    }
    v14 = a1;
  }
  else
  {
LABEL_10:
    *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v28 = v9;
    v29 = v9;
    v26 = v9;
    v27 = v9;
    v24 = v9;
    v25 = v9;
    *(_OWORD *)cStr = v9;
    v23 = v9;
    v21 = 0xAAAAAAAAAAAAAAAALL;
    Length = CFStringGetLength(a1);
    v31.location = 0;
    v31.length = Length;
    if (Length == MFStringGetBytes(a1, v31, SystemEncoding, 0x3Fu, 0, (UInt8 *)cStr, 127, &v21))
    {
      v11 = v21;
      cStr[v21] = 0;
      v12 = v11 - 1;
      v21 = v11 - 1;
      if (v11)
      {
        do
        {
          cStr[v12] = __tolower(cStr[v12]);
          v13 = v21;
          v12 = --v21;
        }
        while (v13);
      }
      v14 = CFStringCreateWithCString(0, cStr, SystemEncoding);
    }
    else
    {
      v32.location = 0;
      v32.length = Length;
      MFStringGetBytes(a1, v32, SystemEncoding, 0x3Fu, 0, 0, 0, &v21);
      v15 = (UInt8 *)malloc_type_malloc(v21 + 1, 0xBB2FFE80uLL);
      v33.location = 0;
      v33.length = Length;
      MFStringGetBytes(a1, v33, SystemEncoding, 0x3Fu, 0, v15, v21, 0);
      v15[v21] = 0;
      while (1)
      {
        v16 = v21;
        v17 = --v21;
        if (!v16)
          break;
        v15[v17] = __tolower(v15[v17]);
      }
      v14 = CFStringCreateWithCStringNoCopy(0, (const char *)v15, SystemEncoding, 0);
    }
  }
  v18 = (__CFString *)v14;
  if (!v14)
    return 0;
  objc_msgSend((id)sFore, "lock");
  inserted = NSHashInsertIfAbsent((NSHashTable *)sStringsCache, v18);
  objc_msgSend((id)sFore, "unlock");
  if (inserted)
    v2 = inserted;
  else
    v2 = v18;

  return v2;
}

uint64_t _UniquingDescribe(uint64_t a1, uint64_t a2)
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p>"), NSStringFromClass(v4), a2);
}

void *_MFSetValueInDictionary(void *a1, void **a2, uint64_t a3, uint64_t a4)
{
  void *result;

  result = *a2;
  if (a4)
  {
    if (!result)
    {
      result = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E08], "allocWithZone:", objc_msgSend(a1, "zone")), "initWithCapacity:", 3);
      *a2 = result;
    }
    return (void *)objc_msgSend(result, "setObject:forKey:", a4, a3);
  }
  else if (result)
  {
    return (void *)objc_msgSend(result, "removeObjectForKey:", a3);
  }
  return result;
}

void sub_1ABB332B4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1ABB33344(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void setParent(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = +[MFWeakReferenceHolder weakReferenceWithObject:](MFWeakReferenceHolder, "weakReferenceWithObject:", a2);
  v6 = *(id *)(a1 + 64);
  *(_QWORD *)(a1 + 64) = v4;
  v5 = *(_QWORD *)(a1 + 96);
  if (v5 != objc_msgSend(a2, "partURL"))
  {

    *(_QWORD *)(a1 + 96) = (id)objc_msgSend(a2, "partURL");
  }

}

void sub_1ABB342B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _appendToDescriptionWithIndent(uint64_t a1, void *a2, unsigned int a3)
{
  void *v6;
  __CFString *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  void *v15;
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
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t result;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
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
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend((id)a1, "bodyParameterKeys");
  if (a3)
  {
    v7 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", objc_msgSend(CFSTR("|   "), "length") * a3);
    v8 = a3;
    do
    {
      -[__CFString appendString:](v7, "appendString:", CFSTR("|   "));
      --v8;
    }
    while (v8);
  }
  else
  {
    v7 = &stru_1E5AA1FC8;
  }
  objc_msgSend(a2, "appendFormat:", CFSTR("\n%@<%@:%p>"), v7, objc_opt_class(), a1);
  if (!-[__CFString length](v7, "length"))
    objc_msgSend(a2, "appendFormat:", CFSTR(" (mimeBody=<%@:%p>)"), objc_opt_class(), objc_msgSend((id)a1, "mimeBody"));
  objc_msgSend(a2, "appendString:", CFSTR("\n"));
  if (*(_QWORD *)(a1 + 8) || *(_QWORD *)(a1 + 16) || objc_msgSend(v6, "count"))
  {
    objc_msgSend(a2, "appendString:", v7);
    objc_msgSend(a2, "appendString:", CFSTR("Content-Type: "));
    if (*(_QWORD *)(a1 + 8))
      objc_msgSend(a2, "appendString:");
    objc_msgSend(a2, "appendString:", CFSTR("/"));
    if (*(_QWORD *)(a1 + 16))
      objc_msgSend(a2, "appendString:");
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v47;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v47 != v11)
            objc_enumerationMutation(v6);
          objc_msgSend(a2, "appendFormat:", CFSTR(";\n%@    %@=%@"),
            v7,
            *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v12),
            objc_msgSend((id)a1, "bodyParameterForKey:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v12)));
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      }
      while (v10);
    }
    objc_msgSend(a2, "appendString:", CFSTR("\n"));
  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(a2, "appendString:", v7);
    objc_msgSend(a2, "appendString:", CFSTR("Content-Transfer-Encoding: "));
    objc_msgSend(a2, "appendString:", *(_QWORD *)(a1 + 32));
    objc_msgSend(a2, "appendString:", CFSTR("\n"));
  }
  v13 = (const __CFString *)objc_msgSend((id)a1, "disposition");
  v14 = (void *)objc_msgSend((id)a1, "dispositionParameterKeys");
  v15 = v14;
  if (v13)
  {
    objc_msgSend(a2, "appendString:", v7);
    objc_msgSend(a2, "appendString:", CFSTR("Content-Disposition: "));
  }
  else
  {
    if (!objc_msgSend(v14, "count"))
      goto LABEL_37;
    objc_msgSend(a2, "appendString:", v7);
    v13 = CFSTR("Content-Disposition: ");
  }
  objc_msgSend(a2, "appendString:", v13);
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v43;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v43 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(a2, "appendFormat:", CFSTR(";\n%@    %@=%@"),
          v7,
          *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v19),
          objc_msgSend((id)a1, "dispositionParameterForKey:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v19)));
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    }
    while (v17);
  }
  objc_msgSend(a2, "appendString:", CFSTR("\n"));
LABEL_37:
  v20 = objc_msgSend((id)a1, "contentDescription");
  if (v20)
  {
    v21 = v20;
    objc_msgSend(a2, "appendString:", v7);
    objc_msgSend(a2, "appendString:", CFSTR("Content-Description: "));
    objc_msgSend(a2, "appendString:", v21);
    objc_msgSend(a2, "appendString:", CFSTR("\n"));
  }
  v22 = objc_msgSend((id)a1, "contentID");
  if (v22)
  {
    v23 = v22;
    objc_msgSend(a2, "appendString:", v7);
    objc_msgSend(a2, "appendString:", CFSTR("Content-ID: "));
    objc_msgSend(a2, "appendString:", v23);
    objc_msgSend(a2, "appendString:", CFSTR("\n"));
  }
  v24 = objc_msgSend((id)a1, "contentLocation");
  if (v24)
  {
    v25 = v24;
    objc_msgSend(a2, "appendString:", v7);
    objc_msgSend(a2, "appendString:", CFSTR("Content-Location: "));
    objc_msgSend(a2, "appendString:", v25);
    objc_msgSend(a2, "appendString:", CFSTR("\n"));
  }
  v26 = objc_msgSend((id)a1, "languages");
  if (v26)
  {
    v27 = (void *)v26;
    objc_msgSend(a2, "appendString:", v7);
    objc_msgSend(a2, "appendString:", CFSTR("Content-Language: "));
    objc_msgSend(a2, "appendString:", objc_msgSend(v27, "componentsJoinedByString:", CFSTR(" ")));
    objc_msgSend(a2, "appendString:", CFSTR("\n"));
  }
  v28 = *(_QWORD *)(a1 + 56);
  if (*(_QWORD *)(a1 + 48) == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v28)
      objc_msgSend(a2, "appendFormat:", CFSTR("%@X-Content-Length: %lu\n"), v7, v28, v37);
  }
  else
  {
    objc_msgSend(a2, "appendFormat:", CFSTR("%@X-Content-Range: %lu/%lu\n"), v7, *(_QWORD *)(a1 + 48), v28);
  }
  v29 = (void *)objc_msgSend((id)a1, "_objectInOtherIvarsForKey:", CFSTR("x-signed-data"));
  if (v29)
    objc_msgSend(a2, "appendFormat:", CFSTR("%@X-Signed-Part: %lu bytes @ %p\n"), v7, objc_msgSend(v29, "length"), objc_msgSend(v29, "bytes"));
  v30 = objc_msgSend((id)a1, "partNumber");
  if (v30)
    objc_msgSend(a2, "appendFormat:", CFSTR("%@X-IMAP-Part-Number: %@\n"), v7, v30);
  if ((objc_msgSend(*(id *)(a1 + 8), "isEqualToString:", CFSTR("multipart")) & 1) != 0
    || (result = objc_msgSend(*(id *)(a1 + 8), "isEqualToString:", CFSTR("message")), (_DWORD)result)
    && (result = objc_msgSend(*(id *)(a1 + 16), "isEqualToString:", CFSTR("rfc822")), (_DWORD)result))
  {
    v32 = (void *)objc_msgSend((id)a1, "subparts");
    objc_msgSend(a2, "appendFormat:", CFSTR("%@X-Subpart-Count: %lu\n"), v7, objc_msgSend(v32, "count"));
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    result = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    if (result)
    {
      v33 = result;
      v34 = a3 + 1;
      v35 = *(_QWORD *)v39;
      do
      {
        v36 = 0;
        do
        {
          if (*(_QWORD *)v39 != v35)
            objc_enumerationMutation(v32);
          _appendToDescriptionWithIndent(*(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v36++), a2, v34);
        }
        while (v33 != v36);
        result = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
        v33 = result;
      }
      while (result);
    }
  }
  return result;
}

const __CFString *_getFilenameEncodingHint(id *a1)
{
  const __CFString *SomeCharsetFromPartTree;
  const __CFString *v3;
  NSObject *v4;

  SomeCharsetFromPartTree = (const __CFString *)_getSomeCharsetFromPartTree(a1);
  if (SomeCharsetFromPartTree)
    v3 = SomeCharsetFromPartTree;
  else
    v3 = CFSTR("windows-1252");
  v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    _getFilenameEncodingHint_cold_1((uint64_t)a1, (uint64_t)v3, v4);
  return v3;
}

void *_getSomeCharsetFromPartTree(id *a1)
{
  id v2;
  id *v3;
  uint64_t v4;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t i;

  v2 = objc_allocWithZone(MEMORY[0x1E0C99DE8]);
  v3 = a1;
  v4 = objc_msgSend(a1[8], "retainedReference");
  if (v4)
  {
    do
    {
      v5 = (id *)v4;

      v4 = objc_msgSend(v5[8], "retainedReference");
      v3 = v5;
    }
    while (v4);
  }
  else
  {
    v5 = v3;
  }
  v6 = (void *)objc_msgSend(v2, "initWithObjects:", v5, 0);
  while (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_msgSend(v6, "objectAtIndex:", 0);
    if (objc_msgSend((id)objc_msgSend(v7, "type"), "isEqualToString:", CFSTR("text")))
    {
      v8 = (void *)objc_msgSend(v7, "bodyParameterForKey:", CFSTR("charset"));
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("us-ascii")))
        v8 = 0;
    }
    else
    {
      for (i = objc_msgSend(v7, "firstChildPart"); ; i = objc_msgSend(v8, "nextSiblingPart"))
      {
        v8 = (void *)i;
        if (!i)
          break;
        objc_msgSend(v6, "addObject:", i);
      }
    }
    objc_msgSend(v6, "removeObjectAtIndex:", 0);
    if (v8)
      goto LABEL_16;
  }
  v8 = 0;
LABEL_16:

  return v8;
}

uint64_t _getApproximateRawSize(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (((objc_msgSend(*(id *)(a1 + 8), "isEqualToString:", CFSTR("multipart")) & 1) != 0
     || objc_msgSend(*(id *)(a1 + 8), "isEqualToString:", CFSTR("message"))
     && objc_msgSend(*(id *)(a1 + 16), "isEqualToString:", CFSTR("rfc822")))
    && (!objc_msgSend(*(id *)(a1 + 8), "isEqualToString:", CFSTR("message"))
     || !objc_msgSend(*(id *)(a1 + 16), "isEqualToString:", CFSTR("rfc822"))))
  {
    v2 = 0;
  }
  else
  {
    v2 = *(unsigned int *)(a1 + 56);
  }
  v3 = objc_msgSend((id)a1, "firstChildPart");
  if (v3)
  {
    v4 = (void *)v3;
    do
    {
      v2 = _getApproximateRawSize(v4) + v2;
      v4 = (void *)objc_msgSend(v4, "nextSiblingPart");
    }
    while (v4);
  }
  return v2;
}

CFMutableStringRef _copyNextMimeToken(unsigned int *a1, uint64_t a2, int a3)
{
  unsigned __int8 *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  CFMutableStringRef v10;
  int v11;
  char *v12;
  UInt8 *v13;
  uint64_t v14;
  char v15;
  unsigned __int8 *v16;
  int64_t v17;
  unsigned __int8 *v18;
  int v19;
  char *v21;
  unsigned __int8 *v22;
  __CFData *Mutable;
  const __CFData *v24;
  CFIndex Length;
  size_t v26;
  unsigned int v27;
  UInt8 *BytePtr;
  id v29;
  void *v30;
  BOOL v31;
  unsigned __int8 *v32;
  UInt8 bytes;
  CFRange v35;

  v7 = *(char **)a1;
  v6 = (unsigned __int8 *)*((_QWORD *)a1 + 1);
  v8 = MEMORY[0x1E0C80978];
  while (v7 < (char *)v6)
  {
    v9 = *v7;
    if (*v7 < 0)
    {
      if (!__maskrune(v9, 0x4000uLL))
      {
LABEL_8:
        v7 = *(char **)a1;
        v6 = (unsigned __int8 *)*((_QWORD *)a1 + 1);
        break;
      }
    }
    else if ((*(_DWORD *)(v8 + 4 * v9 + 60) & 0x4000) == 0)
    {
      goto LABEL_8;
    }
    *(_QWORD *)a1 = ++v7;
    v6 = (unsigned __int8 *)*((_QWORD *)a1 + 1);
  }
  if (v7 < (char *)v6)
  {
    v10 = 0;
    v11 = 0;
    while (1)
    {
      v12 = *(char **)a1;
      v13 = (UInt8 *)(*(_QWORD *)a1 + 1);
      v14 = **(unsigned __int8 **)a1;
      bytes = 0;
      *(_QWORD *)a1 = v13;
      if (v11 == 2)
      {
        if ((int)v14 <= 33)
        {
          if ((_DWORD)v14 != 10 && (_DWORD)v14 != 13)
            goto LABEL_58;
          v15 = 0;
          v19 = 2;
          goto LABEL_35;
        }
        if ((_DWORD)v14 != 34)
        {
          if ((_DWORD)v14 != 92)
            goto LABEL_58;
LABEL_42:
          if ((unint64_t)v13 >= *((_QWORD *)a1 + 1))
          {
            LODWORD(v14) = 0;
          }
          else
          {
            LODWORD(v14) = *v13;
            bytes = *v13;
          }
          *(_QWORD *)a1 = v12 + 2;
          goto LABEL_59;
        }
        v11 = 0;
        v15 = 1;
      }
      else if (v11 == 1)
      {
        if ((_DWORD)v14 == 41)
        {
          v15 = 0;
          v11 = 0;
        }
        else
        {
          if ((_DWORD)v14 == 92)
          {
            v15 = 0;
            *(_QWORD *)a1 = v12 + 2;
LABEL_34:
            v19 = 1;
LABEL_35:
            if (*(_QWORD *)a1 >= *((_QWORD *)a1 + 1))
              v11 = 3;
            else
              v11 = v19;
            if ((v15 & 1) != 0)
              goto LABEL_65;
            goto LABEL_64;
          }
          v15 = 0;
          v11 = 1;
        }
      }
      else
      {
        v15 = 1;
        if ((_DWORD)v14 != 34)
        {
          if ((_DWORD)v14 == 40)
            goto LABEL_34;
          if ((_DWORD)v14 == 92)
            goto LABEL_42;
          if ((v14 & 0x80) != 0)
          {
            if (__maskrune(v14, 0x4000uLL))
              goto LABEL_55;
LABEL_58:
            bytes = v14;
LABEL_59:
            v21 = *(char **)a1;
            v22 = (unsigned __int8 *)*((_QWORD *)a1 + 1);
            if (*(_QWORD *)a1 >= (unint64_t)v22)
              v11 = 3;
            if ((_DWORD)v14)
            {
              Mutable = (__CFData *)*((_QWORD *)a1 + 3);
              if (Mutable
                || (v31 = v22 >= (unsigned __int8 *)v21, v32 = (unsigned __int8 *)(v22 - (unsigned __int8 *)v21), v31)
                && (Mutable = CFDataCreateMutable(0, (CFIndex)(v32 + 1)), (*((_QWORD *)a1 + 3) = Mutable) != 0))
              {
                CFDataAppendBytes(Mutable, &bytes, 1);
              }
            }
            goto LABEL_64;
          }
          if (((*(unsigned __int8 *)(a2 + ((unint64_t)v14 >> 3)) >> (v14 & 7)) & 1) == 0)
          {
            if ((*(_DWORD *)(v8 + 4 * v14 + 60) & 0x4000) == 0)
              goto LABEL_58;
LABEL_55:
            LODWORD(v14) = bytes;
            goto LABEL_59;
          }
          v16 = (unsigned __int8 *)*((_QWORD *)a1 + 1);
          if (v13 < v16)
          {
            v17 = v16 - v13;
            v18 = (unsigned __int8 *)(v12 + 2);
            while (((char)*(v18 - 1) & 0x80000000) == 0
                 && ((*(unsigned __int8 *)(a2 + ((unint64_t)*(v18 - 1) >> 3)) >> (*(v18 - 1) & 7)) & 1) != 0)
            {
              v15 = 0;
              *(_QWORD *)a1 = v18++;
              v19 = 3;
              if (!--v17)
                goto LABEL_35;
            }
          }
          v15 = 0;
          v19 = 3;
          goto LABEL_35;
        }
        v11 = 2;
      }
      if ((unint64_t)v13 >= *((_QWORD *)a1 + 1))
        v11 = 3;
      if ((v15 & 1) != 0)
      {
LABEL_65:
        v24 = (const __CFData *)*((_QWORD *)a1 + 3);
        if (!v24)
          goto LABEL_74;
        Length = CFDataGetLength(v24);
        if (Length < 1)
          goto LABEL_74;
        v26 = Length;
        if (a3)
        {
          v27 = a1[4];
          BytePtr = (UInt8 *)CFDataGetBytePtr(*((CFDataRef *)a1 + 3));
          v29 = _MFCreateStringFromHeaderBytes(v27, BytePtr, v26);
        }
        else
        {
          v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", CFDataGetBytePtr(*((CFDataRef *)a1 + 3)), Length, 4);
        }
        v30 = v29;
        if (v10)
        {
          if (v29)
            goto LABEL_72;
        }
        else
        {
          v10 = CFStringCreateMutable(0, 0);
          if (v30)
          {
LABEL_72:
            -[__CFString appendString:](v10, "appendString:", v30);

          }
        }
        v35.location = 0;
        v35.length = v26;
        CFDataDeleteBytes(*((CFMutableDataRef *)a1 + 3), v35);
        goto LABEL_74;
      }
LABEL_64:
      if (v11 == 3)
        goto LABEL_65;
LABEL_74:
      if (v11 == 3)
        return v10;
    }
  }
  return 0;
}

BOOL _scanMimeKeyValuePair(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  CFMutableStringRef MimeToken;
  CFMutableStringRef v7;
  CFMutableStringRef v8;
  _BOOL8 v9;

  if (*(_QWORD *)a1 >= *(_QWORD *)(a1 + 8))
    return 0;
  MimeToken = _copyNextMimeToken((unsigned int *)a1, (uint64_t)&EQUALS_SEPARATOR_MASK, 1);
  if (!MimeToken)
    return 0;
  v7 = MimeToken;
  v8 = _copyNextMimeToken((unsigned int *)a1, (uint64_t)&SPACE_SEMICOLON_COMMA_SEPARATOR_MASK, 0);
  v9 = v8 != 0;
  if (v8)
  {
    if (a2)
      *a2 = v7;
    if (a3)
      *a3 = v8;
  }

  return v9;
}

void sub_1ABB37544(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, CFStringEncoding a10, uint64_t a11, __int128 buf)
{
  void *v12;
  id v13;
  __CFString *v14;
  NSObject *v15;

  if (a2 == 1)
  {
    v13 = objc_begin_catch(a1);
    a10 = -1431655766;
    v14 = _MFCopyDecodeText(v12, &a10);
    v15 = MFLogGeneral();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v13;
      _os_log_impl(&dword_1ABB13000, v15, OS_LOG_TYPE_INFO, "*** Exception %@ was raised while decoding mime message part. Displaying as text/plain.", (uint8_t *)&buf, 0xCu);
    }
    objc_end_catch();
    JUMPOUT(0x1ABB374D0);
  }
  _Unwind_Resume(a1);
}

void sub_1ABB37600()
{
  objc_end_catch();
  JUMPOUT(0x1ABB3756CLL);
}

void *_createAttachment(void *a1)
{
  void *v2;

  v2 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "attachmentClass"), "allocWithZone:", objc_msgSend(a1, "zone")), "initWithMimePart:", a1);
  objc_msgSend(a1, "configureFileWrapper:", objc_msgSend(v2, "fileWrapperForcingDownload:", 0));
  return v2;
}

BOOL _isCalendar(void *a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  _BOOL8 result;

  v2 = (void *)objc_msgSend(a1, "type");
  v3 = objc_msgSend(a1, "subtype");
  v4 = objc_msgSend(v2, "isEqualToString:", CFSTR("text"));
  result = 0;
  if (v4)
  {
    if (v3)
      return objc_msgSend(CFSTR("calendar"), "caseInsensitiveCompare:", v3) == 0;
  }
  return result;
}

__CFString *_MFDecodeText(void *a1, CFStringEncoding *a2)
{
  return _MFCopyDecodeText(a1, a2);
}

void _getAttachmentsAndAddToCount(void *a1, _DWORD *a2, void *a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  id Attachment;

  v6 = (void *)objc_msgSend(a1, "type");
  v7 = (void *)objc_msgSend(a1, "subtype");
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("multipart")))
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("message"))
      && objc_msgSend(v7, "isEqualToString:", CFSTR("rfc822")))
    {
      _getAttachmentsAndAddToCount(objc_msgSend(a1, "firstChildPart"), a2, a3);
    }
    goto LABEL_13;
  }
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("x-folder")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("appledouble")) & 1) != 0)
  {
LABEL_14:
    if (a2)
      ++*a2;
    if (a3)
    {
      Attachment = _createAttachment(a1);
      objc_msgSend(a3, "addObject:", Attachment);

    }
    return;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("alternative")) && objc_msgSend(a1, "firstChildPart"))
  {
    v8 = objc_msgSend(a1, "firstChildPart");
    if (v8)
    {
      v9 = (void *)v8;
      do
      {
        _getAttachmentsAndAddToCount(v9, a2, a3);
        v9 = (void *)objc_msgSend(v9, "nextSiblingPart");
      }
      while (v9);
    }
    return;
  }
  v10 = objc_msgSend(a1, "firstChildPart");
  if (!v10)
    goto LABEL_13;
  v11 = (void *)v10;
  v12 = 0;
  do
  {
    if (!objc_msgSend(a1, "hasValidMultipartSignedContentType")
      || objc_msgSend(CFSTR("application"), "mf_caseInsensitiveCompareExcludingXDash:", objc_msgSend(v11, "type"))
      || objc_msgSend(CFSTR("pkcs7-signature"), "mf_caseInsensitiveCompareExcludingXDash:", objc_msgSend(v11, "subtype")))
    {
      _getAttachmentsAndAddToCount(v11, a2, a3);
      v12 = 1;
    }
    v11 = (void *)objc_msgSend(v11, "nextSiblingPart");
  }
  while (v11);
  if ((v12 & 1) == 0)
  {
LABEL_13:
    if (!objc_msgSend(a1, "isAttachment"))
      return;
    goto LABEL_14;
  }
}

BOOL MFMimePartParseContentTypeHeader(_QWORD *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  CFMutableStringRef MimeToken;
  CFMutableStringRef v7;
  int v8;
  const __CFString *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  BOOL v14;
  __CFString *v16;
  id v17;
  _QWORD v18[2];
  int v19;
  int v20;
  id v21;

  if (!a5)
    return 0;
  v18[0] = a3 + a4;
  v18[1] = a3 + a4 + a5;
  v20 = -1431655766;
  v21 = 0;
  v19 = a2;
  MimeToken = _copyNextMimeToken((unsigned int *)v18, (uint64_t)&SLASH_SEPARATOR_MASK, 1);
  v7 = _copyNextMimeToken((unsigned int *)v18, (uint64_t)&SPACE_SEMICOLON_COMMA_SEPARATOR_MASK, 1);
  v16 = (__CFString *)0xAAAAAAAAAAAAAAAALL;
  v17 = (id)0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(a1, "setType:", MimeToken);
  objc_msgSend(a1, "setSubtype:", v7);

  while (_scanMimeKeyValuePair((uint64_t)v18, &v17, &v16))
  {
    if (objc_msgSend((id)objc_msgSend(a1, "type"), "isEqualToString:", CFSTR("text"))
      && (objc_msgSend((id)objc_msgSend(a1, "subtype"), "isEqualToString:", CFSTR("html")) & 1) != 0)
    {
      goto LABEL_13;
    }
    v8 = objc_msgSend(CFSTR("charset"), "isEqualToString:", objc_msgSend(v17, "lowercaseString"));
    v9 = v16;
    if (!v8)
      goto LABEL_14;
    v10 = (void *)-[__CFString lowercaseString](v16, "lowercaseString");
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("iso-8859-8-i")))
    {
      v11 = v17;
      v12 = a1;
      v9 = CFSTR("ISO-8859-8");
    }
    else
    {
      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("iso-8859-6-i")))
      {
        if ((objc_msgSend(v10, "isEqualToString:", CFSTR("iso-8859-8")) & 1) != 0
          || objc_msgSend(v10, "isEqualToString:", CFSTR("iso-8859-6")))
        {
          objc_msgSend(a1, "_setObjectInOtherIvars:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("x-encoding-is-visual"));
        }
LABEL_13:
        v9 = v16;
LABEL_14:
        v11 = v17;
        v12 = a1;
        goto LABEL_15;
      }
      v11 = v17;
      v12 = a1;
      v9 = CFSTR("ISO-8859-6");
    }
LABEL_15:
    objc_msgSend(v12, "setBodyParameter:forKey:", v9, v11);

  }
  v13 = (void *)a1[3];
  if (v13)
    objc_msgSend(v13, "mf_fixupRFC2231Values");
  if (v21)

  if (MimeToken)
    v14 = v7 == 0;
  else
    v14 = 1;
  return !v14;
}

uint64_t MFMimePartSetValueForPreservedHeader(void *a1, uint64_t a2, __CFString *a3)
{
  return objc_msgSend(a1, "_setObjectInOtherIvars:forKey:", a2, _UniqueString(a3));
}

void MFMimePartParseContentDispositionHeader(void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  CFMutableStringRef MimeToken;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[2];
  int v11;
  int v12;
  id v13;

  if (a5)
  {
    v10[0] = a3 + a4;
    v10[1] = a3 + a4 + a5;
    v12 = -1431655766;
    v13 = 0;
    v11 = a2;
    MimeToken = _copyNextMimeToken((unsigned int *)v10, (uint64_t)&SPACE_SEMICOLON_COMMA_SEPARATOR_MASK, 1);
    v8 = (id)0xAAAAAAAAAAAAAAAALL;
    v9 = (id)0xAAAAAAAAAAAAAAAALL;
    objc_msgSend(a1, "setDisposition:", MimeToken);

    while (_scanMimeKeyValuePair((uint64_t)v10, &v9, &v8))
    {
      objc_msgSend(a1, "setDispositionParameter:forKey:", v8, v9);

    }
    v7 = (void *)objc_msgSend(a1, "_objectInOtherIvarsForKey:", CFSTR("x-disposition-parameters"));
    if (v7)
      objc_msgSend(v7, "mf_fixupRFC2231Values");
    if (v13)

  }
}

void *_parseUuencodedParts(void *a1, int a2, void *a3, unint64_t a4, size_t a5)
{
  void *v7;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __CFString *v20;
  __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  void *v27;
  void *v28;
  size_t v29;
  size_t v30;
  void *v33;
  const char *v34;
  void *v35;
  size_t v36;
  CFStringEncoding encoding;

  v7 = a3;
  v9 = (const char *)objc_msgSend(a3, "bytes");
  v10 = v9;
  if (a5 >= 7 && strncasecmp(v9, "begin ", 6uLL) && !strnstr(v10, "\nbegin ", a5))
    return 0;
  if (_parseUuencodedParts_onceToken != -1)
    dispatch_once(&_parseUuencodedParts_onceToken, &__block_literal_global_568);
  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v10, a5, 1, 0);
  v12 = (void *)v11;
  if (!a5)
  {
    v13 = 0;
LABEL_31:

    return v13;
  }
  v33 = v7;
  v34 = v10;
  v13 = 0;
  v35 = (void *)v11;
  v36 = a4 + a5;
  encoding = -1;
  do
  {
    v14 = (void *)objc_msgSend((id)_parseUuencodedParts_uuencodeRegex, "firstMatchInString:options:range:", v12, 16, a4, a5);
    if (!v14)
      break;
    v15 = v14;
    v16 = objc_msgSend(v14, "range");
    v18 = v17;
    v19 = objc_msgSend(v15, "rangeAtIndex:", 1);
    v21 = v20;
    v22 = objc_msgSend(v7, "mf_rangeOfCString:options:range:", "\nend\n", 1, v16 + v18, a5 + a4 - (v16 + v18));
    if (v22 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = v35;
      break;
    }
    v24 = v22;
    v25 = v23;
    if (!v13)
    {
      v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      if (a2 != -1)
        encoding = MEMORY[0x1AF4337BC]();
      v26 = encoding;
      if (encoding == 256)
        v26 = 134217984;
      if (v26 == -1)
        v26 = 1280;
      encoding = v26;
    }
    if (v16 > a4)
    {
      v27 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", objc_msgSend(a1, "zone")), "init");
      objc_msgSend(v27, "setRange:", a4, v16 - a4);
      objc_msgSend(v13, "addObject:", v27);

      v7 = v33;
    }
    if (v21)
      v21 = (__CFString *)CFStringCreateWithBytes(0, (const UInt8 *)&v34[v19], (CFIndex)v21, encoding, 0);
    if (!-[__CFString length](v21, "length"))
    {

      v21 = CFSTR("mime-attachment");
    }
    v28 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", objc_msgSend(a1, "zone")), "init");
    objc_msgSend(v28, "setRange:", v16, v25 - v16 + v24);
    objc_msgSend(v28, "setContentTransferEncoding:", CFSTR("x-uuencode"));
    objc_msgSend(v28, "setType:", CFSTR("application"));
    objc_msgSend(v28, "setSubtype:", CFSTR("octet-stream"));
    objc_msgSend(v28, "setDisposition:", CFSTR("attachment"));
    objc_msgSend(v28, "setDispositionParameter:forKey:", v21, CFSTR("filename"));

    objc_msgSend(v13, "addObject:", v28);
    a4 = v25 + v24;
    v12 = v35;
    a5 = v36 - (v25 + v24);
  }
  while (v36 != v25 + v24);

  if (v13)
  {
    v29 = a5 + a4;
    v30 = v36 - (a5 + a4);
    if (v30)
    {
      v12 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", objc_msgSend(a1, "zone")), "init");
      objc_msgSend(v12, "setRange:", v29, v30);
      objc_msgSend(v13, "addObject:", v12);
      goto LABEL_31;
    }
  }
  return v13;
}

void _parseHeaders(uint64_t a1, unsigned int a2, void *a3, void *a4, unsigned int a5)
{
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  __CFString *v13;
  const __CFCharacterSet *Predefined;
  CFIndex v15;
  uint64_t v16;
  __CFString *v17;
  CFRange v18;
  CFRange v19;
  id v20;
  void *v21;
  unint64_t v22;
  id v23;
  NSObject *v24;
  BOOL v25;
  uint64_t v26;
  NSObject *v27;
  NSString *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  __CFString *v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  __int128 v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  _BOOL4 v52;
  _BOOL4 v53;
  int v54;
  int v55;
  int v57;
  int v58;
  int v59;
  unint64_t v61;
  uint64_t v62;
  id v63;
  int v64;
  _BOOL4 v65;
  MFMutableData *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  NSObject *v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  NSObject *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  MFMutableData *v89;
  __int128 v90;
  void *v91;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  uint64_t v101;
  size_t v102;
  _BYTE v103[128];
  _BYTE result[22];
  __int16 v105;
  uint64_t v106;
  uint64_t v107;
  CFRange v108;

  v107 = *MEMORY[0x1E0C80C00];
  v8 = objc_msgSend(a3, "bytes");
  v9 = objc_msgSend(a3, "length");
  v101 = 0xAAAAAAAAAAAAAAAALL;
  v102 = 0xAAAAAAAAAAAAAAAALL;
  if (ECGetNextHeaderFromDataInRange())
    MFMimePartParseContentTypeHeader((_QWORD *)a1, a2, v8, v101, v102);
  if (ECGetNextHeaderFromDataInRange())
    MFMimePartParseContentDispositionHeader((void *)a1, a2, v8, v101, v102);
  if (ECGetNextHeaderFromDataInRange())
  {
    v10 = _MFCreateStringFromHeaderBytes(a2, (UInt8 *)(v8 + v101), v102);
    objc_msgSend((id)a1, "setContentTransferEncoding:", v10);

  }
  if (ECGetNextHeaderFromDataInRange())
  {
    v11 = _MFCreateStringFromHeaderBytes(a2, (UInt8 *)(v8 + v101), v102);
    if (objc_msgSend(v11, "hasPrefix:", CFSTR("<"))
      && objc_msgSend(v11, "hasSuffix:", CFSTR(">")))
    {
      v12 = (id)objc_msgSend(v11, "substringWithRange:", 1, objc_msgSend(v11, "length") - 2);

      v11 = v12;
    }
    if (objc_msgSend(v11, "length"))
      objc_msgSend((id)a1, "setContentID:", v11);

  }
  if (ECGetNextHeaderFromDataInRange())
  {
    v13 = (__CFString *)_MFCreateStringFromHeaderBytes(a2, (UInt8 *)(v8 + v101), v102);
    Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespace);
    memset(result, 170, 16);
    v15 = -[__CFString length](v13, "length");
    if (v13)
    {
      v16 = v15;
      v108.location = 0;
      v108.length = v15;
      if (CFStringFindCharacterFromSet(v13, Predefined, v108, 0, (CFRange *)result))
      {
        v17 = (__CFString *)-[__CFString mutableCopyWithZone:](v13, "mutableCopyWithZone:", 0);
        v18.length = *(_QWORD *)&result[8];
        if (*(uint64_t *)&result[8] >= 1)
        {
          while (1)
          {
            v18.location = *(_QWORD *)result;
            CFStringReplace(v17, v18, &stru_1E5AA1FC8);
            v19.location = *(_QWORD *)result;
            v16 -= *(_QWORD *)&result[8];
            if (v16 <= *(uint64_t *)result)
              break;
            *(_QWORD *)&result[8] = v16 - *(_QWORD *)result;
            v19.length = v16 - *(_QWORD *)result;
            CFStringFindCharacterFromSet(v17, Predefined, v19, 0, (CFRange *)result);
            v18.length = *(_QWORD *)&result[8];
            if (*(uint64_t *)&result[8] <= 0)
              goto LABEL_24;
          }
          *(_QWORD *)&result[8] = 0;
        }
LABEL_24:

      }
      else
      {
        v17 = v13;
      }
    }
    else
    {
      v17 = 0;
    }
    objc_msgSend((id)a1, "setContentLocation:", v17);

  }
  if (ECGetNextHeaderFromDataInRange())
  {
    v20 = _MFCreateStringFromHeaderBytes(a2, (UInt8 *)(v8 + v101), v102);
    objc_msgSend((id)a1, "setContentDescription:", v20);

  }
  v94 = a4;
  if ((objc_msgSend(*(id *)(a1 + 8), "isEqualToString:", CFSTR("multipart")) & 1) == 0
    && ECGetNextHeaderFromDataInRange())
  {
    v21 = 0;
    v22 = v9;
    while (1)
    {
      v23 = _MFCreateStringFromHeaderBytes(a2, (UInt8 *)(v8 + v101), v102);
      if (v21)
      {
        if ((objc_msgSend(v21, "isEqualToString:", v23) & 1) != 0)
        {

          goto LABEL_38;
        }
        v24 = MFLogGeneral();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)result = 138543874;
          *(_QWORD *)&result[4] = v21;
          *(_WORD *)&result[12] = 2114;
          *(_QWORD *)&result[14] = v23;
          v105 = 2112;
          v106 = a1;
          _os_log_fault_impl(&dword_1ABB13000, v24, OS_LOG_TYPE_FAULT, "Found conflicting X-Apple-Content-Length headers (%{public}@ and %{public}@) for part %@", result, 0x20u);
        }

      }
      v21 = v23;
LABEL_38:
      v25 = v22 > v102 + v101;
      v22 -= v102 + v101;
      if (!v25 || !ECGetNextHeaderFromDataInRange())
      {
        if (v21)
        {
          if ((objc_msgSend(v21, "isEqualToString:", CFSTR("unknown")) & 1) != 0)
            v26 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v26 = (int)objc_msgSend(v21, "intValue");
          *(_QWORD *)(a1 + 56) = v26;
          v27 = MFLogGeneral();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            v28 = NSStringFromRange(*(NSRange *)(a1 + 48));
            *(_DWORD *)result = 138543618;
            *(_QWORD *)&result[4] = v28;
            *(_WORD *)&result[12] = 2112;
            *(_QWORD *)&result[14] = a1;
            _os_log_impl(&dword_1ABB13000, v27, OS_LOG_TYPE_INFO, "Updating range to %{public}@ for part %@", result, 0x16u);
          }
          if (*(_QWORD *)(a1 + 48) && a5)
            *(_QWORD *)(a1 + 48) = 0x7FFFFFFFFFFFFFFFLL;

        }
        break;
      }
    }
  }
  v29 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread"), "threadDictionary"), "objectForKey:", CFSTR("PreserveHeaders"));
  if (v29)
  {
    v30 = v29;
    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v97, v103, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v98;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v98 != v33)
            objc_enumerationMutation(v30);
          v35 = *(__CFString **)(*((_QWORD *)&v97 + 1) + 8 * i);
          if (ECGetNextHeaderFromDataInRange())
          {
            v36 = _MFCreateStringFromHeaderBytes(a2, (UInt8 *)(v8 + v101), v102);
            objc_msgSend((id)a1, "_setObjectInOtherIvars:forKey:", v36, _UniqueString(v35));

          }
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v97, v103, 16);
      }
      while (v32);
    }
  }
  if (objc_msgSend(*(id *)(a1 + 8), "isEqualToString:", CFSTR("multipart")))
  {
    v37 = (void *)objc_msgSend((id)a1, "bodyParameterForKey:", CFSTR("boundary"));
    v38 = v94;
    v39 = objc_msgSend(v94, "bytes");
    if (v37)
      goto LABEL_163;
    if (!_parseSubparts_mimeBoundaryRegex)
      _parseSubparts_mimeBoundaryRegex = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("^\\-\\-(.+)[ \t]*$"), 16, 0);
    v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v39, objc_msgSend(v94, "length"), 1, 0);
    v38 = v94;
    v80 = (void *)objc_msgSend((id)_parseSubparts_mimeBoundaryRegex, "firstMatchInString:options:range:", v79, 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

    if (v80)
    {
      objc_msgSend(v80, "range");
      v82 = v81;
      v83 = objc_msgSend(v80, "rangeAtIndex:", 1);
      if (v82)
      {
        v43 = v83;
        if (v83 != 0x7FFFFFFFFFFFFFFFLL)
        {
          if (v84)
          {
            v37 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "mf_stringWithData:encoding:", objc_msgSend(v94, "mf_subdataWithRange:", v83, v84), 1);
            v85 = MFLogGeneral();
            if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)result = 138412290;
              *(_QWORD *)&result[4] = v37;
              _os_log_impl(&dword_1ABB13000, v85, OS_LOG_TYPE_INFO, "Missing multipart boundary parameter; using \"%@\"",
                result,
                0xCu);
            }
            if (v37)
            {
LABEL_163:
              v40 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", objc_msgSend(v37, "length") + 2);
              v95 = objc_msgSend((id)a1, "range");
              v42 = v41;
              objc_msgSend(v40, "mf_appendCString:", "--");
              objc_msgSend(v40, "appendData:", objc_msgSend(v37, "dataUsingEncoding:", 1));
              if (v42)
              {
                *(_QWORD *)&v44 = 134218496;
                v90 = v44;
                v45 = v95;
                v46 = 0x7FFFFFFFFFFFFFFFLL;
                v91 = v40;
                while (1)
                {
                  v47 = objc_msgSend(v38, "mf_rangeOfData:options:range:", v40, 0, v45, v42, v90);
                  v49 = v42 + v45;
                  v50 = v47 == 0x7FFFFFFFFFFFFFFFLL ? v42 + v45 : v47;
                  v51 = v47 == 0x7FFFFFFFFFFFFFFFLL ? 0 : v48;
                  v52 = v50 > v45 && *(_BYTE *)(v50 + v39 - 1) == 10;
                  v45 = v51 + v50;
                  v42 = v49 - (v51 + v50);
                  if (v49 == v51 + v50)
                    break;
                  if (v42 >= 2)
                  {
                    if (v42 == 2 || *(_WORD *)(v39 + v45) != 11565)
                    {
                      if (*(_WORD *)(v39 + v45) == 11565)
                        break;
                    }
                    else
                    {
                      v55 = *(unsigned __int8 *)(v39 + v45 + 2);
                      if (v55 == 10 || v55 == 13)
                        break;
                    }
                  }
                  v54 = 0;
                  v53 = *(unsigned __int8 *)(v39 + v45) == 10;
LABEL_86:
                  v57 = v50 == v95 || v52;
                  if (v49 == v45)
                    v58 = 1;
                  else
                    v58 = v54;
                  v59 = v58 | v53;
                  if (v57 == 1 && v59 != 0)
                  {
                    v61 = v50 - v52;
                    v62 = v51 + v52 + v53;
                    if (v46 == 0x7FFFFFFFFFFFFFFFLL)
                      goto LABEL_123;
                    v93 = v62;
                    v63 = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", objc_msgSend((id)a1, "zone")), "init");
                    if (objc_msgSend(*(id *)(a1 + 16), "isEqualToString:", CFSTR("digest")))
                      v64 = objc_msgSend(*(id *)(a1 + 8), "isEqualToString:", CFSTR("multipart"));
                    else
                      v64 = 0;
                    if (objc_msgSend(*(id *)(a1 + 16), "isEqualToString:", CFSTR("signed"))
                      && objc_msgSend(*(id *)(a1 + 8), "isEqualToString:", CFSTR("multipart")))
                    {
                      v65 = objc_msgSend((id)a1, "firstChildPart") == 0;
                      if (!v64)
                      {
LABEL_106:
                        if (v65)
                        {
                          v66 = objc_alloc_init(MFMutableData);
                          -[MFMutableData appendBytes:length:](v66, "appendBytes:length:", v39 + v46, v61 - v46);
                          objc_msgSend((id)a1, "_setObjectInOtherIvars:forKey:", v66, CFSTR("x-signed-data"));

                        }
                        v67 = v39;
                        if (v61 == v46)
                        {
LABEL_109:
                          v68 = 0;
                        }
                        else if (*(_BYTE *)(v39 + v46) == 10)
                        {
                          if (v64)
                            v68 = (void *)objc_msgSend(v94, "mf_subdataWithRange:", v46, 1);
                          else
                            v68 = 0;
                          ++v46;
                        }
                        else
                        {
                          if (objc_msgSend(v94, "mf_rangeOfCString:options:range:", "begin", 9, v46, v61 - v46) == 0x7FFFFFFFFFFFFFFFLL)
                            v69 = 0;
                          else
                            v69 = _parseUuencodedParts(v63, a2, v94, v46, v61 - v46);
                          if (objc_msgSend(v69, "count") == 1)
                          {

                            v63 = (id)objc_msgSend(v69, "lastObject");
                            v46 = objc_msgSend(v63, "range");
                            goto LABEL_109;
                          }
                          v71 = objc_msgSend(v94, "mf_rangeOfCString:options:range:", "\n\n", 0, v46, v61 - v46);
                          if (v71 == 0x7FFFFFFFFFFFFFFFLL)
                          {
                            v68 = 0;
                            v46 = v61;
                          }
                          else
                          {
                            v73 = v71 + v72;
                            v68 = (void *)objc_msgSend(v94, "mf_subdataWithRange:", v46, v71 + v72 - v46);
                            v46 = v73;
                          }
                        }
                        v39 = v67;
                        v70 = MFLogGeneral();
                        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)result = v90;
                          *(_QWORD *)&result[4] = v46;
                          *(_WORD *)&result[12] = 2048;
                          *(_QWORD *)&result[14] = v61;
                          v105 = 2048;
                          v106 = v93;
                          _os_log_debug_impl(&dword_1ABB13000, v70, OS_LOG_TYPE_DEBUG, "subRange.location={%lu} matchRange={%lu,%lu}", result, 0x20u);
                        }
                        objc_msgSend(v63, "setRange:", v46, v61 - v46);
                        objc_msgSend((id)a1, "addSubpart:", v63);
                        v38 = v94;
                        if (v68 && objc_msgSend(v68, "length"))
                          _parseHeaders(v63, a2, v68, v94, a5);

                        v40 = v91;
                        v62 = v93;
LABEL_123:
                        if ((v54 & 1) != 0)
                          goto LABEL_150;
                        v45 = v62 + v61;
                        v42 = v49 - (v62 + v61);
                        v46 = v62 + v61;
                        goto LABEL_125;
                      }
                    }
                    else
                    {
                      v65 = 0;
                      if (!v64)
                        goto LABEL_106;
                    }
                    objc_msgSend(v63, "setType:", CFSTR("message"));
                    objc_msgSend(v63, "setSubtype:", CFSTR("rfc822"));
                    goto LABEL_106;
                  }
LABEL_125:
                  if (!v42)
                    goto LABEL_150;
                }
                v53 = 0;
                v54 = 1;
                goto LABEL_86;
              }
            }
          }
        }
      }
    }
LABEL_150:
    if (!objc_msgSend((id)a1, "firstChildPart", v43)
      && (objc_msgSend((id)objc_msgSend((id)a1, "subtype"), "isEqualToString:", CFSTR("x-folder")) & 1) == 0
      && *(_QWORD *)(a1 + 56)
      && *(_QWORD *)(a1 + 48) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v86 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", objc_msgSend((id)a1, "zone")), "init");
      objc_msgSend(v86, "setType:", CFSTR("text"));
      objc_msgSend(v86, "setSubtype:", CFSTR("plain"));
      objc_msgSend(v86, "setRange:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
      objc_msgSend((id)a1, "addSubpart:", v86);

    }
    *(_OWORD *)(a1 + 48) = xmmword_1ABB4D620;
  }
  else if (((objc_msgSend(*(id *)(a1 + 8), "isEqualToString:", CFSTR("multipart")) & 1) != 0
          || objc_msgSend(*(id *)(a1 + 8), "isEqualToString:", CFSTR("message"))
          && objc_msgSend(*(id *)(a1 + 16), "isEqualToString:", CFSTR("rfc822")))
         && *(_QWORD *)(a1 + 48) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v74 = *(_QWORD *)(a1 + 56);
    if (v74 <= objc_msgSend(v94, "length") - *(_QWORD *)(a1 + 48))
    {
      v75 = objc_msgSend(v94, "bytes");
      v76 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", objc_msgSend((id)a1, "zone")), "init");
      v77 = *(_QWORD *)(a1 + 48);
      if (*(_QWORD *)(a1 + 56) && *(_BYTE *)(v75 + v77) == 10)
      {
        v78 = 1;
      }
      else
      {
        v87 = objc_msgSend(v94, "mf_rangeOfCString:options:range:", "\n\n", 0, *(_QWORD *)(a1 + 48));
        v77 = *(_QWORD *)(a1 + 48);
        if (v88)
          v78 = v87 + v88 - v77;
        else
          v78 = *(_QWORD *)(a1 + 56);
      }
      v89 = objc_alloc_init(MFMutableData);
      -[MFMutableData appendBytes:length:](v89, "appendBytes:length:", v75 + v77, v78);
      objc_msgSend(v76, "setRange:");
      objc_msgSend((id)a1, "addSubpart:", v76);
      _parseHeaders(v76, a2, v89, v94, a5);

    }
  }
}

uint64_t _setupDictionaryFromArray(void *a1, void **a2, CFArrayRef theArray)
{
  uint64_t result;
  uint64_t v7;
  CFIndex i;
  __CFString *ValueAtIndex;
  const void *v10;
  CFTypeID TypeID;
  CFTypeID v12;
  void *v13;

  result = CFArrayGetCount(theArray);
  if (result >= 2)
  {
    v7 = result;
    for (i = 1; i < v7; i += 2)
    {
      ValueAtIndex = (__CFString *)CFArrayGetValueAtIndex(theArray, i - 1);
      result = (uint64_t)CFArrayGetValueAtIndex(theArray, i);
      if (ValueAtIndex)
      {
        v10 = (const void *)result;
        if (result)
        {
          TypeID = CFStringGetTypeID();
          result = CFGetTypeID(ValueAtIndex);
          if (TypeID == result)
          {
            v12 = CFStringGetTypeID();
            result = CFGetTypeID(v10);
            if (v12 == result)
            {
              v13 = _UniqueString(ValueAtIndex);
              result = (uint64_t)_MFSetValueInDictionary(a1, a2, (uint64_t)v13, (uint64_t)v10);
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t _MFOffsetFromThreadDictionary(void *a1)
{
  void *v1;

  v1 = (void *)objc_msgSend(a1, "objectForKey:", CFSTR("__MIME_PART_DECODE_OFFSET"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(v1, "unsignedIntegerValue");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

__CFString *_MFCopyDecodeText(void *a1, CFStringEncoding *a2)
{
  void *v4;
  __CFString *v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  NSObject *v9;
  unsigned __int8 v11;
  uint64_t v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread"), "threadDictionary");
  v12 = 0;
  v11 = 0;
  v5 = (__CFString *)objc_msgSend(a1, "copyBodyDataToOffset:resultOffset:downloadIfNecessary:isComplete:", _MFOffsetFromThreadDictionary(v4), &v12, objc_msgSend((id)objc_msgSend(v4, "objectForKey:", CFSTR("__MIME_PART_DECODE_DOWNLOAD")), "BOOLValue"), &v11);
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12), CFSTR("__MIME_PART_DECODE_RESULT_OFFSET"));
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11), CFSTR("__MIME_PART_RESULT_IS_COMPLETE"));
  if (a2)
    *a2 = -1;
  if (v5
    && ((-[__CFString mf_rangeOfCString:](v5, "mf_rangeOfCString:", "\r\n"), !v6)
     || (v7 = (__CFString *)-[__CFString mutableCopy](v5, "mutableCopy"),
         v5,
         -[__CFString mf_convertNetworkLineEndingsToUnix](v7, "mf_convertNetworkLineEndingsToUnix"),
         (v5 = v7) != 0)))
  {
    v8 = MFCreateStringWithData(v5, objc_msgSend(a1, "textEncoding"), a2);
  }
  else
  {
    v9 = MFLogGeneral();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v14 = a1;
      _os_log_impl(&dword_1ABB13000, v9, OS_LOG_TYPE_INFO, "---self=%p nil data!", buf, 0xCu);
    }
    v5 = 0;
    v8 = 0;
  }

  return v8;
}

uint64_t ___parseUuencodedParts_block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("^begin +[0-9]+ +(.+)$"), 17, 0);
  _parseUuencodedParts_uuencodeRegex = result;
  return result;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void sub_1ABB3B010(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB3B058(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB3B364(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB3B434(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB3B4E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB3B57C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB3B5F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB3B674(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABB3B7C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABB3B870(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB3B8EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABB3B9C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB3BB20(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB3BBCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABB3BC6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB3BCEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB3BE58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

BOOL MFGetTypeInfo(void *a1, int a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString **v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  BOOL v18;

  v3 = a1;
  v4 = v3;
  if (a2)
  {
    v5 = v3;
    v6 = v5;
    if ((a2 & 2) != 0)
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(v5, "filename");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pathExtension");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lowercaseString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v10 = off_1E5AA1940;
    while (1)
    {
      if ((a2 & 1) == 0)
      {
        v11 = *(v10 - 4);
        if (v11)
        {
          objc_msgSend(v6, "mimeType");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "caseInsensitiveCompare:", v12);

          if (!v13)
            goto LABEL_17;
        }
      }
      if ((a2 & 2) == 0)
      {
        v14 = *(v10 - 3);
        if (v14)
        {
          objc_msgSend(v6, "pathExtension");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "caseInsensitiveCompare:", v15);

          if (!v16)
            break;
          objc_msgSend(v6, "filename");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            if (objc_msgSend(v9, "isEqualToString:", v14))
              break;
          }
        }
      }
LABEL_20:
      if (a2)
      {
        v18 = v10 >= MFMIMEErrorDomain;
        v10 += 4;
        if (!v18)
          continue;
      }

      goto LABEL_24;
    }
    if ((a2 & 1) != 0 && *(v10 - 4))
    {
      objc_msgSend(v6, "setMimeType:");
      a2 &= ~1u;
    }
LABEL_17:
    if (*(v10 - 3) && (a2 & 2) != 0)
    {
      objc_msgSend(v6, "setPathExtension:");
      a2 &= ~2u;
    }
    goto LABEL_20;
  }
LABEL_24:

  return a2 == 0;
}

void sub_1ABB3C07C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABB3C154(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB3C2F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB3C3E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB3C4E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB3C624(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB3C6CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABB3C858(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABB3CAEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1ABB3CC74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABB3CEE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABB3D0CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB3D594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1ABB3D7C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1ABB3D8C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABB3DA54(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB3DCA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB3DF00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB3DFC0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB3E02C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1ABB3E0A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB3E1D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB3E338(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t _rangeOfBytes(void *a1, char *a2, size_t a3, char a4, uint64_t a5, size_t a6)
{
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  char *v16;
  size_t v17;
  char *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t (*v21)(char *, char *, uint64_t);
  uint64_t v22;
  char *v23;
  int v25;
  char *v26;
  char *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  size_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v11 = a1;
  if (a5 + a6 > objc_msgSend(v11, "length"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("%s: Out of bounds"), "NSRange _rangeOfBytes(NSData *__strong, const char *, NSUInteger, NSUInteger, NSRange)");
  v12 = objc_retainAutorelease(v11);
  v13 = 0x7FFFFFFFFFFFFFFFLL;
  if (!objc_msgSend(v12, "bytes") || a6 < a3)
    goto LABEL_29;
  if ((a6 & 0x80000000) != 0)
  {
    MFLogGeneral();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v31 = a6;
      _os_log_impl(&dword_1ABB13000, v20, OS_LOG_TYPE_DEFAULT, "#Warning _rangeOfBytes: searchRange.length is invalid (%lu)", buf, 0xCu);
    }

    goto LABEL_29;
  }
  v14 = objc_retainAutorelease(v12);
  v15 = v14;
  if ((a4 & 4) != 0)
  {
    v16 = (char *)(objc_msgSend(v14, "bytes") + a5 + a6 - 1);
    if ((a4 & 8) != 0)
      v18 = &v16[-a3];
    else
      v18 = (char *)(objc_msgSend(objc_retainAutorelease(v15), "bytes") + a5);
    v19 = -1;
  }
  else
  {
    v16 = (char *)(objc_msgSend(v14, "bytes") + a5);
    if ((a4 & 8) != 0)
      v17 = a3;
    else
      v17 = a6;
    v18 = &v16[v17];
    if ((a4 & 1) == 0 && v17 >= a3)
    {
      v29 = v15;
      v25 = *a2;
      v19 = 1;
      while (1)
      {
        v26 = (char *)memchr(v16, v25, v17);
        if (!v26)
          goto LABEL_27;
        v27 = v26;
        if (v18 - v26 < a3)
          goto LABEL_27;
        if (!memcmp(v26, a2, a3))
        {
          v13 = (uint64_t)&v27[-objc_msgSend(objc_retainAutorelease(v29), "bytes")];
          goto LABEL_29;
        }
        v16 = v27 + 1;
        v17 = v18 - (v27 + 1);
        if (v17 < a3)
        {
          v15 = v29;
          goto LABEL_20;
        }
      }
    }
    v19 = 1;
  }
LABEL_20:
  if ((a4 & 1) != 0)
    v21 = memcasecmp;
  else
    v21 = (uint64_t (*)(char *, char *, uint64_t))MEMORY[0x1E0C84078];
  if (v18 - v16 < a3)
  {
LABEL_27:
    v13 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_29;
  }
  v28 = v15;
  v22 = 0;
  v23 = v16;
  while (v21(&v16[v22], a2, a3))
  {
    v23 += v19;
    v22 += v19;
    if (v18 - v23 < a3)
      goto LABEL_27;
  }
  v13 = (uint64_t)&v16[v22 - objc_msgSend(objc_retainAutorelease(v28), "bytes")];
LABEL_29:

  return v13;
}

void sub_1ABB3E730(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB3E814(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB3E9DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB3EB68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t memcasecmp(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;

  v6 = MEMORY[0x1E0C80978];
  while (a3)
  {
    v8 = *a1++;
    v7 = v8;
    v10 = *a2++;
    v9 = v10;
    if ((v7 & 0x80000000) == 0)
    {
      if ((*(_DWORD *)(v6 + 4 * v7 + 60) & 0x8000) == 0)
        goto LABEL_6;
LABEL_5:
      LOBYTE(v7) = __tolower(v7);
      goto LABEL_6;
    }
    if (__maskrune(v7, 0x8000uLL))
      goto LABEL_5;
LABEL_6:
    if ((v9 & 0x80000000) != 0)
    {
      if (!__maskrune(v9, 0x8000uLL))
        goto LABEL_9;
LABEL_8:
      LOBYTE(v9) = __tolower(v9);
      goto LABEL_9;
    }
    if ((*(_DWORD *)(v6 + 4 * v9 + 60) & 0x8000) != 0)
      goto LABEL_8;
LABEL_9:
    --a3;
    if (v7 != v9)
      return ((char)v7 - (char)v9);
  }
  return 0;
}

void sub_1ABB3F054(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB3F140(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB3F2E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABB3F344()
{
  void *v0;

  JUMPOUT(0x1ABB3F334);
}

void sub_1ABB3F350()
{
  JUMPOUT(0x1ABB3F334);
}

void sub_1ABB3F3EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB3F454(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB3F5A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1ABB3F750(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1ABB3F874(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1ABB3FA18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

BOOL MFProtectFileDescriptor(int a1, uint64_t a2)
{
  return (a1 & 0x80000000) == 0 && fcntl(a1, 64, a2) != -1;
}

void sub_1ABB3FC1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABB3FE58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1ABB400F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

id MFRemoveItemAtURL(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  MFRemoveItemAtPath(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_1ABB401BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id MFRemoveItemAtPath(void *a1)
{
  id v1;
  void *v2;
  id v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (v1
    && (v3 = objc_retainAutorelease(v1),
        (v4 = removefile((const char *)objc_msgSend(v3, "fileSystemRepresentation"), 0, 1u)) != 0))
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB2AA0];
    v10[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void sub_1ABB402C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void _mfEnableLockTesting()
{
  sMFLockTesting = 1;
}

uint64_t _mfLockEncounteredError()
{
  uint64_t result;

  result = sMFLockEncounteredError;
  sMFLockEncounteredError = 0;
  return result;
}

uint64_t __mfEnableCallStackLogging()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  objc_msgSend(v0, "registerDefaults:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", *MEMORY[0x1E0C9AE50], CFSTR("MFLockCallStackLoggingEnabled")));
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("MFLockCallStackLoggingEnabled"), 0);
}

uint64_t _mfIsLockedOnThisThread(uint64_t a1)
{
  const __CFDictionary *v2;
  pthread_t v3;
  uint64_t v4;

  pthread_mutex_lock(&__threadLockRelationsLock);
  v2 = (const __CFDictionary *)__threadLockRelations;
  v3 = pthread_self();
  v4 = objc_msgSend((id)CFDictionaryGetValue(v2, v3), "containsObject:", a1);
  pthread_mutex_unlock(&__threadLockRelationsLock);
  return v4;
}

uint64_t ___mfCallStackLoggingEnabled_block_invoke_2()
{
  uint64_t result;
  BOOL v1;
  char v2;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppBooleanValue(CFSTR("MFLockCallStackLoggingEnabled"), (CFStringRef)*MEMORY[0x1E0C9B248], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v1 = (_DWORD)result == 0;
  else
    v1 = 1;
  v2 = !v1;
  _mfCallStackLoggingEnabled___loggingDefaultEnabled = v2;
  return result;
}

uint64_t ___mfCallStackLoggingEnabled_block_invoke_3(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  objc_msgSend(v2, "registerDefaults:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", *MEMORY[0x1E0C9AE50], CFSTR("MFLockCallStackLoggingEnabled")));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t _comparePriorities(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = 1;
  if (a1 >= a2)
    v2 = -1;
  if (a1 == a2)
    return 0;
  else
    return v2;
}

uint64_t OUTLINED_FUNCTION_0_3(void *a1, const char *a2, uint64_t a3)
{
  return objc_msgSend(a1, "_mf_dumpLockCallStacks:ordering:", a2, a3);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_impl(a1, v9, OS_LOG_TYPE_DEFAULT, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_2_0(uint64_t a1)
{
  void *v1;

  return objc_msgSend(v1, "_mf_dumpLockCallStacks:ordering:", 0x7FFFFFFFFFFFFFFFLL, a1);
}

BOOL OUTLINED_FUNCTION_3(NSObject *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_DEFAULT);
}

void sub_1ABB40D04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1ABB40ED4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB40FA4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB414E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABB41704(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB41B3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1ABB41C9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1ABB41EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_1ABB420AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  TemporaryFile::~TemporaryFile((TemporaryFile *)va);
  _Unwind_Resume(a1);
}

uint64_t DecodeBuffer::parse(DecodeBuffer *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _BYTE v12[24];
  _BYTE *v13;
  _BYTE v14[24];
  _BYTE *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!DecodeBuffer::parseHeader(a1))
    return 0;
  std::__function::__value_func<void ()(unsigned char)>::__value_func[abi:nn180100]((uint64_t)v14, a2);
  std::__function::__value_func<void ()(unsigned char)>::__value_func[abi:nn180100]((uint64_t)v12, a3);
  v6 = DecodeBuffer::parseLines(a1, (uint64_t)v14, (uint64_t)v12);
  v7 = v13;
  if (v13 == v12)
  {
    v8 = 4;
    v7 = v12;
    goto LABEL_7;
  }
  if (v13)
  {
    v8 = 5;
LABEL_7:
    (*(void (**)(void))(*v7 + 8 * v8))();
  }
  v9 = v15;
  if (v15 == v14)
  {
    v10 = 4;
    v9 = v14;
    goto LABEL_12;
  }
  if (v15)
  {
    v10 = 5;
LABEL_12:
    (*(void (**)(void))(*v9 + 8 * v10))();
  }
  return v6;
}

void sub_1ABB42230(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13, char a14, uint64_t a15, uint64_t a16, char *a17)
{
  char *v17;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;

  v19 = a13;
  if (a13 == v17)
  {
    v20 = 4;
    v19 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v20 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v19 + 8 * v20))();
LABEL_6:
  v21 = a17;
  if (a17 == &a14)
  {
    v22 = 4;
    v21 = &a14;
  }
  else
  {
    if (!a17)
      goto LABEL_11;
    v22 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v21 + 8 * v22))();
LABEL_11:
  _Unwind_Resume(exception_object);
}

FILE *TemporaryFile::mappedData(TemporaryFile *this)
{
  FILE *v2;
  FILE *v3;
  id v4;

  v2 = (FILE *)*((_QWORD *)this + 2);
  if (v2)
  {
    fflush(v2);
    v2 = (FILE *)mmap(0, *((_QWORD *)this + 3), 1, 1, *(_DWORD *)this, 0);
    if (v2)
    {
      v3 = v2;
      v4 = objc_alloc(MEMORY[0x1E0C99D50]);
      v2 = (FILE *)objc_msgSend(v4, "initWithBytesNoCopy:length:deallocator:", v3, *((_QWORD *)this + 3), *MEMORY[0x1E0CB2910]);
    }
  }
  return v2;
}

void OutputBuffer::OutputBuffer(OutputBuffer *this, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  *(_QWORD *)this = 0;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)this + 1) = v3;
  v4 = objc_msgSend(v3, "mutableBytes");
  *((_QWORD *)this + 2) = v4;
  *((_QWORD *)this + 3) = v4 + objc_msgSend(*((id *)this + 1), "length");
}

void sub_1ABB42370(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void DecodeBuffer::DecodeBuffer(DecodeBuffer *this, NSData *a2)
{
  NSData *v3;
  NSData *v4;
  uint64_t v5;
  NSData *v6;

  v3 = objc_retainAutorelease(a2);
  *(_QWORD *)this = -[NSData bytes](v3, "bytes");
  v4 = objc_retainAutorelease(v3);
  v5 = -[NSData bytes](v4, "bytes");
  *((_QWORD *)this + 1) = v5 + -[NSData length](v4, "length");
  v6 = objc_retainAutorelease(v4);
  *((_QWORD *)this + 2) = -[NSData bytes](v6, "bytes");

}

void sub_1ABB423FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t DecodeBuffer::parseHeader(DecodeBuffer *this)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unsigned __int8 *v5;
  int v6;
  unint64_t v8;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  int v12;

  if (!*(_QWORD *)this)
    return 0;
  v2 = *((_QWORD *)this + 2);
  v3 = *((_QWORD *)this + 1) - v2;
  if (v3 < 6)
    return 0;
  v4 = 0;
  if (v3 >= 0x78)
    v3 = 120;
  v5 = (unsigned __int8 *)(v2 + v3);
  while (1)
  {
    v6 = *(unsigned __int8 *)(v2 + v4);
    if (v6 == 10 || v6 == 13)
      break;
    if (v3 == ++v4)
      return 0;
  }
  v8 = v3 - v4;
  if (v3 == v4 || v4 < 6 || strncmp(*((const char **)this + 2), "begin ", 6uLL))
    return 0;
  v10 = (unsigned __int8 *)(v2 + v4);
  v11 = (unsigned __int8 *)(v2 + v4 + v8);
  while (1)
  {
    v12 = *v10;
    if (v12 != 13 && v12 != 10)
      break;
    ++v10;
    if (!--v8)
    {
      v10 = v11;
      break;
    }
  }
  if (v10 == v5)
    return 0;
  *((_QWORD *)this + 2) = v10;
  return 1;
}

uint64_t DecodeBuffer::parseLines(DecodeBuffer *a1, uint64_t a2, uint64_t a3)
{
  int v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  int v11;
  _BYTE v13[24];
  _BYTE *v14;
  _BYTE v15[24];
  _BYTE *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  do
  {
    std::__function::__value_func<void ()(unsigned char)>::__value_func[abi:nn180100]((uint64_t)v15, a2);
    std::__function::__value_func<void ()(unsigned char)>::__value_func[abi:nn180100]((uint64_t)v13, a3);
    v6 = DecodeBuffer::parseSingleLine(a1, (uint64_t)v15, (uint64_t)v13);
    v7 = v14;
    if (v14 == v13)
    {
      v7 = v13;
      v8 = 4;
    }
    else
    {
      if (!v14)
        goto LABEL_7;
      v8 = 5;
    }
    (*(void (**)(void))(*v7 + 8 * v8))();
LABEL_7:
    v9 = v16;
    if (v16 == v15)
    {
      v9 = v15;
      v10 = 4;
    }
    else
    {
      if (!v16)
        goto LABEL_12;
      v10 = 5;
    }
    (*(void (**)(void))(*v9 + 8 * v10))();
LABEL_12:
    if (v6 == 2)
      v11 = 3;
    else
      v11 = 0;
    if (!v6)
      v11 = 1;
  }
  while (!v11);
  if (v11 == 1)
    return 0;
  else
    return DecodeBuffer::parseFinalLine(a1);
}

void sub_1ABB42610(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13, char a14, uint64_t a15, uint64_t a16, char *a17)
{
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;

  v18 = a13;
  if (a13 == &a10)
  {
    v19 = 4;
    v18 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v19 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v18 + 8 * v19))();
LABEL_6:
  v20 = a17;
  if (a17 == &a14)
  {
    v21 = 4;
    v20 = &a14;
  }
  else
  {
    if (!a17)
      goto LABEL_11;
    v21 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v20 + 8 * v21))();
LABEL_11:
  _Unwind_Resume(exception_object);
}

uint64_t DecodeBuffer::parseSingleLine(DecodeBuffer *this, uint64_t a2, uint64_t a3)
{
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  int v5;
  unsigned __int8 *v7;
  unint64_t v8;
  char v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE v13[24];
  _BYTE *v14;
  _BYTE v15[24];
  _BYTE *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (unsigned __int8 *)*((_QWORD *)this + 1);
  v4 = (unsigned __int8 *)*((_QWORD *)this + 2);
  if (v3 == v4)
    return 0;
  v5 = *v4;
  if ((v5 - 97) < 0xFFFFFFBF)
    return 0;
  v7 = v4 + 1;
  *((_QWORD *)this + 2) = v7;
  v8 = ((_BYTE)v5 + 32) & 0x3F;
  if ((_DWORD)v8 == 45)
  {
    if ((unint64_t)(v3 - v7) >= 0x42)
    {
      std::__function::__value_func<void ()(unsigned char)>::__value_func[abi:nn180100]((uint64_t)v15, a3);
      v10 = DecodeBuffer::parseLineFast(this, (uint64_t)v15);
      v11 = v16;
      if (v16 == v15)
      {
        v12 = 4;
        v11 = v15;
        goto LABEL_15;
      }
LABEL_12:
      if (!v11)
        return (v10 & 1) != 0;
      v12 = 5;
LABEL_15:
      (*(void (**)(void))(*(_QWORD *)v11 + 8 * v12))();
      return (v10 & 1) != 0;
    }
LABEL_11:
    std::__function::__value_func<void ()(unsigned char)>::__value_func[abi:nn180100]((uint64_t)v13, a2);
    v10 = DecodeBuffer::parseLineSlow(this, v8, (uint64_t)v13);
    v11 = v14;
    if (v14 == v13)
    {
      v12 = 4;
      v11 = v13;
      goto LABEL_15;
    }
    goto LABEL_12;
  }
  if ((((_BYTE)v5 + 32) & 0x3F) != 0)
    goto LABEL_11;
  if (DecodeBuffer::parseNewline(this))
    return 2;
  else
    return 0;
}

void sub_1ABB427D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, char *a17)
{
  char *v17;
  char *v19;
  uint64_t v20;

  v19 = a17;
  if (a17 == v17)
  {
    v20 = 4;
    v19 = &a14;
  }
  else
  {
    if (!a17)
      goto LABEL_6;
    v20 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v19 + 8 * v20))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t DecodeBuffer::parseFinalLine(DecodeBuffer *this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v2 = *((_QWORD *)this + 1);
  v1 = *((_QWORD *)this + 2);
  if ((unint64_t)(v2 - v1) < 3 || strncmp(*((const char **)this + 2), "end", 3uLL))
    return 0;
  *((_QWORD *)this + 2) = v1 + 3;
  if (v2 == v1 + 3)
    return 1;
  result = DecodeBuffer::parseNewline(this);
  if ((_DWORD)result)
    return 1;
  return result;
}

uint64_t DecodeBuffer::parseNewline(DecodeBuffer *this)
{
  unsigned __int8 *v1;
  unsigned __int8 *v2;
  int v3;
  int v5;

  v2 = (unsigned __int8 *)*((_QWORD *)this + 1);
  v1 = (unsigned __int8 *)*((_QWORD *)this + 2);
  if (v2 == v1)
    return 0;
  v3 = *v1;
  if (v3 != 13 && v3 != 10)
    return 0;
  *((_QWORD *)this + 2) = v1 + 1;
  if (v2 != v1 + 1)
  {
    v5 = v1[1];
    if (v5 == 13 || v5 == 10)
      *((_QWORD *)this + 2) = v1 + 2;
  }
  return 1;
}

uint64_t DecodeBuffer::parseLineFast(DecodeBuffer *a1, uint64_t a2)
{
  int8x16_t *v2;
  int8x16_t v4;
  int8x16_t v5;
  int8x16_t v6;
  int8x16_t v7;
  uint8x16_t v8;
  int8x16_t v9;
  uint8x16_t v10;
  int8x16_t v11;
  int8x16_t v12;
  int8x16_t v13;
  int8x16_t v14;
  int8x16_t v15;
  uint64_t v16;
  uint64_t v18;
  _OWORD v19[3];
  int8x16x2_t v20;
  int8x16x2_t v21;

  v2 = (int8x16_t *)*((_QWORD *)a1 + 2);
  if (*((_QWORD *)a1 + 1) - (_QWORD)v2 <= 0x41uLL)
    DecodeBuffer::parseLineFast();
  v4.i64[0] = 0x2020202020202020;
  v4.i64[1] = 0x2020202020202020;
  v5.i64[0] = 0x3F3F3F3F3F3F3F3FLL;
  v5.i64[1] = 0x3F3F3F3F3F3F3F3FLL;
  v20.val[0] = vandq_s8(vaddq_s8(*v2, v4), v5);
  *((_QWORD *)a1 + 2) = v2 + 1;
  v20.val[1] = vandq_s8(vaddq_s8(v2[1], v4), v5);
  *((_QWORD *)a1 + 2) = v2 + 2;
  v21.val[0] = vandq_s8(vaddq_s8(v2[2], v4), v5);
  *((_QWORD *)a1 + 2) = v2 + 3;
  v21.val[1] = vandq_s8(vaddq_s8(v2[3], v4), v5);
  *((_QWORD *)a1 + 2) = (char *)v2 + 60;
  v6 = vqtbl2q_s8(v21, (int8x16_t)xmmword_1ABB4D690);
  v5.i64[0] = vqtbl2q_s8(v20, (int8x16_t)xmmword_1ABB4D6A0).u64[0];
  v5.i64[1] = vextq_s8(v6, v6, 8uLL).u64[0];
  v7 = vqtbl2q_s8(v21, (int8x16_t)xmmword_1ABB4D6B0);
  v8.i64[0] = vqtbl2q_s8(v20, (int8x16_t)xmmword_1ABB4D6C0).u64[0];
  v8.i64[1] = vextq_s8(v7, v7, 8uLL).u64[0];
  v9 = vqtbl2q_s8(v21, (int8x16_t)xmmword_1ABB4D6D0);
  v10.i64[0] = vqtbl2q_s8(v20, (int8x16_t)xmmword_1ABB4D6E0).u64[0];
  v10.i64[1] = vextq_s8(v9, v9, 8uLL).u64[0];
  v11 = vqtbl2q_s8(v21, (int8x16_t)xmmword_1ABB4D6F0);
  v20.val[0].i64[0] = vqtbl2q_s8(v20, (int8x16_t)xmmword_1ABB4D700).u64[0];
  v20.val[0].i64[1] = vextq_s8(v11, v11, 8uLL).u64[0];
  v20.val[1] = vorrq_s8(vshlq_n_s8(v5, 2uLL), (int8x16_t)vshrq_n_u8(v8, 4uLL));
  v12 = vorrq_s8(vshlq_n_s8((int8x16_t)v8, 4uLL), (int8x16_t)vshrq_n_u8(v10, 2uLL));
  v21.val[0] = vorrq_s8(vshlq_n_s8((int8x16_t)v10, 6uLL), v20.val[0]);
  v13 = vqtbl2q_s8(*(int8x16x2_t *)((char *)&v20 + 16), (int8x16_t)xmmword_1ABB4D710);
  v20.val[0] = vqtbl2q_s8(v21, (int8x16_t)xmmword_1ABB4D720);
  v14 = vqtbl2q_s8(*(int8x16x2_t *)((char *)&v20 + 16), (int8x16_t)xmmword_1ABB4D730);
  v19[0] = v20.val[0];
  v19[1] = vqtbl2q_s8(v21, (int8x16_t)xmmword_1ABB4D740);
  v15 = vqtbl2q_s8(*(int8x16x2_t *)((char *)&v20 + 16), (int8x16_t)xmmword_1ABB4D750);
  v19[2] = vqtbl2q_s8(v21, (int8x16_t)xmmword_1ABB4D760);
  v16 = *(_QWORD *)(a2 + 24);
  if (v16)
  {
    (*(void (**)(uint64_t, _OWORD *))(*(_QWORD *)v16 + 48))(v16, v19);
    return DecodeBuffer::parseNewline(a1);
  }
  else
  {
    v18 = std::__throw_bad_function_call[abi:nn180100]();
    return DecodeBuffer::parseLineSlow(v18);
  }
}

uint64_t DecodeBuffer::parseLineSlow(DecodeBuffer *a1, unint64_t a2, uint64_t a3)
{
  unint64_t v6;
  unsigned __int8 *v7;
  unint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int v20;
  uint64_t v21;
  unsigned __int8 *v23;
  char v24;
  char v25;
  char v26;
  char v27;
  char v28;

  if (a2)
  {
    v6 = 0;
    v7 = (unsigned __int8 *)*((_QWORD *)a1 + 2);
    while (1)
    {
      v8 = *((_QWORD *)a1 + 1) - (_QWORD)v7;
      if (!v8)
        return 0;
      if (a2 - v6 >= 3)
        break;
      if (v8 < 2)
        return 0;
      v15 = *v7;
      if ((*v7 - 97) < 0xBFu)
        return 0;
      v16 = v7[1];
      if ((v16 - 32) > 0x40)
        return 0;
      v27 = ((4 * v15) | ((v16 + 32) >> 4) & 3) ^ 0x80;
      v17 = *(_QWORD *)(a3 + 24);
      if (!v17)
        goto LABEL_36;
      (*(void (**)(uint64_t, char *))(*(_QWORD *)v17 + 48))(v17, &v27);
      v18 = *((_QWORD *)a1 + 2);
      v7 = (unsigned __int8 *)(v18 + 2);
      *((_QWORD *)a1 + 2) = v18 + 2;
      v19 = v6 + 1;
      if (v6 + 1 < a2)
      {
        if (*((unsigned __int8 **)a1 + 1) == v7)
          return 0;
        v20 = *v7;
        if ((v20 - 97) < 0xBFu)
          return 0;
        v28 = ((v20 + 32) >> 2) & 0xF | (16 * *(_BYTE *)(v18 + 1));
        v21 = *(_QWORD *)(a3 + 24);
        if (!v21)
          goto LABEL_36;
        (*(void (**)(uint64_t, char *))(*(_QWORD *)v21 + 48))(v21, &v28);
        v13 = 1;
        v14 = 2;
LABEL_23:
        v7 = (unsigned __int8 *)(*((_QWORD *)a1 + 2) + v13);
        *((_QWORD *)a1 + 2) = v7;
        v19 = v6 + v14;
      }
      v6 = v19;
      if (v19 >= a2)
        goto LABEL_28;
    }
    if (v8 < 4)
      return 0;
    if ((*v7 - 97) < 0xBFu)
      return 0;
    v9 = v7[1];
    if ((v9 - 97) < 0xBFu || v7[2] - 97 < 0xFFFFFFBF || v7[3] - 32 > 0x40)
      return 0;
    v24 = ((4 * *v7) | ((v9 + 32) >> 4) & 3) ^ 0x80;
    v10 = *(_QWORD *)(a3 + 24);
    if (!v10
      || ((*(void (**)(uint64_t, char *))(*(_QWORD *)v10 + 48))(v10, &v24),
          v25 = (16 * *(_BYTE *)(*((_QWORD *)a1 + 2) + 1)) | ((*(unsigned __int8 *)(*((_QWORD *)a1 + 2)
                                                                                                  + 2)
                                                               + 32) >> 2) & 0xF,
          (v11 = *(_QWORD *)(a3 + 24)) == 0)
      || ((*(void (**)(uint64_t, char *))(*(_QWORD *)v11 + 48))(v11, &v25),
          v26 = (*(_BYTE *)(*((_QWORD *)a1 + 2) + 3) + 32) & 0x3F | (*(_BYTE *)(*((_QWORD *)a1 + 2) + 2) << 6),
          (v12 = *(_QWORD *)(a3 + 24)) == 0))
    {
LABEL_36:
      std::__throw_bad_function_call[abi:nn180100]();
      return std::__throw_bad_function_call[abi:nn180100]();
    }
    (*(void (**)(uint64_t, char *))(*(_QWORD *)v12 + 48))(v12, &v26);
    v13 = 4;
    v14 = 3;
    goto LABEL_23;
  }
  v7 = (unsigned __int8 *)*((_QWORD *)a1 + 2);
LABEL_28:
  v23 = (unsigned __int8 *)*((_QWORD *)a1 + 1);
  if (v23 != v7 && *v7 == 96)
    *((_QWORD *)a1 + 2) = ++v7;
  if (v23 != v7 && *v7 == 96)
    *((_QWORD *)a1 + 2) = v7 + 1;
  return DecodeBuffer::parseNewline(a1);
}

uint64_t std::__throw_bad_function_call[abi:nn180100]()
{
  uint64_t v0;
  uint64_t v1;

  std::__libcpp_verbose_abort("bad_function_call was thrown in -fno-exceptions mode");
  return std::__function::__value_func<void ()(unsigned char)>::__value_func[abi:nn180100](v0, v1);
}

uint64_t std::__function::__value_func<void ()(unsigned char)>::__value_func[abi:nn180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(_QWORD *)(a1 + 24) = a1;
      (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a2 + 24) + 24))(*(_QWORD *)(a2 + 24), a1);
    }
    else
    {
      *(_QWORD *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3);
    }
  }
  else
  {
    *(_QWORD *)(a1 + 24) = 0;
  }
  return a1;
}

void TemporaryFile::TemporaryFile(TemporaryFile *this)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  __int128 v6;
  int v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  _OWORD v12[17];
  _OWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_DWORD *)this = -1;
  *((_QWORD *)this + 1) = 0;
  v2 = (_QWORD *)((char *)this + 8);
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "temporaryDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("uudecode.XXXXXXXXXXXXXXXX"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)((char *)v13 + 12) = v6;
  v12[16] = v6;
  v13[0] = v6;
  v12[14] = v6;
  v12[15] = v6;
  v12[12] = v6;
  v12[13] = v6;
  v12[10] = v6;
  v12[11] = v6;
  v12[8] = v6;
  v12[9] = v6;
  v12[6] = v6;
  v12[7] = v6;
  v12[4] = v6;
  v12[5] = v6;
  v12[2] = v6;
  v12[3] = v6;
  v12[0] = v6;
  v12[1] = v6;
  if ((objc_msgSend(v5, "getFileSystemRepresentation:maxLength:", v12, 299) & 1) != 0)
  {
    v7 = mkstemp((char *)v12);
    *(_DWORD *)this = v7;
    if (v7 >= 1)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v12, 0, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)*((_QWORD *)this + 1);
      *((_QWORD *)this + 1) = v8;

      v10 = *(_DWORD *)this;
      if (*((_QWORD *)this + 1))
      {
        *((_QWORD *)this + 2) = fdopen(v10, "w");
      }
      else
      {
        close(v10);
        *(_DWORD *)this = -1;
      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeItemAtURL:error:", *v2, 0);

    }
  }

}

void sub_1ABB42F24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  id *v3;

  _Unwind_Resume(a1);
}

void TemporaryFile::~TemporaryFile(TemporaryFile *this)
{
  FILE *v2;

  v2 = (FILE *)*((_QWORD *)this + 2);
  if (v2)
    fclose(v2);

}

uint64_t OutputBuffer::write(uint64_t this, char a2)
{
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v3 = this;
  v4 = *(_BYTE **)(this + 16);
  if (*(_QWORD *)(this + 24) <= (unint64_t)v4)
  {
    objc_msgSend(*(id *)(this + 8), "setLength:", objc_msgSend(*(id *)(this + 8), "length") + 1000);
    v5 = objc_msgSend(*(id *)(v3 + 8), "mutableBytes");
    v6 = *(void **)(v3 + 8);
    v7 = v5 + *(_QWORD *)v3;
    *(_QWORD *)(v3 + 16) = v7;
    this = objc_msgSend(v6, "length");
    *(_QWORD *)(v3 + 24) = v7 + this;
    v4 = *(_BYTE **)(v3 + 16);
  }
  *v4 = a2;
  ++*(_QWORD *)(v3 + 16);
  ++*(_QWORD *)v3;
  return this;
}

BOOL std::type_info::operator==[abi:nn180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2 == v3)
    return 1;
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3))
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  return 0;
}

__n128 OutputBuffer::write(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  __n128 result;
  __int128 v9;

  v4 = *(_QWORD *)(a1 + 16);
  if (*(_QWORD *)(a1 + 24) < (unint64_t)(v4 + 45))
  {
    objc_msgSend(*(id *)(a1 + 8), "setLength:", objc_msgSend(*(id *)(a1 + 8), "length") + 1000);
    v5 = objc_msgSend(*(id *)(a1 + 8), "mutableBytes");
    v6 = *(void **)(a1 + 8);
    v7 = v5 + *(_QWORD *)a1;
    *(_QWORD *)(a1 + 16) = v7;
    *(_QWORD *)(a1 + 24) = v7 + objc_msgSend(v6, "length");
    v4 = *(_QWORD *)(a1 + 16);
  }
  result = *(__n128 *)a2;
  v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v4 + 29) = *(_OWORD *)(a2 + 29);
  *(__n128 *)v4 = result;
  *(_OWORD *)(v4 + 16) = v9;
  *(_QWORD *)(a1 + 16) += 45;
  *(_QWORD *)a1 += 45;
  return result;
}

void _MFCreateStringWithBytesViaICU_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1ABB13000, a2, OS_LOG_TYPE_ERROR, "_MFCreateStringWithBytesViaICU: cannot process input buffer of length %lu", (uint8_t *)&v2, 0xCu);
}

void MFGetRandomBytes_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_1ABB13000, a2, a3, "*** Unable to open /dev/urandom: %s", (uint8_t *)a2);
}

void MFGetRandomBytes_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_1ABB13000, a2, a3, "*** Failed to read bytes from /dev/urandom: %s", (uint8_t *)a2);
}

void MFGetRandomBytes_cold_3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_1ABB13000, a2, a3, "*** Unexpected EOF on /dev/urandom: %s", (uint8_t *)a2);
}

void __createTransliterator_block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1ABB13000, v0, v1, "MFStringTransform: utrans_openU() failed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __createTransliterator_block_invoke_2_cold_2(int *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1ABB13000, a2, OS_LOG_TYPE_ERROR, "MFStringTransform: utrans_openU() failed (%d).", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_1();
}

void __softBankTransform_block_invoke_cold_1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1ABB13000, log, OS_LOG_TYPE_ERROR, "MFStringTransform: Unable to read bundle.", buf, 2u);
}

void activeContexts_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1ABB13000, a2, a3, "MFStringTransform: Failed to get active CTXPCContexts: %{public}@", a5, a6, a7, a8, 2u);
}

void __activeContexts_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1ABB13000, a2, a3, "MFStringTransform: Failed to create request context for CTXPCContextInfo %p.", a5, a6, a7, a8, 0);
}

void _getFilenameEncodingHint_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_1ABB13000, log, OS_LOG_TYPE_DEBUG, "*** part=%p result=%@", (uint8_t *)&v3, 0x16u);
}

void _mfUnregisterLockOnThisThread_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = MFLogGeneral();
  if (OUTLINED_FUNCTION_3(v0))
  {
    pthread_self();
    OUTLINED_FUNCTION_1_0(&dword_1ABB13000, v1, v2, "#Warning Unlocked lock %@ on thread %p that did not own it", v3, v4, v5, v6, 2u);
  }
  CFShow((CFTypeRef)__threadLockRelations);
  __assert_rtn("_mfUnregisterLockOnThisThread", "NSLockAdditions.m", 231, "0");
}

void _mfUnregisterLockOnThisThread_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = MFLogGeneral();
  if (OUTLINED_FUNCTION_3(v0))
  {
    pthread_self();
    OUTLINED_FUNCTION_1_0(&dword_1ABB13000, v1, v2, "#Warning No thread set for %@ on thread %p", v3, v4, v5, v6, 2u);
  }
  CFShow((CFTypeRef)__threadLockRelations);
  __assert_rtn("_mfUnregisterLockOnThisThread", "NSLockAdditions.m", 221, "threadSet");
}

void DecodeBuffer::parseLineFast()
{
  __assert_rtn("parseLineFast", "uudecoder.mm", 192, "DecodeBuffer::byteCountNeededForSIMD <= remainingCount()");
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80310](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80318](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80320](c, data, *(_QWORD *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1E0C97C98](allocator, size, hint);
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x1E0C97CA8](allocator, context);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
  MEMORY[0x1E0C97CB0](allocator, ptr);
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x1E0C97CC0]();
}

void CFAllocatorSetDefault(CFAllocatorRef allocator)
{
  MEMORY[0x1E0C97CE0](allocator);
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
  MEMORY[0x1E0C97CE8](theArray, otherArray, otherRange.location, otherRange.length);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFIndex CFArrayBSearchValues(CFArrayRef theArray, CFRange range, const void *value, CFComparatorFunction comparator, void *context)
{
  return MEMORY[0x1E0C97D08](theArray, range.location, range.length, value, comparator, context);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D50](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D78](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
  MEMORY[0x1E0C97DA8](theArray, range.location, range.length, values);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x1E0C97DB0](theArray, idx, value);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x1E0C97DC0](theArray, idx);
}

void CFCharacterSetAddCharactersInRange(CFMutableCharacterSetRef theSet, CFRange theRange)
{
  MEMORY[0x1E0C982A0](theSet, theRange.location, theRange.length);
}

CFCharacterSetRef CFCharacterSetCreateCopy(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFCharacterSetRef)MEMORY[0x1E0C982B8](alloc, theSet);
}

CFMutableCharacterSetRef CFCharacterSetCreateMutable(CFAllocatorRef alloc)
{
  return (CFMutableCharacterSetRef)MEMORY[0x1E0C982C8](alloc);
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInString(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFCharacterSetRef)MEMORY[0x1E0C982E8](alloc, theString);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x1E0C982F0](theSetIdentifier);
}

void CFCharacterSetInvert(CFMutableCharacterSetRef theSet)
{
  MEMORY[0x1E0C98318](theSet);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x1E0C98320](theSet, theChar);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1E0C98350](cf);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x1E0C98390](theData, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983B8](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

void CFDataDeleteBytes(CFMutableDataRef theData, CFRange range)
{
  MEMORY[0x1E0C983D0](theData, range.location, range.length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1E0C98408](theData);
}

void CFDataIncreaseLength(CFMutableDataRef theData, CFIndex extraLength)
{
  MEMORY[0x1E0C98420](theData, extraLength);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
  MEMORY[0x1E0C98430](theData, length);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x1E0C985A0](theDict, keys, values);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1E0C985C8](theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
  MEMORY[0x1E0C985D8](theDict);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1E0C98CB0](mode, returnAfterSourceHandled, seconds);
}

void CFShow(CFTypeRef obj)
{
  MEMORY[0x1E0C98DF8](obj);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
  MEMORY[0x1E0C98EE8](theString, chars, numChars);
}

CFStringRef CFStringConvertEncodingToIANACharSetName(CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98F28](*(_QWORD *)&encoding);
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return MEMORY[0x1E0C98F30](*(_QWORD *)&encoding);
}

CFStringEncoding CFStringConvertIANACharSetNameToEncoding(CFStringRef theString)
{
  return MEMORY[0x1E0C98F40](theString);
}

CFStringEncoding CFStringConvertNSStringEncodingToEncoding(unint64_t encoding)
{
  return MEMORY[0x1E0C98F48](encoding);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x1E0C98F80](alloc, theString, *(_QWORD *)&encoding, lossByte);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F98](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FE0](alloc, cStr, *(_QWORD *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithCharactersNoCopy(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FF8](alloc, chars, numChars, contentsDeallocator);
}

void CFStringDelete(CFMutableStringRef theString, CFRange range)
{
  MEMORY[0x1E0C99038](theString, range.location, range.length);
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1E0C99060](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1E0C99080](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1E0C990C8](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFStringEncoding CFStringGetMostCompatibleMacStringEncoding(CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99130](*(_QWORD *)&encoding);
}

CFRange CFStringGetRangeOfComposedCharactersAtIndex(CFStringRef theString, CFIndex theIndex)
{
  CFIndex v2;
  CFIndex v3;
  CFRange result;

  v2 = MEMORY[0x1E0C99160](theString, theIndex);
  result.length = v3;
  result.location = v2;
  return result;
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return MEMORY[0x1E0C99168]();
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

Boolean CFStringIsEncodingAvailable(CFStringEncoding encoding)
{
  return MEMORY[0x1E0C991C0](*(_QWORD *)&encoding);
}

void CFStringReplace(CFMutableStringRef theString, CFRange range, CFStringRef replacement)
{
  MEMORY[0x1E0C991F0](theString, range.location, range.length, replacement);
}

void CFStringReplaceAll(CFMutableStringRef theString, CFStringRef replacement)
{
  MEMORY[0x1E0C991F8](theString, replacement);
}

uint64_t CPFileBuildDirectoriesToPath()
{
  return MEMORY[0x1E0CFA280]();
}

uint64_t ECGetNextHeaderFromDataInRange()
{
  return MEMORY[0x1E0D1E4E0]();
}

uint64_t EFAtomicObjectLoad()
{
  return MEMORY[0x1E0D1ECC0]();
}

uint64_t EFAtomicObjectRelease()
{
  return MEMORY[0x1E0D1ECC8]();
}

uint64_t EFAtomicObjectSetIfNil()
{
  return MEMORY[0x1E0D1ECE0]();
}

uint64_t EFIsRunningUnitTests()
{
  return MEMORY[0x1E0D1ED98]();
}

uint64_t EFStringWithInt()
{
  return MEMORY[0x1E0D1EE30]();
}

uint64_t EFStringWithInt64()
{
  return MEMORY[0x1E0D1EE38]();
}

uint64_t MFLogGeneral()
{
  return MEMORY[0x1E0D4D800]();
}

NSHashTable *__cdecl NSCreateHashTable(NSHashTableCallBacks *callBacks, NSUInteger capacity)
{
  return (NSHashTable *)MEMORY[0x1E0CB28F0](callBacks, capacity);
}

void NSDeallocateMemoryPages(void *ptr, NSUInteger bytes)
{
  MEMORY[0x1E0CB2918](ptr, bytes);
}

void *__cdecl NSHashGet(NSHashTable *table, const void *pointer)
{
  return (void *)MEMORY[0x1E0CB2BD0](table, pointer);
}

void NSHashInsert(NSHashTable *table, const void *pointer)
{
  MEMORY[0x1E0CB2BD8](table, pointer);
}

void *__cdecl NSHashInsertIfAbsent(NSHashTable *table, const void *pointer)
{
  return (void *)MEMORY[0x1E0CB2BE0](table, pointer);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB2C00]();
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

NSUInteger NSRoundUpToMultipleOfPageSize(NSUInteger bytes)
{
  return MEMORY[0x1E0CB3170](bytes);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _ECIsNetworkActivityAllowed()
{
  return MEMORY[0x1E0D1E7F0]();
}

uint64_t _NSMethodExceptionProem()
{
  return MEMORY[0x1E0CB3C38]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void std::__libcpp_verbose_abort(const char *__format, ...)
{
  MEMORY[0x1E0DE4930](__format);
}

void operator delete(void *__p)
{
  off_1E5AA07F0(__p);
}

uint64_t operator delete()
{
  return off_1E5AA07F8();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E5AA0800(__sz);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

uint64_t __memmove_chk()
{
  return MEMORY[0x1E0C80B70]();
}

uint64_t __memset_chk()
{
  return MEMORY[0x1E0C80B78]();
}

int __snprintf_chk(char *a1, size_t a2, int a3, size_t a4, const char *a5, ...)
{
  return MEMORY[0x1E0C80BE0](a1, a2, *(_QWORD *)&a3, a4, a5);
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C70](*(_QWORD *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C78](*(_QWORD *)&a1);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
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

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

uint64_t dirstat_np()
{
  return MEMORY[0x1E0C82BB8]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x1E0C82CA0](data, applier);
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CC0](data1, data2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x1E0C83318](*(_QWORD *)&a1, a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1E0C83370](a1);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1E0C83590](*(_QWORD *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1E0C83778]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C83840](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

char *__cdecl index(const char *a1, int a2)
{
  return (char *)MEMORY[0x1E0C83948](a1, *(_QWORD *)&a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C83C40](a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1E0C841A0](a1);
}

char *__cdecl mktemp(char *a1)
{
  return (char *)MEMORY[0x1E0C841C0](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x1E0DE7D00](location);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D18](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1E0C84D28](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D30](a1);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x1E0C84D38](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1E0C84D48](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1E0C84E68](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

int putc(int a1, FILE *a2)
{
  return MEMORY[0x1E0C84F48](*(_QWORD *)&a1, a2);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1E0C85030](__ptr, __size);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return MEMORY[0x1E0C850C0](path, state, *(_QWORD *)&flags);
}

int removexattr(const char *path, const char *name, int options)
{
  return MEMORY[0x1E0C850F0](path, name, *(_QWORD *)&options);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C853A0](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

void srandomdev(void)
{
  MEMORY[0x1E0C85490]();
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C85500](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1E0C85590](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1E0C855C8](__big, __little, __len);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85698](__str, __endptr, *(_QWORD *)&__base);
}

int truncate(const char *a1, off_t a2)
{
  return MEMORY[0x1E0C85980](a1, a2);
}

uint64_t ucnv_close()
{
  return MEMORY[0x1E0DE5E98]();
}

uint64_t ucnv_open()
{
  return MEMORY[0x1E0DE5F20]();
}

uint64_t ucnv_setFallback()
{
  return MEMORY[0x1E0DE5F40]();
}

uint64_t ucnv_toUChars()
{
  return MEMORY[0x1E0DE5F60]();
}

uint64_t ucsdet_close()
{
  return MEMORY[0x1E0DE6058]();
}

uint64_t ucsdet_detectAll()
{
  return MEMORY[0x1E0DE6068]();
}

uint64_t ucsdet_enableInputFilter()
{
  return MEMORY[0x1E0DE6070]();
}

uint64_t ucsdet_getConfidence()
{
  return MEMORY[0x1E0DE6078]();
}

uint64_t ucsdet_getName()
{
  return MEMORY[0x1E0DE6080]();
}

uint64_t ucsdet_getUChars()
{
  return MEMORY[0x1E0DE6088]();
}

uint64_t ucsdet_open()
{
  return MEMORY[0x1E0DE6090]();
}

uint64_t ucsdet_setText()
{
  return MEMORY[0x1E0DE6098]();
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

uint64_t utrans_close()
{
  return MEMORY[0x1E0DE6AC8]();
}

uint64_t utrans_openU()
{
  return MEMORY[0x1E0DE6AD0]();
}

uint64_t utrans_transUChars()
{
  return MEMORY[0x1E0DE6AE0]();
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

