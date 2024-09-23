@implementation BRCMinHeap

- (BRCMinHeap)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[BRCMinHeap init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Don't call %@."), v5);

  return 0;
}

- (BRCMinHeap)initWithComparator:(id)a3
{
  id v4;
  BRCMinHeap *v5;
  uint64_t v6;
  id comparator;
  uint64_t v8;
  NSMapTable *objects;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BRCMinHeap;
  v5 = -[BRCMinHeap init](&v11, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x1D17A6DB0](v4);
    comparator = v5->_comparator;
    v5->_comparator = (id)v6;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    objects = v5->_objects;
    v5->_objects = (NSMapTable *)v8;

  }
  return v5;
}

- (id)description
{
  void *v3;
  unint64_t v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 32);
  objc_msgSend(v3, "appendFormat:", CFSTR("<BRCMinHeap %p objects:%@ array:["), self, self->_objects);
  if (self->_size)
  {
    v4 = 0;
    do
    {
      objc_msgSend(v3, "appendFormat:", CFSTR("%p:%@, "), self->_array[v4], self->_array[v4]);
      ++v4;
    }
    while (v4 < self->_size);
  }
  objc_msgSend(v3, "appendString:", CFSTR("]>"));
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[BRCMinHeap removeAllObjects](self, "removeAllObjects");
  free(self->_array);
  v3.receiver = self;
  v3.super_class = (Class)BRCMinHeap;
  -[BRCMinHeap dealloc](&v3, sel_dealloc);
}

- (void)_shrink
{
  unint64_t count;
  unint64_t size;
  id *v5;
  unint64_t v6;

  count = self->_count;
  if (count >= 8)
  {
    size = self->_size;
    if (size >= 4 * count)
    {
      v5 = (id *)malloc_type_realloc(self->_array, 4 * (size & 0x1FFFFFFFFFFFFFFFLL), 0x386AD65FuLL);
      v6 = self->_size >> 1;
      self->_array = v5;
      self->_size = v6;
    }
  }
}

- (BOOL)check
{
  unint64_t count;
  uint64_t v4;
  void *v5;
  void *v6;

  count = self->_count;
  if (count == -[NSMapTable count](self->_objects, "count"))
  {
    if (!self->_count)
      return 1;
    v4 = 0;
    while (self->_array[v4])
    {
      -[NSMapTable objectForKey:](self->_objects, "objectForKey:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (!v5 || v4 != objc_msgSend(v5, "unsignedIntegerValue"))
        goto LABEL_10;

      if (++v4 >= self->_count)
        return 1;
    }
    v6 = 0;
LABEL_10:

  }
  return 0;
}

- (void)_moveUp:(id)a3 index:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  NSMapTable *objects;
  void *v11;
  id v12;
  BRCMinHeap *v13;
  void *v14;
  NSMapTable *v15;
  void *v16;
  BRCMinHeap *v17;
  void *v18;
  id v19;

  v6 = a3;
  if (a4)
  {
    while (1)
    {
      v7 = a4 - 1;
      v8 = (a4 - 1) >> 1;
      v9 = self->_array[v8];
      if ((*((uint64_t (**)(void))self->_comparator + 2))() <= 0)
        break;
      self->_array[a4] = v9;
      objects = self->_objects;
      v11 = (void *)MEMORY[0x1E0CB37E8];
      v12 = v9;
      v13 = self;
      objc_msgSend(v11, "numberWithUnsignedInteger:", a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](objects, "setObject:forKey:", v14, v12);

      a4 = v8;
      if (v7 <= 1)
        goto LABEL_7;
    }

    v8 = a4;
  }
  else
  {
    v8 = 0;
  }
LABEL_7:
  self->_array[v8] = v6;
  v15 = self->_objects;
  v16 = (void *)MEMORY[0x1E0CB37E8];
  v19 = v6;
  v17 = self;
  objc_msgSend(v16, "numberWithUnsignedInteger:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](v15, "setObject:forKey:", v18, v19);

}

- (void)_moveDown:(id)a3 index:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t count;
  id *array;
  id v13;
  NSMapTable *objects;
  void *v15;
  id v16;
  BRCMinHeap *v17;
  void *v18;
  NSMapTable *v19;
  void *v20;
  BRCMinHeap *v21;
  void *v22;
  id v23;

  v6 = a3;
  v7 = (2 * a4) | 1;
  if (v7 < self->_count)
  {
    v8 = 2 * a4;
    while (1)
    {
      v9 = (*((uint64_t (**)(void))self->_comparator + 2))();
      v10 = v8 + 2;
      count = self->_count;
      if (v9 < 0)
      {
        if (v8 + 2 >= count || ((*((uint64_t (**)(void))self->_comparator + 2))() & 0x8000000000000000) == 0)
          v10 = v7;
      }
      else
      {
        if (v8 + 2 >= count)
          break;
        if ((*((uint64_t (**)(void))self->_comparator + 2))() >= 0)
          v10 = a4;
      }
      if (v10 == a4)
        break;
      array = self->_array;
      v13 = array[v10];
      array[a4] = v13;
      objects = self->_objects;
      v15 = (void *)MEMORY[0x1E0CB37E8];
      v16 = v13;
      v17 = self;
      objc_msgSend(v15, "numberWithUnsignedInteger:", a4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](objects, "setObject:forKey:", v18, v16);

      v8 = 2 * v10;
      v7 = (2 * v10) | 1;
      a4 = v10;
      if (v7 >= self->_count)
        goto LABEL_15;
    }
  }
  v10 = a4;
LABEL_15:
  self->_array[v10] = v6;
  v19 = self->_objects;
  v20 = (void *)MEMORY[0x1E0CB37E8];
  v23 = v6;
  v21 = self;
  objc_msgSend(v20, "numberWithUnsignedInteger:", v10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](v19, "setObject:forKey:", v22, v23);

}

- (void)_moveUpOrDown:(id)a3 index:(unint64_t)a4
{
  uint64_t v6;
  BOOL v7;
  void *v8;
  BRCMinHeap *v9;
  id v10;
  unint64_t v11;
  NSMapTable *objects;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v16 = a3;
  if (a4)
  {
    v6 = (*((uint64_t (**)(void))self->_comparator + 2))();
    if (v6 == 1)
    {
      -[BRCMinHeap _moveUp:index:](self, "_moveUp:index:", v16, a4);
      goto LABEL_11;
    }
    if (!v6)
    {
      self->_array[a4] = v16;
      objects = self->_objects;
      v13 = (void *)MEMORY[0x1E0CB37E8];
      v14 = v16;
      objc_msgSend(v13, "numberWithUnsignedInteger:", a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](objects, "setObject:forKey:", v15, v14);

      goto LABEL_11;
    }
    v7 = v6 == -1;
    v8 = v16;
    if (!v7)
      goto LABEL_12;
    v9 = self;
    v10 = v16;
    v11 = a4;
  }
  else
  {
    v9 = self;
    v10 = v16;
    v11 = 0;
  }
  -[BRCMinHeap _moveDown:index:](v9, "_moveDown:index:", v10, v11);
LABEL_11:
  v8 = v16;
LABEL_12:

}

- (id)firstObject
{
  if (self->_count)
    return *self->_array;
  else
    return 0;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  id *array;

  if (a3->var0)
    return 0;
  array = self->_array;
  a3->var0 = 1;
  a3->var1 = array;
  a3->var2 = &self->_mutation;
  return self->_count;
}

- (BOOL)containsObject:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMapTable objectForKey:](self->_objects, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)addObject:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t size;
  unint64_t v8;
  id *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_objects, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[BRCMinHeap addObject:].cold.1((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);

  }
  v6 = self->_count + 1;
  size = self->_size;
  if (v6 > size)
  {
    v8 = ((3 * size) >> 1) + 4;
    v9 = (id *)malloc_type_realloc(self->_array, 8 * v8, 0x80040B8603338uLL);
    self->_array = v9;
    bzero(&v9[self->_size], 8 * (v8 - self->_size));
    self->_size = v8;
    v6 = self->_count + 1;
  }
  self->_count = v6;
  -[BRCMinHeap _moveUp:index:](self, "_moveUp:index:", v4);
  ++self->_mutation;

}

- (void)removeObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id *array;
  unint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_objects, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "unsignedIntegerValue");
    if (self->_array[v7] != v4)
    {
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[BRCMinHeap removeObject:].cold.1((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);

    }
    -[NSMapTable removeObjectForKey:](self->_objects, "removeObjectForKey:", v4);
    array = self->_array;
    v9 = self->_count - 1;
    self->_count = v9;
    v10 = array[v9];

    self->_array[self->_count] = 0;
    if (v7 != self->_count)
      -[BRCMinHeap _moveUpOrDown:index:](self, "_moveUpOrDown:index:", v10, v7);
    -[BRCMinHeap _shrink](self, "_shrink");
  }
  else
  {
    v10 = v4;
  }
  ++self->_mutation;

}

- (void)removeFirstObject
{
  unint64_t count;
  id *array;
  unint64_t v5;
  id v6;
  id v7;
  NSMapTable *objects;
  BRCMinHeap *v9;

  count = self->_count;
  if (count)
  {
    array = self->_array;
    v5 = count - 1;
    self->_count = v5;
    v6 = array[v5];
    v7 = *self->_array;
    objects = self->_objects;
    v9 = self;
    -[NSMapTable removeObjectForKey:](objects, "removeObjectForKey:", v7);

    self->_array[self->_count] = 0;
    if (self->_count)
      -[BRCMinHeap _moveDown:index:](v9, "_moveDown:index:", v6, 0);
    -[BRCMinHeap _shrink](v9, "_shrink");

  }
  ++self->_mutation;
}

- (void)removeAllObjects
{
  unint64_t v3;

  -[NSMapTable removeAllObjects](self->_objects, "removeAllObjects");
  if (self->_count)
  {
    v3 = 0;
    do
      self->_array[v3++] = 0;
    while (v3 < self->_count);
  }
  self->_count = 0;
  ++self->_mutation;
}

- (void)firstObjectWeightChanged
{
  -[BRCMinHeap _moveDown:index:](self, "_moveDown:index:", *self->_array, 0);
  ++self->_mutation;
}

- (void)objectWeightChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_objects, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "unsignedIntegerValue");
    if (self->_array[v7] != v4)
    {
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        -[BRCMinHeap removeObject:].cold.1((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);

    }
    -[BRCMinHeap _moveUpOrDown:index:](self, "_moveUpOrDown:index:", v4, v7);
  }
  ++self->_mutation;

}

- (unint64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong(&self->_comparator, 0);
}

- (void)addObject:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, a2, a3, "[CRIT] Assertion failed: _getIndex(self, o) == nil%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)removeObject:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, a2, a3, "[CRIT] Assertion failed: _array[index] == o%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
