@implementation AMSRatingsCache

- (AMSRatingsCache)initWithMediaType:(unint64_t)a3 storeFront:(id)a4
{
  id v7;
  AMSRatingsCache *v8;
  AMSRatingsCache *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AMSRatingsCache;
  v8 = -[AMSRatingsCache init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_storeFront, a4);
    v9->_mediaType = a3;
  }

  return v9;
}

- (AMSRatingsCache)initWithMediaType:(unint64_t)a3
{
  return -[AMSRatingsCache initWithMediaType:storeFront:](self, "initWithMediaType:storeFront:", a3, 0);
}

- (BOOL)_hasCachedData
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v17;
  id v18;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSRatingsCache cachePath](self, "cachePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if (!v5)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSRatingsCache cachePath](self, "cachePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v6, "attributesOfItemAtPath:error:", v7, &v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v18;

  if (v9)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v8, "fileModificationDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceNow");
    v13 = fabs(v12);
    v10 = v13 <= 86400.0;
    if (v13 <= 86400.0)
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSRatingsCache cachePath](self, "cachePath");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      objc_msgSend(v14, "removeItemAtPath:error:", v15, &v17);
      v9 = v17;

    }
  }

  return v10;
}

- (void)clearCacheIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSRatingsCache cachePath](self, "cachePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSRatingsCache cachePath](self, "cachePath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v6, "attributesOfItemAtPath:error:", v7, &v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v15;

    if (!v9)
    {
      objc_msgSend(v8, "fileModificationDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceNow");
      if (fabs(v11) <= 86400.0)
      {
        v9 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSRatingsCache cachePath](self, "cachePath");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 0;
        objc_msgSend(v12, "removeItemAtPath:error:", v13, &v14);
        v9 = v14;

      }
    }

  }
}

- (id)cacheDirectory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E98], "ams_cachesDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("ratings"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, 0);

  return v3;
}

- (id)cachePath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AMSRatingsCache cacheDirectory](self, "cacheDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSRatingsCache cacheTitle](self, "cacheTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)cacheTitle
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  -[AMSRatingsCache mediaType](self, "mediaType");
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AMSRatingsCache storeFront](self, "storeFront");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = CFSTR("storefronts");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%lu.json"), v6, -[AMSRatingsCache mediaType](self, "mediaType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)getCacheData
{
  void *v3;
  void *v4;
  void *v5;

  if (-[AMSRatingsCache _hasCachedData](self, "_hasCachedData"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSRatingsCache cachePath](self, "cachePath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contentsAtPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)addCacheData:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (void *)MEMORY[0x1E0CB3620];
  v5 = a3;
  objc_msgSend(v4, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSRatingsCache cachePath](self, "cachePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "createFileAtPath:contents:attributes:", v7, v5, 0);

  return v8;
}

- (unint64_t)mediaType
{
  return self->_mediaType;
}

- (NSString)storeFront
{
  return self->_storeFront;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeFront, 0);
}

@end
