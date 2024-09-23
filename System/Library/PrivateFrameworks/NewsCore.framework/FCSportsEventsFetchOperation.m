@implementation FCSportsEventsFetchOperation

- (FCSportsEventsFetchOperation)initWithContext:(id)a3 tagController:(id)a4 sportsEventIDs:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  FCSportsEventsFetchOperation *v15;
  FCSportsEventsFetchOperation *v16;
  uint64_t v17;
  FCNewsAppConfigurationManager *appConfigurationManager;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "context");
    *(_DWORD *)buf = 136315906;
    v25 = "-[FCSportsEventsFetchOperation initWithContext:tagController:sportsEventIDs:delegate:]";
    v26 = 2080;
    v27 = "FCSportsEventsFetchOperation.m";
    v28 = 1024;
    v29 = 46;
    v30 = 2114;
    v31 = v20;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v12)
      goto LABEL_6;
  }
  else if (v12)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tagController");
    *(_DWORD *)buf = 136315906;
    v25 = "-[FCSportsEventsFetchOperation initWithContext:tagController:sportsEventIDs:delegate:]";
    v26 = 2080;
    v27 = "FCSportsEventsFetchOperation.m";
    v28 = 1024;
    v29 = 47;
    v30 = 2114;
    v31 = v21;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (!v13 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "sportsEventIDs");
    *(_DWORD *)buf = 136315906;
    v25 = "-[FCSportsEventsFetchOperation initWithContext:tagController:sportsEventIDs:delegate:]";
    v26 = 2080;
    v27 = "FCSportsEventsFetchOperation.m";
    v28 = 1024;
    v29 = 48;
    v30 = 2114;
    v31 = v22;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v23.receiver = self;
  v23.super_class = (Class)FCSportsEventsFetchOperation;
  v15 = -[FCOperation init](&v23, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_context, a3);
    objc_storeStrong((id *)&v16->_tagController, a4);
    objc_storeStrong((id *)&v16->_sportsEventIDs, a5);
    objc_msgSend(v11, "news_core_ConfigurationManager");
    v17 = objc_claimAutoreleasedReturnValue();
    appConfigurationManager = v16->_appConfigurationManager;
    v16->_appConfigurationManager = (FCNewsAppConfigurationManager *)v17;

    objc_storeWeak((id *)&v16->_delegate, v14);
  }

  return v16;
}

- (BOOL)validateOperation
{
  FCContentContext *context;
  BOOL v3;

  if (self)
  {
    context = self->_context;
    self = (FCSportsEventsFetchOperation *)self->_sportsEventIDs;
    v3 = context != 0;
  }
  else
  {
    v3 = 0;
  }
  return -[FCSportsEventsFetchOperation count](self, "count") && v3;
}

- (void)performOperation
{
  FCRecordChainFetchOperation *v3;
  FCRecordChainFetchOperation *v4;
  FCContentContext *context;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(FCRecordChainFetchOperation);
  v4 = v3;
  if (self)
  {
    -[FCRecordChainFetchOperation setTopLevelRecordIDs:](v3, "setTopLevelRecordIDs:", self->_sportsEventIDs);
    context = self->_context;
  }
  else
  {
    -[FCRecordChainFetchOperation setTopLevelRecordIDs:](v3, "setTopLevelRecordIDs:", 0);
    context = 0;
  }
  -[FCRecordChainFetchOperation setContext:](v4, "setContext:", context);
  -[FCSportsEventsFetchOperation cachePolicy](self, "cachePolicy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordChainFetchOperation setCachePolicy:](v4, "setCachePolicy:", v6);

  v11[0] = CFSTR("SportsEvent");
  v10[0] = CFSTR("eventCompetitorTagIDs");
  v10[1] = CFSTR("eventLeagueTagID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("Tag");
  v12[0] = v7;
  v12[1] = MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordChainFetchOperation setLinkKeysByRecordType:](v4, "setLinkKeysByRecordType:", v8);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__FCSportsEventsFetchOperation_performOperation__block_invoke;
  v9[3] = &unk_1E463D040;
  v9[4] = self;
  -[FCRecordChainFetchOperation setRecordChainCompletionHandler:](v4, "setRecordChainCompletionHandler:", v9);
  -[FCOperation associateChildOperation:](self, "associateChildOperation:", v4);
  -[FCOperation start](v4, "start");

}

void __48__FCSportsEventsFetchOperation_performOperation__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];

  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:");
  }
  else
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", &unk_1E470A4F0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      v6 = *(void **)(v5 + 400);
    else
      v6 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __48__FCSportsEventsFetchOperation_performOperation__block_invoke_10;
    v10[3] = &unk_1E463E128;
    v10[4] = v5;
    v7 = v6;
    objc_msgSend(v4, "transformRecordsInOrder:withBlock:", v7, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      objc_storeStrong((id *)(v9 + 424), v8);

    objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", 0);
  }
}

FCSportsEvent *__48__FCSportsEventsFetchOperation_performOperation__block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  id v24;
  FCSportsEvent *v25;
  _QWORD *v26;
  _QWORD *v27;
  void *v28;
  FCSportsEvent *v29;
  id v30;
  uint64_t v31;
  _QWORD v33[5];
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  uint64_t v38;
  _QWORD v39[4];
  id v40;
  uint64_t v41;
  id v42;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD **)(a1 + 32);
  if (v7)
    v7 = (_QWORD *)v7[49];
  v8 = v7;
  objc_msgSend(v5, "eventCompetitorTagIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "slowCachedTagsForIDs:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "eventCompetitorTagIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __48__FCSportsEventsFetchOperation_performOperation__block_invoke_2_11;
  v39[3] = &unk_1E463E090;
  v13 = v10;
  v14 = *(_QWORD *)(a1 + 32);
  v40 = v13;
  v41 = v14;
  v15 = v5;
  v42 = v15;
  objc_msgSend(v11, "fc_arrayByTransformingWithBlock:", v39);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "count");
  objc_msgSend(v15, "eventCompetitorTagIDs");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v17 == v19)
  {
    v20 = *(_QWORD **)(a1 + 32);
    if (v20)
      v20 = (_QWORD *)v20[49];
    v21 = v20;
    objc_msgSend(v15, "eventLeagueTagID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "slowCachedTagForID:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "asSports");
    v24 = (id)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v24 = v24;
      v25 = [FCSportsEvent alloc];
      v26 = *(_QWORD **)(a1 + 32);
      if (v26)
        v26 = (_QWORD *)v26[48];
      v27 = v26;
      objc_msgSend(v27, "assetManager");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[FCSportsEvent initWithSportsEventRecord:eventCompetitorTags:eventLeagueTag:assetManager:interestToken:](v25, "initWithSportsEventRecord:eventCompetitorTags:eventLeagueTag:assetManager:interestToken:", v15, v16, v24, v28, v6);

    }
    else
    {
      v33[0] = v12;
      v33[1] = 3221225472;
      v33[2] = __48__FCSportsEventsFetchOperation_performOperation__block_invoke_19;
      v33[3] = &unk_1E463E100;
      v33[4] = *(_QWORD *)(a1 + 32);
      v34 = v15;
      __48__FCSportsEventsFetchOperation_performOperation__block_invoke_19((uint64_t)v33);
      v29 = (FCSportsEvent *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v35[0] = v12;
    v35[1] = 3221225472;
    v35[2] = __48__FCSportsEventsFetchOperation_performOperation__block_invoke_14;
    v35[3] = &unk_1E463E0D8;
    v36 = v15;
    v30 = v16;
    v31 = *(_QWORD *)(a1 + 32);
    v37 = v30;
    v38 = v31;
    __48__FCSportsEventsFetchOperation_performOperation__block_invoke_14((uint64_t)v35);
    v29 = (FCSportsEvent *)objc_claimAutoreleasedReturnValue();

    v24 = v36;
  }

  return v29;
}

id __48__FCSportsEventsFetchOperation_performOperation__block_invoke_2_11(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSports");

  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __48__FCSportsEventsFetchOperation_performOperation__block_invoke_3;
    v8[3] = &unk_1E463E068;
    v8[4] = *(_QWORD *)(a1 + 40);
    v9 = v3;
    v10 = *(id *)(a1 + 48);
    __48__FCSportsEventsFetchOperation_performOperation__block_invoke_3((uint64_t)v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

uint64_t __48__FCSportsEventsFetchOperation_performOperation__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(void **)(a1 + 32);
    v5 = v2;
    objc_msgSend(v4, "shortOperationDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "base");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v6;
    v12 = 2114;
    v13 = v7;
    v14 = 2114;
    v15 = v9;
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "%{public}@ encountered non-sports tag with id %{public}@ as a competitor tag for sports event with id %{public}@. Ignoring invalid competitor tag.", (uint8_t *)&v10, 0x20u);

  }
  return 0;
}

uint64_t __48__FCSportsEventsFetchOperation_performOperation__block_invoke_14(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(*(id *)(a1 + 32), "eventCompetitorTagIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithArray:", v3);

  objc_msgSend(*(id *)(a1 + 40), "fc_setByTransformingWithBlock:", &__block_literal_global_26);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_setByMinusingSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_ERROR))
  {
    v9 = *(void **)(a1 + 48);
    v10 = v7;
    objc_msgSend(v9, "shortOperationDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "base");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138544130;
    v17 = v11;
    v18 = 2114;
    v19 = v13;
    v20 = 2114;
    v21 = v14;
    v22 = 2114;
    v23 = v15;
    _os_log_error_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_ERROR, "%{public}@ failed to fetch all competitor tags for sports event, discarding sports event record with identifier=%{public}@; fetched competitor tags=%{public}@; unfetched competitor tags=%{public}@",
      (uint8_t *)&v16,
      0x2Au);

  }
  return 0;
}

uint64_t __48__FCSportsEventsFetchOperation_performOperation__block_invoke_2_16(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __48__FCSportsEventsFetchOperation_performOperation__block_invoke_19(uint64_t a1)
{
  void *v2;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(void **)(a1 + 32);
    v5 = v2;
    objc_msgSend(v4, "shortOperationDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "base");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "eventLeagueTagID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v6;
    v12 = 2114;
    v13 = v8;
    v14 = 2114;
    v15 = v9;
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "%{public}@ failed to get league tag for sports event record, sports event discarded; sportsEventRecord identifier="
      "%{public}@, leagueTag identifier=%{public}@",
      (uint8_t *)&v10,
      0x20u);

  }
  return 0;
}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSArray *resultSportsEvents;
  void *v8;
  uint64_t v9;
  void *v10;
  NSArray *v11;
  id v12;

  v12 = a3;
  -[FCSportsEventsFetchOperation delegate]((id *)&self->super.super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FCSportsEventsFetchOperation delegate]((id *)&self->super.super.super.isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (self)
      resultSportsEvents = self->_resultSportsEvents;
    else
      resultSportsEvents = 0;
    objc_msgSend(v5, "sportsEventsFetchOperation:didFetchSportsEvents:", self, resultSportsEvents);

  }
  -[FCSportsEventsFetchOperation fetchCompletionHandler](self, "fetchCompletionHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[FCSportsEventsFetchOperation fetchCompletionHandler](self, "fetchCompletionHandler");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (self)
      v11 = self->_resultSportsEvents;
    else
      v11 = 0;
    (*(void (**)(uint64_t, NSArray *, id))(v9 + 16))(v9, v11, v12);

  }
}

- (id)delegate
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 52);
  return WeakRetained;
}

- (FCCachePolicy)cachePolicy
{
  return self->_cachePolicy;
}

- (void)setCachePolicy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (id)fetchCompletionHandler
{
  return self->_fetchCompletionHandler;
}

- (void)setFetchCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultSportsEvents, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appConfigurationManager, 0);
  objc_storeStrong((id *)&self->_sportsEventIDs, 0);
  objc_storeStrong((id *)&self->_tagController, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
  objc_storeStrong((id *)&self->_cachePolicy, 0);
}

@end
