@implementation AMSFetchAccountsWithAccountTypeIdentifier

AMSMutablePromise *__AMSFetchAccountsWithAccountTypeIdentifier_block_invoke(uint64_t a1, void *a2)
{
  return AMSFetchAccountsWithAccountType(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40));
}

@end
