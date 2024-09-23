@implementation WFGetWebPageAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v6[5];

  v4 = a3;
  v5 = objc_opt_class();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__WFGetWebPageAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_24F8BA0E8;
  v6[4] = self;
  objc_msgSend(v4, "generateCollectionByCoercingToItemClass:completionHandler:", v5, v6);

}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFGetWebPageAction input](self, "input");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  WFGetContentLocationFromURLActionInput();

}

void __49__WFGetWebPageAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  uint64_t v7;
  _QWORD v8[5];

  v6 = a2;
  if (v6)
  {
    v7 = objc_opt_class();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __49__WFGetWebPageAction_runAsynchronouslyWithInput___block_invoke_2;
    v8[3] = &unk_24F8BA0E8;
    v8[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "generateCollectionByCoercingToItemClass:completionHandler:", v7, v8);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a4);
  }

}

void __49__WFGetWebPageAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v6;
  id v7;

  v7 = a4;
  v6 = (void *)objc_msgSend(a2, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setOutput:", v6);

  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v7);
}

@end
