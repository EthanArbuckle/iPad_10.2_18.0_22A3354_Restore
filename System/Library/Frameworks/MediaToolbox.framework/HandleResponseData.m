@implementation HandleResponseData

void __fpic_HandleResponseData_block_invoke(uint64_t a1)
{
  uint64_t FirstIndexOfValue;
  CFIndex v3;
  const __CFArray *v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex i;
  uint64_t v8;
  const void *ValueAtIndex;
  uint64_t v10;
  const void *v11;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v13;
  CMTime time1;
  os_log_type_t type;
  int v16;
  CMTime time2;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  CMBaseObjectGetDerivedStorage();
  FirstIndexOfValue = FigCFArrayGetFirstIndexOfValue();
  if (FirstIndexOfValue != -1)
  {
    v3 = FirstIndexOfValue;
    v4 = *(const __CFArray **)(a1 + 48);
    if (v4 && (Count = CFArrayGetCount(v4), Count >= 1))
    {
      v6 = Count;
      for (i = 0; i != v6; ++i)
      {
        v8 = *(_QWORD *)(a1 + 56);
        ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 48), i);
        fpic_SetPerAssetPerEventTrackedObject(v8, v3, i, CFSTR("AssetURL"), ValueAtIndex);
        v10 = *(_QWORD *)(a1 + 56);
        v11 = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 64), i);
        fpic_SetPerAssetPerEventTrackedObject(v10, v3, i, CFSTR("DurationFromJSON"), v11);
      }
      if (dword_1EE2A33C8)
      {
        v16 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      fpic_EnsureEventHasResolvedProperties(*(const void **)(a1 + 32), *(_QWORD *)(a1 + 72), *(const void **)(a1 + 40), 1);
    }
    else
    {
      if (dword_1EE2A33C8)
      {
        v16 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      FigPlayerInterstitialEventGetResumptionOffset(*(_QWORD *)(a1 + 80), (uint64_t)&time1);
      time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
      if (CMTimeCompare(&time1, &time2))
        fpic_SetPerAssetPerEventTrackedObject(*(_QWORD *)(a1 + 56), v3, 0, CFSTR("PlaybackItem"), CFSTR("DummyItem"));
      else
        fpic_RemoveEvent(*(const void **)(a1 + 32), *(const void **)(a1 + 40), 0, 0, 0);
    }
  }
}

@end
