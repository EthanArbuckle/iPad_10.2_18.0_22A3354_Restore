@implementation HMDResidentSyncServerDefaultDataSource

- (int64_t)maximumTransactionsForSparseUpdate
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("residentSyncMaximumTransactionsForSparseUpdate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

- (int64_t)maximumTransactionsForStoreChange
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("residentSyncMaximumTransactionsForStoreChange"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  if (v5 < 0)
    return 1;
  else
    return v5;
}

@end
