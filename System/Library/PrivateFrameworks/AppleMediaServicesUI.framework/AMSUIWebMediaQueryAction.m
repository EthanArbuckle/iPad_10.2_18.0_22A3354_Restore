@implementation AMSUIWebMediaQueryAction

- (AMSUIWebMediaQueryAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebMediaQueryAction *v7;
  void *v8;
  NSArray *v9;
  NSArray *bundleIDs;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSArray *v16;
  NSArray *storeItemIDs;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AMSUIWebMediaQueryAction;
  v7 = -[AMSUIWebAction initWithJSObject:context:](&v19, sel_initWithJSObject_context_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleIDs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    bundleIDs = v7->_bundleIDs;
    v7->_bundleIDs = v9;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("observing"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    v13 = v12;
    if (!v12)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("enabled"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v14;
      else
        v13 = 0;

    }
    objc_storeStrong((id *)&v7->_observing, v13);
    if (!v12)

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("storeItemIDs"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;

    storeItemIDs = v7->_storeItemIDs;
    v7->_storeItemIDs = v16;

  }
  return v7;
}

- (id)runAction
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AMSUIWebMediaQueryAction;
  v3 = -[AMSUIWebAction runAction](&v16, sel_runAction);
  -[AMSUIWebMediaQueryAction observing](self, "observing");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebMediaQueryAction bundleIDs](self, "bundleIDs");
  v5 = objc_claimAutoreleasedReturnValue();
  -[AMSUIWebMediaQueryAction storeItemIDs](self, "storeItemIDs");
  v6 = objc_claimAutoreleasedReturnValue();
  -[AMSUIWebAction context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appQueryManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (objc_msgSend(v4, "BOOLValue") & 1) == 0)
  {
    if (v5 | v6)
    {
      objc_msgSend(v9, "stopObservingAppsWithBundleIDs:", v5);
      objc_msgSend(v9, "stopObservingAppsWithStoreItemIDs:", v6);
    }
    else
    {
      objc_msgSend(v9, "stopObservingAllApps");
    }
    objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", MEMORY[0x24BDBD1C8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 2);
    if (objc_msgSend((id)v5, "count"))
    {
      objc_msgSend(v9, "queryAppsWithBundleIDs:startObserving:", v5, objc_msgSend(v4, "BOOLValue"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);

    }
    if (objc_msgSend((id)v6, "count"))
    {
      objc_msgSend(v9, "queryAppsWithStoreItemIDs:startObserving:", v6, objc_msgSend(v4, "BOOLValue"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v12);

    }
    objc_msgSend(MEMORY[0x24BE08078], "promiseWithAll:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "promiseAdapter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (NSArray)bundleIDs
{
  return self->_bundleIDs;
}

- (void)setBundleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIDs, a3);
}

- (NSNumber)observing
{
  return self->_observing;
}

- (void)setObserving:(id)a3
{
  objc_storeStrong((id *)&self->_observing, a3);
}

- (NSArray)storeItemIDs
{
  return self->_storeItemIDs;
}

- (void)setStoreItemIDs:(id)a3
{
  objc_storeStrong((id *)&self->_storeItemIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeItemIDs, 0);
  objc_storeStrong((id *)&self->_observing, 0);
  objc_storeStrong((id *)&self->_bundleIDs, 0);
}

@end
