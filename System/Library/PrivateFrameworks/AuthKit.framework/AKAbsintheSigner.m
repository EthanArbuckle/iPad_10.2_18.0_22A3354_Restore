@implementation AKAbsintheSigner

+ (id)sharedSigner
{
  if (sharedSigner_onceToken_0 != -1)
    dispatch_once(&sharedSigner_onceToken_0, &__block_literal_global_37);
  return (id)sharedSigner_sharedSigner_0;
}

void __32__AKAbsintheSigner_sharedSigner__block_invoke()
{
  AKAbsintheSigner *v0;
  void *v1;

  v0 = objc_alloc_init(AKAbsintheSigner);
  v1 = (void *)sharedSigner_sharedSigner_0;
  sharedSigner_sharedSigner_0 = (uint64_t)v0;

}

- (id)signatureForURLRequest:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  id v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__10;
  v16 = __Block_byref_object_dispose__10;
  v17 = 0;
  v5 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__AKAbsintheSigner_signatureForURLRequest___block_invoke;
  v9[3] = &unk_1E2E60F58;
  v11 = &v12;
  v6 = v5;
  v10 = v6;
  -[AKAbsintheSigner signatureForURLRequest:completionHandler:](self, "signatureForURLRequest:completionHandler:", v4, v9);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __43__AKAbsintheSigner_signatureForURLRequest___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)signatureForURLRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__AKAbsintheSigner_signatureForURLRequest_completionHandler___block_invoke;
  v10[3] = &unk_1E2E60F80;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[AKAbsintheSigner _createSigningContextWithCompletionHandler:](self, "_createSigningContextWithCompletionHandler:", v10);

}

uint64_t __61__AKAbsintheSigner_signatureForURLRequest_completionHandler___block_invoke(uint64_t a1, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "_generateSignatureForRequest:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_generateSignatureForRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NACContextOpaque_ *context;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _BYTE buf[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  objc_msgSend(v6, "valueForHTTPHeaderField:", CFSTR("X-MMe-Client-Info"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataUsingEncoding:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    _AKLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[AKAbsintheSigner _generateSignatureForRequest:completionHandler:].cold.2();

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", "L", 1);
  }
  _AKLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v6;
    _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "Generating signature for body of URL request: %@...", buf, 0xCu);
  }

  *(_QWORD *)buf = 0;
  context = self->_context;
  v13 = objc_retainAutorelease(v9);
  t1BoNctgaUu66((uint64_t)context, objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"), (uint64_t)buf);
  if ((_DWORD)v14)
  {
    v15 = v14;
    _AKLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[AKAbsintheSigner _generateSignatureForRequest:completionHandler:].cold.1(v15, v16);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AKAbsintheErrorDomain"), -9002, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v17);
  }
  else
  {
    if (*(_QWORD *)buf)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", *(_QWORD *)buf, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      Be81a395Bf0(*(uint64_t *)buf);
    }
    else
    {
      v17 = 0;
    }
    objc_msgSend(v17, "base64EncodedStringWithOptions:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v7)[2](v7, v18, 0);

  }
}

- (void)_createSigningContextWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  if (!self->_context)
    goto LABEL_4;
  if (-[AKAbsintheSigner _didSigningContextExpire](self, "_didSigningContextExpire"))
  {
    -[AKAbsintheSigner _destroySigningContext](self, "_destroySigningContext");
LABEL_4:
    _AKLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19202F000, v5, OS_LOG_TYPE_DEFAULT, "Creating new signing context...", buf, 2u);
    }

    +[AKURLBag bagForAltDSID:](AKURLBag, "bagForAltDSID:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __63__AKAbsintheSigner__createSigningContextWithCompletionHandler___block_invoke;
    v8[3] = &unk_1E2E60DA8;
    v8[4] = self;
    v9 = v4;
    objc_msgSend(v6, "requestNewURLBagIfNecessaryWithCompletion:", v8);

    goto LABEL_10;
  }
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[AKAbsintheSigner _createSigningContextWithCompletionHandler:].cold.1();

  (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
LABEL_10:

}

void __63__AKAbsintheSigner__createSigningContextWithCompletionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v5 = a3;
  if (a2)
  {
    +[AKURLBag bagForAltDSID:](AKURLBag, "bagForAltDSID:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "absintheCertURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      +[AKURLBag bagForAltDSID:](AKURLBag, "bagForAltDSID:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "absintheSessionURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:", v7);
        objc_msgSend(v10, "ak_addClientInfoHeader");
        +[AKURLSession sharedURLSession](AKURLSession, "sharedURLSession");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __63__AKAbsintheSigner__createSigningContextWithCompletionHandler___block_invoke_10;
        v16[3] = &unk_1E2E60FA8;
        v16[4] = *(_QWORD *)(a1 + 32);
        v17 = v9;
        v18 = *(id *)(a1 + 40);
        v12 = (id)objc_msgSend(v11, "beginDataTaskWithRequest:completionHandler:", v10, v16);

      }
      else
      {
        _AKLogSystem();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          __63__AKAbsintheSigner__createSigningContextWithCompletionHandler___block_invoke_cold_2();

        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }

    }
    else
    {
      _AKLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __63__AKAbsintheSigner__createSigningContextWithCompletionHandler___block_invoke_cold_1();

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
  else
  {
    _AKLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __63__AKAbsintheSigner__createSigningContextWithCompletionHandler___block_invoke_cold_3();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __63__AKAbsintheSigner__createSigningContextWithCompletionHandler___block_invoke_10(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v7 && !v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "_sessionInfoFromCertificateData:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "_establishSessionWithInfo:sessionURL:completionHandler:", v11, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }
    else
    {
      v13 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AKAbsintheErrorDomain"), -9003, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v14);

    }
    goto LABEL_11;
  }
  if (!v9)
  {
    v15 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AKAbsintheErrorDomain"), -9004, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v15 + 16))(v15, 0, v11);
LABEL_11:

    goto LABEL_12;
  }
  _AKLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    __63__AKAbsintheSigner__createSigningContextWithCompletionHandler___block_invoke_10_cold_1(v10, v12);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_12:

}

- (id)_sessionInfoFromCertificateData:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v10;

  v3 = a3;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[AKAbsintheSigner _sessionInfoFromCertificateData:].cold.3(v3, v4);

  v5 = objc_retainAutorelease(v3);
  KxmB0CKvgWt(objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));
  if ((_DWORD)v6)
  {
    v7 = v6;
    _AKLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AKAbsintheSigner _sessionInfoFromCertificateData:].cold.2(v7, v8);

  }
  else
  {
    _AKLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[AKAbsintheSigner _sessionInfoFromCertificateData:].cold.1();

  }
  return 0;
}

- (void)_establishSessionWithInfo:(id)a3 sessionURL:(id)a4 completionHandler:(id)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;

  v8 = a5;
  v9 = (objc_class *)MEMORY[0x1E0C92C28];
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend([v9 alloc], "initWithURL:", v10);

  objc_msgSend(v11, "base64EncodedStringWithOptions:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setValue:forHTTPHeaderField:", v13, CFSTR("X-MMe-Nas-Session"));
  objc_msgSend(v12, "ak_addClientInfoHeader");
  +[AKURLSession sharedURLSession](AKURLSession, "sharedURLSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __75__AKAbsintheSigner__establishSessionWithInfo_sessionURL_completionHandler___block_invoke;
  v17[3] = &unk_1E2E60FD0;
  v17[4] = self;
  v18 = v8;
  v15 = v8;
  v16 = (id)objc_msgSend(v14, "beginDataTaskWithRequest:completionHandler:", v12, v17);

}

void __75__AKAbsintheSigner__establishSessionWithInfo_sessionURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint8_t v34[8];
  id v35;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v7)
  {
    v35 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, &v35);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v35;
    if (v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v7, 4);
      _AKLogSystem();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        __75__AKAbsintheSigner__establishSessionWithInfo_sessionURL_completionHandler___block_invoke_cold_6();

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      goto LABEL_14;
    }
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("session-info"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      _AKLogSystem();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        __75__AKAbsintheSigner__establishSessionWithInfo_sessionURL_completionHandler___block_invoke_cold_2(v23, v24, v25);

      v26 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AKAbsintheErrorDomain"), -9005, 0);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, id))(v26 + 16))(v26, 0, v14);
      goto LABEL_30;
    }
    v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v13, 0);
    _AKLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        __75__AKAbsintheSigner__establishSessionWithInfo_sessionURL_completionHandler___block_invoke_cold_5();

      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v14 = objc_retainAutorelease(v14);
      nDYmeMqvWb(v17, objc_msgSend(v14, "bytes"), objc_msgSend(v14, "length"));
      v19 = v18;
      _AKLogSystem();
      v20 = objc_claimAutoreleasedReturnValue();
      v16 = v20;
      if (!(_DWORD)v19)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v34 = 0;
          _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "NACKeyEstablishment for new context. Ready for use!", v34, 2u);
        }

        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = *(_QWORD *)(a1 + 32);
        v33 = *(void **)(v32 + 16);
        *(_QWORD *)(v32 + 16) = v31;

        (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 1, 0);
        goto LABEL_30;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        __75__AKAbsintheSigner__establishSessionWithInfo_sessionURL_completionHandler___block_invoke_cold_4(v19, v16);
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __75__AKAbsintheSigner__establishSessionWithInfo_sessionURL_completionHandler___block_invoke_cold_3(v16, v27, v28);
    }

    v29 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AKAbsintheErrorDomain"), -9005, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v29 + 16))(v29, 0, v30);

LABEL_30:
LABEL_14:

    goto LABEL_20;
  }
  if (v9)
  {
    _AKLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      __75__AKAbsintheSigner__establishSessionWithInfo_sessionURL_completionHandler___block_invoke_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_20:

}

- (void)_destroySigningContext
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Attempting to destroy absinthe context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)dealloc
{
  objc_super v3;

  -[AKAbsintheSigner _destroySigningContext](self, "_destroySigningContext");
  v3.receiver = self;
  v3.super_class = (Class)AKAbsintheSigner;
  -[AKAbsintheSigner dealloc](&v3, sel_dealloc);
}

- (BOOL)_didSigningContextExpire
{
  void *v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", self->_contextCreationDate);
  LOBYTE(self) = v4 > 240.0;

  return (char)self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextCreationDate, 0);
}

- (void)_generateSignatureForRequest:(uint64_t)a1 completionHandler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8_0(&dword_19202F000, a2, v4, "NACSign failed with status %@.", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_generateSignatureForRequest:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Nothing to sign. Using dummy data.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_createSigningContextWithCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Using a previously generated Absinthe context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __63__AKAbsintheSigner__createSigningContextWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "No URL for Absinthe signing cert!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __63__AKAbsintheSigner__createSigningContextWithCompletionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "No URL for Absinthe signing session!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __63__AKAbsintheSigner__createSigningContextWithCompletionHandler___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Failed to fetch URL bag prior to Absinthe signing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __63__AKAbsintheSigner__createSigningContextWithCompletionHandler___block_invoke_10_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8_0(&dword_19202F000, a2, v4, "No Absinthe cert! Error: %@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_sessionInfoFromCertificateData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "NACInit did not return an session info bytes!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_sessionInfoFromCertificateData:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8_0(&dword_19202F000, a2, v4, "NACInit failed with status: %@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_sessionInfoFromCertificateData:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "length"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_19202F000, a2, OS_LOG_TYPE_DEBUG, "Got Absinthe cert: %@ bytes", v4, 0xCu);

  OUTLINED_FUNCTION_2_0();
}

void __75__AKAbsintheSigner__establishSessionWithInfo_sessionURL_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8_0(&dword_19202F000, v0, v1, "Request for Absinthe session failed with error: %@", v2);
  OUTLINED_FUNCTION_1();
}

void __75__AKAbsintheSigner__establishSessionWithInfo_sessionURL_completionHandler___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = CFSTR("session-info");
  OUTLINED_FUNCTION_8_0(&dword_19202F000, a1, a3, "Missing value for key %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void __75__AKAbsintheSigner__establishSessionWithInfo_sessionURL_completionHandler___block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = CFSTR("session-info");
  OUTLINED_FUNCTION_8_0(&dword_19202F000, a1, a3, "Invalid value for key %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void __75__AKAbsintheSigner__establishSessionWithInfo_sessionURL_completionHandler___block_invoke_cold_4(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8_0(&dword_19202F000, a2, v4, "NACKeyEstablishment failed with result: %@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __75__AKAbsintheSigner__establishSessionWithInfo_sessionURL_completionHandler___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Calling NACKeyEstablishment...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __75__AKAbsintheSigner__establishSessionWithInfo_sessionURL_completionHandler___block_invoke_cold_6()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_19202F000, v1, OS_LOG_TYPE_ERROR, "Could not parse Absinthe session response data: %@. Details: %@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
