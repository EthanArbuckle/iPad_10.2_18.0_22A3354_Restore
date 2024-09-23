@implementation HMMutableWeekDayScheduleRule

- (id)copyWithZone:(_NSZone *)a3
{
  HMWeekDayScheduleRule *v4;
  void *v5;
  void *v6;
  HMWeekDayScheduleRule *v7;

  v4 = +[HMWeekDayScheduleRule allocWithZone:](HMWeekDayScheduleRule, "allocWithZone:", a3);
  -[HMWeekDayScheduleRule startTime](self, "startTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMWeekDayScheduleRule endTime](self, "endTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMWeekDayScheduleRule initWithStartTime:endTime:daysOfTheWeek:](v4, "initWithStartTime:endTime:daysOfTheWeek:", v5, v6, -[HMWeekDayScheduleRule daysOfTheWeek](self, "daysOfTheWeek"));

  return v7;
}

@end
