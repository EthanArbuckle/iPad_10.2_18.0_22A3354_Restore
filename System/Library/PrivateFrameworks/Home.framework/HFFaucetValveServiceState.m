@implementation HFFaucetValveServiceState

+ (id)requiredCharacteristicTypes
{
  if (qword_1ED378760 != -1)
    dispatch_once(&qword_1ED378760, &__block_literal_global_98_0);
  return (id)qword_1ED378768;
}

void __56__HFFaucetValveServiceState_requiredCharacteristicTypes__block_invoke_2()
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
  v4 = (void *)qword_1ED378768;
  qword_1ED378768 = v3;

}

+ (id)stateClassIdentifier
{
  return CFSTR("FaucetValve");
}

+ (id)optionalCharacteristicTypes
{
  if (qword_1ED378770 != -1)
    dispatch_once(&qword_1ED378770, &__block_literal_global_101_0);
  return (id)qword_1ED378778;
}

void __56__HFFaucetValveServiceState_optionalCharacteristicTypes__block_invoke_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = *MEMORY[0x1E0CB8840];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED378778;
  qword_1ED378778 = v2;

}

+ (unint64_t)_typeForSystemActiveState:(BOOL)a3 heaterCoolerActiveState:(id)a4 usageState:(int64_t)a5 currentHeaterCoolerState:(id)a6
{
  unint64_t v6;
  _BOOL4 v9;
  id v10;
  id v11;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (a5 == 1)
  {
    if (v9)
      v6 = 5;
    else
      v6 = 4;
  }
  else if (!a5)
  {
    if (v9)
    {
      v6 = 3;
    }
    else if (v10 && objc_msgSend(v10, "BOOLValue"))
    {
      if (v11 && objc_msgSend(v11, "unsignedIntegerValue") == 2)
        v6 = 1;
      else
        v6 = 2;
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (HFFaucetValveServiceState)initWithBatchReadResponse:(id)a3
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
  HFFaucetValveServiceState *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  HFFaucetValveServiceState *v23;
  objc_super v25;

  v4 = a3;
  objc_msgSend(v4, "allServices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "na_any:", &__block_literal_global_103_4);

  v7 = (_QWORD *)MEMORY[0x1E0CB9B08];
  if (v6)
    v7 = (_QWORD *)MEMORY[0x1E0CB9A18];
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
    if (qword_1ED378780 != -1)
      dispatch_once(&qword_1ED378780, &__block_literal_global_106_4);
    v16 = (id)qword_1ED378788;
    objc_msgSend(v4, "responseForCharacteristicType:inServicesOfTypes:", v8, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "valueWithExpectedClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = *MEMORY[0x1E0CB8840];
    if (qword_1ED378790 != -1)
      dispatch_once(&qword_1ED378790, &__block_literal_global_108_3);
    v20 = (id)qword_1ED378798;
    objc_msgSend(v4, "responseForCharacteristicType:inServicesOfTypes:", v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "valueWithExpectedClass:", objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v25.receiver = self;
    v25.super_class = (Class)HFFaucetValveServiceState;
    v23 = -[HFFaucetValveServiceState init](&v25, sel_init);
    if (v23)
      v23->_type = objc_msgSend((id)objc_opt_class(), "_typeForSystemActiveState:heaterCoolerActiveState:usageState:currentHeaterCoolerState:", objc_msgSend(v11, "BOOLValue"), v18, objc_msgSend(v13, "unsignedIntegerValue"), v22);
    self = v23;

    v15 = self;
  }

  return v15;
}

uint64_t __55__HFFaucetValveServiceState_initWithBatchReadResponse___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "serviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB9A18]);

  return v3;
}

void __55__HFFaucetValveServiceState_initWithBatchReadResponse___block_invoke_3()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = *MEMORY[0x1E0CB9A30];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED378788;
  qword_1ED378788 = v2;

}

void __55__HFFaucetValveServiceState_initWithBatchReadResponse___block_invoke_5()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = *MEMORY[0x1E0CB9A30];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED378798;
  qword_1ED378798 = v2;

}

- (id)stateTypeIdentifier
{
  unint64_t v2;

  v2 = -[HFFaucetValveServiceState type](self, "type");
  if (v2 - 1 > 4)
    return CFSTR("Off");
  else
    return off_1EA73A580[v2 - 1];
}

- (int64_t)primaryState
{
  unint64_t v2;

  v2 = -[HFFaucetValveServiceState type](self, "type");
  if (v2 == 3 || v2 == 0)
    return 1;
  else
    return 2;
}

- (int64_t)priority
{
  if (-[HFFaucetValveServiceState type](self, "type"))
    return 0;
  else
    return -1;
}

- (BOOL)isTransitioning
{
  return -[HFFaucetValveServiceState type](self, "type") == 4 || -[HFFaucetValveServiceState type](self, "type") == 3;
}

- (unint64_t)type
{
  return self->_type;
}

@end
