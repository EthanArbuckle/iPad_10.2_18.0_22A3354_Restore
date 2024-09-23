@implementation AAContactsProvider

- (AAContactsProvider)init
{
  AAContactsProvider *v2;
  AAContactsManager *v3;
  AAContactsManager *contactsManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AAContactsProvider;
  v2 = -[AAContactsProvider init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AAContactsManager);
    contactsManager = v2->_contactsManager;
    v2->_contactsManager = v3;

  }
  return v2;
}

- (void)fetchCustodiansAndBeneficiaries:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  AAInheritanceContactsViewModel *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD v17[4];
  NSObject *v18;
  _QWORD *v19;
  _QWORD v20[4];
  NSObject *v21;
  _QWORD *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;

  v4 = a3;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__3;
  v27[4] = __Block_byref_object_dispose__3;
  v28 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__3;
  v25[4] = __Block_byref_object_dispose__3;
  v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__3;
  v23[4] = __Block_byref_object_dispose__3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v6 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __54__AAContactsProvider_fetchCustodiansAndBeneficiaries___block_invoke;
  v20[3] = &unk_1E416EDB0;
  v22 = v27;
  v7 = v5;
  v21 = v7;
  -[AAContactsProvider fetchMyCustodians:](self, "fetchMyCustodians:", v20);
  v8 = objc_alloc_init(AAInheritanceContactsViewModel);
  dispatch_group_enter(v7);
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __54__AAContactsProvider_fetchCustodiansAndBeneficiaries___block_invoke_2;
  v17[3] = &unk_1E416EDB0;
  v19 = v25;
  v9 = v7;
  v18 = v9;
  -[AAInheritanceContactsViewModel fetchBeneficiaries:](v8, "fetchBeneficiaries:", v17);
  dispatch_get_global_queue(2, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __54__AAContactsProvider_fetchCustodiansAndBeneficiaries___block_invoke_3;
  v12[3] = &unk_1E416EE28;
  v15 = v25;
  v16 = v23;
  v13 = v4;
  v14 = v27;
  v11 = v4;
  dispatch_group_notify(v9, v10, v12);

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);

  _Block_object_dispose(v27, 8);
}

void __54__AAContactsProvider_fetchCustodiansAndBeneficiaries___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __54__AAContactsProvider_fetchCustodiansAndBeneficiaries___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __54__AAContactsProvider_fetchCustodiansAndBeneficiaries___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  _QWORD v9[4];
  __int128 v10;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__AAContactsProvider_fetchCustodiansAndBeneficiaries___block_invoke_4;
  v9[3] = &unk_1E416EDD8;
  v10 = *(_OWORD *)(a1 + 48);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v9);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __54__AAContactsProvider_fetchCustodiansAndBeneficiaries___block_invoke_5;
  v8[3] = &unk_1E416EE00;
  v8[4] = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = (id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "copy");
  (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);

}

void __54__AAContactsProvider_fetchCustodiansAndBeneficiaries___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v5 = a2;
  if (objc_msgSend(v3, "containsObject:", v5))
    v4 = 5;
  else
    v4 = 1;
  objc_msgSend(v5, "setContactType:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v5);

}

void __54__AAContactsProvider_fetchCustodiansAndBeneficiaries___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "containsObject:") & 1) == 0)
  {
    objc_msgSend(v3, "setContactType:", 4);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);
  }

}

- (void)fetchCustodianshipsAndBenefactors:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  AAInheritanceContactsViewModel *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD v17[4];
  NSObject *v18;
  _QWORD *v19;
  _QWORD v20[4];
  NSObject *v21;
  _QWORD *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;

  v4 = a3;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__3;
  v27[4] = __Block_byref_object_dispose__3;
  v28 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__3;
  v25[4] = __Block_byref_object_dispose__3;
  v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__3;
  v23[4] = __Block_byref_object_dispose__3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v6 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __56__AAContactsProvider_fetchCustodianshipsAndBenefactors___block_invoke;
  v20[3] = &unk_1E416EDB0;
  v22 = v27;
  v7 = v5;
  v21 = v7;
  -[AAContactsProvider fetchMyCustodianshipOwners:](self, "fetchMyCustodianshipOwners:", v20);
  v8 = objc_alloc_init(AAInheritanceContactsViewModel);
  dispatch_group_enter(v7);
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __56__AAContactsProvider_fetchCustodianshipsAndBenefactors___block_invoke_2;
  v17[3] = &unk_1E416EDB0;
  v19 = v25;
  v9 = v7;
  v18 = v9;
  -[AAInheritanceContactsViewModel fetchBenefactors:](v8, "fetchBenefactors:", v17);
  dispatch_get_global_queue(2, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __56__AAContactsProvider_fetchCustodianshipsAndBenefactors___block_invoke_3;
  v12[3] = &unk_1E416EE28;
  v15 = v25;
  v16 = v23;
  v13 = v4;
  v14 = v27;
  v11 = v4;
  dispatch_group_notify(v9, v10, v12);

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);

  _Block_object_dispose(v27, 8);
}

void __56__AAContactsProvider_fetchCustodianshipsAndBenefactors___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __56__AAContactsProvider_fetchCustodianshipsAndBenefactors___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __56__AAContactsProvider_fetchCustodianshipsAndBenefactors___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  _QWORD v9[4];
  __int128 v10;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__AAContactsProvider_fetchCustodianshipsAndBenefactors___block_invoke_4;
  v9[3] = &unk_1E416EDD8;
  v10 = *(_OWORD *)(a1 + 48);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v9);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __56__AAContactsProvider_fetchCustodianshipsAndBenefactors___block_invoke_5;
  v8[3] = &unk_1E416EE00;
  v8[4] = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = (id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "copy");
  (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);

}

void __56__AAContactsProvider_fetchCustodianshipsAndBenefactors___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v5 = a2;
  if (objc_msgSend(v3, "containsObject:", v5))
    v4 = 10;
  else
    v4 = 2;
  objc_msgSend(v5, "setContactType:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v5);

}

void __56__AAContactsProvider_fetchCustodianshipsAndBenefactors___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "containsObject:") & 1) == 0)
  {
    objc_msgSend(v3, "setContactType:", 8);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);
  }

}

- (void)fetchSuggestedCustodians:(id)a3
{
  id v3;
  AACustodianController *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = objc_alloc_init(AACustodianController);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__AAContactsProvider_fetchSuggestedCustodians___block_invoke;
  v6[3] = &unk_1E416EE50;
  v7 = v3;
  v5 = v3;
  -[AACustodianController fetchSuggestedCustodiansWithCompletion:](v4, "fetchSuggestedCustodiansWithCompletion:", v6);

}

void __47__AAContactsProvider_fetchSuggestedCustodians___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "count"))
    v3 = v4;
  else
    v3 = (id)MEMORY[0x1E0C9AA60];
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v3);

}

- (void)fetchMyCachedCustodians:(id)a3
{
  id v4;
  AACustodianController *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_alloc_init(AACustodianController);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__AAContactsProvider_fetchMyCachedCustodians___block_invoke;
  v7[3] = &unk_1E416EE78;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[AACustodianController fetchCachedTrustedContactsWithCompletion:](v5, "fetchCachedTrustedContactsWithCompletion:", v7);

}

void __46__AAContactsProvider_fetchMyCachedCustodians___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(v6, "count");
  v4 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_localContactsForCustodians:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v4 + 16))(*(_QWORD *)(a1 + 40), MEMORY[0x1E0C9AA60]);
  }

}

- (void)fetchMyCustodians:(id)a3
{
  id v4;
  AACustodianController *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_alloc_init(AACustodianController);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__AAContactsProvider_fetchMyCustodians___block_invoke;
  v7[3] = &unk_1E416EE78;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[AACustodianController fetchTrustedContactsWithCompletion:](v5, "fetchTrustedContactsWithCompletion:", v7);

}

void __40__AAContactsProvider_fetchMyCustodians___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(v6, "count");
  v4 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_localContactsForCustodians:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v4 + 16))(*(_QWORD *)(a1 + 40), MEMORY[0x1E0C9AA60]);
  }

}

- (void)fetchMyHealthyCustodians:(id)a3
{
  id v4;
  AACustodianController *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_alloc_init(AACustodianController);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__AAContactsProvider_fetchMyHealthyCustodians___block_invoke;
  v7[3] = &unk_1E416EE78;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[AACustodianController fetchTrustedContactsWithCompletion:](v5, "fetchTrustedContactsWithCompletion:", v7);

}

void __47__AAContactsProvider_fetchMyHealthyCustodians___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "status", (_QWORD)v13) == 2)
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_localContactsForCustodians:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

}

- (void)fetchMyWalrusEligibleCustodians:(id)a3
{
  id v4;
  AACustodianController *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_alloc_init(AACustodianController);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__AAContactsProvider_fetchMyWalrusEligibleCustodians___block_invoke;
  v7[3] = &unk_1E416EE78;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[AACustodianController fetchTrustedContactsWithCompletion:](v5, "fetchTrustedContactsWithCompletion:", v7);

}

void __54__AAContactsProvider_fetchMyWalrusEligibleCustodians___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void (*v7)(void);
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a3)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v13, "status", (_QWORD)v16) == 2
            && objc_msgSend(v13, "isAcceptedAndShared")
            && objc_msgSend(v13, "isIdMSConfirmed")
            && objc_msgSend(v13, "preflightStatus"))
          {

            v14 = *(_QWORD *)(a1 + 40);
            objc_msgSend(*(id *)(a1 + 32), "_localContactsForCustodians:", v8);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(uint64_t, void *, _QWORD))(v14 + 16))(v14, v15, 0);

            goto LABEL_16;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v10)
          continue;
        break;
      }
    }

    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v7();
LABEL_16:

}

- (void)fetchWalrusEligibleCustodiansForExpansionCohortsWithCompletion:(id)a3
{
  id v4;
  AACustodianController *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_alloc_init(AACustodianController);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__AAContactsProvider_fetchWalrusEligibleCustodiansForExpansionCohortsWithCompletion___block_invoke;
  v7[3] = &unk_1E416EE78;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[AACustodianController fetchTrustedContactsWithCompletion:](v5, "fetchTrustedContactsWithCompletion:", v7);

}

void __85__AAContactsProvider_fetchWalrusEligibleCustodiansForExpansionCohortsWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void (*v7)(void);
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a3)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v13, "status", (_QWORD)v16) == 2
            && objc_msgSend(v13, "isAcceptedAndShared")
            && objc_msgSend(v13, "isIdMSConfirmed")
            && objc_msgSend(v13, "preflightStatus")
            || objc_msgSend(v13, "status") == 1)
          {

            v14 = *(_QWORD *)(a1 + 40);
            objc_msgSend(*(id *)(a1 + 32), "_localContactsForCustodians:", v8);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(uint64_t, void *, _QWORD))(v14 + 16))(v14, v15, 0);

            goto LABEL_18;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v10)
          continue;
        break;
      }
    }

    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v7();
LABEL_18:

}

- (void)fetchMyCustodianshipOwners:(id)a3
{
  id v4;
  AACustodianController *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_alloc_init(AACustodianController);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__AAContactsProvider_fetchMyCustodianshipOwners___block_invoke;
  v7[3] = &unk_1E416EE78;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[AACustodianController fetchCustodianshipInfoWithCompletion:](v5, "fetchCustodianshipInfoWithCompletion:", v7);

}

void __49__AAContactsProvider_fetchMyCustodianshipOwners___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "status", (_QWORD)v13) == 2)
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_localContactsForCustodianshipOwners:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

}

- (void)fetchSuggestedBeneficiaries:(id)a3
{
  id v3;
  AAInheritanceContactsViewModel *v4;

  v3 = a3;
  v4 = objc_alloc_init(AAInheritanceContactsViewModel);
  -[AAInheritanceContactsViewModel fetchSuggestedBeneficiaries:](v4, "fetchSuggestedBeneficiaries:", v3);

}

- (void)fetchMyBeneficiaries:(id)a3
{
  id v3;
  AAInheritanceContactsViewModel *v4;

  v3 = a3;
  v4 = objc_alloc_init(AAInheritanceContactsViewModel);
  -[AAInheritanceContactsViewModel fetchBeneficiaries:](v4, "fetchBeneficiaries:", v3);

}

- (void)fetchMyBenefactors:(id)a3
{
  id v3;
  AAInheritanceContactsViewModel *v4;

  v3 = a3;
  v4 = objc_alloc_init(AAInheritanceContactsViewModel);
  -[AAInheritanceContactsViewModel fetchBenefactors:](v4, "fetchBenefactors:", v3);

}

- (id)_localContactsForCustodians:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  AAContactsManager *contactsManager;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  AALocalContactInfo *v17;
  void *v18;
  AALocalContactInfo *v19;
  AALocalContactInfo *v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v29 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        contactsManager = self->_contactsManager;
        objc_msgSend(v8, "handle");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[AAContactsManager contactForHandle:](contactsManager, "contactForHandle:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v11, "givenName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "trim");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "length"))
          {
            objc_msgSend(v11, "familyName");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "trim");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "length");

            if (v16)
            {
              v17 = [AALocalContactInfo alloc];
              objc_msgSend(v8, "handle");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = -[AALocalContactInfo initWithHandle:contact:](v17, "initWithHandle:contact:", v18, v11);
              goto LABEL_12;
            }
          }
          else
          {

          }
        }
        v20 = [AALocalContactInfo alloc];
        objc_msgSend(v8, "handle");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "firstName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lastName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[AALocalContactInfo initWithHandle:firstName:lastName:](v20, "initWithHandle:firstName:lastName:", v18, v21, v22);

LABEL_12:
        objc_msgSend(v8, "custodianID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[AALocalContactInfo setCustodianID:](v19, "setCustodianID:", v23);

        -[AALocalContactInfo setTrustedContactStatus:](v19, "setTrustedContactStatus:", objc_msgSend(v8, "status"));
        -[AALocalContactInfo setIsAcceptedAndShared:](v19, "setIsAcceptedAndShared:", objc_msgSend(v8, "isAcceptedAndShared"));
        -[AALocalContactInfo setIsIdMSConfirmed:](v19, "setIsIdMSConfirmed:", objc_msgSend(v8, "isIdMSConfirmed"));
        -[AALocalContactInfo setPreflightStatus:](v19, "setPreflightStatus:", objc_msgSend(v8, "preflightStatus"));
        -[AALocalContactInfo setContactType:](v19, "setContactType:", 1);
        objc_msgSend(v27, "addObject:", v19);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v5);
  }

  return v27;
}

- (id)_localContactsForCustodianshipOwners:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  AAContactsManager *contactsManager;
  void *v12;
  void *v13;
  AALocalContactInfo *v14;
  void *v15;
  AALocalContactInfo *v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        contactsManager = self->_contactsManager;
        objc_msgSend(v10, "ownerHandle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[AAContactsManager contactForHandle:](contactsManager, "contactForHandle:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = [AALocalContactInfo alloc];
        objc_msgSend(v10, "ownerHandle");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[AALocalContactInfo initWithHandle:contact:](v14, "initWithHandle:contact:", v15, v13);

        objc_msgSend(v10, "custodianID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[AALocalContactInfo setCustodianID:](v16, "setCustodianID:", v17);

        -[AALocalContactInfo setTrustedContactStatus:](v16, "setTrustedContactStatus:", objc_msgSend(v10, "status"));
        -[AALocalContactInfo setContactType:](v16, "setContactType:", 2);
        objc_msgSend(v5, "addObject:", v16);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

  v18 = (void *)objc_msgSend(v5, "copy");
  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactsManager, 0);
}

@end
