@implementation C3DShapeBoundariesSort

BOOL __C3DShapeBoundariesSort_block_invoke(uint64_t a1, double *a2, double *a3)
{
  return (a2[3] - a2[2]) * (a2[5] - a2[4]) > (a3[3] - a3[2]) * (a3[5] - a3[4]);
}

__n128 __C3DShapeBoundariesSort_block_invoke_2(uint64_t a1, __int128 *a2, __int128 *a3)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v3 = *((_QWORD *)a3 + 6);
  v5 = a3[1];
  result = (__n128)a3[2];
  v6 = *a3;
  v8 = a2[1];
  v7 = a2[2];
  v9 = *a2;
  *((_QWORD *)a3 + 6) = *((_QWORD *)a2 + 6);
  a3[1] = v8;
  a3[2] = v7;
  *a3 = v9;
  *a2 = v6;
  a2[1] = v5;
  a2[2] = (__int128)result;
  *((_QWORD *)a2 + 6) = v3;
  return result;
}

uint64_t __C3DShapeBoundariesSort_block_invoke_3(uint64_t result, uint64_t a2, int a3, int a4)
{
  int v4;
  int v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;

  v4 = (2 * a3) | 1;
  if (v4 <= a4)
  {
    v6 = a3;
    v7 = result;
    v8 = 2 * a3;
    do
    {
      result = (*(uint64_t (**)(void))(*(_QWORD *)(v7 + 32) + 16))();
      if ((_DWORD)result)
        v9 = v4;
      else
        v9 = v6;
      if (v4 < a4)
      {
        v10 = v8 + 2;
        result = (*(uint64_t (**)(void))(*(_QWORD *)(v7 + 32) + 16))();
        if ((_DWORD)result)
          v9 = v10;
      }
      if (v9 == v6)
        break;
      result = (*(uint64_t (**)(void))(*(_QWORD *)(v7 + 40) + 16))();
      v8 = 2 * v9;
      v4 = (2 * v9) | 1;
      v6 = v9;
    }
    while (v4 <= a4);
  }
  return result;
}

@end
