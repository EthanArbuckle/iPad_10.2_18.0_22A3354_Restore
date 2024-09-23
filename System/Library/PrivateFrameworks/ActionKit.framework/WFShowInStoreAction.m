@implementation WFShowInStoreAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__WFShowInStoreAction_runAsynchronouslyWithInput___block_invoke;
  v4[3] = &unk_24F8BB6D8;
  v4[4] = self;
  v3 = a3;
  objc_msgSend(v3, "getObjectRepresentation:forClass:", v4, objc_opt_class());

}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE19390], "locationWithSystemAppBundleIdentifier:", *MEMORY[0x24BEC1698]);
}

void __50__WFShowInStoreAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v6 = a2;
  v7 = a4;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BE193A0], "sharedContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "userInterface");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __50__WFShowInStoreAction_runAsynchronouslyWithInput___block_invoke_2;
    v12[3] = &unk_24F8B7FF0;
    v12[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v9, "openURL:userInterface:completionHandler:", v10, v11, v12);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v7);
  }

}

uint64_t __50__WFShowInStoreAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

@end
