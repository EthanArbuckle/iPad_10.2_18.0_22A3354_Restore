@implementation EnsureCurrentEventPlayoutLimitApplied

void __fpic_EnsureCurrentEventPlayoutLimitApplied_block_invoke(_QWORD *a1)
{
  uint64_t v1;
  CFIndex Count;
  CFIndex v4;
  CFIndex v5;
  CMTime *v6;
  const void *ValueAtIndex;
  uint64_t v8;
  CMTime *v9;
  CFIndex PerEventTrackingCount;
  CFIndex v11;
  CFIndex v12;
  CFIndex v13;
  __CFString *PerAssetPerEventTrackedObject;
  uint64_t v15;
  uint64_t v16;
  uint64_t DerivedStorage;
  BOOL v18;
  uint64_t v20;
  uint64_t v21;
  unsigned int (*v22)(uint64_t, CMTime *);
  CFDictionaryRef v23;
  CFDictionaryRef v24;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int value;
  unsigned int v27;
  Float64 Seconds;
  Float64 v29;
  uint64_t FigBaseObject;
  void (*v31)(uint64_t, const __CFString *, CFDictionaryRef);
  const void *v32;
  __CFArray *v33;
  CFDictionaryRef v34;
  const __CFAllocator *allocator;
  CFIndex v36;
  CMTime v37;
  os_log_type_t type;
  CMTime v39;
  CMTime v40;
  CMTime v41;
  CMTime v42;
  CMTime rhs;
  int v44;
  __int16 v45;
  Float64 v46;
  __int16 v47;
  Float64 v48;
  CMTime lhs;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v1 = a1[6];
  if ((*(_BYTE *)(v1 + 884) & 1) == 0)
    return;
  Count = CFArrayGetCount(*(CFArrayRef *)(v1 + 600));
  if (Count < 1)
    return;
  v4 = Count;
  v5 = 0;
  allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v6 = (CMTime *)MEMORY[0x1E0CA2E18];
  v36 = Count;
  do
  {
    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1[6] + 600), v5);
    v8 = (*(uint64_t (**)(_QWORD, _QWORD, const void *))(a1[6] + 80))(a1[7], a1[8], ValueAtIndex);
    memset(&v42, 0, sizeof(v42));
    FigPlayerInterstitialEventGetPlayoutLimit(v8, (uint64_t)&v42);
    if ((v42.flags & 1) == 0)
      goto LABEL_43;
    memset(&v41, 0, sizeof(v41));
    v9 = (CMTime *)a1[6];
    lhs = v9[17];
    rhs = v9[19];
    CMTimeAdd(&v41, &lhs, &rhs);
    PerEventTrackingCount = fpic_GetPerEventTrackingCount(a1[6], v5);
    v11 = PerEventTrackingCount - 1;
    if (PerEventTrackingCount < 1)
      goto LABEL_42;
    v12 = PerEventTrackingCount;
    v13 = 0;
    while (1)
    {
      v40 = *v6;
      PerAssetPerEventTrackedObject = (__CFString *)fpic_GetPerAssetPerEventTrackedObject(a1[6], v5, v13, CFSTR("PlaybackItem"));
      v15 = a1[7];
      v16 = a1[8];
      DerivedStorage = CMBaseObjectGetDerivedStorage();
      if (PerAssetPerEventTrackedObject)
        v18 = PerAssetPerEventTrackedObject == CFSTR("DummyItem");
      else
        v18 = 1;
      if (v18 || v16 == 0)
      {
        if (PerAssetPerEventTrackedObject != CFSTR("DummyItem"))
          goto LABEL_42;
        goto LABEL_23;
      }
      v20 = (*(uint64_t (**)(uint64_t, uint64_t, __CFString *))(DerivedStorage + 72))(v15, v16, PerAssetPerEventTrackedObject);
      if (!v20)
        goto LABEL_42;
      v21 = v20;
      v22 = *(unsigned int (**)(uint64_t, CMTime *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
      if (!v22 || v22(v21, &v40) || (v40.flags & 0x1D) != 1)
        goto LABEL_42;
      memset(&v39, 0, sizeof(v39));
      lhs = v42;
      rhs = v41;
      CMTimeSubtract(&v39, &lhs, &rhs);
      lhs = v39;
      rhs = v40;
      if (CMTimeCompare(&lhs, &rhs) <= 0)
        break;
      rhs = v41;
      v37 = v40;
      CMTimeAdd(&lhs, &rhs, &v37);
      v41 = lhs;
LABEL_23:
      if (v12 == ++v13)
        goto LABEL_42;
    }
    lhs = v39;
    v23 = CMTimeCopyAsDictionary(&lhs, allocator);
    v24 = v23;
    if (dword_1EE2A33C8)
    {
      v34 = v23;
      LODWORD(v37.value) = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      value = v37.value;
      if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
        v27 = value;
      else
        v27 = value & 0xFFFFFFFE;
      if (v27)
      {
        lhs = v39;
        Seconds = CMTimeGetSeconds(&lhs);
        lhs = v40;
        v29 = CMTimeGetSeconds(&lhs);
        LODWORD(rhs.value) = 136316162;
        *(CMTimeValue *)((char *)&rhs.value + 4) = (CMTimeValue)"fpic_EnsureCurrentEventPlayoutLimitApplied_block_invoke";
        LOWORD(rhs.flags) = 2048;
        *(_QWORD *)((char *)&rhs.flags + 2) = v21;
        HIWORD(rhs.epoch) = 1024;
        v44 = v13;
        v45 = 2048;
        v46 = Seconds;
        v47 = 2048;
        v48 = v29;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      v24 = v34;
    }
    FigBaseObject = FigPlaybackItemGetFigBaseObject(v21);
    v31 = *(void (**)(uint64_t, const __CFString *, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                              + 56);
    if (v31)
      v31(FigBaseObject, CFSTR("EndTime"), v24);
    if (v24)
      CFRelease(v24);
    while (v13 < v11)
    {
      v32 = fpic_GetPerAssetPerEventTrackedObject(a1[6], v5, v11, CFSTR("PlaybackItem"));
      v33 = *(__CFArray **)(*(_QWORD *)(a1[4] + 8) + 24);
      if (!v33)
      {
        *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = CFArrayCreateMutable(allocator, 0, MEMORY[0x1E0C9B378]);
        v33 = *(__CFArray **)(*(_QWORD *)(a1[4] + 8) + 24);
        if (!v33)
        {
          *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = FigSignalErrorAt();
          return;
        }
      }
      if (v32)
        CFArrayAppendValue(v33, v32);
      fpic_RemovePerAssetPerEventTrackedObjects(a1[6], v5, v11--);
    }
LABEL_42:
    v4 = v36;
LABEL_43:
    ++v5;
  }
  while (v5 != v4);
}

@end
