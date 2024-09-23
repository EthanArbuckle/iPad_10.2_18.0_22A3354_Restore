@implementation VNImageBufferCache

- (__CVBuffer)cachedBufferWithKey:(id)a3
{
  id v4;
  os_unfair_lock_s *p_pixelBufferRepsLock;
  __CVBuffer *Value;

  v4 = a3;
  p_pixelBufferRepsLock = &self->_pixelBufferRepsLock;
  os_unfair_lock_lock(&self->_pixelBufferRepsLock);
  Value = (__CVBuffer *)CFDictionaryGetValue(self->_pixelBufferReps, v4);
  CVPixelBufferRetain(Value);
  os_unfair_lock_unlock(p_pixelBufferRepsLock);

  return Value;
}

- (void)cacheBuffer:(__CVBuffer *)a3 forCacheKey:(id)a4
{
  id key;

  key = a4;
  os_unfair_lock_lock(&self->_pixelBufferRepsLock);
  CFDictionaryAddValue(self->_pixelBufferReps, key, a3);
  os_unfair_lock_unlock(&self->_pixelBufferRepsLock);

}

+ (id)cacheKeyWithBufferFormat:(unsigned int)a3 width:(unint64_t)a4 height:(unint64_t)a5 cropRect:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v13 = objc_alloc(MEMORY[0x1E0CB3940]);
  v14 = a3;
  VNHumanReadableCGRect(x, y, width, height);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("format=%lu_width=%lu_height=%lu_cropRect=%@"), v14, a4, a5, v15);

  return v16;
}

- (VNImageBufferCache)init
{
  VNImageBufferCache *v2;
  VNImageBufferCache *v3;
  VNImageBufferCache *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VNImageBufferCache;
  v2 = -[VNImageBufferCache init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_pixelBufferRepsLock._os_unfair_lock_opaque = 0;
    v2->_pixelBufferReps = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v4 = v3;
  }

  return v3;
}

+ (id)cacheKeyWithBufferFormat:(unsigned int)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  return (id)objc_msgSend(a1, "cacheKeyWithBufferFormat:width:height:cropRect:", *(_QWORD *)&a3, 0.0, 0.0, (double)a4, (double)a5);
}

- (void)dealloc
{
  os_unfair_lock_s *p_pixelBufferRepsLock;
  __CFDictionary *pixelBufferReps;
  objc_super v5;

  p_pixelBufferRepsLock = &self->_pixelBufferRepsLock;
  os_unfair_lock_lock(&self->_pixelBufferRepsLock);
  pixelBufferReps = self->_pixelBufferReps;
  if (pixelBufferReps)
  {
    CFRelease(pixelBufferReps);
    self->_pixelBufferReps = 0;
  }
  os_unfair_lock_unlock(p_pixelBufferRepsLock);
  v5.receiver = self;
  v5.super_class = (Class)VNImageBufferCache;
  -[VNImageBufferCache dealloc](&v5, sel_dealloc);
}

- (void)removeCachedBufferWithKey:(id)a3
{
  id key;

  key = a3;
  os_unfair_lock_lock(&self->_pixelBufferRepsLock);
  CFDictionaryRemoveValue(self->_pixelBufferReps, key);
  os_unfair_lock_unlock(&self->_pixelBufferRepsLock);

}

- (void)purgeCacheRepresentationsForOriginalBuffer:(__CVBuffer *)a3
{
  os_unfair_lock_s *p_pixelBufferRepsLock;
  int v6;
  uint64_t PixelFormatType;
  size_t Width;
  void *v9;

  p_pixelBufferRepsLock = &self->_pixelBufferRepsLock;
  os_unfair_lock_lock(&self->_pixelBufferRepsLock);
  v6 = CFDictionaryContainsValue(self->_pixelBufferReps, a3);
  if (v6)
    CVPixelBufferRetain(a3);
  CFDictionaryRemoveAllValues(self->_pixelBufferReps);
  if (v6)
  {
    PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    Width = CVPixelBufferGetWidth(a3);
    +[VNImageBufferCache cacheKeyWithBufferFormat:width:height:](VNImageBufferCache, "cacheKeyWithBufferFormat:width:height:", PixelFormatType, Width, CVPixelBufferGetHeight(a3));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CFDictionaryAddValue(self->_pixelBufferReps, v9, a3);
    CVPixelBufferRelease(a3);

  }
  os_unfair_lock_unlock(p_pixelBufferRepsLock);
}

@end
