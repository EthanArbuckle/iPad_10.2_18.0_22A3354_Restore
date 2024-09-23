@implementation WFGetOnScreenContentAction

- (id)disabledOnPlatforms
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFGetOnScreenContentAction;
  -[WFGetOnScreenContentAction disabledOnPlatforms](&v5, sel_disabledOnPlatforms);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", *MEMORY[0x24BEC43E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = objc_alloc_init(MEMORY[0x24BEC1568]);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __57__WFGetOnScreenContentAction_runAsynchronouslyWithInput___block_invoke;
  v5[3] = &unk_24F8BAFA8;
  v5[4] = self;
  objc_msgSend(v4, "getOnScreenContentForInputContentClasses:completionHandler:", 0, v5);

}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE19470], "onScreenContentLocation", a3);
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a5;
  WFLocalizedString(CFSTR("Allow “%1$@” to get current on screen content?"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __57__WFGetOnScreenContentAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v3, "setOutput:", a2);
    v3 = *(void **)(a1 + 32);
  }
  return objc_msgSend(v3, "finishRunningWithError:");
}

@end
