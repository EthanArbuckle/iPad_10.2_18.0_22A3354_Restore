@implementation NTFeedTransformationHeadlineItem

- (NTFeedTransformationHeadlineItem)init
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

  v15 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTFeedTransformationHeadlineItem init]";
    v9 = 2080;
    v10 = "NTFeedTransformationHeadlineItem.m";
    v11 = 1024;
    v12 = 27;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTFeedTransformationHeadlineItem init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NTFeedTransformationHeadlineItem)initWithHeadline:(id)a3 cacheExpirationDate:(id)a4 actionURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  NTFeedTransformationHeadlineItem *v11;
  uint64_t v12;
  FCHeadlineProviding *headline;
  uint64_t v14;
  NSDate *cacheExpirationDate;
  uint64_t v16;
  NSURL *actionURL;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTFeedTransformationHeadlineItem initWithHeadline:cacheExpirationDate:actionURL:].cold.2();
    if (v9)
      goto LABEL_6;
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTFeedTransformationHeadlineItem initWithHeadline:cacheExpirationDate:actionURL:].cold.1();
LABEL_6:
  v19.receiver = self;
  v19.super_class = (Class)NTFeedTransformationHeadlineItem;
  v11 = -[NTFeedTransformationHeadlineItem init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    headline = v11->_headline;
    v11->_headline = (FCHeadlineProviding *)v12;

    v14 = objc_msgSend(v9, "copy");
    cacheExpirationDate = v11->_cacheExpirationDate;
    v11->_cacheExpirationDate = (NSDate *)v14;

    v16 = objc_msgSend(v10, "copy");
    actionURL = v11->_actionURL;
    v11->_actionURL = (NSURL *)v16;

  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  FCDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NTFeedTransformationHeadlineItem headline](self, "headline");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "headline");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      -[NTFeedTransformationHeadlineItem cacheExpirationDate](self, "cacheExpirationDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cacheExpirationDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[NTFeedTransformationHeadlineItem headline](self, "headline");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[NTFeedTransformationHeadlineItem cacheExpirationDate](self, "cacheExpirationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[NTFeedTransformationHeadlineItem headline](self, "headline");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "articleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)todayItemType
{
  return 0;
}

- (NSString)clusterID
{
  void *v2;
  void *v3;

  -[NTFeedTransformationHeadlineItem headline](self, "headline");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clusterID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDate)cacheCutoffTimeRelativeDate
{
  void *v2;
  void *v3;

  -[NTFeedTransformationHeadlineItem headline](self, "headline");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "publishDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (BOOL)needsFeedItemHeadlinesFetch
{
  return 0;
}

- (NTPBFeedItem)feedItemForHeadlineFetch
{
  return 0;
}

- (id)protoitemWithFetchedFeedItemHeadline:(id)a3
{
  NTTodayHeadlineProtoitem *v4;
  void *v5;
  void *v6;
  void *v7;
  NTTodayHeadlineProtoitem *v8;

  v4 = [NTTodayHeadlineProtoitem alloc];
  -[NTFeedTransformationHeadlineItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTFeedTransformationHeadlineItem headline](self, "headline");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTFeedTransformationHeadlineItem actionURL](self, "actionURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NTTodayHeadlineProtoitem initWithIdentifier:headline:actionURL:](v4, "initWithIdentifier:headline:actionURL:", v5, v6, v7);

  return v8;
}

- (NSDate)cacheExpirationDate
{
  return self->_cacheExpirationDate;
}

- (FCHeadlineProviding)headline
{
  return self->_headline;
}

- (void)setHeadline:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURL)actionURL
{
  return self->_actionURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_headline, 0);
  objc_storeStrong((id *)&self->_cacheExpirationDate, 0);
}

- (void)initWithHeadline:cacheExpirationDate:actionURL:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"cacheExpirationDate", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithHeadline:cacheExpirationDate:actionURL:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"headline", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
