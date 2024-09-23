@implementation _CPLEngineScopeCache

- (_CPLEngineScopeCache)init
{
  _CPLEngineScopeCache *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *scopeCache;
  NSMutableDictionary *v5;
  NSMutableDictionary *scopeByLocalIndex;
  NSMutableDictionary *v7;
  NSMutableDictionary *scopeByCloudIndex;
  NSMutableDictionary *v9;
  NSMutableDictionary *scopeByStableIndex;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_CPLEngineScopeCache;
  v2 = -[_CPLEngineScopeCache init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    scopeCache = v2->_scopeCache;
    v2->_scopeCache = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    scopeByLocalIndex = v2->_scopeByLocalIndex;
    v2->_scopeByLocalIndex = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    scopeByCloudIndex = v2->_scopeByCloudIndex;
    v2->_scopeByCloudIndex = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    scopeByStableIndex = v2->_scopeByStableIndex;
    v2->_scopeByStableIndex = v9;

  }
  return v2;
}

- (void)cacheScope:(id)a3 forScopeStorage:(id)a4
{
  id v6;
  void *v7;
  char v8;
  NSMutableDictionary *scopeCache;
  void *v10;
  NSMutableDictionary *scopeByLocalIndex;
  void *v12;
  NSMutableDictionary *scopeByCloudIndex;
  void *v14;
  NSMutableDictionary *scopeByStableIndex;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  if (v17)
  {
    objc_msgSend(v6, "flagsForScope:", v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "valueForFlag:", 16);

    if ((v8 & 1) == 0)
    {
      scopeCache = self->_scopeCache;
      objc_msgSend(v17, "scopeIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](scopeCache, "setObject:forKeyedSubscript:", v17, v10);

      scopeByLocalIndex = self->_scopeByLocalIndex;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v17, "localIndex"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](scopeByLocalIndex, "setObject:forKeyedSubscript:", v17, v12);

      scopeByCloudIndex = self->_scopeByCloudIndex;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v17, "cloudIndex"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](scopeByCloudIndex, "setObject:forKeyedSubscript:", v17, v14);

      scopeByStableIndex = self->_scopeByStableIndex;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v17, "stableIndex"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](scopeByStableIndex, "setObject:forKeyedSubscript:", v17, v16);

    }
  }

}

- (id)scopeWithIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_scopeCache, "objectForKeyedSubscript:", a3);
}

- (id)scopeWithLocalIndex:(int64_t)a3
{
  NSMutableDictionary *scopeByLocalIndex;
  void *v4;
  void *v5;

  scopeByLocalIndex = self->_scopeByLocalIndex;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](scopeByLocalIndex, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)scopeWithCloudIndex:(int64_t)a3
{
  NSMutableDictionary *scopeByCloudIndex;
  void *v4;
  void *v5;

  scopeByCloudIndex = self->_scopeByCloudIndex;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](scopeByCloudIndex, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)scopeWithStableIndex:(int64_t)a3
{
  NSMutableDictionary *scopeByStableIndex;
  void *v4;
  void *v5;

  scopeByStableIndex = self->_scopeByStableIndex;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](scopeByStableIndex, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)validLocalIndexes
{
  return self->_validLocalIndexes;
}

- (void)cacheValidLocalIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_validLocalIndexes, a3);
}

- (id)validCloudIndexes
{
  return self->_validCloudIndexes;
}

- (void)cacheValidCloudIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_validCloudIndexes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validCloudIndexes, 0);
  objc_storeStrong((id *)&self->_validLocalIndexes, 0);
  objc_storeStrong((id *)&self->_scopeByStableIndex, 0);
  objc_storeStrong((id *)&self->_scopeByCloudIndex, 0);
  objc_storeStrong((id *)&self->_scopeByLocalIndex, 0);
  objc_storeStrong((id *)&self->_scopeCache, 0);
}

@end
