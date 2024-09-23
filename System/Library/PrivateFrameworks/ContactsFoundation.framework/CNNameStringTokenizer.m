@implementation CNNameStringTokenizer

+ (id)tokenizeNameString:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99DC8];
  v5 = a3;
  objc_msgSend(v4, "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tokenizeNameString:usingLocale:inferredNameOrder:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)tokenizeNameString:(id)a3 usingLocale:(id)a4 inferredNameOrder:(int64_t *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  if (CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v8))
  {
    v10 = 0;
  }
  else
  {
    v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLocale:", v9);
    objc_msgSend(v11, "tokenizeNameString:inferredNameOrder:", v8, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (CNNameStringTokenizer)init
{
  void *v3;
  CNNameStringTokenizer *v4;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNNameStringTokenizer initWithLocale:](self, "initWithLocale:", v3);

  return v4;
}

- (CNNameStringTokenizer)initWithLocale:(id)a3
{
  const __CFLocale *v4;
  CNNameStringTokenizer *v5;
  CNUnfairLock *v6;
  CNUnfairLock *lock;
  CNNameStringTokenizer *v8;
  objc_super v10;
  CFRange v11;

  v4 = (const __CFLocale *)a3;
  v10.receiver = self;
  v10.super_class = (Class)CNNameStringTokenizer;
  v5 = -[CNNameStringTokenizer init](&v10, sel_init);
  if (v5)
  {
    v11.location = -1;
    v11.length = 0;
    v5->_tokenizer = CFStringTokenizerCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &stru_1E29BCC70, v11, 0, v4);
    v6 = objc_alloc_init(CNUnfairLock);
    lock = v5->_lock;
    v5->_lock = v6;

    v8 = v5;
  }

  return v5;
}

- (void)dealloc
{
  __CFStringTokenizer *tokenizer;
  objc_super v4;

  tokenizer = self->_tokenizer;
  if (tokenizer)
    CFRelease(tokenizer);
  v4.receiver = self;
  v4.super_class = (Class)CNNameStringTokenizer;
  -[CNNameStringTokenizer dealloc](&v4, sel_dealloc);
}

- (id)tokenizeNameString:(id)a3 inferredNameOrder:(int64_t *)a4
{
  id v6;
  id v7;
  void *v8;
  const void *v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v6 = a3;
  if (CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v6))
  {
    v7 = 0;
  }
  else
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__9;
    v24 = __Block_byref_object_dispose__9;
    v25 = 0;
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    -[CNNameStringTokenizer lock](self, "lock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __62__CNNameStringTokenizer_tokenizeNameString_inferredNameOrder___block_invoke;
    v11[3] = &unk_1E29BB8B0;
    v13 = &v26;
    v11[4] = self;
    v12 = v6;
    v14 = &v16;
    v15 = &v20;
    CNRunWithLock(v8, v11);

    objc_msgSend((id)objc_opt_class(), "setInferredNameOrder:toTokenizerNameOrder:", a4, *((unsigned int *)v17 + 6));
    _Block_object_dispose(&v16, 8);
    v9 = (const void *)v27[3];
    if (v9)
      CFRelease(v9);
    v7 = (id)v21[5];
    _Block_object_dispose(&v20, 8);

    _Block_object_dispose(&v26, 8);
  }

  return v7;
}

void __62__CNNameStringTokenizer_tokenizeNameString_inferredNameOrder___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "tokenizer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = _CFStringTokenizerCreateNamePartsArrayWithString();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (void)setInferredNameOrder:(int64_t *)a3 toTokenizerNameOrder:(int)a4
{
  int64_t v4;

  if (a3)
  {
    if (a4 == -1)
      v4 = -1;
    else
      v4 = 0;
    if (a4 == 1)
      v4 = 1;
    *a3 = v4;
  }
}

- (__CFStringTokenizer)tokenizer
{
  return self->_tokenizer;
}

- (CNUnfairLock)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
}

@end
