@implementation CLFAppAvailabilityObserver

void __76___CLFAppAvailabilityObserver_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1)
{
  void (**v1)(void);

  objc_msgSend(*(id *)(a1 + 32), "handler");
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v1[2]();

}

@end
