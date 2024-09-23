@implementation FCArticleList

- (FCArticleList)initWithRecord:(id)a3 interestToken:(id)a4
{
  id v7;
  id v8;
  FCArticleList *v9;
  FCArticleList *v10;
  void *v11;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  NSArray *articleIDs;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSDate *lastModifiedDate;
  void *v23;
  void *v24;
  void *v25;
  FCArticleListEditorialMetadata *v26;
  FCArticleListEditorialMetadata *editorialMetadata;
  objc_super v29;

  v7 = a3;
  v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)FCArticleList;
  v9 = -[FCArticleList init](&v29, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_record, a3);
    objc_storeStrong((id *)&v10->_interestToken, a4);
    objc_msgSend(v7, "base");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = objc_claimAutoreleasedReturnValue();
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v12;

    objc_msgSend(v7, "articleIDs");
    v14 = objc_claimAutoreleasedReturnValue();
    articleIDs = v10->_articleIDs;
    v10->_articleIDs = (NSArray *)v14;

    v16 = objc_msgSend(v7, "type");
    v17 = v16 == 1;
    if (v16 == 2)
      v17 = 2;
    v10->_type = v17;
    v18 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v7, "base");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "modificationDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dateWithPBDate:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    lastModifiedDate = v10->_lastModifiedDate;
    v10->_lastModifiedDate = (NSDate *)v21;

    if (objc_msgSend(v7, "type") - 1 <= 1)
    {
      v23 = (void *)MEMORY[0x1E0C99D80];
      objc_msgSend(v7, "metadata");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "fc_dictionaryFromJSON:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = -[FCArticleListEditorialMetadata initWithDictionary:]([FCArticleListEditorialMetadata alloc], "initWithDictionary:", v25);
      editorialMetadata = v10->_editorialMetadata;
      v10->_editorialMetadata = v26;

    }
  }

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)articleIDs
{
  return self->_articleIDs;
}

- (unint64_t)type
{
  return self->_type;
}

- (FCArticleListEditorialMetadata)editorialMetadata
{
  return self->_editorialMetadata;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (NTPBArticleListRecord)record
{
  return self->_record;
}

- (FCInterestToken)interestToken
{
  return self->_interestToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interestToken, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_editorialMetadata, 0);
  objc_storeStrong((id *)&self->_articleIDs, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
