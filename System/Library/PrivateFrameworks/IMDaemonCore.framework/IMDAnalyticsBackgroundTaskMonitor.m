@implementation IMDAnalyticsBackgroundTaskMonitor

+ (id)sharedInstance
{
  if (qword_1ED935C08 != -1)
    swift_once();
  return (id)qword_1ED935BF8;
}

- (IMDAnalyticsBackgroundTaskMonitor)init
{
  return (IMDAnalyticsBackgroundTaskMonitor *)sub_1D1623008();
}

@end
