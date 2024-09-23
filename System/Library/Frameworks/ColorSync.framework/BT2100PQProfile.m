@implementation BT2100PQProfile

void __pre_cicp_BT2100PQProfile_block_invoke()
{
  CFDataRef v0;

  v0 = CFDataCreateWithBytesNoCopy(0, ITU_2100_PQ_pre_cicp_data, 13464, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  pre_cicp_BT2100PQProfile_profile = create(v0, 0, 0);
  CFRelease(v0);
}

@end
