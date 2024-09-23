@implementation MapsSuggestionsMutableWeakEntries

- (MapsSuggestionsMutableWeakEntries)init
{
  MapsSuggestionsMutableWeakEntries *v2;
  uint64_t v3;
  NSPointerArray *array;
  MapsSuggestionsMutableWeakEntries *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MapsSuggestionsMutableWeakEntries;
  v2 = -[MapsSuggestionsMutableWeakEntries init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v3 = objc_claimAutoreleasedReturnValue();
    array = v2->_array;
    v2->_array = (NSPointerArray *)v3;

    v2->_dirty = 0;
    v5 = v2;
  }

  return v2;
}

- (MapsSuggestionsMutableWeakEntries)initWithEntries:(id)a3
{
  id v4;
  MapsSuggestionsMutableWeakEntries *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  MapsSuggestionsMutableWeakEntries *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[MapsSuggestionsMutableWeakEntries init](self, "init");
  if (v5)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          -[MapsSuggestionsMutableWeakEntries addWeakObject:](v5, "addWeakObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++), (_QWORD)v12);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    -[NSPointerArray compact](v5->_array, "compact");
    v5->_dirty = 0;
    v10 = v5;
  }

  return v5;
}

- (void)addWeakObject:(id)a3
{
  -[NSPointerArray addPointer:](self->_array, "addPointer:", a3);
  self->_dirty = 1;
}

- (unint64_t)count
{
  if (self->_dirty)
  {
    -[NSPointerArray compact](self->_array, "compact");
    self->_dirty = 0;
  }
  return -[NSPointerArray count](self->_array, "count");
}

- (NSArray)strongArray
{
  void *v3;
  NSPointerArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[MapsSuggestionsMutableWeakEntries count](self, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_array;
  v5 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        if (*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7))
          objc_msgSend(v3, "addObject:", (_QWORD)v10);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_array, 0);
}

@end
