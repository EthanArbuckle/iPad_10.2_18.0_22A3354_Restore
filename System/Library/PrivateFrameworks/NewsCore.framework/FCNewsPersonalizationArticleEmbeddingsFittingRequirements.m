@implementation FCNewsPersonalizationArticleEmbeddingsFittingRequirements

- (FCNewsPersonalizationArticleEmbeddingsFittingRequirements)initWithDictionary:(id)a3
{
  id v4;
  FCNewsPersonalizationArticleEmbeddingsFittingRequirements *v5;
  uint64_t v6;
  NSNumber *minimumNumberOfEmbeddings;
  uint64_t v8;
  NSNumber *maximumNumberOfEmbeddings;
  uint64_t v10;
  NSNumber *minimumDuration;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FCNewsPersonalizationArticleEmbeddingsFittingRequirements;
  v5 = -[FCNewsPersonalizationArticleEmbeddingsFittingRequirements init](&v13, sel_init);
  if (v5)
  {
    FCAppConfigurationNumberValue(v4, (uint64_t)CFSTR("minimumNumberOfEmbeddings"), 0);
    v6 = objc_claimAutoreleasedReturnValue();
    minimumNumberOfEmbeddings = v5->_minimumNumberOfEmbeddings;
    v5->_minimumNumberOfEmbeddings = (NSNumber *)v6;

    FCAppConfigurationNumberValue(v4, (uint64_t)CFSTR("maximumNumberOfEmbeddings"), 0);
    v8 = objc_claimAutoreleasedReturnValue();
    maximumNumberOfEmbeddings = v5->_maximumNumberOfEmbeddings;
    v5->_maximumNumberOfEmbeddings = (NSNumber *)v8;

    FCAppConfigurationNumberValue(v4, (uint64_t)CFSTR("minimumDuration"), 0);
    v10 = objc_claimAutoreleasedReturnValue();
    minimumDuration = v5->_minimumDuration;
    v5->_minimumDuration = (NSNumber *)v10;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumDuration, 0);
  objc_storeStrong((id *)&self->_maximumNumberOfEmbeddings, 0);
  objc_storeStrong((id *)&self->_minimumNumberOfEmbeddings, 0);
}

- (FCNewsPersonalizationArticleEmbeddingsFittingRequirements)init
{
  return -[FCNewsPersonalizationArticleEmbeddingsFittingRequirements initWithDictionary:](self, "initWithDictionary:", 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNewsPersonalizationArticleEmbeddingsFittingRequirements minimumNumberOfEmbeddings](self, "minimumNumberOfEmbeddings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; minimumNumberOfEmbeddings: %@"), v4);

  -[FCNewsPersonalizationArticleEmbeddingsFittingRequirements maximumNumberOfEmbeddings](self, "maximumNumberOfEmbeddings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; maximumNumberOfEmbeddings: %@"), v5);

  -[FCNewsPersonalizationArticleEmbeddingsFittingRequirements minimumDuration](self, "minimumDuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; minimumDuration: %@"), v6);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (NSNumber)minimumNumberOfEmbeddings
{
  return self->_minimumNumberOfEmbeddings;
}

- (void)setMinimumNumberOfEmbeddings:(id)a3
{
  objc_storeStrong((id *)&self->_minimumNumberOfEmbeddings, a3);
}

- (NSNumber)maximumNumberOfEmbeddings
{
  return self->_maximumNumberOfEmbeddings;
}

- (void)setMaximumNumberOfEmbeddings:(id)a3
{
  objc_storeStrong((id *)&self->_maximumNumberOfEmbeddings, a3);
}

- (NSNumber)minimumDuration
{
  return self->_minimumDuration;
}

- (void)setMinimumDuration:(id)a3
{
  objc_storeStrong((id *)&self->_minimumDuration, a3);
}

@end
