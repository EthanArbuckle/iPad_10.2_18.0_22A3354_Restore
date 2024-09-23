@implementation HMFOrderedDictionary

+ (id)orderedDictionary
{
  return objc_alloc_init((Class)a1);
}

+ (id)orderedDictionaryWithObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithObject:forKey:", v7, v6);

  return v8;
}

- (HMFOrderedDictionary)initWithObjects:(id)a3 orderedKeySet:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  HMFOrderedDictionary *v11;
  HMFOrderedDictionary *v12;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "count");
  v10 = objc_msgSend(v8, "count");
  if (v9 != v10)
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Count of objects (%lu) differs from count of keys (%lu)"), v9, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, v16, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v17);
  }
  v18.receiver = self;
  v18.super_class = (Class)HMFOrderedDictionary;
  v11 = -[HMFOrderedDictionary init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_objects, a3);
    objc_storeStrong((id *)&v12->_keys, a4);
  }

  return v12;
}

- (HMFOrderedDictionary)initWithObjects:(id)a3 forKeys:(id)a4 copyObjects:(BOOL)a5 copyKeys:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL4 v7;
  id v10;
  objc_class *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  HMFOrderedDictionary *v21;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  if (v10 && v7)
  {
    v11 = (objc_class *)MEMORY[0x1E0C99D20];
    v12 = a4;
    v13 = objc_msgSend([v11 alloc], "initWithArray:copyItems:", v10, 1);
  }
  else
  {
    v14 = a4;
    v13 = objc_msgSend(v10, "copy");
  }
  v15 = (void *)v13;

  v16 = (void *)MEMORY[0x1E0C9AA60];
  if (v15)
    v17 = v15;
  else
    v17 = (void *)MEMORY[0x1E0C9AA60];
  v18 = objc_alloc(MEMORY[0x1E0C99E40]);
  if (a4)
    v19 = a4;
  else
    v19 = v16;
  v20 = (void *)objc_msgSend(v18, "initWithArray:copyItems:", v19, v6);

  v21 = -[HMFOrderedDictionary initWithObjects:orderedKeySet:](self, "initWithObjects:orderedKeySet:", v17, v20);
  return v21;
}

- (HMFOrderedDictionary)init
{
  return -[HMFOrderedDictionary initWithObjects:forKeys:copyObjects:copyKeys:](self, "initWithObjects:forKeys:copyObjects:copyKeys:", 0, 0, 0, 0);
}

- (HMFOrderedDictionary)initWithObject:(id)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  HMFOrderedDictionary *v11;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v14[0] = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[HMFOrderedDictionary initWithObjects:forKeys:copyObjects:copyKeys:](self, "initWithObjects:forKeys:copyObjects:copyKeys:", v9, v10, 0, 1);
  return v11;
}

- (HMFOrderedDictionary)initWithObjects:(id)a3 forKeys:(id)a4
{
  return -[HMFOrderedDictionary initWithObjects:forKeys:copyObjects:copyKeys:](self, "initWithObjects:forKeys:copyObjects:copyKeys:", a3, a4, 0, 1);
}

- (id)initBySortingDictionary:(id)a3
{
  return -[HMFOrderedDictionary initBySortingDictionary:copyItems:keyComparator:](self, "initBySortingDictionary:copyItems:keyComparator:", a3, 0, &__block_literal_global_46);
}

- (id)initBySortingDictionary:(id)a3 copyItems:(BOOL)a4 keyComparator:(id)a5
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  HMFOrderedDictionary *v9;
  void *v11;
  void *v12;

  v5 = a4;
  v11 = 0;
  v12 = 0;
  sortKeysAndValuesOfDictionary(a3, a5, &v12, &v11);
  v7 = v11;
  v8 = v12;
  v9 = -[HMFOrderedDictionary initWithObjects:forKeys:copyObjects:copyKeys:](self, "initWithObjects:forKeys:copyObjects:copyKeys:", v11, v12, v5, 0);

  return v9;
}

- (unint64_t)count
{
  return -[NSArray count](self->_objects, "count");
}

- (NSArray)allKeys
{
  return -[NSOrderedSet array](self->_keys, "array");
}

- (NSArray)allValues
{
  return self->_objects;
}

- (id)objectForKey:(id)a3
{
  return -[HMFOrderedDictionary _valueForKey:]((id *)&self->super.isa, a3);
}

- (id)_valueForKey:(id *)a1
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (a1)
  {
    v4 = objc_msgSend(a1[2], "indexOfObject:", v3);
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      a1 = 0;
    }
    else
    {
      objc_msgSend(a1[1], "objectAtIndex:", v4);
      a1 = (id *)objc_claimAutoreleasedReturnValue();
    }
  }

  return a1;
}

- (id)objectForKeyedSubscript:(id)a3
{
  return -[HMFOrderedDictionary _valueForKey:]((id *)&self->super.isa, a3);
}

- (id)objectsForKeys:(id)a3 notFoundMarker:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
    _HMFPreconditionFailure(CFSTR("notFoundMarker"));
  v8 = v7;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        -[HMFOrderedDictionary _valueForKey:]((id *)&self->super.isa, *(void **)(*((_QWORD *)&v20 + 1) + 8 * i));
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v15)
          v17 = (void *)v15;
        else
          v17 = v8;
        objc_msgSend(v9, "addObject:", v17, (_QWORD)v20);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  v18 = (void *)objc_msgSend(v9, "copy");
  return v18;
}

- (id)keyEnumerator
{
  return -[NSOrderedSet objectEnumerator](self->_keys, "objectEnumerator");
}

- (id)objectEnumerator
{
  return -[NSArray objectEnumerator](self->_objects, "objectEnumerator");
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  -[HMFOrderedDictionary enumerateKeysAndObjectsWithOptions:usingBlock:](self, "enumerateKeysAndObjectsWithOptions:usingBlock:", 0, a3);
}

- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6;
  NSOrderedSet *keys;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  keys = self->_keys;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__HMFOrderedDictionary_enumerateKeysAndObjectsWithOptions_usingBlock___block_invoke;
  v9[3] = &unk_1E3B39310;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[NSOrderedSet enumerateObjectsWithOptions:usingBlock:](keys, "enumerateObjectsWithOptions:usingBlock:", a3, v9);

}

void __70__HMFOrderedDictionary_enumerateKeysAndObjectsWithOptions_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v8 = a2;
  objc_msgSend(v7, "objectAtIndex:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, uint64_t))(v6 + 16))(v6, v8, v9, a4);

}

- (BOOL)isEqual:(id)a3
{
  HMFOrderedDictionary *v4;
  HMFOrderedDictionary *v5;
  BOOL v6;

  v4 = (HMFOrderedDictionary *)a3;
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
      if (-[NSOrderedSet isEqualToOrderedSet:](self->_keys, "isEqualToOrderedSet:", v5->_keys))
        v6 = -[NSArray isEqualToArray:](self->_objects, "isEqualToArray:", v5->_objects);
      else
        v6 = 0;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMFOrderedDictionary)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  HMFOrderedDictionary *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMF.keys"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMF.objects"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ and %@ must be present"), CFSTR("HMF.keys"), CFSTR("HMF.objects"));
LABEL_10:
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB28A8];
    v18 = *MEMORY[0x1E0CB2D50];
    v19[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 4864, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v16);

    v11 = 0;
    goto LABEL_11;
  }
  v9 = objc_msgSend(v5, "count");
  v10 = objc_msgSend(v7, "count");
  if (v10 != v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("count of objects (%lu) differs from count of keys (%lu)"), v10, v9);
    goto LABEL_10;
  }
  self = -[HMFOrderedDictionary initWithObjects:forKeys:copyObjects:copyKeys:](self, "initWithObjects:forKeys:copyObjects:copyKeys:", v7, v5, 0, 0);
  v11 = self;
LABEL_11:

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSOrderedSet *keys;
  id v5;
  void *v6;
  id v7;

  keys = self->_keys;
  v5 = a3;
  -[NSOrderedSet array](keys, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("HMF.keys"));

  v7 = (id)-[NSArray copy](self->_objects, "copy");
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("HMF.objects"));

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMFMutableOrderedDictionary *v4;
  void *v5;
  void *v6;
  HMFMutableOrderedDictionary *v7;

  v4 = [HMFMutableOrderedDictionary alloc];
  v5 = (void *)-[NSArray mutableCopy](self->_objects, "mutableCopy");
  v6 = (void *)-[NSOrderedSet mutableCopy](self->_keys, "mutableCopy");
  v7 = -[HMFMutableOrderedDictionary initWithObjects:orderedKeySet:](v4, "initWithObjects:orderedKeySet:", v5, v6);

  return v7;
}

- (id)unorderedCopy
{
  id v3;
  NSArray *objects;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0C99D80]);
  objects = self->_objects;
  -[NSOrderedSet array](self->_keys, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithObjects:forKeys:", objects, v5);

  return v6;
}

- (id)mutableUnorderedCopy
{
  id v3;
  NSArray *objects;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  objects = self->_objects;
  -[NSOrderedSet array](self->_keys, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithObjects:forKeys:", objects, v5);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->_objects, 0);
}

@end
