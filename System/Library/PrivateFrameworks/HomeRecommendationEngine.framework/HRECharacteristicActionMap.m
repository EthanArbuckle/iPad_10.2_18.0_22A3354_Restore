@implementation HRECharacteristicActionMap

- (HRECharacteristicActionMap)initWithMap:(id)a3 condition:(id)a4
{
  id v6;
  HRECharacteristicActionMap *v7;
  uint64_t v8;
  NSMutableDictionary *characteristicTypeValues;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HRECharacteristicActionMap;
  v7 = -[HREActionMap _initWithCondition:childMaps:](&v11, sel__initWithCondition_childMaps_, a4, 0);
  if (v7)
  {
    v8 = objc_msgSend(v6, "mutableCopy");
    characteristicTypeValues = v7->_characteristicTypeValues;
    v7->_characteristicTypeValues = (NSMutableDictionary *)v8;

  }
  return v7;
}

+ (id)emptyMap
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__HRECharacteristicActionMap_emptyMap__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (emptyMap_onceToken_0 != -1)
    dispatch_once(&emptyMap_onceToken_0, block);
  return (id)emptyMap_emptyMap_0;
}

void __38__HRECharacteristicActionMap_emptyMap__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  v2 = objc_msgSend(v1, "initWithMap:condition:", MEMORY[0x24BDBD1B8], 0);
  v3 = (void *)emptyMap_emptyMap_0;
  emptyMap_emptyMap_0 = v2;

}

+ (id)characteristicActionMap:(id)a3
{
  id v3;
  HRECharacteristicActionMap *v4;

  v3 = a3;
  v4 = -[HRECharacteristicActionMap initWithMap:condition:]([HRECharacteristicActionMap alloc], "initWithMap:condition:", v3, 0);

  return v4;
}

+ (id)conditonalCharacteristicActionMap:(id)a3 condition:(id)a4
{
  id v5;
  id v6;
  HRECharacteristicActionMap *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HRECharacteristicActionMap initWithMap:condition:]([HRECharacteristicActionMap alloc], "initWithMap:condition:", v6, v5);

  return v7;
}

- (id)mergeWithActionMaps:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HRECharacteristicActionMap *v7;
  uint64_t v8;
  HRECharacteristicActionMap *v9;
  void *v10;
  _QWORD v12[4];
  HRECharacteristicActionMap *v13;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "na_filter:", &__block_literal_global_5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v5, "na_all:", &__block_literal_global_3) & 1) != 0)
    {
      +[HREActionMap emptyMap](HREActionMap, "emptyMap");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[HRECharacteristicActionMap isEqual:](self, "isEqual:", v6))
      {
        v7 = [HRECharacteristicActionMap alloc];
        v8 = -[HRECharacteristicActionMap initWithMap:condition:](v7, "initWithMap:condition:", MEMORY[0x24BDBD1B8], 0);
      }
      else
      {
        v8 = -[HRECharacteristicActionMap copy](self, "copy");
      }
      v10 = (void *)v8;

      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __50__HRECharacteristicActionMap_mergeWithActionMaps___block_invoke_3;
      v12[3] = &unk_24F217E50;
      v9 = v10;
      v13 = v9;
      objc_msgSend(v5, "na_each:", v12);

    }
    else
    {
      NSLog(CFSTR("Cannot merge maps! All maps must be the same type as self (%@) to merge: %@"), self, v5);
      v9 = self;
    }
  }
  else
  {
    v9 = self;
    v5 = v4;
  }

  return v9;
}

uint64_t __50__HRECharacteristicActionMap_mergeWithActionMaps___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;

  v2 = a2;
  +[HREActionMap emptyMap](HREActionMap, "emptyMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4 ^ 1u;
}

uint64_t __50__HRECharacteristicActionMap_mergeWithActionMaps___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __50__HRECharacteristicActionMap_mergeWithActionMaps___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v3 = a2;
  objc_msgSend(v3, "characteristicTypeValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(*(id *)(a1 + 32), "characteristicTypeValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObjectsInArray:", v7);

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __50__HRECharacteristicActionMap_mergeWithActionMaps___block_invoke_4;
  v12[3] = &unk_24F217E28;
  v13 = *(id *)(a1 + 32);
  v14 = v3;
  v8 = v3;
  objc_msgSend(v11, "na_each:", v12);
  objc_msgSend(*(id *)(a1 + 32), "childMaps");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "childMaps");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v10);

}

void __50__HRECharacteristicActionMap_mergeWithActionMaps___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "characteristicTypeValues");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "characteristicTypeValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v4);

}

- (id)flattenedMapEvaluatedForObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HRECharacteristicActionMap;
  -[HREActionMap flattenedMapEvaluatedForObject:](&v10, sel_flattenedMapEvaluatedForObject_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    v6 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (!v8)
      NSLog(CFSTR("%@: [super flattenedMapEvaluatedForObject:%@] produced a non characteristic map: %@"), self, v4, v6);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HRECharacteristicActionMap;
  v4 = -[HREActionMap copyWithZone:](&v12, sel_copyWithZone_, a3);
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  -[HRECharacteristicActionMap characteristicTypeValues](self, "characteristicTypeValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  if (v9)
  {
    objc_msgSend(v7, "setCharacteristicTypeValues:", v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCharacteristicTypeValues:", v10);

  }
  return v5;
}

- (NSMutableDictionary)characteristicTypeValues
{
  return self->_characteristicTypeValues;
}

- (void)setCharacteristicTypeValues:(id)a3
{
  objc_storeStrong((id *)&self->_characteristicTypeValues, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicTypeValues, 0);
}

@end
