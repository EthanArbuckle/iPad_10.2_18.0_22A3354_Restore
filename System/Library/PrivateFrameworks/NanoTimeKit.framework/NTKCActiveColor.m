@implementation NTKCActiveColor

void __NTKCActiveColor_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.105882353, 1.0, 0.549019608, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NTKCActiveColor_color;
  NTKCActiveColor_color = v0;

}

@end
