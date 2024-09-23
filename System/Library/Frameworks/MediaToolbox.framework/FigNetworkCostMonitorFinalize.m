@implementation FigNetworkCostMonitorFinalize

void __FigNetworkCostMonitorFinalize_block_invoke(uint64_t a1)
{
  CFBagRemoveValue((CFMutableBagRef)sFigNetworkCostMonitorBag, *(const void **)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 32));
  dispatch_async((dispatch_queue_t)sFigNetworkCostMonitorQueue, &__block_literal_global_167_0);
}

@end
