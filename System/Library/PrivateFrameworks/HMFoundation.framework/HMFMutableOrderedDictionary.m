@implementation HMFMutableOrderedDictionary

- (HMFMutableOrderedDictionary)initWithObjects:(id)a3 orderedKeySet:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMFMutableOrderedDictionary;
  return -[HMFOrderedDictionary initWithObjects:orderedKeySet:](&v5, sel_initWithObjects_orderedKeySet_, a3, a4);
}

- (HMFMutableOrderedDictionary)initWithObjects:(id)a3 forKeys:(id)a4 copyObjects:(BOOL)a5 copyKeys:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  HMFMutableOrderedDictionary *v20;

  v6 = a6;
  v7 = a5;
  v10 = (objc_class *)MEMORY[0x1E0C99DE8];
  v11 = a4;
  v12 = a3;
  v13 = [v10 alloc];
  v14 = (void *)MEMORY[0x1E0C9AA60];
  if (v12)
    v15 = v12;
  else
    v15 = (id)MEMORY[0x1E0C9AA60];
  v16 = (void *)objc_msgSend(v13, "initWithArray:copyItems:", v15, v7);

  v17 = objc_alloc(MEMORY[0x1E0C99E10]);
  if (v11)
    v18 = v11;
  else
    v18 = v14;
  v19 = (void *)objc_msgSend(v17, "initWithArray:copyItems:", v18, v6);

  v20 = -[HMFMutableOrderedDictionary initWithObjects:orderedKeySet:](self, "initWithObjects:orderedKeySet:", v16, v19);
  return v20;
}

- (HMFMutableOrderedDictionary)initWithCapacity:(unint64_t)a3
{
  void *v5;
  void *v6;
  HMFMutableOrderedDictionary *v7;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", a3);
  v7 = -[HMFMutableOrderedDictionary initWithObjects:orderedKeySet:](self, "initWithObjects:orderedKeySet:", v5, v6);

  return v7;
}

- (NSArray)allKeys
{
  void *v2;
  void *v3;

  -[NSOrderedSet array](self->super._keys, "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (NSArray)allValues
{
  return (NSArray *)(id)-[NSArray copy](self->super._objects, "copy");
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  NSOrderedSet *keys;
  id v7;
  uint64_t v8;
  NSArray *objects;
  NSOrderedSet *v10;
  id v11;

  v11 = a4;
  keys = self->super._keys;
  v7 = a3;
  v8 = -[NSOrderedSet indexOfObject:](keys, "indexOfObject:", v11);
  objects = self->super._objects;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSArray addObject:](objects, "addObject:", v7);

    v10 = self->super._keys;
    v7 = (id)objc_msgSend(v11, "copyWithZone:", 0);
    -[NSOrderedSet addObject:](v10, "addObject:", v7);
  }
  else
  {
    -[NSArray replaceObjectAtIndex:withObject:](objects, "replaceObjectAtIndex:withObject:", v8, v7);
  }

}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  if (a3)
    -[HMFMutableOrderedDictionary setObject:forKey:](self, "setObject:forKey:", a3, a4);
  else
    -[HMFMutableOrderedDictionary removeObjectForKey:](self, "removeObjectForKey:", a4);
}

- (void)removeObjectForKey:(id)a3
{
  NSUInteger v4;
  NSUInteger v5;

  v4 = -[NSOrderedSet indexOfObject:](self->super._keys, "indexOfObject:", a3);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v4;
    -[NSArray removeObjectAtIndex:](self->super._objects, "removeObjectAtIndex:", v4);
    -[NSOrderedSet removeObjectAtIndex:](self->super._keys, "removeObjectAtIndex:", v5);
  }
}

- (void)removeObjectsForKeys:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (v5 >= 2)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = v4;
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
          v12 = -[NSOrderedSet indexOfObject:](self->super._keys, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11), (_QWORD)v13);
          if (v12 != 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v6, "addIndex:", v12);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

    -[NSArray removeObjectsAtIndexes:](self->super._objects, "removeObjectsAtIndexes:", v6);
    -[NSOrderedSet removeObjectsAtIndexes:](self->super._keys, "removeObjectsAtIndexes:", v6);
    goto LABEL_14;
  }
  if (v5)
  {
    objc_msgSend(v4, "firstObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[HMFMutableOrderedDictionary removeObjectForKey:](self, "removeObjectForKey:", v6);
LABEL_14:

  }
}

- (void)setOrderedDictionary:(id)a3
{
  NSArray *objects;
  uint64_t v5;
  _QWORD *v6;
  NSOrderedSet *keys;
  uint64_t v8;

  objects = self->super._objects;
  v5 = *((_QWORD *)a3 + 1);
  v6 = a3;
  -[NSArray setArray:](objects, "setArray:", v5);
  -[NSOrderedSet removeAllObjects](self->super._keys, "removeAllObjects");
  keys = self->super._keys;
  v8 = v6[2];

  -[NSOrderedSet unionOrderedSet:](keys, "unionOrderedSet:", v8);
}

- (void)setBySortingDictionary:(id)a3
{
  -[HMFMutableOrderedDictionary setBySortingDictionary:keyComparator:](self, "setBySortingDictionary:keyComparator:", a3, &__block_literal_global_46);
}

- (void)setBySortingDictionary:(id)a3 keyComparator:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v7 = 0;
  v8 = 0;
  sortKeysAndValuesOfDictionary(a3, a4, &v8, &v7);
  v5 = v7;
  -[NSArray setArray:](self->super._objects, "setArray:", v7);
  -[NSOrderedSet removeAllObjects](self->super._keys, "removeAllObjects");
  v6 = v8;
  -[NSOrderedSet addObjectsFromArray:](self->super._keys, "addObjectsFromArray:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  HMFOrderedDictionary *v4;
  void *v5;
  void *v6;
  HMFOrderedDictionary *v7;

  v4 = [HMFOrderedDictionary alloc];
  v5 = (void *)-[NSArray copy](self->super._objects, "copy");
  v6 = (void *)-[NSOrderedSet copy](self->super._keys, "copy");
  v7 = -[HMFOrderedDictionary initWithObjects:orderedKeySet:](v4, "initWithObjects:orderedKeySet:", v5, v6);

  return v7;
}

@end
