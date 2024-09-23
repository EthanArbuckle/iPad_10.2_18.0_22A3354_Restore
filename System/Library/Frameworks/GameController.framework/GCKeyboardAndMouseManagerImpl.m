@implementation GCKeyboardAndMouseManagerImpl

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  void *v10;
  int v11;
  _QWORD v12[5];
  id v13;
  _QWORD block[5];
  int v15;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("GCEnableKeyboardMouseController")))
  {
    objc_msgSend(v9, "valueForKey:", CFSTR("new"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intValue");

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __80__GCKeyboardAndMouseManagerImpl_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_24D2B2D08;
    block[4] = self;
    v15 = v11;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("GCDefaultMouseSensitivity")))
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __80__GCKeyboardAndMouseManagerImpl_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
    v12[3] = &unk_24D2B2B48;
    v12[4] = self;
    v13 = v9;
    dispatch_async(MEMORY[0x24BDAC9B8], v12);

  }
}

uint64_t __80__GCKeyboardAndMouseManagerImpl_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setEmulatedControllerEnabled:", *(unsigned int *)(a1 + 40));
}

void __80__GCKeyboardAndMouseManagerImpl_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 40), "valueForKey:", CFSTR("new"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setMouseSensitivity:", (int)objc_msgSend(v2, "intValue"));

}

- (GCKeyboardAndMouseManagerImpl)initWithQueue:(id)a3
{
  id v5;
  GCKeyboardAndMouseManagerImpl *v6;
  GCKeyboardAndMouseManagerImpl *v7;
  uint64_t v8;
  NSMutableDictionary *hidServiceSubjects;
  uint64_t v10;
  NSSet *keyboardHIDServices;
  uint64_t v12;
  NSMutableDictionary *mice;
  void *v14;
  void *v15;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GCKeyboardAndMouseManagerImpl;
  v6 = -[GCKeyboardAndMouseManager initWithQueue:](&v17, sel_initWithQueue_, v5);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_devicesQueue, a3);
    v8 = objc_opt_new();
    hidServiceSubjects = v7->_hidServiceSubjects;
    v7->_hidServiceSubjects = (NSMutableDictionary *)v8;

    +[NSSet set](&off_254DEBEC0, "set");
    v10 = objc_claimAutoreleasedReturnValue();
    keyboardHIDServices = v7->_keyboardHIDServices;
    v7->_keyboardHIDServices = (NSSet *)v10;

    v12 = objc_opt_new();
    mice = v7->_mice;
    v7->_mice = (NSMutableDictionary *)v12;

    v7->_emulatedControllerMapping = 0;
    +[NSUserDefaults standardUserDefaults](&off_254DEF040, "standardUserDefaults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:forKeyPath:options:context:", v7, CFSTR("GCEnableKeyboardMouseController"), 1, 0);
    objc_msgSend(v14, "valueForKey:", CFSTR("GCEnableKeyboardMouseController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCKeyboardAndMouseManagerImpl setEmulatedControllerEnabled:](v7, "setEmulatedControllerEnabled:", objc_msgSend(v15, "intValue"));

    objc_msgSend(v14, "addObserver:forKeyPath:options:context:", v7, CFSTR("GCDefaultMouseSensitivity"), 1, 0);
  }

  return v7;
}

- (void)setEmulatedControllerEnabled:(int)a3
{
  NSObject *devicesQueue;
  _QWORD block[5];

  self->_emulatedControllerMapping = a3;
  -[GCKeyboardAndMouseEmulatedController setEmulatedControllerMapping:](self->_emulatedController, "setEmulatedControllerMapping:");
  devicesQueue = self->_devicesQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__GCKeyboardAndMouseManagerImpl_setEmulatedControllerEnabled___block_invoke;
  block[3] = &unk_24D2B2B20;
  block[4] = self;
  dispatch_barrier_async(devicesQueue, block);
}

uint64_t __62__GCKeyboardAndMouseManagerImpl_setEmulatedControllerEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_ensureEmulatedControllerWithDevice:added:", 0, 0);
}

- (void)_onqueue_ensureEmulatedControllerWithDevice:(id)a3 added:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  GCKeyboardAndMouseEmulatedController *emulatedController;
  GCKeyboardAndMouseEmulatedController *v8;
  GCKeyboardAndMouseEmulatedController *v9;
  GCKeyboardAndMouseEmulatedController *v10;
  NSMutableDictionary *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (self->_emulatedControllerMapping
    && -[NSMutableDictionary count](self->_hidServiceSubjects, "count")
    && self->_coalescedKeyboard)
  {
    emulatedController = self->_emulatedController;
    if (emulatedController)
    {
      if (v4)
        -[GCKeyboardAndMouseEmulatedController addDevice:](emulatedController, "addDevice:", v6);
      else
        -[GCKeyboardAndMouseEmulatedController removeDevice:](emulatedController, "removeDevice:", v6);
    }
    else
    {
      v9 = -[GCKeyboardAndMouseEmulatedController initEmulatedControllerWithMapping:]([GCKeyboardAndMouseEmulatedController alloc], "initEmulatedControllerWithMapping:", self->_emulatedControllerMapping);
      v10 = self->_emulatedController;
      self->_emulatedController = v9;

      _publishCustomController(self->_emulatedController);
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v11 = self->_mice;
      v12 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v17 != v14)
              objc_enumerationMutation(v11);
            -[GCKeyboardAndMouseEmulatedController addDevice:](self->_emulatedController, "addDevice:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
          }
          v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v13);
      }

    }
  }
  else
  {
    v8 = self->_emulatedController;
    if (v8 && self->_emulatedControllerMapping)
      _unpublishCustomController(v8);
  }

}

- (void)_onqueue_refreshKeyboards
{
  SEL v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _GCKeyboardEventHIDAdapter *v13;
  _GCKeyboardEventHIDAdapter *v14;
  _GCKeyboardEventFusion *v15;
  _GCKeyboardEventFusion *v16;
  GCKeyboard *v17;
  GCKeyboard *coalescedKeyboard;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_devicesQueue);
  v4 = objc_getProperty(self, v3, 64, 1);
  if (!objc_msgSend(v4, "count"))
    goto LABEL_15;
  v5 = objc_alloc_init((Class)&off_254DEBB20);
  +[_GCControllerManager sharedInstance](_GCControllerManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v11);
        v13 = [_GCKeyboardEventHIDAdapter alloc];
        v14 = -[_GCKeyboardEventHIDAdapter initWithSource:service:](v13, "initWithSource:service:", v6, v12, (_QWORD)v20);
        objc_msgSend(v5, "addObject:", v14);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  if ((unint64_t)objc_msgSend(v5, "count") < 2)
  {
    objc_msgSend(v5, "firstObject");
    v15 = (_GCKeyboardEventFusion *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = -[_GCKeyboardEventFusion initWithSources:]([_GCKeyboardEventFusion alloc], "initWithSources:", v5);
  }
  v16 = v15;

  if (!v16)
  {
LABEL_15:
    coalescedKeyboard = self->_coalescedKeyboard;
    if (!coalescedKeyboard)
    {
      v16 = 0;
      goto LABEL_19;
    }
    v17 = coalescedKeyboard;
    -[GCKeyboardAndMouseManagerImpl _onqueue_unpublishKeyboard:]((uint64_t)self, v17);
    -[GCKeyboardAndMouseManagerImpl _onqueue_ensureEmulatedControllerWithDevice:added:](self, "_onqueue_ensureEmulatedControllerWithDevice:added:", v17, 0);
    objc_setProperty_atomic(self, sel_coalescedKeyboard, 0, 72);
    v16 = 0;
    goto LABEL_17;
  }
  if (!self->_coalescedKeyboard)
  {
    v17 = objc_alloc_init(GCKeyboard);
    objc_setProperty_atomic(self, sel_coalescedKeyboard, v17, 72);
    -[GCKeyboardAndMouseManagerImpl _onqueue_publishKeyboard:]((uint64_t)self, v17);
    -[GCKeyboardAndMouseManagerImpl _onqueue_ensureEmulatedControllerWithDevice:added:](self, "_onqueue_ensureEmulatedControllerWithDevice:added:", v17, 1);
LABEL_17:

  }
LABEL_19:
  -[GCKeyboard keyboardInput](self->_coalescedKeyboard, "keyboardInput", (_QWORD)v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setKeyboardEventSource:", v16);

}

- (id)keyboardHIDServices
{
  if (result)
    return objc_getProperty(result, a2, 64, 1);
  return result;
}

- (void)_onqueue_publishKeyboard:(uint64_t)a1
{
  id v3;
  void *v4;
  _QWORD block[4];
  id v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__GCKeyboardAndMouseManagerImpl__onqueue_publishKeyboard___block_invoke;
    block[3] = &unk_24D2B2B20;
    v6 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

- (void)_onqueue_unpublishKeyboard:(uint64_t)a1
{
  id v3;
  void *v4;
  _QWORD block[4];
  id v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__GCKeyboardAndMouseManagerImpl__onqueue_unpublishKeyboard___block_invoke;
    block[3] = &unk_24D2B2B20;
    v6 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __58__GCKeyboardAndMouseManagerImpl__onqueue_publishKeyboard___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  _gc_log_keyboard_and_mouse();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_215181000, v2, OS_LOG_TYPE_DEFAULT, "Posting GCKeyboardDidConnectNotification for keyboard.", v4, 2u);
  }

  +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("GCKeyboardDidConnectNotification"), *(_QWORD *)(a1 + 32), 0);

}

void __60__GCKeyboardAndMouseManagerImpl__onqueue_unpublishKeyboard___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  _gc_log_keyboard_and_mouse();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_215181000, v2, OS_LOG_TYPE_DEFAULT, "Posting GCKeyboardDidDisconnectNotification for keyboard.", v4, 2u);
  }

  +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("GCKeyboardDidDisconnectNotification"), *(_QWORD *)(a1 + 32), 0);

}

- (id)mice
{
  void *v3;
  NSMutableDictionary *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  v4 = self->_mice;
  objc_sync_enter(v4);
  -[NSMutableDictionary allValues](self->_mice, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  objc_sync_exit(v4);
  return v3;
}

- (GCMouse)currentMouse
{
  GCKeyboardAndMouseManagerImpl *v2;
  GCMouse *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_currentMouse;
  objc_sync_exit(v2);

  return v3;
}

- (void)setCurrentMouse:(id)a3
{
  GCMouse *v5;
  GCKeyboardAndMouseManagerImpl *v6;
  GCMouse **p_currentMouse;
  GCMouse *currentMouse;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;

  v5 = (GCMouse *)a3;
  v6 = self;
  objc_sync_enter(v6);
  p_currentMouse = &v6->_currentMouse;
  currentMouse = v6->_currentMouse;
  if (currentMouse != v5)
  {
    if (currentMouse)
    {
      _gc_log_keyboard_and_mouse();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[GCKeyboardAndMouseManagerImpl setCurrentMouse:].cold.2((uint64_t)&v6->_currentMouse, v9, v10, v11, v12, v13, v14, v15);

      +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "postNotificationName:object:userInfo:", CFSTR("GCMouseDidStopBeingCurrentNotification"), *p_currentMouse, 0);

    }
    objc_storeStrong((id *)&v6->_currentMouse, a3);
    _gc_log_keyboard_and_mouse();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[GCKeyboardAndMouseManagerImpl setCurrentMouse:].cold.1((uint64_t)&v6->_currentMouse, v17, v18, v19, v20, v21, v22, v23);

    +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "postNotificationName:object:userInfo:", CFSTR("GCMouseDidBecomeCurrentNotification"), *p_currentMouse, 0);

  }
  objc_sync_exit(v6);

}

- (void)updateCurrentMouseAfterDisconnecting:(void *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(a1, "mice", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v4);
          v10 = *(id *)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (v10 != v3)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "mouseInput");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "lastEventTimestamp");
            v13 = v12;
            objc_msgSend(v7, "mouseInput");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "lastEventTimestamp");
            v16 = v15;

            if (v13 >= v16)
            {
              v17 = v10;

              v7 = v17;
            }

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }

    objc_msgSend(a1, "currentMouse");
    v18 = (id)objc_claimAutoreleasedReturnValue();

    if (v18 == v3)
      objc_msgSend(a1, "setCurrentMouse:", v7);

  }
}

- (void)_onqueue_addMouse:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  __IOHIDServiceClient *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  GCMouse *v12;
  void *v13;
  id v14;

  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      _gc_log_keyboard_and_mouse();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        -[GCKeyboardAndMouseManagerImpl _onqueue_addMouse:].cold.4();
    }
    else
    {
      objc_msgSend(v3, "registryID");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(id *)(a1 + 24);
      objc_sync_enter(v6);
      objc_msgSend(*(id *)(a1 + 24), "objectForKey:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_sync_exit(v6);

      if (v7)
      {
        v8 = (__IOHIDServiceClient *)objc_msgSend(v3, "service");
        if ((serviceMatchesUsageAndUsagePage(v8, 13, 12) & 1) != 0
          || serviceMatchesUsageAndUsagePage(v8, 13, 5))
        {
          _gc_log_keyboard_and_mouse();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            -[GCKeyboardAndMouseManagerImpl _onqueue_addMouse:].cold.2();
          v10 = 1;
        }
        else
        {
          _gc_log_keyboard_and_mouse();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            -[GCKeyboardAndMouseManagerImpl _onqueue_addMouse:].cold.3();
          v10 = 5;
        }

        v11 = IOHIDServiceClientCopyProperty((IOHIDServiceClientRef)objc_msgSend(v3, "service"), CFSTR("Product"));
        v12 = -[GCMouse initWithName:additionalButtons:]([GCMouse alloc], "initWithName:additionalButtons:", v11, v10);
        -[GCMouse mouseInput](v12, "mouseInput");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setButtonEventSource:", v7);
        objc_msgSend(v13, "setScrollEventSource:", v7);
        objc_msgSend(v13, "setDigitizerEventSource:", v7);
        objc_msgSend(v13, "setPointerEventSource:", v7);
        v14 = *(id *)(a1 + 32);
        objc_sync_enter(v14);
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v12, v3);
        objc_sync_exit(v14);

        -[GCKeyboardAndMouseManagerImpl _onqueue_publishMouse:](a1, v12);
        objc_msgSend((id)a1, "_onqueue_ensureEmulatedControllerWithDevice:added:", v12, 1);

      }
      else
      {
        _gc_log_keyboard_and_mouse();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          -[GCKeyboardAndMouseManagerImpl _onqueue_addMouse:].cold.1();
      }

    }
  }

}

- (void)_onqueue_publishMouse:(uint64_t)a1
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __55__GCKeyboardAndMouseManagerImpl__onqueue_publishMouse___block_invoke;
    v5[3] = &unk_24D2B2B48;
    v6 = v3;
    v7 = a1;
    dispatch_async(MEMORY[0x24BDAC9B8], v5);

  }
}

- (void)_onqueue_removeMouse:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  id v6;

  v3 = a2;
  if (a1)
  {
    v6 = v3;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = *(id *)(a1 + 32);
      objc_sync_enter(v5);
      objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v6);
      objc_sync_exit(v5);

      -[GCKeyboardAndMouseManagerImpl _onqueue_unpublishMouse:](a1, v4);
      objc_msgSend((id)a1, "_onqueue_ensureEmulatedControllerWithDevice:added:", v4, 0);
    }

    v3 = v6;
  }

}

- (void)_onqueue_unpublishMouse:(uint64_t)a1
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __57__GCKeyboardAndMouseManagerImpl__onqueue_unpublishMouse___block_invoke;
    v5[3] = &unk_24D2B2B48;
    v6 = v3;
    v7 = a1;
    dispatch_async(MEMORY[0x24BDAC9B8], v5);

  }
}

void __55__GCKeyboardAndMouseManagerImpl__onqueue_publishMouse___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _gc_log_keyboard_and_mouse();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_215181000, v2, OS_LOG_TYPE_DEFAULT, "Posting GCMouseDidConnectNotification for %@.", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "setCurrentMouse:", *(_QWORD *)(a1 + 32));
  +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("GCMouseDidConnectNotification"), *(_QWORD *)(a1 + 32), 0);

}

void __57__GCKeyboardAndMouseManagerImpl__onqueue_unpublishMouse___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _gc_log_keyboard_and_mouse();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_215181000, v2, OS_LOG_TYPE_DEFAULT, "Posting GCMouseDidDisconnectNotification for %@.", (uint8_t *)&v5, 0xCu);
  }

  -[GCKeyboardAndMouseManagerImpl updateCurrentMouseAfterDisconnecting:](*(void **)(a1 + 40), *(void **)(a1 + 32));
  +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("GCMouseDidDisconnectNotification"), *(_QWORD *)(a1 + 32), 0);

}

- (BOOL)addDeviceWithServiceRef:(__IOHIDServiceClient *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *hidServiceSubjects;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  unsigned int v16;
  const char *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  NSMutableDictionary *v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  void *v25;
  SEL v26;
  NSObject *devicesQueue;
  _QWORD v28[5];
  id v29;
  _QWORD block[5];
  uint8_t buf[4];
  __IOHIDServiceClient *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  unsigned int v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if ((currentProcessIsGameControllerDaemon() & 1) == 0)
  {
    dispatch_get_current_queue();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc((Class)&off_254DE4170), "initWithService:queue:", a3, v6);
    v8 = v7;
    if (v7 && (objc_msgSend(v7, "registryID"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, v9))
    {
      hidServiceSubjects = self->_hidServiceSubjects;
      objc_msgSend(v8, "registryID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](hidServiceSubjects, "objectForKey:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        LODWORD(v5) = isDeviceKeyboard(a3);
        v16 = isDeviceMouse(a3);
        v18 = v16;
        if ((v5 & 1) != 0 || v16)
        {
          objc_msgSend(v8, "registryID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_opt_new();
          v21 = self->_hidServiceSubjects;
          objc_sync_enter(v21);
          -[NSMutableDictionary setObject:forKey:](self->_hidServiceSubjects, "setObject:forKey:", v20, v19);
          objc_sync_exit(v21);

          _gc_log_keyboard_and_mouse();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            v32 = (__IOHIDServiceClient *)v8;
            v33 = 1024;
            v34 = (int)v5;
            v35 = 1024;
            v36 = v18;
            _os_log_impl(&dword_215181000, v22, OS_LOG_TYPE_INFO, "Now tracking %@. Is Keyboard(%{BOOL}d), Mouse(%{BOOL}d)", buf, 0x18u);
          }

          if ((v5 & v18) == 1)
          {
            _gc_log_keyboard_and_mouse();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              -[GCKeyboardAndMouseManagerImpl addDeviceWithServiceRef:].cold.1();

          }
        }
        if ((_DWORD)v5)
        {
          v24 = objc_getProperty(self, v17, 64, 1);
          if ((objc_msgSend(v24, "containsObject:", v8) & 1) == 0)
          {
            objc_msgSend(v24, "setByAddingObject:", v8);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_setProperty_atomic_copy(self, v26, v25, 64);

            devicesQueue = self->_devicesQueue;
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __57__GCKeyboardAndMouseManagerImpl_addDeviceWithServiceRef___block_invoke;
            block[3] = &unk_24D2B2B20;
            block[4] = self;
            dispatch_barrier_async(devicesQueue, block);
          }

        }
        if (v18)
        {
          v5 = self->_devicesQueue;
          v28[0] = MEMORY[0x24BDAC760];
          v28[1] = 3221225472;
          v28[2] = __57__GCKeyboardAndMouseManagerImpl_addDeviceWithServiceRef___block_invoke_2;
          v28[3] = &unk_24D2B2B48;
          v28[4] = self;
          v29 = v8;
          dispatch_barrier_async(v5, v28);

          LOBYTE(v5) = 1;
        }
        goto LABEL_13;
      }
      _gc_log_keyboard_and_mouse();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[GCKeyboardAndMouseManagerImpl addDeviceWithServiceRef:].cold.2();

    }
    else
    {
      _gc_log_keyboard_and_mouse();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v32 = a3;
        _os_log_impl(&dword_215181000, v14, OS_LOG_TYPE_DEFAULT, "#WARNING Ignoring added HID Service because it returned an invalid registryID:\n%@", buf, 0xCu);
      }

    }
    LOBYTE(v5) = 0;
LABEL_13:

    return (char)v5;
  }
  LOBYTE(v5) = 1;
  return (char)v5;
}

- (void)setKeyboardHIDServices:(void *)a1
{
  if (a1)
    objc_setProperty_atomic_copy(a1, newValue, newValue, 64);
}

uint64_t __57__GCKeyboardAndMouseManagerImpl_addDeviceWithServiceRef___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_refreshKeyboards");
}

void __57__GCKeyboardAndMouseManagerImpl_addDeviceWithServiceRef___block_invoke_2(uint64_t a1)
{
  -[GCKeyboardAndMouseManagerImpl _onqueue_addMouse:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)removeDeviceWithServiceRef:(__IOHIDServiceClient *)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *hidServiceSubjects;
  void *v9;
  void *v10;
  const char *v11;
  void *v12;
  NSMutableDictionary *v13;
  NSObject *v14;
  NSObject *v15;
  char v16;
  uint64_t v17;
  void *v18;
  SEL v19;
  NSObject *devicesQueue;
  NSObject *v21;
  _QWORD v22[5];
  id v23;
  _QWORD block[5];
  uint8_t buf[4];
  __IOHIDServiceClient *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(objc_alloc((Class)&off_254DE4170), "initWithService:", a3);
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "registryID"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    hidServiceSubjects = self->_hidServiceSubjects;
    objc_msgSend(v6, "registryID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](hidServiceSubjects, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v6, "registryID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = self->_hidServiceSubjects;
      objc_sync_enter(v13);
      -[NSMutableDictionary removeObjectForKey:](self->_hidServiceSubjects, "removeObjectForKey:", v12);
      objc_sync_exit(v13);

      _gc_log_keyboard_and_mouse();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v26 = (__IOHIDServiceClient *)v6;
        _os_log_impl(&dword_215181000, v14, OS_LOG_TYPE_INFO, "No longer tracking %@", buf, 0xCu);
      }

    }
    v15 = objc_getProperty(self, v11, 64, 1);
    v16 = -[NSObject containsObject:](v15, "containsObject:", v6);
    v17 = MEMORY[0x24BDAC760];
    if ((v16 & 1) != 0)
    {
      -[NSObject gc_setByRemovingObject:](v15, "gc_setByRemovingObject:", v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setProperty_atomic_copy(self, v19, v18, 64);

      devicesQueue = self->_devicesQueue;
      block[0] = v17;
      block[1] = 3221225472;
      block[2] = __60__GCKeyboardAndMouseManagerImpl_removeDeviceWithServiceRef___block_invoke;
      block[3] = &unk_24D2B2B20;
      block[4] = self;
      dispatch_barrier_async(devicesQueue, block);
    }
    v21 = self->_devicesQueue;
    v22[0] = v17;
    v22[1] = 3221225472;
    v22[2] = __60__GCKeyboardAndMouseManagerImpl_removeDeviceWithServiceRef___block_invoke_2;
    v22[3] = &unk_24D2B2B48;
    v22[4] = self;
    v23 = v6;
    dispatch_barrier_async(v21, v22);

  }
  else
  {
    _gc_log_keyboard_and_mouse();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = a3;
      _os_log_impl(&dword_215181000, v15, OS_LOG_TYPE_DEFAULT, "#WARNING Ignoring removed HID Service because it returned an invalid registryID:\n%@", buf, 0xCu);
    }
  }

}

uint64_t __60__GCKeyboardAndMouseManagerImpl_removeDeviceWithServiceRef___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_refreshKeyboards");
}

void __60__GCKeyboardAndMouseManagerImpl_removeDeviceWithServiceRef___block_invoke_2(uint64_t a1)
{
  -[GCKeyboardAndMouseManagerImpl _onqueue_removeMouse:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (uint64_t)handleHIDEvent:(uint64_t)a3 atTimestamp:(void *)a4 forSubject:
{
  _QWORD *v6;
  const __CFArray *Children;
  const __CFArray *v8;
  CFIndex Count;
  CFIndex v10;
  int v11;
  CFIndex i;
  const void *ValueAtIndex;
  int Type;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _QWORD v26[4];
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v6 = a4;
  if (!a1)
    goto LABEL_20;
  Children = (const __CFArray *)IOHIDEventGetChildren();
  if (Children)
  {
    v8 = Children;
    Count = CFArrayGetCount(Children);
    if (Count >= 1)
    {
      v10 = Count;
      v11 = 0;
      for (i = 0; i != v10; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v8, i);
        v11 |= -[GCKeyboardAndMouseManagerImpl handleHIDEvent:atTimestamp:forSubject:](a1, ValueAtIndex, a3, v6);
      }
      if ((v11 & 1) != 0)
        goto LABEL_19;
    }
  }
  Type = IOHIDEventGetType();
  a1 = 0;
  if (Type > 10)
  {
    if (Type == 11)
    {
      v18 = (void *)objc_opt_new();
      objc_msgSend(v18, "setTimestamp:", a3);
      IOHIDEventGetFloatValue();
      *(float *)&v23 = v23;
      objc_msgSend(v18, "setX:", v23);
      IOHIDEventGetFloatValue();
      *(float *)&v24 = v24;
      objc_msgSend(v18, "setY:", v24);
      -[_GCKeyboardAndMouseEventSubject publishDigitizerEvent:](v6, v18);
    }
    else
    {
      if (Type != 17)
        goto LABEL_20;
      v18 = (void *)objc_opt_new();
      objc_msgSend(v18, "setTimestamp:", a3);
      BKSHIDEventGetPointerAttributes();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        objc_msgSend(v19, "unacceleratedRelativePositionX");
        *(float *)&v21 = v21;
        objc_msgSend(v18, "setX:", v21);
        objc_msgSend(v20, "unacceleratedRelativePositionY");
        *(float *)&v22 = v22;
        objc_msgSend(v18, "setY:", v22);
      }
      -[_GCKeyboardAndMouseEventSubject publishPointerEvent:](v6, v18);

    }
LABEL_18:

    goto LABEL_19;
  }
  if (Type == 2)
  {
    v18 = (void *)objc_opt_new();
    objc_msgSend(v18, "setTimestamp:", a3);
    objc_msgSend(v18, "setMask:", IOHIDEventGetIntegerValue());
    -[_GCKeyboardAndMouseEventSubject publishButtonEvent:](v6, v18);
    goto LABEL_18;
  }
  if (Type == 6)
  {
    IOHIDEventGetFloatValue();
    v16 = v15;
    IOHIDEventGetFloatValue();
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __71__GCKeyboardAndMouseManagerImpl_handleHIDEvent_atTimestamp_forSubject___block_invoke;
    v26[3] = &unk_24D2B2D30;
    v28 = v16;
    v29 = v17;
    v30 = a3;
    v27 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], v26);

LABEL_19:
    a1 = 1;
  }
LABEL_20:

  return a1;
}

void __71__GCKeyboardAndMouseManagerImpl_handleHIDEvent_atTimestamp_forSubject___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  id v22;

  +[UIApplication sharedApplication](&off_254DF2320, "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyWindow");
  v22 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "interfaceOrientation");

  objc_msgSend(v22, "screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fixedCoordinateSpace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "convertPoint:toCoordinateSpace:", v6, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  v8 = v7;
  v10 = v9;

  objc_msgSend(v22, "screen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fixedCoordinateSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "convertPoint:toCoordinateSpace:", v12, *(double *)(a1 + 40), *(double *)(a1 + 48));
  v14 = v13;
  v16 = v15;

  if ((unint64_t)(v4 - 1) >= 2)
    v17 = v14 - v8;
  else
    v17 = v8 - v14;
  if ((unint64_t)(v4 - 1) >= 2)
    v18 = v16 - v10;
  else
    v18 = v10 - v16;
  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "setTimestamp:", *(_QWORD *)(a1 + 56));
  *(float *)&v20 = v17;
  objc_msgSend(v19, "setX:", v20);
  *(float *)&v21 = v18;
  objc_msgSend(v19, "setY:", v21);
  -[_GCKeyboardAndMouseEventSubject publishScrollEvent:](*(void **)(a1 + 32), v19);

}

- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3
{
  int Type;
  uint64_t SenderID;
  uint64_t TimeStamp;
  NSMutableDictionary *v8;
  NSMutableDictionary *hidServiceSubjects;
  void *v10;
  void *v11;
  char v12;

  Type = IOHIDEventGetType();
  SenderID = IOHIDEventGetSenderID();
  TimeStamp = IOHIDEventGetTimeStamp();
  if (Type == 11 && _DescendantPointerEvent((uint64_t)a3))
    SenderID = IOHIDEventGetSenderID();
  v8 = self->_hidServiceSubjects;
  objc_sync_enter(v8);
  hidServiceSubjects = self->_hidServiceSubjects;
  +[NSNumber numberWithUnsignedLongLong:](&off_254DED908, "numberWithUnsignedLongLong:", SenderID);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](hidServiceSubjects, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v8);
  if (v11 && IOHIDEventGetType() == 11)
    v12 = -[GCKeyboardAndMouseManagerImpl handleHIDEvent:atTimestamp:forSubject:]((uint64_t)self, (uint64_t)a3, TimeStamp, v11);
  else
    v12 = 0;

  return v12;
}

- (int)emulatedControllerMapping
{
  return self->_emulatedControllerMapping;
}

- (void)setEmulatedControllerMapping:(int)a3
{
  self->_emulatedControllerMapping = a3;
}

- (GCKeyboard)coalescedKeyboard
{
  return (GCKeyboard *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescedKeyboard, 0);
  objc_storeStrong((id *)&self->_keyboardHIDServices, 0);
  objc_storeStrong((id *)&self->_emulatedController, 0);
  objc_storeStrong((id *)&self->_currentMouse, 0);
  objc_storeStrong((id *)&self->_mice, 0);
  objc_storeStrong((id *)&self->_hidServiceSubjects, 0);
  objc_storeStrong((id *)&self->_devicesQueue, 0);
}

- (void)setCurrentMouse:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_215181000, a2, a3, "Posting GCMouseDidBecomeCurrent for %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_1();
}

- (void)setCurrentMouse:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_215181000, a2, a3, "Posting GCMouseDidStopBeingCurrent for %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_1();
}

- (void)_onqueue_addMouse:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_215181000, v0, v1, "#NOTE Not currently tracking added mouse HID service %@.  It may have already disconnected.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_onqueue_addMouse:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_215181000, v0, v1, "%@ is Magic mouse or Magic trackpad!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_onqueue_addMouse:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_215181000, v0, v1, "%@ is normal mouse device!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_onqueue_addMouse:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_215181000, v0, v1, "#NOTE Added HID service %@ is already tracked as a mouse.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)addDeviceWithServiceRef:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_215181000, v0, v1, "HID Service has both keyboard and mouse profiles at the same time:\n%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)addDeviceWithServiceRef:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_215181000, v0, v1, "#NOTE Already tracking HID service: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

@end
