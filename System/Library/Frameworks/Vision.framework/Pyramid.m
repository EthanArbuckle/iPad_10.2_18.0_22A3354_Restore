@implementation Pyramid

unsigned __int8 *__Pyramid_loadImage_block_invoke(unsigned __int8 *result, uint64_t a2, uint64_t a3, int a4, int a5)
{
  unsigned __int8 *v9;
  unsigned __int16 *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;

  v9 = result;
  v10 = (unsigned __int16 *)*((_QWORD *)result + 4);
  v11 = *v10;
  if (*v10)
  {
    result = filterSubsampling1channel((unsigned __int8 *)(*(_QWORD *)&v10[4 * v11 + 8] + *(_QWORD *)(a3 + 8 * v11)), *(_QWORD *)&v10[4 * v11 + 168], *(_QWORD *)(a2 + 8 * v11), *(_QWORD *)&v10[4 * v11 + 88], a4, a5, *((_QWORD *)result + 5) + *(_QWORD *)(a3 + 8 * (v11 - 1)), *((_QWORD *)result + 6), *((_DWORD *)result + 14), *((_DWORD *)result + 15));
    v10 = (unsigned __int16 *)*((_QWORD *)v9 + 4);
  }
  if (v11 < v10[1])
  {
    v12 = 8 * v11 + 176;
    v13 = a2 + 8;
    v14 = a3 + 8;
    do
    {
      ++v11;
      v15 = (char *)v10 + v12;
      result = filterSubsampling1channel((unsigned __int8 *)(*((_QWORD *)v15 - 19) + *(_QWORD *)(v14 + v12 - 176)), *((_QWORD *)v15 + 21), *(_QWORD *)(v13 + v12 - 176), *((_QWORD *)v15 + 1), a4, a5, *((_QWORD *)v15 - 20) + *(_QWORD *)(v14 + v12 - 184), *(_QWORD *)v15, a4, a5);
      v10 = (unsigned __int16 *)*((_QWORD *)v9 + 4);
      v12 += 8;
    }
    while (v11 < v10[1]);
  }
  return result;
}

uint64_t __Pyramid_loadImage_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40) + 496, *(_QWORD *)(a1 + 40) + 656, *(unsigned __int16 *)(*(_QWORD *)(a1 + 40) + 8), *(unsigned __int16 *)(*(_QWORD *)(a1 + 40) + 8));
}

uint64_t __Pyramid_loadImage_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40) + 576, *(_QWORD *)(a1 + 40) + 736, *(unsigned __int16 *)(*(_QWORD *)(a1 + 40) + 8), 0);
}

@end
