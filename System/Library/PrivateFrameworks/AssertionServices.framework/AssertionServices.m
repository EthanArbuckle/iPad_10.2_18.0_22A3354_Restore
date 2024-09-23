void BKSProcessAssertionBackgroundTimeRemaining()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D87D68], "currentProcess");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "activeLimitations");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "runTime");

}

void BKSProcessAssertionSetExpirationHandler(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BKSProcessAssertionSetExpirationHandler(__strong dispatch_queue_t, void (^__strong)(void))");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("BKSProcessAssertion.m"), 364, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler != nil"));

  }
  if (BKSProcessAssertionSetExpirationHandler_onceToken != -1)
    dispatch_once(&BKSProcessAssertionSetExpirationHandler_onceToken, &__block_literal_global_1);
  v5 = (void *)MEMORY[0x1B5E0B1E4]();
  v6 = (void *)MEMORY[0x1E0D87D68];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __BKSProcessAssertionSetExpirationHandler_block_invoke_2;
  v15[3] = &unk_1E6169730;
  v7 = v4;
  v17 = v7;
  v8 = v3;
  v16 = v8;
  objc_msgSend(v6, "observeForImminentAssertionsExpiration:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  rbs_shim_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)MEMORY[0x1B5E0B334](v7);
      *(_DWORD *)buf = 138412546;
      v19 = v12;
      v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_1B0792000, v11, OS_LOG_TYPE_DEFAULT, "adding imminent expiration handler: %@, observer %@", buf, 0x16u);

    }
    os_unfair_lock_lock((os_unfair_lock_t)&BKSProcessAssertionSetExpirationHandler_lock);
    objc_msgSend((id)BKSProcessAssertionSetExpirationHandler__observers, "addObject:", v9);
    os_unfair_lock_unlock((os_unfair_lock_t)&BKSProcessAssertionSetExpirationHandler_lock);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      BKSProcessAssertionSetExpirationHandler_cold_1(v11);

  }
  objc_autoreleasePoolPop(v5);

}

void sub_1B0793E7C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id RBSProcessLegacyStateDescriptor()
{
  if (RBSProcessLegacyStateDescriptor_onceToken != -1)
    dispatch_once(&RBSProcessLegacyStateDescriptor_onceToken, &__block_literal_global_3);
  return (id)RBSProcessLegacyStateDescriptor___LegacyDescriptor;
}

const __CFString *NSStringFromBKSProcessErrorCode(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("(unknown)");
  if (a1 == 1)
    v1 = CFSTR("bootstrap-failed");
  if (a1)
    return v1;
  else
    return CFSTR("none");
}

__CFString *NSStringFromBKSProcessExitReason(char a1)
{
  void *v2;
  void *v3;
  __CFString *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if ((a1 & 1) != 0)
  {
    objc_msgSend(v2, "addObject:", CFSTR("voluntary"));
    if ((a1 & 4) == 0)
    {
LABEL_3:
      if ((a1 & 8) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((a1 & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "addObject:", CFSTR("signal"));
  if ((a1 & 8) == 0)
  {
LABEL_4:
    if ((a1 & 2) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(v3, "addObject:", CFSTR("jetsam"));
  if ((a1 & 2) == 0)
  {
LABEL_5:
    if ((a1 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(v3, "addObject:", CFSTR("crash"));
  if ((a1 & 0x10) == 0)
  {
LABEL_6:
    if ((a1 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(v3, "addObject:", CFSTR("fairPlay"));
  if ((a1 & 0x20) == 0)
  {
LABEL_7:
    if ((a1 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_16:
  objc_msgSend(v3, "addObject:", CFSTR("badSignature"));
  if ((a1 & 0x40) != 0)
LABEL_8:
    objc_msgSend(v3, "addObject:", CFSTR("unknown"));
LABEL_9:
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("(none)");
  }

  return v4;
}

void sub_1B079803C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t BKSTerminationAssertionActiveEfficacyForBundleIdentifier(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  __observerManager();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "efficacyForBundleID:", v1);

  return v3;
}

id __observerManager()
{
  if (__observerManager_onceToken != -1)
    dispatch_once(&__observerManager_onceToken, &__block_literal_global_2);
  return (id)__observerManager___manager;
}

uint64_t BKSTerminationAssertionHeldForBundleIdentifier(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  __observerManager();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasTerminationAssertionForBundleID:", v1);

  return v3;
}

void BKSTerminationAssertionRegisterObserver(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  __observerManager();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:", v1);

}

void BKSTerminationAssertionUnregisterObserver(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  __observerManager();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:", v1);

}

void sub_1B079945C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Block_object_dispose((const void *)(v17 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x1B5E0B334](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy__46(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__47(uint64_t a1)
{

}

void ____observerManager_block_invoke()
{
  BKSTerminationAssertionObserverManager *v0;
  void *v1;

  v0 = objc_alloc_init(BKSTerminationAssertionObserverManager);
  v1 = (void *)__observerManager___manager;
  __observerManager___manager = (uint64_t)v0;

}

uint64_t _BKSWatchdogAssertionGetTypeID()
{
  if (_BKSWatchdogAssertionGetTypeID_once != -1)
    dispatch_once(&_BKSWatchdogAssertionGetTypeID_once, &__block_literal_global_4);
  return _BKSWatchdogAssertionGetTypeID_typeID;
}

void _BKSWatchdogAssertionDestroy(uint64_t a1)
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)&watchdogLock);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 24));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)assertionsByIdentifier, "objectForKey:", v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");
  objc_msgSend((id)assertionsByIdentifier, "removeObjectForKey:", v3);
  os_unfair_lock_unlock((os_unfair_lock_t)&watchdogLock);

}

BOOL _BKSWatchdogAssertionEqual(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

CFStringRef _BKSWatchdogAssertionDescribe(unsigned int *a1)
{
  const __CFAllocator *v2;

  v2 = CFGetAllocator(a1);
  return CFStringCreateWithFormat(v2, 0, CFSTR("<BKSWatchdogAssertion %p> pid = %d"), a1, a1[4]);
}

uint64_t BKSWatchdogAssertionCreateForPID(uint64_t a1, uint64_t a2)
{
  int v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t Instance;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v17;
  _QWORD v18[3];

  v2 = a2;
  v18[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithPid:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D87C98]);
  objc_msgSend(MEMORY[0x1E0D87CC0], "grant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v5;
  objc_msgSend(MEMORY[0x1E0D87C80], "attributeWithCompletionPolicy:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithExplanation:target:attributes:", CFSTR("BKSWatchdogAssertion"), v3, v7);

  v17 = 0;
  LODWORD(v7) = objc_msgSend(v8, "acquireWithError:", &v17);
  v9 = v17;
  Instance = 0;
  if ((_DWORD)v7)
  {
    if (_BKSWatchdogAssertionGetTypeID_once != -1)
      dispatch_once(&_BKSWatchdogAssertionGetTypeID_once, &__block_literal_global_4);
    Instance = _CFRuntimeCreateInstance();
    *(_DWORD *)(Instance + 16) = v2;
    os_unfair_lock_lock((os_unfair_lock_t)&watchdogLock);
    v11 = nextIdentifier++;
    *(_QWORD *)(Instance + 24) = v11;
    v12 = (void *)assertionsByIdentifier;
    if (!assertionsByIdentifier)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)assertionsByIdentifier;
      assertionsByIdentifier = v13;

      v12 = (void *)assertionsByIdentifier;
      v11 = *(_QWORD *)(Instance + 24);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v8, v15);

    os_unfair_lock_unlock((os_unfair_lock_t)&watchdogLock);
  }

  return Instance;
}

void BKSProcessAssertionSetExpirationHandler_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B0792000, log, OS_LOG_TYPE_FAULT, "unable to create assertion expiration observer", v1, 2u);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1E0C98718](cf);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

uint64_t RBSServiceInitialize()
{
  return MEMORY[0x1E0D87E58]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1E0C9A498]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1E0C9A4B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
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

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t rbs_general_log()
{
  return MEMORY[0x1E0D87E70]();
}

uint64_t rbs_shim_log()
{
  return MEMORY[0x1E0D87E78]();
}

