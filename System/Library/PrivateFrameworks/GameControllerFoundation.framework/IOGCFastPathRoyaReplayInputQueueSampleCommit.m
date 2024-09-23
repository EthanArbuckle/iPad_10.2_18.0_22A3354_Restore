@implementation IOGCFastPathRoyaReplayInputQueueSampleCommit

uint64_t ____IOGCFastPathRoyaReplayInputQueueSampleCommit_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unsigned __int16 *v9;

  os_unfair_lock_lock_with_options();
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 8) = v5;
  *(_QWORD *)(a2 + 16) = v4;
  os_unfair_lock_unlock((os_unfair_lock_t)a2);
  v6 = *(_QWORD *)(v5 + 24);
  v7 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 160));
  if (v6 >= v7)
  {
    atomic_store(v6, (unint64_t *)(*(_QWORD *)(a1 + 32) + 160));
    v8 = *(_QWORD *)(a1 + 32);
    v9 = (unsigned __int16 *)(v8 + 146);
    LOWORD(v8) = atomic_load((unsigned __int16 *)(v8 + 144));
    atomic_store(v8, v9);
  }
  return 0;
}

@end
