@implementation StartAudioIO

void ___StartAudioIO_block_invoke(uint64_t a1)
{
  uint64_t v2;
  OpaqueAUGraph *v3;
  uint64_t v4;
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
    goto LABEL_20;
  if (*(_BYTE *)(a1 + 40))
  {
    *(_BYTE *)(v2 + 256) = 0;
    if (!*(_BYTE *)(v2 + 257))
      goto LABEL_21;
  }
  else if (*(_BYTE *)(v2 + 256))
  {
    *(_BYTE *)(v2 + 257) = 1;
    goto LABEL_21;
  }
  AUGraphIsRunning(v3, &outIsRunning);
  v4 = *(_QWORD *)(a1 + 32);
  if (*(unsigned __int8 *)(v4 + 232) | outIsRunning)
    goto LABEL_11;
  AUGraphInitialize(*(AUGraph *)(v4 + 192));
  if (AUGraphStart(*(AUGraph *)(*(_QWORD *)(a1 + 32) + 192)))
  {
    if (gLogCategory_APReceiverAudioSessionPlatform <= 60
      && (gLogCategory_APReceiverAudioSessionPlatform != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
LABEL_20:
    APSLogErrorAt();
    goto LABEL_21;
  }
  if (gLogCategory_APReceiverAudioSessionPlatform <= 50
    && (gLogCategory_APReceiverAudioSessionPlatform != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_11:
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 232) = 1;
LABEL_21:
  CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 24));
  CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 16));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
