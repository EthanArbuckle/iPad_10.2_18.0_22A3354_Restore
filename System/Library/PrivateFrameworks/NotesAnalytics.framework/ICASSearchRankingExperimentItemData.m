@implementation ICASSearchRankingExperimentItemData

- (ICASSearchRankingExperimentItemData)initWithRankingStrategyType:(id)a3 rank:(id)a4
{
  id v7;
  id v8;
  ICASSearchRankingExperimentItemData *v9;
  ICASSearchRankingExperimentItemData *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASSearchRankingExperimentItemData;
  v9 = -[ICASSearchRankingExperimentItemData init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rankingStrategyType, a3);
    objc_storeStrong((id *)&v10->_rank, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("SearchRankingExperimentItemData");
}

- (id)toDict
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("rankingStrategyType");
  -[ICASSearchRankingExperimentItemData rankingStrategyType](self, "rankingStrategyType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICASSearchRankingExperimentItemData rankingStrategyType](self, "rankingStrategyType");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = CFSTR("rank");
  v12[0] = v4;
  -[ICASSearchRankingExperimentItemData rank](self, "rank");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ICASSearchRankingExperimentItemData rank](self, "rank");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (ICASRankingStrategyType)rankingStrategyType
{
  return self->_rankingStrategyType;
}

- (NSNumber)rank
{
  return self->_rank;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rank, 0);
  objc_storeStrong((id *)&self->_rankingStrategyType, 0);
}

@end
