@implementation NSMethodSignature(GKAdditions)

- (BOOL)_gkTakesBlockAtIndex:()GKAdditions
{
  return objc_msgSend(a1, "numberOfArguments") > a3
      && strncmp((const char *)objc_msgSend(a1, "getArgumentTypeAtIndex:", a3), "@?", 2uLL) == 0;
}

- (uint64_t)_gkHasReplyBlock
{
  return objc_msgSend(a1, "_gkTakesBlockAtIndex:", objc_msgSend(a1, "numberOfArguments") - 1);
}

@end
