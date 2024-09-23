@implementation HMMTRControllerFactoryStorage

- (id)storageDataForKey:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2808;
  v16 = __Block_byref_object_dispose__2809;
  v17 = 0;
  -[HMMTRControllerFactoryStorage workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__HMMTRControllerFactoryStorage_storageDataForKey___block_invoke;
  block[3] = &unk_250F235D0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (BOOL)setStorageData:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[HMMTRControllerFactoryStorage workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__HMMTRControllerFactoryStorage_setStorageData_forKey___block_invoke;
  block[3] = &unk_250F224F8;
  block[4] = self;
  v13 = v7;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(v8, block);

  return 1;
}

- (BOOL)removeStorageDataForKey:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[HMMTRControllerFactoryStorage workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__HMMTRControllerFactoryStorage_removeStorageDataForKey___block_invoke;
  v8[3] = &unk_250F22458;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  dispatch_sync(v5, v8);

  return 1;
}

- (id)dictionaryCopy
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2808;
  v11 = __Block_byref_object_dispose__2809;
  v12 = 0;
  -[HMMTRControllerFactoryStorage workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__HMMTRControllerFactoryStorage_dictionaryCopy__block_invoke;
  v6[3] = &unk_250F235A8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (HMMTRControllerFactoryStorage)init
{
  HMMTRControllerFactoryStorage *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *workQueue;
  uint64_t v5;
  NSMutableDictionary *mtrControllerFactoryKeyValueStore;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMMTRControllerFactoryStorage;
  v2 = -[HMMTRControllerFactoryStorage init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("HMMTRControllerFactoryStorage", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    mtrControllerFactoryKeyValueStore = v2->_mtrControllerFactoryKeyValueStore;
    v2->_mtrControllerFactoryKeyValueStore = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (void)clear
{
  NSObject *v3;
  _QWORD block[5];

  -[HMMTRControllerFactoryStorage workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__HMMTRControllerFactoryStorage_clear__block_invoke;
  block[3] = &unk_250F23DF0;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (NSMutableDictionary)mtrControllerFactoryKeyValueStore
{
  return self->_mtrControllerFactoryKeyValueStore;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_mtrControllerFactoryKeyValueStore, 0);
}

void __38__HMMTRControllerFactoryStorage_clear__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "mtrControllerFactoryKeyValueStore");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

}

void __47__HMMTRControllerFactoryStorage_dictionaryCopy__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "mtrControllerFactoryKeyValueStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __57__HMMTRControllerFactoryStorage_removeStorageDataForKey___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "mtrControllerFactoryKeyValueStore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));

}

void __55__HMMTRControllerFactoryStorage_setStorageData_forKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "mtrControllerFactoryKeyValueStore");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

}

void __51__HMMTRControllerFactoryStorage_storageDataForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "mtrControllerFactoryKeyValueStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
