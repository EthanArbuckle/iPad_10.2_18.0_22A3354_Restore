@implementation ISAssetCatalogResource

+ (id)coreGlyphsCatalog
{
  if (coreGlyphsCatalog_onceToken != -1)
    dispatch_once(&coreGlyphsCatalog_onceToken, &__block_literal_global_2);
  return (id)coreGlyphsCatalog_catalog;
}

void __43__ISAssetCatalogResource_coreGlyphsCatalog__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D1A6A8], "_IS_coreGlyphsBundleURL");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1A6A8], "_IS_assetCatalogURLWithBundleURL:", v3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1A6A8]), "initWithURL:error:", v0, 0);
  v2 = (void *)coreGlyphsCatalog_catalog;
  coreGlyphsCatalog_catalog = v1;

}

+ (id)assetCatalogResourceWithURL:(id)a3 imageName:(id)a4 error:(id *)a5
{
  return +[ISAssetCatalogResource assetCatalogResourceWithURL:imageName:symbolName:platform:error:](ISAssetCatalogResource, "assetCatalogResourceWithURL:imageName:symbolName:platform:error:", a3, a4, 0, 0, a5);
}

+ (id)assetCatalogResourceWithURL:(id)a3 imageName:(id)a4 platform:(unint64_t)a5 error:(id *)a6
{
  return +[ISAssetCatalogResource assetCatalogResourceWithURL:imageName:symbolName:platform:error:](ISAssetCatalogResource, "assetCatalogResourceWithURL:imageName:symbolName:platform:error:", a3, a4, 0, a5, a6);
}

+ (id)assetCatalogResourceWithURL:(id)a3 symbolName:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0D1A6A8], "_IS_coreGlyphsBundleURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1A6A8], "_IS_assetCatalogURLWithBundleURL:", v9);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  +[ISAssetCatalogResource assetCatalogResourceWithURL:imageName:symbolName:platform:error:](ISAssetCatalogResource, "assetCatalogResourceWithURL:imageName:symbolName:platform:error:", v7, 0, v8, 0, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)assetCatalogResourceWithURL:(id)a3 imageName:(id)a4 symbolName:(id)a5 platform:(unint64_t)a6 error:(id *)a7
{
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  ISAssetCatalogResource *v17;
  NSObject *v19;
  void *v20;
  char v21;
  int v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  char v30;
  NSObject *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  unint64_t v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = (uint64_t)a4;
  v13 = (unint64_t)a5;
  v14 = v13;
  if (!v11 || !(v12 | v13))
  {
    if (a7)
    {
      v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
      *a7 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, MEMORY[0x1E0C9AA70]);
    }
    _ISDefaultLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
    {
      if (a7)
        v24 = *a7;
      else
        v24 = 0;
      *(_DWORD *)buf = 138413058;
      v36 = v11;
      v37 = 2112;
      v38 = v12;
      v39 = 2112;
      v40 = v14;
      v41 = 2112;
      v42 = v24;
      _os_log_error_impl(&dword_1AA928000, (os_log_t)v16, OS_LOG_TYPE_ERROR, "Unable to find asset in %@ with name i:%@ s:%@. Error: %@", buf, 0x2Au);
    }
    goto LABEL_6;
  }
  v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1A6A8]), "initWithURL:error:", v11, a7);
  if (!(v14 | v16))
  {
    _ISDefaultLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      +[ISAssetCatalogResource assetCatalogResourceWithURL:imageName:symbolName:platform:error:].cold.1((uint64_t)v11, (uint64_t *)a7, v19);

    goto LABEL_6;
  }
  if (v12)
  {
    +[ISPlatformInfo sharedInstance](ISPlatformInfo, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v20, "supportsRequestingLayerStacksForPlatform:", a6) & 1) != 0)
    {
      v21 = objc_msgSend((id)v16, "_IS_possibleLayerStackExistsWithName:platform:", v12, a6);

      if ((v21 & 1) != 0)
        goto LABEL_38;
    }
    else
    {

    }
    +[ISPlatformInfo sharedInstance](ISPlatformInfo, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "supportsRequestingMultisizedImagesForPlatform:", a6))
      v22 = objc_msgSend((id)v16, "_IS_possibleMultisizedImageExistsWithName:platform:", v12, a6);
    else
      v22 = 0;

  }
  else
  {
    v22 = 0;
  }
  if (v14 && !v22)
    v22 = objc_msgSend((id)v16, "imageExistsWithName:", v14);
  if (v12 && (v22 & 1) == 0)
  {
    objc_msgSend((id)v12, "stringByAppendingPathComponent:", CFSTR("image_"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v16, "allImageNames");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __90__ISAssetCatalogResource_assetCatalogResourceWithURL_imageName_symbolName_platform_error___block_invoke;
    v33[3] = &unk_1E58007B8;
    v34 = v25;
    v27 = v25;
    v28 = objc_msgSend(v26, "indexOfObjectPassingTest:", v33);

    v22 = v28 != 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v14 && !v22)
  {
    +[ISAssetCatalogResource coreGlyphsCatalog](ISAssetCatalogResource, "coreGlyphsCatalog");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "imageExistsWithName:", v14);

    if ((v30 & 1) == 0)
      goto LABEL_33;
LABEL_38:
    v17 = -[ISAssetCatalogResource initWithCatalog:imageName:symbolName:platform:]([ISAssetCatalogResource alloc], "initWithCatalog:imageName:symbolName:platform:", v16, v12, v14, a6);
    goto LABEL_7;
  }
  if ((v22 & 1) != 0)
    goto LABEL_38;
LABEL_33:
  _ISDefaultLog();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    +[ISAssetCatalogResource assetCatalogResourceWithURL:imageName:symbolName:platform:error:].cold.2(v12, (uint64_t)v11, v31);

  if (a7)
  {
    v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v17 = 0;
    *a7 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -2582, MEMORY[0x1E0C9AA70]);
    goto LABEL_7;
  }
LABEL_6:
  v17 = 0;
LABEL_7:

  return v17;
}

uint64_t __90__ISAssetCatalogResource_assetCatalogResourceWithURL_imageName_symbolName_platform_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "hasPrefix:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    *a4 = 1;
  return result;
}

- (ISAssetCatalogResource)initWithCatalog:(id)a3 imageName:(id)a4 symbolName:(id)a5 platform:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  ISAssetCatalogResource *v14;
  ISAssetCatalogResource *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ISAssetCatalogResource;
  v14 = -[ISAssetCatalogResource init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_imageName, a4);
    objc_storeStrong((id *)&v15->_symbolName, a5);
    objc_storeStrong((id *)&v15->_catalog, a3);
    v15->_disableSubtype = 0;
    v15->_layoutDirection = 5;
    v15->_platform = a6;
    v15->_appearance = 0;
  }

  return v15;
}

- (id)imageWithName:(id)a3 scale:(double)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;

  -[CUICatalog imageWithName:scaleFactor:](self->_catalog, "imageWithName:scaleFactor:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "image");
    CGImageSetProperty();
    v7 = objc_alloc(MEMORY[0x1E0D3A7C0]);
    objc_msgSend(v5, "scale");
    v8 = (void *)objc_msgSend(v7, "initWithCGImage:scale:", v6);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)_layoutDirectionFromDevice
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(MEMORY[0x1E0C99DC8], "_deviceLanguage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "characterDirectionForLanguage:", v3);

  if (v4 == 1)
    return 5;
  else
    return 4 * (v4 == 2);
}

- (IFImageBag)imageBag
{
  IFImageBag *imageBag;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  IFImageBag *v16;
  IFImageBag *v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  imageBag = self->_imageBag;
  if (!imageBag)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringByAppendingPathComponent:](self->_imageName, "stringByAppendingPathComponent:", CFSTR("image"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUICatalog allImageNames](self->_catalog, "allImageNames");
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if (objc_msgSend(v10, "hasPrefix:", v5))
          {
            objc_msgSend(v10, "imageMetadataFromFileName");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "objectForKeyedSubscript:", kIconCompilerImageInfoNameKey);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v12, "isEqualToString:", v5) & 1) != 0
              || objc_msgSend(v12, "isEqualToString:", self->_imageName))
            {
              -[ISAssetCatalogResource imageWithName:scale:](self, "imageWithName:scale:", v10, 1.0);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (v13)
                objc_msgSend(v4, "addObject:", v13);

              -[ISAssetCatalogResource imageWithName:scale:](self, "imageWithName:scale:", v10, 2.0);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (v14)
                objc_msgSend(v4, "addObject:", v14);

              -[ISAssetCatalogResource imageWithName:scale:](self, "imageWithName:scale:", v10, 3.0);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (v15)
                objc_msgSend(v4, "addObject:", v15);

            }
          }
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v7);
    }
    if (objc_msgSend(v4, "count"))
    {
      v16 = (IFImageBag *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7C8]), "initWithImages:", v4);
      v17 = self->_imageBag;
      self->_imageBag = v16;

    }
    imageBag = self->_imageBag;
  }
  return imageBag;
}

- (id)imageForSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  void *v16;
  int v17;
  CUICatalog *catalog;
  void *v19;
  double v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  NSString *imageName;
  NSString *v29;
  NSString *v30;
  int v31;
  NSString *v32;
  __int16 v33;
  double v34;
  __int16 v35;
  double v36;
  __int16 v37;
  double v38;
  uint64_t v39;

  height = a3.height;
  width = a3.width;
  v39 = *MEMORY[0x1E0C80C00];
  +[ISPlatformInfo sharedInstance](ISPlatformInfo, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "supportsRequestingLayerStacksForPlatform:", -[ISAssetCatalogResource platform](self, "platform"));

  if (v9)
  {
    -[ISAssetCatalogResource catalog](self, "catalog");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISAssetCatalogResource imageName](self, "imageName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_IS_layerStackWithName:scale:layoutDirection:platform:", v11, -[ISAssetCatalogResource layoutDirection](self, "layoutDirection"), -[ISAssetCatalogResource platform](self, "platform"), a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = objc_msgSend(v12, "flattenedImage");
      v14 = 0;
      v15 = a4;
      goto LABEL_7;
    }
  }
  +[ISPlatformInfo sharedInstance](ISPlatformInfo, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "supportsRequestingMultisizedImagesForPlatform:", -[ISAssetCatalogResource platform](self, "platform"));

  if (v17)
  {
    catalog = self->_catalog;
    -[ISAssetCatalogResource imageName](self, "imageName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUICatalog _IS_multisizedImageWithName:size:scale:layoutDirection:platform:appearance:](catalog, "_IS_multisizedImageWithName:size:scale:layoutDirection:platform:appearance:", v19, -[ISAssetCatalogResource layoutDirection](self, "layoutDirection"), -[ISAssetCatalogResource platform](self, "platform"), -[ISAssetCatalogResource catalogAppearance](self, "catalogAppearance"), width, height, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v13 = objc_msgSend(v14, "image");
      objc_msgSend(v14, "scale");
      v15 = v20;
      v12 = 0;
LABEL_7:
      CGImageSetProperty();
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7C0]), "initWithCGImage:scale:", v13, v15);
      if (v21)
        goto LABEL_23;
      goto LABEL_11;
    }
    v12 = 0;
  }
  else
  {
    v12 = 0;
    v14 = 0;
  }
LABEL_11:
  if (!self->_imageName)
    goto LABEL_26;
  _ISDefaultLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    imageName = self->_imageName;
    v31 = 138413058;
    v32 = imageName;
    v33 = 2048;
    v34 = width;
    v35 = 2048;
    v36 = width;
    v37 = 2048;
    v38 = a4;
    _os_log_debug_impl(&dword_1AA928000, v22, OS_LOG_TYPE_DEBUG, "Unable to find icon image named: %@ for size: (%f,%f) scale:(%lf). Looking for resources matching the iconset naming convention.", (uint8_t *)&v31, 0x2Au);
  }

  -[ISAssetCatalogResource imageBag](self, "imageBag");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "imageForSize:scale:", width, height, a4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    if (!self->_symbolName)
      goto LABEL_20;
LABEL_26:
    _ISDefaultLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v29 = self->_imageName;
      v31 = 138413058;
      v32 = v29;
      v33 = 2048;
      v34 = width;
      v35 = 2048;
      v36 = width;
      v37 = 2048;
      v38 = a4;
      _os_log_debug_impl(&dword_1AA928000, v24, OS_LOG_TYPE_DEBUG, "Unable to find resources matching the iconset naming convention with base name: %@ for size: (%f,%f) scale:(%lf). Looking for a symbol.", (uint8_t *)&v31, 0x2Au);
    }

    -[ISAssetCatalogResource symbolImageForSize:scale:](self, "symbolImageForSize:scale:", width, height, a4);
    v25 = objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v21 = (void *)v25;
    }
    else
    {
LABEL_20:
      _ISDefaultLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v30 = self->_imageName;
        v31 = 138413058;
        v32 = v30;
        v33 = 2048;
        v34 = width;
        v35 = 2048;
        v36 = width;
        v37 = 2048;
        v38 = a4;
        _os_log_error_impl(&dword_1AA928000, v26, OS_LOG_TYPE_ERROR, "Failed to find a icon resources with named: %@ for size: (%f,%f) scale:(%lf)", (uint8_t *)&v31, 0x2Au);
      }

      v21 = 0;
    }
  }
LABEL_23:

  return v21;
}

- (BOOL)isPrecomposed
{
  return 0;
}

- (BOOL)hasResourceWithAppearance:(int64_t)a3 appearanceString:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  char v13;

  v6 = a4;
  -[ISAssetCatalogResource catalog](self, "catalog");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISAssetCatalogResource imageName](self, "imageName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ISAssetCatalogResource layoutDirection](self, "layoutDirection");
  v10 = -[ISAssetCatalogResource platform](self, "platform");
  objc_msgSend(v7, "_IS_multisizedImageWithName:size:scale:layoutDirection:platform:appearance:", v8, v9, v10, a3, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "appearance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", v6);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)hasResourceWithAppearance:(int64_t)a3
{
  void *v5;
  BOOL v6;

  objc_msgSend(MEMORY[0x1E0D1A6A8], "_IS_appearanceStringFromAppearance:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = -[ISAssetCatalogResource hasResourceWithAppearance:appearanceString:](self, "hasResourceWithAppearance:appearanceString:", a3, v5);
  else
    v6 = 0;

  return v6;
}

- (BOOL)hasDarkResource
{
  return -[ISAssetCatalogResource hasResourceWithAppearance:](self, "hasResourceWithAppearance:", 1);
}

- (BOOL)hasTintableResource
{
  return -[ISAssetCatalogResource hasResourceWithAppearance:](self, "hasResourceWithAppearance:", 2);
}

- (CUICatalog)catalog
{
  return (CUICatalog *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)imageName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)symbolName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(int64_t)a3
{
  self->_layoutDirection = a3;
}

- (BOOL)disableSubtype
{
  return self->_disableSubtype;
}

- (void)setDisableSubtype:(BOOL)a3
{
  self->_disableSubtype = a3;
}

- (unint64_t)platform
{
  return self->_platform;
}

- (int64_t)appearance
{
  return self->_appearance;
}

- (void)setAppearance:(int64_t)a3
{
  self->_appearance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_catalog, 0);
  objc_storeStrong((id *)&self->_imageBag, 0);
}

- (id)symbolImageForSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  void *v8;
  CUICatalog *catalog;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const void *v15;
  id v16;
  void *v17;

  height = a3.height;
  width = a3.width;
  -[ISAssetCatalogResource symbolName](self, "symbolName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    catalog = self->_catalog;
    -[ISAssetCatalogResource symbolName](self, "symbolName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUICatalog namedVectorGlyphWithName:scaleFactor:deviceIdiom:layoutDirection:glyphSize:glyphWeight:glyphPointSize:appearanceName:](catalog, "namedVectorGlyphWithName:scaleFactor:deviceIdiom:layoutDirection:glyphSize:glyphWeight:glyphPointSize:appearanceName:", v10, 0, 0, 2, 4, 0, a4, 17.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      +[ISAssetCatalogResource coreGlyphsCatalog](ISAssetCatalogResource, "coreGlyphsCatalog");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISAssetCatalogResource symbolName](self, "symbolName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "namedVectorGlyphWithName:scaleFactor:deviceIdiom:layoutDirection:glyphSize:glyphWeight:glyphPointSize:appearanceName:", v13, 0, 0, 2, 4, 0, a4, 17.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
        goto LABEL_7;
    }
    v14 = objc_msgSend(v11, "rasterizeImageUsingScaleFactor:forTargetSize:", a4, width, height);
    if (v14)
    {
      v15 = (const void *)v14;
      v16 = objc_alloc(MEMORY[0x1E0D3A7C0]);
      objc_msgSend(v11, "scale");
      v17 = (void *)objc_msgSend(v16, "initWithCGImage:scale:", v15);
      CFRelease(v15);
    }
    else
    {
LABEL_7:
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }
  return v17;
}

- (id)symbolImageForFontSize:(double)a3 scale:(double)a4 symbolSize:(unint64_t)a5 symbolWeight:(int64_t)a6
{
  unint64_t v9;
  int64_t v10;
  CUICatalog *catalog;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  if (a5)
    v9 = a5;
  else
    v9 = 2;
  if (a6)
    v10 = a6;
  else
    v10 = 4;
  catalog = self->_catalog;
  -[ISAssetCatalogResource symbolName](self, "symbolName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUICatalog namedVectorGlyphWithName:scaleFactor:deviceIdiom:layoutDirection:glyphSize:glyphWeight:glyphPointSize:appearanceName:](catalog, "namedVectorGlyphWithName:scaleFactor:deviceIdiom:layoutDirection:glyphSize:glyphWeight:glyphPointSize:appearanceName:", v12, 0, 0, v9, v10, 0, a4, a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    goto LABEL_9;
  +[ISAssetCatalogResource coreGlyphsCatalog](ISAssetCatalogResource, "coreGlyphsCatalog");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISAssetCatalogResource symbolName](self, "symbolName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "namedVectorGlyphWithName:scaleFactor:deviceIdiom:layoutDirection:glyphSize:glyphWeight:glyphPointSize:appearanceName:", v15, 0, 0, v9, v10, 0, a4, a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
LABEL_9:
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7F0]), "initWithNamedVectorGlyph:", v13);
  else
    v16 = 0;

  return v16;
}

+ (void)assetCatalogResourceWithURL:(os_log_t)log imageName:symbolName:platform:error:.cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a2)
    v3 = *a2;
  else
    v3 = 0;
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_1AA928000, log, OS_LOG_TYPE_ERROR, "Unable to open asset catalog with URL: %@ error: %@.", (uint8_t *)&v4, 0x16u);
}

+ (void)assetCatalogResourceWithURL:(os_log_t)log imageName:symbolName:platform:error:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_1AA928000, log, OS_LOG_TYPE_DEBUG, "Unable to find image with name %@ in catalog at URL: %@.", (uint8_t *)&v3, 0x16u);
}

@end
