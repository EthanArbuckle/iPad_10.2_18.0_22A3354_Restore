@implementation CAMCallStatusMonitor

- (id)initDisabledForLaunch
{
  void *v3;
  CAMCallStatusMonitor *v4;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1EA3B0820);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CAMCallStatusMonitor initWithInitialDisabledReasons:](self, "initWithInitialDisabledReasons:", v3);

  return v4;
}

- (CAMCallStatusMonitor)initWithInitialDisabledReasons:(id)a3
{
  id v4;
  CAMCallStatusMonitor *v5;
  CAMCallStatusMonitor *v6;
  NSMutableSet *v7;
  NSMutableSet *disabledReasons;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *avscAccessQueue;
  void *v12;
  NSObject *v13;
  CAMCallStatusMonitor *v14;
  uint8_t v16[16];
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CAMCallStatusMonitor;
  v5 = -[CAMCallStatusMonitor init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_callActive = 0;
    if (v4)
      v7 = (NSMutableSet *)objc_msgSend(v4, "mutableCopy");
    else
      v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    disabledReasons = v6->__disabledReasons;
    v6->__disabledReasons = v7;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.camera.avsystemcontroller-access", v9);
    avscAccessQueue = v6->__avscAccessQueue;
    v6->__avscAccessQueue = (OS_dispatch_queue *)v10;

    +[CAMPriorityNotificationCenter defaultCenter](CAMPriorityNotificationCenter, "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v6, sel__handleApplicationDidEnterBackground_, *MEMORY[0x1E0DC4768], 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v6, sel__handleApplicationWillEnterForeground_, *MEMORY[0x1E0DC4860], 0);
    if (!-[NSMutableSet count](v6->__disabledReasons, "count"))
    {
      v13 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1DB760000, v13, OS_LOG_TYPE_DEFAULT, "Enabling call status monitoring immediately", v16, 2u);
      }

      -[CAMCallStatusMonitor _registerForAVSystemControllerNotificationsAndQueryState](v6, "_registerForAVSystemControllerNotificationsAndQueryState");
    }
    v14 = v6;

  }
  return v6;
}

- (BOOL)isCallActive
{
  return self->_callActive;
}

- (void)removeDisabledReason:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[CAMCallStatusMonitor _disabledReasons](self, "_disabledReasons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v7);

  v8 = objc_msgSend(v5, "count");
  if (!v6 || v8)
  {
    if (v6 != v8)
    {
      v11 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        -[CAMCallStatusMonitor _descriptionStringForReason:](self, "_descriptionStringForReason:", a3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMCallStatusMonitor _descriptionForReasons:](self, "_descriptionForReasons:", v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543618;
        v15 = v12;
        v16 = 2114;
        v17 = v13;
        _os_log_impl(&dword_1DB760000, v11, OS_LOG_TYPE_DEFAULT, "Removed call status monitoring disabled reason %{public}@: %{public}@", (uint8_t *)&v14, 0x16u);

      }
    }
  }
  else
  {
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[CAMCallStatusMonitor _descriptionStringForReason:](self, "_descriptionStringForReason:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v10;
      _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "Enabling call status monitoring after removing final disabled reason %{public}@", (uint8_t *)&v14, 0xCu);

    }
    -[CAMCallStatusMonitor _registerForAVSystemControllerNotificationsAndQueryState](self, "_registerForAVSystemControllerNotificationsAndQueryState");
  }

}

- (NSMutableSet)_disabledReasons
{
  return self->__disabledReasons;
}

- (id)_descriptionStringForReason:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("ApplicationBackgrounded");
  if (a3 != 1)
    v3 = 0;
  if (a3)
    return (id)v3;
  else
    return CFSTR("InitialLaunch");
}

- (void)_unregisterForAVSystemControllerNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D47EF0], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D48200], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D480B0], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D48228], 0);

}

- (OS_dispatch_queue)_avscAccessQueue
{
  return self->__avscAccessQueue;
}

- (void)_accessQueue_queryCallActiveStatusForReason:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  _BOOL4 v14;
  int v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  __CFString *v24;
  NSObject *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  _QWORD block[5];
  char v35;
  _QWORD v36[4];
  id v37;
  int v38;
  uint8_t buf[4];
  const __CFString *v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  const __CFString *v44;
  __int16 v45;
  const __CFString *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  -[CAMCallStatusMonitor _avscAccessQueue](self, "_avscAccessQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributeForKey:", *MEMORY[0x1E0D47EE8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributeForKey:", *MEMORY[0x1E0D48090]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributeForKey:", *MEMORY[0x1E0D47F58]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributeForKey:", *MEMORY[0x1E0D47E60]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKeyedSubscript:", *MEMORY[0x1E0D47E68]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "count");
  if (v10)
  {
    v11 = v10;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CAMCallStatusMonitor _processIdentifer](self, "_processIdentifer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v7, "containsObject:", v12);

    v14 = v11 != v13;
  }
  else
  {
    v14 = 0;
  }
  v32 = v8;
  v15 = objc_msgSend(v8, "isEqualToString:", CFSTR("Ringtone"));
  v16 = objc_msgSend(v6, "BOOLValue");
  v30 = v9;
  v17 = objc_msgSend(v9, "BOOLValue");
  if ((v15 & 1) != 0)
    v18 = 1;
  else
    v18 = v16 & (v14 | v17);
  if (v14)
  {
    v19 = MEMORY[0x1E0C809B0];
    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v36[0] = v19;
    v36[1] = 3221225472;
    v36[2] = __68__CAMCallStatusMonitor__accessQueue_queryCallActiveStatusForReason___block_invoke;
    v36[3] = &unk_1EA32B8C8;
    v38 = -[CAMCallStatusMonitor _processIdentifer](self, "_processIdentifer");
    v37 = v20;
    v21 = v20;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v36);
    v22 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v21, "componentsJoinedByString:", CFSTR(", "));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR(" Recording PIDs (%@)"), v23);
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = 0;
  }
  v25 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = CFSTR("Inactive");
    if (v18)
      v26 = CFSTR("Active -");
    v27 = CFSTR(" Ringtone");
    if (!v15)
      v27 = &stru_1EA3325A0;
    *(_DWORD *)buf = 138544386;
    v40 = v26;
    v28 = CFSTR(" HighPriority");
    v41 = 2114;
    v42 = v27;
    if (!v17)
      v28 = &stru_1EA3325A0;
    v43 = 2114;
    v44 = v28;
    v45 = 2114;
    if (v24)
      v29 = v24;
    else
      v29 = &stru_1EA3325A0;
    v46 = v29;
    v47 = 2114;
    v48 = v33;
    _os_log_impl(&dword_1DB760000, v25, OS_LOG_TYPE_DEFAULT, "Call status: %{public}@%{public}@%{public}@%{public}@ (%{public}@)", buf, 0x34u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__CAMCallStatusMonitor__accessQueue_queryCallActiveStatusForReason___block_invoke_59;
  block[3] = &unk_1EA328908;
  block[4] = self;
  v35 = v18;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)_setCallActive:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (-[CAMCallStatusMonitor isCallActive](self, "isCallActive") != v3)
  {
    -[CAMCallStatusMonitor setCallActive:](self, "setCallActive:", v3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("CAMCallStatusMonitorDidChangeCallActiveNotification"), self);

  }
}

- (void)_handleApplicationDidEnterBackground:(id)a3
{
  -[CAMCallStatusMonitor addDisabledReason:](self, "addDisabledReason:", 1);
}

- (void)addDisabledReason:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[CAMCallStatusMonitor _disabledReasons](self, "_disabledReasons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v7);

  v8 = objc_msgSend(v5, "count");
  if (v6 || !v8)
  {
    if (v6 != v8)
    {
      v11 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        -[CAMCallStatusMonitor _descriptionStringForReason:](self, "_descriptionStringForReason:", a3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMCallStatusMonitor _descriptionForReasons:](self, "_descriptionForReasons:", v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543618;
        v15 = v12;
        v16 = 2114;
        v17 = v13;
        _os_log_impl(&dword_1DB760000, v11, OS_LOG_TYPE_DEFAULT, "Added call status monitoring disabled reason %{public}@: %{public}@", (uint8_t *)&v14, 0x16u);

      }
    }
  }
  else
  {
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[CAMCallStatusMonitor _descriptionStringForReason:](self, "_descriptionStringForReason:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v10;
      _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "Disabling call status monitoring for reason %{public}@", (uint8_t *)&v14, 0xCu);

    }
    -[CAMCallStatusMonitor _unregisterForAVSystemControllerNotifications](self, "_unregisterForAVSystemControllerNotifications");
  }

}

- (CAMCallStatusMonitor)init
{
  return -[CAMCallStatusMonitor initWithInitialDisabledReasons:](self, "initWithInitialDisabledReasons:", 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[CAMPriorityNotificationCenter defaultCenter](CAMPriorityNotificationCenter, "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[CAMCallStatusMonitor _unregisterForAVSystemControllerNotifications](self, "_unregisterForAVSystemControllerNotifications");
  v4.receiver = self;
  v4.super_class = (Class)CAMCallStatusMonitor;
  -[CAMCallStatusMonitor dealloc](&v4, sel_dealloc);
}

- (void)_registerForAVSystemControllerNotificationsAndQueryState
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  -[CAMCallStatusMonitor _unregisterForAVSystemControllerNotifications](self, "_unregisterForAVSystemControllerNotifications");
  objc_initWeak(&location, self);
  -[CAMCallStatusMonitor _avscAccessQueue](self, "_avscAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __80__CAMCallStatusMonitor__registerForAVSystemControllerNotificationsAndQueryState__block_invoke;
  v4[3] = &unk_1EA329490;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __80__CAMCallStatusMonitor__registerForAVSystemControllerNotificationsAndQueryState__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  _QWORD v3[4];
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __80__CAMCallStatusMonitor__registerForAVSystemControllerNotificationsAndQueryState__block_invoke_2;
  v3[3] = &unk_1EA32A4A0;
  objc_copyWeak(&v4, v1);
  objc_msgSend(WeakRetained, "_accessQueue_subscribeToAVSystemControllerNotificationsWithCompletion:", v3);

  objc_destroyWeak(&v4);
}

void __80__CAMCallStatusMonitor__registerForAVSystemControllerNotificationsAndQueryState__block_invoke_2(uint64_t a1, int a2)
{
  id *v2;
  id WeakRetained;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;

  if (a2)
  {
    v2 = (id *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v4 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "_avscAccessQueue");
      v5 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __80__CAMCallStatusMonitor__registerForAVSystemControllerNotificationsAndQueryState__block_invoke_3;
      block[3] = &unk_1EA329490;
      objc_copyWeak(&v7, v2);
      dispatch_async(v5, block);

      objc_destroyWeak(&v7);
    }

  }
}

void __80__CAMCallStatusMonitor__registerForAVSystemControllerNotificationsAndQueryState__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessQueue_queryCallActiveStatusForReason:", CFSTR("initial query"));

}

- (void)_accessQueue_subscribeToAVSystemControllerNotificationsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;
  id v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CAMCallStatusMonitor _avscAccessQueue](self, "_avscAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D480B0];
  v18[0] = *MEMORY[0x1E0D47EF0];
  v18[1] = v7;
  v18[2] = *MEMORY[0x1E0D48228];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0D48280];
  v17 = 0;
  objc_msgSend(v6, "setAttribute:forKey:error:", v8, v9, &v17);
  v10 = v17;
  if (v10)
  {
    v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CAMCallStatusMonitor _accessQueue_subscribeToAVSystemControllerNotificationsWithCompletion:].cold.1((uint64_t)v8, (uint64_t)v10, v11);

  }
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __94__CAMCallStatusMonitor__accessQueue_subscribeToAVSystemControllerNotificationsWithCompletion___block_invoke;
  v13[3] = &unk_1EA32B1C8;
  objc_copyWeak(&v15, &location);
  v14 = v4;
  v12 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __94__CAMCallStatusMonitor__accessQueue_subscribeToAVSystemControllerNotificationsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_disabledReasons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", WeakRetained, sel__handleRecordingStateDidChangeNotification_, *MEMORY[0x1E0D480B0], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", WeakRetained, sel__handleCallIsActiveDidChangeNotification_, *MEMORY[0x1E0D47EF0], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", WeakRetained, sel__handleServerConnectionDiedNotification_, *MEMORY[0x1E0D48200], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", WeakRetained, sel__handleSomeClientIsActiveDidChangeNotification_, *MEMORY[0x1E0D48228], 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (id)_descriptionForReasons:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  __CFString *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t, unint64_t);
  void *v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  CAMCallStatusMonitor *v23;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __47__CAMCallStatusMonitor__descriptionForReasons___block_invoke;
    v21[3] = &unk_1EA32B838;
    v22 = v5;
    v23 = self;
    v7 = v5;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v21);
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v6;
    v16 = 3221225472;
    v17 = __47__CAMCallStatusMonitor__descriptionForReasons___block_invoke_3;
    v18 = &unk_1EA32B8A0;
    v10 = objc_retain((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("(")));
    v19 = v10;
    v20 = v9;
    v11 = v9;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v15);
    objc_msgSend(v10, "appendString:", CFSTR(")"), v15, v16, v17, v18);
    v12 = v20;
    v13 = (__CFString *)v10;

  }
  else
  {
    v13 = &stru_1EA3325A0;
  }

  return v13;
}

void __47__CAMCallStatusMonitor__descriptionForReasons___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = objc_msgSend(a2, "integerValue");
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_descriptionStringForReason:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

uint64_t __47__CAMCallStatusMonitor__descriptionForReasons___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __47__CAMCallStatusMonitor__descriptionForReasons___block_invoke_3(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
  result = objc_msgSend(*(id *)(a1 + 40), "count");
  if (result - 1 > a3)
    return objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(", "));
  return result;
}

void __68__CAMCallStatusMonitor__accessQueue_queryCallActiveStatusForReason___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "intValue") != *(_DWORD *)(a1 + 40))
  {
    v3 = *(void **)(a1 + 32);
    +[CAMCallStatusMonitor _processNameForPid:](CAMCallStatusMonitor, "_processNameForPid:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

uint64_t __68__CAMCallStatusMonitor__accessQueue_queryCallActiveStatusForReason___block_invoke_59(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setCallActive:", *(unsigned __int8 *)(a1 + 40));
}

- (int)_processIdentifer
{
  if (_processIdentifer_onceToken != -1)
    dispatch_once(&_processIdentifer_onceToken, &__block_literal_global_60);
  return _processIdentifer_pid;
}

void __41__CAMCallStatusMonitor__processIdentifer__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _processIdentifer_pid = objc_msgSend(v0, "processIdentifier");

}

+ (id)_processNameForPid:(id)a3
{
  id v3;
  void *v4;
  _BYTE buffer[256];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (proc_name(objc_msgSend(v3, "intValue"), buffer, 0x100u))
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", buffer);
  else
    objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_asyncQueryCallActiveStatusForReason:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[CAMCallStatusMonitor _avscAccessQueue](self, "_avscAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__CAMCallStatusMonitor__asyncQueryCallActiveStatusForReason___block_invoke;
  block[3] = &unk_1EA328F00;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __61__CAMCallStatusMonitor__asyncQueryCallActiveStatusForReason___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_accessQueue_queryCallActiveStatusForReason:", *(_QWORD *)(a1 + 32));

}

- (void)_handleRecordingStateDidChangeNotification:(id)a3
{
  -[CAMCallStatusMonitor _asyncQueryCallActiveStatusForReason:](self, "_asyncQueryCallActiveStatusForReason:", CFSTR("RecordingStateDidChangeNotification"));
}

- (void)_handleCallIsActiveDidChangeNotification:(id)a3
{
  -[CAMCallStatusMonitor _asyncQueryCallActiveStatusForReason:](self, "_asyncQueryCallActiveStatusForReason:", CFSTR("CallIsActiveDidChangeNotification"));
}

- (void)_handleSomeClientIsActiveDidChangeNotification:(id)a3
{
  -[CAMCallStatusMonitor _asyncQueryCallActiveStatusForReason:](self, "_asyncQueryCallActiveStatusForReason:", CFSTR("SomeClientIsActiveDidChangeNotification"));
}

- (void)_handleServerConnectionDiedNotification:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  v4 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DB760000, v4, OS_LOG_TYPE_DEFAULT, "AVSystemController server connection died, rebuilding AVSystemController.", v5, 2u);
  }

  -[CAMCallStatusMonitor _registerForAVSystemControllerNotificationsAndQueryState](self, "_registerForAVSystemControllerNotificationsAndQueryState");
}

- (void)_handleApplicationWillEnterForeground:(id)a3
{
  -[CAMCallStatusMonitor removeDisabledReason:](self, "removeDisabledReason:", 1);
}

- (void)setCallActive:(BOOL)a3
{
  self->_callActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__avscAccessQueue, 0);
  objc_storeStrong((id *)&self->__disabledReasons, 0);
}

- (void)_accessQueue_subscribeToAVSystemControllerNotificationsWithCompletion:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1DB760000, log, OS_LOG_TYPE_ERROR, "Could not subscribe to notifications: %{public}@. Error: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
