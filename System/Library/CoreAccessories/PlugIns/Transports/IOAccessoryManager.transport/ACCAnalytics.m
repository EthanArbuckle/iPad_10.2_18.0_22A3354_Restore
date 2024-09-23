@implementation ACCAnalytics

+ (id)loggerForUser:(int)a3
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___ACCAnalytics;
  objc_msgSendSuper2(&v4, sel_loggerForUser_, *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)logACCAnalyticsForEventNamed:(id)a3 withAttributes:(id)a4
{
  if (a4)
    -[ACCAnalyticsLogger logEventNamed:withAttributes:](self, "logEventNamed:withAttributes:", a3);
}

@end
