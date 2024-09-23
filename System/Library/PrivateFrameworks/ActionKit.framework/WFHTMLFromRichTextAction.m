@implementation WFHTMLFromRichTextAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v4 = (void *)MEMORY[0x24BEC14A0];
  v5 = *MEMORY[0x24BDF83F8];
  v6 = a3;
  objc_msgSend(v4, "typeWithUTType:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[4] = self;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__WFHTMLFromRichTextAction_runAsynchronouslyWithInput___block_invoke;
  v9[3] = &unk_24F8B54C0;
  v9[4] = self;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __55__WFHTMLFromRichTextAction_runAsynchronouslyWithInput___block_invoke_2;
  v8[3] = &unk_24F8BAFA8;
  objc_msgSend(v6, "transformFirstFileRepresentationForType:usingBlock:completionHandler:", v7, v9, v8);

}

void __55__WFHTMLFromRichTextAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  void (**v8)(id, void *, id);
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  v7 = a3;
  v8 = a4;
  objc_msgSend(v17, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFMakeFullDocument"), objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if (v11)
  {
    objc_msgSend(MEMORY[0x24BE195E8], "normalizedHTMLDocumentFromHTMLData:", v9);
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v12;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "wf_stringWithData:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)MEMORY[0x24BE19590];
    objc_msgSend(v17, "wfName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "object:named:", v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v16, v7);

  }
  else
  {
    v8[2](v8, 0, v7);
  }

}

void __55__WFHTMLFromRichTextAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

@end
