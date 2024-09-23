@implementation FCAVAssetKeyService

- (_QWORD)initWithConfigurationManager:(_QWORD *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  objc_super v14;

  v3 = a2;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)FCAVAssetKeyService;
    a1 = objc_msgSendSuper2(&v14, sel_init);
    if (a1)
    {
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D60AD0]), "initWithConstructor:", &__block_literal_global_21);
      v5 = (void *)a1[1];
      a1[1] = v4;

      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D60AD0]), "initWithConstructor:", &__block_literal_global_14);
      v7 = (void *)a1[2];
      a1[2] = v6;

      v8 = objc_alloc(MEMORY[0x1E0D60AF0]);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __52__FCAVAssetKeyService_initWithConfigurationManager___block_invoke_3;
      v12[3] = &unk_1E463DAD0;
      v13 = v3;
      v9 = objc_msgSend(v8, "initWithResolver:", v12);
      v10 = (void *)a1[3];
      a1[3] = v9;

    }
  }

  return a1;
}

void __52__FCAVAssetKeyService_initWithConfigurationManager___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  +[FCBaseURLConfiguration fairPlayBaseURLForConfiguration:](FCBaseURLConfiguration, "fairPlayBaseURLForConfiguration:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void __52__FCAVAssetKeyService_initWithConfigurationManager___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__FCAVAssetKeyService_initWithConfigurationManager___block_invoke_4;
  v6[3] = &unk_1E463DAA8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "fetchConfigurationIfNeededWithCompletion:", v6);

}

- (FCAVAssetKeyService)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCAVAssetKeyService init]";
    v9 = 2080;
    v10 = "FCAVAssetKeyService.m";
    v11 = 1024;
    v12 = 40;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCAVAssetKeyService init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

id __52__FCAVAssetKeyService_initWithConfigurationManager___block_invoke()
{
  id v0;
  id v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CFDC88]);
  objc_msgSend(v0, "setAllowedStatusCodes:", 0);
  objc_msgSend(v0, "setAllowedContentTypes:", 0);
  v1 = objc_alloc(MEMORY[0x1E0CFDCA0]);
  objc_msgSend(MEMORY[0x1E0C92CA0], "ephemeralSessionConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v1, "initWithConfiguration:", v2);

  objc_msgSend(v3, "setResponseDecoder:", v0);
  return v3;
}

id __52__FCAVAssetKeyService_initWithConfigurationManager___block_invoke_2()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = objc_alloc(MEMORY[0x1E0CFDC80]);
  +[FCAMSBag bag](FCAMSBag, "bag");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v0, "initWithBag:", v1);

  +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeiTunesAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccount:", v4);

  objc_msgSend(v2, "setUrlKnownToBeTrusted:", 1);
  objc_msgSend(v2, "setMescalType:", 0);
  return v2;
}

- (void)fetchAppCertificateWithCompletionHandler:(id)a3
{
  id v4;
  NFPromise *fairPlayBaseURLPromise;
  NFPromise *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  if (self)
    fairPlayBaseURLPromise = self->_fairPlayBaseURLPromise;
  else
    fairPlayBaseURLPromise = 0;
  v6 = fairPlayBaseURLPromise;
  zalgo();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke;
  v16[3] = &unk_1E463DB20;
  v16[4] = self;
  v9 = v4;
  v17 = v9;
  -[NFPromise thenOn:then:](v6, "thenOn:then:", v7, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke_35;
  v14[3] = &unk_1E463DB48;

  v15 = v9;
  v12 = v9;
  v13 = (id)objc_msgSend(v10, "errorOn:error:", v11, v14);

}

uint64_t __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(a2, "URLByAppendingPathComponent:", CFSTR("certificate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHTTPMethod:", CFSTR("GET"));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E463DAF8;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  -[FCAVAssetKeyService _performHTTPRequest:keyURI:completion:](v5, v4, 0, v7);

  return 0;
}

void __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint8_t v23[16];
  _QWORD v24[6];
  _QWORD v25[6];
  _QWORD v26[6];
  _QWORD v27[6];
  _QWORD v28[6];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v9)
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke_3;
    v28[3] = &unk_1E463B790;
    v11 = *(_QWORD *)(a1 + 32);
    v28[4] = v9;
    v28[5] = v11;
    __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke_3((uint64_t)v28);
  }
  else
  {
    if (objc_msgSend(v8, "statusCode") == 200)
    {
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("certificate"));
        v14 = (id)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v14, 0);
          if (v15)
          {
            v16 = v15;
            v17 = FCAVAssetLog;
            if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v23 = 0;
              _os_log_impl(&dword_1A1B90000, v17, OS_LOG_TYPE_DEFAULT, "AV asset key service successfully fetched certificate", v23, 2u);
            }
            (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

          }
          else
          {
            v24[0] = MEMORY[0x1E0C809B0];
            v24[1] = 3221225472;
            v24[2] = __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke_32;
            v24[3] = &unk_1E463B2D0;
            v21 = *(void **)(a1 + 32);
            v24[4] = v8;
            v24[5] = v21;
            v22 = v21;
            __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke_32((uint64_t)v24);

            v16 = 0;
          }
        }
        else
        {
          v25[0] = MEMORY[0x1E0C809B0];
          v25[1] = 3221225472;
          v25[2] = __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke_30;
          v25[3] = &unk_1E463B2D0;
          v20 = *(void **)(a1 + 32);
          v25[4] = v8;
          v25[5] = v20;
          v16 = v20;
          __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke_30((uint64_t)v25);
        }

      }
      else
      {
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke_28;
        v26[3] = &unk_1E463B2D0;
        v19 = *(void **)(a1 + 32);
        v26[4] = v8;
        v26[5] = v19;
        v14 = v19;
        __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke_28((uint64_t)v26);
      }

    }
    else
    {
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke_24;
      v27[3] = &unk_1E463B790;
      v18 = *(_QWORD *)(a1 + 32);
      v27[4] = v8;
      v27[5] = v18;
      v13 = v8;
      __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke_24((uint64_t)v27);
    }

  }
}

uint64_t __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v4;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "AV asset key service failed to fetch certificate with error: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke_24(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "statusCode") == 401 || objc_msgSend(*(id *)(a1 + 32), "statusCode") == 403)
  {
    v2 = FCAVAssetLog;
    if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "AV asset key service got unauthorized response for certificate request", (uint8_t *)&v11, 2u);
    }
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "fc_unauthorizedAVAssetCertificateError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);
  }
  else
  {
    v5 = (void *)FCAVAssetLog;
    if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
    {
      v9 = *(void **)(a1 + 32);
      v10 = v5;
      v11 = 134217984;
      v12 = objc_msgSend(v9, "statusCode");
      _os_log_error_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_ERROR, "AV asset key service got error status code %ld for certificate request", (uint8_t *)&v11, 0xCu);

    }
    v6 = *(_QWORD *)(a1 + 40);
    v7 = objc_msgSend(*(id *)(a1 + 32), "statusCode");
    objc_msgSend(*(id *)(a1 + 32), "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCEndpointConnection errorForStatus:url:](FCEndpointConnection, "errorForStatus:url:", v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v8);

  }
}

void __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke_28(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[8];
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "AV asset key service failed to parse response for certificate request", v8, 2u);
  }
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB3308];
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("FCEndpointConnectionErrorDomain"), 500, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v7);

}

void __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke_30(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[8];
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "AV asset key service failed to find certificate in response for certificate request", v8, 2u);
  }
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB3308];
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("FCEndpointConnectionErrorDomain"), 500, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v7);

}

void __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke_32(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[8];
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "AV asset key service failed to decode certificate base64 for certificate request", v8, 2u);
  }
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB3308];
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("FCEndpointConnectionErrorDomain"), 500, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v7);

}

- (void)_performHTTPRequest:(void *)a3 keyURI:(void *)a4 completion:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint8_t buf[16];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    dispatch_get_global_queue(17, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__14;
    v28 = __Block_byref_object_dispose__14;
    v29 = (id)objc_msgSend(v7, "mutableCopy");
    objc_msgSend((id)v25[5], "HTTPBody");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = FCAVAssetLog;
      if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1B90000, v12, OS_LOG_TYPE_DEFAULT, "AV asset key service will generate Mescal signature", buf, 2u);
      }
      objc_msgSend((id)v25[5], "HTTPBody");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __61__FCAVAssetKeyService__performHTTPRequest_keyURI_completion___block_invoke_58;
      v17[3] = &unk_1E463DC88;
      v21 = v9;
      v18 = v10;
      v19 = a1;
      v22 = &v24;
      v20 = v8;
      +[FCMescalSignature signatureFromData:completion:](FCMescalSignature, "signatureFromData:completion:", v13, v17);

      v14 = v21;
    }
    else
    {
      v14 = v8;
      v15 = v10;
      v16 = v9;
      -[FCAVAssetKeyService executeRequest:keyURI:callbackQueue:completion:](a1, (void *)v25[5], v14, v15, v16);

    }
    _Block_object_dispose(&v24, 8);

  }
}

uint64_t __64__FCAVAssetKeyService_fetchAppCertificateWithCompletionHandler___block_invoke_35(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)fetchContentKeyWithURI:(id)a3 spcData:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NFPromise *fairPlayBaseURLPromise;
  NFPromise *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  FCAVAssetKeyService *v27;
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self)
    fairPlayBaseURLPromise = self->_fairPlayBaseURLPromise;
  else
    fairPlayBaseURLPromise = 0;
  v12 = fairPlayBaseURLPromise;
  zalgo();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke;
  v24[3] = &unk_1E463DC10;
  v25 = v9;
  v26 = v8;
  v27 = self;
  v15 = v10;
  v28 = v15;
  v16 = v8;
  v17 = v9;
  -[NFPromise thenOn:then:](v12, "thenOn:then:", v13, v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_56;
  v22[3] = &unk_1E463DB48;

  v23 = v15;
  v20 = v15;
  v21 = (id)objc_msgSend(v18, "errorOn:error:", v19, v22);

}

uint64_t __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  id v22;
  id v23;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  objc_msgSend(*(id *)(a1 + 32), "base64EncodedStringWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("spcBase64"));

  objc_msgSend(*(id *)(a1 + 40), "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("m3u8URI"));

  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v5, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("contentKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:", v9);
  objc_msgSend(v10, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v10, "setHTTPBody:", v8);
  objc_msgSend(v10, "addValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Accept"));
  objc_msgSend(v10, "addValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endpointConnectionClientID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addValue:forHTTPHeaderField:", v12, CFSTR("X-CLIENT-ID"));

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(void **)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 48);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_2;
  v19[3] = &unk_1E463DBE8;
  v20 = v14;
  v16 = *(id *)(a1 + 56);
  v22 = v13;
  v23 = v16;
  v21 = *(_QWORD *)(a1 + 48);
  v17 = v13;
  -[FCAVAssetKeyService _performHTTPRequest:keyURI:completion:](v15, v10, v20, v19);

  return 0;
}

void __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  _QWORD v45[7];
  _QWORD v46[7];
  _QWORD v47[7];
  _QWORD v48[9];
  _QWORD v49[4];
  id v50;
  id v51;
  uint64_t v52;
  uint8_t buf[4];
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v9)
  {
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_3;
    v49[3] = &unk_1E463CCB8;
    v50 = *(id *)(a1 + 32);
    v51 = v9;
    v52 = *(_QWORD *)(a1 + 56);
    v11 = v50;
    __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_3(v49);
  }
  else if (objc_msgSend(v8, "statusCode") == 200)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v11 = v12;
      objc_opt_class();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ckc"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;
      }
      else
      {
        v14 = 0;
      }
      v24 = v14;

      if (v24)
      {
        v25 = v24;
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v25, 0);
        v27 = v26;
        if (v26)
        {
          v40 = v26;
          v28 = (void *)FCAVAssetLog;
          if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
          {
            v29 = *(void **)(a1 + 32);
            v30 = v28;
            objc_msgSend(v29, "absoluteString");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v54 = v31;
            _os_log_impl(&dword_1A1B90000, v30, OS_LOG_TYPE_DEFAULT, "AV asset key service successfully fetched key %{public}@", buf, 0xCu);

          }
          v41[0] = MEMORY[0x1E0C809B0];
          v41[1] = 3221225472;
          v41[2] = __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_51;
          v41[3] = &unk_1E463DBC0;
          v42 = v11;
          v43 = *(id *)(a1 + 32);
          v44 = *(id *)(a1 + 48);
          __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_51((uint64_t)v41);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

        }
        else
        {
          v45[0] = MEMORY[0x1E0C809B0];
          v45[1] = 3221225472;
          v45[2] = __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_50;
          v45[3] = &unk_1E463DB98;
          v36 = *(void **)(a1 + 32);
          v37 = *(void **)(a1 + 56);
          v45[5] = v8;
          v45[6] = v37;
          v45[4] = v36;
          v38 = v37;
          v39 = v36;
          __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_50((uint64_t)v45);

        }
      }
      else
      {
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_49;
        v46[3] = &unk_1E463DB98;
        v33 = *(void **)(a1 + 32);
        v34 = *(void **)(a1 + 56);
        v46[5] = v8;
        v46[6] = v34;
        v46[4] = v33;
        v35 = v34;
        v25 = v33;
        __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_49((uint64_t)v46);

      }
    }
    else
    {
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_46;
      v47[3] = &unk_1E463DB98;
      v20 = *(void **)(a1 + 32);
      v21 = *(void **)(a1 + 56);
      v47[5] = v8;
      v47[6] = v21;
      v47[4] = v20;
      v22 = v21;
      v23 = v20;
      __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_46((uint64_t)v47);

      v11 = 0;
    }
  }
  else
  {
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_45;
    v48[3] = &unk_1E463DB70;
    v16 = *(void **)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 40);
    v48[4] = v8;
    v48[5] = v16;
    v17 = *(void **)(a1 + 56);
    v48[7] = v7;
    v48[8] = v17;
    v48[6] = v15;
    v18 = v17;
    v19 = v16;
    v11 = v8;
    __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_45((uint64_t)v48);

  }
}

uint64_t __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_3(_QWORD *a1)
{
  void *v2;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)a1[4];
    v5 = v2;
    objc_msgSend(v4, "absoluteString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = a1[5];
    v8 = 138543618;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "AV asset key service failed to fetch key %{public}@ with error: %{public}@", (uint8_t *)&v8, 0x16u);

  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_45(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  int v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "statusCode");
  if (v2 == 400)
  {
    v6 = (void *)FCAVAssetLog;
    if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
    {
      v28 = *(void **)(a1 + 40);
      v29 = v6;
      objc_msgSend(v28, "absoluteString");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138543362;
      v36 = (uint64_t)v30;
      _os_log_error_impl(&dword_1A1B90000, v29, OS_LOG_TYPE_ERROR, "AV asset key service got bad request response for key %{public}@", (uint8_t *)&v35, 0xCu);

    }
    v8 = *(void **)(a1 + 56);
    v7 = *(_QWORD *)(a1 + 64);
    v9 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    if (!v9)
    {
      v23 = 0;
      goto LABEL_26;
    }
    +[FCEndpointConnection errorForStatus:url:](FCEndpointConnection, "errorForStatus:url:", 400, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v10)
    {
      v14 = v11;
      v23 = v14;
LABEL_25:

LABEL_26:
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v7 + 16))(v7, 0, 0, v23);

      goto LABEL_27;
    }
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v10, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("diagnosis"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        objc_msgSend(v15, "fc_arrayByTransformingWithBlock:", &__block_literal_global_77);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "containsObject:", CFSTR("INVALID_CERTIFICATE_HASH")))
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "fc_expiredAVAssetCertificateError");
          v18 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v18 = v12;
        }
        v23 = v18;

        goto LABEL_24;
      }
      v24 = v12;
    }
    else
    {
      v24 = v12;
      v16 = v24;
    }
    v23 = v24;
LABEL_24:

    goto LABEL_25;
  }
  if (v2 == 403 || v2 == 401)
  {
    v3 = (void *)FCAVAssetLog;
    if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
    {
      v25 = *(void **)(a1 + 40);
      v26 = v3;
      objc_msgSend(v25, "absoluteString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138543362;
      v36 = (uint64_t)v27;
      _os_log_error_impl(&dword_1A1B90000, v26, OS_LOG_TYPE_ERROR, "AV asset key service got unauthorized response for key %{public}@", (uint8_t *)&v35, 0xCu);

    }
    v4 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB35C8], "fc_unauthorizedAVAssetKeyErrorWithKeyURI:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v4 + 16))(v4, 0, 0, v5);
  }
  else
  {
    v19 = (void *)FCAVAssetLog;
    if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
    {
      v31 = *(void **)(a1 + 32);
      v32 = v19;
      v33 = objc_msgSend(v31, "statusCode");
      objc_msgSend(*(id *)(a1 + 40), "absoluteString");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 134218242;
      v36 = v33;
      v37 = 2114;
      v38 = v34;
      _os_log_error_impl(&dword_1A1B90000, v32, OS_LOG_TYPE_ERROR, "AV asset key service got error status code %ld for key %{public}@", (uint8_t *)&v35, 0x16u);

    }
    v20 = *(_QWORD *)(a1 + 64);
    v21 = objc_msgSend(*(id *)(a1 + 32), "statusCode");
    objc_msgSend(*(id *)(a1 + 32), "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCEndpointConnection errorForStatus:url:](FCEndpointConnection, "errorForStatus:url:", v21, v5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v20 + 16))(v20, 0, 0, v22);

  }
LABEL_27:

}

void __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_46(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
  {
    v8 = *(void **)(a1 + 32);
    v9 = v2;
    objc_msgSend(v8, "absoluteString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v10;
    _os_log_error_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_ERROR, "AV asset key service failed to parse response for key %{public}@", buf, 0xCu);

  }
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v11 = *MEMORY[0x1E0CB3308];
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "URL", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("FCEndpointConnectionErrorDomain"), 500, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v4 + 16))(v4, 0, 0, v7);

}

void __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_49(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
  {
    v8 = *(void **)(a1 + 32);
    v9 = v2;
    objc_msgSend(v8, "absoluteString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v10;
    _os_log_error_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_ERROR, "AV asset key service failed to find CKC in response for key %{public}@", buf, 0xCu);

  }
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v11 = *MEMORY[0x1E0CB3308];
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "URL", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("FCEndpointConnectionErrorDomain"), 500, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v4 + 16))(v4, 0, 0, v7);

}

void __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_50(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
  {
    v8 = *(void **)(a1 + 32);
    v9 = v2;
    objc_msgSend(v8, "absoluteString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v10;
    _os_log_error_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_ERROR, "AV asset key service failed to decode CKC base64 for key %{public}@", buf, 0xCu);

  }
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v11 = *MEMORY[0x1E0CB3308];
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "URL", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("FCEndpointConnectionErrorDomain"), 500, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v4 + 16))(v4, 0, 0, v7);

}

id __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_51(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("assetValidityDurationInSeconds"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = *(void **)(a1 + 48);
    objc_msgSend(v2, "doubleValue");
    objc_msgSend(v4, "dateByAddingTimeInterval:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_2_54;
    v7[3] = &unk_1E463B350;
    v8 = *(id *)(a1 + 40);
    __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_2_54((uint64_t)v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

uint64_t __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_2_54(uint64_t a1)
{
  void *v2;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(void **)(a1 + 32);
    v5 = v2;
    objc_msgSend(v4, "absoluteString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "AV asset key service failed to find TTL in response for key %{public}@", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

uint64_t __72__FCAVAssetKeyService_fetchContentKeyWithURI_spcData_completionHandler___block_invoke_56(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(result + 16))(result, 0, 0, a2);
  return result;
}

- (void)executeRequest:(void *)a3 keyURI:(void *)a4 callbackQueue:(void *)a5 completion:
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  uint8_t buf[16];

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a1)
  {
    v13 = FCAVAssetLog;
    if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1B90000, v13, OS_LOG_TYPE_DEFAULT, "AV asset key service will construct AMS request", buf, 2u);
    }
    objc_msgSend(*(id *)(a1 + 16), "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "requestByEncodingRequest:parameters:", v9, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __70__FCAVAssetKeyService_executeRequest_keyURI_callbackQueue_completion___block_invoke;
    v16[3] = &unk_1E463DD00;
    v20 = v12;
    v17 = v11;
    v18 = v10;
    v19 = a1;
    objc_msgSend(v15, "addFinishBlock:", v16);

  }
}

void __61__FCAVAssetKeyService__performHTTPRequest_keyURI_completion___block_invoke_58(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];
  _QWORD v15[7];
  __int128 v16;
  _QWORD v17[4];
  id v18;
  id v19;
  void *v20;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __61__FCAVAssetKeyService__performHTTPRequest_keyURI_completion___block_invoke_2;
    v17[3] = &unk_1E463DC60;
    v8 = *(void **)(a1 + 56);
    v19 = v6;
    v20 = v8;
    v18 = *(id *)(a1 + 32);
    v9 = v18;
    v10 = v8;
    __61__FCAVAssetKeyService__performHTTPRequest_keyURI_completion___block_invoke_2((uint64_t)v17);
LABEL_3:

    goto LABEL_8;
  }
  if (!v5)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __61__FCAVAssetKeyService__performHTTPRequest_keyURI_completion___block_invoke_2_60;
    v15[3] = &unk_1E463DC38;
    v12 = *(void **)(a1 + 48);
    v13 = *(void **)(a1 + 32);
    v15[4] = *(_QWORD *)(a1 + 40);
    v15[5] = v12;
    v15[6] = v13;
    v16 = *(_OWORD *)(a1 + 56);
    v9 = v13;
    v10 = v12;
    __61__FCAVAssetKeyService__performHTTPRequest_keyURI_completion___block_invoke_2_60((uint64_t)v15);
    goto LABEL_3;
  }
  v11 = FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_DEFAULT, "AV asset key service will attach mescal signature to request", v14, 2u);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setValue:forHTTPHeaderField:", v5, CFSTR("X-Apple-ActionSignature"));
  -[FCAVAssetKeyService executeRequest:keyURI:callbackQueue:completion:](*(_QWORD *)(a1 + 40), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(void **)(a1 + 48), *(void **)(a1 + 32), *(void **)(a1 + 56));
LABEL_8:

}

void __61__FCAVAssetKeyService__performHTTPRequest_keyURI_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint8_t buf[16];

  v2 = FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "AV asset key service failed to generate mescal signature", buf, 2u);
  }
  v3 = *(void **)(a1 + 48);
  if (v3)
  {
    v4 = *(NSObject **)(a1 + 32);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __61__FCAVAssetKeyService__performHTTPRequest_keyURI_completion___block_invoke_59;
    v5[3] = &unk_1E463B2D0;
    v7 = v3;
    v6 = *(id *)(a1 + 40);
    dispatch_async(v4, v5);

  }
}

uint64_t __61__FCAVAssetKeyService__performHTTPRequest_keyURI_completion___block_invoke_59(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

void __61__FCAVAssetKeyService__performHTTPRequest_keyURI_completion___block_invoke_2_60(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "AV asset key service generated nil mescal signature", v3, 2u);
  }
  -[FCAVAssetKeyService executeRequest:keyURI:callbackQueue:completion:](*(_QWORD *)(a1 + 32), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56));
}

void __70__FCAVAssetKeyService_executeRequest_keyURI_callbackQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[7];
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __70__FCAVAssetKeyService_executeRequest_keyURI_callbackQueue_completion___block_invoke_2;
    v25[3] = &unk_1E463DB98;
    v8 = *(void **)(a1 + 56);
    v9 = *(_QWORD *)(a1 + 32);
    v25[4] = v6;
    v25[5] = v9;
    v25[6] = v8;
    v10 = v8;
    __70__FCAVAssetKeyService_executeRequest_keyURI_callbackQueue_completion___block_invoke_2((uint64_t)v25);
  }
  else
  {
    v11 = FCAVAssetLog;
    if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_DEFAULT, "AV asset key service did construct AMS request", buf, 2u);
    }
    objc_msgSend(*(id *)(a1 + 40), "host");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "hasPrefix:", CFSTR("newsP"));

    if (v13)
    {
      objc_msgSend(v5, "allHTTPHeaderFields");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("X-DSID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        v19 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(*(id *)(a1 + 40), "absoluteString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("Missing X-DSID header on AV asset key request with URI: %@"), v20);
        *(_DWORD *)buf = 136315906;
        v27 = "-[FCAVAssetKeyService executeRequest:keyURI:callbackQueue:completion:]_block_invoke";
        v28 = 2080;
        v29 = "FCAVAssetKeyService.m";
        v30 = 1024;
        v31 = 294;
        v32 = 2114;
        v33 = v21;
        _os_log_fault_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: MissingDSID) : %s %s:%d %{public}@", buf, 0x26u);

      }
    }
    v16 = *(_QWORD *)(a1 + 48);
    if (v16)
      v17 = *(void **)(v16 + 8);
    else
      v17 = 0;
    objc_msgSend(v17, "value");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dataTaskPromiseWithRequest:", v5);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __70__FCAVAssetKeyService_executeRequest_keyURI_callbackQueue_completion___block_invoke_69;
    v22[3] = &unk_1E463DCD8;
    v24 = *(id *)(a1 + 56);
    v23 = *(id *)(a1 + 32);
    objc_msgSend(v10, "addFinishBlock:", v22);

  }
}

void __70__FCAVAssetKeyService_executeRequest_keyURI_callbackQueue_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v10 = v5;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "AV asset key service failed to construct AMS request with error: %{public}@", buf, 0xCu);
  }
  v3 = *(void **)(a1 + 48);
  if (v3)
  {
    v4 = *(NSObject **)(a1 + 40);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __70__FCAVAssetKeyService_executeRequest_keyURI_callbackQueue_completion___block_invoke_62;
    v6[3] = &unk_1E463B2D0;
    v8 = v3;
    v7 = *(id *)(a1 + 32);
    dispatch_async(v4, v6);

  }
}

uint64_t __70__FCAVAssetKeyService_executeRequest_keyURI_callbackQueue_completion___block_invoke_62(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

void __70__FCAVAssetKeyService_executeRequest_keyURI_callbackQueue_completion___block_invoke_69(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  objc_opt_class();
  objc_msgSend(v5, "response");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  v10 = *(void **)(a1 + 40);
  if (v10)
  {
    v11 = *(NSObject **)(a1 + 32);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __70__FCAVAssetKeyService_executeRequest_keyURI_callbackQueue_completion___block_invoke_2_71;
    v12[3] = &unk_1E463DCB0;
    v16 = v10;
    v13 = v5;
    v14 = v9;
    v15 = v6;
    dispatch_async(v11, v12);

  }
}

void __70__FCAVAssetKeyService_executeRequest_keyURI_callbackQueue_completion___block_invoke_2_71(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "data");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

id __63__FCAVAssetKeyService__errorForBadRequestWithResponseData_URL___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("code"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v4 = v3;
      else
        v4 = 0;
    }
    else
    {
      v4 = 0;
    }
    v5 = v4;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fairPlayBaseURLPromise, 0);
  objc_storeStrong((id *)&self->_requestEncoder, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
