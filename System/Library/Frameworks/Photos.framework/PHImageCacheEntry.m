@implementation PHImageCacheEntry

- (PHImageCacheEntry)init
{
  PHImageCacheEntry *v2;
  PHImageCacheEntry *v3;
  uint64_t v4;
  NSMutableArray *handlersWaitingOnResult;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PHImageCacheEntry;
  v2 = -[PHImageCacheEntry init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    handlersWaitingOnResult = v3->_handlersWaitingOnResult;
    v3->_handlersWaitingOnResult = (NSMutableArray *)v4;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_imageRef);
  v3.receiver = self;
  v3.super_class = (Class)PHImageCacheEntry;
  -[PHImageCacheEntry dealloc](&v3, sel_dealloc);
}

- (CGImage)createImageRef
{
  os_unfair_lock_s *p_lock;
  CGImage *imageRef;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  imageRef = self->_imageRef;
  if (imageRef)
  {
    if (self->_isCancelled)
      imageRef = 0;
    else
      CGImageRetain(self->_imageRef);
  }
  os_unfair_lock_unlock(p_lock);
  return imageRef;
}

- (BOOL)hasImageRef
{
  os_unfair_lock_s *p_lock;
  BOOL v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_imageRef)
    v4 = !self->_isCancelled;
  else
    v4 = 0;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_callWaiters:(id)a3 wasCancelled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (**v11)(void *, CGImage *, _BOOL8, NSError *);
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = (void (**)(void *, CGImage *, _BOOL8, NSError *))_Block_copy(*(const void **)(*((_QWORD *)&v12 + 1) + 8 * v10));
        v11[2](v11, self->_imageRef, v4, self->_error);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)addNotifyHandler:(id)a3
{
  os_unfair_lock_s *p_lock;
  CGImage *imageRef;
  _BOOL8 isCancelled;
  NSMutableArray *handlersWaitingOnResult;
  void *v8;
  id aBlock;

  aBlock = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_imageRef)
  {
    if (self->_isCancelled)
      imageRef = 0;
    else
      imageRef = self->_imageRef;
    isCancelled = self->_isCancelled;
  }
  else
  {
    if (!self->_isCancelled)
    {
      handlersWaitingOnResult = self->_handlersWaitingOnResult;
      v8 = _Block_copy(aBlock);
      -[NSMutableArray addObject:](handlersWaitingOnResult, "addObject:", v8);

      goto LABEL_9;
    }
    imageRef = 0;
    isCancelled = 1;
  }
  (*((void (**)(id, CGImage *, _BOOL8, NSError *))aBlock + 2))(aBlock, imageRef, isCancelled, self->_error);
LABEL_9:
  os_unfair_lock_unlock(p_lock);

}

- (void)populateWithImageRef:(CGImage *)a3 additionalInfo:(id)a4 error:(id)a5 executeBeforeNotifyingWaitersBlock:(id)a6
{
  id v11;
  void (**v12)(_QWORD);
  _BOOL4 isCancelled;
  void *v14;
  id v15;

  v15 = a4;
  v11 = a5;
  v12 = (void (**)(_QWORD))a6;
  os_unfair_lock_lock(&self->_lock);
  isCancelled = self->_isCancelled;
  if (!self->_isCancelled)
  {
    CGImageRetain(a3);
    CGImageRelease(self->_imageRef);
    self->_imageRef = a3;
    objc_storeStrong((id *)&self->_additionalInfo, a4);
    objc_storeStrong((id *)&self->_error, a5);
  }
  v14 = (void *)-[NSMutableArray copy](self->_handlersWaitingOnResult, "copy");
  -[NSMutableArray removeAllObjects](self->_handlersWaitingOnResult, "removeAllObjects");
  os_unfair_lock_unlock(&self->_lock);
  if (v12)
    v12[2](v12);
  -[PHImageCacheEntry _callWaiters:wasCancelled:](self, "_callWaiters:wasCancelled:", v14, isCancelled);

}

- (void)cancel
{
  os_unfair_lock_s *p_lock;
  id v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_isCancelled = 1;
  v4 = (id)-[NSMutableArray copy](self->_handlersWaitingOnResult, "copy");
  -[NSMutableArray removeAllObjects](self->_handlersWaitingOnResult, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
  -[PHImageCacheEntry _callWaiters:wasCancelled:](self, "_callWaiters:wasCancelled:", v4, 1);

}

- (BOOL)isCancelled
{
  PHImageCacheEntry *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isCancelled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)prepareForReuse
{
  os_unfair_lock_s *p_lock;
  NSDictionary *additionalInfo;
  NSError *error;
  id v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  additionalInfo = self->_additionalInfo;
  self->_additionalInfo = 0;

  error = self->_error;
  self->_error = 0;

  CGImageRelease(self->_imageRef);
  self->_imageRef = 0;
  self->_isCancelled = 0;
  v6 = (id)-[NSMutableArray copy](self->_handlersWaitingOnResult, "copy");
  -[NSMutableArray removeAllObjects](self->_handlersWaitingOnResult, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
  -[PHImageCacheEntry _callWaiters:wasCancelled:](self, "_callWaiters:wasCancelled:", v6, 1);

}

- (int)imageRequestIDForPopulatingCache
{
  return self->_imageRequestIDForPopulatingCache;
}

- (void)setImageRequestIDForPopulatingCache:(int)a3
{
  self->_imageRequestIDForPopulatingCache = a3;
}

- (NSDictionary)additionalInfo
{
  return self->_additionalInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlersWaitingOnResult, 0);
  objc_storeStrong((id *)&self->_additionalInfo, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
