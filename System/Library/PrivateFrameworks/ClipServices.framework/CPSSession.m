@implementation CPSSession

- (CPSSession)initWithURL:(id)a3 usingQueue:(id)a4
{
  return -[CPSSession initWithURL:usingQueue:configuration:](self, "initWithURL:usingQueue:configuration:", a3, a4, 0);
}

- (CPSSession)initWithURL:(id)a3 usingQueue:(id)a4 configuration:(id)a5
{
  id v9;
  id v10;
  id v11;
  CPSSession *v12;
  CPSSession *v13;
  CPSClipLaunchOptions *v14;
  CPSClipLaunchOptions *launchOptions;
  uint64_t v16;
  NSMutableArray *proxyObjects;
  CPSImageLoader *v18;
  CPSImageLoader *imageLoader;
  CPSSessionConfiguration *configuration;
  CPSSession *v21;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)CPSSession;
  v12 = -[CPSSession init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a4);
    v14 = objc_alloc_init(CPSClipLaunchOptions);
    launchOptions = v13->_launchOptions;
    v13->_launchOptions = v14;

    objc_storeStrong((id *)&v13->_url, a3);
    objc_storeStrong((id *)&v13->_queue, a4);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v16 = objc_claimAutoreleasedReturnValue();
    proxyObjects = v13->_proxyObjects;
    v13->_proxyObjects = (NSMutableArray *)v16;

    v18 = objc_alloc_init(CPSImageLoader);
    imageLoader = v13->_imageLoader;
    v13->_imageLoader = v18;

    objc_storeStrong((id *)&v13->_configuration, a5);
    configuration = v13->_configuration;
    if (!configuration || !-[CPSSessionConfiguration useLocalContent](configuration, "useLocalContent"))
      -[CPSSession _fetchBusinessMetadata](v13, "_fetchBusinessMetadata");
    v21 = v13;
  }

  return v13;
}

- (void)addRemoteObjectProxy:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__CPSSession_addRemoteObjectProxy___block_invoke;
  v7[3] = &unk_24C3B94D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

_QWORD *__35__CPSSession_addRemoteObjectProxy___block_invoke(uint64_t a1)
{
  int v2;
  _QWORD *result;
  BOOL v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  _QWORD *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  char v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "isForSwitcherOverlay");
  result = *(_QWORD **)(a1 + 32);
  if (result[17])
    v4 = 1;
  else
    v4 = v2 == 0;
  if (!v4 && !result[8])
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "cps_errorWithCode:", 17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didFinishLoadingWithError:", v6);

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = 2;
    result = *(_QWORD **)(a1 + 32);
  }
  v7 = result[7];
  if (v7)
  {
    v8 = *(void **)(a1 + 40);
    v9 = v7 == 1;
    objc_msgSend(result, "_availabilityOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "didDetermineAvailability:options:", v9, v10);

    v11 = *(_QWORD **)(a1 + 32);
    if (v11[8] == 2)
      v12 = v2;
    else
      v12 = 0;
    if (v12 == 1)
    {
      v13 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDD1540], "cps_errorWithCode:", 16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "didFinishLoadingWithError:", v14);

      v11 = *(_QWORD **)(a1 + 32);
    }
    v28[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_notifyObserversOfMetadataFetchResultUpdates:", v15);

    v16 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v16 + 144))
    {
      objc_msgSend(*(id *)(a1 + 40), "didUpdateInstallProgress:");
      v16 = *(_QWORD *)(a1 + 32);
    }
    v23 = 0;
    result = (_QWORD *)objc_msgSend(*(id *)(v16 + 136), "hasUpToDateVersionInstalledOnSystemIsPlaceholder:", &v23);
    if ((_DWORD)result && v23)
    {
      v17 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(_QWORD *)(a1 + 40);
        v19 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
        v20 = v17;
        objc_msgSend(v19, "clipBundleID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218243;
        v25 = v18;
        v26 = 2113;
        v27 = v21;
        _os_log_impl(&dword_20AD44000, v20, OS_LOG_TYPE_DEFAULT, "CPSSession: placeholder already installed when objectProxy (%p) is added for %{private}@", buf, 0x16u);

      }
      result = (_QWORD *)objc_msgSend(*(id *)(a1 + 40), "didInstallApplicationPlaceholder");
    }
    v22 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v22 + 88))
    {
      result = (_QWORD *)objc_msgSend(*(id *)(a1 + 40), "didRetrieveApplicationIcon:", *(_QWORD *)(v22 + 32));
      v22 = *(_QWORD *)(a1 + 32);
    }
    if (*(_QWORD *)(v22 + 40))
    {
      result = (_QWORD *)objc_msgSend(*(id *)(a1 + 40), "didRetrieveHeroImage:");
      v22 = *(_QWORD *)(a1 + 32);
    }
    if (*(_QWORD *)(v22 + 48))
      return (_QWORD *)objc_msgSend(*(id *)(a1 + 40), "didRetrieveBusinessIcon:");
  }
  return result;
}

- (void)removeRemoteObjectProxy:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__CPSSession_removeRemoteObjectProxy___block_invoke;
  v7[3] = &unk_24C3B94D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __38__CPSSession_removeRemoteObjectProxy___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (BOOL)registeredForTest
{
  return -[CPSSessionConfiguration usedByPPT](self->_configuration, "usedByPPT");
}

- (NSString)logID
{
  void *v2;
  void *v3;

  -[CPSSessionConfiguration sessionID](self->_configuration, "sessionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isPurgeable
{
  return -[NSMutableArray count](self->_proxyObjects, "count") == 0;
}

- (void)_fetchBusinessMetadata
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__CPSSession__fetchBusinessMetadata__block_invoke;
  block[3] = &unk_24C3B94A8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __36__CPSSession__fetchBusinessMetadata__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[6];
  _QWORD v15[6];
  _BYTE buf[24];
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 160) && *(_QWORD *)(v1 + 72) != 1)
  {
    *(_QWORD *)(v1 + 72) = 1;
    v3 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_signpost_enabled(v3))
    {
      v4 = *(void **)(a1 + 32);
      v5 = v3;
      objc_msgSend(v4, "logID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2082;
      *(_QWORD *)&buf[14] = "[begin] fetching ABR metadata";
      _os_signpost_emit_with_name_impl(&dword_20AD44000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ABRMetaData", " ID=[%{public, signpost.description:logID}@]  Message=%{public}s ", buf, 0x16u);

    }
    v7 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_signpost_enabled(v7))
    {
      v8 = *(void **)(a1 + 32);
      v9 = v7;
      objc_msgSend(v8, "logID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2082;
      *(_QWORD *)&buf[14] = "[begin] Marking Placeholder request";
      _os_signpost_emit_with_name_impl(&dword_20AD44000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "OpenButtonBecomeActive", " ID=[%{public, signpost.description:logID}@]  Message=%{public}s ", buf, 0x16u);

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v17 = __Block_byref_object_copy__5;
    v18 = __Block_byref_object_dispose__5;
    v19 = 0;
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 160);
    v13 = *(_QWORD *)(v11 + 128);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __36__CPSSession__fetchBusinessMetadata__block_invoke_10;
    v15[3] = &unk_24C3B9C20;
    v15[4] = v11;
    v15[5] = buf;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __36__CPSSession__fetchBusinessMetadata__block_invoke_12;
    v14[3] = &unk_24C3B9C98;
    v14[4] = v11;
    v14[5] = buf;
    objc_msgSend(v12, "fetchBusinessMetadataForURL:availabilityHandler:completion:", v13, v15, v14);
    _Block_object_dispose(buf, 8);

  }
}

void __36__CPSSession__fetchBusinessMetadata__block_invoke_10(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  __int128 v10;
  char v11;

  v5 = a3;
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __36__CPSSession__fetchBusinessMetadata__block_invoke_2;
  v8[3] = &unk_24C3B99A0;
  v9 = v5;
  v10 = *(_OWORD *)(a1 + 32);
  v11 = a2;
  v7 = v5;
  dispatch_async(v6, v8);

}

uint64_t __36__CPSSession__fetchBusinessMetadata__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(a1 + 32));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v2 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 128);
      v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v6 = 138740227;
      v7 = v3;
      v8 = 2113;
      v9 = v4;
      _os_log_impl(&dword_20AD44000, v2, OS_LOG_TYPE_INFO, "Found a pattern match for url %{sensitive}@ with matched bundleID %{private}@", (uint8_t *)&v6, 0x16u);
    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "_didDetermineAvailability:", *(unsigned __int8 *)(a1 + 56));
}

void __36__CPSSession__fetchBusinessMetadata__block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(NSObject **)(v7 + 8);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __36__CPSSession__fetchBusinessMetadata__block_invoke_2_13;
  v12[3] = &unk_24C3B9C70;
  v12[4] = v7;
  v13 = v6;
  v14 = v5;
  v15 = v8;
  v10 = v5;
  v11 = v6;
  dispatch_async(v9, v12);

}

void __36__CPSSession__fetchBusinessMetadata__block_invoke_2_13(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  id *v6;
  void *v7;
  id *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  BOOL v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  id *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE buf[24];
  void *v32;
  uint64_t *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v2 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_signpost_enabled(v2))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "logID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2082;
    *(_QWORD *)&buf[14] = "[end] fetching ABR metadata enableTelemetry=YES ";
    _os_signpost_emit_with_name_impl(&dword_20AD44000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ABRMetaData", " ID=[%{public, signpost.description:logID}@]  Message=%{public}s ", buf, 0x16u);

  }
  v6 = (id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 40), "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v8 = (id *)getCKErrorDomainSymbolLoc_ptr;
  v30 = getCKErrorDomainSymbolLoc_ptr;
  if (!getCKErrorDomainSymbolLoc_ptr)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getCKErrorDomainSymbolLoc_block_invoke;
    v32 = &unk_24C3B9278;
    v33 = &v27;
    __getCKErrorDomainSymbolLoc_block_invoke((uint64_t)buf);
    v8 = (id *)v28[3];
  }
  _Block_object_dispose(&v27, 8);
  if (!v8)
    __36__CPSSession__fetchBusinessMetadata__block_invoke_2_13_cold_1();
  v9 = *v8;
  if (objc_msgSend(v7, "isEqualToString:", v9))
  {
    if (objc_msgSend(*v6, "code") == 3)
    {

LABEL_16:
      v15 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __36__CPSSession__fetchBusinessMetadata__block_invoke_2_13_cold_2((uint64_t *)(a1 + 40), v15, v16);
      v17 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDD1540], "cps_errorWithCode:", 19);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_didFinishLoadingWithError:", v10);
      goto LABEL_26;
    }
    v14 = objc_msgSend(*v6, "code") == 4;

    if (v14)
      goto LABEL_16;
  }
  else
  {

  }
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v10, "clipBundleID");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "fallbackClipBundleID");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!v11)
      v11 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  }
  if (*v6 || !objc_msgSend(v11, "length"))
  {
    v12 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "cps_errorWithCode:", 2);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_didFinishLoadingWithError:", v13);
  }
  else
  {
    objc_msgSend(v10, "clipLaunchURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "cps_isAMSPlaceholderBundleIdentifier"))
    {
      v19 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
        *(_DWORD *)buf = 138477827;
        *(_QWORD *)&buf[4] = v20;
        _os_log_impl(&dword_20AD44000, v19, OS_LOG_TYPE_INFO, "Find a AMS placeholder app clip experience; use ODJ replacement metadata for URL %{private}@",
          buf,
          0xCu);
      }

      v10 = 0;
    }
    v22 = *(void **)(a1 + 32);
    v21 = (id *)(a1 + 32);
    objc_msgSend(v22, "_didUpdateMetadata:", v10);
    objc_msgSend(*v21, "_fetchBusinessIconIfNeeded");
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __36__CPSSession__fetchBusinessMetadata__block_invoke_16;
    v23[3] = &unk_24C3B9C48;
    v23[4] = *v21;
    v10 = v10;
    v24 = v10;
    v25 = v11;
    v26 = v18;
    v13 = v18;
    +[CPSClipInvocationPolicy requestAccountPolicyWithCompletion:](CPSClipInvocationPolicy, "requestAccountPolicyWithCompletion:", v23);

  }
LABEL_26:

}

void __36__CPSSession__fetchBusinessMetadata__block_invoke_16(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(*(id *)(a1 + 40), "setInvocationPolicy:", v3);
  if ((objc_msgSend(v3, "isEligible") & 1) != 0 || (objc_msgSend(v3, "isRecoverable") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_fetchAppMetadataWithBundleID:url:accountInvocationPolicy:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v3);
    objc_msgSend(*(id *)(a1 + 32), "_fetchParentApplicationMetadataWithBundleID:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = 2;
    objc_msgSend(*(id *)(a1 + 32), "_didUpdateMetadata:", *(_QWORD *)(a1 + 40));
  }

}

- (void)_fetchAppMetadataWithBundleID:(id)a3 url:(id)a4 accountInvocationPolicy:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  CPSAppInfoFetching *appInfoFetcher;
  void *v16;
  _BOOL8 v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  queue = self->_queue;
  v11 = a4;
  dispatch_assert_queue_V2(queue);
  v12 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_signpost_enabled(v12))
  {
    v13 = v12;
    -[CPSSession logID](self, "logID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v14;
    v25 = 2082;
    v26 = "[begin] Fetching App metadata";
    _os_signpost_emit_with_name_impl(&dword_20AD44000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AppMetaData", " ID=[%{public, signpost.description:logID}@]  Message=%{public}s ", buf, 0x16u);

  }
  appInfoFetcher = self->_appInfoFetcher;
  -[CPSSessionConfiguration sourceBundleID](self->_configuration, "sourceBundleID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[CPSSession registeredForTest](self, "registeredForTest");
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __72__CPSSession__fetchAppMetadataWithBundleID_url_accountInvocationPolicy___block_invoke;
  v20[3] = &unk_24C3B9CE8;
  v20[4] = self;
  v21 = v9;
  v22 = v8;
  v18 = v8;
  v19 = v9;
  -[CPSAppInfoFetching lookUpClipMetadataByBundleID:sourceBundleID:URL:downloadIconIfNeeded:skipCaching:completionHandler:](appInfoFetcher, "lookUpClipMetadataByBundleID:sourceBundleID:URL:downloadIconIfNeeded:skipCaching:completionHandler:", v18, v16, v11, 0, v17, v20);

}

void __72__CPSSession__fetchAppMetadataWithBundleID_url_accountInvocationPolicy___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[2] = __72__CPSSession__fetchAppMetadataWithBundleID_url_accountInvocationPolicy___block_invoke_2;
  block[3] = &unk_24C3B9CC0;
  block[1] = 3221225472;
  block[4] = v7;
  v13 = v6;
  v14 = v5;
  v15 = v8;
  v16 = *(id *)(a1 + 48);
  v10 = v5;
  v11 = v6;
  dispatch_async(v9, block);

}

void __72__CPSSession__fetchAppMetadataWithBundleID_url_accountInvocationPolicy___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id *v9;
  id *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  CPSClipMetadata *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  id v28;
  void *v29;
  void *v30;
  _BYTE v31[12];
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v2 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_signpost_enabled(v2))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "logID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v31 = 138543618;
    *(_QWORD *)&v31[4] = v5;
    v32 = 2082;
    v33 = "[end] Fetching App metadata enableTelemetry=YES ";
    _os_signpost_emit_with_name_impl(&dword_20AD44000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AppMetaData", " ID=[%{public, signpost.description:logID}@]  Message=%{public}s ", v31, 0x16u);

  }
  if (*(_QWORD *)(a1 + 40) || (v9 = (id *)(a1 + 48), !*(_QWORD *)(a1 + 48)))
  {
    v6 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __72__CPSSession__fetchAppMetadataWithBundleID_url_accountInvocationPolicy___block_invoke_2_cold_1(a1, v6, (id *)(a1 + 40));
    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "cps_errorWithCode:", 10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_didFinishLoadingWithError:", v8);

    objc_msgSend(*(id *)(a1 + 32), "_retrieveApplicationIconWithAppIconURL:clipBundleID:", 0, 0);
  }
  else
  {
    v10 = (id *)(a1 + 32);
    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
    if (v11)
    {
      objc_msgSend(v11, "clipBundleID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*v9, "clipBundleID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqualToString:", v13);

      if ((v14 & 1) == 0)
      {
        v15 = CPS_LOG_CHANNEL_PREFIXClipServices();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          __72__CPSSession__fetchAppMetadataWithBundleID_url_accountInvocationPolicy___block_invoke_2_cold_2(a1 + 32, v15, (id *)(a1 + 48));
      }
    }
    else
    {
      v16 = objc_alloc_init(CPSClipMetadata);
      v17 = *(_QWORD *)(a1 + 32);
      v18 = *(void **)(v17 + 136);
      *(_QWORD *)(v17 + 136) = v16;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setInvocationPolicy:", *(_QWORD *)(a1 + 56));
      objc_msgSend(*(id *)(a1 + 48), "clipBundleID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setClipBundleID:", v19);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setClipRequestURL:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));
    }
    objc_msgSend(*((id *)*v10 + 17), "_updateWithAMSMetadata:", *v9);
    *((_QWORD *)*v10 + 9) = 2;
    objc_msgSend(*v10, "_didUpdateMetadata:", *((_QWORD *)*v10 + 17));
    objc_msgSend(*((id *)*v10 + 17), "invocationPolicy");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEligible");

    if (v21)
    {
      v31[0] = 0;
      +[CPSAnalyticsLogger sharedLogger](CPSAnalyticsLogger, "sharedLogger", *(_QWORD *)v31);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(a1 + 64);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "launchReason");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "didDiscoverClip:event:alreadyInstalled:", v23, v24, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "hasUpToDateVersionInstalledOnSystemIsPlaceholder:", v31));

    }
    objc_msgSend(*((id *)*v10 + 17), "invocationPolicy");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "isEligible"))
    {

LABEL_19:
      v28 = *v10;
      objc_msgSend(*((id *)*v10 + 17), "fullAppIconURL");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*((id *)*v10 + 17), "clipBundleID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "_retrieveApplicationIconWithAppIconURL:clipBundleID:", v29, v30);

      return;
    }
    objc_msgSend(*((id *)*v10 + 17), "invocationPolicy");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isRecoverable");

    if (v27)
      goto LABEL_19;
  }
}

- (void)_fetchBusinessIconIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  CPSPromise *v10;
  CPSPromise *businessIconFetchingPromise;
  CPSPromise *v12;
  CPSPromise *v13;
  CPSPromise *v14;
  CPSPromise *v15;
  void *v16;
  _QWORD v17[5];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CPSClipMetadata clipBusinessIconURL](self->_metadata, "clipBusinessIconURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSClipMetadata clipMapItemMUID](self->_metadata, "clipMapItemMUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSClipMetadata clipBusinessIconStyleAttributes](self->_metadata, "clipBusinessIconStyleAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_signpost_enabled(v6))
  {
    v7 = v6;
    -[CPSSession logID](self, "logID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v8;
    v20 = 2082;
    v21 = "[begin] Fetching business icon data";
    _os_signpost_emit_with_name_impl(&dword_20AD44000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "BusinessIconData", " ID=[%{public, signpost.description:logID}@]  Message=%{public}s ", buf, 0x16u);

  }
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __40__CPSSession__fetchBusinessIconIfNeeded__block_invoke;
  v17[3] = &unk_24C3B9D10;
  v17[4] = self;
  v9 = (void *)MEMORY[0x20BD30A54](v17);
  if (v3)
  {
    +[CPSPromise promise](CPSPromise, "promise");
    v10 = (CPSPromise *)objc_claimAutoreleasedReturnValue();
    businessIconFetchingPromise = self->_businessIconFetchingPromise;
    self->_businessIconFetchingPromise = v10;

    -[CPSImageLoader loadImageWithURL:completionHandler:](self->_imageLoader, "loadImageWithURL:completionHandler:", v3, v9);
  }
  else if (v4)
  {
    +[CPSPromise promise](CPSPromise, "promise");
    v12 = (CPSPromise *)objc_claimAutoreleasedReturnValue();
    v13 = self->_businessIconFetchingPromise;
    self->_businessIconFetchingPromise = v12;

    -[CPSImageLoader loadImageForMapItemMUID:completionHandler:](self->_imageLoader, "loadImageForMapItemMUID:completionHandler:", objc_msgSend(v4, "unsignedLongLongValue"), v9);
  }
  else if (v5)
  {
    +[CPSPromise promise](CPSPromise, "promise");
    v14 = (CPSPromise *)objc_claimAutoreleasedReturnValue();
    v15 = self->_businessIconFetchingPromise;
    self->_businessIconFetchingPromise = v14;

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3D068]), "initWithDictionary:", v5);
    -[CPSImageLoader loadImageForGEOStyleAttributes:completionHandler:](self->_imageLoader, "loadImageForGEOStyleAttributes:completionHandler:", v16, v9);

  }
}

void __40__CPSSession__fetchBusinessIconIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_signpost_enabled(v7))
  {
    v8 = *(void **)(a1 + 32);
    v9 = v7;
    objc_msgSend(v8, "logID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v10;
    v21 = 2082;
    v22 = "[end] Fetching business icon data";
    _os_signpost_emit_with_name_impl(&dword_20AD44000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "BusinessIconData", " ID=[%{public, signpost.description:logID}@]  Message=%{public}s ", buf, 0x16u);

  }
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(NSObject **)(v11 + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__CPSSession__fetchBusinessIconIfNeeded__block_invoke_25;
  block[3] = &unk_24C3B97E8;
  v16 = v6;
  v17 = v11;
  v18 = v5;
  v13 = v5;
  v14 = v6;
  dispatch_async(v12, block);

}

uint64_t __40__CPSSession__fetchBusinessIconIfNeeded__block_invoke_25(uint64_t a1)
{
  uint64_t *v2;
  NSObject *v3;
  uint64_t v4;

  v2 = (uint64_t *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __40__CPSSession__fetchBusinessIconIfNeeded__block_invoke_25_cold_1(v2, v3, v4);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "finishWithError:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "finishWithResult:", *(_QWORD *)(a1 + 48));
  }
  return objc_msgSend(*(id *)(a1 + 40), "_didFetchBusinessIconWithURL:", *(_QWORD *)(a1 + 48));
}

- (void)_fetchParentApplicationMetadataWithBundleID:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  +[CPSClipDataSQLiteStore defaultStore](CPSClipDataSQLiteStore, "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__CPSSession__fetchParentApplicationMetadataWithBundleID___block_invoke;
  v6[3] = &unk_24C3B9D38;
  v6[4] = self;
  objc_msgSend(v5, "getAppClipRecordWithBundleID:completion:", v4, v6);

}

void __58__CPSSession__fetchParentApplicationMetadataWithBundleID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  objc_msgSend(v3, "fullApplicationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

LABEL_4:
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(NSObject **)(v6 + 8);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __58__CPSSession__fetchParentApplicationMetadataWithBundleID___block_invoke_2;
    v8[3] = &unk_24C3B94D0;
    v8[4] = v6;
    v9 = v3;
    dispatch_async(v7, v8);

    goto LABEL_5;
  }
  objc_msgSend(v3, "fullApplicationCaption");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_4;
LABEL_5:

}

void __58__CPSSession__fetchParentApplicationMetadataWithBundleID___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "fullAppName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "fullApplicationName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setFullAppName:", v4);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "fullAppCaption");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "fullApplicationCaption");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setFullAppCaption:", v6);

    goto LABEL_7;
  }
  if (!v3)
LABEL_7:
    objc_msgSend(*(id *)(a1 + 32), "_didUpdateMetadata:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136));
}

- (NSURL)applicationIconFileURL
{
  NSObject *queue;
  id v3;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36__CPSSession_applicationIconFileURL__block_invoke;
  v5[3] = &unk_24C3B9978;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSURL *)v3;
}

void __36__CPSSession_applicationIconFileURL__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

- (void)_didDetermineAvailability:(BOOL)a3
{
  _BOOL8 v3;
  int64_t v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = 1;
  if (!v3)
    v5 = 2;
  self->_clipAvailabilityState = v5;
  -[CPSSession _availabilityOptions](self, "_availabilityOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_proxyObjects;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11++), "didDetermineAvailability:options:", v3, v6, (_QWORD)v13);
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  if (!v3)
  {
    -[CPSSessionConfiguration fallbackClipBundleID](self->_configuration, "fallbackClipBundleID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      -[CPSSession _evictFromCache](self, "_evictFromCache");
  }

}

- (id)_availabilityOptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CPSSession registeredForTest](self, "registeredForTest"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("RegisteredForTest"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CPSSessionConfiguration originIsControlCenter](self->_configuration, "originIsControlCenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("OriginIsControlCenter"));

  -[CPSSessionConfiguration launchReason](self->_configuration, "launchReason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("LaunchReason"));

  -[CPSSessionConfiguration sourceBundleID](self->_configuration, "sourceBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("SourceBundleID"));

  -[CPSSessionConfiguration referrerBundleID](self->_configuration, "referrerBundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("ReferrerBundleID"));

  return v3;
}

- (void)_didUpdateMetadata:(id)a3
{
  void (**metadataCompletion)(id, CPSClipMetadata *);
  CPSClipMetadata *metadata;
  id v7;
  id v8;

  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_storeStrong((id *)&self->_metadata, a3);
  if (self->_metadataFetchState == 2)
  {
    metadataCompletion = (void (**)(id, CPSClipMetadata *))self->_metadataCompletion;
    if (metadataCompletion)
    {
      if (self->_metadataFetchError)
        metadata = 0;
      else
        metadata = self->_metadata;
      metadataCompletion[2](metadataCompletion, metadata);
      v7 = self->_metadataCompletion;
      self->_metadataCompletion = 0;

    }
  }
  -[CPSSession _notifyObserversOfMetadataFetchResultUpdates:](self, "_notifyObserversOfMetadataFetchResultUpdates:", self->_proxyObjects);

}

- (void)_notifyObserversOfMetadataFetchResultUpdates:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  int64_t metadataFetchState;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (self->_metadataFetchError)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "didFinishLoadingWithError:", self->_metadataFetchError);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v7);
    }
  }
  else
  {
    metadataFetchState = self->_metadataFetchState;
    if (metadataFetchState == 2 || metadataFetchState == 1 && self->_metadata)
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v11 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v16;
        do
        {
          for (j = 0; j != v12; ++j)
          {
            if (*(_QWORD *)v16 != v13)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * j), "didUpdateMetadata:", self->_metadata);
          }
          v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        }
        while (v12);
      }
    }
  }

}

- (void)_didFinishLoadingWithError:(id)a3
{
  void (**metadataCompletion)(id, CPSClipMetadata *);
  CPSClipMetadata *metadata;
  id v7;
  id v8;

  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_metadataFetchState = 2;
  objc_storeStrong((id *)&self->_metadataFetchError, a3);
  if (self->_metadataFetchState == 2)
  {
    metadataCompletion = (void (**)(id, CPSClipMetadata *))self->_metadataCompletion;
    if (metadataCompletion)
    {
      if (self->_metadataFetchError)
        metadata = 0;
      else
        metadata = self->_metadata;
      metadataCompletion[2](metadataCompletion, metadata);
      v7 = self->_metadataCompletion;
      self->_metadataCompletion = 0;

    }
  }
  -[CPSSession _notifyObserversOfMetadataFetchResultUpdates:](self, "_notifyObserversOfMetadataFetchResultUpdates:", self->_proxyObjects);
  if (v8)
    -[CPSSession _evictFromCache](self, "_evictFromCache");

}

- (void)_didFetchBusinessIconWithURL:(id)a3
{
  id v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_businessIconFileURL, a3);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_proxyObjects;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "didRetrieveBusinessIcon:", v5, (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_evictFromCache
{
  id v3;

  +[CPSSessionManager sharedManager](CPSSessionManager, "sharedManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearSessionWithURL:", self->_url);

}

- (void)setPreloadedMetadata:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  self->_clipAvailabilityState = 1;
  self->_metadataFetchState = 2;
  objc_storeStrong((id *)&self->_metadata, a3);
  +[CPSClipInvocationPolicy eligiblePolicy](CPSClipInvocationPolicy, "eligiblePolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSClipMetadata setInvocationPolicy:](self->_metadata, "setInvocationPolicy:", v5);

  if (-[CPSClipMetadata isDeveloperOverride](self->_metadata, "isDeveloperOverride"))
  {
    -[CPSClipMetadata fullAppIconURL](self->_metadata, "fullAppIconURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSClipMetadata clipBundleID](self->_metadata, "clipBundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSSession _retrieveApplicationIconWithAppIconURL:clipBundleID:](self, "_retrieveApplicationIconWithAppIconURL:clipBundleID:", v6, v7);

    -[CPSSession fetchHeroImage](self, "fetchHeroImage");
  }

}

- (void)clearMetadataAndRefetch
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__CPSSession_clearMetadataAndRefetch__block_invoke;
  block[3] = &unk_24C3B94A8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __37__CPSSession_clearMetadataAndRefetch__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v1 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v1 + 72) != 1)
  {
    v2 = result;
    *(_QWORD *)(v1 + 56) = 0;
    *(_QWORD *)(*(_QWORD *)(result + 32) + 72) = 0;
    v3 = *(_QWORD *)(result + 32);
    v4 = *(void **)(v3 + 80);
    *(_QWORD *)(v3 + 80) = 0;

    return objc_msgSend(*(id *)(v2 + 32), "_fetchBusinessMetadata");
  }
  return result;
}

- (void)didCompleteTestSessionAtTime:(double)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__CPSSession_didCompleteTestSessionAtTime___block_invoke;
  v4[3] = &unk_24C3B9928;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

void __43__CPSSession_didCompleteTestSessionAtTime___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "registeredForTest"))
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "didFinishTestingAtTime:", *(double *)(a1 + 40), (_QWORD)v7);
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      }
      while (v4);
    }

  }
}

- (BOOL)checkAndConsumeShowsAppAttributionBannerLaunchOption
{
  BOOL v3;

  v3 = -[CPSClipLaunchOptions showsAppAttributionBanner](self->_launchOptions, "showsAppAttributionBanner");
  -[CPSClipLaunchOptions setShowsAppAttributionBanner:](self->_launchOptions, "setShowsAppAttributionBanner:", 0);
  return v3;
}

- (void)fetchMetadataWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__CPSSession_fetchMetadataWithCompletion___block_invoke;
  v7[3] = &unk_24C3B93C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __42__CPSSession_fetchMetadataWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 72);
  if (!v3)
  {
    objc_msgSend((id)v2, "_fetchBusinessMetadata");
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(v2 + 72);
  }
  if (v3 == 2)
  {
    objc_msgSend(*(id *)(v2 + 136), "invocationPolicy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEligible"))
    {

LABEL_7:
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __42__CPSSession_fetchMetadataWithCompletion___block_invoke_2;
      v16[3] = &unk_24C3B9B98;
      v7 = *(void **)(a1 + 40);
      v16[4] = *(_QWORD *)(a1 + 32);
      v17 = v7;
      +[CPSClipInvocationPolicy requestAccountPolicyWithCompletion:](CPSClipInvocationPolicy, "requestAccountPolicyWithCompletion:", v16);

      return;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "invocationPolicy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isRecoverable");

    if ((v6 & 1) != 0)
      goto LABEL_7;
    objc_msgSend(*(id *)(a1 + 32), "clearMetadataAndRefetch");
    v2 = *(_QWORD *)(a1 + 32);
  }
  v8 = (void *)MEMORY[0x20BD30A54](*(_QWORD *)(v2 + 96));
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __42__CPSSession_fetchMetadataWithCompletion___block_invoke_3;
  v13[3] = &unk_24C3B9D60;
  v14 = *(id *)(a1 + 40);
  v15 = v8;
  v9 = v8;
  v10 = MEMORY[0x20BD30A54](v13);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 96);
  *(_QWORD *)(v11 + 96) = v10;

}

uint64_t __42__CPSSession_fetchMetadataWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = a2;
  dispatch_assert_queue_V2(v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setInvocationPolicy:", v4);
  LODWORD(v3) = objc_msgSend(v4, "isEligible");

  if ((_DWORD)v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "amsDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CPSClipInvocationPolicy invocationPolicyWithAMSDict:](CPSClipInvocationPolicy, "invocationPolicyWithAMSDict:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setInvocationPolicy:", v6);
  }
  objc_msgSend(*(id *)(a1 + 32), "_didUpdateMetadata:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136));
  v7 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v7 + 80))
    v8 = 0;
  else
    v8 = *(_QWORD *)(v7 + 136);
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v8);
}

void __42__CPSSession_fetchMetadataWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v8, v5);
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);

}

- (void)fetchHeroImage
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__CPSSession_fetchHeroImage__block_invoke;
  block[3] = &unk_24C3B94A8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __28__CPSSession_fetchHeroImage__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 40))
  {
    objc_msgSend(*(id *)(v1 + 136), "clipHeroImageURL");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v1, "_retrieveHeroImageWithHeroImageURL:", v2);

  }
}

- (void)_updateLocationConfirmationForRecord:(id)a3 permissionGranted:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (-[CPSClipMetadata clipRequestsLocationConfirmationPermission](self->_metadata, "clipRequestsLocationConfirmationPermission"))
  {
    objc_msgSend(v9, "setLocationConfirmationGranted:", v6);
    if ((objc_msgSend(v6, "BOOLValue") & 1) != 0)
    {
      -[CPSSessionConfiguration launchReason](self->_configuration, "launchReason");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("NFC")) & 1) != 0)
      {
        v8 = 2;
      }
      else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("QR")) & 1) != 0)
      {
        v8 = 1;
      }
      else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("DeveloperTools")) & 1) != 0)
      {
        v8 = 4;
      }
      else if (objc_msgSend(v7, "isEqualToString:", CFSTR("AppclipCode")))
      {
        v8 = 3;
      }
      else
      {
        v8 = 0;
      }
      objc_msgSend(v9, "setLocationConfirmationState:", v8);

    }
    else
    {
      objc_msgSend(v9, "setLocationConfirmationState:", 0);
    }
  }
  else
  {
    objc_msgSend(v9, "setLocationConfirmationGranted:", 0);
  }

}

- (void)updateClipDataForEntryPointWithWebClip:(id)a3 launchOptions:(id)a4
{
  id v6;
  CPSClipLaunchOptions *v7;
  void *v8;
  BOOL v9;
  NSObject *queue;
  id v11;
  CPSClipLaunchOptions *v12;
  id v13;
  _QWORD block[4];
  id v15;
  CPSSession *v16;
  CPSClipLaunchOptions *v17;
  id v18;
  BOOL v19;

  v6 = a3;
  v7 = (CPSClipLaunchOptions *)a4;
  v8 = (void *)os_transaction_create();
  if (!v7)
    v7 = objc_alloc_init(CPSClipLaunchOptions);
  v9 = -[CPSClipLaunchOptions skipsLaunching](v7, "skipsLaunching");
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__CPSSession_updateClipDataForEntryPointWithWebClip_launchOptions___block_invoke;
  block[3] = &unk_24C3B9E00;
  v19 = !v9;
  v15 = v8;
  v16 = self;
  v17 = v7;
  v18 = v6;
  v11 = v6;
  v12 = v7;
  v13 = v8;
  dispatch_async(queue, block);

}

void __67__CPSSession_updateClipDataForEntryPointWithWebClip_launchOptions___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  char v31;
  char v32;

  if (*(_BYTE *)(a1 + 64))
  {
    v2 = objc_msgSend(*(id *)(a1 + 48), "copy");
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(v3 + 168);
    *(_QWORD *)(v3 + 168) = v2;

  }
  +[CPSClipDataSQLiteStore defaultStore](CPSClipDataSQLiteStore, "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "clipBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "clipRequestsNotificationPermission");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "fullAppName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "fullAppCaption");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "fullAppStoreURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "clipVersionIdentifier");
  objc_msgSend(*(id *)(a1 + 56), "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "setWebClipID:", v12);

  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __67__CPSSession_updateClipDataForEntryPointWithWebClip_launchOptions___block_invoke_2;
  v20[3] = &unk_24C3B9DD8;
  v21 = *(id *)(a1 + 32);
  v22 = v6;
  v23 = v8;
  v24 = v9;
  v30 = v11;
  v13 = *(_QWORD *)(a1 + 40);
  v14 = *(void **)(a1 + 48);
  v25 = v10;
  v26 = v13;
  v31 = *(_BYTE *)(a1 + 64);
  v32 = v7;
  v27 = v14;
  v28 = v5;
  v29 = *(id *)(a1 + 56);
  v15 = v5;
  v16 = v10;
  v17 = v9;
  v18 = v8;
  v19 = v6;
  objc_msgSend(v15, "getAppClipRecordWithBundleID:completion:", v19, v20);

}

void __67__CPSSession_updateClipDataForEntryPointWithWebClip_launchOptions___block_invoke_2(uint64_t a1, void *a2)
{
  CPSAppClipRecord *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  CPSAppClipRecord *v13;
  _QWORD block[4];
  CPSAppClipRecord *v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  __int16 v21;

  v3 = a2;
  if (!v3)
    v3 = -[CPSAppClipRecord initWithBundleID:]([CPSAppClipRecord alloc], "initWithBundleID:", *(_QWORD *)(a1 + 40));
  -[CPSAppClipRecord setFullApplicationName:](v3, "setFullApplicationName:", *(_QWORD *)(a1 + 48));
  -[CPSAppClipRecord setFullApplicationCaption:](v3, "setFullApplicationCaption:", *(_QWORD *)(a1 + 56));
  if (*(_QWORD *)(a1 + 104))
  {
    objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", *(_QWORD *)(a1 + 64), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BDD1838];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), *(_QWORD *)(a1 + 104));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queryItemWithName:value:", CFSTR("minExternalVersionId"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cps_addQueryItem:", v7);

    objc_msgSend(v4, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSAppClipRecord setFullApplicationStoreURL:](v3, "setFullApplicationStoreURL:", v8);

  }
  else
  {
    -[CPSAppClipRecord setFullApplicationStoreURL:](v3, "setFullApplicationStoreURL:", *(_QWORD *)(a1 + 64));
  }
  v9 = *(void **)(a1 + 80);
  v10 = *(NSObject **)(*(_QWORD *)(a1 + 72) + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[2] = __67__CPSSession_updateClipDataForEntryPointWithWebClip_launchOptions___block_invoke_3;
  block[3] = &unk_24C3B9DB0;
  v21 = *(_WORD *)(a1 + 112);
  block[1] = 3221225472;
  v15 = v3;
  v11 = v9;
  v12 = *(_QWORD *)(a1 + 72);
  v16 = v11;
  v17 = v12;
  v18 = *(id *)(a1 + 88);
  v19 = *(id *)(a1 + 32);
  v20 = *(id *)(a1 + 96);
  v13 = v3;
  dispatch_async(v10, block);

}

void __67__CPSSession_updateClipDataForEntryPointWithWebClip_launchOptions___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  if (*(_BYTE *)(a1 + 80))
  {
    if (*(_BYTE *)(a1 + 81))
    {
      objc_msgSend(*(id *)(a1 + 40), "userNotificationGranted");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setUserNotificationGranted:", v2);

    }
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceReferenceDate");
    objc_msgSend(*(id *)(a1 + 32), "setLastProxCardLaunchTime:");

    v4 = *(void **)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "locationConfirmationGranted");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_updateLocationConfirmationForRecord:permissionGranted:", v5, v6);

  }
  v7 = *(_QWORD *)(a1 + 32);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __67__CPSSession_updateClipDataForEntryPointWithWebClip_launchOptions___block_invoke_4;
  v9[3] = &unk_24C3B9D88;
  v8 = *(void **)(a1 + 56);
  v10 = *(id *)(a1 + 64);
  objc_msgSend(v8, "saveAppClipRecord:completion:", v7, v9);
  objc_msgSend(*(id *)(a1 + 48), "_updateEntryPointForWebClip:", *(_QWORD *)(a1 + 72));

}

- (void)_retrieveApplicationIconWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id applicationIconFetchCompletion;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  v5 = v4;
  if (self->_didFetchApplicationIcon)
  {
    (*((void (**)(id, NSURL *))v4 + 2))(v4, self->_applicationIconFileURL);
  }
  else
  {
    v6 = (void *)MEMORY[0x20BD30A54](self->_applicationIconFetchCompletion);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __60__CPSSession__retrieveApplicationIconWithCompletionHandler___block_invoke;
    v10[3] = &unk_24C3B9E28;
    v11 = v5;
    v12 = v6;
    v7 = v6;
    v8 = (void *)MEMORY[0x20BD30A54](v10);
    applicationIconFetchCompletion = self->_applicationIconFetchCompletion;
    self->_applicationIconFetchCompletion = v8;

  }
}

void __60__CPSSession__retrieveApplicationIconWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (id)_retrieveInstalledApplicationIconWithAppIconURL:(id)a3 clipBundleID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  __CFData *v9;
  __CFData *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  CPSImageStore *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v25 = 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v6, 0, &v25);
  v8 = v25;
  if (!v7)
  {
    v15 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = v15;
      objc_msgSend(v8, "cps_privacyPreservingDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478083;
      v27 = v6;
      v28 = 2114;
      v29 = v17;
      _os_log_impl(&dword_20AD44000, v16, OS_LOG_TYPE_INFO, "Unable to find local application record, clip %{private}@ not installed: %{public}@", buf, 0x16u);

    }
    goto LABEL_9;
  }
  v9 = _CPSCreateUnmaskedIconDataForBundle(v6);
  if (!v9)
  {
LABEL_9:
    v14 = 0;
    goto LABEL_17;
  }
  v10 = v9;
  v24 = 0;
  +[CPSImageStore keyForImageURL:error:](CPSImageStore, "keyForImageURL:error:", v5, &v24);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v24;
  if (v12)
  {
    v13 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CPSSession _retrieveInstalledApplicationIconWithAppIconURL:clipBundleID:].cold.2(v13, v12);
    v14 = 0;
  }
  else
  {
    v18 = objc_alloc_init(CPSImageStore);
    v23 = 0;
    -[CPSImageStore storeImageData:forKey:error:](v18, "storeImageData:forKey:error:", v10, v11, &v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v23;

    if (v20)
    {
      v21 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[CPSSession _retrieveInstalledApplicationIconWithAppIconURL:clipBundleID:].cold.1(v21, v20);
      v14 = 0;
    }
    else
    {
      v14 = v19;
    }

  }
LABEL_17:

  return v14;
}

- (void)_retrieveApplicationIconWithAppIconURL:(id)a3 clipBundleID:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;

  v6 = a3;
  -[CPSSession _retrieveInstalledApplicationIconWithAppIconURL:clipBundleID:](self, "_retrieveInstalledApplicationIconWithAppIconURL:clipBundleID:", v6, a4);
  v7 = objc_claimAutoreleasedReturnValue();
  v9 = (id)v7;
  if (v7)
    v8 = (id)v7;
  else
    v8 = v6;
  -[CPSSession _retrieveImageWithURL:didFetchImage:fileURL:fetchCompletion:proxyCompletion:](self, "_retrieveImageWithURL:didFetchImage:fileURL:fetchCompletion:proxyCompletion:", v8, &self->_didFetchApplicationIcon, &self->_applicationIconFileURL, self->_applicationIconFetchCompletion, &__block_literal_global_4);

}

uint64_t __66__CPSSession__retrieveApplicationIconWithAppIconURL_clipBundleID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didRetrieveApplicationIcon:");
}

- (void)_retrieveHeroImageWithHeroImageURL:(id)a3
{
  -[CPSSession _retrieveImageWithURL:didFetchImage:fileURL:fetchCompletion:proxyCompletion:](self, "_retrieveImageWithURL:didFetchImage:fileURL:fetchCompletion:proxyCompletion:", a3, 0, &self->_heroImageFileURL, 0, &__block_literal_global_49_0);
}

uint64_t __49__CPSSession__retrieveHeroImageWithHeroImageURL___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didRetrieveHeroImage:");
}

- (void)_retrieveImageWithURL:(id)a3 didFetchImage:(BOOL *)a4 fileURL:(id *)a5 fetchCompletion:(id)a6 proxyCompletion:(id)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  void (**v18)(_QWORD, _QWORD);
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  void *v25;
  const char *v26;
  CPSImageLoader *imageLoader;
  id v28;
  _QWORD v29[5];
  id v30;
  void (**v31)(_QWORD, _QWORD);
  char v32;
  _QWORD v33[5];
  id v34;
  id v35;
  id *v36;
  BOOL *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  const char *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  if (a4)
    *a4 = 0;
  v15 = MEMORY[0x24BDAC760];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __90__CPSSession__retrieveImageWithURL_didFetchImage_fileURL_fetchCompletion_proxyCompletion___block_invoke;
  v33[3] = &unk_24C3B9E90;
  v33[4] = self;
  v36 = a5;
  v37 = a4;
  v16 = v13;
  v34 = v16;
  v17 = v14;
  v35 = v17;
  v18 = (void (**)(_QWORD, _QWORD))MEMORY[0x20BD30A54](v33);
  if (objc_msgSend(v12, "cps_isFileURL")
    && !-[CPSClipMetadata isDeveloperOverride](self->_metadata, "isDeveloperOverride"))
  {
    ((void (**)(_QWORD, id))v18)[2](v18, v12);
    goto LABEL_16;
  }
  if (v12)
  {
    v19 = (void *)os_transaction_create();
    -[CPSClipMetadata clipHeroImageURL](self->_metadata, "clipHeroImageURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v12, "isEqual:", v20);

    v22 = CPS_LOG_CHANNEL_PREFIXClipServices();
    v23 = os_signpost_enabled(v22);
    if (v21)
    {
      if (v23)
      {
        v24 = v22;
        -[CPSSession logID](self, "logID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = v25;
        v40 = 2082;
        v41 = "[begin] Fetching header image data";
        v26 = "HeaderImage";
LABEL_14:
        _os_signpost_emit_with_name_impl(&dword_20AD44000, v24, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, v26, " ID=[%{public, signpost.description:logID}@]  Message=%{public}s ", buf, 0x16u);

      }
    }
    else if (v23)
    {
      v24 = v22;
      -[CPSSession logID](self, "logID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v25;
      v40 = 2082;
      v41 = "[begin] Fetching application icon data";
      v26 = "AppIcon";
      goto LABEL_14;
    }
    imageLoader = self->_imageLoader;
    v29[0] = v15;
    v29[1] = 3221225472;
    v29[2] = __90__CPSSession__retrieveImageWithURL_didFetchImage_fileURL_fetchCompletion_proxyCompletion___block_invoke_53;
    v29[3] = &unk_24C3B9EE0;
    v29[4] = self;
    v30 = v19;
    v31 = v18;
    v32 = v21;
    v28 = v19;
    -[CPSImageLoader loadImageWithURL:completionHandler:](imageLoader, "loadImageWithURL:completionHandler:", v12, v29);

    goto LABEL_16;
  }
  v18[2](v18, 0);
LABEL_16:

}

void __90__CPSSession__retrieveImageWithURL_didFetchImage_fileURL_fetchCompletion_proxyCompletion___block_invoke(_QWORD *a1, void *a2)
{
  id v4;
  id *v5;
  _BYTE *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = (id *)a1[7];
  if (v5)
    objc_storeStrong(v5, a2);
  v6 = (_BYTE *)a1[8];
  if (v6)
    *v6 = 1;
  v7 = a1[5];
  if (v7)
    (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = *(id *)(a1[4] + 16);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          (*(void (**)(_QWORD))(a1[6] + 16))(a1[6]);
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

void __90__CPSSession__retrieveImageWithURL_didFetchImage_fileURL_fetchCompletion_proxyCompletion___block_invoke_53(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  char v18;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __90__CPSSession__retrieveImageWithURL_didFetchImage_fileURL_fetchCompletion_proxyCompletion___block_invoke_2;
  v12[3] = &unk_24C3B9EB8;
  v17 = *(id *)(a1 + 48);
  v13 = v5;
  v8 = *(id *)(a1 + 40);
  v18 = *(_BYTE *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 32);
  v14 = v8;
  v15 = v9;
  v16 = v6;
  v10 = v6;
  v11 = v5;
  dispatch_async(v7, v12);

}

void __90__CPSSession__retrieveImageWithURL_didFetchImage_fileURL_fetchCompletion_proxyCompletion___block_invoke_2(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  v2 = *(unsigned __int8 *)(a1 + 72);
  v3 = CPS_LOG_CHANNEL_PREFIXClipServices();
  v4 = os_signpost_enabled(v3);
  if (v2)
  {
    if (!v4)
      goto LABEL_7;
    v5 = *(void **)(a1 + 48);
    v6 = v3;
    objc_msgSend(v5, "logID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v7;
    v13 = 2082;
    v14 = "[end] Fetching header image data enableTelemetry=YES ";
    v8 = "HeaderImage";
  }
  else
  {
    if (!v4)
      goto LABEL_7;
    v9 = *(void **)(a1 + 48);
    v6 = v3;
    objc_msgSend(v9, "logID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v7;
    v13 = 2082;
    v14 = "[end] Fetching application icon data enableTelemetry=YES ";
    v8 = "AppIcon";
  }
  _os_signpost_emit_with_name_impl(&dword_20AD44000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, v8, " ID=[%{public, signpost.description:logID}@]  Message=%{public}s ", (uint8_t *)&v11, 0x16u);

LABEL_7:
  if (*(_QWORD *)(a1 + 56))
  {
    v10 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __90__CPSSession__retrieveImageWithURL_didFetchImage_fileURL_fetchCompletion_proxyCompletion___block_invoke_2_cold_1(a1, v10, (id *)(a1 + 56));
  }
}

- (void)_updateEntryPointForWebClip:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  CPSSession *v15;

  v4 = a3;
  v5 = (void *)os_transaction_create();
  +[CPSClipDataSQLiteStore defaultStore](CPSClipDataSQLiteStore, "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __42__CPSSession__updateEntryPointForWebClip___block_invoke;
  v11[3] = &unk_24C3B9F08;
  v12 = v4;
  v13 = v6;
  v14 = v5;
  v15 = self;
  v8 = v5;
  v9 = v6;
  v10 = v4;
  objc_msgSend(v9, "getEntryPointRecordWithWebClipIdentifier:completion:", v7, v11);

}

void __42__CPSSession__updateEntryPointForWebClip___block_invoke(uint64_t a1, void *a2)
{
  CPSClipEntryPointRecord *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v3 = a2;
  if (!v3)
  {
    v3 = objc_alloc_init(CPSClipEntryPointRecord);
    objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSClipEntryPointRecord setWebClipIdentifier:](v3, "setWebClipIdentifier:", v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "applicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSClipEntryPointRecord appClipBundleID](v3, "appClipBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v5);

  -[CPSClipEntryPointRecord setAppClipBundleID:](v3, "setAppClipBundleID:", v5);
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v9 = v8;
  -[CPSClipEntryPointRecord lastABRFetchTime](v3, "lastABRFetchTime");
  if (v9 - v10 >= 604800.0)
    v7 = 0;
  if ((v7 & 1) == 0)
    -[CPSClipEntryPointRecord setLastABRFetchTime:](v3, "setLastABRFetchTime:", v9);
  v11 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __42__CPSSession__updateEntryPointForWebClip___block_invoke_2;
  v19[3] = &unk_24C3B9D88;
  v12 = *(void **)(a1 + 40);
  v20 = *(id *)(a1 + 48);
  objc_msgSend(v12, "saveClipEntryPointRecord:completion:", v3, v19);
  if ((v7 & 1) == 0 && (objc_msgSend(*(id *)(a1 + 56), "registeredForTest") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 56), "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "useLocalContent");

    if ((v14 & 1) == 0)
    {
      v15 = *(void **)(a1 + 56);
      v16[0] = v11;
      v16[1] = 3221225472;
      v16[2] = __42__CPSSession__updateEntryPointForWebClip___block_invoke_3;
      v16[3] = &unk_24C3B9CE8;
      v16[4] = v15;
      v17 = *(id *)(a1 + 32);
      v18 = *(id *)(a1 + 48);
      objc_msgSend(v15, "fetchMetadataWithCompletion:", v16);

    }
  }

}

void __42__CPSSession__updateEntryPointForWebClip___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 8);
  block[2] = __42__CPSSession__updateEntryPointForWebClip___block_invoke_4;
  block[3] = &unk_24C3B9CC0;
  block[1] = 3221225472;
  v13 = v6;
  v14 = v7;
  v15 = v8;
  v16 = v5;
  v17 = *(id *)(a1 + 48);
  v10 = v5;
  v11 = v6;
  dispatch_async(v9, block);

}

uint64_t __42__CPSSession__updateEntryPointForWebClip___block_invoke_4(uint64_t result)
{
  if (!*(_QWORD *)(result + 32))
    return objc_msgSend(*(id *)(result + 40), "_updateWebClipIcon:metadata:", *(_QWORD *)(result + 48), *(_QWORD *)(result + 56));
  return result;
}

- (void)_updateWebClipIcon:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  dispatch_group_t v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  NSObject *v13;
  void (**v14)(_QWORD);
  CPSPromise *businessIconFetchingPromise;
  void *v16;
  NSObject *queue;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD v24[4];
  NSObject *v25;
  void (**v26)(_QWORD);
  _QWORD *v27;
  id v28;
  id location;
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  NSObject *v33;
  _QWORD *v34;
  _QWORD v35[5];
  id v36;

  v6 = a3;
  v7 = a4;
  v8 = dispatch_group_create();
  objc_msgSend(v6, "iconImagePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "fileExistsAtPath:", v9);

  if ((v11 & 1) == 0)
  {
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x3032000000;
    v35[3] = __Block_byref_object_copy__5;
    v35[4] = __Block_byref_object_dispose__5;
    v12 = MEMORY[0x24BDAC760];
    v36 = 0;
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __42__CPSSession__updateWebClipIcon_metadata___block_invoke;
    v32[3] = &unk_24C3B9F58;
    v32[4] = self;
    v13 = v8;
    v33 = v13;
    v34 = v35;
    v14 = (void (**)(_QWORD))MEMORY[0x20BD30A54](v32);
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x3032000000;
    v30[3] = __Block_byref_object_copy__5;
    v30[4] = __Block_byref_object_dispose__5;
    v31 = 0;
    if (objc_msgSend(v7, "isPoweredByThirdParty"))
    {
      if (!self->_businessIconFetchingPromise)
        -[CPSSession _fetchBusinessIconIfNeeded](self, "_fetchBusinessIconIfNeeded");
      dispatch_group_enter(v13);
      objc_initWeak(&location, self);
      businessIconFetchingPromise = self->_businessIconFetchingPromise;
      v24[0] = v12;
      v24[1] = 3221225472;
      v24[2] = __42__CPSSession__updateWebClipIcon_metadata___block_invoke_3;
      v24[3] = &unk_24C3B9FA8;
      objc_copyWeak(&v28, &location);
      v27 = v30;
      v26 = v14;
      v25 = v13;
      -[CPSPromise addCompletionBlock:](businessIconFetchingPromise, "addCompletionBlock:", v24);

      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
    }
    else
    {
      v14[2](v14);
    }
    v16 = (void *)os_transaction_create();
    queue = self->_queue;
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = __42__CPSSession__updateWebClipIcon_metadata___block_invoke_5;
    block[3] = &unk_24C3B9FD0;
    v20 = v16;
    v22 = v30;
    v23 = v35;
    v21 = v6;
    v18 = v16;
    dispatch_group_notify(v13, queue, block);

    _Block_object_dispose(v30, 8);
    _Block_object_dispose(v35, 8);

  }
}

void __42__CPSSession__updateWebClipIcon_metadata___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__CPSSession__updateWebClipIcon_metadata___block_invoke_2;
  v5[3] = &unk_24C3B9F30;
  v4 = *(_OWORD *)(a1 + 40);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(v2, "_retrieveApplicationIconWithCompletionHandler:", v5);

}

void __42__CPSSession__updateWebClipIcon_metadata___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __42__CPSSession__updateWebClipIcon_metadata___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[1];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __42__CPSSession__updateWebClipIcon_metadata___block_invoke_4;
    v7[3] = &unk_24C3B9F80;
    v11 = *(_QWORD *)(a1 + 48);
    v8 = v3;
    v10 = *(id *)(a1 + 40);
    v9 = *(id *)(a1 + 32);
    dispatch_async(v6, v7);

  }
}

void __42__CPSSession__updateWebClipIcon_metadata___block_invoke_4(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __42__CPSSession__updateWebClipIcon_metadata___block_invoke_5(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    v3 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (!v3)
      return;
  }
  +[CPSWebClipStore sharedStore](CPSWebClipStore, "sharedStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__CPSSession__updateWebClipIcon_metadata___block_invoke_6;
  v6[3] = &unk_24C3B9558;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v4, "updateAppClipIcon:forWebClipWithIdentifier:completionHandler:", v3, v5, v6);

}

- (void)installationControllerWillStartInstall:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__CPSSession_installationControllerWillStartInstall___block_invoke;
  block[3] = &unk_24C3B94A8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __53__CPSSession_installationControllerWillStartInstall___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = 0;
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 144);
  *(_QWORD *)(v1 + 144) = &unk_24C3C6250;

}

- (void)installationControllerDidInstallPlaceholder:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__CPSSession_installationControllerDidInstallPlaceholder___block_invoke;
  block[3] = &unk_24C3B94A8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __58__CPSSession_installationControllerDidInstallPlaceholder___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  const char *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = 1;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v6++), "didInstallApplicationPlaceholder", (_QWORD)v11);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
    }
    while (v4);
  }

  v7 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_signpost_enabled(v7))
  {
    v8 = *(void **)(a1 + 32);
    v9 = v7;
    objc_msgSend(v8, "logID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v10;
    v17 = 2082;
    v18 = "[end] Marking Placeholder request enableTelemetry=YES ";
    _os_signpost_emit_with_name_impl(&dword_20AD44000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "OpenButtonBecomeActive", " ID=[%{public, signpost.description:logID}@]  Message=%{public}s ", buf, 0x16u);

  }
}

- (void)installationController:(id)a3 didUpdateProgress:(double)a4
{
  NSObject *queue;
  _QWORD v5[6];

  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __55__CPSSession_installationController_didUpdateProgress___block_invoke;
  v5[3] = &unk_24C3B9928;
  v5[4] = self;
  *(double *)&v5[5] = a4;
  dispatch_async(queue, v5);
}

void __55__CPSSession_installationController_didUpdateProgress___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 144);
  *(_QWORD *)(v3 + 144) = v2;

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "didUpdateInstallProgress:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)installationController:(id)a3 didFinishWithError:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__CPSSession_installationController_didFinishWithError___block_invoke;
  v8[3] = &unk_24C3B94D0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

void __56__CPSSession_installationController_didFinishWithError___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    v3 = objc_msgSend(v2, "cps_isUserCanceledError");
    v4 = 2;
    if (v3)
      v4 = 3;
  }
  else
  {
    v4 = 3;
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = v4;
  +[CPSAnalyticsLogger sharedLogger](CPSAnalyticsLogger, "sharedLogger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "clipBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordDidInstallWithBundleID:succeeded:", v6, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) == 3);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "didFinishLoadingWithError:", *(_QWORD *)(a1 + 40), (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (NSURL)url
{
  return self->_url;
}

- (CPSClipMetadata)metadata
{
  return self->_metadata;
}

- (NSNumber)estimatedProgress
{
  return self->_estimatedProgress;
}

- (CPSAppInfoFetching)appInfoFetcher
{
  return self->_appInfoFetcher;
}

- (void)setAppInfoFetcher:(id)a3
{
  objc_storeStrong((id *)&self->_appInfoFetcher, a3);
}

- (CPSBusinessItemFetching)businessItemFetcher
{
  return self->_businessItemFetcher;
}

- (void)setBusinessItemFetcher:(id)a3
{
  objc_storeStrong((id *)&self->_businessItemFetcher, a3);
}

- (CPSClipLaunchOptions)launchOptions
{
  return self->_launchOptions;
}

- (CPSSessionConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (BOOL)isOpeningWebClipFromDaemon
{
  return self->_openingWebClipFromDaemon;
}

- (void)setOpeningWebClipFromDaemon:(BOOL)a3
{
  self->_openingWebClipFromDaemon = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_launchOptions, 0);
  objc_storeStrong((id *)&self->_businessItemFetcher, 0);
  objc_storeStrong((id *)&self->_appInfoFetcher, 0);
  objc_storeStrong((id *)&self->_estimatedProgress, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_businessIconFetchingPromise, 0);
  objc_storeStrong(&self->_applicationIconFetchCompletion, 0);
  objc_storeStrong(&self->_metadataCompletion, 0);
  objc_storeStrong((id *)&self->_metadataFetchError, 0);
  objc_storeStrong((id *)&self->_businessIconFileURL, 0);
  objc_storeStrong((id *)&self->_heroImageFileURL, 0);
  objc_storeStrong((id *)&self->_applicationIconFileURL, 0);
  objc_storeStrong((id *)&self->_imageLoader, 0);
  objc_storeStrong((id *)&self->_proxyObjects, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __36__CPSSession__fetchBusinessMetadata__block_invoke_2_13_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getCKErrorDomain(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CPSSession.m"), 36, CFSTR("%s"), dlerror());

  __break(1u);
}

void __36__CPSSession__fetchBusinessMetadata__block_invoke_2_13_cold_2(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_2_2(&dword_20AD44000, a2, a3, "-_fetchBusinessMetadata: Calling _didFinishLoadingWithError with CPSErrorNetworkUnavailable. Original error is: %@", (uint8_t *)&v4);
}

void __72__CPSSession__fetchAppMetadataWithBundleID_url_accountInvocationPolicy___block_invoke_2_cold_1(uint64_t a1, void *a2, id *a3)
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "logID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a3, "cps_privacyPreservingDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_20AD44000, v7, v8, "Fail to fetch AppMetadata. ID = [%@] Error: %@", v9, v10, v11, v12, 2u);

  OUTLINED_FUNCTION_5();
}

void __72__CPSSession__fetchAppMetadataWithBundleID_url_accountInvocationPolicy___block_invoke_2_cold_2(uint64_t a1, void *a2, id *a3)
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = *(void **)(*(_QWORD *)a1 + 136);
  v5 = a2;
  objc_msgSend(v4, "clipBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a3, "clipBundleID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_20AD44000, v7, v8, "ABR BundleID: %{private}@ and AMP BundleID: %{private}@ do not match.", v9, v10, v11, v12, 3u);

  OUTLINED_FUNCTION_5();
}

void __40__CPSSession__fetchBusinessIconIfNeeded__block_invoke_25_cold_1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138477827;
  v5 = v3;
  OUTLINED_FUNCTION_2_2(&dword_20AD44000, a2, a3, "Business icon fetching failed: %{private}@", (uint8_t *)&v4);
}

- (void)_retrieveInstalledApplicationIconWithAppIconURL:(void *)a1 clipBundleID:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "cps_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543362;
  v7 = v4;
  OUTLINED_FUNCTION_2_2(&dword_20AD44000, v3, v5, "Unable to write app icon to disk: %{public}@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_1();
}

- (void)_retrieveInstalledApplicationIconWithAppIconURL:(void *)a1 clipBundleID:(void *)a2 .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "cps_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543362;
  v7 = v4;
  OUTLINED_FUNCTION_2_2(&dword_20AD44000, v3, v5, "Unable to get image store key for app icon url: %{public}@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_1();
}

void __90__CPSSession__retrieveImageWithURL_didFetchImage_fileURL_fetchCompletion_proxyCompletion___block_invoke_2_cold_1(uint64_t a1, void *a2, id *a3)
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = *(void **)(a1 + 48);
  v5 = a2;
  objc_msgSend(v4, "logID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a3, "cps_privacyPreservingDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_20AD44000, v7, v8, "Fail to fetch image or icon data. ID = [%{public}@] Error: %{public}@", v9, v10, v11, v12, 2u);

  OUTLINED_FUNCTION_5();
}

@end
