@implementation ZN8GPUTools2SM2GL11GetEnumNameEi

_QWORD *___ZN8GPUTools2SM2GL11GetEnumNameEi_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *result;
  _DWORD *v4;

  v0 = operator new();
  v1 = 0;
  *(_OWORD *)v0 = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_DWORD *)(v0 + 32) = 1065353216;
  GPUTools::SM::GL::GetEnumName(int)::sEnumNameMapping = v0;
  do
  {
    v2 = *(_QWORD *)((char *)&GPUTools::SM::GL::_sEnumList + v1 + 8);
    v4 = (_DWORD *)((char *)&GPUTools::SM::GL::_sEnumList + v1);
    result = std::__hash_table<std::__hash_value_type<int,char const*>,std::__unordered_map_hasher<int,std::__hash_value_type<int,char const*>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,char const*>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,char const*>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(GPUTools::SM::GL::GetEnumName(int)::sEnumNameMapping, (int *)((char *)&GPUTools::SM::GL::_sEnumList + v1), (uint64_t)&std::piecewise_construct, &v4);
    result[3] = v2;
    v1 += 16;
  }
  while (v1 != 2144);
  return result;
}

@end
