@implementation NSString(MCMCaseInsensitive)

- (uint64_t)MCM_isEqualToString:()MCMCaseInsensitive caseSensitive:
{
  if (a4)
    return objc_msgSend(a1, "isEqualToString:");
  else
    return objc_msgSend(a1, "compare:options:", a3, 1) == 0;
}

@end
