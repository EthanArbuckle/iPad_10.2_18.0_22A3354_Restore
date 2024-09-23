@implementation SIShutdownIndexSchedulers

void ___SIShutdownIndexSchedulers_block_invoke(uint64_t a1)
{
  uint64_t i;
  uint64_t j;
  uint64_t v4;
  uint64_t k;
  uint64_t v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD block[4];
  __int128 v13;
  NSObject *v14;
  NSObject *v15;
  int v16;

  for (i = 0; i != 160; i += 8)
    si_workqueue_destroy(*(_QWORD *)(*(_QWORD *)(a1 + 32) + i));
  free(*(void **)(a1 + 32));
  for (j = 40; j != 176; j += 8)
  {
    v4 = *(_QWORD *)(a1 + j);
    if (v4)
      si_scheduler_drain_locked(v4, *(dispatch_group_t *)(a1 + 352));
  }
  for (k = 0; k != 17; ++k)
  {
    v6 = *(_QWORD *)(a1 + 40 + 8 * k);
    if (v6)
    {
      v7 = (unsigned int *)(v6 + 80);
      do
      {
        v8 = __ldaxr(v7);
        v9 = v8 - 1;
      }
      while (__stlxr(v9, v7));
      if (!v9)
        _si_scheduler_destroy(v6);
    }
  }
  v10 = *(NSObject **)(a1 + 352);
  v11 = *(NSObject **)(a1 + 360);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = ___SIShutdownIndexSchedulers_block_invoke_2;
  block[3] = &__block_descriptor_tmp_933;
  v16 = *(_DWORD *)(a1 + 384);
  v13 = *(_OWORD *)(a1 + 368);
  v14 = v11;
  v15 = v10;
  dispatch_group_notify(v10, v11, block);
}

void ___SIShutdownIndexSchedulers_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  const __CFDictionary *v4;
  uint64_t v5;
  const void *v6;
  NSObject *v8;
  _QWORD v9[5];
  void *value;

  if (!*(_DWORD *)(a1 + 64))
  {
    pthread_mutex_lock(&schlock);
    v2 = 0;
    v3 = &byte_1E6E2C169;
    do
    {
      v4 = (const __CFDictionary *)global_schedulers[v2];
      if (v4)
      {
        if (*v3)
          v5 = 32;
        else
          v5 = 40;
        v6 = *(const void **)(a1 + v5);
        value = 0;
        if (CFDictionaryGetValueIfPresent(v4, v6, (const void **)&value))
        {
          if (!atomic_load((unsigned int *)value + 21))
            CFDictionaryRemoveValue((CFMutableDictionaryRef)global_schedulers[v2], v6);
        }
      }
      ++v2;
      v3 += 56;
    }
    while (v2 != 12);
    pthread_mutex_unlock(&schlock);
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 0x40000000;
  v9[2] = ___SIShutdownIndexSchedulers_block_invoke_3;
  v9[3] = &__block_descriptor_tmp_932;
  v8 = *(NSObject **)(a1 + 48);
  v9[4] = *(_QWORD *)(a1 + 56);
  dispatch_async(v8, v9);
}

void ___SIShutdownIndexSchedulers_block_invoke_3(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

@end
