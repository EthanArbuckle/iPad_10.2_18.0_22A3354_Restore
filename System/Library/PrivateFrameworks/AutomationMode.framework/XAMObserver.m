@implementation XAMObserver

+ (void)resetSharedObserver
{
  void *v0;
  id obj;

  obj = (id)objc_opt_self();
  objc_sync_enter(obj);
  v0 = (void *)XAMSharedObserver;
  XAMSharedObserver = 0;

  objc_sync_exit(obj);
}

+ (XAMObserver)sharedInstance
{
  id v2;
  XAMObserver *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = a1;
  objc_sync_enter(v2);
  if (!XAMSharedObserver)
  {
    v3 = [XAMObserver alloc];
    XAMAutomationModeStateChangedNotificationName();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[XAMObserver initWithChangeNotificationName:readerConnectionFactory:](v3, "initWithChangeNotificationName:readerConnectionFactory:", v4, &__block_literal_global_1);
    v6 = (void *)XAMSharedObserver;
    XAMSharedObserver = v5;

  }
  objc_sync_exit(v2);

  return (XAMObserver *)(id)XAMSharedObserver;
}

id __29__XAMObserver_sharedInstance__block_invoke()
{
  void *v0;
  NSObject *v1;
  void *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  XAMAutomationModeReaderMachServiceName();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  XAMLog();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = v0;
    _os_log_impl(&dword_22D1E0000, v1, OS_LOG_TYPE_DEFAULT, "XAM shared observer connecting to %{public}@", (uint8_t *)&v5, 0xCu);
  }

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", v0, 0);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255D67850);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRemoteObjectInterface:", v3);

  objc_msgSend(v2, "resume");
  return v2;
}

- (XAMObserver)initWithChangeNotificationName:(id)a3 readerConnectionFactory:(id)a4
{
  id v5;
  id v6;
  XAMObserver *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  NSMutableDictionary *handlers;
  uint64_t v12;
  NSString *changeNotificationName;
  uint64_t v14;
  id readerConnectionFactory;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)XAMObserver;
  v5 = a4;
  v6 = a3;
  v7 = -[XAMObserver init](&v17, sel_init);
  v8 = dispatch_queue_create("com.apple.dt.automationmode-reader", 0);
  queue = v7->_queue;
  v7->_queue = (OS_dispatch_queue *)v8;

  v10 = objc_opt_new();
  handlers = v7->_handlers;
  v7->_handlers = (NSMutableDictionary *)v10;

  v7->_observationToken = -1;
  v12 = objc_msgSend(v6, "copy", v17.receiver, v17.super_class);

  changeNotificationName = v7->_changeNotificationName;
  v7->_changeNotificationName = (NSString *)v12;

  v14 = objc_msgSend(v5, "copy");
  readerConnectionFactory = v7->_readerConnectionFactory;
  v7->_readerConnectionFactory = (id)v14;

  -[XAMObserver _listenForAutomationModeChangeNotifications](v7, "_listenForAutomationModeChangeNotifications");
  return v7;
}

- (void)dealloc
{
  int observationToken;
  objc_super v4;

  observationToken = self->_observationToken;
  if (observationToken != -1)
    notify_cancel(observationToken);
  v4.receiver = self;
  v4.super_class = (Class)XAMObserver;
  -[XAMObserver dealloc](&v4, sel_dealloc);
}

- (BOOL)currentAutomationModeEnabledStateFromDaemon
{
  void *v3;
  void *v4;
  char v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  (*((void (**)(void))self->_readerConnectionFactory + 2))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__XAMObserver_currentAutomationModeEnabledStateFromDaemon__block_invoke_13;
  v7[3] = &unk_24F869378;
  v7[4] = &v8;
  objc_msgSend(v4, "requestAutomationModeEnabledStateWithReply:", v7);
  objc_msgSend(v3, "invalidate");
  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __58__XAMObserver_currentAutomationModeEnabledStateFromDaemon__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  XAMLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __58__XAMObserver_currentAutomationModeEnabledStateFromDaemon__block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

uint64_t __58__XAMObserver_currentAutomationModeEnabledStateFromDaemon__block_invoke_13(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)_listenForAutomationModeChangeNotifications
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_22D1E0000, a2, OS_LOG_TYPE_FAULT, "Failed to register for notifications of Automation Mode, status: %d", (uint8_t *)v2, 8u);
}

void __58__XAMObserver__listenForAutomationModeChangeNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  XAMLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "changeNotificationName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_22D1E0000, v2, OS_LOG_TYPE_DEFAULT, "Handling posted change notification (%{public}@)", (uint8_t *)&v4, 0xCu);

  }
  objc_msgSend(WeakRetained, "_notifyHandlers");

}

- (void)_notifyHandlers
{
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 isAutomationModeEnabled;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *Property;
  uint64_t v15;
  _QWORD v16[5];
  BOOL v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  _BOOL4 v24;
  __int16 v25;
  _BOOL4 v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = -[XAMObserver currentAutomationModeEnabledStateFromDaemon](self, "currentAutomationModeEnabledStateFromDaemon");
  XAMLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    isAutomationModeEnabled = self->_isAutomationModeEnabled;
    *(_DWORD *)buf = 67109376;
    v24 = isAutomationModeEnabled;
    v25 = 1024;
    v26 = v3;
    _os_log_impl(&dword_22D1E0000, v4, OS_LOG_TYPE_DEFAULT, "Comparing previous enabled state (%d) to current enabled state (%d)", buf, 0xEu);
  }

  if (!self->_hasReceivedAutomationModeEnabledState || self->_isAutomationModeEnabled != v3)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[NSMutableDictionary allValues](self->_handlers, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v9 = v7;
      v10 = *(_QWORD *)v19;
      v11 = MEMORY[0x24BDAC760];
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v6);
          v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
          if (v13)
            Property = objc_getProperty(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12), v8, 8, 1);
          else
            Property = 0;
          v16[0] = v11;
          v16[1] = 3221225472;
          v16[2] = __30__XAMObserver__notifyHandlers__block_invoke;
          v16[3] = &unk_24F8693C8;
          v16[4] = v13;
          v17 = v3;
          dispatch_async(Property, v16);
          ++v12;
        }
        while (v9 != v12);
        v15 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        v9 = v15;
      }
      while (v15);
    }

  }
  self->_isAutomationModeEnabled = v3;
  self->_hasReceivedAutomationModeEnabledState = 1;
}

uint64_t __30__XAMObserver__notifyHandlers__block_invoke(uint64_t a1, const char *a2)
{
  uint64_t (**Property)(id, _QWORD);

  Property = (uint64_t (**)(id, _QWORD))objc_getProperty(*(id *)(a1 + 32), a2, 16, 1);
  return Property[2](Property, *(unsigned __int8 *)(a1 + 40));
}

- (id)registerAutomationModeChangeHandlerOnQueue:(id)a3 withBlock:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id *v10;
  uint64_t v11;
  NSObject *queue;
  id v13;
  id *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  BOOL v21;
  _QWORD block[5];
  id v23;
  id *v24;

  v6 = a4;
  v7 = (void *)MEMORY[0x24BDD1880];
  v8 = a3;
  objc_msgSend(v7, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[XAMHandlerRecord initWithQueue:block:]([XAMHandlerRecord alloc], v8, v6);
  v11 = MEMORY[0x24BDAC760];
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__XAMObserver_registerAutomationModeChangeHandlerOnQueue_withBlock___block_invoke;
  block[3] = &unk_24F8693F0;
  block[4] = self;
  v13 = v9;
  v23 = v13;
  v24 = v10;
  v14 = v10;
  dispatch_sync(queue, block);
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __68__XAMObserver_registerAutomationModeChangeHandlerOnQueue_withBlock___block_invoke_2;
  v19[3] = &unk_24F869418;
  v20 = v6;
  v21 = -[XAMObserver isAutomationModeEnabled](self, "isAutomationModeEnabled");
  v15 = v6;
  dispatch_async(v8, v19);

  v16 = v20;
  v17 = v13;

  return v17;
}

uint64_t __68__XAMObserver_registerAutomationModeChangeHandlerOnQueue_withBlock___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 8), "setObject:forKeyedSubscript:", a1[6], a1[5]);
}

uint64_t __68__XAMObserver_registerAutomationModeChangeHandlerOnQueue_withBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)unregisterAutomationModeChangeHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__XAMObserver_unregisterAutomationModeChangeHandler___block_invoke;
  block[3] = &unk_24F869440;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __53__XAMObserver_unregisterAutomationModeChangeHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
}

- (BOOL)isAutomationModeEnabled
{
  NSObject *queue;
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
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__XAMObserver_isAutomationModeEnabled__block_invoke;
  v5[3] = &unk_24F869468;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

_BYTE *__38__XAMObserver_isAutomationModeEnabled__block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[17])
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = objc_msgSend(result, "currentAutomationModeEnabledStateFromDaemon");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 17) = 1;
    result = *(_BYTE **)(a1 + 32);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result[16];
  return result;
}

- (BOOL)automationModeRequiresAuthentication
{
  void *v2;
  void *v3;
  char v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  (*((void (**)(void))self->_readerConnectionFactory + 2))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_19_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__XAMObserver_automationModeRequiresAuthentication__block_invoke_20;
  v6[3] = &unk_24F869378;
  v6[4] = &v7;
  objc_msgSend(v3, "requestAutomationModeRequiresAuthenticationWithReply:", v6);
  objc_msgSend(v2, "invalidate");
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __51__XAMObserver_automationModeRequiresAuthentication__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  XAMLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __58__XAMObserver_currentAutomationModeEnabledStateFromDaemon__block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

uint64_t __51__XAMObserver_automationModeRequiresAuthentication__block_invoke_20(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)readerConnectionFactory
{
  return objc_getProperty(self, a2, 24, 1);
}

- (NSString)changeNotificationName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_changeNotificationName, 0);
  objc_storeStrong(&self->_readerConnectionFactory, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
}

void __58__XAMObserver_currentAutomationModeEnabledStateFromDaemon__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22D1E0000, a2, a3, "XPC error: %@", a5, a6, a7, a8, 2u);
}

@end
