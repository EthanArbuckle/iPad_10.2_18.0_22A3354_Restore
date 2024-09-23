@implementation NTKMusicTintColor

void __NTKMusicTintColor_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.980392157, 0.176470588, 0.282352941, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NTKMusicTintColor__color;
  NTKMusicTintColor__color = v0;

}

@end
