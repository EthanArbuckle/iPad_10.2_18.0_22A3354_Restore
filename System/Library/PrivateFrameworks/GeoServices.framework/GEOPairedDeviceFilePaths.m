@implementation GEOPairedDeviceFilePaths

+ (id)urlFor:(unint64_t)a3 forDevice:(id)a4
{
  id v5;
  char *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v16;
  const char *v17;
  uint8_t *v18;
  uint8_t v19[16];
  uint8_t buf[2];
  __int16 v21;

  v5 = a4;
  if (a3 >= 2)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
LABEL_15:
      v14 = 0;
      goto LABEL_11;
    }
    v21 = 0;
    v16 = MEMORY[0x1E0C81028];
    v17 = "Assertion failed: filePathType < GEOPairedDeviceFilePath_Count";
    v18 = (uint8_t *)&v21;
LABEL_17:
    _os_log_fault_impl(&dword_1885A9000, v16, OS_LOG_TYPE_FAULT, v17, v18, 2u);
    goto LABEL_15;
  }
  if (urlFor_forDevice__filePathRecords[3 * a3] != a3)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_15;
    *(_WORD *)buf = 0;
    v16 = MEMORY[0x1E0C81028];
    v17 = "Assertion failed: record->filePathType == filePathType";
    v18 = buf;
    goto LABEL_17;
  }
  v6 = (char *)&urlFor_forDevice__filePathRecords[3 * a3];
  v7 = *((_QWORD *)v6 + 1);
  v8 = *((id *)v6 + 2);
  if (!v7)
  {
LABEL_9:
    v14 = 0;
    goto LABEL_10;
  }
  if (v7 != 1
    || (+[GEOFilePaths urlFor:](GEOFilePaths, "urlFor:", 14),
        (v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: baseURL != ((void *)0)", v19, 2u);
    }
    goto LABEL_9;
  }
  v10 = (void *)v9;
  objc_msgSend(v5, "pairingID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "URLByAppendingPathComponent:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
LABEL_11:

  return v14;
}

+ (void)registerCleanupTasks
{
  void *v3;
  void *global_queue;
  _QWORD v5[5];

  if (NanoRegistryLibraryCore())
  {
    +[GEOKeyBagNotification sharedObject](GEOKeyBagNotification, "sharedObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    global_queue = (void *)geo_get_global_queue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __48__GEOPairedDeviceFilePaths_registerCleanupTasks__block_invoke;
    v5[3] = &__block_descriptor_40_e5_v8__0l;
    v5[4] = a1;
    objc_msgSend(v3, "runAfterFirstUnlock:block:", global_queue, v5);

  }
}

uint64_t __48__GEOPairedDeviceFilePaths_registerCleanupTasks__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  getNRPairedDeviceRegistryDevicesDidUpdateNotification();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", v3, sel__pairedDevicesDidChange_, v4, 0);

  return objc_msgSend(*(id *)(a1 + 32), "_cleanupOldDevices");
}

+ (void)_pairedDevicesDidChange:(id)a3
{
  geo_dispatch_async_qos();
}

uint64_t __52__GEOPairedDeviceFilePaths__pairedDevicesDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanupOldDevices");
}

+ (void)_cleanupOldDevices
{
  id v2;

  if (NanoRegistryLibraryCore())
  {
    objc_msgSend(getNRPairedDeviceRegistryClass(), "sharedInstance");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "getDevicesWithBlock:", &__block_literal_global_148);

  }
}

void __46__GEOPairedDeviceFilePaths__cleanupOldDevices__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  char v15;
  id v16;
  NSObject *v17;
  id obj;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "_geo_compactMap:", &__block_literal_global_6_4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOFilePaths urlFor:](GEOFilePaths, "urlFor:", 14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v6;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(obj);
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
        if (v11 && (objc_msgSend(v2, "containsObject:", v11) & 1) == 0)
        {
          objc_msgSend(v11, "UUIDString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", v12, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          GEOGetGEOFilePathsLog_0();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138477827;
            v25 = v13;
            _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_INFO, "[PairedDevice] Cleaning up data for old paired device: %{private}@", buf, 0xCu);
          }

          v19 = 0;
          v15 = objc_msgSend(v3, "removeItemAtURL:error:", v13, &v19);
          v16 = v19;
          if ((v15 & 1) == 0)
          {
            GEOGetGEOFilePathsLog_0();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v25 = v16;
              _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_ERROR, "[PairedDevice] Failed to remove data for old paired device: %{public}@", buf, 0xCu);
            }

          }
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v8);
  }

}

uint64_t __46__GEOPairedDeviceFilePaths__cleanupOldDevices__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pairingID");
}

@end
