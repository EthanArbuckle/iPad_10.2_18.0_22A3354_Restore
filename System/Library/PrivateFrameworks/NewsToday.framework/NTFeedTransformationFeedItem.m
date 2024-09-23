@implementation NTFeedTransformationFeedItem

- (NTFeedTransformationFeedItem)init
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
    v8 = "-[NTFeedTransformationFeedItem init]";
    v9 = 2080;
    v10 = "NTFeedTransformationFeedItem.m";
    v11 = 1024;
    v12 = 25;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTFeedTransformationFeedItem init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NTFeedTransformationFeedItem)initWithFeedItem:(id)a3 cacheExpirationDate:(id)a4
{
  id v6;
  id v7;
  NTFeedTransformationFeedItem *v8;
  uint64_t v9;
  NTPBFeedItem *feedItem;
  uint64_t v11;
  NSDate *cacheExpirationDate;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTFeedTransformationFeedItem initWithFeedItem:cacheExpirationDate:].cold.1();
  v14.receiver = self;
  v14.super_class = (Class)NTFeedTransformationFeedItem;
  v8 = -[NTFeedTransformationFeedItem init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    feedItem = v8->_feedItem;
    v8->_feedItem = (NTPBFeedItem *)v9;

    v11 = objc_msgSend(v7, "copy");
    cacheExpirationDate = v8->_cacheExpirationDate;
    v8->_cacheExpirationDate = (NSDate *)v11;

  }
  return v8;
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
    -[NTFeedTransformationFeedItem feedItem](self, "feedItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "feedItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      -[NTFeedTransformationFeedItem cacheExpirationDate](self, "cacheExpirationDate");
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

  -[NTFeedTransformationFeedItem feedItem](self, "feedItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[NTFeedTransformationFeedItem cacheExpirationDate](self, "cacheExpirationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[NTFeedTransformationFeedItem feedItem](self, "feedItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
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

  -[NTFeedTransformationFeedItem feedItem](self, "feedItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clusterID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDate)cacheCutoffTimeRelativeDate
{
  void *v2;
  void *v3;

  -[NTFeedTransformationFeedItem feedItem](self, "feedItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "publishDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (BOOL)needsFeedItemHeadlinesFetch
{
  return 1;
}

- (id)protoitemWithFetchedFeedItemHeadline:(id)a3
{
  id v4;
  NTTodayHeadlineProtoitem *v5;
  void *v6;
  NTTodayHeadlineProtoitem *v7;

  v4 = a3;
  v5 = [NTTodayHeadlineProtoitem alloc];
  -[NTFeedTransformationFeedItem identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NTTodayHeadlineProtoitem initWithIdentifier:headline:actionURL:](v5, "initWithIdentifier:headline:actionURL:", v6, v4, 0);

  return v7;
}

- (NSDate)cacheExpirationDate
{
  return self->_cacheExpirationDate;
}

- (NTPBFeedItem)feedItem
{
  return self->_feedItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedItem, 0);
  objc_storeStrong((id *)&self->_cacheExpirationDate, 0);
}

- (void)initWithFeedItem:cacheExpirationDate:.cold.1()
{
  void *v0;
  uint8_t buf[4];
  const char *v2;
  __int16 v3;
  char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "feedItem");
  *(_DWORD *)buf = 136315906;
  v2 = "-[NTFeedTransformationFeedItem initWithFeedItem:cacheExpirationDate:]";
  v3 = 2080;
  v4 = "NTFeedTransformationFeedItem.m";
  v5 = 1024;
  v6 = 30;
  v7 = 2114;
  v8 = v0;
  _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

}

@end
