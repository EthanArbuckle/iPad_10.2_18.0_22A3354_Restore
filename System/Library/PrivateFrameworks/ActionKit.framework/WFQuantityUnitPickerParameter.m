@implementation WFQuantityUnitPickerParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFQuantityUnitPickerParameter)initWithDefinition:(id)a3
{
  id v4;
  WFQuantityUnitPickerParameter *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  dispatch_group_t v14;
  OS_dispatch_group *possibleStateLoadingGroup;
  WFQuantityUnitPickerParameter *v16;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WFQuantityUnitPickerParameter;
  v5 = -[WFQuantityUnitPickerParameter initWithDefinition:](&v18, sel_initWithDefinition_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("QuantityTypeIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    v8 = v6;
    if (v8 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      getWFGeneralLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        v11 = (void *)objc_opt_class();
        *(_DWORD *)buf = 136315906;
        v20 = "WFEnforceClass";
        v21 = 2114;
        v22 = v8;
        v23 = 2114;
        v24 = v11;
        v25 = 2114;
        v26 = v7;
        v12 = v11;
        _os_log_impl(&dword_22D353000, v10, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);

      }
      v9 = 0;
    }
    else
    {
      v9 = v8;
    }

    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    objc_storeStrong((id *)&v5->_quantityType, v13);
    if (v9)

    v14 = dispatch_group_create();
    possibleStateLoadingGroup = v5->_possibleStateLoadingGroup;
    v5->_possibleStateLoadingGroup = (OS_dispatch_group *)v14;

    -[WFQuantityUnitPickerParameter updatePossibleStates](v5, "updatePossibleStates");
    v16 = v5;

  }
  return v5;
}

- (void)setQuantityType:(id)a3
{
  HKQuantityType *v5;
  HKQuantityType *quantityType;
  char v7;
  HKQuantityType *v8;

  v5 = (HKQuantityType *)a3;
  quantityType = self->_quantityType;
  v8 = v5;
  if (quantityType == v5)
  {
    objc_storeStrong((id *)&self->_quantityType, a3);
  }
  else
  {
    v7 = -[HKQuantityType isEqual:](quantityType, "isEqual:", v5);
    objc_storeStrong((id *)&self->_quantityType, a3);
    if ((v7 & 1) == 0)
      -[WFQuantityUnitPickerParameter updatePossibleStates](self, "updatePossibleStates");
  }

}

- (id)defaultSerializedRepresentation
{
  void *v2;
  void *v3;
  void *v4;

  -[WFQuantityUnitPickerParameter possibleStates](self, "possibleStates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serializedRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)updatePossibleStates
{
  void *v3;
  NSArray *possibleStates;
  _QWORD v5[4];
  id v6;
  WFQuantityUnitPickerParameter *v7;

  -[WFQuantityUnitPickerParameter quantityType](self, "quantityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    dispatch_group_enter((dispatch_group_t)self->_possibleStateLoadingGroup);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __53__WFQuantityUnitPickerParameter_updatePossibleStates__block_invoke;
    v5[3] = &unk_24F8BA8A0;
    v6 = v3;
    v7 = self;
    +[WFHealthKitHelper validUnitsForQuantityType:completion:](WFHealthKitHelper, "validUnitsForQuantityType:completion:", v6, v5);

  }
  else
  {
    possibleStates = self->_possibleStates;
    self->_possibleStates = 0;

    -[WFQuantityUnitPickerParameter possibleStatesDidChange](self, "possibleStatesDidChange");
    -[WFQuantityUnitPickerParameter defaultSerializedRepresentationDidChange](self, "defaultSerializedRepresentationDidChange");
  }

}

- (id)possibleStates
{
  NSObject *possibleStateLoadingGroup;
  dispatch_time_t v4;

  possibleStateLoadingGroup = self->_possibleStateLoadingGroup;
  v4 = dispatch_time(0, 2000000000);
  dispatch_group_wait(possibleStateLoadingGroup, v4);
  return self->_possibleStates;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFQuantityUnitPickerParameter quantityType](self, "quantityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFHealthKitHelper localizedDisplayNameForUnit:quantityTypeIdentifier:](WFHealthKitHelper, "localizedDisplayNameForUnit:quantityTypeIdentifier:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (HKQuantityType)quantityType
{
  return self->_quantityType;
}

- (OS_dispatch_group)possibleStateLoadingGroup
{
  return self->_possibleStateLoadingGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleStateLoadingGroup, 0);
  objc_storeStrong((id *)&self->_quantityType, 0);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

void __53__WFQuantityUnitPickerParameter_updatePossibleStates__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD block[5];

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "quantityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "isEqual:", v5);

  if ((v4 & 1) != 0)
  {
    objc_msgSend(v3, "if_map:", &__block_literal_global_13149);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(void **)(v7 + 216);
    *(_QWORD *)(v7 + 216) = v6;

    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 40) + 232));
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__WFQuantityUnitPickerParameter_updatePossibleStates__block_invoke_3;
    block[3] = &unk_24F8BB638;
    block[4] = *(_QWORD *)(a1 + 40);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 40) + 232));
  }

}

uint64_t __53__WFQuantityUnitPickerParameter_updatePossibleStates__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "possibleStatesDidChange");
  return objc_msgSend(*(id *)(a1 + 32), "defaultSerializedRepresentationDidChange");
}

WFHKUnitSubstitutableState *__53__WFQuantityUnitPickerParameter_updatePossibleStates__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  WFHKUnitSubstitutableState *v3;

  v2 = a2;
  v3 = -[WFVariableSubstitutableParameterState initWithValue:]([WFHKUnitSubstitutableState alloc], "initWithValue:", v2);

  return v3;
}

@end
