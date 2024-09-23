@implementation FigTransportDiscoveryGetTypeID

uint64_t __FigTransportDiscoveryGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  FigTransportDiscoveryGetTypeID_sFigTransportDiscoveryTypeID = result;
  return result;
}

@end
