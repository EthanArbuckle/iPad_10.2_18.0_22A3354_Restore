@implementation DisplayP3HLGProfile

void __pre_cicp_DisplayP3HLGProfile_block_invoke()
{
  CFDataRef v0;

  v0 = CFDataCreateWithBytesNoCopy(0, Display_P3_HLG_pre_cicp_data, 7332, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  pre_cicp_DisplayP3HLGProfile_profile = create(v0, 0, 0);
  CFRelease(v0);
}

@end
