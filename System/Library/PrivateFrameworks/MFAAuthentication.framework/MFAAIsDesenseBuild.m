@implementation MFAAIsDesenseBuild

uint64_t __MFAAIsDesenseBuild_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  gbIsDesenseBuild = result;
  return result;
}

@end
