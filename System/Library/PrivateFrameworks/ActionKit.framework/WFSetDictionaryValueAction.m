@implementation WFSetDictionaryValueAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;

  v4 = a3;
  -[WFSetDictionaryValueAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFDictionaryKey"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSetDictionaryValueAction parameterForKey:](self, "parameterForKey:", CFSTR("WFDictionaryKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSetDictionaryValueAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFDictionaryValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "variableString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSetDictionaryValueAction inputParameterKey](self, "inputParameterKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("WFDictionaryKey"));

  if (objc_msgSend(v8, "representsSingleContentVariable"))
  {
    v24 = objc_alloc(MEMORY[0x24BEC3F48]);
    -[WFSetDictionaryValueAction variableSource](self, "variableSource");
    v25 = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSetDictionaryValueAction workflow](self, "workflow");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v7;
    v14 = v5;
    v15 = v4;
    v16 = objc_msgSend(v12, "environment");
    -[WFSetDictionaryValueAction contentAttributionTracker](self, "contentAttributionTracker");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSetDictionaryValueAction widgetSizeClass](self, "widgetSizeClass");
    v26 = v6;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v16;
    v4 = v15;
    v5 = v14;
    v7 = v13;
    v20 = (void *)objc_msgSend(v24, "initWithVariableSource:parameter:isInputParameter:environment:contentAttributionTracker:widgetSizeClass:", v11, v26, v10, v19, v17, v18);

    v8 = v25;
    objc_msgSend(v25, "variables");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __57__WFSetDictionaryValueAction_runAsynchronouslyWithInput___block_invoke;
    v27[3] = &unk_24F8B75A0;
    v27[4] = self;
    v28 = v4;
    v29 = v5;
    objc_msgSend(v22, "getContentWithContext:completionHandler:", v20, v27);

    v6 = v26;
  }
  else
  {
    -[WFSetDictionaryValueAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFDictionaryValue"), objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSetDictionaryValueAction finishWithInput:key:value:](self, "finishWithInput:key:value:", v4, v5, v23);

  }
}

- (void)finishWithInput:(id)a3 key:(id)a4 value:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  _QWORD *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v9, "length"))
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v12 = *MEMORY[0x24BEC4270];
    v28[0] = *MEMORY[0x24BDD0FD8];
    WFLocalizedString(CFSTR("No Key Provided"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v13;
    v28[1] = *MEMORY[0x24BDD0FC8];
    v14 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("No key was provided to the Set Dictionary Value action for the value “%@”."));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", v15, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v16;
    v17 = (void *)MEMORY[0x24BDBCE70];
    v18 = v29;
    v19 = v28;
LABEL_6:
    objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 5, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSetDictionaryValueAction finishRunningWithError:](self, "finishRunningWithError:", v22);

    goto LABEL_7;
  }
  if (!v10)
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v12 = *MEMORY[0x24BEC4270];
    v26[0] = *MEMORY[0x24BDD0FD8];
    WFLocalizedString(CFSTR("No Value Provided"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v13;
    v26[1] = *MEMORY[0x24BDD0FC8];
    v20 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("No value was provided to the Set Dictionary Value action for the key “%@”."));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", v15, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v16;
    v17 = (void *)MEMORY[0x24BDBCE70];
    v18 = v27;
    v19 = v26;
    goto LABEL_6;
  }
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __56__WFSetDictionaryValueAction_finishWithInput_key_value___block_invoke;
  v23[3] = &unk_24F8B75C8;
  v23[4] = self;
  v24 = v10;
  v25 = v9;
  objc_msgSend(v8, "getObjectRepresentation:forClass:", v23, objc_opt_class());

LABEL_7:
}

void __56__WFSetDictionaryValueAction_finishWithInput_key_value___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  if (a4)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a4);
  }
  else
  {
    v5 = (void *)objc_msgSend(a2, "mutableCopy");
    v6 = v5;
    if (v5)
      v7 = v5;
    else
      v7 = (id)objc_opt_new();
    v10 = v7;

    objc_msgSend(v10, "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "output");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v8, "addObject:", v9);

    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
  }
}

void __57__WFSetDictionaryValueAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  v9[2] = objc_opt_class();
  v9[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__WFSetDictionaryValueAction_runAsynchronouslyWithInput___block_invoke_2;
  v6[3] = &unk_24F8BA500;
  v5 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v3, "generateCollectionByCoercingToItemClasses:completionHandler:", v4, v6);

}

void __57__WFSetDictionaryValueAction_runAsynchronouslyWithInput___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(a2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_compactMap:", &__block_literal_global_36447);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v9, "count");
  v5 = (void *)a1[4];
  v6 = a1[5];
  v7 = a1[6];
  if (v4 < 2)
  {
    objc_msgSend(v9, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finishWithInput:key:value:", v6, v7, v8);

  }
  else
  {
    objc_msgSend(v5, "finishWithInput:key:value:", v6, v7, v9);
  }

}

id __57__WFSetDictionaryValueAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "string");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v2, "dictionary");
      v3 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v4 = 0;
          goto LABEL_9;
        }
      }
      objc_msgSend(v2, "number");
      v3 = objc_claimAutoreleasedReturnValue();
    }
  }
  v4 = (void *)v3;
LABEL_9:

  return v4;
}

@end
