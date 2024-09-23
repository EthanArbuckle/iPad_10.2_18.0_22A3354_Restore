@implementation NPFamilyEligibilityProvider

- (NPFamilyEligibilityProvider)init
{
  NPFamilyEligibilityProvider *v2;
  uint64_t v3;
  ACAccountStore *store;
  id v5;
  void *v6;
  uint64_t v7;
  AIDAAccountManager *accountManager;
  id v9;
  void *v10;
  uint64_t v11;
  FAFamilyEligibilityRequester *eligibilityRequester;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NPFamilyEligibilityProvider;
  v2 = -[NPFamilyEligibilityProvider init](&v14, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v3 = objc_claimAutoreleasedReturnValue();
    store = v2->_store;
    v2->_store = (ACAccountStore *)v3;

    v5 = objc_alloc(MEMORY[0x1E0CFCF50]);
    -[NPFamilyEligibilityProvider store](v2, "store");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "initWithAccountStore:", v6);
    accountManager = v2->_accountManager;
    v2->_accountManager = (AIDAAccountManager *)v7;

    -[AIDAAccountManager setDelegate:](v2->_accountManager, "setDelegate:", v2);
    v9 = objc_alloc(MEMORY[0x1E0D20EE8]);
    -[NPFamilyEligibilityProvider accountManager](v2, "accountManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithAccountManager:", v10);
    eligibilityRequester = v2->_eligibilityRequester;
    v2->_eligibilityRequester = (FAFamilyEligibilityRequester *)v11;

  }
  return v2;
}

- (ACAccountStore)store
{
  return self->_store;
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (id)requestFamilyEligibility
{
  id v3;
  _QWORD v5[5];

  v3 = objc_alloc(MEMORY[0x1E0D60AF0]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__NPFamilyEligibilityProvider_requestFamilyEligibility__block_invoke;
  v5[3] = &unk_1E7211E10;
  v5[4] = self;
  return (id)objc_msgSend(v3, "initWithResolver:", v5);
}

void __55__NPFamilyEligibilityProvider_requestFamilyEligibility__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  os_log_t *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  v7 = (os_log_t *)MEMORY[0x1E0D58748];
  v8 = *MEMORY[0x1E0D58748];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D58748], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BA2EF000, v8, OS_LOG_TYPE_DEFAULT, "Requesting aa_primaryAppleAccount", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "accountManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accountStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "aa_primaryAppleAccount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BA2EF000, v12, OS_LOG_TYPE_DEFAULT, "Requesting Family Eligibility", buf, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "eligibilityRequester");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __55__NPFamilyEligibilityProvider_requestFamilyEligibility__block_invoke_23;
    v14[3] = &unk_1E7211DE8;
    v14[4] = *(_QWORD *)(a1 + 32);
    v15 = v5;
    objc_msgSend(v13, "requestFamilyEligibilityWithCompletion:", v14);

  }
  else
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __55__NPFamilyEligibilityProvider_requestFamilyEligibility__block_invoke_20;
    v16[3] = &unk_1E7211DC0;
    v16[4] = v5;
    __55__NPFamilyEligibilityProvider_requestFamilyEligibility__block_invoke_20((uint64_t)v16);
  }

}

void __55__NPFamilyEligibilityProvider_requestFamilyEligibility__block_invoke_20(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __55__NPFamilyEligibilityProvider_requestFamilyEligibility__block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _BYTE v16[22];
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)*MEMORY[0x1E0D58748];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D58748], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = objc_opt_class();
    v10 = objc_msgSend(v5, "eligible");
    v11 = CFSTR("NO");
    *(_DWORD *)v16 = 138413058;
    *(_QWORD *)&v16[4] = v9;
    *(_WORD *)&v16[12] = 2114;
    if (v10)
      v11 = CFSTR("YES");
    *(_QWORD *)&v16[14] = v5;
    v17 = 2114;
    v18 = v11;
    v19 = 2114;
    v20 = v6;
    _os_log_impl(&dword_1BA2EF000, v8, OS_LOG_TYPE_DEFAULT, "%@ requestFamilyEligibility completed with resonse:%{public}@  eligible: %{public}@ error:%{public}@", v16, 0x2Au);

  }
  if (v5 && objc_msgSend(v5, "eligible"))
  {
    v12 = *(_QWORD *)(a1 + 40);
    v13 = (void *)MEMORY[0x1E0CB37E8];
    v14 = 1;
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 40);
    v13 = (void *)MEMORY[0x1E0CB37E8];
    v14 = 0;
  }
  objc_msgSend(v13, "numberWithBool:", v14, *(_OWORD *)v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v15);

}

- (id)accountsForAccountManager:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "accountStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "aa_primaryAppleAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CFCF18]);
  v8 = (void *)objc_msgSend(v5, "copy");

  return v8;
}

- (FAFamilyEligibilityRequester)eligibilityRequester
{
  return self->_eligibilityRequester;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eligibilityRequester, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end
