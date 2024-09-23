@implementation ReadingListLeadImageCache

- (ReadingListLeadImageCache)initWithDirectoryURL:(id)a3
{
  id v5;
  ReadingListLeadImageCache *v6;
  ReadingListLeadImageCache *v7;
  ReadingListLeadImageCache *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ReadingListLeadImageCache;
  v6 = -[ReadingListLeadImageCache init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_directoryURL, a3);
    v8 = v7;
  }

  return v7;
}

- (id)loadImageSynchronouslyForIconUUID:(id)a3
{
  id v4;
  ReadingListLeadImageCache *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  WBSCache *cache;
  WBSCache *v13;
  WBSCache *v14;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = self;
    objc_sync_enter(v5);
    -[WBSCache objectForKey:](v5->_cache, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = v6;
    }
    else
    {
      -[NSURL URLByAppendingPathComponent:isDirectory:](v5->_directoryURL, "URLByAppendingPathComponent:isDirectory:", v4, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(v8, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "imageWithContentsOfFile:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        cache = v5->_cache;
        if (!cache)
        {
          v13 = (WBSCache *)objc_alloc_init(MEMORY[0x1E0D8A808]);
          v14 = v5->_cache;
          v5->_cache = v13;

          cache = v5->_cache;
        }
        -[WBSCache setObject:forKey:](cache, "setObject:forKey:", v11, v4);
      }
      v7 = v11;

    }
    objc_sync_exit(v5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)clearCache
{
  ReadingListLeadImageCache *obj;

  obj = self;
  objc_sync_enter(obj);
  -[WBSCache removeAllObjects](obj->_cache, "removeAllObjects");
  objc_sync_exit(obj);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directoryURL, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
