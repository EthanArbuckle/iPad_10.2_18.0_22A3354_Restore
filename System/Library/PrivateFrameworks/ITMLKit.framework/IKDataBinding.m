@implementation IKDataBinding

- (IKDataBinding)initWithEntries:(id)a3
{
  id v4;
  IKDataBinding *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSDictionary *entriesByKey;
  uint64_t v19;
  NSDictionary *keyValues;
  void *v21;
  void *v22;
  uint64_t v23;
  NSMutableSet *unresolvedKeys;
  void *v25;
  NSDictionary *v26;
  id v27;
  uint64_t v28;
  NSSet *dataBoundKeys;
  _QWORD v31[4];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)IKDataBinding;
  v5 = -[IKDataBinding init](&v37, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v34 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v13, "key");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v14);

          objc_msgSend(v13, "value");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "key");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, v16);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v10);
    }

    v17 = objc_msgSend(v7, "copy");
    entriesByKey = v5->_entriesByKey;
    v5->_entriesByKey = (NSDictionary *)v17;

    v19 = objc_msgSend(v6, "copy");
    keyValues = v5->_keyValues;
    v5->_keyValues = (NSDictionary *)v19;

    v21 = (void *)MEMORY[0x1E0C99E20];
    -[NSDictionary allKeys](v5->_keyValues, "allKeys");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setWithArray:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    unresolvedKeys = v5->_unresolvedKeys;
    v5->_unresolvedKeys = (NSMutableSet *)v23;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v5->_keyValues;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __33__IKDataBinding_initWithEntries___block_invoke;
    v31[3] = &unk_1E9F4F438;
    v32 = v25;
    v27 = v25;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v26, "enumerateKeysAndObjectsUsingBlock:", v31);
    v28 = objc_msgSend(v27, "copy");
    dataBoundKeys = v5->_dataBoundKeys;
    v5->_dataBoundKeys = (NSSet *)v28;

  }
  return v5;
}

void __33__IKDataBinding_initWithEntries___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

- (NSSet)unresolvedKeys
{
  void *v3;

  v3 = (void *)-[NSMutableSet count](self->_unresolvedKeys, "count");
  if (v3)
    v3 = (void *)-[NSMutableSet copy](self->_unresolvedKeys, "copy");
  return (NSSet *)v3;
}

- (id)keysWithAnyOfAttributes:(unint64_t)a3
{
  void *v5;
  NSDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_entriesByKey;
  v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        -[NSDictionary objectForKeyedSubscript:](self->_entriesByKey, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10), (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "attributes") & a3) != 0)
        {
          objc_msgSend(v11, "key");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
    v13 = (void *)objc_msgSend(v5, "copy");
  else
    v13 = 0;

  return v13;
}

- (id)dataBoundKeysWithAnyOfAttributes:(unint64_t)a3
{
  void *v5;
  NSSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_dataBoundKeys;
  v7 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        -[NSDictionary objectForKeyedSubscript:](self->_entriesByKey, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10), (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "attributes") | a3)
        {
          objc_msgSend(v11, "key");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
    v13 = (void *)objc_msgSend(v5, "copy");
  else
    v13 = 0;

  return v13;
}

- (id)unresolvedKeysWithAnyOfAttributes:(unint64_t)a3
{
  void *v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_unresolvedKeys;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        -[NSDictionary objectForKeyedSubscript:](self->_entriesByKey, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10), (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "attributes") | a3)
        {
          objc_msgSend(v11, "key");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
    v13 = (void *)objc_msgSend(v5, "copy");
  else
    v13 = 0;

  return v13;
}

- (void)setNeedsResolutionForKey:(id)a3
{
  -[NSMutableSet addObject:](self->_unresolvedKeys, "addObject:", a3);
}

- (void)setNeedsResolutionForAllKeys
{
  NSMutableSet *unresolvedKeys;
  void *v3;
  id v4;

  unresolvedKeys = self->_unresolvedKeys;
  -[IKDataBinding keyValues](self, "keyValues");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObjectsFromArray:](unresolvedKeys, "addObjectsFromArray:", v3);

}

- (void)markResolvedForKey:(id)a3
{
  -[NSMutableSet removeObject:](self->_unresolvedKeys, "removeObject:", a3);
}

- (NSDictionary)keyValues
{
  return self->_keyValues;
}

- (void)setKeyValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSSet)dataBoundKeys
{
  return self->_dataBoundKeys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataBoundKeys, 0);
  objc_storeStrong((id *)&self->_keyValues, 0);
  objc_storeStrong((id *)&self->_unresolvedKeys, 0);
  objc_storeStrong((id *)&self->_entriesByKey, 0);
}

@end
