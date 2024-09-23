@implementation ATXScreenLockStateDuetDataProvider

+ (Class)supportedDuetEventClass
{
  return (Class)objc_opt_class();
}

+ (int64_t)supportedCoreDuetStream
{
  return 8;
}

@end
