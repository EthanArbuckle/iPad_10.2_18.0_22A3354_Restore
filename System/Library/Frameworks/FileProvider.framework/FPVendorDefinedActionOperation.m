@implementation FPVendorDefinedActionOperation

- (FPVendorDefinedActionOperation)initWithActionIdentifier:(id)a3 providerDomainID:(id)a4 itemIdentifiers:(id)a5
{
  id v10;
  id v11;
  id v12;
  FPVendorDefinedActionOperation *v13;
  FPVendorDefinedActionOperation *v14;
  uint64_t v15;
  NSString *domainIdentifier;
  void *v18;
  void *v19;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v12, "count"))
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPActionOperation.m"), 1563, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemIdentifiers.count > 0"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPActionOperation.m"), 1564, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("providerDomainID != nil"));

LABEL_3:
  v20.receiver = self;
  v20.super_class = (Class)FPVendorDefinedActionOperation;
  v13 = -[FPActionOperation initWithProvider:action:](&v20, sel_initWithProvider_action_, v11, 0);
  v14 = v13;
  if (v13)
  {
    -[FPActionOperation setSetupRemoteOperationService:](v13, "setSetupRemoteOperationService:", 1);
    objc_storeStrong((id *)&v14->_actionIdentifier, a3);
    objc_storeStrong((id *)&v14->_itemIdentifiers, a5);
    objc_msgSend(v11, "fp_toDomainIdentifier");
    v15 = objc_claimAutoreleasedReturnValue();
    domainIdentifier = v14->_domainIdentifier;
    v14->_domainIdentifier = (NSString *)v15;

  }
  return v14;
}

- (void)actionMain
{
  void *v3;
  NSString *actionIdentifier;
  NSArray *itemIdentifiers;
  NSString *domainIdentifier;
  NSProgress *v7;
  NSProgress *remoteProgress;
  _QWORD v9[5];

  -[FPActionOperation remoteServiceProxy](self, "remoteServiceProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  actionIdentifier = self->_actionIdentifier;
  itemIdentifiers = self->_itemIdentifiers;
  domainIdentifier = self->_domainIdentifier;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__FPVendorDefinedActionOperation_actionMain__block_invoke;
  v9[3] = &unk_1E444A598;
  v9[4] = self;
  objc_msgSend(v3, "performActionWithIdentifier:onItemsWithIdentifiers:domainIdentifier:completionHandler:", actionIdentifier, itemIdentifiers, domainIdentifier, v9);
  v7 = (NSProgress *)objc_claimAutoreleasedReturnValue();
  remoteProgress = self->_remoteProgress;
  self->_remoteProgress = v7;

}

uint64_t __44__FPVendorDefinedActionOperation_actionMain__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, a2);
}

- (void)cancel
{
  NSProgress *remoteProgress;
  objc_super v4;

  -[NSProgress cancel](self->_remoteProgress, "cancel");
  remoteProgress = self->_remoteProgress;
  self->_remoteProgress = 0;

  v4.receiver = self;
  v4.super_class = (Class)FPVendorDefinedActionOperation;
  -[FPOperation cancel](&v4, sel_cancel);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteProgress, 0);
}

@end
