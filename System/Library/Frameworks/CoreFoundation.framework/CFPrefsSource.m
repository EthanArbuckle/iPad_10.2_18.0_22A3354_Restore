@implementation CFPrefsSource

- (void)_notifyObserversOfChangeFromValuesForKeys:(id)a3 toValuesForKeys:(id)a4
{
  _QWORD v4[7];

  v4[6] = *MEMORY[0x1E0C80C00];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__CFPrefsSource__notifyObserversOfChangeFromValuesForKeys_toValuesForKeys___block_invoke;
  v4[3] = &unk_1E1333058;
  v4[4] = a3;
  v4[5] = a4;
  -[CFPrefsSource forEachObserver:]((uint64_t)self, (uint64_t)v4);
}

- (void)copyValueForKey:(__CFString *)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = -[CFPrefsSource alreadylocked_copyValueForKey:](self, "alreadylocked_copyValueForKey:", a3);
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)alreadylocked_copyValueForKey:(__CFString *)a3
{
  __CFDictionary *dict;
  const void *Value;
  NSObject *v7;
  __CFString *v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  const void *v13;
  __int16 v14;
  __CFString *v15;
  __int16 v16;
  __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  dict = self->_dict;
  if (dict)
    Value = CFDictionaryGetValue(dict, a3);
  else
    Value = 0;
  v7 = _CFPrefsClientLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = -[CFPrefsSource copyOSLogDescription](self, "copyOSLogDescription");
    if (Value)
    {
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
      v9 = _CFPrefsClientLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v12 = 138478339;
        v13 = Value;
        v14 = 2114;
        v15 = a3;
        v16 = 2114;
        v17 = v8;
        _os_log_debug_impl(&dword_182A8C000, v9, OS_LOG_TYPE_DEBUG, "looked up value %{private}@ for key %{public}@ in %{public}@", (uint8_t *)&v12, 0x20u);
      }
      _CFSetTSD(0xFu, 0, 0);
    }
    else
    {
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
      v10 = _CFPrefsClientLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[CFPrefsSource alreadylocked_copyValueForKey:].cold.1();
      _CFSetTSD(0xFu, 0, 0);
    }
    CFRelease(v8);
  }
  if (Value)
    return (void *)CFRetain(Value);
  else
    return 0;
}

- (uint64_t)alreadylocked_addPreferencesObserver:(uint64_t)a1
{
  __CFPrefsWeakObservers *v4;

  if (!a1 || !a2)
    return 0;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 52));
  v4 = *(__CFPrefsWeakObservers **)(a1 + 24);
  if (!v4)
  {
    v4 = objc_alloc_init(__CFPrefsWeakObservers);
    *(_QWORD *)(a1 + 24) = v4;
  }
  -[__CFPrefsWeakObservers addObject:](v4, "addObject:", a2);
  return objc_msgSend((id)a1, "alreadylocked_updateObservingRemoteChanges");
}

- (int)alreadylocked_updateObservingRemoteChanges
{
  return 0;
}

- (id)alreadylocked_createObserverUpdateMessageWithOperation:(int)a3 forRole:(int *)a4
{
  return 0;
}

- (os_unfair_lock_s)copyDictionary
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;
  uint64_t v3;

  if (result)
  {
    v1 = result;
    v2 = result + 13;
    os_unfair_lock_lock(result + 13);
    v3 = -[os_unfair_lock_s alreadylocked_copyDictionary](v1, "alreadylocked_copyDictionary");
    os_unfair_lock_unlock(v2);
    return (os_unfair_lock_s *)v3;
  }
  return result;
}

- (void)mergeIntoDictionary:(__CFDictionary *)a3 sourceDictionary:(__CFDictionary *)a4 cloudKeyEvaluator:(id)a5
{
  os_unfair_lock_s *p_lock;
  __CFDictionary *v9;
  __CFDictionary *v10;
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v9 = -[CFPrefsSource alreadylocked_copyDictionary](self, "alreadylocked_copyDictionary");
  if (v9)
  {
    v10 = v9;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __72__CFPrefsSource_mergeIntoDictionary_sourceDictionary_cloudKeyEvaluator___block_invoke;
    v11[3] = &unk_1E1333080;
    v11[5] = a3;
    v11[6] = a4;
    v11[4] = self;
    _CFPrefsDictionaryApplyBlock(v9, v11);
    CFRelease(v10);
  }
  os_unfair_lock_unlock(p_lock);
}

- (__CFDictionary)alreadylocked_copyDictionary
{
  __CFDictionary *dict;

  os_unfair_lock_assert_owner(&self->_lock);
  dict = self->_dict;
  if (dict && CFDictionaryGetCount(dict) >= 1)
    return CFDictionaryCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, self->_dict);
  else
    return 0;
}

void __72__CFPrefsSource_mergeIntoDictionary_sourceDictionary_cloudKeyEvaluator___block_invoke(uint64_t a1, const void *a2, const void *a3)
{
  __CFDictionary *v5;

  CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 40), a2, a3);
  v5 = *(__CFDictionary **)(a1 + 48);
  if (v5)
    CFDictionaryAddValue(v5, a2, *(const void **)(a1 + 32));
}

- (void)forEachObserver:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  id *v11;
  id *v12;
  uint64_t v13;
  CFStringRef v14;
  NSException *v15;
  size_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 52);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 52));
    v5 = *(void **)(a1 + 24);
    if (v5)
    {
      v6 = objc_msgSend(v5, "approximateCount");
      v8 = v6;
      if (v6 >> 60)
      {
        v14 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v6);
        v15 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v14, 0);
        CFRelease(v14);
        objc_exception_throw(v15);
      }
      if (v6 <= 1)
        v6 = 1;
      v9 = MEMORY[0x1E0C80A78](v6, v7);
      v11 = (id *)((char *)&v16 - v10);
      v16 = 0;
      if (v8 >= 0x101)
      {
        v11 = (id *)_CFCreateArrayStorage(v9, 0, &v16);
        v12 = v11;
      }
      else
      {
        v12 = 0;
      }
      v13 = objc_msgSend(*(id *)(a1 + 24), "borrowObjects:count:", v11, v8, v16, v17);
      os_unfair_lock_unlock(v4);
      for (; v13; --v13)
      {
        (*(void (**)(uint64_t, id))(a2 + 16))(a2, *v11);

      }
      free(v12);
    }
    else
    {
      os_unfair_lock_unlock(v4);
    }
  }
}

- (BOOL)synchronize
{
  return 1;
}

uint64_t __83__CFPrefsSource_setValues_forKeys_count_copyValues_removeValuesForKeys_count_from___block_invoke(uint64_t result, void *a2)
{
  uint64_t v3;

  if (*(void **)(result + 32) != a2)
  {
    v3 = result;
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(a2, "handleChangeNotificationForDomainIdentifier:isRemote:", objc_msgSend(*(id *)(v3 + 40), "domainIdentifier"), 0);
  }
  return result;
}

uint64_t __75__CFPrefsSource__notifyObserversOfChangeFromValuesForKeys_toValuesForKeys___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_notifyObserversOfChangeFromValuesForKeys:toValuesForKeys:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (__CFString)domainIdentifier
{
  return CFSTR("Volatile");
}

- (id)createRequestNewContentMessageForDaemon:(int)a3
{
  os_unfair_lock_assert_owner(&self->_lock);
  return 0;
}

- (BOOL)managed
{
  return 0;
}

- (id)copyVolatileSourceWithContainingPreferences:(id)a3
{
  os_unfair_lock_s *p_lock;
  CFPrefsSource *v6;
  __CFDictionary *dict;
  CFMutableDictionaryRef MutableCopy;
  __CFDictionary *v9;
  __CFDictionary *v10;
  unint64_t v11;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[CFPrefsSource isVolatile](self, "isVolatile"))
  {
    v6 = -[CFPrefsSource initWithContainingPreferences:]([CFPrefsSource alloc], "initWithContainingPreferences:", a3);
    dict = self->_dict;
    if (dict)
    {
      MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, dict);
      if (MutableCopy)
      {
        v9 = MutableCopy;
        v10 = v6->_dict;
        if (v10)
          CFRelease(v10);
        v6->_dict = v9;
      }
    }
    v11 = atomic_load((unint64_t *)&self->_generationCount);
    atomic_store(v11, (unint64_t *)&v6->_generationCount);
  }
  else
  {
    v6 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (CFPrefsSource)initWithContainingPreferences:(id)a3
{
  CFPrefsSource *result;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)CFPrefsSource;
  result = -[CFPrefsSource init](&v5, sel_init);
  if (result)
  {
    result->_lock._os_unfair_lock_opaque = 0;
    atomic_store((unint64_t)&sentinelGeneration, (unint64_t *)&result->shmemEntry);
    result->_containingPreferences = (_CFXPreferences *)a3;
    result->_isSearchList = 0;
  }
  return result;
}

- (void)setValues:(uint64_t)a3 forKeys:(unint64_t)a4 count:(int)a5 copyValues:(uint64_t)a6 from:
{
  if (a1)
    -[CFPrefsSource setValues:forKeys:count:copyValues:removeValuesForKeys:count:from:](a1, a2, a3, a4, a5, 0, 0, a6);
}

- (void)setValue:(uint64_t)a3 forKey:(uint64_t)a4 from:
{
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = a3;
    v5[0] = a2;
    -[CFPrefsSource setValues:forKeys:count:copyValues:removeValuesForKeys:count:from:](a1, (uint64_t)v5, (uint64_t)&v4, 1uLL, 1, 0, 0, a4);
  }
}

- (void)setValues:(uint64_t)a3 forKeys:(unint64_t)a4 count:(int)a5 copyValues:(uint64_t)a6 removeValuesForKeys:(unint64_t)a7 count:(uint64_t)a8 from:
{
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  CFTypeRef *v23;
  uint64_t v24;
  const __CFString *DeepCopyOfValueForKey;
  os_unfair_lock_s *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t i;
  CFStringRef v30;
  NSException *v31;
  CFStringRef v32;
  NSException *v33;
  _QWORD v34[2];
  CFTypeRef *v35;
  char *v36;
  uint64_t v37;
  _QWORD v38[6];
  size_t v39;
  size_t v40[2];

  v37 = a8;
  v40[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  if (a7 >> 60)
  {
    v30 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), a7);
    v31 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v30, 0);
    CFRelease(v30);
    objc_exception_throw(v31);
  }
  v34[1] = v34;
  if (a7 <= 1)
    v15 = 1;
  else
    v15 = a7;
  v16 = MEMORY[0x1E0C80A78](v15, a2);
  v18 = (char *)v34 - v17;
  if (a7 > 0x100)
  {
    v40[0] = 0;
    v18 = (char *)_CFCreateArrayStorage(v16, 1, v40);
    v36 = v18;
  }
  else
  {
    bzero((char *)v34 - v17, 8 * v16);
    v36 = 0;
    v40[0] = 0;
  }
  if (a4 >> 60)
  {
    v32 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), a4);
    v33 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v32, 0);
    CFRelease(v32);
    objc_exception_throw(v33);
  }
  if (a4 <= 1)
    v20 = 1;
  else
    v20 = a4;
  v21 = MEMORY[0x1E0C80A78](v20, v19);
  v23 = (CFTypeRef *)((char *)v34 - v22);
  v39 = 0;
  if (a4 >= 0x101)
  {
    v23 = (CFTypeRef *)_CFCreateArrayStorage(v21, 0, &v39);
    v35 = v23;
    goto LABEL_17;
  }
  if (a4)
  {
    v35 = 0;
LABEL_17:
    v24 = 0;
    do
    {
      DeepCopyOfValueForKey = *(const __CFString **)(a2 + 8 * v24);
      if (DeepCopyOfValueForKey)
      {
        if (a5)
          DeepCopyOfValueForKey = createDeepCopyOfValueForKey(DeepCopyOfValueForKey, *(_QWORD *)(a3 + 8 * v24));
        else
          DeepCopyOfValueForKey = (const __CFString *)CFRetain(DeepCopyOfValueForKey);
      }
      v23[v24++] = DeepCopyOfValueForKey;
    }
    while (a4 != v24);
    v26 = a1 + 13;
    os_unfair_lock_lock(a1 + 13);
    v27 = a3;
    v28 = v37;
    -[os_unfair_lock_s alreadylocked_setPrecopiedValues:forKeys:count:from:](a1, "alreadylocked_setPrecopiedValues:forKeys:count:from:", v23, v27, a4, v37);
    if (!a7)
      goto LABEL_27;
    goto LABEL_26;
  }
  v26 = a1 + 13;
  os_unfair_lock_lock(a1 + 13);
  v35 = 0;
  v28 = v37;
  if (a7)
LABEL_26:
    -[os_unfair_lock_s alreadylocked_setPrecopiedValues:forKeys:count:from:](a1, "alreadylocked_setPrecopiedValues:forKeys:count:from:", v18, a6, a7, v28);
LABEL_27:
  os_unfair_lock_unlock(v26);
  for (i = a4; i; --i)
  {
    if (*v23)
      CFRelease(*v23);
    ++v23;
  }
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __83__CFPrefsSource_setValues_forKeys_count_copyValues_removeValuesForKeys_count_from___block_invoke;
  v38[3] = &unk_1E1333058;
  v38[4] = v28;
  v38[5] = a1;
  -[CFPrefsSource forEachObserver:]((uint64_t)a1, (uint64_t)v38);
  free(v35);
  free(v36);
}

- (void)alreadylocked_setPrecopiedValues:(const void *)a3 forKeys:(const __CFString *)a4 count:(int64_t)a5 from:(id)a6
{
  const __CFString *v10;
  const void *v11;
  __CFDictionary *dict;
  NSObject *v13;
  __CFString *v14;
  NSObject *v15;
  int64_t *p_generationCount;
  unint64_t v17;
  uint8_t buf[4];
  const void *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_dict)
    self->_dict = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (a5 >= 1)
  {
    do
    {
      v10 = *a4;
      v11 = *a3;
      dict = self->_dict;
      if (*a3)
        CFDictionarySetValue(dict, *a4, *a3);
      else
        CFDictionaryRemoveValue(dict, *a4);
      v13 = _CFPrefsClientLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v14 = -[CFPrefsSource copyOSLogDescription](self, "copyOSLogDescription");
        _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
        v15 = _CFPrefsClientLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138478339;
          v19 = v11;
          v20 = 2113;
          v21 = v10;
          v22 = 2114;
          v23 = v14;
          _os_log_debug_impl(&dword_182A8C000, v15, OS_LOG_TYPE_DEBUG, "setting new value %{private}@ for key %{private}@ in %{public}@", buf, 0x20u);
        }
        _CFSetTSD(0xFu, 0, 0);
        CFRelease(v14);
      }
      ++a3;
      ++a4;
      --a5;
    }
    while (a5);
    p_generationCount = &self->_generationCount;
    do
      v17 = __ldaxr((unint64_t *)p_generationCount);
    while (__stlxr(v17 + 1, (unint64_t *)p_generationCount));
  }
}

- (BOOL)isVolatile
{
  return 1;
}

- (__CFString)copyOSLogDescription
{
  const char *ClassName;
  __CFString *v4;
  __CFString *v5;
  _BOOL4 v6;
  __CFString *v7;
  unsigned int *v8;
  const char *v9;
  unsigned int v10;
  unsigned int v11;
  const char *v12;

  ClassName = object_getClassName(self);
  v4 = -[CFPrefsSource domainIdentifier](self, "domainIdentifier");
  v5 = -[CFPrefsSource userIdentifier](self, "userIdentifier");
  v6 = -[CFPrefsSource isByHost](self, "isByHost");
  v7 = -[CFPrefsSource container](self, "container");
  v8 = (unsigned int *)atomic_load((unint64_t *)&self->shmemEntry);
  v9 = "No";
  if (v8 && ((v10 = atomic_load(v8), v10 == -1) || (v11 = atomic_load(&self->lastKnownShmemState), v10 == v11)))
    v12 = "No";
  else
    v12 = "Yes";
  if (v6)
    v9 = "Yes";
  return (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%s<%p> (Domain: %@, User: %@, ByHost: %s, Container: %@, Contents Need Refresh: %s)"), ClassName, self, v4, v5, v9, v7, v12);
}

- (void)dealloc
{
  __CFDictionary *dict;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  dict = self->_dict;
  if (dict)
    CFRelease(dict);
  self->_dict = 0;

  v4.receiver = self;
  v4.super_class = (Class)CFPrefsSource;
  -[CFPrefsSource dealloc](&v4, sel_dealloc);
}

- (os_unfair_lock_s)copyKeyList
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;
  uint64_t v3;

  if (result)
  {
    v1 = result;
    v2 = result + 13;
    os_unfair_lock_lock(result + 13);
    v3 = -[os_unfair_lock_s alreadylocked_copyKeyList](v1, "alreadylocked_copyKeyList");
    os_unfair_lock_unlock(v2);
    return (os_unfair_lock_s *)v3;
  }
  return result;
}

- (__CFArray)alreadylocked_copyKeyList
{
  __CFDictionary *v2;
  const __CFDictionary *v3;
  unint64_t Count;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  const void **v9;
  const void **v10;
  __CFArray *v12;
  CFStringRef v13;
  NSException *v14;
  size_t v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v2 = -[CFPrefsSource alreadylocked_copyDictionary](self, "alreadylocked_copyDictionary");
  if (!v2)
    return CFArrayCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, 0, &kCFTypeArrayCallBacks);
  v3 = v2;
  Count = CFDictionaryGetCount(v2);
  v6 = Count;
  if (Count >> 60)
  {
    v13 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), Count);
    v14 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v13, 0);
    CFRelease(v13);
    objc_exception_throw(v14);
  }
  if (Count <= 1)
    Count = 1;
  v7 = MEMORY[0x1E0C80A78](Count, v5);
  v9 = (const void **)((char *)v15 - v8);
  v15[0] = 0;
  if (v6 >= 0x101)
  {
    v9 = (const void **)_CFCreateArrayStorage(v7, 0, v15);
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }
  CFDictionaryGetKeysAndValues(v3, v9, 0);
  v12 = CFArrayCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, v9, v6, &kCFTypeArrayCallBacks);
  CFRelease(v3);
  free(v10);
  return v12;
}

- (uint64_t)alreadylocked_removePreferencesObserver:(uint64_t)a1
{
  if (!a1 || !a2)
    return 0;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 52));
  objc_msgSend(*(id *)(a1 + 24), "removeObject:", a2);
  return objc_msgSend((id)a1, "alreadylocked_updateObservingRemoteChanges");
}

- (void)replaceAllValuesWithValues:(uint64_t)a3 forKeys:(unint64_t)a4 count:(uint64_t)a5 from:
{
  os_unfair_lock_s *v9;
  const __CFArray *v10;
  unint64_t Count;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const void **v18;
  const void **v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  CFTypeRef *v29;
  const void **v30;
  uint64_t v31;
  const __CFString *v32;
  int v33;
  const void **v34;
  uint64_t v35;
  CFStringRef v36;
  NSException *v37;
  CFStringRef v38;
  NSException *v39;
  char *v40;
  uint64_t v41;
  void **v42;
  CFTypeRef *v43;
  os_unfair_lock_t v44;
  const __CFArray *v45;
  size_t v46;
  size_t v47;
  size_t v48[2];
  CFRange v49;

  v48[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v41 = a5;
  v9 = a1 + 13;
  os_unfair_lock_lock(a1 + 13);
  v10 = (const __CFArray *)-[os_unfair_lock_s alreadylocked_copyKeyList](a1, "alreadylocked_copyKeyList");
  v44 = v9;
  os_unfair_lock_unlock(v9);
  v45 = v10;
  Count = CFArrayGetCount(v10);
  v13 = Count;
  if (Count >> 60)
  {
    v36 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), Count);
    v37 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v36, 0);
    CFRelease(v36);
    objc_exception_throw(v37);
  }
  if (Count <= 1)
    v14 = 1;
  else
    v14 = Count;
  if (Count >= 0x101)
    v15 = 1;
  else
    v15 = v14;
  v16 = 8 * v15;
  MEMORY[0x1E0C80A78](Count, v12);
  v18 = (const void **)((char *)&v40 - v17);
  v48[0] = 0;
  if (v13 >= 0x101)
  {
    v18 = (const void **)_CFCreateArrayStorage(v14, 0, v48);
    v19 = v18;
  }
  else
  {
    v19 = 0;
  }
  v49.location = 0;
  v49.length = v13;
  CFArrayGetValues(v45, v49, v18);
  v42 = (void **)&v40;
  MEMORY[0x1E0C80A78](v20, v21);
  v22 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v13 > 0x100)
  {
    v47 = 0;
    v24 = (char *)_CFCreateArrayStorage(v14, 1, &v47);
  }
  else
  {
    bzero(v22, 8 * v14);
    v24 = 0;
    v47 = 0;
  }
  if (v13 >= 0x101)
    v25 = v24;
  else
    v25 = v22;
  if (a4 >> 60)
  {
    v40 = v24;
    v38 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), a4);
    v39 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSGenericException"), v38, 0);
    CFRelease(v38);
    objc_exception_throw(v39);
  }
  if (a4 <= 1)
    v26 = 1;
  else
    v26 = a4;
  v27 = MEMORY[0x1E0C80A78](v26, v23);
  v29 = (CFTypeRef *)((char *)&v40 - v28);
  v46 = 0;
  if (a4 >= 0x101)
  {
    v40 = v24;
    v29 = (CFTypeRef *)_CFCreateArrayStorage(v27, 0, &v46);
    v30 = v19;
    v43 = v29;
LABEL_26:
    v31 = 0;
    do
    {
      v32 = *(const __CFString **)(a2 + 8 * v31);
      if (v32)
        v29[v31] = createDeepCopyOfValueForKey(v32, *(_QWORD *)(a3 + 8 * v31));
      ++v31;
    }
    while (a4 != v31);
    v33 = 1;
    v19 = v30;
    v24 = v40;
    goto LABEL_31;
  }
  v43 = 0;
  if (a4)
  {
    v40 = v24;
    v30 = v19;
    goto LABEL_26;
  }
  v33 = 0;
LABEL_31:
  os_unfair_lock_lock(v44);
  v34 = v18;
  v35 = v41;
  -[os_unfair_lock_s alreadylocked_setPrecopiedValues:forKeys:count:from:](a1, "alreadylocked_setPrecopiedValues:forKeys:count:from:", v25, v34, v13, v41);
  -[os_unfair_lock_s alreadylocked_setPrecopiedValues:forKeys:count:from:](a1, "alreadylocked_setPrecopiedValues:forKeys:count:from:", v29, a3, a4, v35);
  os_unfair_lock_unlock(v44);
  CFRelease(v45);
  if (v33)
  {
    do
    {
      if (*v29)
        CFRelease(*v29);
      ++v29;
      --a4;
    }
    while (a4);
  }
  free(v43);
  free(v24);
  free(v19);
}

- (void)removeAllValues_from:(os_unfair_lock_s *)a1
{
  if (a1)
    -[CFPrefsSource replaceAllValuesWithValues:forKeys:count:from:](a1, 0, 0, 0, a2);
}

- (BOOL)alreadylocked_requestNewData
{
  if (a1)
    os_unfair_lock_assert_owner(a1 + 13);
  return a1 != 0;
}

- (uint64_t)enabled
{
  return 0;
}

- (void)fullCloudSynchronizeWithCompletionHandler:(id)a3
{
  abort();
}

- (int64_t)alreadylocked_generationCount
{
  return atomic_load((unint64_t *)&self->_generationCount);
}

- (int64_t)generationCount
{
  return atomic_load((unint64_t *)&self->_generationCount);
}

- (void)lock
{
  os_unfair_lock_lock(&self->_lock);
}

- (void)unlock
{
  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)isDirectModeEnabled
{
  return 0;
}

- (__CFString)userIdentifier
{
  return &stru_1E1337B18;
}

- (BOOL)servedByUserSessionDaemon
{
  return 0;
}

- (BOOL)isByHost
{
  return 0;
}

- (__CFString)container
{
  return &stru_1E1337B18;
}

- (id)description
{
  __CFString *Mutable;
  const char *ClassName;
  __CFString *v5;
  __CFString *v6;
  const char *v7;
  uint64_t v8;
  const __CFDictionary *dict;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  const void **v13;
  size_t v14;
  const __CFString *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  Mutable = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0);
  os_unfair_lock_lock(&self->_lock);
  ClassName = object_getClassName(self);
  v5 = -[CFPrefsSource domainIdentifier](self, "domainIdentifier");
  v6 = -[CFPrefsSource userIdentifier](self, "userIdentifier");
  if (-[CFPrefsSource isByHost](self, "isByHost"))
    v7 = "Yes";
  else
    v7 = "No";
  CFStringAppendFormat(Mutable, 0, CFSTR("%s<%p> (Domain: %@, User: %@, ByHost: %s, Container: %@)"), ClassName, self, v5, v6, v7, -[CFPrefsSource container](self, "container"));
  dict = self->_dict;
  if (dict)
  {
    dict = (const __CFDictionary *)CFDictionaryGetCount(dict);
    v10 = (uint64_t)dict;
  }
  else
  {
    v10 = 0;
  }
  MEMORY[0x1E0C80A78](dict, v8);
  v13 = (const void **)((char *)v17 - v12);
  if (v11 >= 0x200)
    v14 = 512;
  else
    v14 = v11;
  bzero((char *)v17 - v12, v14);
  if (v10 <= 0)
  {
    CFStringAppend(Mutable, CFSTR(" Keys: ["));
  }
  else
  {
    CFDictionaryGetKeysAndValues(self->_dict, v13, 0);
    CFStringAppend(Mutable, CFSTR(" Keys: ["));
    do
    {
      v15 = (const __CFString *)*v13++;
      CFStringAppend(Mutable, v15);
      CFStringAppend(Mutable, CFSTR(", "));
      --v10;
    }
    while (v10);
  }
  CFStringAppend(Mutable, CFSTR("]\n"));
  os_unfair_lock_unlock(&self->_lock);
  return (id)CFAutorelease(Mutable);
}

- (void)alreadylocked_copyValueForKey:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_14();
  _os_log_debug_impl(&dword_182A8C000, v0, OS_LOG_TYPE_DEBUG, "found no value for key %{public}@ in %{public}@", v1, 0x16u);
}

@end
