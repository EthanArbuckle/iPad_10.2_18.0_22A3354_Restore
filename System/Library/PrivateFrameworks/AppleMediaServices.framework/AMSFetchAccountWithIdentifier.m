@implementation AMSFetchAccountWithIdentifier

void __AMSFetchAccountWithIdentifier_block_invoke(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  id v11;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v11 = (id)v5;
  if (a2 | v5)
  {
    v9 = (void *)objc_msgSend((id)a2, "copy");
    objc_msgSend(v6, "finishWithResult:error:", v9, v11);

    v10 = (objc_class *)objc_opt_class();
    AMSCheckErrorForUnitTestAccess(v10, v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ACAccountStore+AMS: No account was found for identifier %@. No error returned either"), *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    AMSError(7, v7, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishWithError:", v8);

  }
}

@end
