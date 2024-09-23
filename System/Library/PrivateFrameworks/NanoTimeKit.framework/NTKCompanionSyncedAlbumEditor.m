@implementation NTKCompanionSyncedAlbumEditor

- (id)_fetchSingleAsset
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NTKCompanionSyncedAlbumEditor *v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v39;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  void *v45;
  uint8_t v46[128];
  uint8_t buf[4];
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[NTKCompanionSinglePHAssetEditor albumIdentifier](self, "albumIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v48 = v4;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "NTKCompanionSyncedAlbumEditor: fetching asset for albumIdentifier %@", buf, 0xCu);

  }
  -[NTKCompanionSinglePHAssetEditor albumIdentifier](self, "albumIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x1E0D515F8]);
  -[NTKCompanionResourceDirectoryEditor device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nrDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v9 = (void *)objc_msgSend(v6, "initWithCollectionTarget:device:", 4, v8);

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    objc_msgSend(v9, "assetCollections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v11)
    {
      v39 = v9;
      obj = v10;
      v12 = *(_QWORD *)v42;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v42 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
          v15 = (void *)MEMORY[0x1E0CD13B8];
          NTK_npto_uuid(v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "UUIDString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "localIdentifierWithUUID:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = self;
          -[NTKCompanionSinglePHAssetEditor albumIdentifier](self, "albumIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v18, "isEqualToString:", v20);

          if (v21)
          {
            self = v19;
            -[NTKCompanionSinglePHAssetEditor albumIdentifier](v19, "albumIdentifier");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v14, "localizedTitle");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v48 = v23;
              _os_log_impl(&dword_1B72A3000, v22, OS_LOG_TYPE_DEFAULT, "NTKCompanionSyncedAlbumEditor: found photos face album from assetCollection %@", buf, 0xCu);

            }
            v9 = v39;
            v10 = obj;
            goto LABEL_21;
          }
          self = v19;
        }
        v10 = obj;
        v11 = (void *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
        if (v11)
          continue;
        break;
      }
      v9 = v39;
    }
  }
  else
  {
    v9 = (void *)objc_msgSend(v6, "initWithCollectionTarget:device:", 1, v8);

    objc_msgSend(v9, "assetCollections");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "anyObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v25 = (void *)MEMORY[0x1E0CD13B8];
      NTK_npto_uuid(v10);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "UUIDString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localIdentifierWithUUID:", v27);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
    _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "localizedTitle");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v48 = v28;
      _os_log_impl(&dword_1B72A3000, v22, OS_LOG_TYPE_DEFAULT, "NTKCompanionSyncedAlbumEditor: found synced album from assetCollection %@", buf, 0xCu);

    }
LABEL_21:

  }
  _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v48 = v11;
    _os_log_impl(&dword_1B72A3000, v29, OS_LOG_TYPE_DEFAULT, "NTKCompanionSyncedAlbumEditor: realAlbumIdentifier == %@", buf, 0xCu);
  }

  if (v11)
  {
    -[NTKCompanionSinglePHAssetEditor optionsForSingleAsset](self, "optionsForSingleAsset");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)MEMORY[0x1E0CD13B8];
    v45 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "fetchAssetCollectionsWithLocalIdentifiers:options:", v32, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "firstObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v34, v30);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "firstObject");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v48 = v36;
      _os_log_impl(&dword_1B72A3000, v37, OS_LOG_TYPE_DEFAULT, "NTKCompanionSyncedAlbumEditor: fetched asset %@", buf, 0xCu);
    }

  }
  else
  {
    v36 = 0;
  }

  return v36;
}

- (id)_fetchAlbumName
{
  void *v3;
  void *v4;
  void *v5;

  -[NTKCompanionSinglePHAssetEditor albumIdentifier](self, "albumIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKCompanionResourceDirectoryEditor device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NTKAlbumNameForLocalIdentifier(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
