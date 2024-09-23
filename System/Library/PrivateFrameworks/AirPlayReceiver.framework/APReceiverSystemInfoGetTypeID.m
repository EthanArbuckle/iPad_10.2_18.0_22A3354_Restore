@implementation APReceiverSystemInfoGetTypeID

uint64_t __APReceiverSystemInfoGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  APReceiverSystemInfoGetTypeID_typeID = result;
  return result;
}

@end
