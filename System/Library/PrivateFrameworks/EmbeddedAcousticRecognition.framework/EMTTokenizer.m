@implementation EMTTokenizer

- (EMTTokenizer)initWithModelURL:(id)a3
{
  id v4;
  EMTTokenizer *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  NSObject *v8;
  _QWORD v10[4];
  id v11;
  EMTTokenizer *v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EMTTokenizer;
  v5 = -[EMTTokenizer init](&v13, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.sequoia.tokenizer", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    v8 = v5->_queue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __33__EMTTokenizer_initWithModelURL___block_invoke;
    v10[3] = &unk_1E5D47110;
    v11 = v4;
    v12 = v5;
    dispatch_async(v8, v10);

  }
  return v5;
}

void __33__EMTTokenizer_initWithModelURL___block_invoke(uint64_t a1)
{
  void *v2;
  _BOOL4 v3;
  _EARFormatter *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _EARFormatter *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "URLByAppendingPathComponent:", CFSTR("mini.json"));
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[_EARFormatter supportedByQuasarConfig:](_EARFormatter, "supportedByQuasarConfig:", v2);

  if (v3)
  {
    v4 = [_EARFormatter alloc];
    objc_msgSend(v17, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[_EARFormatter initWithLanguage:withSdapiConfig:quasarConfig:](v4, "initWithLanguage:withSdapiConfig:quasarConfig:", &stru_1E5D49530, &stru_1E5D49530, v5);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(void **)(v7 + 8);
    *(_QWORD *)(v7 + 8) = v6;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "URLByAppendingPathComponent:", CFSTR("ncs/dispatch.voc"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "URLByAppendingPathComponent:", CFSTR("ncs/lexicon.enh"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "URLByAppendingPathComponent:", CFSTR("ncs/itn_s.enh"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = [_EARFormatter alloc];
    objc_msgSend(v5, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[_EARFormatter initWithGeneralVoc:withLexiconEnh:withItnEnh:](v10, "initWithGeneralVoc:withLexiconEnh:withItnEnh:", v11, v12, v13);
    v15 = *(_QWORD *)(a1 + 40);
    v16 = *(void **)(v15 + 8);
    *(_QWORD *)(v15 + 8) = v14;

  }
}

- (id)format:(id)a3 preToPostItnMap:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *queue;
  id v16;
  id v17;
  id v18;
  _QWORD v20[5];
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "tokens");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v31;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v13), "text");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v11);
  }

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__8;
  v28 = __Block_byref_object_dispose__8;
  v29 = 0;
  queue = self->_queue;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __39__EMTTokenizer_format_preToPostItnMap___block_invoke;
  v20[3] = &unk_1E5D48540;
  v20[4] = self;
  v21 = v9;
  v22 = v7;
  v23 = &v24;
  v16 = v7;
  v17 = v9;
  dispatch_sync(queue, v20);
  v18 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v18;
}

void __39__EMTTokenizer_format_preToPostItnMap___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 8), "formattedStringWithStrings:preToPostItnArray:", a1[5], a1[6]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)format:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *queue;
  id v13;
  id v14;
  _QWORD block[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "tokens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v26;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v10), "text");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v8);
  }

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__8;
  v23 = __Block_byref_object_dispose__8;
  v24 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__EMTTokenizer_format___block_invoke;
  block[3] = &unk_1E5D47050;
  v17 = v6;
  v18 = &v19;
  block[4] = self;
  v13 = v6;
  dispatch_sync(queue, block);
  v14 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v14;
}

void __23__EMTTokenizer_format___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 8), "formattedStringWithStrings:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSLocale)outputLocale
{
  return self->_outputLocale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputLocale, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
}

@end
