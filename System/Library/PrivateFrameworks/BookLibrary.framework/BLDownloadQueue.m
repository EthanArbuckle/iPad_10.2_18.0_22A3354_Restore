@implementation BLDownloadQueue

+ (BLDownloadQueue)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_213240984;
  block[3] = &unk_24CF70CA0;
  block[4] = a1;
  if (qword_253E79BF0 != -1)
    dispatch_once(&qword_253E79BF0, block);
  return (BLDownloadQueue *)(id)qword_253E79BF8;
}

- (void)purchaseWithRequest:(id)a3 completion:(id)a4
{
  MEMORY[0x24BEDD108](self, sel_purchaseWithRequest_uiManager_completion_, a3);
}

- (void)purchaseWithRequest:(id)a3 uiManager:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  BLUIHostServiceProxy *v25;
  const char *v26;
  void *v27;
  const char *v28;
  int v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_presentingSceneIdentifier(v8, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend_presentingSceneIdentifier(v9, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPresentingSceneIdentifier_(v8, v17, (uint64_t)v16);

  }
  BLDefaultLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_storeIdentifier(v8, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_presentingSceneIdentifier(v8, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 141558530;
    v30 = 1752392040;
    v31 = 2112;
    v32 = v21;
    v33 = 2112;
    v34 = v24;
    _os_log_impl(&dword_21323F000, v18, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: purchaseWithRequest:uiManager:completion: for asset %{mask.hash}@ with additional presentingSceneIdentifier: %@", (uint8_t *)&v29, 0x20u);

  }
  v25 = [BLUIHostServiceProxy alloc];
  v27 = (void *)objc_msgSend_initWithUIManager_forRequest_inDownloadQueue_(v25, v26, (uint64_t)v9, v8, self);
  objc_msgSend__purchaseWithRequest_uiHostProxy_completion_(self, v28, (uint64_t)v8, v27, v10);

}

- (void)addDownloadsWithManifestRequest:(id)a3 uiManager:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  BLDownloadQueue *v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  BLDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v8;
    _os_log_impl(&dword_21323F000, v11, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: addDownloadsWithManifestRequest:uiManager:completion: for manifestRequest: %@", buf, 0xCu);
  }

  v12 = _os_activity_create(&dword_21323F000, "addDownloadsWithManifestRequest:uiManager:completion:", MEMORY[0x24BDACB20], OS_ACTIVITY_FLAG_DEFAULT);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = sub_213244844;
  v16[3] = &unk_24CF70D50;
  v17 = v9;
  v18 = v8;
  v19 = self;
  v20 = v10;
  v13 = v10;
  v14 = v8;
  v15 = v9;
  os_activity_apply(v12, v16);

}

- (void)setAutomaticDownloadEnabled:(BOOL)a3 uiManager:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  BLDownloadQueue *v16;
  id v17;
  BOOL v18;
  uint8_t buf[16];

  v8 = a4;
  v9 = a5;
  BLDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21323F000, v10, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: setAutomaticDownloadEnabled", buf, 2u);
  }

  v11 = _os_activity_create(&dword_21323F000, "setAutomaticDownloadEnabled:uiManager:completion:", MEMORY[0x24BDACB20], OS_ACTIVITY_FLAG_DEFAULT);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_2132449FC;
  v14[3] = &unk_24CF70DB8;
  v16 = self;
  v17 = v9;
  v15 = v8;
  v18 = a3;
  v12 = v8;
  v13 = v9;
  os_activity_apply(v11, v14);

}

@end
