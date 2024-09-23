@implementation WFAlertAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[5];

  -[WFAlertAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFAlertActionTitle"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAlertAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFAlertActionMessage"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAlertAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFAlertActionCancelButtonShown"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  -[WFAlertAction supplementalParameterValueForKey:ofClass:](self, "supplementalParameterValueForKey:ofClass:", CFSTR("WFAlertActionCancelButtonTitle"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    WFLocalizedString(CFSTR("Cancel"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  -[WFAlertAction supplementalParameterValueForKey:ofClass:](self, "supplementalParameterValueForKey:ofClass:", CFSTR("WFAlertActionOKButtonTitle"), objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    WFLocalizedString(CFSTR("OK"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setTitle:", v4);
  objc_msgSend(v16, "setMessage:", v5);
  v17 = MEMORY[0x24BDAC760];
  if (v7 && objc_msgSend(v11, "length"))
  {
    v22[0] = v17;
    v22[1] = 3221225472;
    v22[2] = __44__WFAlertAction_runAsynchronouslyWithInput___block_invoke;
    v22[3] = &unk_24F8BB638;
    v22[4] = self;
    objc_msgSend(MEMORY[0x24BE19378], "buttonWithTitle:style:handler:", v11, 1, v22);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addButton:", v18);

  }
  v21[0] = v17;
  v21[1] = 3221225472;
  v21[2] = __44__WFAlertAction_runAsynchronouslyWithInput___block_invoke_2;
  v21[3] = &unk_24F8BB638;
  v21[4] = self;
  objc_msgSend(MEMORY[0x24BE19378], "buttonWithTitle:style:handler:", v15, 0, v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addButton:", v19);

  -[WFAlertAction userInterface](self, "userInterface");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "presentAlert:", v16);

}

uint64_t __44__WFAlertAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

uint64_t __44__WFAlertAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
}

@end
