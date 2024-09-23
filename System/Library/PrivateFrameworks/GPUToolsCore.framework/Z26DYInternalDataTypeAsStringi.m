@implementation Z26DYInternalDataTypeAsStringi

std::string *___Z26DYInternalDataTypeAsStringi_block_invoke(uint64_t a1)
{
  std::string *result;

  result = (std::string *)std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::find<int>((_QWORD *)spInternalDataNameMap, (int *)(a1 + 40));
  if (result)
    return std::string::operator=((std::string *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), result + 1);
  return result;
}

@end
