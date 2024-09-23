@implementation NTKSecondaryForegroundGrayColor

void __NTKSecondaryForegroundGrayColor_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.560784314, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NTKSecondaryForegroundGrayColor_color;
  NTKSecondaryForegroundGrayColor_color = v0;

}

@end
