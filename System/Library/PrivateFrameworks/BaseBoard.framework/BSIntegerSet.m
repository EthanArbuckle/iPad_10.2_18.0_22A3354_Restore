@implementation BSIntegerSet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hashTable, 0);
}

- (BSIntegerSet)initWithCapacity:(unint64_t)a3
{
  void *v4;
  BSIntegerSet *v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 1282, a3);
  v5 = (BSIntegerSet *)-[BSIntegerSet _initWithHashTable:hasZeroValue:](self, v4, 0);

  return v5;
}

- (_BYTE)_initWithHashTable:(char)a3 hasZeroValue:
{
  id v6;
  id v7;
  objc_super v9;

  v6 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)BSIntegerSet;
    v7 = objc_msgSendSuper2(&v9, sel_init);
    a1 = v7;
    if (v7)
    {
      objc_storeStrong((id *)v7 + 1, a2);
      a1[16] = a3;
    }
  }

  return a1;
}

- (BSIntegerSet)init
{
  return -[BSIntegerSet initWithCapacity:](self, "initWithCapacity:", 8);
}

- (unint64_t)count
{
  _BOOL8 hasZeroValue;

  hasZeroValue = self->_hasZeroValue;
  return NSCountHashTable(self->_hashTable) + hasZeroValue;
}

- (void)enumerateSortedWithBlock:(id)a3
{
  void (**v4)(id, uint64_t, char *);
  int64_t v5;
  void *v6;
  BOOL v7;
  int64_t v8;
  uint64_t *v9;
  uint64_t v10;
  BOOL v11;
  char v12;
  _QWORD v13[6];
  _QWORD v14[4];

  v4 = (void (**)(id, uint64_t, char *))a3;
  v5 = -[BSIntegerSet count](self, "count");
  v6 = malloc_type_malloc(8 * v5, 0x100004000313F17uLL);
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __41__BSIntegerSet_enumerateSortedWithBlock___block_invoke;
  v13[3] = &unk_1E1EC0068;
  v13[4] = v14;
  v13[5] = v6;
  -[BSIntegerSet enumerateWithBlock:](self, "enumerateWithBlock:", v13);
  qsort_b(v6, v5, 8uLL, &__block_literal_global_31);
  v12 = 0;
  v7 = v5 < 1;
  v8 = v5 - 1;
  if (!v7)
  {
    v9 = (uint64_t *)v6;
    do
    {
      v10 = *v9++;
      v4[2](v4, v10, &v12);
      if (v12)
        v11 = 1;
      else
        v11 = v8 == 0;
      --v8;
    }
    while (!v11);
  }
  free(v6);
  _Block_object_dispose(v14, 8);

}

- (void)enumerateWithBlock:(id)a3
{
  void (**v5)(id, _QWORD, char *);
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  char v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD, char *))a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSIntegerSet.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v15 = 0;
  if (!self->_hasZeroValue || (v5[2](v5, 0, &v15), !v15))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[NSHashTable objectEnumerator](self->_hashTable, "objectEnumerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v12;
LABEL_7:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v5[2](v5, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9), &v15);
        if (v15)
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
          if (v7)
            goto LABEL_7;
          break;
        }
      }
    }

  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  BSMutableIntegerSet *v5;
  void *v6;
  _BYTE *v7;

  v5 = +[BSMutableIntegerSet allocWithZone:](BSMutableIntegerSet, "allocWithZone:");
  v6 = (void *)-[NSHashTable copyWithZone:](self->_hashTable, "copyWithZone:", a3);
  v7 = -[BSIntegerSet _initWithHashTable:hasZeroValue:](v5, v6, self->_hasZeroValue);

  return v7;
}

uint64_t __41__BSIntegerSet_enumerateSortedWithBlock___block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(result + 40) + 8 * (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24))++) = a2;
  return result;
}

- (BOOL)containsValue:(int64_t)a3
{
  return !a3 && self->_hasZeroValue || NSHashGet(self->_hashTable, (const void *)a3) != 0;
}

- (BOOL)isEqual:(id)a3
{
  BSIntegerSet *v4;
  BSIntegerSet *v5;
  char v6;

  v4 = (BSIntegerSet *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (!self->_hasZeroValue == v5->_hasZeroValue)
        v6 = 0;
      else
        v6 = -[NSHashTable isEqual:](self->_hashTable, "isEqual:", v5->_hashTable);

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

uint64_t __41__BSIntegerSet_enumerateSortedWithBlock___block_invoke_2(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  if (*a2 < *a3)
    return 0xFFFFFFFFLL;
  else
    return *a2 > *a3;
}

- (unint64_t)hash
{
  return -[NSHashTable hash](self->_hashTable, "hash") + self->_hasZeroValue;
}

- (id)description
{
  return +[BSDescriptionStream descriptionForRootObject:](BSDescriptionStream, "descriptionForRootObject:", self);
}

- (void)enumerateIndexesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__BSIntegerSet_NSIndexSetCompatibility__enumerateIndexesUsingBlock___block_invoke;
  v6[3] = &unk_1E1EC00B0;
  v7 = v4;
  v5 = v4;
  -[BSIntegerSet enumerateWithBlock:](self, "enumerateWithBlock:", v6);

}

uint64_t __68__BSIntegerSet_NSIndexSetCompatibility__enumerateIndexesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enumerateRangesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__BSIntegerSet_NSIndexSetCompatibility__enumerateRangesUsingBlock___block_invoke;
  v6[3] = &unk_1E1EC00B0;
  v7 = v4;
  v5 = v4;
  -[BSIntegerSet enumerateWithBlock:](self, "enumerateWithBlock:", v6);

}

uint64_t __67__BSIntegerSet_NSIndexSetCompatibility__enumerateRangesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
