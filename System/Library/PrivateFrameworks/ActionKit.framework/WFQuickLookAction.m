@implementation WFQuickLookAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  _QWORD v11[5];

  v4 = a3;
  if (objc_msgSend(v4, "numberOfItems"))
  {
    v10.receiver = self;
    v10.super_class = (Class)WFQuickLookAction;
    -[WFQuickLookAction runAsynchronouslyWithInput:](&v10, sel_runAsynchronouslyWithInput_, v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE19370], "alertWithPreferredStyle:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    WFLocalizedString(CFSTR("No Items"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:", v6);

    WFLocalizedString(CFSTR("The Quick Look action wasn't passed any items to preview."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMessage:", v7);

    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __48__WFQuickLookAction_runAsynchronouslyWithInput___block_invoke;
    v11[3] = &unk_24F8BB638;
    v11[4] = self;
    objc_msgSend(MEMORY[0x24BE19378], "okButtonWithHandler:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addButton:", v8);

    -[WFQuickLookAction userInterface](self, "userInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "presentAlert:", v5);

  }
}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[WFQuickLookAction input](self, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__WFQuickLookAction_getContentDestinationWithCompletionHandler___block_invoke;
  v7[3] = &unk_24F8B9110;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getFileRepresentations:forType:", v7, 0);

}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];

  v6 = a4;
  v7 = a3;
  -[WFQuickLookAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFQuickLookActionFullScreen"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  objc_msgSend(MEMORY[0x24BDD1618], "wf_securelyArchivedDataWithRootObject:deletionResponsibility:", v6, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __54__WFQuickLookAction_runWithRemoteUserInterface_input___block_invoke;
  v11[3] = &unk_24F8BB370;
  v11[4] = self;
  objc_msgSend(v7, "showWithItems:fullScreen:completionHandler:", v10, v9, v11);

}

uint64_t __54__WFQuickLookAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a2);
}

void __64__WFQuickLookAction_getContentDestinationWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void (*v6)(void);
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a2;
  v10 = v5;
  if (a3)
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_8:
    v6();
    goto LABEL_9;
  }
  if (!objc_msgSend(v5, "count"))
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_8;
  }
  objc_msgSend(v10, "if_firstObjectPassingTest:", &__block_literal_global_34033);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(a1 + 32);
  if (!v7)
  {
    v6 = *(void (**)(void))(v8 + 16);
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BE19470], "webpagesLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v9, 0);

LABEL_9:
}

uint64_t __64__WFQuickLookAction_getContentDestinationWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "fileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("webloc"));

  return v4;
}

uint64_t __48__WFQuickLookAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
}

+ (id)userInterfaceProtocol
{
  return &unk_255DFD3A8;
}

@end
