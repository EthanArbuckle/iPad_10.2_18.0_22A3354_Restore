@implementation HMDAccessoryBrowserInjectedSettingsDevice

- (HMDAccessoryBrowserInjectedSettingsDevice)init
{
  HMDAccessoryBrowserInjectedSettingsDevice *v2;
  id v3;
  const char *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMDAccessoryBrowserInjectedSettingsDevice;
  v2 = -[HMDAccessoryBrowserInjectedSettingsDevice init](&v9, sel_init);
  if (v2)
  {
    HMDispatchQueueNameString();
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = (const char *)objc_msgSend(v3, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create(v4, v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

  }
  return v2;
}

- (id)workQueue
{
  return self->_queue;
}

- (id)createIpAccessoryBrowser
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE1B9D0]), "initWithQueue:", self->_queue);
}

- (id)createBtleAccessoryBrowser
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE1B9C0]), "initWithQueue:", self->_queue);
}

- (id)createCHIPAccessoryBrowser
{
  id v3;
  OS_dispatch_queue *queue;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x24BE4EF48]);
  queue = self->_queue;
  v5 = (void *)MEMORY[0x24BDBCF48];
  v6 = (id)storeDirectoryPath;
  objc_msgSend(v5, "fileURLWithPath:isDirectory:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithQueue:storeDirectoryURL:", queue, v7);

  return v8;
}

- (id)createHap2AccessoryBrowserWithStorage:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;

  v4 = (objc_class *)MEMORY[0x24BE1B9C8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithQueue:storage:", self->_queue, v5);

  return v6;
}

- (id)createAuthServerWithDelegate:(id)a3
{
  id v3;
  HMDAuthServer *v4;

  v3 = a3;
  v4 = -[HMDAuthServer initWithDelegate:]([HMDAuthServer alloc], "initWithDelegate:", v3);

  return v4;
}

- (BOOL)exposeAccessoryTypesFeatureEnabled
{
  return _os_feature_enabled_impl();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
