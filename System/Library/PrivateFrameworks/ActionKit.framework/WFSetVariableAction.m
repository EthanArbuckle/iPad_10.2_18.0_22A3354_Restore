@implementation WFSetVariableAction

- (void)runWithInput:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  -[WFSetVariableAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFVariableName"), objc_opt_class());
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[WFSetVariableAction variableSource](self, "variableSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(v6, "setContent:forVariableWithName:", v7, v8);
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
    -[WFSetVariableAction parameterStateForKey:](self, "parameterStateForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v14.receiver = self;
    v14.super_class = (Class)WFSetVariableAction;
    v10 = -[WFSetVariableAction setParameterState:forKey:](&v14, sel_setParameterState_forKey_, v6, v7);
    objc_msgSend(v6, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSetVariableAction didChangeVariableName:to:](self, "didChangeVariableName:to:", v9, v11);

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFSetVariableAction;
    v10 = -[WFSetVariableAction setParameterState:forKey:](&v13, sel_setParameterState_forKey_, v6, v7);
  }

  return v10;
}

- (id)variableName
{
  void *v2;
  void *v3;

  -[WFSetVariableAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFVariableName"));
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
  -[WFSetVariableAction variableName](self, "variableName");
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

- (id)accessibilityName
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  -[WFSetVariableAction localizedName](self, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSetVariableAction variableName](self, "variableName");
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
  -[WFSetVariableAction variableName](self, "variableName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BEC4140]), "initWithName:variableProvider:aggrandizements:", v8, v6, 0);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)WFSetVariableAction;
    -[WFSetVariableAction outputVariableWithVariableProvider:UUIDProvider:](&v12, sel_outputVariableWithVariableProvider_UUIDProvider_, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

@end
