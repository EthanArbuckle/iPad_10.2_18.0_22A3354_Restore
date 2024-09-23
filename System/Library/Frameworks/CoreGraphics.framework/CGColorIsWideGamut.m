@implementation CGColorIsWideGamut

void __CGColorIsWideGamut_block_invoke()
{
  CGColorSpace *v0;

  v0 = CGColorSpaceCreateWithName(CFSTR("kCGColorSpaceExtendedSRGB"));
  CGColorIsWideGamut_transform = color_transform_create(v0, 0);
  CGColorSpaceRelease(v0);
}

@end
