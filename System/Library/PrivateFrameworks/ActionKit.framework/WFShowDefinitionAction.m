@implementation WFShowDefinitionAction

+ (id)userInterfaceProtocol
{
  return &unk_255DFD758;
}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__WFShowDefinitionAction_runWithRemoteUserInterface_input___block_invoke;
  v8[3] = &unk_24F8BA4D8;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a4, "getStringRepresentation:", v8);

}

void __59__WFShowDefinitionAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "length"))
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __59__WFShowDefinitionAction_runWithRemoteUserInterface_input___block_invoke_2;
    v15[3] = &unk_24F8BB370;
    v7 = *(void **)(a1 + 40);
    v15[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "showWithString:completionHandler:", v5, v15);
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    if (v6)
    {
      objc_msgSend(v8, "finishRunningWithError:", v6);
    }
    else
    {
      v9 = (void *)MEMORY[0x24BDD1540];
      v10 = *MEMORY[0x24BEC4270];
      v16[0] = *MEMORY[0x24BDD0FD8];
      WFLocalizedString(CFSTR("No Word Specified"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v11;
      v16[1] = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("No word was passed as input to Show Definition"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17[1] = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 6, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "finishRunningWithError:", v14);

    }
  }

}

uint64_t __59__WFShowDefinitionAction_runWithRemoteUserInterface_input___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a2);
}

@end
