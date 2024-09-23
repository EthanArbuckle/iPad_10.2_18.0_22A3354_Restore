@implementation WFOpenXCallbackURLAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__WFOpenXCallbackURLAction_runAsynchronouslyWithInput___block_invoke;
  v4[3] = &unk_24F8B81B0;
  v4[4] = self;
  v3 = a3;
  objc_msgSend(v3, "getObjectRepresentation:forClass:", v4, objc_opt_class());

}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFOpenXCallbackURLAction input](self, "input");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  WFGetContentLocationFromURLActionInput();

}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v7 = a3;
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = a5;
  v10 = a4;
  if (v7)
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to send %2$@ to “%3$@”?"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v7, v10);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to open “%2$@”?"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v10, v14);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __55__WFOpenXCallbackURLAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  _QWORD v36[4];
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a4);
    goto LABEL_17;
  }
  objc_msgSend(v6, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lowercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEC39F0], "sharedRegistry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appWithURLScheme:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "schemes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectMatchingKey:value:", CFSTR("scheme"), v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFXCallbackCustomCallbackEnabled"), objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  if (v15)
  {
    v16 = (void *)objc_opt_new();
    objc_msgSend(v16, "setObject:forKey:", v9, *MEMORY[0x24BEC39D8]);
    v41[0] = *MEMORY[0x24BEC39C8];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v17, *MEMORY[0x24BEC39C0]);

    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFXCallbackCustomSuccessKey"), objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFXCallbackCustomCancelKey"), objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFXCallbackCustomErrorKey"), objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "length"))
      objc_msgSend(v16, "setObject:forKey:", v18, *MEMORY[0x24BEC39B8]);
    if (objc_msgSend(v19, "length"))
      objc_msgSend(v16, "setObject:forKey:", v19, *MEMORY[0x24BEC39A8]);
    if (objc_msgSend(v20, "length"))
      objc_msgSend(v16, "setObject:forKey:", v20, *MEMORY[0x24BEC39B0]);
    v21 = objc_msgSend(objc_alloc(MEMORY[0x24BEC3A00]), "initWithDefinition:app:", v16, v11);

    goto LABEL_13;
  }
  if ((objc_msgSend(v13, "isCallbackScheme") & 1) == 0)
  {
    v22 = *MEMORY[0x24BEC39D8];
    v40[0] = v9;
    v23 = *MEMORY[0x24BEC39C0];
    v39[0] = v22;
    v39[1] = v23;
    v38 = *MEMORY[0x24BEC39D0];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v38, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v24;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend(objc_alloc(MEMORY[0x24BEC3A00]), "initWithDefinition:app:", v16, v11);
    v18 = v13;
LABEL_13:

    v13 = (void *)v21;
  }
  v25 = (void *)MEMORY[0x24BEC4238];
  objc_msgSend(*(id *)(a1 + 32), "userInterface");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __55__WFOpenXCallbackURLAction_runAsynchronouslyWithInput___block_invoke_2;
  v36[3] = &unk_24F8BA540;
  v37 = *(_QWORD *)(a1 + 32);
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __55__WFOpenXCallbackURLAction_runAsynchronouslyWithInput___block_invoke_3;
  v35[3] = &unk_24F8BB370;
  v35[4] = v37;
  objc_msgSend(v25, "requestWithURL:scheme:userInterface:bundleIdentifier:successHandler:failureHandler:", v7, v13, v26, 0, v36, v35);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFXCallbackCustomSuccessURLEnabled"), objc_opt_class());
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "BOOLValue");

  if (v29)
  {
    v30 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFXCallbackCustomSuccessURL"), objc_opt_class());
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "URLWithString:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "query");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setSuccessURLQueryString:", v33);

  }
  objc_msgSend(MEMORY[0x24BEC39F8], "sharedManager");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "performRequest:", v27);

LABEL_17:
}

void __55__WFOpenXCallbackURLAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a2;
  v11 = v5;
  if (!a3)
  {
    if ((unint64_t)objc_msgSend(v5, "count") < 2)
    {
      if (objc_msgSend(v11, "count") != 1)
      {
LABEL_8:
        objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
        goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "output");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "allValues");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v10);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "output");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v11);
    }

    goto LABEL_8;
  }
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "finishRunningWithError:", v7);

LABEL_9:
}

uint64_t __55__WFOpenXCallbackURLAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a2);
}

@end
