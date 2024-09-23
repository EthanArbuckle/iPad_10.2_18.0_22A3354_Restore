@implementation ATXCandidateMinimalAction

- (id)identifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ATXCandidate biomeStoreData](self, "biomeStoreData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXCandidate biomeStoreData](self, "biomeStoreData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXCandidate biomeStoreData](self, "biomeStoreData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithLongLong:", objc_msgSend(v9, "paramHash"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@:%lld"), v5, v7, objc_msgSend(v10, "longLongValue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)type
{
  return CFSTR("MinimalAction");
}

- (int64_t)suggestionExecutableType
{
  return 2;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  -[ATXCandidate biomeStoreData](self, "biomeStoreData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionFromDatastoreLookup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "actionTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionSubtitle");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = CFSTR("<no subtitle>");
  if (v6)
    v8 = (const __CFString *)v6;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ | %@"), v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)detailedDescription
{
  void *v2;
  void *v3;
  void *v4;

  -[ATXCandidate biomeStoreData](self, "biomeStoreData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionFromDatastoreLookup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
