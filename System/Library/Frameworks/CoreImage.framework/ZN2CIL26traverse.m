@implementation ZN2CIL26traverse

uint64_t **___ZN2CIL26traverse_gathering_digestsEPKNS_7ContextEPNS_5ImageERNSt3__13mapINS_10ImageIndexENS_30ImageDigestForRenderGraphCacheENS5_4lessIS7_EENS5_9allocatorINS5_4pairIKS7_S8_EEEEEE_block_invoke(uint64_t a1, _DWORD *a2, int a3)
{
  _DWORD *v6;
  _DWORD *v7;
  _DWORD *v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  unsigned int v19;
  BOOL v20;
  uint64_t *v21;
  unint64_t v22;
  uint64_t **v23;
  uint64_t **result;
  _DWORD *v25[4];
  int64x2_t v26[5];

  XXH64_reset(v26, 0);
  LOBYTE(v25[0]) = (*(uint64_t (**)(_DWORD *))(*(_QWORD *)a2 + 16))(a2);
  XXH64_update((uint64_t)v26, (char *)v25, 1uLL);
  v25[0] = COERCE__DWORD_((*(double (**)(_DWORD *))(*(_QWORD *)a2 + 88))(a2));
  v25[1] = v6;
  v25[2] = v7;
  v25[3] = v8;
  XXH64_update((uint64_t)v26, (char *)v25, 0x20uLL);
  LODWORD(v25[0]) = (*(uint64_t (**)(_DWORD *))(*(_QWORD *)a2 + 40))(a2);
  XXH64_update((uint64_t)v26, (char *)v25, 4uLL);
  LODWORD(v25[0]) = a3;
  XXH64_update((uint64_t)v26, (char *)v25, 4uLL);
  (*(void (**)(_DWORD *, int64x2_t *, uint64_t))(*(_QWORD *)a2 + 104))(a2, v26, 1);
  v9 = (*(uint64_t (**)(_DWORD *))(*(_QWORD *)a2 + 40))(a2);
  if (v9 >= 1)
  {
    v10 = v9;
    v11 = 0;
    do
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = (*(uint64_t (**)(_DWORD *, uint64_t))(*(_QWORD *)a2 + 48))(a2, v11);
      v16 = *(_QWORD *)(v12 + 8);
      v15 = v12 + 8;
      v14 = v16;
      if (!v16)
        goto LABEL_14;
      v17 = *(_DWORD *)(v13 + 100);
      v18 = v15;
      do
      {
        v19 = *(_DWORD *)(v14 + 32);
        v20 = v19 >= v17;
        if (v19 >= v17)
          v21 = (uint64_t *)v14;
        else
          v21 = (uint64_t *)(v14 + 8);
        if (v20)
          v18 = v14;
        v14 = *v21;
      }
      while (*v21);
      if (v18 == v15 || v17 < *(_DWORD *)(v18 + 32))
LABEL_14:
        v18 = v15;
      v25[0] = *(_DWORD **)(v18 + 40);
      XXH64_update((uint64_t)v26, (char *)v25, 8uLL);
      v11 = (v11 + 1);
    }
    while ((_DWORD)v11 != v10);
  }
  v22 = XXH64_digest((uint64_t)v26);
  v23 = *(uint64_t ***)(a1 + 32);
  v25[0] = a2 + 25;
  result = std::__tree<std::__value_type<CI::NodeIndex,unsigned long>,std::__map_value_compare<CI::NodeIndex,std::__value_type<CI::NodeIndex,unsigned long>,std::less<CI::NodeIndex>,true>,std::allocator<std::__value_type<CI::NodeIndex,unsigned long>>>::__emplace_unique_key_args<CI::NodeIndex,std::piecewise_construct_t const&,std::tuple<CI::NodeIndex const&>,std::tuple<>>(v23, a2 + 25, (uint64_t)&std::piecewise_construct, v25);
  result[5] = (uint64_t *)v22;
  return result;
}

@end
