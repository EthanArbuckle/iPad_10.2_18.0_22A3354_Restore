@implementation CPSClipEventsReporter

+ (id)reporter
{
  if (reporter_onceToken != -1)
    dispatch_once(&reporter_onceToken, &__block_literal_global_8);
  return (id)reporter_reporter;
}

void __33__CPSClipEventsReporter_reporter__block_invoke()
{
  CPSClipEventsReporter *v0;
  void *v1;

  v0 = objc_alloc_init(CPSClipEventsReporter);
  v1 = (void *)reporter_reporter;
  reporter_reporter = (uint64_t)v0;

}

- (CPSClipEventsReporter)init
{
  CPSClipEventsReporter *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  BMSource *source;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *logQueue;
  CPSClipEventsReporter *v12;
  objc_super v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v14.receiver = self;
  v14.super_class = (Class)CPSClipEventsReporter;
  v2 = -[CPSClipEventsReporter init](&v14, sel_init);
  if (v2)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2050000000;
    v3 = (void *)getBMStreamsClass_softClass;
    v19 = getBMStreamsClass_softClass;
    if (!getBMStreamsClass_softClass)
    {
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __getBMStreamsClass_block_invoke;
      v15[3] = &unk_24C3B9278;
      v15[4] = &v16;
      __getBMStreamsClass_block_invoke((uint64_t)v15);
      v3 = (void *)v17[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v16, 8);
    if (v4)
    {
      objc_msgSend(v4, "appClipLaunch");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "source");
      v6 = objc_claimAutoreleasedReturnValue();
      source = v2->_source;
      v2->_source = (BMSource *)v6;

    }
    else
    {
      v8 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[CPSClipEventsReporter init].cold.1(v8);
    }
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.ClipServices.clipserviced.EventReporting", v9);
    logQueue = v2->_logQueue;
    v2->_logQueue = (OS_dispatch_queue *)v10;

    v12 = v2;
  }

  return v2;
}

- (void)logClipLaunchEventForSession:(id)a3
{
  id v4;
  NSObject *logQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  CPSClipEventsReporter *v9;

  v4 = a3;
  logQueue = self->_logQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__CPSClipEventsReporter_logClipLaunchEventForSession___block_invoke;
  v7[3] = &unk_24C3B94D0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(logQueue, v7);

}

void __54__CPSClipEventsReporter_logClipLaunchEventForSession___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE buf[24];
  void *v29;
  uint64_t *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v2 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1;
    v4 = *(void **)(a1 + 32);
    v5 = v2;
    objc_msgSend(v4, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clipURLHash");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_20AD44000, v5, OS_LOG_TYPE_DEFAULT, "Logging Biome Event with session: %@ for clip with hash: %@", buf, 0x16u);

    a1 = v3;
  }
  v22 = a1;
  v8 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v8, "url");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v8, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v11 = (void *)getBMAppClipLaunchEventClass_softClass;
  v27 = getBMAppClipLaunchEventClass_softClass;
  if (!getBMAppClipLaunchEventClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getBMAppClipLaunchEventClass_block_invoke;
    v29 = &unk_24C3B9278;
    v30 = &v24;
    __getBMAppClipLaunchEventClass_block_invoke((uint64_t)buf);
    v11 = (void *)v25[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v24, 8);
  v13 = [v12 alloc];
  objc_msgSend(v9, "clipURLHash");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clipBundleID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fullAppBundleID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "webClipID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "analyticsLaunchReason");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "analyticsShouldIncludeReferrerURL"))
    v19 = v23;
  else
    v19 = 0;
  objc_msgSend(v10, "analyticsReferrerBundleID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v13, "initWithURLHash:clipBundleID:appBundleID:webAppBundleID:launchReason:fullURL:referrerURL:referrerBundleID:", v14, v15, v16, v17, v18, v23, v19, v20);

  objc_msgSend(*(id *)(*(_QWORD *)(v22 + 40) + 8), "sendEvent:", v21);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logQueue, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

- (void)init
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20AD44000, log, OS_LOG_TYPE_ERROR, "Error loading softlinked Biome stream for clip launch donations", v1, 2u);
}

@end
