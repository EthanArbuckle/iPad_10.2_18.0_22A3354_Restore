@implementation NTKPodcastsTintColorBody2

void __NTKPodcastsTintColorBody2_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.137254902, 0.121568627, 0.125490196, 0.6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NTKPodcastsTintColorBody2__color;
  NTKPodcastsTintColorBody2__color = v0;

}

@end
