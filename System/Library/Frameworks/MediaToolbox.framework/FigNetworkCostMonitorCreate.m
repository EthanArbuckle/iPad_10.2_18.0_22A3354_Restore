@implementation FigNetworkCostMonitorCreate

void __FigNetworkCostMonitorCreate_block_invoke(uint64_t a1)
{
  CFBagSetValue((CFMutableBagRef)sFigNetworkCostMonitorBag, *(const void **)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
