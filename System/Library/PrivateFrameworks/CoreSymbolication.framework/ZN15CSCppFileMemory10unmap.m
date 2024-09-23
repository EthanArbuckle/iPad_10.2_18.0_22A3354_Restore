@implementation ZN15CSCppFileMemory10unmap

uint64_t *___ZN15CSCppFileMemory10unmap_fileEv_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t *result;

  v1 = *(_QWORD *)(a1 + 32);
  CSCppFileMemory::_total_mmapped_bytes -= *(_QWORD *)(a1 + 40);
  result = std::__hash_table<std::__hash_value_type<std::string,MappedFileTableEntry *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MappedFileTableEntry *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MappedFileTableEntry *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MappedFileTableEntry *>>>::__erase_unique<std::string>((_QWORD *)mapped_file_table, (unsigned __int8 *)(v1 + 96));
  if (*(char *)(v1 + 119) < 0)
  {
    **(_BYTE **)(v1 + 96) = 0;
    *(_QWORD *)(v1 + 104) = 0;
  }
  else
  {
    *(_BYTE *)(v1 + 96) = 0;
    *(_BYTE *)(v1 + 119) = 0;
  }
  return result;
}

@end
