@implementation IMDMessageFromStorageMonitor

+ (IMDMessageFromStorageMonitor)sharedStorageMonitor
{
  if (qword_1EFC61560 != -1)
    swift_once();
  return (IMDMessageFromStorageMonitor *)(id)qword_1EFC63370;
}

- (IMDMessageFromStorageMonitor)init
{
  return (IMDMessageFromStorageMonitor *)sub_1D1641D18();
}

- (void)incomingMessageProcessedWithElapsedTime:(double)a3
{
  IMDMessageFromStorageMonitor *v4;

  v4 = self;
  sub_1D1641E50(a3);

}

- (void)showTapToRadarOnSlowDelivery
{
  IMDMessageFromStorageMonitor *v2;

  v2 = self;
  sub_1D1642240();

}

@end
