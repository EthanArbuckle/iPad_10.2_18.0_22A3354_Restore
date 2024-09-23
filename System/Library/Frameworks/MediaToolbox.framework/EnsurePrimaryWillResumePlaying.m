@implementation EnsurePrimaryWillResumePlaying

void __fpic_EnsurePrimaryWillResumePlaying_block_invoke(_QWORD *a1)
{
  uint64_t DerivedStorage;
  uint64_t v3;
  uint64_t v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  Float64 Seconds;
  Float64 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t UpTimeNanoseconds;
  NSObject *v19;
  unsigned int value;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  Float64 v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _OWORD *v30;
  NSObject *v31;
  unsigned int v32;
  unsigned int v33;
  Float64 v34;
  Float64 v35;
  _OWORD v36[2];
  uint64_t v37;
  os_log_type_t type;
  os_log_type_t v39[4];
  CMTime v40;
  CMTime time2;
  Float64 v42;
  __int16 v43;
  Float64 v44;
  _BYTE time[32];
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!(*(unsigned __int8 *)(DerivedStorage + 352) | *(unsigned __int8 *)(DerivedStorage + 353))
    || *(_DWORD *)(CMBaseObjectGetDerivedStorage() + 724)
    || *(_DWORD *)(CMBaseObjectGetDerivedStorage() + 728))
  {
    goto LABEL_4;
  }
  if (!CFArrayGetCount(*(CFArrayRef *)(a1[6] + 600)))
    goto LABEL_18;
  v12 = a1[6] + 320;
  v13 = CMBaseObjectGetDerivedStorage();
  v14 = v13 + 240;
  if (!*(_BYTE *)(v13 + 272) && !*(_BYTE *)(v13 + 273))
    v14 = v13 + 200;
  v15 = *(_OWORD *)(v14 + 16);
  v36[0] = *(_OWORD *)v14;
  v36[1] = v15;
  v37 = *(_QWORD *)(v14 + 32);
  v16 = *(_OWORD *)(v12 + 16);
  *(_OWORD *)time = *(_OWORD *)v12;
  *(_OWORD *)&time[16] = v16;
  v46 = *(_QWORD *)(v12 + 32);
  if (fpic_MomentsAreClose((uint64_t)time, (uint64_t)v36))
  {
LABEL_4:
    v3 = a1[6];
    if ((*(_BYTE *)(v3 + 908) & 1) != 0 && !*(_BYTE *)(v3 + 920))
    {
      memset(&v40, 0, sizeof(v40));
      fpic_TimeToGatePrimaryPlaybackAtCurrentEvent(0, (uint64_t)&v40);
      v4 = a1[6];
      *(_OWORD *)time = *(_OWORD *)(v4 + 896);
      *(_QWORD *)&time[16] = *(_QWORD *)(v4 + 912);
      time2 = v40;
      if (!fpic_TimesAreClose((CMTime *)time, &time2))
      {
        if (dword_1EE2A33C8)
        {
          *(_DWORD *)v39 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v6 = *(_DWORD *)v39;
          if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
            v7 = v6;
          else
            v7 = v6 & 0xFFFFFFFE;
          if (v7)
          {
            v9 = a1[5];
            v8 = a1[6];
            *(_OWORD *)time = *(_OWORD *)(v8 + 896);
            *(_QWORD *)&time[16] = *(_QWORD *)(v8 + 912);
            Seconds = CMTimeGetSeconds((CMTime *)time);
            *(CMTime *)time = v40;
            v11 = CMTimeGetSeconds((CMTime *)time);
            LODWORD(time2.value) = 136315906;
            *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)"fpic_EnsurePrimaryWillResumePlaying_block_invoke";
            LOWORD(time2.flags) = 2048;
            *(_QWORD *)((char *)&time2.flags + 2) = v9;
            HIWORD(time2.epoch) = 2048;
            v42 = Seconds;
            v43 = 2048;
            v44 = v11;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        fpic_UngatePrimaryPlayback(a1[5]);
      }
    }
  }
  else
  {
LABEL_18:
    v17 = a1[6];
    if (!*(_QWORD *)(v17 + 1008))
    {
      if (CMTimebaseGetRate(*(CMTimebaseRef *)(v17 + 1048)) == 0.0)
      {
        UpTimeNanoseconds = FigGetUpTimeNanoseconds();
        v17 = a1[6];
        *(_QWORD *)(v17 + 1008) = UpTimeNanoseconds;
      }
      else
      {
        v17 = a1[6];
      }
    }
    if (!*(_DWORD *)(v17 + 716))
    {
      if (dword_1EE2A33C8)
      {
        LODWORD(v40.value) = 0;
        v39[0] = OS_LOG_TYPE_DEFAULT;
        v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        value = v40.value;
        if (os_log_type_enabled(v19, v39[0]))
          v21 = value;
        else
          v21 = value & 0xFFFFFFFE;
        if (v21)
        {
          v23 = a1[5];
          v22 = a1[6];
          v24 = *(double *)(v22 + 152);
          *(_OWORD *)time = *(_OWORD *)(v22 + 504);
          *(_QWORD *)&time[16] = *(_QWORD *)(v22 + 520);
          v25 = CMTimeGetSeconds((CMTime *)time);
          LODWORD(time2.value) = 136315906;
          *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)"fpic_EnsurePrimaryWillResumePlaying_block_invoke";
          LOWORD(time2.flags) = 2048;
          *(_QWORD *)((char *)&time2.flags + 2) = v23;
          HIWORD(time2.epoch) = 2048;
          v42 = v24;
          v43 = 2048;
          v44 = v25;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      fpic_TransitionPlayback(a1[5], a1[7], 1, a1[8]);
      *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v26;
      if (!*(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24))
      {
        v27 = CMBaseObjectGetDerivedStorage();
        if (*(_QWORD *)(v27 + 152))
        {
          v28 = v27;
          v29 = CMBaseObjectGetDerivedStorage();
          if (*(_BYTE *)(v29 + 974))
          {
            if (!*(_BYTE *)(v29 + 973) && (*(_BYTE *)(v28 + 516) & 1) != 0)
            {
              v30 = (_OWORD *)(v28 + 504);
              memset(&v40, 0, sizeof(v40));
              fpic_GetItemEndTime(*(_QWORD *)(v28 + 152), (uint64_t)&v40);
              if (dword_1EE2A33C8)
              {
                *(_DWORD *)v39 = 0;
                type = OS_LOG_TYPE_DEFAULT;
                v31 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                v32 = *(_DWORD *)v39;
                if (os_log_type_enabled(v31, type))
                  v33 = v32;
                else
                  v33 = v32 & 0xFFFFFFFE;
                if (v33)
                {
                  *(_OWORD *)time = *v30;
                  *(_QWORD *)&time[16] = *(_QWORD *)(v28 + 520);
                  v34 = CMTimeGetSeconds((CMTime *)time);
                  *(CMTime *)time = v40;
                  v35 = CMTimeGetSeconds((CMTime *)time);
                  LODWORD(time2.value) = 136315650;
                  *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)"fpic_EndPrimaryItemIfResumePastEnd";
                  LOWORD(time2.flags) = 2048;
                  *(Float64 *)((char *)&time2.flags + 2) = v34;
                  HIWORD(time2.epoch) = 2048;
                  v42 = v35;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              *(_OWORD *)time = *v30;
              *(_QWORD *)&time[16] = *(_QWORD *)(v28 + 520);
              time2 = v40;
              if (CMTimeCompare((CMTime *)time, &time2) >= 1)
              {
                *(_OWORD *)time = *MEMORY[0x1E0CA2E18];
                *(_QWORD *)&time[16] = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
                FigCFCopyPropertyAsTime();
                time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
                FigCFSetPropertyToTime();
                time2 = *(CMTime *)time;
                FigCFSetPropertyToTime();
              }
            }
          }
        }
      }
    }
  }
}

@end
