@implementation ATXWidgetsAndFoldersConfigurationProvider

- (ATXWidgetsAndFoldersConfigurationProvider)init
{
  ATXWidgetsAndFoldersConfigurationProvider *v2;
  ATXHomeScreenConfigCache *v3;
  ATXHomeScreenConfigCache *cache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXWidgetsAndFoldersConfigurationProvider;
  v2 = -[ATXWidgetsAndFoldersConfigurationProvider init](&v6, sel_init);
  if (v2)
  {
    v3 = (ATXHomeScreenConfigCache *)objc_alloc_init(MEMORY[0x1E0CF8E58]);
    cache = v2->_cache;
    v2->_cache = v3;

  }
  return v2;
}

- (void)cacheHomeScreenConfigurationsIfNecessary
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "ATXWidgetsAndFoldersConfigurations: could not fetch home page configurations with error: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t __85__ATXWidgetsAndFoldersConfigurationProvider_cacheHomeScreenConfigurationsIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)homePageFolderCountBucket
{
  -[ATXWidgetsAndFoldersConfigurationProvider cacheHomeScreenConfigurationsIfNecessary](self, "cacheHomeScreenConfigurationsIfNecessary");
  if (-[NSArray count](self->_homePageFolders, "count") <= 0xA)
    return -[NSArray count](self->_homePageFolders, "count");
  else
    return 10;
}

- (unint64_t)homePageWidgetCountBucket
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  -[ATXWidgetsAndFoldersConfigurationProvider cacheHomeScreenConfigurationsIfNecessary](self, "cacheHomeScreenConfigurationsIfNecessary");
  -[NSArray firstObject](self->_pages, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stacks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") > 0xA)
  {
    v7 = 10;
  }
  else
  {
    -[NSArray firstObject](self->_pages, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stacks");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

  }
  return v7;
}

- (unint64_t)globalAllPagesFolderCount
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[ATXWidgetsAndFoldersConfigurationProvider cacheHomeScreenConfigurationsIfNecessary](self, "cacheHomeScreenConfigurationsIfNecessary");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_pages;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "leafIcons", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_pas_filteredArrayWithTest:", &__block_literal_global_9_4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v6 += objc_msgSend(v10, "count");

      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __70__ATXWidgetsAndFoldersConfigurationProvider_globalAllPagesFolderCount__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)globalAllPagesWidgetCount
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[ATXWidgetsAndFoldersConfigurationProvider cacheHomeScreenConfigurationsIfNecessary](self, "cacheHomeScreenConfigurationsIfNecessary");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_pages;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "stacks", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v6 += objc_msgSend(v9, "count");

      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homePageFolders, 0);
  objc_storeStrong((id *)&self->_pages, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
