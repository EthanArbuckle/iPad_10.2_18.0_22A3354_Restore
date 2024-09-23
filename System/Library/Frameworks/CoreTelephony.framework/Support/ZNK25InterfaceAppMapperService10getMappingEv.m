@implementation ZNK25InterfaceAppMapperService10getMappingEv

uint64_t *___ZNK25InterfaceAppMapperService10getMappingEv_block_invoke@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v12;
  BOOL v13;
  unsigned int v14;
  uint64_t **v15;
  uint64_t **v16;
  uint64_t *v17;
  unsigned int v18;
  uint64_t *v19;
  _QWORD *v20;
  _QWORD *v21;

  *(_QWORD *)(a2 + 8) = 0;
  v3 = (uint64_t *)(a2 + 8);
  v4 = result[4];
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = v3;
  v5 = *(_QWORD **)(v4 + 32);
  v6 = (_QWORD *)(v4 + 40);
  if (v5 != (_QWORD *)(v4 + 40))
  {
    v7 = 0;
    v8 = v3;
    while (1)
    {
      v9 = *(_QWORD *)((char *)v5 + 28);
      v10 = v3;
      if (v8 == v3)
        goto LABEL_9;
      v11 = (uint64_t *)v7;
      v12 = v3;
      if (v7)
      {
        do
        {
          v10 = v11;
          v11 = (uint64_t *)v11[1];
        }
        while (v11);
      }
      else
      {
        do
        {
          v10 = (uint64_t *)v12[2];
          v13 = *v10 == (_QWORD)v12;
          v12 = v10;
        }
        while (v13);
      }
      v14 = *((_DWORD *)v5 + 7);
      if (*((_DWORD *)v10 + 7) < v14)
      {
LABEL_9:
        if (v7)
          v15 = (uint64_t **)v10;
        else
          v15 = (uint64_t **)v3;
        if (v7)
          v16 = (uint64_t **)(v10 + 1);
        else
          v16 = (uint64_t **)v3;
        if (!*v16)
        {
LABEL_25:
          v19 = (uint64_t *)operator new(0x28uLL);
          *(uint64_t *)((char *)v19 + 28) = v9;
          result = std::__tree<std::__value_type<unsigned int,int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,int>>>::__insert_node_at((uint64_t **)a2, (uint64_t)v15, v16, v19);
          v8 = *(uint64_t **)a2;
        }
      }
      else
      {
        v16 = (uint64_t **)v3;
        v15 = (uint64_t **)v3;
        if (!v7)
          goto LABEL_25;
        v17 = (uint64_t *)v7;
        while (1)
        {
          while (1)
          {
            v15 = (uint64_t **)v17;
            v18 = *((_DWORD *)v17 + 7);
            if (v18 <= v14)
              break;
            v17 = *v15;
            v16 = v15;
            if (!*v15)
              goto LABEL_25;
          }
          if (v18 >= v14)
            break;
          v17 = v15[1];
          if (!v17)
          {
            v16 = v15 + 1;
            goto LABEL_25;
          }
        }
      }
      v20 = (_QWORD *)v5[1];
      if (v20)
      {
        do
        {
          v21 = v20;
          v20 = (_QWORD *)*v20;
        }
        while (v20);
      }
      else
      {
        do
        {
          v21 = (_QWORD *)v5[2];
          v13 = *v21 == (_QWORD)v5;
          v5 = v21;
        }
        while (!v13);
      }
      if (v21 == v6)
        return result;
      v7 = *v3;
      v5 = v21;
    }
  }
  return result;
}

@end
