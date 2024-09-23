@implementation CDMServiceCharacteristics

+ (BOOL)isRunningDaemon
{
  return +[CDMFeatureFlags isCDMClientXPCEnabled](CDMFeatureFlags, "isCDMClientXPCEnabled");
}

@end
