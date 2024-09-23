@implementation FCOfflineANFArticlesFetchOperation

- (id)initWithContext:(void *)a3 config:(void *)a4 ANFHelper:(void *)a5 articleIDs:
{
  id v10;
  id v11;
  id v12;
  id v13;
  id *v14;
  uint64_t v15;
  id v16;
  objc_super v18;

  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (a1)
  {
    v18.receiver = a1;
    v18.super_class = (Class)FCOfflineANFArticlesFetchOperation;
    v14 = (id *)objc_msgSendSuper2(&v18, sel_init);
    a1 = v14;
    if (v14)
    {
      objc_storeStrong(v14 + 53, a2);
      objc_storeStrong(a1 + 54, a3);
      objc_storeStrong(a1 + 55, a4);
      v15 = objc_msgSend(v13, "copy");
      v16 = a1[56];
      a1[56] = (id)v15;

    }
  }

  return a1;
}

- (id)initWithContext:(void *)a3 config:(void *)a4 ANFHelper:(void *)a5 headlines:
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id *v14;
  uint64_t v15;
  id v16;

  v9 = a5;
  if (a1)
  {
    v10 = a4;
    v11 = a3;
    v12 = a2;
    objc_msgSend(v9, "fc_arrayByTransformingWithBlock:", &__block_literal_global_146);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[FCOfflineANFArticlesFetchOperation initWithContext:config:ANFHelper:articleIDs:](a1, v12, v11, v10, v13);

    if (v14)
    {
      v15 = objc_msgSend(v9, "copy");
      v16 = v14[57];
      v14[57] = (id)v15;

    }
    a1 = v14;

  }
  return a1;
}

uint64_t __81__FCOfflineANFArticlesFetchOperation_initWithContext_config_ANFHelper_headlines___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "articleID");
}

- (BOOL)validateOperation
{
  char v3;
  char v4;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self && self->_context)
  {
    v3 = 1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("offline ANF fetch operation requires a context"));
      v8 = 136315906;
      v9 = "-[FCOfflineANFArticlesFetchOperation validateOperation]";
      v10 = 2080;
      v11 = "FCOfflineANFArticlesFetchOperation.m";
      v12 = 1024;
      v13 = 110;
      v14 = 2114;
      v15 = v6;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);

    }
    v3 = 0;
    if (!self)
      goto LABEL_9;
  }
  if (self->_ANFHelper)
  {
    v4 = 1;
    return v4 & v3;
  }
LABEL_9:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("offline ANF fetch operation requires a flint helper"));
    v8 = 136315906;
    v9 = "-[FCOfflineANFArticlesFetchOperation validateOperation]";
    v10 = 2080;
    v11 = "FCOfflineANFArticlesFetchOperation.m";
    v12 = 1024;
    v13 = 114;
    v14 = 2114;
    v15 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);

  }
  v4 = 0;
  return v4 & v3;
}

- (void)performOperation
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[6];
  _QWORD v18[6];
  _QWORD v19[6];
  _QWORD v20[5];
  _QWORD v21[5];
  id v22;

  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__63;
  v21[4] = __Block_byref_object_dispose__63;
  v22 = 0;
  v3 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __54__FCOfflineANFArticlesFetchOperation_performOperation__block_invoke;
  v20[3] = &unk_1E463D3A8;
  v20[4] = self;
  objc_msgSend(MEMORY[0x1E0D60AF0], "firstly:", v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v3;
  v19[1] = 3221225472;
  v19[2] = __54__FCOfflineANFArticlesFetchOperation_performOperation__block_invoke_2;
  v19[3] = &unk_1E4640480;
  v19[4] = self;
  v19[5] = v21;
  objc_msgSend(v14, "thenOn:then:", v13, v19);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v18[1] = 3221225472;
  v18[2] = __54__FCOfflineANFArticlesFetchOperation_performOperation__block_invoke_19;
  v18[3] = &unk_1E4640480;
  v18[4] = self;
  v18[5] = v21;
  objc_msgSend(v4, "thenOn:then:", v5, v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v3;
  v17[1] = 3221225472;
  v17[2] = __54__FCOfflineANFArticlesFetchOperation_performOperation__block_invoke_2_20;
  v17[3] = &unk_1E4640480;
  v17[4] = self;
  v17[5] = v21;
  objc_msgSend(v6, "thenOn:then:", v7, v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v16[1] = 3221225472;
  v16[2] = __54__FCOfflineANFArticlesFetchOperation_performOperation__block_invoke_3;
  v16[3] = &unk_1E463EA10;
  v16[4] = self;
  objc_msgSend(v8, "thenOn:then:", v9, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v15[1] = 3221225472;
  v15[2] = __54__FCOfflineANFArticlesFetchOperation_performOperation__block_invoke_4;
  v15[3] = &unk_1E463EA38;
  v15[4] = self;
  v12 = (id)objc_msgSend(v10, "errorOn:error:", v11, v15);

  _Block_object_dispose(v21, 8);
}

id __54__FCOfflineANFArticlesFetchOperation_performOperation__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  id v11;
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    objc_msgSend(*(id *)(v1 + 456), "fc_arrayByTransformingWithBlock:", &__block_literal_global_22_3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "count");
    if (v3 >= objc_msgSend(*(id *)(v1 + 448), "count"))
    {
      v10 = (objc_class *)MEMORY[0x1E0D60AF0];
      v11 = v2;
      v1 = objc_msgSend([v10 alloc], "initWithValue:", v11);

    }
    else
    {
      v4 = *(_QWORD *)(v1 + 392);
      if (v4)
        (*(void (**)(double))(v4 + 16))(0.0);
      v5 = MEMORY[0x1E0C809B0];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __60__FCOfflineANFArticlesFetchOperation__promiseArticleRecords__block_invoke_3;
      v15[3] = &unk_1E463D3A8;
      v15[4] = v1;
      objc_msgSend(MEMORY[0x1E0D60AF0], "firstly:", v15);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      zalgo();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v5;
      v14[1] = 3221225472;
      v14[2] = __60__FCOfflineANFArticlesFetchOperation__promiseArticleRecords__block_invoke_4;
      v14[3] = &unk_1E463EA10;
      v14[4] = v1;
      objc_msgSend(v6, "thenOn:then:", v7, v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      zalgo();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v5;
      v13[1] = 3221225472;
      v13[2] = __60__FCOfflineANFArticlesFetchOperation__promiseArticleRecords__block_invoke_5;
      v13[3] = &unk_1E463EA38;
      v13[4] = v1;
      objc_msgSend(v8, "errorOn:error:", v9, v13);
      v1 = objc_claimAutoreleasedReturnValue();

    }
  }
  return (id)v1;
}

id __54__FCOfflineANFArticlesFetchOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  _BYTE v27[24];
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "fc_onlyObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCDescription descriptionWithObject:](FCDescription, "descriptionWithObject:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "base");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addField:object:", CFSTR("id"), v7);

    v8 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v4, "base");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "modificationDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateWithPBDate:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addField:object:", CFSTR("modificationDate"), v11);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v4, "backendArticleVersion"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addField:object:", CFSTR("backendVersion"), v12);

    objc_msgSend(v4, "flintDocumentURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addField:object:", CFSTR("anfURL"), v13);

    v14 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(void **)(a1 + 32);
      v16 = v14;
      objc_msgSend(v15, "shortOperationDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "descriptionString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v27 = 138543618;
      *(_QWORD *)&v27[4] = v17;
      *(_WORD *)&v27[12] = 2114;
      *(_QWORD *)&v27[14] = v18;
      _os_log_impl(&dword_1A1B90000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ will fetch contents of article record: %{public}@", v27, 0x16u);

    }
  }
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v20 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = v3;
  v21 = v3;

  v22 = *(_QWORD *)(a1 + 32);
  v23 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v22)
  {
    v24 = objc_alloc(MEMORY[0x1E0D60AF0]);
    *(_QWORD *)v27 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v27[8] = 3221225472;
    *(_QWORD *)&v27[16] = __75__FCOfflineANFArticlesFetchOperation__promiseThumbnailsFromArticleRecords___block_invoke;
    v28 = &unk_1E463F188;
    v29 = v23;
    v30 = v22;
    v25 = (void *)objc_msgSend(v24, "initWithResolver:", v27);

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

id __54__FCOfflineANFArticlesFetchOperation_performOperation__block_invoke_19(uint64_t a1)
{
  uint64_t v1;
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v1)
  {
    v3 = objc_alloc(MEMORY[0x1E0D60AF0]);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __77__FCOfflineANFArticlesFetchOperation__promiseANFDocumentsFromArticleRecords___block_invoke;
    v6[3] = &unk_1E463F188;
    v7 = v2;
    v8 = v1;
    v4 = (void *)objc_msgSend(v3, "initWithResolver:", v6);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __54__FCOfflineANFArticlesFetchOperation_performOperation__block_invoke_2_20(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v5 = a2;
  if (v3)
  {
    v6 = objc_alloc(MEMORY[0x1E0D60AF0]);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __93__FCOfflineANFArticlesFetchOperation__promiseANFResourcesFromArticleRecords_anfAssetHandles___block_invoke;
    v9[3] = &unk_1E463F5A8;
    v10 = v4;
    v11 = v5;
    v12 = v3;
    v7 = (void *)objc_msgSend(v6, "initWithResolver:", v9);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __54__FCOfflineANFArticlesFetchOperation_performOperation__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", 0);
  return 0;
}

uint64_t __54__FCOfflineANFArticlesFetchOperation_performOperation__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", a2);
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4;
  void (**fetchCompletionHandler)(void);
  id v6;

  v4 = a3;
  if (self)
  {
    fetchCompletionHandler = (void (**)(void))self->_fetchCompletionHandler;
    if (fetchCompletionHandler)
    {
      v6 = v4;
      fetchCompletionHandler[2]();
      v4 = v6;
    }
  }

}

id __60__FCOfflineANFArticlesFetchOperation__promiseArticleRecords__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;

  v2 = a2;
  objc_opt_class();
  if (v2)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;

  objc_msgSend(v4, "articleRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __60__FCOfflineANFArticlesFetchOperation__promiseArticleRecords__block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD);
  void (**v19)(_QWORD, _QWORD);
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;

  v1 = *(_QWORD *)(a1 + 32);
  if (!v1)
    return 0;
  if (*(_BYTE *)(v1 + 368))
  {
    v2 = *(id *)(v1 + 424);
    objc_msgSend(v2, "internalContentContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "articleRecordSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(id *)(v1 + 448);
    objc_msgSend(v4, "cachedRecordsWithIDs:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *(id *)(v1 + 448);
    v8 = objc_msgSend(v7, "count");
    v9 = objc_msgSend(v6, "count");

    if ((unint64_t)(v8 - v9) <= *(_QWORD *)(v1 + 384))
    {
      if (*(_QWORD *)(v1 + 400))
      {
        objc_msgSend(v6, "interestTokensByID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "allValues");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = MEMORY[0x1E0C809B0];
        v23 = 3221225472;
        v24 = __66__FCOfflineANFArticlesFetchOperation__promiseCachedArticleRecords__block_invoke_44;
        v25 = &unk_1E46441C0;
        v26 = (id)v1;
        objc_msgSend(v15, "enumerateObjectsUsingBlock:", &v22);

      }
      if (*(_QWORD *)(v1 + 408))
      {
        objc_msgSend(v6, "allRecords");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "fc_arrayByTransformingWithBlock:", &__block_literal_global_46_5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = *(void (***)(_QWORD, _QWORD))(v1 + 408);
        v19 = v18;
        +[FCContentArchive archiveWithChildArchives:](FCContentArchive, "archiveWithChildArchives:", v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v18)[2](v19, v20);

      }
      v21 = objc_alloc(MEMORY[0x1E0D60AF0]);
      objc_msgSend(v6, "allRecords");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v21, "initWithValue:", v11);
    }
    else
    {
      v22 = MEMORY[0x1E0C809B0];
      v23 = 3221225472;
      v24 = __66__FCOfflineANFArticlesFetchOperation__promiseCachedArticleRecords__block_invoke;
      v25 = &unk_1E4648930;
      v26 = v6;
      v27 = v1;
      v28 = v8 - v9;
      __66__FCOfflineANFArticlesFetchOperation__promiseCachedArticleRecords__block_invoke((uint64_t)&v22);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v26;
    }

    return v10;
  }
  else
  {
    v12 = objc_alloc(MEMORY[0x1E0D60AF0]);
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __67__FCOfflineANFArticlesFetchOperation__promiseFetchedArticleRecords__block_invoke;
    v25 = &unk_1E463DAD0;
    v26 = (id)v1;
    return (id)objc_msgSend(v12, "initWithResolver:", &v22);
  }
}

id __60__FCOfflineANFArticlesFetchOperation__promiseArticleRecords__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = *(_QWORD *)(v4 + 392);
    if (v5)
      (*(void (**)(double))(v5 + 16))(0.05);
  }
  return v3;
}

void __60__FCOfflineANFArticlesFetchOperation__promiseArticleRecords__block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_ERROR))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "shortOperationDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_error_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to fetch article records", (uint8_t *)&v6, 0xCu);

  }
}

void __67__FCOfflineANFArticlesFetchOperation__promiseFetchedArticleRecords__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  FCCKContentBatchedFetchRecordsOperation *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  id v23;
  const char *v24;
  id v25;
  _QWORD newValue[5];
  id v27;
  id v28;

  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init(FCCKContentBatchedFetchRecordsOperation);
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    v9 = *(void **)(v8 + 424);
  else
    v9 = 0;
  objc_msgSend(v9, "internalContentContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentDatabase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKContentBatchedFetchRecordsOperation setDatabase:]((uint64_t)v7, v11);

  v13 = *(_QWORD *)(a1 + 32);
  if (v13)
  {
    v14 = *(_QWORD *)(v13 + 376);
    if (!v7)
      goto LABEL_6;
    goto LABEL_5;
  }
  v14 = 0;
  if (v7)
  {
LABEL_5:
    v7->_maxBatchSize = v14;
    v13 = *(_QWORD *)(a1 + 32);
  }
LABEL_6:
  if (v13)
  {
    objc_msgSend(*(id *)(v13 + 424), "internalContentContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "articleRecordSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "desiredKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "fc_arrayByRemovingObjectsPassingTest:", &__block_literal_global_63);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_9;
    goto LABEL_8;
  }
  v18 = 0;
  if (v7)
LABEL_8:
    objc_setProperty_nonatomic_copy(v7, v12, v18, 384);
LABEL_9:

  v19 = *(_QWORD *)(a1 + 32);
  if (v19)
    v20 = *(void **)(v19 + 448);
  else
    v20 = 0;
  objc_msgSend(v20, "fc_arrayByTransformingWithBlock:", &__block_literal_global_27_4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_setProperty_nonatomic_copy(v7, v21, v22, 376);

  newValue[0] = MEMORY[0x1E0C809B0];
  newValue[1] = 3221225472;
  newValue[2] = __67__FCOfflineANFArticlesFetchOperation__promiseFetchedArticleRecords__block_invoke_3;
  newValue[3] = &unk_1E4648908;
  newValue[4] = *(_QWORD *)(a1 + 32);
  v27 = v6;
  v28 = v5;
  v23 = v5;
  v25 = v6;
  if (v7)
    objc_setProperty_nonatomic_copy(v7, v24, newValue, 400);
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v7);
  -[FCOperation start](v7, "start");

}

id __67__FCOfflineANFArticlesFetchOperation__promiseFetchedArticleRecords__block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0C95070];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithRecordName:", v3);

  return v4;
}

void __67__FCOfflineANFArticlesFetchOperation__promiseFetchedArticleRecords__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void (**v7)(id, _QWORD);
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[8];

  v6 = a2;
  if (a4)
  {
    v7 = (void (**)(id, _QWORD))*(id *)(a1 + 40);
    v7[2](v7, a4);
  }
  else
  {
    v8 = *(_QWORD **)(a1 + 32);
    if (v8)
      v8 = (_QWORD *)v8[56];
    v9 = v8;
    v10 = objc_msgSend(v9, "count");
    v11 = objc_msgSend(v6, "count");

    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
      v13 = *(_QWORD *)(v12 + 384);
    else
      v13 = 0;
    if (v10 - v11 <= v13)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "allValues");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 32);
      if (v16)
        v17 = *(_QWORD *)(v16 + 376);
      else
        v17 = 0;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __67__FCOfflineANFArticlesFetchOperation__promiseFetchedArticleRecords__block_invoke_36;
      v21[3] = &unk_1E463CFF0;
      v21[4] = v16;
      v22 = v14;
      v7 = v14;
      objc_msgSend(v15, "fc_visitSubarraysWithMaxCount:block:", v17, v21);

      (*(void (**)(_QWORD, void (**)(id, _QWORD), uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48)
                                                                                                  + 16))(*(_QWORD *)(a1 + 48), v7, v18, v19, v20);

    }
    else
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __67__FCOfflineANFArticlesFetchOperation__promiseFetchedArticleRecords__block_invoke_5;
      v23[3] = &unk_1E46488C0;
      v23[4] = v6;
      v23[5] = v12;
      v23[6] = *(_QWORD *)(a1 + 40);
      v23[7] = v10 - v11;
      v7 = (void (**)(id, _QWORD))v6;
      __67__FCOfflineANFArticlesFetchOperation__promiseFetchedArticleRecords__block_invoke_5((uint64_t)v23);
    }
  }

}

void __67__FCOfflineANFArticlesFetchOperation__promiseFetchedArticleRecords__block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  const __CFString *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fc_setByTransformingWithBlock:", &__block_literal_global_31_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = *(_QWORD **)(a1 + 40);
  if (v5)
    v5 = (_QWORD *)v5[56];
  v6 = v5;
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fc_setByMinusingSet:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = CFSTR("FCErrorMissingObjectsDescriptionsKey");
  v30[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)FCOperationLog;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 40), "shortOperationDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 56);
    v17 = *(_QWORD *)(a1 + 40);
    if (v17)
      v18 = *(_QWORD *)(v17 + 384);
    else
      v18 = 0;
    objc_msgSend(v8, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fc_subarrayWithMaxCount:", 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138544130;
    v22 = v15;
    v23 = 2048;
    v24 = v16;
    v25 = 2048;
    v26 = v18;
    v27 = 2114;
    v28 = v20;
    _os_log_error_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_ERROR, "%{public}@ missing too many articles, missing=%lu, max=%lu, sample=%{public}@", (uint8_t *)&v21, 0x2Au);

  }
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 48);
  if (v11 && *(_BYTE *)(v11 + 368))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "fc_notCachedError");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "fc_partialFailureErrorWithUserInfo:", v9);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;
  (*(void (**)(uint64_t, uint64_t))(v12 + 16))(v12, v13);

}

uint64_t __67__FCOfflineANFArticlesFetchOperation__promiseFetchedArticleRecords__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordName");
}

void __67__FCOfflineANFArticlesFetchOperation__promiseFetchedArticleRecords__block_invoke_36(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void (**v12)(_QWORD, _QWORD);
  void (**v13)(_QWORD, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    v4 = *(void **)(v3 + 424);
  else
    v4 = 0;
  v5 = a2;
  objc_msgSend(v4, "internalContentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "articleRecordSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertRecords:", v5);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(a1 + 32);
  if (v8 && *(_QWORD *)(v8 + 408))
  {
    objc_msgSend(v17, "allRecords");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fc_arrayByTransformingWithBlock:", &__block_literal_global_39_1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
      v12 = *(void (***)(_QWORD, _QWORD))(v11 + 408);
    else
      v12 = 0;
    v13 = v12;
    +[FCContentArchive archiveWithChildArchives:](FCContentArchive, "archiveWithChildArchives:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v12)[2](v13, v14);

  }
  v15 = *(void **)(a1 + 40);
  objc_msgSend(v17, "allRecords");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObjectsFromArray:", v16);

}

FCContentArchive *__67__FCOfflineANFArticlesFetchOperation__promiseFetchedArticleRecords__block_invoke_2_37(uint64_t a1, uint64_t a2)
{
  return +[FCContentArchive archiveWithRecord:](FCContentArchive, "archiveWithRecord:", a2);
}

id __66__FCOfflineANFArticlesFetchOperation__promiseCachedArticleRecords__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "allRecordIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    v6 = *(_QWORD *)(v5 + 448);
  else
    v6 = 0;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fc_setByMinusingSet:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (id)FCOperationLog;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 40), "shortOperationDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 40);
    v16 = *(_QWORD *)(a1 + 48);
    if (v15)
      v17 = *(_QWORD *)(v15 + 384);
    else
      v17 = 0;
    objc_msgSend(v8, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fc_subarrayWithMaxCount:", 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138544130;
    v21 = v14;
    v22 = 2048;
    v23 = v16;
    v24 = 2048;
    v25 = v17;
    v26 = 2114;
    v27 = v19;
    _os_log_error_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_ERROR, "%{public}@ missing too many articles, missing=%lu, max=%lu, sample=%{public}@", (uint8_t *)&v20, 0x2Au);

  }
  v10 = objc_alloc(MEMORY[0x1E0D60AF0]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "fc_notCachedError");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithError:", v11);

  return v12;
}

uint64_t __66__FCOfflineANFArticlesFetchOperation__promiseCachedArticleRecords__block_invoke_44(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(_QWORD *)(v1 + 400);
  else
    v2 = 0;
  return (*(uint64_t (**)(void))(v2 + 16))();
}

FCContentArchive *__66__FCOfflineANFArticlesFetchOperation__promiseCachedArticleRecords__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[FCContentArchive archiveWithRecord:](FCContentArchive, "archiveWithRecord:", a2);
}

void __75__FCOfflineANFArticlesFetchOperation__promiseThumbnailsFromArticleRecords___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  FCAssetsFetchOperation *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(_QWORD *, void *);
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  _QWORD v32[5];
  _QWORD v33[4];
  id v34;
  uint64_t v35;

  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v8 = (void *)MEMORY[0x1E0C99D20];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __75__FCOfflineANFArticlesFetchOperation__promiseThumbnailsFromArticleRecords___block_invoke_2;
  v33[3] = &unk_1E463EFB0;
  v9 = *(id *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v34 = v9;
  v35 = v10;
  objc_msgSend(v8, "fc_array:", v33);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[FCAssetsFetchOperation initWithAssetHandles:]([FCAssetsFetchOperation alloc], "initWithAssetHandles:", v11);
  -[FCOperation setPurpose:](v12, "setPurpose:", CFSTR("offlineDownload"));
  -[FCFetchOperation setShouldFailOnMissingObjects:](v12, "setShouldFailOnMissingObjects:", 1);
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    if (*(_BYTE *)(v13 + 368))
      v14 = 3;
    else
      v14 = 0;
  }
  else
  {
    v14 = 0;
  }
  -[FCFetchOperation setCachePolicy:](v12, "setCachePolicy:", v14);
  v15 = *(_QWORD *)(a1 + 40);
  if (v15)
    v16 = *(unsigned __int8 *)(v15 + 368) != 0;
  else
    v16 = 0;
  -[FCFetchOperation setCanSendFetchCompletionSynchronously:](v12, "setCanSendFetchCompletionSynchronously:", v16);
  v17 = *(_QWORD *)(a1 + 40);
  if (v17)
    v18 = *(_QWORD *)(v17 + 376);
  else
    v18 = 0;
  -[FCAssetsFetchOperation setMaxConcurrentFetchCount:](v12, "setMaxConcurrentFetchCount:", v18);
  v19 = *(_QWORD *)(a1 + 40);
  if (v19)
    v20 = *(_QWORD *)(v19 + 400);
  else
    v20 = 0;
  -[FCAssetsFetchOperation setInterestTokenHandler:](v12, "setInterestTokenHandler:", v20);
  v21 = *(_QWORD *)(a1 + 40);
  if (v21)
    v22 = *(_QWORD *)(v21 + 408);
  else
    v22 = 0;
  -[FCAssetsFetchOperation setArchiveHandler:](v12, "setArchiveHandler:", v22);
  v32[0] = v7;
  v32[1] = 3221225472;
  v32[2] = __75__FCOfflineANFArticlesFetchOperation__promiseThumbnailsFromArticleRecords___block_invoke_3;
  v32[3] = &unk_1E463F650;
  v32[4] = *(_QWORD *)(a1 + 40);
  -[FCAssetsFetchOperation setProgressHandler:](v12, "setProgressHandler:", v32);
  v25 = v7;
  v26 = 3221225472;
  v27 = __75__FCOfflineANFArticlesFetchOperation__promiseThumbnailsFromArticleRecords___block_invoke_4;
  v28 = &unk_1E463F580;
  v29 = *(_QWORD *)(a1 + 40);
  v30 = v6;
  v31 = v5;
  v23 = v5;
  v24 = v6;
  -[FCFetchOperation setFetchCompletionBlock:](v12, "setFetchCompletionBlock:", &v25);
  objc_msgSend(*(id *)(a1 + 40), "associateChildOperation:", v12, v25, v26, v27, v28, v29);
  -[FCOperation start](v12, "start");

}

void __75__FCOfflineANFArticlesFetchOperation__promiseThumbnailsFromArticleRecords___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  _QWORD *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v7);
        v9 = *(_QWORD **)(a1 + 40);
        if (v9)
        {
          v10 = (void *)v9[54];
          v9 = (_QWORD *)v9[53];
        }
        else
        {
          v10 = 0;
        }
        v11 = v9;
        v12 = v10;
        objc_msgSend(v11, "assetManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        FCOfflineThumbnailAssetHandlesForArticleRecord(v8, v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "addObjectsFromArray:", v14);
        ++v7;
      }
      while (v5 != v7);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v5 = v15;
    }
    while (v15);
  }

}

void __75__FCOfflineANFArticlesFetchOperation__promiseThumbnailsFromArticleRecords___block_invoke_3(uint64_t a1, double a2)
{
  uint64_t v2;
  void (**v3)(double);
  void (**v5)(double);

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = *(void (***)(double))(v2 + 392);
    if (v3)
    {
      v5 = v3;
      v3[2](a2 * 0.2 + 0.05);

    }
  }
}

void __75__FCOfflineANFArticlesFetchOperation__promiseThumbnailsFromArticleRecords___block_invoke_4(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[7];

  v7 = a2;
  if (objc_msgSend(v7, "status"))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __75__FCOfflineANFArticlesFetchOperation__promiseThumbnailsFromArticleRecords___block_invoke_5;
    v8[3] = &unk_1E463DB98;
    v3 = (void *)a1[5];
    v8[5] = a1[4];
    v8[6] = v3;
    v8[4] = v7;
    v4 = v3;
    v5 = v7;
    __75__FCOfflineANFArticlesFetchOperation__promiseThumbnailsFromArticleRecords___block_invoke_5((uint64_t)v8);

  }
  else
  {
    v6 = a1[6];
    objc_msgSend(v7, "fetchedObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
  }

}

void __75__FCOfflineANFArticlesFetchOperation__promiseThumbnailsFromArticleRecords___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "status") == 1)
  {
    v2 = (void *)MEMORY[0x1E0CB35C8];
    v3 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "errorUserInfo");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "fc_operationCancelledErrorWithAdditionalUserInfo:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  }
  else
  {
    v5 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_ERROR))
    {
      v8 = *(void **)(a1 + 40);
      v9 = v5;
      objc_msgSend(v8, "shortOperationDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "missingObjectDescriptions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v10;
      v15 = 2114;
      v16 = v11;
      _os_log_error_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_ERROR, "%{public}@ failed to fetch thumbnails: %{public}@", buf, 0x16u);

    }
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
}

void __77__FCOfflineANFArticlesFetchOperation__promiseANFDocumentsFromArticleRecords___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  FCAssetsFetchOperation *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD v26[5];
  _QWORD v27[5];

  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __77__FCOfflineANFArticlesFetchOperation__promiseANFDocumentsFromArticleRecords___block_invoke_2;
  v27[3] = &unk_1E4648958;
  v8 = *(void **)(a1 + 32);
  v27[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v8, "fc_arrayByTransformingWithBlock:", v27);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[FCAssetsFetchOperation initWithAssetHandles:]([FCAssetsFetchOperation alloc], "initWithAssetHandles:", v9);
  -[FCOperation setPurpose:](v10, "setPurpose:", CFSTR("offlineDownload"));
  -[FCFetchOperation setShouldFailOnMissingObjects:](v10, "setShouldFailOnMissingObjects:", 1);
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
  {
    if (*(_BYTE *)(v11 + 368))
      v12 = 3;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  -[FCFetchOperation setCachePolicy:](v10, "setCachePolicy:", v12);
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
    v14 = *(unsigned __int8 *)(v13 + 368) != 0;
  else
    v14 = 0;
  -[FCFetchOperation setCanSendFetchCompletionSynchronously:](v10, "setCanSendFetchCompletionSynchronously:", v14);
  v15 = *(_QWORD *)(a1 + 40);
  if (v15)
    v16 = *(_QWORD *)(v15 + 376);
  else
    v16 = 0;
  -[FCAssetsFetchOperation setMaxConcurrentFetchCount:](v10, "setMaxConcurrentFetchCount:", v16);
  v17 = *(_QWORD *)(a1 + 40);
  if (v17)
    v18 = *(_QWORD *)(v17 + 400);
  else
    v18 = 0;
  -[FCAssetsFetchOperation setInterestTokenHandler:](v10, "setInterestTokenHandler:", v18);
  v19 = *(_QWORD *)(a1 + 40);
  if (v19)
    v20 = *(_QWORD *)(v19 + 408);
  else
    v20 = 0;
  -[FCAssetsFetchOperation setArchiveHandler:](v10, "setArchiveHandler:", v20);
  v26[0] = v7;
  v26[1] = 3221225472;
  v26[2] = __77__FCOfflineANFArticlesFetchOperation__promiseANFDocumentsFromArticleRecords___block_invoke_3;
  v26[3] = &unk_1E463F650;
  v26[4] = *(_QWORD *)(a1 + 40);
  -[FCAssetsFetchOperation setProgressHandler:](v10, "setProgressHandler:", v26);
  v23[0] = v7;
  v23[1] = 3221225472;
  v23[2] = __77__FCOfflineANFArticlesFetchOperation__promiseANFDocumentsFromArticleRecords___block_invoke_4;
  v23[3] = &unk_1E463F580;
  v23[4] = *(_QWORD *)(a1 + 40);
  v24 = v6;
  v25 = v5;
  v21 = v5;
  v22 = v6;
  -[FCFetchOperation setFetchCompletionBlock:](v10, "setFetchCompletionBlock:", v23);
  objc_msgSend(*(id *)(a1 + 40), "associateChildOperation:", v10);
  -[FCOperation start](v10, "start");

}

id __77__FCOfflineANFArticlesFetchOperation__promiseANFDocumentsFromArticleRecords___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 424);
  else
    v3 = 0;
  v4 = a2;
  objc_msgSend(v3, "assetManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "generateFlintDocumentAssetHandleWithAssetManager:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __77__FCOfflineANFArticlesFetchOperation__promiseANFDocumentsFromArticleRecords___block_invoke_3(uint64_t a1, double a2)
{
  uint64_t v2;
  void (**v3)(double);
  void (**v5)(double);

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = *(void (***)(double))(v2 + 392);
    if (v3)
    {
      v5 = v3;
      v3[2](a2 * 0.2 + 0.05);

    }
  }
}

void __77__FCOfflineANFArticlesFetchOperation__promiseANFDocumentsFromArticleRecords___block_invoke_4(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[7];

  v7 = a2;
  if (objc_msgSend(v7, "status"))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __77__FCOfflineANFArticlesFetchOperation__promiseANFDocumentsFromArticleRecords___block_invoke_5;
    v8[3] = &unk_1E463DB98;
    v3 = (void *)a1[5];
    v8[5] = a1[4];
    v8[6] = v3;
    v8[4] = v7;
    v4 = v3;
    v5 = v7;
    __77__FCOfflineANFArticlesFetchOperation__promiseANFDocumentsFromArticleRecords___block_invoke_5((uint64_t)v8);

  }
  else
  {
    v6 = a1[6];
    objc_msgSend(v7, "fetchedObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
  }

}

void __77__FCOfflineANFArticlesFetchOperation__promiseANFDocumentsFromArticleRecords___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "status") == 1)
  {
    v2 = (void *)MEMORY[0x1E0CB35C8];
    v3 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "errorUserInfo");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "fc_operationCancelledErrorWithAdditionalUserInfo:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  }
  else
  {
    v5 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_ERROR))
    {
      v8 = *(void **)(a1 + 40);
      v9 = v5;
      objc_msgSend(v8, "shortOperationDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "missingObjectDescriptions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v10;
      v15 = 2114;
      v16 = v11;
      _os_log_error_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_ERROR, "%{public}@ failed to fetch ANF documents: %{public}@", buf, 0x16u);

    }
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
}

void __93__FCOfflineANFArticlesFetchOperation__promiseANFResourcesFromArticleRecords_anfAssetHandles___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  FCResourcesFetchOperation *v12;
  _QWORD *v13;
  _QWORD *v14;
  void *v15;
  FCResourcesFetchOperation *v16;
  _QWORD *v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  unsigned __int8 *v21;
  _BOOL8 v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  _QWORD v32[5];
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;

  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v8 = (void *)MEMORY[0x1E0C99E60];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __93__FCOfflineANFArticlesFetchOperation__promiseANFResourcesFromArticleRecords_anfAssetHandles___block_invoke_2;
  v33[3] = &unk_1E46489F8;
  v34 = a1[4];
  v9 = a1[5];
  v10 = a1[6];
  v35 = v9;
  v36 = v10;
  objc_msgSend(v8, "fc_set:", v33);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = [FCResourcesFetchOperation alloc];
  v13 = a1[6];
  if (v13)
    v13 = (_QWORD *)v13[53];
  v14 = v13;
  objc_msgSend(v11, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[FCResourcesFetchOperation initWithContext:resourceIDs:downloadAssets:](v12, "initWithContext:resourceIDs:downloadAssets:", v14, v15, 1);

  -[FCOperation setPurpose:](v16, "setPurpose:", CFSTR("offlineDownload"));
  v17 = a1[6];
  if (v17)
    v18 = v17[47];
  else
    v18 = 0;
  -[FCResourcesFetchOperation setMaxConcurrentFetchCount:](v16, "setMaxConcurrentFetchCount:", v18);
  -[FCFetchOperation setShouldFailOnMissingObjects:](v16, "setShouldFailOnMissingObjects:", 1);
  v19 = a1[6];
  if (v19)
  {
    if (v19[368])
      v20 = 3;
    else
      v20 = 0;
  }
  else
  {
    v20 = 0;
  }
  -[FCFetchOperation setCachePolicy:](v16, "setCachePolicy:", v20);
  v21 = (unsigned __int8 *)a1[6];
  if (v21)
    v22 = v21[368] != 0;
  else
    v22 = 0;
  -[FCFetchOperation setCanSendFetchCompletionSynchronously:](v16, "setCanSendFetchCompletionSynchronously:", v22);
  v23 = a1[6];
  if (v23)
    v24 = v23[50];
  else
    v24 = 0;
  -[FCResourcesFetchOperation setInterestTokenHandler:](v16, "setInterestTokenHandler:", v24);
  v25 = a1[6];
  if (v25)
    v26 = v25[51];
  else
    v26 = 0;
  -[FCResourcesFetchOperation setArchiveHandler:](v16, "setArchiveHandler:", v26);
  v32[0] = v7;
  v32[1] = 3221225472;
  v32[2] = __93__FCOfflineANFArticlesFetchOperation__promiseANFResourcesFromArticleRecords_anfAssetHandles___block_invoke_59;
  v32[3] = &unk_1E463F650;
  v32[4] = a1[6];
  -[FCResourcesFetchOperation setProgressHandler:](v16, "setProgressHandler:", v32);
  v29[0] = v7;
  v29[1] = 3221225472;
  v29[2] = __93__FCOfflineANFArticlesFetchOperation__promiseANFResourcesFromArticleRecords_anfAssetHandles___block_invoke_2_60;
  v29[3] = &unk_1E463F580;
  v29[4] = a1[6];
  v30 = v6;
  v31 = v5;
  v27 = v5;
  v28 = v6;
  -[FCFetchOperation setFetchCompletionBlock:](v16, "setFetchCompletionBlock:", v29);
  objc_msgSend(a1[6], "associateChildOperation:", v16);
  -[FCOperation start](v16, "start");

}

void __93__FCOfflineANFArticlesFetchOperation__promiseANFResourcesFromArticleRecords_anfAssetHandles___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
  _QWORD *v26;
  _QWORD v27[4];
  _QWORD v28[5];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v23 = a1;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v35;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v35 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v7), "flintFontResourceIDs", v23);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "fc_safelyAddObjects:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v5);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v9 = *(id *)(v23 + 40);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v31;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x1A8580B64]();
        objc_msgSend(v13, "dataProvider");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "data");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v17 = *(_QWORD **)(v23 + 48);
          if (v17)
            v17 = (_QWORD *)v17[55];
          v18 = v17;
          objc_msgSend(v18, "manifestFromANFDocumentData:", v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(v19, "nonImageResourceIDs");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "fc_safelyAddObjects:", v20);

            v28[0] = MEMORY[0x1E0C809B0];
            v28[1] = 3221225472;
            v28[2] = __93__FCOfflineANFArticlesFetchOperation__promiseANFResourcesFromArticleRecords_anfAssetHandles___block_invoke_3;
            v28[3] = &unk_1E4648980;
            v28[4] = *(_QWORD *)(v23 + 48);
            v29 = v19;
            __93__FCOfflineANFArticlesFetchOperation__promiseANFResourcesFromArticleRecords_anfAssetHandles___block_invoke_3((uint64_t)v28);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v27[0] = 0;
            v27[1] = v27;
            v27[2] = 0x2020000000;
            v27[3] = 0;
            v24[0] = MEMORY[0x1E0C809B0];
            v24[1] = 3221225472;
            v24[2] = __93__FCOfflineANFArticlesFetchOperation__promiseANFResourcesFromArticleRecords_anfAssetHandles___block_invoke_54;
            v24[3] = &unk_1E46489D0;
            v22 = *(_QWORD *)(v23 + 48);
            v26 = v27;
            v24[4] = v22;
            v25 = v3;
            objc_msgSend(v21, "enumerateObjectsUsingBlock:", v24);

            _Block_object_dispose(v27, 8);
          }

        }
        objc_autoreleasePoolPop(v14);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v10);
  }

}

id __93__FCOfflineANFArticlesFetchOperation__promiseANFResourcesFromArticleRecords_anfAssetHandles___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 432);
  else
    v3 = 0;
  if (objc_msgSend(v3, "useSmallestArticleImages"))
  {
    v4 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 32);
      v6 = v4;
      objc_msgSend(v5, "shortOperationDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v7;
      _os_log_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ will download the smallest variant of each article image", (uint8_t *)&v10, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 40), "smallestImageResourceIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "optimalImageResourceIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

void __93__FCOfflineANFArticlesFetchOperation__promiseANFResourcesFromArticleRecords_anfAssetHandles___block_invoke_54(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[7];

  v6 = a2;
  v8 = *(_QWORD *)(a1 + 32);
  v11 = v6;
  if (v8)
    v9 = *(void **)(v8 + 432);
  else
    v9 = 0;
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v7 >= objc_msgSend(v9, "maxImagesPerArticle", v11))
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __93__FCOfflineANFArticlesFetchOperation__promiseANFResourcesFromArticleRecords_anfAssetHandles___block_invoke_2_55;
    v13[3] = &unk_1E46489A8;
    v10 = *(_QWORD *)(a1 + 48);
    v13[4] = *(_QWORD *)(a1 + 32);
    v13[5] = v10;
    v13[6] = a4;
    __93__FCOfflineANFArticlesFetchOperation__promiseANFResourcesFromArticleRecords_anfAssetHandles___block_invoke_2_55((uint64_t)v13);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

  }
}

void __93__FCOfflineANFArticlesFetchOperation__promiseANFResourcesFromArticleRecords_anfAssetHandles___block_invoke_2_55(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "shortOperationDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v7 = 138543618;
    v8 = v5;
    v9 = 2048;
    v10 = v6;
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ will limit the number of article images to %lld", (uint8_t *)&v7, 0x16u);

  }
  **(_BYTE **)(a1 + 48) = 1;
}

void __93__FCOfflineANFArticlesFetchOperation__promiseANFResourcesFromArticleRecords_anfAssetHandles___block_invoke_59(uint64_t a1, double a2)
{
  uint64_t v2;
  void (**v3)(double);
  void (**v5)(double);

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = *(void (***)(double))(v2 + 392);
    if (v3)
    {
      v5 = v3;
      v3[2](a2 * 0.75 + 0.25);

    }
  }
}

void __93__FCOfflineANFArticlesFetchOperation__promiseANFResourcesFromArticleRecords_anfAssetHandles___block_invoke_2_60(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[7];

  v7 = a2;
  if (objc_msgSend(v7, "status"))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __93__FCOfflineANFArticlesFetchOperation__promiseANFResourcesFromArticleRecords_anfAssetHandles___block_invoke_3_61;
    v8[3] = &unk_1E463DB98;
    v3 = (void *)a1[5];
    v8[5] = a1[4];
    v8[6] = v3;
    v8[4] = v7;
    v4 = v3;
    v5 = v7;
    __93__FCOfflineANFArticlesFetchOperation__promiseANFResourcesFromArticleRecords_anfAssetHandles___block_invoke_3_61((uint64_t)v8);

  }
  else
  {
    v6 = a1[6];
    objc_msgSend(v7, "fetchedObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
  }

}

void __93__FCOfflineANFArticlesFetchOperation__promiseANFResourcesFromArticleRecords_anfAssetHandles___block_invoke_3_61(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "status") == 1)
  {
    v2 = (void *)MEMORY[0x1E0CB35C8];
    v3 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "errorUserInfo");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "fc_operationCancelledErrorWithAdditionalUserInfo:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  }
  else
  {
    v5 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_ERROR))
    {
      v8 = *(void **)(a1 + 40);
      v9 = v5;
      objc_msgSend(v8, "shortOperationDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "missingObjectDescriptions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v10;
      v15 = 2114;
      v16 = v11;
      _os_log_error_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_ERROR, "%{public}@ failed to fetch ANF resources: %{public}@", buf, 0x16u);

    }
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
}

uint64_t __57__FCOfflineANFArticlesFetchOperation__desiredArticleKeys__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPrefix:", CFSTR("articleRecirculationConfiguration"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputHeadlines, 0);
  objc_storeStrong((id *)&self->_articleIDs, 0);
  objc_storeStrong((id *)&self->_ANFHelper, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
  objc_storeStrong(&self->_archiveHandler, 0);
  objc_storeStrong(&self->_interestTokenHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
}

@end
