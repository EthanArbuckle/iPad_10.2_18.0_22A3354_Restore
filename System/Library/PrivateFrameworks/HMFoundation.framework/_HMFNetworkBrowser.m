@implementation _HMFNetworkBrowser

- (_HMFNetworkBrowser)initWithQueue:(id)a3 domain:(id)a4 serviceType:(id)a5 updateBlock:(id)a6
{
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _HMFNetworkBrowser *v14;
  _HMFNetworkBrowser *v15;
  uint64_t v16;
  id updateBlock;
  dispatch_queue_t v18;
  const char *v19;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)_HMFNetworkBrowser;
  v14 = -[_HMFNetworkBrowser init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_domain, a4);
    objc_storeStrong((id *)&v15->_serviceType, a5);
    v16 = MEMORY[0x1A1AC373C](v13);
    updateBlock = v15->_updateBlock;
    v15->_updateBlock = (id)v16;

    v18 = v10;
    if (!v10)
    {
      v19 = (const char *)HMFDispatchQueueName(v15, 0);
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      a5 = (id)objc_claimAutoreleasedReturnValue();
      v18 = dispatch_queue_create(v19, (dispatch_queue_attr_t)a5);
    }
    objc_storeStrong((id *)&v15->_workQueue, v18);
    if (!v10)
    {

    }
  }

  return v15;
}

- (id)workContext
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33___HMFNetworkBrowser_workContext__block_invoke;
  block[3] = &unk_1E3B37AF8;
  block[4] = self;
  if (_MergedGlobals_3_10 != -1)
    dispatch_once(&_MergedGlobals_3_10, block);
  return (id)qword_1ED012F58;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[_HMFNetworkBrowser serviceType](self, "serviceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HMFNetworkBrowser domain](self, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Browser(%@.%@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)startBrowsing
{
  void *v3;
  void *v4;
  _HMFNetworkBrowser *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  const char *v17;
  id v18;
  const char *v19;
  NSObject *bonjour_service;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v25;
  id location;
  _BYTE buf[24];
  void *v28;
  id v29[2];

  v29[1] = *(id *)MEMORY[0x1E0C80C00];
  -[_HMFNetworkBrowser nw_browser](self, "nw_browser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1A1AC355C]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HMFNetworkBrowser serviceType](v5, "serviceType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v8;
      _os_log_impl(&dword_19B546000, v6, OS_LOG_TYPE_INFO, "%{public}@Browser already started for %@", buf, 0x16u);

LABEL_7:
    }
  }
  else
  {
    -[_HMFNetworkBrowser serviceType](self, "serviceType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HMFNetworkBrowser domain](self, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HMFNetworkBrowser workQueue](self, "workQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __browse_result_changed_handler_block_invoke;
    v28 = &unk_1E3B38C60;
    objc_copyWeak(v29, &location);
    v12 = (void *)MEMORY[0x1A1AC373C](buf);
    objc_destroyWeak(v29);
    objc_destroyWeak(&location);
    v13 = objc_retainAutorelease(v9);
    v14 = v10;
    v15 = v11;
    v16 = v12;
    v17 = (const char *)objc_msgSend(v13, "UTF8String");
    v18 = objc_retainAutorelease(v14);
    v19 = (const char *)objc_msgSend(v18, "UTF8String");

    bonjour_service = nw_browse_descriptor_create_bonjour_service(v17, v19);
    nw_browse_descriptor_set_include_txt_record(bonjour_service, 1);
    v21 = nw_browser_create(bonjour_service, 0);
    nw_browser_set_queue(v21, v15);

    nw_browser_set_browse_results_changed_handler(v21, v16);
    nw_browser_start(v21);

    -[_HMFNetworkBrowser setNw_browser:](self, "setNw_browser:", v21);
    -[_HMFNetworkBrowser nw_browser](self, "nw_browser");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 6);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMFFuture futureWithError:](HMFFuture, "futureWithError:", v25);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      return v23;
    }
    v4 = (void *)MEMORY[0x1A1AC355C]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v7;
      _os_log_impl(&dword_19B546000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Browser started", buf, 0xCu);
      goto LABEL_7;
    }
  }

  objc_autoreleasePoolPop(v4);
  +[HMFFuture futureWithNoValue](HMFFuture, "futureWithNoValue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  return v23;
}

- (void)stop
{
  void *v3;
  NSObject *v4;

  -[_HMFNetworkBrowser nw_browser](self, "nw_browser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_HMFNetworkBrowser nw_browser](self, "nw_browser");
    v4 = objc_claimAutoreleasedReturnValue();
    nw_browser_cancel(v4);

    -[_HMFNetworkBrowser setNw_browser:](self, "setNw_browser:", 0);
  }
}

- (id)stopBrowsing
{
  void *v3;
  _HMFNetworkBrowser *v4;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC355C](-[_HMFNetworkBrowser stop](self, "stop"));
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_19B546000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Browser stopped", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  +[HMFFuture futureWithNoValue](HMFFuture, "futureWithNoValue");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)logCategory
{
  if (qword_1ED012F60 != -1)
    dispatch_once(&qword_1ED012F60, &__block_literal_global_28);
  return (id)qword_1ED012F68;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (OS_nw_browser)nw_browser
{
  return self->_nw_browser;
}

- (void)setNw_browser:(id)a3
{
  objc_storeStrong((id *)&self->_nw_browser, a3);
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (void)setUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_nw_browser, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
