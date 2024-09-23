@implementation BMHealthWorkout_v0

- (int)eventType
{
  unsigned int v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BMHealthWorkout_v0;
  v2 = -[BMHealthWorkout eventType](&v4, sel_eventType);
  if (v2 < 4)
    return v2 + 1;
  else
    return 0;
}

@end
