@implementation WFMarkupAction

+ (id)userInterfaceProtocol
{
  return &unk_255DFD5D0;
}

+ (id)userInterfaceXPCInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___WFMarkupAction;
  objc_msgSendSuper2(&v10, sel_userInterfaceXPCInterface);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_showWithPreviewItems_completionHandler_, 0, 0);

  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_showWithPreviewItems_completionHandler_, 0, 1);

  return v2;
}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __51__WFMarkupAction_runWithRemoteUserInterface_input___block_invoke;
  v10[3] = &unk_24F8B7680;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v7, "generateCollectionByCoercingToItemClasses:completionHandler:", v8, v10);

}

- (id)inputDictionary
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFMarkupAction;
  -[WFMarkupAction inputDictionary](&v6, sel_inputDictionary);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v4 = (void *)objc_msgSend(v3, "copy");
  return v4;
}

void __51__WFMarkupAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "numberOfItems"))
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __51__WFMarkupAction_runWithRemoteUserInterface_input___block_invoke_2;
    v10[3] = &unk_24F8BA068;
    v8 = *(id *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 32);
    v11 = v8;
    v12 = v9;
    objc_msgSend(v6, "getFileRepresentations:forType:", v10, 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v7);
  }

}

void __51__WFMarkupAction_runWithRemoteUserInterface_input___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  objc_msgSend(v3, "if_map:", &__block_literal_global_36350);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__WFMarkupAction_runWithRemoteUserInterface_input___block_invoke_4;
  v7[3] = &unk_24F8BA068;
  v5 = *(void **)(a1 + 32);
  v7[4] = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "showWithPreviewItems:completionHandler:", v4, v7);

}

void __51__WFMarkupAction_runWithRemoteUserInterface_input___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (a2)
  {
    objc_msgSend(a2, "if_map:", &__block_literal_global_164);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE19438], "collectionWithItems:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setOutput:", v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v7);

}

id __51__WFMarkupAction_runWithRemoteUserInterface_input___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BE19450];
  v3 = (void *)MEMORY[0x24BE194F8];
  objc_msgSend(a2, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileWithURL:options:", v4, 13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemWithFile:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __51__WFMarkupAction_runWithRemoteUserInterface_input___block_invoke_3(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x24BDD17B8];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithURL:", v5);
  return v6;
}

@end
