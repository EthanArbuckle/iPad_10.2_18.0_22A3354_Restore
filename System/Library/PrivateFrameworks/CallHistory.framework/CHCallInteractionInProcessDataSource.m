@implementation CHCallInteractionInProcessDataSource

- (CHCallInteractionInProcessDataSource)init
{
  CHCallInteractionInProcessDataSource *v2;
  CHCallInteractionInProcessDataSource *v3;
  id v4;
  const char *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  CHCallInteractionInProcessDataSource *v8;
  void *v9;
  CHNotifyObserver *v10;
  void *v11;
  uint64_t v12;
  CHNotifyObserver *callInteractionObserver;
  _QWORD v15[4];
  CHCallInteractionInProcessDataSource *v16;
  id v17;
  id location;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CHCallInteractionInProcessDataSource;
  v2 = -[CHCallInteractionInProcessDataSource init](&v19, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_accessorLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.CallHistory.queue.%@.%p"), objc_opt_class(), v2);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = (const char *)objc_msgSend(v4, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create(v5, v6);

    objc_initWeak(&location, v3);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __44__CHCallInteractionInProcessDataSource_init__block_invoke;
    v15[3] = &unk_1E67463E8;
    objc_copyWeak(&v17, &location);
    v8 = v3;
    v16 = v8;
    v9 = (void *)MEMORY[0x1B5E33208](v15);
    v10 = [CHNotifyObserver alloc];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.callhistory.notification.call-interactions-changed");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CHNotifyObserver initWithName:queue:callback:](v10, "initWithName:queue:callback:", v11, v7, v9);
    callInteractionObserver = v8->_callInteractionObserver;
    v8->_callInteractionObserver = (CHNotifyObserver *)v12;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
  return v3;
}

void __44__CHCallInteractionInProcessDataSource_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "callInteractionsDidChangeForDataSource:", *(_QWORD *)(a1 + 32));

    WeakRetained = v4;
  }

}

- (CHCallInteractionDataSourceDelegate)delegate
{
  os_unfair_lock_s *p_accessorLock;
  CHCallInteractionDataSourceDelegate *v4;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v4 = self->_delegate;
  os_unfair_lock_unlock(p_accessorLock);
  return v4;
}

- (void)setDelegate:(id)a3
{
  os_unfair_lock_s *p_accessorLock;
  CHCallInteractionDataSourceDelegate **p_delegate;
  CHCallInteractionDataSourceDelegate *delegate;
  CHCallInteractionDataSourceDelegate *v8;

  v8 = (CHCallInteractionDataSourceDelegate *)a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  delegate = self->_delegate;
  p_delegate = &self->_delegate;
  if (delegate != v8)
    objc_storeStrong((id *)p_delegate, a3);
  os_unfair_lock_unlock(p_accessorLock);

}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (CHNotifyObserver)callInteractionObserver
{
  return self->_callInteractionObserver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callInteractionObserver, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
