@implementation NTKPigmentPersistentStorageController

- (NTKPigmentPersistentStorageController)init
{
  void *v3;
  NTKPigmentPersistentStorageController *v4;

  objc_msgSend((id)objc_opt_class(), "perDeviceFolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NTKPigmentPersistentStorageController initWithRootDirectory:](self, "initWithRootDirectory:", v3);

  return v4;
}

- (NTKPigmentPersistentStorageController)initWithRootDirectory:(id)a3
{
  id v5;
  NTKPigmentPersistentStorageController *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *privateQueue;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NTKPigmentPersistentStorageController;
  v6 = -[NTKPigmentPersistentStorageController init](&v11, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.NanoTimeKit.NTKPigmentPersistentStorageController", v7);
    privateQueue = v6->_privateQueue;
    v6->_privateQueue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_rootDirectory, a3);
  }

  return v6;
}

+ (id)perDeviceFolder
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "faceColorRootFolder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("PerDeviceStores"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)faceColorRootFolder
{
  return CFSTR("/var/mobile/Library/NanoTimeKit/FaceColorStores/");
}

- (id)facePigmentSetForDomain:(id)a3 sharedCollections:(id)a4
{
  id v6;
  id v7;
  NSObject *privateQueue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__48;
  v21 = __Block_byref_object_dispose__48;
  v22 = 0;
  privateQueue = self->_privateQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __83__NTKPigmentPersistentStorageController_facePigmentSetForDomain_sharedCollections___block_invoke;
  v13[3] = &unk_1E6BD0988;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(privateQueue, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __83__NTKPigmentPersistentStorageController_facePigmentSetForDomain_sharedCollections___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nrDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForProperty:", *MEMORY[0x1E0D51730]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (uint64_t *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "colorDomainFilePath:deviceUUID:", *(_QWORD *)(a1 + 40), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "fileExistsAtPath:", v7))
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v7, 1, &v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v14;
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "readPigmentSetFromData:sharedCollections:", v8, *(_QWORD *)(a1 + 48));
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v12 = *(NSObject **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;
    }
    else
    {
      _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __83__NTKPigmentPersistentStorageController_facePigmentSetForDomain_sharedCollections___block_invoke_cold_1(v6);
    }

  }
  else
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v13 = *v6;
      *(_DWORD *)buf = 138543362;
      v16 = v13;
      _os_log_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_INFO, "#persistence No stored color data for domain %{public}@", buf, 0xCu);
    }
  }

}

- (id)sharedCollections
{
  NSObject *privateQueue;
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
  v9 = __Block_byref_object_copy__48;
  v10 = __Block_byref_object_dispose__48;
  v11 = 0;
  privateQueue = self->_privateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__NTKPigmentPersistentStorageController_sharedCollections__block_invoke;
  v5[3] = &unk_1E6BD1498;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(privateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __58__NTKPigmentPersistentStorageController_sharedCollections__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_sharedCollections");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_sharedCollections
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v13;

  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nrDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForProperty:", *MEMORY[0x1E0D51730]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKPigmentPersistentStorageController colorDomainFilePath:deviceUUID:](self, "colorDomainFilePath:deviceUUID:", CFSTR("sharedCollections"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "fileExistsAtPath:", v7))
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[NTKPigmentPersistentStorageController _sharedCollections].cold.2();
    goto LABEL_9;
  }
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v7, 1, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  if (!v8)
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[NTKPigmentPersistentStorageController _sharedCollections].cold.1();

LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  -[NTKPigmentPersistentStorageController readSharedCollectionsFromData:](self, "readSharedCollectionsFromData:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v10;
}

- (void)persistFacePigmentSetData:(id)a3 domain:(id)a4 deviceUUID:(id)a5
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
  block[2] = __85__NTKPigmentPersistentStorageController_persistFacePigmentSetData_domain_deviceUUID___block_invoke;
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

void __85__NTKPigmentPersistentStorageController_persistFacePigmentSetData_domain_deviceUUID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "createColorSyncFolderIfNeededForDeviceUUID:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "colorDomainFilePath:deviceUUID:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_writeData:toFile:", *(_QWORD *)(a1 + 56), v2);

}

- (void)_writeData:(id)a3 toFile:(id)a4
{
  id v5;
  char v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v10 = 0;
  v6 = objc_msgSend(a3, "writeToFile:options:error:", v5, 268435457, &v10);
  v7 = v10;
  _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v6 & 1) != 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v5;
      _os_log_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_INFO, "#persistence Persisted synced pigment options %{public}@.", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[NTKPigmentPersistentStorageController _writeData:toFile:].cold.1((uint64_t)v5);
  }

}

- (void)persistFacePigmentSet:(id)a3 deviceUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "collectionBySlots");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    objc_msgSend(v6, "domain");
    v10 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject length](v10, "length"))
    {
      -[NTKPigmentPersistentStorageController serializeFacePigmentSet:](self, "serializeFacePigmentSet:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKPigmentPersistentStorageController persistFacePigmentSetData:domain:deviceUUID:](self, "persistFacePigmentSetData:domain:deviceUUID:", v11, v10, v7);

    }
    else
    {
      _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[NTKPigmentPersistentStorageController persistFacePigmentSet:deviceUUID:].cold.2();

    }
  }
  else
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[NTKPigmentPersistentStorageController persistFacePigmentSet:deviceUUID:].cold.1();
  }

}

- (void)persistSharedCollections:(id)a3 deviceUUID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v6 = a4;
  if (a3)
  {
    +[NTKProtoSharedCollections protoBufferFromSharedCollections:](NTKProtoSharedCollections, "protoBufferFromSharedCollections:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKPigmentPersistentStorageController persistSharedCollectionsData:deviceUUID:](self, "persistSharedCollectionsData:deviceUUID:", v8, v6);

  }
  else
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[NTKPigmentPersistentStorageController persistSharedCollections:deviceUUID:].cold.1();

  }
}

- (void)persistSharedCollectionsData:(id)a3 deviceUUID:(id)a4
{
  id v6;
  id v7;
  NSObject *privateQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  privateQueue = self->_privateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__NTKPigmentPersistentStorageController_persistSharedCollectionsData_deviceUUID___block_invoke;
  block[3] = &unk_1E6BCDCB8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(privateQueue, block);

}

void __81__NTKPigmentPersistentStorageController_persistSharedCollectionsData_deviceUUID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "createColorSyncFolderIfNeededForDeviceUUID:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "colorDomainFilePath:deviceUUID:", CFSTR("sharedCollections"), *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_writeData:toFile:", *(_QWORD *)(a1 + 48), v2);

}

- (void)closeTransactionForDeviceUUID:(id)a3
{
  id v4;
  NSObject *privateQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  privateQueue = self->_privateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__NTKPigmentPersistentStorageController_closeTransactionForDeviceUUID___block_invoke;
  block[3] = &unk_1E6BCD778;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(privateQueue, block);

}

void __71__NTKPigmentPersistentStorageController_closeTransactionForDeviceUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  id v5;
  void *v7;
  NSObject *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transactionLockerFileNameForDeviceUUID:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "fileExistsAtPath:", v3))
  {
    v9 = 0;
    v4 = objc_msgSend(v2, "removeItemAtPath:error:", v3, &v9);
    v5 = v9;
    if (!v4 || v5 != 0)
    {
      v7 = v5;
      _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __71__NTKPigmentPersistentStorageController_closeTransactionForDeviceUUID___block_invoke_cold_1();

    }
  }

}

- (void)deleteContent
{
  NSObject *privateQueue;
  _QWORD block[5];

  -[NTKPigmentPersistentStorageController resetCache](self, "resetCache");
  privateQueue = self->_privateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__NTKPigmentPersistentStorageController_deleteContent__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(privateQueue, block);
}

void __54__NTKPigmentPersistentStorageController_deleteContent__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  char v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "#persistence Deleting root directory. %{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "fileExistsAtPath:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16)))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v9 = 0;
    v6 = objc_msgSend(v4, "removeItemAtPath:error:", v5, &v9);
    v7 = v9;
    if ((v6 & 1) == 0)
    {
      _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __54__NTKPigmentPersistentStorageController_deleteContent__block_invoke_cold_1();

    }
  }

}

- (void)startTransactionForDeviceUUID:(id)a3
{
  id v4;
  NSObject *privateQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  privateQueue = self->_privateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__NTKPigmentPersistentStorageController_startTransactionForDeviceUUID___block_invoke;
  block[3] = &unk_1E6BCD778;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(privateQueue, block);

}

void __71__NTKPigmentPersistentStorageController_startTransactionForDeviceUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "createColorSyncFolderIfNeededForDeviceUUID:", *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transactionLockerFileNameForDeviceUUID:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "fileExistsAtPath:", v3) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "transactionLockerFileNameForDeviceUUID:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0CB2AD8];
    v7[0] = *MEMORY[0x1E0CB2AE0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "createFileAtPath:contents:attributes:", v4, 0, v5);

  }
}

- (id)device
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)transactionLockerFileNameForDeviceUUID:(id)a3
{
  void *v3;
  void *v4;

  -[NTKPigmentPersistentStorageController colorSyncFolderPathWithDeviceUUID:](self, "colorSyncFolderPathWithDeviceUUID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("__TRANSACTION_IN_PROGRESS__"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)createColorSyncFolderIfNeededForDeviceUUID:(id)a3
{
  void *v4;
  BOOL v5;
  NSObject *v6;

  -[NTKPigmentPersistentStorageController colorSyncFolderPathWithDeviceUUID:](self, "colorSyncFolderPathWithDeviceUUID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NTKPigmentPersistentStorageController createFolderIfNeeded:](self, "createFolderIfNeeded:", v4);
  if (!v5)
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[NTKPigmentPersistentStorageController createColorSyncFolderIfNeededForDeviceUUID:].cold.1();

  }
  return v5;
}

+ (id)syncStoresFolder
{
  return CFSTR("/var/mobile/Library/NanoTimeKit/Sync/FaceColorStores/");
}

+ (id)globalStoresFolder
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "faceColorRootFolder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("GlobalStores"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)colorSyncFolderPathWithDeviceUUID:(id)a3
{
  NSString *v4;
  void *v5;
  uint64_t v6;

  v4 = self->_rootDirectory;
  if (a3)
  {
    objc_msgSend(a3, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringByAppendingPathComponent:](v4, "stringByAppendingPathComponent:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (NSString *)v6;
  }
  return v4;
}

- (id)colorDomainFilePath:(id)a3 deviceUUID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[NTKPigmentPersistentStorageController colorSyncFolderPathWithDeviceUUID:](self, "colorSyncFolderPathWithDeviceUUID:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.protobuffer"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)createFolderIfNeeded:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;
  int v7;
  id v8;
  NSObject *v9;
  BOOL v10;
  id v12;
  char v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  if (objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v3, &v13))
    v5 = v13 == 0;
  else
    v5 = 1;
  if (v5)
  {
    v14 = *MEMORY[0x1E0CB2AD8];
    v15[0] = *MEMORY[0x1E0CB2AE0];
    v10 = 1;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v7 = objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, v6, &v12);
    v8 = v12;

    if (!v7 || v8)
    {
      _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[NTKPigmentPersistentStorageController createFolderIfNeeded:].cold.1((uint64_t)v3);

      v10 = 0;
    }
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (id)readPigmentSetFromData:(id)a3 sharedCollections:(id)a4
{
  id v5;
  id v6;
  NTKProtoFacePigmentSet *v7;
  void *v8;
  NSObject *v9;

  v5 = a3;
  v6 = a4;
  v7 = -[NTKProtoFacePigmentSet initWithData:]([NTKProtoFacePigmentSet alloc], "initWithData:", v5);
  if (v7)
  {
    +[NTKFacePigmentSet facePigmentSetFromProtoBuffer:sharedCollections:](NTKFacePigmentSet, "facePigmentSetFromProtoBuffer:sharedCollections:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[NTKPigmentPersistentStorageController readPigmentSetFromData:sharedCollections:].cold.1();

    v8 = 0;
  }

  return v8;
}

- (id)readSharedCollectionsFromData:(id)a3
{
  id v3;
  NTKProtoSharedCollections *v4;
  void *v5;

  v3 = a3;
  v4 = -[NTKProtoSharedCollections initWithData:]([NTKProtoSharedCollections alloc], "initWithData:", v3);

  -[NTKProtoSharedCollections sharedCollectionsDictionary](v4, "sharedCollectionsDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)serializeFacePigmentSet:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;

  v3 = a3;
  objc_msgSend(v3, "protoBuffer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[NTKPigmentPersistentStorageController serializeFacePigmentSet:].cold.1();

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootDirectory, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
}

void __83__NTKPigmentPersistentStorageController_facePigmentSetForDomain_sharedCollections___block_invoke_cold_1(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, v1, v2, "#persistence Failed to read color sync data for domain %{public}@ - %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)_sharedCollections
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_5(&dword_1B72A3000, v0, v1, "#persistence No synced color data for shared collections", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_1();
}

- (void)_writeData:(uint64_t)a1 toFile:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, v1, v2, "#persistence Failed to write pigment options to file %{public}@ - %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)persistFacePigmentSet:deviceUUID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_5(&dword_1B72A3000, v0, v1, "#persistence Synced empty options. Ignoring it.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_1();
}

- (void)persistFacePigmentSet:deviceUUID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_5(&dword_1B72A3000, v0, v1, "#persistence No domain for synced pigment options. Ignoring it.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_1();
}

- (void)persistSharedCollections:deviceUUID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_5(&dword_1B72A3000, v0, v1, "#persistence Received empty shared collection to persist.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_1();
}

void __71__NTKPigmentPersistentStorageController_closeTransactionForDeviceUUID___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "#persistence Failed deleting file while closing transaction. %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __54__NTKPigmentPersistentStorageController_deleteContent__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "#persistence Failed deleting root directory. %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)createColorSyncFolderIfNeededForDeviceUUID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "#persistence Failed to create device specific folder at path %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)createFolderIfNeeded:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, v1, v2, "#persistence Failed to create directory at path %{public}@ - Error %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)readPigmentSetFromData:sharedCollections:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "#persistence NTKProtoFacePigmentSet decode failed. %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)serializeFacePigmentSet:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "#persistence NTKFacePigmentSet encode failed. %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
