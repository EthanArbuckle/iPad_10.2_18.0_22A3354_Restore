@implementation AXColorStringForColor

uint64_t __AXColorStringForColor_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)AXColorStringForColor__lumaNumberFormatter;
  AXColorStringForColor__lumaNumberFormatter = (uint64_t)v0;

  return objc_msgSend((id)AXColorStringForColor__lumaNumberFormatter, "setNumberStyle:", 1);
}

@end
