@implementation _MFWeakObjectCacheRef

- (void)dealloc
{
  id WeakRetained;
  id v4;
  objc_super v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
  v4 = (id)objc_msgSend(WeakRetained, "objectForKey:shouldGenerate:wasCached:", self->_key, 0, 0);

  v5.receiver = self;
  v5.super_class = (Class)_MFWeakObjectCacheRef;
  -[_MFWeakObjectCacheRef dealloc](&v5, sel_dealloc);
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setCache:(id)a3
{
  objc_storeWeak((id *)&self->_cache, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cache);
  objc_storeStrong((id *)&self->_key, 0);
}

- (NSCopying)key
{
  return self->_key;
}

- (MFWeakObjectCache)cache
{
  return (MFWeakObjectCache *)objc_loadWeakRetained((id *)&self->_cache);
}

@end
