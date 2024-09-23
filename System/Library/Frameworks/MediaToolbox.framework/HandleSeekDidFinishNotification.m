@implementation HandleSeekDidFinishNotification

void __fpic_HandleSeekDidFinishNotification_block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t DerivedStorage;
  uint64_t LastCurrentItem;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int v15;
  unint64_t v16;
  void (*v17)(uint64_t, _BYTE *);
  dispatch_object_t *v18;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int value;
  unsigned int v21;
  uint64_t v22;
  int v23;
  CMTime lhs;
  _BYTE time1[32];
  uint64_t v26;
  _BYTE v27[32];
  uint64_t v28;
  CMTime rhs;
  CMTimeValue v30;
  CMTimeScale v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 40);
  if (v2 == *(_DWORD *)(v3 + 716))
  {
    if ((*(_DWORD *)(a1 + 80) & 0x1D) == 1)
    {
      lhs = *(CMTime *)(a1 + 68);
      v4 = *(_OWORD *)(v3 + 296);
      *(_OWORD *)v27 = *(_OWORD *)(v3 + 280);
      *(_OWORD *)&v27[16] = v4;
      v28 = *(_QWORD *)(v3 + 312);
      fpic_MakeMomentFromTime((uint64_t)&lhs, (uint64_t)v27, (uint64_t)time1);
      v5 = *(_OWORD *)&time1[16];
      *(_OWORD *)(v3 + 280) = *(_OWORD *)time1;
      *(_OWORD *)(v3 + 296) = v5;
      *(_QWORD *)(v3 + 312) = v26;
      v3 = *(_QWORD *)(a1 + 40);
    }
    v6 = *(_QWORD *)(v3 + 152);
    if (v6)
    {
      v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
      if (v7)
        v7(v6, v3 + 504);
      fpic_updateCurrentResumptionTimeIfPlayingPostroll();
      fpic_EnsureCurrentEventsHaveResolvedProperties(*(const void **)(a1 + 48));
      v3 = *(_QWORD *)(a1 + 40);
    }
    *(_DWORD *)(v3 + 716) = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    fpic_clearIntendedCurrentItemMoment();
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    DerivedStorage = CMBaseObjectGetDerivedStorage();
    LastCurrentItem = fpic_GetLastCurrentItem(v8, v9);
    if (LastCurrentItem)
    {
      v12 = LastCurrentItem;
      memset(v27, 0, 24);
      fpic_GetItemEndTime(LastCurrentItem, (uint64_t)time1);
      v30 = *(_QWORD *)time1;
      v13 = *(_DWORD *)&time1[12];
      v31 = *(_DWORD *)&time1[8];
      if ((time1[12] & 1) != 0)
      {
        v14 = *(_QWORD *)&time1[16];
        lhs.value = v30;
        lhs.timescale = v31;
        lhs.flags = *(_DWORD *)&time1[12];
        lhs.epoch = *(_QWORD *)&time1[16];
        rhs = *(CMTime *)gAudioTransitionScheduleAdvance;
        CMTimeSubtract((CMTime *)time1, &lhs, &rhs);
        rhs.value = *(_QWORD *)time1;
        v15 = *(_DWORD *)&time1[12];
        rhs.timescale = *(_DWORD *)&time1[8];
        v16 = *(_QWORD *)&time1[16];
        v17 = *(void (**)(uint64_t, _BYTE *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
        if (v17)
          v17(v12, v27);
        *(_QWORD *)time1 = rhs.value;
        *(_QWORD *)&time1[8] = __PAIR64__(v15, rhs.timescale);
        *(_QWORD *)&time1[16] = v16;
        lhs = *(CMTime *)v27;
        if (CMTimeCompare((CMTime *)time1, &lhs) < 1)
        {
          *(_QWORD *)time1 = v30;
          *(_QWORD *)&time1[8] = __PAIR64__(v13, v31);
          *(_QWORD *)&time1[16] = v14;
          fpic_scheduleInterstitialAudioTransition(v8, (__int128 *)time1, 0);
        }
        else
        {
          v18 = (dispatch_object_t *)(DerivedStorage + 664);
          StopAndReleaseTimer(v18);
          *(_QWORD *)time1 = rhs.value;
          *(_QWORD *)&time1[8] = __PAIR64__(v15, rhs.timescale);
          *(_OWORD *)&time1[16] = v16;
          v26 = v15 & 1;
          fpic_CreateAndPrimeItemTimer(v8, v12, (uint64_t)time1, (void (__cdecl *)(void *))fpic_SchedulePrimaryTransitionTimerProc, v18);
        }
      }
    }
    v2 = *(_DWORD *)(a1 + 64);
    v3 = *(_QWORD *)(a1 + 40);
  }
  if (v2 == *(_DWORD *)(v3 + 1040))
  {
    fpic_recordSeekIDAndShowInterstitialLayer(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), -1, *(_BYTE *)(a1 + 92) == 0, *(unsigned __int8 *)(a1 + 92));
    v2 = *(_DWORD *)(a1 + 64);
    v3 = *(_QWORD *)(a1 + 40);
  }
  if (v2 == *(_DWORD *)(v3 + 724))
  {
    fpic_FinishInitiatedSeek(*(const void **)(a1 + 48), *(unsigned __int8 *)(a1 + 92));
    v2 = *(_DWORD *)(a1 + 64);
    v3 = *(_QWORD *)(a1 + 40);
  }
  if (v2 == *(_DWORD *)(v3 + 728))
  {
    if (dword_1EE2A33C8)
    {
      LODWORD(lhs.value) = 0;
      LOBYTE(rhs.value) = 0;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      value = lhs.value;
      if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, rhs.value))
        v21 = value;
      else
        v21 = value & 0xFFFFFFFE;
      if (v21)
      {
        v22 = *(_QWORD *)(a1 + 48);
        v23 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 728);
        *(_DWORD *)v27 = 136315650;
        *(_QWORD *)&v27[4] = "fpic_HandleSeekDidFinishNotification_block_invoke";
        *(_WORD *)&v27[12] = 2048;
        *(_QWORD *)&v27[14] = v22;
        *(_WORD *)&v27[22] = 1024;
        *(_DWORD *)&v27[24] = v23;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    *(_DWORD *)(CMBaseObjectGetDerivedStorage() + 728) = 0;
  }
}

@end
