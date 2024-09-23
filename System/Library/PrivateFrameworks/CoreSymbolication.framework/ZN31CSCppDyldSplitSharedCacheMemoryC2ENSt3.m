@implementation ZN31CSCppDyldSplitSharedCacheMemoryC2ENSt3

const char *___ZN31CSCppDyldSplitSharedCacheMemoryC2ENSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEPK11CFUUIDBytes_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = a2;
  return TMemoryView<SizeAndEndianness<Pointer64,LittleEndian>>::needed_mapping_size_for_dyld_shared_cache_at(&v3, 0);
}

_QWORD *___ZN31CSCppDyldSplitSharedCacheMemoryC2ENSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEPK11CFUUIDBytes_block_invoke_2(_QWORD *result, __int128 *a2)
{
  __int128 v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v2 = *a2;
    return std::__hash_table<UUID,UUIDHashFunctor,UUIDEqualsFunctor,std::allocator<UUID>>::__emplace_unique_key_args<UUID,UUID const&>(*(_QWORD *)(result[4] + 8) + 40, &v2, &v2);
  }
  return result;
}

@end
