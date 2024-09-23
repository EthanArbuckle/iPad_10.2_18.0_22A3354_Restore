@implementation FCArticleMetadata

- (FCArticleMetadata)initWithDictionary:(id)a3
{
  id v4;
  FCArticleMetadata *v5;
  uint64_t v6;
  NSDictionary *dictionary;
  void *v8;
  void *v9;
  uint64_t v10;
  NSDate *displayDate;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FCArticleMetadata;
  v5 = -[FCArticleMetadata init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v6;

    -[FCArticleMetadata dictionary](v5, "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("displayDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "fc_dateFromStringWithISO8601Format:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      displayDate = v5->_displayDate;
      v5->_displayDate = (NSDate *)v10;
    }
    else
    {
      displayDate = v5->_displayDate;
      v5->_displayDate = 0;
    }

  }
  return v5;
}

- (FCArticleMetadata)initWithDictionary:(id)a3 identifier:(id)a4
{
  id v7;
  FCArticleMetadata *v8;
  FCArticleMetadata *v9;

  v7 = a4;
  v8 = -[FCArticleMetadata initWithDictionary:](self, "initWithDictionary:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_identifier, a4);

  return v9;
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[FCArticleMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)storyType
{
  void *v2;
  void *v3;

  -[FCArticleMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("storyType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)articleID
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[FCArticleMetadata dictionary](self, "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("id"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[FCArticleMetadata identifier](self, "identifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return (NSString *)v7;
}

- (NSString)shortExcerpt
{
  void *v2;
  void *v3;

  -[FCArticleMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("shortExcerpt"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)thumbnailTextColor
{
  void *v2;
  void *v3;

  -[FCArticleMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("thumbnailTextColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)thumbnailBackgroundColor
{
  void *v2;
  void *v3;

  -[FCArticleMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("thumbnailBackgroundColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)sourceChannelTagID
{
  void *v2;
  void *v3;

  -[FCArticleMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sourceChannelTagID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)thumbnailAccentColor
{
  void *v2;
  void *v3;

  -[FCArticleMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("thumbnailAccentColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)thumbnailPrimaryColor
{
  void *v2;
  void *v3;

  -[FCArticleMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("thumbnailPrimaryColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isPaid
{
  void *v2;
  void *v3;
  char v4;

  -[FCArticleMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("isPaid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (NSString)thumbnail
{
  void *v2;
  void *v3;

  -[FCArticleMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("thumbnail"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)thumbnailMetadata
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FCArticleMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("thumbnailMetadata"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLongValue");

  return v4;
}

- (NSString)thumbnailMedium
{
  void *v2;
  void *v3;

  -[FCArticleMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("thumbnailMedium"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)thumbnailMediumMetadata
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FCArticleMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("thumbnailMediumMetadata"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLongValue");

  return v4;
}

- (NSString)thumbnailHQ
{
  void *v2;
  void *v3;

  -[FCArticleMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("thumbnailHQ"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)thumbnailHQMetadata
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FCArticleMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("thumbnailHQMetadata"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLongValue");

  return v4;
}

- (NSString)thumbnailUltraHQ
{
  void *v2;
  void *v3;

  -[FCArticleMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("thumbnailUltraHQ"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)thumbnailUltraHQMetadata
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FCArticleMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("thumbnailUltraHQMetadata"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLongValue");

  return v4;
}

- (int64_t)thumbnailFocalFrame
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FCArticleMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("thumbnailFocalFrame"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLongValue");

  return v4;
}

- (NSDate)publishDate
{
  void *v2;
  void *v3;
  uint64_t v4;

  -[FCArticleMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("publishDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLongValue");

  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "fc_dateWithMillisecondTimeIntervalSince1970:", v4);
}

- (BOOL)isTreatedAsNew
{
  void *v2;
  void *v3;
  char v4;

  -[FCArticleMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("isTreatedAsNew"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)publisherID
{
  void *v2;
  void *v3;

  -[FCArticleMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sourceChannelTagID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)contentType
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FCArticleMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("contentType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = FCArticleContentTypeFromString(v3);

  return v4;
}

- (NSString)contentURL
{
  void *v2;
  void *v3;

  -[FCArticleMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("contentURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)videoURL
{
  void *v2;
  void *v3;

  -[FCArticleMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("videoURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)videoType
{
  void *v2;
  void *v3;

  -[FCArticleMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("videoType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)sportsEventIDs
{
  void *v2;
  void *v3;

  -[FCArticleMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sportsEventIDs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSURL)routeURL
{
  void *v2;
  void *v3;
  void *v4;

  -[FCArticleMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("routeURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSURL *)v4;
}

- (double)conditionalScore
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[FCArticleMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("conditionalScore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (NSString)rapidUpdate
{
  return self->_rapidUpdate;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_dictionary, a3);
}

- (NSDate)displayDate
{
  return self->_displayDate;
}

- (void)setDisplayDate:(id)a3
{
  objc_storeStrong((id *)&self->_displayDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayDate, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_rapidUpdate, 0);
}

@end
