@implementation HMDHomeKeyDataRecorder

- (HMDHomeKeyDataRecorder)init
{
  id v3;
  const char *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  HMDHomeKeyDataRecorder *v7;
  HMDHomeKeyDataRecorder *v8;
  objc_super v10;

  HMDispatchQueueNameString();
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (const char *)objc_msgSend(v3, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_queue_create(v4, v5);

  v10.receiver = self;
  v10.super_class = (Class)HMDHomeKeyDataRecorder;
  v7 = -[HMDHomeKeyDataRecorder init](&v10, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_workQueue, v6);

  return v8;
}

- (void)recordInitialWalletKeys:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDHomeKeyDataRecorder workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__HMDHomeKeyDataRecorder_recordInitialWalletKeys___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)recordAddedWalletKey:(id)a3 passJSONDict:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMDHomeKeyDataRecorder workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__HMDHomeKeyDataRecorder_recordAddedWalletKey_passJSONDict___block_invoke;
  block[3] = &unk_1E89C20C8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)recordAddedWalletKey:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDHomeKeyDataRecorder workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__HMDHomeKeyDataRecorder_recordAddedWalletKey___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)recordUpdatedWalletKey:(id)a3 passJSONDict:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMDHomeKeyDataRecorder workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__HMDHomeKeyDataRecorder_recordUpdatedWalletKey_passJSONDict___block_invoke;
  block[3] = &unk_1E89C20C8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)recordUpdatedWalletKey:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDHomeKeyDataRecorder workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__HMDHomeKeyDataRecorder_recordUpdatedWalletKey___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)recordRemovedWalletKeyWithSerialNumber:(id)a3 noWalletKeysRemaining:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  -[HMDHomeKeyDataRecorder workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__HMDHomeKeyDataRecorder_recordRemovedWalletKeyWithSerialNumber_noWalletKeysRemaining___block_invoke;
  block[3] = &unk_1E89C0898;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(v7, block);

}

- (NSArray)records
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayForKey:", CFSTR("HMDHomeKeyDataRecorderRecordsKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return (NSArray *)v5;
}

- (NSMutableArray)mutableRecords
{
  void *v2;
  void *v3;

  -[HMDHomeKeyDataRecorder records](self, "records");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  return (NSMutableArray *)v3;
}

- (void)addRecord:(id)a3 clearPrevious:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  -[HMDHomeKeyDataRecorder mutableRecords](self, "mutableRecords");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  objc_msgSend(v6, "addObject:", v10);
  if (objc_msgSend(v6, "count") - 10 >= 1)
    objc_msgSend(v6, "removeObjectsInRange:", 0);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("HMDHomeKeyDataRecorderRecordsKey"));

}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __87__HMDHomeKeyDataRecorder_recordRemovedWalletKeyWithSerialNumber_noWalletKeysRemaining___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ removedWalletKeyWithSerialNumber: %@"), v5, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addRecord:clearPrevious:", v4, *(unsigned __int8 *)(a1 + 48));

}

void __49__HMDHomeKeyDataRecorder_recordUpdatedWalletKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ updatedWalletKey: %@"), v5, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addRecord:clearPrevious:", v4, 0);

}

void __62__HMDHomeKeyDataRecorder_recordUpdatedWalletKey_passJSONDict___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)a1[4];
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ updatedWalletKey: %@, passJSONDict: %@"), v5, a1[5], a1[6]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addRecord:clearPrevious:", v4, 0);

}

void __47__HMDHomeKeyDataRecorder_recordAddedWalletKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ addedWalletKey: %@"), v5, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addRecord:clearPrevious:", v4, 0);

}

void __60__HMDHomeKeyDataRecorder_recordAddedWalletKey_passJSONDict___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)a1[4];
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ addedWalletKey: %@, passJSONDict: %@"), v5, a1[5], a1[6]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addRecord:clearPrevious:", v4, 0);

}

void __50__HMDHomeKeyDataRecorder_recordInitialWalletKeys___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ initialWalletKeysOnDeviceSetup: %@"), v5, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addRecord:clearPrevious:", v4, 0);

}

+ (id)sharedRecorder
{
  if (sharedRecorder_onceToken != -1)
    dispatch_once(&sharedRecorder_onceToken, &__block_literal_global_109465);
  return (id)sharedRecorder_sharedRecorder;
}

void __40__HMDHomeKeyDataRecorder_sharedRecorder__block_invoke()
{
  HMDHomeKeyDataRecorder *v0;
  void *v1;

  if (isInternalBuild())
  {
    v0 = objc_alloc_init(HMDHomeKeyDataRecorder);
    v1 = (void *)sharedRecorder_sharedRecorder;
    sharedRecorder_sharedRecorder = (uint64_t)v0;

  }
}

@end
