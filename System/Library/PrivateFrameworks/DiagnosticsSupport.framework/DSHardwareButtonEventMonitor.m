@implementation DSHardwareButtonEventMonitor

- (DSHardwareButtonEventMonitor)init
{
  DSHardwareButtonEventMonitor *v3;
  DSHardwareButtonEventMonitor *v4;
  uint64_t v5;
  NSMutableSet *buttonEventHandlers;
  NSLock *v7;
  NSLock *eventHandlerChangeLock;
  uint64_t v9;
  DSTestAutomation *testAutomation;
  dispatch_queue_t v11;
  OS_dispatch_queue *targetQueue;
  dispatch_queue_t v13;
  OS_dispatch_queue *systemClientCreationQueue;
  DSHardwareButtonEventMonitor *v15;
  objc_super v17;

  if (+[DSEntitlementUtilities currentProcessHasEntitlement:](DSEntitlementUtilities, "currentProcessHasEntitlement:", CFSTR("com.apple.DiagnosticsSupport.HardwareButtonAccess")))
  {
    v17.receiver = self;
    v17.super_class = (Class)DSHardwareButtonEventMonitor;
    v3 = -[DSHardwareButtonEventMonitor init](&v17, sel_init);
    v4 = v3;
    if (v3)
    {
      v3->_allowEvents = 1;
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v5 = objc_claimAutoreleasedReturnValue();
      buttonEventHandlers = v4->_buttonEventHandlers;
      v4->_buttonEventHandlers = (NSMutableSet *)v5;

      v7 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
      eventHandlerChangeLock = v4->_eventHandlerChangeLock;
      v4->_eventHandlerChangeLock = v7;

      +[DSTestAutomation sharedInstance](DSTestAutomation, "sharedInstance");
      v9 = objc_claimAutoreleasedReturnValue();
      testAutomation = v4->_testAutomation;
      v4->_testAutomation = (DSTestAutomation *)v9;

      v11 = dispatch_queue_create("com.apple.DiagnosticsSupport.buttonEventMonitor.targetQueue", 0);
      targetQueue = v4->_targetQueue;
      v4->_targetQueue = (OS_dispatch_queue *)v11;

      v13 = dispatch_queue_create("com.apple.DiagnosticsSupport.buttonEventMonitor.systemClientCreationQueue", 0);
      systemClientCreationQueue = v4->_systemClientCreationQueue;
      v4->_systemClientCreationQueue = (OS_dispatch_queue *)v13;

    }
    self = v4;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)startWithPriority:(int64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  -[DSHardwareButtonEventMonitor systemClientCreationQueue](self, "systemClientCreationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61__DSHardwareButtonEventMonitor_startWithPriority_completion___block_invoke;
  v9[3] = &unk_24E44A458;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __61__DSHardwareButtonEventMonitor_startWithPriority_completion___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && !WeakRetained[1])
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.DiagnosticsSupport.buttonEventMonitor.buttonEventQueue", v4);
    v6 = (void *)v3[6];
    v3[6] = v5;

    v3[1] = IOHIDEventSystemClientCreateWithType();
    v14[0] = CFSTR("PrimaryUsagePage");
    v14[1] = CFSTR("PrimaryUsage");
    v15[0] = &unk_24E44DC60;
    v15[1] = &unk_24E44DC78;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = CFSTR("PrimaryUsagePage");
    v12[1] = CFSTR("PrimaryUsage");
    v13[0] = &unk_24E44DC90;
    v13[1] = &unk_24E44DCA8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    v11[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    IOHIDEventSystemClientSetMatchingMultiple();

    IOHIDEventSystemClientScheduleWithDispatchQueue();
    IOHIDEventSystemClientRegisterEventFilterCallbackWithPriority();

  }
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(void))(v10 + 16))();

}

- (void)stopWithCompletion:(id)a3
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
  -[DSHardwareButtonEventMonitor systemClientCreationQueue](self, "systemClientCreationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__DSHardwareButtonEventMonitor_stopWithCompletion___block_invoke;
  block[3] = &unk_24E44A4A8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __51__DSHardwareButtonEventMonitor_stopWithCompletion___block_invoke(uint64_t a1)
{
  id *v2;
  NSObject **WeakRetained;
  NSObject **v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD block[4];
  id v8;

  v2 = (id *)(a1 + 40);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[6];
    if (v5)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __51__DSHardwareButtonEventMonitor_stopWithCompletion___block_invoke_2;
      block[3] = &unk_24E44A480;
      objc_copyWeak(&v8, v2);
      dispatch_sync(v5, block);
      objc_destroyWeak(&v8);
    }
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(void))(v6 + 16))();

}

void __51__DSHardwareButtonEventMonitor_stopWithCompletion___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[1];
    if (v3)
    {
      v4 = v2;
      MEMORY[0x2207CA0F4](v3, v2[6]);
      IOHIDEventSystemClientUnregisterEventFilterCallback();
      CFRelease((CFTypeRef)v4[1]);
      v2 = v4;
      v4[1] = 0;
    }
  }

}

- (void)addTarget:(id)a3 action:(SEL)a4 forButtonEvents:(unint64_t)a5 propagate:(BOOL)a6
{
  id v10;
  NSObject *v11;
  id v12;
  _QWORD block[4];
  id v14;
  DSHardwareButtonEventMonitor *v15;
  SEL v16;
  unint64_t v17;
  BOOL v18;

  v10 = a3;
  dispatch_get_global_queue(0, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__DSHardwareButtonEventMonitor_addTarget_action_forButtonEvents_propagate___block_invoke;
  block[3] = &unk_24E44A4D0;
  v18 = a6;
  v16 = a4;
  v17 = a5;
  v14 = v10;
  v15 = self;
  v12 = v10;
  dispatch_async(v11, block);

}

void __75__DSHardwareButtonEventMonitor_addTarget_action_forButtonEvents_propagate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  DSHardwareButtonEventHandler *v5;

  v5 = objc_alloc_init(DSHardwareButtonEventHandler);
  -[DSHardwareButtonEventHandler setTarget:](v5, "setTarget:", *(_QWORD *)(a1 + 32));
  -[DSHardwareButtonEventHandler setAction:](v5, "setAction:", *(_QWORD *)(a1 + 48));
  -[DSHardwareButtonEventHandler setPreventPropagation:](v5, "setPreventPropagation:", *(_BYTE *)(a1 + 64) == 0);
  -[DSHardwareButtonEventHandler setEvents:](v5, "setEvents:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "eventHandlerChangeLock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lock");

  objc_msgSend(*(id *)(a1 + 40), "buttonEventHandlers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  objc_msgSend(*(id *)(a1 + 40), "eventHandlerChangeLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlock");

}

- (void)removeTarget:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__DSHardwareButtonEventMonitor_removeTarget___block_invoke;
  v7[3] = &unk_24E44A4F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __45__DSHardwareButtonEventMonitor_removeTarget___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_handlersForTarget:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "eventHandlerChangeLock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lock");

  objc_msgSend(*(id *)(a1 + 32), "buttonEventHandlers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minusSet:", v5);

  objc_msgSend(*(id *)(a1 + 32), "eventHandlerChangeLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlock");

}

- (void)removeTarget:(id)a3 action:(SEL)a4 forButtonEvents:(unint64_t)a5 propagate:(BOOL)a6
{
  id v10;
  NSObject *v11;
  id v12;
  _QWORD block[4];
  id v14;
  DSHardwareButtonEventMonitor *v15;
  SEL v16;
  unint64_t v17;
  BOOL v18;

  v10 = a3;
  dispatch_get_global_queue(0, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__DSHardwareButtonEventMonitor_removeTarget_action_forButtonEvents_propagate___block_invoke;
  block[3] = &unk_24E44A4D0;
  v18 = a6;
  v16 = a4;
  v17 = a5;
  v14 = v10;
  v15 = self;
  v12 = v10;
  dispatch_async(v11, block);

}

void __78__DSHardwareButtonEventMonitor_removeTarget_action_forButtonEvents_propagate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  DSHardwareButtonEventHandler *v5;

  v5 = objc_alloc_init(DSHardwareButtonEventHandler);
  -[DSHardwareButtonEventHandler setTarget:](v5, "setTarget:", *(_QWORD *)(a1 + 32));
  -[DSHardwareButtonEventHandler setAction:](v5, "setAction:", *(_QWORD *)(a1 + 48));
  -[DSHardwareButtonEventHandler setPreventPropagation:](v5, "setPreventPropagation:", *(_BYTE *)(a1 + 64) == 0);
  -[DSHardwareButtonEventHandler setEvents:](v5, "setEvents:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "eventHandlerChangeLock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lock");

  objc_msgSend(*(id *)(a1 + 40), "buttonEventHandlers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", v5);

  objc_msgSend(*(id *)(a1 + 40), "eventHandlerChangeLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlock");

}

- (BOOL)hasTarget:(id)a3
{
  void *v3;
  BOOL v4;

  -[DSHardwareButtonEventMonitor _handlersForTarget:](self, "_handlersForTarget:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (id)_handlersForTarget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSHardwareButtonEventMonitor eventHandlerChangeLock](self, "eventHandlerChangeLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lock");

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[DSHardwareButtonEventMonitor buttonEventHandlers](self, "buttonEventHandlers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "target");
        v13 = (id)objc_claimAutoreleasedReturnValue();

        if (v13 == v4)
          objc_msgSend(v5, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  -[DSHardwareButtonEventMonitor eventHandlerChangeLock](self, "eventHandlerChangeLock");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "unlock");

  return v5;
}

- (id)_handlersForEvent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSHardwareButtonEventMonitor eventHandlerChangeLock](self, "eventHandlerChangeLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lock");

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[DSHardwareButtonEventMonitor buttonEventHandlers](self, "buttonEventHandlers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v12, "events") & a3) != 0)
          objc_msgSend(v5, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  -[DSHardwareButtonEventMonitor eventHandlerChangeLock](self, "eventHandlerChangeLock");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "unlock");

  return v5;
}

- (BOOL)_triggerHandlers:(id)a3 event:(unint64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  id obj;
  _QWORD block[6];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = a3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[DSHardwareButtonEventMonitor targetQueue](self, "targetQueue");
        v12 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __55__DSHardwareButtonEventMonitor__triggerHandlers_event___block_invoke;
        block[3] = &unk_24E44A520;
        block[4] = v11;
        block[5] = a4;
        dispatch_async(v12, block);

        if ((v8 & 1) != 0)
          v8 = 1;
        else
          v8 = objc_msgSend(v11, "preventPropagation");
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __55__DSHardwareButtonEventMonitor__triggerHandlers_event___block_invoke(uint64_t a1)
{
  void *v2;
  void (*v3)(id, uint64_t, _QWORD);
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "target");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void (*)(id, uint64_t, _QWORD))objc_msgSend(v2, "methodForSelector:", objc_msgSend(*(id *)(a1 + 32), "action"));

  objc_msgSend(*(id *)(a1 + 32), "target");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3(v4, objc_msgSend(*(id *)(a1 + 32), "action"), *(_QWORD *)(a1 + 40));

}

- (NSMutableSet)buttonEventHandlers
{
  return self->_buttonEventHandlers;
}

- (void)setButtonEventHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_buttonEventHandlers, a3);
}

- (BOOL)allowEvents
{
  return self->_allowEvents;
}

- (void)setAllowEvents:(BOOL)a3
{
  self->_allowEvents = a3;
}

- (NSLock)eventHandlerChangeLock
{
  return self->_eventHandlerChangeLock;
}

- (void)setEventHandlerChangeLock:(id)a3
{
  objc_storeStrong((id *)&self->_eventHandlerChangeLock, a3);
}

- (DSTestAutomation)testAutomation
{
  return self->_testAutomation;
}

- (void)setTestAutomation:(id)a3
{
  objc_storeStrong((id *)&self->_testAutomation, a3);
}

- (OS_dispatch_queue)buttonEventQueue
{
  return self->_buttonEventQueue;
}

- (void)setButtonEventQueue:(id)a3
{
  objc_storeStrong((id *)&self->_buttonEventQueue, a3);
}

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (void)setTargetQueue:(id)a3
{
  objc_storeStrong((id *)&self->_targetQueue, a3);
}

- (OS_dispatch_queue)systemClientCreationQueue
{
  return self->_systemClientCreationQueue;
}

- (void)setSystemClientCreationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_systemClientCreationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemClientCreationQueue, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_buttonEventQueue, 0);
  objc_storeStrong((id *)&self->_testAutomation, 0);
  objc_storeStrong((id *)&self->_eventHandlerChangeLock, 0);
  objc_storeStrong((id *)&self->_buttonEventHandlers, 0);
}

@end
