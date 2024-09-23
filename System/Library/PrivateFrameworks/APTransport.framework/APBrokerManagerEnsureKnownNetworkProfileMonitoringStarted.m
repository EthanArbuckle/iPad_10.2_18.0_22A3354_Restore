@implementation APBrokerManagerEnsureKnownNetworkProfileMonitoringStarted

void ___APBrokerManagerEnsureKnownNetworkProfileMonitoringStarted_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  uint64_t v5;
  int v6;
  int v7;
  _QWORD v8[5];
  uint64_t v9;

  v9 = 0;
  FigSimpleMutexCheckIsNotLockedOnThisThread();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = ___APBrokerManagerEnsureKnownNetworkProfileMonitoringStarted_block_invoke_2;
  v8[3] = &__block_descriptor_40_e18_v16__0__CWFEvent_8l;
  v8[4] = v2;
  objc_msgSend(v3, "setEventHandler:", v8);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "startMonitoringEventType:error:", 30, &v9);
  v4 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "currentKnownNetworkProfile"), "isPublicAirPlayNetwork");
  pthread_mutex_lock(*(pthread_mutex_t **)(*(_QWORD *)(a1 + 32) + 96));
  v5 = *(_QWORD *)(a1 + 32);
  if (v9)
  {
    *(_BYTE *)(v5 + 280) = 0;
    v6 = 90;
  }
  else
  {
    v6 = 50;
  }
  *(_BYTE *)(v5 + 281) = v4;
  if (v6 >= gLogCategory_APBrokerManager)
  {
    if (gLogCategory_APBrokerManager != -1 || (v7 = _LogCategory_Initialize(), v5 = *(_QWORD *)(a1 + 32), v7))
    {
      LogPrintF();
      v5 = *(_QWORD *)(a1 + 32);
    }
  }
  pthread_mutex_unlock(*(pthread_mutex_t **)(v5 + 96));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

uint64_t ___APBrokerManagerEnsureKnownNetworkProfileMonitoringStarted_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  result = objc_msgSend(a2, "type");
  if (result == 30)
  {
    v5 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "currentKnownNetworkProfile"), "isPublicAirPlayNetwork");
    FigSimpleMutexCheckIsNotLockedOnThisThread();
    pthread_mutex_lock(*(pthread_mutex_t **)(*(_QWORD *)(a1 + 32) + 96));
    v8 = *(_QWORD *)(a1 + 32);
    if (*(unsigned __int8 *)(v8 + 281) != v5)
    {
      if (gLogCategory_APBrokerManager <= 50)
      {
        if (gLogCategory_APBrokerManager != -1 || (v9 = _LogCategory_Initialize(), v8 = *(_QWORD *)(a1 + 32), v9))
        {
          LogPrintF();
          v8 = *(_QWORD *)(a1 + 32);
        }
      }
      *(_BYTE *)(v8 + 281) = v5;
      _APBrokerManagerUpdateBrowsing(v8, v6, v7);
      v8 = *(_QWORD *)(a1 + 32);
    }
    return pthread_mutex_unlock(*(pthread_mutex_t **)(v8 + 96));
  }
  else if (gLogCategory_APBrokerManager <= 60)
  {
    if (gLogCategory_APBrokerManager != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
    {
      objc_msgSend(a2, "type");
      return LogPrintF();
    }
  }
  return result;
}

@end
