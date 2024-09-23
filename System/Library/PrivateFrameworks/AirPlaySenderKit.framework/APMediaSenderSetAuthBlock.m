@implementation APMediaSenderSetAuthBlock

void __APMediaSenderSetAuthBlock_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  const void *v3;
  void *v4;
  const void *v5;

  v2 = a1[6];
  if (*(_BYTE *)(v2 + 182))
  {
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = -6709;
    APSLogErrorAt();
  }
  else
  {
    v3 = (const void *)a1[4];
    if (v3)
    {
      v4 = _Block_copy(v3);
      v2 = a1[6];
    }
    else
    {
      v4 = 0;
    }
    v5 = *(const void **)(v2 + 120);
    if (v5)
    {
      _Block_release(v5);
      v2 = a1[6];
    }
    *(_QWORD *)(v2 + 120) = v4;
  }
}

@end
