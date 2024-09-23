@implementation CLKComplicationClient

- (CLKComplicationClient)initWithConnection:(id)a3
{
  id v5;
  CLKComplicationClient *v6;
  CLKComplicationClient *v7;
  uint64_t v8;
  NSNumber *pid;
  NSXPCConnection *connection;
  void *v11;
  NSXPCConnection *v12;
  void *v13;
  NSXPCConnection *v14;
  uint64_t v15;
  NSHashTable *invalidationObservers;
  NSLock *v17;
  NSLock *invalidationObserversLock;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id location;
  objc_super v26;

  v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CLKComplicationClient;
  v6 = -[CLKComplicationClient init](&v26, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v5, "processIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    pid = v7->_pid;
    v7->_pid = (NSNumber *)v8;

    connection = v7->_connection;
    CLKComplicationClientInterface();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](connection, "setRemoteObjectInterface:", v11);

    v12 = v7->_connection;
    CLKComplicationServerInterface();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v12, "setExportedInterface:", v13);

    -[NSXPCConnection setExportedObject:](v7->_connection, "setExportedObject:", v7);
    objc_initWeak(&location, v7);
    v14 = v7->_connection;
    v20 = MEMORY[0x24BDAC760];
    v21 = 3221225472;
    v22 = __44__CLKComplicationClient_initWithConnection___block_invoke;
    v23 = &unk_24CBF9088;
    objc_copyWeak(&v24, &location);
    -[NSXPCConnection setInvalidationHandler:](v14, "setInvalidationHandler:", &v20);
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517, v20, v21, v22, v23);
    v15 = objc_claimAutoreleasedReturnValue();
    invalidationObservers = v7->_invalidationObservers;
    v7->_invalidationObservers = (NSHashTable *)v15;

    v17 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    invalidationObserversLock = v7->_invalidationObserversLock;
    v7->_invalidationObserversLock = v17;

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __44__CLKComplicationClient_initWithConnection___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__CLKComplicationClient_initWithConnection___block_invoke_2;
  block[3] = &unk_24CBF9088;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v2);
}

void __44__CLKComplicationClient_initWithConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleConnectionInvalidated");

}

- (void)setActiveComplications:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_activeComplications, a3);
  v5 = a3;
  -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActiveComplications:", v5);

}

- (void)addInvalidationObserver:(id)a3
{
  NSLock *invalidationObserversLock;
  id v5;

  invalidationObserversLock = self->_invalidationObserversLock;
  v5 = a3;
  -[NSLock lock](invalidationObserversLock, "lock");
  -[NSHashTable addObject:](self->_invalidationObservers, "addObject:", v5);

  -[NSLock unlock](self->_invalidationObserversLock, "unlock");
}

- (void)removeInvalidationObserver:(id)a3
{
  NSLock *invalidationObserversLock;
  id v5;

  invalidationObserversLock = self->_invalidationObserversLock;
  v5 = a3;
  -[NSLock lock](invalidationObserversLock, "lock");
  -[NSHashTable removeObject:](self->_invalidationObservers, "removeObject:", v5);

  -[NSLock unlock](self->_invalidationObserversLock, "unlock");
}

- (void)invalidate
{
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
}

- (void)_handleConnectionInvalidated
{
  NSXPCConnection *connection;
  void (**invalidationHandler)(id, CLKComplicationClient *);
  id v5;
  id checkinHandler;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", 0);
    connection = self->_connection;
    self->_connection = 0;

    invalidationHandler = (void (**)(id, CLKComplicationClient *))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2](invalidationHandler, self);
      v5 = self->_invalidationHandler;
    }
    else
    {
      v5 = 0;
    }
    self->_invalidationHandler = 0;

    checkinHandler = self->_checkinHandler;
    self->_checkinHandler = 0;

    -[NSLock lock](self->_invalidationObserversLock, "lock");
    -[NSHashTable allObjects](self->_invalidationObservers, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSLock unlock](self->_invalidationObserversLock, "unlock");
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "complicationClientInvalidated:", self, (_QWORD)v13);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

    -[NSLock lock](self->_invalidationObserversLock, "lock");
    -[NSHashTable removeAllObjects](self->_invalidationObservers, "removeAllObjects");
    -[NSLock unlock](self->_invalidationObserversLock, "unlock");

  }
}

- (void)checkinWithClientIdentifier:(id)a3 bundlePath:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__CLKComplicationClient_checkinWithClientIdentifier_bundlePath___block_invoke;
  block[3] = &unk_24CBFA5C0;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __64__CLKComplicationClient_checkinWithClientIdentifier_bundlePath___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 48));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 80);
    *(_QWORD *)(v3 + 80) = 0;

  }
}

- (void)reloadTimelineForComplication:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CLKComplicationClient *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__CLKComplicationClient_reloadTimelineForComplication___block_invoke;
  v6[3] = &unk_24CBFA008;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __55__CLKComplicationClient_reloadTimelineForComplication___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  CLKLoggingObjectForDomain(1);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_2114F4000, v2, OS_LOG_TYPE_DEFAULT, "Requesting timeline reload for %@", (uint8_t *)&v5, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 64));
  objc_msgSend(WeakRetained, "complicationClient:reloadTimelineForComplication:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

- (void)extendTimelineForComplication:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CLKComplicationClient *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__CLKComplicationClient_extendTimelineForComplication___block_invoke;
  v6[3] = &unk_24CBFA008;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __55__CLKComplicationClient_extendTimelineForComplication___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  CLKLoggingObjectForDomain(1);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_2114F4000, v2, OS_LOG_TYPE_DEFAULT, "Requesting timeline extension for %@", (uint8_t *)&v5, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 64));
  objc_msgSend(WeakRetained, "complicationClient:extendTimelineForComplication:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

- (void)reloadComplicationDescriptors
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__CLKComplicationClient_reloadComplicationDescriptors__block_invoke;
  block[3] = &unk_24CBF9F60;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __54__CLKComplicationClient_reloadComplicationDescriptors__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  CLKLoggingObjectForDomain(1);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2114F4000, v2, OS_LOG_TYPE_DEFAULT, "Requesting complication descriptor reload", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  objc_msgSend(WeakRetained, "reloadComplicationDescriptorsForComplicationClient:", *(_QWORD *)(a1 + 32));

}

- (void)getTimelineEndDateForComplication:(id)a3 withHandler:(id)a4
{
  NSXPCConnection *connection;
  id v6;
  id v7;
  id v8;

  connection = self->_connection;
  v6 = a4;
  v7 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_12);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getTimelineEndDateForComplication:withHandler:", v7, v6);

}

void __71__CLKComplicationClient_getTimelineEndDateForComplication_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  CLKLoggingObjectForDomain(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __71__CLKComplicationClient_getTimelineEndDateForComplication_withHandler___block_invoke_cold_1();

}

- (void)getPrivacyBehaviorForComplication:(id)a3 withHandler:(id)a4
{
  NSXPCConnection *connection;
  id v6;
  id v7;
  id v8;

  connection = self->_connection;
  v6 = a4;
  v7 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getPrivacyBehaviorForComplication:withHandler:", v7, v6);

}

void __71__CLKComplicationClient_getPrivacyBehaviorForComplication_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  CLKLoggingObjectForDomain(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __71__CLKComplicationClient_getPrivacyBehaviorForComplication_withHandler___block_invoke_cold_1();

}

- (void)getAlwaysOnTemplateForComplication:(id)a3 withHandler:(id)a4
{
  NSXPCConnection *connection;
  id v6;
  id v7;
  id v8;

  connection = self->_connection;
  v6 = a4;
  v7 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getAlwaysOnTemplateForComplication:withHandler:", v7, v6);

}

void __72__CLKComplicationClient_getAlwaysOnTemplateForComplication_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  CLKLoggingObjectForDomain(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __72__CLKComplicationClient_getAlwaysOnTemplateForComplication_withHandler___block_invoke_cold_1();

}

- (void)getTimelineAnimationBehaviorForComplication:(id)a3 withHandler:(id)a4
{
  NSXPCConnection *connection;
  id v6;
  id v7;
  id v8;

  connection = self->_connection;
  v6 = a4;
  v7 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getTimelineAnimationBehaviorForComplication:withHandler:", v7, v6);

}

void __81__CLKComplicationClient_getTimelineAnimationBehaviorForComplication_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  CLKLoggingObjectForDomain(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __81__CLKComplicationClient_getTimelineAnimationBehaviorForComplication_withHandler___block_invoke_cold_1();

}

- (void)getCurrentTimelineEntryForComplication:(id)a3 withHandler:(id)a4
{
  NSXPCConnection *connection;
  id v6;
  id v7;
  id v8;

  connection = self->_connection;
  v6 = a4;
  v7 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getCurrentTimelineEntryForComplication:withHandler:", v7, v6);

}

void __76__CLKComplicationClient_getCurrentTimelineEntryForComplication_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  CLKLoggingObjectForDomain(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __76__CLKComplicationClient_getCurrentTimelineEntryForComplication_withHandler___block_invoke_cold_1();

}

- (void)getTimelineEntriesForComplication:(id)a3 afterDate:(id)a4 limit:(unint64_t)a5 withHandler:(id)a6
{
  NSXPCConnection *connection;
  id v10;
  id v11;
  id v12;
  id v13;

  connection = self->_connection;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_8);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "getTimelineEntriesForComplication:afterDate:limit:withHandler:", v12, v11, a5, v10);

}

void __87__CLKComplicationClient_getTimelineEntriesForComplication_afterDate_limit_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  CLKLoggingObjectForDomain(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __87__CLKComplicationClient_getTimelineEntriesForComplication_afterDate_limit_withHandler___block_invoke_cold_1();

}

- (void)getNextRequestedUpdateDateWithHandler:(id)a3
{
  NSXPCConnection *connection;
  id v4;
  id v5;

  connection = self->_connection;
  v4 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_9);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getNextRequestedUpdateDateWithHandler:", v4);

}

void __63__CLKComplicationClient_getNextRequestedUpdateDateWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  CLKLoggingObjectForDomain(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __63__CLKComplicationClient_getNextRequestedUpdateDateWithHandler___block_invoke_cold_1();

}

- (void)requestedUpdateDidBegin
{
  id v2;

  -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestedUpdateDidBegin");

}

- (void)requestedUpdateBudgetExhausted
{
  id v2;

  -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestedUpdateBudgetExhausted");

}

- (void)getLocalizableSampleTemplateForComplication:(id)a3 withHandler:(id)a4
{
  NSXPCConnection *connection;
  id v6;
  id v7;
  id v8;

  connection = self->_connection;
  v6 = a4;
  v7 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_10);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getLocalizableSampleTemplateForComplication:withHandler:", v7, v6);

}

void __81__CLKComplicationClient_getLocalizableSampleTemplateForComplication_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  CLKLoggingObjectForDomain(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __81__CLKComplicationClient_getLocalizableSampleTemplateForComplication_withHandler___block_invoke_cold_1();

}

- (void)getComplicationDescriptorsWithHandler:(id)a3
{
  NSXPCConnection *connection;
  id v4;
  id v5;

  connection = self->_connection;
  v4 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_11);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getComplicationDescriptorsWithHandler:", v4);

}

void __63__CLKComplicationClient_getComplicationDescriptorsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  CLKLoggingObjectForDomain(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __63__CLKComplicationClient_getComplicationDescriptorsWithHandler___block_invoke_cold_1();

}

- (void)handleSharedComplicationDescriptors:(id)a3
{
  NSXPCConnection *connection;
  id v4;
  id v5;

  connection = self->_connection;
  v4 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_12);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleSharedComplicationDescriptors:", v4);

}

void __61__CLKComplicationClient_handleSharedComplicationDescriptors___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  CLKLoggingObjectForDomain(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __61__CLKComplicationClient_handleSharedComplicationDescriptors___block_invoke_cold_1();

}

- (void)notifyDebugTimeoutWithCharging:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_13);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notifyDebugTimeoutWithCharging:", v3);

}

void __56__CLKComplicationClient_notifyDebugTimeoutWithCharging___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  CLKLoggingObjectForDomain(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __56__CLKComplicationClient_notifyDebugTimeoutWithCharging___block_invoke_cold_1();

}

- (void)getWidgetMigrationConfigurationFrom:(id)a3 withHandler:(id)a4
{
  NSXPCConnection *connection;
  id v6;
  id v7;
  id v8;

  connection = self->_connection;
  v6 = a4;
  v7 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_14_0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getWidgetMigrationConfigurationFrom:withHandler:", v7, v6);

}

void __73__CLKComplicationClient_getWidgetMigrationConfigurationFrom_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  CLKLoggingObjectForDomain(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __73__CLKComplicationClient_getWidgetMigrationConfigurationFrom_withHandler___block_invoke_cold_1();

}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)clientBundlePath
{
  return self->_clientBundlePath;
}

- (NSNumber)pid
{
  return self->_pid;
}

- (CLKComplicationClientDelegate)delegate
{
  return (CLKComplicationClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSSet)activeComplications
{
  return self->_activeComplications;
}

- (id)checkinHandler
{
  return self->_checkinHandler;
}

- (void)setCheckinHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_checkinHandler, 0);
  objc_storeStrong((id *)&self->_activeComplications, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pid, 0);
  objc_storeStrong((id *)&self->_clientBundlePath, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_invalidationObserversLock, 0);
  objc_storeStrong((id *)&self->_invalidationObservers, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __71__CLKComplicationClient_getTimelineEndDateForComplication_withHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_2114F4000, v0, v1, "CLKComplicationClient getTimelineEndDate error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __71__CLKComplicationClient_getPrivacyBehaviorForComplication_withHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_2114F4000, v0, v1, "CLKComplicationClient getPrivacyBehavior error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __72__CLKComplicationClient_getAlwaysOnTemplateForComplication_withHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_2114F4000, v0, v1, "CLKComplicationClient getAlwaysOnTemplateForComplication error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __81__CLKComplicationClient_getTimelineAnimationBehaviorForComplication_withHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_2114F4000, v0, v1, "CLKComplicationClient getTimelineAnimationBehavior error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __76__CLKComplicationClient_getCurrentTimelineEntryForComplication_withHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_2114F4000, v0, v1, "CLKComplicationClient getCurrentTimelineEntry error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __87__CLKComplicationClient_getTimelineEntriesForComplication_afterDate_limit_withHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_2114F4000, v0, v1, "CLKComplicationClient getTimelineEntriesAfterDate error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __63__CLKComplicationClient_getNextRequestedUpdateDateWithHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_2114F4000, v0, v1, "CLKComplicationClient getNextRequestedUpdate error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __81__CLKComplicationClient_getLocalizableSampleTemplateForComplication_withHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_2114F4000, v0, v1, "CLKComplicationClient getLocalizableSampleTemplate error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __63__CLKComplicationClient_getComplicationDescriptorsWithHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_2114F4000, v0, v1, "CLKComplicationClient getComplicationDescriptorsWithHandler error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __61__CLKComplicationClient_handleSharedComplicationDescriptors___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_2114F4000, v0, v1, "CLKComplicationClient handleSharedComplicationDescriptors error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __56__CLKComplicationClient_notifyDebugTimeoutWithCharging___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_2114F4000, v0, v1, "CLKComplicationClient notifyDebugTimeoutWithCharging error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __73__CLKComplicationClient_getWidgetMigrationConfigurationFrom_withHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_2114F4000, v0, v1, "CLKComplicationClient getWidgetConfigurationFrom:withHandler: error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
