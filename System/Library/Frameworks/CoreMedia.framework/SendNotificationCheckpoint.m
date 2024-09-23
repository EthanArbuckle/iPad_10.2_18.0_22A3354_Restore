@implementation SendNotificationCheckpoint

void __figXPC_SendNotificationCheckpoint_block_invoke(uint64_t a1)
{
  uint64_t v2;
  CFIndex Count;
  _QWORD v4[4];
  __int128 v5;

  FigSimpleMutexLock(*(pthread_mutex_t **)(*(_QWORD *)(a1 + 32) + 152));
  v2 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)(v2 + 168) = 0;
  if (*(_DWORD *)(v2 + 172) == 3)
    goto LABEL_5;
  Count = CFArrayGetCount(*(CFArrayRef *)(v2 + 160));
  v2 = *(_QWORD *)(a1 + 32);
  if (!Count)
  {
    *(_DWORD *)(v2 + 172) = 0;
LABEL_5:
    FigSimpleMutexUnlock(*(pthread_mutex_t **)(v2 + 152));
    goto LABEL_6;
  }
  *(_DWORD *)(v2 + 172) = 2;
  FigSimpleMutexUnlock(*(pthread_mutex_t **)(v2 + 152));
  CFRetain(*(CFTypeRef *)(a1 + 32));
  xpc_retain(*(xpc_object_t *)(a1 + 40));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = __figXPC_SendNotificationCheckpoint_block_invoke_2;
  v4[3] = &__block_descriptor_tmp_116;
  v5 = *(_OWORD *)(a1 + 32);
  dispatch_async(*(dispatch_queue_t *)(v5 + 144), v4);
LABEL_6:
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __figXPC_SendNotificationCheckpoint_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *ValueAtIndex;
  const void *v5;
  _QWORD *v6;
  const void *v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  while (1)
  {
    FigSimpleMutexLock(*(pthread_mutex_t **)(v2 + 152));
    if (*(_DWORD *)(v2 + 172) == 3)
      break;
    if (!CFArrayGetCount(*(CFArrayRef *)(v2 + 160)))
    {
      *(_DWORD *)(v2 + 172) = 0;
      break;
    }
    if (*(int *)(v2 + 168) >= 100)
    {
      *(_DWORD *)(v2 + 172) = 1;
      figXPC_SendNotificationCheckpoint(v2, v3);
      break;
    }
    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(v2 + 160), 0);
    v6 = (_QWORD *)*ValueAtIndex;
    v5 = (const void *)ValueAtIndex[1];
    v7 = (const void *)ValueAtIndex[2];
    CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(v2 + 160), 0);
    free(ValueAtIndex);
    ++*(_DWORD *)(v2 + 168);
    FigSimpleMutexUnlock(*(pthread_mutex_t **)(v2 + 152));
    figXPC_SendOneNotification(v6, v5, v7);
    if (v6)
      CFRelease(v6);
    if (v5)
      CFRelease(v5);
    if (v7)
      CFRelease(v7);
  }
  FigSimpleMutexUnlock(*(pthread_mutex_t **)(v2 + 152));
  CFRelease(*(CFTypeRef *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 40));
}

@end
