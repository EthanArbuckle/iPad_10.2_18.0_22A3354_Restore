@implementation SecTrustCopyPolicies

CFArrayRef __SecTrustCopyPolicies_block_invoke(uint64_t a1)
{
  CFArrayRef result;

  result = CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *(CFArrayRef *)(*(_QWORD *)(a1 + 40) + 32));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
