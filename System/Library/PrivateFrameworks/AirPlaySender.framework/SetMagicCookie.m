@implementation SetMagicCookie

uint64_t __audioHoseManagerBuffered_SetMagicCookie_block_invoke(uint64_t result, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;
  const void *v5;
  uint64_t v6;
  uint64_t MagicCookieIDForMagicCookieData;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t (*)(uint64_t, uint64_t, int, uint64_t), uint64_t);
  int v12;

  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24))
  {
    v4 = result;
    if (gLogCategory_APAudioHoseManagerBuffered <= 50
      && (gLogCategory_APAudioHoseManagerBuffered != -1 || _LogCategory_Initialize()))
    {
      if (*(_QWORD *)(v4 + 40))
        CMBaseObjectGetDerivedStorage();
      audioHoseManagerBuffered_getMagicCookieIDForMagicCookieData(*(CFDataRef *)(v4 + 48));
      LogPrintF();
    }
    v5 = *(const void **)(v4 + 40);
    if (v5)
      CFRetain(v5);
    v6 = *a3;
    MagicCookieIDForMagicCookieData = audioHoseManagerBuffered_getMagicCookieIDForMagicCookieData(*(CFDataRef *)(v4 + 48));
    v9 = *(_QWORD *)(v4 + 40);
    v8 = *(_QWORD *)(v4 + 48);
    APSEndpointStreamAudioHoseProtocolGetProtocolID();
    result = CMBaseObjectGetProtocolVTable();
    if (result && (v10 = *(_QWORD *)(result + 16)) != 0)
    {
      v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t (*)(uint64_t, uint64_t, int, uint64_t), uint64_t))(v10 + 104);
      if (v11)
      {
        result = v11(v6, MagicCookieIDForMagicCookieData, v8, audioHoseManagerBuffered_hoseSetMagicCookieCallbackCompletionHandler, v9);
        v12 = result;
        if (!(_DWORD)result)
          return result;
      }
      else
      {
        v12 = -12782;
        result = audioHoseManagerBuffered_hoseSetMagicCookieCallbackCompletionHandler(v6, MagicCookieIDForMagicCookieData, -12782, v9);
      }
    }
    else
    {
      v12 = -12788;
    }
    if (gLogCategory_APAudioHoseManagerBuffered <= 90)
    {
      if (gLogCategory_APAudioHoseManagerBuffered != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
      {
        if (*(_QWORD *)(v4 + 40))
          CMBaseObjectGetDerivedStorage();
        result = LogPrintF();
      }
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v4 + 32) + 8) + 24) = v12;
  }
  return result;
}

@end
