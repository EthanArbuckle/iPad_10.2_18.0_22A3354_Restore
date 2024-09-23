@implementation NTItemsSectionFetchDescriptor

- (NTItemsSectionFetchDescriptor)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTItemsSectionFetchDescriptor;
  return -[NTItemsSectionFetchDescriptor init](&v3, sel_init);
}

- (NTItemsSectionFetchDescriptor)initWithItemsConfiguration:(id)a3
{
  id v4;
  NTItemsSectionFetchDescriptor *v5;
  uint64_t v6;
  NTPBItemsTodaySectionSpecificConfig *itemsConfiguration;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  NTCatchUpOperationArticleIDsRequest *itemsArticlesRequest;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTItemsSectionFetchDescriptor initWithItemsConfiguration:].cold.1();
  v23.receiver = self;
  v23.super_class = (Class)NTItemsSectionFetchDescriptor;
  v5 = -[NTItemsSectionFetchDescriptor init](&v23, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    itemsConfiguration = v5->_itemsConfiguration;
    v5->_itemsConfiguration = (NTPBItemsTodaySectionSpecificConfig *)v6;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "items");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (!objc_msgSend(v14, "itemType"))
          {
            objc_msgSend(v14, "article");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v15);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v11);
    }
    NTArticleIDsRequestWithArticles(v8);
    v16 = objc_claimAutoreleasedReturnValue();
    itemsArticlesRequest = v5->_itemsArticlesRequest;
    v5->_itemsArticlesRequest = (NTCatchUpOperationArticleIDsRequest *)v16;

  }
  return v5;
}

- (void)configureCatchUpOperationWithFetchRequest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NTItemsSectionFetchDescriptor itemsArticlesRequest](self, "itemsArticlesRequest");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addArticleIDsRequest:", v5);

}

- (id)assembleResultsWithCatchUpOperation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NTCatchUpOperationResults *v7;
  NTCatchUpOperationResults *v8;
  void *v9;
  void *v10;
  NTCatchUpOperationResults *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  NTCatchUpOperationResults *v16;

  objc_msgSend(a3, "resultsByArticleIDsRequestID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTItemsSectionFetchDescriptor itemsArticlesRequest](self, "itemsArticlesRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v7 = (NTCatchUpOperationResults *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = [NTCatchUpOperationResults alloc];
    v7 = -[NTCatchUpOperationResults initWithItems:rankingFeedback:supplementalInterestToken:](v8, "initWithItems:rankingFeedback:supplementalInterestToken:", MEMORY[0x24BDBD1A8], 0, 0);
  }
  -[NTItemsSectionFetchDescriptor itemsConfiguration](self, "itemsConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __69__NTItemsSectionFetchDescriptor_assembleResultsWithCatchUpOperation___block_invoke;
  v15[3] = &unk_24DB5E980;
  v16 = v7;
  v11 = v7;
  objc_msgSend(v10, "fc_arrayByTransformingWithBlock:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[NTCatchUpOperationResults copyWithItems:](v11, "copyWithItems:", v12);
  return v13;
}

id __69__NTItemsSectionFetchDescriptor_assembleResultsWithCatchUpOperation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  if (objc_msgSend(v3, "itemType"))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "items");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __69__NTItemsSectionFetchDescriptor_assembleResultsWithCatchUpOperation___block_invoke_2;
    v7[3] = &unk_24DB5E958;
    v8 = v3;
    objc_msgSend(v5, "fc_firstObjectPassingTest:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

uint64_t __69__NTItemsSectionFetchDescriptor_assembleResultsWithCatchUpOperation___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "feedTransformationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "articleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "article");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "articleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  return v7;
}

- (id)incrementalSortTransformationWithFeedPersonalizer:(id)a3
{
  return -[NTFeedTransformationLimit initWithLimit:]([NTFeedTransformationLimit alloc], "initWithLimit:", -1);
}

- (id)incrementalLimitTransformationWithFeedPersonalizer:(id)a3 limit:(unint64_t)a4 priorFeedItems:(id)a5
{
  return -[NTFeedTransformationLimit initWithLimit:]([NTFeedTransformationLimit alloc], "initWithLimit:", a4);
}

- (NTPBItemsTodaySectionSpecificConfig)itemsConfiguration
{
  return self->_itemsConfiguration;
}

- (void)setItemsConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NTCatchUpOperationArticleIDsRequest)itemsArticlesRequest
{
  return self->_itemsArticlesRequest;
}

- (void)setItemsArticlesRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsArticlesRequest, 0);
  objc_storeStrong((id *)&self->_itemsConfiguration, 0);
}

- (void)initWithItemsConfiguration:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"itemsConfiguration", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
