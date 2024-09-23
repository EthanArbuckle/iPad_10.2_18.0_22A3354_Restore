@implementation _HKCFGNodeCache

- (_HKCFGNodeCache)init
{
  _HKCFGNodeCache *v2;
  uint64_t v3;
  NSMutableDictionary *cache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HKCFGNodeCache;
  v2 = -[_HKCFGNodeCache init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)nodesForPosition:(unint64_t)a3 nonTerminal:(id)a4 withLengthAllowance:(unint64_t)a5
{
  id v8;
  NSMutableDictionary *cache;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;

  v8 = a4;
  cache = self->_cache;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](cache, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "objectForKey:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12
      && (objc_msgSend(v12, "objectForKey:", CFSTR("allowance")),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "unsignedIntegerValue"),
          v14,
          v15 >= a5))
    {
      objc_msgSend(v13, "objectForKey:", CFSTR("nodes"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)cacheNodes:(id)a3 forPosition:(unint64_t)a4 nonTerminal:(id)a5 lengthAllowance:(unint64_t)a6
{
  NSMutableDictionary *cache;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a5;
  cache = self->_cache;
  v12 = (void *)MEMORY[0x1E0CB37E8];
  v13 = a3;
  objc_msgSend(v12, "numberWithUnsignedInteger:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](cache, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = self->_cache;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v15, v17);

  }
  objc_msgSend(v15, "objectForKey:", v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v18, v23);
  }
  objc_msgSend(v18, "objectForKey:", CFSTR("allowance"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "unsignedIntegerValue");

  if (v20 > a6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKContextFreeGrammar.m"), 182, CFSTR("Attempt to cache nodes with length allowance < cached length allowance"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v21, CFSTR("allowance"));

  objc_msgSend(v18, "setObject:forKey:", v13, CFSTR("nodes"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
