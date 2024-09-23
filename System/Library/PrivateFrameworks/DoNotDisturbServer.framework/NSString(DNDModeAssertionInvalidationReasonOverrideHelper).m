@implementation NSString(DNDModeAssertionInvalidationReasonOverrideHelper)

+ (const)dnds_stringForInvalidationReasonOverride:()DNDModeAssertionInvalidationReasonOverrideHelper
{
  const __CFString *v3;

  v3 = CFSTR("lifetime-expired");
  if (a3 != 1)
    v3 = 0;
  if (a3 == 2)
    return CFSTR("user-changed-state");
  else
    return v3;
}

- (uint64_t)dnds_invalidationReasonOverrideValue
{
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("lifetime-expired")) & 1) != 0)
    return 1;
  if (objc_msgSend(a1, "isEqualToString:", CFSTR("user-changed-state")))
    return 2;
  return 0;
}

@end
