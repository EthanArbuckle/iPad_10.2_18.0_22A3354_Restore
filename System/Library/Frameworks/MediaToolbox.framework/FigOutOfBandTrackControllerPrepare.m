@implementation FigOutOfBandTrackControllerPrepare

void __FigOutOfBandTrackControllerPrepare_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFDictionary *v3;
  const __CFNumber *Value;
  int v5;
  unsigned int v6;
  int v7;
  const void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int (*v16)(uint64_t, uint64_t, _QWORD, _QWORD, uint64_t);
  uint64_t FigBaseObject;
  void (*v18)(uint64_t, const __CFString *, _QWORD);
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, __int128 *, uint64_t);
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, const __CFString *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int (*v28)(uint64_t, const __CFString *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  unsigned int (*v31)(uint64_t, uint64_t, _QWORD);
  __int128 v32;
  uint64_t v33;
  CFTypeRef cf;
  __int128 valuePtr;
  uint64_t v36;

  cf = 0;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16))
    goto LABEL_51;
  FigAtomicCompareAndSwap32();
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 144))
  {
    v3 = *(const __CFDictionary **)(v2 + 48);
    if (v3)
    {
      Value = (const __CFNumber *)CFDictionaryGetValue(v3, CFSTR("ReferenceSecurityPolicyFlag"));
      if (Value)
      {
        LODWORD(valuePtr) = 0;
        CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
        v5 = valuePtr;
        v6 = FigByteStreamFactoryTranslateReferenceSecurityOptions(valuePtr);
      }
      else
      {
        v5 = 0;
        v6 = 0;
      }
      v8 = CFDictionaryGetValue(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 48), CFSTR("ReferenceSecurityPolicyFlagBaseURL"));
      v7 = 0;
      v2 = *(_QWORD *)(a1 + 32);
      if (v5 && v8)
      {
        if (!FigIsReferenceAllowedBySecurityPolicy())
          goto LABEL_57;
        v2 = *(_QWORD *)(a1 + 32);
        v7 = 1;
      }
    }
    else
    {
      v7 = 0;
      v6 = 0;
    }
    if (FigByteStreamFactoryCreateStreamFromURLWithOptions(*(const __CFURL **)(v2 + 40), v6, 0, (_QWORD *)(v2 + 144), &cf, 0, 0, 0))goto LABEL_56;
    if (cf)
      v9 = v7;
    else
      v9 = 0;
    if (v9 != 1 || FigIsReferenceAllowedBySecurityPolicy())
      goto LABEL_18;
LABEL_57:
    v13 = 0;
    goto LABEL_47;
  }
LABEL_18:
  v10 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v10 + 152))
  {
    if (FigWebVTTFormatReaderCreateFromStream(*(const void **)(v10 + 144), *MEMORY[0x1E0C9AE00], (_QWORD *)(v10 + 152)))goto LABEL_56;
    v10 = *(_QWORD *)(a1 + 32);
  }
  if (!*(_QWORD *)(v10 + 160))
  {
    if (FigAssetCreateWithFormatReader(*MEMORY[0x1E0C9AE00], *(const void **)(v10 + 152), 0, 0, (_QWORD *)(v10 + 160)))goto LABEL_56;
    v10 = *(_QWORD *)(a1 + 32);
  }
  v12 = v10 + 176;
  v11 = *(_QWORD *)(v10 + 176);
  if (!v11)
  {
    v15 = *(_QWORD *)(v10 + 160);
    v14 = *(_QWORD *)(v10 + 168);
    v16 = *(unsigned int (**)(uint64_t, uint64_t, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                               + 16)
                                                                                   + 96);
    if (!v16)
    {
      v13 = 0;
      goto LABEL_47;
    }
    if (!v16(v14, v15, 0, 0, v12))
    {
      CMNotificationCenterGetDefaultLocalCenter();
      CMNotificationCenterAddListener();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176);
      v13 = 1;
      goto LABEL_29;
    }
LABEL_56:
    v13 = 0;
    goto LABEL_47;
  }
  v13 = 0;
LABEL_29:
  FigBaseObject = FigPlaybackItemGetFigBaseObject(v11);
  v18 = *(void (**)(uint64_t, const __CFString *, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v18)
    v18(FigBaseObject, CFSTR("DisplayNonForcedSubtitlesChanged"), *MEMORY[0x1E0C9AE50]);
  v19 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v19 + 196) & 1) != 0)
  {
    v20 = *(_QWORD *)(v19 + 176);
    v32 = *(_OWORD *)(v19 + 184);
    v33 = *(_QWORD *)(v19 + 200);
    v21 = *(void (**)(uint64_t, __int128 *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
    if (v21)
    {
      valuePtr = v32;
      v36 = v33;
      v21(v20, &valuePtr, 5);
    }
    v19 = *(_QWORD *)(a1 + 32);
  }
  v22 = *(_QWORD *)(v19 + 104);
  if (v22)
  {
    v23 = FigPlaybackItemGetFigBaseObject(*(_QWORD *)(v19 + 176));
    v24 = *(void (**)(uint64_t, const __CFString *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v24)
      v24(v23, CFSTR("TextMarkupArray"), v22);
  }
  v25 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v25 + 112) || (v26 = *(_QWORD *)(v25 + 120)) == 0)
  {
LABEL_43:
    v29 = *(_QWORD *)(v25 + 168);
    v30 = *(_QWORD *)(v25 + 176);
    v31 = *(unsigned int (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
    if (v31 && !v31(v29, v30, 0))
      goto LABEL_51;
    goto LABEL_47;
  }
  v27 = FigPlaybackItemGetFigBaseObject(*(_QWORD *)(v25 + 176));
  v28 = *(unsigned int (**)(uint64_t, const __CFString *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                            + 56);
  if (v28 && !v28(v27, CFSTR("OutOfBandTextRenderingVideoDimensions"), v26))
  {
    v25 = *(_QWORD *)(a1 + 32);
    goto LABEL_43;
  }
LABEL_47:
  if (FigSignalErrorAt())
  {
    if (v13)
    {
      CMNotificationCenterGetDefaultLocalCenter();
      CMNotificationCenterRemoveListener();
    }
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterPostNotification();
  }
LABEL_51:
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16))
    FigAtomicCompareAndSwap32();
  if (cf)
    CFRelease(cf);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
