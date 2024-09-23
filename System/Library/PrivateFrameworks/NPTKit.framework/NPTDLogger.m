@implementation NPTDLogger

+ (id)daemon
{
  return os_log_create("com.apple.internal.networkperformancetesterd", "daemon");
}

+ (id)client
{
  return os_log_create("com.apple.internal.networkperformancetesterd", "client");
}

@end
