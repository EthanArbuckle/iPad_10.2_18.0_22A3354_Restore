@implementation ProcessRateChange

uint64_t __audioRendererCentral_ProcessRateChange_block_invoke(uint64_t a1)
{
  int v2;
  float v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, _QWORD);
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, _QWORD, _QWORD);
  uint64_t DerivedStorage;
  uint64_t v16;

  v2 = *(unsigned __int8 *)(a1 + 52);
  v3 = *(float *)(a1 + 48);
  CMBaseObjectGetDerivedStorage();
  if (v3 == 0.0)
  {
    if (!v2)
    {
      result = audioRendererCentral_maybeSetAudioSessionStateToNotPlaying();
      if ((_DWORD)result)
        goto LABEL_17;
      DerivedStorage = CMBaseObjectGetDerivedStorage();
      if (*(_BYTE *)(DerivedStorage + 81) == 1)
      {
        v16 = DerivedStorage;
        if (*(_QWORD *)(DerivedStorage + 64))
        {
          result = 0;
          *(_BYTE *)(v16 + 81) = 0;
          goto LABEL_17;
        }
      }
    }
    goto LABEL_16;
  }
  if (!v2)
    goto LABEL_16;
  v4 = CMBaseObjectGetDerivedStorage();
  if (!*(_BYTE *)(v4 + 81))
  {
    v5 = v4;
    v6 = *(_QWORD *)(v4 + 64);
    if (v6)
    {
      v7 = *(_QWORD *)(CMBaseObjectGetVTable() + 16);
      if (!v7)
      {
LABEL_18:
        result = 4294948075;
        goto LABEL_17;
      }
      v8 = *(uint64_t (**)(uint64_t, _QWORD))(v7 + 80);
      if (!v8)
      {
LABEL_23:
        result = 4294948071;
        goto LABEL_17;
      }
      result = v8(v6, 0);
      if ((_DWORD)result)
        goto LABEL_17;
      *(_BYTE *)(v5 + 81) = 1;
    }
  }
  v10 = CMBaseObjectGetDerivedStorage();
  if (*(_BYTE *)(v10 + 80) || (v11 = v10, (v12 = *(_QWORD *)(v10 + 64)) == 0))
  {
LABEL_16:
    result = 0;
    goto LABEL_17;
  }
  v13 = *(_QWORD *)(CMBaseObjectGetVTable() + 16);
  if (!v13)
    goto LABEL_18;
  v14 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(v13 + 56);
  if (!v14)
    goto LABEL_23;
  result = v14(v12, *MEMORY[0x1E0D49908], *MEMORY[0x1E0C9AE50]);
  if (!(_DWORD)result)
    *(_BYTE *)(v11 + 80) = 1;
LABEL_17:
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
