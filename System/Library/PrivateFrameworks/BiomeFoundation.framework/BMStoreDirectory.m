@implementation BMStoreDirectory

+ (NSString)localDevice
{
  return (NSString *)CFSTR("local");
}

+ (NSString)remoteDevices
{
  return (NSString *)CFSTR("remote");
}

+ (NSString)metadata
{
  return (NSString *)CFSTR("metadata");
}

+ (NSString)sessions
{
  return (NSString *)CFSTR("sessions");
}

+ (NSString)bookmarks
{
  return (NSString *)CFSTR("bookmarks");
}

+ (NSString)lock
{
  return (NSString *)CFSTR("lock");
}

+ (NSString)server
{
  return (NSString *)CFSTR("server");
}

+ (NSString)subscriptions
{
  return (NSString *)CFSTR("subscriptions");
}

+ (NSString)public
{
  return (NSString *)CFSTR("public");
}

+ (NSString)client
{
  return (NSString *)CFSTR("client");
}

+ (NSString)tmp
{
  return (NSString *)CFSTR("tmp");
}

+ (NSString)compute
{
  return (NSString *)CFSTR("compute");
}

+ (NSString)streams
{
  return (NSString *)CFSTR("streams");
}

+ (NSString)restricted
{
  return (NSString *)CFSTR("restricted");
}

+ (NSString)sets
{
  return (NSString *)CFSTR("sets");
}

+ (void)setBasePathForTestingWithPath:(id)a3
{
  +[BMPaths setBasePathForTestingWithPath:](BMPaths, "setBasePathForTestingWithPath:", a3);
}

+ (void)unsetBasePathForTesting
{
  +[BMPaths unsetBasePathForTesting](BMPaths, "unsetBasePathForTesting");
}

+ (NSString)tombstones
{
  return (NSString *)CFSTR("tombstone");
}

+ (NSString)databases
{
  return (NSString *)CFSTR("databases");
}

+ (NSString)private
{
  return (NSString *)CFSTR("private");
}

+ (NSString)artifacts
{
  return (NSString *)CFSTR("artifacts");
}

+ (NSString)persistent
{
  return (NSString *)CFSTR("persistent");
}

+ (NSString)nonwaking
{
  return (NSString *)CFSTR("nonwaking");
}

+ (NSString)flexibleStorage
{
  return (NSString *)CFSTR("FlexibleStorage");
}

+ (NSString)sync
{
  return (NSString *)CFSTR("sync");
}

+ (NSString)sharedSync
{
  return (NSString *)CFSTR("sharedSync");
}

@end
