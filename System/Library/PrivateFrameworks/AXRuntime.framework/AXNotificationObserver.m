@implementation AXNotificationObserver

- (AXNotificationObserver)initWithNotifications:(id)a3
{
  id v4;
  AXNotificationObserver *v5;
  AXNotificationObserver *v6;
  _QWORD v8[4];
  AXNotificationObserver *v9;
  id v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AXNotificationObserver;
  v5 = -[AXNotificationObserver init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    -[AXNotificationObserver setNotifications:](v5, "setNotifications:", v4);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __48__AXNotificationObserver_initWithNotifications___block_invoke;
    v8[3] = &unk_1E6919510;
    v9 = v6;
    v10 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v8);

  }
  return v6;
}

void __48__AXNotificationObserver_initWithNotifications___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v6;
  __CFRunLoop *Current;

  +[AXElement systemWideElement](AXElement, "systemWideElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = AXObserverCreateWithPidObserver(objc_msgSend(v2, "pid"), (uint64_t)_accessibilityNotificationCallback, (uint64_t *)(*(_QWORD *)(a1 + 32) + 8), *(void **)(a1 + 32));

  if (v3)
  {
    AXLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __48__AXNotificationObserver_initWithNotifications___block_invoke_cold_2(v3, v4);
LABEL_4:

    return;
  }
  RunLoopSource = AXObserverGetRunLoopSource(*(AXObserverRef *)(*(_QWORD *)(a1 + 32) + 8));
  if (!RunLoopSource)
  {
    AXLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __48__AXNotificationObserver_initWithNotifications___block_invoke_cold_1(v4);
    goto LABEL_4;
  }
  v6 = RunLoopSource;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddSource(Current, v6, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
  objc_msgSend(*(id *)(a1 + 32), "_registerForAXNotifications:", 1);
}

- (void)_registerForAXNotifications:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  const __CFString *v9;
  __AXObserver *observer;
  void *v11;
  void *v12;
  const __AXUIElement *v13;
  AXError v14;
  AXError v15;
  NSObject *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[AXNotificationObserver notifications](self, "notifications");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v5)
    goto LABEL_18;
  v6 = v5;
  v7 = *(_QWORD *)v20;
  while (2)
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v20 != v7)
        objc_enumerationMutation(obj);
      v9 = (const __CFString *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "intValue");
      observer = self->_observer;
      +[AXElement systemWideElement](AXElement, "systemWideElement");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "uiElement");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (const __AXUIElement *)objc_msgSend(v12, "axElement");
      if (v3)
      {
        v14 = AXObserverAddNotification(observer, v13, v9, self);

        if (v14)
        {
          AXLogCommon();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            -[AXNotificationObserver _registerForAXNotifications:].cold.1();
LABEL_17:

          goto LABEL_18;
        }
      }
      else
      {
        v15 = AXObserverRemoveNotification(observer, v13, v9);

        if (v15)
        {
          AXLogCommon();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            -[AXNotificationObserver _registerForAXNotifications:].cold.2();
          goto LABEL_17;
        }
      }
    }
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
      continue;
    break;
  }
LABEL_18:

}

- (void)_didObserveNotification:(int)a3 notificationData:(void *)a4
{
  uint64_t v5;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  v5 = *(_QWORD *)&a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AXNotificationObserver.m"), 87, CFSTR("Expected notification callback on the main thread"));

  }
  -[AXNotificationObserver notifications](self, "notifications");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "containsObject:", v9);

  if (v10)
  {
    -[AXNotificationObserver delegate](self, "delegate");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "observer:didObserveNotification:notificationData:", self, v5, a4);

  }
}

- (void)dealloc
{
  objc_super v3;

  if (self->_observer)
  {
    -[AXNotificationObserver _registerForAXNotifications:](self, "_registerForAXNotifications:", 0);
    CFRelease(self->_observer);
  }
  v3.receiver = self;
  v3.super_class = (Class)AXNotificationObserver;
  -[AXNotificationObserver dealloc](&v3, sel_dealloc);
}

- (AXNotificationObserverDelegate)delegate
{
  return (AXNotificationObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)notifications
{
  return self->_notifications;
}

- (void)setNotifications:(id)a3
{
  objc_storeStrong((id *)&self->_notifications, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifications, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __48__AXNotificationObserver_initWithNotifications___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B54A6000, log, OS_LOG_TYPE_ERROR, "Unable to get observer run loop source", v1, 2u);
}

void __48__AXNotificationObserver_initWithNotifications___block_invoke_cold_2(int a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1B54A6000, a2, OS_LOG_TYPE_ERROR, "Error creating AXObserver: %ld", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)_registerForAXNotifications:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  int v3;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1B54A6000, v0, v1, "Unable to register for notification %ld with error %d", v2, v3);
  OUTLINED_FUNCTION_2();
}

- (void)_registerForAXNotifications:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  int v3;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1B54A6000, v0, v1, "Unable to unregister for notification %ld with error %d", v2, v3);
  OUTLINED_FUNCTION_2();
}

@end
