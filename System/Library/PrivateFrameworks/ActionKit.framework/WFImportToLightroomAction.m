@implementation WFImportToLightroomAction

- (id)generatedIntentWithIdentifier:(id)a3 input:(id)a4 processedParameters:(id)a5 error:(id *)a6
{
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFImportToLightroomAction;
  -[WFHandleCustomIntentAction generatedIntentWithIdentifier:input:processedParameters:error:](&v8, sel_generatedIntentWithIdentifier_input_processedParameters_error_, a3, a4, a5, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setShouldForwardToAppOnSuccess:", 1);
  return v6;
}

- (void)initializeParameters
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFImportToLightroomAction;
  -[WFHandleCustomIntentAction initializeParameters](&v4, sel_initializeParameters);
  -[WFImportToLightroomAction parameterForKey:](self, "parameterForKey:", CFSTR("preset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAction:", self);

}

- (void)resolveSlot:(id)a3 withProcessedValue:(id)a4 parameter:(id)a5 input:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  objc_super v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];

  v32[3] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v12, "wf_slotName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("fileURLs"));

  if (v18)
  {
    v32[0] = objc_opt_class();
    v32[1] = objc_opt_class();
    v32[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __87__WFImportToLightroomAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke;
    v30[3] = &unk_24F8B7658;
    v31 = v16;
    objc_msgSend(v15, "generateCollectionByCoercingToItemClasses:completionHandler:", v19, v30);

  }
  else
  {
    objc_msgSend(v12, "wf_slotName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("preset"));

    if (v21)
    {
      v22 = v13;
      objc_msgSend(v22, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
        +[WFLightroomPresetPickerParameter presetsByGroup](WFLightroomPresetPickerParameter, "presetsByGroup");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFImportToLightroomAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("presetGroup"), objc_opt_class());
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKeyedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "displayString");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectMatchingKey:value:", CFSTR("displayString"), v26);
        v27 = objc_claimAutoreleasedReturnValue();

        v22 = (id)v27;
      }
      (*((void (**)(id, id, _QWORD))v16 + 2))(v16, v22, 0);

    }
    else
    {
      v29.receiver = self;
      v29.super_class = (Class)WFImportToLightroomAction;
      -[WFHandleIntentAction resolveSlot:withProcessedValue:parameter:input:completion:](&v29, sel_resolveSlot_withProcessedValue_parameter_input_completion_, v12, v13, v14, v15, v16);
    }
  }

}

- (BOOL)populatesInputFromInputParameter
{
  return 1;
}

- (id)contentDestinationWithError:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BE19390];
  -[WFHandleIntentAction appDescriptor](self, "appDescriptor", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationWithAppDescriptor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __87__WFImportToLightroomAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  v6 = a4;
  if (objc_msgSend(v8, "numberOfItems"))
  {
    objc_msgSend(v8, "items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "if_mapAsynchronously:completionHandler:", &__block_literal_global_15413, *(_QWORD *)(a1 + 32));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __87__WFImportToLightroomAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v5, "supportedTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v18 = v6;
    v10 = *(_QWORD *)v22;
    v11 = *MEMORY[0x24BDF8550];
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", v11, v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "conformsToType:", v14);

        if (v15)
        {
          v16 = v13;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v9)
        continue;
      break;
    }
    v16 = 0;
LABEL_11:
    v6 = v18;
  }
  else
  {
    v16 = 0;
  }

  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __87__WFImportToLightroomAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke_3;
  v19[3] = &unk_24F8BA110;
  v20 = v6;
  v17 = v6;
  objc_msgSend(v5, "getFileRepresentation:forType:", v19, v16);

}

void __87__WFImportToLightroomAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "fileURL");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

@end
