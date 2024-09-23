@implementation APBrokerManagerGetInfoFromBrokerGroup

uint64_t __APBrokerManagerGetInfoFromBrokerGroup_block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(a1 + 32);
  FigSimpleMutexCheckIsNotLockedOnThisThread();
  pthread_mutex_lock(*(pthread_mutex_t **)(v1 + 96));
  if (*(_QWORD *)(v1 + 264))
  {
    if (gLogCategory_APBrokerManager <= 50
      && (gLogCategory_APBrokerManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v2 = 0;
  }
  else if (gLogCategory_APBrokerManager <= 60
         && (gLogCategory_APBrokerManager != -1 || _LogCategory_Initialize()))
  {
    v2 = -6722;
    LogPrintF();
  }
  else
  {
    v2 = -6722;
  }
  _APBrokerManagerCallGetInfoCallback(v1, v2, *(_QWORD *)(v1 + 264), *(const void **)(v1 + 248));
  _APBrokerManagerClearGetInfoCallbackState(v1);
  return pthread_mutex_unlock(*(pthread_mutex_t **)(v1 + 96));
}

void __APBrokerManagerGetInfoFromBrokerGroup_block_invoke_2(uint64_t a1)
{
  FigSimpleMutexCheckIsNotLockedOnThisThread();
  pthread_mutex_lock(*(pthread_mutex_t **)(*(_QWORD *)(a1 + 32) + 96));
  _APBrokerManagerReleaseBrokerDiscovery(*(_QWORD *)(a1 + 32));
  pthread_mutex_unlock(*(pthread_mutex_t **)(*(_QWORD *)(a1 + 32) + 96));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __APBrokerManagerGetInfoFromBrokerGroup_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void *v4;
  _QWORD aBlock[5];

  v4 = *(const void **)(a1 + 32);
  CFRetain(v4);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = ___APBrokerManagerGetInfoFromBrokerGroup_block_invoke;
  aBlock[3] = &__block_descriptor_40_e44_v28__0i8____CFString__12____CFDictionary__20l;
  aBlock[4] = v4;
  APBrokerGroupGetInfo(a3, aBlock);
}

void ___APBrokerManagerGetInfoFromBrokerGroup_block_invoke(uint64_t a1, int a2, const void *a3, const void *a4)
{
  uint64_t v8;
  __CFDictionary *Mutable;

  v8 = *(_QWORD *)(a1 + 32);
  FigSimpleMutexCheckIsNotLockedOnThisThread();
  pthread_mutex_lock(*(pthread_mutex_t **)(v8 + 96));
  if (gLogCategory_APBrokerManager > 50
    || gLogCategory_APBrokerManager == -1 && !_LogCategory_Initialize())
  {
    if (a2)
      goto LABEL_15;
    goto LABEL_12;
  }
  if (a3)
    IsAppleInternalBuild();
  if (gLogCategory_APBrokerManager == -1)
    _LogCategory_Initialize();
  LogPrintF();
  if (!a2)
  {
LABEL_12:
    Mutable = *(__CFDictionary **)(v8 + 264);
    if (!Mutable)
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      *(_QWORD *)(v8 + 264) = Mutable;
    }
    CFDictionarySetValue(Mutable, a3, a4);
  }
LABEL_15:
  if (FigCFEqual())
  {
    _APBrokerManagerCallGetInfoCallback(v8, a2, *(_QWORD *)(v8 + 264), *(const void **)(v8 + 248));
    _APBrokerManagerClearGetInfoCallbackState(v8);
  }
  pthread_mutex_unlock(*(pthread_mutex_t **)(v8 + 96));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
