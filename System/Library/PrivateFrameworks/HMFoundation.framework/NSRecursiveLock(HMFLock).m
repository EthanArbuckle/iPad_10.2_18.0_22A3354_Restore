@implementation NSRecursiveLock(HMFLock)

- (void)performBlock:()HMFLock
{
  id v4;
  void (**v5)(void);

  v5 = a3;
  if (v5)
  {
    v4 = a1;
    objc_msgSend(v4, "lock");
    v5[2]();
    objc_msgSend(v4, "unlock");

  }
}

@end
