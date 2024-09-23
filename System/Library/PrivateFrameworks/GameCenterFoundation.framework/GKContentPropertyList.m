@implementation GKContentPropertyList

+ (id)localPropertyListForGameDescriptor:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v10;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "_rootDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("GKPropertyListVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0 && (int)objc_msgSend(v7, "intValue") <= 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundle-id"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBundleID:", v10);

    v8 = v5;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_mainBundle
{
  void *v3;
  void *v4;
  void *v5;

  +[GKApplicationWorkspace defaultWorkspace](GKApplicationWorkspace, "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationProxyForBundleID:", self->_bundleID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)localizedStringForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[GKContentPropertyList _mainBundle](self, "_mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_gkSystemLocalizedStringForKey:value:table:", v4, v4, CFSTR("GKGameCenter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)imageNameForDashboardLogo
{
  void *v2;
  void *v3;
  void *v4;

  -[GKContentPropertyList _rootDictionary](self, "_rootDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("GKDashboardImages"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("logoImageName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_rootDictionary
{
  void *v3;
  void *v4;
  void *v5;
  NSString *v6;
  void *v7;
  NSString *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  NSString *bundleID;
  NSObject *v14;
  id v15;
  id v17;
  uint8_t buf[4];
  NSString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[GKContentPropertyList root](self, "root");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", self->_bundleID);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "pathForResource:ofType:", CFSTR("GKGameCenterContent"), CFSTR("plist"));
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v17 = 0;
        objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v7, 0, 0, &v17);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (NSString *)v17;
        if (!v3)
        {
          v9 = os_log_GKGeneral;
          if (!os_log_GKGeneral)
          {
            v10 = GKOSLoggers();
            v9 = os_log_GKGeneral;
          }
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v19 = v8;
            _os_log_impl(&dword_1BCDE3000, v9, OS_LOG_TYPE_INFO, "reading content plist: %@", buf, 0xCu);
          }
        }
        -[GKContentPropertyList setRoot:](self, "setRoot:", v3);

      }
      else
      {
        v14 = os_log_GKGeneral;
        if (!os_log_GKGeneral)
        {
          v15 = GKOSLoggers();
          v14 = os_log_GKGeneral;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v19 = v6;
          _os_log_impl(&dword_1BCDE3000, v14, OS_LOG_TYPE_INFO, "can't read file from path: %@", buf, 0xCu);
        }
        v3 = 0;
      }

    }
    else
    {
      v11 = os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        v12 = GKOSLoggers();
        v11 = os_log_GKGeneral;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        bundleID = self->_bundleID;
        *(_DWORD *)buf = 138412290;
        v19 = bundleID;
        _os_log_impl(&dword_1BCDE3000, v11, OS_LOG_TYPE_INFO, "no bundle for bundleID: %@", buf, 0xCu);
      }
      v3 = 0;
    }

  }
  return v3;
}

- (id)leaderboardDescriptions
{
  void *v2;
  void *v3;

  -[GKContentPropertyList _rootDictionary](self, "_rootDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("GKLeaderboards"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)leaderboardSetDescriptions
{
  void *v2;
  void *v3;

  -[GKContentPropertyList _rootDictionary](self, "_rootDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("GKLeaderboardSets"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)achievementDescriptionForIdentifier:(id)a3
{
  id v4;
  NSDictionary *achievementsByIdentifier;
  void *v6;
  NSDictionary *v7;
  NSDictionary *v8;
  void *v9;

  v4 = a3;
  achievementsByIdentifier = self->_achievementsByIdentifier;
  if (!achievementsByIdentifier)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_root, "objectForKeyedSubscript:", CFSTR("GKAchievements"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_gkMapDictionaryWithKeyPath:", CFSTR("identifier"));
    v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v8 = self->_achievementsByIdentifier;
    self->_achievementsByIdentifier = v7;

    achievementsByIdentifier = self->_achievementsByIdentifier;
  }
  -[NSDictionary objectForKeyedSubscript:](achievementsByIdentifier, "objectForKeyedSubscript:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)leaderboardDescriptionForIdentifier:(id)a3
{
  id v4;
  NSDictionary *leaderboardsByIdentifier;
  void *v6;
  NSDictionary *v7;
  NSDictionary *v8;
  void *v9;

  v4 = a3;
  leaderboardsByIdentifier = self->_leaderboardsByIdentifier;
  if (!leaderboardsByIdentifier)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_root, "objectForKeyedSubscript:", CFSTR("GKLeaderboards"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_gkMapDictionaryWithKeyPath:", CFSTR("identifier"));
    v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v8 = self->_leaderboardsByIdentifier;
    self->_leaderboardsByIdentifier = v7;

    leaderboardsByIdentifier = self->_leaderboardsByIdentifier;
  }
  -[NSDictionary objectForKeyedSubscript:](leaderboardsByIdentifier, "objectForKeyedSubscript:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)leaderboardSetDescriptionForIdentifier:(id)a3
{
  id v4;
  NSDictionary *leaderboardSetsByIdentifier;
  void *v6;
  NSDictionary *v7;
  NSDictionary *v8;
  void *v9;

  v4 = a3;
  leaderboardSetsByIdentifier = self->_leaderboardSetsByIdentifier;
  if (!leaderboardSetsByIdentifier)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_root, "objectForKeyedSubscript:", CFSTR("GKLeaderboardSets"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_gkMapDictionaryWithKeyPath:", CFSTR("identifier"));
    v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v8 = self->_leaderboardSetsByIdentifier;
    self->_leaderboardSetsByIdentifier = v7;

    leaderboardSetsByIdentifier = self->_leaderboardSetsByIdentifier;
  }
  -[NSDictionary objectForKeyedSubscript:](leaderboardSetsByIdentifier, "objectForKeyedSubscript:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)achievementDescriptions
{
  void *v2;
  void *v3;

  -[GKContentPropertyList _rootDictionary](self, "_rootDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("GKAchievements"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSDictionary)root
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRoot:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leaderboardSetsByIdentifier, 0);
  objc_storeStrong((id *)&self->_leaderboardsByIdentifier, 0);
  objc_storeStrong((id *)&self->_achievementsByIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_root, 0);
}

@end
