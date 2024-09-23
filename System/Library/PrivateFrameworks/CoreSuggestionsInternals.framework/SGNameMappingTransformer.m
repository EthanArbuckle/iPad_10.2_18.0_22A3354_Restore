@implementation SGNameMappingTransformer

- (SGNameMappingTransformer)initWithNameMappings:(id)a3 minimumConfidence:(int)a4 confidenceMapper:(id)a5 tokenToIgnore:(id)a6 forNameDetector:(BOOL)a7
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  SGNameMappingTransformer *v22;
  SGNameMappingTransformer *v23;
  uint64_t v24;
  id confidenceMapper;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("FULL"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGNameMappingTransformer.m"), 126, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nameMappings[NameMappingFull]"));

  }
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("FIRST"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGNameMappingTransformer.m"), 127, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nameMappings[NameMappingFirst]"));

  }
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("LAST"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGNameMappingTransformer.m"), 128, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nameMappings[NameMappingLast]"));

  }
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("UNDEFINED"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGNameMappingTransformer.m"), 129, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nameMappings[NameMappingUndefined]"));

  }
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("POSSESSIVE"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGNameMappingTransformer.m"), 130, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nameMappings[NameMappingPossessive]"));

  }
  v32.receiver = self;
  v32.super_class = (Class)SGNameMappingTransformer;
  v22 = -[SGNameMappingTransformer init](&v32, sel_init);
  v23 = v22;
  if (v22)
  {
    v22->_forNameDetector = a7;
    objc_storeStrong((id *)&v22->_nameMappings, a3);
    objc_storeStrong((id *)&v23->_tokenToIgnore, a6);
    v23->_minimumConfidence = a4;
    v24 = MEMORY[0x1C3BD5158](v15);
    confidenceMapper = v23->_confidenceMapper;
    v23->_confidenceMapper = (id)v24;

  }
  return v23;
}

- (id)nameMappingForToken:(id)a3 withConfidence:(int *)a4
{
  id v5;
  int v6;
  __CFString *v7;
  __CFString *v8;
  char v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  _BOOL4 v16;
  _BOOL4 v17;
  const __CFString *v18;
  const __CFString *v19;
  int v20;

  v5 = a3;
  v6 = objc_msgSend(v5, "confidence");
  if (v6)
    v7 = CFSTR("UNDEFINED");
  else
    v7 = 0;
  v8 = v7;
  v9 = +[SGNames attributesForNameWord:](SGNames, "attributesForNameWord:", v5);
  if ((v9 & 5) == 0)
  {
    v11 = v6;
    if (!a4)
      goto LABEL_35;
    goto LABEL_34;
  }
  if ((v9 & 4) != 0)
    v10 = 10;
  else
    v10 = 5;
  if (v6 <= v10)
    v11 = v10;
  else
    v11 = v6;
  if ((v9 & 2) != 0)
  {

    v8 = CFSTR("LAST");
    if (!a4)
      goto LABEL_35;
    goto LABEL_34;
  }
  v12 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v5, "lowercaseString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (firstnames_onceToken != -1)
    dispatch_once(&firstnames_onceToken, &__block_literal_global_6144);
  v14 = objc_msgSend((id)firstnames_trie, "payloadForString:", v13);
  if (lastnames_onceToken != -1)
    dispatch_once(&lastnames_onceToken, &__block_literal_global_143);
  v15 = objc_msgSend((id)lastnames_trie, "payloadForString:", v13);
  if (v14 | v15)
  {
    v16 = v15 != 0;
    v17 = v14 != 0;
    v18 = CFSTR("FIRST");
    if (v17 && v16)
      v18 = CFSTR("UNDEFINED");
    if (v14)
      v19 = v18;
    else
      v19 = CFSTR("LAST");
    if (v17 && v16)
      v20 = 2;
    else
      v20 = 1;
    v11 += v20;

    v8 = (__CFString *)v19;
    goto LABEL_32;
  }
  if (v6)
  {
    v8 = CFSTR("UNDEFINED");
LABEL_32:
    v11 += +[SGNames isCapitalized:](SGNames, "isCapitalized:", v5);
    goto LABEL_33;
  }
  v8 = 0;
LABEL_33:

  objc_autoreleasePoolPop(v12);
  if (a4)
LABEL_34:
    *a4 = v11;
LABEL_35:

  return v8;
}

- (id)transform:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  uint64_t v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  char v25;
  _BOOL4 v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  _BOOL4 v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  NSUInteger v40;
  void *v41;
  NSUInteger v42;
  NSUInteger v43;
  NSUInteger v44;
  NSRange v45;
  __CFString *v46;
  void *v47;
  uint64_t v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  SEL v54;
  void *v55;
  id v56;
  uint64_t v57;
  int v58;
  __CFString *v59;
  uint64_t v60;
  _QWORD v61[4];
  id v62;
  SGNameMappingTransformer *v63;
  int v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint64_t v70;
  NSRange v71;
  NSRange v72;

  v70 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    __assert_rtn("-[SGNameMappingTransformer transform:]", "SGNameMappingTransformer.m", 195, "[input isKindOfClass:[NSArray class]]");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v55 = (void *)objc_opt_new();
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
  if (v8)
  {
    v9 = v8;
    v54 = a2;
    v58 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v66;
    v56 = v7;
    v57 = *(_QWORD *)v66;
    while (1)
    {
      v12 = 0;
      v60 = v9;
      do
      {
        if (*(_QWORD *)v66 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x1C3BD4F6C]();
        if (!objc_msgSend(v13, "isEqualToString:", self->_tokenToIgnore))
        {
          v64 = 0;
          -[SGNameMappingTransformer nameMappingForToken:withConfidence:](self, "nameMappingForToken:withConfidence:", v13, &v64);
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v16 = v15;
            if (v64 < self->_minimumConfidence)
            {

              goto LABEL_13;
            }
            v59 = v10;
            if (v15 == CFSTR("FIRST"))
            {
              v26 = v10 != CFSTR("LAST");
              v27 = v10 != CFSTR("UNDEFINED");
              v25 = v26 && v27;
              if (v26 && v27)
                v16 = CFSTR("FIRST");
              else
                v16 = CFSTR("FULL");
            }
            else if (v15 == CFSTR("LAST"))
            {
              v30 = v10 != CFSTR("FIRST");
              v31 = v10 != CFSTR("UNDEFINED");
              v25 = v30 && v31;
              if (v30 && v31)
                v16 = CFSTR("LAST");
              else
                v16 = CFSTR("FULL");
            }
            else if (v15 == CFSTR("UNDEFINED"))
            {
              v25 = v10 != CFSTR("FIRST") && v10 != CFSTR("LAST") && v10 != CFSTR("UNDEFINED");
              if (v10 != CFSTR("FIRST") && v10 != CFSTR("LAST"))
                v16 = CFSTR("UNDEFINED");
              else
                v16 = CFSTR("FULL");
            }
            else if (v15 == CFSTR("POSSESSIVE"))
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", v54, self, CFSTR("SGNameMappingTransformer.m"), 245, CFSTR("Shouldn't be NameMappingPossessive"));

              v25 = 1;
              v16 = CFSTR("POSSESSIVE");
            }
            else
            {
              v25 = 1;
            }
            -[NSDictionary objectForKeyedSubscript:](self->_nameMappings, "objectForKeyedSubscript:", v16, v54);
            v32 = objc_claimAutoreleasedReturnValue();
            if (!v32)
              __assert_rtn("-[SGNameMappingTransformer transform:]", "SGNameMappingTransformer.m", 249, "feature");
            v33 = (void *)v32;
            if ((v25 & 1) != 0)
            {
              v34 = objc_msgSend(v13, "range");
              +[SGTokenString stringWithString:range:confidence:](SGTokenString, "stringWithString:range:confidence:", v33, v34, v35, v64);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "addObject:", v36);

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "count") - 1);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "addObject:", v37);
            }
            else
            {
              v38 = v64;
              if (v64 <= v58)
                v38 = v58;
              v64 = v38 + 1;
              objc_msgSend(v6, "lastObject");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = objc_msgSend(v39, "range");
              v41 = v6;
              v43 = v42;
              v72.location = objc_msgSend(v13, "range");
              v72.length = v44;
              v71.location = v40;
              v71.length = v43;
              v6 = v41;
              v45 = NSUnionRange(v71, v72);
              +[SGTokenString stringWithString:range:confidence:](SGTokenString, "stringWithString:range:confidence:", v33, v45.location, v45.length, v64);
              v37 = (void *)objc_claimAutoreleasedReturnValue();

              v11 = v57;
              objc_msgSend(v41, "setObject:atIndexedSubscript:", v37, objc_msgSend(v41, "count") - 1);
            }

            v46 = v16;
            v58 = v64;

            v10 = v46;
            v7 = v56;
LABEL_45:
            v9 = v60;
            goto LABEL_46;
          }
LABEL_13:
          v17 = v10;
          if (v10)
          {
            -[NSDictionary objectForKeyedSubscript:](self->_nameMappings, "objectForKeyedSubscript:", v10);
            v18 = objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              v19 = (void *)v18;
              v20 = v17;
              -[NSDictionary objectForKeyedSubscript:](self->_nameMappings, "objectForKeyedSubscript:", CFSTR("POSSESSIVE"));
              v21 = objc_claimAutoreleasedReturnValue();
              if (v21)
              {
                v22 = (void *)v21;
                v23 = -[SGNameMappingTransformer isPossessive:](self, "isPossessive:", v13);

                v17 = v20;
                v11 = v57;
                if (v23)
                {
                  objc_msgSend(v6, "lastObject");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "setConfidence:", -v58);

                  v10 = CFSTR("POSSESSIVE");
                  goto LABEL_45;
                }
              }
              else
              {

                v11 = v57;
              }
            }
          }

          if (!self->_forNameDetector)
          {
            if (objc_msgSend(v13, "hasPrefix:", CFSTR("SG_")))
            {
              objc_msgSend(v6, "addObject:", v13);
            }
            else
            {
              objc_msgSend(v13, "lowercaseString");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "stringWithNewContents:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "addObject:", v29);

            }
          }
          v10 = 0;
          goto LABEL_45;
        }
        if (!self->_forNameDetector)
          objc_msgSend(v6, "addObject:", v13);
LABEL_46:
        objc_autoreleasePoolPop(v14);
        ++v12;
      }
      while (v9 != v12);
      v48 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
      v9 = v48;
      if (!v48)
        goto LABEL_52;
    }
  }
  v10 = 0;
LABEL_52:

  if (self->_forNameDetector)
  {
    v49 = v6;
    v50 = v55;
  }
  else
  {
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __38__SGNameMappingTransformer_transform___block_invoke;
    v61[3] = &unk_1E7DA9F60;
    v51 = v6;
    v62 = v51;
    v63 = self;
    v50 = v55;
    objc_msgSend(v55, "enumerateObjectsUsingBlock:", v61);
    v52 = v51;

  }
  return v6;
}

- (BOOL)isPossessive:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("'s"));
}

- (id)toPlistWithChunks:(id)a3
{
  NSDictionary *nameMappings;
  void *v5;
  void *v6;
  void *v7;
  NSString *tokenToIgnore;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  nameMappings = self->_nameMappings;
  v10[1] = CFSTR("MINIMUM_CONFIDENCE");
  v11[0] = nameMappings;
  v10[0] = CFSTR("NAME_MAPPINGS");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_minimumConfidence);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  tokenToIgnore = self->_tokenToIgnore;
  if (tokenToIgnore)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", tokenToIgnore, CFSTR("TOKEN_TO_IGNORE"));
  return v7;
}

- (SGNameMappingTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  SGNameMappingTransformer *v11;

  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NAME_MAPPINGS"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MINIMUM_CONFIDENCE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "intValue");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TOKEN_TO_IGNORE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[SGNameMappingTransformer initWithNameMappings:minimumConfidence:confidenceMapper:tokenToIgnore:forNameDetector:](self, "initWithNameMappings:minimumConfidence:confidenceMapper:tokenToIgnore:forNameDetector:", v7, v9, 0, v10, 0);
  return v11;
}

- (BOOL)isEqualToNameMappingTransformer:(id)a3
{
  id *v4;
  id *v5;
  NSDictionary *nameMappings;
  NSDictionary *v7;
  NSDictionary *v8;
  NSDictionary *v9;
  char v10;
  NSString *tokenToIgnore;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  char v15;
  BOOL v16;

  v4 = (id *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_12;
  nameMappings = self->_nameMappings;
  v7 = (NSDictionary *)v4[2];
  if (nameMappings == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = nameMappings;
    v10 = -[NSDictionary isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
      goto LABEL_12;
  }
  tokenToIgnore = self->_tokenToIgnore;
  v12 = (NSString *)v5[3];
  if (tokenToIgnore == v12)
  {

  }
  else
  {
    v13 = v12;
    v14 = tokenToIgnore;
    v15 = -[NSString isEqual:](v14, "isEqual:", v13);

    if ((v15 & 1) == 0)
      goto LABEL_12;
  }
  if (self->_minimumConfidence != *((_DWORD *)v5 + 8))
  {
LABEL_12:
    v16 = 0;
    goto LABEL_13;
  }
  v16 = self->_confidenceMapper == v5[5];
LABEL_13:

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  SGNameMappingTransformer *v4;
  SGNameMappingTransformer *v5;
  BOOL v6;

  v4 = (SGNameMappingTransformer *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGNameMappingTransformer isEqualToNameMappingTransformer:](self, "isEqualToNameMappingTransformer:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = -[NSDictionary hash](self->_nameMappings, "hash");
  v4 = -[NSString hash](self->_tokenToIgnore, "hash");
  v5 = self->_minimumConfidence - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3);
  return objc_msgSend(self->_confidenceMapper, "hash") - v5 + 32 * v5;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_confidenceMapper, 0);
  objc_storeStrong((id *)&self->_tokenToIgnore, 0);
  objc_storeStrong((id *)&self->_nameMappings, 0);
}

void __38__SGNameMappingTransformer_transform___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  int v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v3 = objc_msgSend(v15, "unsignedIntegerValue");
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "confidence");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40);
  v7 = v4;
  if (v6)
  {
    if (v5 >= 0)
      v8 = v5;
    else
      v8 = -v5;
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v4;
    if (objc_msgSend(v9, "length"))
    {
      appendFeatureSuffix(v4, v9);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  if (v5 < 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "objectForKeyedSubscript:", CFSTR("POSSESSIVE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "objectForKeyedSubscript:", CFSTR("POSSESSIVE"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      appendFeatureSuffix(v7, v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v12;
    }
  }
  if (v7 != v4)
  {
    v13 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v4, "stringWithNewContents:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v14, v3);

    objc_autoreleasePoolPop(v13);
  }

}

+ (id)instanceForNameDetector
{
  SGNameMappingTransformer *v2;
  void *v3;
  SGNameMappingTransformer *v4;
  _QWORD v6[5];
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  v2 = [SGNameMappingTransformer alloc];
  v6[0] = CFSTR("FULL");
  v6[1] = CFSTR("FIRST");
  v7[0] = CFSTR("SG_FEATURE_FULLNAME");
  v7[1] = CFSTR("SG_FEATURE_FIRSTNAME");
  v6[2] = CFSTR("LAST");
  v6[3] = CFSTR("UNDEFINED");
  v7[2] = CFSTR("SG_FEATURE_LASTNAME");
  v7[3] = CFSTR("SG_FEATURE_FULLNAME");
  v6[4] = CFSTR("POSSESSIVE");
  v7[4] = CFSTR("SG_POSSESSIVE");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SGNameMappingTransformer initWithNameMappings:minimumConfidence:confidenceMapper:tokenToIgnore:forNameDetector:](v2, "initWithNameMappings:minimumConfidence:confidenceMapper:tokenToIgnore:forNameDetector:", v3, 10, 0, 0, 1);

  return v4;
}

+ (id)withFullNameMapping:(id)a3 firstNameMapping:(id)a4 lastNameMapping:(id)a5 andPossessive:(id)a6
{
  return +[SGNameMappingTransformer withFullNameMapping:firstNameMapping:lastNameMapping:minimumConfidence:confidenceMapper:tokenToIgnore:andPossessive:](SGNameMappingTransformer, "withFullNameMapping:firstNameMapping:lastNameMapping:minimumConfidence:confidenceMapper:tokenToIgnore:andPossessive:", a3, a4, a5, 10, 0, 0, a6);
}

+ (id)withFullNameMapping:(id)a3 firstNameMapping:(id)a4 lastNameMapping:(id)a5 minimumConfidence:(int)a6 confidenceMapper:(id)a7 tokenToIgnore:(id)a8 andPossessive:(id)a9
{
  uint64_t v11;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  SGNameMappingTransformer *v21;
  void *v22;
  SGNameMappingTransformer *v23;
  _QWORD v25[5];
  _QWORD v26[6];

  v11 = *(_QWORD *)&a6;
  v26[5] = *MEMORY[0x1E0C80C00];
  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  v21 = [SGNameMappingTransformer alloc];
  v25[0] = CFSTR("FULL");
  v25[1] = CFSTR("FIRST");
  v26[0] = v20;
  v26[1] = v19;
  v25[2] = CFSTR("LAST");
  v25[3] = CFSTR("UNDEFINED");
  v26[2] = v18;
  v26[3] = v20;
  v25[4] = CFSTR("POSSESSIVE");
  v26[4] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = -[SGNameMappingTransformer initWithNameMappings:minimumConfidence:confidenceMapper:tokenToIgnore:forNameDetector:](v21, "initWithNameMappings:minimumConfidence:confidenceMapper:tokenToIgnore:forNameDetector:", v22, v11, v17, v16, 0);
  return v23;
}

@end
