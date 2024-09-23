@implementation HMDSnapshotCATransactionHandler

- (HMDSnapshotCATransactionHandler)init
{
  HMDSnapshotCATransactionHandler *v2;
  id v3;
  const char *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *clientQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMDSnapshotCATransactionHandler;
  v2 = -[HMDSnapshotCATransactionHandler init](&v9, sel_init);
  if (v2)
  {
    HMDispatchQueueNameString();
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = (const char *)objc_msgSend(v3, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create(v4, v5);
    clientQueue = v2->_clientQueue;
    v2->_clientQueue = (OS_dispatch_queue *)v6;

    -[HMDSnapshotCATransactionHandler _createSnapshotContext](v2, "_createSnapshotContext");
    __createBackboardWatcher(v2);
  }
  return v2;
}

- (void)_createSnapshotContext
{
  void *v3;
  void *v4;

  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD2720], "remoteContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSnapshotCATransactionHandler setSnapshotContext:](self, "setSnapshotContext:", v4);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  objc_autoreleasePoolPop(v3);
}

- (void)_backboardServicesRelaunched
{
  void *v3;
  HMDSnapshotCATransactionHandler *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Backboard services is relaunched", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDSnapshotCATransactionHandler _createSnapshotContext](v4, "_createSnapshotContext");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("HMDBackboardServicesRelaunchNotification"), 0);

  __createBackboardWatcher(v4);
}

- (id)createSlotWithFilePath:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__42836;
  v19 = __Block_byref_object_dispose__42837;
  v20 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28628]), "initWithName:", CFSTR("com.apple.homed.snapshot-catransaction-createslot."));
  -[HMDSnapshotCATransactionHandler clientQueue](self, "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__HMDSnapshotCATransactionHandler_createSlotWithFilePath___block_invoke;
  v11[3] = &unk_1E89AA468;
  v11[4] = self;
  v12 = v4;
  v13 = v5;
  v14 = &v15;
  v7 = v5;
  v8 = v4;
  dispatch_sync(v6, v11);

  v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (void)fillSlotWithIdentifier:(id)a3 filePath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  CGImage *v10;
  CGImage *v11;
  void *v12;
  HMDSnapshotCATransactionHandler *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  id v22;
  __int16 v23;
  CGImage *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = objc_msgSend(v6, "unsignedIntegerValue");
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v10 = -[HMDSnapshotCATransactionHandler createSnapshotCGImageRef:](self, "createSnapshotCGImageRef:", v7);
  if (v10)
  {
    v11 = v10;
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138544130;
      v18 = v15;
      v19 = 1024;
      v20 = v9;
      v21 = 2112;
      v22 = v7;
      v23 = 2112;
      v24 = v11;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Filling snapshot slot %u for file %@ with image %@", (uint8_t *)&v17, 0x26u);

    }
    objc_autoreleasePoolPop(v12);
    -[HMDSnapshotCATransactionHandler snapshotContext](v13, "snapshotContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forSlot:", v11, v9);

  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  objc_autoreleasePoolPop(v8);

}

- (void)clearSlotWithIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  HMDSnapshotCATransactionHandler *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v5 = objc_msgSend(v4, "unsignedIntegerValue");
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v9;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Clearing slot %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDSnapshotCATransactionHandler snapshotContext](v7, "snapshotContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forSlot:", 0, v5);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (id)_createSlotWithFilePath:(id)a3 snapshotCATransaction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  HMDSnapshotCATransactionHandler *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  -[HMDSnapshotCATransactionHandler snapshotContext](self, "snapshotContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "createSlot");

  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543874;
    v17 = v13;
    v18 = 1024;
    v19 = v9;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Created snapshot slot %u for file %@", (uint8_t *)&v16, 0x1Cu);

  }
  objc_autoreleasePoolPop(v10);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)deleteSlotWithIdentifier:(id)a3 filePath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28628]), "initWithName:", CFSTR("com.apple.homed.snapshot-catransaction-deleteslot."));
  -[HMDSnapshotCATransactionHandler clientQueue](self, "clientQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__HMDSnapshotCATransactionHandler_deleteSlotWithIdentifier_filePath___block_invoke;
  v13[3] = &unk_1E89C07B8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = v8;
  v10 = v8;
  v11 = v7;
  v12 = v6;
  dispatch_async(v9, v13);

}

- (void)_deleteSlotWithIdentifier:(id)a3 filePath:(id)a4 snapshotCATransaction:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  HMDSnapshotCATransactionHandler *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = objc_msgSend(v8, "unsignedIntegerValue");
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  -[HMDSnapshotCATransactionHandler snapshotContext](self, "snapshotContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "deleteSlot:", v12);

  v14 = (void *)MEMORY[0x1D17BA0A0]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543874;
    v19 = v17;
    v20 = 1024;
    v21 = v12;
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Released the snapshot slot %u for file %@", (uint8_t *)&v18, 0x1Cu);

  }
  objc_autoreleasePoolPop(v14);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  objc_autoreleasePoolPop(v11);

}

- (CGImage)createSnapshotCGImageRef:(id)a3
{
  id v4;
  const __CFURL *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFDictionary *v9;
  CGImageSource *v10;
  CGImageRef ImageAtIndex;
  CGImage *v12;
  void *v13;
  HMDSnapshotCATransactionHandler *v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  void *values[2];
  void *keys[3];

  keys[2] = *(void **)MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
  v5 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x1E0C9AE40];
  v7 = (void *)*MEMORY[0x1E0CBD238];
  keys[0] = *(void **)MEMORY[0x1E0CBD240];
  keys[1] = v7;
  v8 = (void *)*MEMORY[0x1E0C9AE50];
  values[0] = v6;
  values[1] = v8;
  v9 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v10 = CGImageSourceCreateWithURL(v5, v9);
  CFRelease(v9);
  if (!v10)
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v16;
      v21 = 2112;
      v22 = v4;
      v17 = "%{public}@Image source is NULL, %@.";
LABEL_8:
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v19, 0x16u);

    }
LABEL_9:

    objc_autoreleasePoolPop(v13);
    v12 = 0;
    goto LABEL_10;
  }
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v10, 0, 0);
  CFRelease(v10);
  if (!ImageAtIndex)
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v16;
      v21 = 2112;
      v22 = v4;
      v17 = "%{public}@Image not created from image source, %@.";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v12 = (CGImage *)CFAutorelease(ImageAtIndex);
LABEL_10:

  return v12;
}

- (CAContext)snapshotContext
{
  return self->_snapshotContext;
}

- (void)setSnapshotContext:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotContext, a3);
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (BSPortDeathWatcher)backboardServicesWatcher
{
  return self->_backboardServicesWatcher;
}

- (void)setBackboardServicesWatcher:(id)a3
{
  objc_storeStrong((id *)&self->_backboardServicesWatcher, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backboardServicesWatcher, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_snapshotContext, 0);
}

uint64_t __69__HMDSnapshotCATransactionHandler_deleteSlotWithIdentifier_filePath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deleteSlotWithIdentifier:filePath:snapshotCATransaction:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __58__HMDSnapshotCATransactionHandler_createSlotWithFilePath___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_createSlotWithFilePath:snapshotCATransaction:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)sharedHandler
{
  if (sharedHandler_onceToken != -1)
    dispatch_once(&sharedHandler_onceToken, &__block_literal_global_42857);
  return (id)handler;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_42852 != -1)
    dispatch_once(&logCategory__hmf_once_t2_42852, &__block_literal_global_2_42853);
  return (id)logCategory__hmf_once_v3_42854;
}

void __46__HMDSnapshotCATransactionHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v3_42854;
  logCategory__hmf_once_v3_42854 = v0;

}

void __48__HMDSnapshotCATransactionHandler_sharedHandler__block_invoke()
{
  HMDSnapshotCATransactionHandler *v0;
  void *v1;

  v0 = objc_alloc_init(HMDSnapshotCATransactionHandler);
  v1 = (void *)handler;
  handler = (uint64_t)v0;

}

@end
