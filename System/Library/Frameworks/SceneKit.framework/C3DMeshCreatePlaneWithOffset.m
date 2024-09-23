@implementation C3DMeshCreatePlaneWithOffset

uint64_t __C3DMeshCreatePlaneWithOffset_block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(result + 40);
  if (v5 >= 1)
  {
    v6 = a3;
    v7 = *(_QWORD *)(result + 40);
    do
    {
      **(_WORD **)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
      *(_WORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) + 2) = v6 - 1;
      *(_WORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) + 4) = v6;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 6;
      ++v6;
      --v7;
    }
    while (v7);
  }
  if (a4 >= 1)
  {
    v8 = v5 + a3;
    do
    {
      *(_WORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) + 10) = a2;
      **(_WORD **)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
      *(_WORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) + 2) = v8 - 1;
      *(_WORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) + 6) = v8;
      *(_WORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) + 4) = v8;
      a2 += a5;
      *(_WORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) + 8) = a2;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 12;
      ++v8;
      --a4;
    }
    while (a4);
  }
  return result;
}

uint64_t __C3DMeshCreatePlaneWithOffset_block_invoke_2(uint64_t result, int a2, int a3, uint64_t a4, int a5)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;
  int v9;

  v5 = *(_QWORD *)(result + 40);
  if (v5 >= 1)
  {
    v6 = a3;
    v7 = *(_QWORD *)(result + 40);
    do
    {
      **(_DWORD **)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) + 4) = v6 - 1;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) + 8) = v6;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 12;
      ++v6;
      --v7;
    }
    while (v7);
  }
  if (a4 >= 1)
  {
    v8 = 0;
    v9 = v5 + a3;
    do
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) + 20) = a2 + v8;
      **(_DWORD **)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2 + v8;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) + 4) = v9 - 1;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) + 12) = v9;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) + 8) = v9;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) + 16) = a5 + a2 + v8;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 24;
      v8 += a5;
      ++v9;
      --a4;
    }
    while (a4);
  }
  return result;
}

uint64_t __C3DMeshCreatePlaneWithOffset_block_invoke_3(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;

  v5 = *(_QWORD *)(result + 40);
  if (v5 >= 2)
  {
    v6 = v5 - 1;
    v7 = a3;
    do
    {
      **(_WORD **)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
      *(_WORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) + 4) = v7;
      *(_WORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) + 2) = v7;
      *(_WORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) + 6) = v7 + 1;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 8;
      ++v7;
      --v6;
    }
    while (v6);
  }
  if ((a4 & 0x8000000000000000) == 0)
  {
    v8 = v5 + a3;
    v9 = -1;
    do
    {
      **(_WORD **)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
      *(_WORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) + 4) = v8 + v9;
      *(_WORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) + 2) = v8 + v9;
      *(_WORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) + 6) = v8 + v9 + 1;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 8;
      ++v9;
      a2 += a5;
    }
    while (a4 != v9);
  }
  return result;
}

uint64_t __C3DMeshCreatePlaneWithOffset_block_invoke_4(uint64_t result, int a2, int a3, uint64_t a4, int a5)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;

  v5 = *(_QWORD *)(result + 40);
  if (v5 >= 2)
  {
    v6 = v5 - 1;
    v7 = a3;
    do
    {
      **(_DWORD **)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) + 8) = v7;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) + 4) = v7++;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) + 12) = v7;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 16;
      --v6;
    }
    while (v6);
  }
  if ((a4 & 0x8000000000000000) == 0)
  {
    v8 = v5 + a3;
    v9 = a4 + 1;
    v10 = v8 - 1;
    do
    {
      **(_DWORD **)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) + 8) = v10;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) + 4) = v10;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) + 12) = v8;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 16;
      ++v10;
      a2 += a5;
      ++v8;
      --v9;
    }
    while (v9);
  }
  return result;
}

@end
