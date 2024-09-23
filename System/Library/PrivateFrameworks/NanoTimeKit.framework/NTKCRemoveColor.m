@implementation NTKCRemoveColor

void __NTKCRemoveColor_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.945098039, 0.180392157, 0.180392157, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NTKCRemoveColor_color;
  NTKCRemoveColor_color = v0;

}

@end
