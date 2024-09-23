@implementation FigHapticQueueGetTypeID

uint64_t __FigHapticQueueGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  FigHapticQueueGetTypeID_cfTypeID = result;
  return result;
}

@end
