@implementation FPDExtensionManager

- (id)domainFromItemID:(id)a3 checkInvalidation:(BOOL)a4 reason:(unint64_t *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v8 = a3;
  objc_msgSend(v8, "providerID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDExtensionManager providerWithIdentifier:checkInvalidation:reason:](self, "providerWithIdentifier:checkInvalidation:reason:", v9, v6, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "domainIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "domainForIdentifier:reason:", v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)providerWithIdentifier:(id)a3 checkInvalidation:(BOOL)a4 reason:(unint64_t *)a5
{
  _BOOL4 v6;
  id v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v8 = a3;
  v9 = self->_providersByIdentifier;
  objc_sync_enter(v9);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_providersByIdentifier, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!a5 || v10)
  {
    if ((objc_msgSend(v10, "invalidated") & v6) == 1)
    {
      v12 = 0;
      *a5 = 2;
    }
    else
    {
      v12 = v11;
    }
  }
  else
  {
    v12 = 0;
    *a5 = 0;
  }

  objc_sync_exit(v9);
  return v12;
}

- (id)domainForURL:(id)a3 reason:(unint64_t *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  if ((objc_msgSend(v6, "hasDirectoryPath") & 1) != 0 || !objc_msgSend(v6, "fp_isSymlink"))
  {
    -[FPDExtensionManager _domainForURL:](self, "_domainForURL:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a4)
      goto LABEL_8;
  }
  else
  {
    objc_msgSend(v6, "URLByDeletingLastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPDExtensionManager _domainForURL:](self, "_domainForURL:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a4)
      goto LABEL_8;
  }
  if (!v8)
    *a4 = 3;
LABEL_8:

  return v8;
}

uint64_t __69__FPDExtensionManager_providersWithGroupContainers_bundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v3 = a2;
  objc_msgSend(v3, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topLevelBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v3, "descriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topLevelBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "hasPrefix:", v8))
    {
      v9 = *(void **)(a1 + 40);
      objc_msgSend(v3, "descriptor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "documentGroupName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9, "containsObject:", v11);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)providersWithTopLevelBundleIdentifier:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  id v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_providersByIdentifier;
  objc_sync_enter(v5);
  -[NSMutableDictionary allValues](self->_providersByIdentifier, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  v18 = (id)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1D17D1B04]();
        objc_msgSend(v10, "descriptor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "topLevelBundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqualToString:", v4))
        {

        }
        else
        {
          objc_msgSend(v10, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", v4);

          if (!v15)
            goto LABEL_11;
        }
        if (objc_msgSend(v10, "isAppExtensionReachable", v18))
        {
          objc_msgSend(v10, "asAppExtensionBackedProvider");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v16);

        }
LABEL_11:
        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  return v18;
}

- (id)providerDomainsByID
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;

  v3 = self->_providersByIdentifier;
  objc_sync_enter(v3);
  v4 = (void *)-[NSMutableDictionary copy](self->_providersByIdentifier, "copy");
  objc_sync_exit(v3);

  -[FPDExtensionManager providerDomainsByIDFromExtensionsByID:](self, "providerDomainsByIDFromExtensionsByID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)defaultProviderWithTopLevelBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[FPDExtensionManager providersWithTopLevelBundleIdentifier:](self, "providersWithTopLevelBundleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortUsingComparator:", &__block_literal_global_70);
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)providerDomainsByIDFromExtensionsByID:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v31 = v3;
  objc_msgSend(v3, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v41;
    v32 = *MEMORY[0x1E0CAAB38];
    v33 = *(_QWORD *)v41;
    do
    {
      v8 = 0;
      v34 = v6;
      do
      {
        if (*(_QWORD *)v41 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v8);
        objc_msgSend(v9, "nsDomainsByID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "count");

        if (v11)
        {
          v12 = objc_msgSend(v9, "shouldHideDomainDisplayName");
          objc_msgSend(v9, "relevantDomainsByID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "allValues");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v38 = 0u;
          v39 = 0u;
          v36 = 0u;
          v37 = 0u;
          v15 = v14;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v37;
            do
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v37 != v18)
                  objc_enumerationMutation(v15);
                objc_msgSend(v9, "providerDomainForDomain:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i));
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = v20;
                if (v20)
                {
                  objc_msgSend(v20, "setShouldHideDomainDisplayName:", v12);
                  objc_msgSend(v21, "identifier");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, v22);

                }
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
            }
            while (v17);
            v23 = v15;
            v7 = v33;
            v6 = v34;
          }
          else
          {
            v23 = v15;
          }
        }
        else
        {
          objc_msgSend(v9, "descriptor");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "defaultDomainVisible");

          if (!v25)
            goto LABEL_22;
          objc_msgSend(v9, "relevantDomainsByID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKeyedSubscript:", v32);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "providerDomainForDomain:", v23);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v27;
          if (v27)
          {
            objc_msgSend(v27, "setShouldHideDomainDisplayName:", 1);
            objc_msgSend(v9, "providedItemsURLs");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setStorageURLs:", v28);

            objc_msgSend(v15, "identifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, v29);

          }
        }

LABEL_22:
        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v6);
  }

  return v4;
}

- (id)_domainForURL:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v30;
  uint64_t v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = self->_providersByIdentifier;
    objc_sync_enter(v5);
    -[NSMutableDictionary allValues](self->_providersByIdentifier, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v5);

    objc_msgSend(v4, "fp_realpathURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v38;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v38 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          v13 = (void *)MEMORY[0x1D17D1B04]();
          objc_msgSend(v12, "domainForRealPathURLFast:", v7);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_autoreleasePoolPop(v13);
          if (v14)
          {

            v27 = v14;
            goto LABEL_27;
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
        if (v9)
          continue;
        break;
      }
    }

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v15 = v8;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
    v17 = v16;
    if (v16)
    {
      v18 = *(_QWORD *)v34;
LABEL_12:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v34 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v19);
        v21 = (void *)MEMORY[0x1D17D1B04](v16);
        objc_msgSend(v20, "domainForRealPathURLSlow:", v7, (_QWORD)v33);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_autoreleasePoolPop(v21);
        if (v22)
          break;
        if (v17 == ++v19)
        {
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
          v17 = v16;
          if (v16)
            goto LABEL_12;
          goto LABEL_18;
        }
      }
    }
    else
    {
LABEL_18:
      v22 = 0;
    }

    fssync_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    fp_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_signpost_id_generate(v24);

    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      objc_msgSend(v22, "fp_prettyDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v42 = v26;
      _os_signpost_emit_with_name_impl(&dword_1CF55F000, v23, OS_SIGNPOST_EVENT, v25, "Slow domain lookup", "%@", buf, 0xCu);

    }
    v27 = v22;
    if (v27)
    {
LABEL_27:
      fp_current_or_default_log();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v4, "fp_shortDescription");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v8, "count");
        objc_msgSend(v27, "fp_prettyDescription");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v42 = v30;
        v43 = 2048;
        v44 = v31;
        v45 = 2112;
        v46 = v32;
        _os_log_debug_impl(&dword_1CF55F000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] testing if %@ is in our %lu registered file providers: it's in %@", buf, 0x20u);

      }
    }
    else
    {
      fp_current_or_default_log();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        -[FPDExtensionManager _domainForURL:].cold.1(v4, v15, v28);
      v27 = 0;
    }

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (void)updateProvidersIfNecessary
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "personaGenerationIdentifierWithError:", 0);

  if (updateProvidersIfNecessary_personaGeneration == v4)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(v5, "getKnowledgeUUID:andSequenceNumber:", 0, &v10);
    v6 = v10;

    if ((objc_msgSend(v6, "isEqualToNumber:", updateProvidersIfNecessary_databaseGeneration) & 1) == 0)
    {
      fp_current_or_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v12 = updateProvidersIfNecessary_databaseGeneration;
        v13 = 2112;
        v14 = (uint64_t)v6;
        _os_log_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_INFO, "[INFO] LS resync because of LS generation change (%@ -> %@)", buf, 0x16u);
      }

      if (v6)
        v8 = v6;
      else
        v8 = &unk_1E8C95E68;
      objc_storeStrong((id *)&updateProvidersIfNecessary_databaseGeneration, v8);
      -[FPDExtensionManager forceSynchronousProviderUpdate](self, "forceSynchronousProviderUpdate");
    }

  }
  else
  {
    fp_current_or_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v12 = updateProvidersIfNecessary_personaGeneration;
      v13 = 2048;
      v14 = v4;
      _os_log_impl(&dword_1CF55F000, v9, OS_LOG_TYPE_INFO, "[INFO] LS resync because of persona generation change (%llu -> %llu)", buf, 0x16u);
    }

    updateProvidersIfNecessary_personaGeneration = v4;
    -[FPDExtensionManager forceSynchronousProviderUpdate](self, "forceSynchronousProviderUpdate");
  }
}

- (id)providersWithGroupContainers:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  -[FPDExtensionManager allProviders](self, "allProviders");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __69__FPDExtensionManager_providersWithGroupContainers_bundleIdentifier___block_invoke;
  v17 = &unk_1E8C78948;
  v18 = v7;
  v19 = v6;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "fp_filter:", &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "fp_map:", &__block_literal_global_73_0, v14, v15, v16, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)providerWithIdentifier:(id)a3 reason:(unint64_t *)a4
{
  return -[FPDExtensionManager providerWithIdentifier:checkInvalidation:reason:](self, "providerWithIdentifier:checkInvalidation:reason:", a3, 0, a4);
}

- (id)domainFromItemID:(id)a3 reason:(unint64_t *)a4
{
  return -[FPDExtensionManager domainFromItemID:checkInvalidation:reason:](self, "domainFromItemID:checkInvalidation:reason:", a3, 0, a4);
}

- (id)allProviders
{
  NSMutableDictionary *v3;
  void *v4;

  v3 = self->_providersByIdentifier;
  objc_sync_enter(v3);
  -[NSMutableDictionary allValues](self->_providersByIdentifier, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  return v4;
}

- (FPDExtensionManager)initWithServer:(id)a3 updateHandler:(id)a4
{
  id v6;
  id v7;
  FPDExtensionManager *v8;
  FPDExtensionManager *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *providersByIdentifier;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *callbackQueue;
  uint64_t v15;
  NSMapTable *sessionQueueForExtensionIdentifier;
  FPDPushConnection *v17;
  FPDPushConnection *pushConnection;
  uint64_t v19;
  id updateHandler;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)FPDExtensionManager;
  v8 = -[FPDExtensionManager init](&v22, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_server, v6);
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    providersByIdentifier = v9->_providersByIdentifier;
    v9->_providersByIdentifier = v10;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("FPDExtensionManager callback queue", v12);
    callbackQueue = v9->_callbackQueue;
    v9->_callbackQueue = (OS_dispatch_queue *)v13;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v15 = objc_claimAutoreleasedReturnValue();
    sessionQueueForExtensionIdentifier = v9->_sessionQueueForExtensionIdentifier;
    v9->_sessionQueueForExtensionIdentifier = (NSMapTable *)v15;

    v17 = -[FPDPushConnection initWithExtensionManager:]([FPDPushConnection alloc], "initWithExtensionManager:", v9);
    pushConnection = v9->_pushConnection;
    v9->_pushConnection = v17;

    v19 = MEMORY[0x1D17D1C84](v7);
    updateHandler = v9->_updateHandler;
    v9->_updateHandler = (id)v19;

  }
  return v9;
}

- (void)afterFirstDiscovery
{
  NSObject *v3;
  id WeakRetained;
  uint8_t v5[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  if (objc_msgSend(MEMORY[0x1E0CAAC18], "runningInSyncBubble"))
  {
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1CF55F000, v3, OS_LOG_TYPE_INFO, "[INFO] shared iPad: Skipping push connection because we're just finishing sync", v5, 2u);
    }

  }
  else
  {
    -[FPDPushConnection start](self->_pushConnection, "start");
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  objc_msgSend((id)objc_msgSend(WeakRetained, "fpfsClass"), "registerXPCActivities");

}

- (void)garbageCollectDomainsExceptIdentifiers:(id)a3 fromDirectory:(id)a4 isUserData:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t i;
  void *v16;
  void *v17;
  NSObject *v18;
  char v19;
  id v20;
  NSObject *v21;
  void *v22;
  char *v23;
  id v24;
  const char *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t section;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  char v39[32];
  uint64_t v40;

  v5 = a5;
  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v24 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  section = __fp_create_section();
  fp_current_or_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v24, "fp_shortDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPDExtensionManager garbageCollectDomainsExceptIdentifiers:fromDirectory:isUserData:].cold.1(v10, (uint64_t)v39, section, v9);
  }

  objc_msgSend(v8, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v24, 0, 1, &__block_literal_global_21);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v28;
    v14 = "database";
    if (v5)
      v14 = "and archiving user data";
    v25 = v14;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v16, "fp_fpfsProviderDomainID:skipTypeCheck:error:", 0, 1, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "length") && (objc_msgSend(v7, "containsObject:", v17) & 1) == 0)
        {
          fp_current_or_default_log();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v16, "fp_shortDescription");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v33 = v25;
            v34 = 2114;
            v35 = v17;
            v36 = 2114;
            v37 = v22;
            _os_log_debug_impl(&dword_1CF55F000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] collecting %s for domain %{public}@ at %{public}@ because its provider is uninstalled or domain is lost", buf, 0x20u);

          }
          v26 = 0;
          v19 = objc_msgSend(v8, "removeItemAtURL:error:", v16, &v26);
          v20 = v26;
          if ((v19 & 1) == 0)
          {
            fp_current_or_default_log();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v16, "fp_shortDescription");
              v23 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v33 = v23;
              v34 = 2112;
              v35 = v20;
              _os_log_error_impl(&dword_1CF55F000, v21, OS_LOG_TYPE_ERROR, "[ERROR] can't remove: %@: %@", buf, 0x16u);

            }
          }

        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
    }
    while (v12);
  }

  __fp_leave_section_Debug();
}

uint64_t __87__FPDExtensionManager_garbageCollectDomainsExceptIdentifiers_fromDirectory_isUserData___block_invoke()
{
  return 0;
}

- (void)_garbageCollectRemovedProvidersForInstalledProviderIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  FPDAppMonitor *v9;
  void *v10;
  FPDAppMonitor *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t k;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t m;
  void *v55;
  void *v56;
  char v57;
  id v58;
  NSObject *v59;
  void *v60;
  FPDExtensionManager *v61;
  FPDAppMonitor *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  id obj;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  id v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _QWORD v82[4];
  id v83;
  id v84;
  void *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  uint8_t buf[4];
  void *v103;
  __int16 v104;
  void *v105;
  __int16 v106;
  void *v107;
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  fileProviderDirectory();
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v5;
  objc_msgSend(v5, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v6, 0, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_new();
  v68 = v4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [FPDAppMonitor alloc];
  v61 = self;
  -[FPDExtensionManager server](self, "server");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[FPDAppMonitor initWithServer:](v9, "initWithServer:", v10);

  v62 = v11;
  -[FPDAppMonitor listOfPlaceholderApps](v11, "listOfPlaceholderApps");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  obj = v7;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v112, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v99;
    v67 = *(_QWORD *)v99;
    do
    {
      v15 = 0;
      v69 = v13;
      do
      {
        if (*(_QWORD *)v99 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * v15);
        if (objc_msgSend(v16, "fp_isFolder"))
        {
          objc_msgSend(v16, "URLByAppendingPathComponent:", CFSTR("Domains.plist"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)MEMORY[0x1E0C99D80];
          objc_msgSend(v17, "path");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "dictionaryWithContentsOfFile:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            v71 = v17;
            objc_msgSend(v16, "lastPathComponent");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = v20;
            if ((objc_msgSend(v68, "containsObject:", v21) & 1) != 0)
            {
LABEL_21:
              v75 = (id)objc_opt_new();
              v90 = 0u;
              v91 = 0u;
              v92 = 0u;
              v93 = 0u;
              objc_msgSend(v20, "keyEnumerator");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v90, v110, 16);
              if (v33)
              {
                v34 = v33;
                v35 = *(_QWORD *)v91;
                do
                {
                  for (i = 0; i != v34; ++i)
                  {
                    if (*(_QWORD *)v91 != v35)
                      objc_enumerationMutation(v32);
                    v37 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * i);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend(MEMORY[0x1E0CB3940], "fp_providerDomainIDFromProviderID:domainIdentifier:", v21, v37);
                      v38 = (void *)objc_claimAutoreleasedReturnValue();
                      fp_current_or_default_log();
                      v39 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138543362;
                        v103 = v38;
                        _os_log_debug_impl(&dword_1CF55F000, v39, OS_LOG_TYPE_DEBUG, "[DEBUG] marking domain %{public}@ for preservation", buf, 0xCu);
                      }

                      objc_msgSend(v8, "addObject:", v38);
                    }
                  }
                  v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v90, v110, 16);
                }
                while (v34);
              }

              v14 = v67;
              v13 = v69;
              v20 = v72;
              v31 = v75;
            }
            else
            {
              v66 = v16;
              v96 = 0u;
              v97 = 0u;
              v94 = 0u;
              v95 = 0u;
              v74 = v65;
              v22 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v94, v111, 16);
              if (v22)
              {
                v23 = v22;
                v24 = *(_QWORD *)v95;
                while (2)
                {
                  for (j = 0; j != v23; ++j)
                  {
                    if (*(_QWORD *)v95 != v24)
                      objc_enumerationMutation(v74);
                    v26 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * j);
                    v27 = (void *)MEMORY[0x1D17D1B04]();
                    objc_msgSend(v26, "stringByAppendingString:", CFSTR("."));
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    v29 = objc_msgSend(v21, "hasPrefix:", v28);

                    objc_autoreleasePoolPop(v27);
                    if ((v29 & 1) != 0)
                    {

                      v20 = v72;
                      goto LABEL_21;
                    }
                  }
                  v23 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v94, v111, 16);
                  if (v23)
                    continue;
                  break;
                }
              }

              fp_current_or_default_log();
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543618;
                v103 = v66;
                v104 = 2114;
                v105 = v21;
                _os_log_debug_impl(&dword_1CF55F000, v30, OS_LOG_TYPE_DEBUG, "[DEBUG] Will collect %{public}@ because %{public}@ is no longer installed", buf, 0x16u);
              }

              objc_msgSend(v66, "path");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "addObject:", v31);
              v14 = v67;
              v13 = v69;
              v20 = v72;
            }

            v17 = v71;
          }

        }
        ++v15;
      }
      while (v15 != v13);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v112, 16);
    }
    while (v13);
  }

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v63, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDExtensionManager garbageCollectDomainsExceptIdentifiers:fromDirectory:isUserData:](v61, "garbageCollectDomainsExceptIdentifiers:fromDirectory:isUserData:", v8, v40, 0);

  objc_msgSend(MEMORY[0x1E0C99E98], "fp_cloudStorageDirectory");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDExtensionManager garbageCollectDomainsExceptIdentifiers:fromDirectory:isUserData:](v61, "garbageCollectDomainsExceptIdentifiers:fromDirectory:isUserData:", v8, v41, 1);

  if (objc_msgSend(MEMORY[0x1E0CA6B38], "isIndexingAvailable"))
  {
    objc_msgSend(MEMORY[0x1E0CA6B38], "defaultSearchableIndex");
    v42 = (id)objc_claimAutoreleasedReturnValue();
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v76 = v64;
    v43 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v86, v109, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v87;
      v46 = MEMORY[0x1E0C809B0];
      do
      {
        for (k = 0; k != v44; ++k)
        {
          if (*(_QWORD *)v87 != v45)
            objc_enumerationMutation(v76);
          v48 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * k);
          objc_msgSend(v48, "lastPathComponent");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v82[0] = v46;
          v82[1] = 3221225472;
          v82[2] = __86__FPDExtensionManager__garbageCollectRemovedProvidersForInstalledProviderIdentifiers___block_invoke;
          v82[3] = &unk_1E8C75358;
          v83 = v49;
          v84 = v73;
          v85 = v48;
          v50 = v49;
          objc_msgSend(v42, "deleteAllSearchableItemsForBundleID:completionHandler:", v50, v82);

        }
        v44 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v86, v109, 16);
      }
      while (v44);
    }

  }
  else
  {
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v42 = v64;
    v51 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v78, v108, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)v79;
      do
      {
        for (m = 0; m != v52; ++m)
        {
          if (*(_QWORD *)v79 != v53)
            objc_enumerationMutation(v42);
          v55 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * m);
          objc_msgSend(v55, "lastPathComponent");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = 0;
          v57 = objc_msgSend(v73, "removeItemAtPath:error:", v55, &v77);
          v58 = v77;
          if ((v57 & 1) == 0)
          {
            fp_current_or_default_log();
            v59 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v58, "fp_prettyDescription");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v103 = v56;
              v104 = 2114;
              v105 = v55;
              v106 = 2114;
              v107 = v60;
              _os_log_error_impl(&dword_1CF55F000, v59, OS_LOG_TYPE_ERROR, "[ERROR] Failed to remove domains entry for provider identifier %{public}@ at path %{public}@: %{public}@", buf, 0x20u);

            }
          }

        }
        v52 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v78, v108, 16);
      }
      while (v52);
    }
  }

}

void __86__FPDExtensionManager__garbageCollectRemovedProvidersForInstalledProviderIdentifiers___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __86__FPDExtensionManager__garbageCollectRemovedProvidersForInstalledProviderIdentifiers___block_invoke_cold_2((uint64_t)a1, v5, v6);
LABEL_9:

    goto LABEL_10;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __86__FPDExtensionManager__garbageCollectRemovedProvidersForInstalledProviderIdentifiers___block_invoke_cold_1((uint64_t)a1, v5);

  v7 = (void *)a1[5];
  v8 = a1[6];
  v13 = 0;
  v9 = objc_msgSend(v7, "removeItemAtPath:error:", v8, &v13);
  v3 = v13;
  if ((v9 & 1) == 0)
  {
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v10 = a1[4];
      v11 = a1[6];
      objc_msgSend(v3, "fp_prettyDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v15 = v10;
      v16 = 2114;
      v17 = v11;
      v18 = 2114;
      v19 = v12;
      _os_log_error_impl(&dword_1CF55F000, v5, OS_LOG_TYPE_ERROR, "[ERROR] Failed to remove domains entry for provider identifier %{public}@ at path %{public}@: %{public}@", buf, 0x20u);

    }
    goto LABEL_9;
  }
LABEL_10:

}

- (void)handleAllExtensionsStarted:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSObject *callbackQueue;
  _QWORD block[5];
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__FPDExtensionManager_handleAllExtensionsStarted___block_invoke;
  v10[3] = &unk_1E8C75850;
  v10[4] = self;
  v11 = v4;
  v6 = handleAllExtensionsStarted__onceToken;
  v7 = v4;
  if (v6 != -1)
    dispatch_once(&handleAllExtensionsStarted__onceToken, v10);
  callbackQueue = self->_callbackQueue;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __50__FPDExtensionManager_handleAllExtensionsStarted___block_invoke_2;
  block[3] = &unk_1E8C75E48;
  block[4] = self;
  dispatch_async(callbackQueue, block);

}

uint64_t __50__FPDExtensionManager_handleAllExtensionsStarted___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "migrateEnabledStateIfNecessary:", v2);

  return +[FPDSharedScheduler checkIn](FPDSharedScheduler, "checkIn");
}

uint64_t __50__FPDExtensionManager_handleAllExtensionsStarted___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 16))();
}

- (void)garbageCollectOnFirstLaunch
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__FPDExtensionManager_garbageCollectOnFirstLaunch__block_invoke;
  block[3] = &unk_1E8C75E48;
  block[4] = self;
  if (garbageCollectOnFirstLaunch_onceToken != -1)
    dispatch_once(&garbageCollectOnFirstLaunch_onceToken, block);
}

void __50__FPDExtensionManager_garbageCollectOnFirstLaunch__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  id v21;
  id v22;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "server");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isPastBuddy"))
  {
    v4 = objc_msgSend(MEMORY[0x1E0CAAC18], "runningInSyncBubble");

    if ((v4 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "userPersonaUniqueString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6
        || (objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager"),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            v8 = objc_msgSend(v7, "isSharedIPad"),
            v7,
            v8))
      {
        objc_msgSend(*(id *)(a1 + 32), "_garbageCollectRemovedProvidersForInstalledProviderIdentifiers:", v2);
      }
      objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "userPersonaUniqueString");
      v10 = objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "currentPersona");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = 0;
        objc_msgSend(v12, "userPersonaUniqueString");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13 == v10
          || (-[NSObject isEqualToString:](v13, "isEqualToString:", v10) & 1) != 0
          || !voucher_process_can_use_arbitrary_personas())
        {
          v19 = 0;
        }
        else
        {
          v21 = 0;
          v15 = (void *)objc_msgSend(v12, "copyCurrentPersonaContextWithError:", &v21);
          v16 = v21;
          v17 = v22;
          v22 = v15;

          if (v16)
          {
            fp_current_or_default_log();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              -[FPDDomainExtensionBackend startProvidingItemAtURL:readerID:readingOptions:request:completionHandler:].cold.2();

          }
          objc_msgSend(v12, "generateAndRestorePersonaContextWithPersonaUniqueString:", v10);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            fp_current_or_default_log();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              __50__FPDExtensionManager_garbageCollectOnFirstLaunch__block_invoke_cold_2();

          }
        }
        objc_msgSend(*(id *)(a1 + 32), "_garbageCollectRemovedProvidersForInstalledProviderIdentifiers:", v2);

        _FPRestorePersona();
      }
      goto LABEL_21;
    }
  }
  else
  {

  }
  fp_current_or_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __50__FPDExtensionManager_garbageCollectOnFirstLaunch__block_invoke_cold_1();
LABEL_21:

}

- (id)extensionTypes
{
  return &unk_1E8C95DC0;
}

- (id)_matchingAttributes
{
  void *v2;
  void *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0CB2A28];
  -[FPDExtensionManager extensionTypes](self, "extensionTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)loadProvidersAndMonitor
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *callbackQueue;
  _QWORD v8[6];
  uint8_t buf[16];

  -[FPDExtensionManager _loadAlternateContentsDictionary](self, "_loadAlternateContentsDictionary");
  fp_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);

  fp_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF55F000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "InitialEnumeration", "Initial enumeration of file providers", buf, 2u);
  }

  if (FPFeatureFlagHelenaIsEnabled())
    -[FPDExtensionManager helena_loadProvidersAndMonitor](self, "helena_loadProvidersAndMonitor");
  else
    -[FPDExtensionManager legacy_loadProvidersAndMonitor](self, "legacy_loadProvidersAndMonitor");
  -[FPDExtensionManager _loadPausedSyncItemsDictionary](self, "_loadPausedSyncItemsDictionary");
  callbackQueue = self->_callbackQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__FPDExtensionManager_loadProvidersAndMonitor__block_invoke;
  v8[3] = &unk_1E8C76470;
  v8[4] = self;
  v8[5] = v4;
  dispatch_async(callbackQueue, v8);
}

void __46__FPDExtensionManager_loadProvidersAndMonitor__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  objc_msgSend(*(id *)(a1 + 32), "afterFirstDiscovery");
  fp_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF55F000, v3, OS_SIGNPOST_INTERVAL_END, v4, "InitialEnumeration", (const char *)&unk_1CF637B99, v5, 2u);
  }

}

- (void)helena_loadProvidersAndMonitor
{
  LSObserver *v3;
  LSObserver *observer;
  objc_class *v5;
  void *v6;
  void *v7;
  APSubjectMonitorSubscription *v8;
  APSubjectMonitorSubscription *apSubscription;
  void *v10;
  NSObject *v11;

  if (self->_observer)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ you shouldn't call -loadProviders twice"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDExtensionManager helena_loadProvidersAndMonitor]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionManager.m", 375, (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
  }
  v3 = (LSObserver *)objc_alloc_init(MEMORY[0x1E0CA58E8]);
  observer = self->_observer;
  self->_observer = v3;

  -[LSObserver setDelegate:](self->_observer, "setDelegate:", self);
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSObserver setName:](self->_observer, "setName:", v6);

  -[LSObserver startObserving](self->_observer, "startObserving");
  objc_msgSend(MEMORY[0x1E0CF96A8], "subjectMonitorRegistry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addMonitor:subjectMask:", self, 1);
  v8 = (APSubjectMonitorSubscription *)objc_claimAutoreleasedReturnValue();
  apSubscription = self->_apSubscription;
  self->_apSubscription = v8;

  -[FPDExtensionManager forceSynchronousProviderUpdate](self, "forceSynchronousProviderUpdate");
}

- (void)legacy_loadProvidersAndMonitor
{
  FPDExtensionManager *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id matchingContext;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_matchingContext)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ you shouldn't call -loadProviders twice"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDExtensionManager legacy_loadProvidersAndMonitor]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionManager.m", 395, (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
  }
  v3 = (void *)MEMORY[0x1E0CB35D8];
  -[FPDExtensionManager _matchingAttributes](v2, "_matchingAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__FPDExtensionManager_legacy_loadProvidersAndMonitor__block_invoke;
  v11[3] = &unk_1E8C787A8;
  v11[4] = v2;
  objc_msgSend(v3, "beginMatchingExtensionsWithAttributes:completion:", v4, v11);
  v5 = objc_claimAutoreleasedReturnValue();
  matchingContext = v2->_matchingContext;
  v2->_matchingContext = (id)v5;

  if (!v2->_matchingContext)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("can't watch the list of extensions"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDExtensionManager legacy_loadProvidersAndMonitor]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionManager.m", 420, (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
  }
  -[FPDExtensionManager forceSynchronousProviderUpdate](v2, "forceSynchronousProviderUpdate");
  objc_sync_exit(v2);

}

void __53__FPDExtensionManager_legacy_loadProvidersAndMonitor__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  uint64_t section;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    section = __fp_create_section();
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __53__FPDExtensionManager_legacy_loadProvidersAndMonitor__block_invoke_cold_2(&section);

    __fp_leave_section_Debug();
  }
  else
  {
    v8 = *(id *)(a1 + 32);
    objc_sync_enter(v8);
    section = __fp_create_section();
    fp_current_or_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __53__FPDExtensionManager_legacy_loadProvidersAndMonitor__block_invoke_cold_1(&section);

    objc_msgSend(*(id *)(a1 + 32), "legacy_updateProviderListForMatchingExtensions:", v5);
    __fp_leave_section_Debug();
    objc_sync_exit(v8);

  }
}

- (void)purge:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[FPDExtensionManager server](self, "server");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "volumeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __29__FPDExtensionManager_purge___block_invoke;
  v8[3] = &unk_1E8C75330;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "enumerateLibrariesWithBlock:", v8);

}

uint64_t __29__FPDExtensionManager_purge___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "purgatoryDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "purgeAsyncAtUrl:", v3);

  return 1;
}

- (id)extensionPointRecords
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__FPDExtensionManager_extensionPointRecords__block_invoke;
  block[3] = &unk_1E8C75E48;
  block[4] = self;
  if (extensionPointRecords_onceToken != -1)
    dispatch_once(&extensionPointRecords_onceToken, block);
  return (id)extensionPointRecords_ret;
}

void __44__FPDExtensionManager_extensionPointRecords__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  int v26;
  __int16 v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "extensionTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      v9 = v6;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v3);
        v10 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v8);
        v11 = objc_alloc(MEMORY[0x1E0CA58E0]);
        v18 = v9;
        v12 = (void *)objc_msgSend(v11, "initWithIdentifier:platform:error:", v10, 2, &v18);
        v6 = v18;

        if (v12)
        {
          objc_msgSend(v2, "addObject:", v12);
        }
        else
        {
          fp_current_or_default_log();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v6, "fp_prettyDescription");
            v14 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v24 = v10;
            v25 = 1024;
            v26 = 2;
            v27 = 2112;
            v28 = v14;
            v15 = (void *)v14;
            _os_log_error_impl(&dword_1CF55F000, v13, OS_LOG_TYPE_ERROR, "[ERROR] Extension record %@ for platform %d missing: %@", buf, 0x1Cu);

          }
        }

        ++v8;
        v9 = v6;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  v16 = objc_msgSend(v2, "copy");
  v17 = (void *)extensionPointRecords_ret;
  extensionPointRecords_ret = v16;

}

- (void)observerDidObserveDatabaseChange:(id)a3
{
  NSObject *callbackQueue;
  _QWORD block[5];

  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__FPDExtensionManager_observerDidObserveDatabaseChange___block_invoke;
  block[3] = &unk_1E8C75E48;
  block[4] = self;
  dispatch_async(callbackQueue, block);
}

uint64_t __56__FPDExtensionManager_observerDidObserveDatabaseChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "synchronousProviderUpdate:", 0);
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *callbackQueue;
  NSObject *v14;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;

  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = a3;
  -[FPDExtensionManager allProviders](self, "allProviders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fp_map:", &__block_literal_global_37);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __68__FPDExtensionManager_appProtectionSubjectsChanged_forSubscription___block_invoke_2;
  v16[3] = &unk_1E8C78810;
  v11 = v9;
  v17 = v11;
  objc_msgSend(v6, "fp_filter:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "count"))
  {
    callbackQueue = self->_callbackQueue;
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __68__FPDExtensionManager_appProtectionSubjectsChanged_forSubscription___block_invoke_40;
    v15[3] = &unk_1E8C75E48;
    v15[4] = self;
    dispatch_async(callbackQueue, v15);
  }
  else
  {
    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[FPDExtensionManager appProtectionSubjectsChanged:forSubscription:].cold.1();

  }
}

id __68__FPDExtensionManager_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "descriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topLevelBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __68__FPDExtensionManager_appProtectionSubjectsChanged_forSubscription___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "containsObject:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __68__FPDExtensionManager_appProtectionSubjectsChanged_forSubscription___block_invoke_40(uint64_t a1)
{
  NSObject *v2;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __68__FPDExtensionManager_appProtectionSubjectsChanged_forSubscription___block_invoke_40_cold_1();

  return objc_msgSend(*(id *)(a1 + 32), "forceSynchronousProviderUpdate");
}

- (void)forceSynchronousProviderUpdate
{
  -[FPDExtensionManager synchronousProviderUpdate:](self, "synchronousProviderUpdate:", 1);
}

- (void)synchronousProviderUpdate:(BOOL)a3
{
  _BOOL4 v3;
  FPDExtensionManager *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  if (FPFeatureFlagHelenaIsEnabled())
  {
    v5 = (id)objc_opt_new();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[FPDExtensionManager extensionPointRecords](v4, "extensionPointRecords");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v21;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(MEMORY[0x1E0CA5848], "enumeratorWithExtensionPointRecord:options:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v9), 0x4000000000000000);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "allObjects");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObjectsFromArray:", v11);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v7);
    }

    v12 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v5, "fp_map:", &__block_literal_global_45);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!-[NSSet isEqualToSet:](v4->_providerUUIDs, "isEqualToSet:", v14) || v3)
    {
      -[FPDExtensionManager _updateProviderListForMatchingExtensionRecords:](v4, "_updateProviderListForMatchingExtensionRecords:", v5);
      objc_storeStrong((id *)&v4->_providerUUIDs, v14);
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB35D8];
    -[FPDExtensionManager _matchingAttributes](v4, "_matchingAttributes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v15, "extensionsWithMatchingAttributes:error:", v16, &v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v19;

    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("can't enumerate extensions: %@"), v5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

      __assert_rtn("-[FPDExtensionManager synchronousProviderUpdate:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionManager.m", 565, (const char *)objc_msgSend(objc_retainAutorelease(v17), "UTF8String"));
    }
    -[FPDExtensionManager legacy_updateProviderListForMatchingExtensions:](v4, "legacy_updateProviderListForMatchingExtensions:", v14);
  }

  objc_sync_exit(v4);
}

uint64_t __49__FPDExtensionManager_synchronousProviderUpdate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

- (void)updateProviderOnAppearingVolume:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableDictionary *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSObject *callbackQueue;
  id obj;
  _QWORD block[5];
  _QWORD v17[4];
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = dispatch_group_create();
  v6 = self->_providersByIdentifier;
  objc_sync_enter(v6);
  -[NSMutableDictionary allValues](self->_providersByIdentifier, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v6);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  v9 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v12, "importDomainsFromLibrary:updatePlist:", v4, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        dispatch_group_enter(v5);
        v17[0] = v9;
        v17[1] = 3221225472;
        v17[2] = __55__FPDExtensionManager_updateProviderOnAppearingVolume___block_invoke;
        v17[3] = &unk_1E8C75E48;
        v18 = v5;
        objc_msgSend(v12, "startDomains:completion:", v13, v17);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  callbackQueue = self->_callbackQueue;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __55__FPDExtensionManager_updateProviderOnAppearingVolume___block_invoke_2;
  block[3] = &unk_1E8C75E48;
  block[4] = self;
  dispatch_group_notify(v5, callbackQueue, block);

}

void __55__FPDExtensionManager_updateProviderOnAppearingVolume___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __55__FPDExtensionManager_updateProviderOnAppearingVolume___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 16))();
}

- (void)updateProviderOnDisappearingVolume:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *callbackQueue;
  _QWORD block[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self->_providersByIdentifier;
  objc_sync_enter(v8);
  -[NSMutableDictionary allValues](self->_providersByIdentifier, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v8);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13++), "invalidateAllDomainsOnVolume:reason:", v6, v7);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__FPDExtensionManager_updateProviderOnDisappearingVolume_reason___block_invoke;
  block[3] = &unk_1E8C75E48;
  block[4] = self;
  dispatch_async(callbackQueue, block);

}

void __65__FPDExtensionManager_updateProviderOnDisappearingVolume_reason___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 96));
  objc_msgSend(WeakRetained, "signalProviderChanges");

}

- (void)migrateEnabledStateIfNecessary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  id v14;
  NSObject *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  fileProviderDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("LegacyEnabledStateHasBeenMigrated"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:", v5);

  if ((v7 & 1) == 0)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v3;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12++), "enableAllDomainsIfNoUserElection");
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

    v16 = 0;
    v13 = objc_msgSend(&stru_1E8C795D8, "writeToFile:atomically:encoding:error:", v5, 0, 4, &v16);
    v14 = v16;
    if ((v13 & 1) == 0)
    {
      fp_current_or_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[FPDExtensionManager migrateEnabledStateIfNecessary:].cold.1(v14);

    }
  }

}

- (id)extensionsByID:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v35;
  uint64_t v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v39;
    *(_QWORD *)&v6 = 138412290;
    v35 = v6;
    v36 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v39 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v10, "identifier", v35);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v12 = v10;
          -[NSObject identifier](v12, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = v12;
          if (!v14)
            goto LABEL_24;
          fp_current_or_default_log();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            -[NSObject identifier](v12, "identifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "identifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject identifier](v12, "identifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v43 = v17;
            v44 = 2112;
            v45 = v18;
            v46 = 2112;
            v47 = v19;
            _os_log_impl(&dword_1CF55F000, v16, OS_LOG_TYPE_INFO, "[INFO] %@ and %@ are backing the same identifier, %@:", buf, 0x20u);

            v8 = v36;
          }

          -[NSObject bundleVersion](v12, "bundleVersion");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "bundleVersion");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v20, "compare:options:", v21, 64);

          if (v22)
          {
            if (v22 == -1)
            {
              fp_current_or_default_log();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                -[NSObject identifier](v12, "identifier");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject bundleVersion](v12, "bundleVersion");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "identifier");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "bundleVersion");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138413058;
                v43 = v24;
                v44 = 2112;
                v45 = v25;
                v46 = 2112;
                v47 = v26;
                v48 = 2112;
                v49 = v27;
                _os_log_impl(&dword_1CF55F000, v23, OS_LOG_TYPE_INFO, "[INFO] Ignoring provider %@ (%@) in favor of provider %@ (%@)", buf, 0x2Au);

                v8 = v36;
              }

              v15 = v14;
              v28 = v12;
LABEL_23:

LABEL_24:
              -[NSObject identifier](v12, "identifier");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, v33);

              goto LABEL_25;
            }
            fp_current_or_default_log();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v14, "identifier");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "bundleVersion");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject identifier](v12, "identifier");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject bundleVersion](v12, "bundleVersion");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v43 = v29;
              v44 = 2112;
              v45 = v30;
              v46 = 2112;
              v47 = v31;
              v48 = 2112;
              v49 = v32;
              _os_log_impl(&dword_1CF55F000, v28, OS_LOG_TYPE_INFO, "[INFO] Ignoring provider %@ (%@) in favor of provider %@ (%@)", buf, 0x2Au);
LABEL_21:

              v8 = v36;
            }
          }
          else
          {
            fp_current_or_default_log();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v14, "identifier");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject identifier](v12, "identifier");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject bundleVersion](v12, "bundleVersion");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject identifier](v12, "identifier");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v43 = v29;
              v44 = 2112;
              v45 = v30;
              v46 = 2112;
              v47 = v31;
              v48 = 2112;
              v49 = v32;
              _os_log_error_impl(&dword_1CF55F000, v28, OS_LOG_TYPE_ERROR, "[ERROR] Provider %@ and %@ have the same version number (%@). %@ will win nondeterministically.", buf, 0x2Au);
              goto LABEL_21;
            }
          }
          v15 = v12;
          goto LABEL_23;
        }
        fp_current_or_default_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v35;
          v43 = v10;
          _os_log_error_impl(&dword_1CF55F000, v15, OS_LOG_TYPE_ERROR, "[ERROR] ignoring extension without identifier: %@", buf, 0xCu);
        }
LABEL_25:

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)uniquedExtensions:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  id v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  uint8_t v54[4];
  uint64_t v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v5 = v3;
  v6 = (void *)v4;
  v7 = v5;
  v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v43;
    v39 = (void *)v4;
    v40 = v7;
    v41 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v43 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        if ((objc_msgSend(v12, "supportsFPFS") & 1) == 0)
        {
          objc_msgSend(v12, "extensionStorageURLs");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "firstObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            v15 = v12;
            objc_msgSend(v6, "objectForKeyedSubscript:", v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v16)
              goto LABEL_24;
            fp_current_or_default_log();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              -[NSObject identifier](v15, "identifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "identifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "fp_shortDescription");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v47 = v18;
              v48 = 2112;
              v49 = v19;
              v50 = 2112;
              v51 = v20;
              _os_log_impl(&dword_1CF55F000, v17, OS_LOG_TYPE_INFO, "[INFO] %@ and %@ are backing the same location, %@:", buf, 0x20u);

              v7 = v40;
            }

            -[NSObject bundleVersion](v15, "bundleVersion");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "bundleVersion");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v21, "compare:options:", v22, 64);

            if (v23)
            {
              if (v23 == -1)
              {
                fp_current_or_default_log();
                v24 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                {
                  -[NSObject identifier](v15, "identifier");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject bundleVersion](v15, "bundleVersion");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "identifier");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "bundleVersion");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138413058;
                  v47 = v25;
                  v48 = 2112;
                  v49 = v26;
                  v50 = 2112;
                  v51 = v27;
                  v52 = 2112;
                  v53 = v28;
                  _os_log_impl(&dword_1CF55F000, v24, OS_LOG_TYPE_INFO, "[INFO] Ignoring provider %@ (%@) in favor of provider %@ (%@)", buf, 0x2Au);

                  v6 = v39;
                  v7 = v40;

                }
                v29 = v15;
                v15 = v16;
LABEL_23:
                v10 = v41;

LABEL_24:
                objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, v14);

LABEL_25:
                continue;
              }
              fp_current_or_default_log();
              v29 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                goto LABEL_23;
              objc_msgSend(v16, "identifier");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "bundleVersion");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject identifier](v15, "identifier");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject bundleVersion](v15, "bundleVersion");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v47 = v30;
              v48 = 2112;
              v49 = v31;
              v50 = 2112;
              v51 = v32;
              v52 = 2112;
              v53 = v33;
              _os_log_impl(&dword_1CF55F000, v29, OS_LOG_TYPE_INFO, "[INFO] Ignoring provider %@ (%@) in favor of provider %@ (%@)", buf, 0x2Au);
            }
            else
            {
              fp_current_or_default_log();
              v29 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                goto LABEL_23;
              objc_msgSend(v16, "identifier");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject identifier](v15, "identifier");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject bundleVersion](v15, "bundleVersion");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject identifier](v15, "identifier");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v47 = v30;
              v48 = 2112;
              v49 = v31;
              v50 = 2112;
              v51 = v32;
              v52 = 2112;
              v53 = v33;
              _os_log_error_impl(&dword_1CF55F000, v29, OS_LOG_TYPE_ERROR, "[ERROR] Provider %@ and %@ have the same version number (%@). %@ will win nondeterministically.", buf, 0x2Au);
            }

            v7 = v40;
            v6 = v39;
            goto LABEL_23;
          }
          fp_current_or_default_log();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            -[FPDExtensionManager uniquedExtensions:].cold.1(v54, v12, &v55, v15);
          goto LABEL_25;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
    }
    while (v9);
  }

  objc_msgSend(v7, "fp_filter:", &__block_literal_global_53);
  v34 = v6;
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "allValues");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "arrayByAddingObjectsFromArray:", v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

uint64_t __41__FPDExtensionManager_uniquedExtensions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsFPFS");
}

- (void)legacy_updateProviderListForMatchingExtensions:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  FPDExtensionManager *v13;

  v4 = (objc_class *)MEMORY[0x1E0C99EA0];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithSuiteName:", CFSTR("com.apple.fileproviderd"));
  objc_msgSend(v6, "stringForKey:", CFSTR("provider-filter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__FPDExtensionManager_legacy_updateProviderListForMatchingExtensions___block_invoke;
  v11[3] = &unk_1E8C788B8;
  v12 = v8;
  v13 = self;
  v10 = v8;
  objc_msgSend(v5, "fp_map:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[FPDExtensionManager _updateProviderListForFilteredFPDExtensions:](self, "_updateProviderListForFilteredFPDExtensions:", v9);
}

id __70__FPDExtensionManager_legacy_updateProviderListForMatchingExtensions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  const char *v10;
  NSObject *v11;
  id WeakRetained;
  void *v13;

  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (*(_QWORD *)(a1 + 32)
    && (objc_msgSend(v4, "lowercaseString"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "containsString:", *(_QWORD *)(a1 + 32)),
        v6,
        !v7))
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "objectForKey:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("extension session queue for %@"), v5);
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v10 = (const char *)objc_msgSend(v9, "UTF8String");
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v11 = objc_claimAutoreleasedReturnValue();
      v8 = dispatch_queue_create(v10, v11);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "setObject:forKey:", v8, v5);
    }
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 96));
    +[FPDExtension instanceWithExtension:queue:server:](FPDExtension, "instanceWithExtension:queue:server:", v3, v8, WeakRetained);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (void)_updateProviderListForMatchingExtensionRecords:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  FPDExtensionManager *v13;

  v4 = (objc_class *)MEMORY[0x1E0C99EA0];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithSuiteName:", CFSTR("com.apple.fileproviderd"));
  objc_msgSend(v6, "stringForKey:", CFSTR("provider-filter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__FPDExtensionManager__updateProviderListForMatchingExtensionRecords___block_invoke;
  v11[3] = &unk_1E8C788E0;
  v12 = v8;
  v13 = self;
  v10 = v8;
  objc_msgSend(v5, "fp_map:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[FPDExtensionManager _updateProviderListForFilteredFPDExtensions:](self, "_updateProviderListForFilteredFPDExtensions:", v9);
}

id __70__FPDExtensionManager__updateProviderListForMatchingExtensionRecords___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  const char *v11;
  NSObject *v12;
  id WeakRetained;

  v3 = a2;
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (*(_QWORD *)(a1 + 32)
    && (objc_msgSend(v4, "lowercaseString"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "containsString:", *(_QWORD *)(a1 + 32)),
        v6,
        !v7))
  {
    v8 = 0;
  }
  else
  {
    v8 = 0;
    if (objc_msgSend(v5, "fp_isValidProviderIdentifierWithError:", 0))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "objectForKey:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("extension session queue for %@"), v5);
        v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v11 = (const char *)objc_msgSend(v10, "UTF8String");
        dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v12 = objc_claimAutoreleasedReturnValue();
        v9 = dispatch_queue_create(v11, v12);

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "setObject:forKey:", v9, v5);
      }
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 96));
      +[FPDExtension instanceWithExtensionRecord:queue:server:](FPDExtension, "instanceWithExtensionRecord:queue:server:", v3, v9, WeakRetained);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v8;
}

- (void)_updateProviderListForFilteredFPDExtensions:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  void *v31;
  void *v32;
  FPDPushConnection *pushConnection;
  void *v34;
  NSMutableDictionary *v35;
  NSObject *callbackQueue;
  id v37;
  void *v38;
  void *context;
  id v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id obj;
  FPDExtensionManager *v47;
  _QWORD block[5];
  id v49;
  _QWORD v50[4];
  NSObject *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint64_t section;
  _BYTE v65[128];
  uint8_t v66[128];
  uint8_t buf[4];
  uint64_t v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  id v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  context = (void *)MEMORY[0x1D17D1B04]();
  section = __fp_create_section();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v47 = self;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v68 = section;
    _os_log_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] ┏%llx Updating list of extensions", buf, 0xCu);
  }

  v42 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v43 = (id)objc_opt_new();
  -[NSMutableDictionary allValues](self->_providersByIdentifier, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(v5, "mutableCopy");

  -[FPDExtensionManager uniquedExtensions:](self, "uniquedExtensions:", v40);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = (id)objc_msgSend(v38, "mutableCopy");
  v6 = 0;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v61 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1D17D1B04]();
        objc_msgSend(v10, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (!v12)
        {
          fp_current_or_default_log();
          v14 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            goto LABEL_22;
          *(_DWORD *)buf = 138412290;
          v68 = (uint64_t)v10;
          v15 = v14;
          v16 = "[NOTICE] File provider extension %@ has no identifier. Ignoring.";
          goto LABEL_20;
        }
        if (objc_msgSend(v12, "fp_isLegacyCloudDocsIdentifier")
          && FPIsCloudDocsWithFPFSEnabled())
        {
          fp_current_or_default_log();
          v14 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            goto LABEL_22;
          *(_DWORD *)buf = 138543362;
          v68 = (uint64_t)v13;
          v15 = v14;
          v16 = "[NOTICE] ignoring non-FPFS %{public}@ extension";
LABEL_20:
          _os_log_impl(&dword_1CF55F000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);
          goto LABEL_22;
        }
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider")))
          v6 |= objc_msgSend(v10, "isAppExtensionReachable");
        -[NSMutableDictionary objectForKeyedSubscript:](v47->_providersByIdentifier, "objectForKeyedSubscript:", v13);
        v17 = objc_claimAutoreleasedReturnValue();
        v14 = v17;
        if (v17 && -[NSObject isEqual:](v17, "isEqual:", v10))
        {
          objc_msgSend(v42, "setObject:forKeyedSubscript:", v14, v13);
          objc_msgSend(v41, "removeObject:", v14);
        }
        else
        {
          objc_msgSend(v42, "setObject:forKeyedSubscript:", v10, v13);
          objc_msgSend(v43, "addObject:", v10);
        }
LABEL_22:

        objc_autoreleasePoolPop(v11);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
    }
    while (v7);
  }

  if (!(v6 & 1 | ((FPIsCloudDocsWithFPFSEnabled() & 1) == 0)))
  {
    fp_current_or_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CF55F000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] FPFS is enabled for iCloudDrive, but extension is missing.", buf, 2u);
    }

  }
  fp_current_or_default_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v68 = (uint64_t)v40;
    v69 = 2114;
    v70 = v41;
    v71 = 2114;
    v72 = v43;
    _os_log_impl(&dword_1CF55F000, v19, OS_LOG_TYPE_DEFAULT, "[NOTICE] %{public}@ -> {unregistering: %{public}@, registering: %{public}@}", buf, 0x20u);
  }

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v45 = v41;
  v20 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v57;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v57 != v21)
          objc_enumerationMutation(v45);
        v23 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
        objc_msgSend(v23, "descriptor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "topLevelBundleIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
          -[FPDPushConnection setMessageDelegate:forApplicationBundleIdentifier:](v47->_pushConnection, "setMessageDelegate:forApplicationBundleIdentifier:", 0, v25);
        objc_msgSend(v23, "invalidateWithReason:", CFSTR("extension was unregistered"));

      }
      v20 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
    }
    while (v20);
  }

  v26 = dispatch_group_create();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v44 = v43;
  v27 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v53;
    do
    {
      for (k = 0; k != v27; ++k)
      {
        if (*(_QWORD *)v53 != v28)
          objc_enumerationMutation(v44);
        v30 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * k);
        dispatch_group_enter(v26);
        objc_msgSend(v30, "descriptor");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "topLevelBundleIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32 && objc_msgSend(v30, "isAppExtensionReachable"))
        {
          pushConnection = v47->_pushConnection;
          objc_msgSend(v30, "asAppExtensionBackedProvider");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[FPDPushConnection setMessageDelegate:forApplicationBundleIdentifier:](pushConnection, "setMessageDelegate:forApplicationBundleIdentifier:", v34, v32);

        }
        v50[0] = MEMORY[0x1E0C809B0];
        v50[1] = 3221225472;
        v50[2] = __67__FPDExtensionManager__updateProviderListForFilteredFPDExtensions___block_invoke;
        v50[3] = &unk_1E8C75E48;
        v51 = v26;
        objc_msgSend(v30, "startWithCompletion:", v50);

      }
      v27 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
    }
    while (v27);
  }

  v35 = v47->_providersByIdentifier;
  objc_sync_enter(v35);
  if ((-[NSMutableDictionary isEqual:](v47->_providersByIdentifier, "isEqual:", v42) & 1) == 0)
    -[NSMutableDictionary setDictionary:](v47->_providersByIdentifier, "setDictionary:", v42);
  objc_sync_exit(v35);

  -[FPDExtensionManager garbageCollectOnFirstLaunch](v47, "garbageCollectOnFirstLaunch");
  callbackQueue = v47->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__FPDExtensionManager__updateProviderListForFilteredFPDExtensions___block_invoke_2;
  block[3] = &unk_1E8C75850;
  block[4] = v47;
  v49 = v42;
  v37 = v42;
  dispatch_group_notify(v26, callbackQueue, block);

  __fp_leave_section_Notice();
  objc_autoreleasePoolPop(context);

}

void __67__FPDExtensionManager__updateProviderListForFilteredFPDExtensions___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __67__FPDExtensionManager__updateProviderListForFilteredFPDExtensions___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleAllExtensionsStarted:", *(_QWORD *)(a1 + 40));
}

- (id)nonEvictableSizeByProviderDomain
{
  void *v3;
  NSMutableDictionary *v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_providersByIdentifier;
  objc_sync_enter(v4);
  -[NSMutableDictionary allValues](self->_providersByIdentifier, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v4);

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v5;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v21)
  {
    v20 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v7, "nsDomainsByID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "count") == 0;

        if (!v9)
        {
          v24 = 0u;
          v25 = 0u;
          v22 = 0u;
          v23 = 0u;
          objc_msgSend(v7, "relevantDomainsByID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "allValues");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          if (v12)
          {
            v13 = *(_QWORD *)v23;
            do
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v23 != v13)
                  objc_enumerationMutation(v11);
                v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
                if (objc_msgSend(v15, "isUsingFPFS"))
                {
                  objc_msgSend(v15, "providerDomainID");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v15, "nonEvictableSpace"));
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, v16);

                }
              }
              v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            }
            while (v12);
          }

        }
      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v21);
  }

  return v3;
}

- (id)domainWithID:(id)a3 reason:(unint64_t *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  objc_msgSend(v6, "fp_toProviderID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDExtensionManager providerWithIdentifier:checkInvalidation:reason:](self, "providerWithIdentifier:checkInvalidation:reason:", v7, 0, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "fp_toDomainIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "domainForIdentifier:reason:", v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)domainForActionOperationLocator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "isProviderItem"))
  {
    objc_msgSend(v4, "asFPItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "itemID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPDExtensionManager domainFromItemID:reason:](self, "domainFromItemID:reason:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "asURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[FPDExtensionManager domainForURL:reason:](self, "domainForURL:reason:", v5, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)domainsForAppBundleIdentifier:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  id obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = self->_providersByIdentifier;
  objc_sync_enter(v5);
  -[NSMutableDictionary allValues](self->_providersByIdentifier, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  objc_sync_exit(v5);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v7;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v31;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v31 != v22)
        {
          v9 = v8;
          objc_enumerationMutation(obj);
          v8 = v9;
        }
        v24 = v8;
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v8);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        objc_msgSend(v10, "domainsByID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "allValues");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v13)
        {
          v14 = *(_QWORD *)v27;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v27 != v14)
                objc_enumerationMutation(v12);
              v16 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
              objc_msgSend(v10, "providerDomainForDomain:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "topLevelBundleIdentifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v4, "isEqualToString:", v18);

              if (v19)
                objc_msgSend(v25, "addObject:", v16);

            }
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          }
          while (v13);
        }

        v8 = v24 + 1;
      }
      while (v24 + 1 != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v23);
  }

  return v25;
}

uint64_t __67__FPDExtensionManager_defaultProviderWithTopLevelBundleIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

id __69__FPDExtensionManager_providersWithGroupContainers_bundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "isAppExtensionReachable"))
  {
    objc_msgSend(v2, "asAppExtensionBackedProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setAlternateContentsURL:(id)a3 forItemID:(id)a4
{
  id v6;
  NSMutableDictionary *alternateContentsURLDictionary;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  alternateContentsURLDictionary = self->_alternateContentsURLDictionary;
  if (!alternateContentsURLDictionary)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ _alternateContentsURLDictionary shouldn't be nil"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDExtensionManager setAlternateContentsURL:forItemID:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionManager.m", 1147, (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
  }
  v8 = v6;
  v9 = alternateContentsURLDictionary;
  objc_sync_enter(v9);
  objc_msgSend(v8, "providerID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_7;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_alternateContentsURLDictionary, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
LABEL_6:
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, v8);

LABEL_7:
    -[FPDExtensionManager _serializeAlternateContentsURLDictionary:](self, "_serializeAlternateContentsURLDictionary:", self->_alternateContentsURLDictionary);
    goto LABEL_8;
  }
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_alternateContentsURLDictionary, "setObject:forKeyedSubscript:", v11, v10);
    goto LABEL_6;
  }
LABEL_8:

  objc_sync_exit(v9);
}

- (id)alternateContentsURLForItemID:(id)a3
{
  id v4;
  NSMutableDictionary *alternateContentsURLDictionary;
  void *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  NSObject *v14;

  v4 = a3;
  alternateContentsURLDictionary = self->_alternateContentsURLDictionary;
  if (!alternateContentsURLDictionary)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ _alternateContentsURLDictionary shouldn't be nil"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDExtensionManager alternateContentsURLForItemID:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionManager.m", 1168, (const char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String"));
  }
  v6 = v4;
  v7 = alternateContentsURLDictionary;
  objc_sync_enter(v7);
  v8 = self->_alternateContentsURLDictionary;
  objc_msgSend(v6, "providerID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v7);
  return v11;
}

- (id)alternateContentsDictionaryForProviderIdentifier:(id)a3
{
  id v4;
  NSMutableDictionary *alternateContentsURLDictionary;
  void *v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  void *v11;
  NSObject *v12;

  v4 = a3;
  alternateContentsURLDictionary = self->_alternateContentsURLDictionary;
  if (!alternateContentsURLDictionary)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ _alternateContentsURLDictionary shouldn't be nil"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDExtensionManager alternateContentsDictionaryForProviderIdentifier:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionManager.m", 1176, (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"));
  }
  v6 = v4;
  v7 = alternateContentsURLDictionary;
  objc_sync_enter(v7);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_alternateContentsURLDictionary, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  objc_sync_exit(v7);
  return v9;
}

- (void)_loadAlternateContentsDictionary
{
  void *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *alternateContentsURLDictionary;

  -[FPDExtensionManager _deserializedAlternateContentsDictionary](self, "_deserializedAlternateContentsDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (NSMutableDictionary *)objc_msgSend(v3, "mutableCopy");

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  }
  alternateContentsURLDictionary = self->_alternateContentsURLDictionary;
  self->_alternateContentsURLDictionary = v4;

}

- (void)_serializeAlternateContentsURLDictionary:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  char v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v3;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
  if (v29)
  {
    v27 = *(_QWORD *)v41;
    v33 = (void *)*MEMORY[0x1E0CAAB38];
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v41 != v27)
          objc_enumerationMutation(obj);
        v31 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v4);
        v32 = v4;
        objc_msgSend(obj, "objectForKeyedSubscript:", v27);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v7 = v5;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v37;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v37 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
              objc_msgSend(v7, "objectForKeyedSubscript:", v12);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "path");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (v14)
              {
                objc_msgSend(v12, "domainIdentifier");
                v15 = objc_claimAutoreleasedReturnValue();
                v16 = (void *)v15;
                v17 = v33;
                if (v15)
                  v17 = (void *)v15;
                v18 = v17;

                objc_msgSend(v6, "objectForKeyedSubscript:", v18);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v19)
                {
                  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, v18);
                }
                objc_msgSend(v12, "identifier");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "setObject:forKeyedSubscript:", v14, v20);

              }
              else
              {
                fp_current_or_default_log();
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v45 = v13;
                  _os_log_error_impl(&dword_1CF55F000, v18, OS_LOG_TYPE_ERROR, "[ERROR] nil path for url %@", buf, 0xCu);
                }
              }

            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
          }
          while (v9);
        }

        objc_msgSend(v28, "setObject:forKeyedSubscript:", v6, v31);
        v4 = v32 + 1;
      }
      while (v32 + 1 != v29);
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    }
    while (v29);
  }

  v35 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v28, 200, 0, &v35);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v35;
  if (!v21)
  {
    fp_current_or_default_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[FPDExtensionManager _serializeAlternateContentsURLDictionary:].cold.1(v22);
    goto LABEL_30;
  }
  alternateContentsPlistURL();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v22;
  v24 = objc_msgSend(v21, "writeToURL:options:error:", v23, 1, &v34);
  v25 = v34;

  if ((v24 & 1) == 0)
  {
    fp_current_or_default_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[FPDExtensionManager _serializeAlternateContentsURLDictionary:].cold.2(v25, v26);
    v22 = v25;
LABEL_30:

    v25 = v22;
  }

}

- (id)_deserializedAlternateContentsDictionary
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  FPDExtensionManager *v33;
  id v34;
  void *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  NSObject *obj;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  char v46;
  void *v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  id v61;
  id v62;
  uint8_t buf[4];
  void *v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99D50];
  alternateContentsPlistURL();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0;
  objc_msgSend(v3, "dataWithContentsOfURL:options:error:", v4, 0, &v62);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v62;

  if (v5)
  {
    v61 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v5, 0, 0, &v61);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v61;

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSObject count](v7, "count"));
      v37 = (id)objc_claimAutoreleasedReturnValue();
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v7 = v7;
      v38 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
      if (v38)
      {
        v33 = self;
        v34 = v8;
        obj = v7;
        v46 = 0;
        v35 = v5;
        v36 = *(_QWORD *)v58;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v58 != v36)
            {
              v10 = v9;
              objc_enumerationMutation(obj);
              v9 = v10;
            }
            v40 = v9;
            v48 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v9);
            -[NSObject objectForKeyedSubscript:](obj, "objectForKeyedSubscript:");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = (void *)objc_opt_new();
            v53 = 0u;
            v54 = 0u;
            v55 = 0u;
            v56 = 0u;
            v12 = v11;
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
            if (v13)
            {
              v14 = v13;
              v15 = *(_QWORD *)v54;
              v41 = *(_QWORD *)v54;
              v42 = v12;
              do
              {
                v16 = 0;
                v43 = v14;
                do
                {
                  if (*(_QWORD *)v54 != v15)
                    objc_enumerationMutation(v12);
                  v17 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v16);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v12, "objectForKeyedSubscript:", v17);
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v44 = v18;
                      v45 = v16;
                      v51 = 0u;
                      v52 = 0u;
                      v49 = 0u;
                      v50 = 0u;
                      v19 = v18;
                      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
                      if (v20)
                      {
                        v21 = v20;
                        v22 = *(_QWORD *)v50;
                        do
                        {
                          for (i = 0; i != v21; ++i)
                          {
                            if (*(_QWORD *)v50 != v22)
                              objc_enumerationMutation(v19);
                            v24 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              objc_msgSend(v19, "objectForKeyedSubscript:", v24);
                              v25 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v25);
                              v26 = (void *)objc_claimAutoreleasedReturnValue();
                              v27 = v26;
                              if (v26)
                              {
                                if ((objc_msgSend(v26, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0)
                                {
                                  v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0CAAC70]), "initWithProviderID:domainIdentifier:itemIdentifier:", v48, v17, v24);
                                  objc_msgSend(v47, "setObject:forKeyedSubscript:", v27, v28);
                                }
                                else
                                {
                                  fp_current_or_default_log();
                                  v28 = objc_claimAutoreleasedReturnValue();
                                  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                                  {
                                    *(_DWORD *)buf = 138412290;
                                    v64 = v27;
                                    _os_log_error_impl(&dword_1CF55F000, v28, OS_LOG_TYPE_ERROR, "[ERROR] url is not reachable: %@, GC-ing the URL (iWork should have done it)", buf, 0xCu);
                                  }
                                  v46 = 1;
                                }
                              }
                              else
                              {
                                fp_current_or_default_log();
                                v28 = objc_claimAutoreleasedReturnValue();
                                if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                                {
                                  *(_DWORD *)buf = 138412290;
                                  v64 = v25;
                                  _os_log_error_impl(&dword_1CF55F000, v28, OS_LOG_TYPE_ERROR, "[ERROR] nil url for path %@", buf, 0xCu);
                                }
                              }

                            }
                          }
                          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
                        }
                        while (v21);
                      }

                      v15 = v41;
                      v12 = v42;
                      v14 = v43;
                      v18 = v44;
                      v16 = v45;
                    }

                  }
                  ++v16;
                }
                while (v16 != v14);
                v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
              }
              while (v14);
            }

            objc_msgSend(v37, "setObject:forKeyedSubscript:", v47, v48);
            v9 = v40 + 1;
          }
          while (v40 + 1 != v38);
          v38 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
        }
        while (v38);
        v7 = obj;

        v8 = v34;
        if ((v46 & 1) != 0)
          -[FPDExtensionManager _serializeAlternateContentsURLDictionary:](v33, "_serializeAlternateContentsURLDictionary:", v37);
        v5 = v35;
      }
      else
      {

      }
    }
    else
    {
      fp_current_or_default_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[FPDExtensionManager _deserializedAlternateContentsDictionary].cold.2(v8);

      v37 = 0;
    }
LABEL_52:

    v6 = v8;
    goto LABEL_53;
  }
  objc_msgSend(v6, "domain");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v29, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {

    goto LABEL_48;
  }
  v30 = objc_msgSend(v6, "code");

  if (v30 != 260)
  {
LABEL_48:
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[FPDExtensionManager _deserializedAlternateContentsDictionary].cold.1(v6);
    v37 = 0;
    v8 = v6;
    goto LABEL_52;
  }
  v37 = 0;
LABEL_53:

  return v37;
}

- (void)dropLegacyDaemonCoreSpotlightIndexIfNeeded
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] deleting all fileproviderd searchable items", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __65__FPDExtensionManager_dropLegacyDaemonCoreSpotlightIndexIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a2;
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __65__FPDExtensionManager_dropLegacyDaemonCoreSpotlightIndexIfNeeded__block_invoke_cold_3(v3);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __65__FPDExtensionManager_dropLegacyDaemonCoreSpotlightIndexIfNeeded__block_invoke_cold_2();

    v5 = *(id *)(a1 + 32);
    objc_sync_enter(v5);
    CFPreferencesSetAppValue(CFSTR("com.apple.fileproviderd.did-drop-daemon-corespotlight-index"), &unk_1E8C95E80, CFSTR("com.apple.fileproviderd"));
    if (!CFPreferencesAppSynchronize(CFSTR("com.apple.fileproviderd")))
    {
      fp_current_or_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __65__FPDExtensionManager_dropLegacyDaemonCoreSpotlightIndexIfNeeded__block_invoke_cold_1(v6, v7, v8);

    }
    objc_sync_exit(v5);
  }

}

- (id)clouddocsExtensionIdentifier
{
  NSMutableDictionary *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = self->_providersByIdentifier;
  objc_sync_enter(v3);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary keyEnumerator](self->_providersByIdentifier, "keyEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider")) & 1) != 0)
        {
          v9 = v8;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  objc_sync_exit(v3);
  return v9;
}

- (void)_loadPausedSyncItemsDictionary
{
  void *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *syncPausedItemsDictionary;

  -[FPDExtensionManager _deserializedPausedSyncItemDictionary](self, "_deserializedPausedSyncItemDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (NSMutableDictionary *)objc_msgSend(v3, "mutableCopy");

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  }
  syncPausedItemsDictionary = self->_syncPausedItemsDictionary;
  self->_syncPausedItemsDictionary = v4;

}

- (void)_serializePausedSyncItemsDictionary:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  char v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v3;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
  if (v29)
  {
    v27 = *(_QWORD *)v40;
    v4 = (void *)*MEMORY[0x1E0CAAB38];
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v40 != v27)
          objc_enumerationMutation(obj);
        v31 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v5);
        v32 = v5;
        objc_msgSend(obj, "objectForKeyedSubscript:", v27);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v8 = v6;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v36;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v36 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
              objc_msgSend(v8, "objectForKeyedSubscript:", v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (v14)
              {
                objc_msgSend(v13, "domainIdentifier");
                v15 = objc_claimAutoreleasedReturnValue();
                v16 = (void *)v15;
                if (v15)
                  v17 = (void *)v15;
                else
                  v17 = v4;
                v18 = v17;

                objc_msgSend(v7, "objectForKeyedSubscript:", v18);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v19)
                {
                  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, v18);
                }
                objc_msgSend(v13, "identifier");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "setObject:forKeyedSubscript:", v14, v20);

              }
              else
              {
                fp_current_or_default_log();
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v44 = v13;
                  _os_log_error_impl(&dword_1CF55F000, v18, OS_LOG_TYPE_ERROR, "[ERROR] nil bundleID for itemID %@", buf, 0xCu);
                }
              }

            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
          }
          while (v10);
        }

        objc_msgSend(v28, "setObject:forKeyedSubscript:", v7, v31);
        v5 = v32 + 1;
      }
      while (v32 + 1 != v29);
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    }
    while (v29);
  }

  v34 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v28, 200, 0, &v34);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v34;
  if (!v21)
  {
    fp_current_or_default_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[FPDExtensionManager _serializeAlternateContentsURLDictionary:].cold.1(v22);
    goto LABEL_31;
  }
  pausedSyncItemslistURL();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v22;
  v24 = objc_msgSend(v21, "writeToURL:options:error:", v23, 1, &v33);
  v25 = v33;

  if ((v24 & 1) == 0)
  {
    fp_current_or_default_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[FPDExtensionManager _serializePausedSyncItemsDictionary:].cold.2(v25, v26);
    v22 = v25;
LABEL_31:

    v25 = v22;
  }

}

- (id)_deserializedPausedSyncItemDictionary
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  FPDExtensionManager *v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  NSObject *obj;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  id v58;
  id v59;
  uint8_t buf[4];
  void *v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99D50];
  pausedSyncItemslistURL();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0;
  objc_msgSend(v3, "dataWithContentsOfURL:options:error:", v4, 0, &v59);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v59;

  if (v5)
  {
    v58 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v5, 0, 0, &v58);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v58;

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSObject count](v7, "count"));
      v36 = (id)objc_claimAutoreleasedReturnValue();
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v7 = v7;
      v37 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
      if (v37)
      {
        v33 = self;
        v34 = v5;
        v9 = 0;
        v35 = *(_QWORD *)v55;
        obj = v7;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v55 != v35)
              objc_enumerationMutation(obj);
            v39 = v10;
            v11 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v10);
            -[NSObject objectForKeyedSubscript:](obj, "objectForKeyedSubscript:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = (void *)objc_opt_new();
            v50 = 0u;
            v51 = 0u;
            v52 = 0u;
            v53 = 0u;
            v13 = v12;
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
            if (v14)
            {
              v15 = v14;
              v16 = *(_QWORD *)v51;
              v40 = *(_QWORD *)v51;
              v41 = v13;
              do
              {
                v17 = 0;
                v42 = v15;
                do
                {
                  if (*(_QWORD *)v51 != v16)
                    objc_enumerationMutation(v13);
                  v18 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v17);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v13, "objectForKeyedSubscript:", v18);
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v43 = v19;
                      v44 = v17;
                      v48 = 0u;
                      v49 = 0u;
                      v46 = 0u;
                      v47 = 0u;
                      v20 = v19;
                      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
                      if (v21)
                      {
                        v22 = v21;
                        v23 = *(_QWORD *)v47;
                        do
                        {
                          for (i = 0; i != v22; ++i)
                          {
                            if (*(_QWORD *)v47 != v23)
                              objc_enumerationMutation(v20);
                            v25 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAAC70]), "initWithProviderID:domainIdentifier:itemIdentifier:", v11, v18, v25);
                              objc_msgSend(v20, "objectForKeyedSubscript:", v25);
                              v27 = (void *)objc_claimAutoreleasedReturnValue();
                              if (v27)
                              {
                                objc_msgSend(v45, "setObject:forKeyedSubscript:", v27, v26);
                              }
                              else
                              {
                                fp_current_or_default_log();
                                v28 = objc_claimAutoreleasedReturnValue();
                                if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                                {
                                  *(_DWORD *)buf = 138412290;
                                  v61 = v26;
                                  _os_log_error_impl(&dword_1CF55F000, v28, OS_LOG_TYPE_ERROR, "[ERROR] nil bundleID for itemID %@", buf, 0xCu);
                                }

                                v9 = 1;
                              }

                            }
                          }
                          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
                        }
                        while (v22);
                      }

                      v16 = v40;
                      v13 = v41;
                      v15 = v42;
                      v19 = v43;
                      v17 = v44;
                    }

                  }
                  ++v17;
                }
                while (v17 != v15);
                v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
              }
              while (v15);
            }

            objc_msgSend(v36, "setObject:forKeyedSubscript:", v45, v11);
            v10 = v39 + 1;
          }
          while (v39 + 1 != v37);
          v7 = obj;
          v37 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
        }
        while (v37);

        if ((v9 & 1) != 0)
          -[FPDExtensionManager _serializePausedSyncItemsDictionary:](v33, "_serializePausedSyncItemsDictionary:", v36);
        v5 = v34;
      }
      else
      {

      }
    }
    else
    {
      fp_current_or_default_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[FPDExtensionManager _deserializedAlternateContentsDictionary].cold.2(v8);

      v36 = 0;
    }
LABEL_49:

    v6 = v8;
    goto LABEL_50;
  }
  objc_msgSend(v6, "domain");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v29, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {

    goto LABEL_45;
  }
  v30 = objc_msgSend(v6, "code");

  if (v30 != 260)
  {
LABEL_45:
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[FPDExtensionManager _deserializedAlternateContentsDictionary].cold.1(v6);
    v36 = 0;
    v8 = v6;
    goto LABEL_49;
  }
  v36 = 0;
LABEL_50:

  return v36;
}

- (void)setPausedSyncItemID:(id)a3 forBundleID:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *syncPausedItemsDictionary;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSMutableDictionary *obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  syncPausedItemsDictionary = self->_syncPausedItemsDictionary;
  if (!syncPausedItemsDictionary)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ _syncPausedItemsDictionary shouldn't be nil"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDExtensionManager setPausedSyncItemID:forBundleID:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionManager.m", 1485, (const char *)objc_msgSend(objc_retainAutorelease(v18), "UTF8String"));
  }
  v9 = v7;
  obj = syncPausedItemsDictionary;
  objc_sync_enter(obj);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v14, "providerID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_syncPausedItemsDictionary, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v16)
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_syncPausedItemsDictionary, "setObject:forKeyedSubscript:", v16, v15);
          }
          objc_msgSend(v16, "objectForKeyedSubscript:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {

            goto LABEL_16;
          }
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v9, v14);

        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v11)
        continue;
      break;
    }
  }

  -[FPDExtensionManager _serializePausedSyncItemsDictionary:](self, "_serializePausedSyncItemsDictionary:", self->_syncPausedItemsDictionary);
LABEL_16:
  objc_sync_exit(obj);

}

- (void)removePausedSyncItemID:(id)a3 forBundleID:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *syncPausedItemsDictionary;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSMutableDictionary *obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  syncPausedItemsDictionary = self->_syncPausedItemsDictionary;
  if (!syncPausedItemsDictionary)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ _syncPausedItemsDictionary shouldn't be nil"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDExtensionManager removePausedSyncItemID:forBundleID:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionManager.m", 1510, (const char *)objc_msgSend(objc_retainAutorelease(v19), "UTF8String"));
  }
  v9 = v7;
  obj = syncPausedItemsDictionary;
  objc_sync_enter(obj);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v14, "providerID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_syncPausedItemsDictionary, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16)
          {
            objc_msgSend(v16, "objectForKeyedSubscript:", v14);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v18, "isEqualToString:", v9))
              objc_msgSend(v17, "setObject:forKeyedSubscript:", 0, v14);

          }
        }

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  -[FPDExtensionManager _serializePausedSyncItemsDictionary:](self, "_serializePausedSyncItemsDictionary:", self->_syncPausedItemsDictionary);
  objc_sync_exit(obj);

}

- (id)syncPausedBundleIDForItemID:(id)a3
{
  id v4;
  NSMutableDictionary *syncPausedItemsDictionary;
  void *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  NSObject *v14;

  v4 = a3;
  syncPausedItemsDictionary = self->_syncPausedItemsDictionary;
  if (!syncPausedItemsDictionary)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ _syncPausedItemsDictionary shouldn't be nil"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDExtensionManager syncPausedBundleIDForItemID:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionManager.m", 1530, (const char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String"));
  }
  v6 = v4;
  v7 = syncPausedItemsDictionary;
  objc_sync_enter(v7);
  v8 = self->_syncPausedItemsDictionary;
  objc_msgSend(v6, "providerID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v7);
  return v11;
}

- (id)syncPausedFilesForBundleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v15;
  NSObject *v16;
  NSMutableDictionary *obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_syncPausedItemsDictionary)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ _syncPausedItemsDictionary shouldn't be nil"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDExtensionManager syncPausedFilesForBundleID:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionManager.m", 1538, (const char *)objc_msgSend(objc_retainAutorelease(v15), "UTF8String"));
  }
  v5 = v4;
  v6 = (void *)objc_opt_new();
  obj = self->_syncPausedItemsDictionary;
  objc_sync_enter(obj);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[NSMutableDictionary allKeys](self->_syncPausedItemsDictionary, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_syncPausedItemsDictionary, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "allKeysForObject:", v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, v11);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  objc_sync_exit(obj);
  return v6;
}

- (FPDServer)server
{
  return (FPDServer *)objc_loadWeakRetained((id *)&self->_server);
}

- (void)setServer:(id)a3
{
  objc_storeWeak((id *)&self->_server, a3);
}

- (FPDPushConnection)pushConnection
{
  return self->_pushConnection;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong((id *)&self->_syncPausedItemsDictionary, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_pushConnection, 0);
  objc_storeStrong((id *)&self->_sessionQueueForExtensionIdentifier, 0);
  objc_storeStrong((id *)&self->_alternateContentsURLDictionary, 0);
  objc_storeStrong((id *)&self->_providerUUIDs, 0);
  objc_storeStrong((id *)&self->_apSubscription, 0);
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong(&self->_matchingContext, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_providersByIdentifier, 0);
}

- (void)garbageCollectDomainsExceptIdentifiers:(uint64_t)a3 fromDirectory:(NSObject *)a4 isUserData:.cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a2 = 134218242;
  *(_QWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(_QWORD *)(a2 + 14) = a1;
  OUTLINED_FUNCTION_6(&dword_1CF55F000, a4, a3, "[DEBUG] ┏%llx garbage collecting in %@", (uint8_t *)a2);

}

void __86__FPDExtensionManager__garbageCollectRemovedProvidersForInstalledProviderIdentifiers___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138543362;
  v4 = v2;
  _os_log_debug_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] deleted all searchable items for %{public}@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_8_0();
}

void __86__FPDExtensionManager__garbageCollectRemovedProvidersForInstalledProviderIdentifiers___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_23(&dword_1CF55F000, a2, a3, "[ERROR] failed deleting searchable items for %{public}@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_8_0();
}

void __50__FPDExtensionManager_garbageCollectOnFirstLaunch__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] Not garbage collecting the domains yet", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __50__FPDExtensionManager_garbageCollectOnFirstLaunch__block_invoke_cold_2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_10(&dword_1CF55F000, v0, (uint64_t)v0, "[ERROR] Can't adopt persona %@: %@", v1);
  OUTLINED_FUNCTION_8_0();
}

void __53__FPDExtensionManager_legacy_loadProvidersAndMonitor__block_invoke_cold_1(uint64_t *a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *a1;
  v3 = 134218242;
  v4 = v1;
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_6(&dword_1CF55F000, v2, (uint64_t)v2, "[DEBUG] ┏%llx updating provider list: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_8_0();
}

void __53__FPDExtensionManager_legacy_loadProvidersAndMonitor__block_invoke_cold_2(uint64_t *a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *a1;
  v3 = 134218242;
  v4 = v1;
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_6(&dword_1CF55F000, v2, (uint64_t)v2, "[DEBUG] ┏%llx received an error after initial load of extensions; %@",
    (uint8_t *)&v3);
  OUTLINED_FUNCTION_8_0();
}

- (void)appProtectionSubjectsChanged:forSubscription:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] app protection settings changed, but no file provider app involved", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __68__FPDExtensionManager_appProtectionSubjectsChanged_forSubscription___block_invoke_40_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] app protection settings changed, refreshing all providers", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)migrateEnabledStateIfNecessary:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "fp_prettyDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1CF55F000, v2, v3, "[ERROR] Couldn't create marker for legacy state migration: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)uniquedExtensions:(_QWORD *)a3 .cold.1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1CF55F000, a4, OS_LOG_TYPE_ERROR, "[ERROR] ignoring extension without File Provider Storage URL: %@", a1, 0xCu);

}

- (void)_domainForURL:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_shortDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2048;
  v10 = objc_msgSend(a2, "count");
  OUTLINED_FUNCTION_6(&dword_1CF55F000, a3, v6, "[DEBUG] testing if %@ is in our %lu registered file providers: it's not", (uint8_t *)&v7);

  OUTLINED_FUNCTION_2();
}

- (void)_serializeAlternateContentsURLDictionary:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "fp_prettyDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1CF55F000, v2, v3, "[ERROR] failed to create plist data from dictionary: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)_serializeAlternateContentsURLDictionary:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  alternateContentsPlistURL();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fp_prettyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1CF55F000, a2, v6, "[ERROR] failed to write _alternateContentsURLDictionary to URL %@: %@", v7);

  OUTLINED_FUNCTION_2();
}

- (void)_deserializedAlternateContentsDictionary
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "fp_prettyDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1CF55F000, v2, v3, "[ERROR] nil serialized dictionary: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

void __65__FPDExtensionManager_dropLegacyDaemonCoreSpotlightIndexIfNeeded__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = CFSTR("com.apple.fileproviderd");
  OUTLINED_FUNCTION_23(&dword_1CF55F000, a1, a3, "[ERROR] failed to synchronize user defaults for %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_8_0();
}

void __65__FPDExtensionManager_dropLegacyDaemonCoreSpotlightIndexIfNeeded__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] deleted all fileproviderd searchable items", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __65__FPDExtensionManager_dropLegacyDaemonCoreSpotlightIndexIfNeeded__block_invoke_cold_3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "fp_prettyDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1CF55F000, v2, v3, "[ERROR] failed to delete all fileproviderd searchable items: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)_serializePausedSyncItemsDictionary:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  pausedSyncItemslistURL();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fp_prettyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1CF55F000, a2, v6, "[ERROR] failed to write _pausedSyncItemsDictionary to URL %@: %@", v7);

  OUTLINED_FUNCTION_2();
}

@end
