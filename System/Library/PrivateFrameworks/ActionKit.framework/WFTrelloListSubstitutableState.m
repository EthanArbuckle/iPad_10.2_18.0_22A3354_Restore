@implementation WFTrelloListSubstitutableState

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_super v16;
  _QWORD v17[4];
  id v18;

  v8 = a3;
  v9 = (void (**)(id, void *, _QWORD))a4;
  v10 = a5;
  -[WFVariableSubstitutableParameterState variable](self, "variable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[WFVariableSubstitutableParameterState variable](self, "variable");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v12, "prompt");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v13, 0);

    }
    else
    {

      -[WFVariableSubstitutableParameterState variable](self, "variable");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_opt_class();
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __91__WFTrelloListSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
      v17[3] = &unk_24F8BA828;
      v18 = v10;
      objc_msgSend(v14, "getObjectRepresentationForClass:context:completionHandler:", v15, v8, v17);

      v12 = v18;
    }

  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)WFTrelloListSubstitutableState;
    -[WFVariableSubstitutableParameterState processWithContext:userInputRequiredHandler:valueHandler:](&v16, sel_processWithContext_userInputRequiredHandler_valueHandler_, v8, v9, v10);
  }

}

void __91__WFTrelloListSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6;
  id v7;
  id v8;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = a5;
  +[WFTrelloList listWithName:](WFTrelloList, "listWithName:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v8, v7);

}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x24BEC3FA0], "JSONDictionaryFromModel:error:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = v5;
  if (v7 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v13 = 136315906;
      v14 = "WFEnforceClass";
      v15 = 2114;
      v16 = v7;
      v17 = 2114;
      v18 = (id)objc_opt_class();
      v19 = 2114;
      v20 = v6;
      v10 = v18;
      _os_log_impl(&dword_22D353000, v9, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v13, 0x2Au);

    }
    v8 = 0;
  }
  else
  {
    v8 = v7;
  }

  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x24BEC3FA0], "modelOfClass:fromJSONDictionary:error:", objc_opt_class(), v8, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
