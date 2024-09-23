@implementation FCTagSearchOperation

- (BOOL)validateOperation
{
  void *v3;
  BOOL v4;
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
  -[FCTagSearchOperation contentContext](self, "contentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("tag search operation requires a content context"));
    v8 = 136315906;
    v9 = "-[FCTagSearchOperation validateOperation]";
    v10 = 2080;
    v11 = "FCTagSearchOperation.m";
    v12 = 1024;
    v13 = 58;
    v14 = 2114;
    v15 = v6;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);

  }
  if (-[FCTagSearchOperation tagType](self, "tagType") == 2 || -[FCTagSearchOperation tagType](self, "tagType") == 1)
  {
    v4 = 1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("tag search operation requires a channel or topic tag type"));
      v8 = 136315906;
      v9 = "-[FCTagSearchOperation validateOperation]";
      v10 = 2080;
      v11 = "FCTagSearchOperation.m";
      v12 = 1024;
      v13 = 62;
      v14 = 2114;
      v15 = v7;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);

    }
    v4 = 0;
  }
  return v3 && v4;
}

- (void)prepareOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[FCTagSearchOperation contentContext](self, "contentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "internalContentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tagRecordSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCTagSearchOperation setTagRecordSource:](self, "setTagRecordSource:", v5);

  -[FCTagSearchOperation contentContext](self, "contentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "internalContentContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCTagSearchOperation setContentDatabase:](self, "setContentDatabase:", v8);

  -[FCTagSearchOperation contentContext](self, "contentContext");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assetManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCTagSearchOperation setAssetManager:](self, "setAssetManager:", v9);

}

- (void)performOperation
{
  void *v3;
  uint64_t v4;
  _QWORD v5[5];

  -[FCTagSearchOperation searchString](self, "searchString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __40__FCTagSearchOperation_performOperation__block_invoke;
    v5[3] = &unk_1E4649338;
    v5[4] = self;
    -[FCTagSearchOperation _performSearchQuery:](self, "_performSearchQuery:", v5);
  }
  else
  {
    -[FCOperation finishedPerformingOperationWithError:](self, "finishedPerformingOperationWithError:", 0);
  }
}

void __40__FCTagSearchOperation_performOperation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setSearchResults:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setSearchError:", v6);
  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v6);

}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  -[FCTagSearchOperation searchResultsBlock](self, "searchResultsBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FCTagSearchOperation searchResultsBlock](self, "searchResultsBlock");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[FCTagSearchOperation searchResults](self, "searchResults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCTagSearchOperation searchError](self, "searchError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = v7;
    else
      v8 = v9;
    ((void (**)(_QWORD, void *, id))v5)[2](v5, v6, v8);

  }
}

- (void)_performSearchQuery:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  id v17;

  v4 = a3;
  -[FCTagSearchOperation _establishStreamOfTags](self, "_establishStreamOfTags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FCTagSearchOperation batchSize](self, "batchSize");
  v7 = -[FCTagSearchOperation qualityOfService](self, "qualityOfService");
  FCDispatchQueueForQualityOfService(-[FCTagSearchOperation qualityOfService](self, "qualityOfService"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __44__FCTagSearchOperation__performSearchQuery___block_invoke;
  v15 = &unk_1E4640658;
  v16 = v5;
  v17 = v4;
  v9 = v5;
  v10 = v4;
  objc_msgSend(v9, "fetchMoreResultsWithLimit:qualityOfService:callbackQueue:completionHandler:", v6, v7, v8, &v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCOperation associateChildOperation:](self, "associateChildOperation:", v11, v12, v13, v14, v15);
}

void __44__FCTagSearchOperation__performSearchQuery___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  FCStreamingResults *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "fc_isCancellationError"))
      v7 = 0;
    else
      v7 = v6;
    (*(void (**)(_QWORD, _QWORD, void *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, v7);
  }
  else
  {
    v8 = -[FCStreamingResults initWithResults:followedByStream:]([FCStreamingResults alloc], "initWithResults:followedByStream:", v9, *(_QWORD *)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (id)_localIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryLanguageCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentStoreFrontID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@_%@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_establishStreamOfTags
{
  FCTagSearchRecordStream *v3;
  uint64_t v4;
  FCTransformedResultsStream *v5;
  FCTransformedResultsStream *v6;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;
  id location;

  v3 = objc_alloc_init(FCTagSearchRecordStream);
  objc_initWeak(&location, self);
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __46__FCTagSearchOperation__establishStreamOfTags__block_invoke;
  v12[3] = &unk_1E4649360;
  objc_copyWeak(&v13, &location);
  v12[4] = self;
  -[FCTagSearchRecordStream setOperationConstructor:](v3, "setOperationConstructor:", v12);
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__68;
  v10[4] = __Block_byref_object_dispose__68;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [FCTransformedResultsStream alloc];
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __46__FCTagSearchOperation__establishStreamOfTags__block_invoke_18;
  v8[3] = &unk_1E46493D8;
  objc_copyWeak(&v9, &location);
  v8[4] = v10;
  v6 = -[FCTransformedResultsStream initWithStream:asyncTransformBlock:](v5, "initWithStream:asyncTransformBlock:", v3, v8);
  objc_destroyWeak(&v9);
  _Block_object_dispose(v10, 8);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v6;
}

FCCKTagSearchQueryOperation *__46__FCTagSearchOperation__establishStreamOfTags__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  FCCKTagSearchQueryOperation *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  const char *v9;
  void *v10;
  id v11;
  const char *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id to;

  v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 40));
  v4 = (FCCKTagSearchQueryOperation *)objc_loadWeakRetained(&to);

  if (v4)
  {
    v4 = objc_alloc_init(FCCKTagSearchQueryOperation);
    v5 = objc_loadWeakRetained(&to);
    objc_msgSend(v5, "contentDatabase");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKTagSearchQueryOperation setDatabase:]((uint64_t)v4, v6);

    v7 = objc_loadWeakRetained(&to);
    objc_msgSend(v7, "tagRecordSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "desiredKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_setProperty_nonatomic_copy(v4, v9, v10, 408);

    v11 = objc_loadWeakRetained(&to);
    objc_msgSend(v11, "searchString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_setProperty_nonatomic_copy(v4, v12, v13, 384);

    v14 = objc_loadWeakRetained(&to);
    v15 = objc_msgSend(v14, "tagType");
    if (v4)
    {
      v16 = 1;
      if (v15 != 1)
        v16 = 2;
      v4->_tagType = v16;
    }

    objc_msgSend(*(id *)(a1 + 32), "_localIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_setProperty_nonatomic_copy(v4, v17, v18, 416);

    -[FCCKTagSearchQueryOperation setCursor:]((uint64_t)v4, v3);
    v19 = objc_loadWeakRetained(&to);
    v20 = objc_msgSend(v19, "batchSize");
    if (v4)
      v4->_resultsLimit = v20;

  }
  objc_destroyWeak(&to);

  return v4;
}

void __46__FCTagSearchOperation__establishStreamOfTags__block_invoke_18(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void (**v7)(id, void *);
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  FCTag *(*v20)(uint64_t, void *, void *);
  void *v21;
  uint64_t v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id to;

  v6 = a2;
  v7 = a4;
  objc_copyWeak(&to, (id *)(a1 + 40));
  v8 = objc_loadWeakRetained(&to);

  if (v8)
  {
    v9 = objc_loadWeakRetained(&to);
    objc_msgSend(v9, "tagRecordSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "saveTagRecords:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __46__FCTagSearchOperation__establishStreamOfTags__block_invoke_3;
    v24[3] = &unk_1E4649388;
    objc_copyWeak(&v25, &to);
    objc_msgSend(v6, "fc_arrayByTransformingWithBlock:", v24);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v12;
    v19 = 3221225472;
    v20 = __46__FCTagSearchOperation__establishStreamOfTags__block_invoke_4;
    v21 = &unk_1E46493B0;
    objc_copyWeak(&v23, (id *)(a1 + 40));
    v22 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v11, "transformRecordsInOrder:withBlock:", v13, &v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_loadWeakRetained(&to);
    objc_msgSend(v15, "contentContext", v18, v19, v20, v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "tagController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "saveTagsToCache:", v14);

    v7[2](v7, v14);
    objc_destroyWeak(&v23);

    objc_destroyWeak(&v25);
  }
  objc_destroyWeak(&to);

}

id __46__FCTagSearchOperation__establishStreamOfTags__block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "tagRecordSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "identifierFromCKRecord:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

FCTag *__46__FCTagSearchOperation__establishStreamOfTags__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  FCTag *v8;
  id v9;
  void *v10;
  FCTag *v11;
  void *v12;
  void *v13;
  FCTag *v14;
  void *v15;
  void *v16;
  id to;

  v5 = a2;
  v6 = a3;
  objc_copyWeak(&to, (id *)(a1 + 40));
  v7 = objc_loadWeakRetained(&to);

  if (v7)
  {
    v8 = [FCTag alloc];
    v9 = objc_loadWeakRetained(&to);
    objc_msgSend(v9, "assetManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[FCTag initWithTagRecord:assetManager:interestToken:](v8, "initWithTagRecord:assetManager:interestToken:", v5, v10, v6);

    if (+[FCTagController isTagAllowed:](FCTagController, "isTagAllowed:", v11)
      && (v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40),
          -[FCTag name](v11, "name"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          LOBYTE(v12) = objc_msgSend(v12, "containsObject:", v13),
          v13,
          (v12 & 1) == 0))
    {
      v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      -[FCTag name](v11, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v16);

      v14 = v11;
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }
  objc_destroyWeak(&to);

  return v14;
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (void)setContentContext:(id)a3
{
  objc_storeStrong((id *)&self->_contentContext, a3);
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (unint64_t)tagType
{
  return self->_tagType;
}

- (void)setTagType:(unint64_t)a3
{
  self->_tagType = a3;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (id)searchResultsBlock
{
  return objc_getProperty(self, a2, 400, 1);
}

- (void)setSearchResultsBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 400);
}

- (FCTagRecordSource)tagRecordSource
{
  return self->_tagRecordSource;
}

- (void)setTagRecordSource:(id)a3
{
  objc_storeStrong((id *)&self->_tagRecordSource, a3);
}

- (FCCKContentDatabase)contentDatabase
{
  return self->_contentDatabase;
}

- (void)setContentDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_contentDatabase, a3);
}

- (FCAssetManager)assetManager
{
  return self->_assetManager;
}

- (void)setAssetManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetManager, a3);
}

- (FCStreamingResults)searchResults
{
  return self->_searchResults;
}

- (void)setSearchResults:(id)a3
{
  objc_storeStrong((id *)&self->_searchResults, a3);
}

- (NSError)searchError
{
  return self->_searchError;
}

- (void)setSearchError:(id)a3
{
  objc_storeStrong((id *)&self->_searchError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchError, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_contentDatabase, 0);
  objc_storeStrong((id *)&self->_tagRecordSource, 0);
  objc_storeStrong(&self->_searchResultsBlock, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);
}

@end
