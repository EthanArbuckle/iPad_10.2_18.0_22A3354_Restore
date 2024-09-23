@implementation FigOutOfBandTrackControllerSetRateAndAnchorTime

void __FigOutOfBandTrackControllerSetRateAndAnchorTime_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  float v4;
  void (*v5)(uint64_t, __int128 *, __int128 *, _QWORD, float);
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 16))
  {
    v3 = *(_QWORD *)(v2 + 168);
    if (v3)
    {
      v4 = *(float *)(a1 + 40);
      v8 = *(_OWORD *)(a1 + 44);
      v9 = *(_QWORD *)(a1 + 60);
      v6 = *(_OWORD *)(a1 + 68);
      v7 = *(_QWORD *)(a1 + 84);
      v5 = *(void (**)(uint64_t, __int128 *, __int128 *, _QWORD, float))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                             + 16)
                                                                                 + 88);
      if (v5)
      {
        v12 = v8;
        v13 = v9;
        v10 = v6;
        v11 = v7;
        v5(v3, &v12, &v10, 0, v4);
      }
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  CFRelease((CFTypeRef)v2);
}

@end
