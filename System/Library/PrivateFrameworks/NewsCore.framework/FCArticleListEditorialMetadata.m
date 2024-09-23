@implementation FCArticleListEditorialMetadata

- (FCArticleListEditorialMetadata)initWithDictionary:(id)a3
{
  id v4;
  FCArticleListEditorialMetadata *v5;
  void *v6;
  uint64_t v7;
  NSDate *publishDate;
  void *v9;
  uint64_t v10;
  NSDictionary *articleMetadata;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FCArticleListEditorialMetadata;
  v5 = -[FCArticleListEditorialMetadata init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("publishDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "fc_dateFromStringWithISO8601Format:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      publishDate = v5->_publishDate;
      v5->_publishDate = (NSDate *)v7;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("articleMetadata"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fc_dictionaryByTransformingValuesWithBlock:", &__block_literal_global_148);
    v10 = objc_claimAutoreleasedReturnValue();
    articleMetadata = v5->_articleMetadata;
    v5->_articleMetadata = (NSDictionary *)v10;

  }
  return v5;
}

FCArticleMetadata *__53__FCArticleListEditorialMetadata_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  FCArticleMetadata *v3;

  v2 = a2;
  v3 = -[FCArticleMetadata initWithDictionary:]([FCArticleMetadata alloc], "initWithDictionary:", v2);

  return v3;
}

- (NSDate)publishDate
{
  return self->_publishDate;
}

- (void)setPublishDate:(id)a3
{
  objc_storeStrong((id *)&self->_publishDate, a3);
}

- (NSDictionary)articleMetadata
{
  return self->_articleMetadata;
}

- (void)setArticleMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_articleMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleMetadata, 0);
  objc_storeStrong((id *)&self->_publishDate, 0);
}

@end
