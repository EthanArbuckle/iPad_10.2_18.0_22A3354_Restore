@implementation MTNonretainedCache

- (id)objectForKeyedSubscript:(id)a3 creation:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  MTNonretainedCache *v8;
  void *v9;
  MTWeakRef *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = self;
  objc_sync_enter(v8);
  -[MTNonretainedCache cache](v8, "cache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (MTWeakRef *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v10 = objc_alloc_init(MTWeakRef);
    -[MTNonretainedCache cache](v8, "cache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v6);

  }
  -[MTWeakRef value](v10, "value");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v7[2](v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTWeakRef setValue:](v10, "setValue:", v12);
  }

  objc_sync_exit(v8);
  return v12;
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

- (MTNonretainedCache)init
{
  MTNonretainedCache *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTNonretainedCache;
  v2 = -[MTNonretainedCache init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTNonretainedCache setCache:](v2, "setCache:", v3);

  }
  return v2;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4;
  MTNonretainedCache *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[MTNonretainedCache cache](v5, "cache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[MTNonretainedCache cache](v5, "cache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, v4);

  }
  objc_sync_exit(v5);

  return v8;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6;
  MTNonretainedCache *v7;
  void *v8;
  MTWeakRef *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  if (v11)
  {
    -[MTNonretainedCache cache](v7, "cache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v6);
    v9 = (MTWeakRef *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v9 = objc_alloc_init(MTWeakRef);
      -[MTNonretainedCache cache](v7, "cache");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v6);

    }
    -[MTWeakRef setValue:](v9, "setValue:", v11);
  }
  else
  {
    -[MTNonretainedCache cache](v7, "cache");
    v9 = (MTWeakRef *)objc_claimAutoreleasedReturnValue();
    -[MTWeakRef setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", 0, v6);
  }

  objc_sync_exit(v7);
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
