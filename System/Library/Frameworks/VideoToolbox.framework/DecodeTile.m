@implementation DecodeTile

uint64_t __dssxpc_DecodeTile_block_invoke(uint64_t a1)
{
  int v2;
  const void *v3;
  const void *v4;
  const void *v5;
  unsigned int v7;

  v7 = 0;
  v2 = VTTileDecompressionSessionDecodeTile(*(_QWORD *)(a1 + 32), *(opaqueCMSampleBuffer **)(a1 + 40), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(void **)(a1 + 48), *(_QWORD *)(a1 + 96), *(unsigned int *)(a1 + 104), *(_QWORD *)(a1 + 56), &v7);
  if (!FigXPCCreateBasicMessage())
  {
    xpc_dictionary_set_int64(0, "Result", v2);
    xpc_dictionary_set_uint64(0, "DecoderFlags", v7);
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 72), 0);
  }
  v3 = *(const void **)(a1 + 32);
  if (v3)
    CFRelease(v3);
  v4 = *(const void **)(a1 + 40);
  if (v4)
    CFRelease(v4);
  v5 = *(const void **)(a1 + 48);
  if (v5)
    CFRelease(v5);
  FigXPCRelease();
  return FigXPCRelease();
}

@end
