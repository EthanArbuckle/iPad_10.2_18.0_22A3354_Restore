@implementation IMTranscriptBubbleSizeCache

- (IMTranscriptBubbleSizeCache)init
{
  const char *v2;
  uint64_t v3;
  IMTranscriptBubbleSizeCache *v4;
  uint64_t v5;
  NSMutableArray *sizeCache;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IMTranscriptBubbleSizeCache;
  v4 = -[IMTranscriptBubbleSizeCache init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend_array(MEMORY[0x24BDBCEB8], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    sizeCache = v4->_sizeCache;
    v4->_sizeCache = (NSMutableArray *)v5;

  }
  return v4;
}

- (CGSize)sizeForMaximumWidth:(double)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  CGSize result;

  v13 = 0;
  objc_msgSend__cacheEntryForMaximumWidth_getEffectiveIndex_(self, a2, (uint64_t)&v13, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  if (v3)
  {
    objc_msgSend_size(v3, v4, v5);
    v8 = v7;
    v10 = v9;
  }
  else
  {
    v8 = *MEMORY[0x24BDBF148];
    v10 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)setSize:(CGSize)a3 forMaximumWidth:(double)a4
{
  double height;
  double width;
  _IMTranscriptBubbleSizeCacheEntry *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  id v12;

  height = a3.height;
  width = a3.width;
  v8 = [_IMTranscriptBubbleSizeCacheEntry alloc];
  v12 = (id)objc_msgSend_initWithSize_maximumWidth_(v8, v9, v10, width, height, a4);
  objc_msgSend__insertCacheEntry_(self, v11, (uint64_t)v12);

}

- (void)flush
{
  ((void (*)(NSMutableArray *, char *))MEMORY[0x24BEDD108])(self->_sizeCache, sel_removeAllObjects);
}

- (void)_insertCacheEntry:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  void *v11;
  NSMutableArray *sizeCache;
  uint64_t v13;

  v4 = a3;
  if (objc_msgSend_count(self->_sizeCache, v5, v6))
  {
    v13 = 0;
    objc_msgSend_minimumWidth(v4, v7, v8);
    objc_msgSend__cacheEntryForMaximumWidth_getEffectiveIndex_(self, v9, (uint64_t)&v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    sizeCache = self->_sizeCache;
    if (v11)
      objc_msgSend_replaceObjectAtIndex_withObject_(sizeCache, v10, v13, v4);
    else
      objc_msgSend_insertObject_atIndex_(sizeCache, v10, (uint64_t)v4, v13);

  }
  else
  {
    objc_msgSend_addObject_(self->_sizeCache, v7, (uint64_t)v4);
  }

}

- (id)_cacheEntryForMaximumWidth:(double)a3 getEffectiveIndex:(unint64_t *)a4
{
  uint64_t v7;
  const char *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  double v16;
  double v17;

  v7 = objc_msgSend_count(self->_sizeCache, a2, (uint64_t)a4);
  if (v7)
  {
    v9 = v7;
    v10 = 0;
    while (1)
    {
      objc_msgSend_objectAtIndex_(self->_sizeCache, v8, (v9 + v10) >> 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_minimumWidth(v11, v12, v13);
      if (v16 <= a3)
      {
        objc_msgSend_maximumWidth(v11, v14, v15);
        if (v17 >= a3)
        {
          v10 = (v9 + v10) >> 1;
          goto LABEL_12;
        }
        v10 = ((v9 + v10) >> 1) + 1;
      }
      else
      {
        v9 = (v9 + v10) >> 1;
      }

      if (v10 >= v9)
        goto LABEL_10;
    }
  }
  v10 = 0;
LABEL_10:
  v11 = 0;
LABEL_12:
  *a4 = v10;
  return v11;
}

- (NSMutableArray)sizeCache
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSizeCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeCache, 0);
}

@end
