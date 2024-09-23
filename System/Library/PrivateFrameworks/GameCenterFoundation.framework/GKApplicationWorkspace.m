@implementation GKApplicationWorkspace

+ (id)defaultWorkspace
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (id)applicationProxyForBundleID:(id)a3
{
  id v3;
  GKApplicationProxy *v4;

  v3 = a3;
  v4 = -[GKApplicationProxy initWithBundleID:]([GKApplicationProxy alloc], "initWithBundleID:", v3);

  return v4;
}

- (id)openURL:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v8;

  v3 = (void *)MEMORY[0x1E0CA5878];
  v4 = a3;
  objc_msgSend(v3, "defaultWorkspace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v5, "openSensitiveURL:withOptions:error:", v4, 0, &v8);

  v6 = v8;
  return v6;
}

- (void)openICloudSettings
{
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, a2, a3, "cannot openICloudSettings because of error: %@", a5, a6, a7, a8, 2u);
}

- (void)openSoftwareUpdateSettings
{
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, a2, a3, "cannot openSoftwareUpdateSettings because of error: %@", a5, a6, a7, a8, 2u);
}

- (void)openNewsApp
{
  id v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://apple.news/puzzles"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[GKApplicationWorkspace openURL:](self, "openURL:", v4);

}

- (id)gameDescriptorsWithInstalledBundleVersionsForBundleIDs:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __81__GKApplicationWorkspace_gameDescriptorsWithInstalledBundleVersionsForBundleIDs___block_invoke;
  v4[3] = &unk_1E75B36C0;
  v4[4] = self;
  objc_msgSend(a3, "_gkMapWithBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __81__GKApplicationWorkspace_gameDescriptorsWithInstalledBundleVersionsForBundleIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[3];
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[3];
  _QWORD v22[4];
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "applicationProxyForBundleID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleShortVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKGameDescriptor stringForPlatform:](GKGameDescriptor, "stringForPlatform:", +[GKApplicationWorkspace getPlatformForBundleID:](GKApplicationWorkspace, "getPlatformForBundleID:", v3));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (v9)
  {
    if (v5)
    {
      v20[0] = CFSTR("bundle-id");
      v20[1] = CFSTR("bundle-version");
      v21[0] = v3;
      v21[1] = v5;
      v20[2] = CFSTR("platform");
      v21[2] = v7;
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = v21;
      v12 = v20;
    }
    else
    {
      if (!v6)
      {
        v16[0] = CFSTR("bundle-id");
        v16[1] = CFSTR("platform");
        v17[0] = v3;
        v17[1] = v7;
        v10 = (void *)MEMORY[0x1E0C99D80];
        v11 = v17;
        v12 = v16;
        v13 = 2;
        goto LABEL_11;
      }
      v18[0] = CFSTR("bundle-id");
      v18[1] = CFSTR("short-bundle-version");
      v19[0] = v3;
      v19[1] = v6;
      v18[2] = CFSTR("platform");
      v19[2] = v7;
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = v19;
      v12 = v18;
    }
    v13 = 3;
  }
  else
  {
    v22[0] = CFSTR("bundle-id");
    v22[1] = CFSTR("bundle-version");
    v23[0] = v3;
    v23[1] = v5;
    v22[2] = CFSTR("short-bundle-version");
    v22[3] = CFSTR("platform");
    v23[2] = v6;
    v23[3] = v7;
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = v23;
    v12 = v22;
    v13 = 4;
  }
LABEL_11:
  objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)gameDescriptorsWithInstalledBundleVersionsForGameDescriptors:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __87__GKApplicationWorkspace_gameDescriptorsWithInstalledBundleVersionsForGameDescriptors___block_invoke;
  v4[3] = &unk_1E75B6330;
  v4[4] = self;
  objc_msgSend(a3, "_gkMapWithBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __87__GKApplicationWorkspace_gameDescriptorsWithInstalledBundleVersionsForGameDescriptors___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundle-id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "applicationProxyForBundleID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleShortVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("bundle-version"));
    if (v8)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("short-bundle-version"));

  }
  return v4;
}

+ (int64_t)getPlatformForBundleID:(id)a3
{
  void *v3;
  int64_t v4;

  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", a3, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "platform") == 6 || objc_msgSend(v3, "platform") == 1)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "platform") == 2 || objc_msgSend(v3, "platform") == 7)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "platform") == 3 || objc_msgSend(v3, "platform") == 8)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "platform") == 4 || objc_msgSend(v3, "platform") == 9)
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
