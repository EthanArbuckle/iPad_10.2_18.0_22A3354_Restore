@implementation PlaybackSessionGetBooleanPropertySync

_QWORD *__pap_PlaybackSessionGetBooleanPropertySync_block_invoke(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t CMBaseObject;
  uint64_t (*v5)(uint64_t, uint64_t, _QWORD, uint64_t);

  v1 = result[5];
  if (!*(_BYTE *)v1 && *(_QWORD *)(v1 + 280))
  {
    v2 = result[6];
    v3 = *(_QWORD *)(result[4] + 8);
    CMBaseObject = FigEndpointPlaybackSessionGetCMBaseObject();
    result = (_QWORD *)CMBaseObjectGetVTable();
    v5 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(result[1] + 48);
    if (v5)
      return (_QWORD *)v5(CMBaseObject, v2, *MEMORY[0x1E0C9AE00], v3 + 24);
  }
  return result;
}

uint64_t __pap_PlaybackSessionGetBooleanPropertySync_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
