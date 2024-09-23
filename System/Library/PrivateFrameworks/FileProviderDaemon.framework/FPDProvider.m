@implementation FPDProvider

- (FPDProviderDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)_writeDomainPropertiesIntoLibrary:(id)a3 ifChangedFrom:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  FPDProvider *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  BOOL v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  NSMutableDictionary *obj;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t section;
  uint8_t v51[128];
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  id v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v42 = a4;
  section = __fp_create_section();
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[FPDProvider identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v53 = section;
    v54 = 2114;
    v55 = v8;
    v56 = 2114;
    v57 = v6;
    _os_log_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_DEFAULT, "[NOTICE] ┏%llx writing domain properties for %{public}@ onto %{public}@", buf, 0x20u);

  }
  v9 = self;
  objc_sync_enter(v9);
  v44 = (void *)objc_opt_new();
  v10 = v42 != 0;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v9->_domainsByID;
  v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v47 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](v9->_domainsByID, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (!v6
          || (objc_msgSend(v15, "volume"),
              v17 = (id)objc_claimAutoreleasedReturnValue(),
              v18 = v17 == v6,
              v17,
              v18))
        {
          fp_current_or_default_log();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v16, "nsDomain");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v53 = (uint64_t)v20;
            _os_log_impl(&dword_1CF55F000, v19, OS_LOG_TYPE_INFO, "[INFO] writing properties for domain %{public}@", buf, 0xCu);

          }
          objc_msgSend(v16, "nsDomainOrNilForDefault");

          objc_msgSend(v16, "nsDomainOrNilForDefault");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "plistDictionary");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (!v22)
            v22 = (void *)MEMORY[0x1E0C9AA70];
          v24 = (void *)objc_msgSend(v22, "mutableCopy");

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v16, "userEnabled"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setObject:forKeyedSubscript:", v25, CFSTR("Enabled"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v16, "ejectable"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setObject:forKeyedSubscript:", v26, CFSTR("Connected"));

          objc_msgSend(v16, "domainUserInfo");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setObject:forKeyedSubscript:", v27, CFSTR("DomainUserInfo"));

          objc_msgSend(v44, "setObject:forKeyedSubscript:", v24, v14);
          v10 = 1;
        }

      }
      v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v11);
  }

  if (v10)
  {
    if (objc_msgSend(v6, "role") != 1)
      objc_msgSend(v6, "role");
    if ((objc_msgSend(v44, "isEqualToDictionary:", v42) & 1) == 0)
    {
      objc_msgSend(v6, "systemDirectory");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v28)
      {
        v30 = v28;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "fp_supportDirectory");
        v30 = (id)objc_claimAutoreleasedReturnValue();
      }
      v31 = v30;

      -[FPDProviderDescriptor identifier](v9->_descriptor, "identifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v53 = (uint64_t)v32;
        v54 = 2112;
        v55 = v6;
        v56 = 2112;
        v57 = v31;
        _os_log_impl(&dword_1CF55F000, v33, OS_LOG_TYPE_INFO, "[INFO] Updating plist for %@ on %@ (%@)", buf, 0x20u);
      }

      objc_msgSend(v31, "URLByAppendingPathComponent:", v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v34, 1, 0, 0);

      v45 = 0;
      LODWORD(v35) = objc_msgSend(v6, "writeDomainsProperties:underDirectoryAtURL:error:", v44, v34, &v45);
      v36 = v45;
      if ((_DWORD)v35)
      {
        fp_current_or_default_log();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          -[FPDProvider identifier](v9, "identifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary allKeys](v9->_domainsByID, "allKeys");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v53 = (uint64_t)v38;
          v54 = 2112;
          v55 = v34;
          v56 = 2112;
          v57 = v39;
          _os_log_debug_impl(&dword_1CF55F000, v37, OS_LOG_TYPE_DEBUG, "[DEBUG] updated domain plist for %@ at %@: %@", buf, 0x20u);

        }
      }
      else
      {
        fp_current_or_default_log();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          -[FPDProvider identifier](v9, "identifier");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "fp_prettyDescription");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v53 = (uint64_t)v40;
          v54 = 2112;
          v55 = v34;
          v56 = 2112;
          v57 = v41;
          _os_log_error_impl(&dword_1CF55F000, v37, OS_LOG_TYPE_ERROR, "[ERROR] error while writing domain plist for %@ at %@: %@", buf, 0x20u);

        }
      }

    }
  }

  objc_sync_exit(v9);
  __fp_leave_section_Notice();

}

void __28__FPDProvider_nsDomainsByID__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "nsDomainOrNilForDefault");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

uint64_t __34__FPDProvider_relevantDomainsByID__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a3;
  objc_msgSend(v3, "nsDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isHidden"))
  {
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CAAB38]) ^ 1;

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (id)providerDomainForDomain:(id)a3
{
  void *v3;
  id v5;
  FPDProvider *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  unsigned __int8 v32;

  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  v7 = objc_alloc(MEMORY[0x1E0CAACA0]);
  -[FPDProvider identifier](v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nsDomain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithProviderID:domain:", v8, v9);

  -[FPDProvider descriptor](v6, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedName");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = &stru_1E8C795D8;
  objc_msgSend(v10, "setProviderDisplayName:", v14);

  objc_msgSend(v11, "extensionPointVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setVersion:", v15);

  objc_msgSend(v11, "supportedFileTypes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSupportedFileTypes:", v16);

  objc_msgSend(v10, "setSupportsEnumeration:", objc_msgSend(v11, "supportsEnumeration"));
  objc_msgSend(v10, "setIsAvailableSystemWide:", objc_msgSend(v11, "isAvailableSystemWide"));
  v17 = objc_msgSend(v11, "readonly");
  if ((v17 & 1) != 0)
  {
    v18 = 1;
  }
  else
  {
    objc_msgSend(v5, "nsDomain");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v3, "readOnly");
  }
  objc_msgSend(v10, "setReadOnly:", v18);
  if ((v17 & 1) == 0)

  objc_msgSend(v10, "setCanDisable:", objc_msgSend(v11, "canToggleDomainVisibility"));
  objc_msgSend(v10, "setShouldHideExtensionName:", objc_msgSend(v11, "shouldHideExtensionName"));
  objc_msgSend(v11, "topLevelBundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTopLevelBundleIdentifier:", v19);

  objc_msgSend(v11, "topLevelBundleURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTopLevelBundleURL:", v20);

  objc_msgSend(v10, "setUsesUniqueItemIdentifiersAcrossDevices:", objc_msgSend(v11, "usesUniqueItemIdentifiersAcrossDevices"));
  objc_msgSend(v11, "supportedSearchFilters");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSupportedSearchFilters:", v21);

  objc_msgSend(v11, "extensionBundleURL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setExtensionBundleURL:", v22);

  objc_msgSend(v10, "setOwningApplicationIsHidden:", objc_msgSend(v11, "owningApplicationIsHidden"));
  objc_msgSend(v5, "nsDomain");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSupportsPickingFolders:", objc_msgSend(v5, "supportsPickingFolders"));
  objc_msgSend(v10, "setUseFPFS:", objc_msgSend(v5, "isUsingFPFS"));
  objc_msgSend(v10, "setEnabled:", objc_msgSend(v5, "userEnabled"));
  objc_msgSend(v10, "setEjectable:", objc_msgSend(v5, "ejectable"));
  v32 = 0;
  objc_msgSend(v5, "rootURLsWithTransientState:", &v32);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStorageURLs:", v24);

  objc_msgSend(v10, "setStorageURLsAreInTransientState:", v32);
  objc_msgSend(v5, "indexer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNeedsAuthentication:", objc_msgSend(v25, "needsAuthentication"));

  objc_msgSend(v10, "setAllowsUserControlledEviction:", objc_msgSend(v11, "allowsUserControlledEviction"));
  objc_msgSend(v10, "setAllowsSystemDeleteAlerts:", objc_msgSend(v11, "allowsSystemDeleteAlerts"));
  objc_msgSend(v10, "setAllowsContextualMenuDownloadEntry:", objc_msgSend(v11, "allowsContextualMenuDownloadEntry"));
  objc_msgSend(v10, "setDisconnectionState:", objc_msgSend(v5, "disconnectionState"));
  objc_msgSend(v10, "setAppliesChangesAtomically:", objc_msgSend(v11, "appliesChangesAtomically"));
  objc_msgSend(v5, "domainUserInfo");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDomainUserInfo:", v26);

  objc_msgSend(v10, "setBackgroundActivityIsPaused:", objc_msgSend(v5, "backgroundActivityIsPaused"));
  objc_msgSend(v10, "setSupportsSyncingTrash:", objc_msgSend(v5, "supportsSyncingTrash"));
  objc_msgSend(v10, "setSupportsSearch:", objc_msgSend(v5, "supportsSearch"));
  objc_msgSend(v10, "setErrorGenerationCount:", objc_msgSend(v5, "errorGenerationCount"));
  objc_msgSend(v5, "indexer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIsIndexed:", objc_msgSend(v27, "isIndexed"));

  objc_msgSend(v10, "setSupportsRemoteVersions:", objc_msgSend(v5, "supportsRemoteVersions"));
  objc_msgSend(v5, "volume");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "role");

  if (v29 == 1)
  {
    objc_msgSend(v5, "nsDomain");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSupportedKnownFolders:", objc_msgSend(v30, "supportedKnownFolders"));

  }
  objc_sync_exit(v6);

  return v10;
}

- (NSString)identifier
{
  return -[FPDProviderDescriptor identifier](self->_descriptor, "identifier");
}

- (NSDictionary)nsDomainsByID
{
  FPDProvider *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_opt_new();
  -[FPDProvider relevantDomainsByID](v2, "relevantDomainsByID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __28__FPDProvider_nsDomainsByID__block_invoke;
  v7[3] = &unk_1E8C77900;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);

  objc_sync_exit(v2);
  return (NSDictionary *)v5;
}

- (NSDictionary)relevantDomainsByID
{
  FPDProvider *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[NSMutableDictionary fp_filter:](v2->_domainsByID, "fp_filter:", &__block_literal_global_126);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (NSArray)providedItemsURLs
{
  void *v3;
  FPDProvider *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = self;
  objc_sync_enter(v4);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary allValues](v4->_domainsByID, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "rootURLs");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  objc_sync_exit(v4);
  return (NSArray *)v3;
}

- (BOOL)shouldHideDomainDisplayName
{
  FPDProvider *v2;
  void *v3;
  BOOL v4;
  void *v5;
  char v6;

  v2 = self;
  objc_sync_enter(v2);
  -[FPDProvider identifier](v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged")) & 1) != 0)
  {
    v4 = 0;
LABEL_6:

    goto LABEL_7;
  }
  -[FPDProvider identifier](v2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProviderManaged"));

  if ((v6 & 1) == 0)
  {
    -[FPDProvider relevantDomainsByID](v2, "relevantDomainsByID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (unint64_t)objc_msgSend(v3, "count") < 2;
    goto LABEL_6;
  }
  v4 = 0;
LABEL_7:
  objc_sync_exit(v2);

  return v4;
}

- (id)domainForRealPathURLFast:(id)a3
{
  FPDProvider *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  int v13;
  void *v14;
  NSMutableDictionary *domainsByID;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v39;
  id v40;
  id v41;
  NSMutableDictionary *obj;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  FPDProvider *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t v57[128];
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v47 = v4;
  obj = v4->_domainsByRootPath;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
  if (v5)
  {
    v46 = *(_QWORD *)v54;
    v45 = *MEMORY[0x1E0CAAB38];
    *(_QWORD *)&v6 = 138412546;
    v39 = v6;
LABEL_3:
    v7 = 0;
    v44 = v5;
    while (1)
    {
      if (*(_QWORD *)v54 != v46)
        objc_enumerationMutation(obj);
      v8 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v7);
      v9 = (void *)MEMORY[0x1D17D1B04]();
      -[NSMutableDictionary objectForKeyedSubscript:](v47->_domainsByRootPath, "objectForKeyedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", v45);

      if ((v12 & 1) != 0)
      {
        v13 = 3;
      }
      else
      {
        objc_msgSend(v41, "path");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "fp_relativePathWithRealpath:", v14);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        if (v48)
        {
          domainsByID = v47->_domainsByID;
          objc_msgSend(v10, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "precomposedStringWithCanonicalMapping");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](domainsByID, "objectForKeyedSubscript:", v17);
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          if (v43 == v10)
          {
            objc_msgSend(v10, "rootURLs");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = (void *)objc_msgSend(v22, "copy");

            v51 = 0u;
            v52 = 0u;
            v49 = 0u;
            v50 = 0u;
            v18 = v23;
            v24 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
            if (v24)
            {
              v25 = *(_QWORD *)v50;
              while (2)
              {
                for (i = 0; i != v24; ++i)
                {
                  if (*(_QWORD *)v50 != v25)
                    objc_enumerationMutation(v18);
                  objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "path", v39);
                  v27 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend((id)v27, "fp_realpath");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();

                  LOBYTE(v27) = objc_msgSend(v28, "isEqual:", v8);
                  if ((v27 & 1) != 0)
                  {

                    fp_current_or_default_log();
                    v30 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
                    {
                      objc_msgSend(v10, "identifier");
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v31, "fp_obfuscatedProviderDomainID");
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v41, "fp_shortDescription");
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = v39;
                      v59 = v32;
                      v60 = 2112;
                      v61 = v33;
                      _os_log_debug_impl(&dword_1CF55F000, v30, OS_LOG_TYPE_DEBUG, "[DEBUG] Found domain %@ with fast path for %@", buf, 0x16u);

                    }
                    v40 = v10;
                    v13 = 1;
                    goto LABEL_28;
                  }
                }
                v24 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
                if (v24)
                  continue;
                break;
              }
            }

            fp_current_or_default_log();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v41, "fp_shortDescription");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "identifier");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "fp_obfuscatedProviderDomainID");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v59 = v34;
              v60 = 2114;
              v61 = v36;
              _os_log_error_impl(&dword_1CF55F000, v29, OS_LOG_TYPE_ERROR, "[ERROR] Fast path %{public}@ for domain %{public}@ not accurate: root path not present", buf, 0x16u);

            }
          }
          else
          {
            fp_current_or_default_log();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v8, "fp_prettyPath");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "identifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "fp_obfuscatedProviderDomainID");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v59 = v19;
              v60 = 2114;
              v61 = v21;
              _os_log_error_impl(&dword_1CF55F000, v18, OS_LOG_TYPE_ERROR, "[ERROR] Fast path %{public}@ for domain %{public}@ not accurate: domain not in domainsByID", buf, 0x16u);

            }
          }
          v13 = 2;
LABEL_28:

        }
        else
        {
          v13 = 3;
        }

      }
      objc_autoreleasePoolPop(v9);
      if (v13 != 3)
        break;
      if (++v7 == v44)
      {
        v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
        if (v5)
          goto LABEL_3;
        LOBYTE(v13) = 0;
        break;
      }
    }
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  objc_sync_exit(v47);
  if ((v13 & 1) != 0)
    v37 = v40;
  else
    v37 = 0;

  return v37;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)addDomain:(id)a3 byImportingDirectoryAtURL:(id)a4 userAllowedDBDrop:(BOOL)a5 knownFolders:(id)a6 request:(id)a7 completionHandler:(id)a8
{
  _BOOL8 v10;
  id v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;

  v10 = a5;
  v14 = a8;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __108__FPDProvider_addDomain_byImportingDirectoryAtURL_userAllowedDBDrop_knownFolders_request_completionHandler___block_invoke;
  v17[3] = &unk_1E8C77718;
  v18 = v14;
  v15 = v14;
  LOBYTE(v16) = 0;
  -[FPDProvider addDomain:byImportingDirectoryAtURL:knownFolders:userAllowedDBDrop:unableToStartup:startupError:reloadDomain:request:completionHandler:](self, "addDomain:byImportingDirectoryAtURL:knownFolders:userAllowedDBDrop:unableToStartup:startupError:reloadDomain:request:completionHandler:", a3, a4, a6, v10, 0, 0, v16, a7, v17);

}

- (id)loggerForDomainWithIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v4 = (id)*MEMORY[0x1E0CAAB38];
  if (a3)
    v4 = a3;
  v5 = v4;
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[FPDProvider identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fp_providerDomainIDFromProviderID:domainIdentifier:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "fp_obfuscatedProviderDomainID");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v9, "UTF8String");
  fpfs_create_log_for_provider();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __108__FPDProvider_addDomain_byImportingDirectoryAtURL_userAllowedDBDrop_knownFolders_request_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v5 = a2;
  v6 = a3;
  if (!v6)
    goto LABEL_8;
  objc_msgSend(v5, "rootURLs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "count"))
  {

LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v5, "rootURLs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = FPClearImportCookieForDomainURL();
  v11 = 0;

  if ((v10 & 1) == 0)
  {
    fp_current_or_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __108__FPDProvider_addDomain_byImportingDirectoryAtURL_userAllowedDBDrop_knownFolders_request_completionHandler___block_invoke_cold_1();

  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "provider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v13 + 16))(v13, v15, v6);

}

- (id)domainForIdentifier:(id)a3 reason:(unint64_t *)a4
{
  id v6;
  void *v7;
  FPDProvider *v8;
  NSMutableDictionary *domainsByID;
  void *v10;
  void *v11;
  void *v13;
  NSObject *v14;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ no domain identifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDProvider domainForIdentifier:reason:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDProvider.m", 486, (const char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String"));
  }
  v7 = v6;
  v8 = self;
  objc_sync_enter(v8);
  domainsByID = v8->_domainsByID;
  objc_msgSend(v7, "precomposedStringWithCanonicalMapping");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](domainsByID, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && !v11)
    *a4 = 1;
  objc_sync_exit(v8);

  return v11;
}

- (FPDProvider)initWithDescriptor:(id)a3 server:(id)a4
{
  id v7;
  id v8;
  FPDProvider *v9;
  uint64_t v10;
  NSMutableDictionary *domainsByID;
  uint64_t v12;
  NSMutableDictionary *domainsByRootPath;
  id *p_descriptor;
  void *v15;
  id v16;
  const char *v17;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *domainQueue;
  id v21;
  const char *v22;
  NSObject *v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *queue;
  id v26;
  const char *v27;
  NSObject *v28;
  dispatch_queue_t v29;
  OS_dispatch_queue *presentersQueue;
  uint64_t v31;
  FPDExtensionManager *manager;
  void *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  char v38;
  void *v39;
  id v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  NSURL *providerPlistURL;
  id v52;
  id v53;
  objc_super v54;
  char v55[24];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v54.receiver = self;
  v54.super_class = (Class)FPDProvider;
  v9 = -[FPDProvider init](&v54, sel_init);
  if (v9)
  {
    v10 = objc_opt_new();
    domainsByID = v9->_domainsByID;
    v9->_domainsByID = (NSMutableDictionary *)v10;

    v12 = objc_opt_new();
    domainsByRootPath = v9->_domainsByRootPath;
    v9->_domainsByRootPath = (NSMutableDictionary *)v12;

    p_descriptor = (id *)&v9->_descriptor;
    objc_storeStrong((id *)&v9->_descriptor, a3);
    -[FPDProviderDescriptor identifier](v9->_descriptor, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByAppendingString:", CFSTR(".domain"));
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = (const char *)objc_msgSend(v16, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_queue_create(v17, v18);
    domainQueue = v9->_domainQueue;
    v9->_domainQueue = (OS_dispatch_queue *)v19;

    objc_msgSend(v15, "stringByAppendingString:", CFSTR(".queue"));
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = (const char *)objc_msgSend(v21, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = dispatch_queue_create(v22, v23);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v24;

    objc_msgSend(v15, "stringByAppendingString:", CFSTR(".presenters"));
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27 = (const char *)objc_msgSend(v26, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = dispatch_queue_create(v27, v28);
    presentersQueue = v9->_presentersQueue;
    v9->_presentersQueue = (OS_dispatch_queue *)v29;

    objc_storeStrong((id *)&v9->_server, a4);
    objc_msgSend(v8, "extensionManager");
    v31 = objc_claimAutoreleasedReturnValue();
    manager = v9->_manager;
    v9->_manager = (FPDExtensionManager *)v31;

    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "currentPersona");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = 0;
    objc_msgSend(v34, "userPersonaUniqueString");
    v35 = objc_claimAutoreleasedReturnValue();
    -[FPDProviderDescriptor personaIdentifier](v9->_descriptor, "personaIdentifier");
    v36 = objc_claimAutoreleasedReturnValue();
    if (v35 == v36)
    {
      v44 = 0;
      v45 = v35;
    }
    else
    {
      objc_msgSend(*p_descriptor, "personaIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -[NSObject isEqualToString:](v35, "isEqualToString:", v37);

      if ((v38 & 1) != 0 || !voucher_process_can_use_arbitrary_personas())
      {
        v44 = 0;
LABEL_15:
        objc_msgSend(MEMORY[0x1E0C99E98], "fp_supportDirectory");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "URLByAppendingPathComponent:isDirectory:", v15, 1);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)&v9->_supportURL, v48);
        objc_msgSend(v48, "URLByAppendingPathComponent:isDirectory:", CFSTR("Provider.plist"), 0);
        v49 = objc_claimAutoreleasedReturnValue();
        providerPlistURL = v9->_providerPlistURL;
        v9->_providerPlistURL = (NSURL *)v49;

        _FPRestorePersona();
        goto LABEL_16;
      }
      v52 = 0;
      v39 = (void *)objc_msgSend(v34, "copyCurrentPersonaContextWithError:", &v52);
      v40 = v52;
      v41 = v53;
      v53 = v39;

      if (v40)
      {
        fp_current_or_default_log();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          -[FPDDomainExtensionBackend startProvidingItemAtURL:readerID:readingOptions:request:completionHandler:].cold.2();

      }
      objc_msgSend(*p_descriptor, "personaIdentifier");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "generateAndRestorePersonaContextWithPersonaUniqueString:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v44)
        goto LABEL_15;
      fp_current_or_default_log();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*p_descriptor, "personaIdentifier");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[FPDProvider initWithDescriptor:server:].cold.1(v46, (uint64_t)v44, (uint64_t)v55);
      }
    }

    goto LABEL_15;
  }
LABEL_16:

  return v9;
}

- (void)startDomains:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  dispatch_group_t v8;
  NSObject *domainQueue;
  NSObject *v10;
  id v11;
  _QWORD block[4];
  id v13;
  FPDProvider *v14;
  dispatch_group_t v15;

  v6 = a3;
  v7 = a4;
  v8 = dispatch_group_create();
  domainQueue = self->_domainQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__FPDProvider_startDomains_completion___block_invoke;
  block[3] = &unk_1E8C75240;
  v13 = v6;
  v14 = self;
  v15 = v8;
  v10 = v8;
  v11 = v6;
  dispatch_sync(domainQueue, block);
  dispatch_group_notify(v10, (dispatch_queue_t)self->_queue, v7);

}

void __39__FPDProvider_startDomains_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v17;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v17 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v5);
        v15 = 0;
        objc_msgSend(v6, "log");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        fpfs_adopt_log();
        v15 = (id)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v6, "started") & 1) == 0 && (objc_msgSend(v6, "invalidated") & 1) == 0)
        {
          v8 = *(void **)(*(_QWORD *)(a1 + 40) + 80);
          objc_msgSend(v6, "identifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v8) = v6 == v10;

          if ((v8 & 1) != 0)
          {
            objc_msgSend(v6, "finishSetup");
            v11 = *(id *)(a1 + 40);
            objc_sync_enter(v11);
            addRootPathKeys(*(void **)(*(_QWORD *)(a1 + 40) + 88), v6);
            objc_sync_exit(v11);

            dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
            v13[0] = MEMORY[0x1E0C809B0];
            v13[1] = 3221225472;
            v13[2] = __39__FPDProvider_startDomains_completion___block_invoke_2;
            v13[3] = &unk_1E8C75E48;
            v12 = *(void **)(a1 + 40);
            v14 = *(id *)(a1 + 48);
            objc_msgSend(v12, "_startOrClearDomain:userAllowedDBDrop:reason:completion:", v6, 0, CFSTR("domainStartup"), v13);

          }
        }
        __fp_pop_log();

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v3);
  }

}

void __39__FPDProvider_startDomains_completion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)startWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  FPDProvider *v7;
  void *v8;
  uint64_t section;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  section = __fp_create_section();
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[FPDProvider identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v11 = section;
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_1CF55F000, v5, OS_LOG_TYPE_DEFAULT, "[NOTICE] ┏%llx Starting domains for %{public}@", buf, 0x16u);

  }
  v7 = self;
  objc_sync_enter(v7);
  -[NSMutableDictionary allValues](v7->_domainsByID, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v7);

  -[FPDProvider startDomains:completion:](v7, "startDomains:completion:", v8, v4);
  __fp_leave_section_Notice();

}

- (void)invalidateSingleDomain:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *domainQueue;
  id v10;
  void *v11;
  _QWORD block[5];
  id v13;
  uint64_t section;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  section = __fp_create_section();
  fp_current_or_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v16 = section;
    v17 = 2114;
    v18 = v6;
    v19 = 2114;
    v20 = v7;
    _os_log_impl(&dword_1CF55F000, v8, OS_LOG_TYPE_DEFAULT, "[NOTICE] ┏%llx Tearing down %{public}@ (reason: %{public}@)", buf, 0x20u);
  }

  domainQueue = self->_domainQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__FPDProvider_invalidateSingleDomain_reason___block_invoke;
  block[3] = &unk_1E8C75850;
  block[4] = self;
  v10 = v6;
  v13 = v10;
  dispatch_sync(domainQueue, block);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalidating domain %@ (reason: %@)"), v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invalidateWithReason:", v11);

  objc_msgSend(v10, "invalidateSession");
  __fp_leave_section_Notice();

}

void __45__FPDProvider_invalidateSingleDomain_reason___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  objc_msgSend(*(id *)(a1 + 40), "nsDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "precomposedStringWithCanonicalMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v5);

  removeRootPathKeys(*(void **)(*(_QWORD *)(a1 + 32) + 88), *(void **)(a1 + 40));
  objc_sync_exit(obj);

}

- (void)invalidateAllDomainsOnVolume:(id)a3 reason:(id)a4
{
  id v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  NSObject *v8;
  NSObject *domainQueue;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD block[5];
  id v22;
  _BYTE *v23;
  uint64_t section;
  uint8_t v25[128];
  _BYTE buf[24];
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (uint64_t (*)(uint64_t, uint64_t))a4;
  section = __fp_create_section();
  fp_current_or_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = section;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2114;
    v27 = v7;
    _os_log_impl(&dword_1CF55F000, v8, OS_LOG_TYPE_DEFAULT, "[NOTICE] ┏%llx Tearing down all domains on %{public}@ (reason: %{public}@)", buf, 0x20u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v27 = __Block_byref_object_copy__10;
  v28 = __Block_byref_object_dispose__10;
  v29 = 0;
  v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 5);
  domainQueue = self->_domainQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__FPDProvider_invalidateAllDomainsOnVolume_reason___block_invoke;
  block[3] = &unk_1E8C776C8;
  block[4] = self;
  v10 = v6;
  v22 = v10;
  v23 = buf;
  dispatch_sync(domainQueue, block);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = *(id *)(*(_QWORD *)&buf[8] + 40);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalidating domain %@ (reason: %@)"), v15, v7, (_QWORD)v17);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "invalidateWithReason:", v16);

        objc_msgSend(v15, "invalidateSession");
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v12);
  }

  _Block_object_dispose(buf, 8);
  __fp_leave_section_Notice();

}

void __51__FPDProvider_invalidateAllDomainsOnVolume_reason___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  _BOOL4 v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "domainsByID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
  if (v5)
  {
    v7 = *(_QWORD *)v27;
    *(_QWORD *)&v6 = 138412290;
    v21 = v6;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v9, "volume", v21);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10 == *(void **)(a1 + 40);

        if (v11)
        {
          fp_current_or_default_log();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v21;
            v32 = v9;
            _os_log_impl(&dword_1CF55F000, v12, OS_LOG_TYPE_INFO, "[INFO] Invalidating domain %@...", buf, 0xCu);
          }

          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v9);
          removeRootPathKeys(*(void **)(*(_QWORD *)(a1 + 32) + 88), v9);
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
    }
    while (v5);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "nsDomain");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "precomposedStringWithCanonicalMapping");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "removeObjectForKey:", v20);

      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v14);
  }

  objc_sync_exit(v2);
}

- (void)invalidateWithReason:(id)a3
{
  NSObject *v3;
  NSObject *domainQueue;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  NSObject *v34;
  id v35;
  void *v36;
  void *v37;
  FPDServer *server;
  FPDExtensionManager *manager;
  id obj;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD block[6];
  uint64_t section;
  uint8_t v52[4];
  id v53;
  __int16 v54;
  void *v55;
  uint8_t v56[128];
  _BYTE buf[24];
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v43 = (uint64_t (*)(uint64_t, uint64_t))a3;
  section = __fp_create_section();
  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = section;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2114;
    v58 = v43;
    _os_log_impl(&dword_1CF55F000, v3, OS_LOG_TYPE_DEFAULT, "[NOTICE] ┏%llx Invalidating %{public}@ (reason: %{public}@)...", buf, 0x20u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v58 = __Block_byref_object_copy__10;
  v59 = __Block_byref_object_dispose__10;
  v60 = 0;
  domainQueue = self->_domainQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__FPDProvider_invalidateWithReason___block_invoke;
  block[3] = &unk_1E8C768B0;
  block[4] = self;
  block[5] = buf;
  dispatch_sync(domainQueue, block);
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = *(id *)(*(_QWORD *)&buf[8] + 40);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
  if (v5)
  {
    v42 = *(_QWORD *)v47;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v47 != v42)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v6);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalidating the provider instance (reason: %@)"), v43);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "invalidateWithReason:", v8);

        objc_msgSend(v7, "nsDomain");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "personaIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "currentPersona");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v45 = 0;
          objc_msgSend(v12, "userPersonaUniqueString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "nsDomain");
          v14 = objc_claimAutoreleasedReturnValue();
          -[NSObject personaIdentifier](v14, "personaIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13 != v15)
          {
            objc_msgSend(v7, "nsDomain");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "personaIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v13, "isEqualToString:", v17);

            if ((v18 & 1) != 0 || !voucher_process_can_use_arbitrary_personas())
            {
              v25 = 0;
            }
            else
            {
              v44 = 0;
              v19 = (void *)objc_msgSend(v12, "copyCurrentPersonaContextWithError:", &v44);
              v20 = v44;
              v21 = v45;
              v45 = v19;

              if (v20)
              {
                fp_current_or_default_log();
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v52 = 138412290;
                  v53 = v20;
                  _os_log_error_impl(&dword_1CF55F000, v22, OS_LOG_TYPE_ERROR, "[ERROR] won't restore persona: %@", v52, 0xCu);
                }

              }
              objc_msgSend(v7, "nsDomain");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "personaIdentifier");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "generateAndRestorePersonaContextWithPersonaUniqueString:", v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              if (v25)
              {
                fp_current_or_default_log();
                v14 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v7, "nsDomain");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "personaIdentifier");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v52 = 138412546;
                  v53 = v27;
                  v54 = 2112;
                  v55 = v25;
                  _os_log_error_impl(&dword_1CF55F000, v14, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", v52, 0x16u);

                }
LABEL_21:

              }
            }
            objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "currentPersona");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "userPersonaUniqueString");
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            if (v30)
            {
              objc_msgSend(v7, "nsDomain");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "personaIdentifier");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = objc_msgSend(v30, "isEqualToString:", v32);

              if ((v33 & 1) == 0)
              {
                fp_current_or_default_log();
                v34 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
                {
                  objc_msgSend(v7, "nsDomain");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "personaIdentifier");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v52 = 138412290;
                  v53 = v37;
                  _os_log_fault_impl(&dword_1CF55F000, v34, OS_LOG_TYPE_FAULT, "[CRIT] domain's persona %@ doesn't exist anymore, cleaning up", v52, 0xCu);

                }
                v35 = (id)objc_msgSend(v7, "cleanupDomainWithMode:", 0);
              }
            }

            _FPRestorePersona();
            goto LABEL_28;
          }

          v25 = 0;
          goto LABEL_21;
        }
LABEL_28:
        objc_msgSend(v7, "invalidateSession");
        ++v6;
      }
      while (v5 != v6);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    }
    while (v5);
  }

  server = self->_server;
  self->_server = 0;

  manager = self->_manager;
  self->_manager = 0;

  _Block_object_dispose(buf, 8);
  __fp_leave_section_Notice();

}

void __36__FPDProvider_invalidateWithReason___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id obj;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 1;
  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 88);
  *(_QWORD *)(v7 + 88) = 0;

  objc_sync_exit(obj);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[FPDProviderDescriptor identifier](self->_descriptor, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDProviderDescriptor extensionUUID](self->_descriptor, "extensionUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDProviderDescriptor personaIdentifier](self->_descriptor, "personaIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p \"%@\" uuid:\"%@\" persona:\"%@\">"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  FPDProvider *v4;
  uint64_t v5;
  char v6;
  FPDProviderDescriptor *descriptor;
  void *v8;

  v4 = (FPDProvider *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      descriptor = self->_descriptor;
      -[FPDProvider descriptor](v4, "descriptor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[FPDProviderDescriptor isEqual:](descriptor, "isEqual:", v8);

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (BOOL)isAppExtensionReachable
{
  return 0;
}

- (FPDExtension)asAppExtensionBackedProvider
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ UNREACHABLE: -asAppExtensionBackedProvider called on a non-app extension backed provider"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_fault_impl(&dword_1CF55F000, v3, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v4, 0xCu);
  }

  __assert_rtn("-[FPDProvider asAppExtensionBackedProvider]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDProvider.m", 320, (const char *)objc_msgSend(objc_retainAutorelease(v2), "UTF8String"));
}

- (BOOL)_supportsFPFS
{
  void *v3;
  char v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v12;
  char IsDeniedForFPFS;

  -[FPDProvider identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.FileProvider.TestingHarness.TestFileProvider"));

  if ((v4 & 1) != 0)
    return 0;
  -[FPDProvider identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.FileProvider.LocalStorage"));

  if ((v6 & 1) != 0)
    return 0;
  -[FPDProvider identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider"));

  if ((v8 & 1) != 0)
    return 0;
  -[FPDProvider identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProviderManaged"));

  if ((v10 & 1) != 0)
    return 0;
  -[FPDProvider identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  IsDeniedForFPFS = FPFSProviderIsDeniedForFPFS();

  return IsDeniedForFPFS ^ 1;
}

- (BOOL)supportsFPFS
{
  _BOOL4 v3;
  void *v4;
  int IsForcedForFPFS;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = -[FPDProvider supportsEnumeration](self, "supportsEnumeration");
  if (v3)
  {
    if (!-[FPDProvider _supportsFPFS](self, "_supportsFPFS"))
    {
      -[FPDProvider identifier](self, "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      IsForcedForFPFS = FPFSProviderIsForcedForFPFS();

      if (!IsForcedForFPFS)
      {
        LOBYTE(v3) = 0;
        return v3;
      }
      fp_current_or_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        -[FPDProvider identifier](self, "identifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412290;
        v10 = v7;
        _os_log_impl(&dword_1CF55F000, v6, OS_LOG_TYPE_INFO, "[INFO] %@ is fpfs-forced", (uint8_t *)&v9, 0xCu);

      }
    }
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)testingProvider
{
  void *v2;
  char v3;

  -[FPDProvider identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.FileProvider.TestingHarness.TestFileProvider"));

  return v3;
}

- (id)domainForURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(a3, "fp_realpathURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDProvider domainForRealPathURLFast:](self, "domainForRealPathURLFast:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[FPDProvider domainForRealPathURLSlow:](self, "domainForRealPathURLSlow:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)domainForRealPathURLSlow:(id)a3
{
  id v4;
  FPDProvider *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary allValues](v5->_domainsByID, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v6;
  v8 = 0;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v19;
    v11 = *MEMORY[0x1E0CAAB38];
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v13, "isProviderForRealPathURL:", v4, (_QWORD)v18))
        {
          objc_msgSend(v13, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", v11);

          v16 = v13;
          if (!v15)
          {

            goto LABEL_13;
          }

          v8 = v16;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
        continue;
      break;
    }
  }

  v8 = v8;
  v16 = v8;
LABEL_13:

  return v16;
}

- (NSString)purposeIdentifier
{
  return -[FPDProviderDescriptor purposeIdentifier](self->_descriptor, "purposeIdentifier");
}

- (NSString)bundleVersion
{
  return -[FPDProviderDescriptor bundleVersion](self->_descriptor, "bundleVersion");
}

- (NSArray)extensionStorageURLs
{
  return -[FPDProviderDescriptor extensionStorageURLs](self->_descriptor, "extensionStorageURLs");
}

- (BOOL)supportsEnumeration
{
  return -[FPDProviderDescriptor supportsEnumeration](self->_descriptor, "supportsEnumeration");
}

+ (id)fpfsDomainURLIsRootOf:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;

  v3 = a3;
  objc_msgSend(v3, "fp_fpfsProviderDomainID:skipTypeCheck:error:", 0, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_retainAutorelease(v3);
    v6 = 0;
    if (getxattr((const char *)objc_msgSend(v5, "fileSystemRepresentation"), "com.apple.fileprovider.detached#B", 0, 0, 0, 0) < 0)
    {
      v7 = objc_retainAutorelease(v5);
      v6 = 0;
      if (getxattr((const char *)objc_msgSend(v7, "fileSystemRepresentation"), "com.apple.fileprovider.detached", 0, 0, 0, 0) < 0)
      {
        v6 = 0;
        if (getxattr((const char *)objc_msgSend(objc_retainAutorelease(v7), "fileSystemRepresentation"), "com.apple.fileprovider.detached#PN", 0, 0, 0, 0) < 0)v6 = v4;
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)onDiskProvidersForServer:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  FPDProvider *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  char v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  _BOOL4 v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  id v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id obj;
  void *v46;
  os_log_t log;
  uint64_t v48;
  uint64_t v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  FPDProvider *v56;
  id v57;
  uint64_t v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[4];
  id v65;
  id v66;
  id v67;
  uint64_t section;
  _BYTE v69[128];
  uint8_t v70[128];
  uint8_t buf[4];
  uint64_t v72;
  __int16 v73;
  id v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fp_supportDirectory");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  section = __fp_create_section();
  fp_current_or_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v41, "fp_shortDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v72 = section;
    v73 = 2114;
    v74 = v7;
    _os_log_impl(&dword_1CF55F000, v6, OS_LOG_TYPE_DEFAULT, "[NOTICE] ┏%llx Listing domains & providers in %{public}@", buf, 0x16u);

  }
  objc_msgSend(v43, "volumeManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = __40__FPDProvider_onDiskProvidersForServer___block_invoke;
  v64[3] = &unk_1E8C776F0;
  v40 = v4;
  v65 = v40;
  v67 = a1;
  v50 = v5;
  v66 = v50;
  objc_msgSend(v8, "enumerateLibrariesWithBlock:", v64);

  v42 = (id)objc_opt_new();
  objc_msgSend(v40, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v41, 0, 1, 0);
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
  if (v9)
  {
    v48 = *(_QWORD *)v61;
    do
    {
      v49 = v9;
      for (i = 0; i != v49; ++i)
      {
        if (*(_QWORD *)v61 != v48)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        if ((objc_msgSend(v11, "fp_isFolder", v40) & 1) != 0)
        {
          objc_msgSend(v11, "URLByAppendingPathComponent:", CFSTR("Provider.plist"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = 0;
          v13 = objc_msgSend(v12, "checkResourceIsReachableAndReturnError:", &v59);
          v14 = v59;
          if ((v13 & 1) != 0)
          {
            v58 = 0;
            v58 = __fp_create_section();
            fp_current_or_default_log();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              v16 = v58;
              objc_msgSend(v11, "lastPathComponent");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218242;
              v72 = v16;
              v73 = 2114;
              v74 = v17;
              _os_log_impl(&dword_1CF55F000, v15, OS_LOG_TYPE_DEFAULT, "[NOTICE] ┏%llx Loading %{public}@", buf, 0x16u);

            }
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v12);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            if (v46)
            {
              v18 = (void *)MEMORY[0x1E0CB3710];
              v19 = objc_opt_class();
              v57 = v14;
              objc_msgSend(v18, "unarchivedObjectOfClass:fromData:error:", v19, v46, &v57);
              log = (os_log_t)objc_claimAutoreleasedReturnValue();
              v44 = v57;

              if (log)
              {
                v20 = -[FPDProvider initWithDescriptor:server:]([FPDProvider alloc], "initWithDescriptor:server:", log, v43);
                if (v20)
                {
                  objc_msgSend(v43, "volumeManager");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject personaIdentifier](log, "personaIdentifier");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  v55[0] = MEMORY[0x1E0C809B0];
                  v55[1] = 3221225472;
                  v55[2] = __40__FPDProvider_onDiskProvidersForServer___block_invoke_46;
                  v55[3] = &unk_1E8C75330;
                  v20 = v20;
                  v56 = v20;
                  objc_msgSend(v21, "enumerateLibrariesForPersona:withBlock:", v22, v55);

                  v53 = 0u;
                  v54 = 0u;
                  v51 = 0u;
                  v52 = 0u;
                  -[NSMutableDictionary allValues](v20->_domainsByID, "allValues");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v51, v69, 16);
                  if (v24)
                  {
                    v25 = *(_QWORD *)v52;
                    while (2)
                    {
                      for (j = 0; j != v24; ++j)
                      {
                        if (*(_QWORD *)v52 != v25)
                          objc_enumerationMutation(v23);
                        v27 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
                        objc_msgSend(v27, "providerDomainID");
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        v29 = objc_msgSend(v50, "containsObject:", v28);

                        if ((v29 & 1) != 0)
                        {

                          fp_current_or_default_log();
                          v38 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = 138543362;
                            v72 = (uint64_t)v20;
                            _os_log_impl(&dword_1CF55F000, v38, OS_LOG_TYPE_DEFAULT, "[NOTICE] Read provider %{public}@ from disk", buf, 0xCu);
                          }

                          objc_msgSend(v42, "addObject:", v20);
                          goto LABEL_39;
                        }
                        fp_current_or_default_log();
                        v30 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
                        {
                          objc_msgSend(v27, "providerDomainID");
                          objc_claimAutoreleasedReturnValue();
                          +[FPDProvider onDiskProvidersForServer:].cold.1();
                        }

                      }
                      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v51, v69, 16);
                      if (v24)
                        continue;
                      break;
                    }
                  }

                  fp_current_or_default_log();
                  v31 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v72 = (uint64_t)v20;
                    _os_log_impl(&dword_1CF55F000, v31, OS_LOG_TYPE_DEFAULT, "[WARNING] no root reachable for provider %@, skipping", buf, 0xCu);
                  }

LABEL_39:
                }
              }
              else
              {
                fp_current_or_default_log();
                v20 = (FPDProvider *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(&v20->super, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v12, "fp_shortDescription");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v72 = (uint64_t)v37;
                  v73 = 2112;
                  v74 = v44;
                  _os_log_impl(&dword_1CF55F000, &v20->super, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't upack provider descriptor for %@: %@", buf, 0x16u);

                }
              }

              v14 = v44;
            }
            else
            {
              fp_current_or_default_log();
              log = (os_log_t)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v12, "fp_shortDescription");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v72 = (uint64_t)v36;
                _os_log_impl(&dword_1CF55F000, log, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't load data for %@", buf, 0xCu);

              }
            }

            __fp_leave_section_Notice();
          }
          else
          {
            objc_msgSend(v11, "fp_fpfsProviderDomainID:skipTypeCheck:error:", 0, 1, 0);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v32 == 0;

            if (v33)
            {
              fp_current_or_default_log();
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v11, "fp_shortDescription");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v72 = (uint64_t)v35;
                _os_log_impl(&dword_1CF55F000, v34, OS_LOG_TYPE_DEFAULT, "[WARNING] found directory with no domain plist in it: %{public}@", buf, 0xCu);

              }
            }
          }

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
    }
    while (v9);
  }

  __fp_leave_section_Notice();
  return v42;
}

uint64_t __40__FPDProvider_onDiskProvidersForServer___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t section;
  uint8_t v23[128];
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v17 = a2;
  section = __fp_create_section();
  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v25 = section;
    v26 = 2114;
    v27 = v17;
    _os_log_impl(&dword_1CF55F000, v3, OS_LOG_TYPE_DEFAULT, "[NOTICE] ┏%llx Listing domains & providers in %{public}@", buf, 0x16u);
  }

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v17, "syncRootsDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v5, 0, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v11, "fp_isFolder") & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 48), "fpfsDomainURLIsRootOf:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          fp_current_or_default_log();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v12, "fp_obfuscatedProviderDomainID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "fp_shortDescription");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v25 = (uint64_t)v14;
            v26 = 2112;
            v27 = v15;
            _os_log_debug_impl(&dword_1CF55F000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] found domain xattr '%@' on %@", buf, 0x16u);

          }
          if (v12)
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);

        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v8);
  }

  __fp_leave_section_Notice();
  return 1;
}

uint64_t __40__FPDProvider_onDiskProvidersForServer___block_invoke_46(uint64_t a1, uint64_t a2)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "importDomainsFromLibrary:updatePlist:", a2, 1);
  return 1;
}

- (void)writeAllDomainProperties
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[FPDProvider server](self, "server");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "volumeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__FPDProvider_writeAllDomainProperties__block_invoke;
  v5[3] = &unk_1E8C75330;
  v5[4] = self;
  objc_msgSend(v4, "enumerateLibrariesWithBlock:", v5);

}

uint64_t __39__FPDProvider_writeAllDomainProperties__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_writeDomainPropertiesIntoLibrary:ifChangedFrom:", a2, 0);
  return 1;
}

- (id)_recreateDefaultDomainIfNeededOnVolume:(id)a3
{
  id v4;
  FPDProvider *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = *MEMORY[0x1E0CAAB38];
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_domainsByID, "objectForKeyedSubscript:", *MEMORY[0x1E0CAAB38]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](v5->_domainsByID, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nsDomain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isHidden");

    if (-[NSMutableDictionary count](v5->_domainsByID, "count") == 1
      && -[FPDProviderDescriptor defaultDomainVisible](v5->_descriptor, "defaultDomainVisible"))
    {
      if (!v10)
      {
        v12 = 0;
        goto LABEL_18;
      }
      fp_current_or_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        -[FPDProvider identifier](v5, "identifier");
        objc_claimAutoreleasedReturnValue();
        -[FPDProvider _recreateDefaultDomainIfNeededOnVolume:].cold.2();
      }
      v12 = 0;
    }
    else
    {
      if ((v10 & 1) != 0)
      {
        v12 = 1;
LABEL_18:
        -[NSMutableDictionary objectForKeyedSubscript:](v5->_domainsByID, "objectForKeyedSubscript:", v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "nsDomain");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setHidden:", v12);

        v14 = 0;
        goto LABEL_19;
      }
      fp_current_or_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        -[FPDProvider identifier](v5, "identifier");
        objc_claimAutoreleasedReturnValue();
        -[FPDProvider _recreateDefaultDomainIfNeededOnVolume:].cold.3();
      }
      v12 = 1;
    }

    goto LABEL_18;
  }
  -[FPDProvider defaultNSDomain](v5, "defaultNSDomain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[FPDProvider newDomainFromNSDomain:volume:](v5, "newDomainFromNSDomain:volume:", v13, v4);
  -[FPDProvider descriptor](v5, "descriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setUserEnabled:", objc_msgSend(v15, "enabledByDefault"));

  objc_msgSend(v14, "setEjectable:", 0);
  objc_msgSend(v14, "setShouldIndexWhenStart:", objc_msgSend(v14, "userEnabled"));
  fp_current_or_default_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    -[FPDProvider identifier](v5, "identifier");
    objc_claimAutoreleasedReturnValue();
    -[FPDProvider _recreateDefaultDomainIfNeededOnVolume:].cold.1();
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_domainsByID, "setObject:forKeyedSubscript:", v14, v6);
LABEL_19:

  objc_sync_exit(v5);
  return v14;
}

- (id)defaultNSDomain
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CAAD00]);
  v4 = (void *)objc_msgSend(v3, "initWithIdentifier:displayName:pathRelativeToDocumentStorage:", *MEMORY[0x1E0CAAB38], &stru_1E8C795D8, &stru_1E8C795D8);
  objc_msgSend(v4, "setHidden:", -[FPDProviderDescriptor defaultDomainVisible](self->_descriptor, "defaultDomainVisible") ^ 1);
  -[FPDProviderDescriptor personaIdentifier](self->_descriptor, "personaIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPersonaIdentifier:", v5);

  return v4;
}

- (id)newDomainFromNSDomain:(id)a3 volume:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  FPDDomain *v18;
  void *v19;
  void *v20;
  void *v21;
  FPDDomain *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "pathRelativeToDocumentStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[FPDProviderDescriptor extensionStorageURLs](self->_descriptor, "extensionStorageURLs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[FPDProviderDescriptor extensionStorageURLs](self->_descriptor, "extensionStorageURLs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "URLByAppendingPathComponent:isDirectory:", v8, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v14);
    }
  }
  else
  {
    -[FPDProviderDescriptor extensionStorageURLs](self->_descriptor, "extensionStorageURLs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v12, "mutableCopy");
  }

  v18 = [FPDDomain alloc];
  objc_msgSend(v6, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDProvider purposeIdentifier](self, "purposeIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDProvider server](self, "server");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[FPDDomain initWithIdentifier:nsDomain:extensionStorageURLs:purposeIdentifier:fpfsClass:provider:volume:](v18, "initWithIdentifier:nsDomain:extensionStorageURLs:purposeIdentifier:fpfsClass:provider:volume:", v19, v6, v11, v20, objc_msgSend(v21, "fpfsClass"), self, v7);

  return v22;
}

- (void)_startOrClearDomain:(id)a3 userAllowedDBDrop:(BOOL)a4 reason:(id)a5 completion:(id)a6
{
  objc_msgSend(a3, "startWithReason:userAllowedDBDrop:completion:", a5, a4, a6);
}

+ (id)defaultNSDomainForDescriptor:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0CAAD00];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithIdentifier:displayName:pathRelativeToDocumentStorage:", *MEMORY[0x1E0CAAB38], &stru_1E8C795D8, &stru_1E8C795D8);
  objc_msgSend(v6, "setHidden:", objc_msgSend(v4, "defaultDomainVisible") ^ 1);
  objc_msgSend(v4, "personaIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setPersonaIdentifier:", v7);
  return v6;
}

+ (id)parseDomainProperties:(id)a3 descriptor:(id)a4 volume:(id)a5 replicatedByDefault:(BOOL)a6
{
  uint64_t v6;
  id v9;
  id v10;
  id v11;
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
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v36;
  id v37;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  int v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  char v49[16];
  char v50[16];
  uint8_t buf[4];
  NSObject *v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v6 = a6;
  v56 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v37 = (id)objc_opt_new();
  v43 = v10;
  objc_msgSend(v10, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider"));

  v36 = v11;
  if (v11)
  {
    v13 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v11, "root", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fileURLWithPath:isDirectory:", v14, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v42 = 0;
  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v15 = v9;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v46;
    v40 = *MEMORY[0x1E0CAAB38];
    v39 = v6;
    do
    {
      v19 = 0;
      v41 = v17;
      do
      {
        if (*(_QWORD *)v46 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v19);
        objc_msgSend(v15, "objectForKeyedSubscript:", v20, v36);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (v44 && objc_msgSend(v20, "hasPrefix:", CFSTR("Ciconia-")))
            {
              fp_current_or_default_log();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1CF55F000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] found leftover Ciconia domain - skipping", buf, 2u);
              }
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CAAD00], "domainFromPlistDictionary:identifier:volumeURL:replicatedByDefault:", v21, v20, v42, v6);
              v22 = objc_claimAutoreleasedReturnValue();
              if (v22
                || objc_msgSend(v20, "isEqualToString:", v40)
                && (objc_msgSend(a1, "defaultNSDomainForDescriptor:", v43),
                    (v22 = objc_claimAutoreleasedReturnValue()) != 0))
              {
                objc_msgSend(v43, "personaIdentifier");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject setPersonaIdentifier:](v22, "setPersonaIdentifier:", v24);

                -[NSObject personaIdentifier](v22, "personaIdentifier");
                v25 = (void *)objc_claimAutoreleasedReturnValue();

                if (v25)
                {
                  v26 = (void *)MEMORY[0x1E0DC5F00];
                  -[NSObject personaIdentifier](v22, "personaIdentifier");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "personaAttributesForPersonaUniqueString:", v27);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v28)
                  {
                    -[NSObject setIsEnterpriseDomain:](v22, "setIsEnterpriseDomain:", objc_msgSend(v28, "isEnterprisePersona"));
                    -[NSObject setIsDataSeparatedDomain:](v22, "setIsDataSeparatedDomain:", objc_msgSend(v28, "isDataSeparatedPersona"));
                  }

                }
                objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Enabled"));
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v29)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v43, "enabledByDefault"));
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  -[NSObject setUserEnabled:](v22, "setUserEnabled:", objc_msgSend(v29, "BOOLValue"));
                  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Connected"));
                  v30 = objc_claimAutoreleasedReturnValue();
                  if (v30)
                    v31 = v30;
                  else
                    v31 = MEMORY[0x1E0C9AAA0];
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    -[NSObject setEjectable:](v22, "setEjectable:", -[NSObject BOOLValue](v31, "BOOLValue"));
                    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("DomainUserInfo"));
                    v32 = objc_claimAutoreleasedReturnValue();
                    v17 = v41;
                    if (v32)
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        -[NSObject setDomainUserInfo:](v22, "setDomainUserInfo:", v32);
                        goto LABEL_34;
                      }
                      fp_current_or_default_log();
                      v34 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138543618;
                        v52 = v22;
                        v53 = 2112;
                        v54 = v21;
                        _os_log_error_impl(&dword_1CF55F000, v34, OS_LOG_TYPE_ERROR, "[ERROR] unhandled user info for domain %{public}@ of unknown type: %@", buf, 0x16u);
                      }
                    }
                    else
                    {
LABEL_34:
                      objc_msgSend(v20, "precomposedStringWithCanonicalMapping");
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v37, "setObject:forKeyedSubscript:", v22, v33);

                      fp_current_or_default_log();
                      v34 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138543362;
                        v52 = v22;
                        _os_log_impl(&dword_1CF55F000, v34, OS_LOG_TYPE_INFO, "[INFO] loaded domain from plist %{public}@", buf, 0xCu);
                      }
                    }

                  }
                  else
                  {
                    fp_current_or_default_log();
                    v32 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138543618;
                      v52 = v22;
                      v53 = 2112;
                      v54 = v21;
                      _os_log_error_impl(&dword_1CF55F000, v32, OS_LOG_TYPE_ERROR, "[ERROR] unhandled domain state %{public}@ of unknown type: %@", buf, 0x16u);
                    }
                    v17 = v41;
                  }

                  v6 = v39;
                }
                else
                {
                  fp_current_or_default_log();
                  v31 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543618;
                    v52 = v22;
                    v53 = 2114;
                    v54 = v21;
                    _os_log_error_impl(&dword_1CF55F000, v31, OS_LOG_TYPE_ERROR, "[ERROR] unhandled domain state %{public}@ of unknown type: %{public}@", buf, 0x16u);
                  }
                  v17 = v41;
                }

                goto LABEL_51;
              }
              fp_current_or_default_log();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                +[FPDProvider parseDomainProperties:descriptor:volume:replicatedByDefault:].cold.2((uint64_t)v49, (uint64_t)v20);
            }
          }
          else
          {
            fp_current_or_default_log();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v20, "fp_obfuscatedFilename");
              v23 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v52 = v23;
              v53 = 2112;
              v54 = v21;
              _os_log_error_impl(&dword_1CF55F000, v22, OS_LOG_TYPE_ERROR, "[ERROR] unhandled domain %{public}@ of unknown type: %@", buf, 0x16u);

            }
          }
        }
        else
        {
          fp_current_or_default_log();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            +[FPDProvider parseDomainProperties:descriptor:volume:replicatedByDefault:].cold.1((uint64_t)v50, (uint64_t)v20);
        }
LABEL_51:

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
    }
    while (v17);
  }

  return v37;
}

- (id)importDomainsFromLibrary:(id)a3 updatePlist:(BOOL)a4
{
  id v5;
  FPDProvider *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  NSMutableDictionary *domainsByID;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSMutableDictionary *domainsByRootPath;
  void *v32;
  id v33;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  uint64_t section;
  uint8_t v49[128];
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v39 = a4;
  v56 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  v42 = v5;
  v7 = objc_msgSend(v5, "role") == 1 || objc_msgSend(v5, "role") == 2;
  if (-[FPDProviderDescriptor allowsExternalVolumes](v6->_descriptor, "allowsExternalVolumes") || v7)
  {
    objc_msgSend(v42, "systemDirectory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPDProvider identifier](v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByAppendingPathComponent:", v9);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    section = __fp_create_section();
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      -[FPDProvider identifier](v6, "identifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "fp_shortDescription");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v51 = section;
      v52 = 2114;
      v53 = v35;
      v54 = 2114;
      v55 = v36;
      _os_log_debug_impl(&dword_1CF55F000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx loading domain list for %{public}@ from disk %{public}@", buf, 0x20u);

    }
    v47 = 0;
    objc_msgSend(v42, "readDomainsPropertiesUnderDirectoryAtURL:error:", v40, &v47);
    v11 = objc_claimAutoreleasedReturnValue();
    v37 = v47;
    v41 = (void *)v11;
    if (!v11)
    {
      fp_current_or_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v37, "fp_prettyDescription");
        objc_claimAutoreleasedReturnValue();
        -[FPDProvider importDomainsFromLibrary:updatePlist:].cold.1();
      }

    }
    v13 = (void *)objc_opt_class();
    v14 = (void *)v11;
    if (!v11)
      v14 = (void *)objc_opt_new();
    objc_msgSend(v13, "parseDomainProperties:descriptor:volume:replicatedByDefault:", v14, v6->_descriptor, v42, 0, v37);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)

    v16 = (void *)objc_opt_new();
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v17 = v15;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v44 != v19)
            objc_enumerationMutation(v17);
          v21 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          domainsByID = v6->_domainsByID;
          objc_msgSend(v21, "precomposedStringWithCanonicalMapping");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](domainsByID, "objectForKeyedSubscript:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            fp_current_or_default_log();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v21, "fp_obfuscatedFilename");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v51 = (uint64_t)v26;
              v52 = 2114;
              v53 = v42;
              _os_log_error_impl(&dword_1CF55F000, v25, OS_LOG_TYPE_ERROR, "[ERROR] Found domain %{public}@ on %{public}@, which is already known, ignoring", buf, 0x16u);

            }
          }
          else
          {
            objc_msgSend(v17, "objectForKeyedSubscript:", v21);
            v25 = objc_claimAutoreleasedReturnValue();
            v27 = -[FPDProvider newDomainFromNSDomain:volume:](v6, "newDomainFromNSDomain:volume:", v25, v42);
            objc_msgSend(v27, "setUserEnabled:", -[NSObject userEnabled](v25, "userEnabled"));
            objc_msgSend(v27, "setEjectable:", -[NSObject isEjectable](v25, "isEjectable"));
            -[NSObject domainUserInfo](v25, "domainUserInfo");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "setDomainUserInfo:", v28);

            objc_msgSend(v21, "precomposedStringWithCanonicalMapping");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v27, v29);

          }
        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v18);
    }

    if (!v6->_domainsByRootPath)
    {
      v30 = objc_opt_new();
      domainsByRootPath = v6->_domainsByRootPath;
      v6->_domainsByRootPath = (NSMutableDictionary *)v30;

    }
    if (v6->_domainsByID)
      -[NSMutableDictionary addEntriesFromDictionary:](v6->_domainsByID, "addEntriesFromDictionary:", v16);
    else
      objc_storeStrong((id *)&v6->_domainsByID, v16);
    if (objc_msgSend(v42, "isDefaultVolumeForCurrentPersona"))
      v33 = -[FPDProvider _recreateDefaultDomainIfNeededOnVolume:](v6, "_recreateDefaultDomainIfNeededOnVolume:", v42);
    if (v39)
      -[FPDProvider _writeDomainPropertiesIntoLibrary:ifChangedFrom:](v6, "_writeDomainPropertiesIntoLibrary:ifChangedFrom:", v42, v41);
    objc_msgSend(v16, "allValues");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    __fp_leave_section_Debug();
  }
  else
  {
    v32 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_sync_exit(v6);

  return v32;
}

- (void)materializeRootForDomain:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  v4 = v3;
  if (v3
    && objc_msgSend(v3, "isUsingFPFS")
    && objc_msgSend(v4, "userEnabled")
    && (objc_msgSend(v4, "isHidden") & 1) == 0)
  {
    objc_msgSend(v4, "serialQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__FPDProvider_materializeRootForDomain___block_invoke;
    block[3] = &unk_1E8C75E48;
    v7 = v4;
    dispatch_async(v5, block);

  }
}

void __40__FPDProvider_materializeRootForDomain___block_invoke(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  __CFString *v18;
  id v19;
  uint8_t buf[4];
  const __CFString *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "invalidated"))
  {
    fp_current_or_default_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = *(const __CFString **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v21 = v3;
      _os_log_impl(&dword_1CF55F000, v2, OS_LOG_TYPE_INFO, "[INFO] [Mat] Tried to materialize invalidated domain %@", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "defaultBackend");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rootURLs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "provider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "fp_isiCloudDriveOrCloudDocsIdentifier");

    if (v9)
    {
      v10 = CFSTR("com~apple~CloudDocs");
      objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("com~apple~CloudDocs"));
      v11 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v11;
    }
    else
    {
      v10 = CFSTR("root");
    }
    fp_current_or_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "fp_shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v10;
      v22 = 2114;
      v23 = v13;
      _os_log_impl(&dword_1CF55F000, v12, OS_LOG_TYPE_INFO, "[INFO] [Mat] Will try to materialize %@ %{public}@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "defaultBackend");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[FPDRequest requestForSelf](FPDRequest, "requestForSelf");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __40__FPDProvider_materializeRootForDomain___block_invoke_69;
    v17[3] = &unk_1E8C75AC0;
    v18 = (__CFString *)v10;
    v19 = v6;
    v2 = v6;
    v16 = (id)objc_msgSend(v14, "startProvidingItemAtURL:readerID:readingOptions:request:completionHandler:", v2, CFSTR("materializeRootForDomain"), 0, v15, v17);

  }
}

void __40__FPDProvider_materializeRootForDomain___block_invoke_69(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fp_prettyDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543874;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_INFO, "[INFO] [Mat] Materialized %{public}@ %{public}@ with error: %@", (uint8_t *)&v8, 0x20u);

  }
}

- (void)addDomain:(id)a3 byImportingDirectoryAtURL:(id)a4 knownFolders:(id)a5 userAllowedDBDrop:(BOOL)a6 unableToStartup:(BOOL)a7 startupError:(id)a8 reloadDomain:(BOOL)a9 request:(id)a10 completionHandler:(id)a11
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int IsForcedForFPFS;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v26 = a8;
  v18 = a10;
  v19 = a11;
  objc_msgSend(v15, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDProvider loggerForDomainWithIdentifier:](self, "loggerForDomainWithIdentifier:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  fpfs_adopt_log();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (FPFeatureFlagEbihilIsEnabled())
    __assert_rtn("-[FPDProvider addDomain:byImportingDirectoryAtURL:knownFolders:userAllowedDBDrop:unableToStartup:startupError:reloadDomain:request:completionHandler:]", "FPDProvider.m", 1051, "!FPFeatureFlagEbihilIsEnabled()");
  if (objc_msgSend(v15, "isReplicated")
    && !-[FPDProvider supportsFPFS](self, "supportsFPFS")
    && !-[FPDProvider testingProvider](self, "testingProvider"))
  {
    fp_current_or_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v15;
      _os_log_impl(&dword_1CF55F000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] domain %@ was asked with FPFS, but it's not supported, will fallback", buf, 0xCu);
    }

    objc_msgSend(v15, "setReplicated:", 0);
  }
  if ((objc_msgSend(v15, "isReplicated") & 1) == 0)
  {
    -[FPDProvider identifier](self, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    IsForcedForFPFS = FPFSProviderIsForcedForFPFS();

    if (IsForcedForFPFS)
    {
      fp_current_or_default_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v15;
        _os_log_impl(&dword_1CF55F000, v25, OS_LOG_TYPE_DEFAULT, "[WARNING] domain %@ was asked without FPFS, but provider is forced", buf, 0xCu);
      }

      objc_msgSend(v15, "setReplicated:", 1);
    }
  }
  v27 = v15;
  v32 = v19;
  v28 = v16;
  v29 = v17;
  v30 = v18;
  v31 = v26;
  fp_dispatch_async_with_logs();

  __fp_pop_log();
}

void __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  char v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  id v23;
  char v24;
  void *v25;
  BOOL v26;
  void *v27;
  char v28;
  void *v29;
  char v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  const __CFString *v42;
  id v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  int v49;
  NSObject *v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  NSObject *v58;
  uint64_t v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  int v65;
  NSObject *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char v77;
  id v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  int v85;
  uint64_t v86;
  void *v87;
  NSObject *v88;
  void *v89;
  id v90;
  char v91;
  NSObject *v92;
  id v93;
  void *v94;
  char v95;
  id v96;
  NSObject *v97;
  id v98;
  int v99;
  id v100;
  id v101;
  _QWORD v102[5];
  id v103;
  char v104;
  id v105;
  _QWORD block[4];
  id v107;
  id v108;
  id v109;
  _QWORD v110[4];
  id v111;
  id v112;
  id v113;
  _QWORD v114[4];
  id v115;
  id v116;
  _QWORD v117[5];
  _QWORD v118[5];
  uint64_t v119;
  uint64_t *v120;
  uint64_t v121;
  char v122;
  id v123;
  uint8_t v124[4];
  id v125;
  _BYTE buf[24];
  void *v127;
  __int16 v128;
  void *v129;
  __int16 v130;
  void *v131;
  __int16 v132;
  uint64_t v133;
  uint64_t v134;

  v134 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = 0;
  v4 = objc_msgSend(v3, "fp_isValidDomainIdentifierWithError:", &v123);
  v101 = v123;

  if ((v4 & 1) == 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    goto LABEL_105;
  }
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fp_obfuscatedFilename");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "fp_shortDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "fp_map:", &__block_literal_global_16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR(","));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 138413570;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2112;
    v127 = v9;
    v128 = 2114;
    v129 = v10;
    v130 = 2114;
    v131 = v12;
    v132 = 2114;
    v133 = v13;
    _os_log_impl(&dword_1CF55F000, v5, OS_LOG_TYPE_DEFAULT, "[NOTICE] Adding domain %@ (%{public}@) for extension %@, importing directory %{public}@ (known folders: %{public}@), for %{public}@", buf, 0x3Eu);

  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 16))
  {
    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_cold_7(a1);

    v15 = *(_QWORD *)(a1 + 80);
    FPProviderXPCInvalidError();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v15 + 16))(v15, 0, v16);

    goto LABEL_105;
  }
  objc_msgSend(*v2, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0CAAB38];
  if (!objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CAAB38]))
  {

    goto LABEL_15;
  }
  v19 = objc_msgSend(*v2, "isReplicated");

  if (!v19)
  {
LABEL_15:
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v127) = 0;
    v119 = 0;
    v120 = &v119;
    v121 = 0x2020000000;
    v122 = 0;
    v23 = *(id *)(a1 + 40);
    objc_sync_enter(v23);
    v24 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "enabledByDefault");
    *(_BYTE *)(*(_QWORD *)&buf[8] + 24) = v24;
    *((_BYTE *)v120 + 24) = 1;
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "count") != 1
      || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "objectForKeyedSubscript:", v18),
          v25 = (void *)objc_claimAutoreleasedReturnValue(),
          v26 = v25 == 0,
          v25,
          v26))
    {
      if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      {
        v32 = *(void **)(*(_QWORD *)(a1 + 40) + 80);
        v118[0] = MEMORY[0x1E0C809B0];
        v118[1] = 3221225472;
        v118[2] = __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_79;
        v118[3] = &unk_1E8C77780;
        v118[4] = buf;
        objc_msgSend(v32, "enumerateKeysAndObjectsUsingBlock:", v118);
      }
      v33 = *(void **)(*(_QWORD *)(a1 + 40) + 80);
      v117[0] = MEMORY[0x1E0C809B0];
      v117[1] = 3221225472;
      v117[2] = __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_81;
      v117[3] = &unk_1E8C77780;
      v117[4] = &v119;
      objc_msgSend(v33, "enumerateKeysAndObjectsUsingBlock:", v117);
    }
    else
    {
      if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "objectForKeyedSubscript:", v18);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "userEnabled");
        *(_BYTE *)(*(_QWORD *)&buf[8] + 24) = v28;

      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "objectForKeyedSubscript:", v18);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "isHiddenByUser");
      *((_BYTE *)v120 + 24) = v30;

      fp_current_or_default_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_cold_6();

    }
    v34 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "descriptor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setIsContentManaged:", objc_msgSend(v35, "owningApplicationIsManaged") | objc_msgSend(v34, "isContentManaged"));

    v36 = *(void **)(*(_QWORD *)(a1 + 40) + 80);
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "precomposedStringWithCanonicalMapping");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectForKeyedSubscript:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      if (*(_QWORD *)(a1 + 48))
      {
        v40 = *(_QWORD *)(a1 + 80);
        objc_msgSend(MEMORY[0x1E0CAAC28], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 516, 0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v40 + 16))(v40, 0, v41);
LABEL_28:

        objc_sync_exit(v23);
LABEL_104:

        _Block_object_dispose(&v119, 8);
        _Block_object_dispose(buf, 8);

        goto LABEL_105;
      }
      fp_current_or_default_log();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_cold_5();

      objc_msgSend(v39, "nsDomainOrNilForDefault");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (v41)
        objc_msgSend(*v2, "copyValuesFromExistingDomain:", v41);
      v46 = objc_msgSend(v41, "testingModes");
      if (v46 == objc_msgSend(*v2, "testingModes")
        && (v47 = objc_msgSend(v41, "isReplicated"), v47 == objc_msgSend(*v2, "isReplicated"))
        && !*(_BYTE *)(a1 + 96))
      {
        objc_msgSend(v39, "serialQueue");
        v92 = objc_claimAutoreleasedReturnValue();
        v114[0] = MEMORY[0x1E0C809B0];
        v114[1] = 3221225472;
        v114[2] = __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_91;
        v114[3] = &unk_1E8C75850;
        v93 = v39;
        v115 = v93;
        v116 = *(id *)(a1 + 32);
        dispatch_sync(v92, v114);

        removeRootPathKeys(*(void **)(*(_QWORD *)(a1 + 40) + 88), v93);
        objc_msgSend(v93, "defaultBackend");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v113 = 0;
        v95 = objc_msgSend(v94, "updateRootAfterDomainChangeWithError:", &v113);
        v96 = v113;

        if ((v95 & 1) != 0)
        {
          addRootPathKeys(*(void **)(*(_QWORD *)(a1 + 40) + 88), v93);
        }
        else
        {
          objc_msgSend(v93, "serialQueue");
          v97 = objc_claimAutoreleasedReturnValue();
          v110[0] = MEMORY[0x1E0C809B0];
          v110[1] = 3221225472;
          v110[2] = __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_2_92;
          v110[3] = &unk_1E8C75850;
          v98 = v93;
          v111 = v98;
          v112 = v41;
          dispatch_sync(v97, v110);

          addRootPathKeys(*(void **)(*(_QWORD *)(a1 + 40) + 88), v98);
          (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();

        }
        if ((v95 & 1) == 0)
          goto LABEL_28;
        v42 = 0;
        v91 = 1;
      }
      else
      {
        if ((objc_msgSend(v41, "testingModes") & 2) != 0 && (objc_msgSend(*v2, "testingModes") & 2) != 0)
        {
          v86 = *(_QWORD *)(a1 + 80);
          FPInvalidParameterError();
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, void *))(v86 + 16))(v86, 0, v87);

          goto LABEL_28;
        }
        v48 = objc_msgSend(v41, "testingModes");
        if (v48 == objc_msgSend(*v2, "testingModes"))
        {
          v49 = objc_msgSend(v41, "isReplicated");
          if (v49 == objc_msgSend(*v2, "isReplicated"))
          {
            fp_current_or_default_log();
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              v90 = *v2;
              *(_DWORD *)v124 = 138412290;
              v125 = v90;
              _os_log_impl(&dword_1CF55F000, v50, OS_LOG_TYPE_DEFAULT, "[NOTICE] need a new domain for %@ because we were asked to reload the domain", v124, 0xCu);
            }
            v42 = CFSTR("domainReload");
          }
          else
          {
            fp_current_or_default_log();
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              v51 = *v2;
              *(_DWORD *)v124 = 138412290;
              v125 = v51;
              _os_log_impl(&dword_1CF55F000, v50, OS_LOG_TYPE_DEFAULT, "[NOTICE] need a new domain for %@ because replicated status changed", v124, 0xCu);
            }
            v42 = CFSTR("domainReplicationUpdate");
          }
        }
        else
        {
          fp_current_or_default_log();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            v61 = *v2;
            *(_DWORD *)v124 = 138412290;
            v125 = v61;
            _os_log_impl(&dword_1CF55F000, v50, OS_LOG_TYPE_DEFAULT, "[NOTICE] need a new domain for %@ because testing modes changed", v124, 0xCu);
          }
          v42 = CFSTR("domainTestingModeUpdate");
        }

        v91 = 0;
      }

      objc_sync_exit(v23);
      if ((v91 & 1) != 0)
      {
        v99 = 0;
LABEL_31:
        v43 = *(id *)(a1 + 40);
        objc_sync_enter(v43);
        objc_msgSend(v39, "volume");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (v44)
        {
          v100 = 0;
        }
        else
        {
          objc_msgSend(*v2, "volumeUUID");
          v52 = (id)objc_claimAutoreleasedReturnValue();
          v53 = *(void **)(a1 + 40);
          if (v52)
          {
            objc_msgSend(v53, "server");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "volumeManager");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v109 = 0;
            objc_msgSend(v55, "libraryForVolume:createIfNeeded:error:", v52, 1, &v109);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v100 = v109;

            if (!v44)
            {
              fp_current_or_default_log();
              v88 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v100, "fp_prettyDescription");
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_cold_3((uint64_t)v52, v89, (uint64_t)v124);
              }

              (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
              v23 = 0;
              goto LABEL_99;
            }
            if ((objc_msgSend(v44, "isDefaultVolumeForCurrentPersona") & 1) == 0)
            {
              if (!FPFeatureFlagEbihilIsEnabled()
                || (objc_msgSend(*(id *)(a1 + 40), "descriptor"),
                    v56 = (void *)objc_claimAutoreleasedReturnValue(),
                    v57 = objc_msgSend(v56, "allowsExternalVolumes"),
                    v56,
                    (v57 & 1) == 0))
              {
                fp_current_or_default_log();
                v58 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
                  __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_cold_4();

                v59 = *(_QWORD *)(a1 + 80);
                FPNotSupportedError();
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                (*(void (**)(uint64_t, _QWORD, void *))(v59 + 16))(v59, 0, v60);

                v23 = 0;
                goto LABEL_99;
              }
            }
          }
          else
          {
            objc_msgSend(v53, "server");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "volumeManager");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "defaultVolumeForCurrentPersona");
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            v100 = 0;
          }

        }
        if (objc_msgSend(v44, "role") != 3)
        {
          objc_msgSend(*v2, "identifier");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend(v64, "hasPrefix:", *MEMORY[0x1E0CAAED8]);

          if (v65)
          {
            fp_current_or_default_log();
            v66 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
              __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_cold_2();

            v67 = *(_QWORD *)(a1 + 80);
            objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", 19);
            v52 = (id)objc_claimAutoreleasedReturnValue();
            (*(void (**)(uint64_t, _QWORD, id))(v67 + 16))(v67, 0, v52);
            v23 = 0;
            goto LABEL_99;
          }
        }
        if (v99)
        {
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "UUIDString");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*v2, "setSpotlightDomainIdentifier:", v69);

          v70 = (void *)objc_msgSend(*(id *)(a1 + 40), "newDomainFromNSDomain:volume:", *(_QWORD *)(a1 + 32), v44);
          objc_msgSend(v70, "setUnableToStartup:", *(unsigned __int8 *)(a1 + 97));
          objc_msgSend(v70, "setStartupError:", *(_QWORD *)(a1 + 72));
          objc_msgSend(v70, "serialQueue");
          v71 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_97;
          block[3] = &unk_1E8C75850;
          v23 = v70;
          v107 = v23;
          v108 = *v2;
          dispatch_sync(v71, block);

          if (v39)
          {
            objc_msgSend(v23, "setUserEnabled:", objc_msgSend(v39, "userEnabled"));
            objc_msgSend(v39, "fpfsRootBookmarkData");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setFpfsRootBookmarkData:", v72);

            v73 = objc_msgSend(v39, "isHiddenByUser");
          }
          else
          {
            objc_msgSend(v23, "setUserEnabled:", *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24));
            v73 = *((_BYTE *)v120 + 24) != 0;
          }
          objc_msgSend(v23, "setHiddenByUser:", v73);
          if ((objc_msgSend(v23, "userEnabled") & 1) != 0)
            v74 = 1;
          else
            v74 = objc_msgSend(*v2, "testingModes") & 1;
          objc_msgSend(v23, "setUserEnabled:", v74);
          objc_msgSend(v23, "setEjectable:", 0);
          objc_msgSend(v23, "finishSetup");
          if (v39)
          {
            if (!v42)
              v42 = CFSTR("domainConfigurationUpdate");
          }
          else if (objc_msgSend(v23, "isUsingFPFS"))
          {
            v76 = *(_QWORD *)(a1 + 48);
            v75 = *(_QWORD *)(a1 + 56);
            v105 = v100;
            v77 = objc_msgSend(v23, "createRootByImportingDirectoryAtURL:knownFolders:error:", v76, v75, &v105);
            if (v76)
              v42 = CFSTR("domainImport");
            v78 = v105;

            if ((v77 & 1) == 0)
            {
              (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();

              v52 = v107;
              v100 = v78;
LABEL_99:

              v85 = 0;
LABEL_100:

              objc_sync_exit(v43);
              if (v85)
              {
                if (v99)
                {
                  objc_msgSend(v39, "invalidateWithReason:", CFSTR("replaced with newer instance"));
                  objc_msgSend(v39, "invalidateSession");
                }
                (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
              }
              goto LABEL_104;
            }
            v100 = v78;
          }
          v79 = *(void **)(a1 + 40);
          v80 = *(unsigned __int8 *)(a1 + 98);
          v102[0] = MEMORY[0x1E0C809B0];
          v102[1] = 3221225472;
          v102[2] = __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_2_102;
          v102[3] = &unk_1E8C77628;
          v104 = *(_BYTE *)(a1 + 97);
          v102[4] = v79;
          v23 = v23;
          v103 = v23;
          objc_msgSend(v79, "_startOrClearDomain:userAllowedDBDrop:reason:completion:", v23, v80, v42, v102);
          v81 = *(void **)(*(_QWORD *)(a1 + 40) + 80);
          objc_msgSend(*(id *)(a1 + 32), "identifier");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "precomposedStringWithCanonicalMapping");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "setObject:forKeyedSubscript:", v23, v83);

          addRootPathKeys(*(void **)(*(_QWORD *)(a1 + 40) + 88), v23);
        }
        else
        {
          v23 = 0;
        }
        if (objc_msgSend(v44, "isDefaultVolumeForCurrentPersona"))
          v84 = (id)objc_msgSend(*(id *)(a1 + 40), "_recreateDefaultDomainIfNeededOnVolume:", v44);
        objc_msgSend(*(id *)(a1 + 40), "_writeDomainPropertiesIntoLibrary:ifChangedFrom:", v44, 0);
        v85 = 1;
        goto LABEL_100;
      }
    }
    else
    {
      objc_sync_exit(v23);

      v42 = CFSTR("domainCreation");
    }
    objc_msgSend(v39, "stopIndexer");
    v99 = 1;
    goto LABEL_31;
  }
  fp_current_or_default_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_cold_1(v20);

  v21 = *(_QWORD *)(a1 + 80);
  FPNotSupportedError();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v21 + 16))(v21, 0, v22);

LABEL_105:
}

id __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "knownFolder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_79(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  NSObject *v8;

  v7 = a3;
  if ((objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0CAAB38]) & 1) == 0
    && objc_msgSend(v7, "userEnabled"))
  {
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_79_cold_1();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }

}

void __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_81(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  NSObject *v8;

  v7 = a3;
  if ((objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0CAAB38]) & 1) == 0
    && (objc_msgSend(v7, "isHiddenByUser") & 1) == 0)
  {
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_81_cold_1();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }

}

uint64_t __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_91(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNsDomainOrNilForDefault:", *(_QWORD *)(a1 + 40));
}

uint64_t __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_2_92(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNsDomainOrNilForDefault:", *(_QWORD *)(a1 + 40));
}

uint64_t __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_97(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNsDomainOrNilForDefault:", *(_QWORD *)(a1 + 40));
}

uint64_t __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_2_102(uint64_t result)
{
  if (!*(_BYTE *)(result + 48))
    return objc_msgSend(*(id *)(result + 32), "materializeRootForDomain:", *(_QWORD *)(result + 40));
  return result;
}

- (void)removeAllDomainsForRequest:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *domainQueue;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  domainQueue = self->_domainQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__FPDProvider_removeAllDomainsForRequest_completionHandler___block_invoke;
  v12[3] = &unk_1E8C75D18;
  v12[4] = self;
  v13 = v7;
  v14 = v8;
  v15 = a2;
  v10 = v8;
  v11 = v7;
  dispatch_async(domainQueue, v12);

}

void __60__FPDProvider_removeAllDomainsForRequest_completionHandler___block_invoke(uint64_t a1)
{
  id v1;
  NSObject *v2;
  void *v3;
  uint64_t v4;
  _BYTE *v5;
  NSObject *v6;
  uint64_t v7;
  _BYTE *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t i;
  void *v19;
  id v20;
  void *v21;
  char v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void **v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v1 = (id)fpfs_adopt_log();
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v43 = v3;
    v44 = 2114;
    v45 = v4;
    _os_log_impl(&dword_1CF55F000, v2, OS_LOG_TYPE_DEFAULT, "[NOTICE] Removing all domains for %@ for %{public}@", buf, 0x16u);

  }
  v5 = *(_BYTE **)(a1 + 32);
  if (v5[16])
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __60__FPDProvider_removeAllDomainsForRequest_completionHandler___block_invoke_cold_3(a1);

    v7 = *(_QWORD *)(a1 + 48);
    FPProviderXPCInvalidError();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v34);
  }
  else
  {
    v8 = v5;
    objc_sync_enter(v8);
    v34 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "copy");
    objc_sync_exit(v8);

    if (objc_msgSend(v34, "count") == 1)
    {
      objc_msgSend(v34, "objectForKeyedSubscript:", *MEMORY[0x1E0CAAB38]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9 == 0;

      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ Only domain expected to be the default domain"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

        __assert_rtn("-[FPDProvider removeAllDomainsForRequest:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDProvider.m", 1335, (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"));
      }
    }
    else
    {
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      objc_msgSend(v34, "allValues");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v38;
        v16 = *MEMORY[0x1E0CAAB38];
        v17 = 1;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v38 != v15)
              objc_enumerationMutation(obj);
            v19 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            objc_msgSend(v19, "invalidateWithReason:", CFSTR("removing all domains"));
            v20 = (id)objc_msgSend(v19, "cleanupDomainWithMode:", 0);
            objc_msgSend(v19, "invalidateSession");
            objc_msgSend(v19, "identifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "isEqualToString:", v16);

            if ((v22 & 1) == 0)
            {
              v13 |= objc_msgSend(v19, "userEnabled");
              v17 &= objc_msgSend(v19, "isHiddenByUser");
            }
          }
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        }
        while (v14);
      }
      else
      {
        LOBYTE(v17) = 1;
      }

      v23 = *(id *)(a1 + 32);
      objc_sync_enter(v23);
      v24 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count");
      if (v24 != objc_msgSend(v34, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ Unexpected number of domains to remove"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
          __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

        __assert_rtn("-[FPDProvider removeAllDomainsForRequest:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDProvider.m", 1361, (const char *)objc_msgSend(objc_retainAutorelease(v32), "UTF8String"));
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeAllObjects");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeAllObjects");
      v25 = *(void **)(a1 + 32);
      objc_msgSend(v25, "server");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "volumeManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "defaultVolumeForCurrentPersona");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "_recreateDefaultDomainIfNeededOnVolume:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "canToggleDomainVisibility"))
      {
        objc_msgSend(v29, "setUserEnabled:", v13 & 1);
        objc_msgSend(v29, "setHiddenByUser:", v17 & 1);
      }
      objc_msgSend(v29, "finishSetup");
      v30 = *(void ***)(a1 + 32);
      if (v29)
      {
        addRootPathKeys(v30[11], v29);
        objc_msgSend(*(id *)(a1 + 32), "_startOrClearDomain:userAllowedDBDrop:reason:completion:", v29, 0, CFSTR("domainCreation"), &__block_literal_global_111);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "defaultNSDomain");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "reloadDomain:unableToStartup:startupError:completionHandler:", v31, 0, 0, &__block_literal_global_112);

      }
      objc_msgSend(*(id *)(a1 + 32), "writeAllDomainProperties");

      objc_sync_exit(v23);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)removeDomain:(id)a3 mode:(unint64_t)a4 request:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  -[FPDProvider loggerForDomainWithIdentifier:](self, "loggerForDomainWithIdentifier:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  fpfs_adopt_log();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9;
  v14 = v10;
  v15 = v11;
  fp_dispatch_async_with_logs();

  __fp_pop_log();
}

void __59__FPDProvider_removeDomain_mode_request_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void **v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  char v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    v37 = v3;
    v38 = 2112;
    v39 = v4;
    v40 = 2114;
    v41 = v5;
    _os_log_impl(&dword_1CF55F000, v2, OS_LOG_TYPE_DEFAULT, "[NOTICE] Removing domain %@ on extension %@ for %{public}@", buf, 0x20u);

  }
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 40) + 16))
  {
    v9 = *MEMORY[0x1E0CAAB38];
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x1E0CAAB38]))
    {
      v10 = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0CB35C8], "fp_invalidArgumentError:", CFSTR("Default domain cannot be removed"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v8);
      goto LABEL_29;
    }
    v11 = *(id *)(a1 + 40);
    objc_sync_enter(v11);
    v8 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "mutableCopy");
    v12 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "mutableCopy");
    objc_msgSend(*(id *)(a1 + 32), "precomposedStringWithCanonicalMapping");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      objc_sync_exit(v11);
LABEL_28:

      goto LABEL_29;
    }
    removeRootPathKeys(v12, v14);
    objc_msgSend(*(id *)(a1 + 32), "precomposedStringWithCanonicalMapping");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v15);

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 80), v8);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 88), v12);
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 && objc_msgSend(v8, "count") == 1 || !objc_msgSend(v8, "count"))
    {
      v17 = objc_msgSend(v14, "userEnabled");
      v18 = objc_msgSend(v14, "isHiddenByUser");
      fp_current_or_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        __59__FPDProvider_removeDomain_mode_request_completionHandler___block_invoke_cold_2(v17, v19);

    }
    else
    {
      v17 = 0;
      v18 = 0;
    }
    objc_msgSend(v16, "setUserEnabled:", v17);
    objc_msgSend(v16, "setHiddenByUser:", v18);
    v20 = *(void **)(a1 + 40);
    objc_msgSend(v20, "server");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "volumeManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "defaultVolumeForCurrentPersona");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_recreateDefaultDomainIfNeededOnVolume:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "finishSetup");
    v25 = *(void ***)(a1 + 40);
    if (v24)
    {
      addRootPathKeys(v25[11], v24);
      objc_msgSend(*(id *)(a1 + 40), "_startOrClearDomain:userAllowedDBDrop:reason:completion:", v24, 0, CFSTR("domainCreation"), &__block_literal_global_121);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "defaultNSDomain");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "reloadDomain:unableToStartup:startupError:completionHandler:", v26, 0, 0, &__block_literal_global_122);

    }
    objc_sync_exit(v11);

    objc_msgSend(v14, "rootURLs");
    v27 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject count](v27, "count"))
    {
      objc_msgSend(v14, "rootURLs");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = FPClearImportCookieForDomainURL();
      v31 = 0;

      if ((v30 & 1) != 0)
      {
LABEL_27:
        objc_msgSend(v14, "invalidateWithReason:", CFSTR("removing domain"));
        objc_msgSend(v14, "cleanupDomainWithMode:", *(_QWORD *)(a1 + 72));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "invalidateSession");
        v33 = *(id *)(a1 + 40);
        objc_sync_enter(v33);
        v34 = *(void **)(a1 + 40);
        objc_msgSend(v14, "volume");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "_writeDomainPropertiesIntoLibrary:ifChangedFrom:", v35, &unk_1E8C95E98);

        objc_sync_exit(v33);
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

        v11 = v31;
        goto LABEL_28;
      }
      fp_current_or_default_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        __108__FPDProvider_addDomain_byImportingDirectoryAtURL_userAllowedDBDrop_knownFolders_request_completionHandler___block_invoke_cold_1();
    }
    else
    {
      v31 = 0;
    }

    goto LABEL_27;
  }
  fp_current_or_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __59__FPDProvider_removeDomain_mode_request_completionHandler___block_invoke_cold_3(a1);

  v7 = *(_QWORD *)(a1 + 56);
  FPProviderXPCInvalidError();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);
LABEL_29:

}

- (void)reloadDomain:(id)a3 unableToStartup:(BOOL)a4 startupError:(id)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  FPDServer *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  FPDServer *v16;
  uint64_t v17;
  _QWORD v18[4];
  FPDServer *v19;
  id v20;

  v7 = a4;
  v10 = a6;
  v11 = self->_server;
  v12 = a5;
  v13 = a3;
  +[FPDRequest requestForSelf](FPDRequest, "requestForSelf");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __75__FPDProvider_reloadDomain_unableToStartup_startupError_completionHandler___block_invoke;
  v18[3] = &unk_1E8C77898;
  v19 = v11;
  v20 = v10;
  v15 = v10;
  v16 = v11;
  LOBYTE(v17) = 1;
  -[FPDProvider addDomain:byImportingDirectoryAtURL:knownFolders:userAllowedDBDrop:unableToStartup:startupError:reloadDomain:request:completionHandler:](self, "addDomain:byImportingDirectoryAtURL:knownFolders:userAllowedDBDrop:unableToStartup:startupError:reloadDomain:request:completionHandler:", v13, 0, MEMORY[0x1E0C9AA60], 0, v7, v12, v17, v14, v18);

}

void __75__FPDProvider_reloadDomain_unableToStartup_startupError_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __75__FPDProvider_reloadDomain_unableToStartup_startupError_completionHandler___block_invoke_cold_1((uint64_t)v5, v6, v7);

  }
  objc_msgSend(*(id *)(a1 + 32), "signalProviderChanges");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_setEnabledOrHiddenByUser:(BOOL)a3 forDomainIdentifier:(id)a4 newValue:(BOOL)a5 request:(id)a6 completionHandler:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;

  v10 = a4;
  v11 = a6;
  v12 = a7;
  -[FPDProvider loggerForDomainWithIdentifier:](self, "loggerForDomainWithIdentifier:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  fpfs_adopt_log();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[FPDProviderDescriptor canToggleDomainVisibility](self->_descriptor, "canToggleDomainVisibility"))
  {
    v14 = (void *)*MEMORY[0x1E0CAAB38];
    if (v10)
      v14 = v10;
    v15 = v14;

    v17 = v12;
    v10 = v15;
    fp_dispatch_async_with_logs();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3328, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v12 + 2))(v12, v16);

  }
  __fp_pop_log();

}

void __96__FPDProvider__setEnabledOrHiddenByUser_forDomainIdentifier_newValue_request_completionHandler___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  _BYTE *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  _BOOL4 v16;
  NSObject *v17;
  uint64_t v18;
  int v19;
  int v20;
  char v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  char v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  dispatch_semaphore_t v31;
  NSObject *v32;
  id v33;
  _QWORD v34[4];
  NSObject *v35;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[16])
  {
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __96__FPDProvider__setEnabledOrHiddenByUser_forDomainIdentifier_newValue_request_completionHandler___block_invoke_cold_2(a1);

    v4 = *(_QWORD *)(a1 + 48);
    FPProviderXPCInvalidError();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

    return;
  }
  v6 = v2;
  objc_sync_enter(v6);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  objc_msgSend(*(id *)(a1 + 40), "precomposedStringWithCanonicalMapping");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v6);
  if (!v9)
  {
    v18 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4, MEMORY[0x1E0C9AA70]);
    v33 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v18 + 16))(v18);

    return;
  }
  v10 = *(id *)(a1 + 32);
  objc_sync_enter(v10);
  v11 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  objc_msgSend(*(id *)(a1 + 40), "precomposedStringWithCanonicalMapping");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 64))
  {
    v14 = objc_msgSend(v13, "userEnabled");
    v15 = *(unsigned __int8 *)(a1 + 65);
    if (v15 != v14)
    {
      objc_msgSend(v13, "setUserEnabled:", v15 != 0);
      v16 = *(_BYTE *)(a1 + 65) != 0;
      fp_current_or_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v13;
        _os_log_impl(&dword_1CF55F000, v17, OS_LOG_TYPE_INFO, "[INFO] reloading domain because userEnabled state changed for %@", (uint8_t *)&buf, 0xCu);
      }
LABEL_17:

      v22 = *(void **)(a1 + 32);
      objc_msgSend(v13, "volume");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_writeDomainPropertiesIntoLibrary:ifChangedFrom:", v23, 0);

      v21 = 1;
      goto LABEL_18;
    }
  }
  else
  {
    v19 = objc_msgSend(v13, "isHiddenByUser");
    v20 = *(unsigned __int8 *)(a1 + 65);
    if (v20 != v19)
    {
      objc_msgSend(v13, "setHiddenByUser:", v20 != 0);
      fp_current_or_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v13;
        _os_log_impl(&dword_1CF55F000, v17, OS_LOG_TYPE_INFO, "[INFO] reloading domain because hiddenByUser state changed for %@", (uint8_t *)&buf, 0xCu);
      }
      v16 = 0;
      goto LABEL_17;
    }
  }
  v16 = 0;
  v21 = 0;
LABEL_18:
  if (objc_msgSend(v13, "userEnabled"))
    v24 = objc_msgSend(v13, "isHiddenByUser") ^ 1;
  else
    v24 = 0;
  objc_sync_exit(v10);

  if (v16)
  {
    objc_msgSend(v13, "defaultBackend");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_opt_respondsToSelector();

    if ((v26 & 1) != 0)
    {
      v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v28 = objc_msgSend(v27, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CAAB48], -2011, 0);
      objc_msgSend(v13, "defaultBackend");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "signalErrorResolved:completionHandler:", v28, &__block_literal_global_134);

    }
    else
    {
      fp_current_or_default_log();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        __96__FPDProvider__setEnabledOrHiddenByUser_forDomainIdentifier_newValue_request_completionHandler___block_invoke_cold_1(v28);
    }

  }
  if ((v21 & 1) != 0)
  {
    objc_msgSend(v13, "indexer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__10;
    v40 = __Block_byref_object_dispose__10;
    v41 = 0;
    if (v30)
    {
      v31 = dispatch_semaphore_create(0);
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __96__FPDProvider__setEnabledOrHiddenByUser_forDomainIdentifier_newValue_request_completionHandler___block_invoke_135;
      v34[3] = &unk_1E8C77948;
      p_buf = &buf;
      v32 = v31;
      v35 = v32;
      objc_msgSend(v30, "setIndexingEnabled:completionHandler:", v24, v34);
      dispatch_semaphore_wait(v32, 0xFFFFFFFFFFFFFFFFLL);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    _Block_object_dispose(&buf, 8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

void __96__FPDProvider__setEnabledOrHiddenByUser_forDomainIdentifier_newValue_request_completionHandler___block_invoke_133(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __96__FPDProvider__setEnabledOrHiddenByUser_forDomainIdentifier_newValue_request_completionHandler___block_invoke_133_cold_1();

  }
}

void __96__FPDProvider__setEnabledOrHiddenByUser_forDomainIdentifier_newValue_request_completionHandler___block_invoke_135(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)setEnabled:(BOOL)a3 forDomainIdentifier:(id)a4 request:(id)a5 completionHandler:(id)a6
{
  -[FPDProvider _setEnabledOrHiddenByUser:forDomainIdentifier:newValue:request:completionHandler:](self, "_setEnabledOrHiddenByUser:forDomainIdentifier:newValue:request:completionHandler:", 1, a4, a3, a5, a6);
}

- (void)setHiddenByUser:(BOOL)a3 forDomainIdentifier:(id)a4 request:(id)a5 completionHandler:(id)a6
{
  -[FPDProvider _setEnabledOrHiddenByUser:forDomainIdentifier:newValue:request:completionHandler:](self, "_setEnabledOrHiddenByUser:forDomainIdentifier:newValue:request:completionHandler:", 0, a4, a3, a5, a6);
}

- (void)enableAllDomainsIfNoUserElection
{
  NSObject *v3;
  FPDProvider *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = dispatch_group_create();
  v4 = self;
  objc_sync_enter(v4);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableDictionary allValues](v4->_domainsByID, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
        dispatch_group_enter(v3);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[FPDRequest requestForSelf](FPDRequest, "requestForSelf");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __47__FPDProvider_enableAllDomainsIfNoUserElection__block_invoke;
        v12[3] = &unk_1E8C753A8;
        v13 = v3;
        -[FPDProvider setEnabled:forDomainIdentifier:request:completionHandler:](v4, "setEnabled:forDomainIdentifier:request:completionHandler:", 1, v10, v11, v12);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  objc_sync_exit(v4);
  dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

}

void __47__FPDProvider_enableAllDomainsIfNoUserElection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  if (v3)
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "fp_prettyDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] unhandled error: %@", (uint8_t *)&v6, 0xCu);

    }
  }

}

- (void)setEjectable:(BOOL)a3 forDomainIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v7 = a5;
  v8 = a4;
  -[FPDProvider loggerForDomainWithIdentifier:](self, "loggerForDomainWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  fpfs_adopt_log();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)*MEMORY[0x1E0CAAB38];
  if (v8)
    v10 = v8;
  v11 = v10;

  v13 = v7;
  v12 = v11;
  fp_dispatch_async_with_logs();

  __fp_pop_log();
}

void __66__FPDProvider_setEjectable_forDomainIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  _BYTE *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[16])
  {
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __66__FPDProvider_setEjectable_forDomainIdentifier_completionHandler___block_invoke_cold_2(a1);

    v4 = *(_QWORD *)(a1 + 48);
    FPProviderXPCInvalidError();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
  else
  {
    v6 = v2;
    objc_sync_enter(v6);
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __66__FPDProvider_setEjectable_forDomainIdentifier_completionHandler___block_invoke_cold_1(a1, v7);

    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
    objc_msgSend(*(id *)(a1 + 40), "precomposedStringWithCanonicalMapping");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setEjectable:", *(unsigned __int8 *)(a1 + 64));
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v10, "volume");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_writeDomainPropertiesIntoLibrary:ifChangedFrom:", v12, 0);

    objc_sync_exit(v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

- (void)setDomainUserInfo:(id)a3 forDomainIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[FPDProvider loggerForDomainWithIdentifier:](self, "loggerForDomainWithIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  fpfs_adopt_log();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)*MEMORY[0x1E0CAAB38];
  if (v10)
    v12 = v10;
  v13 = v12;

  v16 = v9;
  v14 = v13;
  v15 = v8;
  fp_dispatch_async_with_logs();

  __fp_pop_log();
}

void __71__FPDProvider_setDomainUserInfo_forDomainIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  _BYTE *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[16])
  {
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __71__FPDProvider_setDomainUserInfo_forDomainIdentifier_completionHandler___block_invoke_cold_2(a1);

    v4 = *(_QWORD *)(a1 + 56);
    FPProviderXPCInvalidError();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
  else
  {
    v6 = v2;
    objc_sync_enter(v6);
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __71__FPDProvider_setDomainUserInfo_forDomainIdentifier_completionHandler___block_invoke_cold_1();

    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
    objc_msgSend(*(id *)(a1 + 40), "precomposedStringWithCanonicalMapping");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "setDomainUserInfo:", *(_QWORD *)(a1 + 48));
      v11 = *(void **)(a1 + 32);
      objc_msgSend(v10, "volume");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_writeDomainPropertiesIntoLibrary:ifChangedFrom:", v12, 0);

    }
    objc_sync_exit(v6);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

- (void)setReplicatedKnownFolders:(unint64_t)a3 forDomainIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v7 = a5;
  v8 = a4;
  -[FPDProvider loggerForDomainWithIdentifier:](self, "loggerForDomainWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  fpfs_adopt_log();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)*MEMORY[0x1E0CAAB38];
  if (v8)
    v10 = v8;
  v11 = v10;

  v13 = v7;
  v12 = v11;
  fp_dispatch_async_with_logs();

  __fp_pop_log();
}

void __79__FPDProvider_setReplicatedKnownFolders_forDomainIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  _BYTE *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[16])
  {
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __79__FPDProvider_setReplicatedKnownFolders_forDomainIdentifier_completionHandler___block_invoke_cold_2(a1);

    v4 = *(_QWORD *)(a1 + 48);
    FPProviderXPCInvalidError();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
  else
  {
    v6 = v2;
    objc_sync_enter(v6);
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __79__FPDProvider_setReplicatedKnownFolders_forDomainIdentifier_completionHandler___block_invoke_cold_1();

    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
    objc_msgSend(*(id *)(a1 + 40), "precomposedStringWithCanonicalMapping");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "nsDomain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "replicatedKnownFolders");
      v13 = *(_QWORD *)(a1 + 64);

      if (v12 != v13)
      {
        v14 = *(_QWORD *)(a1 + 64);
        objc_msgSend(v10, "nsDomain");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setReplicatedKnownFolders:", v14);

        v16 = *(void **)(a1 + 32);
        objc_msgSend(v10, "volume");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "_writeDomainPropertiesIntoLibrary:ifChangedFrom:", v17, 0);

      }
    }

    objc_sync_exit(v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

- (void)dumpValue:(id)a3 forKey:(id)a4 to:(id)a5
{
  __CFString *v7;
  id v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = (__CFString *)a3;
  v8 = a5;
  objc_msgSend(a4, "stringByAppendingString:", CFSTR(":"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v7;
      objc_msgSend(v8, "write:", CFSTR("  + %@ (%lu)\n"), v9, -[__CFString count](v10, "count"));
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v11 = v10;
      v12 = -[__CFString countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v21;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v21 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v15);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v16, "fp_shortDescription");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "write:", CFSTR("    - %@\n"), v17);

            }
            else
            {
              objc_msgSend(v8, "write:", CFSTR("    - %@\n"), v16);
            }
            ++v15;
          }
          while (v13 != v15);
          v13 = -[__CFString countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v13);
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_19;
      -[__CFString fp_shortDescription](v7, "fp_shortDescription");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "write:", CFSTR("  + %-25@ %@\n"), v9, v11);
    }

    goto LABEL_22;
  }
  if (!-[__CFString count](v7, "count"))
  {
    objc_msgSend(v8, "write:", CFSTR("  + %-25@ {}\n"), v9, v19);
    goto LABEL_22;
  }
LABEL_19:
  v18 = CFSTR("none");
  if (v7)
    v18 = v7;
  objc_msgSend(v8, "write:", CFSTR("  + %-25@ %@\n"), v9, v18);
LABEL_22:

}

+ (id)getXattr:(const char *)a3 at:(const char *)a4
{
  ssize_t v6;
  size_t v7;
  void *v8;
  ssize_t v9;
  __CFString *v10;

  v6 = getxattr(a4, a3, 0, 0, 0, 1);
  if (v6 < 1)
  {
    v10 = &stru_1E8C795D8;
  }
  else
  {
    v7 = v6;
    v8 = malloc_type_malloc(v6, 0x9FD0B232uLL);
    v9 = getxattr(a4, a3, v8, v7, 0, 1);
    if (v9 < 1)
      v10 = &stru_1E8C795D8;
    else
      v10 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v8, v9, 4);
    free(v8);
  }
  return v10;
}

+ (void)dumpXattrsForItemAtURL:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  ssize_t v8;
  size_t v9;
  char *v10;
  ssize_t v11;
  ssize_t v12;
  void *v13;
  char *v14;
  const char *v15;
  void *v16;
  id v17;

  v5 = a3;
  v6 = a4;
  v17 = objc_retainAutorelease(v5);
  v7 = (const char *)objc_msgSend(v17, "fileSystemRepresentation");
  v8 = listxattr(v7, 0, 0, 0);
  if (v8 >= 1)
  {
    v9 = v8;
    v10 = (char *)malloc_type_malloc(v8, 0x2B89101AuLL);
    v11 = listxattr(v7, v10, v9, 0);
    if (v11 >= 1)
    {
      v12 = v11;
      objc_msgSend(v17, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "write:", CFSTR("%@\n"), v13);

      v14 = &v10[v12];
      v15 = v10;
      do
      {
        +[FPDProvider getXattr:at:](FPDProvider, "getXattr:at:", v15, v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "write:", CFSTR("    %s: %@\n"), v15, v16);

        v15 += strnlen(v15, v14 - v15) + 1;
      }
      while (v15 < v14);
    }
    free(v10);
  }

}

- (void)dumpXattrsForDomains:(id)a3 dumper:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id obj;
  id obja;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "write:", CFSTR("== CloudStorage xattrs ==\n"));
  objc_msgSend(v6, "write:", CFSTR("=========================\n"));
  objc_msgSend(MEMORY[0x1E0C99E98], "fp_cloudStorageDirectory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v5;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
  if (v29)
  {
    v27 = *(_QWORD *)v45;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v45 != v27)
          objc_enumerationMutation(obj);
        -[FPDProvider providerDomainForDomain:](self, "providerDomainForDomain:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        objc_msgSend(v9, "storageURLs");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v41;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v41 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v14), "fp_commonDirectDescendantOf:", v7);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (v15)
                +[FPDProvider dumpXattrsForItemAtURL:to:](FPDProvider, "dumpXattrsForItemAtURL:to:", v15, v6);

              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v29);
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
    }
    while (v29);
  }

  objc_msgSend(v6, "write:", CFSTR("\n"));
  objc_msgSend(v6, "write:", CFSTR("== FileProvider xattrs ==\n"));
  objc_msgSend(v6, "write:", CFSTR("=========================\n"));
  objc_msgSend(MEMORY[0x1E0C99E98], "fp_supportDirectory");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obja = obj;
  v30 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
  if (v30)
  {
    v28 = *(_QWORD *)v37;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v37 != v28)
          objc_enumerationMutation(obja);
        -[FPDProvider providerDomainForDomain:](self, "providerDomainForDomain:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v16));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        objc_msgSend(v17, "storageURLs");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v33;
          do
          {
            v22 = 0;
            do
            {
              if (*(_QWORD *)v33 != v21)
                objc_enumerationMutation(v18);
              objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v22), "fp_commonDirectDescendantOf:", v7);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (v23)
                +[FPDProvider dumpXattrsForItemAtURL:to:](FPDProvider, "dumpXattrsForItemAtURL:to:", v23, v6);

              ++v22;
            }
            while (v20 != v22);
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
          }
          while (v20);
        }

        ++v16;
      }
      while (v16 != v30);
      v30 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
    }
    while (v30);
  }

  objc_msgSend(v6, "write:", CFSTR("\n"));
}

+ (void)dumpXattrsForSyncRootDirectoryOfVolume:(id)a3 dumper:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "syncRootsDirectory");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dumpXattrsForContentsOfDirectoryAtURL:dumper:", v7, v6);

}

+ (void)dumpXattrsForSystemDirectoryOfVolume:(id)a3 dumper:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "systemDirectory");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dumpXattrsForContentsOfDirectoryAtURL:dumper:", v7, v6);

}

+ (void)dumpXattrsForContentsOfDirectoryAtURL:(id)a3 dumper:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  char v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    objc_msgSend(v5, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "write:", CFSTR("== %@ xattrs ==\n"), v7);

    objc_msgSend(v6, "write:", CFSTR("=========================\n"));
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v5;
    objc_msgSend(v8, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v5, v9, 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v16, "lastPathComponent");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", CFSTR(".DS_Store"));

          if ((v18 & 1) == 0)
            +[FPDProvider dumpXattrsForItemAtURL:to:](FPDProvider, "dumpXattrsForItemAtURL:to:", v16, v6);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v13);
    }

    objc_msgSend(v6, "write:", CFSTR("\n"));
    v5 = v19;
  }

}

- (void)checkTCCAccessForDomainID:(id)a3 auditToken:(id *)a4 completionHandler:(id)a5
{
  (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, 1, 0);
}

- (void)dumpDomain:(id)a3 allowedToDump:(BOOL)a4 dumper:(id)a5 limitNumberOfItems:(BOOL)a6 request:(id)a7 completionHandler:(id)a8
{
  if (a4)
    objc_msgSend(a3, "dumpStateTo:limitNumberOfItems:request:completionHandler:", a5, a6, a7, a8);
  else
    (*((void (**)(id, _QWORD))a8 + 2))(a8, 0);
}

- (void)dumpAllDomains:(id)a3 domains:(id)a4 auditToken:(id *)a5 request:(id)a6 providerFilter:(id)a7 limitNumberOfItems:(BOOL)a8 completionHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(_QWORD);
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  _OWORD v34[2];
  _QWORD v35[4];
  id v36;
  FPDProvider *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void (**v43)(_QWORD);
  __int128 v44;
  __int128 v45;
  BOOL v46;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v19 = (void (**)(_QWORD))a9;
  if (objc_msgSend(v16, "count"))
  {
    objc_msgSend(v16, "firstObject");
    v32 = v18;
    v20 = a8;
    v21 = v15;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObjectAtIndex:", 0);
    v23 = (void *)MEMORY[0x1E0CB3940];
    -[FPDProvider identifier](self, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "identifier");
    v33 = v17;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "fp_providerDomainIDFromProviderID:domainIdentifier:", v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __109__FPDProvider_dumpAllDomains_domains_auditToken_request_providerFilter_limitNumberOfItems_completionHandler___block_invoke;
    v35[3] = &unk_1E8C77A10;
    v36 = v26;
    v37 = self;
    v38 = v22;
    v39 = v21;
    v46 = v20;
    v18 = v32;
    v40 = v33;
    v41 = v16;
    v27 = *(_OWORD *)&a5->var0[4];
    v44 = *(_OWORD *)a5->var0;
    v45 = v27;
    v42 = v32;
    v43 = v19;
    v28 = *(_OWORD *)&a5->var0[4];
    v34[0] = *(_OWORD *)a5->var0;
    v34[1] = v28;
    v29 = v22;
    v15 = v21;
    v30 = v29;
    v31 = v26;
    -[FPDProvider checkTCCAccessForDomainID:auditToken:completionHandler:](self, "checkTCCAccessForDomainID:auditToken:completionHandler:", v31, v34, v35);

    v17 = v33;
  }
  else
  {
    v19[2](v19);
  }

}

void __109__FPDProvider_dumpAllDomains_domains_auditToken_request_providerFilter_limitNumberOfItems_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  char v21;

  v5 = a3;
  if (v5)
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __109__FPDProvider_dumpAllDomains_domains_auditToken_request_providerFilter_limitNumberOfItems_completionHandler___block_invoke_cold_1(a1, v5, v6);

  }
  v7 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(unsigned __int8 *)(a1 + 128);
  v10 = *(void **)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 64);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __109__FPDProvider_dumpAllDomains_domains_auditToken_request_providerFilter_limitNumberOfItems_completionHandler___block_invoke_165;
  v13[3] = &unk_1E8C779E8;
  v13[4] = v7;
  v14 = v10;
  v15 = *(id *)(a1 + 72);
  v12 = *(_OWORD *)(a1 + 112);
  v19 = *(_OWORD *)(a1 + 96);
  v20 = v12;
  v16 = *(id *)(a1 + 64);
  v17 = *(id *)(a1 + 80);
  v21 = *(_BYTE *)(a1 + 128);
  v18 = *(id *)(a1 + 88);
  objc_msgSend(v7, "dumpDomain:allowedToDump:dumper:limitNumberOfItems:request:completionHandler:", v8, a2, v14, v9, v11, v13);

}

uint64_t __109__FPDProvider_dumpAllDomains_domains_auditToken_request_providerFilter_limitNumberOfItems_completionHandler___block_invoke_165(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  _OWORD v10[2];

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(unsigned __int8 *)(a1 + 112);
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 72);
  v8 = *(_OWORD *)(a1 + 96);
  v10[0] = *(_OWORD *)(a1 + 80);
  v10[1] = v8;
  return objc_msgSend(v2, "dumpAllDomains:domains:auditToken:request:providerFilter:limitNumberOfItems:completionHandler:", v1, v3, v10, v4, v6, v5, v7);
}

- (void)dumpStateTo:(id)a3 auditToken:(id *)a4 request:(id)a5 providerFilter:(id)a6 limitNumberOfItems:(BOOL)a7 completionHandler:(id)a8
{
  _BOOL4 v9;
  id v13;
  id v14;
  void (**v15)(_QWORD);
  FPDProvider *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  id v47;
  __int128 v48;
  void *v49;
  void *v50;
  _BOOL4 v51;
  void (**v52)(_QWORD);
  id v54;
  _OWORD v55[2];
  _QWORD v56[4];
  id v57;
  id v58;
  FPDProvider *v59;
  id v60;
  void (**v61)(_QWORD);
  _QWORD v62[5];
  id v63;
  _QWORD v64[4];
  id v65;

  v9 = a7;
  v13 = a3;
  v54 = a5;
  v14 = a6;
  v15 = (void (**)(_QWORD))a8;
  v16 = self;
  objc_sync_enter(v16);
  -[FPDProvider domainsByID](v16, "domainsByID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "allValues");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copy");

  objc_sync_exit(v16);
  v20 = objc_msgSend(v14, "length");
  v21 = MEMORY[0x1E0C809B0];
  if (v20)
  {
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __98__FPDProvider_dumpStateTo_auditToken_request_providerFilter_limitNumberOfItems_completionHandler___block_invoke;
    v64[3] = &unk_1E8C77A38;
    v65 = v14;
    objc_msgSend(v19, "fp_filter:", v64);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v22, "count"))
    {
      v15[2](v15);

      v49 = v54;
      goto LABEL_7;
    }
    v51 = v9;
    v23 = v14;
    v52 = v15;

  }
  else
  {
    v51 = v9;
    v23 = v14;
    v52 = v15;
    v22 = v19;
  }
  objc_msgSend(v13, "write:", CFSTR("=====================================================\n"));
  -[FPDProvider identifier](v16, "identifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "write:", CFSTR("%@\n"), v24);

  objc_msgSend(v13, "write:", CFSTR("=====================================================\n"));
  -[FPDProvider descriptor](v16, "descriptor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "extensionPointVersion");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDProvider dumpValue:forKey:to:](v16, "dumpValue:forKey:to:", v26, CFSTR("version"), v13);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v25, "isAvailableSystemWide"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDProvider dumpValue:forKey:to:](v16, "dumpValue:forKey:to:", v27, CFSTR("available system wide"), v13);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v25, "supportsEnumeration"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDProvider dumpValue:forKey:to:](v16, "dumpValue:forKey:to:", v28, CFSTR("supports enumeration"), v13);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FPDProvider supportsFPFS](v16, "supportsFPFS"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDProvider dumpValue:forKey:to:](v16, "dumpValue:forKey:to:", v29, CFSTR("supports FPFS"), v13);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v25, "readonly"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDProvider dumpValue:forKey:to:](v16, "dumpValue:forKey:to:", v30, CFSTR("read-only"), v13);

  -[FPDProvider extensionStorageURLs](v16, "extensionStorageURLs");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDProvider dumpValue:forKey:to:](v16, "dumpValue:forKey:to:", v31, CFSTR("extension storage URLs"), v13);

  -[FPDProvider purposeIdentifier](v16, "purposeIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDProvider dumpValue:forKey:to:](v16, "dumpValue:forKey:to:", v32, CFSTR("file coordination purpose ID"), v13);

  objc_msgSend(v25, "localizedName");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDProvider dumpValue:forKey:to:](v16, "dumpValue:forKey:to:", v33, CFSTR("display name"), v13);

  objc_msgSend(v25, "extensionBundleURL");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDProvider dumpValue:forKey:to:](v16, "dumpValue:forKey:to:", v34, CFSTR("bundle URL"), v13);

  objc_msgSend(v25, "topLevelBundleIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDProvider dumpValue:forKey:to:](v16, "dumpValue:forKey:to:", v35, CFSTR("containing bundle identifier"), v13);

  objc_msgSend(v25, "personaIdentifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDProvider dumpValue:forKey:to:](v16, "dumpValue:forKey:to:", v36, CFSTR("persona"), v13);

  objc_msgSend(v25, "documentGroupName");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDProvider dumpValue:forKey:to:](v16, "dumpValue:forKey:to:", v37, CFSTR("document group name"), v13);

  objc_msgSend(v25, "supportedFileTypes");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDProvider dumpValue:forKey:to:](v16, "dumpValue:forKey:to:", v38, CFSTR("supported file types"), v13);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v25, "usesUniqueItemIdentifiersAcrossDevices"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDProvider dumpValue:forKey:to:](v16, "dumpValue:forKey:to:", v39, CFSTR("uses unique item identifiers across devices"), v13);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v25, "appliesChangesAtomically"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDProvider dumpValue:forKey:to:](v16, "dumpValue:forKey:to:", v40, CFSTR("applies changes atomically"), v13);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v25, "disallowedByMDM"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDProvider dumpValue:forKey:to:](v16, "dumpValue:forKey:to:", v41, CFSTR("disallowed by MDM"), v13);

  -[FPDProvider manager](v16, "manager");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "pushConnection");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "topLevelBundleIdentifier");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "_debugTopicsForApplicationIdentifier:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = v21;
  v62[0] = v21;
  v62[1] = 3221225472;
  v62[2] = __98__FPDProvider_dumpStateTo_auditToken_request_providerFilter_limitNumberOfItems_completionHandler___block_invoke_2;
  v62[3] = &unk_1E8C77A60;
  v62[4] = v16;
  v46 = v13;
  v63 = v46;
  objc_msgSend(v44, "enumerateKeysAndObjectsUsingBlock:", v62);
  objc_msgSend(v46, "write:", CFSTR("\n"));
  v47 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v47, "addObjectsFromArray:", v22);
  v56[0] = v45;
  v56[1] = 3221225472;
  v56[2] = __98__FPDProvider_dumpStateTo_auditToken_request_providerFilter_limitNumberOfItems_completionHandler___block_invoke_3;
  v56[3] = &unk_1E8C75BD8;
  v57 = v46;
  v58 = v23;
  v59 = v16;
  v22 = v22;
  v60 = v22;
  v15 = v52;
  v61 = v52;
  v48 = *(_OWORD *)&a4->var0[4];
  v55[0] = *(_OWORD *)a4->var0;
  v55[1] = v48;
  v49 = v54;
  -[FPDProvider dumpAllDomains:domains:auditToken:request:providerFilter:limitNumberOfItems:completionHandler:](v16, "dumpAllDomains:domains:auditToken:request:providerFilter:limitNumberOfItems:completionHandler:", v57, v47, v55, v54, v58, v51, v56);

  v14 = v23;
LABEL_7:

}

uint64_t __98__FPDProvider_dumpStateTo_auditToken_request_providerFilter_limitNumberOfItems_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "providerDomainID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "localizedCaseInsensitiveContainsString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "nsDomain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "localizedCaseInsensitiveContainsString:", *(_QWORD *)(a1 + 32));

  }
  return v5;
}

void __98__FPDProvider_dumpStateTo_auditToken_request_providerFilter_limitNumberOfItems_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a3;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("push topics (%@)"), a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dumpValue:forKey:to:", v7, v8, *(_QWORD *)(a1 + 40));

}

uint64_t __98__FPDProvider_dumpStateTo_auditToken_request_providerFilter_limitNumberOfItems_completionHandler___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "write:", CFSTR("\n"));
  if (objc_msgSend(*(id *)(a1 + 40), "length"))
    objc_msgSend(*(id *)(a1 + 48), "dumpXattrsForDomains:dumper:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

+ (void)_garbageCollectFoldersWithNoRelatedDomain:(id)a3 supportDir:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[16];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v5;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v6;
  objc_msgSend(v6, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v7, 0, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v27;
    v13 = *MEMORY[0x1E0C999D0];
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v14);
        v25 = 0;
        objc_msgSend(v15, "getResourceValue:forKey:error:", &v25, v13, 0);
        v16 = v25;
        if (objc_msgSend(v16, "BOOLValue"))
        {
          objc_msgSend(v15, "fp_fpfsProviderDomainID:skipTypeCheck:error:", 0, 1, 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v17, "length"))
          {
            objc_msgSend(v17, "componentsSeparatedByString:", CFSTR("/"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectAtIndex:", 0);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v24, "containsObject:", v19) & 1) == 0)
            {
              fp_current_or_default_log();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                +[FPDProvider _garbageCollectFoldersWithNoRelatedDomain:supportDir:].cold.1((uint64_t)v30, (uint64_t)v15);

              objc_msgSend(v15, "path");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "removeItemAtPath:error:", v21, 0);

            }
          }

        }
        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v11);
  }

}

- (OS_dispatch_queue)presentersQueue
{
  return self->_presentersQueue;
}

- (NSSet)blockedProcessNames
{
  return self->_blockedProcessNames;
}

- (void)setBlockedProcessNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)supportURL
{
  return self->_supportURL;
}

- (NSURL)providerPlistURL
{
  return self->_providerPlistURL;
}

- (FPDServer)server
{
  return self->_server;
}

- (FPDExtensionManager)manager
{
  return self->_manager;
}

- (NSMutableDictionary)domainsByID
{
  return self->_domainsByID;
}

- (NSMutableDictionary)domainsByRootPath
{
  return self->_domainsByRootPath;
}

- (NSArray)requestedExtendedAttributes
{
  return self->_requestedExtendedAttributes;
}

- (void)setRequestedExtendedAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_requestedExtendedAttributes, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_requestedExtendedAttributes, 0);
  objc_storeStrong((id *)&self->_domainsByRootPath, 0);
  objc_storeStrong((id *)&self->_domainsByID, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_providerPlistURL, 0);
  objc_storeStrong((id *)&self->_supportURL, 0);
  objc_storeStrong((id *)&self->_blockedProcessNames, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_presentersQueue, 0);
  objc_storeStrong((id *)&self->_domainQueue, 0);
}

- (void)initWithDescriptor:(uint64_t)a3 server:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_10_2((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_10(&dword_1CF55F000, v6, v4, "[ERROR] Can't adopt persona %@: %@", v5);

  OUTLINED_FUNCTION_6_1();
}

+ (void)onDiskProvidersForServer:.cold.1()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_16();
  *v1 = 138412290;
  *v3 = v2;
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, v5, (uint64_t)v3, "[DEBUG] no root reachable for domain %@", v4);

  OUTLINED_FUNCTION_6_1();
}

- (void)_recreateDefaultDomainIfNeededOnVolume:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_20_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, v3, (uint64_t)v3, "[DEBUG] creating default domain for %@", v4);

  OUTLINED_FUNCTION_6_1();
}

- (void)_recreateDefaultDomainIfNeededOnVolume:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_20_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, v3, (uint64_t)v3, "[DEBUG] exposing default domain for %@", v4);

  OUTLINED_FUNCTION_6_1();
}

- (void)_recreateDefaultDomainIfNeededOnVolume:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_20_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, v3, (uint64_t)v3, "[DEBUG] hiding default domain for %@", v4);

  OUTLINED_FUNCTION_6_1();
}

+ (void)parseDomainProperties:(uint64_t)a1 descriptor:(uint64_t)a2 volume:replicatedByDefault:.cold.1(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_9_3(a1, a2), "fp_obfuscatedFilename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138543362;
  *v2 = v4;
  OUTLINED_FUNCTION_10_3(&dword_1CF55F000, v5, v6, "[ERROR] unhandled domain %{public}@ with missing properties");

  OUTLINED_FUNCTION_11_1();
}

+ (void)parseDomainProperties:(uint64_t)a1 descriptor:(uint64_t)a2 volume:replicatedByDefault:.cold.2(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_9_3(a1, a2), "fp_obfuscatedFilename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138543362;
  *v2 = v4;
  OUTLINED_FUNCTION_10_3(&dword_1CF55F000, v5, v6, "[ERROR] cannot parse nsDomain for domain %{public}@");

  OUTLINED_FUNCTION_11_1();
}

- (void)importDomainsFromLibrary:updatePlist:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_20_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_23(&dword_1CF55F000, v3, (uint64_t)v3, "[ERROR] could not load the domain properties: %{public}@", v4);

  OUTLINED_FUNCTION_6_1();
}

void __108__FPDProvider_addDomain_byImportingDirectoryAtURL_userAllowedDBDrop_knownFolders_request_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_10(&dword_1CF55F000, v0, (uint64_t)v0, "[ERROR] failed to clear import cookie for domain %@: %@", v1);
  OUTLINED_FUNCTION_8_0();
}

void __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CF55F000, log, OS_LOG_TYPE_ERROR, "[ERROR] Cannot use the default domain for the FPFS", v1, 2u);
  OUTLINED_FUNCTION_5();
}

void __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_5_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_23(&dword_1CF55F000, v0, v1, "[ERROR] Can't add domain %@ with external identifier to a default volume", v2);
  OUTLINED_FUNCTION_8_0();
}

void __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_cold_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_10_2(a1, (uint64_t)a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_10(&dword_1CF55F000, v6, v4, "[ERROR] Unable to resolve library to setup domain at path %@: %@", v5);

  OUTLINED_FUNCTION_6_1();
}

void __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_cold_4()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_1();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_10(&dword_1CF55F000, v1, (uint64_t)v1, "[ERROR] Can't add domain %@ on non-default volume %@: not supported", v2);
  OUTLINED_FUNCTION_8_0();
}

void __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_5_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, v0, v1, "[DEBUG] domain %@ already exists", v2);
  OUTLINED_FUNCTION_8_0();
}

void __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  os_log_t v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;

  OUTLINED_FUNCTION_5_4(*MEMORY[0x1E0C80C00]);
  LODWORD(v0) = *(unsigned __int8 *)(v0 + 24);
  v2 = *(unsigned __int8 *)(*(_QWORD *)v1 + 24);
  v4[0] = 67109376;
  v4[1] = v0;
  v5 = 1024;
  v6 = v2;
  _os_log_debug_impl(&dword_1CF55F000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] inheriting userEnable=%{BOOL}d hiddenByUser=%{BOOL}d from default domain", (uint8_t *)v4, 0xEu);
  OUTLINED_FUNCTION_8_0();
}

void __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_cold_7(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(*(SEL *)(a1 + 88));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1CF55F000, v2, v3, "[ERROR] %@ called on already invalidated provider", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

void __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_79_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, v0, v1, "[DEBUG] creating domain as userEnabled because the provider already has one enabled domain: %@", v2);
  OUTLINED_FUNCTION_8_0();
}

void __150__FPDProvider_addDomain_byImportingDirectoryAtURL_knownFolders_userAllowedDBDrop_unableToStartup_startupError_reloadDomain_request_completionHandler___block_invoke_81_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, v0, v1, "[DEBUG] creating domain as not hiddenByUser because the provider already has one visible domain: %@", v2);
  OUTLINED_FUNCTION_8_0();
}

void __60__FPDProvider_removeAllDomainsForRequest_completionHandler___block_invoke_cold_3(uint64_t a1)
{
  const char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = (const char *)OUTLINED_FUNCTION_17_0(a1);
  NSStringFromSelector(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1CF55F000, v3, v4, "[ERROR] %@ called on already invalidated provider", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

void __59__FPDProvider_removeDomain_mode_request_completionHandler___block_invoke_cold_2(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] removing last domain, marking defaultDomain as userEnabled=%{BOOL}d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_5();
}

void __59__FPDProvider_removeDomain_mode_request_completionHandler___block_invoke_cold_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(*(SEL *)(a1 + 64));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1CF55F000, v2, v3, "[ERROR] %@ called on already invalidated provider", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

void __75__FPDProvider_reloadDomain_unableToStartup_startupError_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "fp_prettyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_10(&dword_1CF55F000, a3, v6, "[ERROR] reactivation of domain %@ failed: %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_2();
}

void __96__FPDProvider__setEnabledOrHiddenByUser_forDomainIdentifier_newValue_request_completionHandler___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1CF55F000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Not signaling domainDisabled as resolved, the backend does not respond", v1, 2u);
  OUTLINED_FUNCTION_5();
}

void __96__FPDProvider__setEnabledOrHiddenByUser_forDomainIdentifier_newValue_request_completionHandler___block_invoke_cold_2(uint64_t a1)
{
  const char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = (const char *)OUTLINED_FUNCTION_17_0(a1);
  NSStringFromSelector(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1CF55F000, v3, v4, "[ERROR] %@ called on already invalidated provider", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

void __96__FPDProvider__setEnabledOrHiddenByUser_forDomainIdentifier_newValue_request_completionHandler___block_invoke_133_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_23(&dword_1CF55F000, v0, v1, "[ERROR] error signaling error resolved during domain enablement transition: %@", v2);
  OUTLINED_FUNCTION_8_0();
}

void __66__FPDProvider_setEjectable_forDomainIdentifier_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = 67109378;
  v4[1] = v2;
  v5 = 2112;
  v6 = v3;
  _os_log_debug_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] setting ejectable=%{BOOL}d for domain %@", (uint8_t *)v4, 0x12u);
  OUTLINED_FUNCTION_8_0();
}

void __66__FPDProvider_setEjectable_forDomainIdentifier_completionHandler___block_invoke_cold_2(uint64_t a1)
{
  const char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = (const char *)OUTLINED_FUNCTION_17_0(a1);
  NSStringFromSelector(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1CF55F000, v3, v4, "[ERROR] %@ called on already invalidated provider", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

void __71__FPDProvider_setDomainUserInfo_forDomainIdentifier_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, v0, v1, "[DEBUG] setting domainUserInfo for domain %@", v2);
  OUTLINED_FUNCTION_8_0();
}

void __71__FPDProvider_setDomainUserInfo_forDomainIdentifier_completionHandler___block_invoke_cold_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(*(SEL *)(a1 + 64));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1CF55F000, v2, v3, "[ERROR] %@ called on already invalidated provider", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

void __79__FPDProvider_setReplicatedKnownFolders_forDomainIdentifier_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, v0, v1, "[DEBUG] setting replicatedKnownFolders for domain %@", v2);
  OUTLINED_FUNCTION_8_0();
}

void __79__FPDProvider_setReplicatedKnownFolders_forDomainIdentifier_completionHandler___block_invoke_cold_2(uint64_t a1)
{
  const char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = (const char *)OUTLINED_FUNCTION_17_0(a1);
  NSStringFromSelector(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1CF55F000, v3, v4, "[ERROR] %@ called on already invalidated provider", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

void __109__FPDProvider_dumpAllDomains_domains_auditToken_request_providerFilter_limitNumberOfItems_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "fp_obfuscatedProviderDomainID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "fp_prettyDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = v5;
  v10 = 2112;
  v11 = v6;
  OUTLINED_FUNCTION_10(&dword_1CF55F000, a3, v7, "[ERROR] TCC access check failed for domain %{public}@ error: %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_2();
}

+ (void)_garbageCollectFoldersWithNoRelatedDomain:(uint64_t)a1 supportDir:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _QWORD *v3;
  uint8_t *v4;
  void *v5;

  objc_msgSend((id)OUTLINED_FUNCTION_9_3(a1, a2), "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v4 = 138412290;
  *v3 = v5;
  _os_log_debug_impl(&dword_1CF55F000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] No provider for %@, deleting directory", v4, 0xCu);

  OUTLINED_FUNCTION_11_1();
}

@end
