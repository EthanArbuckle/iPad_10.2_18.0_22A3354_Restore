@implementation LiveFSFPExtensionHelper

- (LiveFSFPExtensionHelper)init
{
  void *v2;
  NSObject *v4;
  NSObject *v5;
  NSURL *docPath;
  NSString *providerName;
  void *v8;
  void *v9;
  __CFString *v10;
  LiveFSFPExtensionHelper *v11;
  NSObject *v12;
  NSURL *v13;
  NSString *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  LiveFSClient *manager;
  uint64_t v19;
  NSMapTable *itemHandleMap;
  uint64_t v21;
  NSMapTable *itemIDMap;
  uint64_t v23;
  NSMapTable *enumerators;
  uint64_t v25;
  LiveFSLRUCache *itemCache;
  uint64_t v27;
  LiveFSVolumeClient *serviceClient;
  dispatch_queue_t v29;
  OS_dispatch_queue *renameUpdateQueue;
  NSURL *v31;
  NSXPCConnection *conn;
  NSURL *v33;
  NSURL *v34;
  LiveFSThumbnailsServiceSource *v35;
  LiveFSThumbnailsServiceSource *thumbnailsServiceSource;
  dispatch_queue_t v37;
  OS_dispatch_queue *enumeratorHelperQueue;
  NSObject *v39;
  LiveFSFPExtensionHelper *v40;
  NSObject *v41;
  objc_super v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  NSURL *v47;
  __int16 v48;
  NSString *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  __CFString *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  livefs_std_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v45 = "-[LiveFSFPExtensionHelper init]";
    _os_log_impl(&dword_21F8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s starting", buf, 0xCu);
  }

  livefs_std_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    docPath = self->_docPath;
    providerName = self->providerName;
    -[NSFileProviderExtension domain](self, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSFileProviderExtension domain](self, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[NSFileProviderExtension domain](self, "domain");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "identifier");
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = &stru_24E46BB18;
    }
    *(_DWORD *)buf = 136316162;
    v45 = "-[LiveFSFPExtensionHelper init]";
    v46 = 2112;
    v47 = docPath;
    v48 = 2112;
    v49 = providerName;
    v50 = 2112;
    v51 = v8;
    v52 = 2112;
    v53 = v10;
    _os_log_impl(&dword_21F8A5000, v5, OS_LOG_TYPE_INFO, "%s starting for docpath %@, providerName %@, domain: %@, identifier; %@",
      buf,
      0x34u);
    if (v9)
    {

    }
  }

  v43.receiver = self;
  v43.super_class = (Class)LiveFSFPExtensionHelper;
  v11 = -[NSFileProviderExtension init](&v43, sel_init);
  if (!v11)
    goto LABEL_26;
  livefs_std_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = v11->_docPath;
    v14 = v11->providerName;
    -[NSFileProviderExtension domain](v11, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSFileProviderExtension domain](v11, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[NSFileProviderExtension domain](v11, "domain");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "identifier");
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = &stru_24E46BB18;
    }
    *(_DWORD *)buf = 136316162;
    v45 = "-[LiveFSFPExtensionHelper init]";
    v46 = 2112;
    v47 = v13;
    v48 = 2112;
    v49 = v14;
    v50 = 2112;
    v51 = v15;
    v52 = 2112;
    v53 = v17;
    _os_log_impl(&dword_21F8A5000, v12, OS_LOG_TYPE_INFO, "%s starting for docpath %@, providerName %@, domain: %@, identifier; %@",
      buf,
      0x34u);
    if (v16)
    {

    }
  }

  manager = v11->_manager;
  v11->_manager = 0;

  objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
  v19 = objc_claimAutoreleasedReturnValue();
  itemHandleMap = v11->itemHandleMap;
  v11->itemHandleMap = (NSMapTable *)v19;

  objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
  v21 = objc_claimAutoreleasedReturnValue();
  itemIDMap = v11->itemIDMap;
  v11->itemIDMap = (NSMapTable *)v21;

  objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
  v23 = objc_claimAutoreleasedReturnValue();
  enumerators = v11->enumerators;
  v11->enumerators = (NSMapTable *)v23;

  v25 = objc_opt_new();
  itemCache = v11->itemCache;
  v11->itemCache = (LiveFSLRUCache *)v25;

  v27 = objc_opt_new();
  serviceClient = v11->_serviceClient;
  v11->_serviceClient = (LiveFSVolumeClient *)v27;

  v29 = dispatch_queue_create("com.apple.userfsfp.rename_queue", 0);
  renameUpdateQueue = v11->renameUpdateQueue;
  v11->renameUpdateQueue = (OS_dispatch_queue *)v29;

  if (v11->itemHandleMap && v11->itemCache && v11->_serviceClient && v11->itemIDMap && v11->enumerators)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/private/var/mobile/Library/LiveFiles"));
    v31 = (NSURL *)(id)objc_claimAutoreleasedReturnValue();
    conn = v11->_conn;
    v11->_conn = 0;

    -[LiveFSLRUCache setCountLimit:](v11->itemCache, "setCountLimit:", 128);
    v33 = v11->_docPath;
    v11->_docPath = v31;
    v34 = v31;

    v11->_supportsTagging = 0;
    v11->_isDead = 0;
    v35 = -[LiveFSThumbnailsServiceSource initWithFileProviderExtension:]([LiveFSThumbnailsServiceSource alloc], "initWithFileProviderExtension:", v11);
    thumbnailsServiceSource = v11->thumbnailsServiceSource;
    v11->thumbnailsServiceSource = v35;

    v37 = dispatch_queue_create("com.apple.LiveFSFPEnumeratorHelperQueue", 0);
    enumeratorHelperQueue = v11->_enumeratorHelperQueue;
    v11->_enumeratorHelperQueue = (OS_dispatch_queue *)v37;

    livefs_std_log();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v45 = "-[LiveFSFPExtensionHelper init]";
      _os_log_impl(&dword_21F8A5000, v39, OS_LOG_TYPE_DEFAULT, "%s done", buf, 0xCu);
    }

LABEL_26:
    v40 = v11;
    goto LABEL_30;
  }
  livefs_std_log();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    -[LiveFSFPExtensionHelper init].cold.1();

  v40 = 0;
LABEL_30:

  return v40;
}

- (BOOL)serverSearchUsesCS
{
  return 0;
}

- (BOOL)supportsTrash
{
  return 0;
}

- (id)ensureMountPathSetup
{
  void *v2;
  LiveFSFPExtensionHelper *v3;
  void *v4;
  NSObject *v5;
  NSURL *docPath;
  NSString *providerName;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSURL *mountPath;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSString *clusterMasterID;
  NSObject *v27;
  const __CFString *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  int v36;
  const char *v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  __CFString *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v3 = self;
  objc_sync_enter(v3);
  if (!v3->_mountPath)
  {
    livefs_std_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      docPath = v3->_docPath;
      providerName = v3->providerName;
      -[NSFileProviderExtension domain](v3, "domain");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[NSFileProviderExtension domain](v3, "domain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[NSFileProviderExtension domain](v3, "domain");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "identifier");
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = CFSTR("N/A");
      }
      v36 = 136316162;
      v37 = "-[LiveFSFPExtensionHelper ensureMountPathSetup]";
      v38 = 2112;
      v39 = (const __CFString *)docPath;
      v40 = 2112;
      v41 = (const __CFString *)providerName;
      v42 = 2112;
      v43 = v8;
      v44 = 2112;
      v45 = v10;
      _os_log_impl(&dword_21F8A5000, v5, OS_LOG_TYPE_INFO, "%s starting for docpath %@, providerName %@, domain: %@, identifier: %@", (uint8_t *)&v36, 0x34u);
      if (v9)
      {

      }
    }

    if (!v3->_docPath)
      goto LABEL_18;
    if (!v3->providerName)
      goto LABEL_18;
    -[NSFileProviderExtension domain](v3, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
      goto LABEL_18;
    -[NSFileProviderExtension domain](v3, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 == 0;

    if (v14)
    {
LABEL_18:
      livefs_std_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        if (v3->_docPath)
          v29 = &stru_24E46BB18;
        else
          v29 = CFSTR("doc path, ");
        if (v3->providerName)
          v30 = &stru_24E46BB18;
        else
          v30 = CFSTR("provider name, ");
        -[NSFileProviderExtension domain](v3, "domain");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
          v32 = &stru_24E46BB18;
        else
          v32 = CFSTR("domain, ");
        -[NSFileProviderExtension domain](v3, "domain");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "identifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = "-[LiveFSFPExtensionHelper ensureMountPathSetup]";
        v35 = CFSTR("domain identifier");
        v36 = 136316162;
        if (v34)
          v35 = &stru_24E46BB18;
        v38 = 2112;
        v39 = v29;
        v40 = 2112;
        v41 = v30;
        v42 = 2112;
        v43 = v32;
        v44 = 2112;
        v45 = (__CFString *)v35;
        _os_log_error_impl(&dword_21F8A5000, v27, OS_LOG_TYPE_ERROR, "%s - Missing %@%@%@%@", (uint8_t *)&v36, 0x34u);

      }
      +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", 22);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      goto LABEL_20;
    }
    -[NSURL URLByAppendingPathComponent:isDirectory:](v3->_docPath, "URLByAppendingPathComponent:isDirectory:", v3->providerName, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSFileProviderExtension domain](v3, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "URLByAppendingPathComponent:isDirectory:", v17, 1);
    v18 = objc_claimAutoreleasedReturnValue();
    mountPath = v3->_mountPath;
    v3->_mountPath = (NSURL *)v18;

    if (v3->_clusterDomain)
    {
      -[NSFileProviderExtension domain](v3, "domain");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (unint64_t)objc_msgSend(v21, "length") > 6;

      if (!v22)
      {
        v4 = 0;
        v3->_clusterMaster = 1;
        goto LABEL_20;
      }
      v3->_clusterMaster = 0;
      -[NSFileProviderExtension domain](v3, "domain");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "substringToIndex:", 6);
      v25 = objc_claimAutoreleasedReturnValue();
      clusterMasterID = v3->_clusterMasterID;
      v3->_clusterMasterID = (NSString *)v25;

    }
    v4 = 0;
LABEL_20:

    goto LABEL_21;
  }
  v4 = 0;
LABEL_21:
  objc_sync_exit(v3);

  return v4;
}

- (NSURL)mountPath
{
  return self->_mountPath;
}

- (void)getVolumeInfoLocked
{
  NSXPCConnection *conn;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[12];
  _QWORD v8[6];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
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

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v20 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2810000000;
  conn = self->_conn;
  v4 = MEMORY[0x24BDAC760];
  v13 = &unk_21F8C7243;
  v14 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__LiveFSFPExtensionHelper_getVolumeInfoLocked__block_invoke;
  v9[3] = &unk_24E46B180;
  v9[4] = &v15;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](conn, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __46__LiveFSFPExtensionHelper_getVolumeInfoLocked__block_invoke_2;
  v8[3] = &unk_24E46B270;
  v8[4] = &v15;
  v8[5] = &v21;
  objc_msgSend(v5, "getRootFileHandleWithError:", v8);
  if (v22[5])
  {
    if (!v16[5])
    {
      v7[6] = v4;
      v7[7] = 3221225472;
      v7[8] = __46__LiveFSFPExtensionHelper_getVolumeInfoLocked__block_invoke_3;
      v7[9] = &unk_24E46B298;
      v7[10] = &v10;
      v7[11] = &v15;
      objc_msgSend(v5, "otherAttributeOf:named:requestID:reply:");
      if (!v16[5])
      {
        self->_idsPersist = v11[4] & 1;
        v6 = v22[5];
        v7[0] = v4;
        v7[1] = 3221225472;
        v7[2] = __46__LiveFSFPExtensionHelper_getVolumeInfoLocked__block_invoke_4;
        v7[3] = &unk_24E46B298;
        v7[4] = &v10;
        v7[5] = &v15;
        objc_msgSend(v5, "otherAttributeOf:named:requestID:reply:", v6, CFSTR("_N_mntflags"), -1, v7);
        if (!v16[5])
        {
          self->_isReadOnlyVolume = v11[4] & 1;
          self->_supportsTagging = 1;
        }
      }
    }
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
}

void __46__LiveFSFPExtensionHelper_getVolumeInfoLocked__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __46__LiveFSFPExtensionHelper_getVolumeInfoLocked__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __46__LiveFSFPExtensionHelper_getVolumeInfoLocked__block_invoke_3(uint64_t a1, uint64_t a2, id a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  if ((_DWORD)a2)
  {
    +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", a2);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  else
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    *(_QWORD *)(v7 + 32) = *(_QWORD *)objc_msgSend(objc_retainAutorelease(a3), "bytes");
  }
}

void __46__LiveFSFPExtensionHelper_getVolumeInfoLocked__block_invoke_4(uint64_t a1, uint64_t a2, id a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  if ((_DWORD)a2)
  {
    +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", a2);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  else
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    *(_QWORD *)(v7 + 32) = *(_QWORD *)objc_msgSend(objc_retainAutorelease(a3), "bytes");
  }
}

- (void)refreshVolumeInfo
{
  LiveFSFPExtensionHelper *obj;

  obj = self;
  objc_sync_enter(obj);
  -[LiveFSFPExtensionHelper getVolumeInfoLocked](obj, "getVolumeInfoLocked");
  objc_sync_exit(obj);

}

- (id)itemPathForURL:(id)a3
{
  void *v3;
  void *v5;
  NSObject *v6;
  NSURL *docPath;
  NSString *providerName;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  char *v16;
  NSObject *v17;
  __CFString *v18;
  void *v19;
  uint64_t v20;
  __CFString *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  int v27;
  const char *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  NSURL *v32;
  __int16 v33;
  NSString *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  __CFString *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "standardizedURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  livefs_std_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    docPath = self->_docPath;
    providerName = self->providerName;
    -[NSFileProviderExtension domain](self, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSFileProviderExtension domain](self, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[NSFileProviderExtension domain](self, "domain");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "identifier");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = &stru_24E46BB18;
    }
    v27 = 136316418;
    v28 = "-[LiveFSFPExtensionHelper itemPathForURL:]";
    v29 = 2112;
    v30 = v5;
    v31 = 2112;
    v32 = docPath;
    v33 = 2112;
    v34 = providerName;
    v35 = 2112;
    v36 = v9;
    v37 = 2112;
    v38 = v11;
    _os_log_impl(&dword_21F8A5000, v6, OS_LOG_TYPE_INFO, "%s starting for url %@, docpath %@, providerName %@, domain: %@, identifier; %@",
      (uint8_t *)&v27,
      0x3Eu);
    if (v10)
    {

    }
  }

  v12 = 0;
  if (-[LiveFSFPExtensionHelper _isLoggedInOrError:](self, "_isLoggedInOrError:", 0))
  {
    -[NSURL URLByAppendingPathComponent:isDirectory:](self->_docPath, "URLByAppendingPathComponent:isDirectory:", self->providerName, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSFileProviderExtension domain](self, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pathRelativeToDocumentStorage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URLByAppendingPathComponent:isDirectory:", v15, 1);
    v16 = (char *)objc_claimAutoreleasedReturnValue();

    livefs_std_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v27 = 138412290;
      v28 = v16;
      _os_log_impl(&dword_21F8A5000, v17, OS_LOG_TYPE_INFO, "perItemDirectory: %@", (uint8_t *)&v27, 0xCu);
    }

    objc_msgSend(v16, "path");
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "hasPrefix:", CFSTR("/var/mobile")))
    {
      objc_msgSend(CFSTR("/private"), "stringByAppendingString:", v19);
      v20 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v20;
    }
    if ((objc_msgSend(v19, "hasPrefix:", v18) & 1) != 0)
    {
      objc_msgSend(v19, "substringFromIndex:", -[__CFString length](v18, "length"));
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if ((-[__CFString isEqualToString:](v21, "isEqualToString:", &stru_24E46BB18) & 1) != 0
        || -[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("/._")))
      {
        livefs_std_log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          -[LiveFSFPExtensionHelper itemPathForURL:].cold.1();

        v12 = &stru_24E46BB18;
        v18 = v21;
      }
      else
      {
        if (-[__CFString hasPrefix:](v21, "hasPrefix:", CFSTR("/")))
        {
          -[__CFString substringFromIndex:](v21, "substringFromIndex:", 1);
          v24 = objc_claimAutoreleasedReturnValue();

          v21 = (__CFString *)v24;
        }
        livefs_std_log();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          -[LiveFSFPExtensionHelper itemPathForURL:].cold.2();

        v18 = v21;
        v12 = v18;
      }
    }
    else
    {
      livefs_std_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[LiveFSFPExtensionHelper itemPathForURL:].cold.3((uint64_t)v19);

      v12 = 0;
    }

  }
  return v12;
}

- (id)itemForPath:(id)a3 cachedOnly:(BOOL)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  LiveFSFPExtensionHelper *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  -[LiveFSFPExtensionHelper ensureMountPathSetup](self, "ensureMountPathSetup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
    livefs_std_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[LiveFSFPExtensionHelper itemForPath:cachedOnly:error:].cold.1();

    v12 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v10);
  }
  else
  {
    v10 = self;
    objc_sync_enter(v10);
    if (-[LiveFSFPExtensionHelper _isLoggedInOrErrorLocked:](v10, "_isLoggedInOrErrorLocked:", 0))
    {
      livefs_std_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138412290;
        v20 = v7;
        _os_log_impl(&dword_21F8A5000, v13, OS_LOG_TYPE_DEFAULT, "perItemPath is '%@'", (uint8_t *)&v19, 0xCu);
      }

      if ((objc_msgSend(v7, "isEqualToString:", &stru_24E46BB18) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("._")) & 1) != 0
        || objc_msgSend(v7, "isEqualToString:", CFSTR("/._")))
      {
        livefs_std_log();
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        v16 = (void *)*MEMORY[0x24BDC8228];
        if (v15)
        {
          v19 = 138412290;
          v20 = v16;
          _os_log_impl(&dword_21F8A5000, v14, OS_LOG_TYPE_DEFAULT, "About to return ID %@", (uint8_t *)&v19, 0xCu);
        }

        -[LiveFSFPExtensionHelper itemForIdentifierLocked:error:](v10, "itemForIdentifierLocked:error:", v16, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[LiveFSFPExtensionHelper itemForIdentifierLocked:error:](v10, "itemForIdentifierLocked:error:", *MEMORY[0x24BDC8228], 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[LiveFSFPExtensionHelper itemAtPathLocked:parent:](v10, "itemAtPathLocked:parent:", v7, v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v12 = 0;
    }
    objc_sync_exit(v10);
  }

  return v12;
}

- (id)itemForURL:(id)a3 cachedOnly:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v5;
  void *v7;
  void *v8;

  v5 = a4;
  -[LiveFSFPExtensionHelper itemPathForURL:](self, "itemPathForURL:", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[LiveFSFPExtensionHelper itemForPath:cachedOnly:error:](self, "itemForPath:cachedOnly:error:", v7, v5, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)itemForURL:(id)a3 error:(id *)a4
{
  return -[LiveFSFPExtensionHelper itemForURL:cachedOnly:error:](self, "itemForURL:cachedOnly:error:", a3, 0, a4);
}

- (id)fileProviderErrorFromFSError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  id v15;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v12 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v4, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDD0B88]))
  {

    goto LABEL_11;
  }
  v7 = objc_msgSend(v5, "code");

  if (v7 != 516)
  {
LABEL_11:
    objc_msgSend(v5, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BDD1128]);

    if (v14)
    {
      +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", objc_msgSend(v5, "code"));
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = v5;
    }
    v12 = v15;
    goto LABEL_19;
  }
  objc_msgSend(v5, "fp_collidingURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[LiveFSFPExtensionHelper itemForURL:error:](self, "itemForURL:error:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    livefs_std_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v17 = 136315906;
      v18 = "-[LiveFSFPExtensionHelper fileProviderErrorFromFSError:]";
      v19 = 2112;
      v20 = v5;
      v21 = 2112;
      v22 = v8;
      v23 = 2112;
      v24 = v9;
      _os_log_error_impl(&dword_21F8A5000, v10, OS_LOG_TYPE_ERROR, "%s: got error %@, URL %@, item %@", (uint8_t *)&v17, 0x2Au);
    }

    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "fileProviderErrorForCollisionWithItem:", v9);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = v5;
    }
    v12 = v11;

  }
  else
  {
    v12 = v5;
  }

LABEL_19:
  return v12;
}

- (void)handleInterruption
{
  OUTLINED_FUNCTION_2_0(&dword_21F8A5000, a1, a3, "%s called", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)handleInvalidation
{
  OUTLINED_FUNCTION_2_0(&dword_21F8A5000, a1, a3, "%s called", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)invalidate
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_21F8A5000, a2, v5, "extension invalidate called on %@", v6);

  OUTLINED_FUNCTION_12();
}

- (void)dispatchOntoRenameQueue:(id)a3
{
  dispatch_async((dispatch_queue_t)self->renameUpdateQueue, a3);
}

- (BOOL)_hasManagerOrError:(id *)a3
{
  NSObject *v4;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  LiveFSClient *v10;
  LiveFSClient *manager;
  uint8_t v12[16];

  if (self->_isDead)
  {
    if (a3)
    {
      getNSErrorFromLiveFSErrno();
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    livefs_std_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_21F8A5000, v4, OS_LOG_TYPE_INFO, "Call to _hasManagerOrError after extension torn down", v12, 2u);
    }
LABEL_6:

    return 0;
  }
  if (!self->_manager)
  {
    livefs_std_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[LiveFSFPExtensionHelper _hasManagerOrError:].cold.2(v7, v8, v9);

    v10 = (LiveFSClient *)objc_msgSend(MEMORY[0x24BE60428], "newConnectionForService:", self->connectionURL);
    manager = self->_manager;
    self->_manager = v10;

    if (!self->_manager)
    {
      if (a3)
      {
        getNSErrorFromLiveFSErrno();
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      livefs_std_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        -[LiveFSFPExtensionHelper _hasManagerOrError:].cold.1();
      goto LABEL_6;
    }
  }
  return 1;
}

- (id)getVolumeManagerWithError:(id *)a3
{
  LiveFSClient *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (-[LiveFSFPExtensionHelper _hasManagerOrError:](self, "_hasManagerOrError:"))
  {
    v5 = self->_manager;
  }
  else
  {
    livefs_std_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[LiveFSFPExtensionHelper getVolumeManagerWithError:].cold.1((uint64_t)a3, v6, v7, v8, v9, v10, v11, v12);

    v5 = 0;
  }
  return v5;
}

- (id)makeVolumeListenerEndpointAndReturnErrorLocked:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  LiveFSClient *manager;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  LiveFSClient *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  if (!-[LiveFSFPExtensionHelper _hasManagerOrError:](self, "_hasManagerOrError:"))
  {
LABEL_20:
    v18 = 0;
    v17 = 0;
    goto LABEL_21;
  }
  -[NSFileProviderExtension domain](self, "domain");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_13;
  v6 = (void *)v5;
  -[NSFileProviderExtension domain](self, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {

    goto LABEL_13;
  }
  v9 = (void *)v8;
  -[NSFileProviderExtension domain](self, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", &stru_24E46BB18);

  if (v12)
  {
LABEL_13:
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC81B0], -1004, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      livefs_std_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[LiveFSFPExtensionHelper makeVolumeListenerEndpointAndReturnErrorLocked:].cold.1();

    }
    if (a3)
      *a3 = objc_retainAutorelease(v22);

    goto LABEL_20;
  }
  livefs_std_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[NSFileProviderExtension domain](self, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v43 = "-[LiveFSFPExtensionHelper makeVolumeListenerEndpointAndReturnErrorLocked:]";
    v44 = 2112;
    v45 = v15;
    _os_log_impl(&dword_21F8A5000, v13, OS_LOG_TYPE_DEFAULT, "%s: About to get listener for volume %@", buf, 0x16u);

  }
  manager = self->_manager;
  v41 = 0;
  -[LiveFSClient volumes:](manager, "volumes:", &v41);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v41;
  livefs_std_log();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v18)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[LiveFSFPExtensionHelper makeVolumeListenerEndpointAndReturnErrorLocked:].cold.4();

    v21 = v18;
    livefs_std_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[LiveFSFPExtensionHelper makeVolumeListenerEndpointAndReturnErrorLocked:].cold.1();
  }
  else if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v43 = "-[LiveFSFPExtensionHelper makeVolumeListenerEndpointAndReturnErrorLocked:]";
    v44 = 2112;
    v45 = v17;
    v46 = 2112;
    v47 = 0;
    _os_log_impl(&dword_21F8A5000, v20, OS_LOG_TYPE_DEFAULT, "%s: got vols %@ error %@", buf, 0x20u);
  }

  if (a3)
    *a3 = objc_retainAutorelease(v18);

  if (v17)
  {
    if (objc_msgSend(v17, "count"))
    {
      -[NSFileProviderExtension domain](self, "domain");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "identifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKey:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        v29 = self->_manager;
        -[NSFileProviderExtension domain](self, "domain");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "identifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[LiveFSClient listenerForVolume:error:](v29, "listenerForVolume:error:", v31, a3);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_22;
      }
      livefs_std_log();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        -[LiveFSFPExtensionHelper makeVolumeListenerEndpointAndReturnErrorLocked:].cold.2(v33, v34, v35, v36, v37, v38, v39, v40);

      if (a3)
      {
        v32 = 2;
        goto LABEL_37;
      }
    }
    else if (a3)
    {
      v32 = 65;
LABEL_37:
      +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", v32);
      v24 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
  }
LABEL_21:
  v24 = 0;
LABEL_22:

  return v24;
}

- (id)makeVolumeListenerEndpointAndReturnError:(id *)a3
{
  LiveFSFPExtensionHelper *v4;
  void *v5;

  v4 = self;
  objc_sync_enter(v4);
  -[LiveFSFPExtensionHelper makeVolumeListenerEndpointAndReturnErrorLocked:](v4, "makeVolumeListenerEndpointAndReturnErrorLocked:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v4);

  return v5;
}

- (BOOL)_isLoggedInOrErrorLocked:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  _BOOL4 isDead;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  NSXPCConnection *v21;
  NSXPCConnection *conn;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  NSXPCConnection *v26;
  void *v27;
  NSXPCConnection *v28;
  void *v29;
  NSXPCConnection *v30;
  uint64_t v31;
  NSXPCConnection *v32;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t);
  void *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id buf[2];

  -[NSFileProviderExtension domain](self, "domain");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_8;
  v6 = (void *)v5;
  -[NSFileProviderExtension domain](self, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {

    goto LABEL_8;
  }
  v9 = (void *)v8;
  -[NSFileProviderExtension domain](self, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", &stru_24E46BB18);

  if (v12)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC81B0], -1004, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
LABEL_12:
      if (a3)
        *a3 = objc_retainAutorelease(v14);

      LOBYTE(v16) = 0;
      return v16;
    }
    livefs_std_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[LiveFSFPExtensionHelper _isLoggedInOrErrorLocked:].cold.1();
LABEL_11:

    goto LABEL_12;
  }
  if (self->_conn)
  {
    livefs_std_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[LiveFSFPExtensionHelper _isLoggedInOrErrorLocked:].cold.6(self, v13);
LABEL_19:

    if (a3)
      *a3 = 0;
LABEL_21:
    LOBYTE(v16) = 1;
    return v16;
  }
  if (self->_clusterMaster)
  {
    livefs_std_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[LiveFSFPExtensionHelper _isLoggedInOrErrorLocked:].cold.5(self, v13);
    goto LABEL_19;
  }
  isDead = self->_isDead;
  livefs_std_log();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (isDead)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_21F8A5000, v19, OS_LOG_TYPE_INFO, "isLoggedInOrError called on dead extension", (uint8_t *)buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC81B0], -1004, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
      goto LABEL_12;
    livefs_std_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[LiveFSFPExtensionHelper _isLoggedInOrErrorLocked:].cold.1();
    goto LABEL_11;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[LiveFSFPExtensionHelper _isLoggedInOrErrorLocked:].cold.3(self, v19);

  -[LiveFSFPExtensionHelper makeVolumeListenerEndpointAndReturnError:](self, "makeVolumeListenerEndpointAndReturnError:", a3);
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v20 = (void *)v16;
    v21 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithListenerEndpoint:", v16);
    conn = self->_conn;
    self->_conn = v21;

    livefs_std_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[LiveFSFPExtensionHelper _isLoggedInOrErrorLocked:].cold.2(v23, v24, v25);

    v26 = self->_conn;
    objc_msgSend(MEMORY[0x24BE60428], "interfaceForListeners");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v26, "setRemoteObjectInterface:", v27);

    v28 = self->_conn;
    objc_msgSend(MEMORY[0x24BE60468], "exportedClientInterface");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v28, "setExportedInterface:", v29);

    -[NSXPCConnection setExportedObject:](self->_conn, "setExportedObject:", self->_serviceClient);
    objc_initWeak(buf, self);
    v30 = self->_conn;
    v31 = MEMORY[0x24BDAC760];
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __52__LiveFSFPExtensionHelper__isLoggedInOrErrorLocked___block_invoke;
    v39[3] = &unk_24E46B2E8;
    objc_copyWeak(&v40, buf);
    -[NSXPCConnection setInterruptionHandler:](v30, "setInterruptionHandler:", v39);
    v32 = self->_conn;
    v34 = v31;
    v35 = 3221225472;
    v36 = __52__LiveFSFPExtensionHelper__isLoggedInOrErrorLocked___block_invoke_3;
    v37 = &unk_24E46B2E8;
    objc_copyWeak(&v38, buf);
    -[NSXPCConnection setInvalidationHandler:](v32, "setInvalidationHandler:", &v34);
    -[NSXPCConnection resume](self->_conn, "resume", v34, v35, v36, v37);
    -[LiveFSFPExtensionHelper getVolumeInfoLocked](self, "getVolumeInfoLocked");
    if (a3)
      *a3 = 0;
    objc_destroyWeak(&v38);
    objc_destroyWeak(&v40);
    objc_destroyWeak(buf);

    goto LABEL_21;
  }
  return v16;
}

void __52__LiveFSFPExtensionHelper__isLoggedInOrErrorLocked___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_get_global_queue(2, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __52__LiveFSFPExtensionHelper__isLoggedInOrErrorLocked___block_invoke_2;
    block[3] = &unk_24E46B2C0;
    block[4] = WeakRetained;
    dispatch_async(v2, block);

  }
}

uint64_t __52__LiveFSFPExtensionHelper__isLoggedInOrErrorLocked___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleInterruption");
}

void __52__LiveFSFPExtensionHelper__isLoggedInOrErrorLocked___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_get_global_queue(2, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __52__LiveFSFPExtensionHelper__isLoggedInOrErrorLocked___block_invoke_4;
    block[3] = &unk_24E46B2C0;
    block[4] = WeakRetained;
    dispatch_async(v2, block);

  }
}

uint64_t __52__LiveFSFPExtensionHelper__isLoggedInOrErrorLocked___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleInvalidation");
}

- (BOOL)_isLoggedInOrError:(id *)a3
{
  LiveFSFPExtensionHelper *v4;

  v4 = self;
  objc_sync_enter(v4);
  LOBYTE(a3) = -[LiveFSFPExtensionHelper _isLoggedInOrErrorLocked:](v4, "_isLoggedInOrErrorLocked:", a3);
  objc_sync_exit(v4);

  return (char)a3;
}

- (id)pathForInodeID:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  NSXPCConnection *conn;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  id v28;
  NSObject *v29;
  _QWORD v31[4];
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  _QWORD v35[5];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__0;
  v46 = __Block_byref_object_dispose__0;
  v47 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__0;
  v40 = __Block_byref_object_dispose__0;
  v41 = 0;
  if ((unint64_t)objc_msgSend(v6, "length") <= 0xC)
  {
    +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", 22);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v43[5];
    v43[5] = v7;

    v9 = (id)v43[5];
    if (v9)
    {
      livefs_std_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[LiveFSFPExtensionHelper pathForInodeID:error:].cold.1();

    }
    if (a4)
    {
      v9 = objc_retainAutorelease(v9);
      v11 = 0;
      *a4 = v9;
      goto LABEL_29;
    }
LABEL_26:
    v11 = 0;
    goto LABEL_29;
  }
  objc_msgSend(v6, "substringToIndex:", 12);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v9, 0);
  if (!v12)
  {
    livefs_std_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v49 = v6;
      _os_log_impl(&dword_21F8A5000, v25, OS_LOG_TYPE_INFO, "pathForInodeID given invalid ID %@", buf, 0xCu);
    }

    +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", 22);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v43[5];
    v43[5] = v26;

    v28 = (id)v43[5];
    if (v28)
    {
      livefs_std_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[LiveFSFPExtensionHelper pathForInodeID:error:].cold.1();

    }
    if (a4)
      *a4 = objc_retainAutorelease(v28);

    goto LABEL_26;
  }
  v13 = objc_retainAutorelease(v12);
  v14 = (_QWORD *)objc_msgSend(v13, "bytes");
  v15 = *v14;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  livefs_std_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v49 = v9;
    v50 = 2112;
    v51 = v13;
    v52 = 2048;
    v53 = v15;
    v54 = 2112;
    v55 = v16;
    _os_log_impl(&dword_21F8A5000, v17, OS_LOG_TYPE_DEFAULT, "pathForID got base64 %@, parentData %@, number %llu, number %@", buf, 0x2Au);
  }

  conn = self->_conn;
  v19 = MEMORY[0x24BDAC760];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __48__LiveFSFPExtensionHelper_pathForInodeID_error___block_invoke;
  v35[3] = &unk_24E46B180;
  v35[4] = &v42;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](conn, "synchronousRemoteObjectProxyWithErrorHandler:", v35);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v19;
  v31[1] = 3221225472;
  v31[2] = __48__LiveFSFPExtensionHelper_pathForInodeID_error___block_invoke_2;
  v31[3] = &unk_24E46B310;
  v33 = &v42;
  v21 = v16;
  v32 = v21;
  v34 = &v36;
  objc_msgSend(v20, "pathsAndAttributesForItemsByIDs:requestID:reply:", v13, -1, v31);
  v22 = (void *)v43[5];
  if (v22)
  {
    v23 = v22;
    livefs_std_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[LiveFSFPExtensionHelper pathForInodeID:error:].cold.1();

    if (a4)
      *a4 = objc_retainAutorelease(v23);

    v11 = 0;
  }
  else
  {
    v11 = (id)v37[5];
  }

  v9 = v20;
LABEL_29:

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  return v11;
}

void __48__LiveFSFPExtensionHelper_pathForInodeID_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __48__LiveFSFPExtensionHelper_pathForInodeID_error___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _DWORD v13[2];
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  livefs_std_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109378;
    v13[1] = a2;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_21F8A5000, v6, OS_LOG_TYPE_DEFAULT, "GetPaths result %d results dict %@", (uint8_t *)v13, 0x12u);
  }

  if ((_DWORD)a2)
  {
    +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", a2);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1[5] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", a1[4]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("path"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1[6] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

- (id)itemForIdentifierLocked:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void *v24;
  id v25;
  NSXPCConnection *conn;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  char v31;
  Class ItemClass;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  _QWORD v47[6];
  _QWORD v48[6];
  _QWORD v49[5];
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint8_t v62[4];
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  void *v67;
  _BYTE buf[24];
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  livefs_std_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[LiveFSFPExtensionHelper itemForIdentifierLocked:error:].cold.4();

  if (-[LiveFSFPExtensionHelper _isLoggedInOrError:](self, "_isLoggedInOrError:", a4))
  {
    -[NSMapTable objectForKey:](self->itemIDMap, "objectForKey:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (id)-[LiveFSLRUCache objectForKey:](self->itemCache, "objectForKey:", v6);
      goto LABEL_53;
    }
    v11 = *MEMORY[0x24BDC8228];
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDC8228]))
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v69 = __Block_byref_object_copy__0;
      v70 = __Block_byref_object_dispose__0;
      v71 = 0;
      v56 = 0;
      v57 = &v56;
      v58 = 0x3032000000;
      v59 = __Block_byref_object_copy__0;
      v60 = __Block_byref_object_dispose__0;
      v61 = 0;
      v50 = 0;
      v51 = &v50;
      v52 = 0x3032000000;
      v53 = __Block_byref_object_copy__0;
      v54 = __Block_byref_object_dispose__0;
      v55 = 0;
      if (self->_clusterMaster)
      {
        v12 = 0;
        v61 = 0;
      }
      else
      {
        conn = self->_conn;
        v27 = MEMORY[0x24BDAC760];
        v49[0] = MEMORY[0x24BDAC760];
        v49[1] = 3221225472;
        v49[2] = __57__LiveFSFPExtensionHelper_itemForIdentifierLocked_error___block_invoke;
        v49[3] = &unk_24E46B180;
        v49[4] = buf;
        -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](conn, "synchronousRemoteObjectProxyWithErrorHandler:", v49);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v48[0] = v27;
        v48[1] = 3221225472;
        v48[2] = __57__LiveFSFPExtensionHelper_itemForIdentifierLocked_error___block_invoke_2;
        v48[3] = &unk_24E46B270;
        v48[4] = buf;
        v48[5] = &v56;
        objc_msgSend(v12, "getRootFileHandleWithError:", v48);
        if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
        {
          livefs_std_log();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            v29 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
            *(_DWORD *)v62 = 138412290;
            v63 = v29;
            _os_log_impl(&dword_21F8A5000, v28, OS_LOG_TYPE_INFO, "Getting RootFH failed with %@", v62, 0xCu);
          }

          v15 = *(id *)(*(_QWORD *)&buf[8] + 40);
          if (v15)
          {
            livefs_std_log();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              -[LiveFSFPExtensionHelper itemForIdentifierLocked:error:].cold.1();

          }
          if (a4)
          {
            v17 = objc_retainAutorelease(v15);
            goto LABEL_32;
          }
          goto LABEL_35;
        }
        v40 = v57[5];
        v47[0] = v27;
        v47[1] = 3221225472;
        v47[2] = __57__LiveFSFPExtensionHelper_itemForIdentifierLocked_error___block_invoke_188;
        v47[3] = &unk_24E46B298;
        v47[4] = buf;
        v47[5] = &v50;
        objc_msgSend(v12, "fileAttributes:requestID:reply:", v40, -1, v47);
      }
      livefs_std_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v41 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        v42 = v57[5];
        -[NSFileProviderExtension domain](self, "domain");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "identifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v62 = 138412802;
        v63 = v41;
        v64 = 2112;
        v65 = v42;
        v66 = 2112;
        v67 = v44;
        _os_log_debug_impl(&dword_21F8A5000, v13, OS_LOG_TYPE_DEBUG, "LIGetRootFileHandle returned e %@ fh %@ in domain %@", v62, 0x20u);

      }
      v14 = *(void **)(*(_QWORD *)&buf[8] + 40);
      if (!v14)
      {
        ItemClass = self->ItemClass;
        v33 = v57[5];
        -[NSFileProviderExtension domain](self, "domain");
        v15 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "displayName");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = -[objc_class dt_dir](self->ItemClass, "dt_dir");
        v8 = (id)-[objc_class newItemForFH:withReference:name:parent:type:attrs:extension:](ItemClass, "newItemForFH:withReference:name:parent:type:attrs:extension:", v33, v33 != 0, v34, 0, v35, v51[5], self);

        v31 = 1;
        goto LABEL_36;
      }
      v15 = v14;
      livefs_std_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[LiveFSFPExtensionHelper itemForIdentifierLocked:error:].cold.1();

      if (a4)
      {
        v17 = objc_retainAutorelease(v15);
LABEL_32:
        v8 = 0;
        v31 = 0;
        *a4 = v17;
        goto LABEL_36;
      }
LABEL_35:
      v8 = 0;
      v31 = 0;
LABEL_36:

      _Block_object_dispose(&v50, 8);
      _Block_object_dispose(&v56, 8);

      _Block_object_dispose(buf, 8);
      if ((v31 & 1) == 0)
      {
        v10 = 0;
LABEL_54:

        goto LABEL_55;
      }
LABEL_53:
      v8 = v8;
      v10 = v8;
      goto LABEL_54;
    }
    v46 = 0;
    -[LiveFSFPExtensionHelper itemForIdentifierLocked:error:](self, "itemForIdentifierLocked:error:", v11, &v46);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v46;
    v20 = v19;
    if (!v18)
    {
      v25 = 0;
      goto LABEL_43;
    }
    if (self->_idsPersist)
    {
      v45 = v19;
      -[LiveFSFPExtensionHelper pathForInodeID:error:](self, "pathForInodeID:error:", v6, &v45);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v21 = v45;

      if (!v8)
      {
        v25 = 0;
        goto LABEL_46;
      }
      livefs_std_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "substringFromIndex:", 12);
        v23 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v6;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v8;
        *(_WORD *)&buf[22] = 2112;
        v69 = v23;
        _os_log_impl(&dword_21F8A5000, v22, OS_LOG_TYPE_DEFAULT, "id->item, id %@ building path %@ with name %@", buf, 0x20u);

      }
      objc_msgSend(v6, "substringFromIndex:", 12);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByAppendingPathComponent:", v24);
      v25 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v25 = v6;
      v21 = v20;
    }
    -[LiveFSFPExtensionHelper itemAtPathLocked:parent:](self, "itemAtPathLocked:parent:", v25, v18);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      livefs_std_log();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[LiveFSFPExtensionHelper itemForIdentifierLocked:error:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v6;
        _os_log_impl(&dword_21F8A5000, v36, OS_LOG_TYPE_INFO, "%s: asked for non-existent item %@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "fileProviderErrorForNonExistentItemWithIdentifier:", v6);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_43:
      v8 = 0;
      if (!v20)
        goto LABEL_52;
      goto LABEL_47;
    }
LABEL_46:
    v20 = v21;
    if (!v21)
    {
LABEL_52:

      goto LABEL_53;
    }
LABEL_47:
    v37 = v20;
    livefs_std_log();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      -[LiveFSFPExtensionHelper itemForIdentifierLocked:error:].cold.1();

    if (a4)
      *a4 = objc_retainAutorelease(v37);

    goto LABEL_52;
  }
  v10 = 0;
LABEL_55:

  return v10;
}

void __57__LiveFSFPExtensionHelper_itemForIdentifierLocked_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __57__LiveFSFPExtensionHelper_itemForIdentifierLocked_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __57__LiveFSFPExtensionHelper_itemForIdentifierLocked_error___block_invoke_188(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;

  v5 = a3;
  v11 = v5;
  if ((_DWORD)a2)
  {
    +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", a2);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;
  }
  else
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = v5;
    v8 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v10;
  }

}

- (id)itemForIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  LiveFSFPExtensionHelper *v12;

  v6 = a3;
  -[LiveFSFPExtensionHelper ensureMountPathSetup](self, "ensureMountPathSetup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
    livefs_std_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[LiveFSFPExtensionHelper itemForIdentifier:error:].cold.1();

    if (a4)
      *a4 = objc_retainAutorelease(v9);

    v11 = 0;
  }
  else
  {
    v12 = self;
    objc_sync_enter(v12);
    -[LiveFSFPExtensionHelper itemForIdentifierLocked:error:](v12, "itemForIdentifierLocked:error:", v6, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v12);

  }
  return v11;
}

- (void)addItem:(id)a3 identifier:(id)a4 fileHandle:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v14, "parent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "itemNameCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "filename");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v14, v13);

  }
  if (v8)
    -[NSMapTable setObject:forKey:](self->itemHandleMap, "setObject:forKey:", v14, v8);
  -[NSMapTable setObject:forKey:](self->itemIDMap, "setObject:forKey:", v14, v9);
  -[LiveFSLRUCache setObject:forKey:](self->itemCache, "setObject:forKey:", v14, v9);

}

- (void)addFileHandle:(id)a3 toItem:(id)a4
{
  -[NSMapTable setObject:forKey:](self->itemHandleMap, "setObject:forKey:", a4, a3);
}

- (id)getItemForParent:(id)a3 name:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  objc_msgSend(a3, "itemNameCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)getItemForFileHandle:(id)a3
{
  return -[NSMapTable objectForKey:](self->itemHandleMap, "objectForKey:", a3);
}

- (void)reparentItem:(id)a3 oldID:(id)a4 oldParent:(id)a5 oldName:(id)a6 newParent:(id)a7 newName:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  LiveFSLRUCache *itemCache;
  void *v22;
  id v23;

  v23 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (v14)
  {
    -[LiveFSFPExtensionHelper reIDItem:oldID:](self, "reIDItem:oldID:", v23, v14);
    -[LiveFSLRUCache removeObjectForKey:](self->itemCache, "removeObjectForKey:", v14);
  }
  if (!objc_msgSend(v17, "isEqual:", v15) || (objc_msgSend(v18, "isEqualToString:", v16) & 1) == 0)
  {
    objc_msgSend(v17, "itemNameCache");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v23, v18);

    objc_msgSend(v15, "itemNameCache");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeObjectForKey:", v16);

  }
  itemCache = self->itemCache;
  objc_msgSend(v23, "itemIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[LiveFSLRUCache setObject:forKey:](itemCache, "setObject:forKey:", v23, v22);

}

- (void)reIDItem:(id)a3 oldID:(id)a4
{
  NSMapTable *itemIDMap;
  id v7;
  NSMapTable *v8;
  id v9;

  itemIDMap = self->itemIDMap;
  v7 = a3;
  -[NSMapTable removeObjectForKey:](itemIDMap, "removeObjectForKey:", a4);
  v8 = self->itemIDMap;
  objc_msgSend(v7, "itemIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](v8, "setObject:forKey:", v7, v9);

}

- (void)removeItem:(id)a3 parent:(id)a4 name:(id)a5 fileHandle:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[NSMapTable setObject:forKey:](self->itemIDMap, "setObject:forKey:", 0, v14);
  if (v10)
  {
    objc_msgSend(v10, "itemNameCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObjectForKey:", v11);

  }
  if (v12)
    -[NSMapTable removeObjectForKey:](self->itemHandleMap, "removeObjectForKey:", v12);
  -[LiveFSLRUCache removeObjectForKey:](self->itemCache, "removeObjectForKey:", v14);

}

- (void)addDirContainer:(id)a3 forContainerID:(id)a4
{
  -[NSMapTable setObject:forKey:](self->enumerators, "setObject:forKey:", a3, a4);
}

- (id)getEnumeratorForContainer:(id)a3
{
  return -[NSMapTable objectForKey:](self->enumerators, "objectForKey:", a3);
}

- (void)removeEnumeratorForContainerLocked:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NSMapTable objectForKey:](self->enumerators, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[NSMapTable setObject:forKey:](self->enumerators, "setObject:forKey:", 0, v5);

}

- (void)removeEnumeratorForContainer:(id)a3
{
  id v4;
  NSObject *enumeratorHelperQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  enumeratorHelperQueue = self->_enumeratorHelperQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__LiveFSFPExtensionHelper_removeEnumeratorForContainer___block_invoke;
  block[3] = &unk_24E46B338;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(enumeratorHelperQueue, block);

}

void __56__LiveFSFPExtensionHelper_removeEnumeratorForContainer___block_invoke(uint64_t a1)
{
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  objc_msgSend(*(id *)(a1 + 32), "removeEnumeratorForContainerLocked:", *(_QWORD *)(a1 + 40));
  objc_sync_exit(obj);

}

- (id)URLForItemWithIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  void *v22;
  NSObject *v23;
  _BOOL4 v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  __CFString *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSFileProviderExtension domain](self, "domain");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_9:
    livefs_std_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      -[LiveFSFPExtensionHelper URLForItemWithIdentifier:].cold.1();
    goto LABEL_11;
  }
  v6 = (void *)v5;
  -[NSFileProviderExtension domain](self, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {

    goto LABEL_9;
  }
  v9 = (void *)v8;
  -[NSFileProviderExtension domain](self, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", &stru_24E46BB18);

  if (v12)
    goto LABEL_9;
  livefs_std_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[LiveFSFPExtensionHelper URLForItemWithIdentifier:].cold.2((uint64_t)self, v13, v14, v15, v16, v17, v18, v19);

  -[LiveFSFPExtensionHelper ensureMountPathSetup](self, "ensureMountPathSetup");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    v25 = -[LiveFSFPExtensionHelper _isLoggedInOrError:](self, "_isLoggedInOrError:", 0);
    v20 = 0;
    v21 = 0;
    v22 = 0;
    if (!v25)
      goto LABEL_13;
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDC8228]) & 1) != 0)
    {
      v21 = &stru_24E46BB18;
LABEL_21:
      livefs_std_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v31 = "-[LiveFSFPExtensionHelper URLForItemWithIdentifier:]";
        v32 = 2112;
        v33 = v21;
        v34 = 2112;
        v35 = v4;
        _os_log_impl(&dword_21F8A5000, v27, OS_LOG_TYPE_DEFAULT, "%s: returning perVolPath %@ for item %@", buf, 0x20u);
      }

      -[LiveFSFPExtensionHelper mountPath](self, "mountPath");
      v23 = objc_claimAutoreleasedReturnValue();
      -[NSObject URLByAppendingPathComponent:isDirectory:](v23, "URLByAppendingPathComponent:isDirectory:", v21, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    if (!self->_idsPersist)
    {
      v21 = (__CFString *)v4;
      goto LABEL_21;
    }
    v29 = 0;
    -[LiveFSFPExtensionHelper itemForIdentifier:error:](self, "itemForIdentifier:error:", v4, &v29);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v29;
    if (v26)
    {
      objc_msgSend(v26, "path");
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_21;
    }
    livefs_std_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = (const char *)v4;
      _os_log_impl(&dword_21F8A5000, v28, OS_LOG_TYPE_DEFAULT, "URLForItem: didn't find item for ID %@", buf, 0xCu);
    }

LABEL_11:
    v21 = 0;
    v22 = 0;
LABEL_12:

    v20 = 0;
    goto LABEL_13;
  }
  v21 = 0;
  v22 = 0;
LABEL_13:

  return v22;
}

- (id)itemAtPathLocked:(id)a3 parent:(id)a4 cachedOnly:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  NSXPCConnection *conn;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  Class ItemClass;
  uint64_t v22;
  uint64_t v23;
  LiveFSLRUCache *itemCache;
  void *v25;
  id v26;
  id v27;
  NSObject *v29;
  _QWORD *v30;
  void *v31;
  id v32;
  _BOOL4 v33;
  void *v34;
  _QWORD v35[7];
  _QWORD v36[5];
  uint64_t v37;
  _QWORD v38[4];
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint8_t buf[4];
  void *v53;
  uint64_t v54;

  v33 = a5;
  v54 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__0;
  v50 = __Block_byref_object_dispose__0;
  v51 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__0;
  v44 = __Block_byref_object_dispose__0;
  v45 = 0;
  v37 = 0;
  v38[0] = &v37;
  v38[1] = 0x3032000000;
  v38[2] = __Block_byref_object_copy__0;
  v38[3] = __Block_byref_object_dispose__0;
  v39 = 0;
  v31 = v7;
  objc_msgSend(v7, "pathComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_clusterMaster)
  {
    v34 = 0;
    v33 = 1;
  }
  else
  {
    conn = self->_conn;
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __62__LiveFSFPExtensionHelper_itemAtPathLocked_parent_cachedOnly___block_invoke;
    v36[3] = &unk_24E46B180;
    v36[4] = &v37;
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](conn, "synchronousRemoteObjectProxyWithErrorHandler:", v36);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32 = v8;
  v11 = objc_msgSend(v9, "count");
  if (!v11)
  {
    v16 = 0;
    v12 = 0;
    v14 = v32;
LABEL_19:
    itemCache = self->itemCache;
    objc_msgSend(v14, "itemIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (id)-[LiveFSLRUCache objectForKey:](itemCache, "objectForKey:", v25);

    v27 = v14;
    v15 = v9;
    v17 = v12;
    goto LABEL_20;
  }
  v12 = 0;
  v13 = 0;
  v30 = v38;
  v14 = v32;
  v15 = v9;
  while (1)
  {
    objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v16, "isEqualToString:", CFSTR("/")) & 1) == 0)
      break;
LABEL_14:
    v9 = (void *)MEMORY[0x24BDBD1A8];
    if ((int)v11 >= 2)
    {
      objc_msgSend(v15, "subarrayWithRange:", 1, (v11 - 1));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v13 = v16;
    v15 = v9;
    LODWORD(v11) = v11 - 1;
    if (!(_DWORD)v11)
      goto LABEL_19;
  }
  v17 = v14;

  -[LiveFSFPExtensionHelper getItemForParent:name:](self, "getItemForParent:name:", v17, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
LABEL_13:
    v12 = v17;
    goto LABEL_14;
  }
  if (!v33)
  {
    livefs_std_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v53 = v19;
      _os_log_impl(&dword_21F8A5000, v18, OS_LOG_TYPE_DEFAULT, "About to look up name '%@'", buf, 0xCu);

    }
    objc_msgSend(v17, "fh");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __62__LiveFSFPExtensionHelper_itemAtPathLocked_parent_cachedOnly___block_invoke_191;
    v35[3] = &unk_24E46B360;
    v35[4] = &v37;
    v35[5] = &v46;
    v35[6] = &v40;
    objc_msgSend(v34, "lookupIn:name:usingFlags:requestID:reply:", v20, v16, 0, -1, v35);

    if (*(_QWORD *)(v38[0] + 40))
    {
      livefs_std_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[LiveFSFPExtensionHelper itemAtPathLocked:parent:cachedOnly:].cold.1((uint64_t)v30, v29);
      goto LABEL_26;
    }
    ItemClass = self->ItemClass;
    v22 = v47[5];
    v23 = -[objc_class dt_examine](ItemClass, "dt_examine");
    v14 = (void *)-[objc_class newItemForFH:withReference:name:parent:type:attrs:extension:](ItemClass, "newItemForFH:withReference:name:parent:type:attrs:extension:", v22, 1, v16, v17, v23, v41[5], self, v30);
    goto LABEL_13;
  }
  livefs_std_log();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v53 = v31;
    _os_log_impl(&dword_21F8A5000, v29, OS_LOG_TYPE_INFO, "Cache miss for name %@", buf, 0xCu);
  }
LABEL_26:

  v27 = 0;
LABEL_20:

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
  return v27;
}

void __62__LiveFSFPExtensionHelper_itemAtPathLocked_parent_cachedOnly___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __62__LiveFSFPExtensionHelper_itemAtPathLocked_parent_cachedOnly___block_invoke_191(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;

  v15 = a4;
  v9 = a5;
  if ((_DWORD)a2)
  {
    +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", a2);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1[4] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a4);
    v13 = *(_QWORD *)(a1[6] + 8);
    v14 = v9;
    v12 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v14;
  }

}

- (id)itemAtPathLocked:(id)a3 parent:(id)a4
{
  return -[LiveFSFPExtensionHelper itemAtPathLocked:parent:cachedOnly:](self, "itemAtPathLocked:parent:cachedOnly:", a3, a4, 0);
}

- (id)itemAtPath:(id)a3 parent:(id)a4
{
  id v6;
  id v7;
  LiveFSFPExtensionHelper *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  if (-[LiveFSFPExtensionHelper _isLoggedInOrErrorLocked:](v8, "_isLoggedInOrErrorLocked:", 0))
  {
    -[LiveFSFPExtensionHelper itemAtPathLocked:parent:cachedOnly:](v8, "itemAtPathLocked:parent:cachedOnly:", v6, v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  objc_sync_exit(v8);

  return v9;
}

- (void)enumerateRootContainer
{
  LiveFSFPExtensionHelper *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  id v7;

  v2 = self;
  objc_sync_enter(v2);
  v3 = *MEMORY[0x24BDC8228];
  -[LiveFSFPExtensionHelper getEnumeratorForContainer:](v2, "getEnumeratorForContainer:", *MEMORY[0x24BDC8228]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  if (v4)
  {
    +[LiveFSFPEnumeratorHelper applyParentUpdateAcrossEnumerators:](LiveFSFPEnumeratorHelper, "applyParentUpdateAcrossEnumerators:", v4);
    v5 = 0;
    v6 = 0;
  }
  else
  {
    v2->_fetchRoot = 1;
    v7 = 0;
    v5 = +[LiveFSFPEnumeratorHelper newWithEnumeratedItem:extension:error:](LiveFSFPEnumeratorHelper, "newWithEnumeratedItem:extension:error:", v3, v2, &v7);
    v6 = v7;
    if (!v6)
      objc_msgSend(v5, "signalEnumeratedItemChanged");
  }

}

- (id)persistentIdentifierForItemAtURL:(id)a3
{
  void *v3;
  void *v5;
  NSObject *v6;
  NSURL *docPath;
  NSString *providerName;
  void *v9;
  void *v10;
  __CFString *v11;
  char *v12;
  LiveFSFPExtensionHelper *v13;
  NSObject *v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  char *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  int v24;
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  NSURL *v29;
  __int16 v30;
  NSString *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "standardizedURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  livefs_std_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    docPath = self->_docPath;
    providerName = self->providerName;
    -[NSFileProviderExtension domain](self, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSFileProviderExtension domain](self, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[NSFileProviderExtension domain](self, "domain");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "identifier");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = &stru_24E46BB18;
    }
    v24 = 136316418;
    v25 = "-[LiveFSFPExtensionHelper persistentIdentifierForItemAtURL:]";
    v26 = 2112;
    v27 = v5;
    v28 = 2112;
    v29 = docPath;
    v30 = 2112;
    v31 = providerName;
    v32 = 2112;
    v33 = v9;
    v34 = 2112;
    v35 = v11;
    _os_log_impl(&dword_21F8A5000, v6, OS_LOG_TYPE_DEFAULT, "%s starting for url %@, docpath %@, providerName %@, domain: %@, identifier; %@",
      (uint8_t *)&v24,
      0x3Eu);
    if (v10)
    {

    }
  }

  -[LiveFSFPExtensionHelper itemPathForURL:](self, "itemPathForURL:", v5);
  v12 = (char *)objc_claimAutoreleasedReturnValue();
  v13 = self;
  objc_sync_enter(v13);
  if (-[LiveFSFPExtensionHelper _isLoggedInOrErrorLocked:](v13, "_isLoggedInOrErrorLocked:", 0))
  {
    livefs_std_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 138412290;
      v25 = v12;
      _os_log_impl(&dword_21F8A5000, v14, OS_LOG_TYPE_DEFAULT, "perItemPath is '%@'", (uint8_t *)&v24, 0xCu);
    }

    if (objc_msgSend(v12, "isEqualToString:", &stru_24E46BB18))
    {
      livefs_std_log();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
      v17 = (void *)*MEMORY[0x24BDC8228];
      if (v16)
        -[LiveFSFPExtensionHelper persistentIdentifierForItemAtURL:].cold.1();

      v18 = v17;
LABEL_22:
      v19 = v18;
      goto LABEL_25;
    }
    if (!v13->_idsPersist)
    {
      livefs_std_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[LiveFSFPExtensionHelper persistentIdentifierForItemAtURL:].cold.1();

      v18 = v12;
      goto LABEL_22;
    }
    -[LiveFSFPExtensionHelper itemForPath:cachedOnly:error:](v13, "itemForPath:cachedOnly:error:", v12, 0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      objc_msgSend(v20, "itemIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }
LABEL_25:
  objc_sync_exit(v13);

  return v19;
}

- (void)providePlaceholderAtURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD);
  NSObject *v7;

  v5 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  livefs_std_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[LiveFSFPExtensionHelper providePlaceholderAtURL:completionHandler:].cold.1();

  v6[2](v6, 0);
}

- (void)startProvidingItemAtURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD);
  NSObject *v7;

  v5 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  livefs_std_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[LiveFSFPExtensionHelper startProvidingItemAtURL:completionHandler:].cold.1();

  v6[2](v6, 0);
}

- (void)itemChangedAtURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[LiveFSFPExtensionHelper itemForURL:cachedOnly:error:](self, "itemForURL:cachedOnly:error:", v4, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "setAttributesStale");
  livefs_std_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = " found item at";
    v10 = "-[LiveFSFPExtensionHelper itemChangedAtURL:]";
    v9 = 136315650;
    if (!v6)
      v8 = "";
    v11 = 2080;
    v12 = v8;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_21F8A5000, v7, OS_LOG_TYPE_DEFAULT, "%s: called on%s url %@", (uint8_t *)&v9, 0x20u);
  }

}

- (void)stopProvidingItemAtURL:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  livefs_std_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[LiveFSFPExtensionHelper stopProvidingItemAtURL:].cold.1();

}

- (id)LiveFSDefaultMover
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __45__LiveFSFPExtensionHelper_LiveFSDefaultMover__block_invoke;
  v5[3] = &unk_24E46B388;
  v5[4] = self;
  v2 = (void *)MEMORY[0x2207CD064](v5, a2);
  v3 = (void *)MEMORY[0x2207CD064]();

  return v3;
}

BOOL __45__LiveFSFPExtensionHelper_LiveFSDefaultMover__block_invoke(uint64_t a1, void *a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  const char *v9;
  id v10;
  const char *v11;
  _copyfile_state *v12;
  _copyfile_state *v13;
  int v14;
  _BOOL8 v15;
  void *v16;
  char dst;

  v7 = objc_retainAutorelease(a3);
  v8 = a2;
  v9 = (const char *)objc_msgSend(v7, "fileSystemRepresentation");
  v10 = objc_retainAutorelease(v8);
  v11 = (const char *)objc_msgSend(v10, "fileSystemRepresentation");

  dst = 0;
  v12 = copyfile_state_alloc();
  if (v12)
  {
    v13 = v12;
    copyfile_state_set(v12, 6u, copyFileFromPath_callback);
    v14 = copyfile(v11, v9, v13, 0x10E800Fu);
    v15 = v14 == 0;
    if (v14)
    {
      if (a4)
      {
        if (*__error() == 17)
        {
          objc_msgSend(*(id *)(a1 + 32), "itemForURL:error:", v7, a4);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            objc_msgSend(MEMORY[0x24BDD1540], "fileProviderErrorForCollisionWithItem:", v16);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }

        }
        else
        {
          +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", *__error());
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
    }
    else
    {
      copyfile_state_get(v13, 0xAu, &dst);
    }
    copyfile_state_free(v13);
  }
  else if (a4)
  {
    +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", 12);
    v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)importDocumentAtURL:(id)a3 toParentItemIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[LiveFSFPExtensionHelper URLForItemWithIdentifier:](self, "URLForItemWithIdentifier:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  livefs_std_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v19 = v8;
    v20 = 2112;
    v21 = v11;
    _os_log_impl(&dword_21F8A5000, v12, OS_LOG_TYPE_DEFAULT, "importing document at %@ to %@", buf, 0x16u);
  }

  if (v11)
  {
    -[LiveFSFPExtensionHelper LiveFSDefaultMover](self, "LiveFSDefaultMover");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __88__LiveFSFPExtensionHelper_importDocumentAtURL_toParentItemIdentifier_completionHandler___block_invoke;
    v15[3] = &unk_24E46B3B0;
    v15[4] = self;
    v17 = v10;
    v16 = v8;
    objc_msgSend(v16, "fp_importUnderFolder:usingBlock:completionHandler:", v11, v13, v15);

  }
  else
  {
    livefs_std_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F8A5000, v14, OS_LOG_TYPE_DEFAULT, "Where is IT", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "fileProviderErrorForNonExistentItemWithIdentifier:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v13);
  }

}

void __88__LiveFSFPExtensionHelper_importDocumentAtURL_toParentItemIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  livefs_std_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __88__LiveFSFPExtensionHelper_importDocumentAtURL_toParentItemIdentifier_completionHandler___block_invoke_cold_2((uint64_t)v5);

  objc_msgSend(*(id *)(a1 + 32), "fileProviderErrorFromFSError:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v9 = *(void **)(a1 + 32);
    v15 = 0;
    objc_msgSend(v9, "itemForURL:error:", v5, &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v15;
    if (!v10)
    {
      livefs_std_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        __88__LiveFSFPExtensionHelper_importDocumentAtURL_toParentItemIdentifier_completionHandler___block_invoke_cold_1();

    }
    livefs_std_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v17 = v14;
      v18 = 2112;
      v19 = v10;
      v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_21F8A5000, v13, OS_LOG_TYPE_DEFAULT, "importing document at %@ to item %@, error %@", buf, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)createDirectoryWithName:(id)a3 inParentItemIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  NSObject *v11;
  void *v12;
  BOOL v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  int v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  livefs_std_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v34 = v8;
    v35 = 2112;
    v36 = v9;
    _os_log_impl(&dword_21F8A5000, v11, OS_LOG_TYPE_DEFAULT, "creating directory %@ under %@", buf, 0x16u);
  }

  -[LiveFSFPExtensionHelper itemForIdentifier:error:](self, "itemForIdentifier:error:", v9, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    livefs_std_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F8A5000, v18, OS_LOG_TYPE_DEFAULT, "Where is IT", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "fileProviderErrorForNonExistentItemWithIdentifier:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v32 = 0;
  v13 = -[LiveFSFPExtensionHelper _isLoggedInOrError:](self, "_isLoggedInOrError:", &v32);
  v14 = v32;
  v15 = v14;
  if (!v13)
  {
    livefs_std_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[LiveFSFPExtensionHelper createDirectoryWithName:inParentItemIdentifier:completionHandler:].cold.3();

LABEL_14:
    v10[2](v10, 0, v15);
    goto LABEL_19;
  }
  if (self->_clusterMaster)
  {
    +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", 30);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    livefs_std_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[LiveFSFPExtensionHelper createDirectoryWithName:inParentItemIdentifier:completionHandler:].cold.2(self, v17);
LABEL_18:

    v10[2](v10, 0, v16);
    v15 = v16;
    goto LABEL_19;
  }
  v31 = v14;
  v20 = objc_msgSend(v12, "ensureFileHandleOrError:", &v31);
  v16 = v31;

  if (v20)
  {
    livefs_std_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[LiveFSFPExtensionHelper createDirectoryWithName:inParentItemIdentifier:completionHandler:].cold.1();
    goto LABEL_18;
  }
  -[LiveFSFPExtensionHelper itemAtPath:parent:](self, "itemAtPath:parent:", v8, v12);
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v15 = (void *)v21;
    livefs_std_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v34 = v8;
      v35 = 2112;
      v36 = v15;
      _os_log_impl(&dword_21F8A5000, v22, OS_LOG_TYPE_DEFAULT, "creating directory %@ colliding with %@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "fileProviderErrorForCollisionWithItem:", v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v23);

  }
  else
  {
    -[LiveFSFPExtensionHelper URLForItemWithIdentifier:](self, "URLForItemWithIdentifier:", v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "URLByAppendingPathComponent:", v8);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = *MEMORY[0x24BDD0CC8];
    v40[0] = &unk_24E470B40;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v16;
    objc_msgSend(v27, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v25, 0, v26, &v30);
    v28 = v30;

    if (v28)
    {
      v15 = 0;
    }
    else
    {
      -[LiveFSFPExtensionHelper itemAtPath:parent:](self, "itemAtPath:parent:", v8, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    livefs_std_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v34 = v8;
      v35 = 2112;
      v36 = v15;
      v37 = 2112;
      v38 = v28;
      _os_log_impl(&dword_21F8A5000, v29, OS_LOG_TYPE_DEFAULT, "creating directory %@ returning %@ and error %@", buf, 0x20u);
    }

    ((void (**)(id, void *, void *))v10)[2](v10, v15, v28);
  }
LABEL_19:

}

- (void)renameItemWithIdentifier:(id)a3 toName:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  BOOL v14;
  id v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  int v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSObject *renameUpdateQueue;
  void *v36;
  id v37;
  _QWORD block[4];
  id v39;
  id v40;
  LiveFSFPExtensionHelper *v41;
  id v42;
  id v43;
  void (**v44)(id, _QWORD, void *);
  uint64_t *v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint8_t buf[4];
  id v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v37 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__0;
  v53 = __Block_byref_object_dispose__0;
  v54 = 0;
  livefs_std_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v56 = v8;
    v57 = 2112;
    v58 = v37;
    _os_log_impl(&dword_21F8A5000, v10, OS_LOG_TYPE_DEFAULT, "renaming %@ to %@", buf, 0x16u);
  }

  -[LiveFSFPExtensionHelper itemForIdentifier:error:](self, "itemForIdentifier:error:", v8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    livefs_std_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F8A5000, v24, OS_LOG_TYPE_DEFAULT, "Where is IT", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "fileProviderErrorForNonExistentItemWithIdentifier:", v8);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v25);
    v21 = 0;
    v22 = 0;
    v26 = 0;
    v13 = 0;
    v23 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v11, "parent");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", 22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v25);
    v21 = 0;
    v22 = 0;
    v26 = 0;
    v13 = 0;
    v23 = 0;
LABEL_14:

    v16 = v26;
    goto LABEL_16;
  }
  v48 = 0;
  v14 = -[LiveFSFPExtensionHelper _isLoggedInOrError:](self, "_isLoggedInOrError:", &v48);
  v15 = v48;
  v16 = v15;
  if (!v14)
  {
    v9[2](v9, 0, v15);
    v21 = 0;
    v22 = 0;
    v23 = 0;
    goto LABEL_16;
  }
  if (!self->_clusterMaster)
  {
    v47 = v15;
    v27 = objc_msgSend(v13, "ensureFileHandleOrError:", &v47);
    v26 = v47;

    if (v27)
    {
      v9[2](v9, 0, v26);
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v16 = v26;
      goto LABEL_16;
    }
    -[LiveFSFPExtensionHelper itemAtPath:parent:](self, "itemAtPath:parent:", v37, v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      livefs_std_log();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v56 = v8;
        v57 = 2112;
        v58 = v23;
        _os_log_impl(&dword_21F8A5000, v28, OS_LOG_TYPE_DEFAULT, "renaming %@ colliding with %@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "fileProviderErrorForCollisionWithItem:", v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, 0, v25);
      v21 = 0;
      v22 = 0;
    }
    else
    {
      -[LiveFSFPExtensionHelper URLForItemWithIdentifier:](self, "URLForItemWithIdentifier:", v8);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "URLByDeletingLastPathComponent");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "URLByAppendingPathComponent:", v37);
      v22 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "itemIdentifier");
      v30 = objc_claimAutoreleasedReturnValue();
      v46 = v26;
      -[LiveFSFPExtensionHelper enumeratorForContainerItemIdentifier:error:](self, "enumeratorForContainerItemIdentifier:error:", v30, &v46);
      v31 = objc_claimAutoreleasedReturnValue();
      v36 = (void *)v30;
      v16 = v46;

      v32 = (void *)v50[5];
      v50[5] = v31;

      v33 = (void *)v50[5];
      if (v33)
      {
        objc_msgSend(v33, "ensureConnectedForUpdates");
        v34 = objc_claimAutoreleasedReturnValue();

        v16 = (id)v34;
      }
      if (v16)
      {
        v9[2](v9, 0, v16);
        v23 = 0;
        goto LABEL_16;
      }
      renameUpdateQueue = self->renameUpdateQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __77__LiveFSFPExtensionHelper_renameItemWithIdentifier_toName_completionHandler___block_invoke;
      block[3] = &unk_24E46B400;
      v39 = v12;
      v13 = v13;
      v40 = v13;
      v41 = self;
      v22 = v22;
      v42 = v22;
      v45 = &v49;
      v44 = v9;
      v21 = v21;
      v43 = v21;
      dispatch_async(renameUpdateQueue, block);

      v26 = 0;
      v23 = 0;
      v25 = v39;
    }
    goto LABEL_14;
  }
  +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", 30);
  v17 = objc_claimAutoreleasedReturnValue();

  livefs_std_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    -[NSFileProviderExtension domain](self, "domain");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[LiveFSFPExtensionHelper renameItemWithIdentifier:toName:completionHandler:].cold.1(v20, (uint64_t)buf, v18, v19);
  }

  v9[2](v9, 0, (void *)v17);
  v21 = 0;
  v22 = 0;
  v23 = 0;
  v16 = (id)v17;
LABEL_16:
  _Block_object_dispose(&v49, 8);

}

void __77__LiveFSFPExtensionHelper_renameItemWithIdentifier_toName_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  __int128 v12;
  id v13;
  _QWORD v14[5];
  id v15;
  __int128 v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "filename");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __77__LiveFSFPExtensionHelper_renameItemWithIdentifier_toName_completionHandler___block_invoke_2;
  v14[3] = &unk_24E46B3D8;
  v4 = *(void **)(a1 + 40);
  v14[4] = *(_QWORD *)(a1 + 48);
  v15 = *(id *)(a1 + 56);
  v12 = *(_OWORD *)(a1 + 72);
  v5 = (id)v12;
  v16 = v12;
  objc_msgSend(v4, "afterRename:performBlock:", v3, v14);
  livefs_std_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[LiveFSFPExtensionHelper renameItemWithIdentifier:toName:completionHandler:]_block_invoke";
    _os_log_impl(&dword_21F8A5000, v6, OS_LOG_TYPE_DEFAULT, "%s: rename about to happen", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  v13 = 0;
  objc_msgSend(v7, "moveItemAtURL:toURL:error:", v8, v9, &v13);
  v10 = v13;

  livefs_std_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[LiveFSFPExtensionHelper renameItemWithIdentifier:toName:completionHandler:]_block_invoke";
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_21F8A5000, v11, OS_LOG_TYPE_DEFAULT, "%s: got error %@", buf, 0x16u);
  }

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "dropAfterRenameBlockForName:", v3);
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }

}

void __77__LiveFSFPExtensionHelper_renameItemWithIdentifier_toName_completionHandler___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v3 = a1[5];
  v9 = 0;
  objc_msgSend(v2, "itemForURL:error:", v3, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  livefs_std_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_21F8A5000, v6, OS_LOG_TYPE_DEFAULT, "Reparented, it is item %@ newError %@", buf, 0x16u);
  }

  v7 = *(_QWORD *)(a1[7] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)reparentItemWithIdentifier:(id)a3 toParentItemWithIdentifier:(id)a4 newName:(id)a5 completionHandler:(id)a6
{
  void (**v10)(id, _QWORD, id);
  NSObject *v11;
  BOOL v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  int v26;
  id v27;
  NSObject *v28;
  void *v29;
  int v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  NSObject *renameUpdateQueue;
  void *v39;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  _QWORD block[4];
  id v45;
  id v46;
  LiveFSFPExtensionHelper *v47;
  id v48;
  id v49;
  id v50;
  void (**v51)(id, _QWORD, id);
  uint64_t *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint8_t buf[4];
  id v65;
  __int16 v66;
  id v67;
  __int16 v68;
  id v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v43 = a3;
  v42 = a4;
  v41 = a5;
  v10 = (void (**)(id, _QWORD, id))a6;
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__0;
  v62 = __Block_byref_object_dispose__0;
  v63 = 0;
  livefs_std_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v65 = v43;
    v66 = 2112;
    v67 = v42;
    v68 = 2112;
    v69 = v41;
    _os_log_impl(&dword_21F8A5000, v11, OS_LOG_TYPE_DEFAULT, "reparenting %@ under %@, with newName %@", buf, 0x20u);
  }

  v57 = 0;
  v12 = -[LiveFSFPExtensionHelper _isLoggedInOrError:](self, "_isLoggedInOrError:", &v57);
  v13 = v57;
  if (v12)
  {
    if (!self->_clusterMaster)
    {
      -[LiveFSFPExtensionHelper itemForIdentifier:error:](self, "itemForIdentifier:error:", v43, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v24;
      if (v24)
      {
        objc_msgSend(v24, "parent");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v25;
        if (v25)
        {
          v56 = v13;
          v26 = objc_msgSend(v25, "ensureFileHandleOrError:", &v56);
          v27 = v56;

          if (v26)
          {
            v10[2](v10, 0, v27);
            v18 = 0;
            v19 = 0;
            v20 = 0;
            v21 = 0;
            v13 = v27;
            goto LABEL_9;
          }
          v55 = v27;
          -[LiveFSFPExtensionHelper itemForIdentifier:error:](self, "itemForIdentifier:error:", v42, &v55);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v55;

          if (v13)
          {
            v10[2](v10, 0, v13);
            v18 = 0;
            v19 = 0;
            v20 = 0;
            goto LABEL_9;
          }
          v54 = 0;
          v30 = objc_msgSend(v21, "ensureFileHandleOrError:", &v54);
          v13 = v54;
          if (v30)
          {
            v10[2](v10, 0, v13);
            v18 = 0;
            v19 = 0;
            v20 = 0;
            goto LABEL_9;
          }
          if (v41)
          {
            v31 = v41;
          }
          else
          {
            livefs_std_log();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v23, "filename");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              -[LiveFSFPExtensionHelper reparentItemWithIdentifier:toParentItemWithIdentifier:newName:completionHandler:].cold.1(v33, (uint64_t)buf, v32);
            }

            objc_msgSend(v23, "filename");
            v31 = (id)objc_claimAutoreleasedReturnValue();
          }
          v18 = v31;
          -[LiveFSFPExtensionHelper URLForItemWithIdentifier:](self, "URLForItemWithIdentifier:", v43);
          v19 = (id)objc_claimAutoreleasedReturnValue();
          -[LiveFSFPExtensionHelper URLForItemWithIdentifier:](self, "URLForItemWithIdentifier:", v42);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "URLByAppendingPathComponent:", v18);
          v20 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v22, "itemIdentifier");
          v35 = objc_claimAutoreleasedReturnValue();
          v53 = v13;
          -[LiveFSFPExtensionHelper enumeratorForContainerItemIdentifier:error:](self, "enumeratorForContainerItemIdentifier:error:", v35, &v53);
          v40 = objc_claimAutoreleasedReturnValue();
          v39 = (void *)v35;
          v36 = v53;

          v37 = (void *)v59[5];
          v59[5] = v40;

          if (v36)
          {
            v10[2](v10, 0, v36);
            v13 = v36;
            goto LABEL_9;
          }
          renameUpdateQueue = self->renameUpdateQueue;
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __107__LiveFSFPExtensionHelper_reparentItemWithIdentifier_toParentItemWithIdentifier_newName_completionHandler___block_invoke;
          block[3] = &unk_24E46B428;
          v23 = v23;
          v45 = v23;
          v22 = v22;
          v46 = v22;
          v47 = self;
          v20 = v20;
          v48 = v20;
          v52 = &v58;
          v51 = v10;
          v19 = v19;
          v49 = v19;
          v50 = 0;
          dispatch_async(renameUpdateQueue, block);

          v13 = 0;
          v29 = v45;
        }
        else
        {
          +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", 22);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v10[2](v10, 0, v29);
          v18 = 0;
          v19 = 0;
          v20 = 0;
          v21 = 0;
          v22 = 0;
        }
      }
      else
      {
        livefs_std_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21F8A5000, v28, OS_LOG_TYPE_DEFAULT, "Where is IT", buf, 2u);
        }

        objc_msgSend(MEMORY[0x24BDD1540], "fileProviderErrorForNonExistentItemWithIdentifier:", v43);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v10[2](v10, 0, v29);
        v18 = 0;
        v19 = 0;
        v20 = 0;
        v21 = 0;
        v22 = 0;
        v23 = 0;
      }

      goto LABEL_9;
    }
    +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", 30);
    v14 = objc_claimAutoreleasedReturnValue();

    livefs_std_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      -[NSFileProviderExtension domain](self, "domain");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[LiveFSFPExtensionHelper renameItemWithIdentifier:toName:completionHandler:].cold.1(v17, (uint64_t)buf, v15, v16);
    }

    v10[2](v10, 0, (id)v14);
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v13 = (id)v14;
  }
  else
  {
    v10[2](v10, 0, v13);
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
  }
LABEL_9:
  _Block_object_dispose(&v58, 8);

}

void __107__LiveFSFPExtensionHelper_reparentItemWithIdentifier_toParentItemWithIdentifier_newName_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  __int128 v12;
  id v13;
  _QWORD v14[5];
  id v15;
  __int128 v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "filename");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __107__LiveFSFPExtensionHelper_reparentItemWithIdentifier_toParentItemWithIdentifier_newName_completionHandler___block_invoke_2;
  v14[3] = &unk_24E46B3D8;
  v4 = *(void **)(a1 + 40);
  v14[4] = *(_QWORD *)(a1 + 48);
  v15 = *(id *)(a1 + 56);
  v12 = *(_OWORD *)(a1 + 80);
  v5 = (id)v12;
  v16 = v12;
  objc_msgSend(v4, "afterRename:performBlock:", v3, v14);
  livefs_std_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[LiveFSFPExtensionHelper reparentItemWithIdentifier:toParentItemWithIdentifier:newName:completionHandler:]_block_invoke";
    _os_log_impl(&dword_21F8A5000, v6, OS_LOG_TYPE_DEFAULT, "%s: rename about to happen", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  v13 = 0;
  objc_msgSend(v7, "moveItemAtURL:toURL:error:", v8, v9, &v13);
  v10 = v13;

  livefs_std_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[LiveFSFPExtensionHelper reparentItemWithIdentifier:toParentItemWithIdentifier:newName:completionHandler:]_block_invoke";
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_21F8A5000, v11, OS_LOG_TYPE_DEFAULT, "%s: got error %@", buf, 0x16u);
  }

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "dropAfterRenameBlockForName:", v3);
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }

}

void __107__LiveFSFPExtensionHelper_reparentItemWithIdentifier_toParentItemWithIdentifier_newName_completionHandler___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v3 = a1[5];
  v9 = 0;
  objc_msgSend(v2, "itemForURL:error:", v3, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  livefs_std_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_21F8A5000, v6, OS_LOG_TYPE_DEFAULT, "Reparented, it is item %@ newError %@", buf, 0x16u);
  }

  v7 = *(_QWORD *)(a1[7] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)fetchTrashIdentifiersWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  BOOL v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;

  v4 = (void (**)(id, _QWORD, void *))a3;
  v19 = 0;
  v5 = -[LiveFSFPExtensionHelper _isLoggedInOrError:](self, "_isLoggedInOrError:", &v19);
  v6 = v19;
  v7 = v6;
  if (v5)
  {
    v18 = v6;
    -[LiveFSFPExtensionHelper itemForPath:cachedOnly:error:](self, "itemForPath:cachedOnly:error:", CFSTR(".Trashes"), 0, &v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v18;

    if (v8)
    {
      objc_msgSend(v8, "itemIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v9;
      -[LiveFSFPExtensionHelper enumeratorForContainerItemIdentifier:error:](self, "enumeratorForContainerItemIdentifier:error:", v10, &v17);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v17;

      if (v11)
      {
        v12 = +[LiveFSFPTrashObserver newWithCompletionHandler:](LiveFSFPTrashObserver, "newWithCompletionHandler:", v4);
        if (v12)
        {
          v13 = v12;
          v14 = (id)*MEMORY[0x24BDC81E8];
          if (v14)
          {
            v15 = v14;
            do
            {
              objc_msgSend(v11, "enumerateItemsForObserver:startingAtPage:", v13, v15);
              objc_msgSend(v13, "lastPage");
              v16 = objc_claimAutoreleasedReturnValue();

              v15 = (void *)v16;
            }
            while (v16);
          }
        }
        else
        {
          +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", 12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v4[2](v4, 0, v13);
        }

      }
      else
      {
        v4[2](v4, 0, v7);
      }

    }
    else
    {
      v4[2](v4, 0, v9);
      v7 = v9;
    }
  }
  else
  {
    v4[2](v4, 0, v6);
  }

}

- (void)trashItemWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  NSObject *v8;
  BOOL v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  uint64_t v22;
  BOOL v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *renameUpdateQueue;
  uid_t v35;
  gid_t v36;
  const char *v37;
  const char *v38;
  NSObject *v39;
  xpc_object_t v40;
  NSObject *v41;
  xpc_object_t xdict;
  _xpc_connection_s *connection;
  void *v44;
  id v45;
  id v46;
  _QWORD block[4];
  id v48;
  id v49;
  LiveFSFPExtensionHelper *v50;
  id v51;
  id v52;
  void (**v53)(id, _QWORD, id);
  __int128 *p_buf;
  id v55;
  uint8_t v56[16];
  id v57;
  id v58;
  __int128 buf;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  livefs_std_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_21F8A5000, v8, OS_LOG_TYPE_INFO, "trashing item %@", (uint8_t *)&buf, 0xCu);
  }

  v58 = 0;
  v9 = -[LiveFSFPExtensionHelper _isLoggedInOrError:](self, "_isLoggedInOrError:", &v58);
  v10 = v58;
  if (!v9)
  {
    v7[2](v7, 0, v10);
    goto LABEL_7;
  }
  v11 = *MEMORY[0x24BDC8228];
  if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDC8228]))
  {
    -[LiveFSFPExtensionHelper itemForIdentifier:error:](self, "itemForIdentifier:error:", v6, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      livefs_std_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_21F8A5000, v26, OS_LOG_TYPE_DEFAULT, "Where is IT", (uint8_t *)&buf, 2u);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "fileProviderErrorForNonExistentItemWithIdentifier:", v6);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v27);

      goto LABEL_7;
    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v60 = 0x3032000000;
    v61 = __Block_byref_object_copy__0;
    v62 = __Block_byref_object_dispose__0;
    v63 = 0;
    -[LiveFSFPExtensionHelper URLForItemWithIdentifier:](self, "URLForItemWithIdentifier:", v6);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[LiveFSFPExtensionHelper URLForItemWithIdentifier:](self, "URLForItemWithIdentifier:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "URLByAppendingPathComponent:", CFSTR(".Trashes"));
    v45 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u"), getuid());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "URLByAppendingPathComponent:", v16);
    v46 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "path");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v10;
    v19 = objc_msgSend(v17, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v18, 1, 0, &v57);
    v20 = v57;

    if ((v19 & 1) == 0)
    {
      objc_msgSend(v20, "domain");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *MEMORY[0x24BDD0B88];
      if (objc_msgSend(v21, "isEqualToString:", *MEMORY[0x24BDD0B88]))
      {
        v23 = objc_msgSend(v20, "code") == 516;

        if (!v23)
        {
          connection = xpc_connection_create_mach_service("com.apple.filesystems.userfs_helper", 0, 0);
          if (!connection || MEMORY[0x2207CD268](connection) != MEMORY[0x24BDACF88])
          {
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v22, 512, 0);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v7[2](v7, 0, v24);
            v25 = 0;
            xdict = 0;
            v13 = 0;
            goto LABEL_28;
          }
          xpc_connection_set_event_handler(connection, &__block_literal_global);
          xpc_connection_resume(connection);
          xdict = xpc_dictionary_create(0, 0, 0);
          v35 = getuid();
          xpc_dictionary_set_int64(xdict, "uid", v35);
          v36 = getgid();
          xpc_dictionary_set_int64(xdict, "gid", v36);
          v37 = (const char *)objc_msgSend(objc_retainAutorelease(v45), "fileSystemRepresentation");
          v38 = (const char *)objc_msgSend(objc_retainAutorelease(v46), "fileSystemRepresentation");
          if (v37)
            xpc_dictionary_set_string(xdict, "trash", v37);
          if (v38)
            xpc_dictionary_set_string(xdict, "path", v38);
          livefs_std_log();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v56 = 0;
            _os_log_impl(&dword_21F8A5000, v39, OS_LOG_TYPE_DEFAULT, "asking for Trash to be created", v56, 2u);
          }

          v40 = xpc_connection_send_message_with_reply_sync(connection, xdict);
          v25 = v40;
          if (!v40 || MEMORY[0x2207CD268](v40) != MEMORY[0x24BDACFA0] || xpc_dictionary_get_int64(v25, "error"))
          {
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v22, 512, 0);
            v10 = (id)objc_claimAutoreleasedReturnValue();

            livefs_std_log();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
              -[LiveFSFPExtensionHelper trashItemWithIdentifier:completionHandler:].cold.1();

            v7[2](v7, 0, v10);
            v13 = 0;
            goto LABEL_29;
          }
          xpc_connection_cancel(connection);
LABEL_21:
          objc_msgSend(v14, "parent");
          v13 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "itemIdentifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = v20;
          -[LiveFSFPExtensionHelper enumeratorForContainerItemIdentifier:error:](self, "enumeratorForContainerItemIdentifier:error:", v28, &v55);
          v29 = objc_claimAutoreleasedReturnValue();
          v10 = v55;

          v30 = *(void **)(*((_QWORD *)&buf + 1) + 40);
          *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v29;

          v31 = *(void **)(*((_QWORD *)&buf + 1) + 40);
          if (v31)
          {
            objc_msgSend(v31, "ensureConnectedForUpdates");
            v32 = objc_claimAutoreleasedReturnValue();

            v10 = (id)v32;
          }
          if (v10)
          {
            v7[2](v7, 0, v10);
LABEL_29:

            _Block_object_dispose(&buf, 8);
            goto LABEL_8;
          }
          livefs_std_log();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v56 = 0;
            _os_log_impl(&dword_21F8A5000, v33, OS_LOG_TYPE_DEFAULT, "about to dispatch_async actual trashing work", v56, 2u);
          }

          renameUpdateQueue = self->renameUpdateQueue;
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __69__LiveFSFPExtensionHelper_trashItemWithIdentifier_completionHandler___block_invoke_210;
          block[3] = &unk_24E46B508;
          v48 = v14;
          v13 = v13;
          v49 = v13;
          v50 = self;
          p_buf = &buf;
          v53 = v7;
          v51 = v44;
          v52 = v46;
          dispatch_async(renameUpdateQueue, block);

          v20 = 0;
          v24 = v48;
LABEL_28:

          v10 = v20;
          goto LABEL_29;
        }
      }
      else
      {

      }
    }
    xdict = 0;
    connection = 0;
    v25 = 0;
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 513, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, 0, v12);

LABEL_7:
  v13 = 0;
  v14 = 0;
LABEL_8:

}

void __69__LiveFSFPExtensionHelper_trashItemWithIdentifier_completionHandler___block_invoke_210(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD *v17;
  uint8_t buf[16];
  _QWORD v19[5];
  id v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD v23[5];
  id v24;

  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__0;
  v23[4] = __Block_byref_object_dispose__0;
  v24 = 0;
  objc_msgSend(*(id *)(a1 + 32), "filename");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v19[2] = __69__LiveFSFPExtensionHelper_trashItemWithIdentifier_completionHandler___block_invoke_2;
  v19[3] = &unk_24E46B4B8;
  v4 = *(void **)(a1 + 40);
  v19[4] = *(_QWORD *)(a1 + 48);
  v21 = v23;
  v5 = *(void **)(a1 + 72);
  v22 = *(_QWORD *)(a1 + 80);
  v6 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v20 = v5;
  objc_msgSend(v4, "afterRename:performBlock:", v3, v19);
  livefs_std_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F8A5000, v7, OS_LOG_TYPE_DEFAULT, "registered for renameUpdate", buf, 2u);
  }

  v8 = *(void **)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 64);
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __69__LiveFSFPExtensionHelper_trashItemWithIdentifier_completionHandler___block_invoke_211;
  v12[3] = &unk_24E46B4E0;
  v13 = v8;
  v14 = *(id *)(a1 + 40);
  v10 = v3;
  v15 = v10;
  v16 = *(id *)(a1 + 72);
  v17 = v23;
  objc_msgSend(v13, "fp_trashUnderFolder:completionHandler:", v9, v12);
  livefs_std_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F8A5000, v11, OS_LOG_TYPE_DEFAULT, "Asked FP to trash the item", buf, 2u);
  }

  _Block_object_dispose(v23, 8);
}

void __69__LiveFSFPExtensionHelper_trashItemWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD block[5];
  __int128 v7;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 136);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__LiveFSFPExtensionHelper_trashItemWithIdentifier_completionHandler___block_invoke_3;
  block[3] = &unk_24E46B490;
  v3 = *(_QWORD *)(a1 + 56);
  v5 = *(_OWORD *)(a1 + 40);
  block[4] = v1;
  v8 = v3;
  v4 = (id)v5;
  v7 = v5;
  dispatch_async(v2, block);

}

void __69__LiveFSFPExtensionHelper_trashItemWithIdentifier_completionHandler___block_invoke_3(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  v9 = 0;
  objc_msgSend(v2, "itemForURL:error:", v3, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  livefs_std_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_21F8A5000, v6, OS_LOG_TYPE_DEFAULT, "trash returning item %@ newError %@", buf, 0x16u);
  }

  v7 = *(_QWORD *)(a1[7] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  (*(void (**)(void))(a1[5] + 16))();
}

void __69__LiveFSFPExtensionHelper_trashItemWithIdentifier_completionHandler___block_invoke_211(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  livefs_std_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = *(void **)(a1 + 32);
      v11 = 138412802;
      v12 = v10;
      v13 = 2112;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      _os_log_error_impl(&dword_21F8A5000, v9, OS_LOG_TYPE_ERROR, "trashing item at url %@ newURL %@ failed with error: %@", (uint8_t *)&v11, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 40), "dropAfterRenameBlockForName:", *(_QWORD *)(a1 + 48));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_21F8A5000, v9, OS_LOG_TYPE_DEFAULT, "item trashed, newURL:%@", (uint8_t *)&v11, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
  }

}

- (void)untrashItemWithIdentifier:(id)a3 toParentItemIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, id);
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *renameUpdateQueue;
  _QWORD block[4];
  id v26;
  id v27;
  LiveFSFPExtensionHelper *v28;
  id v29;
  id v30;
  void (**v31)(id, _QWORD, id);
  uint64_t *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t buf[4];
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, id))a5;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__0;
  v39 = __Block_byref_object_dispose__0;
  v40 = 0;
  livefs_std_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v42 = v8;
    _os_log_impl(&dword_21F8A5000, v11, OS_LOG_TYPE_INFO, "untrashing item %@", buf, 0xCu);
  }

  v34 = 0;
  -[LiveFSFPExtensionHelper itemForIdentifier:error:](self, "itemForIdentifier:error:", v8, &v34);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v34;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "fileProviderErrorForNonExistentItemWithIdentifier:", v8);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v22);
    v17 = 0;
    v14 = 0;
LABEL_16:

    v16 = v9;
    goto LABEL_17;
  }
  -[LiveFSFPExtensionHelper URLForItemWithIdentifier:](self, "URLForItemWithIdentifier:", v8);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 4, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v22);
    v17 = 0;
    v14 = 0;
    goto LABEL_16;
  }
  v15 = (void *)*MEMORY[0x24BDC8228];
  if (v9)
    v15 = v9;
  v16 = v15;

  objc_msgSend(v12, "parent");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", 22);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v22);
    v17 = 0;
    v9 = v16;
    goto LABEL_16;
  }
  v33 = v13;
  -[LiveFSFPExtensionHelper enumeratorForContainerItemIdentifier:error:](self, "enumeratorForContainerItemIdentifier:error:", v16, &v33);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v33;

  v20 = (void *)v36[5];
  v36[5] = v18;

  v21 = (void *)v36[5];
  if (!v21)
  {
    v13 = v19;
    if (v19)
      goto LABEL_10;
    goto LABEL_15;
  }
  objc_msgSend(v21, "ensureConnectedForUpdates");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
LABEL_15:
    -[LiveFSFPExtensionHelper URLForItemWithIdentifier:](self, "URLForItemWithIdentifier:", v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    renameUpdateQueue = self->renameUpdateQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __94__LiveFSFPExtensionHelper_untrashItemWithIdentifier_toParentItemIdentifier_completionHandler___block_invoke;
    block[3] = &unk_24E46B508;
    v26 = v12;
    v17 = v17;
    v27 = v17;
    v28 = self;
    v32 = &v35;
    v31 = v10;
    v14 = v14;
    v29 = v14;
    v30 = v23;
    v22 = v23;
    dispatch_async(renameUpdateQueue, block);

    v13 = 0;
    v9 = v16;
    goto LABEL_16;
  }
LABEL_10:
  v10[2](v10, 0, v13);
LABEL_17:
  _Block_object_dispose(&v35, 8);

}

void __94__LiveFSFPExtensionHelper_untrashItemWithIdentifier_toParentItemIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD *v13;
  _QWORD v14[5];
  id v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD v18[5];
  id v19;

  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__0;
  v18[4] = __Block_byref_object_dispose__0;
  v19 = 0;
  objc_msgSend(*(id *)(a1 + 32), "filename");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v4 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __94__LiveFSFPExtensionHelper_untrashItemWithIdentifier_toParentItemIdentifier_completionHandler___block_invoke_2;
  v14[3] = &unk_24E46B4B8;
  v5 = *(void **)(a1 + 40);
  v7 = *(void **)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 80);
  v14[4] = *(_QWORD *)(a1 + 48);
  v16 = v18;
  v17 = v6;
  v15 = v7;
  objc_msgSend(v5, "afterRename:performBlock:", v3, v14);
  v8 = *(void **)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 64);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __94__LiveFSFPExtensionHelper_untrashItemWithIdentifier_toParentItemIdentifier_completionHandler___block_invoke_212;
  v10[3] = &unk_24E46B530;
  v13 = v18;
  v11 = v8;
  v12 = *(id *)(a1 + 72);
  objc_msgSend(v11, "fp_reparentUnderFolder:allowBouncing:completionHandler:", v9, 1, v10);

  _Block_object_dispose(v18, 8);
}

void __94__LiveFSFPExtensionHelper_untrashItemWithIdentifier_toParentItemIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD block[5];
  __int128 v7;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 136);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __94__LiveFSFPExtensionHelper_untrashItemWithIdentifier_toParentItemIdentifier_completionHandler___block_invoke_3;
  block[3] = &unk_24E46B490;
  v3 = *(_QWORD *)(a1 + 56);
  v5 = *(_OWORD *)(a1 + 40);
  block[4] = v1;
  v8 = v3;
  v4 = (id)v5;
  v7 = v5;
  dispatch_async(v2, block);

}

void __94__LiveFSFPExtensionHelper_untrashItemWithIdentifier_toParentItemIdentifier_completionHandler___block_invoke_3(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  v9 = 0;
  objc_msgSend(v2, "itemForURL:error:", v3, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  livefs_std_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_21F8A5000, v6, OS_LOG_TYPE_DEFAULT, "untrash returning item %@ newError %@", buf, 0x16u);
  }

  v7 = *(_QWORD *)(a1[7] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  (*(void (**)(void))(a1[5] + 16))();
}

void __94__LiveFSFPExtensionHelper_untrashItemWithIdentifier_toParentItemIdentifier_completionHandler___block_invoke_212(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  if (!v6)
  {
    livefs_std_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __94__LiveFSFPExtensionHelper_untrashItemWithIdentifier_toParentItemIdentifier_completionHandler___block_invoke_212_cold_1(a1);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)deleteItemWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, id);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSMapTable *itemIDMap;
  void *v16;
  LiveFSLRUCache *itemCache;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  livefs_std_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v6;
    _os_log_impl(&dword_21F8A5000, v8, OS_LOG_TYPE_DEFAULT, "deleting item %@", buf, 0xCu);
  }

  -[LiveFSFPExtensionHelper itemForIdentifier:error:](self, "itemForIdentifier:error:", v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "parent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[LiveFSFPExtensionHelper URLForItemWithIdentifier:](self, "URLForItemWithIdentifier:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v13, "removeItemAtURL:error:", v12, &v21);
    v14 = v21;

    if (!v14)
    {
      itemIDMap = self->itemIDMap;
      objc_msgSend(v10, "itemIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable removeObjectForKey:](itemIDMap, "removeObjectForKey:", v16);

      itemCache = self->itemCache;
      objc_msgSend(v10, "itemIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[LiveFSLRUCache removeObjectForKey:](itemCache, "removeObjectForKey:", v18);

      objc_msgSend(v11, "setAttributesStale");
    }
    livefs_std_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v14;
      _os_log_impl(&dword_21F8A5000, v19, OS_LOG_TYPE_DEFAULT, "deleting returning %@", buf, 0xCu);
    }

    v7[2](v7, v14);
  }
  else
  {
    livefs_std_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F8A5000, v20, OS_LOG_TYPE_DEFAULT, "Where is IT", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "fileProviderErrorForNonExistentItemWithIdentifier:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v11);
  }

}

- (void)setLastUsedDate:(id)a3 forItemIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, id);
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, id))a5;
  livefs_std_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v23 = "-[LiveFSFPExtensionHelper setLastUsedDate:forItemIdentifier:completionHandler:]";
    v24 = 2112;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    _os_log_impl(&dword_21F8A5000, v11, OS_LOG_TYPE_INFO, "%s: setting lastUsedDate %@ for %@", buf, 0x20u);
  }

  -[LiveFSFPExtensionHelper itemForIdentifier:error:](self, "itemForIdentifier:error:", v9, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "fileProviderErrorForNonExistentItemWithIdentifier:", v9);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v16);
LABEL_15:

    goto LABEL_16;
  }
  if ((id)*MEMORY[0x24BDC8228] != v9)
  {
    objc_msgSend(v12, "fullPath");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = open((const char *)objc_msgSend(v14, "UTF8String"), 0);

    if (v15 < 0)
    {
      v18 = (void *)MEMORY[0x24BDD1540];
      v19 = *__error();
      -[LiveFSFPExtensionHelper URLForItemWithIdentifier:](self, "URLForItemWithIdentifier:", v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "fp_errorWithPOSIXCode:itemURL:debugDescription:", v19, v20, CFSTR("Opening file for setLastUsedDate"));
      v16 = (id)objc_claimAutoreleasedReturnValue();

      livefs_std_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[LiveFSFPExtensionHelper setLastUsedDate:forItemIdentifier:completionHandler:].cold.1();

      +[LiveFSFPExtensionHelper getNSErrorFromUnknownError:](LiveFSFPExtensionHelper, "getNSErrorFromUnknownError:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, 0, v17);
    }
    else
    {
      FPFileMetadataSetLastUsedDate();
      v16 = 0;
      close(v15);
      if (!v16)
        objc_msgSend(v13, "setLastUsedDate:", v8);
      +[LiveFSFPExtensionHelper getNSErrorFromUnknownError:](LiveFSFPExtensionHelper, "getNSErrorFromUnknownError:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, id))v10)[2](v10, v13, v17);
    }

    goto LABEL_15;
  }
  ((void (**)(id, void *, id))v10)[2](v10, v12, 0);
LABEL_16:

}

- (void)setTagData:(id)a3 forItemIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, uint64_t);
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  const char *v15;
  int v16;
  int v17;
  id v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, uint64_t))a5;
  if (!self->_supportsTagging)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 3328, 0);
    v20 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v13 = (void *)v20;
    v10[2](v10, 0, v20);
    goto LABEL_18;
  }
  livefs_std_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v26 = "-[LiveFSFPExtensionHelper setTagData:forItemIdentifier:completionHandler:]";
    v27 = 2112;
    v28 = v8;
    v29 = 2112;
    v30 = v9;
    _os_log_impl(&dword_21F8A5000, v11, OS_LOG_TYPE_INFO, "%s: setting tagData %@ for %@", buf, 0x20u);
  }

  -[LiveFSFPExtensionHelper itemForIdentifier:error:](self, "itemForIdentifier:error:", v9, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "fileProviderErrorForNonExistentItemWithIdentifier:", v9);
    v20 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v13 = v12;
  if ((id)*MEMORY[0x24BDC8228] == v9)
  {
    ((void (**)(id, void *, uint64_t))v10)[2](v10, v12, 0);
  }
  else
  {
    objc_msgSend(v12, "fullPath");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = (const char *)objc_msgSend(v14, "UTF8String");

    v16 = open(v15, 0);
    if (v16 < 0)
    {
      livefs_std_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[LiveFSFPExtensionHelper setTagData:forItemIdentifier:completionHandler:].cold.1((uint64_t)v15, v21);

      v22 = (void *)MEMORY[0x24BDD1540];
      v23 = *__error();
      -[LiveFSFPExtensionHelper URLForItemWithIdentifier:](self, "URLForItemWithIdentifier:", v9);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "fp_errorWithPOSIXCode:itemURL:debugDescription:", v23, v24, CFSTR("Opening file for setTagData"));
      v18 = (id)objc_claimAutoreleasedReturnValue();

      +[LiveFSFPExtensionHelper getNSErrorFromUnknownError:](LiveFSFPExtensionHelper, "getNSErrorFromUnknownError:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, 0, (uint64_t)v19);
    }
    else
    {
      v17 = v16;
      FPFileMetadataSetTagData();
      v18 = 0;
      close(v17);
      if (!v18)
        objc_msgSend(v13, "setTagData:", v8);
      +[LiveFSFPExtensionHelper getNSErrorFromUnknownError:](LiveFSFPExtensionHelper, "getNSErrorFromUnknownError:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, uint64_t))v10)[2](v10, v13, (uint64_t)v19);
    }

  }
LABEL_18:

}

- (void)setFavoriteRank:(id)a3 forItemIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, id);
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  const char *v15;
  int v16;
  int v17;
  id v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, id))a5;
  livefs_std_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v27 = "-[LiveFSFPExtensionHelper setFavoriteRank:forItemIdentifier:completionHandler:]";
    v28 = 2112;
    v29 = v8;
    v30 = 2112;
    v31 = v9;
    _os_log_impl(&dword_21F8A5000, v11, OS_LOG_TYPE_INFO, "%s: setting rank %@ for %@", buf, 0x20u);
  }

  -[LiveFSFPExtensionHelper itemForIdentifier:error:](self, "itemForIdentifier:error:", v9, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    livefs_std_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[LiveFSFPExtensionHelper setFavoriteRank:forItemIdentifier:completionHandler:]";
      _os_log_impl(&dword_21F8A5000, v20, OS_LOG_TYPE_INFO, "%s: item not found", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "fileProviderErrorForNonExistentItemWithIdentifier:", v9);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v18);
    goto LABEL_19;
  }
  if ((id)*MEMORY[0x24BDC8228] != v9)
  {
    objc_msgSend(v12, "fullPath");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = (const char *)objc_msgSend(v14, "UTF8String");

    v16 = open(v15, 0);
    if (v16 < 0)
    {
      livefs_std_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[LiveFSFPExtensionHelper setFavoriteRank:forItemIdentifier:completionHandler:].cold.2((uint64_t)v15, v22);

      v23 = (void *)MEMORY[0x24BDD1540];
      v24 = *__error();
      -[LiveFSFPExtensionHelper URLForItemWithIdentifier:](self, "URLForItemWithIdentifier:", v9);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "fp_errorWithPOSIXCode:itemURL:debugDescription:", v24, v25, CFSTR("Opening file for setFavoriteRank"));
      v18 = (id)objc_claimAutoreleasedReturnValue();

      +[LiveFSFPExtensionHelper getNSErrorFromUnknownError:](LiveFSFPExtensionHelper, "getNSErrorFromUnknownError:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, 0, v19);
    }
    else
    {
      v17 = v16;
      FPFileMetadataSetFavoriteRank();
      v18 = 0;
      close(v17);
      if (!v18)
        objc_msgSend(v13, "setFavoriteRank:", v8);
      +[LiveFSFPExtensionHelper getNSErrorFromUnknownError:](LiveFSFPExtensionHelper, "getNSErrorFromUnknownError:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, id))v10)[2](v10, v13, v19);
    }

LABEL_19:
    goto LABEL_20;
  }
  livefs_std_log();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    -[LiveFSFPExtensionHelper setFavoriteRank:forItemIdentifier:completionHandler:].cold.1();

  ((void (**)(id, void *, id))v10)[2](v10, v13, 0);
LABEL_20:

}

- (id)disconnectWithOptions:(unint64_t)a3 completionHandler:(id)a4
{
  void (**v5)(id, void *);
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  LiveFSFPExtensionHelper *v13;
  id *v14;
  BOOL v15;
  LiveFSClient *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD block[5];
  LiveFSFPExtensionHelper *v23;
  void (**v24)(id, void *);
  _BYTE *v25;
  id obj;
  _BYTE buf[24];
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(id, void *))a4;
  livefs_std_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[NSFileProviderExtension domain](self, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[LiveFSFPExtensionHelper disconnectWithOptions:completionHandler:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v8;
    _os_log_impl(&dword_21F8A5000, v6, OS_LOG_TYPE_DEFAULT, "%s: called on domain %@", buf, 0x16u);

  }
  -[NSFileProviderExtension domain](self, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_9;
  -[NSFileProviderExtension domain](self, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 == 0;

  if (v12)
  {
LABEL_9:
    +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", 22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v20);

    v19 = (void *)objc_opt_new();
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v28 = __Block_byref_object_copy__0;
    v29 = __Block_byref_object_dispose__0;
    v30 = 0;
    v13 = self;
    objc_sync_enter(v13);
    v14 = (id *)(*(_QWORD *)&buf[8] + 40);
    obj = *(id *)(*(_QWORD *)&buf[8] + 40);
    v15 = -[LiveFSFPExtensionHelper _hasManagerOrError:](v13, "_hasManagerOrError:", &obj);
    objc_storeStrong(v14, obj);
    if (v15)
    {
      objc_sync_exit(v13);

      v16 = v13->_manager;
      dispatch_get_global_queue(25, 0);
      v17 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __67__LiveFSFPExtensionHelper_disconnectWithOptions_completionHandler___block_invoke;
      block[3] = &unk_24E46B580;
      block[4] = v13;
      v25 = buf;
      v13 = v16;
      v23 = v13;
      v24 = v5;
      dispatch_async(v17, block);
      livefs_std_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[LiveFSFPExtensionHelper disconnectWithOptions:completionHandler:].cold.1();

      v19 = (void *)objc_opt_new();
    }
    else
    {
      v5[2](v5, *(void **)(*(_QWORD *)&buf[8] + 40));
      v19 = (void *)objc_opt_new();
      objc_sync_exit(v13);
    }

    _Block_object_dispose(buf, 8);
  }

  return v19;
}

uint64_t __67__LiveFSFPExtensionHelper_disconnectWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  dispatch_semaphore_t v20;
  void *v21;
  NSObject *v22;
  dispatch_time_t v23;
  _QWORD v25[4];
  dispatch_semaphore_t v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  livefs_std_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "domain");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v29 = v4;
    _os_log_impl(&dword_21F8A5000, v2, OS_LOG_TYPE_DEFAULT, "About to call forgetVolume on %@", buf, 0xCu);

  }
  v5 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "forgetVolume:withFlags:", v7, 3);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  livefs_std_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    *(_DWORD *)buf = 138412290;
    v29 = v12;
    _os_log_impl(&dword_21F8A5000, v11, OS_LOG_TYPE_DEFAULT, "forgetVolume returned %@", buf, 0xCu);
  }

  v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v15)
  {
    objc_msgSend(v15, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
LABEL_9:

      return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v13, v14);
    }
    v17 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "code");

    if (v17 == 4)
    {
      v18 = (void *)MEMORY[0x24BDC83F0];
      objc_msgSend(*(id *)(a1 + 32), "domain");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "managerForDomain:", v19);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = dispatch_semaphore_create(0);
      objc_msgSend(*(id *)(a1 + 32), "domain");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __67__LiveFSFPExtensionHelper_disconnectWithOptions_completionHandler___block_invoke_221;
      v25[3] = &unk_24E46B558;
      v26 = v20;
      v27 = *(id *)(a1 + 48);
      v22 = v20;
      objc_msgSend(v16, "removeDomain:completionHandler:", v21, v25);

      v23 = dispatch_time(0, 10000000000);
      dispatch_semaphore_wait(v22, v23);

      goto LABEL_9;
    }
  }
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v13, v14);
}

void __67__LiveFSFPExtensionHelper_disconnectWithOptions_completionHandler___block_invoke_221(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  livefs_std_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __67__LiveFSFPExtensionHelper_disconnectWithOptions_completionHandler___block_invoke_221_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = 0;
    _os_log_impl(&dword_21F8A5000, v5, OS_LOG_TYPE_DEFAULT, "Self removeDomain replied %@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)enumeratorForContainerItemIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  NSObject *v21;
  void *v22;
  int v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  _BOOL4 v40;
  __int16 v41;
  _BOOL4 v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[NSFileProviderExtension domain](self, "domain");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
LABEL_8:
    livefs_std_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[LiveFSFPExtensionHelper enumeratorForContainerItemIdentifier:error:].cold.2();

    +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", 22);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!v16)
      goto LABEL_14;
    livefs_std_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    goto LABEL_12;
  }
  v8 = (void *)v7;
  -[NSFileProviderExtension domain](self, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {

    goto LABEL_8;
  }
  v11 = (void *)v10;
  -[NSFileProviderExtension domain](self, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", &stru_24E46BB18);

  if (v14)
    goto LABEL_8;
  -[LiveFSFPExtensionHelper ensureMountPathSetup](self, "ensureMountPathSetup");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = v15;
    livefs_std_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
LABEL_12:
      -[LiveFSFPExtensionHelper enumeratorForContainerItemIdentifier:error:].cold.1();
LABEL_13:

LABEL_14:
    if (a4)
      *a4 = objc_retainAutorelease(v16);

    v19 = 0;
    goto LABEL_17;
  }
  livefs_std_log();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    -[LiveFSFPExtensionHelper clusterMasterID](self, "clusterMasterID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v34 = "-[LiveFSFPExtensionHelper enumeratorForContainerItemIdentifier:error:]";
    v35 = 2112;
    v36 = v6;
    v37 = 2112;
    v38 = v22;
    v39 = 1024;
    v40 = -[LiveFSFPExtensionHelper isClusterMaster](self, "isClusterMaster");
    v41 = 1024;
    v42 = -[LiveFSFPExtensionHelper isClusterDomain](self, "isClusterDomain");
    _os_log_impl(&dword_21F8A5000, v21, OS_LOG_TYPE_DEFAULT, "%s starting for containerItem %@, clusterMasterID (%@), clusterMaster (%d) clusterDomain (%d)", buf, 0x2Cu);

  }
  if (-[LiveFSFPExtensionHelper isClusterMaster](self, "isClusterMaster"))
  {
    v19 = +[LiveFSFPClusterEnumeratorHelper newWithEnumeratedItem:extension:error:](LiveFSFPClusterEnumeratorHelper, "newWithEnumeratedItem:extension:error:", v6, self, a4);
    goto LABEL_17;
  }
  v23 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDC8238]);
  livefs_std_log();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (v23)
  {
    if (v25)
    {
      -[NSFileProviderExtension domain](self, "domain");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "identifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v34 = "-[LiveFSFPExtensionHelper enumeratorForContainerItemIdentifier:error:]";
      v35 = 2112;
      v36 = v27;
      _os_log_impl(&dword_21F8A5000, v24, OS_LOG_TYPE_DEFAULT, "%s starting for container NSFileProviderWorkingSetContainerItemIdentifier self.domain.identifier %@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 3328, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!v16)
      goto LABEL_14;
    livefs_std_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[LiveFSFPExtensionHelper enumeratorForContainerItemIdentifier:error:].cold.1();
    goto LABEL_13;
  }
  if (v25)
  {
    -[NSFileProviderExtension domain](self, "domain");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v34 = "-[LiveFSFPExtensionHelper enumeratorForContainerItemIdentifier:error:]";
    v35 = 2112;
    v36 = v29;
    _os_log_impl(&dword_21F8A5000, v24, OS_LOG_TYPE_DEFAULT, "%s starting for container LiveFSFPEnumeratorHelper self.domain.identifier %@", buf, 0x16u);

  }
  v32 = 0;
  v19 = +[LiveFSFPEnumeratorHelper newWithEnumeratedItem:extension:error:](LiveFSFPEnumeratorHelper, "newWithEnumeratedItem:extension:error:", v6, self, &v32);
  v30 = v32;
  if (v30)
  {
    livefs_std_log();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[LiveFSFPExtensionHelper enumeratorForContainerItemIdentifier:error:].cold.1();

  }
  if (a4)
    *a4 = objc_retainAutorelease(v30);

LABEL_17:
  return v19;
}

- (id)supportedServiceSourcesForItemIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  LiveFSFPUnlockServiceSource *v14;
  void *v15;
  NSObject *v16;
  LiveFSClientServiceSource *v17;
  LiveFSValidationServiceSource *v18;
  LiveFSThumbnailsServiceSource *thumbnailsServiceSource;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  id v24;
  _QWORD v25[4];
  LiveFSFPUnlockServiceSource *v26;
  uint8_t buf[4];
  LiveFSFPExtensionHelper *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  livefs_std_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[NSFileProviderExtension domain](self, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v28 = self;
    v29 = 2112;
    v30 = v9;
    v31 = 2112;
    v32 = v6;
    _os_log_impl(&dword_21F8A5000, v7, OS_LOG_TYPE_DEFAULT, "supportedServices called in extension %@, domain id %@ item %@", buf, 0x20u);

  }
  -[NSFileProviderExtension domain](self, "domain");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_7;
  v11 = (void *)v10;
  -[NSFileProviderExtension domain](self, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = -[LiveFSFPUnlockServiceSource initWithFileProviderExtension:itemIdentifier:]([LiveFSFPUnlockServiceSource alloc], "initWithFileProviderExtension:itemIdentifier:", self, v6);
    v24 = 0;
    -[LiveFSFPExtensionHelper itemForIdentifier:error:](self, "itemForIdentifier:error:", v6, &v24);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v24;
    if (v15)
    {
      v17 = -[LiveFSClientServiceSource initWithFileProviderExtension:itemIdentifier:]([LiveFSClientServiceSource alloc], "initWithFileProviderExtension:itemIdentifier:", self, v6);
      v18 = -[LiveFSValidationServiceSource initWithFileProviderExtension:itemIdentifier:]([LiveFSValidationServiceSource alloc], "initWithFileProviderExtension:itemIdentifier:", self, v6);
      thumbnailsServiceSource = self->thumbnailsServiceSource;
      v25[0] = v17;
      v25[1] = thumbnailsServiceSource;
      v25[2] = v18;
      v25[3] = v14;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDC8228]))
    {
      v26 = v14;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v26, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = v16;
      if (v21)
      {
        livefs_std_log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[LiveFSFPExtensionHelper supportedServiceSourcesForItemIdentifier:error:].cold.2();

      }
      if (a4)
        *a4 = objc_retainAutorelease(v21);

      v20 = (void *)MEMORY[0x24BDBD1A8];
    }

  }
  else
  {
LABEL_7:
    livefs_std_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[LiveFSFPExtensionHelper supportedServiceSourcesForItemIdentifier:error:].cold.1();
    v20 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v20;
}

- (id)enumeratorForSearchQuery:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  if (-[LiveFSFPExtensionHelper serverSearchUsesCS](self, "serverSearchUsesCS"))
  {
    v7 = objc_alloc(MEMORY[0x24BDC8320]);
    -[NSFileProviderExtension domain](self, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithSearchQuery:mountPoint:", v6, v9);

  }
  else
  {
    v11 = +[LiveFSFPSearchEnumeratorHelper newForQuery:withExtension:](LiveFSFPSearchEnumeratorHelper, "newForQuery:withExtension:", v6, self);
    v10 = v11;
    if (a4 && !v11)
    {
      +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", 22);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v10;
}

- (id)clusterDomainItemsOrError:(id *)a3
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (void)unlockWithPassword:(id)a3 remember:(BOOL)a4 completionHandler:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", 45);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a5 + 2))(v6, v7);

}

+ (id)getNSErrorFromLiveFSErrno:(int)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void **v11;
  uint64_t *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  if (a3 > 44)
  {
    if (a3 > 79)
    {
      switch(a3)
      {
        case 80:
          goto LABEL_19;
        case 89:
          v3 = (void *)MEMORY[0x24BDD1540];
          v4 = *MEMORY[0x24BDD0B88];
          v5 = 3072;
          goto LABEL_26;
        case 10100:
LABEL_19:
          v3 = (void *)MEMORY[0x24BDD1540];
          v4 = *MEMORY[0x24BDC81B0];
          v5 = -1000;
          goto LABEL_26;
      }
    }
    else
    {
      if (a3 == 45)
      {
        v3 = (void *)MEMORY[0x24BDD1540];
        v4 = *MEMORY[0x24BDD0B88];
        v5 = 3328;
        goto LABEL_26;
      }
      if (a3 == 57 || a3 == 65)
      {
        v3 = (void *)MEMORY[0x24BDD1540];
        v4 = *MEMORY[0x24BDC81B0];
        v5 = -1004;
        goto LABEL_26;
      }
    }
    goto LABEL_27;
  }
  if (a3 <= 21)
  {
    switch(a3)
    {
      case 0:
        return 0;
      case 2:
        v3 = (void *)MEMORY[0x24BDD1540];
        v4 = *MEMORY[0x24BDD0B88];
        v5 = 4;
        goto LABEL_26;
      case 13:
        v3 = (void *)MEMORY[0x24BDD1540];
        v4 = *MEMORY[0x24BDD0B88];
        v5 = 257;
LABEL_26:
        objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, v5, 0);
        return (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_27;
  }
  if (a3 != 22)
  {
    if (a3 == 28)
    {
      v3 = (void *)MEMORY[0x24BDD1540];
      v4 = *MEMORY[0x24BDD0B88];
      v5 = 640;
      goto LABEL_26;
    }
    if (a3 == 30)
    {
      v3 = (void *)MEMORY[0x24BDD1540];
      v4 = *MEMORY[0x24BDD0B88];
      v5 = 642;
      goto LABEL_26;
    }
LABEL_27:
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BDD0B88];
    v15 = *MEMORY[0x24BDD1398];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], a3, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v9;
    v10 = (void *)MEMORY[0x24BDBCE70];
    v11 = &v16;
    v12 = &v15;
    goto LABEL_28;
  }
  v7 = (void *)MEMORY[0x24BDD1540];
  v8 = *MEMORY[0x24BDD0B88];
  v17 = *MEMORY[0x24BDD1398];
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v10 = (void *)MEMORY[0x24BDBCE70];
  v11 = (void **)v18;
  v12 = &v17;
LABEL_28:
  objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 256, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)getNSErrorFromUnknownError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;

  v3 = a3;
  v4 = v3;
  if (v3
    && (objc_msgSend(v3, "domain"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDD1128]),
        v5,
        v6))
  {
    objc_msgSend(v4, "code");
    getNSErrorFromLiveFSErrno();
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v4;
  }
  v8 = v7;

  return v8;
}

- (NSURL)docPath
{
  return (NSURL *)objc_getProperty(self, a2, 152, 1);
}

- (void)setMountPath:(id)a3
{
  objc_storeStrong((id *)&self->_mountPath, a3);
}

- (LiveFSClient)manager
{
  return self->_manager;
}

- (NSXPCConnection)conn
{
  return self->_conn;
}

- (LiveFSVolumeClient)serviceClient
{
  return self->_serviceClient;
}

- (BOOL)idsPersist
{
  return self->_idsPersist;
}

- (BOOL)isReadOnlyVolume
{
  return self->_isReadOnlyVolume;
}

- (BOOL)supportsTagging
{
  return self->_supportsTagging;
}

- (BOOL)fetchRoot
{
  return self->_fetchRoot;
}

- (void)setFetchRoot:(BOOL)a3
{
  self->_fetchRoot = a3;
}

- (OS_dispatch_queue)enumeratorHelperQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 192, 1);
}

- (BOOL)isClusterDomain
{
  return self->_clusterDomain;
}

- (void)setClusterDomain:(BOOL)a3
{
  self->_clusterDomain = a3;
}

- (BOOL)isClusterMaster
{
  return self->_clusterMaster;
}

- (void)setClusterMaster:(BOOL)a3
{
  self->_clusterMaster = a3;
}

- (NSString)clusterMasterID
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (BOOL)isDead
{
  return self->_isDead;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusterMasterID, 0);
  objc_storeStrong((id *)&self->_enumeratorHelperQueue, 0);
  objc_storeStrong((id *)&self->_serviceClient, 0);
  objc_storeStrong((id *)&self->_conn, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_mountPath, 0);
  objc_storeStrong((id *)&self->_docPath, 0);
  objc_storeStrong((id *)&self->renameUpdateQueue, 0);
  objc_storeStrong((id *)&self->thumbnailsServiceSource, 0);
  objc_storeStrong((id *)&self->itemCache, 0);
  objc_storeStrong((id *)&self->enumerators, 0);
  objc_storeStrong((id *)&self->itemHandleMap, 0);
  objc_storeStrong((id *)&self->itemIDMap, 0);
  objc_storeStrong((id *)&self->providerName, 0);
  objc_storeStrong((id *)&self->connectionURL, 0);
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_4(&dword_21F8A5000, v0, v1, "LiveFS FileProvider Unable to init extension. Exiting.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_13();
}

- (void)itemPathForURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_17(&dword_21F8A5000, v0, v1, "About to return root path", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_13();
}

- (void)itemPathForURL:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5_0(&dword_21F8A5000, v0, v1, "%s: returning path %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)itemPathForURL:(uint64_t)a1 .cold.3(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_2(&dword_21F8A5000, v1, (uint64_t)v1, "url isn't in our path. '%@' not in '%@'", (uint8_t *)&v2);
  OUTLINED_FUNCTION_0();
}

- (void)itemForPath:cachedOnly:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_21F8A5000, v0, v1, "%s: %s error: %@");
  OUTLINED_FUNCTION_7_0();
}

- (void)_hasManagerOrError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_4(&dword_21F8A5000, v0, v1, "LiveFS FileProvider Extension: Unable to connect to smbclientd. Exiting.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_13();
}

- (void)_hasManagerOrError:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[LiveFSFPExtensionHelper _hasManagerOrError:]";
  OUTLINED_FUNCTION_1(&dword_21F8A5000, a1, a3, "%s: need new manager, about to get it", (uint8_t *)&v3);
  OUTLINED_FUNCTION_0();
}

- (void)getVolumeManagerWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_21F8A5000, a2, a3, "getVolManager returning error %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)makeVolumeListenerEndpointAndReturnErrorLocked:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_21F8A5000, v0, v1, "%s: %s error: %@");
  OUTLINED_FUNCTION_7_0();
}

- (void)makeVolumeListenerEndpointAndReturnErrorLocked:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_21F8A5000, a1, a3, "%s: our domain no longer has a volume!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)makeVolumeListenerEndpointAndReturnErrorLocked:.cold.4()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_0(&dword_21F8A5000, v0, v1, "%s: got vols %@ error %@", v2);
  OUTLINED_FUNCTION_7_0();
}

- (void)_isLoggedInOrErrorLocked:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_21F8A5000, v0, v1, "%s: %s error: %@");
  OUTLINED_FUNCTION_7_0();
}

- (void)_isLoggedInOrErrorLocked:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[LiveFSFPExtensionHelper _isLoggedInOrErrorLocked:]";
  OUTLINED_FUNCTION_1(&dword_21F8A5000, a1, a3, "%s: got connection", (uint8_t *)&v3);
  OUTLINED_FUNCTION_0();
}

- (void)_isLoggedInOrErrorLocked:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 136315650;
  v8 = "-[LiveFSFPExtensionHelper _isLoggedInOrErrorLocked:]";
  v9 = 2112;
  v10 = v5;
  v11 = 2112;
  v12 = v6;
  _os_log_debug_impl(&dword_21F8A5000, a2, OS_LOG_TYPE_DEBUG, "%s: About to get listener for volume %@ domain %@", (uint8_t *)&v7, 0x20u);

}

- (void)_isLoggedInOrErrorLocked:(void *)a1 .cold.5(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_21F8A5000, a2, v5, "Cluster master %@ doesn't need a listener", v6);

  OUTLINED_FUNCTION_12();
}

- (void)_isLoggedInOrErrorLocked:(void *)a1 .cold.6(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_21F8A5000, a2, v5, "We already have connection for %@, bailing early", v6);

  OUTLINED_FUNCTION_12();
}

- (void)pathForInodeID:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_21F8A5000, v0, v1, "%s: %s error: %@");
  OUTLINED_FUNCTION_7_0();
}

- (void)itemForIdentifierLocked:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_21F8A5000, v0, v1, "%s: %s error: %@");
  OUTLINED_FUNCTION_7_0();
}

- (void)itemForIdentifierLocked:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5_0(&dword_21F8A5000, v0, v1, "%s starting for ID %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)itemForIdentifier:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_21F8A5000, v0, v1, "%s: %s error: %@");
  OUTLINED_FUNCTION_7_0();
}

- (void)URLForItemWithIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_18(&dword_21F8A5000, v0, v1, "Call to URLForItemWithIdentifier: in unconfigured domain", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_13();
}

- (void)URLForItemWithIdentifier:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_0(&dword_21F8A5000, a2, a3, "%s starting, mountPath is%s setup", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)itemAtPathLocked:(uint64_t)a1 parent:(NSObject *)a2 cachedOnly:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v3 = 136315650;
  v4 = "-[LiveFSFPExtensionHelper itemAtPathLocked:parent:cachedOnly:]";
  v5 = 2080;
  v6 = "(ignored by caller)";
  v7 = 2112;
  v8 = v2;
  _os_log_error_impl(&dword_21F8A5000, a2, OS_LOG_TYPE_ERROR, "%s: %s error: %@", (uint8_t *)&v3, 0x20u);
  OUTLINED_FUNCTION_7_0();
}

- (void)persistentIdentifierForItemAtURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5_0(&dword_21F8A5000, v0, v1, "%s: returning fh %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)providePlaceholderAtURL:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5_0(&dword_21F8A5000, v0, v1, "%s starting for %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)startProvidingItemAtURL:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5_0(&dword_21F8A5000, v0, v1, "%s starting for %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)stopProvidingItemAtURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5_0(&dword_21F8A5000, v0, v1, "%s starting for url %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

void __88__LiveFSFPExtensionHelper_importDocumentAtURL_toParentItemIdentifier_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_21F8A5000, v0, v1, "couldn't find item after importing it: %@", v2);
  OUTLINED_FUNCTION_0();
}

void __88__LiveFSFPExtensionHelper_importDocumentAtURL_toParentItemIdentifier_completionHandler___block_invoke_cold_2(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_8(&dword_21F8A5000, v1, (uint64_t)v1, "got new URL %@; %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_0();
}

- (void)createDirectoryWithName:inParentItemIdentifier:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_21F8A5000, v0, v1, "ensureFileHandleOrError returned %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)createDirectoryWithName:(void *)a1 inParentItemIdentifier:(NSObject *)a2 completionHandler:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_21F8A5000, a2, v5, "Cluster master %@ is not writable", v6);

  OUTLINED_FUNCTION_12();
}

- (void)createDirectoryWithName:inParentItemIdentifier:completionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_21F8A5000, v0, v1, "_isLoggedInOrError returned %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)renameItemWithIdentifier:(NSObject *)a3 toName:(void *)a4 completionHandler:.cold.1(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4_0(&dword_21F8A5000, a3, (uint64_t)a3, "Cluster master %@ is not writable", (uint8_t *)a2);

  OUTLINED_FUNCTION_20();
}

- (void)reparentItemWithIdentifier:(NSObject *)a3 toParentItemWithIdentifier:newName:completionHandler:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1(&dword_21F8A5000, a3, (uint64_t)a3, "passed new name is null, changing to %@", (uint8_t *)a2);

  OUTLINED_FUNCTION_20();
}

- (void)trashItemWithIdentifier:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_21F8A5000, v0, v1, "creating the trash directory failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __94__LiveFSFPExtensionHelper_untrashItemWithIdentifier_toParentItemIdentifier_completionHandler___block_invoke_212_cold_1(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = 138412546;
  v4 = v1;
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_2(&dword_21F8A5000, v2, (uint64_t)v2, "untrashing item at url %@ failed with error: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_0();
}

- (void)setLastUsedDate:forItemIdentifier:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_21F8A5000, v0, v1, "lastUsedDate: error '%@' opening file", v2);
  OUTLINED_FUNCTION_0();
}

- (void)setTagData:(uint64_t)a1 forItemIdentifier:(NSObject *)a2 completionHandler:.cold.1(uint64_t a1, NSObject *a2)
{
  int *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = __error();
  strerror(*v3);
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_8(&dword_21F8A5000, a2, v4, "tagData: error '%s' opening file %s", v5);
  OUTLINED_FUNCTION_7_0();
}

- (void)setFavoriteRank:forItemIdentifier:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_17(&dword_21F8A5000, v0, v1, "Faking success for setting fav rank for root item", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_13();
}

- (void)setFavoriteRank:(uint64_t)a1 forItemIdentifier:(NSObject *)a2 completionHandler:.cold.2(uint64_t a1, NSObject *a2)
{
  int *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = __error();
  strerror(*v3);
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_2(&dword_21F8A5000, a2, v4, "setFavoriteRank: error '%s' opening file %s", v5);
  OUTLINED_FUNCTION_7_0();
}

- (void)disconnectWithOptions:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_4(&dword_21F8A5000, v0, v1, "forget has been dispatched", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_13();
}

void __67__LiveFSFPExtensionHelper_disconnectWithOptions_completionHandler___block_invoke_221_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_21F8A5000, v0, v1, "Self removeDomain replied %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)enumeratorForContainerItemIdentifier:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_21F8A5000, v0, v1, "%s: %s error: %@");
  OUTLINED_FUNCTION_7_0();
}

- (void)enumeratorForContainerItemIdentifier:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_18(&dword_21F8A5000, v0, v1, "Call to enumeratorForContainerItemIdentifier:error: in unconfigured domain", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_13();
}

- (void)supportedServiceSourcesForItemIdentifier:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_4(&dword_21F8A5000, v0, v1, "Returning no services on the default domain", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_13();
}

- (void)supportedServiceSourcesForItemIdentifier:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_21F8A5000, v0, v1, "%s: %s error: %@");
  OUTLINED_FUNCTION_7_0();
}

@end
