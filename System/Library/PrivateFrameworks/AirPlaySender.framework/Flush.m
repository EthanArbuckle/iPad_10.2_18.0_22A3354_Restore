@implementation Flush

void __audioEngineCarPlay_Flush_block_invoke(uint64_t a1)
{
  uint64_t v2;
  int32_t v3;
  uint64_t v4;
  _QWORD *v5;
  unsigned int (*v6)(uint64_t, _OWORD *);
  CMTime time;
  CMTime v8;
  unsigned __int16 v9;
  _OWORD v10[3];
  __int128 v11;

  v11 = 0u;
  memset(v10, 0, sizeof(v10));
  v9 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 216))
  {
    if (*(_BYTE *)(v2 + 236))
    {
      if (*(_QWORD *)(v2 + 184))
      {
        v3 = (int)*(double *)(v2 + 144);
        time = *(CMTime *)(a1 + 48);
        CMTimeConvertScale(&v8, &time, v3, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
        *(double *)v10 = (double)v8.value;
        DWORD2(v11) = 1;
        v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184);
        v5 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
        if (*v5 < 2uLL
          || (v6 = (unsigned int (*)(uint64_t, _OWORD *))v5[6]) == 0
          || v6(v4, v10)
          || APMessageRingFlush(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 200), &v9))
        {
          APSLogErrorAt();
        }
        else
        {
          (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 216))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 208), v9, (unint64_t)*(double *)v10 - *(_DWORD *)(*(_QWORD *)(a1 + 32) + 232), 0);
          kdebug_trace();
        }
      }
    }
    else if (gLogCategory_APAudioEngineCarPlay <= 50
           && (gLogCategory_APAudioEngineCarPlay != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

uint64_t __audioHoseManagerBuffered_Flush_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void *v5;
  void (*v6)(const void *, _QWORD, _QWORD);
  const void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int32_t v11;
  uint64_t DerivedStorage;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t result;
  const void *v16;
  uint64_t v17;
  uint64_t (*v18)(const void *, uint64_t, _BYTE *, _QWORD, const void *);
  __int128 v19;
  __int128 v20;
  _BYTE v21[28];
  _OWORD v22[2];
  _BYTE time[28];
  uint64_t v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (gLogCategory_APAudioHoseManagerBuffered <= 50
    && (gLogCategory_APAudioHoseManagerBuffered != -1 || _LogCategory_Initialize()))
  {
    if (*(_QWORD *)(a1 + 32))
      CMBaseObjectGetDerivedStorage();
    LogPrintF();
  }
  v5 = *(const void **)a3;
  v6 = *(void (**)(const void *, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v6)
    v6(v5, *MEMORY[0x1E0CF7380], *MEMORY[0x1E0C9AE40]);
  *(_WORD *)(a3 + 10) = *(_WORD *)(a1 + 72);
  v7 = *(const void **)(a1 + 32);
  v8 = *(unsigned int *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 44);
  v10 = *(_DWORD *)(a1 + 52);
  v24 = *(_QWORD *)(a1 + 56);
  v11 = *(_DWORD *)(a1 + 68);
  v25 = *(_DWORD *)(a1 + 64);
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(_DWORD *)(a3 + 44))
    v13 = 1;
  else
    v13 = *(_QWORD *)(a3 + 96) != 0;
  v22[0] = *MEMORY[0x1E0CF72D8];
  v20 = v22[0];
  *(_OWORD *)((char *)v22 + 12) = *(_OWORD *)(MEMORY[0x1E0CF72D8] + 12);
  v19 = *(_OWORD *)((char *)v22 + 12);
  *(_DWORD *)(a3 + 44) = 0;
  *(_QWORD *)(a3 + 96) = 0;
  v14 = MEMORY[0x1E0CA2E68];
  *(_OWORD *)(a3 + 64) = *MEMORY[0x1E0CA2E68];
  *(_QWORD *)(a3 + 80) = *(_QWORD *)(v14 + 16);
  *(_QWORD *)(a3 + 88) = 0;
  *(_WORD *)(a3 + 40) = 256;
  *(_QWORD *)(a3 + 56) = 0;
  result = mach_absolute_time();
  *(_QWORD *)(a3 + 48) = result;
  *(_OWORD *)(a3 + 148) = v20;
  *(_OWORD *)(a3 + 160) = v19;
  *(_BYTE *)(a3 + 176) = 0;
  if (v13)
  {
    if (gLogCategory_APAudioHoseManagerBuffered <= 50
      && (gLogCategory_APAudioHoseManagerBuffered != -1 || _LogCategory_Initialize()))
    {
      if (v7)
        CMBaseObjectGetDerivedStorage();
      *(_QWORD *)time = v9;
      *(_DWORD *)&time[8] = v10;
      *(_QWORD *)&time[12] = v24;
      *(_DWORD *)&time[20] = v25;
      CMTimeGetSeconds((CMTime *)time);
      LogPrintF();
    }
    if (*(_BYTE *)(DerivedStorage + 186))
    {
      *(_QWORD *)time = v9;
      *(_DWORD *)&time[8] = v10;
      *(_QWORD *)&time[12] = v24;
      *(_DWORD *)&time[20] = v25;
      APSAudioTransportTimeMakeWithMediaTime();
      if (!v7)
        goto LABEL_30;
    }
    else
    {
      *(_QWORD *)v21 = v9;
      *(_DWORD *)&v21[8] = v10;
      *(_QWORD *)&v21[12] = v24;
      *(_DWORD *)&v21[20] = v25;
      CMTimeConvertScale((CMTime *)time, (CMTime *)v21, v11, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
      APSAudioTransportTimeMakeWithRTPTime();
      if (!v7)
      {
LABEL_30:
        v16 = *(const void **)a3;
        *(_OWORD *)v21 = v22[0];
        *(_OWORD *)&v21[12] = *(_OWORD *)((char *)v22 + 12);
        APSEndpointStreamAudioHoseProtocolGetProtocolID();
        result = CMBaseObjectGetProtocolVTable();
        if (result)
        {
          v17 = *(_QWORD *)(result + 16);
          if (v17)
          {
            v18 = *(uint64_t (**)(const void *, uint64_t, _BYTE *, _QWORD, const void *))(v17 + 24);
            if (v18)
            {
              *(_OWORD *)time = *(_OWORD *)v21;
              *(_OWORD *)&time[12] = *(_OWORD *)&v21[12];
              result = v18(v16, v8, time, audioHoseManagerBuffered_hoseFlushCallbackCompletionHandler, v7);
            }
            else
            {
              result = audioHoseManagerBuffered_hoseFlushCallbackCompletionHandler(v16, 0, MEMORY[0x1E0CF72D8], 0xFFFFCE12, v7);
            }
          }
        }
        ++*(_DWORD *)(a3 + 144);
        return result;
      }
    }
    CFRetain(v7);
    goto LABEL_30;
  }
  if (gLogCategory_APAudioHoseManagerBuffered <= 50)
  {
    if (gLogCategory_APAudioHoseManagerBuffered != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
    {
      if (v7)
        CMBaseObjectGetDerivedStorage();
      return LogPrintF();
    }
  }
  return result;
}

@end
