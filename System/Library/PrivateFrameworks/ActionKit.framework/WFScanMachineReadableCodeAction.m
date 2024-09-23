@implementation WFScanMachineReadableCodeAction

+ (id)userInterfaceProtocol
{
  return &unk_255DFC570;
}

+ (id)userInterfaceXPCInterface
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___WFScanMachineReadableCodeAction;
  objc_msgSendSuper2(&v5, sel_userInterfaceXPCInterface);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_showWithCompletionHandler_, 0, 1);

  return v2;
}

- (id)disabledOnPlatforms
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFScanMachineReadableCodeAction;
  -[WFScanMachineReadableCodeAction disabledOnPlatforms](&v5, sel_disabledOnPlatforms);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", *MEMORY[0x24BEC43E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __68__WFScanMachineReadableCodeAction_runWithRemoteUserInterface_input___block_invoke;
  v4[3] = &unk_24F8B01E0;
  v4[4] = self;
  objc_msgSend(a3, "showWithCompletionHandler:", v4, a4);
}

void __68__WFScanMachineReadableCodeAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  if (a2)
  {
    v5 = *(void **)(a1 + 32);
    v6 = a2;
    objc_msgSend(v5, "output");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v8);

}

@end
