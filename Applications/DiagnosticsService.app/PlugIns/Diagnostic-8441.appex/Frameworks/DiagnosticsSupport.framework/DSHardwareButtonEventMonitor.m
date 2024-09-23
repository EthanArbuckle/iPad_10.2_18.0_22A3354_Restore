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
    v3 = -[DSHardwareButtonEventMonitor init](&v17, "init");
    v4 = v3;
    if (v3)
    {
      v3->_allowEvents = 1;
      v5 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      buttonEventHandlers = v4->_buttonEventHandlers;
      v4->_buttonEventHandlers = (NSMutableSet *)v5;

      v7 = (NSLock *)objc_alloc_init((Class)NSLock);
      eventHandlerChangeLock = v4->_eventHandlerChangeLock;
      v4->_eventHandlerChangeLock = v7;

      v9 = objc_claimAutoreleasedReturnValue(+[DSTestAutomation sharedInstance](DSTestAutomation, "sharedInstance"));
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
  v7 = objc_claimAutoreleasedReturnValue(-[DSHardwareButtonEventMonitor systemClientCreationQueue](self, "systemClientCreationQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __61__DSHardwareButtonEventMonitor_startWithPriority_completion___block_invoke;
  v9[3] = &unk_18878;
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
  dispatch_queue_attr_t v4;
  NSObject *v5;
  dispatch_queue_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && !WeakRetained[1])
  {
    v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = dispatch_queue_create("com.apple.DiagnosticsSupport.buttonEventMonitor.buttonEventQueue", v5);
    v7 = (void *)v3[6];
    v3[6] = v6;

    v3[1] = IOHIDEventSystemClientCreateWithType(kCFAllocatorDefault, 1, 0);
    v16[0] = CFSTR("PrimaryUsagePage");
    v16[1] = CFSTR("PrimaryUsage");
    v17[0] = &off_1C080;
    v17[1] = &off_1C098;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 2));
    v14[0] = CFSTR("PrimaryUsagePage");
    v14[1] = CFSTR("PrimaryUsage");
    v15[0] = &off_1C0B0;
    v15[1] = &off_1C0C8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 2));
    v10 = v3[1];
    v13[0] = v8;
    v13[1] = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 2));
    IOHIDEventSystemClientSetMatchingMultiple(v10, v11);

    IOHIDEventSystemClientScheduleWithDispatchQueue(v3[1], v3[6]);
    IOHIDEventSystemClientRegisterEventFilterCallbackWithPriority(v3[1], *(unsigned int *)(a1 + 48), buttonHIDEventFilterCallback, v3, v3);

  }
  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
    (*(void (**)(void))(v12 + 16))();

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
  v5 = objc_claimAutoreleasedReturnValue(-[DSHardwareButtonEventMonitor systemClientCreationQueue](self, "systemClientCreationQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __51__DSHardwareButtonEventMonitor_stopWithCompletion___block_invoke;
  block[3] = &unk_188C8;
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
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __51__DSHardwareButtonEventMonitor_stopWithCompletion___block_invoke_2;
      block[3] = &unk_188A0;
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
      IOHIDEventSystemClientUnscheduleFromDispatchQueue(v3, v2[6]);
      IOHIDEventSystemClientUnregisterEventFilterCallback(v4[1], buttonHIDEventFilterCallback, v4, v4);
      CFRelease((CFTypeRef)v4[1]);
      v2 = v4;
      v4[1] = 0;
    }
  }

}

- (void)addTarget:(id)a3 action:(SEL)a4 forButtonEvents:(unint64_t)a5 propagate:(BOOL)a6
{
  id v10;
  dispatch_queue_global_t global_queue;
  NSObject *v12;
  id v13;
  _QWORD block[4];
  id v15;
  DSHardwareButtonEventMonitor *v16;
  SEL v17;
  unint64_t v18;
  BOOL v19;

  v10 = a3;
  global_queue = dispatch_get_global_queue(0, 0);
  v12 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __75__DSHardwareButtonEventMonitor_addTarget_action_forButtonEvents_propagate___block_invoke;
  block[3] = &unk_188F0;
  v19 = a6;
  v17 = a4;
  v18 = a5;
  v15 = v10;
  v16 = self;
  v13 = v10;
  dispatch_async(v12, block);

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
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "eventHandlerChangeLock"));
  objc_msgSend(v2, "lock");

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "buttonEventHandlers"));
  objc_msgSend(v3, "addObject:", v5);

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "eventHandlerChangeLock"));
  objc_msgSend(v4, "unlock");

}

- (void)removeTarget:(id)a3
{
  id v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  global_queue = dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __45__DSHardwareButtonEventMonitor_removeTarget___block_invoke;
  v8[3] = &unk_18918;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __45__DSHardwareButtonEventMonitor_removeTarget___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_handlersForTarget:", *(_QWORD *)(a1 + 40)));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eventHandlerChangeLock"));
  objc_msgSend(v2, "lock");

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "buttonEventHandlers"));
  objc_msgSend(v3, "minusSet:", v5);

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eventHandlerChangeLock"));
  objc_msgSend(v4, "unlock");

}

- (void)removeTarget:(id)a3 action:(SEL)a4 forButtonEvents:(unint64_t)a5 propagate:(BOOL)a6
{
  id v10;
  dispatch_queue_global_t global_queue;
  NSObject *v12;
  id v13;
  _QWORD block[4];
  id v15;
  DSHardwareButtonEventMonitor *v16;
  SEL v17;
  unint64_t v18;
  BOOL v19;

  v10 = a3;
  global_queue = dispatch_get_global_queue(0, 0);
  v12 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __78__DSHardwareButtonEventMonitor_removeTarget_action_forButtonEvents_propagate___block_invoke;
  block[3] = &unk_188F0;
  v19 = a6;
  v17 = a4;
  v18 = a5;
  v15 = v10;
  v16 = self;
  v13 = v10;
  dispatch_async(v12, block);

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
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "eventHandlerChangeLock"));
  objc_msgSend(v2, "lock");

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "buttonEventHandlers"));
  objc_msgSend(v3, "removeObject:", v5);

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "eventHandlerChangeLock"));
  objc_msgSend(v4, "unlock");

}

- (BOOL)hasTarget:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DSHardwareButtonEventMonitor _handlersForTarget:](self, "_handlersForTarget:", a3));
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (id)_handlersForTarget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DSHardwareButtonEventMonitor eventHandlerChangeLock](self, "eventHandlerChangeLock"));
  objc_msgSend(v6, "lock");

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DSHardwareButtonEventMonitor buttonEventHandlers](self, "buttonEventHandlers", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "target"));

        if (v13 == v4)
          objc_msgSend(v5, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DSHardwareButtonEventMonitor eventHandlerChangeLock](self, "eventHandlerChangeLock"));
  objc_msgSend(v14, "unlock");

  return v5;
}

- (id)_handlersForEvent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DSHardwareButtonEventMonitor eventHandlerChangeLock](self, "eventHandlerChangeLock"));
  objc_msgSend(v6, "lock");

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DSHardwareButtonEventMonitor buttonEventHandlers](self, "buttonEventHandlers", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (((unint64_t)objc_msgSend(v12, "events") & a3) != 0)
          objc_msgSend(v5, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DSHardwareButtonEventMonitor eventHandlerChangeLock](self, "eventHandlerChangeLock"));
  objc_msgSend(v13, "unlock");

  return v5;
}

- (BOOL)_triggerHandlers:(id)a3 event:(unint64_t)a4
{
  id v6;
  id v7;
  unsigned __int8 v8;
  uint64_t v9;
  void *i;
  void *v11;
  NSObject *v12;
  id obj;
  _QWORD block[6];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

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
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v12 = objc_claimAutoreleasedReturnValue(-[DSHardwareButtonEventMonitor targetQueue](self, "targetQueue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = __55__DSHardwareButtonEventMonitor__triggerHandlers_event___block_invoke;
        block[3] = &unk_18940;
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
  void (*v3)(id, id, _QWORD);
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "target"));
  v3 = (void (*)(id, id, _QWORD))objc_msgSend(v2, "methodForSelector:", objc_msgSend(*(id *)(a1 + 32), "action"));

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "target"));
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
