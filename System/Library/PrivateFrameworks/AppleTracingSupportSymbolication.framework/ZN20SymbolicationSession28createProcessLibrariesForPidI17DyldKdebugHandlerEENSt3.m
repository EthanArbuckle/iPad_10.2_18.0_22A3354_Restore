@implementation ZN20SymbolicationSession28createProcessLibrariesForPidI17DyldKdebugHandlerEENSt3

std::string *___ZN20SymbolicationSession28createProcessLibrariesForPidI17DyldKdebugHandlerEENSt3__16vectorI14ProcessLibraryNS2_9allocatorIS4_EEEEiRT_b_block_invoke(uint64_t a1)
{
  uint64_t v1;
  std::string *result;
  const std::string::value_type *Path;
  _QWORD *v4;
  __int128 *v5;
  __int128 v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  CSSymbolicatorGetSymbolOwner();
  result = (std::string *)CSSymbolOwnerGetCFUUIDBytes();
  if (result)
  {
    v6 = *(_OWORD *)&result->__r_.__value_.__l.__data_;
    Path = (const std::string::value_type *)CSSymbolOwnerGetPath();
    v5 = &v6;
    v4 = std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>(v1 + 184, &v6, (uint64_t)&std::piecewise_construct, &v5);
    return std::string::__assign_external((std::string *)(v4 + 4), Path);
  }
  return result;
}

@end
