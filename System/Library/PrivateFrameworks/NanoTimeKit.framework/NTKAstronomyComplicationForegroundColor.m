@implementation NTKAstronomyComplicationForegroundColor

void __NTKAstronomyComplicationForegroundColor_block_invoke()
{
  CGColorSpace *v0;
  uint64_t v1;
  const CGFloat *v2;
  CGColor *v3;
  uint64_t v4;
  void *v5;

  v0 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D960]);
  v1 = 0;
  v2 = (const CGFloat *)&NavdRecentLocationsEntitlment_block_invoke_complicationColorComponents;
  do
  {
    v3 = CGColorCreate(v0, v2);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)NTKAstronomyComplicationForegroundColor_complicationColors[v1];
    NTKAstronomyComplicationForegroundColor_complicationColors[v1] = v4;

    CGColorRelease(v3);
    v2 += 4;
    ++v1;
  }
  while (v1 != 3);
  CGColorSpaceRelease(v0);
}

@end
