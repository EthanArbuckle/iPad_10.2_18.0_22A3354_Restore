@implementation DCBAASigner

+ (DCBAASigner)sharedSigner
{
  if (sharedSigner_onceToken != -1)
    dispatch_once(&sharedSigner_onceToken, &__block_literal_global_0);
  return (DCBAASigner *)(id)sharedSigner_sharedSigner;
}

void __27__DCBAASigner_sharedSigner__block_invoke()
{
  DCBAASigner *v0;
  void *v1;

  v0 = objc_alloc_init(DCBAASigner);
  v1 = (void *)sharedSigner_sharedSigner;
  sharedSigner_sharedSigner = (uint64_t)v0;

}

- (void)signatureForData:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    if ((DeviceIdentityIsSupported() & 1) != 0)
    {
      +[DCCryptoUtilities identityCertificateOptions](DCCryptoUtilities, "identityCertificateOptions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v5;
      v12 = v6;
      DeviceIdentityIssueClientCertificateWithCompletion();

    }
    else
    {
      _DCLogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[DCBAASigner signatureForData:completion:].cold.2();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.devicecheck.error.baa"), -10000, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v6 + 2))(v6, 0, 0, v10);

    }
  }
  else
  {
    _DCLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[DCBAASigner signatureForData:completion:].cold.1();

    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, 0, 0, 0);
  }

}

void __43__DCBAASigner_signatureForData_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  int HasDomainAndErrorCode;
  NSObject *v21;
  _BOOL4 v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (a2 && v7)
  {
    v10 = (void *)a1[4];
    v11 = a1[5];
    v34 = 0;
    objc_msgSend(v10, "_signatureForData:withReferenceKey:error:", v11, a2, &v34);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v34;
    if (v12)
    {
      v14 = (void *)a1[4];
      v33 = 0;
      objc_msgSend(v14, "_attestationWithCertificates:error:", v7, &v33);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v33;
      if (v15)
      {
        v17 = v12;
        v18 = v15;
        v19 = 0;
      }
      else
      {
        v17 = 0;
        v18 = 0;
        v19 = v16;
      }
      (*(void (**)(_QWORD, void *, void *, id))(a1[6] + 16))(a1[6], v17, v18, v19);

    }
    else
    {
      (*(void (**)(void))(a1[6] + 16))();
    }

  }
  else
  {
    if (v8)
    {
      HasDomainAndErrorCode = mobileactivationErrorHasDomainAndErrorCode();
      _DCLogSystem();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
      if (HasDomainAndErrorCode)
      {
        if (v22)
          __43__DCBAASigner_signatureForData_completion___block_invoke_cold_2();

        v23 = a1[6];
        v24 = (void *)MEMORY[0x24BDD1540];
        v35 = *MEMORY[0x24BDD1398];
        v36[0] = v9;
        v25 = (void *)MEMORY[0x24BDBCE70];
        v26 = v9;
        objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v24;
        v29 = -10002;
      }
      else
      {
        if (v22)
          __43__DCBAASigner_signatureForData_completion___block_invoke_cold_2();

        v23 = a1[6];
        v31 = (void *)MEMORY[0x24BDD1540];
        v35 = *MEMORY[0x24BDD1398];
        v36[0] = v9;
        v32 = (void *)MEMORY[0x24BDBCE70];
        v26 = v9;
        objc_msgSend(v32, "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v31;
        v29 = -10001;
      }
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("com.apple.devicecheck.error.baa"), v29, v27);
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      _DCLogSystem();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        __43__DCBAASigner_signatureForData_completion___block_invoke_cold_1();

      v23 = a1[6];
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.devicecheck.error.baa"), -10001, 0);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v23 + 16))(v23, 0, 0, v13);
  }

}

- (void)signaturesForData:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    if ((DeviceIdentityIsSupported() & 1) != 0)
    {
      +[DCCryptoUtilities identityCertificateOptions](DCCryptoUtilities, "identityCertificateOptions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v5;
      v12 = v6;
      DeviceIdentityIssueClientCertificateWithCompletion();

    }
    else
    {
      _DCLogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[DCBAASigner signatureForData:completion:].cold.2();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.devicecheck.error.baa"), -10000, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v6 + 2))(v6, 0, 0, v10);

    }
  }
  else
  {
    _DCLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[DCBAASigner signaturesForData:completion:].cold.1();

    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, 0, 0, 0);
  }

}

void __44__DCBAASigner_signaturesForData_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  int HasDomainAndErrorCode;
  NSObject *v19;
  _BOOL4 v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD v37[5];
  id v38;
  _QWORD *v39;
  uint64_t v40;
  _BYTE buf[12];
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  _QWORD v46[5];
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (a2 && v7)
  {
    v46[0] = 0;
    v46[1] = v46;
    v46[2] = 0x3032000000;
    v46[3] = __Block_byref_object_copy_;
    v46[4] = __Block_byref_object_dispose_;
    v47 = 0;
    v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __44__DCBAASigner_signaturesForData_completion___block_invoke_5;
    v37[3] = &unk_24ED11538;
    v11 = *(void **)(a1 + 32);
    v37[4] = *(_QWORD *)(a1 + 40);
    v40 = a2;
    v12 = v10;
    v38 = v12;
    v39 = v46;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v37);
    v13 = objc_msgSend(*(id *)(a1 + 32), "count");
    if (v13 == objc_msgSend(v12, "count"))
    {
      v14 = *(void **)(a1 + 40);
      v36 = 0;
      objc_msgSend(v14, "_attestationWithCertificates:error:", v7, &v36);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v36;
      if (v15)
      {
        _DCLogSystem();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v12;
          v42 = 2112;
          v43 = v15;
          v44 = 2112;
          v45 = v16;
          _os_log_debug_impl(&dword_224FB2000, v17, OS_LOG_TYPE_DEBUG, "Signing Completed in DeviceCheckd - SignatureData: %@, AttestationData: %@, Error:%@", buf, 0x20u);
        }

        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      }
      else
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      }

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

    _Block_object_dispose(v46, 8);
  }
  else if (v8)
  {
    HasDomainAndErrorCode = mobileactivationErrorHasDomainAndErrorCode();
    _DCLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (HasDomainAndErrorCode)
    {
      if (v20)
        __43__DCBAASigner_signatureForData_completion___block_invoke_cold_2();

      v21 = *(_QWORD *)(a1 + 48);
      v22 = (void *)MEMORY[0x24BDD1540];
      *(_QWORD *)buf = *MEMORY[0x24BDD1398];
      v46[0] = v9;
      v23 = (void *)MEMORY[0x24BDBCE70];
      v24 = v9;
      objc_msgSend(v23, "dictionaryWithObjects:forKeys:count:", v46, buf, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.devicecheck.error.baa"), -10002, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v21 + 16))(v21, 0, 0, v26);
    }
    else
    {
      if (v20)
        __43__DCBAASigner_signatureForData_completion___block_invoke_cold_2();

      v30 = *(_QWORD *)(a1 + 48);
      v31 = (void *)MEMORY[0x24BDD1540];
      *(_QWORD *)buf = *MEMORY[0x24BDD1398];
      v46[0] = v9;
      v32 = (void *)MEMORY[0x24BDBCE70];
      v33 = v9;
      objc_msgSend(v32, "dictionaryWithObjects:forKeys:count:", v46, buf, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("com.apple.devicecheck.error.baa"), -10001, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v30 + 16))(v30, 0, 0, v35);
    }
  }
  else
  {
    _DCLogSystem();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      __43__DCBAASigner_signatureForData_completion___block_invoke_cold_1();

    v28 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.devicecheck.error.baa"), -10001, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v28 + 16))(v28, 0, 0, v29);

  }
}

void __44__DCBAASigner_signaturesForData_completion___block_invoke_5(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;

  v7 = a2;
  v8 = a3;
  _DCLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __44__DCBAASigner_signaturesForData_completion___block_invoke_5_cold_3();

  v10 = v8;
  if (!objc_msgSend(v10, "length"))
  {
    _DCLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __44__DCBAASigner_signaturesForData_completion___block_invoke_5_cold_2();

    *a4 = 1;
  }
  v12 = *(void **)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 56);
  v18 = 0;
  objc_msgSend(v12, "_signatureForData:withReferenceKey:error:", v10, v13, &v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v18;
  v16 = v18;
  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v14, v7);
  }
  else
  {
    _DCLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __44__DCBAASigner_signaturesForData_completion___block_invoke_5_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v15);
    *a4 = 1;
  }

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

  v21[1] = *MEMORY[0x24BDAC8D0];
  v19 = 0;
  v6 = SecKeyCreateSignature(a4, (SecKeyAlgorithm)*MEMORY[0x24BDE92D0], (CFDataRef)a3, &v19);
  v7 = v6;
  v8 = v19;
  if (v6)
  {
    v9 = v6;
    goto LABEL_12;
  }
  _DCLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (v8)
  {
    if (v11)
      -[DCBAASigner _signatureForData:withReferenceKey:error:].cold.2();

    v12 = (void *)MEMORY[0x24BDD1540];
    v20 = *MEMORY[0x24BDD1398];
    v21[0] = v8;
    v13 = (void *)MEMORY[0x24BDBCE70];
    v14 = v8;
    objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.devicecheck.error.baa"), -10001, v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v16;
    goto LABEL_11;
  }
  if (v11)
    -[DCBAASigner _signatureForData:withReferenceKey:error:].cold.1();

  if (a5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.devicecheck.error.baa"), -10001, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
    *a5 = v17;
  }
LABEL_12:

  return v7;
}

- (id)_attestationWithCertificates:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  __SecCertificate *v7;
  CFDataRef v8;
  void *v9;
  __SecCertificate *v10;
  CFDataRef v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v27;
  const __CFString *v28;
  id v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v7 = (__SecCertificate *)objc_claimAutoreleasedReturnValue();
  v8 = SecCertificateCopyData(v7);
  -[__CFData base64EncodedStringWithOptions:](v8, "base64EncodedStringWithOptions:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v9);

  objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
  v10 = (__SecCertificate *)objc_claimAutoreleasedReturnValue();
  v11 = SecCertificateCopyData(v10);
  -[__CFData base64EncodedStringWithOptions:](v11, "base64EncodedStringWithOptions:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v12);

  v28 = CFSTR("certs");
  v29 = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v13, 0, &v27);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v27;
  if (v14)
  {
    objc_msgSend(v14, "dc_compressedData:", 517);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _DCLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[DCBAASigner _attestationWithCertificates:error:].cold.3();

    _DCLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (v15)
    {
      if (v19)
        -[DCBAASigner _attestationWithCertificates:error:].cold.2();

      v20 = (void *)MEMORY[0x24BDD1540];
      v30 = *MEMORY[0x24BDD1398];
      v31[0] = v15;
      v21 = (void *)MEMORY[0x24BDBCE70];
      v22 = v15;
      objc_msgSend(v21, "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.devicecheck.error.baa"), -10001, v23);
      v24 = objc_claimAutoreleasedReturnValue();

      v25 = (void *)v24;
    }
    else
    {
      if (v19)
        -[DCBAASigner _attestationWithCertificates:error:].cold.1();

      if (!a4)
      {
        v16 = 0;
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.devicecheck.error.baa"), -10001, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v16 = 0;
    *a4 = v25;
  }
LABEL_14:

  return v16;
}

- (void)signatureForData:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_224FB2000, v0, v1, "DCBAASigner signatureForData: - No data, nothing to sign.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)signatureForData:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_224FB2000, v0, v1, "Platform not supported by Device Identity", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __43__DCBAASigner_signatureForData_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_224FB2000, v0, v1, "Failed to BAA, unknown error!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __43__DCBAASigner_signatureForData_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_224FB2000, v0, v1, "Failed to BAA, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)signaturesForData:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_224FB2000, v0, v1, "signaturesForData: - No data, nothing to sign.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __44__DCBAASigner_signaturesForData_completion___block_invoke_5_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_224FB2000, v0, v1, "Failed to generate signatures, bailing!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __44__DCBAASigner_signaturesForData_completion___block_invoke_5_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_224FB2000, v0, v1, "Nothing to sign for key: %@, bailing!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __44__DCBAASigner_signaturesForData_completion___block_invoke_5_cold_3()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_224FB2000, v1, OS_LOG_TYPE_DEBUG, "%@ = %@", v2, 0x16u);
  OUTLINED_FUNCTION_3();
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

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_224FB2000, v0, v1, "Failed to BAA, failed to generate signature: unknown error!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
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

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_224FB2000, v0, v1, "Failed to BAA, failed to generate signature: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
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

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_224FB2000, v0, v1, "Failed to BAA, failed to serialize: unknown error!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
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

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_224FB2000, v0, v1, "Failed to BAA, failed to serialize: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_attestationWithCertificates:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_224FB2000, v0, v1, "Attestation Error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
