@implementation CNOrderedDictionary

+ (id)orderedDictionary
{
  return objc_alloc_init((Class)a1);
}

+ (id)dictionaryWithObject:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  CNMutableOrderedDictionary *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(CNMutableOrderedDictionary);
  -[CNMutableOrderedDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v6, v5);

  return v7;
}

- (CNOrderedDictionary)init
{
  CNOrderedDictionary *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *dictionary;
  NSMutableArray *v5;
  NSMutableArray *orderedKeys;
  CNOrderedDictionary *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNOrderedDictionary;
  v2 = -[CNOrderedDictionary init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    dictionary = v2->_dictionary;
    v2->_dictionary = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    orderedKeys = v2->_orderedKeys;
    v2->_orderedKeys = v5;

    v7 = v2;
  }

  return v2;
}

- (id)objectForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", a3);
}

- (NSArray)allKeys
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_orderedKeys, "copy");
}

- (NSArray)allObjects
{
  NSMutableArray *orderedKeys;
  _QWORD v4[5];

  orderedKeys = self->_orderedKeys;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__CNOrderedDictionary_allObjects__block_invoke;
  v4[3] = &unk_1E29B9C70;
  v4[4] = self;
  -[NSMutableArray _cn_map:](orderedKeys, "_cn_map:", v4);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t __33__CNOrderedDictionary_allObjects__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", a2);
}

- (void)forEach:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  CNOrderedDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, void *))a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self;
  v6 = -[CNOrderedDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](v5->_dictionary, "objectForKeyedSubscript:", v10, (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v10, v11);

      }
      v7 = -[CNOrderedDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSMutableArray countByEnumeratingWithState:objects:count:](self->_orderedKeys, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[CNMutableOrderedDictionary initWithDictionary:orderedKeys:]([CNMutableOrderedDictionary alloc], "initWithDictionary:orderedKeys:", self->_dictionary, self->_orderedKeys);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t aBlock;
  uint64_t v10;
  BOOL (*v11)(uint64_t);
  void *v12;
  CNOrderedDictionary *v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  v5 = objc_opt_class();
  v14 = v4;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __31__CNOrderedDictionary_isEqual___block_invoke;
  v15[3] = &unk_1E29B9D38;
  v15[4] = self;
  v16 = v4;
  aBlock = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __31__CNOrderedDictionary_isEqual___block_invoke_2;
  v12 = &unk_1E29B9D38;
  v13 = self;
  v6 = v4;
  v7 = _Block_copy(&aBlock);
  LOBYTE(self) = +[CNEqualsBuilder isObject:kindOfClass:andEqualToObject:withBlocks:](CNEqualsBuilder, "isObject:kindOfClass:andEqualToObject:withBlocks:", v6, v5, self, v15, v7, 0, aBlock, v10, v11, v12, v13);

  return (char)self;
}

BOOL __31__CNOrderedDictionary_isEqual___block_invoke(uint64_t a1)
{
  return +[CNEqualsBuilder isObject:equalToOther:](CNEqualsBuilder, "isObject:equalToOther:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
}

BOOL __31__CNOrderedDictionary_isEqual___block_invoke_2(uint64_t a1)
{
  return +[CNEqualsBuilder isObject:equalToOther:](CNEqualsBuilder, "isObject:equalToOther:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;
  _QWORD aBlock[5];
  _QWORD v6[5];

  aBlock[4] = self;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __27__CNOrderedDictionary_hash__block_invoke;
  v6[3] = &unk_1E29B9B10;
  v6[4] = self;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __27__CNOrderedDictionary_hash__block_invoke_2;
  aBlock[3] = &unk_1E29B9B10;
  v2 = _Block_copy(aBlock);
  v3 = +[CNHashBuilder hashWithBlocks:](CNHashBuilder, "hashWithBlocks:", v6, v2, 0);

  return v3;
}

unint64_t __27__CNOrderedDictionary_hash__block_invoke(uint64_t a1)
{
  return +[CNHashBuilder objectHash:](CNHashBuilder, "objectHash:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

unint64_t __27__CNOrderedDictionary_hash__block_invoke_2(uint64_t a1)
{
  return +[CNHashBuilder arrayHash:](CNHashBuilder, "arrayHash:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  +[CNDescriptionBuilder descriptionBuilderWithObject:](CNDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendNamesAndObjects:", CFSTR("Dictionary"), self->_dictionary, 0);
  v5 = (id)objc_msgSend(v3, "appendNamesAndObjects:", CFSTR("Ordered Keys"), self->_orderedKeys, 0);
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedKeys, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
