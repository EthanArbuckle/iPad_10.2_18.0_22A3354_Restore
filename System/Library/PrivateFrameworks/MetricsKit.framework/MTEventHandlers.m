@implementation MTEventHandlers

- (MTBaseEventDataProvider)base
{
  MTEventHandlers *v2;
  id v3;
  void *v4;
  uint64_t v5;
  MTBaseEventDataProvider *base;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_base)
  {
    v3 = objc_alloc(-[MTEventHandlers baseDataProviderClass](v2, "baseDataProviderClass"));
    -[MTObject metricsKit](v2, "metricsKit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithMetricsKit:", v4);
    base = v2->_base;
    v2->_base = (MTBaseEventDataProvider *)v5;

  }
  objc_sync_exit(v2);

  return v2->_base;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrations, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (NSMutableDictionary)registrations
{
  MTEventHandlers *v2;
  uint64_t v3;
  NSMutableDictionary *registrations;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_registrations)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    registrations = v2->_registrations;
    v2->_registrations = (NSMutableDictionary *)v3;

    -[MTEventHandlers registerDefaultEventHandlers](v2, "registerDefaultEventHandlers");
  }
  objc_sync_exit(v2);

  return v2->_registrations;
}

- (Class)baseDataProviderClass
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = MTConfigurationError(101, CFSTR("Required method 'baseDataProviderClass' is not implemented on '%@'"), v2, v3, v4, v5, v6, v7, (uint64_t)self);
  return (Class)objc_opt_class();
}

- (void)registerEventHandlerName:(id)a3 eventHandlerClass:(Class)a4
{
  -[MTEventHandlers registerEventHandlerName:eventHandlerClass:eventData:](self, "registerEventHandlerName:eventHandlerClass:eventData:", a3, a4, 0);
}

- (void)registerEventHandlerName:(id)a3 eventHandlerClass:(Class)a4 eventData:(id)a5
{
  id v8;
  id v9;
  MTEventHandlerRegistration *v10;
  void *v11;
  MTEventHandlerRegistration *v12;
  MTEventHandlers *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = [MTEventHandlerRegistration alloc];
  -[MTObject metricsKit](self, "metricsKit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MTEventHandlerRegistration initWithMetricsKit:name:class:eventData:](v10, "initWithMetricsKit:name:class:eventData:", v11, v8, a4, v9);

  v13 = self;
  objc_sync_enter(v13);
  -[MTEventHandlers registrations](v13, "registrations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    MTMetricsKitOSLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v18 = 138412290;
      v19 = v8;
      _os_log_impl(&dword_20D758000, v16, OS_LOG_TYPE_DEBUG, "MetricsKit: registerEventHandlerName: Event handler named %@ is already registered. The previous event handler will be replaced.", (uint8_t *)&v18, 0xCu);
    }

  }
  -[MTEventHandlers registrations](v13, "registrations");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v12, v8);

  objc_sync_exit(v13);
}

- (void)registerEventHandlerName:(id)a3 eventData:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[MTEventHandlers registerEventHandlerName:eventHandlerClass:eventData:](self, "registerEventHandlerName:eventHandlerClass:eventData:", v7, objc_opt_class(), v6);

}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4;
  MTEventHandlers *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[MTEventHandlers registrations](v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  if (!v7 || (objc_msgSend(v7, "eventHandler"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    MTMetricsKitOSLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl(&dword_20D758000, v9, OS_LOG_TYPE_DEBUG, "MetricsKit: Event handler named %@ has not been registered. Use registerEventHandlerName to register it first.", (uint8_t *)&v11, 0xCu);
    }

    v8 = 0;
  }

  return v8;
}

- (void)setBase:(id)a3
{
  objc_storeStrong((id *)&self->_base, a3);
}

- (void)setRegistrations:(id)a3
{
  objc_storeStrong((id *)&self->_registrations, a3);
}

@end
