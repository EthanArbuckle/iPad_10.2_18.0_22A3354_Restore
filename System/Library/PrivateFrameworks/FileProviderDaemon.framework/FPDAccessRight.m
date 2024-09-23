@implementation FPDAccessRight

- (void)_computeAccessForURL:(id)a3 entitlements:(id)a4 connection:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  id WeakRetained;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "count") && objc_msgSend(v10, "fp_hasOneOfEntitlements:logLevel:", v9, 0))
  {
    v11 = 4;
LABEL_8:
    self->_accessLevel = v11;
    goto LABEL_9;
  }
  if (objc_msgSend(v10, "fp_hasSandboxAccessToFile:accessType:logLevel:", v8, *MEMORY[0x1E0CAA668], 0))
  {
    v11 = 3;
    goto LABEL_8;
  }
  if (objc_msgSend(v10, "fp_hasSandboxAccessToFile:accessType:logLevel:", v8, *MEMORY[0x1E0CAA658], 0))
  {
    v11 = 1;
    goto LABEL_8;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  objc_msgSend(WeakRetained, "providedItemsURLs", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        if (objc_msgSend(v10, "fp_hasSandboxAccessToFile:logLevel:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17), 0))self->_accessLevel = 2;
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v15);
  }

LABEL_9:
}

- (FPDAccessRight)initWithURL:(id)a3 entitlements:(id)a4 connection:(id)a5 manager:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  FPDAccessRight *v14;
  FPDAccessRight *v15;
  void *v16;
  id WeakRetained;
  void *v18;
  void *v19;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)FPDAccessRight;
  v14 = -[FPDAccessRight init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_accessLevel = 0;
    objc_msgSend(v13, "domainForURL:reason:", v10, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v15->_domain, v16);

    WeakRetained = objc_loadWeakRetained((id *)&v15->_domain);
    objc_msgSend(WeakRetained, "provider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v18, "isAppExtensionReachable"))
    {
      objc_msgSend(v18, "asAppExtensionBackedProvider");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&v15->_provider, v19);

    }
    -[FPDAccessRight _computeAccessForURL:entitlements:connection:](v15, "_computeAccessForURL:entitlements:connection:", v10, v11, v12);

  }
  return v15;
}

- (FPDAccessRight)initWithURL:(id)a3 connection:(id)a4 manager:(id)a5
{
  return -[FPDAccessRight initWithURL:entitlements:connection:manager:](self, "initWithURL:entitlements:connection:manager:", a3, MEMORY[0x1E0C9AA60], a4, a5);
}

- (FPDAccessRight)init
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("should not call this"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_fault_impl(&dword_1CF55F000, v3, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v4, 0xCu);
  }

  __assert_rtn("-[FPDAccessRight init]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDAccessRight.m", 71, (const char *)objc_msgSend(objc_retainAutorelease(v2), "UTF8String"));
}

- (unint64_t)level
{
  return self->_accessLevel;
}

- (FPDExtension)provider
{
  return (FPDExtension *)objc_loadWeakRetained((id *)&self->_provider);
}

- (FPDDomain)domain
{
  return (FPDDomain *)objc_loadWeakRetained((id *)&self->_domain);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_domain);
  objc_destroyWeak((id *)&self->_provider);
}

@end
