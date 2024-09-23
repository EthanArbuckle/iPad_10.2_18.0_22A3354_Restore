@implementation AAUIBeneficiaryClaimNotificationHook

- (BOOL)shouldMatchModel:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "clientInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("action"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("beneficiary:contactName"));

  return v5;
}

- (BOOL)shouldMatchElement:(id)a3
{
  return 0;
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD *v16;
  _QWORD v17[5];
  id v18;

  v6 = a3;
  v7 = a4;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__4;
  v17[4] = __Block_byref_object_dispose__4;
  objc_msgSend(v6, "pages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "clientInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("beneficiaryUUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__AAUIBeneficiaryClaimNotificationHook_processObjectModel_completion___block_invoke;
  v13[3] = &unk_1EA2DBF10;
  v11 = v7;
  v15 = v11;
  v16 = v17;
  v12 = v6;
  v14 = v12;
  -[AAUIBeneficiaryClaimNotificationHook _beneficiaryContactNameForBeneficiaryID:completion:](self, "_beneficiaryContactNameForBeneficiaryID:completion:", v10, v13);

  _Block_object_dispose(v17, 8);
}

void __70__AAUIBeneficiaryClaimNotificationHook_processObjectModel_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  _QWORD block[4];
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__AAUIBeneficiaryClaimNotificationHook_processObjectModel_completion___block_invoke_2;
    block[3] = &unk_1EA2DB110;
    v7 = &v16;
    v16 = *(id *)(a1 + 40);
    v8 = &v15;
    v15 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __70__AAUIBeneficiaryClaimNotificationHook_processObjectModel_completion___block_invoke_3;
    v9[3] = &unk_1EA2DBEE8;
    v13 = *(_QWORD *)(a1 + 48);
    v7 = &v10;
    v10 = v5;
    v8 = &v11;
    v11 = *(id *)(a1 + 32);
    v12 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], v9);

  }
}

uint64_t __70__AAUIBeneficiaryClaimNotificationHook_processObjectModel_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __70__AAUIBeneficiaryClaimNotificationHook_processObjectModel_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "tableViewOM");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "clientInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("targetQuery"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHTMLContent:toElementsMatchingQuery:", v6, v8);

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  (*((void (**)(id, uint64_t, _QWORD))a6 + 2))(a6, 1, 0);
}

- (void)_beneficiaryContactNameForBeneficiaryID:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0CFAC88]);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __91__AAUIBeneficiaryClaimNotificationHook__beneficiaryContactNameForBeneficiaryID_completion___block_invoke;
  v10[3] = &unk_1EA2DBF60;
  v11 = v5;
  v12 = v6;
  v8 = v5;
  v9 = v6;
  objc_msgSend(v7, "fetchBeneficiariesWithCompletion:", v10);

}

void __91__AAUIBeneficiaryClaimNotificationHook__beneficiaryContactNameForBeneficiaryID_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB3880];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __91__AAUIBeneficiaryClaimNotificationHook__beneficiaryContactNameForBeneficiaryID_completion___block_invoke_2;
    v15[3] = &unk_1EA2DBF38;
    v16 = *(id *)(a1 + 32);
    objc_msgSend(v6, "predicateWithBlock:", v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filteredArrayUsingPredicate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CFACD8];
    objc_msgSend(v9, "handle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contactInfoForHandle:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v12, "fullName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v13 + 16))(v13, v14, 0);

  }
}

uint64_t __91__AAUIBeneficiaryClaimNotificationHook__beneficiaryContactNameForBeneficiaryID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "beneficiaryID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (RUIObjectModel)objectModel
{
  return self->_objectModel;
}

- (void)setObjectModel:(id)a3
{
  objc_storeStrong((id *)&self->_objectModel, a3);
}

- (RUIServerHookDelegate)delegate
{
  return (RUIServerHookDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RUIServerHookResponse)serverHookResponse
{
  return self->_serverHookResponse;
}

- (void)setServerHookResponse:(id)a3
{
  objc_storeStrong((id *)&self->_serverHookResponse, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverHookResponse, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_objectModel, 0);
}

@end
