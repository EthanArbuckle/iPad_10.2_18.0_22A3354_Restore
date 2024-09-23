@implementation NRNewsURLResolutionOperation

- (NRNewsURLResolutionOperation)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[NRNewsURLResolutionOperation init]";
    v9 = 2080;
    v10 = "NRNewsURLResolutionOperation.m";
    v11 = 1024;
    v12 = 32;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_218F22000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NRNewsURLResolutionOperation init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NRNewsURLResolutionOperation)initWithNewsURL:(id)a3
{
  id v4;
  NRNewsURLResolutionOperation *v5;
  uint64_t v6;
  NSURL *newsURL;
  objc_super v9;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NRNewsURLResolutionOperation initWithNewsURL:].cold.1();
  v9.receiver = self;
  v9.super_class = (Class)NRNewsURLResolutionOperation;
  v5 = -[FCOperation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    newsURL = v5->_newsURL;
    v5->_newsURL = (NSURL *)v6;

  }
  return v5;
}

- (BOOL)validateOperation
{
  void *v2;

  -[NRNewsURLResolutionOperation newsURL](self, "newsURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NRNewsURLResolutionOperation validateOperation].cold.1();
  return v2 != 0;
}

- (void)performOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];

  -[NRNewsURLResolutionOperation newsURL](self, "newsURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "nr_isNewsURL") & 1) != 0)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.newsd.url-resolution"), 0);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255035BC0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_resolveNewsURL_withCompletion_, 0, 1);

    objc_msgSend(v4, "setRemoteObjectInterface:", v5);
    objc_msgSend(v4, "resume");
    v7 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __48__NRNewsURLResolutionOperation_performOperation__block_invoke_2;
    v13[3] = &unk_24DA3A270;
    v13[4] = self;
    v8 = v4;
    v14 = v8;
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __48__NRNewsURLResolutionOperation_performOperation__block_invoke_3;
    v11[3] = &unk_24DA3A298;
    v11[4] = self;
    v12 = v8;
    v10 = v8;
    objc_msgSend(v9, "resolveNewsURL:withCompletion:", v3, v11);

  }
  else
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __48__NRNewsURLResolutionOperation_performOperation__block_invoke;
    v15[3] = &unk_24DA3A248;
    v15[4] = self;
    __48__NRNewsURLResolutionOperation_performOperation__block_invoke((uint64_t)v15);
  }

}

void __48__NRNewsURLResolutionOperation_performOperation__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("NRErrorDomain"), 2, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v2);

}

uint64_t __48__NRNewsURLResolutionOperation_performOperation__block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", a2);
  return objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

uint64_t __48__NRNewsURLResolutionOperation_performOperation__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setResultWebURL:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v6);

  return objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  id v7;

  v7 = a3;
  -[NRNewsURLResolutionOperation resolutionCompletion](self, "resolutionCompletion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NRNewsURLResolutionOperation resolutionCompletion](self, "resolutionCompletion");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[NRNewsURLResolutionOperation resultWebURL](self, "resultWebURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, id))v5)[2](v5, v6, v7);

  }
}

- (id)resolutionCompletion
{
  return self->_resolutionCompletion;
}

- (void)setResolutionCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (NSURL)newsURL
{
  return self->_newsURL;
}

- (NSURL)resultWebURL
{
  return self->_resultWebURL;
}

- (void)setResultWebURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultWebURL, 0);
  objc_storeStrong((id *)&self->_newsURL, 0);
  objc_storeStrong(&self->_resolutionCompletion, 0);
}

- (void)initWithNewsURL:.cold.1()
{
  void *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  __int16 v4;
  char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "newsURL != nil");
  v2 = 136315906;
  v3 = "-[NRNewsURLResolutionOperation initWithNewsURL:]";
  v4 = 2080;
  v5 = "NRNewsURLResolutionOperation.m";
  v6 = 1024;
  v7 = 37;
  v8 = 2114;
  v9 = v0;
  OUTLINED_FUNCTION_0(&dword_218F22000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v2);

}

- (void)validateOperation
{
  void *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  __int16 v4;
  char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("news url resolution operation requires URL"));
  v2 = 136315906;
  v3 = "-[NRNewsURLResolutionOperation validateOperation]";
  v4 = 2080;
  v5 = "NRNewsURLResolutionOperation.m";
  v6 = 1024;
  v7 = 53;
  v8 = 2114;
  v9 = v0;
  OUTLINED_FUNCTION_0(&dword_218F22000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v2);

}

@end
