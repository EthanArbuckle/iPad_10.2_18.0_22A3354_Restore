@implementation APBrokerGroupFireReceiversChanged

void ___APBrokerGroupFireReceiversChanged_block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  int v4;
  const void *v5;

  pthread_mutex_lock(*(pthread_mutex_t **)(*(_QWORD *)(a1 + 32) + 24));
  v2 = *(_DWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_DWORD *)(v3 + 88);
  pthread_mutex_unlock(*(pthread_mutex_t **)(v3 + 24));
  if (v2 == v4)
  {
    if (gLogCategory_APBrokerGroup <= 30
      && (gLogCategory_APBrokerGroup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*(void (**)(_QWORD, _QWORD))(a1 + 40))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
  v5 = *(const void **)(a1 + 48);
  if (v5)
    CFRelease(v5);
}

@end
