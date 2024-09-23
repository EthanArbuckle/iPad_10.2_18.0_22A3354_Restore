@implementation _NBRegularExpressionCache

+ (id)sharedInstance
{
  if (qword_253EC0A28 != -1)
    dispatch_once(&qword_253EC0A28, &__block_literal_global_0);
  return (id)_MergedGlobals_32;
}

- (_NBRegularExpressionCache)init
{
  _NBRegularExpressionCache *v2;
  NSCache *v3;
  NSCache *cache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_NBRegularExpressionCache;
  v2 = -[_NBRegularExpressionCache init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    cache = v2->_cache;
    v2->_cache = v3;

  }
  return v2;
}

- (id)regularExpressionForPattern:(id)a3 error:(id *)a4
{
  id v6;
  _NBRegularExpressionCache *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v16;

  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  -[_NBRegularExpressionCache cache](v7, "cache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = v9;
  }
  else
  {
    v16 = 0;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", v6, 0, &v16);
    v12 = v16;
    v13 = v12;
    if (!a4 || v11)
    {
      -[_NBRegularExpressionCache cache](v7, "cache");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v11, v6);

      v10 = v11;
    }
    else
    {
      v10 = 0;
      *a4 = objc_retainAutorelease(v12);
    }

  }
  objc_sync_exit(v7);

  return v10;
}

- (NSCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
