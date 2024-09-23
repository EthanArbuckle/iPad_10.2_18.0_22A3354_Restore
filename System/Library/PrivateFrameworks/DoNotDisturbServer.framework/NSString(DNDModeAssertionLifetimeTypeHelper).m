@implementation NSString(DNDModeAssertionLifetimeTypeHelper)

+ (__CFString)dnds_stringForLifetimeType:()DNDModeAssertionLifetimeTypeHelper
{
  if ((unint64_t)(a3 - 1) > 4)
    return 0;
  else
    return off_1E86A73A0[a3 - 1];
}

- (uint64_t)dnds_lifetimeTypeValue
{
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("calendar")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("date-interval")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("current-location")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("schedule")) & 1) != 0)
    return 4;
  if (objc_msgSend(a1, "isEqualToString:", CFSTR("explicit-region")))
    return 5;
  return 0;
}

@end
