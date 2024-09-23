@implementation FCTagMetadata

- (FCTagMetadata)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCTagMetadata init]";
    v9 = 2080;
    v10 = "FCTagMetadata.m";
    v11 = 1024;
    v12 = 35;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCTagMetadata init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCTagMetadata)initWithIdentifier:(id)a3 tagType:(unint64_t)a4 dictionary:(id)a5 isArticleMetadata:(BOOL)a6
{
  id v11;
  id v12;
  FCTagMetadata *v13;
  FCTagMetadata *v14;
  uint64_t v15;
  NSDictionary *dictionary;
  objc_super v18;

  v11 = a3;
  v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)FCTagMetadata;
  v13 = -[FCTagMetadata init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_identifier, a3);
    v14->_tagType = a4;
    v15 = objc_msgSend(v12, "copy");
    dictionary = v14->_dictionary;
    v14->_dictionary = (NSDictionary *)v15;

    v14->_isArticleMetadata = a6;
  }

  return v14;
}

- (NSString)name
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  __CFString **v6;
  void *v7;

  v3 = -[FCTagMetadata isArticleMetadata](self, "isArticleMetadata");
  -[FCTagMetadata dictionary](self, "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = FCArticleSourceChannelNameKey;
  if (!v3)
    v6 = FCCKTagNameKey;
  objc_msgSend(v4, "objectForKeyedSubscript:", *v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)nameImage
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  __CFString **v6;
  void *v7;

  v3 = -[FCTagMetadata isArticleMetadata](self, "isArticleMetadata");
  -[FCTagMetadata dictionary](self, "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = FCArticleSourceChannelNameImageKey;
  if (!v3)
    v6 = FCCKTagNameImageKey;
  objc_msgSend(v4, "objectForKeyedSubscript:", *v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)nameImageForDarkBackground
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  __CFString **v6;
  void *v7;

  v3 = -[FCTagMetadata isArticleMetadata](self, "isArticleMetadata");
  -[FCTagMetadata dictionary](self, "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = FCArticleSourceChannelNameImageForDarkBackgroundKey;
  if (!v3)
    v6 = FCCKTagNameImageForDarkBackgroundKey;
  objc_msgSend(v4, "objectForKeyedSubscript:", *v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)nameImageMetadata
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  __CFString **v6;
  void *v7;

  v3 = -[FCTagMetadata isArticleMetadata](self, "isArticleMetadata");
  -[FCTagMetadata dictionary](self, "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = FCArticleSourceChannelNameImageMetadataKey;
  if (!v3)
    v6 = FCCKTagNameImageMetadataKey;
  objc_msgSend(v4, "objectForKeyedSubscript:", *v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)nameImageMask
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  __CFString **v6;
  void *v7;

  v3 = -[FCTagMetadata isArticleMetadata](self, "isArticleMetadata");
  -[FCTagMetadata dictionary](self, "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = FCArticleSourceChannelNameImageMaskKey;
  if (!v3)
    v6 = FCCKTagNameImageMaskKey;
  objc_msgSend(v4, "objectForKeyedSubscript:", *v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (int64_t)nameImageBaselineShift
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  __CFString **v6;
  void *v7;
  int64_t v8;

  v3 = -[FCTagMetadata isArticleMetadata](self, "isArticleMetadata");
  -[FCTagMetadata dictionary](self, "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = FCArticleSourceChannelNameImageBaselineShiftKey;
  if (!v3)
    v6 = FCCKTagNameImageBaselineShift;
  objc_msgSend(v4, "objectForKeyedSubscript:", *v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "longValue");

  return v8;
}

- (int64_t)nameImageScaleFactor
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FCTagMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("nameImageScaleFactor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longValue");

  return v4;
}

- (NSString)coverImage
{
  void *v2;
  void *v3;

  -[FCTagMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("coverImage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)feedNavImage
{
  void *v2;
  void *v3;

  -[FCTagMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("feedNavImage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)feedNavImageHQ
{
  void *v2;
  void *v3;

  -[FCTagMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("feedNavImageHQ"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)publisherPaidAuthorizationURL
{
  void *v2;
  void *v3;

  -[FCTagMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("publisherPaidAuthorizationURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)publisherPaidVerificationURL
{
  void *v2;
  void *v3;

  -[FCTagMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("publisherPaidVerificationURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)sportsPrimaryName
{
  void *v2;
  void *v3;

  -[FCTagMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sportsPrimaryName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)sportsSecondaryName
{
  void *v2;
  void *v3;

  -[FCTagMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sportsSecondaryName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)sportsSecondaryShortName
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[FCTagMetadata dictionary](self, "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("shortSecondaryName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[FCTagMetadata dictionary](self, "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("secondaryShortName"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v6;
}

- (NSString)sportsFullName
{
  void *v2;
  void *v3;

  -[FCTagMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sportsFullName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)sportsLeagueType
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[FCTagMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sportsLeagueType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = FCSportsLeagueTypeFromString((uint64_t)v3);

  return v4;
}

- (NSString)sportsPrimaryColor
{
  void *v2;
  void *v3;

  -[FCTagMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sportsPrimaryColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)sportsLogoImageCompact
{
  void *v2;
  void *v3;

  -[FCTagMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sportsLogoImageCompact"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)groupTitleColor
{
  void *v2;
  void *v3;

  -[FCTagMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("groupTitleColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isAthlete
{
  void *v2;
  void *v3;

  -[FCTagMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("tagTypes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "containsObject:", CFSTR("ATHLETE"));
  return (char)v2;
}

- (BOOL)isLocalNews
{
  void *v2;
  void *v3;

  -[FCTagMetadata dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("tagTypes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "containsObject:", CFSTR("LOCAL_NEWS"));
  return (char)v2;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (BOOL)isArticleMetadata
{
  return self->_isArticleMetadata;
}

- (void)setIsArticleMetadata:(BOOL)a3
{
  self->_isArticleMetadata = a3;
}

- (unint64_t)tagType
{
  return self->_tagType;
}

- (void)setNameImage:(id)a3
{
  objc_storeStrong((id *)&self->_nameImage, a3);
}

- (void)setNameImageForDarkBackground:(id)a3
{
  objc_storeStrong((id *)&self->_nameImageForDarkBackground, a3);
}

- (void)setNameImageMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_nameImageMetadata, a3);
}

- (void)setNameImageMask:(id)a3
{
  objc_storeStrong((id *)&self->_nameImageMask, a3);
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)setGroupTitleColor:(id)a3
{
  objc_storeStrong((id *)&self->_groupTitleColor, a3);
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_dictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_groupTitleColor, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_nameImageMask, 0);
  objc_storeStrong((id *)&self->_nameImageMetadata, 0);
  objc_storeStrong((id *)&self->_nameImageForDarkBackground, 0);
  objc_storeStrong((id *)&self->_nameImage, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
