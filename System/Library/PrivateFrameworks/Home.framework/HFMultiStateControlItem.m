@implementation HFMultiStateControlItem

void __38__HFMultiStateControlItem_na_identity__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v1 = (void *)MEMORY[0x1E0D519C8];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS___HFMultiStateControlItem;
  objc_msgSendSuper2(&v7, sel_na_identity);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "builderWithIdentity:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendCharacteristic:withRole:comparatorBlock:hashBlock:", &__block_literal_global_95, 3, 0, &__block_literal_global_3_5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "build");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_1ED3786A8;
  qword_1ED3786A8 = v5;

}

+ (id)na_identity
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__HFMultiStateControlItem_na_identity__block_invoke;
  v3[3] = &__block_descriptor_40_e5__8__0l;
  v3[4] = a1;
  __38__HFMultiStateControlItem_na_identity__block_invoke((uint64_t)v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __38__HFMultiStateControlItem_na_identity__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__HFMultiStateControlItem_na_identity__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  if (_MergedGlobals_1_1 != -1)
    dispatch_once(&_MergedGlobals_1_1, block);
  return (id)qword_1ED3786A8;
}

id __38__HFMultiStateControlItem_na_identity__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "possibleValueSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HFMultiStateValueSet)possibleValueSet
{
  return self->_possibleValueSet;
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (HFMultiStateControlItem)initWithValueSource:(id)a3 characteristicType:(id)a4 possibleValueSet:(id)a5 displayResults:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  HFMultiStateControlItem *v17;

  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v10, "setWithObject:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFControlItemCharacteristicOptions optionsWithReadWriteCharacteristicTypes:](HFControlItemCharacteristicOptions, "optionsWithReadWriteCharacteristicTypes:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[HFMultiStateControlItem initWithValueSource:multiStateCharacteristicType:allCharacteristicOptions:possibleValueSet:displayResults:](self, "initWithValueSource:multiStateCharacteristicType:allCharacteristicOptions:possibleValueSet:displayResults:", v14, v13, v16, v12, v11);
  return v17;
}

- (HFMultiStateControlItem)initWithValueSource:(id)a3 multiStateCharacteristicType:(id)a4 allCharacteristicOptions:(id)a5 possibleValueSet:(id)a6 displayResults:(id)a7
{
  id v12;
  id v13;
  HFMultiStateControlItem *v14;
  uint64_t v15;
  HFMultiStateValueSet *possibleValueSet;
  uint64_t v17;
  NSString *multiStateCharacteristicType;
  objc_super v20;

  v12 = a4;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HFMultiStateControlItem;
  v14 = -[HFControlItem initWithValueSource:characteristicOptions:displayResults:](&v20, sel_initWithValueSource_characteristicOptions_displayResults_, a3, a5, a7);
  if (v14)
  {
    v15 = objc_msgSend(v13, "copy");
    possibleValueSet = v14->_possibleValueSet;
    v14->_possibleValueSet = (HFMultiStateValueSet *)v15;

    v17 = objc_msgSend(v12, "copy");
    multiStateCharacteristicType = v14->_multiStateCharacteristicType;
    v14->_multiStateCharacteristicType = (NSString *)v17;

  }
  return v14;
}

- (id)valueForCharacteristicValues:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HFMultiStateControlItem multiStateCharacteristicType](self, "multiStateCharacteristicType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = objc_alloc((Class)objc_opt_class());
  -[HFMultiStateControlItem multiStateCharacteristicType](self, "multiStateCharacteristicType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMultiStateControlItem possibleValueSet](self, "possibleValueSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFControlItem displayResults](self, "displayResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithValueSource:characteristicType:possibleValueSet:displayResults:", v5, v7, v8, v9);

  objc_msgSend(v10, "copyLatestResultsFromItem:", self);
  return v10;
}

- (NSString)multiStateCharacteristicType
{
  return self->_multiStateCharacteristicType;
}

uint64_t __38__HFMultiStateControlItem_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v2 = a2;
  v3 = objc_opt_class();
  v4 = v2;
  if (!v4)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v4;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v3, objc_opt_class());

LABEL_7:
    v6 = 0;
  }

  v9 = objc_msgSend(v6, "computeHashFromContents");
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleValueSet, 0);
  objc_storeStrong((id *)&self->_multiStateCharacteristicType, 0);
}

- (HFMultiStateControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithValueSource_characteristicType_possibleValueSet_displayResults_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFMultiStateControlItem.m"), 57, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFMultiStateControlItem initWithValueSource:characteristicOptions:displayResults:]",
    v8);

  return 0;
}

- (id)characteristicValuesForValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return MEMORY[0x1E0C9AA70];
  v4 = a3;
  -[HFMultiStateControlItem multiStateCharacteristicType](self, "multiStateCharacteristicType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFControlItem normalizedCharacteristicValuesForValues:](self, "normalizedCharacteristicValuesForValues:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
