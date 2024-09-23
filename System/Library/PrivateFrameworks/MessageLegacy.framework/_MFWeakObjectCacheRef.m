@implementation _MFWeakObjectCacheRef

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(objc_loadWeak((id *)&self->_cache), "objectForKey:shouldGenerate:wasCached:", self->_key, 0, 0);

  v3.receiver = self;
  v3.super_class = (Class)_MFWeakObjectCacheRef;
  -[_MFWeakObjectCacheRef dealloc](&v3, sel_dealloc);
}

- (NSCopying)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (MFWeakObjectCache)cache
{
  return (MFWeakObjectCache *)objc_loadWeak((id *)&self->_cache);
}

- (void)setCache:(id)a3
{
  objc_storeWeak((id *)&self->_cache, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cache);
}

@end
