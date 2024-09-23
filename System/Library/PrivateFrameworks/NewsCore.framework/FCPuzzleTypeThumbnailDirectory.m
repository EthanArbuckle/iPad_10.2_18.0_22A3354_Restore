@implementation FCPuzzleTypeThumbnailDirectory

- (FCPuzzleTypeThumbnailDirectory)initWithResourceMapId:(id)a3 assetManager:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  FCPuzzleTypeThumbnailDirectory *v11;
  FCPuzzleTypeThumbnailDirectory *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)FCPuzzleTypeThumbnailDirectory;
  v11 = -[FCPuzzleTypeThumbnailDirectory init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[FCPuzzleTypeThumbnailDirectory setAssetManager:](v11, "setAssetManager:", v9);
    -[FCPuzzleTypeThumbnailDirectory setContext:](v12, "setContext:", v10);
    -[FCPuzzleTypeThumbnailDirectory setResourceMapId:](v12, "setResourceMapId:", v8);
  }

  return v12;
}

- (id)smallThumbnailForDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[FCPuzzleTypeThumbnailDirectory resourceMapId](self, "resourceMapId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FCPuzzleTypeThumbnailDirectory resourceMapId](self, "resourceMapId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCPuzzleThumbnailURLProtocol URLForResourceMapID:publishDate:](FCPuzzleThumbnailURLProtocol, "URLForResourceMapID:publishDate:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[FCPuzzleTypeThumbnailDirectory assetManager](self, "assetManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "assetHandleForURL:lifetimeHint:", v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (FCAssetManager)assetManager
{
  return self->_assetManager;
}

- (void)setAssetManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetManager, a3);
}

- (NSString)resourceMapId
{
  return self->_resourceMapId;
}

- (void)setResourceMapId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (FCContentContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_resourceMapId, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
}

@end
