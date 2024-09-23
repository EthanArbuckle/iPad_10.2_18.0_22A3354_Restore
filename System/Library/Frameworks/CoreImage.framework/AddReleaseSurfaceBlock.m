@implementation AddReleaseSurfaceBlock

uint64_t *__AddReleaseSurfaceBlock_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t *v3;
  CI *v4;
  _QWORD *v5;
  _QWORD *v6;
  unint64_t v7;
  CI *v8;
  unint64_t v9;
  BOOL v10;
  _QWORD *v11;
  CI *v12;
  uint64_t **v13;
  uint64_t *result;
  uint64_t *v15;

  v2 = CI::gReleaseSurfaceBlockMap((CI *)a1);
  v3 = (uint64_t *)(a1 + 40);
  v6 = *(_QWORD **)(v2 + 8);
  v4 = (CI *)(v2 + 8);
  v5 = v6;
  if (!v6)
    goto LABEL_12;
  v7 = *v3;
  v8 = v4;
  do
  {
    v9 = v5[4];
    v10 = v9 >= v7;
    if (v9 >= v7)
      v11 = v5;
    else
      v11 = v5 + 1;
    if (v10)
      v8 = (CI *)v5;
    v5 = (_QWORD *)*v11;
  }
  while (*v11);
  if (v8 == v4 || v7 < *((_QWORD *)v8 + 4))
LABEL_12:
    v8 = v4;
  if (v8 != (CI *)(CI::gReleaseSurfaceBlockMap(v4) + 8))
    __AddReleaseSurfaceBlock_block_invoke_cold_1();
  dispatch_retain(*(dispatch_object_t *)(a1 + 40));
  v12 = (CI *)_Block_copy(*(const void **)(a1 + 32));
  v13 = (uint64_t **)CI::gReleaseSurfaceBlockMap(v12);
  v15 = v3;
  result = std::__tree<std::__value_type<unsigned long long,CI::ColorKernelOutputIdx>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,CI::ColorKernelOutputIdx>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,CI::ColorKernelOutputIdx>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(v13, (unint64_t *)v3, (uint64_t)&std::piecewise_construct, &v15);
  result[5] = (uint64_t)v12;
  return result;
}

void __AddReleaseSurfaceBlock_block_invoke_cold_1()
{
  __assert_rtn("AddReleaseSurfaceBlock_block_invoke", "surface-cache.cpp", 1587, "CI::gReleaseSurfaceBlockMap().find(queue) == CI::gReleaseSurfaceBlockMap().end()");
}

@end
