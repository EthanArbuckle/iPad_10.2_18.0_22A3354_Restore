@implementation MPHomeSharingArtworkDataSource

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "token");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "artworkType") != 4
    && objc_msgSend(v3, "artworkType") != 3
    && objc_msgSend(v3, "artworkType") != 2
    && objc_msgSend(v3, "artworkType") != 5;

  return v4;
}

- (id)cacheKeyForCatalog:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  void *v6;
  _MPHomeSharingArtworkCacheKey *v7;

  height = a4.height;
  width = a4.width;
  objc_msgSend(a3, "token");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_MPHomeSharingArtworkCacheKey initWithPersistentID:size:]([_MPHomeSharingArtworkCacheKey alloc], "initWithPersistentID:size:", objc_msgSend(v6, "libraryID"), width, height);

  return v7;
}

- (BOOL)shouldLookForLargerImageRepresentationsWhenBestRepresentationIsUnavailable
{
  return 0;
}

- (id)supportedSizesForCatalog:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "token");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPArtworkConfiguration systemConfiguration](MPArtworkConfiguration, "systemConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "supportedSizesForMediaType:artworkType:", objc_msgSend(v3, "mediaType"), objc_msgSend(v3, "artworkType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)requestForCatalog:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  height = a4.height;
  width = a4.width;
  objc_msgSend(a3, "token");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D512C8];
  v9 = objc_msgSend(v7, "libraryID");
  objc_msgSend(v7, "musicLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "newWithPersistentID:inLibrary:", v9, v10);

  objc_msgSend(v11, "valueForProperty:", *MEMORY[0x1E0D50E28]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0D33598];
  -[MPHomeSharingArtworkDataSource library](self, "library");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "requestWithDatabaseID:itemID:size:", objc_msgSend(v14, "databaseID"), objc_msgSend(v12, "unsignedLongLongValue"), width, height);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPHomeSharingArtworkDataSource library](self, "library");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "urlForRequest:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB39E0], "requestWithURL:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPHomeSharingArtworkDataSource library](self, "library");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "signedRequestFromURLRequest:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  MPHomeSharingArtworkDataSource *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__MPHomeSharingArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke;
  block[3] = &unk_1E3161780;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (NSString)artworkDataSourceIdentifier
{
  void *v2;
  void *v3;

  -[MPHomeSharingArtworkDataSource library](self, "library");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (HSHomeSharingLibrary)library
{
  return self->_library;
}

- (void)setLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_library, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
}

id __88__MPHomeSharingArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  objc_super v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 48);
  v4.receiver = *(id *)(a1 + 40);
  v4.super_class = (Class)MPHomeSharingArtworkDataSource;
  return objc_msgSendSuper2(&v4, sel_loadRepresentationForArtworkCatalog_completionHandler_, v1, v2);
}

+ (NSString)artworkDataSourceShortDescription
{
  return (NSString *)CFSTR("home-sharing");
}

+ (id)artworkDataSourceWithIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  +[MPMediaLibrary mediaLibraryWithUniqueIdentifier:allowsLoadingFromDisk:](MPMediaLibrary, "mediaLibraryWithUniqueIdentifier:allowsLoadingFromDisk:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "libraryDataProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "artworkDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

@end
