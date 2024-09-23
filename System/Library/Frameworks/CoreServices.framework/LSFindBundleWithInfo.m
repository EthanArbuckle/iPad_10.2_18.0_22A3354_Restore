@implementation LSFindBundleWithInfo

uint64_t ___LSFindBundleWithInfo_NoIOFiltered_block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  _QWORD *v5;
  int v6;

  if (*(_DWORD *)(a3 + 12))
  {
    v5 = (_QWORD *)result;
    if (*(_QWORD *)(a3 + 288) == *(_QWORD *)(result + 56))
    {
      v6 = a2;
      result = *(_QWORD *)(result + 32);
      if (!result
        || (result = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(result + 16))(result, v5[8], a2, a3),
            (_DWORD)result))
      {
        *(_DWORD *)(*(_QWORD *)(v5[5] + 8) + 24) = v6;
        *(_BYTE *)(*(_QWORD *)(v5[6] + 8) + 24) = 1;
        *a4 = 1;
      }
    }
  }
  return result;
}

@end
