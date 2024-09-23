@implementation CNMultiDictionary

uint64_t __26__CNMultiDictionary_count__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (id)objectsForKey:(id)a3
{
  void *v3;

  -[NSMutableDictionary objectForKey:](self->_entries, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (unint64_t)count
{
  NSMutableDictionary *entries;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  entries = self->_entries;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __26__CNMultiDictionary_count__block_invoke;
  v5[3] = &unk_1E29BB860;
  v5[4] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](entries, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (id)multiDictionary
{
  uint64_t v3;
  id v4;

  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    if (multiDictionary_cn_once_token_1 != -1)
      dispatch_once(&multiDictionary_cn_once_token_1, &__block_literal_global_54);
    v4 = (id)multiDictionary_cn_once_object_1;
  }
  else
  {
    v4 = objc_alloc_init((Class)a1);
  }
  return v4;
}

- (CNMultiDictionary)init
{
  return -[CNMultiDictionary initWithEntries:](self, "initWithEntries:", MEMORY[0x1E0C9AA70]);
}

- (CNMultiDictionary)initWithEntries:(id)a3
{
  id v4;
  CNMultiDictionary *v5;
  uint64_t v6;
  NSMutableDictionary *entries;
  CNMultiDictionary *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNMultiDictionary;
  v5 = -[CNMultiDictionary init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    entries = v5->_entries;
    v5->_entries = (NSMutableDictionary *)v6;

    v8 = v5;
  }

  return v5;
}

void __36__CNMultiDictionary_multiDictionary__block_invoke()
{
  CNMultiDictionary *v0;
  void *v1;

  v0 = objc_alloc_init(CNMultiDictionary);
  v1 = (void *)multiDictionary_cn_once_object_1;
  multiDictionary_cn_once_object_1 = (uint64_t)v0;

}

+ (id)multiDictionaryWithObject:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  CNMutableMultiDictionary *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(CNMutableMultiDictionary);
  -[CNMutableMultiDictionary addObject:forKey:](v7, "addObject:forKey:", v6, v5);

  return v7;
}

+ (id)multiDictionaryWithEntries:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEntries:", v4);

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[CNMultiDictionary initWithEntries:]([CNMutableMultiDictionary alloc], "initWithEntries:", self->_entries);
}

- (NSArray)allKeys
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_entries, "allKeys");
}

- (id)objectsForKeys:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__CNMultiDictionary_objectsForKeys___block_invoke;
  v6[3] = &unk_1E29B9C70;
  v6[4] = self;
  objc_msgSend(a3, "_cn_map:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_filter:", &__block_literal_global_4_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __36__CNMultiDictionary_objectsForKeys___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsKey:", v3))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectsForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)containsKey:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKey:](self->_entries, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)eachObject:(id)a3
{
  id v4;
  NSMutableDictionary *entries;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  entries = self->_entries;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__CNMultiDictionary_eachObject___block_invoke;
  v7[3] = &unk_1E29BB888;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](entries, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __32__CNMultiDictionary_eachObject___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __32__CNMultiDictionary_eachObject___block_invoke_2;
  v8[3] = &unk_1E29B9178;
  v6 = *(id *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v8);

}

uint64_t __32__CNMultiDictionary_eachObject___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_entries, "copy");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = objc_opt_class();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __29__CNMultiDictionary_isEqual___block_invoke;
  v8[3] = &unk_1E29B9D38;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  LOBYTE(self) = +[CNEqualsBuilder isObject:kindOfClass:andEqualToObject:withBlocks:](CNEqualsBuilder, "isObject:kindOfClass:andEqualToObject:withBlocks:", v6, v5, self, v8, 0);

  return (char)self;
}

BOOL __29__CNMultiDictionary_isEqual___block_invoke(uint64_t a1)
{
  return +[CNEqualsBuilder isObject:equalToOther:](CNEqualsBuilder, "isObject:equalToOther:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
}

- (unint64_t)hash
{
  _QWORD v3[5];

  v3[1] = 3221225472;
  v3[2] = __25__CNMultiDictionary_hash__block_invoke;
  v3[3] = &unk_1E29B9B10;
  v3[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  return +[CNHashBuilder hashWithBlocks:](CNHashBuilder, "hashWithBlocks:", v3, 0);
}

unint64_t __25__CNMultiDictionary_hash__block_invoke(uint64_t a1)
{
  return +[CNHashBuilder objectHash:](CNHashBuilder, "objectHash:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  +[CNDescriptionBuilder descriptionBuilderWithObject:](CNDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendNamesAndObjects:", CFSTR("entries"), self->_entries, 0);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
}

@end
