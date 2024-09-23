@implementation CRKStudentdBackedInstructordTransportProvider

- (CRKStudentdBackedInstructordTransportProvider)init
{
  return -[CRKStudentdBackedInstructordTransportProvider initWithStudentDaemonProxy:classroomAppBundleURL:](self, "initWithStudentDaemonProxy:classroomAppBundleURL:", 0, 0);
}

- (CRKStudentdBackedInstructordTransportProvider)initWithStudentDaemonProxy:(id)a3
{
  return -[CRKStudentdBackedInstructordTransportProvider initWithStudentDaemonProxy:classroomAppBundleURL:](self, "initWithStudentDaemonProxy:classroomAppBundleURL:", a3, 0);
}

- (CRKStudentdBackedInstructordTransportProvider)initWithStudentDaemonProxy:(id)a3 classroomAppBundleURL:(id)a4
{
  return -[CRKStudentdBackedInstructordTransportProvider initWithStudentDaemonProxy:classroomAppBundleURL:instructordBundleIdentifier:](self, "initWithStudentDaemonProxy:classroomAppBundleURL:instructordBundleIdentifier:", a3, a4, 0);
}

- (CRKStudentdBackedInstructordTransportProvider)initWithStudentDaemonProxy:(id)a3 classroomAppBundleURL:(id)a4 instructordBundleIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  CRKStudentdBackedInstructordTransportProvider *v11;
  CRKRequestPerformingProtocol *v12;
  CRKRequestPerformingProtocol *studentDaemonProxy;
  uint64_t v14;
  NSString *instructordBundleIdentifier;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CRKStudentdBackedInstructordTransportProvider;
  v11 = -[CRKStudentdBackedInstructordTransportProvider init](&v17, sel_init);
  if (v11)
  {
    if (v8)
      v12 = (CRKRequestPerformingProtocol *)v8;
    else
      v12 = (CRKRequestPerformingProtocol *)objc_opt_new();
    studentDaemonProxy = v11->_studentDaemonProxy;
    v11->_studentDaemonProxy = v12;

    v14 = objc_msgSend(v10, "copy");
    instructordBundleIdentifier = v11->_instructordBundleIdentifier;
    v11->_instructordBundleIdentifier = (NSString *)v14;

    objc_storeStrong((id *)&v11->_classroomAppBundleURL, a4);
  }

  return v11;
}

- (void)fetchTransportWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v11 = (id)objc_opt_new();
  -[CRKStudentdBackedInstructordTransportProvider classroomAppBundleURL](self, "classroomAppBundleURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClassroomAppBundleURL:", v5);

  -[CRKStudentdBackedInstructordTransportProvider instructordBundleIdentifier](self, "instructordBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setInstructordBundleIdentifier:", v6);

  -[CRKStudentdBackedInstructordTransportProvider studentDaemonProxy](self, "studentDaemonProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "operationForRequest:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x219A226E8](v4);
  objc_msgSend(v8, "addTarget:selector:forOperationEvents:userInfo:", self, sel_fetchTransportOperationDidFinish_completion_, 6, v9);

  objc_msgSend(MEMORY[0x24BE2C758], "crk_backgroundQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addOperation:", v8);

}

- (void)fetchTransportOperationDidFinish:(id)a3 completion:(id)a4
{
  void (**v5)(id, _QWORD, id);
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = (void (**)(id, _QWORD, id))a4;
  v6 = a3;
  objc_msgSend(v6, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "error");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v5[2](v5, 0, v12);
  }
  else
  {
    objc_msgSend(v6, "resultObject");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v8 = objc_alloc(MEMORY[0x24BDD1988]);
    objc_msgSend(v12, "endpoint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithListenerEndpoint:", v9);

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2C7B0]), "initWithXPCConnection:", v10);
    ((void (**)(id, void *, id))v5)[2](v5, v11, 0);

    v5 = (void (**)(id, _QWORD, id))v10;
  }

}

- (CRKRequestPerformingProtocol)studentDaemonProxy
{
  return self->_studentDaemonProxy;
}

- (void)setStudentDaemonProxy:(id)a3
{
  objc_storeStrong((id *)&self->_studentDaemonProxy, a3);
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
  objc_storeStrong((id *)&self->_studentDaemonProxy, 0);
}

@end
