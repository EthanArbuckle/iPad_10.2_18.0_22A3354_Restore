@implementation HFIrrigationSystemServiceState

- (HFIrrigationSystemServiceState)initWithBatchReadResponse:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  HFIrrigationSystemServiceState *v19;
  HFIrrigationSystemServiceState *v20;
  objc_super v22;

  v4 = *MEMORY[0x1E0CB8790];
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = *MEMORY[0x1E0CB9A50];
  v7 = a3;
  objc_msgSend(v5, "setWithObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "responseForCharacteristicType:inServicesOfTypes:", v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueWithExpectedClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *MEMORY[0x1E0CB89D0];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "responseForCharacteristicType:inServicesOfTypes:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "valueWithExpectedClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = *MEMORY[0x1E0CB8900];
  if (qword_1ED3787C0 != -1)
    dispatch_once(&qword_1ED3787C0, &__block_literal_global_150_0);
  v16 = (id)qword_1ED3787C8;
  objc_msgSend(v7, "responseForCharacteristicType:inServicesOfTypes:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "valueWithExpectedClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  if (v10 && v18 && v14)
  {
    v22.receiver = self;
    v22.super_class = (Class)HFIrrigationSystemServiceState;
    v20 = -[HFIrrigationSystemServiceState init](&v22, sel_init);
    if (v20)
      v20->_type = objc_msgSend((id)objc_opt_class(), "_typeForActiveState:usageState:programMode:", objc_msgSend(v10, "BOOLValue"), objc_msgSend(v18, "unsignedIntegerValue"), objc_msgSend(v14, "unsignedIntegerValue"));
    self = v20;
    v19 = self;
  }

  return v19;
}

+ (unint64_t)_typeForActiveState:(BOOL)a3 usageState:(int64_t)a4 programMode:(int64_t)a5
{
  if (!a4)
    goto LABEL_6;
  if (a4 != 1)
    return result;
  if ((unint64_t)a5 < 3)
    return qword_1DD669A00[a5];
LABEL_6:
  if (a3)
    return a5 != 0;
  return 0;
}

+ (id)requiredCharacteristicTypes
{
  if (qword_1ED3787B0 != -1)
    dispatch_once(&qword_1ED3787B0, &__block_literal_global_148_1);
  return (id)qword_1ED3787B8;
}

- (id)stateTypeIdentifier
{
  unint64_t v2;

  v2 = -[HFIrrigationSystemServiceState type](self, "type");
  if (v2 - 1 > 2)
    return CFSTR("Off");
  else
    return off_1EA73A5C0[v2 - 1];
}

- (int64_t)primaryState
{
  if (-[HFIrrigationSystemServiceState type](self, "type") < 2)
    return 1;
  else
    return 2;
}

- (int64_t)priority
{
  if (-[HFIrrigationSystemServiceState type](self, "type"))
    return 0;
  else
    return -1;
}

- (unint64_t)type
{
  return self->_type;
}

+ (id)stateClassIdentifier
{
  return CFSTR("IrrigationSystem");
}

void __60__HFIrrigationSystemServiceState_initWithBatchReadResponse___block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB9B08];
  v5[0] = *MEMORY[0x1E0CB9A50];
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ED3787C8;
  qword_1ED3787C8 = v3;

}

void __61__HFIrrigationSystemServiceState_requiredCharacteristicTypes__block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB8900];
  v5[0] = *MEMORY[0x1E0CB8790];
  v5[1] = v1;
  v5[2] = *MEMORY[0x1E0CB89D0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ED3787B8;
  qword_1ED3787B8 = v3;

}

@end
