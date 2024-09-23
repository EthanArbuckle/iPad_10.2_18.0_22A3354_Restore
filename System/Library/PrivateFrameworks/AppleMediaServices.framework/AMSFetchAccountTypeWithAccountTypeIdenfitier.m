@implementation AMSFetchAccountTypeWithAccountTypeIdenfitier

void __AMSFetchAccountTypeWithAccountTypeIdenfitier_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  objc_class *v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v4, "finishWithResult:error:", a2, v6);
  v5 = (objc_class *)objc_opt_class();
  AMSCheckErrorForUnitTestAccess(v5, v6);

}

@end
