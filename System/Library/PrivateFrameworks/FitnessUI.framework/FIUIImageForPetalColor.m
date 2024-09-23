@implementation FIUIImageForPetalColor

uint64_t ___FIUIImageForPetalColor_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "renderInContext:", objc_msgSend(a2, "CGContext"));
}

@end
