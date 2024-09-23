@implementation DeregisterStream

void __audioEngineCarPlay_DeregisterStream_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  const void *v3;
  const void *v4;
  uint64_t v5;
  int v6;

  v2 = a1[5];
  if (*(_BYTE *)(v2 + 120))
  {
    APSLogErrorAt();
    v5 = *(_QWORD *)(a1[4] + 8);
    v6 = -72077;
LABEL_10:
    *(_DWORD *)(v5 + 24) = v6;
    return;
  }
  v3 = (const void *)a1[6];
  if (v3 != *(const void **)(v2 + 96))
  {
    APSLogErrorAt();
    v5 = *(_QWORD *)(a1[4] + 8);
    v6 = -72073;
    goto LABEL_10;
  }
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(a1[5] + 96) = 0;
    v2 = a1[5];
  }
  *(_QWORD *)(v2 + 104) = 0;
  *(_QWORD *)(a1[5] + 112) = 0;
  v4 = *(const void **)(a1[5] + 88);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(a1[5] + 88) = 0;
  }
}

@end
