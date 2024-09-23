@implementation MOSink

- (void)receiveSubscription:(id)a3
{
  NSObject *v5;
  id v6;

  v6 = a3;
  v5 = self->_lock;
  objc_sync_enter(v5);
  if (self->_active && !self->_subscription)
  {
    objc_storeStrong((id *)&self->_subscription, a3);
    objc_sync_exit(v5);

    objc_msgSend(v6, "requestDemand:", -1);
  }
  else
  {
    objc_sync_exit(v5);

    objc_msgSend(v6, "cancel");
  }

}

- (MOSink)initWithCompletion:(id)a3 receiveInput:(id)a4
{
  id v5;
  id v6;
  MOSink *v7;
  uint64_t v8;
  id receiveCompletionBlock;
  uint64_t v10;
  id receiveInputBlock;
  uint64_t v12;
  NSObject *lock;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MOSink;
  v5 = a4;
  v6 = a3;
  v7 = -[MOSubscriber initSubscriber](&v15, sel_initSubscriber);
  v8 = MEMORY[0x1B5E3442C](v6);

  receiveCompletionBlock = v7->_receiveCompletionBlock;
  v7->_receiveCompletionBlock = (id)v8;

  v10 = MEMORY[0x1B5E3442C](v5);
  receiveInputBlock = v7->_receiveInputBlock;
  v7->_receiveInputBlock = (id)v10;

  v7->_active = 1;
  v12 = objc_opt_new();
  lock = v7->_lock;
  v7->_lock = v12;

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[MOSink cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)MOSink;
  -[MOSink dealloc](&v3, sel_dealloc);
}

- (unint64_t)receiveInput:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;

  v4 = a3;
  v5 = self->_lock;
  objc_sync_enter(v5);
  if (self->_active)
  {
    v6 = MEMORY[0x1B5E3442C](self->_receiveInputBlock);
    objc_sync_exit(v5);

    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v4);
    v5 = v6;
  }
  else
  {
    objc_sync_exit(v5);
  }

  return 0;
}

- (void)receiveCompletion:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  v4 = self->_lock;
  objc_sync_enter(v4);
  if (self->_active)
  {
    v5 = MEMORY[0x1B5E3442C](self->_receiveCompletionBlock);
    objc_sync_exit(v4);

    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    -[MOSink cancel](self, "cancel");
    v4 = v5;
  }
  else
  {
    objc_sync_exit(v4);
  }

}

- (void)cancel
{
  NSObject *v3;
  _BOOL4 active;
  MOSubscription *subscription;
  id receiveInputBlock;
  id receiveCompletionBlock;
  MOSubscription *v8;
  MOSubscription *v10;

  v3 = self->_lock;
  objc_sync_enter(v3);
  active = self->_active;
  if (self->_active)
  {
    v10 = self->_subscription;
    subscription = self->_subscription;
    self->_subscription = 0;

    receiveInputBlock = self->_receiveInputBlock;
    self->_receiveInputBlock = 0;

    receiveCompletionBlock = self->_receiveCompletionBlock;
    self->_receiveCompletionBlock = 0;

    self->_active = 0;
  }
  else
  {
    v10 = 0;
  }
  objc_sync_exit(v3);

  v8 = v10;
  if (active && v10 != 0)
  {
    -[MOSubscription cancel](v10, "cancel");
    v8 = v10;
  }

}

- (id)receiveCompletionBlock
{
  return self->_receiveCompletionBlock;
}

- (id)receiveInputBlock
{
  return self->_receiveInputBlock;
}

- (MOSubscription)subscription
{
  return self->_subscription;
}

- (BOOL)active
{
  return self->_active;
}

- (NSObject)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_storeStrong(&self->_receiveInputBlock, 0);
  objc_storeStrong(&self->_receiveCompletionBlock, 0);
}

@end
