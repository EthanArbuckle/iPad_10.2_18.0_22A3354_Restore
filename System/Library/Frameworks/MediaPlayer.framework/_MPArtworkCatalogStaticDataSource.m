@implementation _MPArtworkCatalogStaticDataSource

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  return -[_MPArtworkCatalogStaticDataSource areRepresentationsOfKind:availableForCatalog:](self, "areRepresentationsOfKind:availableForCatalog:", 0, a3);
}

- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v5 = a3;
  objc_msgSend(a4, "token");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "kind");
  if (v7 == 1)
  {
    objc_msgSend(v5, "video");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "videoRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "video");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v7)
    {
      v11 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v5, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v8 == v10;

LABEL_7:
  return v11;
}

- (id)existingRepresentationForArtworkCatalog:(id)a3
{
  return -[_MPArtworkCatalogStaticDataSource existingRepresentationOfKind:forArtworkCatalog:](self, "existingRepresentationOfKind:forArtworkCatalog:", 0, a3);
}

- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;

  v7 = a4;
  -[_MPArtworkCatalogStaticDataSource existingRepresentationForArtworkCatalog:](self, "existingRepresentationForArtworkCatalog:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a4 + 2))(v7, v8, 0);

}

- (id)visualIdenticalityIdentifierForCatalog:(id)a3
{
  void *v3;
  _MPStaticArtworkVisualIdenticalityIdentifier *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(a3, "token");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(_MPStaticArtworkVisualIdenticalityIdentifier);
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "imageRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%lx"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPStaticArtworkVisualIdenticalityIdentifier setImageArtworkIdentifier:](v4, "setImageArtworkIdentifier:", v8);

  objc_msgSend(v3, "videoRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "video");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB3940];
  if (v10)
  {
    objc_msgSend(v10, "URL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "absoluteString");
  }
  else
  {
    objc_msgSend(v3, "videoRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "video");
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPStaticArtworkVisualIdenticalityIdentifier setVideoArtworkIdentifier:](v4, "setVideoArtworkIdentifier:", v14);

  return v4;
}

- (BOOL)areRepresentationsOfKind:(int64_t)a3 availableForCatalog:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  objc_msgSend(a4, "token");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 == 1)
  {
    objc_msgSend(v5, "videoRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
    {
      v8 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v5, "imageRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7 != 0;

LABEL_7:
  return v8;
}

- (id)existingRepresentationOfKind:(int64_t)a3 forArtworkCatalog:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a4, "token");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 == 1)
  {
    objc_msgSend(v5, "videoRepresentation");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
    {
      v8 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v5, "imageRepresentation");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
LABEL_7:

  return v8;
}

- (void)loadRepresentationOfKind:(int64_t)a3 forArtworkCatalog:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;

  v9 = a5;
  -[_MPArtworkCatalogStaticDataSource existingRepresentationOfKind:forArtworkCatalog:](self, "existingRepresentationOfKind:forArtworkCatalog:", a3, a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a5 + 2))(v9, v10, 0);

}

+ (id)sharedDataSource
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53___MPArtworkCatalogStaticDataSource_sharedDataSource__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedDataSource_onceToken_469 != -1)
    dispatch_once(&sharedDataSource_onceToken_469, block);
  return (id)sharedDataSource___dataSource_468;
}

@end
