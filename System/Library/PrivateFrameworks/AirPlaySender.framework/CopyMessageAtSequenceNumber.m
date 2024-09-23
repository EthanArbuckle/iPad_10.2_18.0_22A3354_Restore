@implementation CopyMessageAtSequenceNumber

const void *__audioEngineCarPlay_CopyMessageAtSequenceNumber_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *result;

  v2 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v2 + 120))
  {
    result = (const void *)APMessageRingGetMessageAtSequenceNumber(*(_QWORD **)(v2 + 88), *(unsigned __int16 *)(a1 + 56), 0, (_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      return (const void *)APSLogErrorAt();
    }
    else
    {
      if (result)
        result = CFRetain(result);
      **(_QWORD **)(a1 + 48) = result;
    }
  }
  else
  {
    result = (const void *)APSLogErrorAt();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -72077;
  }
  return result;
}

@end
