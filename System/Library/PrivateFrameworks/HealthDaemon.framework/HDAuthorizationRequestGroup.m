@implementation HDAuthorizationRequestGroup

void __72___HDAuthorizationRequestGroup_promptIfNecessaryWithTimeout_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1BCCACAC4]();
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Authorization session timed out"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  objc_autoreleasePoolPop(v2);
}

@end
