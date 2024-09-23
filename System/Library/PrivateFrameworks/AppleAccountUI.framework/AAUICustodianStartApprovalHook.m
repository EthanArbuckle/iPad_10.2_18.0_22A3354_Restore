@implementation AAUICustodianStartApprovalHook

- (BOOL)shouldMatchElement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("custodian:startApproval"));

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "clientInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("action"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("custodian:startApproval"));

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  -[AAUICustodianStartApprovalHook _startApprovalWithServerAttributes:objectModel:completion:](self, "_startApprovalWithServerAttributes:objectModel:completion:", a4, a5, a6);
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "clientInfo");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[AAUICustodianStartApprovalHook _startApprovalWithServerAttributes:objectModel:completion:](self, "_startApprovalWithServerAttributes:objectModel:completion:", v8, v7, v6);

}

- (void)_startApprovalWithServerAttributes:(id)a3 objectModel:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("sessionId"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("resetEligible"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "presentationContextForHook:", self);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[AAUICustodianRecoveryApprovalController approvalControllerWithPresenter:recoverySessionID:](AAUICustodianRecoveryApprovalController, "approvalControllerWithPresenter:recoverySessionID:", v14, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setIsResetEligible:", v12 != 0);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __92__AAUICustodianStartApprovalHook__startApprovalWithServerAttributes_objectModel_completion___block_invoke;
  v18[3] = &unk_1EA2DDC10;
  v19 = v8;
  v20 = v9;
  v16 = v8;
  v17 = v9;
  objc_msgSend(v15, "validateRecoveryCodeWithCompletion:", v18);

}

void __92__AAUICustodianStartApprovalHook__startApprovalWithServerAttributes_objectModel_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  objc_msgSend(v14, "custodianUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 || !v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "serverInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v14, "custodianUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("custodianUUID"));

    objc_msgSend(v14, "custodianRecoveryToken");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("custodianRecoveryToken"));

    objc_msgSend(v14, "recoverySessionID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("sessionId"));

    v13 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(*(id *)(a1 + 32), "setServerInfo:", v13);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

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
}

@end
