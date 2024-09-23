@implementation CPSAppInfoFetcher

- (CPSAppInfoFetcher)init
{
  CPSAppInfoFetcher *v2;
  NSCache *v3;
  NSCache *appMetadataByBundleID;
  CPSAppInfoFetcher *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CPSAppInfoFetcher;
  v2 = -[CPSAppInfoFetcher init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    appMetadataByBundleID = v2->_appMetadataByBundleID;
    v2->_appMetadataByBundleID = v3;

    -[NSCache setCountLimit:](v2->_appMetadataByBundleID, "setCountLimit:", 10);
    v5 = v2;
  }

  return v2;
}

- (void)lookUpClipMetadataByBundleID:(id)a3 sourceBundleID:(id)a4 downloadIconIfNeeded:(BOOL)a5 skipCaching:(BOOL)a6 completionHandler:(id)a7
{
  -[CPSAppInfoFetcher lookUpClipMetadataByBundleID:sourceBundleID:URL:downloadIconIfNeeded:skipCaching:completionHandler:](self, "lookUpClipMetadataByBundleID:sourceBundleID:URL:downloadIconIfNeeded:skipCaching:completionHandler:", a3, a4, 0, a5, a6, a7);
}

- (void)lookUpClipMetadataByBundleID:(id)a3 sourceBundleID:(id)a4 URL:(id)a5 downloadIconIfNeeded:(BOOL)a6 skipCaching:(BOOL)a7 completionHandler:(id)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  void (**v17)(id, void *, _QWORD);
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  void (**v34)(id, void *, _QWORD);
  id v35;
  BOOL v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v9 = a7;
  v10 = a6;
  v41 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = (void (**)(id, void *, _QWORD))a8;
  if (v14)
  {
    if (objc_msgSend(v14, "cps_looksLikeUUIDOrWebClipIdentifier"))
    {
      v18 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[CPSAppInfoFetcher lookUpClipMetadataByBundleID:sourceBundleID:URL:downloadIconIfNeeded:skipCaching:completionHandler:].cold.1((uint64_t)v15, (uint64_t)v14, v18);
    }
    -[NSCache objectForKey:](self->_appMetadataByBundleID, "objectForKey:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "cps_isAMSPlaceholderBundleIdentifier"))
    {
      v20 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138478083;
        v38 = v14;
        v39 = 2113;
        v40 = v16;
        _os_log_impl(&dword_20AD44000, v20, OS_LOG_TYPE_INFO, "Look up metadata for AMS placeholder bundleID: %{private}@, URL: %{private}@", buf, 0x16u);
      }

      v19 = 0;
    }
    else if (v19)
    {
      objc_msgSend(v19, "amsDictionary");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v23 = objc_msgSend(v19, "isExpired");

        if (((v23 | v9) & 1) == 0)
        {
          objc_msgSend(v19, "amsDictionary");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          +[CPSClipInvocationPolicy invocationPolicyWithAMSDict:](CPSClipInvocationPolicy, "invocationPolicyWithAMSDict:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setInvocationPolicy:", v31);

          if (v10)
            -[CPSAppInfoFetcher _downloadIconIfNeeded:completionHandler:](self, "_downloadIconIfNeeded:completionHandler:", v19, v17);
          else
            v17[2](v17, v19, 0);
LABEL_20:

          goto LABEL_21;
        }
      }
    }
    if (+[CPSClipURL usesDemoMetadata](CPSClipURL, "usesDemoMetadata"))
    {
      -[CPSAppInfoFetcher _lookUpClipDemoAMSMetadataWithBundleID:completion:](self, "_lookUpClipDemoAMSMetadataWithBundleID:completion:", v14, v17);
    }
    else
    {
      v24 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_signpost_enabled(v24))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_20AD44000, v24, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "lookUpClipMetadataAction", "start looking up clip metadata", buf, 2u);
      }
      v25 = objc_alloc(MEMORY[0x24BE080E0]);
      +[CPSAppInfoFetcher _sharedAMSBag](CPSAppInfoFetcher, "_sharedAMSBag");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v25, "initWithClientID:bundleID:URL:bag:", CFSTR("com.apple.ClipServices.clipserviced"), v14, v16, v26);

      if (objc_msgSend(v15, "length"))
      {
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE08328]), "initWithBundleIdentifier:", v15);
        objc_msgSend(v27, "setClientInfo:", v28);

      }
      objc_msgSend(v27, "perform");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)buf, self);
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __120__CPSAppInfoFetcher_lookUpClipMetadataByBundleID_sourceBundleID_URL_downloadIconIfNeeded_skipCaching_completionHandler___block_invoke;
      v32[3] = &unk_24C3BAAD8;
      v34 = v17;
      objc_copyWeak(&v35, (id *)buf);
      v33 = v14;
      v36 = v10;
      objc_msgSend(v29, "addFinishBlock:", v32);

      objc_destroyWeak(&v35);
      objc_destroyWeak((id *)buf);

    }
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "cps_errorWithCode:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *, void *))v17)[2](v17, 0, v21);

LABEL_21:
}

void __120__CPSAppInfoFetcher_lookUpClipMetadataByBundleID_sourceBundleID_URL_downloadIconIfNeeded_skipCaching_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  CPSClipMetadata *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void (*v12)(void);
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  _QWORD *WeakRetained;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  CPSClipMetadata *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_signpost_enabled(v7))
  {
    LOWORD(v37) = 0;
    _os_signpost_emit_with_name_impl(&dword_20AD44000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "lookUpClipMetadataAction", "end looking up clip metadata", (uint8_t *)&v37, 2u);
  }
  v8 = objc_alloc_init(CPSClipMetadata);
  if (v6)
  {
    objc_msgSend(v6, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE07D20]) & 1) != 0)
    {
      v10 = objc_msgSend(v6, "code");

      if (v10 == 405)
      {
        +[CPSClipInvocationPolicy ineligiblePolicyWithReason:](CPSClipInvocationPolicy, "ineligiblePolicyWithReason:", 8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CPSClipMetadata setInvocationPolicy:](v8, "setInvocationPolicy:", v11);

        v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_20:
        v12();
        goto LABEL_24;
      }
    }
    else
    {

    }
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_20;
  }
  objc_msgSend(v5, "responseDataItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[CPSClipMetadata updateWithStoreClipMetadata:](v8, "updateWithStoreClipMetadata:", v14);
    objc_msgSend(v5, "responseHeaders");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "maxAge");
    v17 = v16;

    if (v17 < 10.0)
    {
      v18 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        __120__CPSAppInfoFetcher_lookUpClipMetadataByBundleID_sourceBundleID_URL_downloadIconIfNeeded_skipCaching_completionHandler___block_invoke_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "dateByAddingTimeInterval:", v17);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSClipMetadata setExpirationDate:](v8, "setExpirationDate:", v27);

    v28 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = v28;
      -[CPSClipMetadata expirationDate](v8, "expirationDate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 134218242;
      v38 = v8;
      v39 = 2114;
      v40 = v30;
      _os_log_impl(&dword_20AD44000, v29, OS_LOG_TYPE_INFO, "Set expiration date for metadata: (%p) to: %{public}@", (uint8_t *)&v37, 0x16u);

    }
    +[CPSClipInvocationPolicy invocationPolicyWithAMSDict:](CPSClipInvocationPolicy, "invocationPolicyWithAMSDict:", v14);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSClipMetadata setInvocationPolicy:](v8, "setInvocationPolicy:", v31);

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained && (objc_msgSend(*(id *)(a1 + 32), "cps_isAMSPlaceholderBundleIdentifier") & 1) == 0)
    {
      v33 = (void *)WeakRetained[1];
      -[CPSClipMetadata clipBundleID](v8, "clipBundleID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setObject:forKey:", v8, v34);

    }
    v35 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(a1 + 56))
      objc_msgSend(WeakRetained, "_downloadIconIfNeeded:completionHandler:", v8, v35);
    else
      (*(void (**)(_QWORD, CPSClipMetadata *, _QWORD))(v35 + 16))(*(_QWORD *)(a1 + 40), v8, 0);
  }
  else
  {
    v36 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "cps_errorWithCode:", 1);
    WeakRetained = (_QWORD *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD *))(v36 + 16))(v36, 0, WeakRetained);
  }

LABEL_24:
}

- (void)evictCachedMetadataForClipBundleID:(id)a3
{
  if (a3)
    -[NSCache removeObjectForKey:](self->_appMetadataByBundleID, "removeObjectForKey:");
}

+ (id)_sharedAMSBag
{
  if (_sharedAMSBag_onceToken != -1)
    dispatch_once(&_sharedAMSBag_onceToken, &__block_literal_global_15);
  return (id)_sharedAMSBag_bag;
}

void __34__CPSAppInfoFetcher__sharedAMSBag__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x24BE08060];
  objc_msgSend(MEMORY[0x24BE080E0], "bagKeySet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "registerBagKeySet:forProfile:profileVersion:", v1, CFSTR("clipserviced"), CFSTR("1"));

  objc_msgSend(MEMORY[0x24BE08050], "bagForProfile:profileVersion:", CFSTR("clipserviced"), CFSTR("1"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_sharedAMSBag_bag;
  _sharedAMSBag_bag = v2;

}

+ (id)_cachedIconFileURLForItemID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  id v29;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v4, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, &v29);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v29;

  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[CPSAppInfoFetcher _cachedIconFileURLForItemID:].cold.1((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
    v14 = 0;
  }
  else
  {
    objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.ClipServices/Icons"), 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v16, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v15, 1, 0, &v28);
    v6 = v28;

    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        +[CPSAppInfoFetcher _cachedIconFileURLForItemID:].cold.1((uint64_t)v15, v17, v18, v19, v20, v21, v22, v23);
      v14 = 0;
    }
    else
    {
      v24 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v3, "stringValue");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", CFSTR("%@.png"), v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "URLByAppendingPathComponent:isDirectory:", v26, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v14;
}

- (void)_downloadIconIfNeeded:(id)a3 completionHandler:(id)a4
{
  id v5;
  void (**v6)(id, id, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  void (**v27)(id, id, _QWORD);

  v5 = a3;
  v6 = (void (**)(id, id, _QWORD))a4;
  objc_msgSend(v5, "fullAppIconURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v5, "fullAppCachedIconFilePath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "length")
      || (objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v8),
          (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(v5, "itemID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "_cachedIconFileURLForItemID:", v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v9, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "fileExistsAtPath:", v11);

    if (v13)
    {
      objc_msgSend(v5, "setFullAppCachedIconFilePath:", v11);
      v6[2](v6, v5, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1850], "sharedSession");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __61__CPSAppInfoFetcher__downloadIconIfNeeded_completionHandler___block_invoke;
      v24[3] = &unk_24C3BAB00;
      v27 = v6;
      v25 = v5;
      v26 = v11;
      objc_msgSend(v22, "dataTaskWithURL:completionHandler:", v7, v24);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "resume");
    }

  }
  else
  {
    v14 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CPSAppInfoFetcher _downloadIconIfNeeded:completionHandler:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
    objc_msgSend(MEMORY[0x24BDD1540], "cps_errorWithCode:", 7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, id, void *))v6)[2](v6, v5, v11);
  }

}

void __61__CPSAppInfoFetcher__downloadIconIfNeeded_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void (*v10)(void);
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    if (v7)
    {
      if ((objc_msgSend(v7, "writeToFile:atomically:", *(_QWORD *)(a1 + 40), 1) & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "setFullAppCachedIconFilePath:", *(_QWORD *)(a1 + 40));
        v11 = CPS_LOG_CHANNEL_PREFIXClipServices();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v12 = *(_QWORD *)(a1 + 40);
          v23 = 138739971;
          v24 = v12;
          _os_log_impl(&dword_20AD44000, v11, OS_LOG_TYPE_INFO, "Successful in writing icon data to disk at path: %{sensitive}@", (uint8_t *)&v23, 0xCu);
        }
        v10 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
        goto LABEL_3;
      }
      v13 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __61__CPSAppInfoFetcher__downloadIconIfNeeded_completionHandler___block_invoke_cold_1(a1 + 40, v13, v14, v15, v16, v17, v18, v19);
    }
    v20 = *(_QWORD *)(a1 + 48);
    v21 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "cps_errorWithCode:", 7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v20 + 16))(v20, v21, v22);

    goto LABEL_12;
  }
  v10 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_3:
  v10();
LABEL_12:

}

- (void)_lookUpClipDemoAMSMetadataWithBundleID:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v5 = a3;
  v6 = a4;
  if (+[CPSClipURL usesDemoMetadata](CPSClipURL, "usesDemoMetadata"))
  {
    v7 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("https://test-safari.apple.com/amp/%@/"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "URLByAppendingPathComponent:", CFSTR("/Info.json"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1840]), "initWithURL:cachePolicy:timeoutInterval:", v10, 1, 5.0);
    objc_msgSend(MEMORY[0x24BDD1850], "sharedSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __71__CPSAppInfoFetcher__lookUpClipDemoAMSMetadataWithBundleID_completion___block_invoke;
    v23[3] = &unk_24C3BAB28;
    v24 = v10;
    v25 = v6;
    v13 = v10;
    objc_msgSend(v12, "dataTaskWithRequest:completionHandler:", v11, v23);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "resume");
  }
  else
  {
    v15 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CPSAppInfoFetcher _lookUpClipDemoAMSMetadataWithBundleID:completion:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
    objc_msgSend(MEMORY[0x24BDD1540], "cps_errorWithCode:", 10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v9);
  }

}

void __71__CPSAppInfoFetcher__lookUpClipDemoAMSMetadataWithBundleID_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  CPSClipMetadata *v14;
  void *v15;
  id v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9 || !objc_msgSend(v7, "length"))
  {
    v10 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __71__CPSAppInfoFetcher__lookUpClipDemoAMSMetadataWithBundleID_completion___block_invoke_cold_1();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v16 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 0, &v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v16;
    if (v12)
    {
      v13 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __71__CPSAppInfoFetcher__lookUpClipDemoAMSMetadataWithBundleID_completion___block_invoke_cold_2();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      v14 = objc_alloc_init(CPSClipMetadata);
      -[CPSClipMetadata updateWithStoreClipMetadata:](v14, "updateWithStoreClipMetadata:", v11);
      +[CPSClipInvocationPolicy eligiblePolicy](CPSClipInvocationPolicy, "eligiblePolicy");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPSClipMetadata setInvocationPolicy:](v14, "setInvocationPolicy:", v15);

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appMetadataByBundleID, 0);
}

- (void)lookUpClipMetadataByBundleID:(NSObject *)a3 sourceBundleID:URL:downloadIconIfNeeded:skipCaching:completionHandler:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543619;
  v4 = a1;
  v5 = 2117;
  v6 = a2;
  OUTLINED_FUNCTION_1_0(&dword_20AD44000, a3, (uint64_t)a3, "%{public}@ is attempting to look up app clip metadata with web clip identifier %{sensitive}@. This is not supported.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3_0();
}

void __120__CPSAppInfoFetcher_lookUpClipMetadataByBundleID_sourceBundleID_URL_downloadIconIfNeeded_skipCaching_completionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20AD44000, a1, a3, "AMS media response has a very short max-age [%8.3f sec], the result will be undefined.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_0();
}

+ (void)_cachedIconFileURLForItemID:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20AD44000, MEMORY[0x24BDACB70], a3, "ClipServices: cannot create folder at URL: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3_0();
}

- (void)_downloadIconIfNeeded:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_20AD44000, a1, a3, "Unexpected invalid icon URL from App Store", a5, a6, a7, a8, 0);
}

void __61__CPSAppInfoFetcher__downloadIconIfNeeded_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20AD44000, a2, a3, "Error writing icon data to disk at path: %{sensitive}@", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_3_0();
}

- (void)_lookUpClipDemoAMSMetadataWithBundleID:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_20AD44000, a1, a3, "Error: looking up metadata from demo server but usesDemoMetadata flag is not true.", a5, a6, a7, a8, 0);
}

void __71__CPSAppInfoFetcher__lookUpClipDemoAMSMetadataWithBundleID_completion___block_invoke_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4_2();
  v3 = v0;
  OUTLINED_FUNCTION_1_0(&dword_20AD44000, v1, (uint64_t)v1, "An error occurred when looking up demo metadata from %@, Error: %@", v2);
  OUTLINED_FUNCTION_3_0();
}

void __71__CPSAppInfoFetcher__lookUpClipDemoAMSMetadataWithBundleID_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4_2();
  v3 = 0;
  OUTLINED_FUNCTION_1_0(&dword_20AD44000, v0, v1, "An error occurred when decoding demo metadata from %@, Error: %@", v2);
  OUTLINED_FUNCTION_3_0();
}

@end
