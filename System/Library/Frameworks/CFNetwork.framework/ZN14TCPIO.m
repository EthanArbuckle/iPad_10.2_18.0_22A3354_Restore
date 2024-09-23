@implementation ZN14TCPIO

_QWORD *___ZN14TCPIO_Delegate14closeWriteSideEv_block_invoke(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = result[4];
  *(_BYTE *)(v1 + 88) = 1;
  if (*(_BYTE *)(v1 + 65))
  {
    v2 = *(_QWORD *)(v1 + 24);
    if (v2)
    {
      result = *(_QWORD **)(v2 + 24);
      if (result)
      {
        if (!*(_BYTE *)(v2 + 40))
        {
          *(_BYTE *)(v2 + 40) = 1;
          return (_QWORD *)(*(uint64_t (**)(_QWORD *, _QWORD))(*result + 152))(result, 0);
        }
      }
    }
  }
  return result;
}

_QWORD *___ZN14TCPIO_Delegate13closeReadSideEv_block_invoke(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = result[4];
  *(_BYTE *)(v1 + 65) = 1;
  if (*(_BYTE *)(v1 + 88))
  {
    v2 = *(_QWORD *)(v1 + 24);
    if (v2)
    {
      result = *(_QWORD **)(v2 + 24);
      if (result)
      {
        if (!*(_BYTE *)(v2 + 40))
        {
          *(_BYTE *)(v2 + 40) = 1;
          return (_QWORD *)(*(uint64_t (**)(_QWORD *, _QWORD))(*result + 152))(result, 0);
        }
      }
    }
  }
  return result;
}

@end
