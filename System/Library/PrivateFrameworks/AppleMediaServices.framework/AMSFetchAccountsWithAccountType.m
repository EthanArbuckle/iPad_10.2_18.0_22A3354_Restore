@implementation AMSFetchAccountsWithAccountType

void __AMSFetchAccountsWithAccountType_block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  objc_class *v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v7 = a3;
  v5 = (void *)objc_msgSend(a2, "copy");
  objc_msgSend(v4, "finishWithResult:error:", v5, v7);

  v6 = (objc_class *)objc_opt_class();
  AMSCheckErrorForUnitTestAccess(v6, v7);

}

@end
