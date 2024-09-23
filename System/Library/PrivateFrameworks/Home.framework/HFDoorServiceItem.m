@implementation HFDoorServiceItem

+ (id)supportedServiceTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9A00]);
}

- (id)createControlItemsWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HFIncrementalStateControlItem *v8;
  HFIncrementalStateControlItem *v9;
  void *v10;
  void *v11;
  void *v12;
  HFIncrementalStateControlItem *v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFServiceItem controlItemValueSourceForPrimaryService](self, "controlItemValueSourceForPrimaryService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("title");
  HFItemOptionalLocalizedString(CFSTR("HFControlShortTitleDoorState"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v6;
  v16[1] = MEMORY[0x1E0C9AAB0];
  v15[1] = CFSTR("preferReversedInteractionDirection");
  v15[2] = CFSTR("actionRequiresDeviceUnlock");
  v16[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [HFIncrementalStateControlItem alloc];
  v9 = -[HFIncrementalStateControlItem initWithValueSource:incrementalAndPrimaryCharacteristicType:displayResults:](v8, "initWithValueSource:incrementalAndPrimaryCharacteristicType:displayResults:", v5, *MEMORY[0x1E0CB8AF0], v7);
  v10 = (void *)MEMORY[0x1E0C99E60];
  v14 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
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
  v5 = *MEMORY[0x1E0CB8AF0];
  v14[0] = *MEMORY[0x1E0CB8878];
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
  v13[2] = __49__HFDoorServiceItem__subclass_updateWithOptions___block_invoke;
  v13[3] = &unk_1EA726480;
  v13[4] = self;
  objc_msgSend(v10, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __49__HFDoorServiceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;

  v3 = a2;
  objc_msgSend(v3, "readResponse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseForCharacteristicType:", *MEMORY[0x1E0CB8878]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "characteristic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueWithExpectedClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseForCharacteristicType:", *MEMORY[0x1E0CB8AF0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueWithExpectedClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "responseForCharacteristicType:", *MEMORY[0x1E0CB8980]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueWithExpectedClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "standardResults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v12, "mutableCopy");
  if (v7)
  {
    v36 = objc_msgSend(v7, "integerValue");
    v14 = 0;
    v35 = v5;
    if ((objc_msgSend(v11, "BOOLValue") & 1) == 0 && v9)
    {
      v15 = objc_msgSend(v9, "integerValue");
      if (v15 == objc_msgSend(v7, "integerValue"))
      {
        v14 = 0;
      }
      else
      {
        v36 = objc_msgSend(v9, "integerValue");
        v14 = 1;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, CFSTR("isInStateTransition"));

    v34 = a1;
    v17 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v36);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "descriptionForCharacteristic:withValue:", v6, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if ((_DWORD)v14)
    {
      if (objc_msgSend(v7, "compare:", v9) == -1)
        v20 = CFSTR("HFCharacteristicValueDoorStateOpening");
      else
        v20 = CFSTR("HFCharacteristicValueDoorStateClosing");
      _HFLocalizedStringWithDefaultValue(v20, v20, 1);
      v21 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v21;
    }
    objc_msgSend(v6, "metadata", v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "hf_percentageForCharacteristicValue:", v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v23, CFSTR("subPriority"));

    if (v19)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("description"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, CFSTR("description"));
    }
    v25 = *(void **)(v34 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v36);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "controlDescriptionForCharacteristic:withValue:", v6, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "na_safeSetObject:forKey:", v27, CFSTR("controlDescription"));

    a1 = v34;
    v5 = v35;
    v11 = v33;
  }
  if (objc_msgSend(v11, "BOOLValue"))
  {
    _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionDoor_OneObstructed"), CFSTR("HFStatusDescriptionDoor_OneObstructed"), 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v28, CFSTR("description"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v28, CFSTR("detailedControlDescription"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1EA7CC388, CFSTR("badge"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1EA7CC3A0, CFSTR("descriptionBadge"));

  }
  objc_msgSend(*(id *)(a1 + 32), "applyInflectionToDescriptions:", v13);
  v29 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v13);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "futureWithResult:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

@end
