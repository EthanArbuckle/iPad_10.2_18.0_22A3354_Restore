@implementation VSRemoteNotifier

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VSRemoteNotifier)initWithNotificationName:(id)a3
{
  id v4;
  VSRemoteNotifier *v5;
  uint64_t v6;
  NSString *notificationObject;
  uint64_t v8;
  NSDistributedNotificationCenter *distributedNotificationCenter;
  uint64_t v10;
  NSString *remoteNotificationName;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VSRemoteNotifier;
  v5 = -[VSRemoteNotifier init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "_currentProcessIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    notificationObject = v5->_notificationObject;
    v5->_notificationObject = (NSString *)v6;

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v8 = objc_claimAutoreleasedReturnValue();
    distributedNotificationCenter = v5->_distributedNotificationCenter;
    v5->_distributedNotificationCenter = (NSDistributedNotificationCenter *)v8;

    v10 = objc_msgSend(v4, "copy");
    remoteNotificationName = v5->_remoteNotificationName;
    v5->_remoteNotificationName = (NSString *)v10;

    -[NSDistributedNotificationCenter addObserver:selector:name:object:](v5->_distributedNotificationCenter, "addObserver:selector:name:object:", v5, sel__didReceiveDistributedNotification_, v4, 0);
  }

  return v5;
}

void __45__VSRemoteNotifier__currentProcessIdentifier__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)_currentProcessIdentifier___vs_lazy_init_variable;
  _currentProcessIdentifier___vs_lazy_init_variable = v1;

}

+ (id)_currentProcessIdentifier
{
  if (_currentProcessIdentifier___vs_lazy_init_predicate != -1)
    dispatch_once(&_currentProcessIdentifier___vs_lazy_init_predicate, &__block_literal_global_2);
  return (id)_currentProcessIdentifier___vs_lazy_init_variable;
}

- (VSRemoteNotifier)init
{
  -[VSRemoteNotifier doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[NSDistributedNotificationCenter removeObserver:name:object:](self->_distributedNotificationCenter, "removeObserver:name:object:", self, self->_remoteNotificationName, 0);
  v3.receiver = self;
  v3.super_class = (Class)VSRemoteNotifier;
  -[VSRemoteNotifier dealloc](&v3, sel_dealloc);
}

- (void)_didReceiveDistributedNotification:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[VSRemoteNotifier notificationObject](self, "notificationObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) == 0)
  {
    -[VSRemoteNotifier delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v9, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "remoteNotifier:didReceiveRemoteNotificationWithUserInfo:", self, v8);

    }
  }

}

- (void)postNotification
{
  -[VSRemoteNotifier postNotificationWithUserInfo:](self, "postNotificationWithUserInfo:", 0);
}

- (void)postNotificationWithUserInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[VSRemoteNotifier distributedNotificationCenter](self, "distributedNotificationCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[VSRemoteNotifier remoteNotificationName](self, "remoteNotificationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSRemoteNotifier notificationObject](self, "notificationObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", v5, v6, v4);

}

- (NSString)remoteNotificationName
{
  return self->_remoteNotificationName;
}

- (VSRemoteNotifierDelegate)delegate
{
  return (VSRemoteNotifierDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)notificationObject
{
  return self->_notificationObject;
}

- (void)setNotificationObject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDistributedNotificationCenter)distributedNotificationCenter
{
  return self->_distributedNotificationCenter;
}

- (void)setDistributedNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_distributedNotificationCenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distributedNotificationCenter, 0);
  objc_storeStrong((id *)&self->_notificationObject, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_remoteNotificationName, 0);
}

@end
