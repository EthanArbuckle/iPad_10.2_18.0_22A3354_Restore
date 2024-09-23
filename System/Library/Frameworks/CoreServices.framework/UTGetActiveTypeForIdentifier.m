@implementation UTGetActiveTypeForIdentifier

uint64_t ___UTGetActiveTypeForIdentifier_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = (uint64_t)std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::find<unsigned int>((_QWORD *)(a2 + 240), (unsigned int *)(a1 + 56));
  if (result)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_DWORD *)(result + 20);
    result = CSStoreGetUnit();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  }
  return result;
}

_QWORD *___UTGetActiveTypeForIdentifier_block_invoke_3(uint64_t a1, uint64_t a2)
{
  return std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,unsigned int const&,unsigned int &>(a2 + 240, (unsigned int *)(a1 + 40), (_DWORD *)(a1 + 40), (int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

uint64_t ___UTGetActiveTypeForIdentifier_block_invoke_2(uint64_t result, uint64_t a2, int a3, uint64_t a4, _BYTE *a5)
{
  if ((*(_BYTE *)(a4 + 8) & 1) != 0)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a3;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a4;
    *a5 = 1;
  }
  return result;
}

@end
