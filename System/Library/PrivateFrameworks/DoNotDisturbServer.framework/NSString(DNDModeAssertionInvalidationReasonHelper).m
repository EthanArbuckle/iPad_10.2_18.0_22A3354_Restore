@implementation NSString(DNDModeAssertionInvalidationReasonHelper)

+ (__CFString)dnds_stringForInvalidationReason:()DNDModeAssertionInvalidationReasonHelper
{
  if ((unint64_t)(a3 - 1) > 7)
    return 0;
  else
    return off_1E86A7DE0[a3 - 1];
}

- (uint64_t)dnds_invalidationReasonValue
{
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("lifetime-expired")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("user-changed-state")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("client-ended")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("client-replaced")) & 1) != 0)
    return 4;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("server-unresponsive")) & 1) != 0)
    return 5;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("client-unresponsive")) & 1) != 0)
    return 6;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("location-lifetime-expired")) & 1) != 0)
    return 7;
  if (objc_msgSend(a1, "isEqualToString:", CFSTR("calendar-event-lifetime-expired")))
    return 8;
  return 0;
}

@end
