@implementation CPSClipMetadataRequest

- (CPSClipMetadataRequest)initWithURLHash:(id)a3
{
  id v4;
  CPSClipMetadataRequest *v5;
  uint64_t v6;
  NSString *fullHash;
  CPSClipMetadataRequest *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPSClipMetadataRequest;
  v5 = -[CPSClipMetadataRequest init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    fullHash = v5->_fullHash;
    v5->_fullHash = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (CPSClipMetadataRequest)initWithURL:(id)a3
{
  return -[CPSClipMetadataRequest initWithURL:fallbackClipBundleID:](self, "initWithURL:fallbackClipBundleID:", a3, 0);
}

- (CPSClipMetadataRequest)initWithURL:(id)a3 fallbackClipBundleID:(id)a4
{
  id v6;
  id v7;
  CPSClipMetadataRequest *v8;
  CPSClipMetadataRequest *v9;
  CPSClipMetadataRequest *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CPSClipMetadataRequest;
  v8 = -[CPSClipMetadataRequest init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[CPSClipMetadataRequest _setUpSessionProxyAndPromisesWithURL:fallbackClipBundleID:](v8, "_setUpSessionProxyAndPromisesWithURL:fallbackClipBundleID:", v6, v7);
    v10 = v9;
  }

  return v9;
}

- (void)_setUpSessionProxyAndPromisesWithURL:(id)a3 fallbackClipBundleID:(id)a4
{
  id v6;
  id v7;
  CPSPromise *v8;
  CPSPromise *availabilityPromise;
  CPSPromise *v10;
  CPSPromise *iconPromise;
  CPSPromise *v12;
  CPSPromise *metadataPromise;
  CPSSessionProxy *v14;
  CPSSessionProxy *sessionProxy;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  CPSSessionProxy *v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  CPSClipMetadataRequest *v24;
  __int16 v25;
  CPSSessionProxy *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[CPSPromise promise](CPSPromise, "promise");
  v8 = (CPSPromise *)objc_claimAutoreleasedReturnValue();
  availabilityPromise = self->_availabilityPromise;
  self->_availabilityPromise = v8;

  +[CPSPromise promise](CPSPromise, "promise");
  v10 = (CPSPromise *)objc_claimAutoreleasedReturnValue();
  iconPromise = self->_iconPromise;
  self->_iconPromise = v10;

  +[CPSPromise promise](CPSPromise, "promise");
  v12 = (CPSPromise *)objc_claimAutoreleasedReturnValue();
  metadataPromise = self->_metadataPromise;
  self->_metadataPromise = v12;

  v14 = -[CPSSessionProxy initWithURL:]([CPSSessionProxy alloc], "initWithURL:", v6);
  sessionProxy = self->_sessionProxy;
  self->_sessionProxy = v14;

  +[CPSSessionConfiguration standardConfigurationWithURL:fallbackBundleID:](CPSSessionConfiguration, "standardConfigurationWithURL:fallbackBundleID:", v6, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPSSessionProxy setConfiguration:](self->_sessionProxy, "setConfiguration:", v16);
  -[CPSSessionProxy setDelegate:](self->_sessionProxy, "setDelegate:", self);
  -[CPSSessionProxy connectToService](self->_sessionProxy, "connectToService");
  v17 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = v17;
    v19 = objc_opt_class();
    v20 = self->_sessionProxy;
    v21 = 138544131;
    v22 = v19;
    v23 = 2048;
    v24 = self;
    v25 = 2048;
    v26 = v20;
    v27 = 2117;
    v28 = v6;
    _os_log_impl(&dword_20AD44000, v18, OS_LOG_TYPE_INFO, "%{public}@ (%p): session proxy (%p) set up for URL %{sensitive}@", (uint8_t *)&v21, 0x2Au);

  }
}

- (CPSSessionConfiguration)sessionConfiguration
{
  return -[CPSSessionProxy configuration](self->_sessionProxy, "configuration");
}

- (BOOL)isLikelyAvailable
{
  void *v3;
  void *v4;
  char v5;
  NSObject *v7;
  CPSPromise *availabilityPromise;
  NSObject *v9;
  dispatch_time_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  if (self->_fullHash)
    return 1;
  -[CPSSessionProxy url](self->_sessionProxy, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cps_fallbackBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return 1;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__7;
  v21 = __Block_byref_object_dispose__7;
  v22 = 0;
  v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  availabilityPromise = self->_availabilityPromise;
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __43__CPSClipMetadataRequest_isLikelyAvailable__block_invoke;
  v14 = &unk_24C3BA5C0;
  v16 = &v17;
  v9 = v7;
  v15 = v9;
  -[CPSPromise addCompletionBlock:](availabilityPromise, "addCompletionBlock:", &v11);
  v10 = dispatch_time(0, 1000000000);
  dispatch_group_wait(v9, v10);
  v5 = objc_msgSend((id)v18[5], "BOOLValue", v11, v12, v13, v14);

  _Block_object_dispose(&v17, 8);
  return v5;
}

void __43__CPSClipMetadataRequest_isLikelyAvailable__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (id)getClipMetadataSynchronously
{
  NSObject *v3;
  CPSPromise *metadataPromise;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  NSObject *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  CPSClipMetadataRequest *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (!self->_sessionProxy)
  {
    v13 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CPSClipMetadataRequest getClipMetadataSynchronously].cold.1(v13);
    return 0;
  }
  if (!-[CPSClipMetadataRequest isLikelyAvailable](self, "isLikelyAvailable"))
    return 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__7;
  v24 = __Block_byref_object_dispose__7;
  v25 = 0;
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  metadataPromise = self->_metadataPromise;
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __54__CPSClipMetadataRequest_getClipMetadataSynchronously__block_invoke;
  v17 = &unk_24C3BA5E8;
  v19 = &v20;
  v5 = v3;
  v18 = v5;
  -[CPSPromise addCompletionBlock:](metadataPromise, "addCompletionBlock:", &v14);
  v6 = dispatch_time(0, 5000000000);
  dispatch_group_wait(v5, v6);
  v7 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    v9 = v21[5];
    -[CPSSessionProxy url](self->_sessionProxy, "url", v14, v15, v16, v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544131;
    v27 = v8;
    v28 = 2048;
    v29 = self;
    v30 = 2048;
    v31 = v9;
    v32 = 2117;
    v33 = v10;
    _os_log_impl(&dword_20AD44000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ (%p): requested metadata %p for %{sensitive}@", buf, 0x2Au);

  }
  v11 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __54__CPSClipMetadataRequest_getClipMetadataSynchronously__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (id)getDownloadedIconURLSynchronously
{
  NSObject *v3;
  CPSPromise *iconPromise;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  NSObject *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  CPSClipMetadataRequest *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (!self->_sessionProxy)
  {
    v13 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CPSClipMetadataRequest getDownloadedIconURLSynchronously].cold.1(v13);
    return 0;
  }
  if (!-[CPSClipMetadataRequest isLikelyAvailable](self, "isLikelyAvailable"))
    return 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__7;
  v24 = __Block_byref_object_dispose__7;
  v25 = 0;
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  iconPromise = self->_iconPromise;
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __59__CPSClipMetadataRequest_getDownloadedIconURLSynchronously__block_invoke;
  v17 = &unk_24C3BA610;
  v19 = &v20;
  v5 = v3;
  v18 = v5;
  -[CPSPromise addCompletionBlock:](iconPromise, "addCompletionBlock:", &v14);
  v6 = dispatch_time(0, 5000000000);
  dispatch_group_wait(v5, v6);
  v7 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    v9 = v21[5];
    -[CPSSessionProxy url](self->_sessionProxy, "url", v14, v15, v16, v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544131;
    v27 = v8;
    v28 = 2048;
    v29 = self;
    v30 = 2048;
    v31 = v9;
    v32 = 2117;
    v33 = v10;
    _os_log_impl(&dword_20AD44000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ (%p): requested icon URL %p for %{sensitive}@", buf, 0x2Au);

  }
  v11 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __59__CPSClipMetadataRequest_getDownloadedIconURLSynchronously__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (void)dealloc
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  CPSSessionProxy *sessionProxy;
  objc_super v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  CPSClipMetadataRequest *v11;
  __int16 v12;
  CPSSessionProxy *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = v3;
    v5 = objc_opt_class();
    sessionProxy = self->_sessionProxy;
    *(_DWORD *)buf = 138543874;
    v9 = v5;
    v10 = 2048;
    v11 = self;
    v12 = 2048;
    v13 = sessionProxy;
    _os_log_impl(&dword_20AD44000, v4, OS_LOG_TYPE_INFO, "%{public}@ (%p): Disconnecting session proxy (%p)", buf, 0x20u);

  }
  -[CPSSessionProxy disconnect](self->_sessionProxy, "disconnect");
  v7.receiver = self;
  v7.super_class = (Class)CPSClipMetadataRequest;
  -[CPSClipMetadataRequest dealloc](&v7, sel_dealloc);
}

- (void)requestMetadataWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSString *fullHash;
  void *v13;
  NSString *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  CPSClipMetadataRequest *v23;
  __int16 v24;
  NSString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __56__CPSClipMetadataRequest_requestMetadataWithCompletion___block_invoke;
  v18[3] = &unk_24C3BA660;
  v18[4] = self;
  v6 = v4;
  v19 = v6;
  v7 = MEMORY[0x20BD30A54](v18);
  v8 = (void *)v7;
  if (self->_sessionProxy)
  {
    (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
  }
  else
  {
    v9 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = v9;
      v11 = objc_opt_class();
      fullHash = self->_fullHash;
      *(_DWORD *)buf = 138543875;
      v21 = v11;
      v22 = 2048;
      v23 = self;
      v24 = 2117;
      v25 = fullHash;
      _os_log_impl(&dword_20AD44000, v10, OS_LOG_TYPE_INFO, "%{public}@ (%p): requesting url for %{sensitive}@", buf, 0x20u);

    }
    +[CPSDaemonConnection sharedConnection](CPSDaemonConnection, "sharedConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = self->_fullHash;
    v15[0] = v5;
    v15[1] = 3221225472;
    v15[2] = __56__CPSClipMetadataRequest_requestMetadataWithCompletion___block_invoke_14;
    v15[3] = &unk_24C3BA688;
    v15[4] = self;
    v16 = v6;
    v17 = v8;
    objc_msgSend(v13, "fetchClipURLWithURLHash:completionHandler:", v14, v15);

  }
}

void __56__CPSClipMetadataRequest_requestMetadataWithCompletion___block_invoke(uint64_t a1, char a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _BYTE *v12;
  char v13;
  _BYTE buf[24];
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    v6 = objc_opt_class();
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_20AD44000, v5, OS_LOG_TYPE_INFO, "%{public}@ (%p): requesting metadata asynchronously", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v15 = __Block_byref_object_copy__7;
  v16 = __Block_byref_object_dispose__7;
  v17 = *(id *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56__CPSClipMetadataRequest_requestMetadataWithCompletion___block_invoke_10;
  v10[3] = &unk_24C3BA638;
  v12 = buf;
  v13 = a2;
  v11 = v8;
  objc_msgSend(v9, "addCompletionBlock:", v10);

  _Block_object_dispose(buf, 8);
}

void __56__CPSClipMetadataRequest_requestMetadataWithCompletion___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void (*v17)(void);
  uint64_t v18;
  void *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = CPS_LOG_CHANNEL_PREFIXClipServices();
  v8 = v7;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __56__CPSClipMetadataRequest_requestMetadataWithCompletion___block_invoke_10_cold_1(a1, v8);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    v10 = objc_opt_class();
    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v20 = 138543618;
    v21 = v10;
    v22 = 2048;
    v23 = v11;
    _os_log_impl(&dword_20AD44000, v9, OS_LOG_TYPE_INFO, "%{public}@ (%p): got metadata asynchronously", (uint8_t *)&v20, 0x16u);

  }
  if (*(_BYTE *)(a1 + 48))
  {
    +[CPSAnalyticsLogger sharedLogger](CPSAnalyticsLogger, "sharedLogger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clipBundleID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "recordClientMetadataRequestWithBundleID:launchReason:", v13, CFSTR("LocationBased"));

    objc_msgSend(v5, "invocationPolicy");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isEligible"))
    {

    }
    else
    {
      objc_msgSend(v5, "invocationPolicy");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isRecoverable");

      if (!v16)
      {
        v17 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
        goto LABEL_12;
      }
    }
  }
  v17 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_12:
  v17();
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = 0;

}

void __56__CPSClipMetadataRequest_requestMetadataWithCompletion___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = CPS_LOG_CHANNEL_PREFIXClipServices();
  v8 = v7;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __56__CPSClipMetadataRequest_requestMetadataWithCompletion___block_invoke_14_cold_1(a1, v8, v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = v8;
      v10 = objc_opt_class();
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(v11 + 8);
      v13 = 138543875;
      v14 = v10;
      v15 = 2048;
      v16 = v11;
      v17 = 2117;
      v18 = v12;
      _os_log_impl(&dword_20AD44000, v9, OS_LOG_TYPE_INFO, "%{public}@ (%p): finished requesting url for %{sensitive}@", (uint8_t *)&v13, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "_setUpSessionProxyAndPromisesWithURL:fallbackClipBundleID:", v5, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)requestDownloadedIconWithMetadata:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  CPSPromise *iconPromise;
  _QWORD v13[4];
  void (**v14)(id, _QWORD);
  _BYTE *v15;
  _BYTE buf[24];
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  CPSClipMetadataRequest *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (!self->_sessionProxy)
  {
    objc_msgSend(v6, "clipURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v7[2](v7, 0);
      goto LABEL_7;
    }
    objc_msgSend(v6, "clipURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSClipMetadataRequest _setUpSessionProxyAndPromisesWithURL:fallbackClipBundleID:](self, "_setUpSessionProxyAndPromisesWithURL:fallbackClipBundleID:", v9, 0);

  }
  v10 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = self;
    _os_log_impl(&dword_20AD44000, v11, OS_LOG_TYPE_INFO, "%{public}@ (%p): requesting icon asynchronously", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v17 = __Block_byref_object_copy__7;
  v18 = __Block_byref_object_dispose__7;
  v19 = self;
  iconPromise = v19->_iconPromise;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __71__CPSClipMetadataRequest_requestDownloadedIconWithMetadata_completion___block_invoke;
  v13[3] = &unk_24C3BA6B0;
  v15 = buf;
  v14 = v7;
  -[CPSPromise addCompletionBlock:](iconPromise, "addCompletionBlock:", v13);

  _Block_object_dispose(buf, 8);
LABEL_7:

}

void __71__CPSClipMetadataRequest_requestDownloadedIconWithMetadata_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a2;
  v7 = CPS_LOG_CHANNEL_PREFIXClipServices();
  v8 = v7;
  if (!a2 || v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __71__CPSClipMetadataRequest_requestDownloadedIconWithMetadata_completion___block_invoke_cold_1(a1, v8);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    v10 = objc_opt_class();
    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v14 = 138543618;
    v15 = v10;
    v16 = 2048;
    v17 = v11;
    _os_log_impl(&dword_20AD44000, v9, OS_LOG_TYPE_INFO, "%{public}@ (%p): got icon asynchronously", (uint8_t *)&v14, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = 0;

}

- (void)proxy:(id)a3 didDetermineAvailability:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  CPSPromise *availabilityPromise;
  id v10;

  v4 = a4;
  if (!a4)
  {
    +[CPSAnalyticsLogger sharedLogger](CPSAnalyticsLogger, "sharedLogger", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSSessionProxy configuration](self->_sessionProxy, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "launchReason");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recordClientMetadataRequestWithBundleID:launchReason:", 0, v8);

  }
  availabilityPromise = self->_availabilityPromise;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[CPSPromise finishWithResult:](availabilityPromise, "finishWithResult:", v10);

}

- (void)proxy:(id)a3 didRetrieveApplicationIcon:(id)a4
{
  void *v5;
  char v6;
  CPSPromise *iconPromise;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPoweredByThirdParty");

  if ((v6 & 1) == 0)
  {
    iconPromise = self->_iconPromise;
    objc_msgSend(v9, "applicationIconFileURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSPromise finishWithResult:](iconPromise, "finishWithResult:", v8);

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
  CPSPromise *metadataPromise;
  void *v12;
  void *v13;
  CPSPromise *v14;
  void *v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasAppMetadata");

  if (v5)
  {
    +[CPSAnalyticsLogger sharedLogger](CPSAnalyticsLogger, "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "metadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clipBundleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSSessionProxy configuration](self->_sessionProxy, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "launchReason");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recordClientMetadataRequestWithBundleID:launchReason:", v8, v10);

    metadataPromise = self->_metadataPromise;
    objc_msgSend(v16, "metadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSPromise finishWithResult:](metadataPromise, "finishWithResult:", v12);
  }
  else
  {
    objc_msgSend(v16, "metadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "invocationPolicy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 && (objc_msgSend(v12, "isEligible") & 1) == 0 && (objc_msgSend(v12, "isRecoverable") & 1) == 0)
    {
      v14 = self->_metadataPromise;
      objc_msgSend(v16, "metadata");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPSPromise finishWithResult:](v14, "finishWithResult:", v15);

      -[CPSPromise finish](self->_iconPromise, "finish");
    }
  }

}

- (void)proxyDidRetrieveBusinessIcon:(id)a3
{
  CPSPromise *iconPromise;
  id v4;

  iconPromise = self->_iconPromise;
  objc_msgSend(a3, "businessIconURL");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CPSPromise finishWithResult:](iconPromise, "finishWithResult:", v4);

}

- (void)proxyRemoteServiceDidCrash:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CPSErrorDomain"), 3, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CPSPromise finishWithError:](self->_metadataPromise, "finishWithError:", v4);
  -[CPSPromise finishWithError:](self->_iconPromise, "finishWithError:", v4);

}

- (void)proxy:(id)a3 didFinishLoadingWithError:(id)a4
{
  CPSPromise *metadataPromise;
  id v6;

  metadataPromise = self->_metadataPromise;
  v6 = a4;
  -[CPSPromise finishWithError:](metadataPromise, "finishWithError:", v6);
  -[CPSPromise finishWithError:](self->_iconPromise, "finishWithError:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataPromise, 0);
  objc_storeStrong((id *)&self->_iconPromise, 0);
  objc_storeStrong((id *)&self->_availabilityPromise, 0);
  objc_storeStrong((id *)&self->_sessionProxy, 0);
  objc_storeStrong((id *)&self->_requestURL, 0);
  objc_storeStrong((id *)&self->_fullHash, 0);
}

- (void)getClipMetadataSynchronously
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = a1;
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_2_3(&dword_20AD44000, v3, v4, "%{public}@ (%p): synchronous metadata fetching only works with URL based request, please use initWithURL:", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

- (void)getDownloadedIconURLSynchronously
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = a1;
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_2_3(&dword_20AD44000, v3, v4, "%{public}@ (%p): synchronous metadata fetching only works with URL based request, please use initWithURL:", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __56__CPSClipMetadataRequest_requestMetadataWithCompletion___block_invoke_10_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_2(a1, a2);
  OUTLINED_FUNCTION_5_0();
  objc_msgSend((id)OUTLINED_FUNCTION_6_2(), "cps_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_2(&dword_20AD44000, v4, v5, "%{public}@ (%p): failed to get metadata: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_5_1();
}

void __56__CPSClipMetadataRequest_requestMetadataWithCompletion___block_invoke_14_cold_1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v3;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = OUTLINED_FUNCTION_5_0();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(v8 + 8);
  objc_msgSend(a3, "cps_privacyPreservingDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 138544131;
  v12 = v7;
  v13 = 2048;
  v14 = v8;
  v15 = 2117;
  v16 = v9;
  v17 = 2114;
  v18 = v10;
  _os_log_error_impl(&dword_20AD44000, v3, OS_LOG_TYPE_ERROR, "%{public}@ (%p): error requesting url for %{sensitive}@: %{public}@", (uint8_t *)&v11, 0x2Au);

}

void __71__CPSClipMetadataRequest_requestDownloadedIconWithMetadata_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_2(a1, a2);
  OUTLINED_FUNCTION_5_0();
  objc_msgSend((id)OUTLINED_FUNCTION_6_2(), "cps_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_2(&dword_20AD44000, v4, v5, "%{public}@ (%p): failed to get icon: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_5_1();
}

@end
