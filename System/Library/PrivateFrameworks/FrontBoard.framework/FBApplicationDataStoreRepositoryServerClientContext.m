@implementation FBApplicationDataStoreRepositoryServerClientContext

- (FBApplicationDataStoreRepositoryServerClientContext)initWithDataStore:(id)a3
{
  id v5;
  FBApplicationDataStoreRepositoryServerClientContext *v6;
  FBApplicationDataStoreRepositoryServerClientContext *v7;
  uint64_t Serial;
  OS_dispatch_queue *queue;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FBApplicationDataStoreRepositoryServerClientContext;
  v6 = -[FBApplicationDataStoreRepositoryServerClientContext init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataStore, a3);
    Serial = BSDispatchQueueCreateSerial();
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)Serial;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v7, sel__repositoryInvalidated_, CFSTR("FBApplicationStoreRepositoryInvalidatedNotification"), 0);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)FBApplicationDataStoreRepositoryServerClientContext;
  -[FBApplicationDataStoreRepositoryServerClientContext dealloc](&v4, sel_dealloc);
}

- (void)setInterestedInAllChanges:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __81__FBApplicationDataStoreRepositoryServerClientContext_setInterestedInAllChanges___block_invoke;
  v4[3] = &unk_1E4A12730;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(queue, v4);
}

uint64_t __81__FBApplicationDataStoreRepositoryServerClientContext_setInterestedInAllChanges___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 32) != v2)
  {
    *(_BYTE *)(v1 + 32) = v2;
    return objc_msgSend(*(id *)(result + 32), "_queue_updateObservers");
  }
  return result;
}

- (void)setPrefetchedKeys:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__FBApplicationDataStoreRepositoryServerClientContext_setPrefetchedKeys___block_invoke;
  block[3] = &unk_1E4A11FD0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __73__FBApplicationDataStoreRepositoryServerClientContext_setPrefetchedKeys___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateObservers");
}

- (void)_queue_updateObservers
{
  _BOOL4 interestedInAllChanges;
  void *v4;
  id v5;

  if (-[NSSet count](self->_prefetchedKeys, "count"))
    interestedInAllChanges = 1;
  else
    interestedInAllChanges = self->_interestedInAllChanges;
  if (self->_observingChanges != interestedInAllChanges)
  {
    self->_observingChanges = interestedInAllChanges;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (self->_observingChanges)
      objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__valueChanged_, CFSTR("FBApplicationStoreRepositoryChangeNotification"), 0);
    else
      objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("FBApplicationStoreRepositoryChangeNotification"), 0);

  }
}

- (void)_valueChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("FBApplicationStoreRepositoryChangeApp"));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("FBApplicationStoreRepositoryChangeKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", CFSTR("FBApplicationStoreRepositoryChangeValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "applicationDataStoreRepositoryClientContext:valueChangedForObject:key:appID:", self, v9, v7, v11);

}

- (void)_repositoryInvalidated:(id)a3
{
  void *v4;
  id WeakRetained;
  id v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("FBApplicationStoreRepositoryChangeApp"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "applicationDataStoreRepositoryClientContext:repositoryInvalidatedForAppID:", self, v6);

}

- (FBApplicationDataStoreRepositoryServerClientContextDelegate)delegate
{
  return (FBApplicationDataStoreRepositoryServerClientContextDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (FBSServiceFacilityClientHandle)clientHandle
{
  return (FBSServiceFacilityClientHandle *)objc_loadWeakRetained((id *)&self->_client);
}

- (void)setClientHandle:(id)a3
{
  objc_storeWeak((id *)&self->_client, a3);
}

- (NSSet)prefetchedKeys
{
  return self->_prefetchedKeys;
}

- (BOOL)interestedInAllChanges
{
  return self->_interestedInAllChanges;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_client);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_prefetchedKeys, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
}

@end
