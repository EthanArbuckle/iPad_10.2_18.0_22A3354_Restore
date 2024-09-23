@implementation ICThumbnailDataCache

- (ICThumbnailDataCache)init
{
  ICThumbnailDataCache *v2;
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICThumbnailDataCache;
  v2 = -[ICThumbnailDataCache init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0D641C0]);
    -[ICThumbnailDataCache setImageCache:](v2, "setImageCache:", v3);

  }
  return v2;
}

- (void)setThumbnailData:(id)a3 forKey:(id)a4
{
  id v6;
  ICThumbnailDataCache *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[ICThumbnailDataCache imageCache](v7, "imageCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, v6);

  objc_sync_exit(v7);
}

- (void)removeThumbnailDataForKey:(id)a3
{
  ICThumbnailDataCache *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[ICThumbnailDataCache imageCache](v4, "imageCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v6);

  objc_sync_exit(v4);
}

- (id)thumbnailDataForKey:(id)a3
{
  id v4;
  ICThumbnailDataCache *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[ICThumbnailDataCache imageCache](v5, "imageCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  ICDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v8;
}

- (void)removeAllThumbnailData
{
  id v2;

  -[ICThumbnailDataCache imageCache](self, "imageCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (ICCache)imageCache
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
