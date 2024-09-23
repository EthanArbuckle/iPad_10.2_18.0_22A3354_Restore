@implementation FCTransformedStream

- (FCTransformedStream)init
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
    v8 = "-[FCTransformedStream init]";
    v9 = 2080;
    v10 = "FCTransformedStream.m";
    v11 = 1024;
    v12 = 23;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCTransformedStream init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCTransformedStream)initWithStream:(id)a3 transformBlock:(id)a4
{
  id v7;
  id v8;
  FCTransformedStream *v9;
  void *v10;
  id transformBlock;
  void *v13;
  void *v14;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "stream != nil");
    *(_DWORD *)buf = 136315906;
    v17 = "-[FCTransformedStream initWithStream:transformBlock:]";
    v18 = 2080;
    v19 = "FCTransformedStream.m";
    v20 = 1024;
    v21 = 28;
    v22 = 2114;
    v23 = v13;
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
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "transformBlock != nil");
    *(_DWORD *)buf = 136315906;
    v17 = "-[FCTransformedStream initWithStream:transformBlock:]";
    v18 = 2080;
    v19 = "FCTransformedStream.m";
    v20 = 1024;
    v21 = 29;
    v22 = 2114;
    v23 = v14;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v15.receiver = self;
  v15.super_class = (Class)FCTransformedStream;
  v9 = -[FCTransformedStream init](&v15, sel_init);
  if (v9)
  {
    v10 = _Block_copy(v8);
    transformBlock = v9->_transformBlock;
    v9->_transformBlock = v10;

    objc_storeStrong((id *)&v9->_stream, a3);
  }

  return v9;
}

- (id)fetchMoreResultsWithLimit:(unint64_t)a3 qualityOfService:(int64_t)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;

  v10 = a6;
  v11 = a5;
  -[FCTransformedStream stream](self, "stream");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __98__FCTransformedStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke;
  v16[3] = &unk_1E4644898;
  v16[4] = self;
  v17 = v10;
  v13 = v10;
  objc_msgSend(v12, "fetchMoreResultsWithLimit:qualityOfService:callbackQueue:completionHandler:", a3, a4, v11, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __98__FCTransformedStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "transformBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fc_arrayByTransformingWithBlock:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v8, v10);

}

- (BOOL)isFinished
{
  void *v2;
  char v3;

  -[FCTransformedStream stream](self, "stream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFinished");

  return v3;
}

- (id)transformBlock
{
  return self->_transformBlock;
}

- (void)setTransformBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (FCStreaming)stream
{
  return self->_stream;
}

- (void)setStream:(id)a3
{
  objc_storeStrong((id *)&self->_stream, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong(&self->_transformBlock, 0);
}

@end
