@implementation WFOpenWorkflowAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  -[WFOpenWorkflowAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFWorkflow"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "externalURLForViewing");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE193A0], "sharedContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x24BEC17D8];
    -[WFOpenWorkflowAction userInterface](self, "userInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __51__WFOpenWorkflowAction_runAsynchronouslyWithInput___block_invoke;
    v15[3] = &unk_24F8B7FF0;
    v15[4] = self;
    objc_msgSend(v7, "openURL:withBundleIdentifier:userInterface:completionHandler:", v6, v8, v9, v15);

  }
  else
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BEC4270];
    v16[0] = *MEMORY[0x24BDD0FD8];
    WFLocalizedString(CFSTR("Shortcut Not Found"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v12;
    v16[1] = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("Make sure a valid shortcut is selected in the Open Shortcut action."));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 5, v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFOpenWorkflowAction finishRunningWithError:](self, "finishRunningWithError:", v6);
  }

}

void __51__WFOpenWorkflowAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, char a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "wfUnsupportedUserInterfaceError");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "finishRunningWithError:", v3);

  }
}

@end
