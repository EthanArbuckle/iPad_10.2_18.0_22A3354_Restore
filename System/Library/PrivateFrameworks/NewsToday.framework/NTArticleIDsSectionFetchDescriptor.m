@implementation NTArticleIDsSectionFetchDescriptor

- (NTArticleIDsSectionFetchDescriptor)init
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
    v8 = "-[NTArticleIDsSectionFetchDescriptor init]";
    v9 = 2080;
    v10 = "NTArticleIDsSectionFetchDescriptor.m";
    v11 = 1024;
    v12 = 24;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTArticleIDsSectionFetchDescriptor init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NTArticleIDsSectionFetchDescriptor)initWithArticleIDsConfiguration:(id)a3
{
  id v4;
  NTArticleIDsSectionFetchDescriptor *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  NTItemsSectionFetchDescriptor *v14;
  NTSectionFetchDescriptor *privateFetchDescriptor;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTArticleIDsSectionFetchDescriptor initWithArticleIDsConfiguration:].cold.1();
  v21.receiver = self;
  v21.super_class = (Class)NTArticleIDsSectionFetchDescriptor;
  v5 = -[NTArticleIDsSectionFetchDescriptor init](&v21, sel_init);
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v4, "articles", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          v13 = (void *)objc_opt_new();
          objc_msgSend(v13, "setItemType:", 0);
          objc_msgSend(v13, "setArticle:", v12);
          objc_msgSend(v6, "addItems:", v13);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v9);
    }

    v14 = -[NTItemsSectionFetchDescriptor initWithItemsConfiguration:]([NTItemsSectionFetchDescriptor alloc], "initWithItemsConfiguration:", v6);
    privateFetchDescriptor = v5->_privateFetchDescriptor;
    v5->_privateFetchDescriptor = (NTSectionFetchDescriptor *)v14;

  }
  return v5;
}

- (void)configureCatchUpOperationWithFetchRequest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NTArticleIDsSectionFetchDescriptor privateFetchDescriptor](self, "privateFetchDescriptor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configureCatchUpOperationWithFetchRequest:", v4);

}

- (id)assembleResultsWithCatchUpOperation:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NTArticleIDsSectionFetchDescriptor privateFetchDescriptor](self, "privateFetchDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assembleResultsWithCatchUpOperation:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)incrementalSortTransformationWithFeedPersonalizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NTArticleIDsSectionFetchDescriptor privateFetchDescriptor](self, "privateFetchDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "incrementalSortTransformationWithFeedPersonalizer:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)incrementalLimitTransformationWithFeedPersonalizer:(id)a3 limit:(unint64_t)a4 priorFeedItems:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a3;
  -[NTArticleIDsSectionFetchDescriptor privateFetchDescriptor](self, "privateFetchDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "incrementalLimitTransformationWithFeedPersonalizer:limit:priorFeedItems:", v9, a4, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NTSectionFetchDescriptor)privateFetchDescriptor
{
  return self->_privateFetchDescriptor;
}

- (void)setPrivateFetchDescriptor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateFetchDescriptor, 0);
}

- (void)initWithArticleIDsConfiguration:.cold.1()
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
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "articleIDsConfiguration");
  *(_DWORD *)buf = 136315906;
  v2 = "-[NTArticleIDsSectionFetchDescriptor initWithArticleIDsConfiguration:]";
  v3 = 2080;
  v4 = "NTArticleIDsSectionFetchDescriptor.m";
  v5 = 1024;
  v6 = 29;
  v7 = 2114;
  v8 = v0;
  _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

}

@end
