@implementation APSLatencyOffsetStepperGetTypeID

uint64_t __APSLatencyOffsetStepperGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  APSLatencyOffsetStepperGetTypeID_typeID = result;
  return result;
}

@end
