@implementation HFGarageDoorOpenerServiceItem

id __63__HFGarageDoorOpenerServiceItem_createControlItemsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  unint64_t v3;
  uint64_t v4;
  void *v5;

  if (a2)
  {
    v2 = (void *)MEMORY[0x1E0CB37E8];
    v3 = objc_msgSend(a2, "integerValue");
    if (v3 > 4)
      v4 = 0;
    else
      v4 = qword_1DD669928[v3];
    objc_msgSend(v2, "numberWithInteger:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &unk_1EA7CC520;
  }
  return v5;
}

+ (id)supportedServiceTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9A28]);
}

id __61__HFGarageDoorOpenerServiceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
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
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;

  v3 = a2;
  objc_msgSend(v3, "readResponse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseForCharacteristicType:", *MEMORY[0x1E0CB8AA8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueWithExpectedClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "responseForCharacteristicType:", *MEMORY[0x1E0CB8980]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueWithExpectedClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "responseForCharacteristicType:", *MEMORY[0x1E0CB8838]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "characteristic");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueWithExpectedClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "standardResults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v12, "mutableCopy");
  if (v11)
    v14 = v6 == 0;
  else
    v14 = 1;
  if (!v14)
  {
    v33 = v10;
    v15 = objc_msgSend(v11, "integerValue");
    v16 = objc_msgSend(v6, "integerValue");
    v31 = v8;
    v32 = v6;
    if (v15 == 4)
    {
      v15 = 0;
    }
    else if (v15 != v16)
    {
      if (v16)
        v15 = 3;
      else
        v15 = 2;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v15 & 0xFFFFFFFFFFFFFFFELL) == 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, CFSTR("isInStateTransition"));

    v18 = a1;
    v19 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "descriptionForCharacteristic:withValue:", v33, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("description"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v21, CFSTR("description"));
    }
    v23 = *(void **)(v18 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v33;
    objc_msgSend(v23, "controlDescriptionForCharacteristic:withValue:", v33, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    a1 = v18;
    objc_msgSend(v13, "na_safeSetObject:forKey:", v25, CFSTR("controlDescription"));

    v8 = v31;
    v6 = v32;
  }
  if (objc_msgSend(v8, "BOOLValue"))
  {
    _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionGarageDoor_OneObstructed"), CFSTR("HFStatusDescriptionGarageDoor_OneObstructed"), 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v26, CFSTR("description"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v26, CFSTR("detailedControlDescription"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1EA7CC538, CFSTR("badge"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1EA7CC550, CFSTR("descriptionBadge"));

  }
  objc_msgSend(*(id *)(a1 + 32), "applyInflectionToDescriptions:", v13);
  v27 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v13);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "futureWithResult:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (id)createControlItemsWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HFPrimaryStateControlItem *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  HFPrimaryStateControlItem *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFServiceItem controlItemValueSourceForPrimaryService](self, "controlItemValueSourceForPrimaryService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFValueTransformer transformerForValueClass:transformBlock:reverseTransformBlock:](HFValueTransformer, "transformerForValueClass:transformBlock:reverseTransformBlock:", objc_opt_class(), &__block_literal_global_128, &__block_literal_global_5_8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = [HFPrimaryStateControlItem alloc];
  v9 = *MEMORY[0x1E0CB8AA8];
  v16[0] = CFSTR("title");
  HFItemOptionalLocalizedString(CFSTR("HFControlShortTitleDoorState"), v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v16[1] = CFSTR("actionRequiresDeviceUnlock");
  v17[0] = v10;
  v17[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HFPrimaryStateControlItem initWithValueSource:characteristicType:valueTransformer:displayResults:](v8, "initWithValueSource:characteristicType:valueTransformer:displayResults:", v5, v9, v6, v11, v16[0]);
  v18[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = *MEMORY[0x1E0CB8AA8];
  v14[0] = *MEMORY[0x1E0CB8838];
  v14[1] = v5;
  v14[2] = *MEMORY[0x1E0CB8980];
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFServiceItem performStandardUpdateWithCharacteristicTypes:options:](self, "performStandardUpdateWithCharacteristicTypes:options:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__HFGarageDoorOpenerServiceItem__subclass_updateWithOptions___block_invoke;
  v13[3] = &unk_1EA726480;
  v13[4] = self;
  objc_msgSend(v10, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __63__HFGarageDoorOpenerServiceItem_createControlItemsWithOptions___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (unint64_t)objc_msgSend(a2, "integerValue") < 2);
}

@end
