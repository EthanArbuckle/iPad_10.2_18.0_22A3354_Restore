@implementation PerceptualStandardRGBProfile

void __create_PerceptualStandardRGBProfile_block_invoke()
{
  CFDataRef v0;
  uint64_t v1;

  v0 = CFDataCreateWithBytesNoCopy(0, perceptual_standard_RGB_data, 54192, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  v1 = create(v0, 2, 0);
  if (v1)
    *(_OWORD *)(v1 + 128) = xmmword_18B3EAAD0;
  create_PerceptualStandardRGBProfile_profile = v1;
  CFRelease(v0);
}

@end
