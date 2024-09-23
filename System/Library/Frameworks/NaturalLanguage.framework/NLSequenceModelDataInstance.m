@implementation NLSequenceModelDataInstance

- (NLSequenceModelDataInstance)initWithTokens:(id)a3 labels:(id)a4
{
  id v6;
  id v7;
  NLSequenceModelDataInstance *v8;
  uint64_t v9;
  NSArray *tokens;
  uint64_t v11;
  NSArray *labels;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NLSequenceModelDataInstance;
  v8 = -[NLSequenceModelDataInstance init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    tokens = v8->_tokens;
    v8->_tokens = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    labels = v8->_labels;
    v8->_labels = (NSArray *)v11;

  }
  return v8;
}

- (NLSequenceModelDataInstance)initWithLine:(id)a3 tokenizer:(__CFStringTokenizer *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NLSequenceModelDataInstance *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, _BYTE *);
  void *v16;
  id v17;
  id v18;

  v5 = (void *)MEMORY[0x1E0C99DE8];
  v6 = a3;
  objc_msgSend(v5, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __54__NLSequenceModelDataInstance_initWithLine_tokenizer___block_invoke;
  v16 = &unk_1E4A3B708;
  v17 = v8;
  v18 = v7;
  v9 = v7;
  v10 = v8;
  objc_msgSend(v6, "enumerateLinesUsingBlock:", &v13);

  v11 = -[NLSequenceModelDataInstance initWithTokens:labels:](self, "initWithTokens:labels:", v9, v10, v13, v14, v15, v16);
  return v11;
}

void __54__NLSequenceModelDataInstance_initWithLine_tokenizer___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a2, "componentsSeparatedByString:", CFSTR("\t"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") == 2)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v9, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

    v7 = *(void **)(a1 + 40);
    objc_msgSend(v9, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
  else
  {
    *a3 = 1;
  }

}

- (id)string
{
  void *v2;
  void *v3;

  -[NLSequenceModelDataInstance tokens](self, "tokens");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR(" "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)tokens
{
  return self->_tokens;
}

- (id)label
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  id v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[NLSequenceModelDataInstance labels](self, "labels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v2;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "unsignedIntegerValue");

        v13 = v12 + 1;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12 + 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v14, v10);

        if (v13 > v6)
        {
          v15 = v10;

          v6 = v13;
          v7 = v15;
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)labels
{
  return self->_labels;
}

- (id)formattedLineWithLabelMap:(id)a3 vocabularyMap:(id)a4
{
  return 0;
}

- (__CFDictionary)instanceDictionary
{
  NSUInteger v3;
  NSUInteger v4;
  void *v5;
  NSUInteger v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __CFDictionary *theDict;
  void *v14;
  void *v15;
  void *value;

  theDict = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  v3 = -[NSArray count](self->_tokens, "count");
  v4 = -[NSArray count](self->_labels, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  value = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = 0;
    do
    {
      -[NSArray objectAtIndex:](self->_tokens, "objectAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 < v4)
      {
        -[NSArray objectAtIndex:](self->_labels, "objectAtIndex:", v6);
        v8 = objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = (void *)v8;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "length"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(value, "addObject:", v10);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "length"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v11);

          objc_msgSend(v14, "addObject:", v9);
        }
      }
      objc_msgSend(v5, "appendString:", v7);
      if (++v6 < v3)
        objc_msgSend(v5, "appendString:", CFSTR(" "));

    }
    while (v3 != v6);
  }
  CFDictionaryAddValue(theDict, (const void *)*MEMORY[0x1E0D173F0], v5);
  CFDictionaryAddValue(theDict, (const void *)*MEMORY[0x1E0D173E8], value);
  CFDictionaryAddValue(theDict, (const void *)*MEMORY[0x1E0D173E0], v15);
  CFDictionaryAddValue(theDict, (const void *)*MEMORY[0x1E0D173C8], v14);

  return theDict;
}

+ (id)readInstancesFromString:(id)a3 tokenizer:(__CFStringTokenizer *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  __CFStringTokenizer *v17;

  v5 = (void *)MEMORY[0x1E0C99DE8];
  v6 = a3;
  objc_msgSend(v5, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__NLSequenceModelDataInstance_readInstancesFromString_tokenizer___block_invoke;
  v14[3] = &unk_1E4A3B730;
  v15 = v8;
  v17 = a4;
  v9 = v7;
  v16 = v9;
  v10 = v8;
  objc_msgSend(v6, "enumerateLinesUsingBlock:", v14);

  v11 = v16;
  v12 = v9;

  return v12;
}

void __65__NLSequenceModelDataInstance_readInstancesFromString_tokenizer___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  NLSequenceModelDataInstance *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("\t"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "appendString:", v5);
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  }
  else
  {
    v4 = -[NLSequenceModelDataInstance initWithLine:tokenizer:]([NLSequenceModelDataInstance alloc], "initWithLine:tokenizer:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    if (v4)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
    objc_msgSend(*(id *)(a1 + 32), "deleteCharactersInRange:", 0, objc_msgSend(*(id *)(a1 + 32), "length"));

  }
}

- (id)locatorsWithIndex:(unint64_t)a3 parameters:(_NLConstraintParameters *)a4 tagger:(id)a5 tokenizer:(__CFStringTokenizer *)a6
{
  unint64_t v7;
  void *v9;
  _NLConstraintParameters *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _NLConstraintParameters *v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NLDataInstanceLocator *v28;
  void *v29;
  NLDataInstanceLocator *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  void *v35;
  _NLConstraintParameters *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NLDataInstanceLocator *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NLDataInstanceLocator *v59;
  unint64_t v61;
  void *v62;
  _NLConstraintParameters *v63;
  void *v64;
  unint64_t v65;
  unint64_t v66;
  void *v67;
  unint64_t v68;
  unint64_t maxSplitTokens;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3, a4, a5, a6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLSequenceModelDataInstance tokens](self, "tokens");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  if (v13)
  {
    v14 = v13;
    v63 = v10;
    v15 = 0;
    v16 = 0;
    do
    {
      objc_msgSend(v12, "objectAtIndex:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "length");

      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v16, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v19);

      v16 += v18 + 1;
      ++v15;
    }
    while (v14 != v15);
    v20 = v10;
    if (v14 >= v10->minSplitTokens)
    {
      v31 = 0;
      v32 = 0;
      v61 = v14;
      v62 = v12;
      v67 = v9;
      v68 = v7;
      do
      {
        if (v31 >= v20->maxTokens)
          break;
        v33 = v31;
        objc_msgSend(v12, "objectAtIndex:", v31);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v34;
        if (++v31 == v14
          || v31 == v20->maxTokens
          || v20->splitSentences && tokenIsSentenceTerminator(v34))
        {
          v64 = v35;
          v36 = v20;
          v37 = v31 - v32;
          maxSplitTokens = v36->maxSplitTokens;
          if (v31 - v32 <= maxSplitTokens)
          {
            objc_msgSend(v11, "objectAtIndex:", v32);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v49, "rangeValue");

            objc_msgSend(v11, "objectAtIndex:", v33);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = v9;
            v53 = v7;
            v54 = v31;
            v55 = objc_msgSend(v51, "rangeValue");
            v57 = v56;

            v58 = v57 - v50 + v55;
            v31 = v54;
            v7 = v53;
            v9 = v52;
            v59 = -[NLDataInstanceLocator initWithInstanceIndex:rangeOfCharacters:rangeOfTokens:]([NLDataInstanceLocator alloc], "initWithInstanceIndex:rangeOfCharacters:rangeOfTokens:", v7, v50, v58, v32, v37);
            objc_msgSend(v52, "addObject:", v59);

            v32 = v31;
          }
          else
          {
            v65 = v33 - v32;
            v66 = (v37 - 1) / ((v37 - 1) / maxSplitTokens + 1) + 1;
            v38 = -1;
            do
            {
              if (v32 + v66 <= v31)
                v39 = v66;
              else
                v39 = v31 - v32;
              objc_msgSend(v11, "objectAtIndex:", v32);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = objc_msgSend(v40, "rangeValue");

              objc_msgSend(v11, "objectAtIndex:", v39 + v32 - 1);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = v31;
              v44 = objc_msgSend(v42, "rangeValue");
              v46 = v45;

              v47 = v46 - v41 + v44;
              v31 = v43;
              v48 = -[NLDataInstanceLocator initWithInstanceIndex:rangeOfCharacters:rangeOfTokens:]([NLDataInstanceLocator alloc], "initWithInstanceIndex:rangeOfCharacters:rangeOfTokens:", v68, v41, v47, v32, v39);
              objc_msgSend(v67, "addObject:", v48);

              ++v38;
              v32 += v39;
            }
            while (v38 != v65 / maxSplitTokens);
            v32 = v43;
            v9 = v67;
            v7 = v68;
          }
          v14 = v61;
          v12 = v62;
          v20 = v63;
          v35 = v64;
        }

      }
      while (v31 != v14);
    }
    else
    {
      objc_msgSend(v11, "objectAtIndex:", 0);
      v21 = v14;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "rangeValue");

      objc_msgSend(v11, "objectAtIndex:", v21 - 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "rangeValue");
      v27 = v26;

      v28 = -[NLDataInstanceLocator initWithInstanceIndex:rangeOfCharacters:rangeOfTokens:]([NLDataInstanceLocator alloc], "initWithInstanceIndex:rangeOfCharacters:rangeOfTokens:", v7, v23, v27 - v23 + v25, 0, v21);
      v29 = v11;
      v30 = v28;
      objc_msgSend(v9, "addObject:", v28);

      v11 = v29;
    }
  }

  return v9;
}

- (id)subInstanceWithLocator:(id)a3 tokenizer:(__CFStringTokenizer *)a4
{
  id v5;
  NLSequenceModelDataInstance *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NLSequenceModelDataInstance *v16;

  v5 = a3;
  v6 = [NLSequenceModelDataInstance alloc];
  -[NLSequenceModelDataInstance tokens](self, "tokens");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "rangeOfTokens");
  objc_msgSend(v7, "subarrayWithRange:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLSequenceModelDataInstance labels](self, "labels");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v5, "rangeOfTokens");
  v14 = v13;

  objc_msgSend(v11, "subarrayWithRange:", v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[NLSequenceModelDataInstance initWithTokens:labels:](v6, "initWithTokens:labels:", v10, v15);

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
}

@end
