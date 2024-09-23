@implementation WFPhoneNumberAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];

  -[WFPhoneNumberAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFPhoneNumber"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_opt_class();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __50__WFPhoneNumberAction_runAsynchronouslyWithInput___block_invoke;
    v7[3] = &unk_24F8BA0E8;
    v7[4] = self;
    objc_msgSend(v5, "generateCollectionByCoercingToItemClass:completionHandler:", v6, v7);
  }
  else
  {
    -[WFPhoneNumberAction finishRunningWithError:](self, "finishRunningWithError:", 0);
  }

}

void __50__WFPhoneNumberAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  id v7;

  v6 = *(void **)(a1 + 32);
  v7 = a4;
  objc_msgSend(v6, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v7);

}

@end
