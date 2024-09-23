@implementation WFINRideOptionParameterState

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("Name"));

  objc_msgSend(v3, "estimatedPickupDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v6, CFSTR("EstimatedPickupDate"));

  objc_msgSend(v3, "availablePartySizeOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v3, "availablePartySizeOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "if_compactMap:", &__block_literal_global_33090);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("AvailablePartySizeOptions"));
  }

  return v4;
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v5 = a3;
  v6 = objc_opt_class();
  WFEnforceClass(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  WFEnforceClass(v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("EstimatedPickupDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  WFEnforceClass(v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA010]), "initWithName:estimatedPickupDate:", v10, v13);
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AvailablePartySizeOptions"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_class();
    WFEnforceClass(v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v17, "if_compactMap:", &__block_literal_global_135_33077);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAvailablePartySizeOptions:", v18);

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

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
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;

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
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __89__WFINRideOptionParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
      v20[3] = &unk_24F8BA828;
      v21 = v10;
      objc_msgSend(v14, "getObjectRepresentationForClass:context:completionHandler:", v15, v8, v20);

      v12 = v21;
    }

  }
  else
  {
    v16 = objc_alloc(MEMORY[0x24BDDA1A0]);
    -[WFVariableSubstitutableParameterState value](self, "value");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v16, "initWithSpokenPhrase:", v18);
    (*((void (**)(id, void *, _QWORD))v10 + 2))(v10, v19, 0);

  }
}

void __89__WFINRideOptionParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  uint64_t v8;
  objc_class *v9;
  id v10;
  id v11;
  void (*v12)(uint64_t, _QWORD, id);
  id v13;

  v7 = a2;
  v8 = *(_QWORD *)(a1 + 32);
  v13 = v7;
  if (v7)
  {
    v9 = (objc_class *)MEMORY[0x24BDDA1A0];
    v10 = a5;
    v11 = (id)objc_msgSend([v9 alloc], "initWithSpokenPhrase:", v13);
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v11, v10);

  }
  else
  {
    v12 = *(void (**)(uint64_t, _QWORD, id))(v8 + 16);
    v11 = a5;
    v12(v8, 0, v11);
  }

}

@end
