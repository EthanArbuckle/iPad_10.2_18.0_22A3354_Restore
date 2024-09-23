@implementation WFPHAssetCollectionState

- (WFPHAssetCollectionState)initWithCollection:(id)a3
{
  id v4;
  WFPHAssetCollectionDescriptor *v5;
  void *v6;
  void *v7;
  WFPHAssetCollectionDescriptor *v8;
  WFPHAssetCollectionState *v9;

  v4 = a3;
  v5 = [WFPHAssetCollectionDescriptor alloc];
  objc_msgSend(v4, "localIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[WFPHAssetCollectionDescriptor initWithLocalIdentifier:localizedTitle:](v5, "initWithLocalIdentifier:localizedTitle:", v6, v7);
  v9 = -[WFVariableSubstitutableParameterState initWithValue:](self, "initWithValue:", v8);

  return v9;
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
      v17[2] = __85__WFPHAssetCollectionState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
      v17[3] = &unk_24F8BA828;
      v18 = v10;
      objc_msgSend(v14, "getObjectRepresentationForClass:context:completionHandler:", v15, v8, v17);

      v12 = v18;
    }

  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)WFPHAssetCollectionState;
    -[WFVariableSubstitutableParameterState processWithContext:userInputRequiredHandler:valueHandler:](&v16, sel_processWithContext_userInputRequiredHandler_valueHandler_, v8, v9, v10);
  }

}

void __85__WFPHAssetCollectionState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  uint64_t v8;
  id v9;
  WFPHAssetCollectionDescriptor *v10;
  void (*v11)(uint64_t, _QWORD, WFPHAssetCollectionDescriptor *);
  id v12;

  v7 = a2;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v7;
  if (v7)
  {
    v9 = a5;
    v10 = -[WFPHAssetCollectionDescriptor initWithLocalIdentifier:localizedTitle:]([WFPHAssetCollectionDescriptor alloc], "initWithLocalIdentifier:localizedTitle:", 0, v12);
    (*(void (**)(uint64_t, WFPHAssetCollectionDescriptor *, id))(v8 + 16))(v8, v10, v9);

  }
  else
  {
    v11 = *(void (**)(uint64_t, _QWORD, WFPHAssetCollectionDescriptor *))(v8 + 16);
    v10 = a5;
    v11(v8, 0, v10);
  }

}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFPHAssetCollectionState.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[value isKindOfClass:[WFPHAssetCollectionDescriptor class]]"));

  }
  objc_msgSend(v5, "localizedTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v5;
  uint64_t v6;
  id v7;
  WFPHAssetCollectionDescriptor *v8;
  NSObject *v9;
  id v10;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = v5;
  if (!v7)
  {
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v12 = 136315906;
      v13 = "WFEnforceClass";
      v14 = 2114;
      v15 = v7;
      v16 = 2114;
      v17 = (id)objc_opt_class();
      v18 = 2114;
      v19 = v6;
      v10 = v17;
      _os_log_impl(&dword_22D353000, v9, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v12, 0x2Au);

    }
    goto LABEL_7;
  }
  v8 = -[WFPHAssetCollectionDescriptor initWithLocalIdentifier:localizedTitle:]([WFPHAssetCollectionDescriptor alloc], "initWithLocalIdentifier:localizedTitle:", 0, v7);

LABEL_8:
  return v8;
}

@end
