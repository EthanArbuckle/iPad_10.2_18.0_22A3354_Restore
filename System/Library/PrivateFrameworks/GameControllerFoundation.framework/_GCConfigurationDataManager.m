@implementation _GCConfigurationDataManager

- (_GCConfigurationDataManager)initWithProvider:(id)a3
{
  id v3;
  _GCConfigurationDataManager *v4;
  dispatch_workloop_t v5;
  OS_dispatch_workloop *workloop;
  uint64_t v7;
  NSMutableDictionary *locators;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_GCConfigurationDataManager;
  v3 = a3;
  v4 = -[_GCConfigurationDataManager init](&v10, sel_init);
  objc_storeWeak((id *)&v4->_provider, v3);

  v5 = dispatch_workloop_create("Workloop.GameController.ConfigurationData");
  workloop = v4->_workloop;
  v4->_workloop = (OS_dispatch_workloop *)v5;

  v7 = objc_opt_new();
  locators = v4->_locators;
  v4->_locators = (NSMutableDictionary *)v7;

  return v4;
}

- (_GCConfigurationDataManager)init
{
  -[_GCConfigurationDataManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (id)configurationBundleLocatorForType:(id)a3
{
  id v4;
  _GCConfigurationDataManager *v5;
  _GCConfigurationBundleLocator *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKey:](v5->_locators, "objectForKey:", v4);
  v6 = (_GCConfigurationBundleLocator *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = -[_GCConfigurationBundleLocator initWithConfigurationType:provider:]([_GCConfigurationBundleLocator alloc], "initWithConfigurationType:provider:", v4, v5);
    -[NSMutableDictionary setObject:forKey:](v5->_locators, "setObject:forKey:", v6, v4);
  }
  objc_sync_exit(v5);

  return v6;
}

- (id)serviceFor:(id)a3 client:(id)a4
{
  GCServiceProvider **p_provider;
  id v6;
  id v7;
  id WeakRetained;
  OS_dispatch_workloop *v9;

  if (&unk_1F03A96F0 == a3)
  {
    v9 = self->_workloop;
  }
  else
  {
    p_provider = &self->_provider;
    v6 = a4;
    v7 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_provider);
    objc_msgSend(WeakRetained, "serviceFor:client:", v7, v6);
    v9 = (OS_dispatch_workloop *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locators, 0);
  objc_storeStrong((id *)&self->_workloop, 0);
  objc_destroyWeak((id *)&self->_provider);
}

@end
