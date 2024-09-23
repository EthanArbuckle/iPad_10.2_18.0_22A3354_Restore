@implementation SetReadyToSendCallback

const void *__stream_SetReadyToSendCallback_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  const void *result;

  v2 = a1[6];
  if (*(_BYTE *)(v2 + 24))
  {
    result = (const void *)APSLogErrorAt();
    *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = -16617;
  }
  else
  {
    result = *(const void **)(v2 + 40);
    if (result)
      result = CFRetain(result);
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  }
  return result;
}

_QWORD *__stream_SetReadyToSendCallback_block_invoke_2(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = result[4];
  v2 = result[5];
  if (v1)
  {
    *(_QWORD *)(v2 + 72) = v1;
    v1 = result[6];
  }
  else
  {
    *(_QWORD *)(v2 + 72) = 0;
  }
  *(_QWORD *)(result[5] + 80) = v1;
  return result;
}

@end
