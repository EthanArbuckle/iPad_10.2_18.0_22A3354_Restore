@implementation FCArticleTagsExpiration

+ (id)tagsExpirationsFromRecord:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  FCArticleTagsExpiration *v11;
  FCArticleTagsExpiration *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
          v11 = [FCArticleTagsExpiration alloc];
          v12 = -[FCArticleTagsExpiration initWithTagsExpiration:](v11, "initWithTagsExpiration:", v10, (_QWORD)v14);
          objc_msgSend(v4, "addObject:", v12);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (FCArticleTagsExpiration)initWithTagsExpiration:(id)a3
{
  id v4;
  FCArticleTagsExpiration *v5;
  uint64_t v6;
  NSString *tagID;
  uint64_t v8;
  NSDate *expireTime;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCArticleTagsExpiration;
  v5 = -[FCArticleTagsExpiration init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "tagId");
    v6 = objc_claimAutoreleasedReturnValue();
    tagID = v5->_tagID;
    v5->_tagID = (NSString *)v6;

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v4, "expireUtcTime") / 1000.0);
    v8 = objc_claimAutoreleasedReturnValue();
    expireTime = v5->_expireTime;
    v5->_expireTime = (NSDate *)v8;

  }
  return v5;
}

- (id)description
{
  FCDescription *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[FCDescription initWithObject:]([FCDescription alloc], "initWithObject:", self);
  -[FCArticleTagsExpiration tagID](self, "tagID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCDescription addField:value:](v3, "addField:value:", CFSTR("tagID"), v4);

  -[FCArticleTagsExpiration expireTime](self, "expireTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCDescription addField:value:](v3, "addField:value:", CFSTR("expireTime"), v6);

  -[FCDescription descriptionString](v3, "descriptionString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)tagID
{
  return self->_tagID;
}

- (NSDate)expireTime
{
  return self->_expireTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expireTime, 0);
  objc_storeStrong((id *)&self->_tagID, 0);
}

@end
