@implementation ATXHeuristicCacheExpirationEntry

- (NSString)heuristicName
{
  return self->_heuristicName;
}

- (ATXHeuristicResultCache)cache
{
  return (ATXHeuristicResultCache *)objc_loadWeakRetained((id *)&self->_cache);
}

- (unint64_t)hash
{
  NSUInteger v3;
  id WeakRetained;
  unint64_t v5;

  v3 = -[NSString hash](self->_heuristicName, "hash");
  WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
  v5 = objc_msgSend(WeakRetained, "hash") - v3 + 32 * v3;

  return v5;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cache);
  objc_storeStrong((id *)&self->_heuristicName, 0);
}

- (ATXHeuristicCacheExpirationEntry)initWithHeuristic:(id)a3 cache:(id)a4
{
  id v8;
  id v9;
  void *v10;
  ATXHeuristicCacheExpirationEntry *v11;
  ATXHeuristicCacheExpirationEntry *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXHeuristicResultCache.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("heuristicName"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXHeuristicResultCache.m"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cache"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)ATXHeuristicCacheExpirationEntry;
  v11 = -[ATXHeuristicCacheExpirationEntry init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_heuristicName, a3);
    objc_storeWeak((id *)&v12->_cache, v10);
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  ATXHeuristicCacheExpirationEntry *v4;
  id *v5;
  NSString *heuristicName;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  char v11;
  id WeakRetained;
  id v13;

  v4 = (ATXHeuristicCacheExpirationEntry *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      heuristicName = self->_heuristicName;
      v7 = (NSString *)v5[1];
      if (heuristicName == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = heuristicName;
        v10 = -[NSString isEqual:](v9, "isEqual:", v8);

        if ((v10 & 1) == 0)
        {
          v11 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
      v13 = objc_loadWeakRetained(v5 + 2);
      if (WeakRetained == v13)
        v11 = 1;
      else
        v11 = objc_msgSend(WeakRetained, "isEqual:", v13);

      goto LABEL_13;
    }
    v11 = 0;
  }
LABEL_14:

  return v11;
}

- (void)setHeuristicName:(id)a3
{
  objc_storeStrong((id *)&self->_heuristicName, a3);
}

- (void)setCache:(id)a3
{
  objc_storeWeak((id *)&self->_cache, a3);
}

@end
