@implementation LACDTOPolicyProcessorEmptyPasscode

- (LACDTOPolicyProcessorEmptyPasscode)initWithCredentialStore:(id)a3 device:(id)a4
{
  id v7;
  id v8;
  LACDTOPolicyProcessorEmptyPasscode *v9;
  LACDTOPolicyProcessorEmptyPasscode *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LACDTOPolicyProcessorEmptyPasscode;
  v9 = -[LACDTOPolicyProcessorEmptyPasscode init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_store, a3);
    objc_storeStrong((id *)&v10->_device, a4);
  }

  return v10;
}

- (BOOL)canProcessRequest:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1081);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  LACDTOPolicyProcessorEmptyPasscode *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  LACLogDTOProcessor();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = self;
    _os_log_impl(&dword_2409DC000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ started", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __78__LACDTOPolicyProcessorEmptyPasscode_processRequest_configuration_completion___block_invoke;
  v13[3] = &unk_2510C13D0;
  objc_copyWeak(&v15, (id *)buf);
  v12 = v10;
  v14 = v12;
  -[LACDTOPolicyProcessorEmptyPasscode _processAndEvaluateRequest:completion:](self, "_processAndEvaluateRequest:completion:", v8, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

}

void __78__LACDTOPolicyProcessorEmptyPasscode_processRequest_configuration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  LACLogDTOProcessor();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = 138543362;
    v7 = WeakRetained;
    _os_log_impl(&dword_2409DC000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ finished", (uint8_t *)&v6, 0xCu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_processAndEvaluateRequest:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  LACCredentialStore *store;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  void (**v26)(id, void *);
  id v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  LACDTOPolicyProcessorEmptyPasscode *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (!-[LACDTOPolicyProcessorEmptyPasscode canProcessRequest:](self, "canProcessRequest:", v6))
  {
LABEL_6:
    +[LACEvaluationResult resultWithNext:](LACEvaluationResult, "resultWithNext:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v14);

    goto LABEL_7;
  }
  if (!-[LACDTODeviceInfoProvider hasPasscodeSetForUser:](self->_device, "hasPasscodeSetForUser:", objc_msgSend(v6, "evaluationUserId")))
  {
    objc_msgSend(v6, "options");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1000);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "BOOLValue");

    if (!v18)
    {
      objc_initWeak((id *)buf, self);
      store = self->_store;
      +[LACSecureData secureDataWithData:](LACSecureData, "secureDataWithData:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = MEMORY[0x24BDAC760];
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __76__LACDTOPolicyProcessorEmptyPasscode__processAndEvaluateRequest_completion___block_invoke;
      v28[3] = &unk_2510C13F8;
      v22 = v6;
      v29 = v22;
      __76__LACDTOPolicyProcessorEmptyPasscode__processAndEvaluateRequest_completion___block_invoke((uint64_t)v28);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v21;
      v24[1] = 3221225472;
      v24[2] = __76__LACDTOPolicyProcessorEmptyPasscode__processAndEvaluateRequest_completion___block_invoke_2;
      v24[3] = &unk_2510C1420;
      objc_copyWeak(&v27, (id *)buf);
      v26 = v7;
      v25 = v22;
      -[LACCredentialStore setValue:forCredential:completion:](store, "setValue:forCredential:completion:", v20, v23, v24);

      objc_destroyWeak(&v27);
      objc_destroyWeak((id *)buf);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v8 = objc_alloc(MEMORY[0x24BDBCED8]);
  objc_msgSend(v6, "options");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithDictionary:", v9);

  LACLogDTOProcessor();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v31 = self;
    v32 = 1024;
    v33 = 1081;
    v34 = 1024;
    v35 = objc_msgSend(v6, "evaluationUserId");
    _os_log_impl(&dword_2409DC000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Removing %d option because user %d has passcode", buf, 0x18u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1081);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v12);

  objc_msgSend(v6, "updateOptions:", v10);
  +[LACEvaluationResult resultWithNext:](LACEvaluationResult, "resultWithNext:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v13);

LABEL_7:
}

LACMutableCredentialRequest *__76__LACDTOPolicyProcessorEmptyPasscode__processAndEvaluateRequest_completion___block_invoke(uint64_t a1)
{
  LACMutableCredentialRequest *v2;
  void *v3;

  v2 = objc_alloc_init(LACMutableCredentialRequest);
  -[LACMutableCredentialRequest setCredential:](v2, "setCredential:", -1);
  objc_msgSend(*(id *)(a1 + 32), "externalizedContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACMutableCredentialRequest setExternalizedContext:](v2, "setExternalizedContext:", v3);

  -[LACMutableCredentialRequest setUserID:](v2, "setUserID:", objc_msgSend(*(id *)(a1 + 32), "evaluationUserId"));
  return v2;
}

void __76__LACDTOPolicyProcessorEmptyPasscode__processAndEvaluateRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    LACLogDTOProcessor();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      v9 = 138543618;
      v10 = WeakRetained;
      v11 = 2114;
      v12 = v3;
      _os_log_impl(&dword_2409DC000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ failed err=%{public}@", (uint8_t *)&v9, 0x16u);

    }
    +[LACEvaluationResult resultWithFailure:](LACEvaluationResult, "resultWithFailure:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    +[LACEvaluationResult resultWithNext:](LACEvaluationResult, "resultWithNext:", *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end
