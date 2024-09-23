@implementation ARAnchorsForPublicDelegate

uint64_t __ARAnchorsForPublicDelegate_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isHiddenFromPublicDelegate") ^ 1;
}

@end
