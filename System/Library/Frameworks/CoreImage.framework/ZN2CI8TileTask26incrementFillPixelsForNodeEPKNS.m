@implementation ZN2CI8TileTask26incrementFillPixelsForNodeEPKNS

char *___ZN2CI8TileTask26incrementFillPixelsForNodeEPKNS_4NodeEy_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *result;
  unsigned int *v5;

  v2 = a1[4] + 88;
  v5 = (unsigned int *)(a1[5] + 36);
  std::__hash_table<std::__hash_value_type<CI::NodeIndex,CI::Node::NodeStats>,std::__unordered_map_hasher<CI::NodeIndex,std::__hash_value_type<CI::NodeIndex,CI::Node::NodeStats>,std::hash<CI::NodeIndex>,std::equal_to<CI::NodeIndex>,true>,std::__unordered_map_equal<CI::NodeIndex,std::__hash_value_type<CI::NodeIndex,CI::Node::NodeStats>,std::equal_to<CI::NodeIndex>,std::hash<CI::NodeIndex>,true>,std::allocator<std::__hash_value_type<CI::NodeIndex,CI::Node::NodeStats>>>::__emplace_unique_key_args<CI::NodeIndex,std::piecewise_construct_t const&,std::tuple<CI::NodeIndex const&>,std::tuple<>>(v2, v5, (uint64_t)&std::piecewise_construct, &v5)[80] = 1;
  v3 = a1[6];
  v5 = (unsigned int *)(a1[5] + 36);
  result = std::__hash_table<std::__hash_value_type<CI::NodeIndex,CI::Node::NodeStats>,std::__unordered_map_hasher<CI::NodeIndex,std::__hash_value_type<CI::NodeIndex,CI::Node::NodeStats>,std::hash<CI::NodeIndex>,std::equal_to<CI::NodeIndex>,true>,std::__unordered_map_equal<CI::NodeIndex,std::__hash_value_type<CI::NodeIndex,CI::Node::NodeStats>,std::equal_to<CI::NodeIndex>,std::hash<CI::NodeIndex>,true>,std::allocator<std::__hash_value_type<CI::NodeIndex,CI::Node::NodeStats>>>::__emplace_unique_key_args<CI::NodeIndex,std::piecewise_construct_t const&,std::tuple<CI::NodeIndex const&>,std::tuple<>>(v2, v5, (uint64_t)&std::piecewise_construct, &v5);
  *((_QWORD *)result + 7) += v3;
  return result;
}

@end
