@implementation DisplayP3PQProfile

void __pre_cicp_DisplayP3PQProfile_block_invoke()
{
  CFDataRef v0;

  v0 = CFDataCreateWithBytesNoCopy(0, Display_P3_PQ_pre_cicp_data, 13476, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  pre_cicp_DisplayP3PQProfile_profile = create(v0, 0, 0);
  CFRelease(v0);
}

@end
