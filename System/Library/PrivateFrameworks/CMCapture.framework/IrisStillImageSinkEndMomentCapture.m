@implementation IrisStillImageSinkEndMomentCapture

uint64_t __captureSession_IrisStillImageSinkEndMomentCapture_block_invoke(_QWORD *a1)
{
  uint64_t DerivedStorage;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  OpaqueCMClock *HostTimeClock;
  void *v12;
  uint64_t v13;
  CMClockRef v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  unsigned int value;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  const __CFString *v33;
  Float64 Seconds;
  void *v35;
  double v36;
  uint64_t result;
  CMTime *p_time2;
  uint64_t v39;
  uint64_t v40;
  CMTime v41;
  os_log_type_t v42;
  int v43;
  CMTime lhs;
  CMTime type;
  CMTime rhs;
  CMTime v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  CMTime v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  CMTime v56;
  CMClockOrTimebaseRef v57;
  CMTime time2;
  uint64_t v59;
  __int16 v60;
  const __CFString *v61;
  __int16 v62;
  Float64 v63;
  CMTime hostTime;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v3 = (void *)objc_msgSend(*(id *)(DerivedStorage + 624), "movieFileSinkPipelineWithSinkID:", a1[4]);
  v4 = (void *)objc_msgSend(*(id *)(DerivedStorage + 624), "stillImageSinkPipelineSessionStorageWithSinkID:", a1[4]);
  v40 = objc_msgSend(v4, "cameraSourcePipeline");
  v5 = *(void **)(a1[6] + 624);
  v6 = -[FigCaptureMovieFileSinkPipeline videoSourceID]((uint64_t)v3);
  v7 = (void *)objc_msgSend(v5, "previewSinkPipelineWithSourceID:sourceDeviceType:", v6, -[FigCaptureMovieFileSinkPipeline videoSourceDeviceType]((uint64_t)v3));
  os_unfair_lock_lock((os_unfair_lock_t)(a1[6] + 320));
  v8 = a1[7];
  v9 = objc_msgSend(*(id *)(a1[6] + 576), "settingsID");
  v10 = a1[6];
  if (v8 == v9)
  {

    v10 = a1[6];
    *(_QWORD *)(v10 + 576) = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 320));
  v57 = 0;
  cs_getMasterClockAndType(*(void **)(DerivedStorage + 624), (uint64_t *)&v57, 0);
  memset(&v56, 0, sizeof(v56));
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v56, HostTimeClock);
  v12 = (void *)objc_msgSend(v4, "previewSinkNode");
  hostTime = v56;
  v13 = CMClockConvertHostTimeToSystemUnits(&hostTime);
  v53 = 0;
  v54 = 0;
  v55 = 0;
  if (v12)
    objc_msgSend(v12, "previewPTSDisplayedAtHostTime:allowingExtrapolation:", v13, 1);
  memset(&v52, 0, sizeof(v52));
  v14 = CMClockGetHostTimeClock();
  hostTime = v56;
  CMSyncConvertTime(&v52, &hostTime, v14, v57);
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v15 = (void *)objc_msgSend(v3, "pendingIrisRecordings");
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v65, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v49;
LABEL_7:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v49 != v18)
        objc_enumerationMutation(v15);
      v20 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v19);
      if (objc_msgSend((id)objc_msgSend(v20, "settings"), "settingsID") == a1[7])
        break;
      if (v17 == ++v19)
      {
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v65, 16);
        if (v17)
          goto LABEL_7;
        goto LABEL_21;
      }
    }
    if ((objc_msgSend((id)objc_msgSend(v20, "settings"), "isIrisMovieRecording") & 1) == 0 && dword_1ECFE9590)
    {
      LODWORD(v47.value) = 0;
      LOBYTE(type.value) = 0;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (v20)
    {
      if ((objc_msgSend(v20, "isEmpty") & 1) == 0)
      {
        v22 = (void *)objc_msgSend(v20, "irisMovieInfo");
        v23 = v22;
        memset(&v47, 0, sizeof(v47));
        if (v22)
          objc_msgSend(v22, "stillImageCaptureTime");
        else
          memset(&rhs, 0, sizeof(rhs));
        hostTime = v52;
        CMTimeSubtract(&v47, &hostTime, &rhs);
        memset(&type, 0, sizeof(type));
        CMTimeMake(&type, 500, 1000);
        if ((v47.flags & 1) == 0 || (hostTime = v47, time2 = type, CMTimeCompare(&hostTime, &time2) < 0))
        {
          if (v23)
            objc_msgSend(v23, "stillImageCaptureTime");
          else
            memset(&lhs, 0, sizeof(lhs));
          time2 = type;
          CMTimeAdd(&hostTime, &lhs, &time2);
          v52 = hostTime;
          if (dword_1ECFE9590)
          {
            v43 = 0;
            v42 = OS_LOG_TYPE_DEFAULT;
            v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
        }
      }
      if (dword_1ECFE9590)
      {
        LODWORD(v47.value) = 0;
        LOBYTE(type.value) = 0;
        v28 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        value = v47.value;
        if (os_log_type_enabled(v28, type.value))
          v30 = value;
        else
          v30 = value & 0xFFFFFFFE;
        if (v30)
        {
          v31 = *(_QWORD *)(a1[6] + 72);
          v32 = objc_msgSend((id)objc_msgSend(v20, "settings"), "settingsID");
          if (objc_msgSend(v20, "isEmpty"))
            v33 = CFSTR("YES");
          else
            v33 = CFSTR("NO");
          hostTime = v52;
          Seconds = CMTimeGetSeconds(&hostTime);
          LODWORD(time2.value) = 136316162;
          *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)"captureSession_IrisStillImageSinkEndMomentCapture_block_invoke";
          LOWORD(time2.flags) = 2114;
          *(_QWORD *)((char *)&time2.flags + 2) = v31;
          HIWORD(time2.epoch) = 2048;
          v59 = v32;
          v60 = 2112;
          v61 = v33;
          v62 = 2048;
          v63 = Seconds;
          LODWORD(v39) = 52;
          p_time2 = &time2;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v41 = v52;
      objc_msgSend(v20, "setMomentCaptureMovieRecordingMasterEndTime:", &v41, p_time2, v39);
      goto LABEL_43;
    }
  }
LABEL_21:
  if (dword_1ECFE9590)
  {
    LODWORD(v47.value) = 0;
    LOBYTE(type.value) = 0;
    v24 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v25 = (void *)-[FigCaptureMovieFileSinkPipeline irisStagingNode]((uint64_t)v3);
  v26 = a1[7];
  hostTime = v52;
  objc_msgSend(v25, "setMomentCaptureMovieRecordingMasterEndTime:forRequestWithSettingsID:", &hostTime, v26);
LABEL_43:
  objc_msgSend(v7, "setVideoStabilizationOverscanCropEnabled:momentMovieRecordingEnabled:", 0, 0, p_time2, v39);
  objc_msgSend(v7, "setSemanticStyleRenderingSuspended:animated:", 0, 1);
  objc_msgSend(v4, "setVideoStabilizationOverscanCropEnabled:", 0);
  if (objc_msgSend((id)-[FigCaptureMovieFileSinkPipeline captureDevice]((uint64_t)v3), "temporalNoiseReductionBand0StrengthModulation"))objc_msgSend((id)-[FigCaptureMovieFileSinkPipeline captureDevice]((uint64_t)v3), "setTemporalNoiseReductionBand0StrengthModulation:", 0);
  v35 = (void *)-[FigCaptureCameraSourcePipeline captureDevice](v40);
  objc_msgSend(v35, "setAutomaticallyAdjustsTorch:", 0);
  LODWORD(v36) = 0;
  result = objc_msgSend(v35, "setTorchLevel:", v36);
  if (v3)
    return cs_resetImageControlModeAndStreamSelection((uint64_t)v3, 1);
  return result;
}

@end
