@implementation BLTIsDebugOrInternalBuild

uint64_t __BLTIsDebugOrInternalBuild_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  BLTIsDebugOrInternalBuild___isDebugOrInternal = result;
  return result;
}

@end
