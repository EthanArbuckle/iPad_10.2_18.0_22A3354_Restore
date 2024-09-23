@implementation FABuyStorageHook

- (BOOL)shouldMatchElement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("family:buyStorage"));

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "clientInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE04C48]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("family:buyStorage"));

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  -[FABuyStorageHook _invokeBuyStorageWithServerAttributes:completion:](self, "_invokeBuyStorageWithServerAttributes:completion:", a4, a6, a5);
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "clientInfo");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[FABuyStorageHook _invokeBuyStorageWithServerAttributes:completion:](self, "_invokeBuyStorageWithServerAttributes:completion:", v7, v6);

}

- (void)_invokeBuyStorageWithServerAttributes:(id)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id completion;
  id WeakRetained;
  ICQUICloudStorageOffersManager *v11;
  ICQUICloudStorageOffersManager *storageOffersManager;
  void *v13;
  char v14;
  void *v15;
  NSObject *v16;
  void (**v17)(id, _QWORD, void *);
  void *v18;
  id v19;
  uint8_t v20[16];
  uint8_t buf[16];

  v6 = a3;
  if (self->_loadingStorage)
  {
    _FALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DE41000, v7, OS_LOG_TYPE_DEFAULT, "Already loading storage. Bailing", buf, 2u);
    }
  }
  else
  {
    self->_loadingStorage = 1;
    v8 = _Block_copy(a4);
    completion = self->_completion;
    self->_completion = v8;

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "presentationContextForHook:", self);
    v7 = objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (ICQUICloudStorageOffersManager *)objc_alloc_init(MEMORY[0x24BEC7470]);
      storageOffersManager = self->_storageOffersManager;
      self->_storageOffersManager = v11;

      -[ICQUICloudStorageOffersManager setDelegate:](self->_storageOffersManager, "setDelegate:", self);
      -[ICQUICloudStorageOffersManager setShouldOfferFamilySharePlansOnly:](self->_storageOffersManager, "setShouldOfferFamilySharePlansOnly:", 1);
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("requiredStorageThreshold"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_opt_respondsToSelector();

      if ((v14 & 1) != 0)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("requiredStorageThreshold"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICQUICloudStorageOffersManager setRequiredStorageThreshold:](self->_storageOffersManager, "setRequiredStorageThreshold:", objc_msgSend(v15, "longLongValue"));

      }
      -[ICQUICloudStorageOffersManager beginFlowWithNavigationController:modally:](self->_storageOffersManager, "beginFlowWithNavigationController:modally:", v7, 1);
    }
    else
    {
      _FALogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_20DE41000, v16, OS_LOG_TYPE_DEFAULT, "Unable to present buy storage, we need a navigation controller", v20, 2u);
      }

      v17 = (void (**)(id, _QWORD, void *))self->_completion;
      if (v17)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE30900], -1000, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v17[2](v17, 0, v18);

        v19 = self->_completion;
        self->_completion = 0;

      }
    }
  }

}

- (void)manager:(id)a3 loadDidFailWithError:(id)a4
{
  -[FABuyStorageHook _completionWithSuccess:error:](self, "_completionWithSuccess:error:", 0, a4);
}

- (void)manager:(id)a3 didCompleteWithError:(id)a4
{
  -[FABuyStorageHook _completionWithSuccess:error:](self, "_completionWithSuccess:error:", 1, a4);
}

- (void)managerDidCancel:(id)a3
{
  -[FABuyStorageHook _completionWithSuccess:error:](self, "_completionWithSuccess:error:", 0, 0);
}

- (void)_completionWithSuccess:(BOOL)a3 error:(id)a4
{
  void (**completion)(id, BOOL, id);

  self->_loadingStorage = 0;
  completion = (void (**)(id, BOOL, id))self->_completion;
  if (completion)
  {
    completion[2](completion, a3, a4);
    completion = (void (**)(id, BOOL, id))self->_completion;
  }
  self->_completion = 0;

}

- (RUIServerHookDelegate)delegate
{
  return (RUIServerHookDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_storageOffersManager, 0);
}

@end
