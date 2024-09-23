@implementation FCCheckArticleStatusOperation

- (FCCheckArticleStatusOperation)initWithContext:(id)a3 articleID:(id)a4
{
  id v7;
  id v8;
  FCCheckArticleStatusOperation *v9;
  FCCheckArticleStatusOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCCheckArticleStatusOperation;
  v9 = -[FCOperation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_articleID, a4);
    v10->_resultStatus = 0;
  }

  return v10;
}

- (BOOL)validateOperation
{
  void *v2;
  BOOL v3;

  -[FCCheckArticleStatusOperation articleID](self, "articleID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)performOperation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  FCCKContentFetchOperation *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  SEL v14;
  const char *v15;
  id v16;
  _QWORD newValue[4];
  id v18;
  FCCheckArticleStatusOperation *v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C95070]);
  -[FCCheckArticleStatusOperation articleID](self, "articleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithRecordName:", v4);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:", CFSTR("A-canary"));
  v7 = objc_alloc_init(FCCKContentFetchOperation);
  -[FCCheckArticleStatusOperation context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "internalContentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKContentFetchOperation setDatabase:]((uint64_t)v7, v10);

  v20[0] = v5;
  v20[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11;
  if (v7)
  {
    objc_setProperty_nonatomic_copy(v7, v12, v11, 384);

    objc_setProperty_nonatomic_copy(v7, v14, MEMORY[0x1E0C9AA60], 400);
  }
  else
  {

  }
  newValue[0] = MEMORY[0x1E0C809B0];
  newValue[1] = 3221225472;
  newValue[2] = __49__FCCheckArticleStatusOperation_performOperation__block_invoke;
  newValue[3] = &unk_1E46446B8;
  v18 = v6;
  v19 = self;
  v16 = v6;
  if (v7)
    objc_setProperty_nonatomic_copy(v7, v15, newValue, 416);
  -[FCOperation associateChildOperation:](self, "associateChildOperation:", v7);
  -[FCOperation start](v7, "start");

}

void __49__FCCheckArticleStatusOperation_performOperation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!objc_msgSend(v6, "fc_isCKUnknownItemError")
    || (objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32)),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    if (v6)
      goto LABEL_4;
LABEL_7:
    if (objc_msgSend(v5, "count") != 2 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("should have one article record and one canary if there was no error"));
      v12 = 136315906;
      v13 = "-[FCCheckArticleStatusOperation performOperation]_block_invoke";
      v14 = 2080;
      v15 = "FCCheckArticleStatusOperation.m";
      v16 = 1024;
      v17 = 65;
      v18 = 2114;
      v19 = v11;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v12, 0x26u);

    }
    v8 = *(void **)(a1 + 40);
    v9 = 1;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "fc_canaryDownError");
  v10 = objc_claimAutoreleasedReturnValue();

  v6 = (id)v10;
  if (!v10)
    goto LABEL_7;
LABEL_4:
  if (objc_msgSend(v6, "fc_isCKUnknownItemError"))
  {
    v8 = *(void **)(a1 + 40);
    v9 = 2;
LABEL_11:
    objc_msgSend(v8, "setResultStatus:", v9);
  }
  objc_msgSend(*(id *)(a1 + 40), "finishedPerformingOperationWithError:", v6);

}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[5];

  -[FCCheckArticleStatusOperation checkStatusCompletion](self, "checkStatusCompletion", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FCCheckArticleStatusOperation callbackQueue](self, "callbackQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5)
    {
      FCDispatchQueueForQualityOfService(-[FCCheckArticleStatusOperation qualityOfService](self, "qualityOfService"));
      v6 = objc_claimAutoreleasedReturnValue();
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__FCCheckArticleStatusOperation_operationWillFinishWithError___block_invoke;
    block[3] = &unk_1E463AB18;
    block[4] = self;
    dispatch_async(v6, block);
    if (!v5)

  }
}

void __62__FCCheckArticleStatusOperation_operationWillFinishWithError___block_invoke(uint64_t a1)
{
  void (**v2)(id, uint64_t);

  objc_msgSend(*(id *)(a1 + 32), "checkStatusCompletion");
  v2 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue();
  v2[2](v2, objc_msgSend(*(id *)(a1 + 32), "resultStatus"));

}

- (id)checkStatusCompletion
{
  return objc_getProperty(self, a2, 368, 1);
}

- (void)setCheckStatusCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 368);
}

- (OS_dispatch_queue)callbackQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 376, 1);
}

- (void)setCallbackQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 376);
}

- (FCCloudContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSString)articleID
{
  return self->_articleID;
}

- (void)setArticleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (int64_t)resultStatus
{
  return self->_resultStatus;
}

- (void)setResultStatus:(int64_t)a3
{
  self->_resultStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong(&self->_checkStatusCompletion, 0);
}

@end
