@implementation HFMultiStateValueSet

- (BOOL)addValue:(id)a3 displayResults:(id)a4 addOnlyIfValid:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  BOOL v19;
  void *v21;
  void *v22;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFMultiStateControlItem.m"), 175, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("value"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFMultiStateControlItem.m"), 176, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayResults"));

LABEL_3:
  -[HFMultiStateValueSet displayResultsByValue](self, "displayResultsByValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    NSLog(CFSTR("Value %@ already exists in value set %@!"), v9, self);
  if (!v5)
    goto LABEL_8;
  -[HFMultiStateValueSet characteristicMetadata](self, "characteristicMetadata");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_8;
  v15 = (void *)v14;
  -[HFMultiStateValueSet characteristicMetadata](self, "characteristicMetadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hf_isValidValue:", v9);

  if (!v17)
  {
    v19 = 0;
  }
  else
  {
LABEL_8:
    -[HFMultiStateValueSet displayResultsByValue](self, "displayResultsByValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v11, v9);

    v19 = 1;
  }

  return v19;
}

- (NSSet)allValues
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HFMultiStateValueSet displayResultsByValue](self, "displayResultsByValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (NSMutableDictionary)displayResultsByValue
{
  return self->_displayResultsByValue;
}

- (HMCharacteristicMetadata)characteristicMetadata
{
  return self->_characteristicMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayResultsByValue, 0);
  objc_storeStrong(&self->_valueComparator, 0);
  objc_storeStrong((id *)&self->_characteristicMetadata, 0);
}

+ (id)binaryValueSetWithCharacteristicMetadata:(id)a3 firstValue:(id)a4 firstTitle:(id)a5 secondValue:(id)a6 secondTitle:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  HFMultiStateValueSet *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  HFMultiStateValueSet *v23;
  _QWORD v25[2];
  const __CFString *v26;
  id v27;
  const __CFString *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  if (a3)
  {
    v15 = a3;
    v16 = -[HFMultiStateValueSet initWithCharacteristicMetadata:]([HFMultiStateValueSet alloc], "initWithCharacteristicMetadata:", v15);

    v28 = CFSTR("title");
    v29[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMultiStateValueSet addValue:displayResults:](v16, "addValue:displayResults:", v11, v17);

    v26 = CFSTR("title");
    v27 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMultiStateValueSet addValue:displayResults:](v16, "addValue:displayResults:", v13, v18);

    -[HFMultiStateValueSet allValues](v16, "allValues");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    if (v20 == 2)
    {
      v25[0] = v11;
      v25[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[HFUtilities comparatorWithSortedObjects:](HFUtilities, "comparatorWithSortedObjects:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFMultiStateValueSet setValueComparator:](v16, "setValueComparator:", v22);

      v23 = v16;
    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (BOOL)addValue:(id)a3 displayResults:(id)a4
{
  return -[HFMultiStateValueSet addValue:displayResults:addOnlyIfValid:](self, "addValue:displayResults:addOnlyIfValid:", a3, a4, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[HFMultiStateValueSet characteristicMetadata](self, "characteristicMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (_QWORD *)objc_msgSend(v4, "initWithCharacteristicMetadata:", v5);

  -[HFMultiStateValueSet displayResultsByValue](self, "displayResultsByValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "mutableCopy");
  v9 = (void *)v6[3];
  v6[3] = v8;

  -[HFMultiStateValueSet valueComparator](self, "valueComparator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValueComparator:", v10);

  return v6;
}

- (void)setValueComparator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (HFMultiStateValueSet)initWithCharacteristicMetadata:(id)a3
{
  id v5;
  HFMultiStateValueSet *v6;
  HFMultiStateValueSet *v7;
  uint64_t v8;
  NSMutableDictionary *displayResultsByValue;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFMultiStateValueSet;
  v6 = -[HFMultiStateValueSet init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_characteristicMetadata, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    displayResultsByValue = v7->_displayResultsByValue;
    v7->_displayResultsByValue = (NSMutableDictionary *)v8;

  }
  return v7;
}

- (id)valueComparator
{
  return self->_valueComparator;
}

- (HFMultiStateValueSet)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithCharacteristicMetadata_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFMultiStateControlItem.m"), 112, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFMultiStateValueSet init]",
    v5);

  return 0;
}

- (NSArray)sortedValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[HFMultiStateValueSet allValues](self, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFMultiStateValueSet valueComparator](self, "valueComparator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HFMultiStateValueSet valueComparator](self, "valueComparator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedArrayUsingComparator:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v4;
  }

  return (NSArray *)v7;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  void *v8;
  unint64_t v9;

  -[HFMultiStateValueSet sortedValues](self, "sortedValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", a3, a4, a5);

  return v9;
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[HFMultiStateValueSet displayResultsByValue](self, "displayResultsByValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)displayResultsForValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HFMultiStateValueSet displayResultsByValue](self, "displayResultsByValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[HFMultiStateValueSet sortedValues](self, "sortedValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)removeValue:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[HFMultiStateValueSet displayResultsByValue](self, "displayResultsByValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    NSLog(CFSTR("Value %@ does not exist in value set %@!"), v7, self);
  -[HFMultiStateValueSet displayResultsByValue](self, "displayResultsByValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v7);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HFMultiStateValueSet displayResultsByValue](self, "displayResultsByValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayResultsByValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)addValuesFromArray:(id)a3 displayResultsGenerator:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__HFMultiStateValueSet_addValuesFromArray_displayResultsGenerator___block_invoke;
  v8[3] = &unk_1EA732B88;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v8);

}

void __67__HFMultiStateValueSet_addValuesFromArray_displayResultsGenerator___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "displayResultsForValue:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = v8;
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v8);
      v6 = objc_claimAutoreleasedReturnValue();
      v4 = v8;
      v7 = (void *)v6;
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0C9AA70];
    }
    objc_msgSend(*(id *)(a1 + 32), "addValue:displayResults:", v4, v7);

  }
}

- (void)removeValuesFromArray:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFMultiStateValueSet displayResultsByValue](self, "displayResultsByValue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectsForKeys:", v4);

}

- (void)unionSet:(id)a3 displayResultsGenerator:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__HFMultiStateValueSet_unionSet_displayResultsGenerator___block_invoke;
  v8[3] = &unk_1EA732BB0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v8);

}

void __57__HFMultiStateValueSet_unionSet_displayResultsGenerator___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "displayResultsForValue:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = v8;
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v8);
      v6 = objc_claimAutoreleasedReturnValue();
      v4 = v8;
      v7 = (void *)v6;
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0C9AA70];
    }
    objc_msgSend(*(id *)(a1 + 32), "addValue:displayResults:", v4, v7);

  }
}

- (void)minusSet:(id)a3
{
  id v4;

  objc_msgSend(a3, "allObjects");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HFMultiStateValueSet removeValuesFromArray:](self, "removeValuesFromArray:", v4);

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HFMultiStateValueSet displayResultsByValue](self, "displayResultsByValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v2;
  void *v3;

  -[HFMultiStateValueSet displayResultsByValue](self, "displayResultsByValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
