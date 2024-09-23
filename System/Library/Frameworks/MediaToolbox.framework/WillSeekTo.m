@implementation WillSeekTo

void __fpic_WillSeekTo_block_invoke(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  uint64_t DerivedStorage;
  uint64_t v7;
  int v8;
  uint64_t v9;
  const void *v10;
  CFIndex Count;
  CFIndex v12;
  CFIndex v14;
  uint64_t v15;
  const void *ValueAtIndex;
  uint64_t v17;
  CMTimeEpoch v18;
  __int128 v19;
  unsigned int v20;
  CFTypeRef *v21;
  NSObject *v22;
  __int128 v23;
  uint64_t v24;
  CMTime type;
  CMTime v26;
  _BYTE time[32];
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (*(int *)(*(_QWORD *)(a1 + 32) + 1040) >= 1 && dword_1EE2A33C8 != 0)
  {
    LODWORD(v26.value) = 0;
    LOBYTE(type.value) = 0;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if ((*(_BYTE *)(a1 + 72) & 1) == 0)
  {
    v5 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    DerivedStorage = CMBaseObjectGetDerivedStorage();
    if (v4)
    {
      *(_DWORD *)(DerivedStorage + 1040) = -1;
      fpic_flipInterstitialAndPrimaryVisibility(v5, 0, v4, NAN);
    }
    return;
  }
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_DWORD *)(a1 + 56);
  v23 = *(_OWORD *)(a1 + 60);
  v24 = *(_QWORD *)(a1 + 76);
  v9 = CMBaseObjectGetDerivedStorage();
  v10 = (const void *)FigCFWeakReferenceHolderCopyReferencedObject();
  Count = CFArrayGetCount(*(CFArrayRef *)(v9 + 184));
  if (!v10)
  {
    FigSignalErrorAt();
    return;
  }
  if (!*(_BYTE *)(v9 + 312))
    goto LABEL_32;
  v12 = Count;
  if (!*(_BYTE *)(v9 + 313) || Count < 1)
    goto LABEL_32;
  v14 = 0;
  v15 = MEMORY[0x1E0CA2E18];
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(v9 + 184), v14);
    v17 = (*(uint64_t (**)(uint64_t, const void *, const void *))(v9 + 80))(v7, v10, ValueAtIndex);
    v31 = 0;
    v29 = 0u;
    v30 = 0u;
    fpic_EventDateTimeMoment(v17, (uint64_t)&v29);
    memset(&type, 0, sizeof(type));
    if ((_BYTE)v31)
    {
      *(_OWORD *)&type.value = v29;
      v18 = v30;
LABEL_18:
      type.epoch = v18;
      goto LABEL_21;
    }
    if (!BYTE1(v31))
    {
      *(_OWORD *)&type.value = *(_OWORD *)v15;
      v18 = *(_QWORD *)(v15 + 16);
      goto LABEL_18;
    }
    v19 = *(_OWORD *)(v9 + 296);
    *(_OWORD *)time = *(_OWORD *)(v9 + 280);
    *(_OWORD *)&time[16] = v19;
    v28 = *(_QWORD *)(v9 + 312);
    FigCreateTimeWithDateAndMoment((uint64_t)time, (uint64_t)&type, *((double *)&v30 + 1));
LABEL_21:
    v20 = FigPlayerInterstitialEventCueOnce(v17);
    v21 = FigPlayerInterstitialEventCopyIdentifier(v17);
    if (!v20 || (*(_DWORD *)time = 0, FigCFDictionaryGetInt32IfPresent(), *(int *)time <= 0))
    {
      *(_OWORD *)time = v23;
      *(_QWORD *)&time[16] = v24;
      v26 = type;
      if (fpic_TimesAreClose((CMTime *)time, &v26))
        break;
    }
    if (v21)
      CFRelease(v21);
    if (v12 == ++v14)
      goto LABEL_32;
  }
  if (dword_1EE2A33C8)
  {
    v22 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  *(_DWORD *)(CMBaseObjectGetDerivedStorage() + 1040) = v8;
  fpic_flipInterstitialAndPrimaryVisibility(v7, 1, (uint64_t)v10, NAN);
LABEL_32:
  CFRelease(v10);
}

@end
