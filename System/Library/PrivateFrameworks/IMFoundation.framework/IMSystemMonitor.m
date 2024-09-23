@implementation IMSystemMonitor

- (void)_registerForRestoreNotifications
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;
  __CFNotificationCenter *v5;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_190693314, CFSTR("FaceTimeRegistrationRestoredFromBackupNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v4, self, (CFNotificationCallback)sub_190693324, CFSTR("com.apple.MobileSync.BackupAgent.RestoreStarted"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v5, self, (CFNotificationCallback)sub_19069337C, CFSTR("com.apple.MobileSync.BackupAgent.kBackupAgentRestoreEnded"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_applicationWillAddDeactivationReason:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  id v20;

  v20 = a3;
  objc_msgSend_userInfo(v20, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v7, v8, qword_1ECD910A0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (_IMWillLog(CFSTR("SystemMonitor")))
    _IMAlwaysLog(0, CFSTR("SystemMonitor"), CFSTR("Will add deactivation reason %@"), v13, v14, v15, v16, v17, (char)v10);
  if (objc_msgSend_intValue(v10, v11, v12, v13) == 1)
    objc_msgSend__notificationCenterWillAppear_(self, v18, (uint64_t)v20, v19);

}

- (void)_deliverNotificationSelector:(SEL)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const char *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  os_unfair_lock_t lock;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isActive(self, a2, (uint64_t)a3, v3))
  {
    os_unfair_lock_lock(&self->_ivarLock);
    objc_msgSend_allObjects(self->_earlyListeners, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    lock = &self->_ivarLock;
    os_unfair_lock_unlock(&self->_ivarLock);
    v10 = v9;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v45, (uint64_t)v49, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v46;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v46 != v14)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v15);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            if (_IMWillLog(CFSTR("SystemMonitor")))
            {
              NSStringFromSelector(a3);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              _IMAlwaysLog(0, CFSTR("SystemMonitor"), CFSTR("Delivering %@ to %@"), v20, v21, v22, v23, v24, (char)v19);

            }
            objc_msgSend_performSelector_withObject_(v16, v18, (uint64_t)a3, 0);
          }
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v17, (uint64_t)&v45, (uint64_t)v49, 16);
      }
      while (v13);
    }

    os_unfair_lock_lock(lock);
    objc_msgSend_allObjects(self->_listeners, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(lock);
    v29 = v28;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v45, (uint64_t)v49, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v46;
      do
      {
        v34 = 0;
        do
        {
          if (*(_QWORD *)v46 != v33)
            objc_enumerationMutation(v29);
          v35 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v34);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            if (_IMWillLog(CFSTR("SystemMonitor")))
            {
              NSStringFromSelector(a3);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              _IMAlwaysLog(0, CFSTR("SystemMonitor"), CFSTR("Delivering %@ to %@"), v39, v40, v41, v42, v43, (char)v38);

            }
            objc_msgSend_performSelector_withObject_(v35, v37, (uint64_t)a3, 0);
          }
          ++v34;
        }
        while (v32 != v34);
        v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v36, (uint64_t)&v45, (uint64_t)v49, 16);
      }
      while (v32);
    }

  }
}

- (BOOL)isActive
{
  IMSystemMonitor *v2;
  os_unfair_lock_s *p_ivarLock;

  v2 = self;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  LOBYTE(v2) = v2->_active;
  os_unfair_lock_unlock(p_ivarLock);
  return (char)v2;
}

- (void)_applicationDidRemoveDeactivationReason:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  id v20;

  v20 = a3;
  objc_msgSend_userInfo(v20, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v7, v8, qword_1ECD910A0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (_IMWillLog(CFSTR("SystemMonitor")))
    _IMAlwaysLog(0, CFSTR("SystemMonitor"), CFSTR("Did remove deactivation reason %@"), v13, v14, v15, v16, v17, (char)v10);
  if (objc_msgSend_intValue(v10, v11, v12, v13) == 1)
    objc_msgSend__notificationCenterDidDisappear_(self, v18, (uint64_t)v20, v19);

}

- (BOOL)systemIsShuttingDown
{
  char v2;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD90E00);
  v2 = byte_1EE1DDACC;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD90E00);
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1ECD91010 != -1)
    dispatch_once(&qword_1ECD91010, &unk_1E2C42CE8);
  return (id)qword_1ECD90FC0;
}

- (IMSystemMonitor)init
{
  IMSystemMonitor *v2;
  char v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  NSHashTable *listeners;
  id v10;
  const char *v11;
  uint64_t v12;
  NSHashTable *earlyListeners;
  id v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  CUTDeferredTaskQueue *postScreenLockedTask;
  id v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  CUTDeferredTaskQueue *postScreenSaverStartedTask;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  void *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  void *v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  objc_super v63;

  v63.receiver = self;
  v63.super_class = (Class)IMSystemMonitor;
  v2 = -[IMSystemMonitor init](&v63, sel_init);
  if (v2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD90E00);
    v3 = byte_1ECD90F40;
    byte_1ECD90F40 = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD90E00);
    if ((v3 & 1) == 0)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_190693A60, CFSTR("com.apple.springboard.deviceWillShutDown"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      if (dword_1ECD90A80 == -1)
      {
        im_primary_queue();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        dword_1ECD90A80 = IMDispatchForNotify("com.apple.mobile.data_eschaton", 0, v5, &unk_1E2C451E0);

      }
    }
    *(_QWORD *)&v2->_userIdleToken = 0xFFFFFFFFLL;
    v6 = objc_alloc(MEMORY[0x1E0CB3690]);
    v8 = objc_msgSend_initWithOptions_capacity_(v6, v7, 517, 0);
    listeners = v2->_listeners;
    v2->_listeners = (NSHashTable *)v8;

    v10 = objc_alloc(MEMORY[0x1E0CB3690]);
    v12 = objc_msgSend_initWithOptions_capacity_(v10, v11, 517, 0);
    earlyListeners = v2->_earlyListeners;
    v2->_earlyListeners = (NSHashTable *)v12;

    v14 = objc_alloc(MEMORY[0x1E0D13200]);
    im_primary_queue();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_initWithCapacity_queue_block_(v14, v16, 1, (uint64_t)v15, &unk_1E2C45140);
    postScreenLockedTask = v2->__postScreenLockedTask;
    v2->__postScreenLockedTask = (CUTDeferredTaskQueue *)v17;

    v19 = objc_alloc(MEMORY[0x1E0D13200]);
    im_primary_queue();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend_initWithCapacity_queue_block_(v19, v21, 1, (uint64_t)v20, &unk_1E2C43768);
    postScreenSaverStartedTask = v2->__postScreenSaverStartedTask;
    v2->__postScreenSaverStartedTask = (CUTDeferredTaskQueue *)v22;

    if (qword_1ECD90F48 != -1)
      dispatch_once(&qword_1ECD90F48, &unk_1E2C45200);
    if (qword_1ECD91060 && qword_1ECD91068)
    {
      objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObserver_selector_name_object_(v27, v28, (uint64_t)v2, (uint64_t)sel__applicationDidEnterBackground_, qword_1ECD91060, 0);

      objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObserver_selector_name_object_(v32, v33, (uint64_t)v2, (uint64_t)sel__applicationWillEnterForeground_, qword_1ECD91068, 0);

    }
    if (qword_1ECD91070 && qword_1ECD91078)
    {
      objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v24, v25, v26);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObserver_selector_name_object_(v34, v35, (uint64_t)v2, (uint64_t)sel__suspend_, qword_1ECD91070, 0);

      objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v36, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObserver_selector_name_object_(v39, v40, (uint64_t)v2, (uint64_t)sel__resume_, qword_1ECD91078, 0);

    }
    if (qword_1ECD91050 && qword_1ECD91058)
    {
      objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v24, v25, v26);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObserver_selector_name_object_(v41, v42, (uint64_t)v2, (uint64_t)sel__applicationDidBecomeActive_, qword_1ECD91050, 0);

      objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v43, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObserver_selector_name_object_(v46, v47, (uint64_t)v2, (uint64_t)sel__applicationWillResignActive_, qword_1ECD91058, 0);

    }
    if (qword_1ECD91080 && qword_1ECD91088)
    {
      objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v24, v25, v26);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObserver_selector_name_object_(v48, v49, (uint64_t)v2, (uint64_t)sel__suspendEventsOnly_, qword_1ECD91080, 0);

      objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v50, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObserver_selector_name_object_(v53, v54, (uint64_t)v2, (uint64_t)sel__resumeEventsOnly_, qword_1ECD91088, 0);

    }
    if (qword_1ECD91090 && qword_1ECD91098)
    {
      objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v24, v25, v26);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObserver_selector_name_object_(v55, v56, (uint64_t)v2, (uint64_t)sel__applicationWillAddDeactivationReason_, qword_1ECD91090, 0);

      objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v57, v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObserver_selector_name_object_(v60, v61, (uint64_t)v2, (uint64_t)sel__applicationDidRemoveDeactivationReason_, qword_1ECD91098, 0);

    }
    objc_msgSend__registerForRestoreNotifications(v2, v24, v25, v26);
  }
  return v2;
}

- (BOOL)usesPowerNotifications
{
  IMSystemMonitor *v2;
  os_unfair_lock_s *p_ivarLock;

  v2 = self;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  LOBYTE(v2) = v2->_usesPowerNotifications;
  os_unfair_lock_unlock(p_ivarLock);
  return (char)v2;
}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_ivarLock;

  v3 = a3;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  if (v3)
    self->_active = 1;
  os_unfair_lock_unlock(p_ivarLock);
}

- (void)addListener:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  char v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  os_unfair_lock_lock(&self->_ivarLock);
  if ((objc_msgSend_containsObject_(self->_listeners, v4, (uint64_t)v12, v5) & 1) == 0)
    objc_msgSend_addObject_(self->_listeners, v6, (uint64_t)v12, v7);
  if (self->_listeningForSetupAssistantNotifications)
  {
    os_unfair_lock_unlock(&self->_ivarLock);
  }
  else
  {
    v8 = objc_opt_respondsToSelector();
    os_unfair_lock_unlock(&self->_ivarLock);
    if ((v8 & 1) != 0)
      objc_msgSend__registerForSetupNotifications(self, v9, v10, v11);
  }

}

- (void)_suspend:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  if (_IMWillLog(CFSTR("SystemMonitor")))
    _IMAlwaysLog(0, CFSTR("SystemMonitor"), CFSTR("Suspended"), v5, v6, v7, v8, v9, v10);
  objc_msgSend__deliverNotificationSelector_(self, v4, (uint64_t)sel_systemApplicationDidSuspend, v5);
}

- (void)_resumeEventsOnly:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  if (_IMWillLog(CFSTR("SystemMonitor")))
    _IMAlwaysLog(0, CFSTR("SystemMonitor"), CFSTR("ResumedForEventsOnly"), v5, v6, v7, v8, v9, v10);
  objc_msgSend__deliverNotificationSelector_(self, v4, (uint64_t)sel_systemApplicationDidResumeForEventsOnly, v5);
}

- (void)_resume:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  if (_IMWillLog(CFSTR("SystemMonitor")))
    _IMAlwaysLog(0, CFSTR("SystemMonitor"), CFSTR("Resumed"), v5, v6, v7, v8, v9, v10);
  objc_msgSend__deliverNotificationSelector_(self, v4, (uint64_t)sel_systemApplicationDidResume, v5);
}

- (void)_applicationWillEnterForeground:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  char v14;

  if (_IMWillLog(CFSTR("SystemMonitor")))
    _IMAlwaysLog(0, CFSTR("SystemMonitor"), CFSTR("Will enter foreground"), v4, v5, v6, v7, v8, v14);
  os_unfair_lock_lock(&self->_ivarLock);
  self->_inBackground = 0;
  os_unfair_lock_unlock(&self->_ivarLock);
  if (objc_msgSend_usesPowerNotifications(self, v9, v10, v11))
    sub_190692178();
  objc_msgSend__deliverNotificationSelector_(self, v12, (uint64_t)sel_systemApplicationWillEnterForeground, v13);
}

- (void)_applicationDidBecomeActive:(id)a3
{
  os_unfair_lock_s *p_ivarLock;
  int64_t resignActiveCount;
  BOOL v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  char v20;

  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  resignActiveCount = self->_resignActiveCount;
  v6 = resignActiveCount < 1;
  v7 = resignActiveCount - 1;
  if (v6)
    goto LABEL_7;
  self->_resignActiveCount = v7;
  if (_IMWillLog(CFSTR("SystemMonitor")))
    _IMAlwaysLog(0, CFSTR("SystemMonitor"), CFSTR("Became Active, new count %d"), v8, v9, v10, v11, v12, self->_resignActiveCount);
  if (self->_resignActiveCount)
  {
    if (_IMWillLog(CFSTR("SystemMonitor")))
      _IMAlwaysLog(0, CFSTR("SystemMonitor"), CFSTR("Not active yet, ignoring"), v13, v14, v15, v16, v17, v20);
LABEL_7:
    os_unfair_lock_unlock(p_ivarLock);
    return;
  }
  os_unfair_lock_unlock(p_ivarLock);
  objc_msgSend__deliverNotificationSelector_(self, v18, (uint64_t)sel_systemApplicationDidBecomeActive, v19);
}

- (BOOL)watchesDataProtectionLockState
{
  IMSystemMonitor *v2;
  os_unfair_lock_s *p_ivarLock;

  v2 = self;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  LOBYTE(v2) = v2->_watchesDataProtectionLockState;
  os_unfair_lock_unlock(p_ivarLock);
  return (char)v2;
}

- (BOOL)watchesScreenLightState
{
  IMSystemMonitor *v2;
  os_unfair_lock_s *p_ivarLock;

  v2 = self;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  LOBYTE(v2) = v2->_watchesScreenLightState;
  os_unfair_lock_unlock(p_ivarLock);
  return (char)v2;
}

- (BOOL)watchesSystemLockState
{
  IMSystemMonitor *v2;
  os_unfair_lock_s *p_ivarLock;

  v2 = self;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  LOBYTE(v2) = v2->_watchesSystemLockState;
  os_unfair_lock_unlock(p_ivarLock);
  return (char)v2;
}

- (BOOL)receivesMemoryWarnings
{
  IMSystemMonitor *v2;
  os_unfair_lock_s *p_ivarLock;

  v2 = self;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  LOBYTE(v2) = v2->_receivesMemoryWarnings;
  os_unfair_lock_unlock(p_ivarLock);
  return (char)v2;
}

- (BOOL)usesSystemIdleState
{
  IMSystemMonitor *v2;
  os_unfair_lock_s *p_ivarLock;

  v2 = self;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  LOBYTE(v2) = v2->_usesSystemIdleState;
  os_unfair_lock_unlock(p_ivarLock);
  return (char)v2;
}

- (NSDate)dateScreenLightLastChanged
{
  os_unfair_lock_s *p_ivarLock;
  NSDate *v4;

  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  v4 = self->_dateScreenLightLastChanged;
  os_unfair_lock_unlock(p_ivarLock);
  return v4;
}

- (NSDate)dateSystemLockLastChanged
{
  os_unfair_lock_s *p_ivarLock;
  NSDate *v4;

  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  v4 = self->_dateSystemLockLastChanged;
  os_unfair_lock_unlock(p_ivarLock);
  return v4;
}

- (BOOL)systemIsSleeping
{
  IMSystemMonitor *v2;
  os_unfair_lock_s *p_ivarLock;

  v2 = self;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  LOBYTE(v2) = v2->_willSleep;
  os_unfair_lock_unlock(p_ivarLock);
  return (char)v2;
}

- (BOOL)isScreenSaverActive
{
  IMSystemMonitor *v2;
  os_unfair_lock_s *p_ivarLock;

  v2 = self;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  LOBYTE(v2) = v2->_screensaverActive;
  os_unfair_lock_unlock(p_ivarLock);
  return (char)v2;
}

- (BOOL)isBackingUp
{
  IMSystemMonitor *v2;
  os_unfair_lock_s *p_ivarLock;

  v2 = self;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  LOBYTE(v2) = v2->_backingUp;
  os_unfair_lock_unlock(p_ivarLock);
  return (char)v2;
}

- (BOOL)isFastUserSwitched
{
  IMSystemMonitor *v2;
  os_unfair_lock_s *p_ivarLock;

  v2 = self;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  LOBYTE(v2) = v2->_switchedOut;
  os_unfair_lock_unlock(p_ivarLock);
  return (char)v2;
}

- (BOOL)isScreenLit
{
  IMSystemMonitor *v2;
  os_unfair_lock_s *p_ivarLock;

  v2 = self;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  LOBYTE(v2) = v2->_screenLit;
  os_unfair_lock_unlock(p_ivarLock);
  return (char)v2;
}

- (BOOL)isSystemLocked
{
  IMSystemMonitor *v2;
  os_unfair_lock_s *p_ivarLock;

  v2 = self;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  LOBYTE(v2) = v2->_systemLocked;
  os_unfair_lock_unlock(p_ivarLock);
  return (char)v2;
}

- (BOOL)isInBackground
{
  IMSystemMonitor *v2;
  os_unfair_lock_s *p_ivarLock;

  v2 = self;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  LOBYTE(v2) = v2->_inBackground;
  os_unfair_lock_unlock(p_ivarLock);
  return (char)v2;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;

  objc_msgSend__unregisterForRestoreNotifications(self, a2, v2, v3);
  objc_msgSend__unregisterForLoginWindowNotifications(self, v5, v6, v7);
  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_name_object_(v11, v12, (uint64_t)self, 0, 0);

  sub_190691BE8();
  objc_msgSend_invalidate(self->_timer, v13, v14, v15);
  v16.receiver = self;
  v16.super_class = (Class)IMSystemMonitor;
  -[IMSystemMonitor dealloc](&v16, sel_dealloc);
}

- (void)_systemDidWake
{
  os_unfair_lock_s *p_ivarLock;
  const char *v4;
  uint64_t v5;

  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  self->_willSleep = 0;
  os_unfair_lock_unlock(p_ivarLock);
  objc_msgSend__deliverNotificationSelector_(self, v4, (uint64_t)sel_systemDidWake, v5);
}

- (void)_systemWillSleep
{
  os_unfair_lock_s *p_ivarLock;
  const char *v4;
  uint64_t v5;

  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  self->_willSleep = 1;
  os_unfair_lock_unlock(p_ivarLock);
  objc_msgSend__deliverNotificationSelector_(self, v4, (uint64_t)sel_systemWillSleep, v5);
}

- (void)_postScreenLocked
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;

  objc_msgSend_cancelPendingExecutions(self->__postScreenLockedTask, a2, v2, v3);
  os_unfair_lock_lock(&self->_ivarLock);
  if (self->_screenLocked)
  {
    os_unfair_lock_unlock(&self->_ivarLock);
  }
  else
  {
    self->_screenLocked = 1;
    os_unfair_lock_unlock(&self->_ivarLock);
    objc_msgSend__deliverNotificationSelector_(self, v5, (uint64_t)sel_screenLocked, v6);
  }
}

- (void)_screenLocked:(id)a3
{
  uint64_t v3;
  _BOOL4 screenLocked;
  const char *v6;
  uint64_t v7;

  objc_msgSend_cancelPendingExecutions(self->__postScreenLockedTask, a2, (uint64_t)a3, v3);
  os_unfair_lock_lock(&self->_ivarLock);
  screenLocked = self->_screenLocked;
  os_unfair_lock_unlock(&self->_ivarLock);
  if (!screenLocked)
    objc_msgSend_enqueueExecutionWithTarget_afterDelay_(self->__postScreenLockedTask, v6, (uint64_t)self, v7, 6.0);
}

- (void)_screenUnlocked:(id)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;

  objc_msgSend_cancelPendingExecutions(self->__postScreenLockedTask, a2, (uint64_t)a3, v3);
  os_unfair_lock_lock(&self->_ivarLock);
  if (self->_screenLocked)
  {
    self->_screenLocked = 0;
    os_unfair_lock_unlock(&self->_ivarLock);
    objc_msgSend__deliverNotificationSelector_(self, v5, (uint64_t)sel_screenUnlocked, v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_ivarLock);
  }
}

- (BOOL)isScreenLocked
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  char isSystemLocked;

  if (qword_1EE1DDAC0 != -1)
    dispatch_once(&qword_1EE1DDAC0, &unk_1E2C45160);
  objc_msgSend_sharedInstance(IMSystemMonitor, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isSystemLocked = objc_msgSend_isSystemLocked(v4, v5, v6, v7);

  return isSystemLocked;
}

- (void)_applicationWillResignActive:(id)a3
{
  os_unfair_lock_s *p_ivarLock;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;

  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  ++self->_resignActiveCount;
  if (_IMWillLog(CFSTR("SystemMonitor")))
    _IMAlwaysLog(0, CFSTR("SystemMonitor"), CFSTR("Resign active, new count %d"), v5, v6, v7, v8, v9, self->_resignActiveCount);
  if (self->_resignActiveCount == 1)
  {
    os_unfair_lock_unlock(p_ivarLock);
    objc_msgSend__deliverNotificationSelector_(self, v10, (uint64_t)sel_systemApplicationWillResignActive, v11);
  }
  else
  {
    if (_IMWillLog(CFSTR("SystemMonitor")))
      _IMAlwaysLog(0, CFSTR("SystemMonitor"), CFSTR("Already resigned active, ignoring"), v12, v13, v14, v15, v16, v17);
    os_unfair_lock_unlock(p_ivarLock);
  }
}

- (void)_suspendEventsOnly:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  if (_IMWillLog(CFSTR("SystemMonitor")))
    _IMAlwaysLog(0, CFSTR("SystemMonitor"), CFSTR("SuspendedForEventsOnly"), v5, v6, v7, v8, v9, v10);
  objc_msgSend__deliverNotificationSelector_(self, v4, (uint64_t)sel_systemApplicationDidSuspendForEventsOnly, v5);
}

- (void)_notificationCenterWillAppear:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  if (_IMWillLog(CFSTR("SystemMonitor")))
    _IMAlwaysLog(0, CFSTR("SystemMonitor"), CFSTR("Notification center will appear"), v5, v6, v7, v8, v9, v10);
  objc_msgSend__deliverNotificationSelector_(self, v4, (uint64_t)sel_notificationCenterWillAppear, v5);
}

- (void)_notificationCenterDidDisappear:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  if (_IMWillLog(CFSTR("SystemMonitor")))
    _IMAlwaysLog(0, CFSTR("SystemMonitor"), CFSTR("Notification center did disappear"), v5, v6, v7, v8, v9, v10);
  objc_msgSend__deliverNotificationSelector_(self, v4, (uint64_t)sel_notificationCenterDidDisappear, v5);
}

- (void)_postScreenSaverStarted
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;

  objc_msgSend_cancelPendingExecutions(self->__postScreenSaverStartedTask, a2, v2, v3);
  os_unfair_lock_lock(&self->_ivarLock);
  if (self->_screensaverActive)
  {
    os_unfair_lock_unlock(&self->_ivarLock);
  }
  else
  {
    self->_screensaverActive = 1;
    os_unfair_lock_unlock(&self->_ivarLock);
    objc_msgSend__deliverNotificationSelector_(self, v5, (uint64_t)sel_screenSaverDidStart, v6);
  }
}

- (void)_screenSaverStopped:(id)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;

  objc_msgSend_cancelPendingExecutions(self->__postScreenSaverStartedTask, a2, (uint64_t)a3, v3);
  os_unfair_lock_lock(&self->_ivarLock);
  if (self->_screensaverActive)
  {
    self->_screensaverActive = 0;
    os_unfair_lock_unlock(&self->_ivarLock);
    objc_msgSend__deliverNotificationSelector_(self, v5, (uint64_t)sel_screenSaverDidStop, v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_ivarLock);
  }
}

- (void)_screenSaverStarted:(id)a3
{
  uint64_t v3;
  _BOOL4 screensaverActive;
  const char *v6;
  uint64_t v7;

  objc_msgSend_cancelPendingExecutions(self->__postScreenSaverStartedTask, a2, (uint64_t)a3, v3);
  os_unfair_lock_lock(&self->_ivarLock);
  screensaverActive = self->_screensaverActive;
  os_unfair_lock_unlock(&self->_ivarLock);
  if (!screensaverActive)
    objc_msgSend_enqueueExecutionWithTarget_afterDelay_(self->__postScreenSaverStartedTask, v6, (uint64_t)self, v7, 5.0);
}

- (void)_applicationDidEnterBackground:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  char v14;

  if (_IMWillLog(CFSTR("SystemMonitor")))
    _IMAlwaysLog(0, CFSTR("SystemMonitor"), CFSTR("Did enter background"), v4, v5, v6, v7, v8, v14);
  os_unfair_lock_lock(&self->_ivarLock);
  self->_inBackground = 1;
  os_unfair_lock_unlock(&self->_ivarLock);
  if (objc_msgSend_usesPowerNotifications(self, v9, v10, v11))
    sub_190691BE8();
  objc_msgSend__deliverNotificationSelector_(self, v12, (uint64_t)sel_systemApplicationDidEnterBackground, v13);
}

- (BOOL)_deviceStillUnderFirstLock
{
  return (int)MKBDeviceUnlockedSinceBoot() < 1;
}

- (void)_setDataProtectionLockState:(int)a3
{
  uint64_t v3;
  os_unfair_lock_s *p_ivarLock;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char Lock;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t dataProtectionState;
  int isUnderDataProtectionLockForState;
  const char *v16;
  uint64_t v17;
  int v18;
  const char *v19;
  uint64_t v20;
  char *v21;

  v3 = *(_QWORD *)&a3;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  if (self->_underFirstLock)
  {
    Lock = objc_msgSend__deviceStillUnderFirstLock(self, v6, v7, v8);
    self->_underFirstLock = Lock;
    os_unfair_lock_unlock(p_ivarLock);
    if ((Lock & 1) == 0)
      objc_msgSend__deliverNotificationSelector_(self, v10, (uint64_t)sel_systemDidLeaveFirstDataProtectionLock, v11);
  }
  else
  {
    os_unfair_lock_unlock(p_ivarLock);
  }
  os_unfair_lock_lock(p_ivarLock);
  dataProtectionState = self->_dataProtectionState;
  if ((_DWORD)dataProtectionState == (_DWORD)v3)
  {
    os_unfair_lock_unlock(p_ivarLock);
  }
  else
  {
    isUnderDataProtectionLockForState = objc_msgSend__isUnderDataProtectionLockForState_(self, v12, dataProtectionState, v13);
    self->_dataProtectionState = v3;
    v18 = objc_msgSend__isUnderDataProtectionLockForState_(self, v16, v3, v17);
    os_unfair_lock_unlock(p_ivarLock);
    if (isUnderDataProtectionLockForState != v18)
    {
      if (v18)
        v21 = sel_systemDidEnterDataProtectionLock;
      else
        v21 = sel_systemDidLeaveDataProtectionLock;
      objc_msgSend__deliverNotificationSelector_(self, v19, (uint64_t)v21, v20);
    }
  }
}

- (BOOL)isUnderDataProtectionLock
{
  IMSystemMonitor *v2;
  os_unfair_lock_s *p_ivarLock;
  const char *v4;
  uint64_t v5;

  v2 = self;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  LOBYTE(v2) = objc_msgSend__isUnderDataProtectionLockForState_(v2, v4, v2->_dataProtectionState, v5);
  os_unfair_lock_unlock(p_ivarLock);
  return (char)v2;
}

- (BOOL)_isUnderDataProtectionLockForState:(int)a3
{
  return (a3 - 1) < 2;
}

- (BOOL)isUnderFirstDataProtectionLock
{
  IMSystemMonitor *v2;
  os_unfair_lock_s *p_ivarLock;

  v2 = self;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  LOBYTE(v2) = v2->_underFirstLock;
  os_unfair_lock_unlock(p_ivarLock);
  return (char)v2;
}

- (void)setWatchesDataProtectionLockState:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_ivarLock;
  NSObject *v6;
  dispatch_queue_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BOOL8 v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a3;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  if (v3 && !self->_watchesDataProtectionLockState)
  {
    self->_watchesDataProtectionLockState = 1;
    os_unfair_lock_unlock(p_ivarLock);
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD90E00);
    if (dword_1EE1DC8A0 == -1)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = dispatch_queue_create(0, v6);

      dword_1EE1DC8A0 = IMDispatchForNotify((const char *)*MEMORY[0x1E0D4E600], 0, v7, &unk_1E2C42B68);
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD90E00);
      objc_msgSend_sharedInstance(IMSystemMonitor, v8, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = MKBGetDeviceLockState() != 0;
      objc_msgSend__setSystemLockState_(v11, v13, v12, v14);

    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD90E00);
    }
    os_unfair_lock_lock(p_ivarLock);
    self->_dataProtectionState = MKBGetDeviceLockState();
    self->_underFirstLock = objc_msgSend__deviceStillUnderFirstLock(self, v15, v16, v17);
  }
  os_unfair_lock_unlock(p_ivarLock);
}

- (void)setWatchesSystemLockState:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_ivarLock;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a3;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  if (v3 && !self->_watchesSystemLockState)
  {
    self->_watchesSystemLockState = 1;
    os_unfair_lock_unlock(p_ivarLock);
    v13 = 0;
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD90E00);
    if (dword_1EE1DC858 == -1)
    {
      im_primary_queue();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      im_notify_register_dispatch("com.apple.springboard.lockstate", &dword_1EE1DC858, &v13, 1, v6, &unk_1E2C45240);

      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD90E00);
      objc_msgSend_sharedInstance(IMSystemMonitor, v7, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__setSystemLockState_(v10, v11, v13 != 0, v12);

    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD90E00);
    }
  }
  else
  {
    os_unfair_lock_unlock(p_ivarLock);
  }
}

- (void)setWatchesScreenLightState:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_ivarLock;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a3;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  if (v3 && !self->_watchesScreenLightState)
  {
    self->_watchesScreenLightState = 1;
    os_unfair_lock_unlock(p_ivarLock);
    v13 = 0;
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD90E00);
    if (dword_1EE1DC85C == -1)
    {
      im_primary_queue();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      im_notify_register_dispatch("com.apple.springboard.hasBlankedScreen", &dword_1EE1DC85C, &v13, 1, v6, &unk_1E2C45260);

      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD90E00);
      objc_msgSend_sharedInstance(IMSystemMonitor, v7, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__setSystemScreenState_(v10, v11, v13 == 0, v12);

    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD90E00);
    }
  }
  else
  {
    os_unfair_lock_unlock(p_ivarLock);
  }
}

- (void)setUsesPowerNotifications:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_ivarLock;

  v3 = a3;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  if (v3 && !self->_usesPowerNotifications)
  {
    self->_usesPowerNotifications = 1;
    os_unfair_lock_unlock(p_ivarLock);
    sub_190692178();
  }
  else
  {
    os_unfair_lock_unlock(p_ivarLock);
  }
}

- (void)_setSystemScreenState:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_ivarLock;
  NSDate *v6;
  NSDate *v7;
  NSDate *dateScreenLightLastChanged;
  _BOOL4 v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  char *v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v3 = a3;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  if (self->_screenLit == v3)
  {
    os_unfair_lock_unlock(p_ivarLock);
  }
  else
  {
    self->_screenLit = v3;
    v6 = self->_dateScreenLightLastChanged;
    v7 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
    dateScreenLightLastChanged = self->_dateScreenLightLastChanged;
    self->_dateScreenLightLastChanged = v7;

    v9 = _IMWillLog(CFSTR("IMSystemMonitor"));
    if (v3)
    {
      if (v9)
      {
        objc_msgSend_timeIntervalSinceNow(v6, v10, v11, v12);
        v14 = fabs(v13);
        _IMAlwaysLog(0, CFSTR("IMSystemMonitor"), CFSTR("Screen did light up (Was down for %f seconds)"), v15, v16, v17, v18, v19, SLOBYTE(v14));
      }

      os_unfair_lock_unlock(p_ivarLock);
      v22 = sel_systemScreenDidPowerUp;
    }
    else
    {
      if (v9)
      {
        objc_msgSend_timeIntervalSinceNow(v6, v10, v11, v12);
        v24 = fabs(v23);
        _IMAlwaysLog(0, CFSTR("IMSystemMonitor"), CFSTR("Screen did light down (Was lit for %f seconds)"), v25, v26, v27, v28, v29, SLOBYTE(v24));
      }

      os_unfair_lock_unlock(p_ivarLock);
      v22 = sel_systemScreenDidPowerDown;
    }
    objc_msgSend__deliverNotificationSelector_(self, v20, (uint64_t)v22, v21);
  }
}

- (void)_setSystemLockState:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_ivarLock;
  NSDate *v6;
  NSDate *v7;
  NSDate *dateSystemLockLastChanged;
  _BOOL4 v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  char *v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v3 = a3;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  if (self->_systemLocked == v3)
  {
    os_unfair_lock_unlock(p_ivarLock);
  }
  else
  {
    self->_systemLocked = v3;
    v6 = self->_dateSystemLockLastChanged;
    v7 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
    dateSystemLockLastChanged = self->_dateSystemLockLastChanged;
    self->_dateSystemLockLastChanged = v7;

    v9 = _IMWillLog(CFSTR("IMSystemMonitor"));
    if (v3)
    {
      if (v9)
      {
        objc_msgSend_timeIntervalSinceNow(v6, v10, v11, v12);
        v14 = fabs(v13);
        _IMAlwaysLog(0, CFSTR("IMSystemMonitor"), CFSTR("Screen did lock (Was unlocked for %f seconds)"), v15, v16, v17, v18, v19, SLOBYTE(v14));
      }

      os_unfair_lock_unlock(p_ivarLock);
      v22 = sel_systemDidLock;
    }
    else
    {
      if (v9)
      {
        objc_msgSend_timeIntervalSinceNow(v6, v10, v11, v12);
        v24 = fabs(v23);
        _IMAlwaysLog(0, CFSTR("IMSystemMonitor"), CFSTR("Screen did unlock (Was locked for %f seconds)"), v25, v26, v27, v28, v29, SLOBYTE(v24));
      }

      os_unfair_lock_unlock(p_ivarLock);
      v22 = sel_systemDidUnlock;
    }
    objc_msgSend__deliverNotificationSelector_(self, v20, (uint64_t)v22, v21);
  }
}

- (void)_setIdleState:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_ivarLock;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  NSDate *idleStart;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  NSDate *v26;
  NSDate *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int isSystemIdle;
  const char *v36;
  uint64_t v37;

  v3 = a3;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  if ((((self->_idleStart == 0) ^ v3) & 1) != 0)
  {
    if (_IMWillLog(CFSTR("Idle")))
    {
      v14 = CFSTR("NO");
      if (v3)
        v14 = CFSTR("YES");
      _IMAlwaysLog(0, CFSTR("Idle"), CFSTR("No change system idle  (State: %@)"), v9, v10, v11, v12, v13, (char)v14);
    }
LABEL_15:
    os_unfair_lock_unlock(p_ivarLock);
    return;
  }
  objc_msgSend__alreadyLocked_clearIdleTimer(self, v6, v7, v8);
  if (_IMWillLog(CFSTR("Idle")))
  {
    v20 = CFSTR("NO");
    if (v3)
      v20 = CFSTR("YES");
    _IMAlwaysLog(0, CFSTR("Idle"), CFSTR("Setting system idle to be: %@"), v15, v16, v17, v18, v19, (char)v20);
  }
  idleStart = self->_idleStart;
  self->_idleStart = 0;

  if (v3)
  {
    v22 = objc_alloc(MEMORY[0x1E0C99D68]);
    v26 = (NSDate *)objc_msgSend_initWithTimeIntervalSinceNow_(v22, v23, v24, v25, -self->_delayTime);
    v27 = self->_idleStart;
    self->_idleStart = v26;

  }
  if (_IMWillLog(CFSTR("Idle")))
    _IMAlwaysLog(0, CFSTR("Idle"), CFSTR("Became idle at: %@"), v30, v31, v32, v33, v34, (char)self->_idleStart);
  if (self->_idleOverride)
    goto LABEL_15;
  isSystemIdle = objc_msgSend__alreadyLocked_isSystemIdle(self, v28, v29, v30);
  os_unfair_lock_unlock(p_ivarLock);
  if (isSystemIdle)
    objc_msgSend__deliverNotificationSelector_(self, v36, (uint64_t)sel_systemDidBecomeIdle, v37);
  else
    objc_msgSend__deliverNotificationSelector_(self, v36, (uint64_t)sel_systemDidBecomeUnidle, v37);
}

- (void)_overrideAndDisableIdleTimer:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_ivarLock;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  NSDate *idleStart;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  char v33;

  v3 = a3;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  if (_IMWillLog(CFSTR("Idle")))
  {
    if (self->_idleOverride)
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    _IMAlwaysLog(0, CFSTR("Idle"), CFSTR("Old override %@ new override %@"), v6, v7, v8, v9, v10, (char)v11);
  }
  if (self->_idleOverride == v3)
    goto LABEL_7;
  if (_IMWillLog(CFSTR("Idle")))
  {
    v17 = CFSTR("NO");
    if (v3)
      v17 = CFSTR("YES");
    _IMAlwaysLog(0, CFSTR("Idle"), CFSTR("Setting idle override to: %@"), v12, v13, v14, v15, v16, (char)v17);
  }
  idleStart = self->_idleStart;
  self->_idleOverride = v3;
  if (v3 && idleStart)
  {
    if (_IMWillLog(CFSTR("Idle")))
      _IMAlwaysLog(0, CFSTR("Idle"), CFSTR("  => Override enabled, and we were idle, telling people we're not"), v19, v20, v21, v22, v23, v33);
    os_unfair_lock_unlock(p_ivarLock);
    objc_msgSend__deliverNotificationSelector_(self, v24, (uint64_t)sel_systemDidBecomeUnidle, v25);
  }
  else
  {
    if (v3 || !idleStart)
    {
LABEL_7:
      os_unfair_lock_unlock(p_ivarLock);
      return;
    }
    if (_IMWillLog(CFSTR("Idle")))
      _IMAlwaysLog(0, CFSTR("Idle"), CFSTR("  => Override disabled, and we were idle, telling people we're idle now"), v26, v27, v28, v29, v30, v33);
    os_unfair_lock_unlock(p_ivarLock);
    objc_msgSend__deliverNotificationSelector_(self, v31, (uint64_t)sel_systemDidBecomeIdle, v32);
  }
}

- (void)_clearIdleTimer
{
  os_unfair_lock_s *p_ivarLock;
  const char *v4;
  uint64_t v5;
  uint64_t v6;

  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  objc_msgSend__alreadyLocked_clearIdleTimer(self, v4, v5, v6);
  os_unfair_lock_unlock(p_ivarLock);
}

- (void)_alreadyLocked_clearIdleTimer
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  IMDispatchTimer *timer;
  char v11;

  if (self->_timer)
  {
    if (_IMWillLog(CFSTR("Idle")))
      _IMAlwaysLog(0, CFSTR("Idle"), CFSTR("Clearing idle timer"), v5, v6, v7, v8, v9, v11);
    objc_msgSend_invalidate(self->_timer, v3, v4, v5);
    timer = self->_timer;
    self->_timer = 0;

  }
}

- (BOOL)isSystemIdle
{
  IMSystemMonitor *v2;
  os_unfair_lock_s *p_ivarLock;
  const char *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = self;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  LOBYTE(v2) = objc_msgSend__alreadyLocked_isSystemIdle(v2, v4, v5, v6);
  os_unfair_lock_unlock(p_ivarLock);
  return (char)v2;
}

- (BOOL)_alreadyLocked_isSystemIdle
{
  return self->_idleStart && !self->_idleOverride;
}

- (double)systemIdleTime
{
  os_unfair_lock_s *p_ivarLock;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;

  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  objc_msgSend_timeIntervalSinceNow(self->_idleStart, v4, v5, v6);
  v8 = v7;
  os_unfair_lock_unlock(p_ivarLock);
  return v8;
}

- (void)_systemWillShutdown
{
  uint64_t v2;

  objc_msgSend__deliverNotificationSelector_(self, a2, (uint64_t)sel_systemWillShutdown, v2);
}

- (void)_addEarlyListener:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  char v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  os_unfair_lock_lock(&self->_ivarLock);
  if ((objc_msgSend_containsObject_(self->_earlyListeners, v4, (uint64_t)v12, v5) & 1) == 0)
    objc_msgSend_addObject_(self->_earlyListeners, v6, (uint64_t)v12, v7);
  if (self->_listeningForSetupAssistantNotifications)
  {
    os_unfair_lock_unlock(&self->_ivarLock);
  }
  else
  {
    v8 = objc_opt_respondsToSelector();
    os_unfair_lock_unlock(&self->_ivarLock);
    if ((v8 & 1) != 0)
      objc_msgSend__registerForSetupNotifications(self, v9, v10, v11);
  }

}

- (void)_removeEarlyListener:(id)a3
{
  os_unfair_lock_s *p_ivarLock;
  id v5;
  const char *v6;
  uint64_t v7;

  p_ivarLock = &self->_ivarLock;
  v5 = a3;
  os_unfair_lock_lock(p_ivarLock);
  objc_msgSend_removeObject_(self->_earlyListeners, v6, (uint64_t)v5, v7);

  os_unfair_lock_unlock(p_ivarLock);
}

- (void)removeListener:(id)a3
{
  os_unfair_lock_s *p_ivarLock;
  id v5;
  const char *v6;
  uint64_t v7;

  p_ivarLock = &self->_ivarLock;
  v5 = a3;
  os_unfair_lock_lock(p_ivarLock);
  objc_msgSend_removeObject_(self->_listeners, v6, (uint64_t)v5, v7);

  os_unfair_lock_unlock(p_ivarLock);
}

- (void)_checkRestoredFromBackup
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = sub_190693014;
  v2[3] = &unk_1E2C44580;
  v2[4] = self;
  im_dispatch_after_primary_queue(v2, 5.0);
}

- (void)_restoreDidStart
{
  os_unfair_lock_s *p_ivarLock;
  const char *v4;
  uint64_t v5;

  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  self->_backingUp = 1;
  os_unfair_lock_unlock(p_ivarLock);
  objc_msgSend__deliverNotificationSelector_(self, v4, (uint64_t)sel_systemDidStartBackup, v5);
}

- (void)_restoreDidStop
{
  os_unfair_lock_s *p_ivarLock;
  _QWORD v4[5];

  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  self->_backingUp = 0;
  os_unfair_lock_unlock(p_ivarLock);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_19069311C;
  v4[3] = &unk_1E2C44580;
  v4[4] = self;
  im_dispatch_after_primary_queue(v4, 5.0);
}

- (void)_setupStateChanged
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = sub_190693180;
  v2[3] = &unk_1E2C44580;
  v2[4] = self;
  im_dispatch_after_primary_queue(v2, 5.0);
}

- (void)_registerForSetupNotifications
{
  os_unfair_lock_s *p_ivarLock;
  void **v4;
  void *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v7;
  const __CFString *v8;

  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  if (self->_listeningForSetupAssistantNotifications)
  {
    os_unfair_lock_unlock(p_ivarLock);
  }
  else
  {
    self->_listeningForSetupAssistantNotifications = 1;
    os_unfair_lock_unlock(p_ivarLock);
    if (qword_1EE1DD538
      || ((v4 = (void **)IMWeakLinkSymbol("BYSetupAssistantSilentTokenUpgradeCompletedNotification", CFSTR("SetupAssistant"))) == 0? (v5 = 0): (v5 = *v4), objc_storeStrong((id *)&qword_1EE1DD538, v5), qword_1EE1DD538))
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_19069327C, (CFStringRef)qword_1EE1DD538, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    v7 = CFNotificationCenterGetDarwinNotifyCenter();
    v8 = (const __CFString *)sub_1906932D4();
    CFNotificationCenterAddObserver(v7, self, (CFNotificationCallback)sub_19069327C, v8, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

- (void)_unregisterForRestoreNotifications
{
  __CFNotificationCenter *DarwinNotifyCenter;
  const __CFString *v4;
  __CFNotificationCenter *v5;
  __CFNotificationCenter *v6;
  __CFNotificationCenter *v7;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v4 = (const __CFString *)sub_1906932D4();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v4, 0);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v5, self, CFSTR("FaceTimeRegistrationRestoredFromBackupNotification"), 0);
  v6 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v6, self, CFSTR("com.apple.MobileSync.BackupAgent.RestoreStarted"), 0);
  v7 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v7, self, CFSTR("com.apple.MobileSync.BackupAgent.kBackupAgentRestoreEnded"), 0);
}

- (BOOL)isSetup
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  char isVendorInstall;
  int v12;
  int v13;
  char v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  int v23;
  const __CFString *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend__registerForSetupNotifications(self, a2, v2, v3);
  objc_msgSend_sharedInstance(IMLockdownManager, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isVendorInstall = objc_msgSend_isVendorInstall(v7, v8, v9, v10);

  if ((isVendorInstall & 1) != 0)
    return 1;
  if (qword_1EE1DD2D0 != -1)
    dispatch_once(&qword_1EE1DD2D0, &unk_1E2C45180);
  if (byte_1EE1DDAD0 | byte_1EE1DDAD1)
    return 1;
  if (qword_1EE1DD2C0 != -1)
    dispatch_once(&qword_1EE1DD2C0, &unk_1E2C432E8);
  if (qword_1EE1DD2C8 != -1)
    dispatch_once(&qword_1EE1DD2C8, &unk_1E2C451A0);
  v12 = off_1EE1DD2B0();
  v13 = off_1EE1DD2B8();
  v14 = (v13 | v12) ^ 1;
  objc_msgSend_registration(IMRGLog, v15, v16, v17);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = CFSTR("YES");
    if (v13 | v12)
      v20 = CFSTR("NO");
    else
      v20 = CFSTR("YES");
    if (v13)
      v21 = CFSTR("YES");
    else
      v21 = CFSTR("NO");
    v23 = 138412802;
    v24 = v20;
    v25 = 2112;
    v26 = v21;
    if (v12)
      v19 = CFSTR("NO");
    v27 = 2112;
    v28 = v19;
    _os_log_impl(&dword_19066D000, v18, OS_LOG_TYPE_DEFAULT, "Done checking if device is setup {isSetup: %@, needsToRun: %@, tokenUpgradeDone: %@}", (uint8_t *)&v23, 0x20u);
  }

  return v14;
}

- (void)_forceResumed
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  if (_IMWillLog(CFSTR("Daemon")))
    _IMAlwaysLog(0, CFSTR("Daemon"), CFSTR("Forcing resume notification"), v3, v4, v5, v6, v7, v8);
  MEMORY[0x1E0DE7D20](self, sel__resume_, 0, v3);
}

- (void)_forceSuspended
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  if (_IMWillLog(CFSTR("Daemon")))
    _IMAlwaysLog(0, CFSTR("Daemon"), CFSTR("Forcing suspend notification"), v3, v4, v5, v6, v7, v8);
  MEMORY[0x1E0DE7D20](self, sel__suspend_, 0, v3);
}

- (void)_receivedMemoryNotification
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  if (_IMWillLog(CFSTR("Daemon")))
    _IMAlwaysLog(0, CFSTR("Daemon"), CFSTR("Received memory warning, dispatching to listeners"), v4, v5, v6, v7, v8, v9);
  objc_msgSend__deliverNotificationSelector_(self, v3, (uint64_t)sel_systemDidEnterMemoryPressure, v4);
}

- (void)setReceivesMemoryWarnings:(BOOL)a3
{
  NSObject *v4;
  dispatch_source_t v5;
  void *v6;

  if (a3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD90E00);
    if (!qword_1EE1DD540)
    {
      im_primary_queue();
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 2uLL, v4);
      v6 = (void *)qword_1EE1DD540;
      qword_1EE1DD540 = (uint64_t)v5;

      dispatch_source_set_event_handler((dispatch_source_t)qword_1EE1DD540, &unk_1E2C451C0);
      dispatch_resume((dispatch_object_t)qword_1EE1DD540);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD90E00);
    os_unfair_lock_lock(&self->_ivarLock);
    self->_receivesMemoryWarnings = 1;
    os_unfair_lock_unlock(&self->_ivarLock);
  }
}

- (int)_dataProtectionState
{
  return self->_dataProtectionState;
}

- (void)set_dataProtectionState:(int)a3
{
  self->_dataProtectionState = a3;
}

- (BOOL)_underFirstLock
{
  return self->_underFirstLock;
}

- (void)set_underFirstLock:(BOOL)a3
{
  self->_underFirstLock = a3;
}

- (void)setIsFastUserSwitched:(BOOL)a3
{
  self->_switchedOut = a3;
}

- (NSHashTable)_listeners
{
  return self->_listeners;
}

- (void)set_listeners:(id)a3
{
  objc_storeStrong((id *)&self->_listeners, a3);
}

- (NSDate)_idleStart
{
  return self->_idleStart;
}

- (void)set_idleStart:(id)a3
{
  objc_storeStrong((id *)&self->_idleStart, a3);
}

- (IMDispatchTimer)_timer
{
  return self->_timer;
}

- (void)set_timer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (NSString)_userID
{
  return self->_userID;
}

- (void)set_userID:(id)a3
{
  objc_storeStrong((id *)&self->_userID, a3);
}

- (double)_delayTime
{
  return self->_delayTime;
}

- (void)set_delayTime:(double)a3
{
  self->_delayTime = a3;
}

- (BOOL)_idleOverride
{
  return self->_idleOverride;
}

- (void)set_idleOverride:(BOOL)a3
{
  self->_idleOverride = a3;
}

- (NSHashTable)_earlyListeners
{
  return self->_earlyListeners;
}

- (void)set_earlyListeners:(id)a3
{
  objc_storeStrong((id *)&self->_earlyListeners, a3);
}

- (int)userIdleToken
{
  return self->_userIdleToken;
}

- (void)setUserIdleToken:(int)a3
{
  self->_userIdleToken = a3;
}

- (os_unfair_lock_s)ivarLock
{
  return self->_ivarLock;
}

- (void)setIvarLock:(os_unfair_lock_s)a3
{
  self->_ivarLock = a3;
}

- (int64_t)resignActiveCount
{
  return self->_resignActiveCount;
}

- (void)setResignActiveCount:(int64_t)a3
{
  self->_resignActiveCount = a3;
}

- (BOOL)listeningForSetupAssistantNotifications
{
  return self->_listeningForSetupAssistantNotifications;
}

- (void)setListeningForSetupAssistantNotifications:(BOOL)a3
{
  self->_listeningForSetupAssistantNotifications = a3;
}

- (CUTDeferredTaskQueue)_postScreenLockedTask
{
  return self->__postScreenLockedTask;
}

- (CUTDeferredTaskQueue)_postScreenSaverStartedTask
{
  return self->__postScreenSaverStartedTask;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__postScreenSaverStartedTask, 0);
  objc_storeStrong((id *)&self->__postScreenLockedTask, 0);
  objc_storeStrong((id *)&self->_earlyListeners, 0);
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_dateSystemLockLastChanged, 0);
  objc_storeStrong((id *)&self->_dateScreenLightLastChanged, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_idleStart, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
}

@end
