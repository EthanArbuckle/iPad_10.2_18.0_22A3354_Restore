@implementation FCAVAssetKeyFetchOperation

- (void)performOperation
{
  NSObject *v3;
  void *v4;
  NSURL *keyURI;
  NSURL *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (id)FCOperationLog;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[FCOperation shortOperationDescription](self, "shortOperationDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      keyURI = self->_keyURI;
    else
      keyURI = 0;
    v6 = keyURI;
    -[NSURL absoluteString](v6, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v4;
    v25 = 2114;
    v26 = v7;
    _os_log_impl(&dword_1A1B90000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ will fetch AV content key for %{public}@", buf, 0x16u);

  }
  v8 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __46__FCAVAssetKeyFetchOperation_performOperation__block_invoke;
  v22[3] = &unk_1E463D3A8;
  v22[4] = self;
  objc_msgSend(MEMORY[0x1E0D60AF0], "firstly:", v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v8;
  v21[1] = 3221225472;
  v21[2] = __46__FCAVAssetKeyFetchOperation_performOperation__block_invoke_2;
  v21[3] = &unk_1E4644038;
  v21[4] = self;
  objc_msgSend(v9, "thenOn:then:", v10, v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v8;
  v20[1] = 3221225472;
  v20[2] = __46__FCAVAssetKeyFetchOperation_performOperation__block_invoke_3;
  v20[3] = &unk_1E4644038;
  v20[4] = self;
  objc_msgSend(v11, "thenOn:then:", v12, v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __46__FCAVAssetKeyFetchOperation_performOperation__block_invoke_4;
  v19[3] = &unk_1E4644038;
  v19[4] = self;
  objc_msgSend(v13, "thenOn:then:", v14, v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __46__FCAVAssetKeyFetchOperation_performOperation__block_invoke_5;
  v18[3] = &unk_1E463EA38;
  v18[4] = self;
  v17 = (id)objc_msgSend(v15, "errorOn:error:", v16, v18);

}

id __46__FCAVAssetKeyFetchOperation_performOperation__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (!v1)
    return 0;
  v2 = objc_alloc(MEMORY[0x1E0D60AF0]);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__FCAVAssetKeyFetchOperation__promiseAppCertificate__block_invoke;
  v4[3] = &unk_1E463DAD0;
  v4[4] = v1;
  return (id)objc_msgSend(v2, "initWithResolver:", v4);
}

_QWORD *__46__FCAVAssetKeyFetchOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v3 = *(_QWORD **)(a1 + 32);
  if (v3)
  {
    v4 = (void *)v3[48];
    v5 = (void *)v3[49];
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = v4;
  v7 = v5;
  v8 = a2;
  if (v3)
  {
    v9 = objc_alloc(MEMORY[0x1E0D60AF0]);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __81__FCAVAssetKeyFetchOperation__promiseSPCDataForKeyRequest_keyURI_appCertificate___block_invoke;
    v11[3] = &unk_1E463F5A8;
    v12 = v7;
    v13 = v6;
    v14 = v8;
    v3 = (_QWORD *)objc_msgSend(v9, "initWithResolver:", v11);

  }
  return v3;
}

id __46__FCAVAssetKeyFetchOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v4 = *(void **)(v3 + 384);
    v5 = *(void **)(v3 + 392);
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = v4;
  v7 = v5;
  v8 = a2;
  if (v3)
  {
    v9 = objc_alloc(MEMORY[0x1E0D60AF0]);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __77__FCAVAssetKeyFetchOperation__promiseContentKeyForKeyRequest_keyURI_spcData___block_invoke;
    v12[3] = &unk_1E46498B0;
    v12[4] = v3;
    v13 = v7;
    v14 = v8;
    v15 = v6;
    v10 = (void *)objc_msgSend(v9, "initWithResolver:", v12);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __46__FCAVAssetKeyFetchOperation_performOperation__block_invoke_4(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 368), a2);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", 0);

  return 0;
}

uint64_t __46__FCAVAssetKeyFetchOperation_performOperation__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", a2);
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4;
  void (**fetchCompletionHandler)(id, NSData *);
  id v6;

  v4 = a3;
  if (self)
  {
    fetchCompletionHandler = (void (**)(id, NSData *))self->_fetchCompletionHandler;
    if (fetchCompletionHandler)
    {
      v6 = v4;
      fetchCompletionHandler[2](fetchCompletionHandler, self->_resultCKCData);
      v4 = v6;
    }
  }

}

- (unint64_t)maxRetries
{
  return 1;
}

- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  v5 = a3;
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("FCErrorDomain")))
  {

    goto LABEL_5;
  }
  v7 = objc_msgSend(v5, "code");

  if (v7 != 38)
  {
LABEL_5:
    v8 = 0;
    goto LABEL_6;
  }
  *a4 = (id)objc_opt_new();
  v8 = 1;
LABEL_6:

  return v8;
}

- (void)resetForRetry
{
  if (self)
    self = (FCAVAssetKeyFetchOperation *)self->_cache;
  -[FCAVAssetKeyFetchOperation clearKeyServerCertificate](self, "clearKeyServerCertificate");
}

void __52__FCAVAssetKeyFetchOperation__promiseAppCertificate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(id, void *);
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  void (**v15)(id, void *);

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    v8 = *(void **)(v7 + 408);
  else
    v8 = 0;
  objc_msgSend(v8, "keyServerCertificate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v5[2](v5, v9);
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
      v11 = *(void **)(v10 + 400);
    else
      v11 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __52__FCAVAssetKeyFetchOperation__promiseAppCertificate__block_invoke_3;
    v13[3] = &unk_1E464A1A0;
    v12 = v6;
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = v12;
    v15 = v5;
    objc_msgSend(v11, "fetchAppCertificateWithCompletionHandler:", v13);

  }
}

void __52__FCAVAssetKeyFetchOperation__promiseAppCertificate__block_invoke_3(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  void (*v6)(void);
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a2;
  v10 = v5;
  if (a3)
  {
    v6 = *(void (**)(void))(a1[5] + 16);
  }
  else
  {
    v7 = v5;
    v8 = a1[4];
    if (v8)
      v9 = *(void **)(v8 + 408);
    else
      v9 = 0;
    objc_msgSend(v9, "saveKeyServerCertificate:", v7);
    v6 = *(void (**)(void))(a1[6] + 16);
  }
  v6();

}

void __81__FCAVAssetKeyFetchOperation__promiseSPCDataForKeyRequest_keyURI_appCertificate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[5];

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v10 = *(void **)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __81__FCAVAssetKeyFetchOperation__promiseSPCDataForKeyRequest_keyURI_appCertificate___block_invoke_3;
    v11[3] = &unk_1E4649CC0;
    v12 = v6;
    v13 = v5;
    objc_msgSend(v10, "makeStreamingContentKeyRequestDataForApp:contentIdentifier:options:completionHandler:", v9, v8, 0, v11);

  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __81__FCAVAssetKeyFetchOperation__promiseSPCDataForKeyRequest_keyURI_appCertificate___block_invoke_2;
    v14[3] = &unk_1E463B598;
    v14[4] = v6;
    __81__FCAVAssetKeyFetchOperation__promiseSPCDataForKeyRequest_keyURI_appCertificate___block_invoke_2((uint64_t)v14);
  }

}

void __81__FCAVAssetKeyFetchOperation__promiseSPCDataForKeyRequest_keyURI_appCertificate___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "fc_invalidAVAssetKeyURIError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

uint64_t __81__FCAVAssetKeyFetchOperation__promiseSPCDataForKeyRequest_keyURI_appCertificate___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __77__FCAVAssetKeyFetchOperation__promiseContentKeyForKeyRequest_keyURI_spcData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    v9 = *(void **)(v8 + 400);
  else
    v9 = 0;
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 48);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __77__FCAVAssetKeyFetchOperation__promiseContentKeyForKeyRequest_keyURI_spcData___block_invoke_2;
  v17[3] = &unk_1E464A1C8;
  v21 = v6;
  v12 = *(id *)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(a1 + 40);
  v18 = v12;
  v19 = v13;
  v20 = v14;
  v22 = v5;
  v15 = v5;
  v16 = v7;
  objc_msgSend(v9, "fetchContentKeyWithURI:spcData:completionHandler:", v10, v11, v17);

}

void __77__FCAVAssetKeyFetchOperation__promiseContentKeyForKeyRequest_keyURI_spcData___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7;
  void (**v8)(id, _QWORD);
  void *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  void (*v15)(void);
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void (**v24)(id, _QWORD);
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (a4)
  {
    v8 = (void (**)(id, _QWORD))*(id *)(a1 + 56);
    v8[2](v8, a4);
  }
  else
  {
    v9 = *(void **)(a1 + 32);
    v20 = 0;
    objc_msgSend(v9, "persistableContentKeyFromKeyVendorResponse:options:error:", a2, 0, &v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void (**)(id, _QWORD))v20;
    if (v10)
    {
      v11 = *(_QWORD **)(a1 + 40);
      if (v11)
        v11 = (_QWORD *)v11[51];
      v12 = (void *)MEMORY[0x1E0C99D68];
      v13 = v11;
      objc_msgSend(v12, "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "saveAssetKeyData:creationDate:expirationDate:forURI:", v10, v14, v7, *(_QWORD *)(a1 + 48));

      v15 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    }
    else
    {
      v16 = (void *)FCAVAssetLog;
      if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
      {
        v17 = *(void **)(a1 + 48);
        v18 = v16;
        objc_msgSend(v17, "absoluteString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v22 = v19;
        v23 = 2114;
        v24 = v8;
        _os_log_error_impl(&dword_1A1B90000, v18, OS_LOG_TYPE_ERROR, "failed to generate persistable AV content key for %{public}@ with error: %{public}@", buf, 0x16u);

      }
      v15 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    }
    v15();

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_keyURI, 0);
  objc_storeStrong((id *)&self->_keyRequest, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
  objc_storeStrong((id *)&self->_resultCKCData, 0);
}

@end
