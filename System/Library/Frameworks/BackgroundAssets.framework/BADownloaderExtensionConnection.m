@implementation BADownloaderExtensionConnection

- (BADownloaderExtensionConnection)initWithPrincipalObject:(id)a3
{
  id v4;
  BADownloaderExtensionConnection *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  dispatch_queue_t v12;
  SEL v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BADownloaderExtensionConnection;
  v5 = -[BADownloaderExtensionConnection init](&v15, sel_init);
  if (v5)
  {
    +[BADownloadManager sharedManager](BADownloadManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BADownloadManager setExtensionConnection:]((uint64_t)v6, v5);

    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@.work-queue"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_retainAutorelease(v10);
    v12 = dispatch_queue_create((const char *)objc_msgSend(v11, "UTF8String"), 0);
    objc_setProperty_atomic(v5, v13, v12, 24);

    -[BADownloaderExtensionConnection setPrincipalObject:](v5, "setPrincipalObject:", v4);
  }

  return v5;
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
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
  const char *v29;
  uint64_t v32;
  _QWORD v33[4];
  _QWORD v34[5];

  v34[4] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255112C98);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_downloadsForRequest_manifestURL_manifestToken_extensionInfo_completionHandler_, 1, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_downloadsForRequest_manifestURL_manifestToken_extensionInfo_completionHandler_, 2, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_downloadsForRequest_manifestURL_manifestToken_extensionInfo_completionHandler_, 3, 0);

  v8 = (void *)MEMORY[0x24BDBCF20];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_downloadsForRequest_manifestURL_manifestToken_extensionInfo_completionHandler_, 1, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_receivedAuthenticationChallenge_download_completionHandler_, 0, 0);

  v13 = (void *)MEMORY[0x24BDBCF20];
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, v15, v16, objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_receivedAuthenticationChallenge_download_completionHandler_, 1, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_receivedAuthenticationChallenge_download_completionHandler_, 1, 1);

  v19 = (void *)MEMORY[0x24BDBCF20];
  v34[0] = objc_opt_class();
  v34[1] = objc_opt_class();
  v34[2] = objc_opt_class();
  v34[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_backgroundDownload_failedWithError_completionHandler_, 0, 0);

  v22 = (void *)MEMORY[0x24BDBCF20];
  v33[0] = objc_opt_class();
  v33[1] = objc_opt_class();
  v33[2] = objc_opt_class();
  v33[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setWithArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_backgroundDownload_finishedWithSandboxToken_completionHandler_, 0, 0);

  v25 = (void *)MEMORY[0x24BDBCF20];
  v32 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v32, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setWithArray:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_backgroundDownload_finishedWithSandboxToken_completionHandler_, 1, 0);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255115670);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExportedInterface:", v4);
  objc_msgSend(v3, "setRemoteObjectInterface:", v28);
  objc_msgSend(v3, "setExportedObject:", self);
  if (self)
    objc_setProperty_atomic(self, v29, v3, 40);
  objc_msgSend(v3, "resume");

  return 1;
}

- (void)wakeupForTokenWithReply:(id)a3
{
  (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
}

- (void)downloadsForRequest:(int64_t)a3 manifestURL:(id)a4 manifestToken:(id)a5 extensionInfo:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  int64_t v29;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  -[BADownloaderExtensionConnection principalObject](self, "principalObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    self = (BADownloaderExtensionConnection *)objc_getProperty(self, v16, 24, 1);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __113__BADownloaderExtensionConnection_downloadsForRequest_manifestURL_manifestToken_extensionInfo_completionHandler___block_invoke;
  v23[3] = &unk_24DDBED98;
  v24 = v13;
  v25 = v12;
  v28 = v15;
  v29 = a3;
  v26 = v17;
  v27 = v14;
  v18 = v14;
  v19 = v17;
  v20 = v15;
  v21 = v12;
  v22 = v13;
  dispatch_async(&self->super.super, v23);

}

void __113__BADownloaderExtensionConnection_downloadsForRequest_manifestURL_manifestToken_extensionInfo_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _BOOL8 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  _BOOL8 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  _BOOL8 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v1 = a1;
  v53 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
  if (sandbox_extension_consume() != -1)
  {
    +[BADownloadManager sharedManager](BADownloadManager, "sharedManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[BADownloadManager setScheduleLocked:]((uint64_t)v2, 1);

    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*(id *)(v1 + 48), "downloadsForRequest:manifestURL:extensionInfo:", *(_QWORD *)(v1 + 72), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 56));
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v4;
    }
    sandbox_extension_release();
    if (!v3)
      goto LABEL_27;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_27;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    if (!v6)
      goto LABEL_16;
    v7 = v6;
    v8 = *(_QWORD *)v49;
    while (1)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v49 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v1 = *(_QWORD *)(v1 + 64);
          objc_msgSend(MEMORY[0x24BDBCF20], "set", (_QWORD)v48);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, void *))(v1 + 16))(v1, 0, v20);

          v21 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
          if (v21)
            __113__BADownloaderExtensionConnection_downloadsForRequest_manifestURL_manifestToken_extensionInfo_completionHandler___block_invoke_cold_4(v21, v22, v23, v24, v25, v26, v27, v28);
          __break(1u);
LABEL_24:
          v1 = *(_QWORD *)(v1 + 64);
          objc_msgSend(MEMORY[0x24BDBCF20], "set");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, void *))(v1 + 16))(v1, 0, v29);

          v30 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
          if (v30)
            __113__BADownloaderExtensionConnection_downloadsForRequest_manifestURL_manifestToken_extensionInfo_completionHandler___block_invoke_cold_3(v30, v31, v32, v33, v34, v35, v36, v37);
          __break(1u);
LABEL_27:
          v38 = *(_QWORD *)(v1 + 64);
          objc_msgSend(MEMORY[0x24BDBCF20], "set");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, void *))(v38 + 16))(v38, 0, v39);

          v40 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
          if (v40)
            __113__BADownloaderExtensionConnection_downloadsForRequest_manifestURL_manifestToken_extensionInfo_completionHandler___block_invoke_cold_2(v40, v41, v42, v43, v44, v45, v46, v47);
          __break(1u);
        }
        if ((unint64_t)(*(_QWORD *)(v1 + 72) - 1) >= 2 && objc_msgSend(v10, "necessity", (_QWORD)v48) == 1)
          goto LABEL_24;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      if (!v7)
      {
LABEL_16:

        (*(void (**)(void))(*(_QWORD *)(v1 + 64) + 16))();
        +[BADownloadManager sharedManager](BADownloadManager, "sharedManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[BADownloadManager setScheduleLocked:]((uint64_t)v11, 0);

        goto LABEL_20;
      }
    }
  }
  BASystemLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    __113__BADownloaderExtensionConnection_downloadsForRequest_manifestURL_manifestToken_extensionInfo_completionHandler___block_invoke_cold_1(v1, v12, v13, v14, v15, v16, v17, v18);

  v19 = *(_QWORD *)(v1 + 64);
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v19 + 16))(v19, 0, v5);
LABEL_20:

}

- (void)receivedAuthenticationChallenge:(id)a3 download:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[BADownloaderExtensionConnection principalObject](self, "principalObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    self = (BADownloaderExtensionConnection *)objc_getProperty(self, v11, 24, 1);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __94__BADownloaderExtensionConnection_receivedAuthenticationChallenge_download_completionHandler___block_invoke;
  v17[3] = &unk_24DDBEDC0;
  v18 = v12;
  v19 = v9;
  v20 = v8;
  v21 = v10;
  v13 = v10;
  v14 = v8;
  v15 = v9;
  v16 = v12;
  dispatch_async(&self->super.super, v17);

}

uint64_t __94__BADownloaderExtensionConnection_receivedAuthenticationChallenge_download_completionHandler___block_invoke(uint64_t a1)
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "backgroundDownload:didReceiveChallenge:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)extensionWillTerminate
{
  id v2;

  -[BADownloaderExtensionConnection principalObject](self, "principalObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "extensionWillTerminate");

}

- (void)backgroundDownload:(id)a3 failedWithError:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[BADownloaderExtensionConnection principalObject](self, "principalObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    self = (BADownloaderExtensionConnection *)objc_getProperty(self, v11, 24, 1);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __88__BADownloaderExtensionConnection_backgroundDownload_failedWithError_completionHandler___block_invoke;
  v17[3] = &unk_24DDBEDC0;
  v18 = v12;
  v19 = v8;
  v20 = v9;
  v21 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  v16 = v12;
  dispatch_async(&self->super.super, v17);

}

uint64_t __88__BADownloaderExtensionConnection_backgroundDownload_failedWithError_completionHandler___block_invoke(uint64_t a1)
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "backgroundDownload:failedWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)backgroundDownload:(id)a3 finishedWithSandboxToken:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  void *v12;
  NSObject *Property;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  BADownloaderExtensionConnection *v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[BADownloaderExtensionConnection principalObject](self, "principalObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    Property = objc_getProperty(self, v11, 24, 1);
  else
    Property = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __97__BADownloaderExtensionConnection_backgroundDownload_finishedWithSandboxToken_completionHandler___block_invoke;
  block[3] = &unk_24DDBEDE8;
  v19 = v9;
  v20 = v8;
  v22 = self;
  v23 = v10;
  v21 = v12;
  v14 = v10;
  v15 = v12;
  v16 = v8;
  v17 = v9;
  dispatch_async(Property, block);

}

void __97__BADownloaderExtensionConnection_backgroundDownload_finishedWithSandboxToken_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  id v5;
  void *v6;
  BOOL v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  char v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  char v25;
  NSObject *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;

  objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
  if (sandbox_extension_consume() != -1)
  {
    v2 = *(void **)(a1 + 40);
    v30 = 0;
    v31 = 0;
    v3 = objc_msgSend(v2, "cloneDownloadToFinalDestinationURL:error:", &v31, &v30);
    v4 = v31;
    v5 = v30;
    if ((v3 & 1) != 0)
    {
      v6 = *(void **)(a1 + 56);
      v29 = v5;
      v7 = -[BADownloaderExtensionConnection _markPurgeableWithFileURL:error:](v6, v4, &v29);
      v8 = v29;

      if (v7)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(*(id *)(a1 + 48), "backgroundDownload:finishedWithFileURL:", *(_QWORD *)(a1 + 40), v4);
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "path");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "fileExistsAtPath:", v10);

        if (!v11)
          goto LABEL_30;
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 0;
        v13 = objc_msgSend(v12, "removeItemAtURL:error:", v4, &v27);
        v14 = v27;

        if ((v13 & 1) == 0)
        {
          BAClientLogObject();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            __97__BADownloaderExtensionConnection_backgroundDownload_finishedWithSandboxToken_completionHandler___block_invoke_cold_2();

        }
      }
      else
      {
        BAClientLogObject();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          __97__BADownloaderExtensionConnection_backgroundDownload_finishedWithSandboxToken_completionHandler___block_invoke_cold_4();

        -[BADownload setInternalState:](*(void **)(a1 + 40), -1);
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0;
        v25 = objc_msgSend(v24, "removeItemAtURL:error:", v4, &v28);
        v14 = v28;

        if ((v25 & 1) == 0)
        {
          BAClientLogObject();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            __97__BADownloaderExtensionConnection_backgroundDownload_finishedWithSandboxToken_completionHandler___block_invoke_cold_3();

        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(*(id *)(a1 + 48), "backgroundDownload:failedWithError:", *(_QWORD *)(a1 + 40), v8);
      }
    }
    else
    {
      -[BADownload setInternalState:](*(void **)(a1 + 40), -1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(*(id *)(a1 + 48), "backgroundDownload:failedWithError:", *(_QWORD *)(a1 + 40), v5);
      BAClientLogObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __97__BADownloaderExtensionConnection_backgroundDownload_finishedWithSandboxToken_completionHandler___block_invoke_cold_5();
      v8 = v5;
    }

LABEL_30:
    sandbox_extension_release();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

    goto LABEL_31;
  }
  BASystemLogObject();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    __97__BADownloaderExtensionConnection_backgroundDownload_finishedWithSandboxToken_completionHandler___block_invoke_cold_1(a1, v16, v17, v18, v19, v20, v21, v22);

  NSErrorWithBAErrorCode(-108);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BADownload setInternalState:](*(void **)(a1 + 40), -1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 48), "backgroundDownload:failedWithError:", *(_QWORD *)(a1 + 40), v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_31:

}

- (BOOL)_markPurgeableWithFileURL:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  id v7;
  SEL v8;
  id Property;
  void *v10;
  void *v11;
  SEL v12;
  id v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  __int128 v31;
  __int128 v32;
  const __CFString *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = v5;
  if (!a1)
    goto LABEL_13;
  v7 = objc_retainAutorelease(v5);
  objc_msgSend(v7, "fileSystemRepresentation");
  Property = objc_getProperty(a1, v8, 40, 1);
  if (Property)
  {
    objc_msgSend(Property, "auditToken");
  }
  else
  {
    v31 = 0u;
    v32 = 0u;
  }
  v10 = (void *)sandbox_extension_issue_file_to_process();
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    free(v10);
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__105;
    v25 = __Block_byref_object_dispose__106;
    v26 = 0;
    v13 = objc_getProperty(a1, v12, 40, 1);
    objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_107);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __67__BADownloaderExtensionConnection__markPurgeableWithFileURL_error___block_invoke_108;
    v20[3] = &unk_24DDBEF20;
    v20[4] = &v27;
    v20[5] = &v21;
    objc_msgSend(v14, "markPurgeableWithFileURL:sandboxToken:reply:", v7, v11, v20);

    if (a3)
      *a3 = objc_retainAutorelease((id)v22[5]);
    v15 = *((_BYTE *)v28 + 24) != 0;
    _Block_object_dispose(&v21, 8);

    _Block_object_dispose(&v27, 8);
    goto LABEL_11;
  }
  if (!a3)
  {
LABEL_13:
    v15 = 0;
    goto LABEL_12;
  }
  v16 = (void *)MEMORY[0x24BDD1540];
  v17 = *__error();
  v33 = CFSTR("FileURL");
  v34[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v17, v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  NSErrorWithBAErrorDomainCodeUnderlying(CFSTR("BAErrorDomain"), -107, v11);
  v15 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

LABEL_12:
  return v15;
}

- (id)acquireWakeAssertion
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *(*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  if (self)
    self = (BADownloaderExtensionConnection *)objc_getProperty(self, a2, 40, 1);
  -[BADownloaderExtensionConnection synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_99);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__BADownloaderExtensionConnection_acquireWakeAssertion__block_invoke_2;
  v6[3] = &unk_24DDBEED8;
  v8 = &v9;
  v3 = v2;
  v7 = v3;
  objc_msgSend(v3, "incrementWakeAssertionWithReply:", v6);
  v4 = _Block_copy((const void *)v10[5]);

  _Block_object_dispose(&v9, 8);
  return v4;
}

void __55__BADownloaderExtensionConnection_acquireWakeAssertion__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  BAClientLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __55__BADownloaderExtensionConnection_acquireWakeAssertion__block_invoke_cold_1(v2);

}

void __55__BADownloaderExtensionConnection_acquireWakeAssertion__block_invoke_2(uint64_t a1)
{
  dispatch_block_t v2;
  uint64_t v3;
  void *v4;
  _QWORD block[4];
  id v6;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__BADownloaderExtensionConnection_acquireWakeAssertion__block_invoke_3;
  block[3] = &unk_24DDBEEB0;
  v6 = *(id *)(a1 + 32);
  v2 = dispatch_block_create((dispatch_block_flags_t)0, block);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __55__BADownloaderExtensionConnection_acquireWakeAssertion__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "decrementWakeAssertionWithReply:", &__block_literal_global_100);
}

void __67__BADownloaderExtensionConnection__markPurgeableWithFileURL_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  BAClientLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __67__BADownloaderExtensionConnection__markPurgeableWithFileURL_error___block_invoke_cold_1(v2);

}

void __67__BADownloaderExtensionConnection__markPurgeableWithFileURL_error___block_invoke_108(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BADownloaderExtension)principalObject
{
  return (BADownloaderExtension *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPrincipalObject:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonConnection, 0);
  objc_storeStrong((id *)&self->_principalObject, 0);
  objc_storeStrong((id *)&self->_extensionWorkQueue, 0);
}

void __113__BADownloaderExtensionConnection_downloadsForRequest_manifestURL_manifestToken_extensionInfo_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_21ABD8000, a2, a3, "Manifest of %{public}@ finished but sandbox_extension_consume() failed.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __113__BADownloaderExtensionConnection_downloadsForRequest_manifestURL_manifestToken_extensionInfo_completionHandler___block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21ABD8000, MEMORY[0x24BDACB70], a3, "BUG IN CLIENT OF BackgroundAssets: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __113__BADownloaderExtensionConnection_downloadsForRequest_manifestURL_manifestToken_extensionInfo_completionHandler___block_invoke_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21ABD8000, MEMORY[0x24BDACB70], a3, "BUG IN CLIENT OF BackgroundAssets: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __113__BADownloaderExtensionConnection_downloadsForRequest_manifestURL_manifestToken_extensionInfo_completionHandler___block_invoke_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21ABD8000, MEMORY[0x24BDACB70], a3, "BUG IN CLIENT OF BackgroundAssets: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __97__BADownloaderExtensionConnection_backgroundDownload_finishedWithSandboxToken_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_21ABD8000, a2, a3, "Download  %{public}@ finished but sandbox_extension_consume() failed.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __97__BADownloaderExtensionConnection_backgroundDownload_finishedWithSandboxToken_completionHandler___block_invoke_cold_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_10();
  objc_msgSend((id)OUTLINED_FUNCTION_8(v1), "identifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_6(), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21ABD8000, v3, v4, "Download %{public}@ failed to remove cloned file after the client serviced the download. Error:%{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __97__BADownloaderExtensionConnection_backgroundDownload_finishedWithSandboxToken_completionHandler___block_invoke_cold_3()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_10();
  objc_msgSend((id)OUTLINED_FUNCTION_8(v1), "identifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_6(), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21ABD8000, v3, v4, "Download %{public}@ failed to remove cloned file failing to be marked as purgeable. Error:%{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __97__BADownloaderExtensionConnection_backgroundDownload_finishedWithSandboxToken_completionHandler___block_invoke_cold_4()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_10();
  objc_msgSend((id)OUTLINED_FUNCTION_8(v1), "identifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_6(), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21ABD8000, v3, v4, "Download %{public}@ failed to mark cloned file as purgeable. Error:%{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __97__BADownloaderExtensionConnection_backgroundDownload_finishedWithSandboxToken_completionHandler___block_invoke_cold_5()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_10();
  objc_msgSend((id)OUTLINED_FUNCTION_8(v1), "identifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_6(), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21ABD8000, v3, v4, "Download %{public}@ failed to be cloned after download. Error:%{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __55__BADownloaderExtensionConnection_acquireWakeAssertion__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_21ABD8000, v2, v3, "Message failed: %{public}s error: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7();
}

void __67__BADownloaderExtensionConnection__markPurgeableWithFileURL_error___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_21ABD8000, v2, v3, "Message failed: %{public}s error: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7();
}

@end
