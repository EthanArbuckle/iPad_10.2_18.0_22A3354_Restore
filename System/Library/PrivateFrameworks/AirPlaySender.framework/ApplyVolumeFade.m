@implementation ApplyVolumeFade

uint64_t __audioHoseManagerBuffered_ApplyVolumeFade_block_invoke(uint64_t result, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, CMTime *);
  CMTime v9;
  CMTime time;

  v4 = result;
  if (*((_BYTE *)a3 + 8))
  {
    if (gLogCategory_APAudioHoseManagerBuffered <= 50)
    {
      if (gLogCategory_APAudioHoseManagerBuffered != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
      {
        if (*(_QWORD *)(v4 + 32))
          CMBaseObjectGetDerivedStorage();
        return LogPrintF();
      }
    }
  }
  else
  {
    if (gLogCategory_APAudioHoseManagerBuffered <= 50
      && (gLogCategory_APAudioHoseManagerBuffered != -1 || _LogCategory_Initialize()))
    {
      if (*(_QWORD *)(v4 + 32))
        CMBaseObjectGetDerivedStorage();
      APSGetVolumeFadeTypeName();
      time = *(CMTime *)(v4 + 44);
      CMTimeGetSeconds(&time);
      LogPrintF();
    }
    v5 = *a3;
    v6 = *(unsigned int *)(v4 + 40);
    *(_OWORD *)&v9.value = *(_OWORD *)(v4 + 44);
    v9.epoch = *(_QWORD *)(v4 + 60);
    APSEndpointStreamAudioHoseProtocolGetProtocolID();
    result = CMBaseObjectGetProtocolVTable();
    if (result)
    {
      v7 = *(_QWORD *)(result + 16);
      if (v7)
      {
        v8 = *(uint64_t (**)(uint64_t, uint64_t, CMTime *))(v7 + 72);
        if (v8)
        {
          time = v9;
          return v8(v5, v6, &time);
        }
      }
    }
  }
  return result;
}

@end
