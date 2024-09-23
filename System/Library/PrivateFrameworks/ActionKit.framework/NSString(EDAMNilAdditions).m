@implementation NSString(EDAMNilAdditions)

- (uint64_t)enIsEqualToStringOrNil:()EDAMNilAdditions
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
    return objc_msgSend(a1, "isEqualToString:");
  else
    return objc_msgSend(a1, "length", v3, v4) == 0;
}

@end
