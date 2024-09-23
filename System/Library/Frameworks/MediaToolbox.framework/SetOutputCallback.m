@implementation SetOutputCallback

_QWORD *__basicVideoCompositor_SetOutputCallback_block_invoke(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;

  v1 = result;
  v2 = result[5];
  v3 = result[6];
  v4 = *(_QWORD *)(v2 + 296);
  if (v4 != v3 || *(_QWORD *)(v2 + 304) != result[7])
  {
    if (v4)
      v5 = v3 == 0;
    else
      v5 = 1;
    if (v5)
    {
      *(_QWORD *)(v2 + 296) = v3;
      *(_QWORD *)(result[5] + 304) = result[7];
    }
    else
    {
      result = (_QWORD *)FigSignalErrorAt();
      *(_DWORD *)(*(_QWORD *)(v1[4] + 8) + 24) = (_DWORD)result;
    }
  }
  return result;
}

_QWORD *__openglVideoCompositor_SetOutputCallback_block_invoke(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;

  v1 = result;
  v2 = result[5];
  v3 = result[6];
  v4 = *(_QWORD *)(v2 + 648);
  if (v4 != v3 || *(_QWORD *)(v2 + 656) != result[7])
  {
    if (v4)
      v5 = v3 == 0;
    else
      v5 = 1;
    if (v5)
    {
      *(_QWORD *)(v2 + 648) = v3;
      *(_QWORD *)(result[5] + 656) = result[7];
    }
    else
    {
      result = (_QWORD *)FigSignalErrorAt();
      *(_DWORD *)(*(_QWORD *)(v1[4] + 8) + 24) = (_DWORD)result;
    }
  }
  return result;
}

_QWORD *__mvc_SetOutputCallback_block_invoke(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;

  v1 = result;
  v2 = result[5];
  v3 = result[6];
  v4 = *(_QWORD *)(v2 + 24);
  if (v4 != v3 || *(_QWORD *)(v2 + 32) != result[7])
  {
    if (v4)
      v5 = v3 == 0;
    else
      v5 = 1;
    if (v5)
    {
      *(_QWORD *)(v2 + 24) = v3;
      *(_QWORD *)(result[5] + 32) = result[7];
    }
    else
    {
      result = (_QWORD *)FigSignalErrorAt();
      *(_DWORD *)(*(_QWORD *)(v1[4] + 8) + 24) = (_DWORD)result;
    }
  }
  return result;
}

_QWORD *__customVideoCompositor_SetOutputCallback_block_invoke(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;

  v1 = result;
  v2 = result[5];
  v3 = result[6];
  v4 = *(_QWORD *)(v2 + 176);
  if (v4 != v3 || *(_QWORD *)(v2 + 184) != result[7])
  {
    if (v4)
      v5 = v3 == 0;
    else
      v5 = 1;
    if (v5)
    {
      *(_QWORD *)(v2 + 176) = v3;
      *(_QWORD *)(result[5] + 184) = result[7];
    }
    else
    {
      result = (_QWORD *)FigSignalErrorAt();
      *(_DWORD *)(*(_QWORD *)(v1[4] + 8) + 24) = (_DWORD)result;
    }
  }
  return result;
}

@end
