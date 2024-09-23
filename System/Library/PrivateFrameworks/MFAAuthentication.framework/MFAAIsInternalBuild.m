@implementation MFAAIsInternalBuild

uint64_t __MFAAIsInternalBuild_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  gbIsInternalBuild = result;
  return result;
}

@end
