@implementation SUUIGraphicsDeviceHasASTCSupport

uint64_t __SUUIGraphicsDeviceHasASTCSupport_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  SUUIGraphicsDeviceHasASTCSupport_supportsASTC = result;
  return result;
}

@end
