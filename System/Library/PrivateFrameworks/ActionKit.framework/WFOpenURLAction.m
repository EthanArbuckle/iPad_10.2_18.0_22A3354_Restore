@implementation WFOpenURLAction

- (BOOL)requiresRemoteExecution
{
  return 0;
}

- (id)contentDestinationWithError:(id *)a3
{
  return 0;
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
  objc_super v19;
  _QWORD v20[4];
  id v21;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v12, "wf_slotName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("urls"));

  if (v18)
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __77__WFOpenURLAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke;
    v20[3] = &unk_24F8B7C28;
    v21 = v16;
    objc_msgSend(v15, "getObjectRepresentations:forClass:", v20, objc_opt_class());

  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)WFOpenURLAction;
    -[WFHandleIntentAction resolveSlot:withProcessedValue:parameter:input:completion:](&v19, sel_resolveSlot_withProcessedValue_parameter_input_completion_, v12, v13, v14, v15, v16);
  }

}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__WFOpenURLAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_24F8B5280;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v5, "getObjectRepresentations:forClass:", v6, objc_opt_class());

}

- (void)openURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v6 = a4;
  v7 = (void *)MEMORY[0x24BEC4238];
  v8 = a3;
  -[WFOpenURLAction userInterface](self, "userInterface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __45__WFOpenURLAction_openURL_completionHandler___block_invoke;
  v19[3] = &unk_24F8B52A8;
  v20 = v6;
  v14 = v10;
  v15 = 3221225472;
  v16 = __45__WFOpenURLAction_openURL_completionHandler___block_invoke_2;
  v17 = &unk_24F8B8C28;
  v18 = v20;
  v11 = v20;
  objc_msgSend(v7, "requestWithURL:scheme:userInterface:bundleIdentifier:successHandler:failureHandler:", v8, 0, v9, 0, v19, &v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEC39F8], "sharedManager", v14, v15, v16, v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "performRequest:", v12);

}

- (BOOL)populatesInputFromInputParameter
{
  return 1;
}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFOpenURLAction input](self, "input");
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

- (BOOL)allowsAnyURLDestinationWhenAddedToWorkflowByUser
{
  return 1;
}

uint64_t __45__WFOpenURLAction_openURL_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __45__WFOpenURLAction_openURL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!v3)
  {
    v4 = (void *)MEMORY[0x24BDD1540];
    v5 = *MEMORY[0x24BDD1308];
    v8 = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("The URL could not be opened."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, -1002, v7);
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __46__WFOpenURLAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[4];
  uint64_t v20;
  objc_super v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = v6;
  if (a4)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a4);
  }
  else
  {
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v7, "count") > 1
        || (objc_msgSend(v8, "scheme"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("data")),
            v9,
            v10))
      {
        v11 = *(_QWORD *)(a1 + 40);
        v21.receiver = *(id *)(a1 + 32);
        v21.super_class = (Class)WFOpenURLAction;
        objc_msgSendSuper2(&v21, sel_runAsynchronouslyWithInput_, v11);
      }
      else
      {
        v19[0] = MEMORY[0x24BDAC760];
        v19[1] = 3221225472;
        v19[2] = __46__WFOpenURLAction_runAsynchronouslyWithInput___block_invoke_2;
        v19[3] = &unk_24F8B5258;
        v20 = *(_QWORD *)(a1 + 32);
        v18[0] = MEMORY[0x24BDAC760];
        v18[1] = 3221225472;
        v18[2] = __46__WFOpenURLAction_runAsynchronouslyWithInput___block_invoke_4;
        v18[3] = &unk_24F8BB050;
        v18[4] = v20;
        objc_msgSend(v7, "if_enumerateAsynchronouslyInSequence:completionHandler:", v19, v18);
      }
    }
    else
    {
      v12 = *(void **)(a1 + 32);
      v13 = (void *)MEMORY[0x24BDD1540];
      v14 = *MEMORY[0x24BEC4270];
      v22[0] = *MEMORY[0x24BDD0FD8];
      WFLocalizedString(CFSTR("No URL Specified"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v8;
      v22[1] = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("Make sure to pass a valid URL to the Open URL action."));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = v15;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 6, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "finishRunningWithError:", v17);

    }
  }

}

void __46__WFOpenURLAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v7 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__WFOpenURLAction_runAsynchronouslyWithInput___block_invoke_3;
  v9[3] = &unk_24F8B8C28;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "openURL:completionHandler:", a2, v9);

}

uint64_t __46__WFOpenURLAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

uint64_t __46__WFOpenURLAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __77__WFOpenURLAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
