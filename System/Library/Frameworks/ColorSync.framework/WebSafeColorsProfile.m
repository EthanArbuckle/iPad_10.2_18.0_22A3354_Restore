@implementation WebSafeColorsProfile

void __create_WebSafeColorsProfile_block_invoke()
{
  CFDataRef v0;

  v0 = CFDataCreateWithBytesNoCopy(0, WebSafeColors_Profile_data, 11504, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  create_WebSafeColorsProfile_profile = (uint64_t)ColorSyncProfileCreateSigleton(v0, 0x3FEBD58E84B1D53, 0x28AF40706F461B64, CFSTR("/Library/ColorSync/Profiles/WebSafeColors.icc"), 0, 0);
  CFRelease(v0);
}

@end
