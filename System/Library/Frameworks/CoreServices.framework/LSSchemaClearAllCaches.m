@implementation LSSchemaClearAllCaches

_QWORD *___LSSchemaClearAllCaches_block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  if (a2)
  {
    *(_OWORD *)(a2 + 324) = 0u;
    *(_OWORD *)(a2 + 296) = 0u;
    *(_OWORD *)(a2 + 312) = 0u;
    *(_OWORD *)(a2 + 280) = 0u;
    std::__hash_table<std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>>>::clear(a2 + 200);
    return std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::clear((_QWORD *)(a2 + 240));
  }
  return result;
}

@end
