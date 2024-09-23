@implementation FICustomSplits

uint64_t __FICustomSplits_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fi_isCustomSplitEvent");
}

@end
