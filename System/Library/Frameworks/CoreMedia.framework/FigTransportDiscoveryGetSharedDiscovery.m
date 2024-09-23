@implementation FigTransportDiscoveryGetSharedDiscovery

CFMutableArrayRef __FigTransportDiscoveryGetSharedDiscovery_block_invoke()
{
  uint64_t Instance;
  CFMutableArrayRef result;

  if (FigTransportDiscoveryGetTypeID_sFigTransportDiscoveryInitOnce != -1)
    dispatch_once(&FigTransportDiscoveryGetTypeID_sFigTransportDiscoveryInitOnce, &__block_literal_global_49);
  Instance = _CFRuntimeCreateInstance();
  *(_QWORD *)(Instance + 16) = dispatch_queue_create("com.apple.coremedia.transportdiscovery", 0);
  result = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  *(_QWORD *)(Instance + 32) = result;
  FigTransportDiscoveryGetSharedDiscovery_sSharedDiscovery = Instance;
  return result;
}

@end
