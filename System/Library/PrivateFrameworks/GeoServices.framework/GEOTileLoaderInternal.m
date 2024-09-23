@implementation GEOTileLoaderInternal

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = (char *)self + 8;
  *((_QWORD *)self + 2) = (char *)self + 8;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = (char *)self + 56;
  *((_QWORD *)self + 8) = (char *)self + 56;
  *((_QWORD *)self + 9) = 0;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  return self;
}

- (void).cxx_destruct
{
  void **v3;
  void **v4;
  _QWORD *v5;
  unint64_t v6;
  void **v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  GEOTileLoaderInternal *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  GEOTileLoaderInternal *v25;
  uint64_t v26;
  GEOTileLoaderInternal *v27;

  v3 = (void **)*((_QWORD *)self + 13);
  v4 = (void **)*((_QWORD *)self + 14);
  if (v4 == v3)
  {
    v5 = (_QWORD *)((char *)self + 136);
    v4 = (void **)*((_QWORD *)self + 13);
  }
  else
  {
    v5 = (_QWORD *)((char *)self + 136);
    v6 = *((_QWORD *)self + 16);
    v7 = &v3[v6 / 0x49];
    v8 = (unint64_t)*v7 + 56 * (v6 % 0x49);
    v9 = (unint64_t)v3[(*((_QWORD *)self + 17) + v6) / 0x49] + 56 * ((*((_QWORD *)self + 17) + v6) % 0x49);
    if (v8 != v9)
    {
      do
      {
        std::__list_imp<std::__list_iterator<LoadItem,void *>>::clear((_QWORD *)(v8 + 32));
        *(_QWORD *)(v8 + 8) = &off_1E1BF64A0;

        v8 += 56;
        if (v8 - (_QWORD)*v7 == 4088)
        {
          v10 = (unint64_t)v7[1];
          ++v7;
          v8 = v10;
        }
      }
      while (v8 != v9);
      v3 = (void **)*((_QWORD *)self + 13);
      v4 = (void **)*((_QWORD *)self + 14);
    }
  }
  *v5 = 0;
  v11 = (char *)v4 - (char *)v3;
  if ((unint64_t)((char *)v4 - (char *)v3) >= 0x11)
  {
    do
    {
      operator delete(*v3);
      v4 = (void **)*((_QWORD *)self + 14);
      v3 = (void **)(*((_QWORD *)self + 13) + 8);
      *((_QWORD *)self + 13) = v3;
      v11 = (char *)v4 - (char *)v3;
    }
    while ((unint64_t)((char *)v4 - (char *)v3) > 0x10);
  }
  v12 = v11 >> 3;
  if (v12 == 1)
  {
    v13 = 36;
    goto LABEL_14;
  }
  if (v12 == 2)
  {
    v13 = 73;
LABEL_14:
    *((_QWORD *)self + 16) = v13;
  }
  if (v3 != v4)
  {
    do
    {
      v14 = *v3++;
      operator delete(v14);
    }
    while (v3 != v4);
    v16 = *((_QWORD *)self + 13);
    v15 = *((_QWORD *)self + 14);
    if (v15 != v16)
      *((_QWORD *)self + 14) = v15 + ((v16 - v15 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  v17 = (void *)*((_QWORD *)self + 12);
  if (v17)
    operator delete(v17);
  if (*((_QWORD *)self + 9))
  {
    v19 = *((_QWORD *)self + 7);
    v18 = *((_QWORD *)self + 8);
    v20 = *(_QWORD *)v18;
    *(_QWORD *)(v20 + 8) = *(_QWORD *)(v19 + 8);
    **(_QWORD **)(v19 + 8) = v20;
    *((_QWORD *)self + 9) = 0;
    if ((GEOTileLoaderInternal *)v18 != (GEOTileLoaderInternal *)((char *)self + 56))
    {
      do
      {
        v21 = *(GEOTileLoaderInternal **)(v18 + 8);
        std::__list_imp<_CacheRequester<void({block_pointer} {__strong})(unsigned long long)>>::__delete_node[abi:ne180100]<>(v18);
        v18 = (uint64_t)v21;
      }
      while (v21 != (GEOTileLoaderInternal *)((char *)self + 56));
    }
  }
  v22 = *((_QWORD *)self + 6);
  *((_QWORD *)self + 6) = 0;
  if (v22)
    (*(void (**)(uint64_t))(*(_QWORD *)v22 + 8))(v22);
  objc_storeStrong((id *)self + 5, 0);
  objc_storeStrong((id *)self + 4, 0);
  if (*((_QWORD *)self + 3))
  {
    v23 = (char *)self + 8;
    v24 = *((_QWORD *)self + 1);
    v25 = (GEOTileLoaderInternal *)*((_QWORD *)self + 2);
    v26 = *(_QWORD *)v25;
    *(_QWORD *)(v26 + 8) = *(_QWORD *)(v24 + 8);
    **(_QWORD **)(v24 + 8) = v26;
    *((_QWORD *)self + 3) = 0;
    if (v25 != (GEOTileLoaderInternal *)((char *)self + 8))
    {
      do
      {
        v27 = (GEOTileLoaderInternal *)*((_QWORD *)v25 + 1);
        std::__destroy_at[abi:ne180100]<LoadItem,0>((uint64_t)v25 + 16);
        operator delete(v25);
        v25 = v27;
      }
      while (v27 != (GEOTileLoaderInternal *)v23);
    }
  }
}

@end
