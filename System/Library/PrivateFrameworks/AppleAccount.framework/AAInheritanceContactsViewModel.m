@implementation AAInheritanceContactsViewModel

- (AAInheritanceContactsViewModel)init
{
  AAInheritanceContactsViewModel *v2;
  AAInheritanceController *v3;
  AAInheritanceController *inheritanceController;
  AAContactsManager *v5;
  AAContactsManager *contactsManager;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AAInheritanceContactsViewModel;
  v2 = -[AAInheritanceContactsViewModel init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AAInheritanceController);
    inheritanceController = v2->_inheritanceController;
    v2->_inheritanceController = v3;

    v5 = objc_alloc_init(AAContactsManager);
    contactsManager = v2->_contactsManager;
    v2->_contactsManager = v5;

  }
  return v2;
}

- (void)fetchBeneficiaries:(id)a3
{
  id v4;
  AAInheritanceController *inheritanceController;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  inheritanceController = self->_inheritanceController;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__AAInheritanceContactsViewModel_fetchBeneficiaries___block_invoke;
  v7[3] = &unk_1E416EE78;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[AAInheritanceController fetchBeneficiariesWithCompletion:](inheritanceController, "fetchBeneficiariesWithCompletion:", v7);

}

void __53__AAInheritanceContactsViewModel_fetchBeneficiaries___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __53__AAInheritanceContactsViewModel_fetchBeneficiaries___block_invoke_cold_1();

  }
  else if (objc_msgSend(v5, "count"))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __53__AAInheritanceContactsViewModel_fetchBeneficiaries___block_invoke_16;
    v11[3] = &unk_1E416FE90;
    v8 = *(void **)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 32);
    v13 = v9;
    v11[4] = v10;
    v12 = v5;
    objc_msgSend(v8, "_fetchInvitationStatuses:", v11);

    goto LABEL_8;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_8:

}

void __53__AAInheritanceContactsViewModel_fetchBeneficiaries___block_invoke_16(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_localBeneficiaries:invitationStatuses:", *(_QWORD *)(a1 + 40), a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (void)fetchBenefactors:(id)a3
{
  id v4;
  AAInheritanceController *inheritanceController;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  inheritanceController = self->_inheritanceController;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__AAInheritanceContactsViewModel_fetchBenefactors___block_invoke;
  v7[3] = &unk_1E416EE78;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[AAInheritanceController fetchBenefactorsWithCompletion:](inheritanceController, "fetchBenefactorsWithCompletion:", v7);

}

void __51__AAInheritanceContactsViewModel_fetchBenefactors___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void (*v8)(void);
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __51__AAInheritanceContactsViewModel_fetchBenefactors___block_invoke_cold_1();

    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v9 = objc_msgSend(v5, "count");
    v10 = *(_QWORD *)(a1 + 40);
    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "_localBenefactors:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

      goto LABEL_8;
    }
    v8 = *(void (**)(void))(v10 + 16);
  }
  v8();
LABEL_8:

}

- (void)fetchSuggestedBeneficiaries:(id)a3
{
  id v4;
  AAInheritanceController *inheritanceController;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  inheritanceController = self->_inheritanceController;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__AAInheritanceContactsViewModel_fetchSuggestedBeneficiaries___block_invoke;
  v7[3] = &unk_1E416EE50;
  v8 = v4;
  v6 = v4;
  -[AAInheritanceController fetchSuggestedBeneficiariesWithCompletion:](inheritanceController, "fetchSuggestedBeneficiariesWithCompletion:", v7);

}

void __62__AAInheritanceContactsViewModel_fetchSuggestedBeneficiaries___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void (*v6)(void);

  v4 = a3;
  if (v4)
  {
    _AALogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __62__AAInheritanceContactsViewModel_fetchSuggestedBeneficiaries___block_invoke_cold_1();

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v6();

}

- (void)_fetchInvitationStatuses:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__AAInheritanceContactsViewModel__fetchInvitationStatuses___block_invoke;
  v8[3] = &unk_1E416FEB8;
  v9 = v5;
  v10 = v4;
  v6 = v4;
  v7 = v5;
  -[AAInheritanceContactsViewModel _fetchInvitations:](self, "_fetchInvitations:", v8);

}

void __59__AAInheritanceContactsViewModel__fetchInvitationStatuses___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v9 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "status"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "beneficiaryID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "UUIDString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v10, v12);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_fetchInvitations:(id)a3
{
  id v4;
  AAInheritanceController *inheritanceController;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  inheritanceController = self->_inheritanceController;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__AAInheritanceContactsViewModel__fetchInvitations___block_invoke;
  v7[3] = &unk_1E416EE50;
  v8 = v4;
  v6 = v4;
  -[AAInheritanceController fetchInvitationsWithCompletion:](inheritanceController, "fetchInvitationsWithCompletion:", v7);

}

void __52__AAInheritanceContactsViewModel__fetchInvitations___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void (*v6)(void);

  v4 = a3;
  if (v4)
  {
    _AALogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __52__AAInheritanceContactsViewModel__fetchInvitations___block_invoke_cold_1();

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v6();

}

- (id)_localBeneficiaries:(id)a3 invitationStatuses:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__AAInheritanceContactsViewModel__localBeneficiaries_invitationStatuses___block_invoke;
  v10[3] = &unk_1E416FEE0;
  v10[4] = self;
  v11 = v6;
  v7 = v6;
  objc_msgSend(a3, "aaf_map:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __73__AAInheritanceContactsViewModel__localBeneficiaries_invitationStatuses___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_localContact:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setInheritanceContactInfo:", v4);
  objc_msgSend(v6, "setContactType:", 4);
  v7 = *(void **)(a1 + 40);
  objc_msgSend(v4, "beneficiaryID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = objc_msgSend(v10, "integerValue");
  else
    v11 = -1;
  objc_msgSend(v6, "setTrustedContactStatus:", v11);

  return v6;
}

- (id)_localBenefactors:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__AAInheritanceContactsViewModel__localBenefactors___block_invoke;
  v4[3] = &unk_1E416FF08;
  v4[4] = self;
  objc_msgSend(a3, "aaf_map:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __52__AAInheritanceContactsViewModel__localBenefactors___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_localContact:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setInheritanceContactInfo:", v3);
  objc_msgSend(v5, "setContactType:", 8);
  objc_msgSend(v3, "accessKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = 2;
  else
    v7 = 1;
  objc_msgSend(v5, "setTrustedContactStatus:", v7);

  return v5;
}

- (id)_localContact:(id)a3
{
  AAContactsManager *contactsManager;
  id v4;
  void *v5;
  AALocalContactInfo *v6;

  contactsManager = self->_contactsManager;
  v4 = a3;
  -[AAContactsManager contactForHandle:](contactsManager, "contactForHandle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AALocalContactInfo initWithHandle:contact:]([AALocalContactInfo alloc], "initWithHandle:contact:", v4, v5);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactsManager, 0);
  objc_storeStrong((id *)&self->_inheritanceController, 0);
}

void __53__AAInheritanceContactsViewModel_fetchBeneficiaries___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_19EACA000, v0, v1, "%{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __51__AAInheritanceContactsViewModel_fetchBenefactors___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_19EACA000, v0, v1, "%{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __62__AAInheritanceContactsViewModel_fetchSuggestedBeneficiaries___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_19EACA000, v0, v1, "%{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __52__AAInheritanceContactsViewModel__fetchInvitations___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_19EACA000, v0, v1, "%{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
