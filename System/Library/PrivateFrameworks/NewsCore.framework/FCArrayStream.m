@implementation FCArrayStream

- (FCArrayStream)initWithArray:(id)a3
{
  id v4;
  FCArrayStream *v5;
  uint64_t v6;
  NSArray *array;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCArrayStream;
  v5 = -[FCArrayStream init](&v9, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = objc_msgSend(v4, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    array = v5->_array;
    v5->_array = (NSArray *)v6;

  }
  return v5;
}

- (FCArrayStream)init
{
  return -[FCArrayStream initWithArray:](self, "initWithArray:", 0);
}

- (id)fetchMoreResultsWithLimit:(unint64_t)a3 qualityOfService:(int64_t)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  NSObject *v9;
  id v10;
  void *v11;
  unint64_t v12;
  unint64_t index;
  NSUInteger v14;
  void *v15;
  id v16;
  void *v18;
  _QWORD block[4];
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  v11 = v10;
  if (v9)
  {
    if (v10)
    {
      if (a3)
        v12 = a3;
      else
        v12 = 0xFFFFFFFFLL;
      index = self->_index;
      v14 = -[NSArray count](self->_array, "count");
      if (v12 >= v14 - self->_index)
        v12 = v14 - self->_index;
      -[NSArray subarrayWithRange:](self->_array, "subarrayWithRange:", index, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      self->_index = v12 + index;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __92__FCArrayStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke;
      block[3] = &unk_1E463B2D0;
      v20 = v15;
      v21 = v11;
      v16 = v15;
      dispatch_async(v9, block);

LABEL_9:
      goto LABEL_14;
    }
LABEL_13:
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "completionHandler != nil");
    *(_DWORD *)buf = 136315906;
    v23 = "-[FCArrayStream fetchMoreResultsWithLimit:qualityOfService:callbackQueue:completionHandler:]";
    v24 = 2080;
    v25 = "FCArrayStream.m";
    v26 = 1024;
    v27 = 35;
    v28 = 2114;
    v29 = v16;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "callbackQueue != nil");
    *(_DWORD *)buf = 136315906;
    v23 = "-[FCArrayStream fetchMoreResultsWithLimit:qualityOfService:callbackQueue:completionHandler:]";
    v24 = 2080;
    v25 = "FCArrayStream.m";
    v26 = 1024;
    v27 = 34;
    v28 = 2114;
    v29 = v18;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (!v11)
    goto LABEL_13;
LABEL_14:

  return 0;
}

uint64_t __92__FCArrayStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (BOOL)isFinished
{
  unint64_t index;

  index = self->_index;
  return index == -[NSArray count](self->_array, "count");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_array, 0);
}

@end
