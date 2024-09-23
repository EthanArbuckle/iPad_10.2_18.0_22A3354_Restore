@implementation WFSetClipboardAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[objc_class generalPasteboard](getUIPasteboardClass(), "generalPasteboard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSetClipboardAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFExpirationDate"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    getUIPasteboardOptionExpirationDate();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v7, v8);

  }
  -[WFSetClipboardAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFLocalOnly"), objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    getUIPasteboardOptionLocalOnly();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v9, v10);

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  getUIPasteboardChangedNotification();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_pasteboardDidChange_, v12, v6);

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __51__WFSetClipboardAction_runAsynchronouslyWithInput___block_invoke;
  v13[3] = &unk_24F8BB050;
  v13[4] = self;
  objc_msgSend(v4, "copyToPasteboard:options:completionHandler:", v6, v5, v13);

}

- (void)finishRunningWithError:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = (void *)MEMORY[0x24BDD16D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  getUIPasteboardChangedNotification();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, v7, 0);

  v8.receiver = self;
  v8.super_class = (Class)WFSetClipboardAction;
  -[WFSetClipboardAction finishRunningWithError:](&v8, sel_finishRunningWithError_, v5);

}

- (void)pasteboardDidChange:(id)a3
{
  -[WFSetClipboardAction finishRunningWithError:](self, "finishRunningWithError:", 0);
}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE19470], "clipboardLocation", a3);
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = a5;
  if (v6)
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to copy %2$@ to the clipboard?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to copy to the clipboard?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __51__WFSetClipboardAction_runAsynchronouslyWithInput___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2)
    return objc_msgSend(*(id *)(result + 32), "finishRunningWithError:");
  return result;
}

@end
