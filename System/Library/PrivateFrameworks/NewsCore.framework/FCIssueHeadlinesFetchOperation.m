@implementation FCIssueHeadlinesFetchOperation

- (FCIssueHeadlinesFetchOperation)init
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
    v8 = "-[FCIssueHeadlinesFetchOperation init]";
    v9 = 2080;
    v10 = "FCIssueHeadlinesFetchOperation.m";
    v11 = 1024;
    v12 = 47;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCIssueHeadlinesFetchOperation init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCIssueHeadlinesFetchOperation)initWithContext:(id)a3 issueIDs:(id)a4
{
  id v7;
  id v8;
  FCIssueHeadlinesFetchOperation *v9;
  FCIssueHeadlinesFetchOperation *v10;
  uint64_t v11;
  NSArray *issueIDs;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FCIssueHeadlinesFetchOperation;
  v9 = -[FCOperation init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    v11 = objc_msgSend(v8, "copy");
    issueIDs = v10->_issueIDs;
    v10->_issueIDs = (NSArray *)v11;

  }
  return v10;
}

- (FCIssueHeadlinesFetchOperation)initWithContext:(id)a3 issues:(id)a4
{
  id v6;
  void *v7;
  FCIssueHeadlinesFetchOperation *v8;

  v6 = a3;
  objc_msgSend(a4, "fc_arrayByTransformingWithBlock:", &__block_literal_global_108);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FCIssueHeadlinesFetchOperation initWithContext:issueIDs:](self, "initWithContext:issueIDs:", v6, v7);

  return v8;
}

uint64_t __57__FCIssueHeadlinesFetchOperation_initWithContext_issues___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
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
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("channel issues fetch operation requires a context"));
      v8 = 136315906;
      v9 = "-[FCIssueHeadlinesFetchOperation validateOperation]";
      v10 = 2080;
      v11 = "FCIssueHeadlinesFetchOperation.m";
      v12 = 1024;
      v13 = 76;
      v14 = 2114;
      v15 = v6;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);

    }
    v3 = 0;
    if (!self)
      goto LABEL_9;
  }
  if (self->_issueIDs)
  {
    v4 = 1;
    return v4 & v3;
  }
LABEL_9:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("issues headlines fetch operation requires issue IDs"));
    v8 = 136315906;
    v9 = "-[FCIssueHeadlinesFetchOperation validateOperation]";
    v10 = 2080;
    v11 = "FCIssueHeadlinesFetchOperation.m";
    v12 = 1024;
    v13 = 80;
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
  id v10;
  _QWORD v11[5];
  _QWORD v12[6];
  _QWORD v13[6];
  _QWORD v14[5];
  _QWORD v15[5];
  id v16;

  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__46;
  v15[4] = __Block_byref_object_dispose__46;
  v16 = 0;
  v3 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __50__FCIssueHeadlinesFetchOperation_performOperation__block_invoke;
  v14[3] = &unk_1E463D3A8;
  v14[4] = self;
  objc_msgSend(MEMORY[0x1E0D60AF0], "firstly:", v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v13[1] = 3221225472;
  v13[2] = __50__FCIssueHeadlinesFetchOperation_performOperation__block_invoke_2;
  v13[3] = &unk_1E4640458;
  v13[4] = self;
  v13[5] = v15;
  objc_msgSend(v4, "thenOn:then:", v5, v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v12[1] = 3221225472;
  v12[2] = __50__FCIssueHeadlinesFetchOperation_performOperation__block_invoke_3;
  v12[3] = &unk_1E4645BC8;
  v12[4] = self;
  v12[5] = v15;
  objc_msgSend(v6, "thenOn:then:", v7, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __50__FCIssueHeadlinesFetchOperation_performOperation__block_invoke_8;
  v11[3] = &unk_1E463EA38;
  v11[4] = self;
  v10 = (id)objc_msgSend(v8, "errorOn:error:", v9, v11);

  _Block_object_dispose(v15, 8);
}

id __50__FCIssueHeadlinesFetchOperation_performOperation__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    objc_msgSend(*(id *)(v1 + 384), "configurationManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    FCCoreConfigurationPromise(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

id __50__FCIssueHeadlinesFetchOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0D60AF0]);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59__FCIssueHeadlinesFetchOperation__promiseHeldRecordsByType__block_invoke;
    v8[3] = &unk_1E463DAD0;
    v8[4] = v5;
    v5 = (void *)objc_msgSend(v6, "initWithResolver:", v8);
  }

  return v5;
}

uint64_t __50__FCIssueHeadlinesFetchOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  FCMultiAccessChecker *v20;
  void *v21;
  FCStorefrontAccessChecker *v22;
  _QWORD *v23;
  void *v24;
  _QWORD *v25;
  void *v26;
  FCStorefrontAccessChecker *v27;
  void *v28;
  void *v29;
  FCMultiAccessChecker *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  FCMultiAccessChecker *v50;
  _QWORD v51[7];
  _QWORD v52[4];
  id v53;
  uint64_t v54;
  _QWORD v55[5];

  v55[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", &unk_1E470AC28);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", &unk_1E470AC40);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", &unk_1E470AC58);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = *(_QWORD **)(a1 + 32);
  if (v7)
    v7 = (_QWORD *)v7[48];
  v8 = v7;
  objc_msgSend(v8, "tagController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)v6;
  objc_msgSend(v9, "channelsForTagRecords:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *(_QWORD **)(a1 + 32);
  v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v11)
    v11 = (_QWORD *)v11[48];
  v13 = v11;
  objc_msgSend(v13, "assetManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v5, "allRecordIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  FCHeadlinesByArticleIDFromHeldRecords(v12, v14, v17, v5, v10, v4, 1, 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __50__FCIssueHeadlinesFetchOperation_performOperation__block_invoke_17;
  v52[3] = &unk_1E463F050;
  v18 = v10;
  v19 = *(_QWORD *)(a1 + 32);
  v44 = v18;
  v53 = v18;
  v54 = v19;
  objc_msgSend(v4, "transformRecordsByIDWithBlock:", v52);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = [FCMultiAccessChecker alloc];
  v21 = (void *)objc_opt_new();
  v55[0] = v21;
  v22 = [FCStorefrontAccessChecker alloc];
  v23 = *(_QWORD **)(a1 + 32);
  v47 = v5;
  v24 = v4;
  if (v23)
    v23 = (_QWORD *)v23[48];
  v25 = v23;
  objc_msgSend(v25, "privateChannelMembershipController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[FCStorefrontAccessChecker initWithPrivateChannelMembershipController:](v22, "initWithPrivateChannelMembershipController:", v26);
  v55[1] = v27;
  v28 = (void *)objc_opt_new();
  v55[2] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[FCMultiAccessChecker initWithAccessCheckers:](v20, "initWithAccessCheckers:", v29);

  v31 = *(_QWORD *)(a1 + 32);
  if (v31)
    v32 = *(void **)(v31 + 384);
  else
    v32 = 0;
  objc_msgSend(v32, "networkReachability");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "offlineReason");

  v35 = MEMORY[0x1E0C809B0];
  if (v34)
  {
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __50__FCIssueHeadlinesFetchOperation_performOperation__block_invoke_3_28;
    v51[3] = &unk_1E463BF40;
    v51[4] = *(_QWORD *)(a1 + 32);
    v36 = v43;
    v51[5] = v36;
    v37 = v45;
    v51[6] = v37;
    if (__50__FCIssueHeadlinesFetchOperation_performOperation__block_invoke_3_28((uint64_t)v51))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "fc_offlineErrorWithReason:", v34);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v38);

      goto LABEL_16;
    }

  }
  objc_msgSend(v43, "allValues");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v35;
  v48[1] = 3221225472;
  v48[2] = __50__FCIssueHeadlinesFetchOperation_performOperation__block_invoke_6;
  v48[3] = &unk_1E4645BA0;
  v49 = v45;
  v50 = v30;
  objc_msgSend(v39, "fc_dictionaryWithValueBlock:", v48);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = *(_QWORD *)(a1 + 32);
  if (v41)
    objc_storeStrong((id *)(v41 + 400), v40);

  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", 0);
  v36 = v49;
LABEL_16:

  return 0;
}

FCIssue *__50__FCIssueHeadlinesFetchOperation_performOperation__block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  FCIssue *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  FCIssue *v15;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v5, "channelTagID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = v9;
    v11 = [FCIssue alloc];
    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
      v13 = *(void **)(v12 + 384);
    else
      v13 = 0;
    objc_msgSend(v13, "assetManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[FCIssue initWithIssueRecord:assetManager:interestToken:sourceChannel:](v11, "initWithIssueRecord:assetManager:interestToken:sourceChannel:", v5, v14, v6, v10);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t __50__FCIssueHeadlinesFetchOperation_performOperation__block_invoke_3_28(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  uint64_t v16;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[49];
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    v18 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(a1 + 40), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
LABEL_21:
          v16 = 1;
          goto LABEL_23;
        }
        v9 = v8;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        objc_msgSend(v9, "allArticleIDs");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v20;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v20 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(a1 + 48), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j));
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v15)
              {

                goto LABEL_21;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            if (v12)
              continue;
            break;
          }
        }

        v6 = v18;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      v16 = 0;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v16 = 0;
  }
LABEL_23:

  return v16;
}

id __50__FCIssueHeadlinesFetchOperation_performOperation__block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(a2, "allArticleIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__FCIssueHeadlinesFetchOperation_performOperation__block_invoke_7;
  v6[3] = &unk_1E463AF98;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v3, "fc_arrayByTransformingWithBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __50__FCIssueHeadlinesFetchOperation_performOperation__block_invoke_7(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "hasAccessToItem:blockedReason:error:", v3, 0, 0))
      v3 = v4;
    else
      v3 = 0;
  }
  v5 = v3;

  return v5;
}

uint64_t __50__FCIssueHeadlinesFetchOperation_performOperation__block_invoke_8(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", a2);
}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSDictionary *resultHeadlinesByIssue;
  id v8;

  v8 = a3;
  -[FCIssueHeadlinesFetchOperation fetchCompletionHandler](self, "fetchCompletionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FCIssueHeadlinesFetchOperation fetchCompletionHandler](self, "fetchCompletionHandler");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (self)
      resultHeadlinesByIssue = self->_resultHeadlinesByIssue;
    else
      resultHeadlinesByIssue = 0;
    (*(void (**)(uint64_t, NSDictionary *, id))(v5 + 16))(v5, resultHeadlinesByIssue, v8);

  }
}

void __59__FCIssueHeadlinesFetchOperation__promiseHeldRecordsByType__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  FCRecordChainFetchOperation *v7;
  FCRecordChainFetchOperation *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  const __CFString *v27;
  _QWORD v28[3];
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init(FCRecordChainFetchOperation);
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    v10 = *(_QWORD *)(v9 + 384);
  else
    v10 = 0;
  -[FCRecordChainFetchOperation setContext:](v7, "setContext:", v10);
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    v12 = *(_QWORD *)(v11 + 392);
  else
    v12 = 0;
  -[FCRecordChainFetchOperation setTopLevelRecordIDs:](v8, "setTopLevelRecordIDs:", v12);
  v28[0] = CFSTR("Issue");
  v27 = CFSTR("allArticleIDs");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v13;
  v28[1] = CFSTR("Article");
  v26 = CFSTR("sourceChannelTagID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = CFSTR("Tag");
  v29[1] = v14;
  v29[2] = MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordChainFetchOperation setLinkKeysByRecordType:](v8, "setLinkKeysByRecordType:", v15);

  objc_msgSend(*(id *)(a1 + 32), "cachePolicy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v24 = CFSTR("Issue");
    objc_msgSend(*(id *)(a1 + 32), "cachePolicy");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCRecordChainFetchOperation setCachePoliciesByRecordType:](v8, "setCachePoliciesByRecordType:", v18);

  }
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __59__FCIssueHeadlinesFetchOperation__promiseHeldRecordsByType__block_invoke_2;
  v21[3] = &unk_1E4642E10;
  v22 = v5;
  v23 = v6;
  v19 = v6;
  v20 = v5;
  -[FCRecordChainFetchOperation setRecordChainCompletionHandler:](v8, "setRecordChainCompletionHandler:", v21);
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v8);
  -[FCOperation start](v8, "start");

}

uint64_t __59__FCIssueHeadlinesFetchOperation__promiseHeldRecordsByType__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
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
  objc_storeStrong((id *)&self->_resultHeadlinesByIssue, 0);
  objc_storeStrong((id *)&self->_issueIDs, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
  objc_storeStrong((id *)&self->_cachePolicy, 0);
}

@end
