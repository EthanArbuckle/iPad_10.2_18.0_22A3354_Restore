@implementation EnsureNextEventWillPlay

void __fpic_EnsureNextEventWillPlay_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  _BOOL4 v3;
  uint64_t DerivedStorage;
  uint64_t v5;
  int v6;
  int v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  double v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  CMTimeEpoch epoch;
  CFStringRef MomentDesc;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  CFTypeRef v32;
  CFTypeRef v33;
  NSObject *v34;
  unsigned int v35;
  unsigned int v36;
  uint64_t v37;
  CMTime *v38;
  void (*v39)(CFTypeRef, CMTime *);
  NSObject *v40;
  unsigned int v41;
  unsigned int v42;
  Float64 Seconds;
  NSObject *v44;
  unsigned int v45;
  unsigned int v46;
  uint64_t FirstCurrentItem;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  unsigned int v51;
  unsigned int v52;
  Float64 v53;
  Float64 v54;
  Float64 v55;
  Float64 v56;
  Float64 v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const void *ValueAtIndex;
  uint64_t v62;
  CFTypeRef *v63;
  CFIndex v64;
  CFIndex PerEventTrackingCount;
  CFIndex v66;
  CFIndex i;
  const __CFString *PerAssetPerEventTrackedObject;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  BOOL v72;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t FigBaseObject;
  void (*v78)(uint64_t, const __CFString *, uint64_t, CMTime *);
  CMTimeValue value;
  const __CFAllocator *v80;
  CFDictionaryRef v81;
  uint64_t v82;
  void (*v83)(uint64_t, const __CFString *, CFDictionaryRef);
  CFIndex Count;
  uint64_t v85;
  CMTime v86;
  CFTypeRef v87;
  os_log_type_t v88;
  unsigned int v89;
  CMTime time2;
  CMTime v91;
  CMTime v92;
  CMTime type;
  __n128 v94;
  uint64_t v95;
  CMTime v96;
  CMTime v97;
  _BYTE rhs[32];
  _BYTE v99[10];
  __int16 v100;
  Float64 v101;
  __int16 v102;
  Float64 v103;
  CMTime lhs;
  double v105;
  char v106;
  char v107;
  int v108;
  __int16 v109;
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v2 = a1[5];
  if (*(_BYTE *)(v2 + 978))
    v3 = *(_BYTE *)(v2 + 977) == 0;
  else
    v3 = 0;
  if (!*(_QWORD *)(v2 + 152))
    return;
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v5 = DerivedStorage + 240;
  if (!*(_BYTE *)(DerivedStorage + 272) && !*(_BYTE *)(DerivedStorage + 273))
    v5 = DerivedStorage + 200;
  *(_OWORD *)&v86.value = *(_OWORD *)v5;
  v86.epoch = *(_QWORD *)(v5 + 16);
  v6 = *(unsigned __int8 *)(v5 + 32);
  v7 = *(unsigned __int8 *)(v5 + 33);
  if (!(v6 | v7))
    return;
  v8 = *(double *)(v5 + 24);
  v9 = CMBaseObjectGetDerivedStorage();
  if (*(_BYTE *)(v9 + 974))
  {
    if (*(_BYTE *)(v9 + 973))
    {
      v10 = CMBaseObjectGetDerivedStorage();
      if (!(*(unsigned __int8 *)(v10 + 352) | *(unsigned __int8 *)(v10 + 353)))
      {
        memset(&v97, 0, sizeof(v97));
        if (v6)
        {
          lhs = v86;
          *(_QWORD *)rhs = 10;
          *(_QWORD *)&rhs[8] = 0x100000001;
          *(_QWORD *)&rhs[16] = 0;
          CMTimeSubtract(&v97, &lhs, (CMTime *)rhs);
          v11 = 1;
          if (v7)
          {
LABEL_14:
            lhs.value = 10;
            *(_QWORD *)&lhs.timescale = 0x100000001;
            lhs.epoch = 0;
            v12 = v8 - CMTimeGetSeconds(&lhs);
            v13 = 1;
LABEL_17:
            v14 = a1[6];
            v15 = *(_QWORD *)(a1[5] + 152);
            v96 = v97;
            v16 = CMBaseObjectGetDerivedStorage();
            lhs = v96;
            v105 = v12;
            v106 = v11;
            v107 = v13;
            v108 = 0;
            v109 = 0;
            v17 = *(_OWORD *)(v16 + 688);
            *(_OWORD *)rhs = *(_OWORD *)(v16 + 672);
            *(_OWORD *)&rhs[16] = v17;
            *(_QWORD *)v99 = *(_QWORD *)(v16 + 704);
            if (!fpic_MomentsAreClose((uint64_t)&lhs, (uint64_t)rhs))
            {
              v18 = CMBaseObjectGetDerivedStorage();
              StopAndReleaseTimer((dispatch_object_t *)(v18 + 648));
              *(_WORD *)(v18 + 704) = 0;
              lhs = v96;
              v105 = v12;
              v106 = v11;
              v107 = v13;
              v108 = 0;
              v109 = 0;
              if (!fpic_CreateAndPrimeItemTimer(v14, v15, (uint64_t)&lhs, (void (__cdecl *)(void *))fpic_ServiceCurrentEventTimerProc, (NSObject **)(v16 + 648)))
              {
                v19 = *(_OWORD *)&v96.value;
                *(_OWORD *)(v16 + 672) = *(_OWORD *)&v96.value;
                epoch = v96.epoch;
                *(_QWORD *)(v16 + 688) = v96.epoch;
                *(double *)(v16 + 696) = v12;
                *(_BYTE *)(v16 + 704) = v11;
                *(_BYTE *)(v16 + 705) = v13;
                *(_WORD *)(v16 + 710) = 0;
                *(_DWORD *)(v16 + 706) = 0;
                *(_OWORD *)&lhs.value = v19;
                lhs.epoch = epoch;
                v105 = v12;
                v106 = v11;
                v107 = v13;
                v108 = 0;
                v109 = 0;
                MomentDesc = fpic_CreateMomentDesc((uint64_t)&lhs);
                if (dword_1EE2A33C8)
                {
                  v94.n128_u32[0] = 0;
                  LOBYTE(type.value) = 0;
                  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                  fig_log_call_emit_and_clean_up_after_send_and_compose();
                }
                if (MomentDesc)
                  CFRelease(MomentDesc);
              }
            }
            goto LABEL_23;
          }
        }
        else
        {
          v11 = 0;
          if (v7)
            goto LABEL_14;
        }
        v13 = 0;
        v12 = 0.0;
        goto LABEL_17;
      }
    }
  }
LABEL_23:
  v23 = *(unsigned __int8 *)(CMBaseObjectGetDerivedStorage() + 976);
  v24 = a1[5];
  if (v23 || *(_BYTE *)(v24 + 977) && *(_BYTE *)(v24 + 978))
  {
    if (fpic_GetPerAssetPerEventTrackedObject(v24, 0, 0, CFSTR("PlaybackItem")))
    {
      if (!v3)
      {
        v25 = CMBaseObjectGetDerivedStorage();
        if (!(*(unsigned __int8 *)(v25 + 352) | *(unsigned __int8 *)(v25 + 353))
          && !*(_DWORD *)(CMBaseObjectGetDerivedStorage() + 724))
        {
          fpic_TransitionPlayback(a1[6], a1[7], 0, a1[8]);
          *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v26;
          if (*(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24))
            return;
          fpic_SignalCurrentEvent((const void *)a1[6], a1[8]);
        }
      }
    }
  }
  if (fpic_GetCurrentlyPlayingEvent()
    && (*(_DWORD *)(a1[5] + 492) & 0x1D) != 1
    && !*(_DWORD *)(CMBaseObjectGetDerivedStorage() + 724))
  {
    v27 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 64))(a1[6], a1[8], *(_QWORD *)(a1[5] + 40));
    if (!v27)
    {
LABEL_98:
      fpic_PruneCurrentEventsToQueue((const void *)a1[6], a1[8], 0, 0);
      return;
    }
    v28 = v27;
    v29 = a1[6];
    v30 = a1[8];
    v31 = CMBaseObjectGetDerivedStorage();
    v87 = 0;
    fpic_CopyNextItem(v28, &v87);
    v32 = v87;
    if ((*(_DWORD *)(v31 + 492) & 0x1D) == 1 || !v87)
    {
      if (!v87)
      {
LABEL_74:
        if ((*(_DWORD *)(a1[5] + 492) & 0x1D) == 1)
        {
          v58 = a1[6];
          v59 = a1[8];
          v60 = CMBaseObjectGetDerivedStorage();
          if (CFArrayGetCount(*(CFArrayRef *)(v60 + 600)))
          {
            ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(v60 + 600), 0);
            if (ValueAtIndex)
            {
              v62 = (*(uint64_t (**)(uint64_t, uint64_t, const void *))(v60 + 80))(v58, v59, ValueAtIndex);
              v63 = FigPlayerInterstitialEventCopyIdentifier(v62);
              LODWORD(lhs.value) = 0;
              FigCFDictionaryGetInt32IfPresent();
              FigCFDictionarySetInt32();
              if (v63)
                CFRelease(v63);
            }
          }
          fpic_SetInterstitialActionAtEnd(a1[6], a1[8], (uint64_t)CFSTR("StopAtEndOfQueue"));
          fpic_UnpauseInterstitialPlayer(a1[6], v28, a1[8]);
          Count = CFArrayGetCount(*(CFArrayRef *)(a1[5] + 600));
          if (Count >= 1)
          {
            v64 = 0;
            v85 = *MEMORY[0x1E0C9AE00];
            do
            {
              PerEventTrackingCount = fpic_GetPerEventTrackingCount(a1[5], v64);
              if (PerEventTrackingCount >= 1)
              {
                v66 = PerEventTrackingCount;
                for (i = 0; i != v66; ++i)
                {
                  PerAssetPerEventTrackedObject = (const __CFString *)fpic_GetPerAssetPerEventTrackedObject(a1[5], v64, i, CFSTR("PlaybackItem"));
                  v69 = a1[6];
                  v70 = a1[8];
                  v71 = CMBaseObjectGetDerivedStorage();
                  if (PerAssetPerEventTrackedObject)
                    v72 = PerAssetPerEventTrackedObject == CFSTR("DummyItem");
                  else
                    v72 = 1;
                  if (!v72 && v70 != 0)
                  {
                    v74 = (*(uint64_t (**)(uint64_t, uint64_t, const __CFString *))(v71 + 72))(v69, v70, PerAssetPerEventTrackedObject);
                    if (v74)
                    {
                      v75 = v74;
                      v76 = a1[6];
                      lhs.value = 0;
                      FigBaseObject = FigPlaybackItemGetFigBaseObject(v74);
                      v78 = *(void (**)(uint64_t, const __CFString *, uint64_t, CMTime *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                                  + 48);
                      if (v78)
                      {
                        v78(FigBaseObject, CFSTR("Timebase"), v85, &lhs);
                        value = lhs.value;
                      }
                      else
                      {
                        value = 0;
                      }
                      fpic_UnregisterInterstitialItemNotifications(v76, v75, value);
                      CMNotificationCenterGetDefaultLocalCenter();
                      FigNotificationCenterAddWeakListener();
                      if (lhs.value)
                      {
                        CMNotificationCenterGetDefaultLocalCenter();
                        FigNotificationCenterAddWeakListener();
                        CMNotificationCenterGetDefaultLocalCenter();
                        FigNotificationCenterAddWeakListener();
                        CFRelease((CFTypeRef)lhs.value);
                      }
                    }
                  }
                }
              }
              ++v64;
            }
            while (v64 != Count);
          }
        }
        goto LABEL_98;
      }
    }
    else
    {
      if (v32 == (CFTypeRef)fpic_GetFirstCurrentItem(v29, v30))
      {
        v38 = (CMTime *)(v31 + 480);
        v39 = *(void (**)(CFTypeRef, CMTime *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
        if (v39)
          v39(v32, v38);
        if (dword_1EE2A33C8)
        {
          LODWORD(v97.value) = 0;
          LOBYTE(v96.value) = 0;
          v40 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v41 = v97.value;
          if (os_log_type_enabled(v40, v96.value))
            v42 = v41;
          else
            v42 = v41 & 0xFFFFFFFE;
          if (v42)
          {
            lhs = *v38;
            Seconds = CMTimeGetSeconds(&lhs);
            *(_DWORD *)rhs = 136315650;
            *(_QWORD *)&rhs[4] = "fpic_StartRecordingActiveInterstitialItemPlayoutTime";
            *(_WORD *)&rhs[12] = 2112;
            *(_QWORD *)&rhs[14] = v32;
            *(_WORD *)&rhs[22] = 2048;
            *(Float64 *)&rhs[24] = Seconds;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        v48 = CMBaseObjectGetDerivedStorage();
        if (*(_BYTE *)(v48 + 974) && *(_BYTE *)(v48 + 973))
        {
          v49 = CMBaseObjectGetDerivedStorage();
          memset(&v97, 0, sizeof(v97));
          memset(&v96, 0, sizeof(v96));
          fpic_GetSeekableRange(*(_QWORD *)(v49 + 152), 0, &v97, &v96);
          v94 = 0uLL;
          v95 = 0;
          fpic_GetCurrentDepartureTime(&v94);
          memset(&type, 0, sizeof(type));
          lhs = v96;
          *(__n128 *)rhs = v94;
          *(_QWORD *)&rhs[16] = v95;
          CMTimeSubtract(&type, &lhs, (CMTime *)rhs);
          memset(&v92, 0, sizeof(v92));
          lhs = *(CMTime *)(v49 + 384);
          *(_OWORD *)rhs = *(_OWORD *)(v49 + 408);
          *(_QWORD *)&rhs[16] = *(_QWORD *)(v49 + 424);
          CMTimeAdd(&v92, &lhs, (CMTime *)rhs);
          *(CMTime *)rhs = v92;
          v91 = *(CMTime *)(v49 + 456);
          CMTimeAdd(&lhs, (CMTime *)rhs, &v91);
          v92 = lhs;
          memset(&v91, 0, sizeof(v91));
          lhs = type;
          *(CMTime *)rhs = v92;
          CMTimeSubtract(&v91, &lhs, (CMTime *)rhs);
          *(CMTime *)rhs = v91;
          time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
          CMTimeMaximum(&lhs, (CMTime *)rhs, &time2);
          v91 = lhs;
          if (dword_1EE2A33C8 >= 2)
          {
            v89 = 0;
            v88 = OS_LOG_TYPE_DEFAULT;
            v50 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            v51 = v89;
            if (os_log_type_enabled(v50, v88))
              v52 = v51;
            else
              v52 = v51 & 0xFFFFFFFE;
            if (v52)
            {
              lhs = v97;
              v53 = CMTimeGetSeconds(&lhs);
              lhs = v96;
              v54 = CMTimeGetSeconds(&lhs);
              fpic_GetCurrentDepartureTime((__n128 *)&time2);
              v55 = CMTimeGetSeconds(&time2);
              lhs = v92;
              v56 = CMTimeGetSeconds(&lhs);
              lhs = v91;
              v57 = CMTimeGetSeconds(&lhs);
              *(_DWORD *)rhs = 136316418;
              *(_QWORD *)&rhs[4] = "fpic_SetLiveHorizonOnInterstitialItem";
              *(_WORD *)&rhs[12] = 2048;
              *(Float64 *)&rhs[14] = v53;
              *(_WORD *)&rhs[22] = 2048;
              *(Float64 *)&rhs[24] = v54;
              *(_WORD *)v99 = 2048;
              *(Float64 *)&v99[2] = v55;
              v100 = 2048;
              v101 = v56;
              v102 = 2048;
              v103 = v57;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          v80 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
          lhs = v91;
          v81 = CMTimeCopyAsDictionary(&lhs, v80);
          v82 = FigPlaybackItemGetFigBaseObject(v32);
          v83 = *(void (**)(uint64_t, const __CFString *, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                + 8)
                                                                                    + 56);
          if (v83)
            v83(v82, CFSTR("interstitialLiveHorizon"), v81);
          if (v81)
            CFRelease(v81);
        }
        goto LABEL_73;
      }
      v33 = *(CFTypeRef *)(CMBaseObjectGetDerivedStorage() + 864);
      if (!v33 || v33 != v32)
      {
        LODWORD(v97.value) = 0;
        LOBYTE(v96.value) = 0;
        v44 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v45 = v97.value;
        if (os_log_type_enabled(v44, v96.value))
          v46 = v45;
        else
          v46 = v45 & 0xFFFFFFFE;
        if (v46)
        {
          FirstCurrentItem = fpic_GetFirstCurrentItem(v29, v30);
          *(_DWORD *)rhs = 136315650;
          *(_QWORD *)&rhs[4] = "fpic_StartRecordingActiveInterstitialItemPlayoutTime";
          *(_WORD *)&rhs[12] = 2112;
          *(_QWORD *)&rhs[14] = v32;
          *(_WORD *)&rhs[22] = 2112;
          *(_QWORD *)&rhs[24] = FirstCurrentItem;
          _os_log_send_and_compose_impl();
        }
        goto LABEL_72;
      }
      if (dword_1EE2A33C8)
      {
        LODWORD(v97.value) = 0;
        LOBYTE(v96.value) = 0;
        v34 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v35 = v97.value;
        if (os_log_type_enabled(v34, v96.value))
          v36 = v35;
        else
          v36 = v35 & 0xFFFFFFFE;
        if (v36)
        {
          v37 = *(_QWORD *)(v31 + 864);
          *(_DWORD *)rhs = 136315650;
          *(_QWORD *)&rhs[4] = "fpic_StartRecordingActiveInterstitialItemPlayoutTime";
          *(_WORD *)&rhs[12] = 2048;
          *(_QWORD *)&rhs[14] = v29;
          *(_WORD *)&rhs[22] = 2048;
          *(_QWORD *)&rhs[24] = v37;
          _os_log_send_and_compose_impl();
        }
LABEL_72:
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
LABEL_73:
    CFRelease(v32);
    goto LABEL_74;
  }
}

@end
