@implementation AAUIPaymentVerificationHook

- (BOOL)shouldMatchElement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ams:paymentVerification"));

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
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("ams:paymentVerification"));

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  -[AAUIPaymentVerificationHook _validatePaymentVerificationWithServerAttributes:objectModel:completion:](self, "_validatePaymentVerificationWithServerAttributes:objectModel:completion:", a4, a5, a6);
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
  -[AAUIPaymentVerificationHook _validatePaymentVerificationWithServerAttributes:objectModel:completion:](self, "_validatePaymentVerificationWithServerAttributes:objectModel:completion:", v8, v7, v6);

}

- (void)_validatePaymentVerificationWithServerAttributes:(id)a3 objectModel:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD block[4];
  id v36;
  id v37;
  uint8_t buf[4];
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__AAUIPaymentVerificationHook__validatePaymentVerificationWithServerAttributes_objectModel_completion___block_invoke;
  block[3] = &unk_1EA2DB778;
  v11 = v9;
  v36 = v11;
  v12 = v8;
  v37 = v12;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  _AAUILogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v39 = v12;
    _os_log_impl(&dword_1DB4ED000, v13, OS_LOG_TYPE_DEFAULT, "Payment Verification invoked : %@", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "presentationContextForHook:", self);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0CFD9E8];
  objc_msgSend(getAMSUIPaymentVerificationTokenFetchTaskClass(), "bagSubProfile");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getAMSUIPaymentVerificationTokenFetchTaskClass(), "bagSubProfileVersion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bagForProfile:profileVersion:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_alloc((Class)getAMSUIPaymentVerificationTokenFetchTaskClass());
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("verificationMode"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "integerValue");
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("accountName"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v20, "initWithMode:accountParameters:viewController:bag:displayName:", v22, v12, v15, v19, v23);

  objc_msgSend(v24, "performTask");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __103__AAUIPaymentVerificationHook__validatePaymentVerificationWithServerAttributes_objectModel_completion___block_invoke_2;
    v29[3] = &unk_1EA2DCD88;
    v29[4] = self;
    v31 = v10;
    v30 = v11;
    objc_msgSend(v25, "addFinishBlock:", v29);

    v26 = v31;
  }
  else
  {
    _AAUILogSystem();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[AAUIPaymentVerificationHook _validatePaymentVerificationWithServerAttributes:objectModel:completion:].cold.1(v27);

    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __103__AAUIPaymentVerificationHook__validatePaymentVerificationWithServerAttributes_objectModel_completion___block_invoke_24;
    v32[3] = &unk_1EA2DB138;
    v33 = v11;
    v34 = v10;
    v28 = (void *)MEMORY[0x1E0C80D38];
    dispatch_async(MEMORY[0x1E0C80D38], v32);

    v26 = v33;
  }

}

uint64_t __103__AAUIPaymentVerificationHook__validatePaymentVerificationWithServerAttributes_objectModel_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startActivityIndicatorWithAttributes:", *(_QWORD *)(a1 + 40));
}

void __103__AAUIPaymentVerificationHook__validatePaymentVerificationWithServerAttributes_objectModel_completion___block_invoke_24(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "stopActivityIndicator");
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", -3);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

  }
}

void __103__AAUIPaymentVerificationHook__validatePaymentVerificationWithServerAttributes_objectModel_completion___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  AAUIServerHookResponse *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(id, uint64_t, _QWORD);
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  const __CFString *v21;
  void *v22;
  uint8_t buf[4];
  const __CFString *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _AAUILogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "tokenData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("YES");
    if (!v8)
      v9 = CFSTR("NO");
    *(_DWORD *)buf = 138412546;
    v24 = v9;
    v25 = 2112;
    v26 = v6;
    _os_log_impl(&dword_1DB4ED000, v7, OS_LOG_TYPE_DEFAULT, "PaymentVerificationTokenFetch retuned with token %@ error : %@", buf, 0x16u);

  }
  objc_msgSend(v5, "tokenData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc_init(AAUIServerHookResponse);
    objc_msgSend(a1[4], "setServerHookResponse:", v11);

    v21 = CFSTR("token");
    objc_msgSend(v5, "tokenData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "base64EncodedStringWithOptions:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "serverHookResponse");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAdditionalPayload:", v14);

    v16 = (void (**)(id, uint64_t, _QWORD))a1[6];
    if (v16)
      v16[2](v16, 1, 0);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __103__AAUIPaymentVerificationHook__validatePaymentVerificationWithServerAttributes_objectModel_completion___block_invoke_32;
    block[3] = &unk_1EA2DB3E8;
    v18 = a1[5];
    v20 = a1[6];
    v19 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __103__AAUIPaymentVerificationHook__validatePaymentVerificationWithServerAttributes_objectModel_completion___block_invoke_32(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "stopActivityIndicator");
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 40));
  return result;
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
}

- (void)_validatePaymentVerificationWithServerAttributes:(os_log_t)log objectModel:completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB4ED000, log, OS_LOG_TYPE_ERROR, "Unable to perform payment verification!", v1, 2u);
}

@end
