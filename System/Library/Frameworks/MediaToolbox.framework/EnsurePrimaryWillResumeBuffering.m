@implementation EnsurePrimaryWillResumeBuffering

uint64_t __fpic_EnsurePrimaryWillResumeBuffering_block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t DerivedStorage;
  CFIndex v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *PerAssetPerEventTrackedObject;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  _BOOL4 v19;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int v21;
  unsigned int v22;
  Float64 Seconds;
  const char *v24;
  Float64 v25;
  Float64 v26;
  NSObject *v27;
  unsigned int value;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t FigBaseObject;
  void (*v34)(uint64_t, const __CFString *, _QWORD);
  uint64_t v35;
  _OWORD *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  CFIndex v40;
  CMTime v41;
  CMTime v42;
  CMTime v43;
  __int128 v44;
  uint64_t v45;
  os_log_type_t type;
  unsigned int v47;
  CMTime v48;
  CMTime v49;
  CMTime rhs;
  uint64_t v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  Float64 v55;
  __int16 v56;
  Float64 v57;
  _BYTE lhs[32];
  uint64_t v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v39 = (_QWORD *)result;
  if ((*(_BYTE *)(*(_QWORD *)(result + 40) + 884) & 1) == 0)
    return result;
  v1 = *(_QWORD *)(result + 48);
  v2 = *(_QWORD *)(result + 56);
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  result = CFArrayGetCount(*(CFArrayRef *)(DerivedStorage + 600));
  v40 = result;
  if (result < 1)
    goto LABEL_25;
  v4 = 0;
  v5 = 1;
  do
  {
    result = fpic_GetPerEventTrackingCount(DerivedStorage, v4);
    if (result < 1)
      goto LABEL_25;
    v6 = result;
    v7 = 1;
    do
    {
      PerAssetPerEventTrackedObject = (__CFString *)fpic_GetPerAssetPerEventTrackedObject(DerivedStorage, v4, v7 - 1, CFSTR("PlaybackItem"));
      result = CMBaseObjectGetDerivedStorage();
      if (v2 && PerAssetPerEventTrackedObject && PerAssetPerEventTrackedObject != CFSTR("DummyItem"))
      {
        result = (*(uint64_t (**)(uint64_t, uint64_t, __CFString *))(result + 72))(v1, v2, PerAssetPerEventTrackedObject);
        if (!result)
          goto LABEL_12;
        result = fpic_IsItemBufferedToEnd(v1, result);
        v5 = (_DWORD)result != 0;
      }
      else if (PerAssetPerEventTrackedObject != CFSTR("DummyItem"))
      {
LABEL_12:
        v5 = 0;
      }
      if (v7 >= v6)
        break;
      ++v7;
    }
    while (v5);
    ++v4;
  }
  while (v4 < v40 && v5);
  if (v5)
    goto LABEL_18;
LABEL_25:
  v15 = v39[5];
  if (!*(_BYTE *)(v15 + 232) && !*(_BYTE *)(v15 + 233))
  {
LABEL_18:
    v9 = CMBaseObjectGetDerivedStorage();
    if (!*(_BYTE *)(v9 + 974) || !*(_BYTE *)(v9 + 973))
      goto LABEL_52;
    v10 = CMBaseObjectGetDerivedStorage();
    v11 = v10 + 240;
    if (!*(_BYTE *)(v10 + 272) && !*(_BYTE *)(v10 + 273))
      v11 = v10 + 200;
    v12 = *(double *)(v11 + 24);
    v13 = *(unsigned __int8 *)(v11 + 32);
    v14 = *(unsigned __int8 *)(v11 + 33);
    v44 = 0uLL;
    v45 = 0;
    if (v13)
    {
LABEL_24:
      v44 = *(_OWORD *)v11;
      v45 = *(_QWORD *)(v11 + 16);
    }
    else
    {
      if (!v14)
      {
        v11 = MEMORY[0x1E0CA2E18];
        goto LABEL_24;
      }
      v16 = v39[5] + 280;
      v17 = *(_OWORD *)(v39[5] + 296);
      *(_OWORD *)lhs = *(_OWORD *)v16;
      *(_OWORD *)&lhs[16] = v17;
      v59 = *(_QWORD *)(v16 + 32);
      FigCreateTimeWithDateAndMoment((uint64_t)lhs, (uint64_t)&v44, v12);
    }
    memset(&v43, 0, sizeof(v43));
    fpic_CurrentResumptionOffset(v39[6], 1, v39[7], 0, &v43);
    if ((BYTE12(v44) & 1) != 0 && (v43.flags & 1) != 0 && *(_QWORD *)(v39[5] + 152))
    {
      memset(&v42, 0, sizeof(v42));
      *(_OWORD *)lhs = v44;
      *(_QWORD *)&lhs[16] = v45;
      rhs = v43;
      CMTimeAdd(&v42, (CMTime *)lhs, &rhs);
      v18 = *(_QWORD *)(v39[5] + 152);
      v41 = v42;
      memset(&v49, 0, sizeof(v49));
      memset(&v48, 0, sizeof(v48));
      fpic_GetSeekableRange(v18, 1, &v49, &v48);
      if ((v49.flags & 0x1D) == 1
        && (v48.flags & 0x1D) == 1
        && (*(CMTime *)lhs = v49, rhs = v41, CMTimeCompare((CMTime *)lhs, &rhs) <= 0))
      {
        *(CMTime *)lhs = v48;
        rhs = v41;
        v19 = CMTimeCompare((CMTime *)lhs, &rhs) >= 0;
      }
      else
      {
        v19 = 0;
      }
      if (dword_1EE2A33C8 >= 7)
      {
        v47 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v21 = v47;
        if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
          v22 = v21;
        else
          v22 = v21 & 0xFFFFFFFE;
        if (v22)
        {
          *(CMTime *)lhs = v41;
          Seconds = CMTimeGetSeconds((CMTime *)lhs);
          if (v19)
            v24 = "";
          else
            v24 = " not";
          *(CMTime *)lhs = v49;
          v25 = CMTimeGetSeconds((CMTime *)lhs);
          *(CMTime *)lhs = v48;
          v26 = CMTimeGetSeconds((CMTime *)lhs);
          LODWORD(rhs.value) = 136316418;
          *(CMTimeValue *)((char *)&rhs.value + 4) = (CMTimeValue)"fpic_SeekableRangeIncludesTime";
          LOWORD(rhs.flags) = 2048;
          *(Float64 *)((char *)&rhs.flags + 2) = Seconds;
          HIWORD(rhs.epoch) = 2048;
          v51 = v18;
          v52 = 2080;
          v53 = v24;
          v54 = 2048;
          v55 = v25;
          v56 = 2048;
          v57 = v26;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      if (v19)
        goto LABEL_52;
    }
    result = CMBaseObjectGetDerivedStorage();
    if ((*(_BYTE *)(result + 516) & 1) != 0 && !*(_DWORD *)(result + 716))
    {
      result = (uint64_t)fpic_GetCurrentlyPlayingEvent();
      if (result)
      {
LABEL_52:
        if (dword_1EE2A33C8)
        {
          LODWORD(v49.value) = 0;
          LOBYTE(v48.value) = 0;
          v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          value = v49.value;
          if (os_log_type_enabled(v27, v48.value))
            v29 = value;
          else
            v29 = value & 0xFFFFFFFE;
          if (v29)
          {
            v30 = v39[6];
            v31 = *(_QWORD *)(v39[5] + 152);
            LODWORD(rhs.value) = 136315650;
            *(CMTimeValue *)((char *)&rhs.value + 4) = (CMTimeValue)"fpic_EnsurePrimaryWillResumeBuffering_block_invoke";
            LOWORD(rhs.flags) = 2048;
            *(_QWORD *)((char *)&rhs.flags + 2) = v30;
            HIWORD(rhs.epoch) = 2048;
            v51 = v31;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        v32 = *(_QWORD *)(v39[5] + 152);
        if (v32)
        {
          FigBaseObject = FigPlaybackItemGetFigBaseObject(v32);
          v34 = *(void (**)(uint64_t, const __CFString *, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 56);
          if (v34)
            v34(FigBaseObject, CFSTR("TimeToPauseBuffering"), 0);
          v35 = v39[5];
          v36 = (_OWORD *)MEMORY[0x1E0CA2E18];
          *(_QWORD *)(v35 + 888) = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
          *(_OWORD *)(v35 + 872) = *v36;
          v37 = CMBaseObjectGetDerivedStorage();
          StopAndReleaseTimer((dispatch_object_t *)(v37 + 648));
          *(_WORD *)(v37 + 704) = 0;
          result = CMBaseObjectGetDerivedStorage();
          if (*(_BYTE *)(result + 976))
          {
            result = fpic_ApplyResumptionOffset(v39[6], 1, 0, v39[7], 0);
            v38 = v39[4];
            goto LABEL_64;
          }
        }
        else
        {
          result = FigSignalErrorAt();
          v38 = v39[4];
LABEL_64:
          *(_DWORD *)(*(_QWORD *)(v38 + 8) + 24) = result;
        }
      }
    }
  }
  return result;
}

@end
