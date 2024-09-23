@implementation CRKPointerSet

+ (CRKPointerSet)setWithArray:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "addObjectsFromArray:", v3);

  return (CRKPointerSet *)v4;
}

+ (CRKPointerSet)setWithSet:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (CRKPointerSet *)v5;
}

- (CRKPointerSet)init
{
  CRKPointerSet *v2;
  uint64_t v3;
  NSHashTable *mBackingStore;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRKPointerSet;
  v2 = -[CRKPointerSet init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 512);
    v3 = objc_claimAutoreleasedReturnValue();
    mBackingStore = v2->mBackingStore;
    v2->mBackingStore = (NSHashTable *)v3;

  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
    v7 = -[NSHashTable isEqualToHashTable:](self->mBackingStore, "isEqualToHashTable:", v6[1]);
  else
    v7 = 0;

  return v7;
}

- (unint64_t)hash
{
  return -[NSHashTable hash](self->mBackingStore, "hash");
}

- (void)addObject:(id)a3
{
  -[NSHashTable addObject:](self->mBackingStore, "addObject:", a3);
}

- (void)addObjectsFromArray:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[CRKPointerSet addObject:](self, "addObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)removeObject:(id)a3
{
  -[NSHashTable removeObject:](self->mBackingStore, "removeObject:", a3);
}

- (void)removeAllObjects
{
  -[NSHashTable removeAllObjects](self->mBackingStore, "removeAllObjects");
}

- (BOOL)containsObject:(id)a3
{
  return -[NSHashTable containsObject:](self->mBackingStore, "containsObject:", a3);
}

- (BOOL)isSubsetOfSet:(id)a3
{
  return -[NSHashTable isSubsetOfHashTable:](self->mBackingStore, "isSubsetOfHashTable:", *((_QWORD *)a3 + 1));
}

- (int64_t)count
{
  return -[NSHashTable count](self->mBackingStore, "count");
}

- (NSArray)allObjects
{
  return -[NSHashTable allObjects](self->mBackingStore, "allObjects");
}

- (id)setBySubtractingSet:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (_QWORD *)objc_opt_new();
  v6 = -[NSHashTable copy](self->mBackingStore, "copy");
  v7 = (void *)v5[1];
  v5[1] = v6;

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v5, "removeObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12++), (_QWORD)v14);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  return v5;
}

- (id)setByIntersectingSet:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  v5 = (_QWORD *)objc_opt_new();
  v6 = -[NSHashTable copy](self->mBackingStore, "copy");
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = (void *)v5[1];
  v9 = v4[1];

  objc_msgSend(v8, "intersectHashTable:", v9);
  return v5;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSHashTable countByEnumeratingWithState:objects:count:](self->mBackingStore, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBackingStore, 0);
}

@end
