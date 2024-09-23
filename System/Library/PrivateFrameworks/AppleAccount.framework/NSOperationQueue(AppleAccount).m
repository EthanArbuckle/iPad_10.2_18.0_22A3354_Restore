@implementation NSOperationQueue(AppleAccount)

+ (id)aa_operationQueueWithUnderlyingQueue:()AppleAccount
{
  id v5;
  id v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSOperationQueue+AppleAccount.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("underlyingQueue"));

  }
  v6 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  objc_msgSend(v6, "setUnderlyingQueue:", v5);

  return v6;
}

@end
