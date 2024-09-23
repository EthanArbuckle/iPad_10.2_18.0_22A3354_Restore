@implementation FAFamilyEligibilityRequester

- (FAFamilyEligibilityRequester)initWithAccountManager:(id)a3
{
  id v5;
  FAFamilyEligibilityRequester *v6;
  FAFamilyEligibilityRequester *v7;
  NSOperationQueue *v8;
  NSOperationQueue *networkActivityQueue;
  NSOperationQueue *v10;
  void *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FAFamilyEligibilityRequester;
  v6 = -[FAFamilyEligibilityRequester init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountManager, a3);
    v7->_allowsAuthenticationPrompt = 0;
    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    networkActivityQueue = v7->_networkActivityQueue;
    v7->_networkActivityQueue = v8;

    v10 = v7->_networkActivityQueue;
    dispatch_get_global_queue(25, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setUnderlyingQueue:](v10, "setUnderlyingQueue:", v11);

  }
  return v7;
}

- (FAFamilyEligibilityRequester)init
{
  -[FAFamilyEligibilityRequester doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)requestFamilyEligibilityWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD aBlock[5];

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__FAFamilyEligibilityRequester_requestFamilyEligibilityWithCompletion___block_invoke;
  aBlock[3] = &unk_24C88B998;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  v23[0] = v5;
  v23[1] = 3221225472;
  v23[2] = __71__FAFamilyEligibilityRequester_requestFamilyEligibilityWithCompletion___block_invoke_2;
  v23[3] = &unk_24C88B9E8;
  v7 = v4;
  v24 = v7;
  v8 = _Block_copy(v23);
  -[FAFamilyEligibilityRequester _appleAccount](self, "_appleAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v21[0] = v5;
    v21[1] = 3221225472;
    v21[2] = __71__FAFamilyEligibilityRequester_requestFamilyEligibilityWithCompletion___block_invoke_22;
    v21[3] = &unk_24C88BA10;
    v10 = v8;
    v22 = v10;
    v11 = _Block_copy(v21);
    v17[0] = v5;
    v17[1] = 3221225472;
    v17[2] = __71__FAFamilyEligibilityRequester_requestFamilyEligibilityWithCompletion___block_invoke_24;
    v17[3] = &unk_24C88BA88;
    v17[4] = self;
    v12 = v6;
    v18 = v12;
    v19 = v11;
    v20 = v10;
    v13 = v11;
    v14 = _Block_copy(v17);
    (*((void (**)(id, void *))v12 + 2))(v12, v14);

    v15 = v22;
  }
  else
  {
    _FALogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[FAFamilyEligibilityRequester requestFamilyEligibilityWithCompletion:].cold.1(v16);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE30900], -1004, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, _QWORD, void *))v8 + 2))(v8, 0, v15);
  }

}

void __71__FAFamilyEligibilityRequester_requestFamilyEligibilityWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (objc_class *)MEMORY[0x24BE04990];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(*(id *)(a1 + 32), "_grandSlamSigner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v5, "initWithGrandSlamSigner:", v6);

  objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ams_activeiTunesAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setITunesAccount:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE04A18]), "initWithRequest:handler:", v10, v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addOperation:", v9);

}

void __71__FAFamilyEligibilityRequester_requestFamilyEligibilityWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__FAFamilyEligibilityRequester_requestFamilyEligibilityWithCompletion___block_invoke_3;
  block[3] = &unk_24C88B9C0;
  v7 = *(id *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v11 = v5;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __71__FAFamilyEligibilityRequester_requestFamilyEligibilityWithCompletion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __71__FAFamilyEligibilityRequester_requestFamilyEligibilityWithCompletion___block_invoke_22(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint8_t v7[16];

  v3 = a2;
  _FALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_20DE41000, v4, OS_LOG_TYPE_DEFAULT, "Eligibility Callback", v7, 2u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v3, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v3, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE30900], -1002, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);
  }

}

void __71__FAFamilyEligibilityRequester_requestFamilyEligibilityWithCompletion___block_invoke_24(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  uint8_t buf[16];
  uint64_t v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "statusCode") == 401)
  {
    _FALogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DE41000, v4, OS_LOG_TYPE_DEFAULT, "Family eligibility check request returned 401. We need to re-auth...", buf, 2u);
    }

    v18[0] = *MEMORY[0x24BDB4530];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1[4], "allowsAuthenticationPrompt"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v5;
    v18[1] = *MEMORY[0x24BDB4528];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(a1[4], "allowsAuthenticationPrompt") ^ 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v6;
    v18[2] = *MEMORY[0x24BDB4520];
    v17 = *MEMORY[0x24BE04878];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[4], "_accountStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "_appleAccount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __71__FAFamilyEligibilityRequester_requestFamilyEligibilityWithCompletion___block_invoke_28;
    v11[3] = &unk_24C88BA60;
    v13 = a1[5];
    v14 = a1[6];
    v15 = a1[7];
    v12 = v3;
    objc_msgSend(v9, "renewCredentialsForAccount:options:completion:", v10, v8, v11);

  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }

}

void __71__FAFamilyEligibilityRequester_requestFamilyEligibilityWithCompletion___block_invoke_28(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _FALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v11 = a2;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_20DE41000, v6, OS_LOG_TYPE_DEFAULT, "Result of renewing credentials for family eligibility check request: %ld. Error: %@", buf, 0x16u);
  }

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __71__FAFamilyEligibilityRequester_requestFamilyEligibilityWithCompletion___block_invoke_29;
    v7[3] = &unk_24C88BA38;
    v8 = *(id *)(a1 + 40);
    v9 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x24BDAC9B8], v7);

  }
}

uint64_t __71__FAFamilyEligibilityRequester_requestFamilyEligibilityWithCompletion___block_invoke_29(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)_grandSlamSigner
{
  AAGrandSlamSigner *grandSlamSigner;
  void *v4;
  id v5;
  void *v6;
  AAGrandSlamSigner *v7;
  AAGrandSlamSigner *v8;

  grandSlamSigner = self->_grandSlamSigner;
  if (!grandSlamSigner)
  {
    -[AIDAAccountManager aidaAccountForService:](self->_accountManager, "aidaAccountForService:", *MEMORY[0x24BE06080]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x24BE049B0]);
    -[AIDAAccountManager accountStore](self->_accountManager, "accountStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (AAGrandSlamSigner *)objc_msgSend(v5, "initWithAccountStore:grandSlamAccount:appTokenID:", v6, v4, *MEMORY[0x24BE04878]);
    v8 = self->_grandSlamSigner;
    self->_grandSlamSigner = v7;

    grandSlamSigner = self->_grandSlamSigner;
  }
  return grandSlamSigner;
}

- (id)_accountStore
{
  return (id)-[AIDAAccountManager accountStore](self->_accountManager, "accountStore");
}

- (id)_appleAccount
{
  void *v2;
  void *v3;

  -[AIDAAccountManager accounts](self->_accountManager, "accounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BE06080]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)allowsAuthenticationPrompt
{
  return self->_allowsAuthenticationPrompt;
}

- (void)setAllowsAuthenticationPrompt:(BOOL)a3
{
  self->_allowsAuthenticationPrompt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkActivityQueue, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_grandSlamSigner, 0);
}

- (void)requestFamilyEligibilityWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20DE41000, log, OS_LOG_TYPE_ERROR, "No Primary Apple Account provided, cannot check family eligibility", v1, 2u);
}

@end
