@implementation SUUIImagePlaceholderCornerPathBlockCreate

uint64_t __SUUIImagePlaceholderCornerPathBlockCreate_block_invoke()
{
  return objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRect:");
}

uint64_t __SUUIImagePlaceholderCornerPathBlockCreate_block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  return objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRoundedRect:cornerRadius:", a2, a3, a4, a5, *(double *)(a1 + 32));
}

@end
