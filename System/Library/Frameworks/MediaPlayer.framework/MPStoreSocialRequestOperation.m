@implementation MPStoreSocialRequestOperation

- (MPStoreSocialRequestOperation)initWithDataSource:(id)a3
{
  id v5;
  MPStoreSocialRequestOperation *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *accessQueue;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MPStoreSocialRequestOperation;
  v6 = -[MPAsyncOperation init](&v10, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.MPStoreSocialRequestOperation.accessQueue", MEMORY[0x1E0C80D50]);
    accessQueue = v6->_accessQueue;
    v6->_accessQueue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_dataSource, a3);
  }

  return v6;
}

- (void)setResponseHandler:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__MPStoreSocialRequestOperation_setResponseHandler___block_invoke;
  v7[3] = &unk_1E3162560;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(accessQueue, v7);

}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MPStoreSocialRequestOperation;
  -[MPAsyncOperation cancel](&v4, sel_cancel);
  if (self->_request)
  {
    objc_msgSend(MEMORY[0x1E0DDC0F0], "defaultSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelRequest:", self->_request);

  }
}

- (void)execute
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];

  v3 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __40__MPStoreSocialRequestOperation_execute__block_invoke;
  v12[3] = &unk_1E3163100;
  v12[4] = self;
  v4 = (void *)MEMORY[0x19403A810](v12, a2);
  v5 = objc_alloc(MEMORY[0x1E0DDC0A0]);
  objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithIdentity:", v6);

  objc_msgSend(MEMORY[0x1E0DDC0D0], "sharedBagProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __40__MPStoreSocialRequestOperation_execute__block_invoke_2;
  v10[3] = &unk_1E315D778;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "getBagForRequestContext:withCompletionHandler:", v7, v10);

}

- (id)_requestURLFromBag:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MPStoreSocialRequestOperationDataSource bagKey](self->_dataSource, "bagKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "_urlStringForKey:inBag:", v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
LABEL_17:
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithString:", v6);
      -[MPStoreSocialRequestOperationDataSource queryItems](self->_dataSource, "queryItems");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setQueryItems:", v15);

      objc_msgSend(v14, "URL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_18;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      -[MPStoreSocialRequestOperationDataSource fallbackBagKeys](self->_dataSource, "fallbackBagKeys", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v18;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v18 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend((id)objc_opt_class(), "_urlStringForKey:inBag:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), v4);
            v12 = objc_claimAutoreleasedReturnValue();
            if (v12)
            {
              v6 = (void *)v12;

              goto LABEL_17;
            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v9)
            continue;
          break;
        }
      }

    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MPStoreSocialRequestOperationDataSource fallbackURLString](self->_dataSource, "fallbackURLString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      goto LABEL_17;
  }
  v13 = 0;
LABEL_18:

  return v13;
}

- (MPStoreSocialRequestOperationDataSource)dataSource
{
  return self->_dataSource;
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __40__MPStoreSocialRequestOperation_execute__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 280);
  *(_QWORD *)(v4 + 280) = 0;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__36113;
  v14 = __Block_byref_object_dispose__36114;
  v15 = 0;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 272);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__MPStoreSocialRequestOperation_execute__block_invoke_4;
  v9[3] = &unk_1E3163580;
  v9[4] = v6;
  v9[5] = &v10;
  dispatch_sync(v7, v9);
  v8 = v11[5];
  if (v8)
    (*(void (**)(uint64_t, BOOL, id))(v8 + 16))(v8, v3 == 0, v3);
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v3);
  _Block_object_dispose(&v10, 8);

}

void __40__MPStoreSocialRequestOperation_execute__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_requestURLFromBag:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A8]), "initWithURL:", v4);
    objc_msgSend((id)objc_opt_class(), "_stringRepresentationForHTTPMethod:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "httpMethod"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHTTPMethod:", v6);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "httpBody");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend((id)objc_opt_class(), "_stringRepresentationForHTTPBodyType:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "httpBodyType"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forHTTPHeaderField:", v8, CFSTR("Content-Type"));

      objc_msgSend(v5, "setHTTPBody:", v7);
    }
    v9 = objc_alloc(MEMORY[0x1E0DDC0A0]);
    objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithIdentity:", v10);

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DDC0A8]), "initWithURLRequest:requestContext:", v5, v11);
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 280);
    *(_QWORD *)(v13 + 280) = v12;

    objc_msgSend(MEMORY[0x1E0DDC0F0], "defaultSession");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(a1 + 40);
    v18 = *(_QWORD *)(v16 + 280);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __40__MPStoreSocialRequestOperation_execute__block_invoke_3;
    v19[3] = &unk_1E3162038;
    v19[4] = v16;
    v20 = v17;
    objc_msgSend(v15, "enqueueDataRequest:withCompletionHandler:", v18, v19);

  }
}

void __40__MPStoreSocialRequestOperation_execute__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  id v12;

  v12 = a3;
  v5 = a2;
  objc_msgSend(v5, "urlResponse");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parsedBodyDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v12;
  if (!v12)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPStoreSocialErrorDomain"), -3001, 0);
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v8 = (void *)v9;
      goto LABEL_11;
    }
    if (objc_msgSend(v6, "statusCode") != 200)
    {
      +[MPStoreSocialServiceController _internalErrorForHTTPResponseCode:](MPStoreSocialServiceController, "_internalErrorForHTTPResponseCode:", objc_msgSend(v6, "statusCode"));
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    if (!v7
      || (objc_msgSend(v7, "ic_stringValueForKey:", CFSTR("status")),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("success")),
          v10,
          (v11 & 1) == 0))
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MPStoreSocialErrorDomain"), -3000, 0);
      goto LABEL_10;
    }
    v8 = 0;
  }
LABEL_11:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __40__MPStoreSocialRequestOperation_execute__block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x19403A810](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 296));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __52__MPStoreSocialRequestOperation_setResponseHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 296);
  *(_QWORD *)(v3 + 296) = v2;

}

+ (id)_stringRepresentationForHTTPBodyType:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("application/json; charset=utf-8");
  if (a3 != 1)
    v3 = 0;
  if (a3)
    return (id)v3;
  else
    return CFSTR("application/x-www-form-urlencoded");
}

+ (id)_stringRepresentationForHTTPMethod:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return 0;
  else
    return off_1E315D798[a3];
}

+ (id)_urlStringForKey:(id)a3 inBag:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  objc_msgSend(a4, "dictionaryForBagKey:", *MEMORY[0x1E0DDBEA0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKey:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString())
      v9 = v8;
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
