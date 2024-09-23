@implementation NTKNowPlayingTintColorBody

void __NTKNowPlayingTintColorBody_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.137254902, 0.121568627, 0.125490196, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NTKNowPlayingTintColorBody__color;
  NTKNowPlayingTintColorBody__color = v0;

}

@end
