@implementation FCTagFeedPromotedHeadlinesFetchOperation

- (FCTagFeedPromotedHeadlinesFetchOperation)initWithConfiguration:(id)a3 cloudContext:(id)a4 tagID:(id)a5 expireAfterTimeWindow:(double)a6
{
  id v11;
  id v12;
  id v13;
  FCTagFeedPromotedHeadlinesFetchOperation *v14;
  FCTagFeedPromotedHeadlinesFetchOperation *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)FCTagFeedPromotedHeadlinesFetchOperation;
  v14 = -[FCOperation init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_configuration, a3);
    objc_storeStrong((id *)&v15->_cloudContext, a4);
    objc_storeStrong((id *)&v15->_tagID, a5);
    v15->_expireAfterTimeWindow = a6;
  }

  return v15;
}

- (BOOL)validateOperation
{
  _BOOL4 v2;
  void *v3;
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
  if (self && self->_tagID)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v2)
    {
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Promoted headlines operation must have a tag ID"));
      v5 = 136315906;
      v6 = "-[FCTagFeedPromotedHeadlinesFetchOperation validateOperation]";
      v7 = 2080;
      v8 = "FCTagFeedPromotedHeadlinesFetchOperation.m";
      v9 = 1024;
      v10 = 60;
      v11 = 2114;
      v12 = v3;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v5, 0x26u);

      LOBYTE(v2) = 0;
    }
  }
  return v2;
}

- (void)performOperation
{
  uint64_t v3;
  _QWORD *v4;
  FCRecordChainFetchOperation *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  id v18;
  NSString *tagID;
  void *v20;
  const __CFString *v21;
  _QWORD v22[2];
  _QWORD v23[3];
  _QWORD v24[3];
  id v25[2];

  v3 = MEMORY[0x1E0C809B0];
  v25[1] = *(id *)MEMORY[0x1E0C80C00];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __60__FCTagFeedPromotedHeadlinesFetchOperation_performOperation__block_invoke;
  v16[3] = &unk_1E463B408;
  v16[4] = self;
  v4 = v16;
  if (self)
  {
    v5 = objc_alloc_init(FCRecordChainFetchOperation);
    -[FCRecordChainFetchOperation setContext:](v5, "setContext:", self->_cloudContext);
    v25[0] = self->_tagID;
    v6 = (void *)MEMORY[0x1E0C99D20];
    v7 = v25[0];
    objc_msgSend(v6, "arrayWithObjects:count:", v25, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[FCRecordChainFetchOperation setTopLevelRecordIDs:](v5, "setTopLevelRecordIDs:", v8);
    v23[0] = CFSTR("Article");
    v22[0] = CFSTR("sourceChannelTagID");
    v22[1] = CFSTR("parentIssueID");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v9;
    v23[1] = CFSTR("Tag");
    v21 = CFSTR("publisherSpecifiedArticleIDs");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = CFSTR("Issue");
    v24[1] = v10;
    v24[2] = MEMORY[0x1E0C9AA60];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCRecordChainFetchOperation setLinkKeysByRecordType:](v5, "setLinkKeysByRecordType:", v11);

    tagID = self->_tagID;
    v12 = tagID;
    +[FCCachePolicy cachePolicyWithSoftMaxAge:](FCCachePolicy, "cachePolicyWithSoftMaxAge:", 300.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &tagID, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCRecordChainFetchOperation setCachePoliciesByRecordID:](v5, "setCachePoliciesByRecordID:", v14);

    v17[0] = v3;
    v17[1] = 3221225472;
    v17[2] = __87__FCTagFeedPromotedHeadlinesFetchOperation__fetchPinnedHeadlinesWithCompletionHandler___block_invoke;
    v17[3] = &unk_1E4643128;
    v15 = v4;
    v17[4] = self;
    v18 = v15;
    -[FCRecordChainFetchOperation setRecordChainCompletionHandler:](v5, "setRecordChainCompletionHandler:", v17);
    -[FCOperation associateChildOperation:](self, "associateChildOperation:", v5);
    -[FCOperation start](v5, "start");

  }
}

void __60__FCTagFeedPromotedHeadlinesFetchOperation_performOperation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  const char *v5;
  id v6;
  void *v7;
  id v8;
  id newValue;

  newValue = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    if (v7)
    {
      objc_setProperty_nonatomic_copy(v7, v5, newValue, 408);
      v7 = *(void **)(a1 + 32);
    }
    v8 = 0;
  }
  objc_msgSend(v7, "finishedPerformingOperationWithError:", v8);

}

- (void)operationWillFinishWithError:(id)a3
{
  id v4;
  uint64_t v5;
  NSArray *resultHeadlines;
  NSArray *v7;
  id v8;

  v4 = a3;
  -[FCTagFeedPromotedHeadlinesFetchOperation fetchCompletionHandler](self, "fetchCompletionHandler");
  v5 = objc_claimAutoreleasedReturnValue();
  if (self)
    resultHeadlines = self->_resultHeadlines;
  else
    resultHeadlines = 0;
  if (resultHeadlines)
    v7 = resultHeadlines;
  else
    v7 = (NSArray *)MEMORY[0x1E0C9AA60];
  v8 = (id)v5;
  (*(void (**)(uint64_t, NSArray *, id))(v5 + 16))(v5, v7, v4);

}

void __87__FCTagFeedPromotedHeadlinesFetchOperation__fetchPinnedHeadlinesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void (**v6)(id, _QWORD, uint64_t);
  void *v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  double v20;
  void *v21;
  void *v22;
  char v23;
  _QWORD *v24;
  _QWORD *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD *v44;
  id v45;

  v5 = a2;
  v45 = v5;
  if (a3)
  {
    v6 = (void (**)(id, _QWORD, uint64_t))*(id *)(a1 + 40);
    v6[2](v6, 0, a3);
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E470A940);
    v6 = (void (**)(id, _QWORD, uint64_t))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "objectForKeyedSubscript:", &unk_1E470A958);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "objectForKeyedSubscript:", &unk_1E470A970);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD **)(a1 + 32);
    if (v9)
      v9 = (_QWORD *)v9[47];
    v44 = v9;
    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
      v11 = *(void **)(v10 + 384);
    else
      v11 = 0;
    objc_msgSend(v11, "tagController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tagsForTagRecords:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = *(_QWORD *)(a1 + 32);
    if (v14)
      v15 = *(_QWORD *)(v14 + 392);
    else
      v15 = 0;
    objc_msgSend(v13, "objectForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = *(_QWORD *)(a1 + 32);
    if (v19)
      v20 = *(double *)(v19 + 400);
    else
      v20 = 0.0;
    objc_msgSend(v17, "fc_dateBySubtractingTimeInterval:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "publisherSpecifiedArticleIDsModifiedDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "fc_isLaterThan:", v21);

    if ((v23 & 1) != 0)
    {
      v24 = *(_QWORD **)(a1 + 32);
      v42 = v7;
      v43 = v8;
      if (v24)
        v24 = (_QWORD *)v24[48];
      v25 = v24;
      objc_msgSend(v25, "assetManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v16, "publisherSpecifiedArticleIDs");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setWithArray:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      FCHeadlinesByArticleIDFromHeldRecords(v44, v26, v29, v6, v13, v43, 0, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = *(_QWORD *)(a1 + 32);
      v41 = v13;
      if (v31)
      {
        v32 = *(_QWORD *)(v31 + 384);
        v33 = *(id *)(v31 + 376);
        +[FCFeedTransformationFilter transformationWithFilterOptions:configuration:context:](FCFeedTransformationFilter, "transformationWithFilterOptions:configuration:context:", 0x200002118, v33, v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v34 = 0;
      }
      objc_msgSend(v16, "publisherSpecifiedArticleIDs");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "nf_objectsForKeysWithoutMarker:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "transformHeadlines:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "publisherSpecifiedArticles");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      FCAssignHeadlineMetadata(v37, v38, 0);
      v39 = v30;
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v7 = v42;
      v8 = v43;
      v13 = v41;
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
}

- (id)fetchCompletionHandler
{
  return self->_fetchCompletionHandler;
}

- (void)setFetchCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultHeadlines, 0);
  objc_storeStrong((id *)&self->_tagID, 0);
  objc_storeStrong((id *)&self->_cloudContext, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
}

@end
