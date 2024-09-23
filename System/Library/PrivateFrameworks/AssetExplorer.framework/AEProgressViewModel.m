@implementation AEProgressViewModel

- (AEProgressViewModel)initWithDataSourceManager:(id)a3
{
  id v5;
  AEProgressViewModel *v6;
  AEProgressViewModel *v7;
  uint64_t v8;
  NSDictionary *progressByAsset;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AEProgressViewModel;
  v6 = -[AEProgressViewModel init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__dataSourceManager, a3);
    objc_msgSend(v5, "registerChangeObserver:context:", v7, AEProgressViewModelDataSourceManagerObserverContext);
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    progressByAsset = v7->__progressByAsset;
    v7->__progressByAsset = (NSDictionary *)v8;

  }
  return v7;
}

- (void)_setProgressByAsset:(id)a3
{
  NSDictionary *v5;
  AEProgressViewModelSnapshot *v6;
  AEProgressViewModelSnapshot *currentSnapshot;
  NSDictionary *v8;

  v5 = (NSDictionary *)a3;
  if (self->__progressByAsset != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->__progressByAsset, a3);
    -[AEProgressViewModel _createSnapshot](self, "_createSnapshot");
    v6 = (AEProgressViewModelSnapshot *)objc_claimAutoreleasedReturnValue();
    currentSnapshot = self->_currentSnapshot;
    self->_currentSnapshot = v6;

    -[AEProgressViewModel signalChange:](self, "signalChange:", 1);
    v5 = v8;
  }

}

- (AEProgressViewModelSnapshot)progressSnapshot
{
  return self->_currentSnapshot;
}

- (id)_createSnapshot
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  AEProgressViewModelSnapshot *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[AEProgressViewModel _progressByAsset](self, "_progressByAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v3, "keyEnumerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v24 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          v21 = 0u;
          v22 = 0u;
          -[AEProgressViewModel _dataSourceManager](self, "_dataSourceManager");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "dataSource");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
          {
            objc_msgSend(v12, "indexPathForAssetReference:", v10);
          }
          else
          {
            v21 = 0u;
            v22 = 0u;
          }

          PXIndexPathFromSimpleIndexPath();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[AEProgressViewModel _progressByAsset](self, "_progressByAsset", v21, v22);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKey:", v10);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "setObject:forKey:", v16, v14);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }
  -[AEProgressViewModel _dataSourceManager](self, "_dataSourceManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dataSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[AEProgressViewModelSnapshot initWithProgressByIndexPath:dataSourceIdenfitier:]([AEProgressViewModelSnapshot alloc], "initWithProgressByIndexPath:dataSourceIdenfitier:", v4, objc_msgSend(v18, "identifier"));

  return v19;
}

- (void)setProgress:(id)a3 forAssetReference:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[AEProgressViewModel _dataSourceManager](self, "_dataSourceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assetReferenceForAssetReference:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __53__AEProgressViewModel_setProgress_forAssetReference___block_invoke;
    v11[3] = &unk_24E23BD20;
    v11[4] = self;
    v12 = v6;
    v13 = v10;
    -[AEProgressViewModel performChanges:](self, "performChanges:", v11);

  }
}

- (void)cancelProgressForAssetUUIDs:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[AEProgressViewModel _progressByAsset](self, "_progressByAsset");
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v11, "asset", (_QWORD)v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "uuid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v4, "containsObject:", v13))
          {
            objc_msgSend(v5, "objectForKey:", v11);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "cancel");
            ++v8;
            v15 = objc_msgSend(v4, "count");

            if (v15 == v8)
            {

              goto LABEL_13;
            }
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_13:

  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  AEProgressViewModel *v28;
  id v29;
  uint64_t v30;
  _QWORD v31[5];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v6 = a4;
  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if ((v6 & 1) != 0 && (void *)AEProgressViewModelDataSourceManagerObserverContext == a5)
  {
    v29 = v8;
    objc_msgSend(v8, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = self;
    -[AEProgressViewModel _progressByAsset](self, "_progressByAsset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(v10, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v34;
      do
      {
        v16 = 0;
        v30 = v14;
        do
        {
          if (*(_QWORD *)v34 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v16);
          objc_msgSend(v9, "assetReferenceForAssetReference:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(v10, "objectForKey:", v17);
            v19 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setObject:forKey:", v19, v18);
          }
          else
          {
            PLAssetExplorerGetLog();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v17, "asset");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "uuid");
              v21 = v15;
              v22 = v9;
              v23 = v11;
              v24 = v12;
              v25 = v10;
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v38 = v26;
              _os_log_impl(&dword_21E23A000, v19, OS_LOG_TYPE_DEFAULT, "Forgetting in-flight progress for asset %{public}@", buf, 0xCu);

              v10 = v25;
              v12 = v24;
              v11 = v23;
              v9 = v22;
              v15 = v21;
              v14 = v30;

            }
          }

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      }
      while (v14);
    }

    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __52__AEProgressViewModel_observable_didChange_context___block_invoke;
    v31[3] = &unk_24E23BD48;
    v31[4] = v28;
    v32 = v11;
    v27 = v11;
    -[AEProgressViewModel performChanges:](v28, "performChanges:", v31);

    v8 = v29;
  }

}

- (id)sectionedDataSourceManagerInterestingObjectReferences:(id)a3
{
  return 0;
}

- (PXAssetsDataSourceManager)_dataSourceManager
{
  return self->__dataSourceManager;
}

- (NSDictionary)_progressByAsset
{
  return self->__progressByAsset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__progressByAsset, 0);
  objc_storeStrong((id *)&self->__dataSourceManager, 0);
  objc_storeStrong((id *)&self->_currentSnapshot, 0);
}

uint64_t __52__AEProgressViewModel_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setProgressByAsset:", *(_QWORD *)(a1 + 40));
}

void __53__AEProgressViewModel_setProgress_forAssetReference___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_progressByAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "mutableCopy");

  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    objc_msgSend(v4, "setObject:forKey:", v3, *(_QWORD *)(a1 + 48));
  else
    objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_setProgressByAsset:", v4);

}

@end
