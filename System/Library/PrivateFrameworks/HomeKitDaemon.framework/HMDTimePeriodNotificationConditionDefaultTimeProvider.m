@implementation HMDTimePeriodNotificationConditionDefaultTimeProvider

- (id)currentDate
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE60], "now");
}

@end
