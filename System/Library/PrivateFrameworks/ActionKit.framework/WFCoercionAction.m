@implementation WFCoercionAction

- (Class)coercionItemClass
{
  void *v4;
  NSString *v5;
  Class v6;
  objc_class *v7;
  void *v9;

  -[WFCoercionAction definition](self, "definition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("CoercionItemClass"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  v6 = NSClassFromString(v5);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCoercionAction.m"), 21, CFSTR("The coercion item class must exist"));

  }
  v7 = v6;

  return v7;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  v5 = -[WFCoercionAction coercionItemClass](self, "coercionItemClass");
  objc_msgSend(v4, "defaultCoercionOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__WFCoercionAction_runAsynchronouslyWithInput___block_invoke;
  v7[3] = &unk_24F8BA0E8;
  v7[4] = self;
  objc_msgSend(v4, "generateCollectionByCoercingToItemClass:options:completionHandler:", v5, v6, v7);

}

- (id)outputContentClasses
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = -[WFCoercionAction coercionItemClass](self, "coercionItemClass");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __47__WFCoercionAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  id *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  v6 = a4;
  if (objc_msgSend(v13, "numberOfItems"))
    goto LABEL_2;
  objc_msgSend(v6, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BE19770]))
  {

    goto LABEL_7;
  }
  v12 = objc_msgSend(v6, "code");

  if (v12)
  {
LABEL_7:
    v8 = (id *)(a1 + 32);
    v10 = v6;
    goto LABEL_8;
  }
LABEL_2:
  v7 = (void *)objc_msgSend(v13, "copy");
  v9 = *(void **)(a1 + 32);
  v8 = (id *)(a1 + 32);
  objc_msgSend(v9, "setOutput:", v7);

  v10 = 0;
LABEL_8:
  objc_msgSend(*v8, "finishRunningWithError:", v10);

}

@end
