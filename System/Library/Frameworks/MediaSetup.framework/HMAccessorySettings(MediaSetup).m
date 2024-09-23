@implementation HMAccessorySettings(MediaSetup)

- (uint64_t)isAllowExplicitContentEnabled
{
  return objc_msgSend(a1, "_settingForKeyPath:", CFSTR("root.music.allowExplicitContent"));
}

- (uint64_t)isUpdateListeningHistoryEnabled
{
  return objc_msgSend(a1, "_settingForKeyPath:", CFSTR("root.music.playbackInfluencesForYou"));
}

- (uint64_t)_settingForKeyPath:()MediaSetup
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;

  v4 = a3;
  objc_msgSend(a1, "_getMusicGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    findSettingWithKeyPath(v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

  }
  else
  {
    _MSLogingFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[HMAccessorySettings(MediaSetup) _settingForKeyPath:].cold.1(v9);

    v8 = 0;
  }

  return v8;
}

- (id)_getMusicGroup
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a1, "rootGroup", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "groups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v7, "keyPath");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("root.music"));

        if (v9)
        {
          v10 = v7;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)_settingForKeyPath:()MediaSetup .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_219CD8000, log, OS_LOG_TYPE_ERROR, "Failed to find Music Group in Accessory Settings", v1, 2u);
}

@end
