@implementation WFContentAttributionSetDebuggerAction

- (WFContentAttributionSetDebuggerAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
{
  id v8;
  id v9;
  id v10;
  WFContentAttributionSetDebuggerAction *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (VCIsInternalBuild())
  {
    v13.receiver = self;
    v13.super_class = (Class)WFContentAttributionSetDebuggerAction;
    self = -[WFContentAttributionSetDebuggerAction initWithIdentifier:definition:serializedParameters:](&v13, sel_initWithIdentifier_definition_serializedParameters_, v8, v9, v10);
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __74__WFContentAttributionSetDebuggerAction_runWithRemoteUserInterface_input___block_invoke;
  v4[3] = &unk_24F8BB370;
  v4[4] = self;
  objc_msgSend(a3, "showWithInput:completionHandler:", a4, v4);
}

uint64_t __74__WFContentAttributionSetDebuggerAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a2);
}

+ (id)userInterfaceProtocol
{
  return &unk_255DFCF48;
}

@end
