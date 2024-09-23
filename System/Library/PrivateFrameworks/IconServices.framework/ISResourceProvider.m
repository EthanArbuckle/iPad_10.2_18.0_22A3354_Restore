@implementation ISResourceProvider

+ (ISResourceProvider)resourceProviderWithRecord:(id)a3 options:(unint64_t)a4
{
  id v5;
  ISRecordResourceProvider *v6;

  v5 = a3;
  v6 = -[ISRecordResourceProvider initWithRecord:options:]([ISRecordResourceProvider alloc], "initWithRecord:options:", v5, a4);

  return (ISResourceProvider *)v6;
}

+ (ISResourceProvider)resourceProviderWithTypeIdentifier:(id)a3 options:(unint64_t)a4
{
  return 0;
}

- (ISResourceProvider)init
{
  ISResourceProvider *v2;
  uint64_t v3;
  NSMutableDictionary *resourcesByResourceKey;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ISResourceProvider;
  v2 = -[ISResourceProvider init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    resourcesByResourceKey = v2->_resourcesByResourceKey;
    v2->_resourcesByResourceKey = (NSMutableDictionary *)v3;

    v2->_resourceType = 0;
    v2->_isGenericProvider = 0;
    +[ISPlatformInfo sharedInstance](ISPlatformInfo, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_platform = objc_msgSend(v5, "nativePlatform");

    *(_WORD *)&v2->_allowNonDefaultAppearances = 256;
  }
  return v2;
}

- (ISResourceProvider)initWithResource:(id)a3 templateResource:(id)a4
{
  id v6;
  id v7;
  ISResourceProvider *v8;
  ISResourceProvider *v9;
  NSData *resourceToken;

  v6 = a3;
  v7 = a4;
  v8 = -[ISResourceProvider init](self, "init");
  v9 = v8;
  if (v8)
  {
    -[ISResourceProvider setIconResource:](v8, "setIconResource:", v6);
    objc_storeStrong((id *)&v9->_templateIconResource, a4);
    resourceToken = v9->_resourceToken;
    v9->_resourceToken = 0;

  }
  return v9;
}

- (ISResourceProvider)initWithResources:(id)a3
{
  id v4;
  ISResourceProvider *v5;
  ISResourceProvider *v6;
  NSData *resourceToken;

  v4 = a3;
  v5 = -[ISResourceProvider init](self, "init");
  v6 = v5;
  if (v5)
  {
    -[NSMutableDictionary addEntriesFromDictionary:](v5->_resourcesByResourceKey, "addEntriesFromDictionary:", v4);
    resourceToken = v6->_resourceToken;
    v6->_resourceToken = 0;

  }
  return v6;
}

- (void)setIconResource:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_resourcesByResourceKey, "setObject:forKeyedSubscript:", a3, CFSTR("kISPrimaryResourceKey"));
}

- (ISCompositorResource)iconResource
{
  return (ISCompositorResource *)-[NSMutableDictionary objectForKeyedSubscript:](self->_resourcesByResourceKey, "objectForKeyedSubscript:", CFSTR("kISPrimaryResourceKey"));
}

- (void)setBadgeResource:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_resourcesByResourceKey, "setObject:forKeyedSubscript:", a3, CFSTR("kISBadgeResourceKey"));
}

- (ISCompositorResource)badgeResource
{
  return (ISCompositorResource *)-[NSMutableDictionary objectForKeyedSubscript:](self->_resourcesByResourceKey, "objectForKeyedSubscript:", CFSTR("kISBadgeResourceKey"));
}

- (id)resourceNamed:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_resourcesByResourceKey, "objectForKeyedSubscript:", a3);
}

- (NSData)validationToken
{
  void *v3;
  void *v4;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_resourceToken)
  {
    v8 = 0;
    v6 = 0u;
    v7 = 0u;
    -[NSUUID getUUIDBytes:](self->_lsDatabaseUUID, "getUUIDBytes:", &v6);
    *(_QWORD *)&v7 = self->_lsDatabaseSequenceNumber;
    objc_msgSend(MEMORY[0x1E0CB3A28], "_IF_UUIDWithData:", self->_resourceToken);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "getUUIDBytes:", (char *)&v7 + 8);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v6, 40);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSData *)v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "_is_validToken");
    return (NSData *)(id)objc_claimAutoreleasedReturnValue();
  }
}

- (IFSymbol)symbol
{
  return 0;
}

- (BOOL)_isAppleResource
{
  return 0;
}

- (BOOL)_findBadgeResourceWithIconDictionary:(id)a3 bundle:(id)a4 record:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _BOOL4 v17;
  NSObject *v18;
  ISPersona *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v32[0] = CFSTR("UTTypeIconBadgeName");
  v32[1] = CFSTR("UTTypeGlyphName");
  v10 = (void *)MEMORY[0x1E0C99D20];
  v11 = a3;
  objc_msgSend(v10, "arrayWithObjects:count:", v32, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_IF_stringForKeys:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    LOBYTE(v17) = 0;
    if (!v9)
      goto LABEL_15;
    goto LABEL_9;
  }
  objc_msgSend(v8, "assetCatalogURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  +[ISAssetCatalogResource assetCatalogResourceWithURL:imageName:platform:error:](ISAssetCatalogResource, "assetCatalogResourceWithURL:imageName:platform:error:", v14, v13, objc_msgSend(v8, "platform"), &v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v25;

  LOBYTE(v17) = v15 != 0;
  if (v15)
  {
    -[ISResourceProvider resourcesByResourceKey](self, "resourcesByResourceKey");
    v18 = objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v15, CFSTR("kISBadgeResourceKey"));
  }
  else
  {
    _ISDefaultLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v8, "bundleURL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v27 = v24;
      v28 = 2112;
      v29 = v13;
      v30 = 2112;
      v31 = v16;
      _os_log_debug_impl(&dword_1AA928000, v18, OS_LOG_TYPE_DEBUG, "Failed to find badge resource: %@ : %@ with error: %@", buf, 0x20u);

    }
  }

  if (v9)
  {
LABEL_9:
    if (!v17)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = -[ISPersona initWithRecord:]([ISPersona alloc], "initWithRecord:", v9);
        v17 = -[ISPersona isEnterprisePersona](v19, "isEnterprisePersona");
        if (v17)
        {
          -[ISPersona resourceBadge](v19, "resourceBadge");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[ISResourceProvider resourcesByResourceKey](self, "resourcesByResourceKey");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, CFSTR("kISBadgeResourceKey"));

          v22 = (void *)objc_opt_new();
          -[ISResourceProvider setSuggestedRecipe:](self, "setSuggestedRecipe:", v22);

        }
      }
      else
      {
        LOBYTE(v17) = 0;
      }
    }
  }
LABEL_15:

  return v17;
}

- (BOOL)_findBackgroundResourceWithIconDictionary:(id)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  BOOL v14;
  NSObject *v15;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v25[0] = CFSTR("UTTypeIconBackgroundName");
  v25[1] = CFSTR("CFBundleIconBackgroundName");
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = a3;
  objc_msgSend(v7, "arrayWithObjects:count:", v25, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_IF_stringForKeys:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "assetCatalogURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    +[ISAssetCatalogResource assetCatalogResourceWithURL:imageName:platform:error:](ISAssetCatalogResource, "assetCatalogResourceWithURL:imageName:platform:error:", v11, v10, objc_msgSend(v6, "platform"), &v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v18;

    v14 = v12 != 0;
    if (v12)
    {
      -[ISResourceProvider resourcesByResourceKey](self, "resourcesByResourceKey");
      v15 = objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v12, CFSTR("kISBackgroundResourceKey"));
    }
    else
    {
      _ISDefaultLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v6, "bundleURL");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v20 = v17;
        v21 = 2112;
        v22 = v10;
        v23 = 2112;
        v24 = v13;
        _os_log_debug_impl(&dword_1AA928000, v15, OS_LOG_TYPE_DEBUG, "Failed to find background resource: %@ : %@ with error: %@", buf, 0x20u);

      }
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)_findCustomRecipeWithIconDictionary:(id)a3 bundle:(id)a4
{
  return 0;
}

- (BOOL)_findTextResourceWithIconDictionary:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("UTTypeIconText");
  v11[1] = CFSTR("CFBundleIconText");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", v11, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_IF_stringForKeys:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "uppercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISResourceProvider resourcesByResourceKey](self, "resourcesByResourceKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("kISTextResourceKey"));

  }
  return v7 != 0;
}

- (void)setPlatformWithBundle:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "platform"))
  {
    -[ISResourceProvider setPlatform:](self, "setPlatform:", objc_msgSend(v5, "platform"));
  }
  else
  {
    +[ISPlatformInfo sharedInstance](ISPlatformInfo, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISResourceProvider setPlatform:](self, "setPlatform:", objc_msgSend(v4, "nativePlatform"));

  }
}

- (void)configureProviderFromDescriptor:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  -[ISResourceProvider resolveIconResource](self, "resolveIconResource");
  -[ISResourceProvider iconResource](self, "iconResource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (objc_msgSend(v6, "layoutDirection") == 4 && -[ISResourceProvider _isAppleResource](self, "_isAppleResource"))
      objc_msgSend(v5, "setLayoutDirection:", 4);
    if (-[ISResourceProvider allowNonDefaultAppearances](self, "allowNonDefaultAppearances"))
      objc_msgSend(v5, "setAppearance:", objc_msgSend(v6, "appearance"));

  }
}

- (void)resolveIconResource
{
  void *v3;
  NSObject *v4;
  int v5;
  ISResourceProvider *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[ISResourceProvider iconResource](self, "iconResource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    _ISDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = 138412290;
      v6 = self;
      _os_log_impl(&dword_1AA928000, v4, OS_LOG_TYPE_INFO, "Failed to resolve an icon resource for %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (unint64_t)lsDatabaseSequenceNumber
{
  return self->_lsDatabaseSequenceNumber;
}

- (void)setLsDatabaseSequenceNumber:(unint64_t)a3
{
  self->_lsDatabaseSequenceNumber = a3;
}

- (NSUUID)lsDatabaseUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLsDatabaseUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSData)resourceToken
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setResourceToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSArray)sourceRecordIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSourceRecordIdentifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (ISCompositorResource)templateIconResource
{
  return (ISCompositorResource *)objc_getProperty(self, a2, 48, 1);
}

- (NSDictionary)decorationResources
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDecorationResources:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)isGenericProvider
{
  return self->_isGenericProvider;
}

- (void)setIsGenericProvider:(BOOL)a3
{
  self->_isGenericProvider = a3;
}

- (BOOL)placeholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(BOOL)a3
{
  self->_placeholder = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (ISCompositorRecipe)suggestedRecipe
{
  return (ISCompositorRecipe *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSuggestedRecipe:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (unint64_t)platform
{
  return self->_platform;
}

- (void)setPlatform:(unint64_t)a3
{
  self->_platform = a3;
}

- (unint64_t)resourceType
{
  return self->_resourceType;
}

- (void)setResourceType:(unint64_t)a3
{
  self->_resourceType = a3;
}

- (BOOL)allowNonDefaultAppearances
{
  return self->_allowNonDefaultAppearances;
}

- (void)setAllowNonDefaultAppearances:(BOOL)a3
{
  self->_allowNonDefaultAppearances = a3;
}

- (BOOL)allowAlterationsToResourceArt
{
  return self->_allowAlterationsToResourceArt;
}

- (void)setAllowAlterationsToResourceArt:(BOOL)a3
{
  self->_allowAlterationsToResourceArt = a3;
}

- (NSMutableDictionary)resourcesByResourceKey
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (ISCustomRecipe)customRecipe
{
  return (ISCustomRecipe *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCustomRecipe:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (BOOL)resolved
{
  return self->_resolved;
}

- (void)setResolved:(BOOL)a3
{
  self->_resolved = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customRecipe, 0);
  objc_storeStrong((id *)&self->_resourcesByResourceKey, 0);
  objc_storeStrong((id *)&self->_suggestedRecipe, 0);
  objc_storeStrong((id *)&self->_decorationResources, 0);
  objc_storeStrong((id *)&self->_templateIconResource, 0);
  objc_storeStrong((id *)&self->_sourceRecordIdentifiers, 0);
  objc_storeStrong((id *)&self->_resourceToken, 0);
  objc_storeStrong((id *)&self->_lsDatabaseUUID, 0);
}

+ (id)resourceWithRecord:(id)a3 options:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v5 = a3;
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "iconDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "count"))
    {
      v9 = 0;
LABEL_16:

      goto LABEL_17;
    }
    if ((a4 & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "declaringBundleRecord");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "URL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v5, "iconResourceBundleURL");
        v10 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          v8 = 0;
          goto LABEL_15;
        }
        objc_msgSend(v5, "URL");
        v10 = objc_claimAutoreleasedReturnValue();
      }
      v8 = (void *)v10;
    }
LABEL_15:
    +[ISResourceProvider resourceWithBundleURL:iconDictionary:options:](ISResourceProvider, "resourceWithBundleURL:iconDictionary:options:", v8, v6, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_16;
  }
  v9 = 0;
LABEL_17:

  return v9;
}

+ (id)resourceWithBundleURL:(id)a3 iconDictionary:(id)a4 options:(unint64_t)a5
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v46;
  unint64_t v47;
  id v48;
  uint64_t v49;
  _QWORD v50[2];
  uint8_t buf[4];
  id v52;
  __int16 v53;
  id v54;
  __int16 v55;
  unint64_t v56;
  _QWORD v57[2];
  _QWORD v58[5];

  v58[4] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "_IF_dictionaryForKey:", 0x1E58028D8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    +[ISGraphicSymbolResource graphicSymbolResourceWithRecipe:url:](ISGraphicSymbolResource, "graphicSymbolResourceWithRecipe:url:", v9, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      v12 = 0;
LABEL_56:

      goto LABEL_57;
    }
  }
  v58[0] = CFSTR("CFBundleIconName");
  v58[1] = CFSTR("UTTypeIconName");
  v58[2] = CFSTR("UTTypeGlyphName");
  v58[3] = CFSTR("CFBundleGlyphName");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_IF_stringForKeys:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A798]), "initWithURL:", v7);
    objc_msgSend(v12, "assetCatalogURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0;
    +[ISAssetCatalogResource assetCatalogResourceWithURL:imageName:platform:error:](ISAssetCatalogResource, "assetCatalogResourceWithURL:imageName:platform:error:", v15, v14, objc_msgSend(v12, "platform"), &v49);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "isPrecomposed");

      goto LABEL_56;
    }

  }
  else
  {
    v12 = 0;
  }
  v57[0] = CFSTR("CFBundleIconFile");
  v57[1] = CFSTR("UTTypeIconFile");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_IF_stringForKeys:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17
    && (objc_msgSend(v17, "pathExtension"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("icns")),
        v18,
        (v19 & 1) == 0))
  {
    v47 = a5;
    if (!v12)
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A798]), "initWithURL:", v7);
    objc_msgSend(v12, "assetCatalogURL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0;
    +[ISAssetCatalogResource assetCatalogResourceWithURL:imageName:platform:error:](ISAssetCatalogResource, "assetCatalogResourceWithURL:imageName:platform:error:", v27, v17, objc_msgSend(v12, "platform"), &v48);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v48;

    if (v11)
    {
      objc_msgSend(v11, "isPrecomposed");
    }
    else
    {
      _ISDefaultLog();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v52 = v7;
        v53 = 2112;
        v54 = v17;
        v55 = 2112;
        v56 = (unint64_t)v28;
        _os_log_debug_impl(&dword_1AA928000, v44, OS_LOG_TYPE_DEBUG, "Failed to find resource: %@ : %@ with error: %@", buf, 0x20u);
      }

    }
    a5 = v47;
    if (v11)
      goto LABEL_56;
  }
  else
  {

  }
  v50[0] = CFSTR("CFBundleIconFile");
  v50[1] = CFSTR("UTTypeIconFile");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_IF_stringForKeys:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
    goto LABEL_14;
  objc_msgSend(v21, "pathExtension");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "length");

  if (v23)
    goto LABEL_14;
  if (!v12)
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A798]), "initWithURL:", v7);
  objc_msgSend(v12, "URLForResource:withExtension:", v21, CFSTR("pdf"));
  v30 = objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v31 = (void *)v30;
    v32 = a5;
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7D0]), "initWithURL:", v30);
    objc_msgSend(v33, "firstPage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    a5 = v32;
    if (v11)
      goto LABEL_56;
  }
  else
  {
LABEL_14:

  }
  objc_msgSend(v8, "_IF_arrayForKey:", CFSTR("CFBundleIconFiles"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v24, "count"))
  {
    objc_msgSend(v8, "_IF_arrayForKey:", CFSTR("UTTypeIconFiles"));
    v29 = objc_claimAutoreleasedReturnValue();

    v24 = (void *)v29;
    if (v12)
      goto LABEL_17;
LABEL_30:
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A798]), "initWithURL:", v7);
    goto LABEL_17;
  }
  if (!v12)
    goto LABEL_30;
LABEL_17:
  if (objc_msgSend(v24, "count") && v12)
  {
    objc_msgSend(MEMORY[0x1E0D3A7C8], "imageBagWithResourcesNames:fromBundle:", v24, v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      goto LABEL_56;
  }
  else
  {

  }
  objc_msgSend(v8, "_IF_stringForKey:", CFSTR("CFBundleIconFile"));
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  if (v12)
  {
    if (!v25)
      goto LABEL_38;
  }
  else
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A798]), "initWithURL:", v7);
    if (!v26)
      goto LABEL_38;
  }
  objc_msgSend(v26, "stringByDeletingPathExtension");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D3A7C8], "imageBagWithResourcesNamed:fromBundle:", v34, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    goto LABEL_56;
LABEL_38:
  v35 = a5;
  objc_msgSend(v8, "_IF_stringForKey:", CFSTR("CFBundleIconFile"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A798]), "initWithURL:", v7);
  objc_msgSend(v36, "stringByDeletingPathExtension");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "pathExtension");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (v37
    && objc_msgSend(v38, "length")
    && (objc_msgSend(v12, "URLForResource:withExtension:", v37, v39), (v40 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v41 = (void *)v40;
    objc_msgSend(MEMORY[0x1E0D3A7C0], "imageWithContentsOfURL:", v40);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  if (v11)
    goto LABEL_56;
  if (!v12)
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A798]), "initWithURL:", v7);
  v42 = (void *)MEMORY[0x1E0D3A7C8];
  legacyResourceNames();
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "imageBagWithResourcesNames:fromBundle:", v43, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    _ISDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "path");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v52 = v46;
      v53 = 2112;
      v54 = v8;
      v55 = 2048;
      v56 = v35;
      _os_log_error_impl(&dword_1AA928000, v9, OS_LOG_TYPE_ERROR, "Failed to find resource for %@. IconDictionary: %@ - %lu", buf, 0x20u);

    }
    v11 = 0;
    goto LABEL_56;
  }
LABEL_57:

  return v11;
}

+ (id)resourceWithTypeIdentifier:(id)a3 options:(unint64_t)a4
{
  return 0;
}

+ (id)resourceWithTypeCode:(unsigned int)a3 options:(unint64_t)a4
{
  return 0;
}

+ (id)defaultAppIconResourceProvider
{
  void *v2;
  void *v3;
  ISResourceProvider *v4;

  +[ISStaticResources sharedInstance](ISStaticResources, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "genericAppIconResource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[ISResourceProvider initWithResource:templateResource:]([ISResourceProvider alloc], "initWithResource:templateResource:", v3, 0);
  -[ISResourceProvider setResourceType:](v4, "setResourceType:", 1);
  -[ISResourceProvider setIsGenericProvider:](v4, "setIsGenericProvider:", 1);
  -[ISResourceProvider setAllowNonDefaultAppearances:](v4, "setAllowNonDefaultAppearances:", 1);
  -[ISResourceProvider setAllowAlterationsToResourceArt:](v4, "setAllowAlterationsToResourceArt:", 1);

  return v4;
}

- (BOOL)isPrecomposed
{
  void *v2;
  char v3;

  -[ISResourceProvider iconResource](self, "iconResource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = objc_msgSend(v2, "isPrecomposed");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = 0;
    }
    else
    {
      objc_opt_class();
      v3 = objc_opt_isKindOfClass() ^ 1;
    }
  }

  return v3 & 1;
}

- (BOOL)isDocumentBadge
{
  return (-[ISResourceProvider options](self, "options") & 3) != 0;
}

@end
