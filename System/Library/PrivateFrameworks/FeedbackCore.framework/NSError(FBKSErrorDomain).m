@implementation NSError(FBKSErrorDomain)

- (uint64_t)isFBKErrorWithCode:()FBKSErrorDomain
{
  void *v4;
  uint64_t v5;

  if (objc_msgSend(a1, "code") != a3)
    return 0;
  objc_msgSend(a1, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE312E8]);

  return v5;
}

@end
