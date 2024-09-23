@implementation EAREuclid

void __73___EAREuclid_initWithConfiguration_euclidEncoderType_initFlag_overrides___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  void *__p[2];
  uint64_t v12;
  void *v13[2];
  uint64_t v14;
  void **v15;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "ear_toString");
  }
  else
  {
    v13[0] = 0;
    v13[1] = 0;
    v14 = 0;
  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v5)
  {
    objc_msgSend(v5, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    v12 = 0;
  }
  v15 = __p;
  v9 = std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v8 + 48, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v15);
  v10 = v9 + 40;
  if ((char)v9[63] < 0)
    operator delete(*(void **)v10);
  *(_OWORD *)v10 = *(_OWORD *)v13;
  *((_QWORD *)v10 + 2) = v14;
  HIBYTE(v14) = 0;
  LOBYTE(v13[0]) = 0;
  if (SHIBYTE(v12) < 0)
  {
    operator delete(__p[0]);
    if (SHIBYTE(v14) < 0)
      operator delete(v13[0]);
  }

}

void __32___EAREuclid_computeEmbeddings___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "computeEmbedding:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:");

}

@end
