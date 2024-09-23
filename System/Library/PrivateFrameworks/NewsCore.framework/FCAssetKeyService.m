@implementation FCAssetKeyService

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
    v14.super_class = (Class)FCAssetKeyService;
    a1 = objc_msgSendSuper2(&v14, sel_init);
    if (a1)
    {
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D60AD0]), "initWithConstructor:", &__block_literal_global_60);
      v5 = (void *)a1[1];
      a1[1] = v4;

      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D60AD0]), "initWithConstructor:", &__block_literal_global_5_1);
      v7 = (void *)a1[2];
      a1[2] = v6;

      v8 = objc_alloc(MEMORY[0x1E0D60AF0]);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __50__FCAssetKeyService_initWithConfigurationManager___block_invoke_3;
      v12[3] = &unk_1E463DAD0;
      v13 = v3;
      v9 = objc_msgSend(v8, "initWithResolver:", v12);
      v10 = (void *)a1[3];
      a1[3] = v9;

    }
  }

  return a1;
}

void __50__FCAssetKeyService_initWithConfigurationManager___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void (*v7)(void);
  id v8;

  v8 = a3;
  +[FCBaseURLConfiguration CAPIBaseURLForConfiguration:](FCBaseURLConfiguration, "CAPIBaseURLForConfiguration:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("asset/wrappingkey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  else
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  v7();

}

void __50__FCAssetKeyService_initWithConfigurationManager___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__FCAssetKeyService_initWithConfigurationManager___block_invoke_4;
  v10[3] = &unk_1E463EF38;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "fetchConfigurationIfNeededWithCompletion:", v10);

}

id __50__FCAssetKeyService_initWithConfigurationManager___block_invoke()
{
  id v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0CFDC88]);
  objc_msgSend(v0, "setAllowedStatusCodes:", 0);
  objc_msgSend(v0, "setAllowedContentTypes:", 0);
  v1 = objc_alloc(MEMORY[0x1E0CFDCA0]);
  objc_msgSend(MEMORY[0x1E0C92CA0], "ephemeralSessionConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v1, "initWithConfiguration:", v2);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDC98]), "initWithTrustMode:", 0);
  objc_msgSend(v3, "setSecurityPolicy:", v4);

  objc_msgSend(v3, "setResponseDecoder:", v0);
  return v3;
}

id __50__FCAssetKeyService_initWithConfigurationManager___block_invoke_2()
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

- (void)fetchWrappingKeysWithIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD *v16;
  void *v17;
  NFPromise *v18;
  void *v19;
  _QWORD *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD *v33;
  __int128 buf;
  uint64_t (*v35)(uint64_t, uint64_t);
  void *v36;
  id v37;
  id v38;
  FCAssetKeyService *v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0D628C8]);
  v9 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v8, "setWrappingKeyIds:", v9);

  v10 = (void *)FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_DEFAULT, "Asset key service will request %lu keys", (uint8_t *)&buf, 0xCu);

  }
  v27 = v8;
  objc_msgSend(v8, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __64__FCAssetKeyService_fetchWrappingKeysWithIDs_completionHandler___block_invoke;
  v28[3] = &unk_1E4642CA8;
  v29 = v6;
  v30 = v7;
  v26 = v7;
  v14 = v6;
  v15 = v12;
  v16 = v28;
  if (self)
  {
    dispatch_get_global_queue(17, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = self->_endpointURLPromise;
    zalgo();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = v13;
    *((_QWORD *)&buf + 1) = 3221225472;
    v35 = __60__FCAssetKeyService__performHTTPRequestWithData_completion___block_invoke;
    v36 = &unk_1E4642CF8;
    v37 = v15;
    v20 = v16;
    v40 = v20;
    v21 = v17;
    v38 = v21;
    v39 = self;
    -[NFPromise thenOn:then:](v18, "thenOn:then:", v19, &buf, v26);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    zalgo();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v13;
    v31[1] = 3221225472;
    v31[2] = __60__FCAssetKeyService__performHTTPRequestWithData_completion___block_invoke_30;
    v31[3] = &unk_1E463D3F8;
    v33 = v20;

    v32 = v21;
    v24 = v21;
    v25 = (id)objc_msgSend(v22, "errorOn:error:", v23, v31);

  }
}

void __64__FCAssetKeyService_fetchWrappingKeysWithIDs_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[6];
  _QWORD v38[5];
  __int128 v39;
  _QWORD v40[4];
  id v41;
  id v42;
  uint64_t v43;
  uint8_t v44[128];
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v9)
  {
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __64__FCAssetKeyService_fetchWrappingKeysWithIDs_completionHandler___block_invoke_2;
    v40[3] = &unk_1E463CCB8;
    v11 = *(_QWORD *)(a1 + 40);
    v41 = *(id *)(a1 + 32);
    v42 = v9;
    v43 = v11;
    v12 = v41;
    __64__FCAssetKeyService_fetchWrappingKeysWithIDs_completionHandler___block_invoke_2(v40);
  }
  else if (objc_msgSend(v8, "statusCode") == 200)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D628D0]), "initWithData:", v7);
    if (v13)
    {
      v12 = v13;
      v14 = (void *)FCDefaultLog;
      if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
      {
        v15 = v14;
        objc_msgSend(v12, "wrappingKeyMapEntries");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");
        v18 = objc_msgSend(*(id *)(a1 + 32), "count");
        *(_DWORD *)buf = 134218240;
        v46 = v17;
        v47 = 2048;
        v48 = v18;
        _os_log_impl(&dword_1A1B90000, v15, OS_LOG_TYPE_DEFAULT, "Asset key service successfully fetched %lu of %lu keys", buf, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v8, v7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      objc_msgSend(v12, "wrappingKeyMapEntries");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v34 != v23)
              objc_enumerationMutation(v20);
            v25 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            objc_msgSend(v25, "wrappingKey");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "wrappingKeyId");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "fc_safelySetObject:forKey:", v26, v27);

          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
        }
        while (v22);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v8 = v31;
      v7 = v32;
    }
    else
    {
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __64__FCAssetKeyService_fetchWrappingKeysWithIDs_completionHandler___block_invoke_20;
      v37[3] = &unk_1E463B2D0;
      v29 = *(void **)(a1 + 40);
      v37[4] = v8;
      v37[5] = v29;
      v30 = v29;
      __64__FCAssetKeyService_fetchWrappingKeysWithIDs_completionHandler___block_invoke_20((uint64_t)v37);

      v12 = 0;
    }
  }
  else
  {
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __64__FCAssetKeyService_fetchWrappingKeysWithIDs_completionHandler___block_invoke_16;
    v38[3] = &unk_1E463CCB8;
    v38[4] = v8;
    v39 = *(_OWORD *)(a1 + 32);
    v28 = (id)v39;
    v12 = v8;
    __64__FCAssetKeyService_fetchWrappingKeysWithIDs_completionHandler___block_invoke_16((uint64_t)v38);

  }
}

uint64_t __64__FCAssetKeyService_fetchWrappingKeysWithIDs_completionHandler___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)a1[4];
    v5 = v2;
    v6 = objc_msgSend(v4, "count");
    v7 = a1[5];
    v8 = 134218242;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Asset key service failed to fetch %lu keys with error: %{public}@", (uint8_t *)&v8, 0x16u);

  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __64__FCAssetKeyService_fetchWrappingKeysWithIDs_completionHandler___block_invoke_16(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "statusCode") == 401 || objc_msgSend(*(id *)(a1 + 32), "statusCode") == 403)
  {
    v2 = (void *)FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
    {
      v10 = *(void **)(a1 + 40);
      v11 = v2;
      v16 = 134217984;
      v17 = objc_msgSend(v10, "count");
      _os_log_error_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_ERROR, "Asset key service got unauthorized response for %lu keys", (uint8_t *)&v16, 0xCu);

    }
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v4 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fc_unauthorizedAssetKeyErrorWithWrappingKeyID:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
    {
      v12 = *(void **)(a1 + 32);
      v13 = v7;
      v14 = objc_msgSend(v12, "statusCode");
      v15 = objc_msgSend(*(id *)(a1 + 40), "count");
      v16 = 134218240;
      v17 = v14;
      v18 = 2048;
      v19 = v15;
      _os_log_error_impl(&dword_1A1B90000, v13, OS_LOG_TYPE_ERROR, "Asset key service got error status code %ld for %lu keys", (uint8_t *)&v16, 0x16u);

    }
    v4 = *(_QWORD *)(a1 + 48);
    v8 = objc_msgSend(*(id *)(a1 + 32), "statusCode");
    objc_msgSend(*(id *)(a1 + 32), "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCEndpointConnection errorForStatus:url:](FCEndpointConnection, "errorForStatus:url:", v8, v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v6;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 16))(v4, 0, v6);

}

void __64__FCAssetKeyService_fetchWrappingKeysWithIDs_completionHandler___block_invoke_20(uint64_t a1)
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
  v2 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "Asset key service failed to parse response", v8, 2u);
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

uint64_t __60__FCAssetKeyService__performHTTPRequestWithData_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHTTPBody:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v3, "addValue:forHTTPHeaderField:", CFSTR("application/x-protobuf"), CFSTR("Content-Type"));
  +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endpointConnectionClientID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addValue:forHTTPHeaderField:", v5, CFSTR("X-CLIENT-ID"));

  v6 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_DEFAULT, "Asset key service will generate Mescal signature", buf, 2u);
  }
  v7 = *(_QWORD *)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__FCAssetKeyService__performHTTPRequestWithData_completion___block_invoke_26;
  v10[3] = &unk_1E4642CD0;
  v14 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 40);
  v12 = v3;
  v13 = *(_QWORD *)(a1 + 48);
  v8 = v3;
  +[FCMescalSignature signatureFromData:completion:](FCMescalSignature, "signatureFromData:completion:", v7, v10);

  return 0;
}

void __60__FCAssetKeyService__performHTTPRequestWithData_completion___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  _BOOL4 v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_ERROR, "Asset key service failed to sign analytics data with Mescal", buf, 2u);
    }
    v8 = *(void **)(a1 + 56);
    if (v8)
    {
      v9 = *(NSObject **)(a1 + 32);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __60__FCAssetKeyService__performHTTPRequestWithData_completion___block_invoke_27;
      v12[3] = &unk_1E463B2D0;
      v14 = v8;
      v13 = v6;
      dispatch_async(v9, v12);

    }
  }
  else
  {
    v10 = FCDefaultLog;
    v11 = os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_DEFAULT, "Asset key service will construct request with mescal signature", buf, 2u);
      }
      objc_msgSend(*(id *)(a1 + 40), "setValue:forHTTPHeaderField:", v5, CFSTR("X-Apple-ActionSignature"));
    }
    else if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_DEFAULT, "Asset key service will construct request", buf, 2u);
    }
    -[FCAssetKeyService executeRequest:callbackQueue:completion:](*(_QWORD *)(a1 + 48), *(void **)(a1 + 40), *(void **)(a1 + 32), *(void **)(a1 + 56));
  }

}

uint64_t __60__FCAssetKeyService__performHTTPRequestWithData_completion___block_invoke_27(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

- (void)executeRequest:(void *)a3 callbackQueue:(void *)a4 completion:
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;

  v7 = a3;
  v8 = a4;
  if (a1)
  {
    v9 = *(void **)(a1 + 16);
    v10 = a2;
    objc_msgSend(v9, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "requestByEncodingRequest:parameters:", v10, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __61__FCAssetKeyService_executeRequest_callbackQueue_completion___block_invoke;
    v13[3] = &unk_1E4642D20;
    v16 = v8;
    v14 = v7;
    v15 = a1;
    objc_msgSend(v12, "addFinishBlock:", v13);

  }
}

void __60__FCAssetKeyService__performHTTPRequestWithData_completion___block_invoke_30(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(a1 + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __60__FCAssetKeyService__performHTTPRequestWithData_completion___block_invoke_2;
    v6[3] = &unk_1E463B2D0;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __60__FCAssetKeyService__performHTTPRequestWithData_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

void __61__FCAssetKeyService_executeRequest_callbackQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[8];
  _QWORD v19[7];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __61__FCAssetKeyService_executeRequest_callbackQueue_completion___block_invoke_2;
    v19[3] = &unk_1E463DB98;
    v8 = *(void **)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 32);
    v19[4] = v6;
    v19[5] = v9;
    v19[6] = v8;
    v10 = v8;
    __61__FCAssetKeyService_executeRequest_callbackQueue_completion___block_invoke_2((uint64_t)v19);
  }
  else
  {
    v11 = FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_DEFAULT, "Asset key service did construct request", buf, 2u);
    }
    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
      v13 = *(void **)(v12 + 8);
    else
      v13 = 0;
    objc_msgSend(v13, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dataTaskPromiseWithRequest:", v5);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __61__FCAssetKeyService_executeRequest_callbackQueue_completion___block_invoke_33;
    v15[3] = &unk_1E463DCD8;
    v17 = *(id *)(a1 + 48);
    v16 = *(id *)(a1 + 32);
    objc_msgSend(v10, "addFinishBlock:", v15);

  }
}

void __61__FCAssetKeyService_executeRequest_callbackQueue_completion___block_invoke_2(uint64_t a1)
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
  v2 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v10 = v5;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "Asset key service failed to construct request with error: %{public}@", buf, 0xCu);
  }
  v3 = *(void **)(a1 + 48);
  if (v3)
  {
    v4 = *(NSObject **)(a1 + 40);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __61__FCAssetKeyService_executeRequest_callbackQueue_completion___block_invoke_32;
    v6[3] = &unk_1E463B2D0;
    v8 = v3;
    v7 = *(id *)(a1 + 32);
    dispatch_async(v4, v6);

  }
}

uint64_t __61__FCAssetKeyService_executeRequest_callbackQueue_completion___block_invoke_32(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

void __61__FCAssetKeyService_executeRequest_callbackQueue_completion___block_invoke_33(uint64_t a1, void *a2, void *a3)
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
    v12[2] = __61__FCAssetKeyService_executeRequest_callbackQueue_completion___block_invoke_2_35;
    v12[3] = &unk_1E463DCB0;
    v16 = v10;
    v13 = v5;
    v14 = v9;
    v15 = v6;
    dispatch_async(v11, v12);

  }
}

void __61__FCAssetKeyService_executeRequest_callbackQueue_completion___block_invoke_2_35(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "data");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointURLPromise, 0);
  objc_storeStrong((id *)&self->_requestEncoder, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
