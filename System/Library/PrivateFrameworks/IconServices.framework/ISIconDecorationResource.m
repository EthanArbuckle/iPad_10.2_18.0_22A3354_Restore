@implementation ISIconDecorationResource

- (ISIconDecorationResource)initWithDecoration:(id)a3
{
  id v5;
  ISIconDecorationResource *v6;
  ISIconDecorationResource *v7;
  NSObject *v8;
  objc_super v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ISIconDecorationResource;
  v6 = -[ISIconDecorationResource init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_decoration, a3);
    if (-[ISIconDecoration identifierKind](v7->_decoration, "identifierKind") == 2)
    {
      -[ISIconDecoration identifier](v7->_decoration, "identifier");
      v8 = objc_claimAutoreleasedReturnValue();
      -[ISIconDecorationResource configureWithType:](v7, "configureWithType:", v8);
    }
    else
    {
      _ISDefaultLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v5;
        _os_log_impl(&dword_1AA928000, v8, OS_LOG_TYPE_DEFAULT, "Invalid decoration %@. Badging with app an icon is not currently supported.", buf, 0xCu);
      }
    }

  }
  return v7;
}

- (void)configureWithType:(id)a3
{
  NSObject *v4;
  __CFString *v5;
  int v6;
  void *v7;
  NSObject *v8;
  __CFString *v9;
  CFURLRef v10;
  __CFBundle *Unique;
  __CFBundle *v12;
  NSObject *v13;
  ISScalableCompositorResource *v14;
  id v15;
  ISScalableCompositorResource *internalResource;
  NSObject *v17;
  __CFString *v18;
  int v19;
  NSObject *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  NSObject *v24;
  __int16 v25;
  NSObject *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ISIconDecoration identifier](self->_decoration, "identifier");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = UTTypeConformsTo(v5, CFSTR("com.apple.icon-decoration"));

  if (v6)
  {
    -[ISIconDecoration identifier](self->_decoration, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = _UTTypeCopyGlyphName();

    if (!v8)
    {
      -[ISIconDecoration identifier](self->_decoration, "identifier");
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v19 = UTTypeConformsTo(v18, CFSTR("com.apple.icon-decoration.system"));

      if (!v19)
        goto LABEL_17;
      _ISDefaultLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[ISIconDecorationResource configureWithType:].cold.2((uint64_t)v4, v20);

      -[ISIconDecoration identifier](self->_decoration, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = _UTTypeCopyIconName();

      if (!v8)
      {
LABEL_17:
        _ISDefaultLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v4;
          _os_log_impl(&dword_1AA928000, v13, OS_LOG_TYPE_DEFAULT, "No resource named for decoration type '%@'", buf, 0xCu);
        }
        v8 = 0;
        goto LABEL_21;
      }
    }
    -[ISIconDecoration identifier](self->_decoration, "identifier");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v10 = UTTypeCopyDeclaringBundleURL(v9);

    Unique = (__CFBundle *)_CFBundleCreateUnique();
    if (!Unique)
    {
      v13 = v10;
LABEL_21:

      goto LABEL_22;
    }
    v12 = Unique;
    v13 = CFBundleCopyResourceURL(Unique, CFSTR("Assets"), CFSTR("car"), 0);
    CFRelease(v12);

    if (v13)
    {
      v22 = 0;
      +[ISAssetCatalogResource assetCatalogResourceWithURL:imageName:error:](ISAssetCatalogResource, "assetCatalogResourceWithURL:imageName:error:", v13, v8, &v22);
      v14 = (ISScalableCompositorResource *)objc_claimAutoreleasedReturnValue();
      v15 = v22;
      internalResource = self->_internalResource;
      self->_internalResource = v14;

      if (!self->_internalResource && v15)
      {
        _ISDefaultLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v24 = v8;
          v25 = 2112;
          v26 = v13;
          v27 = 2112;
          v28 = v15;
          _os_log_impl(&dword_1AA928000, v17, OS_LOG_TYPE_DEFAULT, "Failed to load resource named: %@ from asset catalog at URL: %@ with error: %@", buf, 0x20u);
        }

      }
      goto LABEL_21;
    }
  }
  else
  {
    _ISDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ISIconDecorationResource configureWithType:].cold.1((uint64_t)v4, (uint64_t)CFSTR("com.apple.icon-decoration"), v8);
  }
LABEL_22:

}

- (id)imageForSize:(CGSize)a3 scale:(double)a4
{
  void *internalResource;

  internalResource = self->_internalResource;
  if (internalResource)
  {
    objc_msgSend(internalResource, "imageForSize:scale:", a3.width, a3.height, a4);
    internalResource = (void *)objc_claimAutoreleasedReturnValue();
  }
  return internalResource;
}

- (ISIconDecoration)decoration
{
  return (ISIconDecoration *)objc_getProperty(self, a2, 8, 1);
}

- (ISScalableCompositorResource)internalResource
{
  return (ISScalableCompositorResource *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalResource, 0);
  objc_storeStrong((id *)&self->_decoration, 0);
}

- (void)configureWithType:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_error_impl(&dword_1AA928000, log, OS_LOG_TYPE_ERROR, "Decoration type %@ does not conform to %@", (uint8_t *)&v3, 0x16u);
}

- (void)configureWithType:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1AA928000, a2, OS_LOG_TYPE_DEBUG, "No glyph resource specified, looking for an icon resource for system type '%@'", (uint8_t *)&v2, 0xCu);
}

@end
