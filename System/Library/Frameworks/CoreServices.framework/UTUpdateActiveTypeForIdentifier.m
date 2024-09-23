@implementation UTUpdateActiveTypeForIdentifier

_QWORD *___UTUpdateActiveTypeForIdentifier_block_invoke(_QWORD *result, uint64_t a2, int a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v5;

  if ((*(_BYTE *)(a4 + 8) & 0x20) != 0)
    *(_DWORD *)(*(_QWORD *)(result[4] + 8) + 24) = a3;
  v5 = *(_QWORD *)(result[5] + 8);
  if (!*(_DWORD *)(v5 + 24))
  {
    *(_DWORD *)(v5 + 24) = a3;
    *(_DWORD *)(*(_QWORD *)(result[6] + 8) + 24) = *(_DWORD *)(a4 + 8);
  }
  if ((*(_BYTE *)(a4 + 8) & 1) != 0)
    *(_DWORD *)(*(_QWORD *)(result[7] + 8) + 24) = a3;
  if (*(_DWORD *)(*(_QWORD *)(result[7] + 8) + 24) && *(_DWORD *)(*(_QWORD *)(result[5] + 8) + 24))
  {
    if (*(_DWORD *)(*(_QWORD *)(result[4] + 8) + 24))
      *a5 = 1;
  }
  return result;
}

_QWORD *___UTUpdateActiveTypeForIdentifier_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::clear((_QWORD *)(a2 + 240));
}

@end
