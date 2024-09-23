@implementation CPSClipRequest

- (CPSClipRequest)initWithURL:(id)a3
{
  return -[CPSClipRequest initWithURL:fallbackClipBundleID:](self, "initWithURL:fallbackClipBundleID:", a3, 0);
}

- (CPSClipRequest)initWithURL:(id)a3 fallbackClipBundleID:(id)a4
{
  id v6;
  id v7;
  CPSSessionProxy *v8;
  CPSSessionProxy *sessionProxy;
  void *v10;
  CPSClipRequest *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  if (v6
    && (v13.receiver = self,
        v13.super_class = (Class)CPSClipRequest,
        (self = -[CPSClipRequest init](&v13, sel_init)) != 0))
  {
    v8 = -[CPSSessionProxy initWithURL:]([CPSSessionProxy alloc], "initWithURL:", v6);
    sessionProxy = self->_sessionProxy;
    self->_sessionProxy = v8;

    +[CPSSessionConfiguration standardConfigurationWithURL:fallbackBundleID:](CPSSessionConfiguration, "standardConfigurationWithURL:fallbackBundleID:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSSessionProxy setConfiguration:](self->_sessionProxy, "setConfiguration:", v10);

    -[CPSSessionProxy setDelegate:](self->_sessionProxy, "setDelegate:", self);
    self = self;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)requestClipWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id completionHandler;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  CPSClipRequest *v12;
  id v13;

  v4 = a3;
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __44__CPSClipRequest_requestClipWithCompletion___block_invoke;
  v11 = &unk_24C3BA708;
  v12 = self;
  v13 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x20BD30A54](&v8);
  completionHandler = self->_completionHandler;
  self->_completionHandler = v6;

  -[CPSSessionProxy connectToService](self->_sessionProxy, "connectToService", v8, v9, v10, v11, v12);
}

void __44__CPSClipRequest_requestClipWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

}

- (id)sessionProxy
{
  return self->_sessionProxy;
}

- (void)cancel
{
  CPSSessionProxy *sessionProxy;

  -[CPSSessionProxy disconnect](self->_sessionProxy, "disconnect");
  sessionProxy = self->_sessionProxy;
  self->_sessionProxy = 0;

}

- (void)dealloc
{
  CPSSessionProxy *sessionProxy;
  objc_super v4;

  -[CPSSessionProxy disconnect](self->_sessionProxy, "disconnect");
  sessionProxy = self->_sessionProxy;
  self->_sessionProxy = 0;

  v4.receiver = self;
  v4.super_class = (Class)CPSClipRequest;
  -[CPSClipRequest dealloc](&v4, sel_dealloc);
}

+ (void)deleteClipsWithBundleIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  +[CPSDaemonConnection sharedConnection](CPSDaemonConnection, "sharedConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __54__CPSClipRequest_deleteClipsWithBundleIDs_completion___block_invoke;
  v11[3] = &unk_24C3BA730;
  v13 = v7;
  v14 = a1;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "uninstallClipsWithBundleIDs:completionHandler:", v10, v11);

}

void __54__CPSClipRequest_deleteClipsWithBundleIDs_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __54__CPSClipRequest_deleteClipsWithBundleIDs_completion___block_invoke_cold_1(a1, v5, v3);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218243;
    v14 = v6;
    v15 = 2113;
    v16 = v7;
    _os_log_impl(&dword_20AD44000, v5, OS_LOG_TYPE_INFO, "CPSClipRequest (%p): Deleted clip with bundleIDs %{private}@", buf, 0x16u);
  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __54__CPSClipRequest_deleteClipsWithBundleIDs_completion___block_invoke_6;
  v10[3] = &unk_24C3B9A18;
  v8 = *(id *)(a1 + 40);
  v11 = v3;
  v12 = v8;
  v9 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v10);

}

uint64_t __54__CPSClipRequest_deleteClipsWithBundleIDs_completion___block_invoke_6(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

+ (void)getUserNotificationConsentForBundleID:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[CPSDaemonConnection sharedConnection](CPSDaemonConnection, "sharedConnection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getUserNotificationConsentForBundleID:completion:", v6, v5);

}

+ (void)getLocationConfirmationConsentForBundleID:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a3;
  +[CPSDaemonConnection sharedConnection](CPSDaemonConnection, "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __71__CPSClipRequest_getLocationConfirmationConsentForBundleID_completion___block_invoke;
  v9[3] = &unk_24C3BA758;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "getLastLaunchOptionsWithBundleID:completion:", v6, v9);

}

void __71__CPSClipRequest_getLocationConfirmationConsentForBundleID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "locationConfirmationGranted");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, objc_msgSend(v3, "BOOLValue"), 0);

}

+ (void)confirmLocationWithURL:(id)a3 inRegion:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[CPSDaemonConnection sharedConnection](CPSDaemonConnection, "sharedConnection");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "confirmLocationWithURL:inRegion:completion:", v9, v8, v7);

}

- (void)installClipWithBundleID:(id)a3 completion:(id)a4
{
  id v6;
  CPSSessionProxy *sessionProxy;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id completionHandler;
  void *v13;
  CPSClipLaunchOptions *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  CPSClipRequest *v24;
  id v25;

  v6 = a4;
  sessionProxy = self->_sessionProxy;
  v8 = a3;
  -[CPSSessionProxy configuration](sessionProxy, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "usedByPPT");

  if ((v10 & 1) != 0)
  {
    v20 = MEMORY[0x24BDAC760];
    v21 = 3221225472;
    v22 = __53__CPSClipRequest_installClipWithBundleID_completion___block_invoke;
    v23 = &unk_24C3BA708;
    v24 = self;
    v25 = v6;
    v11 = (void *)MEMORY[0x20BD30A54](&v20);
    completionHandler = self->_completionHandler;
    self->_completionHandler = v11;

  }
  else
  {
    +[CPSSessionConfiguration localConfiguration](CPSSessionConfiguration, "localConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSSessionProxy setConfiguration:](self->_sessionProxy, "setConfiguration:", v13);

  }
  -[CPSSessionProxy connectToService](self->_sessionProxy, "connectToService", v20, v21, v22, v23);
  v14 = objc_alloc_init(CPSClipLaunchOptions);
  -[CPSClipLaunchOptions setPredefinedBundleID:](v14, "setPredefinedBundleID:", v8);

  -[CPSClipLaunchOptions setSkipsLaunching:](v14, "setSkipsLaunching:", v10);
  -[CPSSessionProxy configuration](self->_sessionProxy, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "launchReason");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("DeveloperTools"));

  if (v17)
  {
    v18 = MEMORY[0x24BDBD1C8];
    -[CPSClipLaunchOptions setLocationConfirmationGranted:](v14, "setLocationConfirmationGranted:", MEMORY[0x24BDBD1C8]);
    -[CPSClipLaunchOptions setUserNotificationGranted:](v14, "setUserNotificationGranted:", v18);
  }
  if ((_DWORD)v10)
    v19 = 0;
  else
    v19 = v6;
  -[CPSSessionProxy openClipWithLaunchOptions:completion:](self->_sessionProxy, "openClipWithLaunchOptions:completion:", v14, v19);

}

void __53__CPSClipRequest_installClipWithBundleID_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

}

- (id)_errorIgnoringUserCancelledErrorIfNeeded:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (-[CPSClipRequest shouldReturnErrorOnUserCancellation](self, "shouldReturnErrorOnUserCancellation")
    || (objc_msgSend(v4, "cps_isUserCanceledError") & 1) == 0)
  {
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

- (void)_openClipWithInvocationUI
{
  NSObject *v3;
  CPSSessionProxy *sessionProxy;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  CPSClipRequest *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    sessionProxy = self->_sessionProxy;
    v5 = v3;
    -[CPSSessionProxy url](sessionProxy, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218243;
    v11 = self;
    v12 = 2117;
    v13 = v6;
    _os_log_impl(&dword_20AD44000, v5, OS_LOG_TYPE_INFO, "CPSClipRequest (%p): Showing invocation UI for %{sensitive}@", buf, 0x16u);

  }
  +[CPSDaemonConnection sharedConnection](CPSDaemonConnection, "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSSessionProxy url](self->_sessionProxy, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __43__CPSClipRequest__openClipWithInvocationUI__block_invoke;
  v9[3] = &unk_24C3B9558;
  v9[4] = self;
  objc_msgSend(v7, "openClipWithInvocationUIIfNeededWithURL:completionHandler:", v8, v9);

}

void __43__CPSClipRequest__openClipWithInvocationUI__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__CPSClipRequest__openClipWithInvocationUI__block_invoke_2;
  v5[3] = &unk_24C3B94D0;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

void __43__CPSClipRequest__openClipWithInvocationUI__block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_errorIgnoringUserCancelledErrorIfNeeded:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = CPS_LOG_CHANNEL_PREFIXClipServices();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (!v4)
      goto LABEL_7;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 8);
    v7 = v3;
    objc_msgSend(v6, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cps_privacyPreservingDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 134218499;
    v15 = v5;
    v16 = 2117;
    v17 = v8;
    v18 = 2114;
    v19 = v9;
    _os_log_impl(&dword_20AD44000, v7, OS_LOG_TYPE_INFO, "CPSClipRequest (%p): Failed to show invocation UI for %{sensitive}@: %{public}@", (uint8_t *)&v14, 0x20u);

  }
  else
  {
    if (!v4)
      goto LABEL_7;
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 8);
    v12 = v3;
    objc_msgSend(v11, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 134218243;
    v15 = v10;
    v16 = 2117;
    v17 = v8;
    _os_log_impl(&dword_20AD44000, v12, OS_LOG_TYPE_INFO, "CPSClipRequest (%p): Finished showing invocation UI for %{sensitive}@", (uint8_t *)&v14, 0x16u);

  }
LABEL_7:
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if (v13)
    (*(void (**)(uint64_t, BOOL, void *))(v13 + 16))(v13, objc_msgSend(v2, "code") != 11, v2);

}

- (void)proxy:(id)a3 didDetermineAvailability:(BOOL)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  NSObject *v11;
  CPSSessionProxy *sessionProxy;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void (**completionHandler)(id, _QWORD, void *);
  void *v19;
  int v20;
  CPSClipRequest *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (a4)
  {
    self->_shouldOpenClipWhenMetadataIsUpdated = 0;
    -[CPSSessionProxy configuration](self->_sessionProxy, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "useLocalContent");

    if ((v8 & 1) == 0)
      -[CPSClipRequest _openClipWithInvocationUI](self, "_openClipWithInvocationUI");
  }
  else
  {
    -[CPSSessionProxy configuration](self->_sessionProxy, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fallbackClipBundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      self->_shouldOpenClipWhenMetadataIsUpdated = 1;
    }
    else
    {
      self->_shouldOpenClipWhenMetadataIsUpdated = 0;
      v11 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        sessionProxy = self->_sessionProxy;
        v13 = v11;
        -[CPSSessionProxy url](sessionProxy, "url");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 134218243;
        v21 = self;
        v22 = 2117;
        v23 = v14;
        _os_log_impl(&dword_20AD44000, v13, OS_LOG_TYPE_INFO, "CPSClipRequest (%p): Clip is not available for %{sensitive}@", (uint8_t *)&v20, 0x16u);

      }
      +[CPSAnalyticsLogger sharedLogger](CPSAnalyticsLogger, "sharedLogger");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPSSessionProxy configuration](self->_sessionProxy, "configuration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "launchReason");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "recordClientClipRequestWithBundleID:launchReason:", 0, v17);

      completionHandler = (void (**)(id, _QWORD, void *))self->_completionHandler;
      if (completionHandler)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "cps_errorWithCode:", 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        completionHandler[2](completionHandler, 0, v19);

      }
      -[CPSSessionProxy disconnect](self->_sessionProxy, "disconnect");
    }
  }

}

- (void)proxyDidUpdateMetadata:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasAppMetadata");

  if (v5)
  {
    +[CPSAnalyticsLogger sharedLogger](CPSAnalyticsLogger, "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "metadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clipBundleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSSessionProxy configuration](self->_sessionProxy, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "launchReason");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recordClientClipRequestWithBundleID:launchReason:", v8, v10);

  }
  if (self->_shouldOpenClipWhenMetadataIsUpdated)
  {
    self->_shouldOpenClipWhenMetadataIsUpdated = 0;
    -[CPSClipRequest _openClipWithInvocationUI](self, "_openClipWithInvocationUI");
  }

}

- (void)proxy:(id)a3 didFinishLoadingWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  CPSSessionProxy *sessionProxy;
  NSObject *v13;
  void *v14;
  void *v15;
  CPSSessionProxy *v16;
  NSObject *v17;
  int v18;
  CPSClipRequest *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_completionHandler)
  {
    -[CPSClipRequest _errorIgnoringUserCancelledErrorIfNeeded:](self, "_errorIgnoringUserCancelledErrorIfNeeded:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = CPS_LOG_CHANNEL_PREFIXClipServices();
    v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        sessionProxy = self->_sessionProxy;
        v13 = v11;
        -[CPSSessionProxy url](sessionProxy, "url");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "cps_privacyPreservingDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 134218755;
        v19 = self;
        v20 = 2117;
        v21 = v14;
        v22 = 2114;
        v23 = v15;
        v24 = 2048;
        v25 = v6;
        _os_log_error_impl(&dword_20AD44000, v13, OS_LOG_TYPE_ERROR, "CPSClipRequest (%p): Failed to show invocation UI for %{sensitive}@: %{public}@, proxy: %p", (uint8_t *)&v18, 0x2Au);

LABEL_8:
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v16 = self->_sessionProxy;
      v17 = v11;
      -[CPSSessionProxy url](v16, "url");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 134218499;
      v19 = self;
      v20 = 2117;
      v21 = v14;
      v22 = 2048;
      v23 = v6;
      _os_log_impl(&dword_20AD44000, v17, OS_LOG_TYPE_INFO, "CPSClipRequest (%p): Finished showing invocation UI for %{sensitive}@, proxy: %p", (uint8_t *)&v18, 0x20u);

      goto LABEL_8;
    }
    (*((void (**)(void))self->_completionHandler + 2))();
    goto LABEL_10;
  }
  v9 = v7;
LABEL_10:

}

- (void)proxyRemoteServiceDidCrash:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  v5 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[CPSClipRequest proxyRemoteServiceDidCrash:].cold.1((uint64_t)self, (uint64_t)v4, v5);

}

- (void)proxyAppDidLaunchForTesting:(id)a3
{
  id v3;

  if (objc_msgSend(a3, "usedByPPT"))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("com.apple.ClipServices.Notification.TestComplete"), 0);

  }
}

- (BOOL)shouldReturnErrorOnUserCancellation
{
  return self->_shouldReturnErrorOnUserCancellation;
}

- (void)setShouldReturnErrorOnUserCancellation:(BOOL)a3
{
  self->_shouldReturnErrorOnUserCancellation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_sessionProxy, 0);
}

void __54__CPSClipRequest_deleteClipsWithBundleIDs_completion___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = a2;
  objc_msgSend(a3, "cps_privacyPreservingDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 134218499;
  v9 = v4;
  v10 = 2113;
  v11 = v5;
  v12 = 2114;
  v13 = v7;
  _os_log_error_impl(&dword_20AD44000, v6, OS_LOG_TYPE_ERROR, "CPSClipRequest (%p): Failed to delete clip with bundleIDs %{private}@: %{public}@", (uint8_t *)&v8, 0x20u);

}

- (void)proxyRemoteServiceDidCrash:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218240;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  _os_log_error_impl(&dword_20AD44000, log, OS_LOG_TYPE_ERROR, "CPSClipRequest (%p): Remote service crashed for proxy: %p", (uint8_t *)&v3, 0x16u);
}

@end
