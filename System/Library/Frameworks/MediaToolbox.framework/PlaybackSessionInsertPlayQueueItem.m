@implementation PlaybackSessionInsertPlayQueueItem

uint64_t __pap_PlaybackSessionInsertPlayQueueItem_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t, void (*)(uint64_t, uint64_t), uint64_t);

  v2 = *(_QWORD *)(CMBaseObjectGetDerivedStorage() + 280);
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[7];
  result = CMBaseObjectGetVTable();
  v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, void (*)(uint64_t, uint64_t), uint64_t))(*(_QWORD *)(result + 16) + 32);
  if (v7)
    return v7(v2, v3, v4, pap_playbackSessionInsertPlayQueueItemCompletion, v5);
  return result;
}

@end
