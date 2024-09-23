@implementation FPActionOperationLocator(Daemon)

- (id)materializedURLWithExtensionManager:()Daemon
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(a1, "isExternalURL"))
  {
    objc_msgSend(a1, "asURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "asFPItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "itemID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "domainFromItemID:reason:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "materializedURLWithDomain:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)materializedURLWithDomain:()Daemon
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(a1, "isExternalURL"))
  {
    objc_msgSend(a1, "asURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "asFPItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "itemID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "materializedURLForItemID:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setFileURL:", v5);
  }

  return v5;
}

- (uint64_t)willRequireDownloadForSourceItem:()Daemon extensionManager:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;

  v6 = a3;
  v7 = a4;
  if (v6
    && objc_msgSend(a1, "isFolder")
    && (objc_msgSend(a1, "isExternalURL") & 1) == 0
    && objc_msgSend(a1, "isProviderItem"))
  {
    objc_msgSend(a1, "asFPItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "domainFromItemID:reason:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "isUsingFPFS") && (objc_msgSend(v8, "isDownloaded") & 1) == 0)
    {
      if ((objc_msgSend(v6, "isExternalURL") & 1) != 0 || !objc_msgSend(v6, "isProviderItem"))
      {
        v11 = 1;
      }
      else
      {
        objc_msgSend(v6, "asFPItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "asFPItem");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "providerDomainID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "providerDomainID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqualToString:", v16);

        v11 = v17 ^ 1 | objc_msgSend(v13, "isDownloaded");
      }
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (uint64_t)materializeOptionForDestinationItem:()Daemon recursively:isCopy:extensionManager:
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;

  v10 = a3;
  v11 = a6;
  if ((objc_msgSend(a1, "isExternalURL") & 1) == 0)
  {
    objc_msgSend(a1, "asFPItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "itemID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "domainFromItemID:reason:", v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "isUsingFPFS");
    if ((a4 & 1) != 0)
    {
      if (!v16 || (objc_msgSend(v13, "isRecursivelyDownloaded") & 1) == 0)
      {
        if (objc_msgSend(a1, "isFolder"))
          v12 = 2;
        else
          v12 = 1;
LABEL_12:
        if ((objc_msgSend(v10, "isExternalURL") & 1) == 0 && (a5 & 1) == 0)
        {
          objc_msgSend(v10, "asFPItem");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "providerDomainID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "providerDomainID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "isEqualToString:", v19);

          if (v20)
            v12 = 0;

        }
        goto LABEL_17;
      }
    }
    else if ((objc_msgSend(v13, "isDownloaded") & 1) == 0)
    {
      v12 = 1;
      goto LABEL_12;
    }
    v12 = 0;
LABEL_17:

    goto LABEL_18;
  }
  v12 = 0;
LABEL_18:

  return v12;
}

- (uint64_t)isDownloaded
{
  uint64_t v2;
  void *v3;

  if ((objc_msgSend(a1, "isExternalURL") & 1) != 0)
    return 0;
  objc_msgSend(a1, "asFPItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "isDownloaded") ^ 1;

  return v2;
}

- (void)startAccessingLocator
{
  void *v0;
  NSObject *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ UNREACHABLE: needs override"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
  {
    v2 = 138543362;
    v3 = v0;
    _os_log_fault_impl(&dword_1CF55F000, v1, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v2, 0xCu);
  }

  __assert_rtn("-[FPActionOperationLocator(Daemon) startAccessingLocator]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/FPActionOperationLocator+Daemon.m", 156, (const char *)objc_msgSend(objc_retainAutorelease(v0), "UTF8String"));
}

- (void)annotateWithPersonaSandboxIfNeeded:()Daemon
{
  id v3;
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ UNREACHABLE: needs override"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_fault_impl(&dword_1CF55F000, v5, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v6, 0xCu);
  }

  __assert_rtn("-[FPActionOperationLocator(Daemon) annotateWithPersonaSandboxIfNeeded:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/FPActionOperationLocator+Daemon.m", 162, (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
}

@end
