@implementation WFAppendVariableAction

- (void)runWithInput:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[WFAppendVariableAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFVariableName"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAppendVariableAction variableSource](self, "variableSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentForVariableWithName:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = (id)objc_opt_new();
  v11 = v10;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v5, "items", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(v11, "addItem:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v15);
  }

  -[WFAppendVariableAction variableSource](self, "variableSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setContent:forVariableWithName:", v11, v6);

  -[WFAppendVariableAction setOutput:](self, "setOutput:", v11);
}

- (BOOL)shouldBeSuggestedAfterAction:(id)a3 inWorkflow:(id)a4
{
  return objc_msgSend(a3, "hasAvailableVariables");
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  objc_super v13;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(v7, "isEqualToString:", CFSTR("WFVariableName")))
  {
    -[WFAppendVariableAction parameterStateForKey:](self, "parameterStateForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v14.receiver = self;
    v14.super_class = (Class)WFAppendVariableAction;
    v10 = -[WFAppendVariableAction setParameterState:forKey:](&v14, sel_setParameterState_forKey_, v6, v7);
    objc_msgSend(v6, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppendVariableAction didChangeVariableName:to:](self, "didChangeVariableName:to:", v9, v11);

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFAppendVariableAction;
    v10 = -[WFAppendVariableAction setParameterState:forKey:](&v13, sel_setParameterState_forKey_, v6, v7);
  }

  return v10;
}

- (id)variableName
{
  void *v2;
  void *v3;

  -[WFAppendVariableAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFVariableName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)providedVariableNames
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  -[WFAppendVariableAction variableName](self, "variableName");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)inheritedOutputContentClassesInWorkflow:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "containsObject:", self) & 1) != 0)
  {
    v8 = (void *)MEMORY[0x24BDBD1A8];
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)WFAppendVariableAction;
    -[WFAppendVariableAction inheritedOutputContentClassesInWorkflow:context:](&v16, sel_inheritedOutputContentClassesInWorkflow_context_, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", self);
    objc_msgSend(v6, "variableAvailability");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppendVariableAction variableName](self, "variableName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "possibleContentClassesForVariableNamed:atIndex:context:excludingAction:", v11, objc_msgSend(v12, "indexOfObject:", self), v7, self);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)accessibilityName
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  -[WFAppendVariableAction localizedName](self, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAppendVariableAction variableName](self, "variableName");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &stru_24F8BBA48;
  if (v4)
    v6 = (const __CFString *)v4;
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" (%@)"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)outputVariableWithVariableProvider:(id)a3 UUIDProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  -[WFAppendVariableAction variableName](self, "variableName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BEC4140]), "initWithName:variableProvider:aggrandizements:", v8, v6, 0);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)WFAppendVariableAction;
    -[WFAppendVariableAction outputVariableWithVariableProvider:UUIDProvider:](&v12, sel_outputVariableWithVariableProvider_UUIDProvider_, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

@end
