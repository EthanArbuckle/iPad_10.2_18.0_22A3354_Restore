@implementation NSString(DNDModeAssertionScheduleLifetimeBehaviorHelper)

+ (const)dnds_stringForScheduleLifetimeBehavior:()DNDModeAssertionScheduleLifetimeBehaviorHelper
{
  if (a3)
    return CFSTR("expire-on-end");
  else
    return CFSTR("match-schedule");
}

- (uint64_t)dnds_scheduleLifetimeBehaviorValue
{
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("match-schedule")) & 1) != 0)
    return 0;
  else
    return objc_msgSend(a1, "isEqualToString:", CFSTR("expire-on-end"));
}

@end
