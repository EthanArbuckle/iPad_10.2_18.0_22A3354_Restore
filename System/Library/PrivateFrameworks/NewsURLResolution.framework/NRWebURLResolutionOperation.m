@implementation NRWebURLResolutionOperation

- (NRWebURLResolutionOperation)init
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
    v8 = "-[NRWebURLResolutionOperation init]";
    v9 = 2080;
    v10 = "NRWebURLResolutionOperation.m";
    v11 = 1024;
    v12 = 35;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_218F22000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NRWebURLResolutionOperation init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NRWebURLResolutionOperation)initWithWebURL:(id)a3 bloomFilterInfoService:(id)a4
{
  id v6;
  id v7;
  NRWebURLResolutionOperation *v8;
  uint64_t v9;
  NSURL *webURL;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NRWebURLResolutionOperation initWithWebURL:bloomFilterInfoService:].cold.2();
    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NRWebURLResolutionOperation initWithWebURL:bloomFilterInfoService:].cold.1();
LABEL_6:
  v12.receiver = self;
  v12.super_class = (Class)NRWebURLResolutionOperation;
  v8 = -[FCOperation init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    webURL = v8->_webURL;
    v8->_webURL = (NSURL *)v9;

    objc_storeStrong((id *)&v8->_bloomFilterInfoService, a4);
  }

  return v8;
}

- (BOOL)validateOperation
{
  void *v3;
  void *v4;
  BOOL v5;

  -[NRWebURLResolutionOperation webURL](self, "webURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NRWebURLResolutionOperation validateOperation].cold.2();
  -[NRWebURLResolutionOperation bloomFilterInfoService](self, "bloomFilterInfoService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NRWebURLResolutionOperation validateOperation].cold.1();
  if (v3)
    v5 = v4 == 0;
  else
    v5 = 1;
  return !v5;
}

- (void)performOperation
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  NRWebURLResolutionOperation *v7;
  _QWORD v8[5];

  -[NRWebURLResolutionOperation webURL](self, "webURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "nr_isWebURL") & 1) != 0)
  {
    -[NRWebURLResolutionOperation bloomFilterInfoService](self, "bloomFilterInfoService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __47__NRWebURLResolutionOperation_performOperation__block_invoke_2;
    v5[3] = &unk_24DA3A2C0;
    v6 = v3;
    v7 = self;
    objc_msgSend(v4, "fetchWebURLBloomFilterInfoWithCompletion:", v5);

  }
  else
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __47__NRWebURLResolutionOperation_performOperation__block_invoke;
    v8[3] = &unk_24DA3A248;
    v8[4] = self;
    __47__NRWebURLResolutionOperation_performOperation__block_invoke((uint64_t)v8);
  }

}

void __47__NRWebURLResolutionOperation_performOperation__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("NRErrorDomain"), 1, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v2);

}

void __47__NRWebURLResolutionOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;

  if ((objc_msgSend(a2, "fc_maybeContainsURL:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.newsd.url-resolution"), 0);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255035BC0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_resolveWebURL_withCompletion_, 0, 1);

    objc_msgSend(v3, "setRemoteObjectInterface:", v4);
    objc_msgSend(v3, "resume");
    v6 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __47__NRWebURLResolutionOperation_performOperation__block_invoke_4;
    v13[3] = &unk_24DA3A270;
    v13[4] = *(_QWORD *)(a1 + 40);
    v7 = v3;
    v14 = v7;
    objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __47__NRWebURLResolutionOperation_performOperation__block_invoke_5;
    v11[3] = &unk_24DA3A298;
    v9 = *(_QWORD *)(a1 + 32);
    v11[4] = *(_QWORD *)(a1 + 40);
    v12 = v7;
    v10 = v7;
    objc_msgSend(v8, "resolveWebURL:withCompletion:", v9, v11);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "finishedPerformingOperationWithError:", 0);
  }
}

uint64_t __47__NRWebURLResolutionOperation_performOperation__block_invoke_4(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", a2);
  return objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

uint64_t __47__NRWebURLResolutionOperation_performOperation__block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setResultNewsURL:", a2);
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
  -[NRWebURLResolutionOperation resolutionCompletion](self, "resolutionCompletion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NRWebURLResolutionOperation resolutionCompletion](self, "resolutionCompletion");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[NRWebURLResolutionOperation resultNewsURL](self, "resultNewsURL");
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

- (NSURL)webURL
{
  return self->_webURL;
}

- (NRBloomFilterInfoService)bloomFilterInfoService
{
  return self->_bloomFilterInfoService;
}

- (NSURL)resultNewsURL
{
  return self->_resultNewsURL;
}

- (void)setResultNewsURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultNewsURL, 0);
  objc_storeStrong((id *)&self->_bloomFilterInfoService, 0);
  objc_storeStrong((id *)&self->_webURL, 0);
  objc_storeStrong(&self->_resolutionCompletion, 0);
}

- (void)initWithWebURL:bloomFilterInfoService:.cold.1()
{
  void *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  __int16 v4;
  char *v5;
  __int16 v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "bloomFilterInfoService != nil");
  v2 = 136315906;
  v3 = "-[NRWebURLResolutionOperation initWithWebURL:bloomFilterInfoService:]";
  v4 = 2080;
  v5 = "NRWebURLResolutionOperation.m";
  v6 = 1024;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_218F22000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v2);

  OUTLINED_FUNCTION_2();
}

- (void)initWithWebURL:bloomFilterInfoService:.cold.2()
{
  void *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  __int16 v4;
  char *v5;
  __int16 v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "webURL != nil");
  v2 = 136315906;
  v3 = "-[NRWebURLResolutionOperation initWithWebURL:bloomFilterInfoService:]";
  v4 = 2080;
  v5 = "NRWebURLResolutionOperation.m";
  v6 = 1024;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_218F22000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v2);

  OUTLINED_FUNCTION_2();
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
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("web URL resolution operation requires URL"));
  v2 = 136315906;
  v3 = "-[NRWebURLResolutionOperation validateOperation]";
  v4 = 2080;
  v5 = "NRWebURLResolutionOperation.m";
  v6 = 1024;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_218F22000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v2);

  OUTLINED_FUNCTION_3();
}

@end
