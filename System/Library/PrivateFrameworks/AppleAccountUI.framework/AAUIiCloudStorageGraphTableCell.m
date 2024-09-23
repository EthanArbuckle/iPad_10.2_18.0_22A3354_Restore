@implementation AAUIiCloudStorageGraphTableCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[16];

  v4 = a3;
  _AAUILogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "Refreshing AAUIiCloudStorageGraphTableCell", buf, 2u);
  }

  -[AAUIiCloudStorageGraphTableCell _loadingStringForSpecifier:](self, "_loadingStringForSpecifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v6, *MEMORY[0x1E0D80760]);

  -[AAUIiCloudStorageGraphTableCell _psCapacityBarDataForSpecifier:](self, "_psCapacityBarDataForSpecifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v7, *MEMORY[0x1E0D80750]);

  objc_msgSend(v4, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80770]);
  objc_msgSend(v4, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v8, *MEMORY[0x1E0D80978]);

  objc_msgSend(v4, "propertyForKey:", CFSTR("AAUIiCloudGraphBarBackgroundColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[AAUIiCloudStorageGraphTableCell _setConditionalSpecifier:property:forKey:](self, "_setConditionalSpecifier:property:forKey:", v4, v9, *MEMORY[0x1E0D80748]);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemMidGrayColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIiCloudStorageGraphTableCell _setConditionalSpecifier:property:forKey:](self, "_setConditionalSpecifier:property:forKey:", v4, v10, *MEMORY[0x1E0D80758]);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIiCloudStorageGraphTableCell _setConditionalSpecifier:property:forKey:](self, "_setConditionalSpecifier:property:forKey:", v4, v11, *MEMORY[0x1E0D80778]);

    -[AAUIiCloudStorageGraphTableCell _setConditionalSpecifier:property:forKey:](self, "_setConditionalSpecifier:property:forKey:", v4, v9, *MEMORY[0x1E0D80768]);
  }
  v12.receiver = self;
  v12.super_class = (Class)AAUIiCloudStorageGraphTableCell;
  -[PSCapacityBarCell refreshCellContentsWithSpecifier:](&v12, sel_refreshCellContentsWithSpecifier_, v4);

}

- (id)_loadingStringForSpecifier:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  int v10;
  __CFString *v11;

  v3 = a3;
  objc_msgSend(v3, "propertyForKey:", CFSTR("AAUIiCloudLoadingRequest"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("LOADING");
  }
  else
  {
    objc_msgSend(v3, "propertyForKey:", CFSTR("AAUIiCloudQuotaFailedToLoad"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    if (!v10)
    {
      v11 = CFSTR(" ");
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("UNABLE_TO_LOAD_CLOUD_STORAGE");
  }
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1EA2E2A18, CFSTR("Localizable"));
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v11;
}

- (void)_setConditionalSpecifier:(id)a3 property:(id)a4 forKey:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v10, "propertyForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    objc_msgSend(v10, "setProperty:forKey:", v7, v8);

}

- (id)_psCapacityBarDataForSpecifier:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D80480]);
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "propertyForKey:", CFSTR("AAUIiCloudUsedBytes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "propertyForKey:", CFSTR("AAUIiCloudGraphQuotaTotal"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "iCloud Storage - bytes used: %@ of total: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_msgSend(v4, "propertyForKey:", CFSTR("AAUIiCloudGraphQuotaTotal"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCapacity:", objc_msgSend(v9, "longLongValue"));

  objc_msgSend(v4, "propertyForKey:", CFSTR("AAUIiCloudUsedBytes"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBytesUsed:", objc_msgSend(v10, "longLongValue"));

  -[AAUIiCloudStorageGraphTableCell _catagoriesForSpecifer:](self, "_catagoriesForSpecifer:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCategories:", v11);

  return v5;
}

- (id)_catagoriesForSpecifer:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "propertyForKey:", CFSTR("AAUIiCloudGraphUsage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "capacityBarCatagory");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  v11 = (void *)objc_msgSend(v4, "copy");

  return v11;
}

@end
