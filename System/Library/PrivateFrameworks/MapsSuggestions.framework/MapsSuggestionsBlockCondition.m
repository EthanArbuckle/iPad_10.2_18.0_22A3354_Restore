@implementation MapsSuggestionsBlockCondition

- (MapsSuggestionsBlockCondition)initWithName:(id)a3 queue:(id)a4 block:(id)a5
{
  id v9;
  id v10;
  MapsSuggestionsBlockCondition *v11;
  MapsSuggestionsBlockCondition *v12;
  uint64_t v13;
  id block;
  MapsSuggestionsBlockCondition *v15;
  NSObject *v16;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v18.receiver = self;
    v18.super_class = (Class)MapsSuggestionsBlockCondition;
    v11 = -[MapsSuggestionsBaseCondition initWithName:](&v18, sel_initWithName_, a3);
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_queue, a4);
      v13 = objc_msgSend(v10, "copy");
      block = v12->_block;
      v12->_block = (id)v13;

    }
    self = v12;
    v15 = self;
  }
  else
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBlockCondition.m";
      v21 = 1024;
      v22 = 27;
      v23 = 2082;
      v24 = "-[MapsSuggestionsBlockCondition initWithName:queue:block:]";
      v25 = 2082;
      v26 = "nil == (block)";
      _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a BOOLean block to evaluate", buf, 0x26u);
    }

    v15 = 0;
  }

  return v15;
}

- (MapsSuggestionsBlockCondition)initWithName:(id)a3 block:(id)a4
{
  return -[MapsSuggestionsBlockCondition initWithName:queue:block:](self, "initWithName:queue:block:", a3, 0, a4);
}

- (BOOL)isTrue
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  queue = self->_queue;
  if (!queue)
    return (*((uint64_t (**)(void))self->_block + 2))();
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__MapsSuggestionsBlockCondition_isTrue__block_invoke;
  v5[3] = &unk_1E4BCE070;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__MapsSuggestionsBlockCondition_isTrue__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
