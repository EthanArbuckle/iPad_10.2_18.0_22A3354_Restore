@implementation DSUsageLogLine

- (int)usageTime
{
  return -[DSLogLine integerFromFieldAtIndex:](self, "integerFromFieldAtIndex:", 2);
}

- (int)standbyTime
{
  return -[DSLogLine integerFromFieldAtIndex:](self, "integerFromFieldAtIndex:", 3);
}

- (int)batteryLevel
{
  return -[DSLogLine integerFromFieldAtIndex:](self, "integerFromFieldAtIndex:", 4);
}

- (BOOL)isReset
{
  void *v2;
  char v3;

  -[DSUsageLogLine eventType](self, "eventType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("1"));

  return v3;
}

- (BOOL)isOnPower
{
  void *v2;
  char v3;

  -[DSUsageLogLine eventType](self, "eventType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("2"));

  return v3;
}

- (BOOL)isOffPower
{
  void *v2;
  char v3;

  -[DSUsageLogLine eventType](self, "eventType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("3"));

  return v3;
}

@end
