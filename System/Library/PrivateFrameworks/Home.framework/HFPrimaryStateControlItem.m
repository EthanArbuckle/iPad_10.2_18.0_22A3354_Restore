@implementation HFPrimaryStateControlItem

- (id)valueForCharacteristicValues:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[HFPrimaryStateControlItem primaryStateCharacteristicType](self, "primaryStateCharacteristicType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFPrimaryStateControlItem valueTransformer](self, "valueTransformer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transformedValueForValue:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (HFPrimaryStateControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HFPrimaryStateControlItem;
  return -[HFControlItem initWithValueSource:characteristicOptions:displayResults:](&v6, sel_initWithValueSource_characteristicOptions_displayResults_, a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueTransformer, 0);
  objc_storeStrong((id *)&self->_primaryStateCharacteristicType, 0);
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  if (-[HFPrimaryStateControlItem canCopyWithCharacteristicOptions:](self, "canCopyWithCharacteristicOptions:", a3))
  {
    v7 = objc_alloc((Class)objc_opt_class());
    -[HFPrimaryStateControlItem primaryStateCharacteristicType](self, "primaryStateCharacteristicType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFPrimaryStateControlItem valueTransformer](self, "valueTransformer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFControlItem displayResults](self, "displayResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v7, "initWithValueSource:characteristicType:valueTransformer:displayResults:", v6, v8, v9, v10);

    objc_msgSend(v11, "copyLatestResultsFromItem:", self);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (HFValueTransformer)valueTransformer
{
  return self->_valueTransformer;
}

- (NSString)primaryStateCharacteristicType
{
  return self->_primaryStateCharacteristicType;
}

- (BOOL)canCopyWithCharacteristicOptions:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HFControlItem characteristicOptions](self, "characteristicOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

- (HFPrimaryStateControlItem)initWithValueSource:(id)a3 characteristicType:(id)a4 valueTransformer:(id)a5 displayResults:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HFControlItemCharacteristicOptions *v14;
  void *v15;
  void *v16;
  HFControlItemCharacteristicOptions *v17;
  HFPrimaryStateControlItem *v18;
  uint64_t v19;
  NSString *primaryStateCharacteristicType;
  objc_super v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  v14 = [HFControlItemCharacteristicOptions alloc];
  v23 = &unk_1EA7CD108;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HFControlItemCharacteristicOptions initWithCharacteristicTypesByUsage:](v14, "initWithCharacteristicTypesByUsage:", v16);

  v22.receiver = self;
  v22.super_class = (Class)HFPrimaryStateControlItem;
  v18 = -[HFControlItem initWithValueSource:characteristicOptions:displayResults:](&v22, sel_initWithValueSource_characteristicOptions_displayResults_, v13, v17, v12);

  if (v18)
  {
    objc_storeStrong((id *)&v18->_valueTransformer, a5);
    v19 = objc_msgSend(v10, "copy");
    primaryStateCharacteristicType = v18->_primaryStateCharacteristicType;
    v18->_primaryStateCharacteristicType = (NSString *)v19;

  }
  return v18;
}

- (id)writeValue:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HFPrimaryStateControlItem;
  -[HFControlItem writeValue:](&v4, sel_writeValue_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)writePrimaryState:(int64_t)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFPrimaryStateControlItem writeValue:](self, "writeValue:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)toggleValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hasOptedToHH2");
  v5 = (void *)objc_opt_new();

  -[HFControlItem valueSource](self, "valueSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginTransactionWithReason:readPolicy:logger:", CFSTR("HFPrimaryStateControlItem-Toggle"), v5, 0);

  -[HFControlItem readValueAndPopulateStandardResults](self, "readValueAndPopulateStandardResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__HFPrimaryStateControlItem_toggleValue__block_invoke;
  v11[3] = &unk_1EA728350;
  v11[4] = self;
  objc_msgSend(v7, "flatMap:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFControlItem valueSource](self, "valueSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commitTransactionWithReason:", CFSTR("HFPrimaryStateControlItem-Toggle"));

  return v8;
}

id __40__HFPrimaryStateControlItem_toggleValue__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "integerValue");
    if (v5 == 2)
      v6 = 1;
    else
      v6 = 2 * (v5 == 1);
    objc_msgSend(*(id *)(a1 + 32), "writePrimaryState:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 35);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "futureWithError:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)characteristicValuesForValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFPrimaryStateControlItem valueTransformer](self, "valueTransformer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForTransformedValue:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFPrimaryStateControlItem primaryStateCharacteristicType](self, "primaryStateCharacteristicType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFControlItem normalizedCharacteristicValuesForValues:](self, "normalizedCharacteristicValuesForValues:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
