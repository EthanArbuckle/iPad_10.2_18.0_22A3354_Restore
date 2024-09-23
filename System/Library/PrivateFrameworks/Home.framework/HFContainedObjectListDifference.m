@implementation HFContainedObjectListDifference

+ (id)containedObjectDifferenceWithKey:(id)a3 objectsA:(id)a4 objectsB:(id)a5 block:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  int v31;
  HFContainedObjectListDifference *v32;
  void *v33;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;

  v9 = a3;
  v10 = a6;
  v11 = (void *)MEMORY[0x1E0C99E08];
  v12 = a5;
  v13 = a4;
  objc_msgSend(v11, "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "na_reduceWithInitialValue:reducer:", v14, &__block_literal_global_106);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "na_reduceWithInitialValue:reducer:", v16, &__block_literal_global_108);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v15, "allKeys");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v17, "allKeys");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setWithArray:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setByAddingObjectsFromSet:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __92__HFContainedObjectListDifference_containedObjectDifferenceWithKey_objectsA_objectsB_block___block_invoke_3;
  v35[3] = &unk_1EA728CB8;
  v26 = v10;
  v38 = v26;
  v27 = v15;
  v36 = v27;
  v28 = v17;
  v37 = v28;
  objc_msgSend(v24, "na_reduceWithInitialValue:reducer:", v25, v35);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "allValues");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "na_any:", &__block_literal_global_112);

  if (v31)
  {
    v32 = -[HFDifference initWithKey:priority:]([HFContainedObjectListDifference alloc], "initWithKey:priority:", v9, 2);
    objc_msgSend(v29, "allValues");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFContainedObjectListDifference setContainedObjectResults:](v32, "setContainedObjectResults:", v33);

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

id __92__HFContainedObjectListDifference_containedObjectDifferenceWithKey_objectsA_objectsB_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "hash"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v7);

  return v4;
}

id __92__HFContainedObjectListDifference_containedObjectDifferenceWithKey_objectsA_objectsB_block___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "hash"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v7);

  return v4;
}

id __92__HFContainedObjectListDifference_containedObjectDifferenceWithKey_objectsA_objectsB_block___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v8);

  return v5;
}

BOOL __92__HFContainedObjectListDifference_containedObjectDifferenceWithKey_objectsA_objectsB_block___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "realDifferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

+ (id)containedObjectDifferenceWithKey:(id)a3 objectsA:(id)a4 objectsB:(id)a5
{
  return (id)objc_msgSend(a1, "containedObjectDifferenceWithKey:objectsA:objectsB:block:", a3, a4, a5, &__block_literal_global_115);
}

HFComparisonResult *__86__HFContainedObjectListDifference_containedObjectDifferenceWithKey_objectsA_objectsB___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  HFComparisonResult *v11;
  HFComparisonResult *v12;

  v4 = a2;
  v5 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1F03F6EB8))
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;
  v8 = v5;
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1F03F6EB8))
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v4)
  {
    objc_msgSend(v7, "compareToObject:", v10);
    v11 = (HFComparisonResult *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = -[HFComparisonResult initWithObjectA:objectB:]([HFComparisonResult alloc], "initWithObjectA:objectB:", v7, v10);
  }
  v12 = v11;

  return v12;
}

- (BOOL)isASubsetOfB
{
  NSNumber *isASubsetOfBValue;
  void *v4;
  NSNumber *v5;
  NSNumber *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  isASubsetOfBValue = self->_isASubsetOfBValue;
  if (!isASubsetOfBValue)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 1;
    -[HFContainedObjectListDifference containedObjectResults](self, "containedObjectResults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __47__HFContainedObjectListDifference_isASubsetOfB__block_invoke;
    v8[3] = &unk_1EA728D60;
    v8[4] = &v9;
    objc_msgSend(v4, "na_each:", v8);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v10 + 24));
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v6 = self->_isASubsetOfBValue;
    self->_isASubsetOfBValue = v5;

    _Block_object_dispose(&v9, 8);
    isASubsetOfBValue = self->_isASubsetOfBValue;
  }
  return -[NSNumber BOOLValue](isASubsetOfBValue, "BOOLValue");
}

void __47__HFContainedObjectListDifference_isASubsetOfB__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "objectA");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(v7, "realDifferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }

}

- (BOOL)isBSubsetOfA
{
  NSNumber *isBSubsetOfAValue;
  void *v4;
  NSNumber *v5;
  NSNumber *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  isBSubsetOfAValue = self->_isBSubsetOfAValue;
  if (!isBSubsetOfAValue)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 1;
    -[HFContainedObjectListDifference containedObjectResults](self, "containedObjectResults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __47__HFContainedObjectListDifference_isBSubsetOfA__block_invoke;
    v8[3] = &unk_1EA728D60;
    v8[4] = &v9;
    objc_msgSend(v4, "na_each:", v8);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v10 + 24));
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v6 = self->_isBSubsetOfAValue;
    self->_isBSubsetOfAValue = v5;

    _Block_object_dispose(&v9, 8);
    isBSubsetOfAValue = self->_isBSubsetOfAValue;
  }
  return -[NSNumber BOOLValue](isBSubsetOfAValue, "BOOLValue");
}

void __47__HFContainedObjectListDifference_isBSubsetOfA__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "objectB");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(v7, "realDifferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }

}

- (id)reevaluateWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = (void *)-[HFContainedObjectListDifference copy](self, "copy");
  -[HFContainedObjectListDifference containedObjectResults](self, "containedObjectResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__HFContainedObjectListDifference_reevaluateWithBlock___block_invoke;
  v10[3] = &unk_1EA728D88;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_map:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setContainedObjectResults:", v8);
  objc_msgSend(v5, "setIsASubsetOfBValue:", 0);
  objc_msgSend(v5, "setIsBSubsetOfAValue:", 0);

  return v5;
}

id __55__HFContainedObjectListDifference_reevaluateWithBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "objectA");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *, id))(v2 + 16))(v2, v4, v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HFContainedObjectListDifference;
  v4 = -[HFDifference copyWithZone:](&v11, sel_copyWithZone_, a3);
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  -[HFContainedObjectListDifference containedObjectResults](self, "containedObjectResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v7, "setContainedObjectResults:", v9);

  return v7;
}

- (id)descriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HFContainedObjectListDifference;
  -[HFDifference descriptionBuilder](&v8, sel_descriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFContainedObjectListDifference containedObjectResults](self, "containedObjectResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_filter:", &__block_literal_global_164_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("contained results"));

  return v3;
}

BOOL __53__HFContainedObjectListDifference_descriptionBuilder__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "realDifferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSArray)containedObjectResults
{
  return self->_containedObjectResults;
}

- (void)setContainedObjectResults:(id)a3
{
  objc_storeStrong((id *)&self->_containedObjectResults, a3);
}

- (NSNumber)isASubsetOfBValue
{
  return self->_isASubsetOfBValue;
}

- (void)setIsASubsetOfBValue:(id)a3
{
  objc_storeStrong((id *)&self->_isASubsetOfBValue, a3);
}

- (NSNumber)isBSubsetOfAValue
{
  return self->_isBSubsetOfAValue;
}

- (void)setIsBSubsetOfAValue:(id)a3
{
  objc_storeStrong((id *)&self->_isBSubsetOfAValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isBSubsetOfAValue, 0);
  objc_storeStrong((id *)&self->_isASubsetOfBValue, 0);
  objc_storeStrong((id *)&self->_containedObjectResults, 0);
}

@end
