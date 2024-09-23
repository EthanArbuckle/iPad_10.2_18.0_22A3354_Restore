@implementation WFResizedImageFromImageSource

void __WFResizedImageFromImageSource_block_invoke(uint64_t a1)
{
  CGImageRelease(*(CGImageRef *)(a1 + 32));
}

void __WFResizedImageFromImageSource_block_invoke_2(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
