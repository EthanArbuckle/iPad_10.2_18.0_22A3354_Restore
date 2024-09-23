@implementation WFMakeImageFromRichTextAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = objc_opt_class();
  v7[4] = self;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __60__WFMakeImageFromRichTextAction_runAsynchronouslyWithInput___block_invoke;
  v8[3] = &unk_24F8B8CE0;
  v8[4] = self;
  v9 = v4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__WFMakeImageFromRichTextAction_runAsynchronouslyWithInput___block_invoke_3;
  v7[3] = &unk_24F8BAFA8;
  v6 = v4;
  objc_msgSend(v6, "transformFirstObjectRepresentationForClass:usingBlock:completionHandler:", v5, v8, v7);

}

void __60__WFMakeImageFromRichTextAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v7 = a5;
  v8 = *(void **)(a1 + 32);
  v9 = a2;
  objc_msgSend(v8, "parameterValueForKey:ofClass:", CFSTR("WFWidth"), objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFHeight"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v13 = v12;
  objc_msgSend(v11, "doubleValue");
  v15 = v14;
  v16 = (void *)MEMORY[0x24BE19680];
  objc_msgSend(*(id *)(a1 + 40), "defaultCoercionOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __60__WFMakeImageFromRichTextAction_runAsynchronouslyWithInput___block_invoke_2;
  v19[3] = &unk_24F8BADB8;
  v20 = v7;
  v18 = v7;
  objc_msgSend(v16, "getImageRepresentationForWebResource:atSize:coercionOptions:completionHandler:", v9, v17, v19, v13, v15);

}

void __60__WFMakeImageFromRichTextAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

void __60__WFMakeImageFromRichTextAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    objc_msgSend(MEMORY[0x24BE19538], "itemWithObject:named:", a2, a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v4 + 16))(v4, v5, 0);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, uint64_t))(v4 + 16))(*(_QWORD *)(a1 + 32), 0, a4);
  }
}

@end
