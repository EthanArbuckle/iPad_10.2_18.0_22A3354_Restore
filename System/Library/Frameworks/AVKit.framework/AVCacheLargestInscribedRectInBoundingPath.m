@implementation AVCacheLargestInscribedRectInBoundingPath

- (AVCacheLargestInscribedRectInBoundingPath)init
{
  AVCacheLargestInscribedRectInBoundingPath *v2;
  NSCache *v3;
  NSCache *cache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVCacheLargestInscribedRectInBoundingPath;
  v2 = -[AVCacheLargestInscribedRectInBoundingPath init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    cache = v2->_cache;
    v2->_cache = v3;

    -[NSCache setCountLimit:](v2->_cache, "setCountLimit:", 10);
  }
  return v2;
}

- (id)retrieveCacheForCenter:(CGPoint)a3 aspectRatio:(double)a4
{
  AVCacheLargestInscribedRectInBoundingPathKey *v5;
  void *v6;

  v5 = -[AVCacheLargestInscribedRectInBoundingPathKey initWithCenter:aspectRatio:]([AVCacheLargestInscribedRectInBoundingPathKey alloc], "initWithCenter:aspectRatio:", a3.x, a3.y, a4);
  -[NSCache objectForKey:](self->_cache, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)saveCacheFor:(CGPoint)a3 aspectRatio:(double)a4 value:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  AVCacheLargestInscribedRectInBoundingPathKey *v10;
  AVCacheLargestInscribedRectInBoundingPathValue *v11;
  NSObject *v12;
  uint8_t v13[16];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = -[AVCacheLargestInscribedRectInBoundingPathKey initWithCenter:aspectRatio:]([AVCacheLargestInscribedRectInBoundingPathKey alloc], "initWithCenter:aspectRatio:", a3.x, a3.y, a4);
  v11 = -[AVCacheLargestInscribedRectInBoundingPathValue initWithLargestInscribedRect:]([AVCacheLargestInscribedRectInBoundingPathValue alloc], "initWithLargestInscribedRect:", x, y, width, height);
  if (-[NSCache countLimit](self->_cache, "countLimit") == 10)
  {
    _AVLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1AC4B1000, v12, OS_LOG_TYPE_DEFAULT, "AVCacheLargestInscribedRectInBoundingPath: attempting to save cache while full", v13, 2u);
    }

  }
  -[NSCache setObject:forKey:](self->_cache, "setObject:forKey:", v11, v10);

}

- (void)clearCache
{
  -[NSCache removeAllObjects](self->_cache, "removeAllObjects");
}

- (CGRect)getLargestInscribableRectForView:(id)a3 withCenter:(CGPoint)a4 aspectRatio:(double)a5
{
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect result;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  -[AVCacheLargestInscribedRectInBoundingPath retrieveCacheForCenter:aspectRatio:](self, "retrieveCacheForCenter:aspectRatio:", x, y, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "largestInscribedRect");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
  }
  else
  {
    objc_msgSend(v9, "avkit_largestInscribedRectInBoundingPathWithCenter:aspectRatio:", x, y, a5);
    v13 = v20;
    v15 = v21;
    v17 = v22;
    v19 = v23;
    -[AVCacheLargestInscribedRectInBoundingPath saveCacheFor:aspectRatio:value:](self, "saveCacheFor:aspectRatio:value:", x, y, a5, v20, v21, v22, v23);
  }

  v24 = v13;
  v25 = v15;
  v26 = v17;
  v27 = v19;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (NSCache)cache
{
  return (NSCache *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
