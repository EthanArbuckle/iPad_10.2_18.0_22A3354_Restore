@implementation SHManagedSessionCustomCatalogDriver

- (SHManagedSessionCustomCatalogDriver)initWithServiceConnection:(id)a3
{
  id v5;
  SHManagedSessionCustomCatalogDriver *v6;
  SHManagedSessionCustomCatalogDriverDaemonDelegate *v7;
  SHManagedSessionCustomCatalogDriverDaemonDelegate *daemonDelegate;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SHManagedSessionCustomCatalogDriver;
  v6 = -[SHManagedSessionCustomCatalogDriver init](&v10, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(SHManagedSessionCustomCatalogDriverDaemonDelegate);
    daemonDelegate = v6->_daemonDelegate;
    v6->_daemonDelegate = v7;

    objc_storeStrong((id *)&v6->_serviceConnection, a3);
    -[SHMatcher setDelegate:](v6->_serviceConnection, "setDelegate:", v6->_daemonDelegate);
  }

  return v6;
}

- (NSUUID)matchingSignatureID
{
  void *v2;
  void *v3;

  -[SHManagedSessionCustomCatalogDriver daemonDelegate](self, "daemonDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "matchingSignatureID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (void)matcher:(id)a3 didProduceResponse:(id)a4
{
  id v6;
  id v7;
  SHMatcherResponse *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  SHMatcherResponse *v21;

  v6 = a4;
  v7 = a3;
  v8 = [SHMatcherResponse alloc];
  objc_msgSend(v6, "recordingIntermission");
  v10 = v9;
  objc_msgSend(v6, "recordingSignatureOffset");
  v12 = v11;
  objc_msgSend(v6, "retrySeconds");
  v14 = v13;
  objc_msgSend(v6, "match");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "signature");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHManagedSessionCustomCatalogDriver daemonDelegate](self, "daemonDelegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "inflightRequestID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "error");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = -[SHMatcherResponse initWithRecordingIntermission:recordingSignatureOffset:retrySeconds:match:signature:runningAssociatedRequestID:error:](v8, "initWithRecordingIntermission:recordingSignatureOffset:retrySeconds:match:signature:runningAssociatedRequestID:error:", v15, v16, v18, v19, v10, v12, v14);
  -[SHManagedSessionCustomCatalogDriver serviceConnection](self, "serviceConnection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "matcher:didProduceResponse:", v7, v21);

}

- (void)setSessionDriverDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SHManagedSessionCustomCatalogDriver daemonDelegate](self, "daemonDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSessionDriverDelegate:", v4);

}

- (SHSessionDriverDelegate)sessionDriverDelegate
{
  void *v2;
  void *v3;

  -[SHManagedSessionCustomCatalogDriver daemonDelegate](self, "daemonDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sessionDriverDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SHSessionDriverDelegate *)v3;
}

- (void)flow:(id)a3 time:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("This session driver does not accept user supplied audio"), 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (SHMatcher)serviceConnection
{
  return self->_serviceConnection;
}

- (SHManagedSessionCustomCatalogDriverDaemonDelegate)daemonDelegate
{
  return self->_daemonDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonDelegate, 0);
  objc_storeStrong((id *)&self->_serviceConnection, 0);
}

@end
