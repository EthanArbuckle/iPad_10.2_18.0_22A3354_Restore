@implementation UpdateHosesPrimed

uint64_t __audioHoseManagerBuffered_UpdateHosesPrimed_block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  BOOL v5;
  char v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  CMTime time;
  CMTime time2;
  CMTime time1;

  v4 = result;
  if (gLogCategory_APAudioHoseManagerBuffered <= 50)
  {
    if (gLogCategory_APAudioHoseManagerBuffered != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
    {
      if (*(_QWORD *)(v4 + 72))
        CMBaseObjectGetDerivedStorage();
      result = LogPrintF();
    }
  }
  if (!*(_DWORD *)(a3 + 92))
  {
    if ((*(_BYTE *)(*(_QWORD *)(v4 + 80) + 300) & 1) != 0)
    {
      audioHoseManagerBuffered_getBufferLevelTimeEstimateForHoseStartup(*(_QWORD *)(v4 + 88), (__n128 *)a3, &time1);
      time2 = *(CMTime *)(*(_QWORD *)(v4 + 80) + 288);
      v5 = CMTimeCompare(&time1, &time2) >= 0;
    }
    else
    {
      v5 = 0;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v4 + 32) + 8) + 24) = v5;
    if (*(_QWORD *)(*(_QWORD *)(v4 + 80) + 320))
      v6 = *(_BYTE *)(a3 + 176);
    else
      v6 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v4 + 40) + 8) + 24) = v6;
    if (*(_BYTE *)(v4 + 104))
    {
      v7 = 0;
    }
    else
    {
      v8 = *(_QWORD *)(v4 + 80);
      v9 = 344;
      if (!*(_BYTE *)(v8 + 328))
        v9 = 336;
      v7 = *(_QWORD *)(v4 + 96) - *(_QWORD *)(a3 + 48) >= *(_QWORD *)(v8 + v9);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v4 + 48) + 8) + 24) = v7;
    if (gLogCategory_APAudioHoseManagerBuffered <= 50
      && (gLogCategory_APAudioHoseManagerBuffered != -1 || _LogCategory_Initialize()))
    {
      if (*(_QWORD *)(v4 + 88))
      {
        CMBaseObjectGetDerivedStorage();
        v10 = *(_QWORD *)(v4 + 88);
      }
      else
      {
        v10 = 0;
      }
      audioHoseManagerBuffered_hoseBufferedToStartHighWaterMark(v10, a3);
      LogPrintF();
    }
    result = audioHoseManagerBuffered_hoseBufferedToStartHighWaterMark(*(_QWORD *)(v4 + 88), a3);
    if ((_DWORD)result && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v4 + 40) + 8) + 24)
      || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v4 + 32) + 8) + 24)
      && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v4 + 40) + 8) + 24)
      || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v4 + 48) + 8) + 24))
    {
      *(_DWORD *)(a3 + 92) = 1;
      if (gLogCategory_APAudioHoseManagerBuffered <= 50)
      {
        if (gLogCategory_APAudioHoseManagerBuffered != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
        {
          if (*(_QWORD *)(v4 + 72))
            CMBaseObjectGetDerivedStorage();
          audioHoseManagerBuffered_getBufferLevelTimeEstimateForHoseStartup(*(_QWORD *)(v4 + 88), (__n128 *)a3, &time);
          CMTimeGetSeconds(&time);
          time2 = *(CMTime *)(*(_QWORD *)(v4 + 80) + 48);
          CMTimeGetSeconds(&time2);
          UpTicksToMilliseconds();
          if (!*(_BYTE *)(v4 + 104))
            UpTicksToMilliseconds();
          time2 = *(CMTime *)(a3 + 64);
          CMTimeGetSeconds(&time2);
          time2 = *(CMTime *)(*(_QWORD *)(v4 + 80) + 288);
          CMTimeGetSeconds(&time2);
          result = LogPrintF();
        }
      }
    }
  }
  if ((*(_DWORD *)(a3 + 92) - 1) <= 2)
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v4 + 56) + 8) + 24);
  v11 = *(_QWORD *)(v4 + 96) - *(_QWORD *)(a3 + 48);
  v12 = *(_QWORD *)(*(_QWORD *)(v4 + 64) + 8);
  if (v11 < *(_QWORD *)(v12 + 24))
    *(_QWORD *)(v12 + 24) = v11;
  return result;
}

@end
