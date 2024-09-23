@implementation ZN25InterfaceAppMapperService19addInterfaceMappingEji

uint64_t *___ZN25InterfaceAppMapperService19addInterfaceMappingEji_block_invoke(uint64_t a1)
{
  int v1;
  uint64_t *result;

  v1 = *(_DWORD *)(a1 + 44);
  result = std::__tree<std::__value_type<unsigned int,int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)(*(_QWORD *)(a1 + 32) + 32), *(_DWORD *)(a1 + 40), (unsigned int *)(a1 + 40));
  *((_DWORD *)result + 8) = v1;
  return result;
}

@end
