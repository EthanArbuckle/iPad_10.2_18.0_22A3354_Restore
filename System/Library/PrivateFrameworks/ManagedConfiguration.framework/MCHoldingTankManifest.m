@implementation MCHoldingTankManifest

- (MCHoldingTankManifest)init
{
  MCHoldingTankManifest *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *syncQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCHoldingTankManifest;
  v2 = -[MCHoldingTankManifest init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.managedconfiguration.MCHoldingTankManifest._syncQueue", 0);
    syncQueue = v2->_syncQueue;
    v2->_syncQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_suspend((dispatch_object_t)self->_syncQueue);
  v3.receiver = self;
  v3.super_class = (Class)MCHoldingTankManifest;
  -[MCHoldingTankManifest dealloc](&v3, sel_dealloc);
}

+ (id)sharedManifest
{
  if (sharedManifest_once_0 != -1)
    dispatch_once(&sharedManifest_once_0, &__block_literal_global_24);
  return (id)sharedManifest_obj_0;
}

void __39__MCHoldingTankManifest_sharedManifest__block_invoke()
{
  MCHoldingTankManifest *v0;
  void *v1;

  v0 = objc_alloc_init(MCHoldingTankManifest);
  v1 = (void *)sharedManifest_obj_0;
  sharedManifest_obj_0 = (uint64_t)v0;

}

- (id)_profileDataFileNameForProfileIdentifier:(id)a3
{
  return (id)objc_msgSend(a3, "MCHashedFilenameWithExtension:", CFSTR("pdata"));
}

- (id)_pathToHoldingTankDirectoryForDevice:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  MCSystemProfileStorageDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCProfile stringForDeviceType:](MCProfile, "stringForDeviceType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_pathToHoldingTankManifestForDevice:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[MCHoldingTankManifest _pathToHoldingTankDirectoryForDevice:](self, "_pathToHoldingTankDirectoryForDevice:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MCHoldingTankManifestName();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pathToHoldingTankProfileDataForIdentifier:(id)a3 targetDevice:(unint64_t)a4 createDirectory:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a5;
  v8 = a3;
  -[MCHoldingTankManifest _pathToHoldingTankDirectoryForDevice:](self, "_pathToHoldingTankDirectoryForDevice:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[MCHoldingTankManifest _createDirectory:withIntermediateDirectories:](self, "_createDirectory:withIntermediateDirectories:", v9, 1);
  -[MCHoldingTankManifest _profileDataFileNameForProfileIdentifier:](self, "_profileDataFileNameForProfileIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_createDirectory:(id)a3 withIntermediateDirectories:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v5, 0) & 1) == 0)
  {
    v9 = 0;
    objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, v4, 0, &v9);
    v7 = v9;
    if (v7)
    {
      v8 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v11 = v5;
        v12 = 2114;
        v13 = v7;
        _os_log_impl(&dword_19ECC4000, v8, OS_LOG_TYPE_ERROR, "Failed to create directory: %{public}@, error: %{public}@", buf, 0x16u);
      }
    }

  }
}

- (id)_manifestForDevice:(unint64_t)a3 createIfNil:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *universalManifest;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v4 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  +[MCProfile stringForDeviceType:](MCProfile, "stringForDeviceType:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCHoldingTankManifest _pathToHoldingTankManifestForDevice:](self, "_pathToHoldingTankManifestForDevice:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_universalManifest)
  {
    v9 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
    universalManifest = self->_universalManifest;
    self->_universalManifest = v9;

  }
  v23 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v8, 0, &v23);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v23;
  if (v12)
  {
    if (!v4)
    {
      v13 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v25 = v8;
        v26 = 2114;
        v27 = v12;
        _os_log_impl(&dword_19ECC4000, v13, OS_LOG_TYPE_DEFAULT, "Failed to pull manifest data from path (this might be normal): %{public}@, error: %{public}@", buf, 0x16u);
      }
    }
  }

  v22 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "MCSafePropertyListWithData:options:format:error:", v11, 1, 0, &v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v22;
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_universalManifest, "setObject:forKeyedSubscript:", v14, v7);

  if (v15)
  {
    v16 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v25 = v15;
      _os_log_impl(&dword_19ECC4000, v16, OS_LOG_TYPE_ERROR, "Failed to serialize manifest data with error: %{public}@", buf, 0xCu);
    }
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_universalManifest, "objectForKeyedSubscript:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17 && v4)
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_universalManifest, "setObject:forKeyedSubscript:", v18, v7);

    -[NSMutableDictionary objectForKeyedSubscript:](self->_universalManifest, "objectForKeyedSubscript:", v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "MCWriteToBinaryFile:", v8);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_universalManifest, "objectForKeyedSubscript:", v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)uninstalledProfileIdentifiersForDevice:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[MCHoldingTankManifest _manifestForDevice:createIfNil:](self, "_manifestForDevice:createIfNil:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

- (id)uninstalledProfileWithIdentifier:(id)a3 targetDevice:(unint64_t)a4
{
  void *v4;
  void *v5;

  -[MCHoldingTankManifest uninstalledProfileDataWithIdentifier:targetDevice:](self, "uninstalledProfileDataWithIdentifier:targetDevice:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[MCProfile profileWithData:outError:](MCProfile, "profileWithData:outError:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)uninstalledProfileDataWithIdentifier:(id)a3 targetDevice:(unint64_t)a4
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[MCHoldingTankManifest pathToHoldingTankProfileDataForIdentifier:targetDevice:createDirectory:](self, "pathToHoldingTankProfileDataForIdentifier:targetDevice:createDirectory:", a3, a4, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  if (v6)
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v4, 0, &v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;
    if (v8)
    {
      v9 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v13 = v4;
        v14 = 2114;
        v15 = v8;
        _os_log_impl(&dword_19ECC4000, v9, OS_LOG_TYPE_ERROR, "Failed to read profile data from path: %{public}@, error: %{public}@", buf, 0x16u);
      }
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)addPurgatoryProfileData:(id)a3 identifier:(id)a4 targetDevice:(unint64_t)a5 outError:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  char v13;
  id v14;
  BOOL v15;
  NSObject *v16;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a3;
  -[MCHoldingTankManifest pathToHoldingTankProfileDataForIdentifier:targetDevice:createDirectory:](self, "pathToHoldingTankProfileDataForIdentifier:targetDevice:createDirectory:", v10, a5, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v13 = objc_msgSend(v11, "writeToFile:options:error:", v12, 0x20000000, &v18);

  v14 = v18;
  if ((v13 & 1) != 0)
  {
    v15 = -[MCHoldingTankManifest _adjustManifestForDevice:withIdentifier:addingIdentifier:outError:](self, "_adjustManifestForDevice:withIdentifier:addingIdentifier:outError:", a5, v10, 1, a6);
  }
  else
  {
    v16 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v20 = v10;
      v21 = 2114;
      v22 = v12;
      v23 = 2114;
      v24 = v14;
      _os_log_impl(&dword_19ECC4000, v16, OS_LOG_TYPE_ERROR, "Failed to add profile data with identifier: %{public}@ to path: %{public}@ with error: %{public}@", buf, 0x20u);
    }
    MCCheckSystemGroupContainerFileReadability(0, 0);
    v15 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v14);
  }

  return v15;
}

- (void)removeProfileDataWithIdentifier:(id)a3 fromHoldingTankForDevice:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MCHoldingTankManifest pathToHoldingTankProfileDataForIdentifier:targetDevice:createDirectory:](self, "pathToHoldingTankProfileDataForIdentifier:targetDevice:createDirectory:", v6, a4, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v8, "removeItemAtPath:error:", v7, &v11);
  v9 = v11;

  if (v9)
  {
    v10 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v13 = v6;
      v14 = 2114;
      v15 = v7;
      v16 = 2114;
      v17 = v9;
      _os_log_impl(&dword_19ECC4000, v10, OS_LOG_TYPE_ERROR, "Failed to remove profile data with identifier: %{public}@ from path: %{public}@ with error: %{public}@", buf, 0x20u);
    }
  }
  -[MCHoldingTankManifest _adjustManifestForDevice:withIdentifier:addingIdentifier:outError:](self, "_adjustManifestForDevice:withIdentifier:addingIdentifier:outError:", a4, v6, 0, 0);

}

- (BOOL)_adjustManifestForDevice:(unint64_t)a3 withIdentifier:(id)a4 addingIdentifier:(BOOL)a5 outError:(id *)a6
{
  id v10;
  NSObject *syncQueue;
  id v12;
  BOOL v13;
  _QWORD block[5];
  id v16;
  uint64_t *v17;
  unint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v10 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__6;
  v24 = __Block_byref_object_dispose__6;
  v25 = 0;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__MCHoldingTankManifest__adjustManifestForDevice_withIdentifier_addingIdentifier_outError___block_invoke;
  block[3] = &unk_1E41E36E8;
  block[4] = self;
  v18 = a3;
  v19 = a5;
  v12 = v10;
  v16 = v12;
  v17 = &v20;
  dispatch_sync(syncQueue, block);
  if (a6)
    *a6 = objc_retainAutorelease((id)v21[5]);
  v13 = v21[5] == 0;

  _Block_object_dispose(&v20, 8);
  return v13;
}

void __91__MCHoldingTankManifest__adjustManifestForDevice_withIdentifier_addingIdentifier_outError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  id obj;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_manifestForDevice:createIfNil:", *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    if (*(_BYTE *)(a1 + 64))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 86400.0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 40));

    }
    objc_msgSend(*(id *)(a1 + 32), "_pathToHoldingTankManifestForDevice:", *(_QWORD *)(a1 + 56));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v7 + 40);
    objc_msgSend(v3, "writeToURL:error:", v6, &obj);
    objc_storeStrong((id *)(v7 + 40), obj);

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      v8 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        *(_DWORD *)buf = 138543618;
        v12 = v5;
        v13 = 2114;
        v14 = v9;
        _os_log_impl(&dword_19ECC4000, v8, OS_LOG_TYPE_ERROR, "Failed to write manifest to path: %{public}@ with error: %{public}@", buf, 0x16u);
      }
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_universalManifest, 0);
}

@end
