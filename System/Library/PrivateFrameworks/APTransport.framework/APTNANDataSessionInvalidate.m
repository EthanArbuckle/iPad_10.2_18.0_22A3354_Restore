@implementation APTNANDataSessionInvalidate

void ___APTNANDataSessionInvalidate_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const void *v4;

  pthread_mutex_lock(*(pthread_mutex_t **)(*(_QWORD *)(a1 + 40) + 40));
  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
  if (v2 == *(void **)(a1 + 48))
  {

    v3 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(v3 + 56) = 0;
    if (*(_DWORD *)(v3 + 64))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      {
        CFDictionarySetInt64();
      }
      else if (gLogCategory_APTNANDataSession <= 90
             && (gLogCategory_APTNANDataSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    CMNotificationCenterGetDefaultLocalCenter();
    FigDispatchAsyncPostNotification();
  }
  else if (gLogCategory_APTNANDataSession <= 50
         && (gLogCategory_APTNANDataSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  pthread_mutex_unlock(*(pthread_mutex_t **)(*(_QWORD *)(a1 + 40) + 40));
  v4 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v4)
    CFRelease(v4);
  CFRelease(*(CFTypeRef *)(a1 + 56));
}

@end
