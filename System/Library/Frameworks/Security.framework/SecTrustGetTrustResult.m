@implementation SecTrustGetTrustResult

uint64_t __SecTrustGetTrustResult_block_invoke(uint64_t result)
{
  **(_DWORD **)(result + 32) = *(_DWORD *)(*(_QWORD *)(result + 40) + 112);
  return result;
}

@end
