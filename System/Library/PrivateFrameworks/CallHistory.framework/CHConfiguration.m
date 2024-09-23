@implementation CHConfiguration

- (CHConfiguration)initWithDataSource:(id)a3
{
  id v5;
  CHConfiguration *v6;
  CHConfiguration *v7;
  CHDelegateController *v8;
  CHConfigurationDelegate *delegateController;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CHConfiguration;
  v6 = -[CHConfiguration init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    v8 = objc_alloc_init(CHDelegateController);
    delegateController = v7->_delegateController;
    v7->_delegateController = (CHConfigurationDelegate *)v8;

  }
  return v7;
}

- (BOOL)isCloudKitEnabled
{
  void *v2;
  char v3;

  -[CHConfiguration numberForKey:](self, "numberForKey:", CFSTR("cloudKitEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)numberForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CHConfiguration dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CHConfiguration delegateController](self, "delegateController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addDelegate:queue:", v7, v6);

}

- (void)removeDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CHConfiguration delegateController](self, "delegateController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeDelegate:", v4);

}

- (CHKeyValueDataSource)dataSource
{
  return self->_dataSource;
}

- (CHConfigurationDelegate)delegateController
{
  return self->_delegateController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateController, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
