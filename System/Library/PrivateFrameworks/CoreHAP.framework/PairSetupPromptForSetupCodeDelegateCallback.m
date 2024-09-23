@implementation PairSetupPromptForSetupCodeDelegateCallback

void ___PairSetupPromptForSetupCodeDelegateCallback_f_block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServer:didReceiveBadPasswordThrottleAttemptsWithDelay:", *(_QWORD *)(a1 + 32), *(int *)(a1 + 40));

}

void ___PairSetupPromptForSetupCodeDelegateCallback_f_block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServer:promptUserForPasswordWithType:", *(_QWORD *)(a1 + 32), 1);

}

@end
