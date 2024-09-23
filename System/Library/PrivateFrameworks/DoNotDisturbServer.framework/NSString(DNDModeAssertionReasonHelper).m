@implementation NSString(DNDModeAssertionReasonHelper)

+ (__CFString)dnds_stringForAssertionReason:()DNDModeAssertionReasonHelper
{
  if ((unint64_t)(a3 - 1) > 2)
    return 0;
  else
    return off_1E86A7DC8[a3 - 1];
}

- (uint64_t)dnds_assertionReasonValue
{
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("user-action")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("system-state")) & 1) != 0)
    return 3;
  if (objc_msgSend(a1, "isEqualToString:", CFSTR("schedule")))
    return 2;
  return 0;
}

@end
