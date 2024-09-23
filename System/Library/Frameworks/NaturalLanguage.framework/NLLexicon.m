@implementation NLLexicon

- (NLLexicon)initWithLocalization:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  const void *v11;
  NLLexicon *v12;
  uint64_t v13;
  NSString *localization;
  NLLexicon *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;
  id v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0C99D80]);
  v9 = (void *)objc_msgSend(v8, "initWithObjectsAndKeys:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D437A8], v7, *MEMORY[0x1E0D437B8], 0);
  v10 = LXLexiconCreate();
  if (v10)
  {
    v11 = (const void *)v10;
    v20.receiver = self;
    v20.super_class = (Class)NLLexicon;
    v12 = -[NLLexicon init](&v20, sel_init);
    if (v12)
    {
      v13 = objc_msgSend(v6, "copy");
      localization = v12->_localization;
      v12->_localization = (NSString *)v13;

      v12->_lexicon = v11;
    }
    self = v12;
    v15 = self;
  }
  else
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load lexicon for %@"), v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v22 = *MEMORY[0x1E0CB2D50];
      v23[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 10, v18);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v15 = 0;
  }

  return v15;
}

- (NLLexicon)initWithLocalization:(id)a3
{
  id v4;
  NLLexicon *v5;
  id v6;
  void *v7;
  id v9;

  v4 = a3;
  v9 = 0;
  v5 = -[NLLexicon initWithLocalization:error:](self, "initWithLocalization:error:", v4, &v9);
  v6 = v9;
  v7 = v6;
  if (v6)
    NSLog(CFSTR("Lexicon creation for %@ failed: %@"), v4, v6);

  return v5;
}

- (NSString)localization
{
  return self->_localization;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v7.receiver = self;
  v7.super_class = (Class)NLLexicon;
  -[NLLexicon description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%@"), v4, self->_localization);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendString:", CFSTR(")"));
  return v5;
}

- (void)dealloc
{
  const void *lexicon;
  objc_super v4;

  lexicon = self->_lexicon;
  if (lexicon)
    CFRelease(lexicon);
  v4.receiver = self;
  v4.super_class = (Class)NLLexicon;
  -[NLLexicon dealloc](&v4, sel_dealloc);
}

- (_LXLexicon)lexicon
{
  return (_LXLexicon *)self->_lexicon;
}

- (void)_enumerateEntriesForString:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  NLLexiconCursor *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[NLLexiconCursor initWithLexicon:string:]([NLLexiconCursor alloc], "initWithLexicon:string:", self, v7);

  -[NLLexiconCursor _enumerateEntriesUsingBlock:](v8, "_enumerateEntriesUsingBlock:", v6);
}

- (id)entryForTokenID:(unsigned int)a3
{
  uint64_t v3;
  const void *v4;
  const void *v5;
  uint64_t TokenID;
  unsigned int MetaFlags;
  void *v8;

  v3 = LXLexiconCopyEntryForTokenID();
  if (v3)
  {
    v4 = (const void *)v3;
    v5 = (const void *)LXEntryCopyString();
    TokenID = LXEntryGetTokenID();
    MetaFlags = LXEntryGetMetaFlags();
    LXEntryGetProbability();
    +[NLLexiconEntry entryWithString:tokenID:flags:probability:](NLLexiconEntry, "entryWithString:tokenID:flags:probability:", v5, TokenID, MetaFlags);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      CFRelease(v5);
    CFRelease(v4);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)entryForString:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __28__NLLexicon_entryForString___block_invoke;
  v8[3] = &unk_1E4A3A800;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[NLLexicon _enumerateEntriesForString:usingBlock:](self, "_enumerateEntriesForString:usingBlock:", v5, v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __28__NLLexicon_entryForString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5, double a6)
{
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:"))
  {
    +[NLLexiconEntry entryWithString:tokenID:flags:probability:](NLLexiconEntry, "entryWithString:tokenID:flags:probability:", v14, a3, a4, a6);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    *a5 = 1;
  }

}

- (BOOL)getProbabilityForString:(id)a3 probability:(double *)a4
{
  id v6;
  id v7;
  int v8;
  BOOL v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  double *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v15 = 0;
  v16 = (double *)&v15;
  v17 = 0x2020000000;
  v18 = 0xC03E000000000000;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__NLLexicon_getProbabilityForString_probability___block_invoke;
  v11[3] = &unk_1E4A3A828;
  v7 = v6;
  v12 = v7;
  v13 = &v15;
  v14 = &v19;
  -[NLLexicon _enumerateEntriesForString:usingBlock:](self, "_enumerateEntriesForString:usingBlock:", v7, v11);
  v8 = *((unsigned __int8 *)v20 + 24);
  if (a4 && *((_BYTE *)v20 + 24))
    *a4 = v16[3];
  v9 = v8 != 0;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

uint64_t __49__NLLexicon_getProbabilityForString_probability___block_invoke(uint64_t a1, uint64_t a2, double a3, uint64_t a4, uint64_t a5, _BYTE *a6)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", a2);
  if ((_DWORD)result)
  {
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a6 = 1;
  }
  return result;
}

- (BOOL)getProbabilityForTokenID:(unsigned int)a3 probability:(double *)a4
{
  const void *v5;
  uint64_t v6;
  uint64_t v7;

  v5 = (const void *)LXLexiconCopyEntryForTokenID();
  if (v5)
  {
    LXEntryGetProbability();
    v7 = v6;
    CFRelease(v5);
    if (a4)
      *(_QWORD *)a4 = v7;
  }
  return v5 != 0;
}

- (void)enumerateCompletionsForPrefix:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  NLLexiconCursor *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[NLLexiconCursor initWithLexicon:string:]([NLLexiconCursor alloc], "initWithLexicon:string:", self, v7);

  -[NLLexiconCursor enumerateCompletionsUsingBlock:](v8, "enumerateCompletionsUsingBlock:", v6);
}

+ (NLLexicon)lexiconWithOptions:(id)a3 error:(id *)a4
{
  void *v5;
  NLLexicon *v6;

  localizationForOptions(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NLLexicon initWithLocalization:error:]([NLLexicon alloc], "initWithLocalization:error:", v5, a4);

  return v6;
}

- (id)language
{
  return CFSTR("und");
}

- (id)languages
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[NLLexicon language](self, "language");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)lexiconType
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localization, 0);
}

@end
