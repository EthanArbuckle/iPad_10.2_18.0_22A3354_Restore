@implementation SCNetworkServiceInitialize

uint64_t ____SCNetworkServiceInitialize_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kSCNetworkServiceTypeID = result;
  return result;
}

@end
