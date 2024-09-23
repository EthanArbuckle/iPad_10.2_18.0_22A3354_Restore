@implementation HandleEndTimeChangedNotification

uint64_t __fpic_HandleEndTimeChangedNotification_block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t DerivedStorage;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  const void *v15;
  _OWORD *v16;
  CFStringRef MomentDesc;
  CFStringRef v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  __int16 v22;
  __int128 v23;
  __int128 v24;
  CMTime type;
  _BYTE rhs[32];
  char v27;
  char v28;
  int v29;
  __int16 v30;
  _BYTE time[32];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 48);
  if (*(_QWORD *)(result + 40) == *(_QWORD *)(v1 + 152))
  {
    v2 = result;
    if (*(_BYTE *)(result + 88) || *(_BYTE *)(result + 89))
    {
      *(_QWORD *)&time[16] = *(_QWORD *)(v1 + 376);
      *(_OWORD *)time = *(_OWORD *)(v1 + 360);
      *(_OWORD *)rhs = *(_OWORD *)(result + 104);
      *(_QWORD *)&rhs[16] = *(_QWORD *)(result + 120);
      result = fpic_TimesAreClose((CMTime *)time, (CMTime *)rhs);
      if (!(_DWORD)result)
      {
        if (dword_1EE2A33C8)
        {
          LOBYTE(type.value) = 0;
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        v4 = *(_QWORD *)(v2 + 48);
        v5 = *(_OWORD *)(v2 + 104);
        *(_QWORD *)(v4 + 376) = *(_QWORD *)(v2 + 120);
        *(_OWORD *)(v4 + 360) = v5;
        v6 = *(_QWORD *)(v2 + 96);
        v23 = *(_OWORD *)(v2 + 56);
        v24 = *(_OWORD *)(v2 + 72);
        v7 = *(unsigned __int8 *)(v2 + 88);
        v8 = *(unsigned __int8 *)(v2 + 89);
        v21 = *(_DWORD *)(v2 + 90);
        v22 = *(_WORD *)(v2 + 94);
        DerivedStorage = CMBaseObjectGetDerivedStorage();
        *(_OWORD *)time = v23;
        *(_QWORD *)&time[16] = v24;
        memset(&type, 0, sizeof(type));
        *(_OWORD *)rhs = kPostRollTimeToPausePlaybackBuffer;
        *(_QWORD *)&rhs[16] = 0;
        CMTimeAdd(&type, (CMTime *)time, (CMTime *)rhs);
        v10 = CMBaseObjectGetDerivedStorage();
        if (*(_BYTE *)(v10 + 978))
        {
          v11 = v10;
          if (!*(_BYTE *)(v10 + 232) || !v7)
          {
            result = 0;
            if (!*(_BYTE *)(v11 + 233) || !v8)
              goto LABEL_28;
          }
          v12 = v11 + 200;
          v13 = *(_OWORD *)(v12 + 16);
          *(_OWORD *)time = *(_OWORD *)v12;
          *(_OWORD *)&time[16] = v13;
          v32 = *(_QWORD *)(v12 + 32);
          *(_OWORD *)rhs = v23;
          *(_OWORD *)&rhs[16] = v24;
          v27 = v7;
          v28 = v8;
          v29 = v21;
          v30 = v22;
          if (!fpic_MomentsAreClose((uint64_t)time, (uint64_t)rhs))
          {
            v14 = FigCFWeakReferenceHolderCopyReferencedObject();
            if (!v14)
            {
              result = FigSignalErrorAt();
              goto LABEL_28;
            }
            v15 = (const void *)v14;
            if (!*(_BYTE *)(DerivedStorage + 977))
            {
              v16 = (_OWORD *)(DerivedStorage + 200);
              *(_OWORD *)time = *(_OWORD *)(DerivedStorage + 200);
              *(_OWORD *)&time[16] = *(_OWORD *)(DerivedStorage + 216);
              v32 = *(_QWORD *)(DerivedStorage + 232);
              MomentDesc = fpic_CreateMomentDesc((uint64_t)time);
              *(_OWORD *)time = v23;
              *(_OWORD *)&time[16] = v24;
              LOBYTE(v32) = v7;
              BYTE1(v32) = v8;
              *(_DWORD *)((char *)&v32 + 2) = v21;
              HIWORD(v32) = v22;
              v18 = fpic_CreateMomentDesc((uint64_t)time);
              if (dword_1EE2A33C8)
              {
                v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
                fig_log_call_emit_and_clean_up_after_send_and_compose();
                v16 = (_OWORD *)(DerivedStorage + 200);
              }
              *v16 = v23;
              v16[1] = v24;
              *(_BYTE *)(DerivedStorage + 232) = v7;
              *(_BYTE *)(DerivedStorage + 233) = v8;
              *(_DWORD *)(DerivedStorage + 234) = v21;
              *(_WORD *)(DerivedStorage + 238) = v22;
              if (MomentDesc)
                CFRelease(MomentDesc);
              if (v18)
                CFRelease(v18);
            }
            if ((*(_BYTE *)(DerivedStorage + 908) & 1) != 0)
            {
              *(_OWORD *)time = *(_OWORD *)(DerivedStorage + 896);
              *(_QWORD *)&time[16] = *(_QWORD *)(DerivedStorage + 912);
              *(CMTime *)rhs = type;
              if (!fpic_TimesAreClose((CMTime *)time, (CMTime *)rhs))
              {
                if (dword_1EE2A33C8)
                {
                  v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
                  fig_log_call_emit_and_clean_up_after_send_and_compose();
                }
                fpic_GatePrimaryPlaybackAtCurrentEvent(v6, (uint64_t)v15);
              }
            }
            fpic_updateCurrentResumptionTimeIfPlayingPostroll();
            CFRelease(v15);
          }
        }
        result = 0;
LABEL_28:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 8) + 24) = result;
      }
    }
  }
  return result;
}

@end
