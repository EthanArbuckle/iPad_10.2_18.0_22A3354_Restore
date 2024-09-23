@implementation NTCatchUpOperationResults

- (NTCatchUpOperationResults)init
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
    v8 = "-[NTCatchUpOperationResults init]";
    v9 = 2080;
    v10 = "NTCatchUpOperation.m";
    v11 = 1024;
    v12 = 30;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTCatchUpOperationResults init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NTCatchUpOperationResults)initWithHeadlines:(id)a3 rankingFeedback:(id)a4 actionURLsByArticleID:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  NTCatchUpOperationResults *v13;
  _QWORD v15[4];
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTCatchUpOperationResults initWithHeadlines:rankingFeedback:actionURLsByArticleID:].cold.1();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __85__NTCatchUpOperationResults_initWithHeadlines_rankingFeedback_actionURLsByArticleID___block_invoke;
  v15[3] = &unk_24DB5EC60;
  v16 = v10;
  v11 = v10;
  objc_msgSend(v8, "fc_arrayByTransformingWithBlock:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[NTCatchUpOperationResults initWithItems:rankingFeedback:supplementalInterestToken:](self, "initWithItems:rankingFeedback:supplementalInterestToken:", v12, v9, 0);

  return v13;
}

NTFeedTransformationHeadlineItem *__85__NTCatchUpOperationResults_initWithHeadlines_rankingFeedback_actionURLsByArticleID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NTFeedTransformationHeadlineItem *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NTFeedTransformationHeadlineItem *v9;

  v3 = a2;
  v4 = [NTFeedTransformationHeadlineItem alloc];
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v3, "articleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NTFeedTransformationHeadlineItem initWithHeadline:cacheExpirationDate:actionURL:](v4, "initWithHeadline:cacheExpirationDate:actionURL:", v3, v5, v8);

  return v9;
}

- (NTCatchUpOperationResults)initWithFeedItems:(id)a3 supplementalInterestToken:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NTCatchUpOperationResults *v9;

  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTCatchUpOperationResults initWithFeedItems:supplementalInterestToken:].cold.1();
  objc_msgSend(v6, "fc_arrayByTransformingWithBlock:", &__block_literal_global_6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NTCatchUpOperationResults initWithItems:rankingFeedback:supplementalInterestToken:](self, "initWithItems:rankingFeedback:supplementalInterestToken:", v8, 0, v7);

  return v9;
}

NTFeedTransformationFeedItem *__73__NTCatchUpOperationResults_initWithFeedItems_supplementalInterestToken___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NTFeedTransformationFeedItem *v3;
  void *v4;
  NTFeedTransformationFeedItem *v5;

  v2 = a2;
  v3 = [NTFeedTransformationFeedItem alloc];
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NTFeedTransformationFeedItem initWithFeedItem:cacheExpirationDate:](v3, "initWithFeedItem:cacheExpirationDate:", v2, v4);

  return v5;
}

- (NTCatchUpOperationResults)initWithItems:(id)a3 rankingFeedback:(id)a4 supplementalInterestToken:(id)a5
{
  id v8;
  id v9;
  id v10;
  NTCatchUpOperationResults *v11;
  uint64_t v12;
  NSArray *items;
  uint64_t v14;
  SFRankingFeedback *rankingFeedback;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTCatchUpOperationResults initWithItems:rankingFeedback:supplementalInterestToken:].cold.1();
  v17.receiver = self;
  v17.super_class = (Class)NTCatchUpOperationResults;
  v11 = -[NTCatchUpOperationResults init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    items = v11->_items;
    v11->_items = (NSArray *)v12;

    v14 = objc_msgSend(v9, "copy");
    rankingFeedback = v11->_rankingFeedback;
    v11->_rankingFeedback = (SFRankingFeedback *)v14;

    objc_storeStrong((id *)&v11->_supplementalInterestToken, a5);
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NTCatchUpOperationResults *v4;
  void *v5;
  void *v6;
  void *v7;
  NTCatchUpOperationResults *v8;

  v4 = +[NTCatchUpOperationResults allocWithZone:](NTCatchUpOperationResults, "allocWithZone:", a3);
  -[NTCatchUpOperationResults items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTCatchUpOperationResults rankingFeedback](self, "rankingFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTCatchUpOperationResults supplementalInterestToken](self, "supplementalInterestToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NTCatchUpOperationResults initWithItems:rankingFeedback:supplementalInterestToken:](v4, "initWithItems:rankingFeedback:supplementalInterestToken:", v5, v6, v7);

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
    -[NTCatchUpOperationResults items](self, "items");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      -[NTCatchUpOperationResults rankingFeedback](self, "rankingFeedback");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "rankingFeedback");
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

  -[NTCatchUpOperationResults items](self, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[NTCatchUpOperationResults rankingFeedback](self, "rankingFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)copyWithItems:(id)a3
{
  id v4;
  NTCatchUpOperationResults *v5;
  void *v6;
  void *v7;
  NTCatchUpOperationResults *v8;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTCatchUpOperationResults copyWithItems:].cold.1();
  v5 = [NTCatchUpOperationResults alloc];
  -[NTCatchUpOperationResults rankingFeedback](self, "rankingFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTCatchUpOperationResults supplementalInterestToken](self, "supplementalInterestToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NTCatchUpOperationResults initWithItems:rankingFeedback:supplementalInterestToken:](v5, "initWithItems:rankingFeedback:supplementalInterestToken:", v4, v6, v7);

  return v8;
}

- (id)resultsByCombiningWithResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NTCatchUpOperationResults *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NTCatchUpOperationResults *v13;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTCatchUpOperationResults resultsByCombiningWithResults:].cold.3();
  -[NTCatchUpOperationResults rankingFeedback](self, "rankingFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTCatchUpOperationResults resultsByCombiningWithResults:].cold.2();
  objc_msgSend(v4, "rankingFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTCatchUpOperationResults resultsByCombiningWithResults:].cold.1();
  v7 = [NTCatchUpOperationResults alloc];
  v8 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(v4, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTCatchUpOperationResults items](self, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fc_arrayByAddingObjectsFromArray:toArray:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTCatchUpOperationResults supplementalInterestToken](self, "supplementalInterestToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[NTCatchUpOperationResults initWithItems:rankingFeedback:supplementalInterestToken:](v7, "initWithItems:rankingFeedback:supplementalInterestToken:", v11, 0, v12);

  return v13;
}

- (NSArray)items
{
  return self->_items;
}

- (SFRankingFeedback)rankingFeedback
{
  return self->_rankingFeedback;
}

- (NSObject)supplementalInterestToken
{
  return self->_supplementalInterestToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementalInterestToken, 0);
  objc_storeStrong((id *)&self->_rankingFeedback, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

- (void)initWithHeadlines:rankingFeedback:actionURLsByArticleID:.cold.1()
{
  void *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "headlines");
  v2[0] = 136315906;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);

  OUTLINED_FUNCTION_2();
}

- (void)initWithFeedItems:supplementalInterestToken:.cold.1()
{
  void *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "feedItems");
  v2[0] = 136315906;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);

  OUTLINED_FUNCTION_2();
}

- (void)initWithItems:rankingFeedback:supplementalInterestToken:.cold.1()
{
  void *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "items");
  v2[0] = 136315906;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);

  OUTLINED_FUNCTION_2();
}

- (void)copyWithItems:.cold.1()
{
  void *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "items");
  v2[0] = 136315906;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);

  OUTLINED_FUNCTION_2();
}

- (void)resultsByCombiningWithResults:.cold.1()
{
  void *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "otherResults.rankingFeedback == nil");
  v2[0] = 136315906;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);

  OUTLINED_FUNCTION_2();
}

- (void)resultsByCombiningWithResults:.cold.2()
{
  void *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "self.rankingFeedback == nil");
  v2[0] = 136315906;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);

  OUTLINED_FUNCTION_2();
}

- (void)resultsByCombiningWithResults:.cold.3()
{
  void *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "otherResults");
  v2[0] = 136315906;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);

  OUTLINED_FUNCTION_2();
}

@end
