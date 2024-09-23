@implementation NMAPIRequestOperation

- (NMAPIRequestOperation)initWithRequest:(id)a3
{
  id v4;
  NMAPIRequestOperation *v5;
  NMAPIRequestOperation *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NMAPIRequestOperation;
  v5 = -[MPStoreModelRequestOperation init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[MPStoreModelRequestOperation setRequest:](v5, "setRequest:", v4);

  return v6;
}

- (NMAPIRequestOperation)initWithRequest:(id)a3 responseHandler:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NMAPIRequestOperation;
  return -[MPStoreModelRequestOperation initWithRequest:responseHandler:](&v5, sel_initWithRequest_responseHandler_, a3, a4);
}

- (id)configurationForLoadingModelDataWithStoreURLBag:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_storeStrong((id *)&self->_storeURLBag, a3);
  -[MPStoreModelRequestOperation request](self, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "urlComponentsWithStoreURLBag:error:", v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDD16B0];
    objc_msgSend(v9, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "requestWithURL:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setHTTPMethod:", CFSTR("GET"));
    -[MPStoreModelRequestOperation remainingTimeInterval](self, "remainingTimeInterval");
    objc_msgSend(v12, "setTimeoutInterval:");
    v13 = objc_alloc(MEMORY[0x24BDDCC98]);
    v17[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithURLRequests:", v14);

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC8580], -7101, 0);
    v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)produceResponseWithLoadedOutput:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NMAPIDefaultSectionedCollectionDataSource *v27;
  void *v28;
  NMAPIDefaultSectionedCollectionDataSource *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  NMLogForCategory(10);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[NMAPIRequestOperation produceResponseWithLoadedOutput:completion:].cold.4();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_alloc(MEMORY[0x24BDDCBD0]);
    -[NMAPIRequestOperation _adjustedPayload:path:](self, "_adjustedPayload:path:", v6, &stru_24DD29F20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithPayload:", v10);

    -[MPAsyncOperation userIdentity](self, "userIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUserIdentity:", v12);

    objc_msgSend(MEMORY[0x24BDDCBC8], "sharedServerObjectDatabase");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    objc_msgSend(v13, "importObjectsFromRequest:options:error:", v11, 1, &v37);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v37;

    if (v15)
    {
      NMLogForCategory(9);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[NMAPIRequestOperation produceResponseWithLoadedOutput:completion:].cold.2();

      v7[2](v7, 0, v15);
    }
    else
    {
      -[MPStoreModelRequestOperation request](self, "request");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_alloc_init((Class)objc_msgSend(v18, "responseParserClass"));

      objc_msgSend(v14, "annotatedPayload");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0;
      objc_msgSend(v19, "resultsWithDictionary:error:", v20, &v36);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v36;

      if (v22)
      {
        NMLogForCategory(9);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[NMAPIRequestOperation produceResponseWithLoadedOutput:completion:].cold.1();

        v7[2](v7, 0, v22);
      }
      else
      {
        v35 = v19;
        v24 = v21;
        -[MPStoreModelRequestOperation request](self, "request");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "cachePolicy");

        if ((v26 & 0xFFFFFFFFFFFFFFFELL) == 2)
          -[NMAPIRequestOperation _writeResponseDictionaryToDisk:](self, "_writeResponseDictionaryToDisk:", v6);
        v27 = [NMAPIDefaultSectionedCollectionDataSource alloc];
        -[MPStoreModelRequestOperation request](self, "request");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v24;
        v29 = -[NMAPIDefaultSectionedCollectionDataSource initWithRequest:results:storeURLBag:](v27, "initWithRequest:results:storeURLBag:", v28, v24, self->_storeURLBag);

        v30 = objc_alloc(MEMORY[0x24BDDC9B0]);
        -[MPStoreModelRequestOperation request](self, "request");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)objc_msgSend(v30, "initWithRequest:", v31);

        v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDC768]), "initWithDataSource:", v29);
        objc_msgSend(v32, "setResults:", v33);

        v21 = v34;
        -[NMAPIRequestOperation _personalizeResponse:completion:](self, "_personalizeResponse:completion:", v32, v7);

        v19 = v35;
      }

    }
  }
  else
  {
    NMLogForCategory(9);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[NMAPIRequestOperation produceResponseWithLoadedOutput:completion:].cold.3();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC8580], -7102, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v15);
  }

}

- (void)execute
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  void *v7;
  objc_super v8;
  _QWORD v9[5];

  -[MPStoreModelRequestOperation request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "cachePolicy");

  v5 = 1;
  switch(v4)
  {
    case 0:
    case 3:
      goto LABEL_2;
    case 1:
      goto LABEL_5;
    case 2:
      -[NMAPIRequestOperation _readResponseDictionaryFromDisk](self, "_readResponseDictionaryFromDisk");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
LABEL_2:
        v8.receiver = self;
        v8.super_class = (Class)NMAPIRequestOperation;
        -[MPStoreModelRequestOperation execute](&v8, sel_execute);
        return;
      }
      v5 = 0;
LABEL_5:
      -[NMAPIRequestOperation _readResponseDictionaryFromDisk](self, "_readResponseDictionaryFromDisk");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v9[0] = MEMORY[0x24BDAC760];
        v9[1] = 3221225472;
        v9[2] = __32__NMAPIRequestOperation_execute__block_invoke;
        v9[3] = &unk_24DD29800;
        v9[4] = self;
        -[NMAPIRequestOperation produceResponseWithLoadedOutput:completion:](self, "produceResponseWithLoadedOutput:completion:", v7, v9);
      }
      else
      {
        if (!v5)
          return;
        -[MPStoreModelRequestOperation _finishWithResponse:error:](self, "_finishWithResponse:error:", 0, 0);
      }

      return;
    default:
      return;
  }
}

uint64_t __32__NMAPIRequestOperation_execute__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWithResponse:error:", a2, a3);
}

- (void)_writeResponseDictionaryToDisk:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MPStoreModelRequestOperation request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cacheURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (v4)
    {
      v19 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v4, 0, &v19);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v19;
      if (v8)
      {
        NMLogForCategory(9);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[NMAPIRequestOperation _writeResponseDictionaryToDisk:].cold.4();
      }
      else
      {
        -[MPStoreModelRequestOperation request](self, "request");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "cacheURL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0;
        v12 = objc_msgSend(v7, "writeToURL:options:error:", v11, 1, &v18);
        v9 = v18;

        NMLogForCategory(9);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v12)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            -[MPStoreModelRequestOperation request](self, "request");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPStoreModelRequestOperation request](self, "request");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "cacheURL");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v21 = v15;
            v22 = 2112;
            v23 = v17;
            _os_log_impl(&dword_21A803000, v14, OS_LOG_TYPE_DEFAULT, "[NMAPIRequestOperation] Cached new response for %@ at cacheURL %@", buf, 0x16u);

          }
        }
        else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          -[NMAPIRequestOperation _writeResponseDictionaryToDisk:].cold.3();
        }

      }
    }
    else
    {
      NMLogForCategory(9);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[NMAPIRequestOperation _writeResponseDictionaryToDisk:].cold.2(v8);
    }
  }
  else
  {
    NMLogForCategory(9);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[NMAPIRequestOperation _writeResponseDictionaryToDisk:].cold.1(self, v8);
  }

}

- (id)_readResponseDictionaryFromDisk
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[MPStoreModelRequestOperation request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cacheURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDBCE50];
    -[MPStoreModelRequestOperation request](self, "request");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cacheURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v5, "dataWithContentsOfURL:options:error:", v7, 0, &v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v18;

    if (v9)
    {
      NMLogForCategory(9);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[NMAPIRequestOperation _readResponseDictionaryFromDisk].cold.3();
      v11 = 0;
    }
    else
    {
      v17 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v8, 0, &v17);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v17;
      NMLogForCategory(9);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v10)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[NMAPIRequestOperation _readResponseDictionaryFromDisk].cold.2();
      }
      else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        -[MPStoreModelRequestOperation request](self, "request");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "cacheURL");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v20 = v15;
        _os_log_impl(&dword_21A803000, v13, OS_LOG_TYPE_DEFAULT, "[NMAPIRequestOperation] Found file at cacheURL (%@)", buf, 0xCu);

      }
    }

  }
  else
  {
    NMLogForCategory(9);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[NMAPIRequestOperation _writeResponseDictionaryToDisk:].cold.1(self, v9);
    v11 = 0;
  }

  return v11;
}

- (id)_adjustedPayload:(id)a3 path:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  NMAPIRequestOperation *v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v6, "mutableCopy");
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __47__NMAPIRequestOperation__adjustedPayload_path___block_invoke;
    v23[3] = &unk_24DD29828;
    v24 = v8;
    v25 = self;
    v26 = v7;
    v9 = v8;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v23);
    v10 = (void *)objc_msgSend(v9, "copy");

LABEL_12:
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          -[NMAPIRequestOperation _adjustedPayload:path:](self, "_adjustedPayload:path:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15), v7, (_QWORD)v19);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v13);
    }

    v10 = (void *)objc_msgSend(v9, "copy");
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(v7, "hasSuffix:", CFSTR("/data/attributes/artwork/url")))
  {
    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{w}x{h}{c}.{f}"), CFSTR("{w}x{h}cc.{f}"));
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = v6;
  }
  v10 = v17;
LABEL_18:

  return v10;
}

void __47__NMAPIRequestOperation__adjustedPayload_path___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v4 = (void *)a1[4];
  v5 = (void *)a1[5];
  v6 = (void *)a1[6];
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("/%@"), v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_adjustedPayload:path:", v7, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKey:", v9, v8);
}

- (void)_personalizeResponse:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v6 = a4;
  objc_msgSend(a3, "results");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x24BDDCA88]);
  v9 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __57__NMAPIRequestOperation__personalizeResponse_completion___block_invoke;
  v18[3] = &unk_24DD29878;
  v19 = v8;
  v20 = v7;
  v10 = v7;
  v11 = v8;
  objc_msgSend(v10, "enumerateSectionsUsingBlock:", v18);
  v12 = objc_alloc(MEMORY[0x24BDDCC60]);
  -[MPStoreModelRequestOperation request](self, "request");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithUnpersonalizedRequest:unpersonalizedContentDescriptors:", v13, v11);

  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __57__NMAPIRequestOperation__personalizeResponse_completion___block_invoke_3;
  v16[3] = &unk_24DD298A0;
  v17 = v6;
  v15 = v6;
  objc_msgSend(v14, "performWithResponseHandler:", v16);

}

void __57__NMAPIRequestOperation__personalizeResponse_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = *(void **)(a1 + 32);
  v6 = (objc_class *)MEMORY[0x24BDDCC58];
  v7 = a2;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithModel:personalizationStyle:", v7, 1);

  objc_msgSend(v5, "appendSection:", v8);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__NMAPIRequestOperation__personalizeResponse_completion___block_invoke_2;
  v10[3] = &unk_24DD29850;
  v9 = *(void **)(a1 + 40);
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v9, "enumerateItemsInSectionAtIndex:usingBlock:", a3, v10);

}

void __57__NMAPIRequestOperation__personalizeResponse_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  objc_class *v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = (objc_class *)MEMORY[0x24BDDCC58];
  v4 = a2;
  v5 = (id)objc_msgSend([v3 alloc], "initWithModel:personalizationStyle:", v4, 1);

  objc_msgSend(v2, "appendItem:", v5);
}

uint64_t __57__NMAPIRequestOperation__personalizeResponse_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeURLBag, 0);
}

- (void)produceResponseWithLoadedOutput:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_21A803000, v0, v1, "[NMAPIRequestOperation] Parsing failed with error: %@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)produceResponseWithLoadedOutput:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_21A803000, v0, v1, "[NMAPIRequestOperation] Server Object Database import failed with error: %@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)produceResponseWithLoadedOutput:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_21A803000, v0, v1, "[NMAPIRequestOperation] Expected dictionary for loaded output: %@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)produceResponseWithLoadedOutput:completion:.cold.4()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_21A803000, v0, OS_LOG_TYPE_DEBUG, "[NMAPIRequestOperation] Loaded output: %@", v1, 0xCu);
  OUTLINED_FUNCTION_3();
}

- (void)_writeResponseDictionaryToDisk:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_21A803000, a2, v4, "[NMAPIRequestOperation] Missing cacheURL property: %@", v5);

  OUTLINED_FUNCTION_7();
}

- (void)_writeResponseDictionaryToDisk:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21A803000, log, OS_LOG_TYPE_ERROR, "[NMAPIRequestOperation] Cannot cache an empty response dictionary", v1, 2u);
}

- (void)_writeResponseDictionaryToDisk:.cold.3()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6();
  objc_msgSend(v0, "request");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_21A803000, v2, v3, "[NMAPIRequestOperation] Failed to write response for %@ to disk due to write error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)_writeResponseDictionaryToDisk:.cold.4()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6();
  objc_msgSend(v0, "request");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_21A803000, v2, v3, "[NMAPIRequestOperation] Failed to write response for %@ to disk due to serialization error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)_readResponseDictionaryFromDisk
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  objc_msgSend(v0, "request");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cacheURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_21A803000, v3, v4, "[NMAPIRequestOperation] Failed to read from cacheURL %@ due to read error: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

@end
