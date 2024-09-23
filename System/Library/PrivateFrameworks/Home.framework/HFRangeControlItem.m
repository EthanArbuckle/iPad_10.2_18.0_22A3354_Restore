@implementation HFRangeControlItem

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)_hasWritableCharacteristicsOfType:(id)a3 valueSource:(id)a4
{
  void *v4;
  char v5;

  objc_msgSend(a4, "allCharacteristicsForCharacteristicType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    v5 = objc_msgSend(v4, "na_all:", &__block_literal_global_72);
  else
    v5 = 0;

  return v5;
}

- (HFRangeControlItem)initWithValueSource:(id)a3 targetCharacteristicTypes:(id)a4 minimumCharacteristicType:(id)a5 maximumCharacteristicType:(id)a6 displayResults:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  HFControlItemCharacteristicOptions *v18;
  void *v19;
  id v20;
  void *v21;
  HFControlItemCharacteristicOptions *v22;
  HFRangeControlItem *v23;
  id *p_isa;
  HFRangeControlItem *v25;
  id obj;
  id v28;
  id v29;
  objc_super v30;
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v13 && objc_msgSend(v13, "count"))
  {
    obj = a6;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v14;
    objc_msgSend(v17, "na_safeAddObject:", v14);
    v28 = v15;
    objc_msgSend(v17, "na_safeAddObject:", v15);
    objc_msgSend(v17, "unionSet:", v13);
    v18 = [HFControlItemCharacteristicOptions alloc];
    v31[0] = &unk_1EA7CC0D0;
    v31[1] = &unk_1EA7CC0E8;
    v32[0] = v17;
    objc_msgSend((id)objc_opt_class(), "readOnlyCharacteristicTypes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
    v20 = v12;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[HFControlItemCharacteristicOptions initWithCharacteristicTypesByUsage:](v18, "initWithCharacteristicTypesByUsage:", v21);

    v12 = v20;
    v30.receiver = self;
    v30.super_class = (Class)HFRangeControlItem;
    v23 = -[HFControlItem initWithValueSource:characteristicOptions:displayResults:](&v30, sel_initWithValueSource_characteristicOptions_displayResults_, v20, v22, v16);
    p_isa = (id *)&v23->super.super.super.isa;
    if (v23)
    {
      objc_storeStrong((id *)&v23->_targetCharacteristicTypes, a4);
      objc_storeStrong(p_isa + 11, a5);
      objc_storeStrong(p_isa + 12, obj);
    }
    self = p_isa;

    v25 = self;
    v15 = v28;
    v14 = v29;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

uint64_t __68__HFRangeControlItem__hasWritableCharacteristicsOfType_valueSource___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "hf_isReadable"))
    v3 = objc_msgSend(v2, "hf_isWritable");
  else
    v3 = 0;

  return v3;
}

- (id)resultsForBatchReadResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HFNumberRangeFormatter *v9;
  HFNumberRangeFormatter *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  id (*v16)(uint64_t);
  void *v17;
  id v18;
  HFRangeControlItem *v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HFRangeControlItem;
  -[HFControlItem resultsForBatchReadResponse:](&v20, sel_resultsForBatchReadResponse_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("preferLiveWritesDuringInteraction"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1EA7CC0E8, CFSTR("preferredInteractionFidelity"));
  -[HFRangeControlItem numberValueFormatter](self, "numberValueFormatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __50__HFRangeControlItem_resultsForBatchReadResponse___block_invoke;
    v17 = &unk_1EA72DAE0;
    v18 = v4;
    v19 = self;
    __50__HFRangeControlItem_resultsForBatchReadResponse___block_invoke((uint64_t)&v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = [HFNumberRangeFormatter alloc];
      v10 = -[HFNumberRangeFormatter initWithNumberFormatter:](v9, "initWithNumberFormatter:", v7, v14, v15, v16, v17);
      objc_msgSend(v8, "numberRange");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFNumberRangeFormatter stringForObjectValue:](v10, "stringForObjectValue:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("description"));

    }
  }

  return v6;
}

id __50__HFRangeControlItem_resultsForBatchReadResponse___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allCharacteristicTypes", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "responseForCharacteristicType:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "value");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 40), "valueForCharacteristicValues:", v2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)valueForCharacteristicValues:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HFRangeControlItemValue *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  -[HFItem latestResults](self, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("characteristicValuesByType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = (void *)MEMORY[0x1E0C9AA70];
  v8 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v8, "addEntriesFromDictionary:", v4);
  v9 = objc_alloc_init(HFRangeControlItemValue);
  -[HFRangeControlItem targetCharacteristicTypeWithCharacteristicValuesKeyedByType:](self, "targetCharacteristicTypeWithCharacteristicValuesKeyedByType:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[HFRangeControlItem targetCharacteristicTypes](self, "targetCharacteristicTypes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", v10);

    if ((v12 & 1) == 0)
    {
      -[HFRangeControlItem targetCharacteristicTypes](self, "targetCharacteristicTypes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("HFRangeControlItem subclass returned a targetCharacteristicType (%@) that isn't in its set of allowed targetCharacteristicTypes (%@): %@"), v10, v13, self);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFRangeControlItemValue setTargetValue:](v9, "setTargetValue:", v14);

  }
  -[HFRangeControlItem minimumCharacteristicType](self, "minimumCharacteristicType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[HFRangeControlItem minimumCharacteristicType](self, "minimumCharacteristicType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFRangeControlItemValue setMinimumValue:](v9, "setMinimumValue:", v17);

  }
  -[HFRangeControlItem maximumCharacteristicType](self, "maximumCharacteristicType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[HFRangeControlItem maximumCharacteristicType](self, "maximumCharacteristicType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFRangeControlItemValue setMaximumValue:](v9, "setMaximumValue:", v20);

  }
  -[HFRangeControlItemValue setMode:](v9, "setMode:", -[HFRangeControlItem rangeModeWithCharacteristicValuesKeyedByType:](self, "rangeModeWithCharacteristicValuesKeyedByType:", v8));

  return v9;
}

- (NSString)minimumCharacteristicType
{
  return self->_minimumCharacteristicType;
}

- (NSString)maximumCharacteristicType
{
  return self->_maximumCharacteristicType;
}

- (NSSet)targetCharacteristicTypes
{
  return self->_targetCharacteristicTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumCharacteristicType, 0);
  objc_storeStrong((id *)&self->_minimumCharacteristicType, 0);
  objc_storeStrong((id *)&self->_targetCharacteristicTypes, 0);
}

- (HFRangeControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithValueSource_targetCharacteristicTypes_minimumCharacteristicType_maximumCharacteristicType_displayResults_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFRangeControlItem.m"), 79, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFRangeControlItem initWithValueSource:characteristicOptions:displayResults:]",
    v8);

  return 0;
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  if (-[HFControlItem canCopyWithCharacteristicOptions:](self, "canCopyWithCharacteristicOptions:", a3))
  {
    v7 = objc_alloc((Class)objc_opt_class());
    -[HFRangeControlItem targetCharacteristicTypes](self, "targetCharacteristicTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFRangeControlItem minimumCharacteristicType](self, "minimumCharacteristicType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFRangeControlItem maximumCharacteristicType](self, "maximumCharacteristicType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFControlItem displayResults](self, "displayResults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v7, "initWithValueSource:targetCharacteristicTypes:minimumCharacteristicType:maximumCharacteristicType:displayResults:", v6, v8, v9, v10, v11);

    objc_msgSend(v12, "copyLatestResultsFromItem:", self);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)characteristicValuesForValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItem latestResults](self, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("characteristicValuesByType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFRangeControlItem targetCharacteristicTypeWithCharacteristicValuesKeyedByType:](self, "targetCharacteristicTypeWithCharacteristicValuesKeyedByType:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "targetValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && v8)
  {
    objc_msgSend(v4, "targetValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v10, v8);

  }
  objc_msgSend(v4, "minimumValue");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[HFRangeControlItem minimumCharacteristicType](self, "minimumCharacteristicType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v4, "minimumValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFRangeControlItem minimumCharacteristicType](self, "minimumCharacteristicType");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v14, v15);

    }
  }
  objc_msgSend(v4, "maximumValue");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    -[HFRangeControlItem maximumCharacteristicType](self, "maximumCharacteristicType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "maximumValue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFRangeControlItem maximumCharacteristicType](self, "maximumCharacteristicType");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v19, v20);

    }
  }
  -[HFControlItem normalizedCharacteristicValuesForValues:](self, "normalizedCharacteristicValuesForValues:", v5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (HFNumberValueConstraints)minimumValueConstraints
{
  void *v2;
  void *v3;

  -[HFRangeControlItem _minimumCharacteristicTypeMetadata](self, "_minimumCharacteristicTypeMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_numericValueConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFNumberValueConstraints *)v3;
}

- (HFNumberValueConstraints)maximumValueConstraints
{
  void *v2;
  void *v3;

  -[HFRangeControlItem _maximumCharacteristicTypeMetadata](self, "_maximumCharacteristicTypeMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_numericValueConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFNumberValueConstraints *)v3;
}

- (HFNumberValueConstraints)targetValueConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HFItem latestResults](self, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("characteristicValuesByType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFRangeControlItem _targetCharacteristicTypeMetadataWithCharacteristicValuesKeyedByType:](self, "_targetCharacteristicTypeMetadataWithCharacteristicValuesKeyedByType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_numericValueConstraints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFNumberValueConstraints *)v6;
}

- (NSNumber)minimumValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[HFItem latestResults](self, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("characteristicValuesByType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HFRangeControlItem rangeModeWithCharacteristicValuesKeyedByType:](self, "rangeModeWithCharacteristicValuesKeyedByType:", v4) == 2)
  {
    -[HFRangeControlItem _minimumCharacteristicTypeMetadata](self, "_minimumCharacteristicTypeMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "minimumValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFRangeControlItem _maximumCharacteristicTypeMetadata](self, "_maximumCharacteristicTypeMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "minimumValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "compare:", v8) == -1)
      v9 = v8;
    else
      v9 = v6;
    v10 = v9;

  }
  else
  {
    -[HFRangeControlItem _targetCharacteristicTypeMetadataWithCharacteristicValuesKeyedByType:](self, "_targetCharacteristicTypeMetadataWithCharacteristicValuesKeyedByType:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "minimumValue");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (NSNumber *)v10;
}

- (NSNumber)maximumValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[HFItem latestResults](self, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("characteristicValuesByType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HFRangeControlItem rangeModeWithCharacteristicValuesKeyedByType:](self, "rangeModeWithCharacteristicValuesKeyedByType:", v4) == 2)
  {
    -[HFRangeControlItem _minimumCharacteristicTypeMetadata](self, "_minimumCharacteristicTypeMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "maximumValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFRangeControlItem _maximumCharacteristicTypeMetadata](self, "_maximumCharacteristicTypeMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "maximumValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "compare:", v8) == 1)
      v9 = v8;
    else
      v9 = v6;
    v10 = v9;

  }
  else
  {
    -[HFRangeControlItem _targetCharacteristicTypeMetadataWithCharacteristicValuesKeyedByType:](self, "_targetCharacteristicTypeMetadataWithCharacteristicValuesKeyedByType:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "maximumValue");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (NSNumber *)v10;
}

- (NSNumber)stepValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[HFItem latestResults](self, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("characteristicValuesByType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HFRangeControlItem rangeModeWithCharacteristicValuesKeyedByType:](self, "rangeModeWithCharacteristicValuesKeyedByType:", v4) == 2)
  {
    -[HFRangeControlItem minimumCharacteristicTypeStepValue](self, "minimumCharacteristicTypeStepValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFRangeControlItem maximumCharacteristicTypeStepValue](self, "maximumCharacteristicTypeStepValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "compare:", v6) == 1)
      v7 = v6;
    else
      v7 = v5;
    v8 = v7;

  }
  else
  {
    -[HFRangeControlItem _targetCharacteristicTypeMetadataWithCharacteristicValuesKeyedByType:](self, "_targetCharacteristicTypeMetadataWithCharacteristicValuesKeyedByType:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stepValue");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (NSNumber *)v8;
}

- (id)maximumCharacteristicTypeStepValue
{
  void *v2;
  void *v3;

  -[HFRangeControlItem _maximumCharacteristicTypeMetadata](self, "_maximumCharacteristicTypeMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stepValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)minimumCharacteristicTypeStepValue
{
  void *v2;
  void *v3;

  -[HFRangeControlItem _minimumCharacteristicTypeMetadata](self, "_minimumCharacteristicTypeMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stepValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)readOnlyCharacteristicTypes
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFRangeControlItem.m"), 276, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "+[HFRangeControlItem readOnlyCharacteristicTypes]", objc_opt_class());

  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (id)numberValueFormatter
{
  return 0;
}

- (unint64_t)rangeModeWithCharacteristicValuesKeyedByType:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFRangeControlItem.m"), 287, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFRangeControlItem rangeModeWithCharacteristicValuesKeyedByType:]", objc_opt_class());

  return 0;
}

- (id)targetCharacteristicTypeWithCharacteristicValuesKeyedByType:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFRangeControlItem.m"), 293, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFRangeControlItem targetCharacteristicTypeWithCharacteristicValuesKeyedByType:]", objc_opt_class());

  return 0;
}

- (id)_minimumCharacteristicTypeMetadata
{
  void *v3;
  void *v4;
  void *v5;

  -[HFControlItem valueSource](self, "valueSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFRangeControlItem minimumCharacteristicType](self, "minimumCharacteristicType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadataForCharacteristicType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_maximumCharacteristicTypeMetadata
{
  void *v3;
  void *v4;
  void *v5;

  -[HFControlItem valueSource](self, "valueSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFRangeControlItem maximumCharacteristicType](self, "maximumCharacteristicType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadataForCharacteristicType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_targetCharacteristicTypeMetadataWithCharacteristicValuesKeyedByType:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[HFRangeControlItem targetCharacteristicTypeWithCharacteristicValuesKeyedByType:](self, "targetCharacteristicTypeWithCharacteristicValuesKeyedByType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HFControlItem valueSource](self, "valueSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "metadataForCharacteristicType:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
