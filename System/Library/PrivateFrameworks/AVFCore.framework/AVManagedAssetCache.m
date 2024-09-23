@implementation AVManagedAssetCache

- (void)setMaxSize:(int64_t)a3
{
  if (a3 >= 1)
  {
    -[NSURL absoluteString](self->_priv->url, "absoluteString");
    FigShared_SetDiskCacheParams();
  }
}

- (void)setMaxEntrySize:(int64_t)a3
{
  if (a3 >= 1)
  {
    -[NSURL absoluteString](self->_priv->url, "absoluteString");
    FigShared_SetDiskCacheParams();
  }
}

- (BOOL)isProgressiveDownloadCacheEnabled
{
  return self->_priv->enableCRABSCache;
}

- (BOOL)isHTTPLiveStreamingCacheEnabled
{
  return self->_priv->enableHLSCache;
}

- (id)URL
{
  return self->_priv->url;
}

+ (id)assetCacheWithURL:(id)a3
{
  return -[AVManagedAssetCache initWithURL:]([AVManagedAssetCache alloc], "initWithURL:", a3);
}

- (AVManagedAssetCache)initWithURL:(id)a3 enableCRABSCache:(BOOL)a4 enableHLSCache:(BOOL)a5
{
  AVManagedAssetCache *v8;
  AVManagedAssetCacheInternal *priv;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVManagedAssetCache;
  v8 = -[AVAssetCache _init](&v11, sel__init);
  if (v8)
  {
    priv = objc_alloc_init(AVManagedAssetCacheInternal);
    v8->_priv = priv;
    if (priv)
    {
      if (a3)
      {
        v8->_priv->url = (NSURL *)objc_msgSend(a3, "copy");
        priv = v8->_priv;
      }
      priv->enableCRABSCache = a4;
      v8->_priv->enableHLSCache = a5;
      CFRetain(v8->_priv);
    }
    else
    {

      return 0;
    }
  }
  return v8;
}

- (AVManagedAssetCache)initWithURL:(id)a3
{
  return -[AVManagedAssetCache initWithURL:enableCRABSCache:enableHLSCache:](self, "initWithURL:enableCRABSCache:enableHLSCache:", a3, 1, 0);
}

+ (id)assetCacheForHTTPLiveStreamingWithURL:(id)a3
{
  return -[AVManagedAssetCache initWithURL:enableCRABSCache:enableHLSCache:]([AVManagedAssetCache alloc], "initWithURL:enableCRABSCache:enableHLSCache:", a3, 0, 1);
}

+ (id)assetCacheForProgressiveDownloadWithURL:(id)a3
{
  return -[AVManagedAssetCache initWithURL:enableCRABSCache:enableHLSCache:]([AVManagedAssetCache alloc], "initWithURL:enableCRABSCache:enableHLSCache:", a3, 1, 0);
}

+ (id)assetCacheForProgressiveDownloadAndHTTPLiveStreamingWithURL:(id)a3
{
  return -[AVManagedAssetCache initWithURL:enableCRABSCache:enableHLSCache:]([AVManagedAssetCache alloc], "initWithURL:enableCRABSCache:enableHLSCache:", a3, 1, 1);
}

- (void)dealloc
{
  AVManagedAssetCacheInternal *priv;
  objc_super v4;

  priv = self->_priv;
  if (priv)
  {

    CFRelease(self->_priv);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVManagedAssetCache;
  -[AVManagedAssetCache dealloc](&v4, sel_dealloc);
}

- (int64_t)maxSize
{
  -[NSURL absoluteString](self->_priv->url, "absoluteString");
  FigShared_CopyDiskCacheParams();
  return 0;
}

- (int64_t)maxEntrySize
{
  -[NSURL absoluteString](self->_priv->url, "absoluteString");
  FigShared_CopyDiskCacheParams();
  return 0;
}

- (int64_t)currentSize
{
  -[NSURL absoluteString](self->_priv->url, "absoluteString");
  FigShared_CopyDiskCacheParams();
  return 0;
}

- (void)enableAutomaticCacheSizeManagement
{
  -[NSURL absoluteString](self->_priv->url, "absoluteString");
  FigShared_SetDiskCacheParams();
}

- (void)removeEntryForKey:(id)a3
{
  -[NSURL absoluteString](self->_priv->url, "absoluteString");
  FigShared_DeleteFromDiskCache();
}

- (int64_t)sizeOfEntryForKey:(id)a3
{
  -[NSURL absoluteString](self->_priv->url, "absoluteString");
  FigShared_GetCacheFileSize();
  return 0;
}

- (id)lastModifiedDateOfEntryForKey:(id)a3
{
  -[NSURL absoluteString](self->_priv->url, "absoluteString");
  FigShared_CopyCacheLastModifiedDate();
  return 0;
}

- (id)allKeys
{
  -[NSURL absoluteString](self->_priv->url, "absoluteString");
  FigShared_CopyDiskCacheCheckedInIDs();
  return 0;
}

- (id)mediaSelectionOptionsInMediaSelectionGroup:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array", a3);
}

- (BOOL)isPlayableOffline
{
  return 0;
}

- (BOOL)isDefunct
{
  return 0;
}

@end
