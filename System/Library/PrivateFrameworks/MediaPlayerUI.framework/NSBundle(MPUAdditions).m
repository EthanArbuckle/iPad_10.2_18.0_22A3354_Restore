@implementation NSBundle(MPUAdditions)

+ (uint64_t)mediaPlayerUIBundle
{
  return objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayerUI"));
}

@end
