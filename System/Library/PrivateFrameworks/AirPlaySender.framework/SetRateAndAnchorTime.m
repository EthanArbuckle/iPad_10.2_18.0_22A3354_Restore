@implementation SetRateAndAnchorTime

uint64_t __audioHoseManagerBuffered_SetRateAndAnchorTime_block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  _QWORD *v6;
  const void *v7;
  const void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t ProtocolVTable;
  uint64_t v12;
  void (*v13)(const void *, uint64_t, _OWORD *, __int128 *, _OWORD *, uint64_t (*)(const void *, int, _OWORD *, __int128 *, _OWORD *, int, const void *), const void *);
  const void *v14;
  uint64_t (*v15)(const void *, _QWORD, _QWORD);
  _BYTE v16[28];
  __int128 v17;
  uint64_t v18;
  _BYTE v19[28];
  _OWORD v20[2];
  __int128 v21;
  uint64_t v22;
  _OWORD v23[2];

  v4 = result;
  v5 = *(_DWORD *)(result + 64);
  if (v5 == 1)
    v6 = (_QWORD *)MEMORY[0x1E0C9AE50];
  else
    v6 = (_QWORD *)MEMORY[0x1E0C9AE40];
  if (*(_DWORD *)(a3 + 44) == v5)
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
      LogPrintF();
    }
    v7 = *(const void **)(v4 + 32);
    if (v7)
    {
      CFRetain(v7);
      v8 = *(const void **)(v4 + 32);
    }
    else
    {
      v8 = 0;
    }
    v9 = *(const void **)a3;
    v10 = *(unsigned int *)(v4 + 64);
    *(_OWORD *)v19 = *(_OWORD *)(v4 + 68);
    *(_OWORD *)&v19[12] = *(_OWORD *)(v4 + 80);
    v17 = *(_OWORD *)(v4 + 40);
    v18 = *(_QWORD *)(v4 + 56);
    *(_OWORD *)v16 = *(_OWORD *)(v4 + 96);
    *(_OWORD *)&v16[12] = *(_OWORD *)(v4 + 108);
    APSEndpointStreamAudioHoseProtocolGetProtocolID();
    ProtocolVTable = CMBaseObjectGetProtocolVTable();
    if (ProtocolVTable)
    {
      v12 = *(_QWORD *)(ProtocolVTable + 16);
      if (v12)
      {
        v13 = *(void (**)(const void *, uint64_t, _OWORD *, __int128 *, _OWORD *, uint64_t (*)(const void *, int, _OWORD *, __int128 *, _OWORD *, int, const void *), const void *))(v12 + 48);
        if (v13)
        {
          v23[0] = *(_OWORD *)v19;
          *(_OWORD *)((char *)v23 + 12) = *(_OWORD *)&v19[12];
          v21 = v17;
          v22 = v18;
          v20[0] = *(_OWORD *)v16;
          *(_OWORD *)((char *)v20 + 12) = *(_OWORD *)&v16[12];
          v13(v9, v10, v23, &v21, v20, audioHoseManagerBuffered_hoseSetRateAndAnchorTimeCallbackCompletionHandler, v8);
        }
        else
        {
          audioHoseManagerBuffered_hoseSetRateAndAnchorTimeCallbackCompletionHandler(v9, 0, MEMORY[0x1E0CF72D8], MEMORY[0x1E0CF7500], MEMORY[0x1E0CF72D8], -12782, v8);
        }
      }
    }
    v14 = *(const void **)a3;
    result = CMBaseObjectGetVTable();
    v15 = *(uint64_t (**)(const void *, _QWORD, _QWORD))(*(_QWORD *)(result + 8) + 56);
    if (v15)
      result = v15(v14, *MEMORY[0x1E0CF7380], *v6);
    *(_DWORD *)(a3 + 44) = *(_DWORD *)(v4 + 64);
  }
  return result;
}

@end
