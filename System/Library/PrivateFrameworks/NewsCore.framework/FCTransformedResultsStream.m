@implementation FCTransformedResultsStream

- (FCTransformedResultsStream)initWithStream:(id)a3 asyncTransformBlock:(id)a4
{
  id v7;
  id v8;
  FCTransformedResultsStream *v9;
  FCTransformedResultsStream *v10;
  uint64_t v11;
  void *asyncTransformBlock;
  void *v14;
  void *v15;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "stream != nil");
    *(_DWORD *)buf = 136315906;
    v18 = "-[FCTransformedResultsStream initWithStream:asyncTransformBlock:]";
    v19 = 2080;
    v20 = "FCTransformedResultsStream.m";
    v21 = 1024;
    v22 = 23;
    v23 = 2114;
    v24 = v14;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v8)
      goto LABEL_6;
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "asyncTransformBlock != nil");
    *(_DWORD *)buf = 136315906;
    v18 = "-[FCTransformedResultsStream initWithStream:asyncTransformBlock:]";
    v19 = 2080;
    v20 = "FCTransformedResultsStream.m";
    v21 = 1024;
    v22 = 24;
    v23 = 2114;
    v24 = v15;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v16.receiver = self;
  v16.super_class = (Class)FCTransformedResultsStream;
  v9 = -[FCTransformedResultsStream init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    if (v7 && v8)
    {
      objc_storeStrong((id *)&v9->_stream, a3);
      v11 = objc_msgSend(v8, "copy");
      asyncTransformBlock = v10->_asyncTransformBlock;
      v10->_asyncTransformBlock = (id)v11;
    }
    else
    {
      asyncTransformBlock = v9;
      v10 = 0;
    }

  }
  return v10;
}

- (id)fetchMoreResultsWithLimit:(unint64_t)a3 qualityOfService:(int64_t)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  id v19;
  int64_t v20;

  v10 = a5;
  v11 = a6;
  -[FCTransformedResultsStream stream](self, "stream");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __105__FCTransformedResultsStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke;
  v17[3] = &unk_1E4643178;
  v17[4] = self;
  v18 = v10;
  v19 = v11;
  v20 = a4;
  v13 = v11;
  v14 = v10;
  objc_msgSend(v12, "fetchMoreResultsWithLimit:qualityOfService:callbackQueue:completionHandler:", a3, a4, v14, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __105__FCTransformedResultsStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  id v10;
  void (*v11)(_QWORD *, id, uint64_t, _QWORD *);
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "asyncTransformBlock");
  v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 56);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __105__FCTransformedResultsStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke_2;
  v13[3] = &unk_1E4643150;
  v14 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v15 = v5;
  v16 = v10;
  v11 = (void (*)(_QWORD *, id, uint64_t, _QWORD *))v8[2];
  v12 = v5;
  v11(v8, v7, v9, v13);

}

void __105__FCTransformedResultsStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    v5 = *(void **)(a1 + 48);
    if (v5)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __105__FCTransformedResultsStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke_3;
      block[3] = &unk_1E463DC60;
      v9 = v5;
      v7 = v3;
      v8 = *(id *)(a1 + 40);
      dispatch_async(v4, block);

    }
  }

}

uint64_t __105__FCTransformedResultsStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (BOOL)isFinished
{
  void *v2;
  char v3;

  -[FCTransformedResultsStream stream](self, "stream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFinished");

  return v3;
}

- (FCStreaming)stream
{
  return self->_stream;
}

- (void)setStream:(id)a3
{
  objc_storeStrong((id *)&self->_stream, a3);
}

- (id)asyncTransformBlock
{
  return self->_asyncTransformBlock;
}

- (void)setAsyncTransformBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_asyncTransformBlock, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

@end
