@implementation WFRichTextFromHTMLAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v6[5];

  v4 = a3;
  v5 = objc_opt_class();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__WFRichTextFromHTMLAction_runAsynchronouslyWithInput___block_invoke_2;
  v6[3] = &unk_24F8BAFA8;
  v6[4] = self;
  objc_msgSend(v4, "transformFirstObjectRepresentationForClass:usingBlock:completionHandler:", v5, &__block_literal_global_3162, v6);

}

void __55__WFRichTextFromHTMLAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

void __55__WFRichTextFromHTMLAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, _QWORD *a5)
{
  _QWORD *v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  void (*v13)(_QWORD *, _QWORD, id);
  id v14;

  v14 = a3;
  if (a2)
  {
    v8 = a5;
    v9 = a4;
    objc_msgSend(a2, "dataUsingEncoding:", 10);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF83F8]);
    v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE194F8], "fileWithData:ofType:proposedFilename:", v10, v11, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (*)(_QWORD *, void *, id))v8[2])(v8, v12, v9);

  }
  else
  {
    v13 = (void (*)(_QWORD *, _QWORD, id))a5[2];
    v11 = a5;
    v10 = a4;
    v13(v11, 0, v10);
  }

}

@end
