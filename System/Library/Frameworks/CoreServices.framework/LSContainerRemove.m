@implementation LSContainerRemove

void ___LSContainerRemove_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  _QWORD *v4;
  char *v5;
  unint64_t v6;
  _DWORD *v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  int v16;

  if (*(_DWORD *)(a3 + 4) == *(_DWORD *)(a1 + 40))
  {
    v4 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
    v5 = (char *)v4[7];
    v6 = v4[8];
    if ((unint64_t)v5 >= v6)
    {
      v8 = (char *)v4[6];
      v9 = (v5 - v8) >> 2;
      v10 = v9 + 1;
      if ((unint64_t)(v9 + 1) >> 62)
        abort();
      v11 = v6 - (_QWORD)v8;
      if (v11 >> 1 > v10)
        v10 = v11 >> 1;
      if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFFCLL)
        v12 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v12 = v10;
      if (v12)
      {
        v13 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)(v4 + 8), v12);
        v8 = (char *)v4[6];
        v5 = (char *)v4[7];
      }
      else
      {
        v13 = 0;
      }
      v14 = &v13[4 * v9];
      v15 = &v13[4 * v12];
      *(_DWORD *)v14 = a2;
      v7 = v14 + 4;
      while (v5 != v8)
      {
        v16 = *((_DWORD *)v5 - 1);
        v5 -= 4;
        *((_DWORD *)v14 - 1) = v16;
        v14 -= 4;
      }
      v4[6] = v14;
      v4[7] = v7;
      v4[8] = v15;
      if (v8)
        operator delete(v8);
    }
    else
    {
      *(_DWORD *)v5 = a2;
      v7 = v5 + 4;
    }
    v4[7] = v7;
  }
}

void ___LSContainerRemove_block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  _QWORD *v4;
  char *v5;
  unint64_t v6;
  _DWORD *v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  int v16;

  if (*(_DWORD *)(a3 + 4) == *(_DWORD *)(a1 + 40))
  {
    v4 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
    v5 = (char *)v4[7];
    v6 = v4[8];
    if ((unint64_t)v5 >= v6)
    {
      v8 = (char *)v4[6];
      v9 = (v5 - v8) >> 2;
      v10 = v9 + 1;
      if ((unint64_t)(v9 + 1) >> 62)
        abort();
      v11 = v6 - (_QWORD)v8;
      if (v11 >> 1 > v10)
        v10 = v11 >> 1;
      if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFFCLL)
        v12 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v12 = v10;
      if (v12)
      {
        v13 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)(v4 + 8), v12);
        v8 = (char *)v4[6];
        v5 = (char *)v4[7];
      }
      else
      {
        v13 = 0;
      }
      v14 = &v13[4 * v9];
      v15 = &v13[4 * v12];
      *(_DWORD *)v14 = a2;
      v7 = v14 + 4;
      while (v5 != v8)
      {
        v16 = *((_DWORD *)v5 - 1);
        v5 -= 4;
        *((_DWORD *)v14 - 1) = v16;
        v14 -= 4;
      }
      v4[6] = v14;
      v4[7] = v7;
      v4[8] = v15;
      if (v8)
        operator delete(v8);
    }
    else
    {
      *(_DWORD *)v5 = a2;
      v7 = v5 + 4;
    }
    v4[7] = v7;
  }
}

@end
