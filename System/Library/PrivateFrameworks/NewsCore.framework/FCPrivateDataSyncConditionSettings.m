@implementation FCPrivateDataSyncConditionSettings

- (id)description
{
  void *v3;
  void *v4;
  int v5;
  const __CFString *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPrivateDataSyncingEnabled");
  v6 = CFSTR("NO");
  if (v5)
    v6 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%p condition=Settings, enabled=%@>"), self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isSatisfied
{
  void *v2;
  char v3;

  +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPrivateDataSyncingEnabled");

  return v3;
}

@end
