@implementation NTKIsConnectivityPhoneComplicationEnabled

uint64_t __NTKIsConnectivityPhoneComplicationEnabled_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = NTKInternalBuild(a1, a2, a3, a4);
  NTKIsConnectivityPhoneComplicationEnabled_enabled = result;
  return result;
}

@end
