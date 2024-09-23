@implementation WFMeasurementCreateAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  -[WFMeasurementCreateAction currentUnit](self, "currentUnit", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFMeasurementCreateAction currentValue](self, "currentValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = (void *)MEMORY[0x24BE19450];
    v7 = objc_alloc(MEMORY[0x24BDD1660]);
    objc_msgSend(v5, "doubleValue");
    v8 = (void *)objc_msgSend(v7, "initWithDoubleValue:unit:", v4);
    objc_msgSend(v6, "itemWithObject:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x24BE19438];
    v17 = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "collectionWithItems:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFMeasurementCreateAction setOutput:](self, "setOutput:", v12);

    -[WFMeasurementCreateAction finishRunningWithError:](self, "finishRunningWithError:", 0);
  }
  else
  {
    WFLocalizedString(CFSTR("Measurement failed because no unit was specified. Please pick a unit."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BEC4270];
    v18 = *MEMORY[0x24BDD0FC8];
    v19[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 5, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFMeasurementCreateAction finishRunningWithError:](self, "finishRunningWithError:", v16);

  }
}

- (id)currentUnit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[WFMeasurementCreateAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFMeasurementUnit"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WFMeasurementCreateAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFMeasurementUnitType"), objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEC1540], "availableUnitsForUnitType:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unitString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectMatchingKey:value:", CFSTR("symbol"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)currentValue
{
  void *v2;
  void *v3;
  void *v4;

  -[WFMeasurementCreateAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFMeasurementUnit"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "magnitude");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)initializeParameters
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFMeasurementCreateAction;
  -[WFMeasurementCreateAction initializeParameters](&v6, sel_initializeParameters);
  -[WFMeasurementCreateAction currentUnitTypeState](self, "currentUnitTypeState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFMeasurementCreateAction unitParameter](self, "unitParameter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUnitType:", v3);

  -[WFMeasurementCreateAction unitParameter](self, "unitParameter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v3 == 0);

}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WFMeasurementCreateAction;
  v7 = -[WFMeasurementCreateAction setParameterState:forKey:](&v11, sel_setParameterState_forKey_, a3, v6);
  if (v7)
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("WFMeasurementUnitType")))
    {
      -[WFMeasurementCreateAction currentUnitTypeState](self, "currentUnitTypeState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFMeasurementCreateAction unitParameter](self, "unitParameter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setUnitType:", v8);
      objc_msgSend(v9, "setHidden:", v8 == 0);

    }
    else if (objc_msgSend(v6, "isEqualToString:", CFSTR("WFMeasurementUnit")))
    {
      -[WFMeasurementCreateAction outputDetailsUpdated](self, "outputDetailsUpdated");
    }
  }

  return v7;
}

- (id)parametersRequiringUserInputAlongsideParameter:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  objc_msgSend(v4, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("WFMeasurementUnitType"));

  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDBCF20];
    -[WFMeasurementCreateAction parameterForKey:](self, "parameterForKey:", CFSTR("WFMeasurementUnit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithObject:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)WFMeasurementCreateAction;
    -[WFMeasurementCreateAction parametersRequiringUserInputAlongsideParameter:](&v11, sel_parametersRequiringUserInputAlongsideParameter_, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)unitParameter
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[WFMeasurementCreateAction parameterForKey:](self, "parameterForKey:", CFSTR("WFMeasurementUnit"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  v4 = v2;
  if (v4 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v9 = 136315906;
      v10 = "WFEnforceClass";
      v11 = 2114;
      v12 = v4;
      v13 = 2114;
      v14 = (id)objc_opt_class();
      v15 = 2114;
      v16 = v3;
      v7 = v14;
      _os_log_impl(&dword_22D353000, v6, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v9, 0x2Au);

    }
    v5 = 0;
  }
  else
  {
    v5 = v4;
  }

  return v5;
}

- (id)currentUnitTypeState
{
  void *v2;
  void *v3;

  -[WFMeasurementCreateAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFMeasurementUnitType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
