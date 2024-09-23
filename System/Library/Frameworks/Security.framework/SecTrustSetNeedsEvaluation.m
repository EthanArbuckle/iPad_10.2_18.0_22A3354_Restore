@implementation SecTrustSetNeedsEvaluation

uint64_t __SecTrustSetNeedsEvaluation_block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 112) = 0;
  return result;
}

@end
