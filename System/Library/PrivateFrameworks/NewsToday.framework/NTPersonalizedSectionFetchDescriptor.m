@implementation NTPersonalizedSectionFetchDescriptor

- (NTPersonalizedSectionFetchDescriptor)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPersonalizedSectionFetchDescriptor;
  return -[NTPersonalizedSectionFetchDescriptor init](&v3, sel_init);
}

- (NTPersonalizedSectionFetchDescriptor)initWithPersonalizedConfiguration:(id)a3
{
  id v4;
  NTPersonalizedSectionFetchDescriptor *v5;
  uint64_t v6;
  NTPBPersonalizedTodaySectionSpecificConfig *personalizedConfiguration;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NTCatchUpOperationArticleIDsRequest *mandatoryArticleIDsRequest;
  void *v13;
  void *v14;
  uint64_t v15;
  NTCatchUpOperationArticleIDsRequest *personalizedArticleIDsRequest;
  objc_super v18;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTPersonalizedSectionFetchDescriptor initWithPersonalizedConfiguration:].cold.1();
  v18.receiver = self;
  v18.super_class = (Class)NTPersonalizedSectionFetchDescriptor;
  v5 = -[NTPersonalizedSectionFetchDescriptor init](&v18, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    personalizedConfiguration = v5->_personalizedConfiguration;
    v5->_personalizedConfiguration = (NTPBPersonalizedTodaySectionSpecificConfig *)v6;

    objc_msgSend(v4, "mandatoryArticles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = (void *)MEMORY[0x24BDBD1A8];
    if (!v8)
      v8 = (void *)MEMORY[0x24BDBD1A8];
    NTArticleIDsRequestWithArticles(v8);
    v11 = objc_claimAutoreleasedReturnValue();
    mandatoryArticleIDsRequest = v5->_mandatoryArticleIDsRequest;
    v5->_mandatoryArticleIDsRequest = (NTCatchUpOperationArticleIDsRequest *)v11;

    objc_msgSend(v4, "personalizedArticles");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (!v13)
      v13 = v10;
    NTArticleIDsRequestWithArticles(v13);
    v15 = objc_claimAutoreleasedReturnValue();
    personalizedArticleIDsRequest = v5->_personalizedArticleIDsRequest;
    v5->_personalizedArticleIDsRequest = (NTCatchUpOperationArticleIDsRequest *)v15;

  }
  return v5;
}

- (void)configureCatchUpOperationWithFetchRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[NTPersonalizedSectionFetchDescriptor mandatoryArticleIDsRequest](self, "mandatoryArticleIDsRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addArticleIDsRequest:", v5);

  -[NTPersonalizedSectionFetchDescriptor personalizedArticleIDsRequest](self, "personalizedArticleIDsRequest");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addArticleIDsRequest:", v6);

}

- (id)assembleResultsWithCatchUpOperation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a3, "resultsByArticleIDsRequestID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPersonalizedSectionFetchDescriptor mandatoryArticleIDsRequest](self, "mandatoryArticleIDsRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTPersonalizedSectionFetchDescriptor personalizedArticleIDsRequest](self, "personalizedArticleIDsRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "resultsByCombiningWithResults:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)incrementalSortTransformationWithFeedPersonalizer:(id)a3
{
  void *v4;
  NTPersonalizedSectionSortTransformation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NTPersonalizedSectionSortTransformation *v10;
  NTFeedTransformationItemFeedTransformation *v11;

  objc_msgSend(MEMORY[0x24BE6CBB0], "transformationWithPersonalizer:feedItemScores:sortOptions:configurationSet:", a3, 0, 2, 16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [NTPersonalizedSectionSortTransformation alloc];
  -[NTPersonalizedSectionFetchDescriptor mandatoryArticleIDsRequest](self, "mandatoryArticleIDsRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "articleIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPersonalizedSectionFetchDescriptor personalizedArticleIDsRequest](self, "personalizedArticleIDsRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "articleIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[NTPersonalizedSectionSortTransformation initWithMandatoryArticleIDs:personalizedArticleIDs:sortTransformation:](v5, "initWithMandatoryArticleIDs:personalizedArticleIDs:sortTransformation:", v7, v9, v4);

  v11 = -[NTFeedTransformationItemFeedTransformation initWithFeedItemTransformation:]([NTFeedTransformationItemFeedTransformation alloc], "initWithFeedItemTransformation:", v10);
  return v11;
}

- (id)incrementalLimitTransformationWithFeedPersonalizer:(id)a3 limit:(unint64_t)a4 priorFeedItems:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  NTPersonalizedSectionLimitTransformation *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  NTPersonalizedSectionLimitTransformation *v18;
  NTFeedTransformationItemFeedTransformation *v19;

  v7 = a5;
  -[NTPersonalizedSectionFetchDescriptor personalizedConfiguration](self, "personalizedConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "maxArticlesShown");
  v10 = objc_msgSend(v7, "count");

  v11 = v9 - v10;
  v12 = [NTPersonalizedSectionLimitTransformation alloc];
  -[NTPersonalizedSectionFetchDescriptor mandatoryArticleIDsRequest](self, "mandatoryArticleIDsRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "articleIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPersonalizedSectionFetchDescriptor personalizedArticleIDsRequest](self, "personalizedArticleIDsRequest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "articleIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 >= a4)
    v17 = a4;
  else
    v17 = v11;
  v18 = -[NTPersonalizedSectionLimitTransformation initWithMandatoryArticleIDs:personalizedArticleIDs:limit:](v12, "initWithMandatoryArticleIDs:personalizedArticleIDs:limit:", v14, v16, v17);

  v19 = -[NTFeedTransformationItemFeedTransformation initWithFeedItemTransformation:]([NTFeedTransformationItemFeedTransformation alloc], "initWithFeedItemTransformation:", v18);
  return v19;
}

- (NTPBPersonalizedTodaySectionSpecificConfig)personalizedConfiguration
{
  return self->_personalizedConfiguration;
}

- (void)setPersonalizedConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NTCatchUpOperationArticleIDsRequest)mandatoryArticleIDsRequest
{
  return self->_mandatoryArticleIDsRequest;
}

- (void)setMandatoryArticleIDsRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NTCatchUpOperationArticleIDsRequest)personalizedArticleIDsRequest
{
  return self->_personalizedArticleIDsRequest;
}

- (void)setPersonalizedArticleIDsRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalizedArticleIDsRequest, 0);
  objc_storeStrong((id *)&self->_mandatoryArticleIDsRequest, 0);
  objc_storeStrong((id *)&self->_personalizedConfiguration, 0);
}

- (void)initWithPersonalizedConfiguration:.cold.1()
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
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "personalizedConfiguration");
  *(_DWORD *)buf = 136315906;
  v2 = "-[NTPersonalizedSectionFetchDescriptor initWithPersonalizedConfiguration:]";
  v3 = 2080;
  v4 = "NTPersonalizedSectionFetchDescriptor.m";
  v5 = 1024;
  v6 = 34;
  v7 = 2114;
  v8 = v0;
  _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

}

@end
