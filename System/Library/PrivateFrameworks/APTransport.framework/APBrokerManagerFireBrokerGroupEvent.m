@implementation APBrokerManagerFireBrokerGroupEvent

void ___APBrokerManagerFireBrokerGroupEvent_block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  int v4;
  const void *v5;

  pthread_mutex_lock(*(pthread_mutex_t **)(*(_QWORD *)(a1 + 32) + 96));
  v2 = *(_DWORD *)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_DWORD *)(v3 + 200);
  pthread_mutex_unlock(*(pthread_mutex_t **)(v3 + 96));
  if (v2 == v4)
    (*(void (**)(_QWORD, _QWORD, _QWORD))(a1 + 40))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  CFRelease(*(CFTypeRef *)(a1 + 48));
  CFRelease(*(CFTypeRef *)(a1 + 32));
  v5 = *(const void **)(a1 + 56);
  if (v5)
    CFRelease(v5);
}

@end
