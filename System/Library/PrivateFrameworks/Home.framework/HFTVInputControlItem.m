@implementation HFTVInputControlItem

+ (id)inputCharacteristicTypes
{
  if (_MergedGlobals_302 != -1)
    dispatch_once(&_MergedGlobals_302, &__block_literal_global_2_29);
  return (id)qword_1ED379B68;
}

void __48__HFTVInputControlItem_inputCharacteristicTypes__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB8790], *MEMORY[0x1E0CB8798], 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED379B68;
  qword_1ED379B68 = v0;

}

+ (id)readOnlyOptionalInputCharacteristicTypes
{
  if (qword_1ED379B70 != -1)
    dispatch_once(&qword_1ED379B70, &__block_literal_global_4_7);
  return (id)qword_1ED379B78;
}

void __64__HFTVInputControlItem_readOnlyOptionalInputCharacteristicTypes__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB88A0], *MEMORY[0x1E0CB8918], 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED379B78;
  qword_1ED379B78 = v0;

}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

+ (id)_inputSourceValueComparatorForTelevisionProfile:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD aBlock[4];
  id v8;

  v3 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__HFTVInputControlItem__inputSourceValueComparatorForTelevisionProfile___block_invoke;
  aBlock[3] = &unk_1EA73CAF0;
  v8 = v3;
  v4 = v3;
  v5 = _Block_copy(aBlock);

  return v5;
}

uint64_t __72__HFTVInputControlItem__inputSourceValueComparatorForTelevisionProfile___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "hf_mediaSourceComparator");
  v7 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = ((uint64_t (**)(_QWORD, void *, void *))v7)[2](v7, v8, v9);

  if (!v10)
  {
    objc_msgSend(v5, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "localizedStandardCompare:", v12);

  }
  return v10;
}

- (HFTVInputControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithValueSource_characteristicOptions_displayResults_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFTVInputControlItem.m"), 66, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFTVInputControlItem initWithValueSource:characteristicOptions:displayResults:]",
    v8);

  return 0;
}

- (HFTVInputControlItem)initWithValueSource:(id)a3 displayResults:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HFControlItemCharacteristicOptions *v11;
  HFTVInputControlItem *v12;
  objc_super v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = &unk_1EA7CD120;
  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "inputCharacteristicTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = &unk_1EA7CD138;
  v16[0] = v8;
  objc_msgSend((id)objc_opt_class(), "readOnlyOptionalInputCharacteristicTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[HFControlItemCharacteristicOptions initWithCharacteristicTypesByUsage:]([HFControlItemCharacteristicOptions alloc], "initWithCharacteristicTypesByUsage:", v10);
  v14.receiver = self;
  v14.super_class = (Class)HFTVInputControlItem;
  v12 = -[HFControlItem initWithValueSource:characteristicOptions:displayResults:](&v14, sel_initWithValueSource_characteristicOptions_displayResults_, v7, v11, v6);

  return v12;
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = objc_alloc((Class)objc_opt_class());
  -[HFControlItem displayResults](self, "displayResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithValueSource:displayResults:", v5, v7);

  objc_msgSend(v8, "copyLatestResultsFromItem:", self);
  return v8;
}

- (BOOL)supportsItemRepresentingServices:(id)a3
{
  return objc_msgSend(a3, "na_any:", &__block_literal_global_16_8);
}

uint64_t __57__HFTVInputControlItem_supportsItemRepresentingServices___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "serviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB9A48]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v2, "serviceType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB9AF0]);

  }
  return v4;
}

- (id)readValueAndPopulateStandardResults
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HFTVInputControlItem;
  -[HFControlItem readValueAndPopulateStandardResults](&v10, sel_readValueAndPopulateStandardResults);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _HFLocalizedStringWithDefaultValue(CFSTR("HFControlShortTitleInputSelection"), CFSTR("HFControlShortTitleInputSelection"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("title"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1EA7CD150, CFSTR("controlItemPurpose"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__HFTVInputControlItem_readValueAndPopulateStandardResults__block_invoke;
  v8[3] = &unk_1EA728350;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v2, "flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __59__HFTVInputControlItem_readValueAndPopulateStandardResults__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v3, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)characteristicValuesForValue:(id)a3
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)valueForCharacteristicValues:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CB8798]);
}

- (id)valueForCharacteristicType:(id)a3 inBatchReadResponse:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  objc_super v31;

  v6 = a3;
  v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)HFTVInputControlItem;
  -[HFControlItem valueForCharacteristicType:inBatchReadResponse:](&v31, sel_valueForCharacteristicType_inBatchReadResponse_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB88F8])
    && (v9 = *MEMORY[0x1E0CB8798], objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB8798]))
    && (objc_msgSend(v7, "responseForCharacteristicType:", v9),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "value"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    objc_msgSend(v7, "responseForCharacteristicType:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "valueWithExpectedClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v7, "servicesWithValue:forCharacteristicType:", v13, v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "anyObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = v15;
      objc_msgSend(v15, "accessory");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "televisionProfiles");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstObject");
      v18 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "hf_childServices");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "na_filter:", &__block_literal_global_28_8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __71__HFTVInputControlItem_valueForCharacteristicType_inBatchReadResponse___block_invoke_2;
      v28[3] = &unk_1EA7343A8;
      v29 = v13;
      v30 = v7;
      objc_msgSend(v20, "na_map:", v28);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "allObjects");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)v18;
      objc_msgSend((id)objc_opt_class(), "_inputSourceValueComparatorForTelevisionProfile:", v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sortedArrayUsingComparator:", v24);
      v25 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v25 = v8;
    }

  }
  else
  {
    v25 = v8;
  }

  return v25;
}

uint64_t __71__HFTVInputControlItem_valueForCharacteristicType_inBatchReadResponse___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "serviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB9A48]);

  return v3;
}

id __71__HFTVInputControlItem_valueForCharacteristicType_inBatchReadResponse___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _BOOL8 v12;
  const char *v13;
  void *v14;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaSourceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v4)
  {
    HFLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_8:
      v14 = 0;
      goto LABEL_13;
    }
    v16 = 138412290;
    v17 = v3;
    v13 = "No name for input source service: %@";
LABEL_15:
    _os_log_error_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v16, 0xCu);
    goto LABEL_8;
  }
  if (!v5)
  {
    HFLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    v16 = 138412290;
    v17 = v3;
    v13 = "No media source identifier for input source service: %@";
    goto LABEL_15;
  }
  v7 = objc_msgSend(v5, "isEqualToNumber:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "responseForCharacteristicType:inService:", *MEMORY[0x1E0CB88A0], v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueWithExpectedClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v9;
  v11 = v3;
  if (objc_msgSend(v11, "configurationState") == 2)
  {
    v12 = 1;
  }
  else if (v10)
  {
    v12 = -[NSObject integerValue](v10, "integerValue") == 1;
  }
  else
  {
    v12 = 0;
  }
  +[HFTVInputControlItemValue valueWithInputName:identifier:isHidden:isSelected:](HFTVInputControlItemValue, "valueWithInputName:identifier:isHidden:isSelected:", v4, v6, v12, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v14;
}

- (id)writeValue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  HFServiceStateCharacteristicRecipe *v9;
  HFServiceStateCharacteristicRecipe *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HFServiceStateCharacteristicRecipe *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    +[HFServiceTreeTypePredicate predicateWithServiceType:](HFServiceTreeTypePredicate, "predicateWithServiceType:", *MEMORY[0x1E0CB9AF0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = [HFServiceStateCharacteristicRecipe alloc];
    v10 = -[HFServiceStateCharacteristicRecipe initWithCharacteristicType:servicePredicate:required:](v9, "initWithCharacteristicType:servicePredicate:required:", *MEMORY[0x1E0CB8798], v8, 1);
    -[HFControlItem valueSource](self, "valueSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v10;
    objc_msgSend(v7, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "writeValuesForCharacteristicRecipes:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (NSArray)inputs
{
  return self->_inputs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputs, 0);
}

@end
