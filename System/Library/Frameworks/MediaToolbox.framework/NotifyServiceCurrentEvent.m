@implementation NotifyServiceCurrentEvent

void __fpic_NotifyServiceCurrentEvent_block_invoke(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v3;
  CFTypeRef *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  int v8;
  CFTypeRef *v9;
  OpaqueCMTimebase *v10;
  CMClockOrTimebaseRef v11;
  const void *v12;
  uint64_t v13;
  Boolean v14;
  NSObject **DerivedStorage;
  NSObject *v16;
  uint64_t v17;
  const void *v18;
  const void *v19;
  const __CFDictionary *Value;
  uint64_t v21;
  uint64_t v22;
  const __CFDictionary *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  CFStringRef MomentDesc;
  NSObject *v32;
  const void *v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  _QWORD block[5];
  CMTime v38;
  __int128 v39;
  uint64_t v40;
  CMTime time2;
  CMTime type;
  CMTime v43;
  CMTime outRelativeToClockOrTimebaseAnchorTime;
  _BYTE outOfClockOrTimebaseAnchorTime[32];
  NSObject **v46;
  uint64_t v47;
  OpaqueCMTimebase *v48;
  Boolean v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v39 = *MEMORY[0x1E0CA2E18];
  v40 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  if (dword_1EE2A33C8 >= 3)
  {
    LODWORD(v43.value) = 0;
    LOBYTE(type.value) = 0;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v3 = CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("ItemStoppedBeingCurrent"));
  v4 = (CFTypeRef *)MEMORY[0x1E0CA2E78];
  if (v3)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 48);
LABEL_7:
    v7 = 0;
LABEL_8:
    fpic_PruneCurrentEvents(v5, v6, v7);
    goto LABEL_9;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("ItemBecameCurrent")))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 0;
    goto LABEL_7;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("FailedToBecomeReadyForInspection"))
    || CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("FailedToBecomeReadyForPlayback")))
  {
    fpic_eventItemReadyStateChange(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), 0);
    goto LABEL_9;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("FailedToPlayToEnd")))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 48);
    v7 = 1;
    goto LABEL_8;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("RateDidChange")))
  {
    fpic_NoticeRateChange(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  else if (CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("IsAirPlayVideoActiveDidChange")))
  {
    fpic_HandleAirPlayVideoActiveDidChange(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  else if (CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("SelectedMediaOptionsDidChange")))
  {
    fpic_mediaSelectionsChanged(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  else if (CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("CoordinationIdentifierChanged")))
  {
    fpic_coordinationIdentifierChanged(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  else if (CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("ReadyForInspection")))
  {
    fpic_eventItemReadyStateChange(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), 1);
    fpic_setMediaSelectionsForCurrentEventItems(*(_QWORD *)(a1 + 32));
  }
  else if (CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("ReachedTimeToPauseBuffering"))
         || CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("AlmostReachedTimeToPausePlayback"))
         || CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("ReachedTimeToPausePlayback"))
         || CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("SnappedTimeToPausePlayback")))
  {
    if (CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("ReachedTimeToPauseBuffering")))
      fpic_checkForSnappedTimeToPauseBuffering(*(_QWORD *)(a1 + 32));
    fpic_checkForSnapOut(*(_QWORD *)(a1 + 32));
    if (CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("AlmostReachedTimeToPausePlayback")))
    {
      Value = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 56), CFSTR("FigTime"));
      v21 = *(_QWORD *)(a1 + 32);
      CMTimeMakeFromDictionary(&v38, Value);
      fpic_schedulePrimaryToInterstitialTransition(v21, (__int128 *)&v38.value);
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("ReachedTimeToPausePlayback")))
    {
      v22 = *(_QWORD *)(a1 + 64);
      if (*(_QWORD *)(v22 + 152))
      {
        if ((*(_BYTE *)(v22 + 908) & 1) != 0)
        {
          v23 = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 56), CFSTR("FigTime"));
          memset(outOfClockOrTimebaseAnchorTime, 0, 24);
          CMTimeMakeFromDictionary((CMTime *)outOfClockOrTimebaseAnchorTime, v23);
          v24 = *(_QWORD *)(a1 + 32);
          outRelativeToClockOrTimebaseAnchorTime = *(CMTime *)outOfClockOrTimebaseAnchorTime;
          fpic_CheckIfPlayheadHasReachedPrimaryPlaybackGate(v24, &outRelativeToClockOrTimebaseAnchorTime);
        }
      }
    }
  }
  else if (CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("SeekDidComplete"))
         || CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("SeekWasCanceled")))
  {
    fpic_HandleSeekDidFinishNotification(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(const void **)(a1 + 56), (uint64_t)&v39);
  }
  else if (CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("DidPlayToTheEnd")))
  {
    v25 = *(_QWORD *)(a1 + 48);
    v26 = *(_QWORD *)(a1 + 64);
    if (v25 == *(_QWORD *)(v26 + 152) && !*(_BYTE *)(v26 + 977))
    {
      *(_BYTE *)(v26 + 977) = 1;
      if (*(_BYTE *)(v26 + 978))
      {
        if (*(_BYTE *)(v26 + 232) || *(_BYTE *)(v26 + 233))
        {
          v27 = v26 + 200;
          fpic_CurrentItemMoment(v25, (uint64_t)outOfClockOrTimebaseAnchorTime);
          v28 = *(_OWORD *)&outOfClockOrTimebaseAnchorTime[16];
          *(_OWORD *)v27 = *(_OWORD *)outOfClockOrTimebaseAnchorTime;
          *(_OWORD *)(v27 + 16) = v28;
          *(_QWORD *)(v27 + 32) = v46;
          v29 = *(_QWORD *)(a1 + 64);
          v30 = *(_OWORD *)(v29 + 216);
          *(_OWORD *)outOfClockOrTimebaseAnchorTime = *(_OWORD *)(v29 + 200);
          *(_OWORD *)&outOfClockOrTimebaseAnchorTime[16] = v30;
          v46 = *(NSObject ***)(v29 + 232);
          MomentDesc = fpic_CreateMomentDesc((uint64_t)outOfClockOrTimebaseAnchorTime);
          if (MomentDesc)
            CFRelease(MomentDesc);
          v32 = **(NSObject ***)(a1 + 64);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __fpic_NotifyServiceCurrentEvent_block_invoke_108;
          block[3] = &__block_descriptor_40_e5_v8__0l;
          block[4] = *(_QWORD *)(a1 + 32);
          dispatch_sync(v32, block);
        }
      }
    }
  }
  else if (CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("EndTimeChanged")))
  {
    fpic_HandleEndTimeChangedNotification(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  else if (CFEqual(*(CFTypeRef *)(a1 + 40), *v4))
  {
    fpic_ReportInterstitialPlaybackDeadTime(*(_QWORD *)(a1 + 32), *(OpaqueCMTimebase **)(a1 + 48));
  }
  else if (CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("PlayableRangeChanged")))
  {
    v33 = (const void *)FigCFWeakReferenceHolderCopyReferencedObject();
    v34 = FigCFDictionaryGetValue();
    fpic_updateEventLoadedTimeIntervals(*(_QWORD *)(a1 + 32), (uint64_t)v33, *(_QWORD *)(a1 + 48), v34);
    if (v33)
      CFRelease(v33);
  }
LABEL_9:
  v8 = CFEqual(*(CFTypeRef *)(a1 + 40), *v4);
  v9 = (CFTypeRef *)MEMORY[0x1E0CA2E88];
  if (v8 || CFEqual(*(CFTypeRef *)(a1 + 40), (CFTypeRef)*MEMORY[0x1E0CA2E88]))
  {
    v10 = *(OpaqueCMTimebase **)(a1 + 48);
    if (v10 == *(OpaqueCMTimebase **)(*(_QWORD *)(a1 + 64) + 1048))
    {
      FigCFDictionaryGetCMTimeIfPresent();
      v35 = v39;
      v36 = v40;
      memset(&v43, 0, sizeof(v43));
      v11 = CMTimebaseCopySource(v10);
      if (v11)
      {
        v12 = v11;
        memset(outOfClockOrTimebaseAnchorTime, 0, 24);
        memset(&outRelativeToClockOrTimebaseAnchorTime, 0, sizeof(outRelativeToClockOrTimebaseAnchorTime));
        CMSyncGetRelativeRateAndAnchorTime(v10, v11, 0, (CMTime *)outOfClockOrTimebaseAnchorTime, &outRelativeToClockOrTimebaseAnchorTime);
        CMSyncGetTime(&v43, v12);
        if (CMTimebaseGetRate(v10) > 0.0)
        {
          type = outRelativeToClockOrTimebaseAnchorTime;
          time2 = v43;
          if (CMTimeCompare(&type, &time2) >= 1)
          {
            v35 = *(_OWORD *)outOfClockOrTimebaseAnchorTime;
            v36 = *(_QWORD *)&outOfClockOrTimebaseAnchorTime[16];
          }
        }
        CFRelease(v12);
      }
      v39 = v35;
      v40 = v36;
    }
    v13 = *(_QWORD *)(a1 + 32);
    v14 = CFEqual(*(CFTypeRef *)(a1 + 40), *v9);
    DerivedStorage = (NSObject **)CMBaseObjectGetDerivedStorage();
    v16 = *DerivedStorage;
    *(_QWORD *)outOfClockOrTimebaseAnchorTime = MEMORY[0x1E0C809B0];
    *(_QWORD *)&outOfClockOrTimebaseAnchorTime[8] = 3221225472;
    *(_QWORD *)&outOfClockOrTimebaseAnchorTime[16] = __fpic_checkScheduledTransition_block_invoke;
    *(_QWORD *)&outOfClockOrTimebaseAnchorTime[24] = &__block_descriptor_57_e5_v8__0l;
    v46 = DerivedStorage;
    v47 = v13;
    v48 = v10;
    v49 = v14;
    dispatch_sync(v16, outOfClockOrTimebaseAnchorTime);
  }
  v17 = *(_QWORD *)(a1 + 32);
  *(_OWORD *)outOfClockOrTimebaseAnchorTime = v39;
  *(_QWORD *)&outOfClockOrTimebaseAnchorTime[16] = v40;
  fpic_ServiceCurrentEvent(v17, (__int128 *)outOfClockOrTimebaseAnchorTime);
  CFRelease(*(CFTypeRef *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 40));
  v18 = *(const void **)(a1 + 56);
  if (v18)
    CFRelease(v18);
  v19 = *(const void **)(a1 + 48);
  if (v19)
    CFRelease(v19);
}

void __fpic_NotifyServiceCurrentEvent_block_invoke_108(uint64_t a1)
{
  fpic_EnsureCurrentEventsHaveResolvedProperties(*(const void **)(a1 + 32));
}

@end
