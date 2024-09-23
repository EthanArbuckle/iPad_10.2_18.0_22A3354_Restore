@implementation LACDarwinNotificationCenter

- (LACDarwinNotificationCenter)init
{
  LACDarwinNotificationCenter *v2;
  uint64_t v3;
  NSHashTable *observers;
  NSMutableSet *v5;
  NSMutableSet *subscriptions;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LACDarwinNotificationCenter;
  v2 = -[LACDarwinNotificationCenter init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    subscriptions = v2->_subscriptions;
    v2->_subscriptions = v5;

    v2->_observersLock._os_unfair_lock_opaque = 0;
    v2->_subscriptionsLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

+ (LACDarwinNotificationCenter)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1)
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_8);
  return (LACDarwinNotificationCenter *)(id)sharedInstance_sharedInstance_4;
}

void __45__LACDarwinNotificationCenter_sharedInstance__block_invoke()
{
  LACDarwinNotificationCenter *v0;
  void *v1;

  v0 = objc_alloc_init(LACDarwinNotificationCenter);
  v1 = (void *)sharedInstance_sharedInstance_4;
  sharedInstance_sharedInstance_4 = (uint64_t)v0;

}

- (void)removeAllObservers
{
  -[LACDarwinNotificationCenter _synchronizedObservers:](self, "_synchronizedObservers:", &__block_literal_global_4_1);
}

uint64_t __49__LACDarwinNotificationCenter_removeAllObservers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllObjects");
}

- (void)stopListeningToAllNotifications
{
  -[LACDarwinNotificationCenter _synchronizedSubscriptions:](self, "_synchronizedSubscriptions:", &__block_literal_global_6_0);
  -[LACDarwinNotificationCenter _stopObservingAllNotifications](self, "_stopObservingAllNotifications");
}

uint64_t __62__LACDarwinNotificationCenter_stopListeningToAllNotifications__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllObjects");
}

- (int64_t)observerCount
{
  int64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__LACDarwinNotificationCenter_observerCount__block_invoke;
  v4[3] = &unk_2510C1D50;
  v4[4] = &v5;
  -[LACDarwinNotificationCenter _synchronizedObservers:](self, "_synchronizedObservers:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __44__LACDarwinNotificationCenter_observerCount__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)listenToLaunchNotifications
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __58__LACDarwinNotificationCenter_listenToLaunchNotifications__block_invoke;
  v2[3] = &unk_2510C1D78;
  objc_copyWeak(&v3, &location);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", 0, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __58__LACDarwinNotificationCenter_listenToLaunchNotifications__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  xpc_object_t xdict;

  xdict = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x24BDACF50]));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_addSubscriptionToNotification:", v4);
    objc_msgSend(WeakRetained, "_notifyObserversAboutNotification:", v4);

  }
}

- (void)postNotification:(__CFString *)a3
{
  NSObject *v5;
  int v6;
  __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  LACLogNotifications();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = a3;
    _os_log_impl(&dword_2409DC000, v5, OS_LOG_TYPE_DEFAULT, "Will post %{public}@", (uint8_t *)&v6, 0xCu);
  }

  -[LACDarwinNotificationCenter _postNotification:](self, "_postNotification:", a3);
}

- (BOOL)hasObserver:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__LACDarwinNotificationCenter_hasObserver___block_invoke;
  v7[3] = &unk_2510C1DA0;
  v9 = &v10;
  v5 = v4;
  v8 = v5;
  -[LACDarwinNotificationCenter _synchronizedObservers:](self, "_synchronizedObservers:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __43__LACDarwinNotificationCenter_hasObserver___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "containsObject:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__LACDarwinNotificationCenter_addObserver___block_invoke;
  v7[3] = &unk_2510C1DC8;
  v5 = v4;
  v8 = v5;
  -[LACDarwinNotificationCenter _synchronizedObservers:](self, "_synchronizedObservers:", v7);
  LACLogNotifications();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v5;
    _os_log_impl(&dword_2409DC000, v6, OS_LOG_TYPE_DEFAULT, "Did register observer %@", buf, 0xCu);
  }

}

uint64_t __43__LACDarwinNotificationCenter_addObserver___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addObject:", *(_QWORD *)(a1 + 32));
}

- (void)addObserver:(id)a3 notification:(__CFString *)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__LACDarwinNotificationCenter_addObserver_notification___block_invoke;
  v9[3] = &unk_2510C1DC8;
  v7 = v6;
  v10 = v7;
  -[LACDarwinNotificationCenter _synchronizedObservers:](self, "_synchronizedObservers:", v9);
  -[LACDarwinNotificationCenter _startObservingNotification:](self, "_startObservingNotification:", a4);
  LACLogNotifications();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v12 = v7;
    v13 = 2112;
    v14 = a4;
    _os_log_impl(&dword_2409DC000, v8, OS_LOG_TYPE_DEFAULT, "Did register observer %@ of notification %@", buf, 0x16u);
  }

}

uint64_t __56__LACDarwinNotificationCenter_addObserver_notification___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addObject:", *(_QWORD *)(a1 + 32));
}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__LACDarwinNotificationCenter_removeObserver___block_invoke;
  v7[3] = &unk_2510C1DC8;
  v5 = v4;
  v8 = v5;
  -[LACDarwinNotificationCenter _synchronizedObservers:](self, "_synchronizedObservers:", v7);
  LACLogNotifications();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v5;
    _os_log_impl(&dword_2409DC000, v6, OS_LOG_TYPE_DEFAULT, "Did remove observer %@", buf, 0xCu);
  }

}

uint64_t __46__LACDarwinNotificationCenter_removeObserver___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObject:", *(_QWORD *)(a1 + 32));
}

- (void)_notifyObserversAboutNotification:(__CFString *)a3
{
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD v14[5];
  uint8_t v15[128];
  __int128 buf;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  LACLogNotifications();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = a3;
    _os_log_impl(&dword_2409DC000, v5, OS_LOG_TYPE_DEFAULT, "Did receive notification %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  v20 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __65__LACDarwinNotificationCenter__notifyObserversAboutNotification___block_invoke;
  v14[3] = &unk_2510C1D50;
  v14[4] = &buf;
  -[LACDarwinNotificationCenter _synchronizedObservers:](self, "_synchronizedObservers:", v14);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "notificationCenter:didReceiveNotification:", self, a3, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

  _Block_object_dispose(&buf, 8);
}

void __65__LACDarwinNotificationCenter__notifyObserversAboutNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)_postNotification:(__CFString *)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, a3, 0, 0, 1u);
}

- (void)_startObservingNotification:(__CFString *)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v6;

  if (!-[LACDarwinNotificationCenter _hasSubscriptionToNotification:](self, "_hasSubscriptionToNotification:"))
  {
    -[LACDarwinNotificationCenter _addSubscriptionToNotification:](self, "_addSubscriptionToNotification:", a3);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, a3, 0);
    v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v6, self, (CFNotificationCallback)LACDarwinNotificationCenterCallBack, a3, 0, (CFNotificationSuspensionBehavior)0);
  }
}

- (void)_stopObservingAllNotifications
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
}

- (BOOL)_hasSubscriptionToNotification:(__CFString *)a3
{
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __62__LACDarwinNotificationCenter__hasSubscriptionToNotification___block_invoke;
  v5[3] = &unk_2510C1DF0;
  v5[4] = &v6;
  v5[5] = a3;
  -[LACDarwinNotificationCenter _synchronizedSubscriptions:](self, "_synchronizedSubscriptions:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __62__LACDarwinNotificationCenter__hasSubscriptionToNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "containsObject:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)_addSubscriptionToNotification:(__CFString *)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __62__LACDarwinNotificationCenter__addSubscriptionToNotification___block_invoke;
  v3[3] = &__block_descriptor_40_e22_v16__0__NSMutableSet_8l;
  v3[4] = a3;
  -[LACDarwinNotificationCenter _synchronizedSubscriptions:](self, "_synchronizedSubscriptions:", v3);
}

uint64_t __62__LACDarwinNotificationCenter__addSubscriptionToNotification___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addObject:", *(_QWORD *)(a1 + 32));
}

- (void)_synchronizedObservers:(id)a3
{
  os_unfair_lock_s *p_observersLock;
  void (**v5)(id, NSHashTable *);

  p_observersLock = &self->_observersLock;
  v5 = (void (**)(id, NSHashTable *))a3;
  os_unfair_lock_lock(p_observersLock);
  v5[2](v5, self->_observers);

  os_unfair_lock_unlock(p_observersLock);
}

- (void)_synchronizedSubscriptions:(id)a3
{
  os_unfair_lock_s *p_subscriptionsLock;
  void (**v5)(id, NSMutableSet *);

  p_subscriptionsLock = &self->_subscriptionsLock;
  v5 = (void (**)(id, NSMutableSet *))a3;
  os_unfair_lock_lock(p_subscriptionsLock);
  v5[2](v5, self->_subscriptions);

  os_unfair_lock_unlock(p_subscriptionsLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptions, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
