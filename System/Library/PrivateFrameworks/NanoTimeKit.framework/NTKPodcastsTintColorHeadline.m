@implementation NTKPodcastsTintColorHeadline

void __NTKPodcastsTintColorHeadline_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.823529412, 0.431372549, 0.976470588, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NTKPodcastsTintColorHeadline__color;
  NTKPodcastsTintColorHeadline__color = v0;

}

@end
