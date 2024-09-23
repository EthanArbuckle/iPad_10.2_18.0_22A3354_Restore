@implementation CRKASMEasyMAIDSignInRosterProvider

- (CRKASMEasyMAIDSignInRosterProvider)initWithRosterProviderGenerator:(id)a3
{
  id v4;
  CRKASMEasyMAIDSignInRosterProvider *v5;
  uint64_t v6;
  id providerGenerator;
  uint64_t v8;
  CRKASMRosterProviderConfiguration *configuration;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRKASMEasyMAIDSignInRosterProvider;
  v5 = -[CRKASMEasyMAIDSignInRosterProvider init](&v11, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x219A226E8](v4);
    providerGenerator = v5->_providerGenerator;
    v5->_providerGenerator = (id)v6;

    +[CRKASMRosterProviderConfiguration instructorRosterWithoutKeychainConfiguration](CRKASMRosterProviderConfiguration, "instructorRosterWithoutKeychainConfiguration");
    v8 = objc_claimAutoreleasedReturnValue();
    configuration = v5->_configuration;
    v5->_configuration = (CRKASMRosterProviderConfiguration *)v8;

  }
  return v5;
}

- (CRKASMRosterProviding)instructorRosterProviderWithoutKeychain
{
  CRKASMRosterProviding *instructorRosterProviderWithoutKeychain;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  CRKASMRosterProviding *v6;
  CRKASMRosterProviding *v7;

  instructorRosterProviderWithoutKeychain = self->_instructorRosterProviderWithoutKeychain;
  if (!instructorRosterProviderWithoutKeychain)
  {
    -[CRKASMEasyMAIDSignInRosterProvider providerGenerator](self, "providerGenerator");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[CRKASMEasyMAIDSignInRosterProvider configuration](self, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v4)[2](v4, v5);
    v6 = (CRKASMRosterProviding *)objc_claimAutoreleasedReturnValue();
    v7 = self->_instructorRosterProviderWithoutKeychain;
    self->_instructorRosterProviderWithoutKeychain = v6;

    instructorRosterProviderWithoutKeychain = self->_instructorRosterProviderWithoutKeychain;
  }
  return instructorRosterProviderWithoutKeychain;
}

- (void)fetchEligibilityForEasyMAIDSignInWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  CRKASMEasyMAIDSignInRosterProvider *v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  _QWORD v22[4];
  id v23;
  id v24;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __86__CRKASMEasyMAIDSignInRosterProvider_fetchEligibilityForEasyMAIDSignInWithCompletion___block_invoke;
  v22[3] = &unk_24D9C9290;
  v7 = v4;
  v24 = v7;
  v8 = v5;
  v23 = v8;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x219A226E8](v22);
  v10 = -[CRKASMEasyMAIDSignInRosterProvider isEasyStudentSignInDisabledByServer](self, "isEasyStudentSignInDisabledByServer");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("isEasyStudentSignInDisabledByServer"));

  if (v10)
    goto LABEL_4;
  -[CRKASMEasyMAIDSignInRosterProvider configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rosterRequirements");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "accountState");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("accountState"));

  if (v14 != 2)
  {
LABEL_4:
    v9[2](v9, 0, 0);
  }
  else
  {
    -[CRKASMEasyMAIDSignInRosterProvider configuration](self, "configuration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "rosterRequirements");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v6;
    v18[1] = 3221225472;
    v18[2] = __86__CRKASMEasyMAIDSignInRosterProvider_fetchEligibilityForEasyMAIDSignInWithCompletion___block_invoke_2;
    v18[3] = &unk_24D9C9308;
    v21 = v9;
    v19 = v8;
    v20 = self;
    objc_msgSend(v17, "currentUserWithCompletion:", v18);

  }
}

void __86__CRKASMEasyMAIDSignInRosterProvider_fetchEligibilityForEasyMAIDSignInWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a3;
  v7 = (id)objc_msgSend(v5, "copy");
  (*(void (**)(uint64_t, uint64_t, id, id))(v4 + 16))(v4, a2, v7, v6);

}

void __86__CRKASMEasyMAIDSignInRosterProvider_fetchEligibilityForEasyMAIDSignInWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __86__CRKASMEasyMAIDSignInRosterProvider_fetchEligibilityForEasyMAIDSignInWithCompletion___block_invoke_3;
  block[3] = &unk_24D9C92B8;
  v12 = v6;
  v16 = *(id *)(a1 + 48);
  v13 = v5;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v14 = v7;
  v15 = v8;
  v9 = v5;
  v10 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __86__CRKASMEasyMAIDSignInRosterProvider_fetchEligibilityForEasyMAIDSignInWithCompletion___block_invoke_3(uint64_t a1)
{
  void (*v2)(void);
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
  }
  else
  {
    v3 = objc_msgSend(*(id *)(a1 + 40), "hasEDUAccount");
    v4 = objc_msgSend(*(id *)(a1 + 40), "isStudent") ^ 1;
    objc_msgSend(*(id *)(a1 + 40), "person");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v6, CFSTR("appleID"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v7, CFSTR("hasEDUAccount"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v8, CFSTR("isNonStudent"));

    if ((_DWORD)v3 && (v4 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 56), "configuration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "rosterRequirements");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "person");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "makeQueryForLocationsAllowingEasyStudentSignInForPersonID:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __86__CRKASMEasyMAIDSignInRosterProvider_fetchEligibilityForEasyMAIDSignInWithCompletion___block_invoke_4;
      v16[3] = &unk_24D9C92E0;
      v19 = *(id *)(a1 + 64);
      v17 = *(id *)(a1 + 48);
      v18 = *(id *)(a1 + 40);
      objc_msgSend(v13, "setCompletion:", v16);
      objc_msgSend(*(id *)(a1 + 56), "configuration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "rosterRequirements");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "executeQuery:", v13);

      return;
    }
    v2 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
  }
  v2();
}

void __86__CRKASMEasyMAIDSignInRosterProvider_fetchEligibilityForEasyMAIDSignInWithCompletion___block_invoke_4(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __86__CRKASMEasyMAIDSignInRosterProvider_fetchEligibilityForEasyMAIDSignInWithCompletion___block_invoke_5;
  block[3] = &unk_24D9C92B8;
  v10 = v6;
  v14 = a1[6];
  v11 = v5;
  v12 = a1[4];
  v13 = a1[5];
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __86__CRKASMEasyMAIDSignInRosterProvider_fetchEligibilityForEasyMAIDSignInWithCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
    return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), 0);
  v3 = objc_msgSend(*(id *)(a1 + 40), "count");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v4, CFSTR("countOfLocationsAllowingEasyMAIDSignIn"));

  if (_CRKLogGeneral_onceToken_19 != -1)
    dispatch_once(&_CRKLogGeneral_onceToken_19, &__block_literal_global_61);
  v5 = (void *)_CRKLogGeneral_logObj_19;
  if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_19, OS_LOG_TYPE_INFO))
  {
    v6 = *(void **)(a1 + 56);
    v7 = v5;
    objc_msgSend(v6, "person");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 134218242;
    v11 = v3;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_218C99000, v7, OS_LOG_TYPE_INFO, "Found %lu locations allowing EasyMAID for %{public}@", (uint8_t *)&v10, 0x16u);

  }
  return (*(uint64_t (**)(_QWORD, BOOL, _QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), v3 != 0, 0);
}

- (BOOL)isEasyStudentSignInDisabledByServer
{
  void *v2;
  char v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x24BE0ADF0], "sharedBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = objc_msgSend(v2, "easyStudentSignInDisabled");
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v4 = 0;
      goto LABEL_7;
    }
    v3 = objc_msgSend(v2, "isEasyStudentSignInDisabled");
  }
  v4 = v3;
LABEL_7:

  return v4;
}

- (CRKASMRosterProviderConfiguration)configuration
{
  return self->_configuration;
}

- (id)providerGenerator
{
  return self->_providerGenerator;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_providerGenerator, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_instructorRosterProviderWithoutKeychain, 0);
}

@end
