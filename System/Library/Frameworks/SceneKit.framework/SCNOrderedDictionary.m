@implementation SCNOrderedDictionary

- (id)allKeys
{
  return (id)-[NSMutableArray copy](self->_keys, "copy");
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNOrderedDictionary;
  -[SCNOrderedDictionary dealloc](&v3, sel_dealloc);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  NSMutableArray *keys;

  -[SCNOrderedDictionary removeObjectForKey:](self, "removeObjectForKey:", a4);
  if (a3)
  {
    keys = self->_keys;
    if (!keys)
    {
      self->_keys = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      self->_keyValues = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      keys = self->_keys;
    }
    -[NSMutableArray addObject:](keys, "addObject:", a4);
    -[NSMutableDictionary setObject:forKey:](self->_keyValues, "setObject:forKey:", a3, a4);
  }
}

- (id)objectForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_keyValues, "objectForKey:", a3);
}

- (id)objectAtIndex:(int64_t)a3
{
  return -[SCNOrderedDictionary objectForKey:](self, "objectForKey:", -[NSMutableArray objectAtIndex:](self->_keys, "objectAtIndex:", a3));
}

- (void)removeObjectForKey:(id)a3
{
  if (-[NSMutableDictionary objectForKey:](self->_keyValues, "objectForKey:"))
  {
    if (-[NSMutableArray count](self->_keys, "count") == 1)
    {
      -[SCNOrderedDictionary removeAllObjects](self, "removeAllObjects");
    }
    else
    {
      -[NSMutableArray removeObject:](self->_keys, "removeObject:", a3);
      -[NSMutableDictionary removeObjectForKey:](self->_keyValues, "removeObjectForKey:", a3);
    }
  }
}

- (void)removeAllObjects
{

  self->_keys = 0;
  self->_keyValues = 0;
}

- (void)applyFunction:(void *)a3 withContext:(void *)a4
{
  NSMutableArray *keys;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  keys = self->_keys;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](keys, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(keys);
        ((void (*)(_QWORD, uint64_t, void *))a3)(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), -[NSMutableDictionary objectForKey:](self->_keyValues, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i)), a4);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](keys, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }
}

- (void)applyBlock:(id)a3
{
  NSMutableArray *keys;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  keys = self->_keys;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](keys, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(keys);
        (*((void (**)(id, _QWORD, uint64_t))a3 + 2))(a3, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), -[NSMutableDictionary objectForKey:](self->_keyValues, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)));
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](keys, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_keys, "count");
}

- (id)allValues
{
  return (id)-[NSMutableDictionary allValues](self->_keyValues, "allValues");
}

- (id)dictionary
{
  return self->_keyValues;
}

- (id)keys
{
  return self->_keys;
}

- (void)_setupFrom:(id)a3
{
  self->_keyValues = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(a3, "dictionary"), "mutableCopy");
  self->_keys = (NSMutableArray *)objc_msgSend((id)objc_msgSend(a3, "keys"), "mutableCopy");
}

- (id)copy
{
  id v3;

  v3 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v3, "_setupFrom:", self);
  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSMutableArray *keys;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  v5 = (void *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p\n{\n"), NSStringFromClass(v4), self);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  keys = self->_keys;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](keys, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(keys);
        objc_msgSend(v5, "appendFormat:", CFSTR("    \"%@\" = \"%@\"\n"), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), -[NSMutableDictionary objectForKeyedSubscript:](self->_keyValues, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i)));
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](keys, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }
  objc_msgSend(v5, "appendString:", CFSTR("}>"));
  return v5;
}

@end
