@implementation NPTOCollectionTargetLibrary

- (NPTOCollectionTargetLibrary)initWithCollectionTarget:(int64_t)a3 device:(id)a4
{
  id v7;
  NPTOCollectionTargetLibrary *v8;
  NPTOCollectionTargetLibrary *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NPTOCollectionTargetLibrary;
  v8 = -[NPTOCollectionTargetLibrary init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_collectionTarget = a3;
    objc_storeStrong((id *)&v8->_device, a4);
  }

  return v9;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);
  -[NPTOCollectionTargetLibrary _createLibraryCollectionTargetMapChangeObserverIfNeeded](self);
  -[NPTOCollectionTargetLibrary _createSyncingChangeObserverIfNeeded](self);
  -[NPTOCollectionTargetLibrary _createSyncNeededChangeObserverIfNeeded](self);

}

- (void)_createLibraryCollectionTargetMapChangeObserverIfNeeded
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  if (val)
  {
    if (!val[3])
    {
      objc_initWeak(&location, val);
      -[NPTOCollectionTargetLibrary _libraryInfo](val);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __86__NPTOCollectionTargetLibrary__createLibraryCollectionTargetMapChangeObserverIfNeeded__block_invoke;
      v6[3] = &unk_24D0696E0;
      objc_copyWeak(&v7, &location);
      objc_msgSend(v2, "collectionTargetMapChangeObserverWithQueue:block:", v3, v6);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)val[3];
      val[3] = v4;

      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_createSyncingChangeObserverIfNeeded
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  if (val)
  {
    if (!val[4])
    {
      objc_initWeak(&location, val);
      -[NPTOCollectionTargetLibrary _libraryInfo](val);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __67__NPTOCollectionTargetLibrary__createSyncingChangeObserverIfNeeded__block_invoke;
      v6[3] = &unk_24D0696E0;
      objc_copyWeak(&v7, &location);
      objc_msgSend(v2, "syncingChangeObserverWithQueue:block:", v3, v6);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)val[4];
      val[4] = v4;

      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_createSyncNeededChangeObserverIfNeeded
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  if (val)
  {
    if (!val[5])
    {
      objc_initWeak(&location, val);
      -[NPTOCollectionTargetLibrary _libraryInfo](val);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __70__NPTOCollectionTargetLibrary__createSyncNeededChangeObserverIfNeeded__block_invoke;
      v6[3] = &unk_24D0696E0;
      objc_copyWeak(&v7, &location);
      objc_msgSend(v2, "syncNeededChangeObserverWithQueue:block:", v3, v6);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)val[5];
      val[5] = v4;

      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (id)assetCollections
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, void *);
  void *v11;
  NPTOCollectionTargetLibrary *v12;
  id v13;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTOCollectionTargetLibrary _libraryAssetCollections](self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __47__NPTOCollectionTargetLibrary_assetCollections__block_invoke;
  v11 = &unk_24D069690;
  v12 = self;
  v13 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v8);

  v6 = (void *)objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);
  return v6;
}

- (_QWORD)_libraryAssetCollections
{
  _QWORD *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (a1)
  {
    v1 = a1;
    -[NPTOCollectionTargetLibrary _createLibraryCollectionTargetMapChangeObserverIfNeeded](a1);
    v2 = (void *)v1[6];
    if (!v2)
    {
      -[NPTOCollectionTargetLibrary _libraryInfo](v1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "collectionTargetMap");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v1[7]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v1[6];
      v1[6] = v6;

      v2 = (void *)v1[6];
    }
    a1 = v2;
  }
  return a1;
}

void __47__NPTOCollectionTargetLibrary_assetCollections__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  objc_class *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v5 = (void *)MEMORY[0x24BDE3498];
  v6 = (objc_class *)MEMORY[0x24BDE3578];
  v7 = a2;
  v8 = objc_alloc_init(v6);
  v9 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("type"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "intValue") - 1;
  if (v11 <= 2)
    v12 = v11 + 1;
  else
    v12 = 0;
  if (v9)
    v13 = v12;
  else
    v13 = 0;
  v14 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("subtype"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "intValue");
  if (v14)
  {
    if (v16 > 100)
    {
      if (v16 == 101)
      {
        v14 = 101;
        goto LABEL_18;
      }
      if (v16 == 203)
      {
        v14 = 203;
        goto LABEL_18;
      }
    }
    else
    {
      if (v16 == 2)
      {
        v14 = 2;
        goto LABEL_18;
      }
      if (v16 == 100)
      {
        v14 = 100;
        goto LABEL_18;
      }
    }
    v14 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_18:
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("title"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("subtitle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transientAssetCollectionWithAssetFetchResult:type:subtype:title:subtitle:titleFontName:", v8, v13, v14, v17, v18, &stru_24D069B20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "npto_setUUID:", v7);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v19);

}

- (id)metadataForAssetCollection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "npto_uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTOCollectionTargetLibrary _libraryAssetCollections](self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("metadata"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)fetchAssetsWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[NPTOCollectionTargetLibrary _libraryAssetUUIDs](self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDE3488];
  objc_msgSend(MEMORY[0x24BDE3488], "npto_localIdentifiersWithUUIDs:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchAssetsWithLocalIdentifiers:options:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (_QWORD)_libraryAssetUUIDs
{
  _QWORD *v1;
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPTOCollectionTargetLibrary _libraryAssetCollections](v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __49__NPTOCollectionTargetLibrary__libraryAssetUUIDs__block_invoke;
    v6[3] = &unk_24D0696B8;
    v7 = v2;
    v4 = v2;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);

    v1 = (_QWORD *)objc_msgSend(v4, "copy");
  }
  return v1;
}

- (id)fetchAssetsInAssetCollection:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  -[NPTOCollectionTargetLibrary _libraryAssetCollections](self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "npto_uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("assetUUIDs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BDE3488];
  objc_msgSend(MEMORY[0x24BDE3488], "npto_localIdentifiersWithUUIDs:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchAssetsWithLocalIdentifiers:options:", v13, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)fetchKeyAssetsInAssetCollection:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  -[NPTOCollectionTargetLibrary _libraryAssetCollections](self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "npto_uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("keyAssetUUIDs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BDE3488];
  objc_msgSend(MEMORY[0x24BDE3488], "npto_localIdentifiersWithUUIDs:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchAssetsWithLocalIdentifiers:options:", v13, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (unint64_t)countOfAssetsWithOptions:(id)a3
{
  void *v3;
  unint64_t v4;

  -[NPTOCollectionTargetLibrary fetchAssetsWithOptions:](self, "fetchAssetsWithOptions:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (unint64_t)countOfAssetsInAssetCollection:(id)a3 options:(id)a4
{
  void *v4;
  unint64_t v5;

  -[NPTOCollectionTargetLibrary fetchAssetsInAssetCollection:options:](self, "fetchAssetsInAssetCollection:options:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (unint64_t)expectedCountOfAssets
{
  void *v2;
  unint64_t v3;

  -[NPTOCollectionTargetLibrary _libraryAssetUUIDs](self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unint64_t)expectedCountOfAssetsInAssetCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;

  v4 = a3;
  -[NPTOCollectionTargetLibrary _libraryAssetCollections](self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "npto_uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("assetUUIDs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "count");
  return v9;
}

- (NSDate)lastUpdatedDate
{
  void *v2;
  void *v3;

  -[NPTOCollectionTargetLibrary _libraryInfo](self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastUpdatedDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (_QWORD)_libraryInfo
{
  _QWORD *v1;
  void *v2;
  NPTOLibraryInfo *v3;
  void *v4;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[2];
    if (!v2)
    {
      v3 = -[NPTOLibraryInfo initWithDevice:]([NPTOLibraryInfo alloc], "initWithDevice:", a1[8]);
      v4 = (void *)v1[2];
      v1[2] = v3;

      v2 = (void *)v1[2];
    }
    a1 = v2;
  }
  return a1;
}

- (_QWORD)_isSyncing
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  if (result)
  {
    v1 = result;
    -[NPTOCollectionTargetLibrary _createSyncingChangeObserverIfNeeded](result);
    -[NPTOCollectionTargetLibrary _libraryInfo](v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isSyncing");

    return (_QWORD *)v3;
  }
  return result;
}

- (BOOL)isSyncNeeded
{
  NPTOCollectionTargetLibrary *v2;
  void *v3;
  char v4;

  if (self)
  {
    v2 = self;
    -[NPTOCollectionTargetLibrary _createSyncNeededChangeObserverIfNeeded](self);
    -[NPTOCollectionTargetLibrary _libraryInfo](v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isSyncNeeded");

    LOBYTE(self) = v4;
  }
  return (char)self;
}

void __49__NPTOCollectionTargetLibrary__libraryAssetUUIDs__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("assetUUIDs"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

}

void __86__NPTOCollectionTargetLibrary__createLibraryCollectionTargetMapChangeObserverIfNeeded__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = (void *)*((_QWORD *)WeakRetained + 6);
    *((_QWORD *)WeakRetained + 6) = 0;

    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v2 = *((id *)WeakRetained + 1);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v10;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v7, "collectionTargetLibraryDidUpdate:", WeakRetained);
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v4);
    }

  }
}

void __67__NPTOCollectionTargetLibrary__createSyncingChangeObserverIfNeeded__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id *WeakRetained;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v1 = WeakRetained[1];
    v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v2)
    {
      v3 = v2;
      v4 = *(_QWORD *)v9;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v9 != v4)
            objc_enumerationMutation(v1);
          v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v5);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v6, "collectionTargetLibrarySyncingDidChange:", WeakRetained);
          ++v5;
        }
        while (v3 != v5);
        v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v3);
    }

  }
}

void __70__NPTOCollectionTargetLibrary__createSyncNeededChangeObserverIfNeeded__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id *WeakRetained;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v1 = WeakRetained[1];
    v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v2)
    {
      v3 = v2;
      v4 = *(_QWORD *)v9;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v9 != v4)
            objc_enumerationMutation(v1);
          v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v5);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v6, "collectionTargetLibrarySyncNeeded:", WeakRetained);
          ++v5;
        }
        while (v3 != v5);
        v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v3);
    }

  }
}

- (int64_t)collectionTarget
{
  return self->_collectionTarget;
}

- (NRDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_libraryAssetCollections, 0);
  objc_storeStrong(&self->_syncNeededChangeObserver, 0);
  objc_storeStrong(&self->_syncingChangeObserver, 0);
  objc_storeStrong(&self->_libraryCollectionTargetMapChangeObserver, 0);
  objc_storeStrong((id *)&self->_libraryInfo, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
