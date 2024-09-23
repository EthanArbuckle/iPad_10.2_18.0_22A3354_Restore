@implementation NPTPerformanceTest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPTPerformanceTest)init
{
  NPTPerformanceTest *v2;
  uint64_t v3;
  OS_nw_activity *performanceTestActivity;
  NPTDownload *v5;
  OS_nw_activity *v6;
  NPTPerformanceTestConfiguration *v7;
  uint64_t v8;
  NPTDownload *download;
  NPTUpload *v10;
  OS_nw_activity *v11;
  NPTPerformanceTestConfiguration *v12;
  uint64_t v13;
  NPTUpload *upload;
  NPTPing *v15;
  NPTPing *ping;
  NPTResults *v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *snapshots;
  void *v20;
  void *v21;
  uint64_t v22;
  NSString *uuid;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)NPTPerformanceTest;
  v2 = -[NPTPerformanceTest init](&v25, sel_init);
  if (v2)
  {
    v3 = nw_activity_create();
    performanceTestActivity = v2->performanceTestActivity;
    v2->performanceTestActivity = (OS_nw_activity *)v3;

    v5 = [NPTDownload alloc];
    v6 = v2->performanceTestActivity;
    v7 = objc_alloc_init(NPTPerformanceTestConfiguration);
    v8 = -[NPTDownload initWithNetworkActivityParent:testConfiguration:](v5, "initWithNetworkActivityParent:testConfiguration:", v6, v7);
    download = v2->download;
    v2->download = (NPTDownload *)v8;

    v10 = [NPTUpload alloc];
    v11 = v2->performanceTestActivity;
    v12 = objc_alloc_init(NPTPerformanceTestConfiguration);
    v13 = -[NPTUpload initWithNetworkActivityParent:testConfiguration:](v10, "initWithNetworkActivityParent:testConfiguration:", v11, v12);
    upload = v2->upload;
    v2->upload = (NPTUpload *)v13;

    v15 = -[NPTPing initWithNetworkActivityParent:]([NPTPing alloc], "initWithNetworkActivityParent:", v2->performanceTestActivity);
    ping = v2->ping;
    v2->ping = v15;

    -[NPTPing setDelegate:](v2->ping, "setDelegate:", v2);
    -[NPTDownload setDelegate:](v2->download, "setDelegate:", v2);
    -[NPTUpload setDelegate:](v2->upload, "setDelegate:", v2);
    v17 = objc_alloc_init(NPTResults);
    -[NPTPerformanceTest setResults:](v2, "setResults:", v17);

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    snapshots = v2->snapshots;
    v2->snapshots = v18;

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "UUIDString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_24C992208);
    v22 = objc_claimAutoreleasedReturnValue();
    uuid = v2->uuid;
    v2->uuid = (NSString *)v22;

    -[NPTPerformanceTest set_additionalMetadata:](v2, "set_additionalMetadata:", 0);
  }
  return v2;
}

- (NPTPerformanceTest)initWithConfiguration:(id)a3
{
  id v4;
  NPTPerformanceTest *v5;
  uint64_t v6;
  OS_nw_activity *performanceTestActivity;
  NPTDownload *v8;
  NPTDownload *download;
  NPTUpload *v10;
  NPTUpload *upload;
  NPTPing *v12;
  OS_nw_activity *v13;
  void *v14;
  uint64_t v15;
  NPTPing *ping;
  NPTResults *v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *snapshots;
  void *v20;
  void *v21;
  uint64_t v22;
  NSString *uuid;
  NSString *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  objc_super v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)NPTPerformanceTest;
  v5 = -[NPTPerformanceTest init](&v29, sel_init);
  if (v5)
  {
    v6 = nw_activity_create();
    performanceTestActivity = v5->performanceTestActivity;
    v5->performanceTestActivity = (OS_nw_activity *)v6;

    v8 = -[NPTDownload initWithNetworkActivityParent:testConfiguration:]([NPTDownload alloc], "initWithNetworkActivityParent:testConfiguration:", v5->performanceTestActivity, v4);
    download = v5->download;
    v5->download = v8;

    v10 = -[NPTUpload initWithNetworkActivityParent:testConfiguration:]([NPTUpload alloc], "initWithNetworkActivityParent:testConfiguration:", v5->performanceTestActivity, v4);
    upload = v5->upload;
    v5->upload = v10;

    v12 = [NPTPing alloc];
    v13 = v5->performanceTestActivity;
    objc_msgSend(v4, "pingHost");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[NPTPing initWithNetworkActivityParent:pingTarget:](v12, "initWithNetworkActivityParent:pingTarget:", v13, v14);
    ping = v5->ping;
    v5->ping = (NPTPing *)v15;

    -[NPTPing setDelegate:](v5->ping, "setDelegate:", v5);
    -[NPTDownload setDelegate:](v5->download, "setDelegate:", v5);
    -[NPTUpload setDelegate:](v5->upload, "setDelegate:", v5);
    v17 = objc_alloc_init(NPTResults);
    -[NPTPerformanceTest setResults:](v5, "setResults:", v17);

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    snapshots = v5->snapshots;
    v5->snapshots = v18;

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "UUIDString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_24C992208);
    v22 = objc_claimAutoreleasedReturnValue();
    uuid = v5->uuid;
    v5->uuid = (NSString *)v22;

    -[NPTPerformanceTest setConfiguration:](v5, "setConfiguration:", v4);
    v24 = v5->uuid;
    -[NPTPerformanceTest configuration](v5, "configuration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setUuid:", v24);

    -[NPTPerformanceTest set_additionalMetadata:](v5, "set_additionalMetadata:", 0);
    if ((objc_msgSend(v4, "legacyMode") & 1) == 0)
      -[NPTPerformanceTest logFrameworkUsage:](v5, "logFrameworkUsage:", 3);
    +[NPTLogger network](NPTLogger, "network");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "description");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v31 = v27;
      _os_log_impl(&dword_20E71B000, v26, OS_LOG_TYPE_DEFAULT, "Configuration settings: %@", buf, 0xCu);

    }
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[NPTPerformanceTest completeActivityWithReason:](self, "completeActivityWithReason:", 1);
  v3.receiver = self;
  v3.super_class = (Class)NPTPerformanceTest;
  -[NPTPerformanceTest dealloc](&v3, sel_dealloc);
}

+ (id)performanceTestWithConfiguration:(id)a3
{
  id v3;
  NPTPerformanceTest *v4;

  v3 = a3;
  v4 = -[NPTPerformanceTest initWithConfiguration:]([NPTPerformanceTest alloc], "initWithConfiguration:", v3);

  return v4;
}

+ (id)performanceTestWithDefaultConfiguration
{
  void *v2;
  void *v3;

  +[NPTPerformanceTestConfiguration defaultConfiguration](NPTPerformanceTestConfiguration, "defaultConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[NPTPerformanceTest performanceTestWithConfiguration:](NPTPerformanceTest, "performanceTestWithConfiguration:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSDictionary)dictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDBCED8];
  -[NPTPerformanceTest metadata](self, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPTPerformanceTest results](self, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v7, CFSTR("results"));

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v8;
}

- (NSDictionary)metadata
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  NSMutableDictionary *restoredMetadata;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *v17;
  void *v18;
  int v19;
  NSMutableDictionary *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  -[NPTMetadataCollector cachedMetadata](self->collector, "cachedMetadata");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[NPTPerformanceTest configuration](self, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "collectMetadata");

    if (v6)
    {
      restoredMetadata = self->restoredMetadata;
      if (!restoredMetadata)
      {
        v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
        v9 = self->restoredMetadata;
        self->restoredMetadata = v8;

        -[NSMutableDictionary setObject:forKeyedSubscript:](self->restoredMetadata, "setObject:forKeyedSubscript:", self->uuid, CFSTR("uuid"));
        restoredMetadata = self->restoredMetadata;
      }
      -[NPTMetadataCollector cachedMetadata](self->collector, "cachedMetadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary addEntriesFromDictionary:](restoredMetadata, "addEntriesFromDictionary:", v10);

      -[NSMutableDictionary objectForKeyedSubscript:](self->restoredMetadata, "objectForKeyedSubscript:", CFSTR("device_states"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](self->snapshots, "objectForKeyedSubscript:", CFSTR("wrmMetrics"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addEntriesFromDictionary:", v12);

      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", self->restoredMetadata);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPTPerformanceTest results](self, "results");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setMetadata:", v13);

    }
  }
  v15 = self->restoredMetadata;
  if (!v15)
  {
    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v17 = self->restoredMetadata;
    self->restoredMetadata = v16;

    -[NPTPerformanceTest configuration](self, "configuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "collectMetadata");

    if (v19)
    {
      v20 = self->restoredMetadata;
      +[NPTMetadataCollector fetch](NPTMetadataCollector, "fetch");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary addEntriesFromDictionary:](v20, "addEntriesFromDictionary:", v21);

      -[NPTPerformanceTest _additionalMetadata](self, "_additionalMetadata");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->restoredMetadata, "objectForKeyedSubscript:", CFSTR("metadata"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPTPerformanceTest _additionalMetadata](self, "_additionalMetadata");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addEntriesFromDictionary:", v24);

        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        -[NPTPerformanceTest _additionalMetadata](self, "_additionalMetadata", 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v40;
          do
          {
            v29 = 0;
            do
            {
              if (*(_QWORD *)v40 != v28)
                objc_enumerationMutation(v25);
              v30 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v29);
              -[NSMutableDictionary objectForKeyedSubscript:](self->restoredMetadata, "objectForKeyedSubscript:", CFSTR("metadata"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "objectForKey:", v30);
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v32)
              {
                -[NPTPerformanceTest _additionalMetadata](self, "_additionalMetadata");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "objectForKeyedSubscript:", v30);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary objectForKeyedSubscript:](self->restoredMetadata, "objectForKeyedSubscript:", CFSTR("metadata"));
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "setObject:forKeyedSubscript:", v34, v30);

              }
              ++v29;
            }
            while (v27 != v29);
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
          }
          while (v27);
        }

      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->restoredMetadata, "setObject:forKeyedSubscript:", self->uuid, CFSTR("uuid"));
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", self->restoredMetadata);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPTPerformanceTest results](self, "results");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setMetadata:", v36);

    v15 = self->restoredMetadata;
  }
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v15);
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)startPingWithCompletion:(id)a3
{
  id v4;
  void *v5;
  int v6;
  _BOOL8 v7;
  _BOOL8 v8;
  NPTPing *ping;
  id v10;

  v4 = a3;
  -[NPTPerformanceTest activateActivity](self, "activateActivity");
  -[NPTPerformanceTest logFrameworkUsage:](self, "logFrameworkUsage:", 0);
  -[NPTPerformanceTest configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "pingAddressStyle");
  v7 = v6 == 0;
  v8 = v6 != 0;

  ping = self->ping;
  -[NPTPerformanceTest configuration](self, "configuration");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[NPTPing startWithNumberOfPings:forcingIPv4:forcingIPv6:completion:](ping, "startWithNumberOfPings:forcingIPv4:forcingIPv6:completion:", objc_msgSend(v10, "pingCount"), v7, v8, v4);

}

- (void)startDownloadWithCompletion:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  int v8;
  void *v9;
  NSMutableDictionary *snapshots;
  NSObject *v11;
  _BOOL4 v12;
  int v13;
  int v14;
  _DWORD v15[2];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[NPTPerformanceTest activateActivity](self, "activateActivity");
  -[NPTPerformanceTest logFrameworkUsage:](self, "logFrameworkUsage:", 1);
  -[NPTPerformanceTest configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "collectMetadata");

  if (v8)
  {
    +[NPTMetadataCollector fetch](NPTMetadataCollector, "fetch");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    snapshots = self->snapshots;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("metadata"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setValue:forKey:](snapshots, "setValue:forKey:", v3, CFSTR("beforeDownloadSnapshot"));

  }
  +[NPTLogger network](NPTLogger, "network");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = -[NPTPerformanceTest inTimedMode](self, "inTimedMode");
    if (v12
      && (-[NPTPerformanceTest configuration](self, "configuration"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "downloadSize") == 1001))
    {
      v13 = 0;
      v14 = 1000;
    }
    else
    {
      -[NPTPerformanceTest configuration](self, "configuration");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v4, "downloadSize");
      v13 = 1;
    }
    v15[0] = 67109120;
    v15[1] = v14;
    _os_log_impl(&dword_20E71B000, v11, OS_LOG_TYPE_DEFAULT, "Will test download speed by downloading %u megabytes from Apple CDN Server", (uint8_t *)v15, 8u);
    if (v13)

    if (v12)
  }

  -[NPTDownload startDownloadWithCompletion:](self->download, "startDownloadWithCompletion:", v6);
}

- (void)startUploadWithCompletion:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  int v8;
  void *v9;
  NSMutableDictionary *snapshots;
  NSObject *v11;
  _BOOL4 v12;
  int v13;
  int v14;
  _DWORD v15[2];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[NPTPerformanceTest activateActivity](self, "activateActivity");
  -[NPTPerformanceTest logFrameworkUsage:](self, "logFrameworkUsage:", 2);
  -[NPTPerformanceTest configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "collectMetadata");

  if (v8)
  {
    +[NPTMetadataCollector fetch](NPTMetadataCollector, "fetch");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    snapshots = self->snapshots;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("metadata"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setValue:forKey:](snapshots, "setValue:forKey:", v3, CFSTR("beforeUploadSnapshot"));

  }
  +[NPTLogger network](NPTLogger, "network");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = -[NPTPerformanceTest inTimedMode](self, "inTimedMode");
    if (v12
      && (-[NPTPerformanceTest configuration](self, "configuration"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "uploadSize") == 1001))
    {
      v13 = 0;
      v14 = 50;
    }
    else
    {
      -[NPTPerformanceTest configuration](self, "configuration");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v4, "uploadSize");
      v13 = 1;
    }
    v15[0] = 67109120;
    v15[1] = v14;
    _os_log_impl(&dword_20E71B000, v11, OS_LOG_TYPE_DEFAULT, "Will test upload speed by uploading %u megabytes to Apple CDN Server", (uint8_t *)v15, 8u);
    if (v13)

    if (v12)
  }

  -[NPTUpload startUploadWithCompletion:](self->upload, "startUploadWithCompletion:", v6);
}

- (void)startTestWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id WeakRetained;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  NPTPerformanceTest *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[NPTLogger network](NPTLogger, "network");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[NPTPerformanceTest configuration](self, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = v7;
    _os_log_impl(&dword_20E71B000, v5, OS_LOG_TYPE_DEFAULT, "Performance test %@ will start", buf, 0xCu);

  }
  -[NPTPerformanceTest activateActivity](self, "activateActivity");
  objc_initWeak((id *)buf, self);
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  WeakRetained = objc_loadWeakRetained((id *)buf);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __46__NPTPerformanceTest_startTestWithCompletion___block_invoke;
  v12[3] = &unk_24C991290;
  v10 = v8;
  v13 = v10;
  objc_copyWeak(&v16, (id *)buf);
  v14 = self;
  v11 = v4;
  v15 = v11;
  objc_msgSend(WeakRetained, "startPingWithCompletion:", v12);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);

}

void __46__NPTPerformanceTest_startTestWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__NPTPerformanceTest_startTestWithCompletion___block_invoke_2;
  v9[3] = &unk_24C991268;
  v10 = *(id *)(a1 + 32);
  objc_copyWeak(&v13, (id *)(a1 + 56));
  v8 = *(void **)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 40);
  v12 = v8;
  objc_msgSend(WeakRetained, "startDownloadWithCompletion:", v9);

  objc_destroyWeak(&v13);
}

void __46__NPTPerformanceTest_startTestWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __46__NPTPerformanceTest_startTestWithCompletion___block_invoke_3;
  v11[3] = &unk_24C991240;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(a1 + 48);
  v12 = v8;
  v13 = v9;
  v14 = v10;
  objc_copyWeak(&v15, (id *)(a1 + 56));
  objc_msgSend(WeakRetained, "startUploadWithCompletion:", v11);

  objc_destroyWeak(&v15);
}

void __46__NPTPerformanceTest_startTestWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id WeakRetained;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if (objc_msgSend(v7, "count"))
    v8 = 3;
  else
    v8 = 2;
  objc_msgSend(*(id *)(a1 + 40), "completeActivityWithReason:", v8);
  +[NPTLogger network](NPTLogger, "network");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v11;
    _os_log_impl(&dword_20E71B000, v9, OS_LOG_TYPE_DEFAULT, "Performance test %@ has finished", (uint8_t *)&v15, 0xCu);

  }
  v12 = *(_QWORD *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "results");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v12 + 16))(v12, v14, v7);

}

- (void)save
{
  OUTLINED_FUNCTION_0_1(&dword_20E71B000, a1, a3, "Save was called without collecting metadata. Will ignore save call.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

uint64_t __26__NPTPerformanceTest_save__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "getFlattenedDictionary");
}

- (void)saveToAWD
{
  OUTLINED_FUNCTION_0_1(&dword_20E71B000, a1, a3, "saveToAWD was called", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (id)fetchAWDMetric
{
  void *v2;
  void *v3;

  -[NPTPerformanceTest getFlattenedDictionary](self, "getFlattenedDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AWDNetworkPerformanceMetricInitializer createPerformanceMetricFromDictionary:](AWDNetworkPerformanceMetricInitializer, "createPerformanceMetricFromDictionary:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)activateActivity
{
  NSObject *v2;
  uint8_t v3[16];

  if ((nw_activity_is_activated() & 1) == 0)
  {
    +[NPTLogger network](NPTLogger, "network");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_20E71B000, v2, OS_LOG_TYPE_DEFAULT, "Activating performanceTestActivity", v3, 2u);
    }

    nw_activity_activate();
  }
}

- (void)completeActivityWithReason:(int)a3
{
  NSObject *v4;
  OS_nw_activity *performanceTestActivity;
  uint8_t v6[16];

  if (self->performanceTestActivity && nw_activity_is_activated())
  {
    +[NPTLogger network](NPTLogger, "network");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_20E71B000, v4, OS_LOG_TYPE_DEFAULT, "Completing performanceTestActivity", v6, 2u);
    }

    nw_activity_complete_with_reason();
    performanceTestActivity = self->performanceTestActivity;
    self->performanceTestActivity = 0;

  }
}

- (id)timestampMasked
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x24BDBCE60]);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components:fromDate:", 62, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMinute:", 0);
  objc_msgSend(v4, "setSecond:", 0);
  objc_msgSend(v3, "dateFromComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)convertDateToISO8601String:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BDD15D0];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeZone:", v6);

  objc_msgSend(v5, "stringForObjectValue:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)timestampMaskedString
{
  void *v3;
  void *v4;

  -[NPTPerformanceTest timestampMasked](self, "timestampMasked");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTPerformanceTest convertDateToISO8601String:](self, "convertDateToISO8601String:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)getFlattenedMetadataDictionary:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("device_states"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8);
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("device_states"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("initial_state"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addEntriesFromDictionary:", v12);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v4;
}

- (id)getFlattenedDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  id v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  BOOL v51;
  double v52;
  void *v53;
  void *v54;
  double v55;
  void *v56;
  double v57;
  void *v58;
  void *v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t m;
  uint64_t v78;
  void *v79;
  void *v80;
  id *p_isa;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  int v98;
  void *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v136;
  void *v137;
  char v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  NPTPerformanceTest *v145;
  void *v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  _BYTE v163[128];
  _BYTE v164[128];
  _BYTE v165[128];
  _BYTE v166[128];
  uint64_t v167;

  v167 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[NPTMetadataCollector cachedMetadata](self->collector, "cachedMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NPTPerformanceTest metadata](self, "metadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPTPerformanceTest getFlattenedMetadataDictionary:](self, "getFlattenedMetadataDictionary:", v5);
  }
  else
  {
    -[NPTPerformanceTest dictionary](self, "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", CFSTR("metadata"));
  }
  v144 = (void *)objc_claimAutoreleasedReturnValue();

  v145 = self;
  -[NPTPerformanceTest dictionary](self, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("results"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "valueForKey:", CFSTR("download_results"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", CFSTR("upload_results"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", CFSTR("ping_results"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = v7;
  objc_msgSend(v7, "valueForKey:", CFSTR("network_quality_results"));
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.wifiqa.NPTKit"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "infoDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("CFBundleShortVersionString"));
  v143 = (void *)objc_claimAutoreleasedReturnValue();

  v161 = 0u;
  v162 = 0u;
  v159 = 0u;
  v160 = 0u;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v159, v166, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v160;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v160 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v159 + 1) + 8 * i);
        objc_msgSend(v13, "valueForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          objc_msgSend(CFSTR("download_"), "stringByAppendingString:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v19, v20);

        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v159, v166, 16);
    }
    while (v15);
  }

  v157 = 0u;
  v158 = 0u;
  v155 = 0u;
  v156 = 0u;
  v21 = v9;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v155, v165, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v156;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v156 != v24)
          objc_enumerationMutation(v21);
        v26 = *(_QWORD *)(*((_QWORD *)&v155 + 1) + 8 * j);
        objc_msgSend(v21, "valueForKey:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          objc_msgSend(CFSTR("upload_"), "stringByAppendingString:", v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v27, v28);

        }
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v155, v165, 16);
    }
    while (v23);
  }

  v153 = 0u;
  v154 = 0u;
  v151 = 0u;
  v152 = 0u;
  v29 = v10;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v151, v164, 16);
  v146 = v29;
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v152;
    do
    {
      for (k = 0; k != v31; ++k)
      {
        if (*(_QWORD *)v152 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v151 + 1) + 8 * k);
        if ((objc_msgSend(v34, "isEqual:", CFSTR("pings")) & 1) == 0)
        {
          objc_msgSend(v29, "valueForKey:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (v35)
          {
            objc_msgSend(CFSTR("ping_"), "stringByAppendingString:", v34);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKey:", v35, v36);

          }
          v29 = v146;
        }
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v151, v164, 16);
    }
    while (v31);
  }

  v37 = v141;
  if (!objc_msgSend(v141, "count"))
  {
    -[NPTPerformanceTest configuration](v145, "configuration");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "legacyMode");

    if ((v39 & 1) == 0)
    {
      v40 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("responsiveness"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0.0;
      v43 = 0.0;
      if (v41)
      {
        objc_msgSend(v13, "objectForKey:", CFSTR("responsiveness"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "doubleValue");
        v43 = v45;

      }
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("responsiveness"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (v46)
      {
        objc_msgSend(v21, "objectForKey:", CFSTR("responsiveness"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "doubleValue");
        v42 = v48;

      }
      v49 = v43 + v42;
      v51 = v42 <= 0.0;
      v50 = 0.0;
      v51 = v51 || v43 <= 0.0;
      if (v51)
        v52 = v49;
      else
        v52 = v49 * 0.5;
      -[NPTPerformanceTest NQRatingFromEnum:](v145, "NQRatingFromEnum:", objc_msgSend(MEMORY[0x24BEDCC00], "ratingForResponsivenessScore:", (uint64_t)v52));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setObject:forKeyedSubscript:", v53, CFSTR("rating"));

      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("speed"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = 0.0;
      if (v54)
      {
        objc_msgSend(v13, "objectForKey:", CFSTR("speed"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "doubleValue");
        v55 = v57;

      }
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("speed"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if (v58)
      {
        objc_msgSend(v21, "objectForKey:", CFSTR("speed"));
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "doubleValue");
        v50 = v60;

      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v52);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setObject:forKeyedSubscript:", v61, CFSTR("responsiveness"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v55);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setObject:forKeyedSubscript:", v62, CFSTR("download_speed"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v50);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setObject:forKeyedSubscript:", v63, CFSTR("upload_speed"));

      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("error"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      if (v64)
      {
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("error"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setObject:forKeyedSubscript:", v65, CFSTR("error"));

        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("error_domain"));
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setObject:forKeyedSubscript:", v66, CFSTR("error_domain"));

        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("error_code"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setObject:forKeyedSubscript:", v67, CFSTR("error_code"));

      }
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("error"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      if (v68)
      {
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("error"));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setObject:forKeyedSubscript:", v69, CFSTR("error"));

        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("error_domain"));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setObject:forKeyedSubscript:", v70, CFSTR("error_domain"));

        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("error_code"));
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setObject:forKeyedSubscript:", v71, CFSTR("error_code"));

      }
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v40);
      v72 = objc_claimAutoreleasedReturnValue();

      v37 = (void *)v72;
    }
  }
  v149 = 0u;
  v150 = 0u;
  v147 = 0u;
  v148 = 0u;
  v73 = v37;
  v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v147, v163, 16);
  if (v74)
  {
    v75 = v74;
    v76 = *(_QWORD *)v148;
    do
    {
      for (m = 0; m != v75; ++m)
      {
        if (*(_QWORD *)v148 != v76)
          objc_enumerationMutation(v73);
        v78 = *(_QWORD *)(*((_QWORD *)&v147 + 1) + 8 * m);
        objc_msgSend(v73, "valueForKey:", v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        if (v79)
        {
          objc_msgSend(CFSTR("network_quality_"), "stringByAppendingString:", v78);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v79, v80);

        }
      }
      v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v147, v163, 16);
    }
    while (v75);
  }

  objc_msgSend(v3, "addEntriesFromDictionary:", v144);
  p_isa = (id *)&v145->super.isa;
  objc_msgSend(v3, "setValue:forKey:", v145->uuid, CFSTR("npt_uuid"));
  v82 = (void *)MEMORY[0x24BDD16E0];
  -[NPTPerformanceTest configuration](v145, "configuration");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "numberWithBool:", objc_msgSend(v83, "interfaceType") == 1);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v84, CFSTR("use_wifi_was_specified"));

  objc_msgSend(v3, "setValue:forKey:", v143, CFSTR("nptkit_framework_version"));
  -[NPTPerformanceTest configuration](v145, "configuration");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "clientName");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v86, CFSTR("calling_client"));

  v87 = (void *)MEMORY[0x24BDD16E0];
  -[NPTPerformanceTest configuration](v145, "configuration");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "numberWithBool:", objc_msgSend(v88, "legacyMode"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v89, CFSTR("legacy_mode"));

  v90 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", &unk_24C9A7CF0);
  -[NPTPerformanceTest results](v145, "results");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "downloadResults");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "isCellular");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = (void *)v90;
  if (objc_msgSend(v93, "BOOLValue"))
  {

  }
  else
  {
    -[NPTPerformanceTest results](v145, "results");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "uploadResults");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "isCellular");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = objc_msgSend(v96, "BOOLValue");

    p_isa = (id *)&v145->super.isa;
    v90 = (uint64_t)v142;

    if ((v138 & 1) == 0)
      objc_msgSend(v142, "addObject:", CFSTR("cellular_cellid"));
  }
  objc_msgSend(v3, "removeObjectsForKeys:", v90);
  if (p_isa[7]
    && (objc_msgSend(p_isa, "configuration"),
        v97 = (void *)objc_claimAutoreleasedReturnValue(),
        v98 = objc_msgSend(v97, "collectMetadata"),
        v97,
        v98))
  {
    objc_msgSend(p_isa[7], "objectForKeyedSubscript:", CFSTR("beforeDownloadSnapshot"));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    if (v99)
    {
      objc_msgSend(p_isa[7], "objectForKeyedSubscript:", CFSTR("afterDownloadSnapshot"));
      v100 = (void *)objc_claimAutoreleasedReturnValue();

      if (v100)
      {
        objc_msgSend(p_isa[7], "valueForKey:", CFSTR("beforeDownloadSnapshot"));
        v101 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(p_isa[7], "valueForKey:", CFSTR("afterDownloadSnapshot"));
        v99 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v101 = 0;
        v99 = 0;
      }
    }
    else
    {
      v101 = 0;
    }
    objc_msgSend(p_isa[7], "objectForKeyedSubscript:", CFSTR("beforeUploadSnapshot"));
    v104 = objc_claimAutoreleasedReturnValue();
    if (v104
      && (v105 = (void *)v104,
          objc_msgSend(p_isa[7], "objectForKeyedSubscript:", CFSTR("afterUploadSnapshot")),
          v106 = (void *)objc_claimAutoreleasedReturnValue(),
          v106,
          v105,
          v106))
    {
      objc_msgSend(p_isa[7], "valueForKey:", CFSTR("beforeUploadSnapshot"));
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_isa[7], "valueForKey:", CFSTR("afterUploadSnapshot"));
      v137 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v137 = 0;
      v139 = 0;
    }
    v102 = (void *)v101;
    v103 = v99;
  }
  else
  {
    v102 = 0;
    v103 = 0;
    v137 = 0;
    v139 = 0;
  }
  -[NPTMetadataCollector cachedMetadata](v145->collector, "cachedMetadata");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("device_states"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "objectForKeyedSubscript:", CFSTR("cellular"));
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  +[NPTCellularCollector calculateMaxCellularTPutEstimates:](NPTCellularCollector, "calculateMaxCellularTPutEstimates:", v109);
  v110 = (void *)objc_claimAutoreleasedReturnValue();

  v136 = v110;
  objc_msgSend(v110, "objectForKeyedSubscript:", CFSTR("cellular_max_download_estimate"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v111, CFSTR("download_max_cellular_estimate"));

  objc_msgSend(v110, "objectForKeyedSubscript:", CFSTR("cellular_max_upload_estimate"));
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v112, CFSTR("upload_max_cellular_estimate"));

  objc_msgSend(v102, "objectForKeyedSubscript:", CFSTR("cellular_radio_access_technology"));
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v113, CFSTR("download_start_rat"));

  objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("cellular_radio_access_technology"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v114, CFSTR("download_end_rat"));

  objc_msgSend(v102, "objectForKeyedSubscript:", CFSTR("network_primary_ipv4_interface_name"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v115, CFSTR("download_start_primary_ipv4_interface"));

  objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("network_primary_ipv4_interface_name"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v116, CFSTR("download_end_primary_ipv4_interface"));

  objc_msgSend(v102, "objectForKeyedSubscript:", CFSTR("cellular_data_bearer_technology"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v117, CFSTR("download_start_data_bearer_technology"));

  objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("cellular_data_bearer_technology"));
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v118, CFSTR("download_end_data_bearer_technology"));

  objc_msgSend(v102, "objectForKeyedSubscript:", CFSTR("cellular_radio_frequency"));
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v119, CFSTR("download_start_radio_frequency"));

  objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("cellular_radio_frequency"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v120, CFSTR("download_end_radio_frequency"));

  objc_msgSend(v102, "objectForKeyedSubscript:", CFSTR("cellular_download_estimate"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v121, CFSTR("download_start_cellular_estimate"));

  objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("cellular_download_estimate"));
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v122, CFSTR("download_end_cellular_estimate"));

  objc_msgSend(v139, "objectForKeyedSubscript:", CFSTR("cellular_radio_access_technology"));
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v123, CFSTR("upload_start_rat"));

  objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("cellular_radio_access_technology"));
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v124, CFSTR("upload_end_rat"));

  objc_msgSend(v139, "objectForKeyedSubscript:", CFSTR("network_primary_ipv4_interface_name"));
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v125, CFSTR("upload_start_primary_ipv4_interface"));

  objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("network_primary_ipv4_interface_name"));
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v126, CFSTR("upload_end_primary_ipv4_interface"));

  objc_msgSend(v139, "objectForKeyedSubscript:", CFSTR("cellular_data_bearer_technology"));
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v127, CFSTR("upload_start_data_bearer_technology"));

  objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("cellular_data_bearer_technology"));
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v128, CFSTR("upload_end_data_bearer_technology"));

  objc_msgSend(v139, "objectForKeyedSubscript:", CFSTR("cellular_radio_frequency"));
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v129, CFSTR("upload_start_radio_frequency"));

  objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("cellular_radio_frequency"));
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v130, CFSTR("upload_end_radio_frequency"));

  objc_msgSend(v139, "objectForKeyedSubscript:", CFSTR("cellular_upload_estimate"));
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v131, CFSTR("upload_start_cellular_estimate"));

  objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("cellular_upload_estimate"));
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v132, CFSTR("upload_end_cellular_estimate"));

  -[NPTPerformanceTest timestampMaskedString](v145, "timestampMaskedString");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v133, CFSTR("performance_test_start_time"));

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v3);
  v134 = (void *)objc_claimAutoreleasedReturnValue();

  return v134;
}

- (id)getTransformedDataForCoreAnalytics
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[NPTPerformanceTest getDataForCoreAnalytics](self, "getDataForCoreAnalytics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24C9A7D08);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24C9A7D20);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = v2;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          if ((objc_msgSend(v10, "containsString:", CFSTR("_speed")) & 1) != 0
            || objc_msgSend(v10, "containsString:", CFSTR("_estimate")))
          {
            objc_msgSend(v5, "objectForKeyedSubscript:", v10);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "doubleValue");
            v15 = v14;

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v15 * 125000.0);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, v10);

          }
          if ((objc_msgSend(v10, "containsString:", CFSTR("_time")) & 1) != 0
            || objc_msgSend(v25, "containsObject:", v10))
          {
            objc_msgSend(v5, "objectForKeyedSubscript:", v10);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "doubleValue");
            v19 = v18;

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v19 * 1000.0);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, v10);

          }
          if (objc_msgSend(v4, "containsObject:", v10))
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_histogram"), v10);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "objectForKeyedSubscript:", v10);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, v21);

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (void)cancelAllNetworking
{
  -[NPTPing cancel](self->ping, "cancel");
  -[NPTDownload cancel](self->download, "cancel");
  -[NPTUpload cancel](self->upload, "cancel");
  -[NPTPerformanceTest completeActivityWithReason:](self, "completeActivityWithReason:", 4);
}

- (BOOL)inTimedMode
{
  void *v3;
  void *v4;
  int v5;

  -[NPTPerformanceTest configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "testDuration"))
  {
    -[NPTPerformanceTest configuration](self, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "stopAtFileSize") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)NQRatingFromEnum:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return CFSTR("No Rating");
  else
    return off_24C991328[a3];
}

- (void)fetchAndSaveWRMMetrics
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  NSMutableDictionary *snapshots;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSMutableDictionary *restoredMetadata;
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  +[NPTMetadataCollector fetchWRMMetrics](NPTMetadataCollector, "fetchWRMMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v5 = objc_alloc_init(MEMORY[0x24BDBCE30]);
  v14[0] = CFSTR("initial_state");
  v14[1] = CFSTR("events");
  v15[0] = v3;
  v15[1] = v5;
  v14[2] = CFSTR("errors");
  v15[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("wrm"));

  snapshots = self->snapshots;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setValue:forKey:](snapshots, "setValue:forKey:", v8, CFSTR("wrmMetrics"));

  -[NPTMetadataCollector cachedMetadata](self->collector, "cachedMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[NPTPerformanceTest metadata](self, "metadata");
  if (!v9)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->restoredMetadata, "objectForKeyedSubscript:", CFSTR("metadata"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addEntriesFromDictionary:", v3);

    restoredMetadata = self->restoredMetadata;
    -[NPTPerformanceTest results](self, "results");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMetadata:", restoredMetadata);

  }
}

- (void)logFrameworkUsage:(int)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = *(_QWORD *)&a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("feature"));

  -[NPTPerformanceTest configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NPTPerformanceTest configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "asDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addEntriesFromDictionary:", v9);

  }
  if (objc_msgSend(v5, "count"))
  {
    v10 = v5;
    AnalyticsSendEventLazy();

  }
}

id __40__NPTPerformanceTest_logFrameworkUsage___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)pingDidFinishWithResults:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[NPTPerformanceTest results](self, "results");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPingResults:", v8);

  -[NPTPerformanceTest delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[NPTPerformanceTest delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "performanceTest:didFinishWithPingResults:", self, v8);

  }
}

- (void)pingWillStartPinging
{
  void *v3;
  char v4;
  id v5;

  -[NPTPerformanceTest delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[NPTPerformanceTest delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "performanceTestWillStartPing");

  }
}

- (void)pingDidFinishWithError:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[NPTPing results](self->ping, "results");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTPerformanceTest results](self, "results");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "setPingResults:", v4);

  -[NPTPerformanceTest delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[NPTPerformanceTest delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "performanceTest:didFinishPingWithError:", self, v8);

  }
}

- (void)download:(id)a3 didFinishWithResults:(id)a4
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSMutableDictionary *snapshots;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;

  v16 = a4;
  -[NPTPerformanceTest results](self, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDownloadResults:", v16);

  -[NPTPerformanceTest configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "collectMetadata");

  if (v7)
  {
    +[NPTMetadataCollector fetch](NPTMetadataCollector, "fetch");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    snapshots = self->snapshots;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("metadata"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setValue:forKey:](snapshots, "setValue:forKey:", v10, CFSTR("afterDownloadSnapshot"));

    -[NPTPerformanceTest configuration](self, "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "collectWRMMetrics") & 1) != 0)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->snapshots, "objectForKeyedSubscript:", CFSTR("wrmMetrics"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
        -[NPTPerformanceTest fetchAndSaveWRMMetrics](self, "fetchAndSaveWRMMetrics");
    }
    else
    {

    }
  }
  -[NPTPerformanceTest delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[NPTPerformanceTest delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "performanceTest:didFinishWithDownloadResults:", self, v16);

  }
}

- (void)downloadWillStart
{
  void *v3;
  char v4;
  id v5;

  -[NPTPerformanceTest delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[NPTPerformanceTest delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "performanceTestWillStartDownload");

  }
}

- (void)download:(id)a3 didReceiveSpeedMetric:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[NPTPerformanceTest delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[NPTPerformanceTest delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "performanceTest:didReceiveDownloadSpeedMetric:", self, v8);

  }
}

- (void)download:(id)a3 didFinishWithError:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  objc_msgSend(a3, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTPerformanceTest results](self, "results");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v7, "setDownloadResults:", v6);

  -[NPTPerformanceTest delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[NPTPerformanceTest delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "performanceTest:didFinishDownloadWithError:", self, v10);

  }
}

- (void)upload:(id)a3 didFinishWithResults:(id)a4
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSMutableDictionary *snapshots;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;

  v16 = a4;
  -[NPTPerformanceTest results](self, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUploadResults:", v16);

  -[NPTPerformanceTest configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "collectMetadata");

  if (v7)
  {
    +[NPTMetadataCollector fetch](NPTMetadataCollector, "fetch");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    snapshots = self->snapshots;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("metadata"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setValue:forKey:](snapshots, "setValue:forKey:", v10, CFSTR("afterUploadSnapshot"));

    -[NPTPerformanceTest configuration](self, "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "collectWRMMetrics") & 1) != 0)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->snapshots, "objectForKeyedSubscript:", CFSTR("wrmMetrics"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
        -[NPTPerformanceTest fetchAndSaveWRMMetrics](self, "fetchAndSaveWRMMetrics");
    }
    else
    {

    }
  }
  -[NPTPerformanceTest delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[NPTPerformanceTest delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "performanceTest:didFinishWithUploadResults:", self, v16);

  }
}

- (void)uploadWillStart
{
  void *v3;
  char v4;
  id v5;

  -[NPTPerformanceTest delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[NPTPerformanceTest delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "performanceTestWillStartUpload");

  }
}

- (void)upload:(id)a3 didReceiveSpeedMetric:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[NPTPerformanceTest delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[NPTPerformanceTest delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "performanceTest:didReceiveUploadSpeedMetric:", self, v8);

  }
}

- (void)upload:(id)a3 didFinishWithError:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  objc_msgSend(a3, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTPerformanceTest results](self, "results");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v7, "setUploadResults:", v6);

  -[NPTPerformanceTest delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[NPTPerformanceTest delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "performanceTest:didFinishUploadWithError:", self, v10);

  }
}

- (void)encodeWithCoder:(id)a3
{
  NPTDownload *download;
  void *v5;
  void *v6;
  id v7;

  download = self->download;
  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", download, CFSTR("download"));
  objc_msgSend(v7, "encodeObject:forKey:", self->upload, CFSTR("upload"));
  objc_msgSend(v7, "encodeObject:forKey:", self->ping, CFSTR("ping"));
  -[NPTPerformanceTest metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("metadata"));

  -[NPTPerformanceTest results](self, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("results"));

  objc_msgSend(v7, "encodeObject:forKey:", self->uuid, CFSTR("npt_uuid"));
}

- (NPTPerformanceTest)initWithCoder:(id)a3
{
  id v3;
  NPTPerformanceTest *v4;
  uint64_t v5;
  NPTDownload *download;
  uint64_t v7;
  NPTUpload *upload;
  uint64_t v9;
  NPTPing *ping;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSMutableDictionary *restoredMetadata;
  void *v16;
  uint64_t v17;
  NSString *uuid;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)NPTPerformanceTest;
  v3 = a3;
  v4 = -[NPTPerformanceTest init](&v20, sel_init);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("download"));
  v5 = objc_claimAutoreleasedReturnValue();
  download = v4->download;
  v4->download = (NPTDownload *)v5;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("upload"));
  v7 = objc_claimAutoreleasedReturnValue();
  upload = v4->upload;
  v4->upload = (NPTUpload *)v7;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ping"));
  v9 = objc_claimAutoreleasedReturnValue();
  ping = v4->ping;
  v4->ping = (NPTPing *)v9;

  v11 = (void *)MEMORY[0x24BDBCF20];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0, v20.receiver, v20.super_class);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v13, CFSTR("metadata"));
  v14 = objc_claimAutoreleasedReturnValue();
  restoredMetadata = v4->restoredMetadata;
  v4->restoredMetadata = (NSMutableDictionary *)v14;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("results"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTPerformanceTest setResults:](v4, "setResults:", v16);

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("npt_uuid"));
  v17 = objc_claimAutoreleasedReturnValue();

  uuid = v4->uuid;
  v4->uuid = (NSString *)v17;

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  NPTPerformanceTest *v6;
  NPTPerformanceTest *v7;
  void *v8;
  NPTPerformanceTest *v9;
  void *v10;

  -[NPTPerformanceTest configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = +[NPTPerformanceTest allocWithZone:](NPTPerformanceTest, "allocWithZone:", a3);
  v7 = v6;
  if (!v5)
    return -[NPTPerformanceTest init](v6, "init");
  -[NPTPerformanceTest configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NPTPerformanceTest initWithConfiguration:](v7, "initWithConfiguration:", v8);

  -[NPTPerformanceTest configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTPerformanceTest setConfiguration:](v9, "setConfiguration:", v10);

  return v9;
}

- (id)collectorsWithoutCDNDebug
{
  NPTMetadataCollector *v2;
  void *v3;
  NPTMetadataCollector *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = [NPTMetadataCollector alloc];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v6, 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NPTMetadataCollector initWithCollectorTypes:](v2, "initWithCollectorTypes:", v3, v6, v7, v8, v9, v10, v11);

  return v4;
}

- (void)startMetadataCollectionWithCompletion:(id)a3
{
  id v4;
  NPTMetadataCollector *v5;
  NPTMetadataCollector *collector;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NPTMetadataCollector *v14;
  NPTMetadataCollector *v15;
  void *v16;
  NPTMetadataCollector *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(NPTMetadataCollector);
  collector = self->collector;
  self->collector = v5;

  -[NPTPerformanceTest configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "downloadURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "containsString:", CFSTR("npt.cdn-apple.com")))
  {

LABEL_5:
    goto LABEL_6;
  }
  -[NPTPerformanceTest configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uploadURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "absoluteString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsString:", CFSTR("npt.cdn-apple.com"));

  if ((v13 & 1) == 0)
  {
    -[NPTPerformanceTest collectorsWithoutCDNDebug](self, "collectorsWithoutCDNDebug");
    v14 = (NPTMetadataCollector *)objc_claimAutoreleasedReturnValue();
    v7 = self->collector;
    self->collector = v14;
    goto LABEL_5;
  }
LABEL_6:
  v15 = self->collector;
  -[NPTPerformanceTest metadataDidChangeHandler](self, "metadataDidChangeHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetadataCollector setMetadataDidChangeHandler:](v15, "setMetadataDidChangeHandler:", v16);

  objc_initWeak(&location, self);
  v17 = self->collector;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __60__NPTPerformanceTest_startMetadataCollectionWithCompletion___block_invoke;
  v19[3] = &unk_24C9912E0;
  objc_copyWeak(&v21, &location);
  v18 = v4;
  v20 = v18;
  -[NPTMetadataCollector startCollectingWithCompletion:](v17, "startCollectingWithCompletion:", v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __60__NPTPerformanceTest_startMetadataCollectionWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v5, v7);

}

- (void)stopMetadataCollection
{
  -[NPTMetadataCollector stopCollecting](self->collector, "stopCollecting");
}

- (void)setMetadataDidChangeHandler:(id)a3
{
  id v4;
  NPTMetadataCollector *collector;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  -[NPTPerformanceTest set_metadataDidChangeHandler:](self, "set_metadataDidChangeHandler:", v4);
  if (self->collector)
  {
    objc_initWeak(&location, self);
    collector = self->collector;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __50__NPTPerformanceTest_setMetadataDidChangeHandler___block_invoke;
    v6[3] = &unk_24C991308;
    objc_copyWeak(&v8, &location);
    v7 = v4;
    -[NPTMetadataCollector setMetadataDidChangeHandler:](collector, "setMetadataDidChangeHandler:", v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

void __50__NPTPerformanceTest_setMetadataDidChangeHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = (id)objc_msgSend(WeakRetained, "metadata");
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);

}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (NPTPerformanceTestConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (NPTResults)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (NSDictionary)_additionalMetadata
{
  return self->__additionalMetadata;
}

- (void)set_additionalMetadata:(id)a3
{
  objc_storeStrong((id *)&self->__additionalMetadata, a3);
}

- (void)setInTimedMode:(BOOL)a3
{
  self->_inTimedMode = a3;
}

- (id)_metadataDidChangeHandler
{
  return self->__metadataDidChangeHandler;
}

- (void)set_metadataDidChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__metadataDidChangeHandler, 0);
  objc_storeStrong((id *)&self->__additionalMetadata, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->collector, 0);
  objc_storeStrong((id *)&self->snapshots, 0);
  objc_storeStrong((id *)&self->performanceTestActivity, 0);
  objc_storeStrong((id *)&self->uuid, 0);
  objc_storeStrong((id *)&self->restoredMetadata, 0);
  objc_storeStrong((id *)&self->ping, 0);
  objc_storeStrong((id *)&self->upload, 0);
  objc_storeStrong((id *)&self->download, 0);
}

@end
