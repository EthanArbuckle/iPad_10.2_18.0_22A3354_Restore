@implementation ZN26CSCppDyldSharedCacheMemoryC2E17CSCppArchitecturePKcS2

const char *___ZN26CSCppDyldSharedCacheMemoryC2E17CSCppArchitecturePKcS2_PK4UUID_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = a2;
  return TMemoryView<SizeAndEndianness<Pointer64,LittleEndian>>::needed_mapping_size_for_dyld_shared_cache_at(&v3, 0);
}

@end
