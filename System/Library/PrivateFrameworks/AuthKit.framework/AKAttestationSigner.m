@implementation AKAttestationSigner

+ (AKAttestationSigner)sharedSigner
{
  if (sharedSigner_onceToken != -1)
    dispatch_once(&sharedSigner_onceToken, &__block_literal_global_9);
  return (AKAttestationSigner *)(id)sharedSigner_sharedSigner;
}

void __35__AKAttestationSigner_sharedSigner__block_invoke()
{
  AKAttestationSigner *v0;
  void *v1;

  v0 = objc_alloc_init(AKAttestationSigner);
  v1 = (void *)sharedSigner_sharedSigner;
  sharedSigner_sharedSigner = (uint64_t)v0;

}

- (AKAttestationSigner)init
{
  AKAttestationSigner *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *attestationQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AKAttestationSigner;
  v2 = -[AKAttestationSigner init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.authkit.ATTQ", v3);
    attestationQueue = v2->_attestationQueue;
    v2->_attestationQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)signatureForData:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  OS_dispatch_queue *attestationQueue;
  _QWORD v17[5];
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AKAttestationUseDeviceCheckKeychainAccess"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "BOOLValue");

  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AKAttestationUseDeviceCheckKeychainAccess"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    if (v13)
    {
      -[AKAttestationSigner _baaSignatureForData:completion:](self, "_baaSignatureForData:completion:", v8, v10);
    }
    else
    {
      _AKAttestationOptionsFromOptions(v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      attestationQueue = self->_attestationQueue;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __59__AKAttestationSigner_signatureForData_options_completion___block_invoke;
      v17[3] = &unk_1E2E5F110;
      v17[4] = self;
      v18 = v8;
      v19 = v10;
      SDeviceIdentityIssueClientCertificateWithCompletion(attestationQueue, v15, v17);

    }
  }
  else
  {
    _AKLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[AKAttestationSigner signatureForData:options:completion:].cold.1();

    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, 0, 0, 0);
  }

}

void __59__AKAttestationSigner_signatureForData_options_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  _BOOL4 v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (a2 && v7)
  {
    v9 = (void *)a1[4];
    v10 = a1[5];
    v27 = 0;
    objc_msgSend(v9, "_signatureForData:withReferenceKey:error:", v10, a2, &v27);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v27;
    if (v11)
    {
      v13 = (void *)a1[4];
      v26 = 0;
      objc_msgSend(v13, "_attestationWithCertificates:error:", v7, &v26);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v26;
      if (v14)
      {
        v16 = v11;
        v17 = v14;
        v18 = 0;
      }
      else
      {
        v16 = 0;
        v17 = 0;
        v18 = v15;
      }
      (*(void (**)(_QWORD, void *, void *, id))(a1[6] + 16))(a1[6], v16, v17, v18);

    }
    else
    {
      (*(void (**)(void))(a1[6] + 16))();
    }

  }
  else
  {
    _AKLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (v8)
    {
      if (v20)
        __59__AKAttestationSigner_signatureForData_options_completion___block_invoke_cold_2();

      v21 = a1[6];
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v28 = *MEMORY[0x1E0CB3388];
      v29[0] = v8;
      v23 = (void *)MEMORY[0x1E0C99D80];
      v24 = v8;
      objc_msgSend(v23, "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("AKAttestationErrorDomain"), -10001, v25);
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (v20)
        __59__AKAttestationSigner_signatureForData_options_completion___block_invoke_cold_1();

      v21 = a1[6];
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AKAttestationErrorDomain"), -10001, 0);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v21 + 16))(v21, 0, 0, v12);
  }

}

- (void)signaturesForData:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  OS_dispatch_queue *attestationQueue;
  _QWORD v17[4];
  id v18;
  AKAttestationSigner *v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AKAttestationUseDeviceCheckKeychainAccess"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "BOOLValue");

  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AKAttestationUseDeviceCheckKeychainAccess"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    if (v13)
    {
      -[AKAttestationSigner _baaSignaturesForData:completion:](self, "_baaSignaturesForData:completion:", v8, v10);
    }
    else
    {
      _AKAttestationOptionsFromOptions(v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      attestationQueue = self->_attestationQueue;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __60__AKAttestationSigner_signaturesForData_options_completion___block_invoke;
      v17[3] = &unk_1E2E5F110;
      v18 = v8;
      v19 = self;
      v20 = v10;
      SDeviceIdentityIssueClientCertificateWithCompletion(attestationQueue, v15, v17);

    }
  }
  else
  {
    _AKLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[AKAttestationSigner signaturesForData:options:completion:].cold.1();

    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, 0, 0, 0);
  }

}

void __60__AKAttestationSigner_signaturesForData_options_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  BOOL v17;
  NSObject *v18;
  _BOOL4 v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  _QWORD v29[7];
  _QWORD v30[5];
  id v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (a2 && v7)
  {
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x3032000000;
    v30[3] = __Block_byref_object_copy__3;
    v30[4] = __Block_byref_object_dispose__3;
    v31 = 0;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __60__AKAttestationSigner_signaturesForData_options_completion___block_invoke_22;
    v29[3] = &unk_1E2E5F138;
    v10 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v29[5] = v30;
    v29[6] = a2;
    v29[4] = v11;
    objc_msgSend(v10, "aaf_mapStoppable:", v29);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(*(id *)(a1 + 32), "count");
    if (v13 == objc_msgSend(v12, "count"))
    {
      v14 = *(void **)(a1 + 40);
      v28 = 0;
      objc_msgSend(v14, "_attestationWithCertificates:error:", v7, &v28);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v28;
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

    _Block_object_dispose(v30, 8);
  }
  else
  {
    v17 = v8 == 0;
    _AKLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (v17)
    {
      if (v19)
        __59__AKAttestationSigner_signatureForData_options_completion___block_invoke_cold_1();

      v26 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AKAttestationErrorDomain"), -10001, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v26 + 16))(v26, 0, 0, v27);

    }
    else
    {
      if (v19)
        __59__AKAttestationSigner_signatureForData_options_completion___block_invoke_cold_2();

      v20 = *(_QWORD *)(a1 + 48);
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v32[0] = *MEMORY[0x1E0CB3388];
      v30[0] = v9;
      v22 = (void *)MEMORY[0x1E0C99D80];
      v23 = v9;
      objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v30, v32, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("AKAttestationErrorDomain"), -10001, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v20 + 16))(v20, 0, 0, v25);
    }
  }

}

id __60__AKAttestationSigner_signaturesForData_options_completion___block_invoke_22(_QWORD *a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v14;

  v6 = (void *)a1[4];
  v7 = a1[6];
  v14 = 0;
  objc_msgSend(v6, "_signatureForData:withReferenceKey:error:", a3, v7, &v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v14;
  v10 = v14;
  if (v8)
  {
    v11 = v8;
  }
  else
  {
    _AKLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __60__AKAttestationSigner_signaturesForData_options_completion___block_invoke_22_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v9);
    *a4 = 1;
  }

  return v8;
}

- (void)_baaSignaturesForData:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  objc_class *DCBAASigningControllerClass;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v6 = a4;
  DCBAASigningControllerClass = (objc_class *)DeviceCheckInternalLibraryCore();
  if (DCBAASigningControllerClass)
    DCBAASigningControllerClass = (objc_class *)getDCBAASigningControllerClass();
  v8 = objc_alloc_init(DCBAASigningControllerClass);
  if (v8)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __56__AKAttestationSigner__baaSignaturesForData_completion___block_invoke;
    v10[3] = &unk_1E2E5F160;
    v11 = v6;
    objc_msgSend(v8, "baaSignaturesForData:completion:", v5, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AKAttestationErrorDomain"), -10000, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v6 + 2))(v6, 0, 0, v9);

  }
}

uint64_t __56__AKAttestationSigner__baaSignaturesForData_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_baaSignatureForData:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  objc_class *DCBAASigningControllerClass;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v6 = a4;
  DCBAASigningControllerClass = (objc_class *)DeviceCheckInternalLibraryCore();
  if (DCBAASigningControllerClass)
    DCBAASigningControllerClass = (objc_class *)getDCBAASigningControllerClass();
  v8 = objc_alloc_init(DCBAASigningControllerClass);
  if (v8)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55__AKAttestationSigner__baaSignatureForData_completion___block_invoke;
    v10[3] = &unk_1E2E5F188;
    v11 = v6;
    objc_msgSend(v8, "baaSignatureForData:completion:", v5, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AKAttestationErrorDomain"), -10000, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v6 + 2))(v6, 0, 0, v9);

  }
}

uint64_t __55__AKAttestationSigner__baaSignatureForData_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_signatureForData:(id)a3 withReferenceKey:(__SecKey *)a4 error:(id *)a5
{
  CFDataRef v6;
  CFDataRef v7;
  CFErrorRef v8;
  const __CFData *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  __CFError *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  CFErrorRef v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v6 = SecKeyCreateSignature(a4, (SecKeyAlgorithm)*MEMORY[0x1E0CD6DF8], (CFDataRef)a3, &v19);
  v7 = v6;
  v8 = v19;
  if (v6)
  {
    v9 = v6;
    goto LABEL_13;
  }
  _AKLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (v8)
  {
    if (v11)
      -[AKAttestationSigner _signatureForData:withReferenceKey:error:].cold.2();

    if (a5)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *MEMORY[0x1E0CB3388];
      v21[0] = v8;
      v13 = (void *)MEMORY[0x1E0C99D80];
      v14 = v8;
      objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("AKAttestationErrorDomain"), -10001, v15);
      v16 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v16;
LABEL_12:
      *a5 = v17;
    }
  }
  else
  {
    if (v11)
      -[AKAttestationSigner _signatureForData:withReferenceKey:error:].cold.1();

    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AKAttestationErrorDomain"), -10001, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
  }
LABEL_13:

  return v7;
}

- (id)_attestationWithCertificates:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v19;
  const __CFString *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "aaf_map:", &__block_literal_global_27);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = CFSTR("certs");
  v21 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v6, 0, &v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v19;
  if (!v7)
  {
    _AKLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (v8)
    {
      if (v11)
        -[AKAttestationSigner _attestationWithCertificates:error:].cold.2();

      if (a4)
      {
        v12 = (void *)MEMORY[0x1E0CB35C8];
        v22 = *MEMORY[0x1E0CB3388];
        v23[0] = v8;
        v13 = (void *)MEMORY[0x1E0C99D80];
        v14 = v8;
        objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("AKAttestationErrorDomain"), -10001, v15);
        v16 = objc_claimAutoreleasedReturnValue();

        v17 = (void *)v16;
LABEL_12:
        v9 = 0;
        *a4 = v17;
        goto LABEL_14;
      }
    }
    else
    {
      if (v11)
        -[AKAttestationSigner _attestationWithCertificates:error:].cold.1();

      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AKAttestationErrorDomain"), -10001, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
    }
    v9 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v7, "aaf_toCompressedData:", 517);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v9;
}

id __58__AKAttestationSigner__attestationWithCertificates_error___block_invoke(int a1, SecCertificateRef certificate)
{
  CFDataRef v2;
  void *v3;

  v2 = SecCertificateCopyData(certificate);
  -[__CFData base64EncodedStringWithOptions:](v2, "base64EncodedStringWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attestationQueue, 0);
}

- (void)signatureForData:options:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "AKAttestationSigner signatureForData: - No data, nothing to sign.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __59__AKAttestationSigner_signatureForData_options_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Failed to BAA, unknown error!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __59__AKAttestationSigner_signatureForData_options_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to BAA, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)signaturesForData:options:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "AKAttestationSigner signaturesForData: - No data, nothing to sign.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __60__AKAttestationSigner_signaturesForData_options_completion___block_invoke_22_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Failed to generate signatures, bailing!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_signatureForData:withReferenceKey:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Failed to BAA, failed to generate signature: unknown error!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_signatureForData:withReferenceKey:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to BAA, failed to generate signature: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_attestationWithCertificates:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Failed to BAA, failed to serialize: unknown error!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_attestationWithCertificates:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to BAA, failed to serialize: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
