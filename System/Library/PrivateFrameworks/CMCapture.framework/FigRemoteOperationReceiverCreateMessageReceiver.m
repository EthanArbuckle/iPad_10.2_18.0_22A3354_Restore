@implementation FigRemoteOperationReceiverCreateMessageReceiver

uint64_t __FigRemoteOperationReceiverCreateMessageReceiver_block_invoke(uint64_t a1, uint64_t a2, _DWORD **a3, uint64_t a4)
{
  unsigned int v7;
  unsigned int *v8;
  uint64_t v9;
  uint64_t result;
  unsigned int Type;
  _DWORD *v13;
  uint64_t v14;
  const void *Region;
  int v16;
  uint64_t (**v17)(void);

  if ((_DWORD)a2)
  {
    v7 = 0;
LABEL_3:
    if (a4)
      pthread_mutex_lock(*(pthread_mutex_t **)a4);
    v8 = (unsigned int *)(a4 + 72);
    if (v7 != *(_DWORD *)(a4 + 72))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2);
    v9 = *v8;
    if ((_DWORD)v9)
    {
      if ((v9 - 7) >= 0xFFFFFFFA)
        ((void (*)(uint64_t))roGetCallbacksForOperationType_sRemoteOperationCallbacks[4 * v9 + 2])(a4 + 72);
      *(_OWORD *)(a4 + 88) = 0u;
      *(_OWORD *)(a4 + 104) = 0u;
      *(_OWORD *)v8 = 0u;
    }
    return pthread_mutex_unlock(*(pthread_mutex_t **)a4);
  }
  Type = FigRemoteOperationGetType(a3);
  v7 = Type;
  if (!Type)
    goto LABEL_3;
  if (Type - 7 <= 0xFFFFFFF9)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_3;
  }
  v13 = *a3;
  v14 = 12;
  if (*((_DWORD **)*a3 + 4) == *a3)
    v14 = 10;
  Region = (const void *)FigSharedMemBlockGetRegion(*(_QWORD *)&v13[v14]);
  if (Region)
    CFRetain(Region);
  v16 = *((unsigned __int8 *)v13 + 12);
  v17 = &roGetCallbacksForOperationType_sRemoteOperationCallbacks[4 * v7];
  ((void (*)(_DWORD **, uint64_t))v17[1])(a3, a4);
  result = ((uint64_t (*)(_DWORD *))v17[3])(v13);
  if (!v16)
    goto LABEL_3;
  return result;
}

@end
