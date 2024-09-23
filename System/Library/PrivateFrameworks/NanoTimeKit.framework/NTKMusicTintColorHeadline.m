@implementation NTKMusicTintColorHeadline

void __NTKMusicTintColorHeadline_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.0, 0.305882353, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NTKMusicTintColorHeadline__color;
  NTKMusicTintColorHeadline__color = v0;

}

@end
