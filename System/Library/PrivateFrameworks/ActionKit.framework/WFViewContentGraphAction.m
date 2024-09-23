@implementation WFViewContentGraphAction

+ (id)userInterfaceProtocol
{
  return &unk_255DFDB38;
}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __61__WFViewContentGraphAction_runWithRemoteUserInterface_input___block_invoke;
  v4[3] = &unk_24F8BB370;
  v4[4] = self;
  objc_msgSend(a3, "showWithContentItems:completionHandler:", a4, v4);
}

uint64_t __61__WFViewContentGraphAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a2);
}

@end
