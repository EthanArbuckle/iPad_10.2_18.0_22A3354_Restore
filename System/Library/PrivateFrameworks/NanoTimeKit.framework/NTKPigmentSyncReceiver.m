@implementation NTKPigmentSyncReceiver

- (NTKPigmentSyncReceiver)init
{
  NTKPigmentSyncReceiver *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *privateQueue;
  NTKPigmentPersistentStorageController *v6;
  NTKPigmentPersistentStorageController *storageController;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NTKPigmentSyncReceiver;
  v2 = -[NTKPigmentSyncReceiver init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.NanoTimeKit.NTKPigmentSyncReceiver", v3);
    privateQueue = v2->_privateQueue;
    v2->_privateQueue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc_init(NTKPigmentPersistentStorageController);
    storageController = v2->_storageController;
    v2->_storageController = v6;

  }
  return v2;
}

- (void)processSyncData:(id)a3 domain:(id)a4 deviceUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *privateQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  privateQueue = self->_privateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__NTKPigmentSyncReceiver_processSyncData_domain_deviceUUID___block_invoke;
  block[3] = &unk_1E6BD17F0;
  block[4] = self;
  v16 = v10;
  v17 = v9;
  v18 = v8;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  dispatch_sync(privateQueue, block);

}

void __60__NTKPigmentSyncReceiver_processSyncData_domain_deviceUUID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 8))
  {
    *(_BYTE *)(v2 + 8) = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "startTransactionForDeviceUUID:", *(_QWORD *)(a1 + 40));
  }
  v3 = *(_QWORD *)(a1 + 48);
  _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 48);
      v10 = 138543362;
      v11 = v6;
      _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_INFO, "#sync received color sync data for domain: %{public}@", (uint8_t *)&v10, 0xCu);
    }

    v7 = objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("sharedCollections"));
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v9 = *(_QWORD *)(a1 + 56);
    if (v7)
      objc_msgSend(v8, "persistSharedCollectionsData:deviceUUID:", v9, *(_QWORD *)(a1 + 40));
    else
      objc_msgSend(v8, "persistFacePigmentSetData:domain:deviceUUID:", v9, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __60__NTKPigmentSyncReceiver_processSyncData_domain_deviceUUID___block_invoke_cold_1(v5);

  }
}

- (void)finishSyncingForDeviceUUID:(id)a3 success:(BOOL)a4
{
  id v5;
  NSObject *privateQueue;
  id v7;
  _QWORD block[5];
  id v9;

  v5 = a3;
  privateQueue = self->_privateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__NTKPigmentSyncReceiver_finishSyncingForDeviceUUID_success___block_invoke;
  block[3] = &unk_1E6BCD778;
  block[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_sync(privateQueue, block);

}

uint64_t __61__NTKPigmentSyncReceiver_finishSyncingForDeviceUUID_success___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 8))
  {
    v2 = result;
    objc_msgSend(*(id *)(v1 + 24), "closeTransactionForDeviceUUID:", *(_QWORD *)(result + 40));
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_INFO, "#sync posting darwin notification color sync completed", v4, 2u);
    }

    result = +[NTKDarwinNotificationCenter postNotification:](NTKDarwinNotificationCenter, "postNotification:", CFSTR("NTKColorSyncDataUpdatedNotificationName"));
    v1 = *(_QWORD *)(v2 + 32);
  }
  *(_BYTE *)(v1 + 8) = 0;
  return result;
}

- (OS_dispatch_queue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateQueue, a3);
}

- (NTKPigmentPersistentStorageController)storageController
{
  return self->_storageController;
}

- (void)setStorageController:(id)a3
{
  objc_storeStrong((id *)&self->_storageController, a3);
}

- (BOOL)receivedUpdates
{
  return self->_receivedUpdates;
}

- (void)setReceivedUpdates:(BOOL)a3
{
  self->_receivedUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageController, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
}

void __60__NTKPigmentSyncReceiver_processSyncData_domain_deviceUUID___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "#sync received color sync data with no domain. Ignoring it.", v1, 2u);
}

@end
