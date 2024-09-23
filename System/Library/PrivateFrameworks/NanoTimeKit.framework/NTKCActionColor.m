@implementation NTKCActionColor

void __NTKCActionColor_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.945098039, 0.564705882, 0.192156863, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NTKCActionColor_color;
  NTKCActionColor_color = v0;

}

@end
