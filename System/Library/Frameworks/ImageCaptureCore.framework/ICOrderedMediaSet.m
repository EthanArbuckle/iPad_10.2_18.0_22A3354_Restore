@implementation ICOrderedMediaSet

- (ICOrderedMediaSet)initWithTypes:(id)a3
{
  id v4;
  ICOrderedMediaSet *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *mediaItems;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ICOrderedMediaSet;
  v5 = -[ICOrderedMediaSet init](&v20, sel_init);
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    mediaItems = v5->_mediaItems;
    v5->_mediaItems = v6;

    v5->_mediaLock._os_unfair_lock_opaque = 0;
    if (v4)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v8 = v4;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v17;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12);
            objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet", (_QWORD)v16);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_mediaItems, "setObject:forKeyedSubscript:", v14, v13);

            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        }
        while (v10);
      }

    }
  }

  return v5;
}

- (unint64_t)mediaItemCount
{
  os_unfair_lock_s *p_mediaLock;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_mediaLock = &self->_mediaLock;
  os_unfair_lock_lock(&self->_mediaLock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMutableDictionary allKeys](self->_mediaItems, "allKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_mediaItems, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v7 += objc_msgSend(v10, "count");

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  os_unfair_lock_unlock(p_mediaLock);
  return v7;
}

- (void)addMediaItemToIndex:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  os_unfair_lock_s *p_mediaLock;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "mediaItemType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_msgSend(v4, "unsignedIntegerValue");
    objc_msgSend(v4, "mediaItemType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICOrderedMediaSet mediaItemWithHandle:inTypes:](self, "mediaItemWithHandle:inTypes:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      p_mediaLock = &self->_mediaLock;
      os_unfair_lock_lock(&self->_mediaLock);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_mediaItems, "objectForKeyedSubscript:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v13 = objc_msgSend(v11, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, objc_msgSend(v11, "count"), 1024, &__block_literal_global_3);
        if (v13 != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v12, "insertObject:atIndex:", v4, v13);
      }
      os_unfair_lock_unlock(p_mediaLock);

    }
  }

}

uint64_t __41__ICOrderedMediaSet_addMediaItemToIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(a2, "unsignedIntegerValue");
  v6 = objc_msgSend(v4, "unsignedIntegerValue");

  v7 = -1;
  if (v6 <= v5)
    v7 = 1;
  if (v6 == v5)
    return 0;
  else
    return v7;
}

- (BOOL)removeMediaItemFromIndex:(id)a3
{
  id v4;
  void *v5;
  os_unfair_lock_s *p_mediaLock;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  objc_msgSend(v4, "mediaItemType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    p_mediaLock = &self->_mediaLock;
    os_unfair_lock_lock(&self->_mediaLock);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_mediaItems, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = v7 != 0;
    if (v7)
      objc_msgSend(v7, "removeObject:", v4);
    os_unfair_lock_unlock(p_mediaLock);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)removeMediaItemsFromIndex:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  v6 = v5;
  if (v5)
  {
    v7 = *(_QWORD *)v12;
    v8 = v5;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        -[ICOrderedMediaSet removeMediaItemFromIndex:](self, "removeMediaItemFromIndex:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++));
      }
      while (v8 != v9);
      v8 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  return v6 != 0;
}

- (BOOL)removeMediaItemWithHandleFromIndex:(unint64_t)a3
{
  void *v4;

  -[ICOrderedMediaSet mediaItemWithHandle:inTypes:](self, "mediaItemWithHandle:inTypes:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[ICOrderedMediaSet removeMediaItemFromIndex:](self, "removeMediaItemFromIndex:", v4);

  return v4 != 0;
}

- (void)removeAllItems
{
  os_unfair_lock_s *p_mediaLock;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  p_mediaLock = &self->_mediaLock;
  os_unfair_lock_lock(&self->_mediaLock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSMutableDictionary allKeys](self->_mediaItems, "allKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_mediaItems, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeAllObjects");

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(p_mediaLock);
}

- (id)mediaItemWithHandle:(unint64_t)a3 inTypes:(id)a4
{
  id v6;
  os_unfair_lock_s *p_mediaLock;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  p_mediaLock = &self->_mediaLock;
  os_unfair_lock_lock(&self->_mediaLock);
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[NSMutableDictionary allKeys](self->_mediaItems, "allKeys");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v19 = v6;
    v11 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(obj);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_mediaItems, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v13, "indexOfObject:inSortedRange:options:usingComparator:", v15, 0, v14, 256, &__block_literal_global_4);

        if (v16 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_14;
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v10)
        continue;
      break;
    }
    v17 = 0;
LABEL_14:
    p_mediaLock = &self->_mediaLock;
    v6 = v19;
  }
  else
  {
    v17 = 0;
  }

  os_unfair_lock_unlock(p_mediaLock);
  return v17;
}

uint64_t __49__ICOrderedMediaSet_mediaItemWithHandle_inTypes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(a2, "unsignedIntegerValue");
  v6 = objc_msgSend(v4, "unsignedIntegerValue");

  v7 = -1;
  if (v6 <= v5)
    v7 = 1;
  if (v6 == v5)
    return 0;
  else
    return v7;
}

- (id)orderedSetForType:(id)a3
{
  os_unfair_lock_s *p_mediaLock;
  id v5;
  void *v6;
  void *v7;

  if (a3)
  {
    p_mediaLock = &self->_mediaLock;
    v5 = a3;
    os_unfair_lock_lock(p_mediaLock);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_mediaItems, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(v6, "copy");
    os_unfair_lock_unlock(p_mediaLock);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)arrayForType:(id)a3
{
  os_unfair_lock_s *p_mediaLock;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    p_mediaLock = &self->_mediaLock;
    v5 = a3;
    os_unfair_lock_lock(p_mediaLock);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_mediaItems, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

    os_unfair_lock_unlock(p_mediaLock);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)performSelector:(id)a3 onTypes:(id)a4
{
  id v6;
  SEL v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = NSSelectorFromString((NSString *)a3);
  os_unfair_lock_lock(&self->_mediaLock);
  v19 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[NSMutableDictionary allKeys](self->_mediaItems, "allKeys");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(obj);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_mediaItems, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v22;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v22 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
              if ((objc_opt_respondsToSelector() & 1) != 0)
                objc_msgSend(v18, "performSelector:", v7);
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v15);
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v10);
  }

  os_unfair_lock_unlock(&self->_mediaLock);
}

- (os_unfair_lock_s)mediaLock
{
  return self->_mediaLock;
}

- (void)setMediaLock:(os_unfair_lock_s)a3
{
  self->_mediaLock = a3;
}

- (NSMutableDictionary)mediaItems
{
  return self->_mediaItems;
}

- (void)setMediaItems:(id)a3
{
  objc_storeStrong((id *)&self->_mediaItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaItems, 0);
}

@end
