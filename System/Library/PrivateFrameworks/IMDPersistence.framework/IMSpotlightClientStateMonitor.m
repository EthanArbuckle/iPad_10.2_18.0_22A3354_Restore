@implementation IMSpotlightClientStateMonitor

- (IMSpotlightClientStateMonitor)initWithChangeHandler:(id)a3
{
  id v4;
  IMSpotlightClientStateMonitor *v5;
  NSLock *v6;
  NSLock *lock;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  void *v11;
  id changeHandler;
  uint64_t v13;
  NSObject *v14;
  _QWORD block[4];
  IMSpotlightClientStateMonitor *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id location;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)IMSpotlightClientStateMonitor;
  v5 = -[IMSpotlightClientStateMonitor init](&v24, sel_init);
  if (v5)
  {
    v6 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lock = v5->_lock;
    v5->_lock = v6;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.imdpersistence.IMSpotlightClientStateMonitor", v8);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v9;

    v11 = _Block_copy(v4);
    changeHandler = v5->_changeHandler;
    v5->_changeHandler = v11;

    location = 0;
    objc_initWeak(&location, v5);
    v13 = MEMORY[0x1E0C809B0];
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = sub_1ABC25918;
    v21 = &unk_1E5ABF320;
    objc_copyWeak(&v22, &location);
    v5->_clientStateToken = IMDispatchForNotify();
    v14 = v5->_queue;
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = sub_1ABC25944;
    block[3] = &unk_1E5AB0868;
    v17 = v5;
    dispatch_async(v14, block);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (IMSpotlightClientStateMonitor)init
{
  return (IMSpotlightClientStateMonitor *)MEMORY[0x1E0DE7D20](self, sel_initWithChangeHandler_);
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_clientStateToken);
  v3.receiver = self;
  v3.super_class = (Class)IMSpotlightClientStateMonitor;
  -[IMSpotlightClientStateMonitor dealloc](&v3, sel_dealloc);
}

- (void)_updateClientState
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD block[6];
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_1ABC25AF4;
  v13 = sub_1ABC25B04;
  v14 = 0;
  -[IMSpotlightClientStateMonitor lock](self, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  +[IMDDatabase synchronousDatabase](IMDDatabase, "synchronousDatabase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1ABC25B0C;
  v8[3] = &unk_1E5ABF348;
  v8[4] = &v9;
  objc_msgSend(v4, "fetchSpotlightClientStateWithCompletion:", v8);

  objc_storeStrong((id *)&self->_clientState, (id)v10[5]);
  -[IMSpotlightClientStateMonitor lock](self, "lock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

  if (self->_changeHandler)
  {
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = sub_1ABC25B1C;
    block[3] = &unk_1E5AB8BA0;
    block[4] = self;
    block[5] = &v9;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  _Block_object_dispose(&v9, 8);

}

- (IMSpotlightClientState)clientState
{
  void *v3;
  void *v4;
  void *v5;

  -[IMSpotlightClientStateMonitor lock](self, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = (void *)-[IMSpotlightClientState copy](self->_clientState, "copy");
  -[IMSpotlightClientStateMonitor lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return (IMSpotlightClientState *)v4;
}

- (void)setClientState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSLock)lock
{
  return self->_lock;
}

- (int)clientStateToken
{
  return self->_clientStateToken;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_clientState, 0);
}

@end
