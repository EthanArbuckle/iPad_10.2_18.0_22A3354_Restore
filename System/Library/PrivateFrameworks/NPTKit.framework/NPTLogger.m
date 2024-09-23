@implementation NPTLogger

+ (id)network
{
  return os_log_create("com.apple.wifiqa.NPTKit", "networking");
}

+ (id)fileSystem
{
  return os_log_create("com.apple.wifiqa.NPTKit", "fileSystem");
}

+ (id)wifiVelocity
{
  return os_log_create("com.apple.wifiqa.NPTKit", "wifiVelocity");
}

+ (id)cellular
{
  return os_log_create("com.apple.wifiqa.NPTKit", "cellular");
}

+ (id)metadata
{
  return os_log_create("com.apple.wifiqa.NPTKit", "metadata");
}

@end
