@implementation LSApplicationRecord(Workflow)

- (uint64_t)wf_isAvailableInContext:()Workflow
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  char v25;
  char v26;
  char v27;
  char v29;
  char v30;
  char v31;
  void *v32;

  objc_msgSend(a1, "applicationState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v5, "isInstalled");

  objc_msgSend(a1, "applicationState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v6, "isRestricted");

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", *MEMORY[0x24BEC1790], *MEMORY[0x24BEC1788], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BE042F8], "hiddenAppBundleIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v9, "containsObject:", v10);

  }
  else
  {
    v29 = 0;
  }

  objc_msgSend(a1, "compatibilityObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = v7;
  if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDC14E0]) & 1) != 0)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    objc_msgSend(a1, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "containsObject:", v14) & 1) != 0)
      LOBYTE(v13) = 1;
    else
      v13 = objc_msgSend(a1, "wf_iconIsDefaultVisible") ^ 1;

  }
  v15 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDC14E8]);
  objc_msgSend(a1, "appTags");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "containsObject:", CFSTR("hidden"));

  v18 = objc_msgSend(a1, "isLaunchProhibited");
  objc_msgSend(a1, "bundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v19, "isEqualToString:", CFSTR("com.apple.webapp")) & 1) != 0)
  {
    v20 = 1;
  }
  else
  {
    objc_msgSend(a1, "bundleIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v21, "isEqualToString:", CFSTR("com.apple.webapp1"));

  }
  objc_msgSend(MEMORY[0x24BDC1540], "wf_bundleAllowList");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bundleIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v22, "containsObject:", v23);

  if (a3 == 2)
  {
    v26 = v31 ^ 1 | v30 | v13 | v29 | v20 | v18;
  }
  else
  {
    if (a3 == 1)
    {
      v25 = v31 ^ 1 | v30;
    }
    else
    {
      if (a3)
      {
        v27 = 0;
        goto LABEL_22;
      }
      v25 = v31 ^ 1 | v30 | v13 | v29 | v20 | v18 | v17;
    }
    v26 = v25 | v15;
  }
  v27 = v26 ^ 1 | v24;
LABEL_22:

  return v27 & 1;
}

- (uint64_t)wf_iconIsDefaultVisible
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "infoDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:ofClass:", CFSTR("SBIconVisibilityDefaultVisible"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 1;

  return v3;
}

- (uint64_t)wf_isLinkEnabled
{
  _BOOL8 v2;
  void *v3;
  void *v4;
  void *v5;

  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(a1, "isLinkEnabled") & 1) != 0)
    return 1;
  objc_msgSend(a1, "applicationExtensionRecords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_firstObjectPassingTest:", &__block_literal_global_123_12564);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = v5 != 0;
  return v2;
}

+ (id)wf_bundleAllowList
{
  if (wf_bundleAllowList_onceToken != -1)
    dispatch_once(&wf_bundleAllowList_onceToken, &__block_literal_global_12581);
  return (id)wf_bundleAllowList_allowlist;
}

@end
