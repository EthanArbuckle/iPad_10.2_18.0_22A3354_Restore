@implementation SecOTRSIsForKeys

const void *__SecOTRSIsForKeys_block_invoke(_QWORD *a1)
{
  const void *v2;
  uint64_t v3;
  const void *result;
  BOOL v5;
  const void *v6;
  BOOL v7;
  BOOL v8;

  v3 = a1[5];
  v2 = (const void *)a1[6];
  result = *(const void **)(*(_QWORD *)(v3 + 24) + 16);
  if (v2)
    v5 = result == 0;
  else
    v5 = 1;
  if (v5)
  {
    if (result == v2)
      goto LABEL_10;
LABEL_16:
    v8 = 0;
    goto LABEL_17;
  }
  result = (const void *)CFEqual(result, v2);
  if (!(_DWORD)result)
    goto LABEL_16;
  v3 = a1[5];
LABEL_10:
  v6 = (const void *)a1[7];
  result = *(const void **)(*(_QWORD *)(v3 + 32) + 16);
  if (v6)
    v7 = result == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = result == v6;
  }
  else
  {
    result = (const void *)CFEqual(result, v6);
    v8 = (_DWORD)result != 0;
  }
LABEL_17:
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = v8;
  return result;
}

@end
