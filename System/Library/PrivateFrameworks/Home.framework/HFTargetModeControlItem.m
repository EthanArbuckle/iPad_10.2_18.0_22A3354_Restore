@implementation HFTargetModeControlItem

- (HFTargetModeControlItem)initWithValueSource:(id)a3 targetModeCharacteristicType:(id)a4 targetModeValueSet:(id)a5 primaryPowerStateControlItem:(id)a6 displayResults:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  HFTargetModeControlItem *v21;
  HFTargetModeControlItem *v22;
  uint64_t v23;
  HFPowerStateControlItem *primaryPowerStateControlItem;
  id v27;
  id v28;
  objc_super v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id location;
  const __CFString *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v28 = a7;
  v14 = (void *)objc_msgSend(v12, "copy");
  v34 = CFSTR("title");
  _HFLocalizedStringWithDefaultValue(CFSTR("HFControlTargetModeOff"), CFSTR("HFControlTargetModeOff"), 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addValue:displayResults:addOnlyIfValid:", &unk_1EA7CCC88, v16, 0);

  objc_initWeak(&location, v14);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __139__HFTargetModeControlItem_initWithValueSource_targetModeCharacteristicType_targetModeValueSet_primaryPowerStateControlItem_displayResults___block_invoke;
  v30[3] = &unk_1EA73AA90;
  objc_copyWeak(&v32, &location);
  v17 = v12;
  v31 = v17;
  objc_msgSend(v14, "setValueComparator:", v30);
  objc_msgSend(v13, "characteristicOptions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "optionsByAddingCharacteristicTypes:forUsage:", v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v29.receiver = self;
  v29.super_class = (Class)HFTargetModeControlItem;
  v21 = -[HFMultiStateControlItem initWithValueSource:multiStateCharacteristicType:allCharacteristicOptions:possibleValueSet:displayResults:](&v29, sel_initWithValueSource_multiStateCharacteristicType_allCharacteristicOptions_possibleValueSet_displayResults_, v27, v11, v20, v14, v28);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_targetModeCharacteristicType, a4);
    objc_storeStrong((id *)&v22->_targetModeValueSet, a5);
    v23 = objc_msgSend(v13, "copy");
    primaryPowerStateControlItem = v22->_primaryPowerStateControlItem;
    v22->_primaryPowerStateControlItem = (HFPowerStateControlItem *)v23;

  }
  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

  return v22;
}

uint64_t __139__HFTargetModeControlItem_initWithValueSource_targetModeCharacteristicType_targetModeValueSet_primaryPowerStateControlItem_displayResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t (**v11)(_QWORD, _QWORD, _QWORD);

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && (objc_msgSend(v5, "isEqual:", v6) & 1) == 0)
  {
    if (objc_msgSend(v5, "isEqual:", &unk_1EA7CCC88))
    {
      v9 = objc_msgSend(WeakRetained, "count") == 2;
      v10 = -1;
    }
    else
    {
      if (!objc_msgSend(v6, "isEqual:", &unk_1EA7CCC88))
      {
        objc_msgSend(*(id *)(a1 + 32), "valueComparator");
        v11 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v8 = ((uint64_t (**)(_QWORD, id, id))v11)[2](v11, v5, v6);

        goto LABEL_12;
      }
      v9 = objc_msgSend(WeakRetained, "count") == 2;
      v10 = 1;
    }
    if (v9)
      v8 = v10;
    else
      v8 = -v10;
  }
  else
  {
    v8 = 0;
  }
LABEL_12:

  return v8;
}

- (HFTargetModeControlItem)initWithValueSource:(id)a3 characteristicType:(id)a4 possibleValueSet:(id)a5 displayResults:(id)a6
{
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithValueSource_targetModeCharacteristicType_targetModeValueSet_primaryPowerStateControlItem_displayResults_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFTargetModeControlItem.m"), 66, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFTargetModeControlItem initWithValueSource:characteristicType:possibleValueSet:displayResults:]",
    v9);

  return 0;
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  -[HFTargetModeControlItem primaryPowerStateControlItem](self, "primaryPowerStateControlItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithValueSource:", v5);

  v8 = objc_alloc((Class)objc_opt_class());
  -[HFTargetModeControlItem targetModeCharacteristicType](self, "targetModeCharacteristicType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFTargetModeControlItem targetModeValueSet](self, "targetModeValueSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  -[HFControlItem displayResults](self, "displayResults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v8, "initWithValueSource:targetModeCharacteristicType:targetModeValueSet:primaryPowerStateControlItem:displayResults:", v5, v9, v11, v7, v12);

  objc_msgSend(v13, "copyLatestResultsFromItem:", self);
  return v13;
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
  -[HFTargetModeControlItem primaryPowerStateControlItem](self, "primaryPowerStateControlItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWithOptions:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D519C0];
  v13.receiver = self;
  v13.super_class = (Class)HFTargetModeControlItem;
  -[HFItem updateWithOptions:](&v13, sel_updateWithOptions_, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "combineAllFutures:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "flatMap:", &__block_literal_global_174);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __45__HFTargetModeControlItem_updateWithOptions___block_invoke(uint64_t a1, void *a2)
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

- (id)valueForCharacteristicValues:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  -[HFTargetModeControlItem primaryPowerStateControlItem](self, "primaryPowerStateControlItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForCharacteristicValues:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  if (v7 == 2)
  {
    v10.receiver = self;
    v10.super_class = (Class)HFTargetModeControlItem;
    -[HFMultiStateControlItem valueForCharacteristicValues:](&v10, sel_valueForCharacteristicValues_, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &unk_1EA7CCC88;
  }

  return v8;
}

- (id)characteristicValuesForValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqual:", &unk_1EA7CCC88))
    {
      -[HFTargetModeControlItem primaryPowerStateControlItem](self, "primaryPowerStateControlItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "characteristicValuesForValue:", &unk_1EA7CCCA0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)HFTargetModeControlItem;
      -[HFMultiStateControlItem characteristicValuesForValue:](&v12, sel_characteristicValuesForValue_, v4);
      v9 = objc_claimAutoreleasedReturnValue();

      -[HFTargetModeControlItem primaryPowerStateControlItem](self, "primaryPowerStateControlItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "characteristicValuesForValue:", &unk_1EA7CCCB8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = (void *)v9;
    }
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v8, "addEntriesFromDictionary:", v5);

  }
  else
  {
    NSLog(CFSTR("Unexpected displayValue class: %@"), v4);
    v8 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v8;
}

- (id)toggleValue
{
  void *v2;
  void *v3;

  -[HFTargetModeControlItem primaryPowerStateControlItem](self, "primaryPowerStateControlItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toggleValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)targetModeCharacteristicType
{
  return self->_targetModeCharacteristicType;
}

- (HFMultiStateValueSet)targetModeValueSet
{
  return self->_targetModeValueSet;
}

- (HFPowerStateControlItem)primaryPowerStateControlItem
{
  return self->_primaryPowerStateControlItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryPowerStateControlItem, 0);
  objc_storeStrong((id *)&self->_targetModeValueSet, 0);
  objc_storeStrong((id *)&self->_targetModeCharacteristicType, 0);
}

@end
