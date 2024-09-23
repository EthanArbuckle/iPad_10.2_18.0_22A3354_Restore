@implementation CPSAppBundleInstaller

- (CPSAppBundleInstaller)initWithBundleIdentifier:(id)a3 extractedBundleURL:(id)a4
{
  id v7;
  id v8;
  CPSAppBundleInstaller *v9;
  CPSAppBundleInstaller *v10;
  CPSAppBundleInstaller *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CPSAppBundleInstaller;
  v9 = -[CPSAppBundleInstaller init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleIdentifier, a3);
    objc_storeStrong((id *)&v10->_extractedBundleURL, a4);
    v11 = v10;
  }

  return v10;
}

- (void)installWithCompletionHandler:(id)a3
{
  void *v4;
  id completionHandler;
  NSURL *extractedBundleURL;
  IXPlaceholder *v7;
  id v8;
  IXPlaceholder *placeholder;
  NSObject *v10;
  void *v11;
  NSString *v12;
  NSString *bundleIdentifier;
  IXInitiatingAppInstallCoordinator *v14;
  id v15;
  IXInitiatingAppInstallCoordinator *installCoordinator;
  NSObject *v17;
  void *v18;
  IXInitiatingAppInstallCoordinator *v19;
  char v20;
  id v21;
  NSObject *v22;
  IXInitiatingAppInstallCoordinator *v23;
  IXPlaceholder *v24;
  char v25;
  id v26;
  NSObject *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  char v32;

  v4 = (void *)MEMORY[0x20BD30A54](a3, a2);
  completionHandler = self->_completionHandler;
  self->_completionHandler = v4;

  v32 = 0;
  extractedBundleURL = self->_extractedBundleURL;
  v31 = 0;
  objc_msgSend(MEMORY[0x24BE51F90], "placeholderForInstallable:client:installType:metadata:error:", extractedBundleURL, 18, 1, 0, &v31);
  v7 = (IXPlaceholder *)objc_claimAutoreleasedReturnValue();
  v8 = v31;
  placeholder = self->_placeholder;
  self->_placeholder = v7;

  if (!v7)
  {
    v10 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CPSAppBundleInstaller installWithCompletionHandler:].cold.4(v10);
  }
  v11 = (void *)MEMORY[0x24BE51F88];
  -[IXPlaceholder bundleID](self->_placeholder, "bundleID");
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  bundleIdentifier = v12;
  if (!v12)
    bundleIdentifier = self->_bundleIdentifier;
  v30 = v8;
  objc_msgSend(v11, "coordinatorForAppWithBundleID:withClientID:createIfNotExisting:created:error:", bundleIdentifier, 18, 1, &v32, &v30);
  v14 = (IXInitiatingAppInstallCoordinator *)objc_claimAutoreleasedReturnValue();
  v15 = v30;

  installCoordinator = self->_installCoordinator;
  self->_installCoordinator = v14;

  if (!v14)
  {
    v17 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[CPSAppBundleInstaller installWithCompletionHandler:].cold.3(v17);
  }
  -[IXInitiatingAppInstallCoordinator setObserver:](self->_installCoordinator, "setObserver:", self);
  v18 = (void *)objc_opt_new();
  objc_msgSend(v18, "setLsInstallType:", 1);
  v19 = self->_installCoordinator;
  v29 = v15;
  v20 = -[IXInitiatingAppInstallCoordinator setInstallOptions:error:](v19, "setInstallOptions:error:", v18, &v29);
  v21 = v29;

  if ((v20 & 1) == 0)
  {
    v22 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[CPSAppBundleInstaller installWithCompletionHandler:].cold.2(v22);
  }
  v24 = self->_placeholder;
  v23 = self->_installCoordinator;
  v28 = v21;
  v25 = -[IXInitiatingAppInstallCoordinator setPlaceholderPromise:error:](v23, "setPlaceholderPromise:error:", v24, &v28);
  v26 = v28;

  if ((v25 & 1) == 0)
  {
    v27 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[CPSAppBundleInstaller installWithCompletionHandler:].cold.1(v27);
  }

}

- (void)coordinatorDidInstallPlaceholder:(id)a3 forApplicationRecord:(id)a4
{
  id v5;
  NSObject *v6;
  void (**completionHandler)(id, _QWORD);
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  IXPromisedTransferToPath *v14;
  IXPromisedTransferToPath *appAssetPromise;
  IXPromisedTransferToPath *v16;
  NSObject *v17;
  char v18;
  id v19;
  NSObject *v20;
  char v21;
  id v22;
  NSObject *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    v27 = v5;
    _os_log_impl(&dword_20AD44000, v6, OS_LOG_TYPE_INFO, "Coordinator %{private}@ successfully installed placeholder", buf, 0xCu);
  }
  completionHandler = (void (**)(id, _QWORD))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, 0);
    v8 = self->_completionHandler;
    self->_completionHandler = 0;

  }
  v9 = v5;
  v10 = objc_alloc(MEMORY[0x24BE51FA8]);
  v11 = (void *)MEMORY[0x24BDD17C8];
  -[IXPlaceholder bundleID](self->_placeholder, "bundleID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("App Asset: %@"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (IXPromisedTransferToPath *)objc_msgSend(v10, "initWithName:client:transferPath:diskSpaceNeeded:", v13, 18, self->_extractedBundleURL, 0);
  appAssetPromise = self->_appAssetPromise;
  self->_appAssetPromise = v14;

  v16 = self->_appAssetPromise;
  if (!v16)
  {
    v17 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[CPSAppBundleInstaller coordinatorDidInstallPlaceholder:forApplicationRecord:].cold.3(v17);
    v16 = self->_appAssetPromise;
  }
  v25 = 0;
  v18 = objc_msgSend(v9, "setAppAssetPromise:error:", v16, &v25);
  v19 = v25;
  if ((v18 & 1) == 0)
  {
    v20 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[CPSAppBundleInstaller coordinatorDidInstallPlaceholder:forApplicationRecord:].cold.2(v20);
  }
  if (+[CPSClipURL shouldStallProgress](CPSClipURL, "shouldStallProgress")
    || +[CPSClipURL usesDemoMetadata](CPSClipURL, "usesDemoMetadata"))
  {
    -[IXPromisedTransferToPath setPercentComplete:](self->_appAssetPromise, "setPercentComplete:", 0.5);
  }
  else
  {
    -[IXPromisedTransferToPath setComplete:](self->_appAssetPromise, "setComplete:", 1);
  }
  v24 = v19;
  v21 = objc_msgSend(v9, "setInitialODRAssetPromises:error:", MEMORY[0x24BDBD1A8], &v24);
  v22 = v24;

  if ((v21 & 1) == 0)
  {
    v23 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[CPSAppBundleInstaller coordinatorDidInstallPlaceholder:forApplicationRecord:].cold.1(v23);
  }

}

- (void)coordinatorDidCompleteSuccessfully:(id)a3 forApplicationRecord:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138477827;
    v8 = v5;
    _os_log_impl(&dword_20AD44000, v6, OS_LOG_TYPE_INFO, "Coordinator %{private}@ completed successfully", (uint8_t *)&v7, 0xCu);
  }
  self->_inactive = 1;

}

- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5
{
  id v6;
  NSObject *v7;
  void (**completionHandler)(id, id);

  v6 = a4;
  v7 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[CPSAppBundleInstaller coordinator:canceledWithReason:client:].cold.1((uint64_t)v6, v7);
  self->_inactive = 1;
  completionHandler = (void (**)(id, id))self->_completionHandler;
  if (completionHandler)
    completionHandler[2](completionHandler, v6);

}

- (BOOL)stopStallingCurrentInstallation
{
  IXPromisedTransferToPath *appAssetPromise;
  NSObject *v4;
  uint8_t v6[16];

  appAssetPromise = self->_appAssetPromise;
  if (appAssetPromise)
  {
    -[IXPromisedTransferToPath setPercentComplete:](self->_appAssetPromise, "setPercentComplete:", 1.0);
    -[IXPromisedTransferToPath setComplete:](self->_appAssetPromise, "setComplete:", 1);
  }
  else
  {
    v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_20AD44000, v4, OS_LOG_TYPE_INFO, "Unable to stop stalling installation because there's no app asset promise", v6, 2u);
    }
  }
  return appAssetPromise != 0;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)inactive
{
  return self->_inactive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_appAssetPromise, 0);
  objc_storeStrong((id *)&self->_installCoordinator, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_extractedBundleURL, 0);
}

- (void)installWithCompletionHandler:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v3, v4, "Unable to set placeholder promise with error %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

- (void)installWithCompletionHandler:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v3, v4, "Unable to set install options with error %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

- (void)installWithCompletionHandler:(void *)a1 .cold.3(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v3, v4, "Unable to create IXInitiatingAppInstallCoordinator with error %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

- (void)installWithCompletionHandler:(void *)a1 .cold.4(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v3, v4, "Unable to create IXPlaceholder with error %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

- (void)coordinatorDidInstallPlaceholder:(void *)a1 forApplicationRecord:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v3, v4, "Failed to set ODR promises %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

- (void)coordinatorDidInstallPlaceholder:(void *)a1 forApplicationRecord:.cold.2(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v3, v4, "Failed to set app asset promise %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

- (void)coordinatorDidInstallPlaceholder:(os_log_t)log forApplicationRecord:.cold.3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20AD44000, log, OS_LOG_TYPE_ERROR, "Failed to create app asset promise", v1, 2u);
}

- (void)coordinator:(uint64_t)a1 canceledWithReason:(void *)a2 client:.cold.1(uint64_t a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  IXStringForClientID();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = a1;
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl(&dword_20AD44000, v3, OS_LOG_TYPE_ERROR, "Failed for reason %@ client %@", (uint8_t *)&v5, 0x16u);

}

@end
