@implementation ZN21CSCppSymbolOwnerCache24create

unsigned int *___ZN21CSCppSymbolOwnerCache24create_symbol_owner_dataEP16CSCppSymbolOwnerP13CSCppDsymData_block_invoke(uint64_t a1)
{
  unsigned int *result;

  result = create_symbol_owner_data2(*(CSCppSymbolOwner **)(a1 + 40), *(CSCppDsymData **)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
