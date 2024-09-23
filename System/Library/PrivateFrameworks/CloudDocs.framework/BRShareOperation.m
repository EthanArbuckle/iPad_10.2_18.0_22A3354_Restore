@implementation BRShareOperation

- (BRShareOperation)init
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  const char *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  abc_report_panic_with_signature(CFSTR("BRShareOperation must be initialized with a URL"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BRShareOperation must be initialized with a URL"));
  v2 = objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs((uint64_t)"-[BRShareOperation init]", 204);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    brc_append_system_info_to_message(v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_fault_impl(&dword_19CBF0000, v4, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", (uint8_t *)&v7, 0x16u);

  }
  brc_append_system_info_to_message(v2);
  v6 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  __assert_rtn("-[BRShareOperation init]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/operations/BRShareOperations.m", 204, v6);
}

- (BRShareOperation)initWithShare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  BRShareOperation *v8;
  int v10;
  BRShareOperation *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  br_shareAssociatedURL(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (BRShareProcessShouldUseDirectConnection())
    {
      brc_bread_crumbs((uint64_t)"-[BRShareOperation initWithShare:]", 212);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[BRShareOperation initWithShare:].cold.1();
    }
    else
    {
      brc_bread_crumbs((uint64_t)"-[BRShareOperation initWithShare:]", 214);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
      {
        v10 = 138412802;
        v11 = self;
        v12 = 2112;
        v13 = v4;
        v14 = 2112;
        v15 = v6;
        _os_log_error_impl(&dword_19CBF0000, v7, (os_log_type_t)0x90u, "[ERROR] %@ initialized with CKShare %@ that wasn't returned by BRShareCopyShareOperation. Falling back to default connection.%@", (uint8_t *)&v10, 0x20u);
      }
    }

  }
  v8 = -[BRShareOperation initWithURL:](self, "initWithURL:", v5);

  return v8;
}

- (BRShareOperation)initWithDirectConnection
{
  BRShareOperation *v2;
  void *v3;
  NSObject *v4;
  int v6;
  BRShareOperation *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = -[BRShareOperation initWithURL:](self, "initWithURL:", 0);
  if (v2)
  {
    brc_bread_crumbs((uint64_t)"-[BRShareOperation initWithDirectConnection]", 223);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412546;
      v7 = v2;
      v8 = 2112;
      v9 = v3;
      _os_log_impl(&dword_19CBF0000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ initialized without share/url, but using default connection%@", (uint8_t *)&v6, 0x16u);
    }

  }
  return v2;
}

- (BRShareOperation)initWithItemIdentifier:(id)a3
{
  id v5;
  BRShareOperation *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  BRShareOperationProtocol *remoteObject;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRShareOperation;
  v6 = -[BROperation init](&v13, sel_init);
  if (v6)
  {
    brc_bread_crumbs((uint64_t)"-[BRShareOperation initWithItemIdentifier:]", 231);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[BRShareOperation initWithItemIdentifier:].cold.1();

    objc_storeStrong((id *)&v6->_itemID, a3);
    +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "remoteObjectProxy");
    v10 = objc_claimAutoreleasedReturnValue();
    remoteObject = v6->_remoteObject;
    v6->_remoteObject = (BRShareOperationProtocol *)v10;

  }
  return v6;
}

- (BRShareOperation)initWithURL:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  void *v13;
  dispatch_group_t v14;
  void *v15;
  int ShouldUseDirectConnection;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  objc_super v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BRShareOperation;
  v5 = -[BROperation init](&v32, sel_init);
  if (!v5)
  {
LABEL_15:
    v21 = v5;
    goto LABEL_16;
  }
  brc_bread_crumbs((uint64_t)"-[BRShareOperation initWithURL:]", 241);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[BRShareOperation initWithURL:].cold.2();

  v31 = 0;
  objc_msgSend(v4, "getResourceValue:forKey:error:", &v31, CFSTR("FPOriginalDocumentURL"), 0);
  v8 = v31;
  if (v8)
  {
    brc_bread_crumbs((uint64_t)"-[BRShareOperation initWithURL:]", 245);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v34 = v4;
      v35 = 2112;
      v36 = v8;
      v37 = 2112;
      v38 = v9;
      _os_log_debug_impl(&dword_19CBF0000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] originalURL found on %@: %@%@", buf, 0x20u);
    }

    v11 = v8;
    v4 = v11;
  }
  objc_msgSend(v4, "filePathURL");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)*((_QWORD *)v5 + 41);
  *((_QWORD *)v5 + 41) = v12;

  if (!v4 || *((_QWORD *)v5 + 41))
  {
    v14 = dispatch_group_create();
    v15 = (void *)*((_QWORD *)v5 + 37);
    *((_QWORD *)v5 + 37) = v14;

    ShouldUseDirectConnection = BRShareProcessShouldUseDirectConnection();
    if (!v4 || ShouldUseDirectConnection)
    {
      +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "remoteObjectProxy");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)*((_QWORD *)v5 + 40);
      *((_QWORD *)v5 + 40) = v19;

    }
    else
    {
      dispatch_group_enter(*((dispatch_group_t *)v5 + 37));
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __32__BRShareOperation_initWithURL___block_invoke;
      v28[3] = &unk_1E3DA4C98;
      v29 = v5;
      v30 = v4;
      objc_msgSend(v17, "getFileProviderServicesForItemAtURL:completionHandler:", v30, v28);

      v18 = v29;
    }

    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorInvalidParameter:value:", CFSTR("url"), v4);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)*((_QWORD *)v5 + 38);
  *((_QWORD *)v5 + 38) = v23;

  brc_bread_crumbs((uint64_t)"-[BRShareOperation initWithURL:]", 251);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
    -[BRShareOperation initWithURL:].cold.1();

  v27 = v5;
LABEL_16:

  return (BRShareOperation *)v5;
}

void __32__BRShareOperation_initWithURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (objc_msgSend(v6, "br_isFileProviderErrorCode:", -1005)
      && (objc_msgSend(v7, "userInfo"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CAAB60]),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v13,
          v12,
          v13))
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(*(id *)(a1 + 40), "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "brc_errorNotInCloud:", v15);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(a1 + 32);
      v18 = *(void **)(v17 + 304);
      *(_QWORD *)(v17 + 304) = v16;

      v19 = *(id *)(*(_QWORD *)(a1 + 32) + 304);
      brc_bread_crumbs((uint64_t)"-[BRShareOperation initWithURL:]_block_invoke", 267);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
      {
        v22 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        v31 = v22;
        v32 = 2112;
        v33 = v19;
        v34 = 2112;
        v35 = v20;
        _os_log_error_impl(&dword_19CBF0000, v21, (os_log_type_t)0x90u, "[ERROR] failed to get services for url %@ (%@)%@", buf, 0x20u);
      }
    }
    else
    {
      brc_bread_crumbs((uint64_t)"-[BRShareOperation initWithURL:]_block_invoke", 269);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        v25 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        v31 = v25;
        v32 = 2112;
        v33 = v7;
        v34 = 2112;
        v35 = v20;
        _os_log_fault_impl(&dword_19CBF0000, v21, OS_LOG_TYPE_FAULT, "[CRIT] failed to get services for url %@ (%@)%@", buf, 0x20u);
      }
      v19 = v7;
    }

    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 296));
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("com.apple.CloudDocs.private.SharingOperation"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 312);
    *(_QWORD *)(v9 + 312) = v8;

    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 312);
    if (v11)
    {
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __32__BRShareOperation_initWithURL___block_invoke_50;
      v26[3] = &unk_1E3DA4C70;
      v27 = *(id *)(a1 + 40);
      v28 = 0;
      v29 = *(id *)(a1 + 32);
      objc_msgSend(v11, "getFileProviderConnectionWithCompletionHandler:", v26);

    }
    else
    {
      brc_bread_crumbs((uint64_t)"-[BRShareOperation initWithURL:]_block_invoke", 276);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        __32__BRShareOperation_initWithURL___block_invoke_cold_1();

      dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 296));
    }
  }

}

void __32__BRShareOperation_initWithURL___block_invoke_50(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!v5 || a3)
  {
    brc_bread_crumbs((uint64_t)"-[BRShareOperation initWithURL:]_block_invoke", 282);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      __32__BRShareOperation_initWithURL___block_invoke_50_cold_1();

    v10 = a1 + 48;
  }
  else
  {
    BRCXPCSharingOperationInterface();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRemoteObjectInterface:", v6);

    brc_bread_crumbs((uint64_t)"-[BRShareOperation initWithURL:]_block_invoke", 287);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v15 = 138412290;
      v16 = v7;
      _os_log_impl(&dword_19CBF0000, v8, OS_LOG_TYPE_INFO, "[INFO] got sharing service proxy%@", (uint8_t *)&v15, 0xCu);
    }

    objc_msgSend(v5, "remoteObjectProxy");
    v9 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 48);
    v10 = a1 + 48;
    v12 = *(void **)(v11 + 320);
    *(_QWORD *)(v11 + 320) = v9;

    objc_msgSend(v5, "resume");
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)v10 + 296));

}

- (id)remoteObject
{
  NSObject *serviceGroup;
  BRShareOperationProtocol *remoteObject;
  int v6;
  id *v7;
  id v8;
  NSError *initError;
  NSError *v10;
  NSError *v11;
  BRXPCAutomaticErrorProxy *v12;
  _QWORD v13[5];

  serviceGroup = self->_serviceGroup;
  if (serviceGroup)
    dispatch_group_wait(serviceGroup, 0xFFFFFFFFFFFFFFFFLL);
  remoteObject = self->_remoteObject;
  if (remoteObject)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __32__BRShareOperation_remoteObject__block_invoke;
    v13[3] = &unk_1E3DA47F0;
    v13[4] = self;
    -[BRShareOperationProtocol remoteObjectProxyWithErrorHandler:](remoteObject, "remoteObjectProxyWithErrorHandler:", v13);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = BRIsFPFSEnabled(0, a2);
    v7 = (id *)&protocolRef_BRShareOperationFPFSProtocol;
    if (!v6)
      v7 = (id *)&protocolRef_BRShareOperationLegacyProtocol;
    v8 = *v7;
    initError = self->_initError;
    if (initError)
    {
      v10 = initError;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4099, 0);
      v10 = (NSError *)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;
    v12 = -[FPXPCAutomaticErrorProxy initWithConnection:protocol:orError:name:requestPid:]([BRXPCAutomaticErrorProxy alloc], "initWithConnection:protocol:orError:name:requestPid:", 0, v8, v10, CFSTR("broken sharing service proxy"), 0);

    return v12;
  }
}

uint64_t __32__BRShareOperation_remoteObject__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, a2);
}

- (id)remoteFPFSObject
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;

  if (BRIsFPFSEnabled(self, a2))
  {
    -[BRShareOperation remoteObject](self, "remoteObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    brc_bread_crumbs((uint64_t)"-[BRShareOperation remoteFPFSObject]", 320);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BROperation remoteFPFSObject].cold.1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorMethodNotImplemented:", sel_remoteFPFSObject);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BROperation completedWithResult:error:](self, "completedWithResult:error:", 0, v6);

    v3 = 0;
  }
  return v3;
}

- (BOOL)shouldUseDirectConnection
{
  void *v3;
  BOOL v4;
  void *v5;

  -[BRShareOperation itemID](self, "itemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[BRShareOperation url](self, "url");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 == 0;

  }
  return v4;
}

- (id)directConnectionFPFSObject
{
  void *v3;

  if (BRIsFPFSEnabled(self, a2))
  {
    -[BRShareOperation remoteObject](self, "remoteObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)remoteLegacyObject
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;

  if ((BRIsFPFSEnabled(self, a2) & 1) != 0)
  {
    brc_bread_crumbs((uint64_t)"-[BRShareOperation remoteLegacyObject]", 346);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[BROperation remoteLegacyObject].cold.1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorMethodNotImplemented:", sel_remoteLegacyObject);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BROperation completedWithResult:error:](self, "completedWithResult:error:", 0, v5);

    v6 = 0;
  }
  else
  {
    -[BRShareOperation remoteObject](self, "remoteObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSString)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
  objc_storeStrong((id *)&self->_itemID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_sharingService, 0);
  objc_storeStrong((id *)&self->_initError, 0);
  objc_storeStrong((id *)&self->_serviceGroup, 0);
}

- (void)initWithShare:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7(&dword_19CBF0000, v0, (uint64_t)v0, "[DEBUG] %@ initialized without share/url, but using default connection%@", v1);
  OUTLINED_FUNCTION_1();
}

- (void)initWithItemIdentifier:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7(&dword_19CBF0000, v0, (uint64_t)v0, "[DEBUG] init shareOperation with itemID %@%@", v1);
  OUTLINED_FUNCTION_1();
}

- (void)initWithURL:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_19CBF0000, v0, (os_log_type_t)0x90u, "[ERROR] failed to fetch full file path url for %@%@", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithURL:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7(&dword_19CBF0000, v0, (uint64_t)v0, "[DEBUG] init shareOperation with URL %@%@", v1);
  OUTLINED_FUNCTION_1();
}

void __32__BRShareOperation_initWithURL___block_invoke_cold_1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint8_t v3[24];
  uint64_t v4;

  OUTLINED_FUNCTION_7_0();
  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  _os_log_fault_impl(&dword_19CBF0000, v0, OS_LOG_TYPE_FAULT, "[CRIT] services didn't contain sharing service (contained %@)%@", v3, 0x16u);

  OUTLINED_FUNCTION_2_0();
}

void __32__BRShareOperation_initWithURL___block_invoke_50_cold_1()
{
  uint64_t v0;
  __int16 v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t v4[14];
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10_0();
  v5 = v0;
  v6 = v1;
  v7 = v2;
  _os_log_fault_impl(&dword_19CBF0000, v3, OS_LOG_TYPE_FAULT, "[CRIT] failed to get sharing service connection for url %@ (%@)%@", v4, 0x20u);
}

@end
