@implementation CKMultiCache

- (void)pushObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (-[IMMultiDict count](self, "count") > self->_limit)
    -[CKMultiCache removeAllObjects](self, "removeAllObjects");
  v8.receiver = self;
  v8.super_class = (Class)CKMultiCache;
  -[IMMultiDict pushObject:forKey:](&v8, sel_pushObject_forKey_, v6, v7);

}

- (void)markCacheAsPrewarmed
{
  -[CKMultiCache setCacheEligibleForPrewarm:](self, "setCacheEligibleForPrewarm:", 0);
}

- (CKMultiCache)init
{
  CKMultiCache *v2;
  CKMultiCache *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKMultiCache;
  v2 = -[IMMultiDict init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CKMultiCache setCacheEligibleForPrewarm:](v2, "setCacheEligibleForPrewarm:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_removeAllObjects, *MEMORY[0x1E0CEB288], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v3, sel_removeAllObjects, *MEMORY[0x1E0CEB298], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel_removeAllObjects, *MEMORY[0x1E0CEB3F0], 0);

    v3->_limit = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v3;
}

- (void)setCacheEligibleForPrewarm:(BOOL)a3
{
  self->_cacheEligibleForPrewarm = a3;
}

- (BOOL)cacheEligibleForPrewarm
{
  return self->_cacheEligibleForPrewarm;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CKMultiCache;
  -[CKMultiCache dealloc](&v4, sel_dealloc);
}

- (void)removeAllObjects
{
  objc_super v3;

  -[CKMultiCache setCacheEligibleForPrewarm:](self, "setCacheEligibleForPrewarm:", 1);
  v3.receiver = self;
  v3.super_class = (Class)CKMultiCache;
  -[IMMultiDict removeAllObjects](&v3, sel_removeAllObjects);
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

@end
