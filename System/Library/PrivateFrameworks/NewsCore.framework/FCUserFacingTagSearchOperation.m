@implementation FCUserFacingTagSearchOperation

- (BOOL)validateOperation
{
  void *v2;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[FCUserFacingTagSearchOperation contentContext](self, "contentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("tag search operation requires a content context"));
    v5 = 136315906;
    v6 = "-[FCUserFacingTagSearchOperation validateOperation]";
    v7 = 2080;
    v8 = "FCUserFacingTagSearchOperation.m";
    v9 = 1024;
    v10 = 32;
    v11 = 2114;
    v12 = v4;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v5, 0x26u);

  }
  return v2 != 0;
}

- (void)performOperation
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[6];
  _QWORD v15[6];
  _QWORD v16[5];

  v3 = -[FCUserFacingTagSearchOperation userFacingTagOptions](self, "userFacingTagOptions");
  if (v3)
  {
    v4 = v3;
    v5 = -[FCUserFacingTagSearchOperation batchSize](self, "batchSize");
    v6 = 20;
    if (v5 > 0x14)
      v6 = v5;
    v7 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __50__FCUserFacingTagSearchOperation_performOperation__block_invoke_2;
    v15[3] = &unk_1E4640CD0;
    v15[4] = self;
    v15[5] = v6;
    objc_msgSend(MEMORY[0x1E0D60AF0], "firstly:", v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __50__FCUserFacingTagSearchOperation_performOperation__block_invoke_3;
    v14[3] = &unk_1E4640D18;
    v14[4] = self;
    v14[5] = v4;
    objc_msgSend(v8, "then:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __50__FCUserFacingTagSearchOperation_performOperation__block_invoke_6;
    v13[3] = &unk_1E4640D40;
    v13[4] = self;
    objc_msgSend(v9, "then:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __50__FCUserFacingTagSearchOperation_performOperation__block_invoke_7;
    v12[3] = &unk_1E463EA38;
    v12[4] = self;
    v11 = (id)objc_msgSend(v10, "error:", v12);

  }
  else
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __50__FCUserFacingTagSearchOperation_performOperation__block_invoke;
    v16[3] = &unk_1E463AB18;
    v16[4] = self;
    __50__FCUserFacingTagSearchOperation_performOperation__block_invoke((uint64_t)v16);
  }
}

void __50__FCUserFacingTagSearchOperation_performOperation__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "setChannelSearchResults:", v2);

  v3 = (id)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "setTopicSearchResults:", v3);

}

uint64_t __50__FCUserFacingTagSearchOperation_performOperation__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchResultsForTagType:batchSize:", 2, *(_QWORD *)(a1 + 40));
}

id __50__FCUserFacingTagSearchOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  FCTransformedStream *v13;
  FCStreamingResults *v14;
  void *v15;

  v3 = a2;
  objc_msgSend(v3, "underlyingStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_opt_new();
  v7 = v6;

  objc_msgSend(v3, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C9AA60];
  if (v8)
    v9 = v8;
  v10 = v9;

  v11 = *(_QWORD *)(a1 + 40);
  if ((v11 & 1) != 0)
  {
    objc_msgSend(v10, "fc_arrayByTransformingWithBlock:", &__block_literal_global_55);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[FCTransformedStream initWithStream:transformBlock:]([FCTransformedStream alloc], "initWithStream:transformBlock:", v7, &__block_literal_global_55);
    v14 = -[FCStreamingResults initWithResults:followedByStream:]([FCStreamingResults alloc], "initWithResults:followedByStream:", v12, v13);
    objc_msgSend(*(id *)(a1 + 32), "setChannelSearchResults:", v14);

    v11 = *(_QWORD *)(a1 + 40);
  }
  if ((v11 & 2) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_fetchResultsForUserFacingTopicsWithInitialChannels:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

id __50__FCUserFacingTagSearchOperation_performOperation__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if (objc_msgSend(v2, "userFacingTagType") == 2)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

uint64_t __50__FCUserFacingTagSearchOperation_performOperation__block_invoke_6(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setTopicSearchResults:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", 0);
  return 0;
}

uint64_t __50__FCUserFacingTagSearchOperation_performOperation__block_invoke_7(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", a2);
}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[FCUserFacingTagSearchOperation searchResultsBlock](self, "searchResultsBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FCUserFacingTagSearchOperation searchResultsBlock](self, "searchResultsBlock");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[FCUserFacingTagSearchOperation channelSearchResults](self, "channelSearchResults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCUserFacingTagSearchOperation topicSearchResults](self, "topicSearchResults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, id))v5)[2](v5, v6, v7, v8);

  }
}

- (id)_fetchResultsForUserFacingTopicsWithInitialChannels:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D60AF0]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__FCUserFacingTagSearchOperation__fetchResultsForUserFacingTopicsWithInitialChannels___block_invoke;
  v9[3] = &unk_1E463F188;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_msgSend(v5, "initWithResolver:", v9);

  return v7;
}

void __86__FCUserFacingTagSearchOperation__fetchResultsForUserFacingTopicsWithInitialChannels___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[5];

  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __86__FCUserFacingTagSearchOperation__fetchResultsForUserFacingTopicsWithInitialChannels___block_invoke_2;
  v18[3] = &unk_1E463D3A8;
  v18[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D60AF0], "firstly:", v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __86__FCUserFacingTagSearchOperation__fetchResultsForUserFacingTopicsWithInitialChannels___block_invoke_3;
  v15[3] = &unk_1E4640D68;
  v16 = *(id *)(a1 + 40);
  v17 = v5;
  v9 = v5;
  objc_msgSend(v8, "then:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __86__FCUserFacingTagSearchOperation__fetchResultsForUserFacingTopicsWithInitialChannels___block_invoke_5;
  v13[3] = &unk_1E463DB48;
  v14 = v6;
  v11 = v6;
  v12 = (id)objc_msgSend(v10, "error:", v13);

}

uint64_t __86__FCUserFacingTagSearchOperation__fetchResultsForUserFacingTopicsWithInitialChannels___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchResultsForTagType:batchSize:", 1, objc_msgSend(*(id *)(a1 + 32), "batchSize"));
}

uint64_t __86__FCUserFacingTagSearchOperation__fetchResultsForUserFacingTopicsWithInitialChannels___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  FCStreamingResults *v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "fc_arrayOfObjectsPassingTest:", &__block_literal_global_14_3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "underlyingStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_opt_new();
  v8 = v7;

  v9 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(v3, "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fc_arrayByAddingObjectsFromArray:toArray:", v10, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[FCStreamingResults initWithResults:followedByStream:]([FCStreamingResults alloc], "initWithResults:followedByStream:", v11, v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  return 0;
}

BOOL __86__FCUserFacingTagSearchOperation__fetchResultsForUserFacingTopicsWithInitialChannels___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "userFacingTagType") == 1;
}

uint64_t __86__FCUserFacingTagSearchOperation__fetchResultsForUserFacingTopicsWithInitialChannels___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_fetchResultsForTagType:(unint64_t)a3 batchSize:(unint64_t)a4
{
  id v7;
  _QWORD v9[7];

  v7 = objc_alloc(MEMORY[0x1E0D60AF0]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__FCUserFacingTagSearchOperation__fetchResultsForTagType_batchSize___block_invoke;
  v9[3] = &unk_1E4640DB8;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = a4;
  return (id)objc_msgSend(v7, "initWithResolver:", v9);
}

void __68__FCUserFacingTagSearchOperation__fetchResultsForTagType_batchSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t);
  void *v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "contentContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentContext:", v8);

  objc_msgSend(*(id *)(a1 + 32), "searchString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSearchString:", v9);

  objc_msgSend(v7, "setTagType:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v7, "setBatchSize:", *(_QWORD *)(a1 + 48));
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __68__FCUserFacingTagSearchOperation__fetchResultsForTagType_batchSize___block_invoke_2;
  v15 = &unk_1E4640D90;
  v16 = v6;
  v17 = v5;
  v10 = v5;
  v11 = v6;
  objc_msgSend(v7, "setSearchResultsBlock:", &v12);
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v7, v12, v13, v14, v15);
  objc_msgSend(v7, "start");

}

uint64_t __68__FCUserFacingTagSearchOperation__fetchResultsForTagType_batchSize___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
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

- (unint64_t)userFacingTagOptions
{
  return self->_userFacingTagOptions;
}

- (void)setUserFacingTagOptions:(unint64_t)a3
{
  self->_userFacingTagOptions = a3;
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
  return self->_searchResultsBlock;
}

- (void)setSearchResultsBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (FCStreamingResults)channelSearchResults
{
  return self->_channelSearchResults;
}

- (void)setChannelSearchResults:(id)a3
{
  objc_storeStrong((id *)&self->_channelSearchResults, a3);
}

- (FCStreamingResults)topicSearchResults
{
  return self->_topicSearchResults;
}

- (void)setTopicSearchResults:(id)a3
{
  objc_storeStrong((id *)&self->_topicSearchResults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicSearchResults, 0);
  objc_storeStrong((id *)&self->_channelSearchResults, 0);
  objc_storeStrong(&self->_searchResultsBlock, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);
}

@end
