@implementation ZN20SymbolicationSession25collectAvailableDsymPathsEv

_QWORD *___ZN20SymbolicationSession25collectAvailableDsymPathsEv_block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *result;
  __int128 v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  CSSymbolicatorGetSymbolOwner();
  result = (_QWORD *)CSSymbolOwnerGetCFUUIDBytes();
  if (result)
  {
    v4 = *(_OWORD *)result;
    return std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,UUID&,std::string&>(v2 + 13536, &v4, &v4, *(_QWORD *)(a1 + 40));
  }
  return result;
}

_QWORD *___ZN20SymbolicationSession25collectAvailableDsymPathsEv_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  _QWORD *result;
  __int128 v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  CSSymbolicatorGetSymbolOwner();
  result = (_QWORD *)CSSymbolOwnerGetCFUUIDBytes();
  if (result)
  {
    v4 = *(_OWORD *)result;
    return std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,UUID&,std::string&>(v2 + 13536, &v4, &v4, *(_QWORD *)(a1 + 40));
  }
  return result;
}

@end
