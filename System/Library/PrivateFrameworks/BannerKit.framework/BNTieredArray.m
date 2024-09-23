@implementation BNTieredArray

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  void *v8;
  unint64_t v9;

  -[BNTieredArray allObjects](self, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", a3, a4, a5);

  return v9;
}

- (unint64_t)count
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_collections;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "count", (_QWORD)v9);
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)tierCount
{
  return -[NSMutableArray count](self->_collections, "count");
}

- (id)topObject
{
  return -[BNTieredArray topObjectInTier:](self, "topObjectInTier:", 0);
}

- (NSArray)topObjectFromEachTier
{
  id v3;
  unint64_t v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[BNTieredArray tierCount](self, "tierCount"))
  {
    v4 = 0;
    do
    {
      -[BNTieredArray topObjectInTier:](self, "topObjectInTier:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v5);

      ++v4;
    }
    while (v4 < -[BNTieredArray tierCount](self, "tierCount"));
  }
  return (NSArray *)v3;
}

- (NSArray)allObjects
{
  BNTieredArray *v2;
  NSArray *allObjects;
  NSArray *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *v9;
  NSArray *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  allObjects = v2->_allObjects;
  if (!allObjects)
  {
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = v2->_collections;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v5);
          -[NSArray addObjectsFromArray:](v4, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8++), (_QWORD)v12);
        }
        while (v6 != v8);
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

    v9 = v2->_allObjects;
    v2->_allObjects = v4;

    allObjects = v2->_allObjects;
  }
  v10 = allObjects;
  objc_sync_exit(v2);

  return v10;
}

- (id)objectAtIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "tier");
  v6 = objc_msgSend(v4, "item");

  if (v5 >= -[NSMutableArray count](self->_collections, "count")
    || (-[NSMutableArray objectAtIndexedSubscript:](self->_collections, "objectAtIndexedSubscript:", v5),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v6 >= v8))
  {
    v10 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_collections, "objectAtIndexedSubscript:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)indexPathForObject:(id)a3
{
  id v4;
  NSMutableArray *collections;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0x7FFFFFFFFFFFFFFFLL;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0x7FFFFFFFFFFFFFFFLL;
  collections = self->_collections;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __36__BNTieredArray_indexPathForObject___block_invoke;
  v9[3] = &unk_1E7044C10;
  v11 = &v17;
  v6 = v4;
  v10 = v6;
  v12 = &v13;
  -[NSMutableArray enumerateObjectsUsingBlock:](collections, "enumerateObjectsUsingBlock:", v9);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inTier:", v18[3], v14[3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v7;
}

uint64_t __36__BNTieredArray_indexPathForObject___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "indexOfObject:", a1[4]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (void)addObject:(id)a3 incrementingTier:(BOOL)a4 addTierToTop:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  NSMutableArray *collections;
  NSMutableArray *v10;
  NSMutableArray *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSMutableArray *v15;
  id v16;

  v5 = a5;
  v8 = a3;
  if (v8)
  {
    v16 = v8;
    collections = self->_collections;
    if (!collections)
    {
      v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v11 = self->_collections;
      self->_collections = v10;

      collections = self->_collections;
    }
    -[NSMutableArray firstObject](collections, "firstObject");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (a4 || !v12)
    {
      v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v15 = self->_collections;
      if (v5)
        -[NSMutableArray insertObject:atIndex:](v15, "insertObject:atIndex:", v14, 0);
      else
        -[NSMutableArray addObject:](v15, "addObject:", v14);

    }
    else
    {
      v14 = (id)v12;
    }
    objc_msgSend(v14, "addObject:", v16);
    -[BNTieredArray _invalidateAllObjectsCache](self, "_invalidateAllObjectsCache");

    v8 = v16;
  }

}

- (void)insertObject:(id)a3 beneathObject:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  if (v6)
  {
    v9 = v6;
    -[BNTieredArray indexPathForObject:](self, "indexPathForObject:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "item") != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_collections, "objectAtIndexedSubscript:", objc_msgSend(v7, "tier"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "insertObject:atIndex:", v9, objc_msgSend(v7, "item"));
      -[BNTieredArray _invalidateAllObjectsCache](self, "_invalidateAllObjectsCache");

    }
    v6 = v9;
  }

}

- (void)removeObjectAtIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  BOOL v7;
  void *v8;
  NSMutableArray *collections;
  id v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "tier");
  v6 = objc_msgSend(v4, "item");

  if (v5 < -[NSMutableArray count](self->_collections, "count"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_collections, "objectAtIndexedSubscript:", v5);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v6 >= objc_msgSend(v10, "count");
    v8 = v10;
    if (!v7)
    {
      objc_msgSend(v10, "removeObjectAtIndex:", v6);
      if (!objc_msgSend(v10, "count"))
        -[NSMutableArray removeObjectAtIndex:](self->_collections, "removeObjectAtIndex:", v5);
      if (!-[NSMutableArray count](self->_collections, "count"))
      {
        collections = self->_collections;
        self->_collections = 0;

      }
      -[BNTieredArray _invalidateAllObjectsCache](self, "_invalidateAllObjectsCache");
      v8 = v10;
    }

  }
}

- (void)removeObject:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *collections;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0x7FFFFFFFFFFFFFFFLL;
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0x7FFFFFFFFFFFFFFFLL;
    collections = self->_collections;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __30__BNTieredArray_removeObject___block_invoke;
    v8[3] = &unk_1E7044C10;
    v10 = &v12;
    v9 = v4;
    v11 = &v16;
    -[NSMutableArray enumerateObjectsUsingBlock:](collections, "enumerateObjectsUsingBlock:", v8);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inTier:", v13[3], v17[3]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BNTieredArray removeObjectAtIndexPath:](self, "removeObjectAtIndexPath:", v7);

    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }

}

uint64_t __30__BNTieredArray_removeObject___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "indexOfObject:", a1[4]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (id)tierAtIndex:(unint64_t)a3
{
  void *v5;

  if (-[NSMutableArray count](self->_collections, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_collections, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)topObjectInTier:(int64_t)a3
{
  void *v3;
  void *v4;

  -[BNTieredArray tierAtIndex:](self, "tierAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BNTieredArray *v4;
  uint64_t v5;
  NSMutableArray *collections;

  v4 = objc_alloc_init(BNTieredArray);
  v5 = -[NSMutableArray copy](self->_collections, "copy");
  collections = v4->_collections;
  v4->_collections = (NSMutableArray *)v5;

  return v4;
}

- (void)_invalidateAllObjectsCache
{
  NSArray *allObjects;
  BNTieredArray *obj;

  obj = self;
  objc_sync_enter(obj);
  allObjects = obj->_allObjects;
  obj->_allObjects = 0;

  objc_sync_exit(obj);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allObjects, 0);
  objc_storeStrong((id *)&self->_collections, 0);
}

@end
