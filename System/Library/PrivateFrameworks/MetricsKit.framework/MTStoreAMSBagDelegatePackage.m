@implementation MTStoreAMSBagDelegatePackage

- (MTEventRecorderAMSMetricsDelegate)eventRecorderDelegate
{
  return self->_eventRecorderDelegate;
}

- (MTConvenienceEnvironmentDelegate)environmentDelegate
{
  return self->_environmentDelegate;
}

- (MTConfigAMSMetricsDelegate)configDelegate
{
  return self->_configDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentDelegate, 0);
  objc_storeStrong((id *)&self->_eventRecorderDelegate, 0);
  objc_storeStrong((id *)&self->_configDelegate, 0);
  objc_storeStrong(&self->_hostAppBlock, 0);
}

- (MTStoreAMSBagDelegatePackage)initWithAMSBag:(id)a3 containerId:(id)a4 pageURLBlock:(id)a5 resourceRevNumBlock:(id)a6 hostAppBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  MTStoreAMSBagDelegatePackage *v17;
  MTConfigAMSMetricsDelegate *v18;
  MTConfigAMSMetricsDelegate *configDelegate;
  MTConvenienceEnvironmentDelegate *v20;
  MTConvenienceEnvironmentDelegate *environmentDelegate;
  MTEventRecorderAMSMetricsDelegate *v22;
  MTEventRecorderAMSMetricsDelegate *eventRecorderDelegate;
  objc_super v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)MTStoreAMSBagDelegatePackage;
  v17 = -[MTStoreAMSBagDelegatePackage init](&v25, sel_init);
  if (v17)
  {
    v18 = -[MTConfigAMSMetricsDelegate initWithAMSBag:]([MTConfigAMSMetricsDelegate alloc], "initWithAMSBag:", v12);
    configDelegate = v17->_configDelegate;
    v17->_configDelegate = v18;

    v20 = -[MTConvenienceEnvironmentDelegate initWithPageURLBlock:resourceRevNumBlock:hostAppBlock:]([MTConvenienceEnvironmentDelegate alloc], "initWithPageURLBlock:resourceRevNumBlock:hostAppBlock:", v14, v15, v16);
    environmentDelegate = v17->_environmentDelegate;
    v17->_environmentDelegate = v20;

    v22 = -[MTEventRecorderAMSMetricsDelegate initWithContainerId:amsBag:]([MTEventRecorderAMSMetricsDelegate alloc], "initWithContainerId:amsBag:", v13, v12);
    eventRecorderDelegate = v17->_eventRecorderDelegate;
    v17->_eventRecorderDelegate = v22;

  }
  return v17;
}

- (MTStoreAMSBagDelegatePackage)initWithAMSBag:(id)a3
{
  return -[MTStoreAMSBagDelegatePackage initWithAMSBag:containerId:pageURLBlock:resourceRevNumBlock:hostAppBlock:](self, "initWithAMSBag:containerId:pageURLBlock:resourceRevNumBlock:hostAppBlock:", a3, 0, 0, 0, 0);
}

- (MTStoreAMSBagDelegatePackage)init
{
  void *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("-init is not a valid initializer for the class %@"), v4);
  v5 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (id)hostAppBlock
{
  return self->_hostAppBlock;
}

- (void)setHostAppBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setConfigDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_configDelegate, a3);
}

- (void)setEventRecorderDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_eventRecorderDelegate, a3);
}

- (void)setEnvironmentDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_environmentDelegate, a3);
}

@end
