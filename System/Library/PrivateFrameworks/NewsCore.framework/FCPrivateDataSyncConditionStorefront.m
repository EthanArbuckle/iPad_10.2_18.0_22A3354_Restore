@implementation FCPrivateDataSyncConditionStorefront

- (BOOL)isSatisfied
{
  void *v2;
  char v3;

  +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isContentStoreFrontSupported");

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentStoreFrontID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%p condition=Storefront, storefrontID=%@>"), self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
