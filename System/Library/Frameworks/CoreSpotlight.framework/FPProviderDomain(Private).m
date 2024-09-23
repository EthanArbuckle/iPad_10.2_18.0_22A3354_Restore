@implementation FPProviderDomain(Private)

- (id)FPDomainItem
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "topLevelBundleIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    objc_msgSend(a1, "providerID");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      objc_msgSend(a1, "domain");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "spotlightDomainIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(a1, "topLevelBundleIdentifier");
        v8 = objc_claimAutoreleasedReturnValue();
        v24[0] = v8;
        objc_msgSend(a1, "providerID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v24[1] = v9;
        objc_msgSend(a1, "domain");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "spotlightDomainIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v24[2] = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
    }
    else
    {

    }
  }
  logForCSLogCategoryIndex();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1, "topLevelBundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "providerID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "spotlightDomainIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412802;
    v19 = v13;
    v20 = 2112;
    v21 = v14;
    v22 = 2112;
    v23 = v16;
    _os_log_impl(&dword_18C42F000, v8, OS_LOG_TYPE_DEFAULT, "*warn* FileProvider domain with incomplete proerpties. (bundleID:%@ providerID:%@ domainID:%@)", (uint8_t *)&v18, 0x20u);

  }
  v12 = 0;
LABEL_9:

  return v12;
}

@end
