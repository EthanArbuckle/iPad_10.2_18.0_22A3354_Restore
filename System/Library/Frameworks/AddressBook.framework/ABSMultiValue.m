@implementation ABSMultiValue

+ (void)initialize
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___ABSMultiValue;
  objc_msgSendSuper2(&v2, sel_initialize);
  +[ABSAddressBook ABInitialize](ABSAddressBook, "ABInitialize");
}

- (ABSMultiValue)initWithPropertyType:(unsigned int)a3 mutable:(BOOL)a4 values:(id)a5
{
  id v8;
  ABSMultiValue *v9;
  ABSMultiValue *v10;
  uint64_t v11;
  NSMutableArray *values;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ABSMultiValue;
  v9 = -[ABSMultiValue init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_propertyType = a3 & 0xFFFFFEFF;
    v9->_mutable = a4;
    if (v8)
    {
      v11 = objc_msgSend(v8, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    values = v10->_values;
    v10->_values = (NSMutableArray *)v11;

  }
  return v10;
}

- (id)mutableCopy
{
  ABSMultiValue *v3;
  uint64_t v4;
  void *v5;
  ABSMultiValue *v6;

  v3 = [ABSMultiValue alloc];
  v4 = -[ABSMultiValue propertyType](self, "propertyType");
  -[ABSMultiValue values](self, "values");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ABSMultiValue initWithPropertyType:mutable:values:](v3, "initWithPropertyType:mutable:values:", v4, 1, v5);

  return v6;
}

- (id)copyValueAtIndex:(int64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  if (a3 < 0
    || (-[ABSMultiValue values](self, "values"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6 <= a3))
  {
    v10 = 0;
  }
  else
  {
    -[ABSMultiValue values](self, "values");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    sABSValueToABValueTransform_block_invoke((uint64_t)v9, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (-[ABSMultiValue mutable](self, "mutable") && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v11 = objc_msgSend(v10, "mutableCopy");
  else
    v11 = objc_msgSend(v10, "copy");
  v12 = (void *)v11;

  return v12;
}

- (id)allValues
{
  void *v2;
  void *v3;

  -[ABSMultiValue values](self, "values");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cn_map:", &__block_literal_global_12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __26__ABSMultiValue_allValues__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sABSValueToABValueTransform_block_invoke((uint64_t)v2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)labelAtIndex:(int64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  if (a3 < 0
    || (-[ABSMultiValue values](self, "values"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6 <= a3))
  {
    v9 = 0;
  }
  else
  {
    -[ABSMultiValue values](self, "values");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (unint64_t)indexForIdentifier:(int)a3
{
  void *v4;
  unint64_t v5;
  _QWORD v7[4];
  int v8;

  -[ABSMultiValue values](self, "values");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__ABSMultiValue_indexForIdentifier___block_invoke;
  v7[3] = &__block_descriptor_36_e31_B32__0__CNLabeledValue_8Q16_B24l;
  v8 = a3;
  v5 = objc_msgSend(v4, "indexOfObjectPassingTest:", v7);

  return v5;
}

BOOL __36__ABSMultiValue_indexForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "iOSLegacyIdentifier") == *(_DWORD *)(a1 + 32);
}

- (unint64_t)indexOfValue:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;

  sABValueToABSValueTransform_block_invoke_2((uint64_t)self, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABSMultiValue values](self, "values");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __30__ABSMultiValue_indexOfValue___block_invoke;
  v9[3] = &unk_24C2F47E8;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v9);

  return v7;
}

uint64_t __30__ABSMultiValue_indexOfValue___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

- (int)identifierAtIndex:(int64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  if (a3 < 0)
    return -1;
  -[ABSMultiValue values](self, "values");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
    return -1;
  -[ABSMultiValue values](self, "values");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = objc_msgSend(v8, "iOSLegacyIdentifier");
  return (int)v7;
}

- (int)nextLegacyIdentifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;

  -[ABSMultiValue values](self, "values");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  -[ABSMultiValue values](self, "values");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKeyPath:", CFSTR("@max.iOSLegacyIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue") + 1;

  return v7;
}

- (BOOL)addValue:(id)a3 label:(id)a4 outIdentifier:(int *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = -[ABSMultiValue mutable](self, "mutable");
  v11 = v10;
  if ((_DWORD)v10)
  {
    sABValueToABSValueTransform_block_invoke_2(v10, v8);
    v12 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBAD38], "labeledValueWithLabel:value:", v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setIOSLegacyIdentifier:", -[ABSMultiValue nextLegacyIdentifier](self, "nextLegacyIdentifier"));
    -[ABSMultiValue values](self, "values");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v13);

    if (a5)
      *a5 = objc_msgSend(v13, "iOSLegacyIdentifier");

    v8 = (id)v12;
  }

  return v11;
}

- (BOOL)insertValue:(id)a3 label:(id)a4 atIndex:(int64_t)a5 outIdentifier:(int *)a6
{
  id v10;
  id v11;
  _BOOL4 v12;
  BOOL v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v10 = a3;
  v11 = a4;
  v12 = -[ABSMultiValue mutable](self, "mutable");
  v13 = 0;
  if ((a5 & 0x8000000000000000) == 0 && v12)
  {
    -[ABSMultiValue values](self, "values");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15 >= a5)
    {
      sABValueToABSValueTransform_block_invoke_2(v16, v10);
      v17 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBAD38], "labeledValueWithLabel:value:", v11, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setIOSLegacyIdentifier:", -[ABSMultiValue nextLegacyIdentifier](self, "nextLegacyIdentifier"));
      -[ABSMultiValue values](self, "values");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "insertObject:atIndex:", v18, a5);

      if (a6)
        *a6 = objc_msgSend(v18, "iOSLegacyIdentifier");

      v13 = 1;
      v10 = (id)v17;
    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (BOOL)removeValueAtIndex:(int64_t)a3
{
  _BOOL4 v5;
  BOOL result;
  void *v7;
  unint64_t v8;
  void *v9;

  v5 = -[ABSMultiValue mutable](self, "mutable");
  result = 0;
  if ((a3 & 0x8000000000000000) == 0 && v5)
  {
    -[ABSMultiValue values](self, "values");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 <= a3)
    {
      return 0;
    }
    else
    {
      -[ABSMultiValue values](self, "values");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObjectAtIndex:", a3);

      return 1;
    }
  }
  return result;
}

- (BOOL)replaceValue:(id)a3 atIndex:(int64_t)a4
{
  id v6;
  _BOOL4 v7;
  BOOL v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = -[ABSMultiValue mutable](self, "mutable");
  v8 = 0;
  if ((a4 & 0x8000000000000000) == 0 && v7)
  {
    -[ABSMultiValue values](self, "values");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10 <= a4)
    {
      v8 = 0;
    }
    else
    {
      sABValueToABSValueTransform_block_invoke_2(v11, v6);
      v12 = objc_claimAutoreleasedReturnValue();

      -[ABSMultiValue values](self, "values");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (void *)MEMORY[0x24BDBAD38];
      objc_msgSend(v14, "label");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "labeledValueWithLabel:value:", v16, v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[ABSMultiValue values](self, "values");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "replaceObjectAtIndex:withObject:", a4, v17);

      v8 = 1;
      v6 = (id)v12;
    }
  }

  return v8;
}

- (BOOL)replaceLabel:(id)a3 atIndex:(int64_t)a4
{
  id v6;
  _BOOL4 v7;
  BOOL v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = -[ABSMultiValue mutable](self, "mutable");
  v8 = 0;
  if ((a4 & 0x8000000000000000) == 0 && v7)
  {
    -[ABSMultiValue values](self, "values");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10 <= a4)
    {
      v8 = 0;
    }
    else
    {
      -[ABSMultiValue values](self, "values");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x24BDBAD38];
      objc_msgSend(v12, "value");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "labeledValueWithLabel:value:", v6, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[ABSMultiValue values](self, "values");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "replaceObjectAtIndex:withObject:", a4, v15);

      v8 = 1;
    }
  }

  return v8;
}

- (unsigned)propertyType
{
  return self->_propertyType;
}

- (BOOL)mutable
{
  return self->_mutable;
}

- (NSMutableArray)values
{
  return self->_values;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
}

@end
