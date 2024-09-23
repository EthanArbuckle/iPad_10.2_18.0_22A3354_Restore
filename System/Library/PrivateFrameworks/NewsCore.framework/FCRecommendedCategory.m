@implementation FCRecommendedCategory

- (FCRecommendedCategory)initWithIdentifier:(id)a3 name:(id)a4 curatedTagIDs:(id)a5 recommendedTopicTagIDs:(id)a6 recommendedChannelTagIDs:(id)a7 subcategories:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  FCRecommendedCategory *v20;
  uint64_t v21;
  NSString *identifier;
  uint64_t v23;
  NSString *name;
  void *v25;
  uint64_t v26;
  NSArray *curatedTagIDs;
  uint64_t v28;
  NSArray *topicTagIDs;
  uint64_t v30;
  NSArray *channelTagIDs;
  uint64_t v32;
  NSArray *subcategories;
  objc_super v35;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v35.receiver = self;
  v35.super_class = (Class)FCRecommendedCategory;
  v20 = -[FCRecommendedCategory init](&v35, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v14, "copy");
    identifier = v20->_identifier;
    v20->_identifier = (NSString *)v21;

    v23 = objc_msgSend(v15, "copy");
    name = v20->_name;
    v20->_name = (NSString *)v23;

    if (objc_msgSend(v16, "count"))
      v25 = v16;
    else
      v25 = v18;
    v26 = objc_msgSend(v25, "copy");
    curatedTagIDs = v20->_curatedTagIDs;
    v20->_curatedTagIDs = (NSArray *)v26;

    v28 = objc_msgSend(v17, "copy");
    topicTagIDs = v20->_topicTagIDs;
    v20->_topicTagIDs = (NSArray *)v28;

    v30 = objc_msgSend(v18, "copy");
    channelTagIDs = v20->_channelTagIDs;
    v20->_channelTagIDs = (NSArray *)v30;

    v32 = objc_msgSend(v19, "copy");
    subcategories = v20->_subcategories;
    v20->_subcategories = (NSArray *)v32;

  }
  return v20;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  int v28;

  v9 = a3;
  objc_opt_class();
  if (v9)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  if (!v11)
  {
    v14 = 0;
    goto LABEL_31;
  }
  -[FCRecommendedCategory identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 || (objc_msgSend(v11, "identifier"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[FCRecommendedCategory identifier](self, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "isEqualToString:", v5))
    {
      v14 = 0;
LABEL_27:

      goto LABEL_28;
    }
    v13 = 1;
  }
  else
  {
    v13 = 0;
  }
  -[FCRecommendedCategory name](self, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 || (objc_msgSend(v11, "name"), (v25 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[FCRecommendedCategory name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "isEqualToString:", v7))
    {
      v14 = 0;
      goto LABEL_25;
    }
    v26 = v13;
    v27 = v3;
    v28 = 1;
  }
  else
  {
    v26 = v13;
    v27 = v3;
    v25 = 0;
    v28 = 0;
  }
  -[FCRecommendedCategory topicTagIDs](self, "topicTagIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "topicTagIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "isEqualToArray:", v17))
  {

    v14 = 0;
    if (!v28)
      goto LABEL_34;
    goto LABEL_24;
  }
  v23 = v6;
  -[FCRecommendedCategory channelTagIDs](self, "channelTagIDs");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "channelTagIDs");
  v24 = v18;
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "isEqualToArray:"))
  {
    -[FCRecommendedCategory subcategories](self, "subcategories");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subcategories");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v19, "isEqualToArray:", v21);

  }
  else
  {
    v14 = 0;
  }
  v6 = v23;

  if ((v28 & 1) != 0)
  {
LABEL_24:
    v3 = v27;
    v13 = v26;
LABEL_25:

    if (!v15)
      goto LABEL_35;
    goto LABEL_26;
  }
LABEL_34:
  v3 = v27;
  v13 = v26;
  if (!v15)
  {
LABEL_35:

    if ((v13 & 1) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_26:

  if (v13)
    goto LABEL_27;
LABEL_28:
  if (!v12)

LABEL_31:
  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  -[FCRecommendedCategory identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[FCRecommendedCategory name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[FCRecommendedCategory topicTagIDs](self, "topicTagIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[FCRecommendedCategory channelTagIDs](self, "channelTagIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[FCRecommendedCategory subcategories](self, "subcategories");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");

  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)topicTagIDs
{
  return self->_topicTagIDs;
}

- (NSArray)channelTagIDs
{
  return self->_channelTagIDs;
}

- (NSArray)subcategories
{
  return self->_subcategories;
}

- (NSArray)curatedTagIDs
{
  return self->_curatedTagIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curatedTagIDs, 0);
  objc_storeStrong((id *)&self->_subcategories, 0);
  objc_storeStrong((id *)&self->_channelTagIDs, 0);
  objc_storeStrong((id *)&self->_topicTagIDs, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
