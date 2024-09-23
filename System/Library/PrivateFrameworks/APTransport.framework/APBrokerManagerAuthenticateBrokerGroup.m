@implementation APBrokerManagerAuthenticateBrokerGroup

uint64_t __APBrokerManagerAuthenticateBrokerGroup_block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;

  v1 = *(_QWORD *)(a1 + 32);
  FigSimpleMutexCheckIsNotLockedOnThisThread();
  pthread_mutex_lock(*(pthread_mutex_t **)(v1 + 96));
  v2 = *(_DWORD *)(v1 + 216);
  if (!v2)
  {
    v2 = -6722;
    *(_DWORD *)(v1 + 216) = -6722;
  }
  if (gLogCategory_APBrokerManager <= 90)
  {
    if (gLogCategory_APBrokerManager != -1 || (v3 = _LogCategory_Initialize(), v2 = *(_DWORD *)(v1 + 216), v3))
    {
      LogPrintF();
      v2 = *(_DWORD *)(v1 + 216);
    }
  }
  _APBrokerManagerCallAuthenticationCallback(v1, v2, 0, *(void **)(v1 + 208));
  _APBrokerManagerClearAuthCallbackState(v1);
  return pthread_mutex_unlock(*(pthread_mutex_t **)(v1 + 96));
}

void __APBrokerManagerAuthenticateBrokerGroup_block_invoke_2(uint64_t a1)
{
  FigSimpleMutexCheckIsNotLockedOnThisThread();
  pthread_mutex_lock(*(pthread_mutex_t **)(*(_QWORD *)(a1 + 32) + 96));
  _APBrokerManagerReleaseBrokerDiscovery(*(_QWORD *)(a1 + 32));
  pthread_mutex_unlock(*(pthread_mutex_t **)(*(_QWORD *)(a1 + 32) + 96));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __APBrokerManagerAuthenticateBrokerGroup_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void *v4;
  const void *v5;
  _QWORD aBlock[5];

  v4 = *(const void **)(a1 + 32);
  v5 = *(const void **)(a1 + 40);
  CFRetain(v4);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = ___APBrokerManagerAuthenticateBrokerGroup_block_invoke;
  aBlock[3] = &__block_descriptor_40_e44_v28__0i8____CFString__12____CFDictionary__20l;
  aBlock[4] = v4;
  APBrokerGroupAuthenticate(a3, v5, aBlock);
}

void ___APBrokerManagerAuthenticateBrokerGroup_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v6;
  CFMutableDictionaryRef Mutable;

  v6 = *(_QWORD *)(a1 + 32);
  FigSimpleMutexCheckIsNotLockedOnThisThread();
  pthread_mutex_lock(*(pthread_mutex_t **)(v6 + 96));
  if (gLogCategory_APBrokerManager <= 50
    && (gLogCategory_APBrokerManager != -1 || _LogCategory_Initialize()))
  {
    if (a3)
      IsAppleInternalBuild();
    if (gLogCategory_APBrokerManager == -1)
      _LogCategory_Initialize();
    LogPrintF();
  }
  *(_DWORD *)(v6 + 216) = a2;
  if (a2 && !FigCFEqual())
  {
    pthread_mutex_unlock(*(pthread_mutex_t **)(v6 + 96));
  }
  else
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    FigCFDictionarySetValueFromKeyInDict();
    _APBrokerManagerCallAuthenticationCallback(v6, *(_DWORD *)(v6 + 216), Mutable, *(void **)(v6 + 208));
    _APBrokerManagerClearAuthCallbackState(v6);
    pthread_mutex_unlock(*(pthread_mutex_t **)(v6 + 96));
    if (Mutable)
      CFRelease(Mutable);
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
