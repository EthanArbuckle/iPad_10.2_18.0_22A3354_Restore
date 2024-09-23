@implementation _MPArtworkCatalogPlaceholderDataSource

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  return 1;
}

- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;

  v5 = a4;
  objc_msgSend(a3, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "size");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v5, "scaledFittingSize");
  v12 = v11;
  v14 = v13;

  v15 = v10 == v14 && v8 == v12;
  return v15;
}

- (id)existingRepresentationForArtworkCatalog:(id)a3
{
  id v4;
  NSCache *v5;
  NSCache *fallbackCache;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "cache");
  v5 = (NSCache *)objc_claimAutoreleasedReturnValue();
  fallbackCache = v5;
  if (!v5)
    fallbackCache = self->_fallbackCache;
  -[_MPArtworkCatalogPlaceholderDataSource visualIdenticalityIdentifierForCatalog:](self, "visualIdenticalityIdentifierForCatalog:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache objectForKey:](fallbackCache, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  double v8;
  double v9;
  double v10;
  double v11;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *fallbackCache;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  objc_msgSend(v6, "scaledFittingSize");
  v10 = v9;
  v11 = v8;
  if (v9 == *(double *)&MPArtworkCatalogOriginalSize && v8 == *((double *)&MPArtworkCatalogOriginalSize + 1))
  {
    MSVGetMaximumScreenSize();
    v10 = v13;
    v11 = v14;
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", v10, v11);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __96___MPArtworkCatalogPlaceholderDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke;
  v22[3] = &unk_1E3155BD8;
  v21 = v6;
  v23 = v21;
  objc_msgSend(v15, "imageWithActions:", v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPArtworkCatalogPlaceholderDataSource visualIdenticalityIdentifierForCatalog:](self, "visualIdenticalityIdentifierForCatalog:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "size");
  +[MPArtworkRepresentation representationForVisualIdentity:withSize:image:](MPArtworkRepresentation, "representationForVisualIdentity:withSize:image:", v17, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "cache");
  fallbackCache = (void *)objc_claimAutoreleasedReturnValue();
  v20 = fallbackCache;
  if (!fallbackCache)
    fallbackCache = self->_fallbackCache;
  objc_msgSend(fallbackCache, "setObject:forKey:", v18, v17);

  v7[2](v7, v18, 0);
}

- (id)visualIdenticalityIdentifierForCatalog:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  void *v10;
  void *v11;
  CGSize v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v4, "token");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledFittingSize");
  v7 = v6;
  v9 = v8;

  v13.width = v7;
  v13.height = v9;
  NSStringFromCGSize(v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@"), v5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackCache, 0);
}

+ (id)sharedDataSource
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58___MPArtworkCatalogPlaceholderDataSource_sharedDataSource__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedDataSource_onceToken != -1)
    dispatch_once(&sharedDataSource_onceToken, block);
  return (id)sharedDataSource___dataSource;
}

@end
