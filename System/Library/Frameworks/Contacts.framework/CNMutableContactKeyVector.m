@implementation CNMutableContactKeyVector

- (CNMutableContactKeyVector)initWithKeyVector:(id)a3
{
  id v4;
  char *v5;
  char *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNMutableContactKeyVector;
  v5 = -[CNContactKeyVector initWithKeys:](&v8, sel_initWithKeys_, MEMORY[0x1E0C9AA60]);
  if (v5)
  {
    if (v4)
      *(_OWORD *)(v5 + 8) = *(_OWORD *)objc_msgSend(v4, "_bitBuckets");
    v6 = v5;
  }

  return (CNMutableContactKeyVector *)v5;
}

- (void)unionKeyVector:(id)a3
{
  id v4;
  _QWORD *v5;
  int64_t v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("key vector to union must be non-nil"));
    v4 = 0;
  }
  v5 = (_QWORD *)objc_msgSend(v4, "_bitBuckets");
  v6 = self->super._bitBuckets[1];
  self->super._bitBuckets[0] |= *v5;
  self->super._bitBuckets[1] = v6 | v5[1];

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  +[CNContactKeyVector keyVector](CNContactKeyVector, "keyVector", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNContactKeyVector isEqualToKeyVector:](self, "isEqualToKeyVector:", v4))
  {
    v5 = v4;
  }
  else
  {
    if (!-[CNContactKeyVector containsAllKeys](self, "containsAllKeys"))
    {
      v7 = (void *)-[CNMutableContactKeyVector mutableCopy](self, "mutableCopy");
      objc_msgSend(v7, "freeze");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    +[CNContactKeyVector keyVectorWithAllKeys](CNContactKeyVector, "keyVectorWithAllKeys");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
LABEL_7:

  return v6;
}

- (void)addKey:(id)a3
{
  const void *Value;
  id key;

  key = a3;
  if (key)
  {
    if (CNContactKeyVectorPropertyKeysToIndicesByPointer_onceToken != -1)
      dispatch_once(&CNContactKeyVectorPropertyKeysToIndicesByPointer_onceToken, &__block_literal_global_129);
    Value = CFDictionaryGetValue((CFDictionaryRef)CNContactKeyVectorPropertyKeysToIndicesByPointer_map, key);
    if (Value)
      goto LABEL_8;
    if (CNContactKeyVectorPropertyKeysToIndicesByValue_onceToken != -1)
      dispatch_once(&CNContactKeyVectorPropertyKeysToIndicesByValue_onceToken, &__block_literal_global_132);
    Value = CFDictionaryGetValue((CFDictionaryRef)CNContactKeyVectorPropertyKeysToIndicesByValue_map, key);
    if (Value)
LABEL_8:
      *(int64_t *)((char *)self->super._bitBuckets + ((((unint64_t)Value - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << ~(Value - 1);
  }

}

- (CNMutableContactKeyVector)init
{
  return -[CNContactKeyVector initWithKeys:](self, "initWithKeys:", MEMORY[0x1E0C9AA60]);
}

- (id)freeze
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class();
  object_setClass(self, v3);
  return self;
}

+ (id)freezeIfClassIsImmutable:(id)a3
{
  return a3;
}

- (void)subtractKeys:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int64_t *bitBuckets;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const void *Value;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    bitBuckets = self->super._bitBuckets;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v10 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        if (v10)
        {
          if (CNContactKeyVectorPropertyKeysToIndicesByPointer_onceToken != -1)
            dispatch_once(&CNContactKeyVectorPropertyKeysToIndicesByPointer_onceToken, &__block_literal_global_129);
          Value = CFDictionaryGetValue((CFDictionaryRef)CNContactKeyVectorPropertyKeysToIndicesByPointer_map, v10);
          if (Value)
            goto LABEL_13;
          if (CNContactKeyVectorPropertyKeysToIndicesByValue_onceToken != -1)
            dispatch_once(&CNContactKeyVectorPropertyKeysToIndicesByValue_onceToken, &__block_literal_global_132);
          Value = CFDictionaryGetValue((CFDictionaryRef)CNContactKeyVectorPropertyKeysToIndicesByValue_map, v10);
          if (Value)
LABEL_13:
            *(int64_t *)((char *)bitBuckets + ((((unint64_t)Value - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) &= ~(1 << ~(Value - 1));
        }

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)minusKeyVector:(id)a3
{
  id v4;
  _QWORD *v5;
  int64_t v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("key vector to subtract must be non-nil"));
    v4 = 0;
  }
  v5 = (_QWORD *)objc_msgSend(v4, "_bitBuckets");
  v6 = self->super._bitBuckets[1];
  self->super._bitBuckets[0] &= ~*v5;
  self->super._bitBuckets[1] = v6 & ~v5[1];

}

- (void)intersectKeyVector:(id)a3
{
  id v4;
  _QWORD *v5;
  int64_t v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("key vector to intersect must be non-nil"));
    v4 = 0;
  }
  v5 = (_QWORD *)objc_msgSend(v4, "_bitBuckets");
  v6 = self->super._bitBuckets[1];
  self->super._bitBuckets[0] &= *v5;
  self->super._bitBuckets[1] = v6 & v5[1];

}

- (void)addKeys:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int64_t *bitBuckets;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const void *Value;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    bitBuckets = self->super._bitBuckets;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v10 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        if (v10)
        {
          if (CNContactKeyVectorPropertyKeysToIndicesByPointer_onceToken != -1)
            dispatch_once(&CNContactKeyVectorPropertyKeysToIndicesByPointer_onceToken, &__block_literal_global_129);
          Value = CFDictionaryGetValue((CFDictionaryRef)CNContactKeyVectorPropertyKeysToIndicesByPointer_map, v10);
          if (Value)
            goto LABEL_13;
          if (CNContactKeyVectorPropertyKeysToIndicesByValue_onceToken != -1)
            dispatch_once(&CNContactKeyVectorPropertyKeysToIndicesByValue_onceToken, &__block_literal_global_132);
          Value = CFDictionaryGetValue((CFDictionaryRef)CNContactKeyVectorPropertyKeysToIndicesByValue_map, v10);
          if (Value)
LABEL_13:
            *(int64_t *)((char *)bitBuckets + ((((unint64_t)Value - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << ~(Value - 1);
        }

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)subtractKey:(id)a3
{
  const void *Value;
  id key;

  key = a3;
  if (key)
  {
    if (CNContactKeyVectorPropertyKeysToIndicesByPointer_onceToken != -1)
      dispatch_once(&CNContactKeyVectorPropertyKeysToIndicesByPointer_onceToken, &__block_literal_global_129);
    Value = CFDictionaryGetValue((CFDictionaryRef)CNContactKeyVectorPropertyKeysToIndicesByPointer_map, key);
    if (Value)
      goto LABEL_8;
    if (CNContactKeyVectorPropertyKeysToIndicesByValue_onceToken != -1)
      dispatch_once(&CNContactKeyVectorPropertyKeysToIndicesByValue_onceToken, &__block_literal_global_132);
    Value = CFDictionaryGetValue((CFDictionaryRef)CNContactKeyVectorPropertyKeysToIndicesByValue_map, key);
    if (Value)
LABEL_8:
      *(int64_t *)((char *)self->super._bitBuckets + ((((unint64_t)Value - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) &= ~(1 << ~(Value - 1));
  }

}

@end
