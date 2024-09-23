@implementation IrisStillImageSinkCommitMomentCaptureToStillImageCapture

void __captureSession_IrisStillImageSinkCommitMomentCaptureToStillImageCapture_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  float v11;
  uint64_t v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  const void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  const void *v18;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v3 = DerivedStorage;
  v4 = *(unsigned int *)(*(_QWORD *)(a1 + 56) + 312);
  if ((_DWORD)v4)
    goto LABEL_17;
  v5 = (void *)objc_msgSend(*(id *)(DerivedStorage + 624), "stillImageSinkPipelineSessionStorageWithSinkID:", *(_QWORD *)(a1 + 32));
  v6 = objc_msgSend(v5, "cameraSourcePipeline");
  objc_msgSend((id)-[FigCaptureCameraSourcePipeline captureDevice](v6), "nonDestructiveCropSize");
  objc_msgSend(*(id *)(a1 + 40), "setNonDestructiveCropSize:");
  cs_updateSmartStyleSupport(*(_QWORD *)(a1 + 48), *(void **)(a1 + 40), (void *)objc_msgSend(*(id *)(a1 + 40), "movieRecordingSettings"));
  if (cs_touchDownMomentStillCaptureEnabled_onceToken != -1)
    dispatch_once(&cs_touchDownMomentStillCaptureEnabled_onceToken, &__block_literal_global_357);
  os_unfair_lock_lock((os_unfair_lock_t)(v3 + 320));
  v7 = objc_msgSend(*(id *)(a1 + 40), "settingsID");
  v8 = *(_QWORD *)(CMBaseObjectGetDerivedStorage() + 568);
  if (v8 < 1 || v8 != v7)
  {
LABEL_13:
    os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 320));
    goto LABEL_14;
  }
  *(_QWORD *)(v3 + 568) = 0;
  if (!v5)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (*(_QWORD *)(a1 + 64))
      v14 = (const void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus(*(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "settingsID"), 4294950896);
    else
      v14 = (const void *)cs_notificationPayloadWithErrorStatus(*(unsigned int *)(a1 + 72));
    captureSession_postNotificationWithPayload(*(const void **)(a1 + 48), CFSTR("IrisWillBeginCapture"), v14);
    goto LABEL_13;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 320));
  v9 = stillImageSinkPipelineSessionStorage_stillImageOutputDimensionsForSettings(v5, *(void **)(a1 + 40));
  captureSession_updateOutputDimensionsAndResolutionFlavor(v9, v6, *(void **)(a1 + 40));
  v10 = *(void **)(a1 + 40);
  objc_msgSend((id)-[FigCaptureCameraSourcePipeline captureDevice](v6), "zoomFactor");
  BWUpdateThumbnailAndPreviewDimensionsForRequestedSettings(v10, v11);
  v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "stillImageSinkPipeline"), "stillImageCoordinatorNode"), "commitStillImageMomentCaptureWithSettings:", *(_QWORD *)(a1 + 40));
  if (!(_DWORD)v12)
  {
    cs_IrisStillImageSinkPrepareMovieRecording(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
    goto LABEL_14;
  }
  v4 = v12;
LABEL_17:
  FigDebugAssert3();
  v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  v16 = fig_log_call_emit_and_clean_up_after_send_and_compose();
  v17 = (void *)MEMORY[0x1A858DD40](v16);
  if (*(_QWORD *)(a1 + 64))
    v18 = (const void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus(*(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "settingsID"), v4);
  else
    v18 = (const void *)cs_notificationPayloadWithErrorStatus(v4);
  captureSession_postNotificationWithPayload(*(const void **)(a1 + 48), CFSTR("IrisWillBeginCapture"), v18);
  objc_autoreleasePoolPop(v17);
LABEL_14:
  *(_DWORD *)(v3 + 312) = 0;
}

uint64_t __captureSession_IrisStillImageSinkCommitMomentCaptureToStillImageCapture_block_invoke_700()
{
  uint64_t result;

  result = CMBaseObjectGetDerivedStorage();
  *(_DWORD *)(result + 312) = 0;
  return result;
}

@end
