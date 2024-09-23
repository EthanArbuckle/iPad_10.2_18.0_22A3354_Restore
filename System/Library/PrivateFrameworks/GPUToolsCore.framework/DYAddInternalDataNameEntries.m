@implementation DYAddInternalDataNameEntries

uint64_t *__DYAddInternalDataNameEntries_block_invoke(uint64_t *result)
{
  uint64_t *v1;
  uint64_t v2;
  unint64_t v3;

  if (result[4])
  {
    v1 = result;
    v2 = 0;
    v3 = 0;
    do
    {
      result = std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int const&,char const* const&>(spInternalDataNameMap, (int *)(v1[5] + v2), (_DWORD *)(v1[5] + v2), (char **)(v1[5] + v2 + 8));
      ++v3;
      v2 += 16;
    }
    while (v3 < v1[4]);
  }
  return result;
}

@end
