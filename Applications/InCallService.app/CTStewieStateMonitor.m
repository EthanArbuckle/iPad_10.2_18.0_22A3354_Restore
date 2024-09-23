@implementation CTStewieStateMonitor

- (int64_t)getStatus
{
  CTStewieStateMonitor *v2;
  id v3;

  v2 = self;
  v3 = sub_1001A7610();

  return (int64_t)v3;
}

- (BOOL)isAlertTriggerAllowedAndNotActive
{
  CTStewieStateMonitor *v2;
  char v3;
  char v4;

  v2 = self;
  sub_1001A76BC();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)isAlertActive
{
  CTStewieStateMonitor *v2;
  char v3;
  char v4;

  v2 = self;
  sub_1001A7768();
  v4 = v3;

  return v4 & 1;
}

@end
