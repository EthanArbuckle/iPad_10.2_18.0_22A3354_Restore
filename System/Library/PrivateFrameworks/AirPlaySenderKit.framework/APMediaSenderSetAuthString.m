@implementation APMediaSenderSetAuthString

void __APMediaSenderSetAuthString_block_invoke(_QWORD *a1)
{
  uint64_t v1;
  const void *v2;
  const void *v3;

  v1 = a1[5];
  if (*(_BYTE *)(v1 + 182))
  {
    *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = -6709;
  }
  else
  {
    v2 = *(const void **)(v1 + 112);
    v3 = (const void *)a1[6];
    *(_QWORD *)(v1 + 112) = v3;
    if (v3)
      CFRetain(v3);
    if (v2)
      CFRelease(v2);
  }
}

@end
