@implementation BRWatchingConfiguration

- (BRWatchingConfiguration)initWithScopes:(id)a3 predicate:(id)a4
{
  id v6;
  id v7;
  BRWatchingConfiguration *v8;
  BRWatchingConfiguration *v9;
  NSMutableArray *v10;
  NSMutableArray *appLibraryIDs;
  NSMutableArray *v12;
  NSMutableArray *urls;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *gatherPrefix;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  BRWatchingConfiguration *v30;
  uint64_t v31;
  uint64_t v33;
  id v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v40.receiver = self;
  v40.super_class = (Class)BRWatchingConfiguration;
  v8 = -[BRWatchingConfiguration init](&v40, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_30;
  v35 = v7;
  v8->_watchTypes = 0;
  v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  appLibraryIDs = v9->_appLibraryIDs;
  v9->_appLibraryIDs = v10;

  v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  urls = v9->_urls;
  v9->_urls = v12;

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = v6;
  v14 = v6;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (!v15)
    goto LABEL_21;
  v16 = v15;
  v17 = *(_QWORD *)v37;
  v18 = *MEMORY[0x1E0CB2E58];
  v19 = *MEMORY[0x1E0CB2E60];
  v20 = *MEMORY[0x1E0CB2E30];
  while (2)
  {
    v21 = 0;
    do
    {
      if (*(_QWORD *)v37 != v17)
        objc_enumerationMutation(v14);
      v22 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v21);
      if (objc_msgSend(v22, "isEqual:", v18, v34))
      {
        v23 = v9->_watchTypes | 4;
LABEL_15:
        v9->_watchTypes = v23;
        goto LABEL_16;
      }
      if (objc_msgSend(v22, "isEqual:", v19))
      {
        v23 = v9->_watchTypes | 8;
        goto LABEL_15;
      }
      if (objc_msgSend(v22, "isEqual:", v20))
      {
        v23 = v9->_watchTypes | 0x20;
        goto LABEL_15;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[NSMutableArray addObject:](v9->_urls, "addObject:", v22);
        v23 = 2;
        goto LABEL_15;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        brc_bread_crumbs((uint64_t)"-[BRWatchingConfiguration initWithScopes:predicate:]", 123);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(0);
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
          -[BRWatchingConfiguration initWithScopes:predicate:].cold.1((uint64_t)v22);

        v30 = 0;
        v6 = v34;
        v7 = v35;
        goto LABEL_31;
      }
      -[NSMutableArray addObject:](v9->_appLibraryIDs, "addObject:", v22);
LABEL_16:
      ++v21;
    }
    while (v16 != v21);
    v24 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    v16 = v24;
    if (v24)
      continue;
    break;
  }
LABEL_21:

  v7 = v35;
  objc_msgSend(v35, "br_watchedURL");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    gatherPrefix = (void *)v25;
    -[NSMutableArray addObject:](v9->_urls, "addObject:", v25);
    v27 = 1;
    goto LABEL_28;
  }
  objc_msgSend(v35, "br_urlWithWatchedChildren");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    gatherPrefix = (void *)v31;
    -[NSMutableArray addObject:](v9->_urls, "addObject:", v31);
    v27 = 2;
LABEL_28:
    v9->_watchTypes = v27;
  }
  else if ((v9->_watchTypes & 8) != 0)
  {
    objc_msgSend(v35, "extractSearchTermFromPredicate");
    v33 = objc_claimAutoreleasedReturnValue();
    gatherPrefix = v9->_gatherPrefix;
    v9->_gatherPrefix = (NSString *)v33;
  }
  else
  {
    gatherPrefix = v9->_gatherPrefix;
    v9->_gatherPrefix = 0;
  }
  v6 = v34;

LABEL_30:
  v30 = v9;
LABEL_31:

  return v30;
}

- (id)appLibraryIDToURLMapOfSuppliedAppIDs
{
  BRWatchingConfiguration *v2;
  NSDictionary *appLibraryIDToURLMapOfSuppliedAppIDs;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSDictionary *v18;
  BRWatchingConfiguration *v20;
  NSMutableArray *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v2 = self;
  v34 = *MEMORY[0x1E0C80C00];
  appLibraryIDToURLMapOfSuppliedAppIDs = self->_appLibraryIDToURLMapOfSuppliedAppIDs;
  if (!appLibraryIDToURLMapOfSuppliedAppIDs || !-[NSDictionary count](appLibraryIDToURLMapOfSuppliedAppIDs, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSMutableArray count](v2->_appLibraryIDs, "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v20 = v2;
    v5 = v2->_appLibraryIDs;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v24;
      v21 = v5;
      v22 = v4;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v24 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v9);
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "URLForUbiquityContainerIdentifier:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          brc_bread_crumbs((uint64_t)"-[BRWatchingConfiguration appLibraryIDToURLMapOfSuppliedAppIDs]", 148);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log(1);
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v12, "path");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "fp_obfuscatedPath");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v28 = v10;
            v29 = 2112;
            v30 = v16;
            v31 = 2112;
            v32 = v13;
            _os_log_debug_impl(&dword_19CBF0000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] BRItemCollectionGatherer - appLibrary %@ with url %@%@", buf, 0x20u);

            v5 = v21;
            v4 = v22;
          }

          if (v12)
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
      }
      while (v7);
    }

    v17 = objc_msgSend(v4, "copy");
    v2 = v20;
    v18 = v20->_appLibraryIDToURLMapOfSuppliedAppIDs;
    v20->_appLibraryIDToURLMapOfSuppliedAppIDs = (NSDictionary *)v17;

  }
  return v2->_appLibraryIDToURLMapOfSuppliedAppIDs;
}

- (id)appLibraryIDToURLMapOfSuppliedURLs
{
  NSDictionary *appLibraryIDToURLMapOfSuppliedURLs;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSDictionary *v19;
  BRWatchingConfiguration *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  appLibraryIDToURLMapOfSuppliedURLs = self->_appLibraryIDToURLMapOfSuppliedURLs;
  if (!appLibraryIDToURLMapOfSuppliedURLs)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSMutableArray count](self->_urls, "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v21 = self;
    v5 = self->_urls;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v24;
      v9 = 0x1E0CB3000uLL;
      v22 = v4;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v24 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v10), "br_containerID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            objc_msgSend(*(id *)(v9 + 1568), "defaultManager");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "URLForUbiquityContainerIdentifier:", v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            brc_bread_crumbs((uint64_t)"-[BRWatchingConfiguration appLibraryIDToURLMapOfSuppliedURLs]", 174);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log(1);
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v13, "path");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "fp_obfuscatedPath");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v28 = v11;
              v29 = 2112;
              v30 = v17;
              v31 = 2112;
              v32 = v14;
              _os_log_debug_impl(&dword_19CBF0000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] BRItemCollectionGatherer - appLibrary %@ with url %@%@", buf, 0x20u);

              v9 = 0x1E0CB3000;
              v4 = v22;
            }

            if (v13)
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v11);

          }
          ++v10;
        }
        while (v7 != v10);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
      }
      while (v7);
    }

    v18 = objc_msgSend(v4, "copy");
    v19 = v21->_appLibraryIDToURLMapOfSuppliedURLs;
    v21->_appLibraryIDToURLMapOfSuppliedURLs = (NSDictionary *)v18;

    appLibraryIDToURLMapOfSuppliedURLs = v21->_appLibraryIDToURLMapOfSuppliedURLs;
  }
  return appLibraryIDToURLMapOfSuppliedURLs;
}

- (unint64_t)watchTypes
{
  return self->_watchTypes;
}

- (NSArray)appLibraryIDs
{
  return &self->_appLibraryIDs->super;
}

- (NSArray)urls
{
  return &self->_urls->super;
}

- (NSString)gatherPrefix
{
  return self->_gatherPrefix;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trashItemID, 0);
  objc_storeStrong((id *)&self->_appLibraryIDToURLMapOfSuppliedURLs, 0);
  objc_storeStrong((id *)&self->_appLibraryIDToURLMapOfSuppliedAppIDs, 0);
  objc_storeStrong((id *)&self->_gatherPrefix, 0);
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong((id *)&self->_appLibraryIDs, 0);
}

- (void)initWithScopes:(uint64_t)a1 predicate:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_19CBF0000, v1, v2, "[ERROR] Unable to understand scope: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

@end
