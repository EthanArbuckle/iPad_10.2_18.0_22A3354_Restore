@implementation SCNetworkCategoryManagerActivateValue

uint64_t __SCNetworkCategoryManagerActivateValue_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = CategoryManagerConnectionActivateValue(*(_xpc_connection_s **)(*(_QWORD *)(a1 + 40) + 48), *(const __CFString **)(a1 + 48));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
