@implementation LANotification

- (LANotification)initWithObserver:(id)a3
{
  id v4;
  LANotification *v5;
  LANotification *v6;
  LANotificationProxy *v7;
  LANotificationProxy *proxy;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LANotification;
  v5 = -[LANotification init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_observer, v4);
    v6->_notifyOnResume = 1;
    -[LANotification setAppMustBeActive:](v6, "setAppMustBeActive:", 1);
    v7 = -[LANotificationProxy initWithTarget:]([LANotificationProxy alloc], "initWithTarget:", v6);
    proxy = v6->_proxy;
    v6->_proxy = v7;

  }
  return v6;
}

+ (void)postNotificationWithNewValue:(id)a3 oldValue:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = (id)objc_opt_new();
  objc_msgSend(v7, "postNewValue:oldValue:", v6, v5);

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)LANotification;
  -[LANotification dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LANotification value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LANotification oldValue](self, "oldValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LANotification observer](self, "observer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: value: %@, oldValue: %@, observer: %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)resume
{
  NSObject *v3;
  void *v4;
  _BOOL8 v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  LANotification *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  LA_LOG_6();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v9 = self;
    _os_log_impl(&dword_1B971E000, v3, OS_LOG_TYPE_INFO, "%{public}@ is resuming", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  -[LANotification notification](self, "notification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[LANotification notifyOnResume](self, "notifyOnResume");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __24__LANotification_resume__block_invoke;
  v6[3] = &unk_1E7079CC0;
  objc_copyWeak(&v7, (id *)buf);
  objc_msgSend(v4, "resumeAndNotify:completionHandler:", v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __24__LANotification_resume__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  LA_LOG_6();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v4 = 138543362;
    v5 = WeakRetained;
    _os_log_impl(&dword_1B971E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ has resumed", (uint8_t *)&v4, 0xCu);

  }
}

- (void)suspend
{
  NSObject *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[4];
  LANotification *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  LA_LOG_6();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v8 = self;
    _os_log_impl(&dword_1B971E000, v3, OS_LOG_TYPE_INFO, "%{public}@ is suspending", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  -[LANotification notification](self, "notification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __25__LANotification_suspend__block_invoke;
  v5[3] = &unk_1E7079CC0;
  objc_copyWeak(&v6, (id *)buf);
  objc_msgSend(v4, "suspendWithCompletionHandler:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __25__LANotification_suspend__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  LA_LOG_6();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v4 = 138543362;
    v5 = WeakRetained;
    _os_log_impl(&dword_1B971E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ has been suspended", (uint8_t *)&v4, 0xCu);

  }
}

- (void)postNewValue:(id)a3 oldValue:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  NSObject *v9;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_class *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  uint8_t buf[4];
  LANotification *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[LANotification darwinNotificationForValue:](self, "darwinNotificationForValue:", v6);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  LA_LOG_6();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v24 = self;
    v25 = 2114;
    v26 = v6;
    v27 = 2114;
    v28 = v7;
    v29 = 2114;
    v30 = v8;
    _os_log_impl(&dword_1B971E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ is posting newValue: %{public}@, oldValue: %{public}@, darwin notification: %{public}@", buf, 0x2Au);
  }

  if (v8)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, v8, 0, 0, 1u);
  }
  objc_initWeak((id *)buf, self);
  -[LANotification connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __40__LANotification_postNewValue_oldValue___block_invoke;
  v22[3] = &unk_1E7079D10;
  v22[4] = self;
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __40__LANotification_postNewValue_oldValue___block_invoke_2;
  v18[3] = &unk_1E707AB30;
  objc_copyWeak(&v21, (id *)buf);
  v16 = v6;
  v19 = v16;
  v17 = v7;
  v20 = v17;
  objc_msgSend(v13, "postNotificationOfClassNamed:newValue:oldValue:completionHandler:", v15, v16, v17, v18);

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);

}

void __40__LANotification_postNewValue_oldValue___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(_QWORD *)(v1 + 8) = 0;

}

void __40__LANotification_postNewValue_oldValue___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  LA_LOG_6();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = 138543874;
    v7 = WeakRetained;
    v8 = 2114;
    v9 = v4;
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_1B971E000, v2, OS_LOG_TYPE_INFO, "%{public}@ posted newValue: %{public}@, oldValue: %{public}@", (uint8_t *)&v6, 0x20u);

  }
}

+ (BOOL)isAppActive
{
  return (_appIsActive & 1) == 0;
}

- (void)newValue:(id)a3 oldValue:(id)a4 completionHandler:(id)a5
{
  id v9;
  NSObject *v10;
  void (**v11)(_QWORD);
  NSObject *oldValue;
  NSObject *v13;
  int v14;
  LANotification *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(_QWORD))a5;
  objc_storeStrong((id *)&self->_value, a3);
  oldValue = self->_oldValue;
  self->_oldValue = v10;

  if (-[LANotification appMustBeActive](self, "appMustBeActive") && _appIsActive == 1)
  {
    LA_LOG_6();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543362;
      v15 = self;
      _os_log_impl(&dword_1B971E000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ will wait for app activation before notifying observer", (uint8_t *)&v14, 0xCu);
    }

    self->_waitingForActivation = 1;
    v11[2](v11);
  }
  else
  {
    -[LANotification _notifyObserverWithAction:completionHandler:](self, "_notifyObserverWithAction:completionHandler:", CFSTR("has received new value"), v11);
  }

}

- (void)_notifyObserverWithAction:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  LANotification *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  LA_LOG_6();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543618;
    v13 = self;
    v14 = 2114;
    v15 = v6;
    _os_log_impl(&dword_1B971E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@, notifying observer", (uint8_t *)&v12, 0x16u);
  }

  -[LANotification observer](self, "observer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[LANotification observer](self, "observer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "notification:completionHandler:", self, v7);

  }
  v7[2](v7);

}

- (NSXPCConnection)connection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  void *v6;
  void *v7;
  void *v8;

  connection = self->_connection;
  if (!connection)
  {
    +[LAClient createConnection:legacyService:](LAClient, "createConnection:legacyService:", 0, 0);
    v4 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue();
    v5 = self->_connection;
    self->_connection = v4;

    objc_msgSend(MEMORY[0x1E0CC1320], "interfaceWithInternalProtocol:", &unk_1EF237248);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LANotification connection](self, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteObjectInterface:", v6);

    -[LANotification connection](self, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resume");

    connection = self->_connection;
  }
  return connection;
}

- (LANotificationXPC)notification
{
  LANotificationXPC *notification;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[5];

  notification = self->_notification;
  if (!notification)
  {
    -[LANotification connection](self, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __30__LANotification_notification__block_invoke;
    v12[3] = &unk_1E7079D10;
    v12[4] = self;
    objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LANotification proxy](self, "proxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __30__LANotification_notification__block_invoke_2;
    v11[3] = &unk_1E707AB58;
    v11[4] = self;
    objc_msgSend(v6, "addNotificationObserver:className:completionHandler:", v7, v9, v11);

    notification = self->_notification;
  }
  return notification;
}

void __30__LANotification_notification__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(_QWORD *)(v1 + 8) = 0;

}

void __30__LANotification_notification__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), a2);
}

- (id)darwinNotificationForValue:(id)a3
{
  return 0;
}

- (BOOL)appMustBeActive
{
  return self->_appMustBeActive;
}

- (void)setAppMustBeActive:(BOOL)a3
{
  self->_appMustBeActive = a3;
  -[LANotification _observeAppActivity:](self, "_observeAppActivity:");
  -[LANotification _checkWaiting](self, "_checkWaiting");
}

- (void)_observeAppActivity:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C99D20];
  -[LANotification _notificationNameWhenAppIsActive:](self, "_notificationNameWhenAppIsActive:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LANotification _notificationNameWhenAppIsActive:](self, "_notificationNameWhenAppIsActive:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithObjects:", v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v3)
          objc_msgSend(v15, "addObserver:selector:name:object:", self, sel__appActivityChanged_, v14, 0);
        else
          objc_msgSend(v15, "removeObserver:name:object:", self, v14, 0);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

}

- (id)_notificationNameWhenAppIsActive:(BOOL)a3
{
  if (a3)
    return CFSTR("UIApplicationDidBecomeActiveNotification");
  else
    return CFSTR("UIApplicationWillResignActiveNotification");
}

- (void)_appActivityChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LANotification _notificationNameWhenAppIsActive:](self, "_notificationNameWhenAppIsActive:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) != 0
    || (objc_msgSend(v4, "name"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        -[LANotification _notificationNameWhenAppIsActive:](self, "_notificationNameWhenAppIsActive:", 0),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v8, "isEqualToString:", v9),
        v9,
        v8,
        v10))
  {
    _appIsActive = v7 ^ 1;
  }
  LA_LOG_6();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[LANotification _appActivityChanged:].cold.1((uint64_t)self, (uint64_t)v4, v11);

  -[LANotification _checkWaiting](self, "_checkWaiting");
}

- (void)_checkWaiting
{
  if (self->_waitingForActivation && (_appIsActive != 1 || !-[LANotification appMustBeActive](self, "appMustBeActive")))
  {
    self->_waitingForActivation = 0;
    -[LANotification _notifyObserverWithAction:completionHandler:](self, "_notifyObserverWithAction:completionHandler:", CFSTR("activated pending notification"), &__block_literal_global_14);
  }
}

- (LANotificationObserver)observer
{
  return (LANotificationObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (BOOL)notifyOnResume
{
  return self->_notifyOnResume;
}

- (void)setNotifyOnResume:(BOOL)a3
{
  self->_notifyOnResume = a3;
}

- (NSObject)value
{
  return self->_value;
}

- (NSObject)oldValue
{
  return self->_oldValue;
}

- (LANotificationProxy)proxy
{
  return self->_proxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_oldValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)_appActivityChanged:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  const char *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = 138543874;
  v5 = a1;
  if (_appIsActive)
    v3 = "inactive";
  else
    v3 = "active";
  v6 = 2114;
  v7 = a2;
  v8 = 2082;
  v9 = v3;
  _os_log_debug_impl(&dword_1B971E000, log, OS_LOG_TYPE_DEBUG, "%{public}@ received %{public}@, app is %{public}s", (uint8_t *)&v4, 0x20u);
}

@end
