@implementation FCPrivateDataSyncConditionAppState

- (BOOL)isSatisfied
{
  void *v2;
  char v3;

  -[FCPrivateDataSyncConditionAppState _appState](self, "_appState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isRestricted") & 1) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(v2, "isInstalled");

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;

  -[FCPrivateDataSyncConditionAppState _appState](self, "_appState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  if (objc_msgSend(v3, "isRestricted"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  if (objc_msgSend(v3, "isBlocked"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%p condition=AppState, restricted=%@, blocked=%@>"), self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_appState
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", CFSTR("com.apple.news"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
