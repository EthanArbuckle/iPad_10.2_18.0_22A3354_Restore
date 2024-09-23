@implementation CRKStudentdCatalystProfileConfigurationSource

- (CRKStudentdCatalystProfileConfigurationSource)initWithStudentDaemonProxy:(id)a3 callbackQueue:(id)a4
{
  id v6;
  CRKStudentdCatalystProfileConfigurationSource *v7;
  CRKStudentdCatalystProfileConfigurationSource *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRKStudentdCatalystProfileConfigurationSource;
  v7 = -[CRKStudentdCatalystProfileConfigurationSource init](&v10, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_studentDaemonProxy, a3);

  return v8;
}

- (void)fetchConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[CRKStudentdCatalystProfileConfigurationSource studentDaemonProxy](self, "studentDaemonProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  objc_msgSend(v5, "operationForRequest:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x219A226E8](v4);
  objc_msgSend(v9, "addTarget:selector:forOperationEvents:userInfo:", self, sel_fetchConfigurationOperationDidFinish_completion_, 6, v7);

  objc_msgSend(MEMORY[0x24BE2C758], "crk_backgroundQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addOperation:", v9);

}

- (void)setConfiguration:(id)a3 completion:(id)a4
{
  id v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKStudentdCatalystProfileConfigurationSource.m"), 44, CFSTR("setConfiguration is not supported"));

}

- (void)fetchConfigurationOperationDidFinish:(id)a3 completion:(id)a4
{
  void (**v5)(id, _QWORD, void *);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = (void (**)(id, _QWORD, void *))a4;
  objc_msgSend(v10, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v5[2](v5, 0, v6);
  }
  else
  {
    objc_msgSend(v10, "resultObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configurationsByType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", &unk_24DA07E68);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(id, void *, void *))v5)[2](v5, v9, 0);
  }

}

- (CRKRequestPerformingProtocol)studentDaemonProxy
{
  return self->_studentDaemonProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_studentDaemonProxy, 0);
}

@end
