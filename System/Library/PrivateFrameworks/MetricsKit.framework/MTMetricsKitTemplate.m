@implementation MTMetricsKitTemplate

- (MTSystem)system
{
  MTMetricsKitTemplate *v2;
  MTSystem *v3;
  MTSystem *system;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_system)
  {
    v3 = -[MTSystem initWithMetricsKit:]([MTSystem alloc], "initWithMetricsKit:", v2);
    system = v2->_system;
    v2->_system = v3;

    -[MTMetricsKitTemplate delegatePackage](v2, "delegatePackage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "environmentDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTSystem environment](v2->_system, "environment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", v6);

    -[MTMetricsKitTemplate delegatePackage](v2, "delegatePackage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "eventRecorderDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTSystem eventRecorder](v2->_system, "eventRecorder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", v9);

  }
  objc_sync_exit(v2);

  return v2->_system;
}

- (MTDelegatePackage)delegatePackage
{
  return self->_delegatePackage;
}

- (MTEventHandlers)eventHandlers
{
  return self->_eventHandlers;
}

- (void)setUtils:(id)a3
{
  objc_storeStrong((id *)&self->_utils, a3);
}

- (void)setEventHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_eventHandlers, a3);
}

- (MTMetricsKitTemplate)initWithTopic:(id)a3
{
  id v5;
  MTMetricsKitTemplate *v6;
  MTMetricsKitTemplate *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTMetricsKitTemplate;
  v6 = -[MTMetricsKitTemplate init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_topic, a3);

  return v7;
}

- (MTConfig)config
{
  MTMetricsKitTemplate *v2;
  uint64_t v3;
  MTConfig *config;
  void *v5;
  void *v6;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_config)
  {
    v3 = objc_opt_new();
    config = v2->_config;
    v2->_config = (MTConfig *)v3;

    -[MTObject setMetricsKit:](v2->_config, "setMetricsKit:", v2);
    -[MTMetricsKitTemplate delegatePackage](v2, "delegatePackage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTConfig setDelegate:](v2->_config, "setDelegate:", v6);

  }
  objc_sync_exit(v2);

  return v2->_config;
}

- (NSString)topic
{
  return self->_topic;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegatePackage, 0);
  objc_storeStrong((id *)&self->_utils, 0);
  objc_storeStrong((id *)&self->_system, 0);
  objc_storeStrong((id *)&self->_eventHandlers, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_topic, 0);
}

+ (id)kitWithTopic:(id)a3 amsBag:(id)a4
{
  id v6;
  id v7;
  MTStoreAMSBagDelegatePackage *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[MTStoreAMSBagDelegatePackage initWithAMSBag:]([MTStoreAMSBagDelegatePackage alloc], "initWithAMSBag:", v6);

  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTopic:delegatePackage:", v7, v8);
  return v9;
}

- (MTMetricsKitTemplate)initWithTopic:(id)a3 delegatePackage:(id)a4
{
  id v7;
  MTMetricsKitTemplate *v8;
  MTMetricsKitTemplate *v9;

  v7 = a4;
  v8 = -[MTMetricsKitTemplate initWithTopic:](self, "initWithTopic:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_delegatePackage, a4);

  return v9;
}

- (id)metricsDataWithEventHandlerName:(id)a3 pageId:(id)a4 pageType:(id)a5 pageContext:(id)a6 eventData:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  MTCallerSuppliedFields *v19;
  void *v20;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = a3;
  -[MTMetricsKitTemplate eventHandlers](self, "eventHandlers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = -[MTCallerSuppliedFields initWithPageId:pageType:pageContext:eventData:]([MTCallerSuppliedFields alloc], "initWithPageId:pageType:pageContext:eventData:", v12, v13, v14, v15);
    objc_msgSend(v18, "metricsDataWithCallerSuppliedFields:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)metricsDataWithEventHandlerName:(id)a3 pageId:(id)a4 pageType:(id)a5 pageContext:(id)a6 fields:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id *v21;
  id v22;
  void *v23;
  id *v25;
  uint64_t v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (id *)&v26;
  v18 = v16;
  v19 = v18;
  if (v18)
  {
    v20 = v18;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v17, "addObjectsFromArray:", v20);
      else
        objc_msgSend(v17, "addObject:", v20);
      v21 = v25++;
      v22 = *v21;

      v20 = v22;
    }
    while (v22);
  }
  -[MTMetricsKitTemplate metricsDataWithEventHandlerName:pageId:pageType:pageContext:eventData:](self, "metricsDataWithEventHandlerName:pageId:pageType:pageContext:eventData:", v12, v13, v14, v15, v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)metricsDataWithEventHandlerName:(id)a3 pageData:(id)a4 eventData:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "pageId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "pageType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "pageContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  -[MTMetricsKitTemplate metricsDataWithEventHandlerName:pageId:pageType:pageContext:eventData:](self, "metricsDataWithEventHandlerName:pageId:pageType:pageContext:eventData:", v8, v11, v12, v13, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)metricsDataWithEventHandlerName:(id)a3 pageData:(id)a4 fields:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id *v15;
  id v16;
  void *v17;
  id *v19;
  uint64_t v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id *)&v20;
  v12 = v10;
  v13 = v12;
  if (v12)
  {
    v14 = v12;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v11, "addObjectsFromArray:", v14);
      else
        objc_msgSend(v11, "addObject:", v14);
      v15 = v19++;
      v16 = *v15;

      v14 = v16;
    }
    while (v16);
  }
  -[MTMetricsKitTemplate metricsDataWithEventHandlerName:pageData:eventData:](self, "metricsDataWithEventHandlerName:pageData:eventData:", v8, v9, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)metricsDataWithEventHandlerName:(id)a3 eventData:(id)a4
{
  return -[MTMetricsKitTemplate metricsDataWithEventHandlerName:pageId:pageType:pageContext:eventData:](self, "metricsDataWithEventHandlerName:pageId:pageType:pageContext:eventData:", a3, 0, 0, 0, a4);
}

- (id)metricsDataWithEventHandlerName:(id)a3 fields:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id *v12;
  id v13;
  void *v14;
  id *v16;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id *)&v17;
  v9 = v7;
  v10 = v9;
  if (v9)
  {
    v11 = v9;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v8, "addObjectsFromArray:", v11);
      else
        objc_msgSend(v8, "addObject:", v11);
      v12 = v16++;
      v13 = *v12;

      v11 = v13;
    }
    while (v13);
  }
  -[MTMetricsKitTemplate metricsDataWithEventHandlerName:eventData:](self, "metricsDataWithEventHandlerName:eventData:", v6, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (MTUtils)utils
{
  MTMetricsKitTemplate *v2;
  MTUtils *v3;
  MTUtils *utils;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_utils)
  {
    v3 = -[MTObject initWithMetricsKit:]([MTUtils alloc], "initWithMetricsKit:", v2);
    utils = v2->_utils;
    v2->_utils = v3;

  }
  objc_sync_exit(v2);

  return v2->_utils;
}

- (id)sampling
{
  return 0;
}

- (void)setTopic:(id)a3
{
  objc_storeStrong((id *)&self->_topic, a3);
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (void)setSystem:(id)a3
{
  objc_storeStrong((id *)&self->_system, a3);
}

- (void)setDelegatePackage:(id)a3
{
  objc_storeStrong((id *)&self->_delegatePackage, a3);
}

- (MTMetricsKitTemplate)initWithTopic:(id)a3 bagProfile:(id)a4 profileVersion:(id)a5
{
  void *v8;
  id v9;
  void *v10;
  MTStoreAMSBagDelegatePackage *v11;
  MTMetricsKitTemplate *v12;

  v8 = (void *)MEMORY[0x24BE08048];
  v9 = a3;
  objc_msgSend(v8, "bagForProfile:profileVersion:", a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MTStoreAMSBagDelegatePackage initWithAMSBag:]([MTStoreAMSBagDelegatePackage alloc], "initWithAMSBag:", v10);
  v12 = -[MTMetricsKitTemplate initWithTopic:delegatePackage:](self, "initWithTopic:delegatePackage:", v9, v11);

  return v12;
}

+ (id)kitWithTopic:(id)a3 bagProfile:(id)a4 profileVersion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTopic:bagProfile:profileVersion:", v10, v9, v8);

  return v11;
}

@end
