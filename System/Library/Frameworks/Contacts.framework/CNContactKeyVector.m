@implementation CNContactKeyVector

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[CNMutableContactKeyVector initWithKeyVector:]([CNMutableContactKeyVector alloc], "initWithKeyVector:", self);
}

- (void)enumeratePropertiesUsingBlock:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  int64_t *bitBuckets;
  void *v10;
  char v11;

  v4 = (void (**)(id, void *, _BYTE *))a3;
  +[CN allContactProperties](CN, "allContactProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    bitBuckets = self->_bitBuckets;
    do
    {
      if (((*(unint64_t *)((char *)bitBuckets + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> ~(_BYTE)v8) & 1) != 0)
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v10, &v11);

        if (v11)
          break;
      }
      ++v8;
    }
    while (v8 < v7);
  }

}

- (BOOL)intersectsKeyVector:(id)a3
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  int64_t v8;
  BOOL v9;

  if (!a3)
    return 0;
  v4 = objc_msgSend(a3, "_bitBuckets");
  v5 = 0;
  v6 = 0;
  do
  {
    v7 = v5;
    v8 = *(_QWORD *)(v4 + 8 * v6) & self->_bitBuckets[v6];
    v9 = v8 != 0;
    if (v8)
      break;
    v5 = 1;
    v6 = 1;
  }
  while ((v7 & 1) == 0);
  return v9;
}

- (int64_t)_bitBuckets
{
  return self->_bitBuckets;
}

- (BOOL)isEqualToKeyVector:(id)a3
{
  CNContactKeyVector *v4;
  CNContactKeyVector *v5;
  int64_t *v6;
  BOOL v8;

  v4 = (CNContactKeyVector *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v8 = 1;
  }
  else if (v4)
  {
    v6 = -[CNContactKeyVector _bitBuckets](v4, "_bitBuckets");
    v8 = self->_bitBuckets[0] == *v6 && self->_bitBuckets[1] == v6[1];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)containsAllKeys
{
  uint64_t v3;
  char v4;
  int64_t v5;
  uint64_t v6;
  char v7;

  if (CNContactKeyVectorBitBucketsForAllProperties_onceToken != -1)
    dispatch_once(&CNContactKeyVectorBitBucketsForAllProperties_onceToken, &__block_literal_global_133);
  v3 = 0;
  v4 = 1;
  do
  {
    v5 = self->_bitBuckets[v3];
    v6 = *((_QWORD *)&CNContactKeyVectorBitBucketsForAllProperties_referenceBuckets + v3);
    if (v5 != v6)
      break;
    v7 = v4;
    v4 = 0;
    v3 = 1;
  }
  while ((v7 & 1) != 0);
  return v5 == v6;
}

+ (id)keyVector
{
  id v3;
  id v4;

  if ((id)objc_opt_class() == a1)
  {
    if (keyVector_cn_once_token_0 != -1)
      dispatch_once(&keyVector_cn_once_token_0, &__block_literal_global_58);
    v4 = (id)keyVector_cn_once_object_0;
  }
  else
  {
    v3 = objc_alloc((Class)a1);
    v4 = (id)objc_msgSend(v3, "initWithKeys:", MEMORY[0x1E0C9AA60]);
  }
  return v4;
}

+ (CNContactKeyVector)keyVectorWithKey:(id)a3
{
  id v4;
  CNMutableContactKeyVector *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init(CNMutableContactKeyVector);
  -[CNMutableContactKeyVector addKey:](v5, "addKey:", v4);

  objc_msgSend(a1, "freezeIfClassIsImmutable:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNContactKeyVector *)v6;
}

- (CNContactKeyVector)initWithKeys:(id)a3
{
  id v4;
  CNContactKeyVector *v5;
  CNContactKeyVector *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  const void *Value;
  CNContactKeyVector *v14;
  id v16;
  CNContactKeyVector *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD block[4];
  CNContactKeyVector *v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CNContactKeyVector;
  v5 = -[CNContactKeyVector init](&v24, sel_init);
  v6 = v5;
  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__CNContactKeyVector_initWithKeys___block_invoke;
    block[3] = &unk_1E29F8508;
    v17 = v5;
    v23 = v17;
    if (initWithKeys__onceToken != -1)
      dispatch_once(&initWithKeys__onceToken, block);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v16 = v4;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(const void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
          if (v12)
          {
            if (CNContactKeyVectorPropertyKeysToIndicesByPointer_onceToken != -1)
              dispatch_once(&CNContactKeyVectorPropertyKeysToIndicesByPointer_onceToken, &__block_literal_global_129);
            Value = CFDictionaryGetValue((CFDictionaryRef)CNContactKeyVectorPropertyKeysToIndicesByPointer_map, v12);
            if (Value)
              goto LABEL_16;
            if (CNContactKeyVectorPropertyKeysToIndicesByValue_onceToken != -1)
              dispatch_once(&CNContactKeyVectorPropertyKeysToIndicesByValue_onceToken, &__block_literal_global_132);
            Value = CFDictionaryGetValue((CFDictionaryRef)CNContactKeyVectorPropertyKeysToIndicesByValue_map, v12);
            if (Value)
LABEL_16:
              *(int64_t *)((char *)v17->_bitBuckets
                                + ((((unint64_t)Value - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << ~(Value - 1);
          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
      }
      while (v9);
    }

    v14 = v17;
    v4 = v16;
  }

  return v6;
}

+ (id)freezeIfClassIsImmutable:(id)a3
{
  return (id)objc_msgSend(a3, "freeze");
}

+ (CNContactKeyVector)keyVectorWithKeys:(id)a3
{
  id v4;
  CNMutableContactKeyVector *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "count") && (id)objc_opt_class() == a1)
  {
    objc_msgSend(a1, "keyVector");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_alloc_init(CNMutableContactKeyVector);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          -[CNMutableContactKeyVector addKey:](v5, "addKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10++), (_QWORD)v13);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    objc_msgSend(a1, "freezeIfClassIsImmutable:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (CNContactKeyVector *)v11;
}

- (BOOL)containsKey:(id)a3
{
  id v4;
  const void *Value;
  unint64_t v6;

  v4 = a3;
  if (!v4)
    goto LABEL_9;
  if (CNContactKeyVectorPropertyKeysToIndicesByPointer_onceToken != -1)
    dispatch_once(&CNContactKeyVectorPropertyKeysToIndicesByPointer_onceToken, &__block_literal_global_129);
  Value = CFDictionaryGetValue((CFDictionaryRef)CNContactKeyVectorPropertyKeysToIndicesByPointer_map, v4);
  if (Value)
    goto LABEL_8;
  if (CNContactKeyVectorPropertyKeysToIndicesByValue_onceToken != -1)
    dispatch_once(&CNContactKeyVectorPropertyKeysToIndicesByValue_onceToken, &__block_literal_global_132);
  Value = CFDictionaryGetValue((CFDictionaryRef)CNContactKeyVectorPropertyKeysToIndicesByValue_map, v4);
  if (Value)
LABEL_8:
    v6 = ((unint64_t)self->_bitBuckets[((unint64_t)Value - 1) >> 6] >> ~(Value - 1)) & 1;
  else
LABEL_9:
    LOBYTE(v6) = 0;

  return v6;
}

- (BOOL)isSubsetOfKeyVector:(id)a3
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  int64_t v7;
  BOOL v8;

  if (!a3)
    return 0;
  v4 = objc_msgSend(a3, "_bitBuckets");
  v5 = 0;
  v6 = 0;
  do
  {
    v7 = self->_bitBuckets[v6] & ~*(_QWORD *)(v4 + 8 * v6);
    v8 = v7 == 0;
    if ((v5 & 1) != 0)
      break;
    v5 = 1;
    v6 = 1;
  }
  while (!v7);
  return v8;
}

- (id)keyVectorByRemovingKeys:(id)a3
{
  id v4;
  CNContactKeyVector *v5;
  CNMutableContactKeyVector *v6;

  v4 = a3;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D137F8] + 16))())
  {
    v5 = self;
  }
  else
  {
    v6 = -[CNMutableContactKeyVector initWithKeyVector:]([CNMutableContactKeyVector alloc], "initWithKeyVector:", self);
    -[CNMutableContactKeyVector subtractKeys:](v6, "subtractKeys:", v4);
    -[CNMutableContactKeyVector freeze](v6, "freeze");
    v5 = (CNContactKeyVector *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (CNContactKeyVector)keyVectorWithAllKeys
{
  id v3;

  if ((id)objc_opt_class() == a1)
  {
    if (keyVectorWithAllKeys_cn_once_token_1 != -1)
      dispatch_once(&keyVectorWithAllKeys_cn_once_token_1, &__block_literal_global_1_3);
    v3 = (id)keyVectorWithAllKeys_cn_once_object_1;
  }
  else
  {
    v3 = (id)objc_msgSend(objc_alloc((Class)a1), "initWithAllKeys");
  }
  return (CNContactKeyVector *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  void *v3;
  int64_t *bitBuckets;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0C99D50];
  bitBuckets = self->_bitBuckets;
  v5 = a3;
  objc_msgSend(v3, "dataWithBytes:length:", bitBuckets, 16);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("bitBuckets_buffer"));

}

- (void)_cn_executeGetterForRepresentedKeys:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t *bitBuckets;
  void *v9;
  void *v10;
  id v11;
  uint64_t (**v12)(id, void *);

  v12 = (uint64_t (**)(id, void *))a3;
  +[CN allContactProperties](CN, "allContactProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    bitBuckets = self->_bitBuckets;
    do
    {
      if (((*(unint64_t *)((char *)bitBuckets + ((v7 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> ~(_BYTE)v7) & 1) != 0)
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "key");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (id)v12[2](v12, v10);

      }
      ++v7;
    }
    while (v6 != v7);
  }

}

- (id)keyVectorByRemovingKeysFromKeyVector:(id)a3
{
  id v4;
  CNMutableContactKeyVector *v5;
  void *v6;

  v4 = a3;
  v5 = -[CNMutableContactKeyVector initWithKeyVector:]([CNMutableContactKeyVector alloc], "initWithKeyVector:", self);
  -[CNMutableContactKeyVector minusKeyVector:](v5, "minusKeyVector:", v4);

  -[CNMutableContactKeyVector freeze](v5, "freeze");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __35__CNContactKeyVector_initWithKeys___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkStorageSize");
}

void __31__CNContactKeyVector_keyVector__block_invoke()
{
  CNContactKeyVector *v0;
  uint64_t v1;
  void *v2;

  v0 = [CNContactKeyVector alloc];
  v1 = -[CNContactKeyVector initWithKeys:](v0, "initWithKeys:", MEMORY[0x1E0C9AA60]);
  v2 = (void *)keyVector_cn_once_object_0;
  keyVector_cn_once_object_0 = v1;

}

void __42__CNContactKeyVector_keyVectorWithAllKeys__block_invoke()
{
  CNContactKeyVector *v0;
  void *v1;

  v0 = -[CNContactKeyVector initWithAllKeys]([CNContactKeyVector alloc], "initWithAllKeys");
  v1 = (void *)keyVectorWithAllKeys_cn_once_object_1;
  keyVectorWithAllKeys_cn_once_object_1 = (uint64_t)v0;

}

- (CNContactKeyVector)initWithAllKeys
{
  CNContactKeyVector *v2;
  CNContactKeyVector *v3;

  v2 = -[CNContactKeyVector initWithKeys:](self, "initWithKeys:", MEMORY[0x1E0C9AA60]);
  if (v2)
  {
    if (CNContactKeyVectorBitBucketsForAllProperties_onceToken != -1)
      dispatch_once(&CNContactKeyVectorBitBucketsForAllProperties_onceToken, &__block_literal_global_133);
    *(_OWORD *)v2->_bitBuckets = CNContactKeyVectorBitBucketsForAllProperties_referenceBuckets;
    v3 = v2;
  }

  return v2;
}

- (id)keyVectorByAddingKey:(id)a3
{
  id v4;
  CNMutableContactKeyVector *v5;
  void *v6;

  v4 = a3;
  v5 = -[CNMutableContactKeyVector initWithKeyVector:]([CNMutableContactKeyVector alloc], "initWithKeyVector:", self);
  -[CNMutableContactKeyVector addKey:](v5, "addKey:", v4);

  -[CNMutableContactKeyVector freeze](v5, "freeze");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  CNContactKeyVector *v4;
  CNContactKeyVector *v5;
  BOOL v6;

  v4 = (CNContactKeyVector *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CNContactKeyVector isEqualToKeyVector:](self, "isEqualToKeyVector:", v5);

  return v6;
}

- (CNContactKeyVector)initWithCoder:(id)a3
{
  id v4;
  CNContactKeyVector *v5;
  void *v6;
  CNContactKeyVector *v7;

  v4 = a3;
  v5 = -[CNContactKeyVector initWithKeys:](self, "initWithKeys:", MEMORY[0x1E0C9AA60]);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bitBuckets_buffer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length") == 16)
      *(_OWORD *)v5->_bitBuckets = *(_OWORD *)objc_msgSend(objc_retainAutorelease(v6), "bytes");

    v7 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)keyVectorByAddingKeys:(id)a3
{
  id v4;
  CNMutableContactKeyVector *v5;
  void *v6;

  v4 = a3;
  v5 = -[CNMutableContactKeyVector initWithKeyVector:]([CNMutableContactKeyVector alloc], "initWithKeyVector:", self);
  -[CNMutableContactKeyVector addKeys:](v5, "addKeys:", v4);

  -[CNMutableContactKeyVector freeze](v5, "freeze");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)keyVectorByAddingKeysFromKeyVector:(id)a3
{
  id v4;
  CNMutableContactKeyVector *v5;
  void *v6;

  v4 = a3;
  v5 = -[CNMutableContactKeyVector initWithKeyVector:]([CNMutableContactKeyVector alloc], "initWithKeyVector:", self);
  -[CNMutableContactKeyVector unionKeyVector:](v5, "unionKeyVector:", v4);

  -[CNMutableContactKeyVector freeze](v5, "freeze");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CNContactKeyVector)init
{
  return -[CNContactKeyVector initWithKeys:](self, "initWithKeys:", MEMORY[0x1E0C9AA60]);
}

- (id)_cn_optionalKeys
{
  return +[CNContactKeyVector keyVector](CNContactKeyVector, "keyVector");
}

- (id)_cn_ignorableKeys
{
  return +[CNContactKeyVector keyVector](CNContactKeyVector, "keyVector");
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __33__CNContactKeyVector_description__block_invoke;
  v10[3] = &unk_1E29F9C50;
  v11 = v4;
  v5 = v4;
  -[CNContactKeyVector enumeratePropertiesUsingBlock:](self, "enumeratePropertiesUsingBlock:", v10);
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("keys"), v6);
  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

void __33__CNContactKeyVector_description__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "key");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

@end
