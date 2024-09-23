@implementation MLCPlatform

+ (void)setRNGSeedTo:(NSNumber *)seed
{
  +[MLCPlatformInfo setRandomSeedTo:](MLCPlatformInfo, "setRandomSeedTo:", seed);
}

+ (NSNumber)getRNGseed
{
  return (NSNumber *)+[MLCPlatformInfo getRandomSeed](MLCPlatformInfo, "getRandomSeed");
}

@end
