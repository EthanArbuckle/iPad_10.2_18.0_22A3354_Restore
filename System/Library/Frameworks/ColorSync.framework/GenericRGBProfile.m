@implementation GenericRGBProfile

void __create_GenericRGBProfile_block_invoke()
{
  CFDataRef v0;

  v0 = CFDataCreateWithBytesNoCopy(0, Generic_RGB_Profile_data, 1992, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  create_GenericRGBProfile_profile = (uint64_t)ColorSyncProfileCreateSigleton(v0, 0xE664562ABCFD7792, 0x1F9AAFEE4550CA87, CFSTR("/System/Library/ColorSync/Profiles/Generic RGB Profile.icc"), 0, 0);
  CFRelease(v0);
}

@end
