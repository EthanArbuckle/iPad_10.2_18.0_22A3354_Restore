@implementation NotifyHosesDataAvailable

uint64_t __audioHoseManagerBuffered_NotifyHosesDataAvailable_block_invoke(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);

  if (gLogCategory_APAudioHoseManagerBuffered <= 50
    && (gLogCategory_APAudioHoseManagerBuffered != -1 || _LogCategory_Initialize()))
  {
    if (*(_QWORD *)(a1 + 32))
      CMBaseObjectGetDerivedStorage();
    LogPrintF();
  }
  v5 = *a3;
  APSEndpointStreamAudioHoseProtocolGetProtocolID();
  result = CMBaseObjectGetProtocolVTable();
  if (result)
  {
    v7 = *(_QWORD *)(result + 16);
    if (v7)
    {
      v8 = *(uint64_t (**)(uint64_t))(v7 + 40);
      if (v8)
        return v8(v5);
    }
  }
  return result;
}

@end
