@implementation CalDarwinNotificationListener

- (CalDarwinNotificationListener)initWithNotificationName:(id)a3 callback:(id)a4 queue:(id)a5
{
  id v9;
  id v10;
  id v11;
  CalDarwinNotificationListener *v12;
  CalDarwinNotificationListener *v13;
  uint64_t v14;
  id callback;
  objc_class *v16;
  id v17;
  const char *v18;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *workQueue;
  OS_dispatch_queue *v22;
  NSObject *callbackQueue;
  objc_class *v24;
  id v25;
  const char *v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *v28;
  objc_super v30;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v30.receiver = self;
  v30.super_class = (Class)CalDarwinNotificationListener;
  v12 = -[CalDarwinNotificationListener init](&v30, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_notificationName, a3);
    v14 = MEMORY[0x19400A168](v10);
    callback = v13->_callback;
    v13->_callback = (id)v14;

    v16 = (objc_class *)objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain(v16, CFSTR("work"));
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = (const char *)objc_msgSend(v17, "UTF8String");

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create(v18, v19);
    workQueue = v13->_workQueue;
    v13->_workQueue = (OS_dispatch_queue *)v20;

    if (v11)
    {
      v22 = (OS_dispatch_queue *)v11;
      callbackQueue = v13->_callbackQueue;
      v13->_callbackQueue = v22;
    }
    else
    {
      v24 = (objc_class *)objc_opt_class();
      CalGenerateQualifiedIdentifierWithClassAndSubdomain(v24, CFSTR("callback"));
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v26 = (const char *)objc_msgSend(v25, "UTF8String");

      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      callbackQueue = objc_claimAutoreleasedReturnValue();
      v27 = dispatch_queue_create(v26, callbackQueue);
      v28 = v13->_callbackQueue;
      v13->_callbackQueue = (OS_dispatch_queue *)v27;

    }
  }

  return v13;
}

- (CalDarwinNotificationListener)initWithNotificationName:(id)a3 callback:(id)a4
{
  return -[CalDarwinNotificationListener initWithNotificationName:callback:queue:](self, "initWithNotificationName:callback:queue:", a3, a4, 0);
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_0(&dword_18FC12000, v0, v1, "The listener has been stopped.  Listener: [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (id)description
{
  CalDescriptionBuilder *v3;
  void *v4;
  CalDescriptionBuilder *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = [CalDescriptionBuilder alloc];
  v9.receiver = self;
  v9.super_class = (Class)CalDarwinNotificationListener;
  -[CalDarwinNotificationListener description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CalDescriptionBuilder initWithSuperclassDescription:](v3, "initWithSuperclassDescription:", v4);

  -[CalDarwinNotificationListener notificationName](self, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDescriptionBuilder setKey:withString:](v5, "setKey:withString:", CFSTR("notificationName"), v6);

  -[CalDescriptionBuilder setKey:withBoolean:](v5, "setKey:withBoolean:", CFSTR("listening"), -[CalDarwinNotificationListener listening](self, "listening"));
  -[CalDescriptionBuilder build](v5, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)activate
{
  NSObject *v3;
  _QWORD block[5];

  -[CalDarwinNotificationListener workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CalDarwinNotificationListener_activate__block_invoke;
  block[3] = &unk_1E2A84760;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __41__CalDarwinNotificationListener_activate__block_invoke(uint64_t a1)
{
  id *v1;
  NSObject *v2;
  NSObject *v3;

  v1 = (id *)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 32), "listening"))
  {
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __41__CalDarwinNotificationListener_activate__block_invoke_cold_1();

  }
  else if (objc_msgSend(*v1, "_addObserver"))
  {
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __41__CalDarwinNotificationListener_activate__block_invoke_cold_2();

    objc_msgSend(*v1, "setListening:", 1);
  }
}

- (void)deactivate
{
  NSObject *v3;
  _QWORD block[5];

  -[CalDarwinNotificationListener workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CalDarwinNotificationListener_deactivate__block_invoke;
  block[3] = &unk_1E2A84760;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __43__CalDarwinNotificationListener_deactivate__block_invoke(uint64_t a1)
{
  id *v1;
  NSObject *v2;
  NSObject *v3;

  v1 = (id *)(a1 + 32);
  if ((objc_msgSend(*(id *)(a1 + 32), "listening") & 1) != 0)
  {
    if (objc_msgSend(*v1, "_removeObserver"))
    {
      +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
        __43__CalDarwinNotificationListener_deactivate__block_invoke_cold_1();

      objc_msgSend(*v1, "setListening:", 0);
    }
  }
  else
  {
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __43__CalDarwinNotificationListener_deactivate__block_invoke_cold_2();

  }
}

- (void)_notificationWithNameReceived:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[5];

  v4 = a3;
  +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CalDarwinNotificationListener _notificationWithNameReceived:].cold.1();

  -[CalDarwinNotificationListener workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__CalDarwinNotificationListener__notificationWithNameReceived___block_invoke;
  block[3] = &unk_1E2A84760;
  block[4] = self;
  dispatch_async(v6, block);

}

void __63__CalDarwinNotificationListener__notificationWithNameReceived___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "listening"))
  {
    objc_msgSend(*(id *)(a1 + 32), "callback");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
      v3 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __63__CalDarwinNotificationListener__notificationWithNameReceived___block_invoke_2;
      block[3] = &unk_1E2A83DD8;
      v5 = v2;
      dispatch_async(v3, block);

    }
  }
}

uint64_t __63__CalDarwinNotificationListener__notificationWithNameReceived___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_addObserver
{
  __CFString *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v5;

  -[CalDarwinNotificationListener notificationName](self, "notificationName");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)CalDarwinNotificationListener_ObservationCallback, v3, 0, (CFNotificationSuspensionBehavior)1024);
  }
  else
  {
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CalDarwinNotificationListener _addObserver].cold.1();

  }
  return v3 != 0;
}

- (BOOL)_removeObserver
{
  __CFString *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v5;

  -[CalDarwinNotificationListener notificationName](self, "notificationName");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v3, 0);
  }
  else
  {
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CalDarwinNotificationListener _removeObserver].cold.1();

  }
  return v3 != 0;
}

- (NSString)notificationName
{
  return self->_notificationName;
}

- (id)callback
{
  return self->_callback;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (BOOL)listening
{
  return self->_listening;
}

- (void)setListening:(BOOL)a3
{
  self->_listening = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_notificationName, 0);
}

void __41__CalDarwinNotificationListener_activate__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18FC12000, v0, v1, "The listener is already listening.  Will not start listening.  Listener: [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __41__CalDarwinNotificationListener_activate__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_18FC12000, v0, v1, "The listener has been started.  Listener: [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __43__CalDarwinNotificationListener_deactivate__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_18FC12000, v0, v1, "The listener has been stopped.  Listener: [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __43__CalDarwinNotificationListener_deactivate__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18FC12000, v0, v1, "The listener is not listening.  Will not stop listening.  Listener: [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_notificationWithNameReceived:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_18FC12000, v1, OS_LOG_TYPE_DEBUG, "Received notification with name: [%@].  Listener: [%@]", v2, 0x16u);
  OUTLINED_FUNCTION_4();
}

- (void)_addObserver
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_18FC12000, v0, v1, "The listener was given a 'nil' notification name.  Will not add it as an observer.  Listener: [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_removeObserver
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_18FC12000, v0, v1, "The listener was given a 'nil' notification name.  Will not remove it as an observer.  Listener: [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
