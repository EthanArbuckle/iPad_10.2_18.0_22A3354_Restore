@implementation CKDSystemAvailabilityMonitor

- (BOOL)registerWatcher:(id)a3
{
  id v4;
  CKDSystemAvailabilityMonitor *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  NSMutableArray *v15;
  NSMutableArray *watcherWrappersInRegistrationOrder;
  CKDSystemAvailabilityWatcherWrapper *v17;
  const char *v18;
  void *v19;
  const char *v20;
  const char *v21;
  int v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    v8 = objc_msgSend_availabilityState(v5, v6, v7);
    if ((unint64_t)(v8 - 1) < 2)
    {
      v12 = objc_msgSend_availabilityState(v5, v9, v10);
      if (!objc_msgSend_systemAvailabilityChanged_(v4, v13, v12))
      {
LABEL_17:
        v11 = 0;
LABEL_18:
        objc_sync_exit(v5);

        goto LABEL_19;
      }
    }
    else if (v8)
    {
      if (v8 == 3)
        objc_msgSend_systemAvailabilityChanged_(v4, v9, 3);
      goto LABEL_17;
    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v14 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v23 = 138412290;
      v24 = v4;
      _os_log_debug_impl(&dword_1BE990000, v14, OS_LOG_TYPE_DEBUG, "Registering watcher %@", (uint8_t *)&v23, 0xCu);
    }
    if (!v5->_watcherWrappersInRegistrationOrder)
    {
      v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      watcherWrappersInRegistrationOrder = v5->_watcherWrappersInRegistrationOrder;
      v5->_watcherWrappersInRegistrationOrder = v15;

    }
    v17 = [CKDSystemAvailabilityWatcherWrapper alloc];
    v19 = (void *)objc_msgSend_initWithDelegate_(v17, v18, (uint64_t)v4);
    if ((objc_msgSend_containsObject_(v5->_watcherWrappersInRegistrationOrder, v20, (uint64_t)v19) & 1) == 0)
      objc_msgSend_addObject_(v5->_watcherWrappersInRegistrationOrder, v21, (uint64_t)v19);

    v11 = 1;
    goto LABEL_18;
  }
  v11 = 0;
LABEL_19:

  return v11;
}

- (unint64_t)availabilityState
{
  return self->_availabilityState;
}

+ (id)sharedMonitor
{
  return (id)qword_1ED702CF0;
}

+ (void)initialize
{
  CKDSystemAvailabilityMonitor *v2;
  const char *v3;
  uint64_t v4;
  uint64_t inited;
  void *v6;

  if (!qword_1ED702CF0)
  {
    v2 = [CKDSystemAvailabilityMonitor alloc];
    inited = objc_msgSend_initInternal(v2, v3, v4);
    v6 = (void *)qword_1ED702CF0;
    qword_1ED702CF0 = inited;

  }
}

- (id)initInternal
{
  CKDSystemAvailabilityMonitor *v2;
  const char *v3;
  uint64_t v4;
  CKDSystemAvailabilityMonitor *v5;
  uint64_t availabilityState;
  const char *v7;
  uint64_t v8;
  __CFNotificationCenter *v9;
  NSObject *v10;
  __CFNotificationCenter *DarwinNotifyCenter;
  _QWORD block[4];
  CKDSystemAvailabilityMonitor *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CKDSystemAvailabilityMonitor;
  v2 = -[CKDSystemAvailabilityMonitor init](&v15, sel_init);
  v5 = v2;
  if (!v2)
    return v5;
  availabilityState = objc_msgSend_currentAvailabilityState(v2, v3, v4);
  v5->_availabilityState = availabilityState;
  if (availabilityState != 3)
  {
    if ((availabilityState & 2) != 0)
      goto LABEL_4;
LABEL_11:
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)sub_1BEAA6368, CFSTR("com.apple.mobile.keybagd.lock_status"), 0, (CFNotificationSuspensionBehavior)1025);
    availabilityState = v5->_availabilityState;
    if ((availabilityState & 1) != 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  CKOncePerBoot();
  availabilityState = v5->_availabilityState;
  if ((availabilityState & 2) == 0)
    goto LABEL_11;
LABEL_4:
  if ((availabilityState & 1) == 0)
  {
LABEL_5:
    v9 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v9, v5, (CFNotificationCallback)sub_1BEAA6368, (CFStringRef)*MEMORY[0x1E0D8D6D8], 0, (CFNotificationSuspensionBehavior)1025);
    availabilityState = v5->_availabilityState;
  }
LABEL_6:
  if (availabilityState != 3)
  {
    dispatch_get_global_queue(17, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BEAA6508;
    block[3] = &unk_1E782EA40;
    v14 = v5;
    dispatch_async(v10, block);

  }
  objc_msgSend__logAvailabilityDescription(v5, v7, v8);
  return v5;
}

- (void)removeNotifications
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.mobile.keybagd.lock_status"), 0);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, (CFNotificationName)*MEMORY[0x1E0D8D6D8], 0);
}

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  objc_msgSend_removeNotifications(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)CKDSystemAvailabilityMonitor;
  -[CKDSystemAvailabilityMonitor dealloc](&v4, sel_dealloc);
}

- (void)assertAvailability:(unint64_t)a3
{
  const char *v6;
  uint64_t v7;
  const char *v8;
  id v9;

  if ((objc_msgSend_availabilityState(self, a2, a3) & a3) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v6, v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v8, (uint64_t)a2, self, CFSTR("CKDSystemAvailabilityMonitor.m"), 194, CFSTR("System does not have availability %lx"), a3);

  }
}

- (unint64_t)currentAvailabilityState
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  _QWORD *v7;
  os_log_t *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint8_t v13[16];
  uint8_t buf[16];

  v3 = objc_msgSend_simulatedAvailabilityState(self, a2, v2);
  v4 = v3;
  if ((v3 & 4) != 0)
    return v3 & 0xFFFFFFFFFFFFFFFBLL;
  v5 = MKBDeviceUnlockedSinceBoot();
  v6 = BYSetupAssistantNeedsToRun();
  v7 = (_QWORD *)MEMORY[0x1E0C95300];
  v8 = (os_log_t *)MEMORY[0x1E0C952B0];
  if (v5 != 1)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v9 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE990000, v9, OS_LOG_TYPE_INFO, "Can't start yet, device is still locked", buf, 2u);
    }
  }
  if (v6)
  {
    if (*v7 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v10 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1BE990000, v10, OS_LOG_TYPE_INFO, "Can't start yet, device is still in buddy", v13, 2u);
    }
  }
  v11 = v4 | 2;
  if (v5 != 1)
    v11 = v4;
  return v11 | v6 ^ 1u;
}

- (id)availabilityDescription
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  const char *v10;

  v4 = objc_msgSend_availabilityState(self, a2, v2);
  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) >= 4)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = objc_msgSend_availabilityState(self, v5, v6);
    objc_msgSend_stringWithFormat_(v8, v10, (uint64_t)CFSTR("no description for status value %ld"), v9);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_1E78328C8[v4 & 0xFFFFFFFFFFFFFFFBLL];
  }
  return v7;
}

- (void)_logAvailabilityDescription
{
  void *v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v4 = v3;
    objc_msgSend_availabilityDescription(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_debug_impl(&dword_1BE990000, v4, OS_LOG_TYPE_DEBUG, "System is %{public}@", (uint8_t *)&v8, 0xCu);

  }
}

- (void)_clearVanishedWatchers
{
  const char *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  NSMutableArray *watcherWrappersInRegistrationOrder;
  CKDSystemAvailabilityMonitor *obj;

  obj = self;
  objc_sync_enter(obj);
  v6 = objc_msgSend_count(obj->_watcherWrappersInRegistrationOrder, v2, v3);
  if (v6 - 1 >= 0)
  {
    do
    {
      objc_msgSend_objectAtIndex_(obj->_watcherWrappersInRegistrationOrder, v4, --v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_delegate(v7, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        objc_msgSend_removeObjectAtIndex_(obj->_watcherWrappersInRegistrationOrder, v11, v6);

    }
    while (v6 > 0);
  }
  if (!objc_msgSend_count(obj->_watcherWrappersInRegistrationOrder, v4, v5))
  {
    watcherWrappersInRegistrationOrder = obj->_watcherWrappersInRegistrationOrder;
    obj->_watcherWrappersInRegistrationOrder = 0;

  }
  objc_sync_exit(obj);

}

- (void)_systemMayNowBeReady
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  NSMutableArray *watcherWrappersInRegistrationOrder;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  CKDSystemAvailabilityMonitor *obj;
  _QWORD v27[7];

  v4 = objc_msgSend_currentAvailabilityState(self, a2, v2);
  obj = self;
  objc_sync_enter(obj);
  v7 = objc_msgSend_availabilityState(obj, v5, v6);
  v10 = objc_msgSend_availabilityState(obj, v8, v9);
  objc_msgSend_setAvailabilityState_(obj, v11, v10 | v4);
  if (v4 != v7)
  {
    objc_msgSend__logAvailabilityDescription(obj, v12, v13);
    v16 = objc_msgSend_count(obj->_watcherWrappersInRegistrationOrder, v14, v15);
    if (v16)
    {
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = sub_1BEAA6AE0;
      v27[3] = &unk_1E78328A8;
      v27[4] = obj;
      v27[5] = v16;
      v27[6] = v4;
      CKMuckingWithPersonas(v27);
    }
    if (v4 == 3)
    {
      watcherWrappersInRegistrationOrder = obj->_watcherWrappersInRegistrationOrder;
      obj->_watcherWrappersInRegistrationOrder = 0;

      objc_msgSend_removeNotifications(obj, v20, v21);
    }
    else
    {
      objc_msgSend__clearVanishedWatchers(obj, v17, v18);
    }
    objc_msgSend_sharedNotifier(CKDAccountNotifier, v22, v23, obj);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_postAccountChangedNotificationWithAccountID_changeType_(v24, v25, 0, 0);

  }
  objc_sync_exit(obj);

}

- (void)resetToUnavailableForUnitTests
{
  const char *v3;

  objc_msgSend_setAvailabilityState_(self, a2, 0);
  objc_msgSend_setSimulatedAvailabilityState_(self, v3, 4);
}

- (void)simulateBuddyCompletedForUnitTests
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  const char *v6;
  uint64_t v7;

  v4 = objc_msgSend_simulatedAvailabilityState(self, a2, v2);
  objc_msgSend_setSimulatedAvailabilityState_(self, v5, v4 | 1);
  objc_msgSend__systemMayNowBeReady(self, v6, v7);
}

- (void)simulateFirstUnlockForUnitTests
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  const char *v6;
  uint64_t v7;

  v4 = objc_msgSend_simulatedAvailabilityState(self, a2, v2);
  objc_msgSend_setSimulatedAvailabilityState_(self, v5, v4 | 2);
  objc_msgSend__systemMayNowBeReady(self, v6, v7);
}

- (void)setAvailabilityState:(unint64_t)a3
{
  self->_availabilityState = a3;
}

- (unint64_t)simulatedAvailabilityState
{
  return self->_simulatedAvailabilityState;
}

- (void)setSimulatedAvailabilityState:(unint64_t)a3
{
  self->_simulatedAvailabilityState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watcherWrappersInRegistrationOrder, 0);
}

@end
