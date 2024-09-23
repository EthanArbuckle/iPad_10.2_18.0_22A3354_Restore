@implementation ISStaticResources

+ (id)sharedInstance
{
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, &__block_literal_global_1);
  return (id)sharedInstance_sharedInstance;
}

void __35__ISStaticResources_sharedInstance__block_invoke()
{
  ISStaticResources *v0;
  void *v1;

  v0 = objc_alloc_init(ISStaticResources);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (ISStaticResources)init
{
  ISStaticResources *v2;
  NSCache *v3;
  NSCache *cache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ISStaticResources;
  v2 = -[ISStaticResources init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    cache = v2->_cache;
    v2->_cache = v3;

  }
  return v2;
}

- (id)fallbackResourceForHint:(id)a3 descriptor:(id)a4 referenceObj:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  NSObject *v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "shape") == 5 || objc_msgSend(v9, "shape") == 6)
  {
    _ISDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[ISStaticResources fallbackResourceForHint:descriptor:referenceObj:].cold.1();

    -[ISStaticResources genericAppClipIconResource](self, "genericAppClipIconResource");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _ISDefaultLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[ISStaticResources fallbackResourceForHint:descriptor:referenceObj:].cold.2();

    +[ISPlatformInfo sharedInstance](ISPlatformInfo, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISStaticResources genericAppIconResourceForPlatform:](self, "genericAppIconResourceForPlatform:", objc_msgSend(v16, "nativePlatform"));
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v12;
      objc_msgSend(v12, "setAppearance:", objc_msgSend(v9, "appearance"));

    }
  }
  if (!v12)
  {
    _ISDefaultLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      v17 = 138412802;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      v21 = 2112;
      v22 = v10;
      _os_log_fault_impl(&dword_1AA928000, v13, OS_LOG_TYPE_FAULT, "Failed to resolve a fallback resource. Hint: %@, Descriptor: %@, Icon: %@", (uint8_t *)&v17, 0x20u);
    }

  }
  return v12;
}

- (id)_assetCatalogResourceWithName:(id)a3 fromURL:(id)a4 cacheKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[ISStaticResources cache](self, "cache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v16 = 0;
    +[ISAssetCatalogResource assetCatalogResourceWithURL:imageName:error:](ISAssetCatalogResource, "assetCatalogResourceWithURL:imageName:error:", v9, v8, &v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v16;
    if (v12)
    {
      -[ISStaticResources cache](self, "cache");
      v14 = objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKey:](v14, "setObject:forKey:", v12, v10);
    }
    else
    {
      _ISDefaultLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[ISStaticResources _assetCatalogResourceWithName:fromURL:cacheKey:].cold.1((uint64_t)v10, v13, v14);
    }

  }
  return v12;
}

- (void)_addStaticImage:(id)a3 withKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ISStaticResources cache](self, "cache");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

- (id)_findStaticImageWithKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ISStaticResources cache](self, "cache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)genericAppIconResource
{
  void *v3;
  void *v4;

  +[ISPlatformInfo sharedInstance](ISPlatformInfo, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISStaticResources genericAppIconResourceForPlatform:](self, "genericAppIconResourceForPlatform:", objc_msgSend(v3, "nativePlatform"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)genericAppIconResourceForPlatform:(unint64_t)a3
{
  int64_t v3;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v13;
  void *v14;
  const __CFString *v15;

  v3 = a3;
  if (!a3)
  {
    +[ISPlatformInfo sharedInstance](ISPlatformInfo, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "nativePlatform");

  }
  if (v3 > 7)
  {
    switch(v3)
    {
      case 8:
        objc_msgSend(MEMORY[0x1E0D3A798], "iconsetResourceBundle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x1E0D3A7C8];
        v15 = CFSTR("NanoDefaultIcon");
        break;
      case 16:
        objc_msgSend(MEMORY[0x1E0D3A798], "iconsetResourceBundle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x1E0D3A7C8];
        v15 = CFSTR("VisionDefaultIcon");
        break;
      case 32:
LABEL_9:
        objc_msgSend(MEMORY[0x1E0D3A798], "iconsetResourceBundle");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "assetCatalogURL");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = CFSTR("GenericAppIcon_iOS");
        goto LABEL_10;
      default:
        goto LABEL_12;
    }
    objc_msgSend(v14, "imageBagWithResourcesNamed:fromBundle:", v15, v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return v10;
  }
  if ((unint64_t)(v3 - 1) < 2)
  {
    objc_msgSend(MEMORY[0x1E0D3A798], "iconFoundationFrameworkBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assetCatalogURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = CFSTR("com.apple.application-bundle");
LABEL_10:
    -[ISStaticResources _assetCatalogResourceWithName:fromURL:cacheKey:](self, "_assetCatalogResourceWithName:fromURL:cacheKey:", v8, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return v10;
  }
  if (v3 == 4)
    goto LABEL_9;
LABEL_12:
  _ISDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[ISStaticResources genericAppIconResourceForPlatform:].cold.1(v3, v11);

  return 0;
}

- (id)genericAppClipIconResource
{
  void *v2;
  void *v3;
  NSObject *v4;

  objc_msgSend(MEMORY[0x1E0D3A798], "iconsetResourceBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D3A7C8], "imageBagWithResourcesNamed:fromBundle:", CFSTR("AppClipDefaultIcon"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    _ISDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[ISStaticResources genericAppClipIconResource].cold.1(v4);

  }
  return v3;
}

- (id)defaultMacFolderResource
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D3A798], "iconFoundationFrameworkBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetCatalogURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ISStaticResources _assetCatalogResourceWithName:fromURL:cacheKey:](self, "_assetCatalogResourceWithName:fromURL:cacheKey:", CFSTR("Folder"), v4, CFSTR("defaultMacFolder"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)defaultMacDarkFolderResource
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D3A798], "iconFoundationFrameworkBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetCatalogURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ISStaticResources _assetCatalogResourceWithName:fromURL:cacheKey:](self, "_assetCatalogResourceWithName:fromURL:cacheKey:", CFSTR("FolderDark"), v4, CFSTR("defaultMacDarkFolder"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)defaultMacDataResource
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D3A798], "iconsetResourceBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetCatalogURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ISStaticResources _assetCatalogResourceWithName:fromURL:cacheKey:](self, "_assetCatalogResourceWithName:fromURL:cacheKey:", CFSTR("public.data"), v4, CFSTR("defaultMacData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)defaultMacUnknownFSObjectResource
{
  return 0;
}

- (id)_fileExtensionAndUTIToAssetNameMap
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[ISStaticResources cache](self, "cache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("StaticAssetNameMaps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0D3A798], "iconsetResourceBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLForResource:withExtension:", CFSTR("StaticAssetsInfo"), CFSTR("plist"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[ISStaticResources cache](self, "cache");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v4, CFSTR("StaticAssetNameMaps"));

    }
  }
  return v4;
}

- (id)resourceForKnownFileTypesFromHint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[ISStaticResources _fileExtensionAndUTIToAssetNameMap](self, "_fileExtensionAndUTIToAssetNameMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("ExtensionToUTI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (!v7)
    v7 = v4;
  -[ISStaticResources _fileExtensionAndUTIToAssetNameMap](self, "_fileExtensionAndUTIToAssetNameMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("UTIToAssetName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0D3A798], "iconsetResourceBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assetCatalogURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[ISStaticResources _assetCatalogResourceWithName:fromURL:cacheKey:](self, "_assetCatalogResourceWithName:fromURL:cacheKey:", v10, v12, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSCache)cache
{
  return (NSCache *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDictionary)_fileResourcesAssetNameMaps
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)set_fileResourcesAssetNameMaps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__fileResourcesAssetNameMaps, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

- (void)fallbackResourceForHint:descriptor:referenceObj:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AA928000, v0, v1, "%@ RETURNING AppClip PLACEHOLDER: %@");
  OUTLINED_FUNCTION_2();
}

- (void)fallbackResourceForHint:descriptor:referenceObj:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AA928000, v0, v1, "%@ RETURNING App PLACEHOLDER: %@");
  OUTLINED_FUNCTION_2();
}

- (void)_assetCatalogResourceWithName:(uint64_t)a1 fromURL:(void *)a2 cacheKey:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1AA928000, a3, OS_LOG_TYPE_ERROR, "Failed to retrieve %@ resource. Error: %@", (uint8_t *)&v6, 0x16u);

}

- (void)genericAppIconResourceForPlatform:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1AA928000, a2, OS_LOG_TYPE_ERROR, "Failed to retrieve default app icon resource for platform: %lu", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)genericAppClipIconResource
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AA928000, log, OS_LOG_TYPE_ERROR, "Failed to retrieve default app clip icon assets", v1, 2u);
}

@end
