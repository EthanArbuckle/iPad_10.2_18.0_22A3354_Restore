@implementation ENGroupContextNotifyingObserver

- (ENGroupContextNotifyingObserver)initWithQueue:(id)a3
{
  id v5;
  ENGroupContextNotifyingObserver *v6;
  ENGroupContextNotifyingObserver *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ENGroupContextNotifyingObserver;
  v6 = -[ENGroupContextNotifyingObserver init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_queue, a3);

  return v7;
}

- (void)groupContext:(id)a3 didCreateGroup:(id)a4
{
  NSObject *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;

  v8 = a4;
  -[ENGroupContextNotifyingObserver queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[ENGroupContextNotifyingObserver onGroupCreate](self, "onGroupCreate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ENGroupContextNotifyingObserver onGroupCreate](self, "onGroupCreate");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v7)[2](v7, v8);

  }
}

- (void)groupContext:(id)a3 didCacheGroup:(id)a4
{
  NSObject *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;

  v8 = a4;
  -[ENGroupContextNotifyingObserver queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[ENGroupContextNotifyingObserver onGroupCache](self, "onGroupCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ENGroupContextNotifyingObserver onGroupCache](self, "onGroupCache");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v7)[2](v7, v8);

  }
}

- (void)groupContext:(id)a3 didUpdateGroup:(id)a4 withNewGroup:(id)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  id v11;

  v11 = a4;
  v7 = a5;
  -[ENGroupContextNotifyingObserver queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[ENGroupContextNotifyingObserver onGroupUpdate](self, "onGroupUpdate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[ENGroupContextNotifyingObserver onGroupUpdate](self, "onGroupUpdate");
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v10)[2](v10, v11, v7);

  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (id)onGroupCache
{
  return self->_onGroupCache;
}

- (void)setOnGroupCache:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)onGroupCreate
{
  return self->_onGroupCreate;
}

- (void)setOnGroupCreate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)onGroupUpdate
{
  return self->_onGroupUpdate;
}

- (void)setOnGroupUpdate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onGroupUpdate, 0);
  objc_storeStrong(&self->_onGroupCreate, 0);
  objc_storeStrong(&self->_onGroupCache, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
