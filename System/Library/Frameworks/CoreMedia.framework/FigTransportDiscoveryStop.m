@implementation FigTransportDiscoveryStop

void __FigTransportDiscoveryStop_block_invoke(uint64_t a1)
{
  ftd_Stop(*(_QWORD *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
