@implementation NTKPodcastsTintColor

void __NTKPodcastsTintColor_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.611764706, 0.352941176, 0.949019608, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NTKPodcastsTintColor__color;
  NTKPodcastsTintColor__color = v0;

}

@end
