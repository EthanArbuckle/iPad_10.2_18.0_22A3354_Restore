@implementation IrisStillImageSinkCancelMomentCapture

uint64_t __captureSession_IrisStillImageSinkCancelMomentCapture_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  const void *v15;
  double v16;
  uint64_t result;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v3 = (void *)objc_msgSend(*(id *)(DerivedStorage + 624), "stillImageSinkPipelineSessionStorageWithSinkID:", *(_QWORD *)(a1 + 32));
  v4 = (void *)-[FigCaptureCameraSourcePipeline captureDevice](objc_msgSend(v3, "cameraSourcePipeline"));
  if (*(_DWORD *)(DerivedStorage + 312))
    goto LABEL_12;
  if (cs_touchDownMomentStillCaptureEnabled_onceToken != -1)
    dispatch_once(&cs_touchDownMomentStillCaptureEnabled_onceToken, &__block_literal_global_357);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 320));
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(CMBaseObjectGetDerivedStorage() + 568);
  if (v6 >= 1 && v6 == v5)
  {
    v9 = *(_QWORD *)(a1 + 48);
    *(_QWORD *)(v9 + 568) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 320));
    v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "stillImageSinkPipeline"), "stillImageCoordinatorNode"), "cancelStillImageMomentCaptureWithSettingsID:", *(_QWORD *)(a1 + 56));
    if ((_DWORD)v12)
    {
      v10 = v12;
      FigDebugAssert3();
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      v12 = fig_log_call_emit_and_clean_up_after_send_and_compose();
      goto LABEL_14;
    }
  }
  else
  {
    v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 320));
  }
  if (*(_DWORD *)(DerivedStorage + 312))
  {
LABEL_12:
    v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    v12 = fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v10 = 0;
LABEL_14:
  v14 = (void *)MEMORY[0x1A858DD40](v12);
  if (*(_QWORD *)(a1 + 64))
    v15 = (const void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), v10);
  else
    v15 = (const void *)cs_notificationPayloadWithErrorStatus(v10);
  captureSession_postNotificationWithPayload(*(const void **)(a1 + 40), CFSTR("DidCancelMomentCapture"), v15);
  objc_autoreleasePoolPop(v14);
  objc_msgSend(v4, "setAutomaticallyAdjustsTorch:", 0);
  LODWORD(v16) = 0;
  result = objc_msgSend(v4, "setTorchLevel:", v16);
  *(_DWORD *)(DerivedStorage + 312) = 0;
  return result;
}

uint64_t __captureSession_IrisStillImageSinkCancelMomentCapture_block_invoke_706()
{
  uint64_t result;

  result = CMBaseObjectGetDerivedStorage();
  *(_DWORD *)(result + 312) = 0;
  return result;
}

@end
