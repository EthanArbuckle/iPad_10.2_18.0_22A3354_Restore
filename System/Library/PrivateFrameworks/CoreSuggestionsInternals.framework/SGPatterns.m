@implementation SGPatterns

- (SGPatterns)init
{
  SGPatterns *v2;
  uint64_t v3;
  NSCache *compiledRegexes2;
  uint64_t v5;
  NSMutableSet *regexpKeysSeen;
  void *v7;
  _QWORD v9[4];
  SGPatterns *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SGPatterns;
  v2 = -[SGPatterns init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    compiledRegexes2 = v2->_compiledRegexes2;
    v2->_compiledRegexes2 = (NSCache *)v3;

    v5 = objc_opt_new();
    regexpKeysSeen = v2->_regexpKeysSeen;
    v2->_regexpKeysSeen = (NSMutableSet *)v5;

    v7 = (void *)globalPatternsData;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __18__SGPatterns_init__block_invoke;
    v9[3] = &unk_1E7DAB178;
    v10 = v2;
    objc_msgSend(v7, "runWithLockAcquired:", v9);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __21__SGPatterns_dealloc__block_invoke;
  v4[3] = &unk_1E7DAB178;
  v4[4] = self;
  objc_msgSend((id)globalPatternsData, "runWithLockAcquired:", v4);
  v3.receiver = self;
  v3.super_class = (Class)SGPatterns;
  -[SGPatterns dealloc](&v3, sel_dealloc);
}

- (void)resetIfNeeded
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __27__SGPatterns_resetIfNeeded__block_invoke;
  v2[3] = &unk_1E7DAB178;
  v2[4] = self;
  objc_msgSend((id)globalPatternsData, "runWithLockAcquired:", v2);
}

- (id)rawValuesForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__8640;
  v16 = __Block_byref_object_dispose__8641;
  v17 = 0;
  -[SGPatterns resetIfNeeded](self, "resetIfNeeded");
  v5 = (void *)globalPatternsData;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __30__SGPatterns_rawValuesForKey___block_invoke;
  v9[3] = &unk_1E7DAB210;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "runWithLockAcquired:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)rawValueForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__8640;
  v16 = __Block_byref_object_dispose__8641;
  v17 = 0;
  -[SGPatterns resetIfNeeded](self, "resetIfNeeded");
  v5 = (void *)globalPatternsData;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __29__SGPatterns_rawValueForKey___block_invoke;
  v9[3] = &unk_1E7DAB210;
  v9[4] = self;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "runWithLockAcquired:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)rawValueOrDataForKey:(id)a3
{
  void *v3;
  void *v4;

  -[SGPatterns rawValueForKey:](self, "rawValueForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  dereferenceData(v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)stringSetMatcherForKey:(id)a3
{
  id v4;
  SGAhoCorasick *v5;
  void *v6;
  void *v7;
  SGAhoCorasick *v8;

  v4 = a3;
  v5 = [SGAhoCorasick alloc];
  -[SGPatterns rawValueForKey:](self, "rawValueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  dereferenceData(v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SGAhoCorasick initWithBytecode:](v5, "initWithBytecode:", v7);

  return v8;
}

- (id)regex2ForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  SGPatterns *v35;
  id v36;
  id obj;
  void *context;
  SGRe2PrefilterTree *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  void *v46;
  _QWORD v47[5];
  id v48;
  uint64_t *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[5];
  id v59;
  id v60;
  uint64_t *v61;
  uint64_t *v62;
  uint64_t v63;
  id *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v69 = 0;
  v70 = &v69;
  v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__8640;
  v73 = __Block_byref_object_dispose__8641;
  v74 = 0;
  v63 = 0;
  v64 = (id *)&v63;
  v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__8640;
  v67 = __Block_byref_object_dispose__8641;
  v68 = 0;
  v6 = (void *)globalPatternsData;
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __27__SGPatterns_regex2ForKey___block_invoke;
  v58[3] = &unk_1E7DAB238;
  v35 = self;
  v58[4] = self;
  v61 = &v63;
  v43 = v4;
  v59 = v43;
  v62 = &v69;
  v36 = v5;
  v60 = v36;
  objc_msgSend(v6, "runWithLockAcquired:", v58);
  v7 = v64[5];
  if (v7)
  {
    v8 = v7;
  }
  else
  {
    v56 = 0u;
    v57 = 0u;
    v55 = 0u;
    v54 = 0u;
    obj = v36;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v76, 16);
    if (v9)
    {
      v40 = *(_QWORD *)v55;
      while (2)
      {
        v10 = 0;
        v41 = v9;
        do
        {
          if (*(_QWORD *)v55 != v40)
            objc_enumerationMutation(obj);
          v45 = v10;
          v11 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v10);
          v44 = (void *)MEMORY[0x1C3BD4F6C]();
          objc_msgSend(v11, "objectForKey:", v43);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          if (v46)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              context = (void *)MEMORY[0x1C3BD4F6C]();
              if ((objc_msgSend(v43, "hasSuffix:", CFSTR("/F")) & 1) == 0)
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, v35, CFSTR("SGPatterns.m"), 376, CFSTR("Non-prefiltered regexp was array: %@"), v43);

              }
              objc_msgSend(v43, "stringByAppendingString:", CFSTR(".filt"));
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "objectForKeyedSubscript:", v12);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              dereferenceData(v13, 1);
              v42 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v42)
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, v35, CFSTR("SGPatterns.m"), 378, CFSTR("Data not found for prefiltered regexp: %@"), v43);

              }
              v39 = -[SGRe2PrefilterTree initWithData:]([SGRe2PrefilterTree alloc], "initWithData:", v42);
              v14 = v46;
              v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v14, "count"));
              v52 = 0u;
              v53 = 0u;
              v50 = 0u;
              v51 = 0u;
              v16 = v14;
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v75, 16);
              if (v17)
              {
                v18 = *(_QWORD *)v51;
                do
                {
                  for (i = 0; i != v17; ++i)
                  {
                    if (*(_QWORD *)v51 != v18)
                      objc_enumerationMutation(v16);
                    dereferenceData(*(void **)(*((_QWORD *)&v50 + 1) + 8 * i), 0);
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      +[SGRe2 re2WithRegexpLazy:](SGRe2, "re2WithRegexpLazy:", v20);
                      v21 = objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                        goto LABEL_39;
                      +[SGRe2 re2WithRegexpDataLazy:](SGRe2, "re2WithRegexpDataLazy:", v20);
                      v21 = objc_claimAutoreleasedReturnValue();
                    }
                    v22 = (void *)v21;
                    objc_msgSend(v15, "addObject:", v21);

                  }
                  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v75, 16);
                }
                while (v17);
              }

              v23 = (void *)v70[5];
              +[SGRe2 re2WithSubregexps:prefilter:](SGRe2, "re2WithSubregexps:prefilter:", v15, v39);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "addObject:", v24);

              objc_autoreleasePoolPop(context);
            }
            else
            {
              dereferenceData(v46, 0);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                +[SGRe2 re2WithRegexp:](SGRe2, "re2WithRegexp:", v25);
                v26 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
LABEL_39:
                  __break(1u);
                  goto LABEL_40;
                }
                +[SGRe2 re2WithRegexpData:](SGRe2, "re2WithRegexpData:", v25);
                v26 = objc_claimAutoreleasedReturnValue();
              }
              v27 = (void *)v26;
              objc_msgSend((id)v70[5], "addObject:", v26);

            }
          }

          objc_autoreleasePoolPop(v44);
          v10 = v45 + 1;
        }
        while (v45 + 1 != v41);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v76, 16);
        if (v9)
          continue;
        break;
      }
    }

    if (!objc_msgSend((id)v70[5], "count"))
    {
LABEL_40:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, v35, CFSTR("SGPatterns.m"), 409, CFSTR("Could not find raw asset value for key %@"), v43);

    }
    if (objc_msgSend((id)v70[5], "count") == 1)
      objc_msgSend((id)v70[5], "objectAtIndexedSubscript:", 0);
    else
      +[SGRe2 re2WithSubregexps:](SGRe2, "re2WithSubregexps:", v70[5]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v64 + 5, v30);

    v31 = (void *)globalPatternsData;
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __27__SGPatterns_regex2ForKey___block_invoke_2;
    v47[3] = &unk_1E7DAB210;
    v47[4] = v35;
    v49 = &v63;
    v48 = v43;
    objc_msgSend(v31, "runWithLockAcquired:", v47);
    v8 = v64[5];

  }
  _Block_object_dispose(&v63, 8);

  _Block_object_dispose(&v69, 8);
  return v8;
}

- (void)_clearRegexCache
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __30__SGPatterns__clearRegexCache__block_invoke;
  v2[3] = &unk_1E7DAB178;
  v2[4] = self;
  objc_msgSend((id)globalPatternsData, "runWithLockAcquired:", v2);
}

- (void)_becomeImmuneToDeath
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __34__SGPatterns__becomeImmuneToDeath__block_invoke;
  v2[3] = &unk_1E7DAB178;
  v2[4] = self;
  objc_msgSend((id)globalPatternsData, "runWithLockAcquired:", v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regexpKeysSeen, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_compiledRegexes2, 0);
  objc_storeStrong((id *)&self->_langResolutionOrder, 0);
  objc_storeStrong((id *)&self->_classKey, 0);
}

void __34__SGPatterns__becomeImmuneToDeath__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8), (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3[7], "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

uint64_t __30__SGPatterns__clearRegexCache__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
}

void __27__SGPatterns_regex2ForKey___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "resetIfNeeded");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(a1 + 40));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", *(_QWORD *)(a1 + 40));
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count"));
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(v3[1], "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14), (_QWORD)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
            objc_msgSend(*(id *)(a1 + 48), "addObject:", v16);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

  }
}

uint64_t __27__SGPatterns_regex2ForKey___block_invoke_2(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[5]);
}

void __29__SGPatterns_rawValueForKey___block_invoke(_QWORD *a1, void *a2)
{
  id *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = *(id *)(a1[4] + 16);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3[1], "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(a1[4] + 8));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", a1[5]);
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = *(_QWORD *)(a1[6] + 8);
          v13 = *(void **)(v12 + 40);
          *(_QWORD *)(v12 + 40) = v11;

          if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
          {

            goto LABEL_12;
          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

}

void __30__SGPatterns_rawValuesForKey___block_invoke(_QWORD *a1, void *a2)
{
  id *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", objc_msgSend(*(id *)(a1[4] + 16), "count"));
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = *(id *)(a1[4] + 16);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v3[1], "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11), (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", *(_QWORD *)(a1[4] + 8));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v13, "objectForKeyedSubscript:", a1[5]);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObject:", v14);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

void __27__SGPatterns_resetIfNeeded__block_invoke(uint64_t a1, _DWORD *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _DWORD *v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2[6];
  if (*(_DWORD *)(v2 + 48) != v3)
  {
    *(_DWORD *)(v2 + 48) = v3;
    v8 = a2;
    +[SGPatterns calculateLangResolutionOrder](SGPatterns, "calculateLangResolutionOrder");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 16);
    *(_QWORD *)(v6 + 16) = v5;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
  }
}

void __21__SGPatterns_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

uint64_t __18__SGPatterns_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 40), "addObject:", *(_QWORD *)(a1 + 32));
}

+ (void)initialize
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  if ((id)objc_opt_class() == a1)
  {
    v3 = (void *)objc_opt_new();
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v3);
    v5 = (void *)globalPatternsData;
    globalPatternsData = v4;

    +[SGAsset asset](SGAsset, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __24__SGPatterns_initialize__block_invoke;
    v8[3] = &__block_descriptor_40_e20_v16__0___PASAsset2_8l;
    v8[4] = a1;
    v7 = (id)objc_msgSend(v6, "registerUpdateHandler:", v8);

    objc_msgSend(a1, "changeLanguageOrPatternData");
    objc_msgSend((id)globalPatternsData, "runWithLockAcquired:", &__block_literal_global_8940);

  }
}

+ (void)changeLanguageOrPatternData
{
  _QWORD v2[6];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __41__SGPatterns_changeLanguageOrPatternData__block_invoke;
  v2[3] = &__block_descriptor_48_e29_v16__0__SGPatternGlobalData_8l;
  v2[4] = a2;
  v2[5] = a1;
  objc_msgSend((id)globalPatternsData, "runWithLockAcquired:", v2);
}

+ (id)calculateCurrentLanguagesFromPreferredLocaleCodes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)globalPatternsData;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__SGPatterns_calculateCurrentLanguagesFromPreferredLocaleCodes___block_invoke;
  v11[3] = &unk_1E7DAB128;
  v12 = v3;
  v6 = v4;
  v13 = v6;
  v7 = v3;
  objc_msgSend(v5, "runWithLockAcquired:", v11);
  v8 = v13;
  v9 = v6;

  return v9;
}

+ (void)forceLanguagesTo:(id)a3
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  SEL v10;
  id v11;

  v5 = a3;
  v6 = (void *)globalPatternsData;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __31__SGPatterns_forceLanguagesTo___block_invoke;
  v8[3] = &unk_1E7DAB150;
  v10 = a2;
  v11 = a1;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "runWithLockAcquired:", v8);

}

+ (id)patternsForIdentifier:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;

  v3 = a3;
  v4 = (_QWORD *)objc_opt_new();
  v5 = (void *)v4[1];
  v4[1] = v3;

  objc_msgSend(v4, "resetIfNeeded");
  return v4;
}

+ (id)patternsForClass:(Class)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", class_getName(a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "patternsForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)setPatternsDictForTesting:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)globalPatternsData;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__SGPatterns_setPatternsDictForTesting___block_invoke;
  v6[3] = &unk_1E7DAB178;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "runWithLockAcquired:", v6);

}

+ (id)calculateLangResolutionOrder
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__8640;
  v9 = __Block_byref_object_dispose__8641;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__SGPatterns_calculateLangResolutionOrder__block_invoke;
  v4[3] = &unk_1E7DAB1C8;
  v4[4] = &v5;
  objc_msgSend((id)globalPatternsData, "runWithLockAcquired:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

+ (void)useAllLanguagesAtOnce:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__SGPatterns_useAllLanguagesAtOnce___block_invoke;
  v3[3] = &__block_descriptor_33_e29_v16__0__SGPatternGlobalData_8l;
  v4 = a3;
  objc_msgSend((id)globalPatternsData, "runWithLockAcquired:", v3);
}

+ (void)clearAllRegexCaches
{
  objc_msgSend((id)globalPatternsData, "runWithLockAcquired:", &__block_literal_global_89);
}

+ (void)_reinstateDeath
{
  objc_msgSend((id)globalPatternsData, "runWithLockAcquired:", &__block_literal_global_90);
}

+ (void)pauseCacheEvictionTemporarily
{
  _QWORD block[5];

  objc_msgSend((id)globalPatternsData, "runWithLockAcquired:", &__block_literal_global_91);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__SGPatterns_pauseCacheEvictionTemporarily__block_invoke_92;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

+ (id)languagePartOfLanguageCode:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C997E8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  return v6;
}

+ (id)countryCodeFromLanguageCode:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C997B0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  return v6;
}

+ (id)fallbackLanguageCodeForCountryCode:(id)a3
{
  return (id)objc_msgSend(&unk_1E7E11540, "objectForKeyedSubscript:", a3);
}

uint64_t __43__SGPatterns_pauseCacheEvictionTemporarily__block_invoke_92(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __43__SGPatterns_pauseCacheEvictionTemporarily__block_invoke_2;
  v2[3] = &__block_descriptor_40_e29_v16__0__SGPatternGlobalData_8l;
  v2[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend((id)globalPatternsData, "runWithLockAcquired:", v2);
}

void __43__SGPatterns_pauseCacheEvictionTemporarily__block_invoke_2(uint64_t a1)
{
  dispatch_time_t v1;
  NSObject *source;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__SGPatterns_pauseCacheEvictionTemporarily__block_invoke_3;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  if (_block_invoke__pasOnceToken7 != -1)
    dispatch_once(&_block_invoke__pasOnceToken7, block);
  source = (id)_block_invoke__pasExprOnceResult;
  dispatch_suspend(source);
  v1 = dispatch_time(0, 50000000000);
  dispatch_source_set_timer(source, v1, 0xFFFFFFFFFFFFFFFFLL, 0x4A817C800uLL);
  dispatch_resume(source);

}

void __43__SGPatterns_pauseCacheEvictionTemporarily__block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  _QWORD handler[5];

  v2 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "SGPatterns-deathTimer", 17);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v3);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __43__SGPatterns_pauseCacheEvictionTemporarily__block_invoke_4;
  handler[3] = &__block_descriptor_40_e5_v8__0l;
  handler[4] = *(_QWORD *)(a1 + 32);
  dispatch_source_set_event_handler(v4, handler);
  dispatch_resume(v4);

  v5 = (void *)_block_invoke__pasExprOnceResult;
  _block_invoke__pasExprOnceResult = (uint64_t)v4;

  objc_autoreleasePoolPop(v2);
}

uint64_t __43__SGPatterns_pauseCacheEvictionTemporarily__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reinstateDeath");
}

void __43__SGPatterns_pauseCacheEvictionTemporarily__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  int v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = v2[5];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7++), "_becomeImmuneToDeath", (_QWORD)v10);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
    }
    while (v5);
  }

  sgLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = objc_msgSend(v2[7], "count");
    *(_DWORD *)buf = 67109120;
    v15 = v9;
    _os_log_debug_impl(&dword_1C3607000, v8, OS_LOG_TYPE_DEBUG, "Pausing death for %i objects", buf, 8u);
  }

}

void __29__SGPatterns__reinstateDeath__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  NSObject *v3;
  int v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  sgLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = objc_msgSend(v2[7], "count");
    v5[0] = 67109120;
    v5[1] = v4;
    _os_log_debug_impl(&dword_1C3607000, v3, OS_LOG_TYPE_DEBUG, "Reinstating death for %i objects", (uint8_t *)v5, 8u);
  }

  objc_msgSend(v2[7], "removeAllObjects");
}

void __33__SGPatterns_clearAllRegexCaches__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a2 + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "_clearRegexCache", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

uint64_t __36__SGPatterns_useAllLanguagesAtOnce___block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(a2 + 48) = *(_BYTE *)(result + 32);
  return result;
}

void __42__SGPatterns_calculateLangResolutionOrder__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*((_BYTE *)v3 + 48))
  {
    v4 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithObjects:", CFSTR("nolang"), CFSTR("base"), CFSTR("eu-me"), CFSTR("w-europe"), CFSTR("e-europe"), CFSTR("asia"), CFSTR("middleeast"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)v3 + 1);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __42__SGPatterns_calculateLangResolutionOrder__block_invoke_2;
    v28[3] = &unk_1E7DAB1A0;
    v29 = v5;
    v7 = v5;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v28);
    objc_msgSend(v7, "array");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_autoreleasePoolPop(v4);
  }
  else
  {
    v22 = a1;
    v11 = (void *)objc_opt_new();
    v12 = (void *)objc_opt_new();
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = *((id *)v3 + 4);
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(obj);
          v17 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * i);
          if (v17)
          {
            do
            {
              if ((objc_msgSend(v12, "containsObject:", v17) & 1) == 0)
              {
                objc_msgSend(v11, "addObject:", v17);
                objc_msgSend(v12, "addObject:", v17);
              }
              objc_msgSend(*((id *)v3 + 1), "objectForKeyedSubscript:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR(".."));
              v19 = objc_claimAutoreleasedReturnValue();

              v17 = (id)v19;
            }
            while (v19);
          }
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      }
      while (v14);
    }

    v20 = *(_QWORD *)(*(_QWORD *)(v22 + 32) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v11;

  }
}

void __42__SGPatterns_calculateLangResolutionOrder__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR(".."));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = objc_msgSend(v5, "count");

    if (v8 >= 2)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
  }

}

void __40__SGPatterns_setPatternsDictForTesting___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(a2 + 8), *(id *)(a1 + 32));
}

void __31__SGPatterns_forceLanguagesTo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!*((_QWORD *)v3 + 1))
  {
    +[SGAsset asset](SGAsset, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filesystemPathForAssetDataRelativePath:", CFSTR("CompiledPatterns.plist"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), CFSTR("SGPatterns.m"), 170, CFSTR("filesystemPathForAssetDataRelativePath returned nil"));

    }
    sgLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v5;
      _os_log_impl(&dword_1C3607000, v6, OS_LOG_TYPE_INFO, "Loading pattern data from path \"%@\", buf, 0xCu);
    }

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v5);
    v8 = (void *)*((_QWORD *)v3 + 1);
    *((_QWORD *)v3 + 1) = v7;

    if (!*((_QWORD *)v3 + 1))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), CFSTR("SGPatterns.m"), 173, CFSTR("Could not load pattern data"));

    }
  }
  v9 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v10 = (void *)*((_QWORD *)v3 + 4);
  *((_QWORD *)v3 + 4) = v9;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = *((id *)v3 + 4);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(*((id *)v3 + 1), "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), CFSTR("SGPatterns.m"), 177, CFSTR("Language not found: %@"), v16);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }

  ++*((_DWORD *)v3 + 6);
}

void __64__SGPatterns_calculateCurrentLanguagesFromPreferredLocaleCodes___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  uint64_t v5;
  __objc2_class **v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = *(id *)(a1 + 32);
  v22 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v22)
    goto LABEL_22;
  v5 = *(_QWORD *)v24;
  v6 = off_1E7DA6000;
  v19 = v4;
  v20 = a1;
  v21 = v3;
  while (2)
  {
    for (i = 0; i != v22; ++i)
    {
      if (*(_QWORD *)v24 != v5)
        objc_enumerationMutation(v4);
      v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
      v9 = (void *)MEMORY[0x1C3BD4F6C]();
      objc_msgSend(v8, "lowercaseString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3[1], "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = v10;
        if (!v12)
          goto LABEL_18;
      }
      else
      {
        v13 = v5;
        -[__objc2_class languagePartOfLanguageCode:](v6[35], "languagePartOfLanguageCode:", v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "lowercaseString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3[1], "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v12 = v15;
        }
        else
        {
          -[__objc2_class countryCodeFromLanguageCode:](v6[35], "countryCodeFromLanguageCode:", v8);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[__objc2_class fallbackLanguageCodeForCountryCode:](v6[35], "fallbackLanguageCodeForCountryCode:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(v21[1], "objectForKeyedSubscript:", v18);
            v12 = (id)objc_claimAutoreleasedReturnValue();

            if (v12)
              v12 = v18;
          }
          else
          {
            v12 = 0;
          }

          v4 = v19;
        }

        v5 = v13;
        a1 = v20;
        v3 = v21;
        v6 = off_1E7DA6000;
        if (!v12)
          goto LABEL_18;
      }
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v12, v19);
      if (objc_msgSend(*(id *)(a1 + 40), "count") == 5)
      {

        objc_autoreleasePoolPop(v9);
        goto LABEL_22;
      }
LABEL_18:

      objc_autoreleasePoolPop(v9);
    }
    v22 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v22)
      continue;
    break;
  }
LABEL_22:

  if (!objc_msgSend(*(id *)(a1 + 40), "count"))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", CFSTR("en"));

}

void __41__SGPatterns_changeLanguageOrPatternData__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  _BOOL4 v9;
  const __CFString *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  __CFString *v18;
  NSObject *v19;
  const __CFString *v20;
  SGPatternDataFile *v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  const __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1C3BD4F6C]();
  +[SGAsset asset](SGAsset, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filesystemPathsForAssetDataRelativePaths:", &unk_1E7E10770);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CompiledPatterns.plist"));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  sgLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  v10 = CFSTR("(nil path)");
  if (v9)
  {
    if (v7)
      v10 = v7;
    *(_DWORD *)buf = 138412290;
    v34 = v10;
    _os_log_impl(&dword_1C3607000, v8, OS_LOG_TYPE_INFO, "Loading pattern plist, path: %@", buf, 0xCu);
  }

  v32 = 0;
  objc_msgSend(MEMORY[0x1E0D815D8], "dictionaryWithPath:error:", v7, &v32);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v32;
  if (!v11)
  {
    v31 = v12;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v7, 1, &v31);
    v14 = v31;

    if (v13)
    {
      v30 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v13, 0, 0, &v30);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v30;

      v14 = v12;
      if (v11)
        goto LABEL_11;
    }
    else
    {
      v12 = v14;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("SGPatterns.m"), 101, CFSTR("Could not read pattern plist from %@: %@"), v7, v14);

    v11 = 0;
  }
LABEL_11:
  objc_storeStrong(v3 + 1, v11);
  objc_msgSend(v3[1], "objectForKeyedSubscript:", CFSTR("nolang"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *(_QWORD *)(a1 + 32);
    v27 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3[1], "allKeys");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", v28, v27, CFSTR("SGPatterns.m"), 103, CFSTR("Invalid pattern plist: no nolang locale found! Keys: %@"), v29);

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CompiledPatterns.pldat"));
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  sgLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = CFSTR("(nil path)");
    if (v18)
      v20 = v18;
    *(_DWORD *)buf = 138412290;
    v34 = v20;
    _os_log_impl(&dword_1C3607000, v19, OS_LOG_TYPE_INFO, "Loading pattern pldat, path: %@", buf, 0xCu);
  }

  v21 = -[SGPatternDataFile initWithPath:]([SGPatternDataFile alloc], "initWithPath:", v18);
  v22 = v3[2];
  v3[2] = v21;

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGPatterns calculateCurrentLanguagesFromPreferredLocaleCodes:](SGPatterns, "calculateCurrentLanguagesFromPreferredLocaleCodes:", v23);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v3[4];
  v3[4] = (id)v24;

  ++*((_DWORD *)v3 + 6);
  objc_autoreleasePoolPop(v4);

}

uint64_t __24__SGPatterns_initialize__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "changeLanguageOrPatternData");
}

void __24__SGPatterns_initialize__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0CB3690];
  v3 = a2;
  objc_msgSend(v2, "weakObjectsHashTable");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v3[5];
  v3[5] = v4;

  v6 = objc_opt_new();
  v7 = (id)v3[7];
  v3[7] = v6;

}

@end
