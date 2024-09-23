@implementation SCNMTLEnsureIOSurfaceBackingBufferValidity

void __SCNMTLEnsureIOSurfaceBackingBufferValidity_block_invoke(uint64_t a1)
{
  IOSurfaceDecrementUseCount(*(IOSurfaceRef *)(a1 + 32));
}

@end
