@implementation VTTileEncoderSessionSetTileAttributes

void __VTTileEncoderSessionSetTileAttributes_block_invoke(_QWORD *a1)
{
  const void *v2;
  uint64_t v3;
  const void *v4;

  v3 = a1[4];
  v2 = (const void *)a1[5];
  v4 = *(const void **)(v3 + 88);
  *(_QWORD *)(v3 + 88) = v2;
  if (v2)
    CFRetain(v2);
  if (v4)
    CFRelease(v4);
  *(_QWORD *)(a1[4] + 96) = a1[6];
}

@end
