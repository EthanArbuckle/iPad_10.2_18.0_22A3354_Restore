@implementation CalDeviceLockObserver

- (CalDeviceLockObserver)init
{
  return -[CalDeviceLockObserver initWithStateChangedCallback:](self, "initWithStateChangedCallback:", &__block_literal_global_22);
}

- (CalDeviceLockObserver)initWithStateChangedCallback:(id)a3
{
  id v4;
  CalDeviceLockObserver *v5;
  CalDeviceLockObserver *v6;
  objc_class *v7;
  id v8;
  const char *v9;
  dispatch_queue_t v10;
  objc_class *v11;
  id v12;
  const char *v13;
  dispatch_queue_t v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CalDeviceLockObserver;
  v5 = -[CalDeviceLockObserver init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    -[CalDeviceLockObserver setStateChangedCallback:](v5, "setStateChangedCallback:", v4);
    v7 = (objc_class *)objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain(v7, CFSTR("work"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = (const char *)objc_msgSend(v8, "UTF8String");

    v10 = dispatch_queue_create(v9, 0);
    -[CalDeviceLockObserver setWorkQueue:](v6, "setWorkQueue:", v10);

    v11 = (objc_class *)objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain(v11, CFSTR("callback"));
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = (const char *)objc_msgSend(v12, "UTF8String");

    v14 = dispatch_queue_create(v13, MEMORY[0x1E0C80D50]);
    -[CalDeviceLockObserver setCallbackQueue:](v6, "setCallbackQueue:", v14);

  }
  return v6;
}

- (void)_notificationReceived
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "notificationListener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_3_1(&dword_18FC12000, a2, v5, "Notification received: [%@]", (uint8_t *)&v6);

  OUTLINED_FUNCTION_2_0();
}

void __46__CalDeviceLockObserver__notificationReceived__block_invoke(uint64_t a1)
{
  id *v1;
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;

  v1 = (id *)(a1 + 32);
  v2 = objc_msgSend((id)objc_opt_class(), "hasBeenUnlockedSinceBoot");
  objc_msgSend(*v1, "setInternalHasBeenUnlockedSinceBoot:", v2);
  if ((_DWORD)v2)
  {
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __46__CalDeviceLockObserver__notificationReceived__block_invoke_cold_1();

    objc_msgSend(*v1, "notificationListener");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(*v1, "notificationListener");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deactivate");

      objc_msgSend(*v1, "setNotificationListener:", 0);
    }
  }
  objc_msgSend(*v1, "stateChangedCallback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*v1, "callbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__CalDeviceLockObserver__notificationReceived__block_invoke_4;
    block[3] = &unk_1E2A83DD8;
    v9 = v6;
    dispatch_async(v7, block);

  }
}

uint64_t __46__CalDeviceLockObserver__notificationReceived__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)hasBeenUnlockedSinceBoot
{
  CalDeviceLockObserver *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[CalDeviceLockObserver workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__CalDeviceLockObserver_hasBeenUnlockedSinceBoot__block_invoke;
  v5[3] = &unk_1E2A84E78;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __49__CalDeviceLockObserver_hasBeenUnlockedSinceBoot__block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  CalDarwinNotificationListener *v8;
  void *v9;
  CalDarwinNotificationListener *v10;
  void *v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  v2 = (id *)(a1 + 32);
  if ((objc_msgSend(*(id *)(a1 + 32), "internalHasBeenUnlockedSinceBoot") & 1) == 0)
  {
    objc_msgSend(*v2, "notificationListener");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v4 = objc_msgSend((id)objc_opt_class(), "hasBeenUnlockedSinceBoot");
      +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        __49__CalDeviceLockObserver_hasBeenUnlockedSinceBoot__block_invoke_cold_2((uint64_t)v2, v4);

      objc_msgSend(*v2, "setInternalHasBeenUnlockedSinceBoot:", v4);
      if ((v4 & 1) == 0)
      {
        +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          __49__CalDeviceLockObserver_hasBeenUnlockedSinceBoot__block_invoke_cold_1((uint64_t *)v2, v6, v7);

        objc_initWeak(&location, *v2);
        v8 = [CalDarwinNotificationListener alloc];
        objc_msgSend((id)objc_opt_class(), "stateChangedNotificationName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = MEMORY[0x1E0C809B0];
        v14 = 3221225472;
        v15 = __49__CalDeviceLockObserver_hasBeenUnlockedSinceBoot__block_invoke_6;
        v16 = &unk_1E2A84738;
        objc_copyWeak(&v17, &location);
        v10 = -[CalDarwinNotificationListener initWithNotificationName:callback:](v8, "initWithNotificationName:callback:", v9, &v13);
        objc_msgSend(*v2, "setNotificationListener:", v10, v13, v14, v15, v16);

        objc_msgSend(*v2, "notificationListener");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "activate");

        objc_destroyWeak(&v17);
        objc_destroyWeak(&location);
      }
    }
  }
  result = objc_msgSend(*(id *)(a1 + 32), "internalHasBeenUnlockedSinceBoot");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __49__CalDeviceLockObserver_hasBeenUnlockedSinceBoot__block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_notificationReceived");

}

+ (BOOL)hasBeenUnlockedSinceBoot
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v5;

  v2 = MKBDeviceUnlockedSinceBoot();
  v3 = v2;
  if ((v2 & 0x80000000) == 0)
    return (_DWORD)v2 == 1;
  +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    +[CalDeviceLockObserver hasBeenUnlockedSinceBoot].cold.1(v3, v5);

  return 0;
}

+ (NSString)stateChangedNotificationName
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.mobile.keybagd.first_unlock");
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (CalDarwinNotificationListener)notificationListener
{
  return self->_notificationListener;
}

- (void)setNotificationListener:(id)a3
{
  objc_storeStrong((id *)&self->_notificationListener, a3);
}

- (id)stateChangedCallback
{
  return self->_stateChangedCallback;
}

- (void)setStateChangedCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)internalHasBeenUnlockedSinceBoot
{
  return self->_internalHasBeenUnlockedSinceBoot;
}

- (void)setInternalHasBeenUnlockedSinceBoot:(BOOL)a3
{
  self->_internalHasBeenUnlockedSinceBoot = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stateChangedCallback, 0);
  objc_storeStrong((id *)&self->_notificationListener, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __46__CalDeviceLockObserver__notificationReceived__block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  CalBooleanAsString(1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_18FC12000, v1, v2, "Deactivating and setting to nil [%@]'s listener since the value of 'hasBeenUnlockedSinceBoot' is now [%@]", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_0();
}

void __49__CalDeviceLockObserver_hasBeenUnlockedSinceBoot__block_invoke_cold_1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_3_1(&dword_18FC12000, a2, a3, "Starting up [%@]'s listener in order to find out when the value of 'hasBeenUnlockedSinceBoot' should change.", (uint8_t *)&v4);
}

void __49__CalDeviceLockObserver_hasBeenUnlockedSinceBoot__block_invoke_cold_2(uint64_t a1, char a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  CalBooleanAsString(a2 & 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_18FC12000, v3, v4, "[%@]'s listener is not listening.  Found initial 'hasBeenUnlockedSinceBoot' value of [%@]", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

+ (void)hasBeenUnlockedSinceBoot
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_18FC12000, a2, OS_LOG_TYPE_ERROR, "Received an error when calling MKBDeviceUnlockedSinceBoot().  Error code: [%@]", (uint8_t *)&v4, 0xCu);

}

@end
