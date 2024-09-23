@implementation EFScheduler

void __62__EFScheduler_MessageUI____mui_nextRunLoopMainThreadScheduler__block_invoke()
{
  void *v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1E0D1F070];
  v1 = MEMORY[0x1E0C80D38];
  v2 = MEMORY[0x1E0C80D38];
  objc_msgSend(v0, "dispatchQueueSchedulerWithQueue:", v1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)__mui_nextRunLoopMainThreadScheduler_scheduler;
  __mui_nextRunLoopMainThreadScheduler_scheduler = v3;

}

@end
