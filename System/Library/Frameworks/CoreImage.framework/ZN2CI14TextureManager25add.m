@implementation ZN2CI14TextureManager25add

uint64_t *___ZN2CI14TextureManager25add_intermediate_for_nodeERKNS_6roiKeyEPNS_14intermediate_tE_block_invoke(_QWORD *a1)
{
  uint64_t **v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *result;
  __int128 v6;

  v2 = (uint64_t **)(a1[6] + 144);
  *(_QWORD *)&v6 = a1[7];
  v3 = std::__tree<std::__value_type<CI::Node const*,std::multimap<int const,CI::TextureManager::tmIntermediate_t *>>,std::__map_value_compare<CI::Node const*,std::__value_type<CI::Node const*,std::multimap<int const,CI::TextureManager::tmIntermediate_t *>>,std::less<CI::Node const*>,true>,std::allocator<std::__value_type<CI::Node const*,std::multimap<int const,CI::TextureManager::tmIntermediate_t *>>>>::__emplace_unique_key_args<CI::Node const*,std::piecewise_construct_t const&,std::tuple<CI::Node const* const&>,std::tuple<>>(v2, (unint64_t *)v6, (uint64_t)&std::piecewise_construct, (uint64_t **)&v6);
  v4 = *(_QWORD *)(a1[4] + 8);
  LODWORD(v6) = *(_DWORD *)(a1[7] + 8);
  *((_QWORD *)&v6 + 1) = *(_QWORD *)(v4 + 24);
  std::__tree<std::__value_type<int const,CI::TextureManager::tmIntermediate_t *>,std::__map_value_compare<int const,std::__value_type<int const,CI::TextureManager::tmIntermediate_t *>,std::less<int const>,true>,std::allocator<std::__value_type<int const,CI::TextureManager::tmIntermediate_t *>>>::__emplace_multi<std::pair<int const,CI::TextureManager::tmIntermediate_t *>>((uint64_t **)v3 + 5, &v6);
  *(_QWORD *)&v6 = a1[7];
  result = std::__tree<std::__value_type<CI::Node const*,std::multimap<int const,CI::TextureManager::tmIntermediate_t *>>,std::__map_value_compare<CI::Node const*,std::__value_type<CI::Node const*,std::multimap<int const,CI::TextureManager::tmIntermediate_t *>>,std::less<CI::Node const*>,true>,std::allocator<std::__value_type<CI::Node const*,std::multimap<int const,CI::TextureManager::tmIntermediate_t *>>>>::__emplace_unique_key_args<CI::Node const*,std::piecewise_construct_t const&,std::tuple<CI::Node const* const&>,std::tuple<>>(v2, (unint64_t *)v6, (uint64_t)&std::piecewise_construct, (uint64_t **)&v6);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = result[7];
  return result;
}

@end
