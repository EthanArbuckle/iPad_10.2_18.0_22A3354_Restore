@implementation WFMeasurementUnitPickerParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (void)setAction:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_action);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_action);
    objc_msgSend(v5, "removeEventObserver:", self);

    v6 = objc_storeWeak((id *)&self->_action, obj);
    objc_msgSend(obj, "addEventObserver:", self);

  }
}

- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;

  v5 = a4;
  -[WFMeasurementUnitPickerParameter definition](self, "definition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("WFMeasurementUnitTypeKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if (v8)
  {
    -[WFMeasurementUnitPickerParameter attributesDidChange](self, "attributesDidChange");
    -[WFMeasurementUnitPickerParameter possibleStatesDidChange](self, "possibleStatesDidChange");
    -[WFMeasurementUnitPickerParameter defaultSerializedRepresentationDidChange](self, "defaultSerializedRepresentationDidChange");
  }
}

- (id)currentUnitType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[WFMeasurementUnitPickerParameter action](self, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFMeasurementUnitPickerParameter definition](self, "definition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("WFMeasurementUnitTypeKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parameterStateForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isHidden
{
  void *v2;
  BOOL v3;

  -[WFMeasurementUnitPickerParameter currentUnitType](self, "currentUnitType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (id)possibleStates
{
  void *v2;
  void *v3;
  void *v4;

  -[WFMeasurementUnitPickerParameter currentUnitType](self, "currentUnitType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC1540], "availableUnitsForUnitType:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_map:", &__block_literal_global_34146);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDD1668]);
  objc_msgSend(v4, "setUnitStyle:", 3);
  objc_msgSend(v4, "stringFromUnit:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedLowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)defaultSerializedRepresentation
{
  void *v2;
  void *v3;
  void *v4;

  -[WFMeasurementUnitPickerParameter currentUnitType](self, "currentUnitType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEC1540], "defaultUnitForUnitType:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFNSUnitSubstitutableState serializedRepresentationFromValue:](WFNSUnitSubstitutableState, "serializedRepresentationFromValue:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (WFAction)action
{
  return (WFAction *)objc_loadWeakRetained((id *)&self->_action);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_action);
}

WFNSUnitSubstitutableState *__50__WFMeasurementUnitPickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WFNSUnitSubstitutableState *v3;

  v2 = a2;
  v3 = -[WFVariableSubstitutableParameterState initWithValue:]([WFNSUnitSubstitutableState alloc], "initWithValue:", v2);

  return v3;
}

@end
