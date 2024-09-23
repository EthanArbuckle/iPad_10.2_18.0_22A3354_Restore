@implementation PlaybackSessionSetPropertySync

uint64_t __pap_PlaybackSessionSetPropertySync_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t CMBaseObject;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);
  int v7;

  v2 = a1[5];
  if (!*(_BYTE *)v2 && *(_QWORD *)(v2 + 280))
  {
    v3 = a1[6];
    v4 = a1[7];
    CMBaseObject = FigEndpointPlaybackSessionGetCMBaseObject();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v6)
      v7 = v6(CMBaseObject, v3, v4);
    else
      v7 = -12782;
    *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v7;
  }
  return *(unsigned int *)(*(_QWORD *)(a1[4] + 8) + 24);
}

uint64_t __pap_PlaybackSessionSetPropertySync_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
