@implementation EXDefaults

void __33___EXDefaults_extensionItemTypes__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Class v11;
  Class v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[6];

  v20[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(*(id *)(a1 + 32), "plistTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "errorTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unionSet:", v5);

  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  v20[2] = objc_opt_class();
  v20[3] = objc_opt_class();
  v20[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v6);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(&unk_1E2D15CD8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(&unk_1E2D15CD8);
        v11 = NSClassFromString(*(NSString **)(*((_QWORD *)&v15 + 1) + 8 * v10));
        if (v11)
          objc_msgSend(v4, "addObject:", v11);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(&unk_1E2D15CD8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "useItemProviderXPCConnection") & 1) == 0)
  {
    v12 = NSClassFromString(CFSTR("_EXItemProviderExtensionVendorLoadOperator"));
    if (v12)
      objc_msgSend(v4, "addObject:", v12);
  }
  v13 = objc_msgSend(v4, "copy");
  v14 = (void *)extensionItemTypes_types;
  extensionItemTypes_types = v13;

}

void __29___EXDefaults_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[_EXDefaults _init]([_EXDefaults alloc], "_init");
  v1 = (void *)sharedInstance_defaults;
  sharedInstance_defaults = (uint64_t)v0;

}

uint64_t __43___EXDefaults_useItemProviderXPCConnection__block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  useItemProviderXPCConnection_value = result;
  return result;
}

void __25___EXDefaults_plistTypes__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[11];

  v4[10] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  v4[8] = objc_opt_class();
  v4[9] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 10);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)plistTypes_plistTypes;
  plistTypes_plistTypes = v2;

}

void __25___EXDefaults_errorTypes__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[9];

  v4[8] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)errorTypes_errorTypes;
  errorTypes_errorTypes = v2;

}

void __33___EXDefaults_plistAndValueTypes__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "plistTypes");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObject:", objc_opt_class());
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)plistAndValueTypes_types;
  plistAndValueTypes_types = v1;

}

void __32___EXDefaults_itemProviderTypes__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  Class v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(*(id *)(a1 + 32), "plistTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "errorTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unionSet:", v5);

  objc_msgSend(v4, "addObject:", objc_opt_class());
  objc_msgSend(v4, "addObject:", objc_opt_class());
  objc_msgSend(v4, "addObject:", objc_opt_class());
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(&unk_1E2D15CF0, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(&unk_1E2D15CF0);
        v10 = NSClassFromString(*(NSString **)(*((_QWORD *)&v13 + 1) + 8 * v9));
        if (v10)
          objc_msgSend(v4, "addObject:", v10);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(&unk_1E2D15CF0, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  v11 = objc_msgSend(v4, "copy");
  v12 = (void *)itemProviderTypes_types;
  itemProviderTypes_types = v11;

}

void __25___EXDefaults_imageTypes__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  Class v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = objc_msgSend(&unk_1E2D15D08, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v9;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v9 != v3)
          objc_enumerationMutation(&unk_1E2D15D08);
        v5 = NSClassFromString(*(NSString **)(*((_QWORD *)&v8 + 1) + 8 * v4));
        if (v5)
          objc_msgSend(v0, "addObject:", v5);
        ++v4;
      }
      while (v2 != v4);
      v2 = objc_msgSend(&unk_1E2D15D08, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v2);
  }
  v6 = objc_msgSend(v0, "copy");
  v7 = (void *)imageTypes_types;
  imageTypes_types = v6;

}

uint64_t __28___EXDefaults_appleInternal__block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_content();
  appleInternal_appleInternal = result;
  return result;
}

void __39___EXDefaults_preferInProcessDiscovery__block_invoke()
{
  int v0;
  id v1;

  v0 = _os_feature_enabled_impl();
  preferInProcessDiscovery_value = v0;
  if (v0)
  {
    objc_msgSend(MEMORY[0x1E0CA58C0], "sharedDatabaseContext");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    preferInProcessDiscovery_value = objc_msgSend(v1, "canAccess");

  }
}

void __54___EXDefaults_alwaysEnabledExtensionBundleIdentifiers__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E2D15D20);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)alwaysEnabledExtensionBundleIdentifiers_alwaysEnabled;
  alwaysEnabledExtensionBundleIdentifiers_alwaysEnabled = v0;

}

void __41___EXDefaults_enforceXPCCacheCodeSigning__block_invoke()
{
  int bootarg_state;
  int v1;
  NSObject *v2;
  uint8_t buf[4];
  char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  bootarg_state = amfi_interface_query_bootarg_state();
  if (bootarg_state)
  {
    v1 = bootarg_state;
    _EXDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v4 = strerror(v1);
      _os_log_impl(&dword_190C25000, v2, OS_LOG_TYPE_DEFAULT, "amfi_interface_query_bootarg_state returned error %{public}s", buf, 0xCu);
    }

  }
  else
  {
    enforceXPCCacheCodeSigning_codeSigningEnforcementIsDisabled = 0;
  }
}

void __48___EXDefaults_allowedUnsandboxedExtensionPoints__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E2D15D38);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)allowedUnsandboxedExtensionPoints_allowList;
  allowedUnsandboxedExtensionPoints_allowList = v0;

}

@end
