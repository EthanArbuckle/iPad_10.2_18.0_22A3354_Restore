@implementation CRKStudentdXPCProfileConfigurationSource

- (CRKStudentdXPCProfileConfigurationSource)init
{
  return -[CRKStudentdXPCProfileConfigurationSource initWithCallbackQueue:](self, "initWithCallbackQueue:", MEMORY[0x24BDAC9B8]);
}

- (CRKStudentdXPCProfileConfigurationSource)initWithCallbackQueue:(id)a3
{
  id v5;
  CRKStudentdXPCProfileConfigurationSource *v6;
  CRKStudentdXPCProfileConfigurationSource *v7;
  void *v8;
  void *v9;
  void *v10;
  CRKDirectoryBackedConfigurationSource *v11;
  CRKConfigurationSource *mPlaceholderFileConfigurationSource;
  CRKNonCatalystStudentDaemonProxy *v13;
  CRKNonCatalystStudentDaemonProxy *studentDaemonProxy;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CRKStudentdXPCProfileConfigurationSource;
  v6 = -[CRKStudentdXPCProfileConfigurationSource init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mCallbackQueue, a3);
    if (-[CRKStudentdXPCProfileConfigurationSource shouldUsePlaceholderFile](v7, "shouldUsePlaceholderFile"))
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "crk_iOSPlaceholderProfileURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "URLByDeletingLastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[CRKDirectoryBackedConfigurationSource initWithDirectoryURL:fileName:callbackQueue:]([CRKDirectoryBackedConfigurationSource alloc], "initWithDirectoryURL:fileName:callbackQueue:", v9, v10, v5);
      mPlaceholderFileConfigurationSource = v7->mPlaceholderFileConfigurationSource;
      v7->mPlaceholderFileConfigurationSource = (CRKConfigurationSource *)v11;

    }
    v13 = -[CRKNonCatalystStudentDaemonProxy initWithCallbackQueue:]([CRKNonCatalystStudentDaemonProxy alloc], "initWithCallbackQueue:", v5);
    studentDaemonProxy = v7->_studentDaemonProxy;
    v7->_studentDaemonProxy = v13;

  }
  return v7;
}

- (BOOL)isStudentdInstalled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "crk_isStudentdInstalled");

  return v3;
}

- (BOOL)shouldUsePlaceholderFile
{
  int v3;

  v3 = CRKIsiOS();
  if (v3)
    LOBYTE(v3) = !-[CRKStudentdXPCProfileConfigurationSource isStudentdInstalled](self, "isStudentdInstalled");
  return v3;
}

- (void)fetchConfiguration:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[CRKStudentdXPCProfileConfigurationSource shouldUsePlaceholderFile](self, "shouldUsePlaceholderFile"))
  {
    -[CRKConfigurationSource fetchConfiguration:](self->mPlaceholderFileConfigurationSource, "fetchConfiguration:", v5);
  }
  else
  {
    -[CRKStudentdXPCProfileConfigurationSource studentDaemonProxy](self, "studentDaemonProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fetchConfiguration:", v5);

  }
}

- (void)setConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (-[CRKStudentdXPCProfileConfigurationSource shouldUsePlaceholderFile](self, "shouldUsePlaceholderFile"))
  {
    if (v9)
      v7 = MEMORY[0x24BDBD1B8];
    else
      v7 = 0;
    -[CRKConfigurationSource setConfiguration:completion:](self->mPlaceholderFileConfigurationSource, "setConfiguration:completion:", v7, v6);
  }
  else
  {
    -[CRKStudentdXPCProfileConfigurationSource studentDaemonProxy](self, "studentDaemonProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setConfiguration:completion:", v9, v6);

  }
}

- (CRKNonCatalystStudentDaemonProxy)studentDaemonProxy
{
  return self->_studentDaemonProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_studentDaemonProxy, 0);
  objc_storeStrong((id *)&self->mPlaceholderFileConfigurationSource, 0);
  objc_storeStrong((id *)&self->mCallbackQueue, 0);
}

@end
