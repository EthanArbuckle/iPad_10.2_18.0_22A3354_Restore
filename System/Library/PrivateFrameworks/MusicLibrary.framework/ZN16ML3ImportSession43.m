@implementation ZN16ML3ImportSession43

_QWORD *___ZN16ML3ImportSession43_populateExistingArtistIdentifiersForSourceEi_block_invoke(uint64_t a1, unint64_t a2, id *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *result;
  unint64_t v9;
  unint64_t v10;

  v10 = a2;
  v6 = *(_QWORD *)(a1 + 40);
  v9 = objc_msgSend(*a3, "longLongValue");
  std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>(v6 + 1640, v9, &v9)[3] = a2;
  v7 = objc_msgSend(a3[1], "longLongValue");
  result = std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48, a2, &v10);
  result[3] = v7;
  return result;
}

@end
