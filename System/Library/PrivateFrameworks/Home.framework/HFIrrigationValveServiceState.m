@implementation HFIrrigationValveServiceState

+ (id)stateClassIdentifier
{
  return CFSTR("IrrigationValve");
}

+ (id)requiredCharacteristicTypes
{
  if (qword_1ED3787A0 != -1)
    dispatch_once(&qword_1ED3787A0, &__block_literal_global_137_2);
  return (id)qword_1ED3787A8;
}

void __60__HFIrrigationValveServiceState_requiredCharacteristicTypes__block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB8900];
  v5[0] = *MEMORY[0x1E0CB8790];
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ED3787A8;
  qword_1ED3787A8 = v3;

}

+ (unint64_t)_typeForSystemActiveState:(BOOL)a3 usageState:(int64_t)a4
{
  unint64_t v4;
  unint64_t v5;

  v4 = 2;
  if (a3)
    v4 = 3;
  v5 = a3;
  if (a4)
    v5 = v4;
  if (a4 == 1)
    return v4;
  else
    return v5;
}

- (HFIrrigationValveServiceState)initWithBatchReadResponse:(id)a3
{
  id v4;
  void *v5;
  int v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  HFIrrigationValveServiceState *v15;
  HFIrrigationValveServiceState *v16;
  HFIrrigationValveServiceState *v17;
  objc_super v19;

  v4 = a3;
  objc_msgSend(v4, "allServices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "na_any:", &__block_literal_global_138_1);

  v7 = (_QWORD *)MEMORY[0x1E0CB9B08];
  if (v6)
    v7 = (_QWORD *)MEMORY[0x1E0CB9A50];
  v8 = *MEMORY[0x1E0CB8790];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseForCharacteristicType:inServicesOfTypes:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueWithExpectedClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "responseForCharacteristicType:", *MEMORY[0x1E0CB8900]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "valueWithExpectedClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v14 = v13 == 0;
  else
    v14 = 1;
  if (v14)
  {
    v15 = 0;
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)HFIrrigationValveServiceState;
    v16 = -[HFIrrigationValveServiceState init](&v19, sel_init);
    v17 = v16;
    if (v16)
      v16->_type = objc_msgSend((id)objc_opt_class(), "_typeForSystemActiveState:usageState:", objc_msgSend(v11, "BOOLValue"), objc_msgSend(v13, "unsignedIntegerValue"));
    self = v17;
    v15 = self;
  }

  return v15;
}

uint64_t __59__HFIrrigationValveServiceState_initWithBatchReadResponse___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "serviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB9A50]);

  return v3;
}

- (id)stateTypeIdentifier
{
  unint64_t v2;

  v2 = -[HFIrrigationValveServiceState type](self, "type");
  if (v2 - 1 > 2)
    return CFSTR("Off");
  else
    return off_1EA73A5A8[v2 - 1];
}

- (int64_t)primaryState
{
  if (-[HFIrrigationValveServiceState type](self, "type"))
    return 2;
  else
    return 1;
}

- (int64_t)priority
{
  if (-[HFIrrigationValveServiceState type](self, "type"))
    return 0;
  else
    return -1;
}

- (BOOL)isTransitioning
{
  return -[HFIrrigationValveServiceState type](self, "type") == 2;
}

- (unint64_t)type
{
  return self->_type;
}

@end
