@implementation FigCFIOKitObjectGetTypeID

uint64_t __FigCFIOKitObjectGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  FigCFIOKitObjectGetTypeID_sFigCFIOKitObjectTypeID = result;
  return result;
}

@end
