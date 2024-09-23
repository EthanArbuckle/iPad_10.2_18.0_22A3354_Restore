@implementation HMMutableRestrictedGuestSchedule

- (id)copyWithZone:(_NSZone *)a3
{
  HMRestrictedGuestHomeAccessSchedule *v4;
  void *v5;
  void *v6;
  HMRestrictedGuestHomeAccessSchedule *v7;

  v4 = +[HMRestrictedGuestHomeAccessSchedule allocWithZone:](HMRestrictedGuestHomeAccessSchedule, "allocWithZone:", a3);
  -[HMRestrictedGuestHomeAccessSchedule weekDayRules](self, "weekDayRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMRestrictedGuestHomeAccessSchedule yearDayRules](self, "yearDayRules");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMRestrictedGuestHomeAccessSchedule initWithWeekDayRules:yearDayRules:](v4, "initWithWeekDayRules:yearDayRules:", v5, v6);

  return v7;
}

@end
