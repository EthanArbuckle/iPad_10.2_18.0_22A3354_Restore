@implementation SGTokenizerMappingTransformer

- (id)initForLocale:(id)a3 tagNames:(BOOL)a4 trustCoreNLP:(BOOL)a5 personalNameMapping:(id)a6 punctuationMapping:(id)a7
{
  id v13;
  id v14;
  id v15;
  SGTokenizerMappingTransformer *v16;
  SGTokenizerMappingTransformer *v17;
  uint64_t v18;
  void *v19;
  uint64_t *v20;
  void *v21;
  NSObject *v22;
  id v23;
  _QWORD block[4];
  SGTokenizerMappingTransformer *v26;
  id v27;
  objc_super v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a6;
  v15 = a7;
  v28.receiver = self;
  v28.super_class = (Class)SGTokenizerMappingTransformer;
  v16 = -[SGTokenizerMappingTransformer init](&v28, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_nameTagging = a4;
    objc_storeStrong((id *)&v16->_punctuationMapping, a7);
    objc_storeStrong((id *)&v17->_personalNameMapping, a6);
    objc_storeStrong((id *)&v17->_locale, a3);
    v17->_trustCoreNLP = a5;
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3730], "availableTagSchemesForLanguage:", v13);
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v17->_nameTagging)
      {
        v30[0] = *MEMORY[0x1E0CB2D10];
        v19 = (void *)MEMORY[0x1E0C99D20];
        v20 = v30;
      }
      else
      {
        v29 = *MEMORY[0x1E0CB2D28];
        v19 = (void *)MEMORY[0x1E0C99D20];
        v20 = &v29;
      }
      objc_msgSend(v19, "arrayWithObjects:count:", v20, 1);
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v21 = (void *)v18;
    getTokenizerDispatchQueue();
    v22 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __108__SGTokenizerMappingTransformer_initForLocale_tagNames_trustCoreNLP_personalNameMapping_punctuationMapping___block_invoke;
    block[3] = &unk_1E7DB6A30;
    v26 = v17;
    v27 = v21;
    v23 = v21;
    dispatch_sync(v22, block);

  }
  return v17;
}

- (void)_createOrReuseNLPTagger
{
  NSObject *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;

  getTokenizerDispatchQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = self->_nameTagging && self->_trustCoreNLP;
  +[SGTokenizerMappingTransformer _purgeableNLTaggerWithNameTagging:](SGTokenizerMappingTransformer, "_purgeableNLTaggerWithNameTagging:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)transformWithCoreNLP:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  getTokenizerDispatchQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__SGTokenizerMappingTransformer_transformWithCoreNLP_block___block_invoke;
  block[3] = &unk_1E7DB6F48;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

- (void)transformWithNLLinguisticTagger:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  getTokenizerDispatchQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__SGTokenizerMappingTransformer_transformWithNLLinguisticTagger_block___block_invoke;
  block[3] = &unk_1E7DB6F48;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

- (id)transform:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  SGTokenizerMappingTransformer *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD v21[6];
  _QWORD v22[4];
  _QWORD v23[5];
  id v24;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGTokenizerMappingTransformer.m"), 281, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[input isKindOfClass:[NSString class]]"));

  }
  v6 = v5;
  v7 = (void *)objc_opt_new();
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__28009;
  v23[4] = __Block_byref_object_dispose__28010;
  v24 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3010000000;
  v21[4] = 0;
  v21[5] = 0;
  v21[3] = "";
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __43__SGTokenizerMappingTransformer_transform___block_invoke;
  v14[3] = &unk_1E7DB22D0;
  v8 = v6;
  v15 = v8;
  v9 = v7;
  v18 = v23;
  v19 = v22;
  v20 = v21;
  v16 = v9;
  v17 = self;
  v10 = (void *)MEMORY[0x1C3BD5158](v14);
  -[SGTokenizerMappingTransformer transformWithCoreNLP:block:](self, "transformWithCoreNLP:block:", v8, v10);
  if (objc_msgSend(v8, "length") && !objc_msgSend(v9, "count"))
    -[SGTokenizerMappingTransformer transformWithNLLinguisticTagger:block:](self, "transformWithNLLinguisticTagger:block:", v8, v10);
  v11 = v9;

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v23, 8);

  return v11;
}

- (id)toPlistWithChunks:(id)a3
{
  void *v4;
  void *v5;
  NSString *locale;
  void *v7;
  void *v8;
  NSString *punctuationMapping;
  NSString *personalNameMapping;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("NAME_TAGGING");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_nameTagging);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("TRUST_CORENLP");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_trustCoreNLP);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = CFSTR("LOCALE");
  locale = self->_locale;
  v13[1] = v5;
  v13[2] = locale;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  punctuationMapping = self->_punctuationMapping;
  if (punctuationMapping)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", punctuationMapping, CFSTR("PUNCTUATION_MAPPING"));
  personalNameMapping = self->_personalNameMapping;
  if (personalNameMapping)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", personalNameMapping, CFSTR("PERSONAL_NAME_MAPPING"));
  return v8;
}

- (SGTokenizerMappingTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  SGTokenizerMappingTransformer *v14;

  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LOCALE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NAME_TAGGING"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TRUST_CORENLP"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PERSONAL_NAME_MAPPING"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PUNCTUATION_MAPPING"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[SGTokenizerMappingTransformer initForLocale:tagNames:trustCoreNLP:personalNameMapping:punctuationMapping:](self, "initForLocale:tagNames:trustCoreNLP:personalNameMapping:punctuationMapping:", v7, v9, v11, v12, v13);
  return v14;
}

- (BOOL)isEqualToTokenizerMappingTransformer:(id)a3
{
  id *v4;
  id *v5;
  NSString *locale;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  NSString *personalNameMapping;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  char v15;
  char v16;
  NSString *v18;
  NSString *v19;

  v4 = (id *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_10;
  locale = self->_locale;
  v7 = (NSString *)v4[5];
  if (locale == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = locale;
    v10 = -[NSString isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
      goto LABEL_10;
  }
  if (self->_nameTagging != *((unsigned __int8 *)v5 + 16) || self->_trustCoreNLP != *((unsigned __int8 *)v5 + 17))
    goto LABEL_10;
  personalNameMapping = self->_personalNameMapping;
  v12 = (NSString *)v5[4];
  if (personalNameMapping == v12)
  {

  }
  else
  {
    v13 = v12;
    v14 = personalNameMapping;
    v15 = -[NSString isEqual:](v14, "isEqual:", v13);

    if ((v15 & 1) == 0)
    {
LABEL_10:
      v16 = 0;
      goto LABEL_11;
    }
  }
  v18 = self->_punctuationMapping;
  v19 = v18;
  if (v18 == v5[3])
    v16 = 1;
  else
    v16 = -[NSString isEqual:](v18, "isEqual:");

LABEL_11:
  return v16;
}

- (BOOL)isEqual:(id)a3
{
  SGTokenizerMappingTransformer *v4;
  SGTokenizerMappingTransformer *v5;
  BOOL v6;

  v4 = (SGTokenizerMappingTransformer *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGTokenizerMappingTransformer isEqualToTokenizerMappingTransformer:](self, "isEqualToTokenizerMappingTransformer:", v5);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_locale, "hash");
  v4 = self->_nameTagging - v3 + 32 * v3;
  v5 = self->_trustCoreNLP - v4 + 32 * v4;
  v6 = -[NSString hash](self->_personalNameMapping, "hash") - v5 + 32 * v5;
  return -[NSString hash](self->_punctuationMapping, "hash") - v6 + 32 * v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_personalNameMapping, 0);
  objc_storeStrong((id *)&self->_punctuationMapping, 0);
  objc_storeStrong((id *)&self->_tagger, 0);
}

void __43__SGTokenizerMappingTransformer_transform___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v31 = a2;
  v7 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v7);
  if (objc_msgSend(v8, "hasPrefix:", CFSTR("SG_")))
  {
    v9 = *(void **)(a1 + 40);
    +[SGTokenString stringWithString:range:](SGTokenString, "stringWithString:range:", v8, a3, a4);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_26:
    v16 = (id)v10;
    objc_msgSend(v9, "addObject:", v10);
LABEL_27:

    goto LABEL_28;
  }
  v11 = objc_msgSend(v8, "isEqualToString:", CFSTR("SG"));
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  if (v11)
  {
    *(_QWORD *)(v12 + 40) = &unk_1E7E116F8;

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "count");
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    *(_QWORD *)(v14 + 32) = a3;
    *(_QWORD *)(v14 + 40) = a4;
  }
  else if (v13)
  {
    objc_msgSend(v13, "objectForKey:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = v15;
        while ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64)
                                                                                                  + 8)
                                                                                      + 24))
          objc_msgSend(*(id *)(a1 + 40), "removeLastObject");
        v25 = *(void **)(a1 + 40);
        +[SGTokenString stringWithString:range:](SGTokenString, "stringWithString:range:", v16, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32), objc_msgSend(v16, "length"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v26);

        v27 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v28 = *(void **)(v27 + 40);
        *(_QWORD *)(v27 + 40) = 0;

        goto LABEL_27;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SGTokenizerMappingTransformer transform:]_block_invoke");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, CFSTR("SGTokenizerMappingTransformer.m"), 318, CFSTR("Must be a dictionary"));

      }
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v20 = v15;
      v18 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v20;
    }
    else
    {
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v18 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = 0;
    }

  }
  if ((objc_msgSend(v31, "isEqualToString:", *MEMORY[0x1E0D17280]) & 1) == 0
    && (objc_msgSend(v31, "isEqualToString:", *MEMORY[0x1E0D170D0]) & 1) == 0
    && (id)*MEMORY[0x1E0CB2CF0] != v31
    && (id)*MEMORY[0x1E0CB2D30] != v31)
  {
    if ((objc_msgSend(v31, "isEqualToString:", *MEMORY[0x1E0D17158]) & 1) != 0 || (id)*MEMORY[0x1E0CB2CE8] == v31)
    {
      v23 = *(void **)(*(_QWORD *)(a1 + 48) + 32);
      if (v23)
      {
        v24 = v23;

        v21 = 6;
        v8 = v24;
      }
      else
      {
        v21 = 6;
        if (!v8)
          goto LABEL_28;
      }
    }
    else
    {
      v21 = 0;
      if (!v8)
        goto LABEL_28;
    }
    goto LABEL_25;
  }
  v22 = *(id *)(*(_QWORD *)(a1 + 48) + 24);

  v21 = 0;
  v8 = v22;
  if (v22)
  {
LABEL_25:
    v9 = *(void **)(a1 + 40);
    +[SGTokenString stringWithString:range:confidence:](SGTokenString, "stringWithString:range:confidence:", v8, a3, a4, v21);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
LABEL_28:

}

void __71__SGTokenizerMappingTransformer_transformWithNLLinguisticTagger_block___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1[4] + 8), "result");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setString:", a1[5]);
  if (*(_BYTE *)(a1[4] + 16))
  {
    objc_msgSend(v8, "tagSchemes");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)*MEMORY[0x1E0CB2D10];
    v4 = objc_msgSend(v2, "containsObject:", *MEMORY[0x1E0CB2D10]);
    v5 = (void *)*MEMORY[0x1E0CB2D28];
    if (v4)
      v5 = v3;
    v6 = v5;

  }
  else
  {
    v6 = (id)*MEMORY[0x1E0CB2D28];
  }
  objc_msgSend(v8, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enumerateTagsInRange:scheme:options:usingBlock:", 0, objc_msgSend(v7, "length"), v6, 4, a1[6]);

  objc_msgSend(v8, "setString:", CFSTR("⌘"));
}

void __60__SGTokenizerMappingTransformer_transformWithCoreNLP_block___block_invoke(id *a1)
{
  const void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;

  v2 = (const void *)objc_msgSend(a1[4], "_createOrReuseNLPTagger");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", *((_QWORD *)a1[4] + 5));
  objc_msgSend(a1[5], "length");
  NLTaggerSetLocaleForRange();

  objc_msgSend(a1[5], "length");
  v4 = a1[6];
  NLTaggerSetString();
  v6 = v4;
  v5 = v4;
  NLTaggerEnumerateTokens();
  NLTaggerSetString();

  CFRelease(v2);
}

void __108__SGTokenizerMappingTransformer_initForLocale_tagNames_trustCoreNLP_personalNameMapping_punctuationMapping___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[SGTokenizerMappingTransformer _purgeableNSLinguisticTaggerWithTagSchemes:](SGTokenizerMappingTransformer, "_purgeableNSLinguisticTaggerWithTagSchemes:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

}

+ (id)forLocale:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[SGTokenizerMappingTransformer initForLocale:tagNames:trustCoreNLP:personalNameMapping:punctuationMapping:]([SGTokenizerMappingTransformer alloc], "initForLocale:tagNames:trustCoreNLP:personalNameMapping:punctuationMapping:", v3, 0, 0, 0, 0);

  return v4;
}

+ (id)forLocale:(id)a3 withPersonalNameMapping:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[SGTokenizerMappingTransformer initForLocale:tagNames:trustCoreNLP:personalNameMapping:punctuationMapping:]([SGTokenizerMappingTransformer alloc], "initForLocale:tagNames:trustCoreNLP:personalNameMapping:punctuationMapping:", v6, v5 != 0, 0, v5, 0);

  return v7;
}

+ (id)forLocale:(id)a3 tagNames:(BOOL)a4 personalNameMapping:(id)a5 punctuationMapping:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  id v11;
  id v12;

  v7 = a4;
  v9 = a6;
  v10 = a5;
  v11 = a3;
  v12 = -[SGTokenizerMappingTransformer initForLocale:tagNames:trustCoreNLP:personalNameMapping:punctuationMapping:]([SGTokenizerMappingTransformer alloc], "initForLocale:tagNames:trustCoreNLP:personalNameMapping:punctuationMapping:", v11, v7, 0, v10, v9);

  return v12;
}

+ (id)forLocale:(id)a3 tagNames:(BOOL)a4 trustCoreNLP:(BOOL)a5 personalNameMapping:(id)a6 punctuationMapping:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v11;
  id v12;
  id v13;
  id v14;

  v8 = a5;
  v9 = a4;
  v11 = a7;
  v12 = a6;
  v13 = a3;
  v14 = -[SGTokenizerMappingTransformer initForLocale:tagNames:trustCoreNLP:personalNameMapping:punctuationMapping:]([SGTokenizerMappingTransformer alloc], "initForLocale:tagNames:trustCoreNLP:personalNameMapping:punctuationMapping:", v13, v9, v8, v12, v11);

  return v14;
}

+ (id)_purgeableNLTaggerWithNameTagging:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int out_token;

  v3 = a3;
  getTokenizerDispatchQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if ((_purgeableNLTaggerWithNameTagging__registeredAssetNotification & 1) == 0)
  {
    _purgeableNLTaggerWithNameTagging__registeredAssetNotification = 1;
    out_token = 0;
    getTokenizerDispatchQueue();
    v5 = objc_claimAutoreleasedReturnValue();
    notify_register_dispatch("com.apple.MobileAsset.LinguisticData.ma.new-asset-installed", &out_token, v5, &__block_literal_global_28142);

  }
  v6 = &_purgeableNLTaggerWithNameTagging__nlTaggerWithNameTagging;
  v7 = (void *)_purgeableNLTaggerWithNameTagging__nlTaggerWithNameTagging;
  if (!v3 || _purgeableNLTaggerWithNameTagging__nlTaggerWithNameTagging)
  {
    v6 = &_purgeableNLTaggerWithNameTagging__nlTaggerPlain;
    v9 = (void *)_purgeableNLTaggerWithNameTagging__nlTaggerPlain;
    if (_purgeableNLTaggerWithNameTagging__nlTaggerPlain)
      goto LABEL_9;
    v8 = &__block_literal_global_125_28144;
  }
  else
  {
    v8 = &__block_literal_global_124_28143;
  }
  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815E0]), "initWithBlock:idleTimeout:", v8, 1.0);
  v11 = (void *)*v6;
  *v6 = v10;

  v7 = (void *)_purgeableNLTaggerWithNameTagging__nlTaggerWithNameTagging;
  v9 = (void *)_purgeableNLTaggerWithNameTagging__nlTaggerPlain;
LABEL_9:
  if (v3)
    return v7;
  else
    return v9;
}

+ (id)_purgeableNSLinguisticTaggerWithTagSchemes:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  getTokenizerDispatchQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (!_purgeableNSLinguisticTaggerWithTagSchemes__purgeableTaggers)
  {
    v5 = objc_opt_new();
    v6 = (void *)_purgeableNSLinguisticTaggerWithTagSchemes__purgeableTaggers;
    _purgeableNSLinguisticTaggerWithTagSchemes__purgeableTaggers = v5;

  }
  objc_msgSend(v3, "_pas_componentsJoinedByString:", CFSTR("\n"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_purgeableNSLinguisticTaggerWithTagSchemes__purgeableTaggers, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0D815E0]);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __76__SGTokenizerMappingTransformer__purgeableNSLinguisticTaggerWithTagSchemes___block_invoke;
    v11[3] = &unk_1E7DB22A8;
    v12 = v3;
    v8 = (void *)objc_msgSend(v9, "initWithBlock:idleTimeout:", v11, 1.0);
    objc_msgSend((id)_purgeableNSLinguisticTaggerWithTagSchemes__purgeableTaggers, "setObject:forKeyedSubscript:", v8, v7);

  }
  return v8;
}

id __76__SGTokenizerMappingTransformer__purgeableNSLinguisticTaggerWithTagSchemes___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3730]), "initWithTagSchemes:options:", *(_QWORD *)(a1 + 32), 4);
}

id __67__SGTokenizerMappingTransformer__purgeableNLTaggerWithNameTagging___block_invoke_2()
{
  return (id)_createNLPTagger(0);
}

id __67__SGTokenizerMappingTransformer__purgeableNLTaggerWithNameTagging___block_invoke_122()
{
  return (id)_createNLPTagger(1);
}

void __67__SGTokenizerMappingTransformer__purgeableNLTaggerWithNameTagging___block_invoke()
{
  NSObject *v0;
  void *v1;
  void *v2;
  uint8_t v3[16];

  sgLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1C3607000, v0, OS_LOG_TYPE_INFO, "SGTokenizerMappingTransformer reloading NLTagger in response to new asset installation", v3, 2u);
  }

  v1 = (void *)_purgeableNLTaggerWithNameTagging__nlTaggerPlain;
  _purgeableNLTaggerWithNameTagging__nlTaggerPlain = 0;

  v2 = (void *)_purgeableNLTaggerWithNameTagging__nlTaggerWithNameTagging;
  _purgeableNLTaggerWithNameTagging__nlTaggerWithNameTagging = 0;

}

@end
