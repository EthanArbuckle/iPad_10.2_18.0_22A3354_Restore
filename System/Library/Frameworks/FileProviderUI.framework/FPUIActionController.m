@implementation FPUIActionController

+ (id)actionControllerForActionIdentifier:(id)a3 actionTitle:(id)a4 items:(id)a5 providerIdentifier:(id)a6 domainIdentifier:(id)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  FPUIActionController *v14;
  uint64_t v15;
  NSString *providerIdentifier;
  uint64_t v17;
  NSString *actionIdentifier;
  uint64_t v19;
  NSArray *items;
  uint64_t v21;
  NSString *domainIdentifier;

  v10 = a7;
  v11 = a6;
  v12 = a5;
  v13 = a3;
  v14 = objc_alloc_init(FPUIActionController);
  v15 = objc_msgSend(v11, "copy");

  providerIdentifier = v14->_providerIdentifier;
  v14->_providerIdentifier = (NSString *)v15;

  v17 = objc_msgSend(v13, "copy");
  actionIdentifier = v14->_actionIdentifier;
  v14->_actionIdentifier = (NSString *)v17;

  v19 = objc_msgSend(v12, "copy");
  items = v14->_items;
  v14->_items = (NSArray *)v19;

  v21 = objc_msgSend(v10, "copy");
  domainIdentifier = v14->_domainIdentifier;
  v14->_domainIdentifier = (NSString *)v21;

  return v14;
}

- (id)performActionWithCompletionHandler:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x24BDC83A0];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithActionIdentifier:providerDomainID:itemIdentifiers:", self->_actionIdentifier, self->_domainIdentifier, self->_items);
  objc_msgSend(v6, "setActionCompletionBlock:", v5);

  objc_msgSend(MEMORY[0x24BDC82F0], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scheduleAction:", v6);

  objc_msgSend(v6, "progress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_getExtensionWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;

  v5 = (void *)MEMORY[0x24BDD1550];
  -[FPUIActionController providerIdentifier](self, "providerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v5, "extensionWithIdentifier:error:", v6, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;

  if (!v7)
  {
    v9 = fpuiLogHandle;
    if (!fpuiLogHandle)
    {
      FPUIInitLogging();
      v9 = fpuiLogHandle;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[FPUIActionViewController _getExtensionWithError:].cold.1(v9, self);
      if (!a3)
        goto LABEL_7;
      goto LABEL_6;
    }
    if (a3)
LABEL_6:
      *a3 = objc_retainAutorelease(v8);
  }
LABEL_7:

  return v7;
}

- (void)_delegateError:(id)a3
{
  -[FPUIActionController _delegateDidFinishWithUserInfo:error:](self, "_delegateDidFinishWithUserInfo:error:", 0, a3);
}

- (void)_delegateDidFinishWithUserInfo:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = fpuiLogHandle;
  if (v7)
  {
    if (!fpuiLogHandle)
    {
      FPUIInitLogging();
      v8 = fpuiLogHandle;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[FPUIActionViewController _delegateDidFinishWithUserInfo:error:].cold.1(v8, self);
  }
  else
  {
    if (!fpuiLogHandle)
    {
      FPUIInitLogging();
      v8 = fpuiLogHandle;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = v8;
      -[FPUIActionController actionIdentifier](self, "actionIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v10;
      _os_log_impl(&dword_2278C8000, v9, OS_LOG_TYPE_INFO, "Action with identifier (%@) did finish.", (uint8_t *)&v15, 0xCu);

    }
  }
  -[FPUIActionController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  -[FPUIActionController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((v12 & 1) != 0)
    objc_msgSend(v13, "actionControllerDidFinishAction:userInfo:error:", self, v6, v7);
  else
    objc_msgSend(v13, "actionControllerDidFinishAction:error:", self, v7);

}

- (void)remoteActionContextDidFinishAction:(id)a3 userInfo:(id)a4 error:(id)a5
{
  -[FPUIActionController _delegateDidFinishWithUserInfo:error:](self, "_delegateDidFinishWithUserInfo:error:", a4, a5);
}

- (void)remoteActionContext:(id)a3 didEncounterError:(id)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  char v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  void (**v14)(_QWORD);
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (void (**)(_QWORD))a5;
  -[FPUIActionController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __80__FPUIActionController_remoteActionContext_didEncounterError_completionHandler___block_invoke;
    block[3] = &unk_24EFEDFC8;
    block[4] = self;
    v13 = v7;
    v14 = v8;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    v11 = fpuiLogHandle;
    if (!fpuiLogHandle)
    {
      FPUIInitLogging();
      v11 = fpuiLogHandle;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v7;
      _os_log_impl(&dword_2278C8000, v11, OS_LOG_TYPE_INFO, "An error occurred on the service side, but the client won't present it: %@", buf, 0xCu);
    }
    v8[2](v8);
  }

}

void __80__FPUIActionController_remoteActionContext_didEncounterError_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionController:presentError:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (NSArray)items
{
  return self->_items;
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (FPUIActionControllerDelegate)delegate
{
  return (FPUIActionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
}

@end
