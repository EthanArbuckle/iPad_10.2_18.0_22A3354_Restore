@implementation WFExpandURLAction

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
  v6[2] = __48__WFExpandURLAction_runAsynchronouslyWithInput___block_invoke_3;
  v6[3] = &unk_24F8BAFA8;
  v6[4] = self;
  objc_msgSend(v4, "transformObjectRepresentationsForClass:usingBlock:completionHandler:", v5, &__block_literal_global_3274, v6);

}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  -[WFExpandURLAction input](self, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  v6 = v4;
  WFGetContentLocationFromURLActionInput();

}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  v10 = objc_msgSend(v7, "length");
  v11 = (void *)MEMORY[0x24BDD17C8];
  if (v10)
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to open “%2$@” with %3$@?"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringWithFormat:", v12, v8, v9, v7);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to open “%2$@”?"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringWithFormat:", v12, v8, v9, v15);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __64__WFExpandURLAction_getContentDestinationWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 32), a2, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE19390], "webpagesLocation");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, 0);

  }
}

void __48__WFExpandURLAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

void __48__WFExpandURLAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a5;
  v7 = (void *)MEMORY[0x24BEC4118];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__WFExpandURLAction_runAsynchronouslyWithInput___block_invoke_2;
  v9[3] = &unk_24F8B2F50;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "expandURL:completionHandler:", a2, v9);

}

uint64_t __48__WFExpandURLAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
