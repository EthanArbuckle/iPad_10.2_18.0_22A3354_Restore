@implementation FCNewsArticleEmbeddingsConfiguration

- (FCNewsArticleEmbeddingConfiguration)titleEmbeddingConfiguration
{
  return self->_titleEmbeddingConfiguration;
}

- (FCNewsArticleEmbeddingConfiguration)bodyEmbeddingConfiguration
{
  return self->_bodyEmbeddingConfiguration;
}

- (FCNewsArticleEmbeddingsConfiguration)initWithDictionary:(id)a3
{
  id v4;
  FCNewsArticleEmbeddingsConfiguration *v5;
  void *v6;
  FCNewsArticleEmbeddingConfiguration *v7;
  FCNewsArticleEmbeddingConfiguration *titleEmbeddingConfiguration;
  void *v9;
  FCNewsArticleEmbeddingConfiguration *v10;
  FCNewsArticleEmbeddingConfiguration *bodyEmbeddingConfiguration;
  void *v12;
  FCNewsPersonalizationArticleEmbeddingsFittingConfiguration *v13;
  FCNewsPersonalizationArticleEmbeddingsFittingConfiguration *fittingConfiguration;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FCNewsArticleEmbeddingsConfiguration;
  v5 = -[FCNewsArticleEmbeddingsConfiguration init](&v16, sel_init);
  if (v5)
  {
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("titleEmbedding"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[FCNewsArticleEmbeddingConfiguration initWithDictionary:]([FCNewsArticleEmbeddingConfiguration alloc], "initWithDictionary:", v6);
    titleEmbeddingConfiguration = v5->_titleEmbeddingConfiguration;
    v5->_titleEmbeddingConfiguration = v7;

    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("bodyEmbedding"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[FCNewsArticleEmbeddingConfiguration initWithDictionary:]([FCNewsArticleEmbeddingConfiguration alloc], "initWithDictionary:", v9);
    bodyEmbeddingConfiguration = v5->_bodyEmbeddingConfiguration;
    v5->_bodyEmbeddingConfiguration = v10;

    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("fittingConfiguration"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[FCNewsPersonalizationArticleEmbeddingsFittingConfiguration initWithDictionary:]([FCNewsPersonalizationArticleEmbeddingsFittingConfiguration alloc], "initWithDictionary:", v12);
    fittingConfiguration = v5->_fittingConfiguration;
    v5->_fittingConfiguration = v13;

    v5->_requiredDimensions = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("requiredDimensions"), 768);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fittingConfiguration, 0);
  objc_storeStrong((id *)&self->_bodyEmbeddingConfiguration, 0);
  objc_storeStrong((id *)&self->_titleEmbeddingConfiguration, 0);
}

- (FCNewsArticleEmbeddingsConfiguration)init
{
  return -[FCNewsArticleEmbeddingsConfiguration initWithDictionary:](self, "initWithDictionary:", 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNewsArticleEmbeddingsConfiguration titleEmbeddingConfiguration](self, "titleEmbeddingConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; titleEmbeddingConfiguration: %@"), v4);

  -[FCNewsArticleEmbeddingsConfiguration bodyEmbeddingConfiguration](self, "bodyEmbeddingConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; bodyEmbeddingConfiguration: %@"), v5);

  -[FCNewsArticleEmbeddingsConfiguration fittingConfiguration](self, "fittingConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; fittingConfiguration: %@"), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR("; requiredDimensions: %llu"),
    -[FCNewsArticleEmbeddingsConfiguration requiredDimensions](self, "requiredDimensions"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (void)setTitleEmbeddingConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_titleEmbeddingConfiguration, a3);
}

- (void)setBodyEmbeddingConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_bodyEmbeddingConfiguration, a3);
}

- (FCNewsPersonalizationArticleEmbeddingsFittingConfiguration)fittingConfiguration
{
  return self->_fittingConfiguration;
}

- (void)setFittingConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_fittingConfiguration, a3);
}

- (int64_t)requiredDimensions
{
  return self->_requiredDimensions;
}

- (void)setRequiredDimensions:(int64_t)a3
{
  self->_requiredDimensions = a3;
}

@end
