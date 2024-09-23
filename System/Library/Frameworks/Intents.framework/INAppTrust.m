@implementation INAppTrust

+ (BOOL)shouldTrustExtensionForLaunch:(id)a3
{
  id v4;
  INExplicitAppTrustCache *v5;

  v4 = a3;
  v5 = objc_alloc_init(INExplicitAppTrustCache);
  LOBYTE(a1) = objc_msgSend(a1, "_shouldTrustExtensionForLaunch:withExplicitAppTrustCache:", v4, v5);

  return (char)a1;
}

+ (BOOL)_shouldTrustExtensionForLaunch:(id)a3 withExplicitAppTrustCache:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "_extensionBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundlePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasPrefix:", CFSTR("/System/Library/PrivateFrameworks/"));

  if ((v10 & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend(v6, "_plugIn");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "containingUrl");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForBundleURL:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(a1, "_shouldTrustAppForLaunch:withExplicitAppTrustCache:", v14, v7);

    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

+ (id)extensionsTrustedForLaunch:(id)a3
{
  id v4;
  INExplicitAppTrustCache *v5;
  void *v6;
  INExplicitAppTrustCache *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void *v14;
  INExplicitAppTrustCache *v15;
  id v16;

  v4 = a3;
  v5 = objc_alloc_init(INExplicitAppTrustCache);
  v6 = (void *)MEMORY[0x1E0CB3880];
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __41__INAppTrust_extensionsTrustedForLaunch___block_invoke;
  v14 = &unk_1E2290048;
  v15 = v5;
  v16 = a1;
  v7 = v5;
  objc_msgSend(v6, "predicateWithBlock:", &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v8, v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)shouldTrustAppForLaunch:(id)a3
{
  id v4;
  INExplicitAppTrustCache *v5;

  v4 = a3;
  v5 = objc_alloc_init(INExplicitAppTrustCache);
  LOBYTE(a1) = objc_msgSend(a1, "_shouldTrustAppForLaunch:withExplicitAppTrustCache:", v4, v5);

  return (char)a1;
}

+ (BOOL)_shouldTrustAppForLaunch:(id)a3 withExplicitAppTrustCache:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  NSObject *v14;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    LOBYTE(v8) = 0;
    goto LABEL_18;
  }
  if ((objc_msgSend(v6, "if_isSystem") & 1) == 0)
  {
    objc_msgSend(v6, "bundleURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isReadableFileAtPath:", v10);

      if ((v12 & 1) != 0)
      {
        v13 = MISAppApprovalState();
        switch(v13)
        {
          case 0:
            v8 = objc_msgSend(a1, "_appRequiresExplicitTrust:withExplicitAppTrustCache:", v6, v7) ^ 1;
            goto LABEL_17;
          case 3:
            goto LABEL_13;
          case 1:
            if (INIsInternalInstall_onceToken != -1)
              dispatch_once(&INIsInternalInstall_onceToken, &__block_literal_global_162);
            if (INIsInternalInstall_isInternal)
            {
LABEL_13:
              LOBYTE(v8) = 1;
LABEL_17:

              goto LABEL_18;
            }
            break;
        }
      }
      else
      {
        v14 = INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
        {
          v16 = 136315394;
          v17 = "+[INAppTrust _shouldTrustAppForLaunch:withExplicitAppTrustCache:]";
          v18 = 2112;
          v19 = v10;
          _os_log_error_impl(&dword_18BEBC000, v14, OS_LOG_TYPE_ERROR, "%s Unable to determine app aproval state for %@ because the path is unreadable", (uint8_t *)&v16, 0x16u);
        }
      }
    }
    LOBYTE(v8) = 0;
    goto LABEL_17;
  }
  LOBYTE(v8) = 1;
LABEL_18:

  return v8;
}

+ (id)appsTrustedForLaunch:(id)a3
{
  id v4;
  INExplicitAppTrustCache *v5;
  void *v6;
  INExplicitAppTrustCache *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void *v14;
  INExplicitAppTrustCache *v15;
  id v16;

  v4 = a3;
  v5 = objc_alloc_init(INExplicitAppTrustCache);
  v6 = (void *)MEMORY[0x1E0CB3880];
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __35__INAppTrust_appsTrustedForLaunch___block_invoke;
  v14 = &unk_1E2290048;
  v15 = v5;
  v16 = a1;
  v7 = v5;
  objc_msgSend(v6, "predicateWithBlock:", &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v8, v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)_appRequiresExplicitTrust:(id)a3 withExplicitAppTrustCache:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  char v13;
  void *v14;
  void *v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "managedBundleIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if ((v9 & 1) != 0
    || (objc_msgSend(v6, "trustedCodeSigningIdentities"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "signerIdentity"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v10, "containsObject:", v11),
        v11,
        v10,
        (v12 & 1) != 0))
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v6, "signingIdentitiesRequiringExplicitTrust");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "signerIdentity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v14, "containsObject:", v15);

  }
  return v13;
}

uint64_t __35__INAppTrust_appsTrustedForLaunch___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "_shouldTrustAppForLaunch:withExplicitAppTrustCache:", a2, *(_QWORD *)(a1 + 32));
}

uint64_t __41__INAppTrust_extensionsTrustedForLaunch___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "_shouldTrustExtensionForLaunch:withExplicitAppTrustCache:", a2, *(_QWORD *)(a1 + 32));
}

@end
