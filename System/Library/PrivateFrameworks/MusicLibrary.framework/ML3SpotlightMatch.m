@implementation ML3SpotlightMatch

int *__ML3SpotlightMatch_block_invoke(int *result, _QWORD *a2)
{
  int *v3;
  uint64_t v4;
  sqlite3_int64 v5;
  uint64_t v6;

  if (result[12] >= 1)
  {
    v3 = result;
    v4 = 0;
    while (1)
    {
      v5 = sqlite3_value_int64(*(sqlite3_value **)(*((_QWORD *)v3 + 5) + 8 * v4));
      result = (int *)std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::find<long long>(a2, v5);
      v6 = v3[12];
      if (result)
        break;
      if (++v4 >= v6)
        return result;
    }
    *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v3 + 4) + 8) + 24) = v6 - v4;
  }
  return result;
}

@end
