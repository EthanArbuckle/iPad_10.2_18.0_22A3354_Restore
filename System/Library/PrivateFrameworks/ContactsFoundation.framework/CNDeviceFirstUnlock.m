@implementation CNDeviceFirstUnlock

uint64_t __57__CNDeviceFirstUnlock_removeUnlockHandlerWithIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "withHandlersLock_cancelExistingOperationWithIdentifier:", *(_QWORD *)(a1 + 40));
}

- (void)withHandlersLock_cancelExistingOperationWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (CNIsStringNonempty_block_invoke_2((uint64_t)&__block_literal_global_109, v7))
  {
    -[CNDeviceFirstUnlock unlockHandlers](self, "unlockHandlers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "cancel");
    -[CNDeviceFirstUnlock unlockHandlers](self, "unlockHandlers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v7);

  }
}

- (NSMutableDictionary)unlockHandlers
{
  return self->_unlockHandlers;
}

- (BOOL)isUnlockedSinceBoot
{
  return +[CNMobileKeyBag isDeviceUnlockedSinceBoot](CNMobileKeyBag, "isDeviceUnlockedSinceBoot");
}

void __37__CNDeviceFirstUnlock_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_cn_once_object_1;
  sharedInstance_cn_once_object_1 = (uint64_t)v1;

}

- (CNDeviceFirstUnlock)init
{
  CNDeviceFirstUnlock *v2;
  CNUnfairLock *v3;
  CNUnfairLock *handlersLock;
  NSMutableDictionary *v5;
  NSMutableDictionary *unlockHandlers;
  NSOperationQueue *v7;
  NSOperationQueue *workQueue;
  CNDeviceFirstUnlock *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CNDeviceFirstUnlock;
  v2 = -[CNDeviceFirstUnlock init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CNUnfairLock);
    handlersLock = v2->_handlersLock;
    v2->_handlersLock = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    unlockHandlers = v2->_unlockHandlers;
    v2->_unlockHandlers = v5;

    v7 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    workQueue = v2->_workQueue;
    v2->_workQueue = v7;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_workQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setSuspended:](v2->_workQueue, "setSuspended:", 1);
    v9 = v2;
  }

  return v2;
}

- (void)removeUnlockHandlerWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CNDeviceFirstUnlock handlersLock](self, "handlersLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__CNDeviceFirstUnlock_removeUnlockHandlerWithIdentifier___block_invoke;
  v7[3] = &unk_1E29B8C10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  CNRunWithLock(v5, v7);

}

- (CNUnfairLock)handlersLock
{
  return self->_handlersLock;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CNDeviceFirstUnlock_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_cn_once_token_1 != -1)
    dispatch_once(&sharedInstance_cn_once_token_1, block);
  return (id)sharedInstance_cn_once_object_1;
}

- (void)dealloc
{
  objc_super v3;

  -[CNFuture cancel](self->_firstUnlockFuture, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)CNDeviceFirstUnlock;
  -[CNDeviceFirstUnlock dealloc](&v3, sel_dealloc);
}

- (void)addUnlockHandlerWithIdentifier:(id)a3 block:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v10 = a3;
  v6 = a4;
  if (-[CNDeviceFirstUnlock isUnlockedSinceBoot](self, "isUnlockedSinceBoot"))
  {
    -[CNDeviceFirstUnlock workQueue](self, "workQueue", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addOperationWithBlock:", v6);

    -[CNDeviceFirstUnlock workQueue](self, "workQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSuspended:", 0);

  }
  else
  {
    -[CNDeviceFirstUnlock handlersLock](self, "handlersLock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__CNDeviceFirstUnlock_addUnlockHandlerWithIdentifier_block___block_invoke;
    v11[3] = &unk_1E29B9D10;
    v11[4] = self;
    v12 = v10;
    v13 = v6;
    CNRunWithLock(v9, v11);

  }
}

uint64_t __60__CNDeviceFirstUnlock_addUnlockHandlerWithIdentifier_block___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "withHandlersLock_addHandlerWithIdentifier:block:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "withHandlersLock_registerForDeviceFirstUnlock");
}

- (void)withHandlersLock_addHandlerWithIdentifier:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  id v20;
  id location;

  v6 = a3;
  v7 = a4;
  if (CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v6))
  {
    -[CNDeviceFirstUnlock workQueue](self, "workQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addOperationWithBlock:", v7);

  }
  else
  {
    -[CNDeviceFirstUnlock withHandlersLock_cancelExistingOperationWithIdentifier:](self, "withHandlersLock_cancelExistingOperationWithIdentifier:", v6);
    objc_initWeak(&location, self);
    v9 = (void *)MEMORY[0x1E0CB34C8];
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __71__CNDeviceFirstUnlock_withHandlersLock_addHandlerWithIdentifier_block___block_invoke;
    v17 = &unk_1E29BB658;
    v19 = v7;
    objc_copyWeak(&v20, &location);
    v10 = v6;
    v18 = v10;
    objc_msgSend(v9, "blockOperationWithBlock:", &v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNDeviceFirstUnlock unlockHandlers](self, "unlockHandlers", v14, v15, v16, v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v10);

    -[CNDeviceFirstUnlock workQueue](self, "workQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addOperation:", v11);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

}

void __71__CNDeviceFirstUnlock_withHandlersLock_addHandlerWithIdentifier_block___block_invoke(uint64_t a1)
{
  id WeakRetained;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "removeUnlockHandlerWithIdentifier:", *(_QWORD *)(a1 + 32));

}

- (void)withHandlersLock_registerForDeviceFirstUnlock
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  -[CNDeviceFirstUnlock firstUnlockFuture](self, "firstUnlockFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[CNDeviceFirstUnlockFuture deviceFirstUnlockFuture](CNDeviceFirstUnlockFuture, "deviceFirstUnlockFuture");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNDeviceFirstUnlock setFirstUnlockFuture:](self, "setFirstUnlockFuture:", v4);

    -[CNDeviceFirstUnlock workQueue](self, "workQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNDeviceFirstUnlock firstUnlockFuture](self, "firstUnlockFuture");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __68__CNDeviceFirstUnlock_withHandlersLock_registerForDeviceFirstUnlock__block_invoke;
    v8[3] = &unk_1E29BA8B8;
    v9 = v5;
    v7 = v5;
    objc_msgSend(v6, "addSuccessBlock:", v8);

  }
}

uint64_t __68__CNDeviceFirstUnlock_withHandlersLock_registerForDeviceFirstUnlock__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSuspended:", 0);
}

- (void)waitForAllOperationsToFinish
{
  id v2;

  -[CNDeviceFirstUnlock workQueue](self, "workQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "waitUntilAllOperationsAreFinished");

}

- (int64_t)countOfUnlockHandlers
{
  void *v3;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[CNDeviceFirstUnlock handlersLock](self, "handlersLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__CNDeviceFirstUnlock_countOfUnlockHandlers__block_invoke;
  v6[3] = &unk_1E29B9330;
  v6[4] = self;
  v6[5] = &v7;
  CNRunWithLock(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __44__CNDeviceFirstUnlock_countOfUnlockHandlers__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "unlockHandlers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "count");

}

- (void)setHandlersLock:(id)a3
{
  objc_storeStrong((id *)&self->_handlersLock, a3);
}

- (void)setUnlockHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_unlockHandlers, a3);
}

- (NSOperationQueue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (CNFuture)firstUnlockFuture
{
  return self->_firstUnlockFuture;
}

- (void)setFirstUnlockFuture:(id)a3
{
  objc_storeStrong((id *)&self->_firstUnlockFuture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstUnlockFuture, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_unlockHandlers, 0);
  objc_storeStrong((id *)&self->_handlersLock, 0);
}

@end
