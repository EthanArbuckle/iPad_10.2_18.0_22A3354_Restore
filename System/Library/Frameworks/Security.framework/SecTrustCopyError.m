@implementation SecTrustCopyError

uint64_t __SecTrustCopyError_block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 40) + 112);
  return result;
}

@end
