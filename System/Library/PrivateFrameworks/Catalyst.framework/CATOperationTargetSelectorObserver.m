@implementation CATOperationTargetSelectorObserver

void __65___CATOperationTargetSelectorObserver_invokeActionWithOperation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "target");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "methodSignatureForSelector:", objc_msgSend(*(id *)(a1 + 32), "selector"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE98], "invocationWithMethodSignature:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTarget:", v5);

  objc_msgSend(v4, "setSelector:", objc_msgSend(*(id *)(a1 + 32), "selector"));
  if ((unint64_t)objc_msgSend(v3, "numberOfArguments") >= 3)
    objc_msgSend(v4, "setArgument:atIndex:", a1 + 40, 2);
  if ((unint64_t)objc_msgSend(v3, "numberOfArguments") >= 4)
  {
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setArgument:atIndex:", &v6, 3);

  }
  objc_msgSend(v4, "invoke");

}

@end
