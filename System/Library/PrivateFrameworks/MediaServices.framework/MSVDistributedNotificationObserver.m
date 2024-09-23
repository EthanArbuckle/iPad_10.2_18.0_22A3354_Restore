@implementation MSVDistributedNotificationObserver

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

+ (id)observerWithDistributedName:(id)a3 localName:(id)a4 queue:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDistributedName:localName:queue:", v9, v8, v7);

  return v10;
}

- (MSVDistributedNotificationObserver)initWithDistributedName:(id)a3 localName:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  id v10;
  MSVDistributedNotificationObserver *v11;
  uint64_t v12;
  NSString *distributedName;
  uint64_t v14;
  NSString *localName;
  OS_dispatch_queue *v16;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v18;
  id v19;
  const char *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t handler;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  void *v27;
  id v28;
  id location;
  objc_super v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v30.receiver = self;
  v30.super_class = (Class)MSVDistributedNotificationObserver;
  v11 = -[MSVDistributedNotificationObserver init](&v30, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    distributedName = v11->_distributedName;
    v11->_distributedName = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    localName = v11->_localName;
    v11->_localName = (NSString *)v14;

    if (v10)
    {
      v16 = (OS_dispatch_queue *)v10;
      queue = v11->_queue;
      v11->_queue = v16;
    }
    else
    {
      v18 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
      v19 = MEMORY[0x1E0C80D38];
      queue = v11->_queue;
      v11->_queue = v18;
    }

    objc_initWeak(&location, v11);
    v20 = -[NSString UTF8String](v11->_distributedName, "UTF8String");
    v21 = v11->_queue;
    handler = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __78__MSVDistributedNotificationObserver_initWithDistributedName_localName_queue___block_invoke;
    v27 = &unk_1E43E87B8;
    objc_copyWeak(&v28, &location);
    v22 = notify_register_dispatch(v20, &v11->_notifyToken, v21, &handler);
    if ((_DWORD)v22)
      NSLog(CFSTR("Error registering for distributed notification %@. (status = %d)"), v11->_distributedName, v22, handler, v25, v26, v27);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (MSVDistributedNotificationObserver)init
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99750];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDistributedName_localName_queue_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%@ is invalid. Use %@ instead."), v5, v6);

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_notifyToken);
  v3.receiver = self;
  v3.super_class = (Class)MSVDistributedNotificationObserver;
  -[MSVDistributedNotificationObserver dealloc](&v3, sel_dealloc);
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)_handleDistributedNotificationWithNotifyToken:(int)a3
{
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || objc_msgSend(WeakRetained, "observerShouldForwardDistributedNotification:", self))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSVDistributedNotificationObserver userInfoForLocalNotification](self, "userInfoForLocalNotification");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:userInfo:", self->_localName, self, v5);

  }
}

- (NSString)distributedName
{
  return self->_distributedName;
}

- (NSString)localName
{
  return self->_localName;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (MSVDistributedNotificationObserverDelegate)delegate
{
  return (MSVDistributedNotificationObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSDictionary)userInfoForLocalNotification
{
  return self->_userInfoForLocalNotification;
}

- (void)setUserInfoForLocalNotification:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfoForLocalNotification, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_localName, 0);
  objc_storeStrong((id *)&self->_distributedName, 0);
}

void __78__MSVDistributedNotificationObserver_initWithDistributedName_localName_queue___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleDistributedNotificationWithNotifyToken:", a2);
    WeakRetained = v4;
  }

}

@end
