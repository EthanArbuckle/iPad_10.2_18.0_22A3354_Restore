@implementation EDDefaultSendLaterUpdateControllerAlarmDateProvider

- (NSDate)nextDate
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("EDSendLaterUpdateControllerNextAlarmDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setNextDate:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("EDSendLaterUpdateControllerNextAlarmDate"));

}

@end
