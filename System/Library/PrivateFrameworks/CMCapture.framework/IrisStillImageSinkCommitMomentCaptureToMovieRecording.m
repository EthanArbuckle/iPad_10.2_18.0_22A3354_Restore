@implementation IrisStillImageSinkCommitMomentCaptureToMovieRecording

void __captureSession_IrisStillImageSinkCommitMomentCaptureToMovieRecording_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  FigCaptureIrisStillImageSettings *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  FigCaptureIrisStillImageSettings *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v14;
  void *v15;
  const void *v16;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v3 = DerivedStorage;
  v4 = *(unsigned int *)(DerivedStorage + 312);
  if ((_DWORD)v4)
  {
    FigDebugAssert3();
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    v14 = fig_log_call_emit_and_clean_up_after_send_and_compose();
    v15 = (void *)MEMORY[0x1A858DD40](v14);
    if (*(_QWORD *)(a1 + 72))
      v16 = (const void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus(*(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "settingsID"), v4);
    else
      v16 = (const void *)cs_notificationPayloadWithErrorStatus(v4);
    captureSession_postNotificationWithPayload(*(const void **)(a1 + 48), CFSTR("DidBeginRecordingMomentCaptureMovie"), v16);
    objc_autoreleasePoolPop(v15);
  }
  else
  {
    v5 = (void *)objc_msgSend(*(id *)(DerivedStorage + 624), "stillImageSinkPipelineSessionStorageWithSinkID:", *(_QWORD *)(a1 + 32));
    v6 = -[FigCaptureStillImageSettings initWithSettingsID:]([FigCaptureIrisStillImageSettings alloc], "initWithSettingsID:", objc_msgSend(*(id *)(a1 + 40), "settingsID"));
    -[FigCaptureIrisStillImageSettings setMovieMode:](v6, "setMovieMode:", 2);
    -[FigCaptureIrisStillImageSettings setMovieRecordingSettings:](v6, "setMovieRecordingSettings:", *(_QWORD *)(a1 + 40));
    -[FigCaptureStillImageSettings setStillImageUserInitiatedRequestTime:](v6, "setStillImageUserInitiatedRequestTime:", *(_QWORD *)(a1 + 56));
    -[FigCaptureStillImageSettings setFlashMode:](v6, "setFlashMode:", *(unsigned int *)(a1 + 80));
    if (cs_touchDownMomentStillCaptureEnabled_onceToken != -1)
      dispatch_once(&cs_touchDownMomentStillCaptureEnabled_onceToken, &__block_literal_global_357);
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 64) + 320));
    v7 = -[FigCaptureStillImageSettings settingsID](v6, "settingsID");
    v8 = *(_QWORD *)(CMBaseObjectGetDerivedStorage() + 568);
    v9 = *(_QWORD *)(a1 + 64);
    if (v8 >= 1 && v8 == v7)
    {
      *(_QWORD *)(v9 + 568) = 0;

      v10 = v6;
      v11 = *(_QWORD *)(a1 + 64);
      *(_QWORD *)(v11 + 576) = v10;
      os_unfair_lock_unlock((os_unfair_lock_t)(v11 + 320));
      cs_IrisStillImageSinkPrepareMovieRecording(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), v6);
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "stillImageSinkPipeline"), "stillImageCoordinatorNode"), "cancelStillImageMomentCaptureWithSettingsID:", -[FigCaptureStillImageSettings settingsID](v6, "settingsID"));
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 320));
    }
    if (dword_1ECFE9590)
    {
      v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }

  }
  *(_DWORD *)(v3 + 312) = 0;
}

uint64_t __captureSession_IrisStillImageSinkCommitMomentCaptureToMovieRecording_block_invoke_704()
{
  uint64_t result;

  result = CMBaseObjectGetDerivedStorage();
  *(_DWORD *)(result + 312) = 0;
  return result;
}

@end
