@implementation SCNetworkSetInitialize

uint64_t ____SCNetworkSetInitialize_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kSCNetworkSetTypeID = result;
  return result;
}

@end
