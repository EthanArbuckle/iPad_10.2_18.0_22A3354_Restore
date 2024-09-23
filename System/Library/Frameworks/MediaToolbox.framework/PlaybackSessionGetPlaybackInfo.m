@implementation PlaybackSessionGetPlaybackInfo

uint64_t __pap_PlaybackSessionGetPlaybackInfo_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);

  v2 = *(_QWORD *)(CMBaseObjectGetDerivedStorage() + 280);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  result = CMBaseObjectGetVTable();
  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(result + 16) + 56);
  if (v6)
    return v6(v2, v3, v4);
  return result;
}

@end
