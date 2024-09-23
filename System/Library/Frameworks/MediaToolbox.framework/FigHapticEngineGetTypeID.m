@implementation FigHapticEngineGetTypeID

uint64_t __FigHapticEngineGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  FigHapticEngineGetTypeID_cfTypeID = result;
  return result;
}

@end
