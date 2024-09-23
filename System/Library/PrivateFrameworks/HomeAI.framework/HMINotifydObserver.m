@implementation HMINotifydObserver

- (HMINotifydObserver)initWithNotificationName:(const char *)a3 andQueue:(id)a4 andCallback:(id)a5
{
  id v9;
  id v10;
  HMINotifydObserver *v11;
  HMINotifydObserver *v12;
  uint64_t v13;
  id callback;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HMINotifydObserver;
  v11 = -[HMINotifydObserver init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_queue, a4);
    v13 = MEMORY[0x220735744](v10);
    callback = v12->_callback;
    v12->_callback = (id)v13;

    v12->_notificationName = a3;
    v12->_token = -1;
  }

  return v12;
}

- (BOOL)start
{
  NSObject *v3;
  void *v4;
  HMINotifydObserver *v5;
  NSObject *v6;
  void *v7;
  BOOL v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  _QWORD handler[5];
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[HMINotifydObserver queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[HMINotifydObserver token](self, "token") == -1)
  {
    *(_DWORD *)buf = -1;
    v9 = -[HMINotifydObserver notificationName](self, "notificationName");
    -[HMINotifydObserver queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __27__HMINotifydObserver_start__block_invoke;
    handler[3] = &unk_24DBED6A0;
    handler[4] = self;
    v11 = notify_register_dispatch(v9, (int *)buf, v10, handler);

    v8 = v11 == 0;
    if (!v11)
    {
      -[HMINotifydObserver publishInitialValue](self, "publishInitialValue");
      -[HMINotifydObserver setToken:](self, "setToken:", *(unsigned int *)buf);
    }
  }
  else
  {
    v4 = (void *)MEMORY[0x220735570]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v7;
      _os_log_impl(&dword_219D45000, v6, OS_LOG_TYPE_ERROR, "%{public}@Already started listening for the notification", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    return 0;
  }
  return v8;
}

uint64_t __27__HMINotifydObserver_start__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "publishValueForToken:", a2);
}

- (void)publishValueForToken:(int)a3
{
  NSObject *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  uint64_t state64;

  -[HMINotifydObserver queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  state64 = 0;
  if (!notify_get_state(a3, &state64))
  {
    -[HMINotifydObserver callback](self, "callback");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, HMINotifydObserver *, uint64_t))v6)[2](v6, self, state64);

  }
}

- (void)publishInitialValue
{
  NSObject *v3;
  int out_token;

  -[HMINotifydObserver queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  out_token = -1;
  if (!notify_register_check(-[HMINotifydObserver notificationName](self, "notificationName"), &out_token))
  {
    -[HMINotifydObserver publishValueForToken:](self, "publishValueForToken:", out_token);
    notify_cancel(out_token);
  }
}

- (void)dealloc
{
  int token;
  objc_super v4;

  token = self->_token;
  if (token != -1)
    notify_cancel(token);
  v4.receiver = self;
  v4.super_class = (Class)HMINotifydObserver;
  -[HMINotifydObserver dealloc](&v4, sel_dealloc);
}

- (const)notificationName
{
  return self->_notificationName;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)callback
{
  return self->_callback;
}

- (int)token
{
  return self->_token;
}

- (void)setToken:(int)a3
{
  self->_token = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
