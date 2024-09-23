@implementation CRKCurrentPlatformInstructordTransportProvider

- (CRKCurrentPlatformInstructordTransportProvider)init
{
  return -[CRKCurrentPlatformInstructordTransportProvider initWithStudentDaemonProxy:](self, "initWithStudentDaemonProxy:", 0);
}

- (CRKCurrentPlatformInstructordTransportProvider)initWithStudentDaemonProxy:(id)a3
{
  return -[CRKCurrentPlatformInstructordTransportProvider initWithStudentDaemonProxy:classroomAppBundleURL:](self, "initWithStudentDaemonProxy:classroomAppBundleURL:", a3, 0);
}

- (CRKCurrentPlatformInstructordTransportProvider)initWithStudentDaemonProxy:(id)a3 classroomAppBundleURL:(id)a4
{
  return -[CRKCurrentPlatformInstructordTransportProvider initWithStudentDaemonProxy:classroomAppBundleURL:instructordBundleIdentifier:](self, "initWithStudentDaemonProxy:classroomAppBundleURL:instructordBundleIdentifier:", a3, a4, 0);
}

- (CRKCurrentPlatformInstructordTransportProvider)initWithStudentDaemonProxy:(id)a3 classroomAppBundleURL:(id)a4 instructordBundleIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  CRKCurrentPlatformInstructordTransportProvider *v11;
  CRKCurrentPlatformInstructordTransportProvider *v12;
  uint64_t v13;
  NSString *instructordBundleIdentifier;
  uint64_t v15;
  CRKTransportProviding *mBaseProvider;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CRKCurrentPlatformInstructordTransportProvider;
  v11 = -[CRKCurrentPlatformInstructordTransportProvider init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_classroomAppBundleURL, a4);
    v13 = objc_msgSend(v10, "copy");
    instructordBundleIdentifier = v12->_instructordBundleIdentifier;
    v12->_instructordBundleIdentifier = (NSString *)v13;

    -[CRKCurrentPlatformInstructordTransportProvider makeProviderForCurrentPlatformWithStudentDaemonProxy:](v12, "makeProviderForCurrentPlatformWithStudentDaemonProxy:", v8);
    v15 = objc_claimAutoreleasedReturnValue();
    mBaseProvider = v12->mBaseProvider;
    v12->mBaseProvider = (CRKTransportProviding *)v15;

  }
  return v12;
}

- (id)makeProviderForCurrentPlatformWithStudentDaemonProxy:(id)a3
{
  id v4;
  void *v5;
  int v6;
  CRKStudentdBackedInstructordTransportProvider *v7;
  void *v8;
  void *v9;
  CRKStudentdBackedInstructordTransportProvider *v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "crk_hasEntitlement:withValue:", CFSTR("com.apple.studentd-access"), MEMORY[0x24BDBD1C8]);

  if (v6)
  {
    v7 = [CRKStudentdBackedInstructordTransportProvider alloc];
    -[CRKCurrentPlatformInstructordTransportProvider classroomAppBundleURL](self, "classroomAppBundleURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKCurrentPlatformInstructordTransportProvider instructordBundleIdentifier](self, "instructordBundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CRKStudentdBackedInstructordTransportProvider initWithStudentDaemonProxy:classroomAppBundleURL:instructordBundleIdentifier:](v7, "initWithStudentDaemonProxy:classroomAppBundleURL:instructordBundleIdentifier:", v4, v8, v9);

  }
  else
  {
    v10 = (CRKStudentdBackedInstructordTransportProvider *)objc_opt_new();
  }

  return v10;
}

- (void)fetchTransportWithCompletion:(id)a3
{
  -[CRKTransportProviding fetchTransportWithCompletion:](self->mBaseProvider, "fetchTransportWithCompletion:", a3);
}

- (NSURL)classroomAppBundleURL
{
  return self->_classroomAppBundleURL;
}

- (void)setClassroomAppBundleURL:(id)a3
{
  objc_storeStrong((id *)&self->_classroomAppBundleURL, a3);
}

- (NSString)instructordBundleIdentifier
{
  return self->_instructordBundleIdentifier;
}

- (void)setInstructordBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructordBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_classroomAppBundleURL, 0);
  objc_storeStrong((id *)&self->mBaseProvider, 0);
}

@end
