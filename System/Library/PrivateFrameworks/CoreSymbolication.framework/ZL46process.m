@implementation ZL46process

_DWORD *___ZL46process_symbol_owner_from_memory_arch_specificI17SizeAndEndiannessI9Pointer3212LittleEndianEEbP11CSCppMemoryPKcNT_6size_tENS8_5ptr_tES9_jRK17CSCppArchitectureU13block_pointerFvNSt3__110shared_ptrI16CSCppSymbolOwnerEEE_block_invoke(uint64_t a1, uint64_t a2)
{
  _DWORD *result;

  result = (_DWORD *)(*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)a2 + 32))(a2, *(unsigned int *)(a1 + 32), 28);
  if (result)
  {
    if (*result == -17958194)
      return (_DWORD *)(result[5] + 28);
    else
      return 0;
  }
  return result;
}

_DWORD *___ZL46process_symbol_owner_from_memory_arch_specificI17SizeAndEndiannessI9Pointer6412LittleEndianEEbP11CSCppMemoryPKcNT_6size_tENS8_5ptr_tES9_jRK17CSCppArchitectureU13block_pointerFvNSt3__110shared_ptrI16CSCppSymbolOwnerEEE_block_invoke(uint64_t a1, uint64_t a2)
{
  _DWORD *result;

  result = (_DWORD *)(*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)a2 + 32))(a2, *(_QWORD *)(a1 + 32), 32);
  if (result)
  {
    if (*result == -17958193)
      return (_DWORD *)(result[5] + 32);
    else
      return 0;
  }
  return result;
}

@end
