@implementation FCSpotlightGroupConfig

- (FCSpotlightGroupConfig)initWithDictionary:(id)a3
{
  FCSpotlightGroupConfig *v3;
  FCSpotlightGroupConfig *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *spotlightArticleID;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FCSpotlightGroupConfig;
  v3 = -[FCGroupConfig initWithDictionary:](&v12, sel_initWithDictionary_, a3);
  v4 = v3;
  if (v3)
  {
    -[FCGroupConfig dictionary](v3, "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("publishDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "fc_dateFromStringWithISO8601Format:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    objc_storeStrong((id *)&v4->_publishDate, v7);
    if (v6)

    -[FCGroupConfig dictionary](v4, "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("articleID"));
    v9 = objc_claimAutoreleasedReturnValue();
    spotlightArticleID = v4->_spotlightArticleID;
    v4->_spotlightArticleID = (NSString *)v9;

  }
  return v4;
}

- (NSString)spotlightCallToActionTitle
{
  void *v2;
  void *v3;

  -[FCGroupConfig dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("spotlightCallToActionTitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)spotlightEyebrowTitle
{
  void *v2;
  void *v3;

  -[FCGroupConfig dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("spotlightEyebrowTitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (FCCardStyleProviding)spotlightItemStyle
{
  void *v2;
  void *v3;
  void *v4;

  -[FCGroupConfig dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("spotlightStyle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[FCCardStyle styleWithConfigDict:](FCCardStyle, "styleWithConfigDict:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCCardStyleProviding *)v4;
}

- (FCCardStyleProviding)spotlightItemDarkStyle
{
  void *v2;
  void *v3;
  void *v4;

  -[FCGroupConfig dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("spotlightStyleDark"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[FCCardStyle styleWithConfigDict:](FCCardStyle, "styleWithConfigDict:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCCardStyleProviding *)v4;
}

- (NSString)spotlightArticleID
{
  return self->_spotlightArticleID;
}

- (NSDate)publishDate
{
  return self->_publishDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publishDate, 0);
  objc_storeStrong((id *)&self->_spotlightArticleID, 0);
}

@end
