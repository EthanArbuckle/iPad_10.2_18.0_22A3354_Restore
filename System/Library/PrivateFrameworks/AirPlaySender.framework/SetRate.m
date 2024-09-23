@implementation SetRate

CFTypeRef __audioHoseManagerBuffered_SetRate_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v5;
  CFTypeRef v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t ProtocolVTable;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, _OWORD *, uint64_t (*)(uint64_t, uint64_t, uint64_t, int, uint64_t), char *);
  uint64_t v14;
  void (*v15)(uint64_t, _QWORD, _QWORD);
  const void *v16;
  CFTypeRef result;
  _BYTE v18[28];
  _OWORD v19[2];

  v5 = (char *)malloc_type_calloc(1uLL, 0x60uLL, 0x10A0040428D2481uLL);
  v6 = *(CFTypeRef *)(a1 + 32);
  if (v6)
    v6 = CFRetain(v6);
  *((_QWORD *)v5 + 2) = v6;
  *(_QWORD *)v5 = *(_QWORD *)(a1 + 40);
  *((_QWORD *)v5 + 1) = *(_QWORD *)(a1 + 48);
  *((_DWORD *)v5 + 6) = *(_DWORD *)(a1 + 72);
  v7 = *(_OWORD *)(a1 + 76);
  *(_OWORD *)(v5 + 40) = *(_OWORD *)(a1 + 88);
  *(_OWORD *)(v5 + 28) = v7;
  *(_DWORD *)(a3 + 44) = *(_DWORD *)(a1 + 72);
  if (gLogCategory_APAudioHoseManagerBuffered <= 50
    && (gLogCategory_APAudioHoseManagerBuffered != -1 || _LogCategory_Initialize()))
  {
    if (*(_QWORD *)(a1 + 56))
      CMBaseObjectGetDerivedStorage();
    LogPrintF();
  }
  v8 = *(_QWORD *)a3;
  v9 = *(unsigned int *)(a1 + 72);
  *(_OWORD *)v18 = *(_OWORD *)(a1 + 76);
  *(_OWORD *)&v18[12] = *(_OWORD *)(a1 + 88);
  APSEndpointStreamAudioHoseProtocolGetProtocolID();
  ProtocolVTable = CMBaseObjectGetProtocolVTable();
  if (ProtocolVTable)
  {
    v12 = *(_QWORD *)(ProtocolVTable + 16);
    if (v12)
    {
      v13 = *(void (**)(uint64_t, uint64_t, _OWORD *, uint64_t (*)(uint64_t, uint64_t, uint64_t, int, uint64_t), char *))(v12 + 80);
      if (v13)
      {
        v19[0] = *(_OWORD *)v18;
        *(_OWORD *)((char *)v19 + 12) = *(_OWORD *)&v18[12];
        v13(v8, v9, v19, audioHoseManagerBuffered_hoseSetRateCallbackCompletionHandler, v5);
      }
      else
      {
        audioHoseManagerBuffered_hoseSetRateCallbackCompletionHandler(v8, v11, MEMORY[0x1E0CF7500], -12782, (uint64_t)v5);
      }
    }
  }
  v14 = *(_QWORD *)a3;
  v15 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v15)
    v15(v14, *MEMORY[0x1E0CF7380], *MEMORY[0x1E0C9AE50]);
  v16 = *(const void **)(*(_QWORD *)(a1 + 64) + 440);
  if (v16)
    CFRelease(v16);
  result = *(CFTypeRef *)a3;
  if (*(_QWORD *)a3)
    result = CFRetain(result);
  *(_QWORD *)(*(_QWORD *)(a1 + 64) + 440) = result;
  *(_DWORD *)(a3 + 92) = 0;
  return result;
}

@end
