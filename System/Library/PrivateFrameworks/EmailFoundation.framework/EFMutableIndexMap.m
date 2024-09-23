@implementation EFMutableIndexMap

- (EFMutableIndexMap)init
{
  EFMutableIndexMap *v2;
  NSMutableArray *v3;
  NSMutableArray *tuples;
  NSMutableDictionary *v5;
  NSMutableDictionary *keyToTuple;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EFMutableIndexMap;
  v2 = -[EFMutableIndexMap init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    tuples = v2->_tuples;
    v2->_tuples = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    keyToTuple = v2->_keyToTuple;
    v2->_keyToTuple = v5;

  }
  return v2;
}

- (id)description
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__EFMutableIndexMap_description__block_invoke;
  v6[3] = &unk_1E62A61C0;
  v4 = v3;
  v7 = v4;
  -[EFMutableIndexMap enumerateKeysIndexesAndObjectsUsingBlock:](self, "enumerateKeysIndexesAndObjectsUsingBlock:", v6);
  objc_msgSend(v4, "appendString:", CFSTR(">"));

  return v4;
}

uint64_t __32__EFMutableIndexMap_description__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR(" (i=%llu, key=%lld, object=%@)"), a3, a2, a4);
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_tuples, "count");
}

- (void)addKey:(int64_t)a3 atIndex:(unint64_t)a4
{
  -[EFMutableIndexMap addKey:atIndex:object:](self, "addKey:atIndex:object:", a3, a4, 0);
}

- (void)addKey:(int64_t)a3 atIndex:(unint64_t)a4 object:(id)a5
{
  _EFMutableIndexMapTuple *v9;
  unint64_t v10;
  void *v11;
  NSMutableDictionary *keyToTuple;
  void *v13;
  _EFMutableIndexMapTuple *v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  NSMutableDictionary *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a5;
  v9 = objc_alloc_init(_EFMutableIndexMapTuple);
  -[_EFMutableIndexMapTuple setIndex:](v9, "setIndex:", a4);
  -[_EFMutableIndexMapTuple setKey:](v9, "setKey:", a3);
  -[_EFMutableIndexMapTuple setObject:](v9, "setObject:", v22);
  v10 = -[NSMutableArray ef_indexWhereObjectWouldBeInserted:usingComparator:](self->_tuples, "ef_indexWhereObjectWouldBeInserted:usingComparator:", v9, &__block_literal_global_10);
  if (v10 && v10 <= -[EFMutableIndexMap count](self, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_tuples, "objectAtIndex:", v10 - 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (kCompareTuples_block_invoke((uint64_t)v11, v9, v11))
    {
      -[NSMutableArray insertObject:atIndex:](self->_tuples, "insertObject:atIndex:", v9, v10);
    }
    else
    {
      keyToTuple = self->_keyToTuple;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v11, "key"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](keyToTuple, "removeObjectForKey:", v13);

      v14 = v11;
      -[_EFMutableIndexMapTuple setKey:](v14, "setKey:", a3);
      -[_EFMutableIndexMapTuple setObject:](v14, "setObject:", v22);
      if (-[_EFMutableIndexMapTuple index](v14, "index") != a4)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFMutableIndexMap.m"), 82, CFSTR("This tuple should already be at the correct index"));

      }
      v9 = v14;
    }

  }
  else
  {
    -[NSMutableArray insertObject:atIndex:](self->_tuples, "insertObject:atIndex:", v9, v10);
  }
  v15 = self->_keyToTuple;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](v15, "objectForKey:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFMutableIndexMap.m"), 90, CFSTR("This key already exists"));

  }
  v18 = self->_keyToTuple;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v9, v19);

}

- (BOOL)removeKeyAtIndex:(unint64_t)a3
{
  _EFMutableIndexMapTuple *v5;
  uint64_t v6;
  void *v7;
  NSMutableDictionary *keyToTuple;
  void *v9;

  v5 = objc_alloc_init(_EFMutableIndexMapTuple);
  -[_EFMutableIndexMapTuple setIndex:](v5, "setIndex:", a3);
  v6 = -[NSMutableArray ef_indexOfObject:usingComparator:](self->_tuples, "ef_indexOfObject:usingComparator:", v5, &__block_literal_global_10);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray objectAtIndex:](self->_tuples, "objectAtIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    keyToTuple = self->_keyToTuple;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v7, "key"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](keyToTuple, "removeObjectForKey:", v9);

    -[NSMutableArray removeObjectAtIndex:](self->_tuples, "removeObjectAtIndex:", v6);
  }

  return v6 != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)removeAllKeys
{
  -[NSMutableArray removeAllObjects](self->_tuples, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_keyToTuple, "removeAllObjects");
}

- (void)enumerateKeysAndIndexesUsingBlock:(id)a3
{
  id v4;
  NSMutableArray *tuples;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  tuples = self->_tuples;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__EFMutableIndexMap_enumerateKeysAndIndexesUsingBlock___block_invoke;
  v7[3] = &unk_1E62A61E8;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](tuples, "enumerateObjectsUsingBlock:", v7);

}

void __55__EFMutableIndexMap_enumerateKeysAndIndexesUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;

  v6 = a2;
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v6, "key"), objc_msgSend(v6, "index"), a4);

}

- (void)enumerateKeysIndexesAndObjectsUsingBlock:(id)a3
{
  id v4;
  NSMutableArray *tuples;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  tuples = self->_tuples;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__EFMutableIndexMap_enumerateKeysIndexesAndObjectsUsingBlock___block_invoke;
  v7[3] = &unk_1E62A61E8;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](tuples, "enumerateObjectsUsingBlock:", v7);

}

void __62__EFMutableIndexMap_enumerateKeysIndexesAndObjectsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v6 = a2;
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v8 = objc_msgSend(v6, "key");
  v9 = objc_msgSend(v11, "index");
  objc_msgSend(v11, "object");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *, uint64_t))(v7 + 16))(v7, v8, v9, v10, a4);

}

- (int64_t)keyAtIndex:(unint64_t)a3
{
  _EFMutableIndexMapTuple *v6;
  uint64_t v7;
  void *v8;
  int64_t v9;
  void *v11;

  v6 = objc_alloc_init(_EFMutableIndexMapTuple);
  -[_EFMutableIndexMapTuple setIndex:](v6, "setIndex:", a3);
  v7 = -[NSMutableArray ef_indexOfObject:usingComparator:](self->_tuples, "ef_indexOfObject:usingComparator:", v6, &__block_literal_global_10);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFMutableIndexMap.m"), 127, CFSTR("No key found at index %llu, check before with hasKeyAtIndex or get your math right!"), a3);

  }
  -[NSMutableArray objectAtIndexedSubscript:](self->_tuples, "objectAtIndexedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "key");

  return v9;
}

- (BOOL)hasKeyAtIndex:(unint64_t)a3
{
  _EFMutableIndexMapTuple *v5;

  v5 = objc_alloc_init(_EFMutableIndexMapTuple);
  -[_EFMutableIndexMapTuple setIndex:](v5, "setIndex:", a3);
  LOBYTE(self) = -[NSMutableArray ef_indexOfObject:usingComparator:](self->_tuples, "ef_indexOfObject:usingComparator:", v5, &__block_literal_global_10) != 0x7FFFFFFFFFFFFFFFLL;

  return (char)self;
}

- (id)_tupleForKey:(int64_t)a3
{
  NSMutableDictionary *keyToTuple;
  void *v7;
  void *v8;
  void *v10;
  void *v11;

  keyToTuple = self->_keyToTuple;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](keyToTuple, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFMutableIndexMap.m"), 140, CFSTR("Could not find key %@"), v11);

  }
  return v8;
}

- (unint64_t)indexOfKey:(int64_t)a3
{
  void *v3;
  unint64_t v4;

  -[EFMutableIndexMap _tupleForKey:](self, "_tupleForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "index");

  return v4;
}

- (id)objectForInt64Key:(int64_t)a3
{
  void *v3;
  void *v4;

  -[EFMutableIndexMap _tupleForKey:](self, "_tupleForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setObject:(id)a3 forKey:(int64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  -[EFMutableIndexMap _tupleForKey:](self, "_tupleForKey:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:", v7);

}

- (void)shiftKeysStartingAtIndex:(unint64_t)a3 by:(int64_t)a4
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  unint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  _EFMutableIndexMapTuple *v17;
  _EFMutableIndexMapTuple *v18;

  v7 = -[NSMutableArray count](self->_tuples, "count");
  if (a4 && v7)
  {
    if (a4 < 0)
    {
      if (-a4 > (uint64_t)a3)
        v8 = (~(a4 + a3) + a3) & ~((uint64_t)(~(a4 + a3) + a3) >> 63);
      else
        v8 = a3 - 1;
      v17 = objc_alloc_init(_EFMutableIndexMapTuple);
      -[_EFMutableIndexMapTuple setIndex:](v17, "setIndex:", (a4 + a3) & ~((uint64_t)(a4 + a3) >> 63));
      v9 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_tuples, "indexOfObject:inSortedRange:options:usingComparator:", v17, 0, -[NSMutableArray count](self->_tuples, "count"), 1280, &__block_literal_global_10);
      -[_EFMutableIndexMapTuple setIndex:](v17, "setIndex:", v8);
      v10 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_tuples, "indexOfObject:inSortedRange:options:usingComparator:", v17, 0, -[NSMutableArray count](self->_tuples, "count"), 1280, &__block_literal_global_10);
      if (v10 == -[NSMutableArray count](self->_tuples, "count")
        || v10 < -[NSMutableArray count](self->_tuples, "count")
        && (-[NSMutableArray objectAtIndexedSubscript:](self->_tuples, "objectAtIndexedSubscript:", v10),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v12 = objc_msgSend(v11, "index"),
            v11,
            v12 > v8))
      {
        --v10;
      }
      -[NSMutableArray removeObjectsInRange:](self->_tuples, "removeObjectsInRange:", v9, v10 - v9 + 1);

    }
    v18 = objc_alloc_init(_EFMutableIndexMapTuple);
    -[_EFMutableIndexMapTuple setIndex:](v18, "setIndex:", a3);
    for (i = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_tuples, "indexOfObject:inSortedRange:options:usingComparator:", v18, 0, -[NSMutableArray count](self->_tuples, "count"), 1280, &__block_literal_global_10); i < -[NSMutableArray count](self->_tuples, "count"); ++i)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_tuples, "objectAtIndexedSubscript:", i);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "index");

      -[NSMutableArray objectAtIndexedSubscript:](self->_tuples, "objectAtIndexedSubscript:", i);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setIndex:", (v15 + a4) & ~((v15 + a4) >> 63));

    }
  }
}

- (NSMutableArray)tuples
{
  return self->_tuples;
}

- (void)setTuples:(id)a3
{
  objc_storeStrong((id *)&self->_tuples, a3);
}

- (NSMutableDictionary)keyToTuple
{
  return self->_keyToTuple;
}

- (void)setKeyToTuple:(id)a3
{
  objc_storeStrong((id *)&self->_keyToTuple, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyToTuple, 0);
  objc_storeStrong((id *)&self->_tuples, 0);
}

@end
