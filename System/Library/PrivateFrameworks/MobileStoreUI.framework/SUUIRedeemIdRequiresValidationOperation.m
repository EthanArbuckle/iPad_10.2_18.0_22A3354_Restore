@implementation SUUIRedeemIdRequiresValidationOperation

- (void)main
{
  void *v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  _QWORD block[5];
  char v14;
  char v15;
  id v16;

  if (-[SUUIRedeemIdRequiresValidationOperation _performAuthentication](self, "_performAuthentication"))
  {
    -[SUUIRedeemIdRequiresValidationOperation _subOperationWithBagKey:](self, "_subOperationWithBagKey:", CFSTR("redeemUserHasIdUrl"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v4 = -[SUUIRedeemIdRequiresValidationOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v3, &v16);
    v5 = v16;
    if (v4)
    {
      objc_msgSend(v3, "dataProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "output");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("status"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0 && !objc_msgSend(v8, "integerValue"))
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("hasNationalId"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        LOBYTE(v4) = objc_opt_isKindOfClass();
        if ((v4 & 1) != 0)
        {
          v10 = 0;
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v9 = objc_msgSend(v12, "BOOLValue") ^ 1;
          else
            v9 = 1;
        }
        else
        {
          v9 = 0;
          v10 = CFSTR("Bad/Non-present hasNationalId.");
        }

      }
      else
      {
        LOBYTE(v4) = 0;
        v9 = 0;
        v10 = CFSTR("Status code != 0.");
      }

    }
    else
    {
      v9 = 0;
      v10 = CFSTR("Failed sub-operation");
    }

    -[SUUIRedeemIdRequiresValidationOperation _logResultsForSuccess:shouldVerify:failureReason:error:](self, "_logResultsForSuccess:shouldVerify:failureReason:error:", v4 & 1, v9, v10, v5);
    if (v5 && (v4 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BEC8BA0], "operationWithError:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setDelegate:", self);
      -[SUUIRedeemIdRequiresValidationOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v11, 0);

      goto LABEL_13;
    }
  }
  else
  {
    -[SUUIRedeemIdRequiresValidationOperation _logResultsForSuccess:shouldVerify:failureReason:error:](self, "_logResultsForSuccess:shouldVerify:failureReason:error:", 0, 0, 0, 0);
    LOBYTE(v9) = 0;
    v5 = 0;
    LOBYTE(v4) = 0;
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__SUUIRedeemIdRequiresValidationOperation_main__block_invoke;
  block[3] = &unk_2511FD560;
  block[4] = self;
  v14 = v4 & 1;
  v15 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
LABEL_13:

}

uint64_t __47__SUUIRedeemIdRequiresValidationOperation_main__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 336) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 336), *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

- (void)operation:(id)a3 selectedButton:(id)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__SUUIRedeemIdRequiresValidationOperation_operation_selectedButton___block_invoke;
  block[3] = &unk_2511F47C0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __68__SUUIRedeemIdRequiresValidationOperation_operation_selectedButton___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 336) + 16))();
}

- (BOOL)_performAuthentication
{
  id v3;
  void *v4;
  void *v5;
  dispatch_semaphore_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  char v12;
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v3 = objc_alloc_init(MEMORY[0x24BEC8B68]);
  -[SUUIRedeemIdRequiresValidationOperation _authenticationContext](self, "_authenticationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requiredUniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  if ((objc_msgSend(v3, "canPerformExtendedBiometricActionsForAccountIdentifier:", v5) & 1) == 0)
  {
    v6 = dispatch_semaphore_create(0);
    v7 = objc_alloc(MEMORY[0x24BEB1DB8]);
    -[SUUIRedeemIdRequiresValidationOperation _authenticationContext](self, "_authenticationContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithAuthenticationContext:", v8);

    -[SUUIRedeemIdRequiresValidationOperation redeemViewController](self, "redeemViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "set_parentViewController:", v10);

    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __65__SUUIRedeemIdRequiresValidationOperation__performAuthentication__block_invoke;
    v14[3] = &unk_2511FD588;
    v16 = &v17;
    v11 = v6;
    v15 = v11;
    objc_msgSend(v9, "startWithAuthenticateResponseBlock:", v14);
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);

  }
  v12 = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v17, 8);

  return v12;
}

intptr_t __65__SUUIRedeemIdRequiresValidationOperation__performAuthentication__block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "authenticatedAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_authenticationContext
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F28]), "initWithAccount:", v3);
    objc_msgSend(v4, "setPromptStyle:", 1);
    objc_msgSend(v4, "setShouldCreateNewSession:", 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB1F28], "contextForSignIn");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)_subOperationWithBagKey:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x24BEC8C30];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v6 = objc_alloc_init(MEMORY[0x24BEB1F30]);
  objc_msgSend(v6, "setITunesStoreRequest:", 1);
  SSVDefaultUserAgent();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forHTTPHeaderField:", v7, CFSTR("User-Agent"));

  objc_msgSend(v6, "setURLBagKey:", v4);
  objc_msgSend(v5, "setRequestProperties:", v6);
  objc_msgSend(MEMORY[0x24BEC8C10], "provider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDataProvider:", v8);

  return v5;
}

- (void)_logResultsForSuccess:(BOOL)a3 shouldVerify:(BOOL)a4 failureReason:(id)a5 error:(id)a6
{
  _BOOL4 v7;
  _BOOL8 v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v7 = a4;
  v8 = a3;
  v16[2] = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = a6;
  v15[0] = CFSTR("success");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = CFSTR("hasNationalId");
  v16[0] = v11;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", !v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  if (v9)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v9, CFSTR("failure reason"));
  if (v10)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, CFSTR("error"));
  SSDebugLog();

}

- (id)resultBlock
{
  return objc_getProperty(self, a2, 336, 1);
}

- (void)setResultBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 336);
}

- (SUUIRedeemViewControllerLegacy)redeemViewController
{
  return (SUUIRedeemViewControllerLegacy *)objc_loadWeakRetained((id *)&self->_redeemViewController);
}

- (void)setRedeemViewController:(id)a3
{
  objc_storeWeak((id *)&self->_redeemViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_redeemViewController);
  objc_storeStrong(&self->_resultBlock, 0);
}

@end
