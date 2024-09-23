@implementation MPRemoteCommandEvent(MPCAdditions)

- (id)nowPlayingContentItemID
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "mediaRemoteOptions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x24BE65928]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)userIdentity
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint8_t v9[8];
  uint64_t v10;

  objc_msgSend(a1, "mediaRemoteOptions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x24BE659E8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v10 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, &v10);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v10)
    {
      v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_ERROR, "❗️Cannot decode override user identity. Using active account.", v9, 2u);
      }

      objc_msgSend(MEMORY[0x24BEC8A58], "activeAccount");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = v3;
    }
    v7 = v6;

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEC8A58], "activeAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)mpc_clientPreferredLanguages
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDD1488], "mediaPlaybackCoreBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mediaRemoteOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE658B8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  v7 = (void *)MEMORY[0x24BDD1488];
  objc_msgSend(v2, "localizations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredLocalizationsFromArray:forPreferences:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
