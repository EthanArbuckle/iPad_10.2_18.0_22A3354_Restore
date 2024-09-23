@implementation HMDBackgroundOperationManagerDataSource

- (HMDBackgroundOperationManagerDataSource)initWithOperationManager:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  HMDBackgroundOperationManagerDataSource *v7;

  v4 = (void *)MEMORY[0x24BDD16D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDBackgroundOperationManagerDataSource initWithOperationManager:notificationCenter:](self, "initWithOperationManager:notificationCenter:", v5, v6);

  return v7;
}

- (HMDBackgroundOperationManagerDataSource)initWithOperationManager:(id)a3 notificationCenter:(id)a4
{
  id v6;
  id v7;
  HMDBackgroundOperationManagerDataSource *v8;
  HMDBackgroundOperationManagerDataSource *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDBackgroundOperationManagerDataSource;
  v8 = -[HMDBackgroundOperationManagerDataSource init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_notificationCenter, a4);
    objc_storeWeak((id *)&v9->_owner, v6);
  }

  return v9;
}

- (NSDictionary)values
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)notifyDataSourceChanged
{
  id v3;

  -[HMDBackgroundOperationManagerDataSource owner](self, "owner");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSourceHasUpdate:", self);

}

- (HMDBackgroundOperationManager)owner
{
  return (HMDBackgroundOperationManager *)objc_loadWeakRetained((id *)&self->_owner);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_destroyWeak((id *)&self->_owner);
}

+ (NSString)name
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

@end
