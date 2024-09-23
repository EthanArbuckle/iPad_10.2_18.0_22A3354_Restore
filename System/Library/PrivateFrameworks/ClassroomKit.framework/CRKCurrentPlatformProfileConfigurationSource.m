@implementation CRKCurrentPlatformProfileConfigurationSource

- (CRKCurrentPlatformProfileConfigurationSource)init
{
  return -[CRKCurrentPlatformProfileConfigurationSource initWithCallbackQueue:](self, "initWithCallbackQueue:", MEMORY[0x24BDAC9B8]);
}

- (CRKCurrentPlatformProfileConfigurationSource)initWithCallbackQueue:(id)a3
{
  return -[CRKCurrentPlatformProfileConfigurationSource initWithStudentDaemonProxy:callbackQueue:](self, "initWithStudentDaemonProxy:callbackQueue:", 0, a3);
}

- (CRKCurrentPlatformProfileConfigurationSource)initWithStudentDaemonProxy:(id)a3 callbackQueue:(id)a4
{
  id v7;
  id v8;
  CRKCurrentPlatformProfileConfigurationSource *v9;
  void *v10;
  uint64_t v11;
  CRKFeatureFlags *featureFlags;
  uint64_t v13;
  CRKConfigurationSource *mBaseSource;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CRKCurrentPlatformProfileConfigurationSource;
  v9 = -[CRKCurrentPlatformProfileConfigurationSource init](&v16, sel_init);
  if (v9)
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "makeFeatureFlags");
    v11 = objc_claimAutoreleasedReturnValue();
    featureFlags = v9->_featureFlags;
    v9->_featureFlags = (CRKFeatureFlags *)v11;

    -[CRKCurrentPlatformProfileConfigurationSource makeSourceForCurrentPlatformWithCallbackQueue:](v9, "makeSourceForCurrentPlatformWithCallbackQueue:", v8);
    v13 = objc_claimAutoreleasedReturnValue();
    mBaseSource = v9->mBaseSource;
    v9->mBaseSource = (CRKConfigurationSource *)v13;

    objc_storeStrong((id *)&v9->_studentDaemonProxy, a3);
  }

  return v9;
}

- (id)makeSourceForCurrentPlatformWithCallbackQueue:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  CRKStudentdCatalystProfileConfigurationSource *v11;
  id v12;

  v4 = (void *)MEMORY[0x24BDD1760];
  v5 = a3;
  objc_msgSend(v4, "processInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "crk_hasEntitlement:withValue:", CFSTR("com.apple.studentd-access"), MEMORY[0x24BDBD1C8]);

  if (v7)
  {
    -[CRKCurrentPlatformProfileConfigurationSource studentDaemonProxy](self, "studentDaemonProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v10 = v8;
    else
      v10 = (id)objc_opt_new();
    v12 = v10;

    v11 = -[CRKStudentdCatalystProfileConfigurationSource initWithStudentDaemonProxy:callbackQueue:]([CRKStudentdCatalystProfileConfigurationSource alloc], "initWithStudentDaemonProxy:callbackQueue:", v12, v5);
    v5 = v12;
  }
  else
  {
    v11 = -[CRKStudentdXPCProfileConfigurationSource initWithCallbackQueue:]([CRKStudentdXPCProfileConfigurationSource alloc], "initWithCallbackQueue:", v5);
  }

  return v11;
}

- (void)fetchConfiguration:(id)a3
{
  -[CRKConfigurationSource fetchConfiguration:](self->mBaseSource, "fetchConfiguration:", a3);
}

- (void)setConfiguration:(id)a3 completion:(id)a4
{
  -[CRKConfigurationSource setConfiguration:completion:](self->mBaseSource, "setConfiguration:completion:", a3, a4);
}

- (CRKFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (CRKRequestPerformingProtocol)studentDaemonProxy
{
  return self->_studentDaemonProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_studentDaemonProxy, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->mBaseSource, 0);
}

@end
