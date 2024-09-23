@implementation MKArtworkDataSourceCache

+ (MKArtworkDataSourceCache)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__MKArtworkDataSourceCache_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECE2D950 != -1)
    dispatch_once(&qword_1ECE2D950, block);
  return (MKArtworkDataSourceCache *)(id)_MergedGlobals_138;
}

void __42__MKArtworkDataSourceCache_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  +[MKTransitArtworkManager sharedInstance](MKTransitArtworkManager, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "initWithArtworkManager:", v4);
  v3 = (void *)_MergedGlobals_138;
  _MergedGlobals_138 = v2;

}

- (MKArtworkDataSourceCache)initWithArtworkManager:(id)a3
{
  id v5;
  MKArtworkDataSourceCache *v6;
  MKArtworkDataSourceCache *v7;
  NSCache *v8;
  NSCache *artworkImageCache;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MKArtworkDataSourceCache;
  v6 = -[MKArtworkDataSourceCache init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_artworkManager, a3);
    v8 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    artworkImageCache = v7->_artworkImageCache;
    v7->_artworkImageCache = v8;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v7, sel__shieldPackDidUpdate, *MEMORY[0x1E0D26C08], 0);

  }
  return v7;
}

- (void)purge
{
  void *v3;

  -[MKArtworkDataSourceCache artworkManager](self, "artworkManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "purge");

  -[NSCache removeAllObjects](self->_artworkImageCache, "removeAllObjects");
}

- (id)imageForSizedArtwork:(id)a3 scale:(double)a4 nightMode:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = a5;
  v8 = a3;
  objc_msgSend(v8, "artwork");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKArtworkDataSourceCache imageForArtwork:size:featureType:scale:nightMode:](self, "imageForArtwork:size:featureType:scale:nightMode:", v9, objc_msgSend(v8, "shieldSize"), 2, v5, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = objc_msgSend(v8, "fallbackShieldSize");
    if (v11 == objc_msgSend(v8, "shieldSize"))
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(v8, "artwork");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKArtworkDataSourceCache imageForArtwork:size:featureType:scale:nightMode:](self, "imageForArtwork:size:featureType:scale:nightMode:", v12, objc_msgSend(v8, "fallbackShieldSize"), 2, v5, a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v10;
}

- (id)imageForArtwork:(id)a3 size:(int64_t)a4 featureType:(unint64_t)a5 scale:(double)a6 nightMode:(BOOL)a7
{
  return -[MKArtworkDataSourceCache imageForArtwork:size:featureType:scale:nightMode:widthPaddingMultiple:](self, "imageForArtwork:size:featureType:scale:nightMode:widthPaddingMultiple:", a3, a4, a5, a7, a6, 1.0);
}

- (id)imageForArtwork:(id)a3 size:(int64_t)a4 featureType:(unint64_t)a5 scale:(double)a6 nightMode:(BOOL)a7 widthPaddingMultiple:(double)a8
{
  _BOOL8 v9;
  id v14;
  void *v15;
  unsigned int ShouldBeFlipped;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;

  v9 = a7;
  v14 = a3;
  objc_msgSend(v14, "shieldDataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  ShouldBeFlipped = ImageForShieldDataSourceTypeShouldBeFlipped(objc_msgSend(v15, "shieldType"));

  MKKeyForTransitArtwork(v14, a4, a5, ShouldBeFlipped, v9, a8, a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKArtworkDataSourceCache _lookupArtworkInCacheWithKey:](self, "_lookupArtworkInCacheWithKey:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    -[MKArtworkDataSourceCache artworkManager](self, "artworkManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "transitArtworkImageWithDataSource:size:featureType:scale:nightMode:withWidthPaddingMultiple:", v14, a4, a5, v9, a6, a8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (ShouldBeFlipped)
    {
      objc_msgSend(v18, "imageFlippedForRightToLeftLayoutDirection");
      v20 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v20;
    }
    if (v18)
      -[MKArtworkDataSourceCache _setArtworkImageInCache:forKey:](self, "_setArtworkImageInCache:forKey:", v18, v17);
  }

  return v18;
}

- (id)_lookupArtworkInCacheWithKey:(id)a3
{
  return -[NSCache objectForKey:](self->_artworkImageCache, "objectForKey:", a3);
}

- (void)_setArtworkImageInCache:(id)a3 forKey:(id)a4
{
  -[NSCache setObject:forKey:](self->_artworkImageCache, "setObject:forKey:", a3, a4);
}

- (MKTransitArtworkManager)artworkManager
{
  return self->_artworkManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkManager, 0);
  objc_storeStrong((id *)&self->_artworkImageCache, 0);
}

@end
