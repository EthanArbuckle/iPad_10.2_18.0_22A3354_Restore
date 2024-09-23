@implementation FigOutOfBandTrackControllerSetProperty

void __FigOutOfBandTrackControllerSetProperty_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t FigBaseObject;
  void (*v6)(uint64_t, const __CFString *, uint64_t);

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 16))
  {
    v3 = *(_QWORD *)(v2 + 176);
    if (v3)
    {
      if (*(_BYTE *)(v2 + 112))
      {
        v4 = *(_QWORD *)(v2 + 120);
        FigBaseObject = FigPlaybackItemGetFigBaseObject(v3);
        v6 = *(void (**)(uint64_t, const __CFString *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                         + 56);
        if (v6)
          v6(FigBaseObject, CFSTR("OutOfBandTextRenderingVideoDimensions"), v4);
      }
    }
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __FigOutOfBandTrackControllerSetProperty_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t FigBaseObject;
  void (*v6)(uint64_t, const __CFString *, uint64_t);

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 16))
  {
    v3 = *(_QWORD *)(v2 + 176);
    if (v3)
    {
      v4 = *(_QWORD *)(v2 + 104);
      FigBaseObject = FigPlaybackItemGetFigBaseObject(v3);
      v6 = *(void (**)(uint64_t, const __CFString *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
      if (v6)
        v6(FigBaseObject, CFSTR("TextMarkupArray"), v4);
    }
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
