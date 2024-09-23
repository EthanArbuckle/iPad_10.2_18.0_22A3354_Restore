@implementation NSMutableURLRequest(GKAdditions)

+ (uint64_t)hashForPlayerID:()GKAdditions
{
  uint64_t v3;
  unint64_t v4;

  v3 = objc_msgSend(a3, "hash");
  if (v3 >= 0)
    v4 = v3;
  else
    v4 = -v3;
  return (v4 % 0xF4240) + 1000000;
}

- (void)setPlayerID:()GKAdditions hash:authToken:
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a5;
  objc_msgSend(a1, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_gkIsSecure");

  if (v9 && v11 && v7)
  {
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v11, CFSTR("x-gk-player-id"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend((id)objc_opt_class(), "hashForPlayerID:", v11));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v10, CFSTR("x-gk-player-id-hash"));

    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v7, CFSTR("x-gk-auth-token"));
  }

}

- (void)setGameDescriptor:()GKAdditions
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  objc_msgSend(a1, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_gkIsSecure");

  if (v17 && v5)
  {
    objc_msgSend(v17, "objectForKey:", CFSTR("adam-id"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v6, "stringValue");
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }
    if (v6)
      objc_msgSend(a1, "setValue:forHTTPHeaderField:", v6, CFSTR("x-gk-adam-id"));
    objc_msgSend(v17, "objectForKey:", CFSTR("external-version"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v8, "stringValue");
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
    }
    if (v8)
      objc_msgSend(a1, "setValue:forHTTPHeaderField:", v8, CFSTR("x-gk-external-version"));
    objc_msgSend(v17, "objectForKey:", CFSTR("parent-bundle-id"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10
      || (objc_msgSend(v17, "objectForKey:", CFSTR("bundle-id")),
          (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(a1, "setValue:forHTTPHeaderField:", v10, CFSTR("x-gk-bundle-id"));
    }
    objc_msgSend(v17, "objectForKey:", CFSTR("bundle-version"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(a1, "setValue:forHTTPHeaderField:", v11, CFSTR("x-gk-bundle-version"));
    objc_msgSend(v17, "objectForKey:", CFSTR("platform"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(a1, "setValue:forHTTPHeaderField:", v12, CFSTR("x-gk-platform"));
    objc_msgSend(v17, "objectForKey:", CFSTR("short-bundle-version"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(a1, "setValue:forHTTPHeaderField:", v13, CFSTR("x-gk-short-bundle-version"));
    }
    else
    {
      +[GKApplicationWorkspace defaultWorkspace](GKApplicationWorkspace, "defaultWorkspace");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "applicationProxyForBundleID:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isInstalled") && (objc_msgSend(v15, "isRestricted") & 1) == 0)
      {
        objc_msgSend(v15, "bundleShortVersion");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(a1, "setValue:forHTTPHeaderField:", v16, CFSTR("x-gk-short-bundle-version"));

      }
    }

  }
}

- (void)setStoreMode:()GKAdditions
{
  void *v4;
  int v5;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  objc_msgSend(a1, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_gkIsSecure");

  if (v5)
  {
    if (!v8)
    {
      +[GKPreferences shared](GKPreferences, "shared");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isStoreDemoModeEnabled");

      if ((v7 & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
    if (objc_msgSend(v8, "isStoreDemoModeEnabled"))
LABEL_4:
      objc_msgSend(a1, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("x-gk-store-mode"));
  }
LABEL_5:

}

- (void)setRestrictions:()GKAdditions
{
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  id v10;

  v10 = a3;
  objc_msgSend(a1, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_gkIsSecure");

  if (v5)
  {
    if (v10)
    {
      if (objc_msgSend(v10, "isMultiplayerGamingRestricted"))
        objc_msgSend(a1, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("x-gk-restrict-multiplayer"));
      if ((objc_msgSend(v10, "isAddingFriendsRestricted") & 1) != 0)
LABEL_6:
        objc_msgSend(a1, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("x-gk-restrict-friend-add"));
    }
    else
    {
      +[GKPreferences shared](GKPreferences, "shared");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isMultiplayerGamingRestricted");

      if (v7)
        objc_msgSend(a1, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("x-gk-restrict-multiplayer"));
      +[GKPreferences shared](GKPreferences, "shared");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isAddingFriendsRestricted");

      if (v9)
        goto LABEL_6;
    }
  }

}

- (void)setDeviceUniqueID
{
  void *v2;
  int v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_gkIsSecure");

  if (v3)
  {
    +[GKDevice currentDevice](GKDevice, "currentDevice");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "udid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v4, CFSTR("x-gk-udid"));

  }
}

- (void)setPushToken:()GKAdditions
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(a1, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_gkIsSecure");

  v6 = v8;
  if (v8 && v5)
  {
    objc_msgSend(v8, "_gkAsHexString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v7, CFSTR("x-gk-push-token"));

    v6 = v8;
  }

}

- (void)setInternal:()GKAdditions
{
  void *v5;
  int v6;
  void *v7;
  id v8;

  objc_msgSend(a1, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_gkIsSecure");

  if (v6)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setValue:forHTTPHeaderField:", v7, CFSTR("x-gk-internal"));

    }
  }
}

- (uint64_t)setLocale:()GKAdditions
{
  return objc_msgSend(a1, "setLocale:isOverridingUsersPreferredLanguage:", a3, 0);
}

- (void)setLocale:()GKAdditions isOverridingUsersPreferredLanguage:
{
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  if (a3 && (a4 & 1) != 0)
  {
    objc_msgSend(a3, "localeIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB34D0];
    v8 = a3;
    objc_msgSend(v7, "_gkPreferredUserLanguage");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (id)v6;
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v6, CFSTR("accept-language"));
  objc_msgSend(a3, "localeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v9, CFSTR("x-gk-region-format"));
}

- (void)setSAPSignature:()GKAdditions
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(a1, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_gkIsSecure");

  v6 = v8;
  if (v8 && v5)
  {
    objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v7, CFSTR("x-gk-sap-signature"));

    v6 = v8;
  }

}

- (void)setSAPversion:()GKAdditions
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(a1, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_gkIsSecure");

  v6 = v7;
  if (v7 && v5)
  {
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v7, CFSTR("x-gk-sap-version"));
    v6 = v7;
  }

}

@end
