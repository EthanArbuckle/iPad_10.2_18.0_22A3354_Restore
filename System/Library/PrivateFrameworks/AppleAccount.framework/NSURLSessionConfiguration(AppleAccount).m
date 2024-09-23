@implementation NSURLSessionConfiguration(AppleAccount)

- (void)aa_registerProtocolClass:()AppleAccount
{
  void *v5;
  void *v6;
  void *v8;
  id v9;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSURLSession+AppleAccount.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("class"));

  }
  objc_msgSend(a1, "protocolClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  if (v5)
    objc_msgSend(v5, "arrayByAddingObject:", a3);
  else
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setProtocolClasses:", v6);

}

- (void)aa_unregisterProtocolClass:()AppleAccount
{
  void *v5;
  void *v7;
  id v8;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSURLSession+AppleAccount.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("class"));

  }
  objc_msgSend(a1, "protocolClasses");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "aaf_arrayByRemovingObject:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setProtocolClasses:", v5);

}

@end
