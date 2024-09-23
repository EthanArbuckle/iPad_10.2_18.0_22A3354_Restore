@implementation CFPrefsDirectModeEnabledForDomain

uint64_t ___CFPrefsDirectModeEnabledForDomain_block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isDirectModeEnabled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
