@implementation ZN10subscriber27sHandleIsMomentaryPowerDownIN3uim13GetCardStatus8ResponseEEEvNSt3

uint64_t **___ZN10subscriber27sHandleIsMomentaryPowerDownIN3uim13GetCardStatus8ResponseEEEvNSt3__110shared_ptrIK8RegistryEERKT_RNS4_3mapIjbNS4_4lessIjEENS4_9allocatorINS4_4pairIKjbEEEEEE_block_invoke(uint64_t **result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t **v4;
  uint64_t v5;
  BOOL v6;
  int v7;

  v7 = 0;
  v2 = *a2;
  v3 = a2[1];
  if (*a2 != v3)
  {
    v4 = result;
    v5 = 0;
    do
    {
      v6 = *(_BYTE *)(v2 + v5) != 0;
      result = std::__tree<std::__value_type<unsigned int,BOOL>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,BOOL>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,BOOL>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)v4[4], v5, &v7);
      *((_BYTE *)result + 32) = v6;
      v7 = ++v5;
    }
    while (v2 + v5 != v3);
  }
  return result;
}

@end
