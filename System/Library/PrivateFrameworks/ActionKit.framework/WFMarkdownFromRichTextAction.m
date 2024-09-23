@implementation WFMarkdownFromRichTextAction

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

  v4 = (void *)MEMORY[0x24BEC14A0];
  v5 = *MEMORY[0x24BDF83F8];
  v6 = a3;
  objc_msgSend(v4, "typeWithUTType:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__WFMarkdownFromRichTextAction_runAsynchronouslyWithInput___block_invoke_2;
  v8[3] = &unk_24F8BAFA8;
  v8[4] = self;
  objc_msgSend(v6, "transformFirstFileRepresentationForType:usingBlock:completionHandler:", v7, &__block_literal_global_46471, v8);

}

uint64_t __59__WFMarkdownFromRichTextAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setOutput:", a2);
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
}

void __59__WFMarkdownFromRichTextAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, _QWORD *a4)
{
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void (*v15)(void);
  id v16;

  v16 = a2;
  if (v16)
  {
    v5 = a4;
    objc_msgSend(v16, "data");
    v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "wf_stringWithData:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x24BE19528]);
    objc_msgSend(v16, "originalURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithBaseURL:", v9);

    v11 = (void *)MEMORY[0x24BE19450];
    objc_msgSend(v10, "handleHTML:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "wfName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "itemWithObject:named:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (*)(_QWORD *, void *, _QWORD))v5[2])(v5, v14, 0);
  }
  else
  {
    v15 = (void (*)(void))a4[2];
    v6 = a4;
    v15();
  }

}

@end
