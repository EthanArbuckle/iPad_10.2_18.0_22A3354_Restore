@implementation NLLMTokenIDConverter

- (NLLMTokenIDConverter)initWithLanguageModel:(id)a3
{
  id v4;
  NLLMTokenIDConverter *v5;
  NLLMTokenIDConverter *v6;
  NLTagger *v7;
  void *v8;
  uint64_t v9;
  NLTagger *tagger;
  NLLMTokenIDConverter *v11;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v13.receiver = self;
    v13.super_class = (Class)NLLMTokenIDConverter;
    v5 = -[NLLMTokenIDConverter init](&v13, sel_init);
    v6 = v5;
    if (v5)
    {
      objc_storeWeak((id *)&v5->_languageModel, v4);
      v7 = [NLTagger alloc];
      v14[0] = CFSTR("TokenType");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[NLTagger initWithTagSchemes:](v7, "initWithTagSchemes:", v8);
      tagger = v6->_tagger;
      v6->_tagger = (NLTagger *)v9;

    }
    self = v6;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unsigned)tokenIDForString:(id)a3
{
  id v4;
  NLLanguageModel **p_languageModel;
  id WeakRetained;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;

  v4 = a3;
  p_languageModel = &self->_languageModel;
  WeakRetained = objc_loadWeakRetained((id *)&self->_languageModel);
  objc_msgSend(WeakRetained, "lexicon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "entryForString:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_msgSend(v8, "tokenID");
  }
  else
  {
    v10 = objc_loadWeakRetained((id *)p_languageModel);
    v9 = objc_msgSend(v10, "tokenIDForString:", v4);

  }
  return v9;
}

- (id)stringForTokenID:(unsigned int)a3
{
  uint64_t v3;
  NLLanguageModel **p_languageModel;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(_QWORD *)&a3;
  p_languageModel = &self->_languageModel;
  WeakRetained = objc_loadWeakRetained((id *)&self->_languageModel);
  objc_msgSend(WeakRetained, "lexicon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entryForTokenID:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_loadWeakRetained((id *)p_languageModel);
    objc_msgSend(v9, "stringForTokenID:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)stringForTokenIDs:(const unsigned int *)a3 length:(unint64_t)a4
{
  void *i;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  for (i = (void *)objc_claimAutoreleasedReturnValue(); a4; --a4)
  {
    v8 = *a3++;
    if (v8 >= 6)
    {
      -[NLLMTokenIDConverter stringForTokenID:](self, "stringForTokenID:");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
        if (objc_msgSend(i, "length"))
        {
          objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "rangeOfCharacterFromSet:", v11);
          v13 = v12;

          if (v13)
            objc_msgSend(i, "appendString:", CFSTR(" "));
        }
        objc_msgSend(i, "appendString:", v10);

      }
    }
  }
  return i;
}

- (void)enumerateTokenIDsForString:(id)a3 range:(_NSRange)a4 withBlock:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  NLTagger *tagger;
  id v14;
  void *v15;
  NLTagger *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  -[NLTagger setString:](self->_tagger, "setString:", v9);
  WeakRetained = objc_loadWeakRetained((id *)&self->_languageModel);
  objc_msgSend(WeakRetained, "language");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    tagger = self->_tagger;
    v14 = objc_loadWeakRetained((id *)&self->_languageModel);
    objc_msgSend(v14, "language");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NLTagger setLanguage:range:](tagger, "setLanguage:range:", v15, 0, objc_msgSend(v9, "length"));

  }
  v16 = self->_tagger;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __67__NLLMTokenIDConverter_enumerateTokenIDsForString_range_withBlock___block_invoke;
  v19[3] = &unk_1E4A3AF30;
  v19[4] = self;
  v20 = v9;
  v21 = v10;
  v17 = v10;
  v18 = v9;
  -[NLTagger enumerateTagsInRange:unit:scheme:options:usingBlock:](v16, "enumerateTagsInRange:unit:scheme:options:usingBlock:", location, length, 0, CFSTR("TokenType"), 36, v19);

}

uint64_t __67__NLLMTokenIDConverter_enumerateTokenIDsForString_range_withBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v7;
  void *v8;
  uint64_t result;

  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "substringWithRange:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tokenIDForString:", v8);

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  *a5 = 0;
  return result;
}

- (NLLanguageModel)languageModel
{
  return (NLLanguageModel *)objc_loadWeakRetained((id *)&self->_languageModel);
}

- (NLTagger)tagger
{
  return self->_tagger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagger, 0);
  objc_destroyWeak((id *)&self->_languageModel);
}

@end
