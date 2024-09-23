@implementation MAIndexCache

- (MAIndexCache)initWithLabels:(id)a3
{
  id v4;
  MAIndexCache *v5;
  uint64_t v6;
  NSArray *labels;
  NSDictionary *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSDictionary *cache;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MAIndexCache;
  v5 = -[MAIndexCache init](&v24, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    labels = v5->_labels;
    v5->_labels = (NSArray *)v6;

    v8 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v19 = v4;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v21;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v9);
          v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v14);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12 + v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v16, v15);

          ++v14;
        }
        while (v11 != v14);
        v12 += v14;
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v11);
    }

    cache = v5->_cache;
    v5->_cache = v8;

    v4 = v19;
  }

  return v5;
}

- (int64_t)indexOfLabel:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[NSDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "integerValue");
  else
    v5 = 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  MAIndexCache *v4;
  NSArray *labels;
  void *v6;
  char v7;

  v4 = (MAIndexCache *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      labels = self->_labels;
      -[MAIndexCache labels](v4, "labels");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSArray isEqual:](labels, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_labels, "hash");
}

- (NSArray)labels
{
  return self->_labels;
}

- (NSDictionary)cache
{
  return self->_cache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_labels, 0);
}

@end
