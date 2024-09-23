@implementation HFValveActiveStateControlItem

- (HFValveActiveStateControlItem)initWithValueSource:(id)a3 displayResults:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HFControlItemCharacteristicOptions *v15;
  void *v16;
  HFControlItemCharacteristicOptions *v17;
  void *v18;
  HFValveActiveStateControlItem *v19;
  objc_super v21;
  _QWORD v22[2];
  _QWORD v23[2];
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0C99E60];
  v25[0] = *MEMORY[0x1E0CB8900];
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "arrayWithObjects:count:", v25, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0C99E60];
  v24 = *MEMORY[0x1E0CB89E0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = [HFControlItemCharacteristicOptions alloc];
  v22[0] = &unk_1EA7CD288;
  v22[1] = &unk_1EA7CD2A0;
  v23[0] = v11;
  v23[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HFControlItemCharacteristicOptions initWithCharacteristicTypesByUsage:](v15, "initWithCharacteristicTypesByUsage:", v16);

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)HFValveActiveStateControlItem;
  v19 = -[HFPowerStateControlItem initWithValueSource:auxiliaryTargetValueTuples:additionalCharacteristicOptions:displayResults:](&v21, sel_initWithValueSource_auxiliaryTargetValueTuples_additionalCharacteristicOptions_displayResults_, v9, v18, v17, v8);

  return v19;
}

- (HFValveActiveStateControlItem)initWithValueSource:(id)a3 auxiliaryTargetValueTuples:(id)a4 additionalCharacteristicOptions:(id)a5 displayResults:(id)a6
{
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithValueSource_displayResults_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFValveActiveStateControlItem.m"), 36, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFValveActiveStateControlItem initWithValueSource:auxiliaryTargetValueTuples:additionalCharacteristicOptions:displayResults:]",
    v9);

  return 0;
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

- (id)servicePredicateForCharacteristicType:(id)a3 withUsage:(unint64_t)a4
{
  return +[HFServiceTreeTypePredicate predicateWithServiceType:](HFServiceTreeTypePredicate, "predicateWithServiceType:", *MEMORY[0x1E0CB9B08], a4);
}

- (id)writeValue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  HFServiceTreeTypePredicate *v10;
  void *v11;
  HFServiceTreeTypePredicate *v12;
  HFServiceStateCharacteristicRecipe *v13;
  HFServiceStateCharacteristicRecipe *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  HFServiceStateCharacteristicRecipe *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  v8 = objc_msgSend(v7, "integerValue");
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __44__HFValveActiveStateControlItem_writeValue___block_invoke;
  v20[3] = &__block_descriptor_40_e5__8__0l;
  v20[4] = v8;
  __44__HFValveActiveStateControlItem_writeValue___block_invoke((uint64_t)v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [HFServiceTreeTypePredicate alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HFServiceTreeTypePredicate initWithServiceTypes:serviceSubtypes:includeChildServices:](v10, "initWithServiceTypes:serviceSubtypes:includeChildServices:", v9, v11, 0);

  v13 = [HFServiceStateCharacteristicRecipe alloc];
  v14 = -[HFServiceStateCharacteristicRecipe initWithCharacteristicType:servicePredicate:required:](v13, "initWithCharacteristicType:servicePredicate:required:", *MEMORY[0x1E0CB8790], v12, 1);
  -[HFControlItem valueSource](self, "valueSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = &unk_1EA7CD2D0;
  if (v8 == 2)
    v16 = &unk_1EA7CD2B8;
  v21 = v14;
  v22[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "writeValuesForCharacteristicRecipes:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

id __44__HFValveActiveStateControlItem_writeValue___block_invoke(uint64_t a1)
{
  uint64_t *v1;
  dispatch_once_t *v3;
  void *v4;

  if (*(_QWORD *)(a1 + 32) != 2)
  {
    if (qword_1ED379CF8 == -1)
    {
      v1 = &qword_1ED379D00;
      return (id)*v1;
    }
    v3 = &qword_1ED379CF8;
    v4 = &__block_literal_global_17_13;
LABEL_9:
    dispatch_once(v3, v4);
    v1 = v3 + 1;
    return (id)*v1;
  }
  if (_MergedGlobals_313 != -1)
  {
    v3 = &_MergedGlobals_313;
    v4 = &__block_literal_global_15_15;
    goto LABEL_9;
  }
  v1 = &qword_1ED379CF0;
  return (id)*v1;
}

void __44__HFValveActiveStateControlItem_writeValue___block_invoke_3()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB9A50];
  v5[0] = *MEMORY[0x1E0CB9B08];
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ED379CF0;
  qword_1ED379CF0 = v3;

}

void __44__HFValveActiveStateControlItem_writeValue___block_invoke_5()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = *MEMORY[0x1E0CB9B08];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED379D00;
  qword_1ED379D00 = v2;

}

- (id)resultsForBatchReadResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HFServiceStateCharacteristicRecipe *v9;
  uint64_t v10;
  void *v11;
  HFServiceStateCharacteristicRecipe *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  HFSimpleFormattedValue *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  HFServiceStateCharacteristicRecipe *v35;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)HFValveActiveStateControlItem;
  v4 = a3;
  -[HFControlItem resultsForBatchReadResponse:](&v36, sel_resultsForBatchReadResponse_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[HFControlItem valueForCharacteristicType:inBatchReadResponse:](self, "valueForCharacteristicType:inBatchReadResponse:", *MEMORY[0x1E0CB8790], v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFControlItem valueForCharacteristicType:inBatchReadResponse:](self, "valueForCharacteristicType:inBatchReadResponse:", *MEMORY[0x1E0CB8900], v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [HFServiceStateCharacteristicRecipe alloc];
  v10 = *MEMORY[0x1E0CB89E0];
  -[HFValveActiveStateControlItem servicePredicateForCharacteristicType:withUsage:](self, "servicePredicateForCharacteristicType:withUsage:", *MEMORY[0x1E0CB89E0], 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HFServiceStateCharacteristicRecipe initWithCharacteristicType:servicePredicate:required:](v9, "initWithCharacteristicType:servicePredicate:required:", v10, v11, 0);

  objc_msgSend(v4, "responseForCharacteristicRecipe:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "valueWithExpectedClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 && objc_msgSend(v7, "BOOLValue") && objc_msgSend(v8, "BOOLValue"))
  {
    objc_msgSend(v13, "characteristic");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "valueUpdatedTime");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      objc_msgSend(v13, "characteristic");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "hf_prettyDescription");
      v18 = v6;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Missing valueUpdatedTime on characteristic %@!"), v19);

      v6 = v18;
    }
    objc_msgSend(v14, "doubleValue");
    +[HFFormattedTimeRemainingValue valueWithRemainingDuration:relativeToDate:](HFFormattedTimeRemainingValue, "valueWithRemainingDuration:relativeToDate:", v16);
    v20 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (objc_msgSend(v7, "BOOLValue") && (objc_msgSend(v8, "BOOLValue") & 1) == 0)
  {
    v21 = [HFSimpleFormattedValue alloc];
    _HFLocalizedStringWithDefaultValue(CFSTR("HFControlSupplementaryDescription.Valve.Waiting"), CFSTR("HFControlSupplementaryDescription.Valve.Waiting"), 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[HFSimpleFormattedValue initWithFormattedValue:](v21, "initWithFormattedValue:", v16);
LABEL_10:
    v22 = (void *)v20;
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("supplementaryFormattedValue"));

  }
  -[HFControlItem valueSource](self, "valueSource");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "primaryServiceDescriptor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v24, "parentServiceDescriptor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "serviceType");
    v35 = v12;
    v26 = v6;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isEqualToString:", *MEMORY[0x1E0CB9A18]);

    objc_msgSend(v24, "serviceSubtype");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v8, "BOOLValue");
    v31 = objc_msgSend(v7, "BOOLValue");
    v32 = v30;
    v6 = v26;
    v12 = v35;
    -[HFValveActiveStateControlItem _iconDescriptorForServiceSubtype:inUse:active:hasFaucetAsParentService:](self, "_iconDescriptorForServiceSubtype:inUse:active:hasFaucetAsParentService:", v29, v32, v31, v28);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v33, CFSTR("decorationIconDescriptor"));

  }
  return v6;
}

- (id)_faucetValveSubtypeToIconIdentifierMap
{
  if (qword_1ED379D08 != -1)
    dispatch_once(&qword_1ED379D08, &__block_literal_global_31_9);
  return (id)qword_1ED379D10;
}

void __71__HFValveActiveStateControlItem__faucetValveSubtypeToIconIdentifierMap__block_invoke_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB9990];
  v4[0] = *MEMORY[0x1E0CB9980];
  v4[1] = v0;
  v5[0] = CFSTR("HFCAPackageIconIdentifierValveShowerHead");
  v5[1] = CFSTR("HFCAPackageIconIdentifierFaucet");
  v1 = *MEMORY[0x1E0CB9978];
  v4[2] = *MEMORY[0x1E0CB9970];
  v4[3] = v1;
  v5[2] = CFSTR("HFCAPackageIconIdentifierFaucet");
  v5[3] = CFSTR("HFCAPackageIconIdentifierFaucet");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED379D10;
  qword_1ED379D10 = v2;

}

- (id)_iconDescriptorForServiceSubtype:(id)a3 inUse:(BOOL)a4 active:(BOOL)a5 hasFaucetAsParentService:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v9;
  void *v10;
  HFSymbolIconConfiguration *v11;
  __CFString **v12;
  __CFString *v13;
  HFMultistateImageIconDescriptor *v14;
  HFMultistateImageIconDescriptor *v15;
  void *v17;
  _QWORD v18[2];

  v6 = a6;
  v7 = a5;
  v18[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB9978]) & 1) != 0 || !v6)
  {
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:", 5, 32.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HFSymbolIconConfiguration initWithSystemImageName:configuration:]([HFSymbolIconConfiguration alloc], "initWithSystemImageName:configuration:", CFSTR("drop.fill"), v10);
    v17 = &unk_1EA7CD2E8;
    v18[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v14 = -[HFMultistateImageIconDescriptor initWithSymbolIconConfigurationsKeyedByPrimaryState:]([HFMultistateImageIconDescriptor alloc], "initWithSymbolIconConfigurationsKeyedByPrimaryState:", v13);
  }
  else
  {
    -[HFValveActiveStateControlItem _faucetValveSubtypeToIconIdentifierMap](self, "_faucetValveSubtypeToIconIdentifierMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v9);
    v11 = (HFSymbolIconConfiguration *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v15 = 0;
      goto LABEL_9;
    }
    v12 = &HFCAPackageStateOn;
    if (!v7)
      v12 = &HFCAPackageStateOff;
    v13 = *v12;
    v14 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:state:]([HFCAPackageIconDescriptor alloc], "initWithPackageIdentifier:state:", v11, v13);
  }
  v15 = v14;

LABEL_9:
  return v15;
}

@end
