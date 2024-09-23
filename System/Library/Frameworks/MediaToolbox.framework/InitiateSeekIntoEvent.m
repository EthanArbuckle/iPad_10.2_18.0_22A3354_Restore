@implementation InitiateSeekIntoEvent

void __fpic_InitiateSeekIntoEvent_block_invoke(uint64_t a1)
{
  uint64_t v2;
  CFTypeRef *v3;
  uint64_t FirstIndexOfValue;
  CFIndex v5;
  uint64_t DerivedStorage;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  const void *CurrentlyPlayingEvent;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  __int128 v21;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _OWORD *v23;
  const void *v24;
  int v25;
  NSObject *v26;
  const __CFArray *Copy;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  _BOOL4 v34;
  const void *v35;
  CFIndex v36;
  CFIndex i;
  const void *ValueAtIndex;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  _BOOL4 isEventInSameGroupAsAnotherEvent;
  os_log_type_t v50[43];
  os_log_type_t type;
  os_log_type_t v52[4];
  CMTime v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  __int128 rhs;
  __int128 rhs_16;
  uint64_t v59;
  _BYTE lhs[32];
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v2 = fpic_UnwrapEvent(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v3 = FigPlayerInterstitialEventCopyIdentifier(v2);
  CMBaseObjectGetDerivedStorage();
  FirstIndexOfValue = FigCFArrayGetFirstIndexOfValue();
  CMBaseObjectGetDerivedStorage();
  v5 = FigCFArrayGetFirstIndexOfValue();
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v54 = 0u;
  v55 = 0u;
  v56 = 0;
  fpic_GetEventStartMoment(v2, (uint64_t)&v54);
  if ((_BYTE)v56)
  {
    if (BYTE1(v56))
      goto LABEL_4;
    goto LABEL_3;
  }
  v20 = BYTE1(v56);
  if (BYTE1(v56))
  {
    v21 = *(_OWORD *)(DerivedStorage + 296);
    *(_OWORD *)lhs = *(_OWORD *)(DerivedStorage + 280);
    *(_OWORD *)&lhs[16] = v21;
    v61 = *(_QWORD *)(DerivedStorage + 312);
    FigCreateTimeWithDateAndMoment((uint64_t)lhs, (uint64_t)&rhs, *((double *)&v55 + 1));
  }
  else
  {
    rhs = *MEMORY[0x1E0CA2E18];
    *(_QWORD *)&rhs_16 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  }
  v54 = rhs;
  *(_QWORD *)&v55 = rhs_16;
  LOBYTE(v56) = 1;
  if (!v20)
  {
LABEL_3:
    rhs = v54;
    *(_QWORD *)&rhs_16 = v55;
    v7 = *(_OWORD *)(DerivedStorage + 296);
    *(_OWORD *)lhs = *(_OWORD *)(DerivedStorage + 280);
    *(_OWORD *)&lhs[16] = v7;
    v61 = *(_QWORD *)(DerivedStorage + 312);
    fpic_MakeMomentFromTime((uint64_t)&rhs, (uint64_t)lhs, (uint64_t)&v54);
  }
LABEL_4:
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = v55;
  *(_OWORD *)(v8 + 32) = v54;
  *(_OWORD *)(v8 + 48) = v9;
  *(_QWORD *)(v8 + 64) = v56;
  if (v5 == -1)
  {
    if (dword_1EE2A33C8)
    {
      LODWORD(v53.value) = 0;
      v52[0] = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    Copy = 0;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = FigSignalErrorAt();
    goto LABEL_52;
  }
  CurrentlyPlayingEvent = fpic_GetCurrentlyPlayingEvent();
  isEventInSameGroupAsAnotherEvent = fpic_isEventInSameGroupAsAnotherEvent(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), (uint64_t)CurrentlyPlayingEvent);
  memset(&v53, 0, sizeof(v53));
  v11 = *(_QWORD *)(a1 + 72);
  *(_OWORD *)lhs = *(_OWORD *)(v11 + 408);
  *(_QWORD *)&lhs[16] = *(_QWORD *)(v11 + 424);
  rhs = *(_OWORD *)(v11 + 456);
  *(_QWORD *)&rhs_16 = *(_QWORD *)(v11 + 472);
  CMTimeAdd(&v53, (CMTime *)lhs, (CMTime *)&rhs);
  fpic_FinishInitiatedSeek(*(const void **)(a1 + 56), 1);
  *(_DWORD *)(CMBaseObjectGetDerivedStorage() + 728) = 0;
  v12 = *(_QWORD *)(a1 + 72);
  v13 = *(_QWORD *)(a1 + 104);
  *(_OWORD *)(v12 + 744) = *(_OWORD *)(a1 + 88);
  *(_QWORD *)(v12 + 760) = v13;
  *(_QWORD *)(*(_QWORD *)(a1 + 72) + 736) = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)(a1 + 72) + 184), v5);
  v14 = *(_QWORD *)(a1 + 72);
  v15 = *(_OWORD *)(a1 + 112);
  *(_QWORD *)(v14 + 824) = *(_QWORD *)(a1 + 128);
  *(_OWORD *)(v14 + 808) = v15;
  v16 = *(_QWORD *)(a1 + 72);
  v17 = *(_OWORD *)(a1 + 136);
  *(_QWORD *)(v16 + 848) = *(_QWORD *)(a1 + 152);
  *(_OWORD *)(v16 + 832) = v17;
  v18 = *(_QWORD *)(a1 + 72);
  *(_DWORD *)(v18 + 856) = *(_DWORD *)(a1 + 160);
  *(_BYTE *)(v18 + 860) = 1;
  if (dword_1EE2A33C8)
  {
    *(_DWORD *)v52 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v18 = *(_QWORD *)(a1 + 72);
  }
  v23 = (_OWORD *)(a1 + 88);
  v24 = *(const void **)(v18 + 736);
  if (!CurrentlyPlayingEvent)
  {
    v25 = 0;
LABEL_15:
    if (FirstIndexOfValue != -1)
    {
      if (CurrentlyPlayingEvent != v24)
        goto LABEL_21;
      goto LABEL_20;
    }
    goto LABEL_24;
  }
  if (CurrentlyPlayingEvent != v24
    || (*(_OWORD *)lhs = *v23,
        *(_QWORD *)&lhs[16] = *(_QWORD *)(a1 + 104),
        rhs = *(_OWORD *)&v53.value,
        *(_QWORD *)&rhs_16 = v53.epoch,
        CMTimeCompare((CMTime *)lhs, (CMTime *)&rhs) < 0))
  {
    fpic_StopInterstitialPlayerAtCurrentItem(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80));
    v25 = 1;
    goto LABEL_15;
  }
  v25 = 0;
  if (FirstIndexOfValue != -1)
  {
LABEL_20:
    *(_OWORD *)lhs = *v23;
    *(_QWORD *)&lhs[16] = *(_QWORD *)(a1 + 104);
    rhs = *(_OWORD *)&v53.value;
    *(_QWORD *)&rhs_16 = v53.epoch;
    if ((CMTimeCompare((CMTime *)lhs, (CMTime *)&rhs) & 0x80000000) == 0)
    {
LABEL_21:
      if (FirstIndexOfValue < 1)
      {
        Copy = 0;
      }
      else
      {
        if (dword_1EE2A33C8)
        {
          *(_DWORD *)v52 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v26 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        Copy = 0;
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = fpic_RemoveEventsAtSameMomentUpToIntendedEventToSeekInto(*(const void **)(a1 + 56), v25, (CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48)+ 8)+ 24));
        if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
          goto LABEL_52;
      }
LABEL_48:
      v39 = *(_QWORD *)(a1 + 72);
      v40 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v41 = *(_OWORD *)(v39 + 216);
      *(_OWORD *)lhs = *(_OWORD *)(v39 + 200);
      *(_OWORD *)&lhs[16] = v41;
      v61 = *(_QWORD *)(v39 + 232);
      v42 = *(_OWORD *)(v40 + 48);
      rhs = *(_OWORD *)(v40 + 32);
      rhs_16 = v42;
      v59 = *(_QWORD *)(v40 + 64);
      if (!fpic_MomentsAreClose((uint64_t)lhs, (uint64_t)&rhs)
        || (fpic_CurrentItemMoment(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 152), (uint64_t)v50),
            v43 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8),
            v44 = *(_OWORD *)(v43 + 48),
            *(_OWORD *)lhs = *(_OWORD *)(v43 + 32),
            *(_OWORD *)&lhs[16] = v44,
            v61 = *(_QWORD *)(v43 + 64),
            !fpic_MomentsAreClose((uint64_t)v50, (uint64_t)lhs) && !isEventInSameGroupAsAnotherEvent))
      {
        v45 = *(_QWORD *)(a1 + 72);
        v46 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v47 = *(_OWORD *)(v46 + 32);
        v48 = *(_OWORD *)(v46 + 48);
        *(_QWORD *)(v45 + 800) = *(_QWORD *)(v46 + 64);
        *(_OWORD *)(v45 + 768) = v47;
        *(_OWORD *)(v45 + 784) = v48;
      }
      fpic_GatePrimaryBufferingAtCurrentEvent(*(_QWORD *)(a1 + 56), 0);
      fpic_GatePrimaryPlaybackAtCurrentEvent(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80));
      *(_DWORD *)(*(_QWORD *)(a1 + 72) + 724) = *(_DWORD *)(a1 + 164);
      goto LABEL_52;
    }
    if (dword_1EE2A33C8)
    {
      *(_DWORD *)v52 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v29 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    fpic_removeAllCurrentEvents(*(const void **)(a1 + 56), *(__CFArray **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v25);
    Copy = 0;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
LABEL_46:
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      goto LABEL_52;
    fpic_AllowIntendedEventToSeekIntoToBeBeRescheduled(*(_QWORD *)(a1 + 56));
    *(_BYTE *)(*(_QWORD *)(a1 + 72) + 861) = 1;
    goto LABEL_48;
  }
LABEL_24:
  Copy = CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *(CFArrayRef *)(*(_QWORD *)(a1 + 72) + 600));
  if (dword_1EE2A33C8)
  {
    *(_DWORD *)v52 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v28 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  fpic_removeAllCurrentEvents(*(const void **)(a1 + 56), *(__CFArray **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v25);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v30 = *(_QWORD *)(a1 + 72);
    v31 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v32 = *(_OWORD *)(v30 + 216);
    *(_OWORD *)lhs = *(_OWORD *)(v30 + 200);
    *(_OWORD *)&lhs[16] = v32;
    v61 = *(_QWORD *)(v30 + 232);
    v33 = *(_OWORD *)(v31 + 48);
    rhs = *(_OWORD *)(v31 + 32);
    rhs_16 = v33;
    v59 = *(_QWORD *)(v31 + 64);
    v34 = fpic_MomentGreaterThan((uint64_t)lhs, (uint64_t)&rhs);
    v35 = *(const void **)(a1 + 56);
    if (v34)
    {
      v36 = 0;
      if (!Copy)
        goto LABEL_37;
LABEL_36:
      for (i = CFArrayGetCount(Copy); v36 < i; i = 0)
      {
        ValueAtIndex = (const void *)FigCFArrayGetValueAtIndex();
        fpic_ForgetPastEvent((uint64_t)v35, ValueAtIndex);
        ++v36;
        if (Copy)
          goto LABEL_36;
LABEL_37:
        ;
      }
      v35 = *(const void **)(a1 + 56);
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = fpic_RemoveEventsAtSameMomentUpToIntendedEventToSeekInto(v35, v25, (CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)+ 24));
    goto LABEL_46;
  }
LABEL_52:
  if (v3)
    CFRelease(v3);
  if (Copy)
    CFRelease(Copy);
}

void __fpic_InitiateSeekIntoEvent_block_invoke_103(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  CFTypeRef *v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  _OWORD v9[2];
  uint64_t v10;
  _OWORD v11[2];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(CMBaseObjectGetDerivedStorage() + 724))
  {
    v2 = fpic_UnwrapEvent(a1[5], a1[6]);
    v3 = a1[7];
    if (*(_BYTE *)(v3 + 860))
      goto LABEL_12;
    v6 = *(_QWORD *)(a1[4] + 8);
    v7 = *(_OWORD *)(v6 + 48);
    v9[0] = *(_OWORD *)(v6 + 32);
    v9[1] = v7;
    v10 = *(_QWORD *)(v6 + 64);
    v8 = *(_OWORD *)(v3 + 216);
    v11[0] = *(_OWORD *)(v3 + 200);
    v11[1] = v8;
    v12 = *(_QWORD *)(v3 + 232);
    if (!fpic_MomentsAreClose((uint64_t)v9, (uint64_t)v11))
    {
LABEL_12:
      if (fpic_isEventResolvableOnPrimaryTimeline(a1[5], a1[6]))
      {
        v4 = FigPlayerInterstitialEventCopyIdentifier(v2);
        if (dword_1EE2A33C8)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        fpic_ForceCancelInitiatedSeek((const void *)a1[5]);
        if (v4)
          CFRelease(v4);
      }
    }
  }
}

@end
