@implementation FigHapticQueueStop

uint64_t __FigHapticQueueStop_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  __int128 v4;
  uint64_t (*v5)(uint64_t, uint64_t);
  void *v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 40);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 16));
  v4 = *MEMORY[0x1E0CA2E10];
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(MEMORY[0x1E0CA2E10] + 16);
  fhq_rescheduleWaitingPlayersAfterTime(v2, (uint64_t)&v4);
  *(_QWORD *)&v4 = MEMORY[0x1E0C809B0];
  *((_QWORD *)&v4 + 1) = 0x40000000;
  v5 = __fhq_removeAllPlayers_block_invoke;
  v6 = &__block_descriptor_tmp_39_0;
  v7 = v2;
  result = fhq_applyBlockToSubmittedPlayers();
  if (!(_DWORD)result)
  {
    CFArrayRemoveAllValues(*(CFMutableArrayRef *)(v2 + 80));
    result = CMBufferQueueReset(*(CMBufferQueueRef *)(v2 + 64));
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
