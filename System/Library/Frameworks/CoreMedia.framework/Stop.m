@implementation Stop

uint64_t __ids_Stop_block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  BOOL v4;
  int v5;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_DWORD *)(v1 + 36);
  if (v2 == 1)
  {
    v3 = result;
    *(_WORD *)(v1 + 88) = 1;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 144));
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(v3 + 32) + 152));
    result = FigThreadJoin(*(pthread_t *)(*(_QWORD *)(v3 + 32) + 80), 0);
    *(_QWORD *)(*(_QWORD *)(v3 + 32) + 80) = 0;
    v1 = *(_QWORD *)(v3 + 32);
    v2 = *(_DWORD *)(v1 + 36);
  }
  v4 = __OFSUB__(v2, 1);
  v5 = v2 - 1;
  if (v5 < 0 == v4)
    *(_DWORD *)(v1 + 36) = v5;
  return result;
}

uint64_t __tcp_Stop_block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  int v4;
  BOOL v5;
  int v6;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_DWORD *)(v1 + 48);
  if (v2 == 1)
  {
    v3 = result;
    *(_WORD *)(v1 + 120) = 1;
    v4 = *(_DWORD *)(v1 + 92);
    if ((v4 & 0x80000000) == 0)
    {
      close(v4);
      v1 = *(_QWORD *)(v3 + 32);
      *(_DWORD *)(v1 + 92) = -1;
    }
    FigThreadJoin(*(pthread_t *)(v1 + 112), 0);
    *(_QWORD *)(*(_QWORD *)(v3 + 32) + 112) = 0;
    result = tcp_CleanupFileDescriptors(*(_QWORD *)(v3 + 40));
    v1 = *(_QWORD *)(v3 + 32);
    v2 = *(_DWORD *)(v1 + 48);
  }
  v5 = __OFSUB__(v2, 1);
  v6 = v2 - 1;
  if (v6 < 0 == v5)
    *(_DWORD *)(v1 + 48) = v6;
  return result;
}

_opaque_pthread_t *__usb_Stop_block_invoke(_opaque_pthread_t *result)
{
  uint64_t v1;
  int v2;
  _opaque_pthread_t *v3;
  const void *v4;
  BOOL v5;
  int v6;

  v1 = *(_QWORD *)&result->__opaque[16];
  v2 = *(_DWORD *)(v1 + 88);
  if (v2 == 1)
  {
    v3 = result;
    v4 = *(const void **)(v1 + 80);
    if (v4)
    {
      CFRelease(v4);
      *(_QWORD *)(*(_QWORD *)&v3->__opaque[16] + 80) = 0;
    }
    result = usb_stopMessageSendingAndReceivingThreads(*(_QWORD *)&v3->__opaque[24]);
    v1 = *(_QWORD *)&v3->__opaque[16];
    v2 = *(_DWORD *)(v1 + 88);
  }
  v5 = __OFSUB__(v2, 1);
  v6 = v2 - 1;
  if (v6 < 0 == v5)
    *(_DWORD *)(v1 + 88) = v6;
  return result;
}

@end
