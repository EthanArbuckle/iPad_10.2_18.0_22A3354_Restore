@implementation MXMDisplayProbe

uint64_t __42__MXMDisplayProbe_iphoneOS_Internal__loop__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pollMain");
}

@end
