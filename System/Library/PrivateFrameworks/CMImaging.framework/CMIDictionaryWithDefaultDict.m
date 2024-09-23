@implementation CMIDictionaryWithDefaultDict

- (CMIDictionaryWithDefaultDict)initWithMainDict:(id)a3 defaultDict:(id)a4
{
  id v7;
  id v8;
  CMIDictionaryWithDefaultDict *v9;
  CMIDictionaryWithDefaultDict *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CMIDictionaryWithDefaultDict;
  v9 = -[CMIDictionaryWithDefaultDict init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mainDict, a3);
    objc_storeStrong((id *)&v10->_defaultDict, a4);
    v10->_countEvaluated = 0;
  }

  return v10;
}

- (unint64_t)count
{
  NSUInteger v3;
  NSDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!self->_countEvaluated)
  {
    v3 = -[NSDictionary count](self->_mainDict, "count");
    self->_count = -[NSDictionary count](self->_defaultDict, "count") + v3;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = self->_mainDict;
    v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          -[NSDictionary objectForKey:](self->_defaultDict, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8), (_QWORD)v11);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          self->_count -= v9 != 0;

          ++v8;
        }
        while (v6 != v8);
        v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

    self->_countEvaluated = 1;
  }
  return self->_count;
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  -[NSDictionary objectForKey:](self->_mainDict, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NSDictionary objectForKey:](self->_defaultDict, "objectForKey:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_11;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_12:
        cmiMergedObject(v5, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
      -[NSDictionary objectForKey:](self->_defaultDict, "objectForKey:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || (v9 = objc_msgSend(v5, "count"), v9 != objc_msgSend(v6, "count")))
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    v7 = v5;
    v8 = v6;
  }
  else
  {
    -[NSDictionary objectForKey:](self->_defaultDict, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7;
    v8 = 0;
  }
  cmiMergedObject(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v10;
}

- (id)keyEnumerator
{
  return -[CMIDictionaryWithDefaultDictEnumerator initWithMainDict:defaultDict:]([CMIDictionaryWithDefaultDictEnumerator alloc], "initWithMainDict:defaultDict:", self->_mainDict, self->_defaultDict);
}

- (NSDictionary)mainDict
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSDictionary)defaultDict
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultDict, 0);
  objc_storeStrong((id *)&self->_mainDict, 0);
}

@end
