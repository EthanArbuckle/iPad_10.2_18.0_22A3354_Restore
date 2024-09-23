@implementation NLEmbedding

- (NLEmbedding)initWithType:(id)a3 architecture:(id)a4 locale:(id)a5 version:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NLEmbedding *v18;
  NLEmbedding *v19;
  objc_super v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x1E0C99E08];
  v15 = *MEMORY[0x1E0D17460];
  v22[0] = *MEMORY[0x1E0D17470];
  v22[1] = v15;
  v23[0] = v10;
  v23[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryWithDictionary:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v17, "setObject:forKey:", v11, *MEMORY[0x1E0D17448]);
  if (v13)
    objc_msgSend(v17, "setObject:forKey:", v13, *MEMORY[0x1E0D17498]);
  v18 = (NLEmbedding *)NLStringEmbeddingCreateWithOptions();
  if (v18)
  {
    if (NLStringEmbeddingGetDimension() < 1)
    {
      v18 = 0;
    }
    else
    {
      v21.receiver = self;
      v21.super_class = (Class)NLEmbedding;
      v19 = -[NLEmbedding init](&v21, sel_init);
      if (v19)
      {
        v19->_embedding = v18;
        v19->_usesUntokenizedSentences = 0;
      }
      self = v19;
      v18 = self;
    }
  }

  return v18;
}

- (NLEmbedding)initWithType:(id)a3 locale:(id)a4 version:(id)a5
{
  return -[NLEmbedding initWithType:architecture:locale:version:](self, "initWithType:architecture:locale:version:", a3, 0, a4, a5);
}

- (BOOL)usesUntokenizedSentences
{
  return self->_usesUntokenizedSentences;
}

- (void)setUsesUntokenizedSentences:(BOOL)a3
{
  self->_usesUntokenizedSentences = a3;
}

- (NLEmbedding)initWithLocale:(__CFLocale *)a3
{
  return -[NLEmbedding initWithType:locale:version:](self, "initWithType:locale:version:", *MEMORY[0x1E0D17478], a3, 0);
}

- (id)initContextualEmbeddingWithLocale:(__CFLocale *)a3
{
  return -[NLEmbedding initWithType:architecture:locale:version:](self, "initWithType:architecture:locale:version:", *MEMORY[0x1E0D17480], *MEMORY[0x1E0D17450], a3, 0);
}

- (id)initSentenceEmbeddingWithLocale:(__CFLocale *)a3
{
  return -[NLEmbedding initWithType:locale:version:](self, "initWithType:locale:version:", *MEMORY[0x1E0D17488], a3, 0);
}

- (void)_createEmbeddingRefWithContentsOfURL:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  if (objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v3, &v11))
    v5 = v11 == 0;
  else
    v5 = 0;
  if (v5)
  {
    v7 = *MEMORY[0x1E0D17478];
    v8 = *MEMORY[0x1E0D17468];
    v12[0] = *MEMORY[0x1E0D17470];
    v12[1] = v8;
    v13[0] = v7;
    v13[1] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)NLStringEmbeddingCreateWithOptions();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_initWithContentsOfURL:(id)a3 error:(id *)p_isa
{
  NLEmbedding *v5;
  void *v6;
  void *v7;
  NLEmbedding *v8;
  void *v9;
  void *v10;
  objc_super v12;
  uint64_t v13;
  _QWORD v14[2];

  v5 = self;
  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = -[NLEmbedding _createEmbeddingRefWithContentsOfURL:](self, "_createEmbeddingRefWithContentsOfURL:", a3);
  if (v6 && (v7 = v6, NLStringEmbeddingGetDimension() >= 1))
  {
    v12.receiver = v5;
    v12.super_class = (Class)NLEmbedding;
    v8 = -[NLEmbedding init](&v12, sel_init);
    if (v8)
      v8->_embedding = v7;
    v5 = v8;
    p_isa = (id *)&v5->super.isa;
  }
  else if (p_isa)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0CB2D50];
    v14[0] = CFSTR("Failed to load embedding file");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 1, v10);
    *p_isa = (id)objc_claimAutoreleasedReturnValue();

    p_isa = 0;
  }

  return p_isa;
}

- (NLEmbedding)initWithContentsOfURL:(id)a3 error:(id *)p_isa
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString **v14;
  uint64_t *v15;
  void *v16;
  void *v18;
  void *v19;
  NLEmbedding *v20;
  void *v21;
  void *v22;
  objc_super v23;
  char v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  if ((objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v7, &v24) & 1) == 0)
  {
    if (!p_isa)
      goto LABEL_9;
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0CB2D50];
    v30[0] = CFSTR("Could not find embedding file");
    v13 = (void *)MEMORY[0x1E0C99D80];
    v14 = (const __CFString **)v30;
    v15 = &v29;
    goto LABEL_7;
  }
  if (v24)
    goto LABEL_3;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("mlmodel")))
  {
    if (!p_isa)
      goto LABEL_9;
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0CB2D50];
    v28 = CFSTR("Cannot load embedding from uncompiled mlmodel file");
    v13 = (void *)MEMORY[0x1E0C99D80];
    v14 = &v28;
    v15 = &v27;
LABEL_7:
    objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 1, v16);
    *p_isa = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  if (v24)
  {
LABEL_3:
    +[NLModel modelWithContentsOfURL:error:](NLModel, "modelWithContentsOfURL:error:", v6, p_isa);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      self = -[NLEmbedding initWithNLModel:error:](self, "initWithNLModel:error:", v10, p_isa);

      p_isa = (id *)&self->super.isa;
      goto LABEL_9;
    }
LABEL_8:
    p_isa = 0;
    goto LABEL_9;
  }
  v18 = -[NLEmbedding _createEmbeddingRefWithContentsOfURL:](self, "_createEmbeddingRefWithContentsOfURL:", v6);
  if (!v18 || (v19 = v18, NLStringEmbeddingGetDimension() < 1))
  {
    if (p_isa)
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v25 = *MEMORY[0x1E0CB2D50];
      v26 = CFSTR("Failed to load embedding file");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 1, v22);
      *p_isa = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_3;
  }
  v23.receiver = self;
  v23.super_class = (Class)NLEmbedding;
  v20 = -[NLEmbedding init](&v23, sel_init);
  if (v20)
    v20->_embedding = v19;
  self = v20;
  p_isa = (id *)&self->super.isa;
LABEL_9:

  return (NLEmbedding *)p_isa;
}

- (void)_createEmbeddingRefWithData:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D17458];
  v9[0] = *MEMORY[0x1E0D17470];
  v9[1] = v3;
  v10[0] = *MEMORY[0x1E0D17478];
  v10[1] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)NLStringEmbeddingCreateWithOptions();
  return v7;
}

- (id)_initWithData:(id)a3 error:(id *)p_isa
{
  NLEmbedding *v5;
  void *v6;
  void *v7;
  NLEmbedding *v8;
  void *v9;
  void *v10;
  objc_super v12;
  uint64_t v13;
  _QWORD v14[2];

  v5 = self;
  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = -[NLEmbedding _createEmbeddingRefWithData:](self, "_createEmbeddingRefWithData:", a3);
  if (v6 && (v7 = v6, NLStringEmbeddingGetDimension() >= 1))
  {
    v12.receiver = v5;
    v12.super_class = (Class)NLEmbedding;
    v8 = -[NLEmbedding init](&v12, sel_init);
    if (v8)
      v8->_embedding = v7;
    v5 = v8;
    p_isa = (id *)&v5->super.isa;
  }
  else if (p_isa)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0CB2D50];
    v14[0] = CFSTR("Failed to load embedding data");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 5, v10);
    *p_isa = (id)objc_claimAutoreleasedReturnValue();

    p_isa = 0;
  }

  return p_isa;
}

- (NLEmbedding)initWithData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NLEmbedding *v9;
  NLEmbedding *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[NLEmbedding _createEmbeddingRefWithData:](self, "_createEmbeddingRefWithData:", v6);
  if (v7 && (v8 = v7, NLStringEmbeddingGetDimension() >= 1))
  {
    v16.receiver = self;
    v16.super_class = (Class)NLEmbedding;
    v9 = -[NLEmbedding init](&v16, sel_init);
    if (v9)
      v9->_embedding = v8;
    self = v9;
    v10 = self;
  }
  else
  {
    if (a4)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0CB2D50];
      v18[0] = CFSTR("Failed to load embedding data");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 5, v12);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    +[NLModel modelWithData:error:](NLModel, "modelWithData:error:", v6, a4);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      self = -[NLEmbedding initWithNLModel:error:](self, "initWithNLModel:error:", v13, a4);

      v10 = self;
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (void)_embeddingRef
{
  return self->_embedding;
}

- (NLEmbedding)initWithNLModel:(id)a3 error:(id *)p_isa
{
  id v7;
  void *v8;
  const void *v9;
  NLEmbedding *v10;
  void *v11;
  void *v12;
  objc_super v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "embedding");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (const void *)objc_msgSend(v8, "_embeddingRef");

  if (v9)
  {
    v14.receiver = self;
    v14.super_class = (Class)NLEmbedding;
    v10 = -[NLEmbedding init](&v14, sel_init);
    if (v10)
    {
      v10->_embedding = (void *)CFRetain(v9);
      objc_storeStrong((id *)&v10->_nlModel, a3);
    }
    self = v10;
    p_isa = (id *)&self->super.isa;
  }
  else if (p_isa)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2D50];
    v16[0] = CFSTR("Failed to load embedding file");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 6, v12);
    *p_isa = (id)objc_claimAutoreleasedReturnValue();

    p_isa = 0;
  }

  return (NLEmbedding *)p_isa;
}

- (NLEmbedding)initWithMLModel:(id)a3 error:(id *)a4
{
  void *v6;
  NLEmbedding *v7;
  NLEmbedding *v8;

  +[NLModel modelWithMLModel:error:](NLModel, "modelWithMLModel:error:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    self = -[NLEmbedding initWithNLModel:error:](self, "initWithNLModel:error:", v6, a4);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  return v8;
}

- (void)dealloc
{
  void *embedding;
  objc_super v4;

  embedding = self->_embedding;
  if (embedding)
    CFRelease(embedding);
  v4.receiver = self;
  v4.super_class = (Class)NLEmbedding;
  -[NLEmbedding dealloc](&v4, sel_dealloc);
}

+ (NLEmbedding)wordEmbeddingForLanguage:(NLLanguage)language
{
  void *v3;
  NLEmbedding *v4;
  NLEmbedding *v5;

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", language);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [NLEmbedding alloc];
    v5 = -[NLEmbedding initWithType:locale:version:](v4, "initWithType:locale:version:", *MEMORY[0x1E0D17478], v3, 0);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)contextualWordEmbeddingForLanguage:(id)a3
{
  void *v3;
  NLEmbedding *v4;
  NLEmbedding *v5;

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [NLEmbedding alloc];
    v5 = -[NLEmbedding initWithType:architecture:locale:version:](v4, "initWithType:architecture:locale:version:", *MEMORY[0x1E0D17480], *MEMORY[0x1E0D17450], v3, 0);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (NLEmbedding)sentenceEmbeddingForLanguage:(NLLanguage)language
{
  void *v3;
  NLEmbedding *v4;
  NLEmbedding *v5;

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", language);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [NLEmbedding alloc];
    v5 = -[NLEmbedding initWithType:locale:version:](v4, "initWithType:locale:version:", *MEMORY[0x1E0D17488], v3, 0);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (NLEmbedding)wordEmbeddingForLanguage:(NLLanguage)language revision:(NSUInteger)revision
{
  void *v5;
  NLEmbedding *v6;
  uint64_t v7;
  void *v8;
  NLEmbedding *v9;

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", language);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = [NLEmbedding alloc];
    v7 = *MEMORY[0x1E0D17478];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", revision);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NLEmbedding initWithType:locale:version:](v6, "initWithType:locale:version:", v7, v5, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)contextualWordEmbeddingForLanguage:(id)a3 revision:(unint64_t)a4
{
  void *v5;
  NLEmbedding *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NLEmbedding *v10;

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = [NLEmbedding alloc];
    v7 = *MEMORY[0x1E0D17480];
    v8 = *MEMORY[0x1E0D17450];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[NLEmbedding initWithType:architecture:locale:version:](v6, "initWithType:architecture:locale:version:", v7, v8, v5, v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)transformerContextualTokenEmbeddingForLanguage:(id)a3
{
  void *v3;
  NLEmbedding *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NLEmbedding *v8;

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [NLEmbedding alloc];
    v5 = *MEMORY[0x1E0D17480];
    v6 = *MEMORY[0x1E0D17430];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NLEmbedding initWithType:architecture:locale:version:](v4, "initWithType:architecture:locale:version:", v5, v6, v3, v7);

    if (v8)
      -[NLEmbedding setUsesUntokenizedSentences:](v8, "setUsesUntokenizedSentences:", 1);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (NLEmbedding)sentenceEmbeddingForLanguage:(NLLanguage)language revision:(NSUInteger)revision
{
  void *v5;
  NLEmbedding *v6;
  uint64_t v7;
  void *v8;
  NLEmbedding *v9;

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", language);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = [NLEmbedding alloc];
    v7 = *MEMORY[0x1E0D17488];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", revision);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NLEmbedding initWithType:locale:version:](v6, "initWithType:locale:version:", v7, v5, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)containsString:(NSString *)string
{
  double v3;

  -[NLEmbedding distanceBetweenString:andString:distanceType:](self, "distanceBetweenString:andString:distanceType:", string, string, 0);
  return v3 < 2.0;
}

- (NLDistance)distanceBetweenString:(NSString *)firstString andString:(NSString *)secondString distanceType:(NLDistanceType)distanceType
{
  float v5;

  NLStringEmbeddingGetDistance();
  return v5;
}

- (void)enumerateNeighborsForString:(NSString *)string maximumCount:(NSUInteger)maxCount distanceType:(NLDistanceType)distanceType usingBlock:(void *)block
{
  -[NLEmbedding enumerateNeighborsForString:maximumCount:maximumDistance:distanceType:usingBlock:](self, "enumerateNeighborsForString:maximumCount:maximumDistance:distanceType:usingBlock:", string, maxCount, distanceType, block, 2.0);
}

- (void)enumerateNeighborsForString:(NSString *)string maximumCount:(NSUInteger)maxCount maximumDistance:(NLDistance)maxDistance distanceType:(NLDistanceType)distanceType usingBlock:(void *)block
{
  void (**v7)(void *, uint64_t, char *, double);
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = block;
  v8 = (void *)NLStringEmbeddingCopyNeighborsWithDistances();
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __96__NLEmbedding_enumerateNeighborsForString_maximumCount_maximumDistance_distanceType_usingBlock___block_invoke;
  v26[3] = &unk_1E4A3A560;
  v10 = v8;
  v27 = v10;
  objc_msgSend(v9, "sortedArrayUsingComparator:", v26);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
LABEL_3:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v15)
        objc_enumerationMutation(v12);
      v17 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v16);
      objc_msgSend(v10, "objectForKey:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "doubleValue");
      v20 = v19;

      v21 = 0;
      v7[2](v7, v17, &v21, v20);
      if (v21)
        break;
      if (v14 == ++v16)
      {
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
        if (v14)
          goto LABEL_3;
        break;
      }
    }
  }

}

uint64_t __96__NLEmbedding_enumerateNeighborsForString_maximumCount_maximumDistance_distanceType_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKey:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "compare:", v8);
  return v9;
}

- (NSArray)neighborsForString:(NSString *)string maximumCount:(NSUInteger)maxCount distanceType:(NLDistanceType)distanceType
{
  return -[NLEmbedding neighborsForString:maximumCount:maximumDistance:distanceType:](self, "neighborsForString:maximumCount:maximumDistance:distanceType:", string, maxCount, distanceType, 2.0);
}

- (NSArray)neighborsForString:(NSString *)string maximumCount:(NSUInteger)maxCount maximumDistance:(NLDistance)maxDistance distanceType:(NLDistanceType)distanceType
{
  NSString *v10;
  void *v11;
  id v12;
  void *v13;
  NSArray *v14;
  _QWORD v16[4];
  id v17;

  v10 = string;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __76__NLEmbedding_neighborsForString_maximumCount_maximumDistance_distanceType___block_invoke;
  v16[3] = &unk_1E4A3B8D0;
  v12 = v11;
  v17 = v12;
  -[NLEmbedding enumerateNeighborsForString:maximumCount:maximumDistance:distanceType:usingBlock:](self, "enumerateNeighborsForString:maximumCount:maximumDistance:distanceType:usingBlock:", v10, maxCount, distanceType, v16, maxDistance);
  if (objc_msgSend(v12, "count") || -[NLEmbedding containsString:](self, "containsString:", v10))
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  return v14;
}

uint64_t __76__NLEmbedding_neighborsForString_maximumCount_maximumDistance_distanceType___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void)enumerateNeighborsForVector:(NSArray *)vector maximumCount:(NSUInteger)maxCount distanceType:(NLDistanceType)distanceType usingBlock:(void *)block
{
  -[NLEmbedding enumerateNeighborsForVector:maximumCount:maximumDistance:distanceType:usingBlock:](self, "enumerateNeighborsForVector:maximumCount:maximumDistance:distanceType:usingBlock:", vector, maxCount, distanceType, block, 2.0);
}

- (void)enumerateNeighborsForVector:(NSArray *)vector maximumCount:(NSUInteger)maxCount maximumDistance:(NLDistance)maxDistance distanceType:(NLDistanceType)distanceType usingBlock:(void *)block
{
  void (**v7)(void *, uint64_t, char *, double);
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = block;
  v8 = (void *)NLStringEmbeddingCopyNeighborsForVectorWithDistances();
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __96__NLEmbedding_enumerateNeighborsForVector_maximumCount_maximumDistance_distanceType_usingBlock___block_invoke;
  v26[3] = &unk_1E4A3A560;
  v10 = v8;
  v27 = v10;
  objc_msgSend(v9, "sortedArrayUsingComparator:", v26);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
LABEL_3:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v15)
        objc_enumerationMutation(v12);
      v17 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v16);
      objc_msgSend(v10, "objectForKey:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "doubleValue");
      v20 = v19;

      v21 = 0;
      v7[2](v7, v17, &v21, v20);
      if (v21)
        break;
      if (v14 == ++v16)
      {
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
        if (v14)
          goto LABEL_3;
        break;
      }
    }
  }

}

uint64_t __96__NLEmbedding_enumerateNeighborsForVector_maximumCount_maximumDistance_distanceType_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKey:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "compare:", v8);
  return v9;
}

- (NSArray)neighborsForVector:(NSArray *)vector maximumCount:(NSUInteger)maxCount distanceType:(NLDistanceType)distanceType
{
  return -[NLEmbedding neighborsForVector:maximumCount:maximumDistance:distanceType:](self, "neighborsForVector:maximumCount:maximumDistance:distanceType:", vector, maxCount, distanceType, 2.0);
}

- (NSArray)neighborsForVector:(NSArray *)vector maximumCount:(NSUInteger)maxCount maximumDistance:(NLDistance)maxDistance distanceType:(NLDistanceType)distanceType
{
  void *v10;
  NSArray *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;

  v10 = (void *)MEMORY[0x1E0C99DE8];
  v11 = vector;
  objc_msgSend(v10, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __76__NLEmbedding_neighborsForVector_maximumCount_maximumDistance_distanceType___block_invoke;
  v15[3] = &unk_1E4A3B8D0;
  v13 = v12;
  v16 = v13;
  -[NLEmbedding enumerateNeighborsForVector:maximumCount:maximumDistance:distanceType:usingBlock:](self, "enumerateNeighborsForVector:maximumCount:maximumDistance:distanceType:usingBlock:", v11, maxCount, distanceType, v15, maxDistance);

  return (NSArray *)v13;
}

uint64_t __76__NLEmbedding_neighborsForVector_maximumCount_maximumDistance_distanceType___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (NSUInteger)dimension
{
  return NLStringEmbeddingGetDimension();
}

- (NSUInteger)vocabularySize
{
  return NLStringEmbeddingGetVocabularySize();
}

- (NSArray)vectorForString:(NSString *)string
{
  return (NSArray *)(id)NLStringEmbeddingCopyVector();
}

- (BOOL)getVector:(float *)vector forString:(NSString *)string
{
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;

  v6 = (void *)NLStringEmbeddingCopyData();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(objc_retainAutorelease(v6), "bytes");
    if (-[NLEmbedding dimension](self, "dimension"))
    {
      v9 = 0;
      do
      {
        vector[v9] = *(float *)(v8 + 4 * v9);
        ++v9;
      }
      while (v9 < -[NLEmbedding dimension](self, "dimension"));
    }
  }

  return v7 != 0;
}

- (id)vectorsForTokenizedSentences:(id)a3 maxTokens:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  uint64_t Dimension;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v5 = a3;
  v6 = objc_msgSend(v5, "count");
  Dimension = NLStringEmbeddingGetDimension();
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 4 * a4 * v6 * Dimension);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 4 * Dimension);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_retainAutorelease(v8);
  objc_msgSend(v10, "mutableBytes");
  v11 = objc_retainAutorelease(v9);
  objc_msgSend(v11, "mutableBytes");
  LODWORD(a4) = NLStringEmbeddingFillWordVectors();

  if ((_DWORD)a4)
    v12 = v10;
  else
    v12 = 0;
  v13 = v12;

  return v13;
}

- (id)vectorsForUntokenizedSentences:(id)a3 maxTokens:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  uint64_t Dimension;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v5 = a3;
  v6 = objc_msgSend(v5, "count");
  Dimension = NLStringEmbeddingGetDimension();
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 4 * a4 * v6 * Dimension);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 4 * Dimension);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_retainAutorelease(v8);
  objc_msgSend(v10, "mutableBytes");
  v11 = objc_retainAutorelease(v9);
  objc_msgSend(v11, "mutableBytes");
  LODWORD(a4) = NLStringEmbeddingFillTokenVectorsWithShape();

  if ((_DWORD)a4)
    v12 = v10;
  else
    v12 = 0;
  v13 = v12;

  return v13;
}

- (id)vectorsForTokenizedSentences:(id)a3 untokenizedSentences:(id)a4 maxTokens:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a4;
  if (-[NLEmbedding usesUntokenizedSentences](self, "usesUntokenizedSentences"))
    -[NLEmbedding vectorsForUntokenizedSentences:maxTokens:](self, "vectorsForUntokenizedSentences:maxTokens:", v9, a5);
  else
    -[NLEmbedding vectorsForTokenizedSentences:maxTokens:](self, "vectorsForTokenizedSentences:maxTokens:", v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NLLanguage)language
{
  void *v2;
  void *v3;

  v2 = (void *)NLStringEmbeddingCopyModelLocale();
  objc_msgSend(v2, "localeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NLLanguage)v3;
}

- (NSUInteger)revision
{
  NSUInteger result;
  const void *v3;
  NSUInteger valuePtr;

  valuePtr = 0;
  result = NLStringEmbeddingCopyVersion();
  if (result)
  {
    v3 = (const void *)result;
    CFNumberGetValue((CFNumberRef)result, kCFNumberNSIntegerType, &valuePtr);
    CFRelease(v3);
    return valuePtr;
  }
  return result;
}

+ (id)supportedRevisionsForType:(id)a3 locale:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void *)NLStringEmbeddingCopySupportedVersions();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v5, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "unsignedIntegerValue", (_QWORD)v12));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

    CFRelease(v6);
  }
  return v5;
}

+ (NSIndexSet)supportedRevisionsForLanguage:(NLLanguage)language
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", language);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(a1, "supportedRevisionsForType:locale:", *MEMORY[0x1E0D17478], v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (NSIndexSet *)v5;
}

+ (id)supportedContextualWordEmbeddingRevisionsForLanguage:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(a1, "supportedRevisionsForType:locale:", *MEMORY[0x1E0D17480], v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (NSIndexSet)supportedSentenceEmbeddingRevisionsForLanguage:(NLLanguage)language
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", language);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(a1, "supportedRevisionsForType:locale:", *MEMORY[0x1E0D17488], v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (NSIndexSet *)v5;
}

+ (unint64_t)currentRevisionForType:(id)a3 locale:(id)a4
{
  unint64_t result;
  const void *v5;
  unint64_t v6;

  result = NLStringEmbeddingCopyCurrentVersion();
  if (result)
  {
    v5 = (const void *)result;
    v6 = objc_msgSend((id)result, "unsignedIntegerValue");
    CFRelease(v5);
    return v6;
  }
  return result;
}

+ (NSUInteger)currentRevisionForLanguage:(NLLanguage)language
{
  void *v4;
  NSUInteger v5;

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", language);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = objc_msgSend(a1, "currentRevisionForType:locale:", *MEMORY[0x1E0D17478], v4);
  else
    v5 = 0;

  return v5;
}

+ (unint64_t)currentContextualWordEmbeddingRevisionForLanguage:(id)a3
{
  void *v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = objc_msgSend(a1, "currentRevisionForType:locale:", *MEMORY[0x1E0D17480], v4);
  else
    v5 = 0;

  return v5;
}

+ (NSUInteger)currentSentenceEmbeddingRevisionForLanguage:(NLLanguage)language
{
  void *v4;
  NSUInteger v5;

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", language);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = objc_msgSend(a1, "currentRevisionForType:locale:", *MEMORY[0x1E0D17488], v4);
  else
    v5 = 0;

  return v5;
}

+ (BOOL)_writeEmbeddingForDictionary:(id)a3 language:(id)a4 revision:(unint64_t)a5 toURL:(id)a6 orData:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  void *v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  BOOL v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  id v47;
  void *v48;
  id v49;
  id *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _OWORD v55[4];
  uint64_t v56;
  const __CFString *v57;
  uint64_t v58;
  const __CFString *v59;
  uint64_t v60;
  const __CFString *v61;
  _QWORD v62[3];
  _QWORD v63[3];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v47 = a6;
  memset(v55, 0, sizeof(v55));
  v49 = a7;
  v50 = a8;
  if (objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", v55, v65, 16))
  {
    objc_msgSend(v13, "objectForKey:", **((_QWORD **)&v55[0] + 1));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

  }
  else
  {
    v16 = 0;
  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v17 = v13;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v52;
LABEL_6:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v52 != v20)
        objc_enumerationMutation(v17);
      v22 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v21);
      objc_msgSend(v17, "objectForKey:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "count");

      if (v16 != v24)
        break;
      if (v19 == ++v21)
      {
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
        if (v19)
          goto LABEL_6;
        goto LABEL_12;
      }
    }
    NSLog(CFSTR("Embedding dictionary error, entry <%@> dimension %llu does not match %llu"), v22, v24, v16);

    if (v50)
    {
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v58 = *MEMORY[0x1E0CB2D50];
      v59 = CFSTR("Embedding dictionary has mismatched dimensions");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 4, v29);
      v30 = 0;
      *v50 = (id)objc_claimAutoreleasedReturnValue();
      v26 = v14;
      v32 = v47;
      v31 = v49;
      goto LABEL_40;
    }
    v30 = 0;
    v26 = v14;
    v32 = v47;
    v31 = v49;
  }
  else
  {
LABEL_12:

    if (v16)
    {
      if ((unint64_t)objc_msgSend(v17, "count") >= 0x7A121)
        v25 = 1;
      else
        v25 = 3;
      v26 = v14;
      if (v14)
      {
        objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v14);
        v27 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v27 = 0;
      }
      v32 = v47;
      v34 = 10;
      v48 = (void *)v27;
      do
      {
        if (!(v16 % v34))
          break;
        --v34;
      }
      while (v34);
      if (v34 <= 1)
        v35 = 1;
      else
        v35 = v34;
      v36 = (void *)MEMORY[0x1E0C99E08];
      v62[0] = *MEMORY[0x1E0D17498];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v63[0] = v37;
      v62[1] = *MEMORY[0x1E0D174B0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v35);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v63[1] = v38;
      v62[2] = *MEMORY[0x1E0D174A8];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v25);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v63[2] = v39;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 3);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "dictionaryWithDictionary:", v40);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v41 = v48;
      if (v48)
        objc_msgSend(v29, "setObject:forKey:", v48, *MEMORY[0x1E0D17460]);
      v31 = v49;
      if (v32)
      {
        objc_msgSend(v32, "path");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKey:", v42, *MEMORY[0x1E0D17468]);

      }
      if (v49)
        objc_msgSend(v29, "setObject:forKey:", v49, *MEMORY[0x1E0D17458]);
      v43 = NLStringEmbeddingSaveCompressedModel();
      v30 = v43;
      if (v50 && (v43 & 1) == 0)
      {
        v44 = (void *)MEMORY[0x1E0CB35C8];
        v60 = *MEMORY[0x1E0CB2D50];
        v61 = CFSTR("Failed to save embedding file");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v48;
        objc_msgSend(v44, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 7, v45);
        *v50 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v26 = v14;
      v31 = v49;
      if (!v50)
      {
        v30 = 0;
        v32 = v47;
        goto LABEL_41;
      }
      v33 = (void *)MEMORY[0x1E0CB35C8];
      v56 = *MEMORY[0x1E0CB2D50];
      v57 = CFSTR("Embedding dictionary is missing data");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 4, v29);
      v30 = 0;
      *v50 = (id)objc_claimAutoreleasedReturnValue();
      v32 = v47;
    }
LABEL_40:

  }
LABEL_41:

  return v30;
}

+ (BOOL)writeEmbeddingForDictionary:(NSDictionary *)dictionary language:(NLLanguage)language revision:(NSUInteger)revision toURL:(NSURL *)url error:(NSError *)error
{
  return objc_msgSend(a1, "_writeEmbeddingForDictionary:language:revision:toURL:orData:error:", dictionary, language, revision, url, 0, error);
}

+ (id)embeddingDataForDictionary:(id)a3 language:(id)a4 revision:(unint64_t)a5 error:(id *)a6
{
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v10 = (void *)MEMORY[0x1E0C99DF0];
  v11 = a4;
  v12 = a3;
  objc_msgSend(v10, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a6) = objc_msgSend(a1, "_writeEmbeddingForDictionary:language:revision:toURL:orData:error:", v12, v11, a5, 0, v13, a6);

  if ((_DWORD)a6)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  return v15;
}

+ (id)modelDescriptionForEmbedding:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = objc_msgSend(v4, "revision");
  v6 = objc_msgSend(v4, "dimension");
  v7 = objc_msgSend(v4, "vocabularySize");

  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("This model is an embedding (version %llu) with dimension %llu and vocabulary size %llu"), v5, v6, v7);
}

+ (BOOL)writeEmbeddingMLModelForDictionary:(id)a3 language:(id)a4 revision:(unint64_t)a5 toURL:(id)a6 options:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NLModelImplE *v21;
  NLModel *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  BOOL v30;
  NLModelImplE *v32;
  id v33;
  void *v34;
  id v35;

  v14 = a4;
  v15 = a6;
  v16 = a7;
  objc_msgSend(a1, "embeddingDataForDictionary:language:revision:error:", a3, v14, a5, a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    +[NLEmbedding embeddingWithData:error:](NLEmbedding, "embeddingWithData:error:", v17, a8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v35 = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v14, CFSTR("Language"), 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[NLModelConfiguration defaultModelConfigurationForType:options:error:](NLModelConfiguration, "defaultModelConfigurationForType:options:error:", 0, v19, a8);
      v20 = objc_claimAutoreleasedReturnValue();

      v21 = -[NLModelImplE initWithModelData:configuration:labelMap:vocabularyMap:documentFrequencyMap:customEmbeddingData:trainingInfo:error:]([NLModelImplE alloc], "initWithModelData:configuration:labelMap:vocabularyMap:documentFrequencyMap:customEmbeddingData:trainingInfo:error:", v17, v20, 0, 0, 0, 0, 0, 0);
      v34 = (void *)v20;
      v22 = -[NLModel initWithConfiguration:modelImpl:]([NLModel alloc], "initWithConfiguration:modelImpl:", v20, v21);
      if (v22)
      {
        v32 = v21;
        v33 = v15;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v35);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = *MEMORY[0x1E0C9E870];
        objc_msgSend(v23, "objectForKey:", *MEMORY[0x1E0C9E870]);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25)
        {
          objc_msgSend(a1, "modelDescriptionForEmbedding:", v18);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKey:", v26, v24);

        }
        v27 = *MEMORY[0x1E0C9E888];
        objc_msgSend(v23, "objectForKey:", *MEMORY[0x1E0C9E888]);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v28)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), a5);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKey:", v29, v27);

        }
        v15 = v33;
        v30 = -[NLModel writeMLModelToURL:options:error:](v22, "writeMLModelToURL:options:error:", v33, v23, a8);

        v16 = v35;
        v21 = v32;
      }
      else
      {
        v16 = v35;
        if (a8)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 6, 0);
          v30 = 0;
          *a8 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v30 = 0;
        }
      }

    }
    else
    {
      v30 = 0;
    }

  }
  else if (a8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 6, 0);
    v30 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

+ (NLEmbedding)embeddingWithContentsOfURL:(NSURL *)url error:(NSError *)error
{
  NSURL *v5;
  NLEmbedding *v6;

  v5 = url;
  v6 = -[NLEmbedding initWithContentsOfURL:error:]([NLEmbedding alloc], "initWithContentsOfURL:error:", v5, error);

  return v6;
}

+ (NLEmbedding)embeddingWithData:(id)a3 error:(id *)a4
{
  id v5;
  NLEmbedding *v6;

  v5 = a3;
  v6 = -[NLEmbedding initWithData:error:]([NLEmbedding alloc], "initWithData:error:", v5, a4);

  return v6;
}

+ (NLEmbedding)embeddingWithMLModel:(id)a3 error:(id *)a4
{
  id v5;
  NLEmbedding *v6;

  v5 = a3;
  v6 = -[NLEmbedding initWithMLModel:error:]([NLEmbedding alloc], "initWithMLModel:error:", v5, a4);

  return v6;
}

+ (id)_embeddingWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = -[NLEmbedding _initWithContentsOfURL:error:]([NLEmbedding alloc], "_initWithContentsOfURL:error:", v5, a4);

  return v6;
}

+ (id)_embeddingWithData:(id)a3 error:(id *)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = -[NLEmbedding _initWithData:error:]([NLEmbedding alloc], "_initWithData:error:", v5, a4);

  return v6;
}

+ (BOOL)assetsAvailableForEmbeddingType:(id)a3 language:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  char v9;

  v5 = a3;
  v6 = a4;
  if (!v6)
    goto LABEL_10;
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("Static")))
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("Dynamic")))
    {
      +[NLEmbedding contextualWordEmbeddingForLanguage:](NLEmbedding, "contextualWordEmbeddingForLanguage:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("Contextual")))
    {
      +[NLContextualEmbedding contextualEmbeddingWithLanguage:](NLContextualEmbedding, "contextualEmbeddingWithLanguage:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "hasAvailableAssets");
      goto LABEL_7;
    }
LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
  +[NLEmbedding wordEmbeddingForLanguage:](NLEmbedding, "wordEmbeddingForLanguage:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v8 = (void *)v7;
  v9 = v7 != 0;
LABEL_7:

LABEL_11:
  return v9;
}

+ (void)requestAssetsForEmbeddingType:(id)a3 language:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  const __CFString *v10;
  id *v11;
  _QWORD *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v8)
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("Static")))
    {
      v10 = CFSTR("WordEmbedding");
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __76__NLEmbedding_requestAssetsForEmbeddingType_language_withCompletionHandler___block_invoke;
      v18[3] = &unk_1E4A3B4E8;
      v11 = &v19;
      v19 = v9;
      v12 = v18;
    }
    else
    {
      if (!objc_msgSend(v7, "isEqualToString:", CFSTR("Dynamic")))
      {
        if (!objc_msgSend(v7, "isEqualToString:", CFSTR("Contextual")))
          goto LABEL_8;
        +[NLContextualEmbedding contextualEmbeddingWithLanguage:](NLContextualEmbedding, "contextualEmbeddingWithLanguage:", v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __76__NLEmbedding_requestAssetsForEmbeddingType_language_withCompletionHandler___block_invoke_3;
        v14[3] = &unk_1E4A3B4E8;
        v11 = &v15;
        v15 = v9;
        objc_msgSend(v13, "requestEmbeddingAssetsWithCompletionHandler:", v14);

        goto LABEL_7;
      }
      v10 = CFSTR("ContextualEmbedding");
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __76__NLEmbedding_requestAssetsForEmbeddingType_language_withCompletionHandler___block_invoke_2;
      v16[3] = &unk_1E4A3B4E8;
      v11 = &v17;
      v17 = v9;
      v12 = v16;
    }
    +[NLTagger requestAssetsForLanguage:tagScheme:completionHandler:](NLTagger, "requestAssetsForLanguage:tagScheme:completionHandler:", v8, v10, v12);
LABEL_7:

  }
LABEL_8:

}

uint64_t __76__NLEmbedding_requestAssetsForEmbeddingType_language_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__NLEmbedding_requestAssetsForEmbeddingType_language_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__NLEmbedding_requestAssetsForEmbeddingType_language_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nlModel, 0);
}

@end
