@implementation CAMTransientDataSource

- (CAMTransientDataSource)init
{
  CAMTransientDataSource *v2;
  uint64_t v3;
  NSHashTable *observers;
  NSMutableArray *v5;
  NSMutableArray *assetUUIDs;
  NSMutableDictionary *v7;
  NSMutableDictionary *assetsByUUID;
  NSMutableDictionary *v9;
  NSMutableDictionary *representativeAssetsByBurstIdentifier;
  NSMutableDictionary *v11;
  NSMutableDictionary *enqueuedBurstAssetUUIDByBurstIdentifier;
  NSMutableDictionary *v13;
  NSMutableDictionary *enqueuedBurstConvertiblesByAssetUUID;
  CAMTransientDataSource *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CAMTransientDataSource;
  v2 = -[CAMTransientDataSource init](&v17, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->__observers;
    v2->__observers = (NSHashTable *)v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    assetUUIDs = v2->__assetUUIDs;
    v2->__assetUUIDs = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    assetsByUUID = v2->__assetsByUUID;
    v2->__assetsByUUID = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    representativeAssetsByBurstIdentifier = v2->__representativeAssetsByBurstIdentifier;
    v2->__representativeAssetsByBurstIdentifier = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    enqueuedBurstAssetUUIDByBurstIdentifier = v2->__enqueuedBurstAssetUUIDByBurstIdentifier;
    v2->__enqueuedBurstAssetUUIDByBurstIdentifier = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    enqueuedBurstConvertiblesByAssetUUID = v2->__enqueuedBurstConvertiblesByAssetUUID;
    v2->__enqueuedBurstConvertiblesByAssetUUID = v13;

    v15 = v2;
  }

  return v2;
}

- (id)existingRepresentativeAssetForBurstIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CAMTransientDataSource _representativeAssetsByBurstIdentifier](self, "_representativeAssetsByBurstIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSMutableDictionary)_representativeAssetsByBurstIdentifier
{
  return self->__representativeAssetsByBurstIdentifier;
}

- (id)existingAssetForUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CAMTransientDataSource _assetsByUUID](self, "_assetsByUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSMutableDictionary)_assetsByUUID
{
  return self->__assetsByUUID;
}

- (id)insertAssetWithConvertible:(id)a3
{
  id v4;
  CAMTransientAsset *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  __CFString *v13;
  NSObject *v14;
  dispatch_time_t v15;
  id v16;
  _QWORD block[4];
  id v19;
  id v20;
  id location;

  v4 = a3;
  v5 = -[CAMTransientAsset initWithAsset:convertible:]([CAMTransientAsset alloc], "initWithAsset:convertible:", 0, v4);

  -[CAMTransientAsset uuid](v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTransientAsset burstIdentifier](v5, "burstIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTransientDataSource _assetUUIDs](self, "_assetUUIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTransientDataSource _assetsByUUID](self, "_assetsByUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v6);
  objc_msgSend(v9, "setObject:forKey:", v5, v6);
  if (v7)
  {
    -[CAMTransientDataSource _representativeAssetsByBurstIdentifier](self, "_representativeAssetsByBurstIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v5, v7);

  }
  if (-[CAMTransientAsset mediaType](v5, "mediaType") == 1)
  {
    v11 = CFSTR("still image");
  }
  else
  {
    v12 = -[CAMTransientAsset mediaType](v5, "mediaType");
    v11 = CFSTR("unknown");
    if (v12 == 2)
      v11 = CFSTR("video");
  }
  v13 = v11;
  v14 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[CAMTransientDataSource insertAssetWithConvertible:].cold.1();

  -[CAMTransientDataSource _notifyObserversOfDataSourceChange](self, "_notifyObserversOfDataSourceChange");
  objc_initWeak(&location, self);
  v15 = dispatch_time(0, 300000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__CAMTransientDataSource_insertAssetWithConvertible___block_invoke;
  block[3] = &unk_1EA328F00;
  objc_copyWeak(&v20, &location);
  v19 = v6;
  v16 = v6;
  dispatch_after(v15, MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v5;
}

- (NSMutableArray)_assetUUIDs
{
  return self->__assetUUIDs;
}

- (void)_notifyObserversOfDataSourceChange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[CAMTransientDataSource _nestedPerformChanges](self, "_nestedPerformChanges") < 1)
  {
    -[CAMTransientDataSource _observers](self, "_observers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "transientDataSourceDidChange:", self);
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
  else
  {
    -[CAMTransientDataSource _setPendingChangeNotifications:](self, "_setPendingChangeNotifications:", -[CAMTransientDataSource _pendingChangeNotifications](self, "_pendingChangeNotifications") + 1);
  }
}

- (int64_t)_nestedPerformChanges
{
  return self->__nestedPerformChanges;
}

- (NSHashTable)_observers
{
  return self->__observers;
}

- (void)updateAssetWithConvertible:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  CAMTransientAsset *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  __CFString *v17;
  NSObject *v18;
  void *v19;
  double v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;

  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "burstIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTransientDataSource existingAssetForUUID:](self, "existingAssetForUUID:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  -[CAMTransientDataSource existingRepresentativeAssetForBurstIdentifier:](self, "existingRepresentativeAssetForBurstIdentifier:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 | v8)
  {
    if (v8
      && (objc_msgSend((id)v8, "uuid"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "isEqualToString:", v5),
          v10,
          (v11 & 1) == 0))
    {
      objc_msgSend((id)v8, "creationDate");
      v12 = (CAMTransientAsset *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "captureDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMTransientAsset timeIntervalSinceDate:](v12, "timeIntervalSinceDate:", v19);
      if (v20 >= 0.0)
      {
        v22 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          -[CAMTransientDataSource updateAssetWithConvertible:].cold.2((uint64_t)v5, v22, v23, v24, v25, v26, v27, v28);

      }
      else
      {
        -[CAMTransientDataSource removeAssetWithUUID:](self, "removeAssetWithUUID:", v9);
        v21 = -[CAMTransientDataSource insertAssetWithConvertible:](self, "insertAssetWithConvertible:", v4);
      }

    }
    else
    {
      v30 = v9;
      v12 = -[CAMTransientAsset initWithAsset:convertible:]([CAMTransientAsset alloc], "initWithAsset:convertible:", v7, v4);
      -[CAMTransientAsset uuid](v12, "uuid");
      v13 = objc_claimAutoreleasedReturnValue();
      -[CAMTransientDataSource _assetsByUUID](self, "_assetsByUUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)v13;
      objc_msgSend(v14, "setObject:forKey:", v12, v13);
      if (-[CAMTransientAsset mediaType](v12, "mediaType") == 1)
      {
        v15 = CFSTR("still image");
      }
      else
      {
        v16 = -[CAMTransientAsset mediaType](v12, "mediaType");
        v15 = CFSTR("unknown");
        if (v16 == 2)
          v15 = CFSTR("video");
      }
      v17 = v15;
      v18 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[CAMTransientDataSource updateAssetWithConvertible:].cold.1();

      -[CAMTransientDataSource _notifyObserversOfDataSourceChange](self, "_notifyObserversOfDataSourceChange");
      v9 = v30;
    }
  }
  else
  {
    v12 = (CAMTransientAsset *)os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_DEBUG))
      -[CAMTransientDataSource updateAssetWithConvertible:].cold.3(&v12->super);
  }

}

- (void)registerChangeObserver:(id)a3
{
  -[NSHashTable addObject:](self->__observers, "addObject:", a3);
}

- (id)uuids
{
  void *v2;
  void *v3;

  -[CAMTransientDataSource _assetUUIDs](self, "_assetUUIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)transientAssetMapping
{
  void *v2;
  void *v3;

  -[CAMTransientDataSource _assetsByUUID](self, "_assetsByUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)transientBurstMapping
{
  void *v2;
  void *v3;

  -[CAMTransientDataSource _representativeAssetsByBurstIdentifier](self, "_representativeAssetsByBurstIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (void)performChanges:(id)a3
{
  void (**v4)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  if (-[CAMTransientDataSource _nestedPerformChanges](self, "_nestedPerformChanges"))
  {
    -[CAMTransientDataSource _setNestedPerformChanges:](self, "_setNestedPerformChanges:", -[CAMTransientDataSource _nestedPerformChanges](self, "_nestedPerformChanges") + 1);
    v4[2](v4);

    -[CAMTransientDataSource _setNestedPerformChanges:](self, "_setNestedPerformChanges:", -[CAMTransientDataSource _nestedPerformChanges](self, "_nestedPerformChanges") - 1);
  }
  else
  {
    -[CAMTransientDataSource _setPendingChangeNotifications:](self, "_setPendingChangeNotifications:", 0);
    -[CAMTransientDataSource _setNestedPerformChanges:](self, "_setNestedPerformChanges:", -[CAMTransientDataSource _nestedPerformChanges](self, "_nestedPerformChanges") + 1);
    v4[2](v4);

    -[CAMTransientDataSource _setNestedPerformChanges:](self, "_setNestedPerformChanges:", -[CAMTransientDataSource _nestedPerformChanges](self, "_nestedPerformChanges") - 1);
    if (-[CAMTransientDataSource _pendingChangeNotifications](self, "_pendingChangeNotifications") >= 1)
    {
      -[CAMTransientDataSource _notifyObserversOfDataSourceChange](self, "_notifyObserversOfDataSourceChange");
      -[CAMTransientDataSource _setPendingChangeNotifications:](self, "_setPendingChangeNotifications:", 0);
    }
  }
}

- (void)_setPendingChangeNotifications:(int64_t)a3
{
  self->__pendingChangeNotifications = a3;
}

- (void)_setNestedPerformChanges:(int64_t)a3
{
  self->__nestedPerformChanges = a3;
}

- (void)removeAssetWithUUID:(id)a3
{
  if (-[CAMTransientDataSource _removeAssetWithUUID:](self, "_removeAssetWithUUID:", a3))
    -[CAMTransientDataSource _notifyObserversOfDataSourceChange](self, "_notifyObserversOfDataSourceChange");
}

- (BOOL)_removeAssetWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a3;
  -[CAMTransientDataSource existingAssetForUUID:](self, "existingAssetForUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "burstIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMTransientDataSource _assetUUIDs](self, "_assetUUIDs");
    v8 = objc_claimAutoreleasedReturnValue();
    -[CAMTransientDataSource _assetsByUUID](self, "_assetsByUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMTransientDataSource _enqueuedBurstConvertiblesByAssetUUID](self, "_enqueuedBurstConvertiblesByAssetUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject removeObject:](v8, "removeObject:", v4);
    objc_msgSend(v9, "removeObjectForKey:", v4);
    objc_msgSend(v10, "removeObjectForKey:", v4);
    if (v7)
    {
      -[CAMTransientDataSource _representativeAssetsByBurstIdentifier](self, "_representativeAssetsByBurstIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObjectForKey:", v7);
      -[CAMTransientDataSource _enqueuedBurstAssetUUIDByBurstIdentifier](self, "_enqueuedBurstAssetUUIDByBurstIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObjectForKey:", v7);

    }
    v13 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[CAMTransientDataSource _removeAssetWithUUID:].cold.1((uint64_t)v4, v13, v14, v15, v16, v17, v18, v19);

LABEL_10:
    goto LABEL_11;
  }
  -[CAMTransientDataSource _enqueuedBurstConvertiblesByAssetUUID](self, "_enqueuedBurstConvertiblesByAssetUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v7, "removeObjectForKey:", v4);
    v8 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[CAMTransientDataSource _removeAssetWithUUID:].cold.2((uint64_t)v4, v8, v21, v22, v23, v24, v25, v26);
    goto LABEL_10;
  }
LABEL_11:

  return v6 != 0;
}

- (NSMutableDictionary)_enqueuedBurstConvertiblesByAssetUUID
{
  return self->__enqueuedBurstConvertiblesByAssetUUID;
}

- (int64_t)_pendingChangeNotifications
{
  return self->__pendingChangeNotifications;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CAMTransientDataSource _assetUUIDs](self, "_assetUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTransientDataSource _assetsByUUID](self, "_assetsByUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTransientDataSource _representativeAssetsByBurstIdentifier](self, "_representativeAssetsByBurstIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTransientDataSource _enqueuedBurstAssetUUIDByBurstIdentifier](self, "_enqueuedBurstAssetUUIDByBurstIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTransientDataSource _enqueuedBurstConvertiblesByAssetUUID](self, "_enqueuedBurstConvertiblesByAssetUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ assetUUIDs:%@, assetsByUUID:%@, representativeAssetsByBurstIDs:%@, enquedBurstAssetUUIDByBurstID:%@, enqueuedBurstConvertiblesByAssetUUID:%@>"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (BOOL)isEmpty
{
  void *v2;
  BOOL v3;

  -[CAMTransientDataSource _assetUUIDs](self, "_assetUUIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (id)existingAssetUUIDs
{
  void *v2;
  void *v3;

  -[CAMTransientDataSource _assetUUIDs](self, "_assetUUIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

void __53__CAMTransientDataSource_insertAssetWithConvertible___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "removeAssetWithUUID:", *(_QWORD *)(a1 + 32));

}

- (void)removeAllAssets
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[CAMTransientDataSource _assetsByUUID](self, "_assetsByUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v4);
        v7 |= -[CAMTransientDataSource _removeAssetWithUUID:](self, "_removeAssetWithUUID:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
    if ((v7 & 1) != 0)
      -[CAMTransientDataSource _notifyObserversOfDataSourceChange](self, "_notifyObserversOfDataSourceChange");
  }

}

- (NSSet)existingBurstIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v3 = (void *)MEMORY[0x1E0C99E20];
  -[CAMTransientDataSource _representativeAssetsByBurstIdentifier](self, "_representativeAssetsByBurstIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAMTransientDataSource _enqueuedBurstConvertiblesByAssetUUID](self, "_enqueuedBurstConvertiblesByAssetUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__CAMTransientDataSource_existingBurstIdentifiers__block_invoke;
  v10[3] = &unk_1EA330270;
  v8 = v6;
  v11 = v8;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v10);

  return (NSSet *)v8;
}

void __50__CAMTransientDataSource_existingBurstIdentifiers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v6, "burstIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

- (void)removeRepresentativeAssetForBurstIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *, _BYTE *);
  void *v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;

  v4 = a3;
  -[CAMTransientDataSource existingRepresentativeAssetForBurstIdentifier:](self, "existingRepresentativeAssetForBurstIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMTransientDataSource _removeAssetWithUUID:](self, "_removeAssetWithUUID:", v7);
  }
  else
  {
    -[CAMTransientDataSource _enqueuedBurstConvertiblesByAssetUUID](self, "_enqueuedBurstConvertiblesByAssetUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v23[0] = &v22;
    v23[1] = 0x3032000000;
    v23[2] = __Block_byref_object_copy__34;
    v23[3] = __Block_byref_object_dispose__34;
    v24 = 0;
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __70__CAMTransientDataSource_removeRepresentativeAssetForBurstIdentifier___block_invoke;
    v19 = &unk_1EA330298;
    v20 = v4;
    v21 = &v22;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", &v16);
    objc_msgSend(v7, "objectForKey:", *(_QWORD *)(v23[0] + 40), v16, v17, v18, v19);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v7, "removeObjectForKey:", *(_QWORD *)(v23[0] + 40));
      v9 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[CAMTransientDataSource removeRepresentativeAssetForBurstIdentifier:].cold.1((uint64_t)v23, v9, v10, v11, v12, v13, v14, v15);

    }
    _Block_object_dispose(&v22, 8);

  }
  -[CAMTransientDataSource _notifyObserversOfDataSourceChange](self, "_notifyObserversOfDataSourceChange");

}

void __70__CAMTransientDataSource_removeRepresentativeAssetForBurstIdentifier___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(a3, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "burstIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 && objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)enqueuePendingBurstAssetWithConvertible:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint8_t v13[16];

  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "burstIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[CAMTransientDataSource _enqueuedBurstConvertiblesByAssetUUID](self, "_enqueuedBurstConvertiblesByAssetUUID");
    v7 = objc_claimAutoreleasedReturnValue();
    -[CAMTransientDataSource _enqueuedBurstAssetUUIDByBurstIdentifier](self, "_enqueuedBurstAssetUUIDByBurstIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      if ((objc_msgSend(v9, "isEqualToString:", v5) & 1) != 0)
      {
LABEL_11:
        -[NSObject objectForKey:](v7, "objectForKey:", v5);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          -[NSObject setObject:forKey:](v7, "setObject:forKey:", v12, v5);
        }
        objc_msgSend(v12, "addObject:", v4);

        goto LABEL_14;
      }
      objc_msgSend(v8, "setObject:forKey:", v5, v6);
      -[NSObject removeObjectForKey:](v7, "removeObjectForKey:", v10);
    }
    else
    {
      objc_msgSend(v8, "setObject:forKey:", v5, v6);
    }
    v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[CAMTransientDataSource enqueuePendingBurstAssetWithConvertible:].cold.1();

    goto LABEL_11;
  }
  v7 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "Unable to enqueue a pending burst asset because this convertible does not have a burst identifier!", v13, 2u);
  }
LABEL_14:

}

- (void)processPendingBurstAssets
{
  void *v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  id v20;
  __int128 v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  uint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[CAMTransientDataSource _enqueuedBurstAssetUUIDByBurstIdentifier](self, "_enqueuedBurstAssetUUIDByBurstIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTransientDataSource _enqueuedBurstConvertiblesByAssetUUID](self, "_enqueuedBurstConvertiblesByAssetUUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v5)
  {
    v7 = v5;
    v22 = *(_QWORD *)v29;
    *(_QWORD *)&v6 = 138543618;
    v21 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v9, v21);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v21;
          v34 = v10;
          v35 = 2114;
          v36 = v9;
          _os_log_debug_impl(&dword_1DB760000, v12, OS_LOG_TYPE_DEBUG, "Processing %{public}@ for burst %{public}@", buf, 0x16u);
        }

        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v13 = v11;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v14)
        {
          v15 = v14;
          v16 = 0;
          v17 = *(_QWORD *)v25;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v25 != v17)
                objc_enumerationMutation(v13);
              v19 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j);
              if ((v16 & 1) != 0)
                -[CAMTransientDataSource updateAssetWithConvertible:](self, "updateAssetWithConvertible:", v19);
              else
                v20 = -[CAMTransientDataSource insertAssetWithConvertible:](self, "insertAssetWithConvertible:", v19);
              v16 = 1;
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v15);
        }

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "removeAllObjects");
  objc_msgSend(v23, "removeAllObjects");

}

- (void)unregisterChangeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->__observers, "removeObject:", a3);
}

- (NSMutableDictionary)_enqueuedBurstAssetUUIDByBurstIdentifier
{
  return self->__enqueuedBurstAssetUUIDByBurstIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__enqueuedBurstConvertiblesByAssetUUID, 0);
  objc_storeStrong((id *)&self->__enqueuedBurstAssetUUIDByBurstIdentifier, 0);
  objc_storeStrong((id *)&self->__representativeAssetsByBurstIdentifier, 0);
  objc_storeStrong((id *)&self->__assetsByUUID, 0);
  objc_storeStrong((id *)&self->__assetUUIDs, 0);
  objc_storeStrong((id *)&self->__observers, 0);
}

- (void)insertAssetWithConvertible:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_5(&dword_1DB760000, v0, v1, "Inserted transient asset for %{public}@ %{public}@");
  OUTLINED_FUNCTION_1_0();
}

- (void)updateAssetWithConvertible:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_5(&dword_1DB760000, v0, v1, "Updated transient asset for %{public}@ %{public}@");
  OUTLINED_FUNCTION_1_0();
}

- (void)updateAssetWithConvertible:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_1DB760000, a2, a3, "Ignoring update for transient asset due to creation date of convertible %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)updateAssetWithConvertible:(os_log_t)log .cold.3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DB760000, log, OS_LOG_TYPE_DEBUG, "Ignoring update for transient asset because we can't actually update anything", v1, 2u);
}

- (void)_removeAssetWithUUID:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_1DB760000, a2, a3, "Removed transient asset for %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_removeAssetWithUUID:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_1DB760000, a2, a3, "Removed enqueued convertibles with no processed asset for uuid %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)removeRepresentativeAssetForBurstIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_1DB760000, a2, a3, "Removed enqueued convertibles with no processed representative asset for uuid %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)enqueuePendingBurstAssetWithConvertible:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_5(&dword_1DB760000, v0, v1, "Pending convertible for %{public}@ is now %{public}@");
  OUTLINED_FUNCTION_1_0();
}

@end
