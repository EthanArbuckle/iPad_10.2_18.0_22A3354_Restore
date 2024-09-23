@implementation DecodeFrame

uint64_t __dssxpc_DecodeFrame_XPCMessage_block_invoke(uint64_t a1)
{
  int v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  uint64_t value;

  LODWORD(value) = 0;
  v2 = VTDecompressionSessionDecodeFrameWithOptions(*(_QWORD *)(a1 + 40), *(opaqueCMSampleBuffer **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), *(unsigned int *)(a1 + 88), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), (int *)&value);
  if (!FigXPCCreateBasicMessage())
  {
    xpc_dictionary_set_int64(0, "Result", v2);
    xpc_dictionary_set_uint64(0, "DecoderFlags", value);
    v3 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    if (v3)
    {
      CFRelease(v3);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    }
    if (!FigMemoryRecipientAppendRecipientStateUpdateToXPCMessage())
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 80), 0);
  }
  FigXPCRelease();
  v4 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v4)
    CFRelease(v4);
  v5 = *(const void **)(a1 + 40);
  if (v5)
    CFRelease(v5);
  v6 = *(const void **)(a1 + 48);
  if (v6)
    CFRelease(v6);
  v7 = *(const void **)(a1 + 72);
  if (v7)
    CFRelease(v7);
  return FigXPCRelease();
}

@end
