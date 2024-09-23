@implementation NLLanguageRecognizer

- (NLLanguageRecognizer)init
{
  uint64_t v3;
  void *v4;
  NLLanguageRecognizer *v5;
  objc_super v7;

  v3 = NLLanguageIdentifierCreate();
  if (v3)
  {
    v4 = (void *)v3;
    v7.receiver = self;
    v7.super_class = (Class)NLLanguageRecognizer;
    v5 = -[NLLanguageRecognizer init](&v7, sel_init);
    self = v5;
    if (v5)
      v5->_identifier = v4;
  }
  return self;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_identifier)
    NLLanguageIdentifierRelease();
  v3.receiver = self;
  v3.super_class = (Class)NLLanguageRecognizer;
  -[NLLanguageRecognizer dealloc](&v3, sel_dealloc);
}

+ (NLLanguage)dominantLanguageForString:(NSString *)string
{
  NSString *v3;
  int TopLanguage;

  v3 = string;
  -[NSString length](v3, "length");
  TopLanguage = NLLanguageIdentifierGetTopLanguage();

  return (NLLanguage)_getLanguageTag(TopLanguage);
}

- (NLLanguage)dominantLanguage
{
  int TopHypothesis;

  TopHypothesis = NLLanguageIdentifierGetTopHypothesis();
  return (NLLanguage)_getLanguageTag(TopHypothesis);
}

- (NSDictionary)languageHypothesesWithMaximum:(NSUInteger)maxHypotheses
{
  void *v4;
  NSUInteger v5;
  uint64_t v6;
  float *v7;
  uint64_t TopHypotheses;
  uint64_t v9;
  float *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (maxHypotheses >= 0x3A)
    v5 = 58;
  else
    v5 = maxHypotheses;
  if (maxHypotheses)
    v6 = v5;
  else
    v6 = 58;
  v7 = (float *)malloc_type_malloc(8 * v6, 0x100004000313F17uLL);
  TopHypotheses = NLLanguageIdentifierGetTopHypotheses();
  if (TopHypotheses >= 1)
  {
    v9 = TopHypotheses;
    v10 = v7 + 1;
    do
    {
      _getLanguageTag(*((_DWORD *)v10 - 1));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v12, v11);

      }
      v10 += 2;

      --v9;
    }
    while (v9);
    goto LABEL_14;
  }
  if (v7)
LABEL_14:
    free(v7);
  return (NSDictionary *)v4;
}

- (void)processString:(id)a3 range:(_NSRange)a4
{
  NLLanguageIdentifierConsumeString();
}

- (void)processString:(NSString *)string
{
  NSString *v4;

  v4 = string;
  -[NLLanguageRecognizer processString:range:](self, "processString:range:", v4, 0, -[NSString length](v4, "length"));

}

- (void)reset
{
  NLLanguageIdentifierReset();
}

- (NSDictionary)languageHints
{
  if (self->_languageHints)
    return self->_languageHints;
  else
    return (NSDictionary *)MEMORY[0x1E0C9AA70];
}

- (void)setLanguageHints:(NSDictionary *)languageHints
{
  NSDictionary *v4;
  unint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t i;
  void *v9;
  void *v10;
  double v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  float *v16;
  float v17;
  NSDictionary *v18;
  id v19;

  v4 = languageHints;
  -[NSDictionary allKeys](v4, "allKeys");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v19, "count");
  if (v5 >= 0x3A)
    v6 = 58;
  else
    v6 = v5;
  if (v6)
  {
    v7 = (char *)malloc_type_malloc(8 * v6, 0x100004000313F17uLL);
    for (i = 0; i != v6; ++i)
    {
      objc_msgSend(v19, "objectAtIndex:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKey:](v4, "objectForKey:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");
      v12 = v11;

      v13 = 0;
      do
      {
        v14 = v13;
        v15 = objc_msgSend(v9, "isEqualToString:", _languageTags[v13]);
        v13 = v14 + 1;
      }
      while (v14 <= 0x38 && !v15);
      if (!v15)
        LODWORD(v13) = 0;
      v16 = (float *)&v7[8 * i];
      *(_DWORD *)v16 = v13;
      v17 = v12;
      v16[1] = v17;

    }
    NLLanguageIdentifierSetLanguageHints();
    free(v7);
  }
  else
  {
    NLLanguageIdentifierSetLanguageHints();
  }
  v18 = self->_languageHints;
  self->_languageHints = v4;

}

- (NSArray)languageConstraints
{
  if (self->_languageConstraints)
    return self->_languageConstraints;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)setLanguageConstraints:(NSArray *)languageConstraints
{
  NSArray *v4;
  unint64_t v5;
  uint64_t v6;
  _DWORD *v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  int v12;
  NSArray *v13;

  v4 = languageConstraints;
  v5 = -[NSArray count](v4, "count");
  if (v5 >= 0x3A)
    v6 = 58;
  else
    v6 = v5;
  if (v6)
  {
    v7 = malloc_type_malloc(4 * v6, 0x100004052888210uLL);
    for (i = 0; i != v6; ++i)
    {
      -[NSArray objectAtIndex:](v4, "objectAtIndex:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      do
      {
        v11 = v10;
        v12 = objc_msgSend(v9, "isEqualToString:", _languageTags[v10]);
        v10 = v11 + 1;
      }
      while (v11 <= 0x38 && !v12);
      if (!v12)
        LODWORD(v10) = 0;
      v7[i] = v10;

    }
    NLLanguageIdentifierSetLanguageConstraints();
    free(v7);
  }
  else
  {
    NLLanguageIdentifierSetLanguageConstraints();
  }
  v13 = self->_languageConstraints;
  self->_languageConstraints = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageHints, 0);
  objc_storeStrong((id *)&self->_languageConstraints, 0);
}

@end
