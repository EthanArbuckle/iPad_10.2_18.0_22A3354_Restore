@implementation NSBundle(AppleMediaServices)

+ (uint64_t)ams_AppleMediaServicesBundle
{
  return objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/AppleMediaServices.framework"));
}

+ (uint64_t)ams_MusicBundle
{
  return objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Applications/Music.app"));
}

@end
