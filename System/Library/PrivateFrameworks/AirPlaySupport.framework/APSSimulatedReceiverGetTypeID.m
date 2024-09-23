@implementation APSSimulatedReceiverGetTypeID

uint64_t __APSSimulatedReceiverGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  APSSimulatedReceiverGetTypeID_typeID = result;
  return result;
}

@end
