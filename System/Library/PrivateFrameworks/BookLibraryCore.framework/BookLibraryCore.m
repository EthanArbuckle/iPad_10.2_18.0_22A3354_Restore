uint64_t sub_212C79EB0()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)qword_253DB1F60;
  qword_253DB1F60 = (uint64_t)v0;

  return objc_msgSend((id)qword_253DB1F60, "setDateFormat:", CFSTR("~~~~~HH:mm:ss;yyyy-MM-dd"));
}

void sub_212C7A504()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDBCF48], "bu_booksRepositoryURL");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("Purchases"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_253DB20D0;
  qword_253DB20D0 = v1;

}

void sub_212C7AA0C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v0 = container_system_group_path_for_identifier();
  if (v0)
  {
    v1 = (void *)v0;
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v0, 1, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("Library"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    free(v1);
  }
  else
  {
    BLDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v8 = "systemgroup.com.apple.media.books.managed";
      v9 = 2048;
      v10 = 1;
      _os_log_impl(&dword_212C78000, v4, OS_LOG_TYPE_ERROR, "Error getting system group container: %s => %llu", buf, 0x16u);
    }

    v3 = 0;
  }
  objc_msgSend(v3, "path");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_253DB20C0;
  qword_253DB20C0 = v5;

}

void sub_212C7ABE0(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("BKPurchases"), CFSTR("momd"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("[BLJaliscoServerSource managedObjectModel]"), CFSTR("[[NSBundle bundleForClass:[self class]] pathForResource:@'BKPurchases' ofType:@'momd'] failed"));
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v3, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDBB6B0]), "initWithContentsOfURL:", v7);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v4;

}

void sub_212C7AE1C(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint32_t v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  BLDownloadQueueServiceProgressMonitorLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v2;
      v5 = "[BLDownloadQueueServerProgressObserver] Failed registering to monitor progress:  %@";
      v6 = v4;
      v7 = OS_LOG_TYPE_ERROR;
      v8 = 12;
LABEL_6:
      _os_log_impl(&dword_212C78000, v6, v7, v5, (uint8_t *)&v9, v8);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    v5 = "[BLDownloadQueueServerProgressObserver] Successfully registered to monitor progress.";
    v6 = v4;
    v7 = OS_LOG_TYPE_DEFAULT;
    v8 = 2;
    goto LABEL_6;
  }

}

void sub_212C7B1AC()
{
  id v0;
  void *v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (qword_253DB2078)
    v0 = (id)qword_253DB2078;
  else
    v0 = (id)objc_opt_new();
  v1 = (void *)qword_253DB2098;
  qword_253DB2098 = (uint64_t)v0;

  BLDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 138412290;
    v4 = qword_253DB2098;
    _os_log_impl(&dword_212C78000, v2, OS_LOG_TYPE_DEFAULT, "[DownloadQueueNonUI]: using singelton instance: %@", (uint8_t *)&v3, 0xCu);
  }

}

void sub_212C7B27C(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = a2;
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v20;
    v16 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v20 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v6, "state") == 4)
        {
          WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
          objc_msgSend(v6, "storeIdentifier");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "storePlaylistIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "permlink");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "downloadID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "title");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "collectionTitle");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "kind");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v15) = 1;
          objc_msgSend(WeakRetained, "sendInitialProgressNotificationForDownloadWithStoreID:storePlaylistID:orPermlink:downloadID:title:collectionTitle:assetKind:isPaused:targetObserver:", v8, v9, v10, v11, v12, v13, v14, v15, *(_QWORD *)(a1 + 32));

          v4 = v16;
        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v3);
  }

}

void sub_212C7BA28(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  char v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint8_t buf[4];
  id v51;
  __int16 v52;
  NSObject *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_persistentStoreOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 32), "p_databaseExistsAtSharediBooksContainerLocation");
  v4 = objc_msgSend(*(id *)(a1 + 32), "p_databaseExistsAtPrivateiBooksContainerLocation");
  if (((v3 | v4 ^ 1) & 1) != 0)
  {
    if ((v4 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "p_createPersistentDirectoryIfNeeded");
    v5 = 0;
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x24BDBB738]);
    objc_msgSend(*(id *)(a1 + 32), "managedObjectModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithManagedObjectModel:", v7);

    v9 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(*(id *)(a1 + 32), "p_persistentStoreFullPathAtPrivateiBooksLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fileURLWithPath:isDirectory:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(*(id *)(a1 + 32), "p_persistentStoreFullPathAtSharediBooksLocation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fileURLWithPath:isDirectory:", v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "p_createPersistentDirectoryIfNeeded");
    v15 = *MEMORY[0x24BDBB580];
    v49 = 0;
    objc_msgSend(v8, "addPersistentStoreWithType:configuration:URL:options:error:", v15, 0, v11, v2, &v49);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v49;
    v48 = v17;
    objc_msgSend(v8, "migratePersistentStore:toURL:options:withType:error:", v16, v14, 0, v15, &v48);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v48;

    if (!v18 || v5)
    {
      BLJaliscoLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v51 = v5;
        _os_log_impl(&dword_212C78000, v19, OS_LOG_TYPE_ERROR, "It looks like the migration failed:  %@", buf, 0xCu);
      }

    }
  }
  v20 = objc_alloc(MEMORY[0x24BDBB738]);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectModel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "initWithManagedObjectModel:", v21);
  v23 = *(_QWORD *)(a1 + 32);
  v24 = *(void **)(v23 + 24);
  *(_QWORD *)(v23 + 24) = v22;

  v25 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(*(id *)(a1 + 32), "p_persistentStoreFullPathAtSharediBooksLocation");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "fileURLWithPath:isDirectory:", v26, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v29 = *MEMORY[0x24BDBB580];
  v47 = v5;
  objc_msgSend(v28, "addPersistentStoreWithType:configuration:URL:options:error:", v29, 0, v27, v2, &v47);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v47;

  if (v30)
  {
    v32 = v31;
LABEL_22:
    BLJaliscoLog();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v30, "identifier");
      v40 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v51 = v27;
      v52 = 2112;
      v53 = v40;
      _os_log_impl(&dword_212C78000, v39, OS_LOG_TYPE_DEFAULT, "Added jalisco Persistent Store: %@ persistentstoreID:%@", buf, 0x16u);

    }
    goto LABEL_29;
  }
  if (v31)
  {
    BLJaliscoLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v51 = v27;
      v52 = 2112;
      v53 = v31;
      _os_log_impl(&dword_212C78000, v33, OS_LOG_TYPE_ERROR, "Error adding local Persistent Store at URL: %@. Trying to recover %@", buf, 0x16u);
    }

  }
  v34 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v46 = 0;
  v35 = objc_msgSend(v34, "destroyPersistentStoreAtURL:withType:options:error:", v27, v29, 0, &v46);
  v36 = v46;
  if ((v35 & 1) == 0)
  {
    BLJaliscoLog();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v51 = v27;
      v52 = 2112;
      v53 = v36;
      _os_log_impl(&dword_212C78000, v37, OS_LOG_TYPE_ERROR, "Could not remove local Persistent Store at URL: %@ %@", buf, 0x16u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "p_createPersistentDirectoryIfNeeded");
  v38 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v45 = v31;
  objc_msgSend(v38, "addPersistentStoreWithType:configuration:URL:options:error:", v29, 0, v27, v2, &v45);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v45;

  if (v30)
    goto LABEL_22;
  objc_msgSend(MEMORY[0x24BDD1540], "bu_errorWithDomain:code:description:underlyingError:", CFSTR("BLJaliscoDAAPClientError"), 2, CFSTR("Failed to add jalisco Persistent Store: %@"), v32);
  v41 = objc_claimAutoreleasedReturnValue();
  v39 = v41;
  if (*(_QWORD *)(a1 + 40))
    **(_QWORD **)(a1 + 40) = objc_retainAutorelease(v41);
  BLJaliscoLog();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v51 = v27;
    v52 = 2112;
    v53 = v39;
    _os_log_impl(&dword_212C78000, v42, OS_LOG_TYPE_ERROR, "Failed to add jalisco Persistent Store: %@ %@", buf, 0x16u);
  }

  v43 = *(_QWORD *)(a1 + 32);
  v44 = *(void **)(v43 + 24);
  *(_QWORD *)(v43 + 24) = 0;

  v30 = 0;
LABEL_29:

}

void sub_212C7BFAC(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, __int128 buf, int a16, __int16 a17, __int16 a18, void *a19)
{
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;

  if (a2 == 1)
  {
    v20 = objc_begin_catch(a1);
    objc_msgSend(v20, "userInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(v20, "userInfo");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v23 = 0;
    }

    objc_msgSend(MEMORY[0x24BDD1540], "bu_errorWithDomain:code:description:underlyingError:", CFSTR("BLJaliscoDAAPClientError"), 2, CFSTR("Unable to bring up jalisco core data stack"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (*(_QWORD *)(v19 + 40))
      **(_QWORD **)(v19 + 40) = objc_retainAutorelease(v24);
    v26 = *(_QWORD *)(v19 + 32);
    v27 = *(void **)(v26 + 24);
    *(_QWORD *)(v26 + 24) = 0;

    BLJaliscoLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v20, "name");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "reason");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "userInfo");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543874;
      *(_QWORD *)((char *)&buf + 4) = v29;
      WORD6(buf) = 2114;
      *(_QWORD *)((char *)&buf + 14) = v30;
      a18 = 2114;
      a19 = v31;
      _os_log_impl(&dword_212C78000, v28, OS_LOG_TYPE_ERROR, "[BLJaliscoServerSource persistentStoreCoordinatorWithError]: Unable to bring up jalisco core data stack. Exception: %{public}@ %{public}@ %{public}@", (uint8_t *)&buf, 0x20u);

    }
    objc_end_catch();
    JUMPOUT(0x212C7BF70);
  }
  _Unwind_Resume(a1);
}

void sub_212C7C99C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_212C7CBC8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_212C7CE34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id BLServiceProxyLog()
{
  if (qword_253DB20F8 != -1)
    dispatch_once(&qword_253DB20F8, &unk_24CE8AA00);
  return (id)qword_253DB2100;
}

id BLDefaultLog()
{
  if (qword_253DB20E8 != -1)
    dispatch_once(&qword_253DB20E8, &unk_24CE8AA20);
  return (id)qword_253DB20F0;
}

void sub_212C7CF4C(uint64_t a1)
{
  uint64_t v2;
  BOOL v3;
  NSObject *v4;
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
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id buf[2];

  v2 = objc_msgSend(*(id *)(a1 + 32), "state");
  if (v2)
    v3 = v2 == 4;
  else
    v3 = 1;
  if (v3)
  {
    BLServiceProxyLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_212C78000, v4, OS_LOG_TYPE_DEFAULT, "[BLServiceProxy] Creating connection to bookassetd.", (uint8_t *)buf, 2u);
    }

    +[BLServiceProxyConnectionFactory connectionWithMachServiceName:options:](BLServiceProxyConnectionFactory, "connectionWithMachServiceName:options:", CFSTR("com.apple.ibooks.BLService"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setConnection:", v5);

    +[BLServiceInterface mainInterface](BLServiceInterface, "mainInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteObjectInterface:", v6);

    objc_initWeak(buf, *(id *)(a1 + 32));
    v8 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = sub_212C90370;
    v20[3] = &unk_24CE8B4C0;
    objc_copyWeak(&v21, buf);
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setInterruptionHandler:", v20);

    v18[0] = v8;
    v18[1] = 3221225472;
    v18[2] = sub_212C904B8;
    v18[3] = &unk_24CE8B4C0;
    objc_copyWeak(&v19, buf);
    objc_msgSend(*(id *)(a1 + 32), "connection", v8, 3221225472, sub_212C904B8, &unk_24CE8B4C0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setInvalidationHandler:", v18);

    objc_msgSend(*(id *)(a1 + 32), "progressReceiver");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      +[BLServiceInterface progressInterface](BLServiceInterface, "progressInterface");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "connection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setExportedInterface:", v12);

      objc_msgSend(*(id *)(a1 + 32), "progressReceiver");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setExportedObject:", v14);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "state") != 0;
    objc_msgSend(*(id *)(a1 + 32), "setState:", 2);
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "resume");

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(buf);
  }
  else if (v2 == 3)
  {
    BLServiceProxyLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_212C78000, v17, OS_LOG_TYPE_DEFAULT, "[BLServiceProxy] Attempting to reconnect to bookassetd after interruption.", (uint8_t *)buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setState:", 2);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
}

void sub_212C7D22C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id BLDownloadQueueServiceProgressMonitorLog()
{
  if (qword_253DB2088 != -1)
    dispatch_once(&qword_253DB2088, &unk_24CE8A8A0);
  return (id)qword_253DB2080;
}

id BLJaliscoLog()
{
  if (qword_253DB1F78 != -1)
    dispatch_once(&qword_253DB1F78, &unk_24CE8AB00);
  return (id)qword_253DB1F70;
}

id BLDaemonLog()
{
  if (qword_253DB1FF8 != -1)
    dispatch_once(&qword_253DB1FF8, &unk_24CE8AA40);
  return (id)qword_253DB1FF0;
}

id BLServiceLog()
{
  if (qword_253DB2010 != -1)
    dispatch_once(&qword_253DB2010, &unk_24CE8A880);
  return (id)qword_253DB2050;
}

id BLServiceDownloadManagerLog()
{
  if (qword_253DB2008 != -1)
    dispatch_once(&qword_253DB2008, &unk_24CE8A920);
  return (id)qword_253DB2038;
}

id BLServicePurchaseManagerLog()
{
  if (qword_253DB1F10 != -1)
    dispatch_once(&qword_253DB1F10, &unk_24CE8A8E0);
  return (id)qword_253DB1F20;
}

void sub_212C7D6A0()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.iBooks.BookLibrary", "BLServiceProxy");
  v1 = (void *)qword_253DB2100;
  qword_253DB2100 = (uint64_t)v0;

}

void sub_212C7D6D0()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.iBooks.BookLibrary", "BLJalisco");
  v1 = (void *)qword_253DB1F70;
  qword_253DB1F70 = (uint64_t)v0;

}

void sub_212C7D700()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.bookassetd", "BLDownloadQueueServiceProgressMonitor");
  v1 = (void *)qword_253DB2080;
  qword_253DB2080 = (uint64_t)v0;

}

void sub_212C7D730()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.iBooks.BookLibrary", "BookLibrary");
  v1 = (void *)qword_253DB20F0;
  qword_253DB20F0 = (uint64_t)v0;

}

void sub_212C7E564()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("default_book_library", 0);
  v1 = (void *)qword_253DB20A8;
  qword_253DB20A8 = (uint64_t)v0;

}

void sub_212C7E5F4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  if (!qword_253DB20A0)
  {
    v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
    v2 = (void *)qword_253DB20A0;
    qword_253DB20A0 = v1;

  }
}

void sub_212C7F1EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_212C7F244(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_212C7F254(uint64_t a1)
{

}

uint64_t sub_212C7F25C(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "permlink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void sub_212C7F29C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_212C7F558(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "permlink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void sub_212C7F814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_212C7F838(uint64_t a1)
{
  uint64_t i;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  const __CFString *v35;
  const __CFString *v36;
  void *v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_allPlists");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v25)
  {
    v26 = 0;
    v24 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(obj);
        v3 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "_bookItemsFromPlist:", v3);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v5 = v4;
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v28;
LABEL_8:
          v9 = 0;
          while (1)
          {
            if (*(_QWORD *)v28 != v8)
              objc_enumerationMutation(v5);
            v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v9);
            objc_msgSend(v10, "identifier");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(a1 + 40));

            if ((v12 & 1) != 0)
              break;
            if (v7 == ++v9)
            {
              v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
              if (v7)
                goto LABEL_8;
              goto LABEL_14;
            }
          }
          v13 = v3;
          objc_msgSend(v10, "path");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13)
          {
            v26 = v14;
            continue;
          }

          objc_msgSend(v14, "lastPathComponent");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v15;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v37, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addDeletedFiles:", v16);

          if ((objc_msgSend(*(id *)(a1 + 32), "_isMultiUser") & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "removeItemAtPath:error:", v14, *(_QWORD *)(a1 + 64));

          }
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
          goto LABEL_28;
        }
LABEL_14:

      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v25)
        continue;
      break;
    }
  }
  else
  {
    v26 = 0;
  }

  if (*(_QWORD *)(a1 + 64))
  {
    v18 = (void *)MEMORY[0x24BDD1540];
    v19 = &stru_24CE8D258;
    if (*(_QWORD *)(a1 + 40))
      v19 = *(const __CFString **)(a1 + 40);
    v35 = CFSTR("identifier");
    v36 = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("BLLibraryErrorDomain"), -1000, v13);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;

    v14 = v26;
LABEL_28:

  }
  else
  {
    v14 = v26;
  }

}

void sub_212C7FCA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_212C7FCC4(uint64_t a1)
{
  uint64_t i;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  const __CFString *v35;
  const __CFString *v36;
  void *v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_allPlists");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v25)
  {
    v26 = 0;
    v24 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(obj);
        v3 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "_bookItemsFromPlist:", v3);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v5 = v4;
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v28;
LABEL_8:
          v9 = 0;
          while (1)
          {
            if (*(_QWORD *)v28 != v8)
              objc_enumerationMutation(v5);
            v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v9);
            objc_msgSend(v10, "path");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(a1 + 40));

            if ((v12 & 1) != 0)
              break;
            if (v7 == ++v9)
            {
              v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
              if (v7)
                goto LABEL_8;
              goto LABEL_14;
            }
          }
          v13 = v3;
          objc_msgSend(v10, "path");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13)
          {
            v26 = v14;
            continue;
          }

          objc_msgSend(v14, "lastPathComponent");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v15;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v37, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addDeletedFiles:", v16);

          if ((objc_msgSend(*(id *)(a1 + 32), "_isMultiUser") & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "removeItemAtPath:error:", v14, *(_QWORD *)(a1 + 64));

          }
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
          goto LABEL_28;
        }
LABEL_14:

      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v25)
        continue;
      break;
    }
  }
  else
  {
    v26 = 0;
  }

  if (*(_QWORD *)(a1 + 64))
  {
    v18 = (void *)MEMORY[0x24BDD1540];
    v19 = &stru_24CE8D258;
    if (*(_QWORD *)(a1 + 40))
      v19 = *(const __CFString **)(a1 + 40);
    v35 = CFSTR("path");
    v36 = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("BLLibraryErrorDomain"), -1000, v13);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;

    v14 = v26;
LABEL_28:

  }
  else
  {
    v14 = v26;
  }

}

uint64_t sub_212C80414(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "storeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "permlink");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 40));

  }
  return v5;
}

uint64_t sub_212C80554(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "permlink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void sub_212C80BB0(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  BLBookItem *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    BLDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = a1[4];
      v8 = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_ERROR, "Failed to add permalink %@. Error:  %@", (uint8_t *)&v8, 0x16u);
    }

    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    v7 = -[BLBookItem initWithPeristentIdentifier:permlink:title:]([BLBookItem alloc], "initWithPeristentIdentifier:permlink:title:", CFSTR("0"), a1[4], a1[5]);
    (*(void (**)(void))(a1[6] + 16))();

  }
}

void sub_212C80E04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_212C80E28(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  const __CFString *v45;
  void *v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v2 = 0x24CE89000uLL;
  objc_msgSend(*(id *)(a1 + 32), "sharedPlist");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMLibraryPlist booksArrayFromPlistEntry:](IMLibraryPlist, "booksArrayFromPlistEntry:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v42;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v42 != v9)
          objc_enumerationMutation(v6);
        objc_opt_class();
        BUDynamicCast();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          +[IMLibraryPlist permlinkFromPlistEntry:](IMLibraryPlist, "permlinkFromPlistEntry:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqual:", *(_QWORD *)(a1 + 40));

          if ((v13 & 1) != 0)
          {

            objc_msgSend(*(id *)(a1 + 32), "purchasedPlist");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "contents");
            v21 = objc_claimAutoreleasedReturnValue();

            v39 = (void *)v21;
            +[IMLibraryPlist booksArrayFromPlistEntry:](IMLibraryPlist, "booksArrayFromPlistEntry:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v22;
            if (v22)
              v24 = (void *)objc_msgSend(v22, "mutableCopy");
            else
              v24 = (void *)objc_opt_new();
            v25 = v24;
            v40 = v6;
            v26 = objc_msgSend(v24, "count");
            if (v26 - 1 >= 0)
            {
              v27 = v26;
              do
              {
                --v27;
                objc_opt_class();
                objc_msgSend(v25, "objectAtIndexedSubscript:", v27);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                BUDynamicCast();
                v29 = (void *)objc_claimAutoreleasedReturnValue();

                v30 = v2;
                objc_msgSend(*(id *)(v2 + 3488), "permlinkFromPlistEntry:", v29);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = objc_msgSend(v31, "isEqual:", *(_QWORD *)(a1 + 40));

                if (v32)
                  objc_msgSend(v25, "removeObjectAtIndex:", v27);

                v2 = v30;
              }
              while (v27 > 0);
            }
            objc_msgSend(v25, "addObject:", v11);
            objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v2 + 3488), "setBooksArray:toPlistEntry:", v25, v33);
            objc_msgSend(*(id *)(a1 + 32), "purchasedPlist");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "path");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v33, "writeToFile:atomically:", v35, 1);

            objc_msgSend(*(id *)(v2 + 3488), "folderNameFromPlistEntry:", v11);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "purchasedPlist");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = v36;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v47, 1);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "removeDeletedPaths:", v38);

            v6 = v40;
            goto LABEL_24;
          }
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
      if (v8)
        continue;
      break;
    }
  }

  if (*(_QWORD *)(a1 + 64))
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    v45 = CFSTR("BLLibraryErrorPermlink");
    v15 = *(void **)(a1 + 40);
    v11 = v15;
    if (!v15)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v46 = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("BLLibraryErrorDomain"), -1003, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

    if (!v15)
LABEL_24:

  }
}

void sub_212C81528(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  if ((*(_QWORD *)(a1 + 32) || *(_QWORD *)(a1 + 40)) && objc_msgSend(*(id *)(a1 + 48), "_isMultiUser"))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v2 = *(void **)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 32);
    v12 = 0;
    objc_msgSend(v2, "_bookItemFromStoreID:permlink:error:", v4, v3, &v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v12;
    if (v5)
    {
      if (*(_QWORD *)(a1 + 56))
      {
        objc_msgSend(v5, "setLastUserAccessDate:");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setLastUserAccessDate:", v7);

      }
      if (objc_msgSend(*(id *)(a1 + 48), "_bookItemIsShared:", v5))
      {
        v8 = *(_QWORD *)(a1 + 56);
        objc_msgSend(*(id *)(a1 + 48), "sharedPlist");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v6;
        +[BLLibrary _addDate:toPlist:bookItem:error:](BLLibrary, "_addDate:toPlist:bookItem:error:", v8, v9, v5, &v11);
        v10 = v11;

        v6 = v10;
      }
    }

  }
}

void sub_212C817C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_212C817E8(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "contents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMLibraryPlist booksArrayFromPlistEntry:](IMLibraryPlist, "booksArrayFromPlistEntry:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v7)
        objc_enumerationMutation(v4);
      objc_opt_class();
      BUDynamicCast();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((sub_212C81ADC(v9, *(void **)(a1 + 40)) & 1) != 0)
        break;

      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v10 = (void *)objc_msgSend(v9, "mutableCopy", v23);
    +[IMLibraryPlist setAccessDate:toPlistEntry:](IMLibraryPlist, "setAccessDate:toPlistEntry:", *(_QWORD *)(a1 + 48), v10);

    if (!v10)
      goto LABEL_17;
    v11 = (void *)objc_msgSend(v4, "mutableCopy");
    v12 = objc_msgSend(v11, "count");
    if (v12 - 1 >= 0)
    {
      v13 = v12;
      do
      {
        --v13;
        objc_opt_class();
        objc_msgSend(v11, "objectAtIndexedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        BUDynamicCast();
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (sub_212C81ADC(v15, *(void **)(a1 + 40)))
          objc_msgSend(v11, "removeObjectAtIndex:", v13);

      }
      while (v13 > 0);
    }
    objc_msgSend(v11, "addObject:", v10);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMLibraryPlist setBooksArray:toPlistEntry:](IMLibraryPlist, "setBooksArray:toPlistEntry:", v11, v16);
    objc_msgSend(*(id *)(a1 + 32), "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v16, "writeToFile:atomically:", v17, 1);

    +[IMLibraryPlist folderNameFromPlistEntry:](IMLibraryPlist, "folderNameFromPlistEntry:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(void **)(a1 + 32);
    v27 = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v27, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeDeletedPaths:", v20);

    goto LABEL_19;
  }
LABEL_9:

LABEL_17:
  if (*(_QWORD *)(a1 + 72))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("BLLibraryErrorDomain"), -1000, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v10 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;
LABEL_19:

  }
}

uint64_t sub_212C81ADC(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  v6 = 0;
  if (v3 && v4)
  {
    objc_msgSend(v4, "storeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v8)
    {
      +[IMLibraryPlist storeIdFromPlistEntry:](IMLibraryPlist, "storeIdFromPlistEntry:", v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "storeIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);
    }
    else
    {
      objc_msgSend(v5, "permlink");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        v6 = 0;
        goto LABEL_8;
      }
      +[IMLibraryPlist permlinkFromPlistEntry:](IMLibraryPlist, "permlinkFromPlistEntry:", v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "permlink");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);
    }
    v6 = v11;

  }
LABEL_8:

  return v6;
}

id BLError(int a1, __CFString *a2, __CFString *a3)
{
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("Unknown Error");
  if (a3)
    v5 = a3;
  v13[0] = CFSTR("message");
  v13[1] = CFSTR("title");
  v6 = CFSTR("BLService error");
  if (a2)
    v6 = a2;
  v14[0] = v5;
  v14[1] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = a3;
  v9 = a2;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("BLErrorDomain"), a1, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id BLErrorWithUserInfo(int a1, const __CFString *a2, const __CFString *a3, void *a4)
{
  id v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a4;
  if (a3)
    v8 = a3;
  else
    v8 = CFSTR("Unknown Error");
  v9 = CFSTR("BLService error");
  if (a2)
    v9 = a2;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObjectsAndKeys:", v8, CFSTR("message"), v9, CFSTR("title"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
    objc_msgSend(v10, "addEntriesFromDictionary:", v7);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("BLErrorDomain"), a1, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t BLErrorIsEqual(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = a1;
  v6 = a2;
  if (v5 && objc_msgSend(v5, "code") == a3)
  {
    objc_msgSend(v5, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", v6);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id BLErrorWithDomain(void *a1, uint64_t a2, __CFString *a3, __CFString *a4)
{
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v7 = CFSTR("Unknown Error");
  if (a4)
    v7 = a4;
  v16[0] = CFSTR("message");
  v16[1] = CFSTR("title");
  v8 = CFSTR("BLService error");
  if (a3)
    v8 = a3;
  v17[0] = v7;
  v17[1] = v8;
  v9 = (void *)MEMORY[0x24BDBCE70];
  v10 = a4;
  v11 = a3;
  v12 = a1;
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v12, a2, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id BLUnknownDownloadError(uint64_t a1)
{
  __CFString *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("unknown download id (%@)"), a1);
  v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  BLError(23, 0, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_212C86774()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.bookassetd", "BLService");
  v1 = (void *)qword_253DB2050;
  qword_253DB2050 = (uint64_t)v0;

}

id BLServiceDownloadQueueLog()
{
  if (qword_253DB2048 != -1)
    dispatch_once(&qword_253DB2048, &unk_24CE8A8C0);
  return (id)qword_253DB2040;
}

void sub_212C867E4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.bookassetd", "BLServiceDownloadQueue");
  v1 = (void *)qword_253DB2040;
  qword_253DB2040 = (uint64_t)v0;

}

void sub_212C86814()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.bookassetd", "BLServicePurchaseManager");
  v1 = (void *)qword_253DB1F20;
  qword_253DB1F20 = (uint64_t)v0;

}

id BLServiceMediaLibraryManagerLog()
{
  if (qword_254B61B68 != -1)
    dispatch_once(&qword_254B61B68, &unk_24CE8A900);
  return (id)qword_254B61B60;
}

void sub_212C86884()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.bookassetd", "BLServiceMediaLibraryManagerLog");
  v1 = (void *)qword_254B61B60;
  qword_254B61B60 = (uint64_t)v0;

}

void sub_212C868B4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.bookassetd", "BLServiceDownloadManager");
  v1 = (void *)qword_253DB2038;
  qword_253DB2038 = (uint64_t)v0;

}

id BLServiceDownloadPipelineLog()
{
  if (qword_254B61B78 != -1)
    dispatch_once(&qword_254B61B78, &unk_24CE8A940);
  return (id)qword_254B61B70;
}

void sub_212C86924()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.bookassetd", "BLServiceDownloadPipeline");
  v1 = (void *)qword_254B61B70;
  qword_254B61B70 = (uint64_t)v0;

}

id BLServiceDatabaseManagerLog()
{
  if (qword_253DB2000 != -1)
    dispatch_once(&qword_253DB2000, &unk_24CE8A960);
  return (id)qword_253DB2030;
}

void sub_212C86994()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.bookassetd", "BLServiceDatabaseManager");
  v1 = (void *)qword_253DB2030;
  qword_253DB2030 = (uint64_t)v0;

}

id BLServiceDownloadFilesystemLog()
{
  if (qword_254B61B88 != -1)
    dispatch_once(&qword_254B61B88, &unk_24CE8A980);
  return (id)qword_254B61B80;
}

void sub_212C86A04()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.bookassetd", "BLServiceDownloadFilesystem");
  v1 = (void *)qword_254B61B80;
  qword_254B61B80 = (uint64_t)v0;

}

id BLServiceDownloadStreamingZipLog()
{
  if (qword_254B61B98 != -1)
    dispatch_once(&qword_254B61B98, &unk_24CE8A9A0);
  return (id)qword_254B61B90;
}

void sub_212C86A74()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.bookassetd", "BLServiceDownloadStreamingZip");
  v1 = (void *)qword_254B61B90;
  qword_254B61B90 = (uint64_t)v0;

}

id BLServiceNotificationLog()
{
  if (qword_253DB2018 != -1)
    dispatch_once(&qword_253DB2018, &unk_24CE8A9C0);
  return (id)qword_253DB2058;
}

void sub_212C86AE4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.iBooks.BookLibrary", "BLServiceNotification");
  v1 = (void *)qword_253DB2058;
  qword_253DB2058 = (uint64_t)v0;

}

id BLServiceMetadataStoreLog()
{
  if (qword_253DB1F38 != -1)
    dispatch_once(&qword_253DB1F38, &unk_24CE8A9E0);
  return (id)qword_253DB1F40;
}

void sub_212C86B54()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.iBooks.BookLibrary", "BLServiceMetadataStore");
  v1 = (void *)qword_253DB1F40;
  qword_253DB1F40 = (uint64_t)v0;

}

void sub_212C86B84()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.iBooks.BookLibrary", "BLDaemon");
  v1 = (void *)qword_253DB1FF0;
  qword_253DB1FF0 = (uint64_t)v0;

}

id BLBookInstallLog()
{
  if (qword_253DB1FE8 != -1)
    dispatch_once(&qword_253DB1FE8, &unk_24CE8AA60);
  return (id)qword_253DB2028;
}

void sub_212C86BF4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.iBooks.BookLibrary", "BLBookInstallLog");
  v1 = (void *)qword_253DB2028;
  qword_253DB2028 = (uint64_t)v0;

}

id BLBookCacheDeleteLog()
{
  if (qword_253DB1FE0 != -1)
    dispatch_once(&qword_253DB1FE0, &unk_24CE8AA80);
  return (id)qword_253DB2020;
}

void sub_212C86C64()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.iBooks.BookLibrary", "BLBookCacheDeleteLog");
  v1 = (void *)qword_253DB2020;
  qword_253DB2020 = (uint64_t)v0;

}

id BLUtilitiesLog()
{
  if (qword_254B61BA8 != -1)
    dispatch_once(&qword_254B61BA8, &unk_24CE8AAA0);
  return (id)qword_254B61BA0;
}

void sub_212C86CD4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.iBooks.BookLibrary", "BLUtilitiesLog");
  v1 = (void *)qword_254B61BA0;
  qword_254B61BA0 = (uint64_t)v0;

}

id BLAudiobookSyncLog()
{
  if (qword_254B61BB8 != -1)
    dispatch_once(&qword_254B61BB8, &unk_24CE8AAC0);
  return (id)qword_254B61BB0;
}

void sub_212C86D44()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.iBooks.BookLibrary", "BLAudiobookSyncLog");
  v1 = (void *)qword_254B61BB0;
  qword_254B61BB0 = (uint64_t)v0;

}

id BLHLSKeyFetchingLog()
{
  if (qword_254B61BC8 != -1)
    dispatch_once(&qword_254B61BC8, &unk_24CE8AAE0);
  return (id)qword_254B61BC0;
}

void sub_212C86DB4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.iBooks.BookLibrary", "BookLibrary.HLSStreaming");
  v1 = (void *)qword_254B61BC0;
  qword_254B61BC0 = (uint64_t)v0;

}

id BLFamilyLog()
{
  if (qword_254B61BD8 != -1)
    dispatch_once(&qword_254B61BD8, &unk_24CE8AB20);
  return (id)qword_254B61BD0;
}

void sub_212C86E24()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.iBooks.BookLibrary", "BLFamily");
  v1 = (void *)qword_254B61BD0;
  qword_254B61BD0 = (uint64_t)v0;

}

id BLAudiobookMLImporterLog()
{
  if (qword_254B61BE8 != -1)
    dispatch_once(&qword_254B61BE8, &unk_24CE8AB40);
  return (id)qword_254B61BE0;
}

void sub_212C86E94()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.iBooks.BookLibrary", "BLAudiobookMLImporter");
  v1 = (void *)qword_254B61BE0;
  qword_254B61BE0 = (uint64_t)v0;

}

id BLBooksAskPermissionExtensionLog()
{
  if (qword_254B61BF8 != -1)
    dispatch_once(&qword_254B61BF8, &unk_24CE8AB60);
  return (id)qword_254B61BF0;
}

void sub_212C86F04()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.iBooks.BookLibrary", "BLBooksAskPermissionExtensionLog");
  v1 = (void *)qword_254B61BF0;
  qword_254B61BF0 = (uint64_t)v0;

}

id BLBooksDiagnosticExtensionLog()
{
  if (qword_254B61C08 != -1)
    dispatch_once(&qword_254B61C08, &unk_24CE8AB80);
  return (id)qword_254B61C00;
}

void sub_212C86F74()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.iBooks.BookLibrary", "BLBooksDiagnosticExtensionLog");
  v1 = (void *)qword_254B61C00;
  qword_254B61C00 = (uint64_t)v0;

}

void sub_212C87828()
{
  BLEduCloudContainer *v0;
  void *v1;

  v0 = objc_alloc_init(BLEduCloudContainer);
  v1 = (void *)qword_254B61C18;
  qword_254B61C18 = (uint64_t)v0;

}

void sub_212C879D4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 40), "URLForUbiquityContainerIdentifier:", CFSTR("iCloud.com.apple.iBooks.iTunesU"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

}

void sub_212C87A9C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "containerURL");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("Documents"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

}

void sub_212C88320(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_212C8837C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_212C8838C(uint64_t a1)
{

}

void sub_212C88394(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  id obj;

  v3 = a1[4];
  objc_msgSend(a2, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v5 + 40);
  v6 = +[BLLibraryUtility writeBinaryPropertyList:toPath:error:](BLLibraryUtility, "writeBinaryPropertyList:toPath:error:", v3, v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v6;

}

id deleteItemAtURLCoordinated(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  void *v11;
  id v12;

  v1 = (void *)MEMORY[0x24BDD1580];
  v2 = a1;
  objc_msgSend(v1, "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1570]), "initWithFilePresenter:", 0);
  v11 = v3;
  v12 = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_212C8886C;
  v10[3] = &unk_24CE8B280;
  v5 = v3;
  objc_msgSend(v4, "coordinateWritingItemAtURL:options:error:byAccessor:", v2, 1, &v12, v10);

  v6 = v12;
  v7 = v11;
  v8 = v6;

  return v8;
}

void sub_212C8886C(uint64_t a1, uint64_t a2)
{
  void *v2;
  char v3;
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v7 = 0;
  v3 = objc_msgSend(v2, "removeItemAtURL:error:", a2, &v7);
  v4 = v7;
  v5 = v4;
  if ((v3 & 1) == 0 && v4)
  {
    BLDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v5;
      _os_log_impl(&dword_212C78000, v6, OS_LOG_TYPE_ERROR, "Failed to delete iTunesU file with error:  %@", buf, 0xCu);
    }

  }
}

void sub_212C89208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212C89234(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;

  v3 = a2;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_212C892C0;
  v8[3] = &unk_24CE8B2A8;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v10 = v4;
  v8[4] = v5;
  v6 = v3;
  v7 = (id)objc_msgSend(v5, "performMetadataActionOnCloudURL:action:", v6, v8);

}

void sub_212C892C0(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryAsBookItem:path:", v8, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void sub_212C89348(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  BLDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v11 = 138412546;
      v12 = v3;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_212C78000, v6, OS_LOG_TYPE_ERROR, "Encountered error doing a coordinated read of %@. Error:  %@", (uint8_t *)&v11, 0x16u);
    }

  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v11 = 138412290;
      v12 = v3;
      _os_log_impl(&dword_212C78000, v6, OS_LOG_TYPE_DEBUG, "coordinated read taken for: %@", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(v3, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pathExtension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(CFSTR("cloudItem"), "isEqualToString:", v9);

    if (v10)
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void sub_212C895F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212C89610(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  __int128 v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a1[4])
  {
    BLDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = a1[6];
      v4 = a1[4];
      *(_DWORD *)buf = 138412546;
      v10 = v3;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_212C78000, v2, OS_LOG_TYPE_ERROR, "Encountered error doing a coordinated read of %@. Error:  %@", buf, 0x16u);
    }

  }
  else
  {
    v5 = (void *)a1[5];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = sub_212C8973C;
    v7[3] = &unk_24CE8B2A8;
    v7[4] = v5;
    v8 = *((_OWORD *)a1 + 3);
    v6 = (id)objc_msgSend(v5, "performMetadataActionOnCloudURL:action:", (id)v8, v7);

  }
}

void sub_212C8973C(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryAsBookItem:path:", v8, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void sub_212C89F9C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  BLHLSGroup *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[BLHLSGroup initWithGroupID:media:]([BLHLSGroup alloc], "initWithGroupID:media:", v6, v5);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
}

uint64_t sub_212C8ACB4(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v6;

  v1 = (objc_class *)MEMORY[0x24BDD17A8];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "initWithString:", v2);

  v6 = 0;
  objc_msgSend(v3, "scanUnsignedLongLong:", &v6);
  v4 = v6;

  return v4;
}

uint64_t sub_212C8BFE4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  +[IMLibraryPlist folderNameFromPlistEntry:](IMLibraryPlist, "folderNameFromPlistEntry:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMLibraryPlist folderNameFromPlistEntry:](IMLibraryPlist, "folderNameFromPlistEntry:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (v5)
      v6 = objc_msgSend(v4, "compare:", v5);
    else
      v6 = 1;
  }
  else if (v5)
  {
    v6 = -1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t sub_212C8C5BC(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

void sub_212C8DE18()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("zh"), CFSTR("chinese"), CFSTR("tr"), CFSTR("turkish"), CFSTR("pl"), CFSTR("polish"), CFSTR("uk"), CFSTR("ukrainian"), 0);
  v1 = (void *)qword_254B61C28;
  qword_254B61C28 = v0;

}

void sub_212C8F480()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v0 = container_system_group_path_for_identifier();
  if (v0)
  {
    v1 = (void *)v0;
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v0, 1, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)qword_253DB2060;
    qword_253DB2060 = v2;

    free(v1);
  }
  else
  {
    BLDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v6 = "systemgroup.com.apple.media.shared.books";
      v7 = 2048;
      v8 = 1;
      _os_log_impl(&dword_212C78000, v4, OS_LOG_TYPE_ERROR, "Error getting system group container: %s => %llu", buf, 0x16u);
    }

  }
}

void sub_212C8F600()
{
  void *v0;
  void *v1;
  uint64_t v2;
  int v3;
  id v4;
  id v5;
  char v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (+[BLLibraryUtility _isMultiUser](BLLibraryUtility, "_isMultiUser"))
  {
    objc_msgSend((id)objc_opt_class(), "sharedContainerURL");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "URLByAppendingPathComponent:", CFSTR("Library"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 0;
    v2 = *MEMORY[0x24BDBCC68];
    v13 = 0;
    v3 = objc_msgSend(v1, "getResourceValue:forKey:error:", &v14, v2, &v13);
    v4 = v14;
    v5 = v13;
    if (v3)
    {
      if (v4 && (objc_msgSend(v4, "BOOLValue") & 1) != 0)
        goto LABEL_13;
      v12 = v5;
      v6 = objc_msgSend(v1, "setResourceValue:forKey:error:", MEMORY[0x24BDBD1C8], v2, &v12);
      v7 = v12;

      if ((v6 & 1) != 0)
      {
LABEL_12:
        v5 = v7;
LABEL_13:
        objc_msgSend(v1, "path");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)qword_254B61C30;
        qword_254B61C30 = v10;

        return;
      }
      BLDefaultLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v1, "lastPathComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v16 = v9;
        v17 = 2112;
        v18 = v7;
        _os_log_impl(&dword_212C78000, v8, OS_LOG_TYPE_ERROR, "Error excluding %@ from backup:  %@", buf, 0x16u);

      }
    }
    else
    {
      BLDefaultLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v5;
        _os_log_impl(&dword_212C78000, v8, OS_LOG_TYPE_ERROR, "Error encountered accessing resource value for backup exclusion key. Error:  %@", buf, 0xCu);
      }
      v7 = v5;
    }

    goto LABEL_12;
  }
}

id BLBundle()
{
  if (qword_254B61C48 != -1)
    dispatch_once(&qword_254B61C48, &unk_24CE8B470);
  return (id)qword_254B61C40;
}

void sub_212C8F890()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_254B61C40;
  qword_254B61C40 = v0;

}

void sub_212C901FC(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  BLServiceProxyLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_212C78000, v2, OS_LOG_TYPE_DEFAULT, "[BLServiceProxy] bookassetd has started.", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_createAndStartConnection");

}

void sub_212C90370(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  os_unfair_lock_s *WeakRetained;
  _QWORD *v5;
  _QWORD v6[2];
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  uint8_t buf[16];

  BLServiceProxyLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212C78000, v2, OS_LOG_TYPE_DEFAULT, "[BLServiceProxy] The connection to bookassetd was interrupted.", buf, 2u);
  }

  v3 = (id *)(a1 + 32);
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v7 = sub_212C90488;
    v8 = &unk_24CE8B4C0;
    objc_copyWeak(&v9, v3);
    v5 = v6;
    os_unfair_lock_lock(WeakRetained + 2);
    v7((uint64_t)v5);
    os_unfair_lock_unlock(WeakRetained + 2);

    objc_destroyWeak(&v9);
  }

}

void sub_212C90474(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_212C90488(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setState:", 3);

}

void sub_212C904B8(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  os_unfair_lock_s *WeakRetained;
  _QWORD *v5;
  _QWORD v6[2];
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  uint8_t buf[16];

  BLServiceProxyLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212C78000, v2, OS_LOG_TYPE_ERROR, "[BLServiceProxy] The connection to bookassetd was invalidated.", buf, 2u);
  }

  v3 = (id *)(a1 + 32);
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v7 = sub_212C905D0;
    v8 = &unk_24CE8B4C0;
    objc_copyWeak(&v9, v3);
    v5 = v6;
    os_unfair_lock_lock(WeakRetained + 2);
    v7((uint64_t)v5);
    os_unfair_lock_unlock(WeakRetained + 2);

    objc_destroyWeak(&v9);
  }

}

void sub_212C905BC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_212C905D0(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "state") != 1)
    objc_msgSend(WeakRetained, "setState:", 4);
  objc_msgSend(WeakRetained, "setConnection:", 0);

}

void sub_212C9061C(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  BLServiceProxyLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_212C78000, v4, OS_LOG_TYPE_ERROR, "Remote proxy hit an error:  %@", (uint8_t *)&v7, 0xCu);
  }

  v5 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 32));
  v6 = (void *)v5;
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void sub_212C90788(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  BLServiceProxyLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_212C78000, v4, OS_LOG_TYPE_ERROR, "Synchronous Remote proxy hit an error:  %@", (uint8_t *)&v7, 0xCu);
  }

  v5 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 32));
  v6 = (void *)v5;
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void sub_212C90860(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 32));
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v5);

}

void sub_212C909A8(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 32));
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v5);

}

void sub_212C90E68(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 32));
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v3 + 16))(v3, 0, 0, v5);

}

void sub_212C90FD0(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 32));
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v5);

}

void sub_212C91118(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 32));
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v5);

}

void sub_212C91270(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 32));
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v5);

}

void sub_212C913C8(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 32));
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v5);

}

void sub_212C91510(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 32));
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v5);

}

void sub_212C91674(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 32));
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v5);

}

void sub_212C917A8(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 32));
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, MEMORY[0x24BDBD1A8], v5);

}

void sub_212C91904(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 32));
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);

}

void sub_212C91AFC(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 32));
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v5);

}

void sub_212C91D9C(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 32));
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v5);

}

void sub_212C91EE4(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 32));
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v5);

}

void sub_212C9202C(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 32));
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v5);

}

void sub_212C925E0(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 32));
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, id))(v3 + 16))(v3, 0, 0, 0, 0, v5);

}

void sub_212C92860(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 32));
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v5);

}

void sub_212C92958()
{
  BLPrivacyInfo *v0;
  void *v1;

  v0 = objc_alloc_init(BLPrivacyInfo);
  v1 = (void *)qword_254B61C58;
  qword_254B61C58 = (uint64_t)v0;

}

uint64_t sub_212C93C70(void *a1)
{
  id v1;
  char isKindOfClass;

  v1 = a1;
  if (qword_254B61C70 != -1)
    dispatch_once(&qword_254B61C70, &unk_24CE8B5B8);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    isKindOfClass = 1;
  else
    isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

Class sub_212C96300()
{
  Class result;

  qword_254B61C68 = (uint64_t)NSClassFromString(CFSTR("SSDownloadManagerBookShim"));
  result = NSClassFromString(CFSTR("SSDownloadManagerBookShim2"));
  qword_254B61C60 = (uint64_t)result;
  return result;
}

void sub_212C963AC()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_253DB1FC8;
  qword_253DB1FC8 = v0;

}

uint64_t alignedSInt8FromByte(char *a1)
{
  return *a1;
}

uint64_t alignedUInt8FromByte(unsigned __int8 *a1)
{
  return *a1;
}

uint64_t alignedUInt16FromByte(unsigned __int16 *a1)
{
  return *a1;
}

uint64_t alignedSInt16FromByte(__int16 *a1)
{
  return *a1;
}

uint64_t alignedUInt32FromByte(unsigned int *a1)
{
  return *a1;
}

uint64_t alignedUInt64FromByte(uint64_t a1)
{
  return *(_QWORD *)a1;
}

void sub_212C9E208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_212C9E220(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_212C9E230(uint64_t a1)
{

}

void sub_212C9E238(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_212C9E368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_212C9E390(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void sub_212C9E5B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_212C9E5E0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void sub_212C9E73C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212C9E754(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_212C9E97C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_212C9E994(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_212C9E9A4(uint64_t a1)
{

}

void sub_212C9E9AC(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_212C9EAD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_212C9EAF8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void sub_212C9EC38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212C9EC50(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_212C9F07C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  NSObject *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  const __CFString *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    objc_opt_class();
    BUDynamicCast();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v13;
    if (v13 && (objc_msgSend(v13, "statusCode") < 200 || objc_msgSend(v12, "statusCode") >= 300))
    {
      BLAudiobookSyncLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_212CCB07C(v12, v14);

      v15 = (id)MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 32));
      if (!v15)
        goto LABEL_21;
      v16 = (void *)MEMORY[0x24BDD1540];
      v33 = CFSTR("BLKeyHTTPResponseCode");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v12, "statusCode"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("BLErrorDomain"), 39, v18);
      v19 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD))v15 + 2))(v15, 0, v19);
    }
    else
    {
      BLAudiobookSyncLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_212C78000, v20, OS_LOG_TYPE_DEFAULT, "Downloaded master playlist, about to parse it.", buf, 2u);
      }

      v28 = 0;
      +[BLHLSPlaylist playlistParsingURL:error:](BLHLSPlaylist, "playlistParsingURL:error:", v7, &v28);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v28;
      +[BLHLSAudiobookFetcher preferredStreamFromMasterPlaylist:](BLHLSAudiobookFetcher, "preferredStreamFromMasterPlaylist:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        BLAudiobookSyncLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v17, "streamInfs");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "count");
          *(_DWORD *)buf = 134218242;
          v30 = v23;
          v31 = 2112;
          v32 = v18;
          _os_log_impl(&dword_212C78000, v21, OS_LOG_TYPE_DEFAULT, "Parsed master playlist. Out of a total of %lu choices, using streamInf: %@", buf, 0x16u);

        }
        v24 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 32));
        v19 = (void (**)(_QWORD, _QWORD, _QWORD))v24;
        if (v24)
          (*(void (**)(uint64_t, void *, _QWORD))(v24 + 16))(v24, v18, 0);
      }
      else
      {
        BLAudiobookSyncLog();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
        if (v17)
        {
          if (v26)
            sub_212CCB01C();

          v25 = v15;
          v15 = 0;
        }
        else if (v26)
        {
          sub_212CCAFBC();
        }

        v19 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 32));
        if (v19)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "bu_errorWithDomain:code:description:underlyingError:", CFSTR("BLErrorDomain"), 2, CFSTR("Unable to parse master HLS Playlist"), v15);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, _QWORD, void *))v19)[2](v19, 0, v27);

        }
      }
    }

LABEL_21:
    goto LABEL_22;
  }
  BLAudiobookSyncLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_212CCB0F0();

  v11 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 32));
  v12 = (void *)v11;
  if (v11)
    (*(void (**)(uint64_t, _QWORD, id))(v11 + 16))(v11, 0, v9);
LABEL_22:

}

void sub_212C9F530(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  uint8_t buf[8];
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    objc_opt_class();
    BUDynamicCast();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v13;
    if (v13 && (objc_msgSend(v13, "statusCode") < 200 || objc_msgSend(v12, "statusCode") >= 300))
    {
      BLAudiobookSyncLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_212CCB07C(v12, v14);

      v15 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 32));
      if (!v15)
        goto LABEL_23;
      v16 = (void *)MEMORY[0x24BDD1540];
      v25 = CFSTR("BLKeyHTTPResponseCode");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v12, "statusCode"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("BLErrorDomain"), 39, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (*)(NSObject *, _QWORD, void *))v15[2].isa)(v15, 0, v19);
    }
    else
    {
      BLAudiobookSyncLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_212C78000, v20, OS_LOG_TYPE_DEFAULT, "Downloaded master playlist, about to parse it to get racGUID.", buf, 2u);
      }

      v23 = 0;
      +[BLHLSPlaylist playlistParsingURL:error:](BLHLSPlaylist, "playlistParsingURL:error:", v7, &v23);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v23;
      if (v18)
      {
        objc_msgSend(v18, "racGUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v15;
        v15 = 0;
      }
      else
      {
        BLAudiobookSyncLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          sub_212CCAFBC();
        v17 = 0;
      }

      v22 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 32));
      v19 = (void *)v22;
      if (v22)
        (*(void (**)(uint64_t, void *, NSObject *))(v22 + 16))(v22, v17, v15);
    }

LABEL_23:
    goto LABEL_24;
  }
  BLAudiobookSyncLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_212CCB0F0();

  v11 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 32));
  v12 = (void *)v11;
  if (v11)
    (*(void (**)(uint64_t, _QWORD, id))(v11 + 16))(v11, 0, v9);
LABEL_24:

}

void sub_212C9F848(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_212C9F858(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_212C9F884(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_msgSend(a1, "valueForKey:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if ((objc_msgSend(v7, "isEqualToString:", v6) & 1) == 0)
    {
      v9 = a1;
      v10 = v6;
LABEL_6:
      objc_msgSend(v9, "setValue:forKey:", v10, v11);
    }
  }
  else if (v7)
  {
    v9 = a1;
    v10 = 0;
    goto LABEL_6;
  }

}

void sub_212C9F918(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_msgSend(a1, "valueForKey:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if ((objc_msgSend(v7, "isEqualToNumber:", v6) & 1) == 0)
    {
      v9 = a1;
      v10 = v6;
LABEL_6:
      objc_msgSend(v9, "setValue:forKey:", v10, v11);
    }
  }
  else if (v7)
  {
    v9 = a1;
    v10 = 0;
    goto LABEL_6;
  }

}

void sub_212C9F9AC(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_msgSend(a1, "valueForKey:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if ((objc_msgSend(v7, "isEqualToDate:", v6) & 1) == 0)
    {
      v9 = a1;
      v10 = v6;
LABEL_6:
      objc_msgSend(v9, "setValue:forKey:", v10, v11);
    }
  }
  else if (v7)
  {
    v9 = a1;
    v10 = 0;
    goto LABEL_6;
  }

}

void sub_212C9FA40(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_msgSend(a1, "valueForKey:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if ((objc_msgSend(v7, "isEqualToDictionary:", v6) & 1) == 0)
    {
      v9 = a1;
      v10 = v6;
LABEL_6:
      objc_msgSend(v9, "setValue:forKey:", v10, v11);
    }
  }
  else if (v7)
  {
    v9 = a1;
    v10 = 0;
    goto LABEL_6;
  }

}

void *sub_212C9FAD4(void *a1, const char *a2, uint64_t a3)
{
  if (a3)
    return (void *)objc_msgSend(a1, "setValue:forKey:");
  return a1;
}

uint64_t BLItemImageSizeEqualToSize(double a1, double a2, double a3, double a4)
{
  uint64_t result;

  result = 1;
  if (a2 != 0.0 && a1 != 0.0 && a4 != 0.0 && a3 != 0.0 && a1 / a2 != a3 / a4)
    return 0;
  return result;
}

const __CFString *NSStringFromBLDownloadState(unint64_t a1)
{
  if (a1 > 0x10)
    return CFSTR("BLDownloadStateUnknown");
  else
    return off_24CE8B798[a1];
}

id BLDownloadSupportedDownloadKinds()
{
  if (qword_253DB1F28 != -1)
    dispatch_once(&qword_253DB1F28, &unk_24CE8B778);
  return (id)qword_253DB1F30;
}

void sub_212CA1374()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];

  v2[3] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("book");
  v2[1] = CFSTR("ebook");
  v2[2] = CFSTR("pdf");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_253DB1F30;
  qword_253DB1F30 = v0;

}

void sub_212CA3014(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 32));
  v7 = (void *)v6;
  if (v6)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v8, v5);

}

void sub_212CA318C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  BLDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v16 = 138412290;
    v17 = v6;
    v9 = "[UIHostServiceProxy] received error from AMSSystemAlertDialogTask:  %@";
    v10 = v8;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v13 = *(void **)(a1 + 32);
    v16 = 138412546;
    v17 = v13;
    v18 = 2112;
    v19 = v5;
    v9 = "[UIHostServiceProxy] received result from AMSSystemAlertDialogTask for request %@ and calling replay block with result %@";
    v10 = v8;
    v11 = OS_LOG_TYPE_DEFAULT;
    v12 = 22;
  }
  _os_log_impl(&dword_212C78000, v10, v11, v9, (uint8_t *)&v16, v12);
LABEL_7:

  v14 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 40));
  v15 = (void *)v14;
  if (v14)
    (*(void (**)(uint64_t, id, id))(v14 + 16))(v14, v5, v6);

}

void sub_212CA33D0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 32));
  v7 = (void *)v6;
  if (v6)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v8, v5);

}

void sub_212CA3718()
{
  NSObject *v0;
  uint8_t v1[16];

  BLDefaultLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_212C78000, v0, OS_LOG_TYPE_FAULT, "Failed to complete backgound task after file lock. This will most likely result in a crash", v1, 2u);
  }

}

uint64_t sub_212CA3A20(uint64_t a1)
{
  return MEMORY[0x24BEDD108](a1, sel_bu_isErrorPassingTest_);
}

uint64_t sub_212CA3A2C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  __CFString **v8;
  uint64_t v9;

  v6 = a2;
  v7 = a4;
  if (a3 == 6)
  {
    v8 = (__CFString **)MEMORY[0x24BE07D20];
  }
  else
  {
    if (a3 != 16)
    {
      v9 = 0;
      goto LABEL_7;
    }
    v8 = BLErrorDomain;
  }
  v9 = objc_msgSend(v6, "isEqualToString:", *v8);
LABEL_7:

  return v9;
}

BOOL sub_212CA3AAC(void *a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BE07D20]);

  if (!v3)
    return 0;
  objc_opt_class();
  objc_msgSend(a1, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE07D48]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BUDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "longValue") == 401;
  return v7;
}

id sub_212CA3B6C(void *a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  NSObject *v16;
  objc_class *v17;
  const char *Name;
  void *v19;
  void *v20;
  id v21;
  void *v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  const char *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v23 = a1;
    v3 = (void *)objc_msgSend(v2, "mutableCopy");
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v24 = v2;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    v6 = 0x24BDD1000uLL;
    if (v5)
    {
      v7 = v5;
      v8 = *(_QWORD *)v27;
      v25 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v27 != v8)
            objc_enumerationMutation(v4);
          v10 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v4, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          BUDynamicCast();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
          {
            objc_msgSend(v12, "bl_securelyCodableError");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, v10);
          }
          else
          {
            objc_opt_class();
            BUClassAndProtocolCast();
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend((id)objc_opt_class(), "supportsSecureCoding", &unk_254B62BF0) & 1) == 0)
            {
              v15 = v6;
              BLDefaultLog();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                v17 = (objc_class *)objc_opt_class();
                Name = class_getName(v17);
                *(_DWORD *)buf = 138412546;
                v31 = v10;
                v32 = 2080;
                v33 = Name;
                _os_log_impl(&dword_212C78000, v16, OS_LOG_TYPE_ERROR, "userInfo[%@] of class '%s' does not support NSSecureCoding", buf, 0x16u);
              }

              objc_msgSend(v3, "removeObjectForKey:", v10);
              v6 = v15;
              v8 = v25;
            }
          }

        }
        v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v7);
    }

    v19 = *(void **)(v6 + 1344);
    objc_msgSend(v23, "domain");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, objc_msgSend(v23, "code"), v3);
    v21 = (id)objc_claimAutoreleasedReturnValue();

    v2 = v24;
  }
  else
  {
    v21 = a1;
  }

  return v21;
}

id BLGetNSNumberFromValue(void *a1)
{
  id v1;
  id v2;
  void *v3;
  id v4;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = objc_retainAutorelease(v1);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", strtoull((const char *)objc_msgSend(v2, "UTF8String"), 0, 10));
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v1;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

id sub_212CA4564(xmlTextReader *a1)
{
  xmlChar *String;
  void *v3;

  String = xmlTextReaderReadString(a1);
  if (String || (String = xmlTextReaderReadInnerXml(a1)) != 0)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", String);
    ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(String);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void sub_212CA4E2C(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,int buf,__int128 a26)
{
  id v27;
  NSObject *v28;

  if (a2 == 1)
  {
    v27 = objc_begin_catch(exc_buf);
    BLDefaultLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      buf = 138412546;
      WORD2(a26) = 2112;
      *(_QWORD *)((char *)&a26 + 6) = v27;
      _os_log_impl(&dword_212C78000, v28, OS_LOG_TYPE_ERROR, "Encountered exception parsing %@. %@", (uint8_t *)&buf, 0x16u);
    }

    objc_end_catch();
    JUMPOUT(0x212CA4D6CLL);
  }
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(exc_buf);
}

uint64_t sub_212CA4F9C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_212CA4FAC(uint64_t a1)
{

}

void sub_212CA4FB4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    BLDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v12 = 138412546;
      v13 = v8;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_212C78000, v7, OS_LOG_TYPE_ERROR, "Error creating zip archive at %@. error:  %@", (uint8_t *)&v12, 0x16u);
    }

  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_212CA57E8()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BEBF260], "sharedManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "currentUser");
  v1 = (id)objc_claimAutoreleasedReturnValue();

  byte_253DB1F18 = objc_msgSend(v1, "userType") == 1;
}

id sub_212CA584C(void *a1)
{
  void *v1;
  unint64_t v2;
  id v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void *v7;
  CC_MD5_CTX c;
  unsigned __int8 md[16];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "dataUsingEncoding:", 2483028224);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&c, 0, sizeof(c));
  CC_MD5_Init(&c);
  v2 = objc_msgSend(v1, "length");
  v3 = objc_retainAutorelease(v1);
  v4 = objc_msgSend(v3, "bytes");
  if (v2)
  {
    v5 = (char *)v4;
    do
    {
      if (v2 >= 0xFFFFFFFF)
        v6 = 0xFFFFFFFFLL;
      else
        v6 = v2;
      CC_MD5_Update(&c, v5, v6);
      v5 += v6;
      v2 -= v6;
    }
    while (v2);
  }
  CC_MD5_Final(md, &c);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x"), md[0], md[1], md[2], md[3], md[4], md[5], md[6], md[7], md[8], md[9], md[10], md[11], md[12], md[13], md[14], md[15]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id sub_212CA59B4(void *a1)
{
  id v1;
  void *v2;
  uint64_t i;
  unsigned __int8 md[20];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "dataUsingEncoding:", 2483028224);
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CC_SHA1((const void *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"), md);
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 20; ++i)
    objc_msgSend(v2, "appendFormat:", CFSTR("%02x"), md[i]);

  return v2;
}

id sub_212CA5A94(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "absoluteString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bl_sha1");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_212CA5C7C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  BLServiceLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v9 = *(_QWORD *)(a1 + 32);
    v16 = 134218242;
    v17 = v9;
    v18 = 2112;
    v19 = v6;
    v10 = "[DownloadManifestRequest] addDownloadsWithManifestRequest for request %p returned error:  %@";
    v11 = v8;
    v12 = OS_LOG_TYPE_ERROR;
  }
  else
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v13 = *(_QWORD *)(a1 + 32);
    v16 = 134218242;
    v17 = v13;
    v18 = 2112;
    v19 = v5;
    v10 = "[DownloadManifestRequest] addDownloadsWithManifestRequest for request %p completed with response %@.";
    v11 = v8;
    v12 = OS_LOG_TYPE_DEFAULT;
  }
  _os_log_impl(&dword_212C78000, v11, v12, v10, (uint8_t *)&v16, 0x16u);
LABEL_7:

  v14 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 40));
  v15 = (void *)v14;
  if (v14)
    (*(void (**)(uint64_t, id, id))(v14 + 16))(v14, v5, v6);

}

void sub_212CA60E0()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_254B61C78;
  qword_254B61C78 = v0;

}

uint64_t sub_212CA71A0(void *a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v3 = a2;
  objc_msgSend(a1, "imageSize");
  v5 = v4;
  objc_msgSend(v3, "imageSize");
  v7 = v6;

  if (v5 < v7)
    return -1;
  else
    return v5 > v7;
}

uint64_t sub_212CA7ACC(void *a1)
{
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v9 = 0;
  v2 = *MEMORY[0x24BDBCCA8];
  v8 = 0;
  objc_msgSend(a1, "getResourceValue:forKey:error:", &v9, v2, &v8);
  v3 = v9;
  v4 = v8;
  if (v4)
  {
    BLDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_ERROR, "Error -[NSURL bl_isUbiquitous]:  %@", buf, 0xCu);
    }

    v6 = 0;
  }
  else
  {
    v6 = objc_msgSend(a1, "bl_BOOLFromResourceValue:", v3);
  }

  return v6;
}

uint64_t sub_212CA7BD4(void *a1)
{
  id v2;

  v2 = 0;
  objc_msgSend(a1, "getResourceValue:forKey:error:", &v2, *MEMORY[0x24BDBCD28], 0);
  return objc_msgSend(v2, "BOOLValue");
}

uint64_t sub_212CA7C10(void *a1)
{
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v9 = 0;
  v2 = *MEMORY[0x24BDBCD20];
  v8 = 0;
  objc_msgSend(a1, "getResourceValue:forKey:error:", &v9, v2, &v8);
  v3 = v9;
  v4 = v8;
  if (v4)
  {
    BLDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_ERROR, "Error -[NSURL bl_isDownloaded]:  %@", buf, 0xCu);
    }

    v6 = 0;
  }
  else
  {
    v6 = objc_msgSend(a1, "bl_isDownloadedWithResourceValue:", v3);
  }

  return v6;
}

uint64_t sub_212CA7D18(void *a1)
{
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v9 = 0;
  v2 = *MEMORY[0x24BDBCD30];
  v8 = 0;
  objc_msgSend(a1, "getResourceValue:forKey:error:", &v9, v2, &v8);
  v3 = v9;
  v4 = v8;
  if (v4)
  {
    BLDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_ERROR, "Error -[NSURL bl_isDownloading]:  %@", buf, 0xCu);
    }

    v6 = 0;
  }
  else
  {
    v6 = objc_msgSend(a1, "bl_BOOLFromResourceValue:", v3);
  }

  return v6;
}

uint64_t sub_212CA7E20(void *a1)
{
  id v2;

  v2 = 0;
  objc_msgSend(a1, "getResourceValue:forKey:error:", &v2, *MEMORY[0x24BDBCD48], 0);
  return objc_msgSend(v2, "BOOLValue");
}

uint64_t sub_212CA7E5C(void *a1)
{
  id v2;

  v2 = 0;
  objc_msgSend(a1, "getResourceValue:forKey:error:", &v2, *MEMORY[0x24BDBCD50], 0);
  return objc_msgSend(v2, "BOOLValue");
}

uint64_t sub_212CA7E98(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  id v17;
  uint8_t buf[4];
  id v19;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDBCCA8];
  v3 = *MEMORY[0x24BDBCD20];
  v20[0] = *MEMORY[0x24BDBCCA8];
  v20[1] = v3;
  v4 = *MEMORY[0x24BDBCD30];
  v20[2] = *MEMORY[0x24BDBCD30];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(a1, "resourceValuesForKeys:error:", v5, &v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v17;

  if (v7)
  {
    BLDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v7;
      _os_log_impl(&dword_212C78000, v8, OS_LOG_TYPE_ERROR, "Error querying bl_isUbiquitousPromise  %@", buf, 0xCu);
    }

    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(a1, "bl_BOOLFromResourceValue:", v10);

    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(a1, "bl_BOOLFromResourceValue:", v12);

    objc_msgSend(v6, "objectForKeyedSubscript:", v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(a1, "bl_isDownloadedWithResourceValue:", v14);

    if (v11)
      v9 = (v13 | v15) ^ 1u;
    else
      v9 = 0;
  }

  return v9;
}

uint64_t sub_212CA8064(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a3;
  objc_opt_class();
  BUDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "BOOLValue");
  return v5;
}

uint64_t sub_212CA80BC(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a3;
  objc_opt_class();
  BUDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDBCD10]) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDBCD18]);

  return v5;
}

void sub_212CAA55C(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("NSDetailedErrors"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v2, "count"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v8, "logRecursively", (_QWORD)v9);
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

  }
}

unint64_t sub_212CAA6C0(void *a1)
{
  return strtoull((const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String"), 0, 0);
}

void sub_212CAC10C()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForInfoDictionaryKey:", CFSTR("CFBundleShortVersionString"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v1 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("1.2/iBooks-%@"), v3);
  v2 = (void *)qword_253DB1F90;
  qword_253DB1F90 = v1;

}

void sub_212CAC1DC()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%d.%d"), 3, 13);
  v1 = (void *)qword_253DB1F80;
  qword_253DB1F80 = v0;

}

void IMStreamingHashWithFilePath(void *a1, int a2, void *a3, void *a4)
{
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  dispatch_io_t v18;
  dispatch_io_t v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  _QWORD v29[4];
  NSObject *v30;
  NSObject *v31;
  _QWORD *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  id *v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  _QWORD block[4];
  id v42;
  id v43;
  _QWORD cleanup_handler[4];
  NSObject *v45;
  id v46;
  _QWORD *v47;
  uint64_t *v48;
  _QWORD v49[3];
  int v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;

  v7 = a1;
  v8 = a3;
  v9 = a4;
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  v27 = v9;
  v28 = v7;
  if (a2 == 1)
  {
    v10 = operator new();
    *(_QWORD *)v10 = &off_24CE8BBC8;
    CC_SHA1_Init((CC_SHA1_CTX *)(v10 + 8));
  }
  else
  {
    v10 = 0;
    if (!a2)
    {
      v10 = operator new();
      *(_QWORD *)v10 = &off_24CE8BB60;
      CC_MD5_Init((CC_MD5_CTX *)(v10 + 8));
    }
  }
  v54 = v10;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("IMStreamingHash.%p"), v52[3]);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = dispatch_queue_create((const char *)objc_msgSend(v11, "UTF8String"), 0);

  dispatch_set_target_queue(v12, v8);
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2020000000;
  v50 = 0;
  v13 = objc_retainAutorelease(v7);
  v14 = (const char *)objc_msgSend(v13, "fileSystemRepresentation");
  v15 = MEMORY[0x24BDAC760];
  cleanup_handler[0] = MEMORY[0x24BDAC760];
  cleanup_handler[1] = 3221225472;
  cleanup_handler[2] = sub_212CACA30;
  cleanup_handler[3] = &unk_24CE8BA68;
  v47 = v49;
  v48 = &v51;
  v16 = v12;
  v45 = v16;
  v17 = v9;
  v46 = v17;
  v18 = dispatch_io_create_with_path(0, v14, 0, 0, v16, cleanup_handler);
  v19 = v18;
  if (v18)
  {
    v29[0] = v15;
    v35 = 0;
    v36 = (id *)&v35;
    v37 = 0x3042000000;
    v38 = sub_212CACBCC;
    v39 = sub_212CACBD8;
    v40 = 0;
    v29[1] = 3221225472;
    v29[2] = sub_212CACBE0;
    v29[3] = &unk_24CE8BAB8;
    v32 = v49;
    v20 = v18;
    v30 = v20;
    v21 = v16;
    v31 = v21;
    v33 = &v35;
    v34 = &v51;
    v22 = (id)objc_msgSend(v29, "copy");
    objc_storeWeak(v36 + 5, v22);
    dispatch_io_read(v20, 0, 0x10000uLL, v21, v22);

    _Block_object_dispose(&v35, 8);
    objc_destroyWeak(&v40);
  }
  else
  {
    v23 = v52[3];
    if (v23)
      (*(void (**)(uint64_t))(*(_QWORD *)v23 + 8))(v23);
    v24 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("dispatch_io_create_with_path() returned NULL"), *MEMORY[0x24BDD0FC8], v13, CFSTR("path"), 0, v27, v28);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("IMStreamingHash"), 1, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    block[0] = v15;
    block[1] = 3221225472;
    block[2] = sub_212CACBB8;
    block[3] = &unk_24CE8BA90;
    v42 = v26;
    v43 = v17;
    v22 = v26;
    dispatch_async(v16, block);

  }
  _Block_object_dispose(v49, 8);

  _Block_object_dispose(&v51, 8);
}

void sub_212CAC92C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, id *location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43)
{
  uint64_t v43;
  void *v44;

  MEMORY[0x2199A4120](v43, 0x1081C401A844EABLL);

  _Unwind_Resume(a1);
}

void sub_212CACA30(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;

  if (a2 || (a2 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], a2, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 0;
  }
  else
  {
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    (*(void (**)(uint64_t))(*(_QWORD *)v10 + 40))(v10);
    v11 = (void *)MEMORY[0x24BDBCE50];
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v13 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v12 + 24))(v12);
    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    objc_msgSend(v11, "dataWithBytes:length:", v13, (*(uint64_t (**)(uint64_t))(*(_QWORD *)v14 + 16))(v14));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 0;
  }
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212CACBA4;
  block[3] = &unk_24CE8BA40;
  v6 = *(NSObject **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v17 = v3;
  v18 = v7;
  v16 = v4;
  v8 = v3;
  v9 = v4;
  dispatch_async(v6, block);

}

uint64_t sub_212CACBA4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t sub_212CACBB8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void sub_212CACBCC(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void sub_212CACBD8(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void sub_212CACBE0(_QWORD *a1, int a2, void *a3, int a4)
{
  NSObject *v7;
  NSObject *v8;
  size_t size;
  NSObject *v10;
  NSObject *v11;
  id WeakRetained;
  uint64_t v13;
  NSObject *v14;
  _QWORD applier[5];

  v7 = a3;
  v8 = v7;
  if (a4)
  {
    *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a4;
  }
  else
  {
    v14 = v7;
    if (a2)
    {
      size = dispatch_data_get_size(v7);
      v8 = v14;
      if (size)
      {
        v10 = a1[4];
        v11 = a1[5];
        WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1[7] + 8) + 40));
        dispatch_io_read(v10, 0, 0x10000uLL, v11, WeakRetained);

        v8 = v14;
      }
    }
    v13 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24);
    applier[0] = MEMORY[0x24BDAC760];
    applier[1] = 3221225472;
    applier[2] = sub_212CAD448;
    applier[3] = &unk_24CE8BC10;
    applier[4] = v13;
    dispatch_data_apply(v8, applier);
    v8 = v14;
  }

}

void IMStreamingHashStringWithFilePath(void *a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_212CACD74;
  v9[3] = &unk_24CE8BAE0;
  v10 = v7;
  v8 = v7;
  IMStreamingHashWithFilePath(a1, a2, a3, v9);

}

void sub_212CACD5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_212CACD74(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  sub_212CACDF4(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v6, v7);

}

void sub_212CACDD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

__CFString *sub_212CACDF4(void *a1)
{
  id v1;
  void *v2;
  id v3;
  unsigned __int8 *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  unsigned int v9;
  __CFString *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = objc_retainAutorelease(v1);
    v4 = (unsigned __int8 *)objc_msgSend(v3, "bytes");
    v5 = objc_msgSend(v3, "length");
    v6 = v5;
    if (v5)
    {
      v7 = 2 * v5;
      MEMORY[0x24BDAC7A8]();
      bzero((char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), 2 * v6);
      v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0) + 1;
      do
      {
        v9 = *v4++;
        *(v8 - 1) = a0123456789abcd[(unint64_t)v9 >> 4];
        *v8 = a0123456789abcd[v9 & 0xF];
        v8 += 2;
        --v6;
      }
      while (v6);
      v10 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v7, 4);
    }
    else
    {
      v10 = &stru_24CE8D258;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void sub_212CACF20(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id IMStreamingHashWithFilePathSync(void *a1, int a2, _QWORD *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v5 = a1;
  v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_212CAD0F0;
  v25 = sub_212CAD100;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_212CAD0F0;
  v19 = sub_212CAD100;
  v20 = 0;
  dispatch_get_global_queue(0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_212CAD108;
  v11[3] = &unk_24CE8BB08;
  v13 = &v21;
  v14 = &v15;
  v8 = v6;
  v12 = v8;
  IMStreamingHashWithFilePath(v5, a2, v7, v11);

  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (a3)
    *a3 = objc_retainAutorelease((id)v16[5]);
  v9 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void sub_212CAD0A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  void *v28;
  void *v29;
  void *v30;

  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);

  _Unwind_Resume(a1);
}

uint64_t sub_212CAD0F0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_212CAD100(uint64_t a1)
{

}

void sub_212CAD108(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

id IMStreamingHashStringWithFilePathSync(void *a1, int a2, _QWORD *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v5 = a1;
  v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_212CAD0F0;
  v25 = sub_212CAD100;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_212CAD0F0;
  v19 = sub_212CAD100;
  v20 = 0;
  dispatch_get_global_queue(0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_212CAD340;
  v11[3] = &unk_24CE8BB30;
  v13 = &v21;
  v14 = &v15;
  v8 = v6;
  v12 = v8;
  IMStreamingHashStringWithFilePath(v5, a2, v7, v11);

  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (a3)
    *a3 = objc_retainAutorelease((id)v16[5]);
  v9 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void sub_212CAD2F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  void *v28;
  void *v29;
  void *v30;

  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);

  _Unwind_Resume(a1);
}

void sub_212CAD340(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_212CAD3CC()
{
  JUMPOUT(0x2199A4120);
}

uint64_t sub_212CAD3E0()
{
  return 16;
}

uint64_t sub_212CAD3E8(uint64_t a1)
{
  return a1 + 100;
}

uint64_t sub_212CAD3F0(uint64_t a1, const void *a2, CC_LONG a3)
{
  return CC_MD5_Update((CC_MD5_CTX *)(a1 + 8), a2, a3);
}

uint64_t sub_212CAD3F8(uint64_t a1)
{
  return CC_MD5_Final((unsigned __int8 *)(a1 + 100), (CC_MD5_CTX *)(a1 + 8));
}

void sub_212CAD40C()
{
  JUMPOUT(0x2199A4120);
}

uint64_t sub_212CAD420()
{
  return 20;
}

uint64_t sub_212CAD428(uint64_t a1)
{
  return a1 + 104;
}

uint64_t sub_212CAD430(uint64_t a1, const void *a2, CC_LONG a3)
{
  return CC_SHA1_Update((CC_SHA1_CTX *)(a1 + 8), a2, a3);
}

uint64_t sub_212CAD438(uint64_t a1)
{
  return CC_SHA1_Final((unsigned __int8 *)(a1 + 104), (CC_SHA1_CTX *)(a1 + 8));
}

uint64_t sub_212CAD448(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  (*(void (**)(_QWORD, uint64_t, uint64_t))(**(_QWORD **)(a1 + 32) + 32))(*(_QWORD *)(a1 + 32), a4, a5);
  return 1;
}

BOOL _BLStoreDemoModeEnabled()
{
  int AppBooleanValue;
  BOOL v1;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("StoreDemoMode"), CFSTR("com.apple.demo-settings"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v1 = AppBooleanValue == 0;
  else
    v1 = 1;
  return !v1;
}

uint64_t sub_212CAD600(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 68) = *(_BYTE *)(result + 40);
  return result;
}

void sub_212CAD6C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_212CAD6D8(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 68);
  return result;
}

uint64_t sub_212CAD760(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 60) = *(_BYTE *)(result + 40);
  return result;
}

void sub_212CAD820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_212CAD838(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 60);
  return result;
}

uint64_t sub_212CAD8A4(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 32))
    *(_BYTE *)(v1 + 33) = 0;
  return result;
}

void sub_212CAD9B8(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_allPurchaseDAAPServers", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "updateItemImageURLsIgnoringCache:completion:", 0, 0);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

void sub_212CADB28(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_212CADC14;
  v9 = sub_212CADC24;
  v10 = 0;
  objc_msgSend(*(id *)(a1 + 32), "dsidQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_212CADC2C;
  v4[3] = &unk_24CE8B4E8;
  v4[4] = *(_QWORD *)(a1 + 32);
  v4[5] = &v5;
  dispatch_sync(v2, v4);

  v3 = (void *)v6[5];
  if (v3)
    objc_msgSend(v3, "updateItemImageURLsIgnoringCache:completion:", 0, *(_QWORD *)(a1 + 40));
  _Block_object_dispose(&v5, 8);

}

void sub_212CADBFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_212CADC14(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_212CADC24(uint64_t a1)
{

}

void sub_212CADC2C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[1])
  {
    objc_msgSend(v2, "swqDSIDToDAAPServer");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

void sub_212CADD48(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "fetchRequestForStoreIDs:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  v12 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v2, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_212CADE50;
  v10[3] = &unk_24CE8BCC8;
  v7 = v3;
  v11 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);

  v8 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 48));
  v9 = (void *)v8;
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v7, v6);

}

void sub_212CADE50(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    +[BLJaliscoItem itemWithServerItem:](BLJaliscoItem, "itemWithServerItem:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v3);

  }
}

void sub_212CADF60(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestForAllStoreIDs:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(*(_QWORD *)(a1 + 40) + 136);
  v9 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v3, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_212CAE038;
  v7[3] = &unk_24CE8BCC8;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

void sub_212CAE038(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    +[BLJaliscoItem itemWithServerItem:](BLJaliscoItem, "itemWithServerItem:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v3);

  }
}

void sub_212CAE154(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestForAllBookletsIDsWithParentStoreIDs:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(*(_QWORD *)(a1 + 40) + 136);
  v9 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v3, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_212CAE22C;
  v7[3] = &unk_24CE8BD40;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

void sub_212CAE22C(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "objectForKey:", CFSTR("storeID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

void sub_212CAE328(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "fetchRequestForBuyParameters:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  v12 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v2, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_212CAE430;
  v10[3] = &unk_24CE8BCC8;
  v7 = v3;
  v11 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);

  v8 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 48));
  v9 = (void *)v8;
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v7, v6);

}

void sub_212CAE430(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    +[BLJaliscoItem itemWithServerItem:](BLJaliscoItem, "itemWithServerItem:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v3);

  }
}

void sub_212CAE52C(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
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
  v9 = sub_212CADC14;
  v10 = sub_212CADC24;
  v11 = 0;
  objc_msgSend(*(id *)(a1 + 32), "dsidQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_212CAE62C;
  v5[3] = &unk_24CE8B4E8;
  v5[4] = *(_QWORD *)(a1 + 32);
  v5[5] = &v6;
  dispatch_sync(v2, v5);

  v3 = (void *)v7[5];
  if (v3)
  {
    objc_msgSend(v3, "hideItemsWithStoreIDs:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
      (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  }
  _Block_object_dispose(&v6, 8);

}

void sub_212CAE614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212CAE62C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[1])
  {
    objc_msgSend(v2, "swqDSIDToDAAPServer");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

void sub_212CAE71C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "fetchRequestForHiddenItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  v12 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v2, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_212CAE820;
  v10[3] = &unk_24CE8BCC8;
  v7 = v3;
  v11 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);

  v8 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 40));
  v9 = (void *)v8;
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v7, v6);

}

void sub_212CAE820(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "storeID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void sub_212CAEF8C(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  uint64_t *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint8_t v15[8];
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  if ((_DWORD)a2)
  {
    BLJaliscoLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_212C78000, v4, OS_LOG_TYPE_INFO, "UpdatePolitely was successful. Clearing storeAuthenticationRequired, isGDPRPrivacyAcknowledgementRequired", v15, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setIsGDPRPrivacyAcknowledgementRequired:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setStoreAuthenticationRequired:", 0);
  }
  v5 = objc_msgSend(*(id *)(a1 + 32), "isGDPRPrivacyAcknowledgementRequired");
  v6 = (uint64_t *)MEMORY[0x24BDD0FC8];
  if (v5)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v18 = *MEMORY[0x24BDD0FC8];
    v19[0] = CFSTR("GDPR acknowledgement required");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("BLJaliscoDAAPClientError"), 6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "storeAuthenticationRequired"))
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v16 = *v6;
    v17 = CFSTR("need store auth to get jalisco items");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("BLJaliscoDAAPClientError"), 5, v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v12;
  }
  v13 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 40));
  v14 = (void *)v13;
  if (v13)
    (*(void (**)(uint64_t, uint64_t, void *))(v13 + 16))(v13, a2, v9);

}

void sub_212CAF1F8(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[7];
  _QWORD v47[6];
  NSObject *v48;
  uint8_t *v49;
  uint64_t v50;
  char v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[5];
  id v57;
  _QWORD block[7];
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint8_t v67[4];
  id v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  uint64_t v72;
  uint8_t v73[128];
  uint8_t buf[8];
  _BYTE v75[20];
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = 0x7FFFFFFFFFFFFFFFLL;
  v59 = 0;
  v60 = &v59;
  v61 = 0x2020000000;
  v62 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 112);
  v4 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212CAF898;
  block[3] = &unk_24CE8BD90;
  block[4] = v2;
  block[5] = &v63;
  block[6] = &v59;
  dispatch_sync(v3, block);
  if (*((_BYTE *)v60 + 24))
  {
    v5 = *(void **)(a1 + 40);
    if (v5)
    {
      v6 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
      v7 = (void *)objc_msgSend(v5, "copy");
      objc_msgSend(v6, "addObject:", v7);

    }
    objc_msgSend(*(id *)(a1 + 32), "_currentPurchaseDAAPServers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForKey:", CFSTR("dsid"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    BLJaliscoLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v42 = v8;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(unsigned __int8 *)(a1 + 56);
      v11 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = v10;
      *(_WORD *)v75 = 2048;
      *(_QWORD *)&v75[2] = v11;
      *(_WORD *)&v75[10] = 2112;
      *(_QWORD *)&v75[12] = v43;
      _os_log_impl(&dword_212C78000, v9, OS_LOG_TYPE_DEFAULT, "[BLJaliscoDAAPClient] updatePolitely:%{BOOL}d reason:%ld will update for DSIDs:(%@)", buf, 0x1Cu);
    }

    if (objc_msgSend(v43, "count"))
    {
      v12 = *(_QWORD *)(a1 + 32);
      if (!*(_BYTE *)(v12 + 33))
      {
        dispatch_get_global_queue(0, 0);
        v13 = objc_claimAutoreleasedReturnValue();
        v56[0] = v4;
        v56[1] = 3221225472;
        v56[2] = sub_212CAF9AC;
        v56[3] = &unk_24CE8B1C8;
        v56[4] = v12;
        v57 = v43;
        dispatch_async(v13, v56);

      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)v75 = buf;
      *(_QWORD *)&v75[8] = 0x2020000000;
      v75[16] = 1;
      v14 = dispatch_group_create();
      BLJaliscoLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x24BDD17F0], "currentThread", v8);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "purchaseDAAPSyncsInFlight");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");
        *(_DWORD *)v67 = 138412546;
        v68 = v16;
        v69 = 2048;
        v70 = v18;
        _os_log_impl(&dword_212C78000, v15, OS_LOG_TYPE_INFO, "Dispatch group: creation thread %@ purchaseDAAPSyncsInFlight %lu - updatePolitely", v67, 0x16u);

      }
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v19 = v42;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v52, v73, 16);
      if (v20)
      {
        v45 = *(_QWORD *)v53;
        do
        {
          v21 = 0;
          v44 = v20;
          do
          {
            if (*(_QWORD *)v53 != v45)
              objc_enumerationMutation(v19);
            v22 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v21);
            objc_msgSend(*(id *)(a1 + 32), "purchaseDAAPSyncsInFlight", v42);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "containsObject:", v22);

            if ((v24 & 1) == 0)
            {
              objc_msgSend(*(id *)(a1 + 32), "purchaseDAAPSyncsInFlight");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "addObject:", v22);

              dispatch_group_enter(v14);
              BLJaliscoLog();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                v27 = v19;
                v28 = v14;
                v29 = v4;
                objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
                v30 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "dsid");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1 + 32), "purchaseDAAPSyncsInFlight");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = objc_msgSend(v32, "count");
                *(_DWORD *)v67 = 138412802;
                v68 = v30;
                v69 = 2112;
                v70 = (uint64_t)v31;
                v71 = 2048;
                v72 = v33;
                _os_log_impl(&dword_212C78000, v26, OS_LOG_TYPE_INFO, "Dispatch group: entry thread %@ dsid:%@ purchaseDAAPSyncsInFlight %lu - updatePolitely", v67, 0x20u);

                v4 = v29;
                v14 = v28;
                v19 = v27;
                v20 = v44;

              }
              v34 = *(_QWORD *)(a1 + 48);
              v35 = *(_QWORD *)(a1 + 32);
              v36 = *(_QWORD *)(v35 + 40);
              v47[0] = v4;
              v47[1] = 3221225472;
              v47[2] = sub_212CAFB64;
              v47[3] = &unk_24CE8BE30;
              v51 = *(_BYTE *)(a1 + 56);
              v47[4] = v22;
              v47[5] = v35;
              v49 = buf;
              v50 = v34;
              v48 = v14;
              objc_msgSend(v22, "setupWithReason:queue:completion:", v34, v36, v47);

            }
            ++v21;
          }
          while (v20 != v21);
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v52, v73, 16);
        }
        while (v20);
      }

      v37 = *(_QWORD *)(a1 + 32);
      v38 = *(NSObject **)(v37 + 40);
      v46[0] = v4;
      v46[1] = 3221225472;
      v46[2] = sub_212CB00D8;
      v46[3] = &unk_24CE8BE58;
      v46[4] = v37;
      v46[5] = buf;
      v46[6] = &v63;
      dispatch_group_notify(v14, v38, v46);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      BLJaliscoLog();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_212C78000, v41, OS_LOG_TYPE_DEFAULT, "[BLJaliscoDAAPClient] no update - no signed in user", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_sendCompletionHandlersWithSuccess:generation:", 1, v64[3], v8);
    }

  }
  else
  {
    BLJaliscoLog();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212C78000, v39, OS_LOG_TYPE_DEFAULT, "No update required", buf, 2u);
    }

    v40 = *(_QWORD *)(a1 + 40);
    if (v40)
      (*(void (**)(uint64_t, uint64_t))(v40 + 16))(v40, 1);
  }
  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);
}

void sub_212CAF82C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose(&a59, 8);
  _Unwind_Resume(a1);
}

void sub_212CAF898(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_QWORD *)(a1[4] + 88);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_QWORD *)(a1[4] + 96) != *(_QWORD *)(a1[4] + 88);
  BLJaliscoLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v5 = *(_QWORD *)(v3 + 88);
    v4 = *(_QWORD *)(v3 + 96);
    v6 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
    v7 = 134218496;
    v8 = v5;
    v9 = 2048;
    v10 = v4;
    v11 = 1024;
    v12 = v6;
    _os_log_impl(&dword_212C78000, v2, OS_LOG_TYPE_DEFAULT, "Need update test: currentGeneration:%lu pendingGeneration:%lu Needs update:%{BOOL}d", (uint8_t *)&v7, 0x1Cu);
  }

  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    *(_QWORD *)(a1[4] + 96) = *(_QWORD *)(a1[4] + 88);
}

void sub_212CAF9AC(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "newManagedObjectContext");
  +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemsFetchRequestForDSIDs:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setFetchLimit:", 1);
  v11 = 0;
  v5 = objc_msgSend(v2, "countForFetchRequest:error:", v4, &v11);
  v6 = v11;
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BLJaliscoLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_impl(&dword_212C78000, v9, OS_LOG_TYPE_ERROR, "DAAP Setup: Couldn't count items.  %@", buf, 0xCu);
    }

  }
  else if (!v5)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(NSObject **)(v7 + 40);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = sub_212CAFB20;
    v10[3] = &unk_24CE8B1F0;
    v10[4] = v7;
    dispatch_async(v8, v10);
  }

}

uint64_t sub_212CAFB20(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("initiallyLoadingJalisco"));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("initiallyLoadingJalisco"));
}

void sub_212CAFB64(uint64_t a1, int a2)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  _QWORD block[6];
  __int128 v20;
  _QWORD v21[6];
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  BLJaliscoLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "dsid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v24 = v5;
    v25 = 1024;
    v26 = a2;
    _os_log_impl(&dword_212C78000, v4, OS_LOG_TYPE_INFO, "DAAP Setup, dsid: %@, success: %d", buf, 0x12u);

  }
  if (a2)
  {
    v6 = *(unsigned __int8 *)(a1 + 72);
    v7 = *(_QWORD *)(a1 + 64);
    v9 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(v8 + 40);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = sub_212CAFD28;
    v21[3] = &unk_24CE8BDE0;
    v11 = (id *)&v22;
    v17 = *(_OWORD *)(a1 + 48);
    v21[4] = v9;
    v21[5] = v8;
    v12 = (id)v17;
    v22 = v17;
    objc_msgSend(v9, "fetchAllItemsPolitely:reason:queue:completion:", v6, v7, v10, v21);
  }
  else
  {
    v14 = *(_QWORD *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    v15 = *(NSObject **)(v13 + 40);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_212CAFFA4;
    block[3] = &unk_24CE8BE08;
    block[4] = v13;
    block[5] = v14;
    v11 = (id *)&v20;
    v18 = *(_OWORD *)(a1 + 48);
    v16 = (id)v18;
    v20 = v18;
    dispatch_async(v15, block);
  }

}

void sub_212CAFD28(uint64_t a1, int a2)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  __int128 v10;
  _QWORD block[6];
  __int128 v12;
  char v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  BLJaliscoLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "dsid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v15 = v5;
    v16 = 1024;
    v17 = a2;
    _os_log_impl(&dword_212C78000, v4, OS_LOG_TYPE_INFO, "DAAP Update, dsid: %@, success: %d", buf, 0x12u);

  }
  block[0] = MEMORY[0x24BDAC760];
  block[2] = sub_212CAFE5C;
  block[3] = &unk_24CE8BDB8;
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8 = *(NSObject **)(v6 + 40);
  block[1] = 3221225472;
  v13 = a2;
  v10 = *(_OWORD *)(a1 + 48);
  block[4] = v6;
  block[5] = v7;
  v9 = (id)v10;
  v12 = v10;
  dispatch_async(v8, block);

}

void sub_212CAFE5C(uint64_t a1)
{
  uint64_t v2;
  char v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v3 = *(_BYTE *)(v2 + 24);
  if (v3)
    v3 = *(_BYTE *)(a1 + 64) != 0;
  *(_BYTE *)(v2 + 24) = v3;
  objc_msgSend(*(id *)(a1 + 32), "purchaseDAAPSyncsInFlight");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 40));

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  BLJaliscoLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "dsid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "purchaseDAAPSyncsInFlight");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    v13 = 2048;
    v14 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_INFO, "Dispatch group:leave thread %@ dsid:%@  purchaseDAAPSyncsInFlight %lu - after DAAP update", (uint8_t *)&v9, 0x20u);

  }
}

void sub_212CAFFA4(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  objc_msgSend(*(id *)(a1 + 32), "purchaseDAAPSyncsInFlight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  BLJaliscoLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "dsid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "purchaseDAAPSyncsInFlight");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412802;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    v11 = 2048;
    v12 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_212C78000, v3, OS_LOG_TYPE_INFO, "Dispatch group:leave thread %@ dsid:%@ purchaseDAAPSyncsInFlight %lu - NO DAAP update", (uint8_t *)&v7, 0x20u);

  }
}

uint64_t sub_212CB00D8(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  BLJaliscoLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "purchaseDAAPSyncsInFlight");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v3;
    v8 = 2048;
    v9 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_212C78000, v2, OS_LOG_TYPE_INFO, "Dispatch group:NOTIFY thread %@  purchaseDAAPSyncsInFlight %lu - updatePolitely", (uint8_t *)&v6, 0x16u);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_sendCompletionHandlersWithSuccess:generation:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
}

void sub_212CB039C(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "swqDSIDToDAAPServer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

}

void sub_212CB0560(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newPurchaseDAAPServerWithDSID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "setObject:forKeyedSubscript:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

    BLJaliscoLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(v5 + 8);
      v7 = *(_QWORD *)(v5 + 88);
      v13 = 138412546;
      v14 = v6;
      v15 = 2048;
      v16 = v7;
      _os_log_impl(&dword_212C78000, v4, OS_LOG_TYPE_DEFAULT, "_addPurchaseServerForCurrentUser Created daap server for dsid:(%@) currentServerGen:(%lu)", (uint8_t *)&v13, 0x16u);
    }

    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
    v8 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v8 + 88) == 0x7FFFFFFFFFFFFFFFLL)
      *(_QWORD *)(v8 + 88) = 0x8000000000000000;
    BLJaliscoLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(v10 + 8);
      v12 = *(_QWORD *)(v10 + 88);
      v13 = 138412546;
      v14 = v11;
      v15 = 2048;
      v16 = v12;
      _os_log_impl(&dword_212C78000, v9, OS_LOG_TYPE_DEFAULT, "_addPurchaseServerForCurrentUser Finished for dsid:(%@) currentServerGen:(%lu)", (uint8_t *)&v13, 0x16u);
    }

  }
}

void sub_212CB0958(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  uint64_t *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint8_t v15[8];
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  if ((_DWORD)a2)
  {
    BLJaliscoLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_212C78000, v4, OS_LOG_TYPE_INFO, "updateFamilyPolitely was successful. Clearing storeAuthenticationRequired, isGDPRPrivacyAcknowledgementRequired", v15, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setIsGDPRPrivacyAcknowledgementRequired:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setStoreAuthenticationRequired:", 0);
  }
  v5 = objc_msgSend(*(id *)(a1 + 32), "isGDPRPrivacyAcknowledgementRequired");
  v6 = (uint64_t *)MEMORY[0x24BDD0FC8];
  if (v5)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v18 = *MEMORY[0x24BDD0FC8];
    v19[0] = CFSTR("GDPR acknowledgement required");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("BLJaliscoDAAPClientError"), 6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "storeAuthenticationRequired"))
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v16 = *v6;
    v17 = CFSTR("need store auth to get family jalisco items");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("BLJaliscoDAAPClientError"), 5, v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v12;
  }
  v13 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 40));
  v14 = (void *)v13;
  if (v13)
    (*(void (**)(uint64_t, uint64_t, void *))(v13 + 16))(v13, a2, v9);

}

void sub_212CB0D64(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_212CB0D90(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  _QWORD v5[5];
  id v6;
  uint64_t v7;
  char v8;

  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_212CB0E18;
  v5[3] = &unk_24CE8BED0;
  v4 = v2;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(_BYTE *)(a1 + 56);
  dispatch_async(v3, v5);

}

void sub_212CB0E18(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  __int128 v25;
  _QWORD block[6];
  _QWORD v27[6];
  NSObject *v28;
  _QWORD *v29;
  uint64_t v30;
  char v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[3];
  char v37;
  uint8_t buf[4];
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v4 = (void *)objc_msgSend(v2, "copy");
    objc_msgSend(v3, "addObject:", v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "_familyPurchaseDAAPServers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v37 = 1;
  v6 = dispatch_group_create();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v8)
  {
    v10 = *(_QWORD *)v33;
    *(_QWORD *)&v9 = 138412290;
    v25 = v9;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v11);
        objc_msgSend(*(id *)(a1 + 32), "purchaseDAAPSyncsInFlight", v25);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "containsObject:", v12);

        if (v14)
        {
          BLJaliscoLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v12, "dsid");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v25;
            v39 = v16;
            _os_log_impl(&dword_212C78000, v15, OS_LOG_TYPE_DEFAULT, "Skipping family purchase history update for %@ (already in-flight)", buf, 0xCu);

          }
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "purchaseDAAPSyncsInFlight");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v12);

          dispatch_group_enter(v6);
          BLJaliscoLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v12, "dsid");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v25;
            v39 = v19;
            _os_log_impl(&dword_212C78000, v18, OS_LOG_TYPE_DEFAULT, "Setting up family purchase history request for %@", buf, 0xCu);

          }
          v20 = *(_QWORD *)(a1 + 48);
          v21 = *(_QWORD *)(a1 + 32);
          v22 = *(_QWORD *)(v21 + 40);
          v27[0] = MEMORY[0x24BDAC760];
          v27[1] = 3221225472;
          v27[2] = sub_212CB1194;
          v27[3] = &unk_24CE8BE30;
          v31 = *(_BYTE *)(a1 + 56);
          v27[4] = v12;
          v27[5] = v21;
          v29 = v36;
          v30 = v20;
          v28 = v6;
          objc_msgSend(v12, "setupWithReason:queue:completion:", v20, v22, v27);

        }
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v8);
  }

  v23 = *(_QWORD *)(a1 + 32);
  v24 = *(NSObject **)(v23 + 40);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212CB1534;
  block[3] = &unk_24CE8BC78;
  block[4] = v23;
  block[5] = v36;
  dispatch_group_notify(v6, v24, block);

  _Block_object_dispose(v36, 8);
}

void sub_212CB115C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_212CB1194(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  _QWORD block[6];
  __int128 v16;
  _QWORD v17[6];
  __int128 v18;

  if (a2)
  {
    v2 = *(unsigned __int8 *)(a1 + 72);
    v3 = *(_QWORD *)(a1 + 64);
    v5 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(v4 + 40);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = sub_212CB12B0;
    v17[3] = &unk_24CE8BEA8;
    v7 = (id *)&v18;
    v13 = *(_OWORD *)(a1 + 48);
    v17[4] = v4;
    v17[5] = v5;
    v8 = (id)v13;
    v18 = v13;
    objc_msgSend(v5, "fetchAllItemsPolitely:reason:queue:completion:", v2, v3, v6, v17);
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v11 = *(NSObject **)(v9 + 40);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_212CB1448;
    block[3] = &unk_24CE8BE08;
    block[4] = v9;
    block[5] = v10;
    v7 = (id *)&v16;
    v14 = *(_OWORD *)(a1 + 48);
    v12 = (id)v14;
    v16 = v14;
    dispatch_async(v11, block);
  }

}

void sub_212CB12B0(uint64_t a1, char a2)
{
  NSObject *v2;
  id v3;
  __int128 v4;
  _QWORD block[4];
  __int128 v6;
  __int128 v7;
  char v8;

  block[1] = 3221225472;
  v4 = *(_OWORD *)(a1 + 48);
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = *(_OWORD *)(a1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[2] = sub_212CB1338;
  block[3] = &unk_24CE8BDB8;
  v8 = a2;
  v3 = (id)v4;
  v7 = v4;
  dispatch_async(v2, block);

}

void sub_212CB1338(uint64_t a1)
{
  uint64_t v2;
  char v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v3 = *(_BYTE *)(v2 + 24);
  if (v3)
    v3 = *(_BYTE *)(a1 + 64) != 0;
  *(_BYTE *)(v2 + 24) = v3;
  objc_msgSend(*(id *)(a1 + 32), "purchaseDAAPSyncsInFlight");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 40));

  BLJaliscoLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "dsid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(unsigned __int8 *)(a1 + 64);
    v8 = 138412546;
    v9 = v6;
    v10 = 1024;
    v11 = v7;
    _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_DEFAULT, "Family purchase history update completed for %@ (%d)", (uint8_t *)&v8, 0x12u);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_212CB1448(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  objc_msgSend(*(id *)(a1 + 32), "purchaseDAAPSyncsInFlight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

  BLJaliscoLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 40), "dsid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_212C78000, v3, OS_LOG_TYPE_ERROR, "Family purchase history setup failed for %@", (uint8_t *)&v5, 0xCu);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_212CB1534(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void (**v7)(void);
  _QWORD v8[4];
  __int128 v9;
  uint8_t buf[4];
  const __CFString *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  BLJaliscoLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      v3 = CFSTR("successfully");
    else
      v3 = CFSTR("with error");
    objc_msgSend(*(id *)(a1 + 32), "purchaseDAAPSyncsInFlight");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v11 = v3;
    v12 = 2048;
    v13 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_212C78000, v2, OS_LOG_TYPE_DEFAULT, "Jalisco family purchase updates completed %{public}@ (%lu)", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "purchaseDAAPSyncsInFlight");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = sub_212CB168C;
    v8[3] = &unk_24CE8B4E8;
    v9 = *(_OWORD *)(a1 + 32);
    v7 = (void (**)(void))MEMORY[0x2199A44E0](v8);
    v7[2]();

  }
}

uint64_t sub_212CB168C(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6) + 16))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects", (_QWORD)v8);
}

void sub_212CB1798(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v7;
  id v8;
  id v9;
  id v10;
  id WeakRetained;

  v7 = (id *)(a1 + 40);
  v8 = a4;
  v9 = a3;
  v10 = a2;
  WeakRetained = objc_loadWeakRetained(v7);
  objc_msgSend(WeakRetained, "_processFamilyCircleAdded:removed:unchanged:completion:", v10, v9, v8, *(_QWORD *)(a1 + 32));

}

void sub_212CB1FC4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  const __CFString *v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_dsids");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allItemsFetchRequestForDSIDs:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_dsids");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fetchRequestForStoreIDs:dsids:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
  }
  BLJaliscoLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v4;
    _os_log_impl(&dword_212C78000, v9, OS_LOG_TYPE_ERROR, "Deleting items %@", buf, 0xCu);
  }

  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  v26 = 0;
  objc_msgSend(v10, "executeFetchRequest:error:", v4, &v26);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v26;
  if (v12)
  {
    v13 = v12;
    BLJaliscoLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    *(_DWORD *)buf = 138412290;
    v30 = v13;
    v15 = "Couldn't fetch items to delete Error: %@";
    v16 = v14;
    v17 = 12;
    goto LABEL_8;
  }
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "firstObject");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "deleteObject:", v14);
    v18 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
    v25 = 0;
    objc_msgSend(v18, "save:", &v25);
    v13 = v25;
    BLJaliscoLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      -[NSObject storeID](v14, "storeID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v30 = v20;
      v31 = 2112;
      v32 = v13;
      _os_log_impl(&dword_212C78000, v19, OS_LOG_TYPE_ERROR, "Deleted jalisco items %@. Error: %@", buf, 0x16u);

    }
  }
  else
  {
    v21 = (void *)MEMORY[0x24BDD1540];
    v27 = *MEMORY[0x24BDD0FC8];
    v28 = CFSTR("Can't delete jalisco items. Nothing to delete.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("BLJaliscoDAAPClientError"), 1, v22);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    BLJaliscoLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v30 = v11;
      v31 = 2112;
      v32 = v13;
      v15 = "Fail to delete jalisco items %@. Error: %@";
      v16 = v14;
      v17 = 22;
LABEL_8:
      _os_log_impl(&dword_212C78000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
    }
  }
LABEL_15:

  v23 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 48));
  v24 = (void *)v23;
  if (v23)
    (*(void (**)(uint64_t, id))(v23 + 16))(v23, v13);

}

void sub_212CB23E8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestForNeedsImport:", *(unsigned __int8 *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  v9 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v3, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_212CB24C0;
  v7[3] = &unk_24CE8BCC8;
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

void sub_212CB24C0(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    +[BLJaliscoItem itemWithServerItem:](BLJaliscoItem, "itemWithServerItem:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v3);

  }
}

void sub_212CB25DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212CB25F4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "swqDSIDToDAAPServer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_212CB2710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212CB2728(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[1])
  {
    objc_msgSend(v2, "swqDSIDToDAAPServer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v8[0] = v4;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

    }
  }
}

void sub_212CB28B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212CB28C8(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "swqDSIDToDAAPServer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mutableCopy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = *(_QWORD **)(a1 + 32);
  if (v7[1])
  {
    objc_msgSend(v7, "swqDSIDToDAAPServer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v9 = v10;
    if (v10)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "removeObject:", v10);
      v9 = v10;
    }

  }
}

void sub_212CB2A5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212CB2A74(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v2)
  {
    v4[0] = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDBD1A8];
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
  if (v2)

}

void sub_212CB2C70(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  const char *v30;
  NSObject *v31;
  os_log_type_t v32;
  uint32_t v33;
  NSObject *v34;
  id v35;
  uint64_t v36;
  id v37;
  id v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  char v48;
  char v49;
  NSObject *v50;
  _QWORD block[4];
  id v52;
  id v53;
  uint64_t v54;
  id v55;
  id v56;
  id v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[5];
  id v64;
  uint64_t *v65;
  __int128 *p_buf;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint8_t v81[128];
  uint8_t v82[4];
  uint64_t v83;
  __int16 v84;
  void *v85;
  __int128 buf;
  uint64_t v87;
  uint64_t (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  id v90;
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setByAddingObjectsFromSet:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  BLJaliscoLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_212C78000, v4, OS_LOG_TYPE_DEFAULT, "Adding family member BLPurchaseDAAPServer objects for %@", (uint8_t *)&buf, 0xCu);
  }

  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v6 = *(id *)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v77, v92, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v78;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v78 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 48), "swqDSIDToDAAPServer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12 == 0;

        if (v13)
        {
          v14 = (void *)objc_msgSend(*(id *)(a1 + 48), "_newPurchaseDAAPServerWithDSID:", v10);
          objc_msgSend(*(id *)(a1 + 48), "swqDSIDToDAAPServer");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v10);

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v77, v92, 16);
    }
    while (v7);
  }

  BLJaliscoLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = *(_QWORD *)(a1 + 56);
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v17;
    _os_log_impl(&dword_212C78000, v16, OS_LOG_TYPE_DEFAULT, "Removing family member BLPurchaseDAAPServer objects for %@", (uint8_t *)&buf, 0xCu);
  }

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v18 = *(id *)(a1 + 56);
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v73, v91, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v74;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v74 != v20)
          objc_enumerationMutation(v18);
        v22 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * j);
        objc_msgSend(*(id *)(a1 + 48), "swqDSIDToDAAPServer");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setObject:forKeyedSubscript:", 0, v22);

      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v73, v91, 16);
    }
    while (v19);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v87 = 0x3032000000;
  v88 = sub_212CADC14;
  v89 = sub_212CADC24;
  v90 = 0;
  v67 = 0;
  v68 = &v67;
  v69 = 0x3032000000;
  v70 = sub_212CADC14;
  v71 = sub_212CADC24;
  v72 = 0;
  v24 = *(_QWORD *)(a1 + 48);
  v25 = MEMORY[0x24BDAC760];
  v26 = *(void **)(v24 + 136);
  v63[0] = MEMORY[0x24BDAC760];
  v63[1] = 3221225472;
  v63[2] = sub_212CB33C8;
  v63[3] = &unk_24CE8BF70;
  v63[4] = v24;
  v27 = v3;
  v64 = v27;
  v65 = &v67;
  p_buf = &buf;
  objc_msgSend(v26, "performBlockAndWait:", v63);
  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    BLJaliscoLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
LABEL_25:

      goto LABEL_26;
    }
    v29 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_DWORD *)v82 = 138412546;
    v83 = (uint64_t)v27;
    v84 = 2112;
    v85 = v29;
    v30 = "_processFamilyCircle: Failed to fetch jalisco objects excluding current family members: %@,  %@";
    v31 = v28;
    v32 = OS_LOG_TYPE_ERROR;
    v33 = 22;
LABEL_24:
    _os_log_impl(&dword_212C78000, v31, v32, v30, v82, v33);
    goto LABEL_25;
  }
  if (!objc_msgSend((id)v68[5], "count"))
  {
    BLJaliscoLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      goto LABEL_25;
    *(_WORD *)v82 = 0;
    v30 = "_processFamilyCircle: No items up for deletion";
    v31 = v28;
    v32 = OS_LOG_TYPE_INFO;
    v33 = 2;
    goto LABEL_24;
  }
  BLJaliscoLog();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
  {
    v40 = objc_msgSend((id)v68[5], "count");
    objc_msgSend((id)v68[5], "valueForKey:", CFSTR("storeID"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "bu_arrayByRemovingDuplicates");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v82 = 134218242;
    v83 = v40;
    v84 = 2112;
    v85 = v42;
    _os_log_impl(&dword_212C78000, v39, OS_LOG_TYPE_DEBUG, "_processFamilyCircle: Deleting %lu jalisco objects that are no longer accessible: %@", v82, 0x16u);

  }
  v62 = 0u;
  v60 = 0u;
  v61 = 0u;
  v59 = 0u;
  v43 = (id)v68[5];
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v59, v81, 16);
  if (v44)
  {
    v45 = *(_QWORD *)v60;
    do
    {
      for (k = 0; k != v44; ++k)
      {
        if (*(_QWORD *)v60 != v45)
          objc_enumerationMutation(v43);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 136), "deleteObject:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * k));
      }
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v59, v81, 16);
    }
    while (v44);
  }

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 136), "hasChanges"))
  {
    v47 = *(void **)(*(_QWORD *)(a1 + 48) + 136);
    v58 = 0;
    v48 = objc_msgSend(v47, "save:", &v58);
    v28 = v58;
    if (v28)
      v49 = v48;
    else
      v49 = 1;
    if ((v49 & 1) == 0)
    {
      BLJaliscoLog();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v82 = 138412290;
        v83 = (uint64_t)v28;
        _os_log_impl(&dword_212C78000, v50, OS_LOG_TYPE_ERROR, "Moc Save Error:  %@", v82, 0xCu);
      }

    }
    goto LABEL_25;
  }
LABEL_26:
  dispatch_get_global_queue(0, 0);
  v34 = objc_claimAutoreleasedReturnValue();
  block[0] = v25;
  block[1] = 3221225472;
  block[2] = sub_212CB3484;
  block[3] = &unk_24CE8BF98;
  v52 = *(id *)(a1 + 32);
  v35 = *(id *)(a1 + 56);
  v36 = *(_QWORD *)(a1 + 48);
  v53 = v35;
  v54 = v36;
  v37 = *(id *)(a1 + 64);
  v56 = 0;
  v57 = v37;
  v55 = v27;
  v38 = v27;
  dispatch_async(v34, block);

  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&buf, 8);

}

void sub_212CB3374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&STACK[0x230], 8);
  _Unwind_Resume(a1);
}

void sub_212CB33C8(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "_fetchRequestForNotInStoreAccountIDs:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v3, "executeFetchRequest:error:", v2, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  BUDynamicCast();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void sub_212CB3484(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD, _QWORD);
  uint64_t v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "count") || *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "clientDetectedPredicateChange:", *(_QWORD *)(a1 + 48));

  }
  v3 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 72));
  if (v3)
  {
    if (*(_QWORD *)(a1 + 64))
      v4 = *(_QWORD *)(a1 + 64);
    else
      v4 = MEMORY[0x24BDBD1A8];
    v5 = v3;
    v3[2](v3, *(_QWORD *)(a1 + 56), v4);
    v3 = (void (**)(_QWORD, _QWORD, _QWORD))v5;
  }

}

void sub_212CB3564(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD block[7];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[2] = sub_212CB3754;
  block[3] = &unk_24CE8BFE8;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(NSObject **)(v2 + 112);
  block[1] = 3221225472;
  block[4] = v2;
  block[5] = &v16;
  block[6] = v3;
  dispatch_sync(v4, block);
  v5 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v5 + 32) && *((_BYTE *)v17 + 24))
  {
    objc_msgSend((id)v5, "willChangeValueForKey:", CFSTR("initiallyLoadingJalisco"));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = 1;
    objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("initiallyLoadingJalisco"));
    v5 = *(_QWORD *)(a1 + 32);
  }
  v6 = *(void **)(v5 + 16);
  if (v6 && *((_BYTE *)v17 + 24))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v20, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v7);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v20, 16);
      }
      while (v8);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects", (_QWORD)v11);
  }
  _Block_object_dispose(&v16, 8);
}

void sub_212CB3728(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  _Unwind_Resume(exception_object);
}

_QWORD *sub_212CB3754(_QWORD *result)
{
  *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = *(_QWORD *)(result[4] + 96) == result[6];
  if (*(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24))
    *(_QWORD *)(result[4] + 96) = 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

void sub_212CB3D18(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "swqDSIDToDAAPServer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

}

void sub_212CB3D48(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newPurchaseDAAPServerWithDSID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "setObject:forKeyedSubscript:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
    v4 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v4 + 88) == 0x7FFFFFFFFFFFFFFFLL)
      *(_QWORD *)(v4 + 88) = 0x8000000000000000;
  }
}

void sub_212CB4044(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  BLURLRequestEncoder *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  __CFString *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "createDaapURL:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[BLURLRequestEncoder initWithBag:withURLRequest:]([BLURLRequestEncoder alloc], "initWithBag:withURLRequest:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v6 = objc_msgSend(*(id *)(a1 + 32), "requestMethod");
    objc_msgSend(*(id *)(a1 + 32), "body");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSURLRequestEncoder requestWithMethod:URL:parameters:](v5, "requestWithMethod:URL:parameters:", v6, v4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = 0;
    objc_msgSend(v8, "resultWithError:", &v28);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v28;
    v11 = v10;
    if (v9)
    {
      if (!v10)
      {
        v19 = 0;
LABEL_16:

        goto LABEL_17;
      }
      v27 = v8;
      v29 = CFSTR("Underlying Error Description");
      objc_msgSend(v10, "description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(*(id *)(a1 + 32), "description");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("AMS error with creating request in %@"), v15);
    }
    else
    {
      BLJaliscoLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v34 = v21;
        v35 = 2112;
        v36 = v11;
        _os_log_impl(&dword_212C78000, v20, OS_LOG_TYPE_ERROR, "Error with BLURLRequestEncoder creating request %@ %@", buf, 0x16u);
      }
      v27 = v8;

      if (v11)
      {
        v31 = CFSTR("Underlying Error Description");
        objc_msgSend(v11, "description");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v22;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v13 = 0;
      }
      v23 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(*(id *)(a1 + 32), "description");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("AMS error - nil request %@"), v15);
    }
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    BLErrorWithUserInfo(3, 0, v24, v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v27;
    goto LABEL_16;
  }
  BLJaliscoLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v17 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v34 = v17;
    _os_log_impl(&dword_212C78000, v16, OS_LOG_TYPE_ERROR, "%@: No URL to configure with.", buf, 0xCu);
  }

  v18 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(*(id *)(a1 + 32), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("AMS bag error - no url for request %@"), v4);
  v5 = (BLURLRequestEncoder *)objc_claimAutoreleasedReturnValue();
  BLErrorWithUserInfo(3, 0, (const __CFString *)v5, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
LABEL_17:

  v25 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 40));
  v26 = (void *)v25;
  if (v25)
    (*(void (**)(uint64_t, void *, void *))(v25 + 16))(v25, v9, v19);

}

void sub_212CB44B0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    +[BLPurchaseDAAPServer sharedSession](BLPurchaseDAAPServer, "sharedSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = sub_212CB4648;
    v16 = &unk_24CE8C038;
    v17 = v5;
    v18 = *(id *)(a1 + 40);
    objc_msgSend(v7, "dataTaskWithRequest:completionHandler:", v17, &v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "resume", v13, v14, v15, v16);
    v9 = v17;
  }
  else
  {
    BLJaliscoLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v20 = v11;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_212C78000, v10, OS_LOG_TYPE_ERROR, "%@: Cannot execute request because request is nil %@", buf, 0x16u);
    }

    v12 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 40));
    v9 = (void *)v12;
    if (v12)
      (*(void (**)(uint64_t, _QWORD, id))(v12 + 16))(v12, 0, v6);
  }

}

void sub_212CB4648(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void (*v11)(void);
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    BLJaliscoLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v13 = 138412546;
      v14 = v8;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_212C78000, v7, OS_LOG_TYPE_ERROR, "daapURL request failed - Request %@, error:  %@", (uint8_t *)&v13, 0x16u);
    }

    v9 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 40));
    v10 = (void *)v9;
    if (v9)
    {
      v11 = *(void (**)(void))(v9 + 16);
LABEL_8:
      v11();
    }
  }
  else
  {
    v12 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 40));
    v10 = (void *)v12;
    if (v12)
    {
      v11 = *(void (**)(void))(v12 + 16);
      goto LABEL_8;
    }
  }

}

void sub_212CB48B4(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 40));
    if (v3)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v3)[2](v3, v4);

    }
LABEL_9:

    goto LABEL_10;
  }
  if (!*(_BYTE *)(a1 + 48)
    || (objc_msgSend(MEMORY[0x24BE0FBE8], "sharedProvider"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isUserSignedInToiTunes"),
        v5,
        !v6))
  {
    v9 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 40));
    v3 = (void (**)(_QWORD, _QWORD))v9;
    if (v9)
      (*(void (**)(uint64_t, _QWORD))(v9 + 16))(v9, 0);
    goto LABEL_9;
  }
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 8);
  *(_QWORD *)(v7 + 8) = 0;

  objc_msgSend(*(id *)(a1 + 32), "_URLWithRetry:completion:", 0, *(_QWORD *)(a1 + 40));
LABEL_10:

}

void sub_212CB4A58(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  if (v8)
  {
    objc_msgSend(CFSTR("iBooks-"), "stringByAppendingString:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(v8, "objectForKey:", *(_QWORD *)(a1 + 32));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v5 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 40));
    v6 = (void *)v5;
    if (v5)
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v4);

  }
  else
  {
    v7 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 40));
    v4 = (void *)v7;
    if (v7)
      (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
  }

}

void sub_212CB4BDC(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  if (!v6)
  {
    BLJaliscoLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412546;
      v12 = CFSTR("purchase-daap");
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_212C78000, v8, OS_LOG_TYPE_ERROR, "Error fetching %@:  %@", (uint8_t *)&v11, 0x16u);
    }

  }
  v9 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 32));
  v10 = (void *)v9;
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v6);

}

uint64_t BLBookTypeFromPathExtension(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "lowercaseString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(CFSTR("pdf"), "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(CFSTR("epub"), "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 0;
  }
  else if (objc_msgSend(CFSTR("ibooks"), "isEqualToString:", v1))
  {
    v2 = 1;
  }
  else
  {
    v2 = 3;
  }

  return v2;
}

void sub_212CB62C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_212CB62F0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_212CB6300(uint64_t a1)
{

}

void sub_212CB6308(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_212CB67D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_212CB6810(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "writeToFile:atomically:", v2, 1);

  return v3;
}

void sub_212CB6854(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (*(uint64_t (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void sub_212CB68A8(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  id obj;

  v3 = (objc_class *)MEMORY[0x24BDD1580];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v6 + 40);
  objc_msgSend(v5, "removeItemAtURL:error:", v4, &obj);

  objc_storeStrong((id *)(v6 + 40), obj);
}

const __CFString *BLPathExtensionFromBookType(unint64_t a1)
{
  if (a1 > 2)
    return &stru_24CE8D258;
  else
    return off_24CE8C230[a1];
}

void sub_212CB7568()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeoutIntervalForRequest:", 90.0);
  objc_msgSend(v3, "setTimeoutIntervalForResource:", 90.0);
  +[BLPurchaseDAAPServer _clientIdentifier](BLPurchaseDAAPServer, "_clientIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "set_sourceApplicationBundleIdentifier:", v0);

  v1 = objc_msgSend(objc_alloc(MEMORY[0x24BE08410]), "initWithConfiguration:", v3);
  v2 = (void *)qword_253DB1FA0;
  qword_253DB1FA0 = v1;

}

void sub_212CB760C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_212CB76D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_212CB76FC(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (v5)
  {
    objc_msgSend(CFSTR("iBooks-"), "stringByAppendingString:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 32));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void sub_212CB77A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_212CB7860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_212CB7878(uint64_t a1, void *a2)
{
  char isKindOfClass;
  uint64_t v4;
  __n128 v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = *(_QWORD *)(a1 + 32);
  v5.n128_u64[0] = 0;
  if ((isKindOfClass & 1) != 0)
    objc_msgSend(v6, "doubleValue", 0.0);
  (*(void (**)(uint64_t, __n128))(v4 + 16))(v4, v5);

}

void sub_212CB78E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_212CB7974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_212CB798C(uint64_t a1, void *a2)
{
  char isKindOfClass;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = *(_QWORD *)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
    v5 = objc_msgSend(v6, "BOOLValue");
  else
    v5 = 1;
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v5);

}

void sub_212CB79FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_212CB7A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

uint64_t sub_212CB7AA8(uint64_t a1, double a2)
{
  if (a2 <= 0.0)
    return objc_msgSend(*(id *)(a1 + 32), "timeIntervalFromDAAPBagKey:completion:", CFSTR("update-polling-frequency-secs"), *(_QWORD *)(a1 + 40));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_212CB7B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_212CB7B68(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v4;
  else
    v3 = 0;
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v3);

}

void sub_212CB7BCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_212CB7C60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

uint64_t sub_212CB7C78(uint64_t a1, double a2)
{
  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a2 * 60.0);
}

uint64_t sub_212CB7CE4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setIsServerSetup:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setIsServerSetupPending:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_setSessionID:", 0);
}

void sub_212CB7DDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_212CB7E00(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    BLJaliscoLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412546;
      v10 = CFSTR("purchase-daap");
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_212C78000, v8, OS_LOG_TYPE_ERROR, "Error fetching %@:  %@", (uint8_t *)&v9, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void sub_212CB7F00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_212CB8378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_212CB8604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_212CB8648(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  BLDAAPArtRequest *v5;
  void *v6;
  void *v7;
  BLDAAPArtRequest *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  id v18;
  char v19;
  uint8_t buf[16];

  if (a2)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isServerSetup"))
    {
      objc_msgSend(*(id *)(a1 + 32), "bagDatabaseID");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        objc_msgSend(*(id *)(a1 + 32), "_dataForArtRequest:", *(unsigned __int8 *)(a1 + 56));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4)
        {
          v5 = [BLDAAPArtRequest alloc];
          objc_msgSend(*(id *)(a1 + 32), "dsid");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "bagDatabaseID");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = -[BLDAAPArtRequest initWithDSID:databaseID:body:](v5, "initWithDSID:databaseID:body:", v6, v7, v4);

          v16[0] = MEMORY[0x24BDAC760];
          v16[1] = 3221225472;
          v16[2] = sub_212CB8908;
          v16[3] = &unk_24CE8C3B0;
          objc_copyWeak(&v18, (id *)(a1 + 48));
          v19 = *(_BYTE *)(a1 + 56);
          v9 = *(id *)(a1 + 40);
          v16[4] = *(_QWORD *)(a1 + 32);
          v17 = v9;
          -[BLDAAPURLRequest executeWithCompletionHandler:](v8, "executeWithCompletionHandler:", v16);

          objc_destroyWeak(&v18);
        }
        else
        {
          v15 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 40));
          v8 = (BLDAAPArtRequest *)v15;
          if (v15)
            (*(void (**)(uint64_t))(v15 + 16))(v15);
        }

        goto LABEL_22;
      }
    }
  }
  else
  {
    BLJaliscoLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212C78000, v10, OS_LOG_TYPE_DEBUG, "Art Request: will not make request", buf, 2u);
    }

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isServerSetup") & 1) == 0)
  {
    BLJaliscoLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212C78000, v11, OS_LOG_TYPE_DEBUG, "Art Request: Server isn't setup. Can't do this right now.", buf, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "bagDatabaseID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    BLJaliscoLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212C78000, v13, OS_LOG_TYPE_DEBUG, "Art Request: Can't make request. No DB ID.", buf, 2u);
    }

  }
  v14 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 40));
  v4 = (void *)v14;
  if (v14)
    (*(void (**)(uint64_t))(v14 + 16))(v14);
LABEL_22:

}

void sub_212CB88B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_212CB8908(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  char v17;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = (void *)MEMORY[0x2199A4330]();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_212CB8A38;
  v12[3] = &unk_24CE8C388;
  v12[4] = WeakRetained;
  v17 = *(_BYTE *)(a1 + 56);
  v9 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v5;
  v15 = *(_QWORD *)(a1 + 32);
  v16 = v9;
  v10 = v5;
  v11 = v6;
  objc_msgSend(WeakRetained, "_preProcessResponse:error:responseBlock:", v10, v11, v12);

  objc_autoreleasePoolPop(v8);
}

void sub_212CB8A00(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_212CB8A38(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD block[5];
  id v22;
  NSObject *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  switch(a2)
  {
    case 2:
      BLJaliscoLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 32), "dsid");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v25 = v6;
        _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_INFO, "Art Request: dsid: %@ succeeded", buf, 0xCu);

      }
      v7 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 48), "data");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_processResponse:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v10, "newManagedObjectContext");

        v12 = (void *)MEMORY[0x2199A4330]();
        v13 = *(_QWORD *)(a1 + 56);
        v14 = *(NSObject **)(v13 + 64);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = sub_212CB8D60;
        block[3] = &unk_24CE8C360;
        block[4] = v13;
        v22 = v11;
        v15 = v9;
        v23 = v15;
        v16 = v11;
        dispatch_async(v14, block);

        objc_autoreleasePoolPop(v12);
      }
      else
      {
        v15 = 0;
      }
      goto LABEL_14;
    case 1:
      BLJaliscoLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "dsid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        v25 = v17;
        v26 = 2112;
        v27 = v18;
        _os_log_impl(&dword_212C78000, v15, OS_LOG_TYPE_ERROR, "Art Request: %@, Error getting response:  %@", buf, 0x16u);

      }
LABEL_14:

      break;
    case 0:
      BLJaliscoLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 32), "dsid");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v25 = v4;
        _os_log_impl(&dword_212C78000, v3, OS_LOG_TYPE_DEBUG, "Art Request: dsid: %@, RETRY", buf, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "updateItemImageURLsIgnoringCache:completion:", *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 64));
      return;
  }
  v19 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 64));
  v20 = (void *)v19;
  if (v19)
    (*(void (**)(uint64_t))(v19 + 16))(v19);

}

void sub_212CB8D04(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_212CB8D60(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  char v32;
  NSObject *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id obj;
  uint64_t v40;
  void *v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  uint8_t buf[4];
  id v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  _QWORD v54[3];

  v54[1] = *MEMORY[0x24BDAC8D0];
  +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dsid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "itemsFetchRequestForDSIDs:", v3);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 40);
  v48 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v37, &v48);
  v5 = objc_claimAutoreleasedReturnValue();
  v35 = v48;
  v36 = (void *)v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 48), "objectForKey:", CFSTR("dmap.listing"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(v36, "valueForKey:", CFSTR("cloudID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithObjects:forKeys:", v36, v7);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v8 = v34;
    obj = v8;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    if (v9)
    {
      v10 = 0;
      v40 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v45 != v40)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "itemID");
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v12, "objectForKey:", CFSTR("full-token"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectForKey:", CFSTR("full-url"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v16, "length") && objc_msgSend(v17, "length"))
            {
              objc_msgSend(v15, "artworkTokenCode");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (v18)
              {
                objc_msgSend(v15, "artworkTokenCode");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v19, "isEqualToString:", v16);

                if ((v20 & 1) == 0)
                {
                  +[BLJaliscoDAAPClient sharedClient](BLJaliscoDAAPClient, "sharedClient");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "imageManagerDelegate");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "storeID");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v43 = 0;
                  v24 = objc_msgSend(v22, "removeImageForStoreID:error:", v23, &v43);
                  v25 = v43;

                  if ((v24 & 1) == 0)
                  {
                    BLJaliscoLog();
                    v26 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      v50 = v25;
                      _os_log_impl(&dword_212C78000, v26, OS_LOG_TYPE_ERROR, "ERROR removing time-bombed artwork:  %@", buf, 0xCu);
                    }

                  }
                }
              }
              objc_msgSend(v15, "setArtworkTokenCode:", v16);
              objc_msgSend(v15, "setArtworkURLString:", v17);
              v10 = 1;
            }
            else
            {
              BLJaliscoLog();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v15, "storeID");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "additionalInfo");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v50 = v28;
                v51 = 2112;
                v52 = v29;
                _os_log_impl(&dword_212C78000, v27, OS_LOG_TYPE_DEBUG, "Incomplete artwork response for %@ -- %@", buf, 0x16u);

              }
            }

          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
      }
      while (v9);

      if ((v10 & 1) == 0)
        goto LABEL_30;
      v30 = *(void **)(a1 + 32);
      v31 = *(_QWORD *)(a1 + 40);
      v42 = 0;
      v32 = objc_msgSend(v30, "_saveInMoc:error:", v31, &v42);
      v8 = v42;
      if ((v32 & 1) == 0)
      {
        BLJaliscoLog();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v50 = v8;
          _os_log_impl(&dword_212C78000, v33, OS_LOG_TYPE_ERROR, "Error saving artwork state %@", buf, 0xCu);
        }

      }
    }

LABEL_30:
  }

}

void sub_212CB9244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  void *v22;

  _Unwind_Resume(a1);
}

void sub_212CB9704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_212CB9974(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_212CB9B38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_212CB9B88(id *a1, int a2)
{
  void *v3;
  void *v4;
  id WeakRetained;
  BLDAAPHideItemsRequest *v6;
  void *v7;
  void *v8;
  BLDAAPHideItemsRequest *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[16];

  if (a2)
  {
    if (objc_msgSend(a1[4], "isServerSetup"))
    {
      objc_msgSend(a1[4], "bagDatabaseID");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        objc_msgSend(a1[4], "_dataForHideItemsRequestWithStoreIDs:", a1[5]);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4)
        {
          WeakRetained = objc_loadWeakRetained(a1 + 7);
          v6 = [BLDAAPHideItemsRequest alloc];
          objc_msgSend(WeakRetained, "dsid");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "bagDatabaseID");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = -[BLDAAPHideItemsRequest initWithDSID:databaseID:body:](v6, "initWithDSID:databaseID:body:", v7, v8, v4);

          v17[0] = MEMORY[0x24BDAC760];
          v17[1] = 3221225472;
          v17[2] = sub_212CB9E98;
          v17[3] = &unk_24CE8C428;
          v17[4] = WeakRetained;
          v18 = a1[5];
          v19 = a1[6];
          -[BLDAAPURLRequest executeWithCompletionHandler:](v9, "executeWithCompletionHandler:", v17);

        }
        else
        {
          BLJaliscoLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_212C78000, v15, OS_LOG_TYPE_DEBUG, "HideItems: Can't make request. Can't create request body", buf, 2u);
          }

          v16 = MEMORY[0x2199A44E0](a1[6]);
          WeakRetained = (id)v16;
          if (v16)
            (*(void (**)(uint64_t, _QWORD))(v16 + 16))(v16, 0);
        }

        goto LABEL_24;
      }
    }
  }
  else
  {
    BLJaliscoLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212C78000, v10, OS_LOG_TYPE_DEBUG, "HideItems: will not make request", buf, 2u);
    }

  }
  if ((objc_msgSend(a1[4], "isServerSetup") & 1) == 0)
  {
    BLJaliscoLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212C78000, v11, OS_LOG_TYPE_DEBUG, "HideItems: Server isn't setup. Can't do this right now.", buf, 2u);
    }

  }
  objc_msgSend(a1[4], "bagDatabaseID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    BLJaliscoLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212C78000, v13, OS_LOG_TYPE_DEBUG, "HideItems: Can't make request. No DB ID.", buf, 2u);
    }

  }
  v14 = MEMORY[0x2199A44E0](a1[6]);
  v4 = (void *)v14;
  if (v14)
    (*(void (**)(uint64_t, _QWORD))(v14 + 16))(v14, 0);
LABEL_24:

}

void sub_212CB9E40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_212CB9E98(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_212CB9FA4;
  v11[3] = &unk_24CE8C400;
  v7 = *(void **)(a1 + 40);
  v12 = *(id *)(a1 + 32);
  v13 = v7;
  v8 = *(id *)(a1 + 48);
  v15 = v5;
  v16 = v8;
  v14 = v6;
  v9 = v5;
  v10 = v6;
  objc_msgSend(v12, "_preProcessResponse:error:responseBlock:", v9, v10, v11);

}

void sub_212CB9F70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18)
{
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_212CB9FA4(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  char v33;
  id v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  NSObject *oslog;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  void *v55;
  uint8_t v56[128];
  uint8_t buf[4];
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  switch(a2)
  {
    case 2:
      v4 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 56), "data");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_processResponse:", v5);
      v6 = objc_claimAutoreleasedReturnValue();

      oslog = v6;
      objc_msgSend(*(id *)(a1 + 32), "_updateVersionAfterHideRequest:", v6);
      -[NSObject objectForKey:](v6, "objectForKey:", CFSTR("dmap.listing"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_opt_new();
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v9 = v7;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v50, v56, 16, v7);
      if (v10)
      {
        v11 = *(_QWORD *)v51;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v51 != v11)
              objc_enumerationMutation(v9);
            v13 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
            objc_msgSend(v13, "additionalInfo");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKey:", CFSTR("dmap.status"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v15, "unsignedIntegerValue") == 200)
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v13, "itemID"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "addObject:", v16);

            }
          }
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
        }
        while (v10);
      }

      +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "newManagedObjectContext");

      v3 = (void *)objc_opt_new();
      if (objc_msgSend(v8, "count"))
      {
        BLJaliscoLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v58 = v8;
          _os_log_impl(&dword_212C78000, v19, OS_LOG_TYPE_DEFAULT, "HideItems: Finding corresponding jalisco items with cloudIDs(%@)", buf, 0xCu);
        }

        +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "dsid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v21;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v55, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "fetchRequestForAllCloudIDs:dsids:", v8, v22);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        v49 = 0;
        objc_msgSend(v18, "executeFetchRequest:error:", v41, &v49);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v49;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v24 = v23;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
        if (v25)
        {
          v26 = *(_QWORD *)v46;
          v27 = MEMORY[0x24BDBD1C8];
          do
          {
            for (j = 0; j != v25; ++j)
            {
              if (*(_QWORD *)v46 != v26)
                objc_enumerationMutation(v24);
              v29 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
              objc_msgSend(v29, "setIsHidden:", v27);
              objc_msgSend(v29, "storeID");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if (v30)
                objc_msgSend(v3, "addObject:", v30);

            }
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
          }
          while (v25);
        }

        if (objc_msgSend(v18, "hasChanges"))
        {
          BLJaliscoLog();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v58 = v3;
            _os_log_impl(&dword_212C78000, v31, OS_LOG_TYPE_DEFAULT, "HideItems: Hiding items locally in database:(%@)", buf, 0xCu);
          }

          v32 = *(void **)(a1 + 32);
          v44 = 0;
          v33 = objc_msgSend(v32, "_saveInMoc:error:", v18, &v44);
          v34 = v44;
          if ((v33 & 1) == 0)
          {
            BLJaliscoLog();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v58 = v34;
              _os_log_impl(&dword_212C78000, v35, OS_LOG_TYPE_ERROR, "Error saving items after hiding.  %@", buf, 0xCu);
            }

          }
        }

      }
      BLJaliscoLog();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v3;
        _os_log_impl(&dword_212C78000, v36, OS_LOG_TYPE_DEFAULT, "HideItems: success %@", buf, 0xCu);
      }

      goto LABEL_44;
    case 1:
      BLJaliscoLog();
      oslog = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        v37 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        v58 = v37;
        _os_log_impl(&dword_212C78000, oslog, OS_LOG_TYPE_ERROR, "HideItems: Error getting response:  %@", buf, 0xCu);
      }
      v3 = 0;
LABEL_44:

      goto LABEL_45;
    case 0:
      BLJaliscoLog();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_212C78000, v2, OS_LOG_TYPE_DEBUG, "HideItems: retry", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "hideItemsWithStoreIDs:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
      break;
  }
  v3 = 0;
LABEL_45:
  v38 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 64));
  v39 = (void *)v38;
  if (v38)
    (*(void (**)(uint64_t, void *))(v38 + 16))(v38, v3);

}

void sub_212CBA5BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_212CBA7AC(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void (**v13)(id, uint64_t);
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  uint64_t v17;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isServerSetup");
  v3 = *(void **)(a1 + 48);
  if (v2)
  {
    v13 = (void (**)(id, uint64_t))MEMORY[0x2199A44E0](v3);
    if (v13)
      v13[2](v13, 1);

  }
  else
  {
    if (v3)
    {
      v4 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      if (!v4)
      {
        v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 1);
        v6 = *(_QWORD *)(a1 + 32);
        v7 = *(void **)(v6 + 40);
        *(_QWORD *)(v6 + 40) = v5;

        v4 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
        v3 = *(void **)(a1 + 48);
      }
      v8 = (void *)objc_msgSend(v3, "copy");
      objc_msgSend(v4, "addObject:", v8);

    }
    if ((objc_msgSend(*(id *)(a1 + 32), "isServerSetupPending") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "setIsServerSetupPending:", 1);
      v9 = *(_QWORD *)(a1 + 56);
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = sub_212CBA920;
      v14[3] = &unk_24CE8C4F0;
      v10 = *(void **)(a1 + 32);
      v11 = *(id *)(a1 + 40);
      v12 = *(_QWORD *)(a1 + 32);
      v15 = v11;
      v16 = v12;
      v17 = *(_QWORD *)(a1 + 56);
      objc_msgSend(v10, "_configureWithReason:completion:", v9, v14);

    }
  }
}

void sub_212CBA8F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_212CBA920(int8x16_t *a1, char a2)
{
  int8x16_t v2;
  _QWORD block[4];
  int8x16_t v4;
  uint64_t v5;
  char v6;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212CBA99C;
  block[3] = &unk_24CE8C4C8;
  v6 = a2;
  v5 = a1[3].i64[0];
  v2 = a1[2];
  v4 = vextq_s8(v2, v2, 8uLL);
  dispatch_async((dispatch_queue_t)(id)v2.i64[0], block);

}

void sub_212CBA99C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  if (*(_BYTE *)(a1 + 56))
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = sub_212CBAA90;
    v8[3] = &unk_24CE8C4A0;
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 48);
    v4 = *(id *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 32);
    v9 = v4;
    v10 = v5;
    objc_msgSend(v2, "_loginWithReason:completion:", v3, v8);

  }
  else
  {
    BLJaliscoLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_212C78000, v6, OS_LOG_TYPE_ERROR, "DAAP Server-Info failed.", v7, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_sendSetupConfigurationHandlersWithSuccess:", 0);
  }
}

void sub_212CBAA7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{

  _Unwind_Resume(a1);
}

void sub_212CBAA90(uint64_t a1, char a2)
{
  NSObject *v2;
  _QWORD v3[5];
  char v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = sub_212CBAAEC;
  v3[3] = &unk_24CE8C478;
  v4 = a2;
  v2 = *(NSObject **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  dispatch_async(v2, v3);
}

uint64_t sub_212CBAAEC(uint64_t a1)
{
  int v2;
  _BOOL4 v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(_BYTE *)(a1 + 40) != 0;
  BLJaliscoLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "dsid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_INFO, "DAAP Login success for dsid: %@. Kicking off artwork fetch..", (uint8_t *)&v9, 0xCu);

    }
    +[BLJaliscoDAAPClient sharedClient](BLJaliscoDAAPClient, "sharedClient");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject imageManagerDelegate](v5, "imageManagerDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchAllImageAssetsIgnoringLocalCache:", 0);

  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_ERROR, "DAAP Login failed.", (uint8_t *)&v9, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_sendSetupConfigurationHandlersWithSuccess:", v2 != 0);
}

void sub_212CBAC34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_212CBADE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_212CBAE08(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  char v21;
  _QWORD v22[5];
  NSObject *v23;
  _QWORD v24[4];
  NSObject *v25;
  _QWORD *v26;
  _QWORD v27[4];
  NSObject *v28;
  _QWORD *v29;
  _QWORD v30[4];
  NSObject *v31;
  _QWORD *v32;
  _QWORD v33[4];
  _QWORD v34[3];
  char v35;
  _QWORD v36[4];

  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v36[3] = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v35 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v33[3] = 0;
  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  v3 = MEMORY[0x24BDAC760];
  v4 = *(void **)(a1 + 32);
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = sub_212CBB0D4;
  v30[3] = &unk_24CE8C540;
  v32 = v34;
  v5 = v2;
  v31 = v5;
  objc_msgSend(v4, "appRefreshesOnLaunchWithCompletionHandler:", v30);
  dispatch_group_enter(v5);
  v6 = *(void **)(a1 + 32);
  v27[0] = v3;
  v27[1] = 3221225472;
  v27[2] = sub_212CBB0E8;
  v27[3] = &unk_24CE8C568;
  v29 = v36;
  v7 = v5;
  v28 = v7;
  objc_msgSend(v6, "forcedRefreshFrequencyWithCompletionHandler:", v27);
  dispatch_group_enter(v7);
  v8 = *(void **)(a1 + 32);
  v24[0] = v3;
  v24[1] = 3221225472;
  v24[2] = sub_212CBB0FC;
  v24[3] = &unk_24CE8C568;
  v26 = v33;
  v9 = v7;
  v25 = v9;
  objc_msgSend(v8, "pollingFrequencyWithCompletionHandler:", v24);
  dispatch_group_enter(v9);
  v10 = *(void **)(a1 + 32);
  v22[0] = v3;
  v22[1] = 3221225472;
  v22[2] = sub_212CBB110;
  v22[3] = &unk_24CE8C590;
  v22[4] = v10;
  v11 = v9;
  v23 = v11;
  objc_msgSend(v10, "databaseIDWithCompletionHandler:", v22);
  v14[0] = v3;
  v14[2] = sub_212CBB13C;
  v14[3] = &unk_24CE8C6F8;
  v12 = *(NSObject **)(a1 + 40);
  v14[4] = *(_QWORD *)(a1 + 32);
  v17 = v33;
  v18 = v36;
  v19 = v34;
  v13 = *(void **)(a1 + 48);
  v20 = *(_QWORD *)(a1 + 56);
  v21 = *(_BYTE *)(a1 + 64);
  v14[1] = 3221225472;
  v16 = v13;
  v15 = *(id *)(a1 + 40);
  dispatch_group_notify(v11, v12, v14);

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);
}

void sub_212CBB068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,void *a37)
{
  void *v37;
  uint64_t v38;

  _Block_object_dispose((const void *)(v38 - 176), 8);
  _Block_object_dispose((const void *)(v38 - 144), 8);
  _Block_object_dispose((const void *)(v38 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_212CBB0D4(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_212CBB0E8(uint64_t a1, double a2)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_212CBB0FC(uint64_t a1, double a2)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_212CBB110(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setBagDatabaseID:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_212CBB13C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  char v33;
  char v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "dsid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("kJaliscoDAAPClientLastSuccessfulFullUpdateDateDictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "dateByAddingTimeInterval:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (!v7
    || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)
    && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) == 7)
  {
    v10 = 1;
    if (!v8)
      goto LABEL_9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "compare:", v11) == -1;

    if (!v9)
      goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "compare:", v12);

  if (v13 != -1)
  {
    v14 = 0;
    goto LABEL_10;
  }
LABEL_9:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 5;
  v14 = 1;
LABEL_10:
  BLJaliscoLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "dsid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v36 = v6;
    v37 = 2112;
    v38 = v7;
    v39 = 2112;
    v40 = v9;
    v41 = 2112;
    v42 = v16;
    _os_log_impl(&dword_212C78000, v15, OS_LOG_TYPE_DEFAULT, "1. [BLPurchaseDAAPServer] FetchItemsPolitely: dsid:%@ lastFullRefreshedAt:%@ nextUpdateAt:%@ nextFullRefreshAt:%@", buf, 0x2Au);

  }
  if (*(_BYTE *)(a1 + 88))
    v17 = v10;
  else
    v17 = 1;
  if (((v14 | v17) & 1) != 0)
  {
    v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    v20 = *(void **)(a1 + 32);
    v19 = *(void **)(a1 + 40);
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = sub_212CBB590;
    v27[3] = &unk_24CE8C6D0;
    v21 = v19;
    v22 = *(_QWORD *)(a1 + 32);
    v28 = v21;
    v29 = v22;
    v32 = *(_QWORD *)(a1 + 80);
    v33 = v14;
    v34 = *(_BYTE *)(a1 + 88);
    v31 = *(id *)(a1 + 48);
    v30 = v2;
    objc_msgSend(v20, "setupWithReason:queue:completion:", v18, v21, v27);

    v23 = v28;
  }
  else
  {
    BLJaliscoLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v36 = v7;
      v37 = 2112;
      v38 = v25;
      _os_log_impl(&dword_212C78000, v24, OS_LOG_TYPE_DEFAULT, "[BLPurchaseDAAPServer] FetchItemsPolitely: Being polite and NOT updating at the current time. %@ > %@", buf, 0x16u);

    }
    v26 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 48));
    v23 = (void *)v26;
    if (v26)
      (*(void (**)(uint64_t, uint64_t))(v26 + 16))(v26, 1);
  }

}

void sub_212CBB4D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_212CBB590(uint64_t a1, char a2)
{
  NSObject *v3;
  int8x16_t v4;
  _QWORD block[4];
  int8x16_t v6;
  id v7;
  id v8;
  uint64_t v9;
  char v10;
  __int16 v11;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212CBB650;
  block[3] = &unk_24CE8C6A8;
  v10 = a2;
  v9 = *(_QWORD *)(a1 + 64);
  v4 = *(int8x16_t *)(a1 + 32);
  v3 = (id)v4.i64[0];
  v6 = vextq_s8(v4, v4, 8uLL);
  v11 = *(_WORD *)(a1 + 72);
  v8 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 48);
  dispatch_async(v3, block);

}

void sub_212CBB650(uint64_t a1)
{
  BOOL v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  __int128 v20;
  __int16 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = *(_BYTE *)(a1 + 72) == 0;
  BLJaliscoLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "dsid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v13;
      _os_log_impl(&dword_212C78000, v4, OS_LOG_TYPE_ERROR, "[BLPurchaseDAAPServer] FetchItemsPolitely fail for %@", buf, 0xCu);

    }
    v14 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 56));
    v12 = (void *)v14;
    if (v14)
      (*(void (**)(uint64_t, _QWORD))(v14 + 16))(v14, 0);
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "dsid");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      *(_DWORD *)buf = 138412546;
      v23 = v5;
      v24 = 2048;
      v25 = v6;
      _os_log_impl(&dword_212C78000, v4, OS_LOG_TYPE_DEFAULT, "2. [BLPurchaseDAAPServer] dsid: %@ Setup server with reason %ld. Now polling", buf, 0x16u);

    }
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = sub_212CBB894;
    v16[3] = &unk_24CE8C680;
    v8 = *(void **)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 32);
    v17 = v9;
    v18 = v10;
    v21 = *(_WORD *)(a1 + 73);
    v15 = *(_OWORD *)(a1 + 56);
    v11 = (id)v15;
    v20 = v15;
    v19 = *(id *)(a1 + 48);
    objc_msgSend(v8, "_pollLatestRevisionWithReason:completion:", v7, v16);

    v12 = v17;
  }

}

void sub_212CBB84C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_212CBB894(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  char v14;
  __int16 v15;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212CBB96C;
  block[3] = &unk_24CE8C658;
  v14 = a2;
  v6 = *(NSObject **)(a1 + 32);
  block[4] = *(_QWORD *)(a1 + 40);
  v9 = v5;
  v15 = *(_WORD *)(a1 + 72);
  v13 = *(_QWORD *)(a1 + 64);
  v10 = v6;
  v12 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 48);
  v7 = v5;
  dispatch_async(v6, block);

}

void sub_212CBB96C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  _BYTE v42[18];
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 80))
  {
    +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v2, "newManagedObjectContext");

    objc_msgSend(*(id *)(a1 + 32), "_localServerDatabaseRevisionInMoc:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    BLJaliscoLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "dsid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      *(_DWORD *)buf = 138413058;
      v40 = v6;
      v41 = 2112;
      *(_QWORD *)v42 = v8;
      *(_WORD *)&v42[8] = 2114;
      *(_QWORD *)&v42[10] = v7;
      v43 = 2114;
      v44 = v4;
      _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_DEFAULT, "3. [BLPurchaseDAAPServer] dsid: %@ Last poll before this at:(%@). Finished POLLING, latestVersion:%{public}@ localServerRevision:%{public}@ Fetching database", buf, 0x2Au);

    }
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 8);
    *(_QWORD *)(v10 + 8) = v9;

    if (!*(_BYTE *)(a1 + 81)
      && *(_BYTE *)(a1 + 82)
      && *(_QWORD *)(a1 + 40)
      && (objc_msgSend(v4, "isEqualToNumber:") & 1) != 0)
    {
      BLJaliscoLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "dsid");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        v40 = v27;
        v41 = 2114;
        *(_QWORD *)v42 = v28;
        *(_WORD *)&v42[8] = 2114;
        *(_QWORD *)&v42[10] = v4;
        _os_log_impl(&dword_212C78000, v26, OS_LOG_TYPE_DEFAULT, "4b. [BLPurchaseDAAPServer] FetchItemsPolitely No update required, we have the latest revision for dsid:(%@): latest:%{public}@ -- local:%{public}@", buf, 0x20u);

      }
      v29 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 64));
      v22 = (void *)v29;
      if (v29)
        (*(void (**)(uint64_t, uint64_t))(v29 + 16))(v29, 1);
    }
    else
    {
      BLJaliscoLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "dsid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = *(unsigned __int8 *)(a1 + 82);
        *(_DWORD *)buf = 138412802;
        v40 = v13;
        v41 = 1024;
        *(_DWORD *)v42 = v14;
        *(_WORD *)&v42[4] = 2112;
        *(_QWORD *)&v42[6] = v4;
        _os_log_impl(&dword_212C78000, v12, OS_LOG_TYPE_DEFAULT, "4a. [BLPurchaseDAAPServer] dsid: %@ Need to fetch a new database politely:%{BOOL}d localServerRevision %@", buf, 0x1Cu);

      }
      v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      v17 = *(void **)(a1 + 32);
      v16 = *(_QWORD *)(a1 + 40);
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = sub_212CBBE20;
      v30[3] = &unk_24CE8C630;
      v18 = *(id *)(a1 + 48);
      v19 = *(_QWORD *)(a1 + 32);
      v31 = v18;
      v32 = v19;
      v33 = v3;
      v37 = *(id *)(a1 + 64);
      v34 = v4;
      v20 = *(id *)(a1 + 40);
      v21 = *(_QWORD *)(a1 + 72);
      v35 = v20;
      v38 = v21;
      v36 = *(id *)(a1 + 56);
      objc_msgSend(v17, "_fetchDatabaseWithReason:localServerRevision:latestVersion:completionHandler:", v15, v34, v16, v30);

      v22 = v31;
    }

  }
  else
  {
    BLJaliscoLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "dsid");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v40 = v24;
      _os_log_impl(&dword_212C78000, v23, OS_LOG_TYPE_ERROR, "[BLPurchaseDAAPServer] FetchItemsPolitely Error polling latest version for dsid:%@.", buf, 0xCu);

    }
    v25 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 64));
    v3 = (void *)v25;
    if (v25)
      (*(void (**)(uint64_t, _QWORD))(v25 + 16))(v25, 0);
  }

}

void sub_212CBBD64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_212CBBE20(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  char v19;

  v5 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_212CBBF30;
  v10[3] = &unk_24CE8C608;
  v19 = a2;
  v6 = *(NSObject **)(a1 + 32);
  v10[4] = *(_QWORD *)(a1 + 40);
  v11 = v5;
  v12 = *(id *)(a1 + 48);
  v17 = *(id *)(a1 + 80);
  v13 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 88);
  v14 = v7;
  v18 = v8;
  v15 = *(id *)(a1 + 32);
  v16 = *(id *)(a1 + 72);
  v9 = v5;
  dispatch_async(v6, v10);

}

void sub_212CBBF30(uint64_t a1)
{
  BOOL v1;
  NSObject *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  void *v40;
  _QWORD v41[4];
  id v42;
  uint64_t v43;
  id v44;
  id v45;
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  id v52;
  _BYTE v53[128];
  _QWORD v54[2];
  void *v55;
  uint8_t buf[4];
  id v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v1 = *(_BYTE *)(a1 + 104) == 0;
  BLJaliscoLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v1)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212C78000, v3, OS_LOG_TYPE_ERROR, "[BLPurchaseDAAPServer] FetchItemsPolitely DAAP Database failed", buf, 2u);
    }

    v33 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 88));
    v38 = (void *)v33;
    if (v33)
      (*(void (**)(uint64_t, _QWORD))(v33 + 16))(v33, 0);
  }
  else
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "dsid");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v57 = v4;
      v58 = 2112;
      v59 = v5;
      _os_log_impl(&dword_212C78000, v3, OS_LOG_TYPE_DEFAULT, "5. [BLPurchaseDAAPServer] dsid: %@ Got database %@", buf, 0x16u);

    }
    +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dsid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v55, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "itemsFetchRequestForDSIDs:", v8);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = CFSTR("purchasedTokenCode");
    v54[1] = CFSTR("cloudID");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setPropertiesToFetch:", v9);

    v10 = *(void **)(a1 + 48);
    v52 = 0;
    objc_msgSend(v10, "executeFetchRequest:error:", v38, &v52);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v11;
    v37 = v52;
    if (v11)
    {
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v49;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v49 != v14)
              objc_enumerationMutation(v12);
            v16 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
            objc_msgSend(v16, "cloudID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v17 == 0;

            if (!v18)
            {
              v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
              objc_msgSend(v16, "purchasedTokenCode");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = v20 == 0;

              if (!v21)
              {
                objc_msgSend(v16, "purchasedTokenCode");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "setObject:forKey:", v22, CFSTR("tokenCode"));

              }
              objc_msgSend(v16, "cloudID");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "setObject:forKey:", v23, CFSTR("clientID"));

              objc_msgSend(v40, "addObject:", v19);
            }
          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
        }
        while (v13);
      }

      BLJaliscoLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "dsid");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v57 = v25;
        v58 = 2112;
        v59 = v40;
        _os_log_impl(&dword_212C78000, v24, OS_LOG_TYPE_DEFAULT, "6. [BLPurchaseDAAPServer] dsid: %@ Fetching items _fetchItemsWithLocalVersion with pairs:%@", buf, 0x16u);

      }
      v26 = *(void **)(a1 + 32);
      v27 = *(_QWORD *)(a1 + 56);
      v28 = *(_QWORD *)(a1 + 64);
      v29 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
      v41[0] = MEMORY[0x24BDAC760];
      v41[1] = 3221225472;
      v41[2] = sub_212CBC5B8;
      v41[3] = &unk_24CE8C5E0;
      v30 = *(id *)(a1 + 72);
      v31 = *(_QWORD *)(a1 + 32);
      v42 = v30;
      v43 = v31;
      v44 = *(id *)(a1 + 64);
      v45 = *(id *)(a1 + 40);
      v47 = *(id *)(a1 + 88);
      v46 = *(id *)(a1 + 80);
      objc_msgSend(v26, "_fetchItemsWithLocalVersion:serverVersion:reason:tokenPairs:completionHandler:", v27, v28, v29, v40, v41);

      v32 = v42;
    }
    else
    {
      BLJaliscoLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v57 = v37;
        _os_log_impl(&dword_212C78000, v34, OS_LOG_TYPE_ERROR, "Couldn't find existing items.  %@", buf, 0xCu);
      }

      v35 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 88));
      v32 = (void *)v35;
      if (v35)
        (*(void (**)(uint64_t, _QWORD))(v35 + 16))(v35, 0);
    }

  }
}

void sub_212CBC498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_212CBC5B8(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212CBC698;
  block[3] = &unk_24CE8C5B8;
  v14 = a2;
  v6 = *(NSObject **)(a1 + 32);
  block[4] = *(_QWORD *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v11 = v5;
  v13 = *(id *)(a1 + 72);
  v12 = *(id *)(a1 + 64);
  v7 = v5;
  dispatch_async(v6, block);

}

void sub_212CBC698(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint32_t v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  void (**v34)(id, _QWORD);
  id v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 80))
  {
    BLJaliscoLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "dsid");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = *(void **)(a1 + 40);
      v5 = *(_QWORD *)(a1 + 48);
      v6 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138413058;
      v37 = v3;
      v38 = 2112;
      v39 = v4;
      v40 = 2112;
      v41 = v5;
      v42 = 2112;
      v43 = v6;
      _os_log_impl(&dword_212C78000, v2, OS_LOG_TYPE_DEFAULT, "7. [BLPurchaseDAAPServer] dsid: %@ Fetch items succesful. Saving latestVersion:%@ database:%@ items:%@", buf, 0x2Au);

    }
    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    v35 = 0;
    v11 = objc_msgSend(v7, "_updatePersistentServerRevision:database:items:error:", v8, v9, v10, &v35);
    v12 = v35;
    if ((v11 & 1) == 0)
    {
      BLJaliscoLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v12;
        _os_log_impl(&dword_212C78000, v28, OS_LOG_TYPE_ERROR, "Error updating database. %@", buf, 0xCu);
      }

      objc_msgSend(v12, "logRecursively");
      v29 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 72));
      v30 = (void *)v29;
      if (v29)
        (*(void (**)(uint64_t, _QWORD))(v29 + 16))(v29, 0);
      goto LABEL_26;
    }
    BLJaliscoLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "dsid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v37 = v14;
      v38 = 2112;
      v39 = v12;
      _os_log_impl(&dword_212C78000, v13, OS_LOG_TYPE_DEFAULT, "7. [BLPurchaseDAAPServer] dsid: %@ CoreData Save items sucess! %@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v15, "objectForKey:", CFSTR("kJaliscoDAAPClientLastSuccessfulFullUpdateDateDictionary"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");

    objc_msgSend(*(id *)(a1 + 64), "stringValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v15) = v18 == 0;

    if ((v15 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "stringValue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKey:", v19, v20);

    }
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v21, "setObject:forKey:", v17, CFSTR("kJaliscoDAAPClientLastSuccessfulFullUpdateDateDictionary"));

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v21) = objc_msgSend(v22, "synchronize");

    if ((v21 & 1) != 0)
    {
      BLJaliscoLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v17;
        v24 = "8. FetchItemsPolitely: Updated kJaliscoDAAPClientLastSuccessfulFullUpdateDateDictionary user default to %@";
        v25 = v23;
        v26 = OS_LOG_TYPE_DEFAULT;
        v27 = 12;
LABEL_21:
        _os_log_impl(&dword_212C78000, v25, v26, v24, buf, v27);
      }
    }
    else
    {
      BLJaliscoLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v24 = "Error writing kJaliscoDAAPClientLastSuccessfulFullUpdateDateDictionary to preferences.";
        v25 = v23;
        v26 = OS_LOG_TYPE_ERROR;
        v27 = 2;
        goto LABEL_21;
      }
    }

    BLJaliscoLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "dsid");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v37 = v32;
      _os_log_impl(&dword_212C78000, v31, OS_LOG_TYPE_DEFAULT, "FetchItemsPolitely %@ completed!", buf, 0xCu);

    }
    v33 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 72));
    v30 = (void *)v33;
    if (v33)
      (*(void (**)(uint64_t, uint64_t))(v33 + 16))(v33, 1);
LABEL_26:

    return;
  }
  v34 = (void (**)(id, _QWORD))MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 72));
  if (v34)
    v34[2](v34, 0);

}

void sub_212CBCAF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  void *v9;
  void *v10;

  _Unwind_Resume(a1);
}

void sub_212CBCDA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v8 = v6;

  _Unwind_Resume(a1);
}

void sub_212CBCE9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)BLPurchaseDAAPServer;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_212CBCED8(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_212CBCF90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_212CBD088(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_212CBD268(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t sub_212CBD41C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_212CBD42C(uint64_t a1)
{

}

void sub_212CBD434(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("dmap.serverrevision"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v2);

  }
  +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "newManagedObjectContext");

  v5 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v23 = 0;
  objc_msgSend(v5, "_updatePersistentServerRevision:moc:error:", v6, v4, &v23);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v23;
  v9 = v8;
  if (v7)
  {
    v10 = *(void **)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 48);
    v22 = v9;
    objc_msgSend(v10, "_updatePersistentDatabase:server:moc:error:", v11, v7, v4, &v22);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v22;

    if (v12)
    {
      v15 = *(_QWORD *)(a1 + 32);
      v14 = *(void **)(a1 + 40);
      v21 = v13;
      objc_msgSend(v14, "_updatePersistentItems:moc:database:error:", v15, v4, v12, &v21);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v21;

      BLJaliscoLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v16;
        _os_log_impl(&dword_212C78000, v18, OS_LOG_TYPE_DEFAULT, "_updatePersistentServerRevision updating local db with items %@", buf, 0xCu);
      }

      if (v16)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "_saveInMoc:error:", v4, *(_QWORD *)(a1 + 72));
        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
        {
          BLJaliscoLog();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            v20 = **(void ***)(a1 + 72);
            *(_DWORD *)buf = 138412290;
            v25 = v20;
            _os_log_impl(&dword_212C78000, v19, OS_LOG_TYPE_ERROR, "_updatePersistentServerRevision failed %@", buf, 0xCu);
          }

        }
      }
      else
      {
        if (*(_QWORD *)(a1 + 72))
          **(_QWORD **)(a1 + 72) = objc_retainAutorelease(v17);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
      }

      v13 = v17;
    }
    else
    {
      if (*(_QWORD *)(a1 + 72))
        **(_QWORD **)(a1 + 72) = objc_retainAutorelease(v13);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    }

    v9 = v13;
  }
  else
  {
    if (*(_QWORD *)(a1 + 72))
      **(_QWORD **)(a1 + 72) = objc_retainAutorelease(v8);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  }

}

void sub_212CBD718(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_212CBD8C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v7 = v5;

  _Unwind_Resume(a1);
}

void sub_212CBDABC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_212CBEAD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29)
{
  void *v29;
  void *v30;

  _Unwind_Resume(a1);
}

void sub_212CBEFEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_212CBF144(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_212CBF1D8(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = *(id **)(a1 + 32);
  if (!v2[6])
    goto LABEL_4;
  if (objc_msgSend(v2[6], "hasBackedOff"))
  {
    v2 = *(id **)(a1 + 32);
LABEL_4:
    if (objc_msgSend(v2, "_isGDPRPrivacyAcknowledgementRequired"))
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (v9)
        objc_msgSend(v9, "purchaseServerRequestGDPRPrivacyAcknowledgementRequired");
      v3 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 40));
      v4 = (void *)v3;
      if (v3)
        (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);

    }
    else
    {
      v9 = (id)MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 40));
      if (v9)
        (*((void (**)(id, uint64_t))v9 + 2))(v9, objc_msgSend(*(id *)(a1 + 32), "_canMakeDAAPRequest"));
    }

    return;
  }
  BLJaliscoLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "backoffUntil");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v11 = v6;
    _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_INFO, "Ignoring request due to backoff being in effect. Will resume %@", buf, 0xCu);

  }
  v7 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 40));
  v8 = (void *)v7;
  if (v7)
    (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);

}

void sub_212CBF37C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_212CBF488(uint64_t a1)
{
  void *v2;
  void *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  int v12;
  __CFString *v13;
  _BOOL4 v14;
  NSObject *v15;
  const __CFString *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  const __CFString *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  NSObject *v44;
  BOOL v45;
  int v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  id v51;
  uint8_t buf[4];
  const __CFString *v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "response");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD1308]))
    v4 = objc_msgSend(*(id *)(a1 + 40), "code") == -1001;
  else
    v4 = 0;

  v5 = objc_msgSend(*(id *)(a1 + 32), "responseStatusCode") >= 500
    && objc_msgSend(*(id *)(a1 + 32), "responseStatusCode") < 600;
  if (objc_msgSend(*(id *)(a1 + 32), "responseStatusCode") == 403)
  {
    objc_msgSend(v2, "allHeaderFields");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("retry-after"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;

  }
  else
  {
    v8 = 0;
  }
  if (objc_msgSend(v2, "statusCode") == 403)
  {
    objc_msgSend(v2, "allHeaderFields");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("cloud-daap-client-expired"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 != 0;

  }
  else
  {
    v11 = 0;
  }
  if (objc_msgSend(v2, "statusCode") == 401)
    v12 = 1;
  else
    v12 = objc_msgSend(*(id *)(a1 + 40), "bl_isAMSStatusCode401");
  objc_msgSend(*(id *)(a1 + 40), "domain");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == CFSTR("BLErrorDomain") && objc_msgSend(*(id *)(a1 + 40), "code") == 3;

  if (*(_QWORD *)(a1 + 40))
  {
    BLJaliscoLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = &stru_24CE8D258;
      v17 = *(_QWORD *)(a1 + 40);
      if (v14)
        v16 = CFSTR("invalid request");
      *(_DWORD *)buf = 138412546;
      v53 = v16;
      v54 = 2112;
      v55 = v17;
      _os_log_impl(&dword_212C78000, v15, OS_LOG_TYPE_ERROR, "failed with error: %@ %@", buf, 0x16u);
    }

  }
  if (v4 || v5 || v14)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 48), "failureIntervals:", 1);
    v18 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 48), "hasBackedOff");
    v19 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 56));
    v20 = (void *)v19;
    if (v18)
    {
      if (v19)
        (*(void (**)(uint64_t, _QWORD))(v19 + 16))(v19, 0);
      goto LABEL_71;
    }
    if (!v19)
      goto LABEL_71;
LABEL_31:
    (*(void (**)(uint64_t, uint64_t))(v19 + 16))(v19, 1);
    goto LABEL_71;
  }
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 48), "handleClientExpired");
    v19 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 56));
    v20 = (void *)v19;
    if (!v19)
      goto LABEL_71;
    goto LABEL_31;
  }
  if (v8)
  {
    objc_msgSend(v2, "allHeaderFields");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", CFSTR("retry-after"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v20, "doubleValue");
      if (v22 > 0.0)
      {
        v23 = objc_alloc(MEMORY[0x24BDBCE60]);
        objc_msgSend(v20, "doubleValue");
        v24 = objc_msgSend(v23, "initWithTimeIntervalSinceNow:");
        v25 = *(_QWORD *)(a1 + 48);
        v26 = *(void **)(v25 + 16);
        *(_QWORD *)(v25 + 16) = v24;

      }
    }
    BLJaliscoLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = *(const __CFString **)(*(_QWORD *)(a1 + 48) + 16);
      *(_DWORD *)buf = 138412290;
      v53 = v28;
      _os_log_impl(&dword_212C78000, v27, OS_LOG_TYPE_INFO, "Server requested backoff. Trying again at %@", buf, 0xCu);
    }

    v29 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 56));
    v30 = (void *)v29;
    if (!v29)
      goto LABEL_70;
LABEL_39:
    (*(void (**)(uint64_t, uint64_t))(v29 + 16))(v29, 1);
LABEL_70:

    goto LABEL_71;
  }
  v31 = *(void **)(*(_QWORD *)(a1 + 48) + 48);
  if (v12)
  {
    objc_msgSend(v31, "clear");
    objc_msgSend(*(id *)(a1 + 48), "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(*(id *)(a1 + 48), "isPrimaryAccount"))
    {
      v29 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 56));
      v30 = (void *)v29;
      if (!v29)
        goto LABEL_70;
      goto LABEL_39;
    }
    BLJaliscoLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 48), "dsid");
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v53 = v33;
      _os_log_impl(&dword_212C78000, v32, OS_LOG_TYPE_DEFAULT, "Requestenting silent auth for %@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BE0FBE8], "sharedProvider");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "activeStoreAccount");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "username");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = (void *)objc_msgSend(*(id *)(a1 + 48), "_newDefaultAuthenticateOptions");
    v37 = objc_alloc(MEMORY[0x24BE08028]);
    objc_msgSend(*(id *)(a1 + 48), "dsid");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v37, "initWithDSID:altDSID:username:options:", v38, 0, v30, v36);

    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE08038]), "initWithRequest:", v39);
    objc_msgSend(v40, "performAuthentication");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0;
    objc_msgSend(v41, "resultWithTimeout:error:", &v51, 90.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v51;

    BLJaliscoLog();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      if (v42)
        v45 = v43 == 0;
      else
        v45 = 0;
      v46 = v45;
      *(_DWORD *)buf = 67109120;
      LODWORD(v53) = v46;
      _os_log_impl(&dword_212C78000, v44, OS_LOG_TYPE_DEFAULT, "Silent auth returned: %{BOOL}d", buf, 8u);
    }

    if (!v42 || v43)
    {
      if (!v20)
      {
        BLJaliscoLog();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_212C78000, v50, OS_LOG_TYPE_ERROR, "No fallback for authentication", buf, 2u);
        }

        v47 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 56));
        v48 = (void *)v47;
        if (!v47)
          goto LABEL_69;
        goto LABEL_68;
      }
      objc_msgSend(v20, "purchaseServerRequestITunesAuthentication");
      v47 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 56));
      v48 = (void *)v47;
      if (v47)
LABEL_68:
        (*(void (**)(uint64_t, uint64_t))(v47 + 16))(v47, 1);
    }
    else
    {
      v47 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 56));
      v48 = (void *)v47;
      if (v47)
        goto LABEL_68;
    }
LABEL_69:

    goto LABEL_70;
  }
  objc_msgSend(v31, "clear");
  v49 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 56));
  v20 = (void *)v49;
  if (v49)
    (*(void (**)(uint64_t, uint64_t))(v49 + 16))(v49, 2);
LABEL_71:

}

void sub_212CBFB5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v10 = v3;

  _Unwind_Resume(a1);
}

void sub_212CBFD24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_212CBFEF8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_212CBFFB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_212CC00CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_212CC01B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_212CC01D8(uint64_t a1, char a2)
{
  BLDAAPServerInfoRequest *v3;
  void *v4;
  BLDAAPServerInfoRequest *v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) != 0)
  {
    v3 = [BLDAAPServerInfoRequest alloc];
    objc_msgSend(*(id *)(a1 + 40), "dsid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[BLDAAPServerInfoRequest initWithDSID:reason:](v3, "initWithDSID:reason:", v4, *(_QWORD *)(a1 + 56));

    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = sub_212CC0390;
    v12[3] = &unk_24CE8C7E8;
    v6 = *(id *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(void **)(a1 + 48);
    v13 = v6;
    v14 = v7;
    v16 = *(_QWORD *)(a1 + 56);
    v15 = v8;
    -[BLDAAPURLRequest executeWithCompletionHandler:](v5, "executeWithCompletionHandler:", v12);

  }
  else
  {
    BLJaliscoLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v18 = v10;
      _os_log_impl(&dword_212C78000, v9, OS_LOG_TYPE_DEBUG, "%@ will not make request", buf, 0xCu);
    }

    v11 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 48));
    v5 = (BLDAAPServerInfoRequest *)v11;
    if (v11)
      (*(void (**)(uint64_t, _QWORD))(v11 + 16))(v11, 0);
  }

}

void sub_212CC0350(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_212CC0390(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  BLJaliscoLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "dsid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138412802;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    v28 = 2048;
    v29 = v10;
    _os_log_impl(&dword_212C78000, v7, OS_LOG_TYPE_DEBUG, "%@ dsid:%@ reason:%ld", buf, 0x20u);

  }
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_212CC0574;
  v17[3] = &unk_24CE8C7C0;
  v11 = *(void **)(a1 + 40);
  v12 = *(id *)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 40);
  v14 = *(void **)(a1 + 48);
  v18 = v12;
  v19 = v13;
  v23 = *(_QWORD *)(a1 + 56);
  v22 = v14;
  v15 = v6;
  v20 = v15;
  v16 = v5;
  v21 = v16;
  objc_msgSend(v11, "_preProcessResponse:error:responseBlock:", v16, v15, v17);

}

void sub_212CC0524(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_212CC0574(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL8 v8;
  NSObject *v9;
  const __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  int v19;
  const __CFString *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  switch(a2)
  {
    case 2:
      v5 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 56), "data");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_processResponse:", v6);
      v7 = objc_claimAutoreleasedReturnValue();

      v8 = v7 != 0;
      if (v7)
      {
LABEL_14:

        goto LABEL_16;
      }
      BLJaliscoLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = *(const __CFString **)(a1 + 32);
        v19 = 138412290;
        v20 = v10;
        _os_log_impl(&dword_212C78000, v9, OS_LOG_TYPE_ERROR, "%@ Error no response data", (uint8_t *)&v19, 0xCu);
      }

LABEL_13:
      v8 = 0;
      goto LABEL_14;
    case 1:
      BLJaliscoLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v11 = *(const __CFString **)(a1 + 32);
        v12 = *(_QWORD *)(a1 + 48);
        v19 = 138412546;
        v20 = v11;
        v21 = 2112;
        v22 = v12;
        _os_log_impl(&dword_212C78000, v7, OS_LOG_TYPE_ERROR, "%@ Error getting response:  %@", (uint8_t *)&v19, 0x16u);
      }
      goto LABEL_13;
    case 0:
      BLJaliscoLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        v4 = *(const __CFString **)(a1 + 32);
        v19 = 138412290;
        v20 = v4;
        _os_log_impl(&dword_212C78000, v3, OS_LOG_TYPE_DEBUG, "%@ retry", (uint8_t *)&v19, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 40), "_configureWithReason:completion:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64));
      return;
  }
  v8 = 0;
LABEL_16:
  BLJaliscoLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 40), "dsid");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    v16 = CFSTR("with error");
    if (v8)
      v16 = CFSTR("successfully");
    v19 = 138543618;
    v20 = v16;
    v21 = 2112;
    v22 = v14;
    _os_log_impl(&dword_212C78000, v13, OS_LOG_TYPE_INFO, "PurchaseDAAPServer Server Info request completed %{public}@ for (%@)", (uint8_t *)&v19, 0x16u);

  }
  v17 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 64));
  v18 = (void *)v17;
  if (v17)
    (*(void (**)(uint64_t, _BOOL8))(v17 + 16))(v17, v8);

}

void sub_212CC07F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_212CC08A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_212CC097C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_212CC09A0(uint64_t a1, char a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int8x16_t v7;
  _QWORD v8[4];
  int8x16_t v9;
  id v10;
  uint8_t buf[16];

  if ((a2 & 1) != 0)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = sub_212CC0AD0;
    v8[3] = &unk_24CE8C428;
    v7 = *(int8x16_t *)(a1 + 32);
    v3 = (id)v7.i64[0];
    v9 = vextq_s8(v7, v7, 8uLL);
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v3, "executeWithCompletionHandler:", v8);

  }
  else
  {
    BLJaliscoLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212C78000, v4, OS_LOG_TYPE_DEBUG, "Configure(login) will not make request", buf, 2u);
    }

    v5 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 48));
    v6 = (void *)v5;
    if (v5)
      (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

  }
}

void sub_212CC0AA8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_212CC0AD0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_212CC0BDC;
  v13[3] = &unk_24CE8C400;
  v7 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v14 = v8;
  v15 = v9;
  v10 = *(id *)(a1 + 48);
  v17 = v5;
  v18 = v10;
  v16 = v6;
  v11 = v5;
  v12 = v6;
  objc_msgSend(v7, "_preProcessResponse:error:responseBlock:", v11, v12, v13);

}

void sub_212CC0BA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16, void *a17, void *a18)
{
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_212CC0BDC(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  char isKindOfClass;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  switch(a2)
  {
    case 2:
      objc_msgSend(*(id *)(a1 + 56), "data");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[BLPurchaseDAAPParser decodeData:](BLPurchaseDAAPParser, "decodeData:", v6);
      v7 = objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "_setSessionID:", v7);
      }
      else
      {
        BLJaliscoLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v12 = *(_QWORD *)(a1 + 48);
          v19 = 138412546;
          v20 = v7;
          v21 = 2112;
          v22 = v12;
          _os_log_impl(&dword_212C78000, v11, OS_LOG_TYPE_ERROR, "Configure(login) parsed data unrecognized %@ %@", (uint8_t *)&v19, 0x16u);
        }

      }
      goto LABEL_16;
    case 1:
      BLJaliscoLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 40), "dsid");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(a1 + 48);
        v19 = 138412546;
        v20 = v9;
        v21 = 2112;
        v22 = v10;
        _os_log_impl(&dword_212C78000, v7, OS_LOG_TYPE_ERROR, "Configure(login) dsid: %@, Error getting response %@", (uint8_t *)&v19, 0x16u);

      }
      isKindOfClass = 0;
LABEL_16:

      goto LABEL_17;
    case 0:
      BLJaliscoLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 32), "DSID");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(*(id *)(a1 + 32), "reason");
        v19 = 138412546;
        v20 = v4;
        v21 = 2048;
        v22 = v5;
        _os_log_impl(&dword_212C78000, v3, OS_LOG_TYPE_DEBUG, "Configure(login) dsid: %@, Reason: %ld RETRY", (uint8_t *)&v19, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 40), "_loginWithRequest:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64));
      return;
  }
  isKindOfClass = 0;
LABEL_17:
  BLJaliscoLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 40), "dsid");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    v16 = CFSTR("with error");
    if ((isKindOfClass & 1) != 0)
      v16 = CFSTR("successfully");
    v19 = 138543618;
    v20 = (void *)v16;
    v21 = 2112;
    v22 = v14;
    _os_log_impl(&dword_212C78000, v13, OS_LOG_TYPE_INFO, "PurchaseDAAPServer login request completed %{public}@ for (%@)", (uint8_t *)&v19, 0x16u);

  }
  v17 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 64));
  v18 = (void *)v17;
  if (v17)
    (*(void (**)(uint64_t, _QWORD))(v17 + 16))(v17, isKindOfClass & 1);

}

void sub_212CC0EC0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_212CC0F94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_212CC0FAC(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  __CFString *v11;
  BLDAAPUpdateRequest *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BLDAAPUpdateRequest *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  _QWORD v23[5];
  id v24;
  uint64_t v25;
  id v26;
  uint8_t buf[16];

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v4, "newManagedObjectContext");

      +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "dsid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0;
      objc_msgSend(v6, "serverInfoForDSID:fromManagedObjectContext:error:", v7, v5, &v26);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v26;

      objc_msgSend(v8, "databaseVersion");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
        v11 = (__CFString *)v10;
      else
        v11 = &stru_24CE8D258;
      v12 = [BLDAAPUpdateRequest alloc];
      objc_msgSend(*(id *)(a1 + 32), "dsid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "sessionID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[BLDAAPUpdateRequest initWithDSID:reason:sessionID:localVersion:](v12, "initWithDSID:reason:sessionID:localVersion:", v13, v14, v15, v11);

      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = sub_212CC12A8;
      v23[3] = &unk_24CE8C888;
      v18 = *(void **)(a1 + 40);
      v17 = *(_QWORD *)(a1 + 48);
      v23[4] = *(_QWORD *)(a1 + 32);
      v25 = v17;
      v24 = v18;
      -[BLDAAPURLRequest executeWithCompletionHandler:](v16, "executeWithCompletionHandler:", v23);

      goto LABEL_16;
    }
  }
  else
  {
    BLJaliscoLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212C78000, v19, OS_LOG_TYPE_DEBUG, "Poll update will not make request", buf, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "sessionID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    BLJaliscoLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212C78000, v21, OS_LOG_TYPE_DEBUG, "Poll update: No Session ID to fetch session with.", buf, 2u);
    }

  }
  v22 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 40));
  v5 = (void *)v22;
  if (v22)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v22 + 16))(v22, 0, 0);
LABEL_16:

}

void sub_212CC1228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_212CC12A8(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_212CC13A0;
  v11[3] = &unk_24CE8C860;
  v8 = (void *)a1[5];
  v7 = a1[6];
  v12 = (id)a1[4];
  v16 = v7;
  v14 = v5;
  v15 = v8;
  v13 = v6;
  v9 = v5;
  v10 = v6;
  objc_msgSend(v12, "_preProcessResponse:error:responseBlock:", v9, v10, v11);

}

void sub_212CC1374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17)
{
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_212CC13A0(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;
  const __CFString *v11;
  NSObject *v12;
  __CFString *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  const __CFString *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (a2 != 2)
  {
    if (a2 == 1)
    {
      BLJaliscoLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "dsid");
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v5 = *(void **)(a1 + 40);
        v18 = 138412546;
        v19 = v4;
        v20 = 2112;
        v21 = v5;
        _os_log_impl(&dword_212C78000, v3, OS_LOG_TYPE_ERROR, "Poll Update: Error getting response for %@ %@", (uint8_t *)&v18, 0x16u);

      }
    }
    else if (!a2)
    {
      objc_msgSend(*(id *)(a1 + 32), "_pollLatestRevisionWithReason:completion:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
      return;
    }
    goto LABEL_12;
  }
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_processResponse:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", CFSTR("dmap.serverrevision"));
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  BLJaliscoLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412290;
    v19 = v9;
    _os_log_impl(&dword_212C78000, v10, OS_LOG_TYPE_DEFAULT, "Poll Update success LATEST VERSION:%@", (uint8_t *)&v18, 0xCu);
  }

  if (!v9)
  {
LABEL_12:
    BLJaliscoLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "dsid");
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v13;
      _os_log_impl(&dword_212C78000, v12, OS_LOG_TYPE_ERROR, "Poll Update: Failed for %@", (uint8_t *)&v18, 0xCu);

    }
    v9 = 0;
    v11 = CFSTR("with error");
    goto LABEL_15;
  }
  v11 = CFSTR("successfully");
LABEL_15:
  BLJaliscoLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "dsid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v11;
    v20 = 2112;
    v21 = v15;
    _os_log_impl(&dword_212C78000, v14, OS_LOG_TYPE_INFO, "PurchaseDAAPServer Poll Update completed %{public}@ for (%@)", (uint8_t *)&v18, 0x16u);

  }
  v16 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 56));
  v17 = (void *)v16;
  if (v16)
    (*(void (**)(uint64_t, BOOL, __CFString *))(v16 + 16))(v16, v9 != 0, v9);

}

void sub_212CC167C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_212CC18BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_212CC1A8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_212CC1AD8(uint64_t a1, char a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) != 0)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = sub_212CC1C60;
    v8[3] = &unk_24CE8C900;
    v3 = *(void **)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 48);
    v9 = *(id *)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    v11 = *(id *)(a1 + 56);
    objc_msgSend(v3, "executeWithCompletionHandler:", v8);

  }
  else
  {
    BLJaliscoLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v13 = v5;
      _os_log_impl(&dword_212C78000, v4, OS_LOG_TYPE_DEBUG, "%@ will not make request", buf, 0xCu);
    }

    v6 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 56));
    v7 = (void *)v6;
    if (v6)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v6 + 16))(v6, 0, 0);

  }
}

void sub_212CC1C28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_212CC1C60(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v5 = a2;
  v6 = a3;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_212CC1D88;
  v13[3] = &unk_24CE8C8D8;
  v7 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v14 = v8;
  v15 = v9;
  v16 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v18 = v5;
  v19 = v10;
  v17 = v6;
  v11 = v5;
  v12 = v6;
  objc_msgSend(v7, "_preProcessResponse:error:responseBlock:", v11, v12, v13);

}

void sub_212CC1D4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18)
{
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_212CC1D88(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  switch(a2)
  {
    case 2:
      v7 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 64), "data");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_processResponse:", v8);
      v9 = objc_claimAutoreleasedReturnValue();

      BLJaliscoLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "dsid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(*(id *)(a1 + 48), "reason");
        v20 = 138412802;
        v21 = v11;
        v22 = 2048;
        v23 = v12;
        v24 = 2112;
        v25 = (uint64_t)v9;
        _os_log_impl(&dword_212C78000, v10, OS_LOG_TYPE_DEFAULT, "_fetchDatabaseWithRequest dsid: %@, Reason: %ld data:%@", (uint8_t *)&v20, 0x20u);

      }
      if (v9)
      {
        -[NSObject objectForKey:](v9, "objectForKey:", CFSTR("dmap.listing"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "lastObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
        goto LABEL_16;
      }
LABEL_13:
      v14 = 0;
      goto LABEL_14;
    case 1:
      BLJaliscoLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v15 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "dsid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(a1 + 56);
        v20 = 138412802;
        v21 = v15;
        v22 = 2112;
        v23 = (uint64_t)v16;
        v24 = 2112;
        v25 = v17;
        _os_log_impl(&dword_212C78000, v9, OS_LOG_TYPE_ERROR, "%@ dsid: %@, Error getting response:  %@", (uint8_t *)&v20, 0x20u);

      }
      goto LABEL_13;
    case 0:
      BLJaliscoLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        v4 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "dsid");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(*(id *)(a1 + 48), "reason");
        v20 = 138412802;
        v21 = v4;
        v22 = 2112;
        v23 = (uint64_t)v5;
        v24 = 2048;
        v25 = v6;
        _os_log_impl(&dword_212C78000, v3, OS_LOG_TYPE_DEBUG, "%@ dsid: %@, Reason: %ld RETRY", (uint8_t *)&v20, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 40), "_fetchDatabaseWithRequest:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72));
      return;
  }
  v14 = 0;
LABEL_16:
  v18 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 72));
  v19 = (void *)v18;
  if (v18)
    (*(void (**)(uint64_t, BOOL, void *))(v18 + 16))(v18, v14 != 0, v14);

}

void sub_212CC2020(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_212CC2298(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_212CC2394(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_212CC24B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_212CC24E0(id *a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v9 = a2;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = v4;

  objc_msgSend(v9, "writeUInt32:withCode:", v5, 1836282979);
  objc_msgSend(a1[4], "daapMetaDataFilterString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "writeString:withCode:", v6, 1835365473);

  objc_msgSend(a1[4], "daapQueryFilterString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "writeString:withCode:", v7, 1836152165);

  objc_msgSend(a1[4], "sessionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "writeUInt32:withCode:", objc_msgSend(v8, "unsignedIntValue"), 1835821412);

  objc_msgSend(v9, "writeUInt32:withCode:", objc_msgSend(a1[5], "unsignedIntValue"), 1836413810);
  objc_msgSend(v9, "writeUInt32:withCode:", objc_msgSend(a1[6], "unsignedIntValue"), 1835296114);
  objc_msgSend(v9, "writeUInt8:withCode:", 1, 1634355568);
  objc_msgSend(v9, "writeUInt8:withCode:", 1, 1835559268);
  if (objc_msgSend(a1[7], "count"))
  {
    v10 = a1[7];
    ICDAAPUtilitiesWriteContainer();

  }
}

void sub_212CC2688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_212CC26C4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_212CC275C;
  v6[3] = &unk_24CE8C978;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

void sub_212CC2740(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_212CC275C(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v6 = a2;
  objc_msgSend(v6, "objectForKey:", CFSTR("tokenCode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("clientID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v2, "unsignedLongLongValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v3, "unsignedLongLongValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  v5 = v7;
  ICDAAPUtilitiesWriteContainer();

}

void sub_212CC2888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_212CC28DC(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  ICDAAPUtilitiesWriteProperty();
  ICDAAPUtilitiesWriteProperty();

}

void sub_212CC2938(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_212CC2B90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_212CC2C04(uint64_t a1, char a2)
{
  void *v3;
  BLDAAPItemsRequest *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BLDAAPItemsRequest *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23[2];
  id location[4];

  location[3] = *(id *)MEMORY[0x24BDAC8D0];
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_dataForItemsRequestWithLocalVersion:serverVersion:tokenPairs:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = [BLDAAPItemsRequest alloc];
    objc_msgSend(*(id *)(a1 + 40), "dsid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 80);
    objc_msgSend(*(id *)(a1 + 40), "bagDatabaseID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[BLDAAPItemsRequest initWithDSID:reason:databaseID:body:](v4, "initWithDSID:reason:databaseID:body:", v5, v6, v7, v3);

    objc_initWeak(location, *(id *)(a1 + 40));
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = sub_212CC2EAC;
    v16[3] = &unk_24CE8CA18;
    objc_copyWeak(v23, location);
    v9 = *(id *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v17 = v9;
    v18 = v10;
    v19 = *(id *)(a1 + 48);
    v11 = *(id *)(a1 + 56);
    v12 = *(void **)(a1 + 80);
    v20 = v11;
    v23[1] = v12;
    v21 = *(id *)(a1 + 64);
    v22 = *(id *)(a1 + 72);
    -[BLDAAPURLRequest executeWithCompletionHandler:](v8, "executeWithCompletionHandler:", v16);

    objc_destroyWeak(v23);
    objc_destroyWeak(location);

  }
  else
  {
    BLJaliscoLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = *(void **)(a1 + 32);
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v14;
      _os_log_impl(&dword_212C78000, v13, OS_LOG_TYPE_DEBUG, "%@ will not make request", (uint8_t *)location, 0xCu);
    }

    v15 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 72));
    v3 = (void *)v15;
    if (v15)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v15 + 16))(v15, 0, 0);
  }

}

void sub_212CC2E34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_212CC2EAC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_212CC3028;
  v14[3] = &unk_24CE8C9F0;
  v15 = *(id *)(a1 + 32);
  v16 = WeakRetained;
  v8 = *(void **)(a1 + 48);
  v17 = *(_QWORD *)(a1 + 40);
  v18 = v8;
  v9 = *(id *)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 88);
  v19 = v9;
  v24 = v10;
  v20 = *(id *)(a1 + 64);
  v11 = *(id *)(a1 + 72);
  v22 = v5;
  v23 = v11;
  v21 = v6;
  v12 = v5;
  v13 = v6;
  objc_msgSend(WeakRetained, "_preProcessResponse:error:responseBlock:", v12, v13, v14);

}

void sub_212CC2FD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21)
{
  void *v21;
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

void sub_212CC3028(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  NSObject *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  switch(a2)
  {
    case 2:
      v6 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 88), "data");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_processResponse:", v7);
      v8 = objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v8 = v8;
        BLJaliscoLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 40), "dsid");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138412546;
          v18 = v10;
          v19 = 2112;
          v20 = v8;
          _os_log_impl(&dword_212C78000, v9, OS_LOG_TYPE_DEFAULT, "[BLPurchaseDAAPServer] _fetchItemsWithLocalVersion dsid:%@ items: %@ SUCCEEDED", (uint8_t *)&v17, 0x16u);

        }
      }
      v11 = v8;
      goto LABEL_15;
    case 1:
      BLJaliscoLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v12 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "dsid");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = *(_QWORD *)(a1 + 80);
        v17 = 138412802;
        v18 = v12;
        v19 = 2112;
        v20 = v13;
        v21 = 2112;
        v22 = v14;
        _os_log_impl(&dword_212C78000, v8, OS_LOG_TYPE_ERROR, "%@ dsid: %@, Error getting response:  %@", (uint8_t *)&v17, 0x20u);

      }
      v11 = 0;
LABEL_15:

      goto LABEL_17;
    case 0:
      BLJaliscoLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        v4 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "dsid");
        v5 = objc_claimAutoreleasedReturnValue();
        v17 = 138412546;
        v18 = v4;
        v19 = 2112;
        v20 = v5;
        _os_log_impl(&dword_212C78000, v3, OS_LOG_TYPE_DEBUG, "%@ dsid: %@, RETRY", (uint8_t *)&v17, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 48), "_fetchItemsWithLocalVersion:serverVersion:reason:tokenPairs:completionHandler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 96));
      return;
  }
  v11 = 0;
LABEL_17:
  v15 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 96));
  v16 = (void *)v15;
  if (v15)
    (*(void (**)(uint64_t, BOOL, NSObject *))(v15 + 16))(v15, v11 != 0, v11);

}

void sub_212CC3280(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_212CC3494(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_212CC3544(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t BLAudiobookStreamingEnabled()
{
  id v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v0 = objc_alloc(MEMORY[0x24BDBCF50]);
  v1 = *MEMORY[0x24BE0FBA8];
  objc_msgSend(MEMORY[0x24BDBCF48], "bu_booksGroupContainerURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v0, "_initWithSuiteName:container:", v1, v2);
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("BKAudiobookStreamingDisabled")) ^ 1;

  return v4;
}

uint64_t BLPaymentSheetEnabled()
{
  return 0;
}

uint64_t sub_212CC3928(uint64_t result, uint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;

  v4 = a3 + a4;
  if (a3 < a3 + a4)
  {
    v5 = a3;
    v7 = result;
    do
    {
      result = objc_msgSend(*(id *)(v7 + 32), "consumeBytes:length:", a2 + v5, v4 - v5);
      v5 += result;
    }
    while (v5 < v4);
  }
  return result;
}

void sub_212CC5350(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "p_allItemsFetchRequestForDSIDs:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v8 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v2, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_212CC5414;
  v6[3] = &unk_24CE8BCC8;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

void sub_212CC5414(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    +[BLJaliscoItem itemWithServerItem:](BLJaliscoItem, "itemWithServerItem:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v3);

  }
}

void sub_212CC5590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_212CC55A8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_212CC55B8(uint64_t a1)
{

}

void sub_212CC55C0(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "p_allItemsFetchRequestForDSIDs:matchingSearchString:isExplicitRestricted:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v7 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v2, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_212CC567C;
  v6[3] = &unk_24CE8CAA0;
  v6[4] = *(_QWORD *)(a1 + 56);
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

void sub_212CC567C(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  if (a2)
  {
    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    +[BLJaliscoItem itemWithServerItem:](BLJaliscoItem, "itemWithServerItem:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v3);

  }
}

void sub_212CC57B8(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v2 = (void *)MEMORY[0x24BDBB678];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setPredicate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "setSortDescriptors:", *(_QWORD *)(a1 + 40));
  v6 = *(void **)(*(_QWORD *)(a1 + 48) + 24);
  v11 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v5, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_212CC58B8;
  v9[3] = &unk_24CE8BCC8;
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

}

void sub_212CC58B8(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    +[BLJaliscoItem itemWithServerItem:](BLJaliscoItem, "itemWithServerItem:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v3);

  }
}

void sub_212CC59EC(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "p_fetchRequestForStoreIDs:dsids:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v8 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v2, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_212CC5AB0;
  v6[3] = &unk_24CE8BCC8;
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

void sub_212CC5AB0(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    +[BLJaliscoItem itemWithServerItem:](BLJaliscoItem, "itemWithServerItem:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v3);

  }
}

void sub_212CC5BC0(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "p_fetchRequestForStoreIDs:dsids:", *(_QWORD *)(a1 + 40), MEMORY[0x24BDBD1A8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v8 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v2, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_212CC5C8C;
  v6[3] = &unk_24CE8BCC8;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

void sub_212CC5C8C(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    +[BLJaliscoItem itemWithServerItem:](BLJaliscoItem, "itemWithServerItem:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v3);

  }
}

void sub_212CC5DD0(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_itemsFetchRequestForDSIDs:excludeStoreIDs:isExplicitRestricted:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v9 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v2, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_212CC5F24;
  v7[3] = &unk_24CE8BCC8;
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  if (v5)
  {
    BLJaliscoLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v11 = v2;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_212C78000, v6, OS_LOG_TYPE_ERROR, "BLJaliscoReadOnlyDAAPClient fetchItemsForDSIDs:excludeStoreIDs:isExplicitRestricted %@ failed. Error: %@", buf, 0x16u);
    }

  }
}

void sub_212CC5F24(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    +[BLJaliscoItem itemWithServerItem:](BLJaliscoItem, "itemWithServerItem:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v3);

  }
}

void sub_212CC6404(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 buf, int a12, __int16 a13, __int16 a14, void *a15)
{
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;

  if (a2 == 1)
  {
    v15 = objc_begin_catch(a1);
    BLJaliscoLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v15, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "reason");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "userInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543874;
      *(_QWORD *)((char *)&buf + 4) = v17;
      WORD6(buf) = 2114;
      *(_QWORD *)((char *)&buf + 14) = v18;
      a14 = 2114;
      a15 = v19;
      _os_log_impl(&dword_212C78000, v16, OS_LOG_TYPE_ERROR, "BLJaliscoReadOnlyDAAPClient: Unable to bring up jalisco core data stack. Exception: %{public}@ %{public}@ %{public}@", (uint8_t *)&buf, 0x20u);

    }
    objc_end_catch();
    JUMPOUT(0x212CC6258);
  }
  _Unwind_Resume(a1);
}

void sub_212CC7060()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_253DB2070;
  qword_253DB2070 = v0;

}

void sub_212CC736C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_212CC7388(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    BLFamilyLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_impl(&dword_212C78000, v7, OS_LOG_TYPE_ERROR, "Error looking up family info:  %@", buf, 0xCu);
    }

  }
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212CC74E0;
  block[3] = &unk_24CE8CB38;
  v11 = v5;
  v9 = v5;
  objc_copyWeak(&v13, (id *)(a1 + 48));
  v12 = *(id *)(a1 + 40);
  dispatch_async(v8, block);

  objc_destroyWeak(&v13);
}

void sub_212CC74E0(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  id WeakRetained;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  int v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "familyMembers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "isHeadOfHouseholdSharingPayment") & 1) == 0)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "familyMembers", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v25, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v15 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v8, "isCurrentSignedInUser"))
          {
            v24 = v8;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v24, 1);
            v9 = objc_claimAutoreleasedReturnValue();

            v2 = (void *)v9;
            goto LABEL_12;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v25, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_12:

  }
  BLFamilyLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(v2, "count");
    v12 = objc_msgSend(*(id *)(a1 + 32), "isHeadOfHouseholdSharingPayment");
    *(_DWORD *)buf = 138412802;
    v19 = v2;
    v20 = 2048;
    v21 = v11;
    v22 = 1024;
    v23 = v12;
    _os_log_impl(&dword_212C78000, v10, OS_LOG_TYPE_DEFAULT, "AMS Family fetched: %@ (count: %lu Family-wide sharing allowed: %d)", buf, 0x1Cu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "dq_processFamilyCircle:completion:", v2, *(_QWORD *)(a1 + 40));

}

void sub_212CC7EE8(uint64_t a1)
{
  BLDownloadQueueServerProgressObserver *v1;
  void *v2;

  v1 = -[BLDownloadQueueServerProgressObserver initWithDownloadQueue:]([BLDownloadQueueServerProgressObserver alloc], "initWithDownloadQueue:", *(_QWORD *)(a1 + 32));
  v2 = (void *)qword_253DB1FD0;
  qword_253DB1FD0 = (uint64_t)v1;

}

void sub_212CC82E8(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  void (**v16)(_QWORD, _QWORD, _QWORD, _QWORD);

  if (*(_QWORD *)(a1 + 56))
    v2 = *(void **)(a1 + 56);
  else
    v2 = &unk_24CE8CBF0;
  v3 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x2199A44E0](v2);
  objc_msgSend(*(id *)(a1 + 32), "serverProgressObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notifyPurchaseAttemptForRequest:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 40), "buyParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "serviceProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = sub_212CC843C;
    v13[3] = &unk_24CE8CC40;
    v16 = v3;
    v10 = *(id *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 32);
    v14 = v10;
    v15 = v11;
    objc_msgSend(v7, "purchaseWithRequest:uiHostProxy:reply:", v8, v9, v13);

  }
  else
  {
    BLError(13, CFSTR("missing purchase parameters"), CFSTR("purchase parameters are required by this API"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, _QWORD, void *))v3)[2](v3, 0, 0, v12);

  }
}

void sub_212CC843C(uint64_t a1, void *a2, void *a3, void *a4)
{
  __CFString *v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  const __CFString *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  __CFString *v45;
  NSObject *obj;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[4];
  __CFString *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  const __CFString *v57;
  __int16 v58;
  id v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  BLDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = CFSTR("<UNKNOWN>");
      if (v7)
        v12 = v7;
      *(_DWORD *)buf = 138543618;
      v57 = v12;
      v58 = 2112;
      v59 = v9;
      _os_log_impl(&dword_212C78000, v11, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [DownloadQueue]: purchaseWithBuyParameters: error issuing a purchase request: %@", buf, 0x16u);
    }

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "serviceProxy");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = MEMORY[0x24BDAC760];
      v50[1] = 3221225472;
      v50[2] = sub_212CC8A34;
      v50[3] = &unk_24CE8CC18;
      v14 = v7;
      v51 = v14;
      objc_msgSend(v13, "cancelDownloadWithID:withReply:", v14, v50);

      objc_msgSend(*(id *)(a1 + 40), "serverProgressObserver");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sendCancelCompletionNotificationForDownloadWithDownloadID:", v14);

    }
    objc_msgSend(*(id *)(a1 + 40), "serverProgressObserver");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "purchaseDidFailedWithResponse:", v8);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v57 = v7;
      _os_log_impl(&dword_212C78000, v11, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue] purchaseWithBuyParameters completed without error", buf, 0xCu);
    }

    if ((objc_msgSend(*(id *)(a1 + 32), "isPreOrder") & 1) != 0)
    {
      BLDefaultLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v57 = v7;
        _os_log_impl(&dword_212C78000, v17, OS_LOG_TYPE_DEBUG, "(dID=%{public}@) [DownloadQueue]: purchaseWithBuyParameters: this is a preorder purchase download", buf, 0xCu);
      }
    }
    else if (objc_msgSend(*(id *)(a1 + 32), "isAudiobook"))
    {
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      objc_msgSend(v8, "purchaseResponseItems");
      v17 = objc_claimAutoreleasedReturnValue();
      v49 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
      if (v49)
      {
        v44 = v8;
        v45 = v7;
        obj = v17;
        v47 = *(_QWORD *)v53;
        v48 = a1;
        do
        {
          for (i = 0; i != v49; ++i)
          {
            if (*(_QWORD *)v53 != v47)
              objc_enumerationMutation(obj);
            v19 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
            objc_msgSend(v19, "metadata");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("itemId"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v19, "metadata");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("playlistId"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            objc_msgSend(v19, "metadata");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("itemName"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            BUDynamicCast();
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            objc_msgSend(v19, "metadata");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("playlistName"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            BUDynamicCast();
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            objc_msgSend(v19, "metadata");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("kind"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            BUDynamicCast();
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(v48 + 40), "serverProgressObserver");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v21, "longLongValue"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v23, "longLongValue"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "downloadID");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v43) = 0;
            objc_msgSend(v33, "sendInitialProgressNotificationForDownloadWithStoreID:storePlaylistID:orPermlink:downloadID:title:collectionTitle:assetKind:isPaused:targetObserver:", v34, v35, 0, v36, v26, v29, v32, v43, 0);

          }
          v17 = obj;
          v49 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
        }
        while (v49);
        v8 = v44;
        v7 = v45;
        v9 = 0;
        a1 = v48;
      }
    }
    else
    {
      objc_msgSend(v8, "purchaseResponseItems");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "firstObject");
      v17 = objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      -[NSObject metadata](v17, "metadata");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("kind"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      BUDynamicCast();
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "serverProgressObserver");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "storeIdentifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v43) = 0;
      objc_msgSend(v41, "sendInitialProgressNotificationForDownloadWithStoreID:storePlaylistID:orPermlink:downloadID:title:collectionTitle:assetKind:isPaused:targetObserver:", v42, 0, 0, v7, 0, 0, v40, v43, 0);

    }
    objc_msgSend(*(id *)(a1 + 40), "serverProgressObserver");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "purchaseDidCompleteWithResponse:", v8);
  }

}

void sub_212CC8A34(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  BLDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v12 = 138543618;
      v13 = v6;
      v14 = 2112;
      v15 = v3;
      v7 = "(dID=%{public}@) [DownloadQueue]: purchaseWithBuyParameters: error cancelling download: %@";
      v8 = v5;
      v9 = OS_LOG_TYPE_ERROR;
      v10 = 22;
LABEL_6:
      _os_log_impl(&dword_212C78000, v8, v9, v7, (uint8_t *)&v12, v10);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = 138543362;
    v13 = v11;
    v7 = "(dID=%{public}@) [DownloadQueue]: purchaseWithBuyParameters: cancelled download";
    v8 = v5;
    v9 = OS_LOG_TYPE_DEFAULT;
    v10 = 12;
    goto LABEL_6;
  }

}

void sub_212CC8D00(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v6 = a4;
  v7 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 32));
  v8 = (void *)v7;
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v9, v6);

}

void sub_212CC8FE0(uint64_t a1, void *a2, void *a3)
{
  __CFString *v5;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  BLBookItem *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  __CFString *v15;
  uint64_t v16;
  _QWORD v17[4];
  BLBookItem *v18;
  id v19;
  uint8_t buf[4];
  const __CFString *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "serverProgressObserver");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v16) = 0;
    objc_msgSend(v11, "sendInitialProgressNotificationForDownloadWithStoreID:storePlaylistID:orPermlink:downloadID:title:collectionTitle:assetKind:isPaused:targetObserver:", 0, 0, v12, v5, *(_QWORD *)(a1 + 48), 0, CFSTR("ebook"), v16, 0);

    v10 = -[BLBookItem initWithPeristentIdentifier:permlink:title:]([BLBookItem alloc], "initWithPeristentIdentifier:permlink:title:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    +[BLLibrary defaultBookLibrary](BLLibrary, "defaultBookLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v13, "_addBookItemToEduContainer:error:", v10, &v19);
    v6 = v19;

    if (v6)
    {
      BLDefaultLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        -[BLBookItem permlink](v10, "permlink");
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v21 = v15;
        _os_log_impl(&dword_212C78000, v14, OS_LOG_TYPE_DEBUG, "[DownloadQueue]: addDownloadWithPermlink: could not add permlink to container %@.  It may already exist", buf, 0xCu);

      }
    }
    goto LABEL_12;
  }
  BLDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = CFSTR("<UNKNOWN>");
    if (v5)
      v8 = v5;
    *(_DWORD *)buf = 138543618;
    v21 = v8;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_212C78000, v7, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [DownloadQueue]: addDownloadWithPermlink: error issuing a permlink download: %@", buf, 0x16u);
  }

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "serviceProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = sub_212CC9260;
    v17[3] = &unk_24CE8CC18;
    v18 = v5;
    objc_msgSend(v9, "cancelDownloadWithID:withReply:", v18, v17);

    v10 = v18;
LABEL_12:

  }
}

void sub_212CC9260(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    BLDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v5;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_212C78000, v4, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [DownloadQueue]: addDownloadWithPermlink: error cancelling download: %@", (uint8_t *)&v8, 0x16u);
    }

  }
  BLDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_212C78000, v6, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue]: addDownloadWithPermlink: cancelled download.", (uint8_t *)&v8, 0xCu);
  }

}

void sub_212CC96AC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  v4 = MEMORY[0x2199A44E0](*(_QWORD *)(a1 + 48));
  v5 = (void *)v4;
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);

  objc_msgSend(*(id *)(a1 + 32), "serviceProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_212CC9770;
  v8[3] = &unk_24CE8CD60;
  v7 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v7;
  objc_msgSend(v6, "fetchDownloadFromDownloadID:withReply:", v9, v8);

}

void sub_212CC9770(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[4];
  NSObject *v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
      BLDefaultLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v24 = v9;
        v25 = 2112;
        v26 = v7;
        _os_log_impl(&dword_212C78000, v8, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [DownloadQueue]: resumeDownloadWithID: error issuing a permlink download.  Error: %@", buf, 0x16u);
      }

      objc_msgSend(v5, "downloadID");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(*(id *)(a1 + 32), "serviceProxy");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = sub_212CC99F8;
        v21[3] = &unk_24CE8CC18;
        v22 = v10;
        objc_msgSend(v11, "cancelDownloadWithID:withReply:", v22, v21);

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "serverProgressObserver");
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "storeIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "storePlaylistIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "permlink");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v5, "title");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "collectionTitle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "kind");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v20) = 0;
      -[NSObject sendInitialProgressNotificationForDownloadWithStoreID:storePlaylistID:orPermlink:downloadID:title:collectionTitle:assetKind:isPaused:targetObserver:](v10, "sendInitialProgressNotificationForDownloadWithStoreID:storePlaylistID:orPermlink:downloadID:title:collectionTitle:assetKind:isPaused:targetObserver:", v13, v14, v15, v16, v17, v18, v19, v20, 0);

    }
  }
  else
  {
    BLDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v24 = v12;
      v25 = 2112;
      v26 = v7;
      _os_log_impl(&dword_212C78000, v10, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [DownloadQueue]: error fetching download from downloadID:  %@", buf, 0x16u);
    }
  }

}

void sub_212CC99F8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  BLDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v12 = 138543618;
      v13 = v6;
      v14 = 2112;
      v15 = v3;
      v7 = "(dID=%{public}@) [DownloadQueue]: resumeDownloadWithID: error cancelling download with id: %@";
      v8 = v5;
      v9 = OS_LOG_TYPE_ERROR;
      v10 = 22;
LABEL_6:
      _os_log_impl(&dword_212C78000, v8, v9, v7, (uint8_t *)&v12, v10);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = 138543362;
    v13 = v11;
    v7 = "(dID=%{public}@) [DownloadQueue]: resumeDownloadWithID: cancelled download.";
    v8 = v5;
    v9 = OS_LOG_TYPE_DEFAULT;
    v10 = 12;
    goto LABEL_6;
  }

}

void sub_212CC9D70(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  BLDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v3;
      v6 = "[DownloadQueue]: Error encountered cancelling active downloads: %@";
      v7 = v5;
      v8 = OS_LOG_TYPE_ERROR;
      v9 = 12;
LABEL_6:
      _os_log_impl(&dword_212C78000, v7, v8, v6, (uint8_t *)&v10, v9);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    v6 = "[DownloadQueue]: Finished Cancelling all active book downloads.";
    v7 = v5;
    v8 = OS_LOG_TYPE_DEFAULT;
    v9 = 2;
    goto LABEL_6;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_212CC9FE8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    BLDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_212C78000, v4, OS_LOG_TYPE_ERROR, "[DownloadQueue]: Error encountered preparing BookLibrary for app removal. %@", (uint8_t *)&v5, 0xCu);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void sub_212CCA460(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  BLUIHostServiceNonUI *v5;

  v5 = objc_alloc_init(BLUIHostServiceNonUI);
  if (*(_QWORD *)(a1 + 48))
    v2 = *(void **)(a1 + 48);
  else
    v2 = &unk_24CE8CE68;
  v3 = (void *)MEMORY[0x2199A44E0](v2);
  objc_msgSend(*(id *)(a1 + 32), "serviceProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestDownloadsWithManifestRequest:uiHostProxy:reply:", *(_QWORD *)(a1 + 40), v5, v3);

}

void sub_212CCA8D0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  if (v6)
  {
    BLDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl(&dword_212C78000, v7, OS_LOG_TYPE_ERROR, "[DownloadQueue]: downloadWithMetadata: error issuing a download request with metadata.  Error: %@", buf, 0xCu);
    }

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "serviceProxy");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = sub_212CCAA50;
      v11[3] = &unk_24CE8CC18;
      v12 = v5;
      objc_msgSend(v8, "cancelDownloadWithID:withReply:", v12, v11);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "serverProgressObserver");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v10) = 0;
    objc_msgSend(v9, "sendInitialProgressNotificationForDownloadWithStoreID:storePlaylistID:orPermlink:downloadID:title:collectionTitle:assetKind:isPaused:targetObserver:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, v5, 0, 0, *(_QWORD *)(a1 + 56), v10, 0);

  }
}

void sub_212CCAA50(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  BLDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v12 = 138543618;
      v13 = v6;
      v14 = 2112;
      v15 = v3;
      v7 = "(dID=%{public}@) [DownloadQueue]: resumeDownloadWithID: error cancelling download: %@";
      v8 = v5;
      v9 = OS_LOG_TYPE_ERROR;
      v10 = 22;
LABEL_6:
      _os_log_impl(&dword_212C78000, v8, v9, v7, (uint8_t *)&v12, v10);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = 138543362;
    v13 = v11;
    v7 = "(dID=%{public}@) [DownloadQueue]: resumeDownloadWithID: cancelled download";
    v8 = v5;
    v9 = OS_LOG_TYPE_DEFAULT;
    v10 = 12;
    goto LABEL_6;
  }

}

void sub_212CCAF5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_212C9F864();
  sub_212C9F848(&dword_212C78000, v0, v1, "no streamInfs on masterPlaylist: %@", v2, v3, v4, v5, v6);
  sub_212C9F870();
}

void sub_212CCAFBC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_212C9F864();
  sub_212C9F848(&dword_212C78000, v0, v1, "Unable to parse master HLS Playlist: %@", v2, v3, v4, v5, v6);
  sub_212C9F870();
}

void sub_212CCB01C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_212C9F864();
  sub_212C9F848(&dword_212C78000, v0, v1, "Parsed master HLS Playlist but it had no valid media playlist (error was %@)", v2, v3, v4, v5, v6);
  sub_212C9F870();
}

void sub_212CCB07C(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "statusCode");
  sub_212C9F864();
  sub_212C9F858(&dword_212C78000, a2, v3, "Bad HTTP response when downloading master playlist: %ld", v4);
  sub_212C9F878();
}

void sub_212CCB0F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_212C9F864();
  sub_212C9F848(&dword_212C78000, v0, v1, "Error downloading master playlist: %@", v2, v3, v4, v5, v6);
  sub_212C9F870();
}

uint64_t BUClassAndProtocolCast()
{
  return MEMORY[0x24BE0FBB8]();
}

uint64_t BUDynamicCast()
{
  return MEMORY[0x24BE0FBC0]();
}

uint64_t BUIsGDPRAcknowledgementNeededForBooks()
{
  return MEMORY[0x24BE0FBC8]();
}

uint64_t BUIsRunningTests()
{
  return MEMORY[0x24BE0FBD0]();
}

uint64_t BUStoreIdFromObject()
{
  return MEMORY[0x24BE0FBE0]();
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x24BDAC308](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x24BDAC310](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC318](c, data, *(_QWORD *)&len);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC320](data, *(_QWORD *)&len, md);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC328](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC330](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC338](c, data, *(_QWORD *)&len);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

uint64_t GSMainScreenScaleFactor()
{
  return MEMORY[0x24BE3D610]();
}

uint64_t ICDAAPUtilitiesCreateDataForContainer()
{
  return MEMORY[0x24BEC8520]();
}

uint64_t ICDAAPUtilitiesWriteContainer()
{
  return MEMORY[0x24BEC8528]();
}

uint64_t ICDAAPUtilitiesWriteProperty()
{
  return MEMORY[0x24BEC8530]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete()
{
  return off_24CE89F68();
}

uint64_t operator new()
{
  return off_24CE89F70();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x24BDACB00](dso, description, activity, *(_QWORD *)&flags);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x24BEDCEC0](cls);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x24BDADBA8]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x24BDADD48](data, applier);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x24BDADD90](data);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

dispatch_io_t dispatch_io_create_with_path(dispatch_io_type_t type, const char *path, int oflag, mode_t mode, dispatch_queue_t queue, void *cleanup_handler)
{
  return (dispatch_io_t)MEMORY[0x24BDADE18](type, path, *(_QWORD *)&oflag, mode, queue, cleanup_handler);
}

void dispatch_io_read(dispatch_io_t channel, off_t offset, size_t length, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
  MEMORY[0x24BDADE28](channel, offset, length, queue, io_handler);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x24BDADF60](object, queue);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int flock(int a1, int a2)
{
  return MEMORY[0x24BDAE3B0](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x24BEDD0F8](to, from);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x24BEDD468](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
{
  MEMORY[0x24BDAF290](activity, block);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0040](__str, __endptr, *(_QWORD *)&__base);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

void xmlFreeDoc(xmlDocPtr cur)
{
  MEMORY[0x24BEDE760](cur);
}

void xmlFreeTextReader(xmlTextReaderPtr reader)
{
  MEMORY[0x24BEDE7A8](reader);
}

xmlChar *__cdecl xmlGetProp(const xmlNode *node, const xmlChar *name)
{
  return (xmlChar *)MEMORY[0x24BEDE828](node, name);
}

xmlTextReaderPtr xmlNewTextReaderFilename(const char *URI)
{
  return (xmlTextReaderPtr)MEMORY[0x24BEDE9F0](URI);
}

xmlDocPtr xmlReadMemory(const char *buffer, int size, const char *URL, const char *encoding, int options)
{
  return (xmlDocPtr)MEMORY[0x24BEDEB00](buffer, *(_QWORD *)&size, URL, encoding, *(_QWORD *)&options);
}

int xmlStrEqual(const xmlChar *str1, const xmlChar *str2)
{
  return MEMORY[0x24BEDEC28](str1, str2);
}

const xmlChar *__cdecl xmlTextReaderConstLocalName(xmlTextReaderPtr reader)
{
  return (const xmlChar *)MEMORY[0x24BEDECB8](reader);
}

const xmlChar *__cdecl xmlTextReaderConstNamespaceUri(xmlTextReaderPtr reader)
{
  return (const xmlChar *)MEMORY[0x24BEDECC0](reader);
}

int xmlTextReaderDepth(xmlTextReaderPtr reader)
{
  return MEMORY[0x24BEDECC8](reader);
}

xmlChar *__cdecl xmlTextReaderGetAttribute(xmlTextReaderPtr reader, const xmlChar *name)
{
  return (xmlChar *)MEMORY[0x24BEDECD8](reader, name);
}

int xmlTextReaderNodeType(xmlTextReaderPtr reader)
{
  return MEMORY[0x24BEDED00](reader);
}

int xmlTextReaderRead(xmlTextReaderPtr reader)
{
  return MEMORY[0x24BEDED08](reader);
}

xmlChar *__cdecl xmlTextReaderReadInnerXml(xmlTextReaderPtr reader)
{
  return (xmlChar *)MEMORY[0x24BEDED10](reader);
}

xmlChar *__cdecl xmlTextReaderReadString(xmlTextReaderPtr reader)
{
  return (xmlChar *)MEMORY[0x24BEDED18](reader);
}

xmlXPathObjectPtr xmlXPathEvalExpression(const xmlChar *str, xmlXPathContextPtr ctxt)
{
  return (xmlXPathObjectPtr)MEMORY[0x24BEDEED0](str, ctxt);
}

void xmlXPathFreeContext(xmlXPathContextPtr ctxt)
{
  MEMORY[0x24BEDEEE8](ctxt);
}

void xmlXPathFreeObject(xmlXPathObjectPtr obj)
{
  MEMORY[0x24BEDEEF8](obj);
}

xmlXPathContextPtr xmlXPathNewContext(xmlDocPtr doc)
{
  return (xmlXPathContextPtr)MEMORY[0x24BEDEF58](doc);
}

int xmlXPathRegisterNs(xmlXPathContextPtr ctxt, const xmlChar *prefix, const xmlChar *ns_uri)
{
  return MEMORY[0x24BEDF038](ctxt, prefix, ns_uri);
}

