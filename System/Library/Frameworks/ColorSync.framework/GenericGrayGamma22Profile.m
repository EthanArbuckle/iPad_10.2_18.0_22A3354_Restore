@implementation GenericGrayGamma22Profile

void __create_GenericGrayGamma22Profile_block_invoke()
{
  CFDataRef v0;

  v0 = CFDataCreateWithBytesNoCopy(0, Generic_Gray_Gamma_2_2_Profile_data, 4508, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  create_GenericGrayGamma22Profile_profile = (uint64_t)ColorSyncProfileCreateSigleton(v0, 0x66791D3DAEE412BALL, 0xAD78CFFBDCE4AD16, CFSTR("/System/Library/ColorSync/Profiles/Generic Gray Gamma 2.2 Profile.icc"), 0, 0);
  CFRelease(v0);
}

@end
