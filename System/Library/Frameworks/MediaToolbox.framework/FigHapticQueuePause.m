@implementation FigHapticQueuePause

void __FigHapticQueuePause_block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  __int128 v4;
  uint64_t (*v5)(uint64_t, const void *);
  void *v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 40);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 16));
  v4 = *MEMORY[0x1E0CA2E10];
  v5 = *(uint64_t (**)(uint64_t, const void *))(MEMORY[0x1E0CA2E10] + 16);
  fhq_rescheduleWaitingPlayersAfterTime(v2, (uint64_t)&v4);
  *(_QWORD *)&v4 = MEMORY[0x1E0C809B0];
  *((_QWORD *)&v4 + 1) = 0x40000000;
  v5 = __fhq_pauseSubmittedPlayers_block_invoke;
  v6 = &__block_descriptor_tmp_38_0;
  v7 = v2;
  v3 = fhq_applyBlockToSubmittedPlayers();
  if (!v3)
    CFArrayRemoveAllValues(*(CFMutableArrayRef *)(v2 + 80));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
}

@end
