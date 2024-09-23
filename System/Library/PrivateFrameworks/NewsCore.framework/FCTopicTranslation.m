@implementation FCTopicTranslation

- (FCTopicTranslation)init
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
    v8 = "-[FCTopicTranslation init]";
    v9 = 2080;
    v10 = "FCTopicTranslation.m";
    v11 = 1024;
    v12 = 22;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCTopicTranslation init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCTopicTranslation)initWithTagID:(id)a3
{
  id v4;
  FCTopicTranslation *v5;
  uint64_t v6;
  NSString *tagID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCTopicTranslation;
  v5 = -[FCTopicTranslation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    tagID = v5->_tagID;
    v5->_tagID = (NSString *)v6;

  }
  return v5;
}

- (FCTopicTranslation)initWithLanguageBucket:(id)a3
{
  id v4;
  void *v5;
  FCTopicTranslation *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FCTopicTranslation initWithTagID:](self, "initWithTagID:", v5);

  if (v6)
  {
    objc_msgSend(v4, "groupingFlags");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCTopicTranslation setIsHidden:](v6, "setIsHidden:", objc_msgSend(v7, "isHidden"));

    objc_msgSend(v4, "groupingFlags");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCTopicTranslation setIsEligibleForGrouping:](v6, "setIsEligibleForGrouping:", objc_msgSend(v8, "isEligibleForGrouping"));

    objc_msgSend(v4, "groupingFlags");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCTopicTranslation setIsEligibleForGroupingIfFavorited:](v6, "setIsEligibleForGroupingIfFavorited:", objc_msgSend(v9, "isEligibleForGroupingIfFavorited"));

  }
  return v6;
}

- (NTPBArticleTopic)articleTopic
{
  NTPBArticleTopic *articleTopic;
  id v4;
  void *v5;
  NTPBArticleTopic *v6;

  articleTopic = self->_articleTopic;
  if (!articleTopic)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D62638]);
    -[FCTopicTranslation tagID](self, "tagID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTagID:", v5);

    objc_msgSend(v4, "setIsHidden:", -[FCTopicTranslation isHidden](self, "isHidden"));
    objc_msgSend(v4, "setIsEligibleForGrouping:", -[FCTopicTranslation isEligibleForGrouping](self, "isEligibleForGrouping"));
    objc_msgSend(v4, "setIsEligibleForGroupingIfFavorited:", -[FCTopicTranslation isEligibleForGroupingIfFavorited](self, "isEligibleForGroupingIfFavorited"));
    v6 = self->_articleTopic;
    self->_articleTopic = (NTPBArticleTopic *)v4;

    articleTopic = self->_articleTopic;
  }
  return articleTopic;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[FCTopicTranslation tagID](self, "tagID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("TopicTranslation tagID: %@ isHidden: %d isEligibleForGrouping: %d isEligibleForGroupingIfFavorited: %d"), v4, -[FCTopicTranslation isHidden](self, "isHidden"), -[FCTopicTranslation isEligibleForGrouping](self, "isEligibleForGrouping"), -[FCTopicTranslation isEligibleForGroupingIfFavorited](self, "isEligibleForGroupingIfFavorited"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)tagID
{
  return self->_tagID;
}

- (void)setTagID:(id)a3
{
  objc_storeStrong((id *)&self->_tagID, a3);
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (void)setIsHidden:(BOOL)a3
{
  self->_isHidden = a3;
}

- (BOOL)isEligibleForGrouping
{
  return self->_isEligibleForGrouping;
}

- (void)setIsEligibleForGrouping:(BOOL)a3
{
  self->_isEligibleForGrouping = a3;
}

- (BOOL)isEligibleForGroupingIfFavorited
{
  return self->_isEligibleForGroupingIfFavorited;
}

- (void)setIsEligibleForGroupingIfFavorited:(BOOL)a3
{
  self->_isEligibleForGroupingIfFavorited = a3;
}

- (void)setArticleTopic:(id)a3
{
  objc_storeStrong((id *)&self->_articleTopic, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleTopic, 0);
  objc_storeStrong((id *)&self->_tagID, 0);
}

@end
