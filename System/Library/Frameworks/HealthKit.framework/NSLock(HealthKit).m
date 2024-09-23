@implementation NSLock(HealthKit)

- (void)hk_withLock:()HealthKit
{
  void *v5;
  void (**v6)(void);

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSLock+HealthKit.m"), 18, CFSTR("block must be non-nil."));

  }
  objc_msgSend(a1, "lock");
  v6[2]();
  objc_msgSend(a1, "unlock");

}

@end
