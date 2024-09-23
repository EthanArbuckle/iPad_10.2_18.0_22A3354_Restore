@implementation WFContentComparisonPredicate

- (WFContentComparisonPredicate)initWithValue:(id)a3 valueBlock:(id)a4 property:(id)a5 comparisonType:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  WFContentComparisonPredicate *v13;
  NSCopying *v14;
  NSCopying *value;
  uint64_t v16;
  id valueBlock;
  WFContentComparisonPredicate *v18;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WFContentComparisonPredicate;
  v13 = -[WFContentComparisonPredicate init](&v20, sel_init);
  if (v13)
  {
    if (objc_msgSend(v10, "conformsToProtocol:", &unk_25473DF70))
      v14 = (NSCopying *)objc_msgSend(v10, "copyWithZone:", MEMORY[0x20BD3D1CC]());
    else
      v14 = (NSCopying *)v10;
    value = v13->_value;
    v13->_value = v14;

    v16 = objc_msgSend(v11, "copy");
    valueBlock = v13->_valueBlock;
    v13->_valueBlock = (id)v16;

    objc_storeStrong((id *)&v13->_property, a5);
    v13->_comparisonType = a6;
    v18 = v13;
  }

  return v13;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentComparisonPredicate property](self, "property");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentComparisonPredicate value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, property: %@, value: %@, comparison: %lu>"), v5, self, v6, v7, -[WFContentComparisonPredicate comparisonType](self, "comparisonType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)comparableValueForValue:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (id)mappings;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      v10 = v4;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        -[WFContentComparisonPredicate property](self, "property", (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, void *))(v11 + 16))(v11, v12, v10);
        v4 = (id)objc_claimAutoreleasedReturnValue();

        ++v9;
        v10 = v4;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)evaluateWithObject:(id)a3 propertySubstitutor:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, id, void *);
  void (**v10)(id, _QWORD);
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  void (**v14)(id, _QWORD);

  v8 = a3;
  v9 = (void (**)(id, id, void *))a4;
  v10 = (void (**)(id, _QWORD))a5;
  if (v10)
  {
    -[WFContentComparisonPredicate property](self, "property");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9
      && (v9[2](v9, v8, v11), v12 = objc_claimAutoreleasedReturnValue(), v11, (v11 = (void *)v12) == 0))
    {
      v10[2](v10, 0);
    }
    else
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __89__WFContentComparisonPredicate_evaluateWithObject_propertySubstitutor_completionHandler___block_invoke;
      v13[3] = &unk_24C4E2890;
      v13[4] = self;
      v14 = v10;
      objc_msgSend(v11, "getValuesForObject:completionHandler:", v8, v13);

    }
  }

}

- (BOOL)evaluateWithValues:(id)a3
{
  id v4;
  uint64_t (**v5)(_QWORD, _QWORD);
  uint64_t v6;
  void *v7;
  char v8;
  _QWORD v10[5];
  _QWORD aBlock[5];

  v4 = a3;
  -[WFContentComparisonPredicate valueBlock](self, "valueBlock");
  v5 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  if (!v5)
  {
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__WFContentComparisonPredicate_evaluateWithValues___block_invoke;
    aBlock[3] = &unk_24C4DF168;
    aBlock[4] = self;
    v5 = (uint64_t (**)(_QWORD, _QWORD))_Block_copy(aBlock);
  }
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __51__WFContentComparisonPredicate_evaluateWithValues___block_invoke_2;
  v10[3] = &unk_24C4E31A8;
  v10[4] = self;
  objc_msgSend(v4, "if_map:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = ((uint64_t (**)(_QWORD, void *))v5)[2](v5, v7);

  return v8;
}

- (NSSet)containedProperties
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[WFContentComparisonPredicate property](self, "property");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (WFContentProperty)property
{
  return self->_property;
}

- (NSCopying)value
{
  return self->_value;
}

- (id)valueBlock
{
  return self->_valueBlock;
}

- (unint64_t)comparisonType
{
  return self->_comparisonType;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_valueBlock, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_property, 0);
}

uint64_t __51__WFContentComparisonPredicate_evaluateWithValues___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v32;
  id obj;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "property");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "multipleValues");

  if (!v5)
  {
    v7 = (void *)MEMORY[0x24BDD14B8];
    v8 = (void *)MEMORY[0x24BDD1548];
    objc_msgSend(v3, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "expressionForConstantValue:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDD1548];
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v12, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "comparableValueForValue:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "expressionForConstantValue:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(*(id *)(a1 + 32), "comparisonType");
    objc_msgSend(*(id *)(a1 + 32), "property");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v10, v15, 0, v16, objc_msgSend(v17, "caseInsensitive"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
    v6 = objc_msgSend(v18, "evaluateWithObject:", 0, v32);

    goto LABEL_18;
  }
  if (objc_msgSend(v3, "count") || objc_msgSend(*(id *)(a1 + 32), "comparisonType") != 5)
  {
    v19 = (void *)objc_opt_new();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v32 = v3;
    obj = v3;
    v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v35)
    {
      v34 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v37 != v34)
            objc_enumerationMutation(obj);
          v21 = (void *)MEMORY[0x24BDD14B8];
          objc_msgSend(MEMORY[0x24BDD1548], "expressionForConstantValue:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i), v32);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)MEMORY[0x24BDD1548];
          v24 = *(void **)(a1 + 32);
          objc_msgSend(v24, "value");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "comparableValueForValue:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "expressionForConstantValue:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(*(id *)(a1 + 32), "comparisonType");
          objc_msgSend(*(id *)(a1 + 32), "property");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v22, v27, 0, v28, objc_msgSend(v29, "caseInsensitive"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v30);

        }
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v35);
    }

    if (objc_msgSend(*(id *)(a1 + 32), "comparisonType") == 5)
      objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", v19);
    else
      objc_msgSend(MEMORY[0x24BDD14C0], "orPredicateWithSubpredicates:", v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v32;

    goto LABEL_17;
  }
  v6 = 1;
LABEL_18:

  return v6;
}

uint64_t __51__WFContentComparisonPredicate_evaluateWithValues___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "comparableValueForValue:", a2);
}

uint64_t __89__WFContentComparisonPredicate_evaluateWithObject_propertySubstitutor_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "evaluateWithValues:", a2));
}

+ (id)predicateWithValue:(id)a3 forProperty:(id)a4 comparisonType:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithValue:valueBlock:property:comparisonType:", v9, 0, v8, a5);

  return v10;
}

+ (id)predicateWithValueBlock:(id)a3 forProperty:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithValue:valueBlock:property:comparisonType:", 0, v7, v6, 4);

  return v8;
}

+ (void)registerValueMapping:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v3 = registerValueMapping__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&registerValueMapping__onceToken, &__block_literal_global_10069);
  v5 = (void *)mappings;
  v6 = _Block_copy(v4);

  objc_msgSend(v5, "addObject:", v6);
}

+ (void)initialize
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__WFContentComparisonPredicate_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, block);
}

uint64_t __42__WFContentComparisonPredicate_initialize__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "registerValueMapping:", &__block_literal_global_30);
  objc_msgSend(*(id *)(a1 + 32), "registerValueMapping:", &__block_literal_global_33_10057);
  objc_msgSend(*(id *)(a1 + 32), "registerValueMapping:", &__block_literal_global_36);
  objc_msgSend(*(id *)(a1 + 32), "registerValueMapping:", &__block_literal_global_39);
  return objc_msgSend(*(id *)(a1 + 32), "registerValueMapping:", &__block_literal_global_42_10058);
}

id __42__WFContentComparisonPredicate_initialize__block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "addressString");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

id __42__WFContentComparisonPredicate_initialize__block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "string");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

id __42__WFContentComparisonPredicate_initialize__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "address");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

id __42__WFContentComparisonPredicate_initialize__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "normalizedPhoneNumber");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

id __42__WFContentComparisonPredicate_initialize__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "absoluteString");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

void __53__WFContentComparisonPredicate_registerValueMapping___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)mappings;
  mappings = v0;

}

@end
