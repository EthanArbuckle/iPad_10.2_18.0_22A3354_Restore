@implementation NTArticleListSectionFetchDescriptor

- (NTArticleListSectionFetchDescriptor)init
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
    v8 = "-[NTArticleListSectionFetchDescriptor init]";
    v9 = 2080;
    v10 = "NTArticleListSectionFetchDescriptor.m";
    v11 = 1024;
    v12 = 24;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTArticleListSectionFetchDescriptor init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NTArticleListSectionFetchDescriptor)initWithArticleListConfiguration:(id)a3
{
  id v4;
  NTArticleListSectionFetchDescriptor *v5;
  uint64_t v6;
  NTPBArticleListTodaySectionSpecificConfig *articleListRequest;
  objc_super v9;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTArticleListSectionFetchDescriptor initWithArticleListConfiguration:].cold.1();
  v9.receiver = self;
  v9.super_class = (Class)NTArticleListSectionFetchDescriptor;
  v5 = -[NTArticleListSectionFetchDescriptor init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    articleListRequest = v5->_articleListRequest;
    v5->_articleListRequest = (NTPBArticleListTodaySectionSpecificConfig *)v6;

  }
  return v5;
}

- (void)configureCatchUpOperationWithFetchRequest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NTArticleListSectionFetchDescriptor articleListRequest](self, "articleListRequest");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addArticleListRequest:", v5);

}

- (id)assembleResultsWithCatchUpOperation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "resultsByArticleListID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTArticleListSectionFetchDescriptor articleListRequest](self, "articleListRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "articleListID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)incrementalSortTransformationWithFeedPersonalizer:(id)a3
{
  void *v3;
  NTFeedTransformationItemFeedTransformation *v4;

  objc_msgSend(MEMORY[0x24BE6CBB8], "transformationWithSortMethod:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NTFeedTransformationItemFeedTransformation initWithFeedItemTransformation:]([NTFeedTransformationItemFeedTransformation alloc], "initWithFeedItemTransformation:", v3);

  return v4;
}

- (id)incrementalLimitTransformationWithFeedPersonalizer:(id)a3 limit:(unint64_t)a4 priorFeedItems:(id)a5
{
  void *v5;
  NTFeedTransformationItemFeedTransformation *v6;

  objc_msgSend(MEMORY[0x24BE6CBA0], "transformationWithLimit:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NTFeedTransformationItemFeedTransformation initWithFeedItemTransformation:]([NTFeedTransformationItemFeedTransformation alloc], "initWithFeedItemTransformation:", v5);

  return v6;
}

- (NTPBArticleListTodaySectionSpecificConfig)articleListRequest
{
  return self->_articleListRequest;
}

- (void)setArticleListRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleListRequest, 0);
}

- (void)initWithArticleListConfiguration:.cold.1()
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
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "articleListConfiguration");
  *(_DWORD *)buf = 136315906;
  v2 = "-[NTArticleListSectionFetchDescriptor initWithArticleListConfiguration:]";
  v3 = 2080;
  v4 = "NTArticleListSectionFetchDescriptor.m";
  v5 = 1024;
  v6 = 29;
  v7 = 2114;
  v8 = v0;
  _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

}

@end
