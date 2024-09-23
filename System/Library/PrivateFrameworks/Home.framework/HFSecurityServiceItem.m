@implementation HFSecurityServiceItem

+ (id)supportedServiceTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9AA8]);
}

- (id)createControlItemsWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  HFMultiStateValueSet *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HFPrimaryStateControlItem *v27;
  void *v28;
  void *v29;
  HFPrimaryStateControlItem *v30;
  HFMultiStateControlItem *v31;
  HFMultiStateControlItem *v32;
  uint64_t v33;
  void *v35;
  uint64_t v36;
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  const __CFString *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  const __CFString *v47;
  _QWORD v48[3];

  v48[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFServiceItem controlItemValueSourceForPrimaryService](self, "controlItemValueSourceForPrimaryService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceItem service](self, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0CB8B00];
  objc_msgSend(v6, "hf_characteristicOfType:", *MEMORY[0x1E0CB8B00]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[HFMultiStateValueSet initWithCharacteristicMetadata:]([HFMultiStateValueSet alloc], "initWithCharacteristicMetadata:", v9);
  v47 = CFSTR("title");
  HFItemOptionalLocalizedString(CFSTR("HFServiceSecuritySystemStateStayArm"), v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMultiStateValueSet addValue:displayResults:](v10, "addValue:displayResults:", &unk_1EA7CB710, v12);

  v45 = CFSTR("title");
  HFItemOptionalLocalizedString(CFSTR("HFServiceSecuritySystemStateAwayArm"), v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMultiStateValueSet addValue:displayResults:](v10, "addValue:displayResults:", &unk_1EA7CB728, v14);

  v43 = CFSTR("title");
  HFItemOptionalLocalizedString(CFSTR("HFServiceSecuritySystemStateNightArm"), v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMultiStateValueSet addValue:displayResults:](v10, "addValue:displayResults:", &unk_1EA7CB740, v16);

  v41 = CFSTR("title");
  HFItemOptionalLocalizedString(CFSTR("HFServiceSecuritySystemStateDisarm"), v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMultiStateValueSet addValue:displayResults:](v10, "addValue:displayResults:", &unk_1EA7CB758, v18);

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMultiStateValueSet allValues](v10, "allValues");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v21 >= 2)
  {
    v36 = v7;
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", &unk_1EA7CDC90);
    +[HFUtilities comparatorWithSortedObjects:](HFUtilities, "comparatorWithSortedObjects:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMultiStateValueSet setValueComparator:](v10, "setValueComparator:", v23);

    if (-[HFMultiStateValueSet count](v10, "count") == 2)
    {
      +[HFValueTransformer transformerForValueClass:transformBlock:reverseTransformBlock:](HFValueTransformer, "transformerForValueClass:transformBlock:reverseTransformBlock:", objc_opt_class(), &__block_literal_global_6, &__block_literal_global_18);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v22;
      v25 = v9;
      v26 = v5;
      v27 = [HFPrimaryStateControlItem alloc];
      v39[0] = CFSTR("title");
      HFItemOptionalLocalizedString(CFSTR("HFControlShortTitleSecuritySystemState"), v4);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v39[1] = CFSTR("actionRequiresDeviceUnlock");
      v40[0] = v28;
      v40[1] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v27;
      v5 = v26;
      v9 = v25;
      v22 = v35;
      v31 = -[HFPrimaryStateControlItem initWithValueSource:characteristicType:valueTransformer:displayResults:](v30, "initWithValueSource:characteristicType:valueTransformer:displayResults:", v5, v36, v24, v29);

    }
    else
    {
      v32 = [HFMultiStateControlItem alloc];
      v37[0] = CFSTR("title");
      HFItemOptionalLocalizedString(CFSTR("HFControlShortTitleSecuritySystemState"), v4);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v37[1] = CFSTR("actionRequiresDeviceUnlock");
      v38[0] = v24;
      v38[1] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[HFMultiStateControlItem initWithValueSource:characteristicType:possibleValueSet:displayResults:](v32, "initWithValueSource:characteristicType:possibleValueSet:displayResults:", v5, v36, v10, v28);
    }

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v31);
    v33 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v33;
  }

  return v19;
}

id __55__HFSecurityServiceItem_createControlItemsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  unint64_t v3;
  uint64_t v4;
  void *v5;

  if (a2)
  {
    v2 = (void *)MEMORY[0x1E0CB37E8];
    v3 = objc_msgSend(a2, "integerValue");
    if (v3 > 3)
      v4 = 0;
    else
      v4 = qword_1DD669408[v3];
    objc_msgSend(v2, "numberWithInteger:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &unk_1EA7CB710;
  }
  return v5;
}

uint64_t __55__HFSecurityServiceItem_createControlItemsWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  if ((unint64_t)objc_msgSend(a2, "integerValue") > 1)
    v3 = 1;
  else
    v3 = 3;
  return objc_msgSend(v2, "numberWithInteger:", v3);
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
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = *MEMORY[0x1E0CB8888];
  v14[0] = *MEMORY[0x1E0CB8B00];
  v14[1] = v5;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFServiceItem performStandardUpdateWithCharacteristicTypes:options:](self, "performStandardUpdateWithCharacteristicTypes:options:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__HFSecurityServiceItem__subclass_updateWithOptions___block_invoke;
  v13[3] = &unk_1EA726480;
  v13[4] = self;
  objc_msgSend(v10, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __53__HFSecurityServiceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
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
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  _BOOL4 v17;
  BOOL v18;
  unint64_t v19;
  void *v20;
  __CFString *v21;
  HFCAPackageIconDescriptor *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __CFString *v37;
  void *v38;
  void *v39;
  uint64_t v40;

  v3 = a2;
  objc_msgSend(v3, "readResponse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseForCharacteristicType:", *MEMORY[0x1E0CB8888]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "characteristic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueWithExpectedClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseForCharacteristicType:", *MEMORY[0x1E0CB8B00]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueWithExpectedClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "standardResults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  if (v7)
  {
    v39 = v4;
    v40 = a1;
    v12 = v6;
    v13 = objc_msgSend(v7, "integerValue");
    v14 = objc_msgSend(v9, "integerValue");
    v15 = v14;
    v38 = v9;
    v16 = v9 != 0;
    v17 = v13 != 4;
    if (v14 == v13)
      v17 = 0;
    v18 = v16 && v17;
    if (v16 && v17)
      v19 = v14;
    else
      v19 = v13;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v16 & v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, CFSTR("isInStateTransition"));

    if (v13 > 4)
      v21 = 0;
    else
      v21 = *off_1EA727508[v13];
    v37 = v21;
    v22 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:state:]([HFCAPackageIconDescriptor alloc], "initWithPackageIdentifier:state:", CFSTR("HFCAPackageIconIdentifierSecuritySystem"), v21);
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v22, CFSTR("icon"));

    v23 = *(void **)(v40 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v19);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "descriptionForCharacteristic:withValue:", v12, v24);
    v25 = (id)objc_claimAutoreleasedReturnValue();

    v26 = *(void **)(v40 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v19);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v26;
    v6 = v12;
    objc_msgSend(v28, "controlDescriptionForCharacteristic:withValue:", v12, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      if (v15 == 3)
        v30 = CFSTR("HFCharacteristicValueCurrentSecuritySystemStateDisarming");
      else
        v30 = CFSTR("HFCharacteristicValueCurrentSecuritySystemStateArming");
      _HFLocalizedStringWithDefaultValue(v30, v30, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = v31;
      v29 = v25;
    }
    v4 = v39;
    v9 = v38;
    if (v25)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("description"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v32)
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v25, CFSTR("description"));
    }
    objc_msgSend(v11, "na_safeSetObject:forKey:", v29, CFSTR("controlDescription"));

    a1 = v40;
  }
  objc_msgSend(*(id *)(a1 + 32), "applyInflectionToDescriptions:", v11);
  v33 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v11);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "futureWithResult:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

@end
