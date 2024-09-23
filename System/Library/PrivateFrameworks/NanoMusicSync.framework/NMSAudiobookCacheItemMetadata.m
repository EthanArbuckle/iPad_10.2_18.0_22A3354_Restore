@implementation NMSAudiobookCacheItemMetadata

+ (id)metaDataForMediaItem:(id)a3
{
  id v3;
  NMSAudiobookCacheItemMetadata *v4;
  _BOOL4 v5;
  NMSAudiobookCacheItemMetadata *v6;

  v3 = a3;
  v4 = objc_alloc_init(NMSAudiobookCacheItemMetadata);
  v5 = -[NMSAudiobookCacheItemMetadata _loadForMediaItem:](v4, "_loadForMediaItem:", v3);

  if (v5)
    v6 = v4;
  else
    v6 = 0;

  return v6;
}

- (id)_baseDirectoryForMediaItem:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDBCF48];
  v4 = (void *)MEMORY[0x24BE6B1D0];
  v5 = a3;
  objc_msgSend(v4, "mediaFolderPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = objc_msgSend(v5, "persistentID");

  objc_msgSend(v8, "stringWithFormat:", CFSTR("ManagedPurchases/Books/%llu.m4bpkg/"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:relativeToURL:", v10, 1, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)_loadForMediaItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  -[NMSAudiobookCacheItemMetadata _baseDirectoryForMediaItem:](self, "_baseDirectoryForMediaItem:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("Metadata.plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BLAudiobookCacheMetadataKeyCachedStartTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BLAudiobookCacheMetadataKeyCachedStartTime"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BLAudiobookCacheMetadataKeyCachedDuration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BLAudiobookCacheMetadataKeyCachedDuration"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 0;
    if (v8 && v10)
    {
      objc_msgSend(v8, "doubleValue");
      -[NMSAudiobookCacheItemMetadata setCachedStartTime:](self, "setCachedStartTime:");
      objc_msgSend(v10, "doubleValue");
      -[NMSAudiobookCacheItemMetadata setCachedDuration:](self, "setCachedDuration:");
      v11 = 1;
    }
  }
  else
  {

    v11 = 0;
    v10 = 0;
  }

  return v11;
}

- (double)cachedStartTime
{
  return self->_cachedStartTime;
}

- (void)setCachedStartTime:(double)a3
{
  self->_cachedStartTime = a3;
}

- (double)cachedDuration
{
  return self->_cachedDuration;
}

- (void)setCachedDuration:(double)a3
{
  self->_cachedDuration = a3;
}

@end
