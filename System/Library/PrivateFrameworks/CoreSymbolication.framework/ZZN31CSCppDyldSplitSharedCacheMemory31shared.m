@implementation ZZN31CSCppDyldSplitSharedCacheMemory31shared

const char *___ZZN31CSCppDyldSplitSharedCacheMemory31shared_cache_file_list_for_uuidENSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEERKNS0_13unordered_setI4UUID15UUIDHashFunctor17UUIDEqualsFunctorNS4_IS8_EEEEENK3__0clEP6direntPb_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = a2;
  return TMemoryView<SizeAndEndianness<Pointer64,LittleEndian>>::needed_mapping_size_for_dyld_shared_cache_at(&v3, 0);
}

@end
