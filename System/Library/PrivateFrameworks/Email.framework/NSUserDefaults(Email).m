@implementation NSUserDefaults(Email)

+ (uint64_t)em_linesOfPreview
{
  return objc_msgSend(a1, "_em_linesOfPreviewShouldReset:", 0);
}

+ (BOOL)em_defaultExistsForKey:()Email
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5 != 0;
}

+ (id)em_userDefaults
{
  if (em_userDefaults_onceToken != -1)
    dispatch_once(&em_userDefaults_onceToken, &__block_literal_global_56);
  return (id)em_userDefaults_userDefaults;
}

+ (uint64_t)_em_linesOfPreviewShouldReset:()Email
{
  uint64_t result;
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;

  result = _em_linesOfPreviewShouldReset__linesOfPreview;
  if (_em_linesOfPreviewShouldReset__linesOfPreview < 0 || a3)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("LinesOfPreview"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = objc_msgSend(v5, "intValue");
      _em_linesOfPreviewShouldReset__linesOfPreview = (int)v6;
      if ((v6 & 0x80000000) != 0)
      {
        v7 = 0;
      }
      else
      {
        if (v6 < 6)
        {
LABEL_10:

          return _em_linesOfPreviewShouldReset__linesOfPreview;
        }
        v7 = 5;
      }
    }
    else
    {
      v7 = 2;
    }
    _em_linesOfPreviewShouldReset__linesOfPreview = v7;
    goto LABEL_10;
  }
  return result;
}

+ (void)em_migrateDefault:()Email
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(v4, "valueForKey:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v3, "setObject:forKey:", v6, v7);
      objc_msgSend(v4, "removeObjectForKey:", v7);
    }

  }
}

+ (uint64_t)em_lockdownModeEnabled
{
  if (em_lockdownModeEnabled_onceToken != -1)
    dispatch_once(&em_lockdownModeEnabled_onceToken, &__block_literal_global_183);
  return em_lockdownModeEnabled_lockdownModeEnabled;
}

- (BOOL)shouldPresentRemoteContentOptionsSheet
{
  void *v0;
  char v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "integerForKey:", CFSTR("LoadRemoteContent-v2"));

  return (v1 & 3) == 0;
}

- (uint64_t)shouldPresentRemoteContentAlert
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("RemoteContentAlertDate"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "ef_isEarlierThanDate:", v2);

  return v3;
}

- (uint64_t)enableMailTrackingProtection:()Email
{
  uint64_t v3;

  if (a3)
    v3 = 1;
  else
    v3 = 9;
  return objc_msgSend(a1, "setInteger:forKey:", v3, CFSTR("LoadRemoteContent-v2"));
}

+ (uint64_t)em_resetLinesOfPreview
{
  return objc_msgSend(a1, "_em_linesOfPreviewShouldReset:", 1);
}

- (uint64_t)setPreferredGroupedSenderGrouping:()Email
{
  return objc_msgSend(a1, "setInteger:forKey:", a3, CFSTR("PreferredGroupedSenderGroupingLogic"));
}

- (uint64_t)preferredGroupedSenderGrouping
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "objectForKey:", CFSTR("PreferredGroupedSenderGroupingLogic"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "integerValue");
  else
    v3 = 0;

  return v3;
}

@end
