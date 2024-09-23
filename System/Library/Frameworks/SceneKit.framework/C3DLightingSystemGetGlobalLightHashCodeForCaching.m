@implementation C3DLightingSystemGetGlobalLightHashCodeForCaching

_QWORD *__C3DLightingSystemGetGlobalLightHashCodeForCaching_block_invoke(_QWORD *result)
{
  uint64_t v1;
  _QWORD *v2;
  _OWORD *v6;
  __int128 v7;
  char v8;

  v1 = result[5];
  v2 = (_QWORD *)result[6];
  if (*(_QWORD *)v1 == v2[67]
    && *(_QWORD *)(v1 + 8) == v2[68]
    && *(_QWORD *)(v1 + 16) == v2[69]
    && *(_QWORD *)(v1 + 24) == v2[70])
  {
    v8 = 0;
  }
  else
  {
    v6 = v2 + 67;
    v7 = v6[1];
    *(_OWORD *)v1 = *v6;
    *(_OWORD *)(v1 + 16) = v7;
    v8 = 1;
  }
  *(_BYTE *)(*(_QWORD *)(result[4] + 8) + 24) = v8;
  return result;
}

@end
