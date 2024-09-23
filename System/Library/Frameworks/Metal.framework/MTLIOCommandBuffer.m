@implementation MTLIOCommandBuffer

uint64_t __42___MTLIOCommandBuffer_waitForEvent_value___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  pthread_cond_t *v3;
  pthread_mutex_t *v4;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_QWORD *)(v1 + 72))
  {
    v2 = *(_QWORD *)(v1 + 80);
    v3 = (pthread_cond_t *)(v2 + 72);
    v4 = (pthread_mutex_t *)(v2 + 120);
    *(_BYTE *)(*(_QWORD *)(result + 40) + 8) = 1;
    pthread_mutex_lock((pthread_mutex_t *)(v2 + 120));
    pthread_cond_broadcast(v3);
    return pthread_mutex_unlock(v4);
  }
  return result;
}

uint64_t __49___MTLIOCommandBuffer_copyStatusToBuffer_offset___block_invoke(uint64_t result)
{
  **(_QWORD **)(result + 40) = *(_QWORD *)(*(_QWORD *)(result + 32) + 72);
  return result;
}

@end
