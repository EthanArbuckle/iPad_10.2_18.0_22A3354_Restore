@implementation BMClockAlarm_v1

- (int)eventType
{
  unsigned int v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BMClockAlarm_v1;
  v2 = -[BMClockAlarm eventType](&v4, sel_eventType);
  if (v2 < 6)
    return v2 + 1;
  else
    return 0;
}

- (int)lastEventType
{
  unsigned int v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BMClockAlarm_v1;
  v2 = -[BMClockAlarm lastEventType](&v4, sel_lastEventType);
  if (v2 < 0xB)
    return v2 + 1;
  else
    return 0;
}

@end
