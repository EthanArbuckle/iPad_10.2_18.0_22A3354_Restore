@implementation FCTagSearchRecordStream

- (FCTagSearchRecordStream)init
{
  FCTagSearchRecordStream *v2;
  NSMutableSet *v3;
  NSMutableSet *encounteredRecordIDs;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FCTagSearchRecordStream;
  v2 = -[FCTagSearchRecordStream init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    encounteredRecordIDs = v2->_encounteredRecordIDs;
    v2->_encounteredRecordIDs = v3;

  }
  return v2;
}

- (id)fetchMoreResultsWithLimit:(unint64_t)a3 qualityOfService:(int64_t)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  NSObject *v10;
  id v11;
  _QWORD *v12;
  void (**v13)(_QWORD, _QWORD);
  void *v14;
  const char *v15;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *, void *);
  void *v21;
  FCTagSearchRecordStream *v22;
  NSObject *v23;
  id v24;
  _QWORD block[4];
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  if (-[FCTagSearchRecordStream isFinished](self, "isFinished"))
  {
    v12 = 0;
    if (v10 && v11)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __102__FCTagSearchRecordStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke;
      block[3] = &unk_1E463B598;
      v26 = v11;
      dispatch_async(v10, block);

      v12 = 0;
    }
  }
  else
  {
    if (-[FCTagSearchRecordStream fetching](self, "fetching")
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("shouldn't ask a stream for more results while it's fetching"));
      *(_DWORD *)buf = 136315906;
      v28 = "-[FCTagSearchRecordStream fetchMoreResultsWithLimit:qualityOfService:callbackQueue:completionHandler:]";
      v29 = 2080;
      v30 = "FCTagSearchOperation.m";
      v31 = 1024;
      v32 = 236;
      v33 = 2114;
      v34 = v17;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    -[FCTagSearchRecordStream setFetching:](self, "setFetching:", 1);
    -[FCTagSearchRecordStream operationConstructor](self, "operationConstructor");
    v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[FCTagSearchRecordStream cursor](self, "cursor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v13)[2](v13, v14);
    v12 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    if (v12)
      v12[47] = a3;
    objc_msgSend(v12, "setRelativePriority:", 1);
    objc_msgSend(v12, "setQualityOfService:", a4);
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __102__FCTagSearchRecordStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke_104;
    v21 = &unk_1E4649420;
    v22 = self;
    v24 = v11;
    v23 = v10;
    if (v12)
      objc_setProperty_nonatomic_copy(v12, v15, &v18, 424);
    objc_msgSend(v12, "start", v18, v19, v20, v21, v22);

  }
  return v12;
}

uint64_t __102__FCTagSearchRecordStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __102__FCTagSearchRecordStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke_104(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v7, "fc_arrayByTransformingWithBlock:", &__block_literal_global_107_0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "encounteredRecordIDs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isSubsetOfSet:", v13);

    if (v14)
    {

      v8 = 0;
    }
  }
  v15 = objc_msgSend(v12, "count");
  if (!v9 && !v15)
  {

    v8 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "encounteredRecordIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "unionSet:", v12);

  objc_msgSend(*(id *)(a1 + 32), "setCursor:", v8);
  objc_msgSend(*(id *)(a1 + 32), "setFinished:", v8 == 0);
  objc_msgSend(*(id *)(a1 + 32), "setFetching:", 0);
  v17 = *(void **)(a1 + 48);
  if (v17)
  {
    v18 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __102__FCTagSearchRecordStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke_3;
    block[3] = &unk_1E463DC60;
    v22 = v17;
    v20 = v7;
    v21 = v9;
    dispatch_async(v18, block);

  }
}

uint64_t __102__FCTagSearchRecordStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordID");
}

uint64_t __102__FCTagSearchRecordStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)operationConstructor
{
  return self->_operationConstructor;
}

- (void)setOperationConstructor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CKQueryCursor)cursor
{
  return self->_cursor;
}

- (void)setCursor:(id)a3
{
  objc_storeStrong((id *)&self->_cursor, a3);
}

- (BOOL)fetching
{
  return self->_fetching;
}

- (void)setFetching:(BOOL)a3
{
  self->_fetching = a3;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (NSMutableSet)encounteredRecordIDs
{
  return self->_encounteredRecordIDs;
}

- (void)setEncounteredRecordIDs:(id)a3
{
  objc_storeStrong((id *)&self->_encounteredRecordIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encounteredRecordIDs, 0);
  objc_storeStrong((id *)&self->_cursor, 0);
  objc_storeStrong(&self->_operationConstructor, 0);
}

@end
