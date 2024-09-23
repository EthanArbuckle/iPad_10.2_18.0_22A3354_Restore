@implementation SCNetworkSettingsInitialize

uint64_t ____SCNetworkSettingsInitialize_block_invoke()
{
  uint64_t result;

  __kSCNSManagerTypeID = _CFRuntimeRegisterClass();
  result = _CFRuntimeRegisterClass();
  __kSCNSServiceTypeID = result;
  return result;
}

@end
