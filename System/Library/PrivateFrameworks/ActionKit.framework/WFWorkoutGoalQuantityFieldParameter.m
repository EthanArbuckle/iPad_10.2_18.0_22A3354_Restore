@implementation WFWorkoutGoalQuantityFieldParameter

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

    -[WFWorkoutGoalQuantityFieldParameter updatePossibleUnits](self, "updatePossibleUnits");
  }

}

- (void)wasAddedToWorkflow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFWorkoutGoalQuantityFieldParameter;
  -[WFWorkoutGoalQuantityFieldParameter wasAddedToWorkflow](&v4, sel_wasAddedToWorkflow);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_updatePossibleUnits, *MEMORY[0x24BDD3838], 0);

}

- (void)wasRemovedFromWorkflow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFWorkoutGoalQuantityFieldParameter;
  -[WFWorkoutGoalQuantityFieldParameter wasRemovedFromWorkflow](&v4, sel_wasRemovedFromWorkflow);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDD3838], 0);

}

- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;

  v5 = a4;
  -[WFWorkoutGoalQuantityFieldParameter definition](self, "definition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("WFWorkoutGoalKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if (v8)
    -[WFWorkoutGoalQuantityFieldParameter updatePossibleUnits](self, "updatePossibleUnits");
}

- (id)currentWorkoutActivityType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[WFWorkoutGoalQuantityFieldParameter action](self, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkoutGoalQuantityFieldParameter definition](self, "definition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("WFWorkoutGoalKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parameterStateForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)availableUnitsForWorkoutActivityType:(id)a3 completion:(id)a4
{
  +[WFFitnessUIHelper preferredUnitsForActivityType:completion:](WFFitnessUIHelper, "preferredUnitsForActivityType:completion:", a3, a4);
}

- (id)defaultSerializedRepresentation
{
  WFPropertyListObject *defaultSerializedRepresentation;
  void *v4;
  WFPropertyListObject *v5;
  WFPropertyListObject *v6;

  defaultSerializedRepresentation = self->_defaultSerializedRepresentation;
  if (!defaultSerializedRepresentation)
  {
    -[WFWorkoutGoalQuantityFieldParameter defaultState](self, "defaultState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serializedRepresentation");
    v5 = (WFPropertyListObject *)objc_claimAutoreleasedReturnValue();
    v6 = self->_defaultSerializedRepresentation;
    self->_defaultSerializedRepresentation = v5;

    defaultSerializedRepresentation = self->_defaultSerializedRepresentation;
  }
  return defaultSerializedRepresentation;
}

- (id)defaultState
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[WFWorkoutGoalQuantityFieldParameter definition](self, "definition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BEC4518]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = v4;
  if (v6 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v15 = 136315906;
      v16 = "WFEnforceClass";
      v17 = 2114;
      v18 = v6;
      v19 = 2114;
      v20 = (id)objc_opt_class();
      v21 = 2114;
      v22 = v5;
      v9 = v20;
      _os_log_impl(&dword_22D353000, v8, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v15, 0x2Au);

    }
    v7 = 0;
  }
  else
  {
    v7 = v6;
  }

  -[WFWorkoutGoalQuantityFieldParameter possibleUnits](self, "possibleUnits");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC3F18]), "initWithValue:", v7);
  else
    v12 = 0;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC3FC0]), "initWithMagnitudeState:unitString:", v12, v11);

  return v13;
}

- (void)updateCurrentStateWithNewUnitString:(id)a3 currentState:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = (objc_class *)MEMORY[0x24BEC3FC0];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  objc_msgSend(v7, "magnitudeState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (id)objc_msgSend(v9, "initWithMagnitudeState:unitString:", v10, v8);
  -[WFWorkoutGoalQuantityFieldParameter action](self, "action");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkoutGoalQuantityFieldParameter key](self, "key");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setParameterState:forKey:", v13, v12);

}

- (void)updatePossibleUnits
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD *v21;
  _QWORD v22[5];
  id v23;

  -[WFWorkoutGoalQuantityFieldParameter action](self, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkoutGoalQuantityFieldParameter key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parameterStateForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "unitString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  objc_msgSend(MEMORY[0x24BDD4048], "unitFromString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFWorkoutGoalQuantityFieldParameter unitConversion](WFWorkoutGoalQuantityFieldParameter, "unitConversion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__17300;
  v22[4] = __Block_byref_object_dispose__17301;
  v23 = 0;
  -[WFWorkoutGoalQuantityFieldParameter currentWorkoutActivityType](self, "currentWorkoutActivityType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __58__WFWorkoutGoalQuantityFieldParameter_updatePossibleUnits__block_invoke;
  v16[3] = &unk_24F8B38E8;
  v16[4] = self;
  v12 = v8;
  v17 = v12;
  v13 = v10;
  v18 = v13;
  v21 = v22;
  v14 = v7;
  v19 = v14;
  v15 = v5;
  v20 = v15;
  +[WFFitnessUIHelper preferredUnitsForActivityType:completion:](WFFitnessUIHelper, "preferredUnitsForActivityType:completion:", v11, v16);

  _Block_object_dispose(v22, 8);
}

- (BOOL)parameterStateIsValid:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[WFWorkoutGoalQuantityFieldParameter possibleUnits](self, "possibleUnits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFWorkoutGoalQuantityFieldParameter possibleUnits](self, "possibleUnits");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unitString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "containsObject:", v7);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (id)localizedLabelForPossibleUnit:(id)a3 magnitude:(id)a4 style:(unint64_t)a5
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;

  v6 = (void *)MEMORY[0x24BDD4048];
  v7 = a4;
  objc_msgSend(v6, "wf_safeUnitFromString:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v7, "doubleValue");
  v11 = v10;

  objc_msgSend(v9, "numberWithDouble:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFHealthKitHelper localizedDisplayNameForUnit:value:](WFHealthKitHelper, "localizedDisplayNameForUnit:value:", v8, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)possibleUnits
{
  return self->_possibleUnits;
}

- (void)setPossibleUnits:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (WFAction)action
{
  return (WFAction *)objc_loadWeakRetained((id *)&self->_action);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_action);
  objc_storeStrong((id *)&self->_defaultSerializedRepresentation, 0);
  objc_storeStrong((id *)&self->_possibleUnits, 0);
}

void __58__WFWorkoutGoalQuantityFieldParameter_updatePossibleUnits__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  v4 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __58__WFWorkoutGoalQuantityFieldParameter_updatePossibleUnits__block_invoke_2;
  v16[3] = &unk_24F8B3898;
  v5 = *(void **)(a1 + 40);
  v16[4] = *(_QWORD *)(a1 + 32);
  v17 = v5;
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 72);
  v18 = v6;
  v20 = v7;
  v19 = *(id *)(a1 + 56);
  objc_msgSend(a2, "if_map:", v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __58__WFWorkoutGoalQuantityFieldParameter_updatePossibleUnits__block_invoke_3;
  v11[3] = &unk_24F8B38C0;
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v8;
  v9 = *(void **)(a1 + 64);
  v15 = *(_QWORD *)(a1 + 72);
  v13 = v9;
  v14 = *(id *)(a1 + 56);
  v10 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], v11);

}

id __58__WFWorkoutGoalQuantityFieldParameter_updatePossibleUnits__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  int v11;

  v5 = a2;
  objc_msgSend(v5, "unitString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 184))
  {
    if (*(_QWORD *)(a1 + 40))
    {
      v10 = *(void **)(a1 + 48);
      if (v10)
      {
        if (objc_msgSend(v10, "containsObject:", v5))
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v6);
      }
    }
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "count") > a3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v9 = objc_msgSend(v7, "isEqualToString:", v6);
    else
      v9 = 1;
    v11 = objc_msgSend(*(id *)(a1 + 56), "isEqualToString:", v8);
    if ((v9 & 1) == 0 && v11)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v6);

  }
  return v6;
}

void __58__WFWorkoutGoalQuantityFieldParameter_updatePossibleUnits__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 184), *(id *)(a1 + 40));
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateCurrentStateWithNewUnitString:currentState:", v2, *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 56));

    if ((v4 & 1) == 0)
    {
      v5 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "firstObject");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "updateCurrentStateWithNewUnitString:currentState:", v6, *(_QWORD *)(a1 + 48));

    }
  }
}

+ (id)unitConversion
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[7];
  _QWORD v24[9];

  v24[7] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD4048], "largeCalorieUnit");
  v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "jouleUnitWithMetricPrefix:", 9);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", v2, v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnitWithMetricPrefix:", 9);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "mileUnit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "yardUnit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)v2;
  v23[0] = v2;
  objc_msgSend(v5, "setByRemovingObject:", v2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v19;
  v21 = (void *)v3;
  v23[1] = v3;
  objc_msgSend(v5, "setByRemovingObject:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v10;
  v20 = (void *)v4;
  v23[2] = v4;
  objc_msgSend(v5, "setByRemovingObject:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v11;
  v18 = (void *)v6;
  v23[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v12;
  v23[4] = v7;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v13;
  v23[5] = v8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v14;
  v23[6] = v9;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 7);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end
