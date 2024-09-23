@implementation NSSNewsAnalyticsSubmitEnvelopesOperation

- (NSSNewsAnalyticsSubmitEnvelopesOperation)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSSNewsAnalyticsSubmitEnvelopesOperation;
  return -[FCOperation init](&v3, sel_init);
}

- (BOOL)validateOperation
{
  void *v2;

  -[NSSNewsAnalyticsSubmitEnvelopesOperation envelopes](self, "envelopes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[NSSNewsAnalyticsSubmitEnvelopesOperation validateOperation].cold.1();
  return v2 != 0;
}

- (void)performOperation
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  -[NSSNewsAnalyticsSubmitEnvelopesOperation envelopes](self, "envelopes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__NSSNewsAnalyticsSubmitEnvelopesOperation_performOperation__block_invoke;
  v9[3] = &unk_1E9BDCEC0;
  v9[4] = self;
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8292448](v9);
  if (objc_msgSend(v3, "count"))
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v6 = (void *)objc_msgSend(v5, "initWithMachServiceName:options:", *MEMORY[0x1E0D59008], 0);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F00C5A40);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRemoteObjectInterface:", v7);
    objc_msgSend(v6, "resume");
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "submitEnvelopes:withCompletion:", v3, v4);
    objc_msgSend(MEMORY[0x1E0D56B90], "registerEnvelopesAsSubmittedToUploader:", v3);

  }
  else
  {
    v4[2](v4, 0);
  }

}

uint64_t __60__NSSNewsAnalyticsSubmitEnvelopesOperation_performOperation__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", a2);
}

- (void)operationDidFinishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[NSSNewsAnalyticsSubmitEnvelopesOperation submissionCompletion](self, "submissionCompletion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NSSNewsAnalyticsSubmitEnvelopesOperation submissionCompletion](self, "submissionCompletion");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
}

- (NSArray)envelopes
{
  return self->_envelopes;
}

- (void)setEnvelopes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (id)submissionCompletion
{
  return self->_submissionCompletion;
}

- (void)setSubmissionCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_submissionCompletion, 0);
  objc_storeStrong((id *)&self->_envelopes, 0);
}

- (void)validateOperation
{
  void *v0;
  int v1;
  const char *v2;
  __int16 v3;
  char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("submit envelopes operation requires envelopes"));
  v1 = 136315906;
  v2 = "-[NSSNewsAnalyticsSubmitEnvelopesOperation validateOperation]";
  v3 = 2080;
  v4 = "NSSNewsAnalyticsSubmitEnvelopesOperation.m";
  v5 = 1024;
  v6 = 42;
  v7 = 2114;
  v8 = v0;
  _os_log_error_impl(&dword_1D7116000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);

}

@end
