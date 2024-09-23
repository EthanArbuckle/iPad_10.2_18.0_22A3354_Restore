@implementation NSString(DNDSModeAssertionInvalidationPredicateTypeHelper)

+ (const)dnds_stringForPredicateType:()DNDSModeAssertionInvalidationPredicateTypeHelper
{
  if ((unint64_t)(a3 - 1) > 2)
    return CFSTR("any");
  else
    return off_1E86A7E20[a3 - 1];
}

- (uint64_t)dnds_predicateTypeValue
{
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("any")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("date")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("client-identifier")) & 1) != 0)
    return 2;
  if (objc_msgSend(a1, "isEqualToString:", CFSTR("uuid")))
    return 3;
  return 0;
}

@end
