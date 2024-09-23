@implementation WFEvernoteDeleteAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__WFEvernoteDeleteAction_runAsynchronouslyWithInput___block_invoke;
  v4[3] = &unk_24F8B59A8;
  v4[4] = self;
  v3 = a3;
  objc_msgSend(v3, "getObjectRepresentations:forClass:", v4, objc_opt_class());

}

- (id)contentDestinationWithError:(id *)a3
{
  return 0;
}

void __53__WFEvernoteDeleteAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  _QWORD v8[5];

  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __53__WFEvernoteDeleteAction_runAsynchronouslyWithInput___block_invoke_4;
    v8[3] = &unk_24F8BB050;
    v8[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "if_enumerateAsynchronously:completionHandler:", &__block_literal_global_14838, v8);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v7);
  }

}

uint64_t __53__WFEvernoteDeleteAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

void __53__WFEvernoteDeleteAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a2;
  +[WFEvernoteAccessResource evernoteSession](WFEvernoteAccessResource, "evernoteSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __53__WFEvernoteDeleteAction_runAsynchronouslyWithInput___block_invoke_3;
  v9[3] = &unk_24F8B8C28;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "deleteNote:completion:", v6, v9);

}

uint64_t __53__WFEvernoteDeleteAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
