@implementation ATXCandidateAction

- (id)identifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ATXCandidate biomeStoreData](self, "biomeStoreData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXCandidate biomeStoreData](self, "biomeStoreData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%lu"), v5, objc_msgSend(v6, "hash"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)type
{
  return CFSTR("Action");
}

- (int64_t)suggestionExecutableType
{
  return 2;
}

@end
