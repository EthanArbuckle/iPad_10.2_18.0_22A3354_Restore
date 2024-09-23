@implementation ADEspressoRunnerV2

- (void)buildBindFormatsMap
{
  uint64_t *v2;
  uint64_t *p_acceptedBindFormats;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  int v39;
  _BYTE __src[12];
  char v41[4];
  uint64_t v42;

  v2 = (uint64_t *)self;
  v42 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)__src = 0x3432306634323076;
  p_acceptedBindFormats = (uint64_t *)&self->_acceptedBindFormats;
  v39 = 0;
  v4 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>((uint64_t *)&self->_acceptedBindFormats, 0, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v4 + 3, __src, &__src[8], 2uLL);
  v39 = 1;
  *(_DWORD *)__src = 1278226488;
  v5 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 1u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v5 + 3, __src, &__src[4], 1uLL);
  v39 = 2;
  *(_DWORD *)__src = 1111970369;
  v6 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 2u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v6 + 3, __src, &__src[4], 1uLL);
  *(_DWORD *)__src = 1380401729;
  v39 = 3;
  v7 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 3u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v7 + 3, __src, &__src[4], 1uLL);
  v39 = 4;
  *(_DWORD *)__src = 843264056;
  v8 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 4u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v8 + 3, __src, &__src[4], 1uLL);
  *(_QWORD *)__src = 0x3434346634343476;
  v39 = 5;
  v9 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 5u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v9 + 3, __src, &__src[8], 2uLL);
  v39 = 6;
  *(_DWORD *)__src = 843264102;
  v10 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 6u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v10 + 3, __src, &__src[4], 1uLL);
  v39 = 7;
  *(_DWORD *)__src = 1278226536;
  v11 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 7u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v11 + 3, __src, &__src[4], 1uLL);
  *(_QWORD *)__src = 0x6864657068646973;
  v2 += 10;
  v39 = 7;
  v12 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(v2, 7u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v12 + 3, __src, &__src[8], 2uLL);
  v39 = 8;
  *(_DWORD *)__src = 32;
  v13 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 8u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v13 + 3, __src, &__src[4], 1uLL);
  v39 = 9;
  *(_DWORD *)__src = 1751410032;
  v14 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 9u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v14 + 3, __src, &__src[4], 1uLL);
  *(_QWORD *)__src = 0x686469734C303068;
  v39 = 9;
  v15 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(v2, 9u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v15 + 3, __src, &__src[8], 2uLL);
  v39 = 10;
  *(_DWORD *)__src = 1751411059;
  v16 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0xAu, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v16 + 3, __src, &__src[4], 1uLL);
  *(_QWORD *)__src = 0x686465704C303068;
  v39 = 10;
  v17 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(v2, 0xAu, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v17 + 3, __src, &__src[8], 2uLL);
  v39 = 11;
  *(_DWORD *)__src = 1380411457;
  v18 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0xBu, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v18 + 3, __src, &__src[4], 1uLL);
  v39 = 12;
  *(_DWORD *)__src = 1380410945;
  v19 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0xCu, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v19 + 3, __src, &__src[4], 1uLL);
  v39 = 13;
  *(_DWORD *)__src = 1278226534;
  v20 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0xDu, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v20 + 3, __src, &__src[4], 1uLL);
  *(_QWORD *)__src = 0x6664657066646973;
  v39 = 13;
  v21 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(v2, 0xDu, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v21 + 3, __src, &__src[8], 2uLL);
  qmemcpy(__src, "024x02fx02wx", sizeof(__src));
  v39 = 14;
  v22 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0xEu, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v22 + 3, __src, v41, 3uLL);
  qmemcpy(__src, "024p02fp02wp", sizeof(__src));
  v39 = 15;
  v23 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0xFu, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v23 + 3, __src, v41, 3uLL);
  v39 = 16;
  *(_DWORD *)__src = 1278226742;
  v24 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0x10u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v24 + 3, __src, &__src[4], 1uLL);
  v39 = 17;
  *(_DWORD *)__src = 642527542;
  v25 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0x11u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v25 + 3, __src, &__src[4], 1uLL);
  v39 = 18;
  *(_DWORD *)__src = 642527336;
  v26 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0x12u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v26 + 3, __src, &__src[4], 1uLL);
  *(_DWORD *)__src = 759967848;
  v39 = 19;
  v27 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0x13u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v27 + 3, __src, &__src[4], 1uLL);
  *(_DWORD *)__src = 793522280;
  v39 = 20;
  v28 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0x14u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v28 + 3, __src, &__src[4], 1uLL);
  *(_DWORD *)__src = 2085367912;
  v39 = 21;
  v29 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0x15u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v29 + 3, __src, &__src[4], 1uLL);
  *(_DWORD *)__src = 641877825;
  v39 = 22;
  v30 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0x16u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v30 + 3, __src, &__src[4], 1uLL);
  v39 = 23;
  *(_DWORD *)__src = 2084718401;
  v31 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0x17u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v31 + 3, __src, &__src[4], 1uLL);
  v39 = 24;
  *(_DWORD *)__src = 2084718401;
  v32 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0x18u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v32 + 3, __src, &__src[4], 1uLL);
  v39 = 25;
  *(_DWORD *)__src = 2084718401;
  v33 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0x19u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v33 + 3, __src, &__src[4], 1uLL);
  *(_DWORD *)__src = 642934849;
  v39 = 26;
  v34 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0x1Au, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v34 + 3, __src, &__src[4], 1uLL);
  *(_DWORD *)__src = 760375361;
  v39 = 27;
  v35 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0x1Bu, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v35 + 3, __src, &__src[4], 1uLL);
  *(_DWORD *)__src = 793929793;
  v39 = 28;
  v36 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0x1Cu, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v36 + 3, __src, &__src[4], 1uLL);
  *(_DWORD *)__src = 2085775425;
  v39 = 29;
  v37 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0x1Du, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v37 + 3, __src, &__src[4], 1uLL);
  *(_QWORD *)__src = 0x2638663026387630;
  v39 = 30;
  v38 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0x1Eu, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v38 + 3, __src, &__src[8], 2uLL);
}

- (ADEspressoRunnerV2)initWithPath:(id)a3 forEngine:(unint64_t)a4 configurationName:(id)a5
{
  ADEspressoRunnerV2 *v9;
  const __CFString *v10;
  NSString *functionName;
  NSPointerArray *dummyOperations;
  uint64_t last_error_message;
  int v14;
  NSString *v15;
  uint64_t v16;
  uint64_t v17;
  NSString *networkVersionString;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  char *v31;
  uint64_t v32;
  ADEspressoRunnerV2 *v33;
  char *v35;
  void **v36;
  id obj;
  char *v38;
  id v39;
  void *__p[2];
  char v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  CFDictionaryRef theDict;
  uint64_t v47;
  objc_super v48;
  int v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void **v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v38 = (char *)a3;
  v39 = a5;
  v49 = 335679304;
  v50 = 0u;
  v51 = 0u;
  kdebug_trace();
  v48.receiver = self;
  v48.super_class = (Class)ADEspressoRunnerV2;
  v9 = -[ADEspressoRunnerV2 init](&v48, sel_init);
  if (!v9)
    goto LABEL_65;
  if (v39)
    v10 = (const __CFString *)v39;
  else
    v10 = CFSTR("main");
  functionName = v9->_functionName;
  v9->_functionName = &v10->isa;

  objc_storeStrong((id *)&v9->_path, a3);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v53 = v38;
    _os_log_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "loading network from: %@", buf, 0xCu);
  }
  v47 = 0;
  dummyOperations = v9->_dummyOperations;
  v9->_dummyOperations = 0;

  v9->_dummyStream = 0;
  -[NSString UTF8String](v9->_path, "UTF8String");
  if (e5rt_program_library_create())
  {
    last_error_message = e5rt_get_last_error_message();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v53 = "e5rt_program_library_create failed";
      _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v53 = (const char *)last_error_message;
      _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
    }
    v14 = 1;
  }
  else
  {
    theDict = 0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v15 = v9->_functionName;
      *(_DWORD *)buf = 138412290;
      v53 = (const char *)v15;
      _os_log_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Espresso runner requested function: %@", buf, 0xCu);
    }
    -[NSString UTF8String](v9->_functionName, "UTF8String");
    if (e5rt_program_library_get_function_metadata())
    {
      v16 = e5rt_get_last_error_message();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v53 = "e5rt_program_library_get_function_metadata failed";
        _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v53 = (const char *)v16;
        _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
      }
      v14 = 1;
    }
    else
    {
      CFDictionaryGetValue(theDict, CFSTR("UserVersion"));
      v17 = objc_claimAutoreleasedReturnValue();
      networkVersionString = v9->_networkVersionString;
      v9->_networkVersionString = (NSString *)v17;

      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v19 = -[NSString UTF8String](v9->_networkVersionString, "UTF8String");
        *(_DWORD *)buf = 136315138;
        v53 = (const char *)v19;
        _os_log_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "network version: %s", buf, 0xCu);
      }
      CFDictionaryGetValue(theDict, CFSTR("Ops"));
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v43;
        v24 = ((0x1Du >> a4) & 1) == 0 || a4 > 4;
        while (2)
        {
          v25 = 0;
          v26 = v20;
          do
          {
            if (*(_QWORD *)v43 != v22)
              objc_enumerationMutation(obj);
            v27 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v25);
            objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("ComputeBackend"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24 || (objc_msgSend(v20, "isEqualToString:", off_2507B24D8[a4]) & 1) == 0)
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("OpName"));
                v35 = (char *)objc_claimAutoreleasedReturnValue();
                ADCommonUtils::espressoEngineAsString(a4, __p);
                if (v41 >= 0)
                  v36 = __p;
                else
                  v36 = (void **)__p[0];
                *(_DWORD *)buf = 138412802;
                v53 = v35;
                v54 = 2112;
                v55 = v20;
                v56 = 2080;
                v57 = v36;
                _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "op '%@' backend (%@) does not match requested engine (%s)", buf, 0x20u);
                if (v41 < 0)
                  operator delete(__p[0]);

              }
              v14 = 1;
              goto LABEL_42;
            }
            ++v25;
            v26 = v20;
          }
          while (v21 != v25);
          v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
          if (v21)
            continue;
          break;
        }
      }

      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v53 = (const char *)v20;
        _os_log_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "network backend is: %@", buf, 0xCu);
      }
      v14 = 0;
LABEL_42:

    }
    if (theDict)
      CFRelease(theDict);
  }
  if (v47 && e5rt_program_library_release())
  {
    v28 = e5rt_get_last_error_message();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v53 = "e5rt_program_library_release failed";
      _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v53 = (const char *)v28;
      _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
    }
    goto LABEL_64;
  }
  if (!v14)
  {
    -[NSString UTF8String](v9->_path, "UTF8String");
    -[NSString UTF8String](v9->_path, "UTF8String");
    -[NSString UTF8String](v9->_functionName, "UTF8String");
    if (e5rt_execution_stream_operation_create_precompiled_compute_operation())
    {
      v29 = e5rt_get_last_error_message();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v53 = "e5rt_execution_stream_operation_create_precompiled_compute_operation failed";
        _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_64;
      *(_DWORD *)buf = 136315138;
      v53 = (const char *)v29;
      v30 = MEMORY[0x24BDACB70];
      goto LABEL_75;
    }
    if (ADDebugUtilsADVerboseLogsEnabled && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      createOperationInputsOutputsDescription(v9->_operation);
      v31 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v53 = v31;
      _os_log_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

    }
    if (e5rt_execution_stream_create())
    {
      v32 = e5rt_get_last_error_message();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v53 = "e5rt_execution_stream_create failed";
        _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_64;
      *(_DWORD *)buf = 136315138;
      v53 = (const char *)v32;
      v30 = MEMORY[0x24BDACB70];
LABEL_75:
      _os_log_error_impl(&dword_236382000, v30, OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
      goto LABEL_64;
    }
LABEL_65:
    v33 = v9;
    goto LABEL_66;
  }
LABEL_64:
  v33 = 0;
LABEL_66:
  InstrumentsTraceGuard::~InstrumentsTraceGuard((InstrumentsTraceGuard *)&v49);

  return v33;
}

- (id)registerDescriptor:(id)a3
{
  id v4;
  ADEspressoRunnerV2 *v5;
  uint64_t last_error_message;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  ADEspressoBufferHandle *v11;
  ADEspressoBufferHandle *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v23 = 335679308;
  v24 = 0u;
  v25 = 0u;
  kdebug_trace();
  v5 = self;
  objc_sync_enter(v5);
  v22 = -[ADEspressoRunnerV2 retainPortForDescriptor:usingOperation:](v5, "retainPortForDescriptor:usingOperation:", v4, v5->_operation);
  if (e5rt_io_port_is_surface())
  {
    last_error_message = e5rt_get_last_error_message();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "e5rt_io_port_is_surface failed";
      _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v27 = (const char *)last_error_message;
      _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
    }
    v7 = 0;
    v8 = 0;
    v9 = 1;
    goto LABEL_8;
  }
  if (!e5rt_io_port_retain_tensor_desc())
  {
    if (e5rt_tensor_desc_get_shape())
    {
      v16 = e5rt_get_last_error_message();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "e5rt_tensor_desc_get_shape failed";
        _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v27 = (const char *)v16;
        _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
      }
      v7 = 0;
      v8 = 0;
LABEL_37:
      v9 = 1;
      goto LABEL_8;
    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 0);
    if (e5rt_tensor_desc_get_strides())
    {
      v17 = e5rt_get_last_error_message();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "e5rt_tensor_desc_get_strides failed";
        _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v27 = (const char *)v17;
        _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
      }
      v7 = 0;
      goto LABEL_37;
    }
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 0);
    if (e5rt_tensor_desc_alloc_buffer_object())
    {
      v18 = e5rt_get_last_error_message();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "e5rt_tensor_desc_alloc_buffer_object failed";
        _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_54;
      *(_DWORD *)buf = 136315138;
      v27 = (const char *)v18;
      v19 = MEMORY[0x24BDACB70];
    }
    else if (e5rt_io_port_bind_buffer_object())
    {
      v20 = e5rt_get_last_error_message();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "e5rt_io_port_bind_buffer_object failed";
        _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_54;
      *(_DWORD *)buf = 136315138;
      v27 = (const char *)v20;
      v19 = MEMORY[0x24BDACB70];
    }
    else
    {
      if (!e5rt_buffer_object_get_data_ptr())
      {
        v9 = 0;
        goto LABEL_8;
      }
      v21 = e5rt_get_last_error_message();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "e5rt_buffer_object_get_data_ptr failed";
        _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_54;
      *(_DWORD *)buf = 136315138;
      v27 = (const char *)v21;
      v19 = MEMORY[0x24BDACB70];
    }
    _os_log_error_impl(&dword_236382000, v19, OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
LABEL_54:
    v9 = 1;
    goto LABEL_8;
  }
  v15 = e5rt_get_last_error_message();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "e5rt_io_port_retain_tensor_desc failed";
    _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v27 = (const char *)v15;
    _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
  }
  v7 = 0;
  v8 = 0;
  v9 = 1;
LABEL_8:
  if (v22 && e5rt_io_port_release())
  {
    v10 = e5rt_get_last_error_message();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "e5rt_io_port_release failed";
      _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v27 = (const char *)v10;
      _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
    }
  }
  else if (!v9)
  {
    v12 = [ADEspressoBufferHandle alloc];
    objc_msgSend(v4, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[ADEspressoBufferHandle initWithName:rawData:dimensions:strides:](v12, "initWithName:rawData:dimensions:strides:", v13, 0, v8, v7);

    goto LABEL_17;
  }
  v11 = 0;
LABEL_17:

  objc_sync_exit(v5);
  InstrumentsTraceGuard::~InstrumentsTraceGuard((InstrumentsTraceGuard *)&v23);

  return v11;
}

- (e5rt_io_port)retainPortForDescriptor:(id)a3 usingOperation:(e5rt_execution_stream_operation *)a4
{
  id v4;
  id v5;
  BOOL v6;
  uint64_t last_error_message;
  NSObject *v8;
  id v9;
  BOOL v10;
  uint64_t v11;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "isInput"))
  {
    objc_msgSend(v4, "name");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "UTF8String");
    v6 = e5rt_execution_stream_operation_retain_input_port() == 0;

    if (!v6)
    {
      last_error_message = e5rt_get_last_error_message();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v13 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v4, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("e5rt_execution_stream_operation_retain_input_port failed on input %@"), v14);
        v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 136315138;
        v20 = objc_msgSend(v15, "UTF8String");
        _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);

      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v20 = last_error_message;
        v8 = MEMORY[0x24BDACB70];
LABEL_13:
        _os_log_error_impl(&dword_236382000, v8, OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
      }
    }
  }
  else
  {
    objc_msgSend(v4, "name");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "UTF8String");
    v10 = e5rt_execution_stream_operation_retain_output_port() == 0;

    if (!v10)
    {
      v11 = e5rt_get_last_error_message();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v16 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v4, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("e5rt_execution_stream_operation_retain_output_port failed on output %@"), v17);
        v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 136315138;
        v20 = objc_msgSend(v18, "UTF8String");
        _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);

      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v20 = v11;
        v8 = MEMORY[0x24BDACB70];
        goto LABEL_13;
      }
    }
  }

  return 0;
}

- (int64_t)registerIOSurface:(__IOSurface *)a3 forDescriptor:(id)a4
{
  return -[ADEspressoRunnerV2 registerIOSurface:forDescriptor:usingOperation:](self, "registerIOSurface:forDescriptor:usingOperation:", a3, a4, self->_operation);
}

- (int64_t)registerIOSurface:(__IOSurface *)a3 forDescriptor:(id)a4 usingOperation:(e5rt_execution_stream_operation *)a5
{
  id v8;
  ADEspressoRunnerV2 *v9;
  uint64_t last_error_message;
  int64_t v11;
  uint64_t v12;
  char *v14;
  uint64_t v15;
  int v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v16 = 335679308;
  v17 = 0u;
  v18 = 0u;
  kdebug_trace();
  if (a3)
  {
    v9 = self;
    objc_sync_enter(v9);
    v15 = -[ADEspressoRunnerV2 retainPortForDescriptor:usingOperation:](v9, "retainPortForDescriptor:usingOperation:", v8, a5);
    if (v15)
    {
      if (e5rt_io_port_is_surface())
      {
        last_error_message = e5rt_get_last_error_message();
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v20 = "e5rt_io_port_is_surface failed";
          _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v20 = (const char *)last_error_message;
          _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
        }
        v11 = -22971;
      }
      else
      {
        v11 = -[ADEspressoRunnerV2 registerIOSurface:forTensorPort:](v9, "registerIOSurface:forTensorPort:", a3, &v15);
      }
      if (!v15 || !e5rt_io_port_release())
        goto LABEL_19;
      v12 = e5rt_get_last_error_message();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v20 = "e5rt_io_port_release failed";
        _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v20 = (const char *)v12;
        _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
      }
    }
    v11 = -22971;
LABEL_19:
    objc_sync_exit(v9);

    goto LABEL_20;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v8, "name");
    v14 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v20 = v14;
    _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "espresso runner failed registering %@: null surface", buf, 0xCu);

  }
  v11 = -22971;
LABEL_20:
  InstrumentsTraceGuard::~InstrumentsTraceGuard((InstrumentsTraceGuard *)&v16);

  return v11;
}

- (int64_t)registerIOSurface:(__IOSurface *)a3 forTensorPort:(e5rt_io_port *)a4
{
  uint64_t last_error_message;
  NSObject *v5;
  uint64_t v6;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (e5rt_buffer_object_create_from_iosurface())
  {
    last_error_message = e5rt_get_last_error_message();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "e5rt_buffer_object_create_from_iosurface failed";
      _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      return -22971;
    *(_DWORD *)buf = 136315138;
    v10 = (const char *)last_error_message;
    v5 = MEMORY[0x24BDACB70];
    goto LABEL_14;
  }
  if (!e5rt_io_port_bind_buffer_object())
    return 0;
  v6 = e5rt_get_last_error_message();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "e5rt_io_port_bind_buffer_object failed";
    _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v10 = (const char *)v6;
    v5 = MEMORY[0x24BDACB70];
LABEL_14:
    _os_log_error_impl(&dword_236382000, v5, OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
  }
  return -22971;
}

- (int64_t)registerIOSurface:(__IOSurface *)a3 forSurfacePort:(e5rt_io_port *)a4 surfaceDesc:(e5rt_surface_desc *)a5
{
  PixelBufferUtils *PixelFormat;
  uint64_t last_error_message;
  uint64_t v8;
  NSObject *v9;
  int64_t v10;
  uint64_t v12;
  _BYTE *v13;
  _BYTE buf[12];
  char v15;
  uint8_t v16[8];
  __int16 v17;
  _BYTE *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  PixelFormat = (PixelBufferUtils *)IOSurfaceGetPixelFormat(a3);
  if (e5rt_surface_desc_get_format())
  {
    last_error_message = e5rt_get_last_error_message();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "e5rt_surface_desc_get_format failed";
      _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      return -22971;
    goto LABEL_5;
  }
  if (!-[ADEspressoRunnerV2 canBindFormat:e5rtFormat:](self, "canBindFormat:e5rtFormat:", PixelFormat, 0))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      PixelBufferUtils::pixelFormatAsString(PixelFormat, buf);
      v13 = v15 >= 0 ? buf : *(_BYTE **)buf;
      *(_DWORD *)v16 = 67109378;
      *(_DWORD *)&v16[4] = 0;
      v17 = 2080;
      v18 = v13;
      _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "unable to bind surface. mismatch in pixel formats. expecting e5rt format %d but got ostype %s", v16, 0x12u);
      if (v15 < 0)
        operator delete(*(void **)buf);
    }
    return -22971;
  }
  *(_QWORD *)v16 = 0;
  if (e5rt_surface_object_create_from_iosurface())
  {
    v8 = e5rt_get_last_error_message();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "e5rt_surface_object_create_from_iosurface failed";
      _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v8;
    v9 = MEMORY[0x24BDACB70];
    goto LABEL_35;
  }
  if (!e5rt_io_port_bind_surface_object())
  {
    v10 = 0;
    goto LABEL_20;
  }
  v12 = e5rt_get_last_error_message();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "e5rt_io_port_bind_surface_object failed";
    _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v12;
    v9 = MEMORY[0x24BDACB70];
LABEL_35:
    _os_log_error_impl(&dword_236382000, v9, OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
  }
LABEL_19:
  v10 = -22971;
LABEL_20:
  if (*(_QWORD *)v16 && e5rt_surface_object_release())
  {
    last_error_message = e5rt_get_last_error_message();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "e5rt_surface_object_release failed";
      _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      return -22971;
LABEL_5:
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = last_error_message;
    _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
    return -22971;
  }
  return v10;
}

- (__CVBuffer)createAndRegisterPixelBufferForDescriptor:(id)a3
{
  id v4;
  int64_t v5;
  __CVBuffer *v6;
  CVPixelBufferRef texture;

  v4 = a3;
  texture = 0;
  v5 = -[ADEspressoRunnerV2 registerPixelBufferPtr:forDescriptor:](self, "registerPixelBufferPtr:forDescriptor:", &texture, v4);
  v6 = texture;
  if (v5)
  {
    CVPixelBufferRelease(texture);
    v6 = 0;
  }

  return v6;
}

- (int64_t)registerPixelBufferPtr:(__CVBuffer *)a3 forDescriptor:(id)a4 forSurfacePort:(e5rt_io_port *)a5
{
  id v8;
  uint64_t last_error_message;
  NSObject *v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  __CVBuffer *v19;
  void *v20;
  IOSurfaceRef IOSurface;
  id v22;
  uint64_t v23;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  if (v8)
  {
    if (e5rt_io_port_retain_surface_desc())
    {
      last_error_message = e5rt_get_last_error_message();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v25 = "e5rt_io_port_retain_surface_desc failed";
        _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_33;
      *(_DWORD *)buf = 136315138;
      v25 = (const char *)last_error_message;
      v10 = MEMORY[0x24BDACB70];
LABEL_32:
      _os_log_error_impl(&dword_236382000, v10, OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
LABEL_33:
      v11 = -22971;
      goto LABEL_34;
    }
    if (e5rt_surface_desc_get_width())
    {
      v12 = e5rt_get_last_error_message();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v25 = "e5rt_surface_desc_get_width failed";
        _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_33;
      *(_DWORD *)buf = 136315138;
      v25 = (const char *)v12;
      v10 = MEMORY[0x24BDACB70];
      goto LABEL_32;
    }
    if (e5rt_surface_desc_get_height())
    {
      v13 = e5rt_get_last_error_message();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v25 = "e5rt_surface_desc_get_height failed";
        _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_33;
      *(_DWORD *)buf = 136315138;
      v25 = (const char *)v13;
      v10 = MEMORY[0x24BDACB70];
      goto LABEL_32;
    }
    if (e5rt_surface_desc_get_format())
    {
      v14 = e5rt_get_last_error_message();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v25 = "e5rt_surface_desc_get_format failed";
        _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_33;
      *(_DWORD *)buf = 136315138;
      v25 = (const char *)v14;
      v10 = MEMORY[0x24BDACB70];
      goto LABEL_32;
    }
    if (e5rt_surface_desc_get_custom_row_strides())
    {
      v17 = e5rt_get_last_error_message();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v25 = "e5rt_surface_desc_get_custom_row_strides failed";
        _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_33;
      *(_DWORD *)buf = 136315138;
      v25 = (const char *)v17;
      v10 = MEMORY[0x24BDACB70];
      goto LABEL_32;
    }
    v19 = *a3;
    if (!*a3)
    {
      objc_msgSend(v8, "imageDescriptor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *a3 = PixelBufferUtils::createPixelBuffer(0, 0, objc_msgSend(v20, "pixelFormat"), 1);

      v19 = *a3;
      if (!*a3)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v8, "name");
          v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v23 = objc_msgSend(v22, "UTF8String");
          *(_DWORD *)buf = 136315138;
          v25 = (const char *)v23;
          _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed allocating CVPixelBuffer for \"%s\", buf, 0xCu);

        }
        goto LABEL_33;
      }
    }
    IOSurface = CVPixelBufferGetIOSurface(v19);
    if (IOSurface)
    {
      v11 = -[ADEspressoRunnerV2 registerIOSurface:forSurfacePort:surfaceDesc:](self, "registerIOSurface:forSurfacePort:surfaceDesc:", IOSurface, a5, 0);
      goto LABEL_34;
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    *(_WORD *)buf = 0;
    v15 = MEMORY[0x24BDACB70];
    v16 = "Provided pixelbuffer is not io-surface backed";
LABEL_25:
    _os_log_error_impl(&dword_236382000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
LABEL_26:
    v11 = -22953;
    goto LABEL_34;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v15 = MEMORY[0x24BDACB70];
    v16 = "cannot register buffer for nil descriptor";
    goto LABEL_25;
  }
  v11 = -22953;
LABEL_34:

  return v11;
}

- (BOOL)canBindFormat:(unsigned int)a3 e5rtFormat:(int)a4
{
  uint64_t last_error_message;
  _BOOL4 v6;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (e5rt_cvpb_4cc_to_surface_format())
  {
    last_error_message = e5rt_get_last_error_message();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "e5rt_cvpb_4cc_to_surface_format failed";
      _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }
    v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v6)
    {
      *(_DWORD *)buf = 136315138;
      v9 = (const char *)last_error_message;
      _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = a4 == 0;
  }
  return v6;
}

- (int64_t)registerPixelBufferPtr:(__CVBuffer *)a3 forDescriptor:(id)a4 forTensorPort:(e5rt_io_port *)a5
{
  id v8;
  __CVBuffer *v9;
  IOSurfaceRef IOSurface;
  int64_t v11;
  uint64_t last_error_message;
  int v13;
  uint64_t v14;
  size_t v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  size_t v21;
  void *v22;
  OSType v23;
  const __CFDictionary *BufferAttributes;
  CVReturn v25;
  __CVBuffer *v26;
  id v28;
  uint64_t v29;
  uint64_t v30;
  CVPixelBufferRef pixelBufferOut;
  uint8_t buf[4];
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = *a3;
  if (!*a3)
  {
    if (e5rt_io_port_retain_tensor_desc())
    {
      last_error_message = e5rt_get_last_error_message();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v33 = "e5rt_io_port_retain_tensor_desc failed";
        _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v33 = (const char *)last_error_message;
        _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
      }
      v13 = 1;
    }
    else if (e5rt_tensor_desc_get_shape())
    {
      v14 = e5rt_get_last_error_message();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v33 = "e5rt_tensor_desc_get_shape failed";
        _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v33 = (const char *)v14;
        _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
      }
      v13 = 1;
    }
    else
    {
      v15 = MEMORY[0xFFFFFFFFFFFFFFF0];
      objc_msgSend(v8, "imageDescriptor", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (PixelBufferUtils::componentsPerPixelForPixelFormat((PixelBufferUtils *)objc_msgSend(v16, "pixelFormat"), 0) == 1)
      {
        objc_msgSend(v8, "imageDescriptor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = PixelBufferUtils::planeCountForPixelFormat((PixelBufferUtils *)objc_msgSend(v17, "pixelFormat")) == 0;

        v19 = v30;
        if (v18 && v30 != 2)
        {
          v20 = 0;
          do
            v15 *= *(_QWORD *)(8 * v20++);
          while (v30 - 2 != v20);
        }
      }
      else
      {

        v19 = v30;
      }
      v21 = *(_QWORD *)(8 * v19 - 8);
      objc_msgSend(v8, "imageDescriptor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "pixelFormat");
      pixelBufferOut = 0;
      BufferAttributes = (const __CFDictionary *)getBufferAttributes();
      v25 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v21, v15, v23, BufferAttributes, &pixelBufferOut);
      v26 = pixelBufferOut;
      if (v25)
        v26 = 0;
      *a3 = v26;

      v13 = 0;
    }
    if (!v13)
    {
      v9 = *a3;
      if (*a3)
        goto LABEL_2;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "name");
        v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v29 = objc_msgSend(v28, "UTF8String");
        *(_DWORD *)buf = 136315138;
        v33 = (const char *)v29;
        _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed allocating CVPixelBuffer for \"%s\", buf, 0xCu);

      }
    }
    v11 = -22971;
    goto LABEL_31;
  }
LABEL_2:
  IOSurface = CVPixelBufferGetIOSurface(v9);
  if (IOSurface)
  {
    v11 = -[ADEspressoRunnerV2 registerIOSurface:forTensorPort:](self, "registerIOSurface:forTensorPort:", IOSurface, a5);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Provided pixelbuffer is not io-surface backed", buf, 2u);
    }
    v11 = -22953;
  }
LABEL_31:

  return v11;
}

- (int64_t)registerPixelBufferPtr:(__CVBuffer *)a3 forDescriptor:(id)a4
{
  return -[ADEspressoRunnerV2 registerPixelBufferPtr:forDescriptor:usingOperation:](self, "registerPixelBufferPtr:forDescriptor:usingOperation:", a3, a4, self->_operation);
}

- (int64_t)registerPixelBufferPtr:(__CVBuffer *)a3 forDescriptor:(id)a4 usingOperation:(e5rt_execution_stream_operation *)a5
{
  id v8;
  ADEspressoRunnerV2 *v9;
  uint64_t last_error_message;
  int64_t v11;
  uint64_t v12;
  uint64_t v14;
  int v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v15 = 335679308;
  v16 = 0u;
  v17 = 0u;
  kdebug_trace();
  v9 = self;
  objc_sync_enter(v9);
  if (v8)
  {
    v14 = -[ADEspressoRunnerV2 retainPortForDescriptor:usingOperation:](v9, "retainPortForDescriptor:usingOperation:", v8, a5);
    if (!v14)
    {
LABEL_19:
      v11 = -22971;
      goto LABEL_20;
    }
    if (e5rt_io_port_is_surface())
    {
      last_error_message = e5rt_get_last_error_message();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "e5rt_io_port_is_surface failed";
        _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v19 = (const char *)last_error_message;
        _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
      }
      v11 = -22971;
    }
    else
    {
      v11 = -[ADEspressoRunnerV2 registerPixelBufferPtr:forDescriptor:forTensorPort:](v9, "registerPixelBufferPtr:forDescriptor:forTensorPort:", a3, v8, &v14);
    }
    if (v14 && e5rt_io_port_release())
    {
      v12 = e5rt_get_last_error_message();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "e5rt_io_port_release failed";
        _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v19 = (const char *)v12;
        _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
      }
      goto LABEL_19;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "cannot register buffer for nil descriptor", buf, 2u);
    }
    v11 = -22953;
  }
LABEL_20:
  objc_sync_exit(v9);

  InstrumentsTraceGuard::~InstrumentsTraceGuard((InstrumentsTraceGuard *)&v15);
  return v11;
}

- (int64_t)registerPixelBuffer:(__CVBuffer *)a3 forDescriptor:(id)a4
{
  __CVBuffer *v5;

  v5 = a3;
  return -[ADEspressoRunnerV2 registerPixelBufferPtr:forDescriptor:](self, "registerPixelBufferPtr:forDescriptor:", &v5, a4);
}

- (int64_t)updateFeedbackLoopInputBuffer:(__CVBuffer *)a3 inputDescriptor:(id)a4 outputBuffer:(__CVBuffer *)a5 outputDescriptor:(id)a6
{
  id v10;
  id v11;
  size_t Width;
  size_t v13;
  OSType PixelFormatType;
  __CVBuffer *v15;
  int64_t v16;
  id v17;
  PixelBufferUtils *v19;
  _BYTE *v20;
  PixelBufferUtils *v21;
  void **v22;
  id v23;
  size_t v24;
  size_t Height;
  size_t v26;
  size_t v27;
  void *__p[2];
  char v29;
  uint8_t v30[4];
  _BYTE *v31;
  __int16 v32;
  void **v33;
  _BYTE buf[12];
  __int16 v35;
  size_t v36;
  __int16 v37;
  size_t v38;
  __int16 v39;
  size_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a6;
  Width = CVPixelBufferGetWidth(*a3);
  if (Width != CVPixelBufferGetWidth(*a5) || (v13 = CVPixelBufferGetHeight(*a3), v13 != CVPixelBufferGetHeight(*a5)))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v24 = CVPixelBufferGetWidth(*a3);
      Height = CVPixelBufferGetHeight(*a3);
      v26 = CVPixelBufferGetWidth(*a5);
      v27 = CVPixelBufferGetHeight(*a5);
      *(_DWORD *)buf = 134218752;
      *(_QWORD *)&buf[4] = v24;
      v35 = 2048;
      v36 = Height;
      v37 = 2048;
      v38 = v26;
      v39 = 2048;
      v40 = v27;
      _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Input and output pixel buffers have different dimensions (%zux%zu) vs (%zux%zu)", buf, 0x2Au);
    }
    goto LABEL_9;
  }
  PixelFormatType = CVPixelBufferGetPixelFormatType(*a3);
  if (PixelFormatType != CVPixelBufferGetPixelFormatType(*a5))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v19 = (PixelBufferUtils *)CVPixelBufferGetPixelFormatType(*a3);
      v20 = buf;
      PixelBufferUtils::pixelFormatAsString(v19, buf);
      if (v37 < 0)
        v20 = *(_BYTE **)buf;
      v21 = (PixelBufferUtils *)CVPixelBufferGetPixelFormatType(*a5);
      PixelBufferUtils::pixelFormatAsString(v21, (char *)__p);
      if (v29 >= 0)
        v22 = __p;
      else
        v22 = (void **)__p[0];
      *(_DWORD *)v30 = 136315394;
      v31 = v20;
      v32 = 2080;
      v33 = v22;
      _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Input and output pixel buffers have different formats (%s) vs (%s)", v30, 0x16u);
      if (v29 < 0)
        operator delete(__p[0]);
      if (SHIBYTE(v37) < 0)
        operator delete(*(void **)buf);
    }
LABEL_9:
    v16 = -22953;
    goto LABEL_10;
  }
  v15 = *a3;
  *a3 = *a5;
  *a5 = v15;
  v16 = -[ADEspressoRunnerV2 registerPixelBuffer:forDescriptor:](self, "registerPixelBuffer:forDescriptor:", *a3, v10);
  if (v16)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "name");
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = objc_msgSend(v17, "UTF8String");
      _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed to re-register %s", buf, 0xCu);

    }
  }
  else
  {
    v16 = -[ADEspressoRunnerV2 registerPixelBuffer:forDescriptor:](self, "registerPixelBuffer:forDescriptor:", *a5, v11);
    if (v16 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "name");
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = objc_msgSend(v23, "UTF8String");
      _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed to re-register %s", buf, 0xCu);

    }
  }
LABEL_10:

  return v16;
}

- (void)unwireAllSurfaces
{
  NSPointerArray *dummyOperations;
  uint8_t v4[16];

  if (ADDebugUtilsADVerboseLogsEnabled && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "resetting dummy operations for espressoV2 runner", v4, 2u);
  }
  dummyOperations = self->_dummyOperations;
  self->_dummyOperations = 0;

}

- (int64_t)prewireSurfaces:(id)a3 toDescriptors:(id)a4
{
  id v6;
  NSObject *v7;
  const char *v8;
  uint32_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  unint64_t v16;
  uint64_t v17;
  NSObject *v18;
  char *v19;
  char *v20;
  int64_t v21;
  unint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  void *v31;
  uint64_t last_error_message;
  unint64_t v33;
  uint64_t v34;
  NSObject *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  unint64_t v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v40 = v6;
  v41 = a4;
  if (self->_dummyOperations)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v7 = MEMORY[0x24BDACB70];
      v8 = "buffers already prewired. cannot prewire a second time";
      v9 = 2;
LABEL_36:
      _os_log_error_impl(&dword_236382000, v7, OS_LOG_TYPE_ERROR, v8, buf, v9);
    }
LABEL_37:
    v21 = -22967;
    goto LABEL_38;
  }
  if (!v6 || !v41)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_37;
    *(_DWORD *)buf = 134218240;
    v48 = (const char *)v6;
    v49 = 2048;
    v50 = (uint64_t)v41;
    v7 = MEMORY[0x24BDACB70];
    v8 = "nil inputs in prewire method: %p, %p";
LABEL_35:
    v9 = 22;
    goto LABEL_36;
  }
  v10 = objc_msgSend(v6, "count");
  if (v10 != objc_msgSend(v41, "count"))
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_37;
    *(_DWORD *)buf = 134218240;
    v48 = (const char *)objc_msgSend(v41, "count");
    v49 = 2048;
    v50 = objc_msgSend(v6, "count");
    v7 = MEMORY[0x24BDACB70];
    v8 = "cannot prewire buffers: number of descriptors %lu does not match number of surface arrays %lu.";
    goto LABEL_35;
  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v11 = v6;
  v12 = 0;
  v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v44 != v14)
          objc_enumerationMutation(v11);
        v16 = objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "count");
        if ((unint64_t)v12 <= v16)
          v12 = (const char *)v16;
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    }
    while (v13);
  }

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v48 = v12;
    _os_log_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "creating %lu dummy stream operations for prewiring", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDD1750], "pointerFunctionsWithOptions:", 514);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setRelinquishFunction:", dummyOpRelinquishFunction);
  objc_msgSend(v39, "setSizeFunction:", dummyOpSizeFunction);
  objc_msgSend(MEMORY[0x24BDD1748], "pointerArrayWithPointerFunctions:", v39);
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v17 = 0;
    v18 = MEMORY[0x24BDACB70];
    while (1)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@__op%lu"), self->_path, v17);
      v19 = (char *)objc_claimAutoreleasedReturnValue();
      if (ADDebugUtilsADVerboseLogsEnabled && os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v48 = v19;
        _os_log_impl(&dword_236382000, v18, OS_LOG_TYPE_DEFAULT, "creating dummey operation %@.", buf, 0xCu);
      }
      v20 = objc_retainAutorelease(v19);
      objc_msgSend(v20, "UTF8String");
      -[NSString UTF8String](self->_path, "UTF8String");
      -[NSString UTF8String](self->_functionName, "UTF8String");
      if (e5rt_execution_stream_operation_create_precompiled_compute_operation())
        break;
      if (ADDebugUtilsADVerboseLogsEnabled)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v48 = 0;
          _os_log_impl(&dword_236382000, v18, OS_LOG_TYPE_DEFAULT, "registered dummy op %p", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v48 = 0;
        _os_log_debug_impl(&dword_236382000, v18, OS_LOG_TYPE_DEBUG, "registered dummy op %p", buf, 0xCu);
      }
      objc_msgSend(obj, "addPointer:", 0);

      if (v12 == (const char *)++v17)
        goto LABEL_39;
    }
    last_error_message = e5rt_get_last_error_message();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v48 = "failed creating dummy stream operation";
      _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v48 = (const char *)last_error_message;
      _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
    }

  }
  else
  {
LABEL_39:
    v23 = 0;
    v24 = MEMORY[0x24BDACB70];
    while (v23 < objc_msgSend(v41, "count"))
    {
      objc_msgSend(v41, "objectAtIndexedSubscript:", v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v23);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (ADDebugUtilsADVerboseLogsEnabled && os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v27 = objc_msgSend(v26, "count");
        objc_msgSend(v25, "name");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v48 = (const char *)v27;
        v49 = 2112;
        v50 = (uint64_t)v28;
        _os_log_impl(&dword_236382000, v24, OS_LOG_TYPE_DEFAULT, "prewiring %lu surfaces to input %@", buf, 0x16u);

      }
      if (v12)
      {
        v29 = 0;
        while (1)
        {
          objc_msgSend(v26, "objectAtIndexedSubscript:", (unint64_t)v29 % objc_msgSend(v26, "count"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          v21 = -[ADEspressoRunnerV2 registerIOSurface:forDescriptor:usingOperation:](self, "registerIOSurface:forDescriptor:usingOperation:", v30, v25, objc_msgSend(obj, "pointerAtIndex:", v29));
          if (v21)
            break;
          if (ADDebugUtilsADVerboseLogsEnabled && os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v25, "name");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218498;
            v48 = v29;
            v49 = 2112;
            v50 = (uint64_t)v31;
            v51 = 2048;
            v52 = v23;
            _os_log_impl(&dword_236382000, v24, OS_LOG_TYPE_DEFAULT, "registered surface idx %lu from descriptor %@ to dummy op %lu", buf, 0x20u);

          }
          if (v12 == ++v29)
            goto LABEL_51;
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v25, "name");
          v36 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v48 = v36;
          v49 = 2048;
          v50 = (uint64_t)v30;
          _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed to prewire %@: unable to bind iosurface %p", buf, 0x16u);

        }
        goto LABEL_61;
      }
LABEL_51:

      ++v23;
    }
    if (self->_dummyStream)
      goto LABEL_63;
    if (ADDebugUtilsADVerboseLogsEnabled)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "creating dummy stream for prewiring", buf, 2u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "creating dummy stream for prewiring", buf, 2u);
    }
    if (!e5rt_execution_stream_create())
    {
LABEL_63:
      v33 = 0;
      while (v33 < objc_msgSend(obj, "count"))
      {
        objc_msgSend(obj, "pointerAtIndex:", v33++);
        if (e5rt_execution_stream_encode_operation())
        {
          v34 = e5rt_get_last_error_message();
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v48 = "failed encoding dummy operation to stream";
            _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
          }
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v48 = (const char *)v34;
            v35 = MEMORY[0x24BDACB70];
            goto LABEL_86;
          }
          goto LABEL_60;
        }
      }
      if (!e5rt_execution_stream_prewire_in_use_allocations())
      {
        objc_storeStrong((id *)&self->_dummyOperations, obj);
        v21 = 0;
        goto LABEL_61;
      }
      v37 = e5rt_get_last_error_message();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v48 = "failed prewiring stream";
        _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v48 = (const char *)v37;
        v35 = MEMORY[0x24BDACB70];
        goto LABEL_86;
      }
    }
    else
    {
      v38 = e5rt_get_last_error_message();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v48 = "failed creating dummy stream";
        _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v48 = (const char *)v38;
        v35 = MEMORY[0x24BDACB70];
LABEL_86:
        _os_log_error_impl(&dword_236382000, v35, OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
      }
    }
  }
LABEL_60:
  v21 = -22967;
LABEL_61:

LABEL_38:
  return v21;
}

- (int64_t)execute
{
  ADEspressoRunnerV2 *v2;
  uint64_t last_error_message;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  int v9;
  __int128 v10;
  __int128 v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  v9 = 335678456;
  v10 = 0u;
  v11 = 0u;
  kdebug_trace();
  if (e5rt_execution_stream_encode_operation())
  {
    last_error_message = e5rt_get_last_error_message();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "e5rt_execution_stream_encode_operation failed";
      _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_DWORD *)buf = 136315138;
    v13 = (const char *)last_error_message;
    v4 = MEMORY[0x24BDACB70];
    goto LABEL_16;
  }
  if (e5rt_execution_stream_execute_sync())
  {
    v5 = e5rt_get_last_error_message();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "e5rt_execution_stream_execute_sync failed";
      _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_DWORD *)buf = 136315138;
    v13 = (const char *)v5;
    v4 = MEMORY[0x24BDACB70];
    goto LABEL_16;
  }
  if (!e5rt_execution_stream_reset())
  {
    v7 = 0;
    goto LABEL_18;
  }
  v6 = e5rt_get_last_error_message();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "e5rt_execution_stream_reset failed";
    _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v13 = (const char *)v6;
    v4 = MEMORY[0x24BDACB70];
LABEL_16:
    _os_log_error_impl(&dword_236382000, v4, OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
  }
LABEL_17:
  v7 = -22968;
LABEL_18:
  InstrumentsTraceGuard::~InstrumentsTraceGuard((InstrumentsTraceGuard *)&v9);
  objc_sync_exit(v2);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_operation)
    e5rt_execution_stream_operation_release();
  if (self->_stream)
    e5rt_execution_stream_release();
  if (self->_dummyStream)
    e5rt_execution_stream_release();
  v3.receiver = self;
  v3.super_class = (Class)ADEspressoRunnerV2;
  -[ADEspressoRunnerV2 dealloc](&v3, sel_dealloc);
}

- (NSString)networkVersionString
{
  return self->_networkVersionString;
}

- (e5rt_execution_stream_operation)operation
{
  return self->_operation;
}

- (void)setOperation:(e5rt_execution_stream_operation *)a3
{
  self->_operation = a3;
}

- (e5rt_execution_stream)stream
{
  return self->_stream;
}

- (void)setStream:(e5rt_execution_stream *)a3
{
  self->_stream = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkVersionString, 0);
  std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::~__hash_table((uint64_t)&self->_alternateBindFormats);
  std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::~__hash_table((uint64_t)&self->_acceptedBindFormats);
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_dummyOperations, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *((_DWORD *)self + 18) = 1065353216;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_DWORD *)self + 28) = 1065353216;
  return self;
}

@end
