@implementation BSOrderedDictionary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyOrderingStrategy, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

- (void)enumerateKeysAndObjectsWithIndexesUsingBlock:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  unsigned __int8 v12;

  v5 = -[BSOrderedDictionary count](self, "count");
  v6 = v5 - 1;
  if (v5 >= 1)
  {
    v7 = 0;
    do
    {
      -[NSArray objectAtIndex:](self->_keys, "objectAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKey:](self->_values, "objectForKey:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      (*((void (**)(id, void *, void *, uint64_t, unsigned __int8 *))a3 + 2))(a3, v8, v9, v7, &v12);
      v10 = v12;

      if (v10)
        break;
    }
    while (v6 != v7++);
  }
}

- (id)objectForKey:(id)a3
{
  return -[NSDictionary objectForKey:](self->_values, "objectForKey:", a3);
}

- (unint64_t)count
{
  return -[NSArray count](self->_keys, "count");
}

- (id)_initTabulaRasa
{
  BSOrderedDictionary *v3;
  uint64_t v4;
  void *v6;
  id v7;
  objc_class *v8;
  uint64_t v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  BSOrderedDictionary *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)BSOrderedDictionary;
  v3 = -[BSOrderedDictionary init](&v11, sel_init);
  v4 = objc_opt_class();
  if (v4 != objc_opt_class() && v4 != objc_opt_class() && v4 != objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("subclassing not permitted"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v13 = v7;
      v14 = 2114;
      v10 = (void *)v9;
      v15 = v9;
      v16 = 2048;
      v17 = v3;
      v18 = 2114;
      v19 = CFSTR("BSOrderedDictionary.m");
      v20 = 1024;
      v21 = 124;
      v22 = 2114;
      v23 = v6;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1BFCC4);
  }
  return v3;
}

- (BSOrderedDictionary)init
{
  BSOrderedDictionary *v3;

  +[_BSEmptyOrderedDictionary emptyDictionary]();
  v3 = (BSOrderedDictionary *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)_initWithCopyOfOrderedDictionary:(void *)a1
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (!a1)
    return 0;
  v3 = objc_msgSend(a1, "_initTabulaRasa");
  if (v3)
  {
    v4 = objc_msgSend(a2[1], "copy");
    v5 = *(void **)(v3 + 8);
    *(_QWORD *)(v3 + 8) = v4;

    v6 = objc_msgSend(a2[2], "copy");
    v7 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = v6;

    objc_storeStrong((id *)(v3 + 24), a2[3]);
  }
  return v3;
}

- (BSOrderedDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  BSMutableOrderedDictionary *v6;
  BSOrderedDictionary *v7;

  v6 = -[BSMutableOrderedDictionary initWithObjects:forKeys:count:]([BSMutableOrderedDictionary alloc], "initWithObjects:forKeys:count:", a3, a4, a5);
  v7 = (BSOrderedDictionary *)-[BSMutableOrderedDictionary copy](v6, "copy");

  return v7;
}

- (BSOrderedDictionary)initWithDictionary:(id)a3 keyOrderingStrategy:(id)a4
{
  BSMutableOrderedDictionary *v5;
  BSOrderedDictionary *v6;

  v5 = -[BSMutableOrderedDictionary initWithDictionary:keyOrderingStrategy:]([BSMutableOrderedDictionary alloc], "initWithDictionary:keyOrderingStrategy:", a3, a4);
  v6 = (BSOrderedDictionary *)-[BSMutableOrderedDictionary copy](v5, "copy");

  return v6;
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_keys, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v5;
  char v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = a3;
  if ((-[NSArray isEqual:](self->_keys, "isEqual:", v5[1]) & 1) != 0)
    v6 = -[NSDictionary isEqual:](self->_values, "isEqual:", v5[2]);
  else
    v6 = 0;

  return v6;
}

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:](BSDescriptionStream, "descriptionForRootObject:", self);
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__BSOrderedDictionary_enumerateKeysAndObjectsUsingBlock___block_invoke;
  v3[3] = &unk_1E1EC02B0;
  v3[4] = a3;
  -[BSOrderedDictionary enumerateKeysAndObjectsWithIndexesUsingBlock:](self, "enumerateKeysAndObjectsWithIndexesUsingBlock:", v3);
}

uint64_t __57__BSOrderedDictionary_enumerateKeysAndObjectsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)filter:(id)a3
{
  uint64_t v5;
  BSMutableOrderedDictionary *v6;
  uint64_t i;
  void *v8;
  void *v9;

  v5 = -[BSOrderedDictionary count](self, "count");
  v6 = -[BSMutableOrderedDictionary initWithCapacity:keyOrderingStrategy:]([BSMutableOrderedDictionary alloc], "initWithCapacity:keyOrderingStrategy:", v5, self->_keyOrderingStrategy);
  if (v5 >= 1)
  {
    for (i = 0; i != v5; ++i)
    {
      -[NSArray objectAtIndex:](self->_keys, "objectAtIndex:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKey:](self->_values, "objectForKey:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((*((unsigned int (**)(id, void *, void *, uint64_t))a3 + 2))(a3, v8, v9, i))
        -[BSMutableOrderedDictionary setObject:forKey:](v6, "setObject:forKey:", v8, v9);

    }
  }
  return v6;
}

- (id)unorderedDictionary
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[BSOrderedDictionary count](self, "count"));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__BSOrderedDictionary_unorderedDictionary__block_invoke;
  v7[3] = &unk_1E1EC02D8;
  v4 = v3;
  v8 = v4;
  -[BSOrderedDictionary enumerateKeysAndObjectsWithIndexesUsingBlock:](self, "enumerateKeysAndObjectsWithIndexesUsingBlock:", v7);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

uint64_t __42__BSOrderedDictionary_unorderedDictionary__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", a3, a2);
}

- (id)allKeys
{
  return (id)-[NSArray copy](self->_keys, "copy");
}

- (id)allValues
{
  void *v3;
  NSArray *v4;
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
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_keys, "count"));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_keys;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        -[NSDictionary objectForKey:](self->_values, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7), (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v3;
}

- (id)sortedDictionaryUsingComparator:(id)a3
{
  BSMutableOrderedDictionary *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(BSMutableOrderedDictionary);
  -[BSOrderedDictionary allKeys](self, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingComparator:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[BSOrderedDictionary objectForKey:](self, "objectForKey:", v12, (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[BSMutableOrderedDictionary setObject:forKey:](v5, "setObject:forKey:", v13, v12);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  v14 = (void *)-[BSMutableOrderedDictionary copy](v5, "copy");
  return v14;
}

- (id)subdictionaryWithRange:(_NSRange)a3
{
  void *v4;
  NSUInteger length;
  NSUInteger location;
  BSMutableOrderedDictionary *v8;
  BSMutableOrderedDictionary *v9;
  void *v10;
  void *v11;

  if (a3.location == 0x7FFFFFFFFFFFFFFFLL || a3.length == 0)
  {
    +[_BSEmptyOrderedDictionary emptyDictionary]();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    length = a3.length;
    location = a3.location;
    v8 = objc_alloc_init(BSMutableOrderedDictionary);
    v9 = v8;
    if (location < location + length)
    {
      do
      {
        -[NSArray objectAtIndex:](self->_keys, "objectAtIndex:", location);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKey:](self->_values, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[BSMutableOrderedDictionary setObject:forKey:](v9, "setObject:forKey:", v10, v11);

        ++location;
        --length;
      }
      while (length);
    }
    v4 = (void *)-[BSMutableOrderedDictionary copy](v9, "copy");

  }
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)-[BSOrderedDictionary _initWithCopyOfOrderedDictionary:]([BSMutableOrderedDictionary alloc], (id *)&self->super.isa);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_keys, CFSTR("k"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_values, CFSTR("v"));
}

- (BSOrderedDictionary)initWithCoder:(id)a3
{
  BSOrderedDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *keys;
  uint64_t v13;
  NSDictionary *values;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)BSOrderedDictionary;
  v4 = -[BSOrderedDictionary init](&v16, sel_init);
  if (v4)
  {
    objc_opt_class();
    objc_opt_class();
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    objc_msgSend(a3, "allowedClasses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "addObject:", v5);
    objc_msgSend(a3, "allowedClasses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v10, "addObject:", v6);
    objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v8, CFSTR("k"));
    v11 = objc_claimAutoreleasedReturnValue();
    keys = v4->_keys;
    v4->_keys = (NSArray *)v11;

    objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v10, CFSTR("v"));
    v13 = objc_claimAutoreleasedReturnValue();
    values = v4->_values;
    v4->_values = (NSDictionary *)v13;

  }
  return v4;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSArray countByEnumeratingWithState:objects:count:](self->_keys, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__BSOrderedDictionary_appendDescriptionToFormatter___block_invoke;
  v3[3] = &unk_1E1EBE700;
  v3[4] = a3;
  v3[5] = self;
  objc_msgSend(a3, "appendProem:block:", self, v3);
}

void __52__BSOrderedDictionary_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = objc_opt_class();
  v6 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v6;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__BSOrderedDictionary_appendDescriptionToFormatter___block_invoke_2;
  v8[3] = &unk_1E1EBE700;
  v8[4] = *(_QWORD *)(a1 + 40);
  v9 = v5;
  v7 = v5;
  objc_msgSend(v7, "appendBodySectionWithOpenDelimiter:closeDelimiter:block:", CFSTR("{"), CFSTR("}"), v8);

}

void __52__BSOrderedDictionary_appendDescriptionToFormatter___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __52__BSOrderedDictionary_appendDescriptionToFormatter___block_invoke_3;
  v2[3] = &unk_1E1EC02D8;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "enumerateKeysAndObjectsWithIndexesUsingBlock:", v2);

}

void __52__BSOrderedDictionary_appendDescriptionToFormatter___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(a2, "description");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", a3);

}

@end
