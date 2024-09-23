@implementation VTTileEncoderSessionSetTileEncodeRequirements

void __VTTileEncoderSessionSetTileEncodeRequirements_block_invoke(_QWORD *a1)
{
  const void *v2;
  uint64_t v3;
  const void *v4;
  uint64_t v5;
  const void *v6;
  const void *v7;

  v3 = a1[4];
  v2 = (const void *)a1[5];
  v4 = *(const void **)(v3 + 104);
  *(_QWORD *)(v3 + 104) = v2;
  if (v2)
    CFRetain(v2);
  if (v4)
    CFRelease(v4);
  v5 = a1[4];
  v6 = *(const void **)(v5 + 112);
  v7 = (const void *)a1[6];
  *(_QWORD *)(v5 + 112) = v7;
  if (v7)
    CFRetain(v7);
  if (v6)
    CFRelease(v6);
}

@end
