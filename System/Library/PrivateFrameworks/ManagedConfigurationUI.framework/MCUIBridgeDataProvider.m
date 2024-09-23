@implementation MCUIBridgeDataProvider

- (BOOL)isProvisionallyEnrolled
{
  return 0;
}

- (BOOL)isPasscodeSet
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPasscodeSet");

  return v3;
}

- (id)installedMDMProfileIdentifier
{
  void *v2;
  void *v3;

  +[MCUIWatchManager shared](MCUIWatchManager, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedMDMProfileIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)installedProfileWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[MCUIWatchManager shared](MCUIWatchManager, "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cachedProfileForIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)payloadsSummaryForProfile:(id)a3 showManagedPayloads:(BOOL)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  +[MCUIWatchManager shared](MCUIWatchManager, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "cachedProfileSummaryForIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)managedAppsUninstalledOnMDMRemoval
{
  void *v2;
  void *v3;

  +[MCUIWatchManager shared](MCUIWatchManager, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedAppsUninstalledOnMDMRemoval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)rmAccount
{
  void *v2;
  void *v3;

  +[MCUIWatchManager shared](MCUIWatchManager, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rmAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updateProfileWithIdentifier:(id)a3 interactionDelegate:(id)a4
{
  NSLog(CFSTR("MCUIBridgeDataProvider does not support updateProfileWithIdentifier: %@"), a2, a3, a4, a3);
}

- (void)unenrollWithCompletionBlock:(id)a3
{
  NSLog(CFSTR("MCUIBridgeDataProvider does not support unenrollWithCompletionBlock"), a2, a3);
}

- (id)rmSpecifierProviderForProfileIdentifier:(id)a3 scope:(int64_t)a4
{
  id v4;
  MCUIBridgeRMConfigurationsDataProvider *v5;
  void *v6;

  v4 = a3;
  v5 = -[MCUIBridgeRMConfigurationsDataProvider initWithProfileIdentifier:]([MCUIBridgeRMConfigurationsDataProvider alloc], "initWithProfileIdentifier:", v4);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1BFF0]), "initWithAccount:rmDataProvider:", 0, v5);
  return v6;
}

@end
