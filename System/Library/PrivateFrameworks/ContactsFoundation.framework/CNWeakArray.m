@implementation CNWeakArray

- (CNWeakArray)init
{
  CNWeakArray *v2;
  uint64_t v3;
  NSPointerArray *storage;
  CNWeakArray *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNWeakArray;
  v2 = -[CNWeakArray init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v3 = objc_claimAutoreleasedReturnValue();
    storage = v2->_storage;
    v2->_storage = (NSPointerArray *)v3;

    v5 = v2;
  }

  return v2;
}

- (int64_t)count
{
  return -[NSPointerArray count](self->_storage, "count");
}

- (NSArray)allObjects
{
  return -[NSPointerArray allObjects](self->_storage, "allObjects");
}

- (void)compact
{
  -[NSPointerArray compact](self->_storage, "compact");
}

- (void)addObject:(id)a3
{
  -[NSPointerArray addPointer:](self->_storage, "addPointer:", a3);
}

- (void)removeObject:(id)a3
{
  unint64_t v4;
  id v5;

  v5 = a3;
  if (-[NSPointerArray count](self->_storage, "count"))
  {
    v4 = 0;
    do
    {
      if (-[NSPointerArray pointerAtIndex:](self->_storage, "pointerAtIndex:", v4) == v5)
        -[NSPointerArray replacePointerAtIndex:withPointer:](self->_storage, "replacePointerAtIndex:withPointer:", v4, 0);
      ++v4;
    }
    while (v4 < -[NSPointerArray count](self->_storage, "count"));
  }

}

- (void)removeAllObjects
{
  -[NSPointerArray setCount:](self->_storage, "setCount:", 0);
}

- (void)setArray:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNWeakArray removeAllObjects](self, "removeAllObjects");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[CNWeakArray addObject:](self, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSPointerArray countByEnumeratingWithState:objects:count:](self->_storage, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
