@implementation SecTrustCopyChainSummary

uint64_t __SecTrustCopyChainSummary_block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 40) + 72);
  return result;
}

@end
