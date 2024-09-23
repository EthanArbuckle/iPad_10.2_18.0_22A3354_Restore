@implementation EMFDefaultAutocompleteCandidateProvider

+ (id)providerFromInvertedIndex:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "termIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTokens:", v6);
  return v7;
}

- (EMFDefaultAutocompleteCandidateProvider)initWithBundle:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  EMFDefaultAutocompleteCandidateProvider *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v4 = a3;
  objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("vocabulary"), CFSTR("plist"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[EMFDefaultAutocompleteCandidateProvider initWithBundle:].cold.1(v4);
    __assert_rtn("-[EMFDefaultAutocompleteCandidateProvider initWithBundle:]", "EMFDefaultAutocompleteCandidateProvider.m", 35, "vocabularyFileURL");
  }
  v6 = (void *)v5;
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithContentsOfURL:error:", v5, &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[EMFDefaultAutocompleteCandidateProvider initWithBundle:].cold.2((uint64_t)v6, v10, v11, v12, v13, v14, v15, v16);
    __assert_rtn("-[EMFDefaultAutocompleteCandidateProvider initWithBundle:]", "EMFDefaultAutocompleteCandidateProvider.m", 42, "!deserializationError");
  }
  v8 = -[EMFDefaultAutocompleteCandidateProvider initWithTokens:](self, "initWithTokens:", v7);

  return v8;
}

- (EMFDefaultAutocompleteCandidateProvider)initWithTokens:(id)a3
{
  id v4;
  EMFDefaultAutocompleteCandidateProvider *v5;
  uint64_t v6;
  NSArray *tokens;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMFDefaultAutocompleteCandidateProvider;
  v5 = -[EMFDefaultAutocompleteCandidateProvider init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    tokens = v5->_tokens;
    v5->_tokens = (NSArray *)v6;

  }
  return v5;
}

- (id)matchesForPrefix:(id)a3 usingAlgorithm:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSArray *tokens;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[5];
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (a4 == 3)
  {
    -[EMFDefaultAutocompleteCandidateProvider firstMatchForPrefix:](self, "firstMatchForPrefix:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
    {
      v17[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3032000000;
    v15[3] = __Block_byref_object_copy__4;
    v15[4] = __Block_byref_object_dispose__4;
    v16 = (id)objc_msgSend(v6, "copy");
    tokens = self->_tokens;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __75__EMFDefaultAutocompleteCandidateProvider_matchesForPrefix_usingAlgorithm___block_invoke;
    v14[3] = &unk_1E66FA268;
    v14[4] = v15;
    -[NSArray indexesOfObjectsWithOptions:passingTest:](tokens, "indexesOfObjectsWithOptions:passingTest:", a4 == 2, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectsAtIndexes:](self->_tokens, "objectsAtIndexes:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(v15, 8);
  }

  return v10;
}

uint64_t __75__EMFDefaultAutocompleteCandidateProvider_matchesForPrefix_usingAlgorithm___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPrefix:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

- (id)firstMatchForPrefix:(id)a3
{
  id v4;
  NSArray *tokens;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__4;
  v11[4] = __Block_byref_object_dispose__4;
  v12 = (id)objc_msgSend(v4, "copy");
  tokens = self->_tokens;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__EMFDefaultAutocompleteCandidateProvider_firstMatchForPrefix___block_invoke;
  v10[3] = &unk_1E66FA268;
  v10[4] = v11;
  v6 = -[NSArray indexOfObjectPassingTest:](tokens, "indexOfObjectPassingTest:", v10);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_tokens, "objectAtIndex:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v8, "copy");

  }
  _Block_object_dispose(v11, 8);

  return v7;
}

uint64_t __63__EMFDefaultAutocompleteCandidateProvider_firstMatchForPrefix___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPrefix:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

- (void)enumerateCandidatesMatchingPrefix:(id)a3 withEnumerationType:(int64_t)a4 maxCandidates:(unint64_t)a5 usingBlock:(id)a6
{
  id v8;
  void (**v9)(id, _QWORD, uint64_t, uint8_t *);
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[8];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, _QWORD, uint64_t, uint8_t *))a6;
  emf_signpost_get_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);

  emf_signpost_get_log();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B3DE1000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "YieldAutocompleteCandidates", (const char *)&unk_1B3E4DDFE, buf, 2u);
  }

  -[EMFDefaultAutocompleteCandidateProvider matchesForPrefix:usingAlgorithm:](self, "matchesForPrefix:usingAlgorithm:", v8, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  emf_signpost_get_log();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B3DE1000, v16, OS_SIGNPOST_INTERVAL_END, v11, "YieldAutocompleteCandidates", (const char *)&unk_1B3E4DDFE, buf, 2u);
  }

  buf[0] = 0;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v17 = v14;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v21 = *(_QWORD *)v24;
LABEL_9:
    v22 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v21)
        objc_enumerationMutation(v17);
      if (buf[0])
        break;
      v9[2](v9, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v22), v20 + v22, buf);
      if (v19 == ++v22)
      {
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        v20 += v22;
        if (v19)
          goto LABEL_9;
        break;
      }
    }
  }

}

- (BOOL)isValidToken:(id)a3
{
  return -[NSArray indexOfObject:](self->_tokens, "indexOfObject:", a3) != 0x7FFFFFFFFFFFFFFFLL;
}

- (NSArray)tokens
{
  return self->_tokens;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);
}

- (void)initWithBundle:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "bundlePath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1B3DE1000, MEMORY[0x1E0C81028], v2, "Vocabulary file could not be loaded from the supplied bundle: '%@'", v3, v4, v5, v6, 2u);

}

- (void)initWithBundle:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B3DE1000, MEMORY[0x1E0C81028], a3, "Unable to deserialize vocabulary file: '%@'", a5, a6, a7, a8, 2u);
}

@end
