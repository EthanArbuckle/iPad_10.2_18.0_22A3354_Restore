@implementation NLClassifierModelDataInstance

- (NLClassifierModelDataInstance)initWithString:(id)a3 label:(id)a4 tokenizer:(__CFStringTokenizer *)a5
{
  id v8;
  id v9;
  NLClassifierModelDataInstance *v10;
  uint64_t v11;
  NSString *string;
  uint64_t v13;
  NSString *label;
  uint64_t v15;
  NSArray *tokens;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NLClassifierModelDataInstance;
  v10 = -[NLClassifierModelDataInstance init](&v18, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    string = v10->_string;
    v10->_string = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    label = v10->_label;
    v10->_label = (NSString *)v13;

    inputSequenceFromSentence(v8, a5);
    v15 = objc_claimAutoreleasedReturnValue();
    tokens = v10->_tokens;
    v10->_tokens = (NSArray *)v15;

  }
  return v10;
}

- (NLClassifierModelDataInstance)initWithString:(id)a3 label:(id)a4
{
  return -[NLClassifierModelDataInstance initWithString:label:tokenizer:](self, "initWithString:label:tokenizer:", a3, a4, 0);
}

- (NLClassifierModelDataInstance)initWithLine:(id)a3 tokenizer:(__CFStringTokenizer *)a4
{
  void *v6;
  void *v7;
  void *v8;
  NLClassifierModelDataInstance *v9;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("\t"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") == 2)
  {
    objc_msgSend(v6, "objectAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[NLClassifierModelDataInstance initWithString:label:tokenizer:](self, "initWithString:label:tokenizer:", v7, v8, a4);

    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)string
{
  return self->_string;
}

- (id)tokens
{
  return self->_tokens;
}

- (id)label
{
  return self->_label;
}

- (id)labels
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *i;

  -[NLClassifierModelDataInstance tokens](self, "tokens");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLClassifierModelDataInstance label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  for (i = (void *)objc_claimAutoreleasedReturnValue(); v5; --v5)
    objc_msgSend(i, "addObject:", v4);

  return i;
}

- (id)formattedLineWithLabelMap:(id)a3 vocabularyMap:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = (void *)MEMORY[0x1E0CB37A0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  formattedOutputFromSentence(self->_string, 0, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", self->_label);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "appendString:", v10);
  objc_msgSend(v9, "appendString:", CFSTR("\t"));
  labelFromFormattedOutput(v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:", v12);

  return v9;
}

- (__CFDictionary)instanceDictionary
{
  __CFDictionary *Mutable;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  -[NLClassifierModelDataInstance string](self, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLClassifierModelDataInstance label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  generateTokenSequence(v4, 0, v6, v8, v9);
  v10 = objc_msgSend(v6, "count");
  if (v10)
  {
    v11 = v10;
    do
    {
      objc_msgSend(v7, "addObject:", v5);
      --v11;
    }
    while (v11);
  }
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0D173F0], v4);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0D173E8], v8);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0D173E0], v9);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0D173C8], v7);

  return Mutable;
}

+ (id)readInstancesFromString:(id)a3 tokenizer:(__CFStringTokenizer *)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  __CFStringTokenizer *v12;

  v5 = (void *)MEMORY[0x1E0C99DE8];
  v6 = a3;
  objc_msgSend(v5, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__NLClassifierModelDataInstance_readInstancesFromString_tokenizer___block_invoke;
  v10[3] = &unk_1E4A3B758;
  v12 = a4;
  v8 = v7;
  v11 = v8;
  objc_msgSend(v6, "enumerateLinesUsingBlock:", v10);

  return v8;
}

void __67__NLClassifierModelDataInstance_readInstancesFromString_tokenizer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NLClassifierModelDataInstance *v4;
  NLClassifierModelDataInstance *v5;

  v3 = a2;
  v5 = -[NLClassifierModelDataInstance initWithLine:tokenizer:]([NLClassifierModelDataInstance alloc], "initWithLine:tokenizer:", v3, *(_QWORD *)(a1 + 40));

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v4 = v5;
  }

}

- (id)locatorsWithIndex:(unint64_t)a3 parameters:(_NLConstraintParameters *)a4 tagger:(id)a5 tokenizer:(__CFStringTokenizer *)a6
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  NLDataInstanceLocator *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  unint64_t maxSplitTokens;
  unint64_t maxTokens;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NLDataInstanceLocator *v43;
  uint64_t v44;
  NLDataInstanceLocator *v45;
  NLDataInstanceLocator *v46;
  void *v47;
  void *v49;
  unint64_t v50;
  _NLConstraintParameters *v51;
  void *v52;
  void *v54;
  uint64_t v55;
  void *v56;
  unint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;

  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLClassifierModelDataInstance string](self, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");
  -[NLClassifierModelDataInstance tokens](self, "tokens");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14 >= a4->minSplitTokens)
  {
    objc_msgSend(v9, "setString:", v11);
    if (v12)
    {
      v49 = v9;
      v50 = v12;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v51 = a4;
      v52 = v11;
      while (v18 < a4->maxTokens)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0;
        v21 = v12;
        if (a4->splitSentences)
          v20 = objc_msgSend(v49, "sentenceRangeForRange:", v16, 0);
        v22 = v20;
        v55 = v21;
        objc_msgSend(v11, "substringWithRange:", v20, v21, v49);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v54 = v23;
        v24 = v59;
        generateTokenSequence(v23, a6, v56, v59, v19);
        v25 = objc_msgSend(v56, "count");
        maxSplitTokens = a4->maxSplitTokens;
        maxTokens = a4->maxTokens;
        if (v25 + v18 <= maxTokens)
          v28 = v25;
        else
          v28 = maxTokens - v18;
        v62 = v28;
        v60 = v22;
        v61 = v18;
        v58 = v19;
        if (v28 <= maxSplitTokens)
        {
          if (v28)
          {
            v46 = -[NLDataInstanceLocator initWithInstanceIndex:rangeOfCharacters:rangeOfTokens:]([NLDataInstanceLocator alloc], "initWithInstanceIndex:rangeOfCharacters:rangeOfTokens:", a3, v22, v55, v18, v28);
            objc_msgSend(v10, "addObject:", v46);

          }
        }
        else
        {
          v29 = 0;
          v30 = (v28 - 1) / maxSplitTokens + 1;
          v57 = (v28 - 1) / v30 + 1;
          do
          {
            if (v29 + v57 <= v62)
              v31 = v57;
            else
              v31 = v62 - v29;
            objc_msgSend(v24, "objectAtIndex:", v29);
            v32 = a3;
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "unsignedIntegerValue");

            objc_msgSend(v24, "objectAtIndex:", v31 + v29 - 1);
            v35 = v10;
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "unsignedIntegerValue");

            objc_msgSend(v58, "objectAtIndex:", v31 + v29 - 1);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v38, "unsignedIntegerValue");

            v40 = v34 + v60;
            v41 = v37 - v34;
            v24 = v59;
            v42 = v41 + v39;
            a3 = v32;
            v43 = [NLDataInstanceLocator alloc];
            v44 = v40;
            v10 = v35;
            v45 = -[NLDataInstanceLocator initWithInstanceIndex:rangeOfCharacters:rangeOfTokens:](v43, "initWithInstanceIndex:rangeOfCharacters:rangeOfTokens:", v32, v44, v42, v29 + v61, v31);
            objc_msgSend(v35, "addObject:", v45);

            v29 += v31;
            --v30;
          }
          while (v30);
        }
        v18 = v62 + v61;

        v16 = v60 + v55;
        v47 = v54;
        v17 = v54;
        v12 = v50;
        a4 = v51;
        v11 = v52;
        if (v60 + v55 >= v50)
          goto LABEL_23;
      }
      v47 = v17;
LABEL_23:

      v9 = v49;
    }
    objc_msgSend(v9, "setString:", 0, v49);
  }
  else
  {
    v15 = -[NLDataInstanceLocator initWithInstanceIndex:rangeOfCharacters:rangeOfTokens:]([NLDataInstanceLocator alloc], "initWithInstanceIndex:rangeOfCharacters:rangeOfTokens:", a3, 0, v12, 0, v14);
    objc_msgSend(v10, "addObject:", v15);

  }
  return v10;
}

- (id)subInstanceWithLocator:(id)a3 tokenizer:(__CFStringTokenizer *)a4
{
  id v6;
  NLClassifierModelDataInstance *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NLClassifierModelDataInstance *v14;

  v6 = a3;
  v7 = [NLClassifierModelDataInstance alloc];
  -[NLClassifierModelDataInstance string](self, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "rangeOfCharacters");
  v11 = v10;

  objc_msgSend(v8, "substringWithRange:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLClassifierModelDataInstance label](self, "label");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[NLClassifierModelDataInstance initWithString:label:tokenizer:](v7, "initWithString:label:tokenizer:", v12, v13, a4);

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
