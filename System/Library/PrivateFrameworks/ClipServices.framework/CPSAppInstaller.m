@implementation CPSAppInstaller

- (CPSAppInstaller)initWithAppInfoFetcher:(id)a3
{
  id v5;
  CPSAppInstaller *v6;
  CPSAppInstaller *v7;
  CPSAppInstaller *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPSAppInstaller;
  v6 = -[CPSAppInstaller init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_appInfoFetcher, a3);
    v8 = v7;
  }

  return v7;
}

- (void)installDownloadedAppWithBundleID:(id)a3 localFilePath:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  objc_class *v18;
  DSArchiveService *v19;
  DSArchiveService *archiveService;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  DSArchiveService *v27;
  void *v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  CPSAppInstaller *v33;
  id v34;
  void (**v35)(id, _QWORD);
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  __int128 buf;
  Class (*v41)(uint64_t);
  void *v42;
  uint64_t *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isInstalled");

  if (v13)
  {
    v10[2](v10, 0);
  }
  else if (-[CPSAppBundleInstaller inactive](self->_appBundleInstaller, "inactive")
         || (-[CPSAppBundleInstaller bundleIdentifier](self->_appBundleInstaller, "bundleIdentifier"),
             v14 = (void *)objc_claimAutoreleasedReturnValue(),
             v15 = objc_msgSend(v14, "isEqualToString:", v8),
             v14,
             !v15))
  {
    if (!self->_archiveService)
    {
      v36 = 0;
      v37 = &v36;
      v38 = 0x2050000000;
      v17 = (void *)getDSArchiveServiceClass_softClass;
      v39 = getDSArchiveServiceClass_softClass;
      if (!getDSArchiveServiceClass_softClass)
      {
        *(_QWORD *)&buf = MEMORY[0x24BDAC760];
        *((_QWORD *)&buf + 1) = 3221225472;
        v41 = __getDSArchiveServiceClass_block_invoke;
        v42 = &unk_24C3B9278;
        v43 = &v36;
        __getDSArchiveServiceClass_block_invoke((uint64_t)&buf);
        v17 = (void *)v37[3];
      }
      v18 = objc_retainAutorelease(v17);
      _Block_object_dispose(&v36, 8);
      v19 = (DSArchiveService *)objc_alloc_init(v18);
      archiveService = self->_archiveService;
      self->_archiveService = v19;

    }
    v21 = (void *)MEMORY[0x24BDBCF48];
    NSTemporaryDirectory();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "UUIDString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringByAppendingPathComponent:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "fileURLWithPath:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = self->_archiveService;
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v9);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __84__CPSAppInstaller_installDownloadedAppWithBundleID_localFilePath_completionHandler___block_invoke;
    v31[3] = &unk_24C3B9250;
    v35 = v10;
    v32 = v26;
    v33 = self;
    v34 = v8;
    v29 = v26;
    v30 = (id)-[DSArchiveService unarchiveItemAtURL:passphrases:destinationFolderURL:completionHandler:](v27, "unarchiveItemAtURL:passphrases:destinationFolderURL:completionHandler:", v28, 0, v29, v31);

  }
  else
  {
    v16 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138477827;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_20AD44000, v16, OS_LOG_TYPE_INFO, "An installation for bundle ID %{private}@ is already in flight", (uint8_t *)&buf, 0xCu);
    }
    v10[2](v10, 0);
  }

}

void __84__CPSAppInstaller_installDownloadedAppWithBundleID_localFilePath_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  CPSAppBundleInstaller *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = v6;
    v8 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __84__CPSAppInstaller_installDownloadedAppWithBundleID_localFilePath_completionHandler___block_invoke_cold_1(v8, v7);
    v9 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDD1540], "cps_errorWithCode:underlyingError:", 5, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    v20 = 0;
    objc_msgSend(v11, "moveItemAtURL:toURL:error:", v5, v12, &v20);
    v7 = v20;

    v13 = -[CPSAppBundleInstaller initWithBundleIdentifier:extractedBundleURL:]([CPSAppBundleInstaller alloc], "initWithBundleIdentifier:extractedBundleURL:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
    v14 = *(_QWORD *)(a1 + 40);
    v15 = *(void **)(v14 + 8);
    *(_QWORD *)(v14 + 8) = v13;

    v16 = *(_QWORD *)(a1 + 40);
    v17 = *(void **)(v16 + 8);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __84__CPSAppInstaller_installDownloadedAppWithBundleID_localFilePath_completionHandler___block_invoke_8;
    v18[3] = &unk_24C3B9228;
    v18[4] = v16;
    v19 = *(id *)(a1 + 56);
    objc_msgSend(v17, "installWithCompletionHandler:", v18);

  }
}

void __84__CPSAppInstaller_installDownloadedAppWithBundleID_localFilePath_completionHandler___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if (v5)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 8);
    *(_QWORD *)(v3 + 8) = 0;

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (BOOL)stopStallingCurrentInstallation
{
  return -[CPSAppBundleInstaller stopStallingCurrentInstallation](self->_appBundleInstaller, "stopStallingCurrentInstallation");
}

- (CPSAppInfoFetching)appInfoFetcher
{
  return self->_appInfoFetcher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appInfoFetcher, 0);
  objc_storeStrong((id *)&self->_archiveService, 0);
  objc_storeStrong((id *)&self->_appBundleInstaller, 0);
}

void __84__CPSAppInstaller_installDownloadedAppWithBundleID_localFilePath_completionHandler___block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "cps_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_20AD44000, v3, OS_LOG_TYPE_ERROR, "Unable to unarchive IPA with error %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
