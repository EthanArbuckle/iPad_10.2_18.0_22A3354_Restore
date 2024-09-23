@implementation CLFPhotosSettings

- (id)selectedSharedAlbumCloudIdentifiers
{
  objc_super v4;

  -[CLFPhotosSettings _migrateSelectedSharedAlbumNamesIfNecessary](self, "_migrateSelectedSharedAlbumNamesIfNecessary");
  v4.receiver = self;
  v4.super_class = (Class)CLFPhotosSettings;
  -[CLFPhotosSettings_GeneratedCode selectedSharedAlbumCloudIdentifiers](&v4, sel_selectedSharedAlbumCloudIdentifiers);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_migrateSelectedSharedAlbumNamesIfNecessary
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[AXBaseSettings objectValueForPreferenceKey:ofClass:defaultValue:](self, "objectValueForPreferenceKey:ofClass:defaultValue:", CFSTR("SelectedSharedAlbums"), objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    +[CLFLog commonLog](CLFLog, "commonLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 134217984;
      v7 = objc_msgSend(v3, "count");
      _os_log_impl(&dword_20D4E9000, v4, OS_LOG_TYPE_DEFAULT, "Migrating %lu shared photo album name(s).", (uint8_t *)&v6, 0xCu);
    }

    -[CLFPhotosSettings _saveSelectedSharedAlbumCloudIdentifiersForNames:](self, "_saveSelectedSharedAlbumCloudIdentifiersForNames:", v3);
LABEL_9:
    -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", 0, CFSTR("SelectedSharedAlbums"));
    goto LABEL_10;
  }
  if (v3)
  {
    +[CLFLog commonLog](CLFLog, "commonLog");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_20D4E9000, v5, OS_LOG_TYPE_DEFAULT, "Removing empty shared photo album names.", (uint8_t *)&v6, 2u);
    }

    goto LABEL_9;
  }
LABEL_10:

}

- (void)_saveSelectedSharedAlbumCloudIdentifiersForNames:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v30;
  id obj;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  _BYTE v47[128];
  uint8_t v48[128];
  _BYTE buf[24];
  void *v50;
  uint64_t *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  v44 = &v43;
  v45 = 0x2050000000;
  v5 = (void *)getPHAssetCollectionClass_softClass;
  v46 = getPHAssetCollectionClass_softClass;
  if (!getPHAssetCollectionClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getPHAssetCollectionClass_block_invoke;
    v50 = &unk_24C71FB18;
    v51 = &v43;
    __getPHAssetCollectionClass_block_invoke((uint64_t)buf);
    v5 = (void *)v44[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v43, 8);
  objc_msgSend(v6, "fetchAssetCollectionsWithType:subtype:options:", 1, 101, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __81__CLFPhotosSettings_Migration___saveSelectedSharedAlbumCloudIdentifiersForNames___block_invoke;
  v41[3] = &unk_24C71FAF0;
  v8 = v4;
  v42 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v41);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v3;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v38 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "length"))
        {
          objc_msgSend(v32, "addObject:", v13);
        }
        else
        {
          +[CLFLog commonLog](CLFLog, "commonLog");
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138477827;
            *(_QWORD *)&buf[4] = v12;
            _os_log_error_impl(&dword_20D4E9000, v14, OS_LOG_TYPE_ERROR, "Unable to get local identifier for shared album name: %{private}@", buf, 0xCu);
          }

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v32, "count"))
  {
    v43 = 0;
    v44 = &v43;
    v45 = 0x2050000000;
    v15 = (void *)getPHPhotoLibraryClass_softClass;
    v46 = getPHPhotoLibraryClass_softClass;
    if (!getPHPhotoLibraryClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getPHPhotoLibraryClass_block_invoke;
      v50 = &unk_24C71FB18;
      v51 = &v43;
      __getPHPhotoLibraryClass_block_invoke((uint64_t)buf);
      v15 = (void *)v44[3];
    }
    v16 = objc_retainAutorelease(v15);
    _Block_object_dispose(&v43, 8);
    objc_msgSend(v16, "sharedPhotoLibrary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "cloudIdentifierMappingsForLocalIdentifiers:", v32);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v19 = v18;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v34 != v21)
            objc_enumerationMutation(v19);
          v23 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j);
          objc_msgSend(v19, "objectForKeyedSubscript:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "cloudIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "stringValue");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v26, "length"))
          {
            objc_msgSend(v30, "addObject:", v26);
          }
          else
          {
            +[CLFLog commonLog](CLFLog, "commonLog");
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v24, "error");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138478083;
              *(_QWORD *)&buf[4] = v23;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v28;
              _os_log_error_impl(&dword_20D4E9000, v27, OS_LOG_TYPE_ERROR, "Unable to get cloud identifier for shared album with local identifier: %{private}@, error: %@", buf, 0x16u);

            }
          }

        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
      }
      while (v20);
    }

  }
  -[CLFPhotosSettings_GeneratedCode setSelectedSharedAlbumCloudIdentifiers:](self, "setSelectedSharedAlbumCloudIdentifiers:", v30);

}

void __81__CLFPhotosSettings_Migration___saveSelectedSharedAlbumCloudIdentifiersForNames___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "localizedTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v5, "localIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v3);

  }
}

void __49__CLFPhotosSettings_GeneratedCode_sharedInstance__block_invoke()
{
  CLFPhotosSettings *v0;
  void *v1;

  v0 = objc_alloc_init(CLFPhotosSettings);
  v1 = (void *)sharedInstance_SharedSettings_4;
  sharedInstance_SharedSettings_4 = (uint64_t)v0;

}

@end
