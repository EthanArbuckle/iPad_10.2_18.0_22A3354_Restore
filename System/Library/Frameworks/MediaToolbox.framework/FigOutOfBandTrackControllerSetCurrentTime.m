@implementation FigOutOfBandTrackControllerSetCurrentTime

void __FigOutOfBandTrackControllerSetCurrentTime_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, __int128 *, _QWORD);
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 16))
  {
    v3 = *(_QWORD *)(v2 + 176);
    if (v3)
    {
      v5 = *(_OWORD *)(a1 + 40);
      v6 = *(_QWORD *)(a1 + 56);
      v4 = *(void (**)(uint64_t, __int128 *, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
      if (v4)
      {
        v7 = v5;
        v8 = v6;
        v4(v3, &v7, 0);
      }
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  CFRelease((CFTypeRef)v2);
}

@end
