@implementation FlushWithinSampleRange

uint64_t __audioHoseManagerBuffered_FlushWithinSampleRange_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int16 v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t DerivedStorage;
  __int128 v13;
  const void *v14;
  uint64_t ProtocolVTable;
  uint64_t v16;
  void (*v17)(const void *, uint64_t, _BYTE *, uint64_t, _BYTE *, uint64_t (*)(const void *, int, _OWORD *, int, _OWORD *, unsigned int, const void *), const void *);
  uint64_t result;
  int32_t newTimescale;
  int v20;
  _BYTE v21[28];
  _BYTE v22[28];
  _OWORD v23[2];
  _OWORD v24[2];
  CMTime v25;
  _BYTE rhs[28];
  _BYTE time[28];
  uint64_t v28;
  int v29;
  uint64_t v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = *(_WORD *)(a1 + 100);
  if ((__int16)(*(_WORD *)(a3 + 10) - v5) >= 1)
    *(_WORD *)(a3 + 10) = v5;
  if (gLogCategory_APAudioHoseManagerBuffered <= 50
    && (gLogCategory_APAudioHoseManagerBuffered != -1 || _LogCategory_Initialize()))
  {
    if (*(_QWORD *)(a1 + 32))
      CMBaseObjectGetDerivedStorage();
    *(_OWORD *)time = *(_OWORD *)(a3 + 64);
    *(_QWORD *)&time[16] = *(_QWORD *)(a3 + 80);
    CMTimeGetSeconds((CMTime *)time);
    LogPrintF();
  }
  v6 = *(const void **)(a1 + 32);
  v7 = *(unsigned int *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 44);
  v9 = *(_DWORD *)(a1 + 52);
  v30 = *(_QWORD *)(a1 + 56);
  v10 = *(unsigned int *)(a1 + 68);
  v31 = *(_DWORD *)(a1 + 64);
  v11 = *(_QWORD *)(a1 + 72);
  v20 = *(_DWORD *)(a1 + 80);
  v28 = *(_QWORD *)(a1 + 84);
  newTimescale = *(_DWORD *)(a1 + 96);
  v29 = *(_DWORD *)(a1 + 92);
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v25 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  v24[0] = *MEMORY[0x1E0CF72D8];
  v13 = v24[0];
  *(_OWORD *)((char *)v24 + 12) = *(_OWORD *)(MEMORY[0x1E0CF72D8] + 12);
  v23[0] = v13;
  *(_OWORD *)((char *)v23 + 12) = *(_OWORD *)((char *)v24 + 12);
  *(_OWORD *)time = *(_OWORD *)(a3 + 16);
  *(_QWORD *)&time[16] = *(_QWORD *)(a3 + 32);
  *(_QWORD *)rhs = v8;
  *(_QWORD *)&rhs[12] = v30;
  *(_DWORD *)&rhs[8] = v9;
  *(_DWORD *)&rhs[20] = v31;
  CMTimeSubtract(&v25, (CMTime *)time, (CMTime *)rhs);
  if (gLogCategory_APAudioHoseManagerBuffered <= 50
    && (gLogCategory_APAudioHoseManagerBuffered != -1 || _LogCategory_Initialize()))
  {
    if (v6)
      CMBaseObjectGetDerivedStorage();
    *(_OWORD *)time = *(_OWORD *)(a3 + 64);
    *(_QWORD *)&time[16] = *(_QWORD *)(a3 + 80);
    CMTimeGetSeconds((CMTime *)time);
    LogPrintF();
  }
  *(_OWORD *)rhs = *(_OWORD *)(a3 + 64);
  *(_QWORD *)&rhs[16] = *(_QWORD *)(a3 + 80);
  *(CMTime *)v22 = v25;
  CMTimeSubtract((CMTime *)time, (CMTime *)rhs, (CMTime *)v22);
  *(_OWORD *)(a3 + 64) = *(_OWORD *)time;
  *(_QWORD *)(a3 + 80) = *(_QWORD *)&time[16];
  if (gLogCategory_APAudioHoseManagerBuffered <= 50
    && (gLogCategory_APAudioHoseManagerBuffered != -1 || _LogCategory_Initialize()))
  {
    if (v6)
      CMBaseObjectGetDerivedStorage();
    *(CMTime *)time = v25;
    CMTimeGetSeconds((CMTime *)time);
    *(_OWORD *)time = *(_OWORD *)(a3 + 64);
    *(_QWORD *)&time[16] = *(_QWORD *)(a3 + 80);
    CMTimeGetSeconds((CMTime *)time);
    LogPrintF();
  }
  *(_WORD *)(a3 + 40) = 256;
  *(_QWORD *)(a3 + 56) = 0;
  *(_QWORD *)(a3 + 48) = mach_absolute_time();
  if (gLogCategory_APAudioHoseManagerBuffered <= 50
    && (gLogCategory_APAudioHoseManagerBuffered != -1 || _LogCategory_Initialize()))
  {
    if (v6)
      CMBaseObjectGetDerivedStorage();
    *(_QWORD *)time = v8;
    *(_QWORD *)&time[12] = v30;
    *(_DWORD *)&time[8] = v9;
    *(_DWORD *)&time[20] = v31;
    CMTimeGetSeconds((CMTime *)time);
    *(_QWORD *)time = v11;
    *(_QWORD *)&time[12] = v28;
    *(_DWORD *)&time[8] = v20;
    *(_DWORD *)&time[20] = v29;
    CMTimeGetSeconds((CMTime *)time);
    LogPrintF();
  }
  if (!*(_BYTE *)(DerivedStorage + 186))
  {
    *(_QWORD *)rhs = v8;
    *(_QWORD *)&rhs[12] = v30;
    *(_DWORD *)&rhs[8] = v9;
    *(_DWORD *)&rhs[20] = v31;
    CMTimeConvertScale((CMTime *)time, (CMTime *)rhs, newTimescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    APSAudioTransportTimeMakeWithRTPTime();
    *(_QWORD *)rhs = v11;
    *(_QWORD *)&rhs[12] = v28;
    *(_DWORD *)&rhs[8] = v20;
    *(_DWORD *)&rhs[20] = v29;
    CMTimeConvertScale((CMTime *)time, (CMTime *)rhs, newTimescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    APSAudioTransportTimeMakeWithRTPTime();
    if (!v6)
      goto LABEL_34;
    goto LABEL_33;
  }
  *(_QWORD *)time = v8;
  *(_QWORD *)&time[12] = v30;
  *(_DWORD *)&time[8] = v9;
  *(_DWORD *)&time[20] = v31;
  APSAudioTransportTimeMakeWithMediaTime();
  *(_QWORD *)time = v11;
  *(_QWORD *)&time[12] = v28;
  *(_DWORD *)&time[8] = v20;
  *(_DWORD *)&time[20] = v29;
  APSAudioTransportTimeMakeWithMediaTime();
  if (v6)
LABEL_33:
    CFRetain(v6);
LABEL_34:
  v14 = *(const void **)a3;
  *(_OWORD *)v22 = v24[0];
  *(_OWORD *)&v22[12] = *(_OWORD *)((char *)v24 + 12);
  *(_OWORD *)v21 = v23[0];
  *(_OWORD *)&v21[12] = *(_OWORD *)((char *)v23 + 12);
  APSEndpointStreamAudioHoseProtocolGetProtocolID();
  ProtocolVTable = CMBaseObjectGetProtocolVTable();
  if (ProtocolVTable)
  {
    v16 = *(_QWORD *)(ProtocolVTable + 16);
    if (v16)
    {
      v17 = *(void (**)(const void *, uint64_t, _BYTE *, uint64_t, _BYTE *, uint64_t (*)(const void *, int, _OWORD *, int, _OWORD *, unsigned int, const void *), const void *))(v16 + 32);
      if (v17)
      {
        *(_OWORD *)time = *(_OWORD *)v22;
        *(_OWORD *)&time[12] = *(_OWORD *)&v22[12];
        *(_OWORD *)rhs = *(_OWORD *)v21;
        *(_OWORD *)&rhs[12] = *(_OWORD *)&v21[12];
        v17(v14, v7, time, v10, rhs, audioHoseManagerBuffered_hoseFlushWithinSampleRangeCallbackCompletionHandler, v6);
      }
      else
      {
        audioHoseManagerBuffered_hoseFlushWithinSampleRangeCallbackCompletionHandler(v14, 0, MEMORY[0x1E0CF72D8], 0, MEMORY[0x1E0CF72D8], 0xFFFFCE12, v6);
      }
    }
  }
  ++*(_DWORD *)(a3 + 144);
  result = APMessageRingBufferedGetByteCountAtIndex(*(_QWORD *)(DerivedStorage + 200), (unsigned __int16)(*(_WORD *)(a3 + 10) + 1), (int *)(a3 + 88));
  if ((_DWORD)result)
    return APSLogErrorAt();
  return result;
}

@end
