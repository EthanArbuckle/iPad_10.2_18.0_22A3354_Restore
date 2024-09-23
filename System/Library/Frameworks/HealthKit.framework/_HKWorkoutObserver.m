@implementation _HKWorkoutObserver

- (_HKWorkoutObserver)initWithHealthStore:(id)a3
{
  id v5;
  _HKWorkoutObserver *v6;
  _HKWorkoutObserver *v7;
  NSLock *v8;
  NSLock *lock;
  uint64_t v10;
  NSUUID *identifier;
  NSMutableArray *v12;
  NSMutableArray *pendingHandlers;
  HKTaskServerProxyProvider *v14;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id location;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_HKWorkoutObserver;
  v6 = -[_HKWorkoutObserver init](&v23, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    v8 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lock = v7->_lock;
    v7->_lock = v8;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v7->_identifier;
    v7->_identifier = (NSUUID *)v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingHandlers = v7->_pendingHandlers;
    v7->_pendingHandlers = v12;

    v14 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:]([HKTaskServerProxyProvider alloc], "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v7->_healthStore, CFSTR("_HKWorkoutObserverServerIdentifier"), v7, v7->_identifier);
    proxyProvider = v7->_proxyProvider;
    v7->_proxyProvider = v14;

    objc_initWeak(&location, v7);
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __42___HKWorkoutObserver_initWithHealthStore___block_invoke;
    v20 = &unk_1E37E87E0;
    objc_copyWeak(&v21, &location);
    -[HKProxyProvider setAutomaticProxyReconnectionHandler:](v7->_proxyProvider, "setAutomaticProxyReconnectionHandler:", &v17);
    -[_HKWorkoutObserver _startTaskServerIfNeeded](v7, "_startTaskServerIfNeeded", v17, v18, v19, v20);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_notifyToken);
  v3.receiver = self;
  v3.super_class = (Class)_HKWorkoutObserver;
  -[_HKWorkoutObserver dealloc](&v3, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSLock *lock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34___HKWorkoutObserver_setDelegate___block_invoke;
  v7[3] = &unk_1E37E6980;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSLock hk_withLock:](lock, "hk_withLock:", v7);

}

- (_HKWorkoutObserverDelegate)delegate
{
  NSLock *lock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30___HKWorkoutObserver_delegate__block_invoke;
  v5[3] = &unk_1E37E6810;
  v5[4] = self;
  v5[5] = &v6;
  -[NSLock hk_withLock:](lock, "hk_withLock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (_HKWorkoutObserverDelegate *)v3;
}

- (void)currentWorkoutSnapshotWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSLock *lock;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD aBlock[5];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59___HKWorkoutObserver_currentWorkoutSnapshotWithCompletion___block_invoke;
  aBlock[3] = &unk_1E37E8808;
  aBlock[4] = self;
  v12 = v4;
  v6 = _Block_copy(aBlock);
  lock = self->_lock;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __59___HKWorkoutObserver_currentWorkoutSnapshotWithCompletion___block_invoke_3;
  v9[3] = &unk_1E37E66E8;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[NSLock hk_withLock:](lock, "hk_withLock:", v9);

}

- (void)waitForAutomaticWorkoutRecoveryWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  HKTaskServerProxyProvider *proxyProvider;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD aBlock[5];
  id v14;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68___HKWorkoutObserver_waitForAutomaticWorkoutRecoveryWithCompletion___block_invoke;
  aBlock[3] = &unk_1E37E66E8;
  aBlock[4] = self;
  v14 = v4;
  v6 = _Block_copy(aBlock);
  proxyProvider = self->_proxyProvider;
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __68___HKWorkoutObserver_waitForAutomaticWorkoutRecoveryWithCompletion___block_invoke_3;
  v11[3] = &unk_1E37E8830;
  v12 = v6;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __68___HKWorkoutObserver_waitForAutomaticWorkoutRecoveryWithCompletion___block_invoke_4;
  v9[3] = &unk_1E37E69F8;
  v9[4] = self;
  v10 = v12;
  v8 = v12;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v11, v9);

}

+ (id)clientInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40E3E8);
}

+ (id)serverInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40E448);
}

- (id)exportedInterface
{
  return (id)objc_msgSend((id)objc_opt_class(), "clientInterface");
}

- (id)remoteInterface
{
  return (id)objc_msgSend((id)objc_opt_class(), "serverInterface");
}

- (void)connectionInterrupted
{
  NSLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43___HKWorkoutObserver_connectionInterrupted__block_invoke;
  v3[3] = &unk_1E37E6770;
  v3[4] = self;
  -[NSLock hk_withLock:](lock, "hk_withLock:", v3);
}

- (void)clientRemote_didUpdateWorkoutSnapshot:(id)a3
{
  id v4;
  uint64_t v5;
  NSLock *lock;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD v14[5];
  id v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;

  v4 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__2;
  v20[4] = __Block_byref_object_dispose__2;
  v21 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__2;
  v18[4] = __Block_byref_object_dispose__2;
  v19 = 0;
  v5 = MEMORY[0x1E0C809B0];
  lock = self->_lock;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60___HKWorkoutObserver_clientRemote_didUpdateWorkoutSnapshot___block_invoke;
  v14[3] = &unk_1E37E8858;
  v14[4] = self;
  v7 = v4;
  v15 = v7;
  v16 = v18;
  v17 = v20;
  -[NSLock hk_withLock:](lock, "hk_withLock:", v14);
  -[HKHealthStore clientQueue](self->_healthStore, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __60___HKWorkoutObserver_clientRemote_didUpdateWorkoutSnapshot___block_invoke_2;
  block[3] = &unk_1E37E8880;
  v11 = v7;
  v12 = v18;
  v13 = v20;
  v9 = v7;
  dispatch_async(v8, block);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);

}

- (void)_startTaskServerIfNeeded
{
  NSLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46___HKWorkoutObserver__startTaskServerIfNeeded__block_invoke;
  v3[3] = &unk_1E37E6770;
  v3[4] = self;
  -[NSLock hk_withLock:](lock, "hk_withLock:", v3);
}

- (void)_lock_startTaskServerIfNeeded
{
  _HKCurrentWorkoutSnapshot *latestSnapshot;
  HKTaskServerProxyProvider *proxyProvider;
  _QWORD v5[5];

  self->_receivedInitialSnapshot = 0;
  latestSnapshot = self->_latestSnapshot;
  self->_latestSnapshot = 0;

  proxyProvider = self->_proxyProvider;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51___HKWorkoutObserver__lock_startTaskServerIfNeeded__block_invoke_2;
  v5[3] = &unk_1E37E6A70;
  v5[4] = self;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", &__block_literal_global_5, v5);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKTaskServerProxyProvider)proxyProvider
{
  return self->_proxyProvider;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_pendingHandlers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_latestSnapshot, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
