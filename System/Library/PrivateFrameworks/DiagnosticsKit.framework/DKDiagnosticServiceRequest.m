@implementation DKDiagnosticServiceRequest

- (DKDiagnosticServiceRequest)initWithHostServicesDelegate:(id)a3
{
  id v4;
  DKDiagnosticServiceRequest *v5;
  DKDiagnosticServiceRequest *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DKDiagnosticServiceRequest;
  v5 = -[DKDiagnosticServiceRequest init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_completed = 0;
    objc_storeWeak(&v5->_hostServicesDelegate, v4);
  }

  return v6;
}

- (void)didInvalidate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1540];
  v7 = *MEMORY[0x24BDD0FC8];
  DKErrorLocalizedDescriptionForCode(-1001);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), -1001, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[DKDiagnosticServiceRequest _completeWithDiagnosticResult:error:](self, "_completeWithDiagnosticResult:error:", 0, v6);
}

- (void)didInterrupt
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1540];
  v7 = *MEMORY[0x24BDD0FC8];
  DKErrorLocalizedDescriptionForCode(-1001);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), -1001, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[DKDiagnosticServiceRequest _completeWithDiagnosticResult:error:](self, "_completeWithDiagnosticResult:error:", 0, v6);
}

- (void)didFailStart
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1540];
  v7 = *MEMORY[0x24BDD0FC8];
  DKErrorLocalizedDescriptionForCode(-1001);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), -1001, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[DKDiagnosticServiceRequest _completeWithDiagnosticResult:error:](self, "_completeWithDiagnosticResult:error:", 0, v6);
}

- (void)completeWithPayload:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  DiagnosticsKitLogHandleForCategory(1);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[DKDiagnosticServiceRequest completeWithPayload:completion:]";
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_22DE4C000, v8, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v9, 0x16u);
  }

  v7[2](v7);
  -[DKDiagnosticServiceRequest _completeWithDiagnosticResult:error:](self, "_completeWithDiagnosticResult:error:", v6, 0);

}

- (void)cancelExtensionRequest
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  DiagnosticsKitLogHandleForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[DKDiagnosticServiceRequest cancelExtensionRequest]";
    _os_log_impl(&dword_22DE4C000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  -[DKDiagnosticServiceRequest _completeWithDiagnosticResult:error:](self, "_completeWithDiagnosticResult:error:", 0, 0);
}

- (void)dismissViewControllerWithCompletion:(id)a3
{
  void (**v3)(_QWORD);
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = (void (**)(_QWORD))a3;
  DiagnosticsKitLogHandleForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[DKDiagnosticServiceRequest dismissViewControllerWithCompletion:]";
    _os_log_impl(&dword_22DE4C000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  v3[2](v3);
}

- (void)_completeWithDiagnosticResult:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (!-[DKDiagnosticServiceRequest completed](self, "completed"))
  {
    -[DKDiagnosticServiceRequest setCompleted:](self, "setCompleted:", 1);
    -[DKDiagnosticServiceRequest completion](self, "completion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[DKDiagnosticServiceRequest completion](self, "completion");
      v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, id))v8)[2](v8, v10, v6);

    }
    -[DKDiagnosticServiceRequest connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invalidate");

  }
}

- (id)hostServicesDelegate
{
  return objc_loadWeakRetained(&self->_hostServicesDelegate);
}

- (void)setHostServicesDelegate:(id)a3
{
  objc_storeWeak(&self->_hostServicesDelegate, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (DKDiagnosticHostContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_destroyWeak(&self->_hostServicesDelegate);
}

@end
