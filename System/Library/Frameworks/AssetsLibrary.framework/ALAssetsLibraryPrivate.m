@implementation ALAssetsLibraryPrivate

- (ALAssetsLibraryPrivate)initWithAssetsLibrary:(id)a3
{
  ALAssetsLibraryPrivate *v4;
  ALAssetsLibraryPrivate *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ALAssetsLibraryPrivate;
  v4 = -[ALAssetsLibraryPrivate init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[ALAssetsLibraryPrivate setAssetsLibrary:](v4, "setAssetsLibrary:", a3);
    v5->_assetGroupInternals = (NSHashTable *)(id)objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v5->_groupURLSByAlbumOID = (NSMutableDictionary *)objc_opt_new();
    v5->_isValid = 1;
  }
  return v5;
}

- (PLPhotoLibrary)photoLibrary
{
  void *v3;

  objc_sync_enter(self);
  if (!self->_photoLibrary)
  {
    self->_photoLibrary = (PLPhotoLibrary *)+[ALAssetsLibrary _library](ALAssetsLibrary, "_library");
    v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_photoLibraryDidChange_, *MEMORY[0x24BE720B0], self->_photoLibrary);
  }
  objc_sync_exit(self);
  return self->_photoLibrary;
}

- (void)photoLibraryDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  uint64_t v30;
  void *v31;
  NSHashTable *assetGroupInternals;
  NSHashTable *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t n;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[5];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(a3, "userInfo");
  if (v4)
  {
    v5 = v4;
    v38 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v39 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v37 = v5;
    v6 = (void *)objc_msgSend(v5, "objectForKey:", CFSTR("insertedAssetGroups"));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v58 != v8)
            objc_enumerationMutation(v6);
          v10 = objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * i), "groupURL");
          if (v10)
            objc_msgSend(v39, "addObject:", v10);
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
      }
      while (v7);
    }
    v11 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v12 = (void *)objc_msgSend(v37, "objectForKey:", CFSTR("updatedAssetGroups"));
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v54;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v54 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
          v17 = objc_msgSend(v16, "groupURL");
          if (v17)
            objc_msgSend(v11, "addObject:", v17);
          if (objc_msgSend(v16, "conformsToProtocol:", &unk_2549A4E60))
          {
            v52[0] = MEMORY[0x24BDAC760];
            v52[1] = 3221225472;
            v52[2] = __48__ALAssetsLibraryPrivate_photoLibraryDidChange___block_invoke;
            v52[3] = &unk_24C5ECE90;
            v52[4] = v11;
            objc_msgSend(v16, "enumerateDerivedAlbums:", v52);
          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
      }
      while (v13);
    }
    v18 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v19 = (void *)objc_msgSend(v37, "objectForKey:", CFSTR("deletedAssetGroups"));
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v49;
      do
      {
        for (k = 0; k != v20; ++k)
        {
          if (*(_QWORD *)v49 != v21)
            objc_enumerationMutation(v19);
          v23 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * k);
          v24 = -[NSMutableDictionary objectForKey:](self->_groupURLSByAlbumOID, "objectForKey:", objc_msgSend(v23, "objectID"));
          if (v24)
          {
            objc_msgSend(v18, "addObject:", v24);
            -[NSMutableDictionary removeObjectForKey:](self->_groupURLSByAlbumOID, "removeObjectForKey:", objc_msgSend(v23, "objectID"));
          }
        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
      }
      while (v20);
    }
    v25 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v26 = (void *)objc_msgSend(v37, "objectForKey:", CFSTR("updatedAssets"));
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v62, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v45;
      do
      {
        for (m = 0; m != v27; ++m)
        {
          if (*(_QWORD *)v45 != v28)
            objc_enumerationMutation(v26);
          v30 = objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * m), "assetURL");
          if (v30)
            objc_msgSend(v25, "addObject:", v30);
        }
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v62, 16);
      }
      while (v27);
    }
    if (objc_msgSend(v39, "count"))
      objc_msgSend(v38, "setObject:forKey:", v39, CFSTR("ALAssetLibraryInsertedAssetGroupsKey"));
    if (objc_msgSend(v11, "count"))
      objc_msgSend(v38, "setObject:forKey:", v11, CFSTR("ALAssetLibraryUpdatedAssetGroupsKey"));
    if (objc_msgSend(v18, "count"))
      objc_msgSend(v38, "setObject:forKey:", v18, CFSTR("ALAssetLibraryDeletedAssetGroupsKey"));
    if (objc_msgSend(v25, "count"))
      objc_msgSend(v38, "setObject:forKey:", v25, CFSTR("ALAssetLibraryUpdatedAssetsKey"));
    v4 = v38;
  }
  v31 = v4;
  if (objc_msgSend(v4, "count"))
  {
    +[ALAssetRepresentationPrivate _clearFileDescriptorQueue](ALAssetRepresentationPrivate, "_clearFileDescriptorQueue");
    if (objc_msgSend((id)objc_msgSend(v31, "objectForKey:", CFSTR("ALAssetLibraryUpdatedAssetGroupsKey")), "count"))
    {
      assetGroupInternals = self->_assetGroupInternals;
      objc_sync_enter(assetGroupInternals);
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v33 = self->_assetGroupInternals;
      v34 = -[NSHashTable countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v40, v61, 16);
      if (v34)
      {
        v35 = *(_QWORD *)v41;
        do
        {
          for (n = 0; n != v34; ++n)
          {
            if (*(_QWORD *)v41 != v35)
              objc_enumerationMutation(v33);
            objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * n), "libraryDidChange");
          }
          v34 = -[NSHashTable countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v40, v61, 16);
        }
        while (v34);
      }
      objc_sync_exit(assetGroupInternals);
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("ALAssetsLibraryChangedNotification"), self->_assetsLibrary, v31);
}

- (void)registerAlbum:(id)a3 assetGroupPrivate:(id)a4
{
  PLPhotoLibrary *v7;
  NSHashTable *assetGroupInternals;
  _QWORD v9[6];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = -[ALAssetsLibraryPrivate photoLibrary](self, "photoLibrary");
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __58__ALAssetsLibraryPrivate_registerAlbum_assetGroupPrivate___block_invoke;
    v9[3] = &unk_24C5ECEB8;
    v9[4] = self;
    v9[5] = a3;
    -[PLPhotoLibrary performBlockAndWait:](v7, "performBlockAndWait:", v9);
  }
  assetGroupInternals = self->_assetGroupInternals;
  objc_sync_enter(assetGroupInternals);
  -[NSHashTable addObject:](self->_assetGroupInternals, "addObject:", a4);
  objc_sync_exit(assetGroupInternals);
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);
  -[PLPhotoLibrary performBlockAndWait:](self->_photoLibrary, "performBlockAndWait:", &__block_literal_global_148);
  -[ALAssetsLibraryPrivate setAssetsLibrary:](self, "setAssetsLibrary:", 0);

  self->_assetGroupInternals = 0;
  self->_photoLibrary = 0;

  v3.receiver = self;
  v3.super_class = (Class)ALAssetsLibraryPrivate;
  -[ALAssetsLibraryPrivate dealloc](&v3, sel_dealloc);
}

- (ALAssetsLibrary)assetsLibrary
{
  return self->_assetsLibrary;
}

- (void)setAssetsLibrary:(id)a3
{
  self->_assetsLibrary = (ALAssetsLibrary *)a3;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

uint64_t __58__ALAssetsLibraryPrivate_registerAlbum_assetGroupPrivate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKey:", objc_msgSend(*(id *)(a1 + 40), "groupURL"), objc_msgSend(*(id *)(a1 + 40), "objectID"));
}

uint64_t __48__ALAssetsLibraryPrivate_photoLibraryDidChange___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  objc_msgSend(a2, "mappedDataSourceChanged:remoteNotificationData:", 0, 0);
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    result = objc_msgSend(a2, "groupURL");
    if (result)
      return objc_msgSend(*(id *)(a1 + 32), "addObject:", result);
  }
  return result;
}

@end
