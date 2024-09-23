@implementation HFFaucetActiveStateControlItem

- (HFFaucetActiveStateControlItem)initWithValueSource:(id)a3 valveControlMode:(unint64_t)a4 displayResults:(id)a5
{
  id v8;
  id v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  HFControlItemCharacteristicOptions *v14;
  void *v15;
  HFControlItemCharacteristicOptions *v16;
  void *v17;
  HFFaucetActiveStateControlItem *v18;
  objc_super v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "primaryServiceDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[HFServiceState stateClassForServiceDescriptor:](HFServiceState, "stateClassForServiceDescriptor:", v10);

  -[objc_class requiredCharacteristicTypes](v11, "requiredCharacteristicTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class optionalCharacteristicTypes](v11, "optionalCharacteristicTypes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = [HFControlItemCharacteristicOptions alloc];
  v21[0] = &unk_1EA7CCAD8;
  v21[1] = &unk_1EA7CCAF0;
  v22[0] = v12;
  v22[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HFControlItemCharacteristicOptions initWithCharacteristicTypesByUsage:](v14, "initWithCharacteristicTypesByUsage:", v15);

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)HFFaucetActiveStateControlItem;
  v18 = -[HFPowerStateControlItem initWithValueSource:auxiliaryTargetValueTuples:additionalCharacteristicOptions:displayResults:](&v20, sel_initWithValueSource_auxiliaryTargetValueTuples_additionalCharacteristicOptions_displayResults_, v9, v17, v16, v8);

  if (v18)
    v18->_valveControlMode = a4;

  return v18;
}

- (HFFaucetActiveStateControlItem)initWithValueSource:(id)a3 auxiliaryTargetValueTuples:(id)a4 additionalCharacteristicOptions:(id)a5 displayResults:(id)a6
{
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithValueSource_valveControlMode_displayResults_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFFaucetActiveStateControlItem.m"), 39, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFFaucetActiveStateControlItem initWithValueSource:auxiliaryTargetValueTuples:additionalCharacteristicOptions:displayResults:]",
    v9);

  return 0;
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = objc_alloc((Class)objc_opt_class());
  v7 = -[HFFaucetActiveStateControlItem valveControlMode](self, "valveControlMode");
  -[HFControlItem displayResults](self, "displayResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithValueSource:valveControlMode:displayResults:", v5, v7, v8);

  objc_msgSend(v9, "copyLatestResultsFromItem:", self);
  return v9;
}

- (id)servicePredicateForCharacteristicType:(id)a3 withUsage:(unint64_t)a4
{
  id v6;
  void *v7;
  HFServiceTreeCompoundPredicate *v8;
  void *v9;
  HFServiceTreeCompoundPredicate *v10;
  objc_super v12;
  _QWORD v13[5];

  v6 = a3;
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB8790]))
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __82__HFFaucetActiveStateControlItem_servicePredicateForCharacteristicType_withUsage___block_invoke;
    v13[3] = &unk_1EA738FC0;
    v13[4] = self;
    __82__HFFaucetActiveStateControlItem_servicePredicateForCharacteristicType_withUsage___block_invoke((uint64_t)v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [HFServiceTreeCompoundPredicate alloc];
    +[HFServiceTreeTypePredicate predicateWithServiceType:](HFServiceTreeTypePredicate, "predicateWithServiceType:", *MEMORY[0x1E0CB9A18]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HFServiceTreeCompoundPredicate initWithRootServicePredicate:childServicePredicates:](v8, "initWithRootServicePredicate:childServicePredicates:", v9, v7);

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)HFFaucetActiveStateControlItem;
    -[HFControlItem servicePredicateForCharacteristicType:withUsage:](&v12, sel_servicePredicateForCharacteristicType_withUsage_, v6, a4);
    v10 = (HFServiceTreeCompoundPredicate *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

id __82__HFFaucetActiveStateControlItem_servicePredicateForCharacteristicType_withUsage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  +[HFServiceTreeTypePredicate predicateWithServiceType:](HFServiceTreeTypePredicate, "predicateWithServiceType:", *MEMORY[0x1E0CB9A30]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "valveControlMode") == 1)
  {
    v7[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[HFServiceTreeTypePredicate predicateWithServiceType:](HFServiceTreeTypePredicate, "predicateWithServiceType:", *MEMORY[0x1E0CB9B08]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v2;
    v6[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)resultsForBatchReadResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HFServiceStateDescriptionFormatter *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HFFaucetActiveStateControlItem;
  v4 = a3;
  -[HFControlItem resultsForBatchReadResponse:](&v13, sel_resultsForBatchReadResponse_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy", v13.receiver, v13.super_class);

  -[HFControlItem valueSource](self, "valueSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "primaryServiceDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFServiceState stateForServiceDescriptor:withBatchReadResponse:](HFServiceState, "stateForServiceDescriptor:withBatchReadResponse:", v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc_init(HFServiceStateDescriptionFormatter);
    -[HFServiceStateDescriptionFormatter setDescriptionContext:](v10, "setDescriptionContext:", 1);
    -[HFServiceStateDescriptionFormatter stringForObjectValue:](v10, "stringForObjectValue:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("description"));

  }
  return v6;
}

+ (id)na_identity
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__HFFaucetActiveStateControlItem_na_identity__block_invoke;
  v3[3] = &__block_descriptor_40_e5__8__0l;
  v3[4] = a1;
  __45__HFFaucetActiveStateControlItem_na_identity__block_invoke((uint64_t)v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __45__HFFaucetActiveStateControlItem_na_identity__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__HFFaucetActiveStateControlItem_na_identity__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  if (_MergedGlobals_287 != -1)
    dispatch_once(&_MergedGlobals_287, block);
  return (id)qword_1ED3798B8;
}

void __45__HFFaucetActiveStateControlItem_na_identity__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__HFFaucetActiveStateControlItem_na_identity__block_invoke_3;
  v3[3] = &__block_descriptor_40_e17___NAIdentity_8__0l;
  v3[4] = *(_QWORD *)(a1 + 32);
  __45__HFFaucetActiveStateControlItem_na_identity__block_invoke_3((uint64_t)v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ED3798B8;
  qword_1ED3798B8 = v1;

}

id __45__HFFaucetActiveStateControlItem_na_identity__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  v1 = (void *)MEMORY[0x1E0D519C8];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS___HFFaucetActiveStateControlItem;
  objc_msgSendSuper2(&v7, sel_na_identity);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "builderWithIdentity:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v3, "appendCharacteristic:", &__block_literal_global_156);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __45__HFFaucetActiveStateControlItem_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "valveControlMode"));
}

- (unint64_t)valveControlMode
{
  return self->_valveControlMode;
}

@end
