@implementation FigHapticPlayerGetTypeID

uint64_t __FigHapticPlayerGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  FigHapticPlayerGetTypeID_cfTypeID = result;
  return result;
}

@end
