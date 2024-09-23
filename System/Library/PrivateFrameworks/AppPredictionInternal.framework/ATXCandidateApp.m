@implementation ATXCandidateApp

- (id)identifier
{
  void *v2;
  void *v3;

  -[ATXCandidate biomeStoreData](self, "biomeStoreData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)type
{
  return CFSTR("App");
}

- (int64_t)suggestionExecutableType
{
  return 1;
}

@end
