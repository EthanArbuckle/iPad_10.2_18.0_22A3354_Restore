id MSMMCSHashForData(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = a1;
  v2 = MMCSSignatureGeneratorCreate();
  v3 = objc_retainAutorelease(v1);
  v4 = objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");

  MEMORY[0x1D8255980](v2, v4, v5, 1);
  v6 = MMCSSignatureGeneratorFinish();
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v6, MEMORY[0x1D825595C](v6), 1);
}

id MSMMCSHashForFileAtPath(void *a1, void *a2)
{
  id v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = a2;
  v4 = (objc_class *)MEMORY[0x1E0C99D50];
  v5 = a1;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithContentsOfFile:options:error:", v5, 1, 0);

  if (v6)
  {
    MSMMCSHashForData(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void MSCoreMediaStreamInitialize(id obj)
{
  objc_storeStrong((id *)&_platform, obj);
}

void _commitMasterManifest()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend((id)__masterManifest, "objectForKey:", CFSTR("nextActivityDateByPersonIDKey"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "count");

  if (v1)
  {
    v2 = (void *)__masterManifest;
    MSPathPublishMasterManifest();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "writeToFile:atomically:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    MSPathPublishMasterManifest();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeItemAtPath:error:", v3, 0);

  }
}

id _masterNextActivityDateByPersonID()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v0 = (void *)__masterManifest;
  if (!__masterManifest)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    MSPathPublishDir();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v2, 1, 0, 0);

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    MSPathPublishMasterManifest();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0CB38B0];
      v7 = (void *)MEMORY[0x1E0C99D50];
      MSPathPublishMasterManifest();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dataWithContentsOfFile:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      objc_msgSend(v6, "propertyListWithData:options:format:error:", v9, 1, 0, &v18);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v18;
      v12 = (void *)__masterManifest;
      __masterManifest = v10;

      if (!__masterManifest && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v20 = v11;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to deserialize publisher master manifest: %{public}@", buf, 0xCu);
      }

    }
    v0 = (void *)__masterManifest;
    if (!__masterManifest)
    {
      v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v14 = (void *)__masterManifest;
      __masterManifest = (uint64_t)v13;

      v0 = (void *)__masterManifest;
    }
  }
  v15 = v0;
  objc_msgSend(v15, "objectForKey:", CFSTR("nextActivityDateByPersonIDKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v16, CFSTR("nextActivityDateByPersonIDKey"));
  }

  return v16;
}

void _commitMasterManifest_275()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend((id)__masterManifest_276, "objectForKey:", CFSTR("nextActivityDateByPersonID"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "count");

  if (v1)
  {
    v2 = (void *)__masterManifest_276;
    MSPathSubscribeMasterManifest();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "writeToFile:atomically:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    MSPathSubscribeMasterManifest();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeItemAtPath:error:", v3, 0);

  }
}

id _masterNextActivityDateByPersonID_302()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v0 = (void *)__masterManifest_276;
  if (!__masterManifest_276)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    MSPathSubscribeDir();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v2, 1, 0, 0);

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    MSPathSubscribeMasterManifest();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0CB38B0];
      v7 = (void *)MEMORY[0x1E0C99D50];
      MSPathSubscribeMasterManifest();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dataWithContentsOfFile:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      objc_msgSend(v6, "propertyListWithData:options:format:error:", v9, 1, 0, &v18);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v18;
      v12 = (void *)__masterManifest_276;
      __masterManifest_276 = v10;

      if (!__masterManifest_276 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v20 = v11;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to deserialize subscriber master manifest: %{public}@", buf, 0xCu);
      }

    }
    v0 = (void *)__masterManifest_276;
    if (!__masterManifest_276)
    {
      v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v14 = (void *)__masterManifest_276;
      __masterManifest_276 = (uint64_t)v13;

      v0 = (void *)__masterManifest_276;
    }
  }
  v15 = v0;
  objc_msgSend(v15, "objectForKey:", CFSTR("nextActivityDateByPersonID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v16, CFSTR("nextActivityDateByPersonID"));
  }

  return v16;
}

void sub_1D3EA7B50(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3EA8018(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3EA8090(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id MSMediaStreamDir()
{
  void *v0;
  void *v1;

  MSPlatform();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathMediaStreamDir");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id MSPathPublishDir()
{
  if (MSPathPublishDir_once != -1)
    dispatch_once(&MSPathPublishDir_once, &__block_literal_global_565);
  return (id)MSPathPublishDir_path;
}

id MSPathPublishDirForPersonID(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  MSPathPublishDir();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _sanitizeString(v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id _sanitizeString(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v1 = (void *)MEMORY[0x1E0CB3500];
  v2 = a1;
  objc_msgSend(v1, "alphanumericCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invertedSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("_"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = objc_msgSend(v2, "hash");

  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@+%lu"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id MSPathPublishMasterManifest()
{
  if (MSPathPublishMasterManifest_once != -1)
    dispatch_once(&MSPathPublishMasterManifest_once, &__block_literal_global_2);
  return (id)MSPathPublishMasterManifest_path;
}

id MSPathPublishManifestForPersonID(void *a1)
{
  void *v1;
  void *v2;

  MSPathPublishDirForPersonID(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("manifest.plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id MSPathPublishQueueForPersonID(void *a1)
{
  void *v1;
  void *v2;

  MSPathPublishDirForPersonID(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("queue.sqlite3"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id MSPathPublishDerivativesQueueForPersonID(void *a1)
{
  void *v1;
  void *v2;

  MSPathPublishDirForPersonID(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("derivatives.sqlite3"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id MSPathPublishDiscardedQueueForPersonID(void *a1)
{
  void *v1;
  void *v2;

  MSPathPublishDirForPersonID(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("quarantine.sqlite3"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id MSPathSubscribeDir()
{
  if (MSPathSubscribeDir_once != -1)
    dispatch_once(&MSPathSubscribeDir_once, &__block_literal_global_11);
  return (id)MSPathSubscribeDir_path;
}

id MSPathSubscribeDirForPersonID(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  MSPathSubscribeDir();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _sanitizeString(v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id MSPathSubscribeMasterManifest()
{
  if (MSPathSubscribeMasterManifest_once != -1)
    dispatch_once(&MSPathSubscribeMasterManifest_once, &__block_literal_global_14);
  return (id)MSPathSubscribeMasterManifest_path;
}

id MSPathSubscriberManifestForPersonID(void *a1)
{
  void *v1;
  void *v2;

  MSPathSubscribeDirForPersonID(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("manifest.plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id MSPathSubscribeProtocolDirForPersonID(void *a1)
{
  void *v1;
  void *v2;

  MSPathSubscribeDirForPersonID(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("protocol"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id MSPathSubscriberRetrievalQueueForPersonID(void *a1)
{
  void *v1;
  void *v2;

  MSPathSubscribeDirForPersonID(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("queue.sqlite3"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id MSPathShareDir()
{
  if (MSPathShareDir_once != -1)
    dispatch_once(&MSPathShareDir_once, &__block_literal_global_17);
  return (id)MSPathShareDir_path;
}

id MSPathShareDirForPersonID(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  MSPathShareDir();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _sanitizeString(v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id MSPathShareManifestForPersonID(void *a1)
{
  void *v1;
  void *v2;

  MSPathShareDirForPersonID(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("manifest.plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id MSPathDeleteDir()
{
  if (MSPathDeleteDir_once != -1)
    dispatch_once(&MSPathDeleteDir_once, &__block_literal_global_20);
  return (id)MSPathDeleteDir_path;
}

id MSPathDeleteDirForPersonID(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  MSPathDeleteDir();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _sanitizeString(v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id MSPathDeleteMasterManifest()
{
  if (MSPathDeleteMasterManifest_once != -1)
    dispatch_once(&MSPathDeleteMasterManifest_once, &__block_literal_global_23);
  return (id)MSPathDeleteMasterManifest_path;
}

id MSPathDeleteManifestForPersonID(void *a1)
{
  void *v1;
  void *v2;

  MSPathDeleteDirForPersonID(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("manifest.plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id MSPathDeleteQueueForPersonID(void *a1)
{
  void *v1;
  void *v2;

  MSPathDeleteDirForPersonID(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("queue.sqlite3"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id MSPathMMCSLibraryDir()
{
  if (MSPathMMCSLibraryDir_once != -1)
    dispatch_once(&MSPathMMCSLibraryDir_once, &__block_literal_global_24);
  return (id)MSPathMMCSLibraryDir_path;
}

id MSPathMMCSMasterManifest()
{
  void *v0;
  void *v1;

  MSPathMMCSLibraryDir();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("manifest.plist"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id MSPathPublishMMCSLibraryForPersonID(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = a1;
  MSPathMMCSLibraryDir();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("pub"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _sanitizeString(v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id MSPathSubscribeMMCSLibraryForPersonID(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = a1;
  MSPathMMCSLibraryDir();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("sub"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _sanitizeString(v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id MSPathConfigDir()
{
  if (MSPathConfigDir_once != -1)
    dispatch_once(&MSPathConfigDir_once, &__block_literal_global_27);
  return (id)MSPathConfigDir_path;
}

id MSPathConfigDirForPersonID(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  MSPathConfigDir();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _sanitizeString(v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id MSPathServerSideConfigPathForPersonID(void *a1)
{
  void *v1;
  void *v2;

  MSPathConfigDirForPersonID(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("serverconfig.plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id MSPathAlbumSharingDir()
{
  if (MSPathAlbumSharingDir_once != -1)
    dispatch_once(&MSPathAlbumSharingDir_once, &__block_literal_global_32);
  return (id)MSPathAlbumSharingDir_path;
}

id MSPathAlbumSharingDaemonPersistentStore()
{
  if (MSPathAlbumSharingDaemonPersistentStore_onceToken != -1)
    dispatch_once(&MSPathAlbumSharingDaemonPersistentStore_onceToken, &__block_literal_global_35);
  return (id)MSPathAlbumSharingDaemonPersistentStore_path;
}

id MSPathAlbumSharingDirForPersonID(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v9;

  v1 = a1;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __MSPathAlbumSharingDirForPersonID_block_invoke;
  block[3] = &unk_1E95BCED0;
  v9 = v1;
  v2 = MSPathAlbumSharingDirForPersonID_onceToken;
  v3 = v1;
  v4 = v3;
  if (v2 == -1)
  {
    v5 = v3;
  }
  else
  {
    dispatch_once(&MSPathAlbumSharingDirForPersonID_onceToken, block);
    v5 = v9;
  }
  v6 = (id)MSPathAlbumSharingDirForPersonID_path;

  return v6;
}

id MSPathAlbumSharingAssetsDirForPersonID(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v9;

  v1 = a1;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __MSPathAlbumSharingAssetsDirForPersonID_block_invoke;
  block[3] = &unk_1E95BCED0;
  v9 = v1;
  v2 = MSPathAlbumSharingAssetsDirForPersonID_onceToken;
  v3 = v1;
  v4 = v3;
  if (v2 == -1)
  {
    v5 = v3;
  }
  else
  {
    dispatch_once(&MSPathAlbumSharingAssetsDirForPersonID_onceToken, block);
    v5 = v9;
  }
  v6 = (id)MSPathAlbumSharingAssetsDirForPersonID_path;

  return v6;
}

id MSPathAlbumSharingPersistentStoreForPersonID(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v9;

  v1 = a1;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __MSPathAlbumSharingPersistentStoreForPersonID_block_invoke;
  block[3] = &unk_1E95BCED0;
  v9 = v1;
  v2 = MSPathAlbumSharingPersistentStoreForPersonID_onceToken;
  v3 = v1;
  v4 = v3;
  if (v2 == -1)
  {
    v5 = v3;
  }
  else
  {
    dispatch_once(&MSPathAlbumSharingPersistentStoreForPersonID_onceToken, block);
    v5 = v9;
  }
  v6 = (id)MSPathAlbumSharingPersistentStoreForPersonID_path;

  return v6;
}

id MSPathAlbumSharingPublishMMCSLibraryForPersonID(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v9;

  v1 = a1;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __MSPathAlbumSharingPublishMMCSLibraryForPersonID_block_invoke;
  block[3] = &unk_1E95BCED0;
  v9 = v1;
  v2 = MSPathAlbumSharingPublishMMCSLibraryForPersonID_onceToken;
  v3 = v1;
  v4 = v3;
  if (v2 == -1)
  {
    v5 = v3;
  }
  else
  {
    dispatch_once(&MSPathAlbumSharingPublishMMCSLibraryForPersonID_onceToken, block);
    v5 = v9;
  }
  v6 = (id)MSPathAlbumSharingPublishMMCSLibraryForPersonID_path;

  return v6;
}

id MSPathAlbumSharingModelForPersonID(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v9;

  v1 = a1;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __MSPathAlbumSharingModelForPersonID_block_invoke;
  block[3] = &unk_1E95BCED0;
  v9 = v1;
  v2 = MSPathAlbumSharingModelForPersonID_onceToken;
  v3 = v1;
  v4 = v3;
  if (v2 == -1)
  {
    v5 = v3;
  }
  else
  {
    dispatch_once(&MSPathAlbumSharingModelForPersonID_onceToken, block);
    v5 = v9;
  }
  v6 = (id)MSPathAlbumSharingModelForPersonID_path;

  return v6;
}

id MSPathAlbumSharingSubscribeMMCSLibraryForPersonID(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v9;

  v1 = a1;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __MSPathAlbumSharingSubscribeMMCSLibraryForPersonID_block_invoke;
  block[3] = &unk_1E95BCED0;
  v9 = v1;
  v2 = MSPathAlbumSharingSubscribeMMCSLibraryForPersonID_onceToken;
  v3 = v1;
  v4 = v3;
  if (v2 == -1)
  {
    v5 = v3;
  }
  else
  {
    dispatch_once(&MSPathAlbumSharingSubscribeMMCSLibraryForPersonID_onceToken, block);
    v5 = v9;
  }
  v6 = (id)MSPathAlbumSharingSubscribeMMCSLibraryForPersonID_path;

  return v6;
}

id MSPathPerfDir()
{
  if (MSPathPerfDir_once != -1)
    dispatch_once(&MSPathPerfDir_once, &__block_literal_global_48);
  return (id)MSPathPerfDir_path;
}

id MSPathPerfDB()
{
  if (MSPathPerfDB_onceToken != -1)
    dispatch_once(&MSPathPerfDB_onceToken, &__block_literal_global_51);
  return (id)MSPathPerfDB_path;
}

void CreateDirectoryAtPathIfNonNil(void *a1)
{
  id v1;
  void *v2;
  char v3;
  id v4;
  id v5;
  uint8_t buf[4];
  id v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
    v3 = objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v1, 1, 0, &v5);
    v4 = v5;

    if ((v3 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v7 = v1;
      v8 = 2112;
      v9 = v4;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failed to create directory at %@: %@", buf, 0x16u);
    }

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "cannot create directory at nil path", buf, 2u);
  }

}

void MSPathCreateDirectories()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  MSPlatform();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathMediaStreamDir");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  CreateDirectoryAtPathIfNonNil(v1);

  MSPathPublishDir();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CreateDirectoryAtPathIfNonNil(v2);

  MSPathSubscribeDir();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CreateDirectoryAtPathIfNonNil(v3);

  MSPathShareDir();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CreateDirectoryAtPathIfNonNil(v4);

  MSPathMMCSLibraryDir();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CreateDirectoryAtPathIfNonNil(v5);

  MSPathAlbumSharingDir();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CreateDirectoryAtPathIfNonNil(v6);

  MSPathPerfDir();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  CreateDirectoryAtPathIfNonNil(v7);

}

BOOL _pointerComparisonCallback(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

id MSSHA1HashForFileAtPath(void *a1)
{
  id v1;
  int v2;
  int v3;
  void *v4;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v1 = objc_retainAutorelease(a1);
  v2 = open((const char *)objc_msgSend(v1, "fileSystemRepresentation"), 0);
  if (v2 < 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v1;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "The file at %@ could not be opened for hashing.", (uint8_t *)&v6, 0xCu);
    }
    v4 = 0;
  }
  else
  {
    v3 = v2;
    MSSHA1HashForFileDescriptor(v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    close(v3);
  }

  return v4;
}

id MSSHA1HashForFileDescriptor(int a1)
{
  void *v2;
  unint64_t v3;
  CC_SHA1_CTX v5;
  unsigned __int8 md[20];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = malloc_type_malloc(0x3E8uLL, 0xCB57FD6EuLL);
  memset(&v5, 0, sizeof(v5));
  CC_SHA1_Init(&v5);
  lseek(a1, 0, 0);
  while (1)
  {
    v3 = read(a1, v2, 0x3E8uLL);
    if (!v3)
      break;
    if (HIDWORD(v3))
      __assert_rtn("MSSHA1HashForFileDescriptor", "MSUtilities.m", 41, "size <= UINT32_MAX");
    CC_SHA1_Update(&v5, v2, v3);
  }
  CC_SHA1_Final(md, &v5);
  free(v2);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 20);
  return (id)objc_claimAutoreleasedReturnValue();
}

id MSSHA1HashForData(void *a1)
{
  id v1;
  unint64_t v2;
  CC_LONG v3;
  id v4;
  void *v5;
  CC_SHA1_CTX v7;
  unsigned __int8 md[20];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  memset(&v7, 0, sizeof(v7));
  CC_SHA1_Init(&v7);
  v2 = objc_msgSend(v1, "length");
  if (v2 >= 0xFFFFFFFF)
    __assert_rtn("MSSHA1HashForData", "MSUtilities.m", 54, "length < UINT32_MAX");
  v3 = v2;
  v4 = objc_retainAutorelease(v1);
  CC_SHA1_Update(&v7, (const void *)objc_msgSend(v4, "bytes"), v3);
  CC_SHA1_Final(md, &v7);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

BOOL MSObjectsAreEquivalent(void *a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  _BOOL8 v6;

  v3 = a1;
  v4 = a2;
  v5 = (void *)v4;
  v6 = !(v3 | v4) || v3 && v4 && (objc_msgSend((id)v3, "isEqual:", v4) & 1) != 0;

  return v6;
}

void sub_1D3EAB1A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3EAB268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3EAB30C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3EAB3AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3EAB44C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3EAB4EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3EAB5BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3EAB65C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3EAB734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void _logRecursiveError()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v0 = 0;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Not logging any more underlying errors.", v0, 2u);
  }
}

id MSPlatform()
{
  void *v0;

  v0 = (void *)_platform;
  if (!_platform)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("MSCoreMediaStreamNotInitializedException"), CFSTR("CoreMediaStream framework has not been initialized before use."));
    v0 = (void *)_platform;
  }
  return v0;
}

id MSPURLConnectionProperties()
{
  if (MSPURLConnectionProperties_once != -1)
    dispatch_once(&MSPURLConnectionProperties_once, &__block_literal_global_812);
  return (id)MSPURLConnectionProperties_dict;
}

id MSPMMCSConnectionProperties()
{
  if (MSPMMCSConnectionProperties_once != -1)
    dispatch_once(&MSPMMCSConnectionProperties_once, &__block_literal_global_5);
  return (id)MSPMMCSConnectionProperties_dict;
}

uint64_t _protocolDidFinish(id *a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*a1, "_coreProtocolDidFinishResponse:error:", a2, a3);
}

uint64_t _protocolDidFailAuthentication(id *a1, uint64_t a2)
{
  return objc_msgSend(*a1, "_coreProtocolDidFailAuthenticationError:", a2);
}

uint64_t _protocolDidReceiveRetryAfterDate(id *a1, uint64_t a2)
{
  return objc_msgSend(*a1, "_didReceiveRetryAfterDate:", a2);
}

uint64_t _protocolDidReceiveServerSideConfigurationVersion(id *a1, uint64_t a2)
{
  return objc_msgSend(*a1, "_didFindServerSideConfigurationVersion:", a2);
}

uint64_t _protocolDidFinishUC(id *a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*a1, "_coreProtocolDidFinishUCResults:error:", a2, a3);
}

uint64_t _protocolDidFailAuthenticationUC(id *a1, uint64_t a2)
{
  return objc_msgSend(*a1, "_coreProtocolDidFailAuthenticationError:", a2);
}

uint64_t _protocolDidReceiveServerSideConfigurationVersionUC(id *a1, uint64_t a2)
{
  return objc_msgSend(*a1, "_didFindServerSideConfigurationVersion:", a2);
}

uint64_t _chunkBeginStreamCallback(id *a1, uint64_t a2, int a3, uint64_t a4)
{
  return objc_msgSend(*a1, "_chunkDidBeginStreamForPersonID:wasReset:metadata:", a2, a3 != 0, a4);
}

uint64_t _chunkAssetCollectionsCallback(id *a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*a1, "_chunkDidParseAssetCollections:forPersonID:", a3, a2);
}

uint64_t _chunkEndStreamCallback(id *a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*a1, "_chunkDidEndStreamForPersonID:ctag:", a2, a3);
}

uint64_t _chunkSubscriptionSourceGoneCallback(id *a1, uint64_t a2)
{
  return objc_msgSend(*a1, "_chunkDidFindSubscriptionGoneForPersonID:", a2);
}

uint64_t _chunkSubscriptionSourceTemporarilyUnavailableCallback(id *a1, uint64_t a2)
{
  return objc_msgSend(*a1, "_chunkDidFindSubscriptionTemporarilyUnavailableForPersonID:", a2);
}

uint64_t _finishedCallback(id *a1, uint64_t a2)
{
  return objc_msgSend(*a1, "_coreProtocolDidFinishError:", a2);
}

uint64_t _gotDataChunkCallback(id *a1, uint64_t a2)
{
  return objc_msgSend(*a1, "_coreProtocolDidGetDataChunk:", a2);
}

uint64_t _authenticationFailedCallback(id *a1, uint64_t a2)
{
  return objc_msgSend(*a1, "_coreProtocolDidFailAuthentication:", a2);
}

uint64_t _protocolDidReceiveRetryAfterDate_951(id *a1, uint64_t a2)
{
  return objc_msgSend(*a1, "_didReceiveRetryAfterDate:", a2);
}

uint64_t _didReceiveServerSideConfigurationVersion(id *a1, uint64_t a2)
{
  return objc_msgSend(*a1, "_didFindServerSideConfigurationVersion:", a2);
}

uint64_t _getFileDescriptorFromItemCallback(void *a1, uint64_t a2, _DWORD *a3, uint64_t *a4)
{
  id v7;
  void *v8;

  v7 = a1;
  v8 = v7;
  if (a3)
    *a3 = objc_msgSend(v7, "_getFileDescriptorFromItem:", a2);
  if (a4)
  {
    objc_msgSend(v8, "_getUTIFromItem:", a2);
    *a4 = objc_claimAutoreleasedReturnValue();
  }

  return 1;
}

void _getItemProgressCallback(double a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(a6, "MSVerboseDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v11;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "MMCS reported an error during download: %{public}@", (uint8_t *)&v12, 0xCu);

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    +[MMCSEngine logStringForGetItemState:](MMCSEngine, "logStringForGetItemState:", a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 134218498;
    v13 = a3;
    v14 = 2114;
    v15 = v10;
    v16 = 2048;
    v17 = a1;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "MMCS downloading callback for itemID: %llu state: %{public}@ progress: %.2f", (uint8_t *)&v12, 0x20u);

  }
}

void _getItemDoneCallback(void *a1, uint64_t a2, uint64_t a3, const char *a4, void *a5)
{
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(a5, "MSVerboseDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v13;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "MMCS reported an error: %{public}@", (uint8_t *)&v14, 0xCu);

    if (a4)
      goto LABEL_4;
LABEL_6:
    v11 = a1;
    objc_msgSend(v11, "_getItemDone:path:error:", a2, 0, a5);
    goto LABEL_7;
  }
  if (!a4)
    goto LABEL_6;
LABEL_4:
  v9 = (void *)MEMORY[0x1E0CB3620];
  v10 = a1;
  objc_msgSend(v9, "defaultManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFileSystemRepresentation:length:", a4, strlen(a4));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_getItemDone:path:error:", a2, v12, a5);

LABEL_7:
}

void _putItemProgressCallback(double a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(a7, "MSVerboseDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v12;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "MMCS reported an error during upload: %{public}@", (uint8_t *)&v13, 0xCu);

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    +[MMCSEngine logStringForPutItemState:](MMCSEngine, "logStringForPutItemState:", a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 134218498;
    v14 = a3;
    v15 = 2114;
    v16 = v11;
    v17 = 2048;
    v18 = a1;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "MMCS uploading callback for itemID: %llu state: %{public}@ progress: %.2f", (uint8_t *)&v13, 0x20u);

  }
}

uint64_t _putItemDoneCallback(void *a1, const char *a2)
{
  return objc_msgSend(a1, "_putItemDone:putReceipt:error:", a2);
}

void MSPSPCSendMetadataAsync(_QWORD *a1, uint64_t a2, const __CFDictionary *a3, CFArrayRef theArray)
{
  uint64_t Count;
  const __CFAllocator *v5;
  CFIndex v6;
  const CFDictionaryKeyCallBacks *v7;
  const CFDictionaryValueCallBacks *v8;
  __CFDictionary *v9;
  const __CFDictionary *ValueAtIndex;
  const void *Value;
  const void *v12;
  const __CFDictionary *v13;
  const __CFArray *v14;
  uint64_t v15;
  __CFArray *v16;
  CFIndex i;
  const __CFDictionary *v18;
  __CFDictionary *v19;
  __CFDictionary *v20;
  __CFDictionary *v21;
  CFDataRef v22;
  const __CFData *v23;
  uint64_t v27;
  __CFArray *Mutable;
  __CFDictionary *theDict;
  CFErrorRef error;
  uint8_t buf[4];
  CFErrorRef v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  a1[6] = 0;
  a1[7] = _didFinish;
  a1[8] = _didFailAuthentication;
  a1[9] = _didReceiveServerSideConfigurationVersion_1357;
  a1[10] = _didReceiveRetryAfter;
  Count = CFArrayGetCount(theArray);
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], Count, MEMORY[0x1E0C9B378]);
  v27 = Count;
  if (Count >= 1)
  {
    v6 = 0;
    v7 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
    v8 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
    do
    {
      v9 = CFDictionaryCreateMutable(v5, 0, v7, v8);
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v6);
      if (CFDictionaryContainsKey(ValueAtIndex, CFSTR("fileName")))
      {
        Value = CFDictionaryGetValue(ValueAtIndex, CFSTR("fileName"));
        CFDictionarySetValue(v9, CFSTR("filename"), Value);
      }
      if (CFDictionaryContainsKey(ValueAtIndex, CFSTR("collId")))
      {
        v12 = CFDictionaryGetValue(ValueAtIndex, CFSTR("collId"));
        CFDictionarySetValue(v9, CFSTR("assetcollid"), v12);
      }
      v13 = (const __CFDictionary *)CFDictionaryGetValue(ValueAtIndex, CFSTR("masterAsset"));
      _insertMessageAsset(v9, v13);
      if (CFDictionaryContainsKey(ValueAtIndex, CFSTR("derivedAssets")))
      {
        theDict = v9;
        v14 = (const __CFArray *)CFDictionaryGetValue(ValueAtIndex, CFSTR("derivedAssets"));
        v15 = CFArrayGetCount(v14);
        v16 = CFArrayCreateMutable(v5, v15, MEMORY[0x1E0C9B378]);
        if (v15 >= 1)
        {
          for (i = 0; i != v15; ++i)
          {
            v18 = (const __CFDictionary *)CFArrayGetValueAtIndex(v14, i);
            v19 = CFDictionaryCreateMutable(v5, 0, v7, v8);
            _insertMessageAsset(v19, v18);
            CFArrayAppendValue(v16, v19);
            CFRelease(v19);
          }
        }
        v9 = theDict;
        if (CFArrayGetCount(v16))
          CFDictionaryAddValue(theDict, CFSTR("derivatives"), v16);
        CFRelease(v16);
      }
      CFArrayAppendValue(Mutable, v9);
      CFRelease(v9);
      ++v6;
    }
    while (v6 != v27);
  }
  if (!Mutable)
    __assert_rtn("MSPSPCSendMetadataAsync", "MSPublishStreamsProtocolCore.m", 44, "messageAssetCollectionsArray");
  v20 = CFDictionaryCreateMutable(v5, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!v20)
    __assert_rtn("MSPSPCSendMetadataAsync", "MSPublishStreamsProtocolCore.m", 47, "messageDict");
  v21 = v20;
  CFDictionaryAddValue(v20, CFSTR("assets"), Mutable);
  CFRelease(Mutable);
  error = 0;
  v22 = CFPropertyListCreateData(v5, v21, kCFPropertyListXMLFormat_v1_0, 0, &error);
  if (v22)
  {
    v23 = v22;
    CFRelease(v21);
    MSSPCStartHTTPTransaction((uint64_t)a1, (uint64_t)CFSTR("POST"), a2, a3, v23, 1, 0);
    CFRelease(v23);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v33 = error;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to serialize metadata: %{public}@", buf, 0xCu);
    }
    if (error)
      CFRelease(error);
    CFRelease(v21);
    MSSPCStartHTTPTransaction((uint64_t)a1, (uint64_t)CFSTR("POST"), a2, a3, 0, 1, 0);
  }
}

void _didFinish(uint64_t a1, CFDataRef theData, __CFError *a3)
{
  CFPropertyListRef v6;
  BOOL v7;
  CFErrorRef v8;
  CFTypeID v9;
  CFErrorRef error;

  if (theData && CFDataGetLength(theData))
  {
    error = 0;
    v6 = CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], theData, 0, 0, &error);
    if (error)
      v7 = a3 == 0;
    else
      v7 = 0;
    if (v7)
      v8 = error;
    else
      v8 = a3;
    if (error)
    {
      if (a3)
      {
        CFRelease(error);
        v8 = a3;
      }
    }
    if (v6)
    {
      v9 = CFGetTypeID(v6);
      if (v9 == CFDictionaryGetTypeID())
      {
        (*(void (**)(uint64_t, CFPropertyListRef, CFErrorRef))(a1 + 128))(a1, v6, v8);
        CFRelease(v6);
        return;
      }
      CFRelease(v6);
    }
    (*(void (**)(uint64_t, _QWORD, CFErrorRef))(a1 + 128))(a1, 0, v8);
  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, __CFError *))(a1 + 128))(a1, 0, a3);
  }
}

uint64_t _didFailAuthentication(uint64_t result)
{
  uint64_t (*v1)(void);

  v1 = *(uint64_t (**)(void))(result + 136);
  if (v1)
    return v1();
  return result;
}

uint64_t _didReceiveRetryAfter(uint64_t result)
{
  uint64_t (*v1)(void);

  v1 = *(uint64_t (**)(void))(result + 152);
  if (v1)
    return v1();
  return result;
}

uint64_t _didReceiveServerSideConfigurationVersion_1357(uint64_t result)
{
  uint64_t (*v1)(void);

  v1 = *(uint64_t (**)(void))(result + 144);
  if (v1)
    return v1();
  return result;
}

void _insertMessageAsset(__CFDictionary *a1, CFDictionaryRef theDict)
{
  const __CFData *Value;
  CFStringRef v5;
  CFStringRef v6;
  const void *v7;
  int v8;
  CFAllocatorRef *v9;
  const __CFNumber *v10;
  CFStringRef v11;
  CFStringRef v12;
  const __CFDictionary *v13;
  const __CFNumber *v14;
  CFStringRef v15;
  CFStringRef v16;
  const __CFNumber *v17;
  CFStringRef v18;
  CFStringRef v19;
  const __CFNumber *v20;
  CFStringRef v21;
  CFStringRef v22;
  const __CFData *v23;
  CFStringRef v24;
  CFStringRef v25;
  const void *v26;
  double v27;
  CFStringRef v28;
  const void *v29;
  double v30;
  CFStringRef v31;
  const void *v32;
  const void *v33;
  const void *v34;
  const void *v35;
  const void *v36;
  const void *v37;
  const __CFNumber *v38;
  CFStringRef v39;
  CFStringRef v40;
  const __CFNumber *v41;
  CFStringRef v42;
  CFStringRef v43;
  uint64_t valuePtr;

  if (CFDictionaryContainsKey(theDict, CFSTR("fileHash")))
  {
    Value = (const __CFData *)CFDictionaryGetValue(theDict, CFSTR("fileHash"));
    v5 = MSSPCCreateHexStringFromData(Value);
    if (v5)
    {
      v6 = v5;
      CFDictionarySetValue(a1, CFSTR("checksum"), v5);
      CFRelease(v6);
    }
  }
  if (CFDictionaryContainsKey(theDict, CFSTR("type")))
  {
    v7 = CFDictionaryGetValue(theDict, CFSTR("type"));
    CFDictionarySetValue(a1, CFSTR("type"), v7);
  }
  v8 = CFDictionaryContainsKey(theDict, CFSTR("protocolFileSize"));
  v9 = (CFAllocatorRef *)MEMORY[0x1E0C9AE00];
  if (v8)
  {
    v10 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("protocolFileSize"));
    valuePtr = 0;
    CFNumberGetValue(v10, kCFNumberLongLongType, &valuePtr);
    v11 = CFStringCreateWithFormat(*v9, 0, CFSTR("%llu"), valuePtr);
    if (v11)
    {
      v12 = v11;
      CFDictionarySetValue(a1, CFSTR("size"), v11);
      CFRelease(v12);
    }
  }
  if (CFDictionaryContainsKey(theDict, CFSTR("metadata")))
  {
    v13 = (const __CFDictionary *)CFDictionaryGetValue(theDict, CFSTR("metadata"));
    if (CFDictionaryContainsKey(v13, CFSTR("fileSize")))
    {
      v14 = (const __CFNumber *)CFDictionaryGetValue(v13, CFSTR("fileSize"));
      valuePtr = 0;
      CFNumberGetValue(v14, kCFNumberLongLongType, &valuePtr);
      v15 = CFStringCreateWithFormat(*v9, 0, CFSTR("%llu"), valuePtr);
      if (v15)
      {
        v16 = v15;
        CFDictionarySetValue(a1, CFSTR("bytecount"), v15);
        CFRelease(v16);
      }
    }
    if (CFDictionaryContainsKey(v13, CFSTR("pixelWidth")))
    {
      v17 = (const __CFNumber *)CFDictionaryGetValue(v13, CFSTR("pixelWidth"));
      valuePtr = 0;
      CFNumberGetValue(v17, kCFNumberLongLongType, &valuePtr);
      v18 = CFStringCreateWithFormat(*v9, 0, CFSTR("%llu"), valuePtr);
      if (v18)
      {
        v19 = v18;
        CFDictionarySetValue(a1, CFSTR("width"), v18);
        CFRelease(v19);
      }
    }
    if (CFDictionaryContainsKey(v13, CFSTR("pixelHeight")))
    {
      v20 = (const __CFNumber *)CFDictionaryGetValue(v13, CFSTR("pixelHeight"));
      valuePtr = 0;
      CFNumberGetValue(v20, kCFNumberLongLongType, &valuePtr);
      v21 = CFStringCreateWithFormat(*v9, 0, CFSTR("%llu"), valuePtr);
      if (v21)
      {
        v22 = v21;
        CFDictionarySetValue(a1, CFSTR("height"), v21);
        CFRelease(v22);
      }
    }
    if (CFDictionaryContainsKey(v13, CFSTR("SHA1")))
    {
      v23 = (const __CFData *)CFDictionaryGetValue(v13, CFSTR("SHA1"));
      v24 = MSSPCCreateHexStringFromData(v23);
      if (v24)
      {
        v25 = v24;
        CFDictionarySetValue(a1, CFSTR("sha1"), v24);
        CFRelease(v25);
      }
    }
    if (CFDictionaryContainsKey(v13, CFSTR("dateContentModified")))
    {
      v26 = CFDictionaryGetValue(v13, CFSTR("dateContentModified"));
      v27 = MEMORY[0x1D8255638](v26);
      v28 = CFStringCreateWithFormat(0, 0, CFSTR("%lf"), *(_QWORD *)&v27);
      CFDictionarySetValue(a1, CFSTR("dateContentModified"), v28);
      CFRelease(v28);
    }
    if (CFDictionaryContainsKey(v13, CFSTR("dateContentCreated")))
    {
      v29 = CFDictionaryGetValue(v13, CFSTR("dateContentCreated"));
      v30 = MEMORY[0x1D8255638](v29);
      v31 = CFStringCreateWithFormat(0, 0, CFSTR("%lf"), *(_QWORD *)&v30);
      CFDictionarySetValue(a1, CFSTR("dateContentCreated"), v31);
      CFRelease(v31);
    }
    if (CFDictionaryContainsKey(v13, CFSTR("sourceLibraryID")))
    {
      v32 = CFDictionaryGetValue(v13, CFSTR("sourceLibraryID"));
      CFDictionarySetValue(a1, CFSTR("sourceLibraryID"), v32);
    }
    if (CFDictionaryContainsKey(v13, CFSTR("sourceItemID")))
    {
      v33 = CFDictionaryGetValue(v13, CFSTR("sourceItemID"));
      CFDictionarySetValue(a1, CFSTR("sourceItemID"), v33);
    }
    if (CFDictionaryContainsKey(v13, CFSTR("sourceContainerType")))
    {
      v34 = CFDictionaryGetValue(v13, CFSTR("sourceContainerType"));
      CFDictionarySetValue(a1, CFSTR("sourceContainerType"), v34);
    }
    if (CFDictionaryContainsKey(v13, CFSTR("sourceContainerID")))
    {
      v35 = CFDictionaryGetValue(v13, CFSTR("sourceContainerID"));
      CFDictionarySetValue(a1, CFSTR("sourceContainerID"), v35);
    }
    if (CFDictionaryContainsKey(v13, CFSTR("sourceContainerDisplayName")))
    {
      v36 = CFDictionaryGetValue(v13, CFSTR("sourceContainerDisplayName"));
      CFDictionarySetValue(a1, CFSTR("sourceContainerDisplayName"), v36);
    }
    if (CFDictionaryContainsKey(v13, CFSTR("deviceDisplayName")))
    {
      v37 = CFDictionaryGetValue(v13, CFSTR("deviceDisplayName"));
      CFDictionarySetValue(a1, CFSTR("deviceDisplayName"), v37);
    }
    if (CFDictionaryContainsKey(v13, CFSTR("rasterToDisplayRotationAngle")))
    {
      v38 = (const __CFNumber *)CFDictionaryGetValue(v13, CFSTR("rasterToDisplayRotationAngle"));
      valuePtr = 0;
      CFNumberGetValue(v38, kCFNumberLongLongType, &valuePtr);
      v39 = CFStringCreateWithFormat(*v9, 0, CFSTR("%llu"), valuePtr);
      if (v39)
      {
        v40 = v39;
        CFDictionarySetValue(a1, CFSTR("rasterToDisplayRotationAngle"), v39);
        CFRelease(v40);
      }
    }
    if (CFDictionaryContainsKey(v13, CFSTR("sourceiCloudPhotoLibraryEnabled")))
    {
      v41 = (const __CFNumber *)CFDictionaryGetValue(v13, CFSTR("sourceiCloudPhotoLibraryEnabled"));
      valuePtr = 0;
      CFNumberGetValue(v41, kCFNumberLongLongType, &valuePtr);
      v42 = CFStringCreateWithFormat(*v9, 0, CFSTR("%llu"), valuePtr);
      if (v42)
      {
        v43 = v42;
        CFDictionarySetValue(a1, CFSTR("sourceiCloudPhotoLibraryEnabled"), v42);
        CFRelease(v43);
      }
    }
  }
}

void MSPSPCUCSendUploadCompleteAsync(_QWORD *a1, uint64_t a2, const __CFDictionary *a3, CFArrayRef theArray)
{
  uint64_t Count;
  CFMutableArrayRef Mutable;
  __CFArray *v9;
  const __CFArray *v10;
  uint64_t v11;
  CFIndex v12;
  const CFDictionaryKeyCallBacks *v13;
  const CFDictionaryValueCallBacks *v14;
  const __CFDictionary *ValueAtIndex;
  CFMutableDictionaryRef v16;
  __CFDictionary *v17;
  const void *Value;
  const void *v19;
  CFMutableArrayRef v20;
  __CFArray *v21;
  const __CFDictionary *v22;
  const __CFDictionary *v23;
  CFMutableDictionaryRef v24;
  __CFDictionary *v25;
  const __CFData *v26;
  CFStringRef v27;
  CFStringRef v28;
  const __CFDictionary *v29;
  const void *v30;
  CFStringRef v31;
  const void *v32;
  const __CFArray *v33;
  const __CFArray *v34;
  CFIndex v35;
  CFIndex v36;
  CFIndex i;
  const __CFDictionary *v38;
  CFMutableDictionaryRef v39;
  __CFDictionary *v40;
  const CFDictionaryKeyCallBacks *v41;
  const __CFData *v42;
  CFStringRef v43;
  CFStringRef v44;
  const __CFDictionary *v45;
  const void *v46;
  CFStringRef v47;
  const void *v48;
  CFDataRef v49;
  const __CFData *v50;
  uint64_t v51;
  uint64_t v52;
  const __CFDictionary *v53;
  uint64_t v54;
  __CFArray *v55;
  __CFDictionary *theDict;
  const __CFAllocator *alloc;
  CFErrorRef error;
  uint8_t buf[4];
  CFErrorRef v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  a1[6] = 0;
  a1[7] = _didFinishUC;
  a1[8] = _didFailAuthenticationUC;
  a1[9] = _didReceiveServerSideConfigurationVersionUC;
  Count = CFArrayGetCount(theArray);
  Mutable = CFArrayCreateMutable(0, Count, MEMORY[0x1E0C9B378]);
  if (!Mutable)
    __assert_rtn("MSPSPCUCSendUploadCompleteAsync", "MSPublishStreamsProtocolCore.m", 226, "outputArray");
  v9 = Mutable;
  v51 = (uint64_t)a1;
  v52 = a2;
  v53 = a3;
  alloc = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v10 = theArray;
  if (Count >= 1)
  {
    v11 = Count;
    v12 = 0;
    v13 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
    v14 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
    v54 = Count;
    v55 = Mutable;
    do
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v10, v12);
      v16 = CFDictionaryCreateMutable(0, 0, v13, v14);
      if (v16)
      {
        v17 = v16;
        Value = CFDictionaryGetValue(ValueAtIndex, CFSTR("collId"));
        CFDictionarySetValue(v17, CFSTR("assetcollid"), Value);
        v19 = CFDictionaryGetValue(ValueAtIndex, CFSTR("mediaAssetType"));
        if (v19)
          CFDictionarySetValue(v17, CFSTR("mediaAssetType"), v19);
        v20 = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
        if (v20)
        {
          v21 = v20;
          theDict = v17;
          v22 = (const __CFDictionary *)CFDictionaryGetValue(ValueAtIndex, CFSTR("masterAsset"));
          if (v22)
          {
            v23 = v22;
            v24 = CFDictionaryCreateMutable(0, 0, v13, v14);
            if (v24)
            {
              v25 = v24;
              v26 = (const __CFData *)CFDictionaryGetValue(v23, CFSTR("fileHash"));
              v27 = MSSPCCreateHexStringFromData(v26);
              if (v27)
              {
                v28 = v27;
                CFDictionarySetValue(v25, CFSTR("checksum"), v27);
                CFRelease(v28);
              }
              v29 = (const __CFDictionary *)CFDictionaryGetValue(v23, CFSTR("metadata"));
              if (v29)
              {
                v30 = CFDictionaryGetValue(v29, CFSTR("fileSize"));
                if (v30)
                {
                  v31 = CFStringCreateWithFormat(alloc, 0, CFSTR("%@"), v30);
                  CFDictionarySetValue(v25, CFSTR("size"), v31);
                  CFRelease(v31);
                }
              }
              v32 = CFDictionaryGetValue(v23, CFSTR("MMCSReceipt"));
              if (v32)
              {
                CFDictionarySetValue(v25, CFSTR("receipt"), v32);
                CFArrayAppendValue(v21, v25);
              }
              CFRelease(v25);
            }
          }
          v33 = (const __CFArray *)CFDictionaryGetValue(ValueAtIndex, CFSTR("derivedAssets"));
          if (v33)
          {
            v34 = v33;
            v35 = CFArrayGetCount(v33);
            if (v35 >= 1)
            {
              v36 = v35;
              for (i = 0; i != v36; ++i)
              {
                v38 = (const __CFDictionary *)CFArrayGetValueAtIndex(v34, i);
                v39 = CFDictionaryCreateMutable(0, 0, v13, v14);
                if (v39)
                {
                  v40 = v39;
                  v41 = v13;
                  v42 = (const __CFData *)CFDictionaryGetValue(v38, CFSTR("fileHash"));
                  v43 = MSSPCCreateHexStringFromData(v42);
                  if (v43)
                  {
                    v44 = v43;
                    CFDictionarySetValue(v40, CFSTR("checksum"), v43);
                    CFRelease(v44);
                  }
                  v45 = (const __CFDictionary *)CFDictionaryGetValue(v38, CFSTR("metadata"));
                  if (v45)
                  {
                    v46 = CFDictionaryGetValue(v45, CFSTR("fileSize"));
                    if (v46)
                    {
                      v47 = CFStringCreateWithFormat(alloc, 0, CFSTR("%@"), v46);
                      CFDictionarySetValue(v40, CFSTR("size"), v47);
                      CFRelease(v47);
                    }
                  }
                  v48 = CFDictionaryGetValue(v38, CFSTR("MMCSReceipt"));
                  if (v48)
                  {
                    CFDictionarySetValue(v40, CFSTR("receipt"), v48);
                    CFArrayAppendValue(v21, v40);
                  }
                  CFRelease(v40);
                  v13 = v41;
                }
              }
            }
          }
          v17 = theDict;
          CFDictionarySetValue(theDict, CFSTR("assets"), v21);
          CFRelease(v21);
          v9 = v55;
          v10 = theArray;
          v11 = v54;
        }
        CFArrayAppendValue(v9, v17);
        CFRelease(v17);
      }
      ++v12;
    }
    while (v12 != v11);
  }
  error = 0;
  v49 = CFPropertyListCreateData(alloc, v9, kCFPropertyListXMLFormat_v1_0, 0, &error);
  if (v49)
  {
    v50 = v49;
    CFRelease(v9);
    MSSPCStartHTTPTransaction(v51, (uint64_t)CFSTR("POST"), v52, v53, v50, 1, 0);
    CFRelease(v50);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v61 = error;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to serialize upload complete data: %{public}@", buf, 0xCu);
    }
    if (error)
      CFRelease(error);
    CFRelease(v9);
    MSSPCStartHTTPTransaction(v51, (uint64_t)CFSTR("POST"), v52, v53, 0, 1, 0);
  }
}

void _didFinishUC(uint64_t a1, CFDataRef theData, __CFError *a3)
{
  const void *v4;
  CFPropertyListRef v6;
  CFTypeID v7;
  CFErrorRef error;

  v4 = 0;
  error = a3;
  if (!theData || a3)
    goto LABEL_8;
  if (CFDataGetLength(theData))
  {
    v6 = CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], theData, 0, 0, &error);
    v4 = v6;
    if (!v6)
      goto LABEL_8;
    v7 = CFGetTypeID(v6);
    if (v7 == CFDictionaryGetTypeID())
      goto LABEL_8;
    CFRelease(v4);
  }
  v4 = 0;
LABEL_8:
  (*(void (**)(uint64_t, const void *, CFErrorRef))(a1 + 128))(a1, v4, error);
  if (v4)
    CFRelease(v4);
}

uint64_t _didFailAuthenticationUC(uint64_t result)
{
  uint64_t (*v1)(void);

  v1 = *(uint64_t (**)(void))(result + 136);
  if (v1)
    return v1();
  return result;
}

uint64_t _didReceiveServerSideConfigurationVersionUC(uint64_t result)
{
  uint64_t (*v1)(void);

  v1 = *(uint64_t (**)(void))(result + 144);
  if (v1)
    return v1();
  return result;
}

void MSSSPCGetMetadataAsync(_QWORD *a1, uint64_t a2, const __CFDictionary *a3, const void *a4)
{
  const __CFData *v8;
  const __CFData *v9;
  CFErrorRef error;
  uint8_t buf[4];
  CFErrorRef v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  a1[13] = 0;
  a1[23] = 0;
  a1[24] = 0;
  _resetContext(a1);
  a1[6] = _didReceiveData;
  a1[7] = _didFinish_1430;
  a1[8] = _didFailAuthentication_1431;
  a1[9] = _didReceiveServerSideConfigurationVersion_1433;
  a1[10] = _didReceiveRetryAfter_1432;
  error = 0;
  v8 = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a4, kCFPropertyListXMLFormat_v1_0, 0, &error);
  if (v8)
  {
    v9 = v8;
    MSSPCStartHTTPTransaction((uint64_t)a1, (uint64_t)CFSTR("POST"), a2, a3, v8, 0, 1);
    CFRelease(v9);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v12 = error;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to serialize get metadata request data: %{public}@", buf, 0xCu);
    }
    if (error)
      CFRelease(error);
    MSSPCStartHTTPTransaction((uint64_t)a1, (uint64_t)CFSTR("POST"), a2, a3, 0, 0, 1);
  }
}

void _resetContext(_QWORD *a1)
{
  const void *v2;
  const void *v3;

  a1[22] = 0;
  a1[25] = 0;
  v2 = (const void *)a1[23];
  if (v2)
  {
    CFRelease(v2);
    a1[23] = 0;
  }
  v3 = (const void *)a1[24];
  if (v3)
  {
    CFRelease(v3);
    a1[24] = 0;
  }
}

uint64_t _didReceiveData(uint64_t a1, CFDataRef theData, CFErrorRef *a3)
{
  CFIndex Length;
  const UInt8 *BytePtr;
  const UInt8 *v8;
  const UInt8 *v9;
  const __CFAllocator *v10;
  int v11;
  const __CFData *Mutable;
  int v14;
  const UInt8 *v16;
  CFIndex v17;
  unint64_t v18;
  int v19;
  unsigned __int8 v20;
  CFErrorRef v21;
  int v22;
  __CFData *v24;
  unint64_t v25;
  CFIndex v26;
  CFIndex v27;
  const void *v28;
  const void *v29;
  uint64_t result;
  uint8_t buf[4];
  CFErrorRef v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  Length = CFDataGetLength(theData);
  BytePtr = CFDataGetBytePtr(theData);
  if (!Length)
    return 1;
  v8 = BytePtr;
  v9 = &BytePtr[Length];
  v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  while (2)
  {
    switch(*(_QWORD *)(a1 + 176))
    {
      case 0:
        v11 = *v8;
        if (v11 == 13 || v11 == 10)
          goto LABEL_41;
        *(_QWORD *)(a1 + 176) = 1;
        goto LABEL_50;
      case 1:
        Mutable = *(const __CFData **)(a1 + 184);
        if (!Mutable)
        {
          Mutable = CFDataCreateMutable(v10, 10);
          *(_QWORD *)(a1 + 184) = Mutable;
        }
        v14 = *v8;
        if (v14 == 10 || v14 == 13)
        {
          v16 = CFDataGetBytePtr(Mutable);
          v17 = CFDataGetLength(Mutable);
          if (v17)
          {
            v18 = 0;
            while (1)
            {
              v19 = *v16;
              v20 = v19 - 48;
              if ((v19 - 48) >= 0xA)
              {
                if ((v19 - 65) > 5)
                {
                  if ((v19 - 97) > 5)
                  {
                    v21 = MSPCUCreateError(CFSTR("MSSubscribeStreamsProtocolCoreErrorDomain"), 2, CFSTR("ERROR_GET_CORE_CONNECTION_INVALID_CHUNK_SIZE"));
                    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138543362;
                      v32 = v21;
                      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
                    }
                    goto LABEL_45;
                  }
                  v20 = v19 - 87;
                }
                else
                {
                  v20 = v19 - 55;
                }
              }
              ++v16;
              v18 = v20 | (16 * v18);
              if (!--v17)
              {
                v21 = 0;
                goto LABEL_46;
              }
            }
          }
          v21 = 0;
LABEL_45:
          v18 = 0;
LABEL_46:
          *(_QWORD *)(a1 + 200) = v18;
          v29 = *(const void **)(a1 + 184);
          if (v29)
          {
            CFRelease(v29);
            *(_QWORD *)(a1 + 184) = 0;
          }
          if (v21)
            goto LABEL_53;
          *(_QWORD *)(a1 + 176) = 2;
LABEL_50:
          if (v8 == v9)
            return 1;
          continue;
        }
        if (CFDataGetLength(Mutable) <= 9)
        {
          CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 184), v8, 1);
LABEL_41:
          ++v8;
          goto LABEL_50;
        }
        v21 = MSPCUCreateError(CFSTR("MSSubscribeStreamsProtocolCoreErrorDomain"), 2, CFSTR("ERROR_GET_CORE_CONNECTION_INVALID_CHUNK_SIZE"));
        if (!v21)
          return 1;
LABEL_53:
        if (a3)
        {
          result = 0;
          *a3 = v21;
        }
        else
        {
          CFRelease(v21);
          return 0;
        }
        return result;
      case 2:
        v22 = *v8;
        if (v22 == 13 || v22 == 10)
          goto LABEL_41;
        *(_QWORD *)(a1 + 176) = 3;
        goto LABEL_50;
      case 3:
        v24 = *(__CFData **)(a1 + 192);
        v25 = *(_QWORD *)(a1 + 200);
        if (!v24)
        {
          v24 = CFDataCreateMutable(v10, v25);
          *(_QWORD *)(a1 + 192) = v24;
          v25 = *(_QWORD *)(a1 + 200);
        }
        if (v25 >= v9 - v8)
          v26 = v9 - v8;
        else
          v26 = v25;
        CFDataAppendBytes(v24, v8, v26);
        v8 += v26;
        v27 = *(_QWORD *)(a1 + 200) - v26;
        *(_QWORD *)(a1 + 200) = v27;
        if (!v27)
        {
          (*(void (**)(uint64_t, _QWORD))(a1 + 136))(a1, *(_QWORD *)(a1 + 192));
          v28 = *(const void **)(a1 + 192);
          if (v28)
          {
            CFRelease(v28);
            *(_QWORD *)(a1 + 192) = 0;
          }
          *(_QWORD *)(a1 + 176) = 0;
        }
        goto LABEL_50;
      default:
        __assert_rtn("_didReceiveData", "MSSubscribeStreamProtocolCore.m", 189, "0");
    }
  }
}

void _didFinish_1430(uint64_t a1, int a2, __CFError *cf)
{
  CFErrorRef v4;

  if (cf)
  {
    v4 = cf;
    CFRetain(cf);
  }
  else if (*(_QWORD *)(a1 + 200))
  {
    v4 = MSPCUCreateError(CFSTR("MSSubscribeStreamsProtocolCoreErrorDomain"), 4, CFSTR("ERROR_GET_CORE_CONNECTION_BLOCK_SHORT"));
  }
  else
  {
    v4 = 0;
  }
  _resetContext((_QWORD *)a1);
  (*(void (**)(uint64_t, CFErrorRef))(a1 + 128))(a1, v4);
  if (v4)
    CFRelease(v4);
}

void _didFailAuthentication_1431(_QWORD *a1, uint64_t a2)
{
  void (*v4)(_QWORD *, uint64_t);

  _resetContext(a1);
  v4 = (void (*)(_QWORD *, uint64_t))a1[18];
  if (v4)
    v4(a1, a2);
}

void _didReceiveRetryAfter_1432(_QWORD *a1, uint64_t a2)
{
  void (*v4)(_QWORD *, uint64_t);

  _resetContext(a1);
  v4 = (void (*)(_QWORD *, uint64_t))a1[20];
  if (v4)
    v4(a1, a2);
}

uint64_t _didReceiveServerSideConfigurationVersion_1433(uint64_t result)
{
  uint64_t (*v1)(void);

  v1 = *(uint64_t (**)(void))(result + 152);
  if (v1)
    return v1();
  return result;
}

double MSSSPCChunkParsingInitialize(uint64_t a1)
{
  double result;

  *(_DWORD *)(a1 + 80) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  return result;
}

void _resetChunkContext(_QWORD *a1)
{
  const void *v2;
  const void *v3;
  const void *v4;
  const void *v5;

  v2 = (const void *)a1[6];
  if (v2)
  {
    CFRelease(v2);
    a1[6] = 0;
  }
  v3 = (const void *)a1[7];
  if (v3)
  {
    CFRelease(v3);
    a1[7] = 0;
  }
  v4 = (const void *)a1[8];
  if (v4)
  {
    CFRelease(v4);
    a1[8] = 0;
  }
  v5 = (const void *)a1[9];
  if (v5)
  {
    CFRelease(v5);
    a1[9] = 0;
  }
}

uint64_t MSSSPCChunkParsingParseNextChunk(_QWORD *a1, const __CFData *a2, CFErrorRef *a3)
{
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  __CFError *v8;
  uint64_t result;
  CFTypeID v10;
  CFErrorRef error;
  uint8_t buf[4];
  __CFError *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Parsing next chunk.", buf, 2u);
  }
  error = 0;
  v6 = (const __CFDictionary *)CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2, 0, 0, &error);
  v7 = v6;
  v8 = error;
  if (error)
  {
    if (!v6)
      goto LABEL_5;
    goto LABEL_14;
  }
  if (v6)
  {
    v10 = CFGetTypeID(v6);
    if (v10 == CFDictionaryGetTypeID())
    {
      _performNextStateAction((uint64_t)a1, v7, a3);
      goto LABEL_14;
    }
  }
  v8 = MSPCUCreateError(CFSTR("MSSubscribeStreamsProtocolCoreErrorDomain"), 5, CFSTR("ERROR_GET_CORE_CONNECTION_BAD_CHUNK_TYPE"));
  error = v8;
  if (v7)
  {
LABEL_14:
    CFRelease(v7);
    v8 = error;
    if (error)
      goto LABEL_6;
    return 1;
  }
LABEL_5:
  if (!v8)
    return 1;
LABEL_6:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v8;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error encountered during chunk parsing: %{public}@", buf, 0xCu);
  }
  _resetChunkContext(a1);
  if (a3)
  {
    result = 0;
    *a3 = error;
  }
  else
  {
    CFRelease(error);
    return 0;
  }
  return result;
}

void _performNextStateAction(uint64_t a1, const __CFDictionary *a2, _QWORD *a3)
{
  const void *v6;
  const __CFString *v7;
  CFTypeID v8;
  CFTypeRef v9;
  CFTypeID v10;
  uint64_t v11;
  int v12;
  CFTypeID v13;
  const void *v14;
  const __CFString *v15;
  CFTypeID v16;
  CFTypeID v17;
  CFTypeRef v18;
  CFTypeID v19;
  const void *v20;
  __CFDictionary *Mutable;
  const void *v22;
  CFTypeID v23;
  const void *v24;
  const void *v25;
  const void *v26;
  CFTypeID v27;
  CFTypeID v28;
  __CFArray *v29;
  const __CFString *v30;
  CFTypeRef v31;
  CFTypeRef v32;
  CFTypeRef v33;
  CFTypeRef v34;
  uint8_t buf[8];
  CFTypeRef cf1;
  CFTypeRef cf;
  _BYTE value[12];
  __int16 v39;
  CFTypeRef v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v31 = 0;
  switch(*(_DWORD *)(a1 + 80))
  {
    case 0:
      goto LABEL_44;
    case 1:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)value = 138543362;
        *(_QWORD *)&value[4] = a2;
        _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "_parseSharingStatus: %{public}@", value, 0xCu);
      }
      *(_QWORD *)value = 0;
      CFDictionaryGetValueIfPresent(a2, CFSTR("parttype"), (const void **)value);
      if (!*(_QWORD *)value || !CFEqual(*(CFTypeRef *)value, CFSTR("sharing-status")))
        goto LABEL_52;
      goto LABEL_40;
    case 2:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)value = 138543362;
        *(_QWORD *)&value[4] = a2;
        _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "_parseBegin: %{public}@", value, 0xCu);
      }
      *(_QWORD *)value = 0;
      CFDictionaryGetValueIfPresent(a2, CFSTR("parttype"), (const void **)value);
      if (!*(_QWORD *)value || !CFEqual(*(CFTypeRef *)value, CFSTR("stream-metadata-begin")))
        goto LABEL_52;
      cf = 0;
      v7 = CFSTR("ctag");
      CFDictionaryGetValueIfPresent(a2, CFSTR("ctag"), &cf);
      if (!cf)
        goto LABEL_19;
      v8 = CFGetTypeID(cf);
      if (v8 != CFStringGetTypeID())
        goto LABEL_41;
      v9 = cf;
      if (cf)
      {
        if (*(_QWORD *)(a1 + 64))
        {
          CFRelease(*(CFTypeRef *)(a1 + 64));
          v9 = cf;
        }
        *(_QWORD *)(a1 + 64) = CFRetain(v9);
      }
LABEL_19:
      cf1 = 0;
      v7 = CFSTR("reset");
      CFDictionaryGetValueIfPresent(a2, CFSTR("reset"), &cf1);
      if (!cf1)
        goto LABEL_69;
      v10 = CFGetTypeID(cf1);
      if (v10 == CFStringGetTypeID())
      {
        if (cf1 && CFEqual(cf1, CFSTR("1")))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Subscription stream was reset by the server.", buf, 2u);
          }
          v11 = 1;
        }
        else
        {
LABEL_69:
          v11 = 0;
        }
        *(_QWORD *)buf = 0;
        CFDictionaryGetValueIfPresent(a2, CFSTR("streamid"), (const void **)buf);
        if (*(_QWORD *)buf)
        {
          v19 = CFGetTypeID(*(CFTypeRef *)buf);
          if (v19 == CFStringGetTypeID())
          {
            v20 = *(const void **)(a1 + 72);
            if (v20)
              CFRelease(v20);
            *(_QWORD *)(a1 + 72) = CFRetain(*(CFTypeRef *)buf);
            Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
            if (CFDictionaryContainsKey(a2, CFSTR("devices")))
            {
              v22 = CFDictionaryGetValue(a2, CFSTR("devices"));
              CFDictionarySetValue(Mutable, CFSTR("devices"), v22);
            }
            (*(void (**)(uint64_t, _QWORD, uint64_t, __CFDictionary *))(a1 + 8))(a1, *(_QWORD *)buf, v11, Mutable);
            *(_DWORD *)(a1 + 80) = 3;
            if (Mutable)
              CFRelease(Mutable);
            goto LABEL_99;
          }
        }
        v30 = CFSTR("streamid");
      }
      else
      {
LABEL_41:
        v30 = v7;
      }
      v6 = MSPCUCreateError(CFSTR("MSSubscribeStreamsProtocolCoreErrorDomain"), 8, CFSTR("ERROR_GET_CORE_CONNECTION_BAD_FIELD_P_FIELD"), v30);
      goto LABEL_53;
    case 3:
      cf = 0;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)value = 138543362;
        *(_QWORD *)&value[4] = a2;
        _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "_parseAssets: %{public}@", value, 0xCu);
      }
      cf1 = 0;
      CFDictionaryGetValueIfPresent(a2, CFSTR("parttype"), &cf1);
      if (!cf1 || !CFEqual(cf1, CFSTR("asset-metadata")) && !CFEqual(cf1, CFSTR("stream-metadata-end")))
      {
        v14 = MSPCUCreateError(CFSTR("MSSubscribeStreamsProtocolCoreErrorDomain"), 7, CFSTR("ERROR_GET_CORE_CONNECTION_BAD_PART_TYPE"));
        goto LABEL_56;
      }
      if (CFEqual(cf1, CFSTR("stream-metadata-end")))
      {
        v12 = 4;
        goto LABEL_51;
      }
      *(_QWORD *)buf = 0;
      v15 = CFSTR("streamid");
      CFDictionaryGetValueIfPresent(a2, CFSTR("streamid"), (const void **)buf);
      if (!*(_QWORD *)buf)
        goto LABEL_96;
      v16 = CFGetTypeID(*(CFTypeRef *)buf);
      if (v16 != CFStringGetTypeID() || !*(_QWORD *)buf || !CFEqual(*(CFTypeRef *)buf, *(CFTypeRef *)(a1 + 72)))
        goto LABEL_96;
      v34 = 0;
      v15 = CFSTR("errorcode");
      CFDictionaryGetValueIfPresent(a2, CFSTR("errorcode"), &v34);
      if (v34)
      {
        v17 = CFGetTypeID(v34);
        if (v17 != CFStringGetTypeID())
        {
LABEL_96:
          cf = MSPCUCreateError(CFSTR("MSSubscribeStreamsProtocolCoreErrorDomain"), 8, CFSTR("ERROR_GET_CORE_CONNECTION_BAD_FIELD_P_FIELD"), v15);
LABEL_97:
          v14 = cf;
          if (!cf)
            goto LABEL_99;
LABEL_98:
          v31 = v14;
LABEL_99:
          v6 = v31;
          if (!v31)
            return;
          goto LABEL_100;
        }
        v18 = v34;
        if (v34)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)value = 138543618;
            *(_QWORD *)&value[4] = *(_QWORD *)buf;
            v39 = 2114;
            v40 = v18;
            _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Stream %{public}@ is not available. Status: %{public}@", value, 0x16u);
            v18 = v34;
          }
          if (CFEqual(v18, CFSTR("404")))
            (*(void (**)(uint64_t, _QWORD))(a1 + 32))(a1, *(_QWORD *)buf);
          else
            (*(void (**)(uint64_t, _QWORD))(a1 + 40))(a1, *(_QWORD *)buf);
          goto LABEL_97;
        }
      }
      *(_QWORD *)value = 0;
      CFDictionaryGetValueIfPresent(a2, CFSTR("mmcsurl"), (const void **)value);
      if (*(_QWORD *)value)
      {
        v23 = CFGetTypeID(*(CFTypeRef *)value);
        if (v23 == CFStringGetTypeID())
        {
          v24 = *(const void **)(a1 + 48);
          if (v24)
          {
            if (CFEqual(*(CFTypeRef *)value, v24))
              goto LABEL_88;
            v25 = *(const void **)(a1 + 48);
            if (v25)
              CFRelease(v25);
          }
          *(_QWORD *)(a1 + 48) = CFRetain(*(CFTypeRef *)value);
          v26 = *(const void **)(a1 + 56);
          if (v26)
            CFRelease(v26);
          *(_QWORD *)(a1 + 56) = CFURLCreateWithString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *(CFStringRef *)value, 0);
LABEL_88:
          v33 = 0;
          v15 = CFSTR("mmcsheaders");
          CFDictionaryGetValueIfPresent(a2, CFSTR("mmcsheaders"), &v33);
          if (v33)
          {
            v27 = CFGetTypeID(v33);
            if (v27 == CFDictionaryGetTypeID())
            {
              v32 = 0;
              v15 = CFSTR("assets");
              CFDictionaryGetValueIfPresent(a2, CFSTR("assets"), &v32);
              if (v32)
              {
                v28 = CFGetTypeID(v32);
                if (v28 == CFArrayGetTypeID())
                {
                  v29 = _createAssetCollections((const __CFArray *)v32, *(const void **)(a1 + 72), (const __CFDictionary *)v33, *(const void **)(a1 + 56), &cf);
                  if (!cf)
                    (*(void (**)(uint64_t, _QWORD, __CFArray *))(a1 + 16))(a1, *(_QWORD *)buf, v29);
                  if (v29)
                    CFRelease(v29);
                  goto LABEL_97;
                }
              }
            }
          }
          goto LABEL_96;
        }
      }
      v14 = MSPCUCreateError(CFSTR("MSSubscribeStreamsProtocolCoreErrorDomain"), 8, CFSTR("ERROR_GET_CORE_CONNECTION_BAD_FIELD_P_FIELD"), CFSTR("mmcsurl"));
LABEL_56:
      if (!v14)
        goto LABEL_99;
      goto LABEL_98;
    case 4:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)value = 138543362;
        *(_QWORD *)&value[4] = a2;
        _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "_parseEnd: %{public}@", value, 0xCu);
      }
      *(_QWORD *)value = 0;
      v7 = CFSTR("streamid");
      CFDictionaryGetValueIfPresent(a2, CFSTR("streamid"), (const void **)value);
      if (!*(_QWORD *)value)
        goto LABEL_41;
      v13 = CFGetTypeID(*(CFTypeRef *)value);
      if (v13 != CFStringGetTypeID() || !*(_QWORD *)value || !CFEqual(*(CFTypeRef *)value, *(CFTypeRef *)(a1 + 72)))
        goto LABEL_41;
      (*(void (**)(uint64_t, _QWORD, _QWORD))(a1 + 24))(a1, *(_QWORD *)value, *(_QWORD *)(a1 + 64));
LABEL_40:
      *(_DWORD *)(a1 + 80) = 0;
      goto LABEL_99;
    case 5:
      _resetChunkContext((_QWORD *)a1);
      *(_DWORD *)(a1 + 80) = 0;
LABEL_44:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)value = 138543362;
        *(_QWORD *)&value[4] = a2;
        _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "_parseAny: %{public}@", value, 0xCu);
      }
      *(_QWORD *)value = 0;
      CFDictionaryGetValueIfPresent(a2, CFSTR("parttype"), (const void **)value);
      if (!*(_QWORD *)value)
        goto LABEL_52;
      if (CFEqual(*(CFTypeRef *)value, CFSTR("stream-metadata-begin")))
      {
        v12 = 2;
LABEL_51:
        *(_DWORD *)(a1 + 80) = v12;
        _performNextStateAction(a1, a2, &v31);
        goto LABEL_99;
      }
      if (CFEqual(*(CFTypeRef *)value, CFSTR("sharing-status")))
      {
        v12 = 1;
        goto LABEL_51;
      }
LABEL_52:
      v6 = MSPCUCreateError(CFSTR("MSSubscribeStreamsProtocolCoreErrorDomain"), 7, CFSTR("ERROR_GET_CORE_CONNECTION_BAD_PART_TYPE"));
LABEL_53:
      if (!v6)
        goto LABEL_99;
      v31 = v6;
LABEL_100:
      if (a3)
        *a3 = v6;
      else
        CFRelease(v6);
      return;
    default:
      v6 = MSPCUCreateError(CFSTR("MSSubscribeStreamsProtocolCoreErrorDomain"), 6, CFSTR("ERROR_GET_CORE_CONNECTION_BAD_STATE"));
      v31 = v6;
      if (!v6)
        return;
      goto LABEL_100;
  }
}

__CFArray *_createAssetCollections(const __CFArray *a1, const void *a2, const __CFDictionary *a3, const void *a4, CFTypeRef *a5)
{
  const __CFArray *v8;
  uint64_t Count;
  CFIndex v10;
  const __CFString *v11;
  const void *ValueAtIndex;
  CFTypeID v13;
  __CFDictionary *v14;
  const void *v15;
  const void *v16;
  const __CFString *v17;
  const void *v18;
  const __CFString *v19;
  CFNumberRef NumberFromString;
  CFNumberRef v21;
  __CFDictionary *v22;
  const __CFDictionary *v23;
  CFTypeRef v24;
  CFErrorRef v25;
  CFTypeID v26;
  uint64_t v27;
  CFIndex v28;
  const void *v29;
  CFTypeID v30;
  __CFDictionary *v31;
  __CFDictionary *v32;
  const void *v33;
  CFTypeRef *v35;
  const __CFArray *v36;
  CFMutableArrayRef theArray;
  __CFArray *Mutable;
  const void *v39;
  const __CFAllocator *allocator;
  CFTypeRef cf;
  void *value;
  CFTypeRef v44;
  uint8_t buf[4];
  CFTypeRef v46;
  uint64_t v47;

  v8 = a1;
  v47 = *MEMORY[0x1E0C80C00];
  v44 = 0;
  Count = CFArrayGetCount(a1);
  allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], Count, MEMORY[0x1E0C9B378]);
  if (Count < 1)
    return Mutable;
  v35 = a5;
  v10 = 0;
  v11 = CFSTR("filename");
  v36 = v8;
  v39 = a2;
  do
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v8, v10);
    v13 = CFGetTypeID(ValueAtIndex);
    if (v13 != CFDictionaryGetTypeID())
    {
      v25 = MSPCUCreateError(CFSTR("MSSubscribeStreamsProtocolCoreErrorDomain"), 8, CFSTR("ERROR_GET_CORE_CONNECTION_BAD_FIELD_P_FIELD"), CFSTR("assets"));
      v44 = v25;
      if (!v25)
        goto LABEL_50;
      v24 = v25;
      v14 = 0;
      goto LABEL_46;
    }
    v14 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (CFDictionaryContainsKey((CFDictionaryRef)ValueAtIndex, v11))
    {
      v15 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, v11);
      CFDictionarySetValue(v14, CFSTR("fileName"), v15);
    }
    if (CFDictionaryContainsKey((CFDictionaryRef)ValueAtIndex, CFSTR("assetcollid")))
    {
      v16 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("assetcollid"));
      CFDictionarySetValue(v14, CFSTR("collId"), v16);
    }
    v17 = v11;
    if (CFDictionaryContainsKey((CFDictionaryRef)ValueAtIndex, CFSTR("server-uploadeddate")))
    {
      v18 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("server-uploadeddate"));
      CFDictionarySetValue(v14, CFSTR("serverUploadedDate"), v18);
    }
    if (CFDictionaryContainsKey((CFDictionaryRef)ValueAtIndex, CFSTR("delete")))
    {
      v19 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("delete"));
      if (MSPCUNumberFormatterWithSystemLocale_once != -1)
        dispatch_once(&MSPCUNumberFormatterWithSystemLocale_once, &__block_literal_global_1896);
      NumberFromString = CFNumberFormatterCreateNumberFromString(allocator, (CFNumberFormatterRef)MSPCUNumberFormatterWithSystemLocale_nf, v19, 0, 0);
      if (NumberFromString)
      {
        v21 = NumberFromString;
        CFDictionarySetValue(v14, CFSTR("deleted"), NumberFromString);
        CFRelease(v21);
      }
    }
    v22 = _createAsset((const __CFDictionary *)ValueAtIndex, a3, a4, a2, &v44);
    v23 = v22;
    v24 = v44;
    if (v44)
    {
      if (v22)
      {
        CFRelease(v22);
LABEL_18:
        v11 = v17;
        goto LABEL_45;
      }
      v11 = v17;
LABEL_46:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v46 = v24;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Rejecting asset collection because of error: %{public}@", buf, 0xCu);
        v24 = v44;
      }
      CFRelease(v24);
      v44 = 0;
      if (v14)
        goto LABEL_49;
      goto LABEL_50;
    }
    CFDictionaryAddValue(v14, CFSTR("masterAsset"), v22);
    value = 0;
    CFDictionaryGetValueIfPresent(v23, CFSTR("fileHash"), (const void **)&value);
    if (value)
      CFDictionarySetValue(v23, CFSTR("masterAssetHash"), value);
    CFRelease(v23);
    cf = 0;
    CFDictionaryGetValueIfPresent((CFDictionaryRef)ValueAtIndex, CFSTR("derivatives"), &cf);
    v11 = v17;
    if (cf)
    {
      v26 = CFGetTypeID(cf);
      if (v26 == CFArrayGetTypeID())
      {
        if (cf)
        {
          v27 = CFArrayGetCount((CFArrayRef)cf);
          theArray = CFArrayCreateMutable(allocator, v27, MEMORY[0x1E0C9B378]);
          if (v27 < 1)
          {
LABEL_54:
            if (CFArrayGetCount(theArray))
              CFDictionarySetValue(v14, CFSTR("derivedAssets"), theArray);
            CFRelease(theArray);
            a2 = v39;
            v8 = v36;
            goto LABEL_18;
          }
          v28 = 0;
          while (1)
          {
            v29 = CFArrayGetValueAtIndex((CFArrayRef)cf, v28);
            v30 = CFGetTypeID(v29);
            if (v30 == CFDictionaryGetTypeID())
            {
              v31 = _createAsset((const __CFDictionary *)v29, a3, a4, v39, &v44);
              v32 = v31;
              v33 = v44;
              if (v44)
              {
                if (!v31)
                  goto LABEL_38;
              }
              else
              {
                if (value)
                  CFDictionarySetValue(v31, CFSTR("masterAssetHash"), value);
                CFArrayAppendValue(theArray, v32);
              }
              CFRelease(v32);
              v33 = v44;
              if (v44)
              {
LABEL_38:
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v46 = v33;
                  _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Rejecting derived asset because of error: %{public}@", buf, 0xCu);
                  v33 = v44;
                }
                CFRelease(v33);
                v44 = 0;
              }
            }
            else
            {
              v33 = MSPCUCreateError(CFSTR("MSSubscribeStreamsProtocolCoreErrorDomain"), 8, CFSTR("ERROR_GET_CORE_CONNECTION_BAD_FIELD_P_FIELD"), CFSTR("derivatives"));
              v44 = v33;
              if (v33)
                goto LABEL_38;
            }
            if (v27 == ++v28)
              goto LABEL_54;
          }
        }
      }
      else
      {
        v44 = MSPCUCreateError(CFSTR("MSSubscribeStreamsProtocolCoreErrorDomain"), 8, CFSTR("ERROR_GET_CORE_CONNECTION_BAD_FIELD_P_FIELD"), CFSTR("derivatives"));
      }
    }
LABEL_45:
    v24 = v44;
    if (v44)
      goto LABEL_46;
    if (v14)
    {
      CFArrayAppendValue(Mutable, v14);
LABEL_49:
      CFRelease(v14);
    }
LABEL_50:
    ++v10;
  }
  while (v10 != Count);
  if (v44)
  {
    CFRelease(Mutable);
    if (v35)
    {
      Mutable = 0;
      *v35 = v44;
    }
    else
    {
      CFRelease(v44);
      return 0;
    }
  }
  return Mutable;
}

__CFDictionary *_createAsset(const __CFDictionary *a1, const __CFDictionary *a2, const void *a3, const void *a4, _QWORD *a5)
{
  const __CFAllocator *v9;
  const CFDictionaryKeyCallBacks *v10;
  const CFDictionaryValueCallBacks *v11;
  __CFDictionary *Mutable;
  __CFDictionary *v13;
  const __CFString *v14;
  CFNumberRef NumberFromString;
  CFNumberRef v16;
  const __CFString *v17;
  CFNumberRef v18;
  CFNumberRef v19;
  const void *v20;
  const __CFString *v21;
  CFNumberRef v22;
  CFNumberRef v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFNumber *v26;
  const __CFNumber *v27;
  CFDateRef v28;
  CFDateRef v29;
  const __CFString *v30;
  const __CFNumber *v31;
  const __CFNumber *v32;
  CFDateRef v33;
  CFDateRef v34;
  const void *v35;
  const void *v36;
  const void *v37;
  const void *v38;
  const void *v39;
  const void *v40;
  const __CFString *v41;
  CFNumberRef v42;
  CFNumberRef v43;
  const __CFString *v44;
  CFNumberRef v45;
  CFNumberRef v46;
  const __CFString *v47;
  CFNumberRef v48;
  CFNumberRef v49;
  const void *v50;
  CFTypeID v51;
  void *v54;
  CFTypeRef cf;
  void *value;
  uint64_t v57;

  v57 = 0;
  v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v10 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
  v11 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v13 = CFDictionaryCreateMutable(v9, 0, v10, v11);
  if (CFDictionaryContainsKey(a1, CFSTR("width")))
  {
    v14 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("width"));
    if (MSPCUNumberFormatterWithSystemLocale_once != -1)
      dispatch_once(&MSPCUNumberFormatterWithSystemLocale_once, &__block_literal_global_1896);
    NumberFromString = CFNumberFormatterCreateNumberFromString(v9, (CFNumberFormatterRef)MSPCUNumberFormatterWithSystemLocale_nf, v14, 0, 0);
    if (NumberFromString)
    {
      v16 = NumberFromString;
      CFDictionarySetValue(v13, CFSTR("pixelWidth"), NumberFromString);
      CFRelease(v16);
    }
  }
  if (CFDictionaryContainsKey(a1, CFSTR("height")))
  {
    v17 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("height"));
    if (MSPCUNumberFormatterWithSystemLocale_once != -1)
      dispatch_once(&MSPCUNumberFormatterWithSystemLocale_once, &__block_literal_global_1896);
    v18 = CFNumberFormatterCreateNumberFromString(v9, (CFNumberFormatterRef)MSPCUNumberFormatterWithSystemLocale_nf, v17, 0, 0);
    if (v18)
    {
      v19 = v18;
      CFDictionarySetValue(v13, CFSTR("pixelHeight"), v18);
      CFRelease(v19);
    }
  }
  if (CFDictionaryContainsKey(a1, CFSTR("deviceid")))
  {
    v20 = CFDictionaryGetValue(a1, CFSTR("deviceid"));
    CFDictionarySetValue(v13, CFSTR("deviceID"), v20);
  }
  if (CFDictionaryContainsKey(a1, CFSTR("bytecount")))
  {
    v21 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("bytecount"));
    if (MSPCUNumberFormatterWithSystemLocale_once != -1)
      dispatch_once(&MSPCUNumberFormatterWithSystemLocale_once, &__block_literal_global_1896);
    v22 = CFNumberFormatterCreateNumberFromString(v9, (CFNumberFormatterRef)MSPCUNumberFormatterWithSystemLocale_nf, v21, 0, 0);
    if (v22)
    {
      v23 = v22;
      CFDictionarySetValue(v13, CFSTR("fileSize"), v22);
      CFRelease(v23);
    }
  }
  if (!CFDictionaryContainsKey(a1, CFSTR("sha1")))
  {
LABEL_24:
    if (CFDictionaryContainsKey(a1, CFSTR("dateContentCreated")))
    {
      v25 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("dateContentCreated"));
      if (MSPCUNumberFormatterWithSystemLocale_once != -1)
        dispatch_once(&MSPCUNumberFormatterWithSystemLocale_once, &__block_literal_global_1896);
      v26 = CFNumberFormatterCreateNumberFromString(v9, (CFNumberFormatterRef)MSPCUNumberFormatterWithSystemLocale_nf, v25, 0, 0);
      if (v26)
      {
        v27 = v26;
        value = 0;
        CFNumberGetValue(v26, kCFNumberDoubleType, &value);
        CFRelease(v27);
        v28 = CFDateCreate(0, *(CFAbsoluteTime *)&value);
        if (v28)
        {
          v29 = v28;
          CFDictionarySetValue(v13, CFSTR("dateContentCreated"), v28);
          CFRelease(v29);
        }
      }
    }
    if (CFDictionaryContainsKey(a1, CFSTR("dateContentModified")))
    {
      v30 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("dateContentModified"));
      if (MSPCUNumberFormatterWithSystemLocale_once != -1)
        dispatch_once(&MSPCUNumberFormatterWithSystemLocale_once, &__block_literal_global_1896);
      v31 = CFNumberFormatterCreateNumberFromString(v9, (CFNumberFormatterRef)MSPCUNumberFormatterWithSystemLocale_nf, v30, 0, 0);
      if (v31)
      {
        v32 = v31;
        value = 0;
        CFNumberGetValue(v31, kCFNumberDoubleType, &value);
        CFRelease(v32);
        v33 = CFDateCreate(0, *(CFAbsoluteTime *)&value);
        if (v33)
        {
          v34 = v33;
          CFDictionarySetValue(v13, CFSTR("dateContentModified"), v33);
          CFRelease(v34);
        }
      }
    }
    if (CFDictionaryContainsKey(a1, CFSTR("sourceLibraryID")))
    {
      v35 = CFDictionaryGetValue(a1, CFSTR("sourceLibraryID"));
      CFDictionarySetValue(v13, CFSTR("sourceLibraryID"), v35);
    }
    if (CFDictionaryContainsKey(a1, CFSTR("sourceItemID")))
    {
      v36 = CFDictionaryGetValue(a1, CFSTR("sourceItemID"));
      CFDictionarySetValue(v13, CFSTR("sourceItemID"), v36);
    }
    if (CFDictionaryContainsKey(a1, CFSTR("sourceContainerType")))
    {
      v37 = CFDictionaryGetValue(a1, CFSTR("sourceContainerType"));
      CFDictionarySetValue(v13, CFSTR("sourceContainerType"), v37);
    }
    if (CFDictionaryContainsKey(a1, CFSTR("sourceContainerID")))
    {
      v38 = CFDictionaryGetValue(a1, CFSTR("sourceContainerID"));
      CFDictionarySetValue(v13, CFSTR("sourceContainerID"), v38);
    }
    if (CFDictionaryContainsKey(a1, CFSTR("sourceContainerDisplayName")))
    {
      v39 = CFDictionaryGetValue(a1, CFSTR("sourceContainerDisplayName"));
      CFDictionarySetValue(v13, CFSTR("sourceContainerDisplayName"), v39);
    }
    if (CFDictionaryContainsKey(a1, CFSTR("deviceDisplayName")))
    {
      v40 = CFDictionaryGetValue(a1, CFSTR("deviceDisplayName"));
      CFDictionarySetValue(v13, CFSTR("deviceDisplayName"), v40);
    }
    if (CFDictionaryContainsKey(a1, CFSTR("rasterToDisplayRotationAngle")))
    {
      v41 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("rasterToDisplayRotationAngle"));
      if (MSPCUNumberFormatterWithSystemLocale_once != -1)
        dispatch_once(&MSPCUNumberFormatterWithSystemLocale_once, &__block_literal_global_1896);
      v42 = CFNumberFormatterCreateNumberFromString(v9, (CFNumberFormatterRef)MSPCUNumberFormatterWithSystemLocale_nf, v41, 0, 0);
      if (v42)
      {
        v43 = v42;
        CFDictionarySetValue(v13, CFSTR("rasterToDisplayRotationAngle"), v42);
        CFRelease(v43);
      }
    }
    if (CFDictionaryContainsKey(a1, CFSTR("sourceiCloudPhotoLibraryEnabled")))
    {
      v44 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("sourceiCloudPhotoLibraryEnabled"));
      if (MSPCUNumberFormatterWithSystemLocale_once != -1)
        dispatch_once(&MSPCUNumberFormatterWithSystemLocale_once, &__block_literal_global_1896);
      v45 = CFNumberFormatterCreateNumberFromString(v9, (CFNumberFormatterRef)MSPCUNumberFormatterWithSystemLocale_nf, v44, 0, 0);
      if (v45)
      {
        v46 = v45;
        CFDictionarySetValue(v13, CFSTR("sourceiCloudPhotoLibraryEnabled"), v45);
        CFRelease(v46);
      }
    }
    CFDictionarySetValue(v13, CFSTR("streamID"), a4);
    CFDictionarySetValue(Mutable, CFSTR("metadata"), v13);
    if (v13)
      CFRelease(v13);
    if (CFDictionaryContainsKey(a1, CFSTR("size")))
    {
      v47 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("size"));
      if (MSPCUNumberFormatterWithSystemLocale_once != -1)
        dispatch_once(&MSPCUNumberFormatterWithSystemLocale_once, &__block_literal_global_1896);
      v48 = CFNumberFormatterCreateNumberFromString(v9, (CFNumberFormatterRef)MSPCUNumberFormatterWithSystemLocale_nf, v47, 0, 0);
      if (v48)
      {
        v49 = v48;
        CFDictionarySetValue(Mutable, CFSTR("protocolFileSize"), v48);
        CFRelease(v49);
      }
    }
    if (CFDictionaryContainsKey(a1, CFSTR("type")))
    {
      v50 = CFDictionaryGetValue(a1, CFSTR("type"));
      v51 = CFGetTypeID(v50);
      if (v51 == CFStringGetTypeID())
        CFDictionarySetValue(Mutable, CFSTR("type"), v50);
    }
    value = 0;
    CFDictionaryGetValueIfPresent(a1, CFSTR("checksum"), (const void **)&value);
    if (value)
    {
      cf = 0;
      MSPCUCreateDataFromHexString((const __CFString *)value, (uint64_t)CFSTR("checksum"), (__CFData **)&cf, &v57, (uint64_t (*)(uint64_t))_createBadFieldError);
      if (v57)
        goto LABEL_74;
      CFDictionarySetValue(Mutable, CFSTR("fileHash"), cf);
      CFRelease(cf);
      v54 = 0;
      CFDictionaryGetValueIfPresent(a2, value, (const void **)&v54);
      if (v54)
        CFDictionarySetValue(Mutable, CFSTR("MMCSAccessHeader"), v54);
    }
    CFDictionaryGetValueIfPresent(a1, CFSTR("sha1"), 0);
    if (a3)
      CFDictionarySetValue(Mutable, CFSTR("MMCSURL"), a3);
LABEL_74:
    if (!v57)
      return Mutable;
    goto LABEL_75;
  }
  v24 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("sha1"));
  value = 0;
  MSPCUCreateDataFromHexString(v24, (uint64_t)CFSTR("sha1"), (__CFData **)&value, &v57, (uint64_t (*)(uint64_t))_createBadFieldError);
  if (!v57)
  {
    if (value)
    {
      CFDictionarySetValue(v13, CFSTR("SHA1"), value);
      CFRelease(value);
    }
    goto LABEL_24;
  }
  if (v13)
  {
    CFRelease(v13);
    goto LABEL_74;
  }
LABEL_75:
  if (Mutable)
    CFRelease(Mutable);
  Mutable = 0;
  if (a5)
    *a5 = v57;
  return Mutable;
}

CFErrorRef _createBadFieldError(uint64_t a1)
{
  return MSPCUCreateError(CFSTR("MSSubscribeStreamsProtocolCoreErrorDomain"), 8, CFSTR("ERROR_GET_CORE_CONNECTION_BAD_FIELD_P_FIELD"), a1);
}

CFStringRef MSCFCopyLocalizedString(CFStringRef key)
{
  __CFBundle *v2;

  v2 = (__CFBundle *)__bundle_bundle;
  if (!__bundle_bundle)
  {
    __bundle_bundle = (uint64_t)CFBundleGetBundleWithIdentifier(CFSTR("com.apple.CoreMediaStream"));
    CFRetain((CFTypeRef)__bundle_bundle);
    v2 = (__CFBundle *)__bundle_bundle;
  }
  return CFBundleCopyLocalizedString(v2, key, key, CFSTR("CoreMediaStream"));
}

CFStringRef MSCFCreateLocalizedFormat(const __CFString *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  const __CFString *v9;
  CFStringRef v10;

  v9 = MSCFCopyLocalizedString(a1);
  v10 = CFStringCreateWithFormatAndArguments((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, v9, &a9);
  CFRelease(v9);
  return v10;
}

uint64_t MPSStateResponseReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 32) |= 1u;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_50;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              v19 = 0;
              goto LABEL_52;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_50:
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_52:
          v40 = 8;
          goto LABEL_66;
        case 2u:
          v24 = 0;
          v25 = 0;
          v26 = 0;
          *(_BYTE *)(a1 + 32) |= 8u;
          while (2)
          {
            v27 = *v3;
            v28 = *(_QWORD *)(a2 + v27);
            if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
              *(_QWORD *)(a2 + v27) = v28 + 1;
              v26 |= (unint64_t)(v29 & 0x7F) << v24;
              if (v29 < 0)
              {
                v24 += 7;
                v14 = v25++ >= 9;
                if (v14)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v26) = 0;
LABEL_56:
          v41 = 28;
          goto LABEL_61;
        case 3u:
          v30 = 0;
          v31 = 0;
          v26 = 0;
          *(_BYTE *)(a1 + 32) |= 4u;
          while (2)
          {
            v32 = *v3;
            v33 = *(_QWORD *)(a2 + v32);
            if (v33 == -1 || v33 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v34 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v33);
              *(_QWORD *)(a2 + v32) = v33 + 1;
              v26 |= (unint64_t)(v34 & 0x7F) << v30;
              if (v34 < 0)
              {
                v30 += 7;
                v14 = v31++ >= 9;
                if (v14)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_60;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v26) = 0;
LABEL_60:
          v41 = 24;
LABEL_61:
          *(_DWORD *)(a1 + v41) = v26;
          continue;
        case 4u:
          v35 = 0;
          v36 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 32) |= 2u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v37 = *v3;
        v38 = *(_QWORD *)(a2 + v37);
        if (v38 == -1 || v38 >= *(_QWORD *)(a2 + *v4))
          break;
        v39 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v38);
        *(_QWORD *)(a2 + v37) = v38 + 1;
        v19 |= (unint64_t)(v39 & 0x7F) << v35;
        if ((v39 & 0x80) == 0)
          goto LABEL_63;
        v35 += 7;
        v14 = v36++ >= 9;
        if (v14)
        {
          v19 = 0;
          goto LABEL_65;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_63:
      if (*(_BYTE *)(a2 + *v5))
        v19 = 0;
LABEL_65:
      v40 = 16;
LABEL_66:
      *(_QWORD *)(a1 + v40) = v19;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void MSSPCStartHTTPTransaction(uint64_t a1, uint64_t a2, uint64_t a3, const __CFDictionary *a4, const __CFData *a5, int a6, int a7)
{
  const __CFAllocator *v14;
  const void *Mutable;
  const __CFDictionary *v16;
  const __CFDictionary *v17;
  const __CFDictionary *v18;
  CFIndex Count;
  const void **v20;
  const void **v21;
  const void **v22;
  const void **v23;
  const void **v24;
  CFStringRef v25;
  CFErrorRef v26;
  const __CFData *Value;
  CFStringRef v28;
  CFStringRef v29;
  const __CFString *v30;
  CFStringRef SHA1StringOfUDID;
  CFStringRef v32;
  void *v33;
  uint64_t v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFData *ExternalRepresentation;
  const __CFData *v38;
  CFStringRef v39;
  CFStringRef v40;
  NSObject *v41;
  const char *v42;
  const UInt8 *BytePtr;
  CFIndex Length;
  CFStringRef v45;
  const __CFDictionary *v46;
  const __CFDictionary *v47;
  const __CFDictionary *MutableCopy;
  CFIndex v49;
  const void **v50;
  CFStringRef *v51;
  const __CFString *v52;
  _QWORD *v53;
  __CFDictionary *v54;
  __CFDictionary *v55;
  CFIndex v56;
  CFIndex v57;
  size_t v58;
  const void **v59;
  const void **v60;
  uint64_t i;
  uint64_t v62;
  const __CFData *v63;
  const __CFData *v64;
  int v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  const void **v69;
  const __CFAllocator *v70;
  _BYTE userInfoValues[12];
  __int16 v72;
  const __CFDictionary *v73;
  __int16 v74;
  CFStringRef v75;
  void *userInfoKeys[2];

  userInfoKeys[1] = *(void **)MEMORY[0x1E0C80C00];
  v14 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = (const void *)CFURLRequestCreateMutable();
  if (a3)
  {
    if (!a2)
      __assert_rtn("MSSPCStartHTTPTransaction", "MSStreamsProtocolCore.m", 215, "method");
    v68 = a7;
    v62 = a3;
    v70 = v14;
    CFURLRequestSetHTTPRequestMethod();
    v16 = *(const __CFDictionary **)(a1 + 24);
    v66 = *(_QWORD *)(a1 + 8);
    v67 = *(_QWORD *)(a1 + 16);
    v17 = *(const __CFDictionary **)(a1 + 32);
    if (!v17)
    {
      CFURLRequestSetHTTPHeaderFieldValue();
      goto LABEL_20;
    }
    v63 = a5;
    v18 = a4;
    Count = CFDictionaryGetCount(v17);
    v20 = (const void **)malloc_type_malloc(8 * Count, 0x6004044C4A2DFuLL);
    v21 = (const void **)malloc_type_malloc(8 * Count, 0x6004044C4A2DFuLL);
    v22 = v21;
    if (v20 && v21)
    {
      CFDictionaryGetKeysAndValues(v17, v20, v21);
      if (Count >= 1)
      {
        v23 = v20;
        v24 = v22;
        do
        {
          ++v23;
          ++v24;
          CFURLRequestSetHTTPHeaderFieldValue();
          --Count;
        }
        while (Count);
      }
    }
    else if (!v20)
    {
      goto LABEL_18;
    }
    free(v20);
LABEL_18:
    a4 = v18;
    a5 = v63;
    if (v22)
      free(v22);
LABEL_20:
    if (CFDictionaryContainsKey(v16, CFSTR("pushToken")))
    {
      Value = (const __CFData *)CFDictionaryGetValue(v16, CFSTR("pushToken"));
      v28 = MSSPCCreateHexStringFromData(Value);
      if (v28)
      {
        v29 = v28;
        CFURLRequestSetHTTPHeaderFieldValue();
        CFRelease(v29);
      }
    }
    if (CFDictionaryContainsKey(v16, CFSTR("UDID")))
    {
      v30 = (const __CFString *)CFDictionaryGetValue(v16, CFSTR("UDID"));
      SHA1StringOfUDID = createSHA1StringOfUDID(v30);
      if (SHA1StringOfUDID)
      {
        v32 = SHA1StringOfUDID;
        CFURLRequestSetHTTPHeaderFieldValue();
        CFRelease(v32);
      }
    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "integerForKey:", CFSTR("AKAddTestApplicationHeader"));

    if (v34 == 1)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)userInfoValues = 0;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Setting X-APPLE-TEST-APPLICATION header to true", userInfoValues, 2u);
      }
      CFURLRequestSetHTTPHeaderFieldValue();
    }
    if (CFDictionaryContainsKey(v16, CFSTR("clientInfo")))
    {
      CFDictionaryGetValue(v16, CFSTR("clientInfo"));
      CFURLRequestSetHTTPHeaderFieldValue();
    }
    if (!v67)
      goto LABEL_48;
    v35 = CFStringCreateWithFormat(v70, 0, CFSTR("%@:%@"), v66, v67);
    if (!v35)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)userInfoValues = 0;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not create authentication string.", userInfoValues, 2u);
      }
      goto LABEL_48;
    }
    v36 = v35;
    ExternalRepresentation = CFStringCreateExternalRepresentation(v70, v35, 0x8000100u, 0);
    if (ExternalRepresentation)
    {
      v38 = ExternalRepresentation;
      v39 = MSPCUCreateBase64StringFromData(ExternalRepresentation);
      CFRelease(v38);
      if (v39)
      {
        v40 = CFStringCreateWithFormat(v70, 0, CFSTR("X-MobileMe-AuthToken %@"), v39);
        CFRelease(v39);
        if (v40)
        {
          CFURLRequestSetHTTPHeaderFieldValue();
          CFRelease(v40);
LABEL_47:
          CFRelease(v36);
LABEL_48:
          if (v68)
            CFURLRequestAppendHTTPHeaderFieldValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            if (a5)
            {
              BytePtr = CFDataGetBytePtr(a5);
              Length = CFDataGetLength(a5);
              v45 = CFStringCreateWithBytes(v70, BytePtr, Length, 0x8000100u, 0);
            }
            else
            {
              v45 = 0;
            }
            v46 = (const __CFDictionary *)CFURLRequestCopyAllHTTPHeaderFields();
            if (v46)
            {
              v47 = v46;
              MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v46);
              CFRelease(v47);
              if (MutableCopy)
              {
                v49 = CFDictionaryGetCount(MutableCopy);
                v50 = (const void **)malloc_type_malloc(8 * v49, 0x80040B8603338uLL);
                if (v50)
                {
                  v64 = a5;
                  v65 = a6;
                  v69 = v50;
                  CFDictionaryGetKeysAndValues(MutableCopy, v50, 0);
                  if (v49 >= 1)
                  {
                    v51 = (CFStringRef *)v69;
                    do
                    {
                      v52 = *v51;
                      if (CFStringCompare(*v51, CFSTR("x-apple-mme-streams-client-token"), 1uLL) == kCFCompareEqualTo
                        || CFStringCompare(v52, CFSTR("x-apple-mme-streams-client-udid"), 1uLL) == kCFCompareEqualTo
                        || CFStringCompare(v52, CFSTR("authorization"), 1uLL) == kCFCompareEqualTo)
                      {
                        CFDictionarySetValue(MutableCopy, v52, CFSTR("[present]"));
                      }
                      ++v51;
                      --v49;
                    }
                    while (v49);
                  }
                  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)userInfoValues = 138543874;
                    *(_QWORD *)&userInfoValues[4] = v62;
                    v72 = 2112;
                    v73 = MutableCopy;
                    v74 = 2112;
                    v75 = v45;
                    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "About to send to URL: %{public}@\nHeaders: %@\n%@", userInfoValues, 0x20u);
                  }
                  free(v69);
                  a6 = v65;
                  a5 = v64;
                }
                CFRelease(MutableCopy);
              }
            }
            if (v45)
              CFRelease(v45);
          }
          if (a5)
            CFURLRequestSetHTTPRequestBody();
          *(_QWORD *)(a1 + 104) = 0;
          *(_QWORD *)(a1 + 112) = 0;
          *(_QWORD *)(a1 + 120) = 0;
          if (a6)
            *(_QWORD *)(a1 + 104) = CFDataCreateMutable(v70, 0);
          v53 = malloc_type_calloc(1uLL, 0x68uLL, 0x10C0040EDE68F84uLL);
          *(_QWORD *)(a1 + 88) = v53;
          *v53 = 1;
          v53[1] = a1;
          v53[9] = _didFinishLoadingCallback;
          v53[10] = _didFailCallback;
          v53[6] = _didReceiveResponseCallback;
          v53[7] = _didReceiveDataCallback;
          v54 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
          if (!v54)
            __assert_rtn("MSSPCStartHTTPTransaction", "MSStreamsProtocolCore.m", 285, "properties");
          v55 = v54;
          CFDictionarySetValue(v54, (const void *)*MEMORY[0x1E0C932B8], (const void *)*MEMORY[0x1E0C9AE50]);
          if (a4)
          {
            v56 = CFDictionaryGetCount(a4);
            if (v56 >= 1)
            {
              v57 = v56;
              v58 = 8 * v56;
              v59 = (const void **)malloc_type_malloc(8 * v56, 0xC0040B8AA526DuLL);
              v60 = (const void **)malloc_type_malloc(v58, 0xC0040B8AA526DuLL);
              CFDictionaryGetKeysAndValues(a4, v59, v60);
              for (i = 0; i != v57; ++i)
                CFDictionarySetValue(v55, v59[i], v60[i]);
              free(v59);
              free(v60);
            }
          }
          *(_QWORD *)(a1 + 96) = CFURLConnectionCreateWithProperties();
          CFRelease(v55);
          CFRelease(Mutable);
          CFRunLoopGetCurrent();
          CFURLConnectionScheduleWithRunLoop();
          CFURLConnectionStart();
          return;
        }
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_47;
        *(_WORD *)userInfoValues = 0;
        v41 = MEMORY[0x1E0C81028];
        v42 = "Could not format auth string.";
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_47;
        *(_WORD *)userInfoValues = 0;
        v41 = MEMORY[0x1E0C81028];
        v42 = "Could not base64-encode auth string.";
      }
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_47;
      *(_WORD *)userInfoValues = 0;
      v41 = MEMORY[0x1E0C81028];
      v42 = "Could not create data representation of auth string.";
    }
    _os_log_error_impl(&dword_1D3E94000, v41, OS_LOG_TYPE_ERROR, v42, userInfoValues, 2u);
    goto LABEL_47;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)userInfoValues = 0;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error: No URL provided for HTTP transaction.", userInfoValues, 2u);
  }
  if (*(_QWORD *)(a1 + 56))
  {
    v25 = MSCFCopyLocalizedString(CFSTR("ERROR_CONNECTION_CORE_NO_URL_ERROR"));
    *(_QWORD *)userInfoValues = v25;
    userInfoKeys[0] = *(void **)MEMORY[0x1E0C9AFE0];
    v26 = CFErrorCreateWithUserInfoKeysAndValues(0, CFSTR("streamsProtocolCoreErrorDomain"), 4, (const void *const *)userInfoKeys, (const void *const *)userInfoValues, 1);
    (*(void (**)(uint64_t, _QWORD, CFErrorRef))(a1 + 56))(a1, 0, v26);
    CFRelease(v25);
    CFRelease(v26);
  }
  CFRelease(Mutable);
}

CFStringRef MSSPCCreateHexStringFromData(const __CFData *a1)
{
  CFIndex Length;
  const UInt8 *BytePtr;
  const UInt8 *v4;
  UInt8 *v5;
  CFIndex v6;
  const UInt8 *v7;
  UInt8 *v8;
  unsigned int v9;
  CFStringRef v10;

  Length = CFDataGetLength(a1);
  BytePtr = CFDataGetBytePtr(a1);
  v4 = (const UInt8 *)malloc_type_malloc((2 * Length) | 1, 0x7525B103uLL);
  if (!v4)
    __assert_rtn("MSSPCCreateHexStringFromData", "MSStreamsProtocolCore.m", 596, "hex");
  v5 = (UInt8 *)v4;
  v6 = 2 * Length;
  v7 = v4;
  if (Length >= 1)
  {
    v8 = (UInt8 *)v4;
    do
    {
      v9 = *BytePtr++;
      *v8 = a0123456789abcd[(unint64_t)v9 >> 4];
      v7 = v8 + 2;
      v8[1] = a0123456789abcd[v9 & 0xF];
      v8 += 2;
      --Length;
    }
    while (Length);
  }
  *v7 = 0;
  v10 = CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4, v6, 0x600u, 0);
  free(v5);
  return v10;
}

CFStringRef createSHA1StringOfUDID(const __CFString *a1)
{
  CC_LONG v2;
  const __CFData *v3;
  const __CFData *v4;
  CFStringRef v5;
  CC_SHA1_CTX v7;
  unsigned __int8 md[20];
  uint8_t buffer[120];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buffer = 0;
      _os_log_fault_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unable to create SHA1 string of NULL UDID", buffer, 2u);
    }
    return 0;
  }
  memset(&v7, 0, sizeof(v7));
  CC_SHA1_Init(&v7);
  CC_SHA1_Update(&v7, &createSHA1StringOfUDID__prepend, 3u);
  if (!CFStringGetCString(a1, (char *)buffer, 120, 0x600u))
    return 0;
  v2 = strlen((const char *)buffer);
  CC_SHA1_Update(&v7, buffer, v2);
  CC_SHA1_Final(md, &v7);
  v3 = CFDataCreateWithBytesNoCopy(0, md, 20, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = MSSPCCreateHexStringFromData(v3);
  CFRelease(v4);
  return v5;
}

void _didFailCallback(uint64_t a1, const void *a2, _QWORD *a3)
{
  int v5;
  const void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = 138543362;
    v6 = a2;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Connection failed. Error: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  a3[15] = a2;
  if (a2)
    CFRetain(a2);
  _scheduleTimer(a3);
}

void _didFinishLoadingCallback(uint64_t a1, uint64_t a2)
{
  CFIndex ResponseStatusCode;
  const __CFData *v4;
  const __CFAllocator *v5;
  const UInt8 *BytePtr;
  CFIndex Length;
  CFStringRef v8;
  __CFString *v9;
  CFErrorRef v10;
  NSObject *v11;
  const char *v12;
  __CFString *v13;
  CFErrorRef v14;
  __CFString *v15;
  CFErrorRef v16;
  const __CFAllocator *v17;
  CFNumberRef v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __CFString *v26;
  CFErrorRef v27;
  CFIndex valuePtr;
  void *userInfoKeys;
  void *userInfoValues;
  uint8_t buf[4];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  ResponseStatusCode = CFHTTPMessageGetResponseStatusCode(*(CFHTTPMessageRef *)(a2 + 112));
  valuePtr = ResponseStatusCode;
  v4 = *(const __CFData **)(a2 + 104);
  if (v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    BytePtr = CFDataGetBytePtr(v4);
    Length = CFDataGetLength(*(CFDataRef *)(a2 + 104));
    v8 = CFStringCreateWithBytes(v5, BytePtr, Length, 0x8000100u, 0);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v32 = (uint64_t)v8;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Received response: %@", buf, 0xCu);
    }
    CFRelease(v8);
  }
  if (ResponseStatusCode > 400)
  {
    if (ResponseStatusCode != 401)
    {
      if (ResponseStatusCode == 403)
      {
        v15 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_CONNECTION_CORE_FORBIDDEN_ERROR"));
        userInfoKeys = (void *)*MEMORY[0x1E0C9AFE0];
        userInfoValues = v15;
        v16 = CFErrorCreateWithUserInfoKeysAndValues((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("streamsProtocolCoreErrorDomain"), 3, (const void *const *)&userInfoKeys, (const void *const *)&userInfoValues, 1);
        CFRelease(v15);
        *(_QWORD *)(a2 + 120) = v16;
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_25;
        *(_DWORD *)buf = 134217984;
        v32 = 403;
        v11 = MEMORY[0x1E0C81028];
        v12 = "Transaction forbidden. Code: %ld.";
      }
      else
      {
        if (ResponseStatusCode != 500)
          goto LABEL_22;
        v9 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_CONNECTION_CORE_FAILED_SERVER_ERROR"));
        userInfoKeys = (void *)*MEMORY[0x1E0C9AFE0];
        userInfoValues = v9;
        v10 = CFErrorCreateWithUserInfoKeysAndValues((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("streamsProtocolCoreErrorDomain"), 0, (const void *const *)&userInfoKeys, (const void *const *)&userInfoValues, 1);
        CFRelease(v9);
        *(_QWORD *)(a2 + 120) = v10;
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_25;
        *(_DWORD *)buf = 134217984;
        v32 = 500;
        v11 = MEMORY[0x1E0C81028];
        v12 = "Transaction failed. A server error has been reported. Code: %ld.";
      }
LABEL_24:
      _os_log_error_impl(&dword_1D3E94000, v11, OS_LOG_TYPE_ERROR, v12, buf, 0xCu);
      goto LABEL_25;
    }
LABEL_18:
    v13 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_CONNECTION_CORE_AUTH_FAILED_ERROR"));
    userInfoKeys = (void *)*MEMORY[0x1E0C9AFE0];
    userInfoValues = v13;
    v14 = CFErrorCreateWithUserInfoKeysAndValues((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("streamsProtocolCoreErrorDomain"), 2, (const void *const *)&userInfoKeys, (const void *const *)&userInfoValues, 1);
    CFRelease(v13);
    *(_QWORD *)(a2 + 120) = v14;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    *(_DWORD *)buf = 134217984;
    v32 = ResponseStatusCode;
    v11 = MEMORY[0x1E0C81028];
    v12 = "Authentication failed. Code: %ld.";
    goto LABEL_24;
  }
  if (ResponseStatusCode == 200 || ResponseStatusCode == 207)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v32 = ResponseStatusCode;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Transaction completed. Code: %ld.", buf, 0xCu);
    }
    goto LABEL_25;
  }
  if (ResponseStatusCode == 330)
    goto LABEL_18;
LABEL_22:
  v17 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v18 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberCFIndexType, &valuePtr);
  v26 = (__CFString *)MSCFCreateLocalizedFormat(CFSTR("ERROR_CONNECTION_CORE_FATAL_P_RESPONSE"), v19, v20, v21, v22, v23, v24, v25, (char)v18);
  CFRelease(v18);
  userInfoValues = v26;
  userInfoKeys = (void *)*MEMORY[0x1E0C9AFE0];
  v27 = CFErrorCreateWithUserInfoKeysAndValues(v17, CFSTR("streamsProtocolCoreErrorDomain"), 1, (const void *const *)&userInfoKeys, (const void *const *)&userInfoValues, 1);
  CFRelease(v26);
  *(_QWORD *)(a2 + 120) = v27;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v32 = (uint64_t)v27;
    v11 = MEMORY[0x1E0C81028];
    v12 = "Transaction failed. Error: %{public}@";
    goto LABEL_24;
  }
LABEL_25:
  _scheduleTimer((void *)a2);
}

void _didReceiveResponseCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void *HTTPResponse;
  CFIndex ResponseStatusCode;
  CFDictionaryRef v6;
  const __CFDictionary *v7;
  CFTypeID v8;
  void (*v9)(uint64_t, void *);
  CFTypeID v10;
  const __CFString *v11;
  const __CFCharacterSet *v12;
  const __CFCharacterSet *v13;
  const __CFCharacterSet *v14;
  CFDateRef DateFromString;
  CFDateRef v16;
  NSObject *v17;
  const char *v18;
  uint32_t v19;
  SInt32 IntValue;
  int v21;
  CFAbsoluteTime Current;
  CFDateRef v23;
  void (*v24)(uint64_t, CFDateRef);
  CFTypeRef cf;
  void *value;
  uint8_t buf[4];
  _BYTE v28[18];
  uint64_t v29;
  CFRange v30;

  v29 = *MEMORY[0x1E0C80C00];
  HTTPResponse = (const void *)CFURLResponseGetHTTPResponse();
  *(_QWORD *)(a3 + 112) = HTTPResponse;
  CFRetain(HTTPResponse);
  ResponseStatusCode = CFHTTPMessageGetResponseStatusCode(*(CFHTTPMessageRef *)(a3 + 112));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v28 = ResponseStatusCode;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Received response status: %ld", buf, 0xCu);
  }
  v6 = CFHTTPMessageCopyAllHeaderFields(*(CFHTTPMessageRef *)(a3 + 112));
  if (v6)
  {
    v7 = v6;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v28 = v7;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Headers: %@", buf, 0xCu);
    }
    value = 0;
    if (CFDictionaryGetValueIfPresent(v7, CFSTR("x-apple-mme-streams-config-version"), (const void **)&value))
    {
      if (value)
      {
        v8 = CFGetTypeID(value);
        if (v8 == CFStringGetTypeID())
        {
          v9 = *(void (**)(uint64_t, void *))(a3 + 72);
          if (v9)
            v9(a3, value);
        }
      }
    }
    cf = 0;
    if (!CFDictionaryGetValueIfPresent(v7, CFSTR("Retry-After"), &cf))
      goto LABEL_33;
    if (cf)
    {
      v10 = CFGetTypeID(cf);
      if (v10 == CFStringGetTypeID())
      {
        v11 = (const __CFString *)cf;
        if (!_nonNumericNonSpaceCharacterSet_charSet)
        {
          v12 = CFCharacterSetCreateWithCharactersInString(0, CFSTR("0123456789 "));
          if (v12)
          {
            v13 = v12;
            _nonNumericNonSpaceCharacterSet_charSet = (uint64_t)CFCharacterSetCreateInvertedSet(0, v12);
            CFRelease(v13);
          }
          else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not create character set for date matching.", buf, 2u);
          }
        }
        v14 = (const __CFCharacterSet *)_nonNumericNonSpaceCharacterSet_charSet;
        v30.length = CFStringGetLength((CFStringRef)cf);
        v30.location = 0;
        if (CFStringFindCharacterFromSet(v11, v14, v30, 0, 0))
        {
          if (_retryAfterDateFormatter_once != -1)
            dispatch_once_f(&_retryAfterDateFormatter_once, &_retryAfterDateFormatter_df, (dispatch_function_t)_dateFormatter);
          DateFromString = CFDateFormatterCreateDateFromString(0, (CFDateFormatterRef)_retryAfterDateFormatter_df, (CFStringRef)cf, 0);
          if (DateFromString)
          {
            v16 = DateFromString;
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)v28 = cf;
              *(_WORD *)&v28[8] = 2114;
              *(_QWORD *)&v28[10] = v16;
              v17 = MEMORY[0x1E0C81028];
              v18 = "Found a retry-after header with an date string: %{public}@. Date: %{public}@";
              v19 = 22;
LABEL_36:
              _os_log_debug_impl(&dword_1D3E94000, v17, OS_LOG_TYPE_DEBUG, v18, buf, v19);
              goto LABEL_28;
            }
            goto LABEL_28;
          }
        }
        IntValue = CFStringGetIntValue((CFStringRef)cf);
        if (IntValue >= 1)
        {
          v21 = IntValue;
          Current = CFAbsoluteTimeGetCurrent();
          v23 = CFDateCreate(0, Current + (double)v21);
          if (v23)
          {
            v16 = v23;
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v28 = v21;
              *(_WORD *)&v28[4] = 2114;
              *(_QWORD *)&v28[6] = v16;
              v17 = MEMORY[0x1E0C81028];
              v18 = "Found a retry-after header with a relative interval of %d seconds. Date: %{public}@";
              v19 = 18;
              goto LABEL_36;
            }
LABEL_28:
            v24 = *(void (**)(uint64_t, CFDateRef))(a3 + 80);
            if (v24)
              v24(a3, v16);
            CFRelease(v16);
LABEL_33:
            CFRelease(v7);
            return;
          }
        }
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v28 = cf;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Found a retry-after header that could not be parsed: %{public}@", buf, 0xCu);
    }
    goto LABEL_33;
  }
}

void _didReceiveDataCallback(int a1, CFDataRef theData, uint64_t a3, _QWORD *a4)
{
  __CFData *v6;
  const UInt8 *BytePtr;
  CFIndex Length;
  unsigned int (*v9)(_QWORD *, CFDataRef, uint64_t *);
  uint64_t v10;

  v6 = (__CFData *)a4[13];
  if (v6)
  {
    BytePtr = CFDataGetBytePtr(theData);
    Length = CFDataGetLength(theData);
    CFDataAppendBytes(v6, BytePtr, Length);
  }
  v10 = 0;
  v9 = (unsigned int (*)(_QWORD *, CFDataRef, uint64_t *))a4[6];
  if (v9)
  {
    if (!v9(a4, theData, &v10))
    {
      a4[15] = v10;
      CFURLConnectionCancel();
      _scheduleTimer(a4);
    }
  }
}

void _scheduleTimer(void *a1)
{
  const __CFAllocator *v1;
  CFAbsoluteTime Current;
  CFRunLoopTimerRef v3;
  __CFRunLoopTimer *v4;
  __CFRunLoop *v5;
  CFRunLoopTimerContext v6;

  v6.version = 0;
  memset(&v6.retain, 0, 24);
  v6.info = a1;
  v1 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Current = CFAbsoluteTimeGetCurrent();
  v3 = CFRunLoopTimerCreate(v1, Current, 0.0, 0, 0, (CFRunLoopTimerCallBack)__didFinish, &v6);
  if (!v3)
    __assert_rtn("_scheduleTimer", "MSStreamsProtocolCore.m", 173, "timer");
  v4 = v3;
  v5 = CFRunLoopGetCurrent();
  CFRunLoopAddTimer(v5, v4, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
  CFRelease(v4);
}

void __didFinish(uint64_t a1, uint64_t a2)
{
  __CFError *v3;
  const void *v4;
  CFErrorDomain Domain;
  CFIndex Code;
  void (*v7)(uint64_t, __CFError *);
  void (*v8)(uint64_t, const void *, __CFError *);

  v3 = *(__CFError **)(a2 + 120);
  if (v3)
    CFRetain(*(CFTypeRef *)(a2 + 120));
  v4 = *(const void **)(a2 + 104);
  if (v4)
    CFRetain(*(CFTypeRef *)(a2 + 104));
  __resetContext(a2);
  if (v3
    && (Domain = CFErrorGetDomain(v3),
        Code = CFErrorGetCode(v3),
        CFEqual(Domain, CFSTR("streamsProtocolCoreErrorDomain")))
    && Code == 2)
  {
    v7 = *(void (**)(uint64_t, __CFError *))(a2 + 64);
    if (v7)
      v7(a2, v3);
  }
  else
  {
    v8 = *(void (**)(uint64_t, const void *, __CFError *))(a2 + 56);
    if (v8)
      v8(a2, v4, v3);
  }
  if (v4)
    CFRelease(v4);
  if (v3)
    CFRelease(v3);
}

void __resetContext(uint64_t a1)
{
  const void *v2;
  const void *v3;
  const void *v4;
  const void *v5;

  v2 = *(const void **)(a1 + 96);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(a1 + 96) = 0;
  }
  v3 = *(const void **)(a1 + 104);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(a1 + 104) = 0;
  }
  v4 = *(const void **)(a1 + 112);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(a1 + 112) = 0;
  }
  v5 = *(const void **)(a1 + 120);
  if (v5)
  {
    CFRelease(v5);
    *(_QWORD *)(a1 + 120) = 0;
  }
  free(*(void **)(a1 + 88));
  *(_QWORD *)(a1 + 88) = 0;
}

void _dateFormatter(__CFDateFormatter **a1)
{
  __CFDateFormatter *v2;
  __CFDateFormatter *v3;

  v2 = CFDateFormatterCreate(0, 0, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  if (v2)
  {
    v3 = v2;
    CFDateFormatterSetProperty(v2, (CFStringRef)*MEMORY[0x1E0C9AEF8], (CFTypeRef)*MEMORY[0x1E0C9AE50]);
    *a1 = v3;
  }
}

void MSSPCCancelHTTPTransaction(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 96))
  {
    CFRunLoopGetCurrent();
    CFURLConnectionUnscheduleFromRunLoop();
    CFURLConnectionCancel();
    __resetContext(a1);
  }
}

__CFData *MSSPCCreateDataFromHexString(const __CFString *a1)
{
  CFMutableDataRef Mutable;
  __CFData *v3;
  CFIndex Length;
  CFIndex v5;
  CFIndex v6;
  int v7;
  int CharacterAtIndex;
  char v9;
  char v10;
  char v11;
  UInt8 bytes;
  uint8_t buf[16];

  if (!a1)
    return 0;
  Mutable = CFDataCreateMutable(0, 0);
  if (!Mutable)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "MSSPCCreateDataFromHexString Could not create data object.", buf, 2u);
    }
    return 0;
  }
  v3 = Mutable;
  Length = CFStringGetLength(a1);
  v5 = Length;
  if ((Length & 1) != 0)
    __assert_rtn("MSSPCCreateDataFromHexString", "MSStreamsProtocolCore.m", 631, "(length & 1) == 0");
  bytes = 0;
  if (Length >= 1)
  {
    v6 = 0;
    v7 = 1;
    do
    {
      CharacterAtIndex = CFStringGetCharacterAtIndex(a1, v6);
      v9 = CharacterAtIndex - 48;
      if ((CharacterAtIndex - 65) <= 5)
        v10 = CharacterAtIndex - 55;
      else
        v10 = 0;
      if ((CharacterAtIndex - 97) <= 5)
        v11 = CharacterAtIndex - 87;
      else
        v11 = v10;
      if ((unsigned __int16)(CharacterAtIndex - 48) > 9u)
        v9 = v11;
      if (v7)
      {
        bytes = 16 * v9;
      }
      else
      {
        bytes |= v9;
        CFDataAppendBytes(v3, &bytes, 1);
      }
      v7 ^= 1u;
      ++v6;
    }
    while (v5 != v6);
  }
  return v3;
}

uint64_t MSShouldLogAtLevel(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  MSPlatform();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldLogAtLevel:", a1);

  return v3;
}

void MSLog(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11;
  void *v12;

  v11 = a3;
  MSPlatform();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "logFacility:level:format:args:", a1, a2, v11, &a9);

}

void MSLogFile(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v15;

  MSPlatform();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "logFile:func:line:facility:level:format:args:", a1, a2, a3, a4, a5, a6, &a9);

}

CFErrorRef MSPCUCreateError(const __CFString *a1, CFIndex a2, CFStringRef key, ...)
{
  const __CFString *v5;
  const __CFAllocator *v6;
  CFStringRef v7;
  CFErrorRef v8;
  void *userInfoKeys;
  void *userInfoValues[2];
  va_list va;

  va_start(va, key);
  userInfoValues[1] = *(void **)MEMORY[0x1E0C80C00];
  v5 = MSCFCopyLocalizedString(key);
  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v7 = CFStringCreateWithFormatAndArguments((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, v5, va);
  CFRelease(v5);
  userInfoValues[0] = (void *)v7;
  userInfoKeys = (void *)*MEMORY[0x1E0C9AFE0];
  v8 = CFErrorCreateWithUserInfoKeysAndValues(v6, a1, a2, (const void *const *)&userInfoKeys, (const void *const *)userInfoValues, 1);
  CFRelease(v7);
  return v8;
}

CFStringRef MSPCUCreateBase64StringFromData(const __CFData *a1)
{
  CFIndex Length;
  uint64_t v3;
  CFIndex v4;
  uint64_t v5;
  UInt8 *v6;
  UInt8 *v7;
  const UInt8 *BytePtr;
  uint64_t v9;
  unint64_t v10;
  const UInt8 *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  CFStringRef v20;

  Length = CFDataGetLength(a1);
  v3 = 4 * (Length / 3);
  v4 = v3 + 4 * (Length % 3 > 0);
  if (v4 < Length)
    __assert_rtn("MSPCUCreateBase64StringFromData", "MSProtocolCoreUtilities.m", 43, "encodedLength >= length");
  v5 = Length;
  v6 = (UInt8 *)malloc_type_malloc(v3 + 4 * (Length % 3 > 0), 0xC33B896AuLL);
  if (!v6)
    __assert_rtn("MSPCUCreateBase64StringFromData", "MSProtocolCoreUtilities.m", 46, "destBuf");
  v7 = v6;
  BytePtr = CFDataGetBytePtr(a1);
  if (v5 < 1)
    goto LABEL_19;
  v9 = 0;
  v10 = 0;
  v11 = BytePtr - 1;
  v12 = v5;
  do
  {
    v13 = v10 % 3;
    if (v10 % 3 == 2)
    {
      v15 = v9 + 1;
      v7[v9] = MSPCUCreateBase64StringFromData_DataEncodeTable[((unint64_t)(v11[1] | (*v11 << 8)) >> 6) & 0x3F];
      v14 = v11[1] & 0x3F;
      v16 = 2;
    }
    else
    {
      if (v13 == 1)
      {
        v14 = ((unint64_t)(v11[1] | (*v11 << 8)) >> 4) & 0x3F;
      }
      else
      {
        if (v13)
          goto LABEL_13;
        v14 = (unint64_t)v11[1] >> 2;
      }
      v16 = 1;
      v15 = v9;
    }
    v9 += v16;
    v7[v15] = MSPCUCreateBase64StringFromData_DataEncodeTable[v14];
LABEL_13:
    ++v10;
    ++v11;
    --v12;
  }
  while (v12);
  if (v5 % 3uLL == 2)
  {
    v18 = MSPCUCreateBase64StringFromData_DataEncodeTable[4 * (*v11 & 0xF)];
    v19 = 1;
    v17 = v9;
LABEL_18:
    v7[v17] = v18;
    v7[v9 + v19] = 61;
  }
  else if (v5 % 3uLL == 1)
  {
    v17 = v9 + 1;
    v7[v9] = MSPCUCreateBase64StringFromData_DataEncodeTable[16 * (*v11 & 3)];
    v18 = 61;
    v19 = 2;
    goto LABEL_18;
  }
LABEL_19:
  v20 = CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v7, v4, 0x600u, 0);
  free(v7);
  return v20;
}

uint64_t MSPCUNumberFormatterWithSystemLocale()
{
  if (MSPCUNumberFormatterWithSystemLocale_once != -1)
    dispatch_once(&MSPCUNumberFormatterWithSystemLocale_once, &__block_literal_global_1896);
  return MSPCUNumberFormatterWithSystemLocale_nf;
}

uint64_t MSPCUCreateDataFromHexString(const __CFString *a1, uint64_t a2, __CFData **a3, _QWORD *a4, uint64_t (*a5)(uint64_t))
{
  CFIndex Length;
  uint64_t v9;
  uint64_t v10;
  CFIndex v11;
  UInt8 *v12;
  char *v13;
  uint64_t v14;
  UInt8 *v15;
  __darwin_ct_rune_t v16;
  void *v17;
  char v18;
  __darwin_ct_rune_t v19;
  void *v20;
  __CFData *Mutable;
  uint64_t v22;
  uint8_t buf[16];

  Length = CFStringGetLength(a1);
  v9 = Length;
  if (Length >= 0)
    v10 = Length;
  else
    v10 = Length + 1;
  v11 = v10 >> 1;
  v12 = (UInt8 *)malloc_type_malloc(v10 >> 1, 0x86C2760FuLL);
  v13 = (char *)malloc_type_malloc(v9 + 1, 0x599E8A94uLL);
  if (!CFStringGetCString(a1, v13, v9 + 1, 0x600u))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not parse file hash.", buf, 2u);
      if (a4)
        goto LABEL_15;
      goto LABEL_17;
    }
LABEL_14:
    if (a4)
    {
LABEL_15:
      v22 = 0;
      *a4 = a5(a2);
      goto LABEL_18;
    }
LABEL_17:
    v22 = 0;
    goto LABEL_18;
  }
  if (v9 >= 2)
  {
    v14 = 0;
    v15 = v12;
    do
    {
      v16 = __tolower(v13[v14]);
      v17 = memchr("0123456789abcdef", v16, 0x11uLL);
      if (!v17)
        goto LABEL_14;
      v18 = (char)v17;
      v19 = __tolower(v13[v14 + 1]);
      v20 = memchr("0123456789abcdef", v19, 0x11uLL);
      if (!v20)
        goto LABEL_14;
      *v15++ = ((_BYTE)v20 - "0123456789abcdef") | (16 * (v18 - "0123456789abcdef"));
      v14 += 2;
    }
    while (v14 < v9 - 1);
  }
  if (a3)
  {
    Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v11);
    CFDataAppendBytes(Mutable, v12, v11);
    *a3 = Mutable;
  }
  v22 = 1;
LABEL_18:
  free(v12);
  free(v13);
  return v22;
}

uint64_t MPSStateRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  void *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 48;
          goto LABEL_26;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 40;
          goto LABEL_26;
        case 3u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_26;
        case 4u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
          goto LABEL_26;
        case 5u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
LABEL_26:
          v20 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        case 6u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          *(_BYTE *)(a1 + 56) |= 1u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v24 = *v3;
        v25 = *(_QWORD *)(a2 + v24);
        if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
          break;
        v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
        *(_QWORD *)(a2 + v24) = v25 + 1;
        v23 |= (unint64_t)(v26 & 0x7F) << v21;
        if ((v26 & 0x80) == 0)
          goto LABEL_37;
        v21 += 7;
        v14 = v22++ >= 9;
        if (v14)
        {
          v23 = 0;
          goto LABEL_39;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
      if (*(_BYTE *)(a2 + *v5))
        v23 = 0;
LABEL_39:
      *(_QWORD *)(a1 + 8) = v23;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id MSMMCSHashForFD(int a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t i;
  ssize_t v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  v4 = malloc_type_malloc(0x20000uLL, 0x6BF6B9DAuLL);
  lseek(a1, 0, 0);
  for (i = MMCSSignatureGeneratorCreate(); ; MEMORY[0x1D8255980](i, v4, v6, 1))
  {
    v6 = read(a1, v4, 0x20000uLL);
    if (!v6)
      break;
    if (v6 == -1)
    {
      perror("Failed to read file for hashing.");
      if (v4)
        free(v4);
      MMCSSignatureGeneratorFinish();
      v8 = 0;
      goto LABEL_8;
    }
  }
  if (v4)
    free(v4);
  v7 = MMCSSignatureGeneratorFinish();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v7, MEMORY[0x1D825595C](v7), 1);
LABEL_8:

  return v8;
}

uint64_t _didFinish_2019(id *a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*a1, "_didFinishWithResponse:error:", a2, a3);
}

uint64_t _didFailAuthentication_2020(id *a1, uint64_t a2)
{
  return objc_msgSend(*a1, "_didFailAuthenticationWithError:", a2);
}

void MSSSCPCQueryConfiguration(_QWORD *a1, uint64_t a2, const __CFDictionary *a3)
{
  const __CFData *v6;

  a1[6] = 0;
  a1[7] = _didFinish_2030;
  a1[8] = _didFailAuthentication_2031;
  v6 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  MSSPCStartHTTPTransaction((uint64_t)a1, (uint64_t)CFSTR("GET"), a2, a3, v6, 1, 0);
  CFRelease(v6);
}

void _didFinish_2030(uint64_t a1, CFDataRef theData, CFTypeRef cf)
{
  const __CFData *v4;
  const __CFData *v5;
  CFTypeID v6;
  CFTypeRef cfa;

  cfa = cf;
  if (cf)
  {
    CFRetain(cf);
LABEL_3:
    v4 = 0;
    goto LABEL_4;
  }
  v4 = theData;
  if (theData)
  {
    if (!CFDataGetLength(theData))
      goto LABEL_3;
    v5 = (const __CFData *)CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4, 0, 0, (CFErrorRef *)&cfa);
    v4 = v5;
    if (v5)
    {
      v6 = CFGetTypeID(v5);
      if (v6 != CFDictionaryGetTypeID())
      {
        CFRelease(v4);
        v4 = 0;
        cfa = MSPCUCreateError(CFSTR("MSServerSideConfigCoreErrorDomain"), 0, CFSTR("SERVER_CONFIG_INVALID"));
      }
    }
  }
LABEL_4:
  (*(void (**)(uint64_t, const __CFData *, CFTypeRef))(a1 + 128))(a1, v4, cfa);
  if (v4)
    CFRelease(v4);
  if (cfa)
    CFRelease(cfa);
}

uint64_t _didFailAuthentication_2031(uint64_t result)
{
  uint64_t (*v1)(void);

  v1 = *(uint64_t (**)(void))(result + 136);
  if (v1)
    return v1();
  return result;
}

void MSRSPCResetServerStateAsync(_QWORD *a1, uint64_t a2, const __CFDictionary *a3)
{
  a1[6] = 0;
  a1[7] = _didFinish_2223;
  a1[8] = _didFailAuthentication_2224;
  a1[9] = _didReceiveServerSideConfigurationVersion_2225;
  MSSPCStartHTTPTransaction((uint64_t)a1, (uint64_t)CFSTR("POST"), a2, a3, 0, 0, 0);
}

uint64_t _didFinish_2223(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = 138543362;
    v7 = a3;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Can't reset server state. Error: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 128))(a1, a3);
}

uint64_t _didFailAuthentication_2224(uint64_t result)
{
  uint64_t (*v1)(void);

  v1 = *(uint64_t (**)(void))(result + 136);
  if (v1)
    return v1();
  return result;
}

uint64_t _didReceiveServerSideConfigurationVersion_2225(uint64_t result)
{
  uint64_t (*v1)(void);

  v1 = *(uint64_t (**)(void))(result + 144);
  if (v1)
    return v1();
  return result;
}

uint64_t _protocolDidFinish_2294(id *a1, uint64_t a2)
{
  return objc_msgSend(*a1, "_coreProtocolDidFinishError:", a2);
}

uint64_t _protocolDidFailAuthentication_2295(id *a1, uint64_t a2)
{
  return objc_msgSend(*a1, "_coreProtocolDidFailAuthenticationError:", a2);
}

uint64_t _protocolDidReceiveServerSideConfigurationVersion_2296(id *a1, uint64_t a2)
{
  return objc_msgSend(*a1, "_didFindServerSideConfigurationVersion:", a2);
}

void MSRPCReauthorizeAsync(_QWORD *a1, uint64_t a2, const __CFDictionary *a3, const void *a4, const void *a5)
{
  const __CFAllocator *v10;
  __CFDictionary *Mutable;
  __CFDictionary *v12;
  CFDataRef v13;
  const __CFData *v14;
  CFErrorRef error;
  uint8_t buf[4];
  CFErrorRef v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  a1[6] = 0;
  a1[7] = _didFinish_2385;
  a1[9] = _didReceiveServerSideConfigurationVersion_2388;
  a1[10] = _didReceiveRetryAfter_2387;
  a1[8] = _didFailAuthentication_2386;
  v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!Mutable)
    __assert_rtn("MSRPCReauthorizeAsync", "MSReauthorizeProtocolCore.m", 35, "messageDict");
  v12 = Mutable;
  CFDictionaryAddValue(Mutable, a4, a5);
  error = 0;
  v13 = CFPropertyListCreateData(v10, v12, kCFPropertyListXMLFormat_v1_0, 0, &error);
  if (v13)
  {
    v14 = v13;
    CFRelease(v12);
    MSSPCStartHTTPTransaction((uint64_t)a1, (uint64_t)CFSTR("POST"), a2, a3, v14, 1, 0);
    CFRelease(v14);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v17 = error;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to serialize reauthorize data: %{public}@", buf, 0xCu);
    }
    if (error)
      CFRelease(error);
    CFRelease(v12);
    MSSPCStartHTTPTransaction((uint64_t)a1, (uint64_t)CFSTR("POST"), a2, a3, 0, 1, 0);
  }
}

void _didFinish_2385(uint64_t a1, CFDataRef theData, __CFError *a3)
{
  CFPropertyListRef v6;
  CFErrorRef error;

  error = a3;
  if (theData && !a3 && CFDataGetLength(theData))
  {
    v6 = CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], theData, 0, 0, &error);
    (*(void (**)(uint64_t, CFPropertyListRef, CFErrorRef))(a1 + 128))(a1, v6, error);
    if (v6)
      CFRelease(v6);
  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, __CFError *))(a1 + 128))(a1, 0, a3);
  }
}

uint64_t _didFailAuthentication_2386(uint64_t result)
{
  uint64_t (*v1)(void);

  v1 = *(uint64_t (**)(void))(result + 136);
  if (v1)
    return v1();
  return result;
}

uint64_t _didReceiveRetryAfter_2387(uint64_t result)
{
  uint64_t (*v1)(void);

  v1 = *(uint64_t (**)(void))(result + 144);
  if (v1)
    return v1();
  return result;
}

uint64_t _didReceiveServerSideConfigurationVersion_2388(uint64_t result)
{
  uint64_t (*v1)(void);

  v1 = *(uint64_t (**)(void))(result + 152);
  if (v1)
    return v1();
  return result;
}

uint64_t _protocolDidFinish_2422(id *a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*a1, "_coreProtocolDidFinishResponse:error:", a2, a3);
}

uint64_t _protocolDidFailAuthentication_2423(id *a1, uint64_t a2)
{
  return objc_msgSend(*a1, "_coreProtocolDidFailAuthenticationError:", a2);
}

uint64_t _protocolDidReceiveRetryAfterDate_2424(id *a1, uint64_t a2)
{
  return objc_msgSend(*a1, "_didReceiveRetryAfterDate:", a2);
}

uint64_t _protocolDidReceiveServerSideConfigurationVersion_2425(id *a1, uint64_t a2)
{
  return objc_msgSend(*a1, "_didFindServerSideConfigurationVersion:", a2);
}

void sub_1D3EC1388(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _commitMasterManifest_2926()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend((id)_internalMasterManifest, "objectForKey:", CFSTR("nextActivityDateByPersonID"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "count");

  if (v1)
  {
    v2 = (void *)_internalMasterManifest;
    MSPathDeleteMasterManifest();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "writeToFile:atomically:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    MSPathDeleteMasterManifest();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeItemAtPath:error:", v3, 0);

  }
}

id _masterNextActivityDateByPersonID_2948()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v0 = (void *)_internalMasterManifest;
  if (!_internalMasterManifest)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    MSPathDeleteDir();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v2, 1, 0, 0);

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    MSPathDeleteMasterManifest();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0CB38B0];
      v7 = (void *)MEMORY[0x1E0C99D50];
      MSPathDeleteMasterManifest();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dataWithContentsOfFile:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      objc_msgSend(v6, "propertyListWithData:options:format:error:", v9, 1, 0, &v18);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v18;
      v12 = (void *)_internalMasterManifest;
      _internalMasterManifest = v10;

      if (!_internalMasterManifest && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v20 = v11;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to deserialize delete master manifest: %{public}@", buf, 0xCu);
      }

    }
    v0 = (void *)_internalMasterManifest;
    if (!_internalMasterManifest)
    {
      v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v14 = (void *)_internalMasterManifest;
      _internalMasterManifest = (uint64_t)v13;

      v0 = (void *)_internalMasterManifest;
    }
  }
  v15 = v0;
  objc_msgSend(v15, "objectForKey:", CFSTR("nextActivityDateByPersonID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v16, CFSTR("nextActivityDateByPersonID"));
  }

  return v16;
}

uint64_t _protocolDidFinish_3027(id *a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*a1, "_coreProtocolDidFinishResponse:error:", a2, a3);
}

uint64_t _protocolDidFailAuthentication_3028(id *a1, uint64_t a2)
{
  return objc_msgSend(*a1, "_coreProtocolDidFailAuthenticationError:", a2);
}

uint64_t _protocolDidReceiveRetryAfterDate_3029(id *a1, uint64_t a2)
{
  return objc_msgSend(*a1, "_didReceiveRetryAfterDate:", a2);
}

uint64_t _protocolDidReceiveServerSideConfigurationVersion_3030(id *a1, uint64_t a2)
{
  return objc_msgSend(*a1, "_didFindServerSideConfigurationVersion:", a2);
}

void MSDSPCSendDeletionRequestAsync(_QWORD *a1, uint64_t a2, const __CFDictionary *a3, const __CFArray *a4)
{
  CFMutableArrayRef Mutable;
  __CFArray *v9;
  CFIndex Count;
  CFIndex v11;
  CFIndex v12;
  const CFDictionaryKeyCallBacks *v13;
  const CFDictionaryValueCallBacks *v14;
  const __CFDictionary *ValueAtIndex;
  CFMutableDictionaryRef v16;
  __CFDictionary *v17;
  CFStringRef v18;
  CFStringRef v19;
  const void *v20;
  CFDataRef Data;
  const __CFData *v22;
  uint64_t v23;
  const __CFDictionary *v24;
  void *value;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  a1[7] = _didFinish_3050;
  a1[8] = _didFailAuthentication_3051;
  a1[9] = _didReceiveServerSideConfigurationVersion_3053;
  a1[10] = _didReceiveRetryAfter_3052;
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  if (!Mutable)
    __assert_rtn("MSDSPCSendDeletionRequestAsync", "MSDeleteStreamsProtocolCore.m", 40, "messageDeleteArray");
  v9 = Mutable;
  v23 = (uint64_t)a1;
  v24 = a3;
  Count = CFArrayGetCount(a4);
  if (Count >= 1)
  {
    v11 = Count;
    v12 = 0;
    v13 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
    v14 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
    do
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a4, v12);
      v16 = CFDictionaryCreateMutable(0, 0, v13, v14);
      if (v16)
      {
        v17 = v16;
        value = 0;
        CFDictionaryGetValueIfPresent(ValueAtIndex, CFSTR("fileHash"), (const void **)&value);
        if (value)
        {
          v18 = MSSPCCreateHexStringFromData((const __CFData *)value);
          if (v18)
          {
            v19 = v18;
            CFDictionarySetValue(v17, CFSTR("checksum"), v18);
            CFRelease(v19);
          }
          else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v27 = value;
            _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Cannot convert file hash %{public}@ to string.", buf, 0xCu);
          }
        }
        if (CFDictionaryContainsKey(ValueAtIndex, CFSTR("UUID")))
        {
          v20 = CFDictionaryGetValue(ValueAtIndex, CFSTR("UUID"));
          CFDictionarySetValue(v17, CFSTR("assetcollid"), v20);
        }
        CFArrayAppendValue(v9, v17);
        CFRelease(v17);
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Cannot create dictionary.", buf, 2u);
      }
      ++v12;
    }
    while (v11 != v12);
  }
  value = 0;
  Data = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v9, kCFPropertyListXMLFormat_v1_0, 0, (CFErrorRef *)&value);
  if (Data)
  {
    v22 = Data;
    CFRelease(v9);
    MSSPCStartHTTPTransaction(v23, (uint64_t)CFSTR("POST"), a2, v24, v22, 1, 0);
    CFRelease(v22);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v27 = value;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to serialize delete request data: %{public}@", buf, 0xCu);
    }
    if (value)
      CFRelease(value);
    CFRelease(v9);
    MSSPCStartHTTPTransaction(v23, (uint64_t)CFSTR("POST"), a2, v24, 0, 1, 0);
  }
}

void _didFinish_3050(uint64_t a1, CFDataRef theData, __CFError *a3)
{
  CFPropertyListRef v4;
  const void *v5;
  CFTypeID v6;
  __CFArray *Mutable;
  BOOL v8;
  CFIndex Count;
  CFIndex v10;
  CFIndex v11;
  const __CFString *v12;
  const CFDictionaryKeyCallBacks *v13;
  const CFDictionaryValueCallBacks *v14;
  const void *ValueAtIndex;
  CFTypeID v16;
  CFMutableDictionaryRef v17;
  __CFDictionary *v18;
  const __CFString *v19;
  const void *v20;
  CFIndex v21;
  __CFArray *v22;
  const __CFString *v23;
  const CFDictionaryValueCallBacks *v24;
  const CFDictionaryKeyCallBacks *v25;
  CFTypeID v26;
  CFTypeID v27;
  const __CFNumber *NumberFromString;
  const __CFNumber *v29;
  const void *v30;
  const void *v31;
  const void *v32;
  void *v33;
  int valuePtr;
  void *value;
  CFErrorRef error;

  error = a3;
  if (theData && CFDataGetLength(theData))
  {
    v4 = CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], theData, 0, 0, &error);
    v5 = v4;
    if (!v4)
      goto LABEL_7;
    v6 = CFGetTypeID(v4);
    if (v6 == CFArrayGetTypeID())
      goto LABEL_7;
    CFRelease(v5);
  }
  v5 = 0;
LABEL_7:
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  if (Mutable)
    v8 = error == 0;
  else
    v8 = 0;
  if (v8)
  {
    Count = CFArrayGetCount((CFArrayRef)v5);
    if (Count <= 0)
    {
      (*(void (**)(uint64_t, __CFArray *, CFErrorRef))(a1 + 128))(a1, Mutable, error);
      goto LABEL_45;
    }
    v10 = Count;
    v11 = 0;
    v12 = CFSTR("checksum");
    v13 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
    v14 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
    v31 = (const void *)*MEMORY[0x1E0C9AE40];
    v32 = (const void *)*MEMORY[0x1E0C9AE50];
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v5, v11);
      v16 = CFGetTypeID(ValueAtIndex);
      if (v16 != CFDictionaryGetTypeID())
        break;
      v17 = CFDictionaryCreateMutable(0, 0, v13, v14);
      if (v17)
      {
        v18 = v17;
        if (!CFDictionaryContainsKey((CFDictionaryRef)ValueAtIndex, v12))
          goto LABEL_20;
        v19 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, v12);
        value = 0;
        MSPCUCreateDataFromHexString(v19, (uint64_t)v12, (__CFData **)&value, &error, (uint64_t (*)(uint64_t))_createBadFieldError_3065);
        if (!error)
        {
          if (value)
          {
            CFDictionarySetValue(v18, CFSTR("fileHash"), value);
            CFRelease(value);
          }
LABEL_20:
          if (CFDictionaryContainsKey((CFDictionaryRef)ValueAtIndex, CFSTR("assetcollid")))
          {
            v33 = (void *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("assetcollid"));
            v20 = v5;
            v21 = v10;
            v22 = Mutable;
            v23 = v12;
            v24 = v14;
            v25 = v13;
            v26 = CFGetTypeID(v33);
            v8 = v26 == CFStringGetTypeID();
            v13 = v25;
            v14 = v24;
            v12 = v23;
            Mutable = v22;
            v10 = v21;
            v5 = v20;
            if (v8)
              CFDictionarySetValue(v18, CFSTR("UUID"), v33);
          }
          value = 0;
          CFDictionaryGetValueIfPresent((CFDictionaryRef)ValueAtIndex, CFSTR("success"), (const void **)&value);
          if (value)
          {
            v27 = CFGetTypeID(value);
            if (v27 == CFStringGetTypeID())
            {
              if (MSPCUNumberFormatterWithSystemLocale_once != -1)
                dispatch_once(&MSPCUNumberFormatterWithSystemLocale_once, &__block_literal_global_1896);
              NumberFromString = CFNumberFormatterCreateNumberFromString(0, (CFNumberFormatterRef)MSPCUNumberFormatterWithSystemLocale_nf, (CFStringRef)value, 0, 0);
              if (NumberFromString)
              {
                v29 = NumberFromString;
                valuePtr = 0;
                CFNumberGetValue(NumberFromString, kCFNumberIntType, &valuePtr);
                if (valuePtr)
                  v30 = v32;
                else
                  v30 = v31;
                CFDictionarySetValue(v18, CFSTR("deleteResult"), v30);
                CFRelease(v29);
              }
            }
          }
          CFArrayAppendValue(Mutable, v18);
        }
        CFRelease(v18);
        if (error)
          goto LABEL_40;
        if (++v11 >= v10)
          goto LABEL_40;
      }
      else
      {
LABEL_39:
        if (++v11 >= v10)
          goto LABEL_40;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LOWORD(value) = 0;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Response array element is not a dictionary.", (uint8_t *)&value, 2u);
    }
    goto LABEL_39;
  }
LABEL_40:
  (*(void (**)(uint64_t, __CFArray *))(a1 + 128))(a1, Mutable);
  if (!Mutable)
  {
    if (!v5)
      return;
    goto LABEL_42;
  }
LABEL_45:
  CFRelease(Mutable);
  if (!v5)
    return;
LABEL_42:
  CFRelease(v5);
}

uint64_t _didFailAuthentication_3051(uint64_t result)
{
  uint64_t (*v1)(void);

  v1 = *(uint64_t (**)(void))(result + 136);
  if (v1)
    return v1();
  return result;
}

uint64_t _didReceiveRetryAfter_3052(uint64_t result)
{
  uint64_t (*v1)(void);

  v1 = *(uint64_t (**)(void))(result + 152);
  if (v1)
    return v1();
  return result;
}

uint64_t _didReceiveServerSideConfigurationVersion_3053(uint64_t result)
{
  uint64_t (*v1)(void);

  v1 = *(uint64_t (**)(void))(result + 144);
  if (v1)
    return v1();
  return result;
}

CFErrorRef _createBadFieldError_3065(uint64_t a1)
{
  return MSPCUCreateError(CFSTR("MSDeleteStreamsProtocolCoreErrorDomain"), 0, CFSTR("ERROR_DELETE_CORE_BAD_FIELD_P_FIELD"), a1);
}

id _copyAssetsIntoAssetCollection(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v5;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(obj);
        +[MSAsset assetWithAsset:](MSAsset, "assetWithAsset:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setAssetCollectionGUID:", v7);
        objc_msgSend(v6, "metadata");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", CFSTR("batchDateCreated"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setBatchCreationDate:", v15);

        objc_msgSend(v6, "metadata");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKey:", CFSTR("dateCreated"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setPhotoCreationDate:", v17);

        objc_msgSend(v8, "addObject:", v13);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  return v8;
}

void sub_1D3EC9134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3EC9204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3ECB8C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3ECBE1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3ECBF24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3481(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3482(uint64_t a1)
{

}

void sub_1D3ECCF24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3ECEDE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void MSASInitialize(id obj)
{
  uint8_t v1[16];

  objc_storeStrong((id *)&_thePlatform, obj);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "MSASPlatform initialized.", v1, 2u);
  }
}

id MSASPlatform()
{
  if (!_thePlatform)
    __assert_rtn("MSASPlatform", "MSASPlatform.m", 22, "_thePlatform");
  return (id)_thePlatform;
}

uint64_t MSASPlatformIsDebugLoggingEnabled()
{
  uint64_t result;

  result = _thePlatform;
  if (_thePlatform)
    return objc_msgSend((id)_thePlatform, "shouldLogAtLevel:", 7);
  return result;
}

void sub_1D3ED02A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3ED0380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3ED0478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3ED0B08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  id *v11;
  id *v12;
  id *v13;
  uint64_t v14;

  objc_destroyWeak(v13);
  objc_destroyWeak(v12);
  objc_destroyWeak(v11);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v14 - 128));
  _Unwind_Resume(a1);
}

void sub_1D3ED1FA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3ED2084(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3ED26F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D3ED2864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D3ED2BFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3ED3098(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  _Unwind_Resume(exception_object);
}

void sub_1D3ED4CDC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_1D3ED5264(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  id *v33;
  uint64_t v34;

  objc_destroyWeak(v33);
  objc_destroyWeak((id *)(v34 - 112));
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_1D3ED58EC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1D3ED5C34(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_1D3ED5F7C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_1D3ED633C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1D3ED6688(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_1D3ED6DDC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_1D3ED7260(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_1D3ED7690(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 144));
  _Unwind_Resume(a1);
}

void sub_1D3ED7BBC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Block_object_dispose((const void *)(v2 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1D3ED8094(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  id *v33;
  uint64_t v34;

  objc_destroyWeak(v33);
  objc_destroyWeak((id *)(v34 - 160));
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_1D3ED83F0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_1D3ED8804(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_1D3ED8D70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  uint64_t v9;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v9 - 160));
  _Unwind_Resume(a1);
}

void sub_1D3ED90B8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_1D3ED9460(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_1D3EDADAC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 160));
  _Unwind_Resume(a1);
}

void sub_1D3EDB1B4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void sub_1D3EDB610(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id location)
{
  id *v30;

  objc_destroyWeak(v30);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D3EDB9EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D3EDBDC8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_1D3EDC374(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  uint64_t v10;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v10 - 160));
  _Unwind_Resume(a1);
}

void sub_1D3EDD79C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_1D3EDEB30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  objc_destroyWeak(location);
  _Unwind_Resume(a1);
}

void sub_1D3EE066C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D3EE0914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D3EE1AE0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D3EE25A8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D3EE2F24(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D3EE3F68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *a9, id *location)
{
  id *v10;

  objc_destroyWeak(v10);
  objc_destroyWeak(a9);
  objc_destroyWeak(location);
  _Unwind_Resume(a1);
}

void sub_1D3EE45D8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D3EE580C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D3EE6E9C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D3EE7620(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D3EE7E34(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D3EE8800(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D3EE90BC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4154(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4155(uint64_t a1)
{

}

void sub_1D3EEA6F0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D3EEB2CC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D3EEB554(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D3EEBF68(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D3EEC8D8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D3EECF90(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D3EED7B4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D3EEDF4C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D3EEE758(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D3EEF4D0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D3EF025C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D3EF1254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3EF2D9C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1D3EF5ACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  uint64_t v36;

  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v36 - 216), 8);
  _Block_object_dispose((const void *)(v36 - 184), 8);
  _Block_object_dispose((const void *)(v36 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1D3EF60E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3EF61A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3EF6288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3EF6CFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3EF6E74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3EF6F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3EF70A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3EF72CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3EF73D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3EF7834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3EF7918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3EF79F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3EF7B34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4448(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4449(uint64_t a1)
{

}

void sub_1D3EFB4BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3EFB5B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4668(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4669(uint64_t a1)
{

}

void sub_1D3EFC0A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3EFCE10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3EFCF18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3EFD0DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4808(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4809(uint64_t a1)
{

}

BOOL _pointerComparisonCallback_4853(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void sub_1D3EFFE58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5042(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5043(uint64_t a1)
{

}

uint64_t _getFileDescriptorAndContentTypeFromItemCallback(void *a1, uint64_t a2, uint64_t a3, _QWORD *a4, _QWORD *a5)
{
  uint64_t v7;
  id v8;
  id v9;
  id v11;
  id v12;

  v11 = 0;
  v12 = 0;
  v7 = objc_msgSend(a1, "_getFileDescriptorAndContentTypeFromItemID:outFD:outItemType:outError:", a2, a3, &v12, &v11);
  v8 = v12;
  v9 = v11;
  if ((_DWORD)v7)
  {
    if (a4)
      *a4 = v8;
    if (a5)
      *a5 = v9;
  }

  return v7;
}

void _getItemProgressCallback_5107(void *a1, uint64_t a2, double a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v10;
  id v11;

  v10 = a1;
  objc_msgSend(v10, "engine");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_getItemProgressItemID:state:progress:requestorContext:error:", a2, a5, v10, a6, a3);

}

void _getItemDoneCallback_5108(void *a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5)
{
  void *v8;
  void *v9;
  id v10;

  v10 = a1;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFileSystemRepresentation:length:", a4, strlen(a4));
    a4 = (char *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v10, "engine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_getItemDoneItemID:path:requestorContext:error:", a2, a4, v10, a5);

}

void _putItemProgressCallback_5109(void *a1, uint64_t a2, double a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v11;
  id v12;

  v11 = a1;
  objc_msgSend(v11, "engine");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_putItemProgressItemID:state:progress:requestorContext:error:", a2, a5, v11, a7, a3);

}

void _putItemDoneCallback_5110(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v8;
  id v9;

  v8 = a1;
  objc_msgSend(v8, "engine");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_putItemDoneItemID:requestorContext:putReceipt:error:", a2, v8, a4, a5);

}

void _requestCompletedCallback_5111(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  objc_msgSend(v1, "engine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_requestCompletedRequestorContext:", v1);

}

void sub_1D3F023E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F02488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F02528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F025C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F0268C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5161(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5162(uint64_t a1)
{

}

id getCKContainerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCKContainerClass_softClass;
  v7 = getCKContainerClass_softClass;
  if (!getCKContainerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCKContainerClass_block_invoke;
    v3[3] = &unk_1E95BC198;
    v3[4] = &v4;
    __getCKContainerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1D3F0CA64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCKContainerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!CloudKitLibraryCore_frameworkLibrary)
    CloudKitLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!CloudKitLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CloudKitLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("MSProtocolUtilities.m"), 23, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("CKContainer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCKContainerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("MSProtocolUtilities.m"), 24, CFSTR("Unable to find class %s"), "CKContainer");

LABEL_8:
    __break(1u);
  }
  getCKContainerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void ___retryAfterDateFormatter_block_invoke()
{
  __CFDateFormatter *v0;

  v0 = CFDateFormatterCreate(0, 0, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  _retryAfterDateFormatter_df_5769 = (uint64_t)v0;
  if (v0)
    CFDateFormatterSetProperty(v0, (CFStringRef)*MEMORY[0x1E0C9AEF8], (CFTypeRef)*MEMORY[0x1E0C9AE50]);
}

void ___nonNumericNonSpaceCharacterSet_block_invoke()
{
  const __CFCharacterSet *v0;
  const __CFCharacterSet *v1;
  uint8_t v2[16];

  v0 = CFCharacterSetCreateWithCharactersInString(0, CFSTR("0123456789 "));
  if (v0)
  {
    v1 = v0;
    _nonNumericNonSpaceCharacterSet_charSet_5767 = (uint64_t)CFCharacterSetCreateInvertedSet(0, v0);
    CFRelease(v1);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not create character set for date matching.", v2, 2u);
  }
}

void sub_1D3F0E4C8(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

id _errorWithException(void *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(a1, "reason");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "MSErrorWithDomain:code:description:", CFSTR("MSArchiverUtilitiesErrorDomain"), 0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_1D3F0F7C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6191(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6192(uint64_t a1)
{

}

void sub_1D3F11620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F11700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F11850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F11968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F11B20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F11CD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F11DB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F11E94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F11FAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F12104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F123AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F124C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F12678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F12790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F12944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F12A58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F12C28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F12DF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F12FC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F13198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F13368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F138DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F13A50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F1A0B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F1A170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F1A2D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F1A3B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F1ACE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F1ADE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F1D1A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F1D2C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F1D3C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F1D4E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F1D5E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F1F91C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6323(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6324(uint64_t a1)
{

}

void sub_1D3F294CC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1D3F29980(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1D3F2D8C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F2DA74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 144), 8);
  _Unwind_Resume(a1);
}

void MSLogSqliteError(sqlite3 *a1, uint64_t a2, int a3)
{
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = 138543874;
    v7 = a2;
    v8 = 1024;
    v9 = a3;
    v10 = 2082;
    v11 = sqlite3_errmsg(a1);
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: %d: SQL operation failed: %{public}s", (uint8_t *)&v6, 0x1Cu);
  }
}

uint64_t MSSqliteBindDataOrNull(sqlite3_stmt *a1, int a2, void *a3)
{
  id v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "length");
    if (v7 >> 31)
      __assert_rtn("MSSqliteBindDataOrNull", "MSSqliteUtilities.m", 21, "dataLength <= INT_MAX");
    v8 = sqlite3_bind_blob(a1, a2, (const void *)objc_msgSend(objc_retainAutorelease(v6), "bytes"), v7, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    v8 = sqlite3_bind_null(a1, a2);
  }
  v9 = v8;

  return v9;
}

uint64_t MSSqliteBindStringOrNull(sqlite3_stmt *a1, int a2, id a3)
{
  if (a3)
    return sqlite3_bind_text(a1, a2, (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  else
    return sqlite3_bind_null(a1, a2);
}

uint64_t MSSqliteBindTimeIntervalSinceReferenceDateOrNull(sqlite3_stmt *a1, int a2, void *a3)
{
  double v5;

  if (!a3)
    return sqlite3_bind_null(a1, a2);
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  return sqlite3_bind_double(a1, a2, v5);
}

id MSSqliteStringFromStatementColumn(sqlite3_stmt *a1, int a2)
{
  void *v2;

  v2 = (void *)sqlite3_column_text(a1, a2);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

id MSSqliteDataFromStatementColumn(sqlite3_stmt *a1, int a2)
{
  const void *v4;
  int v5;
  void *v6;

  v4 = sqlite3_column_blob(a1, a2);
  v5 = sqlite3_column_bytes(a1, a2);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

id MSSqliteObjectFromStatementColumn(sqlite3_stmt *a1, int a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3710];
  MSSqliteDataFromStatementColumn(a1, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSSafeUnarchiveObjectWithData:outError:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id MSSqliteDateFromTimeIntervalStatementColumn(sqlite3_stmt *a1, int a2)
{
  void *v2;

  if (sqlite3_column_double(a1, a2) == 0.0)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

uint64_t MSSqliteTrapForDBLockError(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint8_t v3[16];
  uint64_t v4;
  uint64_t v5;

  if ((_DWORD)result == 5)
  {
    v4 = v1;
    v5 = v2;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v3 = 0;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "sqlite3 operation failed with a SQLITE_BUSY. Please grab the crash report and attach to <rdar://problem/11375454>!.", v3, 2u);
    }
    __assert_rtn("MSSqliteTrapForDBLockError", "MSSqliteUtilities.m", 72, "0");
  }
  return result;
}

void sub_1D3F2E700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F2ECF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1D3F2EF50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1D3F2F1D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1D3F2F438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1D3F3B384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6975(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6976(uint64_t a1)
{

}

void sub_1D3F3C8F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F3E86C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_1D3F3ECCC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t _setFieldsInSharingRelationship(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  BOOL v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  void *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend(v4, "objectForKey:", CFSTR("invitationguid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("invitationguid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setGUID:", v6);

  }
  else
  {
    objc_msgSend(v3, "setGUID:", 0);
  }

  objc_msgSend(v4, "objectForKey:", CFSTR("email"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("email"));
    v8 = objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_8;
    objc_msgSend(v3, "setEmail:", v8);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEmails:", v9);

    v7 = (void *)v8;
  }

LABEL_8:
  objc_msgSend(v4, "objectForKey:", CFSTR("firstname"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("firstname"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFirstName:", v11);

  }
  else
  {
    objc_msgSend(v3, "setFirstName:", 0);
  }

  objc_msgSend(v4, "objectForKey:", CFSTR("lastname"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("lastname"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLastName:", v13);

  }
  else
  {
    objc_msgSend(v3, "setLastName:", 0);
  }

  objc_msgSend(v4, "objectForKey:", CFSTR("fullname"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("fullname"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFullName:", v15);

  }
  else
  {
    objc_msgSend(v3, "setFullName:", 0);
  }

  objc_msgSend(v4, "objectForKey:", CFSTR("personid"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("personid"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPersonID:", v17);

  }
  else
  {
    objc_msgSend(v3, "setPersonID:", 0);
  }

  objc_msgSend(v4, "objectForKey:", CFSTR("albumguid"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("albumguid"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAlbumGUID:", v19);

  }
  else
  {
    objc_msgSend(v3, "setAlbumGUID:", 0);
  }

  objc_msgSend(v4, "objectForKey:", CFSTR("requestedbyme"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("requestedbyme"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21 && objc_msgSend(v21, "isEqualToString:", CFSTR("1")))
      objc_msgSend(v3, "setIsMine:", 1);
  }
  else
  {

    v21 = 0;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("phonenumbers"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("phonenumbers"));
    v23 = (id)objc_claimAutoreleasedReturnValue();

    if (v23 && objc_msgSend(v23, "count"))
    {
      v46 = v21;
      v47 = v3;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v23, "count"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v23 = v23;
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v49;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v49 != v27)
              objc_enumerationMutation(v23);
            v29 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
            objc_msgSend(v29, "objectForKey:", CFSTR("phonenumber"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "objectForKey:", CFSTR("invitationtoken"));
            v31 = objc_claimAutoreleasedReturnValue();
            v32 = (void *)v31;
            if (v30)
              v33 = v31 == 0;
            else
              v33 = 1;
            if (!v33)
              objc_msgSend(v24, "addObject:", v30);

          }
          v26 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
        }
        while (v26);
      }

      v3 = v47;
      if (objc_msgSend(v24, "count"))
        objc_msgSend(v47, "setPhones:", v24);

      v21 = v46;
    }
  }
  else
  {

    v23 = 0;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("subscriptiondate"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("subscriptiondate"));
    v35 = objc_claimAutoreleasedReturnValue();

    if (!v35)
      goto LABEL_51;
    v36 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v36, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss'Z'"));
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setTimeZone:", v37);

    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US"));
    objc_msgSend(v36, "setLocale:", v38);
    objc_msgSend(v36, "dateFromString:", v35);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSubscriptionDate:", v39);

    v34 = (void *)v35;
  }

LABEL_51:
  objc_msgSend(v4, "objectForKey:", CFSTR("sharingtype"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v42 = 1;
LABEL_69:

    goto LABEL_70;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("sharingtype"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    if (objc_msgSend(v41, "isEqualToString:", CFSTR("pending")))
    {
      v42 = 1;
      objc_msgSend(v3, "setState:", 1);
    }
    else
    {
      if (objc_msgSend(v41, "isEqualToString:", CFSTR("declined")))
      {
        v43 = v3;
        v44 = 4;
      }
      else if (objc_msgSend(v41, "isEqualToString:", CFSTR("subscribed")))
      {
        v43 = v3;
        v44 = 2;
      }
      else if (objc_msgSend(v41, "isEqualToString:", CFSTR("unsubscribed")))
      {
        v43 = v3;
        v44 = 3;
      }
      else if (objc_msgSend(v41, "isEqualToString:", CFSTR("owned")))
      {
        v43 = v3;
        v44 = 0;
      }
      else
      {
        if (!objc_msgSend(v41, "isEqualToString:", CFSTR("unshared")))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v53 = v41;
            _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unknown sharing relationship: %@, skipping.", buf, 0xCu);
          }
          v42 = 0;
          goto LABEL_68;
        }
        v43 = v3;
        v44 = 5;
      }
      objc_msgSend(v43, "setState:", v44);
      v42 = 1;
    }
LABEL_68:
    v40 = v41;
    goto LABEL_69;
  }
  v42 = 1;
LABEL_70:

  return v42;
}

void sub_1D3F45AFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F45C3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F45D7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3F46064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80310](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80318](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80320](c, data, *(_QWORD *)&len);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80330](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80338](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80340](c, data, *(_QWORD *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x1E0C98050](bundle, key, value, tableName);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x1E0C980E8](bundleID);
}

CFCharacterSetRef CFCharacterSetCreateInvertedSet(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFCharacterSetRef)MEMORY[0x1E0C982C0](alloc, theSet);
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInString(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFCharacterSetRef)MEMORY[0x1E0C982E8](alloc, theString);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x1E0C98390](theData, bytes, length);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983B8](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1E0C98448](allocator, at);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x1E0C98460](allocator, locale, dateStyle, timeStyle);
}

CFDateRef CFDateFormatterCreateDateFromString(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFStringRef string, CFRange *rangep)
{
  return (CFDateRef)MEMORY[0x1E0C98478](allocator, formatter, string, rangep);
}

void CFDateFormatterSetProperty(CFDateFormatterRef formatter, CFStringRef key, CFTypeRef value)
{
  MEMORY[0x1E0C984C8](formatter, key, value);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C984D8](theDate);
  return result;
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98518](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x1E0C985A0](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1E0C985C8](theDict, key, value);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x1E0C98658](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1E0C98660](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x1E0C98670](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFDictionaryRef CFHTTPMessageCopyAllHeaderFields(CFHTTPMessageRef message)
{
  return (CFDictionaryRef)MEMORY[0x1E0C927E8](message);
}

CFIndex CFHTTPMessageGetResponseStatusCode(CFHTTPMessageRef response)
{
  return MEMORY[0x1E0C92848](response);
}

CFLocaleRef CFLocaleGetSystem(void)
{
  return (CFLocaleRef)MEMORY[0x1E0C987F0]();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFNumberFormatterRef CFNumberFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFNumberFormatterStyle style)
{
  return (CFNumberFormatterRef)MEMORY[0x1E0C98938](allocator, locale, style);
}

CFNumberRef CFNumberFormatterCreateNumberFromString(CFAllocatorRef allocator, CFNumberFormatterRef formatter, CFStringRef string, CFRange *rangep, CFOptionFlags options)
{
  return (CFNumberRef)MEMORY[0x1E0C98940](allocator, formatter, string, rangep, options);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0C98AA0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AD0](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C00](rl, timer, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

CFRunLoopTimerRef CFRunLoopTimerCreate(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext *context)
{
  return (CFRunLoopTimerRef)MEMORY[0x1E0C98D08](allocator, flags, order, callout, context, fireDate, interval);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x1E0C98F80](alloc, theString, *(_QWORD *)&encoding, lossByte);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x1E0C99020](alloc, formatOptions, format, arguments);
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1E0C99060](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x1E0C990B0](theString, idx);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1E0C990F0](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

uint64_t CFURLConnectionCancel()
{
  return MEMORY[0x1E0C92928]();
}

uint64_t CFURLConnectionCreateWithProperties()
{
  return MEMORY[0x1E0C92938]();
}

uint64_t CFURLConnectionScheduleWithRunLoop()
{
  return MEMORY[0x1E0C92948]();
}

uint64_t CFURLConnectionStart()
{
  return MEMORY[0x1E0C92958]();
}

uint64_t CFURLConnectionUnscheduleFromRunLoop()
{
  return MEMORY[0x1E0C92960]();
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1E0C99448](allocator, URLString, baseURL);
}

uint64_t CFURLRequestAppendHTTPHeaderFieldValue()
{
  return MEMORY[0x1E0C92998]();
}

uint64_t CFURLRequestCopyAllHTTPHeaderFields()
{
  return MEMORY[0x1E0C929A0]();
}

uint64_t CFURLRequestCreateMutable()
{
  return MEMORY[0x1E0C929C0]();
}

uint64_t CFURLRequestSetHTTPHeaderFieldValue()
{
  return MEMORY[0x1E0C929F0]();
}

uint64_t CFURLRequestSetHTTPRequestBody()
{
  return MEMORY[0x1E0C929F8]();
}

uint64_t CFURLRequestSetHTTPRequestMethod()
{
  return MEMORY[0x1E0C92A08]();
}

uint64_t CFURLResponseGetHTTPResponse()
{
  return MEMORY[0x1E0C92A68]();
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1E0C99518](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1E0C99538](alloc, uuid);
}

uint64_t IDSCopyIDForPhoneNumberWithOptions()
{
  return MEMORY[0x1E0D33E00]();
}

uint64_t MMCSEngineCancelRequests()
{
  return MEMORY[0x1E0D465A0]();
}

uint64_t MMCSEngineCreate()
{
  return MEMORY[0x1E0D465B0]();
}

uint64_t MMCSEngineDestroy()
{
  return MEMORY[0x1E0D465C0]();
}

uint64_t MMCSEngineGetRequestMetrics()
{
  return MEMORY[0x1E0D465C8]();
}

uint64_t MMCSEngineIsActive()
{
  return MEMORY[0x1E0D465D0]();
}

uint64_t MMCSEngineSetMetricsEnabled()
{
  return MEMORY[0x1E0D465D8]();
}

uint64_t MMCSGetItems()
{
  return MEMORY[0x1E0D465E8]();
}

uint64_t MMCSMetricsRequestCopyDescription()
{
  return MEMORY[0x1E0D46630]();
}

uint64_t MMCSPutItems()
{
  return MEMORY[0x1E0D46660]();
}

uint64_t MMCSRegisterFile()
{
  return MEMORY[0x1E0D46680]();
}

uint64_t MMCSSignatureAndSchemeSize()
{
  return MEMORY[0x1E0D46698]();
}

uint64_t MMCSSignatureGeneratorCreate()
{
  return MEMORY[0x1E0D466B0]();
}

uint64_t MMCSSignatureGeneratorFinish()
{
  return MEMORY[0x1E0D466C8]();
}

uint64_t MMCSSignatureGeneratorUpdate()
{
  return MEMORY[0x1E0D466E0]();
}

uint64_t MMCSSignatureIsValid()
{
  return MEMORY[0x1E0D466E8]();
}

uint64_t MMCSUnregisterFile()
{
  return MEMORY[0x1E0D466F8]();
}

uint64_t MMCSUnregisterFiles()
{
  return MEMORY[0x1E0D46700]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1E0D82C58]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1E0D82C68]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1E0D82C98]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1E0D82D00]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C70](*(_QWORD *)&a1);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C28](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C48](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x1E0C82E10](predicate, context, function);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int link(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C83B70](a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1E0C841A0](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_trace_get_mode()
{
  return MEMORY[0x1E0C84958]();
}

void perror(const char *a1)
{
  MEMORY[0x1E0C84AF0](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE8580](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1E0DE8598](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1E0DE85A0](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1E0DE85A8](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1E0DE85B0](a1, *(_QWORD *)&a2);
}

int sqlite3_bind_parameter_index(sqlite3_stmt *a1, const char *zName)
{
  return MEMORY[0x1E0DE85C0](a1, zName);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D8](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8650](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1E0DE8660](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8668](a1, *(_QWORD *)&iCol);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x1E0DE8688](a1, *(_QWORD *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8690](a1, *(_QWORD *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8698](a1, *(_QWORD *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE86B8](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1E0DE8788](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1E0DE8798](a1, sql, callback, a4, errmsg);
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return MEMORY[0x1E0DE87C0](a1, zDbName, *(_QWORD *)&op, a4);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE87C8](pStmt);
}

void sqlite3_free(void *a1)
{
  MEMORY[0x1E0DE87D0](a1);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8820](a1);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return MEMORY[0x1E0DE8868](filename, ppDb);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1E0DE8870](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1E0DE8880](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE88B0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89A8](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1E0C85530](__dst, __src);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85698](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C856A8](__str, __endptr, *(_QWORD *)&__base);
}

