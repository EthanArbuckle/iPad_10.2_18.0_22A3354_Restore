@implementation SetSectionProperty

void __captureSession_SetSectionProperty_block_invoke(uint64_t a1)
{
  const void *v2;
  const void *v3;
  const void *v4;

  captureSession_setPreviewSinkProperty(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(const void **)(a1 + 48), *(void **)(a1 + 56));
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
  v3 = *(const void **)(a1 + 48);
  if (v3)
    CFRelease(v3);
  v4 = *(const void **)(a1 + 56);
  if (v4)
    CFRelease(v4);
}

void __captureSession_SetSectionProperty_block_invoke_2(uint64_t a1)
{
  const void *v2;
  const void *v3;
  const void *v4;

  captureSession_setPreviewSinkProperty(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(const void **)(a1 + 48), *(void **)(a1 + 56));
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
  v3 = *(const void **)(a1 + 48);
  if (v3)
    CFRelease(v3);
  v4 = *(const void **)(a1 + 56);
  if (v4)
    CFRelease(v4);
}

void __captureSession_SetSectionProperty_block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v6;
  CMClockRef HostTimeClock;
  NSObject *v8;
  CMClockRef v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  const void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  CMTimeEpoch epoch;
  CMTimeFlags flags;
  uint64_t v30;
  int v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  FigCaptureStillImageSettings *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  CMTimeValue v43;
  CMTimeScale v44;
  CMTimeFlags v45;
  CMTimeEpoch v46;
  CMTimeValue value;
  CMTimeScale timescale;
  CMTimeFlags v49;
  CMTimeEpoch v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[64];
  _BYTE v60[64];
  CMTime time;
  os_log_type_t type[8];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  CMTime v66;
  CMTime v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 624), "movieFileSinkPipelineWithSinkID:", *(_QWORD *)(a1 + 48));
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 624), "visionDataSinkPipelineWithSinkID:", *(_QWORD *)(a1 + 48));
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 624), "stillImageSinkPipelineSessionStorageWithSinkID:", *(_QWORD *)(a1 + 48));
  if (CFEqual(*(CFTypeRef *)(a1 + 56), CFSTR("BeginIrisMovieCaptureHostTime")))
  {
    if (dword_1ECFE9590)
    {
      LODWORD(time.value) = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (v2)
    {
      *(_QWORD *)type = 0;
      cs_getMasterClockAndType(*(void **)(*(_QWORD *)(a1 + 40) + 624), (uint64_t *)type, 0);
      memset(&v67, 0, sizeof(v67));
      CMTimeMakeFromDictionary(&v67, *(CFDictionaryRef *)(a1 + 64));
      memset(&v66, 0, sizeof(v66));
      HostTimeClock = CMClockGetHostTimeClock();
      time = v67;
      CMSyncConvertTime(&v66, &time, HostTimeClock, *(CMClockOrTimebaseRef *)type);
      *(CMTime *)&v60[32] = v66;
      *(CMTime *)v60 = v66;
      objc_msgSend((id)-[FigCaptureMovieFileSinkPipeline irisStagingNode](v2), "setBeginIrisMovieCaptureTime:", v60);
    }
LABEL_27:
    captureSession_updateInflightConfigurationWithIrisSinkPropertyForKey(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), *(const void **)(a1 + 56), *(void **)(a1 + 64));
    return;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 56), CFSTR("EndIrisMovieCaptureHostTime")))
  {
    if (dword_1ECFE9590)
    {
      LODWORD(time.value) = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (v2)
    {
      *(_QWORD *)type = 0;
      cs_getMasterClockAndType(*(void **)(*(_QWORD *)(a1 + 40) + 624), (uint64_t *)type, 0);
      memset(&v67, 0, sizeof(v67));
      CMTimeMakeFromDictionary(&v67, *(CFDictionaryRef *)(a1 + 64));
      memset(&v66, 0, sizeof(v66));
      v9 = CMClockGetHostTimeClock();
      time = v67;
      CMSyncConvertTime(&v66, &time, v9, *(CMClockOrTimebaseRef *)type);
      *(CMTime *)&v59[32] = v66;
      *(CMTime *)v59 = v66;
      objc_msgSend((id)-[FigCaptureMovieFileSinkPipeline irisStagingNode](v2), "setEndIrisMovieCaptureTime:", v59);
    }
    goto LABEL_27;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 56), CFSTR("PreservesLivePhotoCaptureSuspendedOnSessionStop")))
  {
    if (dword_1ECFE9590)
    {
      LODWORD(time.value) = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    goto LABEL_27;
  }
  if (!(v2 | v4))
  {
    v15 = *(const void **)(a1 + 56);
    if (v3)
    {
      if (CFEqual(v15, CFSTR("CaptureSessionVideoDataSinkProperty_KeypointDetectionThreshold")))
      {
        objc_msgSend(*(id *)(a1 + 64), "floatValue");
        -[FigCaptureVisionDataSinkPipeline setKeypointDetectionThreshold:](v3);
      }
      else if (CFEqual(*(CFTypeRef *)(a1 + 56), CFSTR("kFigCaptureSessionVisionDataSinkProperty_RuntimeUpdates")))
      {
        -[FigCaptureVisionDataSinkPipeline setRuntimeUpdates:](v3, *(_QWORD *)(a1 + 64));
      }
      return;
    }
    if (CFEqual(v15, CFSTR("CaptureSessionVideoConnection_VideoOrientation")))
    {
      v17 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 624), "movieFileSinkPipelineWithVideoConnectionID:", *(_QWORD *)(a1 + 48));
      if (-[FigCaptureMovieFileSinkPipeline videoOrientationMetadataNode](v17))
      {
        objc_msgSend((id)-[FigCaptureMovieFileSinkPipeline videoOrientationMetadataNode](v17), "updateVideoOrientation:", objc_msgSend(*(id *)(a1 + 64), "intValue"));
        return;
      }
    }
    else if (CFEqual(*(CFTypeRef *)(a1 + 56), CFSTR("CaptureSessionVideoConnection_VideoMirrored")))
    {
      v24 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 624), "movieFileSinkPipelineWithVideoConnectionID:", *(_QWORD *)(a1 + 48));
      if (-[FigCaptureMovieFileSinkPipeline videoOrientationMetadataNode](v24))
      {
        objc_msgSend((id)-[FigCaptureMovieFileSinkPipeline videoOrientationMetadataNode](v24), "updateVideoMirrored:", objc_msgSend(*(id *)(a1 + 64), "BOOLValue"));
        return;
      }
    }
    else if (CFEqual(*(CFTypeRef *)(a1 + 56), CFSTR("CaptureSessionMetadataSource_MetadataSampleBuffer")))
    {
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v32 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 624), "metadataSourcePipelines");
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v39, v63, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v40;
LABEL_57:
        v36 = 0;
        while (1)
        {
          if (*(_QWORD *)v40 != v35)
            objc_enumerationMutation(v32);
          v37 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v36);
          if (objc_msgSend((id)objc_msgSend(v37, "sourceID"), "isEqualToString:", *(_QWORD *)(a1 + 48)))
            break;
          if (v34 == ++v36)
          {
            v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v39, v63, 16);
            if (v34)
              goto LABEL_57;
            goto LABEL_67;
          }
        }
        -[FigCaptureMetadataSourcePipeline appendSampleBuffer:]((uint64_t)v37, *(_QWORD *)(a1 + 64));
        if (v37)
          return;
      }
      goto LABEL_67;
    }
    v30 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v31 = -12784;
    goto LABEL_65;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 56), CFSTR("CaptureSessionMovieFileSink_MovieLevelMetadata")))
  {
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v10 = (void *)-[FigCaptureMovieFileSinkPipeline movieFileSinkNodes](v2);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v56 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "setMovieLevelMetadata:", *(_QWORD *)(a1 + 64));
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
      }
      while (v12);
    }
    return;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 56), CFSTR("CaptureSessionMovieFileSink_BravoCameraSelectionConfigurationForRecording")))
  {
    v16 = *(void **)(a1 + 64);
    memset(&v67, 0, 20);
    objc_msgSend(v16, "getBytes:length:", &v67, 20);
    objc_msgSend((id)-[FigCaptureMovieFileSinkPipeline captureDevice](v2), "setBravoStreamSelectionConfigurationForRecording:", *(CMTimeValue *)((char *)&v67.value + 4), *(_QWORD *)&v67.flags);
    objc_msgSend((id)-[FigCaptureMovieFileSinkPipeline captureDevice](v2), "setBravoStreamSelectionConfigurationForRecordingEnabled:", LOBYTE(v67.value));
    return;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 56), CFSTR("IrisMovieProcessingSuspended")))
  {
    v18 = *(void **)(a1 + 64);
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v19 = (void *)-[FigCaptureMovieFileSinkPipeline movieFileSinkNodes](v2);
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v52;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v52 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * j), "setIrisMovieProcessingSuspended:", objc_msgSend(v18, "BOOLValue"));
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
      }
      while (v21);
    }
    return;
  }
  if (!CFEqual(*(CFTypeRef *)(a1 + 56), CFSTR("UserInitiatedCaptureRequestTime")))
  {
LABEL_67:
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigSignalErrorAt();
    return;
  }
  v25 = objc_msgSend((id)v4, "cameraSourcePipeline");
  if (!objc_msgSend((id)-[FigCaptureCameraSourcePipeline captureDevice](v25), "zeroShutterLagEnabled")
    || objc_msgSend((id)-[FigCaptureCameraSourcePipeline captureDevice](v25), "unifiedBracketingMode"))
  {
    return;
  }
  v26 = objc_msgSend(*(id *)(a1 + 64), "unsignedLongLongValue");
  v27 = (void *)objc_msgSend((id)v4, "previewSinkNode");
  if (!v27
    || (objc_msgSend(v27, "previewPTSDisplayedAtHostTime:allowingExtrapolation:", v26, 1),
        epoch = v67.epoch,
        v66.value = v67.value,
        flags = v67.flags,
        v66.timescale = v67.timescale,
        (v67.flags & 1) == 0))
  {
    v30 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v31 = -12780;
LABEL_65:
    *(_DWORD *)(v30 + 24) = v31;
    return;
  }
  v38 = -[FigCaptureStillImageSettings initWithSettingsID:]([FigCaptureStillImageSettings alloc], "initWithSettingsID:", 0);
  -[FigCaptureStillImageSettings setUserInitiatedRequestSettings:](v38, "setUserInitiatedRequestSettings:", 1);
  -[FigCaptureStillImageSettings setStillImageUserInitiatedRequestTime:](v38, "setStillImageUserInitiatedRequestTime:", v26);
  value = v66.value;
  timescale = v66.timescale;
  v49 = flags;
  v50 = epoch;
  -[FigCaptureStillImageSettings setStillImageUserInitiatedRequestPTS:](v38, "setStillImageUserInitiatedRequestPTS:", &value);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v4, "stillImageSinkPipeline"), "stillImageCoordinatorNode"), "initiateStillImageCaptureNowWithSettings:", v38);

  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend((id)v4, "setCurrentUserInitiatedRequestHostTime:", v26);
    v43 = v66.value;
    v44 = v66.timescale;
    v45 = flags;
    v46 = epoch;
    objc_msgSend((id)v4, "setCurrentUserInitiatedRequestPTS:", &v43);
  }
}

@end
