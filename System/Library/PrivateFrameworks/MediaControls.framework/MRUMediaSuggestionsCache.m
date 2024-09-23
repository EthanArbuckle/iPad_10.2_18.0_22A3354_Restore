@implementation MRUMediaSuggestionsCache

+ (MRUMediaSuggestionsCache)sharedCache
{
  if (sharedCache___once != -1)
    dispatch_once(&sharedCache___once, &__block_literal_global_23);
  return (MRUMediaSuggestionsCache *)(id)sharedCache___sharedCache;
}

void __39__MRUMediaSuggestionsCache_sharedCache__block_invoke()
{
  MRUMediaSuggestionsCache *v0;
  void *v1;

  v0 = objc_alloc_init(MRUMediaSuggestionsCache);
  v1 = (void *)sharedCache___sharedCache;
  sharedCache___sharedCache = (uint64_t)v0;

}

- (MRUMediaSuggestionsCache)init
{
  MRUMediaSuggestionsCache *v2;
  NSCache *v3;
  NSCache *imageCache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MRUMediaSuggestionsCache;
  v2 = -[MRUMediaSuggestionsCache init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    imageCache = v2->_imageCache;
    v2->_imageCache = v3;

  }
  return v2;
}

- (id)artworkForMediaSuggestion:(id)a3
{
  id v4;
  MRUMediaSuggestionsCache *v5;
  NSCache *imageCache;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSCache *v15;
  void *v16;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  imageCache = v5->_imageCache;
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache objectForKey:](imageCache, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(v4, "artwork");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = objc_alloc(MEMORY[0x1E0DC3870]);
      objc_msgSend(v4, "artwork");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "imageData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v12, "initWithData:", v14);

      if (v8)
      {
        v15 = v5->_imageCache;
        objc_msgSend(v4, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSCache setObject:forKey:](v15, "setObject:forKey:", v8, v16);

      }
    }
    else
    {
      v8 = 0;
    }
  }
  objc_sync_exit(v5);

  return v8;
}

- (NSCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_imageCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCache, 0);
}

@end
