@implementation AVAssetCache

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAssetCache;
  return -[AVAssetCache init](&v3, sel_init);
}

+ (AVAssetCache)assetCacheWithURL:(id)a3
{
  return (AVAssetCache *)+[AVManagedAssetCache assetCacheWithURL:](AVManagedAssetCache, "assetCacheWithURL:", a3);
}

- (AVAssetCache)initWithURL:(id)a3
{

  return (AVAssetCache *)-[AVManagedAssetCache initWithURL:]([AVManagedAssetCache alloc], "initWithURL:", a3);
}

+ (id)assetCacheForHTTPLiveStreamingWithURL:(id)a3
{
  return +[AVManagedAssetCache assetCacheForHTTPLiveStreamingWithURL:](AVManagedAssetCache, "assetCacheForHTTPLiveStreamingWithURL:", a3);
}

+ (id)assetCacheForProgressiveDownloadWithURL:(id)a3
{
  return +[AVManagedAssetCache assetCacheForProgressiveDownloadWithURL:](AVManagedAssetCache, "assetCacheForProgressiveDownloadWithURL:", a3);
}

+ (id)assetCacheForProgressiveDownloadAndHTTPLiveStreamingWithURL:(id)a3
{
  return +[AVManagedAssetCache assetCacheForProgressiveDownloadAndHTTPLiveStreamingWithURL:](AVManagedAssetCache, "assetCacheForProgressiveDownloadAndHTTPLiveStreamingWithURL:", a3);
}

- (NSArray)mediaSelectionOptionsInMediaSelectionGroup:(AVMediaSelectionGroup *)mediaSelectionGroup
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v5);
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (BOOL)isPlayableOffline
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (int64_t)maxSize
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (int64_t)maxEntrySize
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (int64_t)currentSize
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (id)URL
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (void)removeEntryForKey:(id)a3
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v5);
}

- (int64_t)sizeOfEntryForKey:(id)a3
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v5);
  return 0;
}

- (id)lastModifiedDateOfEntryForKey:(id)a3
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v5);
  return 0;
}

- (id)allKeys
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (BOOL)isDefunct
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

@end
