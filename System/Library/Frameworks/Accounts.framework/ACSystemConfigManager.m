@implementation ACSystemConfigManager

+ (id)sharedInstance
{
  ACSystemConfigManager *v3;
  void *v4;
  id v5;

  pthread_mutex_lock(&__SystemConfigManagerMutex);
  if (!__sharedACSystemConfigManager)
  {
    v3 = objc_alloc_init(ACSystemConfigManager);
    v4 = (void *)__sharedACSystemConfigManager;
    __sharedACSystemConfigManager = (uint64_t)v3;

  }
  objc_msgSend(a1, "_scheduleSharedInstanceTeardown");
  v5 = (id)__sharedACSystemConfigManager;
  pthread_mutex_unlock(&__SystemConfigManagerMutex);
  return v5;
}

+ (id)_livingInstance
{
  return (id)__sharedACSystemConfigManager;
}

+ (unint64_t)_timeoutInterval
{
  return 5;
}

+ (void)_scheduleSharedInstanceTeardown
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;
  dispatch_source_t v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  dispatch_time_t v11;

  if (__timerSource)
  {
    dispatch_source_cancel((dispatch_source_t)__timerSource);
    v2 = (void *)__timerSource;
    __timerSource = 0;

  }
  v3 = __timerQueue;
  if (!__timerQueue)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("ACSysConfigManagerTimerQueue", v4);
    v6 = (void *)__timerQueue;
    __timerQueue = (uint64_t)v5;

    v3 = __timerQueue;
  }
  v7 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v3);
  v8 = (void *)__timerSource;
  __timerSource = (uint64_t)v7;

  dispatch_source_set_event_handler((dispatch_source_t)__timerSource, &__block_literal_global_10);
  dispatch_resume((dispatch_object_t)__timerSource);
  v9 = +[ACSystemConfigManager _timeoutInterval](ACSystemConfigManager, "_timeoutInterval");
  v10 = __timerSource;
  v11 = dispatch_time(0, 1000000000 * v9);
  dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
}

uint64_t __56__ACSystemConfigManager__scheduleSharedInstanceTeardown__block_invoke()
{
  return +[ACSystemConfigManager _tearDown](ACSystemConfigManager, "_tearDown");
}

+ (void)_tearDown
{
  void *v2;

  pthread_mutex_lock(&__SystemConfigManagerMutex);
  v2 = (void *)__sharedACSystemConfigManager;
  __sharedACSystemConfigManager = 0;

  pthread_mutex_unlock(&__SystemConfigManagerMutex);
}

- (ACSystemConfigManager)init
{
  ACSystemConfigManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *preferencesQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ACSystemConfigManager;
  v2 = -[ACSystemConfigManager init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("ACSysConfigManagerSCPeferencesQueue", v3);
    preferencesQueue = v2->_preferencesQueue;
    v2->_preferencesQueue = (OS_dispatch_queue *)v4;

    -[ACSystemConfigManager _createSCPreferencesSession](v2, "_createSCPreferencesSession");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ACSystemConfigManager _destroySCPreferencesSession](self, "_destroySCPreferencesSession");
  v3.receiver = self;
  v3.super_class = (Class)ACSystemConfigManager;
  -[ACSystemConfigManager dealloc](&v3, sel_dealloc);
}

- (int)accountsWithAccountTypeIdentifierExist:(id)a3
{
  void *v4;
  void *v5;
  int v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.exists"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACSystemConfigManager _getValueForKey:](self, "_getValueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  return v6;
}

- (void)setAccountsWithAccountTypeIdentifier:(id)a3 exist:(BOOL)a4
{
  void *v5;
  id v6;

  if (a4)
    v5 = &unk_1E48A19B0;
  else
    v5 = &unk_1E48A19C8;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.exists"), a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ACSystemConfigManager _setValue:forKey:](self, "_setValue:forKey:", v5, v6);

}

- (int64_t)countOfAccountsWithAccountTypeIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.count"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACSystemConfigManager _getValueForKey:](self, "_getValueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "integerValue");
  else
    v7 = -1;

  return v7;
}

- (void)setCountOfAccounts:(int64_t)a3 withAccountTypeIdentifier:(id)a4
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.count"), a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ACSystemConfigManager _setValue:forKey:](self, "_setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3), v6);

}

- (void)_createSCPreferencesSession
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *preferencesQueue;
  id v7;
  _QWORD block[5];
  id v9;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "processName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  preferencesQueue = self->_preferencesQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__ACSystemConfigManager__createSCPreferencesSession__block_invoke;
  block[3] = &unk_1E48925B8;
  block[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(preferencesQueue, block);

}

uint64_t __52__ACSystemConfigManager__createSCPreferencesSession__block_invoke(uint64_t a1)
{
  uint64_t *v2;
  SCPreferencesRef v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  const __SCPreferences *v7;
  __CFRunLoop *Main;
  SCPreferencesContext v10;

  v2 = (uint64_t *)(a1 + 40);
  v3 = SCPreferencesCreateWithAuthorization((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *(CFStringRef *)(a1 + 40), CFSTR("com.apple.accounts.exists.plist"), 0);
  v5 = *(_QWORD *)(a1 + 32);
  v4 = a1 + 32;
  *(_QWORD *)(v5 + 16) = v3;
  _ACLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __52__ACSystemConfigManager__createSCPreferencesSession__block_invoke_cold_1(v4, v2, v6);

  v7 = *(const __SCPreferences **)(*(_QWORD *)v4 + 16);
  Main = CFRunLoopGetMain();
  SCPreferencesScheduleWithRunLoop(v7, Main, (CFStringRef)*MEMORY[0x1E0C9B280]);
  memset(&v10, 0, sizeof(v10));
  return SCPreferencesSetCallback(*(SCPreferencesRef *)(*(_QWORD *)v4 + 16), (SCPreferencesCallBack)__ACSystemConfigManagerPreferencesCallback, &v10);
}

- (void)_destroySCPreferencesSession
{
  NSObject *preferencesQueue;
  _QWORD block[5];

  preferencesQueue = self->_preferencesQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__ACSystemConfigManager__destroySCPreferencesSession__block_invoke;
  block[3] = &unk_1E4892AD8;
  block[4] = self;
  dispatch_sync(preferencesQueue, block);
}

void __53__ACSystemConfigManager__destroySCPreferencesSession__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  const __SCPreferences *v3;
  __CFRunLoop *Main;
  const void *v5;

  v1 = a1 + 32;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    _ACLogSystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __53__ACSystemConfigManager__destroySCPreferencesSession__block_invoke_cold_1(v1, v2);

    v3 = *(const __SCPreferences **)(*(_QWORD *)v1 + 16);
    Main = CFRunLoopGetMain();
    SCPreferencesUnscheduleFromRunLoop(v3, Main, (CFStringRef)*MEMORY[0x1E0C9B280]);
    SCPreferencesSetCallback(*(SCPreferencesRef *)(*(_QWORD *)v1 + 16), 0, 0);
    v5 = *(const void **)(*(_QWORD *)v1 + 16);
    if (v5)
    {
      *(_QWORD *)(*(_QWORD *)v1 + 16) = 0;
      CFRelease(v5);
    }
  }
}

- (void)_handleSCPreferencesSessionNotification:(unsigned int)a3
{
  NSObject *preferencesQueue;
  _QWORD v4[5];
  unsigned int v5;

  preferencesQueue = self->_preferencesQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__ACSystemConfigManager__handleSCPreferencesSessionNotification___block_invoke;
  v4[3] = &unk_1E4894460;
  v5 = a3;
  v4[4] = self;
  dispatch_sync(preferencesQueue, v4);
}

void __65__ACSystemConfigManager__handleSCPreferencesSessionNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  BOOL v4;
  int v5;

  if ((*(_BYTE *)(a1 + 40) & 2) != 0)
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_DWORD *)(v2 + 24);
    if (!v3)
    {
      SCPreferencesSynchronize(*(SCPreferencesRef *)(v2 + 16));
      v2 = *(_QWORD *)(a1 + 32);
      v3 = *(_DWORD *)(v2 + 24);
    }
    v4 = __OFSUB__(v3, 1);
    v5 = v3 - 1;
    if (v5 < 0 == v4)
      *(_DWORD *)(v2 + 24) = v5;
  }
}

- (void)_getValueForKey:(id)a3
{
  id v4;
  NSObject *preferencesQueue;
  id v6;
  void *v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  preferencesQueue = self->_preferencesQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__ACSystemConfigManager__getValueForKey___block_invoke;
  block[3] = &unk_1E4894398;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(preferencesQueue, block);
  v7 = (void *)v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

CFPropertyListRef __41__ACSystemConfigManager__getValueForKey___block_invoke(uint64_t a1)
{
  CFPropertyListRef result;

  result = SCPreferencesGetValue(*(SCPreferencesRef *)(*(_QWORD *)(a1 + 32) + 16), *(CFStringRef *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)_setValue:(void *)a3 forKey:(id)a4
{
  id v6;
  NSObject *preferencesQueue;
  id v8;
  _QWORD block[5];
  id v10;
  void *v11;

  v6 = a4;
  preferencesQueue = self->_preferencesQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__ACSystemConfigManager__setValue_forKey___block_invoke;
  block[3] = &unk_1E4894488;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_sync(preferencesQueue, block);

}

void __42__ACSystemConfigManager__setValue_forKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;

  v2 = a1 + 32;
  if (SCPreferencesLock(*(SCPreferencesRef *)(*(_QWORD *)(a1 + 32) + 16), 1u))
    goto LABEL_15;
  if (SCError() == 3005)
    SCPreferencesSynchronize(*(SCPreferencesRef *)(*(_QWORD *)v2 + 16));
  if (SCPreferencesLock(*(SCPreferencesRef *)(*(_QWORD *)v2 + 16), 1u))
  {
LABEL_15:
    if (SCPreferencesSetValue(*(SCPreferencesRef *)(*(_QWORD *)(a1 + 32) + 16), *(CFStringRef *)(a1 + 40), *(CFPropertyListRef *)(a1 + 48))&& SCPreferencesCommitChanges(*(SCPreferencesRef *)(*(_QWORD *)v2 + 16)))
    {
      if (SCPreferencesApplyChanges(*(SCPreferencesRef *)(*(_QWORD *)v2 + 16)))
      {
        ++*(_DWORD *)(*(_QWORD *)v2 + 24);
        SCPreferencesSynchronize(*(SCPreferencesRef *)(*(_QWORD *)v2 + 16));
      }
    }
    SCPreferencesUnlock(*(SCPreferencesRef *)(*(_QWORD *)v2 + 16));
  }
  else
  {
    v3 = SCError();
    _ACLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __42__ACSystemConfigManager__setValue_forKey___block_invoke_cold_1(v2, v3, v4);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferencesQueue, 0);
}

void __52__ACSystemConfigManager__createSCPreferencesSession__block_invoke_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  v4 = *a2;
  v5 = 134218242;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_debug_impl(&dword_1A2BCD000, log, OS_LOG_TYPE_DEBUG, "\"ACSystemConfigManager: new SCPreferencesRef %p created for process %@.\", (uint8_t *)&v5, 0x16u);
}

void __53__ACSystemConfigManager__destroySCPreferencesSession__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  v3 = 134217984;
  v4 = v2;
  _os_log_debug_impl(&dword_1A2BCD000, a2, OS_LOG_TYPE_DEBUG, "\"ACSystemConfigManager: tearing down SCPreferencesRef %p\", (uint8_t *)&v3, 0xCu);
}

void __42__ACSystemConfigManager__setValue_forKey___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 134218242;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1A2BCD000, a3, OS_LOG_TYPE_ERROR, "\"ACSystemConfigManager: failed to acquire SCPreferencesLock for %p due to error %@\", (uint8_t *)&v6, 0x16u);

}

@end
