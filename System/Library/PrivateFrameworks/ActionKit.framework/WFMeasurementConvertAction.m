@implementation WFMeasurementConvertAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFMeasurementConvertAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFMeasurementUnit"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_opt_class();
    v7 = MEMORY[0x24BDAC760];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __57__WFMeasurementConvertAction_runAsynchronouslyWithInput___block_invoke;
    v14[3] = &unk_24F8B7450;
    v15 = v5;
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __57__WFMeasurementConvertAction_runAsynchronouslyWithInput___block_invoke_2;
    v13[3] = &unk_24F8BAFA8;
    v13[4] = self;
    objc_msgSend(v4, "transformObjectRepresentationsForClass:usingBlock:completionHandler:", v6, v14, v13);
    v8 = v15;
  }
  else
  {
    WFLocalizedString(CFSTR("Please provide a unit to convert to."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDD1540];
    v10 = *MEMORY[0x24BDD1128];
    v16 = *MEMORY[0x24BDD0FC8];
    v17[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 22, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFMeasurementConvertAction finishRunningWithError:](self, "finishRunningWithError:", v12);

  }
}

- (void)initializeParameters
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFMeasurementConvertAction;
  -[WFMeasurementConvertAction initializeParameters](&v4, sel_initializeParameters);
  -[WFMeasurementConvertAction unitParameter](self, "unitParameter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAction:", self);

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
    -[WFMeasurementConvertAction parameterForKey:](self, "parameterForKey:", CFSTR("WFMeasurementUnit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithObject:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)WFMeasurementConvertAction;
    -[WFMeasurementConvertAction parametersRequiringUserInputAlongsideParameter:](&v11, sel_parametersRequiringUserInputAlongsideParameter_, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6;
  _BOOL4 v7;
  objc_super v9;

  v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)WFMeasurementConvertAction;
  v7 = -[WFMeasurementConvertAction setParameterState:forKey:](&v9, sel_setParameterState_forKey_, a3, v6);
  if (v7 && objc_msgSend(v6, "isEqualToString:", CFSTR("WFMeasurementUnit")))
    -[WFMeasurementConvertAction outputDetailsUpdated](self, "outputDetailsUpdated");

  return v7;
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
  -[WFMeasurementConvertAction parameterForKey:](self, "parameterForKey:", CFSTR("WFMeasurementUnit"));
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

- (id)currentUnitType
{
  void *v2;
  void *v3;

  -[WFMeasurementConvertAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFMeasurementUnitType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)unitWithSymbol:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[WFMeasurementConvertAction currentUnitType](self, "currentUnitType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC1540], "availableUnitsForUnitType:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectMatchingKey:value:", CFSTR("symbol"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __57__WFMeasurementConvertAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void (**v13)(id, void *, id);
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = a5;
  if ((objc_msgSend(v9, "canBeConvertedToUnit:", v12) & 1) != 0)
  {
    v14 = (void *)MEMORY[0x24BE19450];
    objc_msgSend(v9, "measurementByConvertingToUnit:", *(_QWORD *)(a1 + 32));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "itemWithObject:named:", v15, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v13[2](v13, v16, v11);
  }
  else
  {
    v17 = objc_alloc_init(MEMORY[0x24BDD1668]);
    objc_msgSend(v17, "setUnitStyle:", 3);
    objc_msgSend(v9, "unit");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringFromUnit:", v18);
    v28 = v10;
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "stringFromUnit:", *(_QWORD *)(a1 + 32));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("A measurement with unit %1$@ can not be converted to %2$@."));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", v22, v19, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)MEMORY[0x24BDD1540];
    v25 = *MEMORY[0x24BDD1128];
    v29 = *MEMORY[0x24BDD0FC8];
    v30[0] = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 22, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, v27);

    v10 = v28;
  }

}

void __57__WFMeasurementConvertAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

@end
