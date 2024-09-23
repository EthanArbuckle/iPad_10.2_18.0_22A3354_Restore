@implementation WFClearUpNextAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  WFMediaPlaybackController *v4;
  _QWORD v5[5];

  v4 = objc_alloc_init(WFMediaPlaybackController);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __50__WFClearUpNextAction_runAsynchronouslyWithInput___block_invoke;
  v5[3] = &unk_24F8BB370;
  v5[4] = self;
  -[WFMediaPlaybackController clearQueueWithCompletion:](v4, "clearQueueWithCompletion:", v5);

}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE19390], "locationWithSystemAppBundleIdentifier:promptingBehaviour:", *MEMORY[0x24BEC1708], 2);
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a5;
  WFLocalizedString(CFSTR("Allow “%1$@” to clear all the music in your Playing Next queue?"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __50__WFClearUpNextAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a2);
}

@end
