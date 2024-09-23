@implementation CGImageDestinationGetTypeID

uint64_t __CGImageDestinationGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  CGImageDestinationGetTypeID::id = result;
  return result;
}

@end
