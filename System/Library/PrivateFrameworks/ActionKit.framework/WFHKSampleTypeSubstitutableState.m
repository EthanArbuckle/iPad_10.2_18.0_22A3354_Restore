@implementation WFHKSampleTypeSubstitutableState

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v5;
  uint64_t v6;
  id v7;
  __CFString *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _BYTE v17[24];
  id v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = v5;
  if (v7 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v17 = 136315906;
      *(_QWORD *)&v17[4] = "WFEnforceClass";
      *(_WORD *)&v17[12] = 2114;
      *(_QWORD *)&v17[14] = v7;
      *(_WORD *)&v17[22] = 2114;
      v18 = (id)objc_opt_class();
      LOWORD(v19) = 2114;
      *(_QWORD *)((char *)&v19 + 2) = v6;
      v10 = v18;
      _os_log_impl(&dword_22D353000, v9, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", v17, 0x2Au);

    }
    v8 = 0;
  }
  else
  {
    v8 = (__CFString *)v7;
  }

  if (-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("Menstrual Flow")))
  {

    v8 = CFSTR("Menstruation");
  }
  +[WFHealthKitHelper sampleTypeIdentifierFromReadableTypeIdentifier:](WFHealthKitHelper, "sampleTypeIdentifierFromReadableTypeIdentifier:", v8, *(_OWORD *)v17, *(_QWORD *)&v17[16], v18, v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", v11);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFHKSampleTypeSubstitutableState.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[value isKindOfClass:[HKSampleType class]]"));

  }
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFHealthKitHelper readableSampleTypeIdentifierFromSampleTypeIdentifier:](WFHealthKitHelper, "readableSampleTypeIdentifierFromSampleTypeIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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
  void *v16;
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
      v17[2] = __93__WFHKSampleTypeSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
      v17[3] = &unk_24F8BA828;
      v18 = v10;
      objc_msgSend(v14, "getObjectRepresentationForClass:context:completionHandler:", v15, v8, v17);

      v12 = v18;
    }

  }
  else
  {
    -[WFVariableSubstitutableParameterState value](self, "value");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v10 + 2))(v10, v16, 0);

  }
}

void __93__WFHKSampleTypeSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (a2)
  {
    +[WFHealthKitHelper sampleTypeIdentifierFromReadableTypeIdentifier:](WFHealthKitHelper, "sampleTypeIdentifierFromReadableTypeIdentifier:", a2);
    v3 = objc_claimAutoreleasedReturnValue();
    v7 = (id)v3;
    if (v3)
    {
      objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 32);
      if (v4)
      {
        (*(void (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v4, 0);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v6, 0);

      }
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

@end
