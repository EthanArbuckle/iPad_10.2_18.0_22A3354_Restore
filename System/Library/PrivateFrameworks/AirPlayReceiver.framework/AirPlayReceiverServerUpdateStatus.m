@implementation AirPlayReceiverServerUpdateStatus

void __AirPlayReceiverServerUpdateStatus_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  const __CFString *v7;

  if (gLogCategory_AirPlayReceiverServer <= 30
    && (gLogCategory_AirPlayReceiverServer != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("StartingPlaying")))
  {
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 250))
      goto LABEL_17;
    v2 = gAirTunesDACPClient;
    if (gAirTunesDACPClient && *(_DWORD *)gAirTunesDACPClient == 1684104048)
    {
      pthread_mutex_lock((pthread_mutex_t *)(gAirTunesDACPClient + 8));
      *(_BYTE *)(v2 + 161) = 1;
      pthread_mutex_unlock((pthread_mutex_t *)(v2 + 8));
      goto LABEL_17;
    }
    goto LABEL_24;
  }
  if (!CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("StoppedPlaying")))
  {
    if (CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("StartedPlayingOverAWDL")))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = CFSTR("startedPlayingOverAWDL");
    }
    else
    {
      if (!CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("StoppedPlayingOverAWDL")))
        goto LABEL_18;
      v6 = *(_QWORD *)(a1 + 32);
      v7 = CFSTR("stoppedPlayingOverAWDL");
    }
    AirPlayReceiverServerControl(v6, v5, v7, 0, 0, 0);
    goto LABEL_18;
  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 250))
  {
    v3 = gAirTunesDACPClient;
    if (gAirTunesDACPClient && *(_DWORD *)gAirTunesDACPClient == 1684104048)
    {
      pthread_mutex_lock((pthread_mutex_t *)(gAirTunesDACPClient + 8));
      v4 = *(unsigned __int8 *)(v3 + 161);
      *(_BYTE *)(v3 + 161) = 0;
      pthread_mutex_unlock((pthread_mutex_t *)(v3 + 8));
      if (v4)
        _AirTunesDACPClient_ScheduleCommandInternal(v3, "stopSession", 1);
      goto LABEL_17;
    }
LABEL_24:
    APSLogErrorAt();
  }
LABEL_17:
  CFObjectSetProperty();
LABEL_18:
  CFRelease(*(CFTypeRef *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
