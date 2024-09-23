@implementation HFIncrementalStateControlItem

uint64_t __44__HFIncrementalStateControlItem_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stepValue");
}

uint64_t __44__HFIncrementalStateControlItem_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "incrementalCharacteristicType");
}

uint64_t __44__HFIncrementalStateControlItem_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "primaryStateControlItem");
}

void __44__HFIncrementalStateControlItem_na_identity__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__HFIncrementalStateControlItem_na_identity__block_invoke_3;
  v3[3] = &__block_descriptor_40_e17___NAIdentity_8__0l;
  v3[4] = *(_QWORD *)(a1 + 32);
  __44__HFIncrementalStateControlItem_na_identity__block_invoke_3((uint64_t)v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ED3786C8;
  qword_1ED3786C8 = v1;

}

id __44__HFIncrementalStateControlItem_na_identity__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v1 = (void *)MEMORY[0x1E0D519C8];
  v9.receiver = *(id *)(a1 + 32);
  v9.super_class = (Class)&OBJC_METACLASS___HFIncrementalStateControlItem;
  objc_msgSendSuper2(&v9, sel_na_identity);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "builderWithIdentity:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "appendCharacteristic:", &__block_literal_global_49);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendCharacteristic:", &__block_literal_global_51_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "appendCharacteristic:", &__block_literal_global_53_0);

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)na_identity
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__HFIncrementalStateControlItem_na_identity__block_invoke;
  v3[3] = &__block_descriptor_40_e5__8__0l;
  v3[4] = a1;
  __44__HFIncrementalStateControlItem_na_identity__block_invoke((uint64_t)v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __44__HFIncrementalStateControlItem_na_identity__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__HFIncrementalStateControlItem_na_identity__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  if (_MergedGlobals_5 != -1)
    dispatch_once(&_MergedGlobals_5, block);
  return (id)qword_1ED3786C8;
}

- (NSNumber)stepValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HFControlItem valueSource](self, "valueSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFIncrementalStateControlItem incrementalCharacteristicType](self, "incrementalCharacteristicType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadataForCharacteristicType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stepValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_percentageForCharacteristicValue:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v7;
}

- (NSString)incrementalCharacteristicType
{
  return self->_incrementalCharacteristicType;
}

- (id)valueForCharacteristicType:(id)a3 inBatchReadResponse:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  objc_super v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[5];

  v6 = a3;
  v7 = a4;
  -[HFIncrementalStateControlItem incrementalCharacteristicType](self, "incrementalCharacteristicType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", v8) & 1) == 0)
  {

    goto LABEL_6;
  }
  objc_msgSend(v7, "allResponsesForCharacteristicType:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (!v10)
  {
LABEL_6:
    v27.receiver = self;
    v27.super_class = (Class)HFIncrementalStateControlItem;
    -[HFControlItem valueForCharacteristicType:inBatchReadResponse:](&v27, sel_valueForCharacteristicType_inBatchReadResponse_, v6, v7);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  -[HFIncrementalStateControlItem primaryStateControlItem](self, "primaryStateControlItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "characteristicOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allCharacteristicTypes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allResponsesForCharacteristicTypes:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __80__HFIncrementalStateControlItem_valueForCharacteristicType_inBatchReadResponse___block_invoke;
  v30[3] = &unk_1EA72ADF8;
  v30[4] = self;
  objc_msgSend(v14, "na_filter:", v30);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "na_map:", &__block_literal_global_32_0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allResponsesForCharacteristicType:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v15;
  v28[1] = 3221225472;
  v28[2] = __80__HFIncrementalStateControlItem_valueForCharacteristicType_inBatchReadResponse___block_invoke_3;
  v28[3] = &unk_1EA72ADF8;
  v19 = v17;
  v29 = v19;
  objc_msgSend(v18, "na_filter:", v28);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "count"))
  {
    +[HFCharacteristicBatchReadResponse aggregatedReadResponseFromResponses:withAggregationPolicy:](HFCharacteristicBatchReadResponse, "aggregatedReadResponseFromResponses:withAggregationPolicy:", v20, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "value");
    v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HFControlItem metadataForCharacteristicType:](self, "metadataForCharacteristicType:", v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "minimumValue");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    v25 = &unk_1EA7CBB00;
    if (v23)
      v25 = (void *)v23;
    v22 = v25;

  }
LABEL_11:

  return v22;
}

- (id)valueForCharacteristicValues:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[HFIncrementalStateControlItem primaryStateControlItem](self, "primaryStateControlItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForCharacteristicValues:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  if (v7 == 2)
  {
    -[HFIncrementalStateControlItem incrementalCharacteristicType](self, "incrementalCharacteristicType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFControlItem valueSource](self, "valueSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFIncrementalStateControlItem incrementalCharacteristicType](self, "incrementalCharacteristicType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "metadataForCharacteristicType:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v12, "hf_percentageForCharacteristicValue:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = &unk_1EA7CD810;
    }

  }
  else
  {
    v13 = &unk_1EA7CD800;
  }

  return v13;
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (HFIncrementalStateControlItem)initWithValueSource:(id)a3 primaryStateControlItem:(id)a4 incrementalCharacteristicType:(id)a5 displayResults:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HFIncrementalStateControlItem *v15;
  uint64_t v16;
  HFPrimaryStateWriter *primaryStateControlItem;
  uint64_t v18;
  NSString *incrementalCharacteristicType;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend((id)objc_opt_class(), "optionsForPrimaryStateControlItem:incrementalCharacteristicType:", v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)HFIncrementalStateControlItem;
  v15 = -[HFControlItem initWithValueSource:characteristicOptions:displayResults:](&v21, sel_initWithValueSource_characteristicOptions_displayResults_, v10, v14, v13);

  if (v15)
  {
    v16 = objc_msgSend(v11, "copyWithValueSource:", v10);
    primaryStateControlItem = v15->_primaryStateControlItem;
    v15->_primaryStateControlItem = (HFPrimaryStateWriter *)v16;

    v18 = objc_msgSend(v12, "copy");
    incrementalCharacteristicType = v15->_incrementalCharacteristicType;
    v15->_incrementalCharacteristicType = (NSString *)v18;

  }
  return v15;
}

+ (id)optionsForPrimaryStateControlItem:(id)a3 incrementalCharacteristicType:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = a3;
  objc_msgSend(v5, "setWithObject:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "characteristicOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "optionsByAddingCharacteristicTypes:forUsage:", v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  if (-[HFIncrementalStateControlItem canCopyWithCharacteristicOptions:](self, "canCopyWithCharacteristicOptions:", a3))
  {
    -[HFIncrementalStateControlItem primaryStateControlItem](self, "primaryStateControlItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFIncrementalStateControlItem primaryStateControlItem](self, "primaryStateControlItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "characteristicOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "copyWithCharacteristicOptions:valueSource:", v9, v6);

    v11 = objc_alloc((Class)objc_opt_class());
    -[HFIncrementalStateControlItem incrementalCharacteristicType](self, "incrementalCharacteristicType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFControlItem displayResults](self, "displayResults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithValueSource:primaryStateControlItem:incrementalCharacteristicType:displayResults:", v6, v10, v12, v13);

    objc_msgSend(v14, "copyLatestResultsFromItem:", self);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

BOOL __80__HFIncrementalStateControlItem_valueForCharacteristicType_inBatchReadResponse___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _BOOL8 v12;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "primaryStateControlItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "characteristic");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "characteristicType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v7;
    objc_msgSend(v3, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForCharacteristicValues:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");

    v12 = v11 == 2;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)canCopyWithCharacteristicOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  -[HFIncrementalStateControlItem primaryStateControlItem](self, "primaryStateControlItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HFIncrementalStateControlItem primaryStateControlItem](self, "primaryStateControlItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "canCopyWithCharacteristicOptions:", v4);

  }
  else
  {
    v7 = 1;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1EA7CBAE8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFIncrementalStateControlItem incrementalCharacteristicType](self, "incrementalCharacteristicType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "containsObject:", v9);

  return v7 & v10;
}

- (id)updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFIncrementalStateControlItem primaryStateControlItem](self, "primaryStateControlItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWithOptions:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D519C0];
  v13.receiver = self;
  v13.super_class = (Class)HFIncrementalStateControlItem;
  -[HFItem updateWithOptions:](&v13, sel_updateWithOptions_, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "combineAllFutures:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "flatMap:", &__block_literal_global_28_3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (HFPrimaryStateWriter)primaryStateControlItem
{
  return self->_primaryStateControlItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incrementalCharacteristicType, 0);
  objc_storeStrong((id *)&self->_primaryStateControlItem, 0);
}

id __51__HFIncrementalStateControlItem_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(a2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __80__HFIncrementalStateControlItem_valueForCharacteristicType_inBatchReadResponse___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "containsObject:", v5);

  return v6;
}

- (HFIncrementalStateControlItem)initWithValueSource:(id)a3 incrementalAndPrimaryCharacteristicType:(id)a4 displayResults:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  HFPrimaryStateControlItem *v15;
  HFIncrementalStateControlItem *v16;
  _QWORD v18[4];
  id v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "metadataForCharacteristicType:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __108__HFIncrementalStateControlItem_initWithValueSource_incrementalAndPrimaryCharacteristicType_displayResults___block_invoke_3;
  v18[3] = &unk_1EA72AD88;
  v19 = v11;
  v13 = v11;
  +[HFValueTransformer transformerForValueClass:transformBlock:reverseTransformBlock:](HFValueTransformer, "transformerForValueClass:transformBlock:reverseTransformBlock:", v12, &__block_literal_global_37, v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HFPrimaryStateControlItem initWithValueSource:characteristicType:valueTransformer:displayResults:]([HFPrimaryStateControlItem alloc], "initWithValueSource:characteristicType:valueTransformer:displayResults:", v10, v9, v14, 0);
  v16 = -[HFIncrementalStateControlItem initWithValueSource:primaryStateControlItem:incrementalCharacteristicType:displayResults:](self, "initWithValueSource:primaryStateControlItem:incrementalCharacteristicType:displayResults:", v10, v15, v9, v8);

  return v16;
}

id __108__HFIncrementalStateControlItem_initWithValueSource_incrementalAndPrimaryCharacteristicType_displayResults___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  if (!a2)
    return &unk_1EA7CBAD0;
  v2 = (void *)MEMORY[0x1E0CB37E8];
  if (objc_msgSend(a2, "integerValue") < 1)
    v3 = 1;
  else
    v3 = 2;
  objc_msgSend(v2, "numberWithInteger:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __108__HFIncrementalStateControlItem_initWithValueSource_incrementalAndPrimaryCharacteristicType_displayResults___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = objc_msgSend(a2, "integerValue");
  v4 = *(void **)(a1 + 32);
  if (v3 == 2)
  {
    objc_msgSend(v4, "maximumValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = &unk_1EA7CD7F0;
  }
  else
  {
    objc_msgSend(v4, "minimumValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = &unk_1EA7CD800;
  }
  if (!v5)
    v5 = v7;
  v8 = v5;

  return v8;
}

- (HFIncrementalStateControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithValueSource_primaryStateControlItem_incrementalCharacteristicType_displayResults_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFIncrementalStateControlItem.m"), 79, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFIncrementalStateControlItem initWithValueSource:characteristicOptions:displayResults:]",
    v8);

  return 0;
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hasOptedToHH2");
  v5 = (void *)objc_opt_new();

  -[HFControlItem valueSource](self, "valueSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginTransactionWithReason:readPolicy:logger:", CFSTR("HFIncrementalStateControlItem-Toggle"), v5, 0);

  -[HFControlItem valueSource](self, "valueSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  -[HFIncrementalStateControlItem incrementalCharacteristicType](self, "incrementalCharacteristicType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "readValuesForCharacteristicTypes:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v11;
  -[HFIncrementalStateControlItem primaryStateControlItem](self, "primaryStateControlItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "readValueAndPopulateStandardResults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __44__HFIncrementalStateControlItem_toggleValue__block_invoke;
  v19[3] = &unk_1EA72ADB0;
  v19[4] = self;
  objc_msgSend(v15, "flatMap:", v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFControlItem valueSource](self, "valueSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commitTransactionWithReason:", CFSTR("HFIncrementalStateControlItem-Toggle"));

  return v16;
}

id __44__HFIncrementalStateControlItem_toggleValue__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  float v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;

  v3 = a2;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("value"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v21 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 35);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "futureWithError:", v9);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 32), "incrementalCharacteristicType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseForCharacteristicType:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "primaryStateControlItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "characteristicOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", &unk_1EA7CBAE8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "incrementalCharacteristicType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "containsObject:", v13);

  if ((v14 & 1) == 0 && objc_msgSend(v6, "integerValue") == 1)
  {
    if (v9)
    {
      objc_msgSend(v9, "floatValue");
      if (v15 < 0.00000011921)
      {
        objc_msgSend(*(id *)(a1 + 32), "writeValue:", &unk_1EA7CDEB8);
        v16 = objc_claimAutoreleasedReturnValue();
LABEL_12:
        v20 = (void *)v16;
        goto LABEL_13;
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "primaryStateControlItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v6, "integerValue");
  if (v18 == 2)
    v19 = 1;
  else
    v19 = 2 * (v18 == 1);
  objc_msgSend(v17, "writePrimaryState:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v20;
}

- (id)writeValue:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HFIncrementalStateControlItem;
  -[HFControlItem writeValue:](&v4, sel_writeValue_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __80__HFIncrementalStateControlItem_valueForCharacteristicType_inBatchReadResponse___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)characteristicValuesForValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    NSLog(CFSTR("Unexpected displayValue class: %@"), v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HFControlItem valueSource](self, "valueSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFIncrementalStateControlItem incrementalCharacteristicType](self, "incrementalCharacteristicType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "metadataForCharacteristicType:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "floatValue");
    objc_msgSend(v7, "hf_characteristicValueForPercentage:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v24 = v7;
      objc_msgSend(v4, "floatValue");
      v11 = v10;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFIncrementalStateControlItem primaryStateControlItem](self, "primaryStateControlItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "characteristicOptions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", &unk_1EA7CBAE8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFIncrementalStateControlItem incrementalCharacteristicType](self, "incrementalCharacteristicType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "containsObject:", v16);

      if ((v17 & 1) == 0)
      {
        if (v11 <= 0.00000011921)
          v18 = 1;
        else
          v18 = 2;
        -[HFIncrementalStateControlItem primaryStateControlItem](self, "primaryStateControlItem");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "characteristicValuesForValue:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addEntriesFromDictionary:", v21);

      }
      -[HFIncrementalStateControlItem incrementalCharacteristicType](self, "incrementalCharacteristicType");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, v22);

      v7 = v24;
    }
    else
    {
      NSLog(CFSTR("Could not convert displayValue: %@ to a percentage with characteristic metadata: %@"), v4, v7);
      v12 = (void *)MEMORY[0x1E0C9AA70];
    }

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v12;
}

+ (id)readOnlyCharacteristicTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

@end
