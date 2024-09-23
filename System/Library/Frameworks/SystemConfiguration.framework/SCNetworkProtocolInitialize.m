@implementation SCNetworkProtocolInitialize

uint64_t ____SCNetworkProtocolInitialize_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kSCNetworkProtocolTypeID = result;
  return result;
}

@end
