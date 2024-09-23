@implementation CAProcessMonitor

- (void)updateConfiguration
{
  void *v3;
  NSMutableSet *processIdentifiers;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  RBSProcessMonitor *processMonitor;
  _QWORD v10[5];
  id v11;
  id location;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  processIdentifiers = self->_processIdentifiers;
  objc_sync_enter(processIdentifiers);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_processIdentifiers;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingIdentifier:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i)));
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v6);
  }
  objc_sync_exit(processIdentifiers);
  location = 0;
  objc_initWeak(&location, self);
  processMonitor = self->_processMonitor;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __39__CAProcessMonitor_updateConfiguration__block_invoke;
  v10[3] = &unk_1E15A9500;
  v10[4] = v3;
  objc_copyWeak(&v11, &location);
  -[RBSProcessMonitor updateConfiguration:](processMonitor, "updateConfiguration:", v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __39__CAProcessMonitor_updateConfiguration__block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  _QWORD v5[4];
  id v6[2];

  v6[1] = *(id *)MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0D87DC0], "descriptor");
  objc_msgSend(v4, "setValues:", 1);
  objc_msgSend(v4, "setEndowmentNamespaces:", &unk_1E15DAD08);
  objc_msgSend(a2, "setStateDescriptor:", v4);
  objc_msgSend(a2, "setPredicates:", *(_QWORD *)(a1 + 32));
  objc_msgSend(a2, "setEvents:", 1);
  objc_msgSend(a2, "setServiceClass:", 33);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__CAProcessMonitor_updateConfiguration__block_invoke_2;
  v5[3] = &unk_1E15A94D8;
  objc_copyWeak(v6, (id *)(a1 + 40));
  objc_msgSend(a2, "setUpdateHandler:", v5);
  objc_destroyWeak(v6);
}

- (CAProcessMonitor)initWithCallback:(id)a3
{
  CAProcessMonitor *v4;
  NSObject *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)CAProcessMonitor;
  v4 = -[CAProcessMonitor init](&v7, sel_init);
  if (v4)
  {
    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v4->_queue = (OS_dispatch_queue *)dispatch_queue_create("CAProcessMonitor Queue", v5);
    v4->_callback = _Block_copy(a3);
    v4->_processMonitor = (RBSProcessMonitor *)objc_alloc_init(MEMORY[0x1E0D87D90]);
    v4->_processIdentifiers = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  -[RBSProcessMonitor invalidate](self->_processMonitor, "invalidate");
  _Block_release(self->_callback);
  dispatch_release((dispatch_object_t)self->_queue);
  v3.receiver = self;
  v3.super_class = (Class)CAProcessMonitor;
  -[CAProcessMonitor dealloc](&v3, sel_dealloc);
}

- (void)addMonitoringProcess:(int)a3
{
  uint64_t v4;
  uint64_t v5;
  NSMutableSet *processIdentifiers;
  NSObject *queue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(MEMORY[0x1E0D87D70], "identifierWithPid:", *(_QWORD *)&a3);
  if (v4)
  {
    v5 = v4;
    processIdentifiers = self->_processIdentifiers;
    objc_sync_enter(processIdentifiers);
    if ((-[NSMutableSet containsObject:](self->_processIdentifiers, "containsObject:", v5) & 1) != 0)
    {
      objc_sync_exit(processIdentifiers);
    }
    else
    {
      -[NSMutableSet addObject:](self->_processIdentifiers, "addObject:", v5);
      objc_sync_exit(processIdentifiers);
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __41__CAProcessMonitor_addMonitoringProcess___block_invoke;
      block[3] = &unk_1E15AAE28;
      block[4] = self;
      block[5] = v5;
      dispatch_async(queue, block);
    }
  }
}

- (void)removeMonitoringProcess:(int)a3
{
  uint64_t v4;
  uint64_t v5;
  NSMutableSet *processIdentifiers;
  NSObject *queue;
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(MEMORY[0x1E0D87D70], "identifierWithPid:", *(_QWORD *)&a3);
  if (v4)
  {
    v5 = v4;
    processIdentifiers = self->_processIdentifiers;
    objc_sync_enter(processIdentifiers);
    if ((-[NSMutableSet containsObject:](self->_processIdentifiers, "containsObject:", v5) & 1) != 0)
    {
      -[NSMutableSet removeObject:](self->_processIdentifiers, "removeObject:", v5);
      objc_sync_exit(processIdentifiers);
      queue = self->_queue;
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __44__CAProcessMonitor_removeMonitoringProcess___block_invoke;
      v8[3] = &unk_1E15ABB78;
      v8[4] = self;
      dispatch_async(queue, v8);
    }
    else
    {
      objc_sync_exit(processIdentifiers);
    }
  }
}

void __39__CAProcessMonitor_updateConfiguration__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v7;
  _QWORD *WeakRetained;
  _QWORD *v9;
  void *v10;
  int v11;
  uint64_t v12;
  int v13;
  unsigned int v14;
  _BOOL8 v15;

  v7 = (void *)MEMORY[0x186DBE2E4]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v10 = (void *)objc_msgSend(a4, "state");
    v11 = objc_msgSend(v10, "taskState");
    if ((v11 - 3) >= 2)
    {
      v13 = v11;
      v14 = objc_msgSend(a3, "isApplication") ^ 1;
      if (v13 == 2)
        v12 = v14;
      else
        v12 = 0;
    }
    else
    {
      v12 = 1;
    }
    v15 = objc_msgSend(a3, "isApplication")
       && !objc_msgSend((id)objc_msgSend(v10, "endowmentNamespaces"), "containsObject:", CFSTR("com.apple.frontboard.visibility"))|| objc_msgSend(v10, "taskState") == 3;
    (*(void (**)(_QWORD, uint64_t, uint64_t, _BOOL8))(v9[1] + 16))(v9[1], objc_msgSend(a3, "pid"), v12, v15);

  }
  objc_autoreleasePoolPop(v7);
}

uint64_t __44__CAProcessMonitor_removeMonitoringProcess___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateConfiguration");
}

uint64_t __41__CAProcessMonitor_addMonitoringProcess___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;
  int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;

  objc_msgSend(*(id *)(a1 + 32), "updateConfiguration");
  v2 = (void *)objc_msgSend(MEMORY[0x1E0D87D68], "handleForIdentifier:error:", *(_QWORD *)(a1 + 40), 0);
  v3 = v2;
  if (!v2 || objc_msgSend(v2, "pid") == -1)
  {
    v7 = 0;
    v5 = 0;
  }
  else
  {
    v4 = (void *)objc_msgSend(v3, "currentState");
    v5 = (_BOOL8)v4;
    if (v4)
    {
      v6 = objc_msgSend(v4, "taskState");
      if ((v6 - 3) >= 2)
      {
        v8 = v6;
        v9 = objc_msgSend(v3, "isApplication") ^ 1;
        if (v8 == 2)
          v7 = v9;
        else
          v7 = 0;
      }
      else
      {
        v7 = 1;
      }
      v5 = objc_msgSend(v3, "isApplication")
        && !objc_msgSend((id)objc_msgSend((id)v5, "endowmentNamespaces"), "containsObject:", CFSTR("com.apple.frontboard.visibility"))|| objc_msgSend((id)v5, "taskState") == 3;
    }
    else
    {
      v7 = 0;
    }
  }
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _BOOL8))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), objc_msgSend(v3, "pid"), v7, v5);
}

@end
