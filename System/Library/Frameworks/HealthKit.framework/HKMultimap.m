@implementation HKMultimap

- (HKMultimap)initWithType:(int64_t)a3
{
  HKMultimap *v4;
  uint64_t v5;
  NSMapTable *table;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKMultimap;
  v4 = -[HKMultimap init](&v8, sel_init);
  if (v4)
  {
    if (a3 == 1)
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    else
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    table = v4->_table;
    v4->_table = (NSMapTable *)v5;

  }
  return v4;
}

- (HKMultimap)init
{
  return -[HKMultimap initWithType:](self, "initWithType:", 0);
}

+ (id)multimapWithWeakObjects
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:", 1);
}

+ (id)multimapWithStrongObjects
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:", 0);
}

- (unint64_t)count
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[NSMapTable objectEnumerator](self->_table, "objectEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[_HKMappingKey initWithObject:andKey:]((id *)[_HKMappingKey alloc], v7, v6);

  -[NSMapTable setObject:forKey:](self->_table, "setObject:forKey:", v7, v8);
}

- (void)removeObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMapTable keyEnumerator](self->_table, "keyEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (-[_HKMappingKey objectMatches:](v12, v4))
          -[NSMapTable removeObjectForKey:](self->_table, "removeObjectForKey:", v12, (_QWORD)v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)removeObjectsForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMapTable keyEnumerator](self->_table, "keyEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if (v12 && objc_msgSend(*(id *)(v12 + 16), "isEqual:", v4, (_QWORD)v13))
          -[NSMapTable removeObjectForKey:](self->_table, "removeObjectForKey:", v12);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)removeObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[_HKMappingKey initWithObject:andKey:]((id *)[_HKMappingKey alloc], v7, v6);

  -[NSMapTable removeObjectForKey:](self->_table, "removeObjectForKey:", v8);
}

- (id)objectsForKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMapTable keyEnumerator](self->_table, "keyEnumerator", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        if (v11 && objc_msgSend(*(id *)(v11 + 16), "isEqual:", v4))
        {
          -[NSMapTable objectForKey:](self->_table, "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  HKMultimap *v4;
  void *v5;
  char v6;

  v4 = (HKMultimap *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = (void *)objc_opt_class();
    if (objc_msgSend(v5, "isEqual:", objc_opt_class()))
      v6 = -[NSMapTable isEqual:](self->_table, "isEqual:", v4->_table);
    else
      v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSMapTable hash](self->_table, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  HKMultimap *v5;
  uint64_t v6;
  NSMapTable *table;

  v5 = -[HKMultimap initWithType:]([HKMultimap alloc], "initWithType:", 0);
  v6 = -[NSMapTable copyWithZone:](self->_table, "copyWithZone:", a3);
  table = v5->_table;
  v5->_table = (NSMapTable *)v6;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_table, 0);
}

@end
