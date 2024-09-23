@implementation AdobeRGB1998Profile

void __create_AdobeRGB1998Profile_block_invoke()
{
  CFDataRef v0;

  v0 = CFDataCreateWithBytesNoCopy(0, AdobeRGB1998_data, 560, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  create_AdobeRGB1998Profile_profile = (uint64_t)ColorSyncProfileCreateSigleton(v0, 0xF6D599D88283A8DELL, 0x38E13A4732B473E5, CFSTR("/System/Library/ColorSync/Profiles/AdobeRGB1998.icc"), 0, 0);
  CFRelease(v0);
}

@end
