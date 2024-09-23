@implementation FPDisconnectDomainOperation

- (FPDisconnectDomainOperation)initWithDomain:(id)a3
{
  id v5;
  void *v6;
  FPDisconnectDomainOperation *v7;
  objc_super v9;

  v5 = a3;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)FPDisconnectDomainOperation;
  v7 = -[FPActionOperation initWithProvider:action:](&v9, sel_initWithProvider_action_, v6, 0);

  if (v7)
  {
    objc_storeStrong((id *)&v7->_domain, a3);
    -[FPActionOperation setSetupRemoteOperationService:](v7, "setSetupRemoteOperationService:", 1);
  }

  return v7;
}

- (void)_tryDisconnectingSafely:(BOOL)a3
{
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  NSProgress *v9;
  NSProgress *remoteProgress;
  _QWORD v11[5];
  BOOL v12;

  v5 = !a3;
  -[FPActionOperation remoteServiceProxy](self, "remoteServiceProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPProviderDomain identifier](self->_domain, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fp_toDomainIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__FPDisconnectDomainOperation__tryDisconnectingSafely___block_invoke;
  v11[3] = &unk_1E444EFC8;
  v11[4] = self;
  v12 = a3;
  objc_msgSend(v6, "disconnectDomainID:options:completionHandler:", v8, v5, v11);
  v9 = (NSProgress *)objc_claimAutoreleasedReturnValue();
  remoteProgress = self->_remoteProgress;
  self->_remoteProgress = v9;

}

void __55__FPDisconnectDomainOperation__tryDisconnectingSafely___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 456);
  v4 = a2;
  objc_msgSend(v3, "domainDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "providerDisplayName");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  objc_msgSend(v4, "fp_annotatedErrorWithName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 40) && objc_msgSend(v9, "fp_isFileProviderError:", -5007))
  {
    v10 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __55__FPDisconnectDomainOperation__tryDisconnectingSafely___block_invoke_2;
    v11[3] = &unk_1E444EFA0;
    v11[4] = v10;
    v12 = v9;
    objc_msgSend(v10, "tryRecoveringFromError:completion:", v12, v11);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v9);
  }

}

uint64_t __55__FPDisconnectDomainOperation__tryDisconnectingSafely___block_invoke_2(uint64_t result, char a2, uint64_t a3)
{
  void *v3;

  if ((a2 & 1) == 0)
  {
    v3 = *(void **)(result + 32);
    return objc_msgSend(v3, "completedWithResult:error:");
  }
  if (a3 != 1)
  {
    if (a3)
      return result;
    v3 = *(void **)(result + 32);
    return objc_msgSend(v3, "completedWithResult:error:");
  }
  return objc_msgSend(*(id *)(result + 32), "_tryDisconnectingSafely:", 0);
}

- (void)cancel
{
  NSProgress *remoteProgress;
  objc_super v4;

  -[NSProgress cancel](self->_remoteProgress, "cancel");
  remoteProgress = self->_remoteProgress;
  self->_remoteProgress = 0;

  v4.receiver = self;
  v4.super_class = (Class)FPDisconnectDomainOperation;
  -[FPOperation cancel](&v4, sel_cancel);
}

- (void)actionMain
{
  -[FPDisconnectDomainOperation _tryDisconnectingSafely:](self, "_tryDisconnectingSafely:", 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_remoteProgress, 0);
}

@end
