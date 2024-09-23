@implementation StopAudioIO

void ___StopAudioIO_block_invoke(uint64_t a1)
{
  uint64_t v2;
  OpaqueAUGraph *v3;
  uint64_t v4;
  BOOL v5;
  Boolean outIsRunning;

  outIsRunning = 0;
  if (gLogCategory_APReceiverAudioSessionPlatform <= 30
    && (gLogCategory_APReceiverAudioSessionPlatform != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(OpaqueAUGraph **)(v2 + 192);
  if (!v3)
    goto LABEL_23;
  if (*(_BYTE *)(a1 + 40))
  {
    *(_BYTE *)(v2 + 256) = 1;
    *(_BYTE *)(v2 + 257) = *(_BYTE *)(v2 + 232);
  }
  else if (*(_BYTE *)(v2 + 256))
  {
    *(_BYTE *)(v2 + 257) = 0;
    goto LABEL_24;
  }
  AUGraphIsRunning(v3, &outIsRunning);
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v4 + 232))
    v5 = outIsRunning == 0;
  else
    v5 = 1;
  if (!v5)
  {
    if (AUGraphStop(*(AUGraph *)(v4 + 192)))
    {
      if (gLogCategory_APReceiverAudioSessionPlatform <= 60
        && (gLogCategory_APReceiverAudioSessionPlatform != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
LABEL_23:
      APSLogErrorAt();
      goto LABEL_24;
    }
    AUGraphUninitialize(*(AUGraph *)(*(_QWORD *)(a1 + 32) + 192));
    if (gLogCategory_APReceiverAudioSessionPlatform <= 50
      && (gLogCategory_APReceiverAudioSessionPlatform != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 232) = 0;
LABEL_24:
  CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 16));
  CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 24));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
