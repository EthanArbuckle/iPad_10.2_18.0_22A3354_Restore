@implementation SecTrustGetCurrentAccessGroups

CFArrayRef __SecTrustGetCurrentAccessGroups_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFArrayRef result;

  result = CFArrayCreateForCFTypes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2, a3, a4, a5, a6, a7, a8, (uint64_t)CFSTR("com.apple.trustd"));
  SecTrustGetCurrentAccessGroups_accessGroups = (uint64_t)result;
  return result;
}

@end
