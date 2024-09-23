@implementation JFXOrientationMonitor

+ (BOOL)initialized
{
  BOOL v2;

  objc_msgSend(a1, "JFX_initLock");
  objc_msgSend((id)s_instance_lock, "lock");
  v2 = s_instance != 0;
  objc_msgSend((id)s_instance_lock, "unlock");
  return v2;
}

+ (void)initializeWithKeyWindow:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "JFX_initLock");
  objc_msgSend((id)s_instance_lock, "lock");
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithKeyWindow:", v4);

  v6 = (void *)s_instance;
  s_instance = v5;

  objc_msgSend((id)s_instance_lock, "unlock");
}

+ (void)initializeWithViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  uint64_t v19;
  id *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v19 = 0;
  v20 = (id *)&v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__4;
  v23 = __Block_byref_object_dispose__4;
  v24 = 0;
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __54__JFXOrientationMonitor_initializeWithViewController___block_invoke;
  v18[3] = &unk_24EE586D8;
  v18[4] = &v19;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v18);

  if (v20[5])
    goto LABEL_5;
  v7 = v4;
  if (!v20[5])
  {
    while (1)
    {
      objc_msgSend(v7, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "window");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v20[5];
      v20[5] = (id)v10;

      objc_msgSend(v7, "parentViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
        break;
      objc_msgSend(v7, "parentViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v8;
      if (v20[5])
        goto LABEL_4;
    }
    if (!v20[5])
    {
      objc_msgSend(v7, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20[5])
      {
        while (1)
        {
          objc_msgSend(v13, "window");
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = v20[5];
          v20[5] = (id)v15;

          objc_msgSend(v13, "superview");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v17)
            break;
          objc_msgSend(v13, "superview");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = v14;
          if (v20[5])
            goto LABEL_12;
        }
        if (!v20[5])
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_storeStrong(v20 + 5, v13);
        }
      }
      v14 = v13;
LABEL_12:

    }
  }
  v8 = v7;
LABEL_4:

  if (v20[5])
LABEL_5:
    objc_msgSend(a1, "initializeWithKeyWindow:");
  _Block_object_dispose(&v19, 8);

}

void __54__JFXOrientationMonitor_initializeWithViewController___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "isKeyWindow"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

+ (void)uninitialize
{
  void *v2;

  v2 = (void *)s_instance;
  s_instance = 0;

}

+ (UIWindow)keyWindow
{
  return (UIWindow *)objc_msgSend((id)s_instance, "keyWindow");
}

+ (int64_t)deviceOrientation
{
  return objc_msgSend((id)s_instance, "deviceOrientation");
}

+ (int64_t)deviceInterfaceOrientation
{
  return objc_msgSend((id)s_instance, "deviceInterfaceOrientation");
}

+ (int64_t)interfaceOrientation
{
  return objc_msgSend((id)s_instance, "interfaceOrientation");
}

+ (BOOL)isDeviceInterfaceLandscape
{
  return (unint64_t)(objc_msgSend(a1, "deviceInterfaceOrientation") - 3) < 2;
}

- (JFXOrientationMonitor)initWithKeyWindow:(id)a3
{
  id v5;
  JFXOrientationMonitor *v6;
  uint64_t v7;
  OS_dispatch_queue *darwinNotificationQ;
  void *v9;
  NSObject *v10;
  JFXOrientationMonitor *v11;
  void *v12;
  uint64_t v13;
  int64_t v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  JFXOrientationMonitor *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v28;

  v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)JFXOrientationMonitor;
  v6 = -[JFXOrientationMonitor init](&v28, sel_init);
  objc_storeStrong((id *)&v6->_keyWindow, a3);
  JFXCreateDispatchQueue(v6, CFSTR("DarwinNotificationQ"), 0);
  v7 = objc_claimAutoreleasedReturnValue();
  darwinNotificationQ = v6->_darwinNotificationQ;
  v6->_darwinNotificationQ = (OS_dispatch_queue *)v7;

  v6->_darwinNotificationToken = -48879;
  -[JFXOrientationMonitor JFX_initDarwinNotification](v6, "JFX_initDarwinNotification");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel_JFX_UIApplicationDidChangeStatusBarOrientationNotification_, *MEMORY[0x24BDF7520], 0);

  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v10 = v6->_darwinNotificationQ;
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __43__JFXOrientationMonitor_initWithKeyWindow___block_invoke;
  v21 = &unk_24EE57A80;
  v23 = &v24;
  v11 = v6;
  v22 = v11;
  dispatch_sync(v10, &v18);
  v11->_deviceOrientation_lock = v25[3];
  objc_msgSend(v5, "windowScene", v18, v19, v20, v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "interfaceOrientation");

  v11->_interfaceOrientation_lock = v13;
  v14 = v25[3];
  if ((unint64_t)(v14 - 1) >= 4)
    v14 = v13;
  v11->_deviceInterfaceOrientation_lock = v14;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObserver:selector:name:object:", v11, sel_JFX_UIApplicationDidEnterBackgroundNotification_, *MEMORY[0x24BDF7528], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObserver:selector:name:object:", v11, sel_JFX_UIApplicationWillEnterForegroundNotification_, *MEMORY[0x24BDF75D0], 0);

  _Block_object_dispose(&v24, 8);
  return v11;
}

uint64_t __43__JFXOrientationMonitor_initWithKeyWindow___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "JFX_deviceOrientation_darwinNotificationQ");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)deviceOrientation
{
  int64_t v3;

  objc_msgSend((id)s_instance_lock, "lock");
  v3 = -[JFXOrientationMonitor deviceOrientation_lock](self, "deviceOrientation_lock");
  objc_msgSend((id)s_instance_lock, "unlock");
  return v3;
}

- (void)setDeviceOrientation:(int64_t)a3
{
  int64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)s_instance_lock, "lock");
  -[JFXOrientationMonitor setDeviceOrientation_lock:](self, "setDeviceOrientation_lock:", a3);
  if ((unint64_t)(a3 - 1) > 3)
  {
    v7 = 0;
  }
  else
  {
    v5 = -[JFXOrientationMonitor deviceInterfaceOrientation_lock](self, "deviceInterfaceOrientation_lock");
    -[JFXOrientationMonitor setDeviceInterfaceOrientation_lock:](self, "setDeviceInterfaceOrientation_lock:", a3);
    v11 = CFSTR("kJFXOrientationMonitorDeviceInterfaceOrientationPreviousOrientationUserInfoKey");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend((id)s_instance_lock, "unlock");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__JFXOrientationMonitor_setDeviceOrientation___block_invoke;
  v9[3] = &unk_24EE57B60;
  v10 = v7;
  v8 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

}

void __46__JFXOrientationMonitor_setDeviceOrientation___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("kJFXOrientationMonitorDeviceOrientationNotification"), 0, 0);

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("kJFXOrientationMonitorDeviceInterfaceOrientationNotification"), 0, *(_QWORD *)(a1 + 32));

  }
}

- (int64_t)deviceInterfaceOrientation
{
  int64_t v3;

  objc_msgSend((id)s_instance_lock, "lock");
  v3 = -[JFXOrientationMonitor deviceInterfaceOrientation_lock](self, "deviceInterfaceOrientation_lock");
  objc_msgSend((id)s_instance_lock, "unlock");
  return v3;
}

- (int64_t)interfaceOrientation
{
  int64_t v3;

  objc_msgSend((id)s_instance_lock, "lock");
  v3 = -[JFXOrientationMonitor interfaceOrientation_lock](self, "interfaceOrientation_lock");
  objc_msgSend((id)s_instance_lock, "unlock");
  return v3;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  objc_msgSend((id)s_instance_lock, "lock");
  -[JFXOrientationMonitor setInterfaceOrientation_lock:](self, "setInterfaceOrientation_lock:", a3);
  objc_msgSend((id)s_instance_lock, "unlock");
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_8);
}

void __49__JFXOrientationMonitor_setInterfaceOrientation___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:userInfo:", CFSTR("kJFXOrientationMonitorInterfaceOrientationNotification"), 0, 0);

}

- (void)dealloc
{
  objc_super v3;

  if (-[JFXOrientationMonitor darwinNotificationToken](self, "darwinNotificationToken") != -48879)
    notify_cancel(-[JFXOrientationMonitor darwinNotificationToken](self, "darwinNotificationToken"));
  v3.receiver = self;
  v3.super_class = (Class)JFXOrientationMonitor;
  -[JFXOrientationMonitor dealloc](&v3, sel_dealloc);
}

- (void)JFX_UIApplicationDidChangeStatusBarOrientationNotification:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend((id)s_instance, "keyWindow", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "interfaceOrientation");

  objc_msgSend((id)s_instance, "setInterfaceOrientation:", v5);
}

- (void)JFX_UIApplicationDidEnterBackgroundNotification:(id)a3
{
  notify_cancel(-[JFXOrientationMonitor darwinNotificationToken](self, "darwinNotificationToken", a3));
  -[JFXOrientationMonitor setDarwinNotificationToken:](self, "setDarwinNotificationToken:", 4294918417);
}

- (void)JFX_UIApplicationWillEnterForegroundNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  -[JFXOrientationMonitor JFX_initDarwinNotification](self, "JFX_initDarwinNotification");
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[JFXOrientationMonitor darwinNotificationQ](self, "darwinNotificationQ");
  v5 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __74__JFXOrientationMonitor_JFX_UIApplicationWillEnterForegroundNotification___block_invoke;
  v9[3] = &unk_24EE57A80;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v5, v9);

  objc_msgSend((id)s_instance, "setDeviceOrientation:", v11[3]);
  -[JFXOrientationMonitor keyWindow](self, "keyWindow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "interfaceOrientation");

  objc_msgSend((id)s_instance, "setInterfaceOrientation:", v8);
  _Block_object_dispose(&v10, 8);

}

uint64_t __74__JFXOrientationMonitor_JFX_UIApplicationWillEnterForegroundNotification___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "JFX_deviceOrientation_darwinNotificationQ");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (void)JFX_initLock
{
  if (JFX_initLock_onceToken != -1)
    dispatch_once(&JFX_initLock_onceToken, &__block_literal_global_25);
}

void __37__JFXOrientationMonitor_JFX_initLock__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)s_instance_lock;
  s_instance_lock = v0;

}

- (void)JFX_initDarwinNotification
{
  const char *v3;
  NSObject *v4;
  _QWORD v5[5];
  int out_token;

  if (-[JFXOrientationMonitor darwinNotificationToken](self, "darwinNotificationToken") != -48879)
    notify_cancel(-[JFXOrientationMonitor darwinNotificationToken](self, "darwinNotificationToken"));
  -[JFXOrientationMonitor setDarwinNotificationToken:](self, "setDarwinNotificationToken:", 4294918417);
  out_token = -48879;
  v3 = (const char *)objc_msgSend(CFSTR("com.apple.backboardd.rawOrientation"), "UTF8String");
  -[JFXOrientationMonitor darwinNotificationQ](self, "darwinNotificationQ");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__JFXOrientationMonitor_JFX_initDarwinNotification__block_invoke;
  v5[3] = &unk_24EE58740;
  v5[4] = self;
  LODWORD(v3) = notify_register_dispatch(v3, &out_token, v4, v5);

  if (!(_DWORD)v3)
    -[JFXOrientationMonitor setDarwinNotificationToken:](self, "setDarwinNotificationToken:", out_token);
}

uint64_t __51__JFXOrientationMonitor_JFX_initDarwinNotification__block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = objc_msgSend(*(id *)(a1 + 32), "JFX_deviceOrientation_darwinNotificationQ");
  return objc_msgSend((id)s_instance, "setDeviceOrientation:", v1);
}

- (int64_t)JFX_deviceOrientation_darwinNotificationQ
{
  NSObject *v3;
  uint64_t state64;

  -[JFXOrientationMonitor darwinNotificationQ](self, "darwinNotificationQ");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  state64 = 0;
  if (notify_get_state(-[JFXOrientationMonitor darwinNotificationToken](self, "darwinNotificationToken"), &state64))
    return 0;
  else
    return state64;
}

- (UIWindow)keyWindow
{
  return self->_keyWindow;
}

- (OS_dispatch_queue)darwinNotificationQ
{
  return self->_darwinNotificationQ;
}

- (int)darwinNotificationToken
{
  return self->_darwinNotificationToken;
}

- (void)setDarwinNotificationToken:(int)a3
{
  self->_darwinNotificationToken = a3;
}

- (int64_t)deviceOrientation_lock
{
  return self->_deviceOrientation_lock;
}

- (void)setDeviceOrientation_lock:(int64_t)a3
{
  self->_deviceOrientation_lock = a3;
}

- (void)setDeviceInterfaceOrientation:(int64_t)a3
{
  self->_deviceInterfaceOrientation = a3;
}

- (int64_t)deviceInterfaceOrientation_lock
{
  return self->_deviceInterfaceOrientation_lock;
}

- (void)setDeviceInterfaceOrientation_lock:(int64_t)a3
{
  self->_deviceInterfaceOrientation_lock = a3;
}

- (int64_t)interfaceOrientation_lock
{
  return self->_interfaceOrientation_lock;
}

- (void)setInterfaceOrientation_lock:(int64_t)a3
{
  self->_interfaceOrientation_lock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darwinNotificationQ, 0);
  objc_storeStrong((id *)&self->_keyWindow, 0);
}

@end
