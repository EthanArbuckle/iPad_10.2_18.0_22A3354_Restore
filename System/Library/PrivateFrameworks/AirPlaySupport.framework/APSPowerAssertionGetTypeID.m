@implementation APSPowerAssertionGetTypeID

uint64_t __APSPowerAssertionGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  APSPowerAssertionGetTypeID_typeID = result;
  return result;
}

@end
