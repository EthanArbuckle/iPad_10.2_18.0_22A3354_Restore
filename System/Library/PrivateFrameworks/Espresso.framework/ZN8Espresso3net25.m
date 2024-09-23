@implementation ZN8Espresso3net25

uint64_t **___ZN8Espresso3net25_bench_layer_and_childrenEii_block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  uint64_t v5;
  _DWORD *v6;
  uint64_t v7;
  uint64_t **result;
  int *v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;

  v4 = 0;
  v5 = *(_QWORD *)(a1 + 40);
  v6 = (_DWORD *)(a1 + 52);
  do
  {
    v7 = *(_QWORD *)(*(_QWORD *)(v5 + 32) + 16 * *(int *)(a1 + 52));
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v7 + 8))(v7, a2);
    result = std::__tree<std::__value_type<int,std::vector<int>>,std::__map_value_compare<int,std::__value_type<int,std::vector<int>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<int>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 64), *(_DWORD *)(a1 + 52), v6);
    v9 = (int *)result[5];
    v10 = (int *)result[6];
    while (v9 != v10)
    {
      v11 = *v9++;
      v12 = *(_QWORD *)(*(_QWORD *)(v5 + 32) + 16 * v11);
      result = (uint64_t **)(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v12 + 8))(v12, a2);
    }
    ++v4;
    v13 = *(_DWORD *)(a1 + 48) / 2;
    if (v13 <= 2)
      v13 = 2;
  }
  while (v4 < v13);
  return result;
}

uint64_t **___ZN8Espresso3net25_bench_layer_and_childrenEii_block_invoke_2(uint64_t **result, uint64_t a2)
{
  uint64_t **v3;
  int v4;
  uint64_t *v5;
  _DWORD *v6;
  uint64_t v7;
  int *v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;

  if (*((int *)result + 12) >= 1)
  {
    v3 = result;
    v4 = 0;
    v5 = result[5];
    v6 = (_DWORD *)result + 13;
    do
    {
      v7 = *(_QWORD *)(v5[4] + 16 * *((int *)v3 + 13));
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v7 + 8))(v7, a2);
      result = std::__tree<std::__value_type<int,std::vector<int>>,std::__map_value_compare<int,std::__value_type<int,std::vector<int>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<int>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t **)(v3[4][1] + 64), *((_DWORD *)v3 + 13), v6);
      v8 = (int *)result[5];
      v9 = (int *)result[6];
      while (v8 != v9)
      {
        v10 = *v8++;
        v11 = *(_QWORD *)(v5[4] + 16 * v10);
        result = (uint64_t **)(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v11 + 8))(v11, a2);
      }
      ++v4;
    }
    while (v4 < *((_DWORD *)v3 + 12));
  }
  return result;
}

@end
