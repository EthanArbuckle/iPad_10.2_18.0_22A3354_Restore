@implementation FCNewsArticleEmbeddingConfiguration

- (BOOL)shouldFetch
{
  return self->_shouldFetch;
}

- (FCNewsArticleEmbeddingConfiguration)initWithDictionary:(id)a3
{
  id v4;
  FCNewsArticleEmbeddingConfiguration *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FCNewsArticleEmbeddingConfiguration;
  v5 = -[FCNewsArticleEmbeddingConfiguration init](&v7, sel_init);
  if (v5)
  {
    v5->_shouldFetch = FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("fetch"), 0);
    v5->_shouldPersist = FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("persist"), 0);
  }

  return v5;
}

- (FCNewsArticleEmbeddingConfiguration)init
{
  return -[FCNewsArticleEmbeddingConfiguration initWithDictionary:](self, "initWithDictionary:", 0);
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; shouldFetch: %d"),
    -[FCNewsArticleEmbeddingConfiguration shouldFetch](self, "shouldFetch"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; shouldPersist: %d"),
    -[FCNewsArticleEmbeddingConfiguration shouldPersist](self, "shouldPersist"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (void)setShouldFetch:(BOOL)a3
{
  self->_shouldFetch = a3;
}

- (BOOL)shouldPersist
{
  return self->_shouldPersist;
}

- (void)setShouldPersist:(BOOL)a3
{
  self->_shouldPersist = a3;
}

@end
