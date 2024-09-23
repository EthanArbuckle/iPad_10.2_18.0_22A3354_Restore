@implementation EFOrderedDictionary

- (EFOrderedDictionary)init
{
  id v3;
  id v4;
  EFOrderedDictionary *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E40]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99D80]);
  v5 = -[EFOrderedDictionary _initWithOrderedKeys:objectsByKey:](self, "_initWithOrderedKeys:objectsByKey:", v3, v4);

  return v5;
}

- (id)_initWithOrderedKeys:(id)a3 objectsByKey:(id)a4
{
  id v7;
  id v8;
  EFOrderedDictionary *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EFOrderedDictionary;
  v9 = -[EFOrderedDictionary init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_orderedKeys, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[EFMutableOrderedDictionary _initWithOrderedKeys:objectsByKey:]([EFMutableOrderedDictionary alloc], "_initWithOrderedKeys:objectsByKey:", self->_orderedKeys, self->_objectsByKey);
}

- (unint64_t)count
{
  return -[NSOrderedSet count](self->_orderedKeys, "count");
}

- (NSCopying)firstKey
{
  return (NSCopying *)-[NSOrderedSet firstObject](self->_orderedKeys, "firstObject");
}

- (id)firstObject
{
  NSDictionary *objectsByKey;
  void *v3;
  void *v4;

  objectsByKey = self->_objectsByKey;
  -[EFOrderedDictionary firstKey](self, "firstKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](objectsByKey, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSCopying)lastKey
{
  return (NSCopying *)-[NSOrderedSet lastObject](self->_orderedKeys, "lastObject");
}

- (id)lastObject
{
  NSDictionary *objectsByKey;
  void *v3;
  void *v4;

  objectsByKey = self->_objectsByKey;
  -[EFOrderedDictionary lastKey](self, "lastKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](objectsByKey, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSDictionary)dictionary
{
  return (NSDictionary *)(id)-[NSDictionary copy](self->_objectsByKey, "copy");
}

- (NSOrderedSet)allKeys
{
  return (NSOrderedSet *)(id)-[NSOrderedSet copy](self->_orderedKeys, "copy");
}

- (NSArray)allValues
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[NSOrderedSet array](self->_orderedKeys, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__EFOrderedDictionary_allValues__block_invoke;
  v6[3] = &unk_1E62A6D68;
  v6[4] = self;
  objc_msgSend(v3, "ef_map:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

id __32__EFOrderedDictionary_allValues__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  NSDictionary *objectsByKey;
  void *v4;
  void *v5;

  objectsByKey = self->_objectsByKey;
  -[NSOrderedSet objectAtIndexedSubscript:](self->_orderedKeys, "objectAtIndexedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](objectsByKey, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)indexOfKey:(id)a3
{
  return -[NSOrderedSet indexOfObject:](self->_orderedKeys, "indexOfObject:", a3);
}

- (id)keyAtIndex:(unint64_t)a3
{
  return -[NSOrderedSet objectAtIndexedSubscript:](self->_orderedKeys, "objectAtIndexedSubscript:", a3);
}

- (id)objectForKey:(id)a3
{
  -[EFOrderedDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)objectForKeyedSubscript:(id)a3
{
  -[NSDictionary objectForKeyedSubscript:](self->_objectsByKey, "objectForKeyedSubscript:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  id v4;
  NSOrderedSet *orderedKeys;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  orderedKeys = self->_orderedKeys;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__EFOrderedDictionary_enumerateKeysAndObjectsUsingBlock___block_invoke;
  v7[3] = &unk_1E62A6D90;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSOrderedSet enumerateObjectsUsingBlock:](orderedKeys, "enumerateObjectsUsingBlock:", v7);

}

void __57__EFOrderedDictionary_enumerateKeysAndObjectsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v7 = a2;
  v8 = *(_QWORD *)(a1 + 40);
  v10 = v7;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id, void *, uint64_t))(v8 + 16))(v8, a3, v10, v9, a4);

}

- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6;
  NSOrderedSet *orderedKeys;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  orderedKeys = self->_orderedKeys;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__EFOrderedDictionary_enumerateKeysAndObjectsWithOptions_usingBlock___block_invoke;
  v9[3] = &unk_1E62A6D90;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[NSOrderedSet enumerateObjectsWithOptions:usingBlock:](orderedKeys, "enumerateObjectsWithOptions:usingBlock:", a3, v9);

}

void __69__EFOrderedDictionary_enumerateKeysAndObjectsWithOptions_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v7 = a2;
  v8 = *(_QWORD *)(a1 + 40);
  v10 = v7;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id, void *, uint64_t))(v8 + 16))(v8, a3, v10, v9, a4);

}

- (void)enumerateKeysAndObjectsAtIndexes:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  id v8;
  NSOrderedSet *orderedKeys;
  id v10;
  _QWORD v11[5];
  id v12;

  v8 = a5;
  orderedKeys = self->_orderedKeys;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75__EFOrderedDictionary_enumerateKeysAndObjectsAtIndexes_options_usingBlock___block_invoke;
  v11[3] = &unk_1E62A6D90;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  -[NSOrderedSet enumerateObjectsAtIndexes:options:usingBlock:](orderedKeys, "enumerateObjectsAtIndexes:options:usingBlock:", a3, a4, v11);

}

void __75__EFOrderedDictionary_enumerateKeysAndObjectsAtIndexes_options_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v7 = a2;
  v8 = *(_QWORD *)(a1 + 40);
  v10 = v7;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id, void *, uint64_t))(v8 + 16))(v8, a3, v10, v9, a4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectsByKey, 0);
  objc_storeStrong((id *)&self->_orderedKeys, 0);
}

@end
