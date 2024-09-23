@implementation APConnectivityHelperDeregisterActivity

uint64_t __APConnectivityHelperDeregisterActivity_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = _APConnectivityHelperDeregisterActivity(*(_QWORD *)(a1 + 40), *(const void **)(a1 + 48), (void *)*(unsigned int *)(a1 + 56));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
