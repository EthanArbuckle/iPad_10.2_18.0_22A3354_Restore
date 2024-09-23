@implementation CSAttributeEvaluator

+ (void)enumerateTokensForString:(id)a3 locale:(id)a4 options:(unint64_t)a5 withHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a6;
  if (enumerateTokensForString_locale_options_withHandler__onceToken != -1)
    dispatch_once(&enumerateTokensForString_locale_options_withHandler__onceToken, &__block_literal_global_16);
  v10 = (id)enumerateTokensForString_locale_options_withHandler__sContext;
  objc_sync_enter(v10);
  objc_msgSend((id)enumerateTokensForString_locale_options_withHandler__sContext, "setHandler:", v9);
  MDTokenizerGetTokenRanges();
  objc_sync_exit(v10);

}

void __76__CSAttributeEvaluator_enumerateTokensForString_locale_options_withHandler___block_invoke()
{
  uint64_t v0;
  void *v1;

  enumerateTokensForString_locale_options_withHandler__sTokenizer = MDTokenizerCreate();
  v0 = objc_opt_new();
  v1 = (void *)enumerateTokensForString_locale_options_withHandler__sContext;
  enumerateTokensForString_locale_options_withHandler__sContext = v0;

}

- (CSAttributeEvaluator)initWithQuery:(id)a3 language:(id)a4 isCJK:(BOOL)a5 fuzzyThreshold:(unsigned __int8)a6 options:(unint64_t)a7
{
  self->_isCJK = a5;
  return -[CSAttributeEvaluator initWithQuery:language:fuzzyThreshold:options:](self, "initWithQuery:language:fuzzyThreshold:options:", a3, a4, a6, a7);
}

- (CSAttributeEvaluator)initWithQuery:(id)a3 language:(id)a4 fuzzyThreshold:(unsigned __int8)a5 options:(unint64_t)a6
{
  int v7;
  id v11;
  id v12;
  CSAttributeEvaluator *v13;
  CSAttributeEvaluator *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSArray *tokenizedQueryTerms;
  int v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  NSArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  void *v41;
  int v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  objc_super v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v7 = a5;
  v54 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  if (v11)
  {
    v51.receiver = self;
    v51.super_class = (Class)CSAttributeEvaluator;
    v13 = -[CSAttributeEvaluator init](&v51, sel_init);
    v14 = v13;
    if (v13)
    {
      v13->_options = a6;
      objc_storeStrong((id *)&v13->_language, a4);
      objc_storeStrong((id *)&v14->_queryString, a3);
      if (-[NSString length](v14->_queryString, "length"))
      {
        v14->_tokenizer = (void *)MDTokenizerCreate();
        v15 = (void *)objc_opt_new();
        MDTokenizerGetTokens();
        v16 = objc_msgSend(v15, "count");
        v14->_queryTermCount = v16;
        if (v16)
        {
          v17 = objc_msgSend(v15, "copy");
          tokenizedQueryTerms = v14->_tokenizedQueryTerms;
          v14->_tokenizedQueryTerms = (NSArray *)v17;

          if ((v7 - 100) >= 0xFFFFFF9D)
            v19 = v7;
          else
            v19 = 0;
          v20 = -[NSArray count](v14->_tokenizedQueryTerms, "count");
          v21 = 4;
          if (!v19)
            v21 = 2;
          v39 = v21;
          v40 = v20;
          v22 = 1;
          if (v19)
            v22 = 2;
          v38 = v20 << v22;
          v14->_matchers = (const void **)malloc_type_calloc(v20 << v22, 8uLL, 0xC0040B8AA526DuLL);
          objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
          v42 = v7;
          v41 = v15;
          if (v19)
          {
            v37 = v12;
            v49 = 0u;
            v50 = 0u;
            v47 = 0u;
            v48 = 0u;
            v23 = v14->_tokenizedQueryTerms;
            v24 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
            if (v24)
            {
              v25 = v24;
              v26 = 0;
              v27 = *(_QWORD *)v48;
              do
              {
                v28 = 0;
                v29 = v26;
                do
                {
                  if (*(_QWORD *)v48 != v27)
                    objc_enumerationMutation(v23);
                  objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v28)), "UTF8String");
                  v14->_matchers[v29] = (const void *)MDMatcherCreate();
                  v26 = v29 + 2;
                  v14->_matchers[v29 + 1] = (const void *)MDMatcherCreate();
                  ++v28;
                  v29 += 2;
                }
                while (v25 != v28);
                v25 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
              }
              while (v25);
            }
            else
            {
              v26 = 0;
            }

            v12 = v37;
          }
          else
          {
            v26 = 0;
          }
          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          v30 = v14->_tokenizedQueryTerms;
          v31 = -[NSArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
          if (v31)
          {
            v32 = v31;
            v33 = *(_QWORD *)v44;
            do
            {
              v34 = 0;
              v35 = v26;
              do
              {
                if (*(_QWORD *)v44 != v33)
                  objc_enumerationMutation(v30);
                objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v34)), "UTF8String");
                v14->_matchers[v35] = (const void *)MDMatcherCreate();
                v26 = v35 + 2;
                v14->_matchers[v35 + 1] = (const void *)MDMatcherCreate();
                ++v34;
                v35 += 2;
              }
              while (v32 != v34);
              v32 = -[NSArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
            }
            while (v32);
          }

          v14->_matcherCount = v38;
          v15 = v41;
          v14->_queryTermCount = v40;
          v14->_matchersPerTerm = v39;
          v7 = v42;
        }
        v14->_fuzzyMatching = v7 != 0;
        v14->_matchOncePerTerm = 1;
        v14->_countQPUSpecialToken = 0;

      }
      if (!v14->_tokenizedQueryTerms)
      {
        v14->_tokenizedQueryTerms = (NSArray *)MEMORY[0x1E0C9AA60];

      }
    }
  }
  else
  {

    v14 = 0;
  }

  return v14;
}

- (void)dealloc
{
  const void **matchers;
  unint64_t matcherCount;
  unint64_t i;
  objc_super v6;

  if (self->_tokenizer)
    MDTokenizerDispose();
  matchers = self->_matchers;
  if (matchers)
  {
    matcherCount = self->_matcherCount;
    if (matcherCount)
    {
      for (i = 0; i < matcherCount; ++i)
      {
        if (self->_matchers[i])
        {
          MDMatcherDispose();
          matcherCount = self->_matcherCount;
        }
      }
      matchers = self->_matchers;
    }
  }
  free(matchers);
  v6.receiver = self;
  v6.super_class = (Class)CSAttributeEvaluator;
  -[CSAttributeEvaluator dealloc](&v6, sel_dealloc);
}

- (void)processTranscriptionTokens:(CSAttributeEvaluatorContext *)a3
{
  unint64_t v3;
  int64_t var9;
  BOOL *p_var12;
  unint64_t matcherCount;

  if (self->_fuzzyMatching)
    v3 = 2 * self->_queryTermCount;
  else
    v3 = 0;
  matcherCount = self->_matcherCount;
  if (v3 < matcherCount)
  {
    var9 = a3->var9;
    p_var12 = &a3->var12;
    do
    {
      if (*p_var12)
        break;
      if (var9 >= 1)
        MDMatchUTF8();
      ++v3;
    }
    while (v3 != matcherCount);
  }
}

- (BOOL)processPropertyToken:(const unsigned __int16 *)a3 length:(int64_t)a4 tokenType:(int)a5 range:(id)a6 index:(int64_t)a7 evaluationHandler:(id)a8
{
  id v12;
  unint64_t queryTermCount;
  unint64_t matchersPerTerm;
  unint64_t options;
  unint64_t matcherCount;
  id v17;
  int v18;
  unint64_t v19;
  CSAttributeEvaluator *v20;
  const unsigned __int16 *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  NSObject *v28;
  int v29;
  BOOL v30;
  int v32;
  int v33;
  void *v34;
  _BOOL8 v35;
  unint64_t v36;
  unint64_t v37;
  _BOOL4 matchOncePerTerm;
  _BOOL4 fuzzyMatching;
  int64_t var1;
  int64_t var0;
  unsigned __int8 v43;
  _BYTE buf[12];
  __int16 v45;
  unint64_t v46;
  __int16 v47;
  unint64_t v48;
  __int16 v49;
  unint64_t v50;
  __int16 v51;
  int64_t v52;
  __int16 v53;
  int v54;
  __int16 v55;
  int64_t v56;
  __int16 v57;
  int64_t v58;
  __int16 v59;
  int64_t v60;
  uint64_t v61;

  var1 = a6.var1;
  var0 = a6.var0;
  v61 = *MEMORY[0x1E0C80C00];
  v12 = a8;
  queryTermCount = self->_queryTermCount;
  matchersPerTerm = self->_matchersPerTerm;
  options = self->_options;
  matcherCount = self->_matcherCount;
  matchOncePerTerm = self->_matchOncePerTerm;
  fuzzyMatching = self->_fuzzyMatching;
  v43 = 0;
  v34 = v12;
  if (!matcherCount)
  {
    v29 = 0;
    goto LABEL_25;
  }
  v17 = v12;
  v18 = a5;
  v19 = 0;
  v36 = matchersPerTerm * queryTermCount + 2;
  v37 = queryTermCount;
  v33 = v18;
  v35 = v18 != 0;
  do
  {
    if (options == 1)
    {
      *(_QWORD *)buf = 0;
      if ((MDMatchWithFuzzyIndiciesRange() & 1) == 0)
        goto LABEL_22;
    }
    else if (!MDMatchWithFuzzyIndicies())
    {
      goto LABEL_22;
    }
    v20 = self;
    v21 = a3;
    v22 = 5;
    if ((v19 & 1) == 0)
      v22 = 7;
    v23 = 3;
    if ((v19 & 1) == 0)
      v23 = 1;
    if (v19 >= v36 || !fuzzyMatching)
      v25 = v23;
    else
      v25 = v22;
    v26 = matchersPerTerm;
    v27 = v19 / matchersPerTerm;
    if (v27 >= v37)
    {
      logForCSLogCategoryDefault();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134220032;
        *(_QWORD *)&buf[4] = v19;
        v45 = 2048;
        v46 = v26;
        v47 = 2048;
        v48 = v37;
        v49 = 2048;
        v50 = matcherCount;
        v51 = 2048;
        v52 = a4;
        v53 = 1024;
        v54 = v33;
        v55 = 2048;
        v56 = var0;
        v57 = 2048;
        v58 = var1;
        v59 = 2048;
        v60 = a7;
        _os_log_fault_impl(&dword_18C42F000, v28, OS_LOG_TYPE_FAULT, "i/matchersPerTerm >= queryTermCount, i = %lu, matchersPerTerm = %lu, queryTermCount = %lu, matcherCount = %lu, len = %ld, tokenType = %u, rangeInSource.location = %lu, rangeInSource.length = %lu, tokenIndex = %ld", buf, 0x58u);
      }

      v17 = v34;
    }
    LOBYTE(v32) = 0;
    (*((void (**)(id, uint64_t, int64_t, int64_t, _BOOL8, unint64_t, int64_t, _QWORD, _QWORD, _QWORD, int, unsigned __int8 *))v17
     + 2))(v17, v25, var0, var1, v35, v27, a7, 0, 0, 0, v32, &v43);
    v29 = v43;
    a3 = v21;
    matchersPerTerm = v26;
    self = v20;
    if (v43 | matchOncePerTerm)
      goto LABEL_25;
LABEL_22:
    ++v19;
  }
  while (matcherCount != v19);
  v29 = v43;
LABEL_25:
  v30 = v29 != 0;

  return v30;
}

- (NSArray)queryTerms
{
  return self->_tokenizedQueryTerms;
}

- (unint64_t)evaluateAttribute:(id)a3 ignoreSubtokens:(BOOL)a4 withHandler:(id)a5
{
  return -[CSAttributeEvaluator evaluateAttribute:ignoreSubtokens:strongCompounds:withHandler:](self, "evaluateAttribute:ignoreSubtokens:strongCompounds:withHandler:", a3, a4, 0, a5);
}

- (unint64_t)evaluateAttribute:(id)a3 ignoreSubtokens:(BOOL)a4 skipTranscriptions:(BOOL)a5 withHandler:(id)a6
{
  return -[CSAttributeEvaluator evaluateAttribute:ignoreSubtokens:strongCompounds:skipTranscriptions:withHandler:](self, "evaluateAttribute:ignoreSubtokens:strongCompounds:skipTranscriptions:withHandler:", a3, a4, 0, a5, a6);
}

- (unint64_t)evaluateAttribute:(id)a3 ignoreSubtokens:(BOOL)a4 skipTranscriptions:(BOOL)a5 withFuzzyHandler:(id)a6
{
  return -[CSAttributeEvaluator evaluateAttribute:ignoreSubtokens:strongCompounds:skipTranscriptions:withFuzzyHandler:](self, "evaluateAttribute:ignoreSubtokens:strongCompounds:skipTranscriptions:withFuzzyHandler:", a3, a4, 0, a5, a6);
}

- (unint64_t)evaluateAttribute:(id)a3 ignoreSubtokens:(BOOL)a4 strongCompounds:(BOOL)a5 withHandler:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  unint64_t v14;
  _QWORD aBlock[4];
  id v17;

  v6 = a5;
  v7 = a4;
  v10 = a6;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__CSAttributeEvaluator_evaluateAttribute_ignoreSubtokens_strongCompounds_withHandler___block_invoke;
  aBlock[3] = &unk_1E24029E8;
  v17 = v10;
  v11 = v10;
  v12 = a3;
  v13 = _Block_copy(aBlock);
  v14 = -[CSAttributeEvaluator evaluateAttribute:ignoreSubtokens:strongCompounds:skipTranscriptions:withFuzzyHandler:](self, "evaluateAttribute:ignoreSubtokens:strongCompounds:skipTranscriptions:withFuzzyHandler:", v12, v7, v6, 0, v13);

  return v14;
}

uint64_t __86__CSAttributeEvaluator_evaluateAttribute_ignoreSubtokens_strongCompounds_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (unint64_t)evaluateAttribute:(id)a3 ignoreSubtokens:(BOOL)a4 strongCompounds:(BOOL)a5 skipTranscriptions:(BOOL)a6 withHandler:(id)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  unint64_t v16;
  _QWORD aBlock[4];
  id v19;

  v7 = a6;
  v8 = a5;
  v9 = a4;
  v12 = a7;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __105__CSAttributeEvaluator_evaluateAttribute_ignoreSubtokens_strongCompounds_skipTranscriptions_withHandler___block_invoke;
  aBlock[3] = &unk_1E24029E8;
  v19 = v12;
  v13 = v12;
  v14 = a3;
  v15 = _Block_copy(aBlock);
  v16 = -[CSAttributeEvaluator evaluateAttribute:ignoreSubtokens:strongCompounds:skipTranscriptions:withFuzzyHandler:](self, "evaluateAttribute:ignoreSubtokens:strongCompounds:skipTranscriptions:withFuzzyHandler:", v14, v9, v8, v7, v15);

  return v16;
}

uint64_t __105__CSAttributeEvaluator_evaluateAttribute_ignoreSubtokens_strongCompounds_skipTranscriptions_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (unint64_t)evaluateAttribute:(id)a3 ignoreSubtokens:(BOOL)a4 strongCompounds:(BOOL)a5 skipTranscriptions:(BOOL)a6 withFuzzyHandler:(id)a7
{
  _BOOL4 v9;
  int v10;
  id v12;
  id v13;
  CSAttributeEvaluator *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  CSAttributeEvaluator *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;

  v9 = a5;
  v10 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a7;
  if (self->_tokenizer)
  {
    v36 = 0;
    v34 = 0u;
    v35 = 0u;
    if (v9)
      v10 |= 2u;
    v32 = 0uLL;
    v33 = 0uLL;
    v31 = 0uLL;
    v14 = self;
    v29 = v14;
    v30 = _Block_copy(v13);
    LOBYTE(v36) = 0;
    if (a6)
    {
      MDTokenizerGetTokenRangesWithTranscriptionOptional();
    }
    else
    {
      v28 = v10;
      v16 = objc_msgSend(v12, "length");
      v25 = (uint64_t)&v25;
      if (v16 >= 256)
        v17 = 256;
      else
        v17 = v16;
      if (v16 >= 1024)
        v18 = 1024;
      else
        v18 = v16;
      v19 = 5 * v18;
      if (v16 <= 1024)
        v20 = 1024;
      else
        v20 = v16;
      v21 = 126;
      if (v19 > 126)
        v21 = v19;
      v26 = v21 + 1;
      v27 = v20;
      v22 = (char *)&v25 - ((v21 + 17) & 0xFFFFFFFFFFFFFFF0);
      bzero(v22, v21 + 2);
      v23 = (char *)&v25 - ((8 * v17 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v23, 8 * v17);
      bzero(v23, 8 * v17);
      bzero((char *)&v25 - ((4 * v17 + 15) & 0xFFFFFFFFFFFFFFF0), 4 * v17);
      *(_QWORD *)&v31 = v22;
      *((_QWORD *)&v31 + 1) = v23;
      *(_QWORD *)&v32 = v23;
      *((_QWORD *)&v32 + 1) = (char *)&v25 - ((4 * v17 + 15) & 0xFFFFFFFFFFFFFFF0);
      *(_QWORD *)&v33 = v26;
      *(_QWORD *)&v34 = v17;
      *(_QWORD *)&v35 = v27;
      MDTokenizerGetTokenRangesWithTranscriptionOptional();
      if (*((_QWORD *)&v34 + 1))
        -[CSAttributeEvaluator processTranscriptionTokens:](v14, "processTranscriptionTokens:", &v29, v25);
      if (*((char **)&v31 + 1) != v23)
        free(*((void **)&v31 + 1));
      if ((char *)v32 != v23)
        free((void *)v32);
      if (*((uint64_t **)&v32 + 1) != (uint64_t *)((char *)&v25 - ((4 * v17 + 15) & 0xFFFFFFFFFFFFFFF0)))
        free(*((void **)&v32 + 1));
    }
    v15 = *((_QWORD *)&v35 + 1);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (NSString)queryString
{
  return self->_queryString;
}

- (int64_t)queryID
{
  return self->_queryID;
}

- (void)setQueryID:(int64_t)a3
{
  self->_queryID = a3;
}

- (BOOL)matchOncePerTerm
{
  return self->_matchOncePerTerm;
}

- (void)setMatchOncePerTerm:(BOOL)a3
{
  self->_matchOncePerTerm = a3;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_language, a3);
}

- (BOOL)isCJK
{
  return self->_isCJK;
}

- (void)setIsCJK:(BOOL)a3
{
  self->_isCJK = a3;
}

- (int64_t)countQPUSpecialToken
{
  return self->_countQPUSpecialToken;
}

- (void)setCountQPUSpecialToken:(int64_t)a3
{
  self->_countQPUSpecialToken = a3;
}

- (NSArray)itemQPQUOutputTokenInfo
{
  return self->_itemQPQUOutputTokenInfo;
}

- (void)setItemQPQUOutputTokenInfo:(id)a3
{
  objc_storeStrong((id *)&self->_itemQPQUOutputTokenInfo, a3);
}

- (unint64_t)queryTokenCount
{
  return self->_queryTokenCount;
}

- (void)setQueryTokenCount:(unint64_t)a3
{
  self->_queryTokenCount = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (BOOL)fuzzyMatching
{
  return self->_fuzzyMatching;
}

- (void)setFuzzyMatching:(BOOL)a3
{
  self->_fuzzyMatching = a3;
}

- (unint64_t)matcherCount
{
  return self->_matcherCount;
}

- (void)setMatcherCount:(unint64_t)a3
{
  self->_matcherCount = a3;
}

- (const)matchers
{
  return self->_matchers;
}

- (void)setMatchers:(const void *)a3
{
  self->_matchers = a3;
}

- (unint64_t)queryTermCount
{
  return self->_queryTermCount;
}

- (void)setQueryTermCount:(unint64_t)a3
{
  self->_queryTermCount = a3;
}

- (unint64_t)matchersPerTerm
{
  return self->_matchersPerTerm;
}

- (void)setMatchersPerTerm:(unint64_t)a3
{
  self->_matchersPerTerm = a3;
}

- (void)tokenizer
{
  return self->_tokenizer;
}

- (void)setTokenizer:(void *)a3
{
  self->_tokenizer = a3;
}

- (NSArray)tokenizedQueryTerms
{
  return self->_tokenizedQueryTerms;
}

- (void)setTokenizedQueryTerms:(id)a3
{
  objc_storeStrong((id *)&self->_tokenizedQueryTerms, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenizedQueryTerms, 0);
  objc_storeStrong((id *)&self->_itemQPQUOutputTokenInfo, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
}

@end
