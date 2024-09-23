@implementation WFVibrateAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  _QWORD inCompletionBlock[5];

  inCompletionBlock[0] = MEMORY[0x24BDAC760];
  inCompletionBlock[1] = 3221225472;
  inCompletionBlock[2] = __46__WFVibrateAction_runAsynchronouslyWithInput___block_invoke;
  inCompletionBlock[3] = &unk_24F8BB638;
  inCompletionBlock[4] = self;
  AudioServicesPlaySystemSoundWithCompletion(0xFFFu, inCompletionBlock);
}

- (id)disabledOnPlatforms
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFVibrateAction;
  -[WFVibrateAction disabledOnPlatforms](&v5, sel_disabledOnPlatforms);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", *MEMORY[0x24BEC43E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __46__WFVibrateAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
}

@end
