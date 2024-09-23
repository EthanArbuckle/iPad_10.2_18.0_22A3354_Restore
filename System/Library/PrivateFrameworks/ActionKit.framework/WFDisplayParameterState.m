@implementation WFDisplayParameterState

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  v7 = (objc_class *)MEMORY[0x24BE194E0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithSerializedRepresentation:variableProvider:parameter:", v10, v9, v8);

  return v11;
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFDisplayParameterState.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[value isKindOfClass:[WFDisplay class]]"));

  }
  objc_msgSend(v5, "serializedRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  void (**v8)(id, void *, _QWORD);
  void (**v9)(id, void *, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = (void (**)(id, void *, _QWORD))a4;
  v9 = (void (**)(id, void *, _QWORD))a5;
  -[WFVariableSubstitutableParameterState variable](self, "variable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[WFVariableSubstitutableParameterState variable](self, "variable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v11, "prompt");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, v12, 0);

    }
    else
    {

      -[WFVariableSubstitutableParameterState variable](self, "variable");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "getContentWithContext:completionHandler:", v13, v9);
    }
  }
  else
  {
    -[WFVariableSubstitutableParameterState value](self, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v11, 0);
  }

}

@end
